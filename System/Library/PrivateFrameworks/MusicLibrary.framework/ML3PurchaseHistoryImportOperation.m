@implementation ML3PurchaseHistoryImportOperation

- (unint64_t)importSource
{
  return 1;
}

- (void)main
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  int v9;
  int v10;
  double v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[ML3ImportOperation import](self, "import");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trackData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3PurchaseHistoryImportOperation.mm"), 35, CFSTR("Attempted to start purchase history import operation without DAAP payload."));

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v7 = v6;
  if (*((_BYTE *)v16 + 24) && (-[ML3PurchaseHistoryImportOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__ML3PurchaseHistoryImportOperation_main__block_invoke;
    v14[3] = &unk_1E5B65CC8;
    v14[4] = self;
    v14[5] = &v15;
    -[ML3ImportOperation _writerTransactionWithBlock:](self, "_writerTransactionWithBlock:", v14);
  }
  v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[ML3PurchaseHistoryImportOperation isCancelled](self, "isCancelled");
    v10 = *((unsigned __int8 *)v16 + 24);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    *(_DWORD *)buf = 67109632;
    v20 = v9;
    v21 = 1024;
    v22 = v10;
    v23 = 2048;
    v24 = v11 - v7;
    _os_log_impl(&dword_1AC149000, v8, OS_LOG_TYPE_DEFAULT, "[MLPurchaseHistoryImportOperation] Purchase history import operation cancelled=%d success=%d. total time = %.2fs", buf, 0x18u);
  }

  if (*((_BYTE *)v16 + 24))
    v12 = -[ML3PurchaseHistoryImportOperation isCancelled](self, "isCancelled") ^ 1;
  else
    v12 = 0;
  -[ML3ImportOperation setSuccess:](self, "setSuccess:", v12);
  _Block_object_dispose(&v15, 8);

}

- (BOOL)_performPurchaseHistoryImportWithTransaction:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3ImportOperation import](self, "import");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = objc_msgSend(v5, "preferredVideoQuality");
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "importing purchased tracks. import.preferredVideoQuality=%lld", buf, 0xCu);
  }

  if ((-[ML3PurchaseHistoryImportOperation isCancelled](self, "isCancelled") & 1) != 0)
    goto LABEL_8;
  v7 = -[ML3DAAPImportOperation performImportOfSourceType:usingConnection:](self, "performImportOfSourceType:usingConnection:", 4, v4);
  v8 = os_log_create("com.apple.amp.medialibrary", "Default");
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "successfully processed import data", buf, 2u);
    }

LABEL_8:
    if ((-[ML3PurchaseHistoryImportOperation isCancelled](self, "isCancelled") & 1) == 0)
    {
      objc_msgSend(v5, "library");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, v10);

      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __82__ML3PurchaseHistoryImportOperation__performPurchaseHistoryImportWithTransaction___block_invoke;
      v13[3] = &unk_1E5B5F880;
      objc_copyWeak(&v14, (id *)buf);
      objc_msgSend(v4, "enqueueBlockForTransactionCommit:", v13);
      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
    v11 = 1;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_ERROR, "failed to process import data", buf, 2u);
  }

  v11 = 0;
LABEL_14:

  return v11;
}

- (shared_ptr<ML3DAAPImportItem>)importItemFromDAAPElement:(shared_ptr<ML3CPP::Element>)a3
{
  _QWORD *v3;
  Element *var0;
  _QWORD *v6;
  _QWORD *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  int64_t v28;
  int v29;
  int64_t v30;
  int v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  int v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  _QWORD *v41;
  ML3DAAPImportItem *v42;
  __shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  _QWORD *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  std::__shared_weak_count *v50;
  ML3CPP::Element *v51;
  std::__shared_weak_count *v52;
  uint64_t v53;
  std::__shared_weak_count *v54;
  shared_ptr<ML3DAAPImportItem> result;

  var0 = a3.var0;
  v6 = v3;
  v7 = (_QWORD *)operator new();
  v8 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v49 = *(_QWORD *)var0;
  v50 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  -[ML3ImportOperation import](self, "import");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "preferredVideoQuality");
  -[ML3ImportOperation import](self, "import");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v11;
  v13 = objc_msgSend(v47, "storeAccountID");
  if (v50)
  {
    v14 = (unint64_t *)&v50->__shared_owners_;
    do
      v15 = __ldxr(v14);
    while (__stxr(v15 + 1, v14));
  }
  ML3DAAPTrackImportItem::ML3DAAPTrackImportItem((uint64_t)v7, v49, v50);
  v46 = v6;
  if (v50)
  {
    v16 = (unint64_t *)&v50->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  *v7 = &off_1E5B4F168;
  v7[10] = v12;
  v7[11] = v13;
  v7[12] = 0;
  v7[13] = 0;
  ML3CPP::Element::childElementForCode((ML3CPP::Element *)&v53, v7[8], 0x6165666Cu);
  if (v53)
  {
    v18 = *(_QWORD *)(v53 + 80) - *(_QWORD *)(v53 + 72);
    if (v18)
    {
      v19 = 0;
      v20 = 0;
      v21 = v18 >> 4;
      do
      {
        v22 = *(_QWORD *)(v53 + 72);
        v23 = *(_OWORD *)(v22 + 16 * v19);
        v24 = *(std::__shared_weak_count **)(v22 + 16 * v19 + 8);
        if (v24)
        {
          v25 = (unint64_t *)&v24->__shared_owners_;
          do
            v26 = __ldxr(v25);
          while (__stxr(v26 + 1, v25));
        }
        v27 = v23;
        ML3CPP::Element::childElementForCode((ML3CPP::Element *)&v51, v23, 0x61654844u);
        if (v51)
        {
          v28 = ML3CPP::Element::integerValue(v51);
          if (v28 == v7[10])
          {
            v29 = 1;
LABEL_24:
            std::shared_ptr<ML3CPP::Element>::operator=[abi:ne180100](v7 + 12, v27, (uint64_t)v24);
            v31 = v29;
            goto LABEL_25;
          }
          v30 = v28;
          if (v28 > v20)
          {
            std::shared_ptr<ML3CPP::Element>::operator=[abi:ne180100](v7 + 12, v27, (uint64_t)v24);
            v20 = v30;
          }
        }
        v29 = 0;
        v31 = 0;
        if (!v7[12])
          goto LABEL_24;
LABEL_25:
        v32 = v52;
        if (!v52)
          goto LABEL_29;
        v33 = (unint64_t *)&v52->__shared_owners_;
        do
          v34 = __ldaxr(v33);
        while (__stlxr(v34 - 1, v33));
        if (!v34)
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
          if (v24)
          {
LABEL_30:
            v35 = (unint64_t *)&v24->__shared_owners_;
            do
              v36 = __ldaxr(v35);
            while (__stlxr(v36 - 1, v35));
            if (!v36)
            {
              ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
              std::__shared_weak_count::__release_weak(v24);
            }
          }
        }
        else
        {
LABEL_29:
          if (v24)
            goto LABEL_30;
        }
        if (++v19 == v21)
          v37 = 1;
        else
          v37 = v31;
      }
      while (v37 != 1);
    }
  }
  v38 = v54;
  if (v54)
  {
    v39 = (unint64_t *)&v54->__shared_owners_;
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  *v46 = v7;
  v41 = (_QWORD *)operator new();
  *v41 = &off_1E5B51CA8;
  v41[1] = 0;
  v41[2] = 0;
  v41[3] = v7;
  v46[1] = v41;

  if (v50)
  {
    v44 = (unint64_t *)&v50->__shared_owners_;
    do
      v45 = __ldaxr(v44);
    while (__stlxr(v45 - 1, v44));
    if (!v45)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  result.var1 = v43;
  result.var0 = v42;
  return result;
}

void __82__ML3PurchaseHistoryImportOperation__performPurchaseHistoryImportWithTransaction___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "notifyContentsDidChange");

}

uint64_t __41__ML3PurchaseHistoryImportOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_performPurchaseHistoryImportWithTransaction:", v5);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  }
  v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  return v7;
}

@end
