void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_notifyForCurrentBucket(uint64_t a1)
{
  void (**v2)(id, void *);
  void *v3;
  void (**v4)(id, void *);

  if (*(_BYTE *)(a1 + 690))
  {
    *(_BYTE *)(a1 + 692) = 1;
  }
  else
  {
    *(_BYTE *)(a1 + 692) = 0;
    v2 = (void (**)(id, void *))_Block_copy(*(const void **)(a1 + 96));
    if (v2)
    {
      v4 = v2;
      (*(void (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        v4[2](v4, v3);

      v2 = v4;
    }

  }
}

void sub_1B7DB98F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void HDStatisticsCollectionEngine<HDStatisticsRelative<HDStatisticsSleepStages>>::advanceBucket(uint64_t a1, double a2, double a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v9 = 0;
  v10 = 0;
  v11 = 0;
  std::vector<HDRawQuantitySample>::__init_with_size[abi:ne180100]<HDRawQuantitySample*,HDRawQuantitySample*>(&v9, *(const void **)(a1 + 544), *(_QWORD *)(a1 + 552), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a1 + 552) - *(_QWORD *)(a1 + 544)) >> 3));
  HDStatisticsCollectionEngine<HDStatisticsRelative<HDStatisticsSleepStages>>::resetToBucket(a1, *(_QWORD *)a1 + 1, a2, a3);
  v6 = v9;
  v7 = v10;
  if (v9 != v10)
  {
    v8 = (uint64_t)v9;
    do
    {
      HDStatisticsCollectionEngine<HDStatisticsRelative<HDStatisticsSleepStages>>::addSample(a1, v8, 1);
      v8 += 40;
    }
    while ((void *)v8 != v7);
  }
  if (v6)
    operator delete(v6);
}

void sub_1B7DB99E0(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void HDStatisticsCollectionEngine<HDStatisticsRelative<HDStatisticsSleepStages>>::resetToBucket(uint64_t a1, uint64_t a2, double a3, double a4)
{
  id *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *i;
  _QWORD *v15;

  v8 = (id *)(a1 + 40);
  objc_storeStrong((id *)(a1 + 568), *(id *)(a1 + 40));
  *(double *)(a1 + 8) = a3;
  *(double *)(a1 + 16) = a4;
  *(double *)(a1 + 64) = a3;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a1 + 104);
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_QWORD *)(a1 + 160) = 0;
  *(_OWORD *)(a1 + 168) = xmmword_1B7F54B10;
  *(_QWORD *)(a1 + 184) = 0;
  *(_OWORD *)(a1 + 192) = xmmword_1B7F54B20;
  *(_QWORD *)(a1 + 208) = 0;
  *(_OWORD *)(a1 + 216) = xmmword_1B7F54B30;
  *(_QWORD *)(a1 + 232) = 0;
  *(_OWORD *)(a1 + 240) = xmmword_1B7F54B40;
  *(_QWORD *)(a1 + 256) = 0;
  *(_QWORD *)(a1 + 264) = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)(a1 + 272) = 5;
  *(_QWORD *)(a1 + 280) = 0;
  *(_QWORD *)(a1 + 288) = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)(a1 + 328) = 0;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  if (*(_QWORD *)(a1 + 352))
  {
    v9 = *(_QWORD **)(a1 + 336);
    v10 = *(_QWORD *)(a1 + 344);
    *(_QWORD *)(a1 + 336) = a1 + 344;
    *(_QWORD *)(v10 + 16) = 0;
    *(_QWORD *)(a1 + 344) = 0;
    *(_QWORD *)(a1 + 352) = 0;
    if (v9[1])
      v11 = (_QWORD *)v9[1];
    else
      v11 = v9;
    if (v11)
    {
      v12 = (_QWORD *)v11[2];
      if (v12)
      {
        v13 = (_QWORD *)*v12;
        if ((_QWORD *)*v12 == v11)
        {
          *v12 = 0;
          while (1)
          {
            v15 = (_QWORD *)v12[1];
            if (!v15)
              break;
            do
            {
              v12 = v15;
              v15 = (_QWORD *)*v15;
            }
            while (v15);
          }
        }
        else
        {
          for (v12[1] = 0; v13; v13 = (_QWORD *)v12[1])
          {
            do
            {
              v12 = v13;
              v13 = (_QWORD *)*v13;
            }
            while (v13);
          }
        }
        std::__tree<long>::destroy(v11);
        for (i = (_QWORD *)v12[2]; i; i = (_QWORD *)i[2])
          v12 = i;
        v11 = v12;
      }
    }
    std::__tree<long>::destroy(v11);
  }
  objc_storeStrong(v8, *(id *)(a1 + 568));
  *(_QWORD *)(a1 + 552) = *(_QWORD *)(a1 + 544);
  *(_QWORD *)a1 = a2;
}

void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_didChangeBucket(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (*(_BYTE *)(a1 + 692))
  {
    if (v3)
    {
      v6 = v3;
      v4 = _Block_copy(*(const void **)(a1 + 96));
      v5 = v4;
      if (v4)
        (*((void (**)(void *, id))v4 + 2))(v4, v6);

      v3 = v6;
    }
    *(_BYTE *)(a1 + 692) = 0;
  }

}

void sub_1B7DB9BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_currentBucketInterval(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 688))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithStart:end:", *(double *)(a1 + 120), *(double *)(a1 + 128));
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI20HDStatisticsRelativeI23HDStatisticsSleepStagesEE38_collapsedPendingInvalidationIntervalsERb_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

void sub_1B7DB9C8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_primitiveInvalidateInterval(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t v34;
  _QWORD *v35;
  char v36;
  _QWORD v37[4];
  id v38;
  id v39;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Unable to invalidate interval: no data source available."));
    v14 = 0;
    goto LABEL_17;
  }
  v30 = a3;
  if (v5
    && (_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_currentBucketInterval(a1),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hk_isAfterDate:", v9))
    {
      objc_msgSend(v5, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "hk_isBeforeOrEqualToDate:", v11);

    }
    else
    {
      v12 = 0;
    }

    v13 = _Block_copy(*(const void **)(a1 + 96));
    if ((v12 & 1) == 0)
    {
      v15 = operator new();
      v25 = *(void **)(a1 + 16);
      v26 = *(_QWORD *)(a1 + 24);
      v28 = *(_QWORD *)(a1 + 32);
      v27 = *(void **)(a1 + 40);
      v29 = objc_loadWeakRetained((id *)(a1 + 48));
      _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_HDConcreteStatisticsCollectionCalculatorImplementation(v15, v25, v26, v28, v27, v29);

      (*(void (**)(uint64_t, double))(*(_QWORD *)v15 + 24))(v15, *(double *)(a1 + 56));
      (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v15 + 64))(v15, a1 + 72, 0);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v15 + 56))(v15, *(_QWORD *)(a1 + 704));
      v16 = 0;
      v17 = (_QWORD *)v15;
      goto LABEL_11;
    }
  }
  else
  {
    v13 = _Block_copy(*(const void **)(a1 + 96));
  }
  v15 = 0;
  v16 = 1;
  *(_BYTE *)(a1 + 688) = 1;
  v17 = (_QWORD *)a1;
LABEL_11:
  v18 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI20HDStatisticsRelativeI23HDStatisticsSleepStagesEE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke;
  v37[3] = &unk_1E6D04928;
  v19 = v5;
  v38 = v19;
  v20 = v13;
  v39 = v20;
  (*(void (**)(_QWORD *, _QWORD *))(*v17 + 72))(v17, v37);
  if (v5)
  {
    objc_msgSend(v19, "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
    _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_configureForStartTime((uint64_t)v17);

  }
  else
  {
    (*(void (**)(_QWORD *))(*v17 + 32))(v17);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31[0] = v18;
  v31[1] = 3221225472;
  v31[2] = ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI20HDStatisticsRelativeI23HDStatisticsSleepStagesEE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke_2;
  v31[3] = &unk_1E6D04990;
  v34 = a1;
  v5 = v19;
  v36 = v16;
  v32 = v5;
  v35 = v17;
  v33 = WeakRetained;
  v14 = (*(uint64_t (**)(_QWORD *, _QWORD *, uint64_t))(*v17 + 112))(v17, v31, v30);
  v22 = _Block_copy(v20);
  v23 = (void *)v17[12];
  v17[12] = v22;

  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);

LABEL_17:
  return v14;
}

void sub_1B7DB9FF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAC494](v4, 0x10F1C40A21595ACLL);
  _Unwind_Resume(a1);
}

void ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI20HDStatisticsRelativeI23HDStatisticsSleepStagesEE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_4;
  objc_msgSend(v10, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hk_isBeforeOrEqualToDate:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v10, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "hk_isAfterOrEqualToDate:", v7);

    if ((v8 & 1) == 0)
    {
LABEL_4:
      v9 = *(_QWORD *)(a1 + 40);
      if (v9)
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
    }
  }

}

void sub_1B7DBA19C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI20HDStatisticsRelativeI23HDStatisticsSleepStagesEE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  _QWORD v29[5];
  _QWORD v30[6];
  uint64_t v31;
  char v32;

  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  v11 = *(void **)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(v4 + 8));
  v13 = *(_QWORD *)(a1 + 32);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI20HDStatisticsRelativeI23HDStatisticsSleepStagesEE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke_3;
  v30[3] = &__block_descriptor_57_e24_B52__0d8d16d24q32B40__44l;
  v32 = *(_BYTE *)(a1 + 64);
  v30[4] = v7;
  v30[5] = v10;
  v31 = *(_QWORD *)(a1 + 56);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI20HDStatisticsRelativeI23HDStatisticsSleepStagesEE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke_4;
  v29[3] = &__block_descriptor_40_e8_v16__0d8l;
  v29[4] = v31;
  v14 = objc_msgSend(v11, "collectionCalculator:queryForInterval:error:sampleHandler:mergeHandler:", WeakRetained, v13, a2, v30, v29);

  if ((_DWORD)v14)
  {
    v15 = *(_QWORD *)(a1 + 56);
    if (v15 != v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceReferenceDate");
      if (*(_QWORD *)(v15 + 40))
      {
        v18 = v17;
        while (*(double *)(v15 + 120) < v18)
        {
          objc_msgSend(*(id *)(v15 + 40), "dateIntervalAtIndex:", *(_QWORD *)(v15 + 112) + 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          HDStatisticsBucket<HDStatisticsRelative<HDStatisticsSleepStages>>::_updateSourceOrder(v15 + 120);
          HDStatisticsBucket<HDStatisticsRelative<HDStatisticsSleepStages>>::_mergeThroughTime(v15 + 120, *(double *)(v15 + 128));
          _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_statisticsFromFinishedBucket(v15, (double *)(v15 + 120));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "timeIntervalSinceReferenceDate");
          v23 = v22;
          objc_msgSend(v19, "endDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "timeIntervalSinceReferenceDate");
          HDStatisticsCollectionEngine<HDStatisticsRelative<HDStatisticsSleepStages>>::advanceBucket(v15 + 112, v23, v25);

          if (v20)
          {
            v26 = _Block_copy(*(const void **)(v15 + 96));
            v27 = v26;
            if (v26)
              (*((void (**)(void *, void *))v26 + 2))(v26, v20);

          }
          _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_didChangeBucket(v15, 0);

        }
      }

    }
  }
  return v14;
}

void sub_1B7DBA408(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI20HDStatisticsRelativeI23HDStatisticsSleepStagesEE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke_3(uint64_t a1, uint64_t a2, int a3, uint64_t a4, double a5, double a6, double a7)
{
  double v7;
  int v8;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  char v15;
  char v16;

  v7 = *(double *)(a1 + 32) - a6;
  if (v7 >= 0.01)
  {
    if (a7 - a6 - v7 >= 0.01)
    {
      v8 = 1;
      a6 = *(double *)(a1 + 32);
    }
    else
    {
      a2 = 0;
      v8 = 0;
      a6 = 0.0;
      a7 = 0.0;
    }
  }
  else
  {
    v8 = 1;
  }
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = a2;
  v15 = v8;
  v16 = 0;
  if (*(_BYTE *)(a1 + 56))
  {
    if (v8)
      return _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_primitiveAddSample(*(_QWORD *)(a1 + 48), (uint64_t)&v11, a3, a4);
  }
  else
  {
    v10 = *(double *)(a1 + 40) - a6;
    if (v10 >= 0.01)
    {
      if (a7 - a6 - v10 >= 0.01)
        a7 = *(double *)(a1 + 40);
    }
    else
    {
      v8 = 0;
    }
    v12 = a6;
    v13 = a7;
    v15 = v8;
    if (v8)
      return _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_primitiveAddSample(*(_QWORD *)(a1 + 48), (uint64_t)&v11, a3, a4);
  }
  return 1;
}

void ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI20HDStatisticsRelativeI23HDStatisticsSleepStagesEE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke_4(uint64_t a1, double a2)
{
  _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_mergeToTime(*(_QWORD *)(a1 + 32), a2);
}

void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_mergeToTime(uint64_t a1, double a2)
{
  if (*(_BYTE *)(a1 + 688))
    _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_configureForStartTime(a1);
  if (*(_QWORD *)(a1 + 40))
    _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_advanceToTime(a1, a2);
  if (*(double *)(a1 + 128) > a2)
    HDStatisticsBucket<HDStatisticsRelative<HDStatisticsSleepStages>>::_mergeThroughTime(a1 + 120, a2);
}

void std::__introsort<std::_ClassicAlgPolicy,_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_addPendingSamples(std::vector<HDRawQuantitySample> &,NSError * {__autoreleasing}*)::{lambda(HDRawQuantitySample const&,HDRawQuantitySample const&)#1} &,HDRawQuantitySample*,false>(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  double *v14;
  double *v15;
  __int128 v16;
  __int128 v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  unint64_t v26;
  double v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  BOOL v35;
  double v36;
  uint64_t v37;
  double v38;
  unint64_t v39;
  double v40;
  unint64_t v41;
  unint64_t v42;
  double v43;
  __int128 v44;
  __int128 v45;
  double v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD *v52;
  BOOL v54;
  uint64_t v55;
  unint64_t v56;
  _QWORD *v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  int64_t v64;
  int64_t v65;
  int64_t v66;
  uint64_t v67;
  unint64_t v68;
  double v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  int64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  unint64_t v89;
  double v90;
  uint64_t v91;
  unint64_t v92;
  __int128 v93;
  __int128 v94;
  _QWORD *v96;
  double v97;
  uint64_t v98;
  _QWORD *v99;
  __int128 v100;
  double v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  uint64_t v121;
  __int128 v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_addPendingSamples(std::vector<HDRawQuantitySample> &,NSError * {__autoreleasing}*)::{lambda(HDRawQuantitySample const&,HDRawQuantitySample const&)#1} &,HDRawQuantitySample*>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int16 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  v4 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      if (*(double *)(a2 - 32) < *(double *)(a1 + 8))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(_OWORD *)a1;
        v8 = *(_OWORD *)(a1 + 16);
        v9 = *(_WORD *)(a2 - 8);
        v10 = *(_OWORD *)(a2 - 24);
        *(_OWORD *)a1 = *(_OWORD *)(a2 - 40);
        *(_OWORD *)(a1 + 16) = v10;
        *(_WORD *)(a1 + 32) = v9;
        *(_OWORD *)(a2 - 24) = v8;
        *(_OWORD *)(a2 - 40) = v7;
        *(_WORD *)(a2 - 8) = v6;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_addPendingSamples(std::vector<HDRawQuantitySample> &,NSError * {__autoreleasing}*)::{lambda(HDRawQuantitySample const&,HDRawQuantitySample const&)#1} &,HDRawQuantitySample*>((__int128 *)a1, (double *)(a1 + 40), (double *)(a2 - 40));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_addPendingSamples(std::vector<HDRawQuantitySample> &,NSError * {__autoreleasing}*)::{lambda(HDRawQuantitySample const&,HDRawQuantitySample const&)#1} &,HDRawQuantitySample*>(a1, a1 + 40, a1 + 80, a2 - 40);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_addPendingSamples(std::vector<HDRawQuantitySample> &,NSError * {__autoreleasing}*)::{lambda(HDRawQuantitySample const&,HDRawQuantitySample const&)#1} &,HDRawQuantitySample*>(a1, a1 + 40, a1 + 80, a1 + 120, a2 - 40);
      return 1;
    default:
      v11 = a1 + 80;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_addPendingSamples(std::vector<HDRawQuantitySample> &,NSError * {__autoreleasing}*)::{lambda(HDRawQuantitySample const&,HDRawQuantitySample const&)#1} &,HDRawQuantitySample*>((__int128 *)a1, (double *)(a1 + 40), (double *)(a1 + 80));
      v12 = a1 + 120;
      if (a1 + 120 == a2)
        return 1;
      v13 = 0;
      v14 = 0;
      break;
  }
  while (1)
  {
    v15 = *(double *)(v12 + 8);
    if (v15 < *(double *)(v11 + 8))
    {
      v16 = *(_QWORD *)v12;
      v21 = *(_OWORD *)(v12 + 16);
      v22 = *(_QWORD *)(v12 + 32);
      v17 = v13;
      while (1)
      {
        v18 = a1 + v17;
        v19 = *(_OWORD *)(a1 + v17 + 96);
        *(_OWORD *)(v18 + 120) = *(_OWORD *)(a1 + v17 + 80);
        *(_OWORD *)(v18 + 136) = v19;
        *(_WORD *)(v18 + 152) = *(_WORD *)(a1 + v17 + 112);
        if (v17 == -80)
          break;
        v17 -= 40;
        if (v15 >= *(double *)(v18 + 48))
        {
          v20 = a1 + v17 + 120;
          goto LABEL_12;
        }
      }
      v20 = a1;
LABEL_12:
      *(_QWORD *)v20 = v16;
      *(double *)(v20 + 8) = v15;
      *(_OWORD *)(v20 + 16) = v21;
      *(_WORD *)(v20 + 32) = v22;
      if (++v14 == 8)
        return v12 + 40 == a2;
    }
    v11 = v12;
    v13 += 40;
    v12 += 40;
    if (v12 == a2)
      return 1;
  }
}

uint64_t ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI20HDStatisticsRelativeI23HDStatisticsSleepStagesEE25queryForInitialStatisticsEP32HDStatisticsCollectionCalculatorPU15__autoreleasingP7NSError_block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = (void *)a1[5];
  v4 = a1[6];
  v5 = (void *)a1[4];
  objc_msgSend(v5, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI20HDStatisticsRelativeI23HDStatisticsSleepStagesEE25queryForInitialStatisticsEP32HDStatisticsCollectionCalculatorPU15__autoreleasingP7NSError_block_invoke_2;
  v10[3] = &__block_descriptor_40_e24_B52__0d8d16d24q32B40__44l;
  v10[4] = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI20HDStatisticsRelativeI23HDStatisticsSleepStagesEE25queryForInitialStatisticsEP32HDStatisticsCollectionCalculatorPU15__autoreleasingP7NSError_block_invoke_3;
  v9[3] = &__block_descriptor_40_e8_v16__0d8l;
  v7 = objc_msgSend(v3, "collectionCalculator:queryForInterval:error:sampleHandler:mergeHandler:", v5, v6, a2, v10, v9);

  return v7;
}

void sub_1B7DBB0B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI20HDStatisticsRelativeI23HDStatisticsSleepStagesEE25queryForInitialStatisticsEP32HDStatisticsCollectionCalculatorPU15__autoreleasingP7NSError_block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4, double a5, double a6, double a7)
{
  uint64_t v10;
  void *v11;
  double v12;
  _QWORD v14[4];
  char v15;
  BOOL v16;

  v10 = *(_QWORD *)(a1 + 32);
  *(double *)v14 = a5;
  *(double *)&v14[1] = a6;
  *(double *)&v14[2] = a7;
  v14[3] = a2;
  v15 = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v16 = v12 <= a7;

  return _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_primitiveAddSample(v10, (uint64_t)v14, a3, a4);
}

void sub_1B7DBB158(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI20HDStatisticsRelativeI23HDStatisticsSleepStagesEE25queryForInitialStatisticsEP32HDStatisticsCollectionCalculatorPU15__autoreleasingP7NSError_block_invoke_3(uint64_t a1, double a2)
{
  _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsSleepStages>>::_mergeToTime(*(_QWORD *)(a1 + 32), a2);
}

void HDStatisticsRelative<HDStatisticsSleepStages>::archive(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 160) = 0;
  *(_DWORD *)(a1 + 204) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = &off_1E6CEA528;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  statistics::Statistics::makePrimaryStatistics((_QWORD *)a1);
  HDStatisticsSleepStages::archive((HDStatisticsSleepStages *)(a2 + 8));
}

void sub_1B7DBB1C8(_Unwind_Exception *a1)
{
  statistics::Statistics *v1;

  statistics::Statistics::~Statistics(v1);
  _Unwind_Resume(a1);
}

double HDStatisticsRelative<HDStatisticsSleepStages>::unarchive(uint64_t a1, uint64_t a2)
{
  double result;
  uint64_t v3;
  uint64_t v4;

  *(_DWORD *)a1 = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = xmmword_1B7F54B10;
  *(_QWORD *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 64) = xmmword_1B7F54B20;
  *(_QWORD *)(a1 + 80) = 0;
  *(_OWORD *)(a1 + 88) = xmmword_1B7F54B30;
  *(_QWORD *)(a1 + 104) = 0;
  *(_OWORD *)(a1 + 112) = xmmword_1B7F54B40;
  *(_QWORD *)(a1 + 128) = 0;
  *(_OWORD *)(a1 + 136) = xmmword_1B7F54B50;
  *(_QWORD *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 160) = 0x7FFFFFFFFFFFFFFFLL;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_WORD *)(a1 + 200) = 0;
  if (*(_QWORD *)(a2 + 128))
    HDStatisticsSleepStages::unarchive(*(HDStatisticsSleepStages **)(a2 + 128), (const statistics::Statistics *)a2);
  *(_DWORD *)a1 = *(_QWORD *)(a2 + 136);
  v3 = *(_QWORD *)(a2 + 112);
  if (v3)
  {
    result = *(double *)(v3 + 8);
    v4 = *(_QWORD *)(v3 + 16);
    *(int8x16_t *)(a1 + 168) = vextq_s8(*(int8x16_t *)(v3 + 24), *(int8x16_t *)(v3 + 24), 8uLL);
    *(double *)(a1 + 184) = result;
    *(_QWORD *)(a1 + 192) = v4;
    *(_BYTE *)(a1 + 200) = 1;
  }
  return result;
}

uint64_t _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_HDConcreteStatisticsCollectionCalculatorImplementation(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  char v6;
  uint64_t v8;
  double v9;

  v6 = a3;
  v8 = _HDStatisticsCollectionCalculatorImplementation::_HDStatisticsCollectionCalculatorImplementation(a1, a2, a3, a4, a5, a6);
  *(_QWORD *)v8 = &off_1E6D09820;
  v9 = 900.0;
  if ((v6 & 0x10) == 0)
    v9 = 0.0;
  *(double *)(v8 + 56) = v9;
  *(_OWORD *)(v8 + 64) = 0u;
  *(_OWORD *)(v8 + 80) = 0u;
  *(_QWORD *)(v8 + 104) = 0;
  *(_QWORD *)(v8 + 112) = 0;
  *(_QWORD *)(v8 + 96) = 0;
  HDStatisticsBucket<HDStatisticsSleepStages>::HDStatisticsBucket(v8 + 120, 0, -1.79769313e308, 1.79769313e308);
  *(_OWORD *)(a1 + 608) = 0u;
  *(_OWORD *)(a1 + 624) = 0u;
  *(_WORD *)(a1 + 640) = 1;
  *(_BYTE *)(a1 + 642) = 0;
  *(_BYTE *)(a1 + 644) = 0;
  *(_QWORD *)(a1 + 648) = 0xFFEFFFFFFFFFFFFFLL;
  *(_OWORD *)(a1 + 656) = 0u;
  *(_OWORD *)(a1 + 672) = 0u;
  *(_QWORD *)(a1 + 688) = 0;
  return a1;
}

void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::~_HDConcreteStatisticsCollectionCalculatorImplementation(uint64_t a1)
{
  _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::~_HDConcreteStatisticsCollectionCalculatorImplementation(a1);
  JUMPOUT(0x1BCCAC494);
}

{
  void *v2;
  void *v3;
  void *v4;

  *(_QWORD *)a1 = &off_1E6D09820;
  v2 = *(void **)(a1 + 672);
  if (v2)
  {
    *(_QWORD *)(a1 + 680) = v2;
    operator delete(v2);
  }

  v3 = *(void **)(a1 + 608);
  if (v3)
  {
    *(_QWORD *)(a1 + 616) = v3;
    operator delete(v3);
  }
  HDStatisticsBucket<HDStatisticsRelative<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>>>::~HDStatisticsBucket(a1 + 120);
  objc_destroyWeak((id *)(a1 + 104));

  v4 = *(void **)(a1 + 72);
  if (v4)
  {
    *(_QWORD *)(a1 + 80) = v4;
    operator delete(v4);
  }

  _HDStatisticsCollectionCalculatorImplementation::~_HDStatisticsCollectionCalculatorImplementation((_HDStatisticsCollectionCalculatorImplementation *)a1);
}

double _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::mergeGranularity(uint64_t a1)
{
  return *(double *)(a1 + 56);
}

uint64_t _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::setMergeGranularity(uint64_t result, double a2)
{
  if (*(double *)(result + 56) != a2)
  {
    *(double *)(result + 56) = a2;
    *(_BYTE *)(result + 640) = 1;
  }
  return result;
}

id _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::dateInterval(uint64_t a1)
{
  return *(id *)(a1 + 64);
}

void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::setDateInterval(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = objc_msgSend(v6, "copy");
  v4 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v3;

  objc_msgSend(v6, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_configureForStartTime(a1);

}

void sub_1B7DBB404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::configureMergeAnchor(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  if (!*(_QWORD *)(a1 + 40))
  {
    v5 = v3;
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    *(_QWORD *)(a1 + 648) = v4;
    v3 = v5;
  }

}

void sub_1B7DBB464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::setStatisticsConfiguration(id *a1, void *a2)
{
  id v4;
  id v5;
  id v6;
  id v7;

  objc_storeStrong(a1 + 82, a2);
  v7 = a2;
  v4 = a1[82];
  v5 = a1[79];
  a1[79] = v4;
  v6 = v4;

  objc_storeStrong(a1 + 19, a1[79]);
}

uint64_t _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::setIntervalMask(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  BOOL v7;

  v6 = (char *)(a1 + 72);
  if (v6 != (char *)a2)
    std::vector<HKRawInterval<double>>::__assign_with_size[abi:ne180100]<HKRawInterval<double>*,HKRawInterval<double>*>(v6, *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 4);
  if (*(_QWORD *)(a1 + 40))
    return 1;
  v7 = *(_QWORD *)(a1 + 224) == *(_QWORD *)(a1 + 216) && *(uint64_t *)(a1 + 240) < 1
    || HKIntervalMask<double>::firstDifference(*(_QWORD *)(a1 + 184), *(_QWORD *)(a1 + 192), *(_QWORD *)a2, *(_QWORD *)(a2 + 8)) >= *(double *)(a1 + 176);
  if (a1 + 184 != a2)
    std::vector<HKRawInterval<double>>::__assign_with_size[abi:ne180100]<HKRawInterval<double>*,HKRawInterval<double>*>((char *)(a1 + 184), *(char **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 4);
  if (v7)
    return 1;
  else
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)a1 + 128))(a1, 0, a3);
}

void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::setStatisticsHandler(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "copy");
  v4 = *(void **)(a1 + 96);
  *(_QWORD *)(a1 + 96) = v3;

}

void sub_1B7DBB5F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::dataSource(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(a1 + 104));
}

id _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::setDataSource(uint64_t a1, void *a2)
{
  return objc_storeWeak((id *)(a1 + 104), a2);
}

id _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::currentStatistics(uint64_t a1)
{
  void *v3;
  _BYTE v4[8];
  double v5;

  if (*(_BYTE *)(a1 + 640))
    return 0;
  HDStatisticsBucket<HDStatisticsSleepStages>::HDStatisticsBucket((uint64_t)v4, a1 + 120);
  HDStatisticsBucket<HDStatisticsSleepStages>::_updateSourceOrder((uint64_t)v4);
  HDStatisticsBucket<HDStatisticsSleepStages>::_mergeThroughTime((uint64_t)v4, v5);
  _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_statisticsFromFinishedBucket(a1, (uint64_t)v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HDStatisticsBucket<HDStatisticsRelative<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>>>::~HDStatisticsBucket((uint64_t)v4);
  return v3;
}

void sub_1B7DBB6A0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  HDStatisticsBucket<HDStatisticsRelative<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>>>::~HDStatisticsBucket((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::addSample(uint64_t a1, double *a2, uint64_t a3)
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  void *v17;
  unint64_t v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  __int128 v32;
  __int128 v33;
  char *v34;
  char *v35;
  __int128 v36;
  __int128 v37;

  v6 = *(id *)(a1 + 64);
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  if (v9 > a2[2])
  {

    goto LABEL_10;
  }
  objc_msgSend(v7, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v12 = v11;
  v13 = a2[1];

  if (v12 >= v13)
  {
LABEL_4:
    if (!*(_BYTE *)(a1 + 642))
      goto LABEL_21;
    if (!*(_BYTE *)(a1 + 641))
    {
      if (*(_QWORD *)(a1 + 40))
      {
        if (*(_BYTE *)(a1 + 640))
        {
          v14 = -1.79769313e308;
        }
        else
        {
          v16 = *(double *)(a1 + 176);
          v14 = *(double *)(a1 + 120);
          if (v16 <= v14)
            v16 = -1.79769313e308;
          if (v16 >= v14)
            v14 = v16;
        }
      }
      else
      {
        v14 = -1.79769313e308;
        if (*(double *)(a1 + 176) > *(double *)(a1 + 120))
          v14 = *(double *)(a1 + 176);
      }
      if (v14 > a2[1])
      {
        objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithStart:end:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(*(_QWORD *)a1 + 128))(a1, v17, a3);

        goto LABEL_22;
      }
      if (*(_BYTE *)(a1 + 643))
      {
LABEL_21:
        v15 = _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_primitiveAddSample(a1, a2, 1, a3);
        goto LABEL_22;
      }
      v19 = *(_QWORD *)(a1 + 680);
      v20 = *(_QWORD *)(a1 + 688);
      if (v19 >= v20)
      {
        v24 = *(_QWORD *)(a1 + 672);
        v25 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v19 - v24) >> 3);
        v26 = v25 + 1;
        if (v25 + 1 > 0x666666666666666)
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        v27 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v20 - v24) >> 3);
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x333333333333333)
          v28 = 0x666666666666666;
        else
          v28 = v26;
        if (v28)
          v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawQuantitySample>>(v28);
        else
          v29 = 0;
        v30 = v28 + 40 * v25;
        v31 = v28 + 40 * v29;
        v32 = *(_OWORD *)a2;
        v33 = *((_OWORD *)a2 + 1);
        *(double *)(v30 + 32) = a2[4];
        *(_OWORD *)v30 = v32;
        *(_OWORD *)(v30 + 16) = v33;
        v23 = v30 + 40;
        v34 = *(char **)(a1 + 680);
        v35 = *(char **)(a1 + 672);
        if (v34 != v35)
        {
          do
          {
            v36 = *(_OWORD *)(v34 - 40);
            v37 = *(_OWORD *)(v34 - 24);
            *(_WORD *)(v30 - 8) = *((_WORD *)v34 - 4);
            *(_OWORD *)(v30 - 24) = v37;
            *(_OWORD *)(v30 - 40) = v36;
            v30 -= 40;
            v34 -= 40;
          }
          while (v34 != v35);
          v34 = *(char **)(a1 + 672);
        }
        *(_QWORD *)(a1 + 672) = v30;
        *(_QWORD *)(a1 + 680) = v23;
        *(_QWORD *)(a1 + 688) = v31;
        if (v34)
          operator delete(v34);
      }
      else
      {
        v21 = *(_OWORD *)a2;
        v22 = *((_OWORD *)a2 + 1);
        *(double *)(v19 + 32) = a2[4];
        *(_OWORD *)v19 = v21;
        *(_OWORD *)(v19 + 16) = v22;
        v23 = v19 + 40;
      }
      *(_QWORD *)(a1 + 680) = v23;
    }
  }
LABEL_10:
  v15 = 1;
LABEL_22:

  return v15;
}

void sub_1B7DBB940(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::performAddSampleTransaction(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  double v34;
  double v35;
  uint64_t v36;
  __int128 *v37;
  uint64_t v38;
  unint64_t v39;
  __int128 *v40;
  __int128 v41;
  __int128 v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  id v48;
  int v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  int v53;
  double *v54;
  int v55;
  char v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  void *v65;
  void *__p;
  uint64_t v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (*(_BYTE *)(a1 + 642))
  {
    v7 = (*((uint64_t (**)(id, uint64_t))v5 + 2))(v5, a3);
    goto LABEL_83;
  }
  *(_WORD *)(a1 + 642) = 1;
  v67 = a3;
  if (!(*((unsigned int (**)(id, uint64_t))v5 + 2))(v5, a3))
  {
    v7 = 0;
    goto LABEL_82;
  }
  v65 = v6;
  if (*(_BYTE *)(a1 + 641))
    goto LABEL_5;
  v9 = *(void **)(a1 + 664);
  if (!v9)
  {
    v68 = 0;
    goto LABEL_28;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
LABEL_5:
    v8 = 0;
    v68 = 0;
    goto LABEL_29;
  }
  objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_417_0);
  v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v10 = *(id *)(a1 + 664);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
  if (!v11)
  {

    v12 = 0;
    goto LABEL_27;
  }
  v12 = 0;
  v13 = *(_QWORD *)v70;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v70 != v13)
        objc_enumerationMutation(v10);
      v15 = *(id *)(*((_QWORD *)&v69 + 1) + 8 * i);
      v16 = v15;
      if (v12)
      {
        objc_msgSend(v15, "startDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "endDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "hk_isBeforeOrEqualToDate:", v18);

        if (v19)
        {
          objc_msgSend(v16, "endDate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "endDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "hk_isAfterDate:", v21);

          if (!v22)
            goto LABEL_21;
          v23 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v12, "startDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "endDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (id)objc_msgSend(v23, "initWithStartDate:endDate:", v24, v25);

        }
        else
        {
          objc_msgSend(v68, "addObject:", v12);
          v26 = v16;

        }
        v12 = v26;
      }
      else
      {
        v12 = v15;
      }
LABEL_21:

    }
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
  }
  while (v11);

  if (v12)
    objc_msgSend(v68, "addObject:", v12);
LABEL_27:

LABEL_28:
  v8 = 1;
LABEL_29:
  v27 = *(void **)(a1 + 664);
  *(_QWORD *)(a1 + 664) = 0;

  *(_BYTE *)(a1 + 641) = 0;
  if (!v8)
  {
    v38 = *(_QWORD *)(a1 + 672);
    *(_QWORD *)(a1 + 688) = 0;
    *(_QWORD *)(a1 + 680) = 0;
    *(_QWORD *)(a1 + 672) = 0;
    v39 = v38;
    goto LABEL_47;
  }
  objc_msgSend(v68, "lastObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_currentBucketInterval(a1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "endDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "endDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "hk_isBeforeOrEqualToDate:", v31);

    if (v32)
    {
      objc_msgSend(v28, "endDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "timeIntervalSinceReferenceDate");
      v35 = v34;

      v36 = *(_QWORD *)(a1 + 672);
      v37 = *(__int128 **)(a1 + 680);
      while ((__int128 *)v36 != v37)
      {
        if (*(double *)(v36 + 8) < v35)
        {
          if ((__int128 *)v36 != v37)
          {
            v40 = (__int128 *)(v36 + 40);
            if ((__int128 *)(v36 + 40) != v37)
            {
              do
              {
                if (*((double *)v40 + 1) >= v35)
                {
                  v41 = *v40;
                  v42 = v40[1];
                  *(_WORD *)(v36 + 32) = *((_WORD *)v40 + 16);
                  *(_OWORD *)v36 = v41;
                  *(_OWORD *)(v36 + 16) = v42;
                  v36 += 40;
                }
                v40 = (__int128 *)((char *)v40 + 40);
              }
              while (v40 != v37);
              v37 = *(__int128 **)(a1 + 680);
            }
          }
          if ((__int128 *)v36 != v37)
            *(_QWORD *)(a1 + 680) = v36;
          break;
        }
        v36 += 40;
      }
    }

  }
  v38 = *(_QWORD *)(a1 + 672);
  v39 = *(_QWORD *)(a1 + 680);
  *(_QWORD *)(a1 + 688) = 0;
  *(_QWORD *)(a1 + 672) = 0;
  *(_QWORD *)(a1 + 680) = 0;
  if (!objc_msgSend(v68, "count"))
    goto LABEL_60;
LABEL_47:
  v43 = v68;
  __p = (void *)v38;
  if (v43)
  {
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v44 = v43;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v70;
      while (2)
      {
        for (j = 0; j != v45; ++j)
        {
          if (*(_QWORD *)v70 != v46)
            objc_enumerationMutation(v44);
          v48 = *(id *)(*((_QWORD *)&v69 + 1) + 8 * j);
          v49 = _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_primitiveInvalidateInterval(a1, v48, v67);

          if (!v49)
          {

            goto LABEL_70;
          }
        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
        if (v45)
          continue;
        break;
      }
    }

LABEL_59:
    v38 = (uint64_t)__p;
LABEL_60:
    v51 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v39 - v38) >> 3));
    if (v39 == v38)
      v52 = 0;
    else
      v52 = v51;
    v53 = 1;
    std::__introsort<std::_ClassicAlgPolicy,_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addPendingSamples(std::vector<HDRawQuantitySample> &,NSError * {__autoreleasing}*)::{lambda(HDRawQuantitySample const&,HDRawQuantitySample const&)#1} &,HDRawQuantitySample*,false>(v38, v39, v52, 1);
    __p = (void *)v38;
    if (v39 != v38)
    {
      v54 = (double *)v38;
      v50 = v67;
      do
      {
        v55 = _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_primitiveAddSample(a1, v54, 1, v50);
        v53 = v55;
        v54 += 5;
        if (v54 == (double *)v39)
          v56 = 0;
        else
          v56 = v55;
        v50 = v67;
      }
      while ((v56 & 1) != 0);
    }
  }
  else
  {
    if (_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_primitiveInvalidateInterval(a1, 0, v67))goto LABEL_59;
LABEL_70:
    v53 = 0;
  }
  if (*(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 616) != *(_QWORD *)(a1 + 608))
  {
    do
    {
      objc_msgSend(*(id *)(a1 + 40), "dateIntervalAtIndex:", *(_QWORD *)(a1 + 112) + 1, v50, v65);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      HDStatisticsBucket<HDStatisticsSleepStages>::_updateSourceOrder(a1 + 120);
      HDStatisticsBucket<HDStatisticsSleepStages>::_mergeThroughTime(a1 + 120, *(double *)(a1 + 128));
      _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_statisticsFromFinishedBucket(a1, a1 + 120);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "startDate");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "timeIntervalSinceReferenceDate");
      v61 = v60;
      objc_msgSend(v57, "endDate");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "timeIntervalSinceReferenceDate");
      HDStatisticsCollectionEngine<HDStatisticsSleepStages>::advanceBucket(a1 + 112, v61, v63);

      _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_didChangeBucket(a1, v58);
      _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_notifyForCurrentBucket(a1);

    }
    while (*(_QWORD *)(a1 + 616) != *(_QWORD *)(a1 + 608));
  }
  *(_BYTE *)(a1 + 642) = 0;
  if (__p)
    operator delete(__p);

  if (v53)
  {
    if (*(_BYTE *)(a1 + 644))
    {
      *(_BYTE *)(a1 + 644) = 0;
      v6 = v65;
      _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_notifyForCurrentBucket(a1);
      v7 = 1;
      goto LABEL_82;
    }
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  v6 = v65;
LABEL_82:
  *(_BYTE *)(a1 + 642) = 0;
LABEL_83:

  return v7;
}

void sub_1B7DBC038(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, void *a12)
{
  void *v12;
  uint64_t v13;

  if (a2)
  {

    objc_begin_catch(exception_object);
    *(_BYTE *)(v13 + 642) = 0;
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

uint64_t _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::enableImmediateSampleInsertion(uint64_t result)
{
  *(_BYTE *)(result + 643) = 1;
  return result;
}

uint64_t _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::invalidateInterval(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a2;
  v6 = *(void **)(a1 + 40);
  if (!v6)
  {

    goto LABEL_11;
  }
  if (!v5)
  {
LABEL_11:
    if (*(_BYTE *)(a1 + 642))
      goto LABEL_12;
    v7 = 0;
LABEL_14:
    v11 = _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_primitiveInvalidateInterval(a1, v7, a3);
    goto LABEL_15;
  }
  objc_msgSend(v6, "dateIntervalForIntervalsContainingInterval:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*(_BYTE *)(a1 + 642))
    goto LABEL_14;
  if (!v7)
  {
LABEL_12:
    v12 = *(void **)(a1 + 664);
    *(_QWORD *)(a1 + 664) = 0;

    v7 = 0;
    v11 = 1;
    *(_BYTE *)(a1 + 641) = 1;
    goto LABEL_15;
  }
  if (!*(_BYTE *)(a1 + 641))
  {
    v8 = *(void **)(a1 + 664);
    if (!v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = *(void **)(a1 + 664);
      *(_QWORD *)(a1 + 664) = v9;

      v8 = *(void **)(a1 + 664);
    }
    objc_msgSend(v8, "addObject:", v7);
  }
  v11 = 1;
LABEL_15:

  return v11;
}

void sub_1B7DBC334(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::queryForInitialStatistics(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  if (WeakRetained)
  {
    v7 = MEMORY[0x1E0C809B0];
    *(_BYTE *)(a1 + 640) = 1;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE25queryForInitialStatisticsEP32HDStatisticsCollectionCalculatorPU15__autoreleasingP7NSError_block_invoke;
    v10[3] = &unk_1E6CFD9F8;
    v13 = a1;
    v11 = v5;
    v12 = WeakRetained;
    v8 = (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)a1 + 112))(a1, v10, a3);
    if ((_DWORD)v8 && *(_BYTE *)(a1 + 640) && !*(_QWORD *)(a1 + 40))
      _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_configureForStartTime(a1);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Unable to query for initial statistics: no data source available."));
    v8 = 0;
  }

  return v8;
}

void sub_1B7DBC454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

uint64_t _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::reset(uint64_t result)
{
  *(_BYTE *)(result + 640) = 1;
  return result;
}

void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::encodeInternalsWithEncoder(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  int8x16_t v6;
  uint64_t v7;
  int8x16_t v8;
  int8x16_t *v9;
  int8x16_t *i;
  void (**v11)(statistics::StatisticsBucket *__hidden);
  int8x16_t v12;
  int8x16_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD v19[6];
  uint64_t v20;
  BOOL v21;
  char v22;
  char v23;
  int v24;
  _QWORD v25[6];
  int v26;
  _QWORD v27[3];
  int8x16_t v28;
  __int8 v29;
  __int8 v30;
  char v31;
  int v32;

  v3 = a2;
  objc_msgSend(v3, "encodeBool:forKey:", *(unsigned __int8 *)(a1 + 640), CFSTR("needs_config"));
  v4 = v3;
  v25[0] = &off_1E6D09A88;
  v25[1] = 0;
  v26 = 0;
  v5 = *(_QWORD *)(a1 + 112);
  LOBYTE(v26) = 1;
  v25[2] = v5;
  memset(&v25[3], 0, 24);
  statistics::StatisticsEngine::makeCurrentBucket(v25);
  v11 = &off_1E6CEA578;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  v24 = 511;
  memset(v19, 0, sizeof(v19));
  v20 = 0;
  v6 = vextq_s8(*(int8x16_t *)(a1 + 120), *(int8x16_t *)(a1 + 120), 8uLL);
  v7 = *(_QWORD *)(a1 + 136);
  v22 = *(_BYTE *)(a1 + 144);
  v23 = *(_BYTE *)(a1 + 145);
  v21 = *(_DWORD *)(a1 + 148) == 0;
  v8 = vextq_s8(*(int8x16_t *)(a1 + 160), *(int8x16_t *)(a1 + 160), 8uLL);
  v12 = v6;
  v13 = v8;
  v8.i64[0] = *(_QWORD *)(a1 + 176);
  v17 = v7;
  v18 = v8.i64[0];
  v9 = *(int8x16_t **)(a1 + 216);
  for (i = *(int8x16_t **)(a1 + 224); v9 != i; v9 += 3)
  {
    v27[0] = &off_1E6CFF278;
    v32 = 127;
    v28 = vextq_s8(*v9, *v9, 8uLL);
    v27[1] = v9[1].i64[0];
    v27[2] = v9[1].i64[1];
    v31 = 0;
    v30 = v9[2].i8[9];
    v29 = v9[2].i8[10];
    PB::PtrVector<statistics::RawQuantitySample>::emplace_back<statistics::RawQuantitySample&>((uint64_t **)v19, (const statistics::RawQuantitySample *)v27);
    PB::Base::~Base((PB::Base *)v27);
  }
  statistics::StatisticsBucket::makeStatistics(&v11);
  HDStatisticsSleepStages::archive((HDStatisticsSleepStages *)(a1 + 240));
}

void sub_1B7DBC61C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  void *v41;
  void *v42;

  PB::Base::~Base((PB::Base *)&a41);
  statistics::StatisticsBucket::~StatisticsBucket((statistics::StatisticsBucket *)&a10);
  statistics::StatisticsEngine::~StatisticsEngine((statistics::StatisticsEngine *)&a34);

  _Unwind_Resume(a1);
}

void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::decodeInternalsWithDecoder(uint64_t a1, void *a2)
{
  id v3;
  const statistics::Statistics *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  HDStatisticsSleepStages *v24;
  HDStatisticsSleepStages **v25;
  uint64_t v26;
  uint64_t i;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint64_t v48;
  id v49;
  __n128 v50;
  void *v51[2];
  __int128 v52;
  int8x16_t v53;
  uint64_t v54;
  char v55;
  char v56;
  uint64_t v57;
  int8x16_t v58;
  uint64_t v59;
  uint64_t v60[4];
  void *__p[2];
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  _QWORD v77[2];
  __int128 v78;
  __int128 v79;
  int v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  int v85;
  __int128 v86;
  __int128 v87;
  int v88;
  __int128 v89;
  __int128 v90;
  int v91;
  void (**v92)(statistics::StatisticsEngine *__hidden);
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  _BYTE v99[32];
  unint64_t v100;

  v47 = a2;
  *(_BYTE *)(a1 + 640) = objc_msgSend(v47, "decodeBoolForKey:", CFSTR("needs_config"));
  v3 = v47;
  HDStatisticsBucket<HDStatisticsSleepStages>::HDStatisticsBucket((uint64_t)&v50.n128_i64[1], 0, -1.79769313e308, 1.79769313e308);
  *(_OWORD *)v51 = 0u;
  v52 = 0u;
  v100 = 0;
  v49 = objc_retainAutorelease(v3);
  PB::Reader::Reader((PB::Reader *)v99, (const unsigned __int8 *)objc_msgSend(v49, "decodeBytesForKey:returnedLength:", CFSTR("hdsce_archived_representation"), &v100));
  v92 = &off_1E6D09A88;
  v93 = 0;
  v97 = 0;
  v95 = 0;
  v96 = 0;
  v98 = 0;
  statistics::StatisticsEngine::readFrom((statistics::StatisticsEngine *)&v92, (PB::Reader *)v99);
  v48 = a1;
  v5 = (_QWORD *)v93;
  v50.n128_u64[0] = v94;
  if (v93)
  {
    v57 = 0;
    memset(v60, 0, sizeof(v60));
    *(_OWORD *)__p = 0u;
    v62 = 0u;
    v63 = 0u;
    v65 = xmmword_1B7F54B10;
    v64 = 0;
    v66 = 0;
    v67 = xmmword_1B7F54B20;
    v69 = xmmword_1B7F54B30;
    v68 = 0;
    v70 = 0;
    v71 = xmmword_1B7F54B40;
    v73 = xmmword_1B7F54B50;
    v72 = 0;
    v74 = 0;
    v77[1] = 0;
    v77[0] = 0;
    v75 = 0x7FFFFFFFFFFFFFFFLL;
    v76 = v77;
    v78 = 0u;
    v79 = 0u;
    v80 = 1065353216;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0;
    v85 = 1065353216;
    v86 = 0u;
    v87 = 0u;
    v88 = 1065353216;
    v89 = 0u;
    v90 = 0u;
    v91 = 1065353216;
    v53 = vextq_s8(*(int8x16_t *)(v93 + 8), *(int8x16_t *)(v93 + 8), 8uLL);
    v6 = *(_QWORD *)(v93 + 72);
    v54 = *(_QWORD *)(v93 + 64);
    v55 = *(_BYTE *)(v93 + 185);
    v56 = *(_BYTE *)(v93 + 186);
    v58 = vextq_s8(*(int8x16_t *)(v93 + 24), *(int8x16_t *)(v93 + 24), 8uLL);
    v59 = v6;
    v7 = *(_QWORD *)(v93 + 80);
    v8 = *(_QWORD *)(v93 + 88);
    if (v7 != v8)
    {
      v9 = 0;
      do
      {
        v10 = *(_QWORD *)(*(_QWORD *)v7 + 24);
        v11 = *(_QWORD *)(*(_QWORD *)v7 + 32);
        v12 = *(_QWORD *)(*(_QWORD *)v7 + 8);
        v13 = *(_QWORD *)(*(_QWORD *)v7 + 16);
        v14 = *(_BYTE *)(*(_QWORD *)v7 + 41);
        v15 = *(_BYTE *)(*(_QWORD *)v7 + 40);
        if ((unint64_t)v9 >= (unint64_t)v62)
        {
          v16 = (char *)__p[0];
          v17 = 0xAAAAAAAAAAAAAAABLL * ((v9 - (char *)__p[0]) >> 4);
          v18 = v17 + 1;
          if (v17 + 1 > 0x555555555555555)
            std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * ((uint64_t)(v62 - (unint64_t)__p[0]) >> 4) > v18)
            v18 = 0x5555555555555556 * ((uint64_t)(v62 - (unint64_t)__p[0]) >> 4);
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v62 - (unint64_t)__p[0]) >> 4) >= 0x2AAAAAAAAAAAAAALL)
            v19 = 0x555555555555555;
          else
            v19 = v18;
          if (v19)
          {
            v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder>>(v19);
            v9 = (char *)__p[1];
            v16 = (char *)__p[0];
          }
          else
          {
            v4 = 0;
          }
          v20 = v19 + 48 * v17;
          *(_QWORD *)v20 = v11;
          *(_QWORD *)(v20 + 8) = v10;
          *(_QWORD *)(v20 + 16) = v12;
          *(_QWORD *)(v20 + 24) = v13;
          *(_WORD *)(v20 + 32) = 1;
          *(_BYTE *)(v20 + 40) = 0;
          *(_BYTE *)(v20 + 41) = v14;
          *(_BYTE *)(v20 + 42) = v15;
          v21 = (char *)v20;
          if (v9 != v16)
          {
            do
            {
              v22 = *((_OWORD *)v9 - 3);
              v23 = *((_OWORD *)v9 - 2);
              *(_OWORD *)(v21 - 21) = *(_OWORD *)(v9 - 21);
              *((_OWORD *)v21 - 3) = v22;
              *((_OWORD *)v21 - 2) = v23;
              v21 -= 48;
              v9 -= 48;
            }
            while (v9 != v16);
            v16 = (char *)__p[0];
          }
          v9 = (char *)(v20 + 48);
          __p[0] = v21;
          __p[1] = (void *)(v20 + 48);
          *(_QWORD *)&v62 = v19 + 48 * (_QWORD)v4;
          if (v16)
            operator delete(v16);
        }
        else
        {
          *(_QWORD *)v9 = v11;
          *((_QWORD *)v9 + 1) = v10;
          *((_QWORD *)v9 + 2) = v12;
          *((_QWORD *)v9 + 3) = v13;
          *((_WORD *)v9 + 16) = 1;
          v9[40] = 0;
          v9[41] = v14;
          v9[42] = v15;
          v9 += 48;
        }
        __p[1] = v9;
        v7 += 8;
      }
      while (v7 != v8);
    }
    v24 = (HDStatisticsSleepStages *)v5[13];
    if (v24)
      HDStatisticsSleepStages::unarchive(v24, v4);
    v25 = (HDStatisticsSleepStages **)v5[17];
    if (v25 != (HDStatisticsSleepStages **)v5[18])
      HDStatisticsSleepStages::unarchive(*v25, v4);
    v26 = v5[5];
    for (i = v5[6]; v26 != i; v26 += 8)
    {
      v29 = *(double *)(*(_QWORD *)v26 + 8);
      v28 = *(double *)(*(_QWORD *)v26 + 16);
      if (v29 >= v28)
        v30 = *(double *)(*(_QWORD *)v26 + 16);
      else
        v30 = *(double *)(*(_QWORD *)v26 + 8);
      if (v28 < v29)
        v28 = *(double *)(*(_QWORD *)v26 + 8);
      HKIntervalMask<double>::_insertInterval(v60, v30, v28);
    }
    HDStatisticsBucket<HDStatisticsRelative<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>>>::operator=((uint64_t)&v50.n128_i64[1], (uint64_t)&v53);
    HDStatisticsBucket<HDStatisticsRelative<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>>>::~HDStatisticsBucket((uint64_t)&v53);
  }
  v31 = v95;
  v32 = v96;
  if (v95 != v96)
  {
    v33 = (char *)v51[1];
    do
    {
      v34 = *(_QWORD *)(*(_QWORD *)v31 + 24);
      v35 = *(_QWORD *)(*(_QWORD *)v31 + 32);
      v36 = *(_QWORD *)(*(_QWORD *)v31 + 8);
      v37 = *(_QWORD *)(*(_QWORD *)v31 + 16);
      if ((unint64_t)v33 >= (unint64_t)v52)
      {
        v38 = (char *)v51[0];
        v39 = 0xCCCCCCCCCCCCCCCDLL * ((v33 - (char *)v51[0]) >> 3);
        v40 = v39 + 1;
        if (v39 + 1 > 0x666666666666666)
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        if (0x999999999999999ALL * ((uint64_t)(v52 - (unint64_t)v51[0]) >> 3) > v40)
          v40 = 0x999999999999999ALL * ((uint64_t)(v52 - (unint64_t)v51[0]) >> 3);
        if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v52 - (unint64_t)v51[0]) >> 3) >= 0x333333333333333)
          v41 = 0x666666666666666;
        else
          v41 = v40;
        if (v41)
        {
          v41 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawQuantitySample>>(v41);
          v33 = (char *)v51[1];
          v38 = (char *)v51[0];
        }
        else
        {
          v42 = 0;
        }
        v43 = v41 + 40 * v39;
        *(_QWORD *)v43 = v35;
        *(_QWORD *)(v43 + 8) = v34;
        *(_QWORD *)(v43 + 16) = v36;
        *(_QWORD *)(v43 + 24) = v37;
        *(_WORD *)(v43 + 32) = 1;
        v44 = (char *)v43;
        if (v33 != v38)
        {
          do
          {
            v45 = *(_OWORD *)(v33 - 40);
            v46 = *(_OWORD *)(v33 - 24);
            *((_WORD *)v44 - 4) = *((_WORD *)v33 - 4);
            *(_OWORD *)(v44 - 24) = v46;
            *(_OWORD *)(v44 - 40) = v45;
            v44 -= 40;
            v33 -= 40;
          }
          while (v33 != v38);
          v38 = (char *)v51[0];
        }
        v33 = (char *)(v43 + 40);
        v51[0] = v44;
        v51[1] = (void *)(v43 + 40);
        *(_QWORD *)&v52 = v41 + 40 * v42;
        if (v38)
          operator delete(v38);
      }
      else
      {
        *(_QWORD *)v33 = v35;
        *((_QWORD *)v33 + 1) = v34;
        *((_QWORD *)v33 + 2) = v36;
        *((_QWORD *)v33 + 3) = v37;
        *((_WORD *)v33 + 16) = 1;
        v33 += 40;
      }
      v51[1] = v33;
      v31 += 8;
    }
    while (v31 != v32);
  }
  statistics::StatisticsEngine::~StatisticsEngine((statistics::StatisticsEngine *)&v92);

  HDStatisticsCollectionEngine<HDStatisticsRelative<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>>>::operator=((_QWORD *)(v48 + 112), &v50);
  if (v51[0])
  {
    v51[1] = v51[0];
    operator delete(v51[0]);
  }
  HDStatisticsBucket<HDStatisticsRelative<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>>>::~HDStatisticsBucket((uint64_t)&v50.n128_i64[1]);

}

void sub_1B7DBCBF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v8;
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a7);
  std::__hash_table<std::__hash_value_type<long long,NSString * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,NSString * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,NSString * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,NSString * {__strong}>>>::~__hash_table((uint64_t)&STACK[0x400]);
  std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::~__hash_table(a3);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&STACK[0x3B0]);
  v8 = (void *)STACK[0x398];
  if (STACK[0x398])
  {
    STACK[0x3A0] = (unint64_t)v8;
    operator delete(v8);
  }
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table((uint64_t)&STACK[0x370]);
  std::__tree<long>::destroy((_QWORD *)STACK[0x360]);
  v9 = (void *)STACK[0x2A0];
  if (STACK[0x2A0])
  {
    STACK[0x2A8] = (unint64_t)v9;
    operator delete(v9);
  }
  objc_destroyWeak((id *)&STACK[0x298]);
  v10 = (void *)STACK[0x280];
  if (STACK[0x280])
  {
    STACK[0x288] = (unint64_t)v10;
    operator delete(v10);
  }

  statistics::StatisticsEngine::~StatisticsEngine((statistics::StatisticsEngine *)&STACK[0x430]);
  HDStatisticsCollectionEngine<HDStatisticsRelative<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>>>::~HDStatisticsCollectionEngine((uint64_t)va);

  _Unwind_Resume(a1);
}

uint64_t HDStatisticsBucket<HDStatisticsSleepStages>::HDStatisticsBucket(uint64_t a1, void *a2, double a3, double a4)
{
  *(double *)a1 = a3;
  *(double *)(a1 + 8) = a4;
  *(_QWORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 24) = 256;
  *(_DWORD *)(a1 + 28) = 1;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(double *)(a1 + 56) = a3;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  objc_initWeak((id *)(a1 + 88), a2);
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_QWORD *)(a1 + 144) = 0;
  *(_OWORD *)(a1 + 152) = xmmword_1B7F54B10;
  *(_QWORD *)(a1 + 168) = 0;
  *(_OWORD *)(a1 + 176) = xmmword_1B7F54B20;
  *(_QWORD *)(a1 + 192) = 0;
  *(_OWORD *)(a1 + 200) = xmmword_1B7F54B30;
  *(_QWORD *)(a1 + 216) = 0;
  *(_OWORD *)(a1 + 224) = xmmword_1B7F54B40;
  *(_QWORD *)(a1 + 240) = 0;
  *(_OWORD *)(a1 + 248) = xmmword_1B7F54B50;
  *(_QWORD *)(a1 + 264) = 0;
  *(_QWORD *)(a1 + 272) = 0x7FFFFFFFFFFFFFFFLL;
  *(_QWORD *)(a1 + 288) = 0;
  *(_QWORD *)(a1 + 296) = 0;
  *(_QWORD *)(a1 + 280) = a1 + 288;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_DWORD *)(a1 + 336) = 1065353216;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(_OWORD *)(a1 + 376) = 0u;
  *(_QWORD *)(a1 + 392) = 0;
  *(_DWORD *)(a1 + 400) = 1065353216;
  *(_OWORD *)(a1 + 408) = 0u;
  *(_OWORD *)(a1 + 424) = 0u;
  *(_DWORD *)(a1 + 440) = 1065353216;
  *(_OWORD *)(a1 + 448) = 0u;
  *(_OWORD *)(a1 + 464) = 0u;
  *(_DWORD *)(a1 + 480) = 1065353216;
  return a1;
}

uint64_t _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_configureForStartTime(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  id WeakRetained;
  unint64_t v15;
  _BYTE v17[488];
  __n128 v18;
  __int128 __p;
  __int128 v20;
  _BYTE v21[16];
  uint64_t v22;
  char v23;
  char v24;
  int v25;
  id v26;
  char v27[424];
  unint64_t v28;

  v28 = 0;
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dateIntervalContainingDate:index:", v3, &v28);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    v7 = v6;

    objc_msgSend(v4, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
LABEL_5:
    v13 = v9;

    goto LABEL_6;
  }
  v10 = *(id *)(a1 + 64);
  v4 = v10;
  if (v10)
  {
    objc_msgSend(v10, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v7 = v12;

    objc_msgSend(v4, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    goto LABEL_5;
  }
  v7 = -1.79769313e308;
  v13 = 1.79769313e308;
LABEL_6:

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  HDStatisticsBucket<HDStatisticsSleepStages>::HDStatisticsBucket((uint64_t)v21, WeakRetained, v7, v13);

  if (*(_QWORD *)(a1 + 32) == 1)
    v23 = 1;
  v22 = *(_QWORD *)(a1 + 56);
  v24 = *(_BYTE *)(a1 + 24) & 1;
  if (v27 != (char *)(a1 + 72))
    std::vector<HKRawInterval<double>>::__assign_with_size[abi:ne180100]<HKRawInterval<double>*,HKRawInterval<double>*>(v27, *(char **)(a1 + 72), *(_QWORD *)(a1 + 80), (uint64_t)(*(_QWORD *)(a1 + 80) - *(_QWORD *)(a1 + 72)) >> 4);
  objc_storeStrong(&v26, *(id *)(a1 + 656));
  if (!*(_QWORD *)(a1 + 40))
    v25 = 0;
  v15 = v28;
  HDStatisticsBucket<HDStatisticsSleepStages>::HDStatisticsBucket((uint64_t)v17, (uint64_t)v21);
  v18.n128_u64[0] = v15;
  HDStatisticsBucket<HDStatisticsSleepStages>::HDStatisticsBucket((uint64_t)&v18.n128_i64[1], (uint64_t)v17);
  __p = 0u;
  v20 = 0u;
  HDStatisticsCollectionEngine<HDStatisticsRelative<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>>>::operator=((_QWORD *)(a1 + 112), &v18);

  if ((_QWORD)__p)
  {
    *((_QWORD *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  HDStatisticsBucket<HDStatisticsRelative<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>>>::~HDStatisticsBucket((uint64_t)&v18.n128_i64[1]);
  HDStatisticsBucket<HDStatisticsRelative<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>>>::~HDStatisticsBucket((uint64_t)v17);
  *(_BYTE *)(a1 + 640) = 0;
  return HDStatisticsBucket<HDStatisticsRelative<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>>>::~HDStatisticsBucket((uint64_t)v21);
}

void sub_1B7DBD054(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t HDStatisticsBucket<HDStatisticsSleepStages>::HDStatisticsBucket(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t **v28;
  uint64_t **v29;
  uint64_t *v30;
  uint64_t v31;
  _OWORD *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD *v41;
  _QWORD *v42;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(id *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 56);
  v6 = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 56) = v5;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  std::vector<HKRawInterval<double>>::__init_with_size[abi:ne180100]<HKRawInterval<double>*,HKRawInterval<double>*>((_QWORD *)(a1 + 64), *(const void **)(a2 + 64), *(_QWORD *)(a2 + 72), (uint64_t)(*(_QWORD *)(a2 + 72) - *(_QWORD *)(a2 + 64)) >> 4);
  objc_copyWeak((id *)(a1 + 88), (id *)(a2 + 88));
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  v8 = *(_BYTE **)(a2 + 96);
  v7 = *(_BYTE **)(a2 + 104);
  v9 = v7 - v8;
  if (v7 != v8)
  {
    if (0xAAAAAAAAAAAAAAABLL * (v9 >> 4) >= 0x555555555555556)
      std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder>>(0xAAAAAAAAAAAAAAABLL * (v9 >> 4));
    *(_QWORD *)(a1 + 96) = v10;
    *(_QWORD *)(a1 + 104) = v10;
    *(_QWORD *)(a1 + 112) = &v10[48 * v11];
    memmove(v10, v8, v9 - 5);
    *(_QWORD *)(a1 + 104) = &v10[16 * (v9 >> 4)];
  }
  v12 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 120) = v12;
  v13 = *(_OWORD *)(a2 + 152);
  v14 = *(_OWORD *)(a2 + 168);
  v15 = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_OWORD *)(a1 + 184) = v15;
  *(_OWORD *)(a1 + 168) = v14;
  *(_OWORD *)(a1 + 152) = v13;
  v16 = *(_OWORD *)(a2 + 216);
  v17 = *(_OWORD *)(a2 + 232);
  v18 = *(_OWORD *)(a2 + 248);
  *(_OWORD *)(a1 + 264) = *(_OWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 248) = v18;
  *(_OWORD *)(a1 + 232) = v17;
  *(_OWORD *)(a1 + 216) = v16;
  v19 = (_QWORD *)(a1 + 288);
  *(_QWORD *)(a1 + 288) = 0;
  *(_QWORD *)(a1 + 296) = 0;
  *(_QWORD *)(a1 + 280) = a1 + 288;
  v20 = *(_QWORD **)(a2 + 280);
  if (v20 != (_QWORD *)(a2 + 288))
  {
    v21 = 0;
    v22 = (_QWORD *)(a1 + 288);
    while (1)
    {
      v23 = v20[4];
      v24 = (_QWORD *)(a1 + 288);
      if (v22 == v19)
        goto LABEL_12;
      v25 = v21;
      v26 = (_QWORD *)(a1 + 288);
      if (v21)
      {
        do
        {
          v24 = v25;
          v25 = (_QWORD *)v25[1];
        }
        while (v25);
      }
      else
      {
        do
        {
          v24 = (_QWORD *)v26[2];
          v27 = *v24 == (_QWORD)v26;
          v26 = v24;
        }
        while (v27);
      }
      if (v24[4] < v23)
      {
LABEL_12:
        if (v21)
          v28 = (uint64_t **)v24;
        else
          v28 = (uint64_t **)(a1 + 288);
        if (v21)
          v29 = (uint64_t **)(v24 + 1);
        else
          v29 = (uint64_t **)(a1 + 288);
        if (!*v29)
        {
LABEL_28:
          v32 = operator new(0xC8uLL);
          v33 = *((_OWORD *)v20 + 2);
          v34 = *((_OWORD *)v20 + 4);
          v32[3] = *((_OWORD *)v20 + 3);
          v32[4] = v34;
          v32[2] = v33;
          v35 = *((_OWORD *)v20 + 5);
          v36 = *((_OWORD *)v20 + 6);
          v37 = *((_OWORD *)v20 + 8);
          v32[7] = *((_OWORD *)v20 + 7);
          v32[8] = v37;
          v32[5] = v35;
          v32[6] = v36;
          v38 = *((_OWORD *)v20 + 9);
          v39 = *((_OWORD *)v20 + 10);
          v40 = *((_OWORD *)v20 + 11);
          *((_QWORD *)v32 + 24) = v20[24];
          v32[10] = v39;
          v32[11] = v40;
          v32[9] = v38;
          std::__tree<unsigned long long>::__insert_node_at((uint64_t **)(a1 + 280), (uint64_t)v28, v29, (uint64_t *)v32);
        }
      }
      else
      {
        v29 = (uint64_t **)(a1 + 288);
        v28 = (uint64_t **)(a1 + 288);
        if (!v21)
          goto LABEL_28;
        v30 = v21;
        while (1)
        {
          while (1)
          {
            v28 = (uint64_t **)v30;
            v31 = v30[4];
            if (v31 <= v23)
              break;
            v30 = *v28;
            v29 = v28;
            if (!*v28)
              goto LABEL_28;
          }
          if (v31 >= v23)
            break;
          v30 = v28[1];
          if (!v30)
          {
            v29 = v28 + 1;
            goto LABEL_28;
          }
        }
      }
      v41 = (_QWORD *)v20[1];
      if (v41)
      {
        do
        {
          v42 = v41;
          v41 = (_QWORD *)*v41;
        }
        while (v41);
      }
      else
      {
        do
        {
          v42 = (_QWORD *)v20[2];
          v27 = *v42 == (_QWORD)v20;
          v20 = v42;
        }
        while (!v27);
      }
      if (v42 == (_QWORD *)(a2 + 288))
        break;
      v21 = (_QWORD *)*v19;
      v22 = *(_QWORD **)(a1 + 280);
      v20 = v42;
    }
  }
  std::unordered_set<long long>::unordered_set(a1 + 304, a2 + 304);
  *(_QWORD *)(a1 + 344) = 0;
  *(_QWORD *)(a1 + 352) = 0;
  *(_QWORD *)(a1 + 360) = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>((_QWORD *)(a1 + 344), *(const void **)(a2 + 344), *(_QWORD *)(a2 + 352), (uint64_t)(*(_QWORD *)(a2 + 352) - *(_QWORD *)(a2 + 344)) >> 3);
  std::unordered_map<long long,long long>::unordered_map(a1 + 368, a2 + 368);
  std::unordered_map<NSString * {__strong},long long,HDStringHash,HDStringEqual,std::allocator<std::pair<NSString * const {__strong},long long>>>::unordered_map(a1 + 408, a2 + 408);
  std::unordered_map<long long,NSString * {__strong}>::unordered_map(a1 + 448, a2 + 448);
  return a1;
}

void sub_1B7DBD3EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, id *location, void **a12)
{
  uint64_t v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD **v17;
  void *v19;
  void *v20;
  void *v21;

  std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::~__hash_table(v16);
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table(v15);
  v19 = *v14;
  if (*v14)
  {
    *(_QWORD *)(v12 + 352) = v19;
    operator delete(v19);
  }
  std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::~__hash_table(v13);
  std::__tree<long>::destroy(*v17);
  v20 = *a10;
  if (*a10)
  {
    *(_QWORD *)(v12 + 104) = v20;
    operator delete(v20);
  }
  objc_destroyWeak(location);
  v21 = *a12;
  if (*a12)
  {
    *(_QWORD *)(v12 + 72) = v21;
    operator delete(v21);
  }

  _Unwind_Resume(a1);
}

id _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_statisticsFromFinishedBucket(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double v5;
  id v6;
  double *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id WeakRetained;
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t *v40;
  uint64_t *v41;
  id *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  _QWORD *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint8x8_t v53;
  unint64_t v54;
  void **v55;
  char *v56;
  unint64_t v57;
  id v58;
  id v59;
  void *v60;
  char v61;
  float v62;
  _BOOL8 v63;
  unint64_t v64;
  unint64_t v65;
  int8x8_t prime;
  void *v67;
  void *v68;
  uint64_t v69;
  _QWORD **v70;
  unint64_t v71;
  uint8x8_t v72;
  unint64_t v73;
  uint8x8_t v74;
  uint64_t v75;
  _QWORD *j;
  unint64_t v77;
  _QWORD *v78;
  _QWORD *v79;
  unint64_t v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD *v88;
  _QWORD *v89;
  BOOL v90;
  void *v91;
  uint64_t **i;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  void *v102;
  void *v103;
  _QWORD *v104;
  uint64_t v105;
  id v107;
  unint64_t v108;
  id v109;
  id v110;
  id v111;
  id v112;
  uint64_t v113;
  void *__p[2];
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _QWORD v124[3];
  _QWORD *v125;
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v5 = *(double *)a2;
  v6 = objc_alloc(MEMORY[0x1E0C99D68]);
  v7 = (double *)(a2 + 40);
  if (v5 != -1.79769313e308)
    v7 = (double *)a2;
  v110 = (id)objc_msgSend(v6, "initWithTimeIntervalSinceReferenceDate:", *v7);
  v113 = a2;
  if (*(double *)(a2 + 8) == 1.79769313e308)
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", *(double *)(a2 + 48));
  else
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", *(double *)(a2 + 8));
  v9 = (void *)v8;
  v10 = *(id *)(a1 + 16);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = *(id *)(a1 + 16);
    if (objc_msgSend(v11, "shouldUseUnderlyingTypeForStatistics"))
    {
      objc_msgSend(v11, "underlyingSampleType");
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v12;
    }

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6C68]), "initWithDataType:startDate:endDate:", v10, v110, v9);
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    v2 = a1 + 48;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

    if (WeakRetained)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = *(uint64_t **)(a2 + 344);
      v17 = *(uint64_t **)(a2 + 352);
      while (v16 != v17)
      {
        v18 = *v16;
        v19 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v19, "sourceForSourceID:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          if ((objc_msgSend(v15, "containsObject:", v20) & 1) == 0)
            objc_msgSend(v15, "addObject:", v20);
        }

        ++v16;
      }
      v2 = objc_msgSend(v15, "copy");
      objc_msgSend(v13, "_setSources:", v2);

    }
  }

  v124[0] = &off_1E6D098F0;
  v125 = v124;
  v111 = v13;
  v21 = *(_OWORD *)(v113 + 232);
  v120 = *(_OWORD *)(v113 + 216);
  v121 = v21;
  v22 = *(_OWORD *)(v113 + 264);
  v122 = *(_OWORD *)(v113 + 248);
  v123 = v22;
  v23 = *(_OWORD *)(v113 + 168);
  v116 = *(_OWORD *)(v113 + 152);
  v117 = v23;
  v24 = *(_OWORD *)(v113 + 200);
  v118 = *(_OWORD *)(v113 + 184);
  v119 = v24;
  v25 = *(_OWORD *)(v113 + 136);
  *(_OWORD *)__p = *(_OWORD *)(v113 + 120);
  v115 = v25;
  if (!v125)
    std::__throw_bad_function_call[abi:ne180100]();
  v26 = (*(uint64_t (**)(_QWORD *, void **))(*v125 + 48))(v125, __p);
  v27 = 0;
  v28 = 0.0;
  v29 = 0x7FFFFFFFFFFFFFFFLL;
  v30 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v31 = v26 + v27;
    v32 = *(double *)(v26 + v27 + 24);
    if (v32 > 2.22507386e-308 && v32 >= v28)
    {
      if (v32 <= v28)
      {
        if (*(_QWORD *)(v26 + v27 + 32) < v29)
        {
          v30 = *(_QWORD *)(v31 + 16);
          v28 = *(double *)(v26 + v27 + 24);
          v29 = *(_QWORD *)(v26 + v27 + 32);
        }
      }
      else
      {
        v30 = *(_QWORD *)(v31 + 16);
        v29 = *(_QWORD *)(v26 + v27 + 32);
        v28 = *(double *)(v26 + v27 + 24);
      }
    }
    v27 += 24;
  }
  while (v27 != 144);
  if (v30 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v28);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "setCategoryValue:", v34);

  }
  v35 = *(_OWORD *)(v113 + 232);
  v120 = *(_OWORD *)(v113 + 216);
  v121 = v35;
  v36 = *(_OWORD *)(v113 + 264);
  v122 = *(_OWORD *)(v113 + 248);
  v123 = v36;
  v37 = *(_OWORD *)(v113 + 168);
  v116 = *(_OWORD *)(v113 + 152);
  v117 = v37;
  v38 = *(_OWORD *)(v113 + 200);
  v118 = *(_OWORD *)(v113 + 184);
  v119 = v38;
  v39 = *(_OWORD *)(v113 + 136);
  *(_OWORD *)__p = *(_OWORD *)(v113 + 120);
  v115 = v39;
  if (!v125)
    std::__throw_bad_function_call[abi:ne180100]();
  objc_msgSend(v111, "setDataCount:", *(_QWORD *)(*(uint64_t (**)(_QWORD *, void **))(*v125 + 48))(v125, __p));
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    v112 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v40 = *(uint64_t **)(v113 + 344);
    v41 = *(uint64_t **)(v113 + 352);
    if (v40 != v41)
    {
      v42 = (id *)(a1 + 48);
      do
      {
        v43 = *v40;
        v44 = objc_loadWeakRetained(v42);
        objc_msgSend(v44, "sourceForSourceID:", v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45 && (objc_msgSend(v112, "containsObject:", v45) & 1) == 0)
          objc_msgSend(v112, "addObject:", v45);

        ++v40;
      }
      while (v40 != v41);
    }
    v46 = (void *)objc_msgSend(v112, "copy");
    objc_msgSend(v111, "_setSources:", v46);

    v107 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v109 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    *(_OWORD *)__p = 0u;
    v115 = 0u;
    LODWORD(v116) = 1065353216;
    v47 = *(_QWORD **)(v113 + 280);
    if (v47 != (_QWORD *)(v113 + 288))
    {
      while (1)
      {
        HDStatisticsBucket<HDStatisticsSleepStages>::_bundleIdentifierForSourceID(v113, v47[4]);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if (!v48)
          goto LABEL_117;
        v50 = objc_msgSend(v48, "hash");
        v51 = v50;
        v52 = (unint64_t)__p[1];
        if (!__p[1])
          break;
        v53 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
        v53.i16[0] = vaddlv_u8(v53);
        v54 = v53.u32[0];
        if (v53.u32[0] > 1uLL)
        {
          v2 = v50;
          if ((void *)v50 >= __p[1])
            v2 = v50 % (unint64_t)__p[1];
        }
        else
        {
          v2 = ((unint64_t)__p[1] - 1) & v50;
        }
        v55 = (void **)*((_QWORD *)__p[0] + v2);
        if (!v55)
          break;
        v56 = (char *)*v55;
        if (!*v55)
          break;
        v108 = (unint64_t)__p[1] - 1;
        while (1)
        {
          v57 = *((_QWORD *)v56 + 1);
          if (v57 == v51)
            break;
          if (v54 > 1)
          {
            if (v57 >= v52)
              v57 %= v52;
          }
          else
          {
            v57 &= v108;
          }
          if (v57 != v2)
            goto LABEL_60;
LABEL_59:
          v56 = *(char **)v56;
          if (!v56)
            goto LABEL_60;
        }
        v58 = *((id *)v56 + 2);
        v59 = v49;
        v60 = v59;
        if (v58 != v59)
        {
          v61 = objc_msgSend(v58, "isEqualToString:", v59);

          if ((v61 & 1) != 0)
            goto LABEL_116;
          goto LABEL_59;
        }

LABEL_116:
        v81 = *(_OWORD *)(v47 + 5);
        *(_OWORD *)(v56 + 40) = *(_OWORD *)(v47 + 7);
        *(_OWORD *)(v56 + 24) = v81;
        v82 = *(_OWORD *)(v47 + 9);
        v83 = *(_OWORD *)(v47 + 11);
        v84 = *(_OWORD *)(v47 + 13);
        *(_OWORD *)(v56 + 104) = *(_OWORD *)(v47 + 15);
        *(_OWORD *)(v56 + 88) = v84;
        *(_OWORD *)(v56 + 72) = v83;
        *(_OWORD *)(v56 + 56) = v82;
        v85 = *(_OWORD *)(v47 + 17);
        v86 = *(_OWORD *)(v47 + 19);
        v87 = *(_OWORD *)(v47 + 21);
        *(_OWORD *)(v56 + 168) = *(_OWORD *)(v47 + 23);
        *(_OWORD *)(v56 + 152) = v87;
        *(_OWORD *)(v56 + 136) = v86;
        *(_OWORD *)(v56 + 120) = v85;

LABEL_117:
        v88 = (_QWORD *)v47[1];
        if (v88)
        {
          do
          {
            v89 = v88;
            v88 = (_QWORD *)*v88;
          }
          while (v88);
        }
        else
        {
          do
          {
            v89 = (_QWORD *)v47[2];
            v90 = *v89 == (_QWORD)v47;
            v47 = v89;
          }
          while (!v90);
        }
        v47 = v89;
        if (v89 == (_QWORD *)(v113 + 288))
        {
          for (i = (uint64_t **)v115; i; i = (uint64_t **)*i)
          {
            v93 = i[2];
            if (!v125)
              goto LABEL_157;
            v94 = (*(uint64_t (**)(_QWORD *, uint64_t *))(*v125 + 48))(v125, (uint64_t *)i + 3);
            v95 = 0;
            v96 = 0.0;
            v97 = 0x7FFFFFFFFFFFFFFFLL;
            v98 = 0x7FFFFFFFFFFFFFFFLL;
            do
            {
              v99 = v94 + v95;
              v100 = *(double *)(v94 + v95 + 24);
              if (v100 > 2.22507386e-308 && v100 >= v96)
              {
                if (v100 <= v96)
                {
                  if (*(_QWORD *)(v94 + v95 + 32) < v97)
                  {
                    v98 = *(_QWORD *)(v99 + 16);
                    v96 = *(double *)(v94 + v95 + 24);
                    v97 = *(_QWORD *)(v94 + v95 + 32);
                  }
                }
                else
                {
                  v98 = *(_QWORD *)(v99 + 16);
                  v97 = *(_QWORD *)(v94 + v95 + 32);
                  v96 = *(double *)(v94 + v95 + 24);
                }
              }
              v95 += 24;
            }
            while (v95 != 144);
            if (v98 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v96);
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "setObject:forKeyedSubscript:", v102, v93);

            }
            if (!v125)
LABEL_157:
              std::__throw_bad_function_call[abi:ne180100]();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t *))(*v125 + 48))(v125, (uint64_t *)i + 3));
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "setObject:forKeyedSubscript:", v103, v93);

          }
          goto LABEL_150;
        }
      }
LABEL_60:
      v56 = (char *)operator new(0xB8uLL);
      *(_QWORD *)v56 = 0;
      *((_QWORD *)v56 + 1) = v51;
      *((_QWORD *)v56 + 2) = v49;
      *(_OWORD *)(v56 + 24) = 0u;
      *(_OWORD *)(v56 + 40) = 0u;
      *(_OWORD *)(v56 + 56) = xmmword_1B7F54B10;
      *((_QWORD *)v56 + 9) = 0;
      *((_OWORD *)v56 + 5) = xmmword_1B7F54B20;
      *((_QWORD *)v56 + 12) = 0;
      *(_OWORD *)(v56 + 104) = xmmword_1B7F54B30;
      *((_QWORD *)v56 + 15) = 0;
      *((_OWORD *)v56 + 8) = xmmword_1B7F54B40;
      *((_QWORD *)v56 + 18) = 0;
      *(_OWORD *)(v56 + 152) = xmmword_1B7F54B50;
      *((_QWORD *)v56 + 21) = 0;
      *((_QWORD *)v56 + 22) = 0x7FFFFFFFFFFFFFFFLL;
      v62 = (float)(unint64_t)(*((_QWORD *)&v115 + 1) + 1);
      if (!v52 || (float)(*(float *)&v116 * (float)v52) < v62)
      {
        v63 = (v52 & (v52 - 1)) != 0;
        if (v52 < 3)
          v63 = 1;
        v64 = v63 | (2 * v52);
        v65 = vcvtps_u32_f32(v62 / *(float *)&v116);
        if (v64 <= v65)
          prime = (int8x8_t)v65;
        else
          prime = (int8x8_t)v64;
        if (*(_QWORD *)&prime == 1)
        {
          prime = (int8x8_t)2;
        }
        else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
        {
          prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
        }
        v52 = (unint64_t)__p[1];
        if ((void *)*(_QWORD *)&prime <= __p[1])
        {
          if ((void *)*(_QWORD *)&prime < __p[1])
          {
            v73 = vcvtps_u32_f32((float)*((unint64_t *)&v115 + 1) / *(float *)&v116);
            if (__p[1] < (void *)3
              || (v74 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]), v74.i16[0] = vaddlv_u8(v74), v74.u32[0] > 1uLL))
            {
              v73 = std::__next_prime(v73);
            }
            else
            {
              v75 = 1 << -(char)__clz(v73 - 1);
              if (v73 >= 2)
                v73 = v75;
            }
            if (*(_QWORD *)&prime <= v73)
              prime = (int8x8_t)v73;
            if (*(_QWORD *)&prime >= v52)
            {
              v52 = (unint64_t)__p[1];
            }
            else
            {
              if (prime)
                goto LABEL_72;
              v91 = __p[0];
              __p[0] = 0;
              if (v91)
                operator delete(v91);
              v52 = 0;
              __p[1] = 0;
            }
          }
        }
        else
        {
LABEL_72:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v67 = operator new(8 * *(_QWORD *)&prime);
          v68 = __p[0];
          __p[0] = v67;
          if (v68)
            operator delete(v68);
          v69 = 0;
          __p[1] = (void *)prime;
          do
            *((_QWORD *)__p[0] + v69++) = 0;
          while (*(_QWORD *)&prime != v69);
          v70 = (_QWORD **)v115;
          if ((_QWORD)v115)
          {
            v71 = *(_QWORD *)(v115 + 8);
            v72 = (uint8x8_t)vcnt_s8(prime);
            v72.i16[0] = vaddlv_u8(v72);
            if (v72.u32[0] > 1uLL)
            {
              if (v71 >= *(_QWORD *)&prime)
                v71 %= *(_QWORD *)&prime;
            }
            else
            {
              v71 &= *(_QWORD *)&prime - 1;
            }
            *((_QWORD *)__p[0] + v71) = &v115;
            for (j = *v70; j; v71 = v77)
            {
              v77 = j[1];
              if (v72.u32[0] > 1uLL)
              {
                if (v77 >= *(_QWORD *)&prime)
                  v77 %= *(_QWORD *)&prime;
              }
              else
              {
                v77 &= *(_QWORD *)&prime - 1;
              }
              if (v77 != v71)
              {
                if (!*((_QWORD *)__p[0] + v77))
                {
                  *((_QWORD *)__p[0] + v77) = v70;
                  goto LABEL_97;
                }
                *v70 = (_QWORD *)*j;
                *j = **((_QWORD **)__p[0] + v77);
                **((_QWORD **)__p[0] + v77) = j;
                j = v70;
              }
              v77 = v71;
LABEL_97:
              v70 = (_QWORD **)j;
              j = (_QWORD *)*j;
            }
          }
          v52 = (unint64_t)prime;
        }
        if ((v52 & (v52 - 1)) != 0)
        {
          if (v51 >= v52)
            v2 = v51 % v52;
          else
            v2 = v51;
        }
        else
        {
          v2 = (v52 - 1) & v51;
        }
      }
      v78 = __p[0];
      v79 = (_QWORD *)*((_QWORD *)__p[0] + v2);
      if (v79)
      {
        *(_QWORD *)v56 = *v79;
      }
      else
      {
        *(_QWORD *)v56 = v115;
        *(_QWORD *)&v115 = v56;
        v78[v2] = &v115;
        if (!*(_QWORD *)v56)
        {
LABEL_115:
          ++*((_QWORD *)&v115 + 1);
          goto LABEL_116;
        }
        v80 = *(_QWORD *)(*(_QWORD *)v56 + 8);
        if ((v52 & (v52 - 1)) != 0)
        {
          if (v80 >= v52)
            v80 %= v52;
        }
        else
        {
          v80 &= v52 - 1;
        }
        v79 = (char *)__p[0] + 8 * v80;
      }
      *v79 = v56;
      goto LABEL_115;
    }
LABEL_150:
    std::__hash_table<std::__hash_value_type<NSString * {__strong},HDStatisticsRelative<HDStatisticsDiscrete>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},HDStatisticsRelative<HDStatisticsDiscrete>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},HDStatisticsRelative<HDStatisticsDiscrete>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},HDStatisticsRelative<HDStatisticsDiscrete>>>>::~__hash_table((uint64_t)__p);
    objc_msgSend(v111, "setCategoryValueBySource:", v107);
    objc_msgSend(v111, "setDataCountBySource:", v109);

  }
  v104 = v125;
  if (v125 == v124)
  {
    v105 = 4;
    v104 = v124;
    goto LABEL_155;
  }
  if (v125)
  {
    v105 = 5;
LABEL_155:
    (*(void (**)(void))(*v104 + 8 * v105))();
  }
  return v111;
}

void sub_1B7DBDFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  _Unwind_Resume(a1);
}

void HDStatisticsBucket<HDStatisticsSleepStages>::_updateSourceOrder(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  void **v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  id *v18;
  id WeakRetained;
  id v20;

  v1 = *(_QWORD *)(a1 + 328);
  v2 = *(_QWORD *)(a1 + 344);
  if (v1 != (*(_QWORD *)(a1 + 352) - v2) >> 3)
  {
    v4 = (void **)(a1 + 344);
    *(_QWORD *)(a1 + 352) = v2;
    std::vector<long long>::reserve((void **)(a1 + 344), v1);
    v5 = *(_QWORD **)(a1 + 320);
    if (v5)
    {
      v6 = *(char **)(a1 + 352);
      do
      {
        v7 = v5[2];
        v8 = *(_QWORD *)(a1 + 360);
        if ((unint64_t)v6 >= v8)
        {
          v10 = (char *)*v4;
          v11 = (v6 - (_BYTE *)*v4) >> 3;
          v12 = v11 + 1;
          if ((unint64_t)(v11 + 1) >> 61)
            std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
          v13 = v8 - (_QWORD)v10;
          if (v13 >> 2 > v12)
            v12 = v13 >> 2;
          if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
            v14 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v14 = v12;
          if (v14)
          {
            v14 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v14);
            v10 = *(char **)(a1 + 344);
            v6 = *(char **)(a1 + 352);
          }
          else
          {
            v15 = 0;
          }
          v16 = (_QWORD *)(v14 + 8 * v11);
          *v16 = v7;
          v9 = (char *)(v16 + 1);
          while (v6 != v10)
          {
            v17 = *((_QWORD *)v6 - 1);
            v6 -= 8;
            *--v16 = v17;
          }
          *(_QWORD *)(a1 + 344) = v16;
          *(_QWORD *)(a1 + 352) = v9;
          *(_QWORD *)(a1 + 360) = v14 + 8 * v15;
          if (v10)
            operator delete(v10);
        }
        else
        {
          *(_QWORD *)v6 = v7;
          v9 = v6 + 8;
        }
        *(_QWORD *)(a1 + 352) = v9;
        v5 = (_QWORD *)*v5;
        v6 = v9;
      }
      while (v5);
    }
    v18 = (id *)(a1 + 88);
    WeakRetained = objc_loadWeakRetained(v18);

    if (WeakRetained)
    {
      v20 = objc_loadWeakRetained(v18);
      objc_msgSend(v20, "orderSourceIDs:", v4);

    }
  }
}

void sub_1B7DBE2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void HDStatisticsBucket<HDStatisticsSleepStages>::_mergeThroughTime(uint64_t a1, double a2)
{
  double v4;
  double v5;
  uint64_t v6;
  __int128 *v7;
  unint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  __int128 v34;
  __int128 v35;
  id WeakRetained;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  unint64_t v42;
  char v43;
  __int128 *v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  char v50;
  double v51;
  int v52;
  int v53;
  unint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __int128 *v60;
  unint64_t v61;
  __int128 v62;
  __int128 v63;
  _OWORD *v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  __int128 *v78;
  __int128 v79;
  __int128 v80;
  char *v81;
  char *v82;
  __int128 *v83;
  __int128 v84;
  __int128 v85;
  char *v86;
  void *v87;
  unint64_t v88;
  uint64_t **v89;
  uint64_t **v90;
  double v91;
  uint64_t *v92;
  uint64_t *v93;
  uint64_t **v94;
  BOOL v95;
  unint64_t v96;
  char *v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;
  __int128 v105;
  __int128 v106;
  _QWORD *v107;
  _QWORD *v108;
  _QWORD *v109;
  BOOL v110;
  int v111;
  int v112;
  uint64_t *v113;
  int v114;
  uint64_t v115;
  BOOL v116;
  BOOL v117;
  BOOL v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  double v125;
  unint64_t v126;
  uint64_t **v127;
  uint64_t **v128;
  double v129;
  uint64_t *v130;
  uint64_t *v131;
  uint64_t **v132;
  __int128 v133;
  char *v134;
  double v135;
  void *v136;
  void *v137;
  _QWORD *v138;
  id *location;
  __int128 *v140;
  id v141;
  uint64_t v142;
  double **v143;
  char v144;
  char v145;
  uint64_t v146;
  _QWORD *v147;
  uint64_t v148;
  __int128 v149;
  __int128 v150;
  uint64_t v151;
  __int128 v152;
  __int128 v153;
  __int16 v154;

  v4 = *(double *)(a1 + 16);
  if (v4 > 0.0 && *(double *)(a1 + 8) > a2)
    a2 = v4 * floor(a2 / v4);
  v5 = *(double *)(a1 + 56);
  if (v5 < a2)
  {
    v147 = (_QWORD *)(a1 + 96);
    v143 = (double **)(a1 + 64);
    location = (id *)(a1 + 88);
    v138 = (_QWORD *)(a1 + 288);
    while (1)
    {
      v6 = *(_QWORD *)(a1 + 96);
      v7 = *(__int128 **)(a1 + 104);
      v8 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - v6) >> 4);
      if (v8)
        break;
LABEL_147:
      *(double *)(a1 + 56) = a2;
LABEL_148:
      v135 = *(double *)(a1 + 56);
      if (v135 == v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void HDStatisticsBucket<HDStatisticsSleepStages>::_mergeThroughTime(double) [Statistics = HDStatisticsSleepStages]");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "handleFailureInFunction:file:lineNumber:description:", v137, CFSTR("HDStatisticsBucket.hpp"), 234, CFSTR("Failed to make forward progress during statistics merge."));

        v135 = *(double *)(a1 + 56);
      }
      v5 = v135;
      if (v135 >= a2)
        return;
    }
    if (v8 != 1)
    {
      v17 = a2;
      v18 = a2;
      v19 = v5;
      v20 = *(_QWORD *)(a1 + 96);
      if ((__int128 *)v6 != v7)
      {
        do
        {
          v21 = *(double *)(v20 + 8);
          v22 = *(double *)(v20 + 16);
          if (v21 > v19 && v21 < v18)
            v18 = *(double *)(v20 + 8);
          if (v22 > v5)
            v24 = *(double *)(v20 + 16);
          else
            v24 = v17;
          if (v22 < v17)
          {
            v19 = v5;
            v17 = v24;
          }
          v20 += 48;
        }
        while ((__int128 *)v20 != v7);
      }
      if (v17 >= v18)
        v25 = v18;
      else
        v25 = v17;
      v26 = *(double *)(a1 + 16);
      if (v26 > 0.0)
      {
        v27 = v26 * floor(v25 / v26);
        v28 = v26 * floor((v26 + v5) / v26);
        if (v27 >= v28)
          v25 = v27;
        else
          v25 = v28;
      }
      *v147 = 0;
      v147[1] = 0;
      v147[2] = 0;
      v140 = (__int128 *)v6;
      if ((__int128 *)v6 != v7)
      {
        if (v8 > 0x555555555555555)
          std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
        v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder>>(0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - v6) >> 4));
        v32 = *(char **)(a1 + 96);
        v31 = *(char **)(a1 + 104);
        v33 = v29;
        if (v31 != v32)
        {
          do
          {
            v34 = *((_OWORD *)v31 - 3);
            v35 = *((_OWORD *)v31 - 2);
            *(_OWORD *)(v33 - 21) = *(_OWORD *)(v31 - 21);
            *((_OWORD *)v33 - 3) = v34;
            *((_OWORD *)v33 - 2) = v35;
            v33 -= 48;
            v31 -= 48;
          }
          while (v31 != v32);
          v31 = (char *)*v147;
        }
        *(_QWORD *)(a1 + 96) = v33;
        *(_QWORD *)(a1 + 104) = v29;
        *(_QWORD *)(a1 + 112) = &v29[48 * v30];
        if (v31)
          operator delete(v31);
      }
      HDStatisticsBucket<HDStatisticsSleepStages>::_updateSourceOrder(a1);
      WeakRetained = objc_loadWeakRetained(location);

      if (WeakRetained)
      {
        *(_QWORD *)&v149 = a1;
        v37 = 126 - 2 * __clz(v8);
        v38 = (uint64_t)v140;
        if (v140 == v7)
          v39 = 0;
        else
          v39 = v37;
        std::__introsort<std::_ClassicAlgPolicy,HDStatisticsBucket<HDStatisticsSleepStages>::_mergeTowardTime(double)::{lambda(HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder const&,HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder const&)#1} &,HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder*,false>((uint64_t)v140, v7, (uint64_t)&v149, v39, 1);
      }
      else
      {
        v42 = 126 - 2 * __clz(v8);
        v38 = (uint64_t)v140;
        if (v140 == v7)
          v39 = 0;
        else
          v39 = v42;
      }
      std::__introsort<std::_ClassicAlgPolicy,HDStatisticsBucket<HDStatisticsSleepStages>::_mergeTowardTime(double)::{lambda(HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder const&,HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder const&)#2} &,HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder*,false>(v38, v7, v39, 1);
      if (*(_BYTE *)(a1 + 25))
        v141 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      else
        v141 = 0;
      if (v140 == v7)
      {
LABEL_121:
        v107 = *(_QWORD **)(a1 + 280);
        if (v107 != v138)
        {
          do
          {
            v108 = (_QWORD *)v107[1];
            if (v108)
            {
              do
              {
                v109 = v108;
                v108 = (_QWORD *)*v108;
              }
              while (v108);
            }
            else
            {
              do
              {
                v109 = (_QWORD *)v107[2];
                v110 = *v109 == (_QWORD)v107;
                v107 = v109;
              }
              while (!v110);
            }
            v107 = v109;
          }
          while (v109 != v138);
        }
        *(double *)(a1 + 56) = v25;

        if (v140)
          operator delete(v140);
        goto LABEL_148;
      }
      v142 = 0;
      v43 = 0;
      v44 = v140;
      while (2)
      {
        v45 = v44[1];
        v149 = *v44;
        v150 = v45;
        v151 = *((_QWORD *)v44 + 4);
        v46 = v149;
        v47 = v45;
        if (*(double *)&v45 - *((double *)&v149 + 1) - (v25 - *((double *)&v149 + 1)) >= 0.01)
        {
          if (v25 - *((double *)&v149 + 1) < 0.01)
          {
            LOBYTE(v151) = 0;
            goto LABEL_66;
          }
          v48 = *((_QWORD *)&v150 + 1);
          v50 = BYTE1(v151);
          *(double *)&v150 = v25;
          v51 = v25;
          v49 = v151;
          if ((_BYTE)v151)
            goto LABEL_57;
LABEL_66:
          v60 = *(__int128 **)(a1 + 104);
          v61 = *(_QWORD *)(a1 + 112);
          if ((unint64_t)v60 < v61)
          {
            v62 = *v44;
            v63 = v44[2];
            v60[1] = v44[1];
            v60[2] = v63;
            *v60 = v62;
            v64 = v60 + 3;
            goto LABEL_119;
          }
          v65 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v60 - *v147) >> 4);
          v66 = v65 + 1;
          if (v65 + 1 > 0x555555555555555)
            std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
          v67 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v61 - *v147) >> 4);
          if (2 * v67 > v66)
            v66 = 2 * v67;
          if (v67 >= 0x2AAAAAAAAAAAAAALL)
            v68 = 0x555555555555555;
          else
            v68 = v66;
          if (v68)
            v68 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder>>(v68);
          else
            v69 = 0;
          v78 = (__int128 *)(v68 + 48 * v65);
          v79 = *v44;
          v80 = v44[2];
          v78[1] = v44[1];
          v78[2] = v80;
          *v78 = v79;
          v82 = *(char **)(a1 + 96);
          v81 = *(char **)(a1 + 104);
          v83 = v78;
          if (v81 != v82)
          {
            do
            {
              v84 = *((_OWORD *)v81 - 3);
              v85 = *((_OWORD *)v81 - 2);
              *(__int128 *)((char *)v83 - 21) = *(_OWORD *)(v81 - 21);
              *(v83 - 3) = v84;
              *(v83 - 2) = v85;
              v83 -= 3;
              v81 -= 48;
            }
            while (v81 != v82);
            v81 = (char *)*v147;
          }
          v64 = v78 + 3;
          *(_QWORD *)(a1 + 96) = v83;
          *(_QWORD *)(a1 + 104) = v78 + 3;
          *(_QWORD *)(a1 + 112) = v68 + 48 * v69;
          if (v81)
          {
            v86 = v81;
            goto LABEL_118;
          }
LABEL_119:
          *(_QWORD *)(a1 + 104) = v64;
        }
        else
        {
          v48 = 0;
          v49 = 0;
          v50 = 0;
          v51 = 0.0;
          v47 = 0;
          if (!(_BYTE)v151)
            goto LABEL_66;
LABEL_57:
          v145 = v50;
          v146 = v48;
          HDRawQuantitySample::applyMask((uint64_t)&v149, v143);
          v52 = *((unsigned __int8 *)v44 + 42);
          v53 = *((unsigned __int8 *)v44 + 41);
          v144 = *((_BYTE *)v44 + 40);
          if ((_BYTE)v151)
          {
            if ((v43 & 1) != 0)
            {
              v54 = *((_QWORD *)&v150 + 1);
              if (v142 == *((_QWORD *)&v150 + 1) || *(_BYTE *)(a1 + 24))
              {
                if (!*((_BYTE *)v44 + 42))
                  ++*(_QWORD *)(a1 + 120);
                v55 = a1 + 24 * (uint64_t)*(double *)&v149;
                v56 = *(double *)(v55 + 144);
                v57 = *(_QWORD *)(v55 + 152);
                v58 = *(_QWORD *)(a1 + 128);
                if (v58 < v57)
                {
                  v57 = v58 + 1;
                  *(_QWORD *)(a1 + 128) = v58 + 1;
                }
                v59 = v55 + 136;
                *(double *)(v59 + 8) = v56 + *(double *)&v150 - *((double *)&v149 + 1);
                *(_QWORD *)(v59 + 16) = v57;
                v52 = 1;
              }
            }
            else
            {
              if (!*((_BYTE *)v44 + 42))
                ++*(_QWORD *)(a1 + 120);
              v70 = a1 + 24 * (uint64_t)*(double *)&v149;
              v71 = *(double *)(v70 + 144);
              v72 = *(_QWORD *)(v70 + 152);
              v73 = *(_QWORD *)(a1 + 128);
              if (v73 < v72)
              {
                v72 = v73 + 1;
                *(_QWORD *)(a1 + 128) = v73 + 1;
              }
              v74 = v70 + 136;
              *(double *)(v74 + 8) = v71 + *(double *)&v150 - *((double *)&v149 + 1);
              *(_QWORD *)(v74 + 16) = v72;
              v52 = 1;
              v54 = *((_QWORD *)&v150 + 1);
              v142 = *((_QWORD *)&v150 + 1);
            }
            if (*(_BYTE *)(a1 + 25))
            {
              HDStatisticsBucket<HDStatisticsSleepStages>::_bundleIdentifierForSourceID(a1, v54);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              if (v75)
              {
                objc_msgSend(v141, "objectForKeyedSubscript:", v75);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = v76;
                if (v76)
                {
                  if (objc_msgSend(v76, "longLongValue") != v54 && !*(_BYTE *)(a1 + 24))
                    goto LABEL_99;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v54);
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v141, "setObject:forKeyedSubscript:", v87, v75);

                }
                v88 = HDStatisticsBucket<HDStatisticsSleepStages>::_canonicalSourceIDForSourceID(a1, v54);
                v89 = HDStatisticsBucket<HDStatisticsSleepStages>::_statisticsForSource(a1, v88);
                if (!v53)
                  *v89 = (uint64_t *)((char *)*v89 + 1);
                v90 = &v89[3 * (uint64_t)*(double *)&v149];
                v91 = *((double *)v90 + 3);
                v92 = v90[4];
                v93 = v89[1];
                if ((uint64_t)v93 < (uint64_t)v92)
                {
                  v92 = (uint64_t *)((char *)v93 + 1);
                  v89[1] = (uint64_t *)((char *)v93 + 1);
                }
                v94 = v90 + 2;
                *((double *)v94 + 1) = v91 + *(double *)&v150 - *((double *)&v149 + 1);
                v94[2] = v92;
                LOBYTE(v53) = 1;
LABEL_99:

              }
            }
            v43 = 1;
          }
          if (v49)
          {
            v95 = v52 != 0;
            v97 = *(char **)(a1 + 104);
            v96 = *(_QWORD *)(a1 + 112);
            if ((unint64_t)v97 < v96)
            {
              *(_QWORD *)v97 = v46;
              *((double *)v97 + 1) = v51;
              *((_QWORD *)v97 + 2) = v47;
              *((_QWORD *)v97 + 3) = v146;
              v97[32] = v49;
              v97[33] = v145;
              v97[40] = v144;
              v97[41] = v53;
              v64 = v97 + 48;
              v97[42] = v95;
              goto LABEL_119;
            }
            v86 = (char *)*v147;
            v98 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v97[-*v147] >> 4);
            v99 = v98 + 1;
            if (v98 + 1 > 0x555555555555555)
              std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
            v100 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v96 - (_QWORD)v86) >> 4);
            if (2 * v100 > v99)
              v99 = 2 * v100;
            if (v100 >= 0x2AAAAAAAAAAAAAALL)
              v101 = 0x555555555555555;
            else
              v101 = v99;
            if (v101)
            {
              v101 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder>>(v101);
              v86 = *(char **)(a1 + 96);
              v97 = *(char **)(a1 + 104);
            }
            else
            {
              v102 = 0;
            }
            v103 = v101 + 48 * v98;
            *(_QWORD *)v103 = v46;
            *(double *)(v103 + 8) = v51;
            *(_QWORD *)(v103 + 16) = v47;
            *(_QWORD *)(v103 + 24) = v146;
            *(_BYTE *)(v103 + 32) = v49;
            *(_BYTE *)(v103 + 33) = v145;
            *(_BYTE *)(v103 + 40) = v144;
            *(_BYTE *)(v103 + 41) = v53;
            *(_BYTE *)(v103 + 42) = v95;
            v104 = v103;
            if (v97 != v86)
            {
              do
              {
                v105 = *((_OWORD *)v97 - 3);
                v106 = *((_OWORD *)v97 - 2);
                *(_OWORD *)(v104 - 21) = *(_OWORD *)(v97 - 21);
                *(_OWORD *)(v104 - 48) = v105;
                *(_OWORD *)(v104 - 32) = v106;
                v104 -= 48;
                v97 -= 48;
              }
              while (v97 != v86);
              v86 = (char *)*v147;
            }
            v64 = (_OWORD *)(v103 + 48);
            *(_QWORD *)(a1 + 96) = v104;
            *(_QWORD *)(a1 + 104) = v103 + 48;
            *(_QWORD *)(a1 + 112) = v101 + 48 * v102;
            if (v86)
LABEL_118:
              operator delete(v86);
            goto LABEL_119;
          }
        }
        v44 += 3;
        if (v44 == v7)
          goto LABEL_121;
        continue;
      }
    }
    v9 = *(double *)(v6 + 8);
    v10 = *(double *)(v6 + 16);
    v11 = *(_QWORD *)(v6 + 24);
    v12 = *(_BYTE *)(v6 + 32);
    v13 = *(_BYTE *)(v6 + 33);
    if (a2 - v9 >= 0.01)
    {
      if (v10 - v9 - (a2 - v9) < 0.01)
      {
        v40 = 0;
        v41 = 0;
        v16 = 0.0;
        v15 = *(double *)(v6 + 16);
        v14 = *(_BYTE *)(v6 + 32);
        v10 = 0.0;
        v12 = 0;
LABEL_132:
        v111 = *(unsigned __int8 *)(v6 + 42);
        v112 = *(unsigned __int8 *)(v6 + 41);
        v113 = *(uint64_t **)(a1 + 96);
        v114 = *(unsigned __int8 *)(v6 + 40);
        v115 = *v113;
        *((double *)&v149 + 1) = v9;
        *(double *)&v150 = v15;
        *((_QWORD *)&v150 + 1) = v11;
        LOBYTE(v151) = v14;
        BYTE1(v151) = v13;
        *(_DWORD *)((char *)&v151 + 2) = *(_DWORD *)((char *)v113 + 34);
        HIWORD(v151) = *((_WORD *)v113 + 19);
        *((double *)&v152 + 1) = v16;
        *(double *)&v153 = v10;
        *((_QWORD *)&v153 + 1) = v40;
        LOBYTE(v154) = v12;
        HIBYTE(v154) = v41;
        *(_QWORD *)&v149 = v115;
        *(_QWORD *)&v152 = v115;
        HDRawQuantitySample::applyMask((uint64_t)&v149, v143);
        v116 = v114 != 0;
        v117 = v112 != 0;
        v118 = v111 != 0;
        if ((_BYTE)v151)
        {
          if (!v111)
            ++*(_QWORD *)(a1 + 120);
          v119 = (uint64_t)*(double *)&v149;
          v120 = a1 + 24 * (uint64_t)*(double *)&v149;
          v121 = *(double *)(v120 + 144);
          v122 = *(_QWORD *)(v120 + 152);
          v123 = *(_QWORD *)(a1 + 128);
          if (v123 < v122)
          {
            v122 = v123 + 1;
            *(_QWORD *)(a1 + 128) = v123 + 1;
          }
          v124 = v120 + 136;
          v125 = *(double *)&v150 - *((double *)&v149 + 1);
          *(double *)(v124 + 8) = v121 + *(double *)&v150 - *((double *)&v149 + 1);
          *(_QWORD *)(v124 + 16) = v122;
          if (*(_BYTE *)(a1 + 25))
          {
            v126 = HDStatisticsBucket<HDStatisticsSleepStages>::_canonicalSourceIDForSourceID(a1, *((unint64_t *)&v150 + 1));
            v127 = HDStatisticsBucket<HDStatisticsSleepStages>::_statisticsForSource(a1, v126);
            if (!v112)
              *v127 = (uint64_t *)((char *)*v127 + 1);
            v128 = &v127[3 * v119];
            v129 = *((double *)v128 + 3);
            v130 = v128[4];
            v131 = v127[1];
            if ((uint64_t)v131 < (uint64_t)v130)
            {
              v130 = (uint64_t *)((char *)v131 + 1);
              v127[1] = (uint64_t *)((char *)v131 + 1);
            }
            v132 = v128 + 2;
            *((double *)v132 + 1) = v125 + v129;
            v132[2] = v130;
          }
          v116 = 1;
          v117 = 1;
          v118 = 1;
        }
        if ((_BYTE)v154)
        {
          LOWORD(v148) = v154;
          v133 = v153;
          v134 = (char *)*v147;
          *(_OWORD *)v134 = v152;
          *((_OWORD *)v134 + 1) = v133;
          *((_QWORD *)v134 + 4) = v148;
          v134[40] = v116;
          v134[41] = v117;
          v134[42] = v118;
        }
        else
        {
          *(_QWORD *)(a1 + 104) = *(_QWORD *)(a1 + 96);
        }
        goto LABEL_147;
      }
      v15 = a2;
      v14 = *(_BYTE *)(v6 + 32);
      v16 = a2;
    }
    else
    {
      v14 = 0;
      v15 = *(double *)(v6 + 16);
      v16 = *(double *)(v6 + 8);
    }
    v40 = *(_QWORD *)(v6 + 24);
    v41 = *(_BYTE *)(v6 + 33);
    goto LABEL_132;
  }
}

void sub_1B7DBED70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

uint64_t **HDStatisticsBucket<HDStatisticsSleepStages>::_statisticsForSource(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t **v4;
  uint64_t v5;
  BOOL v6;
  _QWORD *v7;
  uint64_t **v8;
  uint64_t v10;

  v10 = a2;
  v3 = *(_QWORD **)(a1 + 288);
  if (!v3)
    goto LABEL_11;
  v4 = (uint64_t **)(a1 + 288);
  do
  {
    v5 = v3[4];
    v6 = v5 < a2;
    if (v5 >= a2)
      v7 = v3;
    else
      v7 = v3 + 1;
    if (!v6)
      v4 = (uint64_t **)v3;
    v3 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t **)(a1 + 288) || (uint64_t)v4[4] > a2)
  {
LABEL_11:
    v8 = (uint64_t **)(a1 + 280);
    std::__tree<std::__value_type<long long,HDStatisticsSleepStages>,std::__map_value_compare<long long,std::__value_type<long long,HDStatisticsSleepStages>,std::less<long long>,true>,std::allocator<std::__value_type<long long,HDStatisticsSleepStages>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t **)(a1 + 280), a2, &v10);
    v4 = std::__tree<std::__value_type<long long,HDStatisticsSleepStages>,std::__map_value_compare<long long,std::__value_type<long long,HDStatisticsSleepStages>,std::less<long long>,true>,std::allocator<std::__value_type<long long,HDStatisticsSleepStages>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(v8, a2, &v10);
  }
  return v4 + 5;
}

unint64_t HDStatisticsBucket<HDStatisticsSleepStages>::_canonicalSourceIDForSourceID(uint64_t a1, unint64_t a2)
{
  id WeakRetained;
  _QWORD *v5;
  id v6;
  _QWORD *v7;
  uint64_t **v8;
  id v10;
  id *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));

  if (WeakRetained)
  {
    v5 = std::__hash_table<std::__hash_value_type<unsigned long long,health::TransactionalCache<unsigned long long,health::FilePage>::CacheLine>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,health::TransactionalCache<unsigned long long,health::FilePage>::CacheLine>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,health::TransactionalCache<unsigned long long,health::FilePage>::CacheLine>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,health::TransactionalCache<unsigned long long,health::FilePage>::CacheLine>>>::find<unsigned long long>((_QWORD *)(a1 + 368), a2);
    if (v5)
    {
      return v5[3];
    }
    else
    {
      HDStatisticsBucket<HDStatisticsSleepStages>::_bundleIdentifierForSourceID(a1, a2);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v10 = v6;
      v7 = (_QWORD *)(a1 + 408);
      v8 = std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::find<NSString * {__strong}>(v7, &v10);
      if (v8)
      {
        a2 = (unint64_t)v8[3];
      }
      else
      {
        v11 = &v10;
        *((_QWORD *)std::__hash_table<std::__hash_value_type<NSString * {__strong},long long>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},long long>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},long long>>>::__emplace_unique_key_args<NSString * {__strong},std::piecewise_construct_t const&,std::tuple<NSString * const {__strong}&>,std::tuple<>>((uint64_t)v7, &v10, &v11)+ 3) = a2;
        v6 = v10;
      }

    }
  }
  return a2;
}

void sub_1B7DBEF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

id HDStatisticsBucket<HDStatisticsSleepStages>::_bundleIdentifierForSourceID(uint64_t a1, unint64_t a2)
{
  id *v4;
  id WeakRetained;
  _QWORD *v6;
  _QWORD *v7;
  id v9;
  void *v10;
  id *v11;
  unint64_t v12;

  v12 = a2;
  v4 = (id *)(a1 + 88);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));

  if (!WeakRetained)
    return 0;
  v6 = (_QWORD *)(a1 + 448);
  v7 = std::__hash_table<std::__hash_value_type<unsigned long long,health::TransactionalCache<unsigned long long,health::FilePage>::CacheLine>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,health::TransactionalCache<unsigned long long,health::FilePage>::CacheLine>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,health::TransactionalCache<unsigned long long,health::FilePage>::CacheLine>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,health::TransactionalCache<unsigned long long,health::FilePage>::CacheLine>>>::find<unsigned long long>(v6, a2);
  if (v7)
    return (id)v7[3];
  v9 = objc_loadWeakRetained(v4);
  objc_msgSend(v9, "bundleIdentifierForSourceID:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (id *)std::__hash_table<std::__hash_value_type<long long,NSString * {__strong}>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,NSString * {__strong}>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,NSString * {__strong}>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,NSString * {__strong}>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t)v6, a2, &v12);
    objc_storeStrong(v11 + 3, v10);
  }
  return v10;
}

void sub_1B7DBF010(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t **std::__tree<std::__value_type<long long,HDStatisticsSleepStages>,std::__map_value_compare<long long,std::__value_type<long long,HDStatisticsSleepStages>,std::less<long long>,true>,std::allocator<std::__value_type<long long,HDStatisticsSleepStages>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(uint64_t **a1, uint64_t a2, _QWORD *a3)
{
  uint64_t *v5;
  uint64_t **v6;
  uint64_t **v7;
  uint64_t v8;
  char *v9;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v7 = (uint64_t **)v5;
        v8 = v5[4];
        if (v8 <= a2)
          break;
        v5 = *v7;
        v6 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if (v8 >= a2)
        break;
      v5 = v7[1];
      if (!v5)
      {
        v6 = v7 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = a1 + 1;
LABEL_9:
    v9 = (char *)operator new(0xC8uLL);
    *((_QWORD *)v9 + 4) = *a3;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *(_OWORD *)(v9 + 72) = xmmword_1B7F54B10;
    *((_QWORD *)v9 + 11) = 0;
    *((_OWORD *)v9 + 6) = xmmword_1B7F54B20;
    *((_QWORD *)v9 + 14) = 0;
    *(_OWORD *)(v9 + 120) = xmmword_1B7F54B30;
    *((_QWORD *)v9 + 17) = 0;
    *((_OWORD *)v9 + 9) = xmmword_1B7F54B40;
    *((_QWORD *)v9 + 20) = 0;
    *(_OWORD *)(v9 + 168) = xmmword_1B7F54B50;
    *((_QWORD *)v9 + 23) = 0;
    *((_QWORD *)v9 + 24) = 0x7FFFFFFFFFFFFFFFLL;
    std::__tree<unsigned long long>::__insert_node_at(a1, (uint64_t)v7, v6, (uint64_t *)v9);
    return (uint64_t **)v9;
  }
  return v7;
}

void std::__introsort<std::_ClassicAlgPolicy,HDStatisticsBucket<HDStatisticsSleepStages>::_mergeTowardTime(double)::{lambda(HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder const&,HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder const&)#1} &,HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder*,false>(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4, char a5)
{
  __int128 *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __int128 *v15;
  uint64_t v16;
  __int128 *v17;
  __int128 *v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  __int128 *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  __int128 *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  __int128 *v61;
  __int128 v62;
  __int128 v63;
  BOOL v64;
  uint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  char *v69;
  uint64_t v70;
  char *v71;
  char *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  char *v76;
  char *v77;
  char *v78;
  char *v79;
  __int128 *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  char *v93;
  char *v94;
  uint64_t v95;
  char *v96;
  char *v97;
  __int128 *v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  char *v105;
  char *v106;
  __int128 v107;
  __int128 v108;
  __int128 *v109;
  BOOL v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  char *v118;
  char *v119;
  unint64_t v120;
  __int128 v121;
  uint64_t v122;
  char *v123;
  char *v124;
  char *v125;
  char *v126;
  int64_t v127;
  int64_t v128;
  int64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  char *v135;
  char *v136;
  char *v137;
  unint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  char *v142;
  char *v143;
  char *v144;
  __int128 v145;
  __int128 v146;
  unint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  char *v153;
  char *v154;
  char *v155;
  uint64_t v156;
  char *v157;
  char *v158;
  char *v159;
  char *v160;
  __int128 v161;
  __int128 v162;
  int64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  unint64_t v167;
  _OWORD *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  char *v173;
  char *v174;
  char *v175;
  char *v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  uint64_t v181;
  unint64_t v182;
  unint64_t v183;
  uint64_t v184;
  uint64_t v185;
  char *v186;
  char *v187;
  char *v188;
  char *v189;
  _OWORD *v190;
  __int128 v191;
  __int128 v192;
  uint64_t v193;
  char *v194;
  char *v195;
  char *v196;
  char *v197;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  char *v202;
  char *v203;
  char *v204;
  char *v205;
  uint64_t v206;
  _OWORD *v207;
  __int128 v208;
  uint64_t v209;
  char *v210;
  char *v211;
  char *v212;
  char *v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  _BYTE v221[32];
  _BYTE v222[32];
  _BYTE v223[32];
  _BYTE v224[32];
  uint64_t v225;
  uint64_t v226;
  _BYTE v227[32];
  uint64_t v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,HDStatisticsBucket<HDStatisticsSleepStages>::_mergeTowardTime(double)::{lambda(HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder const&,HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder const&)#1} &,HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  _BOOL8 result;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  __int128 *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  __int128 v34;
  _BYTE v35[32];
  uint64_t v36;
  __int128 v37;

  v6 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 4);
  result = 1;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v8 = *(_QWORD *)(a2 - 24);
      v9 = *(_QWORD *)(a1 + 24);
      if (v8 == v9)
        return result;
      v10 = *(char **)(*(_QWORD *)a3 + 344);
      v11 = *(char **)(*(_QWORD *)a3 + 352);
      v12 = v10;
      v13 = v10;
      if (v10 == v11)
        goto LABEL_10;
      do
      {
        if (*(_QWORD *)v13 == v8)
          goto LABEL_7;
        v13 += 8;
      }
      while (v13 != v11);
      v13 = *(char **)(*(_QWORD *)a3 + 352);
      do
      {
LABEL_7:
        if (*(_QWORD *)v12 == v9)
          goto LABEL_10;
        v12 += 8;
      }
      while (v12 != v11);
      v12 = *(char **)(*(_QWORD *)a3 + 352);
LABEL_10:
      if (v13 - v10 < v12 - v10)
      {
        v14 = (__int128 *)(a2 - 48);
        v15 = *(_OWORD *)a1;
        *(_OWORD *)v35 = *(_OWORD *)(a1 + 16);
        *(_OWORD *)&v35[16] = *(_OWORD *)(a1 + 32);
        v16 = *(_OWORD *)(a2 - 21);
        v17 = *(_OWORD *)(a2 - 32);
        *(_OWORD *)a1 = *(_OWORD *)(a2 - 48);
        *(_OWORD *)(a1 + 16) = v17;
        *(_OWORD *)(a1 + 27) = v16;
        *v14 = v15;
        v14[1] = *(_OWORD *)v35;
        *(__int128 *)((char *)v14 + 27) = *(_OWORD *)&v35[11];
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_mergeTowardTime(double)::{lambda(HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder const&,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder const&)#1} &,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder*>((__int128 *)a1, (__int128 *)(a1 + 48), (__int128 *)(a2 - 48), a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_mergeTowardTime(double)::{lambda(HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder const&,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder const&)#1} &,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder*>(a1, a1 + 48, a1 + 96, a2 - 48, a3);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_mergeTowardTime(double)::{lambda(HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder const&,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder const&)#1} &,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder*>(a1, a1 + 48, a1 + 96, a1 + 144, a2 - 48, a3);
      return 1;
    default:
      v18 = a1 + 96;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_mergeTowardTime(double)::{lambda(HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder const&,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder const&)#1} &,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder*>((__int128 *)a1, (__int128 *)(a1 + 48), (__int128 *)(a1 + 96), a3);
      v19 = a1 + 144;
      if (a1 + 144 == a2)
        return 1;
      v20 = 0;
      break;
  }
  while (1)
  {
    v21 = *(_QWORD *)(v19 + 24);
    v22 = *(_QWORD *)(v18 + 24);
    if (v21 != v22)
    {
      v23 = *(char **)(*(_QWORD *)a3 + 344);
      v24 = *(char **)(*(_QWORD *)a3 + 352);
      v25 = v23;
      v26 = v23;
      if (v23 != v24)
      {
        do
        {
          if (*(_QWORD *)v26 == v21)
            goto LABEL_19;
          v26 += 8;
        }
        while (v26 != v24);
        v26 = *(char **)(*(_QWORD *)a3 + 352);
LABEL_19:
        while (*(_QWORD *)v25 != v22)
        {
          v25 += 8;
          if (v25 == v24)
          {
            v25 = *(char **)(*(_QWORD *)a3 + 352);
            break;
          }
        }
      }
      if (v26 - v23 < v25 - v23)
      {
        v34 = *(_OWORD *)v19;
        v36 = *(_QWORD *)(v19 + 16);
        v37 = *(_OWORD *)(v19 + 32);
        v27 = v19;
        while (1)
        {
          v28 = *(_OWORD *)(v18 + 16);
          *(_OWORD *)v27 = *(_OWORD *)v18;
          *(_OWORD *)(v27 + 16) = v28;
          *(_OWORD *)(v27 + 27) = *(_OWORD *)(v18 + 27);
          if (v18 == a1)
            break;
          v27 = v18;
          v29 = *(_QWORD *)(v18 - 24);
          if (v21 != v29)
          {
            v30 = *(char **)(*(_QWORD *)a3 + 344);
            v31 = *(char **)(*(_QWORD *)a3 + 352);
            v32 = v30;
            v33 = v30;
            if (v30 != v31)
            {
              do
              {
                if (*(_QWORD *)v33 == v21)
                  goto LABEL_30;
                v33 += 8;
              }
              while (v33 != v31);
              v33 = *(char **)(*(_QWORD *)a3 + 352);
LABEL_30:
              while (*(_QWORD *)v32 != v29)
              {
                v32 += 8;
                if (v32 == v31)
                {
                  v32 = *(char **)(*(_QWORD *)a3 + 352);
                  break;
                }
              }
            }
            v18 -= 48;
            if (v33 - v30 < v32 - v30)
              continue;
          }
          goto LABEL_36;
        }
        v27 = a1;
LABEL_36:
        *(_OWORD *)v27 = v34;
        *(_QWORD *)(v27 + 16) = v36;
        *(_QWORD *)(v27 + 24) = v21;
        *(_QWORD *)(v27 + 32) = v37;
        *(_DWORD *)(v27 + 39) = *(_DWORD *)((char *)&v37 + 7);
        if (++v20 == 8)
          return v19 + 48 == a2;
      }
    }
    v18 = v19;
    v19 += 48;
    if (v19 == a2)
      return 1;
  }
}

void std::__introsort<std::_ClassicAlgPolicy,HDStatisticsBucket<HDStatisticsSleepStages>::_mergeTowardTime(double)::{lambda(HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder const&,HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder const&)#2} &,HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder*,false>(uint64_t a1, __int128 *a2, uint64_t a3, char a4)
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int128 *v12;
  uint64_t v13;
  __int128 *v14;
  __int128 *v15;
  __int128 v16;
  __int128 v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  unint64_t v22;
  __int128 *v23;
  __int128 *v24;
  double v25;
  __int128 *v26;
  double v27;
  __int128 *v28;
  __int128 v29;
  __int128 v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  unint64_t v39;
  double v40;
  __int128 *v41;
  __int128 *v42;
  double v43;
  __int128 v44;
  __int128 v45;
  double v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 *v52;
  BOOL v54;
  uint64_t v55;
  unint64_t v56;
  __int128 *v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  _OWORD *v61;
  __int128 v62;
  uint64_t v63;
  int64_t v64;
  int64_t v65;
  int64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  double v70;
  uint64_t v71;
  _OWORD *v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  int64_t v77;
  uint64_t v78;
  unint64_t v79;
  _OWORD *v80;
  uint64_t v81;
  int64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  double v90;
  uint64_t v91;
  _OWORD *v92;
  __int128 v93;
  __int128 v94;
  __int128 *v96;
  double v97;
  uint64_t v98;
  __int128 *v99;
  __int128 v100;
  double v101;
  _BYTE v102[32];
  _BYTE v103[32];
  _BYTE v104[32];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[32];
  _BYTE v110[32];
  __int128 v111;
  _BYTE v112[32];
  _BYTE v113[32];
  _BYTE v114[32];
  _BYTE v115[32];
  _BYTE v116[32];
  _BYTE v117[32];

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,HDStatisticsBucket<HDStatisticsSleepStages>::_mergeTowardTime(double)::{lambda(HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder const&,HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder const&)#2} &,HDStatisticsBucket<HDStatisticsSleepStages>::_SampleRemainder*>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _BYTE v19[32];
  _BYTE v20[32];

  v4 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 4);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      if (*(double *)(a2 - 40) < *(double *)(a1 + 8))
      {
        v6 = *(_OWORD *)a1;
        *(_OWORD *)v20 = *(_OWORD *)(a1 + 16);
        *(_OWORD *)&v20[16] = *(_OWORD *)(a1 + 32);
        v7 = *(_OWORD *)(a2 - 21);
        v8 = *(_OWORD *)(a2 - 32);
        *(_OWORD *)a1 = *(_OWORD *)(a2 - 48);
        *(_OWORD *)(a1 + 16) = v8;
        *(_OWORD *)(a1 + 27) = v7;
        *(_OWORD *)(a2 - 48) = v6;
        *(_OWORD *)(a2 - 32) = *(_OWORD *)v20;
        *(_OWORD *)(a2 - 21) = *(_OWORD *)&v20[11];
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_mergeTowardTime(double)::{lambda(HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_SampleRemainder const&,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_SampleRemainder const&)#2} &,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_SampleRemainder*>((__int128 *)a1, (__int128 *)(a1 + 48), (__int128 *)(a2 - 48));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_mergeTowardTime(double)::{lambda(HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_SampleRemainder const&,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_SampleRemainder const&)#2} &,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_SampleRemainder*>(a1, a1 + 48, a1 + 96, a2 - 48);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_mergeTowardTime(double)::{lambda(HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_SampleRemainder const&,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_SampleRemainder const&)#2} &,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_SampleRemainder*>(a1, a1 + 48, a1 + 96, a1 + 144, a2 - 48);
      return 1;
    default:
      v9 = a1 + 96;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_mergeTowardTime(double)::{lambda(HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_SampleRemainder const&,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_SampleRemainder const&)#2} &,HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsTemporalBucketWeightedDiscrete<HDStatisticsTemporalBucketWeightedDiscreteParameters>,HDStatisticsTimeInterval>>>::_SampleRemainder*>((__int128 *)a1, (__int128 *)(a1 + 48), (__int128 *)(a1 + 96));
      v10 = a1 + 144;
      if (a1 + 144 == a2)
        return 1;
      v11 = 0;
      v12 = 0;
      break;
  }
  while (1)
  {
    v13 = *(double *)(v10 + 8);
    if (v13 < *(double *)(v9 + 8))
    {
      v14 = *(_QWORD *)v10;
      *(_OWORD *)v19 = *(_OWORD *)(v10 + 16);
      *(_OWORD *)&v19[16] = *(_OWORD *)(v10 + 32);
      v15 = v11;
      while (1)
      {
        v16 = a1 + v15;
        v17 = *(_OWORD *)(a1 + v15 + 112);
        *(_OWORD *)(v16 + 144) = *(_OWORD *)(a1 + v15 + 96);
        *(_OWORD *)(v16 + 160) = v17;
        *(_OWORD *)(v16 + 171) = *(_OWORD *)(a1 + v15 + 123);
        if (v15 == -96)
          break;
        v15 -= 48;
        if (v13 >= *(double *)(v16 + 56))
        {
          v18 = a1 + v15 + 144;
          goto LABEL_12;
        }
      }
      v18 = a1;
LABEL_12:
      *(_QWORD *)v18 = v14;
      *(double *)(v18 + 8) = v13;
      *(_OWORD *)(v18 + 16) = *(_OWORD *)v19;
      *(_OWORD *)(v18 + 27) = *(_OWORD *)&v19[11];
      if (++v12 == 8)
        return v10 + 48 == a2;
    }
    v9 = v10;
    v11 += 48;
    v10 += 48;
    if (v10 == a2)
      return 1;
  }
}

void std::__function::__func<void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addStatisticsFromFinishedBucket<HDStatisticsSleepStages>(HKStatistics *,HDStatisticsBucket<HDStatisticsSleepStages> const&)::{lambda(HDStatisticsSleepStages const&)#1},std::allocator<void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addStatisticsFromFinishedBucket<HDStatisticsSleepStages>(HKStatistics *,HDStatisticsBucket<HDStatisticsSleepStages> const&)::{lambda(HDStatisticsSleepStages const&)#1}>,HDStatisticsSleepStages const& ()(HDStatisticsSleepStages const&)>::~__func()
{
  JUMPOUT(0x1BCCAC494);
}

_QWORD *std::__function::__func<void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addStatisticsFromFinishedBucket<HDStatisticsSleepStages>(HKStatistics *,HDStatisticsBucket<HDStatisticsSleepStages> const&)::{lambda(HDStatisticsSleepStages const&)#1},std::allocator<void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addStatisticsFromFinishedBucket<HDStatisticsSleepStages>(HKStatistics *,HDStatisticsBucket<HDStatisticsSleepStages> const&)::{lambda(HDStatisticsSleepStages const&)#1}>,HDStatisticsSleepStages const& ()(HDStatisticsSleepStages const&)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1E6D098F0;
  return result;
}

void std::__function::__func<void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addStatisticsFromFinishedBucket<HDStatisticsSleepStages>(HKStatistics *,HDStatisticsBucket<HDStatisticsSleepStages> const&)::{lambda(HDStatisticsSleepStages const&)#1},std::allocator<void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addStatisticsFromFinishedBucket<HDStatisticsSleepStages>(HKStatistics *,HDStatisticsBucket<HDStatisticsSleepStages> const&)::{lambda(HDStatisticsSleepStages const&)#1}>,HDStatisticsSleepStages const& ()(HDStatisticsSleepStages const&)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_1E6D098F0;
}

uint64_t std::__function::__func<void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addStatisticsFromFinishedBucket<HDStatisticsSleepStages>(HKStatistics *,HDStatisticsBucket<HDStatisticsSleepStages> const&)::{lambda(HDStatisticsSleepStages const&)#1},std::allocator<void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addStatisticsFromFinishedBucket<HDStatisticsSleepStages>(HKStatistics *,HDStatisticsBucket<HDStatisticsSleepStages> const&)::{lambda(HDStatisticsSleepStages const&)#1}>,HDStatisticsSleepStages const& ()(HDStatisticsSleepStages const&)>::operator()(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t std::__function::__func<void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addStatisticsFromFinishedBucket<HDStatisticsSleepStages>(HKStatistics *,HDStatisticsBucket<HDStatisticsSleepStages> const&)::{lambda(HDStatisticsSleepStages const&)#1},std::allocator<void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addStatisticsFromFinishedBucket<HDStatisticsSleepStages>(HKStatistics *,HDStatisticsBucket<HDStatisticsSleepStages> const&)::{lambda(HDStatisticsSleepStages const&)#1}>,HDStatisticsSleepStages const& ()(HDStatisticsSleepStages const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addStatisticsFromFinishedBucket<HDStatisticsSleepStages>(HKStatistics *,HDStatisticsBucket<HDStatisticsSleepStages> const&)::{lambda(HDStatisticsSleepStages const&)#1},std::allocator<void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addStatisticsFromFinishedBucket<HDStatisticsSleepStages>(HKStatistics *,HDStatisticsBucket<HDStatisticsSleepStages> const&)::{lambda(HDStatisticsSleepStages const&)#1}>,HDStatisticsSleepStages const& ()(HDStatisticsSleepStages const&)>::target_type()
{
}

uint64_t _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_primitiveAddSample(uint64_t a1, double *a2, int a3, uint64_t a4)
{
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  void *v13;

  if (*(_BYTE *)(a1 + 640))
  {
    if ((a3 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Cannot configure statistics collection calculator engine with a sample if we cannot merge up to the sample's start date"));
      return 0;
    }
    _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_configureForStartTime(a1);
  }
  v8 = a2[1];
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    if (*(_BYTE *)(a1 + 640))
    {
      v10 = -1.79769313e308;
    }
    else
    {
      v10 = *(double *)(a1 + 176);
      v12 = *(double *)(a1 + 120);
      if (v10 <= v12)
        v10 = -1.79769313e308;
      if (v10 < v12)
        v10 = *(double *)(a1 + 120);
    }
  }
  else
  {
    v10 = *(double *)(a1 + 176);
    if (v10 <= *(double *)(a1 + 120))
      v10 = -1.79769313e308;
  }
  if (v10 <= v8)
  {
    if (v9 && a3)
      _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_advanceToTime(a1, v8);
    HDStatisticsCollectionEngine<HDStatisticsSleepStages>::addSample(a1 + 112, a2, a3);
    _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_notifyForCurrentBucket(a1);
    return 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithStart:end:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(*(_QWORD *)a1 + 128))(a1, v13, a4);

  }
  return v11;
}

void sub_1B7DC1368(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_advanceToTime(uint64_t a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  uint64_t v22;

  if (*(double *)(a1 + 128) <= a2)
  {
    v4 = a1 + 112;
    v5 = a1 + 120;
    do
    {
      v6 = *(_QWORD *)(a1 + 616);
      v7 = *(_QWORD *)(a1 + 608);
      if (v6 == v7)
      {
        v22 = 0;
        v15 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "dateIntervalContainingDate:index:", v16, &v22);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        HDStatisticsBucket<HDStatisticsSleepStages>::_updateSourceOrder(v5);
        HDStatisticsBucket<HDStatisticsSleepStages>::_mergeThroughTime(v5, *(double *)(a1 + 128));
        _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_statisticsFromFinishedBucket(a1, v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v22;
        objc_msgSend(v8, "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceReferenceDate");
        v19 = v18;
        objc_msgSend(v8, "endDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceReferenceDate");
        HDStatisticsCollectionEngine<HDStatisticsSleepStages>::resetToBucket(v4, v17, v19, v21);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "dateIntervalAtIndex:", *(_QWORD *)(a1 + 112) + 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        HDStatisticsBucket<HDStatisticsSleepStages>::_updateSourceOrder(v5);
        HDStatisticsBucket<HDStatisticsSleepStages>::_mergeThroughTime(v5, *(double *)(a1 + 128));
        _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_statisticsFromFinishedBucket(a1, v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceReferenceDate");
        v12 = v11;
        objc_msgSend(v8, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceReferenceDate");
        HDStatisticsCollectionEngine<HDStatisticsSleepStages>::advanceBucket(v4, v12, v14);

      }
      _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_didChangeBucket(a1, v9);
      if (v6 != v7)
        _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_notifyForCurrentBucket(a1);

    }
    while (*(double *)(a1 + 128) <= a2);
  }
}

void sub_1B7DC1570(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void HDStatisticsCollectionEngine<HDStatisticsSleepStages>::addSample(uint64_t a1, double *a2, int a3)
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  int v10;
  char v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  int v17;
  char v18;
  double v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float64x2_t v25;
  float64x2_t v26;
  int8x16_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  __int128 v40;
  __int128 v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  char *v54;
  char *v55;
  __int128 v56;
  __int128 v57;
  double v58;
  double v59;

  v5 = a1 + 8;
  v6 = *(double *)(a1 + 8);
  v7 = a2[1];
  v8 = a2[2];
  v9 = *((_QWORD *)a2 + 3);
  v10 = *((unsigned __int8 *)a2 + 32);
  v11 = *((_BYTE *)a2 + 33);
  if (v6 - v7 >= 0.01)
  {
    if (v8 - v7 - (v6 - v7) < 0.01)
    {
      v10 = 0;
      v11 = 0;
      v9 = 0;
      v8 = 0.0;
      v6 = 0.0;
    }
  }
  else
  {
    v6 = a2[1];
  }
  v12 = *a2;
  v13 = *(double *)(a1 + 16);
  v14 = v13 - v6;
  v15 = v8 - v6 - (v13 - v6);
  if (!*(_DWORD *)(a1 + 36))
  {
    if (v15 < 0.01)
      goto LABEL_10;
    if (v14 >= 0.01)
      goto LABEL_14;
LABEL_13:
    v18 = v11;
    v17 = v10;
    v16 = v9;
    v19 = v8;
    v13 = v6;
    goto LABEL_47;
  }
  if (v14 < 0.01)
    goto LABEL_13;
  if (v15 >= 0.01)
  {
LABEL_14:
    v19 = v8;
    v16 = v9;
    v17 = v10;
    v18 = v11;
    v8 = *(double *)(a1 + 16);
    if (!v10)
      goto LABEL_47;
    goto LABEL_15;
  }
LABEL_10:
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v13 = 0.0;
  v19 = 0.0;
  if (!v10)
    goto LABEL_47;
LABEL_15:
  v58 = v6;
  v59 = v8;
  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__emplace_unique_key_args<long long,long long const&>(a1 + 312, v9, v9);
  v20 = *(_QWORD *)(a1 + 112);
  if (v20 != *(_QWORD *)(a1 + 104) || *(uint64_t *)(a1 + 128) > 0)
  {
    v21 = v58;
    v22 = v59;
    if (v58 < *(double *)(a1 + 48))
    {
      v23 = *(double *)(a1 + 8);
      if (v58 >= v23)
        v23 = v58;
      *(double *)(a1 + 48) = v23;
    }
    if (v59 > *(double *)(a1 + 56))
    {
      v24 = *(double *)(a1 + 16);
      if (v24 >= v59)
        v24 = v59;
      *(double *)(a1 + 56) = v24;
    }
    if (!a3)
      goto LABEL_29;
    goto LABEL_26;
  }
  v25.f64[1] = *(float64_t *)(a1 + 16);
  v21 = v58;
  v22 = v59;
  v25.f64[0] = v58;
  v26.f64[0] = *(float64_t *)(a1 + 8);
  v26.f64[1] = v59;
  v27 = (int8x16_t)vcgtq_f64(v26, v25);
  v26.f64[0] = v58;
  *(int8x16_t *)(a1 + 48) = vbslq_s8(v27, *(int8x16_t *)(a1 + 8), (int8x16_t)v26);
  if (a3)
  {
LABEL_26:
    if (v21 < *(double *)(a1 + 16))
    {
      HDStatisticsBucket<HDStatisticsSleepStages>::_mergeThroughTime(v5, v21);
      v21 = v58;
      v22 = v59;
      v20 = *(_QWORD *)(a1 + 112);
    }
  }
LABEL_29:
  v28 = *(_QWORD *)(a1 + 120);
  if (v20 >= v28)
  {
    v30 = *(_QWORD *)(a1 + 104);
    v31 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v20 - v30) >> 4);
    v32 = v31 + 1;
    if (v31 + 1 > 0x555555555555555)
      std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
    v33 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - v30) >> 4);
    if (2 * v33 > v32)
      v32 = 2 * v33;
    if (v33 >= 0x2AAAAAAAAAAAAAALL)
      v34 = 0x555555555555555;
    else
      v34 = v32;
    if (v34)
    {
      v34 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<HDStatisticsBucket<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_SampleRemainder>>(v34);
      v21 = v58;
      v22 = v59;
    }
    else
    {
      v35 = 0;
    }
    v36 = v34 + 48 * v31;
    v37 = v34 + 48 * v35;
    *(double *)v36 = v12;
    *(double *)(v36 + 8) = v21;
    *(double *)(v36 + 16) = v22;
    *(_QWORD *)(v36 + 24) = v9;
    *(_BYTE *)(v36 + 32) = v10;
    *(_BYTE *)(v36 + 33) = v11;
    *(_WORD *)(v36 + 40) = 0;
    *(_BYTE *)(v36 + 42) = 0;
    v29 = v36 + 48;
    v39 = *(char **)(a1 + 104);
    v38 = *(char **)(a1 + 112);
    if (v38 != v39)
    {
      do
      {
        v40 = *((_OWORD *)v38 - 3);
        v41 = *((_OWORD *)v38 - 2);
        *(_OWORD *)(v36 - 21) = *(_OWORD *)(v38 - 21);
        *(_OWORD *)(v36 - 48) = v40;
        *(_OWORD *)(v36 - 32) = v41;
        v36 -= 48;
        v38 -= 48;
      }
      while (v38 != v39);
      v38 = *(char **)(a1 + 104);
    }
    *(_QWORD *)(a1 + 104) = v36;
    *(_QWORD *)(a1 + 112) = v29;
    *(_QWORD *)(a1 + 120) = v37;
    if (v38)
      operator delete(v38);
  }
  else
  {
    *(double *)v20 = v12;
    *(double *)(v20 + 8) = v21;
    *(double *)(v20 + 16) = v22;
    *(_QWORD *)(v20 + 24) = v9;
    *(_BYTE *)(v20 + 32) = v10;
    *(_BYTE *)(v20 + 33) = v11;
    *(_WORD *)(v20 + 40) = 0;
    v29 = v20 + 48;
    *(_BYTE *)(v20 + 42) = 0;
  }
  *(_QWORD *)(a1 + 112) = v29;
  if (*(_BYTE *)(a1 + 33))
  {
    v42 = HDStatisticsBucket<HDStatisticsSleepStages>::_canonicalSourceIDForSourceID(v5, v9);
    HDStatisticsBucket<HDStatisticsSleepStages>::_statisticsForSource(v5, v42);
  }
LABEL_47:
  if (v17)
  {
    v43 = *(_QWORD *)(a1 + 504);
    v44 = *(_QWORD *)(a1 + 512);
    if (v43 >= v44)
    {
      v46 = *(_QWORD *)(a1 + 496);
      v47 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v43 - v46) >> 3);
      v48 = v47 + 1;
      if (v47 + 1 > 0x666666666666666)
        std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
      v49 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v44 - v46) >> 3);
      if (2 * v49 > v48)
        v48 = 2 * v49;
      if (v49 >= 0x333333333333333)
        v50 = 0x666666666666666;
      else
        v50 = v48;
      if (v50)
        v50 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<HDRawQuantitySample>>(v50);
      else
        v51 = 0;
      v52 = v50 + 40 * v47;
      v53 = v50 + 40 * v51;
      *(double *)v52 = v12;
      *(double *)(v52 + 8) = v13;
      *(double *)(v52 + 16) = v19;
      *(_QWORD *)(v52 + 24) = v16;
      *(_BYTE *)(v52 + 32) = v17;
      *(_BYTE *)(v52 + 33) = v18;
      v45 = v52 + 40;
      v55 = *(char **)(a1 + 496);
      v54 = *(char **)(a1 + 504);
      if (v54 != v55)
      {
        do
        {
          v56 = *(_OWORD *)(v54 - 40);
          v57 = *(_OWORD *)(v54 - 24);
          *(_WORD *)(v52 - 8) = *((_WORD *)v54 - 4);
          *(_OWORD *)(v52 - 24) = v57;
          *(_OWORD *)(v52 - 40) = v56;
          v52 -= 40;
          v54 -= 40;
        }
        while (v54 != v55);
        v54 = *(char **)(a1 + 496);
      }
      *(_QWORD *)(a1 + 496) = v52;
      *(_QWORD *)(a1 + 504) = v45;
      *(_QWORD *)(a1 + 512) = v53;
      if (v54)
        operator delete(v54);
    }
    else
    {
      *(double *)v43 = v12;
      *(double *)(v43 + 8) = v13;
      *(double *)(v43 + 16) = v19;
      *(_QWORD *)(v43 + 24) = v16;
      *(_BYTE *)(v43 + 32) = v17;
      v45 = v43 + 40;
      *(_BYTE *)(v43 + 33) = v18;
    }
    *(_QWORD *)(a1 + 504) = v45;
  }
}

void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_notifyForCurrentBucket(uint64_t a1)
{
  void (**v2)(id, void *);
  void *v3;
  void (**v4)(id, void *);

  if (*(_BYTE *)(a1 + 642))
  {
    *(_BYTE *)(a1 + 644) = 1;
  }
  else
  {
    *(_BYTE *)(a1 + 644) = 0;
    v2 = (void (**)(id, void *))_Block_copy(*(const void **)(a1 + 96));
    if (v2)
    {
      v4 = v2;
      (*(void (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
        v4[2](v4, v3);

      v2 = v4;
    }

  }
}

void sub_1B7DC1A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void HDStatisticsCollectionEngine<HDStatisticsSleepStages>::advanceBucket(uint64_t a1, double a2, double a3)
{
  double *v6;
  double *v7;
  double *v8;
  double *v9;
  double *v10;
  uint64_t v11;

  v9 = 0;
  v10 = 0;
  v11 = 0;
  std::vector<HDRawQuantitySample>::__init_with_size[abi:ne180100]<HDRawQuantitySample*,HDRawQuantitySample*>(&v9, *(const void **)(a1 + 496), *(_QWORD *)(a1 + 504), 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a1 + 504) - *(_QWORD *)(a1 + 496)) >> 3));
  HDStatisticsCollectionEngine<HDStatisticsSleepStages>::resetToBucket(a1, *(_QWORD *)a1 + 1, a2, a3);
  v6 = v9;
  v7 = v10;
  if (v9 != v10)
  {
    v8 = v9;
    do
    {
      HDStatisticsCollectionEngine<HDStatisticsSleepStages>::addSample(a1, v8, 1);
      v8 += 5;
    }
    while (v8 != v7);
  }
  if (v6)
    operator delete(v6);
}

void sub_1B7DC1B6C(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void HDStatisticsCollectionEngine<HDStatisticsSleepStages>::resetToBucket(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *i;
  _QWORD *v15;

  v8 = a1 + 40;
  objc_storeStrong((id *)(a1 + 520), *(id *)(a1 + 40));
  *(double *)(v8 - 32) = a3;
  *(double *)(v8 - 24) = a4;
  *(double *)(v8 + 24) = a3;
  *(_QWORD *)(v8 + 72) = *(_QWORD *)(v8 + 64);
  *(_OWORD *)(v8 + 88) = 0u;
  *(_OWORD *)(v8 + 104) = 0u;
  *(_OWORD *)(v8 + 120) = xmmword_1B7F54B10;
  *(_QWORD *)(v8 + 136) = 0;
  *(_OWORD *)(v8 + 144) = xmmword_1B7F54B20;
  *(_QWORD *)(v8 + 160) = 0;
  *(_OWORD *)(v8 + 168) = xmmword_1B7F54B30;
  *(_QWORD *)(v8 + 184) = 0;
  *(_OWORD *)(v8 + 192) = xmmword_1B7F54B40;
  *(_QWORD *)(v8 + 208) = 0;
  *(_OWORD *)(v8 + 216) = xmmword_1B7F54B50;
  *(_QWORD *)(v8 + 232) = 0;
  *(_QWORD *)(v8 + 240) = 0x7FFFFFFFFFFFFFFFLL;
  if (*(_QWORD *)(v8 + 264))
  {
    v9 = *(_QWORD **)(a1 + 288);
    v10 = *(_QWORD *)(a1 + 296);
    *(_QWORD *)(a1 + 288) = a1 + 296;
    *(_QWORD *)(v10 + 16) = 0;
    *(_QWORD *)(a1 + 296) = 0;
    *(_QWORD *)(a1 + 304) = 0;
    if (v9[1])
      v11 = (_QWORD *)v9[1];
    else
      v11 = v9;
    if (v11)
    {
      v12 = (_QWORD *)v11[2];
      if (v12)
      {
        v13 = (_QWORD *)*v12;
        if ((_QWORD *)*v12 == v11)
        {
          *v12 = 0;
          while (1)
          {
            v15 = (_QWORD *)v12[1];
            if (!v15)
              break;
            do
            {
              v12 = v15;
              v15 = (_QWORD *)*v15;
            }
            while (v15);
          }
        }
        else
        {
          for (v12[1] = 0; v13; v13 = (_QWORD *)v12[1])
          {
            do
            {
              v12 = v13;
              v13 = (_QWORD *)*v13;
            }
            while (v13);
          }
        }
        std::__tree<long>::destroy(v11);
        for (i = (_QWORD *)v12[2]; i; i = (_QWORD *)i[2])
          v12 = i;
        v11 = v12;
      }
    }
    std::__tree<long>::destroy(v11);
  }
  objc_storeStrong((id *)v8, *(id *)(a1 + 520));
  *(_QWORD *)(a1 + 504) = *(_QWORD *)(a1 + 496);
  *(_QWORD *)a1 = a2;
}

void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_didChangeBucket(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (*(_BYTE *)(a1 + 644))
  {
    if (v3)
    {
      v6 = v3;
      v4 = _Block_copy(*(const void **)(a1 + 96));
      v5 = v4;
      if (v4)
        (*((void (**)(void *, id))v4 + 2))(v4, v6);

      v3 = v6;
    }
    *(_BYTE *)(a1 + 644) = 0;
  }

}

void sub_1B7DC1D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE38_collapsedPendingInvalidationIntervalsERb_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

void sub_1B7DC1DD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_primitiveInvalidateInterval(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t v34;
  _QWORD *v35;
  char v36;
  _QWORD v37[4];
  id v38;
  id v39;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Unable to invalidate interval: no data source available."));
    v14 = 0;
    goto LABEL_17;
  }
  v30 = a3;
  if (v5
    && (_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_currentBucketInterval(a1),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hk_isAfterDate:", v9))
    {
      objc_msgSend(v5, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "hk_isBeforeOrEqualToDate:", v11);

    }
    else
    {
      v12 = 0;
    }

    v13 = _Block_copy(*(const void **)(a1 + 96));
    if ((v12 & 1) == 0)
    {
      v15 = operator new();
      v25 = *(void **)(a1 + 16);
      v26 = *(_QWORD *)(a1 + 24);
      v28 = *(_QWORD *)(a1 + 32);
      v27 = *(void **)(a1 + 40);
      v29 = objc_loadWeakRetained((id *)(a1 + 48));
      _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_HDConcreteStatisticsCollectionCalculatorImplementation(v15, v25, v26, v28, v27, v29);

      (*(void (**)(uint64_t, double))(*(_QWORD *)v15 + 24))(v15, *(double *)(a1 + 56));
      (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v15 + 64))(v15, a1 + 72, 0);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v15 + 56))(v15, *(_QWORD *)(a1 + 656));
      v16 = 0;
      v17 = (_QWORD *)v15;
      goto LABEL_11;
    }
  }
  else
  {
    v13 = _Block_copy(*(const void **)(a1 + 96));
  }
  v15 = 0;
  v16 = 1;
  *(_BYTE *)(a1 + 640) = 1;
  v17 = (_QWORD *)a1;
LABEL_11:
  v18 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke;
  v37[3] = &unk_1E6D04928;
  v19 = v5;
  v38 = v19;
  v20 = v13;
  v39 = v20;
  (*(void (**)(_QWORD *, _QWORD *))(*v17 + 72))(v17, v37);
  if (v5)
  {
    objc_msgSend(v19, "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceReferenceDate");
    _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_configureForStartTime((uint64_t)v17);

  }
  else
  {
    (*(void (**)(_QWORD *))(*v17 + 32))(v17);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31[0] = v18;
  v31[1] = 3221225472;
  v31[2] = ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke_2;
  v31[3] = &unk_1E6D04990;
  v34 = a1;
  v5 = v19;
  v36 = v16;
  v32 = v5;
  v35 = v17;
  v33 = WeakRetained;
  v14 = (*(uint64_t (**)(_QWORD *, _QWORD *, uint64_t))(*v17 + 112))(v17, v31, v30);
  v22 = _Block_copy(v20);
  v23 = (void *)v17[12];
  v17[12] = v22;

  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);

LABEL_17:
  return v14;
}

void sub_1B7DC2138(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAC494](v4, 0x10F1C4045BC4A20);
  _Unwind_Resume(a1);
}

void ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (!*(_QWORD *)(a1 + 32))
    goto LABEL_4;
  objc_msgSend(v10, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hk_isBeforeOrEqualToDate:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(v10, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "hk_isAfterOrEqualToDate:", v7);

    if ((v8 & 1) == 0)
    {
LABEL_4:
      v9 = *(_QWORD *)(a1 + 40);
      if (v9)
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
    }
  }

}

void sub_1B7DC22E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  _QWORD v29[5];
  _QWORD v30[6];
  uint64_t v31;
  char v32;

  v4 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  v11 = *(void **)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(v4 + 8));
  v13 = *(_QWORD *)(a1 + 32);
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke_3;
  v30[3] = &__block_descriptor_57_e24_B52__0d8d16d24q32B40__44l;
  v32 = *(_BYTE *)(a1 + 64);
  v30[4] = v7;
  v30[5] = v10;
  v31 = *(_QWORD *)(a1 + 56);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke_4;
  v29[3] = &__block_descriptor_40_e8_v16__0d8l;
  v29[4] = v31;
  v14 = objc_msgSend(v11, "collectionCalculator:queryForInterval:error:sampleHandler:mergeHandler:", WeakRetained, v13, a2, v30, v29);

  if ((_DWORD)v14)
  {
    v15 = *(_QWORD *)(a1 + 56);
    if (v15 != v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "endDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceReferenceDate");
      if (*(_QWORD *)(v15 + 40))
      {
        v18 = v17;
        while (*(double *)(v15 + 120) < v18)
        {
          objc_msgSend(*(id *)(v15 + 40), "dateIntervalAtIndex:", *(_QWORD *)(v15 + 112) + 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          HDStatisticsBucket<HDStatisticsSleepStages>::_updateSourceOrder(v15 + 120);
          HDStatisticsBucket<HDStatisticsSleepStages>::_mergeThroughTime(v15 + 120, *(double *)(v15 + 128));
          _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_statisticsFromFinishedBucket(v15, v15 + 120);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "startDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "timeIntervalSinceReferenceDate");
          v23 = v22;
          objc_msgSend(v19, "endDate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "timeIntervalSinceReferenceDate");
          HDStatisticsCollectionEngine<HDStatisticsSleepStages>::advanceBucket(v15 + 112, v23, v25);

          if (v20)
          {
            v26 = _Block_copy(*(const void **)(v15 + 96));
            v27 = v26;
            if (v26)
              (*((void (**)(void *, void *))v26 + 2))(v26, v20);

          }
          _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_didChangeBucket(v15, 0);

        }
      }

    }
  }
  return v14;
}

void sub_1B7DC2550(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke_3(uint64_t a1, uint64_t a2, int a3, uint64_t a4, double a5, double a6, double a7)
{
  double v7;
  int v8;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  char v15;
  char v16;

  v7 = *(double *)(a1 + 32) - a6;
  if (v7 >= 0.01)
  {
    if (a7 - a6 - v7 >= 0.01)
    {
      v8 = 1;
      a6 = *(double *)(a1 + 32);
    }
    else
    {
      a2 = 0;
      v8 = 0;
      a6 = 0.0;
      a7 = 0.0;
    }
  }
  else
  {
    v8 = 1;
  }
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = a2;
  v15 = v8;
  v16 = 0;
  if (*(_BYTE *)(a1 + 56))
  {
    if (v8)
      return _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_primitiveAddSample(*(_QWORD *)(a1 + 48), &v11, a3, a4);
  }
  else
  {
    v10 = *(double *)(a1 + 40) - a6;
    if (v10 >= 0.01)
    {
      if (a7 - a6 - v10 >= 0.01)
        a7 = *(double *)(a1 + 40);
    }
    else
    {
      v8 = 0;
    }
    v12 = a6;
    v13 = a7;
    v15 = v8;
    if (v8)
      return _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_primitiveAddSample(*(_QWORD *)(a1 + 48), &v11, a3, a4);
  }
  return 1;
}

void ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE28_primitiveInvalidateIntervalEP14NSDateIntervalPU15__autoreleasingP7NSError_block_invoke_4(uint64_t a1, double a2)
{
  _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_mergeToTime(*(_QWORD *)(a1 + 32), a2);
}

void _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_mergeToTime(uint64_t a1, double a2)
{
  if (*(_BYTE *)(a1 + 640))
    _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_configureForStartTime(a1);
  if (*(_QWORD *)(a1 + 40))
    _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_advanceToTime(a1, a2);
  if (*(double *)(a1 + 128) > a2)
    HDStatisticsBucket<HDStatisticsSleepStages>::_mergeThroughTime(a1 + 120, a2);
}

void std::__introsort<std::_ClassicAlgPolicy,_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addPendingSamples(std::vector<HDRawQuantitySample> &,NSError * {__autoreleasing}*)::{lambda(HDRawQuantitySample const&,HDRawQuantitySample const&)#1} &,HDRawQuantitySample*,false>(uint64_t a1, unint64_t a2, uint64_t a3, char a4)
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  double *v14;
  double *v15;
  __int128 v16;
  __int128 v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  unint64_t v26;
  double v27;
  unint64_t v28;
  __int128 v29;
  __int128 v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  BOOL v35;
  double v36;
  uint64_t v37;
  double v38;
  unint64_t v39;
  double v40;
  unint64_t v41;
  unint64_t v42;
  double v43;
  __int128 v44;
  __int128 v45;
  double v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD *v52;
  BOOL v54;
  uint64_t v55;
  unint64_t v56;
  _QWORD *v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  int64_t v64;
  int64_t v65;
  int64_t v66;
  uint64_t v67;
  unint64_t v68;
  double v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  uint64_t v76;
  int64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  unint64_t v89;
  double v90;
  uint64_t v91;
  unint64_t v92;
  __int128 v93;
  __int128 v94;
  _QWORD *v96;
  double v97;
  uint64_t v98;
  _QWORD *v99;
  __int128 v100;
  double v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  uint64_t v121;
  __int128 v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_addPendingSamples(std::vector<HDRawQuantitySample> &,NSError * {__autoreleasing}*)::{lambda(HDRawQuantitySample const&,HDRawQuantitySample const&)#1} &,HDRawQuantitySample*>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int16 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;

  v4 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      if (*(double *)(a2 - 32) < *(double *)(a1 + 8))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(_OWORD *)a1;
        v8 = *(_OWORD *)(a1 + 16);
        v9 = *(_WORD *)(a2 - 8);
        v10 = *(_OWORD *)(a2 - 24);
        *(_OWORD *)a1 = *(_OWORD *)(a2 - 40);
        *(_OWORD *)(a1 + 16) = v10;
        *(_WORD *)(a1 + 32) = v9;
        *(_OWORD *)(a2 - 24) = v8;
        *(_OWORD *)(a2 - 40) = v7;
        *(_WORD *)(a2 - 8) = v6;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_addPendingSamples(std::vector<HDRawQuantitySample> &,NSError * {__autoreleasing}*)::{lambda(HDRawQuantitySample const&,HDRawQuantitySample const&)#1} &,HDRawQuantitySample*>((__int128 *)a1, (double *)(a1 + 40), (double *)(a2 - 40));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_addPendingSamples(std::vector<HDRawQuantitySample> &,NSError * {__autoreleasing}*)::{lambda(HDRawQuantitySample const&,HDRawQuantitySample const&)#1} &,HDRawQuantitySample*>(a1, a1 + 40, a1 + 80, a2 - 40);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_addPendingSamples(std::vector<HDRawQuantitySample> &,NSError * {__autoreleasing}*)::{lambda(HDRawQuantitySample const&,HDRawQuantitySample const&)#1} &,HDRawQuantitySample*>(a1, a1 + 40, a1 + 80, a1 + 120, a2 - 40);
      return 1;
    default:
      v11 = a1 + 80;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,_HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsRelative<HDStatisticsCombined<HDStatisticsDiscrete,HDStatisticsTimeInterval>>>::_addPendingSamples(std::vector<HDRawQuantitySample> &,NSError * {__autoreleasing}*)::{lambda(HDRawQuantitySample const&,HDRawQuantitySample const&)#1} &,HDRawQuantitySample*>((__int128 *)a1, (double *)(a1 + 40), (double *)(a1 + 80));
      v12 = a1 + 120;
      if (a1 + 120 == a2)
        return 1;
      v13 = 0;
      v14 = 0;
      break;
  }
  while (1)
  {
    v15 = *(double *)(v12 + 8);
    if (v15 < *(double *)(v11 + 8))
    {
      v16 = *(_QWORD *)v12;
      v21 = *(_OWORD *)(v12 + 16);
      v22 = *(_QWORD *)(v12 + 32);
      v17 = v13;
      while (1)
      {
        v18 = a1 + v17;
        v19 = *(_OWORD *)(a1 + v17 + 96);
        *(_OWORD *)(v18 + 120) = *(_OWORD *)(a1 + v17 + 80);
        *(_OWORD *)(v18 + 136) = v19;
        *(_WORD *)(v18 + 152) = *(_WORD *)(a1 + v17 + 112);
        if (v17 == -80)
          break;
        v17 -= 40;
        if (v15 >= *(double *)(v18 + 48))
        {
          v20 = a1 + v17 + 120;
          goto LABEL_12;
        }
      }
      v20 = a1;
LABEL_12:
      *(_QWORD *)v20 = v16;
      *(double *)(v20 + 8) = v15;
      *(_OWORD *)(v20 + 16) = v21;
      *(_WORD *)(v20 + 32) = v22;
      if (++v14 == 8)
        return v12 + 40 == a2;
    }
    v11 = v12;
    v13 += 40;
    v12 += 40;
    if (v12 == a2)
      return 1;
  }
}

uint64_t ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE25queryForInitialStatisticsEP32HDStatisticsCollectionCalculatorPU15__autoreleasingP7NSError_block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v3 = (void *)a1[5];
  v4 = a1[6];
  v5 = (void *)a1[4];
  objc_msgSend(v5, "dateInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE25queryForInitialStatisticsEP32HDStatisticsCollectionCalculatorPU15__autoreleasingP7NSError_block_invoke_2;
  v10[3] = &__block_descriptor_40_e24_B52__0d8d16d24q32B40__44l;
  v10[4] = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE25queryForInitialStatisticsEP32HDStatisticsCollectionCalculatorPU15__autoreleasingP7NSError_block_invoke_3;
  v9[3] = &__block_descriptor_40_e8_v16__0d8l;
  v7 = objc_msgSend(v3, "collectionCalculator:queryForInterval:error:sampleHandler:mergeHandler:", v5, v6, a2, v10, v9);

  return v7;
}

void sub_1B7DC3200(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE25queryForInitialStatisticsEP32HDStatisticsCollectionCalculatorPU15__autoreleasingP7NSError_block_invoke_2(uint64_t a1, uint64_t a2, int a3, uint64_t a4, double a5, double a6, double a7)
{
  uint64_t v10;
  void *v11;
  double v12;
  double v14[4];
  char v15;
  BOOL v16;

  v10 = *(_QWORD *)(a1 + 32);
  v14[0] = a5;
  v14[1] = a6;
  v14[2] = a7;
  *(_QWORD *)&v14[3] = a2;
  v15 = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v16 = v12 <= a7;

  return _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_primitiveAddSample(v10, v14, a3, a4);
}

void sub_1B7DC32A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN55_HDConcreteStatisticsCollectionCalculatorImplementationI23HDStatisticsSleepStagesE25queryForInitialStatisticsEP32HDStatisticsCollectionCalculatorPU15__autoreleasingP7NSError_block_invoke_3(uint64_t a1, double a2)
{
  _HDConcreteStatisticsCollectionCalculatorImplementation<HDStatisticsSleepStages>::_mergeToTime(*(_QWORD *)(a1 + 32), a2);
}

void sub_1B7DC3968(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__163(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__163(uint64_t a1)
{

}

uint64_t statistics::StatisticsEngine::StatisticsEngine(uint64_t this)
{
  *(_QWORD *)this = &off_1E6D09A88;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 32) = 0;
  *(_QWORD *)(this + 40) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_DWORD *)(this + 48) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_1E6D09A88;
  *(_QWORD *)(this + 8) = 0;
  *(_QWORD *)(this + 32) = 0;
  *(_QWORD *)(this + 40) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_DWORD *)(this + 48) = 0;
  return this;
}

void statistics::StatisticsEngine::~StatisticsEngine(statistics::StatisticsEngine *this)
{
  uint64_t v2;
  void **v3;

  *(_QWORD *)this = &off_1E6D09A88;
  v3 = (void **)((char *)this + 24);
  std::vector<std::unique_ptr<statistics::Interval>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  PB::Base::~Base(this);
}

{
  statistics::StatisticsEngine::~StatisticsEngine(this);
  JUMPOUT(0x1BCCAC494);
}

statistics::StatisticsEngine *statistics::StatisticsEngine::StatisticsEngine(statistics::StatisticsEngine *this, const statistics::StatisticsEngine *a2)
{
  uint64_t **v4;
  uint64_t v5;
  statistics::StatisticsBucket *v6;
  statistics::StatisticsBucket *v7;
  uint64_t v8;
  const statistics::RawQuantitySample **v9;
  const statistics::RawQuantitySample **v10;

  *(_QWORD *)this = &off_1E6D09A88;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 3) = 0;
  v4 = (uint64_t **)((char *)this + 24);
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_DWORD *)this + 12) = 0;
  if ((*((_BYTE *)a2 + 48) & 1) != 0)
  {
    v5 = *((_QWORD *)a2 + 2);
    *((_BYTE *)this + 48) = 1;
    *((_QWORD *)this + 2) = v5;
  }
  if (*((_QWORD *)a2 + 1))
  {
    v6 = (statistics::StatisticsBucket *)operator new();
    v7 = statistics::StatisticsBucket::StatisticsBucket(v6, *((const statistics::StatisticsBucket **)a2 + 1));
    v8 = *((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = v7;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  }
  v10 = (const statistics::RawQuantitySample **)*((_QWORD *)a2 + 3);
  v9 = (const statistics::RawQuantitySample **)*((_QWORD *)a2 + 4);
  while (v10 != v9)
    PB::PtrVector<statistics::RawQuantitySample>::emplace_back<statistics::RawQuantitySample const&>(v4, *v10++);
  return this;
}

uint64_t statistics::StatisticsEngine::operator=(uint64_t a1, const statistics::StatisticsEngine *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  _BYTE v10[8];
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  int v15;

  if ((const statistics::StatisticsEngine *)a1 != a2)
  {
    statistics::StatisticsEngine::StatisticsEngine((statistics::StatisticsEngine *)v10, a2);
    v3 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)(a1 + 48) = v15;
    v15 = v3;
    v5 = *(_QWORD *)(a1 + 8);
    v4 = *(_QWORD *)(a1 + 16);
    v6 = v12;
    *(_QWORD *)(a1 + 8) = v11;
    *(_QWORD *)(a1 + 16) = v6;
    v11 = v5;
    v12 = v4;
    v7 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v13;
    v13 = v7;
    v8 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v14;
    v14 = v8;
    statistics::StatisticsEngine::~StatisticsEngine((statistics::StatisticsEngine *)v10);
  }
  return a1;
}

uint64_t statistics::swap(uint64_t this, statistics::StatisticsEngine *a2, statistics::StatisticsEngine *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_DWORD *)(this + 48);
  *(_DWORD *)(this + 48) = *((_DWORD *)a2 + 12);
  *((_DWORD *)a2 + 12) = v3;
  v5 = *(_QWORD *)(this + 8);
  v4 = *(_QWORD *)(this + 16);
  v6 = *((_QWORD *)a2 + 2);
  *(_QWORD *)(this + 8) = *((_QWORD *)a2 + 1);
  *(_QWORD *)(this + 16) = v6;
  *((_QWORD *)a2 + 1) = v5;
  *((_QWORD *)a2 + 2) = v4;
  v7 = *(_QWORD *)(this + 24);
  *(_QWORD *)(this + 24) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v7;
  v8 = *(_QWORD *)(this + 32);
  *(_QWORD *)(this + 32) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v8;
  v9 = *(_QWORD *)(this + 40);
  *(_QWORD *)(this + 40) = *((_QWORD *)a2 + 5);
  *((_QWORD *)a2 + 5) = v9;
  return this;
}

uint64_t statistics::StatisticsEngine::StatisticsEngine(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(a1 + 24) = 0;
  v4 = (_QWORD *)(a1 + 24);
  *(_QWORD *)a1 = &off_1E6D09A88;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 48) = *(_DWORD *)(a2 + 48);
  *(_DWORD *)(a2 + 48) = 0;
  v6 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = v5;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  std::vector<std::unique_ptr<statistics::Interval>>::__vdeallocate(v4);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  return a1;
}

uint64_t statistics::StatisticsEngine::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  _BYTE v10[8];
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  int v15;

  if (a1 != a2)
  {
    statistics::StatisticsEngine::StatisticsEngine((uint64_t)v10, a2);
    v3 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)(a1 + 48) = v15;
    v15 = v3;
    v5 = *(_QWORD *)(a1 + 8);
    v4 = *(_QWORD *)(a1 + 16);
    v6 = v12;
    *(_QWORD *)(a1 + 8) = v11;
    *(_QWORD *)(a1 + 16) = v6;
    v11 = v5;
    v12 = v4;
    v7 = *(_OWORD *)(a1 + 24);
    *(_OWORD *)(a1 + 24) = v13;
    v13 = v7;
    v8 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v14;
    v14 = v8;
    statistics::StatisticsEngine::~StatisticsEngine((statistics::StatisticsEngine *)v10);
  }
  return a1;
}

uint64_t statistics::StatisticsEngine::formatText(statistics::StatisticsEngine *this, PB::TextFormatter *a2, const char *a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_QWORD *)this + 1);
  if (v5)
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v5 + 32))(v5, a2, "currentBucket");
  if ((*((_BYTE *)this + 48) & 1) != 0)
    PB::TextFormatter::format(a2, "currentBucketIndex");
  v6 = (uint64_t *)*((_QWORD *)this + 3);
  v7 = (uint64_t *)*((_QWORD *)this + 4);
  while (v6 != v7)
  {
    v8 = *v6++;
    (*(void (**)(uint64_t, PB::TextFormatter *, const char *))(*(_QWORD *)v8 + 32))(v8, a2, "remainders");
  }
  return PB::TextFormatter::endObject(a2);
}

uint64_t statistics::StatisticsEngine::readFrom(statistics::StatisticsEngine *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t **v8;
  uint64_t v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  char v32;
  unsigned int v33;
  unint64_t v34;
  char v35;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    v8 = (uint64_t **)((char *)this + 24);
    do
    {
      v9 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v16 = 0;
        v17 = 0;
        v12 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v18 = v2 + 1;
          v19 = *(_BYTE *)(v9 + v2);
          *((_QWORD *)a2 + 1) = v18;
          v12 |= (unint64_t)(v19 & 0x7F) << v16;
          if ((v19 & 0x80) == 0)
            goto LABEL_21;
          v16 += 7;
          v2 = v18;
          v15 = v17++ > 8;
          if (v15)
            goto LABEL_32;
        }
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v14 = *(_BYTE *)(v9 + v2);
        v12 |= (unint64_t)(v14 & 0x7F) << v10;
        if ((v14 & 0x80) == 0)
          break;
        v10 += 7;
        v2 = v13;
        v15 = v11++ > 8;
        if (v15)
          goto LABEL_32;
      }
LABEL_21:
      if ((v12 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        PB::PtrVector<statistics::RawQuantitySample>::emplace_back<>(v8);
        v30 = *(_QWORD *)(*((_QWORD *)this + 4) - 8);
      }
      else
      {
        if ((_DWORD)v20 != 2)
        {
          if ((_DWORD)v20 == 1)
          {
            *((_BYTE *)this + 48) |= 1u;
            v21 = *((_QWORD *)a2 + 1);
            v22 = *((_QWORD *)a2 + 2);
            v23 = *(_QWORD *)a2;
            if (v21 > 0xFFFFFFFFFFFFFFF5 || v21 + 10 > v22)
            {
              v32 = 0;
              v33 = 0;
              v26 = 0;
              if (v22 <= v21)
                v22 = *((_QWORD *)a2 + 1);
              while (1)
              {
                if (v22 == v21)
                {
                  v26 = 0;
                  *((_BYTE *)a2 + 24) = 1;
                  goto LABEL_50;
                }
                v34 = v21 + 1;
                v35 = *(_BYTE *)(v23 + v21);
                *((_QWORD *)a2 + 1) = v34;
                v26 |= (unint64_t)(v35 & 0x7F) << v32;
                if ((v35 & 0x80) == 0)
                  break;
                v32 += 7;
                v21 = v34;
                v15 = v33++ > 8;
                if (v15)
                {
LABEL_46:
                  v26 = 0;
                  goto LABEL_50;
                }
              }
              if (*((_BYTE *)a2 + 24))
                v26 = 0;
            }
            else
            {
              v24 = 0;
              v25 = 0;
              v26 = 0;
              while (1)
              {
                v27 = v21 + 1;
                *((_QWORD *)a2 + 1) = v21 + 1;
                v28 = *(_BYTE *)(v23 + v21);
                v26 |= (unint64_t)(v28 & 0x7F) << v24;
                if ((v28 & 0x80) == 0)
                  break;
                v24 += 7;
                v21 = v27;
                v15 = v25++ > 8;
                if (v15)
                  goto LABEL_46;
              }
            }
LABEL_50:
            *((_QWORD *)this + 2) = v26;
          }
          else
          {
LABEL_32:
            result = PB::Reader::skip(a2);
            if (!(_DWORD)result)
              return result;
          }
          goto LABEL_51;
        }
        v30 = operator new();
        *(_QWORD *)v30 = &off_1E6CEA578;
        *(_QWORD *)(v30 + 48) = 0;
        *(_QWORD *)(v30 + 56) = 0;
        *(_QWORD *)(v30 + 40) = 0;
        *(_DWORD *)(v30 + 188) = 0;
        *(_OWORD *)(v30 + 80) = 0u;
        *(_OWORD *)(v30 + 96) = 0u;
        *(_OWORD *)(v30 + 112) = 0u;
        *(_OWORD *)(v30 + 128) = 0u;
        *(_OWORD *)(v30 + 144) = 0u;
        *(_OWORD *)(v30 + 160) = 0u;
        *(_QWORD *)(v30 + 176) = 0;
        v31 = *((_QWORD *)this + 1);
        *((_QWORD *)this + 1) = v30;
        if (v31)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v31 + 8))(v31);
          v30 = *((_QWORD *)this + 1);
        }
      }
      if (!PB::Reader::placeMark()
        || ((*(uint64_t (**)(uint64_t, PB::Reader *))(*(_QWORD *)v30 + 16))(v30, a2) & 1) == 0)
      {
        return 0;
      }
      PB::Reader::recallMark();
LABEL_51:
      v2 = *((_QWORD *)a2 + 1);
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
    }
    while (v2 < v3 && v4 == 0);
  }
  return v4 == 0;
}

uint64_t statistics::StatisticsEngine::writeTo(uint64_t this, PB::Writer *a2)
{
  _QWORD *v3;
  const PB::Base *v4;
  const PB::Base **v5;
  const PB::Base **v6;
  const PB::Base *v7;

  v3 = (_QWORD *)this;
  if ((*(_BYTE *)(this + 48) & 1) != 0)
    this = PB::Writer::writeVarInt(a2);
  v4 = (const PB::Base *)v3[1];
  if (v4)
    this = PB::Writer::writeSubmessage(a2, v4);
  v6 = (const PB::Base **)v3[3];
  v5 = (const PB::Base **)v3[4];
  while (v6 != v5)
  {
    v7 = *v6++;
    this = PB::Writer::writeSubmessage(a2, v7);
  }
  return this;
}

BOOL statistics::StatisticsEngine::operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 48) & 1) == 0 || *(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 48) & 1) != 0)
  {
    return 0;
  }
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    if (!v5 || !statistics::StatisticsBucket::operator==(v4, v5) && *(_QWORD *)(a1 + 8) | *(_QWORD *)(a2 + 8))
      return 0;
    return PB::PtrVector<statistics::RawQuantitySample>::operator==((uint64_t *)(a1 + 24), a2 + 24);
  }
  if (!v5)
    return PB::PtrVector<statistics::RawQuantitySample>::operator==((uint64_t *)(a1 + 24), a2 + 24);
  return 0;
}

unint64_t statistics::StatisticsEngine::hash_value(statistics::StatisticsEngine *this)
{
  uint64_t v2;
  statistics::StatisticsBucket *v3;
  unint64_t v4;
  statistics::RawQuantitySample **v5;
  statistics::RawQuantitySample **v6;
  uint64_t v7;
  statistics::RawQuantitySample *v8;

  if ((*((_BYTE *)this + 48) & 1) != 0)
    v2 = *((_QWORD *)this + 2);
  else
    v2 = 0;
  v3 = (statistics::StatisticsBucket *)*((_QWORD *)this + 1);
  if (v3)
    v4 = statistics::StatisticsBucket::hash_value(v3);
  else
    v4 = 0;
  v6 = (statistics::RawQuantitySample **)*((_QWORD *)this + 3);
  v5 = (statistics::RawQuantitySample **)*((_QWORD *)this + 4);
  if (v6 == v5)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      v8 = *v6++;
      v7 ^= statistics::RawQuantitySample::hash_value(v8);
    }
    while (v6 != v5);
  }
  return v4 ^ v2 ^ v7;
}

_QWORD *statistics::StatisticsEngine::makeCurrentBucket(_QWORD *this)
{
  _QWORD *v1;
  uint64_t v2;

  if (!this[1])
  {
    v1 = this;
    v2 = operator new();
    *(_QWORD *)v2 = &off_1E6CEA578;
    *(_QWORD *)(v2 + 48) = 0;
    *(_QWORD *)(v2 + 56) = 0;
    *(_QWORD *)(v2 + 40) = 0;
    *(_DWORD *)(v2 + 188) = 0;
    *(_OWORD *)(v2 + 80) = 0u;
    *(_OWORD *)(v2 + 96) = 0u;
    *(_OWORD *)(v2 + 112) = 0u;
    *(_OWORD *)(v2 + 128) = 0u;
    *(_OWORD *)(v2 + 144) = 0u;
    *(_OWORD *)(v2 + 160) = 0u;
    *(_QWORD *)(v2 + 176) = 0;
    this = (_QWORD *)v1[1];
    v1[1] = v2;
    if (this)
      return (_QWORD *)(*(uint64_t (**)(_QWORD *))(*this + 8))(this);
  }
  return this;
}

double HDOntologyFeatureDefaultMinimumTimeToLive()
{
  int v0;
  double result;

  v0 = objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall");
  result = 2592000.0;
  if (v0)
    return 604800.0;
  return result;
}

void sub_1B7DC9CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HDCodableUserDomainConceptCollectionReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  HDCodableUserDomainConcept *v17;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(HDCodableUserDomainConcept);
        objc_msgSend(a1, "addConcepts:", v17);
        if (!PBReaderPlaceMark() || (HDCodableUserDomainConceptReadFrom((uint64_t)v17, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HDCodableSyncStateVersionedDataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  void *v25;
  HDCodableSyncStateOrigin *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 100)
      {
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v24;

      }
      else if ((_DWORD)v17 == 2)
      {
        v26 = objc_alloc_init(HDCodableSyncStateOrigin);
        objc_storeStrong((id *)(a1 + 16), v26);
        if (!PBReaderPlaceMark() || (HDCodableSyncStateOriginReadFrom((uint64_t)v26, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_35;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_37:
        *(_DWORD *)(a1 + 24) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B7DCDC78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__164(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__164(uint64_t a1)
{

}

uint64_t HDCodableVerifiableDataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 24;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 32) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_34;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                v20 = 0;
                goto LABEL_36;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
            if (*(_BYTE *)(a2 + *v5))
              v20 = 0;
LABEL_36:
            *(_QWORD *)(a1 + 8) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 16;
      }
      v26 = *(void **)(a1 + v25);
      *(_QWORD *)(a1 + v25) = v24;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

__n128 HDStatisticsAverageSampleDuration::splitSampleAtTime@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result;
  __int128 v3;

  *(_WORD *)(a2 + 72) = 0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  return result;
}

__int128 *HDStatisticsAverageSampleDuration::splitSampleAtTime(__int128 *result, uint64_t a2, int a3, double a4)
{
  _BYTE *v4;
  double v5;
  _BOOL4 v6;
  __int128 v7;
  __int128 v8;

  v4 = result + 2;
  if (!*((_BYTE *)result + 32))
    goto LABEL_5;
  v5 = *((double *)result + 1);
  v6 = v5 <= a4;
  if (a3)
    v6 = v5 < a4;
  if (!v6)
  {
    v7 = *result;
    v8 = result[1];
    *(_WORD *)(a2 + 32) = *((_WORD *)result + 16);
    *(_OWORD *)a2 = v7;
    *(_OWORD *)(a2 + 16) = v8;
  }
  else
  {
LABEL_5:
    v4 = (_BYTE *)(a2 + 32);
  }
  *v4 = 0;
  return result;
}

uint64_t HDStatisticsAverageSampleDuration::applyMaskToSample(uint64_t result, double **a2)
{
  double *v2;
  double *v3;
  double v4;

  v2 = *a2;
  v3 = a2[1];
  if (*a2 != v3)
  {
    v4 = *(double *)(result + 8);
    while (v4 >= *v2)
    {
      if (v4 < v2[1])
      {
        *(_BYTE *)(result + 32) = 0;
        return result;
      }
      v2 += 2;
      if (v2 == v3)
        return result;
    }
  }
  return result;
}

uint64_t HDStatisticsAverageSampleDuration::addSample(uint64_t this, const HDRawQuantitySample *a2)
{
  double v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a2->var2 - a2->var1;
  v3 = *(_QWORD *)(this + 8);
  if (v3)
  {
    v4 = v3 + 1;
    v2 = *(double *)this + (v2 - *(double *)this) / (double)v4;
  }
  else
  {
    v4 = 1;
  }
  *(double *)this = v2;
  *(_QWORD *)(this + 8) = v4;
  return this;
}

__n128 HDStatisticsAverageSampleDuration::updateMostRecentSample(__n128 *this, const HDRawQuantitySample *a2)
{
  __n128 result;
  __n128 v3;

  if (!this[3].n128_u8[0] || (result.n128_u64[0] = this[1].n128_u64[1], result.n128_f64[0] <= a2->var1))
  {
    result = *(__n128 *)&a2->var0;
    v3 = *(__n128 *)&a2->var2;
    this[3].n128_u16[0] = *(_WORD *)&a2->var4;
    this[1] = result;
    this[2] = v3;
  }
  return result;
}

double HDStatisticsAverageSampleDuration::unarchive@<D0>(HDStatisticsAverageSampleDuration *this@<X0>, uint64_t a2@<X8>)
{
  double result;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_QWORD *)(a2 + 8) = *((_QWORD *)this + 3);
  result = *((double *)this + 12);
  *(double *)a2 = result;
  v4 = *((_QWORD *)this + 14);
  if (v4)
  {
    result = *(double *)(v4 + 8);
    v5 = *(_QWORD *)(v4 + 16);
    *(int8x16_t *)(a2 + 16) = vextq_s8(*(int8x16_t *)(v4 + 24), *(int8x16_t *)(v4 + 24), 8uLL);
    *(double *)(a2 + 32) = result;
    *(_QWORD *)(a2 + 40) = v5;
    *(_BYTE *)(a2 + 48) = 1;
  }
  return result;
}

void HDStatisticsAverageSampleDuration::archive(int8x16_t *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  int8x16_t v8;
  __int16 v9;
  char v10;
  int v11;

  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 112) = 0;
  v4 = (uint64_t *)(a2 + 112);
  *(_QWORD *)(a2 + 160) = 0;
  *(_QWORD *)a2 = &off_1E6CEA528;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 120) = 0;
  *(_QWORD *)(a2 + 128) = 0;
  v5 = this->i64[1];
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = v5;
  v6 = this->i64[0];
  *(_DWORD *)(a2 + 204) = 65;
  *(_QWORD *)(a2 + 96) = v6;
  statistics::Statistics::makeMostRecentDatum((_QWORD *)a2);
  v7[0] = &off_1E6CFF278;
  v11 = 127;
  v8 = vextq_s8(this[1], this[1], 8uLL);
  v7[1] = this[2].i64[0];
  v7[2] = this[2].i64[1];
  v9 = 0;
  v10 = 0;
  statistics::RawQuantitySample::operator=(*v4, (uint64_t)v7);
  PB::Base::~Base((PB::Base *)v7);
}

void sub_1B7DD0500(_Unwind_Exception *a1)
{
  statistics::Statistics *v1;

  statistics::Statistics::~Statistics(v1);
  _Unwind_Resume(a1);
}

id HDPredicateForContainerIdentifierAndDatabaseScope(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D29838];
  _HDSQLiteValueForString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("container_id"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithProperty:equalToValue:", CFSTR("database_scope"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0D29840];
  v13[0] = v5;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateMatchingAllPredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_1B7DD0EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__165(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__165(uint64_t a1)
{

}

void sub_1B7DD1AA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B7DD1C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__166(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__166(uint64_t a1)
{

}

void sub_1B7DD1E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7DD1FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7DD2174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7DD22F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7DD2474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7DD25F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_QWORD *health::VirtualFilesystem::defaultVirtualFilesystem@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v3;
  _QWORD *result;

  v3 = operator new(0x20uLL);
  v3[1] = 0;
  v3[2] = 0;
  *v3 = &off_1E6D0A388;
  a1[1] = v3;
  v3[3] = &off_1E6D0A2A8;
  result = v3 + 3;
  *a1 = result;
  return result;
}

_QWORD *health::POSIXMappedFileExtent::POSIXMappedFileExtent(_QWORD *this, uint64_t a2, uint64_t a3, void *a4)
{
  *this = &off_1E6D0A158;
  this[1] = a2;
  this[2] = a3;
  this[3] = a4;
  return this;
}

{
  *this = &off_1E6D0A158;
  this[1] = a2;
  this[2] = a3;
  this[3] = a4;
  return this;
}

void health::POSIXMappedFileExtent::~POSIXMappedFileExtent(health::POSIXMappedFileExtent *this)
{
  *(_QWORD *)this = &off_1E6D0A158;
  munmap(*((void **)this + 3), *((_QWORD *)this + 2));
}

{
  health::POSIXMappedFileExtent::~POSIXMappedFileExtent(this);
  JUMPOUT(0x1BCCAC494);
}

uint64_t health::POSIXMappedFileExtent::bytes(health::POSIXMappedFileExtent *this)
{
  return *((_QWORD *)this + 3);
}

uint64_t health::POSIXFile::POSIXFile(uint64_t this, int a2)
{
  *(_QWORD *)this = &off_1E6D0A180;
  *(_DWORD *)(this + 8) = a2;
  return this;
}

{
  *(_QWORD *)this = &off_1E6D0A180;
  *(_DWORD *)(this + 8) = a2;
  return this;
}

void health::POSIXFile::~POSIXFile(health::POSIXFile *this)
{
  *(_QWORD *)this = &off_1E6D0A180;
  health::POSIXFile::close((uint64_t)this);
}

{
  *(_QWORD *)this = &off_1E6D0A180;
  health::POSIXFile::close((uint64_t)this);
}

{
  *(_QWORD *)this = &off_1E6D0A180;
  health::POSIXFile::close((uint64_t)this);
  JUMPOUT(0x1BCCAC494);
}

void health::FormatString<int &,char *>(std::string *a1, std::string *a2, char **a3, char **a4)
{
  char **v4[2];

  v4[0] = a4;
  v4[1] = a3;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  a1->__r_.__value_.__r.__words[0] = 0;
  health::FormatImplementation<int &,char *>(a2, a1, 0, v4);
}

void sub_1B7DD4170(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void health::FormatString<unsigned long &,long long &,int &,char *>(std::string *a1, std::string *a2, char **a3, char **a4, char **a5, char **a6)
{
  char **v6[4];

  v6[0] = a6;
  v6[1] = a5;
  v6[2] = a4;
  v6[3] = a3;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  a1->__r_.__value_.__r.__words[0] = 0;
  health::FormatImplementation<unsigned long &,long long &,int &,char *>(a2, a1, 0, v6);
}

void sub_1B7DD41D4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

_QWORD *health::POSIXFile::mmap@<X0>(health::POSIXFile *this@<X0>, char *a2@<X1>, char *a3@<X2>, _QWORD *a4@<X8>)
{
  void *v7;
  void *v8;
  _QWORD *result;
  void *exception;
  uint64_t v11;
  const std::error_category *v12;
  int *v13;
  int *v14;
  char *v15;
  std::string v16;
  char *v17;
  char *v18;

  v17 = a3;
  v18 = a2;
  v7 = mmap(0, (size_t)a3, 1, 2, *((_DWORD *)this + 2), (off_t)a2);
  if (v7 == (void *)-1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    v11 = *__error();
    v12 = std::system_category();
    v13 = __error();
    v14 = __error();
    v15 = strerror(*v14);
    health::FormatString<unsigned long &,long long &,int &,char *>(&v16, (std::string *)"Error occurred attempting to mmap {0} bytes at {1}: {2} {3}", &v17, &v18, (char **)v13, &v15);
    MEMORY[0x1BCCAC2B4](exception, v11, v12, &v16);
    __cxa_throw(exception, MEMORY[0x1E0DE4E38], MEMORY[0x1E0DE4580]);
  }
  v8 = v7;
  result = operator new(0x38uLL);
  result[1] = 0;
  result[2] = 0;
  *result = &off_1E6D0A3D8;
  result[4] = a2;
  result[5] = a3;
  result[3] = &off_1E6D0A158;
  result[6] = v8;
  *a4 = result + 3;
  a4[1] = result;
  return result;
}

void sub_1B7DD430C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  __break(1u);
}

void sub_1B7DD4364()
{
  __cxa_end_catch();
  JUMPOUT(0x1B7DD436CLL);
}

void health::FormatString<long long &,int &,char *>(std::string *a1, char **a2, char **a3, char **a4)
{
  char **v4[3];

  v4[0] = a4;
  v4[1] = a3;
  v4[2] = a2;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  a1->__r_.__value_.__r.__words[0] = 0;
  health::FormatImplementation<long long &,int &,char *>((std::string *)"Error occurred while attempting to truncate file to length {0}: {1} {2}", a1, 0, v4);
}

void sub_1B7DD43C4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t health::POSIXFile::close(uint64_t this)
{
  uint64_t v1;
  int v2;
  NSObject **v3;
  NSObject *v4;
  int *v5;
  int *v6;
  NSObject **v7;
  NSObject *v8;
  int *v10;
  int *v11;
  int v12;
  int *v13;
  char *v14;
  int v15;
  int *v16;
  char *v17;
  char *v18;
  std::string v19;
  void *v20[2];
  void *v21[2];
  void *v22[2];
  std::string __p;
  void *v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  int v27;
  uint8_t buf[8];
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(this + 8) != -1)
  {
    v1 = this;
    v2 = 3;
    v27 = 3;
    while (1)
    {
      this = close(*(_DWORD *)(v1 + 8));
      if (!(_DWORD)this)
        break;
      if (*__error() != 4)
      {
        _HKInitializeLogging();
        v3 = (NSObject **)MEMORY[0x1E0CB52B0];
        v4 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
        {
          v15 = *__error();
          v16 = __error();
          v17 = strerror(*v16);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v15;
          LOWORD(v29) = 2082;
          *(_QWORD *)((char *)&v29 + 2) = v17;
          _os_log_fault_impl(&dword_1B7802000, v4, OS_LOG_TYPE_FAULT, "Unexpected errno value for file close: %d %{public}s", buf, 0x12u);
          v4 = *v3;
        }
        std::string::basic_string[abi:ne180100]<0>(v26, "false");
        std::string::basic_string[abi:ne180100]<0>(v25, "close");
        std::string::basic_string[abi:ne180100]<0>(v24, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDVirtualFilesystem.cpp");
        v5 = __error();
        v6 = __error();
        *(_QWORD *)buf = strerror(*v6);
        health::FormatString<int &,char *>(&__p, (std::string *)"Unexpected errno value for file close: {0} {1}", (char **)v5, (char **)buf);
        health::_HDAssertImplementation<std::logic_error>((uint64_t)v4, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, 137, (uint64_t)&__p);
      }
      if (!--v2)
      {
        _HKInitializeLogging();
        v7 = (NSObject **)MEMORY[0x1E0CB52B0];
        v8 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
        {
          v12 = *__error();
          v13 = __error();
          v14 = strerror(*v13);
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&buf[4] = 3;
          LOWORD(v29) = 1024;
          *(_DWORD *)((char *)&v29 + 2) = v12;
          WORD3(v29) = 2082;
          *((_QWORD *)&v29 + 1) = v14;
          _os_log_fault_impl(&dword_1B7802000, v8, OS_LOG_TYPE_FAULT, "Reached max retry count (%d) for file close: %d %{public}s", buf, 0x18u);
          v8 = *v7;
        }
        std::string::basic_string[abi:ne180100]<0>(v22, "false");
        std::string::basic_string[abi:ne180100]<0>(v21, "close");
        std::string::basic_string[abi:ne180100]<0>(v20, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDVirtualFilesystem.cpp");
        v10 = __error();
        v11 = __error();
        v18 = strerror(*v11);
        memset(&v19, 0, sizeof(v19));
        *(_QWORD *)buf = &v18;
        *(_QWORD *)&v29 = v10;
        *((_QWORD *)&v29 + 1) = &v27;
        health::FormatImplementation<int const&,int &,char *>((std::string *)"Reached max retry count ({0}) for file close: {1} {2}", &v19, 0, (char ***)buf);
        health::_HDAssertImplementation<std::logic_error>((uint64_t)v8, (uint64_t)v22, (uint64_t)v21, (uint64_t)v20, 142, (uint64_t)&v19);
      }
    }
    *(_DWORD *)(v1 + 8) = -1;
  }
  return this;
}

void sub_1B7DD4720(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45)
{
  uint64_t v45;

  if (a39 < 0)
    operator delete(__p);
  if (a45 < 0)
    operator delete(a40);
  if (*(char *)(v45 - 113) < 0)
    operator delete(*(void **)(v45 - 136));
  if (*(char *)(v45 - 89) < 0)
    operator delete(*(void **)(v45 - 112));
  _Unwind_Resume(exception_object);
}

int *health::POSIXFilesystem::open@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned int a3@<W2>, _QWORD *a4@<X8>)
{
  char v4;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int *result;
  void *exception;
  uint64_t v15;
  const std::error_category *v16;
  int *v17;
  int *v18;
  void *v19;
  uint64_t v20;
  const std::error_category *v21;
  int *v22;
  int *v23;
  char *v24;
  std::string v25;

  v4 = a3;
  v8 = a3 & 1;
  if (*(char *)(a2 + 23) >= 0)
    v9 = (const char *)a2;
  else
    v9 = *(const char **)a2;
  v10 = open(v9, (a3 >> 1) & 2 | ((a3 & 1) << 9) | (32 * ((a3 >> 1) & 1)), 384);
  if ((v10 & 0x80000000) != 0)
  {
    if (v8 || (result = __error(), *result != 2))
    {
      exception = __cxa_allocate_exception(0x20uLL);
      v15 = *__error();
      v16 = std::system_category();
      v17 = __error();
      v18 = __error();
      v24 = strerror(*v18);
      health::FormatString<std::string const&,int &,char *>(&v25, (std::string *)"Error occurred opening file at '{0}': {1} {2}", (char **)a2, (char **)v17, &v24);
      MEMORY[0x1BCCAC2B4](exception, v15, v16, &v25);
      __cxa_throw(exception, MEMORY[0x1E0DE4E38], MEMORY[0x1E0DE4580]);
    }
    *a4 = 0;
    a4[1] = 0;
  }
  else
  {
    v11 = v10;
    if (!_HDIsUnitTesting)
    {
      v12 = fcntl(v10, 63);
      if ((v12 & 0x80000000) == 0 && v12 != 2 && fcntl(v11, 64, 2) == -1)
      {
        v19 = __cxa_allocate_exception(0x20uLL);
        v20 = *__error();
        v21 = std::system_category();
        v22 = __error();
        v23 = __error();
        v24 = strerror(*v23);
        health::FormatString<std::string const&,int &,char *>(&v25, (std::string *)"Failed to set protection class when creating file at '{0}': {1} {2}", (char **)a2, (char **)v22, &v24);
        MEMORY[0x1BCCAC2B4](v19, v20, v21, &v25);
        __cxa_throw(v19, MEMORY[0x1E0DE4E38], MEMORY[0x1E0DE4580]);
      }
    }
    result = (int *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 32))(a1, v11);
    if ((~v4 & 0xC) == 0)
      return (int *)(*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)*a4 + 56))(*a4, 0);
  }
  return result;
}

void sub_1B7DD4A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;
  int v18;

  if (a17 < 0)
  {
    operator delete(__p);
    if ((v18 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v18)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v17);
  goto LABEL_6;
}

void health::FormatString<std::string const&,int &,char *>(std::string *a1, std::string *a2, char **a3, char **a4, char **a5)
{
  char **v5[3];

  v5[0] = a5;
  v5[1] = a4;
  v5[2] = a3;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  a1->__r_.__value_.__r.__words[0] = 0;
  health::FormatImplementation<std::string const&,int &,char *>(a2, a1, 0, v5);
}

void sub_1B7DD4AC4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

int *health::POSIXFilesystem::unlink(uint64_t a1, uint64_t a2)
{
  const char *v3;
  int *result;
  void *exception;
  uint64_t v6;
  const std::error_category *v7;
  int *v8;
  int *v9;
  char **v10;
  char *v11;
  std::string v12;

  if (*(char *)(a2 + 23) >= 0)
    v3 = (const char *)a2;
  else
    v3 = *(const char **)a2;
  result = (int *)unlink(v3);
  if ((_DWORD)result)
  {
    result = __error();
    if (*result != 2)
    {
      v10 = (char **)a2;
      exception = __cxa_allocate_exception(0x20uLL);
      v6 = *__error();
      v7 = std::system_category();
      v8 = __error();
      v9 = __error();
      v11 = strerror(*v9);
      health::FormatString<std::string const&,int &,char *>(&v12, (std::string *)"Error occurred unlinking file at '{0}': {1} {2}", v10, (char **)v8, &v11);
      MEMORY[0x1BCCAC2B4](exception, v6, v7, &v12);
      __cxa_throw(exception, MEMORY[0x1E0DE4E38], MEMORY[0x1E0DE4580]);
    }
  }
  return result;
}

void sub_1B7DD4BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;
  int v18;

  if (a17 < 0)
  {
    operator delete(__p);
    if ((v18 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v18)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v17);
  goto LABEL_6;
}

_QWORD *health::POSIXFilesystem::fileWithDescriptor@<X0>(int a1@<W1>, _QWORD *a2@<X8>)
{
  _QWORD *v5;
  _QWORD *result;

  v5 = operator new(0x28uLL);
  v5[1] = 0;
  v5[2] = 0;
  *v5 = &off_1E6D0A428;
  *((_DWORD *)v5 + 8) = a1;
  a2[1] = v5;
  v5[3] = &off_1E6D0A180;
  result = v5 + 3;
  *a2 = result;
  return result;
}

_QWORD *health::InMemoryMappedFileExtent::InMemoryMappedFileExtent(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  *result = &off_1E6D0A1D8;
  result[1] = a2;
  v5 = *a4;
  v4 = a4[1];
  result[2] = a3;
  result[3] = v5;
  result[4] = v4;
  if (v4)
  {
    v6 = (unint64_t *)(v4 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

{
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  *result = &off_1E6D0A1D8;
  result[1] = a2;
  v5 = *a4;
  v4 = a4[1];
  result[2] = a3;
  result[3] = v5;
  result[4] = v4;
  if (v4)
  {
    v6 = (unint64_t *)(v4 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return result;
}

void health::InMemoryMappedFileExtent::~InMemoryMappedFileExtent(health::InMemoryMappedFileExtent *this)
{
  *(_QWORD *)this = &off_1E6D0A1D8;
  std::shared_ptr<unsigned char>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
}

{
  *(_QWORD *)this = &off_1E6D0A1D8;
  std::shared_ptr<unsigned char>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
}

{
  *(_QWORD *)this = &off_1E6D0A1D8;
  std::shared_ptr<unsigned char>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  JUMPOUT(0x1BCCAC494);
}

uint64_t health::InMemoryMappedFileExtent::bytes(health::InMemoryMappedFileExtent *this)
{
  return **((_QWORD **)this + 3);
}

uint64_t health::InMemoryFile::InMemoryFile(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)result = &off_1E6D0A200;
  v2 = a2[1];
  *(_QWORD *)(result + 24) = *a2;
  *(_QWORD *)(result + 32) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  *(_DWORD *)(result + 40) = 0;
  return result;
}

{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)result = &off_1E6D0A200;
  v2 = a2[1];
  *(_QWORD *)(result + 24) = *a2;
  *(_QWORD *)(result + 32) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  *(_DWORD *)(result + 40) = 0;
  return result;
}

void *health::InMemoryFile::write(health::InMemoryFile *this, uint64_t a2, const unsigned __int8 *__src, size_t __n)
{
  int v4;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  unint64_t v17;
  char v18;
  unint64_t *v19;
  unint64_t v20;
  std::runtime_error *exception;

  v4 = *((_DWORD *)this + 10);
  if (v4 == 2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Read-only file.");
    goto LABEL_19;
  }
  if (v4 == 3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "File has been failed.");
LABEL_19:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  v9 = __n + a2;
  v10 = (unint64_t *)*((_QWORD *)this + 3);
  v11 = *v10;
  v12 = v10[1];
  v13 = v12 - *v10;
  if (__n + a2 > v13)
  {
    v14 = (v9 & 0xFFFFFFFFFFF00000) + 0x100000;
    if (v10[2] - v11 < v14)
    {
      if ((v14 & 0x8000000000000000) != 0)
        std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
      v15 = (char *)operator new((v9 & 0xFFFFFFFFFFF00000) + 0x100000);
      v16 = &v15[v13];
      if (v12 != v11)
      {
        v17 = ~v11 + v12;
        do
        {
          v18 = *(_BYTE *)--v12;
          v15[v17--] = v18;
        }
        while (v12 != v11);
        v16 = v15;
      }
      *v10 = (unint64_t)v16;
      v10[1] = (unint64_t)&v15[v13];
      v10[2] = (unint64_t)&v15[v14];
      if (v11)
        operator delete((void *)v11);
    }
    v19 = (unint64_t *)*((_QWORD *)this + 3);
    v11 = *v19;
    v20 = v19[1] - *v19;
    if (v9 <= v20)
    {
      if (v9 < v20)
        v19[1] = v11 + v9;
    }
    else
    {
      std::vector<unsigned char>::__append(v19, v9 - v20);
      v11 = **((_QWORD **)this + 3);
    }
  }
  return memcpy((void *)(v11 + a2), __src, __n);
}

void sub_1B7DD4F48(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

size_t health::InMemoryFile::read(health::InMemoryFile *this, unint64_t a2, unsigned __int8 *__dst, size_t a4)
{
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  size_t v7;
  size_t v8;
  std::runtime_error *exception;

  if (*((_DWORD *)this + 10) == 3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "File has been failed.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  v4 = **((_QWORD **)this + 3);
  v5 = *(_QWORD *)(*((_QWORD *)this + 3) + 8) - v4;
  v6 = v5 > a2;
  v7 = v5 - a2;
  if (!v6)
    return 0;
  if (v7 >= a4)
    v8 = a4;
  else
    v8 = v7;
  memcpy(__dst, (const void *)(v4 + a2), v8);
  return v8;
}

void sub_1B7DD4FEC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void health::InMemoryFile::mmap(health::InMemoryFile *this@<X0>, unint64_t a2@<X1>, size_t a3@<X2>, _QWORD *a4@<X8>)
{
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  void **v10;
  uint64_t v11;
  int64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;

  v8 = (std::__shared_weak_count *)operator new(0x30uLL);
  v8->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  v8->__shared_weak_owners_ = 0;
  v8->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6D0A478;
  v10 = (void **)&v8[1].__vftable;
  std::vector<unsigned char>::vector(&v8[1].__vftable, a3);
  v11 = **((_QWORD **)this + 3);
  v12 = *(_QWORD *)(*((_QWORD *)this + 3) + 8) - v11;
  if (v12 > a2)
  {
    if (v12 >= (uint64_t)(a3 + a2))
      v12 = a3 + a2;
    if (v12 != a2)
      memmove(*v10, (const void *)(v11 + a2), v12 - a2);
  }
  v13 = operator new(0x40uLL);
  v14 = v13;
  v13[1] = 0;
  v13[2] = 0;
  *v13 = &off_1E6D0A4C8;
  v15 = v13 + 3;
  do
    v16 = __ldxr(p_shared_owners);
  while (__stxr(v16 + 1, p_shared_owners));
  v13[3] = &off_1E6D0A1D8;
  v13[4] = a2;
  v13[5] = a3;
  v13[6] = v10;
  v13[7] = v8;
  do
    v17 = __ldxr(p_shared_owners);
  while (__stxr(v17 + 1, p_shared_owners));
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  *a4 = v15;
  a4[1] = v14;
  if (v8)
  {
    v19 = (unint64_t *)&v8->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

void sub_1B7DD5190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<unsigned char>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t health::InMemoryFile::size(health::InMemoryFile *this)
{
  std::runtime_error *exception;

  if (*((_DWORD *)this + 10) == 3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "File has been failed.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  return *(_QWORD *)(*((_QWORD *)this + 3) + 8) - **((_QWORD **)this + 3);
}

void sub_1B7DD5218(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void health::InMemoryFile::truncate(health::InMemoryFile *this, unint64_t a2)
{
  unint64_t *v2;
  unint64_t v3;
  BOOL v4;
  size_t v5;
  std::runtime_error *exception;

  if (*((_DWORD *)this + 10) == 3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "File has been failed.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  v2 = (unint64_t *)*((_QWORD *)this + 3);
  v3 = v2[1] - *v2;
  v4 = a2 >= v3;
  v5 = a2 - v3;
  if (v5 != 0 && v4)
  {
    std::vector<unsigned char>::__append(v2, v5);
  }
  else if (!v4)
  {
    v2[1] = *v2 + a2;
  }
}

void sub_1B7DD52B0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void health::InMemoryFilesystem::open(uint64_t **a1@<X0>, void **a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t **v10;
  uint64_t *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  __int128 v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  _QWORD *v37;
  std::__shared_weak_count *v38;
  __int128 v39;
  __int128 v40;

  v10 = a1 + 1;
  *(_QWORD *)&v39 = a2;
  v11 = std::__tree<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1 + 1, a2, (__int128 **)&v39);
  v12 = v11[7];
  v13 = (std::__shared_weak_count *)v11[8];
  *(_QWORD *)&v40 = v12;
  *((_QWORD *)&v40 + 1) = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  if (v12)
    goto LABEL_5;
  if ((a3 & 1) != 0)
  {
    v19 = (std::__shared_weak_count *)operator new(0x30uLL);
    v19->__shared_owners_ = 0;
    v19->__shared_weak_owners_ = 0;
    v19->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6D0A478;
    v19[1].__shared_owners_ = 0;
    v19[1].__shared_weak_owners_ = 0;
    v19[1].__vftable = 0;
    v37 = &v19[1].__vftable;
    v38 = v19;
    ((void (*)(__int128 *__return_ptr, uint64_t **, void **, uint64_t, uint64_t, _QWORD **))(*a1)[4])(&v39, a1, a2, a3, a4, &v37);
    v20 = v39;
    v39 = 0uLL;
    v40 = v20;
    if (v13)
    {
      v21 = (unint64_t *)&v13->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v23 = (std::__shared_weak_count *)*((_QWORD *)&v39 + 1);
    if (*((_QWORD *)&v39 + 1))
    {
      v24 = (unint64_t *)(*((_QWORD *)&v39 + 1) + 8);
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    v26 = v38;
    if (v38)
    {
      v27 = (unint64_t *)&v38->__shared_owners_;
      do
        v28 = __ldaxr(v27);
      while (__stlxr(v28 - 1, v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
        std::__shared_weak_count::__release_weak(v26);
      }
    }
    v29 = v40;
    if ((_QWORD)v40)
    {
      *(_QWORD *)&v39 = a2;
      v30 = std::__tree<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v10, a2, (__int128 **)&v39);
      v31 = *((_QWORD *)&v40 + 1);
      if (*((_QWORD *)&v40 + 1))
      {
        v32 = (unint64_t *)(*((_QWORD *)&v40 + 1) + 8);
        do
          v33 = __ldxr(v32);
        while (__stxr(v33 + 1, v32));
      }
      v34 = (std::__shared_weak_count *)v30[8];
      v30[7] = v29;
      v30[8] = v31;
      if (v34)
      {
        v35 = (unint64_t *)&v34->__shared_owners_;
        do
          v36 = __ldaxr(v35);
        while (__stlxr(v36 - 1, v35));
        if (!v36)
        {
          ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
          std::__shared_weak_count::__release_weak(v34);
        }
      }
      v12 = v40;
    }
    else
    {
      v12 = 0;
    }
LABEL_5:
    v16 = *((_QWORD *)&v40 + 1);
    *a5 = v12;
    a5[1] = v16;
    return;
  }
  *a5 = 0;
  a5[1] = 0;
  if (v13)
  {
    v17 = (unint64_t *)&v13->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

void sub_1B7DD5528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<unsigned char>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void health::InMemoryFilesystem::unlink(_QWORD *a1, void **a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v6;
  char v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t *v13;

  v2 = a1 + 2;
  v3 = (_QWORD *)a1[2];
  if (v3)
  {
    v6 = a1 + 2;
    do
    {
      v7 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
      if (v7 >= 0)
        v8 = v3;
      else
        v8 = v3 + 1;
      if (v7 >= 0)
        v6 = v3;
      v3 = (_QWORD *)*v8;
    }
    while (*v8);
    if (v6 != v2
      && (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (void **)v6 + 4) & 0x80) == 0)
    {
      v9 = (_QWORD *)v6[1];
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = (_QWORD *)*v9;
        }
        while (v9);
      }
      else
      {
        v11 = v6;
        do
        {
          v10 = (_QWORD *)v11[2];
          v12 = *v10 == (_QWORD)v11;
          v11 = v10;
        }
        while (!v12);
      }
      if ((_QWORD *)a1[1] == v6)
        a1[1] = v10;
      v13 = (uint64_t *)a1[2];
      --a1[3];
      std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v13, v6);
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<health::InMemoryFile>>,0>((uint64_t)(v6 + 4));
      operator delete(v6);
    }
  }
}

void health::InMemoryFilesystem::createFileForPath(uint64_t *a1@<X4>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v4 = operator new(0x48uLL);
  v5 = v4;
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_1E6D0A518;
  v6 = (char *)(v4 + 3);
  v7 = *a1;
  v8 = (std::__shared_weak_count *)a1[1];
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
    v4[3] = &off_1E6D0A200;
    v4[4] = 0;
    v4[5] = 0;
    v4[6] = v7;
    v4[7] = v8;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    *((_DWORD *)v4 + 16) = 0;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  else
  {
    v4[3] = &off_1E6D0A200;
    v4[4] = 0;
    v4[5] = 0;
    v4[6] = v7;
    v4[7] = 0;
    *((_DWORD *)v4 + 16) = 0;
  }
  *a2 = v6;
  a2[1] = v5;
}

void health::POSIXFilesystem::~POSIXFilesystem(health::POSIXFilesystem *this)
{
  JUMPOUT(0x1BCCAC494);
}

void health::InMemoryFile::~InMemoryFile(health::InMemoryFile *this)
{
  std::__shared_weak_count *v2;

  *(_QWORD *)this = &off_1E6D0A200;
  std::shared_ptr<unsigned char>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

{
  std::__shared_weak_count *v2;

  *(_QWORD *)this = &off_1E6D0A200;
  std::shared_ptr<unsigned char>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
  JUMPOUT(0x1BCCAC494);
}

void health::InMemoryFilesystem::~InMemoryFilesystem(health::InMemoryFilesystem *this)
{
  *(_QWORD *)this = &off_1E6D0A338;
  std::__tree<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>>>::destroy(*((_QWORD **)this + 2));
}

{
  *(_QWORD *)this = &off_1E6D0A338;
  std::__tree<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>>>::destroy(*((_QWORD **)this + 2));
  JUMPOUT(0x1BCCAC494);
}

void std::vector<unsigned char>::__append(unint64_t *a1, size_t a2)
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
      std::vector<std::unique_ptr<statistics::Interval>>::__throw_length_error[abi:ne180100]();
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

void std::__tree<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>>>::destroy(*a1);
    std::__tree<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>>>::destroy(a1[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<health::InMemoryFile>>,0>((uint64_t)(a1 + 4));
    operator delete(a1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<health::InMemoryFile>>,0>(uint64_t a1)
{
  std::shared_ptr<unsigned char>::~shared_ptr[abi:ne180100](a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void std::__shared_ptr_emplace<health::POSIXFilesystem>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6D0A388;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<health::POSIXFilesystem>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6D0A388;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1BCCAC494);
}

uint64_t std::__shared_ptr_emplace<health::POSIXFilesystem>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void health::FormatImplementation<int &,char *>(std::string *a1, std::string *a2, std::string::size_type a3, char ***a4)
{
  uint64_t v8;
  char v9;
  char *i;
  int v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  std::string *v16;
  char *v17;
  char *v18;
  char *v19;
  int v20;
  uint64_t v21;
  char *v22;
  int v23;
  std::runtime_error *exception;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  char *v29;
  void *__p;
  char *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v8 = 0;
  v9 = 0;
  for (i = (char *)a1; ; ++i)
  {
    v29 = i;
    if (*i == 123)
      break;
    if (!*i)
    {
      std::string::resize(a2, a3 - v8, 0);
      if (v8)
        health::CopyFormatSectionToResult(a1, a2, a3, -v8, v9 & 1);
      return;
    }
LABEL_7:
    --v8;
  }
  v11 = i[1];
  if (v11 == 123)
  {
    v29 = i + 1;
    v9 = 1;
    ++i;
    goto LABEL_7;
  }
  if (v11 == 42)
  {
    v29 = i + 2;
    v20 = i[2];
    if ((v20 - 48) > 9)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format string- missing numeric value.");
    }
    else
    {
      v21 = 0;
      v22 = i + 3;
      do
      {
        v29 = v22;
        v21 = (v20 - 48) + 10 * v21;
        v23 = *v22++;
        v20 = v23;
      }
      while ((v23 - 58) >= 0xFFFFFFF6);
      v29 = v22;
      if (*(v22 - 1) == 125)
        health::FormatterParameters<0ul,int &,char *>::formatOptionsAtIndex<int &,char *>(v21);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format options reference: Must be of form {*<index>} but no trailing '}' found.");
    }
    goto LABEL_45;
  }
  health::FormatOptions::FormatOptions((uint64_t)&v25, (const char **)&v29);
  v12 = v29;
  if (*((_QWORD *)&v25 + 1))
  {
    if (*((_QWORD *)&v25 + 1) == 1)
    {
      v13 = **a4;
      __p = v13;
      if (v13)
        v13 = (char *)strlen(v13);
      v31 = v13;
      v32 = v25;
      v33 = v26;
      v34 = v27;
      v35 = v28;
      v14 = (char *)*((_QWORD *)&v26 + 1);
      if (*((_QWORD *)&v26 + 1) <= (unint64_t)v13)
        v14 = v13;
      if ((_BYTE)v26)
        v15 = v14;
      else
        v15 = v13;
      health::FormatImplementation<int &,char *>(v29, a2, &v15[a3 - v8], a4);
      if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v16 = a2;
      else
        v16 = (std::string *)a2->__r_.__value_.__r.__words[0];
      health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,char const*>(&v25, (_BYTE *)v16 + a3 - v8, (uint64_t)&__p);
      goto LABEL_35;
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
LABEL_45:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  health::TypeFormatter<int &,void>::TypeFormatter((uint64_t)&__p, (uint64_t)a4[1], (uint64_t)&v25);
  v17 = (char *)BYTE7(v32);
  if (SBYTE7(v32) < 0)
    v17 = v31;
  v18 = (char *)*((_QWORD *)&v26 + 1);
  if (*((_QWORD *)&v26 + 1) <= (unint64_t)v17)
    v18 = v17;
  if ((_BYTE)v26)
    v17 = v18;
  health::FormatImplementation<int &,char *>(v12, a2, &v17[a3 - v8], a4);
  if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v19 = (char *)a2;
  else
    v19 = (char *)a2->__r_.__value_.__r.__words[0];
  health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,unsigned long long &>(&v25, &v19[a3 - v8], (const void **)&__p);
  if (SBYTE7(v32) < 0)
    operator delete(__p);
LABEL_35:
  if (v8)
    health::CopyFormatSectionToResult(a1, a2, a3, -v8, v9 & 1);
}

void sub_1B7DD5D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;

  __cxa_free_exception(v23);
  _Unwind_Resume(a1);
}

void health::FormatterParameters<0ul,int &,char *>::formatOptionsAtIndex<int &,char *>(uint64_t a1)
{
  std::runtime_error *v1;
  std::runtime_error *exception;

  if (a1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    v1 = exception;
    if (a1 == 1)
      std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
    else
      std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
  }
  else
  {
    v1 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v1, "Requested parameter is not an FormatOptions instance.");
  }
  __cxa_throw(v1, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1B7DD5DD4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void health::FormatImplementation<unsigned long &,long long &,int &,char *>(std::string *a1, std::string *a2, std::string::size_type a3, char ***a4)
{
  std::string::size_type v8;
  char v9;
  char *i;
  int v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  std::string *v23;
  int v24;
  uint64_t v25;
  char *v26;
  int v27;
  std::runtime_error *exception;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  char *v33;
  void *__p;
  char *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v8 = 0;
  v9 = 0;
  for (i = (char *)a1; ; ++i)
  {
    v33 = i;
    if (*i != 123)
      break;
    v11 = i[1];
    if (v11 != 123)
    {
      if (v11 != 42)
      {
        health::FormatOptions::FormatOptions((uint64_t)&v29, (const char **)&v33);
        v12 = v33;
        switch(*((_QWORD *)&v29 + 1))
        {
          case 0:
            health::TypeFormatter<unsigned long &,void>::TypeFormatter((uint64_t)&__p, (uint64_t)a4[3], (uint64_t)&v29);
            v13 = (char *)BYTE7(v36);
            if (SBYTE7(v36) < 0)
              v13 = v35;
            v14 = (char *)*((_QWORD *)&v30 + 1);
            if (*((_QWORD *)&v30 + 1) <= (unint64_t)v13)
              v14 = v13;
            if ((_BYTE)v30)
              v13 = v14;
            health::FormatImplementation<unsigned long &,long long &,int &,char *>(v12, a2, &v13[a3 + v8], a4);
            if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v15 = (char *)a2;
            else
              v15 = (char *)a2->__r_.__value_.__r.__words[0];
            goto LABEL_39;
          case 1:
            health::TypeFormatter<long long &,void>::TypeFormatter((uint64_t)&__p, (uint64_t)a4[2], (uint64_t)&v29);
            v18 = (char *)BYTE7(v36);
            if (SBYTE7(v36) < 0)
              v18 = v35;
            v19 = (char *)*((_QWORD *)&v30 + 1);
            if (*((_QWORD *)&v30 + 1) <= (unint64_t)v18)
              v19 = v18;
            if ((_BYTE)v30)
              v18 = v19;
            health::FormatImplementation<unsigned long &,long long &,int &,char *>(v12, a2, &v18[a3 + v8], a4);
            if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v15 = (char *)a2;
            else
              v15 = (char *)a2->__r_.__value_.__r.__words[0];
            goto LABEL_39;
          case 2:
            health::TypeFormatter<int &,void>::TypeFormatter((uint64_t)&__p, (uint64_t)a4[1], (uint64_t)&v29);
            v16 = (char *)BYTE7(v36);
            if (SBYTE7(v36) < 0)
              v16 = v35;
            v17 = (char *)*((_QWORD *)&v30 + 1);
            if (*((_QWORD *)&v30 + 1) <= (unint64_t)v16)
              v17 = v16;
            if ((_BYTE)v30)
              v16 = v17;
            health::FormatImplementation<unsigned long &,long long &,int &,char *>(v12, a2, &v16[a3 + v8], a4);
            if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v15 = (char *)a2;
            else
              v15 = (char *)a2->__r_.__value_.__r.__words[0];
LABEL_39:
            health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,unsigned long long &>(&v29, &v15[a3 + v8], (const void **)&__p);
            if (SBYTE7(v36) < 0)
              operator delete(__p);
            if (v8)
              goto LABEL_42;
            return;
          case 3:
            v20 = **a4;
            __p = v20;
            if (v20)
              v20 = (char *)strlen(v20);
            v35 = v20;
            v36 = v29;
            v37 = v30;
            v38 = v31;
            v39 = v32;
            v21 = (char *)*((_QWORD *)&v30 + 1);
            if (*((_QWORD *)&v30 + 1) <= (unint64_t)v20)
              v21 = v20;
            if ((_BYTE)v30)
              v22 = v21;
            else
              v22 = v20;
            health::FormatImplementation<unsigned long &,long long &,int &,char *>(v33, a2, &v22[a3 + v8], a4);
            if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v23 = a2;
            else
              v23 = (std::string *)a2->__r_.__value_.__r.__words[0];
            health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,char const*>(&v29, (_BYTE *)v23 + a3 + v8, (uint64_t)&__p);
            if (!v8)
              return;
LABEL_42:
            health::CopyFormatSectionToResult(a1, a2, a3, v8, v9 & 1);
            return;
          default:
            exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
            goto LABEL_63;
        }
      }
      v33 = i + 2;
      v24 = i[2];
      if ((v24 - 48) > 9)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Invalid format string- missing numeric value.");
      }
      else
      {
        v25 = 0;
        v26 = i + 3;
        do
        {
          v33 = v26;
          v25 = (v24 - 48) + 10 * v25;
          v27 = *v26++;
          v24 = v27;
        }
        while ((v27 - 58) >= 0xFFFFFFF6);
        v33 = v26;
        if (*(v26 - 1) == 125)
          health::FormatterParameters<0ul,unsigned long &,long long &,int &,char *>::formatOptionsAtIndex<unsigned long &,long long &,int &,char *>(v25);
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Invalid format options reference: Must be of form {*<index>} but no trailing '}' found.");
      }
LABEL_63:
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
    v33 = i + 1;
    v9 = 1;
    ++i;
LABEL_7:
    ++v8;
  }
  if (*i)
    goto LABEL_7;
  std::string::resize(a2, a3 + v8, 0);
  if (v8)
    health::CopyFormatSectionToResult(a1, a2, a3, v8, v9 & 1);
}

void sub_1B7DD61E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;

  __cxa_free_exception(v23);
  _Unwind_Resume(a1);
}

void health::FormatterParameters<0ul,unsigned long &,long long &,int &,char *>::formatOptionsAtIndex<unsigned long &,long long &,int &,char *>(uint64_t a1)
{
  std::runtime_error *exception;
  std::runtime_error *v3;

  if (!a1 || a1 == 1 || a1 == 2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
  }
  else
  {
    v3 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    exception = v3;
    if (a1 == 3)
      std::runtime_error::runtime_error(v3, "Requested parameter is not an FormatOptions instance.");
    else
      std::runtime_error::runtime_error(v3, "Parameter index out of bounds.");
  }
  __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1B7DD62E8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t health::TypeFormatter<unsigned long &,void>::TypeFormatter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  const std::ios_base *v6;
  std::ios_base::fmtflags v7;
  const std::locale::facet *v8;
  std::locale v10[2];
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[10];
  char v14;
  uint64_t v15;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v12);
  v5 = v12;
  if (*(_BYTE *)(a3 + 16))
    *(_QWORD *)((char *)&v13[2] + *(_QWORD *)(v12 - 24)) = *(_QWORD *)(a3 + 24);
  if (*(_BYTE *)(a3 + 32))
    *(_QWORD *)((char *)&v13[1] + *(_QWORD *)(v5 - 24)) = *(_QWORD *)(a3 + 40);
  v6 = (const std::ios_base *)((char *)&v13[-1] + *(_QWORD *)(v5 - 24));
  v7 = *(char *)(a3 + 52);
  if (v6[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v6);
    v8 = std::locale::use_facet(v10, MEMORY[0x1E0DE4A90]);
    ((void (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 32);
    std::locale::~locale(v10);
  }
  v6[1].__fmtflags_ = v7;
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v13, v10);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  *(_OWORD *)a1 = *(_OWORD *)&v10[0].__locale_;
  *(_QWORD *)(a1 + 16) = v11;
  v12 = *MEMORY[0x1E0DE4F60];
  *(_QWORD *)((char *)&v13[-1] + *(_QWORD *)(v12 - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  v13[0] = MEMORY[0x1E0DE4FB8] + 16;
  if (v14 < 0)
    operator delete((void *)v13[8]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1BCCAC458](&v15);
  return a1;
}

void sub_1B7DD648C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10, uint64_t a11, uint64_t a12, char a13)
{
  uint64_t v13;

  std::locale::~locale(&a10);
  std::ostringstream::~ostringstream((uint64_t)&a13);
  if (*(char *)(v13 + 23) < 0)
    operator delete(*(void **)v13);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<health::POSIXMappedFileExtent>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6D0A3D8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<health::POSIXMappedFileExtent>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6D0A3D8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1BCCAC494);
}

uint64_t std::__shared_ptr_emplace<health::POSIXMappedFileExtent>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void health::FormatImplementation<long long &,int &,char *>(std::string *a1, std::string *a2, std::string::size_type a3, char ***a4)
{
  std::string::size_type v8;
  char v9;
  char *i;
  int v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  std::string *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  int v22;
  uint64_t v23;
  char *v24;
  int v25;
  std::runtime_error *exception;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  char *v31;
  void *__p;
  char *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v8 = 0;
  v9 = 0;
  for (i = (char *)a1; ; ++i)
  {
    v31 = i;
    if (*i == 123)
      break;
    if (!*i)
    {
      std::string::resize(a2, a3 + v8, 0);
      if (v8)
        health::CopyFormatSectionToResult(a1, a2, a3, v8, v9 & 1);
      return;
    }
LABEL_7:
    ++v8;
  }
  v11 = i[1];
  if (v11 == 123)
  {
    v31 = i + 1;
    v9 = 1;
    ++i;
    goto LABEL_7;
  }
  if (v11 == 42)
  {
    v31 = i + 2;
    v22 = i[2];
    if ((v22 - 48) > 9)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format string- missing numeric value.");
    }
    else
    {
      v23 = 0;
      v24 = i + 3;
      do
      {
        v31 = v24;
        v23 = (v22 - 48) + 10 * v23;
        v25 = *v24++;
        v22 = v25;
      }
      while ((v25 - 58) >= 0xFFFFFFF6);
      v31 = v24;
      if (*(v24 - 1) == 125)
        health::FormatterParameters<0ul,long long &,int &,char *>::formatOptionsAtIndex<long long &,int &,char *>(v23);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format options reference: Must be of form {*<index>} but no trailing '}' found.");
    }
    goto LABEL_55;
  }
  health::FormatOptions::FormatOptions((uint64_t)&v27, (const char **)&v31);
  v12 = v31;
  if (*((_QWORD *)&v27 + 1))
  {
    if (*((_QWORD *)&v27 + 1) != 1)
    {
      if (*((_QWORD *)&v27 + 1) == 2)
      {
        v13 = **a4;
        __p = v13;
        if (v13)
          v13 = (char *)strlen(v13);
        v33 = v13;
        v34 = v27;
        v35 = v28;
        v36 = v29;
        v37 = v30;
        v14 = (char *)*((_QWORD *)&v28 + 1);
        if (*((_QWORD *)&v28 + 1) <= (unint64_t)v13)
          v14 = v13;
        if ((_BYTE)v28)
          v15 = v14;
        else
          v15 = v13;
        health::FormatImplementation<long long &,int &,char *>(v31, a2, &v15[a3 + v8], a4);
        if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v16 = a2;
        else
          v16 = (std::string *)a2->__r_.__value_.__r.__words[0];
        health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,char const*>(&v27, (_BYTE *)v16 + a3 + v8, (uint64_t)&__p);
        goto LABEL_45;
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
LABEL_55:
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
    health::TypeFormatter<int &,void>::TypeFormatter((uint64_t)&__p, (uint64_t)a4[1], (uint64_t)&v27);
    v20 = (char *)BYTE7(v34);
    if (SBYTE7(v34) < 0)
      v20 = v33;
    v21 = (char *)*((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1) <= (unint64_t)v20)
      v21 = v20;
    if ((_BYTE)v28)
      v20 = v21;
    health::FormatImplementation<long long &,int &,char *>(v12, a2, &v20[a3 + v8], a4);
    if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v19 = (char *)a2;
    else
      v19 = (char *)a2->__r_.__value_.__r.__words[0];
  }
  else
  {
    health::TypeFormatter<long long &,void>::TypeFormatter((uint64_t)&__p, (uint64_t)a4[2], (uint64_t)&v27);
    v17 = (char *)BYTE7(v34);
    if (SBYTE7(v34) < 0)
      v17 = v33;
    v18 = (char *)*((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1) <= (unint64_t)v17)
      v18 = v17;
    if ((_BYTE)v28)
      v17 = v18;
    health::FormatImplementation<long long &,int &,char *>(v12, a2, &v17[a3 + v8], a4);
    if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v19 = (char *)a2;
    else
      v19 = (char *)a2->__r_.__value_.__r.__words[0];
  }
  health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,unsigned long long &>(&v27, &v19[a3 + v8], (const void **)&__p);
  if (SBYTE7(v34) < 0)
    operator delete(__p);
LABEL_45:
  if (v8)
    health::CopyFormatSectionToResult(a1, a2, a3, v8, v9 & 1);
}

void sub_1B7DD6884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;

  __cxa_free_exception(v23);
  _Unwind_Resume(a1);
}

void health::FormatterParameters<0ul,long long &,int &,char *>::formatOptionsAtIndex<long long &,int &,char *>(uint64_t a1)
{
  std::runtime_error *v2;
  std::runtime_error *exception;

  if (a1 && a1 != 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    v2 = exception;
    if (a1 == 2)
      std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
    else
      std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
  }
  else
  {
    v2 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v2, "Requested parameter is not an FormatOptions instance.");
  }
  __cxa_throw(v2, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1B7DD6964(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void health::FormatImplementation<int const&,int &,char *>(std::string *a1, std::string *a2, std::string::size_type a3, char ***a4)
{
  std::string::size_type v8;
  char v9;
  char *i;
  int v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  std::string *v16;
  _QWORD *v17;
  const std::ios_base *v18;
  std::ios_base::fmtflags v19;
  const std::locale::facet *v20;
  size_t v21;
  size_t v22;
  size_t v23;
  std::string *v24;
  _BYTE *v25;
  uint64_t v26;
  unint64_t v27;
  __int128 *v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  __int128 *v33;
  size_t v34;
  unint64_t v35;
  uint64_t v36;
  __int128 *v37;
  unint64_t v38;
  _BYTE *v39;
  uint64_t v40;
  int v42;
  uint64_t v43;
  char *v44;
  int v45;
  std::runtime_error *exception;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  char *v52;
  __int128 v53;
  uint64_t v54;
  std::locale v55[2];
  uint64_t v56;
  void *v57;
  uint64_t v58;
  _OWORD v59[3];
  uint64_t v60;
  void *__p;
  char v62;
  uint64_t v63;

  v8 = 0;
  v9 = 0;
  for (i = (char *)a1; ; ++i)
  {
    v52 = i;
    if (*i == 123)
      break;
    if (!*i)
    {
      std::string::resize(a2, a3 + v8, 0);
      if (v8)
        health::CopyFormatSectionToResult(a1, a2, a3, v8, v9 & 1);
      return;
    }
LABEL_7:
    ++v8;
  }
  v11 = i[1];
  if (v11 == 123)
  {
    v52 = i + 1;
    v9 = 1;
    ++i;
    goto LABEL_7;
  }
  if (v11 == 42)
  {
    v52 = i + 2;
    v42 = i[2];
    if ((v42 - 48) > 9)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format string- missing numeric value.");
    }
    else
    {
      v43 = 0;
      v44 = i + 3;
      do
      {
        v52 = v44;
        v43 = (v42 - 48) + 10 * v43;
        v45 = *v44++;
        v42 = v45;
      }
      while ((v45 - 58) >= 0xFFFFFFF6);
      v52 = v44;
      if (*(v44 - 1) == 125)
        health::FormatterParameters<0ul,int const&,int &,char *>::formatOptionsAtIndex<int const&,int &,char *>(v43);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format options reference: Must be of form {*<index>} but no trailing '}' found.");
    }
    goto LABEL_106;
  }
  health::FormatOptions::FormatOptions((uint64_t)&v48, (const char **)&v52);
  v12 = v52;
  if (!*((_QWORD *)&v48 + 1))
  {
    v54 = 0;
    v53 = 0uLL;
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v57);
    v17 = v57;
    if ((_BYTE)v49)
      *(_QWORD *)((char *)v59 + *((_QWORD *)v57 - 3) + 8) = *((_QWORD *)&v49 + 1);
    if ((_BYTE)v50)
      *(_QWORD *)((char *)v59 + *(v17 - 3)) = *((_QWORD *)&v50 + 1);
    v18 = (const std::ios_base *)((char *)&v57 + *(v17 - 3));
    v19 = SBYTE4(v51);
    if (v18[1].__fmtflags_ == -1)
    {
      std::ios_base::getloc(v18);
      v20 = std::locale::use_facet(v55, MEMORY[0x1E0DE4A90]);
      ((void (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 32);
      std::locale::~locale(v55);
    }
    v18[1].__fmtflags_ = v19;
    std::ostream::operator<<();
    std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)&v58, v55);
    v53 = *(_OWORD *)&v55[0].__locale_;
    v57 = (void *)*MEMORY[0x1E0DE4F60];
    *(void **)((char *)&v57 + *((_QWORD *)v57 - 3)) = *(void **)(MEMORY[0x1E0DE4F60] + 24);
    v54 = v56;
    v58 = MEMORY[0x1E0DE4FB8] + 16;
    if (v62 < 0)
      operator delete(__p);
    std::streambuf::~streambuf();
    std::ostream::~ostream();
    MEMORY[0x1BCCAC458](&v63);
    v47 = SHIBYTE(v54);
    if (v54 >= 0)
      v21 = HIBYTE(v54);
    else
      v21 = *((_QWORD *)&v53 + 1);
    v22 = *((_QWORD *)&v49 + 1);
    if (*((_QWORD *)&v49 + 1) <= v21)
      v22 = v21;
    if ((_BYTE)v49)
      v23 = v22;
    else
      v23 = v21;
    health::FormatImplementation<int const&,int &,char *>(v12, a2, v23 + a3 + v8, a4);
    if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v24 = a2;
    else
      v24 = (std::string *)a2->__r_.__value_.__r.__words[0];
    v25 = (char *)v24 + a3 + v8;
    if ((_BYTE)v49)
    {
      v26 = *((_QWORD *)&v49 + 1);
      v27 = *((_QWORD *)&v49 + 1) - v21;
      if (*((_QWORD *)&v49 + 1) > v21)
      {
        if (!(_DWORD)v48)
        {
          if (v21)
          {
            if (v47 >= 0)
              v33 = &v53;
            else
              v33 = (__int128 *)v53;
            memmove((char *)v24 + a3 + v8, v33, v21);
          }
          if (v26 != v21)
          {
            v34 = (size_t)v24 + v21;
            do
            {
              *(_BYTE *)(v34 + a3 + v8) = BYTE4(v51);
              ++v34;
              --v27;
            }
            while (v27);
          }
          goto LABEL_56;
        }
        if ((_DWORD)v48 == 1)
        {
          v35 = v27 >> 1;
          if (v27 >= 2)
          {
            if (v35 <= 1)
              v36 = 1;
            else
              v36 = v27 >> 1;
            do
            {
              *v25++ = BYTE4(v51);
              --v36;
            }
            while (v36);
          }
          if (v21)
          {
            if (v47 >= 0)
              v37 = &v53;
            else
              v37 = (__int128 *)v53;
            memmove(v25, v37, v21);
          }
          if (v27 != v35)
          {
            v38 = v27 - (v27 >> 1);
            v39 = &v25[v21];
            if (v38 <= 1)
              v38 = 1;
            v40 = -(uint64_t)v38;
            do
              *v39++ = BYTE4(v51);
            while (!__CFADD__(v40++, 1));
          }
          goto LABEL_56;
        }
        if ((_DWORD)v48 != 2)
        {
LABEL_56:
          if ((SHIBYTE(v54) & 0x80000000) == 0)
            goto LABEL_70;
          v29 = (void *)v53;
LABEL_69:
          operator delete(v29);
          goto LABEL_70;
        }
        if (*((_QWORD *)&v49 + 1) != v21)
        {
          do
          {
            *v25++ = BYTE4(v51);
            --v27;
          }
          while (v27);
        }
      }
    }
    if (v21)
    {
      if (v47 >= 0)
        v28 = &v53;
      else
        v28 = (__int128 *)v53;
      memmove(v25, v28, v21);
    }
    goto LABEL_56;
  }
  if (*((_QWORD *)&v48 + 1) != 1)
  {
    if (*((_QWORD *)&v48 + 1) == 2)
    {
      v13 = **a4;
      v57 = v13;
      if (v13)
        v13 = (char *)strlen(v13);
      v58 = (uint64_t)v13;
      v59[0] = v48;
      v59[1] = v49;
      v59[2] = v50;
      v60 = v51;
      v14 = (char *)*((_QWORD *)&v49 + 1);
      if (*((_QWORD *)&v49 + 1) <= (unint64_t)v13)
        v14 = v13;
      if ((_BYTE)v49)
        v15 = v14;
      else
        v15 = v13;
      health::FormatImplementation<int const&,int &,char *>(v52, a2, &v15[a3 + v8], a4);
      if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v16 = a2;
      else
        v16 = (std::string *)a2->__r_.__value_.__r.__words[0];
      health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,char const*>(&v48, (_BYTE *)v16 + a3 + v8, (uint64_t)&v57);
      goto LABEL_70;
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
LABEL_106:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  health::TypeFormatter<int &,void>::TypeFormatter((uint64_t)&v57, (uint64_t)a4[1], (uint64_t)&v48);
  v30 = BYTE7(v59[0]);
  if (SBYTE7(v59[0]) < 0)
    v30 = v58;
  v31 = *((_QWORD *)&v49 + 1);
  if (*((_QWORD *)&v49 + 1) <= v30)
    v31 = v30;
  if ((_BYTE)v49)
    v30 = v31;
  health::FormatImplementation<int const&,int &,char *>(v12, a2, v30 + a3 + v8, a4);
  if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v32 = (char *)a2;
  else
    v32 = (char *)a2->__r_.__value_.__r.__words[0];
  health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,unsigned long long &>(&v48, &v32[a3 + v8], (const void **)&v57);
  if (SBYTE7(v59[0]) < 0)
  {
    v29 = v57;
    goto LABEL_69;
  }
LABEL_70:
  if (v8)
    health::CopyFormatSectionToResult(a1, a2, a3, v8, v9 & 1);
}

void sub_1B7DD6F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,uint64_t a22,uint64_t a23,std::locale a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  void *v32;

  __cxa_free_exception(v32);
  _Unwind_Resume(a1);
}

void health::FormatterParameters<0ul,int const&,int &,char *>::formatOptionsAtIndex<int const&,int &,char *>(uint64_t a1)
{
  std::runtime_error *v2;
  std::runtime_error *exception;

  if (a1 && a1 != 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    v2 = exception;
    if (a1 == 2)
      std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
    else
      std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
  }
  else
  {
    v2 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v2, "Requested parameter is not an FormatOptions instance.");
  }
  __cxa_throw(v2, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1B7DD7060(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void health::FormatImplementation<std::string const&,int &,char *>(std::string *a1, std::string *a2, std::string::size_type a3, char ***a4)
{
  std::string::size_type v8;
  char v9;
  char *i;
  int v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  std::string *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  int v22;
  uint64_t v23;
  char *v24;
  int v25;
  std::runtime_error *exception;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  char *v31;
  void *__p;
  char *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v8 = 0;
  v9 = 0;
  for (i = (char *)a1; ; ++i)
  {
    v31 = i;
    if (*i == 123)
      break;
    if (!*i)
    {
      std::string::resize(a2, a3 + v8, 0);
      if (v8)
        health::CopyFormatSectionToResult(a1, a2, a3, v8, v9 & 1);
      return;
    }
LABEL_7:
    ++v8;
  }
  v11 = i[1];
  if (v11 == 123)
  {
    v31 = i + 1;
    v9 = 1;
    ++i;
    goto LABEL_7;
  }
  if (v11 == 42)
  {
    v31 = i + 2;
    v22 = i[2];
    if ((v22 - 48) > 9)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format string- missing numeric value.");
    }
    else
    {
      v23 = 0;
      v24 = i + 3;
      do
      {
        v31 = v24;
        v23 = (v22 - 48) + 10 * v23;
        v25 = *v24++;
        v22 = v25;
      }
      while ((v25 - 58) >= 0xFFFFFFF6);
      v31 = v24;
      if (*(v24 - 1) == 125)
        health::FormatterParameters<0ul,std::string const&,int &,char *>::formatOptionsAtIndex<std::string const&,int &,char *>(v23);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format options reference: Must be of form {*<index>} but no trailing '}' found.");
    }
    goto LABEL_55;
  }
  health::FormatOptions::FormatOptions((uint64_t)&v27, (const char **)&v31);
  v12 = v31;
  if (*((_QWORD *)&v27 + 1))
  {
    if (*((_QWORD *)&v27 + 1) != 1)
    {
      if (*((_QWORD *)&v27 + 1) == 2)
      {
        v13 = **a4;
        __p = v13;
        if (v13)
          v13 = (char *)strlen(v13);
        v33 = v13;
        v34 = v27;
        v35 = v28;
        v36 = v29;
        v37 = v30;
        v14 = (char *)*((_QWORD *)&v28 + 1);
        if (*((_QWORD *)&v28 + 1) <= (unint64_t)v13)
          v14 = v13;
        if ((_BYTE)v28)
          v15 = v14;
        else
          v15 = v13;
        health::FormatImplementation<std::string const&,int &,char *>(v31, a2, &v15[a3 + v8], a4);
        if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v16 = a2;
        else
          v16 = (std::string *)a2->__r_.__value_.__r.__words[0];
        health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,char const*>(&v27, (_BYTE *)v16 + a3 + v8, (uint64_t)&__p);
        goto LABEL_45;
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
LABEL_55:
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
    health::TypeFormatter<int &,void>::TypeFormatter((uint64_t)&__p, (uint64_t)a4[1], (uint64_t)&v27);
    v20 = (char *)BYTE7(v34);
    if (SBYTE7(v34) < 0)
      v20 = v33;
    v21 = (char *)*((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1) <= (unint64_t)v20)
      v21 = v20;
    if ((_BYTE)v28)
      v20 = v21;
    health::FormatImplementation<std::string const&,int &,char *>(v12, a2, &v20[a3 + v8], a4);
    if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v19 = (char *)a2;
    else
      v19 = (char *)a2->__r_.__value_.__r.__words[0];
  }
  else
  {
    health::TypeFormatter<std::string &,void>::TypeFormatter((uint64_t)&__p, (uint64_t)a4[2], (uint64_t)&v27);
    v17 = (char *)BYTE7(v34);
    if (SBYTE7(v34) < 0)
      v17 = v33;
    v18 = (char *)*((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1) <= (unint64_t)v17)
      v18 = v17;
    if ((_BYTE)v28)
      v17 = v18;
    health::FormatImplementation<std::string const&,int &,char *>(v12, a2, &v17[a3 + v8], a4);
    if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v19 = (char *)a2;
    else
      v19 = (char *)a2->__r_.__value_.__r.__words[0];
  }
  health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,unsigned long long &>(&v27, &v19[a3 + v8], (const void **)&__p);
  if (SBYTE7(v34) < 0)
    operator delete(__p);
LABEL_45:
  if (v8)
    health::CopyFormatSectionToResult(a1, a2, a3, v8, v9 & 1);
}

void sub_1B7DD73E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;

  __cxa_free_exception(v23);
  _Unwind_Resume(a1);
}

void health::FormatterParameters<0ul,std::string const&,int &,char *>::formatOptionsAtIndex<std::string const&,int &,char *>(uint64_t a1)
{
  std::runtime_error *v2;
  std::runtime_error *exception;

  if (a1 && a1 != 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    v2 = exception;
    if (a1 == 2)
      std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
    else
      std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
  }
  else
  {
    v2 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v2, "Requested parameter is not an FormatOptions instance.");
  }
  __cxa_throw(v2, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1B7DD74C8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<health::POSIXFile>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6D0A428;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<health::POSIXFile>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6D0A428;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1BCCAC494);
}

uint64_t std::__shared_ptr_emplace<health::POSIXFile>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::__shared_ptr_emplace<std::vector<unsigned char>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6D0A478;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::vector<unsigned char>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6D0A478;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1BCCAC494);
}

void std::__shared_ptr_emplace<std::vector<unsigned char>>::__on_zero_shared(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
}

void std::__shared_ptr_emplace<health::InMemoryMappedFileExtent>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6D0A4C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<health::InMemoryMappedFileExtent>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6D0A4C8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1BCCAC494);
}

uint64_t std::__shared_ptr_emplace<health::InMemoryMappedFileExtent>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t *std::__tree<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, void **a2, __int128 **a3)
{
  uint64_t *v5;
  uint64_t **v6;
  uint64_t **v7;
  uint64_t **v8;
  _QWORD *v10;
  uint64_t *v11;
  __int128 *v12;
  uint64_t *v13;
  std::string *v14;
  __int128 v15;
  uint64_t *v16;
  _QWORD v18[2];
  char v19;

  v6 = a1 + 1;
  v5 = a1[1];
  v7 = a1 + 1;
  v8 = a1 + 1;
  if (!v5)
    goto LABEL_10;
  v7 = a1 + 1;
  while (1)
  {
    while (1)
    {
      v8 = (uint64_t **)v5;
      v10 = v5 + 4;
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, (void **)v5 + 4) & 0x80) == 0)
        break;
      v5 = *v8;
      v7 = v8;
      if (!*v8)
        goto LABEL_10;
    }
    if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v10, a2) & 0x80) == 0)
      break;
    v7 = v8 + 1;
    v5 = v8[1];
    if (!v5)
      goto LABEL_10;
  }
  v11 = *v7;
  if (!*v7)
  {
LABEL_10:
    v12 = *a3;
    v13 = (uint64_t *)operator new(0x48uLL);
    v18[0] = v13;
    v18[1] = v6;
    v19 = 0;
    v14 = (std::string *)(v13 + 4);
    if (*((char *)v12 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v14, *(const std::string::value_type **)v12, *((_QWORD *)v12 + 1));
    }
    else
    {
      v15 = *v12;
      v13[6] = *((_QWORD *)v12 + 2);
      *(_OWORD *)&v14->__r_.__value_.__l.__data_ = v15;
    }
    v13[7] = 0;
    v13[8] = 0;
    v19 = 1;
    *v13 = 0;
    v13[1] = 0;
    v13[2] = (uint64_t)v8;
    *v7 = v13;
    v16 = (uint64_t *)**a1;
    if (v16)
    {
      *a1 = v16;
      v13 = *v7;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v13);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    v11 = (uint64_t *)v18[0];
    v18[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,void *>>>>::reset[abi:ne180100]((uint64_t)v18);
  }
  return v11;
}

void sub_1B7DD7728(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<health::InMemoryFile>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<health::InMemoryFile>>,0>((uint64_t)v1 + 32);
    operator delete(v1);
  }
}

void std::__shared_ptr_emplace<health::InMemoryFile>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6D0A518;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<health::InMemoryFile>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E6D0A518;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1BCCAC494);
}

uint64_t std::__shared_ptr_emplace<health::InMemoryFile>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t HDCodableWorkoutConfigurationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 48) |= 1u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0)
              goto LABEL_47;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_49;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_47:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_49:
          v43 = 8;
          goto LABEL_58;
        case 2u:
          v26 = 0;
          v27 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 48) |= 2u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v30;
              v20 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v15 = v27++ >= 9;
                if (v15)
                {
                  v20 = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_53:
          v43 = 16;
          goto LABEL_58;
        case 3u:
          v32 = 0;
          v33 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 48) |= 8u;
          break;
        case 4u:
          *(_BYTE *)(a1 + 48) |= 4u;
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v40 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v40 = 0;
          }
          *(_QWORD *)(a1 + 24) = v40;
          continue;
        case 5u:
          PBReaderReadString();
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = *(void **)(a1 + 40);
          *(_QWORD *)(a1 + 40) = v41;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v34 = *v3;
        v35 = *(_QWORD *)(a2 + v34);
        v36 = v35 + 1;
        if (v35 == -1 || v36 > *(_QWORD *)(a2 + *v4))
          break;
        v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
        *(_QWORD *)(a2 + v34) = v36;
        v20 |= (unint64_t)(v37 & 0x7F) << v32;
        if ((v37 & 0x80) == 0)
          goto LABEL_55;
        v32 += 7;
        v15 = v33++ >= 9;
        if (v15)
        {
          v20 = 0;
          goto LABEL_57;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_55:
      if (*(_BYTE *)(a2 + *v5))
        v20 = 0;
LABEL_57:
      v43 = 32;
LABEL_58:
      *(_QWORD *)(a1 + v43) = v20;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HDCodableRoutineLocationRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 12) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_31:
        *(_DWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B7DDA750(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_1B7DDBA3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B7DE05A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t statistics::Interval::Interval(uint64_t this)
{
  *(_QWORD *)this = &off_1E6D0A7D0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_1E6D0A7D0;
  *(_DWORD *)(this + 24) = 0;
  return this;
}

void statistics::Interval::~Interval(statistics::Interval *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x1BCCAC494);
}

double statistics::Interval::Interval(statistics::Interval *this, const statistics::Interval *a2)
{
  char v2;
  double result;

  *(_QWORD *)this = &off_1E6D0A7D0;
  *((_DWORD *)this + 6) = 0;
  if ((*((_BYTE *)a2 + 24) & 2) != 0)
  {
    result = *((double *)a2 + 2);
    *((_BYTE *)this + 24) = 2;
    *((double *)this + 2) = result;
    v2 = 3;
    if ((*((_BYTE *)a2 + 24) & 1) == 0)
      return result;
    goto LABEL_5;
  }
  v2 = 1;
  if ((*((_BYTE *)a2 + 24) & 1) != 0)
  {
LABEL_5:
    result = *((double *)a2 + 1);
    *((_BYTE *)this + 24) = v2;
    *((double *)this + 1) = result;
  }
  return result;
}

{
  char v2;
  double result;

  *(_QWORD *)this = &off_1E6D0A7D0;
  *((_DWORD *)this + 6) = 0;
  if ((*((_BYTE *)a2 + 24) & 2) != 0)
  {
    result = *((double *)a2 + 2);
    *((_BYTE *)this + 24) = 2;
    *((double *)this + 2) = result;
    v2 = 3;
    if ((*((_BYTE *)a2 + 24) & 1) == 0)
      return result;
    goto LABEL_5;
  }
  v2 = 1;
  if ((*((_BYTE *)a2 + 24) & 1) != 0)
  {
LABEL_5:
    result = *((double *)a2 + 1);
    *((_BYTE *)this + 24) = v2;
    *((double *)this + 1) = result;
  }
  return result;
}

uint64_t statistics::Interval::operator=(uint64_t a1, uint64_t a2, double a3, double a4)
{
  char v5;
  char v6;
  int v7;
  __int128 v8;
  void (**v10)(statistics::Interval *__hidden);
  __int128 v11;
  int v12;

  if (a1 != a2)
  {
    v10 = &off_1E6D0A7D0;
    v12 = 0;
    v5 = *(_BYTE *)(a2 + 24);
    if ((v5 & 2) != 0)
    {
      a3 = *(double *)(a2 + 16);
      LOBYTE(v12) = 2;
      v6 = 3;
      if ((v5 & 1) != 0)
      {
LABEL_6:
        a4 = *(double *)(a2 + 8);
        LOBYTE(v12) = v6;
      }
    }
    else
    {
      v6 = 1;
      if ((*(_BYTE *)(a2 + 24) & 1) != 0)
        goto LABEL_6;
    }
    v7 = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(a1 + 24) = v12;
    v12 = v7;
    v8 = *(_OWORD *)(a1 + 8);
    *(double *)(a1 + 8) = a4;
    *(double *)(a1 + 16) = a3;
    v11 = v8;
    PB::Base::~Base((PB::Base *)&v10);
  }
  return a1;
}

double statistics::swap(statistics *this, statistics::Interval *a2, statistics::Interval *a3)
{
  int v3;
  uint64_t v4;
  double result;

  v3 = *((_DWORD *)this + 6);
  *((_DWORD *)this + 6) = *((_DWORD *)a2 + 6);
  *((_DWORD *)a2 + 6) = v3;
  v4 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;
  result = *((double *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((double *)a2 + 1) = result;
  return result;
}

double statistics::Interval::Interval(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = &off_1E6D0A7D0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

{
  double result;

  *(_QWORD *)a1 = &off_1E6D0A7D0;
  *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
  *(_DWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  result = *(double *)(a2 + 8);
  *(double *)(a1 + 8) = result;
  return result;
}

uint64_t statistics::Interval::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  __int128 v4;
  __int128 v5;
  void (**v7)(statistics::Interval *__hidden);
  __int128 v8;
  int v9;

  if (a1 != a2)
  {
    v7 = &off_1E6D0A7D0;
    v3 = *(_DWORD *)(a2 + 24);
    *(_DWORD *)(a2 + 24) = 0;
    v9 = *(_DWORD *)(a1 + 24);
    v4 = *(_OWORD *)(a1 + 8);
    v5 = *(_OWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 24) = v3;
    *(_OWORD *)(a1 + 8) = v5;
    v8 = v4;
    PB::Base::~Base((PB::Base *)&v7);
  }
  return a1;
}

uint64_t statistics::Interval::formatText(statistics::Interval *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 24);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "end", *((double *)this + 1));
    v5 = *((_BYTE *)this + 24);
  }
  if ((v5 & 2) != 0)
    PB::TextFormatter::format(a2, "start", *((double *)this + 2));
  return PB::TextFormatter::endObject(a2);
}

uint64_t statistics::Interval::readFrom(statistics::Interval *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 < v3 && v4 == 0)
  {
    do
    {
      v8 = *(_QWORD *)a2;
      if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
      {
        v15 = 0;
        v16 = 0;
        v11 = 0;
        if (v2 > v3)
          v3 = v2;
        while (v3 != v2)
        {
          v17 = v2 + 1;
          v18 = *(_BYTE *)(v8 + v2);
          *((_QWORD *)a2 + 1) = v17;
          v11 |= (unint64_t)(v18 & 0x7F) << v15;
          if ((v18 & 0x80) == 0)
            goto LABEL_20;
          v15 += 7;
          v2 = v17;
          v14 = v16++ > 8;
          if (v14)
            goto LABEL_26;
        }
        v4 = 1;
        *((_BYTE *)a2 + 24) = 1;
        return v4 == 0;
      }
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = v2 + 1;
        *((_QWORD *)a2 + 1) = v2 + 1;
        v13 = *(_BYTE *)(v8 + v2);
        v11 |= (unint64_t)(v13 & 0x7F) << v9;
        if ((v13 & 0x80) == 0)
          break;
        v9 += 7;
        v2 = v12;
        v14 = v10++ > 8;
        if (v14)
          goto LABEL_26;
      }
LABEL_20:
      if ((v11 & 7) == 4)
      {
        v4 = 0;
        return v4 == 0;
      }
      if ((v11 >> 3) == 2)
      {
        *((_BYTE *)this + 24) |= 1u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)a2 + 2))
          goto LABEL_30;
        *((_QWORD *)this + 1) = *(_QWORD *)(*(_QWORD *)a2 + v2);
      }
      else
      {
        if ((v11 >> 3) != 1)
        {
LABEL_26:
          result = PB::Reader::skip(a2);
          if (!(_DWORD)result)
            return result;
          v2 = *((_QWORD *)a2 + 1);
          goto LABEL_33;
        }
        *((_BYTE *)this + 24) |= 2u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)a2 + 2))
        {
LABEL_30:
          *((_BYTE *)a2 + 24) = 1;
          goto LABEL_33;
        }
        *((_QWORD *)this + 2) = *(_QWORD *)(*(_QWORD *)a2 + v2);
      }
      v2 = *((_QWORD *)a2 + 1) + 8;
      *((_QWORD *)a2 + 1) = v2;
LABEL_33:
      v3 = *((_QWORD *)a2 + 2);
      v4 = *((unsigned __int8 *)a2 + 24);
    }
    while (v2 < v3 && !*((_BYTE *)a2 + 24));
  }
  return v4 == 0;
}

uint64_t statistics::Interval::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  v4 = *(_BYTE *)(this + 24);
  if ((v4 & 2) != 0)
  {
    this = PB::Writer::write(a2, *(double *)(this + 16));
    v4 = *(_BYTE *)(v3 + 24);
  }
  if ((v4 & 1) != 0)
    return PB::Writer::write(a2, *(double *)(v3 + 8));
  return this;
}

BOOL statistics::Interval::operator==(uint64_t a1, uint64_t a2)
{
  _BOOL8 v2;

  if ((*(_BYTE *)(a1 + 24) & 2) != 0)
  {
    if ((*(_BYTE *)(a2 + 24) & 2) == 0 || *(double *)(a1 + 16) != *(double *)(a2 + 16))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 24) & 2) != 0)
  {
    return 0;
  }
  v2 = (*(_BYTE *)(a2 + 24) & 1) == 0;
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
    return (*(_BYTE *)(a2 + 24) & 1) != 0 && *(double *)(a1 + 8) == *(double *)(a2 + 8);
  return v2;
}

uint64_t statistics::Interval::hash_value(statistics::Interval *this)
{
  double v1;
  double v2;

  if ((*((_BYTE *)this + 24) & 2) != 0)
  {
    v1 = *((double *)this + 2);
    if (v1 == 0.0)
      v1 = 0.0;
    if ((*((_BYTE *)this + 24) & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v2 = 0.0;
    return *(_QWORD *)&v2 ^ *(_QWORD *)&v1;
  }
  v1 = 0.0;
  if ((*((_BYTE *)this + 24) & 1) == 0)
    goto LABEL_9;
LABEL_3:
  v2 = *((double *)this + 1);
  if (v2 == 0.0)
    v2 = 0.0;
  return *(_QWORD *)&v2 ^ *(_QWORD *)&v1;
}

void sub_1B7DE7108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__167(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__167(uint64_t a1)
{

}

void sub_1B7DE7DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__168(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__168(uint64_t a1)
{

}

void sub_1B7DE8084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7DE8248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7DE8560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7DE8878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7DE8C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7DE9238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7DE9574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7DEAA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7DEB3C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t health::DataStore::DataStore(uint64_t a1, __int128 *a2)
{
  _QWORD v3[2];

  v3[0] = 0;
  v3[1] = 0;
  return health::DataStore::DataStore(a1, a2, v3, 0);
}

{
  _QWORD v3[2];

  v3[0] = 0;
  v3[1] = 0;
  return health::DataStore::DataStore(a1, a2, v3, 0);
}

void sub_1B7DEBCDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<unsigned char>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t health::DataStore::DataStore(uint64_t a1, __int128 *a2, _QWORD *a3, int a4)
{
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v15[2];
  _QWORD v16[3];
  _QWORD *v17;
  _QWORD v18[3];
  _QWORD *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (std::__shared_weak_count *)a3[1];
  v15[0] = *a3;
  v15[1] = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  health::BlockAccessFile::BlockAccessFile(a1, a2, v15, a4);
  if (v5)
  {
    v8 = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  *(_OWORD *)(a1 + 864) = 0u;
  v18[0] = &off_1E6D0ABF0;
  v18[1] = a1;
  v19 = v18;
  health::BlockAccessFile::performReadTransactionWithLambda(a1, (uint64_t)v18);
  v10 = v19;
  if (v19 == v18)
  {
    v11 = 4;
    v10 = v18;
  }
  else
  {
    if (!v19)
      goto LABEL_14;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_14:
  if (!*(_QWORD *)(a1 + 864))
  {
    v16[0] = &off_1E6D0AC70;
    v16[1] = a1;
    v17 = v16;
    health::BlockAccessFile::performWriteTransactionWithLambda(a1, (uint64_t)v16);
    v12 = v17;
    if (v17 == v16)
    {
      v13 = 4;
      v12 = v16;
      goto LABEL_19;
    }
    if (v17)
    {
      v13 = 5;
LABEL_19:
      (*(void (**)(void))(*v12 + 8 * v13))();
    }
  }
  return a1;
}

void sub_1B7DEBE58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char *a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
  health::TransactionalFile *v19;
  char *v20;
  char *v22;
  uint64_t v23;

  v22 = a15;
  if (a15 == v20)
  {
    v23 = 4;
    v22 = &a12;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v23 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v22 + 8 * v23))();
LABEL_6:
  health::TransactionalFile::~TransactionalFile(v19);
  _Unwind_Resume(a1);
}

void sub_1B7DEBEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<unsigned char>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *health::DataStore::performReadTransactionWithLambda(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;
  _QWORD v4[3];
  _QWORD *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4[0] = &off_1E6D0AD00;
  v4[1] = a1;
  v4[2] = a2;
  v5 = v4;
  health::BlockAccessFile::performReadTransactionWithLambda(a1, (uint64_t)v4);
  result = v5;
  if (v5 == v4)
  {
    v3 = 4;
    result = v4;
  }
  else
  {
    if (!v5)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void sub_1B7DEBFA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t health::DataStore::checkIntegrity(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v9[3];
  _QWORD *v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11[0] = &off_1E6D0AE00;
  v11[1] = a2;
  v12 = v11;
  health::BlockAccessFile::checkIntegrity(a1, (uint64_t)v11);
  v4 = v12;
  if (v12 == v11)
  {
    v5 = 4;
    v4 = v11;
  }
  else
  {
    if (!v12)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_6:
  v9[0] = &off_1E6D0AE90;
  v9[1] = a1;
  v9[2] = a2;
  v10 = v9;
  health::BlockAccessFile::performReadTransactionWithLambda(a1, (uint64_t)v9);
  v6 = v10;
  if (v10 == v9)
  {
    v7 = 4;
    v6 = v9;
    goto LABEL_10;
  }
  if (v10)
  {
    v7 = 5;
LABEL_10:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }
  return 1;
}

void sub_1B7DEC0D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, uint64_t a18, uint64_t a19, char *a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  char *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v27 = a20;
  if (a20 == &a17)
  {
    v28 = 4;
    v27 = &a17;
  }
  else
  {
    if (!a20)
      goto LABEL_6;
    v28 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v27 + 8 * v28))();
LABEL_6:
  if (a2 == 1)
  {
    v29 = (uint64_t *)__cxa_begin_catch(exception_object);
    v30 = *v29;
    a10 = *(_QWORD *)(*(_QWORD *)(*v29 - 8) + 8) & 0x7FFFFFFFFFFFFFFFLL;
    a9 = (*(uint64_t (**)(void))(v30 + 16))();
    health::FormatString<char const*,char const*>((std::string *)&__p, (const char **)&a10, (const char **)&a9);
    v31 = *(_QWORD *)(v24 + 24);
    if (v31)
    {
      (*(void (**)(uint64_t, void **))(*(_QWORD *)v31 + 48))(v31, &__p);
      if (a16 < 0)
        operator delete(__p);
      __cxa_end_catch();
      JUMPOUT(0x1B7DEC0A8);
    }
    std::__throw_bad_function_call[abi:ne180100]();
  }
  _Unwind_Resume(exception_object);
}

void health::FormatString<char const*,char const*>(std::string *a1, const char **a2, const char **a3)
{
  const char **v3[2];

  v3[0] = a3;
  v3[1] = a2;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  a1->__r_.__value_.__r.__words[0] = 0;
  health::FormatImplementation<char const*,char const*>((std::string *)"Integrity checking failed due to caught exception: {0} {1}", a1, 0, v3);
}

void sub_1B7DEC248(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

_QWORD *health::DataStore::rebuildIndex(health::DataStore *this)
{
  _QWORD *result;
  uint64_t v2;
  _QWORD v3[3];
  _QWORD *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3[0] = &off_1E6D0AF10;
  v3[1] = this;
  v4 = v3;
  health::BlockAccessFile::performWriteTransactionWithLambda((uint64_t)this, (uint64_t)v3);
  result = v4;
  if (v4 == v3)
  {
    v2 = 4;
    result = v3;
  }
  else
  {
    if (!v4)
      return result;
    v2 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v2))();
}

void sub_1B7DEC2F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

_QWORD *health::DataStore::enumerateObjectTreeForInspecting(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;
  _QWORD v4[3];
  _QWORD *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4[0] = &off_1E6D0B020;
  v4[1] = a1;
  v4[2] = a2;
  v5 = v4;
  health::BlockAccessFile::performReadTransactionWithLambda(a1, (uint64_t)v4);
  result = v5;
  if (v5 == v4)
  {
    v3 = 4;
    result = v4;
  }
  else
  {
    if (!v5)
      return result;
    v3 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v3))();
}

void sub_1B7DEC3C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v14;
  uint64_t v15;

  v14 = a13;
  if (a13 == &a10)
  {
    v15 = 4;
    v14 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v15 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v14 + 8 * v15))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void health::DataStore::checkIntegrityForInspecting(uint64_t a1, uint64_t a2)
{
  size_t size;
  void **v5;
  std::string *v6;
  std::string *v7;
  int v8;
  off_t st_size;
  const char *v10;
  int v11;
  uint64_t v12;
  off_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  std::string __p;
  stat v21;
  uint64_t v22;
  stat v23;
  void *v24[2];
  char v25;
  std::string v26;
  uint64_t v27[2];
  _BYTE v28[24];
  _BYTE *v29;
  _QWORD v30[3];
  _QWORD *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*(char *)(a1 + 327) < 0)
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)(a1 + 304), *(_QWORD *)(a1 + 312));
  else
    v26 = *(std::string *)(a1 + 304);
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
  else
    size = v26.__r_.__value_.__l.__size_;
  v5 = v24;
  std::string::basic_string[abi:ne180100]((uint64_t)v24, size + 4);
  if (v25 < 0)
    v5 = (void **)v24[0];
  if (size)
  {
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v6 = &v26;
    else
      v6 = (std::string *)v26.__r_.__value_.__r.__words[0];
    memmove(v5, v6, size);
  }
  strcpy((char *)v5 + size, "-wal");
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v7 = &v26;
  else
    v7 = (std::string *)v26.__r_.__value_.__r.__words[0];
  v8 = stat((const char *)v7, &v23);
  st_size = v23.st_size;
  if (v25 >= 0)
    v10 = (const char *)v24;
  else
    v10 = (const char *)v24[0];
  v11 = stat(v10, &v21);
  if (v8)
    v12 = -1;
  else
    v12 = st_size;
  v13 = v21.st_size;
  if (v11)
    v13 = 0;
  v14 = v13 + v12;
  v22 = v14;
  if (v14 < 0)
  {
    v27[0] = (uint64_t)__error();
    v27[1] = (uint64_t)&v26;
    memset(&__p, 0, sizeof(__p));
    health::FormatImplementation<std::string &,int &>((std::string *)"HFD file [{0}] size cannot be determined (error {1}).", &__p, 0, v27);
    std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>::operator()(*(_QWORD *)(a2 + 24), 0, 0, 0, (uint64_t)&__p);
  }
  else
  {
    if (v14)
      goto LABEL_31;
    health::FormatString<std::string &>(&__p, (std::string *)"HFD file [{0}] is empty.", (uint64_t)&v26);
    std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>::operator()(*(_QWORD *)(a2 + 24), 0, 0, 0, (uint64_t)&__p);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_31:
  v30[0] = &off_1E6D0B0A0;
  v30[1] = a2;
  v31 = v30;
  health::BlockAccessFile::checkIntegrity(a1, (uint64_t)v30);
  v15 = v31;
  if (v31 == v30)
  {
    v16 = 4;
    v15 = v30;
  }
  else
  {
    if (!v31)
      goto LABEL_36;
    v16 = 5;
  }
  (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_36:
  v29 = 0;
  v17 = operator new(0x20uLL);
  *v17 = &off_1E6D0B120;
  v17[1] = a1;
  v17[2] = &v22;
  v17[3] = a2;
  v29 = v17;
  health::BlockAccessFile::performWriteTransactionWithLambda(a1, (uint64_t)v28);
  v18 = v29;
  if (v29 == v28)
  {
    v19 = 4;
    v18 = v28;
  }
  else
  {
    if (!v29)
      goto LABEL_41;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_41:
  if (v25 < 0)
    operator delete(v24[0]);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
}

void sub_1B7DEC6B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v15 - 161) < 0)
    operator delete(*(void **)(v15 - 184));
  if (*(char *)(v15 - 137) < 0)
    operator delete(*(void **)(v15 - 160));
  _Unwind_Resume(exception_object);
}

uint64_t std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>::operator()(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v6;
  _QWORD v7[2];

  v7[0] = a3;
  v7[1] = a4;
  v6 = a2;
  if (!a1)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, int *, _QWORD *, uint64_t))(*(_QWORD *)a1 + 48))(a1, &v6, v7, a5);
}

void health::FormatString<std::string &>(std::string *a1, std::string *a2, uint64_t a3)
{
  uint64_t v3;

  v3 = a3;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  a1->__r_.__value_.__r.__words[0] = 0;
  health::FormatImplementation<std::string &>(a2, a1, 0, &v3);
}

void sub_1B7DEC7F4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void health::DataStore::_checkBlockIntegrity(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  std::string __p;
  uint64_t v16;
  uint64_t v17;

  v16 = a3;
  v17 = a4;
  if (a4 + a3 > a6)
  {
    health::FormatString<std::string &>(&__p, (std::string *)"HFD block [{0}] is not strictly within file bounds.", a5);
    std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>::operator()(*(_QWORD *)(a7 + 24), 2, a3, a4, (uint64_t)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (health::BlockAccessFile::isBlockUsingFreeSpace(a1, (uint64_t)&v16, a2))
  {
    v13 = v16;
    v14 = v17;
    health::FormatString<std::string &>(&__p, (std::string *)"HFD block [{0}] is using space that is marked free.", a5);
    std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>::operator()(*(_QWORD *)(a7 + 24), 3, v13, v14, (uint64_t)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_1B7DEC8F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *health::DataStore::ReadTransaction::ReadTransaction(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *result = 0;
  result[1] = 0;
  result[2] = a4;
  result[3] = a4;
  result[4] = a2;
  result[5] = a3;
  return result;
}

{
  *result = 0;
  result[1] = 0;
  result[2] = a4;
  result[3] = a4;
  result[4] = a2;
  result[5] = a3;
  return result;
}

void health::DataStore::ReadTransaction::_pointerForObject(health::DataStore::ReadTransaction *this@<X0>, ObjectIdentifier *a2@<X1>, uint64_t a3@<X8>)
{
  _OWORD v4[2];
  char v5;
  __int128 v6;
  health::DataStore::ReadTransaction *v7;

  v6 = *((_OWORD *)this + 2);
  v7 = this;
  health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::valueForKey<health::DataStore::ObjectIdentifier>((uint64_t *)&v6, a2, 0, v4);
  if (v5)
  {
    *(_OWORD *)a3 = *(_OWORD *)(health::Optional<health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::LookupResult>::operator->((uint64_t)v4)
                              + 16);
    *(_BYTE *)(a3 + 16) = 1;
  }
  else
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_BYTE *)(a3 + 16) = 0;
  }
}

BOOL health::DataStore::ReadTransaction::retrieveBytesWithIdentifier(uint64_t **this, health::RawBuffer *a2, ObjectIdentifier *a3)
{
  int v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  _BYTE v12[16];
  unsigned __int8 v13;

  health::DataStore::ReadTransaction::_pointerForObject((health::DataStore::ReadTransaction *)this, a3, (uint64_t)v12);
  v5 = v13;
  if (v13)
  {
    v6 = this[3];
    v7 = (uint64_t *)health::Optional<health::BlockPointer>::get((uint64_t)v12);
    v8 = *v7;
    v9 = v7[1];
    health::RawBuffer::RawBuffer(v11, *(unsigned __int8 **)a2, *((_QWORD *)a2 + 1));
    health::BlockAccessFile::ReadTransaction::retrieveBlock(v6, v8, v9, (uint64_t)v11);
  }
  return v5 != 0;
}

uint64_t health::DataStore::ReadTransaction::objectExistsForIdentifier(health::DataStore::ReadTransaction *this, ObjectIdentifier *a2)
{
  __int128 v3;
  unsigned __int8 v4;
  __int128 v5;
  health::DataStore::ReadTransaction *v6;

  v5 = *((_OWORD *)this + 2);
  v6 = this;
  health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::valueForKey<health::DataStore::ObjectIdentifier>((uint64_t *)&v5, a2, 0, &v3);
  return v4;
}

_QWORD *health::DataStore::ReadTransaction::enumerateIdentifiersForObjectType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7[2];
  _QWORD v8[2];
  uint64_t v9[3];
  _BYTE v10[552];

  v4 = *(_QWORD *)(a1 + 40);
  v9[0] = *(_QWORD *)(a1 + 32);
  v9[1] = v4;
  v9[2] = a1;
  v8[0] = a2;
  v8[1] = 0;
  v7[0] = a2;
  v7[1] = -1;
  v6 = a3;
  bzero(v10, 0x223uLL);
  health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(*(uint64_t **)(a1 + 16), v9[0], v4, (uint64_t)v10);
  return health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateValuesInRange<health::DataStore::ReadTransaction::enumerateIdentifiersForObjectType(long long,std::function<void ()(health::DataStore::ObjectIdentifier)>)::$_0>(v9, 0, (uint64_t)v10, &v6, v8, v7);
}

uint64_t health::DataStore::WriteTransaction::WriteTransaction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v5;
  __int128 v6;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = a4;
  *(_QWORD *)(a1 + 24) = a4;
  *(_QWORD *)(a1 + 32) = a2;
  *(_QWORD *)(a1 + 40) = a3;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = a4;
  *(_QWORD *)(a1 + 72) = a4;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)a4;
  v5 = *(_OWORD *)(a4 + 16);
  v6 = *(_OWORD *)(a4 + 32);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a4 + 48);
  *(_OWORD *)(a1 + 96) = v5;
  *(_OWORD *)(a1 + 112) = v6;
  std::deque<health::BlockPointer>::deque((char **)(a1 + 136), (_QWORD *)(a4 + 56));
  return a1;
}

{
  __int128 v5;
  __int128 v6;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = a4;
  *(_QWORD *)(a1 + 24) = a4;
  *(_QWORD *)(a1 + 32) = a2;
  *(_QWORD *)(a1 + 40) = a3;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = a4;
  *(_QWORD *)(a1 + 72) = a4;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)a4;
  v5 = *(_OWORD *)(a4 + 16);
  v6 = *(_OWORD *)(a4 + 32);
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a4 + 48);
  *(_OWORD *)(a1 + 96) = v5;
  *(_OWORD *)(a1 + 112) = v6;
  std::deque<health::BlockPointer>::deque((char **)(a1 + 136), (_QWORD *)(a4 + 56));
  return a1;
}

uint64_t health::DataStore::WriteTransaction::storeBytesWithIdentifier(health::DataStore::WriteTransaction *this, const void *a2, unint64_t a3, __n128 *a4)
{
  uint64_t v7;
  health::BlockAccessFile::WriteTransaction *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  health::BlockAccessFile::WriteTransaction *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  const void *v18;
  unint64_t v19;
  __n128 v20;
  _OWORD v21[2];
  char v22;
  __int128 v23;
  char *v24;

  v18 = a2;
  v19 = a3;
  v23 = *((_OWORD *)this + 2);
  v24 = (char *)this + 48;
  health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::valueForKey<health::DataStore::ObjectIdentifier>((uint64_t *)&v23, a4, 0, v21);
  if (v22)
  {
    v7 = *(_QWORD *)(health::Optional<health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::LookupResult>::operator->((uint64_t)v21)
                   + 24);
    v8 = (health::DataStore::WriteTransaction *)((char *)this + 80);
    v9 = health::Optional<health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::LookupResult>::operator->((uint64_t)v21);
    v10 = *(_QWORD *)(v9 + 16);
    v11 = *(_QWORD *)(v9 + 24);
    if (v7 == v19)
      return health::BlockAccessFile::WriteTransaction::updateObject<health::ByteRange<void const,unsigned long long>>((uint64_t)v8, v10, v11, (uint64_t)&v18);
    health::BlockAccessFile::WriteTransaction::freeBlock((uint64_t)v8, v10, v11);
    v14 = v19;
    v13 = v8;
  }
  else
  {
    v8 = (health::DataStore::WriteTransaction *)((char *)this + 80);
    v13 = v8;
    v14 = a3;
  }
  v15 = health::BlockAccessFile::WriteTransaction::_requestBlockOfLength(v13, v14);
  v17 = v16;
  health::BlockAccessFile::WriteTransaction::updateObject<health::ByteRange<void const,unsigned long long>>((uint64_t)v8, v15, v16, (uint64_t)&v18);
  v20.n128_u64[0] = v15;
  v20.n128_u64[1] = v17;
  return health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::setValueForKey((uint64_t *)&v23, a4, &v20);
}

void health::DataStore::WriteTransaction::removeObjectWithIdentifier(health::DataStore::WriteTransaction *this, ObjectIdentifier *a2)
{
  uint64_t v4;
  _OWORD v5[2];
  char v6;
  __int128 v7;
  char *v8;

  v7 = *((_OWORD *)this + 2);
  v8 = (char *)this + 48;
  health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::valueForKey<health::DataStore::ObjectIdentifier>((uint64_t *)&v7, a2, 0, v5);
  if (v6)
  {
    v4 = health::Optional<health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::LookupResult>::operator->((uint64_t)v5);
    health::BlockAccessFile::WriteTransaction::freeBlock((uint64_t)this + 80, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
    health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::removeValueForKey((uint64_t *)&v7, a2);
  }
}

BOOL health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::removeValueForKey(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  _BYTE v6[552];

  v4 = a1[2];
  bzero(v6, 0x223uLL);
  health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(*(uint64_t **)(v4 + 24), *a1, a1[1], (uint64_t)v6);
  return health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_removeValueForKey((uint64_t)a1, 0, a2, a1, (uint64_t)v6) != 2;
}

BOOL health::DataStore::WriteTransaction::renameObjectWithIdentifier(health::DataStore::WriteTransaction *this, ObjectIdentifier *a2, __n128 *a3)
{
  __n128 *v5;
  std::logic_error *exception;
  struct type_info *v8;
  void (*v9)(void *);
  __int128 v10;
  char v11;
  _OWORD v12[2];
  char v13;
  __int128 v14;
  char *v15;

  v14 = *((_OWORD *)this + 2);
  v15 = (char *)this + 48;
  health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::valueForKey<health::DataStore::ObjectIdentifier>((uint64_t *)&v14, a2, 0, v12);
  if (!v13)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::out_of_range::out_of_range[abi:ne180100](exception, "Existing object not found when attempting to rename.");
    v8 = (struct type_info *)off_1E6CE6210;
    v9 = (void (*)(void *))MEMORY[0x1E0DE42E0];
    goto LABEL_6;
  }
  health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::valueForKey<health::DataStore::ObjectIdentifier>((uint64_t *)&v14, a3, 0, &v10);
  if (v11)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Attempt to rename an object would result in a collision.");
    v8 = (struct type_info *)MEMORY[0x1E0DE4E70];
    v9 = (void (*)(void *))MEMORY[0x1E0DE42A0];
LABEL_6:
    __cxa_throw(exception, v8, v9);
  }
  v5 = (__n128 *)health::Optional<health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::LookupResult>::operator->((uint64_t)v12);
  health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::setValueForKey((uint64_t *)&v14, a3, v5 + 1);
  return health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::removeValueForKey((uint64_t *)&v14, a2);
}

void sub_1B7DECE54(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *health::operator<<(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"{", 1);
  v1 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v1, (uint64_t)", ", 2);
  v2 = (_QWORD *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)"}", 1);
}

void std::__function::__func<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_0,std::allocator<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::~__func()
{
  JUMPOUT(0x1BCCAC494);
}

_QWORD *std::__function::__func<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_0,std::allocator<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E6D0ABF0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_0,std::allocator<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E6D0ABF0;
  a2[1] = v2;
  return result;
}

double std::__function::__func<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_0,std::allocator<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  double result;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v2 = *(_QWORD *)(a1 + 8);
  v4 = 0x348424146;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v5 = 68;
  v6 = 68;
  health::TransactionalFile::ReadTransaction::readObjectAtOffset<health::BlockAccessFile::BlockAccessFileHeader>(*a2, (uint64_t)&v4, 0);
  result = *(double *)&v8;
  *(_OWORD *)(v2 + 864) = v8;
  return result;
}

uint64_t std::__function::__func<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_0,std::allocator<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_0,std::allocator<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::target_type()
{
}

void std::__function::__func<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_1,std::allocator<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_1>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::~__func()
{
  JUMPOUT(0x1BCCAC494);
}

_QWORD *std::__function::__func<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_1,std::allocator<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_1>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E6D0AC70;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_1,std::allocator<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_1>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E6D0AC70;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_1,std::allocator<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_1>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[552];

  v3 = *(_QWORD *)(a1 + 8);
  bzero(v8, 0x223uLL);
  v4 = health::BlockAccessFile::WriteTransaction::_requestBlockOfLength((health::BlockAccessFile::WriteTransaction *)a2, 547);
  v6 = v5;
  health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(a2, v4, v5, (uint64_t)v8);
  *(_QWORD *)(v3 + 864) = v4;
  *(_QWORD *)(v3 + 872) = v6;
  *(_OWORD *)(*(_QWORD *)(a2 + 24) + 40) = *(_OWORD *)(v3 + 864);
  health::TransactionalFile::WriteTransaction::storeObjectAtOffset<health::BlockAccessFile::BlockAccessFileHeader &>(*(health::TransactionalFile::WriteTransaction **)(a2 + 16), *(_QWORD *)(a2 + 24), 0);
  return 1;
}

uint64_t std::__function::__func<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_1,std::allocator<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_1>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_1,std::allocator<health::DataStore::DataStore(std::string const&,std::shared_ptr<health::VirtualFilesystem>,health::TransactionalFile::OpenMethod)::$_1>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::target_type()
{
}

void std::__function::__func<health::DataStore::performReadTransactionWithLambda(std::function<void ()(health::DataStore::ReadTransaction const&)>)::$_0,std::allocator<health::DataStore::performReadTransactionWithLambda(std::function<void ()(health::DataStore::ReadTransaction const&)>)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::~__func()
{
  JUMPOUT(0x1BCCAC494);
}

__n128 std::__function::__func<health::DataStore::performReadTransactionWithLambda(std::function<void ()(health::DataStore::ReadTransaction const&)>)::$_0,std::allocator<health::DataStore::performReadTransactionWithLambda(std::function<void ()(health::DataStore::ReadTransaction const&)>)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E6D0AD00;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<health::DataStore::performReadTransactionWithLambda(std::function<void ()(health::DataStore::ReadTransaction const&)>)::$_0,std::allocator<health::DataStore::performReadTransactionWithLambda(std::function<void ()(health::DataStore::ReadTransaction const&)>)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E6D0AD00;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<health::DataStore::performReadTransactionWithLambda(std::function<void ()(health::DataStore::ReadTransaction const&)>)::$_0,std::allocator<health::DataStore::performReadTransactionWithLambda(std::function<void ()(health::DataStore::ReadTransaction const&)>)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = 0;
  v5[1] = 0;
  v5[2] = a2;
  v5[3] = a2;
  v2 = *(_QWORD *)(a1 + 16);
  v6 = *(_OWORD *)(*(_QWORD *)(a1 + 8) + 864);
  v3 = *(_QWORD *)(v2 + 24);
  if (!v3)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v3 + 48))(v3, v5);
}

uint64_t std::__function::__func<health::DataStore::performReadTransactionWithLambda(std::function<void ()(health::DataStore::ReadTransaction const&)>)::$_0,std::allocator<health::DataStore::performReadTransactionWithLambda(std::function<void ()(health::DataStore::ReadTransaction const&)>)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<health::DataStore::performReadTransactionWithLambda(std::function<void ()(health::DataStore::ReadTransaction const&)>)::$_0,std::allocator<health::DataStore::performReadTransactionWithLambda(std::function<void ()(health::DataStore::ReadTransaction const&)>)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::target_type()
{
}

void std::__function::__func<health::DataStore::performWriteTransactionWithLambda(std::function<BOOL ()(health::DataStore::WriteTransaction &)>)::$_0,std::allocator<health::DataStore::performWriteTransactionWithLambda(std::function<BOOL ()(health::DataStore::WriteTransaction &)>)::$_0>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::~__func()
{
  JUMPOUT(0x1BCCAC494);
}

__n128 std::__function::__func<health::DataStore::performWriteTransactionWithLambda(std::function<BOOL ()(health::DataStore::WriteTransaction &)>)::$_0,std::allocator<health::DataStore::performWriteTransactionWithLambda(std::function<BOOL ()(health::DataStore::WriteTransaction &)>)::$_0>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E6D0AD80;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<health::DataStore::performWriteTransactionWithLambda(std::function<BOOL ()(health::DataStore::WriteTransaction &)>)::$_0,std::allocator<health::DataStore::performWriteTransactionWithLambda(std::function<BOOL ()(health::DataStore::WriteTransaction &)>)::$_0>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E6D0AD80;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<health::DataStore::performWriteTransactionWithLambda(std::function<BOOL ()(health::DataStore::WriteTransaction &)>)::$_0,std::allocator<health::DataStore::performWriteTransactionWithLambda(std::function<BOOL ()(health::DataStore::WriteTransaction &)>)::$_0>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::operator()(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  char *v18[6];

  v3 = *(_QWORD *)(a1 + 8);
  v8[0] = 0;
  v8[1] = 0;
  v8[2] = a2;
  v8[3] = a2;
  v9 = *(_OWORD *)(v3 + 864);
  v10 = 0;
  v11 = 0;
  v12 = a2;
  v13 = a2;
  v4 = a2[1];
  v14 = *a2;
  v15 = v4;
  v16 = a2[2];
  v17 = *((_BYTE *)a2 + 48);
  std::deque<health::BlockPointer>::deque(v18, (_QWORD *)a2 + 7);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 24);
  if (!v5)
    std::__throw_bad_function_call[abi:ne180100]();
  v6 = (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 48))(v5, v8);
  std::deque<health::BlockPointer>::~deque[abi:ne180100](v18);
  return v6;
}

void sub_1B7DED32C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  std::deque<health::BlockPointer>::~deque[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<health::DataStore::performWriteTransactionWithLambda(std::function<BOOL ()(health::DataStore::WriteTransaction &)>)::$_0,std::allocator<health::DataStore::performWriteTransactionWithLambda(std::function<BOOL ()(health::DataStore::WriteTransaction &)>)::$_0>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<health::DataStore::performWriteTransactionWithLambda(std::function<BOOL ()(health::DataStore::WriteTransaction &)>)::$_0,std::allocator<health::DataStore::performWriteTransactionWithLambda(std::function<BOOL ()(health::DataStore::WriteTransaction &)>)::$_0>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::target_type()
{
}

void std::__function::__func<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_0,std::allocator<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_0>,BOOL ()(health::BlockAccessFile::IntegrityError,long long,long long,std::string const&)>::~__func()
{
  JUMPOUT(0x1BCCAC494);
}

_QWORD *std::__function::__func<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_0,std::allocator<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_0>,BOOL ()(health::BlockAccessFile::IntegrityError,long long,long long,std::string const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E6D0AE00;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_0,std::allocator<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_0>,BOOL ()(health::BlockAccessFile::IntegrityError,long long,long long,std::string const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E6D0AE00;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_0,std::allocator<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_0>,BOOL ()(health::BlockAccessFile::IntegrityError,long long,long long,std::string const&)>::operator()(uint64_t a1, int *a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  int v7;
  uint64_t v8;
  _BYTE *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  std::string __p;
  void *v16;
  uint64_t v17;
  _BYTE v18[3];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21[4];

  v7 = *a2;
  v8 = *a3;
  v19 = *a4;
  v20 = v8;
  std::string::basic_string[abi:ne180100]<0>(&v16, "Unknown");
  if (v7 == 1)
  {
    if ((v18[2] & 0x80000000) != 0)
    {
      v17 = 21;
      v11 = v16;
      v9 = (char *)v16 + 21;
    }
    else
    {
      v9 = v18;
      v18[2] = 21;
      v11 = &v16;
    }
    qmemcpy(v11, "Free Space Corruption", 21);
  }
  else
  {
    if (v7)
      goto LABEL_12;
    if ((v18[2] & 0x80000000) != 0)
    {
      v17 = 14;
      v10 = v16;
      v9 = (char *)v16 + 14;
    }
    else
    {
      v9 = (char *)&v17 + 6;
      v18[2] = 14;
      v10 = &v16;
    }
    qmemcpy(v10, "Corrupt Header", 14);
  }
  *v9 = 0;
LABEL_12:
  v12 = *(_QWORD *)(a1 + 8);
  v21[0] = a5;
  v21[1] = (uint64_t)&v19;
  v21[2] = (uint64_t)&v20;
  v21[3] = (uint64_t)&v16;
  memset(&__p, 0, sizeof(__p));
  health::FormatImplementation<std::string &,long long &,unsigned long &,std::string const&>((std::string *)"{0}: [{1}, {2}] {3}", &__p, 0, v21);
  v13 = *(_QWORD *)(v12 + 24);
  if (!v13)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, std::string *))(*(_QWORD *)v13 + 48))(v13, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if ((v18[2] & 0x80000000) != 0)
    operator delete(v16);
  return 1;
}

void sub_1B7DED55C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_0,std::allocator<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_0>,BOOL ()(health::BlockAccessFile::IntegrityError,long long,long long,std::string const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_0,std::allocator<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_0>,BOOL ()(health::BlockAccessFile::IntegrityError,long long,long long,std::string const&)>::target_type()
{
}

void health::FormatImplementation<std::string &,long long &,unsigned long &,std::string const&>(std::string *a1, std::string *a2, std::string::size_type a3, uint64_t *a4)
{
  std::string::size_type v8;
  char v9;
  char *i;
  int v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  char *v24;
  int v25;
  std::runtime_error *exception;
  _BYTE v27[8];
  uint64_t v28;
  char v29;
  unint64_t v30;
  char *v31;
  void *__p;
  unint64_t v33;
  unsigned __int8 v34;

  v8 = 0;
  v9 = 0;
  for (i = (char *)a1; ; ++i)
  {
    v31 = i;
    if (*i != 123)
      break;
    v11 = i[1];
    if (v11 != 123)
    {
      if (v11 != 42)
      {
        health::FormatOptions::FormatOptions((uint64_t)v27, (const char **)&v31);
        v12 = v31;
        switch(v28)
        {
          case 0:
            health::TypeFormatter<std::string &,void>::TypeFormatter((uint64_t)&__p, a4[3], (uint64_t)v27);
            v13 = v34;
            if ((v34 & 0x80u) != 0)
              v13 = v33;
            v14 = v30;
            if (v30 <= v13)
              v14 = v13;
            if (v29)
              v13 = v14;
            health::FormatImplementation<std::string &,long long &,unsigned long &,std::string const&>(v12, a2, v13 + a3 + v8, a4);
            if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v15 = (char *)a2;
            else
              v15 = (char *)a2->__r_.__value_.__r.__words[0];
            goto LABEL_48;
          case 1:
            health::TypeFormatter<long long &,void>::TypeFormatter((uint64_t)&__p, a4[2], (uint64_t)v27);
            v18 = v34;
            if ((v34 & 0x80u) != 0)
              v18 = v33;
            v19 = v30;
            if (v30 <= v18)
              v19 = v18;
            if (v29)
              v18 = v19;
            health::FormatImplementation<std::string &,long long &,unsigned long &,std::string const&>(v12, a2, v18 + a3 + v8, a4);
            if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v15 = (char *)a2;
            else
              v15 = (char *)a2->__r_.__value_.__r.__words[0];
            goto LABEL_48;
          case 2:
            health::TypeFormatter<unsigned long &,void>::TypeFormatter((uint64_t)&__p, a4[1], (uint64_t)v27);
            v16 = v34;
            if ((v34 & 0x80u) != 0)
              v16 = v33;
            v17 = v30;
            if (v30 <= v16)
              v17 = v16;
            if (v29)
              v16 = v17;
            health::FormatImplementation<std::string &,long long &,unsigned long &,std::string const&>(v12, a2, v16 + a3 + v8, a4);
            if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v15 = (char *)a2;
            else
              v15 = (char *)a2->__r_.__value_.__r.__words[0];
            goto LABEL_48;
          case 3:
            health::TypeFormatter<std::string &,void>::TypeFormatter((uint64_t)&__p, *a4, (uint64_t)v27);
            v20 = v34;
            if ((v34 & 0x80u) != 0)
              v20 = v33;
            v21 = v30;
            if (v30 <= v20)
              v21 = v20;
            if (v29)
              v20 = v21;
            health::FormatImplementation<std::string &,long long &,unsigned long &,std::string const&>(v12, a2, v20 + a3 + v8, a4);
            if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v15 = (char *)a2;
            else
              v15 = (char *)a2->__r_.__value_.__r.__words[0];
LABEL_48:
            health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,unsigned long long &>(v27, &v15[a3 + v8], (const void **)&__p);
            if ((char)v34 < 0)
              operator delete(__p);
            if (v8)
              health::CopyFormatSectionToResult(a1, a2, a3, v8, v9 & 1);
            return;
          default:
            exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
            std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
            goto LABEL_60;
        }
      }
      v31 = i + 2;
      v22 = i[2];
      if ((v22 - 48) > 9)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Invalid format string- missing numeric value.");
      }
      else
      {
        v23 = 0;
        v24 = i + 3;
        do
        {
          v31 = v24;
          v23 = (v22 - 48) + 10 * v23;
          v25 = *v24++;
          v22 = v25;
        }
        while ((v25 - 58) >= 0xFFFFFFF6);
        v31 = v24;
        if (*(v24 - 1) == 125)
          health::FormatterParameters<0ul,std::string &,long long &,unsigned long &,std::string const&>::formatOptionsAtIndex<std::string &,long long &,unsigned long &,std::string const&>(v23);
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Invalid format options reference: Must be of form {*<index>} but no trailing '}' found.");
      }
LABEL_60:
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
    v31 = i + 1;
    v9 = 1;
    ++i;
LABEL_7:
    ++v8;
  }
  if (*i)
    goto LABEL_7;
  std::string::resize(a2, a3 + v8, 0);
  if (v8)
    health::CopyFormatSectionToResult(a1, a2, a3, v8, v9 & 1);
}

void sub_1B7DED9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;

  __cxa_free_exception(v23);
  _Unwind_Resume(a1);
}

void health::FormatterParameters<0ul,std::string &,long long &,unsigned long &,std::string const&>::formatOptionsAtIndex<std::string &,long long &,unsigned long &,std::string const&>(uint64_t a1)
{
  std::runtime_error *exception;
  std::runtime_error *v3;

  if (!a1 || a1 == 1 || a1 == 2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
  }
  else
  {
    v3 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    exception = v3;
    if (a1 == 3)
      std::runtime_error::runtime_error(v3, "Requested parameter is not an FormatOptions instance.");
    else
      std::runtime_error::runtime_error(v3, "Parameter index out of bounds.");
  }
  __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1B7DEDABC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

double health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_valueForKey<health::DataStore::ObjectIdentifier>@<D0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X4>, _OWORD *a6@<X8>)
{
  signed int v12;
  uint64_t v13;
  double result;
  __int128 v15;
  _OWORD v16[2];
  __int128 v17;

  if (*(_WORD *)(a3 + 544))
  {
    v12 = health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::childForKey(a3, a4);
    v13 = (a2 + 1);
    health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_valueForKeyInChildAtIndex<health::DataStore::ObjectIdentifier>(a1, v13, a3, v12, a4, a5, (uint64_t)v16);
    if (BYTE8(v17) || *(unsigned __int16 *)(a3 + 544) - 1 <= v12)
    {
      v15 = v16[1];
      *a6 = v16[0];
      a6[1] = v15;
      result = *(double *)&v17;
      a6[2] = v17;
    }
    else
    {
      return health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_valueForKeyInChildAtIndex<health::DataStore::ObjectIdentifier>(a1, v13, a3, (unsigned __int16)(v12 + 1), a4, a5, (uint64_t)a6);
    }
  }
  else
  {
    result = 0.0;
    *(_OWORD *)((char *)a6 + 25) = 0u;
    *a6 = 0u;
    a6[1] = 0u;
  }
  return result;
}

double health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_valueForKeyInChildAtIndex<health::DataStore::ObjectIdentifier>@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned int a4@<W3>, _QWORD *a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _OWORD *v18;
  unint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  _QWORD v23[68];
  unsigned __int16 v24;
  __int128 v25;
  __int128 v26;
  std::string v27;
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];

  if (*(unsigned __int16 *)(a3 + 544) <= a4)
  {
    std::string::basic_string[abi:ne180100]<0>(v30, "index < node.childCount");
    std::string::basic_string[abi:ne180100]<0>(v29, "_valueForKeyInChildAtIndex");
    std::string::basic_string[abi:ne180100]<0>(v28, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
    health::FormatString<>((std::string *)"Child index out of bounds.", &v27);
    health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v30, (uint64_t)v29, (uint64_t)v28, 158, (uint64_t)&v27);
  }
  if (!*(_BYTE *)(a3 + 546))
  {
    health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_interiorChildAtIndex(v23, a1, a2, a3, a4);
    health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_valueForKey<health::DataStore::ObjectIdentifier>(a1, a2, v23, a5, a6);
    return *(double *)&v16;
  }
  v11 = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a3, a4);
  v12 = *(_QWORD *)(v11 + 16);
  v13 = *(_QWORD *)(v11 + 24);
  v14 = *(_QWORD *)(a1 + 16);
  bzero(v23, 0x222uLL);
  v25 = 0u;
  v26 = 0u;
  health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v14 + 16), v12, v13, (uint64_t)v23);
  if (!v24)
    goto LABEL_19;
  v15 = health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>::indexForKey((uint64_t)v23, a5);
  if (!HIDWORD(v15))
  {
    v18 = (_OWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v23, (unsigned __int16)v15);
    v16 = v18[1];
    *(_OWORD *)a7 = *v18;
    *(_OWORD *)(a7 + 16) = v16;
    *(_DWORD *)(a7 + 32) = 0;
    goto LABEL_18;
  }
  switch((_DWORD)a6)
  {
    case 2:
      if (HIDWORD(v15) != 2)
        goto LABEL_19;
      v20 = (_OWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v23, (unsigned __int16)v15);
      v16 = v20[1];
      *(_OWORD *)a7 = *v20;
      *(_OWORD *)(a7 + 16) = v16;
      *(_DWORD *)(a7 + 32) = 2;
LABEL_18:
      *(_BYTE *)(a7 + 40) = 1;
      return *(double *)&v16;
    case 1:
      if (HIDWORD(v15) == 1)
      {
        v19 = (unsigned __int16)v15;
LABEL_17:
        v21 = (_OWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v23, v19);
        v16 = v21[1];
        *(_OWORD *)a7 = *v21;
        *(_OWORD *)(a7 + 16) = v16;
        *(_DWORD *)(a7 + 32) = 1;
        goto LABEL_18;
      }
      if ((unsigned __int16)v15 < v24 - 1)
      {
        v19 = (unsigned __int16)v15 + 1;
        goto LABEL_17;
      }
LABEL_19:
      *(_QWORD *)&v16 = 0;
      *(_OWORD *)(a7 + 25) = 0u;
      *(_OWORD *)a7 = 0u;
      *(_OWORD *)(a7 + 16) = 0u;
      return *(double *)&v16;
    case 0:
      goto LABEL_19;
  }
  return *(double *)&v16;
}

void sub_1B7DEDDD4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 - 137) < 0)
    operator delete(*(void **)(v1 - 160));
  if (*(char *)(v1 - 113) < 0)
    operator delete(*(void **)(v1 - 136));
  if (*(char *)(v1 - 89) < 0)
    operator delete(*(void **)(v1 - 112));
  if (*(char *)(v1 - 65) < 0)
    operator delete(*(void **)(v1 - 88));
  _Unwind_Resume(exception_object);
}

void health::_HDAssertImplementation<health::btree_access_error>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  char **v10;
  _QWORD *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  std::runtime_error *exception;
  char **v33;
  std::string *v34;
  std::string::size_type size;
  _QWORD *v36;
  void *__p[2];
  char v38;
  std::string v39;
  uint64_t v40;
  uint64_t v41;
  void *v42[2];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  *(_OWORD *)v42 = 0u;
  v43 = 0u;
  LODWORD(v9) = backtrace(v42, 20);
  v10 = backtrace_symbols(v42, v9);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v40);
  v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v40, (uint64_t)"Critical Error: ", 16);
  v12 = *(char *)(a5 + 23);
  if (v12 >= 0)
    v13 = a5;
  else
    v13 = *(_QWORD *)a5;
  if (v12 >= 0)
    v14 = *(unsigned __int8 *)(a5 + 23);
  else
    v14 = *(_QWORD *)(a5 + 8);
  v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, v13, v14);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"\n", 1);
  v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v40, (uint64_t)"Failed assertion '", 18);
  v17 = *(char *)(a1 + 23);
  if (v17 >= 0)
    v18 = a1;
  else
    v18 = *(_QWORD *)a1;
  if (v17 >= 0)
    v19 = *(unsigned __int8 *)(a1 + 23);
  else
    v19 = *(_QWORD *)(a1 + 8);
  v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, v18, v19);
  v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)"' in '", 6);
  v22 = *(char *)(a2 + 23);
  if (v22 >= 0)
    v23 = a2;
  else
    v23 = *(_QWORD *)a2;
  if (v22 >= 0)
    v24 = *(unsigned __int8 *)(a2 + 23);
  else
    v24 = *(_QWORD *)(a2 + 8);
  v25 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, v23, v24);
  v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"' at ", 5);
  v27 = *(char *)(a3 + 23);
  if (v27 >= 0)
    v28 = a3;
  else
    v28 = *(_QWORD *)a3;
  if (v27 >= 0)
    v29 = *(unsigned __int8 *)(a3 + 23);
  else
    v29 = *(_QWORD *)(a3 + 8);
  v30 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, v28, v29);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v30, (uint64_t)":", 1);
  v31 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, (uint64_t)"\n", 1);
  v9 = (int)v9;
  if ((_DWORD)v9)
  {
    v33 = v10;
    do
    {
      std::string::basic_string[abi:ne180100]<0>(__p, *v33);
      health::HDDemangleBacktraceLine((uint64_t)__p, (unint64_t)&v39);
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v34 = &v39;
      else
        v34 = (std::string *)v39.__r_.__value_.__r.__words[0];
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v39.__r_.__value_.__r.__words[2]);
      else
        size = v39.__r_.__value_.__l.__size_;
      v36 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v40, (uint64_t)v34, size);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)"\n", 1);
      if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v39.__r_.__value_.__l.__data_);
      if (v38 < 0)
        operator delete(__p[0]);
      ++v33;
      --v9;
    }
    while (v9);
  }
  free(v10);
  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)&v41, &v39);
  std::runtime_error::runtime_error(exception, &v39);
  exception->__vftable = (std::runtime_error_vtbl *)&unk_1E6CEAB08;
}

void sub_1B7DEE09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  if (a14 < 0)
    operator delete(__p);
  a21 = *MEMORY[0x1E0DE4F60];
  *(uint64_t *)((char *)&a21 + *(_QWORD *)(a21 - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
  a22 = MEMORY[0x1E0DE4FB8] + 16;
  if (a35 < 0)
    operator delete(a30);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1BCCAC458](&a38);
  _Unwind_Resume(a1);
}

_QWORD *health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_interiorChildAtIndex(_QWORD *a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;
  _QWORD *v15;
  std::string v16;
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  std::string v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  std::string v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  std::string v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];

  if (*(unsigned __int16 *)(a4 + 544) <= a5)
  {
    std::string::basic_string[abi:ne180100]<0>(v31, "index < node.childCount");
    std::string::basic_string[abi:ne180100]<0>(v30, "_interiorChildAtIndex");
    std::string::basic_string[abi:ne180100]<0>(v29, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
    health::FormatString<>((std::string *)"Child index out of bounds.", &v28);
    health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v31, (uint64_t)v30, (uint64_t)v29, 137, (uint64_t)&v28);
  }
  if (a3 >= 64)
  {
    std::string::basic_string[abi:ne180100]<0>(v27, "depth < kMaximumRecursionDepth");
    std::string::basic_string[abi:ne180100]<0>(v26, "_interiorChildAtIndex");
    std::string::basic_string[abi:ne180100]<0>(v25, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
    health::FormatString<>((std::string *)"Maximum recursion depth reached.", &v24);
    health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v27, (uint64_t)v26, (uint64_t)v25, 138, (uint64_t)&v24);
  }
  v9 = a5;
  v10 = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a4, a5);
  v11 = *(_QWORD *)(v10 + 16);
  v12 = *(_QWORD *)(v10 + 24);
  v13 = *(_QWORD *)(a2 + 16);
  bzero(a1, 0x223uLL);
  result = (_QWORD *)health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(*(uint64_t **)(v13 + 16), v11, v12, (uint64_t)a1);
  if (*((_WORD *)a1 + 272))
  {
    result = (_QWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a4, v9);
    if (*a1 <= *result && (*a1 < *result || a1[1] < result[1]))
    {
      std::string::basic_string[abi:ne180100]<0>(v23, "child.children[0].key >= node.children[index].key");
      std::string::basic_string[abi:ne180100]<0>(v22, "_interiorChildAtIndex");
      std::string::basic_string[abi:ne180100]<0>(v21, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
      health::FormatString<>((std::string *)"Child node's smallest key is < parent's key", &v20);
      health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v23, (uint64_t)v22, (uint64_t)v21, 144, (uint64_t)&v20);
    }
    if (*(unsigned __int16 *)(a4 + 544) - 1 > (int)a5)
    {
      v15 = (_QWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)a1, *((unsigned __int16 *)a1 + 272) - 1);
      result = (_QWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a4, a5 + 1);
      if (*v15 >= *result && (*v15 > *result || v15[1] >= result[1]))
      {
        std::string::basic_string[abi:ne180100]<0>(v19, "child.children[child.childCount - 1].key < node.children[index + 1].key");
        std::string::basic_string[abi:ne180100]<0>(v18, "_interiorChildAtIndex");
        std::string::basic_string[abi:ne180100]<0>(v17, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
        health::FormatString<>((std::string *)"Child node's largest key is >= parent's next key", &v16);
        health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v19, (uint64_t)v18, (uint64_t)v17, 146, (uint64_t)&v16);
      }
    }
  }
  return result;
}

void sub_1B7DEE408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  if (a26 < 0)
    operator delete(a21);
  if (a32 < 0)
    operator delete(a27);
  _Unwind_Resume(a1);
}

void std::__function::__func<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1,std::allocator<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1>,void ()(health::BlockAccessFile::ReadTransaction const&)>::~__func()
{
  JUMPOUT(0x1BCCAC494);
}

__n128 std::__function::__func<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1,std::allocator<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1>,void ()(health::BlockAccessFile::ReadTransaction const&)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E6D0AE90;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1,std::allocator<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1>,void ()(health::BlockAccessFile::ReadTransaction const&)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E6D0AE90;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1,std::allocator<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1>,void ()(health::BlockAccessFile::ReadTransaction const&)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD v17[2];
  uint64_t *v18;
  _BYTE v19[552];
  _QWORD v20[3];
  _QWORD *v21;
  _QWORD v22[3];
  _QWORD *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17[0] = 0;
  v17[1] = 0;
  v18 = a2;
  v5 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(v5 + 872);
  v14 = *(_QWORD *)(v5 + 864);
  v15 = v6;
  v16 = v17;
  std::__function::__value_func<BOOL ()(double const&,double const&)>::__value_func[abi:ne180100]((uint64_t)v20, v4);
  bzero(v19, 0x223uLL);
  health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(v18, v14, v6, (uint64_t)v19);
  health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::verifyInteriorNode((uint64_t)v19);
  v7 = (uint64_t)v21;
  if (!v21)
    goto LABEL_4;
  if (v21 != v20)
  {
    v7 = (*(uint64_t (**)(_QWORD *))(*v21 + 16))(v21);
LABEL_4:
    v23 = (_QWORD *)v7;
    goto LABEL_6;
  }
  v23 = v22;
  (*(void (**)(_QWORD *, _QWORD *))(v20[0] + 24))(v20, v22);
LABEL_6:
  health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_checkInteriorNodeIntegrity(&v14, 0, (uint64_t)v19, (uint64_t)v22);
  v8 = v23;
  if (v23 == v22)
  {
    v9 = 4;
    v8 = v22;
  }
  else
  {
    if (!v23)
      goto LABEL_11;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_11:
  v10 = v21;
  if (v21 == v20)
  {
    v11 = 4;
    v10 = v20;
    goto LABEL_15;
  }
  if (v21)
  {
    v11 = 5;
LABEL_15:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  v12 = *(_QWORD *)(a1 + 16);
  v22[0] = &v14;
  v22[1] = v12;
  v22[2] = a2;
  v13 = v16;
  bzero(v19, 0x223uLL);
  health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>((uint64_t *)v13[2], v14, v15, (uint64_t)v19);
  health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1::operator() const(health::BlockAccessFile::ReadTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>((uint64_t)&v14, 0, (uint64_t)v19, (uint64_t)v22);
}

void sub_1B7DEE7A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;

  v19 = *(_QWORD **)(v17 - 64);
  if (v19 == v16)
  {
    v20 = 4;
    v19 = (_QWORD *)(v17 - 88);
  }
  else
  {
    if (!v19)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*v19 + 8 * v20))();
LABEL_6:
  v21 = *(_QWORD **)(v17 - 96);
  if (v21 == (_QWORD *)(v17 - 120))
  {
    v22 = 4;
    v21 = (_QWORD *)(v17 - 120);
  }
  else
  {
    if (!v21)
      goto LABEL_11;
    v22 = 5;
  }
  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1,std::allocator<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1>,void ()(health::BlockAccessFile::ReadTransaction const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1,std::allocator<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1>,void ()(health::BlockAccessFile::ReadTransaction const&)>::target_type()
{
}

uint64_t health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::verifyInteriorNode(uint64_t result)
{
  unsigned int v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  std::logic_error *exception;

  v1 = *(unsigned __int16 *)(result + 544);
  if (v1 >= 0x12)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Node contains too many values!");
    goto LABEL_13;
  }
  if (v1 >= 2)
  {
    v2 = result;
    v3 = 1;
    while (1)
    {
      v5 = *(_QWORD *)result;
      v4 = *(_QWORD *)(result + 8);
      v6 = (_QWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](v2, v3);
      if (*v6 < v5)
        break;
      if (*v6 <= v5 && v6[1] <= v4)
        break;
      result = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](v2, v3++);
      if (v3 >= *(unsigned __int16 *)(v2 + 544))
        return result;
    }
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Node values are out of order!");
LABEL_13:
    __cxa_throw(exception, MEMORY[0x1E0DE4E70], MEMORY[0x1E0DE42A0]);
  }
  return result;
}

void sub_1B7DEE9D4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_checkInteriorNodeIntegrity(_QWORD *result, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  unsigned __int16 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  std::logic_error *exception;
  _QWORD v20[68];
  unsigned __int16 v21;
  __int128 v22;
  __int128 v23;
  unsigned __int16 v24;
  _BYTE v25[24];
  _BYTE *v26;
  _BYTE v27[24];
  _BYTE *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  if (*(_WORD *)(a3 + 544))
  {
    v7 = (uint64_t)result;
    v8 = 0;
    v9 = (a2 + 1);
    do
    {
      result = (_QWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a3, v8);
      v10 = *(_QWORD *)(v7 + 16);
      if (result[2] == *(_QWORD *)v10 && result[3] == *(_QWORD *)(v10 + 8))
        goto LABEL_24;
      if (*(_BYTE *)(a3 + 546))
      {
        v11 = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a3, v24);
        bzero(v20, 0x222uLL);
        v22 = 0u;
        v23 = 0u;
        health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v10 + 16), *(_QWORD *)(v11 + 16), *(_QWORD *)(v11 + 24), (uint64_t)v20);
        if (v21 >= 0x12u)
        {
          exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(exception, "Node contains too many values!");
          goto LABEL_27;
        }
        if (v21 >= 2u)
        {
          v12 = v20;
          v13 = 1;
          while (1)
          {
            v15 = *v12;
            v14 = v12[1];
            v16 = (_QWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v20, v13);
            if (*v16 < v15)
              break;
            if (*v16 <= v15 && v16[1] <= v14)
              break;
            v12 = (uint64_t *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v20, v13++);
            if (v13 >= v21)
              goto LABEL_16;
          }
          exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(exception, "Node values are out of order!");
LABEL_27:
          __cxa_throw(exception, MEMORY[0x1E0DE4E70], MEMORY[0x1E0DE42A0]);
        }
LABEL_16:
        std::__function::__value_func<BOOL ()(double const&,double const&)>::__value_func[abi:ne180100]((uint64_t)v27, a4);
        result = v28;
        if (v28 == v27)
        {
          result = v27;
          goto LABEL_22;
        }
      }
      else
      {
        health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_interiorChildAtIndex(v20, v7, a2, a3, v24);
        health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::verifyInteriorNode((uint64_t)v20);
        std::__function::__value_func<BOOL ()(double const&,double const&)>::__value_func[abi:ne180100]((uint64_t)v25, a4);
        health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_checkInteriorNodeIntegrity(v7, v9, v20, v25);
        result = v26;
        if (v26 == v25)
        {
          result = v25;
LABEL_22:
          v18 = 4;
LABEL_23:
          result = (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v18))();
          goto LABEL_24;
        }
      }
      if (result)
      {
        v18 = 5;
        goto LABEL_23;
      }
LABEL_24:
      v8 = ++v24;
    }
    while (*(unsigned __int16 *)(a3 + 544) > v24);
  }
  return result;
}

void sub_1B7DEED5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B7DEEDAC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void sub_1B7DEEDBC(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = *(_QWORD **)(v1 - 136);
  if (v3 == (_QWORD *)(v1 - 160))
  {
    v4 = 4;
    v3 = (_QWORD *)(v1 - 160);
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  _Unwind_Resume(a1);
}

void health::FormatString<unsigned short &,char const*>(std::string *a1, std::string *a2, const char **a3, const char **a4)
{
  const char **v4[2];

  v4[0] = a4;
  v4[1] = a3;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  a1->__r_.__value_.__r.__words[0] = 0;
  health::FormatImplementation<unsigned short &,char const*>(a2, a1, 0, v4);
}

void sub_1B7DEEE44(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void health::FormatImplementation<unsigned short &,char const*>(std::string *a1, std::string *a2, std::string::size_type a3, const char ***a4)
{
  std::string::size_type v8;
  char v9;
  char *i;
  int v11;
  char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  std::string *v16;
  const char *v17;
  const std::ios_base *v18;
  std::ios_base::fmtflags v19;
  const std::locale::facet *v20;
  size_t v21;
  size_t v22;
  size_t v23;
  std::string *v24;
  _BYTE *v25;
  uint64_t v26;
  unint64_t v27;
  void **v28;
  void **v29;
  size_t v30;
  unint64_t v31;
  uint64_t v32;
  void **v33;
  unint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  int v38;
  uint64_t v39;
  char *v40;
  int v41;
  std::runtime_error *exception;
  int v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  char *v48;
  void *v49[2];
  uint64_t v50;
  std::locale v51[2];
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  _OWORD v55[3];
  uint64_t v56;
  void *__p;
  char v58;
  uint64_t v59;

  v8 = 0;
  v9 = 0;
  for (i = (char *)a1; ; ++i)
  {
    v48 = i;
    if (*i == 123)
      break;
    if (!*i)
    {
      std::string::resize(a2, a3 + v8, 0);
      if (v8)
        health::CopyFormatSectionToResult(a1, a2, a3, v8, v9 & 1);
      return;
    }
LABEL_7:
    ++v8;
  }
  v11 = i[1];
  if (v11 == 123)
  {
    v48 = i + 1;
    v9 = 1;
    ++i;
    goto LABEL_7;
  }
  if (v11 == 42)
  {
    v48 = i + 2;
    v38 = i[2];
    if ((v38 - 48) > 9)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format string- missing numeric value.");
    }
    else
    {
      v39 = 0;
      v40 = i + 3;
      do
      {
        v48 = v40;
        v39 = (v38 - 48) + 10 * v39;
        v41 = *v40++;
        v38 = v41;
      }
      while ((v41 - 58) >= 0xFFFFFFF6);
      v48 = v40;
      if (*(v40 - 1) == 125)
        health::FormatterParameters<0ul,unsigned short &,char const*>::formatOptionsAtIndex<unsigned short &,char const*>(v39);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format options reference: Must be of form {*<index>} but no trailing '}' found.");
    }
    goto LABEL_93;
  }
  health::FormatOptions::FormatOptions((uint64_t)&v44, (const char **)&v48);
  v12 = v48;
  if (*((_QWORD *)&v44 + 1))
  {
    if (*((_QWORD *)&v44 + 1) == 1)
    {
      v13 = **a4;
      v53 = v13;
      if (v13)
        v13 = (const char *)strlen(v13);
      v54 = (uint64_t)v13;
      v55[0] = v44;
      v55[1] = v45;
      v55[2] = v46;
      v56 = v47;
      v14 = (const char *)*((_QWORD *)&v45 + 1);
      if (*((_QWORD *)&v45 + 1) <= (unint64_t)v13)
        v14 = v13;
      if ((_BYTE)v45)
        v15 = v14;
      else
        v15 = v13;
      health::FormatImplementation<unsigned short &,char const*>(v48, a2, &v15[a3 + v8], a4);
      if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v16 = a2;
      else
        v16 = (std::string *)a2->__r_.__value_.__r.__words[0];
      health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,char const*>(&v44, (_BYTE *)v16 + a3 + v8, (uint64_t)&v53);
      goto LABEL_57;
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
LABEL_93:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  v49[1] = 0;
  v50 = 0;
  v49[0] = 0;
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v53);
  v17 = v53;
  if ((_BYTE)v45)
    *(_QWORD *)((char *)v55 + *((_QWORD *)v53 - 3) + 8) = *((_QWORD *)&v45 + 1);
  if ((_BYTE)v46)
    *(_QWORD *)((char *)v55 + *((_QWORD *)v17 - 3)) = *((_QWORD *)&v46 + 1);
  v18 = (const std::ios_base *)((char *)&v53 + *((_QWORD *)v17 - 3));
  v19 = SBYTE4(v47);
  if (v18[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v18);
    v20 = std::locale::use_facet(v51, MEMORY[0x1E0DE4A90]);
    ((void (*)(const std::locale::facet *, uint64_t))v20->__vftable[2].~facet_0)(v20, 32);
    std::locale::~locale(v51);
  }
  v18[1].__fmtflags_ = v19;
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)&v54, v51);
  *(_OWORD *)v49 = *(_OWORD *)&v51[0].__locale_;
  v53 = (const char *)*MEMORY[0x1E0DE4F60];
  *(const char **)((char *)&v53 + *((_QWORD *)v53 - 3)) = *(const char **)(MEMORY[0x1E0DE4F60] + 24);
  v50 = v52;
  v54 = MEMORY[0x1E0DE4FB8] + 16;
  if (v58 < 0)
    operator delete(__p);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x1BCCAC458](&v59);
  v43 = SHIBYTE(v50);
  if (v50 >= 0)
    v21 = HIBYTE(v50);
  else
    v21 = (size_t)v49[1];
  v22 = *((_QWORD *)&v45 + 1);
  if (*((_QWORD *)&v45 + 1) <= v21)
    v22 = v21;
  if ((_BYTE)v45)
    v23 = v22;
  else
    v23 = v21;
  health::FormatImplementation<unsigned short &,char const*>(v12, a2, v23 + a3 + v8, a4);
  if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v24 = a2;
  else
    v24 = (std::string *)a2->__r_.__value_.__r.__words[0];
  v25 = (char *)v24 + a3 + v8;
  if ((_BYTE)v45 && (v26 = *((_QWORD *)&v45 + 1), v27 = *((_QWORD *)&v45 + 1) - v21, *((_QWORD *)&v45 + 1) > v21))
  {
    if ((_DWORD)v44)
    {
      if ((_DWORD)v44 == 1)
      {
        v31 = v27 >> 1;
        if (v27 >= 2)
        {
          if (v31 <= 1)
            v32 = 1;
          else
            v32 = v27 >> 1;
          do
          {
            *v25++ = BYTE4(v47);
            --v32;
          }
          while (v32);
        }
        if (v21)
        {
          if (v43 >= 0)
            v33 = v49;
          else
            v33 = (void **)v49[0];
          memmove(v25, v33, v21);
        }
        if (v27 != v31)
        {
          v34 = v27 - (v27 >> 1);
          v35 = &v25[v21];
          if (v34 <= 1)
            v34 = 1;
          v36 = -(uint64_t)v34;
          do
            *v35++ = BYTE4(v47);
          while (!__CFADD__(v36++, 1));
        }
      }
      else if ((_DWORD)v44 == 2)
      {
        if (*((_QWORD *)&v45 + 1) != v21)
        {
          do
          {
            *v25++ = BYTE4(v47);
            --v27;
          }
          while (v27);
        }
        goto LABEL_50;
      }
    }
    else
    {
      if (v21)
      {
        if (v43 >= 0)
          v29 = v49;
        else
          v29 = (void **)v49[0];
        memmove((char *)v24 + a3 + v8, v29, v21);
      }
      if (v26 != v21)
      {
        v30 = (size_t)v24 + v21;
        do
        {
          *(_BYTE *)(v30 + a3 + v8) = BYTE4(v47);
          ++v30;
          --v27;
        }
        while (v27);
      }
    }
  }
  else
  {
LABEL_50:
    if (v21)
    {
      if (v43 >= 0)
        v28 = v49;
      else
        v28 = (void **)v49[0];
      memmove(v25, v28, v21);
    }
  }
  if (SHIBYTE(v50) < 0)
    operator delete(v49[0]);
LABEL_57:
  if (v8)
    health::CopyFormatSectionToResult(a1, a2, a3, v8, v9 & 1);
}

void sub_1B7DEF398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,uint64_t a22,uint64_t a23,std::locale a24,uint64_t a25,uint64_t a26,char a27)
{
  void *v27;

  __cxa_free_exception(v27);
  _Unwind_Resume(a1);
}

void health::FormatterParameters<0ul,unsigned short &,char const*>::formatOptionsAtIndex<unsigned short &,char const*>(uint64_t a1)
{
  std::runtime_error *v1;
  std::runtime_error *exception;

  if (a1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    v1 = exception;
    if (a1 == 1)
      std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
    else
      std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
  }
  else
  {
    v1 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v1, "Requested parameter is not an FormatOptions instance.");
  }
  __cxa_throw(v1, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1B7DEF478(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1::operator() const(health::BlockAccessFile::ReadTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  unint64_t j;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  _BYTE v25[544];
  unsigned __int16 v26;
  __int128 v27;
  __int128 v28;
  std::string v29;
  _QWORD v30[68];
  unsigned __int16 v31;
  __int128 v32;
  __int128 v33;
  std::string v34;
  _QWORD v35[3];
  _QWORD v36[3];

  if (*(_WORD *)(a3 + 544))
  {
    if (*(_BYTE *)(a3 + 546))
    {
      v6 = *(_QWORD *)(a3 + 16);
      v7 = *(_QWORD *)(a3 + 24);
      v8 = *(_QWORD *)(a1 + 16);
      bzero(v25, 0x222uLL);
      v27 = 0u;
      v28 = 0u;
      health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v8 + 16), v6, v7, (uint64_t)v25);
      if (v26)
      {
        v9 = 0;
        v10 = 0;
        v11 = 0;
        do
        {
          v12 = (uint64_t *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v25, v9);
          v13 = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v25, v9);
          v14 = *v12;
          if (v9 && v14 <= v11 && (v14 < v11 || v12[1] <= v10))
          {
            std::string::basic_string[abi:ne180100]<0>(v30, "key > lastKey");
            std::string::basic_string[abi:ne180100]<0>(v36, "_enumerateLeaves");
            std::string::basic_string[abi:ne180100]<0>(v35, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
            health::FormatString<>((std::string *)"Out of order keys during btree enumeration.", &v34);
            health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v30, (uint64_t)v36, (uint64_t)v35, 382, (uint64_t)&v34);
          }
          v10 = v12[1];
          health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1::operator() const(health::BlockAccessFile::ReadTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>(int,health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17> const&,health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1::operator() const(health::BlockAccessFile::ReadTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1} const&,health::bplustree::EnumerationDirection)const::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer const&)#1}::operator()(a4, v12, *(_QWORD *)(v13 + 16), *(_QWORD *)(v13 + 24));
          ++v9;
          v11 = v14;
        }
        while (v9 < v26);
      }
      else
      {
        v14 = 0;
        v10 = 0;
      }
      v18 = *((_QWORD *)&v28 + 1);
      for (i = v28; ; i = v33)
      {
        v19 = *(_QWORD *)(a1 + 16);
        if (i == *(_QWORD *)v19 && v18 == *(_QWORD *)(v19 + 8))
          break;
        bzero(v30, 0x222uLL);
        v32 = 0u;
        v33 = 0u;
        health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v19 + 16), i, v18, (uint64_t)v30);
        if (!v31)
        {
          std::string::basic_string[abi:ne180100]<0>(v36, "leaf.valueCount > 0");
          std::string::basic_string[abi:ne180100]<0>(v35, "_enumerateLeaves");
          std::string::basic_string[abi:ne180100]<0>(&v34, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
          health::FormatString<>((std::string *)"Empty leaf encountered during enumeration.", &v29);
          health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v36, (uint64_t)v35, (uint64_t)&v34, 392, (uint64_t)&v29);
        }
        for (j = 0; j < v31; ++j)
        {
          v21 = v14;
          v22 = (uint64_t *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v30, j);
          v23 = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v30, j);
          v14 = *v22;
          if (*v22 <= v21)
          {
            v24 = *v22 >= v21 && v22[1] > v10;
            v10 = v22[1];
            if (!v24)
            {
              std::string::basic_string[abi:ne180100]<0>(v36, "key > lastKey");
              std::string::basic_string[abi:ne180100]<0>(v35, "_enumerateLeaves");
              std::string::basic_string[abi:ne180100]<0>(&v34, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
              health::FormatString<>((std::string *)"Out of order keys during btree enumeration.", &v29);
              health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v36, (uint64_t)v35, (uint64_t)&v34, 396, (uint64_t)&v29);
            }
          }
          else
          {
            v10 = v22[1];
          }
          health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1::operator() const(health::BlockAccessFile::ReadTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>(int,health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17> const&,health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1::operator() const(health::BlockAccessFile::ReadTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1} const&,health::bplustree::EnumerationDirection)const::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer const&)#1}::operator()(a4, v22, *(_QWORD *)(v23 + 16), *(_QWORD *)(v23 + 24));
        }
        v18 = *((_QWORD *)&v33 + 1);
      }
    }
    else
    {
      health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_interiorChildAtIndex(v30, a1, a2, a3, 0);
      health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1::operator() const(health::BlockAccessFile::ReadTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>(a1, (a2 + 1), v30, a4);
    }
  }
}

void sub_1B7DEF7B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  if (*(char *)(v1 - 129) < 0)
    operator delete(*(void **)(v1 - 152));
  if (*(char *)(v1 - 105) < 0)
    operator delete(*(void **)(v1 - 128));
  if (*(char *)(v1 - 81) < 0)
    operator delete(*(void **)(v1 - 104));
  if (SLOBYTE(STACK[0x277]) < 0)
    operator delete((void *)STACK[0x260]);
  _Unwind_Resume(a1);
}

void health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1::operator() const(health::BlockAccessFile::ReadTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>(int,health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17> const&,health::DataStore::checkIntegrity(std::function<void ()(std::string const&)>)::$_1::operator() const(health::BlockAccessFile::ReadTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1} const&,health::bplustree::EnumerationDirection)const::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer const&)#1}::operator()(uint64_t a1, _QWORD *a2, uint64_t a3, size_t a4)
{
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  std::string v19;
  __int128 v20;
  _QWORD v21[3];
  char v22;
  uint64_t v23;
  size_t v24;
  std::string v25;

  v23 = a3;
  v24 = a4;
  health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::valueForKey<health::DataStore::ObjectIdentifier>(*(uint64_t **)a1, a2, 0, &v20);
  if (!v22)
  {
    v10 = *(_QWORD *)(a1 + 8);
    v19.__r_.__value_.__r.__words[0] = (std::string::size_type)&v23;
    v19.__r_.__value_.__l.__size_ = (std::string::size_type)a2;
    memset(&v25, 0, sizeof(v25));
    health::FormatImplementation<health::DataStore::ObjectIdentifier const&,health::BlockPointer &>((std::string *)"Value retrieval failed for {0}: enumerated value {1} but lookup failed.", &v25, 0, (uint64_t *)&v19);
    v11 = *(_QWORD *)(v10 + 24);
    if (!v11)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, std::string *))(*(_QWORD *)v11 + 48))(v11, &v25);
    if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_11;
    v9 = (void *)v25.__r_.__value_.__r.__words[0];
    goto LABEL_10;
  }
  health::Optional<health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::LookupResult>::get((uint64_t)&v20);
  if (v23 != v21[0] || (v6 = v24, v24 != v21[1]))
  {
    v7 = *(_QWORD *)(a1 + 8);
    health::Optional<health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::LookupResult>::get((uint64_t)&v20);
    v25.__r_.__value_.__r.__words[0] = (std::string::size_type)v21;
    v25.__r_.__value_.__l.__size_ = (std::string::size_type)&v23;
    v25.__r_.__value_.__r.__words[2] = (std::string::size_type)a2;
    memset(&v19, 0, sizeof(v19));
    health::FormatImplementation<health::DataStore::ObjectIdentifier const&,health::BlockPointer &,health::BlockPointer &>((std::string *)"Value retrieval failed for {0}: enumerated value {1} but lookup value is {2}.", &v19, 0, (uint64_t *)&v25);
    v8 = *(_QWORD *)(v7 + 24);
    if (!v8)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, std::string *))(*(_QWORD *)v8 + 48))(v8, &v19);
    if ((SHIBYTE(v19.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_11;
    v9 = (void *)v19.__r_.__value_.__r.__words[0];
LABEL_10:
    operator delete(v9);
LABEL_11:
    v6 = v24;
  }
  if (v6)
  {
    if (v6 >> 20 <= 4)
    {
      std::vector<unsigned char>::vector(&v25, v6);
      health::RawBuffer::RawBuffer(&v19, (unsigned __int8 *)v25.__r_.__value_.__l.__data_, v25.__r_.__value_.__l.__size_ - v25.__r_.__value_.__r.__words[0]);
      v12 = *(uint64_t **)(a1 + 16);
      v13 = v23;
      v14 = v24;
      health::RawBuffer::RawBuffer(v18, (unsigned __int8 *)v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
      health::BlockAccessFile::ReadTransaction::retrieveBlock(v12, v13, v14, (uint64_t)v18);
      v15 = (void *)v25.__r_.__value_.__r.__words[0];
      if (v25.__r_.__value_.__r.__words[0])
      {
        v25.__r_.__value_.__l.__size_ = v25.__r_.__value_.__r.__words[0];
LABEL_19:
        operator delete(v15);
      }
    }
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 8);
    health::FormatString<health::DataStore::ObjectIdentifier const&>((std::string *)"Target block for {0} has 0 length", (uint64_t)a2, &v25);
    v17 = *(_QWORD *)(v16 + 24);
    if (!v17)
      std::__throw_bad_function_call[abi:ne180100]();
    (*(void (**)(uint64_t, std::string *))(*(_QWORD *)v17 + 48))(v17, &v25);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    {
      v15 = (void *)v25.__r_.__value_.__r.__words[0];
      goto LABEL_19;
    }
  }
}

void sub_1B7DEFA78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  uint64_t v16;

  if (*(char *)(v16 - 33) < 0)
    operator delete(*(void **)(v16 - 56));
  _Unwind_Resume(exception_object);
}

uint64_t health::Optional<health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::LookupResult>::get(uint64_t result)
{
  std::logic_error *exception;

  if (!*(_BYTE *)(result + 40))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "Attempt to get the value from an invalid optional.");
    __cxa_throw(exception, MEMORY[0x1E0DE4E70], MEMORY[0x1E0DE42A0]);
  }
  return result;
}

void sub_1B7DEFB18(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void health::FormatImplementation<health::DataStore::ObjectIdentifier const&,health::BlockPointer &,health::BlockPointer &>(std::string *a1, std::string *a2, std::string::size_type a3, uint64_t *a4)
{
  std::string::size_type v8;
  char v9;
  char *i;
  int v11;
  char *v12;
  std::string::size_type size;
  std::string::size_type v14;
  char *v15;
  std::string::size_type v16;
  std::string::size_type v17;
  std::string::size_type v18;
  std::string::size_type v19;
  int v20;
  uint64_t v21;
  char *v22;
  int v23;
  std::runtime_error *exception;
  _BYTE v25[8];
  uint64_t v26;
  char v27;
  std::string::size_type v28;
  char *v29;
  std::string __p;

  v8 = 0;
  v9 = 0;
  for (i = (char *)a1; ; ++i)
  {
    v29 = i;
    if (*i == 123)
      break;
    if (!*i)
    {
      std::string::resize(a2, a3 + v8, 0);
      if (v8)
        health::CopyFormatSectionToResult(a1, a2, a3, v8, v9 & 1);
      return;
    }
LABEL_7:
    ++v8;
  }
  v11 = i[1];
  if (v11 == 123)
  {
    v29 = i + 1;
    v9 = 1;
    ++i;
    goto LABEL_7;
  }
  if (v11 == 42)
  {
    v29 = i + 2;
    v20 = i[2];
    if ((v20 - 48) > 9)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format string- missing numeric value.");
    }
    else
    {
      v21 = 0;
      v22 = i + 3;
      do
      {
        v29 = v22;
        v21 = (v20 - 48) + 10 * v21;
        v23 = *v22++;
        v20 = v23;
      }
      while ((v23 - 58) >= 0xFFFFFFF6);
      v29 = v22;
      if (*(v22 - 1) == 125)
        health::FormatterParameters<0ul,health::DataStore::ObjectIdentifier const&,health::BlockPointer &,health::BlockPointer &>::formatOptionsAtIndex<health::DataStore::ObjectIdentifier const&,health::BlockPointer &,health::BlockPointer &>(v21);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format options reference: Must be of form {*<index>} but no trailing '}' found.");
    }
    goto LABEL_53;
  }
  health::FormatOptions::FormatOptions((uint64_t)v25, (const char **)&v29);
  v12 = v29;
  if (v26)
  {
    if (v26 != 1)
    {
      if (v26 == 2)
      {
        health::FormatString<unsigned long long const&,unsigned long long const&>((std::string *)"({0}: {1})", *a4, *a4 + 8, &__p);
        size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          size = __p.__r_.__value_.__l.__size_;
        v14 = v28;
        if (v28 <= size)
          v14 = size;
        if (v27)
          size = v14;
        health::FormatImplementation<health::DataStore::ObjectIdentifier const&,health::BlockPointer &,health::BlockPointer &>(v12, a2, size + a3 + v8, a4);
        if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v15 = (char *)a2;
        else
          v15 = (char *)a2->__r_.__value_.__r.__words[0];
        goto LABEL_41;
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
LABEL_53:
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
    health::FormatString<unsigned long long const&,unsigned long long const&>((std::string *)"({0}: {1})", a4[1], a4[1] + 8, &__p);
    v18 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v18 = __p.__r_.__value_.__l.__size_;
    v19 = v28;
    if (v28 <= v18)
      v19 = v18;
    if (v27)
      v18 = v19;
    health::FormatImplementation<health::DataStore::ObjectIdentifier const&,health::BlockPointer &,health::BlockPointer &>(v12, a2, v18 + a3 + v8, a4);
    if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v15 = (char *)a2;
    else
      v15 = (char *)a2->__r_.__value_.__r.__words[0];
  }
  else
  {
    health::TypeFormatter<health::DataStore::ObjectIdentifier const&,void>::TypeFormatter((uint64_t)&__p, a4[2], (uint64_t)v25);
    v16 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v16 = __p.__r_.__value_.__l.__size_;
    v17 = v28;
    if (v28 <= v16)
      v17 = v16;
    if (v27)
      v16 = v17;
    health::FormatImplementation<health::DataStore::ObjectIdentifier const&,health::BlockPointer &,health::BlockPointer &>(v12, a2, v16 + a3 + v8, a4);
    if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v15 = (char *)a2;
    else
      v15 = (char *)a2->__r_.__value_.__r.__words[0];
  }
LABEL_41:
  health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,unsigned long long &>(v25, &v15[a3 + v8], (const void **)&__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v8)
    health::CopyFormatSectionToResult(a1, a2, a3, v8, v9 & 1);
}

void sub_1B7DEFE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;

  __cxa_free_exception(v23);
  _Unwind_Resume(a1);
}

void health::FormatterParameters<0ul,health::DataStore::ObjectIdentifier const&,health::BlockPointer &,health::BlockPointer &>::formatOptionsAtIndex<health::DataStore::ObjectIdentifier const&,health::BlockPointer &,health::BlockPointer &>(uint64_t a1)
{
  std::runtime_error *v2;
  std::runtime_error *exception;

  if (a1 && a1 != 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    v2 = exception;
    if (a1 == 2)
      std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
    else
      std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
  }
  else
  {
    v2 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v2, "Requested parameter is not an FormatOptions instance.");
  }
  __cxa_throw(v2, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1B7DEFF78(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void health::FormatImplementation<health::DataStore::ObjectIdentifier const&,health::BlockPointer &>(std::string *a1, std::string *a2, std::string::size_type a3, uint64_t *a4)
{
  uint64_t v8;
  char v9;
  char *i;
  int v11;
  char *v12;
  std::string::size_type size;
  std::string::size_type v14;
  char *v15;
  std::string::size_type v16;
  std::string::size_type v17;
  int v18;
  uint64_t v19;
  char *v20;
  int v21;
  std::runtime_error *exception;
  _BYTE v23[8];
  uint64_t v24;
  char v25;
  std::string::size_type v26;
  char *v27;
  std::string __p;

  v8 = 0;
  v9 = 0;
  for (i = (char *)a1; ; ++i)
  {
    v27 = i;
    if (*i == 123)
      break;
    if (!*i)
    {
      std::string::resize(a2, a3 - v8, 0);
      if (v8)
        health::CopyFormatSectionToResult(a1, a2, a3, -v8, v9 & 1);
      return;
    }
LABEL_7:
    --v8;
  }
  v11 = i[1];
  if (v11 == 123)
  {
    v27 = i + 1;
    v9 = 1;
    ++i;
    goto LABEL_7;
  }
  if (v11 == 42)
  {
    v27 = i + 2;
    v18 = i[2];
    if ((v18 - 48) > 9)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format string- missing numeric value.");
    }
    else
    {
      v19 = 0;
      v20 = i + 3;
      do
      {
        v27 = v20;
        v19 = (v18 - 48) + 10 * v19;
        v21 = *v20++;
        v18 = v21;
      }
      while ((v21 - 58) >= 0xFFFFFFF6);
      v27 = v20;
      if (*(v20 - 1) == 125)
        health::FormatterParameters<0ul,health::DataStore::ObjectIdentifier const&,health::BlockPointer &>::formatOptionsAtIndex<health::DataStore::ObjectIdentifier const&,health::BlockPointer &>(v19);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format options reference: Must be of form {*<index>} but no trailing '}' found.");
    }
    goto LABEL_43;
  }
  health::FormatOptions::FormatOptions((uint64_t)v23, (const char **)&v27);
  v12 = v27;
  if (v24)
  {
    if (v24 == 1)
    {
      health::FormatString<unsigned long long const&,unsigned long long const&>((std::string *)"({0}: {1})", *a4, *a4 + 8, &__p);
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        size = __p.__r_.__value_.__l.__size_;
      v14 = v26;
      if (v26 <= size)
        v14 = size;
      if (v25)
        size = v14;
      health::FormatImplementation<health::DataStore::ObjectIdentifier const&,health::BlockPointer &>(v12, a2, size + a3 - v8, a4);
      if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v15 = (char *)a2;
      else
        v15 = (char *)a2->__r_.__value_.__r.__words[0];
      goto LABEL_31;
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
LABEL_43:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  health::TypeFormatter<health::DataStore::ObjectIdentifier const&,void>::TypeFormatter((uint64_t)&__p, a4[1], (uint64_t)v23);
  v16 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v16 = __p.__r_.__value_.__l.__size_;
  v17 = v26;
  if (v26 <= v16)
    v17 = v16;
  if (v25)
    v16 = v17;
  health::FormatImplementation<health::DataStore::ObjectIdentifier const&,health::BlockPointer &>(v12, a2, v16 + a3 - v8, a4);
  if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v15 = (char *)a2;
  else
    v15 = (char *)a2->__r_.__value_.__r.__words[0];
LABEL_31:
  health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,unsigned long long &>(v23, &v15[a3 - v8], (const void **)&__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v8)
    health::CopyFormatSectionToResult(a1, a2, a3, -v8, v9 & 1);
}

void sub_1B7DF027C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;

  __cxa_free_exception(v23);
  _Unwind_Resume(a1);
}

void health::FormatterParameters<0ul,health::DataStore::ObjectIdentifier const&,health::BlockPointer &>::formatOptionsAtIndex<health::DataStore::ObjectIdentifier const&,health::BlockPointer &>(uint64_t a1)
{
  std::runtime_error *v1;
  std::runtime_error *exception;

  if (a1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    v1 = exception;
    if (a1 == 1)
      std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
    else
      std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
  }
  else
  {
    v1 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v1, "Requested parameter is not an FormatOptions instance.");
  }
  __cxa_throw(v1, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1B7DF033C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void health::FormatImplementation<char const*,char const*>(std::string *a1, std::string *a2, std::string::size_type a3, const char ***a4)
{
  uint64_t v8;
  char v9;
  char *i;
  int v11;
  const char **v12;
  const char *v13;
  const char *v14;
  const char *v15;
  std::string *v16;
  int v17;
  uint64_t v18;
  char *v19;
  int v20;
  std::runtime_error *exception;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  char *v26;
  _QWORD v27[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v8 = 0;
  v9 = 0;
  for (i = (char *)a1; ; ++i)
  {
    v26 = i;
    if (*i == 123)
      break;
    if (!*i)
    {
      std::string::resize(a2, a3 - v8, 0);
      if (v8)
        health::CopyFormatSectionToResult(a1, a2, a3, -v8, v9 & 1);
      return;
    }
LABEL_7:
    --v8;
  }
  v11 = i[1];
  if (v11 == 123)
  {
    v26 = i + 1;
    v9 = 1;
    ++i;
    goto LABEL_7;
  }
  if (v11 == 42)
  {
    v26 = i + 2;
    v17 = i[2];
    if ((v17 - 48) > 9)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format string- missing numeric value.");
    }
    else
    {
      v18 = 0;
      v19 = i + 3;
      do
      {
        v26 = v19;
        v18 = (v17 - 48) + 10 * v18;
        v20 = *v19++;
        v17 = v20;
      }
      while ((v20 - 58) >= 0xFFFFFFF6);
      v26 = v19;
      if (*(v19 - 1) == 125)
        health::FormatterParameters<0ul,char const*,char const*>::formatOptionsAtIndex<char const*,char const*>(v18);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format options reference: Must be of form {*<index>} but no trailing '}' found.");
    }
    goto LABEL_35;
  }
  health::FormatOptions::FormatOptions((uint64_t)&v22, (const char **)&v26);
  if (*((_QWORD *)&v22 + 1))
  {
    if (*((_QWORD *)&v22 + 1) == 1)
    {
      v12 = *a4;
      goto LABEL_15;
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
LABEL_35:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  v12 = a4[1];
LABEL_15:
  v13 = *v12;
  v27[0] = v13;
  if (v13)
    v13 = (const char *)strlen(v13);
  v27[1] = v13;
  v28 = v22;
  v29 = v23;
  v30 = v24;
  v31 = v25;
  v14 = (const char *)*((_QWORD *)&v23 + 1);
  if (*((_QWORD *)&v23 + 1) <= (unint64_t)v13)
    v14 = v13;
  if ((_BYTE)v23)
    v15 = v14;
  else
    v15 = v13;
  health::FormatImplementation<char const*,char const*>(v26, a2, &v15[a3 - v8], a4);
  if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v16 = a2;
  else
    v16 = (std::string *)a2->__r_.__value_.__r.__words[0];
  health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,char const*>(&v22, (_BYTE *)v16 + a3 - v8, (uint64_t)v27);
  if (v8)
    health::CopyFormatSectionToResult(a1, a2, a3, -v8, v9 & 1);
}

void sub_1B7DF05C4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void health::FormatterParameters<0ul,char const*,char const*>::formatOptionsAtIndex<char const*,char const*>(uint64_t a1)
{
  std::runtime_error *v1;
  std::runtime_error *exception;

  if (a1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    v1 = exception;
    if (a1 == 1)
      std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
    else
      std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
  }
  else
  {
    v1 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v1, "Requested parameter is not an FormatOptions instance.");
  }
  __cxa_throw(v1, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1B7DF0660(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<health::DataStore::rebuildIndex(void)::$_0,std::allocator<health::DataStore::rebuildIndex(void)::$_0>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::~__func()
{
  JUMPOUT(0x1BCCAC494);
}

_QWORD *std::__function::__func<health::DataStore::rebuildIndex(void)::$_0,std::allocator<health::DataStore::rebuildIndex(void)::$_0>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E6D0AF10;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<health::DataStore::rebuildIndex(void)::$_0,std::allocator<health::DataStore::rebuildIndex(void)::$_0>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E6D0AF10;
  a2[1] = v2;
  return result;
}

BOOL std::__function::__func<health::DataStore::rebuildIndex(void)::$_0,std::allocator<health::DataStore::rebuildIndex(void)::$_0>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t **v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int128 v15;
  unsigned __int8 v16;
  _QWORD v17[3];
  _BYTE v18[552];
  _QWORD v19[3];
  _QWORD v20[2];
  uint64_t *v21;
  uint64_t v22;
  _BYTE v23[552];
  uint64_t *v24[3];
  uint64_t **v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 8);
  v20[1] = 0;
  v20[0] = 0;
  v21 = (uint64_t *)a2;
  v22 = a2;
  v5 = *(_QWORD *)(v3 + 872);
  v19[0] = *(_QWORD *)(v3 + 864);
  v4 = v19[0];
  v19[1] = v5;
  v19[2] = v20;
  bzero(v18, 0x223uLL);
  v6 = health::BlockAccessFile::WriteTransaction::_requestBlockOfLength((health::BlockAccessFile::WriteTransaction *)a2, 547);
  v8 = v7;
  health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(a2, v6, v7, (uint64_t)v18);
  v17[0] = v6;
  v17[1] = v8;
  v17[2] = v20;
  v24[0] = v17;
  bzero(v23, 0x223uLL);
  health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(v21, v4, v5, (uint64_t)v23);
  health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>((uint64_t)v19, 0, (uint64_t)v23, v24);
  v9 = (_OWORD *)(v3 + 864);
  v16 = 1;
  v15 = *(_OWORD *)(v3 + 864);
  *(_QWORD *)(v3 + 864) = v6;
  *(_QWORD *)(v3 + 872) = v8;
  v24[0] = (uint64_t *)&off_1E6D0AF80;
  v24[1] = (uint64_t *)&v16;
  v25 = v24;
  health::DataStore::checkIntegrity(v3, (uint64_t)v24);
  v10 = v25;
  if (v25 == v24)
  {
    v11 = 4;
    v10 = v24;
  }
  else
  {
    if (!v25)
      goto LABEL_6;
    v11 = 5;
  }
  ((void (*)(void))(*v10)[v11])();
LABEL_6:
  v12 = v16;
  if (v16)
  {
    v13 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(v13 + 40) = v6;
    *(_QWORD *)(v13 + 48) = v8;
    health::TransactionalFile::WriteTransaction::storeObjectAtOffset<health::BlockAccessFile::BlockAccessFileHeader &>(*(health::TransactionalFile::WriteTransaction **)(a2 + 16), *(_QWORD *)(a2 + 24), 0);
  }
  else
  {
    *v9 = v15;
  }
  return v12 != 0;
}

void sub_1B7DF0890(_Unwind_Exception *exception_object)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = *(_QWORD **)(v2 - 80);
  if (v4 == v1)
  {
    v5 = 4;
    v4 = (_QWORD *)(v2 - 104);
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<health::DataStore::rebuildIndex(void)::$_0,std::allocator<health::DataStore::rebuildIndex(void)::$_0>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::target(uint64_t a1, uint64_t a2)
{
    return a1 + 8;
  else
    return 0;
}

void *std::__function::__func<health::DataStore::rebuildIndex(void)::$_0,std::allocator<health::DataStore::rebuildIndex(void)::$_0>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::target_type()
{
}

uint64_t health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>(uint64_t result, int a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  __n128 *v12;
  __n128 *v13;
  int64_t v14;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  unint64_t j;
  int64_t v21;
  __n128 *v22;
  __n128 *v23;
  BOOL v24;
  _BYTE v25[544];
  unsigned __int16 v26;
  __int128 v27;
  __int128 v28;
  std::string v29;
  __n128 v30[34];
  unsigned __int16 v31;
  __int128 v32;
  __int128 v33;
  std::string v34;
  _QWORD v35[3];
  __n128 v36[2];

  if (*(_WORD *)(a3 + 544))
  {
    v5 = result;
    if (*(_BYTE *)(a3 + 546))
    {
      v6 = *(_QWORD *)(a3 + 16);
      v7 = *(_QWORD *)(a3 + 24);
      v8 = *(_QWORD *)(result + 16);
      bzero(v25, 0x222uLL);
      v27 = 0u;
      v28 = 0u;
      result = health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v8 + 16), v6, v7, (uint64_t)v25);
      if (v26)
      {
        v9 = 0;
        v10 = 0;
        v11 = 0;
        do
        {
          v12 = (__n128 *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v25, v9);
          v13 = (__n128 *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v25, v9);
          v14 = v12->n128_u64[0];
          if (v9 && v14 <= v11 && (v14 < v11 || v12->n128_u64[1] <= v10))
          {
            std::string::basic_string[abi:ne180100]<0>(v30, "key > lastKey");
            std::string::basic_string[abi:ne180100]<0>(v36, "_enumerateLeaves");
            std::string::basic_string[abi:ne180100]<0>(v35, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
            health::FormatString<>((std::string *)"Out of order keys during btree enumeration.", &v34);
            health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v30, (uint64_t)v36, (uint64_t)v35, 382, (uint64_t)&v34);
          }
          v10 = v12->n128_u64[1];
          v30[0] = v13[1];
          result = health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::setValueForKey(*a4, v12, v30);
          ++v9;
          v11 = v14;
        }
        while (v9 < v26);
      }
      else
      {
        v14 = 0;
        v10 = 0;
      }
      v18 = *((_QWORD *)&v28 + 1);
      for (i = v28; ; i = v33)
      {
        v19 = *(_QWORD *)(v5 + 16);
        if (i == *(_QWORD *)v19 && v18 == *(_QWORD *)(v19 + 8))
          break;
        bzero(v30, 0x222uLL);
        v32 = 0u;
        v33 = 0u;
        health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v19 + 16), i, v18, (uint64_t)v30);
        if (!v31)
        {
          std::string::basic_string[abi:ne180100]<0>(v36, "leaf.valueCount > 0");
          std::string::basic_string[abi:ne180100]<0>(v35, "_enumerateLeaves");
          std::string::basic_string[abi:ne180100]<0>(&v34, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
          health::FormatString<>((std::string *)"Empty leaf encountered during enumeration.", &v29);
          health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v36, (uint64_t)v35, (uint64_t)&v34, 392, (uint64_t)&v29);
        }
        for (j = 0; j < v31; ++j)
        {
          v21 = v14;
          v22 = (__n128 *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v30, j);
          v23 = (__n128 *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v30, j);
          v14 = v22->n128_u64[0];
          if ((int64_t)v22->n128_u64[0] <= v21)
          {
            v24 = (int64_t)v22->n128_u64[0] >= v21 && v22->n128_u64[1] > v10;
            v10 = v22->n128_u64[1];
            if (!v24)
            {
              std::string::basic_string[abi:ne180100]<0>(v36, "key > lastKey");
              std::string::basic_string[abi:ne180100]<0>(v35, "_enumerateLeaves");
              std::string::basic_string[abi:ne180100]<0>(&v34, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
              health::FormatString<>((std::string *)"Out of order keys during btree enumeration.", &v29);
              health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v36, (uint64_t)v35, (uint64_t)&v34, 396, (uint64_t)&v29);
            }
          }
          else
          {
            v10 = v22->n128_u64[1];
          }
          v36[0] = v23[1];
          result = health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::setValueForKey(*a4, v22, v36);
        }
        v18 = *((_QWORD *)&v33 + 1);
      }
    }
    else
    {
      health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_interiorChildAtIndex(v30, result, a2, a3, 0);
      return health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>(v5, (a2 + 1), v30, a4);
    }
  }
  return result;
}

void sub_1B7DF0CA4(_Unwind_Exception *a1)
{
  uint64_t v1;

  if (*(char *)(v1 - 137) < 0)
    operator delete(*(void **)(v1 - 160));
  if (*(char *)(v1 - 113) < 0)
    operator delete(*(void **)(v1 - 136));
  if (*(char *)(v1 - 89) < 0)
    operator delete(*(void **)(v1 - 112));
  if (SLOBYTE(STACK[0x277]) < 0)
    operator delete((void *)STACK[0x260]);
  _Unwind_Resume(a1);
}

void std::__function::__func<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(std::string const&)#1},std::allocator<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(std::string const&)#1}>,void ()(std::string const&)>::~__func()
{
  JUMPOUT(0x1BCCAC494);
}

_QWORD *std::__function::__func<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(std::string const&)#1},std::allocator<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(std::string const&)#1}>,void ()(std::string const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E6D0AF80;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(std::string const&)#1},std::allocator<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(std::string const&)#1}>,void ()(std::string const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E6D0AF80;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(std::string const&)#1},std::allocator<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(std::string const&)#1}>,void ()(std::string const&)>::operator()(uint64_t result)
{
  **(_BYTE **)(result + 8) = 0;
  return result;
}

uint64_t std::__function::__func<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(std::string const&)#1},std::allocator<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(std::string const&)#1}>,void ()(std::string const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(std::string const&)#1},std::allocator<health::DataStore::rebuildIndex(void)::$_0::operator() const(health::BlockAccessFile::WriteTransaction &)::{lambda(std::string const&)#1}>,void ()(std::string const&)>::target_type()
{
}

void std::__function::__func<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0,std::allocator<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::~__func()
{
  JUMPOUT(0x1BCCAC494);
}

__n128 std::__function::__func<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0,std::allocator<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_1E6D0B020;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0,std::allocator<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E6D0B020;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0,std::allocator<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8[3];
  _QWORD v9[3];
  _BYTE v10[552];

  v9[0] = 0;
  v9[1] = 0;
  v9[2] = a2;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(v3 + 872);
  v8[0] = *(_QWORD *)(v3 + 864);
  v8[1] = v5;
  v8[2] = (uint64_t)v9;
  v7 = v4;
  bzero(v10, 0x223uLL);
  health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(a2, v8[0], v5, (uint64_t)v10);
  return health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0::operator() const(health::BlockAccessFile::ReadTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>((uint64_t)v8, 0, (uint64_t)v10, &v7);
}

uint64_t std::__function::__func<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0,std::allocator<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0,std::allocator<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0>,void ()(health::BlockAccessFile::ReadTransaction const&)>::target_type()
{
}

uint64_t health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0::operator() const(health::BlockAccessFile::ReadTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>(uint64_t result, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v20;
  uint64_t v21;
  unint64_t j;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[544];
  unsigned __int16 v30;
  __int128 v31;
  __int128 v32;
  std::string v33;
  _OWORD v34[34];
  unsigned __int16 v35;
  __int128 v36;
  __int128 v37;
  std::string v38;
  _QWORD v39[3];
  _OWORD v40[2];

  if (*(_WORD *)(a3 + 544))
  {
    v5 = result;
    if (*(_BYTE *)(a3 + 546))
    {
      v6 = *(_QWORD *)(a3 + 16);
      v7 = *(_QWORD *)(a3 + 24);
      v8 = *(_QWORD *)(result + 16);
      bzero(v29, 0x222uLL);
      v31 = 0u;
      v32 = 0u;
      result = health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v8 + 16), v6, v7, (uint64_t)v29);
      if (v30)
      {
        v9 = 0;
        v10 = 0;
        v11 = 0;
        do
        {
          v12 = (uint64_t *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v29, v9);
          v13 = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v29, v9);
          v14 = *v12;
          if (v9 && v14 <= v11 && (v14 < v11 || v12[1] <= v10))
          {
            std::string::basic_string[abi:ne180100]<0>(v34, "key > lastKey");
            std::string::basic_string[abi:ne180100]<0>(v40, "_enumerateLeaves");
            std::string::basic_string[abi:ne180100]<0>(v39, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
            health::FormatString<>((std::string *)"Out of order keys during btree enumeration.", &v38);
            health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v34, (uint64_t)v40, (uint64_t)v39, 382, (uint64_t)&v38);
          }
          v10 = v12[1];
          v16 = *a4;
          v34[0] = *(_OWORD *)(v13 + 16);
          v17 = *(_QWORD *)(v16 + 24);
          if (!v17)
LABEL_33:
            std::__throw_bad_function_call[abi:ne180100]();
          result = (*(uint64_t (**)(uint64_t, uint64_t *, _OWORD *))(*(_QWORD *)v17 + 48))(v17, v12, v34);
          ++v9;
          v11 = v14;
        }
        while (v9 < v30);
      }
      else
      {
        v14 = 0;
        v10 = 0;
      }
      v20 = *((_QWORD *)&v32 + 1);
      for (i = v32; ; i = v37)
      {
        v21 = *(_QWORD *)(v5 + 16);
        if (i == *(_QWORD *)v21 && v20 == *(_QWORD *)(v21 + 8))
          break;
        bzero(v34, 0x222uLL);
        v36 = 0u;
        v37 = 0u;
        health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v21 + 16), i, v20, (uint64_t)v34);
        if (!v35)
        {
          std::string::basic_string[abi:ne180100]<0>(v40, "leaf.valueCount > 0");
          std::string::basic_string[abi:ne180100]<0>(v39, "_enumerateLeaves");
          std::string::basic_string[abi:ne180100]<0>(&v38, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
          health::FormatString<>((std::string *)"Empty leaf encountered during enumeration.", &v33);
          health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v40, (uint64_t)v39, (uint64_t)&v38, 392, (uint64_t)&v33);
        }
        for (j = 0; j < v35; ++j)
        {
          v23 = v14;
          v24 = (uint64_t *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v34, j);
          v25 = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v34, j);
          v14 = *v24;
          if (*v24 <= v23)
          {
            v26 = *v24 >= v23 && v24[1] > v10;
            v10 = v24[1];
            if (!v26)
            {
              std::string::basic_string[abi:ne180100]<0>(v40, "key > lastKey");
              std::string::basic_string[abi:ne180100]<0>(v39, "_enumerateLeaves");
              std::string::basic_string[abi:ne180100]<0>(&v38, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
              health::FormatString<>((std::string *)"Out of order keys during btree enumeration.", &v33);
              health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v40, (uint64_t)v39, (uint64_t)&v38, 396, (uint64_t)&v33);
            }
          }
          else
          {
            v10 = v24[1];
          }
          v27 = *a4;
          v40[0] = *(_OWORD *)(v25 + 16);
          v28 = *(_QWORD *)(v27 + 24);
          if (!v28)
            goto LABEL_33;
          result = (*(uint64_t (**)(uint64_t, uint64_t *, _OWORD *))(*(_QWORD *)v28 + 48))(v28, v24, v40);
        }
        v20 = *((_QWORD *)&v37 + 1);
      }
    }
    else
    {
      health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_interiorChildAtIndex(v34, result, a2, a3, 0);
      return health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::enumerateObjectTreeForInspecting(std::function<void ()(health::DataStore::ObjectIdentifier const&,health::BlockPointer)>)::$_0::operator() const(health::BlockAccessFile::ReadTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>(v5, (a2 + 1), v34, a4);
    }
  }
  return result;
}

void sub_1B7DF12C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  if (*(char *)(v1 - 137) < 0)
    operator delete(*(void **)(v1 - 160));
  if (*(char *)(v1 - 113) < 0)
    operator delete(*(void **)(v1 - 136));
  if (*(char *)(v1 - 89) < 0)
    operator delete(*(void **)(v1 - 112));
  if (SLOBYTE(STACK[0x277]) < 0)
    operator delete((void *)STACK[0x260]);
  _Unwind_Resume(a1);
}

void health::FormatImplementation<std::string &,int &>(std::string *a1, std::string *a2, std::string::size_type a3, uint64_t *a4)
{
  uint64_t v8;
  char v9;
  char *i;
  int v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  char *v20;
  int v21;
  std::runtime_error *exception;
  _BYTE v23[8];
  uint64_t v24;
  char v25;
  unint64_t v26;
  char *v27;
  void *__p;
  unint64_t v29;
  unsigned __int8 v30;

  v8 = 0;
  v9 = 0;
  for (i = (char *)a1; ; ++i)
  {
    v27 = i;
    if (*i == 123)
      break;
    if (!*i)
    {
      std::string::resize(a2, a3 - v8, 0);
      if (v8)
        health::CopyFormatSectionToResult(a1, a2, a3, -v8, v9 & 1);
      return;
    }
LABEL_7:
    --v8;
  }
  v11 = i[1];
  if (v11 == 123)
  {
    v27 = i + 1;
    v9 = 1;
    ++i;
    goto LABEL_7;
  }
  if (v11 == 42)
  {
    v27 = i + 2;
    v18 = i[2];
    if ((v18 - 48) > 9)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format string- missing numeric value.");
    }
    else
    {
      v19 = 0;
      v20 = i + 3;
      do
      {
        v27 = v20;
        v19 = (v18 - 48) + 10 * v19;
        v21 = *v20++;
        v18 = v21;
      }
      while ((v21 - 58) >= 0xFFFFFFF6);
      v27 = v20;
      if (*(v20 - 1) == 125)
        health::FormatterParameters<0ul,std::string &,int &>::formatOptionsAtIndex<std::string &,int &>(v19);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format options reference: Must be of form {*<index>} but no trailing '}' found.");
    }
    goto LABEL_43;
  }
  health::FormatOptions::FormatOptions((uint64_t)v23, (const char **)&v27);
  v12 = v27;
  if (v24)
  {
    if (v24 == 1)
    {
      health::TypeFormatter<int &,void>::TypeFormatter((uint64_t)&__p, *a4, (uint64_t)v23);
      v13 = v30;
      if ((v30 & 0x80u) != 0)
        v13 = v29;
      v14 = v26;
      if (v26 <= v13)
        v14 = v13;
      if (v25)
        v13 = v14;
      health::FormatImplementation<std::string &,int &>(v12, a2, v13 + a3 - v8, a4);
      if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v15 = (char *)a2;
      else
        v15 = (char *)a2->__r_.__value_.__r.__words[0];
      goto LABEL_31;
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
LABEL_43:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  health::TypeFormatter<std::string &,void>::TypeFormatter((uint64_t)&__p, a4[1], (uint64_t)v23);
  v16 = v30;
  if ((v30 & 0x80u) != 0)
    v16 = v29;
  v17 = v26;
  if (v26 <= v16)
    v17 = v16;
  if (v25)
    v16 = v17;
  health::FormatImplementation<std::string &,int &>(v12, a2, v16 + a3 - v8, a4);
  if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v15 = (char *)a2;
  else
    v15 = (char *)a2->__r_.__value_.__r.__words[0];
LABEL_31:
  health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,unsigned long long &>(v23, &v15[a3 - v8], (const void **)&__p);
  if ((char)v30 < 0)
    operator delete(__p);
  if (v8)
    health::CopyFormatSectionToResult(a1, a2, a3, -v8, v9 & 1);
}

void sub_1B7DF1678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;

  __cxa_free_exception(v23);
  _Unwind_Resume(a1);
}

void health::FormatterParameters<0ul,std::string &,int &>::formatOptionsAtIndex<std::string &,int &>(uint64_t a1)
{
  std::runtime_error *v1;
  std::runtime_error *exception;

  if (a1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    v1 = exception;
    if (a1 == 1)
      std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
    else
      std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
  }
  else
  {
    v1 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v1, "Requested parameter is not an FormatOptions instance.");
  }
  __cxa_throw(v1, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1B7DF1738(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void health::FormatImplementation<std::string &>(std::string *a1, std::string *a2, std::string::size_type a3, uint64_t *a4)
{
  uint64_t v8;
  char v9;
  char *i;
  int v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  int v16;
  uint64_t v17;
  char *v18;
  int v19;
  std::runtime_error *exception;
  char v21[8];
  uint64_t v22;
  char v23;
  unint64_t v24;
  char *v25;
  void *__p[2];
  unsigned __int8 v27;

  v8 = 0;
  v9 = 0;
  for (i = (char *)a1; ; ++i)
  {
    v25 = i;
    if (*i == 123)
      break;
    if (!*i)
    {
      std::string::resize(a2, a3 - v8, 0);
      if (v8)
        health::CopyFormatSectionToResult(a1, a2, a3, -v8, v9 & 1);
      return;
    }
LABEL_7:
    --v8;
  }
  v11 = i[1];
  if (v11 == 123)
  {
    v25 = i + 1;
    v9 = 1;
    ++i;
    goto LABEL_7;
  }
  if (v11 == 42)
  {
    v25 = i + 2;
    v16 = i[2];
    if ((v16 - 48) > 9)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format string- missing numeric value.");
    }
    else
    {
      v17 = 0;
      v18 = i + 3;
      do
      {
        v25 = v18;
        v17 = (v16 - 48) + 10 * v17;
        v19 = *v18++;
        v16 = v19;
      }
      while ((v19 - 58) >= 0xFFFFFFF6);
      v25 = v18;
      if (*(v18 - 1) == 125)
        health::FormatterParameters<0ul,std::string &>::formatOptionsAtIndex<std::string &>(v17);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "Invalid format options reference: Must be of form {*<index>} but no trailing '}' found.");
    }
LABEL_33:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  health::FormatOptions::FormatOptions((uint64_t)v21, (const char **)&v25);
  if (v22)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
    goto LABEL_33;
  }
  v12 = v25;
  health::TypeFormatter<std::string &,void>::TypeFormatter((uint64_t)__p, *a4, (uint64_t)v21);
  v13 = v27;
  if ((v27 & 0x80u) != 0)
    v13 = (unint64_t)__p[1];
  v14 = v24;
  if (v24 <= v13)
    v14 = v13;
  if (v23)
    v13 = v14;
  health::FormatImplementation<std::string &>(v12, a2, v13 + a3 - v8, a4);
  if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v15 = (char *)a2;
  else
    v15 = (char *)a2->__r_.__value_.__r.__words[0];
  health::FormatOptions::justifyNativeValueOfLength<std::__wrap_iter<char *>,unsigned long long &>(v21, &v15[a3 - v8], (const void **)__p);
  if ((char)v27 < 0)
    operator delete(__p[0]);
  if (v8)
    health::CopyFormatSectionToResult(a1, a2, a3, -v8, v9 & 1);
}

void sub_1B7DF19AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;

  __cxa_free_exception(v23);
  _Unwind_Resume(a1);
}

void health::FormatterParameters<0ul,std::string &>::formatOptionsAtIndex<std::string &>(uint64_t a1)
{
  std::runtime_error *exception;
  std::runtime_error *v3;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  v3 = exception;
  if (a1)
    std::runtime_error::runtime_error(exception, "Parameter index out of bounds.");
  else
    std::runtime_error::runtime_error(exception, "Requested parameter is not an FormatOptions instance.");
  __cxa_throw(v3, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1B7DF1A40(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__function::__func<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_0,std::allocator<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_0>,BOOL ()(health::BlockAccessFile::IntegrityError,long long,long long,std::string const&)>::~__func()
{
  JUMPOUT(0x1BCCAC494);
}

_QWORD *std::__function::__func<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_0,std::allocator<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_0>,BOOL ()(health::BlockAccessFile::IntegrityError,long long,long long,std::string const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E6D0B0A0;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_0,std::allocator<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_0>,BOOL ()(health::BlockAccessFile::IntegrityError,long long,long long,std::string const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E6D0B0A0;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_0,std::allocator<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_0>,BOOL ()(health::BlockAccessFile::IntegrityError,long long,long long,std::string const&)>::operator()(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>::operator()(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 24), 1, *a3, *a4, a5);
  return 1;
}

uint64_t std::__function::__func<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_0,std::allocator<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_0>,BOOL ()(health::BlockAccessFile::IntegrityError,long long,long long,std::string const&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_0,std::allocator<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_0>,BOOL ()(health::BlockAccessFile::IntegrityError,long long,long long,std::string const&)>::target_type()
{
}

void std::__function::__func<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1,std::allocator<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::~__func()
{
  JUMPOUT(0x1BCCAC494);
}

__n128 std::__function::__func<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1,std::allocator<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = &off_1E6D0B120;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1,std::allocator<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E6D0B120;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t std::__function::__func<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1,std::allocator<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];
  __int128 v14;
  uint64_t v15[3];
  _QWORD v16[3];
  void *__p[2];
  char v18;
  _OWORD v19[3];
  char v20;
  char *v21[7];
  _BYTE v22[552];
  _BYTE v23[24];
  _BYTE *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_OWORD *)(a2 + 16);
  v19[0] = *(_OWORD *)a2;
  v19[1] = v5;
  v19[2] = *(_OWORD *)(a2 + 32);
  v20 = *(_BYTE *)(a2 + 48);
  std::deque<health::BlockPointer>::deque(v21, (_QWORD *)(a2 + 56));
  v6 = *(_QWORD *)(v4 + 864);
  v7 = *(_QWORD *)(v4 + 872);
  std::string::basic_string[abi:ne180100]<0>(__p, "Object Store");
  v8 = **(_QWORD **)(a1 + 16);
  std::__function::__value_func<BOOL ()(double const&,double const&)>::__value_func[abi:ne180100]((uint64_t)v23, *(_QWORD *)(a1 + 24));
  health::DataStore::_checkBlockIntegrity(v4, (uint64_t *)v19, v6, v7, (uint64_t)__p, v8, (uint64_t)v23);
  v9 = v24;
  if (v24 == v23)
  {
    v10 = 4;
    v9 = v23;
  }
  else
  {
    if (!v24)
      goto LABEL_6;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_6:
  if (v18 < 0)
    operator delete(__p[0]);
  std::deque<health::BlockPointer>::~deque[abi:ne180100](v21);
  v16[0] = 0;
  v16[1] = 0;
  v16[2] = a2;
  v11 = *(_QWORD *)(v4 + 872);
  v15[0] = *(_QWORD *)(v4 + 864);
  v15[1] = v11;
  v15[2] = (uint64_t)v16;
  v13[0] = v4;
  v13[1] = a2;
  v14 = *(_OWORD *)(a1 + 16);
  bzero(v22, 0x223uLL);
  health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>((uint64_t *)a2, v15[0], v11, (uint64_t)v22);
  health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1::operator() const(health::BlockAccessFile::WriteTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>((uint64_t)v15, 0, (uint64_t)v22, (uint64_t)v13);
  return 1;
}

void sub_1B7DF1D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v29;
  uint64_t v30;

  v29 = *(_QWORD **)(v27 - 96);
  if (v29 == v26)
  {
    v30 = 4;
    v29 = (_QWORD *)(v27 - 120);
  }
  else
  {
    if (!v29)
      goto LABEL_6;
    v30 = 5;
  }
  (*(void (**)(void))(*v29 + 8 * v30))();
LABEL_6:
  if (a25 < 0)
    operator delete(__p);
  std::deque<health::BlockPointer>::~deque[abi:ne180100](v25);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1,std::allocator<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1,std::allocator<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1>,BOOL ()(health::BlockAccessFile::WriteTransaction &)>::target_type()
{
}

uint64_t health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1::operator() const(health::BlockAccessFile::WriteTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  unint64_t j;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  _BYTE v25[544];
  unsigned __int16 v26;
  __int128 v27;
  __int128 v28;
  std::string v29;
  _QWORD v30[68];
  unsigned __int16 v31;
  __int128 v32;
  __int128 v33;
  std::string v34;
  _QWORD v35[3];
  _QWORD v36[3];

  if (*(_WORD *)(a3 + 544))
  {
    v5 = result;
    if (*(_BYTE *)(a3 + 546))
    {
      v6 = *(_QWORD *)(a3 + 16);
      v7 = *(_QWORD *)(a3 + 24);
      v8 = *(_QWORD *)(result + 16);
      bzero(v25, 0x222uLL);
      v27 = 0u;
      v28 = 0u;
      result = health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v8 + 16), v6, v7, (uint64_t)v25);
      if (v26)
      {
        v9 = 0;
        v10 = 0;
        v11 = 0;
        do
        {
          v12 = (uint64_t *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v25, v9);
          v13 = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v25, v9);
          v14 = *v12;
          if (v9 && v14 <= v11 && (v14 < v11 || v12[1] <= v10))
          {
            std::string::basic_string[abi:ne180100]<0>(v30, "key > lastKey");
            std::string::basic_string[abi:ne180100]<0>(v36, "_enumerateLeaves");
            std::string::basic_string[abi:ne180100]<0>(v35, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
            health::FormatString<>((std::string *)"Out of order keys during btree enumeration.", &v34);
            health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v30, (uint64_t)v36, (uint64_t)v35, 382, (uint64_t)&v34);
          }
          v10 = v12[1];
          result = health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1::operator() const(health::BlockAccessFile::WriteTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>(int,health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17> const&,health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1::operator() const(health::BlockAccessFile::WriteTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1} const&,health::bplustree::EnumerationDirection)const::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer const&)#1}::operator()(a4, (uint64_t)v12, *(_QWORD *)(v13 + 16), *(_QWORD *)(v13 + 24));
          ++v9;
          v11 = v14;
        }
        while (v9 < v26);
      }
      else
      {
        v14 = 0;
        v10 = 0;
      }
      v18 = *((_QWORD *)&v28 + 1);
      for (i = v28; ; i = v33)
      {
        v19 = *(_QWORD *)(v5 + 16);
        if (i == *(_QWORD *)v19 && v18 == *(_QWORD *)(v19 + 8))
          break;
        bzero(v30, 0x222uLL);
        v32 = 0u;
        v33 = 0u;
        health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v19 + 16), i, v18, (uint64_t)v30);
        if (!v31)
        {
          std::string::basic_string[abi:ne180100]<0>(v36, "leaf.valueCount > 0");
          std::string::basic_string[abi:ne180100]<0>(v35, "_enumerateLeaves");
          std::string::basic_string[abi:ne180100]<0>(&v34, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
          health::FormatString<>((std::string *)"Empty leaf encountered during enumeration.", &v29);
          health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v36, (uint64_t)v35, (uint64_t)&v34, 392, (uint64_t)&v29);
        }
        for (j = 0; j < v31; ++j)
        {
          v21 = v14;
          v22 = (uint64_t *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v30, j);
          v23 = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v30, j);
          v14 = *v22;
          if (*v22 <= v21)
          {
            v24 = *v22 >= v21 && v22[1] > v10;
            v10 = v22[1];
            if (!v24)
            {
              std::string::basic_string[abi:ne180100]<0>(v36, "key > lastKey");
              std::string::basic_string[abi:ne180100]<0>(v35, "_enumerateLeaves");
              std::string::basic_string[abi:ne180100]<0>(&v34, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
              health::FormatString<>((std::string *)"Out of order keys during btree enumeration.", &v29);
              health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v36, (uint64_t)v35, (uint64_t)&v34, 396, (uint64_t)&v29);
            }
          }
          else
          {
            v10 = v22[1];
          }
          result = health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1::operator() const(health::BlockAccessFile::WriteTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>(int,health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17> const&,health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1::operator() const(health::BlockAccessFile::WriteTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1} const&,health::bplustree::EnumerationDirection)const::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer const&)#1}::operator()(a4, (uint64_t)v22, *(_QWORD *)(v23 + 16), *(_QWORD *)(v23 + 24));
        }
        v18 = *((_QWORD *)&v33 + 1);
      }
    }
    else
    {
      health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_interiorChildAtIndex(v30, result, a2, a3, 0);
      return health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1::operator() const(health::BlockAccessFile::WriteTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>(v5, (a2 + 1), v30, a4);
    }
  }
  return result;
}

void sub_1B7DF211C(_Unwind_Exception *a1)
{
  uint64_t v1;

  if (*(char *)(v1 - 129) < 0)
    operator delete(*(void **)(v1 - 152));
  if (*(char *)(v1 - 105) < 0)
    operator delete(*(void **)(v1 - 128));
  if (*(char *)(v1 - 81) < 0)
    operator delete(*(void **)(v1 - 104));
  if (SLOBYTE(STACK[0x277]) < 0)
    operator delete((void *)STACK[0x260]);
  _Unwind_Resume(a1);
}

uint64_t health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateAllValues<health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1::operator() const(health::BlockAccessFile::WriteTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1}>(int,health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17> const&,health::DataStore::checkIntegrityForInspecting(std::function<BOOL ()(health::DataStore::IntegrityError,health::BlockPointer,std::string const&)>)::$_1::operator() const(health::BlockAccessFile::WriteTransaction const&)::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer)#1} const&,health::bplustree::EnumerationDirection)const::{lambda(health::DataStore::ObjectIdentifier const&,health::BlockPointer const&)#1}::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  std::string __p;
  _OWORD v19[3];
  char v20;
  char *v21[6];
  _BYTE v22[24];
  _BYTE *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v10 = *(_BYTE *)(v8 + 48);
  v12 = *(_OWORD *)(v8 + 16);
  v11 = *(_OWORD *)(v8 + 32);
  v19[0] = *(_OWORD *)v8;
  v19[1] = v12;
  v19[2] = v11;
  v20 = v10;
  std::deque<health::BlockPointer>::deque(v21, (_QWORD *)(v8 + 56));
  health::FormatString<health::DataStore::ObjectIdentifier const&>((std::string *)"HFD object [ID: {0}]", a2, &__p);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = **(_QWORD **)(a1 + 16);
  std::__function::__value_func<BOOL ()(double const&,double const&)>::__value_func[abi:ne180100]((uint64_t)v22, v13);
  health::DataStore::_checkBlockIntegrity(v9, (uint64_t *)v19, a3, a4, (uint64_t)&__p, v14, (uint64_t)v22);
  v15 = v23;
  if (v23 == v22)
  {
    v16 = 4;
    v15 = v22;
  }
  else
  {
    if (!v23)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*v15 + 8 * v16))();
LABEL_6:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return std::deque<health::BlockPointer>::~deque[abi:ne180100](v21);
}

void sub_1B7DF2318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;

  v19 = *(_QWORD **)(v17 - 64);
  if (v19 == v16)
  {
    v20 = 4;
    v19 = (_QWORD *)(v17 - 88);
  }
  else
  {
    if (!v19)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*v19 + 8 * v20))();
LABEL_6:
  if (a15 < 0)
    operator delete(__p);
  std::deque<health::BlockPointer>::~deque[abi:ne180100](v15);
  _Unwind_Resume(a1);
}

_QWORD *health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateValuesInRange<health::DataStore::ReadTransaction::enumerateIdentifiersForObjectType(long long,std::function<void ()(health::DataStore::ObjectIdentifier)>)::$_0>(_QWORD *result, int a2, uint64_t a3, uint64_t *a4, _QWORD *a5, uint64_t *a6)
{
  _QWORD *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[69];
  __int128 v18;
  __int128 v19;

  if (*(_WORD *)(a3 + 544))
  {
    v11 = result;
    v12 = health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::childForKey(a3, a5);
    if (*(_BYTE *)(a3 + 546))
    {
      v13 = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a3, v12);
      v14 = *(_QWORD *)(v13 + 16);
      v15 = *(_QWORD *)(v13 + 24);
      v16 = v11[2];
      bzero(v17, 0x222uLL);
      v18 = 0u;
      v19 = 0u;
      health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v16 + 16), v14, v15, (uint64_t)v17);
      return health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateValuesInRange<health::DataStore::ReadTransaction::enumerateIdentifiersForObjectType(long long,std::function<void ()(health::DataStore::ObjectIdentifier)>)::$_0>(v11, (uint64_t)v17, a4, a5, a6);
    }
    else
    {
      health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_interiorChildAtIndex(v17, (uint64_t)v11, a2, a3, v12);
      return (_QWORD *)health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateValuesInRange<health::DataStore::ReadTransaction::enumerateIdentifiersForObjectType(long long,std::function<void ()(health::DataStore::ObjectIdentifier)>)::$_0>(v11, (a2 + 1), v17, a4, a5, a6);
    }
  }
  return result;
}

_QWORD *health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_enumerateValuesInRange<health::DataStore::ReadTransaction::enumerateIdentifiersForObjectType(long long,std::function<void ()(health::DataStore::ObjectIdentifier)>)::$_0>(_QWORD *result, uint64_t a2, uint64_t *a3, _QWORD *a4, uint64_t *a5)
{
  _QWORD *v8;
  unint64_t v9;
  unint64_t v11;
  unsigned int v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  BOOL v35;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[544];
  unsigned __int16 v40;
  __int128 v41;
  __int128 v42;
  std::string v43;
  uint64_t v44;
  unint64_t v45;
  unsigned __int16 v46;
  __int128 v47;
  __int128 v48;
  std::string v49;
  _QWORD v50[3];
  _QWORD v51[3];

  v8 = result;
  v9 = *(unsigned __int16 *)(a2 + 544);
  if (*(_WORD *)(a2 + 544))
  {
    v11 = 0;
    while (1)
    {
      result = (_QWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a2, v11);
      if (*result > *a4 || *result >= *a4 && result[1] >= a4[1])
        break;
      if (++v11 >= *(unsigned __int16 *)(a2 + 544))
      {
        v11 = v9;
        break;
      }
    }
    v12 = *(unsigned __int16 *)(a2 + 544);
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }
  if (v11 >= v12)
  {
LABEL_17:
    v17 = *(_QWORD *)(a2 + 568);
    v18 = *(_QWORD *)(a2 + 576);
    v19 = v8[2];
    if (v17 != *(_QWORD *)v19 || v18 != *(_QWORD *)(v19 + 8))
    {
      bzero(v39, 0x222uLL);
      v41 = 0u;
      v42 = 0u;
      result = (_QWORD *)health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v19 + 16), v17, v18, (uint64_t)v39);
      if (v40)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        while (1)
        {
          v23 = (uint64_t *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v39, v20);
          result = (_QWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)v39, v20);
          v24 = *v23;
          if (v20 && v24 <= v22 && (v24 < v22 || v23[1] <= v21))
          {
            std::string::basic_string[abi:ne180100]<0>(&v44, "key > lastKey");
            std::string::basic_string[abi:ne180100]<0>(v51, "_enumerateLeaves");
            std::string::basic_string[abi:ne180100]<0>(v50, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
            health::FormatString<>((std::string *)"Out of order keys during btree enumeration.", &v49);
            health::_HDAssertImplementation<health::btree_access_error>((uint64_t)&v44, (uint64_t)v51, (uint64_t)v50, 382, (uint64_t)&v49);
          }
          if (v24 > *a5)
            break;
          v21 = v23[1];
          if (v24 >= *a5 && v21 > a5[1])
            break;
          v27 = *a3;
          v44 = *v23;
          v45 = v21;
          v28 = *(_QWORD *)(v27 + 24);
          if (!v28)
            goto LABEL_58;
          result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v28 + 48))(v28, &v44);
          ++v20;
          v22 = v24;
          if (v20 >= v40)
            goto LABEL_38;
        }
      }
      else
      {
        v24 = 0;
        v21 = 0;
LABEL_38:
        v30 = *((_QWORD *)&v42 + 1);
        v29 = v42;
LABEL_39:
        v31 = v8[2];
        if (v29 != *(_QWORD *)v31 || v30 != *(_QWORD *)(v31 + 8))
        {
          bzero(&v44, 0x222uLL);
          v47 = 0u;
          v48 = 0u;
          health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v31 + 16), v29, v30, (uint64_t)&v44);
          if (!v46)
          {
            std::string::basic_string[abi:ne180100]<0>(v51, "leaf.valueCount > 0");
            std::string::basic_string[abi:ne180100]<0>(v50, "_enumerateLeaves");
            std::string::basic_string[abi:ne180100]<0>(&v49, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
            health::FormatString<>((std::string *)"Empty leaf encountered during enumeration.", &v43);
            health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v51, (uint64_t)v50, (uint64_t)&v49, 392, (uint64_t)&v43);
          }
          v32 = 0;
          while (1)
          {
            v33 = v24;
            v34 = (uint64_t *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)&v44, v32);
            result = (_QWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[]((uint64_t)&v44, v32);
            v24 = *v34;
            if (*v34 <= v33)
            {
              v35 = *v34 >= v33 && v34[1] > v21;
              v21 = v34[1];
              if (!v35)
              {
                std::string::basic_string[abi:ne180100]<0>(v51, "key > lastKey");
                std::string::basic_string[abi:ne180100]<0>(v50, "_enumerateLeaves");
                std::string::basic_string[abi:ne180100]<0>(&v49, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
                health::FormatString<>((std::string *)"Out of order keys during btree enumeration.", &v43);
                health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v51, (uint64_t)v50, (uint64_t)&v49, 396, (uint64_t)&v43);
              }
            }
            else
            {
              v21 = v34[1];
            }
            if (v24 > *a5)
              break;
            if (v24 >= *a5 && v21 > a5[1])
              break;
            v37 = *a3;
            v51[0] = *v34;
            v51[1] = v21;
            v38 = *(_QWORD *)(v37 + 24);
            if (!v38)
              goto LABEL_58;
            result = (_QWORD *)(*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v38 + 48))(v38, v51);
            if (++v32 >= v46)
            {
              v30 = *((_QWORD *)&v48 + 1);
              v29 = v48;
              goto LABEL_39;
            }
          }
        }
      }
    }
  }
  else
  {
    while (1)
    {
      v13 = (uint64_t *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a2, v11);
      result = (_QWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a2, v11);
      if (*v13 > *a5)
        break;
      if (*v13 >= *a5)
      {
        v14 = v13[1];
        if (v14 > a5[1])
          return result;
      }
      else
      {
        v14 = v13[1];
      }
      v15 = *a3;
      v44 = *v13;
      v45 = v14;
      v16 = *(_QWORD *)(v15 + 24);
      if (!v16)
LABEL_58:
        std::__throw_bad_function_call[abi:ne180100]();
      result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v16 + 48))(v16, &v44);
      if (++v11 >= *(unsigned __int16 *)(a2 + 544))
        goto LABEL_17;
    }
  }
  return result;
}

void sub_1B7DF28D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  if (SLOBYTE(STACK[0x25F]) < 0)
    operator delete((void *)STACK[0x248]);
  if (*(char *)(v1 - 129) < 0)
    operator delete(*(void **)(v1 - 152));
  if (*(char *)(v1 - 105) < 0)
    operator delete(*(void **)(v1 - 128));
  if (*(char *)(v1 - 81) < 0)
    operator delete(*(void **)(v1 - 104));
  _Unwind_Resume(a1);
}

uint64_t health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_removeValueForKey(uint64_t a1, int a2, _QWORD *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v5;

  if (!*(_WORD *)(a5 + 544))
    return 2;
  v5 = (a2 + 1);
  if (*(_BYTE *)(a5 + 546))
    return health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_removeValueForKeyWithLeafChildren(a1, v5, a3, a4, a5);
  else
    return health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_removeValueForKeyWithInteriorChildren(a1, v5, a3, a4, a5);
}

uint64_t health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_removeValueForKeyWithLeafChildren(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t *a4, uint64_t a5)
{
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  unsigned int v19;
  unsigned int v20;
  unsigned __int16 v21;
  BOOL v22;
  unsigned __int16 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  BOOL v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t *v33;
  uint64_t *v34;
  void **v35;
  void **v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  __int16 v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  unsigned __int16 v52;
  unsigned __int16 v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t *v56;
  void *__p[2];
  __int128 v58;
  __int128 v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  _OWORD v64[34];
  unsigned __int16 v65;
  __int128 v66;
  __int128 v67;
  std::string v68;
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[3];
  void *v72[2];
  __int128 v73;
  __int128 v74;
  std::string v75;
  std::string v76;
  _QWORD v77[2];

  if (!*(_WORD *)(a5 + 544))
  {
    std::string::basic_string[abi:ne180100]<0>(v71, "node.childCount > 0");
    std::string::basic_string[abi:ne180100]<0>(v70, "_removeValueForKeyWithLeafChildren");
    std::string::basic_string[abi:ne180100]<0>(v69, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
    health::FormatString<>((std::string *)"Attempt to remove from empty interior node.", &v68);
    health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v71, (uint64_t)v70, (uint64_t)v69, 749, (uint64_t)&v68);
  }
  v9 = health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::childForKey(a5, a3);
  v10 = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, v9);
  v12 = *(_QWORD *)(v10 + 16);
  v11 = *(_QWORD *)(v10 + 24);
  v13 = *(_QWORD *)(a1 + 16);
  bzero(v64, 0x222uLL);
  v66 = 0u;
  v67 = 0u;
  health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v13 + 24), v12, v11, (uint64_t)v64);
  v14 = health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>::indexForKey((uint64_t)v64, a3);
  if (HIDWORD(v14))
    return 2;
  if ((unsigned __int16)v14 >= 0x11uLL)
  {
    v15 = *MEMORY[0x1E0CB52B0];
    std::string::basic_string[abi:ne180100]<0>(v72, "index < Length");
    std::string::basic_string[abi:ne180100]<0>(__p, "deleteElementAtIndex");
    std::string::basic_string[abi:ne180100]<0>(v77, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/Utility/HDStaticArray.h");
    health::FormatString<>((std::string *)"Index out of bounds.", &v76);
    health::_HDAssertImplementation<std::out_of_range>(v15, (uint64_t)v72, (uint64_t)__p, (uint64_t)v77, 65, (uint64_t)&v76);
  }
  memmove(&v64[2 * (unsigned __int16)v14], &v64[2 * (unsigned __int16)v14 + 2], 512 - 32 * (unsigned __int16)v14);
  --v65;
  health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), v12, v11, (uint64_t)v64);
  if (v65 >= 9u)
  {
    v16 = (_OWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, v9);
    if (*v16 != v64[0])
    {
      v17 = (_OWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, v9);
      *v17 = v64[0];
      health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), *a4, a4[1], a5);
    }
LABEL_22:
    v29 = (_DWORD)v9 == 0;
    return !v29;
  }
  if (!v65)
  {
    v25 = *(_QWORD *)(a1 + 16);
    v27 = *((_QWORD *)&v67 + 1);
    v26 = v67;
    if (v67 != *(_OWORD *)v25)
    {
      bzero(v72, 0x222uLL);
      v73 = 0u;
      v74 = 0u;
      health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v25 + 24), v26, v27, (uint64_t)v72);
      v73 = v66;
      health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), v67, *((uint64_t *)&v67 + 1), (uint64_t)v72);
      v25 = *(_QWORD *)(a1 + 16);
      v26 = *(_QWORD *)v25;
    }
    v28 = v66;
    if (v66 != __PAIR128__(*(_QWORD *)(v25 + 8), v26))
    {
      bzero(v72, 0x222uLL);
      v73 = 0u;
      v74 = 0u;
      health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v25 + 24), v28, *((uint64_t *)&v28 + 1), (uint64_t)v72);
      v74 = v67;
      health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), v66, *((uint64_t *)&v66 + 1), (uint64_t)v72);
      v25 = *(_QWORD *)(a1 + 16);
    }
    health::BlockAccessFile::WriteTransaction::freeBlock(*(_QWORD *)(v25 + 24), v12, v11);
    health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::deleteElementAtIndex(a5, v9);
    --*(_WORD *)(a5 + 544);
    health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), *a4, a4[1], a5);
    if (*(_WORD *)(a5 + 544))
      goto LABEL_22;
    return 3;
  }
  v19 = *(unsigned __int16 *)(a5 + 544);
  if (v19 < 2)
    return 3;
  v56 = a4;
  v20 = v19 - 1;
  v21 = v9 - (v20 == (_DWORD)v9);
  v22 = v20 == (_DWORD)v9;
  if (v20 == (_DWORD)v9)
    v23 = v9;
  else
    v23 = v9 + 1;
  v52 = v23;
  v53 = v21;
  if (v22)
  {
    v24 = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, v21);
    v31 = v11;
    v32 = v12;
    v12 = *(_QWORD *)(v24 + 16);
    v11 = *(_QWORD *)(v24 + 24);
    v33 = (uint64_t *)&v62;
    v34 = (uint64_t *)&v63;
    v63 = v12;
    v62 = v11;
    v35 = v72;
    v36 = (void **)v64;
  }
  else
  {
    v63 = v12;
    v62 = v11;
    v30 = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, v23);
    v32 = *(_QWORD *)(v30 + 16);
    v31 = *(_QWORD *)(v30 + 24);
    v33 = (uint64_t *)&v60;
    v34 = (uint64_t *)&v61;
    v35 = (void **)v64;
    v36 = v72;
  }
  v54 = v32;
  v55 = v31;
  v61 = v32;
  v60 = v31;
  v37 = *(_QWORD *)(a1 + 16);
  bzero(v72, 0x222uLL);
  v73 = 0u;
  v74 = 0u;
  health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v37 + 24), *v34, *v33, (uint64_t)v72);
  v38 = *((unsigned __int16 *)v35 + 272);
  v39 = *((unsigned __int16 *)v36 + 272);
  v40 = v39 + v38;
  if ((unsigned __int16)(v39 + v38) > 0x11u)
  {
    v44 = v38 + v39 + 1;
    if (v38 <= v44 >> 1)
    {
      v48 = v44 >> 1;
      v49 = (unsigned __int16)(v48 - v38);
      v50 = (unsigned __int16)(v48 - v38);
      health::StaticArray<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>::ValueEntry,17ul>::copyElementsFromArrayToIndex((uint64_t)v35, v38, (uint64_t)v36, 0, v50);
      if (v49 >= 0x12)
      {
        v51 = *MEMORY[0x1E0CB52B0];
        std::string::basic_string[abi:ne180100]<0>(__p, "startingIndex + count <= Length");
        std::string::basic_string[abi:ne180100]<0>(v77, "deleteElementsInRange");
        std::string::basic_string[abi:ne180100]<0>(&v76, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/Utility/HDStaticArray.h");
        health::FormatString<>((std::string *)"Delete would overflow array bounds.", &v75);
        health::_HDAssertImplementation<std::out_of_range>(v51, (uint64_t)__p, (uint64_t)v77, (uint64_t)&v76, 72, (uint64_t)&v75);
      }
      memmove(v36, &v36[4 * v50], 544 - 32 * v50);
      *((_WORD *)v35 + 272) = v48;
      v47 = *((_WORD *)v36 + 272) - v50;
    }
    else
    {
      if ((unsigned __int16)(v38 - (v44 >> 1)) >= 0x12u)
      {
        v45 = *MEMORY[0x1E0CB52B0];
        std::string::basic_string[abi:ne180100]<0>(__p, "index + count <= Length");
        std::string::basic_string[abi:ne180100]<0>(v77, "insertSpaceForElementsAtIndex");
        std::string::basic_string[abi:ne180100]<0>(&v76, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/Utility/HDStaticArray.h");
        health::FormatString<>((std::string *)"Array too small for requested space.", &v75);
        health::_HDAssertImplementation<std::out_of_range>(v45, (uint64_t)__p, (uint64_t)v77, (uint64_t)&v76, 87, (uint64_t)&v75);
      }
      v46 = (unsigned __int16)(v38 - (v44 >> 1));
      memmove(&v36[4 * v46], v36, 544 - 32 * v46);
      health::StaticArray<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>::ValueEntry,17ul>::copyElementsFromArrayToIndex((uint64_t)v36, 0, (uint64_t)v35, *((unsigned __int16 *)v35 + 272) - v46, v46);
      *((_WORD *)v35 + 272) = v44 >> 1;
      v47 = *((_WORD *)v36 + 272) + v46;
    }
    *((_WORD *)v36 + 272) = v47;
    health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), v12, v11, (uint64_t)v35);
    health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), v54, v55, (uint64_t)v36);
    *(_OWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, v53) = *(_OWORD *)v35;
    *(_OWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, v52) = *(_OWORD *)v36;
    health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), *v56, v56[1], a5);
    v29 = v53 == 0;
    return !v29;
  }
  health::StaticArray<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>::ValueEntry,17ul>::copyElementsFromArrayToIndex((uint64_t)v35, v38, (uint64_t)v36, 0, v39);
  *((_WORD *)v35 + 272) = v40;
  *(_OWORD *)(v35 + 71) = *(_OWORD *)(v36 + 71);
  health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), v12, v11, (uint64_t)v35);
  health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::deleteElementAtIndex(a5, v52);
  --*(_WORD *)(a5 + 544);
  *(_OWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, v53) = *(_OWORD *)v35;
  health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), *v56, v56[1], a5);
  v41 = *(_QWORD *)(a1 + 16);
  v42 = (uint64_t)v35[71];
  v43 = (uint64_t)v35[72];
  if (v42 != *(_QWORD *)v41 || v43 != *(_QWORD *)(v41 + 8))
  {
    bzero(__p, 0x222uLL);
    v58 = 0u;
    v59 = 0u;
    health::BlockAccessFile::ReadTransaction::retrieveObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(uint64_t **)(v41 + 24), v42, v43, (uint64_t)__p);
    *(_QWORD *)&v58 = v12;
    *((_QWORD *)&v58 + 1) = v11;
    health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), (uint64_t)v35[71], (uint64_t)v35[72], (uint64_t)__p);
    v41 = *(_QWORD *)(a1 + 16);
  }
  health::BlockAccessFile::WriteTransaction::freeBlock(*(_QWORD *)(v41 + 24), v54, v55);
  if (*(unsigned __int16 *)(a5 + 544) >= 9u)
    return 1;
  else
    return 3;
}

void sub_1B7DF3224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  uint64_t v19;

  if (*(char *)(v19 - 137) < 0)
    operator delete(*(void **)(v19 - 160));
  if (*(char *)(v19 - 113) < 0)
    operator delete(*(void **)(v19 - 136));
  if (*(char *)(v19 - 89) < 0)
    operator delete(*(void **)(v19 - 112));
  if (a19 < 0)
    operator delete(a14);
  _Unwind_Resume(a1);
}

uint64_t health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_removeValueForKeyWithInteriorChildren(uint64_t a1, int a2, _QWORD *a3, uint64_t *a4, uint64_t a5)
{
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unsigned __int16 v19;
  uint64_t v20;
  unint64_t *v21;
  _QWORD *v22;
  unsigned __int16 *v23;
  unsigned __int16 v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int16 v29;
  unsigned int v31;
  uint64_t v32;
  unsigned __int16 v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  unsigned int v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int16 v45;
  _QWORD v46[49];
  std::string __p;
  void *v48[2];
  void *v49[2];
  void *v50[2];
  _OWORD v51[34];
  __int128 v52;
  std::string v53;
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  std::string v57;
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];

  if (!*(_WORD *)(a5 + 544))
  {
    std::string::basic_string[abi:ne180100]<0>(v56, "node.childCount > 0");
    std::string::basic_string[abi:ne180100]<0>(v55, "_removeValueForKeyWithInteriorChildren");
    std::string::basic_string[abi:ne180100]<0>(v54, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
    health::FormatString<>((std::string *)"Attempt to remove from empty interior node.", &v53);
    health::_HDAssertImplementation<health::btree_access_error>((uint64_t)v56, (uint64_t)v55, (uint64_t)v54, 847, (uint64_t)&v53);
  }
  v10 = health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::childForKey(a5, a3);
  v11 = v10;
  v52 = *(_OWORD *)(health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, v10)+ 16);
  health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_interiorChildAtIndex(a1, a2, a5, v10, v51);
  v12 = health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_removeValueForKey(a1, (a2 + 1), a3, &v52, v51);
  if (v12 <= 1)
  {
    v13 = (_OWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, v10);
    if (*v13 != v51[0])
    {
      v14 = (_OWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, v10);
      *v14 = v51[0];
      health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), *a4, a4[1], a5);
    }
    v15 = v10 == 0;
    return !v15;
  }
  v16 = v12;
  if ((_DWORD)v12 == 2)
    return v16;
  if ((_DWORD)v12 != 3)
  {
    v17 = *MEMORY[0x1E0CB52B0];
    std::string::basic_string[abi:ne180100]<0>(v50, "result == RemovalResult::MergeRequired");
    std::string::basic_string[abi:ne180100]<0>(v49, "_removeValueForKeyWithInteriorChildren");
    std::string::basic_string[abi:ne180100]<0>(v48, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/HDBPlusTree.hpp");
    LODWORD(v46[0]) = v16;
    health::FormatString<int>((std::string *)"Unexpected removal result {0} after handling non-merge cases.", (int *)v46, &__p);
    health::_HDAssertImplementation<std::logic_error>(v17, (uint64_t)v50, (uint64_t)v49, (uint64_t)v48, 871, (uint64_t)&__p);
  }
  v18 = *(unsigned __int16 *)(a5 + 544) - 1;
  if (*(_WORD *)(a5 + 544) == 1)
    return 3;
  v19 = v10 - (v18 == v10);
  if (v18 != v10)
    LOWORD(v10) = v10 + 1;
  v45 = v10;
  if (v18 == v11)
  {
    v20 = health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, (unsigned __int16)(v11 - (v18 == v11)));
    v43 = *(_QWORD *)(v20 + 24);
    v44 = *(_QWORD *)(v20 + 16);
    v21 = (unint64_t *)&v52;
    v22 = v46;
    v23 = (unsigned __int16 *)v51;
    v24 = v19;
  }
  else
  {
    v43 = *((_QWORD *)&v52 + 1);
    v44 = v52;
    v21 = (unint64_t *)(health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, (unsigned __int16)v10)+ 16);
    v22 = v51;
    v23 = (unsigned __int16 *)v46;
    v24 = v10;
  }
  v26 = *v21;
  v25 = v21[1];
  health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::_interiorChildAtIndex(a1, a2, a5, v24, v46);
  v27 = *((unsigned __int16 *)v22 + 272);
  v28 = v23[272];
  v29 = v28 + v27;
  if ((unsigned __int16)(v28 + v27) > 0x11u)
  {
    v31 = v27 + v28 + 1;
    if (v27 <= v31 >> 1)
    {
      v42 = v31 >> 1;
      v36 = (v31 >> 1) - v27;
      v37 = (unsigned __int16)((v31 >> 1) - v27);
      v38 = (unsigned __int16)v36;
      health::StaticArray<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>::ValueEntry,17ul>::copyElementsFromArrayToIndex((uint64_t)v22, v27, (uint64_t)v23, 0, (unsigned __int16)v36);
      v39 = v37 >= 0x12;
      v34 = v26;
      v35 = v25;
      if (v39)
      {
        v40 = *MEMORY[0x1E0CB52B0];
        std::string::basic_string[abi:ne180100]<0>(v60, "startingIndex + count <= Length");
        std::string::basic_string[abi:ne180100]<0>(v59, "deleteElementsInRange");
        std::string::basic_string[abi:ne180100]<0>(v58, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/Utility/HDStaticArray.h");
        health::FormatString<>((std::string *)"Delete would overflow array bounds.", &v57);
        health::_HDAssertImplementation<std::out_of_range>(v40, (uint64_t)v60, (uint64_t)v59, (uint64_t)v58, 72, (uint64_t)&v57);
      }
      memmove(v23, &v23[16 * v38], 544 - 32 * v38);
      *((_WORD *)v22 + 272) = v42;
      v33 = v23[272] - v38;
    }
    else
    {
      if ((unsigned __int16)(v27 - (v31 >> 1)) >= 0x12u)
      {
        v41 = *MEMORY[0x1E0CB52B0];
        std::string::basic_string[abi:ne180100]<0>(v60, "index + count <= Length");
        std::string::basic_string[abi:ne180100]<0>(v59, "insertSpaceForElementsAtIndex");
        std::string::basic_string[abi:ne180100]<0>(v58, "/Library/Caches/com.apple.xbs/Sources/HealthKit/HealthKit/HealthDaemon/Database/Migration/HFDtoSQLite/HighFrequencyData/Utility/HDStaticArray.h");
        health::FormatString<>((std::string *)"Array too small for requested space.", &v57);
        health::_HDAssertImplementation<std::out_of_range>(v41, (uint64_t)v60, (uint64_t)v59, (uint64_t)v58, 87, (uint64_t)&v57);
      }
      v32 = (unsigned __int16)(v27 - (v31 >> 1));
      memmove(&v23[16 * v32], v23, 544 - 32 * v32);
      health::StaticArray<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>::ValueEntry,17ul>::copyElementsFromArrayToIndex((uint64_t)v23, 0, (uint64_t)v22, *((unsigned __int16 *)v22 + 272) - v32, v32);
      *((_WORD *)v22 + 272) = v31 >> 1;
      v33 = v23[272] + v32;
      v34 = v26;
      v35 = v25;
    }
    v23[272] = v33;
    health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), v44, v43, (uint64_t)v22);
    health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), v34, v35, (uint64_t)v23);
    *(_OWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, v19) = *(_OWORD *)v22;
    *(_OWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, v45) = *(_OWORD *)v23;
    health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), *a4, a4[1], a5);
    v15 = v19 == 0;
    return !v15;
  }
  health::StaticArray<health::bplustree::LeafNode<health::DataStore::ObjectIdentifier,health::BlockPointer,health::BlockPointer,17>::ValueEntry,17ul>::copyElementsFromArrayToIndex((uint64_t)v22, v27, (uint64_t)v23, 0, v28);
  *((_WORD *)v22 + 272) = v29;
  health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), v44, v43, (uint64_t)v22);
  health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::deleteElementAtIndex(a5, v45);
  --*(_WORD *)(a5 + 544);
  *(_OWORD *)health::StaticArray<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>::ChildEntry,17ul>::operator[](a5, v19) = *(_OWORD *)v22;
  health::BlockAccessFile::WriteTransaction::updateObject<health::bplustree::InteriorNode<health::DataStore::ObjectIdentifier,health::BlockPointer,17>>(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), *a4, a4[1], a5);
  health::BlockAccessFile::WriteTransaction::freeBlock(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 24), v26, v25);
  if (*(unsigned __int16 *)(a5 + 544) >= 9u)
    return 1;
  else
    return 3;
}

void sub_1B7DF3974(_Unwind_Exception *a1)
{
  uint64_t v1;

  if (*(char *)(v1 - 161) < 0)
    operator delete(*(void **)(v1 - 184));
  if (*(char *)(v1 - 137) < 0)
    operator delete(*(void **)(v1 - 160));
  if (*(char *)(v1 - 113) < 0)
    operator delete(*(void **)(v1 - 136));
  if (*(char *)(v1 - 89) < 0)
    operator delete(*(void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_1B7DF45E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__169(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__169(uint64_t a1)
{

}

void sub_1B7DF51EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7DF6B24(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__170(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__170(uint64_t a1)
{

}

void sub_1B7DFB150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  uint64_t v51;

  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 208), 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Unwind_Resume(a1);
}

void sub_1B7DFD844(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7DFDA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B7DFDA74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id HDLocationSeriesDataEntityAllProperties(void)
{
  _QWORD v1[13];

  v1[12] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("series_identifier");
  v1[1] = CFSTR("timestamp");
  v1[2] = CFSTR("latitude");
  v1[3] = CFSTR("longitude");
  v1[4] = CFSTR("altitude");
  v1[5] = CFSTR("speed");
  v1[6] = CFSTR("course");
  v1[7] = CFSTR("horizontal_accuracy");
  v1[8] = CFSTR("vertical_accuracy");
  v1[9] = CFSTR("speed_accuracy");
  v1[10] = CFSTR("course_accuracy");
  v1[11] = CFSTR("signal_environment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 12);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1B7DFDBA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7DFDDB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B7DFDE30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7DFE018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1B7DFE0C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7DFE1A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B7DFE250(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7DFE498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1B7DFE73C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7DFE804(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7DFE8E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7DFEAF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1B7DFEC7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_1B7DFED64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B7DFEE90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7DFEF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B7DFF070(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B7DFF154(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void __cxx_global_array_dtor_3()
{
  uint64_t v0;

  v0 = 0x24u;
  do
  {

    v0 -= 3;
  }
  while (v0 * 8);
}

BOOL HDCodableSampleOriginCollectionReadFrom(void *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  HDCodableDevice *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(HDCodableDevice);
        objc_msgSend(a1, "addDevice:", v17);
        if (!PBReaderPlaceMark() || (HDCodableDeviceReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(HDCodableContributor);
    objc_msgSend(a1, "addContributor:", v17);
    if (!PBReaderPlaceMark() || (HDCodableContributorReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _HDAddProfileAuthorizationTable(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "unprotectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "executeUncachedSQL:error:", CFSTR("CREATE TABLE IF NOT EXISTS profile_authorization (ROWID INTEGER PRIMARY KEY AUTOINCREMENT, source_bundle_id TEXT NOT NULL UNIQUE, status INTEGER NOT NULL, date_modified REAL NOT NULL)"), a4) ^ 1;

  return v6;
}

uint64_t _HDAddCarePlanAndGoalRecordSamplesTables()
{
  return 0;
}

uint64_t _HDMovedCoverageOutOfFuture()
{
  return 0;
}

uint64_t _HDAddDeviceRecordSamplesTable_0()
{
  return 0;
}

uint64_t _HDAddMedicalHealthTable()
{
  return 0;
}

uint64_t _HDAddMedicalHealthConcreteRecordTables()
{
  return 0;
}

uint64_t _HDAddMedicalHealthLabResultTable()
{
  return 0;
}

uint64_t _HDAddEncounterRecordTable()
{
  return 0;
}

uint64_t HDRawQuantitySample::splitAtTime@<X0>(uint64_t result@<X0>, int a2@<W1>, uint64_t a3@<X8>, double a4@<D0>)
{
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  char v8;
  char v9;
  double v10;
  double v11;
  uint64_t v12;
  char v13;
  double v14;
  char v15;
  double v16;
  double v17;

  v5 = *(double *)result;
  v4 = *(double *)(result + 8);
  v6 = *(double *)(result + 16);
  v7 = *(_QWORD *)(result + 24);
  v8 = *(_BYTE *)(result + 32);
  v9 = *(_BYTE *)(result + 33);
  v10 = a4 - v4;
  v11 = v6 - v4 - (a4 - v4);
  if (a2 != 1)
  {
    if (v11 < 0.01)
      goto LABEL_6;
    if (v10 >= 0.01)
    {
LABEL_9:
      v17 = v5 * (v10 / (v6 - v4));
      v15 = *(_BYTE *)(result + 32);
      v14 = v5 - v17;
      v5 = v17;
      v16 = a4;
      goto LABEL_10;
    }
LABEL_8:
    v15 = 0;
    a4 = *(double *)(result + 16);
    v14 = *(double *)result;
    v16 = *(double *)(result + 8);
LABEL_10:
    v12 = *(_QWORD *)(result + 24);
    v13 = *(_BYTE *)(result + 33);
    goto LABEL_11;
  }
  if (v10 < 0.01)
    goto LABEL_8;
  if (v11 >= 0.01)
    goto LABEL_9;
LABEL_6:
  v12 = 0;
  v13 = 0;
  v14 = 0.0;
  a4 = *(double *)(result + 16);
  v15 = *(_BYTE *)(result + 32);
  v16 = 0.0;
  v6 = 0.0;
  v8 = 0;
LABEL_11:
  *(double *)a3 = v5;
  *(double *)(a3 + 8) = v4;
  *(double *)(a3 + 16) = a4;
  *(_QWORD *)(a3 + 24) = v7;
  *(_BYTE *)(a3 + 32) = v15;
  *(_BYTE *)(a3 + 33) = v9;
  *(_DWORD *)(a3 + 34) = *(_DWORD *)(result + 34);
  *(_WORD *)(a3 + 38) = *(_WORD *)(result + 38);
  *(double *)(a3 + 40) = v14;
  *(double *)(a3 + 48) = v16;
  *(double *)(a3 + 56) = v6;
  *(_QWORD *)(a3 + 64) = v12;
  *(_BYTE *)(a3 + 72) = v8;
  *(_BYTE *)(a3 + 73) = v13;
  return result;
}

double HDRawQuantitySample::splitAtTime(__n128 *a1, __n128 *a2, int a3, __n128 a4)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __n128 v9;
  double v10;

  v5 = a1->n128_f64[1];
  v4 = a1[1].n128_f64[0];
  v6 = a4.n128_f64[0] - v5;
  v7 = v4 - v5;
  v8 = v7 - v6;
  if (a3 == 1)
  {
    if (v6 >= 0.01)
    {
      if (v8 >= 0.01)
        goto LABEL_9;
      goto LABEL_6;
    }
LABEL_8:
    a4 = *a1;
    v9 = a1[1];
    a2[2].n128_u16[0] = a1[2].n128_u16[0];
    *a2 = a4;
    a2[1] = v9;
    a1[2].n128_u8[0] = 0;
    return a4.n128_f64[0];
  }
  if (v8 >= 0.01)
  {
    if (v6 >= 0.01)
    {
LABEL_9:
      v10 = v6 / v7 * a1->n128_f64[0];
      a2->n128_f64[0] = a1->n128_f64[0] - v10;
      a2->n128_u64[1] = a4.n128_u64[0];
      a2[1].n128_f64[0] = v4;
      a2[1].n128_u64[1] = a1[1].n128_u64[1];
      a2[2].n128_u16[0] = a1[2].n128_u16[0];
      a1->n128_f64[0] = v10;
      a1[1].n128_u64[0] = a4.n128_u64[0];
      return a4.n128_f64[0];
    }
    goto LABEL_8;
  }
LABEL_6:
  a2[2].n128_u8[0] = 0;
  return a4.n128_f64[0];
}

uint64_t HDRawQuantitySample::applyMask(uint64_t result, double **a2)
{
  double *v2;
  double *v3;
  double v4;
  double v5;
  double v6;
  double *v7;
  double v8;
  double *v9;
  double v10;
  double *v11;
  double *v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;

  v3 = *a2;
  v2 = a2[1];
  if (v2 != *a2)
  {
    v4 = *(double *)(result + 16);
    v5 = *(double *)(result + 8);
    v6 = v4 - v5;
    if (v4 - v5 >= 0.01)
    {
      v7 = v3 + 1;
      v8 = 0.0;
      do
      {
        v9 = v7 - 1;
        if (*v7 > v5)
        {
          v10 = *v9;
          if (*v9 >= v4)
            break;
          if (v10 > v5)
          {
            if (v4 < v10)
              v9 = (double *)(result + 16);
            v8 = v8 + *v9 - v5;
          }
          if (*v7 >= v4)
            v11 = (double *)(result + 16);
          else
            v11 = v7;
          v5 = *v11;
        }
        v12 = v7 + 1;
        v7 += 2;
      }
      while (v12 != v2);
      v13 = v4 - v5;
      v14 = v5 < v4;
      v15 = -0.0;
      if (v14)
        v15 = v13;
      v16 = v8 + v15;
      if (v16 <= 0.0)
LABEL_24:
        *(_BYTE *)(result + 32) = 0;
      else
        *(double *)result = v16 * *(double *)result / v6;
    }
    else
    {
      while (v5 >= *v3)
      {
        if (v5 < v3[1])
        {
          *(_QWORD *)result = 0;
          goto LABEL_24;
        }
        v3 += 2;
        if (v3 == v2)
          return result;
      }
    }
  }
  return result;
}

BOOL HDRawQuantitySample::operator==(uint64_t a1, uint64_t a2)
{
  int v2;
  BOOL v4;

  v2 = *(unsigned __int8 *)(a2 + 32);
  if (!(*(unsigned __int8 *)(a1 + 32) | v2))
    return 1;
  if (*(_BYTE *)(a1 + 32))
    v4 = v2 == 0;
  else
    v4 = 1;
  return !v4
      && *(unsigned __int8 *)(a1 + 33) == *(unsigned __int8 *)(a2 + 33)
      && *(double *)a1 == *(double *)a2
      && *(double *)(a1 + 8) == *(double *)(a2 + 8)
      && *(double *)(a1 + 16) == *(double *)(a2 + 16)
      && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
}

void sub_1B7E020C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__171(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__171(uint64_t a1)
{

}

void sub_1B7E02910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E05EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  uint64_t v63;

  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose((const void *)(v63 - 240), 8);
  _Block_object_dispose((const void *)(v63 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E07B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E07D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E08D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E0C220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E0D70C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E11238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E1231C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v6;
  va_list va;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va2;

  va_start(va2, a5);
  va_start(va1, a5);
  va_start(va, a5);
  v6 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v13 = va_arg(va2, _QWORD);
  v15 = va_arg(va2, _QWORD);
  v16 = va_arg(va2, _QWORD);
  v17 = va_arg(va2, _QWORD);
  v18 = va_arg(va2, _QWORD);
  v19 = va_arg(va2, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

uint64_t HDEntityCategoryForKeyValueCategory(unint64_t a1)
{
  if (a1 > 4)
    return -1;
  else
    return qword_1B7F55FA0[a1];
}

uint64_t __Block_byref_object_copy__172(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__172(uint64_t a1)
{

}

void sub_1B7E14548(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E149FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E15820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E15F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E1945C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__173(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__173(uint64_t a1)
{

}

void sub_1B7E1E43C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E1EC38(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E1F1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__174(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__174(uint64_t a1)
{

}

uint64_t HDCodableHealthObjectReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  HDCodableMetadataDictionary *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 40;
        goto LABEL_26;
      case 2u:
        v21 = objc_alloc_init(HDCodableMetadataDictionary);
        objc_storeStrong((id *)(a1 + 24), v21);
        if (PBReaderPlaceMark() && (HDCodableMetadataDictionaryReadFrom(v21, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_43:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      case 3u:
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 32;
LABEL_26:
        v22 = *(void **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;

        goto LABEL_43;
      case 4u:
        *(_BYTE *)(a1 + 48) |= 1u;
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v25 = 0;
        }
        *(_QWORD *)(a1 + 8) = v25;
        goto LABEL_43;
      case 5u:
        v26 = 0;
        v27 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 48) |= 2u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v31;
            v28 |= (unint64_t)(v32 & 0x7F) << v26;
            if (v32 < 0)
            {
              v26 += 7;
              v15 = v27++ >= 9;
              if (v15)
              {
                v28 = 0;
                goto LABEL_40;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v28 = 0;
LABEL_40:
        *(_QWORD *)(a1 + 16) = v28;
        goto LABEL_43;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_43;
    }
  }
}

void sub_1B7E22B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E23664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__175(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__175(uint64_t a1)
{

}

uint64_t HDCodableSleepScheduleReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  __objc2_class **v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  int *v19;
  __objc2_class **v20;
  id v21;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  char v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  char v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  char v70;
  unsigned int v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  char v75;
  unsigned int v76;
  uint64_t v77;
  unint64_t v78;
  char v79;
  char v80;
  unsigned int v81;
  uint64_t v82;
  unint64_t v83;
  char v84;
  uint64_t result;
  char v86;
  unsigned int v87;
  uint64_t v88;
  unint64_t v89;
  char v90;
  BOOL v91;
  uint64_t v92;
  uint64_t v93;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = off_1E6CE3000;
    v8 = &OBJC_IVAR___HDBackgroundObservationServerExtension__sessionUUID;
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v3;
        v14 = *(_QWORD *)(a2 + v13);
        if (v14 == -1 || v14 >= *(_QWORD *)(a2 + *v4))
          break;
        v15 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
        *(_QWORD *)(a2 + v13) = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0)
          goto LABEL_12;
        v10 += 7;
        v16 = v11++ >= 9;
        if (v16)
        {
          v12 = 0;
          v17 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v17 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v12 = 0;
LABEL_14:
      if (v17 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          v19 = v8;
          v20 = v7;
          v21 = objc_alloc_init(v7[87]);
          objc_storeStrong((id *)(a1 + 48), v21);
          if (PBReaderPlaceMark() && (HDCodableSampleReadFrom((uint64_t)v21, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            v7 = v20;
            v8 = v19;
            continue;
          }

          return 0;
        case 2u:
          v22 = 0;
          v23 = 0;
          v24 = 0;
          *(_WORD *)(a1 + v8[204]) |= 0x40u;
          while (1)
          {
            v25 = *v3;
            v26 = *(_QWORD *)(a2 + v25);
            if (v26 == -1 || v26 >= *(_QWORD *)(a2 + *v4))
              break;
            v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 1;
            v24 |= (unint64_t)(v27 & 0x7F) << v22;
            if ((v27 & 0x80) == 0)
              goto LABEL_109;
            v22 += 7;
            v16 = v23++ >= 9;
            if (v16)
            {
              v24 = 0;
              goto LABEL_111;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_109:
          if (*(_BYTE *)(a2 + *v5))
            v24 = 0;
LABEL_111:
          v91 = v24 != 0;
          v92 = 57;
          goto LABEL_136;
        case 3u:
          v28 = 0;
          v29 = 0;
          v30 = 0;
          *(_WORD *)(a1 + v8[204]) |= 0x400u;
          while (2)
          {
            v31 = *v3;
            v32 = *(_QWORD *)(a2 + v31);
            if (v32 == -1 || v32 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v33 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v32);
              *(_QWORD *)(a2 + v31) = v32 + 1;
              v30 |= (unint64_t)(v33 & 0x7F) << v28;
              if (v33 < 0)
              {
                v28 += 7;
                v16 = v29++ >= 9;
                if (v16)
                {
                  v30 = 0;
                  goto LABEL_115;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v30 = 0;
LABEL_115:
          v91 = v30 != 0;
          v92 = 61;
          goto LABEL_136;
        case 4u:
          v34 = 0;
          v35 = 0;
          v36 = 0;
          *(_WORD *)(a1 + v8[204]) |= 0x800u;
          while (2)
          {
            v37 = *v3;
            v38 = *(_QWORD *)(a2 + v37);
            if (v38 == -1 || v38 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v39 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v38);
              *(_QWORD *)(a2 + v37) = v38 + 1;
              v36 |= (unint64_t)(v39 & 0x7F) << v34;
              if (v39 < 0)
              {
                v34 += 7;
                v16 = v35++ >= 9;
                if (v16)
                {
                  v36 = 0;
                  goto LABEL_119;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v36 = 0;
LABEL_119:
          v91 = v36 != 0;
          v92 = 62;
          goto LABEL_136;
        case 5u:
          v40 = 0;
          v41 = 0;
          v42 = 0;
          *(_WORD *)(a1 + v8[204]) |= 0x200u;
          while (2)
          {
            v43 = *v3;
            v44 = *(_QWORD *)(a2 + v43);
            if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v44);
              *(_QWORD *)(a2 + v43) = v44 + 1;
              v42 |= (unint64_t)(v45 & 0x7F) << v40;
              if (v45 < 0)
              {
                v40 += 7;
                v16 = v41++ >= 9;
                if (v16)
                {
                  v42 = 0;
                  goto LABEL_123;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v42 = 0;
LABEL_123:
          v91 = v42 != 0;
          v92 = 60;
          goto LABEL_136;
        case 6u:
          v46 = 0;
          v47 = 0;
          v48 = 0;
          *(_WORD *)(a1 + v8[204]) |= 0x20u;
          while (2)
          {
            v49 = *v3;
            v50 = *(_QWORD *)(a2 + v49);
            if (v50 == -1 || v50 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v51 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v50);
              *(_QWORD *)(a2 + v49) = v50 + 1;
              v48 |= (unint64_t)(v51 & 0x7F) << v46;
              if (v51 < 0)
              {
                v46 += 7;
                v16 = v47++ >= 9;
                if (v16)
                {
                  v48 = 0;
                  goto LABEL_127;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v48 = 0;
LABEL_127:
          v91 = v48 != 0;
          v92 = 56;
          goto LABEL_136;
        case 7u:
          v52 = 0;
          v53 = 0;
          v54 = 0;
          *(_WORD *)(a1 + v8[204]) |= 0x80u;
          while (2)
          {
            v55 = *v3;
            v56 = *(_QWORD *)(a2 + v55);
            if (v56 == -1 || v56 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v57 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v56);
              *(_QWORD *)(a2 + v55) = v56 + 1;
              v54 |= (unint64_t)(v57 & 0x7F) << v52;
              if (v57 < 0)
              {
                v52 += 7;
                v16 = v53++ >= 9;
                if (v16)
                {
                  v54 = 0;
                  goto LABEL_131;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v54 = 0;
LABEL_131:
          v91 = v54 != 0;
          v92 = 58;
          goto LABEL_136;
        case 8u:
          v58 = 0;
          v59 = 0;
          v60 = 0;
          *(_WORD *)(a1 + v8[204]) |= 0x100u;
          while (2)
          {
            v61 = *v3;
            v62 = *(_QWORD *)(a2 + v61);
            if (v62 == -1 || v62 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v63 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v62);
              *(_QWORD *)(a2 + v61) = v62 + 1;
              v60 |= (unint64_t)(v63 & 0x7F) << v58;
              if (v63 < 0)
              {
                v58 += 7;
                v16 = v59++ >= 9;
                if (v16)
                {
                  v60 = 0;
                  goto LABEL_135;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v60 = 0;
LABEL_135:
          v91 = v60 != 0;
          v92 = 59;
LABEL_136:
          *(_BYTE *)(a1 + v92) = v91;
          continue;
        case 9u:
          v64 = 0;
          v65 = 0;
          v66 = 0;
          *(_WORD *)(a1 + v8[204]) |= 8u;
          while (2)
          {
            v67 = *v3;
            v68 = *(_QWORD *)(a2 + v67);
            if (v68 == -1 || v68 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v69 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v68);
              *(_QWORD *)(a2 + v67) = v68 + 1;
              v66 |= (unint64_t)(v69 & 0x7F) << v64;
              if (v69 < 0)
              {
                v64 += 7;
                v16 = v65++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_140;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v66 = 0;
LABEL_140:
          v93 = 32;
          goto LABEL_157;
        case 0xAu:
          v70 = 0;
          v71 = 0;
          v66 = 0;
          *(_WORD *)(a1 + v8[204]) |= 0x10u;
          while (2)
          {
            v72 = *v3;
            v73 = *(_QWORD *)(a2 + v72);
            if (v73 == -1 || v73 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v74 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v73);
              *(_QWORD *)(a2 + v72) = v73 + 1;
              v66 |= (unint64_t)(v74 & 0x7F) << v70;
              if (v74 < 0)
              {
                v70 += 7;
                v16 = v71++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_144;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v66 = 0;
LABEL_144:
          v93 = 40;
          goto LABEL_157;
        case 0xBu:
          v75 = 0;
          v76 = 0;
          v66 = 0;
          *(_WORD *)(a1 + v8[204]) |= 1u;
          while (2)
          {
            v77 = *v3;
            v78 = *(_QWORD *)(a2 + v77);
            if (v78 == -1 || v78 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v79 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v78);
              *(_QWORD *)(a2 + v77) = v78 + 1;
              v66 |= (unint64_t)(v79 & 0x7F) << v75;
              if (v79 < 0)
              {
                v75 += 7;
                v16 = v76++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v66 = 0;
LABEL_148:
          v93 = 8;
          goto LABEL_157;
        case 0xCu:
          v80 = 0;
          v81 = 0;
          v66 = 0;
          *(_WORD *)(a1 + v8[204]) |= 2u;
          while (2)
          {
            v82 = *v3;
            v83 = *(_QWORD *)(a2 + v82);
            if (v83 == -1 || v83 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v84 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v83);
              *(_QWORD *)(a2 + v82) = v83 + 1;
              v66 |= (unint64_t)(v84 & 0x7F) << v80;
              if (v84 < 0)
              {
                v80 += 7;
                v16 = v81++ >= 9;
                if (v16)
                {
                  v66 = 0;
                  goto LABEL_152;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v66 = 0;
LABEL_152:
          v93 = 16;
          goto LABEL_157;
        case 0xEu:
          v86 = 0;
          v87 = 0;
          v66 = 0;
          *(_WORD *)(a1 + v8[204]) |= 4u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v88 = *v3;
        v89 = *(_QWORD *)(a2 + v88);
        if (v89 == -1 || v89 >= *(_QWORD *)(a2 + *v4))
          break;
        v90 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v89);
        *(_QWORD *)(a2 + v88) = v89 + 1;
        v66 |= (unint64_t)(v90 & 0x7F) << v86;
        if ((v90 & 0x80) == 0)
          goto LABEL_154;
        v86 += 7;
        v16 = v87++ >= 9;
        if (v16)
        {
          v66 = 0;
          goto LABEL_156;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_154:
      if (*(_BYTE *)(a2 + *v5))
        v66 = 0;
LABEL_156:
      v93 = 24;
LABEL_157:
      *(_QWORD *)(a1 + v93) = v66;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B7E27628(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B7E28160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__176(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__176(uint64_t a1)
{

}

void sub_1B7E28D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E29BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__177(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__177(uint64_t a1)
{

}

void sub_1B7E29DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E2A0F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E2C8AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B7E2CA58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7E2CCD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B7E2D6A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  if (v1)
    operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1B7E2D94C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, ...)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  va_list va;

  va_start(va, a8);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E2DB9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B7E2DC70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7E2DE34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1B7E2DEA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7E2DFDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7E2E23C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7E2E688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::__deallocate_node(*(id **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::__deallocate_node(id *a1)
{
  id *v1;
  id *v2;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = (id *)*v1;
      std::deque<HDRawQuantitySample>::~deque[abi:ne180100]((uint64_t)(v1 + 3));

      operator delete(v1);
      v1 = v2;
    }
    while (v2);
  }
}

uint64_t std::deque<HDRawQuantitySample>::~deque[abi:ne180100](uint64_t a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *(void ***)(a1 + 8);
  v3 = *(void ***)(a1 + 16);
  *(_QWORD *)(a1 + 40) = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = *(void ***)(a1 + 16);
      v2 = (void **)(*(_QWORD *)(a1 + 8) + 8);
      *(_QWORD *)(a1 + 8) = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 51;
    goto LABEL_7;
  }
  if (v5 == 2)
  {
    v6 = 102;
LABEL_7:
    *(_QWORD *)(a1 + 32) = v6;
  }
  if (v2 != v3)
  {
    do
    {
      v7 = *v2++;
      operator delete(v7);
    }
    while (v2 != v3);
    v9 = *(_QWORD *)(a1 + 8);
    v8 = *(_QWORD *)(a1 + 16);
    if (v8 != v9)
      *(_QWORD *)(a1 + 16) = v8 + ((v9 - v8 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t **std::__hash_table<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringHash,HDStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>>>::find<NSString * {__strong}>(_QWORD *a1, id *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t ***v10;
  uint64_t **i;
  unint64_t v12;

  v4 = objc_msgSend(*a2, "hash");
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(uint64_t ****)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  for (i = *v10; i; i = (uint64_t **)*i)
  {
    v12 = (unint64_t)i[1];
    if (v12 == v6)
    {
      if ((std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>::operator()[abi:ne180100](i[2], *a2) & 1) != 0)return i;
    }
    else
    {
      if (v8 > 1)
      {
        if (v12 >= *(_QWORD *)&v5)
          v12 %= *(_QWORD *)&v5;
      }
      else
      {
        v12 &= *(_QWORD *)&v5 - 1;
      }
      if (v12 != v9)
        return 0;
    }
  }
  return i;
}

uint64_t std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},std::deque<HDRawQuantitySample>>,HDStringEqual,HDStringHash,true>::operator()[abi:ne180100](void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
  {
    v6 = 1;
  }
  else if (v4)
  {
    v6 = objc_msgSend(v3, "isEqualToString:", v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_1B7E2EA3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B7E2ED88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__178(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__178(uint64_t a1)
{

}

unint64_t HDCurrentSyncVersionForSyncEntity(void *a1)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "currentSyncVersion");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (unint64_t)objc_msgSend(a1, "supportedSyncVersionRange") >> 32;
  return 0;
}

uint64_t __Block_byref_object_copy__179(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__179(uint64_t a1)
{

}

void sub_1B7E2FE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E3002C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E31170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E31FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__180(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__180(uint64_t a1)
{

}

void sub_1B7E36D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E37544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E37768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t _HDWorkoutSessionCanReplaceSession(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "startDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  v9 = v8;
  if (v5 && v6)
  {
    objc_msgSend(v4, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "hk_isAfterOrEqualToDate:", v11);

  }
  return v9;
}

void sub_1B7E39970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E39B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E3B418(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7E3B52C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7E3BA20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_1B7E3BB84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7E3BD70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B7E3BEE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7E3BFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B7E3C08C(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

void sub_1B7E3C69C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B7E3D578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1B7E3D918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1B7E3DA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E3DB10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char *a15)
{
  char *v15;
  char *v17;
  uint64_t v18;

  v17 = a15;
  if (a15 == v15)
  {
    v18 = 4;
    v17 = &a12;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v18 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v17 + 8 * v18))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

void sub_1B7E3DBF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7E3DCE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7E3DE80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t ___ZL23_HDSortedMigrationStepsP7NSArrayIP23HDDatabaseMigrationStepE_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "finalSchemaVersion");
  v7 = objc_msgSend(v5, "finalSchemaVersion");
  if (v6 < v7)
    v8 = -1;
  else
    v8 = v7 < v6;

  return v8;
}

void sub_1B7E3DFAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t ___ZL23_HDSortedMigrationStepsP7NSArrayIP23HDDatabaseMigrationStepE_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "finalSchemaVersion");
  v7 = objc_msgSend(v5, "finalSchemaVersion");
  if (v6 < v7)
    v8 = -1;
  else
    v8 = v7 < v6;

  return v8;
}

void sub_1B7E3E024(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL ___ZL23_HDSortedMigrationStepsP7NSArrayIP23HDDatabaseMigrationStepE_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  objc_msgSend(v3, "schemaName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = 0;
  else
    v5 = objc_msgSend(v3, "finalSchemaVersion") == *(_QWORD *)(a1 + 32);

  return v5;
}

void sub_1B7E3E09C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void _ZNSt3__110__function6__funcIZZZ65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error__EUb_EUb0_E3__0NS_9allocatorIS2_EEFbRN6health9DataStore16WriteTransactionEEED0Ev()
{
  JUMPOUT(0x1BCCAC494);
}

__n128 _ZNKSt3__110__function6__funcIZZZ65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error__EUb_EUb0_E3__0NS_9allocatorIS2_EEFbRN6health9DataStore16WriteTransactionEEE7__cloneEv(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x30uLL);
  *(_QWORD *)v2 = &off_1E6D0CE50;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  *((_QWORD *)v2 + 5) = *(_QWORD *)(a1 + 40);
  return result;
}

__n128 _ZNKSt3__110__function6__funcIZZZ65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error__EUb_EUb0_E3__0NS_9allocatorIS2_EEFbRN6health9DataStore16WriteTransactionEEE7__cloneEPNS0_6__baseIS9_EE(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  *(_QWORD *)a2 = &off_1E6D0CE50;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

BOOL _ZNSt3__110__function6__funcIZZZ65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error__EUb_EUb0_E3__0NS_9allocatorIS2_EEFbRN6health9DataStore16WriteTransactionEEEclES8_(uint64_t **a1, uint64_t a2)
{
  __n128 v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  _BOOL4 v13;
  uint64_t v14;
  health::BlockAccessFile::WriteTransaction *v15;
  unint64_t v16;
  unint64_t v17;
  health::BlockAccessFile::WriteTransaction *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  __int128 v26;
  __n128 v27;
  __int128 v28;
  uint64_t v29;
  _OWORD v30[2];
  char v31;
  _QWORD *v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v26 = xmmword_1B7F41F10;
  v28 = *(_OWORD *)(a2 + 32);
  v29 = a2;
  v4.n128_f64[0] = health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::valueForKey<health::DataStore::ObjectIdentifier>((uint64_t *)&v28, &v26, 0, v30);
  if (!v31)
    goto LABEL_10;
  health::DataStore::ReadTransaction::_pointerForObject((health::DataStore::ReadTransaction *)a2, (ObjectIdentifier *)&v26, (uint64_t)&v28);
  if ((_BYTE)v29)
  {
    v5 = *(uint64_t **)(a2 + 24);
    v6 = (uint64_t *)health::Optional<health::BlockPointer>::get((uint64_t)&v28);
    v7 = *v6;
    v8 = v6[1];
    v32 = 0;
    v33 = 8;
    v27.n128_u64[0] = (unint64_t)v30;
    v27.n128_u64[1] = 8;
    health::BlockAccessFile::ReadTransaction::retrieveBlock(v5, v7, v8, (uint64_t)&v27);
    v9 = v32;
    if (v33 <= 0x3FF)
      v10 = (uint64_t *)v30;
    else
      v10 = v32;
    v11 = *v10;
    v32 = 0;
    if (v9)
      MEMORY[0x1BCCAC47C](v9, 0x1000C8077774924);
  }
  else
  {
    v11 = 0;
  }
  if (v11 >= *a1[1])
  {
    *a1[2] = 0;
    return 1;
  }
  else
  {
LABEL_10:
    *a1[2] = (*(uint64_t (**)(__n128))(*a1[3] + 16))(v4);
    v12 = a1[1];
    v28 = *(_OWORD *)(a2 + 32);
    v29 = a2 + 48;
    health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::valueForKey<health::DataStore::ObjectIdentifier>((uint64_t *)&v28, &v26, 0, v30);
    if (v31)
    {
      v13 = *(_QWORD *)(health::Optional<health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::LookupResult>::operator->((uint64_t)v30)
                      + 24) == 8;
      v14 = health::Optional<health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::LookupResult>::operator->((uint64_t)v30);
      v15 = (health::BlockAccessFile::WriteTransaction *)(a2 + 80);
      v16 = *(_QWORD *)(v14 + 16);
      v17 = *(_QWORD *)(v14 + 24);
      if (v13)
      {
        health::BlockAccessFile::WriteTransaction::updateObject<long>((uint64_t)v15, v16, v17, *v12);
      }
      else
      {
        health::BlockAccessFile::WriteTransaction::freeBlock((uint64_t)v15, v16, v17);
        v23 = health::BlockAccessFile::WriteTransaction::_requestBlockOfLength(v15, 8);
        v25 = v24;
        health::BlockAccessFile::WriteTransaction::updateObject<long>((uint64_t)v15, v23, v24, *v12);
        v27.n128_u64[0] = v23;
        v27.n128_u64[1] = v25;
        health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::setValueForKey((uint64_t *)&v28, (__n128 *)&v26, &v27);
      }
    }
    else
    {
      v19 = (health::BlockAccessFile::WriteTransaction *)(a2 + 80);
      v20 = health::BlockAccessFile::WriteTransaction::_requestBlockOfLength(v19, 8);
      v22 = v21;
      health::BlockAccessFile::WriteTransaction::updateObject<long>((uint64_t)v19, v20, v21, *v12);
      v27.n128_u64[0] = v20;
      v27.n128_u64[1] = v22;
      health::bplustree::Tree<health::BlockAccessFile::WriteTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::setValueForKey((uint64_t *)&v28, (__n128 *)&v26, &v27);
    }
    return *a1[2] == 0;
  }
}

void sub_1B7E3E398(_Unwind_Exception *a1)
{
  unint64_t v2;

  v2 = STACK[0x438];
  STACK[0x438] = 0;
  if (v2)
    MEMORY[0x1BCCAC47C](v2, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

uint64_t _ZNKSt3__110__function6__funcIZZZ65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error__EUb_EUb0_E3__0NS_9allocatorIS2_EEFbRN6health9DataStore16WriteTransactionEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZZ65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error__EUb_EUb0_E3__0))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZZ65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error__EUb_EUb0_E3__0NS_9allocatorIS2_EEFbRN6health9DataStore16WriteTransactionEEE11target_typeEv()
{
  return &_ZTIZZZ65__HDDatabaseMigrator_performHFDMigrationToVersion_handler_error__EUb_EUb0_E3__0;
}

uint64_t health::BlockAccessFile::WriteTransaction::updateObject<long>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned __int8 *v7;
  uint64_t result;
  _QWORD v9[2];
  _QWORD v10[3];
  _BYTE v11[1024];
  unsigned __int8 *v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = 8;
  v10[0] = v11;
  v10[1] = v11;
  v10[2] = 8;
  v9[0] = a4;
  health::SerializationBuffer::appendRaw<unsigned long long>((uint64_t)v10, v9);
  if (v13 <= 0x3FF)
    v7 = v11;
  else
    v7 = v12;
  health::RawBuffer::RawBuffer(v9, v7, v13);
  health::BlockAccessFile::WriteTransaction::updateBlock(a1, a2, a3, (uint64_t)v9);
  result = (uint64_t)v12;
  v12 = 0;
  if (result)
    return MEMORY[0x1BCCAC47C](result, 0x1000C8077774924);
  return result;
}

void sub_1B7E3E4F0(_Unwind_Exception *a1)
{
  unint64_t v2;

  v2 = STACK[0x428];
  STACK[0x428] = 0;
  if (v2)
    MEMORY[0x1BCCAC47C](v2, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

BOOL HDCodableRoutineLocationVisitReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int *v23;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        *(_BYTE *)(a1 + 24) |= 1u;
        v18 = *v3;
        v19 = *(_QWORD *)(a2 + v18);
        if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v19);
          *(_QWORD *)(a2 + v18) = v19 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v20 = 0;
        }
        v23 = &OBJC_IVAR___HDCodableRoutineLocationVisit__entryTime;
LABEL_32:
        *(_QWORD *)(a1 + *v23) = v20;
        goto LABEL_33;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_33:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    *(_BYTE *)(a1 + 24) |= 2u;
    v21 = *v3;
    v22 = *(_QWORD *)(a2 + v21);
    if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
    {
      v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
      *(_QWORD *)(a2 + v21) = v22 + 8;
    }
    else
    {
      *(_BYTE *)(a2 + *v5) = 1;
      v20 = 0;
    }
    v23 = &OBJC_IVAR___HDCodableRoutineLocationVisit__exitTime;
    goto LABEL_32;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B7E3EF68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__181(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__181(uint64_t a1)
{

}

void sub_1B7E3FCD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E419E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E4243C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__182(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__182(uint64_t a1)
{

}

void sub_1B7E439CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E44470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E457B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__183(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__183(uint64_t a1)
{

}

id HDDoseEventUUIDsFromCodableObjectCollection(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v1, "hasGeneratedObjectCollection"))
  {
    v16 = v1;
    objc_msgSend(v1, "generatedObjectCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "medicationDoseEvents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v18;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)MEMORY[0x1E0CB3A28];
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9), "sample");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "object");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "hk_UUIDWithData:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "hk_addNonNilObject:", v14);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    v1 = v16;
  }

  return v2;
}

uint64_t statistics::QuantitySampleAttenuationEngineSample::QuantitySampleAttenuationEngineSample(uint64_t this)
{
  *(_QWORD *)this = &off_1E6D0D048;
  *(_DWORD *)(this + 44) = 0;
  return this;
}

{
  *(_QWORD *)this = &off_1E6D0D048;
  *(_DWORD *)(this + 44) = 0;
  return this;
}

void statistics::QuantitySampleAttenuationEngineSample::~QuantitySampleAttenuationEngineSample(statistics::QuantitySampleAttenuationEngineSample *this)
{
  PB::Base::~Base(this);
  JUMPOUT(0x1BCCAC494);
}

uint64_t statistics::QuantitySampleAttenuationEngineSample::QuantitySampleAttenuationEngineSample(uint64_t this, const statistics::QuantitySampleAttenuationEngineSample *a2)
{
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;

  *(_QWORD *)this = &off_1E6D0D048;
  *(_DWORD *)(this + 44) = 0;
  v2 = *((_BYTE *)a2 + 44);
  if ((v2 & 8) != 0)
  {
    v4 = *((_QWORD *)a2 + 4);
    v3 = 8;
    *(_BYTE *)(this + 44) = 8;
    *(_QWORD *)(this + 32) = v4;
    v2 = *((_BYTE *)a2 + 44);
    if ((v2 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v3 = 0;
  if ((*((_BYTE *)a2 + 44) & 1) != 0)
  {
LABEL_5:
    v5 = *((_QWORD *)a2 + 1);
    v3 |= 1u;
    *(_BYTE *)(this + 44) = v3;
    *(_QWORD *)(this + 8) = v5;
    v2 = *((_BYTE *)a2 + 44);
  }
LABEL_6:
  if ((v2 & 2) != 0)
  {
    v6 = *((_QWORD *)a2 + 2);
    v3 |= 2u;
    *(_BYTE *)(this + 44) = v3;
    *(_QWORD *)(this + 16) = v6;
    v2 = *((_BYTE *)a2 + 44);
    if ((v2 & 0x10) == 0)
    {
LABEL_8:
      if ((v2 & 4) == 0)
        return this;
LABEL_12:
      v8 = *((_QWORD *)a2 + 3);
      *(_BYTE *)(this + 44) = v3 | 4;
      *(_QWORD *)(this + 24) = v8;
      return this;
    }
  }
  else if ((v2 & 0x10) == 0)
  {
    goto LABEL_8;
  }
  v7 = *((_BYTE *)a2 + 40);
  v3 |= 0x10u;
  *(_BYTE *)(this + 44) = v3;
  *(_BYTE *)(this + 40) = v7;
  if ((*((_BYTE *)a2 + 44) & 4) != 0)
    goto LABEL_12;
  return this;
}

uint64_t statistics::QuantitySampleAttenuationEngineSample::operator=(uint64_t a1, const statistics::QuantitySampleAttenuationEngineSample *a2)
{
  int v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  int v13;

  if ((const statistics::QuantitySampleAttenuationEngineSample *)a1 != a2)
  {
    statistics::QuantitySampleAttenuationEngineSample::QuantitySampleAttenuationEngineSample((uint64_t)&v8, a2);
    v3 = *(_DWORD *)(a1 + 44);
    *(_DWORD *)(a1 + 44) = v13;
    v13 = v3;
    v4 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v11;
    v11 = v4;
    v5 = *(_OWORD *)(a1 + 8);
    *(_OWORD *)(a1 + 8) = v9;
    v9 = v5;
    LOBYTE(v3) = *(_BYTE *)(a1 + 40);
    *(_BYTE *)(a1 + 40) = v12;
    v12 = v3;
    v6 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v10;
    v10 = v6;
    PB::Base::~Base((PB::Base *)&v8);
  }
  return a1;
}

double statistics::swap(statistics *this, statistics::QuantitySampleAttenuationEngineSample *a2, statistics::QuantitySampleAttenuationEngineSample *a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  double result;
  uint64_t v7;

  v3 = *((_DWORD *)this + 11);
  *((_DWORD *)this + 11) = *((_DWORD *)a2 + 11);
  *((_DWORD *)a2 + 11) = v3;
  v4 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = *((_QWORD *)a2 + 4);
  *((_QWORD *)a2 + 4) = v4;
  v5 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v5;
  result = *((double *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((double *)a2 + 2) = result;
  LOBYTE(v3) = *((_BYTE *)this + 40);
  *((_BYTE *)this + 40) = *((_BYTE *)a2 + 40);
  *((_BYTE *)a2 + 40) = v3;
  v7 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v7;
  return result;
}

double statistics::QuantitySampleAttenuationEngineSample::QuantitySampleAttenuationEngineSample(uint64_t a1, uint64_t a2)
{
  double result;

  *(_QWORD *)a1 = &off_1E6D0D048;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a2 + 44) = 0;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  result = *(double *)(a2 + 16);
  *(double *)(a1 + 16) = result;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return result;
}

{
  double result;

  *(_QWORD *)a1 = &off_1E6D0D048;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)(a2 + 44);
  *(_DWORD *)(a2 + 44) = 0;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  result = *(double *)(a2 + 16);
  *(double *)(a1 + 16) = result;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return result;
}

uint64_t statistics::QuantitySampleAttenuationEngineSample::operator=(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  void (**v11)(statistics::QuantitySampleAttenuationEngineSample *__hidden);
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int v16;

  if (a1 != a2)
  {
    v11 = &off_1E6D0D048;
    v3 = *(_DWORD *)(a2 + 44);
    *(_DWORD *)(a2 + 44) = 0;
    v4 = *(_QWORD *)(a2 + 32);
    v5 = *(_BYTE *)(a2 + 40);
    v6 = *(_QWORD *)(a2 + 24);
    v16 = *(_DWORD *)(a1 + 44);
    v14 = *(_QWORD *)(a1 + 32);
    v7 = *(_OWORD *)(a1 + 8);
    v8 = *(_OWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 44) = v3;
    *(_QWORD *)(a1 + 32) = v4;
    *(_OWORD *)(a1 + 8) = v8;
    v12 = v7;
    LOBYTE(v3) = *(_BYTE *)(a1 + 40);
    *(_BYTE *)(a1 + 40) = v5;
    v15 = v3;
    v9 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = v6;
    v13 = v9;
    PB::Base::~Base((PB::Base *)&v11);
  }
  return a1;
}

uint64_t statistics::QuantitySampleAttenuationEngineSample::formatText(statistics::QuantitySampleAttenuationEngineSample *this, PB::TextFormatter *a2, const char *a3)
{
  char v5;

  PB::TextFormatter::beginObject(a2, a3);
  v5 = *((_BYTE *)this + 44);
  if ((v5 & 1) != 0)
  {
    PB::TextFormatter::format(a2, "endTime", *((double *)this + 1));
    v5 = *((_BYTE *)this + 44);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((*((_BYTE *)this + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  PB::TextFormatter::format(a2, "sampleValue", *((double *)this + 2));
  v5 = *((_BYTE *)this + 44);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
LABEL_11:
    PB::TextFormatter::format(a2, "sourceID");
    if ((*((_BYTE *)this + 44) & 8) == 0)
      return PB::TextFormatter::endObject(a2);
    goto LABEL_6;
  }
LABEL_10:
  PB::TextFormatter::format(a2, "shouldContributeToCount");
  v5 = *((_BYTE *)this + 44);
  if ((v5 & 4) != 0)
    goto LABEL_11;
LABEL_5:
  if ((v5 & 8) != 0)
LABEL_6:
    PB::TextFormatter::format(a2, "startTime", *((double *)this + 4));
  return PB::TextFormatter::endObject(a2);
}

uint64_t statistics::QuantitySampleAttenuationEngineSample::readFrom(statistics::QuantitySampleAttenuationEngineSample *this, PB::Reader *a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  char v15;
  unsigned int v16;
  unint64_t v17;
  char v18;
  uint64_t result;
  int v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  char v27;
  char v28;
  unsigned int v29;
  unint64_t v30;
  char v31;

  v2 = *((_QWORD *)a2 + 1);
  v3 = *((_QWORD *)a2 + 2);
  v4 = *((unsigned __int8 *)a2 + 24);
  if (v2 >= v3 || v4 != 0)
    return v4 == 0;
  while (1)
  {
    v8 = *(_QWORD *)a2;
    if (v2 > 0xFFFFFFFFFFFFFFF5 || v2 + 10 > v3)
    {
      v15 = 0;
      v16 = 0;
      v11 = 0;
      if (v2 > v3)
        v3 = v2;
      do
      {
        if (v3 == v2)
        {
          v4 = 1;
          *((_BYTE *)a2 + 24) = 1;
          return v4 == 0;
        }
        v17 = v2 + 1;
        v18 = *(_BYTE *)(v8 + v2);
        *((_QWORD *)a2 + 1) = v17;
        v11 |= (unint64_t)(v18 & 0x7F) << v15;
        if ((v18 & 0x80) == 0)
          goto LABEL_21;
        v15 += 7;
        v2 = v17;
        v14 = v16++ > 8;
      }
      while (!v14);
LABEL_19:
      result = PB::Reader::skip(a2);
      if (!(_DWORD)result)
        return result;
      v2 = *((_QWORD *)a2 + 1);
      goto LABEL_57;
    }
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = v2 + 1;
      *((_QWORD *)a2 + 1) = v2 + 1;
      v13 = *(_BYTE *)(v8 + v2);
      v11 |= (unint64_t)(v13 & 0x7F) << v9;
      if ((v13 & 0x80) == 0)
        break;
      v9 += 7;
      v2 = v12;
      v14 = v10++ > 8;
      if (v14)
        goto LABEL_19;
    }
LABEL_21:
    if ((v11 & 7) == 4)
      break;
    switch((v11 >> 3))
    {
      case 1u:
        *((_BYTE *)this + 44) |= 8u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)a2 + 2))
          goto LABEL_31;
        *((_QWORD *)this + 4) = *(_QWORD *)(*(_QWORD *)a2 + v2);
        goto LABEL_51;
      case 2u:
        *((_BYTE *)this + 44) |= 1u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 > 0xFFFFFFFFFFFFFFF7 || v2 + 8 > *((_QWORD *)a2 + 2))
          goto LABEL_31;
        *((_QWORD *)this + 1) = *(_QWORD *)(*(_QWORD *)a2 + v2);
        goto LABEL_51;
      case 3u:
        *((_BYTE *)this + 44) |= 2u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 <= 0xFFFFFFFFFFFFFFF7 && v2 + 8 <= *((_QWORD *)a2 + 2))
        {
          *((_QWORD *)this + 2) = *(_QWORD *)(*(_QWORD *)a2 + v2);
LABEL_51:
          v2 = *((_QWORD *)a2 + 1) + 8;
          *((_QWORD *)a2 + 1) = v2;
        }
        else
        {
LABEL_31:
          *((_BYTE *)a2 + 24) = 1;
        }
        break;
      case 4u:
        *((_BYTE *)this + 44) |= 0x10u;
        v2 = *((_QWORD *)a2 + 1);
        if (v2 >= *((_QWORD *)a2 + 2))
        {
          v21 = 0;
          *((_BYTE *)a2 + 24) = 1;
        }
        else
        {
          v20 = *(unsigned __int8 *)(*(_QWORD *)a2 + v2++);
          *((_QWORD *)a2 + 1) = v2;
          v21 = v20 != 0;
        }
        *((_BYTE *)this + 40) = v21;
        break;
      case 5u:
        *((_BYTE *)this + 44) |= 4u;
        v22 = *((_QWORD *)a2 + 1);
        v2 = *((_QWORD *)a2 + 2);
        v23 = *(_QWORD *)a2;
        if (v22 > 0xFFFFFFFFFFFFFFF5 || v22 + 10 > v2)
        {
          v28 = 0;
          v29 = 0;
          v26 = 0;
          if (v2 <= v22)
            v2 = *((_QWORD *)a2 + 1);
          while (1)
          {
            if (v2 == v22)
            {
              v26 = 0;
              *((_BYTE *)a2 + 24) = 1;
              goto LABEL_56;
            }
            v30 = v22++;
            v31 = *(_BYTE *)(v23 + v30);
            *((_QWORD *)a2 + 1) = v22;
            v26 |= (unint64_t)(v31 & 0x7F) << v28;
            if ((v31 & 0x80) == 0)
              break;
            v28 += 7;
            v14 = v29++ > 8;
            if (v14)
            {
              v26 = 0;
LABEL_55:
              v2 = v30 + 1;
              goto LABEL_56;
            }
          }
          if (*((_BYTE *)a2 + 24))
            v26 = 0;
          goto LABEL_55;
        }
        v24 = 0;
        v25 = 0;
        v26 = 0;
        do
        {
          v2 = v22 + 1;
          *((_QWORD *)a2 + 1) = v22 + 1;
          v27 = *(_BYTE *)(v23 + v22);
          v26 |= (unint64_t)(v27 & 0x7F) << v24;
          if ((v27 & 0x80) == 0)
            goto LABEL_56;
          v24 += 7;
          v22 = v2;
          v14 = v25++ > 8;
        }
        while (!v14);
        v26 = 0;
LABEL_56:
        *((_QWORD *)this + 3) = v26;
        break;
      default:
        goto LABEL_19;
    }
LABEL_57:
    v3 = *((_QWORD *)a2 + 2);
    v4 = *((unsigned __int8 *)a2 + 24);
    if (v2 >= v3 || v4 != 0)
      return v4 == 0;
  }
  v4 = 0;
  return v4 == 0;
}

uint64_t statistics::QuantitySampleAttenuationEngineSample::writeTo(uint64_t this, PB::Writer *a2)
{
  uint64_t v3;
  char v4;

  v3 = this;
  v4 = *(_BYTE *)(this + 44);
  if ((v4 & 8) != 0)
  {
    this = PB::Writer::write(a2, *(double *)(this + 32));
    v4 = *(_BYTE *)(v3 + 44);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)(this + 44) & 1) == 0)
  {
    goto LABEL_3;
  }
  this = PB::Writer::write(a2, *(double *)(v3 + 8));
  v4 = *(_BYTE *)(v3 + 44);
  if ((v4 & 2) == 0)
  {
LABEL_4:
    if ((v4 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  this = PB::Writer::write(a2, *(double *)(v3 + 16));
  v4 = *(_BYTE *)(v3 + 44);
  if ((v4 & 0x10) == 0)
  {
LABEL_5:
    if ((v4 & 4) == 0)
      return this;
    return PB::Writer::writeVarInt(a2);
  }
LABEL_10:
  this = PB::Writer::write(a2);
  if ((*(_BYTE *)(v3 + 44) & 4) != 0)
    return PB::Writer::writeVarInt(a2);
  return this;
}

BOOL statistics::QuantitySampleAttenuationEngineSample::operator==(uint64_t a1, uint64_t a2)
{
  _BOOL8 v2;

  if ((*(_BYTE *)(a1 + 44) & 8) != 0)
  {
    if ((*(_BYTE *)(a2 + 44) & 8) == 0 || *(double *)(a1 + 32) != *(double *)(a2 + 32))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 44) & 8) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 44) & 1) != 0)
  {
    if ((*(_BYTE *)(a2 + 44) & 1) == 0 || *(double *)(a1 + 8) != *(double *)(a2 + 8))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 44) & 1) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 44) & 2) != 0)
  {
    if ((*(_BYTE *)(a2 + 44) & 2) == 0 || *(double *)(a1 + 16) != *(double *)(a2 + 16))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 44) & 2) != 0)
  {
    return 0;
  }
  if ((*(_BYTE *)(a1 + 44) & 0x10) != 0)
  {
    if ((*(_BYTE *)(a2 + 44) & 0x10) == 0 || *(unsigned __int8 *)(a1 + 40) != *(unsigned __int8 *)(a2 + 40))
      return 0;
  }
  else if ((*(_BYTE *)(a2 + 44) & 0x10) != 0)
  {
    return 0;
  }
  v2 = (*(_BYTE *)(a2 + 44) & 4) == 0;
  if ((*(_BYTE *)(a1 + 44) & 4) != 0)
    return (*(_BYTE *)(a2 + 44) & 4) != 0 && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
  return v2;
}

uint64_t statistics::QuantitySampleAttenuationEngineSample::hash_value(statistics::QuantitySampleAttenuationEngineSample *this)
{
  double v1;
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  if ((*((_BYTE *)this + 44) & 8) == 0)
  {
    v1 = 0.0;
    if ((*((_BYTE *)this + 44) & 1) != 0)
      goto LABEL_3;
LABEL_14:
    v2 = 0.0;
    if ((*((_BYTE *)this + 44) & 2) != 0)
      goto LABEL_6;
LABEL_15:
    v3 = 0.0;
    if ((*((_BYTE *)this + 44) & 0x10) != 0)
      goto LABEL_9;
LABEL_16:
    v4 = 0;
    if ((*((_BYTE *)this + 44) & 4) != 0)
      goto LABEL_10;
LABEL_17:
    v5 = 0;
    return *(_QWORD *)&v2 ^ *(_QWORD *)&v1 ^ *(_QWORD *)&v3 ^ v4 ^ v5;
  }
  v1 = *((double *)this + 4);
  if (v1 == 0.0)
    v1 = 0.0;
  if ((*((_BYTE *)this + 44) & 1) == 0)
    goto LABEL_14;
LABEL_3:
  v2 = *((double *)this + 1);
  if (v2 == 0.0)
    v2 = 0.0;
  if ((*((_BYTE *)this + 44) & 2) == 0)
    goto LABEL_15;
LABEL_6:
  v3 = *((double *)this + 2);
  if (v3 == 0.0)
    v3 = 0.0;
  if ((*((_BYTE *)this + 44) & 0x10) == 0)
    goto LABEL_16;
LABEL_9:
  v4 = *((unsigned __int8 *)this + 40);
  if ((*((_BYTE *)this + 44) & 4) == 0)
    goto LABEL_17;
LABEL_10:
  v5 = *((_QWORD *)this + 3);
  return *(_QWORD *)&v2 ^ *(_QWORD *)&v1 ^ *(_QWORD *)&v3 ^ v4 ^ v5;
}

void sub_1B7E495A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__184(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__184(uint64_t a1)
{

}

uint64_t HDCodableTinkerPairingRequestReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  void *v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
          goto LABEL_42;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_42;
        case 3u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 80) |= 2u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if (v25 < 0)
              {
                v20 += 7;
                v14 = v21++ >= 9;
                if (v14)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_48;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_48:
          *(_DWORD *)(a1 + 56) = v22;
          continue;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_42;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_42;
        case 6u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 80) |= 1u;
          break;
        case 7u:
          PBReaderReadData();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_42;
        case 8u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 64;
          goto LABEL_42;
        case 9u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 72;
LABEL_42:
          v32 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v29 = *v3;
        v30 = *(_QWORD *)(a2 + v29);
        if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
          break;
        v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
        *(_QWORD *)(a2 + v29) = v30 + 1;
        v28 |= (unint64_t)(v31 & 0x7F) << v26;
        if ((v31 & 0x80) == 0)
          goto LABEL_50;
        v26 += 7;
        v14 = v27++ >= 9;
        if (v14)
        {
          v28 = 0;
          goto LABEL_52;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_50:
      if (*(_BYTE *)(a2 + *v5))
        v28 = 0;
LABEL_52:
      *(_QWORD *)(a1 + 8) = v28;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B7E4CF7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B7E50F28(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E515F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E51E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__185(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__185(uint64_t a1)
{

}

id HDUserDomainConceptEntityPredicateForConceptsWithCreationDateBefore()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "predicateWithProperty:lessThanValue:", CFSTR("creation_date"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1B7E52450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HDUserDomainConceptEntityPredicateForPropertyType(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "predicateWithProperty:equalToValue:", CFSTR("user_domain_concept_properties.property_type"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t HDUserDomainConceptEntityPredicateForConceptUUID(uint64_t a1, int a2)
{
  uint64_t v2;

  if (a2)
    v2 = 1;
  else
    v2 = 2;
  return objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:value:comparisonType:", CFSTR("uuid"), a1, v2);
}

void sub_1B7E52EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E546A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

__CFString *HDStringFromUserDomainConceptEntityInsertMethod(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 3)
    return off_1E6D0D760[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *HDStringFromUserDomainConceptEntityInsertResult(unint64_t a1)
{
  if (a1 < 4)
    return off_1E6D0D778[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifiers(void *a1)
{
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8, (_QWORD)v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v1, "code"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithProperty:equalToValue:", CFSTR("type"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "schema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D29838];
    objc_msgSend(v1, "schema");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predicateWithProperty:equalToValue:", CFSTR("schema"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("schema"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v9 = (void *)MEMORY[0x1E0D29840];
  v13[0] = v4;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateMatchingAllPredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t HDUserDomainConceptEntityPredicateForConceptUUIDs(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("uuid"), a1);
}

id HDUserDomainConceptEntityPredicateForMedicalCoding(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0D29840];
  v2 = (void *)MEMORY[0x1E0D29838];
  v3 = a1;
  objc_msgSend(v3, "codingSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithProperty:equalToValue:", CFSTR("medical_coding_system.string"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v7 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v3, "code");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "predicateWithProperty:equalToValue:", CFSTR("medical_coding_code.string"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "predicateMatchingAllPredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id HDUserDomainConceptEntityPredicateForMedicalCodingSystem(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "predicateWithProperty:equalToValue:", CFSTR("medical_coding_system.string"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id HDUserDomainConceptEntityPredicateWithCodingCollection(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0D29840];
  objc_msgSend(a1, "codings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_433_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "predicateMatchingAllPredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t HDUserDomainConceptEntityPredicateForConceptsWithAnchorAfter(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:greaterThanValue:", CFSTR("sync_anchor"), a1);
}

void sub_1B7E556F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _HDSyncAnchorPropertyForType(unint64_t a1)
{
  void *v2;
  void *v3;

  if (a1 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _HDSyncAnchorPropertyForType(HDSyncAnchorType)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HDSyncAnchorEntity.m"), 69, CFSTR("Invalid anchor type %ld"), a1);

  }
}

void _HDSyncAnchorUpdateOptionsForType(unint64_t a1)
{
  void *v2;
  void *v3;

  if (a1 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSUInteger _HDSyncAnchorUpdateOptionsForType(HDSyncAnchorType)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HDSyncAnchorEntity.m"), 93, CFSTR("Invalid anchor type %ld"), a1);

  }
}

void _HDSyncAnchorUpdateDatePropertyForType(unint64_t a1)
{
  void *v2;
  void *v3;

  if (a1 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _HDSyncAnchorUpdateDatePropertyForType(HDSyncAnchorType)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("HDSyncAnchorEntity.m"), 81, CFSTR("Invalid anchor type %ld"), a1);

  }
}

void sub_1B7E57598(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x298], 8);
  _Block_object_dispose(&STACK[0x2B8], 8);
  _Block_object_dispose(&STACK[0x2D8], 8);
  _Block_object_dispose(&STACK[0x2F8], 8);
  _Block_object_dispose(&STACK[0x318], 8);
  _Block_object_dispose(&STACK[0x338], 8);
  _Block_object_dispose(&STACK[0x358], 8);
  _Block_object_dispose(&STACK[0x378], 8);
  _Block_object_dispose(&STACK[0x398], 8);
  _Block_object_dispose(&STACK[0x3B8], 8);
  _Block_object_dispose(&STACK[0x3D8], 8);
  _Block_object_dispose(&STACK[0x3F8], 8);
  _Block_object_dispose(&STACK[0x418], 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__186(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__186(uint64_t a1)
{

}

void sub_1B7E58E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E59568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t HDCodableRacingClusterReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  HDCodableSyncIdentity *v21;
  uint64_t result;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  void *v39;
  uint64_t v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  uint64_t v48;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    v18 = v10 >> 3;
    switch((v10 >> 3))
    {
      case 1u:
        PBReaderReadData();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 80;
        goto LABEL_46;
      case 2u:
        PBReaderReadData();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 88;
        goto LABEL_46;
      case 3u:
        *(_BYTE *)(a1 + 100) |= 1u;
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v25 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v25 = 0;
        }
        *(_QWORD *)(a1 + 8) = v25;
        goto LABEL_78;
      case 4u:
        v26 = 0;
        v27 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 100) |= 4u;
        while (2)
        {
          v29 = *v3;
          v30 = *(_QWORD *)(a2 + v29);
          v31 = v30 + 1;
          if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
            *(_QWORD *)(a2 + v29) = v31;
            v28 |= (unint64_t)(v32 & 0x7F) << v26;
            if (v32 < 0)
            {
              v26 += 7;
              v15 = v27++ >= 9;
              if (v15)
              {
                LODWORD(v28) = 0;
                goto LABEL_66;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v28) = 0;
LABEL_66:
        v48 = 32;
        goto LABEL_71;
      case 5u:
        v33 = 0;
        v34 = 0;
        v28 = 0;
        *(_BYTE *)(a1 + 100) |= 2u;
        while (2)
        {
          v35 = *v3;
          v36 = *(_QWORD *)(a2 + v35);
          v37 = v36 + 1;
          if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
            *(_QWORD *)(a2 + v35) = v37;
            v28 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              v15 = v34++ >= 9;
              if (v15)
              {
                LODWORD(v28) = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v28) = 0;
LABEL_70:
        v48 = 16;
LABEL_71:
        *(_DWORD *)(a1 + v48) = v28;
        goto LABEL_78;
      case 6u:
        PBReaderReadData();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 64;
        goto LABEL_46;
      case 7u:
        PBReaderReadString();
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = 56;
LABEL_46:
        v39 = *(void **)(a1 + v20);
        *(_QWORD *)(a1 + v20) = v19;

        goto LABEL_78;
      case 8u:
        v21 = objc_alloc_init(HDCodableSyncIdentity);
        objc_storeStrong((id *)(a1 + 72), v21);
        if (!PBReaderPlaceMark() || !HDCodableSyncIdentityReadFrom((uint64_t)v21, a2))
          goto LABEL_80;
        goto LABEL_54;
      case 9u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
      case 0x10u:
      case 0x11u:
      case 0x12u:
      case 0x13u:
        goto LABEL_24;
      case 0x14u:
        v21 = objc_alloc_init(HDCodableRacingMetrics);
        v40 = 48;
        goto LABEL_52;
      case 0x15u:
        v21 = objc_alloc_init(HDCodableRacingMetrics);
        v40 = 24;
LABEL_52:
        objc_storeStrong((id *)(a1 + v40), v21);
        if (PBReaderPlaceMark() && (HDCodableRacingMetricsReadFrom((uint64_t)v21, a2) & 1) != 0)
        {
LABEL_54:
          PBReaderRecallMark();
LABEL_55:

LABEL_78:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_80:

        return 0;
      default:
        if ((_DWORD)v18 == 30)
        {
          v41 = 0;
          v42 = 0;
          v43 = 0;
          *(_BYTE *)(a1 + 100) |= 8u;
          while (1)
          {
            v44 = *v3;
            v45 = *(_QWORD *)(a2 + v44);
            v46 = v45 + 1;
            if (v45 == -1 || v46 > *(_QWORD *)(a2 + *v4))
              break;
            v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
            *(_QWORD *)(a2 + v44) = v46;
            v43 |= (unint64_t)(v47 & 0x7F) << v41;
            if ((v47 & 0x80) == 0)
              goto LABEL_73;
            v41 += 7;
            v15 = v42++ >= 9;
            if (v15)
            {
              v43 = 0;
              goto LABEL_75;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_73:
          if (*(_BYTE *)(a2 + *v5))
            v43 = 0;
LABEL_75:
          *(_BYTE *)(a1 + 96) = v43 != 0;
        }
        else
        {
          if ((_DWORD)v18 == 100)
          {
            PBReaderReadData();
            v21 = (HDCodableSyncIdentity *)objc_claimAutoreleasedReturnValue();
            if (v21)
              objc_msgSend((id)a1, "addEligibleClusterUUIDs:", v21);
            goto LABEL_55;
          }
LABEL_24:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
        }
        goto LABEL_78;
    }
  }
}

void sub_1B7E5B8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E5BA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__187(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__187(uint64_t a1)
{

}

void sub_1B7E5C2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__188(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__188(uint64_t a1)
{

}

void sub_1B7E5E584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E5E888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B7E5F46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E607FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E61CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E62AD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E64610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E64B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E65090(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  if (a2 == 1)
  {
    v13 = objc_begin_catch(exception_object);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 3, CFSTR("%@"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutSessionServer _queue_generateError:](v12, v14);
    v15 = v14;
    v16 = v15;
    if (v15)
      objc_retainAutorelease(v15);

    objc_end_catch();
    JUMPOUT(0x1B7E64D94);
  }
  _Unwind_Resume(exception_object);
}

void sub_1B7E6544C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E6595C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__189(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__189(uint64_t a1)
{

}

void sub_1B7E6EDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a46, 8);
  _Unwind_Resume(a1);
}

__CFString *HDDataAggregationRequestModeToString(uint64_t a1)
{
  __CFString *v1;

  if (a1 == 1)
    return CFSTR("exclusive");
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown(%ld)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = CFSTR("inclusive");
  }
  return v1;
}

void sub_1B7E71DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

void sub_1B7E75490(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__190(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__190(uint64_t a1)
{

}

void sub_1B7E78640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__191(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__191(uint64_t a1)
{

}

void sub_1B7E78B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E78D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E7902C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E79804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a66;
  char a72;
  uint64_t v72;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&a72, 8);
  _Block_object_dispose((const void *)(v72 - 248), 8);
  _Block_object_dispose((const void *)(v72 - 200), 8);
  _Block_object_dispose((const void *)(v72 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E79CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E7A384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  uint64_t v44;

  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 232), 8);
  _Block_object_dispose((const void *)(v44 - 200), 8);
  _Block_object_dispose((const void *)(v44 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E7C37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__192(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__192(uint64_t a1)
{

}

void sub_1B7E7DCB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 248), 8);
  _Block_object_dispose((const void *)(v1 - 216), 8);
  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Unwind_Resume(a1);
}

id HDLogicalOrderSourceEntityPredicateWithDataType(void *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "code"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "predicateWithProperty:equalToValue:", CFSTR("data_type"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id HDLogicalOrderSourceEntityPredicateWithSourceIDs(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("sources.ROWID"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:notEqualToValue:", CFSTR("sources.deleted"), MEMORY[0x1E0C9AAB0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t HDCodableSectionDataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  void *v18;
  uint64_t result;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend((id)a1, "addStringValues:", v18);

          continue;
        case 2u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 1u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                v15 = v21++ >= 9;
                if (v15)
                {
                  v22 = 0;
                  goto LABEL_51;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_51:
          v43 = 8;
          goto LABEL_56;
        case 3u:
          v27 = 0;
          v28 = 0;
          v22 = 0;
          *(_BYTE *)(a1 + 44) |= 4u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v31;
              v22 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v15 = v28++ >= 9;
                if (v15)
                {
                  v22 = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v22 = 0;
LABEL_55:
          v43 = 24;
LABEL_56:
          *(_QWORD *)(a1 + v43) = v22;
          continue;
        case 4u:
          *(_BYTE *)(a1 + 44) |= 2u;
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v35 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v35 = 0;
          }
          *(_QWORD *)(a1 + 16) = v35;
          continue;
        case 5u:
          v36 = 0;
          v37 = 0;
          v38 = 0;
          *(_BYTE *)(a1 + 44) |= 8u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v39 = *v3;
        v40 = *(_QWORD *)(a2 + v39);
        v41 = v40 + 1;
        if (v40 == -1 || v41 > *(_QWORD *)(a2 + *v4))
          break;
        v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v40);
        *(_QWORD *)(a2 + v39) = v41;
        v38 |= (unint64_t)(v42 & 0x7F) << v36;
        if ((v42 & 0x80) == 0)
          goto LABEL_58;
        v36 += 7;
        v15 = v37++ >= 9;
        if (v15)
        {
          v38 = 0;
          goto LABEL_60;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_58:
      if (*(_BYTE *)(a2 + *v5))
        v38 = 0;
LABEL_60:
      *(_BYTE *)(a1 + 40) = v38 != 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t HDCodableMedicalIDMedicationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

__CFString *HDStringFromHDHFDDatabaseFailureType(uint64_t a1)
{
  uint64_t v1;
  __CFString *v2;

  v1 = a1 - 1;
  v2 = CFSTR("corruption");
  switch(v1)
  {
    case 0:
      return v2;
    case 1:
      v2 = CFSTR("transactionError");
      return v2;
    case 2:
      return CFSTR("fileAccessError");
    case 3:
      return CFSTR("BTreeCorruption");
    case 4:
      return CFSTR("OutOfRangeError");
    case 5:
      return CFSTR("OtherException - historical");
    case 6:
      return CFSTR("logicError");
    case 7:
      return CFSTR("runtimeError");
    case 8:
      return CFSTR("ioException");
    case 9:
      return CFSTR("systemException");
    case 10:
      return CFSTR("notFoundError");
    default:
      if (CFSTR("corruption") == (__CFString *)100)
        return CFSTR("unknownException");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown failure type (%ld)"), CFSTR("corruption"));
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v2;
  }
}

void sub_1B7E81184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__193(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__193(uint64_t a1)
{

}

void sub_1B7E82230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B7E832EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__194(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__194(uint64_t a1)
{

}

void sub_1B7E8C4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__195(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__195(uint64_t a1)
{

}

void sub_1B7E8CEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E8E554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1B7E8EBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

id HDSleepScheduleEntityPredicateForWeekday(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v1 = (void *)MEMORY[0x1E0D29838];
    _PropertyForWeekday(a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "predicateWithProperty:value:comparisonType:", v2, MEMORY[0x1E0C9AAB0], 1);
  }
  else
  {
    HKSleepScheduleWeekdayArrayFromWeekdays();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hk_map:", &__block_literal_global_234);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v2);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

const __CFString *_PropertyForWeekday(uint64_t a1)
{
  const __CFString *result;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;

  if ((HKSleepScheduleWeekdaysIsSingleDay() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nullable _PropertyForWeekday(HKSleepScheduleWeekdays)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("HDSleepScheduleEntity.m"), 171, CFSTR("Only one weekday can be converted to property: %ld"), a1);

  }
  if (a1 > 15)
  {
    v3 = CFSTR("saturday");
    v4 = CFSTR("sunday");
    if (a1 != 64)
      v4 = 0;
    if (a1 != 32)
      v3 = v4;
    if (a1 == 16)
      return CFSTR("friday");
    else
      return v3;
  }
  else
  {
    result = 0;
    switch(a1)
    {
      case 1:
        result = CFSTR("monday");
        break;
      case 2:
        result = CFSTR("tuesday");
        break;
      case 4:
        result = CFSTR("wednesday");
        break;
      case 8:
        result = CFSTR("thursday");
        break;
      default:
        return result;
    }
  }
  return result;
}

id HDSleepScheduleEntityPredicateForWeekdayBeforeDate(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D29840];
  v4 = a2;
  HDSleepScheduleEntityPredicateForWeekday(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  HDSampleEntityPredicateForStartDate(3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateMatchingAllPredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_1B7E94BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _HDLocationSeriesIdentifierForHFDKeyV1()
{
  return 0;
}

uint64_t _HDLocationSeriesIdentifierForHFDKeyV2()
{
  return 3;
}

uint64_t _HDQuantitySampleSeriesIdentifierForHFDKeyV0()
{
  return 1;
}

uint64_t _HDQuantitySampleSeriesIdentifierForHFDKeyV1()
{
  return 2;
}

uint64_t _HDTemporarySampleHistoryIdentifierForPersistentID()
{
  return -1;
}

_QWORD *_HDSampleHistoryDescriptionForObjectType@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *result;
  const char *v4;
  const char *v5;
  _BYTE *v6;

  result = std::string::basic_string[abi:ne180100]<0>(a2, "Unknown Series");
  switch(a1)
  {
    case 0:
      if (*((char *)result + 23) < 0)
      {
        result[1] = 20;
        result = (_QWORD *)*result;
      }
      else
      {
        *((_BYTE *)result + 23) = 20;
      }
      *((_DWORD *)result + 4) = 691107368;
      v4 = "Location Series (v1)";
      goto LABEL_19;
    case 1:
      if (*((char *)result + 23) < 0)
      {
        result[1] = 21;
        result = (_QWORD *)*result;
      }
      else
      {
        *((_BYTE *)result + 23) = 21;
      }
      v5 = "Quantity Samples (v0)";
      goto LABEL_16;
    case 2:
      if (*((char *)result + 23) < 0)
      {
        result[1] = 21;
        result = (_QWORD *)*result;
      }
      else
      {
        *((_BYTE *)result + 23) = 21;
      }
      v5 = "Quantity Samples (v1)";
LABEL_16:
      *(_OWORD *)result = *(_OWORD *)v5;
      *(_QWORD *)((char *)result + 13) = *(_QWORD *)(v5 + 13);
      v6 = (char *)result + 21;
      goto LABEL_20;
    case 3:
      if (*((char *)result + 23) < 0)
      {
        result[1] = 20;
        result = (_QWORD *)*result;
      }
      else
      {
        *((_BYTE *)result + 23) = 20;
      }
      *((_DWORD *)result + 4) = 691172904;
      v4 = "Location Series (v2)";
LABEL_19:
      *(_OWORD *)result = *(_OWORD *)v4;
      v6 = (char *)result + 20;
LABEL_20:
      *v6 = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t HDCodableFitnessFriendWorkoutReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  __objc2_class **v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  BOOL v17;
  int v18;
  int *v20;
  __objc2_class **v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t result;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = off_1E6CE3000;
    v8 = &OBJC_IVAR___HDBackgroundObservationServerExtension__sessionUUID;
    v9 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v10 = 0;
      v11 = 0;
      v12 = 0;
      while (1)
      {
        v13 = *v3;
        v14 = *(_QWORD *)(a2 + v13);
        v15 = v14 + 1;
        if (v14 == -1 || v15 > *(_QWORD *)(a2 + *v4))
          break;
        v16 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v14);
        *(_QWORD *)(a2 + v13) = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0)
          goto LABEL_12;
        v10 += 7;
        v17 = v11++ >= 9;
        if (v17)
        {
          v12 = 0;
          v18 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v18 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v12 = 0;
LABEL_14:
      if (v18 || (v12 & 7) == 4)
        break;
      switch((v12 >> 3))
      {
        case 1u:
          v20 = v8;
          v21 = v7;
          v22 = objc_alloc_init(v7[87]);
          objc_storeStrong((id *)(a1 + 120), v22);
          if (PBReaderPlaceMark() && (HDCodableSampleReadFrom((uint64_t)v22, a2) & 1) != 0)
          {
            PBReaderRecallMark();

            v7 = v21;
            v8 = v20;
            continue;
          }

          return 0;
        case 2u:
          PBReaderReadData();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v8[581];
          goto LABEL_80;
        case 3u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_WORD *)(a1 + 144) |= 0x200u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            v30 = v29 + 1;
            if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v29);
              *(_QWORD *)(a2 + v28) = v30;
              v27 |= (unint64_t)(v31 & 0x7F) << v25;
              if (v31 < 0)
              {
                v25 += 7;
                v17 = v26++ >= 9;
                if (v17)
                {
                  v27 = 0;
                  goto LABEL_84;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v27 = 0;
LABEL_84:
          v69 = 80;
          goto LABEL_101;
        case 5u:
          *(_WORD *)(a1 + 144) |= 2u;
          v33 = *v3;
          v34 = *(_QWORD *)(a2 + v33);
          if (v34 <= 0xFFFFFFFFFFFFFFF7 && v34 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v35 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v34);
            *(_QWORD *)(a2 + v33) = v34 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v35 = 0;
          }
          v70 = 16;
          goto LABEL_112;
        case 6u:
          *(_WORD *)(a1 + 144) |= 0x100u;
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v35 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v35 = 0;
          }
          v70 = 72;
          goto LABEL_112;
        case 7u:
          *(_WORD *)(a1 + 144) |= 0x40u;
          v38 = *v3;
          v39 = *(_QWORD *)(a2 + v38);
          if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v35 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v39);
            *(_QWORD *)(a2 + v38) = v39 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v35 = 0;
          }
          v70 = 56;
          goto LABEL_112;
        case 8u:
          *(_WORD *)(a1 + 144) |= 0x80u;
          v40 = *v3;
          v41 = *(_QWORD *)(a2 + v40);
          if (v41 <= 0xFFFFFFFFFFFFFFF7 && v41 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v35 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v41);
            *(_QWORD *)(a2 + v40) = v41 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v35 = 0;
          }
          v70 = 64;
          goto LABEL_112;
        case 9u:
          v42 = 0;
          v43 = 0;
          v27 = 0;
          *(_WORD *)(a1 + 144) |= 8u;
          while (2)
          {
            v44 = *v3;
            v45 = *(_QWORD *)(a2 + v44);
            v46 = v45 + 1;
            if (v45 == -1 || v46 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v47 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v45);
              *(_QWORD *)(a2 + v44) = v46;
              v27 |= (unint64_t)(v47 & 0x7F) << v42;
              if (v47 < 0)
              {
                v42 += 7;
                v17 = v43++ >= 9;
                if (v17)
                {
                  v27 = 0;
                  goto LABEL_88;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v27 = 0;
LABEL_88:
          v69 = 32;
          goto LABEL_101;
        case 0xAu:
          *(_WORD *)(a1 + 144) |= 4u;
          v48 = *v3;
          v49 = *(_QWORD *)(a2 + v48);
          if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v35 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v49);
            *(_QWORD *)(a2 + v48) = v49 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v35 = 0;
          }
          v70 = 24;
LABEL_112:
          *(_QWORD *)(a1 + v70) = v35;
          continue;
        case 0xBu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 88;
          goto LABEL_80;
        case 0xCu:
          v50 = 0;
          v51 = 0;
          v27 = 0;
          *(_WORD *)(a1 + 144) |= 0x20u;
          while (2)
          {
            v52 = *v3;
            v53 = *(_QWORD *)(a2 + v52);
            v54 = v53 + 1;
            if (v53 == -1 || v54 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v53);
              *(_QWORD *)(a2 + v52) = v54;
              v27 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                v17 = v51++ >= 9;
                if (v17)
                {
                  v27 = 0;
                  goto LABEL_92;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v27 = 0;
LABEL_92:
          v69 = 48;
          goto LABEL_101;
        case 0xDu:
          v56 = 0;
          v57 = 0;
          v27 = 0;
          *(_WORD *)(a1 + 144) |= 0x10u;
          while (2)
          {
            v58 = *v3;
            v59 = *(_QWORD *)(a2 + v58);
            v60 = v59 + 1;
            if (v59 == -1 || v60 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v59);
              *(_QWORD *)(a2 + v58) = v60;
              v27 |= (unint64_t)(v61 & 0x7F) << v56;
              if (v61 < 0)
              {
                v56 += 7;
                v17 = v57++ >= 9;
                if (v17)
                {
                  v27 = 0;
                  goto LABEL_96;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v27 = 0;
LABEL_96:
          v69 = 40;
          goto LABEL_101;
        case 0xEu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 96;
          goto LABEL_80;
        case 0xFu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 104;
          goto LABEL_80;
        case 0x10u:
          v62 = 0;
          v63 = 0;
          v27 = 0;
          *(_WORD *)(a1 + 144) |= 1u;
          break;
        case 0x11u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 128;
          goto LABEL_80;
        case 0x12u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 136;
LABEL_80:
          v68 = *(void **)(a1 + v24);
          *(_QWORD *)(a1 + v24) = v23;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v64 = *v3;
        v65 = *(_QWORD *)(a2 + v64);
        v66 = v65 + 1;
        if (v65 == -1 || v66 > *(_QWORD *)(a2 + *v4))
          break;
        v67 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v65);
        *(_QWORD *)(a2 + v64) = v66;
        v27 |= (unint64_t)(v67 & 0x7F) << v62;
        if ((v67 & 0x80) == 0)
          goto LABEL_98;
        v62 += 7;
        v17 = v63++ >= 9;
        if (v17)
        {
          v27 = 0;
          goto LABEL_100;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_98:
      if (*(_BYTE *)(a2 + *v5))
        v27 = 0;
LABEL_100:
      v69 = 8;
LABEL_101:
      *(_QWORD *)(a1 + v69) = v27;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B7E98F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__196(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1B7E9ADA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E9BE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__197(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__197(uint64_t a1)
{

}

void sub_1B7E9C33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1B7E9DE04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EA1804(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__198(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id HDSimpleGraphDatabaseNodeEntityPredicateForIdentifier(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithProperty:value:comparisonType:", CFSTR("rowid"), v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t HDSimpleGraphDatabaseNodeEntityPredicateForIdentifiers(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("rowid"), a1);
}

id HDSimpleGraphDatabaseNodeEntityPredicateForAttributeType(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D29838];
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDSimpleGraphDatabaseAttributeEntity, "disambiguatedSQLForProperty:", CFSTR("attribute_type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithProperty:value:comparisonType:", v5, v6, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id HDSimpleGraphDatabaseNodeEntityPredicateForAttributeValue(void *a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D29838];
  v4 = a1;
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDSimpleGraphDatabaseAttributeEntity, "disambiguatedSQLForProperty:", CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithProperty:value:comparisonType:", v5, v4, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id HDSimpleGraphDatabaseNodeEntityPredicateForAttribute(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D29890];
  v4 = a2;
  HDSimpleGraphDatabaseNodeEntityPredicateForAttributeType(a1, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSimpleGraphDatabaseNodeEntityPredicateForAttributeValue(v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "compoundPredicateWithPredicate:otherPredicate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id HDSimpleGraphDatabaseNodeEntityPredicateWithoutAttribute(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D298A0];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setEntityClass:", objc_opt_class());
  v6 = (void *)MEMORY[0x1E0D29890];
  v7 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithProperty:equalToValue:", CFSTR("attribute_type"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("value"), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "compoundPredicateWithPredicate:otherPredicate:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v11);

  v12 = (void *)MEMORY[0x1E0D29838];
  v17[0] = CFSTR("node_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateWithProperty:comparisonType:subqueryDescriptor:subqueryProperties:", CFSTR("rowid"), 7, v5, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29840], "negatedPredicate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id HDSimpleGraphDatabaseNodeEntityPredicateForNodesRelatedToSubjectID(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D29838];
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDSimpleGraphDatabaseRelationshipEntity, "disambiguatedSQLForProperty:", CFSTR("subject_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithProperty:equalToValue:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id HDSimpleGraphDatabaseNodeEntityPredicateForNodesRelatedToObjectID(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D29838];
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDSimpleGraphDatabaseRelationshipEntity, "disambiguatedSQLForProperty:", CFSTR("object_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithProperty:equalToValue:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id HDSimpleGraphDatabaseNodeEntityPredicateForNodesWithRelationshipType(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D29838];
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDSimpleGraphDatabaseRelationshipEntity, "disambiguatedSQLForProperty:", CFSTR("relationship_type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithProperty:equalToValue:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL HDCodableClinicalContactReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 8;
          goto LABEL_27;
        case 2u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 16;
          goto LABEL_27;
        case 3u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 24;
          goto LABEL_27;
        case 4u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 32;
          goto LABEL_27;
        case 5u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 40;
          goto LABEL_27;
        case 6u:
          PBReaderReadString();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = 48;
LABEL_27:
          v19 = *(void **)(a1 + v18);
          *(_QWORD *)(a1 + v18) = v17;

          goto LABEL_28;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_28:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

__CFString *HKStringFromStateSyncMergeResult(unint64_t a1)
{
  if (a1 < 4)
    return off_1E6D0FA20[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown (%d)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

BOOL HDCodableWorkoutZonesAssociationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  HDCodableSyncIdentity *v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 24;
LABEL_26:
        v20 = *(HDCodableSyncIdentity **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;
LABEL_27:

        goto LABEL_29;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_29:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v20 = objc_alloc_init(HDCodableSyncIdentity);
    objc_storeStrong((id *)(a1 + 8), v20);
    if (!PBReaderPlaceMark() || !HDCodableSyncIdentityReadFrom((uint64_t)v20, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_27;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B7EA80B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__199(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__199(uint64_t a1)
{

}

void sub_1B7EA8A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EAAFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromHDProtectedDataOperationState(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) < 8)
    return off_1E6D0FCD0[a1 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HDProtectedDataOperationStateUnknown-%ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t HDCodableAuthorizationRequestMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v16;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  char v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  void *v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  char v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      v16 = v10 & 7;
      if (v15 || v16 == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v18 = v10 >> 3;
      if ((int)(v10 >> 3) > 9)
      {
        if ((_DWORD)v18 == 10)
        {
          if (v16 != 2)
          {
            v41 = 0;
            v42 = 0;
            v43 = 0;
            while (1)
            {
              v44 = *v3;
              v45 = *(_QWORD *)(a2 + v44);
              if (v45 == -1 || v45 >= *(_QWORD *)(a2 + *v4))
                goto LABEL_69;
              v46 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v45);
              *(_QWORD *)(a2 + v44) = v45 + 1;
              v43 |= (unint64_t)(v46 & 0x7F) << v41;
              if (v46 < 0)
              {
                v41 += 7;
                v14 = v42++ >= 9;
                if (!v14)
                  continue;
              }
              goto LABEL_70;
            }
          }
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v29 = 0;
            v30 = 0;
            v31 = 0;
            while (1)
            {
              v32 = *v3;
              v33 = *(_QWORD *)(a2 + v32);
              if (v33 == -1 || v33 >= *(_QWORD *)(a2 + *v4))
                break;
              v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
              *(_QWORD *)(a2 + v32) = v33 + 1;
              v31 |= (unint64_t)(v34 & 0x7F) << v29;
              if (v34 < 0)
              {
                v29 += 7;
                v14 = v30++ >= 9;
                if (!v14)
                  continue;
              }
              goto LABEL_51;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_51:
            PBRepeatedInt64Add();
          }
          goto LABEL_54;
        }
        if ((_DWORD)v18 == 11)
        {
          if (v16 != 2)
          {
            v35 = 0;
            v36 = 0;
            v37 = 0;
            while (1)
            {
              v38 = *v3;
              v39 = *(_QWORD *)(a2 + v38);
              if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
                break;
              v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
              *(_QWORD *)(a2 + v38) = v39 + 1;
              v37 |= (unint64_t)(v40 & 0x7F) << v35;
              if (v40 < 0)
              {
                v35 += 7;
                v14 = v36++ >= 9;
                if (!v14)
                  continue;
              }
              goto LABEL_70;
            }
LABEL_69:
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_70:
            PBRepeatedInt64Add();
            continue;
          }
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v22 = 0;
            v23 = 0;
            v24 = 0;
            while (1)
            {
              v25 = *v3;
              v26 = *(_QWORD *)(a2 + v25);
              if (v26 == -1 || v26 >= *(_QWORD *)(a2 + *v4))
                break;
              v27 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v26);
              *(_QWORD *)(a2 + v25) = v26 + 1;
              v24 |= (unint64_t)(v27 & 0x7F) << v22;
              if (v27 < 0)
              {
                v22 += 7;
                v14 = v23++ >= 9;
                if (!v14)
                  continue;
              }
              goto LABEL_36;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_36:
            PBRepeatedInt64Add();
          }
LABEL_54:
          PBReaderRecallMark();
          continue;
        }
      }
      else
      {
        if ((_DWORD)v18 == 1)
        {
          PBReaderReadString();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 56;
          goto LABEL_38;
        }
        if ((_DWORD)v18 == 2)
        {
          PBReaderReadData();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = 64;
LABEL_38:
          v28 = *(void **)(a1 + v20);
          *(_QWORD *)(a1 + v20) = v19;

          continue;
        }
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B7EAFE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Block_object_dispose(&a9, 8);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__200(uint64_t a1)
{

}

HDKeyValueDomain *HDMirroredWorkoutSessionKeyValueDomainWithProfile(void *a1)
{
  id v1;
  HDKeyValueDomain *v2;

  v1 = a1;
  v2 = -[HDKeyValueDomain initWithCategory:domainName:profile:]([HDKeyValueDomain alloc], "initWithCategory:domainName:profile:", 0, CFSTR("MirroredWorkoutSession"), v1);

  return v2;
}

uint64_t HDCodableWorkoutSessionGlobalStateReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  HDCodableWorkoutActivity *v41;
  uint64_t v42;
  uint64_t v43;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 72) |= 2u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_54;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            v20 = 0;
            goto LABEL_56;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_54:
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_56:
        v42 = 16;
        goto LABEL_61;
      case 2u:
        *(_BYTE *)(a1 + 72) |= 4u;
        v26 = *v3;
        v27 = *(_QWORD *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v28 = 0;
        }
        v43 = 24;
        goto LABEL_70;
      case 3u:
        v29 = 0;
        v30 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 72) |= 8u;
        while (2)
        {
          v31 = *v3;
          v32 = *(_QWORD *)(a2 + v31);
          v33 = v32 + 1;
          if (v32 == -1 || v33 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v34 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v32);
            *(_QWORD *)(a2 + v31) = v33;
            v20 |= (unint64_t)(v34 & 0x7F) << v29;
            if (v34 < 0)
            {
              v29 += 7;
              v15 = v30++ >= 9;
              if (v15)
              {
                v20 = 0;
                goto LABEL_60;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v20 = 0;
LABEL_60:
        v42 = 32;
LABEL_61:
        *(_QWORD *)(a1 + v42) = v20;
        goto LABEL_71;
      case 4u:
        *(_BYTE *)(a1 + 72) |= 0x10u;
        v35 = *v3;
        v36 = *(_QWORD *)(a2 + v35);
        if (v36 <= 0xFFFFFFFFFFFFFFF7 && v36 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v36);
          *(_QWORD *)(a2 + v35) = v36 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v28 = 0;
        }
        v43 = 40;
        goto LABEL_70;
      case 5u:
        *(_BYTE *)(a1 + 72) |= 0x20u;
        v37 = *v3;
        v38 = *(_QWORD *)(a2 + v37);
        if (v38 <= 0xFFFFFFFFFFFFFFF7 && v38 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v38);
          *(_QWORD *)(a2 + v37) = v38 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v28 = 0;
        }
        v43 = 48;
        goto LABEL_70;
      case 6u:
        *(_BYTE *)(a1 + 72) |= 1u;
        v39 = *v3;
        v40 = *(_QWORD *)(a2 + v39);
        if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v40);
          *(_QWORD *)(a2 + v39) = v40 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v28 = 0;
        }
        v43 = 8;
LABEL_70:
        *(_QWORD *)(a1 + v43) = v28;
        goto LABEL_71;
      case 7u:
        v41 = objc_alloc_init(HDCodableWorkoutActivity);
        objc_storeStrong((id *)(a1 + 56), v41);
        if (!PBReaderPlaceMark() || (HDCodableWorkoutActivityReadFrom((uint64_t)v41, a2) & 1) == 0)
          goto LABEL_73;
        goto LABEL_52;
      case 8u:
        v41 = objc_alloc_init(HDCodableWorkoutEvent);
        objc_msgSend((id)a1, "addEvents:", v41);
        if (PBReaderPlaceMark() && (HDCodableWorkoutEventReadFrom((uint64_t)v41, a2) & 1) != 0)
        {
LABEL_52:
          PBReaderRecallMark();

LABEL_71:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_73:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_71;
    }
  }
}

void sub_1B7EB3C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EB40E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1B7EB4288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  void *v22;
  void *v23;
  void *v24;

  _Unwind_Resume(a1);
}

void sub_1B7EB467C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  std::deque<HDQuantitySampleAttenuationEngineSample>::~deque[abi:ne180100](&a43);
  _Unwind_Resume(a1);
}

__n128 std::deque<HDQuantitySampleAttenuationEngineSample>::push_back(_QWORD *a1, uint64_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *i;
  char *v28;
  __int128 v29;
  unint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  _QWORD *v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  __n128 result;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  int64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  _QWORD *v65;

  v4 = (char *)a1[1];
  v5 = (char *)a1[2];
  v6 = (v5 - v4) >> 3;
  if (v5 == v4)
    v7 = 0;
  else
    v7 = 102 * v6 - 1;
  v8 = a1[4];
  v9 = a1[5] + v8;
  if (v7 == v9)
  {
    if (v8 < 0x66)
    {
      v23 = (char *)a1[3];
      v24 = (uint64_t)&v23[-*a1];
      if (v6 >= v24 >> 3)
      {
        if (v23 == (char *)*a1)
          v25 = 1;
        else
          v25 = v24 >> 2;
        v65 = a1 + 3;
        *(_QWORD *)&v63 = std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v25);
        *((_QWORD *)&v63 + 1) = v63 + 8 * v6;
        *(_QWORD *)&v64 = *((_QWORD *)&v63 + 1);
        *((_QWORD *)&v64 + 1) = v63 + 8 * v26;
        v62 = operator new(0xFF0uLL);
        std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(&v63, &v62);
        for (i = (_QWORD *)a1[2];
              i != (_QWORD *)a1[1];
              std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)&v63, i))
        {
          --i;
        }
        v28 = (char *)*a1;
        v29 = v64;
        *(_OWORD *)a1 = v63;
        *((_OWORD *)a1 + 1) = v29;
        if (v28)
          operator delete(v28);
        goto LABEL_36;
      }
      if (v23 != v5)
      {
        *(_QWORD *)&v63 = operator new(0xFF0uLL);
        std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &v63);
LABEL_36:
        v4 = (char *)a1[1];
        v9 = a1[5] + a1[4];
        goto LABEL_37;
      }
      *(_QWORD *)&v63 = operator new(0xFF0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &v63);
      v41 = (_QWORD *)a1[1];
      v5 = (char *)a1[2];
      v43 = *v41;
      v42 = (char *)(v41 + 1);
      v11 = v43;
      a1[1] = v42;
      if (v5 == (char *)a1[3])
      {
        v47 = (uint64_t)&v42[-*a1];
        if ((unint64_t)v42 > *a1)
        {
          v48 = v47 >> 3;
          v15 = v47 >> 3 < -1;
          v49 = (v47 >> 3) + 2;
          if (v15)
            v50 = v49;
          else
            v50 = v48 + 1;
          v51 = -(v50 >> 1);
          v52 = v50 >> 1;
          v53 = &v42[-8 * v52];
          v54 = v5 - v42;
          if (v5 != v42)
          {
            memmove(&v42[-8 * v52], v42, v5 - v42);
            v42 = (char *)a1[1];
          }
          v5 = &v53[v54];
          v22 = &v42[8 * v51];
          goto LABEL_14;
        }
        if (v5 == (char *)*a1)
          v55 = 1;
        else
          v55 = (uint64_t)&v5[-*a1] >> 2;
        v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v55);
        v32 = &v31[8 * (v55 >> 2)];
        v34 = &v31[8 * v56];
        v57 = (uint64_t *)a1[1];
        v5 = v32;
        v58 = a1[2] - (_QWORD)v57;
        if (v58)
        {
          v5 = &v32[v58 & 0xFFFFFFFFFFFFFFF8];
          v59 = 8 * (v58 >> 3);
          v60 = &v31[8 * (v55 >> 2)];
          do
          {
            v61 = *v57++;
            *(_QWORD *)v60 = v61;
            v60 += 8;
            v59 -= 8;
          }
          while (v59);
        }
LABEL_32:
        v40 = (char *)*a1;
        *a1 = v31;
        a1[1] = v32;
        a1[2] = v5;
        a1[3] = v34;
        if (v40)
        {
          operator delete(v40);
          v5 = (char *)a1[2];
        }
      }
    }
    else
    {
      a1[4] = v8 - 102;
      v12 = *(_QWORD *)v4;
      v10 = v4 + 8;
      v11 = v12;
      a1[1] = v10;
      if (v5 == (char *)a1[3])
      {
        v13 = (uint64_t)&v10[-*a1];
        if ((unint64_t)v10 > *a1)
        {
          v14 = v13 >> 3;
          v15 = v13 >> 3 < -1;
          v16 = (v13 >> 3) + 2;
          if (v15)
            v17 = v16;
          else
            v17 = v14 + 1;
          v18 = -(v17 >> 1);
          v19 = v17 >> 1;
          v20 = &v10[-8 * v19];
          v21 = v5 - v10;
          if (v5 != v10)
          {
            memmove(&v10[-8 * v19], v10, v5 - v10);
            v5 = (char *)a1[1];
          }
          v22 = &v5[8 * v18];
          v5 = &v20[v21];
LABEL_14:
          a1[1] = v22;
          a1[2] = v5;
          goto LABEL_35;
        }
        if (v5 == (char *)*a1)
          v30 = 1;
        else
          v30 = (uint64_t)&v5[-*a1] >> 2;
        v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v30);
        v32 = &v31[8 * (v30 >> 2)];
        v34 = &v31[8 * v33];
        v35 = (uint64_t *)a1[1];
        v5 = v32;
        v36 = a1[2] - (_QWORD)v35;
        if (v36)
        {
          v5 = &v32[v36 & 0xFFFFFFFFFFFFFFF8];
          v37 = 8 * (v36 >> 3);
          v38 = &v31[8 * (v30 >> 2)];
          do
          {
            v39 = *v35++;
            *(_QWORD *)v38 = v39;
            v38 += 8;
            v37 -= 8;
          }
          while (v37);
        }
        goto LABEL_32;
      }
    }
LABEL_35:
    *(_QWORD *)v5 = v11;
    a1[2] += 8;
    goto LABEL_36;
  }
LABEL_37:
  v44 = *(_QWORD *)&v4[8 * (v9 / 0x66)] + 40 * (v9 % 0x66);
  result = *(__n128 *)a2;
  v46 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(v44 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)v44 = result;
  *(_OWORD *)(v44 + 16) = v46;
  ++a1[5];
  return result;
}

void sub_1B7EB4A24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p)
{
  void *v11;

  operator delete(v11);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_1B7EB4D10(_Unwind_Exception *a1)
{
  _QWORD *v1;

  std::deque<HDQuantitySampleAttenuationEngineSample>::~deque[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_1B7EB4FE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__split_buffer<std::__thread_id *>::~__split_buffer(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::deque<HDQuantitySampleAttenuationEngineSample>::__append_with_size[abi:ne180100]<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>>(_QWORD *a1, _QWORD *a2, __int128 *a3, unint64_t a4)
{
  uint64_t v4;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  int64_t v36;
  char *v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  _QWORD *v48;
  char *v49;
  char *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  unint64_t v57;
  char *v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  _QWORD *v65;
  char *v66;
  __int128 v67;
  uint64_t i;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  int64_t v80;
  char *v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  char *v91;
  char *v92;
  unint64_t v93;
  _QWORD *result;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  unint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 *v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  __int128 v106;
  __int128 v107;
  _QWORD *v108;

  v4 = a4;
  v9 = (char *)a1[1];
  v8 = (char *)a1[2];
  v10 = (v8 - v9) >> 3;
  if (v8 == v9)
    v11 = 0;
  else
    v11 = 102 * v10 - 1;
  v12 = a1[4];
  v13 = a1[5];
  v14 = v13 + v12;
  v15 = v11 - (v13 + v12);
  v16 = a4 >= v15;
  v17 = a4 - v15;
  if (v17 != 0 && v16)
  {
    if (v8 == v9)
      v18 = v17 + 1;
    else
      v18 = v17;
    if (v18 % 0x66)
      v19 = v18 / 0x66 + 1;
    else
      v19 = v18 / 0x66;
    if (v19 >= v12 / 0x66)
      v20 = v12 / 0x66;
    else
      v20 = v19;
    if (v19 <= v12 / 0x66)
    {
      for (a1[4] = v12 - 102 * v20; v20; --v20)
      {
        v26 = (_QWORD *)a1[1];
        v29 = *v26;
        v27 = (char *)(v26 + 1);
        v28 = v29;
        a1[1] = v27;
        if (v8 == (char *)a1[3])
        {
          v30 = (uint64_t)&v27[-*a1];
          if ((unint64_t)v27 <= *a1)
          {
            if (v8 == (char *)*a1)
              v38 = 1;
            else
              v38 = (uint64_t)&v8[-*a1] >> 2;
            v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v38);
            v41 = &v39[8 * (v38 >> 2)];
            v42 = (uint64_t *)a1[1];
            v8 = v41;
            v43 = a1[2] - (_QWORD)v42;
            if (v43)
            {
              v8 = &v41[v43 & 0xFFFFFFFFFFFFFFF8];
              v44 = 8 * (v43 >> 3);
              v45 = &v39[8 * (v38 >> 2)];
              do
              {
                v46 = *v42++;
                *(_QWORD *)v45 = v46;
                v45 += 8;
                v44 -= 8;
              }
              while (v44);
            }
            v47 = (char *)*a1;
            *a1 = v39;
            a1[1] = v41;
            a1[2] = v8;
            a1[3] = &v39[8 * v40];
            if (v47)
            {
              operator delete(v47);
              v8 = (char *)a1[2];
            }
          }
          else
          {
            v31 = v30 >> 3;
            v32 = v30 >> 3 < -1;
            v33 = (v30 >> 3) + 2;
            if (v32)
              v34 = v33;
            else
              v34 = v31 + 1;
            v35 = &v27[-8 * (v34 >> 1)];
            v36 = v8 - v27;
            if (v8 != v27)
            {
              memmove(&v27[-8 * (v34 >> 1)], v27, v8 - v27);
              v8 = (char *)a1[1];
            }
            v37 = &v8[-8 * (v34 >> 1)];
            v8 = &v35[v36];
            a1[1] = v37;
            a1[2] = &v35[v36];
          }
        }
        *(_QWORD *)v8 = v28;
        v8 = (char *)(a1[2] + 8);
        a1[2] = v8;
      }
    }
    else
    {
      v21 = v19 - v20;
      v22 = a1[3] - *a1;
      if (v19 - v20 <= (v22 >> 3) - v10)
      {
        if (v21)
        {
          while (a1[3] != a1[2])
          {
            *(_QWORD *)&v106 = operator new(0xFF0uLL);
            std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &v106);
            --v19;
            if (!--v21)
            {
              v8 = (char *)a1[2];
              goto LABEL_79;
            }
          }
          for (i = 0; i != v21; ++i)
          {
            *(_QWORD *)&v106 = operator new(0xFF0uLL);
            std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &v106);
            v8 = (char *)a1[2];
            if (&v8[-a1[1]] == (char *)8)
              v69 = 101;
            else
              v69 = 102;
            v70 = v69 + a1[4];
            a1[4] = v70;
          }
          v20 = v19;
        }
        else
        {
LABEL_79:
          v70 = a1[4];
        }
        for (a1[4] = v70 - 102 * v20; v20; --v20)
        {
          v71 = (_QWORD *)a1[1];
          v74 = *v71;
          v72 = (char *)(v71 + 1);
          v73 = v74;
          a1[1] = v72;
          if (v8 == (char *)a1[3])
          {
            v75 = (uint64_t)&v72[-*a1];
            if ((unint64_t)v72 <= *a1)
            {
              if (v8 == (char *)*a1)
                v82 = 1;
              else
                v82 = (uint64_t)&v8[-*a1] >> 2;
              v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v82);
              v85 = &v83[8 * (v82 >> 2)];
              v86 = (uint64_t *)a1[1];
              v8 = v85;
              v87 = a1[2] - (_QWORD)v86;
              if (v87)
              {
                v8 = &v85[v87 & 0xFFFFFFFFFFFFFFF8];
                v88 = 8 * (v87 >> 3);
                v89 = &v83[8 * (v82 >> 2)];
                do
                {
                  v90 = *v86++;
                  *(_QWORD *)v89 = v90;
                  v89 += 8;
                  v88 -= 8;
                }
                while (v88);
              }
              v91 = (char *)*a1;
              *a1 = v83;
              a1[1] = v85;
              a1[2] = v8;
              a1[3] = &v83[8 * v84];
              if (v91)
              {
                operator delete(v91);
                v8 = (char *)a1[2];
              }
            }
            else
            {
              v76 = v75 >> 3;
              v32 = v75 >> 3 < -1;
              v77 = (v75 >> 3) + 2;
              if (v32)
                v78 = v77;
              else
                v78 = v76 + 1;
              v79 = &v72[-8 * (v78 >> 1)];
              v80 = v8 - v72;
              if (v8 != v72)
              {
                memmove(&v72[-8 * (v78 >> 1)], v72, v8 - v72);
                v8 = (char *)a1[1];
              }
              v81 = &v8[-8 * (v78 >> 1)];
              v8 = &v79[v80];
              a1[1] = v81;
              a1[2] = &v79[v80];
            }
          }
          *(_QWORD *)v8 = v73;
          v8 = (char *)(a1[2] + 8);
          a1[2] = v8;
        }
      }
      else
      {
        if (v22 >> 2 <= v21 + v10)
          v23 = v21 + v10;
        else
          v23 = v22 >> 2;
        v24 = v10 - v20;
        v108 = a1 + 3;
        if (v23)
          v23 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v23);
        else
          v25 = 0;
        *(_QWORD *)&v106 = v23;
        *((_QWORD *)&v106 + 1) = v23 + 8 * v24;
        *(_QWORD *)&v107 = *((_QWORD *)&v106 + 1);
        *((_QWORD *)&v107 + 1) = v23 + 8 * v25;
        do
        {
          v105 = operator new(0xFF0uLL);
          std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(&v106, &v105);
          --v21;
        }
        while (v21);
        v103 = -102 * v20;
        v104 = v4;
        if (v20)
        {
          v48 = (_QWORD *)a1[1];
          v49 = (char *)v107;
          do
          {
            if (v49 == *((char **)&v107 + 1))
            {
              v50 = (char *)*((_QWORD *)&v106 + 1);
              v51 = (void *)v106;
              if (*((_QWORD *)&v106 + 1) <= (unint64_t)v106)
              {
                if (v49 == (char *)v106)
                  v57 = 1;
                else
                  v57 = (uint64_t)&v49[-v106] >> 2;
                v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry,std::default_delete<health::TransactionalCache<unsigned long long,health::FilePage>::CacheEntry>>>>(v57);
                v61 = v49 - v50;
                v60 = v49 == v50;
                v49 = &v58[8 * (v57 >> 2)];
                if (!v60)
                {
                  v49 = &v58[8 * (v57 >> 2) + (v61 & 0xFFFFFFFFFFFFFFF8)];
                  v62 = 8 * (v61 >> 3);
                  v63 = &v58[8 * (v57 >> 2)];
                  do
                  {
                    v64 = *(_QWORD *)v50;
                    v50 += 8;
                    *(_QWORD *)v63 = v64;
                    v63 += 8;
                    v62 -= 8;
                  }
                  while (v62);
                }
                *(_QWORD *)&v106 = v58;
                *((_QWORD *)&v106 + 1) = &v58[8 * (v57 >> 2)];
                *(_QWORD *)&v107 = v49;
                *((_QWORD *)&v107 + 1) = &v58[8 * v59];
                if (v51)
                  operator delete(v51);
              }
              else
              {
                v52 = (uint64_t)(*((_QWORD *)&v106 + 1) - v106) >> 3;
                if (v52 >= -1)
                  v53 = v52 + 1;
                else
                  v53 = v52 + 2;
                v54 = *((_QWORD *)&v106 + 1) - 8 * (v53 >> 1);
                v55 = &v49[-*((_QWORD *)&v106 + 1)];
                if (v49 != *((char **)&v106 + 1))
                {
                  memmove((void *)(*((_QWORD *)&v106 + 1) - 8 * (v53 >> 1)), *((const void **)&v106 + 1), (size_t)&v49[-*((_QWORD *)&v106 + 1)]);
                  v49 = v50;
                }
                v56 = &v49[-8 * (v53 >> 1)];
                v49 = &v55[v54];
                *((_QWORD *)&v106 + 1) = v56;
                *(_QWORD *)&v107 = &v55[v54];
              }
            }
            *(_QWORD *)v49 = *v48;
            v49 = (char *)(v107 + 8);
            *(_QWORD *)&v107 = v107 + 8;
            v48 = (_QWORD *)(a1[1] + 8);
            a1[1] = v48;
            --v20;
          }
          while (v20);
        }
        v65 = (_QWORD *)a1[2];
        v4 = v104;
        while (v65 != (_QWORD *)a1[1])
          std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)&v106, --v65);
        v66 = (char *)*a1;
        v67 = v107;
        *(_OWORD *)a1 = v106;
        *((_OWORD *)a1 + 1) = v67;
        a1[4] += v103;
        if (v66)
        {
          operator delete(v66);
          v8 = (char *)a1[2];
        }
        else
        {
          v8 = (char *)v67;
        }
      }
    }
    v13 = a1[5];
    v9 = (char *)a1[1];
    v14 = a1[4] + v13;
  }
  v92 = &v9[8 * (v14 / 0x66)];
  if (v8 == v9)
    v93 = 0;
  else
    v93 = *(_QWORD *)v92 + 40 * (v14 % 0x66);
  *(_QWORD *)&v106 = &v9[8 * (v14 / 0x66)];
  *((_QWORD *)&v106 + 1) = v93;
  result = std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>::operator+=[abi:ne180100](&v106, v4);
  v95 = *((_QWORD *)&v106 + 1);
  if (v93 != *((_QWORD *)&v106 + 1))
  {
    v96 = (char *)v106;
    do
    {
      if (v92 == v96)
        v97 = v95;
      else
        v97 = *(_QWORD *)v92 + 4080;
      if (v93 == v97)
      {
        v97 = v93;
      }
      else
      {
        v98 = v93;
        do
        {
          v99 = *a3;
          v100 = a3[1];
          *(_QWORD *)(v98 + 32) = *((_QWORD *)a3 + 4);
          *(_OWORD *)v98 = v99;
          *(_OWORD *)(v98 + 16) = v100;
          a3 = (__int128 *)((char *)a3 + 40);
          if ((__int128 *)((char *)a3 - *a2) == (__int128 *)4080)
          {
            v101 = (__int128 *)a2[1];
            ++a2;
            a3 = v101;
          }
          v98 += 40;
        }
        while (v98 != v97);
        v13 = a1[5];
      }
      v13 -= 0x3333333333333333 * ((uint64_t)(v97 - v93) >> 3);
      a1[5] = v13;
      if (v92 == v96)
        break;
      v102 = *((_QWORD *)v92 + 1);
      v92 += 8;
      v93 = v102;
    }
    while (v102 != v95);
  }
  return result;
}

void sub_1B7EB5A4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>::operator+=[abi:ne180100](_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;

  if (a2)
  {
    v2 = (_QWORD *)*result;
    v3 = a2 - 0x3333333333333333 * ((uint64_t)(result[1] - *(_QWORD *)*result) >> 3);
    if ((uint64_t)v3 < 1)
    {
      v5 = 101 - v3;
      v6 = &v2[-(v5 / 0x66)];
      *result = v6;
      v4 = *v6 + 40 * (102 * (v5 / 0x66) - v5) + 4040;
    }
    else
    {
      *result = &v2[v3 / 0x66];
      v4 = v2[v3 / 0x66] + 40 * (v3 % 0x66);
    }
    result[1] = v4;
  }
  return result;
}

double std::__for_each_segment[abi:ne180100]<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>,std::__copy_loop<std::_ClassicAlgPolicy>::_CopySegment<std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample const*,HDQuantitySampleAttenuationEngineSample const&,HDQuantitySampleAttenuationEngineSample const* const*,long,102l>,std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>>>(uint64_t *a1, _BYTE *a2, uint64_t *a3, _BYTE *a4, uint64_t a5)
{
  void ***v5;
  void **v7;
  char *v8;
  uint64_t *v9;
  uint64_t *v10;
  void **v11;
  void **v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  int64_t v17;
  unint64_t v18;
  char *v19;
  _BYTE *v20;
  double result;
  _BYTE *v22;
  uint64_t *v23;
  void ***v24;
  uint64_t v25;
  __int128 v26;

  v5 = (void ***)a5;
  v7 = *(void ***)a5;
  v8 = *(char **)(a5 + 8);
  if (a1 == a3)
  {
    v20 = a4;
  }
  else
  {
    v9 = a3;
    v10 = a1 + 1;
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<HDQuantitySampleAttenuationEngineSample const*,std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>,0>(&v25, a2, (_BYTE *)(*a1 + 4080), v7, v8);
    v12 = (void **)*((_QWORD *)&v26 + 1);
    v11 = (void **)v26;
    *v5 = (void **)v26;
    v5[1] = v12;
    if (v10 != v9)
    {
      v22 = a4;
      v23 = v9;
      v24 = v5;
      do
      {
        v13 = 0;
        v14 = *v10;
        v16 = (char *)*v11++;
        v15 = v16;
        while (1)
        {
          v17 = 0xCCCCCCCCCCCCCCCDLL * ((v15 - (char *)v12 + 4080) >> 3);
          if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((4080 - 40 * v13) >> 3)) >= v17)
            v18 = v17;
          else
            v18 = 0xCCCCCCCCCCCCCCCDLL * ((4080 - 40 * v13) >> 3);
          if (v18)
            memmove(v12, (const void *)(v14 + 40 * v13), 40 * v18);
          v13 += v18;
          if (v13 == 102)
            break;
          v19 = (char *)*v11++;
          v15 = v19;
          v12 = (void **)v19;
        }
        v12 += 5 * v18;
        if ((char *)*(v11 - 1) + 4080 == (char *)v12)
          v12 = (void **)*v11;
        else
          --v11;
        v9 = v23;
        v5 = v24;
        *v24 = v11;
        v24[1] = v12;
        ++v10;
      }
      while (v10 != v23);
      a4 = v22;
    }
    a2 = (_BYTE *)*v9;
    v20 = a4;
    v7 = v11;
    v8 = (char *)v12;
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<HDQuantitySampleAttenuationEngineSample const*,std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>,0>(&v25, a2, v20, v7, v8);
  result = *(double *)&v26;
  *(_OWORD *)v5 = v26;
  return result;
}

_QWORD *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<HDQuantitySampleAttenuationEngineSample const*,std::__deque_iterator<HDQuantitySampleAttenuationEngineSample,HDQuantitySampleAttenuationEngineSample*,HDQuantitySampleAttenuationEngineSample&,HDQuantitySampleAttenuationEngineSample**,long,102l>,0>(_QWORD *result, _BYTE *__src, _BYTE *a3, void **a4, char *__dst)
{
  void **v6;
  _BYTE *v7;
  _QWORD *v8;
  _BYTE *v9;
  char *v10;
  int64_t v11;
  unint64_t v12;
  char *v13;

  v6 = a4;
  v7 = __src;
  v8 = result;
  if (__src == a3)
  {
    v9 = __src;
  }
  else
  {
    v9 = a3;
    v6 = a4 + 1;
    v10 = (char *)*a4;
    while (1)
    {
      v11 = 0xCCCCCCCCCCCCCCCDLL * ((v10 - __dst + 4080) >> 3);
      v12 = (uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((v9 - v7) >> 3)) >= v11 ? v11 : 0xCCCCCCCCCCCCCCCDLL * ((v9 - v7) >> 3);
      if (v12)
        result = memmove(__dst, v7, 40 * v12);
      v7 += 40 * v12;
      if (v7 == v9)
        break;
      v13 = (char *)*v6++;
      v10 = v13;
      __dst = v13;
    }
    __dst += 40 * v12;
    if ((char *)*(v6 - 1) + 4080 == __dst)
      __dst = (char *)*v6;
    else
      --v6;
  }
  *v8 = v9;
  v8[1] = v6;
  v8[2] = __dst;
  return result;
}

uint64_t std::deque<HDQuantitySampleAttenuationEngineSample>::~deque[abi:ne180100](_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  a1[5] = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 51;
  }
  else
  {
    if (v5 != 2)
      goto LABEL_9;
    v6 = 102;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<std::__thread_id *>::~__split_buffer((uint64_t)a1);
}

void sub_1B7EB67B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__201(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id HDAttachmentReferencePredicateForUnsynchronizedReferences()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("type"), &unk_1E6DFE8E8);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("cloud_status"), &unk_1E6DFE8E8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D29840];
  v6[0] = v0;
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateMatchingAllPredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HDAttachmentReferencePredicateForUnsynchronizedTombstones()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("type"), &unk_1E6DFE900);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("cloud_status"), &unk_1E6DFE8E8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D29840];
  v6[0] = v0;
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateMatchingAllPredicates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id HDAttachmentReferencePredicateForObjectAndSchemaIdentifier(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D29838];
  v4 = a2;
  objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("object_identifier"), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("schema_identifier"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D29840];
  v11[0] = v5;
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateMatchingAllPredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t HDAttachmentReferencePredicateForAttachmentIdentifier(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("attachment_identifier"), a1);
}

id HDAttachmentReferencePredicateForNonTombstoneAttachmentIdentifier(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("attachment_identifier"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:notEqualToValue:", CFSTR("type"), &unk_1E6DFE900);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D29840];
  v7[0] = v1;
  v7[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateMatchingAllPredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t HDAttachmentReferencePredicateForReferenceIdentifier(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("identifier"), a1);
}

void sub_1B7EB9DA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B7EB9EE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EB9FA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBA05C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBA16C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBA208(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBA2E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBA39C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBA428(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBAAA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B7EBAC48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBAD3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B7EBADFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBAECC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBAFB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBB078(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBB114(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBB1D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBB2D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBB458(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1B7EBB584(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EBB788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B7EBB9D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1B7EBBE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EBC2A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__202(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__202(uint64_t a1)
{

}

void sub_1B7EBFC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1B7EC04A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__203(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__203(uint64_t a1)
{

}

void sub_1B7EC0D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EC357C(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1B7EC3344);
  }
  _Unwind_Resume(a1);
}

void sub_1B7EC358C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1B7EC35A4(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x1B7EC35B0);
}

void sub_1B7EC3B9C()
{
  objc_end_catch();
  JUMPOUT(0x1B7EC3BA8);
}

void sub_1B7EC5EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EC6610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1B7EC73E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__204(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__204(uint64_t a1)
{

}

BOOL HDCodableObjectAssociationReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  HDCodableSyncIdentity *v20;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
        break;
      if ((_DWORD)v17 == 2)
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 16;
LABEL_26:
        v20 = *(HDCodableSyncIdentity **)(a1 + v19);
        *(_QWORD *)(a1 + v19) = v18;
LABEL_27:

        goto LABEL_29;
      }
      if ((_DWORD)v17 == 1)
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = 8;
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_29:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v20 = objc_alloc_init(HDCodableSyncIdentity);
    objc_storeStrong((id *)(a1 + 24), v20);
    if (!PBReaderPlaceMark() || !HDCodableSyncIdentityReadFrom((uint64_t)v20, a2))
    {

      return 0;
    }
    PBReaderRecallMark();
    goto LABEL_27;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B7EC8380(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;

  if (a2)
  {
    if (a2 == 2)
    {
      v10 = objc_begin_catch(exception_object);
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        v12 = *(_QWORD *)(v9 + 32);
        LODWORD(a9) = 138543618;
        *(_QWORD *)((char *)&a9 + 4) = v10;
        WORD6(a9) = 2112;
        *(_QWORD *)((char *)&a9 + 14) = v12;
        _os_log_fault_impl(&dword_1B7802000, v11, OS_LOG_TYPE_FAULT, "caught exception (%{public}@) attempting to create client object with codable %@", (uint8_t *)&a9, 0x16u);
      }

    }
    else
    {
      objc_begin_catch(exception_object);
    }
    objc_end_catch();
    JUMPOUT(0x1B7EC834CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_1B7ECF53C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x320], 8);
  _Unwind_Resume(a1);
}

void sub_1B7ECFE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__205(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__205(uint64_t a1)
{

}

id HDQuantitySampleStatisticsEntityPredicateForMinValue(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("min");
  v8[1] = CFSTR("quantity");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithCoalescedProperties:value:comparisonType:", v5, v4, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id HDQuantitySampleStatisticsEntityPredicateForMaxValue(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("max");
  v8[1] = CFSTR("quantity");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithCoalescedProperties:value:comparisonType:", v5, v4, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id HDQuantitySampleStatisticsEntityPredicateForMostRecentValue(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("most_recent");
  v8[1] = CFSTR("quantity");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithCoalescedProperties:value:comparisonType:", v5, v4, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id HDQuantitySampleStatisticsEntityPredicateForMostRecentStartDate(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("most_recent_date");
  v8[1] = CFSTR("start_date");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a2;
  objc_msgSend(v3, "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithCoalescedProperties:value:comparisonType:", v5, v4, a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id HDQuantitySampleStatisticsEntityPredicateForMostRecentEndDate(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDQuantitySampleStatisticsEntity, "disambiguatedDatabaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDQuantitySampleStatisticsEntity, "disambiguatedDatabaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLOperatorForComparisonType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(IFNULL((%@.%@ + %@.%@), %@.%@) %@ ?)"), v4, CFSTR("most_recent_date"), v5, CFSTR("most_recent_duration"), v6, CFSTR("end_date"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = CFSTR("most_recent_date");
  v15[1] = CFSTR("most_recent_duration");
  v15[2] = CFSTR("end_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D298B0];
  v14 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithSQL:overProperties:values:", v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id HDQuantitySampleStatisticsEntityPredicateForMostRecentDuration(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDQuantitySampleStatisticsEntity, "disambiguatedDatabaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedDatabaseTable](HDSampleEntity, "disambiguatedDatabaseTable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLOperatorForComparisonType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(IFNULL(%@.%@, (%@.%@ - %@.%@)) %@ ?)"), v4, CFSTR("most_recent_duration"), v5, CFSTR("end_date"), v6, CFSTR("start_date"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = CFSTR("most_recent_duration");
  v15[1] = CFSTR("end_date");
  v15[2] = CFSTR("start_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D298B0];
  v14 = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithSQL:overProperties:values:", v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_1B7ED2394(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *HDStringFromPeriodicActivityResult(unint64_t a1)
{
  if (a1 < 4)
    return off_1E6D10AD8[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown(%ld)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id HDECGEntityPredicateForPrivateClassification(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HDSQLiteValueForNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a2 & 1) != 0)
    objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("private_classification"), v5);
  else
    objc_msgSend(v3, "predicateWithProperty:notEqualToValue:", CFSTR("private_classification"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id HDECGEntityPredicateForPublicClassification(uint64_t a1, int a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  switch(a1)
  {
    case 1:
      v2 = &unk_1E6DFA640;
      if ((a2 & 1) == 0)
        goto LABEL_12;
      goto LABEL_16;
    case 2:
      v2 = &unk_1E6DFA658;
      if ((a2 & 1) != 0)
        goto LABEL_16;
      goto LABEL_12;
    case 3:
      v2 = &unk_1E6DFA670;
      if ((a2 & 1) != 0)
        goto LABEL_16;
      goto LABEL_12;
    case 4:
      v2 = &unk_1E6DFA688;
      if ((a2 & 1) == 0)
        goto LABEL_12;
      goto LABEL_16;
    case 5:
      v2 = &unk_1E6DFA6A0;
      if ((a2 & 1) != 0)
        goto LABEL_16;
      goto LABEL_12;
    case 6:
      v2 = &unk_1E6DFA6B8;
      if ((a2 & 1) == 0)
        goto LABEL_12;
      goto LABEL_16;
    default:
      if (a1 != 100)
      {
        v2 = &unk_1E6DFA628;
        if ((a2 & 1) != 0)
          goto LABEL_16;
LABEL_12:
        if (a1 != 100)
        {
          objc_msgSend(MEMORY[0x1E0D29840], "predicateWithProperty:notEqualToValues:", CFSTR("private_classification"), v2);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          return v5;
        }
LABEL_13:
        v3 = (void *)MEMORY[0x1E0D29840];
        v4 = 4;
        goto LABEL_20;
      }
      v2 = &unk_1E6DFA6D0;
      if (!a2)
        goto LABEL_13;
LABEL_16:
      if (a1 == 100)
        v4 = 5;
      else
        v4 = 1;
      v3 = (void *)MEMORY[0x1E0D29840];
LABEL_20:
      objc_msgSend(v3, "predicateWithProperty:values:comparisonType:", CFSTR("private_classification"), v2, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      return v5;
  }
}

id HDECGEntityPredicateForAverageHeartRate(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0D29838];
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = (void *)MEMORY[0x1E0CB6CD0];
  v6 = a2;
  objc_msgSend(v5, "_countPerMinuteUnit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v7);
  v9 = v8;

  objc_msgSend(v4, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithProperty:value:comparisonType:", CFSTR("average_heart_rate"), v10, a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id HDECGEntityPredicateForSymptomsStatus(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _HDSQLiteValueForNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a2 & 1) != 0)
    objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("symptoms_status"), v5);
  else
    objc_msgSend(v3, "predicateWithProperty:notEqualToValue:", CFSTR("symptoms_status"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_1B7ED5624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__206(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__206(uint64_t a1)
{

}

void sub_1B7ED5B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7ED71BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__207(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1B7ED83E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EDB9B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t HDCodableObjectTypeSourceOrderReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  int *v9;
  int *v10;
  char v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  BOOL v18;
  uint64_t v19;
  int v20;
  int v21;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  void *v38;
  uint64_t result;
  unint64_t *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int *v45;
  int *v46;
  HDCodableSyncIdentity *v47;
  uint64_t v48;
  unint64_t v49;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v6) == 0;
  v8 = &OBJC_IVAR___HDBackgroundObservationServerExtension__sessionUUID;
  v9 = (int *)MEMORY[0x1E0D82BB8];
  v10 = &OBJC_IVAR___HDBackgroundObservationServerExtension__sessionUUID;
  while (2)
  {
    if (*(_BYTE *)(a2 + *v6))
      return *(_BYTE *)(a2 + *v6) == 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    while (1)
    {
      v14 = *v4;
      v15 = *(_QWORD *)(a2 + v14);
      v16 = v15 + 1;
      if (v15 == -1 || v16 > *(_QWORD *)(a2 + *v5))
        break;
      v17 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v15);
      *(_QWORD *)(a2 + v14) = v16;
      v13 |= (unint64_t)(v17 & 0x7F) << v11;
      if ((v17 & 0x80) == 0)
        goto LABEL_12;
      v11 += 7;
      v18 = v12++ >= 9;
      if (v18)
      {
        v13 = 0;
        v19 = *v6;
        v20 = *(unsigned __int8 *)(a2 + v19);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v6) = 1;
LABEL_12:
    v19 = *v6;
    v20 = *(unsigned __int8 *)(a2 + v19);
    if (*(_BYTE *)(a2 + v19))
      v13 = 0;
LABEL_14:
    v21 = v13 & 7;
    if (v20 || v21 == 4)
      return *(_BYTE *)(a2 + *v6) == 0;
    switch((v13 >> 3))
    {
      case 1u:
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + v8[824]) |= 1u;
        while (1)
        {
          v26 = *v4;
          v27 = *(_QWORD *)(a2 + v26);
          v28 = v27 + 1;
          if (v27 == -1 || v28 > *(_QWORD *)(a2 + *v5))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v27);
          *(_QWORD *)(a2 + v26) = v28;
          v25 |= (unint64_t)(v29 & 0x7F) << v23;
          if ((v29 & 0x80) == 0)
            goto LABEL_49;
          v23 += 7;
          v18 = v24++ >= 9;
          if (v18)
          {
            v25 = 0;
            goto LABEL_51;
          }
        }
        *(_BYTE *)(a2 + *v6) = 1;
LABEL_49:
        if (*(_BYTE *)(a2 + *v6))
          v25 = 0;
LABEL_51:
        *(_QWORD *)(a1 + 32) = v25;
        goto LABEL_62;
      case 2u:
        v30 = 0;
        v31 = 0;
        v32 = 0;
        *(_BYTE *)(a1 + v8[824]) |= 2u;
        while (2)
        {
          v33 = *v4;
          v34 = *(_QWORD *)(a2 + v33);
          v35 = v34 + 1;
          if (v34 == -1 || v35 > *(_QWORD *)(a2 + *v5))
          {
            *(_BYTE *)(a2 + *v6) = 1;
          }
          else
          {
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v34);
            *(_QWORD *)(a2 + v33) = v35;
            v32 |= (unint64_t)(v36 & 0x7F) << v30;
            if (v36 < 0)
            {
              v30 += 7;
              v18 = v31++ >= 9;
              if (v18)
              {
                v32 = 0;
                goto LABEL_55;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v6))
          v32 = 0;
LABEL_55:
        *(_BYTE *)(a1 + 56) = v32 != 0;
        goto LABEL_62;
      case 3u:
        PBReaderReadData();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v37;

        goto LABEL_62;
      case 4u:
        if (v21 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (1)
          {
            v40 = (unint64_t *)(a2 + *v4);
            v41 = *v40;
            v42 = *(_QWORD *)(a2 + *v5);
            if (*v40 >= v42)
              break;
            v43 = *v6;
            if (*(_BYTE *)(a2 + v43))
              break;
            if (v41 > 0xFFFFFFFFFFFFFFF7 || v41 + 8 > v42)
              *(_BYTE *)(a2 + v43) = 1;
            else
              *v40 = v41 + 8;
            PBRepeatedDoubleAdd();
          }
          PBReaderRecallMark();
        }
        else
        {
          v48 = *v4;
          v49 = *(_QWORD *)(a2 + v48);
          if (v49 <= 0xFFFFFFFFFFFFFFF7 && v49 + 8 <= *(_QWORD *)(a2 + *v5))
            *(_QWORD *)(a2 + v48) = v49 + 8;
          else
            *(_BYTE *)(a2 + v19) = 1;
          PBRepeatedDoubleAdd();
        }
        goto LABEL_62;
      case 5u:
        v44 = v2;
        v45 = v10;
        v46 = v8;
        v47 = objc_alloc_init(HDCodableSyncIdentity);
        objc_storeStrong((id *)(a1 + 48), v47);
        if (PBReaderPlaceMark() && HDCodableSyncIdentityReadFrom((uint64_t)v47, a2))
        {
          PBReaderRecallMark();

          v8 = v46;
          v10 = v45;
          v2 = v44;
LABEL_62:
          if (*(_QWORD *)(a2 + *v4) >= *(_QWORD *)(a2 + *v5))
            return *(_BYTE *)(a2 + *v6) == 0;
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_62;
    }
  }
}

void sub_1B7EDDDF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B7EDDF68(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B7EDE200(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B7EDE32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EDE5B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B7EDE930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, ...)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  va_list va;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  va_list va1;

  va_start(va1, a12);
  va_start(va, a12);
  v17 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  v20 = va_arg(va1, _QWORD);
  v21 = va_arg(va1, _QWORD);

  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);

  _Unwind_Resume(a1);
}

void sub_1B7EDEDE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);

  _Unwind_Resume(a1);
}

void sub_1B7EDF0D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;

  _Unwind_Resume(a1);
}

void sub_1B7EDF724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

void sub_1B7EDFEC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1B7EE017C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B7EE02FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::__hash_table<long,std::hash<long>,std::equal_to<long>,std::allocator<long>>::__erase_unique<long>(_QWORD *a1, unint64_t a2)
{
  int8x8_t v2;
  uint8x8_t v3;
  unint64_t v4;
  _QWORD **v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return;
  v3 = (uint8x8_t)vcnt_s8(v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    v4 = a2;
    if (*(_QWORD *)&v2 <= a2)
      v4 = a2 % *(_QWORD *)&v2;
  }
  else
  {
    v4 = (*(_QWORD *)&v2 - 1) & a2;
  }
  v5 = *(_QWORD ***)(*a1 + 8 * v4);
  if (!v5)
    return;
  v6 = *v5;
  if (!v6)
    return;
  v7 = *(_QWORD *)&v2 - 1;
  while (1)
  {
    v8 = v6[1];
    if (v8 == a2)
      break;
    if (v3.u32[0] > 1uLL)
    {
      if (v8 >= *(_QWORD *)&v2)
        v8 %= *(_QWORD *)&v2;
    }
    else
    {
      v8 &= v7;
    }
    if (v8 != v4)
      return;
LABEL_17:
    v6 = (_QWORD *)*v6;
    if (!v6)
      return;
  }
  if (v6[2] != a2)
    goto LABEL_17;
  v9 = (_QWORD *)*v6;
  if (v3.u32[0] > 1uLL)
  {
    if (v8 >= *(_QWORD *)&v2)
      v8 %= *(_QWORD *)&v2;
  }
  else
  {
    v8 &= v7;
  }
  v10 = *(_QWORD **)(*a1 + 8 * v8);
  do
  {
    v11 = v10;
    v10 = (_QWORD *)*v10;
  }
  while (v10 != v6);
  if (v11 == a1 + 2)
    goto LABEL_36;
  v12 = v11[1];
  if (v3.u32[0] > 1uLL)
  {
    if (v12 >= *(_QWORD *)&v2)
      v12 %= *(_QWORD *)&v2;
  }
  else
  {
    v12 &= v7;
  }
  if (v12 == v8)
  {
LABEL_38:
    if (v9)
    {
      v13 = v9[1];
      goto LABEL_40;
    }
  }
  else
  {
LABEL_36:
    if (!v9)
      goto LABEL_37;
    v13 = v9[1];
    if (v3.u32[0] > 1uLL)
    {
      v14 = v9[1];
      if (v13 >= *(_QWORD *)&v2)
        v14 = v13 % *(_QWORD *)&v2;
    }
    else
    {
      v14 = v13 & v7;
    }
    if (v14 != v8)
    {
LABEL_37:
      *(_QWORD *)(*a1 + 8 * v8) = 0;
      v9 = (_QWORD *)*v6;
      goto LABEL_38;
    }
LABEL_40:
    if (v3.u32[0] > 1uLL)
    {
      if (v13 >= *(_QWORD *)&v2)
        v13 %= *(_QWORD *)&v2;
    }
    else
    {
      v13 &= v7;
    }
    if (v13 != v8)
    {
      *(_QWORD *)(*a1 + 8 * v13) = v11;
      v9 = (_QWORD *)*v6;
    }
  }
  *v11 = v9;
  *v6 = 0;
  --a1[3];
  operator delete(v6);
}

void sub_1B7EE133C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t HDCodableMedicalUserDomainConceptReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v16;
  uint64_t v18;
  void *v19;
  uint64_t result;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      v16 = v10 & 7;
      if (v15 || v16 == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        if (v16 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v21 = 0;
            v22 = 0;
            v23 = 0;
            while (1)
            {
              v24 = *v3;
              v25 = *(_QWORD *)(a2 + v24);
              if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
                break;
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
              *(_QWORD *)(a2 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                v14 = v22++ >= 9;
                if (!v14)
                  continue;
              }
              goto LABEL_33;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_33:
            PBRepeatedInt64Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v27 = 0;
          v28 = 0;
          v29 = 0;
          while (1)
          {
            v30 = *v3;
            v31 = *(_QWORD *)(a2 + v30);
            if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
              break;
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              v14 = v28++ >= 9;
              if (!v14)
                continue;
            }
            goto LABEL_45;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
          PBRepeatedInt64Add();
        }
      }
      else if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v18;

      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_1B7EE44BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__208(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__208(uint64_t a1)
{

}

void sub_1B7EE5278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EE5B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EE6CA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

void sub_1B7EE6E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EE758C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__209(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__209(uint64_t a1)
{

}

id HDCachedQueryMetadataEntityAllProperties()
{
  _QWORD v1[12];

  v1[11] = *MEMORY[0x1E0C80C00];
  v1[0] = CFSTR("query_identifier");
  v1[1] = CFSTR("source_id");
  v1[2] = CFSTR("generation_number");
  v1[3] = CFSTR("max_anchor");
  v1[4] = CFSTR("last_query_start_index");
  v1[5] = CFSTR("last_query_end_index");
  v1[6] = CFSTR("last_updated_date");
  v1[7] = CFSTR("creation_date");
  v1[8] = CFSTR("build_version");
  v1[9] = CFSTR("anchor_date");
  v1[10] = CFSTR("interval_components");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1B7EEAFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HDCachedQueryMetadataEntityPredicateForQueryIdentifierAndSource(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D29838];
  v4 = a2;
  objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("query_identifier"), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D29838];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v4, "persistentID");

  objc_msgSend(v7, "numberWithLongLong:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithProperty:equalToValue:", CFSTR("source_id"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D29840];
  v15[0] = v5;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateMatchingAllPredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __Block_byref_object_copy__210(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__210(uint64_t a1)
{

}

void sub_1B7EEB53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EEB738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EEBA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HDCodableTinkerOptInResponseReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  HDCodableError *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = objc_alloc_init(HDCodableError);
        objc_storeStrong((id *)(a1 + 8), v20);
        if (!PBReaderPlaceMark() || (HDCodableErrorReadFrom((uint64_t)v20, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 2)
      {
        v21 = 0;
        v22 = 0;
        v23 = 0;
        *(_BYTE *)(a1 + 28) |= 1u;
        while (1)
        {
          v24 = *v3;
          v25 = *(_QWORD *)(a2 + v24);
          if (v25 == -1 || v25 >= *(_QWORD *)(a2 + *v4))
            break;
          v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v25);
          *(_QWORD *)(a2 + v24) = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0)
            goto LABEL_35;
          v21 += 7;
          v14 = v22++ >= 9;
          if (v14)
          {
            v23 = 0;
            goto LABEL_37;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
        if (*(_BYTE *)(a2 + *v5))
          v23 = 0;
LABEL_37:
        *(_BYTE *)(a1 + 24) = v23 != 0;
      }
      else if ((_DWORD)v17 == 1)
      {
        PBReaderReadString();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = v18;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id HDQuantitySampleEntityPredicateForQuantity(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D29838];
  _HDSQLiteValueForNumber();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithProperty:value:comparisonType:", CFSTR("quantity"), v3, a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t HDQuantitySampleEntityPredicateForCount(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:ifNullValue:value:comparisonType:", CFSTR("count"), &unk_1E6DFEAE0, a2, a1);
}

void sub_1B7EEF5A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__211(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__211(uint64_t a1)
{

}

void sub_1B7EF0660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EF2200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a71;
  uint64_t v71;

  _Block_object_dispose((const void *)(v71 - 152), 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EF33D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EF4BC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B7EF6324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B7EF6938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  uint64_t v44;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 216), 8);
  _Block_object_dispose((const void *)(v44 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__212(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__212(uint64_t a1)
{

}

void sub_1B7EF8478(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

void sub_1B7EF918C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1B7EF9B9C()
{
  return MEMORY[0x1E0CAE568]();
}

uint64_t sub_1B7EF9BA8()
{
  return MEMORY[0x1E0CAE590]();
}

uint64_t sub_1B7EF9BB4()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1B7EF9BC0()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1B7EF9BCC()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1B7EF9BD8()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1B7EF9BE4()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1B7EF9BF0()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1B7EF9BFC()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1B7EF9C08()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1B7EF9C14()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1B7EF9C20()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1B7EF9C2C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1B7EF9C38()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1B7EF9C44()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1B7EF9C50()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1B7EF9C5C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1B7EF9C68()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1B7EF9C74()
{
  return MEMORY[0x1E0CB4480]();
}

uint64_t sub_1B7EF9C80()
{
  return MEMORY[0x1E0CB4488]();
}

uint64_t sub_1B7EF9C8C()
{
  return MEMORY[0x1E0CB4490]();
}

uint64_t sub_1B7EF9C98()
{
  return MEMORY[0x1E0CB4498]();
}

uint64_t sub_1B7EF9CA4()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1B7EF9CB0()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1B7EF9CBC()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1B7EF9CC8()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1B7EF9CD4()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1B7EF9CE0()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1B7EF9CEC()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1B7EF9CF8()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1B7EF9D04()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1B7EF9D10()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1B7EF9D1C()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1B7EF9D28()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1B7EF9D34()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1B7EF9D40()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1B7EF9D4C()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1B7EF9D58()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1B7EF9D64()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1B7EF9D70()
{
  return MEMORY[0x1E0CB4540]();
}

uint64_t sub_1B7EF9D7C()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1B7EF9D88()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1B7EF9D94()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1B7EF9DA0()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1B7EF9DAC()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1B7EF9DB8()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1B7EF9DC4()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1B7EF9DD0()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1B7EF9DDC()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1B7EF9DE8()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1B7EF9DF4()
{
  return MEMORY[0x1E0DEC518]();
}

uint64_t sub_1B7EF9E00()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1B7EF9E0C()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1B7EF9E18()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1B7EF9E24()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1B7EF9E30()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1B7EF9E3C()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1B7EF9E48()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1B7EF9E54()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1B7EF9E60()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1B7EF9E6C()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1B7EF9E78()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1B7EF9E84()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1B7EF9E90()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1B7EF9E9C()
{
  return MEMORY[0x1E0DECD58]();
}

uint64_t sub_1B7EF9EA8()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1B7EF9EB4()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1B7EF9EC0()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1B7EF9ECC()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1B7EF9ED8()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1B7EF9EE4()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1B7EF9EF0()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1B7EF9EFC()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1B7EF9F08()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1B7EF9F14()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1B7EF9F20()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1B7EF9F2C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1B7EF9F38()
{
  return MEMORY[0x1E0DEE978]();
}

int AAByteStreamClose(AAByteStream s)
{
  return MEMORY[0x1E0DDE3B0](s);
}

ssize_t AAByteStreamPRead(AAByteStream s, void *buf, size_t nbyte, off_t offset)
{
  return MEMORY[0x1E0DDE3C0](s, buf, nbyte, offset);
}

ssize_t AAByteStreamWrite(AAByteStream s, const void *buf, size_t nbyte)
{
  return MEMORY[0x1E0DDE3C8](s, buf, nbyte);
}

AAByteStream AAFileStreamOpenWithFD(int fd, int automatic_close)
{
  return (AAByteStream)MEMORY[0x1E0DDE448](*(_QWORD *)&fd, *(_QWORD *)&automatic_close);
}

CFArrayRef ABAddressBookCopyPeopleWithName(ABAddressBookRef addressBook, CFStringRef name)
{
  return (CFArrayRef)MEMORY[0x1E0C90278](addressBook, name);
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  return (ABAddressBookRef)MEMORY[0x1E0C90280](options, error);
}

ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  return (ABRecordRef)MEMORY[0x1E0C90288](addressBook, *(_QWORD *)&recordID);
}

CFTypeRef ABMultiValueCopyValueAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return (CFTypeRef)MEMORY[0x1E0C90290](multiValue, index);
}

CFIndex ABMultiValueGetCount(ABMultiValueRef multiValue)
{
  return MEMORY[0x1E0C90298](multiValue);
}

ABMultiValueIdentifier ABMultiValueGetIdentifierAtIndex(ABMultiValueRef multiValue, CFIndex index)
{
  return MEMORY[0x1E0C902A0](multiValue, index);
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  return (CFTypeRef)MEMORY[0x1E0C902B0](record, *(_QWORD *)&property);
}

ABRecordID ABRecordGetRecordID(ABRecordRef record)
{
  return MEMORY[0x1E0C902B8](record);
}

AEAContext AEAContextCreateWithEncryptedStream(AAByteStream encrypted_stream)
{
  return (AEAContext)MEMORY[0x1E0DDE508](encrypted_stream);
}

AEAContext AEAContextCreateWithProfile(AEAProfile profile)
{
  return (AEAContext)MEMORY[0x1E0DDE510](*(_QWORD *)&profile);
}

void AEAContextDestroy(AEAContext context)
{
  MEMORY[0x1E0DDE518](context);
}

int AEAContextSetFieldBlob(AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, const uint8_t *buf, size_t buf_size)
{
  return MEMORY[0x1E0DDE528](context, *(_QWORD *)&field, *(_QWORD *)&representation, buf, buf_size);
}

int AEAContextSetFieldUInt(AEAContext context, AEAContextField field, uint64_t value)
{
  return MEMORY[0x1E0DDE530](context, *(_QWORD *)&field, value);
}

AAByteStream AEADecryptionRandomAccessInputStreamOpen(AAByteStream encrypted_stream, AEAContext context, size_t alloc_limit, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x1E0DDE540](encrypted_stream, context, alloc_limit, flags, *(_QWORD *)&n_threads);
}

AAByteStream AEAEncryptionOutputStreamOpen(AAByteStream encrypted_stream, AEAContext context, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x1E0DDE548](encrypted_stream, context, flags, *(_QWORD *)&n_threads);
}

uint64_t ASServerURLForAssetType()
{
  return MEMORY[0x1E0D4DF78]();
}

uint64_t ASSetAssetServerURLForAssetType()
{
  return MEMORY[0x1E0D4DF80]();
}

uint64_t AnalyticsIsEventUsed()
{
  return MEMORY[0x1E0D15408]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BackgroundTaskAgentAddJob()
{
  return MEMORY[0x1E0D00E90]();
}

uint64_t BackgroundTaskAgentCopyJob()
{
  return MEMORY[0x1E0D00E98]();
}

uint64_t BackgroundTaskAgentInit()
{
  return MEMORY[0x1E0D00EA0]();
}

uint64_t BackgroundTaskAgentRemoveJob()
{
  return MEMORY[0x1E0D00EA8]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFStringRef CFCopyTypeIDDescription(CFTypeID type_id)
{
  return (CFStringRef)MEMORY[0x1E0C98380](type_id);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

uint64_t CKDatabaseScopeString()
{
  return MEMORY[0x1E0C94778]();
}

uint64_t CKStringFromAccountStatus()
{
  return MEMORY[0x1E0C94AC8]();
}

uint64_t CKStringFromDeviceToDeviceEncryptionStatus()
{
  return MEMORY[0x1E0C94AD0]();
}

uint64_t CKStringFromPartition()
{
  return MEMORY[0x1E0C94AE8]();
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return MEMORY[0x1E0D09B98]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x1E0D27C80]();
}

uint64_t HDDiagnosticStringFromDate()
{
  return MEMORY[0x1E0D29600]();
}

uint64_t HDDiagnosticStringFromDuration()
{
  return MEMORY[0x1E0D29608]();
}

uint64_t HDHealthStoreProviderServerInterface()
{
  return MEMORY[0x1E0CB4628]();
}

uint64_t HDIsUnitTesting()
{
  return MEMORY[0x1E0D29610]();
}

uint64_t HDSQLOperatorForComparisonType()
{
  return MEMORY[0x1E0D29628]();
}

uint64_t HDSQLiteBindBooleanToProperty()
{
  return MEMORY[0x1E0D29630]();
}

uint64_t HDSQLiteBindDataToProperty()
{
  return MEMORY[0x1E0D29638]();
}

uint64_t HDSQLiteBindDateToProperty()
{
  return MEMORY[0x1E0D29640]();
}

uint64_t HDSQLiteBindDoubleToProperty()
{
  return MEMORY[0x1E0D29648]();
}

uint64_t HDSQLiteBindFoundationValueToStatement()
{
  return MEMORY[0x1E0D29650]();
}

uint64_t HDSQLiteBindFoundationValuesToStatement()
{
  return MEMORY[0x1E0D29658]();
}

uint64_t HDSQLiteBindInt64ToProperty()
{
  return MEMORY[0x1E0D29660]();
}

uint64_t HDSQLiteBindNullToProperty()
{
  return MEMORY[0x1E0D29668]();
}

uint64_t HDSQLiteBindNumberToProperty()
{
  return MEMORY[0x1E0D29670]();
}

uint64_t HDSQLiteBindSecureCodingObjectToProperty()
{
  return MEMORY[0x1E0D29678]();
}

uint64_t HDSQLiteBindStringToProperty()
{
  return MEMORY[0x1E0D29680]();
}

uint64_t HDSQLiteBindStringToStatement()
{
  return MEMORY[0x1E0D29688]();
}

uint64_t HDSQLiteBindToProperty()
{
  return MEMORY[0x1E0D29690]();
}

uint64_t HDSQLiteBindUUIDToProperty()
{
  return MEMORY[0x1E0D29698]();
}

uint64_t HDSQLiteColumnAsBoolean()
{
  return MEMORY[0x1E0D296A0]();
}

uint64_t HDSQLiteColumnAsBytes()
{
  return MEMORY[0x1E0D296A8]();
}

uint64_t HDSQLiteColumnAsData()
{
  return MEMORY[0x1E0D296B0]();
}

uint64_t HDSQLiteColumnAsDate()
{
  return MEMORY[0x1E0D296B8]();
}

uint64_t HDSQLiteColumnAsDouble()
{
  return MEMORY[0x1E0D296C0]();
}

uint64_t HDSQLiteColumnAsInt64()
{
  return MEMORY[0x1E0D296C8]();
}

uint64_t HDSQLiteColumnAsNaturalType()
{
  return MEMORY[0x1E0D296D0]();
}

uint64_t HDSQLiteColumnAsNumber()
{
  return MEMORY[0x1E0D296D8]();
}

uint64_t HDSQLiteColumnAsString()
{
  return MEMORY[0x1E0D296E0]();
}

uint64_t HDSQLiteColumnAsUUID()
{
  return MEMORY[0x1E0D296E8]();
}

uint64_t HDSQLiteColumnBytesLength()
{
  return MEMORY[0x1E0D296F0]();
}

uint64_t HDSQLiteColumnIsNonNull()
{
  return MEMORY[0x1E0D296F8]();
}

uint64_t HDSQLiteColumnIsNull()
{
  return MEMORY[0x1E0D29700]();
}

uint64_t HDSQLiteColumnWithName()
{
  return MEMORY[0x1E0D29708]();
}

uint64_t HDSQLiteColumnWithNameAsArrayOfClass()
{
  return MEMORY[0x1E0D29710]();
}

uint64_t HDSQLiteColumnWithNameAsBoolean()
{
  return MEMORY[0x1E0D29718]();
}

uint64_t HDSQLiteColumnWithNameAsData()
{
  return MEMORY[0x1E0D29720]();
}

uint64_t HDSQLiteColumnWithNameAsDate()
{
  return MEMORY[0x1E0D29728]();
}

uint64_t HDSQLiteColumnWithNameAsDouble()
{
  return MEMORY[0x1E0D29730]();
}

uint64_t HDSQLiteColumnWithNameAsInt64()
{
  return MEMORY[0x1E0D29738]();
}

uint64_t HDSQLiteColumnWithNameAsInteger()
{
  return MEMORY[0x1E0D29740]();
}

uint64_t HDSQLiteColumnWithNameAsNaturalType()
{
  return MEMORY[0x1E0D29748]();
}

uint64_t HDSQLiteColumnWithNameAsNonEmptyString()
{
  return MEMORY[0x1E0D29750]();
}

uint64_t HDSQLiteColumnWithNameAsNumber()
{
  return MEMORY[0x1E0D29758]();
}

uint64_t HDSQLiteColumnWithNameAsObject()
{
  return MEMORY[0x1E0D29760]();
}

uint64_t HDSQLiteColumnWithNameAsObjectWithClasses()
{
  return MEMORY[0x1E0D29768]();
}

uint64_t HDSQLiteColumnWithNameAsString()
{
  return MEMORY[0x1E0D29770]();
}

uint64_t HDSQLiteColumnWithNameAsURL()
{
  return MEMORY[0x1E0D29778]();
}

uint64_t HDSQLiteColumnWithNameAsUUID()
{
  return MEMORY[0x1E0D29780]();
}

uint64_t HDSQLiteColumnWithNameIsNull()
{
  return MEMORY[0x1E0D29788]();
}

uint64_t HDSQLiteComparisonTypeForPredicateOperator()
{
  return MEMORY[0x1E0D297A0]();
}

uint64_t HDSQLiteEntityCreateTableSQL()
{
  return MEMORY[0x1E0D297C8]();
}

uint64_t HDSQLiteEntityEnumerateColumns()
{
  return MEMORY[0x1E0D297D0]();
}

uint64_t HDStringFromContentProtectionState()
{
  return MEMORY[0x1E0D297E8]();
}

uint64_t HDStringFromGatedActivityResult()
{
  return MEMORY[0x1E0D297F0]();
}

uint64_t HDStringRepresentationForRecipientIdentifier()
{
  return MEMORY[0x1E0CB4638]();
}

uint64_t HKActivityMoveModeToString()
{
  return MEMORY[0x1E0CB4668]();
}

uint64_t HKAllCollectibleTypesWithStoreDemoModeEnabled()
{
  return MEMORY[0x1E0CB4678]();
}

uint64_t HKAppleIrregularRhythmNotificationsAlgorithmVersionForPrivateVersionString()
{
  return MEMORY[0x1E0CB4768]();
}

uint64_t HKAuthorizationIdentifiersFromSharingAuthorizations()
{
  return MEMORY[0x1E0CB47F8]();
}

uint64_t HKAuthorizationStatusAllowsReading()
{
  return MEMORY[0x1E0CB4808]();
}

uint64_t HKAuthorizationStatusAllowsSharing()
{
  return MEMORY[0x1E0CB4810]();
}

uint64_t HKAuthorizationStatusToString()
{
  return MEMORY[0x1E0CB4818]();
}

uint64_t HKAuthorizationStoreClientInterface()
{
  return MEMORY[0x1E0CB4820]();
}

uint64_t HKAuthorizationStoreReadServerInterface()
{
  return MEMORY[0x1E0CB4828]();
}

uint64_t HKAuthorizationStoreResetServerInterface()
{
  return MEMORY[0x1E0CB4830]();
}

uint64_t HKAuthorizationStoreWriteServerInterface()
{
  return MEMORY[0x1E0CB4838]();
}

uint64_t HKBitPatternCastSignedToUnsignedInt64()
{
  return MEMORY[0x1E0CB4848]();
}

uint64_t HKBitPatternCastUnsignedToSignedInt64()
{
  return MEMORY[0x1E0CB4850]();
}

uint64_t HKCloudSyncControlClientInterface()
{
  return MEMORY[0x1E0CB4A10]();
}

uint64_t HKCloudSyncControlServerInterface()
{
  return MEMORY[0x1E0CB4A18]();
}

uint64_t HKCloudSyncOptionsToString()
{
  return MEMORY[0x1E0CB4A28]();
}

uint64_t HKCloudSyncReasonToString()
{
  return MEMORY[0x1E0CB4A30]();
}

uint64_t HKCompareIntegers()
{
  return MEMORY[0x1E0CB4A50]();
}

uint64_t HKCompareUUIDBytes()
{
  return MEMORY[0x1E0CB4A58]();
}

uint64_t HKConditionallyRedactedHeartRhythmString()
{
  return MEMORY[0x1E0CB4A78]();
}

uint64_t HKConnectedGymSourceName()
{
  return MEMORY[0x1E0CB4A80]();
}

uint64_t HKCopyQueryDescription()
{
  return MEMORY[0x1E0CB4A98]();
}

uint64_t HKCoreMotionSupportsEstimatedWorkoutEffortForActivityType()
{
  return MEMORY[0x1E0CB4AA0]();
}

uint64_t HKCoreMotionSupportsSkiingWorkoutSessions()
{
  return MEMORY[0x1E0CB4AA8]();
}

uint64_t HKCoreMotionSupportsSwimmingWorkoutSessions()
{
  return MEMORY[0x1E0CB4AB0]();
}

uint64_t HKCountryMonitorControlClientInterface()
{
  return MEMORY[0x1E0CB4AD8]();
}

uint64_t HKCountryMonitorControlServerInterface()
{
  return MEMORY[0x1E0CB4AE0]();
}

uint64_t HKCreateConcurrentDispatchQueue()
{
  return MEMORY[0x1E0CB4AF8]();
}

uint64_t HKCreateConcurrentDispatchQueueWithQOSClass()
{
  return MEMORY[0x1E0CB4B00]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x1E0CB4B08]();
}

uint64_t HKCreateSerialDispatchQueueWithQOSClass()
{
  return MEMORY[0x1E0CB4B10]();
}

uint64_t HKCreateSerialUtilityDispatchQueue()
{
  return MEMORY[0x1E0CB4B18]();
}

uint64_t HKCurrentLocaleCountryCodeIfUnknown()
{
  return MEMORY[0x1E0CB4B20]();
}

uint64_t HKCurrentSchemaVersionForShardIdentifier()
{
  return MEMORY[0x1E0CB4B28]();
}

uint64_t HKDataCollectionTypeToString()
{
  return MEMORY[0x1E0CB4B38]();
}

uint64_t HKDataTypeRequiresAuthorization()
{
  return MEMORY[0x1E0CB4B50]();
}

uint64_t HKDataTypeRequiresPerObjectAuthorization()
{
  return MEMORY[0x1E0CB4B58]();
}

uint64_t HKDatabaseControlClientInterface()
{
  return MEMORY[0x1E0CB4B60]();
}

uint64_t HKDatabaseControlServerInterface()
{
  return MEMORY[0x1E0CB4B68]();
}

uint64_t HKDateMax()
{
  return MEMORY[0x1E0CB4B78]();
}

uint64_t HKDateMin()
{
  return MEMORY[0x1E0CB4B88]();
}

uint64_t HKDefaultAggregationIntervalForType()
{
  return MEMORY[0x1E0CB4BA0]();
}

uint64_t HKDefaultCollectionLatencyForType()
{
  return MEMORY[0x1E0CB4BA8]();
}

uint64_t HKDefaultMaximumSeriesDurationForType()
{
  return MEMORY[0x1E0CB4BB0]();
}

uint64_t HKDefaultObjectValidationConfiguration()
{
  return MEMORY[0x1E0CB4BB8]();
}

uint64_t HKDefaultObjectValidationConfigurationIgnoringAllOptions()
{
  return MEMORY[0x1E0CB4BC0]();
}

uint64_t HKDefaultOntologyServerBaseURL()
{
  return MEMORY[0x1E0CB4BC8]();
}

uint64_t HKDeviceStoreClientInterface()
{
  return MEMORY[0x1E0CB4C48]();
}

uint64_t HKDeviceStoreServerInterface()
{
  return MEMORY[0x1E0CB4C50]();
}

uint64_t HKDiagnosticStoreClientInterface()
{
  return MEMORY[0x1E0CB4C58]();
}

uint64_t HKDiagnosticStoreServerInterface()
{
  return MEMORY[0x1E0CB4C60]();
}

uint64_t HKDiagnosticStringFromDate()
{
  return MEMORY[0x1E0CB4C68]();
}

uint64_t HKDiagnosticStringFromDuration()
{
  return MEMORY[0x1E0CB4C70]();
}

uint64_t HKDiagnosticStringFromUUID()
{
  return MEMORY[0x1E0CB4C78]();
}

uint64_t HKDispatchAsyncOnGlobalConcurrentQueue()
{
  return MEMORY[0x1E0CB4CE8]();
}

uint64_t HKElectrocardiogramSymptomsStatusFromPrivateElectrocardiogramSymptoms()
{
  return MEMORY[0x1E0CB4D68]();
}

uint64_t HKEntitlementStoreClientInterface()
{
  return MEMORY[0x1E0CB4DD0]();
}

uint64_t HKEntitlementStoreServerInterface()
{
  return MEMORY[0x1E0CB4DD8]();
}

uint64_t HKFeatureAvailabilityHealthDataRequirementStoreClientInterface()
{
  return MEMORY[0x1E0CB4EE0]();
}

uint64_t HKFeatureAvailabilityHealthDataRequirementStoreServerInterface()
{
  return MEMORY[0x1E0CB4EE8]();
}

uint64_t HKFeatureAvailabilityStoreClientInterface()
{
  return MEMORY[0x1E0CB4FD8]();
}

uint64_t HKFeatureAvailabilityStoreServerInterface()
{
  return MEMORY[0x1E0CB4FE0]();
}

uint64_t HKFeatureFlagBloodOxygenSaturationEnabled()
{
  return MEMORY[0x1E0CB4FE8]();
}

uint64_t HKFeatureFlagWorkoutSeriesAggregation()
{
  return MEMORY[0x1E0CB4FF0]();
}

uint64_t HKFeatureIdentifierIsProvidedBySleepDaemon()
{
  return MEMORY[0x1E0CB5050]();
}

uint64_t HKFeaturePropertiesChangeNotificationForFeatureIdentifier()
{
  return MEMORY[0x1E0CB50C0]();
}

uint64_t HKHealthKitFrameworkBundle()
{
  return MEMORY[0x1E0CB5148]();
}

uint64_t HKHealthStoreClientInterface()
{
  return MEMORY[0x1E0CB5170]();
}

uint64_t HKHealthStoreEndpointInterface()
{
  return MEMORY[0x1E0CB5178]();
}

uint64_t HKHealthStoreProviderClientInterface()
{
  return MEMORY[0x1E0CB5188]();
}

uint64_t HKHeartRateMotionContextForPrivateHeartRateContext()
{
  return MEMORY[0x1E0CB5190]();
}

uint64_t HKImproveHealthAndActivityAnalyticsAllowed()
{
  return MEMORY[0x1E0CB51B8]();
}

uint64_t HKIntersectionDayIndexRange()
{
  return MEMORY[0x1E0CB51C8]();
}

uint64_t HKIsDeprecatedPropertyType()
{
  return MEMORY[0x1E0CB5218]();
}

uint64_t HKIsFitnessTrackingEnabled()
{
  return MEMORY[0x1E0CB5220]();
}

uint64_t HKIsHeartRateEnabled()
{
  return MEMORY[0x1E0CB5228]();
}

uint64_t HKIsKnownOntologyShardIdentifier()
{
  return MEMORY[0x1E0CB5230]();
}

uint64_t HKIsUnitTesting()
{
  return MEMORY[0x1E0CB5240]();
}

uint64_t HKIsValidUserDomainConceptPropertyValueType()
{
  return MEMORY[0x1E0CB5248]();
}

uint64_t HKLocalDeviceHardwareSupportsWristTemperatureMeasurements()
{
  return MEMORY[0x1E0CB5258]();
}

uint64_t HKLogAnalytics()
{
  return MEMORY[0x1E0CB5270]();
}

uint64_t HKLogAssertions()
{
  return MEMORY[0x1E0CB5278]();
}

uint64_t HKLogConceptIndex()
{
  return MEMORY[0x1E0CB52A0]();
}

uint64_t HKLogHealthOntology()
{
  return MEMORY[0x1E0CB52D0]();
}

uint64_t HKLogInfrastructure()
{
  return MEMORY[0x1E0CB52F8]();
}

uint64_t HKLogMedication()
{
  return MEMORY[0x1E0CB5308]();
}

uint64_t HKLogSafeDescription()
{
  return MEMORY[0x1E0CB5350]();
}

uint64_t HKLogSharing()
{
  return MEMORY[0x1E0CB5360]();
}

uint64_t HKMetadataAliasRangesForKey()
{
  return MEMORY[0x1E0CB5460]();
}

uint64_t HKMetadataAliasesForKey()
{
  return MEMORY[0x1E0CB5468]();
}

uint64_t HKNSOperatingSystemVersionFromString()
{
  return MEMORY[0x1E0CB5638]();
}

uint64_t HKNSOperatingSystemVersionIsUnknown()
{
  return MEMORY[0x1E0CB5640]();
}

uint64_t HKNSOperatingSystemVersionString()
{
  return MEMORY[0x1E0CB5648]();
}

uint64_t HKNSOperatingSystemVersionsEqual()
{
  return MEMORY[0x1E0CB5658]();
}

uint64_t HKNanoSyncControlClientInterface()
{
  return MEMORY[0x1E0CB5670]();
}

uint64_t HKNanoSyncControlServerInterface()
{
  return MEMORY[0x1E0CB5678]();
}

uint64_t HKNotificationDomainIsDeprecated()
{
  return MEMORY[0x1E0CB5680]();
}

uint64_t HKNotificationStoreClientInterface()
{
  return MEMORY[0x1E0CB5688]();
}

uint64_t HKNotificationStoreServerInterface()
{
  return MEMORY[0x1E0CB5690]();
}

uint64_t HKNotificationSyncStoreClientInterface()
{
  return MEMORY[0x1E0CB56A0]();
}

uint64_t HKNotificationSyncStoreServerInterface()
{
  return MEMORY[0x1E0CB56A8]();
}

uint64_t HKObjectAuthorizationStatusForNumber()
{
  return MEMORY[0x1E0CB56B8]();
}

uint64_t HKObjectForNanoPreferencesUserDefaultsKey()
{
  return MEMORY[0x1E0CB56C0]();
}

uint64_t HKObjectValidationConfigurationWithOptions()
{
  return MEMORY[0x1E0CB56D0]();
}

uint64_t HKOntologyShardSchemaTypeForShardIdentifier()
{
  return MEMORY[0x1E0CB5738]();
}

uint64_t HKOxygenSaturationLowBarometricPressureThresholdQuantity()
{
  return MEMORY[0x1E0CB5760]();
}

uint64_t HKPreferredRegulatoryDomainProvider()
{
  return MEMORY[0x1E0CB5980]();
}

uint64_t HKProfileStoreClientInterface()
{
  return MEMORY[0x1E0CB59F8]();
}

uint64_t HKProfileStoreServerInterface()
{
  return MEMORY[0x1E0CB5A00]();
}

uint64_t HKProgramSDKTokenAtLeast()
{
  return MEMORY[0x1E0CB5A08]();
}

uint64_t HKPromptForLegacyPerObjectAuthorizationDuringQueries()
{
  return MEMORY[0x1E0CB5A10]();
}

uint64_t HKRaceRouteClusterStoreClientInterface()
{
  return MEMORY[0x1E0CB5DE0]();
}

uint64_t HKRaceRouteClusterStoreServerInterface()
{
  return MEMORY[0x1E0CB5DE8]();
}

uint64_t HKRollingBaselineConfigurationForQuantityType()
{
  return MEMORY[0x1E0CB5E38]();
}

uint64_t HKSafeObject()
{
  return MEMORY[0x1E0CB5E40]();
}

uint64_t HKSelectedAuthorizationModeToString()
{
  return MEMORY[0x1E0CB5E78]();
}

uint64_t HKSemanticVersionFromString()
{
  return MEMORY[0x1E0CB5E80]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x1E0CB5E90]();
}

uint64_t HKSeriesBuilderStateToString()
{
  return MEMORY[0x1E0CB5EB0]();
}

uint64_t HKSharingAuthorizationsFromAuthorizationIdentifiers()
{
  return MEMORY[0x1E0CB5EC8]();
}

uint64_t HKSleepDaySummaryQueryOptionsStringRepresentation()
{
  return MEMORY[0x1E0CB5EE8]();
}

uint64_t HKSleepDaySummarySampleTypes()
{
  return MEMORY[0x1E0CB5EF0]();
}

uint64_t HKSleepScheduleWeekdayArrayFromWeekdays()
{
  return MEMORY[0x1E0CB5EF8]();
}

uint64_t HKSleepScheduleWeekdayFromWeekdayComponent()
{
  return MEMORY[0x1E0CB5F00]();
}

uint64_t HKSleepScheduleWeekdaysIsSingleDay()
{
  return MEMORY[0x1E0CB5F10]();
}

uint64_t HKSleepScheduleWeekdaysMake()
{
  return MEMORY[0x1E0CB5F18]();
}

uint64_t HKSourceOptionsForAppleDevice()
{
  return MEMORY[0x1E0CB5F30]();
}

uint64_t HKSourceStoreClientInterface()
{
  return MEMORY[0x1E0CB5F58]();
}

uint64_t HKSourceStoreServerInterface()
{
  return MEMORY[0x1E0CB5F60]();
}

uint64_t HKStateOfMindAssociationFromDomain()
{
  return MEMORY[0x1E0CB5F70]();
}

uint64_t HKStateOfMindKindFromReflectiveInterval()
{
  return MEMORY[0x1E0CB5F78]();
}

uint64_t HKStaticSyncControlClientInterface()
{
  return MEMORY[0x1E0CB5F88]();
}

uint64_t HKStaticSyncControlServerInterface()
{
  return MEMORY[0x1E0CB5F90]();
}

uint64_t HKStaticSyncOptionsToString()
{
  return MEMORY[0x1E0CB5F98]();
}

uint64_t HKStringForMessageDirection()
{
  return MEMORY[0x1E0CB5FA0]();
}

uint64_t HKStringForNotificationStatus()
{
  return MEMORY[0x1E0CB5FA8]();
}

uint64_t HKStringForSharingStatus()
{
  return MEMORY[0x1E0CB5FB0]();
}

uint64_t HKStringForSharingType()
{
  return MEMORY[0x1E0CB5FB8]();
}

uint64_t HKStringFromBool()
{
  return MEMORY[0x1E0CB5FC0]();
}

uint64_t HKStringFromFailableBooleanResult()
{
  return MEMORY[0x1E0CB5FC8]();
}

uint64_t HKStringFromHKOntologyPruneOptions()
{
  return MEMORY[0x1E0CB5FD0]();
}

uint64_t HKStringFromMedicalRecordCategoryType()
{
  return MEMORY[0x1E0CB5FE0]();
}

uint64_t HKStringFromOntologyFeatureRequestOptions()
{
  return MEMORY[0x1E0CB5FE8]();
}

uint64_t HKStringFromOntologyUpdateReason()
{
  return MEMORY[0x1E0CB6000]();
}

uint64_t HKStringFromOptionalBooleanResult()
{
  return MEMORY[0x1E0CB6008]();
}

uint64_t HKStringFromProfileType()
{
  return MEMORY[0x1E0CB6010]();
}

uint64_t HKStringFromQoS()
{
  return MEMORY[0x1E0CB6018]();
}

uint64_t HKStringFromUserDomainConceptPropertyType()
{
  return MEMORY[0x1E0CB6020]();
}

uint64_t HKStringFromUserDomainConceptPropertyValueType()
{
  return MEMORY[0x1E0CB6028]();
}

uint64_t HKStringFromUserDomainConceptStoreChangeType()
{
  return MEMORY[0x1E0CB6030]();
}

uint64_t HKStringFromUserDomainConceptStoreMethod()
{
  return MEMORY[0x1E0CB6038]();
}

uint64_t HKStringFromWorkoutCondenserReason()
{
  return MEMORY[0x1E0CB6040]();
}

uint64_t HKSyncProtocolVersionToString()
{
  return MEMORY[0x1E0CB6048]();
}

uint64_t HKSynchronizeNanoPreferencesUserDefaults()
{
  return MEMORY[0x1E0CB6050]();
}

uint64_t HKWeakConceptLinkTypes()
{
  return MEMORY[0x1E0CB6168]();
}

uint64_t HKWithAutoreleasePool()
{
  return MEMORY[0x1E0CB6178]();
}

uint64_t HKWithUnfairLock()
{
  return MEMORY[0x1E0CB6180]();
}

uint64_t HKWorkoutBuilderConstructionStateToString()
{
  return MEMORY[0x1E0CB6188]();
}

uint64_t HKWorkoutClusterStoreClientInterface()
{
  return MEMORY[0x1E0CB6190]();
}

uint64_t HKWorkoutClusterStoreServerInterface()
{
  return MEMORY[0x1E0CB6198]();
}

uint64_t HKWorkoutControlClientInterface()
{
  return MEMORY[0x1E0CB61A0]();
}

uint64_t HKWorkoutControlServerInterface()
{
  return MEMORY[0x1E0CB61A8]();
}

uint64_t HKWorkoutSessionServerStateFromSessionState()
{
  return MEMORY[0x1E0CB61B0]();
}

uint64_t HKWorkoutSessionStateFromServerState()
{
  return MEMORY[0x1E0CB61B8]();
}

uint64_t HKWorkoutSessionStateToString()
{
  return MEMORY[0x1E0CB61C0]();
}

uint64_t HKWorkoutSessionTypeToString()
{
  return MEMORY[0x1E0CB61D0]();
}

uint64_t IDSCopyForDevice()
{
  return MEMORY[0x1E0D33DD0]();
}

uint64_t IDSCopyIDForDevice()
{
  return MEMORY[0x1E0D33DE0]();
}

uint64_t IDSCopyIDForEmailAddress()
{
  return MEMORY[0x1E0D33DF0]();
}

uint64_t IDSCopyIDForPhoneNumber()
{
  return MEMORY[0x1E0D33DF8]();
}

uint64_t IDSCopyRawAddressForDestination()
{
  return MEMORY[0x1E0D33E28]();
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB700](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x1E0DE2B18]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

uint64_t MGRegisterForUpdates()
{
  return MEMORY[0x1E0DE2BA8]();
}

uint64_t NRRawVersionFromString()
{
  return MEMORY[0x1E0D51808]();
}

uint64_t NRWatchOSVersionForLocalDevice()
{
  return MEMORY[0x1E0D51820]();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return MEMORY[0x1E0D51828]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB2C00]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t NSStringFromHKDayIndexRange()
{
  return MEMORY[0x1E0CB6210]();
}

uint64_t NSStringFromHKNotificationDomain()
{
  return MEMORY[0x1E0CB6230]();
}

uint64_t NSStringFromHKNotificationInstructionAction()
{
  return MEMORY[0x1E0CB6238]();
}

uint64_t NSStringFromHKOnboardingCompletionCountryCodeProvenance()
{
  return MEMORY[0x1E0CB6240]();
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x1E0CB3218](proto);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t NSWeekdayComponentFromHKSleepScheduleWeekday()
{
  return MEMORY[0x1E0CB6248]();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

uint64_t PBRepeatedDoubleAdd()
{
  return MEMORY[0x1E0D82D68]();
}

uint64_t PBRepeatedDoubleClear()
{
  return MEMORY[0x1E0D82D70]();
}

uint64_t PBRepeatedDoubleCopy()
{
  return MEMORY[0x1E0D82D78]();
}

uint64_t PBRepeatedDoubleHash()
{
  return MEMORY[0x1E0D82D80]();
}

uint64_t PBRepeatedDoubleIsEqual()
{
  return MEMORY[0x1E0D82D88]();
}

uint64_t PBRepeatedDoubleNSArray()
{
  return MEMORY[0x1E0D82D90]();
}

uint64_t PBRepeatedDoubleSet()
{
  return MEMORY[0x1E0D82D98]();
}

uint64_t PBRepeatedInt64Add()
{
  return MEMORY[0x1E0D82E10]();
}

uint64_t PBRepeatedInt64Clear()
{
  return MEMORY[0x1E0D82E18]();
}

uint64_t PBRepeatedInt64Copy()
{
  return MEMORY[0x1E0D82E20]();
}

uint64_t PBRepeatedInt64Hash()
{
  return MEMORY[0x1E0D82E28]();
}

uint64_t PBRepeatedInt64IsEqual()
{
  return MEMORY[0x1E0D82E30]();
}

uint64_t PBRepeatedInt64NSArray()
{
  return MEMORY[0x1E0D82E38]();
}

uint64_t PBRepeatedInt64Set()
{
  return MEMORY[0x1E0D82E40]();
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD62F8](key, error);
}

SecKeyRef SecKeyCopyPublicKey(SecKeyRef key)
{
  return (SecKeyRef)MEMORY[0x1E0CD6318](key);
}

SecKeyRef SecKeyCreateRandomKey(CFDictionaryRef parameters, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD6388](parameters, error);
}

CFTypeID SecKeyGetTypeID(void)
{
  return MEMORY[0x1E0CD63E8]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
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

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

uint64_t _HDDateForSQLiteValue()
{
  return MEMORY[0x1E0D29918]();
}

uint64_t _HDQuantityForSQLiteValue()
{
  return MEMORY[0x1E0D29920]();
}

uint64_t _HDSQLiteBindArrayToProperty()
{
  return MEMORY[0x1E0D29928]();
}

uint64_t _HDSQLiteValueForData()
{
  return MEMORY[0x1E0D29930]();
}

uint64_t _HDSQLiteValueForDate()
{
  return MEMORY[0x1E0D29938]();
}

uint64_t _HDSQLiteValueForNumber()
{
  return MEMORY[0x1E0D29940]();
}

uint64_t _HDSQLiteValueForQuantity()
{
  return MEMORY[0x1E0D29948]();
}

uint64_t _HDSQLiteValueForString()
{
  return MEMORY[0x1E0D29950]();
}

uint64_t _HDSQLiteValueForUUID()
{
  return MEMORY[0x1E0D29958]();
}

uint64_t _HDUUIDForSQLiteValue()
{
  return MEMORY[0x1E0D29960]();
}

uint64_t _HKActivityCacheDateComponentsFromDate()
{
  return MEMORY[0x1E0CB7098]();
}

uint64_t _HKBackgroundAndSedentaryPrivateHeartRateContexts()
{
  return MEMORY[0x1E0CB70B8]();
}

uint64_t _HKCacheIndexFromDateComponents()
{
  return MEMORY[0x1E0CB70E8]();
}

uint64_t _HKCalculateWorkoutDuration()
{
  return MEMORY[0x1E0CB70F0]();
}

uint64_t _HKCategoryTypesForSymptomsBitmask()
{
  return MEMORY[0x1E0CB70F8]();
}

uint64_t _HKCategoryValueSleepAnalysisAsleepValues()
{
  return MEMORY[0x1E0CB7100]();
}

uint64_t _HKCategoryValueSleepAnalysisDefaultAsleepValue()
{
  return MEMORY[0x1E0CB7108]();
}

uint64_t _HKCategoryValueSleepAnalysisIsAsleep()
{
  return MEMORY[0x1E0CB7110]();
}

uint64_t _HKCloudSyncObserverStatusToString()
{
  return MEMORY[0x1E0CB7138]();
}

uint64_t _HKDeepBreathingSessionClientInterface()
{
  return MEMORY[0x1E0CB7158]();
}

uint64_t _HKDeepBreathingSessionServerInterface()
{
  return MEMORY[0x1E0CB7160]();
}

uint64_t _HKGenerateDefaultUnitForQuantityTypeWithVersion()
{
  return MEMORY[0x1E0CB7188]();
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x1E0CB7190]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x1E0CB71A0]();
}

uint64_t _HKLogDroppedErrorWithReason()
{
  return MEMORY[0x1E0CB71A8]();
}

uint64_t _HKLogPersistedSignposts()
{
  return MEMORY[0x1E0CB71B0]();
}

uint64_t _HKLogSignpostIDGenerate()
{
  return MEMORY[0x1E0CB71B8]();
}

uint64_t _HKLoggingActionCompletion()
{
  return MEMORY[0x1E0CB71C0]();
}

uint64_t _HKMetadataKeyIsPrivate()
{
  return MEMORY[0x1E0CB71D0]();
}

uint64_t _HKPausedIntervalsWithWorkoutEvents()
{
  return MEMORY[0x1E0CB71E0]();
}

uint64_t _HKStatisticOptionsAverageSampleDuration()
{
  return MEMORY[0x1E0CB73C0]();
}

uint64_t _HKStatisticsOptionAttenuateSamples()
{
  return MEMORY[0x1E0CB73C8]();
}

uint64_t _HKStatisticsOptionBaselineRelativeQuantities()
{
  return MEMORY[0x1E0CB73D0]();
}

uint64_t _HKStatisticsOptionPercentile()
{
  return MEMORY[0x1E0CB73D8]();
}

uint64_t _HKStatisticsOptionPresence()
{
  return MEMORY[0x1E0CB73E0]();
}

uint64_t _HKStatisticsOptionSleepStages()
{
  return MEMORY[0x1E0CB73E8]();
}

uint64_t _HKUnitPreferencesVersionToUnitDictionaryForQuantityType()
{
  return MEMORY[0x1E0CB73F0]();
}

uint64_t _HKValidDataTypeCode()
{
  return MEMORY[0x1E0CB73F8]();
}

uint64_t _HKWorkoutActivityNameForActivityType()
{
  return MEMORY[0x1E0CB7418]();
}

uint64_t _HKWorkoutActivityTypeIsRouteable()
{
  return MEMORY[0x1E0CB7428]();
}

uint64_t _HKWorkoutActivityTypeIsValid()
{
  return MEMORY[0x1E0CB7430]();
}

uint64_t _HKWorkoutCanonicalActiveHoursUnit()
{
  return MEMORY[0x1E0CB7448]();
}

uint64_t _HKWorkoutCanonicalBriskMinutesUnit()
{
  return MEMORY[0x1E0CB7450]();
}

uint64_t _HKWorkoutCanonicalDistanceUnit()
{
  return MEMORY[0x1E0CB7458]();
}

uint64_t _HKWorkoutCanonicalEnergyBurnedUnit()
{
  return MEMORY[0x1E0CB7460]();
}

uint64_t _HKWorkoutCanonicalFlightsClimbedUnit()
{
  return MEMORY[0x1E0CB7468]();
}

uint64_t _HKWorkoutCanonicalMoveMinutesUnit()
{
  return MEMORY[0x1E0CB7470]();
}

uint64_t _HKWorkoutCanonicalSwimmingStrokeCountUnit()
{
  return MEMORY[0x1E0CB7478]();
}

uint64_t _HKWorkoutCanonicalUnitForGoalType()
{
  return MEMORY[0x1E0CB7480]();
}

uint64_t _HKWorkoutConfigurationWithActivityTypeAndMetadata()
{
  return MEMORY[0x1E0CB7488]();
}

uint64_t _HKWorkoutDistanceTypeForActivityType()
{
  return MEMORY[0x1E0CB7490]();
}

uint64_t _HKWorkoutGoalTypeAcceptsQuantity()
{
  return MEMORY[0x1E0CB74A8]();
}

uint64_t _HKWorkoutGoalTypeIsValidForGoal()
{
  return MEMORY[0x1E0CB74B0]();
}

uint64_t _HKWorkoutSessionLocationTypeName()
{
  return MEMORY[0x1E0CB74D0]();
}

uint64_t _HKWorkoutSessionServerStateToString()
{
  return MEMORY[0x1E0CB74D8]();
}

uint64_t _HKWorkoutSwimmingLocationTypeName()
{
  return MEMORY[0x1E0CB74E0]();
}

uint64_t _IDSCopyIDForEmailAddress()
{
  return MEMORY[0x1E0D34EF8]();
}

uint64_t _IDSCopyIDForPhoneNumberWithOptions()
{
  return MEMORY[0x1E0D34F00]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t PB::TextFormatter::beginObject(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x1E0D82EC0](this, a2);
}

uint64_t PB::TextFormatter::format()
{
  return MEMORY[0x1E0D82ED0]();
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  return MEMORY[0x1E0D82ED8](this, a2);
}

{
  return MEMORY[0x1E0D82F00](this, a2);
}

uint64_t PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, double a3)
{
  return MEMORY[0x1E0D82EE0](this, a2, a3);
}

uint64_t PB::TextFormatter::endObject(PB::TextFormatter *this)
{
  return MEMORY[0x1E0D82F10](this);
}

void PB::Base::~Base(PB::Base *this)
{
  MEMORY[0x1E0D82F18](this);
}

uint64_t PB::Reader::recallMark()
{
  return MEMORY[0x1E0D82F38]();
}

uint64_t PB::Reader::read()
{
  return MEMORY[0x1E0D82F48]();
}

uint64_t PB::Reader::skip(PB::Reader *this)
{
  return MEMORY[0x1E0D82F58](this);
}

uint64_t PB::Reader::placeMark()
{
  return MEMORY[0x1E0D82F60]();
}

uint64_t PB::Reader::Reader(PB::Reader *this, const unsigned __int8 *a2)
{
  return MEMORY[0x1E0D82F68](this, a2);
}

uint64_t PB::Writer::writeVarInt(PB::Writer *this)
{
  return MEMORY[0x1E0D82F98](this);
}

uint64_t PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2)
{
  return MEMORY[0x1E0D82FA8](this, a2);
}

uint64_t PB::Writer::write()
{
  return MEMORY[0x1E0D82FB8]();
}

uint64_t PB::Writer::write(PB::Writer *this)
{
  return MEMORY[0x1E0D82FC8](this);
}

uint64_t PB::Writer::write(PB::Writer *this, double a2)
{
  return MEMORY[0x1E0D82FD0](this, a2);
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x1E0D82FF0](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
  MEMORY[0x1E0D82FF8](this);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x1E0DE4240](retstr, this);
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
  return (std::logic_error *)MEMORY[0x1E0DE4278](this, a2);
}

{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4280](this, a2);
}

{
  return (std::logic_error *)MEMORY[0x1E0DE4290](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1E0DE4320](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4328](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4340](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x1E0DE43B0](this, *(_QWORD *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x1E0DE43F8](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x1E0DE4490](this, __pos, __n1, __s, __n2);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x1E0DE44B0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

std::system_error *__cdecl std::system_error::system_error(std::system_error *this, int __ev, const std::error_category *__ecat, const std::string *__what_arg)
{
  return (std::system_error *)MEMORY[0x1E0DE4570](this, *(_QWORD *)&__ev, __ecat, __what_arg);
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
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46E8]();
}

{
  return MEMORY[0x1E0DE46F8]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4718]();
}

{
  return MEMORY[0x1E0DE4728]();
}

{
  return MEMORY[0x1E0DE4730]();
}

{
  return MEMORY[0x1E0DE4738]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x1E0DE4770](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
  MEMORY[0x1E0DE4778](this);
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x1E0DE4780](this);
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x1E0DE47C8](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x1E0DE4848]();
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x1E0DE4890](this);
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x1E0DE48A8](this, __lk);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x1E0DE48B0](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x1E0DE4910](retstr, __s);
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x1E0DE4920](*(_QWORD *)&__ev, __what_arg);
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

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1E0DE4B88](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x1E0DE4B90](this);
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

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E6CE6268();
}

void operator delete(void *__p)
{
  off_1E6CE6270(__p);
}

uint64_t operator delete()
{
  return off_1E6CE6278();
}

uint64_t operator new[]()
{
  return off_1E6CE6280();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E6CE6288(__sz);
}

uint64_t operator new()
{
  return off_1E6CE6290();
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

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x1E0DE5090](lpmangled, lpout, lpoutlen, lpstatus);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
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

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

uint64_t archive_entry_copy_pathname()
{
  return MEMORY[0x1E0DE3DB0]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x1E0DE3DC8]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x1E0DE3DD0]();
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x1E0DE3DD8]();
}

uint64_t archive_entry_size()
{
  return MEMORY[0x1E0DE3E38]();
}

uint64_t archive_errno()
{
  return MEMORY[0x1E0DE3E58]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1E0DE3E60]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x1E0DE3E88]();
}

uint64_t archive_read_disk_can_descend()
{
  return MEMORY[0x1E0DE3EA0]();
}

uint64_t archive_read_disk_descend()
{
  return MEMORY[0x1E0DE3EA8]();
}

uint64_t archive_read_disk_new()
{
  return MEMORY[0x1E0DE3EB8]();
}

uint64_t archive_read_disk_open()
{
  return MEMORY[0x1E0DE3EC0]();
}

uint64_t archive_read_disk_set_metadata_filter_callback()
{
  return MEMORY[0x1E0DE3EC8]();
}

uint64_t archive_read_extract2()
{
  return MEMORY[0x1E0DE3EE8]();
}

uint64_t archive_read_free()
{
  return MEMORY[0x1E0DE3EF8]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1E0DE3F00]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1E0DE3F08]();
}

uint64_t archive_read_next_header2()
{
  return MEMORY[0x1E0DE3F10]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x1E0DE3F28]();
}

uint64_t archive_read_support_filter_all()
{
  return MEMORY[0x1E0DE3F48]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x1E0DE3F70]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x1E0DE3FB0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1E0DE3FC8]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x1E0DE3FD8]();
}

uint64_t archive_write_disk_set_options()
{
  return MEMORY[0x1E0DE3FE0]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x1E0DE4000]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1E0DE4008]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x1E0DE4010]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x1E0DE4028]();
}

uint64_t archive_write_set_format_pax_restricted()
{
  return MEMORY[0x1E0DE4058]();
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1E0C816C8](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1E0C83078](*(_QWORD *)&a1);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1E0C830A0]();
}

uint64_t dyld_get_base_platform()
{
  return MEMORY[0x1E0C830A8]();
}

uint64_t dyld_version_token_at_least()
{
  return MEMORY[0x1E0C831B0]();
}

uint64_t dyld_version_token_get_platform()
{
  return MEMORY[0x1E0C831B8]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

int getpagesize(void)
{
  return MEMORY[0x1E0C83740]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

uint64_t mmapFileDescriptor()
{
  return MEMORY[0x1E0C95420]();
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint64_t nw_endpoint_copy_dictionary()
{
  return MEMORY[0x1E0CCF350]();
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x1E0CCF3B0](hostname, port);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84988](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84F68](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x1E0C853F0](*(_QWORD *)&a1, a2);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8580](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8588](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x1E0DE8710](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE88B8](a1, a2, *(_QWORD *)&a3, a4);
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
  MEMORY[0x1E0DE88D0](a1, a2, *(_QWORD *)&a3);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE8A60](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A70](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1E0DEEBD0]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x1E0DEEC58]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1E0DB1290]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1E0C86118]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1E0C862F8]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1E0C866E0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1E0C86778]();
}

uint64_t xpc_transaction_try_exit_clean()
{
  return MEMORY[0x1E0C86788]();
}

uint64_t objc_msgSenduint64_tForKeyPrefix_profile_date_error_(void *a1, const char *a2, ...)
{
  return MEMORY[0x1E0DE7D20](a1, seluint64_tForKeyPrefix_profile_date_error_);
}

