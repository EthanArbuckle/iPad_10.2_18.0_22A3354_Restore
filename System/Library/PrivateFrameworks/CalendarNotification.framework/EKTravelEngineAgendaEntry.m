@implementation EKTravelEngineAgendaEntry

- (EKTravelEngineAgendaEntry)initWithRouteHypothesizerProvider:(id)a3
{
  id v5;
  EKTravelEngineAgendaEntry *v6;
  EKTravelEngineAgendaEntry *v7;
  id v8;
  const char *v9;
  dispatch_queue_t v10;
  id v11;
  const char *v12;
  dispatch_queue_t v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)EKTravelEngineAgendaEntry;
  v6 = -[EKTravelEngineAgendaEntry init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_hypothesizerProvider, a3);
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");

    v10 = dispatch_queue_create(v9, 0);
    -[EKTravelEngineAgendaEntry setWorkQueue:](v7, "setWorkQueue:", v10);

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");

    v13 = dispatch_queue_create(v12, 0);
    -[EKTravelEngineAgendaEntry setCallbackQueue:](v7, "setCallbackQueue:", v13);

    -[EKTravelEngineAgendaEntry setTravelTimeThresholdExceededState:](v7, "setTravelTimeThresholdExceededState:", 0);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[EKTravelEngineAgendaEntry _uninstallRequestHypothesisRefreshTimer](self, "_uninstallRequestHypothesisRefreshTimer");
  v3.receiver = self;
  v3.super_class = (Class)EKTravelEngineAgendaEntry;
  -[EKTravelEngineAgendaEntry dealloc](&v3, sel_dealloc);
}

- (void)updateHypothesizerIfNecessaryWithOriginalEvent:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Update with original event requested: [%@]. This checks if the event has changed enough to qualify generating another hypothesis.", buf, 0xCu);
  }
  -[EKTravelEngineAgendaEntry workQueue](self, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke;
  v8[3] = &unk_24D484760;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, v8);

}

void __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  os_log_t *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  os_log_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  os_log_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  void *v21;
  EKTravelEngineThrottle *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  _BOOL4 v33;
  os_log_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  os_log_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  void *v48;
  int v49;
  os_log_t v50;
  void *v51;
  _QWORD block[5];
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD v62[5];
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "originalEventInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "setOriginalEventInternal:", *(_QWORD *)(a1 + 40));
  v4 = (os_log_t *)MEMORY[0x24BDC7450];
  v5 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412290;
    v65 = v6;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Latest Hypothesis [%@]", buf, 0xCu);
  }
  v7 = MEMORY[0x24BDAC760];
  if (v3)
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v8 + 16) || (v9 = *(void **)(v8 + 88)) == 0 || objc_msgSend(v9, "state") == 2)
    {
      v10 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(void **)(v11 + 16);
        v13 = *(void **)(v11 + 88);
        v14 = v10;
        v15 = objc_msgSend(v13, "state");
        *(_DWORD *)buf = 138412802;
        v65 = v12;
        v66 = 2112;
        v67 = v13;
        v68 = 2048;
        v69 = v15;
        _os_log_impl(&dword_215D9B000, v14, OS_LOG_TYPE_DEFAULT, "There is no hypothesis, or non-functional hypothesizer. Regenerating a new hypothesizer. latestHypothesis:[%@] hypothesizer:[%@] hypothesizer state:[%ld]", buf, 0x20u);

      }
      goto LABEL_12;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "creationDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
      goto LABEL_20;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "creationDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "timeIntervalSinceDate:", v31);
    v33 = v32 > 1800.0;

    if (v33)
    {
LABEL_20:
      v34 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        v35 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
        v36 = v34;
        objc_msgSend(v35, "creationDate");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
        *(_DWORD *)buf = 138412546;
        v65 = v37;
        v66 = 2112;
        v67 = v38;
        _os_log_impl(&dword_215D9B000, v36, OS_LOG_TYPE_DEFAULT, "Last generated hypothesis is too old. Should hypothesize again. _latestHypothesis.creationDate = %@. _latestHypothesis = %@.", buf, 0x16u);

      }
      goto LABEL_12;
    }
    v39 = objc_msgSend(v3, "isEqualToOriginalEvent:", *(_QWORD *)(a1 + 40));
    v40 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v41 = (void *)MEMORY[0x24BDD16E0];
      v42 = v40;
      objc_msgSend(v41, "numberWithBool:", v39 ^ 1u);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v65 = v43;
      v66 = 2112;
      v67 = v44;
      _os_log_impl(&dword_215D9B000, v42, OS_LOG_TYPE_DEFAULT, "Event has significantly changed: [%@].  Original event: [%@]", buf, 0x16u);

    }
    if ((v39 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "entrySignificantlyChangedBlock");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
        v46 = objc_claimAutoreleasedReturnValue();
        v62[0] = v7;
        v62[1] = 3221225472;
        v62[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_8;
        v62[3] = &unk_24D484DE0;
        v47 = v45;
        v62[4] = *(_QWORD *)(a1 + 32);
        v63 = v47;
        dispatch_async(v46, v62);

      }
    }
    objc_msgSend(MEMORY[0x24BDC74D0], "shared");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "performAgendaEntryEqualityChecksInTravelEngine");

    if (v49)
    {
      if ((v39 & 1) != 0)
        goto LABEL_17;
      goto LABEL_12;
    }
    v50 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v51 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v65 = v51;
      v17 = "No equality check was performed.  Original event: [%@]";
      v18 = v50;
      v19 = 12;
      goto LABEL_11;
    }
  }
  else
  {
    v16 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v17 = "There was no previous original event, so event has significantly changed. Should attempt to hypothesize.";
      v18 = v16;
      v19 = 2;
LABEL_11:
      _os_log_impl(&dword_215D9B000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    }
  }
LABEL_12:
  v20 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    v21 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v65 = v3;
    v66 = 2112;
    v67 = v21;
    _os_log_impl(&dword_215D9B000, v20, OS_LOG_TYPE_DEFAULT, "Will attempt to hypothesize.  Previous original event: [%@] Original event: [%@]", buf, 0x16u);
  }
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_clearEverything");
  v22 = objc_alloc_init(EKTravelEngineThrottle);
  objc_msgSend(*(id *)(a1 + 32), "setThrottle:", v22);

  objc_msgSend(*(id *)(a1 + 40), "eventExternalURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "throttle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setEventExternalURL:", v23);

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v59[0] = v7;
  v59[1] = 3221225472;
  v59[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_12;
  v59[3] = &unk_24D485510;
  objc_copyWeak(&v61, (id *)buf);
  v60 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "throttle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setRequestHypothesisRefreshBlock:", v59);

  v56[0] = v7;
  v56[1] = 3221225472;
  v56[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_2;
  v56[3] = &unk_24D485538;
  objc_copyWeak(&v58, (id *)buf);
  v57 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "throttle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setCancelHypothesisRequestRefreshBlock:", v56);

  v53[0] = v7;
  v53[1] = 3221225472;
  v53[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_2_16;
  v53[3] = &unk_24D485538;
  objc_copyWeak(&v55, (id *)buf);
  v54 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "throttle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setEmissionBlock:", v53);

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_3;
  block[3] = &unk_24D484738;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v28, block);

  objc_destroyWeak(&v55);
  objc_destroyWeak(&v58);

  objc_destroyWeak(&v61);
  objc_destroyWeak((id *)buf);
LABEL_17:

}

uint64_t __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Firing request hypothesis refresh block in travel engine for [%@]", buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_13;
    v8[3] = &unk_24D484760;
    v8[4] = WeakRetained;
    v9 = v3;
    dispatch_async(v7, v8);

  }
}

uint64_t __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createEmissionHypothesisRefreshTimerWithDate:", *(_QWORD *)(a1 + 40));
}

void __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Firing cancel hypothesis request block in travel engine for [%@]", buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_15;
    block[3] = &unk_24D484738;
    block[4] = WeakRetained;
    dispatch_async(v5, block);

  }
}

uint64_t __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelEmissionHypothesisRefresh");
}

void __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_2_16(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v8 = v4;
      _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Firing emission block in travel engine for [%@]", buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "workQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_17;
    block[3] = &unk_24D484738;
    block[4] = WeakRetained;
    dispatch_async(v5, block);

  }
}

void __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_17(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "updateBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_2_18;
    v5[3] = &unk_24D484DE0;
    v4 = v2;
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    dispatch_async(v3, v5);

  }
}

uint64_t __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_2_18(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __76__EKTravelEngineAgendaEntry_updateHypothesizerIfNecessaryWithOriginalEvent___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enhanceLocation");
}

- (void)_hypothesisRefreshTimerFired
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[EKTravelEngineAgendaEntry hypothesizer](self, "hypothesizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)*MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[EKTravelEngineAgendaEntry hypothesizer](self, "hypothesizer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Requesting refresh for hypothesizer, %@", (uint8_t *)&v8, 0xCu);

    }
    -[EKTravelEngineAgendaEntry hypothesizer](self, "hypothesizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestRefresh");

  }
}

- (void)_requestHypothesisRefreshTimerFired
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Request hypothesis refresh timer fired", v4, 2u);
  }
  -[EKTravelEngineAgendaEntry _hypothesisRefreshTimerFired](self, "_hypothesisRefreshTimerFired");
  -[EKTravelEngineAgendaEntry _uninstallRequestHypothesisRefreshTimer](self, "_uninstallRequestHypothesisRefreshTimer");
}

- (void)_emissionHypothesisRefreshTimerFired
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Emission hypothesis refresh timer fired", v4, 2u);
  }
  -[EKTravelEngineAgendaEntry _hypothesisRefreshTimerFired](self, "_hypothesisRefreshTimerFired");
  -[EKTravelEngineAgendaEntry _uninstallEmissionHypothesisRefreshTimer](self, "_uninstallEmissionHypothesisRefreshTimer");
}

- (void)requestHypothesisRefreshAtDate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EKTravelEngineAgendaEntry hypothesizer](self, "hypothesizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[EKTravelEngineAgendaEntry _createHypothesisRequestRefreshTimerWithDate:](self, "_createHypothesisRequestRefreshTimerWithDate:", v5);

}

- (void)createAlarmWithName:(id)a3 atDate:(id)a4
{
  id v5;
  id v6;
  double v7;
  NSObject *v8;
  int64_t v9;
  xpc_object_t v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "timeIntervalSinceNow");
  if (v7 >= 0.0)
  {
    v9 = (unint64_t)((ceil(v7) + (double)time(0)) * 1000000000.0);
    v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_date(v10, (const char *)*MEMORY[0x24BE14018], v9);
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    xpc_set_event();

  }
  else
  {
    v8 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_ERROR))
      -[EKTravelEngineAgendaEntry createAlarmWithName:atDate:].cold.1((uint64_t)v5, (uint64_t)v6, v8);
  }

}

- (void)removeAlarmWithName:(id)a3
{
  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  xpc_set_event();
}

- (void)_createHypothesisRequestRefreshTimerWithDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  EKTravelEngineAgendaEntry *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[EKTravelEngineAgendaEntry requestHypothesisRefreshAlarmName](self, "requestHypothesisRefreshAlarmName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTravelEngineAgendaEntry createAlarmWithName:atDate:](self, "createAlarmWithName:atDate:", v5, v4);

  v6 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Created a new request refresh timer that will fire at: [%@] for entry: [%@]", (uint8_t *)&v7, 0x16u);
  }

}

- (void)_uninstallRequestHypothesisRefreshTimer
{
  NSObject *v3;
  void *v4;
  int v5;
  EKTravelEngineAgendaEntry *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Uninstalling request refresh timer for agenda entry: [%@].", (uint8_t *)&v5, 0xCu);
  }
  -[EKTravelEngineAgendaEntry requestHypothesisRefreshAlarmName](self, "requestHypothesisRefreshAlarmName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTravelEngineAgendaEntry removeAlarmWithName:](self, "removeAlarmWithName:", v4);

}

- (void)_createEmissionHypothesisRefreshTimerWithDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  EKTravelEngineAgendaEntry *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[EKTravelEngineAgendaEntry emissionHypothesisRefreshAlarmName](self, "emissionHypothesisRefreshAlarmName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTravelEngineAgendaEntry createAlarmWithName:atDate:](self, "createAlarmWithName:atDate:", v5, v4);

  v6 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = self;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Created a new emission refresh timer that will fire at: [%@] for entry: [%@]", (uint8_t *)&v7, 0x16u);
  }

}

- (void)_uninstallEmissionHypothesisRefreshTimer
{
  NSObject *v3;
  void *v4;
  int v5;
  EKTravelEngineAgendaEntry *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_215D9B000, v3, OS_LOG_TYPE_DEFAULT, "Uninstalling emission refresh timer for agenda entry: [%@].", (uint8_t *)&v5, 0xCu);
  }
  -[EKTravelEngineAgendaEntry emissionHypothesisRefreshAlarmName](self, "emissionHypothesisRefreshAlarmName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTravelEngineAgendaEntry removeAlarmWithName:](self, "removeAlarmWithName:", v4);

}

- (void)reset
{
  NSObject *v3;
  _QWORD block[5];

  -[EKTravelEngineAgendaEntry workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__EKTravelEngineAgendaEntry_reset__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __34__EKTravelEngineAgendaEntry_reset__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_performAnalyticsPostProcessing");
  return objc_msgSend(*(id *)(a1 + 32), "_clearEverything");
}

- (EKTravelEngineHypothesis)latestHypothesis
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  -[EKTravelEngineAgendaEntry workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__EKTravelEngineAgendaEntry_latestHypothesis__block_invoke;
  v6[3] = &unk_24D484A08;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (EKTravelEngineHypothesis *)v4;
}

void __45__EKTravelEngineAgendaEntry_latestHypothesis__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (EKTravelEngineOriginalEvent)originalEvent
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  -[EKTravelEngineAgendaEntry workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__EKTravelEngineAgendaEntry_originalEvent__block_invoke;
  v6[3] = &unk_24D484A08;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (EKTravelEngineOriginalEvent *)v4;
}

void __42__EKTravelEngineAgendaEntry_originalEvent__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "originalEventInternal");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (double)fuzzyMaximumInitialUpdateIntervalBeforeStartDate
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDC7568], "maximumAllowableTravelTime");
  v3 = v2;
  +[EKTravelEngineThrottle emissionThresholdTimeInterval](EKTravelEngineThrottle, "emissionThresholdTimeInterval");
  return v3 + v4;
}

- (void)sendFeedbackForPostingLeaveByNotification
{
  -[EKTravelEngineAgendaEntry _sendFeedbackToHypothesizerForPostingNotification:](self, "_sendFeedbackToHypothesizerForPostingNotification:", 1);
}

- (void)sendFeedbackForPostingLeaveNowNotification
{
  -[EKTravelEngineAgendaEntry _sendFeedbackToHypothesizerForPostingNotification:](self, "_sendFeedbackToHypothesizerForPostingNotification:", 2);
}

- (void)_accountForGeocodedEventEncounter
{
  id v3;

  if (!-[EKTravelEngineAgendaEntry geocodedEventEncountered](self, "geocodedEventEncountered"))
  {
    -[EKTravelEngineAgendaEntry setGeocodedEventEncountered:](self, "setGeocodedEventEncountered:", 1);
    CalAnalyticsSendEvent();
    -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[EKTravelEngineAgendaEntry _trackTTLCandidateEvent:](self, "_trackTTLCandidateEvent:", v3);

  }
}

- (void)_trackTTLCandidateEvent:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "hasPredictedLocation");
  v5 = objc_msgSend(v3, "isOnSharedCalendar");

  objc_msgSend(MEMORY[0x24BE14008], "trackTTLCandidateEventHasSuggestedLocation:isOnSharedCalendar:", v4, v5);
}

- (void)_updateTravelTimeExceededThresholdStateUsingExceededValue:(BOOL)a3
{
  _BOOL4 v3;
  int64_t v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[EKTravelEngineAgendaEntry travelTimeThresholdExceededState](self, "travelTimeThresholdExceededState");
  switch(v5)
  {
    case 3:
      if (v3)
        return;
      goto LABEL_10;
    case 1:
      if (!v3)
        return;
LABEL_10:
      v6 = 2;
LABEL_11:
      -[EKTravelEngineAgendaEntry setTravelTimeThresholdExceededState:](self, "setTravelTimeThresholdExceededState:", v6);
      return;
    case 0:
      if (v3)
        v6 = 3;
      else
        v6 = 1;
      goto LABEL_11;
  }
}

- (void)_performAnalyticsPostProcessing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("hypothesizerActivated");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[EKTravelEngineAgendaEntry hypothesizer](self, "hypothesizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", v4 != 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("hypothesizerSentHypothesis");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[EKTravelEngineAgendaEntry hypothesizerSentAtLeastOneHypothesis](self, "hypothesizerSentAtLeastOneHypothesis"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("travelTimeThresholdExceededState");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[EKTravelEngineAgendaEntry travelTimeThresholdExceededState](self, "travelTimeThresholdExceededState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  v11[3] = CFSTR("maximumTravelDurationEncountered");
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[EKTravelEngineAgendaEntry maximumTravelDurationEncountered](self, "maximumTravelDurationEncountered");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  CalAnalyticsSendEvent();
}

- (id)requestHypothesisRefreshAlarmName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventExternalURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@agendaEntry-%@"), CFSTR("com.apple.calaccessd.travelEngine."), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)emissionHypothesisRefreshAlarmName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD16E0];
  -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventExternalURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@agendaEntry-emi-%@"), CFSTR("com.apple.calaccessd.travelEngine."), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)receivedAlarmNamed:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD *v11;
  _QWORD v13[5];
  _QWORD v14[5];

  v4 = a3;
  -[EKTravelEngineAgendaEntry requestHypothesisRefreshAlarmName](self, "requestHypothesisRefreshAlarmName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  -[EKTravelEngineAgendaEntry emissionHypothesisRefreshAlarmName](self, "emissionHypothesisRefreshAlarmName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqualToString:", v7);

  if (v6)
  {
    -[EKTravelEngineAgendaEntry workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __48__EKTravelEngineAgendaEntry_receivedAlarmNamed___block_invoke;
    v14[3] = &unk_24D484738;
    v14[4] = self;
    v11 = v14;
LABEL_5:
    dispatch_sync(v9, v11);

    return 1;
  }
  if (v8)
  {
    -[EKTravelEngineAgendaEntry workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __48__EKTravelEngineAgendaEntry_receivedAlarmNamed___block_invoke_2;
    v13[3] = &unk_24D484738;
    v13[4] = self;
    v11 = v13;
    goto LABEL_5;
  }
  return 0;
}

uint64_t __48__EKTravelEngineAgendaEntry_receivedAlarmNamed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestHypothesisRefreshTimerFired");
}

uint64_t __48__EKTravelEngineAgendaEntry_receivedAlarmNamed___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_emissionHypothesisRefreshTimerFired");
}

- (void)_sendFeedbackToHypothesizerForPostingNotification:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[EKTravelEngineAgendaEntry workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__EKTravelEngineAgendaEntry__sendFeedbackToHypothesizerForPostingNotification___block_invoke;
  v6[3] = &unk_24D485560;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void __79__EKTravelEngineAgendaEntry__sendFeedbackToHypothesizerForPostingNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "hypothesizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)*MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)MEMORY[0x24BDD16E0];
      v5 = *(_QWORD *)(a1 + 40);
      v6 = v3;
      objc_msgSend(v4, "numberWithUnsignedInteger:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "originalEventInternal");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Sending UI feedback to the hypothesizer.  Notification type: [%@].  Original event: [%@]", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(v2, "didPostUINotification:", *(_QWORD *)(a1 + 40));
  }

}

- (void)_clearEverything
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Clearing all state in the agenda entry for original event: [%@]", (uint8_t *)&v12, 0xCu);

  }
  -[EKTravelEngineAgendaEntry setLatestHypothesis:](self, "setLatestHypothesis:", 0);
  -[EKTravelEngineAgendaEntry setGeoLocation:](self, "setGeoLocation:", 0);
  -[EKTravelEngineAgendaEntry setMapKitHandle:](self, "setMapKitHandle:", 0);
  -[EKTravelEngineAgendaEntry setTravelTimeThresholdExceededState:](self, "setTravelTimeThresholdExceededState:", 0);
  -[EKTravelEngineAgendaEntry setHypothesizerSentAtLeastOneHypothesis:](self, "setHypothesizerSentAtLeastOneHypothesis:", 0);
  -[EKTravelEngineAgendaEntry setMaximumTravelDurationEncountered:](self, "setMaximumTravelDurationEncountered:", 0.0);
  -[EKTravelEngineAgendaEntry geocoder](self, "geocoder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  -[EKTravelEngineAgendaEntry setGeocoder:](self, "setGeocoder:", 0);
  -[EKTravelEngineAgendaEntry hypothesizer](self, "hypothesizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopHypothesizing");

  -[EKTravelEngineAgendaEntry setHypothesizer:](self, "setHypothesizer:", 0);
  -[EKTravelEngineAgendaEntry hypothesizerProvider](self, "hypothesizerProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventExternalURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removedRouteHypothesizerForEventExternalURL:", v10);

  -[EKTravelEngineAgendaEntry throttle](self, "throttle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tearDown");

  -[EKTravelEngineAgendaEntry setThrottle:](self, "setThrottle:", 0);
  -[EKTravelEngineAgendaEntry _uninstallRequestHypothesisRefreshTimer](self, "_uninstallRequestHypothesisRefreshTimer");
}

- (void)_enhanceLocation
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  os_log_t *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  __CFString *v34;
  id v35;
  id v36;
  id location;
  uint8_t buf[4];
  void *v39;
  _QWORD v40[4];
  _QWORD v41[6];

  v41[4] = *MEMORY[0x24BDAC8D0];
  -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locationMapKitHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  objc_msgSend(v2, "geoLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v2, "locationIsAConferenceRoom");
  v7 = objc_msgSend(v2, "automaticGeocodingAllowed");
  v40[0] = CFSTR("hasLocationMapKitHandle");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v8;
  v40[1] = CFSTR("hasGeoLocation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5 != 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v9;
  v40[2] = CFSTR("locationIsAConferenceRoom");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v10;
  v40[3] = CFSTR("automaticGeocodingAllowed");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v14 = (os_log_t *)MEMORY[0x24BDC7450];
  v15 = *MEMORY[0x24BDC7450];
  v16 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v39 = v2;
      _os_log_impl(&dword_215D9B000, v15, OS_LOG_TYPE_DEFAULT, "A map handle already exists on the event.  Will not enhance location by geocoding the location string.  Original event: [%@]", buf, 0xCu);
    }
    objc_msgSend(v2, "locationMapKitHandle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKTravelEngineAgendaEntry setMapKitHandle:](self, "setMapKitHandle:", v17);

    -[EKTravelEngineAgendaEntry _setUpRouteMonitoring](self, "_setUpRouteMonitoring");
    CalAnalyticsSendEvent();
  }
  else if (v5)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v39 = v2;
      _os_log_impl(&dword_215D9B000, v15, OS_LOG_TYPE_DEFAULT, "A geolocation already exists on the event.  Will not enhance location by geocoding the location string.  Original event: [%@]", buf, 0xCu);
    }
    objc_msgSend(v2, "geoLocation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKTravelEngineAgendaEntry setGeoLocation:](self, "setGeoLocation:", v18);

    -[EKTravelEngineAgendaEntry _setUpRouteMonitoring](self, "_setUpRouteMonitoring");
    CalAnalyticsSendEvent();
  }
  else if ((_DWORD)v6)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v39 = v2;
      _os_log_impl(&dword_215D9B000, v15, OS_LOG_TYPE_DEFAULT, "The location is a conference room without structured location information.  Will not proceed to monitor route.  Original event: [%@].", buf, 0xCu);
    }
    CalAnalyticsSendEvent();
  }
  else
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v39 = v2;
      _os_log_impl(&dword_215D9B000, v15, OS_LOG_TYPE_DEFAULT, "No map handle or geolocation exists on the event.  Will enhance location by geocoding the location string.  Original event: [%@]", buf, 0xCu);
    }
    objc_initWeak(&location, self);
    if ((objc_msgSend(v2, "automaticGeocodingAllowed") & 1) != 0)
    {
      v19 = objc_alloc_init(MEMORY[0x24BE13FE0]);
      objc_msgSend(v19, "start");
      objc_msgSend(v2, "locationString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "hasPredictedLocation"))
      {
        objc_msgSend(v2, "locationStringWithoutPrediction");
        v21 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v21;
      }
      v22 = objc_alloc(MEMORY[0x24BE13FB0]);
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke;
      v30[3] = &unk_24D4855B0;
      v23 = v19;
      v31 = v23;
      objc_copyWeak(&v36, &location);
      v32 = v2;
      v33 = v13;
      v34 = CFSTR("travelEngine.enhanceLocation");
      v24 = v20;
      v35 = v24;
      v25 = (void *)objc_msgSend(v22, "initWithLocationString:andCompletionBlock:", v24, v30);
      -[EKTravelEngineAgendaEntry setGeocoder:](self, "setGeocoder:", v25);

      -[EKTravelEngineAgendaEntry geocoder](self, "geocoder");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "startGeocoding");

      objc_destroyWeak(&v36);
      v27 = v13;
    }
    else
    {
      v27 = v13;
      v28 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v2;
        _os_log_impl(&dword_215D9B000, v28, OS_LOG_TYPE_DEFAULT, "Automatic geocoding is not allowed yet. We will not attempt to geocode for this event [%@]", buf, 0xCu);
      }
    }
    objc_destroyWeak(&location);
    v13 = v27;
  }

}

void __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "stop");
  WeakRetained = objc_loadWeakRetained(a1 + 9);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke_2;
    v10[3] = &unk_24D485588;
    v11 = a1[4];
    v12 = a1[5];
    v13 = v6;
    v14 = v5;
    v15 = a1[6];
    v16 = a1[7];
    v17 = a1[8];
    v18 = v8;
    dispatch_async(v9, v10);

  }
}

void __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void **v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  int v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  const char *v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "elapsedTimeAsNumber:", 2);
  v3 = (os_log_t *)MEMORY[0x24BDC7450];
  v4 = (void *)*MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    v6 = v4;
    objc_msgSend(v5, "numberWithDouble:", (double)v2 / 1000.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v41 = v7;
    v42 = 2112;
    v43 = v8;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Geocoding complete.  Elapsed time: [%@] ms.  Original event: [%@]", buf, 0x16u);

  }
  v10 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10 != 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v11, CFSTR("gotError"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9 != 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v12, CFSTR("gotResult"));

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 48), "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v13, CFSTR("errorDomain"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "code"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v14, CFSTR("errorCode"));

    CalAnalyticsSendEvent();
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke_2_cold_1();
    return;
  }
  CalAnalyticsSendEvent();
  v15 = *v3;
  v16 = os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v16)
    {
      v17 = *(void **)(a1 + 80);
      v18 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      v41 = v17;
      v42 = 2112;
      v43 = v18;
      _os_log_impl(&dword_215D9B000, v15, OS_LOG_TYPE_DEFAULT, "Map item found after geocoding.  Location string: [%@].  Map item: [%@]", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 56), "_handle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 88), "setMapKitHandle:", v19);

    objc_msgSend(*(id *)(a1 + 56), "placemark");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "location");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 88), "setGeoLocation:", v21);

    v22 = (void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 40), "eventExternalURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(MEMORY[0x24BDC74D0], "shared");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "saveGeocodedLocationsInTravelEngine");

      if ((v25 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_alloc_init(MEMORY[0x24BDC74E8]);
        objc_msgSend(v27, "_eventWithURI:checkValid:", v26, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = *(_QWORD *)(a1 + 56);
        v39 = 0;
        v30 = objc_msgSend(v28, "updateWithGeocodedMapItemAndSaveWithCommit:eventStore:error:", v29, v27, &v39);
        v31 = v39;
        v32 = *v3;
        if (v30)
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = *v22;
            *(_DWORD *)buf = 138412290;
            v41 = v33;
            _os_log_impl(&dword_215D9B000, v32, OS_LOG_TYPE_DEFAULT, "Saved geocoding result to the database successfully. Original event: [%@].", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke_2_cold_2();
        }

        goto LABEL_25;
      }
      v35 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v38 = *v22;
        *(_DWORD *)buf = 138412290;
        v41 = v38;
        v37 = "'saveGeocodedLocationsInTravelEngine' set to 'NO.'  Will not save geocoding result to the database. Original event: [%@].";
        goto LABEL_21;
      }
    }
    else
    {
      v35 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v36 = *v22;
        *(_DWORD *)buf = 138412290;
        v41 = v36;
        v37 = "No event external URL found.  Will not save geocoding result to the database. Original event: [%@].";
LABEL_21:
        _os_log_impl(&dword_215D9B000, v35, OS_LOG_TYPE_DEFAULT, v37, buf, 0xCu);
      }
    }
LABEL_25:
    objc_msgSend(*(id *)(a1 + 88), "_setUpRouteMonitoring");

    return;
  }
  if (v16)
  {
    v34 = *(void **)(a1 + 80);
    *(_DWORD *)buf = 138412290;
    v41 = v34;
    _os_log_impl(&dword_215D9B000, v15, OS_LOG_TYPE_DEFAULT, "No geocoding results found.  Will not proceed to monitor route.  Location string: [%@].", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 88), "setDismissed:", 1);
}

- (void)_setUpRouteMonitoring
{
  os_log_t *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  os_log_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BDC7450];
  v4 = (void *)*MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v6;
    _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Setting up route monitoring.  Original event: [%@]", (uint8_t *)&v13, 0xCu);

  }
  -[EKTravelEngineAgendaEntry _generateDestination](self, "_generateDestination");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDC74D0], "shared");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "overrideTravelAdvisoryHypothesis");

    if (!v9)
    {
      -[EKTravelEngineAgendaEntry _accountForGeocodedEventEncounter](self, "_accountForGeocodedEventEncounter");
      -[EKTravelEngineAgendaEntry _createHypothesizerForDestination:](self, "_createHypothesizerForDestination:", v7);
      goto LABEL_10;
    }
    -[EKTravelEngineAgendaEntry _createSyntheticHypothesis](self, "_createSyntheticHypothesis");
    v10 = objc_claimAutoreleasedReturnValue();
    -[EKTravelEngineAgendaEntry _updateWithHypothesis:](self, "_updateWithHypothesis:", v10);
    goto LABEL_8;
  }
  v11 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v11;
    -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v12;
    _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, "No map handle or geolocation found.  Will not monitor routing for event.  Original event: [%@]", (uint8_t *)&v13, 0xCu);

LABEL_8:
  }
LABEL_10:

}

- (id)_generateDestination
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[EKTravelEngineAgendaEntry mapKitHandle](self, "mapKitHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)*MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v6;
      _os_log_impl(&dword_215D9B000, v5, OS_LOG_TYPE_DEFAULT, "Found map handle.  Will use to generate destination.  Original event: [%@]", (uint8_t *)&v24, 0xCu);

    }
    v7 = objc_alloc(MEMORY[0x24BE3CFD8]);
    -[EKTravelEngineAgendaEntry mapKitHandle](self, "mapKitHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithMapItemHandle:", v8);

    if (!v9)
      return v9;
LABEL_10:
    -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "startDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setArrivalDate:", v21);

    objc_msgSend(v20, "endDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExpirationDate:", v22);

    objc_msgSend(v9, "setTransportType:", objc_msgSend(v20, "transportTypeOverride"));
    return v9;
  }
  -[EKTravelEngineAgendaEntry geoLocation](self, "geoLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[EKTravelEngineAgendaEntry geoLocation](self, "geoLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinate");
    v12 = v11;
    v14 = v13;

    v15 = (void *)*MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412802;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_215D9B000, v16, OS_LOG_TYPE_DEFAULT, "Found geolocation.  Will use for route monitoring.  Original event: [%@].  Geocoordinates - Latitude: [%@], Longitude: [%@]", (uint8_t *)&v24, 0x20u);

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3CFD8]), "initWithCoordinate:", v12, v14);
    if (v9)
      goto LABEL_10;
  }
  return v9;
}

- (id)_createSyntheticHypothesis
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v36 = v5;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Creating a synthetic hypothesis.  Original event: [%@]", buf, 0xCu);

  }
  -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDC74D0], "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "overriddenTravelAdvisoryHypothesisConservativeTravelTime");
  v10 = v9;

  objc_msgSend(MEMORY[0x24BDC74D0], "shared");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "overriddenTravelAdvisoryHypothesisEstimatedTravelTime");
  v13 = v12;

  objc_msgSend(MEMORY[0x24BDC74D0], "shared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "overriddenTravelAdvisoryHypothesisAggressiveTravelTime");
  v16 = v15;

  objc_msgSend(MEMORY[0x24BDC7560], "syntheticHypothesisWithStartDate:conservativeTravelTime:estimatedTravelTime:aggressiveTravelTime:", v7, v10, v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDC74D0], "shared");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "overriddenTravelAdvisoryHypothesisTransportType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(MEMORY[0x24BDC7568], "geoTransportTypeForString:", v20);
  objc_msgSend(MEMORY[0x24BDC74D0], "shared");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "overriddenTravelAdvisoryHypothesisRouteName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDC74D0], "shared");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "overriddenTravelAdvisoryHypothesisSupportsLiveTraffic");

  objc_msgSend(MEMORY[0x24BDC74D0], "shared");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "overriddenTravelAdvisoryHypothesisCurrentTrafficDensity");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(MEMORY[0x24BDC7568], "geoTrafficDensityForString:", v27);
  objc_msgSend(MEMORY[0x24BDC74D0], "shared");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "overriddenTravelAdvisoryHypothesisTravelState");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(MEMORY[0x24BDC7568], "geoRouteHypothesisTravelStateForString:", v30);
  objc_msgSend(v18, "setTransportType:", v21);
  objc_msgSend(v18, "setRouteName:", v23);
  objc_msgSend(v18, "setSupportsLiveTraffic:", v25);
  objc_msgSend(v18, "setCurrentTrafficDensity:", v28);
  objc_msgSend(v18, "setTravelState:", v31);
  v32 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v18;
    _os_log_impl(&dword_215D9B000, v32, OS_LOG_TYPE_DEFAULT, "Created a synthetic hypothesis: [%@]", buf, 0xCu);
  }
  v33 = (void *)objc_msgSend(v18, "copy");

  return v33;
}

- (void)_createHypothesizerForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  EKTravelEngineAgendaEntry *v17;
  id v18;
  id v19;
  id location;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[EKTravelEngineAgendaEntry hypothesizerProvider](self, "hypothesizerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hypothesizerForPlannedDestination:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[EKTravelEngineAgendaEntry setHypothesizer:](self, "setHypothesizer:", v6);
  v7 = (void *)*MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = v4;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_215D9B000, v8, OS_LOG_TYPE_DEFAULT, "Creating hypothesizer to monitor routing.  Destination: [%@] Original event: [%@] Hypothesizer: [%@]", buf, 0x20u);

  }
  objc_initWeak((id *)buf, v6);
  objc_initWeak(&location, self);
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __63__EKTravelEngineAgendaEntry__createHypothesizerForDestination___block_invoke;
  v16 = &unk_24D485600;
  objc_copyWeak(&v18, (id *)buf);
  objc_copyWeak(&v19, &location);
  v17 = self;
  objc_msgSend(v6, "startHypothesizingWithUpdateHandler:", &v13);
  -[EKTravelEngineAgendaEntry hypothesizerProvider](self, "hypothesizerProvider", v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTravelEngineAgendaEntry originalEventInternal](self, "originalEventInternal");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "eventExternalURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createdRouteHypothesizer:forEventExternalURL:", v6, v12);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void __63__EKTravelEngineAgendaEntry__createHypothesizerForDestination___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unint64_t v4;
  void *v5;
  os_log_t *v6;
  NSObject *v7;
  __CFString *v8;
  NSObject *v9;
  __CFString *v10;
  id v11;
  void *v12;
  os_log_t v13;
  NSObject *v14;
  id v15;
  __CFString *v16;
  id v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "state");
    objc_msgSend(v3, "currentHypothesis");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (os_log_t *)MEMORY[0x24BDC7450];
    v7 = (id)*MEMORY[0x24BDC7450];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v4 >= 5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %lu)"), v4);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = off_24D485620[v4];
      }
      v10 = v8;
      v11 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v11, "originalEventInternal");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v8;
      v27 = 2112;
      v28 = v12;
      v29 = 2112;
      v30 = v5;
      _os_log_impl(&dword_215D9B000, v7, OS_LOG_TYPE_DEFAULT, "Hypothesizer updated to state: [%@].  Original event: [%@]. Hypothesis: [%@]", buf, 0x20u);

    }
    if (v4 == 4)
    {
      v13 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        v15 = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(v15, "originalEventInternal");
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v16;
        _os_log_impl(&dword_215D9B000, v14, OS_LOG_TYPE_DEFAULT, "Done hypothesizing for original event: [%@]", buf, 0xCu);

      }
    }
    else
    {
      v17 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v17, "workQueue");
      v18 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __63__EKTravelEngineAgendaEntry__createHypothesizerForDestination___block_invoke_64;
      block[3] = &unk_24D4855D8;
      objc_copyWeak(&v24, (id *)(a1 + 48));
      v19 = v5;
      v20 = *(_QWORD *)(a1 + 32);
      v22 = v19;
      v23 = v20;
      dispatch_async(v18, block);

      objc_destroyWeak(&v24);
    }

  }
  else
  {
    v9 = *MEMORY[0x24BDC7450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Hypothesizer is gone.  Returning early.", buf, 2u);
    }
  }

}

void __63__EKTravelEngineAgendaEntry__createHypothesizerForDestination___block_invoke_64(id *a1)
{
  os_log_t *v2;
  void *v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  void *v12;
  double v13;
  id v14;
  NSObject *v15;
  id v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BDC7450];
  v3 = (void *)*MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "originalEventInternal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v6;
    _os_log_impl(&dword_215D9B000, v4, OS_LOG_TYPE_DEFAULT, "Analyzing hypothesis for original event: [%@]", (uint8_t *)&v17, 0xCu);

  }
  if (a1[4])
  {
    v7 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v7, "setHypothesizerSentAtLeastOneHypothesis:", 1);

    objc_msgSend(a1[4], "conservativeTravelTime");
    v9 = v8;
    objc_msgSend(MEMORY[0x24BDC7568], "maximumAllowableTravelTime");
    v11 = v9 > v10;
    v12 = (void *)objc_msgSend(a1[4], "copy");
    objc_msgSend(a1[5], "maximumTravelDurationEncountered");
    if (v13 < v9)
      v13 = v9;
    objc_msgSend(a1[5], "setMaximumTravelDurationEncountered:", v13);
    v14 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v14, "_updateTravelTimeExceededThresholdStateUsingExceededValue:", v11);

  }
  else
  {
    v15 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_215D9B000, v15, OS_LOG_TYPE_DEFAULT, "Not updating the latestHypothesis because the hypothesis is nil.", (uint8_t *)&v17, 2u);
    }
    v12 = 0;
  }
  v16 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v16, "_updateWithHypothesis:", v12);

}

- (void)_updateWithHypothesis:(id)a3
{
  EKTravelEngineHypothesis *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  EKTravelEngineHypothesis *v13;
  __int16 v14;
  EKTravelEngineAgendaEntry *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (EKTravelEngineHypothesis *)a3;
  v6 = *MEMORY[0x24BDC7450];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDC7450], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = self;
    _os_log_impl(&dword_215D9B000, v6, OS_LOG_TYPE_DEFAULT, "Updating agenda entry with hypothesis: [%@]. Agenda entry: [%@].", (uint8_t *)&v12, 0x16u);
  }
  if (self->_latestHypothesis != v5)
  {
    objc_storeStrong((id *)&self->_latestHypothesis, a3);
    -[EKTravelEngineAgendaEntry throttle](self, "throttle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKTravelEngineHypothesis conservativeDepartureDate](v5, "conservativeDepartureDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updatePredictedDepartureDate:", v8);

    if (!v5)
      goto LABEL_8;
    -[EKTravelEngineHypothesis conservativeDepartureDate](v5, "conservativeDepartureDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9
      || (-[EKTravelEngineHypothesis suggestedDepartureDate](v5, "suggestedDepartureDate"),
          (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
LABEL_10:

      goto LABEL_11;
    }
    -[EKTravelEngineHypothesis aggressiveDepartureDate](v5, "aggressiveDepartureDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_8:
      -[EKTravelEngineAgendaEntry updateBlock](self, "updateBlock");
      v11 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v11;
      if (v11)
        (*(void (**)(uint64_t, EKTravelEngineAgendaEntry *))(v11 + 16))(v11, self);
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)setLatestHypothesis:(id)a3
{
  objc_storeStrong((id *)&self->_latestHypothesis, a3);
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)entrySignificantlyChangedBlock
{
  return self->_entrySignificantlyChangedBlock;
}

- (void)setEntrySignificantlyChangedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)dismissed
{
  return self->_dismissed;
}

- (void)setDismissed:(BOOL)a3
{
  self->_dismissed = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (EKTravelEngineOriginalEvent)originalEventInternal
{
  return self->_originalEventInternal;
}

- (void)setOriginalEventInternal:(id)a3
{
  objc_storeStrong((id *)&self->_originalEventInternal, a3);
}

- (EKTravelEngineThrottle)throttle
{
  return self->_throttle;
}

- (void)setThrottle:(id)a3
{
  objc_storeStrong((id *)&self->_throttle, a3);
}

- (CalGeocoder)geocoder
{
  return self->_geocoder;
}

- (void)setGeocoder:(id)a3
{
  objc_storeStrong((id *)&self->_geocoder, a3);
}

- (CALNRouteHypothesizerProvider)hypothesizerProvider
{
  return self->_hypothesizerProvider;
}

- (CALNRouteHypothesizer)hypothesizer
{
  return self->_hypothesizer;
}

- (void)setHypothesizer:(id)a3
{
  objc_storeStrong((id *)&self->_hypothesizer, a3);
}

- (CLLocation)geoLocation
{
  return self->_geoLocation;
}

- (void)setGeoLocation:(id)a3
{
  objc_storeStrong((id *)&self->_geoLocation, a3);
}

- (NSData)mapKitHandle
{
  return self->_mapKitHandle;
}

- (void)setMapKitHandle:(id)a3
{
  objc_storeStrong((id *)&self->_mapKitHandle, a3);
}

- (BOOL)geocodedEventEncountered
{
  return self->_geocodedEventEncountered;
}

- (void)setGeocodedEventEncountered:(BOOL)a3
{
  self->_geocodedEventEncountered = a3;
}

- (BOOL)hypothesizerSentAtLeastOneHypothesis
{
  return self->_hypothesizerSentAtLeastOneHypothesis;
}

- (void)setHypothesizerSentAtLeastOneHypothesis:(BOOL)a3
{
  self->_hypothesizerSentAtLeastOneHypothesis = a3;
}

- (int64_t)travelTimeThresholdExceededState
{
  return self->_travelTimeThresholdExceededState;
}

- (void)setTravelTimeThresholdExceededState:(int64_t)a3
{
  self->_travelTimeThresholdExceededState = a3;
}

- (double)maximumTravelDurationEncountered
{
  return self->_maximumTravelDurationEncountered;
}

- (void)setMaximumTravelDurationEncountered:(double)a3
{
  self->_maximumTravelDurationEncountered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapKitHandle, 0);
  objc_storeStrong((id *)&self->_geoLocation, 0);
  objc_storeStrong((id *)&self->_hypothesizer, 0);
  objc_storeStrong((id *)&self->_hypothesizerProvider, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
  objc_storeStrong((id *)&self->_throttle, 0);
  objc_storeStrong((id *)&self->_originalEventInternal, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_entrySignificantlyChangedBlock, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_latestHypothesis, 0);
}

- (void)createAlarmWithName:(NSObject *)a3 atDate:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, a2, a3, "Ignoring attempt to set alarm named %{public}@ for a date in the past (%{public}@)", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_0();
}

void __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v0, v1, "Encountered error while geocoding.  Will not proceed to monitor route.  Location string: [%@] Error: [%@].");
  OUTLINED_FUNCTION_1_0();
}

void __45__EKTravelEngineAgendaEntry__enhanceLocation__block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v0, v1, "Failed to save the geocoding result to the database successfully. Original event: [%@].  Error: [%@]");
  OUTLINED_FUNCTION_1_0();
}

@end
