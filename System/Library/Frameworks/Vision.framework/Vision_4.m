BOOL VNANEComputeDeviceSupportsExecution(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  VNANEArchitectureName();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  VNANEGenerationNumberForArchitectureName((uint64_t)v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") >= a1;

  return v4;
}

void sub_1A15A7DC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

double calculateCropSizeOfPixelBuffer(__CVBuffer *a1, _QWORD *a2, float a3)
{
  size_t Width;
  size_t BytesPerRow;
  void *BaseAddress;
  VNControlledCapacitySyncTasksQueue *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  size_t v16;
  size_t v17;
  _QWORD *v18;
  size_t v19;
  dispatch_group_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t *v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  double v32;
  char *v33;
  _QWORD *v34;
  _QWORD *v35;
  size_t Height;
  _QWORD v37[4];
  VNControlledCapacitySyncTasksQueue *v38;
  _QWORD *v39;
  void *v40;
  size_t v41;
  size_t v42;
  size_t v43;
  size_t v44;
  float v45;

  CVPixelBufferLockBaseAddress(a1, 1uLL);
  Width = CVPixelBufferGetWidth(a1);
  Height = CVPixelBufferGetHeight(a1);
  BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
  BaseAddress = CVPixelBufferGetBaseAddress(a1);
  v9 = -[VNControlledCapacityTasksQueue initWithDispatchQueueLabel:maximumTasksCount:]([VNControlledCapacitySyncTasksQueue alloc], "initWithDispatchQueueLabel:maximumTasksCount:", CFSTR("com.apple.VN.observationSyncTasksQueue.VNInstanceMaskObservationProcessing"), 15);
  v10 = -[VNControlledCapacityTasksQueue maximumTasksCount](v9, "maximumTasksCount");
  v11 = v10;
  if (v10)
  {
    if (v10 >= 0x555555555555556)
      std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
    v12 = 48 * v10;
    v13 = (char *)operator new(48 * v10);
    v14 = 0;
    v33 = &v13[48 * v11];
    do
    {
      v15 = &v13[v14];
      *(_QWORD *)v15 = -1;
      *((_QWORD *)v15 + 1) = -1;
      *((_QWORD *)v15 + 4) = 0;
      *((_QWORD *)v15 + 5) = 0;
      v14 += 48;
      *((_QWORD *)v15 + 2) = 0;
      *((_QWORD *)v15 + 3) = 0;
    }
    while (v12 != v14);
    v34 = a2;
    v16 = 0;
    v17 = 0;
    v35 = v13;
    v18 = v13 + 40;
    do
    {
      v19 = Height / v11 - 1 + v17;
      if (v16 < Height % v11)
        v19 = Height / v11 + v17;
      *(v18 - 1) = v17;
      *v18 = v19;
      v17 = v19 + 1;
      ++v16;
      v18 += 6;
    }
    while (v11 != v16);
    v20 = dispatch_group_create();
    v21 = MEMORY[0x1E0C809B0];
    v22 = v35;
    do
    {
      v37[0] = v21;
      v37[1] = 3221225472;
      v37[2] = __calculateCropSizeOfPixelBuffer_block_invoke;
      v37[3] = &unk_1E4548F80;
      v39 = v22;
      v40 = BaseAddress;
      v41 = Height;
      v42 = Width;
      v43 = BytesPerRow;
      v44 = Width;
      v45 = a3;
      v38 = v9;
      -[VNControlledCapacityTasksQueue dispatchGroupAsyncByPreservingQueueCapacity:block:](v38, "dispatchGroupAsyncByPreservingQueueCapacity:block:", v20, v37);

      v22 += 6;
      --v11;
    }
    while (v11);
    a2 = v34;
    v23 = v35;
    v24 = (unint64_t *)v33;
  }
  else
  {
    v20 = dispatch_group_create();
    v24 = 0;
    v23 = 0;
  }
  if (-[VNControlledCapacityTasksQueue dispatchGroupWait:error:](v9, "dispatchGroupWait:error:", v20, a2, v33))
  {
    if (v23 != v24)
    {
      v25 = 0;
      v26 = 0;
      v27 = -1;
      v28 = v23;
      v29 = -1;
      do
      {
        if (*v28 < v27)
          v27 = *v28;
        if (v28[1] < v29)
          v29 = v28[1];
        if (v26 <= v28[2])
          v26 = v28[2];
        if (v25 <= v28[3])
          v25 = v28[3];
        v28 += 6;
      }
      while (v28 != v24);
      if (v26 && v25 != 0)
      {
        v32 = (double)v27;
        goto LABEL_33;
      }
    }
    if (a2)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:](VNError, "errorForInternalErrorWithLocalizedDescription:", CFSTR("No pixels meet or exceed alpha threshold"));
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v32 = *MEMORY[0x1E0C9D628];
LABEL_33:

  if (v23)
    operator delete(v23);

  CVPixelBufferUnlockBaseAddress(a1, 1uLL);
  return v32;
}

void sub_1A15A80E8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  void *v18;
  void *v19;
  void *v20;

  if (v18)
    operator delete(v18);

  objc_begin_catch(a1);
  JUMPOUT(0x1A15A8060);
}

uint64_t __calculateCropSizeOfPixelBuffer_block_invoke(uint64_t a1)
{
  uint64x2_t *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  uint64x2_t v10;
  int8x16_t v11;
  int8x16_t v12;

  v1 = *(uint64x2_t **)(a1 + 40);
  v2 = v1[2].u64[0];
  v3 = v1[2].u64[1];
  if (v2 <= v3)
  {
    v4 = *(_QWORD *)(a1 + 80);
    v5 = *(_QWORD *)(a1 + 72) >> 2;
    v6 = *(_QWORD *)(a1 + 48) + 4 * v2 * v5;
    v7 = 4 * v5;
    do
    {
      if (v4)
      {
        v8 = 0;
        v9 = *(float *)(a1 + 88);
        do
        {
          if (*(float *)(v6 + 4 * v8) > v9)
          {
            v10.i64[0] = v8;
            v10.i64[1] = v2;
            v11 = vbslq_s8((int8x16_t)vcgtq_u64(*v1, v10), (int8x16_t)v10, *(int8x16_t *)v1);
            v12 = vbslq_s8((int8x16_t)vcgtq_u64(v1[1], v10), (int8x16_t)v1[1], (int8x16_t)v10);
            *v1 = (uint64x2_t)v11;
            v1[1] = (uint64x2_t)v12;
          }
          ++v8;
        }
        while (v4 != v8);
      }
      ++v2;
      v6 += v7;
    }
    while (v2 <= v3);
  }
  return objc_msgSend(*(id *)(a1 + 32), "dispatchReportBlockCompletion");
}

void sub_1A15A873C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

uint64_t sub_1A15A879C()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_1A15A87A8()
{
  return MEMORY[0x1E0CAE228]();
}

uint64_t sub_1A15A87B4()
{
  return MEMORY[0x1E0CAE248]();
}

uint64_t sub_1A15A87C0()
{
  return MEMORY[0x1E0CAE250]();
}

uint64_t sub_1A15A87CC()
{
  return MEMORY[0x1E0CAE310]();
}

uint64_t sub_1A15A87D8()
{
  return MEMORY[0x1E0CAE318]();
}

uint64_t sub_1A15A87E4()
{
  return MEMORY[0x1E0CAE328]();
}

uint64_t sub_1A15A87F0()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1A15A87FC()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1A15A8808()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1A15A8814()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1A15A8820()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1A15A882C()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1A15A8838()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1A15A8844()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1A15A8850()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1A15A885C()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1A15A8868()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1A15A8874()
{
  return MEMORY[0x1E0CB0110]();
}

uint64_t sub_1A15A8880()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1A15A888C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1A15A8898()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1A15A88A4()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1A15A88B0()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1A15A88BC()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1A15A88C8()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1A15A88D4()
{
  return MEMORY[0x1E0CB0AD8]();
}

uint64_t sub_1A15A88E0()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t sub_1A15A88EC()
{
  return MEMORY[0x1E0CB0C40]();
}

uint64_t sub_1A15A88F8()
{
  return MEMORY[0x1E0CB0C48]();
}

uint64_t sub_1A15A8904()
{
  return MEMORY[0x1E0CB0C88]();
}

uint64_t sub_1A15A8910()
{
  return MEMORY[0x1E0CB0D68]();
}

uint64_t sub_1A15A891C()
{
  return MEMORY[0x1E0CB0D78]();
}

uint64_t sub_1A15A8928()
{
  return MEMORY[0x1E0CB0D88]();
}

uint64_t sub_1A15A8934()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1A15A8940()
{
  return MEMORY[0x1E0CB12A8]();
}

uint64_t sub_1A15A894C()
{
  return MEMORY[0x1E0CB12C0]();
}

uint64_t sub_1A15A8958()
{
  return MEMORY[0x1E0CB13A0]();
}

uint64_t sub_1A15A8964()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_1A15A8970()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_1A15A897C()
{
  return MEMORY[0x1E0DE9480]();
}

uint64_t sub_1A15A8988()
{
  return MEMORY[0x1E0D4FF10]();
}

uint64_t sub_1A15A8994()
{
  return MEMORY[0x1E0D4FF18]();
}

uint64_t sub_1A15A89A0()
{
  return MEMORY[0x1E0D4FF30]();
}

uint64_t sub_1A15A89AC()
{
  return MEMORY[0x1E0D500B0]();
}

uint64_t sub_1A15A89B8()
{
  return MEMORY[0x1E0D500B8]();
}

uint64_t sub_1A15A89C4()
{
  return MEMORY[0x1E0D50110]();
}

uint64_t sub_1A15A89D0()
{
  return MEMORY[0x1E0D50148]();
}

uint64_t sub_1A15A89DC()
{
  return MEMORY[0x1E0D50160]();
}

uint64_t sub_1A15A89E8()
{
  return MEMORY[0x1E0D50170]();
}

uint64_t sub_1A15A89F4()
{
  return MEMORY[0x1E0D50188]();
}

uint64_t sub_1A15A8A00()
{
  return MEMORY[0x1E0D501F0]();
}

uint64_t sub_1A15A8A0C()
{
  return MEMORY[0x1E0D50248]();
}

uint64_t sub_1A15A8A18()
{
  return MEMORY[0x1E0D50250]();
}

uint64_t sub_1A15A8A24()
{
  return MEMORY[0x1E0D50268]();
}

uint64_t sub_1A15A8A30()
{
  return MEMORY[0x1E0D50270]();
}

uint64_t sub_1A15A8A3C()
{
  return MEMORY[0x1E0D502C0]();
}

uint64_t sub_1A15A8A48()
{
  return MEMORY[0x1E0DEF0A0]();
}

uint64_t sub_1A15A8A54()
{
  return MEMORY[0x1E0DEF0A8]();
}

uint64_t sub_1A15A8A60()
{
  return MEMORY[0x1E0DEF0B0]();
}

uint64_t sub_1A15A8A6C()
{
  return MEMORY[0x1E0C9E6E0]();
}

uint64_t sub_1A15A8A78()
{
  return MEMORY[0x1E0C9E700]();
}

uint64_t sub_1A15A8A84()
{
  return MEMORY[0x1E0C9E708]();
}

uint64_t sub_1A15A8A90()
{
  return MEMORY[0x1E0C9E770]();
}

uint64_t sub_1A15A8A9C()
{
  return MEMORY[0x1E0C9E778]();
}

uint64_t sub_1A15A8AA8()
{
  return MEMORY[0x1E0C9E788]();
}

uint64_t sub_1A15A8AB4()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1A15A8AC0()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1A15A8ACC()
{
  return MEMORY[0x1E0CB17B8]();
}

uint64_t sub_1A15A8AD8()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1A15A8AE4()
{
  return MEMORY[0x1E0CB17E8]();
}

uint64_t sub_1A15A8AF0()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1A15A8AFC()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1A15A8B08()
{
  return MEMORY[0x1E0DE9EC0]();
}

uint64_t sub_1A15A8B14()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1A15A8B20()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1A15A8B2C()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1A15A8B38()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1A15A8B44()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1A15A8B50()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1A15A8B5C()
{
  return MEMORY[0x1E0DEA3B8]();
}

uint64_t sub_1A15A8B68()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1A15A8B74()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_1A15A8B80()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1A15A8B8C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A15A8B98()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1A15A8BA4()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1A15A8BB0()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1A15A8BBC()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1A15A8BC8()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1A15A8BD4()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1A15A8BE0()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_1A15A8BEC()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1A15A8BF8()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1A15A8C04()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1A15A8C10()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1A15A8C1C()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1A15A8C28()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1A15A8C34()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1A15A8C40()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1A15A8C4C()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1A15A8C58()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1A15A8C64()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1A15A8C70()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1A15A8C7C()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1A15A8C88()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1A15A8C94()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1A15A8CA0()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1A15A8CAC()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1A15A8CB8()
{
  return MEMORY[0x1E0DEAE88]();
}

uint64_t sub_1A15A8CC4()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1A15A8CD0()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1A15A8CDC()
{
  return MEMORY[0x1E0DEAF00]();
}

uint64_t sub_1A15A8CE8()
{
  return MEMORY[0x1E0DEAF78]();
}

uint64_t sub_1A15A8CF4()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_1A15A8D00()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1A15A8D0C()
{
  return MEMORY[0x1E0DF0608]();
}

uint64_t sub_1A15A8D18()
{
  return MEMORY[0x1E0DF0640]();
}

uint64_t sub_1A15A8D24()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t sub_1A15A8D30()
{
  return MEMORY[0x1E0DF0698]();
}

uint64_t sub_1A15A8D3C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1A15A8D48()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1A15A8D54()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1A15A8D60()
{
  return MEMORY[0x1E0DF07E0]();
}

uint64_t sub_1A15A8D6C()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_1A15A8D78()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t sub_1A15A8D84()
{
  return MEMORY[0x1E0DF0810]();
}

uint64_t sub_1A15A8D90()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t sub_1A15A8D9C()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t sub_1A15A8DA8()
{
  return MEMORY[0x1E0DF0950]();
}

uint64_t sub_1A15A8DB4()
{
  return MEMORY[0x1E0DF0980]();
}

uint64_t sub_1A15A8DC0()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_1A15A8DCC()
{
  return MEMORY[0x1E0DF0A30]();
}

uint64_t sub_1A15A8DD8()
{
  return MEMORY[0x1E0DF0A58]();
}

uint64_t sub_1A15A8DE4()
{
  return MEMORY[0x1E0DF0A68]();
}

uint64_t sub_1A15A8DF0()
{
  return MEMORY[0x1E0DF0A70]();
}

uint64_t sub_1A15A8DFC()
{
  return MEMORY[0x1E0DF0A78]();
}

uint64_t sub_1A15A8E08()
{
  return MEMORY[0x1E0DF0AD0]();
}

uint64_t sub_1A15A8E14()
{
  return MEMORY[0x1E0DF0AD8]();
}

uint64_t sub_1A15A8E20()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1A15A8E2C()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1A15A8E38()
{
  return MEMORY[0x1E0CB1B98]();
}

uint64_t sub_1A15A8E44()
{
  return MEMORY[0x1E0DEB160]();
}

uint64_t sub_1A15A8E50()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1A15A8E5C()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1A15A8E68()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1A15A8E74()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1A15A8E80()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1A15A8E8C()
{
  return MEMORY[0x1E0DEB5D0]();
}

uint64_t sub_1A15A8E98()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_1A15A8EA4()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1A15A8EB0()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1A15A8EBC()
{
  return MEMORY[0x1E0DEF178]();
}

uint64_t sub_1A15A8EC8()
{
  return MEMORY[0x1E0DEF180]();
}

uint64_t sub_1A15A8ED4()
{
  return MEMORY[0x1E0DEF190]();
}

uint64_t sub_1A15A8EE0()
{
  return MEMORY[0x1E0DEF198]();
}

uint64_t sub_1A15A8EEC()
{
  return MEMORY[0x1E0DEF1A8]();
}

uint64_t sub_1A15A8EF8()
{
  return MEMORY[0x1E0DEF1B0]();
}

uint64_t sub_1A15A8F04()
{
  return MEMORY[0x1E0C9E7C0]();
}

uint64_t sub_1A15A8F10()
{
  return MEMORY[0x1E0C9E7F8]();
}

uint64_t sub_1A15A8F1C()
{
  return MEMORY[0x1E0C9B998]();
}

uint64_t sub_1A15A8F28()
{
  return MEMORY[0x1E0DEF208]();
}

uint64_t sub_1A15A8F34()
{
  return MEMORY[0x1E0DEF230]();
}

uint64_t sub_1A15A8F40()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t sub_1A15A8F4C()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1A15A8F58()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1A15A8F64()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1A15A8F70()
{
  return MEMORY[0x1E0DE94F0]();
}

uint64_t sub_1A15A8F7C()
{
  return MEMORY[0x1E0DEF2E8]();
}

uint64_t sub_1A15A8F88()
{
  return MEMORY[0x1E0DEF2F0]();
}

uint64_t sub_1A15A8F94()
{
  return MEMORY[0x1E0DEF2F8]();
}

uint64_t sub_1A15A8FA0()
{
  return MEMORY[0x1E0DEF300]();
}

uint64_t sub_1A15A8FAC()
{
  return MEMORY[0x1E0DEF308]();
}

uint64_t sub_1A15A8FB8()
{
  return MEMORY[0x1E0DEF320]();
}

uint64_t sub_1A15A8FC4()
{
  return MEMORY[0x1E0DEF330]();
}

uint64_t sub_1A15A8FD0()
{
  return MEMORY[0x1E0C9BA18]();
}

uint64_t sub_1A15A8FDC()
{
  return MEMORY[0x1E0CB1FE8]();
}

uint64_t sub_1A15A8FE8()
{
  return MEMORY[0x1E0CB20D0]();
}

uint64_t sub_1A15A8FF4()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1A15A9000()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1A15A900C()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1A15A9018()
{
  return MEMORY[0x1E0CB2190]();
}

uint64_t sub_1A15A9024()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1A15A9030()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1A15A903C()
{
  return MEMORY[0x1E0CB2430]();
}

uint64_t sub_1A15A9048()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1A15A9054()
{
  return MEMORY[0x1E0DEBFE8]();
}

uint64_t sub_1A15A9060()
{
  return MEMORY[0x1E0DEC058]();
}

uint64_t sub_1A15A906C()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1A15A9078()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1A15A9084()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1A15A9090()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1A15A909C()
{
  return MEMORY[0x1E0DEC2D0]();
}

uint64_t sub_1A15A90A8()
{
  return MEMORY[0x1E0DEC3A8]();
}

uint64_t sub_1A15A90B4()
{
  return MEMORY[0x1E0DEC3B0]();
}

uint64_t sub_1A15A90C0()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1A15A90CC()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1A15A90D8()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1A15A90E4()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1A15A90F0()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1A15A90FC()
{
  return MEMORY[0x1E0DF0B08]();
}

uint64_t sub_1A15A9108()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1A15A9114()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1A15A9120()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1A15A912C()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1A15A9138()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1A15A9144()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1A15A9150()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1A15A915C()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1A15A9168()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1A15A9174()
{
  return MEMORY[0x1E0DEC8D8]();
}

uint64_t sub_1A15A9180()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1A15A918C()
{
  return MEMORY[0x1E0DEC8F8]();
}

uint64_t sub_1A15A9198()
{
  return MEMORY[0x1E0DECAB0]();
}

uint64_t sub_1A15A91A4()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1A15A91B0()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1A15A91BC()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1A15A91C8()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1A15A91D4()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1A15A91E0()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1A15A91EC()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1A15A91F8()
{
  return MEMORY[0x1E0DF0D38]();
}

uint64_t sub_1A15A9204()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1A15A9210()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1A15A921C()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1A15A9228()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1A15A9234()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1A15A9240()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1A15A924C()
{
  return MEMORY[0x1E0DECFD8]();
}

uint64_t sub_1A15A9258()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1A15A9264()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1A15A9270()
{
  return MEMORY[0x1E0DED008]();
}

uint64_t sub_1A15A927C()
{
  return MEMORY[0x1E0DED010]();
}

uint64_t sub_1A15A9288()
{
  return MEMORY[0x1E0DED028]();
}

uint64_t sub_1A15A9294()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1A15A92A0()
{
  return MEMORY[0x1E0DED040]();
}

uint64_t sub_1A15A92AC()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1A15A92B8()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1A15A92C4()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1A15A92D0()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1A15A92DC()
{
  return MEMORY[0x1E0DED108]();
}

uint64_t sub_1A15A92E8()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1A15A92F4()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1A15A9300()
{
  return MEMORY[0x1E0DED138]();
}

uint64_t sub_1A15A930C()
{
  return MEMORY[0x1E0DED140]();
}

uint64_t sub_1A15A9318()
{
  return MEMORY[0x1E0DED158]();
}

uint64_t sub_1A15A9324()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1A15A9330()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1A15A933C()
{
  return MEMORY[0x1E0DED550]();
}

uint64_t sub_1A15A9348()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1A15A9354()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1A15A9360()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1A15A936C()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t sub_1A15A9378()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1A15A9384()
{
  return MEMORY[0x1E0DEDAC0]();
}

uint64_t sub_1A15A9390()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1A15A939C()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1A15A93A8()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1A15A93B4()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1A15A93C0()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1A15A93CC()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1A15A93D8()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_1A15A93E4()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A15A93F0()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1A15A93FC()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1A15A9408()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1A15A9414()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1A15A9420()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1A15A942C()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t sub_1A15A9438()
{
  return MEMORY[0x1E0DEDFF8]();
}

uint64_t sub_1A15A9444()
{
  return MEMORY[0x1E0DEE000]();
}

uint64_t sub_1A15A9450()
{
  return MEMORY[0x1E0CB26E8]();
}

uint64_t sub_1A15A945C()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1A15A9468()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1A15A9474()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1A15A9480()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1A15A948C()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t ACBSConfigCreate()
{
  return MEMORY[0x1E0D831B8]();
}

uint64_t ACBSConfigFree()
{
  return MEMORY[0x1E0D831C0]();
}

uint64_t ACBSConfigSetFailedLocationsEnabled()
{
  return MEMORY[0x1E0D831C8]();
}

uint64_t ACBSConfigSetLocateMode()
{
  return MEMORY[0x1E0D831D0]();
}

uint64_t ACBSConfigSetMaxQRModuleSamples()
{
  return MEMORY[0x1E0D831D8]();
}

uint64_t ACBSConfigSetStopsAtFirstPyramidWith2DCode()
{
  return MEMORY[0x1E0D831E0]();
}

uint64_t ACBSConfigSetSymbologiesEnabled()
{
  return MEMORY[0x1E0D831E8]();
}

uint64_t ACBSCreateFrameInfoBySearchingForBarcodesInCVPixelBuffer()
{
  return MEMORY[0x1E0D831F0]();
}

uint64_t ACBSCreateSymbolDescriptorFromBasicDescriptor()
{
  return MEMORY[0x1E0D831F8]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const void *value)
{
  return MEMORY[0x1E0C98520](theDict, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98630](err);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1E0C98720](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1E0C99020](alloc, formatOptions, format, arguments);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
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

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9BFD0](c, x, y);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x1E0C9C000](c);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C218](c);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C330](c, x, y);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
  MEMORY[0x1E0C9C448](c, gray, alpha);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A8](c, red, green, blue, alpha);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x1E0C9C4C8](c, shouldAntialias);
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C578](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C600](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
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

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x1E0C9CC08](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x1E0C9CC70]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

uint64_t CGImageProviderGetAlphaInfo()
{
  return MEMORY[0x1E0C9CD38]();
}

uint64_t CGImageProviderGetColorSpace()
{
  return MEMORY[0x1E0C9CD50]();
}

uint64_t CGImageProviderGetComponentType()
{
  return MEMORY[0x1E0C9CD58]();
}

uint64_t CGImageProviderGetPixelSize()
{
  return MEMORY[0x1E0C9CD70]();
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CFDictionaryRef CGImageSourceCopyAuxiliaryDataInfoAtIndex(CGImageSourceRef isrc, size_t index, CFStringRef auxiliaryImageDataType)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC500](isrc, index, auxiliaryImageDataType);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D298](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2A0](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddLines(CGMutablePathRef path, const CGAffineTransform *m, const CGPoint *points, size_t count)
{
  MEMORY[0x1E0C9D2B0](path, m, points, count);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D358](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1E0C9D530](dict, point);
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D638]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
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

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D808]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1E0C9D818](dict, size);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x1E0C9EE00](target, key, attachmentModeOut);
}

Boolean CMSampleBufferDataIsReady(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9EF90](sbuf);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1E0C9EFD8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x1E0C9F008](retstr, sbuf);
}

OSStatus CMSampleBufferGetSampleTimingInfo(CMSampleBufferRef sbuf, CMItemIndex sampleIndex, CMSampleTimingInfo *timingInfoOut)
{
  return MEMORY[0x1E0C9F028](sbuf, sampleIndex, timingInfoOut);
}

Boolean CMSampleBufferIsValid(CMSampleBufferRef sbuf)
{
  return MEMORY[0x1E0C9F060](sbuf);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1E0C9F2F8](allocator, time);
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

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1E0C9F380](retstr, time, *(_QWORD *)&multiplier);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F3B0](range, allocator);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1E0C9F3B8](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1E0C9F3C0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3C8](retstr, start, end);
}

CMTimeRange *__cdecl CMTimeRangeGetIntersection(CMTimeRange *__return_ptr retstr, CMTimeRange *range, CMTimeRange *otherRange)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3D8](retstr, range, otherRange);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3F0](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1E0CA8900](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8908](buffer, *(_QWORD *)&attachmentMode);
}

Boolean CVBufferHasAttachment(CVBufferRef buffer, CFStringRef key)
{
  return MEMORY[0x1E0CA8920](buffer, key);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8950](buffer, key, value, *(_QWORD *)&attachmentMode);
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8958](buffer, theAttachments, *(_QWORD *)&attachmentMode);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x1E0CA8A30](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x1E0CA8A38](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x1E0CA8A50](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AB8](allocator, width, height, *(_QWORD *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

CVReturn CVPixelBufferCreateWithIOSurface(CFAllocatorRef allocator, IOSurfaceRef surface, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8AC0](allocator, surface, pixelBufferAttributes, pixelBufferOut);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x1E0CA8AD8]();
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

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
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

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x1E0CA8B78](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8B80](allocator, pixelBufferPool, pixelBufferOut);
}

CFDictionaryRef CVPixelBufferPoolGetAttributes(CVPixelBufferPoolRef pool)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8B98](pool);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
  MEMORY[0x1E0CA8BC8](pixelBufferPool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA8C08](allocator, *(_QWORD *)&pixelFormat);
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return MEMORY[0x1E0D1CDA8]();
}

uint64_t DDScannerCreate()
{
  return MEMORY[0x1E0D1CDB0]();
}

uint64_t DDScannerScanString()
{
  return MEMORY[0x1E0D1CDE8]();
}

uint64_t FCRFaceDetectionParameters()
{
  return MEMORY[0x1E0CEE478]();
}

uint64_t FCRFastFaceDetectionParameters()
{
  return MEMORY[0x1E0CEE4B0]();
}

uint64_t FCRKeypointTrackingParameters()
{
  return MEMORY[0x1E0CEE4B8]();
}

uint64_t FCRPreciseDetectionParameters()
{
  return MEMORY[0x1E0CEE4C0]();
}

uint64_t FCRStandardTrackingParameters()
{
  return MEMORY[0x1E0CEE4E8]();
}

uint64_t ICAnalysisAddFrame()
{
  return MEMORY[0x1E0D3A900]();
}

uint64_t ICAnalysisInit()
{
  return MEMORY[0x1E0D3A908]();
}

uint64_t ICDestroyResult()
{
  return MEMORY[0x1E0D3A950]();
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBC38](buffer, planeIndex);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x1E0CBBCF0](buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBD28](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x1E0CBBE88](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x1E0DE2BA0]();
}

NSArray *MLAllComputeDevices(void)
{
  return (NSArray *)MEMORY[0x1E0C9E858]();
}

uint64_t MRCContextCopySupportedComputeDevicesForDecoderUsingOptions()
{
  return MEMORY[0x1E0D83200]();
}

uint64_t MRCContextCreateWithOptions()
{
  return MEMORY[0x1E0D83208]();
}

uint64_t MRCContextPreflightForDecoderUsingOptions()
{
  return MEMORY[0x1E0D83218]();
}

uint64_t MRCDecoderCreateWithOptions()
{
  return MEMORY[0x1E0D83220]();
}

uint64_t MRCDecoderDecodeSample()
{
  return MEMORY[0x1E0D83228]();
}

uint64_t MRCDecoderDecodeSampleWithRegions()
{
  return MEMORY[0x1E0D83230]();
}

uint64_t MRCDecoderDecodeSampleWithSegmentationMask()
{
  return MEMORY[0x1E0D83238]();
}

uint64_t MRCDecoderResultGetDescriptorAtIndex()
{
  return MEMORY[0x1E0D83278]();
}

uint64_t MRCDecoderResultGetDescriptorCount()
{
  return MEMORY[0x1E0D83280]();
}

uint64_t MRCDescriptorCopyAttribute()
{
  return MEMORY[0x1E0D83320]();
}

uint64_t MRCDescriptorCopyAttributes()
{
  return MEMORY[0x1E0D83328]();
}

uint64_t MRCDescriptorCreateWithAttributes()
{
  return MEMORY[0x1E0D83330]();
}

uint64_t MRCDescriptorDecodePayloadAndSupplementalPayload()
{
  return MEMORY[0x1E0D83340]();
}

uint64_t MRCRegionCreate()
{
  return MEMORY[0x1E0D83348]();
}

uint64_t MRCSampleCreateByGeneratingPyramid()
{
  return MEMORY[0x1E0D83350]();
}

uint64_t MRCSampleCreateWithCVPixelBuffer()
{
  return MEMORY[0x1E0D83358]();
}

uint64_t MRCSegmentationMaskCreate()
{
  return MEMORY[0x1E0D83360]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2850](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSUInteger NSCountMapTable(NSMapTable *table)
{
  return MEMORY[0x1E0CB28E8](table);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DB8](table, key, value);
}

BOOL NSMapMember(NSMapTable *table, const void *key, void **originalKey, void **value)
{
  return MEMORY[0x1E0CB2DC0](table, key, originalKey, value);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t NSStringFromVisionCoreSceneNetInferenceNetworkModel()
{
  return MEMORY[0x1E0DC6C08]();
}

uint64_t NSStringFromVisionCoreTensorDataType()
{
  return MEMORY[0x1E0DC6C10]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return MEMORY[0x1E0C805C8](libraryName);
}

int32_t NSVersionOfRunTimeLibrary(const char *libraryName)
{
  return MEMORY[0x1E0C805D0](libraryName);
}

OSStatus VTCreateCGImageFromCVPixelBuffer(CVPixelBufferRef pixelBuffer, CFDictionaryRef options, CGImageRef *imageOut)
{
  return MEMORY[0x1E0CEC9D8](pixelBuffer, options, imageOut);
}

uint64_t VTPixelRotationSessionCreateWithRotationAndFlip()
{
  return MEMORY[0x1E0CECCE0]();
}

void VTPixelRotationSessionInvalidate(VTPixelRotationSessionRef session)
{
  MEMORY[0x1E0CECCE8](session);
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECCF0](session, sourceBuffer, destinationBuffer);
}

uint64_t VTPixelRotationSessionRotateSubImage()
{
  return MEMORY[0x1E0CECCF8]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1E0CECD18](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x1E0CECD28](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECD38](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1E0CECD80](session, propertyKey, propertyValue);
}

uint64_t VisionCoreBoundingBoxForQuadrilateralPoints()
{
  return MEMORY[0x1E0DC6D18]();
}

uint64_t VisionCoreEqualOrNilObjects()
{
  return MEMORY[0x1E0DC6D20]();
}

uint64_t VisionCoreEquivalentOrNilUnorderedArrays()
{
  return MEMORY[0x1E0DC6D28]();
}

uint64_t VisionCoreFourCharCodeToString()
{
  return MEMORY[0x1E0DC6D38]();
}

uint64_t VisionCoreImagePointForNormalizedPoint()
{
  return MEMORY[0x1E0DC6D48]();
}

uint64_t VisionCoreNormalizedPointForImagePoint()
{
  return MEMORY[0x1E0DC6D50]();
}

uint64_t VisionCoreTensorDataTypeGetElementSize()
{
  return MEMORY[0x1E0DC6D58]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t espresso_vision_compute()
{
  return MEMORY[0x1E0D1F508]();
}

uint64_t espresso_vision_compute_batch()
{
  return MEMORY[0x1E0D1F518]();
}

uint64_t espresso_vision_shape_network()
{
  return MEMORY[0x1E0D1F520]();
}

uint64_t espresso_vision_compute_pupil_position()
{
  return MEMORY[0x1E0D1F530]();
}

uint64_t espresso_vision_compute_dropout_augment()
{
  return MEMORY[0x1E0D1F538]();
}

uint64_t espresso_vision_util_update_metal_priority()
{
  return MEMORY[0x1E0D1F540]();
}

uint64_t espresso_vision_first_layer_number_of_input_blobs()
{
  return MEMORY[0x1E0D1F548]();
}

uint64_t espresso_vision_classify_descriptor_handler_nsdata()
{
  return MEMORY[0x1E0D1F550]();
}

uint64_t espresso_vision_first_layer_first_source_blob_shape()
{
  return MEMORY[0x1E0D1F558]();
}

uint64_t espresso_vision_last_layer_first_destination_blob_shape()
{
  return MEMORY[0x1E0D1F568]();
}

uint64_t Espresso::load_network_shape()
{
  return MEMORY[0x1E0D1F6D8]();
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41D8](this, __s);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x1E0DE4270](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4290](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4318](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4338](this);
}

std::runtime_error *__cdecl std::runtime_error::operator=(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4348](this, a2);
}

void std::invalid_argument::~invalid_argument(std::invalid_argument *this)
{
  MEMORY[0x1E0DE4368](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x1E0DE43F8](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4408](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4470](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x1E0DE4490](this, __pos, __n1, __s, __n2);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1E0DE4590]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1E0DE45A8]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1E0DE45B0]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x1E0DE45D0]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1E0DE4608]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1E0DE4620]();
}

{
  return MEMORY[0x1E0DE4628]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1E0DE46A8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C0]();
}

{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46F8]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4718]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

float std::stof(const std::string *__str, size_t *__idx)
{
  float result;

  MEMORY[0x1E0DE4A70](__str, __idx);
  return result;
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

uint64_t std::__sort<std::__less<double,double> &,double *>()
{
  return MEMORY[0x1E0DE4AE0]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x1E0DE4B38]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1E0DE4B48]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D70](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1E0DE4DB0](this);
}

{
  return (std::bad_alloc *)MEMORY[0x1E0DE4DB8](this);
}

void std::bad_alloc::~bad_alloc(std::bad_alloc *this)
{
  MEMORY[0x1E0DE4DC8](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD0](this);
}

{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E452A678();
}

void operator delete(void *__p)
{
  off_1E452A680(__p);
}

uint64_t operator delete()
{
  return off_1E452A688();
}

void *__cdecl operator new[](size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E452A690(__sz, a2);
}

uint64_t operator new[]()
{
  return off_1E452A698();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E452A6A0(__sz);
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  return (void *)off_1E452A6A8(__sz, a2);
}

uint64_t operator new()
{
  return off_1E452A6B0();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_cast(void)
{
  MEMORY[0x1E0DE5070]();
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

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1E0DE50A8](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  simd_float3x3 result;

  MEMORY[0x1E0C80B30]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
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

  MEMORY[0x1E0C80B38]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2], (__n128)a1.columns[3]);
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

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

simd_float4 _simd_exp_f4(simd_float4 x)
{
  simd_float4 result;

  MEMORY[0x1E0C811D0]((__n128)x);
  return result;
}

simd_float4 _simd_pow_f4(simd_float4 x, simd_float4 y)
{
  simd_float4 result;

  MEMORY[0x1E0C811F8]((__n128)x, (__n128)y);
  return result;
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

float acosf(float a1)
{
  float result;

  MEMORY[0x1E0C81508](a1);
  return result;
}

float asinf(float a1)
{
  float result;

  MEMORY[0x1E0C815A0](a1);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x1E0C81630](a1);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void catlas_daxpby(const int __N, const double __alpha, const double *__X, const int __incX, const double __beta, double *__Y, const int __incY)
{
  MEMORY[0x1E0C8BAC8](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY, __alpha, __beta);
}

double cblas_dasum(const int __N, const double *__X, const int __incX)
{
  double result;

  MEMORY[0x1E0C8BB08](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX);
  return result;
}

void cblas_daxpy(const int __N, const double __alpha, const double *__X, const int __incX, double *__Y, const int __incY)
{
  MEMORY[0x1E0C8BB18](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY, __alpha);
}

void cblas_dcopy(const int __N, const double *__X, const int __incX, double *__Y, const int __incY)
{
  MEMORY[0x1E0C8BB28](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY);
}

double cblas_ddot(const int __N, const double *__X, const int __incX, const double *__Y, const int __incY)
{
  double result;

  MEMORY[0x1E0C8BB38](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY);
  return result;
}

void cblas_dgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const double __alpha, const double *__A, const int __lda, const double *__B, const int __ldb, const double __beta, double *__C, const int __ldc)
{
  MEMORY[0x1E0C8BB48](*(_QWORD *)&__Order, *(_QWORD *)&__TransA, *(_QWORD *)&__TransB, *(_QWORD *)&__M, *(_QWORD *)&__N, *(_QWORD *)&__K, __A, *(_QWORD *)&__lda, __alpha, __beta);
}

void cblas_dgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const double __alpha, const double *__A, const int __lda, const double *__X, const int __incX, const double __beta, double *__Y, const int __incY)
{
  MEMORY[0x1E0C8BB58](*(_QWORD *)&__Order, *(_QWORD *)&__TransA, *(_QWORD *)&__M, *(_QWORD *)&__N, __A, *(_QWORD *)&__lda, __X, *(_QWORD *)&__incX, __alpha, __beta);
}

void cblas_drot(const int __N, double *__X, const int __incX, double *__Y, const int __incY, const double __c, const double __s)
{
  MEMORY[0x1E0C8BB70](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY, __c, __s);
}

void cblas_drotg(double *__a, double *__b, double *__c, double *__s)
{
  MEMORY[0x1E0C8BB78](__a, __b, __c, __s);
}

float cblas_sasum(const int __N, const float *__X, const int __incX)
{
  float result;

  MEMORY[0x1E0C8BBB0](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX);
  return result;
}

void cblas_saxpy(const int __N, const float __alpha, const float *__X, const int __incX, float *__Y, const int __incY)
{
  MEMORY[0x1E0C8BBB8](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY, __alpha);
}

float cblas_sdot(const int __N, const float *__X, const int __incX, const float *__Y, const int __incY)
{
  float result;

  MEMORY[0x1E0C8BBD8](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY);
  return result;
}

void cblas_sgemm(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const CBLAS_TRANSPOSE __TransB, const int __M, const int __N, const int __K, const float __alpha, const float *__A, const int __lda, const float *__B, const int __ldb, const float __beta, float *__C, const int __ldc)
{
  MEMORY[0x1E0C8BBF8](*(_QWORD *)&__Order, *(_QWORD *)&__TransA, *(_QWORD *)&__TransB, *(_QWORD *)&__M, *(_QWORD *)&__N, *(_QWORD *)&__K, __A, *(_QWORD *)&__lda, __alpha, __beta);
}

void cblas_sgemv(const CBLAS_ORDER __Order, const CBLAS_TRANSPOSE __TransA, const int __M, const int __N, const float __alpha, const float *__A, const int __lda, const float *__X, const int __incX, const float __beta, float *__Y, const int __incY)
{
  MEMORY[0x1E0C8BC20](*(_QWORD *)&__Order, *(_QWORD *)&__TransA, *(_QWORD *)&__M, *(_QWORD *)&__N, __A, *(_QWORD *)&__lda, __X, *(_QWORD *)&__incX, __alpha, __beta);
}

float cblas_snrm2(const int __N, const float *__X, const int __incX)
{
  float result;

  MEMORY[0x1E0C8BC48](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX);
  return result;
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1E0DE7A68](cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5270](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
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

void dispatch_apply_f(size_t iterations, dispatch_queue_t queue, void *context, void (__cdecl *work)(void *, size_t))
{
  MEMORY[0x1E0C82BE0](iterations, queue, context, work);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82D18](group, queue, context, work);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82FA0](queue, context, work);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int dpotrs_(char *__uplo, __CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__b, __CLPK_integer *__ldb, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BD70](__uplo, __n, __nrhs, __a, __lda, __b, __ldb, __info);
}

int dtrtrs_(char *__uplo, char *__trans, char *__diag, __CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__b, __CLPK_integer *__ldb, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BD88](__uplo, __trans, __diag, __n, __nrhs, __a, __lda, __b);
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x1E0D1FEE8]();
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

uint64_t espresso_device_id_for_metal_device()
{
  return MEMORY[0x1E0D1FF60]();
}

uint64_t espresso_get_status_string()
{
  return MEMORY[0x1E0D1FFB0]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1E0D1FFB8]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x1E0D1FFD0]();
}

uint64_t espresso_network_bind_input_cvpixelbuffer()
{
  return MEMORY[0x1E0D1FFE0]();
}

uint64_t espresso_network_bind_input_vimagebuffer_bgra8()
{
  return MEMORY[0x1E0D1FFF0]();
}

uint64_t espresso_network_bind_input_vimagebuffer_planar8()
{
  return MEMORY[0x1E0D1FFF8]();
}

uint64_t espresso_network_change_input_blob_shapes()
{
  return MEMORY[0x1E0D20010]();
}

uint64_t espresso_network_declare_input()
{
  return MEMORY[0x1E0D20038]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x1E0D20040]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x1E0D20060]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x1E0D20080]();
}

uint64_t espresso_network_set_memory_pool_id()
{
  return MEMORY[0x1E0D20098]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1E0D200B0]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1E0D200C8]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x1E0D200D8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1E0D200E8]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1E0D20100]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x1E0D20110]();
}

uint64_t espresso_plan_get_phase()
{
  return MEMORY[0x1E0D20120]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x1E0D20130]();
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
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

int flsl(uint64_t a1)
{
  return MEMORY[0x1E0C83420](a1);
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

long double ldexp(long double __x, int __e)
{
  long double result;

  MEMORY[0x1E0C83B40](*(_QWORD *)&__e, __x);
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF0](alignment, size, type_id);
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

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
  MEMORY[0x1E0C840C0](__b, __pattern4, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

float modff(float a1, float *a2)
{
  float result;

  MEMORY[0x1E0C841E8](a2, a1);
  return result;
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x1E0DE8028](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C849A8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

uint64_t random(void)
{
  return MEMORY[0x1E0C84FC0]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

int sgels_(char *__trans, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__b, __CLPK_integer *__ldb, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BDD0](__trans, __m, __n, __nrhs, __a, __lda, __b, __ldb);
}

int sgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BE08](__m, __n, __a, __lda, __ipiv, __info);
}

int sgetri_(__CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BE10](__n, __a, __lda, __ipiv, __work, __lwork, __info);
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

int sposv_(char *__uplo, __CLPK_integer *__n, __CLPK_integer *__nrhs, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__b, __CLPK_integer *__ldb, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BF00](__uplo, __n, __nrhs, __a, __lda, __b, __ldb, __info);
}

void srand(unsigned int a1)
{
  MEMORY[0x1E0C85478](*(_QWORD *)&a1);
}

int ssyevx_(char *__jobz, char *__range, char *__uplo, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__vl, __CLPK_real *__vu, __CLPK_integer *__il, __CLPK_integer *__iu, __CLPK_real *__abstol, __CLPK_integer *__m, __CLPK_real *__w, __CLPK_real *__z__, __CLPK_integer *__ldz, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__iwork, __CLPK_integer *__ifail, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BF30](__jobz, __range, __uplo, __n, __a, __lda, __vl, __vu);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x1E0DEEB90]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastMetatypeUnconditional()
{
  return MEMORY[0x1E0DEEBA0]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x1E0DEEBD8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_taskGroup_addPending()
{
  return MEMORY[0x1E0DF0FE8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

float tanhf(float a1)
{
  float result;

  MEMORY[0x1E0C85800](a1);
  return result;
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x1E0C85A18](out);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x1E0C8C060](__Log2n, *(_QWORD *)&__Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
  MEMORY[0x1E0C8C070](__C, __IC, __Z, __IZ, __N);
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
  MEMORY[0x1E0C8C0A0](__setup);
}

void vDSP_distancesq(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C0B0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C0D0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_f5x5(const float *__A, vDSP_Length __NR, vDSP_Length __NC, const float *__F, float *__C)
{
  MEMORY[0x1E0C8C0F8](__A, __NR, __NC, __F, __C);
}

void vDSP_fft2d_zip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC0, vDSP_Stride __IC1, vDSP_Length __Log2N0, vDSP_Length __Log2N1, FFTDirection __Direction)
{
  MEMORY[0x1E0C8C108](__Setup, __C, __IC0, __IC1, __Log2N0, __Log2N1, *(_QWORD *)&__Direction);
}

void vDSP_fft2d_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC0, vDSP_Stride __IC1, vDSP_Length __Log2N0, vDSP_Length __Log2N1, FFTDirection __Direction)
{
  MEMORY[0x1E0C8C110](__Setup, __C, __IC0, __IC1, __Log2N0, __Log2N1, *(_QWORD *)&__Direction);
}

void vDSP_fft2d_zrop(FFTSetup __Setup, const DSPSplitComplex *__A, vDSP_Stride __IA0, vDSP_Stride __IA1, const DSPSplitComplex *__C, vDSP_Stride __IC0, vDSP_Stride __IC1, vDSP_Length __Log2N0, vDSP_Length __Log2N1, FFTDirection __Direction)
{
  MEMORY[0x1E0C8C118](__Setup, __A, __IA0, __IA1, __C, __IC0, __IC1, __Log2N0);
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1B0](__A, __IA, __C, __N);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1E8](__A, __IA, __C, __N);
}

void vDSP_mmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x1E0C8C250](__A, __IA, __B, __IB, __C, __IC, __M, __N);
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C2E8](__A, __I, __C, __N);
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C328](__A, __IA, __C, __N);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C368](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C3D8](__A, __IA, __B, __C, __D, __ID, __N);
}

void vDSP_vdist(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C430](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vdiv(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C448](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vfill(const float *__A, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C460](__A, __C, __IC, __N);
}

void vDSP_vfixr16(const float *__A, vDSP_Stride __IA, __int16 *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C4D0](__A, __IA, __C, __IC, __N);
}

void vDSP_vfixru16(const float *__A, vDSP_Stride __IA, unsigned __int16 *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C510](__A, __IA, __C, __IC, __N);
}

void vDSP_vfixru8(const float *__A, vDSP_Stride __IA, unsigned __int8 *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C530](__A, __IA, __C, __IC, __N);
}

void vDSP_vflt32(const int *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C5B8](__A, __IA, __C, __IC, __N);
}

void vDSP_vfltu16(const unsigned __int16 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C5E8](__A, __IA, __C, __IC, __N);
}

void vDSP_vfltu8(const unsigned __int8 *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C608](__A, __IA, __C, __IC, __N);
}

void vDSP_vma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C6A0](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_vmaxmg(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C6D0](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vmma(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, const float *__D, vDSP_Stride __ID, float *__E, vDSP_Stride __IE, vDSP_Length __N)
{
  MEMORY[0x1E0C8C6F8](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C740](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vpythg(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, vDSP_Stride __IC, const float *__D, vDSP_Stride __ID, float *__E, vDSP_Stride __IE, vDSP_Length __N)
{
  MEMORY[0x1E0C8C788](__A, __IA, __B, __IB, __C, __IC, __D, __ID);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C800](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C860](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C888](__A, __IA, __B, __C, __IC, __D, __ID, __N);
}

void vDSP_vsmsa(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C898](__A, __IA, __B, __C, __D, __ID, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsort(float *__C, vDSP_Length __N, int __Order)
{
  MEMORY[0x1E0C8C8F0](__C, __N, *(_QWORD *)&__Order);
}

void vDSP_vsorti(const float *__C, vDSP_Length *__I, vDSP_Length *__Temporary, vDSP_Length __N, int __Order)
{
  MEMORY[0x1E0C8C900](__C, __I, __Temporary, __N, *(_QWORD *)&__Order);
}

void vDSP_vspdp(const float *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C918](__A, __IA, __C, __IC, __N);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C940](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vthrsc(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C9D0](__A, __IA, __B, __C, __D, __ID, __N);
}

void vDSP_ztoc(const DSPSplitComplex *__Z, vDSP_Stride __IZ, DSPComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8CA50](__Z, __IZ, __C, __IC, __N);
}

void vDSP_zvcmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8CA88](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8CAB8](__A, __IA, __C, __IC, __N);
}

void vDSP_zvmul(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, vDSP_Stride __IB, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N, int __Conjugate)
{
  MEMORY[0x1E0C8CAE8](__A, __IA, __B, __IB, __C, __IC, __N, *(_QWORD *)&__Conjugate);
}

void vDSP_zvzsml(const DSPSplitComplex *__A, vDSP_Stride __IA, const DSPSplitComplex *__B, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8CB20](__A, __IA, __B, __C, __IC, __N);
}

vImage_Error vImageAffineWarp_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, const vImage_AffineTransform *transform, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CB78](src, dest, tempBuffer, transform, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageBoxConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CBC8](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

vImage_Error vImageBufferFill_ARGB8888(const vImage_Buffer *dest, const Pixel_8888 color, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CBD8](dest, color, *(_QWORD *)&flags);
}

vImage_Error vImageBuffer_Init(vImage_Buffer *buf, vImagePixelCount height, vImagePixelCount width, uint32_t pixelBits, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CC00](buf, height, width, *(_QWORD *)&pixelBits, *(_QWORD *)&flags);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CC28](buf, format, backgroundColor, image, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGB8888toPlanar8(const vImage_Buffer *srcARGB, const vImage_Buffer *destA, const vImage_Buffer *destR, const vImage_Buffer *destG, const vImage_Buffer *destB, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CEA0](srcARGB, destA, destR, destG, destB, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CF28](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_Planar8toPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CF90](src, dest, *(_QWORD *)&flags, maxFloat, minFloat);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CFC0](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvolve_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const float *kernel, uint32_t kernel_height, uint32_t kernel_width, Pixel_F backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D1D8](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

vImage_Error vImageCopyBuffer(const vImage_Buffer *src, const vImage_Buffer *dest, size_t pixelSize, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D1E0](src, dest, pixelSize, *(_QWORD *)&flags);
}

vImage_Error vImageHorizontalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D340](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageHorizontalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D360](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageMatrixMultiply_ARGB8888ToPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, const int16_t matrix[4], int32_t divisor, const int16_t pre_bias[4], int32_t post_bias, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D418](src, dest, matrix, *(_QWORD *)&divisor, pre_bias, *(_QWORD *)&post_bias, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, const Pixel_8888 backColor, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D658](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D6E8](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D728](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D738](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D7F8](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageVerticalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D818](src, dest, *(_QWORD *)&flags);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A68](a1, a2, a3);
}

void vvexpf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x1E0C8D9D8](a1, a2, a3);
}

void vvintf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x1E0C8DA40](a1, a2, a3);
}

void vvnintf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x1E0C8DAB8](a1, a2, a3);
}

void vvsqrtf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x1E0C8DB80](a1, a2, a3);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  return (__int32 *)MEMORY[0x1E0C85CB8](__s, *(_QWORD *)&__c, __n);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

