@implementation EKNotificationMonitor

void __48___EKNotificationMonitor_notificationReferences__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
}

void __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_53(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = CFSTR("nil");
    }
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1A2318000, v2, OS_LOG_TYPE_DEFAULT, "Posting notification changed notification because changeIDs count is %{public}@", (uint8_t *)&v6, 0xCu);
    if (v3)

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("EKNotificationsChangedNotification"), a1[4], a1[5]);

}

void __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  unsigned __int8 *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  unsigned __int8 *v12;
  int v13;
  id *v14;
  uint64_t v15;
  void *v16;
  _BYTE *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  __CFString *v22;
  void *v23;
  NSObject *v24;
  const __CFString *v25;
  NSObject *v26;
  __CFString *v27;
  NSObject *v28;
  NSObject *v29;
  char v30;
  int v31;
  char v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  __CFString *v36;
  NSObject *v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  NSObject *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  __CFString *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  int v63;
  _QWORD v64[5];
  _QWORD v65[5];
  id v66;
  uint8_t *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  _QWORD v77[7];
  id v78;
  _QWORD v79[7];
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  id v99;
  _QWORD block[7];
  uint8_t buf[8];
  uint8_t *v102;
  uint64_t v103;
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  char v110;
  const __CFString *v111;
  void *v112;
  _QWORD v113[2];
  _QWORD v114[2];
  _BYTE v115[128];
  uint8_t v116[128];
  uint8_t v117[4];
  const __CFString *v118;
  __int16 v119;
  void *v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_eventStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "isDataProtected"))
  {
    v107 = 0;
    v108 = &v107;
    v109 = 0x2020000000;
    v110 = 0;
    *(_QWORD *)buf = 0;
    v102 = buf;
    v103 = 0x3032000000;
    v104 = __Block_byref_object_copy__13;
    v105 = __Block_byref_object_dispose__13;
    v106 = 0;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 128);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_41;
    block[3] = &unk_1E4785338;
    block[4] = v4;
    block[5] = &v107;
    block[6] = buf;
    dispatch_sync(v5, block);
    if (!*((_BYTE *)v108 + 24))
    {
LABEL_88:
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v107, 8);
      goto LABEL_89;
    }
    v6 = *(unsigned __int8 **)(a1 + 32);
    v63 = v6[92];
    v94 = 0;
    v95 = &v94;
    v96 = 0x3032000000;
    v97 = __Block_byref_object_copy__13;
    v98 = __Block_byref_object_dispose__13;
    v99 = 0;
    v88 = 0;
    v89 = &v88;
    v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__13;
    v92 = __Block_byref_object_dispose__13;
    v93 = 0;
    v84 = 0;
    v85 = &v84;
    v86 = 0x2020000000;
    v87 = 0;
    v80 = 0;
    v81 = &v80;
    v82 = 0x2020000000;
    v83 = 0;
    if (objc_msgSend(v6, "isMonitoringOnlyNotificationCount"))
    {
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v117 = 0;
        _os_log_impl(&dword_1A2318000, v7, OS_LOG_TYPE_DEFAULT, "Notification monitor wants to reload notification count. Will fetch notification count from the event store as a result", v117, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "_eventStore");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "eventNotificationCountExcludingUncheckedCalendars:expanded:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 101), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 100));
      v81[3] = v9;
      objc_msgSend(*(id *)(a1 + 32), "notificationQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_42;
      v79[3] = &unk_1E4786570;
      v79[4] = *(_QWORD *)(a1 + 32);
      v79[5] = &v84;
      v79[6] = &v80;
      dispatch_sync(v10, v79);

    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v117 = 0;
        _os_log_impl(&dword_1A2318000, v11, OS_LOG_TYPE_DEFAULT, "Notification monitor wants to reload notifications. Will fetch notification references from the event store as a result.", v117, 2u);
      }

      v12 = *(unsigned __int8 **)(a1 + 32);
      v13 = v12[93];
      if (v12[93])
        v14 = &v78;
      else
        v14 = 0;
      if (v12[93])
        v78 = 0;
      objc_msgSend(v12, "_fetchEventNotificationReferencesFromEventStore:earliestExpiringNotification:", v2, v14);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v13)
        v8 = v78;
      else
        v8 = 0;
      v16 = (void *)v89[5];
      v89[5] = v15;

      v17 = *(_BYTE **)(a1 + 32);
      if (v17[93])
        objc_msgSend(v17, "_updateTimerFireDate:", v8);
      v18 = objc_msgSend((id)v89[5], "count");
      v81[3] = v18;
      objc_msgSend(*(id *)(a1 + 32), "notificationQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      v77[0] = MEMORY[0x1E0C809B0];
      v77[1] = 3221225472;
      v77[2] = __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_44;
      v77[3] = &unk_1E4786570;
      v77[4] = *(_QWORD *)(a1 + 32);
      v77[5] = &v94;
      v77[6] = &v88;
      dispatch_sync(v19, v77);

      v20 = objc_msgSend((id)v95[5], "count");
      v85[3] = v20;
    }

    objc_msgSend((id)objc_opt_class(), "logHandle");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v81[3]);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v85[3]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v117 = 138543618;
      v118 = v22;
      v119 = 2114;
      v120 = v23;
      _os_log_impl(&dword_1A2318000, v21, OS_LOG_TYPE_DEFAULT, "Current notification count: %{public}@. Last event notification count: %{public}@.", v117, 0x16u);

    }
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = CFSTR("NO");
      if (v63)
        v25 = CFSTR("YES");
      *(_DWORD *)v117 = 138543362;
      v118 = v25;
      _os_log_impl(&dword_1A2318000, v24, OS_LOG_TYPE_DEFAULT, "Is initial check: %{public}@.", v117, 0xCu);
    }

    if (v81[3] != v85[3])
    {
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v81[3]);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v117 = 138543362;
        v118 = v27;
        _os_log_impl(&dword_1A2318000, v26, OS_LOG_TYPE_DEFAULT, "Count changed to %{public}@ events, Notifying.", v117, 0xCu);

      }
      if (+[EKFeatureSet areApplicationBadgesSupported](EKFeatureSet, "areApplicationBadgesSupported"))
      {
        objc_msgSend(*(id *)(a1 + 32), "effectiveCallbackQueue");
        v28 = objc_claimAutoreleasedReturnValue();
        v76[0] = MEMORY[0x1E0C809B0];
        v76[1] = 3221225472;
        v76[2] = __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_50;
        v76[3] = &unk_1E4785078;
        v76[4] = *(_QWORD *)(a1 + 32);
        dispatch_async(v28, v76);

      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "logHandle");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v117 = 0;
          _os_log_impl(&dword_1A2318000, v29, OS_LOG_TYPE_DEFAULT, "Application badges are not supported on this platform. Will not notify.", v117, 2u);
        }

      }
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 92) = 0;
    v30 = objc_msgSend(*(id *)(a1 + 32), "isMonitoringOnlyNotificationCount");
    v31 = v63;
    if (v63)
      v32 = 1;
    else
      v32 = v30;
    if ((v32 & 1) != 0)
    {
LABEL_85:
      if (v31)
      {
        objc_msgSend(*(id *)(a1 + 32), "effectiveCallbackQueue");
        v62 = objc_claimAutoreleasedReturnValue();
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_56;
        v64[3] = &unk_1E4785078;
        v64[4] = *(_QWORD *)(a1 + 32);
        dispatch_async(v62, v64);

      }
      _Block_object_dispose(&v80, 8);
      _Block_object_dispose(&v84, 8);
      _Block_object_dispose(&v88, 8);

      _Block_object_dispose(&v94, 8);
      goto LABEL_88;
    }
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v117 = 0;
      _os_log_impl(&dword_1A2318000, v33, OS_LOG_TYPE_INFO, "Checking for notification change notification.", v117, 2u);
    }

    if (v85[3] == v81[3])
    {
      v34 = 1;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v81[3]);
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v117 = 138543362;
        v118 = v36;
        _os_log_impl(&dword_1A2318000, v35, OS_LOG_TYPE_INFO, "Count changed to %{public}@ events. Setting notification to EKNotificationChangeTypeUnknown", v117, 0xCu);

      }
      v34 = 0;
      if (!*((_QWORD *)v102 + 5))
        goto LABEL_77;
    }
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v117 = 0;
      _os_log_impl(&dword_1A2318000, v37, OS_LOG_TYPE_INFO, "Changes detected. Checking changes in notifications.", v117, 2u);
    }

    v38 = objc_alloc(MEMORY[0x1E0C99E20]);
    v39 = (void *)objc_msgSend(v38, "initWithCapacity:", v85[3]);
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v40 = (id)v95[5];
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v72, v116, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v73 != v42)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "objectID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v44);

        }
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v72, v116, 16);
      }
      while (v41);
    }

    if (*((_QWORD *)v102 + 5))
    {
      v45 = objc_alloc(MEMORY[0x1E0C99E20]);
      v46 = (void *)objc_msgSend(v45, "initWithCapacity:", v81[3]);
    }
    else
    {
      v46 = 0;
    }
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v47 = (id)v89[5];
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v68, v115, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v69 != v49)
            objc_enumerationMutation(v47);
          objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * j), "objectID");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "addObject:", v51);
          if (!objc_msgSend(v39, "containsObject:", v51))
            v34 = 0;

        }
        v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v68, v115, 16);
      }
      while (v48);
    }

    if (*((_QWORD *)v102 + 5))
    {
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*((id *)v102 + 5), "count"));
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v117 = 138543362;
        v118 = v53;
        _os_log_impl(&dword_1A2318000, v52, OS_LOG_TYPE_INFO, "Updating changeIDs. Current size at %{public}@", v117, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "_addRemovedOrAddedObjectIDsTo:oldNotifications:newNotifications:", *((_QWORD *)v102 + 5), v39, v46);
      v114[0] = *((_QWORD *)v102 + 5);
      v113[0] = CFSTR("EKNotificationChangedNotificationsKey");
      v113[1] = CFSTR("EKNotificationChangedChangeTypeKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v114[1] = v54;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "logHandle");
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*((id *)v102 + 5), "count"));
        v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v117 = 138543362;
        v118 = v57;
        _os_log_impl(&dword_1A2318000, v56, OS_LOG_TYPE_INFO, "Updated changeIDs. Current size at %{public}@", v117, 0xCu);

      }
      if (v55)
        goto LABEL_78;
    }
    else
    {

    }
LABEL_77:
    v111 = CFSTR("EKNotificationChangedChangeTypeKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v58;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_78:
    v59 = (void *)*((_QWORD *)v102 + 5);
    if (v59 && !objc_msgSend(v59, "count"))
    {
      objc_msgSend((id)objc_opt_class(), "logHandle");
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v117 = 0;
        _os_log_impl(&dword_1A2318000, v61, OS_LOG_TYPE_DEFAULT, "ChangIDs is empty. Skipping notification changed notification.", v117, 2u);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "effectiveCallbackQueue");
      v60 = objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_53;
      v65[3] = &unk_1E4785118;
      v65[4] = *(_QWORD *)(a1 + 32);
      v67 = buf;
      v66 = v55;
      dispatch_async(v60, v65);

    }
    v31 = v63;
    goto LABEL_85;
  }
  objc_msgSend((id)objc_opt_class(), "logHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2318000, v3, OS_LOG_TYPE_DEFAULT, "Data protection is on. Unable to check for updates.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_killTimer");
LABEL_89:

}

uint64_t __103___EKNotificationMonitor__fetchEventNotificationReferencesFromEventStore_earliestExpiringNotification___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __61___EKNotificationMonitor__notificationCountChangedExternally__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v1 + 40) || (++*(_DWORD *)(v1 + 88), *(_BYTE *)(*(_QWORD *)(result + 32) + 48)))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

void __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_50(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  objc_msgSend((id)objc_opt_class(), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A2318000, v2, OS_LOG_TYPE_DEFAULT, "Posting notification count changed notification.", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("EKNotificationCountChangedNotification"), *(_QWORD *)(a1 + 32), 0);

}

void __54___EKNotificationMonitor_blacklistedNotificationQueue__block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = objc_opt_new();
  v1 = (void *)_blacklistedNotifications;
  _blacklistedNotifications = v0;

  v2 = dispatch_queue_create("blacklistedNotificationQueue", 0);
  v3 = (void *)blacklistedNotificationQueue__blacklistedNotificationQueue;
  blacklistedNotificationQueue__blacklistedNotificationQueue = (uint64_t)v2;

}

void __35___EKNotificationMonitor_logHandle__block_invoke()
{
  const char *v0;
  objc_class *v1;
  os_log_t v2;
  void *v3;
  id v4;

  v0 = ekSubSystem;
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = os_log_create(v0, (const char *)objc_msgSend(v4, "UTF8String"));
  v3 = (void *)logHandle_logHandle;
  logHandle_logHandle = (uint64_t)v2;

}

void __103___EKNotificationMonitor__fetchEventNotificationReferencesFromEventStore_earliestExpiringNotification___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3 > 5)
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(a2, "notification");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A2318000, v5, OS_LOG_TYPE_DEFAULT, "Faulted in notification: %@.", (uint8_t *)&v6, 0xCu);
    }

  }
}

EKEventStore *__71___EKNotificationMonitor__initWithOptions_eventStore_eventStoreGetter___block_invoke()
{
  return objc_alloc_init(EKEventStore);
}

void __31___EKNotificationMonitor_start__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_eventStoreChanged");

}

uint64_t __30___EKNotificationMonitor_stop__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "notificationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30___EKNotificationMonitor_stop__block_invoke_2;
  block[3] = &unk_1E4785078;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v2, block);

  return objc_msgSend(*(id *)(a1 + 32), "_killTimer");
}

uint64_t __30___EKNotificationMonitor_stop__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  *(_QWORD *)(v2 + 112) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_killSyncTimer:", 0);
}

uint64_t __43___EKNotificationMonitor_notificationCount__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 104);
  return result;
}

void __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_41(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v2 = a1[4];
  if (!*(_QWORD *)(v2 + 40))
  {
    *(_DWORD *)(v2 + 88) = 0;
LABEL_7:
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
    goto LABEL_11;
  }
  v3 = *(_DWORD *)(v2 + 88);
  objc_msgSend((id)objc_opt_class(), "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 >= 1)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2318000, v4, OS_LOG_TYPE_DEFAULT, "Sync running, but we've been explicitly told to ignore that and refresh anyway.", buf, 2u);
    }

    --*(_DWORD *)(a1[4] + 88);
    goto LABEL_7;
  }
  if (v5)
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1A2318000, v4, OS_LOG_TYPE_DEFAULT, "Sync running. Waiting for it to finish before checking for updates.", v10, 2u);
  }

  *(_BYTE *)(a1[4] + 48) = 1;
LABEL_11:
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v6 = a1[4];
    if (*(_BYTE *)(v6 + 97))
    {
      if (*(_BYTE *)(v6 + 72))
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(v6 + 80));
        v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v8 = a1[4];
        v9 = *(void **)(v8 + 80);
        *(_QWORD *)(v8 + 80) = v7;

      }
      else
      {
        objc_msgSend(*(id *)(v6 + 80), "removeAllObjects");
        *(_BYTE *)(a1[4] + 72) = 1;
      }
    }
  }
}

void __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_42(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 104);
  *(_QWORD *)(a1[4] + 104) = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  objc_msgSend((id)objc_opt_class(), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1[4] + 104));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A2318000, v2, OS_LOG_TYPE_DEFAULT, "Set notification count to %{public}@.", (uint8_t *)&v4, 0xCu);

  }
}

void __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_44(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 112));
  objc_storeStrong((id *)(a1[4] + 112), *(id *)(*(_QWORD *)(a1[6] + 8) + 40));
  objc_msgSend((id)objc_opt_class(), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1[4] + 112);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1A2318000, v2, OS_LOG_TYPE_DEFAULT, "Set notification references to %@.", (uint8_t *)&v4, 0xCu);
  }

}

void __53___EKNotificationMonitor_attemptReloadSynchronously___block_invoke_56(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  objc_msgSend((id)objc_opt_class(), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A2318000, v2, OS_LOG_TYPE_DEFAULT, "Initial check. Sending notification.", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("EKNotificationsLoadedNotification"), *(_QWORD *)(a1 + 32), 0);

}

uint64_t __61___EKNotificationMonitor_addBlacklistedNotificationObjectID___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)_blacklistedNotifications, "addObject:", *(_QWORD *)(a1 + 32));
}

void __43___EKNotificationMonitor_blacklistedRowIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend((id)_blacklistedNotifications, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __43___EKNotificationMonitor_blacklistedRowIDs__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "rowID"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __103___EKNotificationMonitor__fetchEventNotificationReferencesFromEventStore_earliestExpiringNotification___block_invoke_70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend((id)_blacklistedNotifications, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __39___EKNotificationMonitor__syncDidStart__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetSyncTimer");
}

uint64_t __38___EKNotificationMonitor__syncDidEnd___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  uint64_t result;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "logHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48))
      v3 = CFSTR("pending");
    else
      v3 = CFSTR("no pending");
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1A2318000, v2, OS_LOG_TYPE_DEFAULT, "Sync done, %@ changes.", (uint8_t *)&v6, 0xCu);
  }

  result = objc_msgSend(*(id *)(a1 + 32), "_killSyncTimer:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 48))
  {
    *(_BYTE *)(v5 + 48) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void __50___EKNotificationMonitor_trackChangesInEventStore__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, char a6)
{
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  char v18;

  v9 = a3;
  v10 = a5;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(NSObject **)(v11 + 128);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___EKNotificationMonitor_trackChangesInEventStore__block_invoke_2;
  block[3] = &unk_1E4785360;
  block[4] = v11;
  v16 = v10;
  v18 = a6;
  v17 = v9;
  v13 = v9;
  v14 = v10;
  dispatch_sync(v12, block);

}

void __50___EKNotificationMonitor_trackChangesInEventStore__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 72) && !*(_BYTE *)(a1 + 56))
  {
    if (*(_QWORD *)(a1 + 48))
    {
      v3 = *(void **)(v2 + 80);
      +[EKObjectID EKObjectIDsFromData:](EKObjectID, "EKObjectIDsFromData:");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObjectsFromArray:", v4);

    }
    else
    {
      *(_BYTE *)(v2 + 72) = 0;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");
    }
  }
}

@end
