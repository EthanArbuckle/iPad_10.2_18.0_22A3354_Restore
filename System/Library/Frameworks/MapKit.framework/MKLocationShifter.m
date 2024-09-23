@implementation MKLocationShifter

void __58___MKLocationShifter_shiftLocation_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v4, "horizontalAccuracy");
  objc_msgSend(v5, "shiftLatLng:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v7, v6, 0, 0, MEMORY[0x1E0C80D38]);

}

void __72___MKLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  double v9;
  double v10;
  _QWORD v11[4];
  id v12;

  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v7 = a3;
  v8 = a2;
  objc_msgSend(v5, "horizontalAccuracy");
  v10 = v9;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72___MKLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_2;
  v11[3] = &unk_1E20D9AF8;
  v12 = *(id *)(a1 + 56);
  objc_msgSend(v6, "shiftLatLng:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v8, v7, 0, v11, *(_QWORD *)(a1 + 48), v10);

}

uint64_t __72___MKLocationShifter_shiftLocation_withCompletionHandler_callbackQueue___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __91___MKLocationShifter__prepareShiftForLocation_withCompletionHandler_withShiftRequestBlock___block_invoke(uint64_t a1, double a2, double a3)
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _OWORD v11[8];
  _OWORD v12[4];
  __int128 v13;
  _OWORD v14[2];
  __int128 v15;
  _OWORD v16[4];

  v15 = 0u;
  memset(v16, 0, 60);
  memset(v14, 0, sizeof(v14));
  v13 = 0u;
  memset(&v12[2], 0, 32);
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "clientLocation");
    v6 = *(void **)(a1 + 32);
  }
  *(double *)((char *)&v12[2] + 4) = a2;
  *(double *)((char *)&v12[2] + 12) = a3;
  objc_msgSend(v6, "rawCourse");
  *(_QWORD *)((char *)v14 + 12) = v7;
  *(double *)((char *)v16 + 4) = a2;
  *(double *)((char *)v16 + 12) = a3;
  DWORD1(v16[2]) = 2;
  v8 = objc_alloc(MEMORY[0x1E0C9E3B8]);
  objc_msgSend(*(id *)(a1 + 32), "coarseMetaData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v16[0];
  v11[7] = v16[1];
  v12[0] = v16[2];
  *(_OWORD *)((char *)v12 + 12) = *(_OWORD *)((char *)&v16[2] + 12);
  v11[2] = v13;
  v11[3] = v14[0];
  v11[4] = v14[1];
  v11[5] = v15;
  v11[0] = v12[2];
  v11[1] = v12[3];
  v10 = (void *)objc_msgSend(v8, "initWithClientLocation:coarseMetaData:", v11, v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
