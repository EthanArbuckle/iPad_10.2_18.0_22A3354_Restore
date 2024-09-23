@implementation MRAVEndpointModifyOutputDevicesInGroup

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "debugName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _MRLogForCategory(0xAuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v9)
  {
    v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (!v10)
    {
      if (!v19)
        goto LABEL_14;
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138543874;
      v40 = v23;
      v41 = 2114;
      v42 = v24;
      v43 = 2048;
      v44 = v25;
      _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
      goto LABEL_13;
    }
    if (!v19)
      goto LABEL_14;
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "debugName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138544130;
    v40 = v20;
    v41 = 2114;
    v42 = v21;
    v43 = 2114;
    v44 = v16;
    v45 = 2048;
    v46 = v22;
    _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds", buf, 0x2Au);
LABEL_8:

LABEL_13:
    goto LABEL_14;
  }
  v13 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (!v13)
      goto LABEL_14;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v7, "debugName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138544386;
    v40 = v14;
    v41 = 2114;
    v42 = v15;
    v43 = 2114;
    v44 = v9;
    v45 = 2114;
    v46 = v16;
    v47 = 2048;
    v48 = v18;
    _os_log_error_impl(&dword_193827000, v12, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
    goto LABEL_8;
  }
  if (v13)
    __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_cold_1((_QWORD *)a1, (uint64_t)v9, v12);
LABEL_14:

  MRGroupTopologyModificationRequestTypeDescription(*(_QWORD *)(a1 + 88));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v26, CFSTR("eventType"));

  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), CFSTR("source"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 72), "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v27, CFSTR("numberOfDevices"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v28, CFSTR("actualNumberOfDevices"));

  objc_msgSend(v9, "localizedFailureReason");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v29, CFSTR("errorMessage"));

  v30 = (void *)MEMORY[0x1E0CB37E8];
  if (v9)
    v31 = objc_msgSend(v9, "isInformational");
  else
    v31 = 1;
  objc_msgSend(v30, "numberWithInt:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v32, CFSTR("success"));

  v33 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow");
  objc_msgSend(v33, "numberWithDouble:", fabs(v34));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v35, CFSTR("duration"));

  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_64;
  v37[3] = &unk_1E30C96C0;
  v38 = *(id *)(a1 + 56);
  MRAnalyticsSendEvent(CFSTR("com.apple.mediaremote.endpoint.modify.wha"), 0, v37);
  v36 = *(_QWORD *)(a1 + 80);
  if (v36)
    (*(void (**)(uint64_t, id))(v36 + 16))(v36, v9);

}

id __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_64(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  char v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  MRAVReconnaissanceSession *v26;
  void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  uint64_t v33;
  MRAVReconnaissanceSession *v34;
  void *v35;
  MRAVReconnaissanceSession *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  _QWORD v42[4];
  MRAVReconnaissanceSession *v43;
  id v44;
  id v45;
  id v46;
  void (**v47)(_QWORD, _QWORD, _QWORD);
  _QWORD v48[4];
  id v49;
  __CFString *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  const __CFString *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), *(_QWORD *)(a1 + 32), CFSTR("fetchGroupLeader"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v8, *(_QWORD *)(a1 + 40));
  v10 = v9;
  if (v5)
    objc_msgSend(v9, "appendFormat:", CFSTR(" for %@"), v5);
  _MRLogForCategory(0xAuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v58 = v10;
    _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }
  v40 = v10;

  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_72;
  v48[3] = &unk_1E30CBC38;
  v49 = *(id *)(a1 + 48);
  v50 = CFSTR("fetchGroupLeader");
  v39 = v7;
  v51 = v39;
  v12 = v5;
  v52 = v12;
  v13 = v8;
  v53 = v13;
  v54 = *(id *)(a1 + 40);
  v14 = v6;
  v55 = v14;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x194036C44](v48);
  +[MRDeviceInfoRequest localDeviceInfo](MRDeviceInfoRequest, "localDeviceInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isGroupLeader");
  v18 = objc_msgSend(v16, "isAirPlayActive");
  +[MRAVClusterController sharedController](MRAVClusterController, "sharedController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "clusterStatus");

  objc_msgSend(v16, "deviceUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "groupUID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqual:", v12);
  if (*(_QWORD *)(a1 + 56) && (((v22 ^ 1 | v18) & 1) != 0 || v20))
  {
    v29 = v22 ^ 1 | v17;
    _MRLogForCategory(0xAuLL);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if ((v29 & 1) != 0)
    {
      v28 = v40;
      if (v31)
      {
        v32 = *(void **)(a1 + 32);
        v33 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v58 = v32;
        v59 = 2114;
        v60 = v33;
        v61 = 2112;
        v62 = CFSTR("Processing modification by searching network for pilot device and it's group leader.");
        _os_log_impl(&dword_193827000, v30, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", CFSTR("pilot"), CFSTR("groupLeaderSelection"));
      v34 = [MRAVReconnaissanceSession alloc];
      v56 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:](v34, "initWithOutputDeviceUIDs:outputDeviceGroupID:features:", v35, 0, 8);

    }
    else
    {
      v28 = v40;
      if (v31)
      {
        v37 = *(void **)(a1 + 32);
        v38 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v58 = v37;
        v59 = 2114;
        v60 = v38;
        v61 = 2112;
        v62 = CFSTR("Processing modification by searching network for group leader.");
        _os_log_impl(&dword_193827000, v30, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", CFSTR("remote"), CFSTR("groupLeaderSelection"));
      v36 = -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:]([MRAVReconnaissanceSession alloc], "initWithOutputDeviceUIDs:outputDeviceGroupID:features:", 0, v41, 8);
    }
    v27 = v39;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_94;
    v42[3] = &unk_1E30CBC60;
    v43 = v36;
    v44 = v21;
    v45 = v16;
    v46 = *(id *)(a1 + 48);
    v47 = v15;
    v26 = v36;
    -[MRAVReconnaissanceSession beginSearchWithTimeout:completion:](v26, "beginSearchWithTimeout:completion:", v42, 2.0);

  }
  else
  {
    _MRLogForCategory(0xAuLL);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(void **)(a1 + 32);
      v25 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v58 = v24;
      v59 = 2114;
      v60 = v25;
      v61 = 2112;
      v62 = CFSTR("Processing modification as a local modification.");
      _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", CFSTR("local"), CFSTR("groupLeaderSelection"));
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", CFSTR("local"), CFSTR("groupLeaderType"));
    +[MRAVLocalEndpoint sharedLocalEndpoint](MRAVLocalEndpoint, "sharedLocalEndpoint");
    v26 = (MRAVReconnaissanceSession *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, MRAVReconnaissanceSession *, _QWORD))v15)[2](v15, v26, 0);
    v27 = v39;
    v28 = v40;
  }

}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_72(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
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
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  id v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));

  if (!v6)
  {
    objc_msgSend(v5, "debugName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = *(_QWORD *)(a1 + 56);
    _MRLogForCategory(0xAuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (!v21)
    {
      if (v22)
      {
        if (!v23)
          goto LABEL_22;
        v36 = *(_QWORD *)(a1 + 64);
        v35 = *(_QWORD *)(a1 + 72);
        v37 = *(void **)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        v53 = 138544130;
        v54 = v36;
        v55 = 2114;
        v56 = v35;
        v57 = 2114;
        v58 = v37;
        v59 = 2048;
        v60 = v38;
        v39 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v40 = v11;
        v41 = 42;
      }
      else
      {
        if (!v23)
          goto LABEL_22;
        v45 = *(_QWORD *)(a1 + 64);
        v46 = *(_QWORD *)(a1 + 72);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        v53 = 138543874;
        v54 = v45;
        v55 = 2114;
        v56 = v46;
        v57 = 2048;
        v58 = v47;
        v39 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v40 = v11;
        v41 = 32;
      }
      _os_log_impl(&dword_193827000, v40, OS_LOG_TYPE_DEFAULT, v39, (uint8_t *)&v53, v41);
      goto LABEL_21;
    }
    if (v22)
    {
      if (!v23)
        goto LABEL_22;
      v24 = *(_QWORD *)(a1 + 64);
      v25 = *(_QWORD *)(a1 + 72);
      objc_msgSend(v5, "debugName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v53 = 138544386;
      v54 = v24;
      v55 = 2114;
      v56 = v25;
      v57 = 2112;
      v58 = v16;
      v59 = 2114;
      v60 = v26;
      v61 = 2048;
      v62 = v28;
      v29 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v30 = v11;
      v31 = 52;
    }
    else
    {
      if (!v23)
        goto LABEL_22;
      v42 = *(_QWORD *)(a1 + 64);
      v43 = *(_QWORD *)(a1 + 72);
      objc_msgSend(v5, "debugName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v53 = 138544130;
      v54 = v42;
      v55 = 2114;
      v56 = v43;
      v57 = 2112;
      v58 = v16;
      v59 = 2048;
      v60 = v44;
      v29 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      v30 = v11;
      v31 = 42;
    }
    _os_log_impl(&dword_193827000, v30, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v53, v31);

    goto LABEL_21;
  }
  v10 = *(_QWORD *)(a1 + 56);
  _MRLogForCategory(0xAuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (v12)
    {
      v14 = *(_QWORD *)(a1 + 64);
      v13 = *(_QWORD *)(a1 + 72);
      v15 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v53 = 138544386;
      v54 = v14;
      v55 = 2114;
      v56 = v13;
      v57 = 2114;
      v58 = v6;
      v59 = 2114;
      v60 = v15;
      v61 = 2048;
      v62 = v17;
      v18 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      v19 = v11;
      v20 = 52;
LABEL_11:
      _os_log_error_impl(&dword_193827000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v53, v20);
LABEL_21:

    }
  }
  else if (v12)
  {
    v32 = *(_QWORD *)(a1 + 64);
    v33 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v53 = 138544130;
    v54 = v32;
    v55 = 2114;
    v56 = v33;
    v57 = 2114;
    v58 = v6;
    v59 = 2048;
    v60 = v34;
    v18 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
    v19 = v11;
    v20 = 42;
    goto LABEL_11;
  }
LABEL_22:

  (*(void (**)(_QWORD, id, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 80) + 16))(*(_QWORD *)(a1 + 80), v5, v6, v48, v49, v50, v51, v52);
}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_94(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(void);
  const __CFString *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(id *)(a1 + 32);
  if (!v8)
  {
    v11 = v9;
    if (objc_msgSend(v11, "code") == 26)
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 47, CFSTR("Timedout after %lf seconds trying discover groupLeader. Discovered=%@"), 0x4000000000000000, v7);

      v11 = (id)v21;
    }
    _MRLogForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_94_cold_1((uint64_t)v11, v22, v23, v24, v25, v26, v27, v28);

    v29 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_26;
  }
  objc_msgSend(v8, "outputDevices");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!*(_QWORD *)(a1 + 40) && (objc_msgSend(v8, "isLocalEndpoint") & 1) != 0)
  {
LABEL_22:
    if (objc_msgSend(v8, "isLocalEndpoint"))
      v30 = CFSTR("local");
    else
      v30 = CFSTR("remote");
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v30, CFSTR("groupLeaderType"));
    v29 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_26:
    v29();
    goto LABEL_27;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    v31 = v9;
    while (2)
    {
      v16 = v10;
      v17 = v7;
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v12);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if ((MRAVOutputDeviceIsGroupLeader(v19) & 1) != 0
          || (MRAVOutputDeviceGroupContainsGroupLeader(v19) & 1) != 0
          || objc_msgSend(*(id *)(a1 + 48), "isGroupLeader")
          && MRAVOutputDeviceIsLocalDevice(v19))
        {

          v7 = v17;
          v10 = v16;
          v9 = v31;
          goto LABEL_22;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v7 = v17;
      v10 = v16;
      v9 = v31;
      if (v14)
        continue;
      break;
    }
  }

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 33, CFSTR("No suitable group leader to modify: %@"), v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  v11 = v12;
LABEL_27:

}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_102(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  MRAVReconnaissanceSession *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  __CFString *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), *(_QWORD *)(a1 + 32), CFSTR("fetchOutputDevices"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v8, *(_QWORD *)(a1 + 40));
  v10 = v9;
  if (v5)
    objc_msgSend(v9, "appendFormat:", CFSTR(" for %@"), v5);
  _MRLogForCategory(0xAuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v10;
    _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_105;
  v26[3] = &unk_1E30CBCB0;
  v27 = *(id *)(a1 + 48);
  v28 = CFSTR("fetchOutputDevices");
  v29 = v7;
  v13 = v5;
  v30 = v13;
  v31 = v8;
  v32 = *(id *)(a1 + 40);
  v33 = v6;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v17 = (void *)MEMORY[0x194036C44](v26);
  v18 = -[MRAVReconnaissanceSession initWithOutputDeviceUIDs:outputDeviceGroupID:features:]([MRAVReconnaissanceSession alloc], "initWithOutputDeviceUIDs:outputDeviceGroupID:features:", v13, 0, 1);
  v19 = objc_msgSend(*(id *)(a1 + 56), "opaqueSessionID");
  -[MRAVReconnaissanceSession discoverySession](v18, "discoverySession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTargetAudioSessionID:", v19);

  -[MRAVReconnaissanceSession setReturnPartialResults:](v18, "setReturnPartialResults:", 1);
  v23[0] = v12;
  v23[1] = 3221225472;
  v23[2] = __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_107;
  v23[3] = &unk_1E30CBCD8;
  v24 = v13;
  v25 = v17;
  v21 = v13;
  v22 = v17;
  -[MRAVReconnaissanceSession beginSearchWithTimeout:completion:](v18, "beginSearchWithTimeout:completion:", v23, 3.0);

}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_105(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  id v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", fabs(v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));

  v10 = *(_QWORD *)(a1 + 56);
  _MRLogForCategory(0xAuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v5 && !v6)
  {
    v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v13)
      {
        v15 = *(_QWORD *)(a1 + 64);
        v14 = *(_QWORD *)(a1 + 72);
        v16 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        v49 = 138544386;
        v50 = v15;
        v51 = 2114;
        v52 = v14;
        v53 = 2112;
        v54 = v5;
        v55 = 2114;
        v56 = v16;
        v57 = 2048;
        v58 = v18;
        v19 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v20 = v12;
        v21 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v49, v21);
LABEL_17:

        goto LABEL_23;
      }
      goto LABEL_23;
    }
    if (!v13)
      goto LABEL_23;
    v35 = *(_QWORD *)(a1 + 64);
    v36 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v49 = 138544130;
    v50 = v35;
    v51 = 2114;
    v52 = v36;
    v53 = 2112;
    v54 = v5;
    v55 = 2048;
    v56 = v37;
    v19 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v20 = v12;
    v21 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    v22 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (v10)
    {
      if (!v22)
        goto LABEL_23;
      v24 = *(_QWORD *)(a1 + 64);
      v23 = *(_QWORD *)(a1 + 72);
      v25 = *(_QWORD *)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v49 = 138544386;
      v50 = v24;
      v51 = 2114;
      v52 = v23;
      v53 = 2114;
      v54 = v6;
      v55 = 2114;
      v56 = v25;
      v57 = 2048;
      v58 = v26;
      v27 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      v28 = v12;
      v29 = 52;
    }
    else
    {
      if (!v22)
        goto LABEL_23;
      v38 = *(_QWORD *)(a1 + 64);
      v39 = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v49 = 138544130;
      v50 = v38;
      v51 = 2114;
      v52 = v39;
      v53 = 2114;
      v54 = v6;
      v55 = 2048;
      v56 = v40;
      v27 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
      v28 = v12;
      v29 = 42;
    }
    _os_log_error_impl(&dword_193827000, v28, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v49, v29);
    goto LABEL_17;
  }
  v30 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (!v30)
      goto LABEL_23;
    v41 = *(_QWORD *)(a1 + 64);
    v42 = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v49 = 138543874;
    v50 = v41;
    v51 = 2114;
    v52 = v42;
    v53 = 2048;
    v54 = v43;
    v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v20 = v12;
    v21 = 32;
    goto LABEL_16;
  }
  if (v30)
  {
    v32 = *(_QWORD *)(a1 + 64);
    v31 = *(_QWORD *)(a1 + 72);
    v33 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v49 = 138544130;
    v50 = v32;
    v51 = 2114;
    v52 = v31;
    v53 = 2114;
    v54 = v33;
    v55 = 2048;
    v56 = v34;
    v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_23:

  (*(void (**)(_QWORD, id, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 80) + 16))(*(_QWORD *)(a1 + 80), v5, v6, v44, v45, v46, v47, v48);
}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_107(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v8 = v7;
    v9 = v8;
    if (objc_msgSend(v8, "code") == 26)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:format:", 47, CFSTR("Timedout after %lf seconds trying discover audioOutputDevices. Discovered=%@, Requested=%@"), 0x4008000000000000, v6, *(_QWORD *)(a1 + 32));

    }
    _MRLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_107_cold_1(a1, (uint64_t)v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_111(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  int v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  __CFString *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), *(_QWORD *)(a1 + 32), CFSTR("routingOperation"));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v12, *(_QWORD *)(a1 + 40));
  v14 = v13;
  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(v13, "appendFormat:", CFSTR(" for %@"), *(_QWORD *)(a1 + 48));
  _MRLogForCategory(0xAuLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v46 = v14;
    _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v16 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_114;
  v36[3] = &unk_1E30CBD28;
  v37 = *(id *)(a1 + 56);
  v38 = CFSTR("routingOperation");
  v17 = v11;
  v39 = v17;
  v18 = v9;
  v40 = v18;
  v41 = *(id *)(a1 + 48);
  v19 = v12;
  v42 = v19;
  v43 = *(id *)(a1 + 40);
  v20 = v10;
  v44 = v20;
  v21 = (void *)MEMORY[0x194036C44](v36);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@<%@>"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (a2 == 3)
  {
    v24 = v29;
    if (objc_msgSend(v29, "isGroupable"))
    {
      v27 = v29;
      v28 = *(_QWORD *)(a1 + 64);
      v30[0] = v16;
      v30[1] = 3221225472;
      v30[2] = __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_115;
      v30[3] = &unk_1E30CBD50;
      v35 = v21;
      v31 = v27;
      v32 = v18;
      v33 = v22;
      v34 = *(id *)(a1 + 64);
      v24 = v29;
      objc_msgSend(v27, "addOutputDevices:initiator:withReplyQueue:completion:", v32, v33, v28, v30);

      goto LABEL_16;
    }
    v26 = *(_QWORD *)(a1 + 64);
LABEL_15:
    objc_msgSend(v24, "setOutputDevices:initiator:withReplyQueue:completion:", v18, v22, v26, v21);
    goto LABEL_16;
  }
  if (a2 == 2)
  {
    v24 = v29;
    objc_msgSend(v29, "removeOutputDevices:initiator:withReplyQueue:completion:", v18, v22, *(_QWORD *)(a1 + 64), v21);
    goto LABEL_16;
  }
  v23 = a2 == 1;
  v24 = v29;
  if (!v23)
    goto LABEL_16;
  v25 = objc_msgSend(v29, "isGroupable");
  v26 = *(_QWORD *)(a1 + 64);
  if (!v25)
    goto LABEL_15;
  objc_msgSend(v29, "addOutputDevices:initiator:withReplyQueue:completion:", v18, v22, v26, v21);
LABEL_16:

}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_114(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  id v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow");
  objc_msgSend(v4, "numberWithDouble:", fabs(v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

  if (!v3)
  {
    v19 = *(_QWORD *)(a1 + 56);
    v18 = *(_QWORD *)(a1 + 64);
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v18)
      {
        if (!v20)
          goto LABEL_22;
        v21 = *(_QWORD *)(a1 + 72);
        v22 = *(_QWORD *)(a1 + 80);
        v23 = *(void **)(a1 + 56);
        v24 = *(_QWORD *)(a1 + 64);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        v49 = 138544386;
        v50 = v21;
        v51 = 2114;
        v52 = v22;
        v53 = 2112;
        v54 = v23;
        v55 = 2114;
        v56 = v24;
        v57 = 2048;
        v58 = v25;
        v26 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v27 = v8;
        v28 = 52;
LABEL_20:
        _os_log_impl(&dword_193827000, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v49, v28);
        goto LABEL_21;
      }
      if (!v20)
        goto LABEL_22;
      v36 = *(_QWORD *)(a1 + 72);
      v37 = *(_QWORD *)(a1 + 80);
      v38 = *(void **)(a1 + 56);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v49 = 138544130;
      v50 = v36;
      v51 = 2114;
      v52 = v37;
      v53 = 2112;
      v54 = v38;
      v55 = 2048;
      v56 = v39;
      v26 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    }
    else
    {
      if (!v18)
      {
        if (!v20)
          goto LABEL_22;
        v40 = *(_QWORD *)(a1 + 72);
        v41 = *(_QWORD *)(a1 + 80);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        v49 = 138543874;
        v50 = v40;
        v51 = 2114;
        v52 = v41;
        v53 = 2048;
        v54 = v42;
        v26 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v27 = v8;
        v28 = 32;
        goto LABEL_20;
      }
      if (!v20)
        goto LABEL_22;
      v33 = *(_QWORD *)(a1 + 72);
      v32 = *(_QWORD *)(a1 + 80);
      v34 = *(void **)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v49 = 138544130;
      v50 = v33;
      v51 = 2114;
      v52 = v32;
      v53 = 2114;
      v54 = v34;
      v55 = 2048;
      v56 = v35;
      v26 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    }
    v27 = v8;
    v28 = 42;
    goto LABEL_20;
  }
  v7 = *(_QWORD *)(a1 + 64);
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (v9)
    {
      v11 = *(_QWORD *)(a1 + 72);
      v10 = *(_QWORD *)(a1 + 80);
      v12 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v49 = 138544386;
      v50 = v11;
      v51 = 2114;
      v52 = v10;
      v53 = 2114;
      v54 = v3;
      v55 = 2114;
      v56 = v12;
      v57 = 2048;
      v58 = v14;
      v15 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      v16 = v8;
      v17 = 52;
LABEL_11:
      _os_log_error_impl(&dword_193827000, v16, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v49, v17);
LABEL_21:

    }
  }
  else if (v9)
  {
    v29 = *(_QWORD *)(a1 + 72);
    v30 = *(_QWORD *)(a1 + 80);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v49 = 138544130;
    v50 = v29;
    v51 = 2114;
    v52 = v30;
    v53 = 2114;
    v54 = v3;
    v55 = 2048;
    v56 = v31;
    v15 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
    v16 = v8;
    v17 = 42;
    goto LABEL_11;
  }
LABEL_22:

  (*(void (**)(_QWORD, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 88) + 16))(*(_QWORD *)(a1 + 88), v3, v43, v44, v45, v46, v47, v48);
}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_115(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isInformational") & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "setOutputDevices:initiator:withReplyQueue:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_117(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  v7 = a3;
  v12 = v7;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  v10 = v11;
  if (v11)
    v7 = v10;
  objc_storeStrong(v9, v7);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v6 = a2;
  v7 = a3;
  v12 = v7;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  v10 = v11;
  if (v11)
    v7 = v10;
  objc_storeStrong(v9, v7);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *(_QWORD *)(a1 + 72);
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_4;
    v6[3] = &unk_1E30CBDC8;
    v5 = *(_QWORD *)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v8 = *(_OWORD *)(a1 + 56);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))(v5 + 16))(v5, v2, v3, v4, v6);

  }
}

uint64_t __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_4(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[4] + 16))(a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
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
  v6 = a1[4];
  v7 = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", a1[6]);
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

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_94_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_193827000, a2, a3, "[AVEndpoint] Error occurred while discovering group leader: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_8();
}

void __MRAVEndpointModifyOutputDevicesInGroup_block_invoke_107_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_193827000, log, OS_LOG_TYPE_ERROR, "[AVEndpoint] Error occurred while discovering devices %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_8();
}

@end
