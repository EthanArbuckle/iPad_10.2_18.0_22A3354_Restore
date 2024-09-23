@implementation ZZ34

const void **___ZZ34__DSFileProgress_progressChanged__ENK3__2cvU13block_pointerFvvEEv_block_invoke(uint64_t a1)
{
  NSProgress *v2;
  double v3;
  float v4;
  FINode *WeakRetained;
  const TNode *v6;
  const TProgressInfo *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  TNodePtr v12;
  TNodePtr v13[2];
  int v14;
  __int128 v15;
  int v16;
  __int128 v17;
  _QWORD v18[2];
  TString v19;
  __int128 v20;
  id v21[3];

  v13[0].fFINode = 0;
  v13[1].fFINode = 0;
  v14 = 0;
  v15 = 0uLL;
  v16 = 0;
  v17 = 0uLL;
  memset(v18, 0, 15);
  v19.fString.fRef = &stru_1E8752DF8;
  CFRetain(&stru_1E8752DF8);
  v20 = 0u;
  *(_OWORD *)v21 = 0u;
  HIDWORD(v18[0]) = TProgressInfo::ProgressStateFromProgress(*(TProgressInfo **)(a1 + 48), v2);
  objc_msgSend(*(id *)(a1 + 48), "fractionCompleted");
  *(float *)&v3 = v3 * 100.0;
  v4 = *(double *)(a1 + 64);
  v14 = LODWORD(v3);
  *(float *)&v18[1] = v4;
  BYTE5(v18[1]) = objc_msgSend(*(id *)(a1 + 48), "isPausable");
  BYTE4(v18[1]) = objc_msgSend(*(id *)(a1 + 48), "isCancellable");
  v13[0].fFINode = (FINode *)objc_msgSend(*(id *)(a1 + 48), "totalUnitCount");
  v13[1].fFINode = (FINode *)objc_msgSend(*(id *)(a1 + 48), "completedUnitCount");
  BYTE4(v18[1]) = objc_msgSend(*(id *)(a1 + 48), "isCancellable");
  if (&v19 != (TString *)(a1 + 40))
    TString::SetStringRefAsImmutable(&v19, *(TString **)(a1 + 40));
  objc_storeStrong(v21, *(id *)(a1 + 48));
  if (operator==((void **)(a1 + 40), CFSTR("UbiquityOperationType")))
  {
    if (*(_BYTE *)(a1 + 56))
    {
      v15 = *(_OWORD *)&v13[0].fFINode;
      v16 = v14;
    }
    if (*(_BYTE *)(a1 + 57))
    {
      v17 = *(_OWORD *)&v13[0].fFINode;
      LODWORD(v18[0]) = v14;
    }
  }
  WeakRetained = (FINode *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (const TNode *)TNodeFromFINode(WeakRetained);
  TNodePtr::TNodePtr(&v12, v6);
  TProgressMap::UpdateExternalProgress(&v12, v13, v7);

  v8 = (std::__shared_weak_count *)*((_QWORD *)&v20 + 1);
  if (*((_QWORD *)&v20 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v20 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v19.fString.fRef);
}

@end
