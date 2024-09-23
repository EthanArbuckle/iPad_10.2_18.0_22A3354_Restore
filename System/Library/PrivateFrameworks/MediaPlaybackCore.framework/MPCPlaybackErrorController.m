@implementation MPCPlaybackErrorController

- (void)setContiguousFailSilentlyResolutionCount:(int64_t)a3
{
  self->_contiguousFailSilentlyResolutionCount = a3;
}

- (void)resetWithReason:(id)a3
{
  void *v4;

  -[MPCPlaybackErrorController setItemsHavePlayed:](self, "setItemsHavePlayed:", 0);
  -[MPCPlaybackErrorController setPreferredFirstContentItemID:](self, "setPreferredFirstContentItemID:", 0);
  -[MPCPlaybackErrorController setLastItemUsedForErrorResolution:](self, "setLastItemUsedForErrorResolution:", 0);
  -[MPCPlaybackErrorController failedItemsIdentifiers](self, "failedItemsIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[MPCPlaybackErrorController setContiguousFailSilentlyResolutionCount:](self, "setContiguousFailSilentlyResolutionCount:", 0);
}

- (void)setPreferredFirstContentItemID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setLastItemUsedForErrorResolution:(id)a3
{
  objc_storeStrong((id *)&self->_lastItemUsedForErrorResolution, a3);
}

- (void)setItemsHavePlayed:(BOOL)a3
{
  self->_itemsHavePlayed = a3;
  if (a3)
    -[MPCPlaybackErrorController setContiguousFailSilentlyResolutionCount:](self, "setContiguousFailSilentlyResolutionCount:", 0);
}

- (NSMutableSet)failedItemsIdentifiers
{
  return self->_failedItemsIdentifiers;
}

- (MPCPlaybackErrorController)initWithPlaybackEngine:(id)a3 translator:(id)a4 externalPlaybackRouter:(id)a5
{
  id v8;
  id v9;
  id v10;
  MPCPlaybackErrorController *v11;
  MPCPlaybackErrorController *v12;
  NSMutableSet *v13;
  NSMutableSet *failedItemsIdentifiers;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MPCPlaybackErrorController;
  v11 = -[MPCPlaybackErrorController init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_playbackEngine, v8);
    objc_storeStrong((id *)&v12->_translator, a4);
    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    failedItemsIdentifiers = v12->_failedItemsIdentifiers;
    v12->_failedItemsIdentifiers = v13;

    objc_storeStrong((id *)&v12->_externalPlaybackRouter, a5);
  }

  return v12;
}

- (BOOL)itemsHavePlayed
{
  return self->_itemsHavePlayed;
}

- (void)resolveError:(id)a3 forItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  id v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  const char *v63;
  void *v64;
  void *v65;
  void *v66;
  MPCPlaybackErrorController *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  NSObject *log;
  NSObject *loga;
  id v78;
  void *v79;
  id v80;
  unsigned int v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  _QWORD aBlock[4];
  id v91;
  MPCPlaybackErrorController *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  uint8_t buf[4];
  void *v98;
  __int16 v99;
  MPCPlaybackErrorController *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  id v104;
  __int16 v105;
  int v106;
  __int16 v107;
  id v108;
  __int16 v109;
  id v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCPlaybackErrorController translator](self, "translator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "MPAVItemForMFPlayerItem:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  v89 = v11;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v14, "engineID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "isStartItem");
    v18 = v13;
    v19 = v10;
    v20 = v8;
    v21 = v17;
    -[MPCPlaybackErrorController preferredFirstContentItemID](self, "preferredFirstContentItemID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v98 = v16;
    v99 = 2048;
    v100 = self;
    v101 = 2114;
    v102 = v14;
    v103 = 2114;
    v104 = v9;
    v105 = 1024;
    v106 = v21;
    v8 = v20;
    v10 = v19;
    v13 = v18;
    v107 = 2114;
    v108 = v22;
    v109 = 2114;
    v110 = v8;
    _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Starting error resolution - item:%{public}@ - isStartItem:%{BOOL}u - preferredFirstContentItemID:%{public}@ - error:%{public}@", buf, 0x44u);

    v11 = v89;
  }

  if (-[MPCPlaybackErrorController contiguousFailSilentlyResolutionCount](self, "contiguousFailSilentlyResolutionCount") < 250)
  {
    objc_msgSend(v8, "userInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x24BDD1398];
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v25 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "playbackError");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v26;
    if (v26)
    {
      objc_msgSend(v26, "userInfo");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", v24);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v88 = 0;
    }
    v85 = (void *)v25;
    v86 = v8;
    v28 = v8;
    objc_msgSend(v11, "player");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "state") == 4)
    {
      v30 = 1;
    }
    else
    {
      objc_msgSend(v11, "player");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v31, "state") == 6;

    }
    v32 = v11;

    v33 = (void *)MEMORY[0x24BDAC9B8];
    v34 = MEMORY[0x24BDAC9B8];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__MPCPlaybackErrorController_resolveError_forItem_completion___block_invoke;
    aBlock[3] = &unk_24CAB4C38;
    v91 = v33;
    v96 = v10;
    v92 = self;
    v35 = v28;
    v93 = v35;
    v36 = v13;
    v94 = v36;
    v95 = v32;
    v84 = _Block_copy(aBlock);
    v37 = v85;
    if ((objc_msgSend(v35, "mpc_isAirplayDeviceBusyError") & 1) != 0
      || (objc_msgSend(v85, "mpc_isAirplayDeviceBusyError") & 1) != 0
      || objc_msgSend(v88, "mpc_isAirplayDeviceBusyError"))
    {
      -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v38, "engineID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFDescription forErrorResolution:](MFDescription, "forErrorResolution:", 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v98 = v40;
        v99 = 2048;
        v100 = self;
        v101 = 2114;
        v102 = v38;
        v103 = 2114;
        v104 = v41;
        _os_log_impl(&dword_210BD8000, v39, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable AirPlay failure [airPlayVideoEnded] - Actual resolution:%{public}@", buf, 0x2Au);

      }
      v42 = v84;
      (*((void (**)(void *, uint64_t))v84 + 2))(v84, 1);
      -[MPCPlaybackErrorController externalPlaybackRouter](self, "externalPlaybackRouter");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "pickBestDeviceRoute");

      v8 = v86;
      v44 = v87;
      goto LABEL_17;
    }
    if ((objc_msgSend(v35, "mpc_isRentalContentRequiresDownloadError") & 1) != 0
      || (objc_msgSend(v85, "mpc_isRentalContentRequiresDownloadError") & 1) != 0
      || objc_msgSend(v88, "mpc_isRentalContentRequiresDownloadError"))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", *MEMORY[0x24BDDB968], 8, v35, CFSTR("Unrecoverable AirPlay failure [rental requires download]"));
      v82 = (id)objc_claimAutoreleasedReturnValue();

      -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v8 = v86;
      v44 = v87;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v83, "engineID");
        v78 = v36;
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFDescription forErrorResolution:](MFDescription, "forErrorResolution:", 1);
        v47 = v45;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v98 = v46;
        v99 = 2048;
        v100 = self;
        v101 = 2114;
        v102 = v83;
        v103 = 2114;
        v104 = v48;
        v105 = 1024;
        v106 = 0;
        v107 = 2114;
        v108 = v82;
        _os_log_impl(&dword_210BD8000, v47, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable AirPlay failure [rental requires download] - Proposed resolution:%{public}@ - canResolve:%{BOOL}u - errorForResolution:%{public}@", buf, 0x3Au);

        v36 = v78;
        v45 = v47;
        v49 = 1;
        v81 = 0;
      }
      else
      {
        v81 = 0;
        v49 = 1;
      }
      goto LABEL_34;
    }
    v44 = v87;
    if ((objc_msgSend(v35, "mpc_isAirplayStreamingNotSupportedError") & 1) != 0
      || (objc_msgSend(v85, "mpc_isAirplayStreamingNotSupportedError") & 1) != 0
      || objc_msgSend(v88, "mpc_isAirplayStreamingNotSupportedError"))
    {
      if (v35)
        v50 = v35;
      else
        v50 = v87;
      v82 = v50;

      -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      _MPCLogCategoryPlayback();
      v45 = objc_claimAutoreleasedReturnValue();
      v81 = 1;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v83, "engineID");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFDescription forErrorResolution:](MFDescription, "forErrorResolution:", 0);
        v52 = v45;
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v98 = v51;
        v99 = 2048;
        v100 = self;
        v101 = 2114;
        v102 = v83;
        v103 = 2114;
        v104 = v53;
        v105 = 1024;
        v106 = 1;
        v107 = 2114;
        v108 = v82;
        _os_log_impl(&dword_210BD8000, v52, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Potentialy recoverable AirPlay failure [streaming not supported on device] - Proposed resolution:%{public}@ - canResolve:%{BOOL}u - errorForResolution:%{public}@", buf, 0x3Au);

        v45 = v52;
      }
      v49 = 0;
      v8 = v86;
      goto LABEL_34;
    }
    if (objc_msgSend(v35, "mpc_isResourceUnavailableError"))
    {
      if (objc_msgSend(v9, "isAssetLoaded"))
      {
        objc_msgSend(v9, "avPlayerItem");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "errorLog");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56)
        {
          -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          _MPCLogCategoryPlayback();
          log = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v83, "engineID");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            +[MFDescription forErrorResolution:](MFDescription, "forErrorResolution:", 1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v98 = v57;
            v99 = 2048;
            v100 = self;
            v101 = 2114;
            v102 = v83;
            v103 = 2114;
            v104 = v58;
            _os_log_impl(&dword_210BD8000, log, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable playback failure [resource unavailable] - Actual resolution:%{public}@", buf, 0x2Au);

            v49 = 1;
            v81 = 0;
            v82 = v35;
            v45 = log;
            v8 = v86;
            v44 = v87;
LABEL_34:

            v35 = v82;
            v54 = v36;
            v42 = v84;
            -[MPCPlaybackErrorController _playbackFailedWithError:item:canResolve:proposedResolution:completion:](self, "_playbackFailedWithError:item:canResolve:proposedResolution:completion:", v82, v54, v81, v49, v84);
LABEL_17:

            v11 = v89;
            goto LABEL_18;
          }
          v81 = 0;
          v49 = 1;
          v82 = v35;
          v8 = v86;
LABEL_52:
          v44 = v87;
          v45 = log;
          goto LABEL_34;
        }
      }
    }
    if ((objc_msgSend(v35, "mpc_isLeaseTakenError") & v30) == 1)
    {
      -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      _MPCLogCategoryPlayback();
      log = objc_claimAutoreleasedReturnValue();
      v8 = v86;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v83, "engineID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFDescription forErrorResolution:](MFDescription, "forErrorResolution:", 1);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v98 = v59;
        v99 = 2048;
        v100 = self;
        v101 = 2114;
        v102 = v83;
        v103 = 2114;
        v104 = v60;
        _os_log_impl(&dword_210BD8000, log, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable playback failure [lease error while paused or interrupted] - Actual resolution:%{public}@", buf, 0x2Au);

        v49 = 1;
        v81 = 0;
LABEL_51:
        v82 = v35;
        goto LABEL_52;
      }
LABEL_50:
      v81 = 0;
      v49 = 1;
      goto LABEL_51;
    }
    v8 = v86;
    if (-[MPCPlaybackErrorController itemsHavePlayed](self, "itemsHavePlayed")
      || !objc_msgSend(v35, "mpc_isSubscriptionRequiredError"))
    {
      if (objc_msgSend(v35, "mpc_isKeyServerNoOfflineSlotError"))
      {
        -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        _MPCLogCategoryPlayback();
        log = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v83, "engineID");
          v80 = v36;
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          +[MFDescription forErrorResolution:](MFDescription, "forErrorResolution:", 1);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v98 = v64;
          v99 = 2048;
          v100 = self;
          v101 = 2114;
          v102 = v83;
          v103 = 2114;
          v104 = v65;
          v105 = 1024;
          v106 = 0;
          v107 = 2114;
          v108 = v35;
          _os_log_impl(&dword_210BD8000, log, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable failure [no offline slot] - Proposed resolution:%{public}@ - canResolve:%{BOOL}u - errorForResolution:%{public}@", buf, 0x3Au);

          v36 = v80;
          v81 = 0;
          v82 = v35;
          v45 = log;
          v49 = 1;
          v44 = v87;
          goto LABEL_34;
        }
        goto LABEL_50;
      }
      v79 = v36;
      if (!objc_msgSend(v35, "mpc_isStreamingSlotError"))
      {
        -[MPCPlaybackErrorController lastItemUsedForErrorResolution](self, "lastItemUsedForErrorResolution");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (v66)
        {
          v67 = self;
          -[MPCPlaybackErrorController lastItemUsedForErrorResolution](self, "lastItemUsedForErrorResolution");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (v68)
          {
            -[MPCPlaybackErrorController lastItemUsedForErrorResolution](self, "lastItemUsedForErrorResolution");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "contentItemID");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "contentItemID");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = objc_msgSend(v70, "isEqualToString:", v71) ^ 1;

          }
          else
          {
            v81 = 0;
          }

        }
        else
        {
          v67 = self;
          v81 = 1;
        }

        self = v67;
        -[MPCPlaybackErrorController playbackEngine](v67, "playbackEngine");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        _MPCLogCategoryPlayback();
        v72 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          v82 = v35;
          v37 = v85;
          v8 = v86;
          v44 = v87;
          v36 = v79;
          v45 = v72;
          v49 = 0;
          goto LABEL_34;
        }
        objc_msgSend(v83, "engineID");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFDescription forErrorResolution:](MFDescription, "forErrorResolution:", 0);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v98 = v73;
        v99 = 2048;
        v100 = v67;
        v101 = 2114;
        v102 = v83;
        v103 = 2114;
        v104 = v74;
        v105 = 1024;
        v106 = v81;
        v107 = 2114;
        v108 = v35;
        v75 = v72;
        _os_log_impl(&dword_210BD8000, v72, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Potentialy recoverable failure [general error] - Proposed resolution:%{public}@ - canResolve:%{BOOL}u - errorForResolution:%{public}@", buf, 0x3Au);

        v49 = 0;
        v82 = v35;
        v45 = v75;
        v37 = v85;
        v8 = v86;
        goto LABEL_67;
      }
      -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      _MPCLogCategoryPlayback();
      loga = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v83, "engineID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFDescription forErrorResolution:](MFDescription, "forErrorResolution:", 1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v98 = v61;
        v99 = 2048;
        v100 = self;
        v101 = 2114;
        v102 = v83;
        v103 = 2114;
        v104 = v62;
        v105 = 1024;
        v106 = 0;
        v107 = 2114;
        v108 = v35;
        v63 = "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable failure [streaming slot erro"
              "r] - Proposed resolution:%{public}@ - canResolve:%{BOOL}u - errorForResolution:%{public}@";
        goto LABEL_56;
      }
    }
    else
    {
      v79 = v36;
      -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      _MPCLogCategoryPlayback();
      loga = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v83, "engineID");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFDescription forErrorResolution:](MFDescription, "forErrorResolution:", 1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v98 = v61;
        v99 = 2048;
        v100 = self;
        v101 = 2114;
        v102 = v83;
        v103 = 2114;
        v104 = v62;
        v105 = 1024;
        v106 = 0;
        v107 = 2114;
        v108 = v35;
        v63 = "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Unrecoverable failure [subscription requir"
              "ed for playback] - Proposed resolution:%{public}@ - canResolve:%{BOOL}u - errorForResolution:%{public}@";
LABEL_56:
        _os_log_impl(&dword_210BD8000, loga, OS_LOG_TYPE_DEFAULT, v63, buf, 0x3Au);

        v49 = 1;
        v81 = 0;
        v82 = v35;
        v45 = loga;
LABEL_67:
        v44 = v87;
        v36 = v79;
        goto LABEL_34;
      }
    }
    v81 = 0;
    v49 = 1;
    v82 = v35;
    v44 = v87;
    v45 = loga;
    v36 = v79;
    goto LABEL_34;
  }
  -[MPCPlaybackErrorController setContiguousFailSilentlyResolutionCount:](self, "setContiguousFailSilentlyResolutionCount:", 0);
  (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
LABEL_18:

}

- (void)reportCriticalError:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  int v21;
  void *v22;
  __int16 v23;
  MPCPlaybackErrorController *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "engineID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138544386;
    v22 = v10;
    v23 = 2048;
    v24 = self;
    v25 = 2114;
    v26 = v8;
    v27 = 2114;
    v28 = v7;
    v29 = 2114;
    v30 = v6;
    _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Processing fatal playback error - item:%{public}@ - error:%{public}@", (uint8_t *)&v21, 0x34u);

  }
  -[MPCPlaybackErrorController translator](self, "translator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "MPAVItemForMFPlayerItem:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v6;
  objc_msgSend(v13, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("MPCEnginePlayerError"));

  v16 = v13;
  if (v15)
  {
    v17 = objc_msgSend(v13, "code");
    if ((unint64_t)(v17 - 5) < 3)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = CFSTR("SetQueue failed to load any assets");
      v20 = 62;
LABEL_8:
      objc_msgSend(v18, "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCError"), v20, v13, v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    }
    v16 = v13;
    if (v17 == 9)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v19 = CFSTR("Shared listening playback failure");
      v20 = 2200;
      goto LABEL_8;
    }
  }
LABEL_9:
  -[MPCPlaybackErrorController _notifyObserversForError:item:](self, "_notifyObserversForError:item:", v16, v12);

}

- (void)_playbackFailedWithError:(id)a3 item:(id)a4 canResolve:(BOOL)a5 proposedResolution:(int64_t)a6 completion:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  MPCPlaybackErrorController *v30;
  id v31;
  id v32;
  id v33[2];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  MPCPlaybackErrorController *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v9 = a5;
  v46 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (v13 && v9 && (objc_msgSend(v13, "hasPerformedErrorResolution") & 1) == 0)
  {
    -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v24, "engineID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v35 = v26;
      v36 = 2048;
      v37 = self;
      v38 = 2114;
      v39 = v24;
      v40 = 2114;
      v41 = v13;
      v42 = 2114;
      v43 = v12;
      _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Attempting to recover from error [using item resolution] - item:%{public}@ - error:%{public}@", buf, 0x34u);

    }
    -[MPCPlaybackErrorController setLastItemUsedForErrorResolution:](self, "setLastItemUsedForErrorResolution:", v13);
    objc_initWeak((id *)buf, self);
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __101__MPCPlaybackErrorController__playbackFailedWithError_item_canResolve_proposedResolution_completion___block_invoke;
    v28[3] = &unk_24CAB4C68;
    objc_copyWeak(v33, (id *)buf);
    v27 = v13;
    v33[1] = (id)a6;
    v29 = v27;
    v30 = self;
    v31 = v12;
    v32 = v14;
    objc_msgSend(v27, "resolvePlaybackError:withCompletion:", v31, v28);

    objc_destroyWeak(v33);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "engineID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v35 = v17;
      v36 = 2048;
      v37 = self;
      v38 = 2114;
      v39 = v15;
      v40 = 2114;
      v41 = v13;
      v42 = 2114;
      v43 = v12;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Unable resolve error [determining final resolution] - item:%{public}@ - error:%{public}@", buf, 0x34u);

    }
    v18 = -[MPCPlaybackErrorController _resolutionForPlaybackError:item:](self, "_resolutionForPlaybackError:item:", v12, v13);
    if (a6 == 1)
      v19 = 1;
    else
      v19 = v18;
    -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v20, "engineID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFDescription forErrorResolution:](MFDescription, "forErrorResolution:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v35 = v22;
      v36 = 2048;
      v37 = self;
      v38 = 2114;
      v39 = v20;
      v40 = 2114;
      v41 = v23;
      v42 = 2114;
      v43 = v13;
      v44 = 2114;
      v45 = v12;
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Final error resolution reached [%{public}@] - item:%{public}@ - error:%{public}@", buf, 0x3Eu);

    }
    -[MPCPlaybackErrorController _notifyObserversForError:item:](self, "_notifyObserversForError:item:", v12, v13);
    (*((void (**)(id, uint64_t))v14 + 2))(v14, v19);
  }

}

- (int64_t)_resolutionForPlaybackError:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  MPCPlaybackErrorController *v8;
  NSObject *v9;
  NSObject *v10;
  MPCPlaybackErrorController *v11;
  int64_t v12;
  NSObject *v13;
  NSObject *v14;
  MPCPlaybackErrorController *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  MPCPlaybackErrorController *v20;
  NSObject *v21;
  MPCPlaybackErrorController *v22;
  int v24;
  MPCPlaybackErrorController *v25;
  __int16 v26;
  MPCPlaybackErrorController *v27;
  __int16 v28;
  NSObject *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
  v8 = (MPCPlaybackErrorController *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v12 = 1;
    goto LABEL_24;
  }
  if (!v7)
  {
    -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[NSObject engineID](v13, "engineID");
      v15 = (MPCPlaybackErrorController *)objc_claimAutoreleasedReturnValue();
      v24 = 138544130;
      v25 = v15;
      v26 = 2048;
      v27 = self;
      v28 = 2114;
      v29 = v13;
      v30 = 2114;
      v31 = v6;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - nil item received [Queue failure] error=%{public}@", (uint8_t *)&v24, 0x2Au);

    }
    v12 = 0;
    goto LABEL_23;
  }
  if (-[MPCPlaybackErrorController itemsHavePlayed](self, "itemsHavePlayed"))
  {
    -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject engineID](v9, "engineID");
      v11 = (MPCPlaybackErrorController *)objc_claimAutoreleasedReturnValue();
      v24 = 138543874;
      v25 = v11;
      v26 = 2048;
      v27 = self;
      v28 = 2114;
      v29 = v9;
      _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Playback has succeeded for at least one item [Ignoring queue failure]", (uint8_t *)&v24, 0x20u);

    }
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  -[MPCPlaybackErrorController queueController](v8, "queueController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentItemID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentItemIDWithoutRepeatIteration:", v17);
  v9 = objc_claimAutoreleasedReturnValue();

  -[MPCPlaybackErrorController failedItemsIdentifiers](self, "failedItemsIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v18, "containsObject:", v9);

  if (!(_DWORD)v17)
  {
    v21 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 134218242;
      v25 = self;
      v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_210BD8000, v21, OS_LOG_TYPE_DEFAULT, "MPCErrorControllerImplementation %p <%{public}@> - Playback has not yet succeeded [Adding to queue failure set]", (uint8_t *)&v24, 0x16u);
    }

    -[MPCPlaybackErrorController failedItemsIdentifiers](self, "failedItemsIdentifiers");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v10, "addObject:", v9);
    goto LABEL_17;
  }
  -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
  v10 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    -[NSObject engineID](v10, "engineID");
    v20 = (MPCPlaybackErrorController *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v20;
    v26 = 2048;
    v27 = self;
    v28 = 2114;
    v29 = v10;
    _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Ending playback [Entire queue failure]", (uint8_t *)&v24, 0x20u);

  }
  v12 = 1;
LABEL_18:

  if (-[MPCPlaybackErrorController shouldHandleFirstItemFailure:item:](self, "shouldHandleFirstItemFailure:item:", v6, v7)|| -[MPCPlaybackErrorController isUnrecoverableAssetLoadingError:](self, "isUnrecoverableAssetLoadingError:", v6))
  {
    -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[NSObject engineID](v13, "engineID");
      v22 = (MPCPlaybackErrorController *)objc_claimAutoreleasedReturnValue();
      v24 = 138544130;
      v25 = v22;
      v26 = 2048;
      v27 = self;
      v28 = 2114;
      v29 = v13;
      v30 = 2114;
      v31 = v6;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Stopping playback for a first item or unrecoverable asset loading error. error=%{public}@", (uint8_t *)&v24, 0x2Au);

    }
    v12 = 1;
LABEL_23:

  }
LABEL_24:

  return v12;
}

- (void)_notifyObserversForError:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int IsCellular;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  const char *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v70[2];
  _QWORD v71[2];
  uint8_t buf[4];
  void *v73;
  __int16 v74;
  MPCPlaybackErrorController *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "msv_errorByUnwrappingDomain:code:", CFSTR("MPCEnginePlayerError"), 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "msv_errorByUnwrappingDomain:code:", *MEMORY[0x24BDD1308], -1009);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v11;
      if (objc_msgSend(v13, "preferredMusicLowBandwidthResolution") < 1)
      {
        v15 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isCellularDataRestrictedForMusic") ^ 1;

      }
      v65 = v8;

      objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "networkType");

      IsCellular = ICEnvironmentNetworkTypeIsCellular();
      -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if ((v15 & 1) != 0 || !IsCellular)
      {
        v22 = v9;
        if (v21)
        {
          objc_msgSend(v19, "engineID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v73 = v26;
          v74 = 2048;
          v75 = self;
          v76 = 2114;
          v77 = v19;
          v78 = 2114;
          v79 = v6;
          _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Transforming error to network unavailable instead of original: %{public}@", buf, 0x2Au);

        }
        v24 = CFSTR("Network Unavailable");
        v25 = 11;
      }
      else
      {
        v22 = v9;
        if (v21)
        {
          objc_msgSend(v19, "engineID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v73 = v23;
          v74 = 2048;
          v75 = self;
          v76 = 2114;
          v77 = v19;
          v78 = 2114;
          v79 = v6;
          _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Transforming error to cellular restricted error instead of original: %{public}@", buf, 0x2Au);

        }
        v24 = CFSTR("Cellular Restricted");
        v25 = 10;
      }

      v70[0] = CFSTR("ICEnvironmentNetworkType");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v17);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v70[1] = CFSTR("isMusicCellularStreamingAllowed");
      v71[0] = v27;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v71[1] = v28;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "msv_errorByWrappingWithDomain:code:userInfo:debugDescription:", CFSTR("MPCError"), v25, v29, CFSTR("playback request failed with reason: %@"), v24);
      v30 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v30;
      v9 = v22;
      v8 = v65;
      v11 = v68;
    }
  }
  if (v7)
  {
    if (-[MPCPlaybackErrorController shouldHandleFirstItemFailure:item:](self, "shouldHandleFirstItemFailure:item:", v6, v7))
    {
      if (-[MPCPlaybackErrorController isFirstItemFailure:item:](self, "isFirstItemFailure:item:", v6, v7))
      {
        if (objc_msgSend(v6, "mpc_isFileDoesNotExistError"))
        {
          v69 = v11;
          objc_msgSend(v6, "userInfo");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v31, "mutableCopy");

          objc_msgSend(v8, "mediaRemotePublisher");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "getQOSDialogForError:withItem:", v6, v7);
          v34 = objc_claimAutoreleasedReturnValue();

          v64 = v34;
          objc_msgSend(v32, "addEntriesFromDictionary:", v34);
          v66 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(v6, "domain");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v6, "code");
          objc_msgSend(v6, "underlyingErrors");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "description");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v66;
          v67 = v32;
          objc_msgSend(v38, "msv_errorWithDomain:code:underlyingErrors:userInfo:debugDescription:", v63, v35, v36, v32, CFSTR("%@"), v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = v39;
          -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v41, "engineID");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v73 = v43;
            v74 = 2048;
            v75 = self;
            v76 = 2114;
            v77 = v41;
            v78 = 2114;
            v79 = v40;
            _os_log_impl(&dword_210BD8000, v42, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Notifying delegate [File does not exist] error=%{public}@", buf, 0x2Au);

          }
          v44 = v67;
          v11 = v69;
          v45 = v64;
          goto LABEL_46;
        }
        -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v44, "engineID");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v73 = v61;
          v74 = 2048;
          v75 = self;
          v76 = 2114;
          v77 = v44;
          v78 = 2114;
          v79 = v6;
          v62 = "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Notifying delegate [Specified first it"
                "em failure] error=%{public}@";
          goto LABEL_44;
        }
      }
      else
      {
        if (!-[MPCPlaybackErrorController isQueueLoadingFailure:](self, "isQueueLoadingFailure:", v6))
        {
          if (!objc_msgSend(v6, "mpc_isSubscriptionRequiredError"))
          {
LABEL_47:
            v49 = v9;
            v50 = v8;
            v51 = v7;
LABEL_48:
            objc_msgSend(v49, "engine:didFailToPlayFirstItem:withError:", v50, v51, v6);
            goto LABEL_49;
          }
          -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
          if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            goto LABEL_45;
          objc_msgSend(v44, "engineID");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v73 = v61;
          v74 = 2048;
          v75 = self;
          v76 = 2114;
          v77 = v44;
          v78 = 2114;
          v79 = v6;
          v62 = "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Notifying delegate [Subscription requi"
                "red] error=%{public}@";
          goto LABEL_44;
        }
        -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v44, "engineID");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v73 = v61;
          v74 = 2048;
          v75 = self;
          v76 = 2114;
          v77 = v44;
          v78 = 2114;
          v79 = v6;
          v62 = "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Notifying delegate [Entire queue loadi"
                "ng failure] error=%{public}@";
LABEL_44:
          _os_log_impl(&dword_210BD8000, v45, OS_LOG_TYPE_ERROR, v62, buf, 0x2Au);

        }
      }
LABEL_45:
      v40 = v6;
LABEL_46:

      v6 = v40;
      goto LABEL_47;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v52, "engineID");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v73 = v54;
        v74 = 2048;
        v75 = self;
        v76 = 2114;
        v77 = v52;
        v78 = 2114;
        v79 = v6;
        _os_log_impl(&dword_210BD8000, v53, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Notifying delegate [Queue item failure] error=%{public}@", buf, 0x2Au);

      }
      v55 = v9;
      v56 = v8;
      v57 = v7;
LABEL_35:
      objc_msgSend(v55, "engine:didFailToPlayItem:withError:", v56, v57, v6);
    }
  }
  else
  {
    if (-[MPCPlaybackErrorController canHandleFirstItemFailure](self, "canHandleFirstItemFailure")
      && -[MPCPlaybackErrorController isQueueLoadingFailure:](self, "isQueueLoadingFailure:", v6))
    {
      -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v46, "engineID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v73 = v48;
        v74 = 2048;
        v75 = self;
        v76 = 2114;
        v77 = v46;
        v78 = 2114;
        v79 = v6;
        _os_log_impl(&dword_210BD8000, v47, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Notifying delegate [Failed to queue any items] error=%{public}@", buf, 0x2Au);

      }
      v49 = v9;
      v50 = v8;
      v51 = 0;
      goto LABEL_48;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v58, "engineID");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v73 = v60;
        v74 = 2048;
        v75 = self;
        v76 = 2114;
        v77 = v58;
        v78 = 2114;
        v79 = v6;
        _os_log_impl(&dword_210BD8000, v59, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Notifying delegate [Queue item failure - nil item] error=%{public}@", buf, 0x2Au);

      }
      v55 = v9;
      v56 = v8;
      v57 = 0;
      goto LABEL_35;
    }
  }
LABEL_49:

}

- (BOOL)canHandleFirstItemFailure
{
  void *v2;
  void *v3;
  char v4;

  -[MPCPlaybackErrorController playbackEngine](self, "playbackEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  return v4 & 1;
}

- (BOOL)isFirstItemFailure:(id)a3 item:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a4;
  if (objc_msgSend(v5, "isStartItem"))
  {
    -[MPCPlaybackErrorController preferredFirstContentItemID](self, "preferredFirstContentItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "contentItemID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCPlaybackErrorController preferredFirstContentItemID](self, "preferredFirstContentItemID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
        v9 = 1;
      else
        v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 1;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isQueueLoadingFailure:(id)a3
{
  return objc_msgSend(a3, "mpc_isQueueLoadingFailure");
}

- (BOOL)isUnrecoverableAssetLoadingError:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "mpc_isUnrecoverableAssetLoadingError");
  return (char)v3;
}

- (BOOL)isAssetUnavailableFailure:(id)a3
{
  return objc_msgSend(a3, "mpc_isAssetUnavailableFailure");
}

- (BOOL)shouldHandleFirstItemFailure:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;

  v6 = a3;
  v7 = a4;
  if (-[MPCPlaybackErrorController canHandleFirstItemFailure](self, "canHandleFirstItemFailure")
    && (-[MPCPlaybackErrorController isFirstItemFailure:item:](self, "isFirstItemFailure:item:", v6, v7)
     || -[MPCPlaybackErrorController isQueueLoadingFailure:](self, "isQueueLoadingFailure:", v6)))
  {
    v8 = !-[MPCPlaybackErrorController isAssetUnavailableFailure:](self, "isAssetUnavailableFailure:", v6);
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)isLeaseTakenError:(id)a3
{
  return objc_msgSend(a3, "mpc_isLeaseTakenError");
}

- (NSString)preferredFirstContentItemID
{
  return self->preferredFirstContentItemID;
}

- (MPCPlaybackEngine)playbackEngine
{
  return (MPCPlaybackEngine *)objc_loadWeakRetained((id *)&self->_playbackEngine);
}

- (void)setPlaybackEngine:(id)a3
{
  objc_storeWeak((id *)&self->_playbackEngine, a3);
}

- (MPCMediaFoundationTranslator)translator
{
  return self->_translator;
}

- (void)setFailedItemsIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_failedItemsIdentifiers, a3);
}

- (MPCExternalPlaybackRouter)externalPlaybackRouter
{
  return self->_externalPlaybackRouter;
}

- (void)setExternalPlaybackRouter:(id)a3
{
  objc_storeStrong((id *)&self->_externalPlaybackRouter, a3);
}

- (MPAVItem)lastItemUsedForErrorResolution
{
  return self->_lastItemUsedForErrorResolution;
}

- (int64_t)contiguousFailSilentlyResolutionCount
{
  return self->_contiguousFailSilentlyResolutionCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastItemUsedForErrorResolution, 0);
  objc_storeStrong((id *)&self->_externalPlaybackRouter, 0);
  objc_storeStrong((id *)&self->_failedItemsIdentifiers, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_destroyWeak((id *)&self->_playbackEngine);
  objc_storeStrong((id *)&self->preferredFirstContentItemID, 0);
}

void __101__MPCPlaybackErrorController__playbackFailedWithError_item_canResolve_proposedResolution_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  _BOOL8 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setHasPerformedErrorResolution:", 1);
  if (!WeakRetained)
    goto LABEL_11;
  if (a2 == 2)
    goto LABEL_5;
  if (a2 != 1)
  {
    if (a2)
      goto LABEL_11;
LABEL_5:
    v7 = *(_QWORD *)(a1 + 72) == 1;
    objc_msgSend(*(id *)(a1 + 40), "playbackEngine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "engineID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      +[MFDescription forErrorResolution:](MFDescription, "forErrorResolution:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 48);
      v22 = 138544898;
      v23 = v10;
      v24 = 2048;
      v25 = v11;
      v26 = 2114;
      v27 = v8;
      v28 = 2114;
      v29 = v12;
      v30 = 2114;
      v31 = v13;
      v32 = 2114;
      v33 = v14;
      v34 = 2114;
      v35 = v5;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_ERROR, "[%{public}@]-❗️MPCErrorControllerImplementation %p <%{public}@> - Item error resolution failed [proposed resolution: %{public}@]- item:%{public}@ - error: %{public}@ - resolutionError:%{public}@", (uint8_t *)&v22, 0x48u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_playbackFailedWithError:item:canResolve:proposedResolution:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), 0, v7, *(_QWORD *)(a1 + 56));
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 40), "playbackEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v15, "engineID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(a1 + 40);
    +[MFDescription forErrorResolution:](MFDescription, "forErrorResolution:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(_QWORD *)(a1 + 48);
    v22 = 138544898;
    v23 = v17;
    v24 = 2048;
    v25 = v18;
    v26 = 2114;
    v27 = v15;
    v28 = 2114;
    v29 = v19;
    v30 = 2114;
    v31 = v20;
    v32 = 2114;
    v33 = v21;
    v34 = 2114;
    v35 = v5;
    _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@]-MPCErrorControllerImplementation %p <%{public}@> - Item error resolution succeeded [proposed resolution: %{public}@] - item:%{public}@ - error:%{public}@ - resolutionError:%{public}@", (uint8_t *)&v22, 0x48u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_11:

}

void __62__MPCPlaybackErrorController_resolveError_forItem_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[4];
  _QWORD v33[4];
  uint8_t buf[4];
  int v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = *(NSObject **)(a1 + 32);
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __62__MPCPlaybackErrorController_resolveError_forItem_completion___block_invoke_2;
  v27 = &unk_24CAB4C10;
  v28 = *(id *)(a1 + 72);
  v29 = a2;
  dispatch_async(v4, &v24);
  v5 = *(void **)(a1 + 40);
  if (a2 == 1)
    v6 = 0;
  else
    v6 = objc_msgSend(*(id *)(a1 + 40), "contiguousFailSilentlyResolutionCount", v24, v25, v26, v27) + 1;
  objc_msgSend(v5, "setContiguousFailSilentlyResolutionCount:", v6, v24, v25, v26, v27);
  objc_msgSend(*(id *)(a1 + 48), "msv_analyticSignature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 48));

  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    v12 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    *(_DWORD *)buf = 67240450;
    v35 = a2;
    v36 = 2082;
    v37 = v12;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v11, OS_SIGNPOST_EVENT, v9, "ErrorResolution", " enableTelemetry=YES type=%{public, signpost.telemetry:number1, name=type}d error=%{public, signpost.telemetry:string1, name=error}s", buf, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 56), "queueSectionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "queueItemID");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v13 && v14)
  {
    v32[0] = CFSTR("queue-section-id");
    v32[1] = CFSTR("queue-item-id");
    v33[0] = v13;
    v33[1] = v14;
    v33[2] = *(_QWORD *)(a1 + 48);
    v32[2] = CFSTR("error-for-resolution");
    v32[3] = CFSTR("resolution-type");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v16;
    v17 = (void *)MEMORY[0x24BDBCE70];
    v18 = v33;
    v19 = v32;
    v20 = 4;
  }
  else
  {
    v21 = *(_QWORD *)(a1 + 48);
    v30[0] = CFSTR("error-for-resolution");
    v30[1] = CFSTR("resolution-type");
    v31[0] = v21;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v16;
    v17 = (void *)MEMORY[0x24BDBCE70];
    v18 = v31;
    v19 = v30;
    v20 = 2;
  }
  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 64), "eventStream");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "emitEventType:payload:", CFSTR("error-resolution"), v22);

}

uint64_t __62__MPCPlaybackErrorController_resolveError_forItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
