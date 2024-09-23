@implementation MRAVDiscoverySessionHelper

- (MRAVDiscoverySessionHelper)initWithFeatures:(unint64_t)a3
{
  MRAVDiscoverySessionHelper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRAVDiscoverySessionHelper;
  result = -[MRAVDiscoverySessionHelper init](&v5, sel_init);
  if (result)
    result->_discoverySessionFeatures = a3;
  return result;
}

- (void)searchAVOutputDeviceForUID:(id)a3 timeout:(double)a4 identifier:(id)a5 reason:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  MRBlockGuard *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69[3];

  v69[1] = *(id *)MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v42 = a6;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("searchAVOutputDeviceForUID-%@"), v42);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("outputDeviceUID=%@"), v12);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v16, v13);
  v18 = v17;
  if (v41)
    objc_msgSend(v17, "appendFormat:", CFSTR(" for %@"), v41);
  v40 = v18;
  _MRLogForCategory(0xAuLL);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v40;
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v66 = 0x3042000000;
  v67 = __Block_byref_object_copy__7;
  v68 = __Block_byref_object_dispose__7;
  v20 = MEMORY[0x1E0C809B0];
  v69[0] = 0;
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke;
  v58[3] = &unk_1E30C80E0;
  p_buf = &buf;
  v21 = v12;
  v59 = v21;
  v22 = v16;
  v60 = v22;
  v38 = v13;
  v61 = v38;
  v23 = v15;
  v62 = v23;
  v39 = v14;
  v63 = v39;
  v24 = (void *)MEMORY[0x194036C44](v58);
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__13;
  v56 = __Block_byref_object_dispose__14;
  v57 = 0;
  v48[0] = v20;
  v48[1] = 3221225472;
  v48[2] = __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_15;
  v48[3] = &unk_1E30C8130;
  v25 = v21;
  v49 = v25;
  v51 = &v52;
  v26 = v24;
  v50 = v26;
  v27 = (void *)MEMORY[0x194036C44](v48);
  -[MRAVDiscoverySessionHelper createDiscoverySession](self, "createDiscoverySession");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDiscoveryMode:", 3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  getAVOutputDeviceDiscoverySessionAvailableOutputDevicesDidChangeNotification[0]();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v20;
  v45[1] = 3221225472;
  v45[2] = __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_3;
  v45[3] = &unk_1E30C8158;
  v31 = v27;
  v47 = v31;
  v32 = v28;
  v46 = v32;
  objc_msgSend(v29, "addObserverForName:object:queue:usingBlock:", v30, v32, 0, v45);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)(*((_QWORD *)&buf + 1) + 40), v33);

  v34 = [MRBlockGuard alloc];
  v43[0] = v20;
  v43[1] = 3221225472;
  v43[2] = __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_4;
  v43[3] = &unk_1E30C6798;
  v35 = v26;
  v44 = v35;
  v36 = -[MRBlockGuard initWithTimeout:reason:handler:](v34, "initWithTimeout:reason:handler:", v22, v43, a4);
  v37 = (void *)v53[5];
  v53[5] = v36;

  (*((void (**)(id, id))v31 + 2))(v31, v32);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&buf, 8);
  objc_destroyWeak(v69);

}

void __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  int v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1[9] + 8) + 40));
  objc_msgSend(v7, "removeObserver:", WeakRetained);

  v9 = a1[4];
  _MRLogForCategory(0xAuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v5 && !v6)
  {
    v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        v14 = a1[5];
        v13 = a1[6];
        v15 = a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceDate:", a1[7]);
        v37 = 138544386;
        v38 = v14;
        v39 = 2114;
        v40 = v13;
        v41 = 2112;
        v42 = v5;
        v43 = 2114;
        v44 = v15;
        v45 = 2048;
        v46 = v17;
        v18 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v19 = v11;
        v20 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v37, v20);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v12)
      goto LABEL_22;
    v31 = a1[5];
    v32 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", a1[7]);
    v37 = 138544130;
    v38 = v31;
    v39 = 2114;
    v40 = v32;
    v41 = 2112;
    v42 = v5;
    v43 = 2048;
    v44 = v33;
    v18 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v19 = v11;
    v20 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    v21 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v21)
      {
        v23 = a1[5];
        v22 = a1[6];
        v24 = a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceDate:", a1[7]);
        v37 = 138544386;
        v38 = v23;
        v39 = 2114;
        v40 = v22;
        v41 = 2114;
        v42 = v6;
        v43 = 2114;
        v44 = v24;
        v45 = 2048;
        v46 = v25;
        _os_log_error_impl(&dword_193827000, v11, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v37, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v21)
    {
      __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_cold_1(a1, (uint64_t)v6, v11);
    }
    goto LABEL_22;
  }
  v26 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v9)
  {
    if (!v26)
      goto LABEL_22;
    v34 = a1[5];
    v35 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", a1[7]);
    v37 = 138543874;
    v38 = v34;
    v39 = 2114;
    v40 = v35;
    v41 = 2048;
    v42 = v36;
    v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v19 = v11;
    v20 = 32;
    goto LABEL_16;
  }
  if (v26)
  {
    v28 = a1[5];
    v27 = a1[6];
    v29 = (void *)a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", a1[7]);
    v37 = 138544130;
    v38 = v28;
    v39 = 2114;
    v40 = v27;
    v41 = 2114;
    v42 = v29;
    v43 = 2048;
    v44 = v30;
    v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  (*(void (**)(void))(a1[8] + 16))();
}

void __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_15(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a2, "availableOutputDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_2;
  v5[3] = &unk_1E30C8108;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "mr_first:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "disarm"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)createDiscoverySession
{
  return (id)objc_msgSend(objc_alloc((Class)getAVOutputDeviceDiscoverySessionClass[0]()), "initWithDeviceFeatures:", self->_discoverySessionFeatures);
}

void __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", a1[7]);
  v10 = 138544130;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  v14 = 2114;
  v15 = a2;
  v16 = 2048;
  v17 = v9;
  _os_log_error_impl(&dword_193827000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v10, 0x2Au);

}

@end
