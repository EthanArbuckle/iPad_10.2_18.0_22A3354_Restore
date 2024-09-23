uint64_t autoloopSettingsDestroy(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 240);
    if (v1)
      MEMORY[0x1D82660DC](v1, 0x1000C40D4159EFELL);
    JUMPOUT(0x1D82660DCLL);
  }
  return result;
}

uint64_t sub_1D4C569E0@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, int a4@<W3>, CMTime *a5@<X8>)
{
  CMTime *v10;
  uint64_t result;
  CMTimeValue v12;
  CMTimeScale v13;
  CMTime v14;
  CMTime v15;
  CMTime v16;
  CMTime v17;
  CMTime time2;
  CMTime time1;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime v23;
  CMTime v24;

  v10 = (CMTime *)MEMORY[0x1E0CA2E68];
  *(_OWORD *)&a5->value = *MEMORY[0x1E0CA2E68];
  a5->epoch = v10->epoch;
  if (a2)
  {
    v23 = *v10;
    v22 = *(CMTime *)(a1 + 120);
    CMTimeMaximum(&v24, &v23, &v22);
    *a5 = v24;
    if (!a3)
    {
LABEL_3:
      if (!a4)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if (!a3)
  {
    goto LABEL_3;
  }
  v21 = *a5;
  v20 = *(CMTime *)(a1 + 248);
  CMTimeMaximum(&v24, &v21, &v20);
  *a5 = v24;
  if (a4)
  {
LABEL_4:
    time1 = *a5;
    time2 = *(CMTime *)(a1 + 320);
    CMTimeMaximum(&v24, &time1, &time2);
    *a5 = v24;
  }
LABEL_5:
  v17 = *a5;
  v16 = *v10;
  result = CMTimeCompare(&v17, &v16);
  if ((result & 0x80000000) != 0)
  {
    *(_OWORD *)&a5->value = *(_OWORD *)&v10->value;
    a5->epoch = v10->epoch;
    if (!a2)
      return result;
  }
  else if (!a2)
  {
    return result;
  }
  v12 = *(_QWORD *)(a1 + 120);
  v13 = *(_DWORD *)(a1 + 128);
  v15 = *a5;
  v14.value = v12;
  v14.timescale = v13;
  *(_QWORD *)&v14.flags = *(_QWORD *)(a1 + 132);
  HIDWORD(v14.epoch) = *(_DWORD *)(a1 + 140);
  result = CMTimeCompare(&v15, &v14);
  if ((_DWORD)result)
    return printf("WARNING: MIN REQUIRED INPUT LENGTH INCREASED BY BOUNCE AND/OR LONG EXPOSURE SETTINGS TO %lld/%d (AutoLoop requires %lld/%d)\n.", a5->value, a5->timescale, v12, v13);
  return result;
}

double create_default_internal_autoloopSettings()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  v0 = operator new();
  *(_QWORD *)(v0 + 28) = 0x40000000FFFFFFFFLL;
  *(_DWORD *)v0 = 2;
  v1 = MEMORY[0x1E0CA2E10];
  *(_OWORD *)(v0 + 4) = *MEMORY[0x1E0CA2E10];
  *(_QWORD *)(v0 + 20) = *(_QWORD *)(v1 + 16);
  result = NAN;
  *(_QWORD *)(v0 + 36) = -1;
  return result;
}

double sub_1D4C56C24(uint64_t a1, CMTime *a2)
{
  uint64_t v4;
  double result;
  CMTime v6;
  CMTime v7;
  CMTime v8;
  CMTime v9;
  CMTime rhs;
  CMTime lhs;
  CMTime v12;
  CMTime time2;
  CMTime time1;
  CMTime v15;

  *(_BYTE *)(a1 + 368) = 1;
  memset(&v15, 0, sizeof(v15));
  CMTimeMake(&time1, 80, 600);
  time2 = *a2;
  CMTimeMinimum(&v15, &time1, &time2);
  lhs = *a2;
  rhs = v15;
  CMTimeSubtract(&v12, &lhs, &rhs);
  *(CMTime *)(a1 + 120) = v12;
  v4 = MEMORY[0x1E0CA2E68];
  *(_OWORD *)(a1 + 168) = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(v4 + 16);
  *(_DWORD *)(a1 + 192) = 0;
  v9 = *a2;
  v8 = v15;
  CMTimeSubtract(&v12, &v9, &v8);
  *(CMTime *)(a1 + 248) = v12;
  *(_OWORD *)(a1 + 296) = *(_OWORD *)v4;
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(v4 + 16);
  v7 = *a2;
  v6 = v15;
  CMTimeSubtract(&v12, &v7, &v6);
  result = *(double *)&v12.value;
  *(CMTime *)(a1 + 320) = v12;
  return result;
}

uint64_t get_default_autoloopSettings_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  CMTime v8;

  v0 = operator new();
  *(_OWORD *)(v0 + 192) = 0u;
  *(_OWORD *)(v0 + 208) = 0u;
  *(_OWORD *)(v0 + 224) = 0u;
  *(_OWORD *)(v0 + 240) = 0u;
  *(_OWORD *)(v0 + 256) = 0u;
  *(_OWORD *)(v0 + 272) = 0u;
  *(_OWORD *)(v0 + 288) = 0u;
  *(_OWORD *)(v0 + 304) = 0u;
  *(_OWORD *)(v0 + 320) = 0u;
  *(_OWORD *)(v0 + 336) = 0u;
  *(_OWORD *)(v0 + 352) = 0u;
  *(_OWORD *)(v0 + 368) = 0u;
  *(_OWORD *)(v0 + 384) = 0u;
  v1 = operator new();
  *(_QWORD *)(v1 + 28) = 0x40000000FFFFFFFFLL;
  *(_DWORD *)v1 = 2;
  v2 = MEMORY[0x1E0CA2E10];
  v3 = *MEMORY[0x1E0CA2E10];
  *(_OWORD *)(v1 + 4) = *MEMORY[0x1E0CA2E10];
  v4 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v1 + 20) = v4;
  *(_QWORD *)(v1 + 36) = -1;
  *(_QWORD *)(v0 + 240) = v1;
  *(_BYTE *)(v0 + 368) = 0;
  *(_OWORD *)v0 = v3;
  *(_QWORD *)(v0 + 16) = v4;
  v5 = MEMORY[0x1E0CA2E40];
  v6 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *(_OWORD *)(v0 + 24) = *MEMORY[0x1E0CA2E40];
  *(_OWORD *)(v0 + 40) = v6;
  *(_OWORD *)(v0 + 56) = *(_OWORD *)(v5 + 32);
  sub_1D4C73214((uint64_t)&v8);
  *(CMTime *)(v0 + 72) = v8;
  sub_1D4C73230(&v8);
  *(CMTime *)(v0 + 96) = v8;
  sub_1D4C7323C(&v8);
  *(CMTime *)(v0 + 120) = v8;
  sub_1D4C73230(&v8);
  *(CMTime *)(v0 + 144) = v8;
  sub_1D4C7323C(&v8);
  *(CMTime *)(v0 + 168) = v8;
  *(float *)(v0 + 192) = sub_1D4C73248();
  sub_1D4C7323C(&v8);
  *(CMTime *)(v0 + 248) = v8;
  sub_1D4C73230(&v8);
  *(CMTime *)(v0 + 272) = v8;
  sub_1D4C7323C(&v8);
  *(CMTime *)(v0 + 296) = v8;
  *(_DWORD *)(v0 + 372) = 0;
  sub_1D4C7323C(&v8);
  *(CMTime *)(v0 + 320) = v8;
  sub_1D4C73230(&v8);
  *(CMTime *)(v0 + 344) = v8;
  *(_BYTE *)(v0 + 196) = 1;
  *(_DWORD *)(v0 + 200) = 0;
  *(_WORD *)(v0 + 204) = 1;
  *(_BYTE *)(v0 + 206) = 0;
  *(_QWORD *)(v0 + 208) = 0;
  *(_BYTE *)(v0 + 216) = 0;
  *(_QWORD *)(v0 + 224) = 0;
  *(_QWORD *)(v0 + 232) = 0;
  *(_QWORD *)(v0 + 376) = 0;
  *(_QWORD *)(v0 + 384) = 0;
  *(_QWORD *)(v0 + 400) = 0;
  *(_QWORD *)(v0 + 408) = 0;
  return v0;
}

uint64_t createAutoLoopSettingsForAsset(void *a1, _DWORD *a2)
{
  id v3;
  uint64_t default_autoloopSettings_0;
  int Duration;
  CMTime v7;
  CMTime time2;
  CMTime time1;
  CMTime v10;
  CMTime v11;

  v3 = a1;
  default_autoloopSettings_0 = get_default_autoloopSettings_0();
  if (v3)
  {
    v11 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
    Duration = validateInputVideoAndGetDuration(v3, (uint64_t)&v11);
    if (!Duration && (v11.flags & 0x1D) == 1)
    {
      memset(&v10, 0, sizeof(v10));
      sub_1D4C569E0(default_autoloopSettings_0, 1, 1, 1, &v10);
      time1 = v11;
      time2 = v10;
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        v7 = v11;
        sub_1D4C56C24(default_autoloopSettings_0, &v7);
      }
    }
  }
  else
  {
    Duration = 0;
  }
  if (a2)
    *a2 = Duration;

  return default_autoloopSettings_0;
}

void sub_1D4C57098(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t validateInputVideoAndGetDuration(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  CMTime *v6;
  Float64 Seconds;
  CMTime time;
  CMTime v10;
  CMTime v11;
  CMTime v12;
  CMTime v13;
  CMTime time2;
  CMTime time1;
  CMTime v16;
  CMTime v17;

  v3 = a1;
  v4 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  *(_OWORD *)a2 = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)(a2 + 16) = v4;
  v5 = sub_1D4C57300(v3, &v16);
  if (!(_DWORD)v5)
  {
    time1 = v16;
    v6 = (CMTime *)MEMORY[0x1E0CA2E68];
    time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
    if (CMTimeCompare(&time1, &time2) < 1)
    {
      v13 = v17;
      v12 = *v6;
      if (CMTimeCompare(&v13, &v12) <= 0)
      {
        NSLog(CFSTR("Input video duration zero.\n"));
      }
      else
      {
        v11 = v17;
        getMinimumSafeInputDuration_0(&v10);
        if (CMTimeCompare(&v11, &v10) > 0)
        {
          v5 = 0;
          *(CMTime *)a2 = v17;
          goto LABEL_10;
        }
        getMinimumSafeInputDuration_0(&time);
        Seconds = CMTimeGetSeconds(&time);
        NSLog(CFSTR("Input video duration less than minimum 'safe' input duration (%f).\n"), *(_QWORD *)&Seconds);
      }
      v5 = 7;
      goto LABEL_10;
    }
    NSLog(CFSTR("Video track does not start at time zero."));
    v5 = 5;
  }
LABEL_10:

  return v5;
}

void sub_1D4C57220(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t createBundleDefaultGatingClassifierURL()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.acg.AutoLoop"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("gatingClassifier"), CFSTR("plist"));
  v1 = objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1D4C57288(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t getGatingOptionFlagsForSuggestions()
{
  return 7;
}

uint64_t getGatingOptionFlagsForDiagnostics()
{
  return 23;
}

uint64_t autoloopSettingsSetGating(uint64_t result, uint64_t a2, uint64_t a3, char a4, int a5)
{
  uint64_t v5;

  if (result)
  {
    *(_QWORD *)(result + 224) = a3;
    *(_QWORD *)(result + 232) = a2;
    *(_BYTE *)(result + 216) = a4;
    v5 = 7;
    if (a5)
      v5 = 23;
    *(_QWORD *)(result + 208) = v5;
  }
  return result;
}

uint64_t autoloopSettingsSetRecipeProviderCallback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 392) = a2;
  return result;
}

uint64_t autoloopSettingsSetGatingFeaturesProviderCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 400) = a2;
  *(_QWORD *)(result + 408) = a3;
  return result;
}

uint64_t autoloopSettingsSetLongerBounce(uint64_t result, int a2)
{
  *(_DWORD *)(result + 372) = a2;
  return result;
}

uint64_t autoloopSettingsSetOptimizeForMemoryUse(uint64_t result, char a2)
{
  *(_BYTE *)(result + 206) = a2;
  return result;
}

uint64_t autoloopSettingsSetDisableStabilizationGPU(uint64_t result, char a2)
{
  *(_BYTE *)(result + 205) = a2;
  return result;
}

uint64_t sub_1D4C57300(void *a1, _OWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "count"))
    {
      objc_msgSend(v6, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "timeRange");
        v9 = 0;
        *a2 = v11;
        a2[1] = v12;
        a2[2] = v13;
      }
      else
      {
        NSLog(CFSTR("Missing input asset tracks.\n"));
        v9 = 5;
      }

    }
    else
    {
      NSLog(CFSTR("Missing input asset tracks.\n"));
      v9 = 5;
    }

  }
  else
  {
    NSLog(CFSTR("Missing input asset.\n"));
    v9 = 5;
  }

  return v9;
}

void sub_1D4C573F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C57424(_QWORD *a1, void *a2, uint64_t a3, int *a4, CMTime *a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  char v15;
  int v16;
  CMTime *v17;
  _OWORD *v18;
  _OWORD *v19;
  __int128 v21;
  __int128 v22;
  CMTime v23;
  CMTime v24;
  CMTime v25;
  CMTime v26;
  CMTime v27;
  CMTime v28;
  CMTime v29;
  CMTime v30;
  CMTime v31;
  CMTime v32;
  CMTimeRange v33;
  CMTimeRange v34;
  CMTime v35;
  CMTime v36;
  CMTimeRange v37;
  CMTimeRange v38;
  CMTimeRange v39;
  CMTimeRange v40;
  CMTime v41;
  CMTimeRange v42;
  CMTime v43;
  CMTime v44;
  CMTime v45;
  CMTime v46;
  CMTime duration;
  CMTime start;
  CMTimeRange otherRange;
  CMTimeRange v50;
  CMTimeRange v51;
  CMTime v52;
  CMTime v53;
  CMTime time;
  CMTimeRange range;
  CMTime v56;
  CMTime v57;
  CMTime v58;
  CMTime v59;
  CMTime v60;
  CMTime v61;
  CMTime time2;
  CMTime time1;
  CMTime v64;
  CMTimeRange v65;

  v9 = a2;
  v10 = v9;
  if (!a1)
    goto LABEL_46;
  v11 = sub_1D4C57300(v9, &v65);
  if ((_DWORD)v11)
    goto LABEL_47;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  if (a3)
  {
    v15 = 1;
    do
    {
      v16 = *a4++;
      switch(v16)
      {
        case 0:
          v14 = 1;
          break;
        case 1:
          v13 = 1;
          break;
        case 2:
          v12 = 1;
          break;
        case 3:
          break;
        default:
          v15 = 0;
          break;
      }
      --a3;
    }
    while (a3);
    if ((v15 & 1) == 0)
      goto LABEL_46;
  }
  sub_1D4C569E0((uint64_t)a1, v14 & 1, v13 & 1, v12 & 1, &v51.start);
  *(_OWORD *)&a5->value = *(_OWORD *)&v51.start.value;
  a5->epoch = v51.start.epoch;
  memset(&v64, 0, sizeof(v64));
  getMinimumSafeInputDuration_0(&v64);
  time1 = v65.duration;
  time2 = *a5;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    NSLog(CFSTR("Input video track (%lld/%d) shorter than minimum required input duration."), v65.duration.value, v65.duration.timescale);
LABEL_32:
    v11 = 7;
    goto LABEL_47;
  }
  v61 = v65.duration;
  v60 = v64;
  if (CMTimeCompare(&v61, &v60) < 0)
  {
    NSLog(CFSTR("Input video track (%lld/%d) shorter than minimum 'safe' input duration."), v65.duration.value, v65.duration.timescale);
    goto LABEL_32;
  }
  if (*((_BYTE *)a1 + 368))
    NSLog(CFSTR("Warning: using short-input-settings, expect suboptimal loop results (input duration = %lld/%d).\n"), v65.duration.value, v65.duration.timescale);
  v59 = *(CMTime *)((_BYTE *)a1 + 6);
  v17 = (CMTime *)MEMORY[0x1E0CA2E68];
  v58 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&v59, &v58) < 1)
    goto LABEL_46;
  v18 = a1 + 18;
  v57 = *(CMTime *)((_BYTE *)a1 + 6);
  v56 = *(CMTime *)((_BYTE *)a1 + 5);
  if (CMTimeCompare(&v57, &v56) < 0)
    goto LABEL_46;
  range = v65;
  time = *(CMTime *)((_BYTE *)a1 + 3);
  if (!CMTimeRangeContainsTime(&range, &time))
  {
    NSLog(CFSTR("Trim start (%lld/%d) outside of valid video track range."), a1[9], *((unsigned int *)a1 + 20));
LABEL_39:
    v11 = 12;
    goto LABEL_47;
  }
  v19 = a1 + 12;
  if ((*((_DWORD *)a1 + 27) & 0x1D) == 1)
  {
    *(_OWORD *)&v53.value = *v19;
    v53.epoch = a1[14];
    v52 = *v17;
    if (CMTimeCompare(&v53, &v52) <= 0)
    {
      NSLog(CFSTR("trim length zero is invalid."));
      goto LABEL_39;
    }
  }
  v50 = v65;
  memset(&v51, 0, sizeof(v51));
  start = *(CMTime *)((_BYTE *)a1 + 3);
  *(_OWORD *)&duration.value = *v19;
  duration.epoch = a1[14];
  CMTimeRangeMake(&otherRange, &start, &duration);
  CMTimeRangeGetIntersection(&v51, &v50, &otherRange);
  v46 = v51.duration;
  v44 = v64;
  v43 = *a5;
  CMTimeMaximum(&v45, &v44, &v43);
  if (CMTimeCompare(&v46, &v45) < 0)
  {
    NSLog(CFSTR("Trim length (%lld/%d) (after clip-to-end) shorter than minimum required, or safe, input duration."), v51.duration.value, v51.duration.timescale);
    goto LABEL_39;
  }
  if ((~*((_DWORD *)a1 + 3) & 0x11) != 0)
  {
    v42 = v51;
    v41 = *(CMTime *)a1;
    if (!CMTimeRangeContainsTime(&v42, &v41))
    {
      NSLog(CFSTR("Reference time (%lld/%d) outside of effective trim range (trim range intersect duration)."), *a1, *((unsigned int *)a1 + 2));
      goto LABEL_46;
    }
  }
  if ((*((_BYTE *)a1 + 36) & 1) != 0 && (*((_BYTE *)a1 + 60) & 1) != 0 && !a1[8] && (a1[6] & 0x8000000000000000) == 0)
  {
    v21 = *(_OWORD *)(a1 + 5);
    *(_OWORD *)&v40.start.value = *(_OWORD *)(a1 + 3);
    *(_OWORD *)&v40.start.epoch = v21;
    *(_OWORD *)&v40.duration.timescale = *(_OWORD *)(a1 + 7);
    if ((*((_DWORD *)a1 + 3) & 0x1D) == 1)
    {
      v22 = *(_OWORD *)(a1 + 5);
      *(_OWORD *)&v38.start.value = *(_OWORD *)(a1 + 3);
      *(_OWORD *)&v38.start.epoch = v22;
      *(_OWORD *)&v38.duration.timescale = *(_OWORD *)(a1 + 7);
      v36 = *(CMTime *)a1;
      v35 = *v17;
      CMTimeRangeMake(&v37, &v36, &v35);
      CMTimeRangeGetUnion(&v39, &v38, &v37);
      v40 = v39;
    }
    v34 = v51;
    v33 = v40;
    if (!CMTimeRangeContainsTimeRange(&v34, &v33))
    {
      NSLog(CFSTR("Required range outside of specified trim range."));
      goto LABEL_46;
    }
    v32 = v40.duration;
    *(_OWORD *)&v30.value = *v18;
    v30.epoch = a1[20];
    v29 = *(CMTime *)(a1 + 34);
    CMTimeMinimum(&v31, &v30, &v29);
    if (CMTimeCompare(&v32, &v31) >= 1)
    {
      NSLog(CFSTR("Effective required range (required and reference) is longer than max loop or bounce period."));
      goto LABEL_46;
    }
  }
  if ((v14 & 1) != 0)
  {
    v28 = *(CMTime *)((_BYTE *)a1 + 5);
    *(_OWORD *)&v27.value = *v18;
    v27.epoch = a1[20];
    if (CMTimeCompare(&v28, &v27) > 0)
    {
      NSLog(CFSTR("Invalid setting: min_loop_period > max_loop_period.\n"));
LABEL_46:
      v11 = 11;
      goto LABEL_47;
    }
  }
  if ((v13 & 1) != 0)
  {
    v26 = *(CMTime *)(a1 + 31);
    v25 = *(CMTime *)(a1 + 34);
    if (CMTimeCompare(&v26, &v25) > 0)
    {
      NSLog(CFSTR("Invalid setting: min_ping_period > max_ping_period.\n"));
      goto LABEL_46;
    }
  }
  if ((v12 & 1) != 0)
  {
    v24 = *(CMTime *)(a1 + 40);
    v23 = *(CMTime *)(a1 + 43);
    if (CMTimeCompare(&v24, &v23) >= 1)
    {
      NSLog(CFSTR("Invalid setting: min_longexposure_length > max_longexposure_length.\n"));
      goto LABEL_46;
    }
  }
  v11 = 0;
LABEL_47:

  return v11;
}

void sub_1D4C57A68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void autoloopSettingsSetPointOfInterestAndTrim(uint64_t a1, __int128 *a2, CMTime *a3, CMTime *a4, void *a5, int *a6)
{
  id v11;
  CMTime *v12;
  int Duration;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  int v20;
  CMTime v21;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  CMTime v25;
  CMTime v26;
  CMTime rhs;
  CMTime lhs;
  CMTime v29;
  CMTime v30;
  CMTime v31;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  CMTime v35;
  CMTime v36;
  CMTime v37;
  CMTime v38;
  CMTime v39;
  CMTime v40;
  CMTime v41;
  CMTime time2;
  CMTime time1;

  v11 = a5;
  *a6 = 0;
  if ((a3->flags & 0x1D) != 1)
    goto LABEL_16;
  time1 = *a3;
  v12 = (CMTime *)MEMORY[0x1E0CA2E68];
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2) < 0)
    goto LABEL_16;
  if ((a4->flags & 0x1D) != 1)
    goto LABEL_16;
  v41 = *a4;
  v40 = *v12;
  if (CMTimeCompare(&v41, &v40) <= 0)
    goto LABEL_16;
  v39 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
  if (v11)
    Duration = validateInputVideoAndGetDuration(v11, (uint64_t)&v39);
  else
    Duration = 5;
  *a6 = Duration;
  memset(&v38, 0, sizeof(v38));
  sub_1D4C569E0(a1, 1, 1, 1, &v38);
  if (*a6)
    goto LABEL_18;
  v37 = v39;
  v36 = v38;
  if (CMTimeCompare(&v37, &v36) < 0)
  {
    v20 = 7;
    goto LABEL_17;
  }
  if (*a6)
    goto LABEL_18;
  v14 = *(_OWORD *)&a3->value;
  *(_QWORD *)(a1 + 88) = a3->epoch;
  *(_OWORD *)(a1 + 72) = v14;
  v15 = *(_OWORD *)&a4->value;
  *(_QWORD *)(a1 + 112) = a4->epoch;
  *(_OWORD *)(a1 + 96) = v15;
  v16 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v16;
  memset(&v35, 0, sizeof(v35));
  v34 = v39;
  v17 = *(_OWORD *)&a4->value;
  v32.epoch = a4->epoch;
  *(_OWORD *)&v32.value = v17;
  v18 = *(_OWORD *)&v12->value;
  v30.epoch = v12->epoch;
  *(_OWORD *)&v30.value = v18;
  lhs = v39;
  v19 = *(_OWORD *)&a3->value;
  rhs.epoch = a3->epoch;
  *(_OWORD *)&rhs.value = v19;
  CMTimeSubtract(&v29, &lhs, &rhs);
  CMTimeMaximum(&v31, &v30, &v29);
  CMTimeMinimum(&v33, &v32, &v31);
  CMTimeMinimum(&v35, &v34, &v33);
  v26 = v35;
  getMinimumSafeInputDuration_0(&v25);
  if (CMTimeCompare(&v26, &v25) < 0)
  {
LABEL_16:
    v20 = 12;
LABEL_17:
    *a6 = v20;
    goto LABEL_18;
  }
  if ((v35.flags & 0x1D) == 1)
  {
    v24 = v35;
    v23 = v38;
    if (CMTimeCompare(&v24, &v23) < 0)
    {
      v22 = v35;
      sub_1D4C56C24(a1, &v22);
    }
  }
  *a6 = sub_1D4C57424((_QWORD *)a1, v11, 0, 0, &v21);
LABEL_18:

}

void sub_1D4C57DB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_1D4C57DD0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  const __CFAllocator *v5;
  CFDictionaryRef v6;
  __int128 v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  CFDictionaryRef v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  CMTimeEpoch v17;
  CFDictionaryRef v18;
  void *v19;
  void *v20;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  CMTime v25;
  CMTimeRange range;
  CMTime time;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(unsigned int *)(a1 + 208));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, qword_1EFEC7D80);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 216));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, qword_1EFEC7D88);

  time = *(CMTime *)a1;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, qword_1EFEC7D90);

  v7 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&range.start.value = *(_OWORD *)(a1 + 24);
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 56);
  v8 = CMTimeRangeCopyAsDictionary(&range, v5);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, qword_1EFEC7D98);

  v25 = *(CMTime *)(a1 + 72);
  v9 = CMTimeCopyAsDictionary(&v25, v5);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, qword_1EFEC7DA0);

  v24 = *(CMTime *)(a1 + 96);
  v10 = CMTimeCopyAsDictionary(&v24, v5);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, qword_1EFEC7DA8);

  v23 = *(CMTime *)(a1 + 168);
  v11 = CMTimeCopyAsDictionary(&v23, v5);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, qword_1EFEC7DB0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 196));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, qword_1EFEC7DB8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 200));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, qword_1EFEC7DC0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 204));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, qword_1EFEC7DC8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", **(unsigned int **)(a1 + 240));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, qword_1EFEC7DD0);

  v16 = *(_QWORD *)(a1 + 240);
  v17 = *(_QWORD *)(v16 + 20);
  *(_OWORD *)&v22.value = *(_OWORD *)(v16 + 4);
  v22.epoch = v17;
  v18 = CMTimeCopyAsDictionary(&v22, v5);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v18, qword_1EFEC7DD8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(int *)(*(_QWORD *)(a1 + 240) + 36));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v19, qword_1EFEC7DE0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 240) + 40));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v20, qword_1EFEC7DE8);

  return v2;
}

void sub_1D4C580F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id alInterpolateMetadataForGap(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, _QWORD *a6)
{
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFDictionary *v24;
  _OWORD *v25;
  __int128 v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  __int128 v32;
  char *v33;
  char *v34;
  char *v35;
  __int128 v36;
  _QWORD *v37;
  CMTime *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  unint64_t j;
  void *v52;
  double v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  CMTime *v71;
  CMTime *v72;
  id v73;
  CMTime *v74;
  CMTime *v75;
  id v76;
  id v77;
  void *v78;
  id obj;
  id v80;
  id v81;
  void *v82;
  void *v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  CMTime v90;
  CMTime v91;
  CMTime v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  void *__p;
  _QWORD *v98;
  char *v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  void *v109;
  _BYTE v110[128];
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  void *v116;
  _BYTE v117[128];
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  CMTime v122;
  uint64_t v123;

  v123 = *MEMORY[0x1E0C80C00];
  v81 = a3;
  v80 = a4;
  v77 = a5;
  v75 = (CMTime *)a1;
  if ((*(_BYTE *)(a1 + 12) & 1) == 0)
  {
    if (a6)
    {
      v120 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Start frame time not valid"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
      obj = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AutoLoopsErrorDomain"), 5, obj);
      v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v76 = 0;
      *a6 = v12;
LABEL_86:

      goto LABEL_87;
    }
    goto LABEL_8;
  }
  v74 = (CMTime *)a2;
  if ((*(_BYTE *)(a2 + 12) & 1) != 0)
  {
    if (qword_1ED9A5830 != -1)
      dispatch_once(&qword_1ED9A5830, &unk_1E9863DD0);
    v73 = (id)qword_1ED9A5828;
    v78 = (void *)objc_opt_new();
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    obj = v73;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v117, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v101;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v101 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * i);
          objc_msgSend(v81, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v80, "objectForKey:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18 != 0 && v19 != 0)
          {
            objc_msgSend(v78, "addObject:", v17);
          }
          else if ((v18 != 0) != (v19 != 0))
          {
            if (a6)
            {
              v115 = *MEMORY[0x1E0CB2938];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Metadata key not found in both start and end data: %@"), v17);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              v116 = v62;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
              v63 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AutoLoopsErrorDomain"), 5, v63);
              *a6 = (id)objc_claimAutoreleasedReturnValue();

            }
            goto LABEL_84;
          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v117, 16);
        if (v14)
          continue;
        break;
      }
    }

    if (objc_msgSend(v78, "count"))
    {
      if (objc_msgSend(v77, "count"))
      {
        __p = 0;
        v98 = 0;
        v99 = 0;
        v93 = 0u;
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        v20 = v77;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
        if (!v21)
          goto LABEL_48;
        v22 = *(_QWORD *)v94;
LABEL_25:
        v23 = 0;
        while (1)
        {
          if (*(_QWORD *)v94 != v22)
            objc_enumerationMutation(v20);
          v24 = *(const __CFDictionary **)(*((_QWORD *)&v93 + 1) + 8 * v23);
          memset(&v122, 0, sizeof(v122));
          CMTimeMakeFromDictionary(&v122, v24);
          if ((v122.flags & 1) == 0)
            break;
          v25 = v98;
          if (v98 >= (_QWORD *)v99)
          {
            v27 = 0xAAAAAAAAAAAAAAABLL * (((char *)v98 - (_BYTE *)__p) >> 3);
            v28 = v27 + 1;
            if (v27 + 1 > 0xAAAAAAAAAAAAAAALL)
              sub_1D4C590D0();
            if (0x5555555555555556 * ((v99 - (_BYTE *)__p) >> 3) > v28)
              v28 = 0x5555555555555556 * ((v99 - (_BYTE *)__p) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * ((v99 - (_BYTE *)__p) >> 3) >= 0x555555555555555)
              v29 = 0xAAAAAAAAAAAAAAALL;
            else
              v29 = v28;
            if (v29)
              v30 = (char *)sub_1D4C59158((uint64_t)&v99, v29);
            else
              v30 = 0;
            v31 = &v30[24 * v27];
            v32 = *(_OWORD *)&v122.value;
            *((_QWORD *)v31 + 2) = v122.epoch;
            *(_OWORD *)v31 = v32;
            v34 = (char *)__p;
            v33 = (char *)v98;
            v35 = v31;
            if (v98 != __p)
            {
              do
              {
                v36 = *(_OWORD *)(v33 - 24);
                *((_QWORD *)v35 - 1) = *((_QWORD *)v33 - 1);
                *(_OWORD *)(v35 - 24) = v36;
                v35 -= 24;
                v33 -= 24;
              }
              while (v33 != v34);
              v33 = (char *)__p;
            }
            v37 = v31 + 24;
            __p = v35;
            v98 = v31 + 24;
            v99 = &v30[24 * v29];
            if (v33)
              operator delete(v33);
            v98 = v37;
          }
          else
          {
            v26 = *(_OWORD *)&v122.value;
            v98[2] = v122.epoch;
            *v25 = v26;
            v98 = (_QWORD *)v25 + 3;
          }
          if (++v23 == v21)
          {
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
            if (!v21)
            {
LABEL_48:

              v76 = (id)objc_opt_new();
              v38 = (CMTime *)__p;
              v71 = (CMTime *)v98;
              if (__p == v98)
                goto LABEL_93;
              while (2)
              {
                v92 = *v75;
                v91 = *v74;
                v90 = *v38;
                v72 = v38;
                v39 = v78;
                v85 = v81;
                v86 = v80;
                v87 = (void *)objc_opt_new();
                v106 = 0u;
                v107 = 0u;
                v104 = 0u;
                v105 = 0u;
                v84 = v39;
                v40 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v104, &v122, 16);
                if (!v40)
                  goto LABEL_79;
                v88 = *(_QWORD *)v105;
LABEL_51:
                v89 = v40;
                v41 = 0;
LABEL_52:
                if (*(_QWORD *)v105 != v88)
                  objc_enumerationMutation(v84);
                v42 = *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * v41);
                if ((objc_msgSend(CFSTR("privECMVct"), "isEqualToString:", v42) & 1) != 0
                  || objc_msgSend(CFSTR("privEMBVct"), "isEqualToString:", v42))
                {
                  objc_msgSend(v85, "objectForKeyedSubscript:", v42);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v86, "objectForKeyedSubscript:", v42);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  sub_1D4C58F84(&v92, &v91, &v90);
                  v46 = v45;
                  v47 = v43;
                  v48 = v44;
                  v49 = objc_msgSend(v47, "count");
                  if (v49 == objc_msgSend(v48, "count"))
                  {
                    v50 = (void *)objc_opt_new();
                    for (j = 0; objc_msgSend(v47, "count") > j; ++j)
                    {
                      objc_msgSend(v47, "objectAtIndexedSubscript:", j);
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v52, "doubleValue");
                      v54 = v53;

                      objc_msgSend(v48, "objectAtIndexedSubscript:", j);
                      v55 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v55, "doubleValue");
                      v57 = v56;

                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v54 + v46 * (v57 - v54));
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "addObject:", v58);

                    }
                  }
                  else
                  {
                    v50 = 0;
                  }

                  objc_msgSend(v87, "setObject:forKeyedSubscript:", v50, v42);
                  goto LABEL_74;
                }
                if ((objc_msgSend(CFSTR("privET"), "isEqualToString:", v42) & 1) != 0
                  || (objc_msgSend(CFSTR("privTZF"), "isEqualToString:", v42) & 1) != 0
                  || (objc_msgSend(CFSTR("privImgG"), "isEqualToString:", v42) & 1) != 0
                  || (objc_msgSend(CFSTR("privAFS"), "isEqualToString:", v42) & 1) != 0
                  || (objc_msgSend(CFSTR("privAFSt"), "isEqualToString:", v42) & 1) != 0
                  || objc_msgSend(CFSTR("privFM"), "isEqualToString:", v42))
                {
                  sub_1D4C58F84(&v92, &v91, &v90);
                  v60 = v59;
                  if (v59 >= 0.5)
                  {
                    objc_msgSend(v86, "objectForKeyedSubscript:", v42);
                    v61 = objc_claimAutoreleasedReturnValue();
                    v82 = (void *)v61;
                  }
                  else
                  {
                    objc_msgSend(v85, "objectForKeyedSubscript:", v42);
                    v61 = objc_claimAutoreleasedReturnValue();
                    v83 = (void *)v61;
                  }
                  objc_msgSend(v87, "setObject:forKeyedSubscript:", v61, v42);
                  if (v60 >= 0.5)
                    v47 = v82;
                  else
                    v47 = v83;
LABEL_74:

                }
                else
                {
                  NSLog(CFSTR("_GetGapFillDataForKeys called with unsupported key %@"), v42);
                }
                if (++v41 == v89)
                {
                  v40 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v104, &v122, 16);
                  if (!v40)
                  {
LABEL_79:

                    objc_msgSend(v76, "addObject:", v87);
                    v38 = v72 + 1;
                    if (&v72[1] == v71)
                      goto LABEL_93;
                    continue;
                  }
                  goto LABEL_51;
                }
                goto LABEL_52;
              }
            }
            goto LABEL_25;
          }
        }
        if (a6)
        {
          v108 = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fill time CMTime dict at index %zu is invalid"), 0xAAAAAAAAAAAAAAABLL * (((char *)v98 - (_BYTE *)__p) >> 3));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = v67;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AutoLoopsErrorDomain"), 5, v68);
          *a6 = (id)objc_claimAutoreleasedReturnValue();

        }
        v76 = 0;
LABEL_93:
        if (__p)
        {
          v98 = __p;
          operator delete(__p);
        }
        goto LABEL_85;
      }
      if (a6)
      {
        v111 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No fill times provided to interpolate"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = v69;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AutoLoopsErrorDomain"), 5, v70);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else if (a6)
    {
      v113 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No keys available to interpolate"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = v65;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AutoLoopsErrorDomain"), 5, v66);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_84:
    v76 = 0;
LABEL_85:

    goto LABEL_86;
  }
  if (a6)
  {
    v118 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("End frame time not valid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
    obj = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("AutoLoopsErrorDomain"), 5, obj);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  v76 = 0;
LABEL_87:

  return v76;
}

void sub_1D4C58C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, uint64_t a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,void *__p,uint64_t a53)
{
  void *v53;

  _Unwind_Resume(a1);
}

void sub_1D4C58EC8()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[9];

  v2[8] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("privECMVct");
  v2[1] = CFSTR("privEMBVct");
  v2[2] = CFSTR("privET");
  v2[3] = CFSTR("privTZF");
  v2[4] = CFSTR("privImgG");
  v2[5] = CFSTR("privAFS");
  v2[6] = CFSTR("privAFSt");
  v2[7] = CFSTR("privFM");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED9A5828;
  qword_1ED9A5828 = v0;

}

void sub_1D4C58F84(CMTime *a1, CMTime *a2, CMTime *a3)
{
  CMTime *v5;
  CMTime v6;
  CMTime time;
  CMTime v8;
  CMTime v9;
  CMTime v10;
  CMTime v11;
  CMTime v12;
  CMTime time2;
  CMTime time1;
  CMTime rhs;
  CMTime lhs;
  CMTime v17;

  lhs = *a3;
  rhs = *a1;
  CMTimeSubtract(&v17, &lhs, &rhs);
  time1 = v17;
  v5 = (CMTime *)MEMORY[0x1E0CA2E68];
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2))
  {
    v11 = *a2;
    v10 = *a1;
    CMTimeSubtract(&v12, &v11, &v10);
    v9 = v12;
    v8 = *v5;
    if (CMTimeCompare(&v9, &v8))
    {
      time = v17;
      CMTimeGetSeconds(&time);
      v6 = v12;
      CMTimeGetSeconds(&v6);
    }
  }
}

void sub_1D4C590D0()
{
  sub_1D4C590E4("vector");
}

void sub_1D4C590E4(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1D4C59134(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E98631E8, MEMORY[0x1E0DE42D0]);
}

void sub_1D4C59120(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1D4C59134(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void *sub_1D4C59158(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_1D4C5919C();
  return operator new(24 * a2);
}

void sub_1D4C5919C()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void sub_1D4C59358(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4C593B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)AutoLoopStabilizer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1D4C593E4(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1D4C5960C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4C596A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4C598A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4C59A64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1D4C5A8E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33)
{
  void *v33;
  void *v34;

  _Unwind_Resume(a1);
}

void sub_1D4C5AFD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  void *v27;
  void *v28;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1D4C5B0B0(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      sub_1D4C590D0();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 24;
    v6 = (char *)sub_1D4C59158(v3, a2);
    v7 = &v6[24 * v5];
    v9 = &v6[24 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v13;
        v12 -= 24;
        v10 -= 24;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void *sub_1D4C5B64C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    sub_1D4C5919C();
  return operator new(48 * a2);
}

uint64_t runLiveAnalysisPipeline(__int128 *a1, void *a2, void *a3, unint64_t a4, int *a5, uint64_t **a6, void *a7)
{
  return sub_1D4C5B69C(a1, a2, a3, a4, a5, a6, 0, a7);
}

uint64_t sub_1D4C5B69C(__int128 *a1, void *a2, void *a3, unint64_t a4, int *a5, uint64_t **a6, _QWORD *a7, void *a8)
{
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  CMTime *v17;
  int Duration;
  BOOL v19;
  int v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t *v31;
  void *v32;
  void *v33;
  void *v34;
  char *v35;
  void *v36;
  int64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  _QWORD *v45;
  unint64_t v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  uint64_t (**v52)(_QWORD, float);
  int v53;
  unint64_t v54;
  unint64_t v55;
  int v56;
  float v57;
  void *v58;
  int v59;
  _OWORD *v60;
  __int128 *v61;
  id v62;
  uint64_t (**v63)(float);
  PregateFeatureBuilder *v64;
  _QWORD *v65;
  unint64_t v66;
  unsigned int v67;
  _QWORD *v68;
  ExifMetadataExtractor *v69;
  uint64_t v70;
  _BOOL4 v71;
  unint64_t v72;
  BOOL v73;
  unsigned int v74;
  _DWORD *v75;
  FilteredMetadataExtractor *v76;
  uint64_t v77;
  int v78;
  _QWORD *v79;
  unint64_t v80;
  unsigned int v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  unint64_t v85;
  unsigned int v86;
  uint64_t *v87;
  void *v88;
  unint64_t v89;
  unint64_t v90;
  int v91;
  float v92;
  int v93;
  void *v94;
  int v95;
  id *v96;
  id v97;
  id v98;
  id v99;
  _QWORD *v100;
  unint64_t v101;
  unsigned int v102;
  int v103;
  uint64_t v104;
  char v105;
  _QWORD *v106;
  __int128 *v107;
  _QWORD *v108;
  unint64_t v109;
  unsigned int v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  int v115;
  _BOOL4 v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  int v120;
  uint64_t *v121;
  __int128 *v122;
  uint64_t v123;
  void (*v124)(_QWORD, _QWORD, uint64_t, uint64_t *);
  __int128 *v125;
  void (*v126)(_QWORD, _QWORD, uint64_t, _QWORD);
  void (*v127)(_QWORD, _QWORD, uint64_t, _QWORD);
  unint64_t v128;
  unint64_t v129;
  int v130;
  float v131;
  unsigned int v132;
  void *v133;
  _QWORD *v134;
  unint64_t v135;
  unsigned int v136;
  uint64_t v137;
  _DWORD *v138;
  uint64_t *v139;
  char v140;
  _BOOL4 v141;
  _QWORD **v142;
  unint64_t v143;
  unsigned int v144;
  unint64_t v145;
  unsigned int v146;
  _QWORD *v147;
  unint64_t v148;
  unsigned int v149;
  id v150;
  _QWORD *v151;
  unint64_t v152;
  unsigned int v153;
  uint64_t v154;
  _DWORD *v155;
  unsigned int v156;
  uint64_t v157;
  uint64_t *v158;
  void *v159;
  void *v160;
  void *v161;
  __CFString *v162;
  void *v163;
  void *v164;
  void (*v165)(_QWORD, id);
  uint64_t *v166;
  void *v167;
  void *v168;
  void *v169;
  __int128 *v170;
  void (*v171)(_QWORD, _QWORD, uint64_t, _QWORD);
  void (*v172)(_QWORD, _QWORD, uint64_t, _QWORD);
  void (*v173)(_QWORD, _QWORD);
  uint64_t v174;
  _QWORD *v175;
  unint64_t v176;
  unsigned int v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  NSObject *v181;
  NSObject *v182;
  uint64_t v184;
  void *v185;
  id v186;
  void *v187;
  int v188;
  uint64_t v189;
  _QWORD *v190;
  int v191;
  unint64_t v192;
  _BOOL4 v193;
  id v195;
  _OWORD *v196;
  id v197;
  unsigned int (**v198)(_QWORD, float);
  unsigned int v199;
  id v200;
  id v201;
  os_signpost_id_t v202;
  uint64_t *v203;
  _QWORD v204[4];
  unsigned int (**v205)(_QWORD, float);
  float v206;
  int v207;
  id v208;
  id v209;
  CMTime v210;
  CMTime v211;
  __int128 v212;
  uint64_t v213;
  CMTime v214;
  uint8_t buf[16];
  __int128 v216;
  __int128 v217;
  unsigned __int8 v218;
  _QWORD v219[4];
  uint64_t (**v220)(_QWORD, float);
  float v221;
  int v222;
  int v223;
  CMTime v224;
  _QWORD v225[4];
  unsigned int (**v226)(_QWORD, float);
  float v227;
  int v228;
  CMTime time2;
  CMTime rhs;
  CMTime lhs;
  CMTime time1;
  CMTime v233;
  CMTime v234;
  CMTime v235;
  __int128 v236;
  uint64_t v237;
  CMTime v238;
  void *v239;
  void *__p;
  unint64_t v241;
  CMTime v242;
  CMTime v243;
  __int128 *ptr;
  _BYTE v245[56];
  void *v246;
  void *v247;
  uint64_t v248;
  CMTime v249;

  ptr = a1;
  v197 = a2;
  v195 = a3;
  v198 = a8;
  sub_1D4C822C8(1);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_make_with_pointer(v13, &ptr);

  sub_1D4C822C8(1);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v192 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4C55000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "ALRunLiveAnalysisPipeline", (const char *)&unk_1D4CA00BD, buf, 2u);
  }

  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  v190 = a7;
  v17 = (CMTime *)MEMORY[0x1E0CA2E10];
  v243 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
  Duration = validateInputVideoAndGetDuration(v195, (uint64_t)&v243);
  if (Duration)
    v19 = 0;
  else
    v19 = v197 == 0;
  if (v19)
    v20 = 28;
  else
    v20 = Duration;
  v242 = *v17;
  v199 = v20;
  if (v20 || (v199 = sub_1D4C57424(ptr, v195, a4, a5, &v242)) != 0)
  {
    v21 = 0;
    v203 = 0;
  }
  else
  {
    v203 = (uint64_t *)operator new();
    sub_1D4C6CEF4(v203, a4, a5);
    v199 = 0;
    v21 = 1;
  }
  v196 = operator new(0x10uLL);
  *v196 = xmmword_1D4C953C0;
  __p = 0;
  v239 = 0;
  v241 = 0;
  v202 = v14;
  if (v21)
  {
    v188 = v21;
    v22 = *((id *)ptr + 29);
    if (v22)
    {
      v186 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("SharedClassifiers"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
      {
        v25 = 0;
        v26 = 0;
        do
        {
          v27 = a5[v25];
          v28 = (_QWORD *)operator new();
          sub_1D4C64AF4((uint64_t)v28);
          *v28 = *((_QWORD *)ptr + 26);
          if (sub_1D4C6CEA8((uint64_t)v203, v27))
          {
            v29 = operator new();
            sub_1D4C78CE8(v29, v27);
            sub_1D4C6D0BC((uint64_t)v203, v27, v29);
          }
          v30 = (_QWORD *)operator new();
          v31 = sub_1D4C6D134((uint64_t)v203, v27);
          sub_1D4C79FA4(v30, (uint64_t)v31, (uint64_t)v28);
          sub_1D4C6D350(v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringByAppendingString:", CFSTR("Classifiers"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "objectForKeyedSubscript:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1D4C7A018((uint64_t)v30, v24, v34);
          sub_1D4C7A3BC((uint64_t)v30);
          v35 = (char *)__p;
          if ((unint64_t)__p >= v241)
          {
            v37 = ((_BYTE *)__p - (_BYTE *)v239) >> 3;
            if ((unint64_t)(v37 + 1) >> 61)
              sub_1D4C590D0();
            v38 = (uint64_t)(v241 - (_QWORD)v239) >> 2;
            if (v38 <= v37 + 1)
              v38 = v37 + 1;
            if (v241 - (unint64_t)v239 >= 0x7FFFFFFFFFFFFFF8)
              v39 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v39 = v38;
            if (v39)
              v40 = (char *)sub_1D4C60BD8((uint64_t)&v241, v39);
            else
              v40 = 0;
            v41 = &v40[8 * v37];
            *(_QWORD *)v41 = v30;
            v36 = v41 + 8;
            v42 = (char *)__p;
            v43 = (char *)v239;
            if (__p != v239)
            {
              do
              {
                v44 = *((_QWORD *)v42 - 1);
                v42 -= 8;
                *((_QWORD *)v41 - 1) = v44;
                v41 -= 8;
              }
              while (v42 != v43);
              v42 = (char *)v239;
            }
            v239 = v41;
            __p = v36;
            v241 = (unint64_t)&v40[8 * v39];
            if (v42)
              operator delete(v42);
          }
          else
          {
            *(_QWORD *)__p = v30;
            v36 = v35 + 8;
          }
          __p = v36;

          v25 = ++v26;
        }
        while (v26 < a4);
      }

      v14 = v202;
      v17 = (CMTime *)MEMORY[0x1E0CA2E10];
      v22 = v186;
    }
    v45 = v239;
    if (__p != v239)
    {
      v46 = 0;
      v47 = 1;
      do
      {
        v48 = v45[v46];
        v238 = v243;
        sub_1D4C7A26C(v48, &v238);
        v46 = v47;
        v45 = v239;
        ++v47;
      }
      while (v46 < ((_BYTE *)__p - (_BYTE *)v239) >> 3);
    }
    if (sub_1D4C6D134((uint64_t)v203, 0))
      sub_1D4C6D134((uint64_t)v203, 0);

    v21 = v188;
  }
  v49 = *((_QWORD *)ptr + 2);
  v236 = *ptr;
  v237 = v49;
  v235 = *(CMTime *)((_BYTE *)ptr + 3);
  v234 = *(CMTime *)((_BYTE *)ptr + 4);
  memset(&v233, 0, sizeof(v233));
  v50 = *(__int128 *)((char *)ptr + 120);
  lhs.epoch = *((_QWORD *)ptr + 17);
  *(_OWORD *)&lhs.value = v50;
  v51 = *(__int128 *)((char *)ptr + 168);
  rhs.epoch = *((_QWORD *)ptr + 23);
  *(_OWORD *)&rhs.value = v51;
  v52 = (uint64_t (**)(_QWORD, float))v198;
  CMTimeAdd(&time1, &lhs, &rhs);
  v53 = v199;
  time2 = v242;
  CMTimeMaximum(&v233, &time1, &time2);
  if (v21)
  {
    v54 = 0;
    do
      v55 = v54++;
    while (v55 <= 3 && *((_DWORD *)v196 + v55));
    v56 = v54 - 1;
    if (v55 >= 4)
      v57 = 0.0;
    else
      v57 = (float)v56 * 0.25;
    if (!v198[2](v198, v57 + 0.0))
      v53 = 1;
    v225[0] = MEMORY[0x1E0C809B0];
    v225[1] = 3221225472;
    v225[2] = sub_1D4C5CEEC;
    v225[3] = &unk_1E9863EB8;
    v226 = v198;
    v227 = v57;
    v228 = 1048576000;
    v58 = (void *)MEMORY[0x1D826643C](v225);
    if (v53)
    {
      v199 = v53;
    }
    else
    {
      v61 = ptr;
      v224 = v233;
      v62 = v195;
      v63 = v58;
      v59 = v63[2](0.0);
      if ((v59 & 1) != 0)
      {
        v64 = objc_alloc_init(PregateFeatureBuilder);
        v65 = __p;
        if (__p == v239)
        {
          v68 = __p;
        }
        else
        {
          v66 = 0;
          v67 = 1;
          v65 = v239;
          do
          {
            objc_storeStrong((id *)(*(_QWORD *)(v65[v66] + 24) + 88), v64);
            v66 = v67;
            v68 = __p;
            v65 = v239;
            ++v67;
          }
          while (v66 < ((_BYTE *)__p - (_BYTE *)v239) >> 3);
        }
        if ((v61[13] & 1) == 0)
          goto LABEL_82;
        if (*((_QWORD *)v61 + 28))
        {
          v69 = objc_alloc_init(ExifMetadataExtractor);
          -[ExifMetadataExtractor setInFileURL:](v69, "setInFileURL:", *((_QWORD *)v61 + 28));
          -[PregateFeatureBuilder setIrisStillExtractor:](v64, "setIrisStillExtractor:", v69);
          v70 = -[PregateFeatureBuilder processStill](v64, "processStill");
          v71 = v70 == 0;
          if ((_DWORD)v70)
            NSLog(CFSTR("Pregate feature builder error:%d\n"), v70);

          v68 = __p;
          v65 = v239;
        }
        else
        {
          v71 = 0;
        }
        if (v68 == v65)
          goto LABEL_82;
        v200 = v62;
        v72 = 0;
        v73 = 0;
        v74 = 1;
        do
        {
          sub_1D4C7915C(v65[v72], v71);
          v65 = v239;
          v75 = *(_DWORD **)(*((_QWORD *)v239 + v72) + 16);
          if (!v75 || !*v75)
          {
            if (*((_BYTE *)v61 + 216))
              v73 = v75[3] != 1;
            else
              v73 = 0;
          }
          v72 = v74++;
        }
        while (v72 < ((_BYTE *)__p - (_BYTE *)v239) >> 3);
        v62 = v200;
        if (!v73)
        {
LABEL_82:
          v76 = objc_alloc_init(FilteredMetadataExtractor);
          -[IrisVideoMetadataExtractor setInMovieAsset:](v76, "setInMovieAsset:", v62);
          -[PregateFeatureBuilder setIrisVideoExtractor:](v64, "setIrisVideoExtractor:", v76);
          v77 = -[PregateFeatureBuilder processVideo](v64, "processVideo");
          v78 = v77;
          if ((_DWORD)v77)
            NSLog(CFSTR("Pregate feature builder error:%d\n"), v77);
          v79 = v239;
          if (__p != v239)
          {
            v201 = v62;
            v80 = 0;
            v81 = 1;
            do
            {
              v82 = v79[v80];
              v249 = v224;
              v83 = *(__int128 *)((char *)v61 + 24);
              v84 = *(__int128 *)((char *)v61 + 56);
              v216 = *(__int128 *)((char *)v61 + 40);
              v217 = v84;
              *(_OWORD *)buf = v83;
              sub_1D4C79594(v82, &v249, buf, &v236, &v235, &v234, v78 == 0);
              sub_1D4C79A14(*((_QWORD **)v239 + v80), v78 == 0);
              sub_1D4C79DD4(*((_QWORD **)v239 + v80), v78 == 0);
              v80 = v81;
              v79 = v239;
              ++v81;
            }
            while (v80 < ((_BYTE *)__p - (_BYTE *)v239) >> 3);
            v17 = (CMTime *)MEMORY[0x1E0CA2E10];
            v62 = v201;
            if (__p != v239 && (v61[13] & 1) == 0)
            {
              v85 = 0;
              v86 = 1;
              do
              {
                sub_1D4C7912C(v79[v85]);
                sub_1D4C7913C(*((_QWORD *)v239 + v85));
                sub_1D4C7914C(*((_QWORD *)v239 + v85));
                v85 = v86;
                v79 = v239;
                ++v86;
              }
              while (v85 < ((_BYTE *)__p - (_BYTE *)v239) >> 3);
            }
          }

        }
      }
      else
      {
        v64 = 0;
      }
      ((void (*)(uint64_t (**)(float), float))v63[2])(v63, 1.0);

      if (!v59)
      {
        v199 = 1;
        v52 = (uint64_t (**)(_QWORD, float))v198;
        goto LABEL_100;
      }
      v52 = (uint64_t (**)(_QWORD, float))v198;
      if (*((_BYTE *)ptr + 216))
      {
        if ((ptr[13] & 1) != 0)
        {
          v87 = sub_1D4C6D134((uint64_t)v203, 0);
          if (v87)
          {
            if (*((_DWORD *)v87 + 3) != 1 || *((_DWORD *)v87 + 4) != 1)
            {
              v199 = 0;
              v59 = 1;
              goto LABEL_100;
            }
          }
        }
      }
      v199 = 0;
    }
    v59 = 0;
LABEL_100:

    v60 = v196;
    v14 = v202;
    goto LABEL_101;
  }
  v59 = 0;
  v60 = v196;
LABEL_101:
  v88 = 0;
  v223 = -2;
  if (!v199 && (v59 & 1) == 0)
  {
    v89 = 0;
    do
      v90 = v89++;
    while (v90 <= 3 && *((_DWORD *)v60 + v90) != 1);
    v91 = v89 - 1;
    if (v90 >= 4)
      v92 = 0.0;
    else
      v92 = (float)v91 * 0.25;
    v93 = v52[2](v52, v92 + 0.0);
    v219[0] = MEMORY[0x1E0C809B0];
    v219[1] = 3221225472;
    v219[2] = sub_1D4C5CF04;
    v219[3] = &unk_1E9863EB8;
    v220 = v52;
    v221 = v92;
    v222 = 1048576000;
    v94 = (void *)MEMORY[0x1D826643C](v219);
    if ((v93 & 1) != 0)
    {
      v214 = v243;
      v212 = v236;
      v213 = v237;
      v211 = v235;
      v210 = v234;
      v199 = sub_1D4C5CF1C((uint64_t)buf, (uint64_t)ptr, &v214, (uint64_t)&v212, &v211, (uint64_t)&v210);
      if (v199)
      {
        v88 = 0;
      }
      else
      {
        v209 = 0;
        v95 = v218;
        if (v218)
          v96 = &v208;
        else
          v96 = 0;
        if (v218)
          v208 = 0;
        v199 = sub_1D4C5D420(v195, (uint64_t)buf, v94, &v209, &v223, v96);
        v97 = v209;
        if (v95)
          v98 = v208;
        else
          v98 = 0;
        if (v190)
          *v190 = v97;
        v99 = v97;
        if ((ptr[13] & 2) != 0)
        {
          v100 = v239;
          if (__p != v239)
          {
            v101 = 0;
            v102 = 1;
            v103 = v223;
            do
            {
              v104 = *(_QWORD *)(v100[v101] + 24);
              *(_DWORD *)(v104 + 96) = v103;
              objc_storeStrong((id *)(v104 + 104), v98);
              v101 = v102;
              v100 = v239;
              ++v102;
            }
            while (v101 < ((_BYTE *)__p - (_BYTE *)v239) >> 3);
          }
        }

        v88 = v99;
      }
    }
    else
    {
      v88 = 0;
      v199 = v93 ^ 1;
    }

  }
  if (v199)
    v105 = 1;
  else
    v105 = v59;
  if ((v105 & 1) != 0)
  {
    v106 = 0;
  }
  else
  {
    v107 = ptr;
    if ((ptr[13] & 2) != 0)
    {
      v108 = v239;
      if (__p != v239)
      {
        v109 = 0;
        v110 = 1;
        do
        {
          sub_1D4C7A370(v108[v109]);
          v109 = v110;
          v108 = v239;
          ++v110;
        }
        while (v109 < ((_BYTE *)__p - (_BYTE *)v239) >> 3);
      }
      v107 = ptr;
    }
    v111 = v88;
    v112 = objc_msgSend(v111, "frameTimes");
    v246 = 0;
    v247 = 0;
    v248 = 0;
    sub_1D4C60B10(&v246, *(const void **)v112, *(_QWORD *)(v112 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v112 + 8) - *(_QWORD *)v112) >> 3));
    memset(&v245[32], 0, 24);
    if (v111)
      objc_msgSend(v111, "roiLength");
    v113 = *((_QWORD *)v107 + 30);
    if ((~*(_DWORD *)(v113 + 16) & 0x11) != 0)
    {
      *(CMTime *)v245 = *(CMTime *)(v113 + 4);
    }
    else
    {
      sub_1D4C91FA0((uint64_t *)&v246, 0, (uint64_t)buf);
      *(_OWORD *)v245 = *(_OWORD *)buf;
      *(_QWORD *)&v245[16] = v216;
      v113 = *((_QWORD *)v107 + 30);
    }
    v249 = *(CMTime *)v245;
    v114 = *(_DWORD *)v113;
    *(_OWORD *)buf = *(_OWORD *)v245;
    *(_QWORD *)&v216 = *(_QWORD *)&v245[16];
    *(CMTime *)v245 = *(CMTime *)&v245[32];
    v106 = sub_1D4C8BA00(v114, (uint64_t)&v246, (uint64_t)buf, (CMTime *)v245);
    if (v106)
      v115 = 0;
    else
      v115 = 22;
    v199 = v115;
    if (v246)
    {
      v247 = v246;
      operator delete(v246);
    }

  }
  if (*((_QWORD *)ptr + 49))
    v116 = 1;
  else
    v116 = *((_QWORD *)ptr + 48) != 0;
  v189 = *((_QWORD *)ptr + 51);
  if (v199)
    v117 = 1;
  else
    v117 = v59;
  v193 = v116;
  v191 = v117 | !v116;
  if ((v191 & 1) == 0)
  {
    if (sub_1D4C6CEA8((uint64_t)v203, 2))
    {
      v118 = operator new();
      *(_OWORD *)v118 = *(_OWORD *)&v17->value;
      *(_QWORD *)(v118 + 16) = v17->epoch;
      *(_QWORD *)(v118 + 72) = 0;
      *(_QWORD *)(v118 + 80) = 0;
      *(_QWORD *)(v118 + 64) = 0;
      sub_1D4C832B8(v118, (uint64_t)v106, v88, v223);
      v119 = operator new();
      v120 = (*(uint64_t (**)(_QWORD *))(*v106 + 24))(v106);
      *(_DWORD *)v119 = 0;
      *(_DWORD *)(v119 + 4) = v120;
      *(_QWORD *)(v119 + 8) = 0;
      *(_QWORD *)(v119 + 16) = 0x200000000;
      *(_DWORD *)buf = 2;
      v121 = (uint64_t *)operator new();
      sub_1D4C6CEF4(v121, 1, buf);
      *v121 = v118;
      sub_1D4C6CF84((uint64_t)v121, 2, v119, 0);
      v122 = ptr;
      if (*((_QWORD *)ptr + 48))
      {
        LODWORD(v249.value) = 0;
        v123 = sub_1D4C6D260(v121, 2, (int *)&v249);
        (*((void (**)(_QWORD, _QWORD, uint64_t, uint64_t))ptr + 48))(*((_QWORD *)ptr + 47), 0, 2, v123);
        v122 = ptr;
      }
      v124 = (void (*)(_QWORD, _QWORD, uint64_t, uint64_t *))*((_QWORD *)v122 + 49);
      if (!v124)
      {
        v184 = sub_1D4C6D25C(v121);
        MEMORY[0x1D82660DC](v184, 0x1020C4084B17629);
        if ((v117 & 1) != 0)
          goto LABEL_182;
        goto LABEL_168;
      }
      v124(*((_QWORD *)v122 + 47), 0, 2, v121);
    }
    else
    {
      v125 = ptr;
      v126 = (void (*)(_QWORD, _QWORD, uint64_t, _QWORD))*((_QWORD *)ptr + 49);
      if (v126)
      {
        v126(*((_QWORD *)ptr + 47), 0, 2, 0);
        v125 = ptr;
      }
      v127 = (void (*)(_QWORD, _QWORD, uint64_t, _QWORD))*((_QWORD *)v125 + 48);
      if (v127)
        v127(*((_QWORD *)v125 + 47), 0, 2, 0);
    }
  }
  if ((v117 & 1) != 0)
    goto LABEL_182;
LABEL_168:
  v128 = 0;
  do
    v129 = v128++;
  while (v129 <= 3 && *((_DWORD *)v196 + v129) != 2);
  v130 = v128 - 1;
  if (v129 >= 4)
    v131 = 0.0;
  else
    v131 = (float)v130 * 0.25;
  v132 = ((uint64_t (*)(float))v198[2])(v131 + 0.0) ^ 1;
  v204[0] = MEMORY[0x1E0C809B0];
  v204[1] = 3221225472;
  v204[2] = sub_1D4C5D934;
  v204[3] = &unk_1E9863EB8;
  v205 = v198;
  v206 = v131;
  v207 = 1048576000;
  v133 = (void *)MEMORY[0x1D826643C](v204);
  v199 = v132;
  if ((v132 & 1) == 0)
  {
    *(_QWORD *)&buf[8] = 0;
    *(_QWORD *)&v216 = 0;
    *(_QWORD *)buf = &buf[8];
    v134 = v239;
    if (__p != v239)
    {
      v135 = 0;
      v136 = 1;
      do
      {
        v137 = v134[v135];
        v138 = *(_DWORD **)(v137 + 16);
        if (v138)
          LODWORD(v138) = *v138;
        v139 = *(uint64_t **)(v137 + 24);
        LODWORD(v246) = (_DWORD)v138;
        v249.value = (CMTimeValue)&v246;
        sub_1D4C60C4C((uint64_t **)buf, (int *)&v246, (uint64_t)&unk_1D4C953E0, &v249)[5] = v139;
        v135 = v136;
        v134 = v239;
        ++v136;
      }
      while (v135 < ((_BYTE *)__p - (_BYTE *)v239) >> 3);
    }
    v199 = sub_1D4C5D94C(ptr, v197, v195, v133, v223, v88, (uint64_t)v106, v203, (uint64_t **)buf);
    sub_1D4C60C0C((uint64_t)buf, *(_QWORD **)&buf[8]);
  }

LABEL_182:
  if (v106)
    (*(void (**)(_QWORD *))(*v106 + 8))(v106);
  if (v199)
    v140 = 1;
  else
    v140 = v59;
  v141 = v193;
  if ((v140 & 1) != 0)
  {
LABEL_188:
    if (v199)
      goto LABEL_223;
    goto LABEL_198;
  }
  if ((ptr[13] & 4) != 0)
  {
    v142 = (_QWORD **)v239;
    if (__p != v239)
    {
      v143 = 0;
      v144 = 1;
      do
      {
        sub_1D4C7A510(v142[v143]);
        v143 = v144;
        v142 = (_QWORD **)v239;
        ++v144;
      }
      while (v143 < ((_BYTE *)__p - (_BYTE *)v239) >> 3);
      if (__p != v239)
      {
        v145 = 0;
        v146 = 1;
        do
        {
          sub_1D4C7A594(v142[v145]);
          v145 = v146;
          v142 = (_QWORD **)v239;
          ++v146;
        }
        while (v145 < ((_BYTE *)__p - (_BYTE *)v239) >> 3);
      }
      goto LABEL_188;
    }
  }
LABEL_198:
  v147 = v239;
  if (__p != v239)
  {
    v148 = 0;
    v149 = 1;
    do
    {
      sub_1D4C7A778(v147[v148]);
      v148 = v149;
      v147 = v239;
      ++v149;
    }
    while (v148 < ((_BYTE *)__p - (_BYTE *)v239) >> 3);
  }
  objc_msgSend(v197, "URLByAppendingPathComponent:", CFSTR("gatingData.plist"));
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = v88;
  v150 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v151 = v239;
  if (__p != v239)
  {
    v152 = 0;
    v153 = 1;
    while (1)
    {
      v154 = v151[v152];
      v155 = *(_DWORD **)(v154 + 16);
      v156 = v155 ? *v155 : 0;
      v157 = *(_QWORD *)(v154 + 24);
      v158 = sub_1D4C6D134((uint64_t)v203, v156);
      sub_1D4C6D350(v156);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("gatingFeatures-"), "stringByAppendingString:", v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();

      if (v156)
        break;
      v162 = CFSTR("gatingResults");
      if (v157)
        goto LABEL_210;
LABEL_211:
      v14 = v202;
      if (v158)
      {
        sub_1D4C78D40((uint64_t)v158);
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "setObject:forKeyedSubscript:", v164, v162);

      }
      v152 = v153;
      v151 = v239;
      ++v153;
      if (v152 >= ((_BYTE *)__p - (_BYTE *)v239) >> 3)
        goto LABEL_214;
    }
    sub_1D4C6D350(v156);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("gatingResults-"), "stringByAppendingString:", v161);
    v162 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

    if (!v157)
      goto LABEL_211;
LABEL_210:
    sub_1D4C65EB8(v157, v156 == 0, (*((_QWORD *)ptr + 26) >> 4) & 1);
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "setObject:forKeyedSubscript:", v163, v160);

    goto LABEL_211;
  }
LABEL_214:
  if ((objc_msgSend(v150, "writeToURL:atomically:", v185, 1) & 1) == 0)
    NSLog(CFSTR("failed to write gating dictionary.\n"));
  v165 = (void (*)(_QWORD, id))*((_QWORD *)ptr + 51);
  if (v165)
    v165(*((_QWORD *)ptr + 50), v150);

  v166 = v203;
  v88 = v187;
  if (a6)
  {
    *a6 = v203;
    v166 = 0;
  }
  v141 = v193;
  objc_msgSend(v197, "URLByAppendingPathComponent:", CFSTR("autoloopSettings.plist"));
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1D4C57DD0((uint64_t)ptr);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v168, "writeToURL:atomically:", v167, 1);

  if (v187)
  {
    objc_msgSend(v197, "URLByAppendingPathComponent:", CFSTR("stabilizeParams.plist"));
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v187, "writeToURL:", v169);

  }
  v203 = v166;

LABEL_223:
  if ((v141 & v191) == 1)
  {
    v170 = ptr;
    v171 = (void (*)(_QWORD, _QWORD, uint64_t, _QWORD))*((_QWORD *)ptr + 49);
    if (v171)
    {
      v171(*((_QWORD *)ptr + 47), v199, 2, 0);
      v170 = ptr;
    }
    v172 = (void (*)(_QWORD, _QWORD, uint64_t, _QWORD))*((_QWORD *)v170 + 48);
    if (v172)
      v172(*((_QWORD *)v170 + 47), v199, 2, 0);
  }
  if (v189)
  {
    if (v199)
    {
      v173 = (void (*)(_QWORD, _QWORD))*((_QWORD *)ptr + 51);
      if (v173)
        v173(*((_QWORD *)ptr + 50), 0);
    }
  }
  if (v203)
  {
    v174 = sub_1D4C6D25C(v203);
    MEMORY[0x1D82660DC](v174, 0x1020C4084B17629);
  }
  v175 = v239;
  if (__p != v239)
  {
    v176 = 0;
    v177 = 1;
    do
    {
      v178 = v175[v176];
      if (*(_QWORD *)(v178 + 24))
      {
        v179 = sub_1D4C65EB4();
        MEMORY[0x1D82660DC](v179, 0x10A0C40581A9675);
      }
      v180 = sub_1D4C7A014(v178);
      MEMORY[0x1D82660DC](v180, 0xA0C40A3561BEDLL);
      v176 = v177;
      v175 = v239;
      ++v177;
    }
    while (v176 < ((_BYTE *)__p - (_BYTE *)v239) >> 3);
  }
  ((void (*)(float))v198[2])(1.0);
  sub_1D4C822C8(1);
  v181 = objc_claimAutoreleasedReturnValue();
  v182 = v181;
  if (v192 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v181))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4C55000, v182, OS_SIGNPOST_INTERVAL_END, v14, "ALRunLiveAnalysisPipeline", (const char *)&unk_1D4CA00BD, buf, 2u);
  }

  if (v239)
  {
    __p = v239;
    operator delete(v239);
  }
  operator delete(v196);

  return v199;
}

void sub_1D4C5CBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21)
{
  void *v21;
  void *v23;

  v23 = (void *)STACK[0x358];
  if (STACK[0x358])
  {
    STACK[0x360] = (unint64_t)v23;
    operator delete(v23);
  }
  operator delete(a19);

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C5CEEC(uint64_t a1, float a2)
{
  return (*(uint64_t (**)(_QWORD, float))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(float *)(a1 + 40) + (float)(*(float *)(a1 + 44) * a2));
}

uint64_t sub_1D4C5CF04(uint64_t a1, float a2)
{
  return (*(uint64_t (**)(_QWORD, float))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(float *)(a1 + 40) + (float)(*(float *)(a1 + 44) * a2));
}

uint64_t sub_1D4C5CF1C(uint64_t a1, uint64_t a2, CMTime *a3, uint64_t a4, CMTime *a5, uint64_t a6)
{
  CMTime *v10;
  CMTime *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  CMTimeFlags v17;
  CMTimeEpoch v18;
  CMTime *v20;
  CMTimeEpoch epoch;
  __int128 v22;
  CMTime v23;
  CMTime v24;
  CMTime v25;
  CMTime v26;
  CMTimeRange v27;
  CMTime v28;
  CMTime v29;
  CMTime v30;
  CMTime v31;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  CMTime v35;
  CMTime v36;
  CMTime v37;
  CMTime v38;
  CMTime rhs;
  CMTime lhs;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTime v44;
  CMTime v45;
  CMTime v46;
  CMTime time;
  CMTimeRange v48;
  CMTimeRange otherRange;
  CMTime v50;
  CMTime v51;
  CMTimeRange range;
  CMTimeRange v53;
  CMTime v54;
  CMTime v55;
  CMTime time2;
  CMTime time1;
  CMTime duration;
  CMTime start;
  CMTimeRange v60;
  CMTime v61;
  CMTime v62;
  CMTimeValue v63;
  CMTimeScale v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  if ((a5->flags & 0x1D) == 1)
    v10 = a5;
  else
    v10 = (CMTime *)(a2 + 72);
  v62 = *v10;
  v11 = (CMTime *)(a2 + 96);
  if ((*(_DWORD *)(a6 + 12) & 0x1D) == 1)
    v12 = a6;
  else
    v12 = a2 + 96;
  v13 = *(_OWORD *)v12;
  v61.epoch = *(_QWORD *)(v12 + 16);
  *(_OWORD *)&v61.value = v13;
  memset(&v60, 0, sizeof(v60));
  v14 = *(_OWORD *)&v10->value;
  start.epoch = v10->epoch;
  *(_OWORD *)&start.value = v14;
  v15 = *(_OWORD *)v12;
  duration.epoch = *(_QWORD *)(v12 + 16);
  *(_OWORD *)&duration.value = v15;
  CMTimeRangeMake(&v60, &start, &duration);
  if ((*(_DWORD *)(a4 + 12) & 0x1D) == 1)
    v16 = a4;
  else
    v16 = a2;
  v63 = *(_QWORD *)v16;
  v17 = *(_DWORD *)(v16 + 12);
  v64 = *(_DWORD *)(v16 + 8);
  v18 = *(_QWORD *)(v16 + 16);
  time1 = v62;
  time2 = *(CMTime *)(a2 + 72);
  if (CMTimeCompare(&time1, &time2) < 0)
    return 15;
  v55 = v61;
  v54 = *v11;
  if (CMTimeCompare(&v55, &v54) > 0)
    return 15;
  memset(&v53, 0, sizeof(v53));
  v20 = (CMTime *)MEMORY[0x1E0CA2E68];
  v51 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v50 = *a3;
  CMTimeRangeMake(&range, &v51, &v50);
  otherRange = v60;
  CMTimeRangeGetIntersection(&v53, &range, &otherRange);
  if ((~v17 & 0x11) != 0
    && (v48 = v53,
        time.value = v63,
        time.timescale = v64,
        time.flags = v17,
        time.epoch = v18,
        !CMTimeRangeContainsTime(&v48, &time)))
  {
    NSLog(CFSTR("runAutoLoopStabilize: ref_frame_time outside trim range"));
    return 13;
  }
  else
  {
    *(_WORD *)(a1 + 125) = *(_WORD *)(a2 + 205);
    *(_DWORD *)a1 = *(_DWORD *)(a2 + 200);
    *(_QWORD *)(a1 + 4) = v63;
    *(_DWORD *)(a1 + 12) = v64;
    *(_DWORD *)(a1 + 16) = v17;
    *(_QWORD *)(a1 + 20) = v18;
    *(CMTime *)(a1 + 28) = v62;
    *(CMTime *)(a1 + 52) = v61;
    *(_BYTE *)(a1 + 124) = (*(_BYTE *)(a2 + 208) & 2) != 0;
    memset(&v53, 0, 24);
    sub_1D4C569E0(a2, 1, 1, 1, &v53.start);
    memset(&v46, 0, sizeof(v46));
    v45 = v61;
    v44 = *a3;
    CMTimeMinimum(&v46, &v45, &v44);
    v43 = *v20;
    v42 = v46;
    v41 = v53.start;
    if (CMTimeCompare(&v42, &v41) >= 1)
    {
      lhs = v46;
      rhs = v53.start;
      CMTimeSubtract(&v43, &lhs, &rhs);
    }
    memset(&v38, 0, sizeof(v38));
    v37 = v43;
    CMTimeMultiplyByRatio(&v38, &v37, 1, 2);
    v36 = v38;
    v35 = v38;
    if ((*(_BYTE *)(a2 + 36) & 1) != 0
      && (*(_BYTE *)(a2 + 60) & 1) != 0
      && !*(_QWORD *)(a2 + 64)
      && (*(_QWORD *)(a2 + 48) & 0x8000000000000000) == 0)
    {
      v34 = v38;
      v32 = *(CMTime *)(a2 + 24);
      v31 = v62;
      CMTimeSubtract(&v33, &v32, &v31);
      CMTimeMinimum(&v36, &v34, &v33);
      memset(&v30, 0, sizeof(v30));
      v29 = *a3;
      v27 = v60;
      CMTimeRangeGetEnd(&v28, &v27);
      CMTimeMinimum(&v30, &v29, &v28);
      v26 = v35;
      v24 = v30;
      v23 = *(CMTime *)(a2 + 24);
      CMTimeSubtract(&v25, &v24, &v23);
      CMTimeMinimum(&v35, &v26, &v25);
    }
    epoch = v20->epoch;
    *(_QWORD *)(a1 + 92) = epoch;
    v22 = *(_OWORD *)&v20->value;
    *(_OWORD *)(a1 + 76) = *(_OWORD *)&v20->value;
    *(_OWORD *)(a1 + 100) = v22;
    *(_QWORD *)(a1 + 116) = epoch;
    if (*(_BYTE *)(a2 + 204))
    {
      *(CMTime *)(a1 + 76) = v36;
      *(CMTime *)(a1 + 100) = v35;
    }
    return 0;
  }
}

uint64_t sub_1D4C5D420(void *a1, uint64_t a2, void *a3, _QWORD *a4, int *a5, _QWORD *a6)
{
  id v11;
  id v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  AutoLoopStabilizer *v17;
  uint64_t v18;
  id v19;
  uint64_t (**v20)(_QWORD, float);
  AutoLoopStabilizer *v21;
  int v22;
  __int128 v23;
  __int128 *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  _DWORD *v28;
  AutoLoopStabilizer *v29;
  AutoLoopStabilizer *v30;
  AutoLoopStabilizer *v31;
  int v32;
  StabilizeParamGenerator *v33;
  void *v34;
  id v35;
  NSObject *v36;
  NSObject *v37;
  id v39;
  id v40;
  _QWORD *v41;
  uint64_t ptr;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint8_t v51[16];
  uint64_t v52;
  uint8_t buf[8];
  uint64_t v54;
  uint64_t (*v55)(uint64_t);
  void *v56;
  uint64_t (**v57)(_QWORD, float);

  v11 = a1;
  ptr = a2;
  v12 = a3;
  v39 = v12;
  v40 = v11;
  sub_1D4C822C8(1);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_make_with_pointer(v13, &ptr);

  sub_1D4C822C8(1);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4C55000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "ALRunAutoLoopStabilize", (const char *)&unk_1D4CA00BD, buf, 2u);
  }
  v41 = a4;

  *a5 = -2;
  v17 = objc_alloc_init(AutoLoopStabilizer);
  v18 = ptr;
  v19 = v11;
  v20 = (uint64_t (**)(_QWORD, float))v12;
  v21 = v17;
  v22 = v20[2](v20, 0.0);
  if ((v22 & 1) != 0)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v54 = 3221225472;
    v55 = sub_1D4C60B04;
    v56 = &unk_1E9863EE0;
    v57 = v20;
    -[AutoLoopStabilizer setStatusUpdateBlock:](v21, "setStatusUpdateBlock:", buf, v39, v40);
    -[AutoLoopStabilizer setMovieAssetIn:](v21, "setMovieAssetIn:", v19);
    v23 = *(_OWORD *)(v18 + 4);
    v52 = *(_QWORD *)(v18 + 20);
    *(_OWORD *)v51 = v23;
    -[AutoLoopStabilizer setRefFrameTime:](v21, "setRefFrameTime:", v51);
    if ((*(_DWORD *)(v18 + 40) & 0x1D) == 1)
    {
      -[AutoLoopStabilizer setUseLimitedTime:](v21, "setUseLimitedTime:", 1);
      v49 = *(_OWORD *)(v18 + 28);
      v50 = *(_QWORD *)(v18 + 44);
      -[AutoLoopStabilizer setTrimStart:](v21, "setTrimStart:", &v49);
      v24 = (__int128 *)(v18 + 52);
      if ((*(_DWORD *)(v18 + 64) & 0x1D) != 1)
        v24 = (__int128 *)MEMORY[0x1E0CA2E30];
      v47 = *v24;
      v48 = *((_QWORD *)v24 + 2);
      -[AutoLoopStabilizer setTrimLength:](v21, "setTrimLength:", &v47);
    }
    -[AutoLoopStabilizer setDisableGPUStabilization:](v21, "setDisableGPUStabilization:", *(unsigned __int8 *)(v18 + 125));
    -[AutoLoopStabilizer setOptimizeProcessingForMemory:](v21, "setOptimizeProcessingForMemory:", *(unsigned __int8 *)(v18 + 126));
    v45 = *(_OWORD *)(v18 + 76);
    v46 = *(_QWORD *)(v18 + 92);
    -[AutoLoopStabilizer setMaxAllowedTrimTimeStart:](v21, "setMaxAllowedTrimTimeStart:", &v45);
    v43 = *(_OWORD *)(v18 + 100);
    v44 = *(_QWORD *)(v18 + 116);
    -[AutoLoopStabilizer setMaxAllowedTrimTimeEnd:](v21, "setMaxAllowedTrimTimeEnd:", &v43);

  }
  v25 = v22 ^ 1u;

  *(_QWORD *)buf = 0;
  if ((v25 & 1) != 0)
  {
    v27 = 0;
    v26 = -8888;
    if (!(_DWORD)v25)
      goto LABEL_15;
LABEL_19:
    if (!a6)
      goto LABEL_34;
    goto LABEL_32;
  }
  v26 = -[AutoLoopStabilizer analyzeForAutoloopWithDirect:toAnalysisOutput:](v21, "analyzeForAutoloopWithDirect:toAnalysisOutput:", 0, buf);
  v27 = *(_QWORD *)buf;
  if (*(_QWORD *)buf)
    v25 = 16 * (v26 == 0);
  else
    v25 = 16 * (v26 != -1);
  if ((_DWORD)v25)
    goto LABEL_19;
LABEL_15:
  v28 = (_DWORD *)ptr;
  v29 = v21;
  v30 = v29;
  *a5 = -2;
  if (v26 == -1)
  {
    *a5 = -1;
    v25 = 1;
    goto LABEL_31;
  }
  if (!v26)
  {
    *a5 = 0;
LABEL_30:
    v25 = 16;
    goto LABEL_31;
  }
  v31 = v29;
  if (*v28 == 4)
    v32 = -[AutoLoopStabilizer processStabilizationAnalysisForCinematicL1:](v29, "processStabilizationAnalysisForCinematicL1:", v27);
  else
    v32 = -[AutoLoopStabilizer processStabilizationAnalysis:forcePassThru:forceSmoothing:forceSequentialTripod:](v29, "processStabilizationAnalysis:forcePassThru:forceSmoothing:forceSequentialTripod:", v27, *v28 == 3, *v28 == 2, *v28 == 1);
  *a5 = v32;
  v30 = v31;
  if ((v32 + 1) >= 2)
  {
    v33 = -[StabilizeParamGenerator initWithStabilizer:]([StabilizeParamGenerator alloc], "initWithStabilizer:", v31);
    -[StabilizeParamGenerator generateStabilizeParams](v33, "generateStabilizeParams");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v34, "numFrames"))
    {

      v34 = 0;
      *a5 = 0;
    }
    v35 = objc_retainAutorelease(v34);
    *v41 = v35;

    v32 = *a5;
    v30 = v31;
  }
  v25 = v32 == -1;
  if (!v32)
    goto LABEL_30;
LABEL_31:

  if (!a6)
    goto LABEL_34;
LABEL_32:
  if (*(_BYTE *)(ptr + 124))
  {
    -[AutoLoopStabilizer featuresDictionary](v21, "featuresDictionary");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_34:
  if (*(_QWORD *)buf)
    ICDestroyResult();
  v20[2](v20, 1.0);
  sub_1D4C822C8(1);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)v51 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4C55000, v37, OS_SIGNPOST_INTERVAL_END, v14, "ALRunAutoLoopStabilize", (const char *)&unk_1D4CA00BD, v51, 2u);
  }

  return v25;
}

void sub_1D4C5D8B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C5D934(uint64_t a1, float a2)
{
  return (*(uint64_t (**)(_QWORD, float))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(float *)(a1 + 40) + (float)(*(float *)(a1 + 44) * a2));
}

uint64_t sub_1D4C5D94C(__int128 *a1, void *a2, void *a3, void *a4, int a5, void *a6, uint64_t a7, uint64_t *a8, uint64_t **a9)
{
  id v15;
  void (**v16)(_QWORD, float);
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  int32_t v24;
  _OWORD *v25;
  int32_t v26;
  _BOOL4 v27;
  int32_t v28;
  int32_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t **v33;
  _BOOL4 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t **v38;
  uint64_t *v39;
  uint64_t *v40;
  void *v41;
  int v42;
  void *v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t *v46;
  uint64_t **v47;
  uint64_t *v48;
  uint64_t **v49;
  _QWORD *v50;
  uint64_t *v51;
  uint64_t **v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  int v56;
  int v57;
  char v58;
  char v59;
  uint64_t *v60;
  _QWORD *v61;
  uint64_t *v62;
  int v63;
  int v64;
  char v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  double v71;
  float v72;
  int v73;
  uint64_t **v74;
  _QWORD *v75;
  uint64_t *v76;
  uint64_t **v77;
  uint64_t **v78;
  uint64_t **v79;
  _QWORD *v80;
  uint64_t *v81;
  uint64_t **v82;
  uint64_t **v83;
  uint64_t **v84;
  uint64_t *v85;
  __int128 v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t **v89;
  uint64_t **v90;
  uint64_t *v91;
  __int128 v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t **v96;
  uint64_t **v97;
  uint64_t *v98;
  __int128 v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t **v103;
  uint64_t **v104;
  uint64_t *v105;
  __int128 v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t **v110;
  uint64_t **v111;
  void *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  NSObject *v120;
  NSObject *v121;
  uint64_t *v123;
  uint64_t v124;
  uint64_t *v125;
  void *v126;
  double v127;
  double v128;
  double v129;
  double v130;
  __int128 *v131;
  id v132;
  id v133;
  void *v134;
  int v135;
  int v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  id v141;
  int32_t v142;
  os_signpost_id_t spid;
  uint64_t *v144;
  int32_t v145;
  int v146;
  _BOOL4 v147;
  uint64_t v148;
  unint64_t v149;
  _BOOL4 v150;
  uint64_t *v151;
  void *v152;
  id v153;
  id v154;
  uint64_t *v155;
  _BOOL4 v156;
  id v157;
  _BOOL4 v158;
  CMTime v159;
  CMTime v160;
  CMTime v161;
  CMTime v162;
  CMTime v163;
  CMTime v164;
  CMTime v165;
  CMTime v166;
  CMTime v167;
  CMTime v168;
  int v169;
  uint8_t v170[8];
  int32_t v171[4];
  uint64_t v172;
  __int128 v173;
  uint64_t v174;
  __int128 *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  _OWORD v179[3];
  __int128 v180;
  uint64_t v181;
  _OWORD v182[3];
  __int128 v183;
  uint64_t v184;
  __int128 v185;
  uint64_t v186;
  char v187;
  CMTime time;
  char v189;
  __int128 v190;
  uint64_t v191;
  __int128 v192;
  uint64_t v193;
  __int128 v194;
  uint64_t v195;
  CMTime v196;
  CMTime v197;
  CMTime v198;
  CMTime v199;
  __int128 v200;
  uint64_t v201;
  __int128 v202;
  uint64_t v203;
  __int128 v204;
  uint64_t v205;
  CMTime v206;
  CMTime v207;
  CMTime v208;
  CMTime v209;
  uint8_t v210[96];
  uint8_t buf[104];
  __int128 *ptr;
  _DWORD *v213[3];

  ptr = a1;
  v15 = a2;
  v153 = a3;
  v16 = a4;
  v154 = a6;
  sub_1D4C822C8(1);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_id_make_with_pointer(v17, &ptr);

  sub_1D4C822C8(1);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4C55000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "ALRunAutoLoopAnalyze", (const char *)&unk_1D4CA00BD, buf, 2u);
  }

  v16[2](v16, 0.0);
  spid = v18;
  v149 = v18 - 1;
  v146 = a5;
  if (!a8)
  {
    v147 = 0;
    v150 = 0;
    v158 = 0;
    v156 = 0;
    v23 = 32;
    goto LABEL_24;
  }
  v156 = sub_1D4C6CEA8((uint64_t)a8, 0);
  v158 = sub_1D4C6CEA8((uint64_t)a8, 1);
  v150 = sub_1D4C6CEA8((uint64_t)a8, 2);
  v147 = sub_1D4C6CEA8((uint64_t)a8, 3);
  v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a7 + 24))(a7);
  if (v158)
    v22 = 4;
  else
    v22 = 2;
  if (v21 < v22)
  {
    v23 = 14;
LABEL_24:
    v155 = 0;
    v144 = 0;
LABEL_25:
    v148 = 0;
    v157 = 0;
LABEL_26:
    v39 = 0;
LABEL_27:
    v40 = 0;
    v175 = 0;
    v176 = 0;
    v177 = 0;
    goto LABEL_28;
  }
  v185 = 0uLL;
  v186 = 0;
  time = *(CMTime *)(a7 + 60);
  v24 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a7 + 24))(a7);
  CMTimeMultiply(&v209, &time, v24);
  v208 = *(CMTime *)((_BYTE *)ptr + 5);
  v207 = *(CMTime *)((_BYTE *)ptr + 7);
  sub_1D4C73250(&v209, &v208, &v207, (uint64_t)&v185, *((float *)ptr + 48));
  v25 = (_OWORD *)(a7 + 60);
  time = *(CMTime *)(a7 + 60);
  v26 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a7 + 24))(a7);
  CMTimeMultiply(&v206, &time, v26);
  v204 = *(__int128 *)((char *)ptr + 120);
  v205 = *((_QWORD *)ptr + 17);
  v202 = ptr[9];
  v203 = *((_QWORD *)ptr + 20);
  v200 = v185;
  v201 = v186;
  v23 = sub_1D4C733E8((uint64_t)buf, (__int128 *)&v206.value, &v204, &v202, &v200);
  v27 = v158;
  if ((_DWORD)v23)
    v27 = 0;
  if (v27)
  {
    v185 = 0uLL;
    v186 = 0;
    *(_OWORD *)&time.value = *v25;
    time.epoch = *(_QWORD *)(a7 + 76);
    v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a7 + 24))(a7);
    CMTimeMultiply(&v199, &time, v28);
    v198 = *(CMTime *)((char *)ptr + 248);
    v197 = *(CMTime *)((char *)ptr + 296);
    sub_1D4C73250(&v199, &v198, &v197, (uint64_t)&v185, *((float *)ptr + 48));
    *(_OWORD *)&time.value = *v25;
    time.epoch = *(_QWORD *)(a7 + 76);
    v29 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a7 + 24))(a7);
    CMTimeMultiply(&v196, &time, v29);
    v194 = *(__int128 *)((char *)ptr + 248);
    v195 = *((_QWORD *)ptr + 33);
    v192 = ptr[17];
    v193 = *((_QWORD *)ptr + 36);
    v190 = v185;
    v191 = v186;
    v23 = sub_1D4C733E8((uint64_t)v210, (__int128 *)&v196.value, &v194, &v192, &v190);
  }
  if ((_DWORD)v23)
    goto LABEL_24;
  v30 = *ptr;
  v184 = *((_QWORD *)ptr + 2);
  v31 = *(__int128 *)((char *)ptr + 24);
  v32 = *(__int128 *)((char *)ptr + 40);
  v182[2] = *(__int128 *)((char *)ptr + 56);
  v183 = v30;
  v182[0] = v31;
  v182[1] = v32;
  v23 = sub_1D4C823F0(a7, (uint64_t)&time, (uint64_t)buf, (uint64_t)&v183, (uint64_t)v182, 1u);
  LODWORD(v173) = 0;
  v175 = &v173;
  if (sub_1D4C60C4C(a9, (int *)&v173, (uint64_t)&unk_1D4C953E0, (_DWORD **)&v175)[5])
  {
    LODWORD(v173) = 0;
    v175 = &v173;
    v33 = sub_1D4C60C4C(a9, (int *)&v173, (uint64_t)&unk_1D4C953E0, (_DWORD **)&v175);
    *((_DWORD *)v33[5] + 52) = v189 == 0;
  }
  v34 = v158;
  if ((_DWORD)v23)
    v34 = 0;
  if (v34)
  {
    v35 = *ptr;
    v181 = *((_QWORD *)ptr + 2);
    v36 = *(__int128 *)((char *)ptr + 24);
    v37 = *(__int128 *)((char *)ptr + 40);
    v179[2] = *(__int128 *)((char *)ptr + 56);
    v180 = v35;
    v179[0] = v36;
    v179[1] = v37;
    v23 = sub_1D4C823F0(a7, (uint64_t)&v185, (uint64_t)v210, (uint64_t)&v180, (uint64_t)v179, 2u);
    LODWORD(v173) = 1;
    v175 = &v173;
    if (sub_1D4C60C4C(a9, (int *)&v173, (uint64_t)&unk_1D4C953E0, (_DWORD **)&v175)[5])
    {
      LODWORD(v173) = 1;
      v175 = &v173;
      v38 = sub_1D4C60C4C(a9, (int *)&v173, (uint64_t)&unk_1D4C953E0, (_DWORD **)&v175);
      *((_DWORD *)v38[5] + 52) = v187 == 0;
    }
  }
  if ((_DWORD)v23)
    goto LABEL_24;
  LODWORD(v173) = 3;
  v175 = &v173;
  if (sub_1D4C60C4C(a9, (int *)&v173, (uint64_t)&unk_1D4C953E0, (_DWORD **)&v175)[5])
  {
    LODWORD(v173) = 3;
    v175 = &v173;
    *((_DWORD *)sub_1D4C60C4C(a9, (int *)&v173, (uint64_t)&unk_1D4C953E0, (_DWORD **)&v175)[5] + 52) = 1;
  }
  LODWORD(v173) = 2;
  v175 = &v173;
  if (sub_1D4C60C4C(a9, (int *)&v173, (uint64_t)&unk_1D4C953E0, (_DWORD **)&v175)[5])
  {
    LODWORD(v173) = 2;
    v175 = &v173;
    *((_DWORD *)sub_1D4C60C4C(a9, (int *)&v173, (uint64_t)&unk_1D4C953E0, (_DWORD **)&v175)[5] + 52) = 1;
  }
  v54 = sub_1D4C82834((unsigned int *)&time);
  v155 = v54;
  if (sub_1D4C80CFC(v54))
  {
    v144 = 0;
    v23 = 26;
    goto LABEL_25;
  }
  if (v158)
  {
    v144 = sub_1D4C82F28((unsigned int *)&v185);
    if (sub_1D4C80CFC(v144))
    {
      v23 = 26;
      v158 = 1;
      goto LABEL_25;
    }
  }
  else
  {
    v144 = 0;
  }
  objc_msgSend(v154, "cropRect");
  v67 = v66;
  v69 = v68;
  v70 = *((_QWORD *)ptr + 30);
  sub_1D4C86E24(&v178);
  if (v67 <= v69)
    v71 = v69;
  else
    v71 = v67;
  v72 = v71;
  *(float *)&v178 = v72 / 320.0;
  v73 = *(_DWORD *)(v70 + 40);
  switch(v73)
  {
    case -1:
      goto LABEL_111;
    case 0:
      break;
    case 1:
LABEL_111:
      HIDWORD(v178) = 4;
      break;
    default:
      NSLog(CFSTR("Internal error in yuvEnabled()"));
      break;
  }
  if (*(_DWORD *)(*((_QWORD *)ptr + 30) + 36) == 2)
  {
    v123 = 0;
    v157 = 0;
    v124 = 0;
    goto LABEL_171;
  }
  if ((((uint64_t (*)(_QWORD, float))v16[2])(v16, 0.0) & 1) == 0)
  {
    v148 = 0;
    v157 = 0;
    v39 = 0;
    v23 = 1;
    goto LABEL_27;
  }
  objc_msgSend(v15, "URLByAppendingPathComponent:", CFSTR("vp_downsampled.vp"));
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v154, "cropRect");
  v128 = v127;
  v130 = v129;
  v131 = ptr;
  v132 = v153;
  v157 = v126;
  v133 = v154;
  v134 = v133;
  v135 = *(_DWORD *)(*((_QWORD *)v131 + 30) + 36);
  v152 = v132;
  if (v135 == 1)
    goto LABEL_184;
  if (!v135)
  {
LABEL_189:
    v137 = sub_1D4C86974(v132, v157, v134, (uint64_t)&v178, 0);
    if ((_DWORD)v137)
    {
      NSLog(CFSTR("vpCreateFromFile error %d\n"), v137);
      v136 = 0;
      v124 = 0;
      v23 = 23;
    }
    else
    {
      objc_msgSend(v157, "path");
      v138 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v139 = objc_msgSend(v138, "UTF8String");

      v140 = operator new();
      sub_1D4C88B50(v140, v139);
      v23 = 0;
      v136 = 1;
      v124 = v140;
    }
    goto LABEL_192;
  }
  if (v135 != -1)
  {
    NSLog(CFSTR("Internal error in createVideoParser: invalid inMemoryVP"));
    goto LABEL_189;
  }
  if (sub_1D4C86E30(v133, (uint64_t)&v178, v128, v130) >= 0xC00000)
    goto LABEL_189;
LABEL_184:
  v124 = operator new();
  sub_1D4C88D5C(v124, v132, v134, &v178, 0);
  v23 = 0;
  v136 = 1;
LABEL_192:

  if (!v124)
  {
    v148 = 0;
    v39 = 0;
    v23 = 23;
    goto LABEL_27;
  }
  if (!v136)
  {
    v148 = v124;
    goto LABEL_26;
  }
  v54 = v155;
  v123 = (uint64_t *)operator new();
  sub_1D4C60954(v123, v124, a7);
LABEL_171:
  v148 = v124;
  if ((((uint64_t (*)(_QWORD, float))v16[2])(v16, 0.3) & 1) == 0)
  {
    v23 = 1;
    v39 = v123;
    goto LABEL_27;
  }
  v175 = 0;
  v176 = 0;
  v177 = 0;
  v40 = sub_1D4C82A78((unsigned int *)&time, v54);
  v39 = v123;
  if (v158)
  {
    v125 = sub_1D4C82CF8((unsigned int *)&v185, v144);
    LOBYTE(v171[0]) = 0;
    sub_1D4C80AF8(v40, v125, v171);
    if (LOBYTE(v171[0]))
      v23 = 26;
    else
      v23 = 0;
    if (v125)
    {
      *(_QWORD *)&v173 = v125;
      sub_1D4C609EC((void ***)&v173);
      MEMORY[0x1D82660DC](v125, 0x20C40960023A9);
    }
    v158 = 1;
  }
  else
  {
    v23 = 0;
  }
LABEL_28:
  v151 = v39;
  if (!(_DWORD)v23 && (v158 || v156))
  {
    if (*(_DWORD *)(*((_QWORD *)ptr + 30) + 36) == 2)
    {
      objc_msgSend(v15, "URLByAppendingPathComponent:", CFSTR("downsampled_prerendered.mov"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = sub_1D4C7CEB0(v153, v41, v40, a7, v154, (uint64_t)&v178, (uint64_t *)&v175);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "removeItemAtURL:error:", v41, 0);

      if (!v40)
      {
LABEL_37:
        v40 = 0;
        if (v42)
        {
          v23 = 25;
          goto LABEL_44;
        }
        goto LABEL_39;
      }
    }
    else
    {
      v42 = sub_1D4C7A998(v39, v40, (uint64_t *)&v175);
      if (!v40)
        goto LABEL_37;
    }
    *(_QWORD *)&v173 = v40;
    sub_1D4C609EC((void ***)&v173);
    MEMORY[0x1D82660DC](v40, 0x20C40960023A9);
    goto LABEL_37;
  }
  if ((_DWORD)v23)
  {
LABEL_44:
    v173 = 0uLL;
    v174 = 0;
LABEL_45:
    memset(v171, 0, sizeof(v171));
    v172 = 0x100000000;
    goto LABEL_46;
  }
LABEL_39:
  if ((((uint64_t (*)(_QWORD, float))v16[2])(v16, 0.6) & 1) == 0)
  {
    v23 = 1;
    goto LABEL_44;
  }
  v173 = 0uLL;
  v174 = 0;
  v141 = v15;
  if (v156)
  {
    *(_DWORD *)v170 = 0;
    *(_QWORD *)v171 = v170;
    if (sub_1D4C60C4C(a9, (int *)v170, (uint64_t)&unk_1D4C953E0, (_DWORD **)v171)[5])
    {
      v44 = (_QWORD *)operator new();
      *v44 = 0;
      v44[1] = 0;
      v44[2] = 0;
    }
    else
    {
      v44 = 0;
    }
    sub_1D4C84CFC((uint64_t)v171, (uint64_t)&time);
    v23 = sub_1D4C84310(&v175, (uint64_t)v171, v155, &v173, v44);
    LODWORD(v213[0]) = 0;
    *(_QWORD *)v170 = v213;
    if (sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5])
    {
      LODWORD(v213[0]) = 0;
      *(_QWORD *)v170 = v213;
      v55 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
      v56 = sub_1D4C806E0(v155);
      v57 = sub_1D4C806FC(v155);
      v55[28] = (uint64_t)v44;
      *((_DWORD *)v55 + 58) = v56;
      *((_DWORD *)v55 + 59) = v57;
      v15 = v141;
    }
    if (DWORD2(v173) > DWORD1(v173))
    {
      NSLog(CFSTR("runAutoLoopAnalyze: illegal fadeLen, p (%u, %u)"), DWORD2(v173), DWORD1(v173));
      v23 = 21;
    }
    if (v155)
    {
      *(_QWORD *)v170 = v155;
      sub_1D4C609EC((void ***)v170);
      MEMORY[0x1D82660DC](v155, 0x20C40960023A9);
    }
    v58 = !v156;
    if ((_DWORD)v23)
      v58 = 1;
    if ((v58 & 1) != 0)
    {
      v155 = 0;
      goto LABEL_81;
    }
    v155 = 0;
    if (sub_1D4C8276C((unsigned int *)&time, v173, DWORD1(v173), DWORD2(v173), 0))
    {
      v23 = 26;
      goto LABEL_45;
    }
  }
  v23 = 0;
LABEL_81:
  memset(v171, 0, sizeof(v171));
  v172 = 0x100000000;
  if ((_DWORD)v23)
    v59 = 1;
  else
    v59 = !v158;
  if ((v59 & 1) == 0)
  {
    LODWORD(v213[0]) = 1;
    *(_QWORD *)v170 = v213;
    v60 = v144;
    if (sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5])
    {
      v61 = (_QWORD *)operator new();
      *v61 = 0;
      v61[1] = 0;
      v61[2] = 0;
    }
    else
    {
      v61 = 0;
    }
    sub_1D4C84D34((uint64_t)v170, (uint64_t)&v185, *((_DWORD *)ptr + 93));
    v23 = sub_1D4C84774(&v175, (uint64_t)v170, v144, (uint64_t)v171, v61);
    v169 = 1;
    v213[0] = &v169;
    if (sub_1D4C60C4C(a9, &v169, (uint64_t)&unk_1D4C953E0, v213)[5])
    {
      v169 = 1;
      v213[0] = &v169;
      v62 = sub_1D4C60C4C(a9, &v169, (uint64_t)&unk_1D4C953E0, v213)[5];
      v63 = sub_1D4C806E0(v144);
      v64 = sub_1D4C806FC(v144);
      v62[28] = (uint64_t)v61;
      *((_DWORD *)v62 + 58) = v63;
      *((_DWORD *)v62 + 59) = v64;
      v60 = v144;
    }
    if (v60)
    {
      v213[0] = v60;
      sub_1D4C609EC((void ***)v213);
      MEMORY[0x1D82660DC](v60, 0x20C40960023A9);
    }
    v39 = v151;
  }
  if ((_DWORD)v23)
    v65 = 1;
  else
    v65 = !v158;
  if ((v65 & 1) != 0)
  {
    v15 = v141;
  }
  else
  {
    v15 = v141;
    if (sub_1D4C82C2C((unsigned int *)&v185, v171[0], v171[1], v171[2], 1))
      v23 = 26;
    else
      v23 = 0;
  }
LABEL_46:
  v145 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a7 + 24))(a7);
  v142 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a7 + 24))(a7);
  if (!(_DWORD)v23)
  {
    if (v156)
    {
      LODWORD(v213[0]) = 0;
      *(_QWORD *)v170 = v213;
      if (sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5])
      {
        if (*(_DWORD *)(*((_QWORD *)ptr + 30) + 36) != 2 && (v178 & 0x400000000) != 0)
        {
          v45 = (_QWORD *)operator new();
          sub_1D4C813B4(v45, (uint64_t)v39);
          LODWORD(v213[0]) = 0;
          *(_QWORD *)v170 = v213;
          sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5][6] = (uint64_t)v45;
          LODWORD(v213[0]) = 0;
          *(_QWORD *)v170 = v213;
          v46 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          *(_OWORD *)((char *)v46 + 60) = v173;
          *(uint64_t *)((char *)v46 + 76) = v174;
          *((_BYTE *)v46 + 56) = 1;
          if ((ptr[13] & 4) != 0)
          {
            LODWORD(v213[0]) = 0;
            *(_QWORD *)v170 = v213;
            v47 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
            sub_1D4C64D10((uint64_t)v47[5]);
            LODWORD(v213[0]) = 0;
            *(_QWORD *)v170 = v213;
            v48 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
            sub_1D4C8274C(&time);
            sub_1D4C66A8C((uint64_t)v48);
            if ((ptr[13] & 0x10) != 0)
            {
              LODWORD(v213[0]) = 0;
              *(_QWORD *)v170 = v213;
              v49 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
              sub_1D4C66308((uint64_t)v49[5], v15, &stru_1E98652B8);
            }
          }
        }
      }
    }
    if (v158)
    {
      LODWORD(v213[0]) = 1;
      *(_QWORD *)v170 = v213;
      if (sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5])
      {
        if (*(_DWORD *)(*((_QWORD *)ptr + 30) + 36) != 2 && (v178 & 0x400000000) != 0)
        {
          v50 = (_QWORD *)operator new();
          sub_1D4C813B4(v50, (uint64_t)v39);
          LODWORD(v213[0]) = 1;
          *(_QWORD *)v170 = v213;
          sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5][6] = (uint64_t)v50;
          LODWORD(v213[0]) = 1;
          *(_QWORD *)v170 = v213;
          v51 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          *(_OWORD *)((char *)v51 + 60) = *(_OWORD *)v171;
          *(uint64_t *)((char *)v51 + 76) = v172;
          *((_BYTE *)v51 + 56) = 1;
          v39 = v151;
          if ((ptr[13] & 4) != 0)
          {
            LODWORD(v213[0]) = 1;
            *(_QWORD *)v170 = v213;
            v52 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
            sub_1D4C64D10((uint64_t)v52[5]);
            LODWORD(v213[0]) = 1;
            *(_QWORD *)v170 = v213;
            v53 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
            if (*((_DWORD *)ptr + 93))
              sub_1D4C8274C(&v185);
            sub_1D4C66A8C((uint64_t)v53);
            if ((ptr[13] & 0x10) != 0)
            {
              LODWORD(v213[0]) = 1;
              *(_QWORD *)v170 = v213;
              v74 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
              sub_1D4C66308((uint64_t)v74[5], v15, CFSTR("-bounce"));
            }
          }
        }
      }
    }
    if (v150)
    {
      LODWORD(v213[0]) = 2;
      *(_QWORD *)v170 = v213;
      if (sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5])
      {
        if (*(_DWORD *)(*((_QWORD *)ptr + 30) + 36) != 2 && (v178 & 0x400000000) != 0)
        {
          v75 = (_QWORD *)operator new();
          sub_1D4C813B4(v75, (uint64_t)v39);
          LODWORD(v213[0]) = 2;
          *(_QWORD *)v170 = v213;
          sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5][6] = (uint64_t)v75;
          LODWORD(v213[0]) = 2;
          *(_QWORD *)v170 = v213;
          v76 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          *((_DWORD *)v76 + 15) = 0;
          *((_DWORD *)v76 + 16) = v145;
          *((_DWORD *)v76 + 17) = 0;
          *((_DWORD *)v76 + 18) = 0;
          *(uint64_t *)((char *)v76 + 76) = 0x200000000;
          *((_BYTE *)v76 + 56) = 1;
          v39 = v151;
          if ((ptr[13] & 4) != 0)
          {
            LODWORD(v213[0]) = 2;
            *(_QWORD *)v170 = v213;
            v77 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
            sub_1D4C64D10((uint64_t)v77[5]);
            LODWORD(v213[0]) = 2;
            *(_QWORD *)v170 = v213;
            v78 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
            sub_1D4C66A8C((uint64_t)v78[5]);
            if ((ptr[13] & 0x10) != 0)
            {
              LODWORD(v213[0]) = 2;
              *(_QWORD *)v170 = v213;
              v79 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
              sub_1D4C66308((uint64_t)v79[5], v15, CFSTR("-longexposure"));
            }
          }
        }
      }
    }
    if (v147)
    {
      LODWORD(v213[0]) = 3;
      *(_QWORD *)v170 = v213;
      if (sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5])
      {
        if (*(_DWORD *)(*((_QWORD *)ptr + 30) + 36) != 2 && (v178 & 0x400000000) != 0)
        {
          v80 = (_QWORD *)operator new();
          sub_1D4C813B4(v80, (uint64_t)v39);
          LODWORD(v213[0]) = 3;
          *(_QWORD *)v170 = v213;
          sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5][6] = (uint64_t)v80;
          LODWORD(v213[0]) = 3;
          *(_QWORD *)v170 = v213;
          v81 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          *((_DWORD *)v81 + 15) = 0;
          *((_DWORD *)v81 + 16) = v145;
          *((_DWORD *)v81 + 17) = 0;
          *((_DWORD *)v81 + 18) = 0;
          *(uint64_t *)((char *)v81 + 76) = 0x200000000;
          *((_BYTE *)v81 + 56) = 1;
          if ((ptr[13] & 4) != 0)
          {
            LODWORD(v213[0]) = 3;
            *(_QWORD *)v170 = v213;
            v82 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
            sub_1D4C64D10((uint64_t)v82[5]);
            LODWORD(v213[0]) = 3;
            *(_QWORD *)v170 = v213;
            v83 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
            sub_1D4C66A8C((uint64_t)v83[5]);
            if ((ptr[13] & 0x10) != 0)
            {
              LODWORD(v213[0]) = 3;
              *(_QWORD *)v170 = v213;
              v84 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
              sub_1D4C66308((uint64_t)v84[5], v15, CFSTR("-stabilize"));
            }
          }
        }
      }
    }
    if ((ptr[13] & 4) != 0)
    {
      if (v156)
      {
        LODWORD(v213[0]) = 0;
        *(_QWORD *)v170 = v213;
        if (sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5])
        {
          LODWORD(v213[0]) = 0;
          *(_QWORD *)v170 = v213;
          v85 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          v86 = *(_OWORD *)(a7 + 60);
          v85[19] = *(_QWORD *)(a7 + 76);
          *(_OWORD *)(v85 + 17) = v86;
          LODWORD(v213[0]) = 0;
          *(_QWORD *)v170 = v213;
          v87 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          v167 = *(CMTime *)(a7 + 60);
          CMTimeMultiply(&v168, &v167, SDWORD2(v173));
          *(CMTime *)(v87 + 20) = v168;
          LODWORD(v213[0]) = 0;
          *(_QWORD *)v170 = v213;
          v88 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          v165 = *(CMTime *)(a7 + 60);
          CMTimeMultiply(&v166, &v165, SDWORD1(v173));
          *(CMTime *)(v88 + 23) = v166;
          LODWORD(v213[0]) = 0;
          *(_QWORD *)v170 = v213;
          v89 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
          sub_1D4C66AC0((uint64_t)v89[5]);
          LODWORD(v213[0]) = 0;
          *(_QWORD *)v170 = v213;
          v90 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
          sub_1D4C66DD0((uint64_t)v90[5]);
        }
      }
      if (v158)
      {
        LODWORD(v213[0]) = 1;
        *(_QWORD *)v170 = v213;
        if (sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5])
        {
          LODWORD(v213[0]) = 1;
          *(_QWORD *)v170 = v213;
          v91 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          v92 = *(_OWORD *)(a7 + 60);
          v91[19] = *(_QWORD *)(a7 + 76);
          *(_OWORD *)(v91 + 17) = v92;
          LODWORD(v213[0]) = 1;
          *(_QWORD *)v170 = v213;
          v93 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          v94 = MEMORY[0x1E0CA2E68];
          *((_OWORD *)v93 + 10) = *MEMORY[0x1E0CA2E68];
          v93[22] = *(_QWORD *)(v94 + 16);
          LODWORD(v213[0]) = 1;
          *(_QWORD *)v170 = v213;
          v95 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          v163 = *(CMTime *)(a7 + 60);
          CMTimeMultiply(&v164, &v163, v171[1]);
          *(CMTime *)(v95 + 23) = v164;
          LODWORD(v213[0]) = 1;
          *(_QWORD *)v170 = v213;
          v96 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
          sub_1D4C66AC0((uint64_t)v96[5]);
          LODWORD(v213[0]) = 1;
          *(_QWORD *)v170 = v213;
          v97 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
          sub_1D4C66DD0((uint64_t)v97[5]);
        }
      }
      if (v150)
      {
        LODWORD(v213[0]) = 2;
        *(_QWORD *)v170 = v213;
        if (sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5])
        {
          LODWORD(v213[0]) = 2;
          *(_QWORD *)v170 = v213;
          v98 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          v99 = *(_OWORD *)(a7 + 60);
          v98[19] = *(_QWORD *)(a7 + 76);
          *(_OWORD *)(v98 + 17) = v99;
          LODWORD(v213[0]) = 2;
          *(_QWORD *)v170 = v213;
          v100 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          v101 = MEMORY[0x1E0CA2E68];
          *((_OWORD *)v100 + 10) = *MEMORY[0x1E0CA2E68];
          v100[22] = *(_QWORD *)(v101 + 16);
          LODWORD(v213[0]) = 2;
          *(_QWORD *)v170 = v213;
          v102 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          v161 = *(CMTime *)(a7 + 60);
          CMTimeMultiply(&v162, &v161, v145);
          *(CMTime *)(v102 + 23) = v162;
          LODWORD(v213[0]) = 2;
          *(_QWORD *)v170 = v213;
          v103 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
          sub_1D4C66AC0((uint64_t)v103[5]);
          LODWORD(v213[0]) = 2;
          *(_QWORD *)v170 = v213;
          v104 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
          sub_1D4C66DD0((uint64_t)v104[5]);
        }
      }
      if (v147)
      {
        LODWORD(v213[0]) = 3;
        *(_QWORD *)v170 = v213;
        if (sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5])
        {
          LODWORD(v213[0]) = 3;
          *(_QWORD *)v170 = v213;
          v105 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          v106 = *(_OWORD *)(a7 + 60);
          v105[19] = *(_QWORD *)(a7 + 76);
          *(_OWORD *)(v105 + 17) = v106;
          LODWORD(v213[0]) = 3;
          *(_QWORD *)v170 = v213;
          v107 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          v108 = MEMORY[0x1E0CA2E68];
          *((_OWORD *)v107 + 10) = *MEMORY[0x1E0CA2E68];
          v107[22] = *(_QWORD *)(v108 + 16);
          LODWORD(v213[0]) = 3;
          *(_QWORD *)v170 = v213;
          v109 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170)[5];
          v159 = *(CMTime *)(a7 + 60);
          CMTimeMultiply(&v160, &v159, v142);
          *(CMTime *)(v109 + 23) = v160;
          LODWORD(v213[0]) = 3;
          *(_QWORD *)v170 = v213;
          v110 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
          sub_1D4C66AC0((uint64_t)v110[5]);
          LODWORD(v213[0]) = 3;
          *(_QWORD *)v170 = v213;
          v111 = sub_1D4C60C4C(a9, (int *)v213, (uint64_t)&unk_1D4C953E0, (_DWORD **)v170);
          sub_1D4C66DD0((uint64_t)v111[5]);
        }
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v153, "URL");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "lastPathComponent");
    v113 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v113, "UTF8String");

  }
  if (a8 && !(_DWORD)v23)
  {
    v114 = operator new();
    v115 = MEMORY[0x1E0CA2E10];
    *(_OWORD *)v114 = *MEMORY[0x1E0CA2E10];
    *(_QWORD *)(v114 + 16) = *(_QWORD *)(v115 + 16);
    *(_QWORD *)(v114 + 72) = 0;
    *(_QWORD *)(v114 + 80) = 0;
    *(_QWORD *)(v114 + 64) = 0;
    sub_1D4C832B8(v114, a7, v154, v146);
    *a8 = v114;
    sub_1D4C6CFE8((uint64_t)a8);
    if (v156)
    {
      v116 = operator new();
      *(_OWORD *)v116 = v173;
      *(_QWORD *)(v116 + 16) = v174;
      if (sub_1D4C6CF84((uint64_t)a8, 0, v116, 0))
        puts("Failed to set autoloop params on liveAnalysisResult object (probably due to missing entry).");
    }
    if (v158)
    {
      v117 = operator new();
      *(_OWORD *)v117 = *(_OWORD *)v171;
      *(_QWORD *)(v117 + 16) = v172;
      if (sub_1D4C6CF84((uint64_t)a8, 1, v117, 0))
        puts("Failed to set ping pong params on liveAnalysisResult object (probably due to missing entry).");
    }
    if (v150)
    {
      v118 = operator new();
      *(_DWORD *)v118 = 0;
      *(_DWORD *)(v118 + 4) = v145;
      *(_QWORD *)(v118 + 8) = 0;
      *(_QWORD *)(v118 + 16) = 0x200000000;
      if (sub_1D4C6CF84((uint64_t)a8, 2, v118, 0))
        puts("Failed to set long exposure recipe on liveAnalysisResult object (probably due to missing entry).");
    }
  }
  if (v155)
  {
    *(_QWORD *)v170 = v155;
    sub_1D4C609EC((void ***)v170);
    MEMORY[0x1D82660DC](v155, 0x20C40960023A9);
  }
  if (v148)
    (*(void (**)(uint64_t))(*(_QWORD *)v148 + 8))(v148);
  if (v151)
    MEMORY[0x1D82660DC](v151, 0x20C40A4A59CD2);
  if (v40)
  {
    *(_QWORD *)v170 = v40;
    sub_1D4C609EC((void ***)v170);
    MEMORY[0x1D82660DC](v40, 0x20C40960023A9);
  }
  if (v157)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "removeItemAtURL:error:", v157, 0);

  }
  v16[2](v16, 1.0);
  sub_1D4C822C8(1);
  v120 = objc_claimAutoreleasedReturnValue();
  v121 = v120;
  if (v149 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v120))
  {
    *(_WORD *)v170 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4C55000, v121, OS_SIGNPOST_INTERVAL_END, spid, "ALRunAutoLoopAnalyze", (const char *)&unk_1D4CA00BD, v170, 2u);
  }

  *(_QWORD *)&v173 = &v175;
  sub_1D4C60A70((void ***)&v173);

  return v23;
}

void sub_1D4C5F7D0(void *a1)
{
  uint64_t v1;

  MEMORY[0x1D82660DC](v1, 0x10F1C408F4C135DLL);
  __cxa_begin_catch(a1);
  NSLog(CFSTR("Error creating VideoParser"));
  __cxa_end_catch();
  JUMPOUT(0x1D4C5F6A4);
}

void sub_1D4C5F824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,uint64_t a23,uint64_t a24,void *a25)
{
  void *v25;
  void *v26;

  __cxa_end_catch();

  _Unwind_Resume(a1);
}

uint64_t runAutoLoopStabilize(uint64_t a1, void *a2, void *a3, _QWORD *a4, int *a5)
{
  id v9;
  id v10;
  CMTime *v11;
  uint64_t Duration;
  id v13;
  id v15;
  CMTime v16;
  CMTime v17;
  CMTime v18;
  CMTime v19;
  _BYTE v20[128];
  CMTime v21;

  v9 = a2;
  v10 = a3;
  v11 = (CMTime *)MEMORY[0x1E0CA2E10];
  v21 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
  Duration = validateInputVideoAndGetDuration(v9, (uint64_t)&v21);
  if ((_DWORD)Duration
    || (v19 = v21,
        v18 = *v11,
        v17 = v18,
        v16 = v18,
        Duration = sub_1D4C5CF1C((uint64_t)v20, a1, &v19, (uint64_t)&v18, &v17, (uint64_t)&v16),
        (_DWORD)Duration))
  {
    v13 = 0;
  }
  else
  {
    v15 = 0;
    Duration = sub_1D4C5D420(v9, (uint64_t)v20, v10, &v15, a5, 0);
    v13 = v15;
    if (a4 && !(_DWORD)Duration)
    {
      v13 = v13;
      *a4 = v13;
    }
  }

  return Duration;
}

void sub_1D4C5FC7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

__CFString *sub_1D4C5FC98(int a1, unint64_t a2)
{
  __CFString *v3;
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
  void *v19;
  uint64_t v20;

  if ((a1 + 2) > 3)
  {
    v3 = CFSTR("Unknown gating result.");
    if (!a2)
      return v3;
  }
  else
  {
    v3 = off_1E9863F00[a1 + 2];
    if (!a2)
      return v3;
  }
  if ((a2 & 0x40) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("shortInputFail "));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if ((a2 & 2) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("preGateStillFail "));
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v4;
  }
  if ((a2 & 4) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("preGateVideoTrimFail "));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v5;
  }
  if ((a2 & 8) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("preGateVideoMLFail "));
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v6;
  }
  if ((a2 & 0x80) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("preGateFacesFail "));
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v7;
  }
  if ((a2 & 0x10) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("tripodStabilizeFail "));
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v8;
  }
  if ((a2 & 0x20) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("postGateFail "));
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v9;
  }
  if ((a2 & 0x10000) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("activityGateFail "));
    v10 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v10;
  }
  if ((a2 & 0x4000) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("shortInputError "));
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v11;
  }
  if ((a2 & 0x200) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("preGateStillError "));
    v12 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v12;
  }
  if ((a2 & 0x400) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("preGateVideoTrimError "));
    v13 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v13;
  }
  if ((a2 & 0x800) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("preGateVideoMLError "));
    v14 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v14;
  }
  if ((a2 & 0x8000) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("preGateFacesError "));
    v15 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v15;
  }
  if ((a2 & 0x1000) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("tripodStabilizeError "));
    v16 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v16;
  }
  if ((a2 & 0x2000) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("postGateError "));
    v17 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v17;
  }
  if ((a2 & 0x20000) != 0)
  {
    -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", CFSTR("activityGateError "));
    v18 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v18;
  }
  if (HIWORD(a2))
  {
    +[PregateAnalyzer pregateFailureReasonsToString:](PregateAnalyzer, "pregateFailureReasonsToString:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[__CFString stringByAppendingString:](v3, "stringByAppendingString:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v3 = (__CFString *)v20;
    }

  }
  return v3;
}

void sub_1D4C5FF64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C5FF84(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t *v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;

  v5 = 0;
  result = 0xFFFFFFFFLL;
  if (!a1 || a2 > 3)
    goto LABEL_43;
  if (!sub_1D4C6CEA8(a1, a2))
  {
    v5 = 0;
    goto LABEL_42;
  }
  v8 = sub_1D4C6D134(a1, a2);
  v5 = (uint64_t)v8;
  if (!v8)
  {
LABEL_42:
    result = 0xFFFFFFFFLL;
    goto LABEL_43;
  }
  result = *((unsigned int *)v8 + 1);
  v9 = *(_DWORD *)(v5 + 8);
  v10 = (_DWORD)result == 0;
  if (!v9)
    v10 |= 0x40uLL;
  v11 = *(_DWORD *)(v5 + 12);
  v12 = *(_DWORD *)(v5 + 16);
  if (!v11)
    v10 |= 2uLL;
  if (!v12)
    v10 |= 4uLL;
  v13 = *(_DWORD *)(v5 + 20);
  v14 = *(_DWORD *)(v5 + 24);
  if (!v13)
    v10 |= 8uLL;
  if (!v14)
    v10 |= 0x80uLL;
  v15 = *(_DWORD *)(v5 + 28);
  v16 = *(_DWORD *)(v5 + 32);
  if (!v15)
    v10 |= 0x10uLL;
  v17 = *(_DWORD *)(v5 + 36);
  if (!v17)
    v10 |= 0x20uLL;
  if (!v16)
    v10 |= 0x10000uLL;
  if ((_DWORD)result == -2)
    v10 |= 0x100uLL;
  if (v9 == -2)
    v18 = v10 | 0x4000;
  else
    v18 = v10;
  if (v11 == -2)
    v18 |= 0x200uLL;
  if (v12 == -2)
    v18 |= 0x400uLL;
  if (v13 == -2)
    v18 |= 0x800uLL;
  if (v14 == -2)
    v18 |= 0x8000uLL;
  if (v15 == -2)
    v18 |= 0x1000uLL;
  if (v17 == -2)
    v18 |= 0x2000uLL;
  if (v16 == -2)
    v18 |= 0x20000uLL;
  v5 = v18 | (*(_QWORD *)(v5 + 56) << 48);
LABEL_43:
  if (a3)
    *a3 = v5;
  return result;
}

uint64_t getGatingResult(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;

  v7 = -1;
  v4 = sub_1D4C5FF84(a1, a2, (uint64_t *)&v7);
  v5 = v4;
  if (a3)
  {
    sub_1D4C5FC98(v4, v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

id sub_1D4C60144(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  id v12;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributesOfItemAtPath:error:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", v3, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, v6, &v12);
    v10 = v12;

    if ((v9 & 1) == 0)
    {
      NSLog(CFSTR("Error creating unique temporary output folder %@: %@"), v7, v10);

      v7 = 0;
    }

  }
  else
  {
    v10 = 0;
    v7 = 0;
  }

  return v7;
}

void sub_1D4C6029C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

double sub_1D4C602FC(void *a1, double a2, double a3, float a4)
{
  id v7;
  void *v8;
  double width;
  double v10;
  double v11;
  float v12;
  float v13;
  double v14;
  float v15;
  float v16;
  double v17;
  unsigned int v18;
  BOOL v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;

  v7 = a1;
  v8 = v7;
  width = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a4 > 0.0)
  {
    v11 = a2 <= a3 ? a3 : a2;
    v12 = v11;
    v13 = v12 / a4;
    width = *MEMORY[0x1E0C9D820];
    v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (v13 > 1.0)
    {
      v14 = v13;
      v15 = a2 / v13;
      v16 = ceilf(v15 * 0.5);
      v17 = (double)(float)(v16 + v16);
      *(float *)&v14 = a3 / v14;
      *(float *)&v14 = ceilf(*(float *)&v14 * 0.5);
      v18 = (float)(*(float *)&v14 + *(float *)&v14);
      v19 = a2 < v17 || a3 < (double)v18;
      width = *MEMORY[0x1E0C9D820];
      v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      if (!v19)
      {
        width = v17;
        v10 = (double)v18;
      }
    }
  }
  if (width != *MEMORY[0x1E0C9D820] || v10 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    objc_msgSend(v7, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21 && objc_msgSend(v21, "count") == 1)
    {
      objc_msgSend(v22, "objectAtIndex:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        objc_msgSend(v23, "preferredTransform");
        v27.origin.x = 0.0;
        v27.origin.y = 0.0;
        v27.size.width = width;
        v27.size.height = v10;
        v28 = CGRectApplyAffineTransform(v27, &v26);
        width = v28.size.width;
      }

    }
  }

  return width;
}

void sub_1D4C60480(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t renderGIF_0(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t *v9;
  float v10;
  void *v11;
  __CFString *v12;
  const __CFData *v13;
  const __CFData *v14;
  __CFData *v15;
  __CFData *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CMTime v22;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (uint64_t *)sub_1D4C7EE3C(v8, &v22);

  if (v9)
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    sub_1D4C91FA0(v9, 0, (uint64_t)&v19);
    v10 = (float)(int)v20 / (float)v19;
    v11 = (void *)*v9;
    if (*v9)
    {
      v9[1] = (uint64_t)v11;
      operator delete(v11);
    }
    MEMORY[0x1D82660DC](v9, 0x20C40960023A9);
    if ((sub_1D4C8CBAC(v5, (uint64_t)v6, 0x280u, v7, v10) & 1) != 0)
    {
      +[LoopQuicktimeMetadata metadataStringForAssetURL:](LoopQuicktimeMetadata, "metadataStringForAssetURL:", v5);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v17 = 1;
LABEL_16:

        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v6);
      v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        v15 = sub_1D4C8655C(v13, v12);
        v16 = v15;
        if (v15)
        {
          v17 = -[__CFData writeToURL:atomically:](v15, "writeToURL:atomically:", v6, 1);
          if ((v17 & 1) == 0)
            NSLog(CFSTR("createGIFFromVideo: error writing GIF file"));
          CFRelease(v16);
          goto LABEL_15;
        }
        NSLog(CFSTR("createGIFFromVideo: error adding metadata to GIF file"));
      }
      v17 = 0;
LABEL_15:

      goto LABEL_16;
    }
  }
  v17 = 0;
LABEL_17:

  return v17;
}

void sub_1D4C6065C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

id liveAnalysisResultToDictionary(void *a1)
{
  if (a1)
  {
    sub_1D4C6DD50((uint64_t)a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

_QWORD *liveAnalysisResultFromDictionary(void *a1)
{
  id v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = a1;
  v2 = (_QWORD *)operator new();
  v2[3] = 0;
  v2[2] = 0;
  *v2 = 0;
  v2[1] = v2 + 2;
  v2[4] = 0x100000001;
  if ((sub_1D4C6D5F4((uint64_t)v2, v1) & 0x80000000) != 0)
  {
    v3 = sub_1D4C6D25C(v2);
    MEMORY[0x1D82660DC](v3, 0x1020C4084B17629);
    v2 = 0;
  }

  return v2;
}

void sub_1D4C6074C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t validateLiveAnalysisDictionaryFormatAndVersion(void *a1)
{
  id v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  if (v1)
  {
    v2 = (_QWORD *)operator new();
    v2[3] = 0;
    v2[2] = 0;
    *v2 = 0;
    v2[1] = v2 + 2;
    v2[4] = 0x100000001;
    v3 = sub_1D4C6D5F4((uint64_t)v2, v1);
    v4 = sub_1D4C6D25C(v2);
    MEMORY[0x1D82660DC](v4, 0x1020C4084B17629);
  }
  else
  {
    v3 = 4294967292;
  }

  return v3;
}

void sub_1D4C607F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t *sub_1D4C60810(uint64_t *a1, int a2)
{
  uint64_t *v2;
  int v4;

  if (a1)
  {
    v4 = 0;
    v2 = (uint64_t *)sub_1D4C6D260(a1, a2, &v4);
    a1 = 0;
    if (v2)
    {
      if (!v4)
      {
        sub_1D4C7835C(v2);
        a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  return a1;
}

id buildLoopRecipeDictFromLiveAnalysisDict(void *a1, int a2)
{
  id v3;
  void *v4;
  uint64_t *v5;
  void *v6;

  v3 = a1;
  v4 = v3;
  if (v3 && (v5 = liveAnalysisResultFromDictionary(v3)) != 0)
  {
    sub_1D4C60810(v5, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_1D4C608AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t liveAnalysisResultDestroy(uint64_t result)
{
  if (result)
  {
    sub_1D4C6D25C();
    JUMPOUT(0x1D82660DCLL);
  }
  return result;
}

const __CFString *autoloopErrorCodeToString(unsigned int a1)
{
  if (a1 > 0x21)
    return CFSTR("Failed: Other error");
  else
    return off_1E9863F20[a1];
}

uint64_t sub_1D4C6090C(unsigned int a1)
{
  id v1;
  uint64_t v2;

  sub_1D4C6D350(a1);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = objc_msgSend(v1, "UTF8String");

  return v2;
}

void sub_1D4C60944(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t *sub_1D4C60954(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  void *exception;

  *a1 = a3;
  a1[1] = a2;
  if ((sub_1D4C8AA20(a3, (_QWORD *)(a2 + 160)) & 1) == 0)
  {
    fwrite("VideoParserNormalizer: VideoParser and FrameTimeNormalizer disagree on raw frame times.\n", 0x58uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D8266058](exception, "VideoParserNormalizer frame time error");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  return a1;
}

void sub_1D4C609D8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1D4C609EC(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_1D4C60A2C((uint64_t *)v2);
    operator delete(**a1);
  }
}

void sub_1D4C60A2C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;
  void *v4;
  void *v5;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    v5 = *(void **)(i - 24);
    v4 = v5;
    if (v5)
      operator delete(v4);
  }
  a1[1] = v2;
}

void sub_1D4C60A70(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_1D4C60AB0((uint64_t *)v2);
    operator delete(**a1);
  }
}

void sub_1D4C60AB0(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

uint64_t sub_1D4C60B04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

_QWORD *sub_1D4C60B10(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = sub_1D4C60B88(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1D4C60B6C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1D4C60B88(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_1D4C590D0();
  result = (char *)sub_1D4C59158((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *sub_1D4C60BD8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_1D4C5919C();
  return operator new(8 * a2);
}

void sub_1D4C60C0C(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_1D4C60C0C(a1, *a2);
    sub_1D4C60C0C(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t **sub_1D4C60C4C(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  uint64_t **v9;
  int v10;
  _DWORD *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = operator new(0x30uLL);
    v11[8] = **a4;
    *((_QWORD *)v11 + 5) = 0;
    sub_1D4C60D0C(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *sub_1D4C60D0C(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = sub_1D4C60D60(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_1D4C60D60(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t validateAutoLoopSettings(_QWORD *a1, void *a2)
{
  CMTime v3;
  int v4;

  v4 = 0;
  return sub_1D4C57424(a1, a2, 1, &v4, &v3);
}

uint64_t runAutoLoopPipeline(__int128 *a1, void *a2, void *a3, uint64_t *a4, _QWORD *a5, uint64_t *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  uint64_t *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int v27;
  uint64_t *v28;

  v13 = a2;
  v14 = a3;
  v15 = a7;
  v28 = 0;
  v27 = 0;
  v16 = sub_1D4C5B69C(a1, v13, v14, 1uLL, &v27, &v28, a5, v15);
  v17 = v16;
  if (a4)
  {
    if (!(_DWORD)v16)
    {
      v18 = liveAnalysisResultCopyRecipe(v28, 0, a4);
      if (v18)
      {
        printf("Error retrieving autoloop recipe, laRecipeErrorCode = %d.\n", v18);
        *a4 = 0;
      }
    }
  }
  if (a6)
  {
    if (!(_DWORD)v17)
    {
      if (v28)
      {
        v19 = sub_1D4C6D134((uint64_t)v28, 0);
        if (v19)
        {
          v20 = operator new();
          v21 = *(_OWORD *)v19;
          v22 = *((_OWORD *)v19 + 1);
          *(_QWORD *)(v20 + 32) = v19[4];
          *(_OWORD *)v20 = v21;
          *(_OWORD *)(v20 + 16) = v22;
          *(_QWORD *)(v20 + 40) = (id)v19[5];
          *(_QWORD *)(v20 + 48) = (id)v19[6];
          v23 = *(_OWORD *)(v19 + 9);
          v24 = *(_OWORD *)(v19 + 11);
          v25 = *(_OWORD *)(v19 + 13);
          *(_OWORD *)(v20 + 56) = *(_OWORD *)(v19 + 7);
          *(_OWORD *)(v20 + 104) = v25;
          *(_OWORD *)(v20 + 88) = v24;
          *(_OWORD *)(v20 + 72) = v23;
          *(_QWORD *)(v20 + 120) = (id)v19[15];
          *a6 = v20;
        }
      }
    }
  }
  liveAnalysisResultDestroy((uint64_t)v28);

  return v17;
}

void sub_1D4C61098(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL liveAnalysisResultCopyRecipe(uint64_t *a1, int a2, uint64_t *a3)
{
  int v4;
  uint64_t v5;
  int v7;

  if (a3)
    *a3 = 0;
  v4 = -1;
  v7 = -1;
  if (a1)
  {
    v5 = sub_1D4C6D260(a1, a2, &v7);
    v4 = v7;
    if (a3)
    {
      if (v5 && !v7)
        *a3 = v5;
    }
  }
  return v4 != 0;
}

unint64_t runAutoLoopRender(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  uint64_t (**v14)(_QWORD, float);
  void *v15;
  int v16;
  char v17;
  unint64_t v18;
  double v19;
  double v20;
  void *v21;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (a6)
  {
    sub_1D4C60144(v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if ((v14[2](v14, 0.0) & 1) != 0)
      {
        v16 = *(_DWORD *)(a6 + 24);
        if (v16 && v16 != 3)
        {
          NSLog(CFSTR("AutoLoop renderer only works for AutoLoop and Normalized-Stabilized."));
          v18 = 5;
        }
        else
        {
          if (*(_BYTE *)(a1 + 196))
            v17 = sub_1D4C63504(v12) == 0;
          else
            v17 = 0;
          v19 = sub_1D4C602FC(v12, *(double *)(a6 + 48), *(double *)(a6 + 56), (float)*(int *)(*(_QWORD *)(a1 + 240) + 28));
          v18 = sub_1D4C62A90(v12, a6, 0, v15, v17, v14, v13, v19, v20);
        }
      }
      else
      {
        v18 = 1;
      }
      v14[2](v14, 1.0);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeItemAtURL:error:", v15, 0);

    }
    else
    {
      v18 = 28;
    }

  }
  else
  {
    v18 = 5;
  }

  return v18;
}

void sub_1D4C6128C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t runPingPongRender(uint64_t a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  uint64_t (**v14)(_QWORD, float);
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  CMTime v21;
  CMTime v22;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (a6)
  {
    sub_1D4C60144(v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if ((v14[2](v14, 0.0) & 1) != 0)
      {
        if (*(_DWORD *)(a6 + 24) == 1)
        {
          v16 = sub_1D4C602FC(v12, *(double *)(a6 + 48), *(double *)(a6 + 56), (float)*(int *)(*(_QWORD *)(a1 + 240) + 28));
          v22 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
          if (*(_QWORD *)(a6 + 8) != *(_QWORD *)a6)
            v22 = *(CMTime *)(**(_QWORD **)a6 + 24);
          v21 = v22;
          v18 = sub_1D4C6C034(v12, (uint64_t *)a6, 0, v15, 0, &v21, v14, v13, v16, v17);
          if ((_DWORD)v18)
            NSLog(CFSTR("Error on alPingPongRender"));
        }
        else
        {
          NSLog(CFSTR("Called PingPong renderer for non-PingPong/Bounce recipe."));
          v18 = 5;
        }
      }
      else
      {
        v18 = 1;
      }
      v14[2](v14, 1.0);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeItemAtURL:error:", v15, 0);

    }
    else
    {
      v18 = 28;
    }

  }
  else
  {
    v18 = 5;
  }

  return v18;
}

void sub_1D4C61484(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

unint64_t renderStabilizedVideo(void *a1, void *a2, void *a3, int a4, void *a5, double a6, double a7)
{
  id v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  id v18;
  void *v19;

  v13 = a1;
  v14 = a3;
  v15 = a5;
  if (a2)
  {
    sub_1D4C60144(v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = 5;
      if (v14 && v15)
      {
        v18 = a2;
        v17 = sub_1D4C633C0(v18, v14, v16, a4, &unk_1E9863DF0, v15, a6, a7);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeItemAtURL:error:", v16, 0);

      }
    }
    else
    {
      v17 = 28;
    }

  }
  else
  {
    v17 = 5;
  }

  return v17;
}

void sub_1D4C615CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C61600()
{
  return 1;
}

void alStabilizeParamsDestroy(id a1)
{
  if (a1)

}

id alStabilizeParamsToDict(void *a1)
{
  if (a1)
  {
    objc_msgSend(a1, "infoAsDict");
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t alStabilizeParamsFromDictionary(uint64_t a1)
{
  +[StabilizeParams stabilizeParamsFromNSDictionary:](StabilizeParams, "stabilizeParamsFromNSDictionary:", a1);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t alGatingResultsDestroy(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;

    JUMPOUT(0x1D82660DCLL);
  }
  return result;
}

uint64_t extractGatingDecision(uint64_t a1)
{
  if (a1)
    return *(unsigned int *)(a1 + 4);
  else
    return 4294967294;
}

uint64_t extractGatingResult(uint64_t a1, unsigned int a2, uint64_t *a3, int *a4)
{
  uint64_t result;
  int v6;

  result = sub_1D4C5FF84(a1, a2, a3);
  if (a4)
  {
    v6 = result == -1;
    if ((_DWORD)result == -2)
      v6 = 3;
    *a4 = v6;
  }
  return result;
}

uint64_t createGatingDetailString(int a1, unint64_t a2)
{
  sub_1D4C5FC98(a1, a2);
  return objc_claimAutoreleasedReturnValue();
}

uint64_t getFlavor(uint64_t result, _DWORD *a2)
{
  if (a2)
  {
    *a2 = 0;
    if (!result)
    {
      *a2 = 1;
      return result;
    }
    return *(unsigned int *)(result + 24);
  }
  if (result)
    return *(unsigned int *)(result + 24);
  return result;
}

uint64_t alLoopRecipeDestroy(uint64_t result)
{
  if (result)
  {
    sub_1D4C63CA0();
    JUMPOUT(0x1D82660DCLL);
  }
  return result;
}

uint64_t *alLoopRecipeToDict(uint64_t *a1)
{
  if (a1)
  {
    sub_1D4C7835C(a1);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t **alLoopRecipeFromDictionary(void *a1)
{
  id v1;
  uint64_t **v2;
  uint64_t v3;

  v1 = a1;
  v2 = (uint64_t **)operator new();
  sub_1D4C6359C((uint64_t)v2);
  if ((sub_1D4C7866C(v2, v1) & 1) == 0)
  {
    v3 = sub_1D4C63CA0(v2);
    MEMORY[0x1D82660DC](v3, 0x1080C40AAA5770BLL);
    v2 = 0;
  }

  return v2;
}

void sub_1D4C617F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t createGIFFromVideo(void *a1, void *a2)
{
  return renderGIF_0(a1, a2, &unk_1E9864050);
}

uint64_t sub_1D4C6183C()
{
  return 1;
}

void *sub_1D4C61844(uint64_t a1, __int128 *a2)
{
  size_t v2;
  _DWORD *v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  float v12;
  float *v13;
  void *v14;
  qos_class_t v15;
  NSObject *global_queue;
  _QWORD v18[5];
  void *__p;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  __int128 v24;
  uint64_t v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  int v29;
  float *v30;
  float *v31;

  v2 = *((unsigned int *)a2 + 3);
  if ((_DWORD)v2)
  {
    v5 = *(_DWORD **)(a1 + 8);
    v7 = v5[6];
    v6 = v5[7];
    v8 = *((_DWORD *)a2 + 5);
    v9 = v5[17];
    v29 = 1065353216;
    sub_1D4C61F3C(&v30, v9, &v29);
    if (*(_DWORD *)(*(_QWORD *)(a1 + 8) + 64) == 875704438 && v31 != v30)
    {
      v10 = 0;
      v11 = 0;
      do
      {
        v12 = sub_1D4C82178(v11);
        v13 = v30;
        v30[v10] = v12;
        v10 = ++v11;
      }
      while (v11 < (unint64_t)(v31 - v13));
    }
    v14 = malloc_type_calloc(4 * v6 * (unint64_t)v7 * v2, 1uLL, 0x49C4D4CDuLL);
    v15 = qos_class_self();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 1174405120;
    v18[2] = sub_1D4C61A10;
    v18[3] = &unk_1E9863D60;
    v23 = v8;
    v24 = *a2;
    v25 = *((_QWORD *)a2 + 2);
    v26 = v2;
    v18[4] = a1;
    __p = 0;
    v20 = 0;
    v21 = 0;
    sub_1D4C62030(&__p, v30, (uint64_t)v31, v31 - v30);
    global_queue = dispatch_get_global_queue(v15, 0);
    v22 = v14;
    v27 = v6;
    v28 = v7;
    dispatch_apply(v2, global_queue, v18);
    if (__p)
    {
      v20 = __p;
      operator delete(__p);
    }
    if (v30)
    {
      v31 = v30;
      operator delete(v30);
    }
  }
  else
  {
    puts("createPixelDifferenceBuffer error: Fade length 0 is invalid.");
    return 0;
  }
  return v14;
}

void sub_1D4C619EC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 - 88);
  if (v3)
  {
    *(_QWORD *)(v1 - 80) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D4C61A10(uint64_t a1, unint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  _QWORD *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  _QWORD *v17;
  int v18;
  uint64_t result;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  float v34;
  int v35;
  int v36;
  BOOL v37;
  char v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  unsigned int v48;
  int v49;
  float v50;
  unint64_t v51;
  int v52;
  int v53;
  unsigned int v54;
  unsigned int v55;
  int v56;
  unsigned int v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int *v61;

  v4 = *(_DWORD *)(a1 + 72);
  if (v4 == 1)
  {
    v7 = *(unsigned int *)(a1 + 100);
    v8 = v7 >> 1;
    if (v7 >> 1 > a2)
    {
      v9 = *(_DWORD *)(a1 + 76);
      v5 = (v9 - a2);
      v6 = (v9 + a2);
      goto LABEL_9;
    }
    if ((v7 & 0xFFFFFFFE) > a2)
    {
      v10 = *(_DWORD *)(a1 + 76) + *(_DWORD *)(a1 + 80) - 1;
      v11 = a2 - v8;
      v5 = (v10 - v11);
      v6 = (v10 + v11);
      goto LABEL_9;
    }
  }
  else if (!v4)
  {
    v5 = (*(_DWORD *)(a1 + 76) + a2);
    v6 = (v5 + *(_DWORD *)(a1 + 80));
    goto LABEL_9;
  }
  v6 = 0;
  v5 = 0;
LABEL_9:
  v12 = *(_QWORD **)(a1 + 32);
  v13 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)*v12 + 16))(*v12, v5);
  v14 = v12[1];
  v15 = *(_QWORD *)(v14 + 184);
  v16 = *(_DWORD *)(v14 + 192);
  v17 = *(_QWORD **)(a1 + 32);
  v18 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)*v17 + 16))(*v17, v6);
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_DWORD *)(result + 68))
  {
    v20 = 0;
    v60 = v15 + (v16 * v13);
    v59 = *(_QWORD *)(v17[1] + 184) + (*(_DWORD *)(v17[1] + 192) * v18);
    do
    {
      v61 = (int *)sub_1D4C88E08(result, v20);
      v22 = v59;
      v21 = v60;
      if (v20)
      {
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v24 = 1;
        v21 = v60;
        do
        {
          v25 = sub_1D4C88E08(v23, v24 - 1);
          v21 += (*(_DWORD *)(v25 + 4) * *(_DWORD *)(v25 + 8));
          v37 = v20 == v24++;
        }
        while (!v37);
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v27 = 1;
        v22 = v59;
        do
        {
          v28 = sub_1D4C88E08(v26, v27 - 1);
          v22 += (*(_DWORD *)(v28 + 4) * *(_DWORD *)(v28 + 8));
          v37 = v20 == v27++;
        }
        while (!v37);
      }
      v29 = v61[1];
      if ((_DWORD)v29)
      {
        v30 = 0;
        v31 = 0;
        v32 = v61[5];
        v33 = v61[6];
        v34 = *(float *)(*(_QWORD *)(a1 + 40) + 4 * v20) * (float)(1.0 / (float)(v33 * v32));
        v35 = v61[2];
        v36 = *v61;
        v37 = v32 == 1 && v33 == 1;
        v38 = v37;
        do
        {
          if (v36)
          {
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = (v35 * v31);
            v43 = v21 + v42;
            v44 = v22 + v42;
            v45 = v61[4];
            do
            {
              v46 = 0;
              if ((_DWORD)v45)
              {
                v47 = v45;
                v48 = v40;
                do
                {
                  v49 = *(unsigned __int8 *)(v43 + v48) - *(unsigned __int8 *)(v44 + v48);
                  if (v49 < 0)
                    v49 = *(unsigned __int8 *)(v44 + v48) - *(unsigned __int8 *)(v43 + v48);
                  v46 += v49;
                  ++v48;
                  --v47;
                }
                while (v47);
              }
              v50 = v34 * (float)v46;
              if ((v38 & 1) != 0)
              {
                v51 = ((v41 + *(_DWORD *)(a1 + 104) * v31) * *(_DWORD *)(a1 + 100)) + a2;
                *(float *)(*(_QWORD *)(a1 + 64) + 4 * v51) = v50 + *(float *)(*(_QWORD *)(a1 + 64) + 4 * v51);
              }
              else if (v32)
              {
                v52 = 0;
                v53 = v30;
                do
                {
                  if (v33)
                  {
                    v54 = *(_DWORD *)(a1 + 108);
                    v55 = v39;
                    v56 = v33;
                    do
                    {
                      if (v52 + v32 * (int)v31 < v54)
                      {
                        v57 = *(_DWORD *)(a1 + 104);
                        if (v55 < v57)
                        {
                          v58 = *(_DWORD *)(a1 + 100) * (v55 + v53 * v57) + a2;
                          *(float *)(*(_QWORD *)(a1 + 64) + 4 * v58) = v50 + *(float *)(*(_QWORD *)(a1 + 64) + 4 * v58);
                        }
                      }
                      ++v55;
                      --v56;
                    }
                    while (v56);
                  }
                  ++v52;
                  ++v53;
                }
                while (v52 != v32);
              }
              ++v41;
              v40 += v45;
              v39 += v33;
            }
            while (v41 != v36);
          }
          ++v31;
          v30 += v32;
        }
        while (v31 != v29);
      }
      ++v20;
      result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    }
    while (v20 < *(unsigned int *)(result + 68));
  }
  return result;
}

_QWORD *sub_1D4C61D44(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  v2 = (_QWORD *)(a1 + 40);
  v2[2] = 0;
  return sub_1D4C62030(v2, *(const void **)(a2 + 40), *(_QWORD *)(a2 + 48), (uint64_t)(*(_QWORD *)(a2 + 48) - *(_QWORD *)(a2 + 40)) >> 2);
}

void sub_1D4C61D60(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(_QWORD *)(a1 + 48) = v2;
    operator delete(v2);
  }
}

_QWORD *sub_1D4C61D78(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _QWORD *v9;
  float *v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  float v19;
  float v20;
  int v22;
  int v23;
  uint64_t v24;
  int v25;
  __int128 v26;
  uint64_t v27;
  int v28;

  v4 = *(_DWORD *)(a2 + 20);
  v5 = *(_DWORD *)(a2 + 12);
  v6 = *(_QWORD *)(a1 + 8);
  v8 = *(_DWORD *)(v6 + 24);
  v7 = *(unsigned int *)(v6 + 28);
  v9 = (_QWORD *)operator new();
  v24 = v7;
  v23 = v8;
  v28 = 0;
  sub_1D4C61F3C(v9, (v8 * v7), &v28);
  if (v4 <= 1 && v5 != 0)
  {
    v26 = *(_OWORD *)a2;
    v27 = *(_QWORD *)(a2 + 16);
    v11 = (float *)sub_1D4C61844(a1, &v26);
    v12 = v7;
    if (v8)
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v22 = v7 * v5;
      do
      {
        v25 = v15;
        v16 = v12;
        v17 = v13;
        v18 = v14;
        if ((_DWORD)v12)
        {
          do
          {
            if (v4 == 1)
            {
              v20 = sub_1D4C731B4(v5 >> 1, &v11[v18]);
              v19 = (float)(v20 * 0.5) + (float)(sub_1D4C731B4(v5 >> 1, &v11[(v5 >> 1) + v18]) * 0.5);
            }
            else
            {
              v19 = 0.0;
              if (!v4)
                v19 = sub_1D4C731B4(v5, &v11[v18]);
            }
            *(float *)(*v9 + 4 * v17) = v19;
            v18 += v5;
            ++v17;
            --v16;
          }
          while (v16);
        }
        v15 = v25 + 1;
        v14 += v22;
        v12 = v24;
        v13 += v24;
      }
      while (v25 + 1 != v23);
    }
    if (v11)
      MEMORY[0x1D82660DC](v11, 0x1000C4052888210);
  }
  return v9;
}

void sub_1D4C61F18(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D82660DC](v1, 0x80C40D6874129);
  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C61F3C(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D4C61FBC(a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1D4C61FA0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1D4C61FBC(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    sub_1D4C590D0();
  result = (char *)sub_1D4C61FFC((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_1D4C61FFC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    sub_1D4C5919C();
  return operator new(4 * a2);
}

_QWORD *sub_1D4C62030(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = sub_1D4C61FBC(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1D4C6208C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D4C620A8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;

  *(_QWORD *)(a1 + 40) = a2;
  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(_DWORD *)(v5 + 24);
  LODWORD(v5) = *(_DWORD *)(v5 + 28);
  *(_DWORD *)(a1 + 48) = v6;
  *(_DWORD *)(a1 + 52) = v5;
  sub_1D4C624F4((_QWORD *)(a1 + 80), (v5 * v6));
  sub_1D4C624F4((_QWORD *)(a1 + 104), (*(_DWORD *)(a1 + 52) * *(_DWORD *)(a1 + 48)));
  *(_DWORD *)(a1 + 72) = a3;
  v7 = operator new();
  sub_1D4C683F0(v7, *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 64) = -1;
  *(_QWORD *)(a1 + 128) = -1;
  return a1;
}

void sub_1D4C62140(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void **v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;

  v5 = v4;
  MEMORY[0x1D82660DC](v5, 0x10F0C40DDF9AC21);
  v7 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 112) = v7;
    operator delete(v7);
  }
  v8 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 88) = v8;
    operator delete(v8);
  }
  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C6219C(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (_QWORD *)a1[4];
  if (v2)
  {
    v3 = (void *)v2[17];
    if (v3)
    {
      v2[18] = v3;
      operator delete(v3);
    }
    v4 = (void *)v2[14];
    if (v4)
    {
      v2[15] = v4;
      operator delete(v4);
    }
    v5 = (void *)v2[11];
    if (v5)
    {
      v2[12] = v5;
      operator delete(v5);
    }
    v6 = (void *)v2[8];
    if (v6)
    {
      v2[9] = v6;
      operator delete(v6);
    }
    v7 = (void *)v2[5];
    if (v7)
    {
      v2[6] = v7;
      operator delete(v7);
    }
    MEMORY[0x1D82660DC](v2, 0x10F0C40DDF9AC21);
  }
  v8 = (void *)a1[13];
  if (v8)
  {
    a1[14] = v8;
    operator delete(v8);
  }
  v9 = (void *)a1[10];
  if (v9)
  {
    a1[11] = v9;
    operator delete(v9);
  }
  return a1;
}

uint64_t sub_1D4C62250(uint64_t result, int a2, int a3)
{
  *(_DWORD *)(result + 64) = a2;
  *(_DWORD *)(result + 68) = a3;
  return result;
}

void sub_1D4C62258(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  signed int v4;
  signed int v5;
  int v8;

  v2 = *(unsigned int *)(a1 + 128);
  v3 = *(unsigned int *)(a1 + 64);
  if ((_DWORD)v2 != (_DWORD)v3)
  {
    v5 = *(_DWORD *)(a1 + 68);
LABEL_13:
    sub_1D4C81EF4(*(uint64_t **)(a1 + 40), v3, v5, (unint64_t *)(a1 + 80), (unint64_t *)(a1 + 104));
    goto LABEL_14;
  }
  v4 = *(_DWORD *)(a1 + 132);
  v5 = *(_DWORD *)(a1 + 68);
  if (v4 == v5)
    return;
  if ((_DWORD)v2 == -1 || v4 == -1 || v4 >= v5)
    goto LABEL_13;
  sub_1D4C81E90(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 132), v2, *(_DWORD *)(a1 + 68), (_QWORD *)(a1 + 80), (_QWORD *)(a1 + 104));
LABEL_14:
  sub_1D4C683F4(*(_QWORD *)(a1 + 32), a1 + 80, a1 + 104);
  sub_1D4C68684(*(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 72));
  sub_1D4C68928(*(_QWORD *)(a1 + 32), *(uint64_t **)(a1 + 40), *(unsigned int *)(a1 + 64), *(_DWORD *)(a1 + 68));
  v8 = *(_DWORD *)(a1 + 68);
  *(_DWORD *)(a1 + 128) = *(_DWORD *)(a1 + 64);
  *(_DWORD *)(a1 + 132) = v8;
}

__n128 sub_1D4C62308(uint64_t a1, unsigned int a2, float a3)
{
  __n128 result;

  sub_1D4C62258(a1);
  *(_DWORD *)a1 = sub_1D4C68870(*(_QWORD *)(a1 + 32), a2, a3);
  *(_DWORD *)(a1 + 4) = a2;
  *(float *)(a1 + 8) = a3;
  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 160);
  *(__n128 *)(a1 + 12) = result;
  return result;
}

__CFDictionary *sub_1D4C6235C(_DWORD *a1)
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  const void *v4;
  const void **v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v3 = Mutable;
  v4 = a1 + 6;
  if (*a1)
    v5 = (const void **)MEMORY[0x1E0C9AE50];
  else
    v5 = (const void **)MEMORY[0x1E0C9AE40];
  CFDictionaryAddValue(Mutable, CFSTR("levelExceeded"), *v5);
  v6 = CFNumberCreate(0, kCFNumberSInt32Type, a1 + 1);
  CFDictionaryAddValue(v3, CFSTR("levelThreshold"), v6);
  CFRelease(v6);
  v7 = CFNumberCreate(0, kCFNumberFloat32Type, a1 + 2);
  CFDictionaryAddValue(v3, CFSTR("areaThreshold"), v7);
  CFRelease(v7);
  v8 = CFNumberCreate(0, kCFNumberSInt32Type, a1 + 3);
  CFDictionaryAddValue(v3, CFSTR("runStartRow"), v8);
  CFRelease(v8);
  v9 = CFNumberCreate(0, kCFNumberSInt32Type, a1 + 4);
  CFDictionaryAddValue(v3, CFSTR("runStartCol"), v9);
  CFRelease(v9);
  v10 = CFNumberCreate(0, kCFNumberSInt32Type, a1 + 5);
  CFDictionaryAddValue(v3, CFSTR("runNumRows"), v10);
  CFRelease(v10);
  v11 = CFNumberCreate(0, kCFNumberSInt32Type, v4);
  CFDictionaryAddValue(v3, CFSTR("runNumCols"), v11);
  CFRelease(v11);
  return v3;
}

_QWORD *sub_1D4C624F4(_QWORD *a1, size_t a2)
{
  char *v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D4C62564(a1, a2);
    v4 = (char *)a1[1];
    v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_1D4C62548(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1D4C62564(_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    sub_1D4C590D0();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

_QWORD *sub_1D4C625A4(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = sub_1D4C62564(result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1D4C62600(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D4C6261C(unint64_t *a1, size_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;

  v5 = (char *)a1[1];
  v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    v6 = *a1;
    v7 = &v5[-*a1];
    v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0)
      sub_1D4C590D0();
    v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
      v11 = (unint64_t)operator new(v10);
    else
      v11 = 0;
    v12 = &v7[v11];
    v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      v11 = (unint64_t)v12;
    }
    else
    {
      v14 = &v5[~v6];
      do
      {
        v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
      operator delete(v5);
  }
}

_QWORD *sub_1D4C62744(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D4C61FBC(a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_1D4C6279C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *sub_1D4C627B8(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D4C60B88(a1, a2);
    v6 = (_QWORD *)a1[1];
    v7 = 3 * a2;
    v8 = &v6[3 * a2];
    v9 = 8 * v7;
    do
    {
      *v6 = 0;
      v6[1] = 0;
      v6[2] = 0;
      sub_1D4C62030(v6, *(const void **)a3, *(_QWORD *)(a3 + 8), (uint64_t)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3) >> 2);
      v6 += 3;
      v9 -= 24;
    }
    while (v9);
    a1[1] = v8;
  }
  return a1;
}

void sub_1D4C62850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  sub_1D4C60A70(&a9);
  _Unwind_Resume(a1);
}

void sub_1D4C62870()
{
  sub_1D4C62884("vector");
}

void sub_1D4C62884(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1D4C628D4(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E98631F0, MEMORY[0x1E0DE42E0]);
}

void sub_1D4C628C0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1D4C628D4(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

_QWORD *sub_1D4C628F8(_QWORD *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

id *sub_1D4C62900(id *a1)
{

  return a1;
}

uint64_t sub_1D4C62930(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ALGFeatInstrGlobalParams"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ALGFeatInstrFeatureList"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(void **)a1;
  *(_QWORD *)a1 = v6;

  if (*(_QWORD *)a1)
  {
    v8 = 0;
  }
  else
  {
    NSLog(CFSTR("algFeatureInstructions loadFromDict: no valid feature list key in dictionary.\n"));
    v8 = 0xFFFFFFFFLL;
  }

  return v8;
}

void sub_1D4C629B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C629C8(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a1;
  v6 = v5;
  if (!v5)
  {
    NSLog(CFSTR("unpackFeatureAtIndex error: bad or missing feature dictionary"));
LABEL_6:
    v8 = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ALGFeatId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    NSLog(CFSTR("unpackFeatureAtIndex error: bad or missing featureId key."));
    goto LABEL_6;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ALGFeatId"));
  *a2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ALGFeatParams"));
  v8 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

void sub_1D4C62A80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

unint64_t sub_1D4C62A90(void *a1, uint64_t a2, void *a3, void *a4, char a5, void *a6, void *a7, double a8, double a9)
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  double v24;
  BOOL v25;
  void *v26;
  unint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  LoopAudioComposer *v36;
  void *v37;
  unsigned int v38;
  const __CFString *v39;
  void *v40;
  unsigned int v41;
  int v42;
  void *v43;
  int v44;
  id v46;
  id v47;
  void *context;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  LoopAudioComposer *v60;
  id v61;
  uint64_t *v62;
  _QWORD *v63;
  _QWORD *v64;
  double v65;
  double v66;
  uint64_t v67;
  BOOL v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _QWORD v75[5];
  id v76;
  _QWORD v77[5];

  v17 = a1;
  v18 = a3;
  v19 = a4;
  v20 = a6;
  v21 = a7;
  v22 = v21;
  if (!v17 || !v21)
  {
    NSLog(CFSTR("alLoopRender: nil URL input"));
    v27 = 5;
    goto LABEL_32;
  }
  v51 = v21;
  v49 = v20;
  v24 = *(double *)a2;
  v23 = *(_QWORD *)(a2 + 8);
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  v77[3] = 0;
  v25 = a9 != 0.0 && a8 != 0.0;
  context = (void *)MEMORY[0x1D82662EC]();
  if (v18)
  {
    +[LoopQuicktimeMetadata metadataArrayForDictionary:](LoopQuicktimeMetadata, "metadataArrayForDictionary:", v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a5 & 1) == 0)
    {
      v27 = v26;
LABEL_11:
      v46 = v19;
      v47 = v18;
      v28 = v51;
      v50 = (void *)v27;
      goto LABEL_15;
    }
    v50 = v26;
  }
  else
  {
    v50 = 0;
    v27 = 0;
    if ((a5 & 1) == 0)
      goto LABEL_11;
  }
  if (v19)
  {
    v46 = v19;
    v47 = v18;
    v29 = v19;
    v30 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "globallyUniqueString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("%@.%s"), v32, "mov");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "URLByAppendingPathComponent:isDirectory:", v33, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    v27 = 0;
LABEL_15:
    v34 = (v23 - *(_QWORD *)&v24) >> 3;
    v75[0] = 0;
    v75[1] = v75;
    v75[2] = 0x3032000000;
    v75[3] = sub_1D4C6302C;
    v75[4] = sub_1D4C6303C;
    v76 = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x3032000000;
    v72 = sub_1D4C6302C;
    v73 = sub_1D4C6303C;
    v74 = 0;
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = sub_1D4C63044;
    v58[3] = &unk_1E9864078;
    v62 = &v69;
    v68 = v25;
    v65 = a8;
    v66 = a9;
    v35 = v28;
    v59 = v35;
    v36 = (LoopAudioComposer *)(id)v27;
    v60 = v36;
    v63 = v75;
    v20 = v49;
    v61 = v49;
    v64 = v77;
    v67 = v34;
    v37 = (void *)MEMORY[0x1D826643C](v58);
    v38 = alRender(v17, (double *)a2, v37);
    LODWORD(v27) = v38;
    if (v38)
    {
      v39 = autoloopErrorCodeToString(v38);
      NSLog(CFSTR("alLoopRender: alRender failure (%@)"), v39);
      if ((_DWORD)v27 == 1)
      {
        objc_msgSend((id)v70[5], "lastError");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v27) = sub_1D4C632CC(v40);
        v41 = 0;
        v42 = 1;
LABEL_26:

        goto LABEL_27;
      }
      v41 = 0;
      v42 = 1;
    }
    else
    {
      if ((a5 & 1) != 0)
      {
        v27 = objc_alloc_init(LoopAudioComposer);
        objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v35);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = *(_OWORD *)(a2 + 64);
        v57 = *(_QWORD *)(a2 + 80);
        v54 = *(_OWORD *)(a2 + 112);
        v55 = *(_QWORD *)(a2 + 128);
        v52 = *(_OWORD *)(a2 + 88);
        v53 = *(_QWORD *)(a2 + 104);
        v44 = objc_msgSend((id)v27, "composeLoopWithAudio:withAudioSource:startTime:fadeTime:periodTime:metadata:andOutputURL:", v43, v17, &v56, &v54, &v52, v50, v51);

        if (v44)
        {
          NSLog(CFSTR("genFadeLoop: error generating audio track"));
          v41 = 27;
        }
        else
        {
          v41 = 0;
        }

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "removeItemAtURL:error:", v35, 0);
        v42 = 0;
        goto LABEL_26;
      }
      v42 = 0;
      v41 = 0;
    }
LABEL_27:

    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(v75, 8);

    v19 = v46;
    v18 = v47;
    goto LABEL_28;
  }
  NSLog(CFSTR("genFadeLoop requires tempDir for audio option"));
  v41 = 0;
  LODWORD(v27) = 5;
  v42 = 1;
  v20 = v49;
LABEL_28:

  objc_autoreleasePoolPop(context);
  if (v42)
    v27 = v27;
  else
    v27 = v41;
  _Block_object_dispose(v77, 8);
  v22 = v51;
LABEL_32:

  return v27;
}

void sub_1D4C62F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,void *a33,void *a34)
{
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;

  _Block_object_dispose((const void *)(v39 - 232), 8);
  _Block_object_dispose((const void *)(v39 - 184), 8);

  _Block_object_dispose((const void *)(v39 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C6302C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D4C6303C(uint64_t a1)
{

}

uint64_t sub_1D4C63044(uint64_t a1, void *a2, __int128 *a3, __CVBuffer *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  int v20;
  VideoWriter *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  VideoContext *v30;
  uint64_t v31;
  void *v32;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;

  v7 = a2;
  v8 = v7;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if (*(_BYTE *)(a1 + 104))
    {
      v14 = *(double *)(a1 + 80);
      v15 = *(double *)(a1 + 88);
    }
    else
    {
      objc_msgSend(v7, "extent");
      v14 = v18;
      v15 = v19;
    }
    v20 = sub_1D4C885C8(a4);
    v21 = [VideoWriter alloc];
    v22 = v20 | 0xE00u;
    v23 = *MEMORY[0x1E0C8A2E8];
    v24 = *MEMORY[0x1E0C8AE70];
    v25 = *((unsigned int *)a3 + 2);
    v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v37[0] = *MEMORY[0x1E0C9BAA8];
    v37[1] = v26;
    v38 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    LODWORD(v34) = v22;
    v27 = -[VideoWriter initForURL:fileType:codecType:imgWidth:imgHeight:fps:timeScale:transform:pixFormat:metadata:](v21, "initForURL:fileType:codecType:imgWidth:imgHeight:fps:timeScale:transform:pixFormat:metadata:", *(_QWORD *)(a1 + 32), v23, v24, v14, v15, v25, COERCE_DOUBLE(__PAIR64__(DWORD1(v38), 30.0)), v37, v34, *(_QWORD *)(a1 + 40));
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      NSLog(CFSTR("alLoopRender: error creating VideoWriter"));
      goto LABEL_16;
    }
    v30 = -[VideoContext initWithWriter:pixelFormatFlags:colorManagement:]([VideoContext alloc], "initWithWriter:pixelFormatFlags:colorManagement:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v22, 1);
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      NSLog(CFSTR("alLoopRender: error creating VideoContext"));
      goto LABEL_16;
    }
  }
  if (v8)
  {
    if (*(_BYTE *)(a1 + 104))
    {
      sub_1D4C891D0(v8, 0, *(double *)(a1 + 80), *(double *)(a1 + 88));
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v35 = *a3;
    v36 = *((_QWORD *)a3 + 2);
    if (!objc_msgSend(v10, "appendFrame:frameTime:srcPixBuf:", v8, &v35, a4))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v12 = *(_QWORD *)(v11 + 24);
      *(_QWORD *)(v11 + 24) = v12 + 1;
      v13 = (*(uint64_t (**)(float))(*(_QWORD *)(a1 + 48) + 16))((float)v12 / (float)*(unint64_t *)(a1 + 96));
      goto LABEL_19;
    }
LABEL_16:
    v13 = 0;
    goto LABEL_19;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "finish");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v13 = v16 == 0;
  if (v16)
    NSLog(CFSTR("alLoopRender: error on [VideoWriter finish]: %@"), v16);
  else
    (*(void (**)(float))(*(_QWORD *)(a1 + 48) + 16))(1.0);

  v8 = 0;
LABEL_19:

  return v13;
}

void sub_1D4C632AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C632CC(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "code");
    if (v3 == -11823)
    {
      v4 = 31;
    }
    else
    {
      objc_msgSend(v2, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
          v3 = objc_msgSend(v7, "code");

      }
      if (v3 == -11823)
        v9 = 31;
      else
        v9 = 29;
      if (v3 == -12915)
        v4 = 30;
      else
        v4 = v9;

    }
  }
  else
  {
    v4 = 29;
  }

  return v4;
}

void sub_1D4C63394(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

unint64_t sub_1D4C633C0(void *a1, void *a2, void *a3, int a4, void *a5, void *a6, double a7, double a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  unint64_t v21;
  char v22;
  _BYTE v24[144];

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = v19;
  v21 = 5;
  if (v15 && v16 && v19)
  {
    sub_1D4C6359C((uint64_t)v24);
    sub_1D4C63F34((uint64_t)v24, v15, -2);
    if (a4)
      v22 = sub_1D4C63504(v16) == 0;
    else
      v22 = 0;
    v21 = sub_1D4C62A90(v16, (uint64_t)v24, 0, v17, v22, v18, v20, a7, a8);
    sub_1D4C63CA0(v24);
  }

  return v21;
}

void sub_1D4C634D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  sub_1D4C63CA0(&a9);

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C63504(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "tracksWithMediaType:", *MEMORY[0x1E0C8A7A0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      v5 = 8 * (objc_msgSend(v3, "count") == 0);
    else
      v5 = 8;

  }
  else
  {
    v5 = 5;
  }

  return v5;
}

void sub_1D4C63580(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double sub_1D4C6359C(uint64_t a1)
{
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  double result;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  v1 = MEMORY[0x1E0CA2E10];
  v2 = *MEMORY[0x1E0CA2E10];
  *(_OWORD *)(a1 + 64) = *MEMORY[0x1E0CA2E10];
  v3 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(a1 + 80) = v3;
  *(_OWORD *)(a1 + 88) = v2;
  *(_QWORD *)(a1 + 104) = v3;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 136) = 0;
  *(_OWORD *)(a1 + 112) = v2;
  result = NAN;
  *(_QWORD *)(a1 + 24) = 0xFFFFFFFE00000000;
  return result;
}

uint64_t sub_1D4C635DC(uint64_t a1, uint64_t a2, float *a3)
{
  __int128 v6;
  unint64_t v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  __int128 v11;
  CMTime v13;
  CMTime time;
  CMTime v15;
  CMTime v16;

  if (a2)
  {
    *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 56);
    *(float *)(a1 + 24) = a3[5];
    v6 = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 48) = v6;
    v16 = *(CMTime *)a2;
    v7 = *(unsigned int *)a3;
    v8 = *(_QWORD *)(a2 + 64);
    if (v7 >= (*(_QWORD *)(a2 + 72) - v8) >> 3)
      v9 = (__int128 *)MEMORY[0x1E0CA2E18];
    else
      v9 = *(__int128 **)(v8 + 8 * v7);
    v11 = *v9;
    *(_QWORD *)(a1 + 80) = *((_QWORD *)v9 + 2);
    *(_OWORD *)(a1 + 64) = v11;
    time = v16;
    CMTimeMultiply(&v15, &time, *((_DWORD *)a3 + 1));
    *(CMTime *)(a1 + 88) = v15;
    v13 = v16;
    CMTimeMultiply(&v15, &v13, *((_DWORD *)a3 + 2));
    *(CMTime *)(a1 + 112) = v15;
    v10 = sub_1D4C63710(a1, a2, a3);
    if ((v10 & 1) == 0)
      NSLog(CFSTR("alLoopRecipe error: error in createLoopFrameInstructions.\n"));
  }
  else
  {
    NSLog(CFSTR("alLoopRecipe error: missing normStabRecipe."));
    return 0;
  }
  return v10;
}

uint64_t sub_1D4C63710(uint64_t a1, uint64_t a2, float *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  _QWORD *v10;
  float *v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  int v17;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  _DWORD *v22;
  uint64_t v23;
  _DWORD *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float v29;
  unsigned int v30;
  float v31;
  int v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  int v38;
  unint64_t v39;
  int v40;
  int v41;
  unint64_t v42;
  unsigned int v43;
  float v44;
  CMTime v46;
  CMTime v47;
  CMTime v48;
  void *__p;
  void *v50;
  float *v51;
  void *v52;
  void *v53;
  _QWORD *v54;
  CMTime time;
  CMTime v56;
  CMTime v57;
  float __src;
  float v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0;
  v44 = *a3;
  v4 = *((unsigned int *)a3 + 2);
  v42 = *((unsigned int *)a3 + 1);
  sub_1D4C649A8(&v57, v42);
  v5 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v5;
    operator delete(v5);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
  *(CMTime *)a1 = v57;
  v57 = *(CMTime *)a2;
  if ((_DWORD)v4)
  {
    v6 = 0;
    v7 = v42 - v4;
    LODWORD(v8) = 1;
    do
    {
      v9 = v7 + v6;
      memset(&v56, 0, sizeof(v56));
      time = v57;
      CMTimeMultiply(&v56, &time, v7 + v6);
      v10 = operator new(8uLL);
      *v10 = (LODWORD(v44) + v6) | ((unint64_t)(v42 + LODWORD(v44) + v6) << 32);
      v53 = v10 + 1;
      v54 = v10 + 1;
      v52 = v10;
      v11 = (float *)operator new(8uLL);
      v12 = (float)(v6 + 1) / (float)(v4 + 1);
      v50 = v11 + 2;
      v51 = v11 + 2;
      *v11 = v12;
      v11[1] = 1.0 - v12;
      __p = v11;
      v13 = operator new();
      v14 = MEMORY[0x1E0CA2E10];
      v15 = *MEMORY[0x1E0CA2E10];
      *(_OWORD *)v13 = *MEMORY[0x1E0CA2E10];
      v16 = *(_QWORD *)(v14 + 16);
      *(_QWORD *)(v13 + 16) = v16;
      *(_OWORD *)(v13 + 24) = v15;
      *(_QWORD *)(v13 + 40) = v16;
      *(_OWORD *)(v13 + 48) = 0u;
      *(_OWORD *)(v13 + 64) = 0u;
      *(_OWORD *)(v13 + 80) = 0u;
      *(_OWORD *)(v13 + 96) = 0u;
      *(_OWORD *)(v13 + 105) = 0u;
      v48 = v56;
      ++v6;
      v8 = sub_1D4C63CA4(v13, (__int128 *)a2, (uint64_t *)&v52, &__p, (__int128 *)&v48.value, 0) & v8;
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = v13;
      operator delete(v11);
      operator delete(v10);
    }
    while (v4 != v6);
    v17 = v42;
  }
  else
  {
    v17 = v42;
    v7 = v42;
    v8 = 1;
  }
  if (v17 != (_DWORD)v4)
  {
    v19 = 0;
    v43 = v17 + LODWORD(v44) + v4;
    v20 = &v60;
    v21 = v7;
    do
    {
      memset(&v56, 0, sizeof(v56));
      v47 = v57;
      CMTimeMultiply(&v56, &v47, v19);
      v22 = operator new(4uLL);
      v23 = (v4 + LODWORD(v44) + v19);
      v52 = v22;
      *v22 = v23;
      v53 = v22 + 1;
      v54 = v22 + 1;
      v24 = operator new(4uLL);
      __p = v24;
      *v24 = 1065353216;
      v50 = v24 + 1;
      v51 = (float *)(v24 + 1);
      v25 = *(_QWORD *)(a2 + 64);
      v26 = (*(_QWORD *)(a2 + 72) - v25) >> 3;
      if (v26 > v23 && (v27 = *(_QWORD *)(*(_QWORD *)(v25 + 8 * v23) + 48)) != 0 && *(_BYTE *)v27)
      {
        v28 = (uint64_t)v20;
        v29 = *(float *)(v27 + 4);
        v30 = *(_DWORD *)(v27 + 8);
        if (LODWORD(v29) <= LODWORD(v44))
          v31 = v44;
        else
          v31 = *(float *)(v27 + 4);
        while (LODWORD(v31) != LODWORD(v29))
        {
          ++LODWORD(v29);
          if (--v30 <= 1)
          {
            v32 = 0;
            v31 = v29;
            goto LABEL_30;
          }
        }
        v32 = 1;
LABEL_30:
        v39 = v30 + LODWORD(v31);
        if (v39 <= v43)
          v40 = v32;
        else
          v40 = 0;
        if (v26 <= v39)
          v41 = 0;
        else
          v41 = v40;
        if (v41)
        {
          __src = v31;
          LODWORD(v59) = v30 + LODWORD(v31);
          sub_1D4C64444((char *)&v52, (char *)&__src, v28, 2uLL);
          __src = (float)(v39 - v23) / (float)v30;
          v59 = 1.0 - __src;
          sub_1D4C64444((char *)&__p, (char *)&__src, v28, 2uLL);
        }
        v33 = v41 != 0;
        v20 = (uint64_t *)v28;
        v21 = v7;
      }
      else
      {
        v33 = 0;
      }
      v34 = operator new();
      v35 = MEMORY[0x1E0CA2E10];
      v36 = *MEMORY[0x1E0CA2E10];
      *(_OWORD *)v34 = *MEMORY[0x1E0CA2E10];
      v37 = *(_QWORD *)(v35 + 16);
      *(_QWORD *)(v34 + 16) = v37;
      *(_OWORD *)(v34 + 24) = v36;
      *(_QWORD *)(v34 + 40) = v37;
      *(_OWORD *)(v34 + 48) = 0u;
      *(_OWORD *)(v34 + 64) = 0u;
      *(_OWORD *)(v34 + 80) = 0u;
      *(_OWORD *)(v34 + 96) = 0u;
      *(_OWORD *)(v34 + 105) = 0u;
      v46 = v56;
      v38 = sub_1D4C63CA4(v34, (__int128 *)a2, (uint64_t *)&v52, &__p, (__int128 *)&v46.value, v33);
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v19) = v34;
      if (__p)
      {
        v50 = __p;
        operator delete(__p);
      }
      if (v52)
      {
        v53 = v52;
        operator delete(v52);
      }
      v8 = v38 & v8;
      ++v19;
    }
    while (v19 != v21);
  }
  return v8;
}

void sub_1D4C63B84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,uint64_t a27,void *a28,uint64_t a29)
{
  if (__p)
    operator delete(__p);
  if (a28)
    operator delete(a28);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D4C63BE4(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void **v10;

  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD **)(a1 + 8);
  if (v3 == v2)
  {
    v2 = v3;
    if (!v3)
      return a1;
    goto LABEL_11;
  }
  v5 = 0;
  do
  {
    v6 = v2[v5];
    if (v6)
    {
      v7 = *(void **)(v6 + 96);
      if (v7)
      {
        *(_QWORD *)(v6 + 104) = v7;
        operator delete(v7);
      }
      v10 = (void **)(v6 + 72);
      sub_1D4C60A70(&v10);
      v8 = *(void **)(v6 + 48);
      if (v8)
      {
        *(_QWORD *)(v6 + 56) = v8;
        operator delete(v8);
      }
      MEMORY[0x1D82660DC](v6, 0x10A0C4091D32064);
      v2 = *(_QWORD **)a1;
      v3 = *(_QWORD **)(a1 + 8);
    }
    ++v5;
  }
  while (v5 < v3 - v2);
  if (v2)
  {
LABEL_11:
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

uint64_t sub_1D4C63CA4(uint64_t a1, __int128 *a2, uint64_t *a3, _QWORD *a4, __int128 *a5, char a6)
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  char v20;
  uint64_t v21;
  unsigned int v22;
  unint64_t v23;
  uint64_t v24;
  __int128 *v25;
  uint64_t v26;
  __int128 v27;
  char *v28;
  int v31;
  void *__p[3];
  __int128 v33;
  uint64_t v34;
  void **v35;

  v11 = *a3;
  v10 = a3[1];
  v12 = (v10 - *a3) >> 2;
  *(_BYTE *)(a1 + 120) = a6;
  v13 = *a5;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a5 + 2);
  *(_OWORD *)a1 = v13;
  if (a2)
  {
    v33 = *a2;
    v14 = *((_QWORD *)a2 + 2);
  }
  else
  {
    v33 = *MEMORY[0x1E0CA2E18];
    v14 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  }
  v34 = v14;
  *(_OWORD *)(a1 + 24) = v33;
  *(_QWORD *)(a1 + 40) = v14;
  sub_1D4C64380(&v33, v12, MEMORY[0x1E0CA2E18]);
  v16 = (_QWORD *)(a1 + 48);
  v15 = *(void **)(a1 + 48);
  if (v15)
  {
    *(_QWORD *)(a1 + 56) = v15;
    operator delete(v15);
    *v16 = 0;
    *(_QWORD *)(a1 + 56) = 0;
    *(_QWORD *)(a1 + 64) = 0;
  }
  *(_OWORD *)(a1 + 48) = v33;
  *(_QWORD *)(a1 + 64) = v34;
  v31 = 0;
  sub_1D4C61F3C(__p, 9uLL, &v31);
  sub_1D4C627B8(&v33, v12, (uint64_t)__p);
  sub_1D4C6440C((uint64_t *)(a1 + 72));
  *(_OWORD *)(a1 + 72) = v33;
  *(_QWORD *)(a1 + 88) = v34;
  v34 = 0;
  v33 = 0uLL;
  v35 = (void **)&v33;
  sub_1D4C60A70(&v35);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v17 = v10;
  LODWORD(__p[0]) = 0;
  sub_1D4C61F3C(&v33, v12, __p);
  v19 = (_QWORD *)(a1 + 96);
  v18 = *(void **)(a1 + 96);
  if (v18)
  {
    *(_QWORD *)(a1 + 104) = v18;
    operator delete(v18);
    *v19 = 0;
    *(_QWORD *)(a1 + 104) = 0;
    *(_QWORD *)(a1 + 112) = 0;
  }
  v20 = 0;
  *(_OWORD *)(a1 + 96) = v33;
  *(_QWORD *)(a1 + 112) = v34;
  if (a2 && (uint64_t)(a4[1] - *a4) >> 2 == v12)
  {
    if (v17 == v11)
    {
      v20 = 1;
    }
    else
    {
      v21 = 0;
      v22 = 1;
      v20 = 1;
      do
      {
        v23 = *(unsigned int *)(*a3 + 4 * v21);
        v24 = *((_QWORD *)a2 + 8);
        if (v23 < (*((_QWORD *)a2 + 9) - v24) >> 3 && (v25 = *(__int128 **)(v24 + 8 * v23)) != 0)
        {
          v26 = *v16 + 24 * v21;
          v27 = *v25;
          *(_QWORD *)(v26 + 16) = *((_QWORD *)v25 + 2);
          *(_OWORD *)v26 = v27;
          v28 = (char *)(*(_QWORD *)(a1 + 72) + 24 * v21);
          if (v28 != (char *)v25 + 24)
            sub_1D4C64444(v28, *((char **)v25 + 3), *((_QWORD *)v25 + 4), (uint64_t)(*((_QWORD *)v25 + 4) - *((_QWORD *)v25 + 3)) >> 2);
        }
        else
        {
          printf("alLoopFrameInstruction::initializeLoopFrameInstruction error, output frame %d, norm index %d.\n", v22 - 1, v23);
          v20 = 0;
        }
        *(_DWORD *)(*v19 + 4 * v21) = *(_DWORD *)(*a4 + 4 * v21);
        v21 = v22;
      }
      while (v12 > v22++);
    }
  }
  return v20 & 1;
}

void sub_1D4C63F18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_1D4C63F34(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  __int128 *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  void **v21;
  _OWORD *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  CMTimeEpoch epoch;
  void *v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v33;
  CMTime v34;
  CMTime v35;
  CMTime v36;
  CMTime __p;
  CMTime v38;
  CMTime v39;
  CMTime v40;
  CMTime v41;
  CMTime rhs;
  CMTime lhs;
  CMTime v44;
  __int128 v45;
  uint64_t v46;
  CMTime v47;

  v5 = a2;
  v6 = v5;
  *(_DWORD *)(a1 + 24) = 3;
  *(_DWORD *)(a1 + 28) = a3;
  if (v5)
  {
    objc_msgSend(v5, "cropRect");
    *(_QWORD *)(a1 + 32) = v7;
    *(_QWORD *)(a1 + 40) = v8;
    *(_QWORD *)(a1 + 48) = v9;
    *(_QWORD *)(a1 + 56) = v10;
    objc_msgSend(v6, "roiStart");
    *(_OWORD *)(a1 + 64) = v45;
    *(_QWORD *)(a1 + 80) = v46;
    objc_msgSend(v6, "roiLength");
    *(_OWORD *)(a1 + 88) = v45;
    *(_QWORD *)(a1 + 104) = v46;
    v11 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)(a1 + 112) = *MEMORY[0x1E0CA2E68];
    *(_QWORD *)(a1 + 128) = *(_QWORD *)(v11 + 16);
    v12 = objc_msgSend(v6, "numFrames");
    v33 = v12;
    sub_1D4C649A8(&v45, v12);
    v13 = *(void **)a1;
    if (*(_QWORD *)a1)
    {
      *(_QWORD *)(a1 + 8) = v13;
      operator delete(v13);
      *(_QWORD *)a1 = 0;
      *(_QWORD *)(a1 + 8) = 0;
      *(_QWORD *)(a1 + 16) = 0;
    }
    *(_OWORD *)a1 = v45;
    *(_QWORD *)(a1 + 16) = v46;
    if (v12)
    {
      v14 = 0;
      v15 = v12 - 1;
      v16 = (__int128 *)MEMORY[0x1E0CA2E10];
      v17 = 24;
      while (1)
      {
        objc_msgSend(v6, "getFrameInfo:frameInfo:", v14, &v45);
        v18 = operator new();
        v19 = *v16;
        *(_OWORD *)v18 = *v16;
        v20 = *((_QWORD *)v16 + 2);
        *(_QWORD *)(v18 + 16) = v20;
        *(_OWORD *)(v18 + 24) = v19;
        *(_QWORD *)(v18 + 40) = v20;
        *(_OWORD *)(v18 + 48) = 0u;
        v21 = (void **)(v18 + 48);
        *(_OWORD *)(v18 + 64) = 0u;
        *(_OWORD *)(v18 + 80) = 0u;
        *(_OWORD *)(v18 + 96) = 0u;
        *(_OWORD *)(v18 + 105) = 0u;
        lhs = v47;
        objc_msgSend(v6, "roiStart");
        CMTimeSubtract(&v44, &lhs, &rhs);
        v22 = (_OWORD *)(v18 + 24);
        *(CMTime *)v18 = v44;
        if (v14 < v15)
          break;
        if (v15 == v14)
        {
          memset(&v44, 0, sizeof(v44));
          objc_msgSend(v6, "roiStart");
          objc_msgSend(v6, "roiLength");
          CMTimeAdd(&v44, &v39, &v38);
          __p = *(CMTime *)(*(_QWORD *)objc_msgSend(v6, "frameTimes") + 24 * v15);
          v35 = v44;
          v34 = __p;
          CMTimeSubtract(&v36, &v35, &v34);
          *v22 = *(_OWORD *)&v36.value;
          epoch = v36.epoch;
          goto LABEL_10;
        }
LABEL_11:
        sub_1D4C64A5C(&v44, 1uLL);
        v28 = *v21;
        if (*v21)
        {
          *(_QWORD *)(v18 + 56) = v28;
          operator delete(v28);
          *v21 = 0;
          *(_QWORD *)(v18 + 56) = 0;
          *(_QWORD *)(v18 + 64) = 0;
        }
        *(CMTime *)(v18 + 48) = v44;
        sub_1D4C62744(&__p, 9uLL);
        sub_1D4C627B8(&v44, 1uLL, (uint64_t)&__p);
        sub_1D4C6440C((uint64_t *)(v18 + 72));
        *(CMTime *)(v18 + 72) = v44;
        memset(&v44, 0, sizeof(v44));
        v36.value = (CMTimeValue)&v44;
        sub_1D4C60A70((void ***)&v36);
        if (__p.value)
        {
          *(_QWORD *)&__p.timescale = __p.value;
          operator delete((void *)__p.value);
        }
        sub_1D4C62744(&v44, 1uLL);
        v29 = *(void **)(v18 + 96);
        if (v29)
        {
          *(_QWORD *)(v18 + 104) = v29;
          operator delete(v29);
          *(_QWORD *)(v18 + 96) = 0;
          *(_QWORD *)(v18 + 104) = 0;
          *(_QWORD *)(v18 + 112) = 0;
        }
        *(CMTime *)(v18 + 96) = v44;
        v30 = *(_QWORD *)(v18 + 48);
        v31 = *(_OWORD *)&v47.value;
        *(_QWORD *)(v30 + 16) = v47.epoch;
        *(_OWORD *)v30 = v31;
        sub_1D4C83298(*(uint64_t **)(v18 + 72), (uint64_t)&v45);
        **(_DWORD **)(v18 + 96) = 1065353216;
        *(_QWORD *)(*(_QWORD *)a1 + 8 * v14++) = v18;
        v17 += 24;
        if (v33 == v14)
          goto LABEL_20;
      }
      v23 = *(_QWORD *)objc_msgSend(v6, "frameTimes") + v17;
      v24 = *(_OWORD *)v23;
      v41.epoch = *(_QWORD *)(v23 + 16);
      *(_OWORD *)&v41.value = v24;
      v25 = *(_QWORD *)objc_msgSend(v6, "frameTimes") + v17;
      v26 = *(_OWORD *)(v25 - 24);
      v40.epoch = *(_QWORD *)(v25 - 8);
      *(_OWORD *)&v40.value = v26;
      CMTimeSubtract(&v44, &v41, &v40);
      *v22 = *(_OWORD *)&v44.value;
      epoch = v44.epoch;
LABEL_10:
      *(_QWORD *)(v18 + 40) = epoch;
      goto LABEL_11;
    }
  }
  else
  {
    NSLog(CFSTR("prepareRecipeFromStabilizeParams error: missing stabParams."));
  }
LABEL_20:

  return v6 != 0;
}

void sub_1D4C6431C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  void *v22;

  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C64380(_QWORD *a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D4C60B88(a1, a2);
    v6 = a1[1];
    v7 = v6 + 24 * a2;
    v8 = 24 * a2;
    do
    {
      v9 = *a3;
      *(_QWORD *)(v6 + 16) = *((_QWORD *)a3 + 2);
      *(_OWORD *)v6 = v9;
      v6 += 24;
      v8 -= 24;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1D4C643F0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D4C6440C(uint64_t *a1)
{
  if (*a1)
  {
    sub_1D4C60AB0(a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *sub_1D4C64444(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 2)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62)
      sub_1D4C590D0();
    v10 = v8 >> 1;
    if (v8 >> 1 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
      v11 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = sub_1D4C61FBC(v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 2;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

char *sub_1D4C6454C(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void **v13;
  char *v14;
  _BYTE *v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - *(_QWORD *)result) >> 3) < a4)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      sub_1D4C590D0();
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v11;
    result = sub_1D4C60B88(v7, v12);
    v14 = (char *)v7[1];
    v13 = (void **)(v7 + 1);
    v9 = v14;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v13 = (void **)(result + 8);
  v15 = (_BYTE *)*((_QWORD *)result + 1);
  if (0xAAAAAAAAAAAAAAABLL * ((v15 - v9) >> 3) >= a4)
    goto LABEL_16;
  v16 = &__src[8 * ((v15 - v9) >> 3)];
  if (v15 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v15 - v9);
    v9 = (char *)*v13;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v13 = &v9[v17];
  return result;
}

void sub_1D4C64684(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  char v21;

  v8 = a1 + 16;
  v9 = *(char **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) < a4)
  {
    sub_1D4C6440C((uint64_t *)a1);
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      sub_1D4C590D0();
    v10 = 0x5555555555555556 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3);
    if (v10 <= a4)
      v10 = a4;
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v10;
    sub_1D4C60B88((_QWORD *)a1, v11);
    v12 = sub_1D4C6480C(v8, a2, a3, *(_QWORD **)(a1 + 8));
    goto LABEL_11;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 3) < a4)
  {
    v13 = a2 + 8 * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 3);
    sub_1D4C6493C((int)&v20, a2, v13, v9);
    v12 = sub_1D4C6480C(v8, v13, a3, *(_QWORD **)(a1 + 8));
LABEL_11:
    *(_QWORD *)(a1 + 8) = v12;
    return;
  }
  sub_1D4C6493C((int)&v21, a2, a3, v9);
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 8);
  if (v16 != v14)
  {
    v17 = *(_QWORD *)(a1 + 8);
    do
    {
      v19 = *(void **)(v17 - 24);
      v17 -= 24;
      v18 = v19;
      if (v19)
      {
        *(_QWORD *)(v16 - 16) = v18;
        operator delete(v18);
      }
      v16 = v17;
    }
    while (v17 != v15);
  }
  *(_QWORD *)(a1 + 8) = v15;
}

void sub_1D4C647FC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1D4C64804(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C6480C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  _QWORD *v10;
  _QWORD *v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *v4 = 0;
      v4[1] = 0;
      v4[2] = 0;
      sub_1D4C62030(v4, *(const void **)v6, *(_QWORD *)(v6 + 8), (uint64_t)(*(_QWORD *)(v6 + 8) - *(_QWORD *)v6) >> 2);
      v4 = v11 + 3;
      v11 += 3;
      v6 += 24;
    }
    while (v6 != a3);
  }
  v9 = 1;
  sub_1D4C648BC((uint64_t)v8);
  return v4;
}

void sub_1D4C648A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1D4C648BC((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C648BC(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1D4C648F0(a1);
  return a1;
}

void sub_1D4C648F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  if (v1 != v2)
  {
    v3 = **(_QWORD **)(a1 + 16);
    do
    {
      v5 = *(void **)(v3 - 24);
      v3 -= 24;
      v4 = v5;
      if (v5)
      {
        *(_QWORD *)(v1 - 16) = v4;
        operator delete(v4);
      }
      v1 = v3;
    }
    while (v3 != v2);
  }
}

uint64_t sub_1D4C6493C(int a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v5;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if ((char *)v5 != a4)
        sub_1D4C64444(a4, *(char **)v5, *(_QWORD *)(v5 + 8), (uint64_t)(*(_QWORD *)(v5 + 8) - *(_QWORD *)v5) >> 2);
      v5 += 24;
      a4 += 24;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

_QWORD *sub_1D4C649A8(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D4C64A1C(a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1D4C64A00(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1D4C64A1C(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    sub_1D4C590D0();
  result = (char *)sub_1D4C60BD8((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

_QWORD *sub_1D4C64A5C(_QWORD *a1, unint64_t a2)
{
  char *v4;
  size_t v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D4C60B88(a1, a2);
    v4 = (char *)a1[1];
    v5 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_1D4C64AD8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

double sub_1D4C64AF4(uint64_t a1)
{
  double result;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = CFSTR("Unknown");
  *(_QWORD *)(a1 + 88) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 41) = 0u;
  *(_QWORD *)(a1 + 60) = 0;
  *(_QWORD *)(a1 + 76) = 0;
  *(_QWORD *)(a1 + 68) = 0;
  *(_DWORD *)(a1 + 96) = -2;
  *(_QWORD *)(a1 + 104) = 0;
  v2 = MEMORY[0x1E0CA2E18];
  v3 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)(a1 + 112) = *MEMORY[0x1E0CA2E18];
  v4 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(a1 + 128) = v4;
  *(_QWORD *)(a1 + 152) = v4;
  *(_OWORD *)(a1 + 136) = v3;
  *(_QWORD *)(a1 + 176) = v4;
  *(_OWORD *)(a1 + 160) = v3;
  *(_QWORD *)(a1 + 200) = v4;
  *(_OWORD *)(a1 + 184) = v3;
  *(_DWORD *)(a1 + 208) = -1;
  *(_QWORD *)(a1 + 216) = 0;
  *(_QWORD *)(a1 + 224) = 0;
  *(_QWORD *)(a1 + 304) = 0;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  return result;
}

uint64_t sub_1D4C64B74(uint64_t a1)
{
  return *(unsigned int *)(a1 + 96);
}

uint64_t sub_1D4C64B7C(uint64_t a1)
{
  uint64_t **v2;
  uint64_t result;
  __int128 v4;
  uint64_t v5;

  if ((*(_BYTE *)a1 & 4) == 0)
    return 0xFFFFFFFFLL;
  v2 = *(uint64_t ***)(a1 + 48);
  if (!v2 || !*(_BYTE *)(a1 + 56))
    return 0xFFFFFFFFLL;
  sub_1D4C815E8(v2, (unsigned int *)(a1 + 60), (uint64_t)&v4);
  result = 0;
  *(_OWORD *)(a1 + 112) = v4;
  *(_QWORD *)(a1 + 128) = v5;
  return result;
}

uint64_t sub_1D4C64BE0(uint64_t a1)
{
  _QWORD **v2;
  _QWORD *v3;
  uint64_t result;

  if ((*(_BYTE *)a1 & 4) == 0)
    return 0xFFFFFFFFLL;
  v2 = *(_QWORD ***)(a1 + 48);
  if (!v2 || !*(_BYTE *)(a1 + 56))
    return 0xFFFFFFFFLL;
  v3 = sub_1D4C81424(v2, (__int128 *)(a1 + 60));
  result = 0;
  *(_QWORD *)(a1 + 216) = v3;
  return result;
}

uint64_t sub_1D4C64C30(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t result;

  if ((*(_BYTE *)a1 & 4) == 0)
    return 0xFFFFFFFFLL;
  v2 = *(_QWORD **)(a1 + 48);
  if (!v2 || !*(_BYTE *)(a1 + 56))
    return 0xFFFFFFFFLL;
  v3 = sub_1D4C81798(v2, (int *)(a1 + 60));
  result = 0;
  *(_QWORD *)(a1 + 240) = v3;
  return result;
}

uint64_t sub_1D4C64C80(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v6;

  v2 = *(_QWORD *)(a1 + 248);
  if (!v2)
  {
    if ((*(_BYTE *)a1 & 4) == 0 || !*(_QWORD *)(a1 + 48) || !*(_BYTE *)(a1 + 56))
      return 0xFFFFFFFFLL;
    v6 = (_QWORD *)operator new();
    v6[1] = 0;
    v6[2] = 0;
    *v6 = 0;
    *(_QWORD *)(a1 + 248) = v6;
    sub_1D4C819D8(*(_QWORD **)(a1 + 48), a2, (int *)(a1 + 60), v6);
    v2 = *(_QWORD *)(a1 + 248);
  }
  if (v2)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t sub_1D4C64D10(uint64_t a1)
{
  if ((*(_BYTE *)a1 & 4) == 0 || !*(_QWORD *)(a1 + 48) || !*(_BYTE *)(a1 + 56))
    return 0xFFFFFFFFLL;
  sub_1D4C64B7C(a1);
  sub_1D4C64BE0(a1);
  sub_1D4C64C30(a1);
  return 0;
}

float sub_1D4C64D68(uint64_t a1, void *a2, int *a3)
{
  id v5;
  int v6;
  float v7;

  v5 = a2;
  if (*(_BYTE *)(a1 + 80))
  {
    v6 = *a3;
  }
  else
  {
    v6 = sub_1D4C7A8F0(a1 + 24, a1 + 80);
    *a3 = v6;
  }
  v7 = 0.0;
  if (!v6)
  {
    if (*(_BYTE *)(a1 + 80))
      v7 = sub_1D4C7A800((float *)(a1 + 80), v5, a3);
    else
      *a3 = -1;
  }

  return v7;
}

void sub_1D4C64DFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t *sub_1D4C64E0C(uint64_t *a1, uint64_t a2, int a3, int a4)
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;
  id v12;
  void *__p;
  _BYTE *v14;
  void *v15;
  id v16;
  __int128 v17;
  void *v18[4];
  void *v19;
  void *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  sub_1D4C67400(&v17);
  v24 = 0;
  v23 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v19 = 0;
  v16 = 0;

  sub_1D4C675A0((uint64_t)&v11, a2, a3, a4);
  *(_QWORD *)&v17 = v11;
  objc_storeStrong((id *)&v17 + 1, v12);
  sub_1D4C64444((char *)v18, (char *)__p, (uint64_t)v14, (v14 - (_BYTE *)__p) >> 2);
  v18[3] = v15;
  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }

  v8 = a1[1];
  if (v8 >= a1[2])
  {
    v9 = sub_1D4C677E8(a1, (uint64_t)&v16);
  }
  else
  {
    sub_1D4C6790C((uint64_t)(a1 + 2), (__n128 *)a1[1], (uint64_t)&v16);
    v9 = v8 + 104;
    a1[1] = v8 + 104;
  }
  a1[1] = v9;
  if (v19)
  {
    v20 = v19;
    operator delete(v19);
  }
  if (v18[0])
  {
    v18[1] = v18[0];
    operator delete(v18[0]);
  }

  return a1;
}

void sub_1D4C64F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  sub_1D4C64FD8((uint64_t)va);
  sub_1D4C6771C((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C64FA0(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    *(_QWORD *)(a1 + 24) = v2;
    operator delete(v2);
  }

  return a1;
}

uint64_t sub_1D4C64FD8(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 56);
  if (v2)
  {
    *(_QWORD *)(a1 + 64) = v2;
    operator delete(v2);
  }
  v3 = *(void **)(a1 + 24);
  if (v3)
  {
    *(_QWORD *)(a1 + 32) = v3;
    operator delete(v3);
  }

  return a1;
}

float sub_1D4C65028(uint64_t *a1, void *a2, int *a3)
{
  id v5;
  uint64_t v6;
  __int128 v7;
  float v8;
  id v10;
  id v11[2];
  void *v12;
  void *v13;
  void *__p;
  void *v15;
  uint64_t v16;
  __int128 v17;
  int v18;

  v5 = a2;
  v6 = *a1;
  if (a1[1] == *a1)
  {
    puts("algProcImage:: Must initialize with input image before calling process.");
    *a3 = -1;
    v8 = 0.0;
  }
  else
  {
    v10 = *(id *)v6;
    sub_1D4C676AC((uint64_t)v11, v6 + 8);
    __p = 0;
    v15 = 0;
    v16 = 0;
    sub_1D4C67C30(&__p, *(const void **)(v6 + 56), *(_QWORD *)(v6 + 64), (uint64_t)(*(_QWORD *)(v6 + 64) - *(_QWORD *)(v6 + 56)) >> 3);
    v7 = *(_OWORD *)(v6 + 80);
    v18 = *(_DWORD *)(v6 + 96);
    v17 = v7;
    v8 = sub_1D4C64D68((uint64_t)&v10, v5, a3);
    if (__p)
    {
      v15 = __p;
      operator delete(__p);
    }
    if (v12)
    {
      v13 = v12;
      operator delete(v12);
    }

  }
  return v8;
}

void sub_1D4C65130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  void *v14;

  sub_1D4C64FD8((uint64_t)&a10);

  _Unwind_Resume(a1);
}

float sub_1D4C65178(uint64_t *a1, void *a2, void *a3, int *a4)
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  unsigned int v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  uint64_t *v32;
  uint64_t **v33;
  uint64_t *v34;
  void **v35;
  uint64_t *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t *v42;
  uint64_t v43;
  void *v45;
  int *v46;
  char v47;
  void *__p;
  __int128 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;

  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a1[1] == *a1)
  {
    puts("algProcImage:: Must initialize with input image before calling process.");
    *a4 = -1;
    v18 = 0.0;
  }
  else
  {
    if (v7)
    {
      v46 = a4;
      v10 = 0;
      v11 = 0;
      v45 = v8;
      while (v10 < objc_msgSend(v7, "count"))
      {
        v12 = *a1 + 104 * v11;
        v49 = 0uLL;
        __p = 0;
        sub_1D4C67C30(&__p, *(const void **)(v12 + 56), *(_QWORD *)(v12 + 64), (uint64_t)(*(_QWORD *)(v12 + 64) - *(_QWORD *)(v12 + 56)) >> 3);
        v13 = __p;
        if ((void *)v49 == __p)
        {
          v13 = (void *)v49;
LABEL_14:
          if (v13)
          {
            *(_QWORD *)&v49 = v13;
            operator delete(v13);
          }
          break;
        }
        v14 = 0;
        v15 = 1;
        while (1)
        {
          v16 = *(void **)(*a1 + 104 * *((_QWORD *)v13 + v14));
          objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v16) = objc_msgSend(v16, "isEqualToString:", v17);

          if ((v16 & 1) != 0)
            break;
          v14 = v15;
          v13 = __p;
          ++v15;
          if (v14 >= (uint64_t)(v49 - (_QWORD)__p) >> 3)
            goto LABEL_14;
        }
        v11 = *((_QWORD *)__p + v14);
        ++v10;
        *(_QWORD *)&v49 = __p;
        operator delete(__p);
      }
      while (v10 < objc_msgSend(v7, "count"))
      {
        __p = 0;
        sub_1D4C67400(&v49);
        v56 = 0;
        v57 = 0;
        v53 = 0;
        v54 = 0;
        v52 = 0;
        v55 = 0;
        objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = __p;
        __p = v20;

        v47 = 0;
        v22 = *a1;
        objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1D4C7E3E8(v22 + 104 * v11 + 8, (uint64_t)&v49, v23, &v47);

        if (v47)
        {
          *v46 = -1;
          v24 = v11;
        }
        else
        {
          v25 = *a1;
          v26 = a1[1];
          if (v26 >= a1[2])
          {
            v27 = sub_1D4C677E8(a1, (uint64_t)&__p);
          }
          else
          {
            sub_1D4C6790C((uint64_t)(a1 + 2), (__n128 *)a1[1], (uint64_t)&__p);
            v27 = v26 + 104;
            a1[1] = v26 + 104;
          }
          v24 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v26 - v25) >> 3);
          a1[1] = v27;
          v28 = *a1 + 104 * v11;
          v31 = *(_QWORD *)(v28 + 72);
          v30 = (_QWORD *)(v28 + 72);
          v29 = v31;
          v33 = (uint64_t **)(v30 - 1);
          v32 = (uint64_t *)*(v30 - 1);
          if ((unint64_t)v32 >= v31)
          {
            v35 = (void **)(v30 - 2);
            v36 = (uint64_t *)*(v30 - 2);
            v37 = v32 - v36;
            v38 = v37 + 1;
            if ((unint64_t)(v37 + 1) >> 61)
              sub_1D4C590D0();
            v39 = v29 - (_QWORD)v36;
            if (v39 >> 2 > v38)
              v38 = v39 >> 2;
            if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8)
              v40 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v40 = v38;
            if (v40)
            {
              v41 = (char *)sub_1D4C60BD8((uint64_t)v30, v40);
              v32 = *v33;
              v36 = (uint64_t *)*v35;
            }
            else
            {
              v41 = 0;
            }
            v42 = (uint64_t *)&v41[8 * v37];
            *v42 = v24;
            v34 = v42 + 1;
            while (v32 != v36)
            {
              v43 = *--v32;
              *--v42 = v43;
            }
            *v35 = v42;
            *v33 = v34;
            *v30 = &v41[8 * v40];
            if (v36)
              operator delete(v36);
          }
          else
          {
            *v32 = v24;
            v34 = v32 + 1;
          }
          *v33 = v34;
        }
        if (v52)
        {
          v53 = v52;
          operator delete(v52);
        }
        if (v50)
        {
          v51 = v50;
          operator delete(v50);
        }

        ++v10;
        v11 = v24;
      }
      v9 = v45;
      v19 = sub_1D4C64D68(*a1 + 104 * v11, v45, v46);
    }
    else
    {
      v19 = sub_1D4C65028(a1, v8, a4);
    }
    v18 = v19;
  }

  return v18;
}

void sub_1D4C65544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

float sub_1D4C655D8(uint64_t a1, void *a2, int *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  float v14;
  uint64_t *v15;
  float v16;

  v5 = a2;
  *a3 = 0;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ALGFP_ImageId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ALGFP_ImageFilter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ALGFP_Statistic"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v6 || !v8)
  {
    *a3 = -1;
    v14 = 0.0;
    goto LABEL_46;
  }
  v10 = *(_QWORD *)(a1 + 48);
  if (!v10)
  {
    v11 = 0;
    goto LABEL_8;
  }
  v11 = sub_1D4C81404(v10);
  v12 = *(_QWORD *)(a1 + 48);
  if (!v12)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v13 = sub_1D4C81414(v12);
LABEL_9:
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("ALGFP_ImageId_Activity")))
  {
    v15 = *(uint64_t **)(a1 + 272);
    if (!v15)
    {
      if (!*(_QWORD *)(a1 + 240))
        sub_1D4C64C30(a1);
      v15 = (uint64_t *)operator new();
      sub_1D4C64E0C(v15, **(_QWORD **)(a1 + 240), v11, v13);
      *(_QWORD *)(a1 + 272) = v15;
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("ALGFP_ImageId_Activity_FirstThird")))
  {
    v15 = *(uint64_t **)(a1 + 288);
    if (!v15)
    {
      if (!*(_QWORD *)(a1 + 240))
        sub_1D4C64C30(a1);
      v15 = (uint64_t *)operator new();
      sub_1D4C64E0C(v15, *(_QWORD *)(*(_QWORD *)(a1 + 240) + 16), v11, v13);
      *(_QWORD *)(a1 + 288) = v15;
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("ALGFP_ImageId_Activity_LastThird")))
  {
    v15 = *(uint64_t **)(a1 + 296);
    if (!v15)
    {
      if (!*(_QWORD *)(a1 + 240))
        sub_1D4C64C30(a1);
      v15 = (uint64_t *)operator new();
      sub_1D4C64E0C(v15, *(_QWORD *)(*(_QWORD *)(a1 + 240) + 24), v11, v13);
      *(_QWORD *)(a1 + 296) = v15;
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("ALGFP_ImageId_Activity_FirstLastThirdMin")))
  {
    v15 = *(uint64_t **)(a1 + 304);
    if (!v15)
    {
      if (!*(_QWORD *)(a1 + 240))
        sub_1D4C64C30(a1);
      v15 = (uint64_t *)operator new();
      sub_1D4C64E0C(v15, *(_QWORD *)(*(_QWORD *)(a1 + 240) + 32), v11, v13);
      *(_QWORD *)(a1 + 304) = v15;
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("ALGFP_ImageId_Variability")))
  {
    v15 = *(uint64_t **)(a1 + 280);
    if (!v15)
    {
      if (!*(_QWORD *)(a1 + 240))
        sub_1D4C64C30(a1);
      v15 = (uint64_t *)operator new();
      sub_1D4C64E0C(v15, *(_QWORD *)(*(_QWORD *)(a1 + 240) + 8), v11, v13);
      *(_QWORD *)(a1 + 280) = v15;
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("ALGFP_ImageId_LoopClosure")))
  {
    v15 = *(uint64_t **)(a1 + 256);
    if (!v15)
    {
      if (!*(_QWORD *)(a1 + 216))
        sub_1D4C64BE0(a1);
      v15 = (uint64_t *)operator new();
      sub_1D4C64E0C(v15, *(_QWORD *)(a1 + 216), v11, v13);
      *(_QWORD *)(a1 + 256) = v15;
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("ALGFP_ImageId_CandidateEnergies")))
  {
    v15 = *(uint64_t **)(a1 + 264);
    if (!v15)
    {
      v15 = (uint64_t *)operator new();
      sub_1D4C64E0C(v15, *(_QWORD *)(a1 + 224), *(_DWORD *)(a1 + 232), *(_DWORD *)(a1 + 236));
      *(_QWORD *)(a1 + 264) = v15;
    }
  }
  else
  {
    printf("processImageFeature error: Unknown image id: %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
    v15 = 0;
    *a3 = -1;
  }
  v16 = sub_1D4C65178(v15, v7, v9, a3);
  if (*a3)
    v14 = 0.0;
  else
    v14 = v16;
LABEL_46:

  return v14;
}

void sub_1D4C659BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  MEMORY[0x1D82660DC](v5, 0x20C40960023A9);

  _Unwind_Resume(a1);
}

float sub_1D4C65A34(uint64_t a1, void *a2, void *a3, int *a4)
{
  id v7;
  id v8;
  float Seconds;
  int v10;
  CMTime time;

  v7 = a2;
  v8 = a3;
  *a4 = 0;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ALGFID_ProcessedImage")))
  {
    Seconds = sub_1D4C655D8(a1, v8, a4);
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ALGFID_ActivityDetected3Levels")))
  {
    *a4 = -1;
    Seconds = -1.0;
  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ALGFID_MaxIrisGapInLoop")))
  {
    if ((*(_DWORD *)(a1 + 124) & 0x1D) == 1)
    {
      v10 = 0;
    }
    else
    {
      sub_1D4C64B7C(a1);
      if ((*(_DWORD *)(a1 + 124) & 0x1D) == 1)
        v10 = 0;
      else
        v10 = -1;
    }
    *a4 = v10;
    time = *(CMTime *)(a1 + 112);
    Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    *a4 = -1;
    printf("extractRequestedFeature error: Unknown featureId %s.\n", (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    Seconds = 0.0;
  }

  return Seconds;
}

void sub_1D4C65B7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C65B90(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id *v9;
  id *v10;
  uint64_t v11;
  void *v12;
  id *v13;
  id *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void **v27;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    v3 = sub_1D4C81400(v2);
    MEMORY[0x1D82660DC](v3, 0x20C40A4A59CD2);
    *(_QWORD *)(a1 + 48) = 0;
  }
  v4 = *(_QWORD *)(a1 + 216);
  if (v4)
  {
    v5 = *(void **)v4;
    if (*(_QWORD *)v4)
    {
      *(_QWORD *)(v4 + 8) = v5;
      operator delete(v5);
    }
    MEMORY[0x1D82660DC](v4, 0x80C40D6874129);
    *(_QWORD *)(a1 + 216) = 0;
  }
  v6 = *(_QWORD *)(a1 + 224);
  if (v6)
  {
    v7 = *(void **)v6;
    if (*(_QWORD *)v6)
    {
      *(_QWORD *)(v6 + 8) = v7;
      operator delete(v7);
    }
    MEMORY[0x1D82660DC](v6, 0x80C40D6874129);
    *(_QWORD *)(a1 + 224) = 0;
  }
  if (*(_QWORD *)(a1 + 240))
  {
    v8 = sub_1D4C813B0();
    MEMORY[0x1D82660DC](v8, 0x20C40769AC3DALL);
    *(_QWORD *)(a1 + 240) = 0;
  }
  v9 = *(id **)(a1 + 16);
  if (v9)
  {
    v10 = sub_1D4C62900(v9);
    MEMORY[0x1D82660DC](v10, 0x80C40803F642BLL);
    *(_QWORD *)(a1 + 16) = 0;
  }
  v11 = *(_QWORD *)(a1 + 24);
  if (v11)
  {
    v12 = *(void **)v11;
    if (*(_QWORD *)v11)
    {
      *(_QWORD *)(v11 + 8) = v12;
      operator delete(v12);
    }
    MEMORY[0x1D82660DC](v11, 0x80C40D6874129);
    *(_QWORD *)(a1 + 24) = 0;
  }
  v13 = *(id **)(a1 + 32);
  if (v13)
  {
    v14 = sub_1D4C62900(v13);
    MEMORY[0x1D82660DC](v14, 0x80C40803F642BLL);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
  {
    v16 = *(void **)v15;
    if (*(_QWORD *)v15)
    {
      *(_QWORD *)(v15 + 8) = v16;
      operator delete(v16);
    }
    MEMORY[0x1D82660DC](v15, 0x80C40D6874129);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v17 = *(_QWORD *)(a1 + 256);
  if (v17)
  {
    v27 = *(void ***)(a1 + 256);
    sub_1D4C6771C(&v27);
    MEMORY[0x1D82660DC](v17, 0x20C40960023A9);
    *(_QWORD *)(a1 + 256) = 0;
  }
  v18 = *(_QWORD *)(a1 + 264);
  if (v18)
  {
    v27 = *(void ***)(a1 + 264);
    sub_1D4C6771C(&v27);
    MEMORY[0x1D82660DC](v18, 0x20C40960023A9);
    *(_QWORD *)(a1 + 264) = 0;
  }
  v19 = *(_QWORD *)(a1 + 272);
  if (v19)
  {
    v27 = *(void ***)(a1 + 272);
    sub_1D4C6771C(&v27);
    MEMORY[0x1D82660DC](v19, 0x20C40960023A9);
    *(_QWORD *)(a1 + 272) = 0;
  }
  v20 = *(_QWORD *)(a1 + 280);
  if (v20)
  {
    v27 = *(void ***)(a1 + 280);
    sub_1D4C6771C(&v27);
    MEMORY[0x1D82660DC](v20, 0x20C40960023A9);
    *(_QWORD *)(a1 + 280) = 0;
  }
  v21 = *(_QWORD *)(a1 + 288);
  if (v21)
  {
    v27 = *(void ***)(a1 + 288);
    sub_1D4C6771C(&v27);
    MEMORY[0x1D82660DC](v21, 0x20C40960023A9);
    *(_QWORD *)(a1 + 288) = 0;
  }
  v22 = *(_QWORD *)(a1 + 296);
  if (v22)
  {
    v27 = *(void ***)(a1 + 296);
    sub_1D4C6771C(&v27);
    MEMORY[0x1D82660DC](v22, 0x20C40960023A9);
    *(_QWORD *)(a1 + 296) = 0;
  }
  v23 = *(_QWORD *)(a1 + 304);
  if (v23)
  {
    v27 = *(void ***)(a1 + 304);
    sub_1D4C6771C(&v27);
    MEMORY[0x1D82660DC](v23, 0x20C40960023A9);
    *(_QWORD *)(a1 + 304) = 0;
  }
  v24 = *(_QWORD *)(a1 + 248);
  if (v24)
  {
    v25 = *(void **)v24;
    if (*(_QWORD *)v24)
    {
      *(_QWORD *)(v24 + 8) = v25;
      operator delete(v25);
    }
    MEMORY[0x1D82660DC](v24, 0x20C40960023A9);
    *(_QWORD *)(a1 + 248) = 0;
  }

  return a1;
}

id sub_1D4C65EB8(uint64_t a1, int a2, int a3)
{
  void *v6;
  void *v7;
  const __CFAllocator *v8;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  CFDictionaryRef v11;
  CFDictionaryRef v12;
  void *v13;
  Float64 Seconds;
  void *v15;
  uint64_t v16;
  uint64_t *v17;
  void *v18;
  double v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  __CFDictionary *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  CMTime v35;
  CMTime v36;
  CMTime v37;
  CMTime v38;
  CMTime time;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 96));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, qword_1EFEC7E50);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 104), qword_1EFEC7E58);
  time = *(CMTime *)(a1 + 136);
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, qword_1EFEC7E68);

  v38 = *(CMTime *)(a1 + 160);
  v10 = CMTimeCopyAsDictionary(&v38, v8);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, qword_1EFEC7E70);

  v37 = *(CMTime *)(a1 + 184);
  v11 = CMTimeCopyAsDictionary(&v37, v8);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, qword_1EFEC7E78);

  v36 = *(CMTime *)(a1 + 112);
  v12 = CMTimeCopyAsDictionary(&v36, v8);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, qword_1EFEC7E60);

  v13 = (void *)MEMORY[0x1E0CB37E8];
  v35 = *(CMTime *)(a1 + 112);
  Seconds = CMTimeGetSeconds(&v35);
  *(float *)&Seconds = Seconds;
  objc_msgSend(v13, "numberWithFloat:", Seconds);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, qword_1EFEC7EA8);

  v16 = *(_QWORD *)(a1 + 8);
  if (v16)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, qword_1EFEC7E98);
  v17 = *(uint64_t **)(a1 + 24);
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (v17[1] - *v17) >> 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *v17;
    if (v17[1] != *v17)
    {
      v21 = 0;
      do
      {
        LODWORD(v19) = *(_DWORD *)(v20 + 4 * v21);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v22);

        ++v21;
        v20 = *v17;
      }
      while (v21 < (v17[1] - *v17) >> 2);
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, qword_1EFEC7EA0);

  }
  if (*(_QWORD *)(a1 + 248))
  {
    v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v24 = **(_QWORD **)(a1 + 248);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 248) + 8) != v24)
    {
      v25 = 0;
      v26 = 0;
      do
      {
        v27 = sub_1D4C6235C((_DWORD *)(v24 + v25));
        objc_msgSend(v23, "addObject:", v27);

        ++v26;
        v24 = **(_QWORD **)(a1 + 248);
        v25 += 28;
      }
      while (0x6DB6DB6DB6DB6DB7 * ((*(_QWORD *)(*(_QWORD *)(a1 + 248) + 8) - v24) >> 2) > v26);
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, qword_1EFEC7E80);

  }
  v28 = *(void **)(a1 + 88);
  if (v28)
  {
    if (a2)
    {
      objc_msgSend(v28, "featuresDict");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(*(id *)(a1 + 88), "featuresDict");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, qword_1EFEC7E88);

      }
    }
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 88), "fullFeaturesDict");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31 || !objc_msgSend(*(id *)(a1 + 88), "processFullDictionary:", 0))
      {
        objc_msgSend(*(id *)(a1 + 88), "fullFeaturesDict");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(*(id *)(a1 + 88), "fullFeaturesDict");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v33, qword_1EFEC7E90);

        }
      }
    }
  }
  return v6;
}

void sub_1D4C66288(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4C66308(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = v5;
  if (v7)
  {
    sub_1D4C663A4(a1, v7, v5);
    sub_1D4C66524(a1, v7, v6);
    sub_1D4C66644(a1, v7, v6);
  }
  else
  {
    puts("PostGateFeatureExtractor: Can't dump features; output directory URL unset.");
  }

}

void sub_1D4C6638C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1D4C663A4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  const char *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  if (!*(_QWORD *)(a1 + 216))
  {
    sub_1D4C64BE0(a1);
    if (!*(_QWORD *)(a1 + 216))
    {
      v15 = "No loopClosureEnergyMap features available to dump: error extracting.";
      goto LABEL_15;
    }
  }
  if (!*(_QWORD *)(a1 + 48) || !*(_BYTE *)(a1 + 56))
    puts("Can't dump loopClosureEnergyMap without postGateFeatureExtractor.");
  if (!v16)
  {
    v15 = "Can't dump loopClosureEnergyMap; output directory URL unset.";
LABEL_15:
    puts(v15);
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("loopClosureEnergyMap%@.txt"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (char *)objc_msgSend(v8, "UTF8String");

  v10 = *(_QWORD **)(a1 + 216);
  v11 = *(_QWORD *)(a1 + 48);
  if (!v11)
  {
    v12 = 0;
    goto LABEL_12;
  }
  v12 = sub_1D4C81404(v11);
  v13 = *(_QWORD *)(a1 + 48);
  if (!v13)
  {
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  v14 = sub_1D4C81414(v13);
LABEL_13:
  sub_1D4C669CC(v10, v12, v14, v9);

LABEL_16:
}

void sub_1D4C664E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1D4C66524(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  char *v9;
  const char *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (!*(_QWORD *)(a1 + 224))
  {
    v10 = "No candidateLoopEnergy features available to dump (must be set via setCandidateLoopEnergyFeatures()).";
LABEL_6:
    puts(v10);
    goto LABEL_7;
  }
  if (!v11)
  {
    v10 = "Can't dump candidateLoopEnergyFeatures; output directory URL unset.";
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("candidateLoopClosureEnergies%@.txt"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (char *)objc_msgSend(v8, "UTF8String");

  sub_1D4C669CC(*(_QWORD **)(a1 + 224), *(_DWORD *)(a1 + 232), *(_DWORD *)(a1 + 236), v9);
LABEL_7:

}

void sub_1D4C66608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_1D4C66644(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  const char *v10;
  void *v11;
  void *v12;
  id v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
  char *v18;
  void *v19;
  void *v20;
  id v21;
  char *v22;
  void *v23;
  void *v24;
  id v25;
  char *v26;
  void *v27;
  void *v28;
  id v29;
  char *v30;
  id v31;

  v31 = a2;
  v5 = a3;
  if (!*(_QWORD *)(a1 + 240))
  {
    sub_1D4C64C30(a1);
    if (!*(_QWORD *)(a1 + 240))
    {
      v10 = "No activity map features available to dump: error extracting.";
      goto LABEL_16;
    }
  }
  if (!*(_QWORD *)(a1 + 48) || !*(_BYTE *)(a1 + 56))
    puts("Can't dump activity features without postGateFeatureExtractor.");
  if (!v31)
  {
    v10 = "Can't dump activity features; output directory URL unset.";
LABEL_16:
    puts(v10);
    goto LABEL_17;
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    v7 = sub_1D4C81404(v6);
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
    {
      v9 = sub_1D4C81414(v8);
      goto LABEL_13;
    }
  }
  else
  {
    v7 = 0;
  }
  v9 = 0;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("activityMap%@.txt"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "URLByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = (char *)objc_msgSend(v13, "UTF8String");

  sub_1D4C669CC(**(_QWORD ***)(a1 + 240), v7, v9, v14);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("firstThirdActivityMap%@.txt"), v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "URLByAppendingPathComponent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "path");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (char *)objc_msgSend(v17, "UTF8String");

  sub_1D4C669CC(*(_QWORD **)(*(_QWORD *)(a1 + 240) + 16), v7, v9, v18);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("lastThirdActivityMap%@.txt"), v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "URLByAppendingPathComponent:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "path");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = (char *)objc_msgSend(v21, "UTF8String");

  sub_1D4C669CC(*(_QWORD **)(*(_QWORD *)(a1 + 240) + 24), v7, v9, v22);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("firstLastThirdMinActivityMap%@.txt"), v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "URLByAppendingPathComponent:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "path");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v26 = (char *)objc_msgSend(v25, "UTF8String");

  sub_1D4C669CC(*(_QWORD **)(*(_QWORD *)(a1 + 240) + 32), v7, v9, v26);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 240) + 8))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("variabilityMap%@.txt"), v5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "URLByAppendingPathComponent:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "path");
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = (char *)objc_msgSend(v29, "UTF8String");

    sub_1D4C669CC(*(_QWORD **)(*(_QWORD *)(a1 + 240) + 8), v7, v9, v30);
  }
LABEL_17:

}

void sub_1D4C66954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

FILE *sub_1D4C669CC(_QWORD *a1, int a2, int a3, char *__filename)
{
  FILE *result;
  FILE *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;

  result = fopen(__filename, "w");
  if (result)
  {
    v8 = result;
    fprintf(result, "%d %d\n", a2, a3);
    v9 = a3 * a2;
    if (a3 * a2)
    {
      v10 = 0;
      v11 = 4 * v9;
      do
      {
        fprintf(v8, "%f ", *(float *)(*a1 + v10));
        v10 += 4;
      }
      while (v11 != v10);
    }
    return (FILE *)fclose(v8);
  }
  return result;
}

BOOL sub_1D4C66A8C(uint64_t a1)
{
  int v1;

  v1 = *(unsigned __int8 *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 56))
    puts("validatePostGateFeatures error: no valid loopData");
  return v1 != 0;
}

uint64_t sub_1D4C66AC0(uint64_t a1)
{
  uint64_t v1;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unint64_t v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  float v18;
  _QWORD *v19;
  uint64_t v20;
  id v22;
  id v23;
  unsigned int v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0xFFFFFFFFLL;
  v3 = *(id *)(v1 + 8);
  if (objc_msgSend(v3, "count"))
  {
    NSLog(CFSTR("ALGatingFeatures paramDict has the following keys:"));
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v26 != v6)
            objc_enumerationMutation(v4);
          NSLog(CFSTR(": %@ "), *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v5);
    }

  }
  v8 = **(id **)(a1 + 16);
  v9 = (_QWORD *)operator new();
  v24 = 2143289344;
  sub_1D4C61F3C(v9, objc_msgSend(v8, "count"), &v24);
  v10 = 0;
  v11 = 0;
  v12 = 0;
  *(_QWORD *)(a1 + 24) = v9;
  v24 = 0;
  while (1)
  {
    v13 = v12;
    if (objc_msgSend(v8, "count") <= (unint64_t)v12)
    {
      v16 = v10;
      v17 = v11;
      goto LABEL_20;
    }
    objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v11;
    v23 = v10;
    v15 = sub_1D4C629C8(v14, &v23, &v22);
    v16 = v23;

    v17 = v22;
    v24 = v15;
    if (!v15)
    {
      v18 = sub_1D4C65A34(a1, v16, v17, (int *)&v24);
      v19 = *(_QWORD **)(a1 + 24);
      if (v13 >= (uint64_t)(v19[1] - *v19) >> 2)
        sub_1D4C62870();
      *(float *)(*v19 + 4 * v13) = v18;
      if (v24)
        break;
    }

    v12 = v13 + 1;
    v10 = v16;
    v11 = v17;
  }

LABEL_20:
  v20 = v24;

  return v20;
}

void sub_1D4C66D3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C66DD0(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  int v16;
  int v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  float v22;
  float v23;
  float *v24;
  char *v25;
  float *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  int *v32;
  int *v33;
  uint64_t v34;
  unint64_t v35;
  const char *v36;
  _QWORD *v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unsigned int v42;
  id v45;
  int v46;
  id v47;
  id v48;
  void *__p;
  char *v50;
  char *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    v45 = *(id *)(v1 + 8);
    if (objc_msgSend(v45, "count"))
    {
      NSLog(CFSTR("ALGatingFeatures paramDict has the following keys:"));
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v2 = v45;
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v3)
      {
        v4 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v3; ++i)
          {
            if (*(_QWORD *)v53 != v4)
              objc_enumerationMutation(v2);
            NSLog(CFSTR(": %@ "), *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i));
          }
          v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        }
        while (v3);
      }

    }
    v6 = **(id **)(a1 + 32);
    __p = 0;
    v50 = 0;
    v51 = 0;
    sub_1D4C6736C(&__p, objc_msgSend(v6, "count"));
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = v10;
      if (objc_msgSend(v6, "count") <= (unint64_t)v10)
        break;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v8;
      v48 = v7;
      v13 = sub_1D4C629C8(v12, &v48, &v47);
      v14 = v48;

      v15 = v47;
      if (v13
        || ((v16 = objc_msgSend(v14, "isEqualToString:", CFSTR("ALGFID_ActivityDetect")), v15) ? (v17 = v16) : (v17 = 0),
            v17 != 1))
      {
        v20 = 0xFFFFFFFFLL;
      }
      else
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ALGFP_ActivityLevel"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = objc_msgSend(v18, "integerValue");
        else
          v19 = -1;
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ALGFP_ActivityArea"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v21, "floatValue");
          v20 = 0xFFFFFFFFLL;
          if ((v19 & 0x80000000) == 0)
          {
            v23 = v22;
            if (v22 >= 0.0)
            {
              v24 = (float *)v50;
              if (v50 >= v51)
              {
                v26 = (float *)__p;
                v27 = (v50 - (_BYTE *)__p) >> 3;
                v28 = v27 + 1;
                if ((unint64_t)(v27 + 1) >> 61)
                  sub_1D4C590D0();
                v29 = v51 - (_BYTE *)__p;
                if ((v51 - (_BYTE *)__p) >> 2 > v28)
                  v28 = v29 >> 2;
                if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
                  v30 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v30 = v28;
                if (v30)
                {
                  v31 = (char *)sub_1D4C60BD8((uint64_t)&v51, v30);
                  v26 = (float *)__p;
                  v24 = (float *)v50;
                }
                else
                {
                  v31 = 0;
                }
                v32 = (int *)&v31[8 * v27];
                *v32 = v19;
                *((float *)v32 + 1) = v23;
                v33 = v32;
                if (v24 != v26)
                {
                  do
                  {
                    v34 = *((_QWORD *)v24 - 1);
                    v24 -= 2;
                    *((_QWORD *)v33 - 1) = v34;
                    v33 -= 2;
                  }
                  while (v24 != v26);
                  v26 = (float *)__p;
                }
                v25 = (char *)(v32 + 2);
                __p = v33;
                v50 = (char *)(v32 + 2);
                v51 = &v31[8 * v30];
                if (v26)
                  operator delete(v26);
              }
              else
              {
                *(_DWORD *)v50 = v19;
                v24[1] = v22;
                v25 = (char *)(v24 + 2);
              }
              v50 = v25;
              v20 = v9;
            }
          }
        }
        else
        {
          v20 = 0xFFFFFFFFLL;
        }

      }
      v10 = v11 + 1;
      v7 = v14;
      v8 = v15;
      v9 = v20;
    }
    if ((_DWORD)v9 || sub_1D4C64C80(a1, (uint64_t *)&__p))
    {
      v35 = 0xFFFFFFFFLL;
    }
    else
    {
      v35 = objc_msgSend(v6, "count");
      v38 = (_QWORD *)operator new();
      v46 = 2143289344;
      sub_1D4C61F3C(v38, v35, &v46);
      *(_QWORD *)(a1 + 40) = v38;
      if (v35)
      {
        v39 = 0;
        v40 = **(_QWORD **)(a1 + 248);
        v41 = 0x6DB6DB6DB6DB6DB7 * ((*(_QWORD *)(*(_QWORD *)(a1 + 248) + 8) - v40) >> 2);
        v42 = 1;
        do
        {
          if (v41 > v39)
          {
            if (v39 >= (uint64_t)(v38[1] - *v38) >> 2)
              sub_1D4C62870();
            *(float *)(*v38 + 4 * v39) = (float)*(unsigned int *)(v40 + 28 * v39);
          }
          v39 = v42;
        }
        while (v35 > v42++);
        v35 = 0;
      }
    }

    if (__p)
    {
      v50 = (char *)__p;
      operator delete(__p);
    }

  }
  else
  {
    v36 = (const char *)sub_1D4C6090C(*(_DWORD *)(a1 + 80));
    printf("ALGatingFeatures (%s): no activity-detector feature instructions available\n", v36);
    return 0xFFFFFFFFLL;
  }
  return v35;
}

void sub_1D4C672A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  MEMORY[0x1D82660DC](v18, 0x80C40D6874129);

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1D4C6736C(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      sub_1D4C590D0();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)sub_1D4C60BD8(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

_OWORD *sub_1D4C67400(_OWORD *a1)
{
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  sub_1D4C67468((uint64_t)(a1 + 1), 0);
  return a1;
}

void sub_1D4C67440(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;

  v3 = v2;
  v5 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 24) = v5;
    operator delete(v5);
  }

  _Unwind_Resume(a1);
}

void sub_1D4C67468(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    sub_1D4C67498((char **)a1, a2 - v2);
  }
}

void sub_1D4C67498(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  int v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 2);
    if (v10 >> 62)
      sub_1D4C590D0();
    v11 = v9 >> 2;
    v12 = v5 - v8;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)sub_1D4C61FFC(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

uint64_t sub_1D4C675A0(uint64_t a1, uint64_t a2, int a3, int a4)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  sub_1D4C67608(a1, a2, a3, a4, 0, 0);
  return a1;
}

void sub_1D4C675E4(_Unwind_Exception *a1)
{
  uint64_t v1;
  id *v2;
  void *v4;

  v4 = *(void **)(v1 + 16);
  if (v4)
  {
    *(_QWORD *)(v1 + 24) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

void sub_1D4C67608(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void *a6)
{
  uint64_t v12;
  id v13;

  v13 = a6;
  *(_QWORD *)a1 = a5;
  objc_storeStrong((id *)(a1 + 8), a6);
  *(_DWORD *)(a1 + 40) = a3;
  *(_DWORD *)(a1 + 44) = a4;
  sub_1D4C67468(a1 + 16, a4 * a3);
  v12 = *(_QWORD *)(a2 + 8);
  if (v12 != *(_QWORD *)a2)
    memmove(*(void **)(a1 + 16), *(const void **)a2, v12 - *(_QWORD *)a2);

}

void sub_1D4C67698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C676AC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  sub_1D4C67608(a1, a2 + 16, *(_DWORD *)(a2 + 40), *(_DWORD *)(a2 + 44), *(_QWORD *)a2, *(void **)(a2 + 8));
  return a1;
}

void sub_1D4C676F8(_Unwind_Exception *a1)
{
  uint64_t v1;
  id *v2;
  void *v4;

  v4 = *(void **)(v1 + 16);
  if (v4)
  {
    *(_QWORD *)(v1 + 24) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(a1);
}

void sub_1D4C6771C(void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 104;
        sub_1D4C677A0((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1D4C677A0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a2 + 56);
  if (v3)
  {
    *(_QWORD *)(a2 + 64) = v3;
    operator delete(v3);
  }
  v4 = *(void **)(a2 + 24);
  if (v4)
  {
    *(_QWORD *)(a2 + 32) = v4;
    operator delete(v4);
  }

}

uint64_t sub_1D4C677E8(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  void *v10;
  __n128 *v11;
  __int8 *v12;
  char *v13;
  uint64_t *v14;

  v3 = 0x4EC4EC4EC4EC4EC5 * ((a1[1] - *a1) >> 3);
  v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) > 0x276276276276276)
    sub_1D4C590D0();
  if (0x9D89D89D89D89D8ALL * ((a1[2] - *a1) >> 3) > v4)
    v4 = 0x9D89D89D89D89D8ALL * ((a1[2] - *a1) >> 3);
  if ((unint64_t)(0x4EC4EC4EC4EC4EC5 * ((a1[2] - *a1) >> 3)) >= 0x13B13B13B13B13BLL)
    v6 = 0x276276276276276;
  else
    v6 = v4;
  v14 = a1 + 2;
  if (v6)
    v7 = (char *)sub_1D4C67A28((uint64_t)(a1 + 2), v6);
  else
    v7 = 0;
  v10 = v7;
  v11 = (__n128 *)&v7[104 * v3];
  v13 = &v7[104 * v6];
  sub_1D4C6790C((uint64_t)(a1 + 2), v11, a2);
  v12 = &v11[6].n128_i8[8];
  sub_1D4C679B4(a1, &v10);
  v8 = a1[1];
  sub_1D4C67BBC(&v10);
  return v8;
}

void sub_1D4C678F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1D4C67BBC((void **)va);
  _Unwind_Resume(a1);
}

__n128 sub_1D4C6790C(uint64_t a1, __n128 *a2, uint64_t a3)
{
  uint64_t v5;
  __n128 result;

  v5 = a3 + 8;
  a2->n128_u64[0] = (unint64_t)*(id *)a3;
  sub_1D4C676AC((uint64_t)&a2->n128_i64[1], v5);
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  a2[4].n128_u64[1] = 0;
  sub_1D4C67C30(&a2[3].n128_u64[1], *(const void **)(a3 + 56), *(_QWORD *)(a3 + 64), (uint64_t)(*(_QWORD *)(a3 + 64) - *(_QWORD *)(a3 + 56)) >> 3);
  result = *(__n128 *)(a3 + 80);
  a2[6].n128_u32[0] = *(_DWORD *)(a3 + 96);
  a2[5] = result;
  return result;
}

void sub_1D4C67980(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + 24);
  if (v3)
  {
    *(_QWORD *)(v1 + 32) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C679B4(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1D4C67A70((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_1D4C67A28(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x276276276276277)
    sub_1D4C5919C();
  return operator new(104 * a2);
}

uint64_t sub_1D4C67A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v11;
  _QWORD v13[3];
  char v14;
  __int128 v15;
  __int128 v16;

  v7 = a7;
  *(_QWORD *)&v16 = a6;
  *((_QWORD *)&v16 + 1) = a7;
  v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  v14 = 0;
  if (a3 == a5)
  {
    v11 = a6;
  }
  else
  {
    v9 = a3;
    do
    {
      v9 -= 104;
      sub_1D4C6790C(a1, (__n128 *)(v7 - 104), v9);
      v7 = *((_QWORD *)&v16 + 1) - 104;
      *((_QWORD *)&v16 + 1) -= 104;
    }
    while (v9 != a5);
    v11 = v16;
  }
  v14 = 1;
  sub_1D4C67B38((uint64_t)v13);
  return v11;
}

void sub_1D4C67B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1D4C67B38((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C67B38(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1D4C67B6C((uint64_t *)a1);
  return a1;
}

void sub_1D4C67B6C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1[2] + 8);
  v2 = *(_QWORD *)(a1[1] + 8);
  if (v1 != v2)
  {
    v3 = *a1;
    do
    {
      sub_1D4C677A0(v3, v1);
      v1 += 104;
    }
    while (v1 != v2);
  }
}

void **sub_1D4C67BBC(void **a1)
{
  sub_1D4C67BEC(a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void sub_1D4C67BEC(_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 104;
    sub_1D4C677A0(v4, i - 104);
  }
}

_QWORD *sub_1D4C67C30(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = sub_1D4C64A1C(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1D4C67C8C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D4C680BC(void *a1, void *a2, int a3, int a4, float a5)
{
  int v6;
  vImage_Error v7;
  unsigned __int8 *kernel[3];
  vImage_Buffer dest;
  vImage_Buffer src;

  src.data = a1;
  src.height = a3;
  src.width = a4;
  src.rowBytes = a4;
  dest.data = a2;
  dest.height = a3;
  dest.width = a4;
  dest.rowBytes = a4;
  v6 = (int)(float)((float)(ceilf(a5) * 2.0) + 1.0);
  sub_1D4C624F4(kernel, (v6 * v6));
  sub_1D4C6819C((uint64_t)kernel[0], v6, 255, 0, a5);
  v7 = vImageErode_Planar8(&src, &dest, 0, 0, kernel[0], v6, v6, 8u);
  if (v7)
    printf("erodePlanarU8Image vImage_Error: %zd", v7);
  if (kernel[0])
  {
    kernel[1] = kernel[0];
    operator delete(kernel[0]);
  }
}

void sub_1D4C68180(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D4C6819C(uint64_t result, int a2, char a3, char a4, float a5)
{
  int v5;
  uint64_t v6;
  unsigned int v7;
  float v8;
  uint64x2_t v9;
  int64x2_t v10;
  int32x2_t v11;
  _BYTE *v12;
  int v13;
  uint64_t v14;
  _BYTE *v15;
  int64x2_t v16;
  int32x2_t v17;
  int32x2_t v18;
  int32x2_t v19;
  char v20;
  char v21;

  if (a2 >= 0)
    v5 = a2;
  else
    v5 = a2 + 1;
  if (a2 >= 1)
  {
    v6 = 0;
    v7 = v5 >> 1;
    v8 = a5 * a5;
    v9 = (uint64x2_t)vdupq_n_s64((unint64_t)a2 - 1);
    v10 = vdupq_n_s64(2uLL);
    v11 = vdup_n_s32(v7);
    v12 = (_BYTE *)(result + 1);
    do
    {
      v13 = (v6 - v7) * (v6 - v7);
      v14 = (a2 + 1) & 0x1FFFFFFFELL;
      v15 = v12;
      v16 = (int64x2_t)xmmword_1D4C95420;
      v17 = (int32x2_t)0x100000000;
      do
      {
        v18 = vmovn_s64((int64x2_t)vcgeq_u64(v9, (uint64x2_t)v16));
        v19 = vsub_s32(v17, v11);
        if ((v18.i8[0] & 1) != 0)
        {
          if (v8 >= (float)(int)(vmul_s32(v19, v19).u32[0] + v13))
            v20 = a3;
          else
            v20 = a4;
          *(v15 - 1) = v20;
        }
        if ((v18.i8[4] & 1) != 0)
        {
          if (v8 >= (float)(vmul_s32(v19, v19).i32[1] + v13))
            v21 = a3;
          else
            v21 = a4;
          *v15 = v21;
        }
        v16 = vaddq_s64(v16, v10);
        v17 = vadd_s32(v17, (int32x2_t)0x200000002);
        v15 += 2;
        v14 -= 2;
      }
      while (v14);
      ++v6;
      v12 += a2;
    }
    while (v6 != a2);
  }
  return result;
}

void sub_1D4C68284(void *a1, void *a2, int a3, int a4, float a5)
{
  int v6;
  vImage_Error v7;
  unsigned __int8 *kernel[3];
  vImage_Buffer dest;
  vImage_Buffer src;

  src.data = a1;
  src.height = a3;
  src.width = a4;
  src.rowBytes = a4;
  dest.data = a2;
  dest.height = a3;
  dest.width = a4;
  dest.rowBytes = a4;
  v6 = (int)(float)((float)(ceilf(a5) * 2.0) + 1.0);
  sub_1D4C624F4(kernel, (v6 * v6));
  sub_1D4C6819C((uint64_t)kernel[0], v6, 0, 255, a5);
  v7 = vImageDilate_Planar8(&src, &dest, 0, 0, kernel[0], v6, v6, 8u);
  if (v7)
    printf("dilatePlanarU8Image vImage_Error: %zd", v7);
  if (kernel[0])
  {
    kernel[1] = kernel[0];
    operator delete(kernel[0]);
  }
}

void sub_1D4C68348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D4C68364(uint64_t a1, int a2, int a3)
{
  size_t v4;

  *(_BYTE *)a1 = 0;
  *(_DWORD *)(a1 + 4) = a2;
  *(_DWORD *)(a1 + 8) = a3;
  v4 = a3 * a2;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  sub_1D4C624F4((_QWORD *)(a1 + 40), v4);
  sub_1D4C624F4((_QWORD *)(a1 + 64), v4);
  *(_QWORD *)(a1 + 152) = 0;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  return a1;
}

void sub_1D4C683D4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D4C683F4(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 24) = a2;
  *(_QWORD *)(result + 32) = a3;
  return result;
}

void sub_1D4C683FC(uint64_t a1, int a2)
{
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  qos_class_t v9;
  NSObject *global_queue;
  int v11;
  BOOL v12;
  BOOL v13;
  int v14;
  int v15;
  _QWORD block[6];
  int v17;

  v6 = *(_QWORD *)(a1 + 40);
  v4 = (unint64_t *)(a1 + 40);
  v5 = v6;
  v7 = *((int *)v4 - 8) * (uint64_t)*((int *)v4 - 9);
  v8 = v4[1] - v6;
  if (v7 <= v8)
  {
    if (v7 < v8)
      *(_QWORD *)(a1 + 48) = v5 + v7;
  }
  else
  {
    sub_1D4C6261C(v4, v7 - v8);
  }
  v9 = qos_class_self();
  global_queue = dispatch_get_global_queue(v9, 0);
  v11 = *(_DWORD *)(a1 + 4);
  v13 = __OFADD__(v11, 7);
  v14 = v11 + 7;
  v12 = v11 + 7 < 0;
  v15 = v11 + 14;
  if (v12 == v13)
    v15 = v14;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = sub_1D4C684BC;
  block[3] = &unk_1E9863D90;
  block[4] = a1;
  block[5] = (uint64_t)v15 >> 3;
  v17 = a2;
  dispatch_apply(8uLL, global_queue, block);
}

uint64_t sub_1D4C684BC(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  unsigned int v11;
  int v12;
  _QWORD *v13;
  char v14;

  v3 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  v4 = v2 * a2;
  v5 = v2 * a2 + v2;
  if (v5 >= *(int *)(v3 + 4))
    v6 = *(_DWORD *)(v3 + 4);
  else
    v6 = v5;
  if (v6 > v4)
  {
    v7 = result;
    v8 = *(_DWORD *)(v3 + 8);
    do
    {
      if (v8 >= 1)
      {
        v9 = 0;
        do
        {
          v10 = *(_QWORD **)(v3 + 24);
          if (v10[1] - *v10 <= (unint64_t)(v9 + v4 * v8)
            || (v11 = sub_1D4C685D8(**(_QWORD **)(v3 + 32), v8, *(_DWORD *)(v3 + 4), v9, v4, *(_DWORD *)(v7 + 48), *(unsigned __int8 *)(*v10 + v4 * (uint64_t)v8 + v9)), v12 = *(_DWORD *)(v3 + 8), v13 = *(_QWORD **)(v3 + 32), v13[1] - *v13 <= (unint64_t)(v9 + v12 * (uint64_t)v4)))
          {
            sub_1D4C62870();
          }
          result = sub_1D4C685D8(**(_QWORD **)(v3 + 24), v12, *(_DWORD *)(v3 + 4), v9, v4, *(_DWORD *)(v7 + 48), *(unsigned __int8 *)(*v13 + v4 * (uint64_t)v12 + v9));
          if (result >= v11)
            v14 = v11;
          else
            v14 = result;
          *(_BYTE *)(*(_QWORD *)(v3 + 40) + *(int *)(v3 + 8) * (uint64_t)v4 + v9) = v14;
          v8 = *(_DWORD *)(v3 + 8);
          ++v9;
        }
        while ((int)v9 < v8);
      }
      ++v4;
    }
    while (v4 != v6);
  }
  return result;
}

uint64_t sub_1D4C685D8(uint64_t a1, int a2, int a3, int a4, int a5, int a6, unsigned int a7)
{
  uint64_t v7;
  int v8;
  unsigned __int8 v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  unsigned __int8 v18;
  unsigned __int8 v19;

  v7 = (a5 - a6) & ~((a5 - a6) >> 31);
  if (a6 + a5 >= a3)
    v8 = a3 - 1;
  else
    v8 = a6 + a5;
  if ((int)v7 <= v8)
  {
    v10 = a6 + a4;
    if (a6 + a4 >= a2)
      v10 = a2 - 1;
    v11 = (a4 - a6) & ~((a4 - a6) >> 31);
    v12 = a2;
    v13 = (v8 + 1);
    v14 = (unsigned __int8 *)(a1 + v11 + a2 * v7);
    v9 = -1;
    do
    {
      v15 = (v10 + 1) - v11;
      v16 = v14;
      if ((int)v11 <= v10)
      {
        do
        {
          v17 = *v16++;
          v18 = a7 - v17;
          v19 = v17 - a7;
          if (v17 <= a7)
            v19 = v18;
          if (v19 < v9)
            v9 = v19;
          --v15;
        }
        while (v15);
      }
      ++v7;
      v14 += v12;
    }
    while (v7 != v13);
  }
  else
  {
    return -1;
  }
  return v9;
}

void sub_1D4C68684(uint64_t a1, int a2)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  int v23;
  uint64_t v24;
  void *__p[3];

  v5 = (_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 64);
  v6 = *(int *)(a1 + 8) * (uint64_t)*(int *)(a1 + 4);
  v7 = *(_QWORD *)(a1 + 72) - v4;
  if (v6 <= v7)
  {
    if (v6 < v7)
      *(_QWORD *)(a1 + 72) = v4 + v6;
  }
  else
  {
    sub_1D4C6261C((unint64_t *)(a1 + 64), v6 - v7);
  }
  sub_1D4C683FC(a1, a2);
  sub_1D4C624F4(__p, *(int *)(a1 + 8) * (uint64_t)*(int *)(a1 + 4));
  sub_1D4C68284(*(void **)(a1 + 40), __p[0], *(_DWORD *)(a1 + 4), *(_DWORD *)(a1 + 8), 1.0);
  sub_1D4C680BC(__p[0], *(void **)(a1 + 64), *(_DWORD *)(a1 + 4), *(_DWORD *)(a1 + 8), 2.0);
  v8 = *(unsigned int *)(a1 + 8);
  v9 = *(int *)(a1 + 4);
  v10 = *(_DWORD *)(a1 + 8);
  v11 = llroundf((float)(int)v9 * 0.07);
  if (v11 >= (int)v9)
    v12 = v9;
  else
    v12 = v11;
  v13 = llroundf((float)(int)v8 * 0.07);
  if (v13 >= (int)v8)
    v14 = v8;
  else
    v14 = v13;
  if ((int)v12 >= 1)
  {
    v15 = 0;
    v16 = v12;
    do
    {
      if ((int)v8 >= 1)
        bzero((void *)(*v5 + v15), v8);
      v15 += (int)v8;
      --v16;
    }
    while (v16);
    v17 = (int)v9 - (int)v12;
    v18 = v10 * v17;
    do
    {
      if (v10 >= 1)
        bzero((void *)(*v5 + v18), v8);
      ++v17;
      v18 += (int)v8;
    }
    while (v17 < v9);
  }
  if ((int)v9 >= 1)
  {
    v19 = 0;
    v20 = 0;
    do
    {
      if ((int)v14 >= 1)
      {
        v21 = *v5 + v20 * (int)v8;
        v22 = (_BYTE *)(*v5 + v19);
        v23 = v10 - 1;
        v24 = v14;
        do
        {
          *v22++ = 0;
          *(_BYTE *)(v21 + v23--) = 0;
          --v24;
        }
        while (v24);
      }
      ++v20;
      v19 += (int)v8;
    }
    while (v20 != v9);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1D4C68854(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D4C68870(uint64_t a1, unsigned int a2, float a3)
{
  *(_BYTE *)(a1 + 12) = a2;
  *(float *)(a1 + 16) = a3;
  sub_1D4C7C838((uint64_t *)(a1 + 112), a2, *(_QWORD *)(a1 + 64), *(_DWORD *)(a1 + 4), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 8));
  return sub_1D4C688AC(a1);
}

uint64_t sub_1D4C688AC(uint64_t a1)
{
  int v2;
  unsigned int v3;
  uint64_t v4;
  _BOOL4 v5;

  v2 = *(_DWORD *)(a1 + 4);
  if (v2 >= *(_DWORD *)(a1 + 8))
    v2 = *(_DWORD *)(a1 + 8);
  v3 = vcvtps_s32_f32(*(float *)(a1 + 16) * (float)v2);
  v4 = a1 + 112;
  v5 = sub_1D4C7C9E4((_QWORD *)(a1 + 112), v3, v3, (_DWORD *)(a1 + 160), (_DWORD *)(a1 + 168));
  return v5 & sub_1D4C7CA20(v4, v3, v3, (_DWORD *)(a1 + 164), (_DWORD *)(a1 + 172));
}

void sub_1D4C68928(uint64_t a1, uint64_t *a2, uint64_t a3, int a4)
{
  _DWORD *v7;
  int v8;
  unint64_t v9;
  qos_class_t v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  unsigned int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  float *v23;
  int *v24;
  int v25;
  int v26;
  int v27;
  _QWORD block[10];
  unsigned int v30;
  int v31;
  int v32;
  void *__p[4];

  v7 = (_DWORD *)sub_1D4C88E08(a2[1], 0);
  v8 = v7[1];
  v27 = v7[4] * *v7;
  v9 = (v27 * v8);
  v32 = 0;
  sub_1D4C68BE8(__p, v9, &v32);
  v10 = qos_class_self();
  global_queue = dispatch_get_global_queue(v10, 0);
  v26 = a4 - a3;
  if (a4 - (int)a3 >= 2)
  {
    v12 = global_queue;
    v13 = (v8 + 7) >> 3;
    v14 = a4 - 1;
    do
    {
      v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)*a2 + 16))(*a2, a3);
      a3 = (a3 + 1);
      v16 = a2[1];
      v17 = *(_QWORD *)(v16 + 184);
      v18 = *(_DWORD *)(v16 + 192);
      v19 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)*a2 + 16))(*a2, a3);
      v20 = a2[1];
      v21 = *(_QWORD *)(v20 + 184);
      LODWORD(v20) = *(_DWORD *)(v20 + 192);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = sub_1D4C68B20;
      block[3] = &unk_1E9864098;
      block[4] = a1;
      block[5] = a2;
      block[6] = v17 + (v18 * v15);
      block[7] = v7;
      v30 = v13;
      v31 = v27;
      block[8] = v21 + (v20 * v19);
      block[9] = __p;
      dispatch_apply(8uLL, v12, block);
    }
    while (v14 != (_DWORD)a3);
  }
  v32 = 0;
  sub_1D4C68BB8(a1 + 88, v9, &v32);
  v22 = __p[0];
  if ((_DWORD)v9)
  {
    v23 = *(float **)(a1 + 88);
    v24 = (int *)__p[0];
    do
    {
      v25 = *v24++;
      *v23++ = (float)v25 / (float)v26;
      --v9;
    }
    while (v9);
  }
  else if (!__p[0])
  {
    return;
  }
  __p[1] = v22;
  operator delete(v22);
}

void sub_1D4C68AF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D4C68B20(uint64_t result, int a2)
{
  int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  v2 = *(_DWORD *)(result + 80);
  v3 = v2 * a2;
  v4 = v2 * a2 + v2;
  v5 = *(_DWORD *)(*(_QWORD *)(result + 32) + 4);
  if (v4 < v5)
    v5 = v4;
  if (v3 < v5)
  {
    v6 = *(_QWORD *)(result + 48);
    v7 = *(_QWORD *)(result + 56);
    v8 = *(_QWORD *)(result + 64);
    LODWORD(v9) = *(_DWORD *)(result + 84);
    do
    {
      if ((_DWORD)v9)
      {
        v10 = 0;
        v11 = *(_DWORD *)(v7 + 8) * (v3 / *(_DWORD *)(v7 + 24));
        v12 = v6 + v11;
        v13 = v8 + v11;
        v14 = **(_QWORD **)(result + 72);
        do
        {
          v15 = *(unsigned __int8 *)(v12 + v10) - *(unsigned __int8 *)(v13 + v10);
          if (v15 < 0)
            v15 = *(unsigned __int8 *)(v13 + v10) - *(unsigned __int8 *)(v12 + v10);
          *(_DWORD *)(v14 + 4 * (v10++ + v3 * (_DWORD)v9)) += v15;
          v9 = *(unsigned int *)(result + 84);
        }
        while (v10 < v9);
      }
      ++v3;
    }
    while (v3 != v5);
  }
  return result;
}

void sub_1D4C68BB8(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    sub_1D4C68C68((void **)a1, a2 - v3, a3);
  }
}

_QWORD *sub_1D4C68BE8(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D4C61FBC(a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1D4C68C4C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D4C68C68(void **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _DWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _DWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  int v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 2)
  {
    if (a2)
    {
      v16 = 4 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 2);
    if (v11 >> 62)
      sub_1D4C590D0();
    v12 = v10 >> 2;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 1 > v11)
      v11 = v13 >> 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
      v14 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)sub_1D4C61FFC(v6, v14);
    else
      v15 = 0;
    v18 = &v15[4 * v12];
    v19 = &v18[4 * a2];
    v20 = 4 * a2;
    v21 = v18;
    do
    {
      *(_DWORD *)v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    v22 = &v15[4 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 4)
    {
      v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

uint64_t sub_1D4C6C034(void *a1, uint64_t *a2, void *a3, void *a4, char a5, CMTime *a6, void *a7, void *a8, double a9, double a10)
{
  id v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  __CFArray *Mutable;
  id v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  void *v32;
  uint64_t v33;
  __int128 *v34;
  __int128 v35;
  uint64_t v36;
  unsigned int v37;
  int v38;
  void *v39;
  char *v40;
  opaqueCMSampleBuffer *ValueAtIndex;
  __CVBuffer *ImageBuffer;
  int v43;
  VideoWriter *v44;
  size_t Width;
  size_t Height;
  uint64_t timescale;
  __int128 v48;
  CFIndex v49;
  opaqueCMSampleBuffer *v50;
  CVImageBufferRef v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  unsigned int (**v80)(float);
  id v81;
  void *v82;
  CMTime v85;
  _OWORD v86[3];
  __int128 v87;
  uint64_t v88;
  _OWORD v89[3];
  CMTime v90;
  CMTime v91;
  CMTime value;
  CMTime rhs;
  CMTime lhs;
  CMTime v95;
  CMTime v96;
  _OWORD v97[2];
  __int128 v98;
  __int128 v99;
  uint64_t v100;
  CMTime v101;

  v17 = a1;
  v76 = a3;
  v81 = a4;
  v80 = a7;
  v78 = v17;
  v79 = a8;
  if (!v17 || !v81 || !v79)
  {
    NSLog(CFSTR("alPingPongRender: nil URL input"));
    v22 = 5;
    goto LABEL_53;
  }
  v18 = (void *)MEMORY[0x1D82662EC]();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "URLByAppendingPathComponent:", CFSTR("pingPongTempFwd.mov"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "URLByAppendingPathComponent:", CFSTR("pingPongTempRev.mov"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "removeItemAtURL:error:", v82, 0);
  objc_msgSend(v75, "removeItemAtURL:error:", v77, 0);
  objc_msgSend(v75, "removeItemAtURL:error:", v79, 0);
  v19 = sub_1D4C62A90(v17, (uint64_t)a2, 0, v81, a5, &unk_1E9863E10, v82, a9, a10);
  v20 = v19;
  if (v19)
  {
    v21 = 1;
    LODWORD(v22) = v19;
    goto LABEL_50;
  }
  v24 = *a2;
  v23 = a2[1];
  v25 = -[VideoReader initFromFile:]([VideoReader alloc], "initFromFile:", v82);
  if (!v25)
  {
    objc_msgSend(v82, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("alPingPongRender: error creating VideoReader at %@"), v26);

    objc_msgSend(v75, "removeItemAtURL:error:", v82, 0);
  }
  objc_msgSend(v25, "setPixelFormatOptions:", 3588);
  objc_msgSend(v25, "setReadAheadEnable:", 0);
  v69 = v18;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v28 = 0;
  v20 = 0;
  v29 = (v23 - v24) >> 3;
  v30 = v29 - 1;
  v101 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v72 = *MEMORY[0x1E0C8A2E8];
  v70 = *MEMORY[0x1E0C8AE70];
  v73 = v29;
  v31 = (float)(unint64_t)v29;
  v68 = v29 - 1;
  do
  {
    v32 = (void *)MEMORY[0x1D82662EC]();
    if ((unint64_t)(v30 - 1) >= 0x10)
      v33 = 16;
    else
      v33 = v30 - 1;
    v34 = *(__int128 **)(*a2 + 8 * (v30 - v33));
    v35 = *v34;
    v100 = *((_QWORD *)v34 + 2);
    v99 = v35;
    objc_msgSend(v25, "setReadStartT:", &v99);
    value.value = 0;
    v36 = v33;
    if (v33)
    {
      while (1)
      {
        v37 = objc_msgSend(v25, "getFrameAsSampleBuf:", &value);
        if (v37)
          break;
        CFArrayAppendValue(Mutable, (const void *)value.value);
        CFRelease((CFTypeRef)value.value);
        if (!--v36)
          goto LABEL_16;
      }
      objc_msgSend(v82, "path");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = sub_1D4C8852C(v37);
      NSLog(CFSTR("alPingPongRender: Error reading from %@: %s"), v39, v40);

      goto LABEL_19;
    }
LABEL_16:
    if (v20)
    {
      v38 = 2;
    }
    else
    {
      objc_msgSend(v25, "reset");
      if (!v28)
      {
        ValueAtIndex = (opaqueCMSampleBuffer *)CFArrayGetValueAtIndex(Mutable, 0);
        ImageBuffer = CMSampleBufferGetImageBuffer(ValueAtIndex);
        v43 = sub_1D4C885C8(ImageBuffer);
        v44 = [VideoWriter alloc];
        Width = CVPixelBufferGetWidth(ImageBuffer);
        Height = CVPixelBufferGetHeight(ImageBuffer);
        timescale = a6->timescale;
        v48 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v97[0] = *MEMORY[0x1E0C9BAA8];
        v97[1] = v48;
        v98 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        LODWORD(v66) = v43 | 0xE00;
        v28 = -[VideoWriter initForURL:fileType:codecType:imgWidth:imgHeight:fps:timeScale:transform:pixFormat:metadata:](v44, "initForURL:fileType:codecType:imgWidth:imgHeight:fps:timeScale:transform:pixFormat:metadata:", v77, v72, v70, Width, Height, timescale, COERCE_DOUBLE(__PAIR64__(DWORD1(v98), 30.0)), v97, v66, 0);
        if (!v28)
        {
          NSLog(CFSTR("alPingPongRender: error creating VideoWriter"));
          v28 = 0;
LABEL_19:
          v38 = 2;
          v20 = 9;
          goto LABEL_32;
        }
      }
      if (v33)
      {
        v49 = v33 - 1;
        while (1)
        {
          v50 = (opaqueCMSampleBuffer *)CFArrayGetValueAtIndex(Mutable, v49);
          v51 = CMSampleBufferGetImageBuffer(v50);
          v96 = v101;
          objc_msgSend(v28, "addFrameAsPixelBuf:atFrameTime:", v51, &v96);
          v52 = objc_claimAutoreleasedReturnValue();
          v53 = (void *)v52;
          if (v52)
            break;
          lhs = v101;
          rhs = *a6;
          CMTimeAdd(&v95, &lhs, &rhs);
          v101 = v95;
          if (--v49 == -1)
            goto LABEL_26;
        }
        NSLog(CFSTR("alPingPongRender: error writing to output video (%@)"), v52);
        objc_msgSend(v28, "lastError");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = sub_1D4C632CC(v54);

      }
      else
      {
LABEL_26:
        v20 = 0;
      }
      CFArrayRemoveAllValues(Mutable);
      if (v80[2]((float)(unint64_t)(v73 - (v30 - v33)) / v31))
      {
        v38 = 0;
      }
      else
      {
        v20 = 1;
        v38 = 2;
      }
      v30 -= v33;
    }
LABEL_32:
    objc_autoreleasePoolPop(v32);
  }
  while (!v38 && v30 != 1);
  CFRelease(Mutable);
  if (v20)
  {
    objc_msgSend(v75, "removeItemAtURL:error:", v82, 0);
    objc_msgSend(v75, "removeItemAtURL:error:", v77, 0);
    v21 = 1;
    LODWORD(v22) = v20;
  }
  else
  {
    objc_msgSend(v28, "finish");
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)v55;
    if (v55)
    {
      NSLog(CFSTR("alPingPongRender: error on [VideoWriter finish]: %@"), v55);
      objc_msgSend(v75, "removeItemAtURL:error:", v82, 0);
      objc_msgSend(v75, "removeItemAtURL:error:", v77, 0);
      objc_msgSend(v28, "lastError");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v22) = sub_1D4C632CC(v57);
      v20 = 0;
      v21 = 1;
    }
    else
    {

      objc_msgSend(MEMORY[0x1E0C8B268], "composition");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = *MEMORY[0x1E0C8A808];
      objc_msgSend(v57, "addMutableTrackWithMediaType:preferredTrackID:", *MEMORY[0x1E0C8A808], 0);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v82);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C8B3C0], "assetWithURL:", v77);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "tracksWithMediaType:", v58);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "tracksWithMediaType:", v58);
      v22 = objc_claimAutoreleasedReturnValue();
      if (v60 && objc_msgSend(v60, "count") == 1 && v22 && objc_msgSend((id)v22, "count") == 1)
      {
        objc_msgSend(v60, "objectAtIndexedSubscript:", 0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v22, "objectAtIndexedSubscript:", 0);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = *(CMTime *)*(_QWORD *)(*a2 + 8 * v68);
        v91 = v95;
        v90 = *a6;
        CMTimeAdd(&value, &v91, &v90);
        v95 = value;
        if (v61)
          objc_msgSend(v61, "timeRange");
        else
          memset(v89, 0, sizeof(v89));
        v87 = *MEMORY[0x1E0CA2E68];
        v88 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
        objc_msgSend(v74, "insertTimeRange:ofTrack:atTime:error:", v89, v61, &v87, 0);
        if (v67)
          objc_msgSend(v67, "timeRange");
        else
          memset(v86, 0, sizeof(v86));
        v85 = v95;
        objc_msgSend(v74, "insertTimeRange:ofTrack:atTime:error:", v86, v67, &v85, 0);
        v63 = objc_alloc(MEMORY[0x1E0C8AFC0]);
        v64 = (void *)objc_msgSend(v63, "initWithAsset:presetName:", v57, *MEMORY[0x1E0C89E98]);
        objc_msgSend(v64, "setOutputURL:", v79);
        objc_msgSend(v64, "setOutputFileType:", v72);
        objc_msgSend(v64, "setShouldOptimizeForNetworkUse:", 1);
        if (v76)
        {
          +[LoopQuicktimeMetadata metadataArrayForDictionary:](LoopQuicktimeMetadata, "metadataArrayForDictionary:", v76);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setMetadata:", v65);

        }
        v20 = sub_1D4C6CAD8(v64);
        v80[2](1.0);
        objc_msgSend(v75, "removeItemAtURL:error:", v82, 0);
        objc_msgSend(v75, "removeItemAtURL:error:", v77, 0);

        v21 = 0;
      }
      else
      {
        NSLog(CFSTR("alPingPongRender: malformed temp files"));
        objc_msgSend(v75, "removeItemAtURL:error:", v82, 0);
        objc_msgSend(v75, "removeItemAtURL:error:", v77, 0);
        v20 = 0;
        v21 = 1;
      }

      v28 = 0;
      LODWORD(v22) = 9;
    }

  }
  v18 = v69;
LABEL_50:

  objc_autoreleasePoolPop(v18);
  if (v21)
    v22 = v22;
  else
    v22 = v20;
LABEL_53:

  return v22;
}

void sub_1D4C6C928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C6CAD0()
{
  return 1;
}

uint64_t sub_1D4C6CAD8(void *a1)
{
  id v1;
  dispatch_semaphore_t v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  float v8;
  dispatch_time_t v9;
  float v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  intptr_t (*v15)(uint64_t);
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v1 = a1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v2 = dispatch_semaphore_create(0);
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = sub_1D4C6CCD0;
  v16 = &unk_1E98640C0;
  v3 = v1;
  v17 = v3;
  v19 = &v21;
  v20 = &v25;
  v4 = v2;
  v18 = v4;
  objc_msgSend(v3, "exportAsynchronouslyWithCompletionHandler:", &v13);
  if (!*((_BYTE *)v26 + 24))
  {
    v7 = 0;
    v8 = 0.0;
    do
    {
      v9 = dispatch_time(0, 1000000000);
      if (!dispatch_semaphore_wait(v4, v9) || *((_BYTE *)v26 + 24))
        break;
      objc_msgSend(v3, "progress");
      if (v10 == v8 && ++v7 == 10)
      {
        v11 = objc_msgSend(v3, "status");
        objc_msgSend(v3, "error");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Export timed out; exporter status %d; error %@"), v11, v12, v13, v14, v15, v16, v17);

        v5 = 9;
        goto LABEL_3;
      }
      v8 = v10;
    }
    while (!*((_BYTE *)v26 + 24));
  }
  v5 = *((unsigned int *)v22 + 6);
LABEL_3:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v5;
}

void sub_1D4C6CC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, void *a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  va_list va;

  va_start(va, a11);
  v15 = v13;

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 80), 8);

  _Unwind_Resume(a1);
}

intptr_t sub_1D4C6CCD0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "status");
  if (v2 == 5)
  {
    NSLog(CFSTR("Export canceled"));
    v4 = 1;
    goto LABEL_5;
  }
  if (v2 == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Export failed: %@"), v3);

    v4 = 9;
LABEL_5:
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1D4C6CD68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C6CD78(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t **v5;
  uint64_t i;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  int v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t *v15;
  int *v17;

  a1[2] = 0;
  v4 = a1 + 2;
  a1[1] = a1 + 2;
  v5 = (uint64_t **)(a1 + 1);
  a1[3] = 0;
  a1[4] = 0x100000001;
  *a1 = 0;
  if (a2)
  {
    for (i = 0; i != a2; ++i)
    {
      v9 = *v4;
      if (!*v4)
        goto LABEL_13;
      v10 = *(_DWORD *)(a3 + 4 * i);
      v11 = v4;
      do
      {
        v12 = *(_DWORD *)(v9 + 32);
        v13 = v12 < v10;
        if (v12 >= v10)
          v14 = (uint64_t *)v9;
        else
          v14 = (uint64_t *)(v9 + 8);
        if (!v13)
          v11 = (_QWORD *)v9;
        v9 = *v14;
      }
      while (*v14);
      if (v11 == v4 || *((_DWORD *)v11 + 8) > v10)
      {
LABEL_13:
        v15 = (uint64_t *)operator new();
        *(_DWORD *)v15 = -1;
        v15[1] = 0;
        v15[2] = 0;
        v17 = (int *)(a3 + 4 * i);
        sub_1D4C60C4C(v5, v17, (uint64_t)&unk_1D4C95448, &v17)[5] = v15;
      }
    }
  }
  return a1;
}

void sub_1D4C6CE90(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD **v2;

  sub_1D4C60C0C(v1, *v2);
  _Unwind_Resume(a1);
}

BOOL sub_1D4C6CEA8(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  uint64_t *v8;

  v4 = *(_QWORD *)(a1 + 16);
  v2 = a1 + 16;
  v3 = v4;
  if (!v4)
    goto LABEL_11;
  v5 = v2;
  do
  {
    v6 = *(_DWORD *)(v3 + 32);
    v7 = v6 < a2;
    if (v6 >= a2)
      v8 = (uint64_t *)v3;
    else
      v8 = (uint64_t *)(v3 + 8);
    if (!v7)
      v5 = v3;
    v3 = *v8;
  }
  while (*v8);
  if (v5 == v2 || *(_DWORD *)(v5 + 32) > a2)
LABEL_11:
    v5 = v2;
  return v5 != v2;
}

uint64_t *sub_1D4C6CEF8(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  BOOL v5;
  uint64_t *v6;
  int v8;
  int *v9;

  v8 = a2;
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 0;
  v3 = a1 + 16;
  do
  {
    v4 = *(_DWORD *)(v2 + 32);
    v5 = v4 < a2;
    if (v4 >= a2)
      v6 = (uint64_t *)v2;
    else
      v6 = (uint64_t *)(v2 + 8);
    if (!v5)
      v3 = v2;
    v2 = *v6;
  }
  while (*v6);
  if (v3 == a1 + 16 || *(_DWORD *)(v3 + 32) > a2)
    return 0;
  v9 = &v8;
  return sub_1D4C60C4C((uint64_t **)(a1 + 8), &v8, (uint64_t)&unk_1D4C95448, &v9)[5];
}

uint64_t sub_1D4C6CF84(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t result;

  v6 = sub_1D4C6CEF8(a1, a2);
  if (!v6)
    return 0xFFFFFFFFLL;
  v7 = v6;
  v8 = v6[1];
  if (v8)
    MEMORY[0x1D82660DC](v8, 0x1000C40504FFAC1);
  result = 0;
  v7[1] = a3;
  *(_DWORD *)v7 = a4;
  return result;
}

uint64_t sub_1D4C6CFE8(uint64_t a1)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v2 = sub_1D4C6CEF8(a1, 3);
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = v2;
  v4 = v2[1];
  if (v4)
    MEMORY[0x1D82660DC](v4, 0x1000C40504FFAC1);
  v5 = sub_1D4C6D05C(a1);
  if (v5)
  {
    v6 = v5;
    result = 0;
    v3[1] = v6;
  }
  else
  {
    result = 0xFFFFFFFFLL;
  }
  *(_DWORD *)v3 = result;
  return result;
}

uint64_t sub_1D4C6D05C(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  if (!*(_QWORD *)a1)
    return 0;
  result = operator new();
  v3 = (*(_QWORD *)(*(_QWORD *)a1 + 72) - *(_QWORD *)(*(_QWORD *)a1 + 64)) >> 3;
  *(_DWORD *)result = 0;
  *(_DWORD *)(result + 4) = v3;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0x300000000;
  return result;
}

uint64_t sub_1D4C6D0BC(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t *v5;
  id *v6;
  uint64_t result;

  v4 = sub_1D4C6CEF8(a1, a2);
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = v4;
  v6 = (id *)v4[2];
  if (v6)
  {

    MEMORY[0x1D82660DC](v6, 0x1080C40C39FFA3DLL);
  }
  result = 0;
  v5[2] = a3;
  return result;
}

uint64_t *sub_1D4C6D134(uint64_t a1, int a2)
{
  uint64_t *result;

  result = sub_1D4C6CEF8(a1, a2);
  if (result)
    return (uint64_t *)result[2];
  return result;
}

uint64_t sub_1D4C6D150(uint64_t a1, int a2)
{
  uint64_t *v4;

  v4 = sub_1D4C6CEF8(a1, a2);
  if (v4)
    return v4[1];
  if (a2 == 3)
    return sub_1D4C6D05C(a1);
  return 0;
}

_QWORD *sub_1D4C6D19C(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;

  if (*a1)
  {
    v2 = sub_1D4C83294();
    MEMORY[0x1D82660DC](v2, 0x1080C4022FFC67CLL);
  }
  v3 = (_QWORD *)a1[1];
  if (v3 != a1 + 2)
  {
    do
    {
      v4 = v3[5];
      if (v4)
      {
        v5 = sub_1D4C6E180(v4);
        MEMORY[0x1D82660DC](v5, 0x1020C40F89CB87BLL);
      }
      v6 = (_QWORD *)v3[1];
      if (v6)
      {
        do
        {
          v7 = v6;
          v6 = (_QWORD *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (_QWORD *)v3[2];
          v8 = *v7 == (_QWORD)v3;
          v3 = v7;
        }
        while (!v8);
      }
      v3 = v7;
    }
    while (v7 != a1 + 2);
  }
  sub_1D4C60C0C((uint64_t)(a1 + 1), (_QWORD *)a1[2]);
  return a1;
}

uint64_t sub_1D4C6D260(uint64_t *a1, int a2, int *a3)
{
  uint64_t v6;
  float *v7;
  uint64_t v8;
  uint64_t *v9;
  int v10;
  uint64_t v11;

  *a3 = -1;
  if (!*a1)
    return 0;
  v6 = sub_1D4C6D150((uint64_t)a1, a2);
  if (!v6)
    return 0;
  v7 = (float *)v6;
  v8 = operator new();
  sub_1D4C6359C(v8);
  if (!sub_1D4C635DC(v8, *a1, v7))
  {
    v11 = sub_1D4C63CA0(v8);
    MEMORY[0x1D82660DC](v11, 0x1080C40AAA5770BLL);
    return 0;
  }
  v9 = sub_1D4C6CEF8((uint64_t)a1, a2);
  if (v9)
    v10 = *(_DWORD *)v9;
  else
    v10 = -1;
  *a3 = v10;
  return v8;
}

void sub_1D4C6D32C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D82660DC](v1, 0x1080C40AAA5770BLL);
  _Unwind_Resume(a1);
}

const __CFString *sub_1D4C6D350(unsigned int a1)
{
  if (a1 > 3)
    return CFSTR("UnknownFlavor");
  else
    return off_1E9864150[a1];
}

uint64_t sub_1D4C6D374(void *a1, _DWORD *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a1;
  v4 = v3;
  if (!v3)
    goto LABEL_11;
  *a2 = 0;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AutoLoop")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Bounce")) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("PingPong")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_12;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("LongExposure")) & 1) != 0)
    {
      v5 = 2;
      goto LABEL_12;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Stabilize")) & 1) != 0)
    {
      v5 = 3;
      goto LABEL_12;
    }
LABEL_11:
    v5 = 0;
    *a2 = -1;
    goto LABEL_12;
  }
  v5 = 0;
LABEL_12:

  return v5;
}

void sub_1D4C6D440(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C6D450(uint64_t a1, uint64_t a2)
{
  if (a2 > a1)
    return 4294967291;
  if (a2 < 2)
  {
    if ((_DWORD)a1)
    {
      if ((_DWORD)a1 != 1)
        NSLog(CFSTR("Warning: liveAnalysis dictionary version (%u) exceeds code version (%u): running old build?"), a1, 1);
      return 0;
    }
    else
    {
      NSLog(CFSTR("Error: liveAnalysis dictionary version (%u) is no longer supported by this code version (%u)"), 0, 1);
      return 4294967294;
    }
  }
  else
  {
    NSLog(CFSTR("Error: liveAnalysis dictionary min version exceeds code version (dictionary version %u, dictionary minVersion %u, code version %u)"), a1, a2, 1);
    return 4294967293;
  }
}

uint64_t validateLiveAnalysisDictionaryVersion_0(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Version"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_msgSend(v3, "unsignedIntValue");
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MinVersion"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = sub_1D4C6D450(v4, objc_msgSend(v5, "unsignedIntValue"));
      else
        v6 = 0xFFFFFFFFLL;
      v3 = v5;
    }
    else
    {
      v6 = 0xFFFFFFFFLL;
    }

  }
  else
  {
    v6 = 4294967292;
  }

  return v6;
}

void sub_1D4C6D5D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C6D5F4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t **v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  int v18;
  BOOL v19;
  uint64_t *v20;
  uint64_t *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  int v26;
  uint64_t v28;
  uint64_t v29;
  id obj;
  _QWORD *v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 24))
  {
    v5 = 4294967291;
    goto LABEL_48;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 0xFFFFFFFFLL;
    goto LABEL_47;
  }
  *(_DWORD *)(a1 + 32) = objc_msgSend(v6, "unsignedIntValue");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MinVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 0xFFFFFFFFLL;
    goto LABEL_46;
  }
  v8 = objc_msgSend(v7, "unsignedIntValue");
  *(_DWORD *)(a1 + 36) = v8;
  v5 = sub_1D4C6D450(*(unsigned int *)(a1 + 32), v8);
  if ((v5 & 0x80000000) != 0)
    goto LABEL_46;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NormStabilizeInstructions"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_41;
  v9 = operator new();
  v10 = MEMORY[0x1E0CA2E10];
  *(_OWORD *)v9 = *MEMORY[0x1E0CA2E10];
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v10 + 16);
  *(_QWORD *)(v9 + 72) = 0;
  *(_QWORD *)(v9 + 80) = 0;
  *(_QWORD *)(v9 + 64) = 0;
  *(_QWORD *)a1 = v9;
  if (!sub_1D4C83DAC(v9, v32))
  {
LABEL_41:
    v5 = 0xFFFFFFFFLL;
    goto LABEL_45;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v4;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (!v11)
    goto LABEL_44;
  v31 = (_QWORD *)(a1 + 16);
  v12 = (uint64_t **)(a1 + 8);
  v28 = v11;
  v29 = *(_QWORD *)v35;
LABEL_10:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v35 != v29)
      objc_enumerationMutation(obj);
    v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v13);
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("AutoLoop"), v28) & 1) == 0
      && (objc_msgSend(v14, "isEqualToString:", CFSTR("Bounce")) & 1) == 0
      && (objc_msgSend(v14, "isEqualToString:", CFSTR("LongExposure")) & 1) == 0
      && (objc_msgSend(v14, "isEqualToString:", CFSTR("Stabilize")) & 1) == 0)
    {
      goto LABEL_36;
    }
    v33 = 0;
    LODWORD(v33) = sub_1D4C6D374(v14, (_DWORD *)&v33 + 1);
    if (HIDWORD(v33))
      goto LABEL_43;
    objc_msgSend(obj, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0xFFFFFFFFLL;
      goto LABEL_52;
    }
    v16 = *v31;
    if (*v31)
    {
      v17 = v31;
      do
      {
        v18 = *(_DWORD *)(v16 + 32);
        v19 = v18 < (int)v33;
        if (v18 >= (int)v33)
          v20 = (uint64_t *)v16;
        else
          v20 = (uint64_t *)(v16 + 8);
        if (!v19)
          v17 = (_QWORD *)v16;
        v16 = *v20;
      }
      while (*v20);
      if (v17 != v31 && *((_DWORD *)v17 + 8) <= (int)v33)
        break;
    }
    v21 = (uint64_t *)operator new();
    *(_DWORD *)v21 = -1;
    v21[1] = 0;
    v21[2] = 0;
    v38 = &v33;
    sub_1D4C60C4C(v12, (int *)&v33, (uint64_t)&unk_1D4C95448, (_DWORD **)&v38)[5] = v21;
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ErrorCode"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_43;
    }
    v23 = objc_msgSend(v22, "intValue");
    v38 = &v33;
    *(_DWORD *)sub_1D4C60C4C(v12, (int *)&v33, (uint64_t)&unk_1D4C95448, (_DWORD **)&v38)[5] = v23;
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Params"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v38 = &v33, sub_1D4C60C4C(v12, (int *)&v33, (uint64_t)&unk_1D4C95448, (_DWORD **)&v38)[5][1])
      || (v25 = sub_1D4C6DBF0(v24)) == 0
      || (v38 = &v33,
          sub_1D4C60C4C(v12, (int *)&v33, (uint64_t)&unk_1D4C95448, (_DWORD **)&v38)[5][1] = v25,
          v38 = &v33,
          !sub_1D4C60C4C(v12, (int *)&v33, (uint64_t)&unk_1D4C95448, (_DWORD **)&v38)[5][1])
      || (v26 = v33,
          v38 = &v33,
          v26 != *(_DWORD *)(sub_1D4C60C4C(v12, (int *)&v33, (uint64_t)&unk_1D4C95448, (_DWORD **)&v38)[5][1] + 20)))
    {

LABEL_43:
      v5 = 0xFFFFFFFFLL;
      goto LABEL_44;
    }

LABEL_36:
    if (++v13 == v28)
    {
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v28)
        goto LABEL_10;
      goto LABEL_44;
    }
  }
  v5 = 4294967291;
LABEL_52:

LABEL_44:
LABEL_45:

LABEL_46:
  v6 = v7;
LABEL_47:

LABEL_48:
  return v5;
}

void sub_1D4C6DB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C6DBF0(void *a1)
{
  id v1;
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v11;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("loopFlavor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v3 = sub_1D4C6D374(v2, &v11);

  if (v11)
  {
    v4 = 0;
  }
  else
  {
    v4 = operator new();
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
    *(_DWORD *)(v4 + 16) = 0;
    *(_DWORD *)(v4 + 20) = v3;
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("loopStart"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v4 = objc_msgSend(v5, "intValue");

    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("loopPeriod"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(v4 + 4) = objc_msgSend(v6, "intValue");

    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("loopFadeLen"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(v4 + 8) = objc_msgSend(v7, "intValue");

    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("loopEnergy"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    *(_DWORD *)(v4 + 16) = v9;

  }
  return v4;
}

void sub_1D4C6DD14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_1D4C6DD50(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  unsigned int *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD *v15;
  _QWORD *v16;
  BOOL v17;
  id v18;
  const __CFString *v20;
  void *v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("Version"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 36));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("MinVersion"));

  if (*(_QWORD *)a1)
  {
    sub_1D4C83C20(*(_QWORD *)a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("NormStabilizeInstructions"));

    v6 = *(_QWORD **)(a1 + 8);
    if (v6 != (_QWORD *)(a1 + 16))
    {
      do
      {
        v7 = *((int *)v6 + 8);
        v8 = (unsigned int *)v6[5];
        if (v8)
        {
          v9 = *v8;
          v10 = (unsigned int *)*((_QWORD *)v8 + 1);
          if (v10 && (sub_1D4C6E02C(v10), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            v22[0] = CFSTR("ErrorCode");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v22[1] = CFSTR("Params");
            v23[0] = v12;
            v23[1] = v11;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v20 = CFSTR("ErrorCode");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v11;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
        else
        {
          v13 = 0;
        }
        v14 = CFSTR("UnknownFlavor");
        if (v7 <= 3)
          v14 = off_1E9864150[v7];
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, v14);

        v15 = (_QWORD *)v6[1];
        if (v15)
        {
          do
          {
            v16 = v15;
            v15 = (_QWORD *)*v15;
          }
          while (v15);
        }
        else
        {
          do
          {
            v16 = (_QWORD *)v6[2];
            v17 = *v16 == (_QWORD)v6;
            v6 = v16;
          }
          while (!v17);
        }
        v6 = v16;
      }
      while (v16 != (_QWORD *)(a1 + 16));
    }
    v18 = v2;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void sub_1D4C6DFD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_1D4C6E02C(unsigned int *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = (int)a1[5];
  if (v4 > 3)
    v5 = CFSTR("UnknownFlavor");
  else
    v5 = off_1E9864150[v4];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("loopFlavor"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("loopStart"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1[1]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("loopPeriod"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a1[2]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("loopFadeLen"));

  LODWORD(v9) = a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("loopEnergy"));

  return v3;
}

void sub_1D4C6E154(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C6E180(uint64_t a1)
{
  uint64_t v2;
  id *v3;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
    MEMORY[0x1D82660DC](v2, 0x1000C40504FFAC1);
  v3 = *(id **)(a1 + 16);
  if (v3)
  {

    MEMORY[0x1D82660DC](v3, 0x1080C40C39FFA3DLL);
  }
  return a1;
}

uint64_t sub_1D4C6E380()
{
  uint64_t result;

  if (MEMORY[0x1E0D053E8])
  {
    off_1ED9A5840 = (_UNKNOWN *)MEMORY[0x1E0D03AF0];
    off_1ED9A5848 = (_UNKNOWN *)MEMORY[0x1E0D03B00];
    qword_1ED9A5850 = *MEMORY[0x1E0D053A8];
    result = *MEMORY[0x1E0D053E8];
  }
  else
  {
    off_1ED9A5840 = sub_1D4C6E434;
    off_1ED9A5848 = sub_1D4C6E440;
    qword_1ED9A5850 = off_1ED9A5808();
    result = off_1ED9A5810();
  }
  qword_1ED9A5858 = result;
  return result;
}

uint64_t sub_1D4C6E434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return off_1ED9A5818(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1D4C6E440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return off_1ED9A5820(a1, a2, a3, a4, a5);
}

id sub_1D4C6E44C(float a1, float a2, float a3, float a4)
{
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v9 = a1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("X"));

  *(float *)&v11 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("Y"));

  *(float *)&v13 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("Width"));

  *(float *)&v15 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("Height"));

  return v8;
}

id sub_1D4C6E55C(uint64_t a1, int a2)
{
  void *v4;
  uint64_t v5;
  unsigned int *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 >= 1)
  {
    v5 = a2;
    v6 = (unsigned int *)(a1 + 24);
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("objectID"));

      sub_1D4C6E44C(*((float *)v6 - 4), *((float *)v6 - 3), *((float *)v6 - 2), *((float *)v6 - 1));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("boundsRect"));

      objc_msgSend(v4, "addObject:", v7);
      v6 += 8;
      --v5;
    }
    while (v5);
  }
  return v4;
}

uint64_t sub_1D4C6E660(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  void *v4;
  double v5;
  __int16 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  __int16 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _DWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD *v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  *a2 = 0;
  if (*(_DWORD *)a1 > 3u)
    return 4294949854;
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_WORD *)(a1 + 42);
  if ((v6 & 1) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("privET"));

    v6 = *(_WORD *)(a1 + 42);
  }
  if ((v6 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("privAFS"));

    v6 = *(_WORD *)(a1 + 42);
  }
  if ((v6 & 4) != 0)
  {
    v55[0] = *(_QWORD *)(a1 + 16);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v55, 8);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v44, CFSTR("privECMVct"));

    v6 = *(_WORD *)(a1 + 42);
    if ((v6 & 8) == 0)
    {
LABEL_8:
      if ((v6 & 0x10) == 0)
        goto LABEL_9;
      goto LABEL_51;
    }
  }
  else if ((v6 & 8) == 0)
  {
    goto LABEL_8;
  }
  v55[0] = *(_QWORD *)(a1 + 24);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v55, 8);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v45, CFSTR("privEMBVct"));

  v6 = *(_WORD *)(a1 + 42);
  if ((v6 & 0x10) == 0)
  {
LABEL_9:
    if ((v6 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_52;
  }
LABEL_51:
  LODWORD(v5) = *(_DWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v46, CFSTR("privTZF"));

  v6 = *(_WORD *)(a1 + 42);
  if ((v6 & 0x20) == 0)
  {
LABEL_10:
    if ((v6 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_53;
  }
LABEL_52:
  LODWORD(v5) = *(_DWORD *)(a1 + 36);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v47, CFSTR("privImgG"));

  v6 = *(_WORD *)(a1 + 42);
  if ((v6 & 0x40) == 0)
  {
LABEL_11:
    if ((v6 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(char *)(a1 + 40));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v48, CFSTR("privAFSt"));

  if ((*(_WORD *)(a1 + 42) & 0x80) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(char *)(a1 + 41));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("privFM"));

  }
LABEL_13:
  if (*(_DWORD *)(a1 + 44))
  {
    v53 = v4;
    v54 = v2;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_DWORD *)(a1 + 44))
    {
      v11 = 0;
      v12 = a1 + 48;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_WORD *)(v12 + 30);
        if ((v14 & 2) != 0)
        {
          sub_1D4C6E44C(*(float *)(v12 + 8), *(float *)(v12 + 12), *(float *)(v12 + 16), *(float *)(v12 + 20));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("Rect"));

          v14 = *(_WORD *)(v12 + 30);
          if ((v14 & 4) != 0)
          {
LABEL_23:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v12 + 24));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("faceID"));

            if ((*(_WORD *)(v12 + 30) & 1) == 0)
              goto LABEL_20;
LABEL_19:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("relSampleTime"));

            goto LABEL_20;
          }
        }
        else if ((v14 & 4) != 0)
        {
          goto LABEL_23;
        }
        if ((v14 & 1) != 0)
          goto LABEL_19;
LABEL_20:
        objc_msgSend(v10, "addObject:", v13);

        ++v11;
        v12 += 32;
      }
      while (v11 < *(unsigned int *)(a1 + 44));
    }
    v4 = v53;
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v10, CFSTR("privDFArray"));

    v2 = v54;
  }
  if (*(_DWORD *)a1 < 2u)
    goto LABEL_47;
  v19 = v4;
  v20 = *(unsigned int *)(a1 + 44);
  v21 = a1 + 32 * v20;
  v24 = *(int *)(v21 + 48);
  v22 = (_DWORD *)(v21 + 48);
  v23 = v24;
  v25 = (int)v22[1];
  v26 = (int)v22[2];
  v27 = v22[3];
  if ((_DWORD)v24)
  {
    sub_1D4C6E55C((uint64_t)(v22 + 4), v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v28, CFSTR("humanBodies"));

  }
  if ((_DWORD)v25)
  {
    sub_1D4C6E55C((uint64_t)&v22[8 * v23 + 4], v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v29, CFSTR("catBodies"));

  }
  if ((_DWORD)v26)
  {
    sub_1D4C6E55C((uint64_t)&v22[8 * v25 + 4 + 8 * v23], v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v30, CFSTR("dogBodies"));

  }
  v4 = v19;
  if (v27)
  {
    sub_1D4C6E55C((uint64_t)&v22[8 * v26 + 4 + 8 * (int)v25 + 8 * (int)v23], v27);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v31, CFSTR("salientObjects"));

  }
  if (*(_DWORD *)a1 < 3u)
    goto LABEL_47;
  v32 = v22[3];
  v33 = (v22[1] + *v22 + v22[2]);
  v34 = (uint64_t)&v22[8 * v33 + 8 * v32];
  v37 = *(_WORD *)(v34 + 16);
  v36 = v34 + 16;
  LOBYTE(v35) = v37;
  if ((v37 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 9);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v40 = 32 * v20 + 32 * v32 + 32 * v33 + a1 + 68;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(float *)(v40 + v39));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "addObject:", v41);

      v39 += 4;
    }
    while (v39 != 36);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, CFSTR("privRefHom"));

    v35 = *(_WORD *)v36;
  }
  if ((v35 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v36 + 40));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v49, CFSTR("ptsInNanos"));

    v35 = *(_WORD *)v36;
    if ((*(_WORD *)v36 & 4) == 0)
    {
LABEL_43:
      if ((v35 & 8) == 0)
        goto LABEL_44;
      goto LABEL_57;
    }
  }
  else if ((v35 & 4) == 0)
  {
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v36 + 48));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v50, CFSTR("originalPTSInNanos"));

  v35 = *(_WORD *)v36;
  if ((*(_WORD *)v36 & 8) == 0)
  {
LABEL_44:
    if ((v35 & 0x10) == 0)
      goto LABEL_45;
LABEL_58:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", *(char *)(v36 + 57));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v52, CFSTR("IrisSequenceAdjusterDisplacement"));

    if ((*(_WORD *)v36 & 0x20) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v36 + 56));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v51, CFSTR("IrisSequenceAdjusterRecipe"));

  v35 = *(_WORD *)v36;
  if ((*(_WORD *)v36 & 0x10) != 0)
    goto LABEL_58;
LABEL_45:
  if ((v35 & 0x20) != 0)
  {
LABEL_46:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v36 + 58));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v42, CFSTR("InterpolatedFrame"));

  }
LABEL_47:
  v43 = objc_retainAutorelease(v4);
  *v2 = v43;

  return 0;
}

uint64_t sub_1D4C6ED04(const __CFData *a1, _QWORD *a2)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v12;
  size_t size;
  unsigned int v14;

  BytePtr = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  v14 = 0;
  size = 0;
  v6 = off_1ED9A5840(BytePtr, Length, 3, 0, &v14, &size);
  if ((_DWORD)v6)
  {
    v7 = v6;
    NSLog(CFSTR("FigLivePhotoMetadataComputeDeserializationSize returned error %d"), v6);
  }
  else
  {
    v8 = malloc_type_malloc(size, 0xAADC7F20uLL);
    if (v8)
    {
      v9 = v8;
      v10 = off_1ED9A5848(BytePtr, Length, v14, size, v8);
      if ((_DWORD)v10)
      {
        v7 = v10;
        NSLog(CFSTR("FigLivePhotoMetadataDeserializeIntoBuffer returned error %d"), v10);
      }
      else
      {
        v12 = 0;
        v7 = sub_1D4C6E660((uint64_t)v9, &v12);
        *a2 = v12;
      }
      free(v9);
    }
    else
    {
      NSLog(CFSTR("Could not allocate live photo metadata"));
      return 0;
    }
  }
  return v7;
}

uint64_t sub_1D4C6FE48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_1EFEC8008 != -1)
    dispatch_once(&qword_1EFEC8008, &unk_1E9864170);
  off_1ED9A5818 = (uint64_t (*)())dlsym((void *)qword_1EFEC8010, "FigLivePhotoMetadataComputeDeserializationSize");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1ED9A5818)(a1, a2, a3, a4, a5, a6);
}

void *sub_1D4C6FEE8()
{
  void *result;

  result = dlopen("/System/Library/Frameworks/CoreMedia.framework/CoreMedia", 2);
  qword_1EFEC8010 = (uint64_t)result;
  return result;
}

uint64_t sub_1D4C6FF10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (qword_1EFEC8008 != -1)
    dispatch_once(&qword_1EFEC8008, &unk_1E9864170);
  off_1ED9A5820 = (uint64_t (*)())dlsym((void *)qword_1EFEC8010, "FigLivePhotoMetadataDeserializeIntoBuffer");
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1ED9A5820)(a1, a2, a3, a4, a5);
}

uint64_t sub_1D4C6FFA8()
{
  uint64_t *v0;
  uint64_t result;

  if (qword_1EFEC8008 != -1)
    dispatch_once(&qword_1EFEC8008, &unk_1E9864170);
  v0 = (uint64_t *)dlsym((void *)qword_1EFEC8010, "kFigMetadataDataType_QuickTimeMetadataLivePhotoInfo");
  if (v0)
  {
    result = *v0;
    qword_1EFEC8018 = result;
  }
  else
  {
    result = qword_1EFEC8018;
  }
  off_1ED9A5808 = sub_1D4C70020;
  return result;
}

uint64_t sub_1D4C70020()
{
  return qword_1EFEC8018;
}

uint64_t sub_1D4C7002C()
{
  uint64_t *v0;
  uint64_t result;

  if (qword_1EFEC8008 != -1)
    dispatch_once(&qword_1EFEC8008, &unk_1E9864170);
  v0 = (uint64_t *)dlsym((void *)qword_1EFEC8010, "kFigMetadataIdentifier_QuickTimeMetadataLivePhotoInfo");
  if (v0)
  {
    result = *v0;
    qword_1EFEC8020 = result;
  }
  else
  {
    result = qword_1EFEC8020;
  }
  off_1ED9A5810 = sub_1D4C700A4;
  return result;
}

uint64_t sub_1D4C700A4()
{
  return qword_1EFEC8020;
}

float sub_1D4C700B0(uint64_t *a1, uint64_t *a2, _DWORD *a3, float result)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *a3 = 0;
  v4 = *a1;
  v5 = a1[1];
  v6 = (v5 - *a1) >> 2;
  v7 = *a2;
  if (v6 != (a2[1] - *a2) >> 2)
    *a3 = -1;
  if (v5 != v4)
  {
    v8 = 0;
    do
    {
      result = result + (float)(*(float *)(v4 + 4 * v8) * *(float *)(v7 + 4 * v8));
      ++v8;
    }
    while (v6 > v8);
  }
  return result;
}

float sub_1D4C70100(uint64_t *a1, uint64_t *a2, uint64_t *a3, _DWORD *a4)
{
  uint64_t v7;
  float result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *a4 = 0;
  v7 = a2[1] - *a2;
  if (!a1 || !a2 || !a3 || v7 != a3[1] - *a3)
    *a4 = -1;
  sub_1D4C67468((uint64_t)a1, v7 >> 2);
  v9 = *a2;
  v10 = a2[1];
  v11 = v10 - *a2;
  if (v10 != *a2)
  {
    v12 = 0;
    v13 = v11 >> 2;
    v14 = *a3;
    v15 = *a1;
    do
    {
      result = *(float *)(v9 + 4 * v12) + *(float *)(v14 + 4 * v12);
      *(float *)(v15 + 4 * v12++) = result;
    }
    while (v13 > v12);
  }
  return result;
}

void sub_1D4C701A0(_QWORD *a1, uint64_t *a2, char **a3, _DWORD *a4)
{
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unsigned int v13;
  float v14;

  *a4 = 0;
  v8 = *a3;
  v9 = a3[1];
  if (a1 && a2 && a3)
  {
    if (v9 != v8)
      goto LABEL_7;
    v8 = a3[1];
  }
  *a4 = -1;
LABEL_7:
  v10 = v9 - v8;
  if (!v10)
    sub_1D4C62870();
  if (a2[1] - *a2 != *((_QWORD *)v8 + 1) - *(_QWORD *)v8)
    *a4 = -1;
  sub_1D4C67468((uint64_t)a1, 0xAAAAAAAAAAAAAAABLL * (v10 >> 3));
  v11 = *a3;
  if (a3[1] != *a3)
  {
    v12 = 0;
    v13 = 1;
    do
    {
      v14 = sub_1D4C700B0(a2, (uint64_t *)&v11[24 * v12], a4, 0.0);
      if (v12 >= (uint64_t)(a1[1] - *a1) >> 2)
        sub_1D4C62870();
      *(float *)(*a1 + 4 * v12) = v14;
      v12 = v13;
      v11 = *a3;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 3) > v13++);
  }
}

float sub_1D4C702C0(uint64_t *a1, uint64_t *a2, char **a3, uint64_t *a4, _DWORD *a5)
{
  float result;

  if (a3)
  {
    sub_1D4C701A0(a1, a2, a3, a5);
  }
  else if (a1 != a2)
  {
    sub_1D4C64444((char *)a1, (char *)*a2, a2[1], (a2[1] - *a2) >> 2);
  }
  if (a4)
  {
    if (!*a5)
      return sub_1D4C70100(a1, a1, a4, a5);
  }
  return result;
}

void sub_1D4C7034C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  float v5;
  uint64_t v6;

  v1 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v3 = 0;
    v4 = (v2 - *a1) >> 2;
    v5 = 0.0;
    do
      v5 = v5 + expf(*(float *)(v1 + 4 * v3++));
    while (v4 > v3);
    if (v2 != v1)
    {
      v6 = 0;
      do
      {
        *(float *)(v1 + 4 * v6) = expf(*(float *)(v1 + 4 * v6)) / v5;
        ++v6;
      }
      while (v4 > v6);
    }
  }
}

id sub_1D4C703CC(uint64_t *a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *a1;
  if (a1[1] != *a1)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      LODWORD(v3) = *(_DWORD *)(v4 + 4 * v5);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v7);

      v5 = v6;
      v4 = *a1;
      ++v6;
    }
    while (v5 < (a1[1] - *a1) >> 2);
  }
  return v2;
}

void sub_1D4C70468(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4C70484(void *a1, _QWORD *a2)
{
  unsigned int i;
  void *v4;
  int v5;
  id v6;

  v6 = a1;
  sub_1D4C67468((uint64_t)a2, objc_msgSend(v6, "count"));
  for (i = 0; objc_msgSend(v6, "count") > (unint64_t)i; ++i)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatValue");
    *(_DWORD *)(*a2 + 4 * i) = v5;

  }
}

void sub_1D4C70510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id sub_1D4C70534()
{
  return (id)qword_1EFEC7EB0;
}

id sub_1D4C70540()
{
  return (id)qword_1EFEC7EB8;
}

id sub_1D4C7054C()
{
  return (id)qword_1EFEC7EC0;
}

id sub_1D4C70558()
{
  return (id)qword_1EFEC7EC8;
}

id sub_1D4C70564()
{
  return (id)qword_1EFEC7ED0;
}

uint64_t sub_1D4C70570(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (**v5)();

  v1 = a1;
  if (!v1)
    printf("ALGatingClassifier: error reading model file.");
  objc_msgSend(v1, "objectForKeyedSubscript:", qword_1EFEC7ED8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", qword_1EFEC7EB0))
  {
    v3 = operator new();
    v4 = v3;
    *(_BYTE *)(v3 + 8) = 0;
    *(_DWORD *)(v3 + 12) = 0;
    *(_BYTE *)(v3 + 16) = 1;
    *(_QWORD *)(v3 + 24) = 0;
    *(_QWORD *)(v3 + 32) = 0;
    v5 = &off_1E9863988;
LABEL_5:
    *(_QWORD *)v3 = v5;
    goto LABEL_15;
  }
  if (objc_msgSend(v2, "isEqual:", qword_1EFEC7EB8))
  {
    v4 = operator new();
    sub_1D4C70EC8(v4);
  }
  else if (objc_msgSend(v2, "isEqual:", qword_1EFEC7EC0))
  {
    v4 = operator new();
    sub_1D4C70EC8(v4);
    *(_QWORD *)v4 = &off_1E9863BA8;
  }
  else
  {
    if (objc_msgSend(v2, "isEqual:", qword_1EFEC7EC8))
    {
      v3 = operator new();
      v4 = v3;
      *(_BYTE *)(v3 + 8) = 0;
      *(_DWORD *)(v3 + 12) = 0;
      *(_BYTE *)(v3 + 16) = 1;
      *(_QWORD *)(v3 + 32) = 0;
      *(_QWORD *)(v3 + 40) = 0;
      *(_QWORD *)(v3 + 24) = 0;
      v5 = &off_1E9863A18;
      goto LABEL_5;
    }
    if (objc_msgSend(v2, "isEqual:", qword_1EFEC7ED0))
    {
      v4 = operator new();
      *(_BYTE *)(v4 + 8) = 0;
      *(_DWORD *)(v4 + 12) = 0;
      *(_BYTE *)(v4 + 16) = 1;
      *(_QWORD *)(v4 + 24) = 0;
      *(_QWORD *)(v4 + 32) = 0;
      *(_QWORD *)v4 = &off_1E9863AB8;
      *(_DWORD *)(v4 + 40) = -1;
      *(_QWORD *)(v4 + 48) = CFSTR("NeuralNetActivation_ReLU");
      *(_QWORD *)(v4 + 56) = 0;
      *(_QWORD *)(v4 + 64) = 0;
      *(_QWORD *)(v4 + 72) = 0;
    }
    else
    {
      printf("ALGatingClassifier: unrecognized model type.");
      v4 = 0;
    }
  }
LABEL_15:
  if (sub_1D4C707CC(v4, v1))
  {
    puts("ALGatingClassifier: error loading model from file.");
    v4 = 0;
  }

  return v4;
}

void sub_1D4C70788(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x1D82660DC](v3, 0x10A1C407830D277);

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C707CC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", qword_1EFEC7ED8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && ((*(void (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "isEqual:", v6),
          v6,
          (v7 & 1) != 0))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", qword_1EFEC7EE0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", qword_1EFEC7EF0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", qword_1EFEC7EF0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "floatValue");
          *(_DWORD *)(a1 + 12) = v12;

        }
        objc_msgSend(v9, "objectForKeyedSubscript:", qword_1EFEC7EF8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", qword_1EFEC7EF8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(a1 + 16) = objc_msgSend(v14, "BOOLValue");

        }
        v15 = (*(uint64_t (**)(uint64_t, void *))(*(_QWORD *)a1 + 40))(a1, v9);
        if (!(_DWORD)v15)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", qword_1EFEC7EE8);
          v15 = objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            if (!*(_QWORD *)(a1 + 24))
            {
              v16 = (_QWORD *)operator new();
              *v16 = 0;
              v16[1] = 0;
              v16[2] = 0;
              *(_QWORD *)(a1 + 24) = v16;
            }
            if (!*(_QWORD *)(a1 + 32))
            {
              v17 = (_QWORD *)operator new();
              *v17 = 0;
              v17[1] = 0;
              v17[2] = 0;
              *(_QWORD *)(a1 + 32) = v17;
            }
            objc_msgSend(v4, "objectForKeyedSubscript:", qword_1EFEC7EE8);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = sub_1D4C70CDC(v18, *(uint64_t **)(a1 + 24), *(_QWORD **)(a1 + 32));

          }
        }
      }
      else
      {
        printf("ALGatingClassifier::loadModel: missing model dictionary key.");
        v15 = 0xFFFFFFFFLL;
      }

    }
    else
    {
      printf("ALGatingClassifier::loadModel: missing or mismatched classifier type.");
      v15 = 0xFFFFFFFFLL;
    }

  }
  else
  {
    printf("ALGatingClassifier::loadModel: missing model file dict.");
    v15 = 0xFFFFFFFFLL;
  }

  return v15;
}

void sub_1D4C709F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C70A44(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void **v6;

  *a1 = off_1E9863B08;
  v2 = a1[3];
  if (v2)
  {
    v6 = (void **)a1[3];
    sub_1D4C60A70(&v6);
    MEMORY[0x1D82660DC](v2, 0x20C40960023A9);
    a1[3] = 0;
  }
  v3 = a1[4];
  if (v3)
  {
    v4 = *(void **)v3;
    if (*(_QWORD *)v3)
    {
      *(_QWORD *)(v3 + 8) = v4;
      operator delete(v4);
    }
    MEMORY[0x1D82660DC](v3, 0x80C40D6874129);
    a1[4] = 0;
  }
  return a1;
}

float sub_1D4C70AE4(_QWORD *a1, uint64_t *a2, _DWORD *a3)
{
  char **v5;
  uint64_t *v6;
  float v7;
  float v8;
  void *__p;
  void *v11;
  uint64_t v12;

  *a3 = 0;
  v5 = (char **)a1[3];
  v6 = (uint64_t *)a1[4];
  if (*(_OWORD *)(a1 + 3) == 0)
    return (*(float (**)(_QWORD *, uint64_t *, _DWORD *))(*a1 + 56))(a1, a2, a3);
  __p = 0;
  v11 = 0;
  v12 = 0;
  *a3 = 0;
  v8 = sub_1D4C702C0((uint64_t *)&__p, a2, v5, v6, a3);
  v7 = 0.0;
  if (!*a3)
    v7 = (*(float (**)(_QWORD *, void **, _DWORD *, float))(*a1 + 56))(a1, &__p, a3, v8);
  if (__p)
  {
    v11 = __p;
    operator delete(__p);
  }
  return v7;
}

void sub_1D4C70BB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_1D4C70BD4(uint64_t a1, uint64_t *a2, _DWORD *a3, float *a4)
{
  float v7;
  float v9;

  v7 = sub_1D4C70AE4((_QWORD *)a1, a2, a3);
  *a4 = v7;
  if (*a3)
  {
    puts("ALGatingClassifier::predict error.");
    return 0;
  }
  else
  {
    v9 = *(float *)(a1 + 12);
    if (*(_BYTE *)(a1 + 16))
      return v7 <= v9;
    else
      return v7 > v9;
  }
}

id sub_1D4C70C40(uint64_t a1, int a2, float a3)
{
  double v3;
  double v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = a3;
  v4 = *(float *)(a1 + 12);
  if (a2)
  {
    v5 = CFSTR("<=");
    if (!*(_BYTE *)(a1 + 16))
      v5 = CFSTR(">");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed (score = %f %@ threshold = %f).\n"), *(_QWORD *)&v3, v5, *(_QWORD *)&v4);
  }
  else
  {
    v6 = CFSTR(">");
    if (!*(_BYTE *)(a1 + 16))
      v6 = CFSTR("<=");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Passed (score = %f %@ threshold = %f).\n"), *(_QWORD *)&v3, v6, *(_QWORD *)&v4);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t sub_1D4C70CDC(void *a1, uint64_t *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v5 = a1;
  objc_msgSend(v5, "objectForKeyedSubscript:", qword_1EFEC7F00);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", qword_1EFEC7F00);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "count");
      sub_1D4C716D0(a2, v9);
      if (v9)
      {
        v10 = 0;
        v11 = 1;
        do
        {
          objc_msgSend(v8, "objectAtIndex:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v12)
          {
            if (0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3) <= v10)
              sub_1D4C62870();
            sub_1D4C70484(v12, (_QWORD *)(*a2 + 24 * v10));
          }

          v10 = v11;
        }
        while (v9 > v11++);
      }
      v15 = 0;
    }
    else
    {
      v15 = 0xFFFFFFFFLL;
    }

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", qword_1EFEC7F08);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", qword_1EFEC7F08);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", qword_1EFEC7F08);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1D4C70484(v18, a3);

    }
    else
    {
      v15 = 0xFFFFFFFFLL;
    }

  }
  return v15;
}

void sub_1D4C70E68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

float sub_1D4C70EB0(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_DWORD *)(a1 + 12) = 0;
  return 1.0;
}

uint64_t sub_1D4C70EC8(uint64_t a1)
{
  _QWORD *v2;

  *(_BYTE *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 12) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)a1 = &off_1E9863A68;
  *(_DWORD *)(a1 + 40) = 0;
  v2 = (_QWORD *)operator new();
  *v2 = 0;
  v2[1] = 0;
  v2[2] = 0;
  *(_QWORD *)(a1 + 48) = v2;
  return a1;
}

void sub_1D4C70F30(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_1D4C70A44(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C70F44(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  *a1 = &off_1E9863A68;
  v2 = a1[6];
  if (v2)
  {
    v3 = *(void **)v2;
    if (*(_QWORD *)v2)
    {
      *(_QWORD *)(v2 + 8) = v3;
      operator delete(v3);
    }
    MEMORY[0x1D82660DC](v2, 0x80C40D6874129);
    a1[6] = 0;
  }
  return sub_1D4C70A44(a1);
}

void sub_1D4C70FA8(_QWORD *a1)
{
  sub_1D4C70F44(a1);
  JUMPOUT(0x1D82660DCLL);
}

float sub_1D4C70FCC(uint64_t a1, uint64_t *a2, _DWORD *a3)
{
  uint64_t *v3;

  *a3 = 0;
  v3 = *(uint64_t **)(a1 + 48);
  if (a2[1] - *a2 == v3[1] - *v3)
    return sub_1D4C700B0(a2, v3, a3, *(float *)(a1 + 40));
  *a3 = -1;
  return -1.0;
}

_QWORD *sub_1D4C7100C(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  *a1 = &off_1E9863A18;
  v2 = a1[5];
  if (v2)
  {
    v3 = *(void **)v2;
    if (*(_QWORD *)v2)
    {
      *(_QWORD *)(v2 + 8) = v3;
      operator delete(v3);
    }
    MEMORY[0x1D82660DC](v2, 0x20C40960023A9);
    a1[5] = 0;
  }
  return sub_1D4C70A44(a1);
}

void sub_1D4C71070(_QWORD *a1)
{
  sub_1D4C7100C(a1);
  JUMPOUT(0x1D82660DCLL);
}

float sub_1D4C71094(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v8;
  uint64_t v9;
  float v10;
  float v11;
  uint64_t *v12;
  uint64_t *v13;

  *a3 = 0;
  *(_QWORD *)(a1 + 48) = -1;
  v4 = **(_QWORD **)(a1 + 40);
  if (*(_BYTE *)(v4 + 28))
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v6 = 0;
    do
    {
      v5 = v6;
      v8 = (uint64_t *)(v4 + 40 * v6);
      v9 = *v8;
      v10 = *(float *)(*a2 + 4 * *v8);
      v11 = *((float *)v8 + 6);
      v12 = v8 + 1;
      v13 = v8 + 2;
      if (v10 >= v11)
        v13 = v12;
      v6 = *v13;
      if (*(_BYTE *)(a1 + 8))
      {
        printf("tree traverse: node %zu (feature %zu): go to node %zu\n", v5, v9, v6);
        v4 = **(_QWORD **)(a1 + 40);
      }
    }
    while (!*(_BYTE *)(v4 + 40 * v6 + 28));
  }
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(v4 + 40 * v5);
  if (*(_BYTE *)(a1 + 8))
  {
    printf("tree traverse: leaf %zu: %f\n", v6, *(float *)(v4 + 40 * v6 + 32));
    v4 = **(_QWORD **)(a1 + 40);
  }
  return *(float *)(v4 + 40 * v6 + 32);
}

BOOL sub_1D4C711AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  v1 = **(_QWORD **)(a1 + 64);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) - v1;
  if (v2)
  {
    v3 = 0xAAAAAAAAAAAAAAABLL * (v2 >> 3);
    v4 = **(_QWORD **)(a1 + 72);
    if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) - v4) >> 3) == v3)
    {
      v6 = *(_QWORD **)v1;
      v5 = *(_QWORD *)(v1 + 8);
      v7 = v5 - *(_QWORD *)v1;
      if (v5 != *(_QWORD *)v1)
      {
        v8 = 0;
        v9 = 1;
        while (v6[1] != *v6)
        {
          v10 = 0xAAAAAAAAAAAAAAABLL * (v7 >> 3);
          if (v10 != (uint64_t)(*(_QWORD *)(v4 + 24 * v8 + 8) - *(_QWORD *)(v4 + 24 * v8)) >> 2)
            break;
          if (v3 <= v9)
          {
            v12 = *(_QWORD *)(v1 + 24 * v3 - 16) - *(_QWORD *)(v1 + 24 * v3 - 24);
            if (!v12)
              return 0;
            return *(_QWORD *)(a1 + 56) < 0xAAAAAAAAAAAAAAABLL * (v12 >> 3);
          }
          v8 = v9;
          v11 = *(_QWORD **)(v1 + 24 * v9);
          if (*(_QWORD **)(v1 + 24 * v9 + 8) == v11 || v10 == (uint64_t)(v11[1] - *v11) >> 2)
          {
            v6 = *(_QWORD **)(v1 + 24 * v9++);
            v7 = *(_QWORD *)(v1 + 24 * v8 + 8) - (_QWORD)v6;
            if (v7)
              continue;
          }
          return 0;
        }
      }
    }
  }
  return 0;
}

_QWORD *sub_1D4C712B0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void **v5;

  *(_QWORD *)a1 = &off_1E9863AB8;
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    v5 = *(void ***)(a1 + 64);
    sub_1D4C728EC(&v5);
    MEMORY[0x1D82660DC](v2, 0x20C40960023A9);
    *(_QWORD *)(a1 + 64) = 0;
  }
  v3 = *(_QWORD *)(a1 + 72);
  if (v3)
  {
    v5 = *(void ***)(a1 + 72);
    sub_1D4C60A70(&v5);
    MEMORY[0x1D82660DC](v3, 0x20C40960023A9);
    *(_QWORD *)(a1 + 72) = 0;
  }

  return sub_1D4C70A44((_QWORD *)a1);
}

void sub_1D4C71354(uint64_t a1)
{
  sub_1D4C712B0(a1);
  JUMPOUT(0x1D82660DCLL);
}

float sub_1D4C71378(uint64_t a1, uint64_t a2, int *a3)
{
  int v6;
  int v7;
  float v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  const __CFString *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  double v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _BYTE *v30;
  void *__p;
  _BYTE *v33;
  uint64_t v34;
  void *v35;
  _BYTE *v36;
  uint64_t v37;

  *a3 = 0;
  v6 = *(_DWORD *)(a1 + 40);
  if (v6 == -1)
  {
    v6 = sub_1D4C711AC(a1);
    *(_DWORD *)(a1 + 40) = v6;
  }
  if (v6 == 1)
    v7 = 0;
  else
    v7 = -1;
  *a3 = v7;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  sub_1D4C62030(&v35, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  __p = 0;
  v33 = 0;
  v34 = 0;
  v8 = 0.0;
  if (*a3)
    goto LABEL_42;
  v9 = **(_QWORD **)(a1 + 64);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) == v9)
  {
LABEL_38:
    v30 = __p;
    v8 = *((float *)__p + *(_QWORD *)(a1 + 56));
    goto LABEL_41;
  }
  v10 = 0;
  v11 = 0;
  v12 = CFSTR("NeuralNetActivation_ReLU");
  do
  {
    v13 = v9 + 24 * v10;
    v14 = *(_QWORD **)v13;
    v15 = *(_QWORD *)(v13 + 8) - *(_QWORD *)v13;
    if (!v15 || (v16 = v14[1] - *v14) == 0 || v36 - (_BYTE *)v35 != v16)
    {
LABEL_39:
      *a3 = -1;
      goto LABEL_40;
    }
    sub_1D4C67468((uint64_t)&__p, 0xAAAAAAAAAAAAAAABLL * (v15 >> 3));
    v17 = *(uint64_t **)(a1 + 64);
    v18 = *v17;
    if (0xAAAAAAAAAAAAAAABLL * ((v17[1] - *v17) >> 3) <= v10)
      sub_1D4C62870();
    v19 = *(_QWORD **)(a1 + 72);
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v19[1] - *v19) >> 3) <= v10)
      sub_1D4C62870();
    *(float *)&v20 = sub_1D4C702C0((uint64_t *)&__p, (uint64_t *)&v35, (char **)(v18 + 24 * v10), (uint64_t *)(*v19 + 24 * v10), a3);
    if (*a3)
      goto LABEL_40;
    if (-1 - 0x5555555555555555 * ((uint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) - **(_QWORD **)(a1 + 64)) >> 3) == v10)
    {
      sub_1D4C7034C((uint64_t *)&__p);
      goto LABEL_36;
    }
    if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", v12, v20))
    {
      v22 = (char *)__p;
      v21 = (uint64_t)v33;
      if (v33 != __p)
      {
        v23 = 0;
        v24 = (v33 - (_BYTE *)__p) >> 2;
        do
        {
          if (*(float *)&v22[4 * v23] < 0.0)
            *(_DWORD *)&v22[4 * v23] = 0;
          ++v23;
        }
        while (v24 > v23);
        goto LABEL_35;
      }
LABEL_34:
      v22 = (char *)v21;
      goto LABEL_35;
    }
    if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("NeuralNetActivation_Sigmoid")))
    {
      v22 = (char *)__p;
      v21 = (uint64_t)v33;
      if (v33 == __p)
        goto LABEL_34;
      v25 = v12;
      v26 = 0;
      v27 = (v33 - (_BYTE *)__p) >> 2;
      do
      {
        *(float *)&v22[4 * v26] = 1.0 / (float)(expf(*(float *)&v22[4 * v26]) + 1.0);
        ++v26;
      }
      while (v27 > v26);
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("NeuralNetActivation_Tanh")))
        goto LABEL_39;
      v22 = (char *)__p;
      v21 = (uint64_t)v33;
      if (v33 == __p)
        goto LABEL_34;
      v25 = v12;
      v28 = 0;
      v29 = (v33 - (_BYTE *)__p) >> 2;
      do
      {
        *(float *)&v22[4 * v28] = tanhf(*(float *)&v22[4 * v28]);
        ++v28;
      }
      while (v29 > v28);
    }
    v12 = v25;
LABEL_35:
    sub_1D4C64444((char *)&v35, v22, v21, (v21 - (uint64_t)v22) >> 2);
LABEL_36:
    v9 = **(_QWORD **)(a1 + 64);
    v10 = ++v11;
  }
  while (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) - v9) >> 3) > v11);
  if (!*a3)
    goto LABEL_38;
LABEL_40:
  v30 = __p;
  v8 = 0.0;
  if (__p)
  {
LABEL_41:
    v33 = v30;
    operator delete(v30);
  }
LABEL_42:
  if (v35)
  {
    v36 = v35;
    operator delete(v35);
  }
  return v8;
}

void sub_1D4C716A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

void sub_1D4C716D0(uint64_t *a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a1[1];
  v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  v5 = a2 >= v4;
  v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    sub_1D4C7295C(a1, v6);
  }
  else if (!v5)
  {
    v7 = *a1 + 24 * a2;
    if (v3 != v7)
    {
      v8 = a1[1];
      do
      {
        v10 = *(void **)(v8 - 24);
        v8 -= 24;
        v9 = v10;
        if (v10)
        {
          *(_QWORD *)(v3 - 16) = v9;
          operator delete(v9);
        }
        v3 = v8;
      }
      while (v8 != v7);
    }
    a1[1] = v7;
  }
}

uint64_t sub_1D4C71764()
{
  return objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
}

uint64_t sub_1D4C71774()
{
  return 0;
}

id sub_1D4C7177C(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = *(_DWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, qword_1EFEC7F10);

  sub_1D4C703CC(*(uint64_t **)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, qword_1EFEC7F18);

  return v2;
}

void sub_1D4C71814(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C71834(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", qword_1EFEC7F10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    && (objc_msgSend(v3, "objectForKeyedSubscript:", qword_1EFEC7F18),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", qword_1EFEC7F10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    *(_DWORD *)(a1 + 40) = v7;

    objc_msgSend(v3, "objectForKeyedSubscript:", qword_1EFEC7F18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1D4C70484(v8, *(_QWORD **)(a1 + 48));

    v9 = 0;
  }
  else
  {
    puts("linearModelFromInnerDictionary: bad or missing keys for model.");
    v9 = 0xFFFFFFFFLL;
  }

  return v9;
}

void sub_1D4C71904(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_1D4C7192C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  double v19;
  id v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = **(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) != v3)
  {
    v4 = 0;
    v5 = 1;
    do
    {
      v6 = (unsigned int *)(v3 + 40 * v4);
      if ((v6[7] & 1) != 0)
      {
        v18 = v6[8];
        v25[0] = qword_1EFEC7F48;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = qword_1EFEC7F50;
        v26[0] = v11;
        LODWORD(v19) = v18;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = *((_QWORD *)v6 + 1);
        v8 = *((_QWORD *)v6 + 2);
        v9 = v6[6];
        v10 = *v6;
        v23[0] = qword_1EFEC7F28;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v11;
        v23[1] = qword_1EFEC7F30;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v12;
        v23[2] = qword_1EFEC7F38;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2] = v13;
        v23[3] = qword_1EFEC7F40;
        LODWORD(v14) = v9;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24[3] = v15;
        v23[4] = qword_1EFEC7F48;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24[4] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v2, "addObject:", v17);

      v4 = v5;
      v3 = **(_QWORD **)(a1 + 40);
    }
    while (0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) - v3) >> 3) > v5++);
  }
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v2, qword_1EFEC7F20);

  return v22;
}

void sub_1D4C71BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C71C3C(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;
  unsigned int v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  void **v13;
  char *v14;
  char *v15;
  char *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  int v25;
  char *v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  __int128 v40;
  __int128 v41;
  char *v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  id v47;

  v47 = a2;
  objc_msgSend(v47, "objectForKeyedSubscript:", qword_1EFEC7F20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    puts("binaryTreeFromInnerDictionary: bad or missing keys for model.");
    v45 = 0xFFFFFFFFLL;
    goto LABEL_40;
  }
  v3 = (_QWORD *)operator new();
  v4 = 0;
  *v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  *(_QWORD *)(a1 + 40) = v3;
  while (1)
  {
    v5 = v4;
    if (objc_msgSend(v2, "count") <= (unint64_t)v4)
      break;
    objc_msgSend(v2, "objectAtIndexedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", qword_1EFEC7F48);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_37;
    objc_msgSend(v6, "objectForKeyedSubscript:", qword_1EFEC7F48);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", qword_1EFEC7F50);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v12 = v11;

      v13 = *(void ***)(a1 + 40);
      v14 = (char *)v13[1];
      v15 = (char *)v13[2];
      if (v14 >= v15)
      {
        v28 = 0xCCCCCCCCCCCCCCCDLL * ((v14 - (_BYTE *)*v13) >> 3);
        v29 = v28 + 1;
        if (v28 + 1 > 0x666666666666666)
          sub_1D4C590D0();
        v30 = 0xCCCCCCCCCCCCCCCDLL * ((v15 - (_BYTE *)*v13) >> 3);
        if (2 * v30 > v29)
          v29 = 2 * v30;
        if (v30 >= 0x333333333333333)
          v31 = 0x666666666666666;
        else
          v31 = v29;
        if (v31)
          v32 = (char *)sub_1D4C72CD8((uint64_t)(v13 + 2), v31);
        else
          v32 = 0;
        v36 = &v32[40 * v28];
        *(_QWORD *)v36 = 0;
        *((_QWORD *)v36 + 1) = 0;
        *((_DWORD *)v36 + 6) = 0;
        *((_QWORD *)v36 + 2) = 0;
        v36[28] = 1;
        *((_DWORD *)v36 + 8) = v12;
        v38 = (char *)*v13;
        v37 = (char *)v13[1];
        v39 = v36;
        if (v37 != *v13)
        {
          do
          {
            v40 = *(_OWORD *)(v37 - 40);
            v41 = *(_OWORD *)(v37 - 24);
            *((_DWORD *)v39 - 2) = *((_DWORD *)v37 - 2);
            *(_OWORD *)(v39 - 24) = v41;
            *(_OWORD *)(v39 - 40) = v40;
            v39 -= 40;
            v37 -= 40;
          }
          while (v37 != v38);
          goto LABEL_33;
        }
        goto LABEL_34;
      }
      *(_QWORD *)v14 = 0;
      *((_QWORD *)v14 + 1) = 0;
      *((_DWORD *)v14 + 6) = 0;
      *((_QWORD *)v14 + 2) = 0;
      v14[28] = 1;
      v16 = v14 + 40;
      *((_DWORD *)v14 + 8) = v12;
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", qword_1EFEC7F28);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "intValue");
      objc_msgSend(v6, "objectForKeyedSubscript:", qword_1EFEC7F30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "intValue");
      objc_msgSend(v6, "objectForKeyedSubscript:", qword_1EFEC7F38);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "intValue");
      objc_msgSend(v6, "objectForKeyedSubscript:", qword_1EFEC7F40);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      v25 = v24;

      v13 = *(void ***)(a1 + 40);
      v26 = (char *)v13[1];
      v27 = (char *)v13[2];
      if (v26 >= v27)
      {
        v33 = 0xCCCCCCCCCCCCCCCDLL * ((v26 - (_BYTE *)*v13) >> 3);
        v34 = v33 + 1;
        if (v33 + 1 > 0x666666666666666)
          sub_1D4C590D0();
        v35 = 0xCCCCCCCCCCCCCCCDLL * ((v27 - (_BYTE *)*v13) >> 3);
        if (2 * v35 > v34)
          v34 = 2 * v35;
        if (v35 >= 0x333333333333333)
          v31 = 0x666666666666666;
        else
          v31 = v34;
        if (v31)
          v32 = (char *)sub_1D4C72CD8((uint64_t)(v13 + 2), v31);
        else
          v32 = 0;
        v36 = &v32[40 * v33];
        *(_QWORD *)v36 = v18;
        *((_QWORD *)v36 + 1) = v20;
        *((_QWORD *)v36 + 2) = v22;
        *((_DWORD *)v36 + 6) = v25;
        v36[28] = 0;
        *((_DWORD *)v36 + 8) = -1082130432;
        v42 = (char *)*v13;
        v37 = (char *)v13[1];
        v39 = v36;
        if (v37 != *v13)
        {
          do
          {
            v43 = *(_OWORD *)(v37 - 40);
            v44 = *(_OWORD *)(v37 - 24);
            *((_DWORD *)v39 - 2) = *((_DWORD *)v37 - 2);
            *(_OWORD *)(v39 - 24) = v44;
            *(_OWORD *)(v39 - 40) = v43;
            v39 -= 40;
            v37 -= 40;
          }
          while (v37 != v42);
LABEL_33:
          v37 = (char *)*v13;
        }
LABEL_34:
        v16 = v36 + 40;
        *v13 = v39;
        v13[1] = v36 + 40;
        v13[2] = &v32[40 * v31];
        if (v37)
          operator delete(v37);
        goto LABEL_36;
      }
      *(_QWORD *)v26 = v18;
      *((_QWORD *)v26 + 1) = v20;
      *((_QWORD *)v26 + 2) = v22;
      *((_DWORD *)v26 + 6) = v25;
      v26[28] = 0;
      v16 = v26 + 40;
      *((_DWORD *)v26 + 8) = -1082130432;
    }
LABEL_36:
    v13[1] = v16;
LABEL_37:

    v4 = v5 + 1;
  }
  v45 = 0;
LABEL_40:

  return v45;
}

void sub_1D4C72070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

id sub_1D4C720F8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  unint64_t v11;
  BOOL v12;
  BOOL v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void **v28;
  _QWORD v29[4];
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = **(_QWORD **)(a1 + 64);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) != v3)
  {
    v4 = 0;
    v5 = 0;
    while (1)
    {
      v25 = 0;
      v26 = 0;
      v27 = 0;
      sub_1D4C72D1C(&v25, *(_QWORD *)(v3 + 24 * v5), *(_QWORD *)(v3 + 24 * v5 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v3 + 24 * v5 + 8) - *(_QWORD *)(v3 + 24 * v5)) >> 3));
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v25;
      if (v26 != v25)
      {
        v8 = 0;
        v9 = 1;
        do
        {
          sub_1D4C703CC((uint64_t *)(v7 + 24 * v8));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v10);

          v8 = v9;
          v7 = v25;
          v11 = 0xAAAAAAAAAAAAAAABLL * ((v26 - v25) >> 3);
          v12 = v11 >= v9;
          v13 = v11 == v9++;
        }
        while (!v13 && v12);
      }
      objc_msgSend(v2, "addObject:", v6);

      v28 = (void **)&v25;
      sub_1D4C60A70(&v28);
      v5 = (v4 + 1);
      v14 = *(uint64_t **)(a1 + 64);
      v3 = *v14;
      if (0xAAAAAAAAAAAAAAABLL * ((v14[1] - *v14) >> 3) <= v5)
        break;
      ++v4;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = **(_QWORD **)(a1 + 72);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) != v16)
  {
    v17 = 0;
    v18 = 1;
    do
    {
      sub_1D4C703CC((uint64_t *)(v16 + 24 * v17));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v19);

      v17 = v18;
      v16 = **(_QWORD **)(a1 + 72);
      v20 = 0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) - v16) >> 3);
      v12 = v20 >= v18;
      v13 = v20 == v18++;
    }
    while (!v13 && v12);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = qword_1EFEC7F58;
  v29[1] = qword_1EFEC7F60;
  v22 = *(_QWORD *)(a1 + 48);
  v30[0] = v21;
  v30[1] = v22;
  v29[2] = qword_1EFEC7F70;
  v29[3] = qword_1EFEC7F68;
  v30[2] = v15;
  v30[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

void sub_1D4C72378(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C723F4(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;
  unsigned int i;
  void *v18;
  void *v19;
  _QWORD *v20;
  void **v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unsigned int v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  char *v31;
  id v34;
  void *__p;
  _BYTE *v36;
  void **p_p;

  v34 = a2;
  if (!*(_QWORD *)(a1 + 64))
  {
    v3 = (_QWORD *)operator new();
    *v3 = 0;
    v3[1] = 0;
    v3[2] = 0;
    *(_QWORD *)(a1 + 64) = v3;
  }
  if (!*(_QWORD *)(a1 + 72))
  {
    v4 = (_QWORD *)operator new();
    *v4 = 0;
    v4[1] = 0;
    v4[2] = 0;
    *(_QWORD *)(a1 + 72) = v4;
  }
  v5 = objc_alloc_init(MEMORY[0x1E0CB3940]);
  v6 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v5;

  objc_msgSend(v34, "objectForKeyedSubscript:", qword_1EFEC7F58);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a1 + 56) = (int)objc_msgSend(v7, "intValue");

  objc_msgSend(v34, "objectForKeyedSubscript:", qword_1EFEC7F60);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v8;

  objc_msgSend(v34, "objectForKeyedSubscript:", qword_1EFEC7F68);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "count");
    sub_1D4C727E8(*(uint64_t **)(a1 + 64), v12);
    if (v12)
    {
      v13 = 0;
      v14 = 0;
      do
      {
        v15 = v11;
        objc_msgSend(v11, "objectAtIndexedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1D4C73114(&__p, objc_msgSend(v16, "count"));
        for (i = 0; objc_msgSend(v16, "count") > (unint64_t)i; ++i)
        {
          objc_msgSend(v16, "objectAtIndexedSubscript:", i);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
            sub_1D4C70484(v18, (_QWORD *)__p + 3 * i);

        }
        v20 = *(_QWORD **)(a1 + 64);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v20[1] - *v20) >> 3) <= v13)
          sub_1D4C62870();
        v21 = (void **)(*v20 + 24 * v13);
        if (v21 != &__p)
          sub_1D4C64684((uint64_t)v21, (uint64_t)__p, (uint64_t)v36, 0xAAAAAAAAAAAAAAABLL * ((v36 - (_BYTE *)__p) >> 3));
        p_p = &__p;
        sub_1D4C60A70(&p_p);

        v13 = ++v14;
        v11 = v15;
      }
      while (v12 > v14);
    }
  }
  v22 = v11;
  objc_msgSend(v34, "objectForKeyedSubscript:", qword_1EFEC7F70);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    v25 = objc_msgSend(v23, "count");
    sub_1D4C716D0(*(uint64_t **)(a1 + 72), v25);
    if (v25)
    {
      v26 = 0;
      v27 = 1;
      do
      {
        objc_msgSend(v24, "objectAtIndexedSubscript:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1D4C62744(&__p, objc_msgSend(v28, "count"));

        objc_msgSend(v24, "objectAtIndexedSubscript:", v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1D4C70484(v29, &__p);

        v30 = *(_QWORD **)(a1 + 72);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v30[1] - *v30) >> 3) <= v26)
          sub_1D4C62870();
        v31 = (char *)(*v30 + 24 * v26);
        if (v31 != (char *)&__p)
          sub_1D4C64444(v31, (char *)__p, (uint64_t)v36, (v36 - (_BYTE *)__p) >> 2);
        if (__p)
        {
          v36 = __p;
          operator delete(__p);
        }
        v26 = v27;
      }
      while (v25 > v27++);
    }
  }

  return 0;
}

void sub_1D4C7273C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1D4C727E8(uint64_t *a1, unint64_t a2)
{
  void **v3;
  unint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  void **v8;

  v3 = (void **)a1[1];
  v4 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v3 - *a1) >> 3);
  v5 = a2 >= v4;
  v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    sub_1D4C72DA0(a1, v6);
  }
  else if (!v5)
  {
    v7 = *a1 + 24 * a2;
    while (v3 != (void **)v7)
    {
      v3 -= 3;
      v8 = v3;
      sub_1D4C60A70(&v8);
    }
    a1[1] = v7;
  }
}

uint64_t sub_1D4C7287C()
{
  return 1;
}

uint64_t sub_1D4C72884()
{
  return 0xFFFFFFFFLL;
}

void sub_1D4C72890(_QWORD *a1)
{
  sub_1D4C70A44(a1);
  JUMPOUT(0x1D82660DCLL);
}

uint64_t sub_1D4C728B4()
{
  return 0;
}

void sub_1D4C728C0(_QWORD *a1)
{
  sub_1D4C70F44(a1);
  JUMPOUT(0x1D82660DCLL);
}

uint64_t sub_1D4C728E4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

void sub_1D4C728EC(void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;
  void **v6;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        v6 = v4;
        sub_1D4C60A70(&v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1D4C7295C(uint64_t *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  size_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL)
      sub_1D4C590D0();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    v19 = v4;
    if (v11)
      v12 = (char *)sub_1D4C59158(v4, v11);
    else
      v12 = 0;
    v15 = v12;
    v16 = &v12[24 * v8];
    v18 = &v12[24 * v11];
    v14 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v16, v14);
    v17 = &v16[v14];
    sub_1D4C72AC0(a1, &v15);
    sub_1D4C72C4C((uint64_t)&v15);
  }
}

void sub_1D4C72AAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1D4C72C4C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C72AC0(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1D4C72B34((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_1D4C72B34(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  sub_1D4C72BD4((uint64_t)v11);
  return v9;
}

uint64_t sub_1D4C72BD4(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1D4C72C08(a1);
  return a1;
}

void sub_1D4C72C08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t sub_1D4C72C4C(uint64_t a1)
{
  sub_1D4C72C80(a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_1D4C72C80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void *sub_1D4C72CD8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667)
    sub_1D4C5919C();
  return operator new(40 * a2);
}

_QWORD *sub_1D4C72D1C(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    sub_1D4C60B88(result, a4);
    result = sub_1D4C6480C((uint64_t)(v6 + 2), a2, a3, (_QWORD *)v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1D4C72D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  sub_1D4C60A70(&a9);
  _Unwind_Resume(a1);
}

void sub_1D4C72DA0(uint64_t *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  size_t v14;
  void *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL)
      sub_1D4C590D0();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    v19 = v4;
    if (v11)
      v12 = (char *)sub_1D4C59158(v4, v11);
    else
      v12 = 0;
    v15 = v12;
    v16 = &v12[24 * v8];
    v18 = &v12[24 * v11];
    v14 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v16, v14);
    v17 = &v16[v14];
    sub_1D4C72F04(a1, &v15);
    sub_1D4C73094(&v15);
  }
}

void sub_1D4C72EF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1D4C73094((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C72F04(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1D4C72F78((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_1D4C72F78(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  sub_1D4C73018((uint64_t)v11);
  return v9;
}

uint64_t sub_1D4C73018(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1D4C7304C(a1);
  return a1;
}

void sub_1D4C7304C(uint64_t a1)
{
  void **v1;
  void **v2;
  void **v3;

  v1 = *(void ***)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(void ***)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = v1;
    sub_1D4C60A70(&v3);
    v1 += 3;
  }
}

void **sub_1D4C73094(void **a1)
{
  sub_1D4C730C4((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void sub_1D4C730C4(uint64_t a1)
{
  uint64_t i;
  uint64_t v2;
  void **v4;
  void **v5;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    v4 = (void **)(i - 24);
    *(_QWORD *)(a1 + 16) = v4;
    v5 = v4;
    sub_1D4C60A70(&v5);
  }
}

_QWORD *sub_1D4C73114(_QWORD *a1, unint64_t a2)
{
  char *v4;
  size_t v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D4C60B88(a1, a2);
    v4 = (char *)a1[1];
    v5 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_1D4C731A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  sub_1D4C60A70(&a9);
  _Unwind_Resume(a1);
}

float sub_1D4C731B4(unsigned int a1, float *a2)
{
  uint64_t v2;
  float v3;
  float v4;

  if (!a1)
    return 0.0;
  v2 = a1;
  v3 = 0.0;
  do
  {
    v4 = *a2++;
    v3 = v3 + v4;
    --v2;
  }
  while (v2);
  return v3 / (float)a1;
}

float sub_1D4C731E4(unsigned int a1, float a2)
{
  float v2;

  v2 = 1.0;
  if (a2 >= 0.0)
    return a2 / (float)((float)a1 + a2);
  return v2;
}

CMTime *getMinimumSafeInputDuration_0@<X0>(CMTime *a1@<X8>)
{
  return CMTimeMakeWithSeconds(a1, 0.45, 600);
}

__n128 sub_1D4C73214@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __n128 result;

  v1 = MEMORY[0x1E0CA2E68];
  result = *(__n128 *)MEMORY[0x1E0CA2E68];
  *(_OWORD *)a1 = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(v1 + 16);
  return result;
}

CMTime *sub_1D4C73230@<X0>(CMTime *a1@<X8>)
{
  return CMTimeMakeWithSeconds(a1, 5.0, 600);
}

CMTime *sub_1D4C7323C@<X0>(CMTime *a1@<X8>)
{
  return CMTimeMakeWithSeconds(a1, 1.0, 600);
}

float sub_1D4C73248()
{
  return 1.0;
}

CMTime *sub_1D4C73250@<X0>(CMTime *a1@<X0>, CMTime *a2@<X1>, CMTime *a3@<X2>, uint64_t a4@<X8>, Float64 a5@<D0>)
{
  __int128 v10;
  uint64_t v11;
  CMTime *result;
  CMTimeEpoch epoch;
  __int128 v14;
  __int128 v15;
  CMTimeEpoch v16;
  CMTime v17;
  CMTime v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTime v28;
  CMTime time2;
  CMTime time1;

  v10 = *(_OWORD *)&a1->value;
  v11 = MEMORY[0x1E0CA2E68];
  *(_OWORD *)a4 = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)(a4 + 16) = *(_QWORD *)(v11 + 16);
  *(_OWORD *)&time1.value = v10;
  time1.epoch = a1->epoch;
  time2 = *a2;
  result = (CMTime *)CMTimeCompare(&time1, &time2);
  if ((int)result <= 0)
  {
    *(_OWORD *)a4 = *(_OWORD *)v11;
    v16 = *(_QWORD *)(v11 + 16);
  }
  else
  {
    lhs = *a1;
    rhs = *a2;
    CMTimeSubtract(&time, &lhs, &rhs);
    CMTimeMultiplyByFloat64(&v28, &time, a5);
    *(_OWORD *)a4 = *(_OWORD *)&v28.value;
    epoch = v28.epoch;
    *(_QWORD *)(a4 + 16) = v28.epoch;
    *(_OWORD *)&v24.value = *(_OWORD *)a4;
    v24.epoch = epoch;
    v22 = *a3;
    v20 = *a2;
    v14 = *(_OWORD *)&a1->value;
    v18.epoch = a1->epoch;
    *(_OWORD *)&v18.value = v14;
    v15 = *(_OWORD *)&a2->value;
    v17.epoch = a2->epoch;
    *(_OWORD *)&v17.value = v15;
    CMTimeSubtract(&v19, &v18, &v17);
    CMTimeMinimum(&v21, &v20, &v19);
    CMTimeMinimum(&v23, &v22, &v21);
    result = CMTimeMinimum(&v28, &v24, &v23);
    *(_OWORD *)a4 = *(_OWORD *)&v28.value;
    v16 = v28.epoch;
  }
  *(_QWORD *)(a4 + 16) = v16;
  return result;
}

uint64_t sub_1D4C733E8(uint64_t a1, __int128 *a2, __int128 *a3, __int128 *a4, __int128 *a5)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD *v12;
  CMTime v14;
  CMTime v15;
  CMTime rhs;
  CMTime lhs;
  CMTime v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime time2;
  CMTime time1;

  v6 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v6;
  v7 = *a5;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a5 + 2);
  *(_OWORD *)(a1 + 72) = v7;
  v8 = *a3;
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a3 + 2);
  *(_OWORD *)(a1 + 24) = v8;
  v9 = *a4;
  *(_QWORD *)(a1 + 64) = *((_QWORD *)a4 + 2);
  *(_OWORD *)(a1 + 48) = v9;
  v10 = *a4;
  time1.epoch = *((_QWORD *)a4 + 2);
  *(_OWORD *)&time1.value = v10;
  v11 = *(_OWORD *)(a1 + 24);
  time2.epoch = *(_QWORD *)(a1 + 40);
  *(_OWORD *)&time2.value = v11;
  if (CMTimeCompare(&time1, &time2) < 0)
    return 21;
  v12 = (_OWORD *)(a1 + 24);
  v22 = *(CMTime *)(a1 + 72);
  v21 = *(CMTime *)(a1 + 24);
  if (CMTimeCompare(&v22, &v21) > 0)
    return 21;
  v20 = *(CMTime *)a1;
  *(_OWORD *)&v19.value = *v12;
  v19.epoch = *(_QWORD *)(a1 + 40);
  if (CMTimeCompare(&v20, &v19) < 0)
  {
    puts("Input duration shorter than minimum period.");
    return 7;
  }
  else
  {
    memset(&v18, 0, sizeof(v18));
    *(_OWORD *)&lhs.value = *v12;
    lhs.epoch = *(_QWORD *)(a1 + 40);
    rhs = *(CMTime *)(a1 + 72);
    CMTimeAdd(&v18, &lhs, &rhs);
    v15 = v18;
    v14 = *(CMTime *)a1;
    if (CMTimeCompare(&v15, &v14) <= 0)
      return 0;
    else
      return 21;
  }
}

uint64_t alRender(void *a1, double *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  __int128 v18;
  void *v19;
  __int128 *v20;
  __int128 *v21;
  unint64_t v22;
  __int128 v23;
  int32_t v24;
  _BOOL4 v25;
  _BOOL4 v26;
  uint64_t v27;
  CMTime *v28;
  int v29;
  _BOOL4 v30;
  VideoReader *v31;
  int v32;
  VideoReader *v33;
  VideoReader *v34;
  opaqueCMSampleBuffer *v35;
  VideoReader *v36;
  uint64_t v37;
  void *v38;
  opaqueCMSampleBuffer *v39;
  __CVBuffer *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  float v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  id v55;
  unsigned int v56;
  char *v57;
  id v58;
  CMSampleBufferRef v59;
  VideoReader *v60;
  int v61;
  unsigned int v62;
  uint64_t v64;
  uint64_t v65;
  __CVBuffer *ImageBuffer;
  void *v67;
  void *v68;
  void *v69;
  void *context;
  id v71;
  opaqueCMSampleBuffer *v72;
  opaqueCMSampleBuffer *cf;
  int v74;
  uint64_t (**v75)(void);
  int v76;
  void *v77;
  VideoReader *v78;
  VideoReader *v79;
  __int128 v80;
  uint64_t v81;
  __int128 v82;
  uint64_t v83;
  CMTime v84;
  CMTime v85;
  CMTime v86;
  CMTime v87;
  CMTime v88;
  CMTime v89;
  CMTime v90;
  CMTime v91;
  CMTime v92;
  CMTime v93;
  CMTime v94;
  CMTime v95;
  CGAffineTransform v96;
  CMTime time2;
  CMTime time1;
  __int128 v99;
  uint64_t v100;
  CMTime v101;
  CMTime v102;
  CGAffineTransform v103;
  CMTime v104;
  CMTime v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  CMSampleBufferRef v112;
  CMSampleBufferRef sbuf;
  _QWORD v114[3];
  char v115;
  _QWORD v116[5];
  id v117;
  CGAffineTransform v118;
  _BYTE v119[36];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v75 = a3;
  v77 = v5;
  if (!v5 || !a2)
  {
    NSLog(CFSTR("inputVideo: nil input"));
    v10 = 5;
    goto LABEL_110;
  }
  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v8 = MEMORY[0x1D82662EC]();
  v116[0] = 0;
  v116[1] = v116;
  v116[2] = 0x3032000000;
  v116[3] = sub_1D4C7424C;
  v116[4] = sub_1D4C7425C;
  v117 = 0;
  v114[0] = 0;
  v114[1] = v114;
  v114[2] = 0x2020000000;
  v115 = 0;
  sbuf = 0;
  v112 = 0;
  v106 = 0;
  v107 = &v106;
  v108 = 0x3032000000;
  v109 = sub_1D4C7424C;
  v110 = sub_1D4C7425C;
  v111 = 0;
  v105 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v104 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v9 = *((_QWORD *)a2 + 1) - *(_QWORD *)a2;
  context = (void *)v8;
  if (!v9)
  {
    NSLog(CFSTR("alRender: empty recipe"));
    v78 = 0;
    v79 = 0;
    v62 = 0;
    LODWORD(v10) = 5;
    v61 = 1;
    goto LABEL_107;
  }
  LODWORD(v10) = 0;
  v78 = 0;
  v79 = 0;
  v68 = 0;
  v69 = 0;
  v71 = 0;
  v72 = 0;
  v67 = 0;
  cf = 0;
  v11 = 0;
  v12 = v9 >> 3;
  v14 = a2[6];
  v13 = a2[7];
  v16 = a2[4];
  v15 = a2[5];
  if (v12 <= 1)
    v17 = 1;
  else
    v17 = v12;
  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v103.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v103.c = v18;
  *(_OWORD *)&v103.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v65 = *MEMORY[0x1E0C9E1F8];
  v64 = *MEMORY[0x1E0C9E190];
  do
  {
    v19 = (void *)MEMORY[0x1D82662EC]();
    v20 = *(__int128 **)(*(_QWORD *)a2 + 8 * v11);
    v21 = (__int128 *)*((_QWORD *)v20 + 6);
    v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v20 + 7) - (_QWORD)v21) >> 3);
    if (v22 != 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v20 + 10) - *((_QWORD *)v20 + 9)) >> 3)
      || v22 != (uint64_t)(*((_QWORD *)v20 + 13) - *((_QWORD *)v20 + 12)) >> 2)
    {
      NSLog(CFSTR("alRender: malformed alLoopFrameInstruction (1)\n"));
      goto LABEL_15;
    }
    v101 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    v99 = *v20;
    v100 = *((_QWORD *)v20 + 2);
    if (v22 == 1)
    {
      v74 = 0;
      v25 = 0;
      v26 = 0;
    }
    else
    {
      if (v22 != 2)
      {
        NSLog(CFSTR("alRender: malformed alLoopFrameInstruction (2)\n"));
        v29 = 2;
        LODWORD(v10) = 26;
        goto LABEL_16;
      }
      v23 = *v21;
      time1.epoch = *((_QWORD *)v21 + 2);
      *(_OWORD *)&time1.value = v23;
      time2 = *(CMTime *)((_BYTE *)v21 + 1);
      v24 = CMTimeCompare(&time1, &time2);
      v25 = v24 > 0;
      v26 = v24 < 1;
      v27 = *((_QWORD *)v20 + 6);
      v28 = (CMTime *)(v27 + 24 * (v24 < 1));
      v102 = *v28;
      v21 = (__int128 *)(v27 + 24 * (v24 > 0));
      v101 = *(CMTime *)v21;
      if (!*((_BYTE *)v20 + 120))
      {
        v74 = 0;
        v76 = 1;
        if ((_DWORD)v10)
        {
LABEL_21:
          v29 = 2;
          goto LABEL_16;
        }
        goto LABEL_24;
      }
      v101 = *v28;
      v74 = 1;
    }
    v76 = 0;
    v30 = v26;
    v102 = *(CMTime *)v21;
    v26 = v25;
    v25 = v30;
    if ((_DWORD)v10)
      goto LABEL_21;
LABEL_24:
    if (v79)
      goto LABEL_27;
    v31 = -[VideoReader initWithAsset:]([VideoReader alloc], "initWithAsset:", v5);
    v79 = v31;
    if (v31)
    {
      -[VideoReader setPixelFormatOptions:](v31, "setPixelFormatOptions:", 3588);
      -[VideoReader preferredTransform](v79, "preferredTransform");
      CGAffineTransformInvert(&v118, &v96);
      v103 = v118;
      v95 = v102;
      -[VideoReader setReadStartT:](v79, "setReadStartT:", &v95);
LABEL_27:
      v32 = v76;
      if (v78)
        v32 = 0;
      if (v32 != 1)
        goto LABEL_32;
      v33 = -[VideoReader initWithAsset:]([VideoReader alloc], "initWithAsset:", v5);
      v34 = v33;
      if (v33)
      {
        -[VideoReader setPixelFormatOptions:](v33, "setPixelFormatOptions:", 3588);
        v94 = v101;
        v78 = v34;
        -[VideoReader setReadStartT:](v34, "setReadStartT:", &v94);
LABEL_32:
        if (cf)
        {
          v93 = v105;
          v92 = v102;
          if (!CMTimeCompare(&v93, &v92))
          {
            sbuf = cf;
            CFRetain(cf);
          }
        }
        v35 = sbuf;
        if (sbuf)
        {
LABEL_40:
          v36 = v79;
        }
        else
        {
          v36 = v79;
          if (v72)
          {
            v91 = v104;
            v90 = v102;
            if (!CMTimeCompare(&v91, &v90))
            {
              sbuf = v72;
              CFRetain(v72);
            }
            v35 = sbuf;
            goto LABEL_40;
          }
        }
        if (v35)
        {
LABEL_42:
          ImageBuffer = CMSampleBufferGetImageBuffer(v35);
          sub_1D4C8D468(ImageBuffer, 0);
          v37 = objc_claimAutoreleasedReturnValue();
          v38 = (void *)v107[5];
          v107[5] = v37;

          if (!v107[5])
          {
            NSLog(CFSTR("alRender: error converting frame to CIImage"));
            goto LABEL_90;
          }
          if (!(v76 | v74))
            goto LABEL_54;
          if (cf)
          {
            v88 = v105;
            v87 = v101;
            if (!CMTimeCompare(&v88, &v87))
            {
              v112 = cf;
              CFRetain(cf);
            }
          }
          v39 = v112;
          if (!v112 && v72)
          {
            v86 = v104;
            v85 = v101;
            if (!CMTimeCompare(&v86, &v85))
            {
              v112 = v72;
              CFRetain(v72);
            }
            v39 = v112;
          }
          if (v39)
            goto LABEL_53;
          if (v74)
            v60 = v79;
          else
            v60 = v78;
          v84 = v101;
          v56 = -[VideoReader getFrameAtTime:exactTime:frame:](v60, "getFrameAtTime:exactTime:frame:", &v84, 1, &v112);
          if (!v56)
          {
            v39 = v112;
LABEL_53:
            v40 = CMSampleBufferGetImageBuffer(v39);
            sub_1D4C8D468(v40, 0);
            v41 = objc_claimAutoreleasedReturnValue();

            v69 = (void *)v41;
            if (v41)
            {
LABEL_54:
              v42 = 0;
              v43 = *(_QWORD *)(*((_QWORD *)v20 + 9) + 24 * v26);
              do
              {
                *(_DWORD *)&v119[v42] = *(_DWORD *)(v43 + v42);
                v42 += 4;
              }
              while (v42 != 36);
              sub_1D4C88E58((void *)v107[5], (uint64_t)v119, 0, (__int128 *)&v103, v16, v15, v14, v13, v6, v7);
              v44 = (void *)objc_claimAutoreleasedReturnValue();

              if (v44)
              {
                if (!(v76 | v74))
                {
                  v58 = v44;

                  v55 = v58;
LABEL_71:
                  v83 = v100;
                  v82 = v99;
                  v68 = v55;
                  if ((v75[2]() & 1) != 0)
                  {
                    if (cf)
                      CFRelease(cf);
                    if (v72)
                      CFRelease(v72);
                    v59 = sbuf;
                    v105 = v102;
                    sbuf = 0;
                    v72 = v112;
                    cf = v59;
                    if (v112)
                    {
                      if (v74)
                      {
                        LODWORD(v10) = 0;
                        v29 = 0;
                        v104 = v101;
                        v112 = 0;
                      }
                      else
                      {
                        CFRelease(v112);
                        v72 = 0;
                        LODWORD(v10) = 0;
                        v29 = 0;
                        v112 = 0;
                        v104 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
                      }
                    }
                    else
                    {
                      v72 = 0;
                      LODWORD(v10) = 0;
                      v29 = 0;
                    }
                  }
                  else
                  {
                    v29 = 2;
                    LODWORD(v10) = 1;
                  }
                  goto LABEL_92;
                }
                v45 = 0;
                v46 = *(_QWORD *)(*((_QWORD *)v20 + 9) + 24 * v25);
                do
                {
                  *(_DWORD *)&v119[v45] = *(_DWORD *)(v46 + v45);
                  v45 += 4;
                }
                while (v45 != 36);
                sub_1D4C88E58(v69, (uint64_t)v119, 0, (__int128 *)&v103, v16, v15, v14, v13, v6, v7);
                v47 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v47)
                {
                  v67 = 0;
                  NSLog(CFSTR("alRender: error transforming frame2"));
                  v29 = 2;
                  LODWORD(v10) = 10;
LABEL_92:
                  v71 = v44;
                  goto LABEL_16;
                }
                v48 = *(float *)(*((_QWORD *)v20 + 12) + 4 * v25);
                v49 = v47;
                v71 = v44;
                memset(&v118, 0, 24);
                v118.d = v48;
                v67 = v49;
                objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIColorMatrix"));
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "setDefaults");
                objc_msgSend(v50, "setValue:forKey:", v49, v65);
                objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithValues:count:", &v118, 4);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "setValue:forKey:", v51, CFSTR("inputAVector"));

                objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CISourceOverCompositing"));
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "setDefaults");
                objc_msgSend(v50, "outputImage");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "setValue:forKey:", v53, v65);

                objc_msgSend(v52, "setValue:forKey:", v71, v64);
                objc_msgSend(v52, "outputImage");
                v54 = objc_claimAutoreleasedReturnValue();

                if (v54)
                {
                  v55 = (id)v54;
                  goto LABEL_71;
                }
                v68 = 0;
                NSLog(CFSTR("Error on CIImage blend"));
              }
              else
              {
                v71 = 0;
                NSLog(CFSTR("alRender: error transforming frame1"));
              }
            }
            else
            {
              v69 = 0;
              NSLog(CFSTR("alRender: error converting frame to CIImage"));
            }
LABEL_90:
            v29 = 2;
            LODWORD(v10) = 10;
            goto LABEL_16;
          }
        }
        else
        {
          v89 = v102;
          v56 = -[VideoReader getFrameAtTime:exactTime:frame:](v36, "getFrameAtTime:exactTime:frame:", &v89, 1, &sbuf);
          if (!v56)
          {
            v35 = sbuf;
            goto LABEL_42;
          }
        }
        v57 = sub_1D4C8852C(v56);
        NSLog(CFSTR("alRender: error reading frame (%s)\n"), v57);
        v29 = 2;
        LODWORD(v10) = 9;
        goto LABEL_16;
      }
      v78 = 0;
      goto LABEL_15;
    }
    v79 = 0;
LABEL_15:
    v29 = 2;
    LODWORD(v10) = 5;
LABEL_16:
    objc_autoreleasePoolPop(v19);
    if (v29)
      break;
    ++v11;
  }
  while (v11 != v17);
  if (sbuf)
  {
    CFRelease(sbuf);
    sbuf = 0;
  }
  if (v112)
  {
    CFRelease(v112);
    v112 = 0;
  }
  if (cf)
    CFRelease(cf);
  if (v72)
    CFRelease(v72);
  if ((_DWORD)v10)
  {
    v61 = 1;
    v62 = v10;
  }
  else
  {
    v81 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v80 = *MEMORY[0x1E0CA2E68];
    v61 = 0;
    v62 = ((uint64_t (*)(uint64_t (**)(void), _QWORD, __int128 *, _QWORD))v75[2])(v75, 0, &v80, 0) ^ 1;
  }

LABEL_107:
  _Block_object_dispose(&v106, 8);

  _Block_object_dispose(v114, 8);
  _Block_object_dispose(v116, 8);

  objc_autoreleasePoolPop(context);
  if (v61)
    v10 = v10;
  else
    v10 = v62;
LABEL_110:

  return v10;
}

void sub_1D4C7412C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,void *a24,void *a25,void *a26)
{
  void *v26;
  void *v27;
  void *v28;

  _Block_object_dispose(&STACK[0x388], 8);
  _Block_object_dispose(&STACK[0x3C8], 8);
  _Block_object_dispose(&STACK[0x3E8], 8);

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C7424C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D4C7425C(uint64_t a1)
{

}

uint64_t alGetNumerOfFrames(_QWORD *a1)
{
  return (uint64_t)(a1[1] - *a1) >> 3;
}

__n128 alGetLoopPeriod@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *(__n128 *)(a1 + 88);
  *a2 = result;
  a2[1].n128_u64[0] = *(_QWORD *)(a1 + 104);
  return result;
}

__n128 alGetLoopStart@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = a1[4];
  *a2 = result;
  a2[1].n128_u64[0] = a1[5].n128_u64[0];
  return result;
}

__n128 alGetFadeDuration@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = a1[7];
  *a2 = result;
  a2[1].n128_u64[0] = a1[8].n128_u64[0];
  return result;
}

void sub_1D4C742B0(uint64_t a1, float32x2_t *a2, float32x2_t *a3, float *a4)
{
  float32x2_t *v7;
  uint64_t v8;
  unint64_t v10;
  uint64_t v12;
  float v13;
  uint64_t v14;
  float32x2_t v15;
  float32x2_t v16;
  int32x2_t v17;
  float32x2_t v18;
  float32x2_t *v19;
  float32x2_t *v20;
  uint64_t v21;
  unint64_t v22;
  float32x2_t *v23;
  float32x2_t v24;
  float v25;
  unint64_t v26;
  float32x2_t v27;
  float v28;
  float32x2_t *v29;
  float32x2_t v30;
  float32x2_t v31;
  float v33;
  float v34;
  float v36;
  float v41;
  float v42;
  float32x2_t v43;
  void *__p;
  float32x2_t *v45;

  v7 = *(float32x2_t **)a1;
  v8 = *(_QWORD *)(a1 + 8) - *(_QWORD *)a1;
  if ((unint64_t)v8 < 9)
  {
    v18 = 0;
    _S9 = 0.0;
    v33 = 0.0;
    v34 = 0.0;
    _D3 = 0;
  }
  else
  {
    v10 = v8 >> 3;
    _CF = v8 >> 3 != 0;
    v12 = (v8 >> 3) - 1;
    v13 = (float)(unint64_t)v12;
    if (v12 != 0 && _CF)
      v14 = v10;
    else
      v14 = 1;
    v15 = 0;
    do
    {
      v16 = *v7++;
      v17.i32[1] = v16.i32[1];
      v15 = vadd_f32(v15, v16);
      --v14;
    }
    while (v14);
    *(float *)v17.i32 = (float)v10;
    v18 = vdiv_f32(v15, (float32x2_t)vdup_lane_s32(v17, 0));
    sub_1D4C77518(&__p, v10);
    v19 = *(float32x2_t **)a1;
    v20 = (float32x2_t *)__p;
    v21 = *(_QWORD *)(a1 + 8) - *(_QWORD *)a1;
    if (v21)
    {
      v22 = v21 >> 3;
      if (v22 <= 1)
        v22 = 1;
      v23 = (float32x2_t *)__p;
      do
      {
        v24 = *v19++;
        *v23++ = vsub_f32(v24, v18);
        --v22;
      }
      while (v22);
    }
    v25 = 1.0 / v13;
    if (v45 == v20)
    {
      v27 = 0;
      v28 = 0.0;
    }
    else
    {
      v26 = v45 - v20;
      if (v26 <= 1)
        v26 = 1;
      v27 = 0;
      v28 = 0.0;
      v29 = v20;
      do
      {
        v30 = *v29++;
        v31 = v30;
        v28 = vmlas_n_f32(v28, v31.f32[0], v31.f32[0]);
        v27 = vmla_lane_f32(v27, v31, v31, 1);
        --v26;
      }
      while (v26);
    }
    _S9 = v25 * v28;
    _D3 = vmul_n_f32(v27, v25);
    v36 = (float)(v25 * v28) + _D3.f32[1];
    __asm { FMLA            S0, S9, V3.S[1] }
    v41 = -(_S0 - (float)(v36 * v36) * 0.25);
    v42 = sqrtf(v41);
    if (v20)
    {
      v45 = v20;
      v43 = _D3;
      operator delete(v20);
      _D3 = v43;
    }
    v33 = v42 + (float)(v36 * 0.5);
    v34 = -(float)(v42 - (float)(v36 * 0.5));
  }
  *a2 = v18;
  a3->f32[0] = _S9;
  a3->i32[1] = _D3.i32[0];
  a3[1] = _D3;
  *a4 = v33;
  a4[1] = v34;
}

uint64_t sub_1D4C74448(uint64_t result, float *a2, float *a3, float *a4, float *a5)
{
  float *v5;
  uint64_t v6;
  unint64_t v7;
  float v8;
  uint64_t v9;
  float *v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float *v19;
  float v20;
  float v21;
  float v22;

  v5 = *(float **)result;
  v6 = *(_QWORD *)(result + 8) - *(_QWORD *)result;
  if (v6)
  {
    v7 = v6 >> 2;
    v8 = *v5;
    if ((unint64_t)v6 <= 4)
    {
      v17 = (float)v7;
      v18 = v8 / (float)v7;
      v20 = 0.0;
      v14 = *v5;
    }
    else
    {
      v9 = 2;
      if (v7 > 2)
        v9 = v7;
      v10 = v5 + 1;
      v11 = v9 - 1;
      v12 = v11;
      v13 = *v5;
      v14 = *v5;
      do
      {
        v15 = *v10++;
        v16 = v15;
        if (v14 < v15)
          v14 = v16;
        if (v16 < v13)
          v13 = v16;
        v8 = v8 + v16;
        --v12;
      }
      while (v12);
      v17 = (float)v7;
      v18 = v8 / (float)v7;
      v19 = v5 + 1;
      v20 = 0.0;
      do
      {
        v21 = *v19++;
        v20 = v20 + (float)((float)(v18 - v21) * (float)(v18 - v21));
        --v11;
      }
      while (v11);
      v8 = v13;
    }
    v22 = sqrtf(v20 / v17);
  }
  else
  {
    v14 = 0.0;
    v8 = 0.0;
    v22 = 0.0;
    v18 = 0.0;
  }
  *a2 = v18;
  *a4 = v14;
  *a3 = v8;
  *a5 = v22;
  return result;
}

uint64_t *sub_1D4C74510(uint64_t *result, float *a2, float *a3, float *a4, float *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  float v9;
  float *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float *v15;
  float v16;
  float v17;
  float v18;
  float v19;

  v5 = *result;
  v6 = result[1] - *result;
  if (v6)
  {
    v7 = 0;
    v8 = v6 >> 3;
    v9 = (float)v8;
    if (v8 <= 1)
      v8 = 1;
    v10 = (float *)(v5 + 4);
    v11 = 0.0;
    v12 = 0.0;
    v13 = 0.0;
    do
    {
      v14 = sqrtf((float)(*v10 * *v10) + (float)(*(v10 - 1) * *(v10 - 1)));
      if (v13 >= v14)
        v13 = v14;
      if (!v7)
        v13 = v14;
      v11 = v11 + v14;
      if (v12 < v14)
        v12 = v14;
      ++v7;
      v10 += 2;
    }
    while (v8 != v7);
    v15 = (float *)(v5 + 4);
    v16 = 0.0;
    v17 = v11 / v9;
    do
    {
      v18 = sqrtf((float)(*v15 * *v15) + (float)(*(v15 - 1) * *(v15 - 1)));
      v16 = v16 + (float)((float)(v17 - v18) * (float)(v17 - v18));
      v15 += 2;
      --v8;
    }
    while (v8);
    v19 = sqrtf(v16 / v9);
  }
  else
  {
    v13 = 0.0;
    v12 = 0.0;
    v19 = 0.0;
    v17 = 0.0;
  }
  *a2 = v17;
  *a3 = v13;
  *a4 = v12;
  *a5 = v19;
  return result;
}

void sub_1D4C748BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_1D4C74918(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62)
      sub_1D4C590D0();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)sub_1D4C61FFC(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = &v6[4 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void sub_1D4C74BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1D4C74D64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4C750F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

void sub_1D4C75508(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4C75948(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14)
{
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  _Unwind_Resume(exception_object);
}

void sub_1D4C75B40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4C76104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_1D4C762D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4C7673C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1D4C76B00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4C76C2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4C76FE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C7713C(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return sub_1D4C60B10(a1, *(const void **)a2, *(_QWORD *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3));
}

char *sub_1D4C77178(char *result, uint64_t a2)
{
  if (result != (char *)a2)
    return sub_1D4C6454C(result, *(char **)a2, *(_QWORD *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3));
  return result;
}

_QWORD *sub_1D4C771B8(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return sub_1D4C77398(a1, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
}

char *sub_1D4C771E8(char *result, uint64_t a2)
{
  if (result != (char *)a2)
    return sub_1D4C77410(result, *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
  return result;
}

_QWORD *sub_1D4C7721C(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return sub_1D4C77398(a1, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
}

char *sub_1D4C7724C(char *result, uint64_t a2)
{
  if (result != (char *)a2)
    return sub_1D4C77410(result, *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3);
  return result;
}

_QWORD *sub_1D4C77398(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = sub_1D4C64A1C(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1D4C773F4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1D4C77410(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 3)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61)
      sub_1D4C590D0();
    v10 = v8 >> 2;
    if (v8 >> 2 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = sub_1D4C64A1C(v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 3;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

_QWORD *sub_1D4C77518(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D4C64A1C(a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1D4C77570(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

id sub_1D4C7758C(double *a1)
{
  double v2;
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("origin_x");
  v2 = *a1;
  *(float *)&v2 = *a1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("origin_y");
  v4 = a1[1];
  *(float *)&v4 = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = CFSTR("width");
  v6 = a1[2];
  *(float *)&v6 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v7;
  v12[3] = CFSTR("height");
  v8 = a1[3];
  *(float *)&v8 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void sub_1D4C776C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

double sub_1D4C77700(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("origin_x"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("origin_y"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("width"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("height"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v7 = v6;
  objc_msgSend(v3, "doubleValue");
  objc_msgSend(v4, "doubleValue");
  objc_msgSend(v5, "doubleValue");

  return v7;
}

void sub_1D4C777F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id sub_1D4C77830(CMTime *a1, _QWORD *a2, float a3)
{
  void *v6;
  CFDictionaryRef v7;
  void *v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  void *v13;
  CMTime v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *a1;
  v7 = CMTimeCopyAsDictionary(&v15, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, qword_1EFEC7F78);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 36; i += 4)
  {
    LODWORD(v9) = *(_DWORD *)(*a2 + i);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, qword_1EFEC7F80);
  *(float *)&v12 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, qword_1EFEC7F88);

  return v6;
}

void sub_1D4C77964(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

id sub_1D4C779A8(uint64_t a1)
{
  void *v2;
  const __CFAllocator *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  float v10;
  void *v11;
  void *v12;
  CMTime v14;
  CMTime v15;
  CMTime time;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  time = *(CMTime *)a1;
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, qword_1EFEC7F90);

  v15 = *(CMTime *)(a1 + 24);
  v5 = CMTimeCopyAsDictionary(&v15, v3);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, qword_1EFEC7F98);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 96);
  if (*(_QWORD *)(a1 + 104) != v7)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = *(float *)(v7 + 4 * v9);
      v14 = *(CMTime *)(*(_QWORD *)(a1 + 48) + v8);
      sub_1D4C77830(&v14, (_QWORD *)(*(_QWORD *)(a1 + 72) + v8), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v11);

      ++v9;
      v7 = *(_QWORD *)(a1 + 96);
      v8 += 24;
    }
    while (v9 < (*(_QWORD *)(a1 + 104) - v7) >> 2);
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, qword_1EFEC7FA0);
  if (*(_BYTE *)(a1 + 120))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, qword_1EFEC7FA8);

  }
  return v2;
}

void sub_1D4C77B44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C77B88(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  void **v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  const __CFDictionary *v15;
  void *v16;
  double v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id obj;
  uint64_t v39;
  void **v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *__p[3];
  CMTime v48;
  CMTime *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = operator new();
  v3 = MEMORY[0x1E0CA2E10];
  v4 = *MEMORY[0x1E0CA2E10];
  *(_OWORD *)v2 = *MEMORY[0x1E0CA2E10];
  v5 = *(_QWORD *)(v3 + 16);
  *(_QWORD *)(v2 + 16) = v5;
  *(_OWORD *)(v2 + 24) = v4;
  *(_QWORD *)(v2 + 40) = v5;
  *(_OWORD *)(v2 + 48) = 0u;
  v6 = (void **)(v2 + 48);
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_OWORD *)(v2 + 105) = 0u;
  objc_msgSend(v1, "objectForKeyedSubscript:", qword_1EFEC7F90);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    CMTimeMakeFromDictionary(&v48, v7);
    *(CMTime *)v2 = v48;
    objc_msgSend(v1, "objectForKeyedSubscript:", qword_1EFEC7F98);
    v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v29 = *(void **)(v2 + 96);
      if (v29)
      {
        *(_QWORD *)(v2 + 104) = v29;
        operator delete(v29);
      }
      v48.value = v2 + 72;
      sub_1D4C60A70((void ***)&v48);
      v30 = *(void **)(v2 + 48);
      if (v30)
      {
        *(_QWORD *)(v2 + 56) = v30;
        operator delete(v30);
      }
      MEMORY[0x1D82660DC](v2, 0x10A0C4091D32064);
      v2 = 0;
      goto LABEL_44;
    }
    CMTimeMakeFromDictionary(&v48, v8);
    *(CMTime *)(v2 + 24) = v48;
    objc_msgSend(v1, "objectForKeyedSubscript:", qword_1EFEC7FA0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v42, "count");
      sub_1D4C62744(&v48, v9);
      v10 = *(void **)(v2 + 96);
      if (v10)
      {
        *(_QWORD *)(v2 + 104) = v10;
        operator delete(v10);
        *(_QWORD *)(v2 + 96) = 0;
        *(_QWORD *)(v2 + 104) = 0;
        *(_QWORD *)(v2 + 112) = 0;
      }
      v40 = (void **)(v2 + 96);
      *(CMTime *)(v2 + 96) = v48;
      sub_1D4C64A5C(&v48, v9);
      v11 = *v6;
      if (*v6)
      {
        *(_QWORD *)(v2 + 56) = v11;
        operator delete(v11);
        *v6 = 0;
        *(_QWORD *)(v2 + 56) = 0;
        *(_QWORD *)(v2 + 64) = 0;
      }
      *(CMTime *)(v2 + 48) = v48;
      sub_1D4C62744(__p, 9uLL);
      sub_1D4C627B8(&v48, v9, (uint64_t)__p);
      sub_1D4C6440C((uint64_t *)(v2 + 72));
      *(CMTime *)(v2 + 72) = v48;
      memset(&v48, 0, sizeof(v48));
      v49 = &v48;
      sub_1D4C60A70((void ***)&v49);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      obj = v42;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      if (!v12)
      {
LABEL_25:

        *(_BYTE *)(v2 + 120) = 0;
        objc_msgSend(v1, "objectForKeyedSubscript:", qword_1EFEC7FA8);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            *(_BYTE *)(v2 + 120) = objc_msgSend(v26, "BOOLValue");
          }
          else
          {
            v35 = sub_1D4C78304(v2);
            MEMORY[0x1D82660DC](v35, 0x10A0C4091D32064);
            v2 = 0;
          }
        }

        goto LABEL_43;
      }
      v13 = 0;
      v14 = *(_QWORD *)v44;
      v36 = *(_QWORD *)v44;
      v37 = v12;
      while (1)
      {
        v39 = 0;
        v15 = v8;
LABEL_13:
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v39);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        objc_msgSend(v16, "objectForKeyedSubscript:", qword_1EFEC7F88);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v8 = v15;
          goto LABEL_48;
        }
        objc_msgSend(v41, "doubleValue");
        *(float *)&v17 = v17;
        *((_DWORD *)*v40 + v13) = LODWORD(v17);
        objc_msgSend(v16, "objectForKeyedSubscript:", qword_1EFEC7F78);
        v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_48;
        memset(&v48, 0, sizeof(v48));
        CMTimeMakeFromDictionary(&v48, v8);
        v18 = (uint64_t)*v6 + 24 * v13;
        v19 = *(_OWORD *)&v48.value;
        *(_QWORD *)(v18 + 16) = v48.epoch;
        *(_OWORD *)v18 = v19;
        v20 = *(_QWORD *)(v2 + 72);
        objc_msgSend(v16, "objectForKeyedSubscript:", qword_1EFEC7F80);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v21, "count") != 9)
        {
LABEL_47:

LABEL_48:
          goto LABEL_49;
        }
        v22 = 0;
        v23 = (_QWORD *)(v20 + 24 * v13);
        do
        {
          objc_msgSend(v21, "objectAtIndexedSubscript:", v22, v36);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_47;
          }
          objc_msgSend(v24, "doubleValue");
          *(float *)&v25 = v25;
          *(_DWORD *)(*v23 + 4 * v22) = LODWORD(v25);

          ++v22;
        }
        while (v22 != 9);

        ++v13;
        v15 = v8;
        v14 = v36;
        if (++v39 != v37)
          goto LABEL_13;
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        if (!v37)
          goto LABEL_25;
      }
      v8 = v15;
LABEL_49:

      v34 = *v40;
      if (*v40)
      {
        *(_QWORD *)(v2 + 104) = v34;
        operator delete(v34);
      }
      v48.value = v2 + 72;
      sub_1D4C60A70((void ***)&v48);
      v32 = *v6;
      if (!*v6)
      {
LABEL_42:
        MEMORY[0x1D82660DC](v2, 0x10A0C4091D32064);
        v2 = 0;
LABEL_43:

LABEL_44:
        v7 = v8;
        goto LABEL_45;
      }
    }
    else
    {
      v31 = *(void **)(v2 + 96);
      if (v31)
      {
        *(_QWORD *)(v2 + 104) = v31;
        operator delete(v31);
      }
      v48.value = v2 + 72;
      sub_1D4C60A70((void ***)&v48);
      v32 = *(void **)(v2 + 48);
      if (!v32)
        goto LABEL_42;
    }
    *(_QWORD *)(v2 + 56) = v32;
    operator delete(v32);
    goto LABEL_42;
  }
  v27 = *(void **)(v2 + 96);
  if (v27)
  {
    *(_QWORD *)(v2 + 104) = v27;
    operator delete(v27);
  }
  v48.value = v2 + 72;
  sub_1D4C60A70((void ***)&v48);
  v28 = *(void **)(v2 + 48);
  if (v28)
  {
    *(_QWORD *)(v2 + 56) = v28;
    operator delete(v28);
  }
  MEMORY[0x1D82660DC](v2, 0x10A0C4091D32064);
  v2 = 0;
LABEL_45:

  return v2;
}

void sub_1D4C7821C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27)
{
  void *v27;
  void *v28;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C78304(uint64_t a1)
{
  void *v2;
  void *v3;
  void **v5;

  v2 = *(void **)(a1 + 96);
  if (v2)
  {
    *(_QWORD *)(a1 + 104) = v2;
    operator delete(v2);
  }
  v5 = (void **)(a1 + 72);
  sub_1D4C60A70(&v5);
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    *(_QWORD *)(a1 + 56) = v3;
    operator delete(v3);
  }
  return a1;
}

id sub_1D4C7835C(uint64_t *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFAllocator *v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  CMTime v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime time;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1D4C6D350(*((_DWORD *)a1 + 6));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, qword_1EFEC7FC8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)a1 + 7));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, qword_1EFEC7FD0);

  sub_1D4C7758C((double *)a1 + 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, qword_1EFEC7FD8);

  *(_OWORD *)&v20.value = *((_OWORD *)a1 + 4);
  v20.epoch = a1[10];
  *(_OWORD *)&v19.value = *(_OWORD *)(a1 + 11);
  v19.epoch = a1[13];
  *(_OWORD *)&v18.value = *((_OWORD *)a1 + 7);
  v18.epoch = a1[16];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  time = v20;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v8 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, qword_1EFEC7FB0);

  v22 = v19;
  v9 = CMTimeCopyAsDictionary(&v22, v7);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, qword_1EFEC7FB8);

  v21 = v18;
  v10 = CMTimeCopyAsDictionary(&v21, v7);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, qword_1EFEC7FC0);

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, qword_1EFEC7FE8);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = *a1;
  if (a1[1] != *a1)
  {
    v13 = 0;
    do
    {
      sub_1D4C779A8(*(_QWORD *)(v12 + 8 * v13));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v14);

      ++v13;
      v12 = *a1;
    }
    while (v13 < (a1[1] - *a1) >> 3);
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, qword_1EFEC7FE0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v15, qword_1EFEC7FF0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, qword_1EFEC7FF8);

  return v2;
}

void sub_1D4C78600(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C7866C(uint64_t **a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  char *v9;
  char *v10;
  char *v11;
  void *v12;
  const __CFDictionary *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  char *v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CMTime v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  *((_DWORD *)a1 + 34) = sub_1D4C78C70(v3, qword_1EFEC7FF0);
  v4 = sub_1D4C78C70(v3, qword_1EFEC7FF8);
  *((_DWORD *)a1 + 35) = v4;
  if (v4 < 3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", qword_1EFEC7FC8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        LODWORD(v41.value) = -1;
        *((_DWORD *)a1 + 6) = sub_1D4C6D374(v6, &v41);
        if (!LODWORD(v41.value))
        {
LABEL_10:
          objc_msgSend(v3, "objectForKeyedSubscript:", qword_1EFEC7FD0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v5 = 0;
LABEL_55:

            goto LABEL_56;
          }
          *((_DWORD *)a1 + 7) = objc_msgSend(v7, "intValue");
          objc_msgSend(v3, "objectForKeyedSubscript:", qword_1EFEC7FD8);
          v8 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v5 = 0;
LABEL_54:

            goto LABEL_55;
          }
          *((double *)a1 + 4) = sub_1D4C77700(v8);
          a1[5] = (uint64_t *)v9;
          a1[6] = (uint64_t *)v10;
          a1[7] = (uint64_t *)v11;
          objc_msgSend(v3, "objectForKeyedSubscript:", qword_1EFEC7FE8);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v8 = v12;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v5 = 0;
            v17 = v8;
LABEL_53:

            goto LABEL_54;
          }
          objc_msgSend(v8, "objectForKeyedSubscript:", qword_1EFEC7FB0);
          v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            CMTimeMakeFromDictionary(&v41, v13);
            *(CMTime *)(a1 + 8) = v41;
            objc_msgSend(v8, "objectForKeyedSubscript:", qword_1EFEC7FB8);
            v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              CMTimeMakeFromDictionary(&v41, v14);
              *(CMTime *)(a1 + 11) = v41;
              objc_msgSend(v8, "objectForKeyedSubscript:", qword_1EFEC7FC0);
              v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                CMTimeMakeFromDictionary(&v41, v15);
                *(CMTime *)(a1 + 14) = v41;

                v16 = (char *)*a1;
                if (*a1)
                {
                  a1[1] = (uint64_t *)v16;
                  operator delete(v16);
                  *a1 = 0;
                  a1[1] = 0;
                  a1[2] = 0;
                }
                a1[2] = 0;
                *a1 = 0;
                a1[1] = 0;
                objc_msgSend(v3, "objectForKeyedSubscript:", qword_1EFEC7FE0);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v5 = 0;
                  goto LABEL_53;
                }
                v39 = 0u;
                v40 = 0u;
                v37 = 0u;
                v38 = 0u;
                v13 = v17;
                v18 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
                if (v18)
                {
                  v35 = v18;
                  v36 = *(_QWORD *)v38;
                  while (2)
                  {
                    for (i = 0; i != v35; ++i)
                    {
                      if (*(_QWORD *)v38 != v36)
                        objc_enumerationMutation(v13);
                      v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v5 = 0;
                        goto LABEL_61;
                      }
                      v21 = sub_1D4C77B88(v20);
                      v5 = v21;
                      if (!v21)
                        goto LABEL_61;
                      v23 = a1[1];
                      v22 = (unint64_t)a1[2];
                      if ((unint64_t)v23 >= v22)
                      {
                        v25 = v23 - *a1;
                        if ((unint64_t)(v25 + 1) >> 61)
                          sub_1D4C590D0();
                        v26 = v22 - (_QWORD)*a1;
                        v27 = v26 >> 2;
                        if (v26 >> 2 <= (unint64_t)(v25 + 1))
                          v27 = v25 + 1;
                        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8)
                          v28 = 0x1FFFFFFFFFFFFFFFLL;
                        else
                          v28 = v27;
                        if (v28)
                          v29 = (char *)sub_1D4C60BD8((uint64_t)(a1 + 2), v28);
                        else
                          v29 = 0;
                        v30 = (uint64_t *)&v29[8 * v25];
                        *v30 = v5;
                        v24 = (char *)(v30 + 1);
                        v32 = (char *)*a1;
                        v31 = (char *)a1[1];
                        if (v31 != (char *)*a1)
                        {
                          do
                          {
                            v33 = *((_QWORD *)v31 - 1);
                            v31 -= 8;
                            *--v30 = v33;
                          }
                          while (v31 != v32);
                          v31 = (char *)*a1;
                        }
                        *a1 = v30;
                        a1[1] = (uint64_t *)v24;
                        a1[2] = (uint64_t *)&v29[8 * v28];
                        if (v31)
                          operator delete(v31);
                      }
                      else
                      {
                        *v23 = v21;
                        v24 = (char *)(v23 + 1);
                      }
                      a1[1] = (uint64_t *)v24;
                    }
                    v5 = 1;
                    v35 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
                    if (v35)
                      continue;
                    break;
                  }
                }
                else
                {
                  v5 = 1;
                }
LABEL_61:
                v17 = v13;
                goto LABEL_52;
              }
              v5 = 0;
              v13 = v15;
            }
            else
            {
              v5 = 0;
              v13 = v14;
            }
          }
          else
          {
            v5 = 0;
          }
          v17 = v8;
LABEL_52:

          goto LABEL_53;
        }
      }
    }
    else if (*((_DWORD *)a1 + 34) <= 1u)
    {
      *((_DWORD *)a1 + 6) = 0;
      goto LABEL_10;
    }
    v5 = 0;
LABEL_56:

    goto LABEL_57;
  }
  NSLog(CFSTR("alLoopRecipe: incompatible version (dictionary version %u, minVersion %u, code version %u)"), *((unsigned int *)a1 + 34), v4, 2);
  v5 = 0;
LABEL_57:

  return v5;
}

void sub_1D4C78BBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C78C70(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "unsignedIntValue");
  else
    v3 = 0;

  return v3;
}

void sub_1D4C78CD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__n128 sub_1D4C78CE8(uint64_t a1, int a2)
{
  __int128 v2;
  uint64_t v3;
  __n128 result;
  uint64_t v5;

  *(_DWORD *)a1 = a2;
  *(_QWORD *)&v2 = -1;
  *((_QWORD *)&v2 + 1) = -1;
  *(_OWORD *)(a1 + 4) = v2;
  *(_OWORD *)(a1 + 20) = v2;
  *(_DWORD *)(a1 + 36) = -1;
  *(_QWORD *)(a1 + 40) = CFSTR("NONE");
  *(_QWORD *)(a1 + 48) = CFSTR("NONE");
  *(_QWORD *)(a1 + 56) = 0;
  v3 = MEMORY[0x1E0CA2E18];
  result = *(__n128 *)MEMORY[0x1E0CA2E18];
  *(_OWORD *)(a1 + 64) = *MEMORY[0x1E0CA2E18];
  v5 = *(_QWORD *)(v3 + 16);
  *(_QWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 88) = result;
  *(_QWORD *)(a1 + 104) = v5;
  *(_QWORD *)(a1 + 112) = 0x7FC00000FFFFFFFELL;
  *(_QWORD *)(a1 + 120) = CFSTR("NONE");
  return result;
}

id sub_1D4C78D40(uint64_t a1)
{
  unsigned int v2;
  const __CFString *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  unsigned int v9;
  const __CFString *v10;
  unsigned int v11;
  const __CFString *v12;
  unsigned int v13;
  const __CFString *v14;
  unsigned int v15;
  const __CFString *v16;
  unsigned int v17;
  const __CFString *v18;
  unsigned int v19;
  const __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFAllocator *v23;
  CFDictionaryRef v24;
  CFDictionaryRef v25;
  uint64_t v26;
  void *v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  CMTime v33;
  CMTime time;
  _QWORD v35[18];
  _QWORD v36[19];

  v36[18] = *MEMORY[0x1E0C80C00];
  v35[0] = CFSTR("finalDecision");
  v2 = *(_DWORD *)(a1 + 4) + 2;
  if (v2 > 3)
    v3 = CFSTR("UnknownGatingResult");
  else
    v3 = off_1E9864190[v2];
  v36[0] = v3;
  v35[1] = CFSTR("recipeFlavor");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sub_1D4C6090C(*(_DWORD *)a1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v4;
  v35[2] = CFSTR("mShortInputDecision");
  v5 = *(_DWORD *)(a1 + 8) + 2;
  if (v5 > 3)
    v6 = CFSTR("UnknownGatingResult");
  else
    v6 = off_1E9864190[v5];
  v36[2] = v6;
  v35[3] = CFSTR("mPreGateStillMetadataDecision");
  v7 = *(_DWORD *)(a1 + 12) + 2;
  if (v7 > 3)
    v8 = CFSTR("UnknownGatingResult");
  else
    v8 = off_1E9864190[v7];
  v36[3] = v8;
  v35[4] = CFSTR("mPreGateVideoTrimDecision");
  v9 = *(_DWORD *)(a1 + 16) + 2;
  if (v9 > 3)
    v10 = CFSTR("UnknownGatingResult");
  else
    v10 = off_1E9864190[v9];
  v36[4] = v10;
  v35[5] = CFSTR("mPreGateVideoMLDecision");
  v11 = *(_DWORD *)(a1 + 20) + 2;
  if (v11 > 3)
    v12 = CFSTR("UnknownGatingResult");
  else
    v12 = off_1E9864190[v11];
  v36[5] = v12;
  v35[6] = CFSTR("mPreGateFacesDecision");
  v13 = *(_DWORD *)(a1 + 24) + 2;
  if (v13 > 3)
    v14 = CFSTR("UnknownGatingResult");
  else
    v14 = off_1E9864190[v13];
  v36[6] = v14;
  v35[7] = CFSTR("stabilizeGateDecision");
  v15 = *(_DWORD *)(a1 + 28) + 2;
  if (v15 > 3)
    v16 = CFSTR("UnknownGatingResult");
  else
    v16 = off_1E9864190[v15];
  v36[7] = v16;
  v35[8] = CFSTR("loopActivityDecision");
  v17 = *(_DWORD *)(a1 + 32) + 2;
  if (v17 > 3)
    v18 = CFSTR("UnknownGatingResult");
  else
    v18 = off_1E9864190[v17];
  v36[8] = v18;
  v35[9] = CFSTR("postGateDecision");
  v19 = *(_DWORD *)(a1 + 36) + 2;
  if (v19 > 3)
    v20 = CFSTR("UnknownGatingResult");
  else
    v20 = off_1E9864190[v19];
  v21 = *(_QWORD *)(a1 + 48);
  v36[9] = v20;
  v36[10] = v21;
  v35[10] = CFSTR("preGateStillFailureFeature");
  v35[11] = CFSTR("preGateVideoTrimFailureReason");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[11] = v22;
  v35[12] = CFSTR("preGateVideoTrimTimeStart");
  time = *(CMTime *)(a1 + 64);
  v23 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v24 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v36[12] = v24;
  v35[13] = CFSTR("preGateVideoTrimTimeLength");
  v33 = *(CMTime *)(a1 + 88);
  v25 = CMTimeCopyAsDictionary(&v33, v23);
  v26 = *(_QWORD *)(a1 + 40);
  v36[13] = v25;
  v36[14] = v26;
  v35[14] = CFSTR("preGateFacesExplanation");
  v35[15] = CFSTR("stabilizeResult");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 112));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[15] = v27;
  v35[16] = CFSTR("postGateClassifierScore");
  LODWORD(v28) = *(_DWORD *)(a1 + 116);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[17] = CFSTR("postGateDecisionExplanation");
  v30 = *(_QWORD *)(a1 + 120);
  v36[16] = v29;
  v36[17] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 18);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

void sub_1D4C790D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C7912C(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 16) + 16) = -1;
  return result;
}

uint64_t sub_1D4C7913C(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 16) + 20) = -1;
  return result;
}

uint64_t sub_1D4C7914C(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 16) + 24) = -1;
  return result;
}

uint64_t sub_1D4C7915C(uint64_t a1, int a2)
{
  uint64_t v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  int v30;
  _BOOL4 v31;
  uint64_t v32;
  void *v33;
  unsigned int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  void *__p;
  char *v45;
  char *v46;

  v2 = 4294967294;
  *(_DWORD *)(*(_QWORD *)(a1 + 16) + 12) = -2;
  if (a2)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 24) + 88)
      && (v4 = *(id *)(*(_QWORD *)(a1 + 24) + 88),
          objc_msgSend(v4, "featuresDict"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          v5))
    {
      if (*(_QWORD *)a1)
      {
        objc_msgSend(*(id *)a1, "objectForKeyedSubscript:", CFSTR("PreGateStill"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ALGClassifier"));
          v41 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ALGFeatureInstructions"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          if (v8)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ALGFeatInstrFeatureList"));
            v10 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v10 = 0;
          }
          v11 = (void *)v41;
          if (v41 | v10)
          {
            v12 = sub_1D4C70570((void *)v41);
            v11 = (void *)v41;
            if (v12)
            {
              v13 = 0;
              __p = 0;
              v45 = 0;
              v46 = 0;
              v40 = v12;
              while (1)
              {
                v14 = v13;
                if (objc_msgSend((id)v10, "count") <= (unint64_t)v13)
                  break;
                objc_msgSend((id)v10, "objectAtIndexedSubscript:", v13);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ALGFeatParams"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v16
                  || (objc_msgSend(v5, "objectForKeyedSubscript:", v16),
                      v17 = (void *)objc_claimAutoreleasedReturnValue(),
                      v17,
                      !v17))
                {
                  NSLog(CFSTR("evaluatePreGateStillMetatda: Missing pre-gate feature key %@.\n"), v16);

                  goto LABEL_38;
                }
                objc_msgSend(v5, "objectForKeyedSubscript:", v16);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "floatValue");
                v20 = v19;
                v21 = v45;
                if (v45 >= v46)
                {
                  v23 = (char *)__p;
                  v24 = (v45 - (_BYTE *)__p) >> 2;
                  v25 = v24 + 1;
                  if ((unint64_t)(v24 + 1) >> 62)
                    sub_1D4C590D0();
                  v26 = v46 - (_BYTE *)__p;
                  if ((v46 - (_BYTE *)__p) >> 1 > v25)
                    v25 = v26 >> 1;
                  if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
                    v27 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v27 = v25;
                  if (v27)
                  {
                    v28 = (char *)sub_1D4C61FFC((uint64_t)&v46, v27);
                    v23 = (char *)__p;
                    v21 = v45;
                  }
                  else
                  {
                    v28 = 0;
                  }
                  v29 = &v28[4 * v24];
                  *(_DWORD *)v29 = v20;
                  v22 = v29 + 4;
                  while (v21 != v23)
                  {
                    v30 = *((_DWORD *)v21 - 1);
                    v21 -= 4;
                    *((_DWORD *)v29 - 1) = v30;
                    v29 -= 4;
                  }
                  __p = v29;
                  v45 = v22;
                  v46 = &v28[4 * v27];
                  if (v23)
                    operator delete(v23);
                }
                else
                {
                  *(_DWORD *)v45 = v19;
                  v22 = v21 + 4;
                }
                v45 = v22;

                v13 = v14 + 1;
              }
              v42 = -1082130432;
              v43 = -1;
              v31 = sub_1D4C70BD4(v40, (uint64_t *)&__p, &v43, (float *)&v42);
              v32 = *(_QWORD *)(a1 + 16);
              *(_DWORD *)(v32 + 12) = !v31;
              if (v31)
              {
                v33 = *(void **)(v32 + 48);
                *(_QWORD *)(v32 + 48) = CFSTR("Unknown");

                v34 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v40 + 24))(v40);
                if ((v34 & 0x80000000) == 0 && objc_msgSend((id)v10, "count") > (unint64_t)v34)
                {
                  objc_msgSend((id)v10, "objectAtIndexedSubscript:");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("ALGFeatParams"));
                  v36 = objc_claimAutoreleasedReturnValue();
                  v37 = *(_QWORD *)(a1 + 16);
                  v38 = *(void **)(v37 + 48);
                  *(_QWORD *)(v37 + 48) = v36;

                }
              }
LABEL_38:
              (*(void (**)(uint64_t))(*(_QWORD *)v40 + 8))(v40);
              if (__p)
              {
                v45 = (char *)__p;
                operator delete(__p);
              }
              v11 = (void *)v41;
            }
          }

        }
      }
    }
    else
    {
      NSLog(CFSTR("ALGatingEvaluator::evaluatePreGateStillMetadata: missing still metadata dictionary"));
      v5 = 0;
    }
    v2 = *(unsigned int *)(*(_QWORD *)(a1 + 16) + 12);

  }
  return v2;
}

void sub_1D4C794E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *__p, uint64_t a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C79594(uint64_t a1, CMTime *a2, _OWORD *a3, __int128 *a4, CMTime *a5, CMTime *a6, int a7)
{
  uint64_t v7;
  id v14;
  PregateAnalyzer *v15;
  void *v16;
  CMTimeFlags flags;
  void *v18;
  BOOL v19;
  const __CFDictionary *v20;
  __int128 v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  CMTimeEpoch epoch;
  void *v32;
  CMTime v33;
  CMTime v34;
  CMTime v35[2];
  __int128 v36;
  CMTimeEpoch v37;
  _OWORD v38[3];
  __int128 v39;
  uint64_t v40;
  CMTime v41;
  CMTime rhs;
  CMTime lhs;
  CMTime v44;
  CMTime time2;
  CMTime time1;
  CMTime duration;
  CMTime start;
  CMTimeRange v49;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = 4294967294;
  *(_DWORD *)(*(_QWORD *)(a1 + 16) + 16) = -2;
  if (a7)
  {
    v14 = *(id *)(*(_QWORD *)(a1 + 24) + 88);
    if (!v14)
    {
LABEL_23:
      v7 = *(unsigned int *)(*(_QWORD *)(a1 + 16) + 16);

      return v7;
    }
    v15 = objc_alloc_init(PregateAnalyzer);
    -[PregateAnalyzer setFeatureBuilder:](v15, "setFeatureBuilder:", v14);
    start = *a5;
    duration = *a6;
    CMTimeRangeMake(&v49, &start, &duration);
    -[PregateAnalyzer setInputTrimTime:](v15, "setInputTrimTime:", &v49);
    if (*(_QWORD *)a1)
    {
      objc_msgSend(*(id *)a1, "objectForKeyedSubscript:", CFSTR("PreGateVideoES"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        -[PregateAnalyzer setPregateParameters:](v15, "setPregateParameters:", v16);

    }
    if ((~*((_DWORD *)a4 + 3) & 0x11) == 0)
    {
      value = *MEMORY[0x1E0CA2E10];
      flags = *(_DWORD *)(MEMORY[0x1E0CA2E10] + 12);
      timescale = *(_DWORD *)(MEMORY[0x1E0CA2E10] + 8);
      epoch = *(_QWORD *)(MEMORY[0x1E0CA2E10] + 16);
      objc_msgSend(v14, "featuresDict");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("vidTrackStillFrameTime"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18 == 0;

      if (!v19)
      {
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("vidTrackStillFrameTime"));
        v20 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(v35, v20);
        value = v35[0].value;
        flags = v35[0].flags;
        timescale = v35[0].timescale;
        epoch = v35[0].epoch;

      }
      if ((~flags & 0x11) != 0)
      {
        if ((~a5->flags & 0x11) == 0
          || (time1 = *a5,
              time2.value = value,
              time2.timescale = timescale,
              time2.flags = flags,
              time2.epoch = epoch,
              CMTimeCompare(&time1, &time2) <= 0))
        {
          if ((~a6->flags & 0x11) == 0
            || (lhs = *a5,
                rhs = *a6,
                CMTimeAdd(&v44, &lhs, &rhs),
                v41.value = value,
                v41.timescale = timescale,
                v41.flags = flags,
                v41.epoch = epoch,
                (CMTimeCompare(&v44, &v41) & 0x80000000) == 0))
          {
            *(_QWORD *)a4 = value;
            *((_DWORD *)a4 + 2) = timescale;
            *((_DWORD *)a4 + 3) = flags;
            *((_QWORD *)a4 + 2) = epoch;
          }
        }
      }

    }
    LODWORD(value) = 0;
    v39 = *a4;
    v40 = *((_QWORD *)a4 + 2);
    -[PregateAnalyzer setRequiredFrameTime:](v15, "setRequiredFrameTime:", &v39, epoch);
    v21 = a3[1];
    v38[0] = *a3;
    v38[1] = v21;
    v38[2] = a3[2];
    -[PregateAnalyzer setRequiredTimeRange:](v15, "setRequiredTimeRange:", v38);
    v36 = *(_OWORD *)&a2->value;
    v37 = a2->epoch;
    -[PregateAnalyzer setMinimumRequiredTrimLength:](v15, "setMinimumRequiredTrimLength:", &v36);
    if (-[PregateAnalyzer processPregateSuccess:](v15, "processPregateSuccess:", &value))
    {
      v22 = *(_QWORD *)(a1 + 16);
      v23 = -2;
    }
    else
    {
      v24 = value;
      v25 = *(_QWORD *)(a1 + 16);
      *(_QWORD *)(v25 + 56) = value;
      if (v24)
      {
        *(_DWORD *)(v25 + 16) = 0;
        goto LABEL_22;
      }
      memset(v35, 0, sizeof(v35));
      if (v15)
      {
        -[PregateAnalyzer outputTrimTime](v15, "outputTrimTime");
        if ((v35[0].flags & 1) != 0
          && ((v35[1].flags | v35[0].flags) & 0x10) == 0
          && (v35[1].flags & 1) != 0
          && !v35[1].epoch
          && (v35[1].value & 0x8000000000000000) == 0)
        {
          v34 = v35[1];
          v33 = *a2;
          if ((CMTimeCompare(&v34, &v33) & 0x80000000) == 0)
          {
            *a5 = v35[0];
            *a6 = v35[1];
            v27 = *(_QWORD *)(a1 + 16);
            v28 = *(_OWORD *)&a5->value;
            *(_QWORD *)(v27 + 80) = a5->epoch;
            *(_OWORD *)(v27 + 64) = v28;
            v29 = *(_QWORD *)(a1 + 16);
            v30 = *(_OWORD *)&a6->value;
            *(_QWORD *)(v29 + 104) = a6->epoch;
            *(_OWORD *)(v29 + 88) = v30;
          }
        }
      }
      v22 = *(_QWORD *)(a1 + 16);
      v23 = 1;
    }
    *(_DWORD *)(v22 + 16) = v23;
LABEL_22:

    goto LABEL_23;
  }
  return v7;
}

void sub_1D4C799AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C79A14(_QWORD *a1, int a2)
{
  uint64_t v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  int v31;
  _BOOL4 v32;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  int v37;
  int v38;
  void *__p;
  char *v40;
  char *v41;

  v2 = 4294967294;
  *(_DWORD *)(a1[2] + 20) = -2;
  if (a2)
  {
    v4 = *(id *)(a1[3] + 88);
    v5 = v4;
    if (v4 && (objc_msgSend(v4, "featuresDict"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v7 = (void *)a1[1];
      if (v7)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PreGateVideoML"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ALGClassifier"));
          v36 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ALGFeatureInstructions"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v10;
          if (v10)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ALGFeatInstrFeatureList"));
            v11 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v11 = 0;
          }
          v12 = (void *)v36;
          if (v36 | v11)
          {
            v13 = sub_1D4C70570((void *)v36);
            v12 = (void *)v36;
            if (v13)
            {
              v14 = 0;
              __p = 0;
              v40 = 0;
              v41 = 0;
              v34 = v13;
              while (1)
              {
                v15 = v14;
                if (objc_msgSend((id)v11, "count") <= (unint64_t)v14)
                  break;
                objc_msgSend((id)v11, "objectAtIndexedSubscript:", v14);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("ALGFeatParams"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v17
                  || (objc_msgSend(v6, "objectForKeyedSubscript:", v17),
                      v18 = (void *)objc_claimAutoreleasedReturnValue(),
                      v18,
                      !v18))
                {
                  NSLog(CFSTR("evaluateStillAndVideoMetadataML: Missing pre-gate feature key %@.\n"), v17);

                  goto LABEL_36;
                }
                objc_msgSend(v6, "objectForKeyedSubscript:", v17);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "floatValue");
                v21 = v20;
                v22 = v40;
                if (v40 >= v41)
                {
                  v24 = (char *)__p;
                  v25 = (v40 - (_BYTE *)__p) >> 2;
                  v26 = v25 + 1;
                  if ((unint64_t)(v25 + 1) >> 62)
                    sub_1D4C590D0();
                  v27 = v41 - (_BYTE *)__p;
                  if ((v41 - (_BYTE *)__p) >> 1 > v26)
                    v26 = v27 >> 1;
                  if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL)
                    v28 = 0x3FFFFFFFFFFFFFFFLL;
                  else
                    v28 = v26;
                  if (v28)
                  {
                    v29 = (char *)sub_1D4C61FFC((uint64_t)&v41, v28);
                    v24 = (char *)__p;
                    v22 = v40;
                  }
                  else
                  {
                    v29 = 0;
                  }
                  v30 = &v29[4 * v25];
                  *(_DWORD *)v30 = v21;
                  v23 = v30 + 4;
                  while (v22 != v24)
                  {
                    v31 = *((_DWORD *)v22 - 1);
                    v22 -= 4;
                    *((_DWORD *)v30 - 1) = v31;
                    v30 -= 4;
                  }
                  __p = v30;
                  v40 = v23;
                  v41 = &v29[4 * v28];
                  if (v24)
                    operator delete(v24);
                }
                else
                {
                  *(_DWORD *)v40 = v20;
                  v23 = v22 + 4;
                }
                v40 = v23;

                v14 = v15 + 1;
              }
              v37 = -1082130432;
              v38 = -1;
              v32 = sub_1D4C70BD4(v34, (uint64_t *)&__p, &v38, (float *)&v37);
              if (!v38)
                *(_DWORD *)(a1[2] + 20) = !v32;
LABEL_36:
              (*(void (**)(uint64_t))(*(_QWORD *)v34 + 8))(v34);
              if (__p)
              {
                v40 = (char *)__p;
                operator delete(__p);
              }
              v12 = (void *)v36;
            }
          }

        }
      }
    }
    else
    {
      puts("evaluateStillAndVideoMetadataML: metadata dictionary not available.");
      v6 = 0;
    }
    v2 = *(unsigned int *)(a1[2] + 20);

  }
  return v2;
}

void sub_1D4C79D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *__p, uint64_t a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C79DD4(_QWORD *a1, int a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v4 = a1[2];
  *(_DWORD *)(v4 + 24) = -2;
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = CFSTR("PreGateFaces: missing metadata or parameters.");

  if (a2)
  {
    v6 = (void *)a1[1];
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PreGateFaces"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("maxFaceSize"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "floatValue");
          v12 = v11;
          v13 = *(id *)(a1[3] + 88);
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "featuresDict");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PREGATE_VIDEO_FACE_MAX_SIZE"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = v17;
              if (v17)
              {
                objc_msgSend(v17, "floatValue");
                v20 = a1[2];
                if (v19 <= v12)
                {
                  *(_DWORD *)(v20 + 24) = 1;
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PreGateFaces: maxRelFaceSize %f <= %f (threshold).\n"), v19, v12);
                }
                else
                {
                  *(_DWORD *)(v20 + 24) = 0;
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PreGateFaces: maxRelFaceSize %f > %f (threshold).\n"), v19, v12);
                }
                v21 = objc_claimAutoreleasedReturnValue();
                v22 = a1[2];
                v23 = *(void **)(v22 + 40);
                *(_QWORD *)(v22 + 40) = v21;

              }
            }

          }
        }

      }
    }
  }
  return *(unsigned int *)(a1[2] + 24);
}

void sub_1D4C79F6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C79FA4(_QWORD *result, uint64_t a2, uint64_t a3)
{
  *result = 0;
  result[1] = 0;
  result[2] = a2;
  result[3] = a3;
  result[4] = 0;
  result[5] = 0;
  return result;
}

uint64_t sub_1D4C79FB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    *(_QWORD *)(a1 + 40) = 0;
  }

  return a1;
}

void sub_1D4C7A018(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v6 = a3;
  objc_storeStrong((id *)a1, a2);
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;

  sub_1D4C7A09C(a1);
  sub_1D4C7A13C((_QWORD *)a1);

}

void sub_1D4C7A088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1D4C7A09C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PostGate"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v6 = v3;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ALGClassifier"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
        *(_QWORD *)(a1 + 32) = sub_1D4C70570(v4);

      v3 = v6;
    }

  }
}

void sub_1D4C7A11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1D4C7A13C(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  id v8;

  v2 = (void *)a1[1];
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ActivityDetector"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v8 = v3;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ALGClassifier"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
        a1[5] = sub_1D4C70570(v4);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ALGFeatureInstructions"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (_QWORD *)operator new();
        sub_1D4C628F8(v7);
        sub_1D4C62930((uint64_t)v7, v6);
        *(_QWORD *)(a1[3] + 32) = v7;
      }

      v3 = v8;
    }

  }
}

void sub_1D4C7A21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  uint64_t v12;

  MEMORY[0x1D82660DC](v12, 0x80C40803F642BLL);

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C7A26C(uint64_t a1, CMTime *a2)
{
  uint64_t v3;
  uint64_t result;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  CMTime v11;
  CMTime time1;
  CMTime v13;

  v3 = *(_QWORD *)(a1 + 16);
  result = 4294967294;
  *(_DWORD *)(v3 + 8) = -2;
  if (*(_QWORD *)(a1 + 8))
  {
    objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", CFSTR("ShortInputGate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("desiredMinimumDuration"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        memset(&v13, 0, sizeof(v13));
        objc_msgSend(v8, "floatValue");
        CMTimeMakeWithSeconds(&v13, v10, 600);
        time1 = *a2;
        v11 = v13;
        *(_DWORD *)(*(_QWORD *)(a1 + 16) + 8) = CMTimeCompare(&time1, &v11) >= 0;
      }

    }
    return *(unsigned int *)(*(_QWORD *)(a1 + 16) + 8);
  }
  return result;
}

void sub_1D4C7A354(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C7A370(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  result = 4294967294;
  v4 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  *(_DWORD *)(v4 + 28) = -2;
  *(_DWORD *)(v4 + 112) = -2;
  if (v3)
  {
    v5 = sub_1D4C64B74(v3);
    v6 = *(_QWORD *)(a1 + 16);
    *(_DWORD *)(v6 + 112) = v5;
    result = v5 == 1;
    *(_DWORD *)(v6 + 28) = result;
  }
  return result;
}

uint64_t sub_1D4C7A3BC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;

  if (!*(_QWORD *)(a1 + 24))
    return 0xFFFFFFFFLL;
  v2 = *(void **)(a1 + 8);
  if (!v2)
    return 0xFFFFFFFFLL;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("PostGate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ALGClassifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ALGFeatureInstructions"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (_QWORD *)operator new();
        sub_1D4C628F8(v7);
        sub_1D4C62930((uint64_t)v7, v6);
        *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) = v7;
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ExperimentId"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 24) + 8), v8);

    }
  }

  return 0;
}

void sub_1D4C7A4C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  MEMORY[0x1D82660DC](v4, 0x80C40803F642BLL);

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C7A510(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  _BOOL4 v5;
  uint64_t v7;

  v2 = a1[3];
  *(_DWORD *)(a1[2] + 32) = -2;
  if (v2)
  {
    v3 = a1[5];
    if (v3)
    {
      v4 = *(uint64_t **)(v2 + 40);
      if (!v4)
      {
        if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3) & 1) != 0)
          return *(unsigned int *)(a1[2] + 32);
        v3 = a1[5];
      }
      v7 = 0;
      v5 = sub_1D4C70BD4(v3, v4, (_DWORD *)&v7 + 1, (float *)&v7);
      if (!HIDWORD(v7))
        *(_DWORD *)(a1[2] + 32) = v5;
    }
  }
  return *(unsigned int *)(a1[2] + 32);
}

uint64_t sub_1D4C7A594(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t *v8;
  _BOOL4 v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;

  v2 = a1[2];
  v3 = a1[3];
  *(_DWORD *)(v2 + 36) = -2;
  v4 = *(_DWORD *)(v3 + 208);
  if (v4 != 1)
  {
    if (!v4)
    {
      v5 = *(void **)(v2 + 120);
      *(_QWORD *)(v2 + 120) = CFSTR("UnoptimizedLoop");

      result = 0;
      *(_DWORD *)(a1[2] + 36) = 0;
      return result;
    }
    v10 = "ALGatingEvaluator::evaluatePostGate error: missing or corrupted gating feature isOptimizedLoop.";
    goto LABEL_12;
  }
  v7 = a1[4];
  if (!v7)
  {
    v10 = "ALGatingEvaluator::evaluatePostGate: cannot evaluate without post-gate classifier.";
LABEL_12:
    puts(v10);
    return *(unsigned int *)(a1[2] + 36);
  }
  v8 = *(uint64_t **)(v3 + 24);
  if (v8)
  {
LABEL_8:
    v17 = 0;
    v9 = sub_1D4C70BD4(v7, v8, &v17, (float *)(v2 + 116));
    if (!v17)
    {
      v11 = a1[2];
      *(_DWORD *)(v11 + 36) = !v9;
      v12 = (void *)MEMORY[0x1E0CB3940];
      sub_1D4C70C40(a1[4], v9, *(float *)(v11 + 116));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("PostGate %@"), v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = a1[2];
      v16 = *(void **)(v15 + 120);
      *(_QWORD *)(v15 + 120) = v14;

      return *(unsigned int *)(a1[2] + 36);
    }
    v10 = "ALGatingEvaluator::evaluatePostGate: classifier error.";
    goto LABEL_12;
  }
  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7) & 1) == 0)
  {
    v7 = a1[4];
    v2 = a1[2];
    goto LABEL_8;
  }
  return *(unsigned int *)(a1[2] + 36);
}

void sub_1D4C7A6CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C7A6DC(int **a1)
{
  int *v1;
  uint64_t v2;
  char v3;
  unint64_t v4;
  int *v5;
  unint64_t v6;
  int v7;
  int v8;
  uint64_t result;
  char v10;
  int *v11;
  unint64_t v12;
  int v13;
  int v14;

  v1 = *a1;
  v2 = (char *)a1[1] - (char *)*a1;
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = 0;
  v4 = v2 >> 2;
  if (v4 <= 1)
    v4 = 1;
  v5 = *a1;
  v6 = v4;
  do
  {
    v7 = *v5++;
    v3 |= v7 == -2;
    --v6;
  }
  while (v6);
  v8 = v3 & 1;
  if (v8)
    result = 4294967294;
  else
    result = 0xFFFFFFFFLL;
  if (!v8)
  {
    v10 = 1;
    v11 = v1;
    v12 = v4;
    do
    {
      v13 = *v11++;
      v10 &= v13 == -1;
      --v12;
    }
    while (v12);
    if ((v10 & 1) != 0)
      return 0xFFFFFFFFLL;
    LOBYTE(result) = 1;
    do
    {
      v14 = *v1++;
      result = (v14 == 1) & result;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t sub_1D4C7A778(uint64_t a1)
{
  uint64_t v1;
  int32x4_t *v2;
  int32x4_t v3;
  uint64_t v4;
  int32x4_t v6;
  int32x4_t v7;
  int *v8[3];

  v1 = *(_QWORD *)(a1 + 16);
  *(_DWORD *)(v1 + 4) = -2;
  v6 = *(int32x4_t *)(v1 + 24);
  v7 = *(int32x4_t *)(v1 + 8);
  v2 = (int32x4_t *)operator new(0x20uLL);
  v8[1] = v2[2].i32;
  v8[2] = v2[2].i32;
  v3 = vrev64q_s32(v6);
  v3.i64[0] = v6.i64[0];
  *v2 = v7;
  v2[1] = v3;
  v8[0] = (int *)v2;
  v4 = sub_1D4C7A6DC(v8);
  *(_DWORD *)(v1 + 4) = v4;
  operator delete(v2);
  return v4;
}

float sub_1D4C7A800(float *a1, void *a2, _DWORD *a3)
{
  id v5;
  float v6;

  v5 = a2;
  *a3 = 0;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("ALGFP_Stat_Min")))
  {
    v6 = a1[1];
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("ALGFP_Stat_Max")))
  {
    v6 = a1[2];
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("ALGFP_Stat_Mean")))
  {
    v6 = a1[3];
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("ALGFP_Stat_StDev")))
  {
    v6 = a1[4];
  }
  else
  {
    printf("getStatById: unknown statistic id %s.\n", (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"));
    *a3 = -1;
    v6 = 0.0;
  }

  return v6;
}

void sub_1D4C7A8E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C7A8F0(uint64_t a1, uint64_t a2)
{
  float *v3;
  uint64_t v4;
  unint64_t v5;
  float v6;
  uint64_t v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  uint64_t result;
  float v14;

  v3 = *(float **)a1;
  v4 = *(_QWORD *)(a1 + 8) - *(_QWORD *)a1;
  if (v4)
  {
    v5 = v4 >> 2;
    v6 = *v3;
    if (v5 <= 1)
      v7 = 1;
    else
      v7 = v5;
    v8 = 0.0;
    v9 = *v3;
    v10 = 0.0;
    do
    {
      v11 = *v3++;
      v12 = v11;
      if (v11 < v6)
        v6 = v12;
      if (v12 > v9)
        v9 = v12;
      v10 = v10 + v12;
      v8 = v8 + (float)(v12 * v12);
      --v7;
    }
    while (v7);
    result = 0;
    v14 = v10 / (float)v5;
    *(_BYTE *)a2 = 1;
    *(float *)(a2 + 4) = v6;
    *(float *)(a2 + 8) = v9;
    *(float *)(a2 + 12) = v14;
    *(float *)(a2 + 16) = sqrtf((float)(v8 / (float)v5) - (float)(v14 * v14));
  }
  else
  {
    puts("Can't compute stats for size-zero vector.");
    *(_BYTE *)a2 = 0;
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_1D4C7A998(_QWORD *a1, uint64_t *a2, uint64_t *a3)
{
  qos_class_t v6;
  NSObject *v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  unsigned int v11;
  float v12;
  _BYTE *v13;
  char **v14;
  char *v15;
  char *v16;
  char *v17;
  _QWORD block[8];
  void *__p;
  void *v21;
  uint64_t v22;
  unsigned int v23;
  int v24;
  void *v25;
  _BYTE *v26;

  v6 = qos_class_self();
  dispatch_get_global_queue(v6, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a1 + 24))(*a1);
  sub_1D4C716D0(a3, v8);
  v9 = *(unsigned int *)(a1[1] + 68);
  v24 = 1065353216;
  sub_1D4C61F3C(&v25, v9, &v24);
  if (*(_DWORD *)(a1[1] + 64) == 875704438 && v26 != v25)
  {
    v10 = 0;
    v11 = 0;
    do
    {
      v12 = sub_1D4C82178(v11);
      v13 = v25;
      *((float *)v25 + v10) = v12;
      v10 = ++v11;
    }
    while (v11 < (unint64_t)((v26 - v13) >> 2));
  }
  v14 = sub_1D4C80718(a2);
  v15 = *v14;
  v16 = v14[1];
  if (*v14 < v16)
  {
    do
    {
      sub_1D4C67468(*a3 + 24 * *(unsigned int *)v15, v8);
      v15 += 4;
      v16 = v14[1];
    }
    while (v15 < v16);
    v15 = *v14;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = sub_1D4C7ABC4;
  block[3] = &unk_1E9863D30;
  block[4] = v14;
  block[5] = a1;
  v23 = v8;
  block[6] = a2;
  block[7] = a3;
  v21 = 0;
  v22 = 0;
  __p = 0;
  sub_1D4C62030(&__p, v25, (uint64_t)v26, (v26 - (_BYTE *)v25) >> 2);
  dispatch_apply((v16 - v15) >> 2, v7, block);
  v17 = *v14;
  if (*v14)
  {
    v14[1] = v17;
    operator delete(v17);
  }
  MEMORY[0x1D82660DC](v14, 0x10C402FEFCB83);
  if (__p)
  {
    v21 = __p;
    operator delete(__p);
  }
  if (v25)
  {
    v26 = v25;
    operator delete(v25);
  }

  return 0;
}

void sub_1D4C7AB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  void *v23;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C7ABC4(uint64_t a1, unint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char **v10;
  char **v11;
  char *v12;
  uint64_t v13;
  unsigned int v14;
  _QWORD *v16;
  int v17;
  _DWORD *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _DWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t v36;
  unsigned __int8 *v37;
  uint64_t v38;
  unsigned __int8 *v39;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  float v45;
  char **v47;
  char *v48;
  uint64_t v49;
  char v50;

  v3 = *(_QWORD **)(a1 + 32);
  if (a2 >= (uint64_t)(v3[1] - *v3) >> 2)
    sub_1D4C62870();
  v4 = *(unsigned int *)(*v3 + 4 * a2);
  v5 = *(_QWORD **)(a1 + 40);
  v6 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)*v5 + 16))(*v5, v4);
  v7 = v5[1];
  v8 = *(_QWORD *)(v7 + 184);
  v9 = *(_DWORD *)(v7 + 192);
  v50 = 0;
  v10 = sub_1D4C808C0(*(uint64_t **)(a1 + 48), v4, &v50);
  v11 = v10;
  v12 = *v10;
  if (*v10 < v10[1])
  {
    v47 = v10;
    v49 = v8 + (v9 * v6);
    do
    {
      v13 = *(unsigned int *)v12;
      v14 = *(_DWORD *)(a1 + 88);
      if (v4 >= v14 || v13 >= v14)
        break;
      *(_DWORD *)(*(_QWORD *)(**(_QWORD **)(a1 + 56) + 24 * v4) + 4 * v13) = 0;
      v16 = *(_QWORD **)(a1 + 40);
      v17 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)*v16 + 16))(*v16, v13);
      v18 = *(_DWORD **)(*(_QWORD *)(a1 + 40) + 8);
      if (v18[17])
      {
        v48 = v12;
        v19 = 0;
        v20 = *(_QWORD *)(v16[1] + 184) + (*(_DWORD *)(v16[1] + 192) * v17);
        v21 = v49;
        do
        {
          v22 = (_DWORD *)sub_1D4C88E08((uint64_t)v18, v19);
          v23 = v21;
          v24 = v20;
          if (v19)
          {
            v25 = v4;
            v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v27 = 1;
            v23 = v21;
            do
            {
              v28 = sub_1D4C88E08(v26, v27 - 1);
              v23 += (*(_DWORD *)(v28 + 4) * *(_DWORD *)(v28 + 8));
              v29 = v19 == v27++;
            }
            while (!v29);
            v30 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v31 = 1;
            v24 = v20;
            do
            {
              v32 = sub_1D4C88E08(v30, v31 - 1);
              v24 += (*(_DWORD *)(v32 + 4) * *(_DWORD *)(v32 + 8));
              v29 = v19 == v31++;
            }
            while (!v29);
            v4 = v25;
            v21 = v49;
          }
          v33 = v22[1];
          if ((_DWORD)v33)
          {
            v34 = 0;
            v35 = 0;
            v36 = 0;
            do
            {
              if (v22[4] * *v22)
              {
                v37 = (unsigned __int8 *)(v23 + v34);
                v38 = (v22[4] * *v22);
                v39 = (unsigned __int8 *)(v24 + v34);
                do
                {
                  v41 = *v37++;
                  v40 = v41;
                  v42 = *v39++;
                  LODWORD(v43) = v40 - v42;
                  if ((int)v43 >= 0)
                    v43 = v43;
                  else
                    v43 = -(int)v43;
                  v36 += v43;
                  --v38;
                }
                while (v38);
              }
              ++v35;
              v34 += v22[2];
            }
            while (v35 != v33);
          }
          else
          {
            v36 = 0;
          }
          v44 = *(_QWORD *)(**(_QWORD **)(a1 + 56) + 24 * v4);
          v45 = (float)(*(float *)(*(_QWORD *)(a1 + 64) + 4 * v19) * (float)v36) + *(float *)(v44 + 4 * v13);
          *(float *)(v44 + 4 * v13) = v45;
          ++v19;
          v18 = *(_DWORD **)(*(_QWORD *)(a1 + 40) + 8);
        }
        while (v19 < v18[17]);
        v11 = v47;
        v12 = v48;
      }
      else
      {
        v44 = *(_QWORD *)(**(_QWORD **)(a1 + 56) + 24 * v4);
        v45 = *(float *)(v44 + 4 * v13);
      }
      *(float *)(v44 + 4 * v13) = v45 / (float)(v18[7] * v18[6]);
      v12 += 4;
    }
    while (v12 < v11[1]);
    v12 = *v11;
  }
  if (v12)
  {
    v11[1] = v12;
    operator delete(v12);
  }
  return MEMORY[0x1D82660DC](v11, 0x10C402FEFCB83);
}

_QWORD *sub_1D4C7AEA0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  v2 = (_QWORD *)(a1 + 64);
  v2[2] = 0;
  return sub_1D4C62030(v2, *(const void **)(a2 + 64), *(_QWORD *)(a2 + 72), (uint64_t)(*(_QWORD *)(a2 + 72) - *(_QWORD *)(a2 + 64)) >> 2);
}

void sub_1D4C7AEBC(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 64);
  if (v2)
  {
    *(_QWORD *)(a1 + 72) = v2;
    operator delete(v2);
  }
}

void sub_1D4C7B81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1D4C7B958(void *a1, void *a2, CMTime *a3, CMTime *a4, int a5)
{
  id v9;
  id v10;
  int32_t timescale;
  float v12;
  double Seconds;
  void *v14;
  float v15;
  int v16;
  float v17;
  CMTimeEpoch epoch;
  float v19;
  float v20;
  float v21;
  CMTimeRange v23;
  CMTime end;
  CMTime start;
  CMTimeRange v26;
  CMTime v27;
  CMTime v28;
  CMTime v29;
  CMTime v30;
  __int128 v31;
  uint64_t v32;
  CMTime rhs;
  CMTime lhs;
  CMTime time;
  CMTime v36;

  v9 = a1;
  v10 = a2;
  timescale = a4->timescale;
  if (a5 == 1)
    v12 = 1.0;
  else
    v12 = 0.0;
  v36 = *a3;
  lhs = *a4;
  rhs = v36;
  CMTimeSubtract(&time, &lhs, &rhs);
  Seconds = CMTimeGetSeconds(&time);
  objc_msgSend(MEMORY[0x1E0C8B260], "audioMixInputParametersWithTrack:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x1E0CA2E68];
  v32 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  objc_msgSend(v14, "setVolume:atTime:", &v31, COERCE_DOUBLE(__PAIR64__(DWORD1(v31), LODWORD(v12))));
  v15 = Seconds;
  v16 = -20;
  do
  {
    v17 = (float)(v16 + 21) / 20.0;
    if (v16 == -1)
    {
      *(_OWORD *)&v30.value = *(_OWORD *)&a4->value;
      epoch = a4->epoch;
    }
    else
    {
      memset(&v26, 0, 24);
      CMTimeMakeWithSeconds(&v26.start, (float)(v17 * v15), timescale);
      v28 = v26.start;
      v27 = *a3;
      CMTimeAdd(&v29, &v28, &v27);
      *(_OWORD *)&v30.value = *(_OWORD *)&v29.value;
      epoch = v29.epoch;
    }
    v30.epoch = epoch;
    memset(&v26, 0, sizeof(v26));
    start = v36;
    *(_OWORD *)&end.value = *(_OWORD *)&v30.value;
    end.epoch = epoch;
    CMTimeRangeFromTimeToTime(&v26, &start, &end);
    v19 = v17 * 1.5708;
    if (a5)
    {
      v20 = 0.0;
      if (a5 != 1)
        goto LABEL_13;
      v21 = cosf(v19);
    }
    else
    {
      v21 = sinf(v19);
    }
    v20 = v21;
LABEL_13:
    v23 = v26;
    objc_msgSend(v14, "setVolumeRampFromStartVolume:toEndVolume:timeRange:", &v23, COERCE_DOUBLE(__PAIR64__(v26.duration.flags, LODWORD(v12))), COERCE_DOUBLE(__PAIR64__(HIDWORD(v26.start.epoch), LODWORD(v20))));
    v36 = v30;
    v12 = v20;
  }
  while (!__CFADD__(v16++, 1));
  objc_msgSend(v10, "addObject:", v14);

}

void sub_1D4C7BBB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4C7BDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{

  _Unwind_Resume(a1);
}

void sub_1D4C7C030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{

  _Unwind_Resume(a1);
}

void sub_1D4C7C4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *__p,uint64_t a51)
{
  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1D4C7C6D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4C7C7D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4C7C808(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4C7C838(uint64_t *a1, unsigned int a2, uint64_t a3, int a4, int a5, int a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;

  sub_1D4C7C8F8((uint64_t)a1, a4, a5);
  if (a4 >= 1)
  {
    v12 = 0;
    v13 = *a1;
    do
    {
      if (a5 < 1)
      {
        v15 = 0;
      }
      else
      {
        v14 = 0;
        v15 = 0;
        do
        {
          if (*(unsigned __int8 *)(a3 + v14) >= a2)
          {
            ++v15;
            ++*(_DWORD *)(a1[3] + 4 * v14);
          }
          ++v14;
        }
        while (a5 != v14);
      }
      *(_DWORD *)(v13 + 4 * v12++) = v15;
      a3 += a6;
    }
    while (v12 != a4);
  }
}

void sub_1D4C7C8F8(uint64_t a1, int a2, int a3)
{
  sub_1D4C7C940(a1, a2);
  sub_1D4C7C940(a1 + 24, a3);
  bzero(*(void **)a1, *(_QWORD *)(a1 + 8) - *(_QWORD *)a1);
  bzero(*(void **)(a1 + 24), *(_QWORD *)(a1 + 32) - *(_QWORD *)(a1 + 24));
}

void sub_1D4C7C940(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    sub_1D4C7CA5C((char **)a1, a2 - v2);
  }
}

uint64_t sub_1D4C7C970(uint64_t a1, _QWORD *a2, unsigned int a3, _DWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t result;
  int v9;
  unint64_t v10;
  unsigned int v11;
  int v12;
  unsigned int v13;

  v4 = a2[1];
  v5 = v4 - *a2;
  if (v4 == *a2)
  {
    result = 0;
    v7 = 0;
    if (!a4)
      return result;
    goto LABEL_19;
  }
  v6 = 0;
  v7 = 0;
  LODWORD(result) = 0;
  v9 = 0;
  v10 = v5 >> 2;
  if (v10 <= 1)
    v10 = 1;
  do
  {
    v11 = *(_DWORD *)(*a2 + 4 * v6);
    v12 = v6 - v9;
    if (v9 >= (int)result)
      v13 = v9 + 1;
    else
      v13 = result;
    if (v9 < (int)result)
      v12 = v7;
    if (v11 >= a3)
      ++v9;
    else
      v9 = 0;
    if (v11 >= a3)
      result = v13;
    else
      result = result;
    if (v11 >= a3)
      v7 = v12;
    ++v6;
  }
  while (v10 != v6);
  if (a4)
LABEL_19:
    *a4 = v7;
  return result;
}

BOOL sub_1D4C7C9E4(_QWORD *a1, unsigned int a2, int a3, _DWORD *a4, _DWORD *a5)
{
  int v7;

  v7 = sub_1D4C7C970((uint64_t)a1, a1, a2, a4);
  if (a5)
    *a5 = v7;
  return v7 >= a3;
}

BOOL sub_1D4C7CA20(uint64_t a1, unsigned int a2, int a3, _DWORD *a4, _DWORD *a5)
{
  int v7;

  v7 = sub_1D4C7C970(a1, (_QWORD *)(a1 + 24), a2, a4);
  if (a5)
    *a5 = v7;
  return v7 >= a3;
}

void sub_1D4C7CA5C(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  int v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 2);
    if (v10 >> 62)
      sub_1D4C590D0();
    v11 = v9 >> 2;
    v12 = v5 - v8;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)sub_1D4C61FFC(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

void sub_1D4C7CB64(uint64_t a1, CVPixelBufferRef pixelBuffer, size_t planeIndex, char a4)
{
  size_t HeightOfPlane;
  double x;
  double y;
  double width;
  double height;
  uint64_t PixelFormatType;
  int v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  size_t v22;
  unint64_t v23;
  unint64_t v24;
  char *BaseAddressOfPlane;
  uint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  CGRect CleanRect;

  *(_QWORD *)(a1 + 8) = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, planeIndex);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, planeIndex);
  CleanRect = CVImageBufferGetCleanRect(pixelBuffer);
  x = CleanRect.origin.x;
  y = CleanRect.origin.y;
  width = CleanRect.size.width;
  height = CleanRect.size.height;
  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  if ((PixelFormatType | 0x10) == 0x34323076)
  {
    if (planeIndex)
      v14 = 2;
    else
      v14 = 1;
    *(_DWORD *)(a1 + 32) = v14;
    v15 = planeIndex == 1;
    v16 = (unint64_t)height >> (planeIndex == 1);
    *(_QWORD *)(a1 + 16) = (unint64_t)width >> (planeIndex == 1);
    *(_QWORD *)(a1 + 24) = v16;
    if ((a4 & 1) != 0)
    {
      v17 = 1;
      if (planeIndex == 1)
        v17 = 2;
      v18 = (unint64_t)(height + (double)v17 + -1.0) >> v15;
      v19 = (unint64_t)x >> v15;
      v20 = HeightOfPlane - ((unint64_t)y >> v15);
      v21 = *(_QWORD *)(a1 + 40);
      v22 = v20 - v18;
      v23 = *(_QWORD *)(a1 + 8) * v16;
      v24 = *(_QWORD *)(a1 + 48) - v21;
      if (v23 <= v24)
      {
        if (v23 < v24)
          *(_QWORD *)(a1 + 48) = v21 + v23;
      }
      else
      {
        sub_1D4C6261C((unint64_t *)(a1 + 40), v23 - v24);
      }
      CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, planeIndex);
      v26 = *(_QWORD *)(a1 + 8);
      v27 = &BaseAddressOfPlane[v26 * HeightOfPlane];
      v28 = &BaseAddressOfPlane[v26 * v22 + v19 * *(unsigned int *)(a1 + 32)];
      v29 = &v28[*(_QWORD *)(a1 + 24) * v26];
      if (v29 >= v27)
        v29 = v27;
      memmove(*(void **)(a1 + 40), v28, v29 - v28);
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
    }
  }
  else
  {
    NSLog(CFSTR("PixBufPlane: unknown pixel buffer format (%u)"), PixelFormatType);
  }
}

uint64_t sub_1D4C7CD28(uint64_t a1, __CVBuffer *a2, char a3)
{
  *(_QWORD *)a1 = off_1E98639F8;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_QWORD *)(a1 + 40) = 0;
  sub_1D4C7CD8C((_QWORD *)a1, a2, a3);
  return a1;
}

void sub_1D4C7CD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v10;

  a10 = (void **)(v10 + 24);
  sub_1D4C7DAE0(&a10);
  _Unwind_Resume(a1);
}

void sub_1D4C7CD8C(_QWORD *a1, CVImageBufferRef imageBuffer, char a3)
{
  size_t PlaneCount;
  uint64_t *v7;
  uint64_t v8;
  size_t i;
  CGRect CleanRect;

  CleanRect = CVImageBufferGetCleanRect(imageBuffer);
  a1[1] = (unint64_t)CleanRect.size.width;
  a1[2] = (unint64_t)CleanRect.size.height;
  PlaneCount = CVPixelBufferGetPlaneCount(imageBuffer);
  v7 = a1 + 3;
  sub_1D4C7CE24(v7, PlaneCount);
  if (PlaneCount)
  {
    v8 = 0;
    for (i = 0; i != PlaneCount; ++i)
    {
      sub_1D4C7CB64(*v7 + v8, imageBuffer, i, a3);
      v8 += 64;
    }
  }
}

uint64_t *sub_1D4C7CE24(uint64_t *result, unint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t (***v6)(_QWORD);
  uint64_t (***v7)(_QWORD);
  uint64_t (**v8)(_QWORD);
  BOOL v9;

  v2 = result;
  v3 = result[1];
  v4 = (v3 - *result) >> 6;
  if (a2 > v4)
    return (uint64_t *)sub_1D4C7DB6C(result, a2 - v4);
  if (a2 < v4)
  {
    v5 = *result + (a2 << 6);
    if (v3 != v5)
    {
      v6 = (uint64_t (***)(_QWORD))(v3 - 64);
      v7 = (uint64_t (***)(_QWORD))(v3 - 64);
      do
      {
        v8 = *v7;
        v7 -= 8;
        result = (uint64_t *)(*v8)(v6);
        v9 = v6 == (uint64_t (***)(_QWORD))v5;
        v6 = v7;
      }
      while (!v9);
    }
    v2[1] = v5;
  }
  return result;
}

unint64_t sub_1D4C7CEB0(void *a1, void *a2, uint64_t *a3, uint64_t a4, void *a5, uint64_t a6, uint64_t *a7)
{
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  id v16;
  float v17;
  double v18;
  double v19;
  float v20;
  float v21;
  id v22;
  id v23;
  unsigned int v24;
  char **v25;
  unsigned int *v26;
  uint64_t v27;
  double v28;
  void *v29;
  uint64_t v30;
  char **v31;
  __CVBuffer *v32;
  unsigned int v33;
  unsigned int v34;
  char *v35;
  int v36;
  unsigned int *v37;
  uint64_t v38;
  __CVBuffer *v39;
  unsigned int v40;
  float v41;
  unsigned int v42;
  uint64_t v43;
  char *v44;
  char *v45;
  id v47;
  id v48;
  id v49;
  id v50;
  void *context;
  unsigned int v52;
  unint64_t v53;
  _QWORD v55[3];
  uint64_t v56;
  char v57;
  __CVBuffer *v58;
  __CVBuffer *v59;
  __CVBuffer *v60;
  void **v61;

  v12 = a1;
  v13 = a2;
  v14 = a5;
  if ((*(_BYTE *)(a6 + 4) & 4) == 0)
  {
    NSLog(CFSTR("mapFrameDiffYUVDirect does not support RGB mode."));
    v15 = 0xFFFFFFFFLL;
    goto LABEL_51;
  }
  context = (void *)MEMORY[0x1D82662EC]();
  v16 = v13;
  objc_msgSend(v14, "numFrames");
  v17 = *(float *)a6;
  objc_msgSend(v14, "cropRect");
  if (v17 != 0.0)
  {
    v20 = v19 / v17;
    v19 = roundf(v20);
    v21 = v18 / v17;
    v18 = roundf(v21);
  }
  v15 = sub_1D4C633C0(v14, v12, 0, 0, &unk_1E9863E50, v16, v18, v19);
  if ((_DWORD)v15)
  {
    NSLog(CFSTR("***mapFrameDiffYUVDirect: error in pre-render\n"));
    goto LABEL_50;
  }
  v48 = v13;
  v49 = v16;
  v47 = v12;
  v22 = -[VideoAccessIndexNorm initFromFile:pixelFormat:normalizer:]([VideoAccessIndexNorm alloc], "initFromFile:pixelFormat:normalizer:", v16, 3588, a4);
  v23 = -[VideoAccessIndexNorm initFromFile:pixelFormat:normalizer:]([VideoAccessIndexNorm alloc], "initFromFile:pixelFormat:normalizer:", v16, 3588, a4);
  v50 = v22;
  v24 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a4 + 24))(a4);
  v53 = v24;
  sub_1D4C716D0(a7, v24);
  v59 = 0;
  v60 = 0;
  v58 = 0;
  v25 = sub_1D4C80718(a3);
  v26 = (unsigned int *)*v25;
  if (*v25 >= v25[1])
  {
    v15 = 0;
    goto LABEL_45;
  }
  LODWORD(v27) = 0;
  LODWORD(v15) = 0;
  v52 = v24 - 1;
  v28 = 0.0;
  do
  {
    v29 = (void *)MEMORY[0x1D82662EC]();
    v30 = *a7 + 24 * *v26;
    LODWORD(v55[0]) = 0;
    sub_1D4C68BB8(v30, v53, v55);
    v57 = 0;
    v31 = sub_1D4C808C0(a3, *v26, &v57);
    v32 = v58;
    if (v58)
    {
      v60 = v58;
      LODWORD(v27) = *v26 + 1;
      v58 = 0;
    }
    else
    {
      v42 = objc_msgSend(v22, "getFrameAtIndex:pixBuf:", *v26, &v60);
      if (v42)
      {
        v43 = *v26;
        v44 = sub_1D4C8852C(v42);
        NSLog(CFSTR("mapFrameDiffYUVDirect: error reading t1 index %u (%s)"), v43, v44);
        v36 = 2;
        v15 = 0xFFFFFFFFLL;
        goto LABEL_41;
      }
      v32 = v60;
    }
    sub_1D4C7CD28((uint64_t)v55, v32, 1);
    if (v28 == 0.0)
      v28 = (double)(unint64_t)(v55[2] * v55[1]);
    v33 = *v26;
    if (*v26 < v52)
    {
      if (v58)
      {
        CFRelease(v58);
        v58 = 0;
        v33 = *v26;
      }
      v27 = v33 + 1;
      v34 = objc_msgSend(v22, "getFrameAtIndex:pixBuf:", v27, &v58);
      if (v34)
      {
        v35 = sub_1D4C8852C(v34);
        NSLog(CFSTR("mapFrameDiffYUVDirect: error reading t1Plus1 index %u (%s)"), v27, v35);
        v36 = 2;
        v15 = 0xFFFFFFFFLL;
        goto LABEL_40;
      }
    }
    v37 = (unsigned int *)*v31;
    if (*v31 >= v31[1])
      goto LABEL_33;
    while (1)
    {
      v38 = *v37;
      *(_DWORD *)(*(_QWORD *)(*a7 + 24 * *v26) + 4 * v38) = 0;
      if ((_DWORD)v38 == (_DWORD)v27)
      {
        v59 = v58;
        CFRetain(v58);
      }
      v39 = v59;
      if (v59)
        goto LABEL_24;
      v40 = objc_msgSend(v23, "getFrameAtIndex:pixBuf:", *v37, &v59);
      if (v40)
        break;
      v39 = v59;
LABEL_24:
      v41 = sub_1D4C7D41C((uint64_t)v55, v39) / v28;
      *(float *)(*(_QWORD *)(*a7 + 24 * *v26) + 4 * *v37) = v41;
      if (v59)
      {
        CFRelease(v59);
        v59 = 0;
      }
      if (++v37 >= (unsigned int *)v31[1])
        goto LABEL_32;
    }
    v15 = *v37;
    v45 = sub_1D4C8852C(v40);
    NSLog(CFSTR("mapFrameDiffYUVDirect: error reading t2 index %u (%s)"), v15, v45);
    LODWORD(v15) = -1;
LABEL_32:
    v37 = (unsigned int *)*v31;
LABEL_33:
    if (v37)
    {
      v31[1] = (char *)v37;
      operator delete(v37);
    }
    MEMORY[0x1D82660DC](v31, 0x10C402FEFCB83);
    if ((_DWORD)v15)
    {
      v36 = 2;
      v15 = 0xFFFFFFFFLL;
      v22 = v50;
    }
    else
    {
      v22 = v50;
      if (v60)
      {
        CFRelease(v60);
        v15 = 0;
        v36 = 0;
        v60 = 0;
      }
      else
      {
        v15 = 0;
        v36 = 0;
      }
    }
LABEL_40:
    v55[0] = off_1E98639F8;
    v61 = (void **)&v56;
    sub_1D4C7DAE0(&v61);
LABEL_41:
    objc_autoreleasePoolPop(v29);
    if (v36)
      break;
    ++v26;
  }
  while (v26 < (unsigned int *)v25[1]);
LABEL_45:
  v13 = v48;
  if (v60)
  {
    CFRelease(v60);
    v60 = 0;
  }
  if (v59)
    CFRelease(v59);

  v12 = v47;
  v16 = v49;
LABEL_50:

  objc_autoreleasePoolPop(context);
LABEL_51:

  return v15;
}

void sub_1D4C7D35C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  void *v18;
  uint64_t v19;

  *(_QWORD *)(v19 - 112) = a18;
  sub_1D4C7DAE0((void ***)(v19 - 112));

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C7D414()
{
  return 1;
}

float sub_1D4C7D41C(uint64_t a1, __CVBuffer *a2)
{
  float v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  OSType PixelFormatType;
  OSType v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  _QWORD block[6];
  uint64_t (**v16)();
  __int128 v17;
  _QWORD v18[4];
  void **v19;
  void ***v20;
  uint64_t v21;
  char *v22;
  uint64_t (**v23)();
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  void **v27[2];

  v27[1] = *(void ***)MEMORY[0x1E0C80C00];
  sub_1D4C7CD28((uint64_t)&v23, a2, 0);
  if (CVPixelBufferLockBaseAddress(a2, 1uLL))
  {
    v4 = -1.0;
    NSLog(CFSTR("**applyDiffCVP: error on CVPixelBufferLockBaseAddress"));
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32) - *(_QWORD *)(a1 + 24);
    MEMORY[0x1E0C80A78]();
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = (char *)&block[-1] - v7;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3321888768;
    block[2] = sub_1D4C7D800;
    block[3] = &unk_1E9863D00;
    block[5] = a1;
    v16 = off_1E98639F8;
    v17 = v24;
    memset(v18, 0, 24);
    sub_1D4C7D92C(v18, v25, v26, (v26 - v25) >> 6);
    v18[3] = a2;
    block[4] = &v19;
    dispatch_apply(v6 >> 6, v5, block);
    CVPixelBufferUnlockBaseAddress(a2, 1uLL);
    PixelFormatType = CVPixelBufferGetPixelFormatType(a2);
    if ((v6 & 0x3FFFFFFFC0) != 0)
    {
      v9 = PixelFormatType;
      v10 = 0;
      v11 = ((unint64_t)v6 >> 6);
      v4 = 0.0;
      do
      {
        v12 = (float)(unint64_t)v20[3][v10];
        if (v9 == 875704438)
          v12 = sub_1D4C82178(v10) * v12;
        v4 = v4 + v12;
        ++v10;
      }
      while (v11 != v10);
    }
    else
    {
      v4 = 0.0;
    }
    v16 = off_1E98639F8;
    v27[0] = (void **)v18;
    sub_1D4C7DAE0(v27);
    _Block_object_dispose(&v19, 8);

  }
  v23 = off_1E98639F8;
  v19 = (void **)&v25;
  sub_1D4C7DAE0(&v19);
  return v4;
}

void sub_1D4C7D670(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 248) = v3;
  *(_QWORD *)(v4 - 112) = v2;
  sub_1D4C7DAE0((void ***)(v4 - 112));
  _Block_object_dispose((const void *)(v4 - 192), 8);

  *(_QWORD *)(v4 - 160) = off_1E98639F8;
  *(_QWORD *)(v4 - 192) = v4 - 136;
  sub_1D4C7DAE0((void ***)(v4 - 192));
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C7D6DC(uint64_t a1)
{
  void **v3;

  *(_QWORD *)a1 = off_1E98639F8;
  v3 = (void **)(a1 + 24);
  sub_1D4C7DAE0(&v3);
  return a1;
}

_QWORD *sub_1D4C7D720(_QWORD *a1)
{
  void *v2;

  *a1 = &off_1E9863948;
  v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_1D4C7D75C(_QWORD *a1)
{
  void *v2;

  *a1 = &off_1E9863948;
  v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1D82660DCLL);
}

uint64_t sub_1D4C7D7A8(uint64_t a1)
{
  void **v3;

  *(_QWORD *)a1 = off_1E98639F8;
  v3 = (void **)(a1 + 24);
  sub_1D4C7DAE0(&v3);
  return MEMORY[0x1D82660DC](a1, 0x10A1C406C85F68BLL);
}

unsigned __int8 *sub_1D4C7D800(uint64_t a1, size_t a2)
{
  uint64_t v4;
  size_t v5;
  unsigned __int8 *v6;
  unsigned __int8 *result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  uint64_t i;
  int v14;
  int v15;
  int v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) + (a2 << 6);
  v6 = *(unsigned __int8 **)(v5 + 40);
  result = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(a1 + 96), a2);
  v8 = *(_QWORD *)(v5 + 24);
  if (v8)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = v6;
      v12 = result;
      for (i = *(_QWORD *)(v5 + 16) * *(unsigned int *)(v5 + 32); i; --i)
      {
        v15 = *v11++;
        v14 = v15;
        v16 = *v12++;
        LODWORD(v17) = v14 - v16;
        if ((int)v17 >= 0)
          v17 = v17;
        else
          v17 = -(int)v17;
        v10 += v17;
      }
      ++v9;
      result += *(_QWORD *)(v4 + (a2 << 6) + 8);
      v6 += *(_QWORD *)(v5 + 8);
    }
    while (v9 != v8);
  }
  else
  {
    v10 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) + 8 * a2) = v10;
  return result;
}

_QWORD *sub_1D4C7D8C8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  _QWORD *v3;

  *(_QWORD *)(a1 + 48) = off_1E98639F8;
  v2 = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = 0;
  v3 = (_QWORD *)(a1 + 72);
  *((_OWORD *)v3 - 1) = v2;
  v3[1] = 0;
  v3[2] = 0;
  return sub_1D4C7D92C(v3, *(_QWORD *)(a2 + 72), *(_QWORD *)(a2 + 80), (uint64_t)(*(_QWORD *)(a2 + 80) - *(_QWORD *)(a2 + 72)) >> 6);
}

void sub_1D4C7D8F8(uint64_t a1)
{
  void **v1;

  *(_QWORD *)(a1 + 48) = off_1E98639F8;
  v1 = (void **)(a1 + 72);
  sub_1D4C7DAE0(&v1);
}

_QWORD *sub_1D4C7D92C(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    sub_1D4C7D9B0(result, a4);
    result = (_QWORD *)sub_1D4C7DA24((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_1D4C7D990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  sub_1D4C7DAE0(&a9);
  _Unwind_Resume(a1);
}

char *sub_1D4C7D9B0(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 58)
    sub_1D4C590D0();
  result = (char *)sub_1D4C7D9F0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[64 * v4];
  return result;
}

void *sub_1D4C7D9F0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58)
    sub_1D4C5919C();
  return operator new(a2 << 6);
}

uint64_t sub_1D4C7DA24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  _QWORD *v8;
  __int128 v9;
  __int128 v10;
  _QWORD *v11;

  if (a2 != a3)
  {
    v7 = 0;
    do
    {
      v8 = (_QWORD *)(a4 + v7);
      *v8 = &off_1E9863948;
      v9 = *(_OWORD *)(a2 + v7 + 8);
      v10 = *(_OWORD *)(a2 + v7 + 20);
      v8[5] = 0;
      v11 = (_QWORD *)(a4 + v7 + 40);
      *(_OWORD *)((char *)v11 - 20) = v10;
      *((_OWORD *)v11 - 2) = v9;
      v11[1] = 0;
      v11[2] = 0;
      sub_1D4C625A4(v11, *(const void **)(a2 + v7 + 40), *(_QWORD *)(a2 + v7 + 48), *(_QWORD *)(a2 + v7 + 48) - *(_QWORD *)(a2 + v7 + 40));
      v7 += 64;
    }
    while (a2 + v7 != a3);
    a4 += v7;
  }
  return a4;
}

void sub_1D4C7DAB4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  if (v2)
  {
    v4 = v1 - 64;
    do
    {
      (**(void (***)(uint64_t))(v4 + v2))(v4 + v2);
      v2 -= 64;
    }
    while (v2);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D4C7DAE0(void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  char *v7;
  void (**v8)(char *);
  BOOL v9;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      v6 = v4 - 64;
      v7 = v4 - 64;
      do
      {
        v8 = *(void (***)(char *))v7;
        v7 -= 64;
        (*v8)(v6);
        v9 = v6 == v2;
        v6 = v7;
      }
      while (!v9);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_1D4C7DB6C(uint64_t *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  _QWORD v17[5];

  v6 = a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(result - 8);
  if (a2 <= (v6 - v7) >> 6)
  {
    if (a2)
    {
      v14 = v7 + (a2 << 6);
      do
      {
        *(_QWORD *)(v7 + 48) = 0;
        *(_QWORD *)(v7 + 56) = 0;
        *(_QWORD *)(v7 + 40) = 0;
        *(_QWORD *)v7 = &off_1E9863948;
        *(_QWORD *)(v7 + 8) = 0;
        *(_QWORD *)(v7 + 16) = 0;
        *(_QWORD *)(v7 + 24) = 0;
        *(_DWORD *)(v7 + 32) = 0;
        v7 += 64;
      }
      while (v7 != v14);
      v7 = v14;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - *a1;
    v9 = a2 + (v8 >> 6);
    if (v9 >> 58)
      sub_1D4C590D0();
    v10 = v8 >> 6;
    v11 = v5 - *a1;
    if (v11 >> 5 > v9)
      v9 = v11 >> 5;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFC0)
      v12 = 0x3FFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    v17[4] = result;
    if (v12)
      v13 = (char *)sub_1D4C7D9F0(result, v12);
    else
      v13 = 0;
    v15 = &v13[64 * v10];
    v17[0] = v13;
    v17[1] = v15;
    v17[3] = &v13[64 * v12];
    v16 = &v15[64 * a2];
    do
    {
      *((_QWORD *)v15 + 6) = 0;
      *((_QWORD *)v15 + 7) = 0;
      *((_QWORD *)v15 + 5) = 0;
      *(_QWORD *)v15 = &off_1E9863948;
      *((_QWORD *)v15 + 1) = 0;
      *((_QWORD *)v15 + 2) = 0;
      *((_QWORD *)v15 + 3) = 0;
      *((_DWORD *)v15 + 8) = 0;
      v15 += 64;
    }
    while (v15 != v16);
    v17[2] = v16;
    sub_1D4C7DCA8(a1, v17);
    return sub_1D4C7DDD8((uint64_t)v17);
  }
  return result;
}

void sub_1D4C7DC94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1D4C7DDD8((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C7DCA8(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1D4C7DD1C((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_1D4C7DD1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  _QWORD *v16;

  for (i = 0; ; i -= 64)
  {
    v12 = a3 + i;
    if (a3 + i == a5)
      break;
    v13 = a7 + i;
    *(_QWORD *)(v13 - 64) = &off_1E9863948;
    v14 = *(_OWORD *)(v12 - 56);
    v15 = *(_OWORD *)(v12 - 44);
    *(_QWORD *)(v13 - 24) = 0;
    v16 = (_QWORD *)(a7 + i - 24);
    *(_OWORD *)((char *)v16 - 20) = v15;
    *((_OWORD *)v16 - 2) = v14;
    v16[1] = 0;
    v16[2] = 0;
    sub_1D4C625A4(v16, *(const void **)(v12 - 24), *(_QWORD *)(v12 - 16), *(_QWORD *)(v12 - 16) - *(_QWORD *)(v12 - 24));
  }
  return a6;
}

uint64_t sub_1D4C7DDD8(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  void (**v4)(void);

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    v4 = *(void (***)(void))(i - 64);
    *(_QWORD *)(a1 + 16) = i - 64;
    (*v4)();
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_1D4C7DE28(uint64_t a1, int a2, int a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;

  v9 = a5;
  sub_1D4C67468(a1 + 16, a3 * a2);
  *(_DWORD *)(a1 + 40) = a2;
  *(_DWORD *)(a1 + 44) = a3;
  v10 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = a4;
  *(_QWORD *)(a1 + 8) = v9;

}

void sub_1D4C7DE84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4C7DE94(uint64_t *a1, _QWORD *a2, float **a3, int a4, int a5)
{
  float *v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  float *v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  int v23;
  int v24;
  float *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  float v31;
  uint64_t v32;
  int v33;
  float *v34;
  void *__p[3];

  sub_1D4C62744(__p, (a1[1] - *a1) >> 2);
  v10 = *a3;
  v11 = (char *)a3[1] - (char *)*a3;
  v12 = v11 >> 2;
  if (((v11 >> 2) & 0x80000000) == 0)
    v13 = v11 >> 2;
  else
    v13 = v12 + 1;
  if (a4 >= 1)
  {
    v14 = 0;
    v15 = -(v13 >> 1);
    v16 = (float *)__p[0];
    v17 = (v11 >> 2);
    v18 = v15 * a5;
    v19 = v15;
    do
    {
      if (a5 >= 1)
      {
        v20 = 0;
        do
        {
          if ((int)v12 < 1)
          {
            v21 = 0.0;
          }
          else
          {
            v21 = 0.0;
            v22 = v17;
            v23 = v19;
            v24 = v18;
            v25 = v10;
            do
            {
              if ((v23 & 0x80000000) == 0 && v23 < a4)
                v21 = v21 + (float)(*v25 * *(float *)(*a2 + 4 * (v20 + v24)));
              ++v25;
              v24 += a5;
              ++v23;
              --v22;
            }
            while (v22);
          }
          v16[v20 + v14 * a5] = v21;
          ++v20;
        }
        while (v20 != a5);
      }
      ++v14;
      v18 += a5;
      ++v19;
    }
    while (v14 != a4);
    v26 = 0;
    v27 = *a1;
    do
    {
      if (a5 >= 1)
      {
        v28 = 0;
        v29 = v26 * a5;
        v30 = v15;
        do
        {
          v31 = 0.0;
          if ((int)v12 >= 1)
          {
            v32 = v17;
            v33 = v30;
            v34 = v10;
            do
            {
              if ((v33 & 0x80000000) == 0 && v33 < a5)
                v31 = v31 + (float)(*v34 * *((float *)__p[0] + v29 + v33));
              ++v34;
              ++v33;
              --v32;
            }
            while (v32);
          }
          *(float *)(v27 + 4 * (v28 + v29)) = v31;
          ++v28;
          ++v30;
        }
        while (v28 != a5);
      }
      ++v26;
    }
    while (v26 != a4);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1D4C7E054(uint64_t *a1, uint64_t *a2, int a3, int a4, int a5, float a6)
{
  int v11;
  unint64_t v12;
  int32x2_t v13;
  float *v14;
  unint64_t v15;
  int32x2_t v16;
  uint64x2_t v17;
  int32x2_t v18;
  float32x2_t v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int64x2_t v27;
  uint64x2_t v28;
  float v29;
  float v30;
  float v31;
  int32x2_t v32;
  int64x2_t v33;
  void *__p[3];

  v11 = (int)(float)((float)(a6 * 6.0) + 1.0) | 1;
  v29 = 1.0 / (float)((float)(a6 + a6) * a6);
  if (v11 <= 3)
    v12 = 3;
  else
    v12 = v11;
  sub_1D4C62744(__p, v12);
  v28 = (uint64x2_t)vdupq_n_s64(v12 - 1);
  v13 = vdup_n_s32(v12 >> 1);
  v14 = (float *)((char *)__p[0] + 4);
  v15 = v12 + 1;
  v16 = (int32x2_t)0x100000000;
  v17 = (uint64x2_t)xmmword_1D4C95420;
  v27 = vdupq_n_s64(2uLL);
  do
  {
    v32 = vmovn_s64((int64x2_t)vcgeq_u64(v28, v17));
    v33 = (int64x2_t)v17;
    v18 = vsub_s32(v16, v13);
    v19 = vmul_n_f32(vcvt_f32_s32(vneg_s32(vmul_s32(v18, v18))), v29);
    v30 = v19.f32[0];
    v31 = expf(v19.f32[1]);
    v20 = expf(v30);
    if ((v32.i8[0] & 1) != 0)
      *(v14 - 1) = v20;
    if ((v32.i8[4] & 1) != 0)
      *v14 = v31;
    v17 = (uint64x2_t)vaddq_s64(v33, v27);
    v16 = vadd_s32(v16, (int32x2_t)0x200000002);
    v14 += 2;
    v15 -= 2;
  }
  while (v15);
  sub_1D4C7DE94(a1, a2, (float **)__p, a3, a4);
  if (a5)
  {
    v21 = *a2;
    v22 = a2[1];
    v23 = v22 - *a2;
    if (v22 != *a2)
    {
      v24 = 0;
      v25 = v23 >> 2;
      v26 = *a1;
      do
      {
        *(float *)(v26 + 4 * v24) = *(float *)(v21 + 4 * v24) - *(float *)(v26 + 4 * v24);
        ++v24;
      }
      while (v25 > v24);
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1D4C7E208(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1D4C7E224(float **a1, float **a2, int a3, int a4, float a5)
{
  uint64_t v9;
  int v10;
  float *v11;
  float *v12;
  uint64_t v13;
  float v14;
  float v15;
  uint64_t v16;
  float *v17;
  float *v18;
  float v19;
  uint64_t v20;
  int v21;
  float *v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  float v26;
  uint64_t v27;
  float *v28;

  if (a3 >= 1)
  {
    v9 = 0;
    v10 = a3 >> 1;
    v11 = *a2;
    v12 = *a1;
    v13 = 4 * a4;
    do
    {
      v14 = fabsf((float)(v9 - v10));
      v15 = expf((float)-(float)((float)(v14 / (float)v10) * (float)(v14 / (float)v10)) * a5);
      v16 = a4;
      v17 = v12;
      v18 = v11;
      if (a4 >= 1)
      {
        do
        {
          v19 = *v18++;
          *v17++ = v15 * v19;
          --v16;
        }
        while (v16);
      }
      ++v9;
      v11 = (float *)((char *)v11 + v13);
      v12 = (float *)((char *)v12 + v13);
    }
    while (v9 != a3);
  }
  if (a4 >= 1)
  {
    v20 = 0;
    v21 = a4 >> 1;
    v22 = *a1;
    v23 = a4;
    v24 = 4 * a4;
    do
    {
      v25 = fabsf((float)(v20 - v21));
      v26 = expf((float)-(float)((float)(v25 / (float)v21) * (float)(v25 / (float)v21)) * a5);
      v27 = a3;
      v28 = v22;
      if (a3 >= 1)
      {
        do
        {
          *v28 = v26 * *v28;
          v28 = (float *)((char *)v28 + v24);
          --v27;
        }
        while (v27);
      }
      ++v20;
      ++v22;
    }
    while (v20 != v23);
  }
}

_QWORD *sub_1D4C7E36C(_QWORD *result, _QWORD *a2, int a3, int a4, int a5)
{
  int v5;
  int v6;
  int v7;
  int v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  _DWORD *v15;
  int v16;

  if (a3 >= 0)
    v5 = a3;
  else
    v5 = a3 + 1;
  v6 = v5 >> 1;
  if (a5)
    v7 = 0;
  else
    v7 = v6;
  if (a5)
    v8 = v6;
  else
    v8 = a3;
  if (v7 < v8)
  {
    v9 = (_DWORD *)*result;
    v10 = v7;
    v11 = 4 * a4;
    v12 = *a2 + 4 * v7 * (uint64_t)a4;
    do
    {
      v13 = a4;
      v14 = (int *)v12;
      v15 = v9;
      if (a4 >= 1)
      {
        do
        {
          v16 = *v14++;
          *v15++ = v16;
          --v13;
        }
        while (v13);
      }
      ++v10;
      v9 = (_DWORD *)((char *)v9 + v11);
      v12 += v11;
    }
    while (v10 != v8);
  }
  return result;
}

void sub_1D4C7E3E8(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  int v14;
  float v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  float v23;
  _QWORD *v24;
  _QWORD *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  float **v31;
  float **v32;
  int v33;
  int v34;
  float v35;
  id v36;

  v7 = a3;
  *a4 = 0;
  v36 = v7;
  if (objc_msgSend(v7, "isEqual:", CFSTR("ALGFP_ImageFilter_Nonnegative")))
  {
    v8 = *(_QWORD *)(a1 + 16);
    v9 = *(_QWORD *)(a1 + 24);
    v10 = v9 - v8;
    if (v9 == v8)
    {
      v12 = 0;
    }
    else
    {
      v11 = 0;
      v12 = 0;
      v13 = v10 >> 2;
      do
      {
        if (*(float *)(v8 + 4 * v11) >= 0.0)
          ++v12;
        ++v11;
      }
      while (v13 > v11);
    }
    sub_1D4C7DE28(a2, 1, v12, a1, v36);
    v16 = *(_QWORD *)(a1 + 16);
    v17 = *(_QWORD *)(a1 + 24);
    v18 = v17 - v16;
    if (v17 != v16)
    {
      v19 = 0;
      v20 = 0;
      v21 = v18 >> 2;
      v22 = *(_QWORD *)(a2 + 16);
      do
      {
        v23 = *(float *)(v16 + 4 * v19);
        if (v23 >= 0.0)
          *(float *)(v22 + 4 * v20++) = v23;
        ++v19;
      }
      while (v21 > v19);
    }
    goto LABEL_25;
  }
  if (objc_msgSend(v36, "isEqual:", CFSTR("ALGFP_ImageFilter_LowPass_Gaussian3")))
  {
    sub_1D4C7DE28(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
    v14 = 0;
LABEL_10:
    v15 = 3.0;
LABEL_24:
    sub_1D4C7E054((uint64_t *)(a2 + 16), (uint64_t *)(a1 + 16), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), v14, v15);
    goto LABEL_25;
  }
  if (objc_msgSend(v36, "isEqual:", CFSTR("ALGFP_ImageFilter_LowPass_Gaussian5")))
  {
    sub_1D4C7DE28(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
    v14 = 0;
LABEL_13:
    v15 = 5.0;
    goto LABEL_24;
  }
  if (objc_msgSend(v36, "isEqual:", CFSTR("ALGFP_ImageFilter_LowPass_Gaussian7")))
  {
    sub_1D4C7DE28(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
    v14 = 0;
LABEL_23:
    v15 = 7.0;
    goto LABEL_24;
  }
  if (objc_msgSend(v36, "isEqual:", CFSTR("ALGFP_ImageFilter_HighPass_Gaussian3")))
  {
    sub_1D4C7DE28(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
    v14 = 1;
    goto LABEL_10;
  }
  if (objc_msgSend(v36, "isEqual:", CFSTR("ALGFP_ImageFilter_HighPass_Gaussian5")))
  {
    sub_1D4C7DE28(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
    v14 = 1;
    goto LABEL_13;
  }
  if (objc_msgSend(v36, "isEqual:", CFSTR("ALGFP_ImageFilter_HighPass_Gaussian7")))
  {
    sub_1D4C7DE28(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
    v14 = 1;
    goto LABEL_23;
  }
  if (objc_msgSend(v36, "isEqual:", CFSTR("ALGFP_ImageFilter_Top")))
  {
    sub_1D4C7DE28(a2, *(_DWORD *)(a1 + 40) / 2, *(_DWORD *)(a1 + 44), a1, v36);
    v24 = (_QWORD *)(a2 + 16);
    v25 = (_QWORD *)(a1 + 16);
    v26 = *(_DWORD *)(a1 + 40);
    v27 = *(_DWORD *)(a1 + 44);
    v28 = 1;
LABEL_39:
    sub_1D4C7E36C(v24, v25, v26, v27, v28);
    goto LABEL_25;
  }
  if (objc_msgSend(v36, "isEqual:", CFSTR("ALGFP_ImageFilter_Bottom")))
  {
    v29 = *(_DWORD *)(a1 + 40);
    if (v29 >= 0)
      v30 = *(_DWORD *)(a1 + 40);
    else
      v30 = v29 + 1;
    sub_1D4C7DE28(a2, v29 - (v30 >> 1), *(_DWORD *)(a1 + 44), a1, v36);
    v24 = (_QWORD *)(a2 + 16);
    v25 = (_QWORD *)(a1 + 16);
    v26 = *(_DWORD *)(a1 + 40);
    v27 = *(_DWORD *)(a1 + 44);
    v28 = 0;
    goto LABEL_39;
  }
  if (objc_msgSend(v36, "isEqual:", CFSTR("ALGFP_ImageFilter_Vignette1")))
  {
    sub_1D4C7DE28(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
    v31 = (float **)(a2 + 16);
    v32 = (float **)(a1 + 16);
    v33 = *(_DWORD *)(a1 + 40);
    v34 = *(_DWORD *)(a1 + 44);
    v35 = 1.0;
  }
  else if (objc_msgSend(v36, "isEqual:", CFSTR("ALGFP_ImageFilter_Vignette2")))
  {
    sub_1D4C7DE28(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
    v31 = (float **)(a2 + 16);
    v32 = (float **)(a1 + 16);
    v33 = *(_DWORD *)(a1 + 40);
    v34 = *(_DWORD *)(a1 + 44);
    v35 = 2.0;
  }
  else
  {
    if (!objc_msgSend(v36, "isEqual:", CFSTR("ALGFP_ImageFilter_Vignette3")))
    {
      *a4 = 1;
      goto LABEL_25;
    }
    sub_1D4C7DE28(a2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), a1, v36);
    v31 = (float **)(a2 + 16);
    v32 = (float **)(a1 + 16);
    v33 = *(_DWORD *)(a1 + 40);
    v34 = *(_DWORD *)(a1 + 44);
    v35 = 3.0;
  }
  sub_1D4C7E224(v31, v32, v33, v34, v35);
LABEL_25:

}

void sub_1D4C7E758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void **sub_1D4C7E770(void *a1, CMTime *a2, uint64_t a3, int a4)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  void *v10;
  void **v11;
  opaqueCMSampleBuffer *v12;
  opaqueCMSampleBuffer *v13;
  CMTimeValue value;
  uint64_t timescale;
  CMTimeValue v16;
  uint64_t v17;
  const __CFArray *SampleAttachmentsArray;
  const __CFDictionary *ValueAtIndex;
  const __CFBoolean *v20;
  Float64 Seconds;
  CMTimeValue v22;
  uint64_t v23;
  Float64 v24;
  double v25;
  const char *v26;
  char *v27;
  char *v28;
  char *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  __int128 v39;
  __int128 v40;
  id v42;
  void *v43;
  void *key;
  void *v46;
  void *v47;
  id v48;
  CMTime v50;
  CMTime v51;
  CMTime time2;
  CMTime time1;
  CMTime v54;
  CMTime v55;
  CMTime time;
  BOOL v57;
  id v58;
  CMTime v59[2];
  uint64_t v60;
  int v61;
  uint64_t v62;
  int epoch_high;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = v5;
  v48 = v5;
  if (v5)
  {
    objc_msgSend(v5, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v46 = v7;
    if (v7 && objc_msgSend(v7, "count"))
    {
      objc_msgSend(v8, "objectAtIndex:", 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
      {
        if (v43)
          objc_msgSend(v43, "timeRange");
        else
          memset(v59, 0, sizeof(v59));
        *a2 = v59[1];
      }
      objc_msgSend(MEMORY[0x1E0C8AFF8], "assetReaderSampleReferenceOutputWithTrack:", v43);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0;
      objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", v6, &v58);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v58;
      objc_msgSend(v10, "addOutput:", v47);
      objc_msgSend(v10, "startReading");
      v9 = (void **)operator new();
      v9[2] = 0;
      v11 = (void **)MEMORY[0x1E0CA25E0];
      *v9 = 0;
      v9[1] = 0;
      key = *v11;
      while (1)
      {
        v12 = (opaqueCMSampleBuffer *)objc_msgSend(v47, "copyNextSampleBuffer");
        v13 = v12;
        if (!v12)
          break;
        CMSampleBufferGetOutputPresentationTimeStamp(v59, v12);
        value = v59[0].value;
        timescale = v59[0].timescale;
        v62 = *(_QWORD *)&v59[0].flags;
        epoch_high = HIDWORD(v59[0].epoch);
        CMSampleBufferGetOutputDuration(v59, v13);
        v16 = v59[0].value;
        v17 = v59[0].timescale;
        v60 = *(_QWORD *)&v59[0].flags;
        v61 = HIDWORD(v59[0].epoch);
        SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(v13, 0);
        v57 = 1;
        if (SampleAttachmentsArray)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
          if (ValueAtIndex)
          {
            v20 = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, key);
            if (v20)
              v57 = CFBooleanGetValue(v20) != 0;
          }
        }
        memset(v59, 0, 24);
        CMSampleBufferGetOutputDecodeTimeStamp(v59, v13);
        if (a4)
        {
          time.value = value;
          time.timescale = timescale;
          *(_QWORD *)&time.flags = v62;
          HIDWORD(time.epoch) = epoch_high;
          Seconds = CMTimeGetSeconds(&time);
          v22 = v59[0].value;
          v23 = v59[0].timescale;
          v55 = v59[0];
          v24 = CMTimeGetSeconds(&v55);
          v54.value = v16;
          v54.timescale = v17;
          *(_QWORD *)&v54.flags = v60;
          HIDWORD(v54.epoch) = v61;
          v25 = CMTimeGetSeconds(&v54);
          v26 = "true";
          if (!v57)
            v26 = "false";
          NSLog(CFSTR("presentation = {%lld/%d = %f}, decode = {%lld/%d = %f}, duration = {%lld/%d = %f}, Earlier Display Times Allowed = %s"), value, timescale, *(_QWORD *)&Seconds, v22, v23, *(_QWORD *)&v24, v16, v17, *(_QWORD *)&v25, v26);
        }
        if ((v59[0].flags & 0x1D) == 1)
        {
          time1.value = v16;
          time1.timescale = v17;
          *(_QWORD *)&time1.flags = v60;
          HIDWORD(time1.epoch) = v61;
          time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          if (CMTimeCompare(&time1, &time2) >= 1)
          {
            v51.value = value;
            v51.timescale = timescale;
            *(_QWORD *)&v51.flags = v62;
            HIDWORD(v51.epoch) = epoch_high;
            v50 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
            if ((CMTimeCompare(&v51, &v50) & 0x80000000) == 0)
            {
              v27 = (char *)v9[1];
              v28 = (char *)v9[2];
              if (v27 >= v28)
              {
                v30 = 0xAAAAAAAAAAAAAAABLL * ((v27 - (_BYTE *)*v9) >> 4);
                v31 = v30 + 1;
                if (v30 + 1 > 0x555555555555555)
                  sub_1D4C590D0();
                v32 = 0xAAAAAAAAAAAAAAABLL * ((v28 - (_BYTE *)*v9) >> 4);
                if (2 * v32 > v31)
                  v31 = 2 * v32;
                if (v32 >= 0x2AAAAAAAAAAAAAALL)
                  v33 = 0x555555555555555;
                else
                  v33 = v31;
                if (v33)
                  v34 = (char *)sub_1D4C5B64C((uint64_t)(v9 + 2), v33);
                else
                  v34 = 0;
                v35 = &v34[48 * v30];
                *(_QWORD *)v35 = value;
                *((_DWORD *)v35 + 2) = timescale;
                *((_DWORD *)v35 + 5) = epoch_high;
                *(_QWORD *)(v35 + 12) = v62;
                *((_QWORD *)v35 + 3) = v16;
                *((_DWORD *)v35 + 8) = v17;
                *(_QWORD *)(v35 + 36) = v60;
                *((_DWORD *)v35 + 11) = v61;
                v37 = (char *)*v9;
                v36 = (char *)v9[1];
                v38 = v35;
                if (v36 != *v9)
                {
                  do
                  {
                    v39 = *((_OWORD *)v36 - 3);
                    v40 = *((_OWORD *)v36 - 1);
                    *((_OWORD *)v38 - 2) = *((_OWORD *)v36 - 2);
                    *((_OWORD *)v38 - 1) = v40;
                    *((_OWORD *)v38 - 3) = v39;
                    v38 -= 48;
                    v36 -= 48;
                  }
                  while (v36 != v37);
                  v36 = v37;
                }
                v29 = v35 + 48;
                *v9 = v38;
                v9[1] = v35 + 48;
                v9[2] = &v34[48 * v33];
                if (v36)
                  operator delete(v36);
              }
              else
              {
                *(_QWORD *)v27 = value;
                *((_DWORD *)v27 + 2) = timescale;
                *(_QWORD *)(v27 + 12) = v62;
                *((_DWORD *)v27 + 5) = epoch_high;
                *((_QWORD *)v27 + 3) = v16;
                *((_DWORD *)v27 + 8) = v17;
                *(_QWORD *)(v27 + 36) = v60;
                v29 = v27 + 48;
                *((_DWORD *)v27 + 11) = v61;
              }
              v9[1] = v29;
              if (a3)
                sub_1D4C7ED98(a3, &v57);
            }
          }
        }
        CFRelease(v13);
        v6 = v48;
        v8 = v46;
      }

    }
    else
    {
      NSLog(CFSTR("No video asset tracks.\n"));
      v9 = 0;
    }

  }
  else
  {
    NSLog(CFSTR("Could not create AVAsset.\n"));
    v9 = 0;
  }

  return v9;
}

void sub_1D4C7ED04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,void *a31)
{

  _Unwind_Resume(a1);
}

void sub_1D4C7ED98(uint64_t a1, _BYTE *a2)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  if (v4 == v5 << 6)
  {
    if ((uint64_t)(v4 + 1) < 0)
      sub_1D4C590D0();
    v6 = v5 << 7;
    if (v6 <= (v4 & 0xFFFFFFFFFFFFFFC0) + 64)
      v6 = (v4 & 0xFFFFFFFFFFFFFFC0) + 64;
    if (v4 <= 0x3FFFFFFFFFFFFFFELL)
      v7 = v6;
    else
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    sub_1D4C7F0C4((char **)a1, v7);
    v4 = *(_QWORD *)(a1 + 8);
  }
  *(_QWORD *)(a1 + 8) = v4 + 1;
  v8 = *(char **)a1;
  v9 = v4 >> 6;
  v10 = 1 << v4;
  if (*a2)
    v11 = *(_QWORD *)&v8[8 * v9] | v10;
  else
    v11 = *(_QWORD *)&v8[8 * v9] & ~v10;
  *(_QWORD *)&v8[8 * v9] = v11;
}

CMTime **sub_1D4C7EE3C(void *a1, CMTime *a2)
{
  id v3;
  void **v4;
  void **v5;
  void *v6;
  CMTime **v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  CMTime *v13;
  __int128 v14;
  CMTime *v15;
  unint64_t v16;
  uint64_t v17;
  void *__p[3];

  v3 = a1;
  memset(__p, 0, sizeof(__p));
  v4 = sub_1D4C7E770(v3, a2, (uint64_t)__p, 0);
  v5 = v4;
  if (!v4)
  {
    v7 = 0;
    goto LABEL_15;
  }
  v6 = v4[1];
  if (v6 != *v5)
  {
    v7 = (CMTime **)operator new();
    sub_1D4C64A5C(v7, 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)v5[1] - (_BYTE *)*v5) >> 4));
    v8 = (char *)*v5;
    if (v5[1] != *v5)
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      do
      {
        v12 = &v8[v10];
        v13 = &(*v7)[v9];
        v14 = *(_OWORD *)v12;
        v13->epoch = *((_QWORD *)v12 + 2);
        *(_OWORD *)&v13->value = v14;
        ++v11;
        v8 = (char *)*v5;
        v10 += 48;
        ++v9;
      }
      while (v11 < 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)v5[1] - (_BYTE *)*v5) >> 4));
    }
    v15 = v7[1];
    v16 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v15 - (char *)*v7) >> 3));
    if (v15 == *v7)
      v17 = 0;
    else
      v17 = v16;
    sub_1D4C7F3C0(*v7, v15, v17, 1);
    v6 = *v5;
    if (!*v5)
      goto LABEL_14;
    v5[1] = v6;
    goto LABEL_13;
  }
  v7 = 0;
  if (v6)
LABEL_13:
    operator delete(v6);
LABEL_14:
  MEMORY[0x1D82660DC](v5, 0x20C40960023A9);
LABEL_15:
  if (__p[0])
    operator delete(__p[0]);

  return v7;
}

void sub_1D4C7EFB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p)
{
  void *v10;
  uint64_t v11;

  MEMORY[0x1D82660DC](v11, 0x20C40960023A9);
  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C7EFF8(uint64_t a1, uint64_t a2, uint64_t a3, CMTime *a4)
{
  _QWORD *v5;
  CMTime v7;
  __int128 v8;
  uint64_t v9;

  v8 = *(_OWORD *)a3;
  v9 = *(_QWORD *)(a3 + 16);
  v7 = *a4;
  v5 = (_QWORD *)sub_1D4C8A454(a1, a2, &v8, &v7);
  *v5 = &unk_1E9863C48;
  sub_1D4C8B2D0((uint64_t)v5);
  return a1;
}

void sub_1D4C7F060(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_1D4C7F074(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C7F074(_QWORD *a1)
{
  void *v2;
  void *v3;

  *a1 = off_1E9863B58;
  v2 = (void *)a1[4];
  if (v2)
  {
    a1[5] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[1];
  if (v3)
  {
    a1[2] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_1D4C7F0C4(char **a1, unint64_t a2)
{
  unint64_t v3;
  char *v4;
  __int128 v5;
  char *v6;
  int v7;
  char *v8;
  int v9;
  char *v10;
  __int128 v11;

  if (a2 > (_QWORD)a1[2] << 6)
  {
    if ((a2 & 0x8000000000000000) != 0)
      sub_1D4C590D0();
    v10 = 0;
    v11 = 0uLL;
    sub_1D4C7F180(&v10, a2);
    v3 = (unint64_t)a1[1];
    v8 = *a1;
    v9 = 0;
    v6 = &v8[8 * (v3 >> 6)];
    v7 = v3 & 0x3F;
    sub_1D4C7F1C4(&v10, (uint64_t)&v8, (uint64_t)&v6, v3);
    v4 = *a1;
    *a1 = v10;
    v10 = v4;
    v5 = *(_OWORD *)(a1 + 1);
    *(_OWORD *)(a1 + 1) = v11;
    v11 = v5;
    if (v4)
      operator delete(v4);
  }
}

void sub_1D4C7F168(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void *sub_1D4C7F180(_QWORD *a1, uint64_t a2)
{
  void *result;
  uint64_t v4;

  if (a2 < 0)
    sub_1D4C590D0();
  result = sub_1D4C60BD8((uint64_t)(a1 + 2), ((unint64_t)(a2 - 1) >> 6) + 1);
  *a1 = result;
  a1[1] = 0;
  a1[2] = v4;
  return result;
}

void sub_1D4C7F1C4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;

  v4 = a1[1];
  v5 = v4 + a4;
  a1[1] = v4 + a4;
  if (!v4 || ((v5 - 1) ^ (v4 - 1)) >= 0x40)
  {
    if (v5 >= 0x41)
      v6 = (v5 - 1) >> 6;
    else
      v6 = 0;
    *(_QWORD *)(*a1 + 8 * v6) = 0;
  }
  v7 = *(_DWORD *)(a2 + 8);
  v8 = *(_QWORD *)a3;
  v9 = *(_DWORD *)(a3 + 8);
  v10 = *a1 + 8 * (v4 >> 6);
  v16 = *(_QWORD *)a2;
  v17 = v7;
  v14 = v8;
  v15 = v9;
  v12 = v10;
  v13 = v4 & 0x3F;
  sub_1D4C7F264(&v16, &v14, &v12, (uint64_t)&v11);
}

void sub_1D4C7F264(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;

  v5 = *((_DWORD *)a1 + 2);
  v6 = *a2;
  v7 = *((_DWORD *)a2 + 2);
  v16 = *a1;
  v17 = v5;
  v14 = v6;
  v15 = v7;
  v8 = *((_DWORD *)a3 + 2);
  v12 = *a3;
  v13 = v8;
  sub_1D4C7F2F0((uint64_t)&v16, (uint64_t)&v14, (uint64_t)&v12, (uint64_t)&v18);
  v9 = v19;
  v10 = v20;
  v11 = v21;
  *(_QWORD *)a4 = v18;
  *(_DWORD *)(a4 + 8) = v9;
  *(_QWORD *)(a4 + 16) = v10;
  *(_DWORD *)(a4 + 24) = v11;
}

void sub_1D4C7F2F0(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  _QWORD *v4;
  int v5;
  int i;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;

  v4 = *(_QWORD **)a1;
  v5 = *(_DWORD *)(a1 + 8);
  for (i = *(_DWORD *)(a3 + 8); *(_QWORD *)a1 != *(_QWORD *)a2 || v5 != *(_DWORD *)(a2 + 8); v5 = *(_DWORD *)(a1 + 8))
  {
    v8 = *(uint64_t **)a3;
    v9 = 1 << i;
    if (((*v4 >> v5) & 1) != 0)
      v10 = *v8 | v9;
    else
      v10 = *v8 & ~v9;
    *v8 = v10;
    if (v5 == 63)
    {
      v11 = 0;
      *(_QWORD *)a1 = v4 + 1;
    }
    else
    {
      v11 = v5 + 1;
    }
    *(_DWORD *)(a1 + 8) = v11;
    v12 = *(_DWORD *)(a3 + 8);
    if (v12 == 63)
    {
      i = 0;
      *(_QWORD *)a3 += 8;
    }
    else
    {
      i = v12 + 1;
    }
    *(_DWORD *)(a3 + 8) = i;
    v4 = *(_QWORD **)a1;
  }
  *(_QWORD *)a4 = v4;
  *(_DWORD *)(a4 + 8) = v5;
  *(_QWORD *)(a4 + 16) = *(_QWORD *)a3;
  *(_DWORD *)(a4 + 24) = i;
}

void sub_1D4C7F3C0(CMTime *a1, CMTime *a2, uint64_t a3, char a4)
{
  CMTime *v7;
  CMTime *v8;
  CMTime *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  CMTime *v13;
  uint64_t v14;
  __int128 v15;
  CMTimeEpoch v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  CMTime *v20;
  CMTime *v21;
  CMTime *v22;
  __int128 v23;
  int32_t v24;
  CMTime *v25;
  __int128 v26;
  int32_t v27;
  CMTime *v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CMTimeEpoch v34;
  __int128 v35;
  CMTimeEpoch v36;
  CMTime *v37;
  __int128 v38;
  BOOL v39;
  BOOL v40;
  __int128 v41;
  __int128 v42;
  CMTime *v43;
  __int128 v44;
  int32_t v45;
  CMTime *v46;
  __int128 v47;
  int32_t v48;
  CMTime *v49;
  CMTime *v50;
  __int128 v51;
  int32_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  CMTimeEpoch v57;
  __int128 v58;
  CMTimeEpoch v59;
  CMTime *v60;
  __int128 v61;
  CMTimeEpoch epoch;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  CMTime *v66;
  BOOL v67;
  char v68;
  uint64_t v69;
  CMTime *v70;
  __int128 v71;
  CMTimeEpoch v72;
  __int128 v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  int64_t v77;
  int64_t v78;
  int64_t v79;
  uint64_t v80;
  CMTime *v81;
  __int128 v82;
  __int128 v83;
  CMTime *v84;
  __int128 v85;
  __int128 v86;
  CMTime *v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  int64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  CMTime *v101;
  __int128 v102;
  uint64_t v103;
  unint64_t v104;
  CMTime *v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v112;
  CMTimeEpoch v113;
  __int128 v114;
  CMTime *v115;
  CMTime *v116;
  int32_t v117;
  CMTime v119;
  CMTimeEpoch v120;
  CMTime v121;
  CMTime v122;
  __int128 v123;
  CMTime v124;
  CMTimeEpoch v125;
  CMTime v126;
  CMTime v127;
  CMTime v128;
  CMTime v129;
  CMTime v130;
  CMTime v131;
  CMTime v132;
  CMTimeEpoch v133;
  CMTime time2;
  CMTime time1;

LABEL_1:
  v7 = a2;
  v8 = a2 - 1;
  v9 = a1;
  while (2)
  {
    a1 = v9;
    v10 = (char *)v7 - (char *)v9;
    v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (char *)v9) >> 3);
    switch(v11)
    {
      case 0:
      case 1:
        return;
      case 2:
        epoch = a2[-1].epoch;
        v121.epoch = a1->epoch;
        *(_OWORD *)&v121.value = *(_OWORD *)&a1->value;
        *(_OWORD *)&time1.value = *(_OWORD *)&a2[-1].value;
        time1.epoch = epoch;
        time2 = v121;
        if (CMTimeCompare(&time1, &time2) < 0)
        {
          v63 = *(_OWORD *)&a1->value;
          time1.epoch = a1->epoch;
          *(_OWORD *)&time1.value = v63;
          v64 = *(_OWORD *)&v8->value;
          a1->epoch = a2[-1].epoch;
          *(_OWORD *)&a1->value = v64;
          v65 = *(_OWORD *)&time1.value;
          a2[-1].epoch = time1.epoch;
          *(_OWORD *)&v8->value = v65;
        }
        return;
      case 3:
        sub_1D4C800F0(a1, a1 + 1, v8);
        return;
      case 4:
        sub_1D4C804F0(a1, a1 + 1, a1 + 2, v8);
        return;
      case 5:
        sub_1D4C7FF68(a1, a1 + 1, a1 + 2, a1 + 3, v8);
        return;
      default:
        if (v10 <= 575)
        {
          v66 = a1 + 1;
          v67 = a1 == v7 || v66 == v7;
          v68 = v67;
          if ((a4 & 1) != 0)
          {
            if ((v68 & 1) == 0)
            {
              v69 = 0;
              v70 = a1;
              do
              {
                v71 = *(_OWORD *)&v70->value;
                v72 = v70->epoch;
                v70 = v66;
                v73 = *(_OWORD *)&v66->value;
                time1.epoch = v66->epoch;
                *(_OWORD *)&time1.value = v73;
                *(_OWORD *)&time2.value = v71;
                time2.epoch = v72;
                if (CMTimeCompare(&time1, &time2) < 0)
                {
                  v126.epoch = v70->epoch;
                  *(_OWORD *)&v126.value = *(_OWORD *)&v70->value;
                  v74 = v69;
                  while (1)
                  {
                    v75 = (char *)a1 + v74;
                    *(_OWORD *)(v75 + 24) = *(_OWORD *)((char *)&a1->value + v74);
                    *((_QWORD *)v75 + 5) = *(CMTimeEpoch *)((char *)&a1->epoch + v74);
                    if (!v74)
                      break;
                    v122.epoch = *((_QWORD *)v75 - 1);
                    *(_OWORD *)&v122.value = *(_OWORD *)(v75 - 24);
                    time1 = v126;
                    time2 = v122;
                    v74 -= 24;
                    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
                    {
                      v76 = (uint64_t)&a1[1] + v74;
                      goto LABEL_76;
                    }
                  }
                  v76 = (uint64_t)a1;
LABEL_76:
                  *(_QWORD *)(v76 + 16) = v126.epoch;
                  *(_OWORD *)v76 = *(_OWORD *)&v126.value;
                }
                v66 = v70 + 1;
                v69 += 24;
              }
              while (&v70[1] != v7);
            }
          }
          else if ((v68 & 1) == 0)
          {
            do
            {
              v112 = *(_OWORD *)&a1->value;
              v113 = a1->epoch;
              a1 = v66;
              v114 = *(_OWORD *)&v66->value;
              time1.epoch = v66->epoch;
              *(_OWORD *)&time1.value = v114;
              *(_OWORD *)&time2.value = v112;
              time2.epoch = v113;
              if (CMTimeCompare(&time1, &time2) < 0)
              {
                v128.epoch = a1->epoch;
                *(_OWORD *)&v128.value = *(_OWORD *)&a1->value;
                v115 = a1;
                do
                {
                  v116 = v115 - 1;
                  v115->epoch = v115[-1].epoch;
                  *(_OWORD *)&v115->value = *(_OWORD *)&v115[-1].value;
                  v124.epoch = v115[-2].epoch;
                  *(_OWORD *)&v124.value = *(_OWORD *)&v115[-2].value;
                  time1 = v128;
                  time2 = v124;
                  v117 = CMTimeCompare(&time1, &time2);
                  v115 = v116;
                }
                while (v117 < 0);
                v116->epoch = v128.epoch;
                *(_OWORD *)&v116->value = *(_OWORD *)&v128.value;
              }
              v66 = a1 + 1;
            }
            while (&a1[1] != v7);
          }
          return;
        }
        if (!a3)
        {
          if (a1 != v7)
          {
            v77 = (unint64_t)(v11 - 2) >> 1;
            v78 = v77;
            do
            {
              v79 = v78;
              if (v77 >= v78)
              {
                v80 = (2 * v78) | 1;
                v81 = &a1[v80];
                if (2 * v78 + 2 < v11)
                {
                  v82 = *(_OWORD *)&v81->value;
                  time1.epoch = v81->epoch;
                  *(_OWORD *)&time1.value = v82;
                  v83 = *(_OWORD *)&v81[1].value;
                  time2.epoch = v81[1].epoch;
                  *(_OWORD *)&time2.value = v83;
                  if (CMTimeCompare(&time1, &time2) < 0)
                  {
                    ++v81;
                    v80 = 2 * v79 + 2;
                  }
                }
                v84 = &a1[v79];
                v85 = *(_OWORD *)&v81->value;
                time1.epoch = v81->epoch;
                *(_OWORD *)&time1.value = v85;
                v86 = *(_OWORD *)&v84->value;
                time2.epoch = v84->epoch;
                *(_OWORD *)&time2.value = v86;
                if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
                {
                  v131.epoch = v84->epoch;
                  *(_OWORD *)&v131.value = *(_OWORD *)&v84->value;
                  do
                  {
                    v87 = v81;
                    v88 = *(_OWORD *)&v81->value;
                    v84->epoch = v81->epoch;
                    *(_OWORD *)&v84->value = v88;
                    if (v77 < v80)
                      break;
                    v89 = (2 * v80) | 1;
                    v81 = &a1[v89];
                    v90 = 2 * v80 + 2;
                    if (v90 < v11)
                    {
                      v91 = *(_OWORD *)&v81->value;
                      time1.epoch = v81->epoch;
                      *(_OWORD *)&time1.value = v91;
                      v92 = *(_OWORD *)&v81[1].value;
                      time2.epoch = v81[1].epoch;
                      *(_OWORD *)&time2.value = v92;
                      if (CMTimeCompare(&time1, &time2) < 0)
                      {
                        ++v81;
                        v89 = v90;
                      }
                    }
                    v93 = *(_OWORD *)&v81->value;
                    time1.epoch = v81->epoch;
                    *(_OWORD *)&time1.value = v93;
                    time2 = v131;
                    v84 = v87;
                    v80 = v89;
                  }
                  while ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0);
                  v87->epoch = v131.epoch;
                  *(_OWORD *)&v87->value = *(_OWORD *)&v131.value;
                }
              }
              v78 = v79 - 1;
            }
            while (v79);
            v94 = v10 / 0x18uLL;
            do
            {
              v95 = 0;
              v125 = a1->epoch;
              v123 = *(_OWORD *)&a1->value;
              v96 = (uint64_t)a1;
              do
              {
                v97 = v96 + 24 * v95 + 24;
                v98 = (2 * v95) | 1;
                v99 = 2 * v95 + 2;
                if (v99 < v94)
                {
                  v133 = *(_QWORD *)(v96 + 24 * v95 + 40);
                  v127.epoch = *(_QWORD *)(v96 + 24 * v95 + 64);
                  *(_OWORD *)&v127.value = *(_OWORD *)(v96 + 24 * v95 + 48);
                  *(_OWORD *)&time1.value = *(_OWORD *)v97;
                  time1.epoch = v133;
                  time2 = v127;
                  if (CMTimeCompare(&time1, &time2) < 0)
                  {
                    v97 += 24;
                    v98 = v99;
                  }
                }
                v100 = *(_OWORD *)v97;
                *(_QWORD *)(v96 + 16) = *(_QWORD *)(v97 + 16);
                *(_OWORD *)v96 = v100;
                v96 = v97;
                v95 = v98;
              }
              while (v98 <= (uint64_t)((unint64_t)(v94 - 2) >> 1));
              v101 = a2 - 1;
              v67 = v97 == (_QWORD)--a2;
              if (v67)
              {
                *(_QWORD *)(v97 + 16) = v125;
                *(_OWORD *)v97 = v123;
              }
              else
              {
                v102 = *(_OWORD *)&v101->value;
                *(_QWORD *)(v97 + 16) = v101->epoch;
                *(_OWORD *)v97 = v102;
                v101->epoch = v125;
                *(_OWORD *)&v101->value = v123;
                v103 = v97 - (_QWORD)a1 + 24;
                if (v103 >= 25)
                {
                  v104 = (v103 / 0x18uLL - 2) >> 1;
                  v105 = &a1[v104];
                  v106 = *(_OWORD *)&v105->value;
                  time1.epoch = v105->epoch;
                  *(_OWORD *)&time1.value = v106;
                  v107 = *(_OWORD *)v97;
                  time2.epoch = *(_QWORD *)(v97 + 16);
                  *(_OWORD *)&time2.value = v107;
                  if (CMTimeCompare(&time1, &time2) < 0)
                  {
                    v132.epoch = *(_QWORD *)(v97 + 16);
                    *(_OWORD *)&v132.value = *(_OWORD *)v97;
                    do
                    {
                      v108 = (uint64_t)v105;
                      v109 = *(_OWORD *)&v105->value;
                      *(_QWORD *)(v97 + 16) = v105->epoch;
                      *(_OWORD *)v97 = v109;
                      if (!v104)
                        break;
                      v104 = (v104 - 1) >> 1;
                      v105 = &a1[v104];
                      v110 = *(_OWORD *)&v105->value;
                      time1.epoch = v105->epoch;
                      *(_OWORD *)&time1.value = v110;
                      time2 = v132;
                      v97 = v108;
                    }
                    while (CMTimeCompare(&time1, &time2) < 0);
                    *(_QWORD *)(v108 + 16) = v132.epoch;
                    *(_OWORD *)v108 = *(_OWORD *)&v132.value;
                  }
                }
              }
            }
            while (v94-- > 2);
          }
          return;
        }
        v12 = (unint64_t)v11 >> 1;
        v13 = &a1[(unint64_t)v11 >> 1];
        if ((unint64_t)v10 < 0xC01)
        {
          sub_1D4C800F0(v13, a1, v8);
        }
        else
        {
          sub_1D4C800F0(a1, v13, v8);
          v14 = v12;
          sub_1D4C800F0(a1 + 1, &a1[v14 - 1], a2 - 2);
          sub_1D4C800F0(a1 + 2, &a1[v14 + 1], a2 - 3);
          sub_1D4C800F0(&a1[v14 - 1], v13, &a1[v14 + 1]);
          v15 = *(_OWORD *)&a1->value;
          time1.epoch = a1->epoch;
          *(_OWORD *)&time1.value = v15;
          v16 = v13->epoch;
          *(_OWORD *)&a1->value = *(_OWORD *)&v13->value;
          a1->epoch = v16;
          v17 = *(_OWORD *)&time1.value;
          v13->epoch = time1.epoch;
          *(_OWORD *)&v13->value = v17;
        }
        --a3;
        if ((a4 & 1) == 0)
        {
          v120 = a1[-1].epoch;
          v119.epoch = a1->epoch;
          *(_OWORD *)&v119.value = *(_OWORD *)&a1->value;
          *(_OWORD *)&time1.value = *(_OWORD *)&a1[-1].value;
          time1.epoch = v120;
          time2 = v119;
          if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
          {
            v130.epoch = a1->epoch;
            *(_OWORD *)&v130.value = *(_OWORD *)&a1->value;
            v41 = *(_OWORD *)&a1->value;
            time1.epoch = v130.epoch;
            *(_OWORD *)&time1.value = v41;
            v42 = *(_OWORD *)&v8->value;
            time2.epoch = a2[-1].epoch;
            *(_OWORD *)&time2.value = v42;
            if (CMTimeCompare(&time1, &time2) < 0)
            {
              v46 = a1;
              do
              {
                v9 = v46 + 1;
                time1 = v130;
                v47 = *(_OWORD *)&v46[1].value;
                time2.epoch = v46[1].epoch;
                *(_OWORD *)&time2.value = v47;
                v48 = CMTimeCompare(&time1, &time2);
                v46 = v9;
              }
              while ((v48 & 0x80000000) == 0);
            }
            else
            {
              v43 = a1 + 1;
              do
              {
                v9 = v43;
                if (v43 >= v7)
                  break;
                time1 = v130;
                v44 = *(_OWORD *)&v43->value;
                time2.epoch = v43->epoch;
                *(_OWORD *)&time2.value = v44;
                v45 = CMTimeCompare(&time1, &time2);
                v43 = v9 + 1;
              }
              while ((v45 & 0x80000000) == 0);
            }
            v49 = v7;
            if (v9 < v7)
            {
              v50 = v7;
              do
              {
                v49 = v50 - 1;
                time1 = v130;
                v51 = *(_OWORD *)&v50[-1].value;
                time2.epoch = v50[-1].epoch;
                *(_OWORD *)&time2.value = v51;
                v52 = CMTimeCompare(&time1, &time2);
                v50 = v49;
              }
              while (v52 < 0);
            }
            while (v9 < v49)
            {
              v53 = *(_OWORD *)&v9->value;
              time1.epoch = v9->epoch;
              *(_OWORD *)&time1.value = v53;
              v54 = *(_OWORD *)&v49->value;
              v9->epoch = v49->epoch;
              *(_OWORD *)&v9->value = v54;
              v55 = *(_OWORD *)&time1.value;
              v49->epoch = time1.epoch;
              *(_OWORD *)&v49->value = v55;
              do
              {
                time1 = v130;
                v56 = *(_OWORD *)&v9[1].value;
                v57 = v9[1].epoch;
                ++v9;
                time2.epoch = v57;
                *(_OWORD *)&time2.value = v56;
              }
              while ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0);
              do
              {
                v58 = *(_OWORD *)&v49[-1].value;
                v59 = v49[-1].epoch;
                --v49;
                time1 = v130;
                *(_OWORD *)&time2.value = v58;
                time2.epoch = v59;
              }
              while (CMTimeCompare(&time1, &time2) < 0);
            }
            v60 = v9 - 1;
            if (&v9[-1] != a1)
            {
              v61 = *(_OWORD *)&v60->value;
              a1->epoch = v9[-1].epoch;
              *(_OWORD *)&a1->value = v61;
            }
            a4 = 0;
            v9[-1].epoch = v130.epoch;
            *(_OWORD *)&v60->value = *(_OWORD *)&v130.value;
            continue;
          }
        }
        v18 = 0;
        v129.epoch = a1->epoch;
        *(_OWORD *)&v129.value = *(_OWORD *)&a1->value;
        do
        {
          v19 = *(_OWORD *)&a1[v18 + 1].value;
          time1.epoch = a1[v18 + 1].epoch;
          *(_OWORD *)&time1.value = v19;
          time2 = v129;
          ++v18;
        }
        while (CMTimeCompare(&time1, &time2) < 0);
        v20 = &a1[v18];
        v21 = v7;
        if (v18 == 1)
        {
          v25 = a2;
          while (v20 < v25)
          {
            v22 = v25 - 1;
            v26 = *(_OWORD *)&v25[-1].value;
            time1.epoch = v25[-1].epoch;
            *(_OWORD *)&time1.value = v26;
            time2 = v129;
            v27 = CMTimeCompare(&time1, &time2);
            v25 = v22;
            if (v27 < 0)
              goto LABEL_20;
          }
          v22 = v25;
        }
        else
        {
          do
          {
            v22 = v21 - 1;
            v23 = *(_OWORD *)&v21[-1].value;
            time1.epoch = v21[-1].epoch;
            *(_OWORD *)&time1.value = v23;
            time2 = v129;
            v24 = CMTimeCompare(&time1, &time2);
            v21 = v22;
          }
          while ((v24 & 0x80000000) == 0);
        }
LABEL_20:
        if (v20 >= v22)
        {
          v37 = v20 - 1;
        }
        else
        {
          v28 = &a1[v18];
          v29 = (unint64_t)v22;
          do
          {
            v30 = *(_OWORD *)&v28->value;
            time1.epoch = v28->epoch;
            *(_OWORD *)&time1.value = v30;
            v31 = *(_OWORD *)v29;
            v28->epoch = *(_QWORD *)(v29 + 16);
            *(_OWORD *)&v28->value = v31;
            v32 = *(_OWORD *)&time1.value;
            *(_QWORD *)(v29 + 16) = time1.epoch;
            *(_OWORD *)v29 = v32;
            do
            {
              v33 = *(_OWORD *)&v28[1].value;
              v34 = v28[1].epoch;
              ++v28;
              time1.epoch = v34;
              *(_OWORD *)&time1.value = v33;
              time2 = v129;
            }
            while (CMTimeCompare(&time1, &time2) < 0);
            do
            {
              v35 = *(_OWORD *)(v29 - 24);
              v36 = *(_QWORD *)(v29 - 8);
              v29 -= 24;
              time2 = v129;
              *(_OWORD *)&time1.value = v35;
              time1.epoch = v36;
            }
            while ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0);
          }
          while ((unint64_t)v28 < v29);
          v37 = v28 - 1;
        }
        if (v37 != a1)
        {
          v38 = *(_OWORD *)&v37->value;
          a1->epoch = v37->epoch;
          *(_OWORD *)&a1->value = v38;
        }
        v37->epoch = v129.epoch;
        *(_OWORD *)&v37->value = *(_OWORD *)&v129.value;
        v39 = v20 >= v22;
        v7 = a2;
        if (!v39)
        {
LABEL_34:
          sub_1D4C7F3C0(a1, v37, a3, a4 & 1);
          a4 = 0;
          v9 = v37 + 1;
          continue;
        }
        v40 = sub_1D4C802B4(a1, v37);
        v9 = v37 + 1;
        if (!sub_1D4C802B4(v37 + 1, a2))
        {
          if (v40)
            continue;
          goto LABEL_34;
        }
        a2 = v37;
        if (!v40)
          goto LABEL_1;
        return;
    }
  }
}

  buffer = 0;
  v4 = 1;
  p_buffer = &buffer;
  do
  {
    v6 = CFReadStreamRead(*(CFReadStreamRef *)a1, p_buffer, v4);
    if (v6 < 0)
    {
      v10 = 3;
LABEL_13:
      v11 = (FILE *)*MEMORY[0x1E0C80C10];
      v12 = "GIFParser::appendSubBlocks: error reading subblock length\n";
      v13 = 58;
LABEL_17:
      fwrite(v12, v13, 1uLL, v11);
      return v10;
    }
    if (!v6)
    {
      v10 = 1;
      goto LABEL_13;
    }
    p_buffer += v6;
    v4 -= v6;
  }
  while (v4);
  CFDataAppendBytes(a2, &buffer, 1);
  v7 = buffer;
  if (buffer)
  {
    v8 = *(UInt8 **)(a1 + 40);
    while (1)
    {
      v9 = CFReadStreamRead(*(CFReadStreamRef *)a1, v8, v7);
      if (v9 < 0)
      {
        v10 = 3;
        goto LABEL_16;
      }
      if (!v9)
        break;
      v8 += v9;
      v7 -= v9;
      if (!v7)
      {
        CFDataAppendBytes(a2, *(const UInt8 **)(a1 + 40), buffer);
        goto LABEL_1;
      }
    }
    v10 = 1;
LABEL_16:
    v11 = (FILE *)*MEMORY[0x1E0C80C10];
    v12 = "GIFParser::appendSubBlocks: error reading subblock data\n";
    v13 = 56;
    goto LABEL_17;
  }
  return 0;
}

  v7 = a2;
  v8 = a2 - 1;
  v9 = a1;
  while (2)
  {
    a1 = v9;
    v10 = (char *)v7 - (char *)v9;
    v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (char *)v9) >> 3);
    switch(v11)
    {
      case 0:
      case 1:
        return;
      case 2:
        epoch = a2[-1].epoch;
        v121.epoch = a1->epoch;
        *(_OWORD *)&v121.value = *(_OWORD *)&a1->value;
        *(_OWORD *)&time1.value = *(_OWORD *)&a2[-1].value;
        time1.epoch = epoch;
        time2 = v121;
        if (CMTimeCompare(&time1, &time2) < 0)
        {
          v63 = *(_OWORD *)&a1->value;
          time1.epoch = a1->epoch;
          *(_OWORD *)&time1.value = v63;
          v64 = *(_OWORD *)&v8->value;
          a1->epoch = a2[-1].epoch;
          *(_OWORD *)&a1->value = v64;
          v65 = *(_OWORD *)&time1.value;
          a2[-1].epoch = time1.epoch;
          *(_OWORD *)&v8->value = v65;
        }
        return;
      case 3:
        sub_1D4C800F0(a1, a1 + 1, v8);
        return;
      case 4:
        sub_1D4C804F0(a1, a1 + 1, a1 + 2, v8);
        return;
      case 5:
        sub_1D4C7FF68(a1, a1 + 1, a1 + 2, a1 + 3, v8);
        return;
      default:
        if (v10 <= 575)
        {
          v66 = a1 + 1;
          v67 = a1 == v7 || v66 == v7;
          v68 = v67;
          if ((a4 & 1) != 0)
          {
            if ((v68 & 1) == 0)
            {
              v69 = 0;
              v70 = a1;
              do
              {
                v71 = *(_OWORD *)&v70->value;
                v72 = v70->epoch;
                v70 = v66;
                v73 = *(_OWORD *)&v66->value;
                time1.epoch = v66->epoch;
                *(_OWORD *)&time1.value = v73;
                *(_OWORD *)&time2.value = v71;
                time2.epoch = v72;
                if (CMTimeCompare(&time1, &time2) < 0)
                {
                  v126.epoch = v70->epoch;
                  *(_OWORD *)&v126.value = *(_OWORD *)&v70->value;
                  v74 = v69;
                  while (1)
                  {
                    v75 = (char *)a1 + v74;
                    *(_OWORD *)(v75 + 24) = *(_OWORD *)((char *)&a1->value + v74);
                    *((_QWORD *)v75 + 5) = *(CMTimeEpoch *)((char *)&a1->epoch + v74);
                    if (!v74)
                      break;
                    v122.epoch = *((_QWORD *)v75 - 1);
                    *(_OWORD *)&v122.value = *(_OWORD *)(v75 - 24);
                    time1 = v126;
                    time2 = v122;
                    v74 -= 24;
                    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
                    {
                      v76 = (uint64_t)&a1[1] + v74;
                      goto LABEL_76;
                    }
                  }
                  v76 = (uint64_t)a1;
LABEL_76:
                  *(_QWORD *)(v76 + 16) = v126.epoch;
                  *(_OWORD *)v76 = *(_OWORD *)&v126.value;
                }
                v66 = v70 + 1;
                v69 += 24;
              }
              while (&v70[1] != v7);
            }
          }
          else if ((v68 & 1) == 0)
          {
            do
            {
              v112 = *(_OWORD *)&a1->value;
              v113 = a1->epoch;
              a1 = v66;
              v114 = *(_OWORD *)&v66->value;
              time1.epoch = v66->epoch;
              *(_OWORD *)&time1.value = v114;
              *(_OWORD *)&time2.value = v112;
              time2.epoch = v113;
              if (CMTimeCompare(&time1, &time2) < 0)
              {
                v128.epoch = a1->epoch;
                *(_OWORD *)&v128.value = *(_OWORD *)&a1->value;
                v115 = a1;
                do
                {
                  v116 = v115 - 1;
                  v115->epoch = v115[-1].epoch;
                  *(_OWORD *)&v115->value = *(_OWORD *)&v115[-1].value;
                  v124.epoch = v115[-2].epoch;
                  *(_OWORD *)&v124.value = *(_OWORD *)&v115[-2].value;
                  time1 = v128;
                  time2 = v124;
                  v117 = CMTimeCompare(&time1, &time2);
                  v115 = v116;
                }
                while (v117 < 0);
                v116->epoch = v128.epoch;
                *(_OWORD *)&v116->value = *(_OWORD *)&v128.value;
              }
              v66 = a1 + 1;
            }
            while (&a1[1] != v7);
          }
          return;
        }
        if (!a3)
        {
          if (a1 != v7)
          {
            v77 = (unint64_t)(v11 - 2) >> 1;
            v78 = v77;
            do
            {
              v79 = v78;
              if (v77 >= v78)
              {
                v80 = (2 * v78) | 1;
                v81 = &a1[v80];
                if (2 * v78 + 2 < v11)
                {
                  v82 = *(_OWORD *)&v81->value;
                  time1.epoch = v81->epoch;
                  *(_OWORD *)&time1.value = v82;
                  v83 = *(_OWORD *)&v81[1].value;
                  time2.epoch = v81[1].epoch;
                  *(_OWORD *)&time2.value = v83;
                  if (CMTimeCompare(&time1, &time2) < 0)
                  {
                    ++v81;
                    v80 = 2 * v79 + 2;
                  }
                }
                v84 = &a1[v79];
                v85 = *(_OWORD *)&v81->value;
                time1.epoch = v81->epoch;
                *(_OWORD *)&time1.value = v85;
                v86 = *(_OWORD *)&v84->value;
                time2.epoch = v84->epoch;
                *(_OWORD *)&time2.value = v86;
                if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
                {
                  v131.epoch = v84->epoch;
                  *(_OWORD *)&v131.value = *(_OWORD *)&v84->value;
                  do
                  {
                    v87 = v81;
                    v88 = *(_OWORD *)&v81->value;
                    v84->epoch = v81->epoch;
                    *(_OWORD *)&v84->value = v88;
                    if (v77 < v80)
                      break;
                    v89 = (2 * v80) | 1;
                    v81 = &a1[v89];
                    v90 = 2 * v80 + 2;
                    if (v90 < v11)
                    {
                      v91 = *(_OWORD *)&v81->value;
                      time1.epoch = v81->epoch;
                      *(_OWORD *)&time1.value = v91;
                      v92 = *(_OWORD *)&v81[1].value;
                      time2.epoch = v81[1].epoch;
                      *(_OWORD *)&time2.value = v92;
                      if (CMTimeCompare(&time1, &time2) < 0)
                      {
                        ++v81;
                        v89 = v90;
                      }
                    }
                    v93 = *(_OWORD *)&v81->value;
                    time1.epoch = v81->epoch;
                    *(_OWORD *)&time1.value = v93;
                    time2 = v131;
                    v84 = v87;
                    v80 = v89;
                  }
                  while ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0);
                  v87->epoch = v131.epoch;
                  *(_OWORD *)&v87->value = *(_OWORD *)&v131.value;
                }
              }
              v78 = v79 - 1;
            }
            while (v79);
            v94 = v10 / 0x18uLL;
            do
            {
              v95 = 0;
              v125 = a1->epoch;
              v123 = *(_OWORD *)&a1->value;
              v96 = (uint64_t)a1;
              do
              {
                v97 = v96 + 24 * v95 + 24;
                v98 = (2 * v95) | 1;
                v99 = 2 * v95 + 2;
                if (v99 < v94)
                {
                  v133 = *(_QWORD *)(v96 + 24 * v95 + 40);
                  v127.epoch = *(_QWORD *)(v96 + 24 * v95 + 64);
                  *(_OWORD *)&v127.value = *(_OWORD *)(v96 + 24 * v95 + 48);
                  *(_OWORD *)&time1.value = *(_OWORD *)v97;
                  time1.epoch = v133;
                  time2 = v127;
                  if (CMTimeCompare(&time1, &time2) < 0)
                  {
                    v97 += 24;
                    v98 = v99;
                  }
                }
                v100 = *(_OWORD *)v97;
                *(_QWORD *)(v96 + 16) = *(_QWORD *)(v97 + 16);
                *(_OWORD *)v96 = v100;
                v96 = v97;
                v95 = v98;
              }
              while (v98 <= (uint64_t)((unint64_t)(v94 - 2) >> 1));
              v101 = a2 - 1;
              v67 = v97 == (_QWORD)--a2;
              if (v67)
              {
                *(_QWORD *)(v97 + 16) = v125;
                *(_OWORD *)v97 = v123;
              }
              else
              {
                v102 = *(_OWORD *)&v101->value;
                *(_QWORD *)(v97 + 16) = v101->epoch;
                *(_OWORD *)v97 = v102;
                v101->epoch = v125;
                *(_OWORD *)&v101->value = v123;
                v103 = v97 - (_QWORD)a1 + 24;
                if (v103 >= 25)
                {
                  v104 = (v103 / 0x18uLL - 2) >> 1;
                  v105 = &a1[v104];
                  v106 = *(_OWORD *)&v105->value;
                  time1.epoch = v105->epoch;
                  *(_OWORD *)&time1.value = v106;
                  v107 = *(_OWORD *)v97;
                  time2.epoch = *(_QWORD *)(v97 + 16);
                  *(_OWORD *)&time2.value = v107;
                  if (CMTimeCompare(&time1, &time2) < 0)
                  {
                    v132.epoch = *(_QWORD *)(v97 + 16);
                    *(_OWORD *)&v132.value = *(_OWORD *)v97;
                    do
                    {
                      v108 = (uint64_t)v105;
                      v109 = *(_OWORD *)&v105->value;
                      *(_QWORD *)(v97 + 16) = v105->epoch;
                      *(_OWORD *)v97 = v109;
                      if (!v104)
                        break;
                      v104 = (v104 - 1) >> 1;
                      v105 = &a1[v104];
                      v110 = *(_OWORD *)&v105->value;
                      time1.epoch = v105->epoch;
                      *(_OWORD *)&time1.value = v110;
                      time2 = v132;
                      v97 = v108;
                    }
                    while (CMTimeCompare(&time1, &time2) < 0);
                    *(_QWORD *)(v108 + 16) = v132.epoch;
                    *(_OWORD *)v108 = *(_OWORD *)&v132.value;
                  }
                }
              }
            }
            while (v94-- > 2);
          }
          return;
        }
        v12 = (unint64_t)v11 >> 1;
        v13 = &a1[(unint64_t)v11 >> 1];
        if ((unint64_t)v10 < 0xC01)
        {
          sub_1D4C800F0(v13, a1, v8);
        }
        else
        {
          sub_1D4C800F0(a1, v13, v8);
          v14 = v12;
          sub_1D4C800F0(a1 + 1, &a1[v14 - 1], a2 - 2);
          sub_1D4C800F0(a1 + 2, &a1[v14 + 1], a2 - 3);
          sub_1D4C800F0(&a1[v14 - 1], v13, &a1[v14 + 1]);
          v15 = *(_OWORD *)&a1->value;
          time1.epoch = a1->epoch;
          *(_OWORD *)&time1.value = v15;
          v16 = v13->epoch;
          *(_OWORD *)&a1->value = *(_OWORD *)&v13->value;
          a1->epoch = v16;
          v17 = *(_OWORD *)&time1.value;
          v13->epoch = time1.epoch;
          *(_OWORD *)&v13->value = v17;
        }
        --a3;
        if ((a4 & 1) == 0)
        {
          v120 = a1[-1].epoch;
          v119.epoch = a1->epoch;
          *(_OWORD *)&v119.value = *(_OWORD *)&a1->value;
          *(_OWORD *)&time1.value = *(_OWORD *)&a1[-1].value;
          time1.epoch = v120;
          time2 = v119;
          if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
          {
            v130.epoch = a1->epoch;
            *(_OWORD *)&v130.value = *(_OWORD *)&a1->value;
            v41 = *(_OWORD *)&a1->value;
            time1.epoch = v130.epoch;
            *(_OWORD *)&time1.value = v41;
            v42 = *(_OWORD *)&v8->value;
            time2.epoch = a2[-1].epoch;
            *(_OWORD *)&time2.value = v42;
            if (CMTimeCompare(&time1, &time2) < 0)
            {
              v46 = a1;
              do
              {
                v9 = v46 + 1;
                time1 = v130;
                v47 = *(_OWORD *)&v46[1].value;
                time2.epoch = v46[1].epoch;
                *(_OWORD *)&time2.value = v47;
                v48 = CMTimeCompare(&time1, &time2);
                v46 = v9;
              }
              while ((v48 & 0x80000000) == 0);
            }
            else
            {
              v43 = a1 + 1;
              do
              {
                v9 = v43;
                if (v43 >= v7)
                  break;
                time1 = v130;
                v44 = *(_OWORD *)&v43->value;
                time2.epoch = v43->epoch;
                *(_OWORD *)&time2.value = v44;
                v45 = CMTimeCompare(&time1, &time2);
                v43 = v9 + 1;
              }
              while ((v45 & 0x80000000) == 0);
            }
            v49 = v7;
            if (v9 < v7)
            {
              v50 = v7;
              do
              {
                v49 = v50 - 1;
                time1 = v130;
                v51 = *(_OWORD *)&v50[-1].value;
                time2.epoch = v50[-1].epoch;
                *(_OWORD *)&time2.value = v51;
                v52 = CMTimeCompare(&time1, &time2);
                v50 = v49;
              }
              while (v52 < 0);
            }
            while (v9 < v49)
            {
              v53 = *(_OWORD *)&v9->value;
              time1.epoch = v9->epoch;
              *(_OWORD *)&time1.value = v53;
              v54 = *(_OWORD *)&v49->value;
              v9->epoch = v49->epoch;
              *(_OWORD *)&v9->value = v54;
              v55 = *(_OWORD *)&time1.value;
              v49->epoch = time1.epoch;
              *(_OWORD *)&v49->value = v55;
              do
              {
                time1 = v130;
                v56 = *(_OWORD *)&v9[1].value;
                v57 = v9[1].epoch;
                ++v9;
                time2.epoch = v57;
                *(_OWORD *)&time2.value = v56;
              }
              while ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0);
              do
              {
                v58 = *(_OWORD *)&v49[-1].value;
                v59 = v49[-1].epoch;
                --v49;
                time1 = v130;
                *(_OWORD *)&time2.value = v58;
                time2.epoch = v59;
              }
              while (CMTimeCompare(&time1, &time2) < 0);
            }
            v60 = v9 - 1;
            if (&v9[-1] != a1)
            {
              v61 = *(_OWORD *)&v60->value;
              a1->epoch = v9[-1].epoch;
              *(_OWORD *)&a1->value = v61;
            }
            a4 = 0;
            v9[-1].epoch = v130.epoch;
            *(_OWORD *)&v60->value = *(_OWORD *)&v130.value;
            continue;
          }
        }
        v18 = 0;
        v129.epoch = a1->epoch;
        *(_OWORD *)&v129.value = *(_OWORD *)&a1->value;
        do
        {
          v19 = *(_OWORD *)&a1[v18 + 1].value;
          time1.epoch = a1[v18 + 1].epoch;
          *(_OWORD *)&time1.value = v19;
          time2 = v129;
          ++v18;
        }
        while (CMTimeCompare(&time1, &time2) < 0);
        v20 = &a1[v18];
        v21 = v7;
        if (v18 == 1)
        {
          v25 = a2;
          while (v20 < v25)
          {
            v22 = v25 - 1;
            v26 = *(_OWORD *)&v25[-1].value;
            time1.epoch = v25[-1].epoch;
            *(_OWORD *)&time1.value = v26;
            time2 = v129;
            v27 = CMTimeCompare(&time1, &time2);
            v25 = v22;
            if (v27 < 0)
              goto LABEL_20;
          }
          v22 = v25;
        }
        else
        {
          do
          {
            v22 = v21 - 1;
            v23 = *(_OWORD *)&v21[-1].value;
            time1.epoch = v21[-1].epoch;
            *(_OWORD *)&time1.value = v23;
            time2 = v129;
            v24 = CMTimeCompare(&time1, &time2);
            v21 = v22;
          }
          while ((v24 & 0x80000000) == 0);
        }
LABEL_20:
        if (v20 >= v22)
        {
          v37 = v20 - 1;
        }
        else
        {
          v28 = &a1[v18];
          v29 = (unint64_t)v22;
          do
          {
            v30 = *(_OWORD *)&v28->value;
            time1.epoch = v28->epoch;
            *(_OWORD *)&time1.value = v30;
            v31 = *(_OWORD *)v29;
            v28->epoch = *(_QWORD *)(v29 + 16);
            *(_OWORD *)&v28->value = v31;
            v32 = *(_OWORD *)&time1.value;
            *(_QWORD *)(v29 + 16) = time1.epoch;
            *(_OWORD *)v29 = v32;
            do
            {
              v33 = *(_OWORD *)&v28[1].value;
              v34 = v28[1].epoch;
              ++v28;
              time1.epoch = v34;
              *(_OWORD *)&time1.value = v33;
              time2 = v129;
            }
            while (CMTimeCompare(&time1, &time2) < 0);
            do
            {
              v35 = *(_OWORD *)(v29 - 24);
              v36 = *(_QWORD *)(v29 - 8);
              v29 -= 24;
              time2 = v129;
              *(_OWORD *)&time1.value = v35;
              time1.epoch = v36;
            }
            while ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0);
          }
          while ((unint64_t)v28 < v29);
          v37 = v28 - 1;
        }
        if (v37 != a1)
        {
          v38 = *(_OWORD *)&v37->value;
          a1->epoch = v37->epoch;
          *(_OWORD *)&a1->value = v38;
        }
        v37->epoch = v129.epoch;
        *(_OWORD *)&v37->value = *(_OWORD *)&v129.value;
        v39 = v20 >= v22;
        v7 = a2;
        if (!v39)
        {
LABEL_34:
          sub_1D4C92538(a1, v37, a3, a4 & 1);
          a4 = 0;
          v9 = v37 + 1;
          continue;
        }
        v40 = sub_1D4C930E0(a1, v37);
        v9 = v37 + 1;
        if (!sub_1D4C930E0(v37 + 1, a2))
        {
          if (v40)
            continue;
          goto LABEL_34;
        }
        a2 = v37;
        if (!v40)
          goto LABEL_1;
        return;
    }
  }
}

__n128 sub_1D4C7FF68(CMTime *a1, CMTime *a2, CMTime *a3, CMTime *a4, CMTime *a5)
{
  __n128 result;
  CMTimeEpoch epoch;
  __int128 v12;
  CMTimeEpoch v13;
  CMTimeEpoch v14;
  __int128 v15;
  CMTimeEpoch v16;
  CMTimeEpoch v17;
  __int128 v18;
  CMTimeEpoch v19;
  CMTimeEpoch v20;
  CMTimeEpoch v21;
  CMTime time2;
  CMTime time1;

  sub_1D4C804F0(a1, a2, a3, a4);
  time1 = *a5;
  time2 = *a4;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    epoch = a4->epoch;
    v12 = *(_OWORD *)&a4->value;
    v13 = a5->epoch;
    *(_OWORD *)&a4->value = *(_OWORD *)&a5->value;
    a4->epoch = v13;
    *(_OWORD *)&a5->value = v12;
    a5->epoch = epoch;
    time1 = *a4;
    time2 = *a3;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      v14 = a3->epoch;
      v15 = *(_OWORD *)&a3->value;
      v16 = a4->epoch;
      *(_OWORD *)&a3->value = *(_OWORD *)&a4->value;
      a3->epoch = v16;
      *(_OWORD *)&a4->value = v15;
      a4->epoch = v14;
      time1 = *a3;
      time2 = *a2;
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        v17 = a2->epoch;
        v18 = *(_OWORD *)&a2->value;
        v19 = a3->epoch;
        *(_OWORD *)&a2->value = *(_OWORD *)&a3->value;
        a2->epoch = v19;
        *(_OWORD *)&a3->value = v18;
        a3->epoch = v17;
        time1 = *a2;
        time2 = *a1;
        if (CMTimeCompare(&time1, &time2) < 0)
        {
          v20 = a1->epoch;
          result = *(__n128 *)&a1->value;
          v21 = a2->epoch;
          *(_OWORD *)&a1->value = *(_OWORD *)&a2->value;
          a1->epoch = v21;
          *(__n128 *)&a2->value = result;
          a2->epoch = v20;
        }
      }
    }
  }
  return result;
}

uint64_t sub_1D4C800F0(CMTime *a1, CMTime *a2, CMTime *a3)
{
  uint64_t result;
  CMTimeEpoch v7;
  __int128 v8;
  CMTimeEpoch v9;
  CMTimeEpoch v10;
  __int128 v11;
  CMTimeEpoch v12;
  CMTimeEpoch v13;
  __int128 v14;
  CMTimeEpoch v15;
  CMTimeEpoch epoch;
  __int128 v17;
  CMTimeEpoch v18;
  CMTimeEpoch v19;
  CMTime time2;
  CMTime time1;

  time1 = *a2;
  time2 = *a1;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    time1 = *a3;
    time2 = *a2;
    result = CMTimeCompare(&time1, &time2);
    if ((result & 0x80000000) != 0)
    {
      epoch = a1->epoch;
      v17 = *(_OWORD *)&a1->value;
      v19 = a3->epoch;
      *(_OWORD *)&a1->value = *(_OWORD *)&a3->value;
      a1->epoch = v19;
    }
    else
    {
      v13 = a1->epoch;
      v14 = *(_OWORD *)&a1->value;
      v15 = a2->epoch;
      *(_OWORD *)&a1->value = *(_OWORD *)&a2->value;
      a1->epoch = v15;
      *(_OWORD *)&a2->value = v14;
      a2->epoch = v13;
      time1 = *a3;
      time2 = *a2;
      result = CMTimeCompare(&time1, &time2);
      if ((result & 0x80000000) == 0)
        return result;
      epoch = a2->epoch;
      v17 = *(_OWORD *)&a2->value;
      v18 = a3->epoch;
      *(_OWORD *)&a2->value = *(_OWORD *)&a3->value;
      a2->epoch = v18;
    }
    *(_OWORD *)&a3->value = v17;
    a3->epoch = epoch;
  }
  else
  {
    time1 = *a3;
    time2 = *a2;
    result = CMTimeCompare(&time1, &time2);
    if ((result & 0x80000000) != 0)
    {
      v7 = a2->epoch;
      v8 = *(_OWORD *)&a2->value;
      v9 = a3->epoch;
      *(_OWORD *)&a2->value = *(_OWORD *)&a3->value;
      a2->epoch = v9;
      *(_OWORD *)&a3->value = v8;
      a3->epoch = v7;
      time1 = *a2;
      time2 = *a1;
      result = CMTimeCompare(&time1, &time2);
      if ((result & 0x80000000) != 0)
      {
        v10 = a1->epoch;
        v11 = *(_OWORD *)&a1->value;
        v12 = a2->epoch;
        *(_OWORD *)&a1->value = *(_OWORD *)&a2->value;
        a1->epoch = v12;
        *(_OWORD *)&a2->value = v11;
        a2->epoch = v10;
      }
    }
  }
  return result;
}

BOOL sub_1D4C802B4(CMTime *a1, CMTime *a2)
{
  unint64_t v4;
  _BOOL8 result;
  CMTime *v6;
  CMTimeEpoch epoch;
  __int128 v8;
  CMTimeEpoch v9;
  CMTime *v10;
  CMTime *v11;
  uint64_t v12;
  int v13;
  CMTimeEpoch v14;
  uint64_t v15;
  char *v16;
  __int128 v17;
  uint64_t v18;
  CMTimeEpoch v19;
  CMTime v20;
  __int128 v21;
  CMTime time2;
  CMTime time1;

  v4 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      time1 = a2[-1];
      time2 = *a1;
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        v6 = a2 - 1;
        epoch = a1->epoch;
        v8 = *(_OWORD *)&a1->value;
        v9 = a2[-1].epoch;
        *(_OWORD *)&a1->value = *(_OWORD *)&a2[-1].value;
        a1->epoch = v9;
        *(_OWORD *)&v6->value = v8;
        v6->epoch = epoch;
      }
      return 1;
    case 3uLL:
      sub_1D4C800F0(a1, a1 + 1, a2 - 1);
      return 1;
    case 4uLL:
      sub_1D4C804F0(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5uLL:
      sub_1D4C7FF68(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      v10 = a1 + 2;
      sub_1D4C800F0(a1, a1 + 1, a1 + 2);
      v11 = a1 + 3;
      if (&a1[3] == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    v14 = v10->epoch;
    v21 = *(_OWORD *)&v10->value;
    time1 = *v11;
    *(_OWORD *)&time2.value = v21;
    time2.epoch = v14;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      *(_OWORD *)&v20.value = *(_OWORD *)&v11->value;
      v20.epoch = v11->epoch;
      v15 = v12;
      while (1)
      {
        v16 = (char *)a1 + v15;
        *(_OWORD *)(v16 + 72) = *(_OWORD *)((char *)&a1[2].value + v15);
        *((_QWORD *)v16 + 11) = *(CMTimeEpoch *)((char *)&a1[2].epoch + v15);
        if (v15 == -48)
          break;
        v17 = *(_OWORD *)(v16 + 24);
        v19 = *((_QWORD *)v16 + 5);
        time1 = v20;
        *(_OWORD *)&time2.value = v17;
        time2.epoch = v19;
        v15 -= 24;
        if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
        {
          v18 = (uint64_t)&a1[3] + v15;
          goto LABEL_12;
        }
      }
      v18 = (uint64_t)a1;
LABEL_12:
      *(_OWORD *)v18 = *(_OWORD *)&v20.value;
      *(_QWORD *)(v18 + 16) = v20.epoch;
      if (++v13 == 8)
        return &v11[1] == a2;
    }
    v10 = v11;
    v12 += 24;
    if (++v11 == a2)
      return 1;
  }
}

__n128 sub_1D4C804F0(CMTime *a1, CMTime *a2, CMTime *a3, CMTime *a4)
{
  __n128 result;
  CMTimeEpoch epoch;
  __int128 v10;
  CMTimeEpoch v11;
  CMTimeEpoch v12;
  __int128 v13;
  CMTimeEpoch v14;
  CMTimeEpoch v15;
  CMTimeEpoch v16;
  CMTime time2;
  CMTime time1;

  sub_1D4C800F0(a1, a2, a3);
  time1 = *a4;
  time2 = *a3;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    epoch = a3->epoch;
    v10 = *(_OWORD *)&a3->value;
    v11 = a4->epoch;
    *(_OWORD *)&a3->value = *(_OWORD *)&a4->value;
    a3->epoch = v11;
    *(_OWORD *)&a4->value = v10;
    a4->epoch = epoch;
    time1 = *a3;
    time2 = *a2;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      v12 = a2->epoch;
      v13 = *(_OWORD *)&a2->value;
      v14 = a3->epoch;
      *(_OWORD *)&a2->value = *(_OWORD *)&a3->value;
      a2->epoch = v14;
      *(_OWORD *)&a3->value = v13;
      a3->epoch = v12;
      time1 = *a2;
      time2 = *a1;
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        v15 = a1->epoch;
        result = *(__n128 *)&a1->value;
        v16 = a2->epoch;
        *(_OWORD *)&a1->value = *(_OWORD *)&a2->value;
        a1->epoch = v16;
        *(__n128 *)&a2->value = result;
        a2->epoch = v15;
      }
    }
  }
  return result;
}

uint64_t *sub_1D4C8061C(uint64_t *a1, unsigned int a2, unsigned int a3)
{
  unsigned __int8 v6;
  void *__p[3];
  __int128 v8;
  uint64_t v9;
  void **v10;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v6 = 0;
  sub_1D4C80D8C(__p, a3, &v6);
  sub_1D4C80FB8(&v8, a2, (uint64_t)__p);
  sub_1D4C811DC(a1);
  *(_OWORD *)a1 = v8;
  a1[2] = v9;
  v9 = 0;
  v8 = 0uLL;
  v10 = (void **)&v8;
  sub_1D4C609EC(&v10);
  if (__p[0])
    operator delete(__p[0]);
  return a1;
}

void sub_1D4C806B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  sub_1D4C609EC((void ***)&a13);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C806E0(_QWORD *a1)
{
  return -1431655765 * ((a1[1] - *a1) >> 3);
}

uint64_t sub_1D4C806FC(_QWORD *a1)
{
  if (a1[1] == *a1)
    return 0;
  else
    return *(unsigned int *)(*a1 + 8);
}

char **sub_1D4C80718(uint64_t *a1)
{
  _QWORD *v2;
  char **v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unsigned int v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  int v23;

  v2 = (_QWORD *)operator new();
  v3 = (char **)v2;
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  v5 = *a1;
  v4 = a1[1];
  if (v4 != *a1)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = v2 + 2;
    do
    {
      v10 = *(_QWORD *)(v5 + 24 * v7 + 8);
      if (v10)
      {
        v11 = 0;
        v12 = *(_QWORD *)(v5 + 24 * v7);
        v13 = 1;
        do
        {
          v14 = *(_QWORD *)(v12 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) & (1 << v11);
          if (v10 <= v13)
            break;
          v11 = v13++;
        }
        while (!v14);
        if (v14)
        {
          if ((unint64_t)v6 >= *v9)
          {
            v16 = *v3;
            v17 = (v6 - *v3) >> 2;
            v18 = v17 + 1;
            if ((unint64_t)(v17 + 1) >> 62)
              sub_1D4C590D0();
            v19 = *v9 - (_QWORD)v16;
            if (v19 >> 1 > v18)
              v18 = v19 >> 1;
            if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL)
              v20 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v20 = v18;
            if (v20)
            {
              v21 = (char *)sub_1D4C61FFC((uint64_t)(v3 + 2), v20);
              v16 = *v3;
              v6 = v3[1];
            }
            else
            {
              v21 = 0;
            }
            v22 = &v21[4 * v17];
            *(_DWORD *)v22 = v8;
            v15 = v22 + 4;
            while (v6 != v16)
            {
              v23 = *((_DWORD *)v6 - 1);
              v6 -= 4;
              *((_DWORD *)v22 - 1) = v23;
              v22 -= 4;
            }
            *v3 = v22;
            v3[1] = v15;
            v3[2] = &v21[4 * v20];
            if (v16)
              operator delete(v16);
          }
          else
          {
            *(_DWORD *)v6 = v8;
            v15 = v6 + 4;
          }
          v3[1] = v15;
          v6 = v15;
          v5 = *a1;
          v4 = a1[1];
        }
      }
      v7 = ++v8;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v4 - v5) >> 3) > v8);
  }
  return v3;
}

char **sub_1D4C808C0(uint64_t *a1, unsigned int a2, _BYTE *a3)
{
  _QWORD *v6;
  char **v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unsigned int v11;
  _QWORD *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  int v21;

  v6 = (_QWORD *)operator new();
  v7 = (char **)v6;
  v6[1] = 0;
  v6[2] = 0;
  *v6 = 0;
  v8 = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3) <= a2)
  {
    *a3 = 1;
  }
  else
  {
    *a3 = 0;
    if (*(_QWORD *)(v8 + 24 * a2 + 8))
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v12 = v6 + 2;
      do
      {
        if (((*(_QWORD *)(*(_QWORD *)(v8 + 24 * a2) + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
        {
          if ((unint64_t)v9 >= *v12)
          {
            v14 = *v7;
            v15 = (v9 - *v7) >> 2;
            v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 62)
              sub_1D4C590D0();
            v17 = *v12 - (_QWORD)v14;
            if (v17 >> 1 > v16)
              v16 = v17 >> 1;
            if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFFCLL)
              v18 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v18 = v16;
            if (v18)
            {
              v19 = (char *)sub_1D4C61FFC((uint64_t)(v7 + 2), v18);
              v14 = *v7;
              v9 = v7[1];
            }
            else
            {
              v19 = 0;
            }
            v20 = &v19[4 * v15];
            *(_DWORD *)v20 = v11;
            v13 = v20 + 4;
            while (v9 != v14)
            {
              v21 = *((_DWORD *)v9 - 1);
              v9 -= 4;
              *((_DWORD *)v20 - 1) = v21;
              v20 -= 4;
            }
            *v7 = v20;
            v7[1] = v13;
            v7[2] = &v19[4 * v18];
            if (v14)
              operator delete(v14);
          }
          else
          {
            *(_DWORD *)v9 = v11;
            v13 = v9 + 4;
          }
          v7[1] = v13;
          v8 = *a1;
          v9 = v13;
        }
        v10 = ++v11;
      }
      while (*(_QWORD *)(v8 + 24 * a2 + 8) > (unint64_t)v11);
    }
  }
  return v7;
}

uint64_t sub_1D4C80A6C(uint64_t *a1, unsigned int a2, unsigned int a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v4 = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3) <= a2 || *(_QWORD *)(v4 + 24 * a2 + 8) <= (unint64_t)a3)
  {
    result = 0;
    *a4 = 1;
  }
  else
  {
    result = 0;
    *a4 = 0;
    v6 = *(_QWORD *)(v4 + 24 * a2);
    v7 = (unint64_t)a3 >> 6;
    v8 = *(_QWORD *)(v6 + 8 * v7);
    if ((v8 & (1 << a3)) == 0)
    {
      *(_QWORD *)(v6 + 8 * v7) = v8 | (1 << a3);
      return 1;
    }
  }
  return result;
}

uint64_t sub_1D4C80AF8(uint64_t *a1, uint64_t *a2, _BYTE *a3)
{
  char **v6;
  char *v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t result;
  uint64_t v11;
  _DWORD *v12;
  unint64_t v13;

  v6 = sub_1D4C80718(a2);
  *a3 = 0;
  v7 = v6[1];
  if (v7 == *v6)
  {
LABEL_11:
    if (v7)
    {
      v6[1] = v7;
      operator delete(v7);
    }
    JUMPOUT(0x1D82660DCLL);
  }
  v8 = 0;
  v7 = *v6;
  while (1)
  {
    v9 = *(_DWORD *)&v7[4 * v8];
    result = (uint64_t)sub_1D4C808C0(a2, v9, a3);
    if (*a3)
      return result;
    v11 = result;
    v12 = *(_DWORD **)(result + 8);
    if (v12 != *(_DWORD **)v11)
    {
      v13 = 0;
      v12 = *(_DWORD **)v11;
      do
      {
        result = sub_1D4C80A6C(a1, v9, v12[v13], a3);
        if (*a3)
          return result;
        ++v13;
        v12 = *(_DWORD **)v11;
      }
      while (v13 < (uint64_t)(*(_QWORD *)(v11 + 8) - *(_QWORD *)v11) >> 2);
    }
    if (v12)
    {
      *(_QWORD *)(v11 + 8) = v12;
      operator delete(v12);
    }
    MEMORY[0x1D82660DC](v11, 0x10C402FEFCB83);
    ++v8;
    v7 = *v6;
    if (v8 >= (v6[1] - *v6) >> 2)
      goto LABEL_11;
  }
}

BOOL sub_1D4C80C34(uint64_t *a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  unint64_t v10;

  v3 = *a1;
  v4 = a1[1];
  v5 = (v4 - *a1) / 24;
  if (v4 == *a1)
  {
    v8 = 0;
    LODWORD(v10) = 0;
    *a2 = v5;
  }
  else
  {
    v6 = 0;
    if (v5 <= 1)
      v7 = 1;
    else
      v7 = (v4 - *a1) / 24;
    v8 = 1;
    while (1)
    {
      v9 = *(_QWORD *)(v3 + 24 * v6 + 8);
      if (v9)
        break;
LABEL_10:
      v8 = v5 > ++v6;
      if (v6 == v7)
      {
        *a2 = v5;
        v8 = 0;
        if (v4 == v3)
          LODWORD(v10) = 0;
        else
          LODWORD(v10) = *(_DWORD *)(v3 + 8);
        goto LABEL_15;
      }
    }
    v10 = 0;
    while (((*(_QWORD *)(*(_QWORD *)(v3 + 24 * v6) + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
    {
      if (v9 == ++v10)
        goto LABEL_10;
    }
    *a2 = v6;
  }
LABEL_15:
  *a3 = v10;
  return v8;
}

BOOL sub_1D4C80CFC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v2 = *a1;
  v1 = a1[1];
  v3 = v1 - *a1;
  if (v1 == *a1)
  {
    return 1;
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = v3 / 24;
    if (v6 <= 1)
      v7 = 1;
    else
      v7 = v6;
    while (1)
    {
      v8 = *(_QWORD *)(v2 + 24 * v4 + 8);
      if (v8)
        break;
LABEL_9:
      v5 = v6 <= ++v4;
      if (v4 == v7)
        return 1;
    }
    v9 = 0;
    while (((*(_QWORD *)(*(_QWORD *)(v2 + 24 * v4) + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
    {
      if (v8 == ++v9)
        goto LABEL_9;
    }
  }
  return v5;
}

_QWORD *sub_1D4C80D8C(_QWORD *a1, unint64_t a2, unsigned __int8 *a3)
{
  int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  int v14;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D4C7F180(a1, a2);
    v6 = *a3;
    v7 = a1[1];
    v8 = v7 + a2;
    a1[1] = v7 + a2;
    if (v7)
    {
      v9 = v8 - 1;
      if (((v8 - 1) ^ (v7 - 1)) < 0x40)
      {
LABEL_10:
        v13 = *a1 + 8 * (v7 >> 6);
        v14 = v7 & 0x3F;
        if (v6)
          sub_1D4C80E5C(&v13, a2);
        else
          sub_1D4C80F0C((uint64_t)&v13, a2);
        return a1;
      }
    }
    else
    {
      v9 = v8 - 1;
    }
    v10 = v9 >> 6;
    if (v8 >= 0x41)
      v11 = v10;
    else
      v11 = 0;
    *(_QWORD *)(*a1 + 8 * v11) = 0;
    goto LABEL_10;
  }
  return a1;
}

_QWORD *sub_1D4C80E5C(_QWORD *result, unint64_t a2)
{
  unint64_t v2;
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v3 = result;
  v4 = *((_DWORD *)result + 2);
  v5 = (_QWORD *)*result;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ |= (0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4);
    v2 = a2 - v6;
    *result = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    result = memset(v5, 255, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *v3 = v8;
    *v8 |= 0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F);
  }
  return result;
}

void sub_1D4C80F0C(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  int v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v2 = a2;
  v4 = *(_DWORD *)(a1 + 8);
  v5 = *(_QWORD **)a1;
  if (v4)
  {
    if ((64 - v4) >= a2)
      v6 = a2;
    else
      v6 = (64 - v4);
    *v5++ &= ~((0xFFFFFFFFFFFFFFFFLL >> (64 - v4 - v6)) & (-1 << v4));
    v2 = a2 - v6;
    *(_QWORD *)a1 = v5;
  }
  v7 = v2 >> 6;
  if (v2 >= 0x40)
    bzero(v5, 8 * v7);
  if ((v2 & 0x3F) != 0)
  {
    v8 = &v5[v7];
    *(_QWORD *)a1 = v8;
    *v8 &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v2 & 0x3F));
  }
}

_QWORD *sub_1D4C80FB8(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D4C60B88(a1, a2);
    v6 = (_QWORD *)a1[1];
    v7 = 3 * a2;
    v8 = &v6[3 * a2];
    v9 = 8 * v7;
    do
    {
      sub_1D4C81060(v6, a3);
      v6 += 3;
      v9 -= 24;
    }
    while (v9);
    a1[1] = v8;
  }
  return a1;
}

void sub_1D4C81040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  sub_1D4C609EC(&a9);
  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C81060(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    sub_1D4C7F180(a1, v4);
    sub_1D4C810B8(a1, *(_QWORD **)a2, 0, (_QWORD *)(*(_QWORD *)a2 + 8 * (*(_QWORD *)(a2 + 8) >> 6)), *(_QWORD *)(a2 + 8) & 0x3F, *(_QWORD *)(a2 + 8));
  }
  return a1;
}

void sub_1D4C810B8(_QWORD *a1, _QWORD *a2, unint64_t a3, _QWORD *a4, int a5, uint64_t a6)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE v11[32];

  v6 = a1[1];
  v7 = v6 + a6;
  a1[1] = v6 + a6;
  if (!v6 || ((v7 - 1) ^ (v6 - 1)) >= 0x40)
  {
    if (v7 >= 0x41)
      v8 = (v7 - 1) >> 6;
    else
      v8 = 0;
    *(_QWORD *)(*a1 + 8 * v8) = 0;
  }
  v9 = *a1 + 8 * (v6 >> 6);
  v10 = v6 & 0x3F;
  sub_1D4C81134(a2, a3, a4, a5, (uint64_t)&v9, (uint64_t)v11);
}

void sub_1D4C81134(_QWORD *a1@<X1>, unint64_t a2@<X2>, _QWORD *a3@<X3>, int a4@<W4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  _BOOL4 v12;

  LODWORD(v6) = a2;
  v7 = *(uint64_t **)a5;
  v8 = *(_DWORD *)(a5 + 8);
  if (a1 != a3 || (_DWORD)a2 != a4)
  {
    do
    {
      v9 = 1 << v8;
      if (((*a1 >> a2) & 1) != 0)
        v10 = *v7 | v9;
      else
        v10 = *v7 & ~v9;
      *v7 = v10;
      v11 = (_DWORD)v6 == 63;
      v12 = v6 == 63;
      v6 = (a2 + 1);
      if (v11)
        v6 = 0;
      if (v8 == 63)
      {
        v8 = 0;
        *(_QWORD *)a5 = ++v7;
      }
      else
      {
        ++v8;
      }
      a1 += v12;
      a2 = v6 | a2 & 0xFFFFFFFF00000000;
      *(_DWORD *)(a5 + 8) = v8;
    }
    while (a1 != a3 || (_DWORD)v6 != a4);
    a1 = a3;
  }
  *(_QWORD *)a6 = a1;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = v7;
  *(_DWORD *)(a6 + 24) = v8;
}

void sub_1D4C811DC(uint64_t *a1)
{
  if (*a1)
  {
    sub_1D4C60A2C(a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

_QWORD *sub_1D4C81214(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = sub_1D4C61FBC(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1D4C81270(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *sub_1D4C8128C(uint64_t *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v2 = *a1;
  if (*a1)
  {
    v3 = *(void **)v2;
    if (*(_QWORD *)v2)
    {
      *(_QWORD *)(v2 + 8) = v3;
      operator delete(v3);
    }
    MEMORY[0x1D82660DC](v2, 0x80C40D6874129);
    *a1 = 0;
  }
  v4 = a1[1];
  if (v4)
  {
    v5 = *(void **)v4;
    if (*(_QWORD *)v4)
    {
      *(_QWORD *)(v4 + 8) = v5;
      operator delete(v5);
    }
    MEMORY[0x1D82660DC](v4, 0x80C40D6874129);
    a1[1] = 0;
  }
  v6 = a1[2];
  if (v6)
  {
    v7 = *(void **)v6;
    if (*(_QWORD *)v6)
    {
      *(_QWORD *)(v6 + 8) = v7;
      operator delete(v7);
    }
    MEMORY[0x1D82660DC](v6, 0x80C40D6874129);
    a1[2] = 0;
  }
  v8 = a1[3];
  if (v8)
  {
    v9 = *(void **)v8;
    if (*(_QWORD *)v8)
    {
      *(_QWORD *)(v8 + 8) = v9;
      operator delete(v9);
    }
    MEMORY[0x1D82660DC](v8, 0x80C40D6874129);
    a1[3] = 0;
  }
  v10 = a1[4];
  if (v10)
  {
    v11 = *(void **)v10;
    if (*(_QWORD *)v10)
    {
      *(_QWORD *)(v10 + 8) = v11;
      operator delete(v11);
    }
    MEMORY[0x1D82660DC](v10, 0x80C40D6874129);
    a1[4] = 0;
  }
  return a1;
}

_QWORD *sub_1D4C813B4(_QWORD *result, uint64_t a2)
{
  *result = a2;
  result[1] = 0;
  return result;
}

uint64_t sub_1D4C813BC(uint64_t a1)
{
  uint64_t v2;

  if (*(_QWORD *)(a1 + 8))
  {
    v2 = sub_1D4C6224C();
    MEMORY[0x1D82660DC](v2, 0x1030C40523CC803);
    *(_QWORD *)(a1 + 8) = 0;
  }
  return a1;
}

uint64_t sub_1D4C81404(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 24);
}

uint64_t sub_1D4C81414(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 28);
}

_QWORD *sub_1D4C81424(_QWORD **a1, __int128 *a2)
{
  _QWORD *result;
  __int128 v3;
  uint64_t v4;

  result = *a1;
  if (result)
  {
    v3 = *a2;
    v4 = *((_QWORD *)a2 + 2);
    return sub_1D4C61D78((uint64_t)result, (uint64_t)&v3);
  }
  return result;
}

void sub_1D4C8145C(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CMTimeEpoch v14;
  CMTimeEpoch v15;
  CMTime v16;
  CMTime time1;
  CMTime rhs;
  CMTime lhs;
  CMTime v20;
  CMTime v21;
  char *v22;
  char *v23;
  uint64_t v24;

  v7 = *a1;
  v23 = 0;
  v24 = 0;
  v22 = 0;
  sub_1D4C60B10(&v22, *(const void **)(v7 + 8), *(_QWORD *)(v7 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v7 + 16) - *(_QWORD *)(v7 + 8)) >> 3));
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v7 + 16))(v7, a2);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v7 + 16))(v7, a3);
  v10 = MEMORY[0x1E0CA2E68];
  *(_OWORD *)a4 = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)(a4 + 16) = *(_QWORD *)(v10 + 16);
  if (v9)
  {
    v11 = (v9 - 1);
    if (v8 < v11)
    {
      v12 = 24 * v8;
      v13 = v11 - v8;
      do
      {
        v14 = *(_QWORD *)&v22[v12 + 40];
        *(_OWORD *)&lhs.value = *(_OWORD *)&v22[v12 + 24];
        lhs.epoch = v14;
        v15 = *(_QWORD *)&v22[v12 + 16];
        *(_OWORD *)&rhs.value = *(_OWORD *)&v22[v12];
        rhs.epoch = v15;
        CMTimeSubtract(&v20, &lhs, &rhs);
        v21 = v20;
        time1 = v20;
        v16 = *(CMTime *)a4;
        if (CMTimeCompare(&time1, &v16) >= 1)
          *(CMTime *)a4 = v21;
        v12 += 24;
        --v13;
      }
      while (v13);
    }
  }
  if (v22)
  {
    v23 = v22;
    operator delete(v22);
  }
}

void sub_1D4C815C0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 - 56);
  if (v3)
  {
    *(_QWORD *)(v1 - 48) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_1D4C815E8@<Q0>(uint64_t **a1@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  __n128 result;
  uint64_t v5;

  v3 = *a1;
  if (v3)
  {
    sub_1D4C8145C(v3, *a2, a2[1] + *a2 + a2[2], a3);
  }
  else
  {
    v5 = MEMORY[0x1E0CA2E18];
    result = *(__n128 *)MEMORY[0x1E0CA2E18];
    *(_OWORD *)a3 = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)(a3 + 16) = *(_QWORD *)(v5 + 16);
  }
  return result;
}

uint64_t *sub_1D4C81624(uint64_t *a1)
{
  uint64_t *v2;
  float v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;

  v2 = (uint64_t *)operator new();
  sub_1D4C62744(v2, a1[1] - *a1);
  v4 = *a1;
  v5 = a1[1] - *a1;
  if (v5)
  {
    v6 = 0;
    v7 = *v2;
    v8 = (v2[1] - *v2) >> 2;
    v9 = 1;
    do
    {
      if (v8 <= v6)
        sub_1D4C62870();
      LOBYTE(v3) = *(_BYTE *)(v4 + v6);
      v3 = (float)LODWORD(v3);
      *(float *)(v7 + 4 * v6) = v3;
      v6 = v9;
    }
    while (v5 > v9++);
  }
  return v2;
}

void sub_1D4C816B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D82660DC](v1, 0x80C40D6874129);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D4C816DC(uint64_t *a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int v10;

  v2 = (uint64_t *)operator new();
  sub_1D4C62744(v2, (a1[1] - *a1) >> 2);
  v3 = *a1;
  v4 = a1[1];
  v5 = v4 - *a1;
  if (v4 != *a1)
  {
    v6 = 0;
    v7 = v5 >> 2;
    v8 = *v2;
    v9 = (v2[1] - *v2) >> 2;
    v10 = 1;
    do
    {
      if (v9 <= v6)
        sub_1D4C62870();
      *(_DWORD *)(v8 + 4 * v6) = *(_DWORD *)(v3 + 4 * v6);
      v6 = v10;
    }
    while (v7 > v10++);
  }
  return v2;
}

void sub_1D4C81774(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D82660DC](v1, 0x80C40D6874129);
  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C81798(_QWORD *a1, int *a2)
{
  uint64_t v4;
  _QWORD *v5;
  int v6;
  unsigned int v7;
  uint64_t *v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unsigned int v18;
  float v19;

  if (!*a1)
    return 0;
  if (!a1[1])
  {
    v4 = operator new();
    sub_1D4C62198(v4, *a1, 1);
    a1[1] = v4;
  }
  v5 = (_QWORD *)operator new();
  v5[4] = 0;
  v6 = a2[1] + *a2 + a2[2];
  v7 = (v6 - *a2) / 3u;
  sub_1D4C62250(a1[1], v6 - v7, v6);
  sub_1D4C62258(a1[1]);
  v8 = sub_1D4C81624((uint64_t *)(*(_QWORD *)(a1[1] + 32) + 40));
  v5[3] = v8;
  sub_1D4C62250(a1[1], *a2, *a2 + v7);
  sub_1D4C62258(a1[1]);
  v9 = sub_1D4C81624((uint64_t *)(*(_QWORD *)(a1[1] + 32) + 40));
  v5[2] = v9;
  sub_1D4C62250(a1[1], *a2, a2[1] + *a2 + a2[2]);
  sub_1D4C62258(a1[1]);
  *v5 = sub_1D4C81624((uint64_t *)(*(_QWORD *)(a1[1] + 32) + 40));
  v5[1] = sub_1D4C816DC((uint64_t *)(*(_QWORD *)(a1[1] + 32) + 88));
  v10 = (_QWORD *)operator new();
  sub_1D4C62744(v10, (v9[1] - *v9) >> 2);
  v5[4] = v10;
  v11 = *v9;
  v12 = v9[1];
  v13 = v12 - *v9;
  if (v12 != *v9)
  {
    v14 = 0;
    v15 = v13 >> 2;
    v16 = *v8;
    v17 = (v8[1] - *v8) >> 2;
    v18 = 1;
    do
    {
      if (v17 <= v14)
        sub_1D4C62870();
      if (v14 >= (uint64_t)(v10[1] - *v10) >> 2)
        sub_1D4C62870();
      v19 = *(float *)(v11 + 4 * v14);
      if (v19 > *(float *)(v16 + 4 * v14))
        v19 = *(float *)(v16 + 4 * v14);
      *(float *)(*v10 + 4 * v14) = v19;
      v14 = v18;
    }
    while (v15 > v18++);
  }
  return v5;
}

void sub_1D4C81998(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D82660DC](v1, 0x1030C40523CC803);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C819D8(_QWORD *a1, uint64_t *a2, int *a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  char v14;
  __int128 *v15;
  _OWORD *v16;
  __int128 v17;

  sub_1D4C81B1C((uint64_t)a4, (a2[1] - *a2) >> 3);
  v8 = a1[1];
  if (!v8)
  {
    if (!*a1)
    {
LABEL_8:
      v13 = 0;
      return v13 & 1;
    }
    v8 = operator new();
    sub_1D4C62198(v8, *a1, 1);
    a1[1] = v8;
  }
  sub_1D4C62250(v8, *a3, a3[1] + *a3 + a3[2]);
  v9 = *a2;
  if (a2[1] == *a2)
    goto LABEL_8;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  do
  {
    sub_1D4C62308(a1[1], *(unsigned __int8 *)(v9 + v11), *(float *)(v9 + v11 + 4));
    v13 |= v14;
    v15 = (__int128 *)a1[1];
    v16 = (_OWORD *)(*a4 + v10);
    v17 = *v15;
    *(_OWORD *)((char *)v16 + 12) = *(__int128 *)((char *)v15 + 12);
    *v16 = v17;
    ++v12;
    v9 = *a2;
    v11 += 8;
    v10 += 28;
  }
  while (v12 < (a2[1] - *a2) >> 3);
  return v13 & 1;
}

void sub_1D4C81AF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D82660DC](v1, 0x1030C40523CC803);
  _Unwind_Resume(a1);
}

void sub_1D4C81B1C(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_1D4C81B60((void **)a1, v4);
  }
  else if (!v3)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 28 * a2;
  }
}

void sub_1D4C81B60(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (0x6DB6DB6DB6DB6DB7 * ((v6 - v7) >> 2) >= a2)
  {
    if (a2)
    {
      v13 = 28 * ((28 * a2 - 28) / 0x1C) + 28;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0x6DB6DB6DB6DB6DB7 * ((v7 - (_BYTE *)*a1) >> 2);
    v9 = v8 + a2;
    if (v8 + a2 > 0x924924924924924)
      sub_1D4C590D0();
    v10 = 0x6DB6DB6DB6DB6DB7 * ((v5 - (_BYTE *)*a1) >> 2);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x492492492492492)
      v11 = 0x924924924924924;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)sub_1D4C81D1C(v4, v11);
    else
      v12 = 0;
    v14 = &v12[28 * v8];
    v15 = &v12[28 * v11];
    v16 = 28 * ((28 * a2 - 28) / 0x1C) + 28;
    bzero(v14, v16);
    v17 = &v14[v16];
    v19 = (char *)*a1;
    v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        v20 = *(_OWORD *)(v18 - 28);
        *((_OWORD *)v14 - 1) = *((_OWORD *)v18 - 1);
        *(_OWORD *)(v14 - 28) = v20;
        v14 -= 28;
        v18 -= 28;
      }
      while (v18 != v19);
      v18 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
      operator delete(v18);
  }
}

void *sub_1D4C81D1C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x924924924924925)
    sub_1D4C5919C();
  return operator new(28 * a2);
}

uint64_t sub_1D4C81D64(uint64_t *a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  _DWORD *v8;
  int v9;
  int v10;
  int v11;
  uint64_t result;
  unsigned int v13;
  int v14;
  uint64_t v15;
  unsigned __int8 *v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  _DWORD *v23;
  int v24;

  v8 = (_DWORD *)sub_1D4C88E08(a1[1], 0);
  v9 = *v8;
  v10 = v8[1];
  v23 = v8;
  v11 = v8[4];
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)*a1 + 16))(*a1, a2);
  v24 = v10;
  if (v10)
  {
    v13 = 0;
    v14 = 0;
    v15 = (v11 * v9);
    v22 = *(_QWORD *)(a1[1] + 184) + (*(_DWORD *)(a1[1] + 192) * result);
    do
    {
      if ((_DWORD)v15)
      {
        v16 = (unsigned __int8 *)(v22 + (v23[2] * v14));
        v17 = v15;
        v18 = v13;
        do
        {
          v19 = *v16++;
          result = v19;
          if (*(_DWORD *)(a1[1] + 64) == 875704438)
            result = sub_1D4C822B8(result);
          v20 = *(unsigned __int8 *)(*a3 + v18);
          if (result < v20)
            LOBYTE(v20) = result;
          *(_BYTE *)(*a3 + v18) = v20;
          v21 = *(unsigned __int8 *)(*a4 + v18);
          if (result > v21)
            LOBYTE(v21) = result;
          *(_BYTE *)(*a4 + v18++) = v21;
          --v17;
        }
        while (v17);
      }
      ++v14;
      v13 += v15;
    }
    while (v14 != v24);
  }
  return result;
}

uint64_t sub_1D4C81E90(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t v9;
  uint64_t *v10;

  if (a2 < a4)
  {
    v9 = a2;
    v10 = (uint64_t *)result;
    do
    {
      result = sub_1D4C81D64(v10, v9, a5, a6);
      v9 = (v9 + 1);
    }
    while (a4 != (_DWORD)v9);
  }
  return result;
}

void sub_1D4C81EF4(uint64_t *a1, uint64_t a2, unsigned int a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  _DWORD *v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  unsigned int v24;
  char v25;
  int v26;
  int i;
  int v28;
  unsigned int v29;
  int v30;
  uint64_t v31;
  unsigned __int8 *v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  int j;
  uint64_t v40;
  unsigned int v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;

  if (a3 >= a2)
  {
    v44 = v5;
    v45 = v6;
    v12 = (_DWORD *)sub_1D4C88E08(a1[1], 0);
    v13 = v12[1];
    v14 = (v12[4] * *v12);
    v15 = (v14 * v13);
    v16 = a4[1] - *a4;
    if (v15 <= v16)
    {
      if (v15 < v16)
        a4[1] = *a4 + v15;
    }
    else
    {
      sub_1D4C6261C(a4, v15 - v16);
    }
    v17 = a5[1] - *a5;
    if (v15 <= v17)
    {
      if (v15 < v17)
        a5[1] = *a5 + v15;
    }
    else
    {
      sub_1D4C6261C(a5, v15 - v17);
    }
    v18 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)*a1 + 16))(*a1, a2);
    if (v13)
    {
      v19 = 0;
      v20 = 0;
      v21 = *(_QWORD *)(a1[1] + 184) + (*(_DWORD *)(a1[1] + 192) * v18);
      do
      {
        if ((_DWORD)v14)
        {
          v22 = (char *)(v21 + (v12[2] * v20));
          v23 = v14;
          v24 = v19;
          do
          {
            *(_BYTE *)(*a4 + v24) = *v22;
            v25 = *v22++;
            *(_BYTE *)(*a5 + v24++) = v25;
            --v23;
          }
          while (v23);
        }
        ++v20;
        v19 += v14;
      }
      while (v20 != v13);
    }
    v26 = a3 - a2;
    if (v26)
    {
      for (i = 0; i != v26; ++i)
      {
        v28 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)*a1 + 16))(*a1, (i + a2));
        if (v13)
        {
          v29 = 0;
          v30 = 0;
          v31 = *(_QWORD *)(a1[1] + 184) + (*(_DWORD *)(a1[1] + 192) * v28);
          do
          {
            if ((_DWORD)v14)
            {
              v32 = (unsigned __int8 *)(v31 + (v12[2] * v30));
              v33 = v14;
              v34 = v29;
              do
              {
                v36 = *v32++;
                v35 = v36;
                v37 = *(unsigned __int8 *)(*a4 + v34);
                if (v36 < v37)
                  LOBYTE(v37) = v35;
                *(_BYTE *)(*a4 + v34) = v37;
                if (v35 <= *(unsigned __int8 *)(*a5 + v34))
                  LOBYTE(v35) = *(_BYTE *)(*a5 + v34);
                *(_BYTE *)(*a5 + v34++) = v35;
                --v33;
              }
              while (v33);
            }
            ++v30;
            v29 += v14;
          }
          while (v30 != v13);
        }
      }
    }
    if (*(_DWORD *)(a1[1] + 64) == 875704438)
    {
      v42 = 0;
      v43 = 1065353216;
      sub_1D4C82210(0, (float *)&v43, (float *)&v42);
      if (v13)
      {
        v38 = 0;
        for (j = 0; j != v13; ++j)
        {
          v40 = v14;
          v41 = v38;
          if ((_DWORD)v14)
          {
            do
            {
              *(_BYTE *)(*a4 + v41) = sub_1D4C822B8(*(unsigned __int8 *)(*a4 + v41));
              *(_BYTE *)(*a5 + v41) = sub_1D4C822B8(*(unsigned __int8 *)(*a5 + v41));
              ++v41;
              --v40;
            }
            while (v40);
          }
          v38 += v14;
        }
      }
    }
  }
}

float sub_1D4C82178(unsigned int a1)
{
  int v2;
  float result;
  uint64_t v4;
  uint64_t v5;

  v5 = 0;
  sub_1D4C88670(875704422, a1, (unsigned int *)&v5 + 1, (int *)&v5);
  v4 = 0;
  v2 = sub_1D4C88670(875704438, a1, (unsigned int *)&v4 + 1, (int *)&v4);
  result = 1.0;
  if (!v2)
  {
    result = (float)((float)v5 - (float)HIDWORD(v5))
           / (float)((float)v4 - (float)HIDWORD(v4));
    if (result < 0.0)
      return -result;
  }
  return result;
}

float sub_1D4C82210(unsigned int a1, float *a2, float *a3)
{
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float result;
  uint64_t v12;
  uint64_t v13;

  v13 = 0;
  sub_1D4C88670(875704422, a1, (unsigned int *)&v13 + 1, (int *)&v13);
  v12 = 0;
  sub_1D4C88670(875704438, a1, (unsigned int *)&v12 + 1, (int *)&v12);
  v6 = (float)HIDWORD(v12);
  v7 = (float)v12;
  v8 = (float)HIDWORD(v13);
  v9 = (float)v13;
  v10 = (float)v13 - (float)HIDWORD(v13);
  *a2 = v10 / (float)((float)v12 - (float)HIDWORD(v12));
  result = (float)((float)(v8 * v7) - (float)(v6 * v9)) / v10;
  *a3 = result;
  return result;
}

uint64_t sub_1D4C822B8(int a1)
{
  return byte_1D4C95504[a1];
}

uint64_t sub_1D4C822C8(int a1)
{
  if (qword_1ED9A5870 != -1)
    dispatch_once(&qword_1ED9A5870, &unk_1E9863E70);
  return qword_1ED9A5860[a1];
}

os_log_t sub_1D4C82318()
{
  os_log_t result;

  qword_1ED9A5860[0] = (uint64_t)os_log_create("com.apple.AutoLoop", "unspecified");
  result = os_log_create("com.apple.AutoLoop", "PointsOfInterest");
  qword_1ED9A5868 = (uint64_t)result;
  return result;
}

uint64_t sub_1D4C82368(__int128 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t result;
  __int128 v5;
  uint64_t v6;

  if ((*((_DWORD *)a1 + 3) & 0x1D) != 1)
    return 0xFFFFFFFFLL;
  v5 = *a1;
  v6 = *((_QWORD *)a1 + 2);
  result = (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)a3 + 40))(a3, &v5);
  if (result >= a2)
  {
    printf("WARNING: set_loopParamConfigOptions requested ref frame index %d for num_frames %d, setting ref frame to %d.\n", result, a2, a2 - 1);
    return a2 - 1;
  }
  return result;
}

uint64_t sub_1D4C823F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  __int128 v15;
  int v16;
  int v17;
  _BOOL4 v18;
  int v20;
  int v21;
  int v22;
  int v23;
  _DWORD *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL4 v29;
  int v30;
  int v31;
  int v32;
  unsigned int v33;
  int v34;
  unsigned int v35;
  unsigned int v37;
  int v38;
  unsigned int v39;
  unsigned int v41;
  int v43;
  int v44;
  CMTimeRange range;
  CMTime v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;

  v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  v56 = *(_OWORD *)(a3 + 72);
  v57 = *(_QWORD *)(a3 + 88);
  v12 = sub_1D4C8B060(a1, (uint64_t)&v56);
  v54 = *(_OWORD *)(a3 + 24);
  v55 = *(_QWORD *)(a3 + 40);
  v44 = sub_1D4C8B060(a1, (uint64_t)&v54);
  v52 = *(_OWORD *)(a3 + 48);
  v53 = *(_QWORD *)(a3 + 64);
  v43 = sub_1D4C8B060(a1, (uint64_t)&v52);
  v50 = *(_OWORD *)a4;
  v51 = *(_QWORD *)(a4 + 16);
  v13 = sub_1D4C82368(&v50, v11, a1);
  v48 = *(_OWORD *)a5;
  v49 = *(_QWORD *)(a5 + 16);
  v14 = sub_1D4C82368(&v48, v11, a1);
  v15 = *(_OWORD *)(a5 + 16);
  *(_OWORD *)&range.start.value = *(_OWORD *)a5;
  *(_OWORD *)&range.start.epoch = v15;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a5 + 32);
  CMTimeRangeGetEnd(&v47, &range);
  v16 = sub_1D4C82368((__int128 *)&v47.value, v11, a1);
  v17 = v16;
  v18 = v13 == -1;
  if (v14 < v13 || v13 == -1)
    v20 = v14;
  else
    v20 = v13;
  if (v14 == -1)
    v21 = v13;
  else
    v21 = v20;
  if (v16 > v13)
    v18 = 1;
  if (v18)
    v22 = v16;
  else
    v22 = v13;
  if (v16 == -1)
    v23 = v13;
  else
    v23 = v22;
  v24 = operator new(0xCuLL);
  v25 = v24;
  v26 = 0;
  v27 = 0;
  *v24 = v13;
  v24[1] = v14;
  v24[2] = v17;
  v29 = v21 == -1 || v23 == -1;
  do
  {
    v30 = v24[v26];
    if (v30 != -1)
    {
      v31 = v30 < v21 || v29;
      if (v30 > v23)
        v32 = 1;
      else
        v32 = v31;
      if (v32)
        v27 = 21;
      else
        v27 = v27;
    }
    ++v26;
  }
  while (v26 != 3);
  if (v21 != -1)
  {
    v33 = v11 + ~v21;
    v34 = 2 * v21;
    if (v12 >= v33)
      v35 = v11 + ~v21;
    else
      v35 = v12;
    if (v35 < 2 * v21)
      v34 = v35;
    if (v35 > 2 * v21 || v12 > v33)
      v12 = v34;
  }
  v37 = v11 + ~v23;
  v38 = 2 * v23;
  if (v12 >= v37)
    v39 = v11 + ~v23;
  else
    v39 = v12;
  if (v39 < 2 * v23)
    v38 = v39;
  if (v39 > 2 * v23 || v12 > v37)
    v41 = v38;
  else
    v41 = v12;
  if (v23 == -1)
    v41 = v12;
  *(_DWORD *)a2 = v11;
  *(_DWORD *)(a2 + 4) = v41;
  *(_DWORD *)(a2 + 8) = v44;
  *(_DWORD *)(a2 + 12) = v43 + 1;
  *(_DWORD *)(a2 + 16) = v21;
  *(_DWORD *)(a2 + 20) = v23;
  *(_BYTE *)(a2 + 24) = v41 < a6;
  if (!(_DWORD)v27)
  {
    if (sub_1D4C82668(a2))
      v27 = 0;
    else
      v27 = 21;
  }
  operator delete(v25);
  return v27;
}

BOOL sub_1D4C82668(uint64_t a1)
{
  unsigned int v1;
  unsigned int v2;
  unsigned int v3;
  int v5;
  int v6;
  _BOOL8 result;
  BOOL v10;

  v1 = *(_DWORD *)(a1 + 4);
  v2 = *(_DWORD *)(a1 + 8);
  v3 = *(_DWORD *)a1;
  if (v1 + v2 > *(_DWORD *)a1 || v2 > *(_DWORD *)(a1 + 12))
    return 0;
  v6 = *(_DWORD *)(a1 + 16);
  v5 = *(_DWORD *)(a1 + 20);
  if (v6 != -1 && v6 > v5)
    return 0;
  if (v5 != -1 && v3 <= v5)
    return 0;
  result = 0;
  v10 = (v1 | *(unsigned __int8 *)(a1 + 24)) == 0;
  if (v1 <= v2 && v2 <= v3 && !v10)
    return (v3 < 2 || v1 <= v3 >> 1)
        && (v6 == -1 || v3 - v6 > v1 && (double)v1 * 0.5 <= (double)v6)
        && (v5 == -1 || v3 - v5 > v1 && (double)v1 * 0.5 <= (double)v5);
  return result;
}

float sub_1D4C8274C(_DWORD *a1)
{
  float result;

  result = 1.0;
  if (*a1 >= a1[3])
    return (float)a1[2];
  return result;
}

uint64_t sub_1D4C8276C(unsigned int *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5)
{
  unsigned int v5;
  _BOOL4 v6;
  unsigned int v7;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  _BOOL4 v14;
  BOOL v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  unsigned int v21;
  int v22;

  v5 = a3 + a2;
  if (a1[4] >= a2)
  {
    v7 = a1[5];
    v6 = v7 != -1 && v7 >= v5;
  }
  else
  {
    v6 = 1;
  }
  v9 = v5 + a4;
  v10 = *a1;
  v11 = (a5 & 1) == 0 && a1[1] != a4;
  v14 = a1[2] > a3 || a1[3] < a3 || a4 > a3;
  v15 = v9 > v10;
  v16 = v9 > v10 || v14;
  v17 = v16 | v6;
  if (v15)
    LODWORD(v18) = 2;
  else
    LODWORD(v18) = 3;
  if (v14)
    LODWORD(v18) = 1;
  if (v17)
    v18 = v18;
  else
    v18 = 5;
  if ((v17 & 1) == 0 && !v11)
  {
    if (a4)
      v19 = 1;
    else
      v19 = a5;
    if (a1[1])
      v20 = v19;
    else
      v20 = 0;
    if (v19)
      v21 = 5;
    else
      v21 = 4;
    if (*((_BYTE *)a1 + 24))
      v22 = 1;
    else
      v22 = v20;
    if (v22)
      return 0;
    else
      return v21;
  }
  return v18;
}

uint64_t *sub_1D4C82834(unsigned int *a1)
{
  unsigned int v2;
  unsigned int v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t *v6;
  _DWORD *v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unint64_t v13;
  _DWORD *v14;
  _BYTE *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned int v19;
  _BYTE *v20;
  _DWORD *v21;
  _DWORD *v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  char v31;
  unsigned int v32;
  _BOOL4 v34;
  _DWORD *v36;
  _BYTE *v37;
  void *__p;
  _BYTE *v39;
  char v40;

  v2 = a1[2];
  v3 = a1[3];
  v4 = *a1;
  v5 = a1[1];
  v6 = (uint64_t *)operator new();
  sub_1D4C806DC(v6, (v4 + 1), v4);
  v40 = 0;
  sub_1D4C83190(&__p, v4);
  v7 = __p;
  if (v39 != __p)
  {
    v8 = 0;
    v9 = (v39 - (_BYTE *)__p) >> 2;
    do
    {
      v7[v8] = v8;
      ++v8;
    }
    while (v9 > v8);
  }
  v10 = v4 - v5;
  if (v3 < v4 - v5)
    v10 = v3;
  v11 = v10 + 1;
  v12 = v10 - v2;
  if (v2 <= v11)
    v13 = v12 + 1;
  else
    v13 = 0;
  sub_1D4C83190(&v36, v13);
  v14 = v36;
  v15 = v37;
  if (v37 != (_BYTE *)v36)
  {
    v16 = 0;
    v17 = (v37 - (_BYTE *)v36) >> 2;
    if (v17 <= 1)
      v17 = 1;
    do
    {
      v14[v16] = v2 + v16;
      ++v16;
    }
    while (v17 != v16);
    v18 = 0;
    v19 = 0;
    v21 = __p;
    v20 = v39;
    v22 = v39;
    while (v22 == v21)
    {
      v22 = v21;
LABEL_46:
      v18 = ++v19;
      if (v19 >= (unint64_t)((v15 - (_BYTE *)v14) >> 2))
      {
        if (v14)
          goto LABEL_48;
        goto LABEL_49;
      }
    }
    v23 = 0;
    v24 = v14[v18];
    v27 = v24 < v2 || v24 > v3 || v5 > v24;
    v28 = 1;
    while (1)
    {
      v29 = v21[v23];
      v30 = v29 + v24 + v5;
      if (a1[4] < v29)
        break;
      v32 = a1[5];
      v34 = v32 != -1 && v32 >= v29 + v24;
      v31 = v30 > v4 || v27;
      if ((v31 & 1) != 0 || v34)
        goto LABEL_29;
      sub_1D4C80A6C(v6, v24, v29, &v40);
      v21 = __p;
      v20 = v39;
LABEL_43:
      v23 = v28++;
      v22 = v20;
      if (v23 >= (v20 - (_BYTE *)v21) >> 2)
      {
LABEL_44:
        v14 = v36;
        v15 = v37;
        goto LABEL_46;
      }
    }
    v31 = v30 > v4 || v27;
LABEL_29:
    if ((v31 & 1) != 0)
      goto LABEL_44;
    goto LABEL_43;
  }
  v14 = v37;
  if (v37)
  {
LABEL_48:
    v37 = v14;
    operator delete(v14);
  }
LABEL_49:
  if (__p)
  {
    v39 = __p;
    operator delete(__p);
  }
  return v6;
}

void sub_1D4C82A24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_1D4C82A78(unsigned int *a1, uint64_t *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t *v5;
  char **v6;
  char *v7;
  unint64_t v8;
  unsigned int v9;
  char **v10;
  char *v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t *v16;
  char v17;

  v4 = *a1;
  v3 = a1[1];
  v5 = (uint64_t *)operator new();
  sub_1D4C806DC(v5, v4, (v4 + 1));
  v17 = 0;
  v6 = sub_1D4C80718(a2);
  v7 = v6[1];
  if (v7 != *v6)
  {
    v8 = 0;
    v7 = *v6;
    v16 = a2;
    do
    {
      v9 = *(_DWORD *)&v7[4 * v8];
      v10 = sub_1D4C808C0(a2, v9, &v17);
      v11 = v10[1];
      if (v11 != *v10)
      {
        v12 = 0;
        v11 = *v10;
        do
        {
          v13 = *(_DWORD *)&v11[4 * v12];
          if (v3)
          {
            v14 = v3;
            do
            {
              sub_1D4C80A6C(v5, v13, v9 + v13, &v17);
              ++v13;
              --v14;
            }
            while (v14);
          }
          else if (v13 + v9 < v4)
          {
            sub_1D4C80A6C(v5, v13, v13 + v9, &v17);
          }
          ++v12;
          v11 = *v10;
        }
        while (v12 < (v10[1] - *v10) >> 2);
      }
      if (v11)
      {
        v10[1] = v11;
        operator delete(v11);
      }
      MEMORY[0x1D82660DC](v10, 0x10C402FEFCB83);
      ++v8;
      v7 = *v6;
      a2 = v16;
    }
    while (v8 < (v6[1] - *v6) >> 2);
  }
  if (v7)
  {
    v6[1] = v7;
    operator delete(v7);
  }
  MEMORY[0x1D82660DC](v6, 0x10C402FEFCB83);
  return v5;
}

void sub_1D4C82C08(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D82660DC](v1, 0x20C40960023A9);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C82C2C(unsigned int *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5)
{
  unsigned int v5;
  _BOOL4 v6;
  unsigned int v7;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  _BOOL4 v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  unsigned int v20;
  int v21;

  v5 = a3 + a2;
  if (a1[4] >= a2)
  {
    v7 = a1[5];
    v6 = v7 != -1 && v7 >= v5;
  }
  else
  {
    v6 = 1;
  }
  v9 = *a1;
  v10 = v5 + (a4 >> 1);
  v11 = (a5 & 1) == 0 && a1[1] != a4;
  v14 = a1[2] > a3 || a1[3] < a3 || a4 >> 1 > a3;
  v15 = v10 > v9 || v14;
  v16 = v15 | v6;
  if (v10 > v9)
    LODWORD(v17) = 2;
  else
    LODWORD(v17) = 3;
  if (v14)
    LODWORD(v17) = 1;
  if (v16)
    v17 = v17;
  else
    v17 = 5;
  if ((v16 & 1) == 0 && !v11)
  {
    if (a4 > 1)
      v18 = 1;
    else
      v18 = a5;
    if (a1[1] > 1)
      v19 = v18;
    else
      v19 = 0;
    if (v18)
      v20 = 5;
    else
      v20 = 4;
    if (*((_BYTE *)a1 + 24))
      v21 = 1;
    else
      v21 = v19;
    if (v21)
      return 0;
    else
      return v20;
  }
  return v17;
}

uint64_t *sub_1D4C82CF8(unsigned int *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t *v4;
  char **v5;
  char *v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  char **v10;
  char *v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  BOOL v18;
  unsigned int v19;
  char **v22;
  uint64_t *v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  char v28;

  v3 = *a1;
  v27 = a1[1];
  v4 = (uint64_t *)operator new();
  sub_1D4C806DC(v4, v3, v3);
  v28 = 0;
  v5 = sub_1D4C80718(a2);
  v6 = v5[1];
  if (v6 != *v5)
  {
    v7 = 0;
    if (v27 >> 1 <= 1)
      v8 = 1;
    else
      v8 = v27 >> 1;
    v6 = *v5;
    v22 = v5;
    v23 = a2;
    v25 = v3;
    do
    {
      v24 = v7;
      v9 = *(_DWORD *)&v6[4 * v7];
      v10 = sub_1D4C808C0(a2, v9, &v28);
      v11 = v10[1];
      if (v11 != *v10)
      {
        v12 = 0;
        v26 = v9;
        v13 = v9 - 1;
        v11 = *v10;
        do
        {
          v14 = *(_DWORD *)&v11[4 * v12];
          v15 = v14;
          v16 = v8;
          if (v27 > 1)
          {
            do
            {
              sub_1D4C80A6C(v4, v14, v15, &v28);
              sub_1D4C80A6C(v4, v13 + v14--, v13 + v15++, &v28);
              --v16;
            }
            while (v16);
          }
          else
          {
            v17 = v14 + 1;
            if (v14)
              v18 = v17 >= v25;
            else
              v18 = 1;
            if (!v18)
              sub_1D4C80A6C(v4, v14 - 1, v17, &v28);
            v19 = v14 + v26;
            if (v14 + v26 >= 2 && v19 < v25)
              sub_1D4C80A6C(v4, v14 + v26 - 2, v19, &v28);
          }
          ++v12;
          v11 = *v10;
        }
        while (v12 < (v10[1] - *v10) >> 2);
      }
      if (v11)
      {
        v10[1] = v11;
        operator delete(v11);
      }
      MEMORY[0x1D82660DC](v10, 0x10C402FEFCB83);
      a2 = v23;
      v7 = v24 + 1;
      v5 = v22;
      v6 = *v22;
    }
    while (v24 + 1 < (unint64_t)((v22[1] - *v22) >> 2));
  }
  if (v6)
  {
    v5[1] = v6;
    operator delete(v6);
  }
  MEMORY[0x1D82660DC](v5, 0x10C402FEFCB83);
  return v4;
}

void sub_1D4C82F04(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D82660DC](v1, 0x20C40960023A9);
  _Unwind_Resume(a1);
}

uint64_t *sub_1D4C82F28(unsigned int *a1)
{
  unsigned int v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t *v5;
  _DWORD *v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;
  uint64_t v18;
  unsigned int v19;
  _BYTE *v20;
  _DWORD *v21;
  _DWORD *v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v26;
  char v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  BOOL v32;
  int v33;
  char v34;
  BOOL v35;
  char v36;
  unsigned int v38;
  _BYTE *v39;
  _BYTE *v40;
  void *__p;
  _BYTE *v42;
  char v43;

  v2 = a1[2];
  v38 = a1[3];
  v3 = *a1;
  v4 = a1[1];
  v5 = (uint64_t *)operator new();
  sub_1D4C806DC(v5, (v3 + 1), v3);
  v43 = 0;
  sub_1D4C83190(&__p, v3);
  v6 = __p;
  if (v42 != __p)
  {
    v7 = 0;
    v8 = (v42 - (_BYTE *)__p) >> 2;
    do
    {
      v6[v7] = v7;
      ++v7;
    }
    while (v8 > v7);
  }
  v9 = v3 - v4;
  if (v38 < v3 - v4)
    v9 = v38;
  v10 = v9 + 1;
  v11 = v9 - v2;
  if (v2 <= v10)
    v12 = v11 + 1;
  else
    v12 = 0;
  sub_1D4C83190(&v39, v12);
  v13 = v39;
  v14 = v40;
  if (v40 == v39)
  {
    v13 = v40;
    if (v40)
    {
LABEL_52:
      v40 = v13;
      operator delete(v13);
    }
  }
  else
  {
    v15 = 0;
    v16 = v4 >> 1;
    v17 = (v40 - v39) >> 2;
    if (v17 <= 1)
      v17 = 1;
    do
    {
      *(_DWORD *)&v13[4 * v15] = v2 + v15;
      ++v15;
    }
    while (v17 != v15);
    v18 = 0;
    v19 = 0;
    v21 = __p;
    v20 = v42;
    v22 = v42;
    do
    {
      if (v22 != v21)
      {
        v23 = 0;
        v24 = *(_DWORD *)&v13[4 * v18];
        v26 = v24 < v2 || v24 > v38;
        v27 = v16 > v24 || v26;
        v28 = 1;
        while (1)
        {
          v29 = v21[v23];
          v30 = v29 + v24 + v16;
          if (a1[4] >= v29
            && ((v31 = a1[5], v31 != -1) ? (v32 = v31 >= v29 + v24) : (v32 = 0),
                !v32 ? (v33 = 0) : (v33 = 1),
                v29 < v16 ? (v34 = 1) : (v34 = v26),
                (v34 & 1) == 0 && v16 <= v24 && (v30 <= v3 ? (v35 = v33 == 0) : (v35 = 0), v35)))
          {
            sub_1D4C80A6C(v5, v24, v29, &v43);
            v21 = __p;
            v20 = v42;
          }
          else
          {
            if (v30 > v3)
              v36 = 1;
            else
              v36 = v27;
            if ((v36 & 1) != 0)
            {
LABEL_48:
              v13 = v39;
              v14 = v40;
              goto LABEL_50;
            }
          }
          v23 = v28++;
          v22 = v20;
          if (v23 >= (v20 - (_BYTE *)v21) >> 2)
            goto LABEL_48;
        }
      }
      v22 = v21;
LABEL_50:
      v18 = ++v19;
    }
    while (v19 < (unint64_t)((v14 - v13) >> 2));
    if (v13)
      goto LABEL_52;
  }
  if (__p)
  {
    v42 = __p;
    operator delete(__p);
  }
  return v5;
}

void sub_1D4C8313C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_1D4C83190(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D4C61FBC(a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_1D4C831E8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D4C83204(uint64_t a1)
{
  _QWORD **v2;
  _QWORD **v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;

  v4 = a1 + 64;
  v2 = *(_QWORD ***)(a1 + 64);
  v3 = *(_QWORD ***)(v4 + 8);
  if (v3 == v2)
  {
    v2 = v3;
    if (!v3)
      return a1;
    goto LABEL_7;
  }
  v5 = 0;
  do
  {
    if (v2[v5])
    {
      v6 = sub_1D4C841C4(v2[v5]);
      MEMORY[0x1D82660DC](v6, 0x10A0C40CEA0335CLL);
      *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v5) = 0;
      v2 = *(_QWORD ***)(a1 + 64);
      v3 = *(_QWORD ***)(a1 + 72);
    }
    ++v5;
  }
  while (v5 < v3 - v2);
  if (v2)
  {
LABEL_7:
    *(_QWORD *)(a1 + 72) = v2;
    operator delete(v2);
  }
  return a1;
}

float sub_1D4C83298(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  float result;

  v2 = 0;
  v3 = *a1;
  do
  {
    result = *(float *)(a2 + v2);
    *(float *)(v3 + v2) = result;
    v2 += 4;
  }
  while (v2 != 36);
  return result;
}

uint64_t sub_1D4C832B8(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  unsigned int v14;
  unint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  uint64_t v23;
  _BYTE v24[36];
  __int128 v25;
  uint64_t v26;

  v7 = a3;
  v8 = v7;
  *(_DWORD *)(a1 + 56) = a4;
  if (!v7)
  {
    NSLog(CFSTR("prepareNormalizedStabilizeRecipe error: missing stabParams."));
LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  if (!a2)
  {
    NSLog(CFSTR("prepareNormalizedStabilizeRecipe error: missing ftNorm."));
    goto LABEL_13;
  }
  objc_msgSend(v7, "cropRect");
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  *(_QWORD *)(a1 + 40) = v11;
  *(_QWORD *)(a1 + 48) = v12;
  v13 = *(_OWORD *)(a2 + 60);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 76);
  *(_OWORD *)a1 = v13;
  v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
  sub_1D4C8349C(a1 + 64, v14);
  for (i = 0; i < (*(unsigned int (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2); ++i)
  {
    objc_msgSend(v8, "getFrameInfo:frameInfo:", (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)a2 + 16))(a2, i), v24);
    v16 = operator new();
    *(_OWORD *)(v16 + 24) = 0u;
    *(_OWORD *)(v16 + 40) = 0u;
    *(_OWORD *)v16 = v25;
    *(_QWORD *)(v16 + 16) = v26;
    sub_1D4C62744(&v22, 9uLL);
    v17 = *(void **)(v16 + 24);
    if (v17)
    {
      *(_QWORD *)(v16 + 32) = v17;
      operator delete(v17);
      *(_QWORD *)(v16 + 24) = 0;
      *(_QWORD *)(v16 + 32) = 0;
      *(_QWORD *)(v16 + 40) = 0;
    }
    v18 = 0;
    v19 = v22;
    *(_OWORD *)(v16 + 24) = v22;
    *(_QWORD *)(v16 + 40) = v23;
    do
    {
      *(_DWORD *)(v19 + v18) = *(_DWORD *)&v24[v18];
      v18 += 4;
    }
    while (v18 != 36);
    *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * i) = v16;
  }
  sub_1D4C834CC(a1, a2);
  v20 = 1;
LABEL_14:

  return v20;
}

void sub_1D4C83474(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4C8349C(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    sub_1D4C84210((void **)a1, a2 - v2);
  }
}

uint64_t sub_1D4C834CC(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  char v10;
  uint64_t v11;
  void *v12;
  _BYTE v13[11];

  result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)a2 + 56))(a2, 0, (*(_QWORD *)(a1 + 72) - *(_QWORD *)(a1 + 64)) >> 3);
  if (result)
  {
    v4 = (void **)result;
    v5 = *(_QWORD *)(a1 + 64);
    v6 = *(_QWORD *)(a1 + 72);
    if (v6 != v5)
    {
      v7 = 0;
      v8 = 0;
      do
      {
        if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)v4[1] - (_BYTE *)*v4) >> 2) <= v8)
          sub_1D4C62870();
        v9 = (char *)*v4 + v7;
        v10 = *v9;
        *(_QWORD *)v13 = *(_QWORD *)(v9 + 1);
        *(_DWORD *)&v13[7] = *((_DWORD *)v9 + 2);
        if ((*v9 & 1) != 0)
        {
          v11 = operator new();
          *(_BYTE *)v11 = v10;
          *(_QWORD *)(v11 + 1) = *(_QWORD *)v13;
          *(_DWORD *)(v11 + 8) = *(_DWORD *)&v13[7];
          v5 = *(_QWORD *)(a1 + 64);
          *(_QWORD *)(*(_QWORD *)(v5 + 8 * v8) + 48) = v11;
          v6 = *(_QWORD *)(a1 + 72);
        }
        ++v8;
        v7 += 12;
      }
      while (v8 < (v6 - v5) >> 3);
    }
    v12 = *v4;
    if (*v4)
    {
      v4[1] = v12;
      operator delete(v12);
    }
    JUMPOUT(0x1D82660DCLL);
  }
  return result;
}

id sub_1D4C83650(CMTime *a1)
{
  void *v2;
  CFDictionaryRef v3;
  void *v4;
  double v5;
  uint64_t i;
  void *v7;
  CMTimeValue value;
  void *v9;
  void *v10;
  void *v11;
  CMTime v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *a1;
  v3 = CMTimeCopyAsDictionary(&v13, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("rawTime"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 36; i += 4)
  {
    LODWORD(v5) = *(_DWORD *)(a1[1].value + i);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("homography"));
  value = a1[2].value;
  if (value)
  {
    v14[0] = CFSTR("gapStart");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(unsigned int *)(value + 4));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = CFSTR("gapLength");
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(unsigned int *)(a1[2].value + 8));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("gapBridge"));

  }
  return v2;
}

void sub_1D4C83804(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v3;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C83870(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  unsigned int v6;

  v1 = a1;
  v2 = operator new();
  *(_BYTE *)v2 = 1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("gapStart"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    *(_DWORD *)(v2 + 4) = objc_msgSend(v3, "unsignedIntegerValue");
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("gapLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v6 = objc_msgSend(v5, "unsignedIntegerValue"), *(_DWORD *)(v2 + 8) = v6, (isKindOfClass & 1) != 0))
  {
    if (v6 <= 1)
      *(_BYTE *)v2 = 0;
  }
  else
  {
    MEMORY[0x1D82660DC](v2, 0x1000C408195852FLL);
    v2 = 0;
  }

  return v2;
}

void sub_1D4C83990(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL sub_1D4C839B0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  const __CFDictionary *v6;
  char isKindOfClass;
  void *v8;
  char v9;
  uint64_t v10;
  char v11;
  void *v12;
  char v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  CMTime v19;

  v3 = a2;
  sub_1D4C62744(&v19, 9uLL);
  v5 = (_QWORD *)(a1 + 24);
  v4 = *(void **)(a1 + 24);
  if (v4)
  {
    *(_QWORD *)(a1 + 32) = v4;
    operator delete(v4);
    *v5 = 0;
    *(_QWORD *)(a1 + 32) = 0;
    *(_QWORD *)(a1 + 40) = 0;
  }
  *(CMTime *)(a1 + 24) = v19;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("rawTime"));
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  memset(&v19, 0, sizeof(v19));
  CMTimeMakeFromDictionary(&v19, v6);
  *(CMTime *)a1 = v19;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("homography"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();
  v10 = 0;
  v11 = (objc_msgSend(v8, "count") != 9) | v9 & isKindOfClass ^ 1;
  do
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v13 = objc_opt_isKindOfClass();
    objc_msgSend(v12, "doubleValue");
    v11 |= v13 ^ 1;
    *(float *)&v14 = v14;
    *(_DWORD *)(*v5 + 4 * v10) = LODWORD(v14);

    ++v10;
  }
  while (v10 != 9);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gapBridge"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("gapBridge"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = sub_1D4C83870(v16);
      *(_QWORD *)(a1 + 48) = v17;
      v11 |= v17 == 0;
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    v16 = v6;
  }

  return (v11 & 1) == 0;
}

void sub_1D4C83BDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_1D4C83C20(uint64_t a1)
{
  void *v2;
  void *v3;
  CFDictionaryRef DictionaryRepresentation;
  CFDictionaryRef v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  CMTime v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("stabilizeResult"));

  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(a1 + 24));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", DictionaryRepresentation, CFSTR("stabCropRect"));

  v11 = *(CMTime *)a1;
  v5 = CMTimeCopyAsDictionary(&v11, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("outputFrameDur"));

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = *(_QWORD *)(a1 + 64);
  if (*(_QWORD *)(a1 + 72) != v7)
  {
    v8 = 0;
    do
    {
      sub_1D4C83650(*(CMTime **)(v7 + 8 * v8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v9);

      ++v8;
      v7 = *(_QWORD *)(a1 + 64);
    }
    while (v8 < (*(_QWORD *)(a1 + 72) - v7) >> 3);
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("frameInstructions"));

  return v2;
}

void sub_1D4C83D70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C83DAC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  void *v7;
  char **v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  CMTime v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("stabilizeResult"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(_DWORD *)(a1 + 56) = objc_msgSend(v4, "intValue");
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("stabCropRect"));
    v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      CGRectMakeWithDictionaryRepresentation(v5, (CGRect *)(a1 + 24));
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("outputFrameDur"));
      v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        CMTimeMakeFromDictionary(&v36, v6);
        *(CMTime *)a1 = v36;
        v8 = (char **)(a1 + 64);
        v7 = *(void **)(a1 + 64);
        if (v7)
        {
          *(_QWORD *)(a1 + 72) = v7;
          operator delete(v7);
          *v8 = 0;
          *(_QWORD *)(a1 + 72) = 0;
          *(_QWORD *)(a1 + 80) = 0;
        }
        *v8 = 0;
        *(_QWORD *)(a1 + 72) = 0;
        *(_QWORD *)(a1 + 80) = 0;
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("frameInstructions"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          obj = v9;
          v30 = v9;
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v33;
            while (2)
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v33 != v11)
                  objc_enumerationMutation(obj);
                v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || (v14 = operator new(),
                      v15 = MEMORY[0x1E0CA2E10],
                      *(_OWORD *)v14 = *MEMORY[0x1E0CA2E10],
                      *(_QWORD *)(v14 + 16) = *(_QWORD *)(v15 + 16),
                      *(_OWORD *)(v14 + 24) = 0u,
                      *(_OWORD *)(v14 + 40) = 0u,
                      !sub_1D4C839B0(v14, v13)))
                {
                  v28 = 0;
                  goto LABEL_39;
                }
                v17 = *(uint64_t **)(a1 + 72);
                v16 = *(_QWORD *)(a1 + 80);
                if ((unint64_t)v17 >= v16)
                {
                  v19 = ((char *)v17 - *v8) >> 3;
                  if ((unint64_t)(v19 + 1) >> 61)
                    sub_1D4C590D0();
                  v20 = v16 - (_QWORD)*v8;
                  v21 = v20 >> 2;
                  if (v20 >> 2 <= (unint64_t)(v19 + 1))
                    v21 = v19 + 1;
                  if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
                    v22 = 0x1FFFFFFFFFFFFFFFLL;
                  else
                    v22 = v21;
                  if (v22)
                    v23 = (char *)sub_1D4C60BD8(a1 + 80, v22);
                  else
                    v23 = 0;
                  v24 = (uint64_t *)&v23[8 * v19];
                  *v24 = v14;
                  v18 = v24 + 1;
                  v26 = *(char **)(a1 + 64);
                  v25 = *(char **)(a1 + 72);
                  if (v25 != v26)
                  {
                    do
                    {
                      v27 = *((_QWORD *)v25 - 1);
                      v25 -= 8;
                      *--v24 = v27;
                    }
                    while (v25 != v26);
                    v25 = *v8;
                  }
                  *(_QWORD *)(a1 + 64) = v24;
                  *(_QWORD *)(a1 + 72) = v18;
                  *(_QWORD *)(a1 + 80) = &v23[8 * v22];
                  if (v25)
                    operator delete(v25);
                }
                else
                {
                  *v17 = v14;
                  v18 = v17 + 1;
                }
                *(_QWORD *)(a1 + 72) = v18;
              }
              v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
              v28 = 1;
              if (v10)
                continue;
              break;
            }
          }
          else
          {
            v28 = 1;
          }
LABEL_39:

          v9 = v30;
        }
        else
        {
          v28 = 0;
        }

      }
      else
      {
        v28 = 0;
      }
      v5 = v6;
    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

void sub_1D4C84150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C841C4(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  v2 = a1[6];
  if (v2)
    MEMORY[0x1D82660DC](v2, 0x1000C408195852FLL);
  v3 = (void *)a1[3];
  if (v3)
  {
    a1[4] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_1D4C84210(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 3);
    if (v9 >> 61)
      sub_1D4C590D0();
    v10 = v8 >> 3;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 2 > v9)
      v9 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)sub_1D4C60BD8(v4, v12);
    else
      v13 = 0;
    v14 = &v13[8 * v10];
    v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    v16 = &v14[8 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        v19 = *((_QWORD *)v17 - 1);
        v17 -= 8;
        *((_QWORD *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

uint64_t sub_1D4C84310(_QWORD *a1, uint64_t a2, uint64_t *a3, _DWORD *a4, _QWORD *a5)
{
  BOOL v9;
  uint64_t v10;
  float (***v12)(_QWORD);
  _QWORD *v13;
  const std::locale::facet *v14;
  std::locale v16;

  if (*(_BYTE *)a2)
    v9 = 1;
  else
    v9 = *(_DWORD *)(a2 + 8) == 0;
  if (v9)
  {
    sub_1D4C84490(a3, a2, a4, (uint64_t)a5);
    return 0;
  }
  else
  {
    v12 = (float (***)(_QWORD))operator new();
    sub_1D4C84D7C((uint64_t)v12, a1);
    if (sub_1D4C84530(v12, a3, a2, (uint64_t)a4, a5))
    {
      v10 = 0;
    }
    else
    {
      v13 = sub_1D4C849A0(MEMORY[0x1E0DE4A60], (uint64_t)"AutoLoop empty search space (zero P labels)", 43);
      std::ios_base::getloc((const std::ios_base *)((char *)v13 + *(_QWORD *)(*v13 - 24)));
      v14 = std::locale::use_facet(&v16, MEMORY[0x1E0DE4A90]);
      ((void (*)(const std::locale::facet *, uint64_t))v14->__vftable[2].~facet_0)(v14, 10);
      std::locale::~locale(&v16);
      std::ostream::put();
      std::ostream::flush();
      v10 = 26;
    }
    MEMORY[0x1D82660DC](v12, 0x10E1C40BE220A8ALL);
  }
  return v10;
}

void sub_1D4C8445C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C84490(uint64_t *a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  BOOL v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v14;

  v8 = sub_1D4C80C34(a1, a3 + 1, a3);
  v9 = *(_DWORD *)(a2 + 8);
  a3[2] = v9;
  a3[3] = v9;
  a3[4] = -1082130432;
  if (!v8)
  {
    v10 = *(_DWORD *)(a2 + 4) - v9;
    *a3 = 0;
    a3[1] = v10;
    printf("Warning: no-opt minimize_autoloop_energy had no valid candidates");
  }
  if (a4)
  {
    v11 = sub_1D4C806E0(a1);
    v12 = sub_1D4C806FC(a1);
    v14 = -1082130432;
    sub_1D4C68BB8(a4, (v12 * v11), &v14);
  }
  return 1;
}

BOOL sub_1D4C84530(float (***a1)(_QWORD), uint64_t *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t *v8;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  float v13;
  float v14;
  char **v15;
  char **v16;
  unsigned int *v17;
  int v18;
  uint64_t *v19;
  char **v20;
  char *v21;
  float v22;
  _BOOL8 result;
  int v24;
  uint64_t v25;
  char **v26;
  uint64_t v27;
  char v28;
  int v29;

  v8 = a2;
  v10 = sub_1D4C806E0(a2);
  v11 = sub_1D4C806FC(v8);
  if (a5)
  {
    v29 = -1082130432;
    sub_1D4C68BB8((uint64_t)a5, v11 * (unint64_t)v10, &v29);
  }
  v12 = *(unsigned int *)(a3 + 8);
  v28 = 0;
  v27 = 0;
  if (!sub_1D4C80C34(v8, (_DWORD *)&v27 + 1, &v27))
  {
    result = 0;
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    return result;
  }
  v13 = sub_1D4C85044(a1, v27, HIDWORD(v27), v12, a3);
  v14 = v13;
  if (a5)
    *(float *)(*a5 + 4 * (v27 + HIDWORD(v27) * (unint64_t)v11)) = v13;
  v15 = sub_1D4C80718(v8);
  v16 = v15;
  v17 = (unsigned int *)*v15;
  if (*v15 < v15[1])
  {
    v25 = a4;
    v26 = v15;
    v18 = 0;
    do
    {
      v19 = v8;
      v20 = sub_1D4C808C0(v8, *v17, &v28);
      v21 = *v20;
      if (*v20 < v20[1])
      {
        do
        {
          v22 = sub_1D4C85044(a1, *(unsigned int *)v21, *v17, v12, a3);
          if (a5)
            *(float *)(*a5 + 4 * (*(unsigned int *)v21 + *v17 * (unint64_t)v11)) = ((float (*)(float (***)(_QWORD), _QWORD, _QWORD, uint64_t))**a1)(a1, *(unsigned int *)v21, *v17, v12);
          if (v22 <= v14)
          {
            LODWORD(v27) = *(_DWORD *)v21;
            HIDWORD(v27) = *v17;
            v14 = v22;
          }
          v21 += 4;
          ++v18;
        }
        while (v21 < v20[1]);
        v21 = *v20;
      }
      if (v21)
      {
        v20[1] = v21;
        operator delete(v21);
      }
      MEMORY[0x1D82660DC](v20, 0x10C402FEFCB83);
      ++v17;
      v8 = v19;
    }
    while (v17 < (unsigned int *)v26[1]);
    a4 = v25;
    v16 = v26;
    v17 = (unsigned int *)*v26;
    if (!*v26)
      goto LABEL_23;
    goto LABEL_22;
  }
  v18 = 0;
  if (v17)
  {
LABEL_22:
    v16[1] = (char *)v17;
    operator delete(v17);
  }
LABEL_23:
  MEMORY[0x1D82660DC](v16, 0x10C402FEFCB83);
  v24 = HIDWORD(v27);
  *(_DWORD *)a4 = v27;
  *(_DWORD *)(a4 + 4) = v24;
  *(_DWORD *)(a4 + 8) = v12;
  *(_DWORD *)(a4 + 12) = v12;
  *(float *)(a4 + 16) = v14;
  return v18 > 0;
}

uint64_t sub_1D4C84774(_QWORD *a1, uint64_t a2, uint64_t *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v9;
  float (***v11)(_QWORD);
  _QWORD *v12;
  const std::locale::facet *v13;
  int v14;
  std::locale v16;

  if (*(_BYTE *)a2 || !*(_DWORD *)(a2 + 8))
  {
    sub_1D4C84908(a3, a2, a4, (uint64_t)a5);
    return 0;
  }
  else
  {
    v11 = (float (***)(_QWORD))operator new();
    sub_1D4C84D7C((uint64_t)v11, a1);
    *v11 = (float (**)(_QWORD))&unk_1E98639D8;
    if (sub_1D4C84530(v11, a3, a2, a4, a5))
    {
      v9 = 0;
    }
    else
    {
      v12 = sub_1D4C849A0(MEMORY[0x1E0DE4A60], (uint64_t)"AutoLoop empty search space (zero P labels)", 43);
      std::ios_base::getloc((const std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
      v13 = std::locale::use_facet(&v16, MEMORY[0x1E0DE4A90]);
      ((void (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
      std::locale::~locale(&v16);
      std::ostream::put();
      std::ostream::flush();
      v9 = 26;
    }
    v14 = *(_DWORD *)(a2 + 8);
    *(_DWORD *)(a4 + 8) = 0;
    *(_DWORD *)(a4 + 12) = v14;
    MEMORY[0x1D82660DC](v11, 0x10E1C40BE220A8ALL);
  }
  return v9;
}

void sub_1D4C848D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C84908(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BOOL v8;
  int v9;
  int v10;
  int v11;
  int v13;

  v8 = sub_1D4C80C34(a1, (_DWORD *)(a3 + 4), (_DWORD *)a3);
  *(_QWORD *)(a3 + 8) = 0;
  *(_DWORD *)(a3 + 16) = -1082130432;
  if (!v8)
  {
    v9 = *(_DWORD *)(a2 + 4);
    *(_DWORD *)a3 = 0;
    *(_DWORD *)(a3 + 4) = v9;
    printf("Warning: no-opt minimize_bounce_energy had no valid candidates");
  }
  if (a4)
  {
    v10 = sub_1D4C806E0(a1);
    v11 = sub_1D4C806FC(a1);
    v13 = -1082130432;
    sub_1D4C68BB8(a4, (v11 * v10), &v13);
  }
  return 1;
}

_QWORD *sub_1D4C849A0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x1D8266088](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x1E0DE4A90]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!sub_1D4C84B04(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x1D8266094](v13);
  return a1;
}

void sub_1D4C84AA8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x1D8266094](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1D4C84A88);
}

void sub_1D4C84AF0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C84B04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      sub_1D4C84C40(__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_1D4C84C24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_1D4C84C40(_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_1D4C84CE8();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void sub_1D4C84CE8()
{
  sub_1D4C590E4("basic_string");
}

void sub_1D4C84CFC(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 4) = *(_QWORD *)a2;
  *(float *)(a1 + 12) = sub_1D4C8274C((_DWORD *)a2);
}

void sub_1D4C84D34(uint64_t a1, uint64_t a2, int a3)
{
  float v5;

  *(_BYTE *)a1 = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 4) = *(_QWORD *)a2;
  v5 = sub_1D4C8274C((_DWORD *)a2);
  if (!a3)
    v5 = -1.0;
  *(float *)(a1 + 12) = v5;
}

uint64_t sub_1D4C84D7C(uint64_t result, _QWORD *a2)
{
  *(_QWORD *)result = off_1E9863908;
  *(_QWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 8) = -1431655765 * ((a2[1] - *a2) >> 3);
  return result;
}

BOOL sub_1D4C84DAC(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v4;
  BOOL v6;
  unsigned int v7;

  v4 = *(_DWORD *)(a4 + 8);
  if (v4 > a3)
    return 0;
  v6 = v4 == 0;
  v7 = a3 + a2 + v4;
  return !v6 && v7 <= *(_DWORD *)(a4 + 4);
}

BOOL sub_1D4C84DDC(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v4;

  v4 = *(_DWORD *)(a4 + 8);
  if (v4 >> 1 > a3)
    return 0;
  return v4 > 1 && a3 + a2 + (v4 >> 1) <= *(_DWORD *)(a4 + 4);
}

float sub_1D4C84E10(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  float *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v4 = MEMORY[0x1E0C80A78](a4);
    v8 = (float *)((char *)v13 - v7);
    v9 = 0;
    v11 = **(_QWORD **)(v10 + 16);
    do
    {
      v8[v9] = *(float *)(*(_QWORD *)(v11 + 24 * (v6 + v9)) + 4 * (v5 + v6 + v9));
      ++v9;
    }
    while (v4 != v9);
    return sub_1D4C731B4(v4, v8);
  }
  else
  {
    puts("rawLoopEnergy warning: fadeLength = 0 is invalid.");
    return 0.0;
  }
}

void sub_1D4C84EEC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  float *v7;
  int v8;
  int v9;
  uint64_t v10;
  float *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a4 > 1)
  {
    v4 = a4 >> 1;
    v5 = MEMORY[0x1E0C80A78](a1);
    v6 = MEMORY[0x1E0C80A78](v5);
    v11 = (float *)((char *)v16 - v10);
    v12 = 0;
    v13 = 0;
    v14 = **(_QWORD **)(v6 + 16);
    if (v4 <= 1)
      v15 = 1;
    else
      v15 = v4;
    do
    {
      v7[v13] = *(float *)(*(_QWORD *)(v14 + 24 * (v9 + v12)) + 4 * (v9 + v13));
      v11[v13] = *(float *)(*(_QWORD *)(v14 + 24 * (v9 + v8 - 1 + v12))
                          + 4 * (v9 + v8 - 1 + v13));
      ++v13;
      --v12;
    }
    while (v15 != v13);
    sub_1D4C731B4(v4, v7);
    sub_1D4C731B4(v4, v11);
  }
  else
  {
    puts("frameBoomerangLoopEnergy warning: bufLen = 0 is invalid.");
  }
}

float sub_1D4C85044(float (***a1)(_QWORD), uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  float v7;
  float v8;

  v7 = (**a1)(a1);
  v8 = 1.0;
  if (*(float *)(a5 + 12) >= 0.0)
    v8 = sub_1D4C731E4(a3, *(float *)(a5 + 12));
  return v7 * v8;
}

char *sub_1D4C85A28(int a1)
{
  uint64_t v1;
  char *v2;

  v1 = 0;
  while (dword_1E98641E8[v1] != a1)
  {
    v1 += 4;
    if (v1 == 60)
    {
      v2 = byte_1EFEC8028;
      snprintf(byte_1EFEC8028, 0x64uLL, "<Unknown> (%d)", a1);
      return v2;
    }
  }
  return *(char **)&dword_1E98641E8[v1 + 2];
}

char *sub_1D4C85A9C(int a1)
{
  uint64_t v1;
  char *v2;

  v1 = 0;
  while (dword_1E98642D8[v1] != a1)
  {
    v1 += 4;
    if (v1 == 24)
    {
      v2 = byte_1EFEC808C;
      snprintf(byte_1EFEC808C, 0x64uLL, "<Unknown> (%d)", a1);
      return v2;
    }
  }
  return *(char **)&dword_1E98642D8[v1 + 2];
}

uint64_t sub_1D4C85B10(uint64_t a1, CFTypeRef cf)
{
  unint64_t *v3;
  uint64_t v4;
  unint64_t v5;

  *(_QWORD *)(a1 + 40) = 0;
  v3 = (unint64_t *)(a1 + 40);
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)a1 = cf;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_WORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 64) = 13;
  *(_BYTE *)(a1 + 68) = 0;
  CFRetain(cf);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48) - v4;
  if (v5 > 0xFE)
  {
    if (v5 != 255)
      *(_QWORD *)(a1 + 48) = v4 + 255;
  }
  else
  {
    sub_1D4C6261C(v3, 255 - v5);
  }
  return a1;
}

void sub_1D4C85B98(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 48) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D4C85BB8(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  void *v5;

  v2 = *(const void **)a1;
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)a1 = 0;
  }
  v3 = *(const void **)(a1 + 8);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 8) = 0;
  }
  v4 = *(const void **)(a1 + 16);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 16) = 0;
  }
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    *(_QWORD *)(a1 + 48) = v5;
    operator delete(v5);
  }
  return a1;
}

uint64_t sub_1D4C85C20(uint64_t a1)
{
  unsigned int v2;
  UInt8 *v3;
  CFIndex v4;
  BOOL v5;
  FILE *v6;
  const char *v7;
  size_t v8;
  uint64_t result;
  BOOL v10;
  BOOL v11;
  unsigned int v12;
  UInt8 *v13;
  CFIndex v14;
  unsigned int v15;
  CFDataRef v16;
  UInt8 bytes[4];
  unsigned __int8 v18;
  __int16 v19;
  UInt8 buffer[2];
  char v21;
  __int16 v22;
  char v23;

  v2 = 6;
  v3 = buffer;
  do
  {
    v4 = CFReadStreamRead(*(CFReadStreamRef *)a1, v3, v2);
    if (v4 < 0)
      return 3;
    if (!v4)
      return 1;
    v3 += v4;
    v2 -= v4;
  }
  while (v2);
  v5 = *(unsigned __int16 *)buffer == 18759 && v21 == 70;
  if (v5 && (v22 == 14648 ? (v10 = v23 == 97) : (v10 = 0), v10 || (v22 == 14136 ? (v11 = v23 == 97) : (v11 = 0), v11)))
  {
    *(_QWORD *)(a1 + 8) = CFDataCreate(0, buffer, 6);
    v12 = 7;
    v13 = bytes;
    while (1)
    {
      v14 = CFReadStreamRead(*(CFReadStreamRef *)a1, v13, v12);
      if (v14 < 1)
        break;
      v13 += v14;
      v12 -= v14;
      if (!v12)
      {
        *(_DWORD *)(a1 + 24) = *(_DWORD *)bytes;
        v15 = v18;
        *(_BYTE *)(a1 + 28) = v18 >> 7;
        *(_BYTE *)(a1 + 29) = (v15 >> 4) & 7;
        *(_BYTE *)(a1 + 30) = (v15 & 8) != 0;
        *(_BYTE *)(a1 + 31) = v15 & 7;
        *(_WORD *)(a1 + 32) = v19;
        v16 = CFDataCreate(0, bytes, 7);
        result = 0;
        *(_QWORD *)(a1 + 16) = v16;
        *(_DWORD *)(a1 + 64) = 0;
        return result;
      }
    }
    v6 = (FILE *)*MEMORY[0x1E0C80C10];
    v7 = "GIFParser::init: short Logical Screen Descriptor\n";
    v8 = 49;
  }
  else
  {
    v6 = (FILE *)*MEMORY[0x1E0C80C10];
    v7 = "GIFParser::init: bad signature\n";
    v8 = 31;
  }
  fwrite(v7, v8, 1uLL, v6);
  return 2;
}

uint64_t sub_1D4C85DB0(uint64_t a1, __CFData *a2)
{
  unsigned int v4;
  UInt8 *p_buffer;
  CFIndex v6;
  unsigned int v7;
  UInt8 *v8;
  CFIndex v9;
  uint64_t v10;
  FILE *v11;
  const char *v12;
  size_t v13;
  UInt8 buffer;

uint64_t sub_1D4C85EC4(uint64_t a1, int *a2, __CFData **a3)
{
  UInt8 *v6;
  unsigned int v7;
  CFIndex v8;
  __CFData *Mutable;
  uint64_t v10;
  uint64_t v11;
  int v13;
  UInt8 bytes[2];

  strcpy((char *)bytes, "!");
  v6 = &bytes[1];
  v7 = 1;
  do
  {
    v8 = CFReadStreamRead(*(CFReadStreamRef *)a1, v6, v7);
    if (v8 < 0)
    {
      v11 = 3;
LABEL_9:
      fwrite("GIFParser::parseExtension: error reading extension label\n", 0x39uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
      return v11;
    }
    if (!v8)
    {
      v11 = 1;
      goto LABEL_9;
    }
    v6 += v8;
    v7 -= v8;
  }
  while (v7);
  Mutable = CFDataCreateMutable(0, 0);
  CFDataAppendBytes(Mutable, bytes, 2);
  v10 = sub_1D4C85DB0(a1, Mutable);
  if ((_DWORD)v10)
  {
    v11 = v10;
    CFRelease(Mutable);
  }
  else
  {
    if ((bytes[1] + 7) > 8u)
      v13 = 8;
    else
      v13 = dword_1D4C9563C[(char)(bytes[1] + 7)];
    v11 = 0;
    *a2 = v13;
    *a3 = Mutable;
    *(_DWORD *)(a1 + 64) = 12;
  }
  return v11;
}

uint64_t sub_1D4C85FE8(uint64_t a1, _DWORD *a2, CFDataRef *a3)
{
  UInt8 *v6;
  unsigned int v7;
  CFIndex v8;
  int v9;
  uint64_t result;
  UInt8 bytes;
  char v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  bytes = 44;
  v6 = (UInt8 *)&v12;
  v7 = 9;
  do
  {
    v8 = CFReadStreamRead(*(CFReadStreamRef *)a1, v6, v7);
    if (v8 < 1)
    {
      fwrite("GIFParser::init: error reaching image Descriptor\n", 0x31uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
      return 2;
    }
    v6 += v8;
    v7 -= v8;
  }
  while (v7);
  v9 = 10;
  *a3 = CFDataCreate(0, &bytes, 10);
  if (v13 < 0)
  {
    *(_BYTE *)(a1 + 68) = v13 & 7;
    v9 = 3;
  }
  result = 0;
  *(_DWORD *)(a1 + 64) = v9;
  *a2 = 9;
  return result;
}

__CFData *sub_1D4C860EC(const __CFData *a1)
{
  __CFData *Mutable;
  CFIndex Length;
  const UInt8 *BytePtr;
  CFIndex v5;
  UInt8 v7;
  UInt8 v8;
  UInt8 bytes[2];

  Mutable = CFDataCreateMutable(0, 0);
  *(_WORD *)bytes = -479;
  CFDataAppendBytes(Mutable, bytes, 2);
  Length = CFDataGetLength(a1);
  BytePtr = CFDataGetBytePtr(a1);
  do
  {
    if (Length >= 255)
      v5 = 255;
    else
      v5 = Length;
    v8 = v5;
    CFDataAppendBytes(Mutable, &v8, 1);
    CFDataAppendBytes(Mutable, BytePtr, v5);
    BytePtr += v5;
    Length -= v5;
  }
  while (Length);
  v7 = 0;
  CFDataAppendBytes(Mutable, &v7, 1);
  return Mutable;
}

uint64_t sub_1D4C861B0(uint64_t a1, int *a2, CFDataRef *a3)
{
  const __CFData *v4;
  const __CFData *v5;
  int v6;
  uint64_t v9;
  size_t v10;
  UInt8 *v11;
  unsigned int v12;
  CFIndex v13;
  CFDataRef v14;
  int v15;
  int v16;
  char v17;
  int v19;
  FILE *v20;
  char *v21;
  unsigned int v22;
  UInt8 **v23;
  CFIndex v24;
  __CFData *Mutable;
  uint64_t v26;
  unsigned int v27;
  UInt8 **v28;
  CFIndex v29;
  FILE *v30;
  const char *v31;
  size_t v32;
  UInt8 *buffer[3];

  *a2 = 12;
  *a3 = 0;
  if (!*(_QWORD *)a1 || (v4 = *(const __CFData **)(a1 + 8)) == 0 || (v5 = *(const __CFData **)(a1 + 16)) == 0)
  {
LABEL_13:
    fwrite("GIFParser::nextBlock: init was unsuccessful\n", 0x2CuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    return 4;
  }
  v6 = *(_DWORD *)(a1 + 64);
  v9 = 1;
  switch(v6)
  {
    case 0:
      *a2 = 0;
      *a3 = v4;
      CFRetain(v4);
      v19 = 1;
      goto LABEL_49;
    case 1:
      *a2 = 1;
      *a3 = v5;
      CFRetain(*(CFTypeRef *)(a1 + 16));
      if (!*(_BYTE *)(a1 + 28))
        goto LABEL_48;
      *(_DWORD *)(a1 + 64) = 2;
      *(_BYTE *)(a1 + 68) = *(_BYTE *)(a1 + 31);
      return 0;
    case 2:
    case 3:
      v10 = (3 * (2 << *(_BYTE *)(a1 + 68)));
      sub_1D4C624F4(buffer, v10);
      v11 = buffer[0];
      v12 = v10;
      while (1)
      {
        v13 = CFReadStreamRead(*(CFReadStreamRef *)a1, v11, v12);
        if (v13 < 0)
          break;
        if (!v13)
        {
          v9 = 1;
          goto LABEL_35;
        }
        v11 += v13;
        v12 -= v13;
        if (!v12)
        {
          v14 = CFDataCreate(0, buffer[0], v10);
          v9 = 0;
          *a3 = v14;
          v15 = *(_DWORD *)(a1 + 64);
          *a2 = v15;
          if (v15 == 2)
            v16 = 12;
          else
            v16 = 10;
          *(_DWORD *)(a1 + 64) = v16;
          v17 = 1;
LABEL_36:
          if (buffer[0])
          {
            buffer[1] = buffer[0];
            operator delete(buffer[0]);
          }
          if ((v17 & 1) != 0)
            return 0;
          return v9;
        }
      }
      v9 = 3;
LABEL_35:
      fwrite("GIFParser::nextBlock: error reading color table\n", 0x30uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
      v17 = 0;
      goto LABEL_36;
    case 10:
      LOBYTE(buffer[0]) = 0;
      v22 = 1;
      v23 = buffer;
      while (1)
      {
        v24 = CFReadStreamRead(*(CFReadStreamRef *)a1, (UInt8 *)v23, v22);
        if (v24 < 0)
        {
          v9 = 3;
          goto LABEL_43;
        }
        if (!v24)
          break;
        v23 = (UInt8 **)((char *)v23 + v24);
        v22 -= v24;
        if (!v22)
        {
          Mutable = CFDataCreateMutable(0, 0);
          CFDataAppendBytes(Mutable, (const UInt8 *)buffer, 1);
          v26 = sub_1D4C85DB0(a1, Mutable);
          if ((_DWORD)v26)
          {
            v9 = v26;
            CFRelease(Mutable);
            return v9;
          }
          *a2 = 10;
          *a3 = Mutable;
LABEL_48:
          v19 = 12;
LABEL_49:
          *(_DWORD *)(a1 + 64) = v19;
          return 0;
        }
      }
      v9 = 1;
LABEL_43:
      v30 = (FILE *)*MEMORY[0x1E0C80C10];
      v31 = "GIFParser::nextBlock: error reading LZW minimum code size\n";
      v32 = 58;
      goto LABEL_46;
    case 12:
      LOBYTE(buffer[0]) = 0;
      v27 = 1;
      v28 = buffer;
      break;
    case 13:
      goto LABEL_13;
    case 14:
      return v9;
    default:
      v20 = (FILE *)*MEMORY[0x1E0C80C10];
      v21 = sub_1D4C85A28(v6);
      fprintf(v20, "GIFParser::nextBlock: internal error (mNextBlockType = %s)\n", v21);
      return 5;
  }
  do
  {
    v29 = CFReadStreamRead(*(CFReadStreamRef *)a1, (UInt8 *)v28, v27);
    if (v29 < 0)
    {
      v9 = 3;
LABEL_45:
      v30 = (FILE *)*MEMORY[0x1E0C80C10];
      v31 = "GIFParser::nextBlock: error reading block descriptor\n";
      v32 = 53;
LABEL_46:
      fwrite(v31, v32, 1uLL, v30);
      return v9;
    }
    if (!v29)
    {
      v9 = 1;
      goto LABEL_45;
    }
    v28 = (UInt8 **)((char *)v28 + v29);
    v27 -= v29;
  }
  while (v27);
  switch(LOBYTE(buffer[0]))
  {
    case ';':
      *a3 = CFDataCreate(0, (const UInt8 *)buffer, 1);
      *a2 = 11;
      v19 = 14;
      goto LABEL_49;
    case ',':
      sub_1D4C85FE8(a1, a2, a3);
      return 0;
    case '!':
      sub_1D4C85EC4(a1, a2, a3);
      return 0;
  }
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "GIFParser::nextBlock: unknown block descriptor (0x%x)\n", LOBYTE(buffer[0]));
  return 2;
}

void sub_1D4C8653C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

__CFData *sub_1D4C8655C(const __CFData *a1, const __CFString *a2)
{
  CFIndex Length;
  const __CFData *ExternalRepresentation;
  CFIndex v6;
  CFIndex v7;
  __CFData *Mutable;
  const UInt8 *BytePtr;
  CFReadStreamRef v10;
  UInt8 *MutableBytePtr;
  __CFWriteStream *v12;

  Length = CFDataGetLength(a1);
  ExternalRepresentation = CFStringCreateExternalRepresentation(0, a2, 0x8000100u, 0);
  v6 = CFDataGetLength(ExternalRepresentation);
  v7 = Length + v6 + (v6 + 254) / 0xFFuLL + 3;
  Mutable = CFDataCreateMutable(0, v7);
  CFDataSetLength(Mutable, v7);
  BytePtr = CFDataGetBytePtr(a1);
  v10 = CFReadStreamCreateWithBytesNoCopy(0, BytePtr, Length, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  v12 = CFWriteStreamCreateWithBuffer(0, MutableBytePtr, v7);
  LODWORD(v7) = sub_1D4C8666C(v10, ExternalRepresentation, v12);
  CFRelease(ExternalRepresentation);
  CFRelease(v10);
  CFRelease(v12);
  if ((_DWORD)v7)
  {
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

uint64_t sub_1D4C8666C(void *a1, const __CFData *a2, __CFWriteStream *a3)
{
  int v6;
  int v7;
  __CFData *v8;
  int v9;
  uint64_t v10;
  FILE *v11;
  const char *v12;
  size_t v13;
  FILE *v14;
  const char *v15;
  size_t v16;
  FILE *v17;
  int v19;
  CFTypeRef cf;
  _BYTE v21[72];

  if (CFReadStreamOpen((CFReadStreamRef)a1))
  {
    if (CFWriteStreamOpen(a3))
    {
      sub_1D4C85BB4((int)v21, a1);
      v6 = sub_1D4C85C20((uint64_t)v21);
      if (v6 == 2)
      {
        v14 = (FILE *)*MEMORY[0x1E0C80C10];
        v15 = "***addGIFCommentStream: not a GIF file\n";
        v16 = 39;
LABEL_16:
        fwrite(v15, v16, 1uLL, v14);
      }
      else
      {
        if (!v6)
        {
          while (1)
          {
            cf = 0;
            v19 = 12;
            v7 = sub_1D4C861B0((uint64_t)v21, &v19, (CFDataRef *)&cf);
            if (v7)
            {
              v17 = (FILE *)*MEMORY[0x1E0C80C10];
              sub_1D4C85A9C(v7);
              fprintf(v17, "***addGIFCommentStream: nextBlock returned %s\n");
              goto LABEL_19;
            }
            if (v19 == 11)
            {
              v8 = sub_1D4C860EC(a2);
              if (!v8)
              {
                v14 = (FILE *)*MEMORY[0x1E0C80C10];
                v15 = "***addGIFCommentStream: error creating comment block\n";
                v16 = 53;
                goto LABEL_16;
              }
              v9 = sub_1D4C868B8(a3, v8);
              CFRelease(v8);
              if (v9)
                break;
            }
            v10 = sub_1D4C868B8(a3, (CFDataRef)cf);
            if ((_DWORD)v10)
            {
              fwrite("***addGIFCommentStream: error writing normal block\n", 0x33uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
              goto LABEL_23;
            }
            CFRelease(cf);
            if (v19 == 11)
              goto LABEL_23;
          }
          fwrite("***addGIFCommentStream: error writing comment block\n", 0x34uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
          v10 = 0xFFFFFFFFLL;
LABEL_23:
          CFWriteStreamClose(a3);
          CFReadStreamClose((CFReadStreamRef)a1);
          goto LABEL_24;
        }
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "***addGIFCommentStream: GIFParser.init returned %d\n");
      }
LABEL_19:
      v10 = 0xFFFFFFFFLL;
LABEL_24:
      sub_1D4C85C1C(v21);
      return v10;
    }
    v11 = (FILE *)*MEMORY[0x1E0C80C10];
    v12 = "***addGIFCommentStream: open(outFile) failed\n";
    v13 = 45;
  }
  else
  {
    v11 = (FILE *)*MEMORY[0x1E0C80C10];
    v12 = "***addGIFCommentStream: open(inFile) failed\n";
    v13 = 44;
  }
  fwrite(v12, v13, 1uLL, v11);
  return 0xFFFFFFFFLL;
}

void sub_1D4C86894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  sub_1D4C85C1C(va);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C868B8(__CFWriteStream *a1, CFDataRef theData)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  CFIndex v6;

  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  while (1)
  {
    v6 = CFWriteStreamWrite(a1, BytePtr, Length);
    if (v6 < 0)
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "CFWriteStreamWrite returned %d\n", v6);
      return 0xFFFFFFFFLL;
    }
    if (!v6)
      break;
    BytePtr += v6;
    Length -= v6;
    if (!Length)
      return 0;
  }
  fwrite("CFWriteStreamWrite returned 0\n", 0x1EuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  return 0xFFFFFFFFLL;
}

uint64_t sub_1D4C86974(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  int v14;
  double v15;
  void *v16;
  uint64_t v17;
  int v18;
  int *v19;
  char *v20;
  int *v21;
  char *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  BOOL v27;
  unsigned int v28;
  uint64_t v29;
  void *v30;
  void *v32;
  id v33;
  void *__p;
  _BYTE *v35;
  uint64_t v36;
  _BYTE v37[8];
  unsigned int v38;
  unint64_t __buf;
  unsigned int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = a5;
  if (!v10)
  {
    NSLog(CFSTR("vpCreateFromFile: NULL output argument"));
    goto LABEL_11;
  }
  v13 = sub_1D4C8C1F8(v10, 1538, 0x180u);
  v14 = v13;
  if (v13 <= 0)
  {
    v19 = __error();
    v20 = strerror(*v19);
    if ((*(_BYTE *)(a4 + 4) & 2) != 0)
      goto LABEL_10;
    goto LABEL_11;
  }
  if (lseek(v13, 0, 0) < 0)
  {
    v21 = __error();
    v20 = strerror(*v21);
    if ((*(_BYTE *)(a4 + 4) & 2) != 0)
    {
LABEL_10:
      v22 = v20;
      objc_msgSend(v10, "path");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Error creating %@: %s\n"), v23, v22);

    }
LABEL_11:
    v17 = 0xFFFFFFFFLL;
    goto LABEL_34;
  }
  v15 = sub_1D4C8D888((uint64_t)v37, 1988465669);
  v16 = (void *)MEMORY[0x1D82662EC](v15);
  __p = 0;
  v35 = 0;
  v36 = 0;
  v17 = sub_1D4C90844(v9, v14, 0, &__p, v11, a4, (uint64_t)v37, v12);
  if (!(_DWORD)v17)
  {
    v32 = v16;
    v33 = v9;
    if (v35 == __p)
    {
LABEL_19:
      v16 = v32;
      v9 = v33;
    }
    else
    {
      v17 = 0;
      v24 = 0;
      v25 = (v35 - (_BYTE *)__p) / 24;
      if (v25 <= 1)
        v26 = 1;
      else
        v26 = (v35 - (_BYTE *)__p) / 24;
      v27 = 1;
      while (1)
      {
        v28 = *(_DWORD *)((char *)__p + v17 + 8);
        __buf = bswap64(*(_QWORD *)((char *)__p + v17));
        v40 = bswap32(v28);
        if (write(v14, &__buf, 0xCuLL) != 12)
          break;
        v27 = ++v24 < v25;
        v17 += 24;
        if (v26 == v24)
          goto LABEL_19;
      }
      v9 = v33;
      NSLog(CFSTR("vpCreateFromFile: error writing CMTime data"));
      v16 = v32;
      if (v27)
      {
LABEL_23:
        v18 = 0;
        v17 = 0xFFFFFFFFLL;
        goto LABEL_27;
      }
    }
    if (!sub_1D4C8E12C((uint64_t)v37, v14))
    {
      if (v12)
        objc_msgSend(v12, "vpcCallback:", 100);
      v18 = 1;
      goto LABEL_27;
    }
    NSLog(CFSTR("***vpCreateFromFile: error in VPHeader.finalize\n"));
    goto LABEL_23;
  }
  v18 = 0;
LABEL_27:
  if (__p)
  {
    v35 = __p;
    operator delete(__p);
  }
  objc_autoreleasePoolPop(v16);
  if (v18)
  {
    if ((*(_BYTE *)(a4 + 4) & 2) != 0)
    {
      v29 = v38;
      objc_msgSend(v10, "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("...wrote %u frames to %@\n"), v29, v30);

    }
    v17 = 0;
  }
  sub_1D4C8D920(v37);
LABEL_34:

  return v17;
}

void sub_1D4C86C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, char a17)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  sub_1D4C8D920(&a17);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C86D14(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void **a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[3];

  v13 = a1;
  v14 = a2;
  v15 = a7;
  v16 = sub_1D4C907AC(v21, a5);
  v17 = (void *)MEMORY[0x1D82662EC](v16);
  v18 = sub_1D4C90844(v13, -1, (uint64_t)v21, a6, v14, a3, a4, v15);
  v19 = v18;
  if (v15 && !(_DWORD)v18)
    objc_msgSend(v15, "vpcCallback:", 100);
  objc_autoreleasePoolPop(v17);
  if (!(_DWORD)v19 && (*(_BYTE *)(a3 + 4) & 2) != 0)
    NSLog(CFSTR("...wrote %u frames to memory\n"), *(unsigned int *)(a4 + 8));

  return v19;
}

void sub_1D4C86E04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C86E24(_QWORD *result)
{
  *result = 1065353216;
  return result;
}

unint64_t sub_1D4C86E30(void *a1, uint64_t a2, double a3, double a4)
{
  id v7;
  void *v8;
  int v9;
  unint64_t v10;
  unsigned int v11;
  double v12;

  v7 = a1;
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "numFrames");
    v10 = 0;
    if (a2 && v9 && a3 != 0.0 && a4 != 0.0)
    {
      v11 = objc_msgSend(v8, "numFrames");
      v12 = 1.5;
      if ((*(_BYTE *)(a2 + 4) & 4) == 0)
        v12 = 3.0;
      v10 = (unint64_t)(a3 * a4 * (double)v11 / (float)(*(float *)a2 * *(float *)a2) * v12);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1D4C86EE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_1D4C877D4(__int16 a1, int a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a1 & 4) != 0 && a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 875704422);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 875704438);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v7, *MEMORY[0x1E0CA9040]);
  }
  else
  {
    if ((a1 & 2) != 0)
      v8 = 1111970369;
    else
      v8 = 32;
    if ((8 * (_BYTE)a1) & 0x20 | a1 & 0x20)
      v9 = 875704438;
    else
      v9 = 875704422;
    if ((8 * (_BYTE)a1) & 0x20 | a1 & 0x30)
      v10 = v9;
    else
      v10 = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, *MEMORY[0x1E0CA9040]);

  }
  v12 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if ((a1 & 0x40) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CA8F78]);
    if ((a1 & 0x80) == 0)
    {
LABEL_16:
      if ((a1 & 0x100) == 0)
        goto LABEL_17;
      goto LABEL_24;
    }
  }
  else if ((a1 & 0x80) == 0)
  {
    goto LABEL_16;
  }
  objc_msgSend(v4, "setObject:forKey:", *v12, *MEMORY[0x1E0CA8F70]);
  if ((a1 & 0x100) == 0)
  {
LABEL_17:
    if ((a1 & 0x200) == 0)
      goto LABEL_18;
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v4, "setObject:forKey:", *v12, *MEMORY[0x1E0CA9020]);
  if ((a1 & 0x200) == 0)
  {
LABEL_18:
    if ((a1 & 0x400) == 0)
      goto LABEL_19;
LABEL_26:
    objc_msgSend(v4, "setObject:forKey:", *v12, *MEMORY[0x1E0CA9028]);
    if ((a1 & 0x800) == 0)
      return v4;
    goto LABEL_20;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v14, *MEMORY[0x1E0CA8FF0]);

  if ((a1 & 0x400) != 0)
    goto LABEL_26;
LABEL_19:
  if ((a1 & 0x800) != 0)
LABEL_20:
    objc_msgSend(v4, "setObject:forKey:", *v12, *MEMORY[0x1E0CA9010]);
  return v4;
}

void sub_1D4C87EA8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "trackOutput");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copyNextSampleBuffer");

  objc_msgSend(*(id *)(a1 + 32), "readaheadLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  objc_msgSend(*(id *)(a1 + 32), "setReadaheadBuf:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setReadaheadState:", 2);
  objc_msgSend(*(id *)(a1 + 32), "readaheadLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "broadcast");

  objc_msgSend(*(id *)(a1 + 32), "readaheadLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

char *sub_1D4C8852C(unsigned int a1)
{
  char *v1;

  if (a1 < 6)
    return off_1E9864360[a1];
  v1 = byte_1EFEC80F0;
  snprintf(byte_1EFEC80F0, 0x64uLL, "<<<Unknown (%d)>>>", a1);
  return v1;
}

uint64_t sub_1D4C88588(char a1)
{
  unsigned int v1;
  unsigned int v2;

  if ((a1 & 2) != 0)
    v1 = 1111970369;
  else
    v1 = 32;
  if ((8 * a1) & 0x20 | a1 & 0x20)
    v2 = 875704438;
  else
    v2 = 875704422;
  if ((8 * a1) & 0x20 | a1 & 0x30)
    return v2;
  else
    return v1;
}

uint64_t sub_1D4C885C8(__CVBuffer *a1)
{
  uint64_t PixelFormatType;

  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  return sub_1D4C885DC(PixelFormatType);
}

uint64_t sub_1D4C885DC(uint64_t a1)
{
  if ((int)a1 > 875704437)
  {
    if ((_DWORD)a1 != 1111970369)
    {
      if ((_DWORD)a1 == 875704438)
        return 32;
      goto LABEL_8;
    }
    return 2;
  }
  else
  {
    if ((_DWORD)a1 != 32)
    {
      if ((_DWORD)a1 == 875704422)
        return 16;
LABEL_8:
      NSLog(CFSTR("Warning: unknown pixel buffer format (0x%x)"), a1);
      return 0;
    }
    return 1;
  }
}

uint64_t sub_1D4C88670(int a1, unsigned int a2, unsigned int *a3, int *a4)
{
  int v4;
  uint64_t result;

  if (a1 == 875704438)
  {
    if (a2)
    {
      if (a2 != 1)
        return 0xFFFFFFFFLL;
      v4 = 240;
    }
    else
    {
      v4 = 235;
    }
    a2 = 16;
    goto LABEL_11;
  }
  if (a1 != 875704422 || a2 > 1)
    return 0xFFFFFFFFLL;
  v4 = 255;
LABEL_11:
  result = 0;
  *a3 = a2;
  *a4 = v4;
  return result;
}

uint64_t sub_1D4C886D8(uint64_t a1, char *a2)
{
  uint64_t v4;
  char **v5;
  int v6;
  off_t v7;
  unsigned int v8;
  unint64_t v9;
  size_t v10;
  char *v11;
  char *v12;
  void *v13;
  unsigned int v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  __int128 v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  __int128 v26;
  char *v27;
  char *v28;
  char *v29;
  __int128 v30;
  void *exception;
  void *v33;
  CMTime v34;

  *(_QWORD *)a1 = &off_1E9863968;
  v4 = a1 + 8;
  sub_1D4C8D888(a1 + 8, 1988465669);
  *(_QWORD *)(a1 + 200) = 0;
  *(_DWORD *)(a1 + 120) = -1;
  *(_QWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = &off_1E98638E8;
  *(_OWORD *)(a1 + 160) = 0u;
  v5 = (char **)(a1 + 160);
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_DWORD *)(a1 + 192) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  v6 = sub_1D4C8C090(a2, 0, 0);
  *(_DWORD *)(a1 + 120) = v6;
  if (v6 <= 0)
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "VideoParser: error opening %s\n", a2);
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D8266058](exception, "File open error");
    goto LABEL_29;
  }
  if (sub_1D4C8D948(v4, v6))
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "VideoParser: error reading header from %s\n", a2);
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D8266058](exception, "VPHeader error");
LABEL_29:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  v7 = lseek(*(_DWORD *)(a1 + 120), 0, 1);
  sub_1D4C88AB4((_DWORD *)a1);
  v8 = *(_DWORD *)(a1 + 16);
  v9 = v7 + v8 * (unint64_t)*(unsigned int *)(a1 + 192);
  v10 = v9 + 12 * v8;
  *(_QWORD *)(a1 + 200) = v10;
  v11 = (char *)mmap(0, v10, 1, 2, *(_DWORD *)(a1 + 120), 0);
  v12 = v11;
  *(_QWORD *)(a1 + 128) = v11;
  if (!v11)
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "VideoParser: mmap(%s, %llu) failed\n", a2, *(_QWORD *)(a1 + 200));
    v33 = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D8266058](v33, "mmap error");
    __cxa_throw(v33, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  *(_QWORD *)(a1 + 184) = &v11[v7];
  v13 = *(void **)(a1 + 160);
  if (v13)
  {
    *(_QWORD *)(a1 + 168) = v13;
    operator delete(v13);
    *v5 = 0;
    *(_QWORD *)(a1 + 168) = 0;
    *(_QWORD *)(a1 + 176) = 0;
  }
  *v5 = 0;
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  if (*(_DWORD *)(a1 + 16))
  {
    v14 = 0;
    v15 = &v12[v9];
    do
    {
      CMTimeMake(&v34, bswap64(*(_QWORD *)v15), bswap32(*((_DWORD *)v15 + 2)));
      v17 = *(_QWORD *)(a1 + 168);
      v16 = *(_QWORD *)(a1 + 176);
      if (v17 >= v16)
      {
        v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v17 - (_QWORD)*v5) >> 3);
        v21 = v20 + 1;
        if (v20 + 1 > 0xAAAAAAAAAAAAAAALL)
          sub_1D4C590D0();
        v22 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - (_QWORD)*v5) >> 3);
        if (2 * v22 > v21)
          v21 = 2 * v22;
        if (v22 >= 0x555555555555555)
          v23 = 0xAAAAAAAAAAAAAAALL;
        else
          v23 = v21;
        if (v23)
          v24 = (char *)sub_1D4C59158(a1 + 176, v23);
        else
          v24 = 0;
        v25 = &v24[24 * v20];
        v26 = *(_OWORD *)&v34.value;
        *((_QWORD *)v25 + 2) = v34.epoch;
        *(_OWORD *)v25 = v26;
        v28 = *(char **)(a1 + 160);
        v27 = *(char **)(a1 + 168);
        v29 = v25;
        if (v27 != v28)
        {
          do
          {
            v30 = *(_OWORD *)(v27 - 24);
            *((_QWORD *)v29 - 1) = *((_QWORD *)v27 - 1);
            *(_OWORD *)(v29 - 24) = v30;
            v29 -= 24;
            v27 -= 24;
          }
          while (v27 != v28);
          v27 = *v5;
        }
        v19 = v25 + 24;
        *(_QWORD *)(a1 + 160) = v29;
        *(_QWORD *)(a1 + 168) = v25 + 24;
        *(_QWORD *)(a1 + 176) = &v24[24 * v23];
        if (v27)
          operator delete(v27);
      }
      else
      {
        v18 = *(_OWORD *)&v34.value;
        *(_QWORD *)(v17 + 16) = v34.epoch;
        *(_OWORD *)v17 = v18;
        v19 = (char *)(v17 + 24);
      }
      v15 += 12;
      *(_QWORD *)(a1 + 168) = v19;
      ++v14;
    }
    while (v14 < *(_DWORD *)(a1 + 16));
  }
  return a1;
}

void sub_1D4C88A50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  _QWORD *v11;
  void **v12;
  void *v13;
  void *v15;
  void *v16;

  __cxa_free_exception(v13);
  v15 = *v12;
  if (*v12)
  {
    v11[21] = v15;
    operator delete(v15);
  }
  v11[17] = &off_1E98638E8;
  v16 = (void *)v11[18];
  if (v16)
    free(v16);
  sub_1D4C8D920(a11);
  _Unwind_Resume(a1);
}

_DWORD *sub_1D4C88AB4(_DWORD *result)
{
  _DWORD *v1;
  unsigned int v2;
  uint64_t v3;

  result[48] = 0;
  if (result[17])
  {
    v1 = result;
    v2 = 0;
    v3 = (uint64_t)(result + 2);
    do
    {
      result = (_DWORD *)sub_1D4C8E1A4(v3, v2);
      v1[48] += result[1] * result[2];
      ++v2;
    }
    while (v2 < v1[17]);
  }
  return result;
}

_QWORD *sub_1D4C88B18(_QWORD *a1)
{
  void *v2;

  *a1 = &off_1E98638E8;
  v2 = (void *)a1[1];
  if (v2)
    free(v2);
  return a1;
}

uint64_t sub_1D4C88B54(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  void *exception;
  void *__p;
  _BYTE *v15;
  uint64_t v16;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  *(_QWORD *)a1 = &off_1E9863968;
  sub_1D4C8D888(a1 + 8, 1988465669);
  *(_QWORD *)(a1 + 136) = &off_1E98638E8;
  *(_DWORD *)(a1 + 120) = -1;
  *(_QWORD *)(a1 + 128) = 0;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_DWORD *)(a1 + 192) = 0;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  __p = 0;
  v15 = 0;
  v16 = 0;
  if (sub_1D4C86D14(v9, v10, a4, a1 + 8, a1 + 136, &__p, v11))
  {
    fwrite("VideoParser: error instantiating from asset,\n", 0x2DuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D8266058](exception, "VideoParser error");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a1 + 144);
  if ((void **)(a1 + 160) != &__p)
    sub_1D4C6454C((char *)(a1 + 160), (char *)__p, (uint64_t)v15, 0xAAAAAAAAAAAAAAABLL * ((v15 - (_BYTE *)__p) >> 3));
  sub_1D4C88AB4((_DWORD *)a1);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }

  return a1;
}

void sub_1D4C88CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *__p, uint64_t a11)
{
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void **v17;
  void **v18;
  uint64_t v19;
  void *v21;

  __cxa_free_exception(a9);
  if (__p)
    operator delete(__p);
  v21 = *v17;
  if (*v17)
  {
    *(_QWORD *)(v14 + 168) = v21;
    operator delete(v21);
  }
  *v16 = v19;
  if (*v18)
    free(*v18);
  sub_1D4C8D920(v15);

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C88D60(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;

  *(_QWORD *)a1 = &off_1E9863968;
  v2 = *(void **)(a1 + 128);
  if (v2)
    munmap(v2, *(_QWORD *)(a1 + 200));
  v3 = *(_DWORD *)(a1 + 120);
  if (v3 >= 1)
    close(v3);
  v4 = *(void **)(a1 + 160);
  if (v4)
  {
    *(_QWORD *)(a1 + 168) = v4;
    operator delete(v4);
  }
  *(_QWORD *)(a1 + 136) = &off_1E98638E8;
  v5 = *(void **)(a1 + 144);
  if (v5)
    free(v5);
  sub_1D4C8D920(a1 + 8);
  return a1;
}

void sub_1D4C88DE4(uint64_t a1)
{
  sub_1D4C88D60(a1);
  JUMPOUT(0x1D82660DCLL);
}

uint64_t sub_1D4C88E08(uint64_t a1, unsigned int a2)
{
  return sub_1D4C8E1A4(a1 + 8, a2);
}

void sub_1D4C88E10(_QWORD *a1)
{
  void *v1;

  *a1 = &off_1E98638E8;
  v1 = (void *)a1[1];
  if (v1)
    free(v1);
  JUMPOUT(0x1D82660DCLL);
}

id sub_1D4C88E58(void *a1, uint64_t a2, int a3, __int128 *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, double a10)
{
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;

  v19 = a1;
  v20 = v19;
  v21 = v19;
  if (a2)
  {
    sub_1D4C88F54(v19, a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  sub_1D4C890C0(v21, a5, a6, a7, a8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  sub_1D4C891D0(v22, a3, a9, a10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    sub_1D4C89418(v23, a4);
    v24 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v24;
  }

  return v23;
}

id sub_1D4C88F54(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint64_t i;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v12;
  __int128 v13;
  double v14[3];
  double v15[3];
  double v16[10];

  v16[9] = *(double *)MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  for (i = 0; i != 9; ++i)
    v16[i] = *(float *)(a2 + 4 * i);
  objc_msgSend(v3, "extent");
  v7 = v6;
  objc_msgSend(v4, "extent");
  v15[1] = v8;
  v15[2] = 1.0;
  v14[0] = v7;
  v14[1] = v8;
  v14[2] = 1.0;
  v15[0] = 0.0;
  v12 = v7;
  v13 = xmmword_1D4C95680;
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIPerspectiveTransform"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v4, CFSTR("inputImage"));
  sub_1D4C89588(v15, v16, v9, CFSTR("inputTopLeft"));
  sub_1D4C89588(v14, v16, v9, CFSTR("inputTopRight"));
  sub_1D4C89588(dbl_1D4C95690, v16, v9, CFSTR("inputBottomLeft"));
  sub_1D4C89588(&v12, v16, v9, CFSTR("inputBottomRight"));
  objc_msgSend(v9, "outputImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id sub_1D4C890C0(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGRect v18;
  CGRect v19;

  v9 = a1;
  objc_msgSend(v9, "extent");
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  if (CGRectEqualToRect(v18, v19) || a4 == 0.0 || a5 == 0.0)
  {
    v13 = v9;
  }
  else
  {
    v10 = trunc(a5);
    v11 = trunc(a2);
    v12 = trunc(a3);
    objc_msgSend(v9, "imageByCroppingToRect:", v11, v12, trunc(a4), v10);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v11 != 0.0 || v12 != 0.0)
    {
      memset(&v17, 0, sizeof(v17));
      CGAffineTransformMakeTranslation(&v17, -v11, -v12);
      v16 = v17;
      objc_msgSend(v13, "imageByApplyingTransform:", &v16);
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (id)v14;
    }
  }

  return v13;
}

id sub_1D4C891D0(void *a1, int a2, double a3, double a4)
{
  id v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  void *v23;
  CGAffineTransform v24;
  CGAffineTransform v25;

  v7 = a1;
  objc_msgSend(v7, "extent");
  v10 = a3 == v9 && a4 == v8;
  if (v10 || a3 == 0.0 || a4 == 0.0)
  {
    v16 = v7;
LABEL_12:
    v15 = v16;
    goto LABEL_13;
  }
  v11 = trunc(a3);
  if (a2 == 2)
  {
    v18 = trunc(a4);
    objc_msgSend(v7, "extent");
    v20 = v11 / v19;
    objc_msgSend(v7, "extent");
    memset(&v25, 0, sizeof(v25));
    CGAffineTransformMakeScale(&v25, v20, v18 / v21);
    v24 = v25;
    objc_msgSend(v7, "imageByApplyingTransform:highQualityDownsample:", &v24, 1);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (a2 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIBicubicScaleTransform"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDefaults");
    objc_msgSend(v12, "setValue:forKey:", &unk_1E986D088, CFSTR("inputB"));
    objc_msgSend(v12, "setValue:forKey:", &unk_1E986D098, CFSTR("inputC"));
    objc_msgSend(v12, "setValue:forKey:", v7, *MEMORY[0x1E0C9E1F8]);
    objc_msgSend(v7, "extent");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 / v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v23, *MEMORY[0x1E0C9E268]);

    objc_msgSend(v12, "outputImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a2)
    {
      NSLog(CFSTR("alResizeTransform: Invalid scaling method."));
      v15 = 0;
      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CILanczosScaleTransform"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDefaults");
    objc_msgSend(v12, "setValue:forKey:", v7, *MEMORY[0x1E0C9E1F8]);
    objc_msgSend(v7, "extent");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 / v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v14, *MEMORY[0x1E0C9E268]);
    objc_msgSend(v12, "outputImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_13:

  return v15;
}

id sub_1D4C89418(void *a1, __int128 *a2)
{
  id v3;
  __int128 v4;
  id v5;
  __int128 v6;
  float v7;
  float v8;
  float v9;
  float v10;
  void *v11;
  CGAffineTransform v13;
  CGAffineTransform t1;
  CGAffineTransform v15;
  __int128 v16;
  __int128 v17;
  CGAffineTransform v18;
  CGRect v19;
  CGRect v20;

  v3 = a1;
  if (a2
    && (v4 = a2[1],
        *(_OWORD *)&v18.a = *a2,
        *(_OWORD *)&v18.c = v4,
        *(_OWORD *)&v18.tx = a2[2],
        !CGAffineTransformIsIdentity(&v18)))
  {
    v6 = a2[1];
    v16 = *a2;
    v17 = v6;
    objc_msgSend(v3, "extent");
    v7 = v19.size.width * 0.5;
    *(_OWORD *)&v18.a = v16;
    *(_OWORD *)&v18.c = v17;
    v8 = v19.size.height * 0.5;
    v18.tx = 0.0;
    v18.ty = 0.0;
    v20 = CGRectApplyAffineTransform(v19, &v18);
    v9 = v20.size.width * 0.5;
    v10 = v20.size.height * 0.5;
    CGAffineTransformMakeTranslation(&v18, (float)-v7, (float)-v8);
    v15 = v18;
    objc_msgSend(v3, "imageByApplyingTransform:", &v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeTranslation(&v15, v9, v10);
    v18 = v15;
    *(_OWORD *)&t1.a = v16;
    *(_OWORD *)&t1.c = v17;
    t1.tx = 0.0;
    t1.ty = 0.0;
    v13 = v15;
    CGAffineTransformConcat(&v15, &t1, &v13);
    v18 = v15;
    objc_msgSend(v11, "imageByApplyingTransform:", &v15);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

void sub_1D4C89588(double *a1, double *a2, void *a3, void *a4)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v5 = a1[1];
  v6 = a1[2];
  v7 = a2[1] * v5 + *a2 * *a1 + a2[2] * v6;
  v8 = v5 * a2[4] + a2[3] * *a1 + a2[5] * v6;
  v9 = 1.0 / (v5 * a2[7] + a2[6] * *a1 + a2[8] * v6);
  v10 = v7 * v9;
  v11 = v8 * v9;
  v12 = (void *)MEMORY[0x1E0C9DDF8];
  v13 = a4;
  v14 = a3;
  objc_msgSend(v12, "vectorWithX:Y:", v10, v11);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forKey:", v15, v13);

}

double sub_1D4C89658(uint64_t a1)
{
  double result;

  *(_DWORD *)(a1 + 32) = 1065353216;
  *(_QWORD *)&result = 1065353216;
  *(_OWORD *)a1 = xmmword_1D4C956A8;
  *(_OWORD *)(a1 + 16) = unk_1D4C956B8;
  return result;
}

void sub_1D4C8975C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4C897D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C89B98(CGImage *a1, int a2, int a3, CGColorSpace *ColorSpace, int a5, int a6, uint64_t a7, void **a8)
{
  unsigned __int8 BitsPerPixel;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  uint32_t BitmapInfo;
  int v21;
  unint64_t v22;
  int v23;
  CGImageAlphaInfo AlphaInfo;
  void **v25;
  int v27;
  size_t v28;
  void *v29;
  CGContext *v30;
  CGContext *v31;
  void **v32;
  CGRect v33;

  *(_QWORD *)a7 = CGImageGetWidth(a1);
  *(_QWORD *)(a7 + 8) = CGImageGetHeight(a1);
  *(_BYTE *)(a7 + 16) = CGImageGetBitsPerComponent(a1);
  BitsPerPixel = CGImageGetBitsPerPixel(a1);
  *(_BYTE *)(a7 + 17) = BitsPerPixel;
  v17 = *(unsigned __int8 *)(a7 + 16);
  if (v17 == 8)
  {
    v32 = a8;
    v18 = 1;
    if (ColorSpace)
      goto LABEL_7;
  }
  else
  {
    if (v17 != 16)
    {
      printf("***BIBitmapFromImage: %u bitsPerComponents not supported\n", *(unsigned __int8 *)(a7 + 16));
      return 0xFFFFFFFFLL;
    }
    v32 = a8;
    v18 = 2;
    if (ColorSpace)
      goto LABEL_7;
  }
  ColorSpace = CGImageGetColorSpace(a1);
  if (!ColorSpace)
  {
    fwrite("***BIBitmapFromImage: erro obtaining color space from image\n", 0x3CuLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    return 0xFFFFFFFFLL;
  }
LABEL_7:
  v19 = BitsPerPixel / v17;
  if (v19 != 1)
  {
    if (a6)
      v23 = 6;
    else
      v23 = 5;
    *(_QWORD *)(a7 + 24) = *(_QWORD *)a7 * 4 * v18;
    if (v19 == 4)
    {
      AlphaInfo = CGImageGetAlphaInfo(a1);
      if (AlphaInfo <= kCGImageAlphaNoneSkipFirst && ((1 << AlphaInfo) & 0x61) != 0)
      {
        *(_BYTE *)(a7 + 17) = 3 * *(_BYTE *)(a7 + 16);
      }
      else if (a6)
      {
        v23 = 2;
      }
      else
      {
        v23 = 1;
      }
    }
    if (a5)
      v27 = 0x4000;
    else
      v27 = 0x2000;
    BitmapInfo = v23 | v27;
    v18 = 4;
    if (a2)
      goto LABEL_9;
LABEL_32:
    v22 = *(_QWORD *)(a7 + 24);
    goto LABEL_33;
  }
  *(_QWORD *)(a7 + 24) = *(_QWORD *)a7 * v18;
  BitmapInfo = CGImageGetBitmapInfo(a1);
  if (!a2)
    goto LABEL_32;
LABEL_9:
  if (!a3)
  {
    fwrite("***Pad size of 0 invalid\n", 0x19uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    v25 = v32;
    goto LABEL_36;
  }
  if (a2 == 1)
    v21 = v18;
  else
    v21 = 1;
  v22 = ((unint64_t)(v21 * a3) + *(_QWORD *)(a7 + 24) - 1)
      / (v21 * a3)
      * (v21 * a3);
  *(_QWORD *)(a7 + 24) = v22;
LABEL_33:
  v28 = *(_QWORD *)(a7 + 8) * v22;
  v29 = malloc_type_malloc(v28, 0x20AD519uLL);
  v25 = v32;
  *v32 = v29;
  bzero(v29, v28);
  v30 = CGBitmapContextCreate(*v32, *(_QWORD *)a7, *(_QWORD *)(a7 + 8), *(unsigned __int8 *)(a7 + 16), *(_QWORD *)(a7 + 24), ColorSpace, BitmapInfo);
  if (v30)
  {
    v31 = v30;
    CGContextSetInterpolationQuality(v30, kCGInterpolationHigh);
    v33.size.width = (double)*(unint64_t *)a7;
    v33.size.height = (double)*(unint64_t *)(a7 + 8);
    v33.origin.x = 0.0;
    v33.origin.y = 0.0;
    CGContextDrawImage(v31, v33, a1);
    CFRelease(v31);
    return 0;
  }
  fwrite("***BIBitmapFromImage: Error creating CGBitmapContext\n", 0x35uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
LABEL_36:
  if (*v25)
  {
    free(*v25);
    *v25 = 0;
  }
  return 1;
}

void sub_1D4C8A42C()
{
  __assert_rtn("+[LoopQuicktimeMetadata metadataDictionaryForAssetURL:]", "LoopQuicktimeMetadata.m", 72, "err == NULL");
}

uint64_t sub_1D4C8A454(uint64_t a1, uint64_t a2, __int128 *a3, CMTime *a4)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  CMTime *v8;
  _OWORD *v11;
  _OWORD *v12;
  __int128 v13;
  __int128 *v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  void *v18;
  __int128 *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  __int128 *v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  CMTimeEpoch epoch;
  const char *v33;
  int v34;
  void *exception;
  CMTime v36;
  CMTime v37;
  CMTime v38;
  CMTime v39;
  CMTime v40;
  CMTime v41;
  CMTime v42;
  CMTime v43;
  CMTime rhs;
  CMTime lhs;
  CMTime v46;
  __int128 v47;
  uint64_t v48;
  CMTime time2;
  CMTime time1;

  *(_QWORD *)a1 = off_1E9863B58;
  *(_OWORD *)(a1 + 8) = 0u;
  v5 = (uint64_t *)(a1 + 8);
  v6 = a1 + 32;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_DWORD *)(a1 + 56) = 0;
  v7 = *((_QWORD *)a3 + 2);
  *(_OWORD *)(a1 + 60) = *a3;
  *(_QWORD *)(a1 + 76) = v7;
  v8 = (CMTime *)MEMORY[0x1E0CA2E68];
  *(_OWORD *)(a1 + 84) = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)(a1 + 100) = v8->epoch;
  if (!a2)
  {
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D8266058](exception, "FrameTimeNormalizer constructor requires valid FramPresTimeArray.");
    goto LABEL_30;
  }
  if (v5 != (uint64_t *)a2)
    sub_1D4C6454C((char *)(a1 + 8), *(char **)a2, *(_QWORD *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 3));
  v11 = (_OWORD *)(a1 + 60);
  v12 = (_OWORD *)(a1 + 84);
  if ((~*(_DWORD *)(a1 + 72) & 0x11) == 0)
  {
    sub_1D4C91FA0(v5, 0, (uint64_t)&v47);
    *v11 = v47;
    *(_QWORD *)(a1 + 76) = v48;
    goto LABEL_8;
  }
  *(_OWORD *)&time1.value = *v11;
  time1.epoch = *(_QWORD *)(a1 + 76);
  time2 = *v8;
  if (!CMTimeCompare(&time1, &time2))
  {
    fwrite("***FrameTimeNormalizer invalid zero normFrameTime\n", 0x32uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D8266058](exception, "Unsupported normFrameTime");
LABEL_30:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  v13 = *a3;
  *(_QWORD *)(a1 + 76) = *((_QWORD *)a3 + 2);
  *v11 = v13;
LABEL_8:
  v14 = *(__int128 **)(a1 + 8);
  v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - (_QWORD)v14) >> 3);
  v16 = -1431655765 * ((uint64_t)(*(_QWORD *)(a1 + 16) - (_QWORD)v14) >> 3);
  if (-1431655765 * ((uint64_t)(*(_QWORD *)(a1 + 16) - (_QWORD)v14) >> 3))
  {
    v17 = *v14;
    *(_QWORD *)(a1 + 100) = *((_QWORD *)v14 + 2);
    *v12 = v17;
  }
  else
  {
    *v12 = *(_OWORD *)&v8->value;
    *(_QWORD *)(a1 + 100) = v8->epoch;
  }
  if (v15 != v16)
  {
    v33 = "mFramePresTimes.size() == numRawFrames()";
    v34 = 53;
    goto LABEL_26;
  }
  sub_1D4C64A5C(&v46, v15);
  v18 = *(void **)v6;
  if (*(_QWORD *)v6)
  {
    *(_QWORD *)(a1 + 40) = v18;
    operator delete(v18);
    *(_QWORD *)v6 = 0;
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
  }
  *(CMTime *)(a1 + 32) = v46;
  v19 = *(__int128 **)(a1 + 8);
  if (-1431655765 * ((*(_QWORD *)(a1 + 16) - (_QWORD)v19) >> 3) == 1)
  {
    LODWORD(v20) = 0;
  }
  else
  {
    v21 = 0;
    v22 = 0;
    do
    {
      v23 = (__int128 *)((char *)v19 + v21);
      v24 = *(__int128 *)((char *)v23 + 24);
      lhs.epoch = *((_QWORD *)v23 + 5);
      *(_OWORD *)&lhs.value = v24;
      v25 = *v23;
      rhs.epoch = *((_QWORD *)v23 + 2);
      *(_OWORD *)&rhs.value = v25;
      CMTimeSubtract(&v46, &lhs, &rhs);
      ++v22;
      v26 = *(_QWORD *)(a1 + 32) + v21;
      v27 = *(_OWORD *)&v46.value;
      *(_QWORD *)(v26 + 16) = v46.epoch;
      *(_OWORD *)v26 = v27;
      v19 = *(__int128 **)(a1 + 8);
      v20 = -1 - 1431655765 * ((*(_QWORD *)(a1 + 16) - (_QWORD)v19) >> 3);
      v21 += 24;
    }
    while (v22 < v20);
  }
  if ((a4->flags & 0x1D) == 1)
  {
    memset(&v46, 0, sizeof(v46));
    v28 = *v19;
    v43.epoch = *((_QWORD *)v19 + 2);
    *(_OWORD *)&v43.value = v28;
    v42 = *a4;
    CMTimeAdd(&v46, &v43, &v42);
    v41 = *(CMTime *)(*(_QWORD *)(a1 + 8)
                    + 24 * (-1431655765 * ((*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8)) >> 3) - 1));
    v40 = v41;
    v39 = v46;
    if (CMTimeCompare(&v40, &v39) >= 1)
      __assert_rtn("FrameTimeNormalizer", "FrameTimeNormalizer.mm", 67, "CMTIME_COMPARE_INLINE(rawLastFrameTime, <=, rawEndTime)");
    memset(&v38, 0, sizeof(v38));
    v37 = v46;
    v36 = v41;
    CMTimeSubtract(&v38, &v37, &v36);
    v29 = *(_QWORD *)(a1 + 32)
        + 24 * (-1 - 1431655765 * ((*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8)) >> 3));
    v30 = *(_OWORD *)&v38.value;
    epoch = v38.epoch;
  }
  else
  {
    v29 = *(_QWORD *)v6 + 24 * v20;
    v30 = *v11;
    epoch = *(_QWORD *)(a1 + 76);
  }
  *(_QWORD *)(v29 + 16) = epoch;
  *(_OWORD *)v29 = v30;
  if (*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8) != *(_QWORD *)(a1 + 40) - *(_QWORD *)(a1 + 32))
  {
    v33 = "mFramePresTimes.size() == mFrameDurations.size()";
    v34 = 75;
LABEL_26:
    __assert_rtn("FrameTimeNormalizer", "FrameTimeNormalizer.mm", v34, v33);
  }
  return a1;
}

void sub_1D4C8A8CC(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v3;
  void **v4;
  void *v6;
  void *v7;

  __cxa_free_exception(v3);
  v6 = *v4;
  if (*v4)
  {
    *(_QWORD *)(v1 + 40) = v6;
    operator delete(v6);
  }
  v7 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 16) = v7;
    operator delete(v7);
  }
  _Unwind_Resume(a1);
}

__n128 sub_1D4C8A920@<Q0>(_QWORD *a1@<X0>, unsigned int a2@<W1>, CMTime *a3@<X8>)
{
  uint64_t v4;
  unsigned int v5;
  __n128 *v6;
  __n128 result;
  __int128 *v8;
  __int128 v9;
  __int128 *v10;
  __int128 v11;
  uint64_t v12;
  CMTime v13;
  CMTime time1;
  CMTime rhs;
  CMTime lhs;
  CMTime v17;

  v4 = a1[1];
  v5 = -1431655765 * ((unint64_t)(a1[2] - v4) >> 3);
  if (v5 <= a2)
  {
    v12 = MEMORY[0x1E0CA2E18];
    result = *(__n128 *)MEMORY[0x1E0CA2E18];
    *(_OWORD *)&a3->value = *MEMORY[0x1E0CA2E18];
    a3->epoch = *(_QWORD *)(v12 + 16);
  }
  else
  {
    v6 = (__n128 *)(a1[4] + 24 * a2);
    result = *v6;
    *(__n128 *)&a3->value = *v6;
    a3->epoch = v6[1].n128_i64[0];
    if (v5 - 1 > a2)
    {
      memset(&v17, 0, sizeof(v17));
      v8 = (__int128 *)(v4 + 24 * (a2 + 1));
      v9 = *v8;
      lhs.epoch = *((_QWORD *)v8 + 2);
      *(_OWORD *)&lhs.value = v9;
      v10 = (__int128 *)(v4 + 24 * a2);
      v11 = *v10;
      rhs.epoch = *((_QWORD *)v10 + 2);
      *(_OWORD *)&rhs.value = v11;
      CMTimeSubtract(&v17, &lhs, &rhs);
      time1 = *a3;
      v13 = v17;
      if (CMTimeCompare(&time1, &v13))
        sub_1D4C8BFF0();
    }
  }
  return result;
}

uint64_t sub_1D4C8AA20(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CMTimeEpoch v10;
  uint64_t v11;
  CMTimeEpoch v12;
  CMTime v14;
  CMTime time1;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  if (a2[1] - *a2 != v3 - v2)
    return 0;
  if (v3 == v2)
    return 1;
  v6 = 0;
  v7 = 0;
  LOBYTE(v8) = 1;
  do
  {
    v9 = *a2 + v6;
    v10 = *(_QWORD *)(v9 + 16);
    *(_OWORD *)&time1.value = *(_OWORD *)v9;
    time1.epoch = v10;
    v11 = v2 + v6;
    v12 = *(_QWORD *)(v11 + 16);
    *(_OWORD *)&v14.value = *(_OWORD *)v11;
    v14.epoch = v12;
    v8 = (CMTimeCompare(&time1, &v14) == 0) & v8;
    ++v7;
    v2 = *(_QWORD *)(a1 + 8);
    v6 += 24;
  }
  while (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a1 + 16) - v2) >> 3) > v7);
  return v8;
}

uint64_t sub_1D4C8AB04(CMTime *a1, __int128 **a2)
{
  __int128 *v2;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 *v10;
  unint64_t v11;
  uint64_t v12;
  CMTimeEpoch v13;
  uint64_t v14;
  CMTimeEpoch v15;
  CMTime v17;
  CMTime v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CMTime rhs;
  CMTime lhs;
  CMTime v24;
  CMTime time2;
  CMTime time1;

  v2 = *a2;
  if (a2[1] == *a2)
    return 0;
  v5 = *v2;
  time1.epoch = *((_QWORD *)v2 + 2);
  *(_OWORD *)&time1.value = v5;
  time2 = *a1;
  v6 = -1;
  if (CMTimeCompare(&time1, &time2) < 0)
  {
    v7 = 24;
    while (0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3) > v6 + 2)
    {
      v8 = (uint64_t)*a2 + v7;
      v9 = *(_OWORD *)v8;
      time1.epoch = *(_QWORD *)(v8 + 16);
      *(_OWORD *)&time1.value = v9;
      time2 = *a1;
      ++v6;
      v7 += 24;
      if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
        goto LABEL_6;
    }
    ++v6;
  }
  else
  {
LABEL_6:
    if (v6 == -1)
      return 0;
  }
  v10 = *a2;
  v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3);
  if (v6 == v11 - 1)
    return v6;
  if (v11 < 2)
    return 0;
  memset(&v24, 0, sizeof(v24));
  lhs = *a1;
  v12 = (uint64_t)v10 + 24 * v6;
  v13 = *(_QWORD *)(v12 + 16);
  *(_OWORD *)&rhs.value = *(_OWORD *)v12;
  rhs.epoch = v13;
  CMTimeSubtract(&v24, &lhs, &rhs);
  memset(&v21, 0, sizeof(v21));
  v14 = (uint64_t)*a2 + 24 * (v6 + 1);
  v15 = *(_QWORD *)(v14 + 16);
  *(_OWORD *)&v20.value = *(_OWORD *)v14;
  v20.epoch = v15;
  v19 = *a1;
  CMTimeSubtract(&v21, &v20, &v19);
  v18 = v21;
  v17 = v24;
  if (CMTimeCompare(&v18, &v17) < 0)
    ++v6;
  return v6;
}

uint64_t sub_1D4C8ACEC(CMTime *a1, uint64_t *a2, int *a3)
{
  uint64_t v5;
  int v6;
  int v7;
  CMTimeEpoch v8;
  uint64_t v9;
  uint64_t v10;
  CMTimeEpoch v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CMTimeEpoch v15;
  CMTime v17;
  CMTime v18;
  CMTime v19;
  CMTime v20;
  CMTime v21;
  CMTime v22;
  CMTime v23;
  CMTime v24;
  CMTime v25;
  CMTime time2;
  CMTime time1;

  v5 = *a2;
  v6 = -1431655765 * ((unint64_t)(a2[1] - *a2) >> 3);
  if (a3)
  {
    v7 = *a3;
    if (!v6)
      return 0;
  }
  else
  {
    v7 = 0;
    if (!v6)
      return 0;
  }
  time1 = *a1;
  v8 = *(_QWORD *)(v5 + 16);
  *(_OWORD *)&time2.value = *(_OWORD *)v5;
  time2.epoch = v8;
  if (CMTimeCompare(&time1, &time2) < 1)
    return 0;
  v9 = (v6 - 1);
  v25 = *a1;
  v10 = *a2 + 24 * v9;
  v11 = *(_QWORD *)(v10 + 16);
  *(_OWORD *)&v24.value = *(_OWORD *)v10;
  v24.epoch = v11;
  if (CMTimeCompare(&v25, &v24) < 0)
  {
    v9 = v7 - (v7 == (_DWORD)v9);
    v12 = (v6 - 2);
    while (1)
    {
      v23 = *(CMTime *)(*a2 + 24 * v9);
      v22 = *a1;
      v21 = v23;
      if (!CMTimeCompare(&v22, &v21))
        break;
      v20 = *a1;
      v19 = v23;
      if (CMTimeCompare(&v20, &v19) < 1)
      {
        if (!(_DWORD)v9)
          return v9;
        v13 = (v9 - 1);
      }
      else
      {
        if ((_DWORD)v9 == (_DWORD)v12)
          return v12;
        v18 = *a1;
        v13 = (v9 + 1);
        v14 = *a2 + 24 * v13;
        v15 = *(_QWORD *)(v14 + 16);
        *(_OWORD *)&v17.value = *(_OWORD *)v14;
        v17.epoch = v15;
        if (CMTimeCompare(&v18, &v17) < 0)
          return v9;
      }
      v9 = v13;
    }
  }
  return v9;
}

uint64_t sub_1D4C8AEBC(uint64_t a1, CMTime *a2)
{
  CMTime v3;

  v3 = *a2;
  return sub_1D4C8ACEC(&v3, (uint64_t *)(a1 + 8), (int *)(a1 + 56));
}

uint64_t sub_1D4C8AEF4(uint64_t a1, CMTime *a2)
{
  CMTime v3;

  v3 = *a2;
  return sub_1D4C8ACEC(&v3, (uint64_t *)(a1 + 8), (int *)(a1 + 56));
}

uint64_t sub_1D4C8AF2C(uint64_t a1, CMTime *a2)
{
  CMTime v3;

  v3 = *a2;
  return sub_1D4C8AB04(&v3, (__int128 **)(a1 + 8));
}

uint64_t sub_1D4C8AF60(uint64_t a1, CMTime *a2)
{
  CMTime v3;

  v3 = *a2;
  return sub_1D4C8ACEC(&v3, (uint64_t *)(a1 + 8), (int *)(a1 + 56));
}

CMTime *sub_1D4C8AF98@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, uint64_t a3@<X8>)
{
  CMTime *result;
  uint64_t v7;
  CMTimeEpoch epoch;
  CMTime v9;
  CMTime lhs;
  CMTime v11;
  CMTime time;

  result = (CMTime *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  if (result >= a2)
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    time = *(CMTime *)(a1 + 60);
    CMTimeMultiply((CMTime *)a3, &time, a2);
    lhs = *(CMTime *)a3;
    v9 = *(CMTime *)(a1 + 84);
    result = CMTimeAdd(&v11, &lhs, &v9);
    *(_OWORD *)a3 = *(_OWORD *)&v11.value;
    epoch = v11.epoch;
  }
  else
  {
    v7 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)a3 = *MEMORY[0x1E0CA2E18];
    epoch = *(_QWORD *)(v7 + 16);
  }
  *(_QWORD *)(a3 + 16) = epoch;
  return result;
}

uint64_t sub_1D4C8B060(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a2 * *(int *)(a1 + 68) / (*(_QWORD *)(a1 + 60) * *(int *)(a2 + 8));
}

uint64_t sub_1D4C8B080(_QWORD *a1, unsigned int a2)
{
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;

  if ((*(unsigned int (**)(_QWORD *))(*a1 + 24))(a1) <= a2)
  {
    (*(void (**)(_QWORD *))(*a1 + 24))(a1);
    return -1431655765 * ((a1[2] - a1[1]) >> 3) - 1;
  }
  else
  {
    v7 = 0uLL;
    v8 = 0;
    sub_1D4C8AF98((uint64_t)a1, a2, (uint64_t)&v7);
    v5 = v7;
    v6 = v8;
    return (*(uint64_t (**)(_QWORD *, __int128 *))(*a1 + 32))(a1, &v5);
  }
}

CMTimeValue sub_1D4C8B128(uint64_t a1)
{
  uint64_t v1;
  int v2;
  __int128 *v4;
  __int128 v5;
  __int128 v6;
  CMTime v8;
  CMTime v9;
  CMTime v10;
  CMTime rhs;
  CMTime lhs;
  CMTime v13;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = -1431655765 * ((unint64_t)(*(_QWORD *)(a1 + 16) - v1) >> 3);
  if (!v2)
    return 0;
  v4 = (__int128 *)(v1 + 24 * (v2 - 1));
  v5 = *v4;
  v13.epoch = *((_QWORD *)v4 + 2);
  *(_OWORD *)&v13.value = v5;
  v6 = *v4;
  lhs.epoch = *((_QWORD *)v4 + 2);
  *(_OWORD *)&lhs.value = v6;
  sub_1D4C8A920((_QWORD *)a1, v2 - 1, &rhs);
  CMTimeAdd(&v13, &lhs, &rhs);
  memset(&v10, 0, sizeof(v10));
  v9 = v13;
  v8 = *(CMTime *)(a1 + 84);
  CMTimeSubtract(&v10, &v9, &v8);
  return (*(_QWORD *)(a1 + 60) * v10.timescale + v10.value * *(int *)(a1 + 68) - 1)
       / (*(_QWORD *)(a1 + 60)
        * v10.timescale);
}

uint64_t sub_1D4C8B20C(uint64_t a1, CMTime *a2)
{
  int32_t v4;
  __int128 v6;
  CMTimeEpoch epoch;
  CMTime rhs;
  CMTime lhs;
  CMTime time2;
  CMTime time1;
  CMTime time;

  time1 = *a2;
  time = *(CMTime *)(a1 + 60);
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  CMTimeMultiply(&lhs, &time, v4);
  rhs = *(CMTime *)(a1 + 84);
  CMTimeAdd(&time2, &lhs, &rhs);
  if (CMTimeCompare(&time1, &time2) > 0)
    return 0;
  v6 = *(_OWORD *)&a2->value;
  epoch = a2->epoch;
  return (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)a1 + 48))(a1, &v6);
}

uint64_t sub_1D4C8B2D0(uint64_t a1)
{
  uint64_t result;
  __int128 *v3;
  __int128 v4;
  CMTimeEpoch epoch;
  uint64_t v6;
  CMTime v7;
  CMTime lhs;
  __int128 v9;
  uint64_t v10;
  CMTime v11;

  v9 = *(_OWORD *)(a1 + 60);
  v10 = *(_QWORD *)(a1 + 76);
  result = sub_1D4C9250C((uint64_t)&v9, (uint64_t)&v11);
  *(CMTime *)(a1 + 108) = v11;
  v3 = *(__int128 **)(a1 + 8);
  if (-1431655765 * ((*(_QWORD *)(a1 + 16) - (_QWORD)v3) >> 3))
  {
    v4 = *v3;
    lhs.epoch = *((_QWORD *)v3 + 2);
    *(_OWORD *)&lhs.value = v4;
    v7 = *(CMTime *)(a1 + 108);
    result = (uint64_t)CMTimeAdd(&v11, &lhs, &v7);
    *(_OWORD *)(a1 + 84) = *(_OWORD *)&v11.value;
    epoch = v11.epoch;
  }
  else
  {
    v6 = MEMORY[0x1E0CA2E68];
    *(_OWORD *)(a1 + 84) = *MEMORY[0x1E0CA2E68];
    epoch = *(_QWORD *)(v6 + 16);
  }
  *(_QWORD *)(a1 + 100) = epoch;
  return result;
}

CMTimeValue sub_1D4C8B398(uint64_t a1)
{
  uint64_t v1;
  int v2;
  __int128 *v4;
  __int128 v5;
  __int128 v6;
  CMTime v8;
  CMTime v9;
  CMTime v10;
  CMTime rhs;
  CMTime lhs;
  CMTime v13;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = -1431655765 * ((unint64_t)(*(_QWORD *)(a1 + 16) - v1) >> 3);
  if (!v2)
    return 0;
  v4 = (__int128 *)(v1 + 24 * (v2 - 1));
  v5 = *v4;
  v13.epoch = *((_QWORD *)v4 + 2);
  *(_OWORD *)&v13.value = v5;
  v6 = *v4;
  lhs.epoch = *((_QWORD *)v4 + 2);
  *(_OWORD *)&lhs.value = v6;
  sub_1D4C8A920((_QWORD *)a1, v2 - 1, &rhs);
  CMTimeAdd(&v13, &lhs, &rhs);
  memset(&v10, 0, sizeof(v10));
  v9 = v13;
  v8 = *(CMTime *)(a1 + 84);
  CMTimeSubtract(&v10, &v9, &v8);
  return (*(_QWORD *)(a1 + 60) * v10.timescale + v10.value * *(int *)(a1 + 68) - 1)
       / (*(_QWORD *)(a1 + 60)
        * v10.timescale);
}

uint64_t sub_1D4C8B47C(uint64_t a1, CMTime *a2)
{
  int32_t v4;
  __int128 v6;
  CMTimeEpoch epoch;
  CMTime rhs;
  CMTime lhs;
  CMTime time2;
  CMTime time1;
  CMTime time;

  time1 = *a2;
  time = *(CMTime *)(a1 + 60);
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
  CMTimeMultiply(&lhs, &time, v4);
  rhs = *(CMTime *)(a1 + 84);
  CMTimeAdd(&time2, &lhs, &rhs);
  if (CMTimeCompare(&time1, &time2) > 0)
    return 0;
  v6 = *(_OWORD *)&a2->value;
  epoch = a2->epoch;
  return (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)a1 + 48))(a1, &v6);
}

uint64_t sub_1D4C8B540(uint64_t *a1, int a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  BOOL v16;
  int v18;
  unsigned int *v19;

  v6 = (_QWORD *)(a3 + 8);
  sub_1D4C60C0C(a3, *(_QWORD **)(a3 + 8));
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 16) = 0;
  *v6 = 0;
  v7 = *a1;
  v8 = ((a1[1] - *a1) >> 2) - 1;
  if ((a1[1] - *a1) >> 2 != 1)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 1;
    v13 = 1;
    do
    {
      v14 = *(_DWORD *)(v7 + 4 * v9);
      v15 = *(_DWORD *)(v7 + 4 * v12);
      if (v15 < v14)
        sub_1D4C8C018();
      v9 = v12;
      v16 = v15 == v14;
      if (v15 == v14)
      {
        if (v10)
        {
          ++v13;
        }
        else
        {
          v11 = v12 - 1;
          v13 = 2;
        }
        if (v8 == v12)
        {
          v18 = v11 + a2;
          v19 = (unsigned int *)&v18;
          *((_DWORD *)sub_1D4C8BE2C((uint64_t **)a3, &v18, (uint64_t)&unk_1D4C95741, &v19) + 8) = v13;
        }
      }
      else
      {
        if (v10)
        {
          v18 = v11 + a2;
          v19 = (unsigned int *)&v18;
          *((_DWORD *)sub_1D4C8BE2C((uint64_t **)a3, &v18, (uint64_t)&unk_1D4C95741, &v19) + 8) = v13;
        }
        v13 = 1;
        v11 = v12;
      }
      v7 = *a1;
      v8 = ((a1[1] - *a1) >> 2) - 1;
      ++v12;
      v10 = v16;
    }
    while (v8 > v9);
  }
  return 1;
}

uint64_t *sub_1D4C8B69C(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v8;
  unint64_t v9;
  uint64_t i;
  int v11;
  void *v12;
  uint64_t *v13;
  _DWORD *v14;
  _QWORD **v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  int j;
  uint64_t v22;
  _QWORD *v23;
  _QWORD **v24;
  BOOL v25;
  int v26;
  const char *v27;
  uint64_t *v28;
  void *__p;
  void *v30;
  uint64_t v31;
  _QWORD **v32;
  _QWORD *v33[2];
  void *v34;
  _BYTE *v35;

  if (a3 < 2)
    return 0;
  v6 = a3 + a2;
  if (v6 > (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1))
    return 0;
  v8 = a2;
  v9 = a3;
  sub_1D4C83190(&v34, a3);
  for (i = 0; i != v9; ++i)
  {
    v11 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 16))(a1, a2 + i);
    v12 = v34;
    *((_DWORD *)v34 + i) = v11;
  }
  v33[0] = 0;
  v33[1] = 0;
  v31 = 0;
  v32 = v33;
  __p = 0;
  v30 = 0;
  sub_1D4C81214(&__p, v12, (uint64_t)v35, (v35 - (_BYTE *)v12) >> 2);
  sub_1D4C8B540((uint64_t *)&__p, a2, (uint64_t)&v32);
  if (__p)
  {
    v30 = __p;
    operator delete(__p);
  }
  v13 = (uint64_t *)operator new();
  sub_1D4C8BEE8(v13, v9);
  if (v6 > a2)
  {
    v14 = (_DWORD *)(*v13 + 8);
    do
    {
      *((_BYTE *)v14 - 8) = 0;
      *(v14 - 1) = v8;
      *v14 = 1;
      ++v8;
      v14 += 3;
    }
    while (v6 != v8);
  }
  v28 = v13;
  v15 = v32;
  if (v32 != v33)
  {
    while (1)
    {
      v16 = *((_DWORD *)v15 + 8);
      if (v16 <= 1)
        break;
      v17 = *((unsigned int *)v15 + 7);
      if ((v17 & 0x80000000) != 0
        || (v18 = v16 + v17, v16 + (int)v17 > (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1)))
      {
        v26 = 788;
        v27 = "runStart >= 0 && runStart + runLength <= numNormFrames()";
        goto LABEL_34;
      }
      if (v18 < (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1))
      {
        if (v18 >= (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1))
        {
          v26 = 797;
          v27 = "runStart >= 0 && runStart + runLength < numNormFrames()";
LABEL_34:
          __assert_rtn("computeBlendToBridgeFrameGap", "FrameTimeNormalizer.mm", v26, v27);
        }
        v19 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 16))(a1, v17);
        if (v19 == (*(unsigned int (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 16))(a1, (v16 + v17)))
        {
          if (v18 != (_DWORD)v6)
          {
            v26 = 813;
            v27 = "runStart + runLength == normStart + normLen";
            goto LABEL_34;
          }
        }
        else
        {
          v20 = *v28;
          for (j = 1; j != v16; ++j)
          {
            v22 = v20 + 12 * (v17 - a2 + j);
            *(_BYTE *)v22 = 1;
            *(_DWORD *)(v22 + 4) = v17;
            *(_DWORD *)(v22 + 8) = v16;
          }
        }
      }
      v23 = v15[1];
      if (v23)
      {
        do
        {
          v24 = (_QWORD **)v23;
          v23 = (_QWORD *)*v23;
        }
        while (v23);
      }
      else
      {
        do
        {
          v24 = (_QWORD **)v15[2];
          v25 = *v24 == v15;
          v15 = v24;
        }
        while (!v25);
      }
      v15 = v24;
      if (v24 == v33)
        goto LABEL_28;
    }
    v26 = 787;
    v27 = "runLength >= 2";
    goto LABEL_34;
  }
LABEL_28:
  sub_1D4C60C0C((uint64_t)&v32, v33[0]);
  if (v34)
  {
    v35 = v34;
    operator delete(v34);
  }
  return v28;
}

void sub_1D4C8B98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, char a15, _QWORD *a16, uint64_t a17, void *__p, uint64_t a19)
{
  uint64_t v19;

  MEMORY[0x1D82660DC](v19, 0x20C40960023A9);
  sub_1D4C60C0C((uint64_t)&a15, a16);
  if (__p)
  {
    a19 = (uint64_t)__p;
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

_QWORD *sub_1D4C8BA00(int a1, uint64_t a2, uint64_t a3, CMTime *a4)
{
  _QWORD *v7;
  uint64_t (**v8)();
  CMTime v10;
  __int128 v11;
  uint64_t v12;
  CMTime v13;
  __int128 v14;
  uint64_t v15;

  if (a1)
  {
    if (a1 == 2)
    {
      v7 = (_QWORD *)operator new();
      v14 = *(_OWORD *)a3;
      v15 = *(_QWORD *)(a3 + 16);
      v13 = *a4;
      sub_1D4C8A454((uint64_t)v7, a2, &v14, &v13);
      v8 = &off_1E9863C98;
    }
    else
    {
      if (a1 != 1)
        sub_1D4C8C040();
      v7 = (_QWORD *)operator new();
      v14 = *(_OWORD *)a3;
      v15 = *(_QWORD *)(a3 + 16);
      v13 = *a4;
      sub_1D4C8A454((uint64_t)v7, a2, &v14, &v13);
      v8 = &off_1E9863BF8;
    }
    *v7 = v8;
  }
  else
  {
    v7 = (_QWORD *)operator new();
    v11 = *(_OWORD *)a3;
    v12 = *(_QWORD *)(a3 + 16);
    v10 = *a4;
    sub_1D4C7EFF8((uint64_t)v7, a2, (uint64_t)&v11, &v10);
  }
  return v7;
}

void sub_1D4C8BB50(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D82660DC](v1, 0x10A1C40DD17C45DLL);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C8BB8C()
{
  puts("computeBlendToBridgeFrameGap is only available for ResampleNearestFrameTimeNormalizer.");
  return 0;
}

void sub_1D4C8BBB0(_QWORD *a1)
{
  sub_1D4C7F074(a1);
  JUMPOUT(0x1D82660DCLL);
}

CMTimeValue sub_1D4C8BBD4(uint64_t a1, CMTime *a2)
{
  CMTime v4;
  CMTime lhs;
  CMTime v6;

  lhs = *a2;
  memset(&v6, 0, sizeof(v6));
  v4 = *(CMTime *)(a1 + 84);
  CMTimeSubtract(&v6, &lhs, &v4);
  return v6.value * *(int *)(a1 + 68) / (*(_QWORD *)(a1 + 60) * v6.timescale);
}

void sub_1D4C8BC50(_QWORD *a1)
{
  sub_1D4C7F074(a1);
  JUMPOUT(0x1D82660DCLL);
}

uint64_t sub_1D4C8BC74(_QWORD *a1, uint64_t a2)
{
  if (sub_1D4C8B080(a1, a2) != (_DWORD)a2
    && (*(unsigned int (**)(_QWORD *))(*a1 + 24))(a1) > a2)
  {
    sub_1D4C8C068();
  }
  return a2;
}

uint64_t sub_1D4C8BCC0(uint64_t a1)
{
  return -1431655765 * ((*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8)) >> 3);
}

CMTimeValue sub_1D4C8BCDC(uint64_t a1, CMTime *a2)
{
  CMTime v4;
  CMTime lhs;
  CMTime v6;

  lhs = *a2;
  memset(&v6, 0, sizeof(v6));
  v4 = *(CMTime *)(a1 + 84);
  CMTimeSubtract(&v6, &lhs, &v4);
  return v6.value * *(int *)(a1 + 68) / (*(_QWORD *)(a1 + 60) * v6.timescale);
}

uint64_t sub_1D4C8BD54(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *((_QWORD *)a2 + 2);
  return (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)a1 + 48))(a1, &v3);
}

void sub_1D4C8BD90(_QWORD *a1)
{
  sub_1D4C7F074(a1);
  JUMPOUT(0x1D82660DCLL);
}

CMTimeValue sub_1D4C8BDB4(uint64_t a1, CMTime *a2)
{
  CMTime v4;
  CMTime lhs;
  CMTime v6;

  lhs = *a2;
  memset(&v6, 0, sizeof(v6));
  v4 = *(CMTime *)(a1 + 84);
  CMTimeSubtract(&v6, &lhs, &v4);
  return v6.value * *(int *)(a1 + 68) / (*(_QWORD *)(a1 + 60) * v6.timescale);
}

uint64_t *sub_1D4C8BE2C(uint64_t **a1, int *a2, uint64_t a3, unsigned int **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  uint64_t **v9;
  int v10;
  uint64_t *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 7);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v11 + 28) = **a4;
    sub_1D4C60D0C(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

_QWORD *sub_1D4C8BEE8(_QWORD *a1, unint64_t a2)
{
  _BYTE *v4;
  _BYTE *v5;
  uint64_t v6;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1D4C8BF5C(a1, a2);
    v4 = (_BYTE *)a1[1];
    v5 = &v4[12 * a2];
    v6 = 12 * a2;
    do
    {
      *v4 = 0;
      v4 += 12;
      v6 -= 12;
    }
    while (v6);
    a1[1] = v5;
  }
  return a1;
}

void sub_1D4C8BF40(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1D4C8BF5C(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x1555555555555556)
    sub_1D4C590D0();
  result = (char *)sub_1D4C8BFAC((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[12 * v4];
  return result;
}

void *sub_1D4C8BFAC(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556)
    sub_1D4C5919C();
  return operator new(12 * a2);
}

void sub_1D4C8BFF0()
{
  __assert_rtn("rawFrameDurationForRawIndex", "FrameTimeNormalizer.mm", 115, "CMTIME_COMPARE_INLINE(frameDuration, ==, presTimeInterval)");
}

void sub_1D4C8C018()
{
  __assert_rtn("allRunsOfRepeats", "FrameTimeNormalizer.mm", 698, "nextVal >= currVal");
}

void sub_1D4C8C040()
{
  __assert_rtn("createFrameTimeNormalizerOfType", "FrameTimeNormalizer.mm", 864, "0");
}

void sub_1D4C8C068()
{
  __assert_rtn("rawIndexForNormIndex", "FrameTimeNormalizer.h", 394, "normIndex == FrameTimeNormalizer::rawIndexForNormIndex(normIndex) || normIndex >= numNormFrames()");
}

uint64_t sub_1D4C8C090(char *a1, int a2, unsigned int a3)
{
  void *v6;
  id v7;
  uint64_t v8;

  v6 = (void *)MEMORY[0x1D82662EC]();
  sub_1D4C8C128(a1);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = open((const char *)objc_msgSend(v7, "UTF8String"), a2, a3);
  if ((int)v8 <= 0)
  {
    sub_1D4C8C298(a1);
    v8 = 0xFFFFFFFFLL;
  }

  objc_autoreleasePoolPop(v6);
  return v8;
}

id sub_1D4C8C128(_BYTE *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1D82662EC]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*a1 == 47)
  {
    v5 = v3;
  }
  else
  {
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "stringByAppendingPathComponent:", v4);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSLog(CFSTR("Error obtaining Documents directory"));
      v5 = 0;
    }

  }
  objc_autoreleasePoolPop(v2);
  return v5;
}

uint64_t sub_1D4C8C1F8(void *a1, int a2, unsigned int a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v5 = a1;
  v6 = (void *)MEMORY[0x1D82662EC]();
  objc_msgSend(v5, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = open((const char *)objc_msgSend(v7, "UTF8String"), a2, a3);

  if ((int)v8 <= 0)
  {
    sub_1D4C8C2DC(v5);
    v8 = 0xFFFFFFFFLL;
  }
  objc_autoreleasePoolPop(v6);

  return v8;
}

uint64_t sub_1D4C8C298(const char *a1)
{
  perror(a1);
  return fprintf((FILE *)*MEMORY[0x1E0C80C10], "***Error opening %s\n", a1);
}

void sub_1D4C8C2DC(void *a1)
{
  id v2;
  FILE *v3;
  id v4;

  objc_msgSend(a1, "path");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  perror((const char *)objc_msgSend(v2, "UTF8String"));

  v3 = (FILE *)*MEMORY[0x1E0C80C10];
  objc_msgSend(a1, "path");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fprintf(v3, "***Error opening %s\n", (const char *)objc_msgSend(v4, "UTF8String"));

}

void sub_1D4C8C48C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C8CBAC(void *a1, uint64_t a2, unsigned int a3, void *a4, float a5)
{
  uint64_t (**v9)(_QWORD, float);
  uint64_t (**v10)(_QWORD, float);
  uint64_t v11;
  void *v12;
  VideoContext *v13;
  VideoContext *v14;
  void *v15;
  double v16;
  void *v17;
  id v18;
  id v19;
  unsigned int v20;
  double v21;
  void *v22;
  unsigned int v23;
  __CVBuffer *ImageBuffer;
  uint64_t v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  int v30;
  float v31;
  uint64_t v32;
  int v33;
  unsigned int v34;
  void *v35;
  char *v36;
  void *v38;
  CMTime time;
  CGAffineTransform v40;
  double v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CFTypeRef v44[3];

  v9 = a4;
  v10 = v9;
  if (a3 && a1 && a2 && a5 != 0.0)
  {
    v11 = v9[2](v9, 0.0);
    v12 = (void *)MEMORY[0x1D82662EC](v11);
    v13 = -[VideoContext initWithWriter:pixelFormatFlags:]([VideoContext alloc], "initWithWriter:pixelFormatFlags:", 0, 3588);
    if (v13)
    {
      v14 = v13;
      -[VideoContext ciCtx](v13, "ciCtx");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v16 = a5;
      +[GIFBuilder builderWithContext:forURL:maxRes:fps:](GIFBuilder, "builderWithContext:forURL:maxRes:fps:", v15, a2, a3, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = a1;
        v19 = -[VideoReader initFromFile:]([VideoReader alloc], "initFromFile:", v18);
        if (v19)
        {
          v38 = v18;
          v20 = 0;
          v21 = a5;
          while (1)
          {
            v22 = (void *)MEMORY[0x1D82662EC]();
            v44[0] = 0;
            v23 = objc_msgSend(v19, "getFrameAsSampleBuf:", v44);
            if (v23)
              break;
            ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v44[0]);
            sub_1D4C8D468(ImageBuffer, 0);
            v25 = objc_claimAutoreleasedReturnValue();
            if (!v25)
            {
              NSLog(CFSTR("***Error converting frame to CIImage"));
LABEL_28:
              objc_autoreleasePoolPop(v22);
              v32 = 0;
              v33 = 1;
LABEL_29:
              v18 = v38;
              goto LABEL_32;
            }
            v26 = (void *)v25;
            memset(&v43, 0, sizeof(v43));
            objc_msgSend(v19, "preferredTransform");
            CGAffineTransformInvert(&v43, &v42);
            if (v43.a <= 0.001 && v43.a >= -0.001)
            {
              objc_msgSend(v19, "preferredTransform", v43.a);
              if (v41 <= 0.0)
              {
                objc_msgSend(v26, "extent", v41);
                v43.tx = v28;
                v27 = 0.0;
              }
              else
              {
                v43.tx = 0.0;
                objc_msgSend(v26, "extent", v41);
              }
              v43.ty = v27;
            }
            v40 = v43;
            objc_msgSend(v26, "imageByApplyingTransform:", &v40);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

            v30 = objc_msgSend(v17, "addImage:", v29);
            CFRelease(v44[0]);
            if (!v30
              || (objc_msgSend(v19, "trackLengthT"),
                  v31 = (double)v20 / v21 / CMTimeGetSeconds(&time),
                  (v10[2](v10, v31) & 1) == 0))
            {

              goto LABEL_28;
            }
            ++v20;

            objc_autoreleasePoolPop(v22);
          }
          v34 = v23;
          if (v23 == 1)
          {
            objc_autoreleasePoolPop(v22);
            v32 = objc_msgSend(v17, "finish");
            v33 = 0;
            goto LABEL_29;
          }
          v18 = v38;
          objc_msgSend(v38, "path");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = sub_1D4C8852C(v34);
          NSLog(CFSTR("***Error reading frame from %@: %s"), v35, v36);

          objc_autoreleasePoolPop(v22);
          v32 = 0;
        }
        else
        {
          v32 = 1;
        }
        v33 = 1;
LABEL_32:

      }
      else
      {
        v32 = 1;
        v33 = 1;
      }

      objc_autoreleasePoolPop(v12);
      if (!v33)
      {
        v10[2](v10, 1.0);
        goto LABEL_35;
      }
    }
    else
    {
      NSLog(CFSTR("createGIFFromVideoInternal: error creating VideoContext"));
      objc_autoreleasePoolPop(v12);
    }
  }
  else
  {
    NSLog(CFSTR("createGIFFromVideoInternal: NULL/zero input"));
  }
  v32 = 0;
LABEL_35:

  return v32;
}

id sub_1D4C8D468(__CVBuffer *a1, void *a2)
{
  const __CFDictionary *v3;
  const __CFDictionary *Attachments;
  const __CFDictionary *v5;
  unint64_t v6;
  const __CFData *Value;
  const __CFData *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  const void *v14;
  uint64_t v15;
  const void *v16;
  BOOL v17;
  const void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double x;
  double y;
  double width;
  double height;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  void *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const void *v37;
  void *v38;
  const __CFData *v39;
  const __CFData *v40;
  uint64_t v41;
  const void *v42;
  uint64_t v43;
  const void *v44;
  uint64_t v45;
  const void *v46;
  const void *v47;
  uint64_t v49;
  const __CFDictionary *theDict;
  __CFDictionary *theDicta;
  const void *v52;
  const void *v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGRect CleanRect;
  CGRect v57;
  CGRect v58;

  v3 = a2;
  Attachments = CVBufferGetAttachments(a1, kCVAttachmentMode_ShouldPropagate);
  v5 = Attachments;
  v6 = 0x1E0C99000;
  if (v3)
  {
    Value = (const __CFData *)CFDictionaryGetValue(Attachments, (const void *)*MEMORY[0x1E0CA8E40]);
    if (Value && (v8 = Value, CFDataGetLength(Value)))
    {
      v9 = CFDictionaryGetValue(v3, v8);
    }
    else
    {
      v10 = *MEMORY[0x1E0CA8DF8];
      v52 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0CA8DF8]);
      v11 = *MEMORY[0x1E0CA8D68];
      v12 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0CA8D68]);
      v13 = *MEMORY[0x1E0CA8E98];
      v14 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0CA8E98]);
      v15 = *MEMORY[0x1E0CA8EE8];
      v16 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0CA8EE8]);
      if (v12)
        v17 = v14 == 0;
      else
        v17 = 1;
      if (v17)
      {
        v9 = 0;
      }
      else
      {
        v18 = v16;
        theDict = v3;
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
        v20 = v19;
        if (v52)
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v52, v10);
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v12, v11);
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, v13);
        if (v18)
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, v15);
        v9 = CFDictionaryGetValue(theDict, v20);

        v3 = theDict;
      }
      v6 = 0x1E0C99000uLL;
    }
  }
  else
  {
    v9 = 0;
  }
  v21 = (void *)objc_msgSend(objc_alloc(*(Class *)(v6 + 3592)), "initWithCapacity:", 1);
  v22 = v21;
  if (v9)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C9E110]);
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", a1, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    CleanRect = CVImageBufferGetCleanRect(a1);
    x = CleanRect.origin.x;
    y = CleanRect.origin.y;
    width = CleanRect.size.width;
    height = CleanRect.size.height;
    objc_msgSend(v23, "extent");
    v58.origin.x = v28;
    v58.origin.y = v29;
    v58.size.width = v30;
    v58.size.height = v31;
    v57.origin.x = x;
    v57.origin.y = y;
    v57.size.width = width;
    v57.size.height = height;
    if (!CGRectEqualToRect(v57, v58))
    {
      objc_msgSend(v23, "imageByCroppingToRect:", x, y, width, height);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v54.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v54.c = v33;
      *(_OWORD *)&v54.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      CGAffineTransformTranslate(&v55, &v54, -x, -y);
      objc_msgSend(v32, "imageByApplyingTransform:", &v55);
      v34 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v34;
    }
    if (!v9)
    {
      v35 = objc_msgSend(v23, "colorSpace");
      if (v3)
      {
        if (v35)
        {
          v36 = objc_msgSend(v23, "colorSpace");
          if (v5)
          {
            v37 = (const void *)v36;
            if (v36)
            {
              theDicta = v3;
              v38 = (void *)objc_msgSend(objc_alloc(*(Class *)(v6 + 3592)), "initWithCapacity:", 0);
              v39 = (const __CFData *)CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0CA8E40]);
              if (v39)
              {
                v40 = v39;
                if (CFDataGetLength(v39))
                  goto LABEL_37;
              }
              v49 = *MEMORY[0x1E0CA8DF8];
              v53 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0CA8DF8]);
              v41 = *MEMORY[0x1E0CA8D68];
              v42 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0CA8D68]);
              v43 = *MEMORY[0x1E0CA8E98];
              v44 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0CA8E98]);
              v45 = *MEMORY[0x1E0CA8EE8];
              v46 = CFDictionaryGetValue(v5, (const void *)*MEMORY[0x1E0CA8EE8]);
              if (v42)
              {
                if (v44)
                {
                  v47 = v46;
                  objc_msgSend(v38, "setObject:forKeyedSubscript:", v42, v41);
                  objc_msgSend(v38, "setObject:forKeyedSubscript:", v44, v43);
                  if (v53)
                    objc_msgSend(v38, "setObject:forKeyedSubscript:", v53, v49);
                  if (v47)
                    objc_msgSend(v38, "setObject:forKeyedSubscript:", v47, v45);
                  v40 = (const __CFData *)v38;
                  if (v38)
LABEL_37:
                    CFDictionaryAddValue(theDicta, v40, v37);
                }
              }

              v3 = theDicta;
            }
          }
        }
      }
    }
  }
  else
  {
    NSLog(CFSTR("***[CIImage imageWithCVPixelBuffer:] failure"));
  }

  return v23;
}

double sub_1D4C8D888(uint64_t a1, int a2)
{
  uint64_t v2;
  double result;

  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)a1 = &off_1E9863CE8;
  *(_QWORD *)(a1 + 8) = 0;
  v2 = MEMORY[0x1E0CA2E68];
  *(_OWORD *)(a1 + 32) = *MEMORY[0x1E0CA2E68];
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(v2 + 16);
  result = 0.0;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_DWORD *)(a1 + 88) = 8;
  *(_QWORD *)(a1 + 96) = 0;
  *(_DWORD *)(a1 + 104) = a2;
  return result;
}

_QWORD *sub_1D4C8D8D0(_QWORD *a1)
{
  const void *v2;
  void *v3;

  *a1 = &off_1E9863CE8;
  v2 = (const void *)a1[12];
  if (v2)
  {
    CFRelease(v2);
    a1[12] = 0;
  }
  v3 = (void *)a1[8];
  if (v3)
  {
    a1[9] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_1D4C8D924(_QWORD *a1)
{
  sub_1D4C8D8D0(a1);
  JUMPOUT(0x1D82660DCLL);
}

uint64_t sub_1D4C8D948(uint64_t a1, int a2)
{
  unsigned int v2;
  unsigned int v3;
  size_t v4;
  int8x16_t *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  int8x16_t *v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int *v15;
  uint64_t *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  unsigned int *v32;
  unsigned int *v33;
  __int128 v34;
  unsigned int v35;
  size_t v36;
  ssize_t v37;
  uint64_t v38;
  CFDataRef v39;
  FILE *v41;
  const char *v42;
  size_t v43;
  FILE *v44;
  const char *v45;
  size_t v46;
  const char *v47;
  _QWORD v48[2];
  int8x16_t *v49;
  int v50;
  uint64_t *v51;
  void **v52;
  unsigned int v53;
  uint64_t v54;
  CMTime v55;
  unsigned int v56[3];
  uint64_t v57;

  v54 = a1;
  v57 = *MEMORY[0x1E0C80C00];
  v50 = a2;
  if (read(a2, v56, 0xCuLL) != 12)
  {
    v41 = (FILE *)*MEMORY[0x1E0C80C10];
    v42 = "***VPHeader::read: error reading preheader\n";
    v43 = 43;
LABEL_37:
    fwrite(v42, v43, 1uLL, v41);
    return 0xFFFFFFFFLL;
  }
  v2 = v56[1];
  v3 = v56[2];
  *(_DWORD *)(v54 + 104) = bswap32(v56[0]);
  if (v2 != 150994944)
  {
    v41 = (FILE *)*MEMORY[0x1E0C80C10];
    v42 = "***VPHeader::read: bad version\n";
    v43 = 31;
    goto LABEL_37;
  }
  v48[1] = v48;
  v4 = bswap32(v3);
  MEMORY[0x1E0C80A78](12);
  v49 = (int8x16_t *)((char *)v48 - ((v4 + 15) & 0x1FFFFFFF0));
  if (read(v50, v49, v4) != v4)
  {
    v44 = (FILE *)*MEMORY[0x1E0C80C10];
    v45 = "***VPHeader::read: error reading header\n";
    v46 = 40;
LABEL_42:
    fwrite(v45, v46, 1uLL, v44);
    return 0xFFFFFFFFLL;
  }
  v5 = v49;
  v6 = v49[1].u32[0];
  v7 = v49[1].u32[1];
  v8 = bswap32(v7);
  if (v7)
    v9 = v8;
  else
    v9 = 6000;
  v10 = v54;
  *(int8x16_t *)(v54 + 8) = vrev32q_s8(*v49);
  *(_DWORD *)(v10 + 24) = bswap32(v6);
  *(_DWORD *)(v10 + 28) = v9;
  CMTimeMake(&v55, bswap64(v5[1].u64[1]), bswap32(v5[2].u32[0]));
  v11 = v49;
  v12 = v54;
  *(CMTime *)(v54 + 32) = v55;
  v13 = v11[2].u32[2];
  *(_DWORD *)(v12 + 56) = bswap32(v11[2].u32[1]);
  *(_DWORD *)(v12 + 60) = bswap32(v13);
  if (!v13)
  {
    v44 = (FILE *)*MEMORY[0x1E0C80C10];
    v45 = "***VPHeader::read: invalid numFrames (0)\n";
    v46 = 41;
    goto LABEL_42;
  }
  v14 = 0;
  v15 = &v11[2].u32[3];
  v16 = (uint64_t *)(v12 + 80);
  v17 = *(unsigned int **)(v12 + 72);
  v51 = (uint64_t *)(v12 + 80);
  v52 = (void **)(v12 + 64);
  do
  {
    v18 = bswap32(*v15);
    v19 = bswap32(v15[1]);
    v20 = bswap32(v15[2]);
    v21 = bswap32(v15[3]);
    v22 = bswap32(v15[4]);
    v23 = bswap32(v15[5]);
    v24 = bswap32(v15[6]);
    v25 = *v16;
    if ((unint64_t)v17 >= *v16)
    {
      v53 = v20;
      v26 = (unsigned int *)*v52;
      v27 = 0x6DB6DB6DB6DB6DB7 * (((char *)v17 - (_BYTE *)*v52) >> 2);
      v28 = v27 + 1;
      if ((unint64_t)(v27 + 1) > 0x924924924924924)
        sub_1D4C590D0();
      v29 = 0x6DB6DB6DB6DB6DB7 * ((v25 - (uint64_t)v26) >> 2);
      if (2 * v29 > v28)
        v28 = 2 * v29;
      if (v29 >= 0x492492492492492)
        v30 = 0x924924924924924;
      else
        v30 = v28;
      if (v30)
      {
        v31 = (char *)sub_1D4C81D1C((uint64_t)v16, v30);
        v26 = *(unsigned int **)(v54 + 64);
        v17 = *(unsigned int **)(v54 + 72);
        v16 = v51;
      }
      else
      {
        v31 = 0;
      }
      v32 = (unsigned int *)&v31[28 * v27];
      *v32 = v18;
      v32[1] = v19;
      v32[2] = v53;
      v32[3] = v21;
      v32[4] = v22;
      v32[5] = v23;
      v32[6] = v24;
      v33 = v32;
      if (v17 == v26)
      {
        v12 = v54;
      }
      else
      {
        v12 = v54;
        do
        {
          v34 = *(_OWORD *)(v17 - 7);
          *((_OWORD *)v33 - 1) = *((_OWORD *)v17 - 1);
          *(_OWORD *)(v33 - 7) = v34;
          v33 -= 7;
          v17 -= 7;
        }
        while (v17 != v26);
        v26 = (unsigned int *)*v52;
      }
      v17 = v32 + 7;
      *(_QWORD *)(v12 + 64) = v33;
      *(_QWORD *)(v12 + 72) = v32 + 7;
      *(_QWORD *)(v12 + 80) = &v31[28 * v30];
      if (v26)
      {
        operator delete(v26);
        v16 = v51;
      }
    }
    else
    {
      *v17 = v18;
      v17[1] = v19;
      v17[2] = v20;
      v17[3] = v21;
      v17[4] = v22;
      v17[5] = v23;
      v17[6] = v24;
      v17 += 7;
    }
    v15 += 7;
    *(_QWORD *)(v12 + 72) = v17;
    ++v14;
  }
  while (v14 < *(_DWORD *)(v12 + 60));
  v35 = *v15;
  *(_DWORD *)(v12 + 88) = bswap32(*v15);
  if (v35 != 117440512)
    return 0;
  if (read(v50, v49, 4uLL) != 4)
  {
    v44 = (FILE *)*MEMORY[0x1E0C80C10];
    v45 = "***VPHeader::read: error reading ICC profile (1)\n";
    v46 = 49;
    goto LABEL_42;
  }
  v36 = bswap32(v49->i32[0]);
  sub_1D4C624F4(&v55, v36);
  v37 = read(v50, (void *)v55.value, v36);
  v38 = v54;
  if (v37 == v36)
  {
    v39 = CFDataCreate(0, (const UInt8 *)v55.value, v36);
    *(_QWORD *)(v38 + 96) = v39;
    if (v39)
    {
      if (v55.value)
      {
        *(_QWORD *)&v55.timescale = v55.value;
        operator delete((void *)v55.value);
      }
      return 0;
    }
    v47 = "***VPHeader::read: error reading ICC profile (3)\n";
  }
  else
  {
    v47 = "***VPHeader::read: error reading ICC profile (2)\n";
  }
  fwrite(v47, 0x31uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  if (v55.value)
  {
    *(_QWORD *)&v55.timescale = v55.value;
    operator delete((void *)v55.value);
  }
  return 0xFFFFFFFFLL;
}

void sub_1D4C8DE20(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 - 128);
  if (v3)
  {
    *(_QWORD *)(v1 - 120) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D4C8DE44(uint64_t a1, int a2)
{
  size_t v4;
  _DWORD *v5;
  unsigned int v6;
  uint64_t v7;
  int8x8_t *v8;
  unint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  int8x8_t v12;
  unsigned int v13;
  _DWORD *v14;
  unsigned int Length;
  const UInt8 *BytePtr;
  uint64_t v17;
  void *__p[3];
  _DWORD __buf[3];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 88) == 7 && !*(_QWORD *)(a1 + 96))
  {
    fwrite("***VPHeader::write: no ICC profile data\n", 0x28uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    return 0xFFFFFFFFLL;
  }
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
    v4 = 28 * *(unsigned int *)(a1 + 60) + 112;
  else
    v4 = 112;
  sub_1D4C624F4(__p, v4);
  v5 = __p[0];
  *(int8x8_t *)__p[0] = vrev32_s8(*(int8x8_t *)(a1 + 8));
  v5[2] = bswap32(*(_DWORD *)(a1 + 16));
  v5[3] = bswap32(*(_DWORD *)(a1 + 20));
  v5[4] = bswap32(*(_DWORD *)(a1 + 24));
  v5[5] = bswap32(*(_DWORD *)(a1 + 28));
  *((_QWORD *)v5 + 3) = bswap64(*(_QWORD *)(a1 + 32));
  v5[8] = bswap32(*(_DWORD *)(a1 + 40));
  v5[9] = bswap32(*(_DWORD *)(a1 + 56));
  v6 = *(_DWORD *)(a1 + 60);
  v7 = *(_QWORD *)(a1 + 64);
  if (v6 == -1227133513 * ((unint64_t)(*(_QWORD *)(a1 + 72) - v7) >> 2))
  {
    v5[10] = bswap32(v6);
    v8 = (int8x8_t *)(v5 + 11);
    if (*(_DWORD *)(a1 + 60))
    {
      v9 = 0;
      v10 = (unsigned int *)(v7 + 24);
      do
      {
        v11 = *v10;
        v12 = *(int8x8_t *)(v10 - 2);
        *(int8x16_t *)v8->i8 = vrev32q_s8(*(int8x16_t *)(v10 - 6));
        v8[2] = vrev32_s8(v12);
        v8[3].i32[0] = bswap32(v11);
        v8 = (int8x8_t *)((char *)v8 + 28);
        ++v9;
        v10 += 7;
      }
      while (v9 < *(unsigned int *)(a1 + 60));
    }
    v8->i32[0] = bswap32(*(_DWORD *)(a1 + 88));
    v13 = (_DWORD)v8 - (_DWORD)v5 + 4;
    __buf[0] = bswap32(*(_DWORD *)(a1 + 104));
    __buf[1] = 150994944;
    __buf[2] = bswap32(v13);
    if (write(a2, __buf, 0xCuLL) == 12)
    {
      if (write(a2, __p[0], v13) == v13)
      {
        if (*(_DWORD *)(a1 + 88) != 7)
        {
LABEL_15:
          v17 = 0;
          goto LABEL_21;
        }
        v14 = __p[0];
        Length = CFDataGetLength(*(CFDataRef *)(a1 + 96));
        *v14 = bswap32(Length);
        if (write(a2, __p[0], 4uLL) == 4)
        {
          BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 96));
          if (write(a2, BytePtr, Length) == Length)
            goto LABEL_15;
          sub_1D4C8E208();
        }
        else
        {
          sub_1D4C8E240();
        }
      }
      else
      {
        sub_1D4C8E278();
      }
    }
    else
    {
      sub_1D4C8E2B0();
    }
  }
  else
  {
    fwrite("***VPHeader::write: numPlanes/planeInfo mismatch\n", 0x31uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  }
  v17 = 0xFFFFFFFFLL;
LABEL_21:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v17;
}

void sub_1D4C8E104(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1D4C8E12C(uint64_t a1, int a2)
{
  unsigned int __buf;

  if (lseek(a2, 12, 0) < 0)
  {
    sub_1D4C8E2E8();
    return 0xFFFFFFFFLL;
  }
  __buf = bswap32(*(_DWORD *)(a1 + 8));
  if (write(a2, &__buf, 4uLL) != 4)
  {
    sub_1D4C8E320();
    return 0xFFFFFFFFLL;
  }
  return 0;
}

uint64_t sub_1D4C8E1A4(uint64_t a1, unsigned int a2)
{
  return *(_QWORD *)(a1 + 64) + 28 * a2;
}

float sub_1D4C8E1B4(unsigned int *a1, unsigned int *a2, float a3)
{
  float result;

  *a1 = vcvtps_u32_f32((float)*a1 / a3);
  result = (float)*a2 / a3;
  *a2 = vcvtps_u32_f32(result);
  *a1 = (*a1 + 1) & 0xFFFFFFFE;
  *a2 = (*a2 + 1) & 0xFFFFFFFE;
  return result;
}

size_t sub_1D4C8E200(const void *a1, size_t a2, uint64_t a3, FILE *a4)
{
  return fwrite(a1, a2, 1uLL, a4);
}

size_t sub_1D4C8E208()
{
  uint64_t v0;

  perror("write");
  return sub_1D4C8E200("***VPHeader::write: Error writing ICC profile (2).\n", 0x33uLL, v0, (FILE *)*MEMORY[0x1E0C80C10]);
}

size_t sub_1D4C8E240()
{
  uint64_t v0;

  perror("write");
  return sub_1D4C8E200("***VPHeader::write: Error writing ICC profile (1).\n", 0x33uLL, v0, (FILE *)*MEMORY[0x1E0C80C10]);
}

size_t sub_1D4C8E278()
{
  uint64_t v0;

  perror("write");
  return sub_1D4C8E200("***VPHeader::write: Error writing header.\n", 0x2AuLL, v0, (FILE *)*MEMORY[0x1E0C80C10]);
}

size_t sub_1D4C8E2B0()
{
  uint64_t v0;

  perror("write");
  return sub_1D4C8E200("***VPHeader::write: Error writing preheader.\n", 0x2DuLL, v0, (FILE *)*MEMORY[0x1E0C80C10]);
}

size_t sub_1D4C8E2E8()
{
  perror("lseek");
  return fwrite("***VPHeader::finalize: Error seeking to header.\n", 0x30uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
}

size_t sub_1D4C8E320()
{
  uint64_t v0;

  perror("write");
  return sub_1D4C8E200("***VPHeader::finalize: Error writing numFrames.\n", 0x30uLL, v0, (FILE *)*MEMORY[0x1E0C80C10]);
}

CVPixelBufferRef sub_1D4C8E358(CGImage *a1)
{
  int v1;
  CVPixelBufferRef result;
  CVReturn v3;
  CVPixelBufferRef v4;
  __int128 v5;
  size_t bytesPerRow[2];
  void *v7;

  v7 = 0;
  v5 = 0u;
  *(_OWORD *)bytesPerRow = 0u;
  v1 = sub_1D4C89B98(a1, 2, 16, 0, 1, 1, (uint64_t)&v5, &v7);
  result = 0;
  if (!v1)
  {
    v4 = 0;
    v3 = CVPixelBufferCreateWithBytes(0, v5, *((size_t *)&v5 + 1), 0x20u, v7, bytesPerRow[1], (CVPixelBufferReleaseBytesCallback)sub_1D4C8E400, 0, 0, &v4);
    if (v3)
    {
      printf("***CVPixelBufferCreateWithBytes returned %d\n", v3);
      free(v7);
      return 0;
    }
    else
    {
      return v4;
    }
  }
  return result;
}

void sub_1D4C8E400(int a1, void *a2)
{
  free(a2);
}

uint64_t sub_1D4C8EA1C(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_setInputReady);
}

void sub_1D4C8F1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1D4C8F1E4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1D4C8F1F4(uint64_t a1)
{

}

uint64_t sub_1D4C8F1FC(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "lockWhenCondition:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "unlockWithCondition:", 1);
}

void sub_1D4C8F478(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1D4C8F710(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4C8FB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1D4C90034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

uint64_t sub_1D4C900DC(void *a1, void *a2, CMTime *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  CMTime v10;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  if (v5 && v6)
  {
    CMTimeMake(&v10, objc_msgSend(v5, "longLongValue"), objc_msgSend(v6, "intValue"));
    v8 = 0;
    *a3 = v10;
  }
  else
  {
    NSLog(CFSTR("StabilizeParams: malformed dictionary (CMTime)"));
    v8 = 0xFFFFFFFFLL;
  }

  return v8;
}

void sub_1D4C9017C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1D4C90194(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_1D4C90498((void **)a1, v4);
  }
  else if (!v3)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 60 * a2;
  }
}

void sub_1D4C90268(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_1D4C9062C((void **)a1, v4);
  }
  else if (!v3)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 24 * a2;
  }
}

void sub_1D4C902E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void *sub_1D4C90454(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x444444444444445)
    sub_1D4C5919C();
  return operator new(60 * a2);
}

void sub_1D4C90498(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (0xEEEEEEEEEEEEEEEFLL * ((v6 - v7) >> 2) >= a2)
  {
    if (a2)
    {
      v13 = 60 * ((60 * a2 - 60) / 0x3C) + 60;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xEEEEEEEEEEEEEEEFLL * ((v7 - (_BYTE *)*a1) >> 2);
    v9 = v8 + a2;
    if (v8 + a2 > 0x444444444444444)
      sub_1D4C590D0();
    v10 = 0xEEEEEEEEEEEEEEEFLL * ((v5 - (_BYTE *)*a1) >> 2);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x222222222222222)
      v11 = 0x444444444444444;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)sub_1D4C90454(v4, v11);
    else
      v12 = 0;
    v14 = &v12[60 * v8];
    v15 = &v12[60 * v11];
    v16 = 60 * ((60 * a2 - 60) / 0x3C) + 60;
    bzero(v14, v16);
    v17 = &v14[v16];
    v19 = (char *)*a1;
    v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        v20 = *(_OWORD *)(v18 - 60);
        v21 = *(_OWORD *)(v18 - 44);
        v22 = *(_OWORD *)(v18 - 28);
        *((_OWORD *)v14 - 1) = *((_OWORD *)v18 - 1);
        *(_OWORD *)(v14 - 28) = v22;
        *(_OWORD *)(v14 - 44) = v21;
        *(_OWORD *)(v14 - 60) = v20;
        v14 -= 60;
        v18 -= 60;
      }
      while (v18 != v19);
      v18 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
      operator delete(v18);
  }
}

void sub_1D4C9062C(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (_BYTE *)*a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL)
      sub_1D4C590D0();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (_BYTE *)*a1) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)sub_1D4C59158(v4, v11);
    else
      v12 = 0;
    v14 = &v12[24 * v8];
    v15 = &v12[24 * v11];
    v16 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v14, v16);
    v17 = &v14[v16];
    v19 = (char *)*a1;
    v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        v20 = *(_OWORD *)(v18 - 24);
        *((_QWORD *)v14 - 1) = *((_QWORD *)v18 - 1);
        *(_OWORD *)(v14 - 24) = v20;
        v14 -= 24;
        v18 -= 24;
      }
      while (v18 != v19);
      v18 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
      operator delete(v18);
  }
}

_QWORD *sub_1D4C907AC(_QWORD *result, uint64_t a2)
{
  *result = &off_1E9863928;
  result[1] = a2;
  result[2] = 0;
  return result;
}

void *sub_1D4C907C0(uint64_t a1, void *__src, size_t __len)
{
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  void *result;

  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = v6 + __len;
  if (v6 + __len > *(_QWORD *)(v7 + 16))
  {
    *(_QWORD *)(v7 + 8) = malloc_type_realloc(*(void **)(v7 + 8), v6 + __len, 0x2EA67C1FuLL);
    *(_QWORD *)(v7 + 16) = v8;
    v7 = *(_QWORD *)(a1 + 8);
    v6 = *(_QWORD *)(a1 + 16);
  }
  result = memmove((void *)(*(_QWORD *)(v7 + 8) + v6), __src, __len);
  *(_QWORD *)(a1 + 16) += __len;
  return result;
}

uint64_t sub_1D4C90844(void *a1, int a2, uint64_t a3, void **a4, void *a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v13;
  __CFString *v14;
  uint64_t v15;
  int v17;
  VideoReader *v18;
  VideoReader *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  double Seconds;
  float v24;
  float v25;
  double v26;
  double v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t width;
  uint64_t height;
  CMTime *v33;
  int v34;
  int v35;
  int v36;
  VideoContext *v37;
  int32_t v38;
  double v39;
  void *v40;
  int v41;
  id v42;
  int v43;
  int32_t v44;
  __CVBuffer *ImageBuffer;
  id v46;
  double v47;
  double v48;
  unint64_t v49;
  double v50;
  _BOOL4 v51;
  unint64_t v52;
  unint64_t v53;
  double v54;
  double v55;
  double v56;
  unsigned int a_low;
  double v58;
  double v59;
  _BOOL4 v60;
  double v61;
  void *v62;
  CGAffineTransform *v63;
  void *v64;
  int v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  void *v70;
  __CFString *v71;
  BOOL v72;
  double v73;
  double v74;
  double v75;
  __CVBuffer *v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  int v81;
  int v82;
  _BYTE *v83;
  _BYTE *v84;
  size_t v85;
  uint64_t v86;
  CGFloat v87;
  double v88;
  uint64_t v89;
  unsigned int v90;
  char v91;
  id v92;
  VideoContext *v93;
  void *v94;
  void *v95;
  int v96;
  uint64_t v98;
  id v100;
  id v101;
  CMTime v102;
  CMTime v103;
  CMTime v104;
  CMTime v105;
  CMTime v106;
  CMTime v107[2];
  CFTypeRef cf;
  CFTypeRef v109;
  CMTime v110;
  CMTime v111;
  CMTime v112;
  CMTime v113;
  CMTime v114;
  CMTime v115;
  CMTime v116;
  void *__p;
  _BYTE *v118;
  uint64_t v119;
  CGAffineTransform v120;
  CGAffineTransform v121;
  CGAffineTransform v122;
  CMTime time;
  CMTime v124;
  CMTime rhs;
  CMTime lhs;
  CMTime time2;
  CMTime time1;
  __int128 v129;
  CGFloat c;
  _OWORD v131[5];
  __int128 v132;
  uint64_t v133;
  __int128 v134;
  uint64_t v135;
  CGAffineTransform v136;
  unsigned int v137;
  CGAffineTransform v138;
  CGRect v139;
  CGRect v140;
  CGRect CleanRect;
  CGRect v142;

  v101 = a1;
  v13 = a5;
  v100 = a8;
  if (a2 == -1 && !a3 || a2 != -1 && a3)
  {
    v14 = CFSTR("vpCreateFromFileCommon: multiple destinations, internal error");
LABEL_6:
    NSLog(&v14->isa);
    v15 = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
  v14 = CFSTR("vpCreateFromFile: NULL input argument");
  if (!v101 || !v13 || !a6)
    goto LABEL_6;
  v17 = *(_DWORD *)(a6 + 4);
  v96 = objc_msgSend(v13, "sparseFrames");
  v18 = -[VideoReader initWithAsset:]([VideoReader alloc], "initWithAsset:", v101);
  v19 = v18;
  if (!v18)
  {
    v15 = 0xFFFFFFFFLL;
    goto LABEL_118;
  }
  v91 = v17;
  v20 = v17 & 4;
  if ((v17 & 4) != 0)
    v21 = 3588;
  else
    v21 = 0;
  -[VideoReader setPixelFormatOptions:](v18, "setPixelFormatOptions:", v21);
  objc_msgSend(v13, "roiStart");
  v132 = v134;
  v133 = v135;
  -[VideoReader setReadStartT:](v19, "setReadStartT:", &v132);
  memset(&v131[1], 0, 64);
  v131[0] = 0u;
  DWORD1(v131[0]) = -[VideoReader imageHeight](v19, "imageHeight");
  v22 = -[VideoReader imageWidth](v19, "imageWidth");
  LODWORD(v131[0]) = v22;
  LODWORD(v131[1]) = *(_DWORD *)a6;
  if ((*(_BYTE *)(a6 + 4) & 2) != 0)
    NSLog(CFSTR("Image size : %uw x %uh\n"), v22, DWORD1(v131[0]));
  -[VideoReader preferredTransform](v19, "preferredTransform");
  *(CGAffineTransform *)((char *)&v131[1] + 8) = v136;
  objc_msgSend(v13, "roiLength");
  time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &time2))
  {
    objc_msgSend(v13, "roiLength");
    v129 = *(_OWORD *)&v136.a;
    c = v136.c;
    objc_msgSend(v13, "roiLength");
    Seconds = CMTimeGetSeconds(&time);
  }
  else
  {
    -[VideoReader trackLengthT](v19, "trackLengthT");
    objc_msgSend(v13, "roiStart");
    CMTimeSubtract((CMTime *)&v136, &lhs, &rhs);
    v129 = *(_OWORD *)&v136.a;
    c = v136.c;
    -[VideoReader trackLength](v19, "trackLength");
    v25 = v24;
    objc_msgSend(v13, "roiStart");
    Seconds = v25 - CMTimeGetSeconds(&v124);
  }
  objc_msgSend(v13, "cropRect");
  DWORD2(v131[0]) = v26;
  objc_msgSend(v13, "cropRect");
  HIDWORD(v131[0]) = v27;
  if (!DWORD2(v131[0]) || !v27)
    *((_QWORD *)&v131[0] + 1) = *(_QWORD *)&v131[0];
  if (*(float *)a6 != 1.0)
    sub_1D4C8E1B4((unsigned int *)v131 + 2, (unsigned int *)((unint64_t)v131 | 0xC), *(float *)a6);
  v28 = v21;
  v122 = *(CGAffineTransform *)((char *)&v131[1] + 8);
  if (CGAffineTransformIsIdentity(&v122))
  {
    BYTE8(v131[4]) = 0;
  }
  else
  {
    *(_QWORD *)&v131[4] = 0;
    *((_QWORD *)&v131[3] + 1) = 0;
    LODWORD(v30) = HIDWORD(v131[0]);
    LODWORD(v29) = DWORD2(v131[0]);
    v139.size.width = (double)v29;
    v139.size.height = (double)v30;
    *(_OWORD *)&v121.a = *(_OWORD *)((char *)&v131[1] + 8);
    *(_OWORD *)&v121.c = *(_OWORD *)((char *)&v131[2] + 8);
    *(_OWORD *)&v121.tx = 0u;
    v139.origin.x = 0.0;
    v139.origin.y = 0.0;
    v140 = CGRectApplyAffineTransform(v139, &v121);
    width = v140.size.width;
    height = v140.size.height;
    DWORD2(v131[0]) = v140.size.width;
    HIDWORD(v131[0]) = v140.size.height;
    v120 = *(CGAffineTransform *)((char *)&v131[1] + 8);
    CGAffineTransformInvert(&v136, &v120);
    *(CGAffineTransform *)((char *)&v131[1] + 8) = v136;
    BYTE8(v131[4]) = 1;
    if ((*(_BYTE *)(a6 + 4) & 2) != 0)
      NSLog(CFSTR("Xform size : %uw x %uh\n"), width, height);
  }
  *(int32x2_t *)(a7 + 16) = vrev64_s32(*(int32x2_t *)((char *)v131 + 8));
  *(_DWORD *)(a7 + 24) = v20 >> 2;
  -[VideoReader fps](v19, "fps");
  v33 = (CMTime *)MEMORY[0x1E0CA2E68];
  *(_DWORD *)(a7 + 12) = v34;
  v35 = -[VideoReader timeScale](v19, "timeScale");
  if (v35)
    v36 = v35;
  else
    v36 = 6000;
  *(_DWORD *)(a7 + 28) = v36;
  *(_OWORD *)(a7 + 32) = v129;
  *(CGFloat *)(a7 + 48) = c;
  v118 = 0;
  __p = 0;
  v119 = 0;
  v37 = -[VideoContext initWithWriter:pixelFormatFlags:]([VideoContext alloc], "initWithWriter:pixelFormatFlags:", 0, v28);
  v93 = v37;
  if (!v37)
  {
    NSLog(CFSTR("vpCreateFromFile: Error creating VideoContext"));
    v15 = 0xFFFFFFFFLL;
    goto LABEL_116;
  }
  v116 = *v33;
  objc_msgSend(v13, "roiLength");
  v114 = *v33;
  v38 = CMTimeCompare(&v115, &v114);
  if (v38)
  {
    objc_msgSend(v13, "roiStart");
    objc_msgSend(v13, "roiLength");
    CMTimeAdd((CMTime *)&v136, &v113, &v112);
    *(_OWORD *)&v116.value = *(_OWORD *)&v136.a;
    v116.epoch = *(_QWORD *)&v136.c;
    *(_OWORD *)&v111.value = *(_OWORD *)&v136.a;
    v111.epoch = *(_QWORD *)&v136.c;
    CMTimeConvertScale((CMTime *)&v136, &v111, *(_DWORD *)(a7 + 28), kCMTimeRoundingMethod_RoundTowardZero);
    *(_OWORD *)&v116.value = *(_OWORD *)&v136.a;
    v116.epoch = *(_QWORD *)&v136.c;
  }
  memset(&v110, 0, sizeof(v110));
  v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  v98 = 0;
  v109 = 0;
  v39 = 0.0;
  do
  {
    cf = 0;
    memset(&v107[1], 0, sizeof(CMTime));
    v40 = (void *)MEMORY[0x1D82662EC](objc_msgSend(v13, "timeForFrame:", v98));
    v41 = -[VideoReader getFrameAsSampleBuf:](v19, "getFrameAsSampleBuf:", &cf);
    memset(v107, 0, 24);
    -[VideoReader lastPresentationTime](v19, "lastPresentationTime");
    if (v41)
    {
      if (v41 == 1)
      {
        v42 = 0;
LABEL_43:
        v43 = 2;
        goto LABEL_46;
      }
      v42 = 0;
      NSLog(CFSTR("*** vpCreateFromFile: Error reading video file\n"));
      goto LABEL_45;
    }
    if (v38)
    {
      v106 = v107[0];
      v105 = v116;
      if ((CMTimeCompare(&v106, &v105) & 0x80000000) == 0)
      {
        v42 = 0;
        CFRelease(cf);
        goto LABEL_43;
      }
    }
    if (v96)
    {
      v104 = v107[1];
      v103 = v107[0];
      v44 = CMTimeCompare(&v104, &v103);
      if (v44 < 0)
      {
        NSLog(CFSTR("vpCreateFromFile: missed frame; looking for %lld/%d; got %lld/%d"),
          v107[1].value,
          v107[1].timescale,
          v107[0].value,
          v107[0].timescale);
        CFRelease(cf);
        v42 = 0;
        goto LABEL_45;
      }
      if (v44)
      {
        CFRelease(cf);
        v42 = 0;
LABEL_52:
        if (v98 >= objc_msgSend(v13, "numFrames"))
          goto LABEL_43;
        goto LABEL_53;
      }
    }
    ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)cf);
    if (!ImageBuffer)
    {
      NSLog(CFSTR("vpCreateFromFile: Error obtaining CVPixelBufferRef"));
      v42 = 0;
      CFRelease(cf);
LABEL_45:
      v43 = 1;
      goto LABEL_46;
    }
    v46 = v13;
    v92 = v94;
    v95 = v46;
    CleanRect = CVImageBufferGetCleanRect(ImageBuffer);
    v47 = CleanRect.size.width;
    v48 = CleanRect.size.height;
    if ((objc_msgSend(v46, "passThrough", CleanRect.origin.x, CleanRect.origin.y) & 1) != 0
      && (LODWORD(v49) = DWORD2(v131[0]), v50 = (double)v49, v47 == v50)
      && (LODWORD(v50) = HIDWORD(v131[0]), v48 == (double)*(unint64_t *)&v50))
    {
      v138 = *(CGAffineTransform *)((char *)&v131[1] + 8);
      v51 = !CGAffineTransformIsIdentity(&v138);
    }
    else
    {
      v51 = 1;
    }
    objc_msgSend(v46, "cropRect");
    if (CGRectIsEmpty(v142))
    {
      LODWORD(v53) = DWORD1(v131[0]);
      LODWORD(v52) = v131[0];
      objc_msgSend(v46, "setCropRect:", 0.0, 0.0, (double)v52, (double)v53);
    }
    else
    {
      v51 = 1;
    }
    objc_msgSend(v46, "cropRect");
    LODWORD(v136.a) = v54;
    objc_msgSend(v46, "cropRect");
    v137 = v55;
    *(float *)&v56 = sub_1D4C8E1B4((unsigned int *)&v136, &v137, *(float *)&v131[1]);
    LODWORD(v48) = v137;
    a_low = LODWORD(v136.a);
    objc_msgSend(v95, "cropRect", v56);
    v58 = (double)*(unint64_t *)&v48;
    v60 = v59 != (double)a_low;
    if (v61 != v58)
      v60 = 1;
    if (v60 || v51)
    {
      sub_1D4C8D468(ImageBuffer, v92);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v95, "passThrough") & 1) != 0)
      {
        v63 = 0;
      }
      else
      {
        v63 = &v136;
        objc_msgSend(v95, "getFrameInfo:frameInfo:", v98, &v136);
      }
      objc_msgSend(v95, "cropRect");
      sub_1D4C88E58(v62, (uint64_t)v63, 2, (_OWORD *)((char *)&v131[1] + 8), v66, v67, v68, v69, (double)a_low, v58);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v70;
      if (v70)
      {

        v65 = 0;
      }
      else
      {
        NSLog(CFSTR("Error peforming CoreImage transform"));
        v65 = -1;
      }

    }
    else
    {
      v64 = 0;
      v65 = 0;
    }

    v42 = v64;
    v71 = CFSTR("vpCreateFromFile: Error tranforming pixel buffer for frame %u");
    if (v65)
    {
LABEL_85:
      v37 = v93;
      NSLog(&v71->isa, v98);
LABEL_86:
      CFRelease(cf);
      goto LABEL_45;
    }
    v37 = v93;
    if (!v42)
      goto LABEL_84;
    if (v109)
    {
      v72 = -[VideoContext pixelBuffer:conformsToImage:](v93, "pixelBuffer:conformsToImage:", v109, v42);
      ImageBuffer = (__CVBuffer *)v109;
      if (v72)
        goto LABEL_82;
      CFRelease(v109);
      objc_msgSend(v42, "extent");
      v74 = v73;
      objc_msgSend(v42, "extent");
      v76 = -[VideoContext createPixelBuffer:height:](v93, "createPixelBuffer:height:", (unint64_t)v74, (unint64_t)v75);
    }
    else
    {
      objc_msgSend(v42, "extent");
      v78 = v77;
      objc_msgSend(v42, "extent");
      v76 = -[VideoContext createPixelBuffer:height:](v93, "createPixelBuffer:height:", (unint64_t)v78, (unint64_t)v79);
    }
    ImageBuffer = v76;
    v109 = v76;
LABEL_82:
    if (!ImageBuffer)
    {
      NSLog(CFSTR("Error extracting pixel buffer from CIImage"));
      goto LABEL_86;
    }
    -[VideoContext ciCtx](v93, "ciCtx");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "render:toCVPixelBuffer:", v42, ImageBuffer);

LABEL_84:
    v81 = sub_1D4C914F8(ImageBuffer, a7, (unint64_t *)&__p, a2, a3);
    v71 = CFSTR("vpCreateFromFile: Error adding pixel buffer for frame %u");
    if (v81)
      goto LABEL_85;
    v37 = v93;
    CFRelease(cf);
    if (!(_DWORD)v98)
    {
      v82 = objc_msgSend(v95, "numFrames");
      if (a3)
      {
        if (v82)
        {
          v83 = v118;
          v84 = __p;
          v85 = (v83 - v84) * objc_msgSend(v95, "numFrames");
          v86 = *(_QWORD *)(a3 + 8);
          *(_QWORD *)(v86 + 8) = malloc_type_realloc(*(void **)(v86 + 8), v85, 0x2EA67C1FuLL);
          *(_QWORD *)(v86 + 16) = v85;
          v37 = v93;
        }
      }
    }
    if ((v91 & 0x10) != 0)
    {
      objc_msgSend(v95, "timeForFrame:", v98);
      *(_OWORD *)&v110.value = *(_OWORD *)&v136.a;
      v87 = v136.c;
    }
    else
    {
      *(_OWORD *)&v110.value = *(_OWORD *)&v107[0].value;
      v87 = *(double *)&v107[0].epoch;
    }
    *(CGFloat *)&v110.epoch = v87;
    sub_1D4C91E3C(a4, (__int128 *)&v110.value);
    if (v100)
    {
      v102 = v110;
      v88 = CMTimeGetSeconds(&v102);
      if (v39 == 0.0)
      {
        v89 = 0;
        v39 = v88;
      }
      else
      {
        v90 = ((v88 - v39) / Seconds * 100.0);
        v89 = v90 >= 0x64 ? 100 : v90;
      }
      if (objc_msgSend(v100, "vpcCallback:", v89))
      {
        NSLog(CFSTR("vpCreateFromFile: VPCCallback aborted"));
        goto LABEL_45;
      }
    }
    v98 = (v98 + 1);
    if (v96)
      goto LABEL_52;
LABEL_53:
    v43 = 0;
LABEL_46:

    objc_autoreleasePoolPop(v40);
  }
  while (!v43);
  if (v43 == 2)
  {
    if (*(_DWORD *)(a7 + 8) == (_DWORD)v98)
    {
      if (!objc_msgSend(v13, "numFrames") || objc_msgSend(v13, "numFrames") == (_DWORD)v98)
      {
        v15 = 0;
        goto LABEL_115;
      }
      NSLog(CFSTR("*** vpCreateFromFile: frame count mismatch ***"));
      NSLog(CFSTR("    stabParams.numFrames %u  frameDex %u"), objc_msgSend(v13, "numFrames"), v98);
    }
    else
    {
      NSLog(CFSTR("*** vpCreateFromFile: internal error maintaining numFrames"));
    }
  }
  v15 = 0xFFFFFFFFLL;
LABEL_115:
  sub_1D4C914E4(&v109);

LABEL_116:
  if (__p)
  {
    v118 = __p;
    operator delete(__p);
  }
LABEL_118:

LABEL_7:
  return v15;
}

void sub_1D4C913AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,const void *a52)
{
  void *v52;
  void *v53;
  void *v54;
  void *v56;

  sub_1D4C914E4(&a52);
  v56 = (void *)STACK[0x218];
  if (STACK[0x218])
  {
    STACK[0x220] = (unint64_t)v56;
    operator delete(v56);
  }

  _Unwind_Resume(a1);
}

void sub_1D4C914E4(const void **a1)
{
  const void *v1;

  if (a1)
  {
    v1 = *a1;
    if (v1)
      CFRelease(v1);
  }
}

uint64_t sub_1D4C914F8(CVPixelBufferRef pixelBuffer, uint64_t a2, unint64_t *a3, int a4, uint64_t a5)
{
  unint64_t *v7;
  __CVBuffer *v9;
  unsigned int v10;
  _BYTE *v11;
  OSType PixelFormatType;
  double x;
  double y;
  double v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  char *BaseAddress;
  size_t BytesPerRow;
  uint64_t v21;
  char *v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  unsigned int v26;
  char *v27;
  char v28;
  _BYTE *v29;
  uint64_t v30;
  unsigned int v31;
  CGSize EncodedSize;
  unint64_t v33;
  _DWORD *v34;
  char *BaseAddressOfPlane;
  __CVBuffer *v36;
  size_t BytesPerRowOfPlane;
  size_t v38;
  unsigned int v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  size_t v44;
  char *v45;
  unint64_t v46;
  uint64_t v47;
  size_t v48;
  uint64_t result;
  void *v50;
  size_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __CVBuffer *v56;
  unint64_t v57;
  int v58;
  int v59;
  int v60;
  char *v61;
  size_t PlaneCount;
  double width;
  double height;
  uint64_t v65;
  _QWORD *v66;
  unsigned int *v67;
  char v68;
  void **v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  char v73;
  unsigned int v74;
  double v75;
  unsigned int v76;
  int v77;
  __CVBuffer *v78;
  unsigned int *v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unsigned int v83;
  char *v84;
  char *v85;
  unsigned int *v86;
  unsigned int *v87;
  __int128 v88;
  unsigned int v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  char *v94;
  uint64_t v95;
  char *v96;
  char *v97;
  char *v98;
  __int128 v99;
  uint64_t v100;
  unint64_t v101;
  BOOL v102;
  char v103;
  int __fd;
  int __fda;
  uint64_t v106;
  uint64_t v107;
  unint64_t *v108;
  unint64_t *v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD v113[3];
  CGRect CleanRect;
  CGRect v115;
  CGRect v116;

  v7 = a3;
  v9 = pixelBuffer;
  v113[1] = *MEMORY[0x1E0C80C00];
  v10 = *(_DWORD *)(a2 + 24);
  if (a3[1] == *a3)
  {
    CleanRect = CVImageBufferGetCleanRect(pixelBuffer);
    *(_DWORD *)(a2 + 16) = CleanRect.size.height;
    *(_DWORD *)(a2 + 20) = CleanRect.size.width;
    PixelFormatType = CVPixelBufferGetPixelFormatType(v9);
    *(_DWORD *)(a2 + 56) = PixelFormatType;
    if ((v10 & 1) != 0)
    {
      if ((PixelFormatType | 0x10) != 0x34323076)
      {
        NSLog(CFSTR("initHeaderYUV: pixelFormat-specific work needed"));
        NSLog(CFSTR("    pixelFormat 0x%x '%c%c%c%c'\n"), *(unsigned int *)(a2 + 56), HIBYTE(*(_DWORD *)(a2 + 56)), (unsigned __int16)HIWORD(*(_DWORD *)(a2 + 56)), *(_DWORD *)(a2 + 56) >> 8, *(unsigned int *)(a2 + 56));
        return 0xFFFFFFFFLL;
      }
      v112 = 0x200000001;
      v113[0] = 0x200000001;
      v111 = 0x200000001;
      if (*(_DWORD *)(a2 + 60))
      {
        NSLog(CFSTR("initHeaderYUV: vpHdr.numPlanes nonzero (%u)"), *(unsigned int *)(a2 + 60));
        return 0xFFFFFFFFLL;
      }
      v55 = *(_QWORD *)(a2 + 72) - *(_QWORD *)(a2 + 64);
      if (v55)
      {
        NSLog(CFSTR("initHeaderYUV: vpHdr.planeInfo.size() nonzero (%u)"), 0x6DB6DB6DB6DB6DB7 * (v55 >> 2));
        return 0xFFFFFFFFLL;
      }
      PlaneCount = CVPixelBufferGetPlaneCount(v9);
      if ((_DWORD)PlaneCount != 2)
      {
        NSLog(CFSTR("initHeaderYUV: expected numPanes %u, got %u"), 2, PlaneCount);
        return 0xFFFFFFFFLL;
      }
      v103 = v10;
      __fda = a4;
      v107 = a5;
      v109 = v7;
      v116 = CVImageBufferGetCleanRect(v9);
      width = v116.size.width;
      height = v116.size.height;
      v10 = 0;
      v65 = 0;
      v66 = (_QWORD *)(a2 + 80);
      v67 = *(unsigned int **)(a2 + 72);
      v68 = 1;
      v69 = (void **)(a2 + 64);
      do
      {
        v70 = *((_DWORD *)v113 + v65);
        v71 = *((_DWORD *)&v113[-1] + v65);
        v72 = *((_DWORD *)&v111 + v65);
        v73 = v68;
        v74 = (width / (double)v71);
        v75 = height / (double)v72;
        v76 = v75;
        v77 = v70 * v74;
        if ((unint64_t)v67 >= *v66)
        {
          v78 = v9;
          v79 = (unsigned int *)*v69;
          v80 = 0x6DB6DB6DB6DB6DB7 * (((char *)v67 - (_BYTE *)*v69) >> 2);
          v81 = v80 + 1;
          if ((unint64_t)(v80 + 1) > 0x924924924924924)
            sub_1D4C590D0();
          v110 = v73;
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v66 - (_QWORD)v79) >> 2) > v81)
            v81 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v66 - (_QWORD)v79) >> 2);
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*v66 - (_QWORD)v79) >> 2)) >= 0x492492492492492)
            v82 = 0x924924924924924;
          else
            v82 = v81;
          if (v82)
          {
            v83 = v75;
            v84 = (char *)sub_1D4C81D1C((uint64_t)v66, v82);
            v76 = v83;
            v69 = (void **)(a2 + 64);
            v85 = v84;
            v79 = *(unsigned int **)(a2 + 64);
            v67 = *(unsigned int **)(a2 + 72);
          }
          else
          {
            v85 = 0;
          }
          v86 = (unsigned int *)&v85[28 * v80];
          *v86 = v74;
          v86[1] = v76;
          v86[2] = v77;
          v86[3] = 1;
          v86[4] = v70;
          v86[5] = v71;
          v86[6] = v72;
          v87 = v86;
          v9 = v78;
          if (v67 != v79)
          {
            do
            {
              v88 = *(_OWORD *)(v67 - 7);
              *((_OWORD *)v87 - 1) = *((_OWORD *)v67 - 1);
              *(_OWORD *)(v87 - 7) = v88;
              v87 -= 7;
              v67 -= 7;
            }
            while (v67 != v79);
            v79 = (unsigned int *)*v69;
          }
          v67 = v86 + 7;
          *(_QWORD *)(a2 + 64) = v87;
          *(_QWORD *)(a2 + 72) = v86 + 7;
          *(_QWORD *)(a2 + 80) = &v85[28 * v82];
          if (v79)
          {
            v89 = v76;
            operator delete(v79);
            v76 = v89;
            v69 = (void **)(a2 + 64);
          }
          v66 = (_QWORD *)(a2 + 80);
          v73 = v110;
        }
        else
        {
          *v67 = v74;
          v67[1] = v76;
          v67[2] = v77;
          v67[3] = 1;
          v67[4] = v70;
          v67[5] = v71;
          v67[6] = v72;
          v67 += 7;
        }
        v68 = 0;
        *(_QWORD *)(a2 + 72) = v67;
        v10 += v77 * v76;
        v65 = 1;
      }
      while ((v73 & 1) != 0);
      *(_DWORD *)(a2 + 60) = 2;
      *(_DWORD *)(a2 + 88) = 3;
      a5 = v107;
      v7 = v109;
      a4 = __fda;
    }
    else
    {
      if (PixelFormatType != 1111970369 && PixelFormatType != 32)
      {
        NSLog(CFSTR("initHeaderRGB: pixelFormat-specific work needed"));
        NSLog(CFSTR("    pixelFormat 0x%x '%c%c%c%c'\n"), *(unsigned int *)(a2 + 56), HIBYTE(*(_DWORD *)(a2 + 56)), (unsigned __int16)HIWORD(*(_DWORD *)(a2 + 56)), *(_DWORD *)(a2 + 56) >> 8, *(unsigned int *)(a2 + 56));
        return 0xFFFFFFFFLL;
      }
      if (*(_DWORD *)(a2 + 60))
      {
        NSLog(CFSTR("initHeaderRGB: vpHdr.numPlanes nonzero (%u)"), *(unsigned int *)(a2 + 60));
        return 0xFFFFFFFFLL;
      }
      v53 = *(_QWORD *)(a2 + 64);
      v52 = *(_QWORD *)(a2 + 72);
      v54 = (uint64_t)(v52 - v53) / 28;
      if (v52 != v53)
      {
        NSLog(CFSTR("initHeaderRGB: vpHdr.planeInfo.size() nonzero (%u)"), (uint64_t)(v52 - v53) / 28);
        return 0xFFFFFFFFLL;
      }
      v56 = v9;
      v57 = *(_QWORD *)(a2 + 80);
      v58 = *(_DWORD *)(a2 + 16);
      v59 = *(_DWORD *)(a2 + 20);
      v60 = 3 * v59;
      v103 = v10;
      if (v52 >= v57)
      {
        v90 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v57 - v53) >> 2);
        if (2 * v90 <= v54 + 1)
          v91 = v54 + 1;
        else
          v91 = 2 * v90;
        if (v90 >= 0x492492492492492)
          v92 = 0x924924924924924;
        else
          v92 = v91;
        v93 = (char *)sub_1D4C81D1C(a2 + 80, v92);
        v94 = &v93[28 * v54];
        v96 = &v93[28 * v95];
        *(_DWORD *)v94 = v59;
        *((_DWORD *)v94 + 1) = v58;
        *((_DWORD *)v94 + 2) = v60;
        *(_OWORD *)(v94 + 12) = xmmword_1D4C95780;
        v61 = v94 + 28;
        v98 = *(char **)(a2 + 64);
        v97 = *(char **)(a2 + 72);
        v9 = v56;
        if (v97 != v98)
        {
          do
          {
            v99 = *(_OWORD *)(v97 - 28);
            *((_OWORD *)v94 - 1) = *((_OWORD *)v97 - 1);
            *(_OWORD *)(v94 - 28) = v99;
            v94 -= 28;
            v97 -= 28;
          }
          while (v97 != v98);
          v97 = *(char **)(a2 + 64);
        }
        *(_QWORD *)(a2 + 64) = v94;
        *(_QWORD *)(a2 + 72) = v61;
        *(_QWORD *)(a2 + 80) = v96;
        if (v97)
          operator delete(v97);
      }
      else
      {
        *(_DWORD *)v52 = v59;
        *(_DWORD *)(v52 + 4) = v58;
        *(_DWORD *)(v52 + 8) = v60;
        *(_OWORD *)(v52 + 12) = xmmword_1D4C95780;
        v61 = (char *)(v52 + 28);
        v9 = v56;
      }
      *(_QWORD *)(a2 + 72) = v61;
      v10 = v60 * v58;
      *(_DWORD *)(a2 + 60) = 1;
      *(_DWORD *)(a2 + 88) = 1;
    }
    v100 = v10;
    v101 = v7[1] - *v7;
    v102 = v10 >= v101;
    if (v10 <= v101)
    {
      LOBYTE(v10) = v103;
      if (!v102)
        v7[1] = *v7 + v100;
    }
    else
    {
      sub_1D4C6261C(v7, v10 - v101);
      LOBYTE(v10) = v103;
    }
    if (a5 || !sub_1D4C8DE44(a2, a4))
      goto LABEL_2;
    NSLog(CFSTR("***vpAppendFramePixBuf: error writing VPHeader"));
    return 0xFFFFFFFFLL;
  }
LABEL_2:
  v11 = (_BYTE *)*v7;
  if (CVPixelBufferLockBaseAddress(v9, 1uLL))
  {
    NSLog(CFSTR("**vpAppendFramePixBuf: error on CVPixelBufferLockBaseAddress"));
    return 0xFFFFFFFFLL;
  }
  v115 = CVImageBufferGetCleanRect(v9);
  x = v115.origin.x;
  y = v115.origin.y;
  v15 = v115.size.width;
  v16 = v115.size.height;
  v106 = a5;
  v108 = v7;
  __fd = a4;
  if ((v10 & 1) != 0)
  {
    EncodedSize = CVImageBufferGetEncodedSize(v9);
    if (*(_DWORD *)(a2 + 60))
    {
      v33 = 0;
      do
      {
        v34 = (_DWORD *)sub_1D4C8E1A4(a2, v33);
        BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(v9, v33);
        v36 = v9;
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v9, v33);
        if (v34[1])
        {
          v38 = BytesPerRowOfPlane;
          v39 = 0;
          v40 = v34[4];
          v41 = v34[5];
          v43 = v34[2];
          v42 = v34[3];
          v44 = (unint64_t)(v15
                                 * (double)v40
                                 * (double)v42
                                 / (double)v41);
          v45 = &BaseAddressOfPlane[BytesPerRowOfPlane
                                  * (unint64_t)(EncodedSize.height - (y + v16))
                                  / v34[6]
                                  + v40 * (unint64_t)x * v42 / v41];
          do
          {
            memmove(v11, v45, v44);
            v11 += v43;
            v45 += v38;
            ++v39;
          }
          while (v39 < v34[1]);
        }
        ++v33;
        v9 = v36;
      }
      while (v33 < *(unsigned int *)(a2 + 60));
    }
  }
  else
  {
    v17 = (unint64_t)v115.origin.x;
    v18 = (unint64_t)(CVImageBufferGetEncodedSize(v9).height - (v115.origin.y + v115.size.height));
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(v9);
    BytesPerRow = CVPixelBufferGetBytesPerRow(v9);
    v21 = sub_1D4C8E1A4(a2, 0);
    v22 = &BaseAddress[4 * (unint64_t)x + BytesPerRow * v18];
    if (*(_DWORD *)(v21 + 16) == 3)
    {
      if (*(_DWORD *)(a2 + 16))
      {
        v23 = 0;
        v24 = (uint64_t)&BaseAddress[4 * v17 + 3 + BytesPerRow * v18];
        do
        {
          v25 = *(_DWORD *)(a2 + 56);
          if (v25 == 1111970369)
          {
            if (*(_DWORD *)(a2 + 20))
            {
              v30 = 0;
              v31 = 0;
              do
              {
                *v11 = v22[v30];
                v11[1] = v22[v30 + 1];
                v29 = v11 + 3;
                v11[2] = v22[v30 + 2];
                ++v31;
                v30 += 4;
                v11 += 3;
              }
              while (v31 < *(_DWORD *)(a2 + 20));
              goto LABEL_24;
            }
          }
          else
          {
            if (v25 != 32)
            {
              NSLog(CFSTR("Internal error in writePixelDataRGB: pixelFormat specific work needed"));
              return 0xFFFFFFFFLL;
            }
            if (*(_DWORD *)(a2 + 20))
            {
              v26 = 0;
              v27 = (char *)v24;
              do
              {
                *v11 = *(v27 - 2);
                v11[1] = *(v27 - 1);
                v28 = *v27;
                v27 += 4;
                v29 = v11 + 3;
                v11[2] = v28;
                ++v26;
                v11 += 3;
              }
              while (v26 < *(_DWORD *)(a2 + 20));
              goto LABEL_24;
            }
          }
          v29 = v11;
LABEL_24:
          v22 += BytesPerRow;
          ++v23;
          v24 += BytesPerRow;
          v11 = v29;
        }
        while (v23 < *(_DWORD *)(a2 + 16));
      }
    }
    else if (*(_DWORD *)(a2 + 16))
    {
      v46 = 0;
      v47 = *(unsigned int *)(v21 + 8);
      v48 = vcvtd_n_u64_f64(v15, 2uLL);
      do
      {
        memmove(v11, v22, v48);
        v11 += v47;
        v22 += BytesPerRow;
        ++v46;
      }
      while (v46 < *(unsigned int *)(a2 + 16));
    }
  }
  if (CVPixelBufferUnlockBaseAddress(v9, 1uLL))
  {
    NSLog(CFSTR("**vpAppendFramePixBuf: error on CVPixelBufferUnlockBaseAddress"));
    return 0xFFFFFFFFLL;
  }
  v50 = (void *)*v108;
  v51 = v108[1] - *v108;
  if (v106)
  {
    sub_1D4C907C0(v106, v50, v51);
  }
  else if (write(__fd, v50, v51) != v108[1] - *v108)
  {
    sub_1D4C91F78();
    return 0xFFFFFFFFLL;
  }
  result = 0;
  ++*(_DWORD *)(a2 + 8);
  return result;
}

void sub_1D4C91DF0(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    __cxa_begin_catch(exception_object);
    NSLog(CFSTR("Error allocating frame buffer"));
    __cxa_end_catch();
    JUMPOUT(0x1D4C9192CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D4C91E3C(void **a1, __int128 *a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  __int128 v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  __int128 v17;
  char *v18;
  char *v19;
  __int128 v20;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= (unint64_t)v6)
  {
    v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (_QWORD)*a1) >> 3);
    v11 = v10 + 1;
    if (v10 + 1 > 0xAAAAAAAAAAAAAAALL)
      sub_1D4C590D0();
    v12 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (_BYTE *)*a1) >> 3);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0x555555555555555)
      v13 = 0xAAAAAAAAAAAAAAALL;
    else
      v13 = v11;
    if (v13)
      v14 = (char *)sub_1D4C59158(v4, v13);
    else
      v14 = 0;
    v15 = &v14[24 * v10];
    v16 = &v14[24 * v13];
    v17 = *a2;
    *((_QWORD *)v15 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v15 = v17;
    v9 = v15 + 24;
    v19 = (char *)*a1;
    v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        v20 = *(_OWORD *)(v18 - 24);
        *((_QWORD *)v15 - 1) = *((_QWORD *)v18 - 1);
        *(_OWORD *)(v15 - 24) = v20;
        v15 -= 24;
        v18 -= 24;
      }
      while (v18 != v19);
      v18 = (char *)*a1;
    }
    *a1 = v15;
    a1[1] = v9;
    a1[2] = v16;
    if (v18)
      operator delete(v18);
  }
  else
  {
    v8 = *a2;
    *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v7 = v8;
    v9 = (char *)(v7 + 24);
  }
  a1[1] = v9;
}

void sub_1D4C91F64()
{
  JUMPOUT(0x1D82660DCLL);
}

void sub_1D4C91F78()
{
  perror("write");
  NSLog(CFSTR("***vpAppendFramePixBuf: Error writing frameBuf."));
}

void sub_1D4C91FA0(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  CMTimeEpoch v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CMTimeEpoch v12;
  CMTimeEpoch v13;
  uint64_t v14;
  CMTime *v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  CMTimeEpoch v20;
  uint64_t v21;
  CMTimeEpoch v22;
  CMTimeValue v23;
  unint64_t v24;
  __int128 v25;
  CMTime *value;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  CMTimeEpoch v31;
  double v32;
  __int128 *v33;
  CMTime v35;
  CMTime v36;
  CMTime v37;
  CMTime v38;
  CMTime v39;
  CMTime v40;
  CMTime time2;
  CMTime time1;
  CMTime v43;
  CMTime v44;
  CMTime v45;
  CMTime rhs;
  CMTime lhs;
  CMTime v48;

  if ((a2 & 0x1F) != 0)
  {
    sub_1D4C92454(a2, a3);
    return;
  }
  if (!a1 || (v5 = *a1, (v6 = a1[1] - *a1) == 0) || (v7 = -1431655765 * (v6 >> 3), v7 <= 2))
  {
LABEL_6:
    *(_QWORD *)(a3 + 16) = 0;
    *(_OWORD *)a3 = xmmword_1D4C95800;
    return;
  }
  memset(&v48, 0, sizeof(v48));
  lhs = *(CMTime *)(v5 + 24);
  v8 = *(_QWORD *)(v5 + 16);
  *(_OWORD *)&rhs.value = *(_OWORD *)v5;
  rhs.epoch = v8;
  CMTimeSubtract(&v48, &lhs, &rhs);
  v9 = 0;
  v10 = v7 - 2;
  do
  {
    memset(&v45, 0, sizeof(v45));
    v11 = *a1 + v9;
    v12 = *(_QWORD *)(v11 + 64);
    *(_OWORD *)&v44.value = *(_OWORD *)(v11 + 48);
    v44.epoch = v12;
    v13 = *(_QWORD *)(v11 + 40);
    *(_OWORD *)&v43.value = *(_OWORD *)(v11 + 24);
    v43.epoch = v13;
    CMTimeSubtract(&v45, &v44, &v43);
    time1 = v45;
    time2 = v48;
    if (CMTimeCompare(&time1, &time2))
    {
      v14 = MEMORY[0x1E0CA2E10];
      sub_1D4C64380(&v45, v7 - 1, MEMORY[0x1E0CA2E10]);
      v15 = *(CMTime **)&v45.timescale;
      if (*(_QWORD *)&v45.timescale == v45.value)
      {
        v27 = 0;
        value = *(CMTime **)&v45.timescale;
      }
      else
      {
        v16 = 0;
        v17 = 1;
        do
        {
          memset(&v38, 0, sizeof(v38));
          v18 = *a1;
          v19 = *a1 + 24 * v17;
          v20 = *(_QWORD *)(v19 + 16);
          *(_OWORD *)&v37.value = *(_OWORD *)v19;
          v37.epoch = v20;
          v21 = v18 + 24 * v16;
          v22 = *(_QWORD *)(v21 + 16);
          *(_OWORD *)&v36.value = *(_OWORD *)v21;
          v36.epoch = v22;
          CMTimeSubtract(&v38, &v37, &v36);
          v23 = v45.value + 24 * v16;
          v24 = v17;
          v25 = *(_OWORD *)&v38.value;
          *(_QWORD *)(v23 + 16) = v38.epoch;
          *(_OWORD *)v23 = v25;
          value = (CMTime *)v45.value;
          v15 = *(CMTime **)&v45.timescale;
          v27 = 0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)&v45.timescale - v45.value) >> 3);
          ++v17;
          v16 = v24;
        }
        while (v27 > v24);
      }
      v28 = 126 - 2 * __clz(v27);
      if (v15 == value)
        v29 = 0;
      else
        v29 = v28;
      sub_1D4C92538(value, v15, v29, 1);
      v30 = v45.value + 24 * ((0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)&v45.timescale - v45.value) >> 3)) >> 1);
      v31 = *(_QWORD *)(v30 + 16);
      *(_OWORD *)&v35.value = *(_OWORD *)v30;
      v35.epoch = v31;
      v32 = 1.0 / CMTimeGetSeconds(&v35);
      *(_OWORD *)a3 = *(_OWORD *)v14;
      *(_QWORD *)(a3 + 16) = *(_QWORD *)(v14 + 16);
      if (v32 >= 20.0)
      {
        if (v32 < 23.5 || v32 > 24.5)
        {
          if (v32 <= 24.5 || v32 > 25.5)
          {
            if (v32 >= 29.5 && v32 < 30.0)
            {
              *(_QWORD *)(a3 + 16) = 0;
              v33 = &xmmword_1D4C95800;
            }
            else if (v32 < 30.0 || v32 >= 30.2)
            {
              if (v32 < 119.0 || v32 >= 121.0)
              {
                if (v32 < 238.0 || v32 >= 242.0)
                {
                  if ((~*(_DWORD *)(a3 + 12) & 0x11) == 0)
                  {
                    CMTimeMakeWithSeconds(&v38, 1.0 / v32, 2400);
                    *(CMTime *)a3 = v38;
                  }
                  goto LABEL_40;
                }
                *(_QWORD *)(a3 + 16) = 0;
                v33 = &xmmword_1D4C958A8;
              }
              else
              {
                *(_QWORD *)(a3 + 16) = 0;
                v33 = &xmmword_1D4C95890;
              }
            }
            else
            {
              *(_QWORD *)(a3 + 16) = 0;
              v33 = &xmmword_1D4C95878;
            }
          }
          else
          {
            *(_QWORD *)(a3 + 16) = 0;
            v33 = &xmmword_1D4C95860;
          }
        }
        else
        {
          *(_QWORD *)(a3 + 16) = 0;
          v33 = &xmmword_1D4C95848;
        }
      }
      else
      {
        *(_QWORD *)(a3 + 16) = 0;
        v33 = &xmmword_1D4C95830;
      }
      *(_OWORD *)a3 = *v33;
LABEL_40:
      if (v45.value)
      {
        *(_QWORD *)&v45.timescale = v45.value;
        operator delete((void *)v45.value);
      }
      return;
    }
    v9 += 24;
    --v10;
  }
  while (v10);
  v40 = v48;
  v39.epoch = 0;
  *(_OWORD *)&v39.value = xmmword_1D4C95818;
  if (!CMTimeCompare(&v40, &v39))
    goto LABEL_6;
  if (!v48.value)
    fwrite("***nftInferNormFrameTime: constant zero duration\n", 0x31uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  *(CMTime *)a3 = v48;
}

void sub_1D4C9242C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 - 168);
  if (v3)
  {
    *(_QWORD *)(v1 - 160) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

__n128 sub_1D4C92454@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  __n128 result;
  __int128 *v5;

  if ((a1 & 4) != 0)
  {
    *(_QWORD *)(a2 + 16) = 0;
    v5 = &xmmword_1D4C95800;
  }
  else if ((a1 & 2) != 0)
  {
    *(_QWORD *)(a2 + 16) = 0;
    v5 = &xmmword_1D4C95878;
  }
  else if ((a1 & 1) != 0)
  {
    *(_QWORD *)(a2 + 16) = 0;
    v5 = &xmmword_1D4C95830;
  }
  else if ((a1 & 8) != 0)
  {
    *(_QWORD *)(a2 + 16) = 0;
    v5 = &xmmword_1D4C95860;
  }
  else
  {
    if ((a1 & 0x10) == 0)
    {
      NSLog(CFSTR("nftFrameTimeFromHint: unknown frame time hint (0x%x)\n"), a1);
      v3 = MEMORY[0x1E0CA2E68];
      result = *(__n128 *)MEMORY[0x1E0CA2E68];
      *(_OWORD *)a2 = *MEMORY[0x1E0CA2E68];
      *(_QWORD *)(a2 + 16) = *(_QWORD *)(v3 + 16);
      return result;
    }
    *(_QWORD *)(a2 + 16) = 0;
    v5 = &xmmword_1D4C95848;
  }
  result = (__n128)*v5;
  *(_OWORD *)a2 = *v5;
  return result;
}

uint64_t sub_1D4C9250C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = *(_OWORD *)result;
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(result + 16);
  *(uint64_t *)a2 /= 4;
  return result;
}

void sub_1D4C92538(CMTime *a1, CMTime *a2, uint64_t a3, char a4)
{
  CMTime *v7;
  CMTime *v8;
  CMTime *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  CMTime *v13;
  uint64_t v14;
  __int128 v15;
  CMTimeEpoch v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  CMTime *v20;
  CMTime *v21;
  CMTime *v22;
  __int128 v23;
  int32_t v24;
  CMTime *v25;
  __int128 v26;
  int32_t v27;
  CMTime *v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CMTimeEpoch v34;
  __int128 v35;
  CMTimeEpoch v36;
  CMTime *v37;
  __int128 v38;
  BOOL v39;
  BOOL v40;
  __int128 v41;
  __int128 v42;
  CMTime *v43;
  __int128 v44;
  int32_t v45;
  CMTime *v46;
  __int128 v47;
  int32_t v48;
  CMTime *v49;
  CMTime *v50;
  __int128 v51;
  int32_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  CMTimeEpoch v57;
  __int128 v58;
  CMTimeEpoch v59;
  CMTime *v60;
  __int128 v61;
  CMTimeEpoch epoch;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  CMTime *v66;
  BOOL v67;
  char v68;
  uint64_t v69;
  CMTime *v70;
  __int128 v71;
  CMTimeEpoch v72;
  __int128 v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  int64_t v77;
  int64_t v78;
  int64_t v79;
  uint64_t v80;
  CMTime *v81;
  __int128 v82;
  __int128 v83;
  CMTime *v84;
  __int128 v85;
  __int128 v86;
  CMTime *v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  int64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  CMTime *v101;
  __int128 v102;
  uint64_t v103;
  unint64_t v104;
  CMTime *v105;
  __int128 v106;
  __int128 v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v112;
  CMTimeEpoch v113;
  __int128 v114;
  CMTime *v115;
  CMTime *v116;
  int32_t v117;
  CMTime v119;
  CMTimeEpoch v120;
  CMTime v121;
  CMTime v122;
  __int128 v123;
  CMTime v124;
  CMTimeEpoch v125;
  CMTime v126;
  CMTime v127;
  CMTime v128;
  CMTime v129;
  CMTime v130;
  CMTime v131;
  CMTime v132;
  CMTimeEpoch v133;
  CMTime time2;
  CMTime time1;

BOOL sub_1D4C930E0(CMTime *a1, CMTime *a2)
{
  unint64_t v4;
  _BOOL8 result;
  CMTime *v6;
  CMTimeEpoch epoch;
  __int128 v8;
  CMTimeEpoch v9;
  CMTime *v10;
  CMTime *v11;
  uint64_t v12;
  int v13;
  CMTimeEpoch v14;
  uint64_t v15;
  char *v16;
  __int128 v17;
  uint64_t v18;
  CMTimeEpoch v19;
  CMTime v20;
  __int128 v21;
  CMTime time2;
  CMTime time1;

  v4 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      time1 = a2[-1];
      time2 = *a1;
      if (CMTimeCompare(&time1, &time2) < 0)
      {
        v6 = a2 - 1;
        epoch = a1->epoch;
        v8 = *(_OWORD *)&a1->value;
        v9 = a2[-1].epoch;
        *(_OWORD *)&a1->value = *(_OWORD *)&a2[-1].value;
        a1->epoch = v9;
        *(_OWORD *)&v6->value = v8;
        v6->epoch = epoch;
      }
      return 1;
    case 3uLL:
      sub_1D4C800F0(a1, a1 + 1, a2 - 1);
      return 1;
    case 4uLL:
      sub_1D4C804F0(a1, a1 + 1, a1 + 2, a2 - 1);
      return 1;
    case 5uLL:
      sub_1D4C7FF68(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      v10 = a1 + 2;
      sub_1D4C800F0(a1, a1 + 1, a1 + 2);
      v11 = a1 + 3;
      if (&a1[3] == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    v14 = v10->epoch;
    v21 = *(_OWORD *)&v10->value;
    time1 = *v11;
    *(_OWORD *)&time2.value = v21;
    time2.epoch = v14;
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      *(_OWORD *)&v20.value = *(_OWORD *)&v11->value;
      v20.epoch = v11->epoch;
      v15 = v12;
      while (1)
      {
        v16 = (char *)a1 + v15;
        *(_OWORD *)(v16 + 72) = *(_OWORD *)((char *)&a1[2].value + v15);
        *((_QWORD *)v16 + 11) = *(CMTimeEpoch *)((char *)&a1[2].epoch + v15);
        if (v15 == -48)
          break;
        v17 = *(_OWORD *)(v16 + 24);
        v19 = *((_QWORD *)v16 + 5);
        time1 = v20;
        *(_OWORD *)&time2.value = v17;
        time2.epoch = v19;
        v15 -= 24;
        if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
        {
          v18 = (uint64_t)&a1[3] + v15;
          goto LABEL_12;
        }
      }
      v18 = (uint64_t)a1;
LABEL_12:
      *(_OWORD *)v18 = *(_OWORD *)&v20.value;
      *(_QWORD *)(v18 + 16) = v20.epoch;
      if (++v13 == 8)
        return &v11[1] == a2;
    }
    v10 = v11;
    v12 += 24;
    if (++v11 == a2)
      return 1;
  }
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B38](alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1E0C98B88](stream, buffer, bufferLength);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1E0C98F80](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFWriteStreamRef CFWriteStreamCreateWithBuffer(CFAllocatorRef alloc, UInt8 *buffer, CFIndex bufferCapacity)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99628](alloc, buffer, bufferCapacity);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

CFIndex CFWriteStreamWrite(CFWriteStreamRef stream, const UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x1E0C99688](stream, buffer, bufferLength);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x1E0C9C4C8](c, shouldAntialias);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

void CGImageDestinationSetProperties(CGImageDestinationRef idst, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC368](idst, properties);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBE8](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x1E0C9CC00](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

CFPropertyListRef CMFormatDescriptionGetExtension(CMFormatDescriptionRef desc, CFStringRef extensionKey)
{
  return (CFPropertyListRef)MEMORY[0x1E0C9EDC8](desc, extensionKey);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1E0C9EE98](desc);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1E0C9EFD8](sbuf);
}

CMItemCount CMSampleBufferGetNumSamples(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9EFE0](sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputDecodeTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9EFE8](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputDuration(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9EFF0](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetOutputPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9EFF8](retstr, sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9F008](retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return (CFArrayRef)MEMORY[0x1E0C9F010](sbuf, createIfNecessary);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1E0C9F2E0](retstr, time, *(_QWORD *)&newTimescale, *(_QWORD *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F2F0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1E0C9F320](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1E0C9F370](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1E0C9F378](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1E0C9F380](retstr, time, *(_QWORD *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByFloat64(CMTime *__return_ptr retstr, CMTime *time, Float64 multiplier)
{
  return (CMTime *)MEMORY[0x1E0C9F388](retstr, time, multiplier);
}

CMTime *__cdecl CMTimeMultiplyByRatio(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier, int32_t divisor)
{
  return (CMTime *)MEMORY[0x1E0C9F390](retstr, time, *(_QWORD *)&multiplier, *(_QWORD *)&divisor);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1E0C9F3A0](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x1E0C9F3A8](range, otherRange);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F3B0](range, allocator);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3C8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1E0C9F3D0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3D8](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeGetUnion(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E0](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

CGRect CMVideoFormatDescriptionGetCleanAperture(CMVideoFormatDescriptionRef videoDesc, Boolean originIsAtTopLeft)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9F550](videoDesc, originIsAtTopLeft);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGSize CMVideoFormatDescriptionGetPresentationDimensions(CMVideoFormatDescriptionRef videoDesc, Boolean usePixelAspectRatio, Boolean useCleanAperture)
{
  double v3;
  double v4;
  CGSize result;

  MEMORY[0x1E0C9F580](videoDesc, usePixelAspectRatio, useCleanAperture);
  result.height = v4;
  result.width = v3;
  return result;
}

CFDictionaryRef CVBufferGetAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8918](buffer, *(_QWORD *)&attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
  MEMORY[0x1E0CA8928](sourceBuffer, destinationBuffer);
}

CGRect CVImageBufferGetCleanRect(CVImageBufferRef imageBuffer)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0CA89D8](imageBuffer);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGSize CVImageBufferGetEncodedSize(CVImageBufferRef imageBuffer)
{
  double v1;
  double v2;
  CGSize result;

  MEMORY[0x1E0CA89F0](imageBuffer);
  result.height = v2;
  result.width = v1;
  return result;
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AB8](allocator, width, height, *(_QWORD *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
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

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B28](pixelBuffer, planeIndex);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B40](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x1E0CA8B58](pixelBuffer, planeIndex);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B68](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8B80](allocator, pixelBufferPool, pixelBufferOut);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

uint64_t ICAnalyzeInputMotion()
{
  return MEMORY[0x1E0D3A918]();
}

uint64_t ICCalcCanDoTripod()
{
  return MEMORY[0x1E0D3A920]();
}

uint64_t ICCalcCinematicL1Corrections()
{
  return MEMORY[0x1E0D3A928]();
}

uint64_t ICCalcPassThruCorrections()
{
  return MEMORY[0x1E0D3A930]();
}

uint64_t ICCalcSmoothingCorrections()
{
  return MEMORY[0x1E0D3A938]();
}

uint64_t ICCalcTripodCorrections()
{
  return MEMORY[0x1E0D3A940]();
}

uint64_t ICDestroyResult()
{
  return MEMORY[0x1E0D3A950]();
}

uint64_t ICGetCoordinateShiftedHomographies()
{
  return MEMORY[0x1E0D3A970]();
}

uint64_t ICGetCorrectionResultCropData()
{
  return MEMORY[0x1E0D3A978]();
}

uint64_t ICGetIdentityHomographies()
{
  return MEMORY[0x1E0D3A980]();
}

uint64_t ICGetResultConfidence()
{
  return MEMORY[0x1E0D3A988]();
}

uint64_t ICGetResultFramePresentationTimes()
{
  return MEMORY[0x1E0D3A990]();
}

uint64_t ICGetResultOptionalData()
{
  return MEMORY[0x1E0D3A9A0]();
}

uint64_t ICGetResultStats()
{
  return MEMORY[0x1E0D3A9A8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E9863218(__p);
}

uint64_t operator delete()
{
  return off_1E9863220();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E9863228(__sz);
}

uint64_t operator new()
{
  return off_1E9863230();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
  MEMORY[0x1E0DE7C20](dest, src, copyHelper);
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void perror(const char *a1)
{
  MEMORY[0x1E0C84AF0](a1);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

float sinf(float a1)
{
  float result;

  MEMORY[0x1E0C85420](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

float tanhf(float a1)
{
  float result;

  MEMORY[0x1E0C85800](a1);
  return result;
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

vImage_Error vImageDilate_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const unsigned __int8 *kernel, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D210](src, dest, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, kernel_height, kernel_width, *(_QWORD *)&flags);
}

vImage_Error vImageErode_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const unsigned __int8 *kernel, vImagePixelCount kernel_height, vImagePixelCount kernel_width, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D270](src, dest, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, kernel_height, kernel_width, *(_QWORD *)&flags);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

