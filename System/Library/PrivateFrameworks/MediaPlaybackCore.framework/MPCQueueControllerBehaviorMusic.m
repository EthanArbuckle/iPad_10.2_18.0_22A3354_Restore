@implementation MPCQueueControllerBehaviorMusic

void __53___MPCQueueControllerBehaviorMusic_didConnectToHost___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "state") != 1)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "playbackContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_emitEventsForAddingPlaybackContext:sectionIdentifier:", v7, v8);

  }
}

void __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  os_log_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  void *v60;
  BOOL v61;
  void *v62;
  void *v63;
  char v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  NSObject *v75;
  _QWORD *v76;
  void *v77;
  id *v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  id *location;
  id *locationa;
  char *spid;
  _QWORD block[4];
  id v89;
  char *v90;
  _QWORD v91[9];
  id v92[2];
  _QWORD v93[9];
  id v94[2];
  uint8_t v95[16];
  id v96;
  _QWORD v97[4];
  id v98;
  uint64_t v99;
  id v100;
  id v101;
  id v102;
  os_log_t v103;
  char *v104;
  id v105;
  _QWORD v106[4];
  NSObject *v107;
  uint8_t buf[4];
  id v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  id v113;
  __int16 v114;
  id v115;
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior_Oversize");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "engineID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v109 = v8;
    v110 = 2114;
    v111 = v9;
    v112 = 2114;
    v113 = v6;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | processing dataSourceState=%{public}@", buf, 0x20u);

  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "hasSection:", v5) & 1) != 0
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "hasSection:", v5) & 1) != 0)
  {
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sessionID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v109 = v11;
      v110 = 2114;
      v111 = v12;
      v112 = 2048;
      v113 = v6;
      v114 = 2114;
      v115 = v5;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | restored [success] dataSourceState=%p sectionID=%{public}@", buf, 0x2Au);

    }
    v13 = os_log_create("com.apple.amp.mediaplaybackcore", "Default");
    spid = (char *)os_signpost_id_make_with_pointer(v13, v6);

    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v15 = v14;
    location = (id *)(spid - 1);
    if ((unint64_t)(spid - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 138543362;
      v109 = v5;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v15, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "QC-FinalizeDataSource", "section=%{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "eventStream");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEventStream:", v16);

    objc_msgSend(*(id *)(a1 + 32), "playerID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlayerID:", v17);

    objc_msgSend(v6, "playbackContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "clearStartItem");

    objc_msgSend(v6, "playbackContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShuffleType:", 0);

    objc_msgSend(v6, "playbackContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "playbackContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(a1 + 48);
      if (v23)
      {
        objc_msgSend(v23, "sectionID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "itemID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "isEqualToString:", v24))
        {
          objc_msgSend(*(id *)(a1 + 40), "_identifierListForSection:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "hasItem:inSection:", v25, v24)
            && (objc_msgSend(v26, "isDeletedItem:inSection:", v25, v24) & 1) == 0)
          {
            objc_msgSend(v6, "dataSource");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v106[0] = MEMORY[0x24BDAC760];
            v106[1] = 3221225472;
            v106[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_147;
            v106[3] = &unk_24CABA158;
            v107 = *(id *)(a1 + 48);
            objc_msgSend(v33, "identifierRegistryWithExclusiveAccessReturningObject:", v106);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setStartItemIdentifiers:", v34);

            v27 = v107;
          }
          else
          {
            v27 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(*(id *)(a1 + 32), "engineID");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "sessionID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544130;
              v109 = v28;
              v110 = 2114;
              v111 = v29;
              v112 = 2114;
              v113 = v24;
              v114 = 2114;
              v115 = v25;
              _os_log_impl(&dword_210BD8000, v27, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | ignoring start item [no longer in SIL/AutoPlay-SIL] startingSectionID=%{public}@ startingItemID=%{public}@", buf, 0x2Au);

            }
          }

        }
      }

    }
    objc_msgSend(v6, "playbackContext");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "conformsToProtocol:", &unk_254A9D5E8);

    if (v36)
    {
      objc_msgSend(v6, "playbackContext");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v39 = v38;
      if ((unint64_t)location < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v38))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v39, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "QC-FinalizeDataSource-Rectify", ", buf, 2u);
      }

      objc_msgSend(v37, "playbackRequestEnvironment");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = 0;
      objc_msgSend(v40, "rectifiedPlaybackRequestEnvironmentWithReasons:", &v105);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v105;

      if (v41)
      {
        v43 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "engineID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "sessionID");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "componentsJoinedByString:", CFSTR(", "));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v109 = v44;
          v110 = 2114;
          v111 = v45;
          v112 = 2114;
          v113 = v46;
          v114 = 2114;
          v115 = v5;
          _os_log_impl(&dword_210BD8000, v43, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | account rectification [%{public}@] sectionID=%{public}@", buf, 0x2Au);

        }
        objc_msgSend(v37, "setPlaybackRequestEnvironment:", v41);
      }
      v47 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v48 = v47;
      if ((unint64_t)location <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
      {
        objc_msgSend(v42, "componentsJoinedByString:", CFSTR(", "));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v109 = v49;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v48, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)spid, "QC-FinalizeDataSource-Rectify", "reasons=%{public}@", buf, 0xCu);

      }
    }
    v50 = *(void **)(a1 + 40);
    objc_msgSend(v6, "playbackContext");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifier");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "_emitEventsForAddingPlaybackContext:sectionIdentifier:", v51, v52);

    v53 = dispatch_group_create();
    dispatch_group_enter(v53);
    v54 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v55 = v54;
    if ((unint64_t)location < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v54))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v55, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "QC-FinalizeDataSource-Replace", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_identifierListForSection:", v5);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = MEMORY[0x24BDAC760];
    v97[1] = 3221225472;
    v97[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_199;
    v97[3] = &unk_24CAB3270;
    v56 = *(id *)(a1 + 32);
    v57 = *(_QWORD *)(a1 + 40);
    v98 = v56;
    v99 = v57;
    v58 = v6;
    v100 = v58;
    v59 = v5;
    v101 = v59;
    v102 = *(id *)(a1 + 56);
    v104 = spid;
    v30 = v53;
    v103 = v30;
    objc_msgSend(v84, "replaceDataSource:forSection:completion:", v58, v59, v97);
    if (!objc_msgSend(v58, "shouldAddOriginalPlaybackContextAfterReplacement"))
      goto LABEL_61;
    objc_msgSend(v58, "originalPlaybackContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v60 == 0;

    if (v61)
      goto LABEL_61;
    objc_msgSend(v58, "originalPlaybackContext");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v58, "originalPlaybackContext");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_opt_respondsToSelector();

      if ((v64 & 1) == 0)
        goto LABEL_54;
      objc_msgSend(v58, "originalPlaybackContext");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v66 = v65;
      if ((unint64_t)location < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v65))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v66, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "QC-FinalizeDataSource-Original-Rectify", ", buf, 2u);
      }

      objc_msgSend(v62, "playbackRequestEnvironment");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = 0;
      objc_msgSend(v67, "rectifiedPlaybackRequestEnvironmentWithReasons:", &v96);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = v96;

      if (v68)
      {
        v69 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "engineID");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "sessionID");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "componentsJoinedByString:", CFSTR(", "));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v109 = v82;
          v110 = 2114;
          v111 = v70;
          v112 = 2114;
          v113 = v81;
          v114 = 2114;
          v115 = v59;
          _os_log_impl(&dword_210BD8000, v69, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | account rectification for originalPlaybackContext [%{public}@] sectionID=%{public}@", buf, 0x2Au);

        }
        objc_msgSend(v62, "setPlaybackRequestEnvironment:", v68);
      }
      v71 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v72 = v71;
      if ((unint64_t)location <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
      {
        objc_msgSend(v83, "componentsJoinedByString:", CFSTR(", "));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v109 = v73;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v72, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)spid, "QC-FinalizeDataSource-Original-Rectify", "reasons=%{public}@", buf, 0xCu);

      }
    }

LABEL_54:
    objc_initWeak((id *)buf, *(id *)(a1 + 40));
    dispatch_group_enter(v30);
    v74 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    v75 = v74;
    if ((unint64_t)location < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v74))
    {
      *(_WORD *)v95 = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v75, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)spid, "QC-FinalizeDataSource-Add", ", v95, 2u);
    }

    v76 = *(_QWORD **)(a1 + 40);
    if (v84 == (void *)v76[11])
    {
      objc_msgSend(v58, "originalPlaybackContext");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v93[0] = MEMORY[0x24BDAC760];
      v93[1] = 3221225472;
      v93[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_204;
      v93[3] = &unk_24CAB3298;
      v78 = (id *)v93;
      locationa = v94;
      objc_copyWeak(v94, (id *)buf);
      v93[4] = *(id *)(a1 + 32);
      v93[5] = v58;
      v80 = v59;
      v93[6] = v80;
      v93[7] = *(id *)(a1 + 56);
      v94[1] = spid;
      v93[8] = v30;
      objc_msgSend(v76, "_addPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:", v77, 100, 0, v80, 16, v93);
    }
    else
    {
      objc_msgSend(v58, "originalPlaybackContext");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v91[0] = MEMORY[0x24BDAC760];
      v91[1] = 3221225472;
      v91[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_207;
      v91[3] = &unk_24CAB3298;
      v78 = (id *)v91;
      locationa = v92;
      objc_copyWeak(v92, (id *)buf);
      v91[4] = *(id *)(a1 + 32);
      v91[5] = v58;
      v79 = v59;
      v91[6] = v79;
      v91[7] = *(id *)(a1 + 56);
      v92[1] = spid;
      v91[8] = v30;
      objc_msgSend(v76, "_addAutoPlayPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:", v77, 100, 0, v79, 16, v91);
    }

    objc_destroyWeak(locationa);
    objc_destroyWeak((id *)buf);
LABEL_61:
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 64));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_210;
    block[3] = &unk_24CAB90B0;
    v90 = spid;
    v89 = *(id *)(a1 + 64);
    dispatch_group_notify(v30, MEMORY[0x24BDAC9B8], block);

    goto LABEL_62;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 120), "setObject:forKeyedSubscript:", 0, v5);
  v30 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "engineID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v109 = v31;
    v110 = 2114;
    v111 = v32;
    v112 = 2114;
    v113 = v5;
    _os_log_impl(&dword_210BD8000, v30, OS_LOG_TYPE_FAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | skipping section [sectionID not in SIL/AutoPlay-SIL] sectionID=%{public}@", buf, 0x20u);

  }
LABEL_62:

}

void __94___MPCQueueControllerBehaviorMusic_isExportableSessionType_forContentItemID_extension_reason___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  char v8;
  id obj;

  objc_msgSend(a3, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "containsTransportableContentWithReason:", &obj);
  objc_storeStrong((id *)(v7 + 40), obj);

  if ((v8 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

BOOL __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

id __85___MPCQueueControllerBehaviorMusic__updateGroupSessionParticipants_localParticipant___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  MPCSharedSessionParticipant *v3;
  id v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  void *v10;
  objc_super v12;

  if (a2)
  {
    v2 = a2;
    v3 = [MPCSharedSessionParticipant alloc];
    if (v3)
    {
      v12.receiver = v3;
      v12.super_class = (Class)MPCSharedSessionParticipant;
      v4 = objc_msgSendSuper2(&v12, sel_init);
      v5 = v4;
      if (v4)
        *((_QWORD *)v4 + 2) = 2;
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v2, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_setProperty_nonatomic_copy(v5, v6, v7, 48);

    objc_msgSend(v2, "identity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_setProperty_nonatomic_copy(v5, v9, v10, 56);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

uint64_t __85___MPCQueueControllerBehaviorMusic__updateGroupSessionParticipants_localParticipant___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  if (!v5)
  {
    v8 = (void *)MEMORY[0x24BDD1448];
    v9 = a3;
    objc_msgSend(v8, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("_MPCQueueControllerBehaviorMusic.m"), 3827, CFSTR("Failed to create AutoPlay playback queue: %@"), v9);

  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke_2;
  v11[3] = &unk_24CAB35E0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 80);
  v11[4] = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 72);
  objc_msgSend(v5, "getMusicPlaybackContextWithOptions:completion:", 0, v11);

}

void __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id location;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("_MPCQueueControllerBehaviorMusic.m"), 3829, CFSTR("Failed to create AutoPlay playbackContext: %@"), v6);

  }
  v7 = v5;
  objc_msgSend(*(id *)(a1 + 40), "userIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserIdentity:", v8);

  objc_msgSend(v7, "setContinueListeningMaxQueueReferences:", objc_msgSend(*(id *)(a1 + 48), "continueListeningMaxQueueSizeInRequest"));
  objc_msgSend(v7, "setContinueListeningPrefetchThreshold:", objc_msgSend(*(id *)(a1 + 48), "continueListeningMaxUpcomingTracksSizeToMaintain"));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v10 = v7;
  objc_copyWeak(&v14, &location);
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 72);
  msv_dispatch_on_main_queue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke_4;
  v4[3] = &unk_24CAB3590;
  objc_copyWeak(&v8, (id *)(a1 + 72));
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v2, "_addAutoPlayPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:", v3, 2, 0, 0, 16, v4);

  objc_destroyWeak(&v8);
}

void __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke_4(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v7 = v3;
  v8 = a1[4];
  v9 = a1[5];
  v10 = a1[6];
  v5 = v3;
  v6 = WeakRetained;
  msv_dispatch_on_main_queue();

}

void __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

  }
  if (*(_QWORD *)(a1 + 40))
  {
    if ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) | 2) == 3)
    {
      v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 48), "engineID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "sessionID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
        if (v8 >= 0xA)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnexpectedState:%ld"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = off_24CAB3730[v8];
        }
        v17 = *(_QWORD *)(a1 + 56);
        v18 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138544386;
        v20 = v6;
        v21 = 2114;
        v22 = v7;
        v23 = 2114;
        v24 = v9;
        v25 = 2114;
        v26 = v17;
        v27 = 2114;
        v28 = v18;
        _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_ERROR, "[AOT:%{public}@:%{public}@] _transitionToAutoPlayState:… | failed to enable, not updating state [already in %{public}@ state] transition=%{public}@ error=%{public}@", buf, 0x34u);

      }
    }
    else
    {
      v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 48), "engineID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "sessionID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(__CFString **)(a1 + 56);
        v15 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v20 = v12;
        v21 = 2114;
        v22 = v13;
        v23 = 2114;
        v24 = v14;
        v25 = 2114;
        v26 = v15;
        _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "[AOT:%{public}@:%{public}@] _transitionToAutoPlayState:… | disabling autoplay [failed to enable] transition=%{public}@ error=%{public}@", buf, 0x2Au);

      }
      v16 = *(_QWORD **)(a1 + 32);
      if (v16[13] != 2)
        objc_msgSend(v16, "_transitionToAutoPlayState:", 2);
    }
  }
  else
  {
    v10 = *(_QWORD **)(a1 + 32);
    if (*(_QWORD *)(a1 + 64) == v10[12] && v10[13] == 6)
      objc_msgSend(v10, "_transitionToAutoPlayState:", 7);
  }
}

id __55___MPCQueueControllerBehaviorMusic__itemForComponents___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDDC6D8]), "initWithToken:dataSource:", CFSTR("AutoPlayPlaceholder"), *(_QWORD *)(a1 + 32));
}

void __76___MPCQueueControllerBehaviorMusic__evaluateLoadingDataSourceItemThresholds__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "shouldRequestAdditionalItemsAtTail"))
  {
    v7 = objc_msgSend(v6, "prefetchThreshold");
    if (v7 >= 1)
    {
      v8 = v7;
      v9 = objc_msgSend(*(id *)(a1 + 32), "_countOfItemsWithinSection:maxCount:", v5, v7);
      v10 = v8 - v9;
      v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "engineID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "sessionID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        v21 = v12;
        v22 = 2114;
        v23 = v13;
        v24 = 2114;
        v25 = v5;
        v26 = 2048;
        v27 = v8;
        v28 = 2048;
        v29 = v9;
        _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[CUTS:%{public}@:%{public}@] _evaluateLoadingDataSourceItemThresholds | evaluating [] sectionID=%{public}@ threshold=%ld itemCount>=%ld", buf, 0x34u);

      }
      if (v10 >= 1)
      {
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __76___MPCQueueControllerBehaviorMusic__evaluateLoadingDataSourceItemThresholds__block_invoke_461;
        v16[3] = &unk_24CAB3568;
        v14 = *(id *)(a1 + 40);
        v15 = *(_QWORD *)(a1 + 32);
        v17 = v14;
        v18 = v15;
        v19 = v5;
        objc_msgSend(v6, "loadAdditionalItemsIfNeededWithCount:completion:", v10, v16);

      }
    }
  }

}

void __76___MPCQueueControllerBehaviorMusic__evaluateLoadingDataSourceItemThresholds__block_invoke_461(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "engineID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 48);
    v6 = 138543874;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "[CUTS:%{public}@:%{public}@] _evaluateLoadingDataSourceItemThresholds | completed [] sectionID=%{public}@", (uint8_t *)&v6, 0x20u);

  }
}

void __131___MPCQueueControllerBehaviorMusic__addAutoPlayPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;

  v3 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __131___MPCQueueControllerBehaviorMusic__addAutoPlayPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_2;
  v9[3] = &unk_24CAB3518;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 72);
  v17 = *(_BYTE *)(a1 + 80);
  v15 = v3;
  v16 = v7;
  v8 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __131___MPCQueueControllerBehaviorMusic__addAutoPlayPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isEqualToString:", v3);

  if ((v2 & 1) == 0)
  {
    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 48), "engineID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sessionID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *(void **)(a1 + 56);
      objc_msgSend(v25, "sectionIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138544130;
      v29 = v23;
      v30 = 2114;
      v31 = v24;
      v32 = 2048;
      v33 = v25;
      v34 = 2114;
      v35 = v26;
      _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | rolling back edit [autoPlayIdentifierList changed before dataSource finished loading] dataSource=%p section=%{public}@", (uint8_t *)&v28, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 64), "rollback");
    v27 = *(_QWORD *)(a1 + 80);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, CFSTR("autoPlayIdentifierList is nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v21);
    goto LABEL_20;
  }
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(*(id *)(a1 + 56), "preferredStartItemIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 56), "sectionIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "preferredStartItemIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "contentItemID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setSuggestedContentItemIDForStart:", v8);
      v9 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "engineID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "sessionID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543874;
        v29 = v10;
        v30 = 2114;
        v31 = v11;
        v32 = 2114;
        v33 = v8;
        _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | setting suggested start item on edit [first data source loaded] suggestedContentItemIDForStart=%{public}@", (uint8_t *)&v28, 0x20u);

      }
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 128) != 1)
  {
    v12 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "engineID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sessionID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v13;
      v30 = 2114;
      v31 = v14;
      _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | behavior state changed [first data source loaded] state=Ready", (uint8_t *)&v28, 0x16u);

    }
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128) = 1;
  }
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "engineID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v16;
    v30 = 2114;
    v31 = v17;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | committing edit [added data source]", (uint8_t *)&v28, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 64), "commit");
  if (*(_QWORD *)(a1 + 80))
  {
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "engineID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sessionID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 138543618;
      v29 = v19;
      v30 = 2114;
      v31 = v20;
      _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | calling completion [added data source]", (uint8_t *)&v28, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 72), "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, CFSTR("adding data source failed (autoplay SIL)"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 80) + 16))(*(_QWORD *)(a1 + 80), v21);
LABEL_20:

  }
}

void __123___MPCQueueControllerBehaviorMusic__addPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "engineID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | freezing section [play last] sectionID=%{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(v6, "setFrozen:", 1);

}

void __123___MPCQueueControllerBehaviorMusic__addPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_446(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  __int128 v17;
  char v18;

  v3 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __123___MPCQueueControllerBehaviorMusic__addPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_2;
  v9[3] = &unk_24CAB34C8;
  v17 = *(_OWORD *)(a1 + 80);
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 56);
  v18 = *(_BYTE *)(a1 + 96);
  v14 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 72);
  v15 = v3;
  v16 = v7;
  v8 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __123___MPCQueueControllerBehaviorMusic__addPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(a1 + 88) & 2) != 0 && *(_QWORD *)(a1 + 96))
  {
    v2 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sessionID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      MPShuffleTypeDescription();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "preferredStartItemIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "sectionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138544386;
      v33 = v3;
      v34 = 2114;
      v35 = v4;
      v36 = 2114;
      v37 = v5;
      v38 = 2114;
      v39 = v6;
      v40 = 2114;
      v41 = v7;
      _os_log_impl(&dword_210BD8000, v2, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | setting shuffle type [first data source loaded] shuffleType=%{public}@ startItem=%{public}@ startSection=%{public}@", (uint8_t *)&v32, 0x34u);

    }
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) = *(_QWORD *)(a1 + 96);
    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
    v9 = *(_QWORD *)(a1 + 96);
    objc_msgSend(*(id *)(a1 + 48), "preferredStartItemIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "sectionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShuffleType:startingItem:inSection:", v9, v10, v11);

    objc_msgSend(*(id *)(a1 + 40), "_emitEventsForPlaybackBehaviorChangeIfNeeded");
    objc_msgSend(*(id *)(a1 + 56), "behavior:didChangeShuffleType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 96));
  }
  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 48), "preferredStartItemIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 48), "sectionIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "preferredStartItemIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "contentItemID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 64), "setSuggestedContentItemIDForStart:", v16);
      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "engineID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "sessionID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = *(void **)(a1 + 64);
        v32 = 138544130;
        v33 = v18;
        v34 = 2114;
        v35 = v19;
        v36 = 2114;
        v37 = v16;
        v38 = 2114;
        v39 = v20;
        _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | setting suggested start item on edit [first data source loaded] suggestedContentItemIDForStart=%{public}@ edit=%{public}@", (uint8_t *)&v32, 0x2Au);

      }
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 128) != 1)
  {
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sessionID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v22;
      v34 = 2114;
      v35 = v23;
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | behavior state changed [first data source loaded] state=Ready", (uint8_t *)&v32, 0x16u);

    }
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128) = 1;
  }
  v24 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "engineID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(void **)(a1 + 64);
    v32 = 138543874;
    v33 = v25;
    v34 = 2114;
    v35 = v26;
    v36 = 2114;
    v37 = v27;
    _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | committing edit [added data source] edit=%{public}@", (uint8_t *)&v32, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 64), "commit");
  if (*(_QWORD *)(a1 + 80))
  {
    v28 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sessionID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v29;
      v34 = 2114;
      v35 = v30;
      _os_log_impl(&dword_210BD8000, v28, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | calling completion [added data source]", (uint8_t *)&v32, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 72), "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, CFSTR("adding data source failed"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

  }
}

void __85___MPCQueueControllerBehaviorMusic_didDequeueShuffledItemsInSectionedIdentifierList___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128))
  {
    objc_msgSend(v2, "beginEditWithReason:", CFSTR("BehaviorMusic-didDequeueShuffledItems"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "engineID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] didDequeueShuffledItemsInSectionedIdentifierList: | committing edit [ShuffleSIL dequeued items]", (uint8_t *)&v10, 0x16u);

    }
    -[NSObject commit](v4, "commit");
  }
  else
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "engineID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] didDequeueShuffledItemsInSectionedIdentifierList: | ignoring SIL change [state: Loading]", (uint8_t *)&v10, 0x16u);

    }
  }

}

void __87___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidUpdateSection___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatePlaybackContext");
  objc_msgSend(*(id *)(a1 + 32), "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "behaviorDidChange");

}

void __95___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidChangeItems_inSection___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "host");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "upNextBehaviorDidChange");

}

void __95___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidUpdateItems_inSection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128))
  {
    objc_msgSend(v2, "beginEditWithReason:", CFSTR("BehaviorMusic-dataSourceDidUpdateItems"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "engineID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidUpdateItems:inSection: | committing edit [data source updated items]", (uint8_t *)&v10, 0x16u);

    }
    -[NSObject commit](v4, "commit");
  }
  else
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "engineID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidUpdateItems:inSection: | ignoring SIL change [state: Loading]", (uint8_t *)&v10, 0x16u);

    }
  }

}

void __92___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidAddItems_toSection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id obj;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "host");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v2 = a1;
  obj = *(id *)(a1 + 40);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v41 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v39, "eventStream");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(v2 + 48);
        v52[0] = CFSTR("queue-section-id");
        v52[1] = CFSTR("queue-item-id");
        v53[0] = v9;
        v53[1] = v7;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "emitEventType:payload:", CFSTR("queue-item-add"), v10);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v4);
  }

  v11 = v2;
  v12 = *(_QWORD **)(v2 + 32);
  v13 = v12[13];
  if (v13 == 5)
  {
    objc_msgSend(v12, "queueReferencesWithMaxCount:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v14, "count");
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    v20 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v20)
      {
        objc_msgSend(v39, "engineID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v2 + 32), "sessionID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v21;
        v46 = 2114;
        v47 = v22;
        _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidAddItems:toSection: | autoplay disabled [finished waitingForItems]", buf, 0x16u);

      }
      v23 = 3;
    }
    else
    {
      if (v20)
      {
        objc_msgSend(v39, "engineID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v2 + 32), "sessionID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v26;
        v46 = 2114;
        v47 = v27;
        _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidAddItems:toSection: | autoplay unsupported [no queue references]", buf, 0x16u);

      }
      v23 = 1;
    }
    goto LABEL_29;
  }
  if (v13 == 4)
  {
    objc_msgSend(v12, "queueReferencesWithMaxCount:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v14, "count");
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    v25 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (!v24)
    {
      if (v25)
      {
        objc_msgSend(v39, "engineID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v2 + 32), "sessionID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v28;
        v46 = 2114;
        v47 = v29;
        _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidAddItems:toSection: | autoplay unsupported [no queue references]", buf, 0x16u);

      }
      v23 = 2;
      goto LABEL_29;
    }
    if (v25)
    {
      objc_msgSend(v39, "engineID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v2 + 32), "sessionID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v16;
      v46 = 2114;
      v47 = v17;
      v18 = "[AOT:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidAddItems:toSection: | autoplay waiting for "
            "trigger [finished waitingForItems]";
      goto LABEL_21;
    }
LABEL_22:
    v23 = 9;
LABEL_29:

    objc_msgSend(*(id *)(v2 + 32), "_transitionToAutoPlayState:", v23);
    goto LABEL_30;
  }
  if (v13 != 2)
    goto LABEL_31;
  objc_msgSend(v12, "queueReferencesWithMaxCount:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v39, "engineID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v2 + 32), "sessionID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v16;
      v46 = 2114;
      v47 = v17;
      v18 = "[AOT:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidAddItems:toSection: | autoplay waiting for "
            "trigger [new supported content]";
LABEL_21:
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);

      goto LABEL_22;
    }
    goto LABEL_22;
  }
LABEL_30:

  v12 = *(_QWORD **)(v2 + 32);
LABEL_31:
  v30 = v12[16];
  v31 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
  if (v30)
  {
    if (v32)
    {
      objc_msgSend(v39, "engineID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v11 + 32), "sessionID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(_QWORD *)(v11 + 48);
      v35 = *(_QWORD *)(v11 + 56);
      *(_DWORD *)buf = 138544130;
      v45 = v33;
      v46 = 2114;
      v47 = v34;
      v48 = 2048;
      v49 = v35;
      v50 = 2114;
      v51 = v36;
      _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:%p dataSourceDidAddItems:inSection:%{public}@ | editing [data source added items]", buf, 0x2Au);

LABEL_36:
    }
  }
  else if (v32)
  {
    objc_msgSend(v39, "engineID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v11 + 32), "sessionID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v33;
    v46 = 2114;
    v47 = v37;
    _os_log_impl(&dword_210BD8000, v31, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:dataSourceDidAddItems:inSection: | ignoring SIL change [state: Loading]", buf, 0x16u);

    goto LABEL_36;
  }

}

void __97___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidRemoveItems_fromSection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 40);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v18;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v6);
        objc_msgSend(v2, "eventStream");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(a1 + 48);
        v29[0] = CFSTR("queue-section-id");
        v29[1] = CFSTR("queue-item-id");
        v30[0] = v9;
        v30[1] = v7;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "emitEventType:payload:", CFSTR("queue-item-remove"), v10);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
    }
    while (v4);
  }

  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "engineID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "sessionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138544130;
    v22 = v12;
    v23 = 2114;
    v24 = v13;
    v25 = 2048;
    v26 = v14;
    v27 = 2114;
    v28 = v15;
    _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:%p dataSourceDidRemoveItems:inSection:%{public}@ | editing [data source removed items]", buf, 0x2Au);

  }
}

void __98___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidEndTransactionForSection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128))
  {
    objc_msgSend(v2, "beginEditWithReason:", CFSTR("BehaviorMusic-dataSourceDidEndTransaction"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "engineID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      v14 = 138544130;
      v15 = v6;
      v16 = 2114;
      v17 = v7;
      v18 = 2048;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:%p dataSourceDidEndTransactionForSection:%{public}@ | committing edit [data source ended transaction]", (uint8_t *)&v14, 0x2Au);

    }
    -[NSObject commit](v4, "commit");
    objc_msgSend(*(id *)(a1 + 32), "_evaluateLoadingDataSourceItemThresholds");
  }
  else
  {
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "engineID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v14 = 138544130;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      v18 = 2048;
      v19 = v12;
      v20 = 2114;
      v21 = v13;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:%p dataSourceDidEndTransactionForSection:%{public}@ | ignoring SIL change [state: Loading]", (uint8_t *)&v14, 0x2Au);

    }
  }

}

void __90___MPCQueueControllerBehaviorMusic_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "host");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 104) == 9)
  {
    *(_BYTE *)(v3 + 41) = 1;
    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "engineID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v5;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] loadRepresentationForArtworkCatalog:completionHandler: | evaluating autoPlayIsTriggered [loading artwork for autoPlayPlaceholder] triggered=YES", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_transitionToAutoPlayState:", 9);
    v7 = CFSTR("AutoPlayArtwork - AutoPlay triggered");
  }
  else
  {
    v7 = CFSTR("AutoPlayArtwork - Trigger is not needed");
  }
  v8 = *(_QWORD *)(a1 + 40);
  v9 = (void *)MEMORY[0x24BDD1540];
  v12 = *MEMORY[0x24BDD0BA0];
  v13 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("MPCMusicBehaviorError"), 7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v11);

}

void __68___MPCQueueControllerBehaviorMusic_clearAllItemsAfterContentItemID___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "host");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "upNextBehaviorDidChange");

}

void __67___MPCQueueControllerBehaviorMusic_removeContentItemID_completion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "host");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "upNextBehaviorDidChange");

}

void __85___MPCQueueControllerBehaviorMusic_moveContentItemID_beforeContentItemID_completion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "host");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "upNextBehaviorDidChange");

}

void __84___MPCQueueControllerBehaviorMusic_moveContentItemID_afterContentItemID_completion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "host");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "upNextBehaviorDidChange");

}

void __137___MPCQueueControllerBehaviorMusic__qfa_performInsertPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_363(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  char v19;

  v3 = a2;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __137___MPCQueueControllerBehaviorMusic__qfa_performInsertPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_2_364;
  v9[3] = &unk_24CAB3478;
  v18 = *(_QWORD *)(a1 + 88);
  v10 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v11 = v4;
  v12 = v5;
  v13 = v6;
  v14 = *(id *)(a1 + 64);
  v19 = *(_BYTE *)(a1 + 96);
  v15 = *(id *)(a1 + 72);
  v7 = *(id *)(a1 + 80);
  v16 = v3;
  v17 = v7;
  v8 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __137___MPCQueueControllerBehaviorMusic__qfa_performInsertPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_2_364(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
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
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)(a1 + 96) & 2) != 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "shuffleType");
    if (v2)
    {
      v3 = v2;
      v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "engineID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "sessionID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        MPShuffleTypeDescription();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "preferredStartItemIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "sectionIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 138544386;
        v36 = v5;
        v37 = 2114;
        v38 = v6;
        v39 = 2114;
        v40 = v7;
        v41 = 2114;
        v42 = v8;
        v43 = 2114;
        v44 = v9;
        _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | setting shuffle type [first data source loaded] shuffleType=%{public}@ startItem=%{public}@ startSection=%{public}@", (uint8_t *)&v35, 0x34u);

      }
      *(_QWORD *)(*(_QWORD *)(a1 + 48) + 72) = v3;
      v10 = *(void **)(*(_QWORD *)(a1 + 48) + 88);
      objc_msgSend(*(id *)(a1 + 56), "preferredStartItemIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "sectionIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShuffleType:startingItem:inSection:", v3, v11, v12);

      objc_msgSend(*(id *)(a1 + 48), "_emitEventsForPlaybackBehaviorChangeIfNeeded");
      objc_msgSend(*(id *)(a1 + 64), "behavior:didChangeShuffleType:", *(_QWORD *)(a1 + 48), v3);
    }
  }
  if (*(_BYTE *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 56), "preferredStartItemIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 56), "sectionIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "preferredStartItemIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "contentItemID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "setSuggestedContentItemIDForStart:", v17);
      v18 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "engineID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "sessionID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(void **)(a1 + 72);
        v35 = 138544130;
        v36 = v19;
        v37 = 2114;
        v38 = v20;
        v39 = 2114;
        v40 = v17;
        v41 = 2114;
        v42 = v21;
        _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | setting suggested start item on edit [first data source loaded] suggestedContentItemIDForStart=%{public}@ edit=%{public}@", (uint8_t *)&v35, 0x2Au);

      }
    }
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 128) != 1)
  {
    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "engineID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "sessionID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v23;
      v37 = 2114;
      v38 = v24;
      _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | behavior state changed [first data source loaded] state=Ready", (uint8_t *)&v35, 0x16u);

    }
    *(_QWORD *)(*(_QWORD *)(a1 + 48) + 128) = 1;
  }
  v25 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "engineID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "sessionID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(void **)(a1 + 72);
    v35 = 138543874;
    v36 = v26;
    v37 = 2114;
    v38 = v27;
    v39 = 2114;
    v40 = v28;
    _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | committing edit [added data source] edit=%{public}@", (uint8_t *)&v35, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 72), "commit");
  if (*(_QWORD *)(a1 + 88))
  {
    v29 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "engineID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "sessionID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138543618;
      v36 = v30;
      v37 = 2114;
      v38 = v31;
      _os_log_impl(&dword_210BD8000, v29, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | calling completion [added data source]", (uint8_t *)&v35, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 80), "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, CFSTR("adding data source failed"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *(_QWORD *)(a1 + 88);
    objc_msgSend(*(id *)(a1 + 56), "preferredStartContentItemID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v33 + 16))(v33, v34, v32);

  }
}

void __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  _BOOL8 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  int v32;
  void *v33;
  void *v34;
  char v35;
  id *v36;
  id v37;
  id *v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v17 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3000, v6, CFSTR("Failed to build playback context from queue: %@"), *(_QWORD *)(a1 + 32));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "associatedParticipantIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAssociatedParticipantIdentifier:", v8);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "contentItemID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(*(id *)(a1 + 48), "_itemForContentItemID:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isPlaceholder") & 1) == 0)
        {
          objc_msgSend(v10, "modelGenericObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v12 = v5;
            +[MPCModelRadioContentReference referenceWithMPModelObject:](MPCModelRadioContentReference, "referenceWithMPModelObject:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setNowPlayingContentReference:", v13);

          }
        }

      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v5;
      if (objc_msgSend(v14, "allowsJumpToIt"))
      {
        objc_msgSend(v14, "startItemIdentifiers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15 != 0;

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "mediaRemoteOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("MPCPublisherCreateStationCommand"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "BOOLValue");

    v22 = _os_feature_enabled_impl();
    v23 = v16 | 0x40;
    if (v21)
      v23 = v16;
    if (v22)
      v24 = v23;
    else
      v24 = v16;
    v25 = *(_WORD *)(*(_QWORD *)(a1 + 48) + 10);
    v26 = objc_msgSend(*(id *)(a1 + 40), "insertionPosition");
    if (v26 == 2 && (v25 & 1) != 0 && (v21 & 1) == 0)
    {
      v27 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 6, CFSTR("Cannot insert at Last position in AutoPlay."));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v27 + 16))(v27, v28);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "insertAfterContentItemID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (!v29)
        v30 = *(void **)(a1 + 56);
      v31 = v30;

      v32 = _os_feature_enabled_impl();
      v33 = *(void **)(a1 + 48);
      if (v32)
      {
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke_2;
        v47[3] = &unk_24CAB5D78;
        v48 = v5;
        v49 = *(id *)(a1 + 64);
        objc_msgSend(v33, "_qfa_performInsertPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:", v48, v26, v31, 0, v24, v47);

        v34 = v48;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "_componentsForContentItemID:", v31);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "behaviorFlags");
        v40 = *(void **)(a1 + 48);
        if ((v35 & 1) != 0)
        {
          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke_3;
          v44[3] = &unk_24CABA438;
          v36 = &v45;
          v39 = v5;
          v45 = v39;
          v38 = &v46;
          v46 = *(id *)(a1 + 64);
          objc_msgSend(v40, "_addAutoPlayPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:", v39, v26, v31, 0, v24, v44);
        }
        else
        {
          v41[0] = MEMORY[0x24BDAC760];
          v41[1] = 3221225472;
          v41[2] = __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke_4;
          v41[3] = &unk_24CABA438;
          v36 = &v42;
          v37 = v5;
          v42 = v37;
          v38 = &v43;
          v43 = *(id *)(a1 + 64);
          objc_msgSend(v40, "_addPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:", v37, v26, v31, 0, v24, v41);
        }

      }
    }
  }

}

void __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 6, CFSTR("Failed to insert playback context: %@"), *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 6, CFSTR("Failed to insert [into autoplay list] playback context: %@"), *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 6, CFSTR("Failed to insert playback context: %@"), *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __61___MPCQueueControllerBehaviorMusic_canReuseQueue_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void (*v13)(void);
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11 || a2)
  {
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_8;
  }
  v12 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v12 + 40)
    || (unint64_t)objc_msgSend(*(id *)(v12 + 120), "count") > 1
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "shuffleType"))
  {
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_8:
    v13();
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "playbackContext");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = *(void **)(a1 + 40);
    v18 = objc_msgSend(*(id *)(a1 + 32), "_playbackContextOptions");
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __61___MPCQueueControllerBehaviorMusic_canReuseQueue_completion___block_invoke_2;
    v21[3] = &unk_24CAB7A78;
    v24 = *(id *)(a1 + 48);
    v19 = v16;
    v20 = *(_QWORD *)(a1 + 32);
    v22 = v19;
    v23 = v20;
    objc_msgSend(v17, "getMusicPlaybackContextWithOptions:completion:", v18, v21);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

LABEL_9:
}

void __61___MPCQueueControllerBehaviorMusic_canReuseQueue_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v7, "isReusableForPlaybackContext:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(v7, "startItemIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __61___MPCQueueControllerBehaviorMusic_canReuseQueue_completion___block_invoke_3;
        v10[3] = &unk_24CAB33A0;
        v9 = *(void **)(a1 + 40);
        v11 = *(id *)(a1 + 48);
        objc_msgSend(v9, "findFirstContentItemIDForItemIntersectingIdentifierSet:completion:", v8, v10);

      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

uint64_t __61___MPCQueueControllerBehaviorMusic_canReuseQueue_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66___MPCQueueControllerBehaviorMusic__playNowIfPossible_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "startItemIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v7, "startItemIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "request");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        objc_msgSend(v7, "request");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((isKindOfClass & 1) != 0)
        {
          v41[0] = v9;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setAllowedItemIdentifiers:", v13);

          objc_msgSend(v7, "setRequest:", v12);
        }
        else
        {
          objc_opt_class();
          v16 = objc_opt_isKindOfClass();

          if ((v16 & 1) == 0)
          {
            v21 = *(_QWORD *)(a1 + 40);
            v22 = (void *)MEMORY[0x24BDD1540];
            objc_msgSend(v7, "request");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 4, CFSTR("attempt to Play Now unsupported request type: %@"), objc_opt_class());
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v21 + 16))(v21, 0, 0, 0, v24);

LABEL_21:
            goto LABEL_22;
          }
          objc_msgSend(v7, "request");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifiers");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "indexPathForItemWithIdentifiersIntersectingSet:", v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            objc_msgSend(v17, "sectionAtIndex:", objc_msgSend(v18, "msv_section"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v17, "totalItemCount") == 1)
          {
            objc_msgSend(v17, "firstItem");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "modelKind");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "modelClass");

            if (v26 != objc_opt_class() || v26 != objc_opt_class())
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MusicBehavior-PlayNowSection[%@]"), v26);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_alloc(MEMORY[0x24BDDC758]);
              objc_msgSend(MEMORY[0x24BDDC8B0], "identityKind");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = (void *)objc_msgSend(v36, "initWithSource:modelKind:block:", v38, v27, &__block_literal_global_291);
              objc_msgSend(v28, "unionSet:", v20);
              v37 = objc_claimAutoreleasedReturnValue();

              v20 = (void *)v37;
            }
          }
          else
          {
            v29 = objc_alloc(MEMORY[0x24BDDC758]);
            objc_msgSend(MEMORY[0x24BDDC8B0], "identityKind");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)objc_msgSend(v29, "initWithSource:modelKind:block:", CFSTR("MusicBehavior-PlayNowSection"), v30, &__block_literal_global_295);

          }
          v31 = objc_alloc_init(MEMORY[0x24BDDCA88]);
          objc_msgSend(v31, "appendSection:", v20);
          objc_msgSend(v31, "appendItem:", v9);
          objc_msgSend(v12, "setIdentifiers:", v31);
          objc_msgSend(v7, "setRequest:", v12);

        }
        v33 = *(_QWORD **)(a1 + 32);
        v32 = *(void **)(a1 + 40);
        v34 = v33[18];
        v39[0] = MEMORY[0x24BDAC760];
        v39[1] = 3221225472;
        v39[2] = __66___MPCQueueControllerBehaviorMusic__playNowIfPossible_completion___block_invoke_4;
        v39[3] = &unk_24CAB33A0;
        v40 = v32;
        objc_msgSend(v33, "_qfa_performInsertPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:", v7, 0, v34, 0, 1, v39);

        goto LABEL_21;
      }
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 10, CFSTR("missing startItemIdentifiers"), v35);
    }
    else
    {
      v14 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 10, CFSTR("unsupported playback context: %@"), objc_opt_class());
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v14 + 16))(v14, 0, 0, 0, v15);

LABEL_22:
    goto LABEL_23;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_23:

}

uint64_t __66___MPCQueueControllerBehaviorMusic__playNowIfPossible_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66___MPCQueueControllerBehaviorMusic__playNowIfPossible_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD1880];
  v3 = a2;
  objc_msgSend(v2, "UUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaqueID:", v4);

}

void __66___MPCQueueControllerBehaviorMusic__playNowIfPossible_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD1880];
  v3 = a2;
  objc_msgSend(v2, "UUID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaqueID:", v4);

}

void __78___MPCQueueControllerBehaviorMusic_prepareForCreateStationAfterContentItemID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "engineID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v8;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v5;
    _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] prepareForCreateStationAfterContentItemID: | freezing section [create station] sectionID=%{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(v6, "setFrozen:", 1);

}

void __102___MPCQueueControllerBehaviorMusic_findFirstContentItemIDForItemIntersectingIdentifierSet_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "firstItemIntersectingIdentifierSet:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v12, "sectionIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "contentItemID");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

void __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_212(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "allSectionIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allSectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromSet:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_2;
  v8[3] = &unk_24CAB32E8;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "msv_filter:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 2, CFSTR("Missing data sources for sectionIDs: %@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingErrors:debugDescription:", CFSTR("MPCMusicBehaviorError"), 2, *(_QWORD *)(a1 + 40), &stru_24CABB5D0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = 1;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

id __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_147(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "itemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifierSetForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_199(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = v3;
    v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "sessionID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      v14 = 138544386;
      v15 = v6;
      v16 = 2114;
      v17 = v7;
      v18 = 2048;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      v22 = 2114;
      v23 = v4;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_ERROR, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | restoration failed [replacing SIL data source failed] dataSourceState=%p sectionID=%{public}@ error=%{public}@", (uint8_t *)&v14, 0x34u);

    }
    objc_msgSend(v4, "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 2, CFSTR("replacing SIL data source failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 64), "addObject:", v10);
  }
  v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v12 = v11;
  v13 = *(_QWORD *)(a1 + 80);
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v14) = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v12, OS_SIGNPOST_INTERVAL_END, v13, "QC-FinalizeDataSource-Replace", ", (uint8_t *)&v14, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_204(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "sessionID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v15 = 138544386;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      v19 = 2048;
      v20 = v9;
      v21 = 2114;
      v22 = v10;
      v23 = 2114;
      v24 = v4;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | restoration failed [adding playback context failed] dataSourceState=%p sectionID=%{public}@ error=%{public}@", (uint8_t *)&v15, 0x34u);

    }
    objc_msgSend(v4, "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 2, CFSTR("failed to add original playback context (dataSource requested shouldAddOriginalPlaybackContextAfterReplacement)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
  }
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 80);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v13, OS_SIGNPOST_INTERVAL_END, v14, "QC-FinalizeDataSource-Add", ", (uint8_t *)&v15, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_207(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = v3;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v6 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "sessionID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v15 = 138544386;
      v16 = v7;
      v17 = 2114;
      v18 = v8;
      v19 = 2048;
      v20 = v9;
      v21 = 2114;
      v22 = v10;
      v23 = 2114;
      v24 = v4;
      _os_log_impl(&dword_210BD8000, v6, OS_LOG_TYPE_DEFAULT, "[PSP:%{public}@:%{public}@] finalizeStateRestorationWithTargetContentItemID:completion: | restoration failed [adding playback context failed (autoplay SIL)] dataSourceState=%p sectionID=%{public}@ error=%{public}@", (uint8_t *)&v15, 0x34u);

    }
    objc_msgSend(v4, "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 2, CFSTR("failed to add original playback context to autoplay SIL (dataSource requested shouldAddOriginalPlaybackContextAfterReplacement)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
  }
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 80);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v13, OS_SIGNPOST_INTERVAL_END, v14, "QC-FinalizeDataSource-Add", ", (uint8_t *)&v15, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

void __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_210(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  v2 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "QC-FinalizeDataSource", ", v5, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __75___MPCQueueControllerBehaviorMusic_loadAdditionalUpcomingItems_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "sectionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_identifierListForSection:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 32), "autoPlayEnabled") & 1) != 0 || v9 != *(void **)(*(_QWORD *)(a1 + 32) + 96))
  {
    if (objc_msgSend(v6, "shouldRequestAdditionalItemsAtTail"))
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v10 = *(_QWORD *)(a1 + 64);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __75___MPCQueueControllerBehaviorMusic_loadAdditionalUpcomingItems_completion___block_invoke_2;
      v13[3] = &unk_24CAB3220;
      v11 = *(id *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 32);
      v14 = v11;
      v15 = v12;
      v16 = v5;
      v17 = *(id *)(a1 + 40);
      objc_msgSend(v6, "loadAdditionalItemsIfNeededWithCount:completion:", v10, v13);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

    }
  }

}

uint64_t __75___MPCQueueControllerBehaviorMusic_loadAdditionalUpcomingItems_completion___block_invoke_142(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __75___MPCQueueControllerBehaviorMusic_loadAdditionalUpcomingItems_completion___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "engineID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sessionID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    v8 = 138544130;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    v12 = 1024;
    v13 = a2;
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] loadAdditionalUpcomingItems:completion: | load additional completed [] loaded=%{BOOL}u sectionID=%{public}@", (uint8_t *)&v8, 0x26u);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __62___MPCQueueControllerBehaviorMusic_preferredUpcomingItemCount__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v12 = v4;
  objc_msgSend(v4, "sectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_identifierListForSection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD **)(a1 + 32);
  if ((v7 != (void *)v8[12]
     || objc_msgSend(v8, "autoPlayEnabled") && !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64))
    && objc_msgSend(v12, "shouldRequestAdditionalItemsAtTail"))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v10 = objc_msgSend(v12, "prefetchThreshold");
    if (v9 <= v10)
      v11 = v10;
    else
      v11 = v9;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
  }

}

void __66___MPCQueueControllerBehaviorMusic_performLoadCommand_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[2];
  _QWORD v47[4];

  v47[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), 1, CFSTR("Failed to convert playback queue to playback context"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    objc_msgSend(a1[4], "associatedParticipantIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAssociatedParticipantIdentifier:", v9);

    objc_msgSend(a1[5], "host");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountForUserIdentity:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "hashedDSID");
    v14 = objc_claimAutoreleasedReturnValue();
    v36 = v10;
    objc_msgSend(v10, "eventStream");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = CFSTR("account-id");
    v15 = v14;
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v34 = (void *)v15;
    v46[1] = CFSTR("queue-reporting-metadata");
    v47[0] = v15;
    v44[0] = CFSTR("queue-grouping-id");
    objc_msgSend(v5, "playActivityQueueGroupingID");
    v16 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v16;
    if (!v16)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v33 = (void *)v16;
    v45[0] = v16;
    v44[1] = CFSTR("feature-name");
    objc_msgSend(v5, "playActivityFeatureName");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (!v17)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v32 = (void *)v17;
    v45[1] = v17;
    v44[2] = CFSTR("reco-data");
    objc_msgSend(v5, "playActivityRecommendationData");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v37 = (void *)v14;
    v45[2] = v19;
    v44[3] = CFSTR("siri-ref-id");
    objc_msgSend(v5, "siriReferenceIdentifier", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v38 = v13;
    v45[3] = v22;
    v44[4] = CFSTR("siri-wha-metrics");
    objc_msgSend(v5, "siriWHAMetricsInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (!v23)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v45[4] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "emitEventType:payload:", CFSTR("session-will-begin"), v26);

    if (!v23)
    if (!v21)

    if (!v20)
    if (!v18)

    if (!v35)
    if (!v37)

    objc_msgSend(a1[5], "_emitEventsForPlaybackBehaviorChangeIfNeeded");
    objc_msgSend(a1[5], "sessionID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __66___MPCQueueControllerBehaviorMusic_performLoadCommand_completion___block_invoke_2;
    v40[3] = &unk_24CAB9CA8;
    v41 = v36;
    v42 = v27;
    v28 = a1[5];
    v43 = a1[6];
    v29 = v27;
    v30 = v36;
    objc_msgSend(v28, "_addPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:", v5, 2, 0, 0, 55, v40);

    v8 = v38;
  }

}

void __66___MPCQueueControllerBehaviorMusic_performLoadCommand_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "engineID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "msv_description");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v6;
      v18 = 2114;
      v19 = v7;
      v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] loadWithPlaybackContext:completionHandler: | completed [first data source] error=%{public}@", (uint8_t *)&v16, 0x20u);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "engineID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    v16 = 138543618;
    v17 = v9;
    v18 = 2114;
    v19 = v10;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] loadWithPlaybackContext:completionHandler: | completed [first data source]", (uint8_t *)&v16, 0x16u);

  }
  objc_msgSend(v3, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BEC8628], 140);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = CFSTR("addPlaybackContext failed [radio server error]");
    v13 = v3;
    v14 = 9;
  }
  else
  {
    v12 = CFSTR("addPlaybackContext failed");
    v13 = v3;
    v14 = 1;
  }
  objc_msgSend(v13, "msv_errorByWrappingWithDomain:code:debugDescription:", CFSTR("MPCMusicBehaviorError"), v14, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

BOOL __56___MPCQueueControllerBehaviorMusic_canLoadQueue_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

@end
