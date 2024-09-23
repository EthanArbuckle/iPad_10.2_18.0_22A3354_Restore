@implementation MKMapSnapshotter

void __36__MKMapSnapshotter_initWithOptions___block_invoke()
{
  id v0;

  +[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "startObserving");

}

- (MKMapSnapshotter)initWithOptions:(MKMapSnapshotOptions *)options
{
  MKMapSnapshotOptions *v4;
  MKMapSnapshotter *v5;
  uint64_t v6;
  geo_isolater *isolation;
  uint64_t v8;
  MKMapSnapshotOptions *v9;
  MKMapSnapshotOptions *v10;
  MKMapSnapshotOptions *v11;
  NSObject *v12;
  uint64_t v13;
  os_signpost_id_t v14;
  void *v15;
  void *v16;
  void *v17;
  MKMapSnapshotter *v18;
  uint8_t v20[16];
  objc_super v21;

  v4 = options;
  v21.receiver = self;
  v21.super_class = (Class)MKMapSnapshotter;
  v5 = -[MKMapSnapshotter init](&v21, sel_init);
  if (v5)
  {
    v6 = geo_isolater_create();
    isolation = v5->_isolation;
    v5->_isolation = (geo_isolater *)v6;

    v8 = -[MKMapSnapshotOptions copy](v4, "copy");
    v9 = v5->_options;
    v5->_options = (MKMapSnapshotOptions *)v8;

    if (!v5->_options)
    {
      v10 = objc_alloc_init(MKMapSnapshotOptions);
      v11 = v5->_options;
      v5->_options = v10;

    }
    MKGetSnapshotLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = -[MKMapSnapshotOptions signpostId](v5->_options, "signpostId");
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)v20 = 0;
        _os_signpost_emit_with_name_impl(&dword_18B0B0000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "LifeTime", (const char *)&unk_18B2CC343, v20, 2u);
      }
    }

    if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
    {
      +[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "startObserving");

    }
    else
    {
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_103);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v5, sel__enterBackground_, CFSTR("MKApplicationStateDidEnterBackgroundNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v5, sel__exitBackground_, CFSTR("MKApplicationStateWillEnterForegroundNotification"), 0);

    v18 = v5;
  }

  return v5;
}

- (void)startWithCompletionHandler:(MKMapSnapshotCompletionHandler)completionHandler
{
  -[MKMapSnapshotter startWithQueue:completionHandler:](self, "startWithQueue:completionHandler:", MEMORY[0x1E0C80D38], completionHandler);
}

void __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  const __CFString *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _MKCustomFeatureStore *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  NSObject *v49;
  uint64_t v50;
  id v51;
  void *v52;
  unsigned int v53;
  uint64_t v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  double v60;
  id v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  os_signpost_id_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  NSObject *v87;
  uint64_t v88;
  id v89;
  void *v90;
  _QWORD v91[5];
  id v92;
  _QWORD v93[5];
  _QWORD v94[5];
  _QWORD v95[5];
  uint8_t buf[4];
  uint64_t v97;
  __int16 v98;
  double v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  const __CFString *v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  uint64_t v107;
  uint64_t v108;
  CLLocationCoordinate2D v109;

  v108 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_prepareToSubmit");
  MKGetSnapshotLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (!v3)
    goto LABEL_16;
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_viewportMode");
  if (v4 == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "camera");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "debugDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("camera");
  }
  else if (v4 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "mapRect");
    v16 = v15;
    v18 = v17;
    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), v20, v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.1f, %.1f}"), v16, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("{%@, %@}"), v12, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = CFSTR("mapRect");
  }
  else
  {
    if (v4)
    {
      v13 = 0;
      v14 = CFSTR("<unknown>");
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "region");
    v6 = v5;
    v8 = v7;
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("<center:%@ span:%+.8f, %+.8f>"), v12, v6, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("region");
  }

LABEL_10:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "userInterfaceStyle");

  if (v24 > 2)
    v25 = CFSTR(", unknown");
  else
    v25 = off_1E20DFA08[v24];
  MKGetSnapshotLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "size");
    v29 = v28;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "size");
    *(_DWORD *)buf = 134219267;
    v97 = v27;
    v98 = 2114;
    v99 = *(double *)&v14;
    v100 = 2113;
    v101 = v13;
    v102 = 2114;
    v103 = v25;
    v104 = 2050;
    v105 = v29;
    v106 = 2050;
    v107 = v30;
    _os_log_impl(&dword_18B0B0000, v26, OS_LOG_TYPE_INFO, "<%p> Starting snapshot: <%{public}@: %{private}@%{public}@> (%{public}.1f x %{public}.1f)", buf, 0x3Eu);
  }

LABEL_16:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "camera");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "centerCoordinate");
  if (CLLocationCoordinate2DIsValid(v109))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_customFeatureAnnotations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33)
    {
      v34 = objc_alloc_init(_MKCustomFeatureStore);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_customFeatureAnnotations");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MKCustomFeatureStore addAnnotations:](v34, "addAnnotations:", v35);

    }
    else
    {
      v34 = 0;
    }
    v95[0] = MEMORY[0x1E0C809B0];
    v95[1] = 3221225472;
    v95[2] = __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_57;
    v95[3] = &unk_1E20DF940;
    v95[4] = *(_QWORD *)(a1 + 32);
    v42 = (void *)MEMORY[0x18D778DB8](v95);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "traitCollection");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "displayScale");
    v45 = v44;

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "scale");
    v48 = v47;

    if (v45 <= v48)
    {
      if (v45 <= 1.0)
        v53 = 1;
      else
        v53 = 2;
      if (v45 <= 2.0)
        v54 = v53;
      else
        v54 = 3;
      objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "activeTileGroup");
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (v52)
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "scale");
        v57 = GEOResourceFilterScaleForScale();

        if ((_DWORD)v54 != v57)
        {
          if (objc_msgSend(v52, "activeScalesCount"))
          {
            v58 = 0;
            while (objc_msgSend(v52, "activeScaleAtIndex:", v58) != (_DWORD)v54)
            {
              if (++v58 >= (unint64_t)objc_msgSend(v52, "activeScalesCount"))
                goto LABEL_39;
            }
          }
          else
          {
LABEL_39:
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "scale");
            v45 = v60;

          }
        }
      }
      v61 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "traitCollection");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "displayScale");
      v64 = vabdd_f64(v45, v63);

      if (v64 >= 0.000001)
      {
        v65 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copy");

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "traitCollection");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v94[0] = MEMORY[0x1E0C809B0];
        v94[1] = 3221225472;
        v94[2] = __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_67;
        v94[3] = &__block_descriptor_40_e27_v16__0___UIMutableTraits__8l;
        *(double *)&v94[4] = v45;
        objc_msgSend(v66, "traitCollectionByModifyingTraits:", v94);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setTraitCollection:", v67);

        v61 = v65;
      }
      if (_shouldUseSnapshotService(*(void **)(*(_QWORD *)(a1 + 32) + 8)))
      {
        MKGetSnapshotLog();
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
        if ((unint64_t)(v69 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v70 = v69;
          if (os_signpost_enabled(v68))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_18B0B0000, v68, OS_SIGNPOST_INTERVAL_BEGIN, v70, "SnapshotServiceRequest", (const char *)&unk_18B2CC343, buf, 2u);
          }
        }

        v71 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.MapKit.SnapshotService"));
        v72 = *(_QWORD *)(a1 + 32);
        v73 = *(void **)(v72 + 48);
        *(_QWORD *)(v72 + 48) = v71;

        objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE079860);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setRemoteObjectInterface:", v74);

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "resume");
        v75 = *(_QWORD *)(a1 + 32);
        v76 = *(void **)(v75 + 48);
        v77 = MEMORY[0x1E0C809B0];
        v93[0] = MEMORY[0x1E0C809B0];
        v93[1] = 3221225472;
        v93[2] = __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_79;
        v93[3] = &unk_1E20D9B48;
        v93[4] = v75;
        objc_msgSend(v76, "remoteObjectProxyWithErrorHandler:", v93);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v91[0] = v77;
        v91[1] = 3221225472;
        v91[2] = __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_82;
        v91[3] = &unk_1E20DF990;
        v91[4] = *(_QWORD *)(a1 + 32);
        v92 = v42;
        objc_msgSend(v78, "requestSnapshotWithOptions:completionHandler:", v61, v91);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "activateResourceScale:", v54);

        v80 = objc_alloc(MEMORY[0x1E0DC6518]);
        _snapshotQueue();
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_auditToken");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend(v80, "initWithSnapshotOptions:homeQueue:auditToken:", v61, v81, v82);
        v84 = *(_QWORD *)(a1 + 32);
        v85 = *(void **)(v84 + 56);
        *(_QWORD *)(v84 + 56) = v83;

        v86 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
        if (v86)
        {
          if (v34)
          {
            objc_msgSend(v86, "addCustomFeatureDataSource:", v34);
            v86 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
          }
          objc_msgSend(v86, "renderSnapshot:", v42);
        }
        else
        {
          MKGetSnapshotLog();
          v87 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
          {
            v88 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
            *(_DWORD *)buf = 134217984;
            v97 = v88;
            _os_log_impl(&dword_18B0B0000, v87, OS_LOG_TYPE_ERROR, "<%p> Failed to create underlying snapshotter", buf, 0xCu);
          }

          v89 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v90 = (void *)objc_msgSend(v89, "initWithDomain:code:userInfo:", MKErrorDomain, 1, &unk_1E2159D80);
          objc_msgSend(*(id *)(a1 + 32), "_failWithError:", v90);

        }
      }

    }
    else
    {
      MKGetSnapshotLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
        *(_DWORD *)buf = 134218240;
        v97 = v50;
        v98 = 2050;
        v99 = v45;
        _os_log_impl(&dword_18B0B0000, v49, OS_LOG_TYPE_ERROR, "<%p> Invalid content scale: %{public}.1f", buf, 0x16u);
      }

      v51 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v52 = (void *)objc_msgSend(v51, "initWithDomain:code:userInfo:", MKErrorDomain, 1, &unk_1E2159D58);
      objc_msgSend(*(id *)(a1 + 32), "_failWithError:", v52);
    }

  }
  else
  {
    MKGetSnapshotLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v37 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
      objc_msgSend(v31, "centerCoordinate");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218243;
      v97 = v37;
      v98 = 2113;
      v99 = *(double *)&v40;
      _os_log_impl(&dword_18B0B0000, v36, OS_LOG_TYPE_ERROR, "<%p> Center coordinate is not valid: %{private}@", buf, 0x16u);

    }
    v41 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v34 = (_MKCustomFeatureStore *)objc_msgSend(v41, "initWithDomain:code:userInfo:", MKErrorDomain, 1, &unk_1E2159D30);
    objc_msgSend(*(id *)(a1 + 32), "_failWithError:", v34);
  }

}

- (void)startWithQueue:(dispatch_queue_t)queue completionHandler:(MKMapSnapshotCompletionHandler)completionHandler
{
  NSObject *v7;
  MKMapSnapshotCompletionHandler v8;
  void *v9;
  int *p_loadingFlag;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  void *v16;
  char shouldUseSnapshotService;
  NSObject *v18;
  unint64_t v19;
  os_signpost_id_t v20;
  uint64_t v21;
  id v22;
  uint8_t buf[16];

  v7 = queue;
  v8 = completionHandler;
  v9 = v8;
  if (v7 && v8)
  {
    p_loadingFlag = &self->_loadingFlag;
    while (!__ldxr((unsigned int *)p_loadingFlag))
    {
      if (!__stxr(1u, (unsigned int *)p_loadingFlag))
        goto LABEL_8;
    }
    __clrex();
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Attempted to start a snapshotter that is still loading."), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "raise");

LABEL_8:
    MKGetSnapshotLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = -[MKMapSnapshotOptions signpostId](self->_options, "signpostId");
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v15 = v14;
      if (os_signpost_enabled(v13))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18B0B0000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "StartWithQueue", (const char *)&unk_18B2CC343, buf, 2u);
      }
    }

    objc_storeStrong((id *)&self->_callbackQueue, queue);
    v21 = MEMORY[0x1E0C809B0];
    v22 = v9;
    geo_isolate_sync_data();
    if (!-[MKMapSnapshotOptions _rendersInBackground](self->_options, "_rendersInBackground", v21, 3221225472, __53__MKMapSnapshotter_startWithQueue_completionHandler___block_invoke, &unk_1E20D8238, self))
    {
      +[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isInBackground") & 1) != 0)
      {
        shouldUseSnapshotService = _shouldUseSnapshotService(self->_options);

        if ((shouldUseSnapshotService & 1) == 0)
        {
          self->_needsResume = 1;
          CFRetain(self);
LABEL_20:

          goto LABEL_21;
        }
      }
      else
      {

      }
    }
    -[MKMapSnapshotter _performSnapshot](self, "_performSnapshot");
    MKGetSnapshotLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = -[MKMapSnapshotOptions signpostId](self->_options, "signpostId");
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18B0B0000, v18, OS_SIGNPOST_INTERVAL_END, v20, "StartWithQueue", (const char *)&unk_18B2CC343, buf, 2u);
      }
    }

    goto LABEL_20;
  }
LABEL_21:

}

- (void)_performSnapshot
{
  NSObject *v3;
  unint64_t v4;
  os_signpost_id_t v5;
  void *v6;
  uint64_t v7;
  _QWORD block[5];
  uint8_t buf[16];

  MKGetSnapshotLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = -[MKMapSnapshotOptions signpostId](self->_options, "signpostId");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PerformSnapshot", (const char *)&unk_18B2CC343, buf, 2u);
    }
  }

  -[MKMapSnapshotOptions annotationViews](self->_options, "annotationViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    goto LABEL_7;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[MKMapSnapshotter _setupCustomFeaturesForAnnotationViewsIfNeeded](self, "_setupCustomFeaturesForAnnotationViewsIfNeeded");
LABEL_7:
    -[MKMapSnapshotter _performSnapshotOnSnapshotQueue](self, "_performSnapshotOnSnapshotQueue");
    return;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MKMapSnapshotter__performSnapshot__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_performSnapshotOnSnapshotQueue
{
  NSObject *v3;
  _QWORD block[5];

  _snapshotQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_async(v3, block);

  objc_msgSend(MEMORY[0x1E0D263E8], "reportDailyUsageCountType:", 105);
}

void __53__MKMapSnapshotter_startWithQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (BOOL)isLoading
{
  return self->_loadingFlag == 1;
}

- (MKMapSnapshotter)init
{
  return -[MKMapSnapshotter initWithOptions:](self, "initWithOptions:", 0);
}

- (void)dealloc
{
  VKMapSnapshotCreator *snapshotCreator;
  void *v4;
  void *v5;
  NSObject *v6;
  unint64_t v7;
  os_signpost_id_t v8;
  objc_super v9;
  uint8_t buf[16];

  -[VKMapSnapshotCreator cancel](self->_snapshotCreator, "cancel");
  snapshotCreator = self->_snapshotCreator;
  self->_snapshotCreator = 0;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    +[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopObserving");

  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_14_0);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  MKGetSnapshotLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = -[MKMapSnapshotOptions signpostId](self->_options, "signpostId");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v6, OS_SIGNPOST_INTERVAL_END, v8, "LifeTime", (const char *)&unk_18B2CC343, buf, 2u);
    }
  }

  v9.receiver = self;
  v9.super_class = (Class)MKMapSnapshotter;
  -[MKMapSnapshotter dealloc](&v9, sel_dealloc);
}

void __27__MKMapSnapshotter_dealloc__block_invoke()
{
  id v0;

  +[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stopObserving");

}

- (void)_enterBackground:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  if (!-[MKMapSnapshotOptions _rendersInBackground](self->_options, "_rendersInBackground")
    && (_shouldUseSnapshotService(self->_options) & 1) == 0)
  {
    CFRetain(self);
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    _snapshotQueue();
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__MKMapSnapshotter__enterBackground___block_invoke;
    v7[3] = &unk_1E20D7E10;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(v5, v7);

    v6 = *((unsigned __int8 *)v9 + 24);
    self->_needsResume = v6;
    if (!v6)
      CFRelease(self);
    _Block_object_dispose(&v8, 8);
  }

}

void __37__MKMapSnapshotter__enterBackground___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) != 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "cancelFlushingTileDecodes:", 1);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

}

- (void)_exitBackground:(id)a3
{
  if (self->_needsResume)
  {
    self->_needsResume = 0;
    -[MKMapSnapshotter _performSnapshot](self, "_performSnapshot", a3);
    CFRelease(self);
  }
}

- (void)_cancel
{
  int *p_loadingFlag;
  unsigned int v4;
  id v5;
  void *v6;
  NSXPCConnection *snapshotService;
  VKMapSnapshotCreator *snapshotCreator;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD block[5];
  _QWORD v12[5];
  VKMapSnapshotCreator *v13;

  p_loadingFlag = &self->_loadingFlag;
  while (1)
  {
    v4 = __ldxr((unsigned int *)p_loadingFlag);
    if (v4 != 1)
      break;
    if (!__stxr(0, (unsigned int *)p_loadingFlag))
    {
      v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v6 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", MKErrorDomain, 1, &unk_1E2159D08);
      -[MKMapSnapshotter _respondWithError:](self, "_respondWithError:", v6);

      goto LABEL_6;
    }
  }
  __clrex();
LABEL_6:
  if (_shouldUseSnapshotService(self->_options))
  {
    -[NSXPCConnection invalidate](self->_snapshotService, "invalidate");
    snapshotService = self->_snapshotService;
    self->_snapshotService = 0;

  }
  else
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = __Block_byref_object_copy__26;
    v12[4] = __Block_byref_object_dispose__26;
    v13 = self->_snapshotCreator;
    -[VKMapSnapshotCreator cancel](v13, "cancel");
    snapshotCreator = self->_snapshotCreator;
    self->_snapshotCreator = 0;

    v9 = dispatch_time(0, 10000000);
    _snapshotQueue();
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__MKMapSnapshotter__cancel__block_invoke;
    block[3] = &unk_1E20D8078;
    block[4] = v12;
    dispatch_after(v9, v10, block);

    _Block_object_dispose(v12, 8);
  }
}

void __27__MKMapSnapshotter__cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

- (void)_cleanupSnapshotCreator
{
  NSXPCConnection *snapshotService;
  VKMapSnapshotCreator *snapshotCreator;

  -[NSXPCConnection invalidate](self->_snapshotService, "invalidate");
  snapshotService = self->_snapshotService;
  self->_snapshotService = 0;

  snapshotCreator = self->_snapshotCreator;
  self->_snapshotCreator = 0;

}

- (void)_respondWithError:(id)a3
{
  id v4;
  NSObject *callbackQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MKMapSnapshotter _cleanupSnapshotCreator](self, "_cleanupSnapshotCreator");
  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MKMapSnapshotter__respondWithError___block_invoke;
  v7[3] = &unk_1E20D7E58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(callbackQueue, v7);

}

void __38__MKMapSnapshotter__respondWithError___block_invoke(uint64_t a1)
{
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_signpost_id_t v11;
  uint8_t v12[16];
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  uint64_t v17;
  _BYTE *v18;
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD **)(a1 + 32);
  if (v2[4])
  {
    objc_msgSend(v2, "cancel");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v20 = __Block_byref_object_copy__23;
    v21 = __Block_byref_object_dispose__24;
    v22 = 0;
    v3 = *(_QWORD *)(a1 + 32);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __38__MKMapSnapshotter__respondWithError___block_invoke_25;
    v16 = &unk_1E20D7E10;
    v17 = v3;
    v18 = buf;
    geo_isolate_sync_data();
    v4 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, *(_QWORD *)(a1 + 40));
    MKGetSnapshotLog();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v12 = 0;
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PerformSnapshot", (const char *)&unk_18B2CC343, v12, 2u);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    MKGetSnapshotLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218243;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2113;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_INFO, "<%p> Snapshot failed to render (%{private}@), but snapshotter has already been canceled", buf, 0x16u);
    }

    MKGetSnapshotLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v10, OS_SIGNPOST_INTERVAL_END, v11, "PerformSnapshot", (const char *)&unk_18B2CC343, buf, 2u);
    }

  }
}

void __38__MKMapSnapshotter__respondWithError___block_invoke_25(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = MEMORY[0x18D778DB8](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = 0;

}

- (void)_failWithError:(id)a3
{
  id v3;

  -[MKMapSnapshotter _respondWithError:](self, "_respondWithError:", a3);
  +[MKUsageCounter sharedCounter](MKUsageCounter, "sharedCounter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count:", 55);

}

- (void)_succeedWithSnapshot:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MKMapSnapshotter _cleanupSnapshotCreator](self, "_cleanupSnapshotCreator");
  -[MKMapSnapshotOptions annotationViews](self->_options, "annotationViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99DE8];
    -[MKMapSnapshotOptions annotationViews](self->_options, "annotationViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[MKMapSnapshotOptions annotationViews](self->_options, "annotationViews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(v15, "_skipDrawingForSnapshots") & 1) == 0)
            objc_msgSend(v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    _snapshotQueue();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __41__MKMapSnapshotter__succeedWithSnapshot___block_invoke;
    v17[3] = &unk_1E20D7E58;
    v17[4] = self;
    v18 = v4;
    objc_msgSend(v18, "_prepareForRenderWithAnnotationViews:workQueue:completionHandler:", v9, v16, v17);

  }
  else
  {
    -[MKMapSnapshotter _drawAppleLogoIfNecessaryOnSnapshot:](self, "_drawAppleLogoIfNecessaryOnSnapshot:", v4);
  }

}

uint64_t __41__MKMapSnapshotter__succeedWithSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_drawAppleLogoIfNecessaryOnSnapshot:", *(_QWORD *)(a1 + 40));
}

- (void)_drawAppleLogoIfNecessaryOnSnapshot:(id)a3
{
  id v4;
  MKMapType v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (-[MKMapSnapshotter _shouldRenderLogoForSnapshotDimensions](self, "_shouldRenderLogoForSnapshotDimensions")
    && -[MKMapSnapshotOptions _showsAppleLogo](self->_options, "_showsAppleLogo")
    && _MKLinkedOnOrAfterReleaseSet(2310)
    && objc_msgSend(MEMORY[0x1E0CB34D0], "_mapkit_shouldShowAppleLogo")
    && !-[MKMapSnapshotter _isWidget](self, "_isWidget"))
  {
    v5 = -[MKMapSnapshotOptions mapType](self->_options, "mapType");
    _snapshotQueue();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__MKMapSnapshotter__drawAppleLogoIfNecessaryOnSnapshot___block_invoke;
    v7[3] = &unk_1E20D7E58;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v8, "_displayAppleLogoForMapType:callbackQueue:completionHandler:", v5, v6, v7);

  }
  else
  {
    -[MKMapSnapshotter _deliverSnapshot:](self, "_deliverSnapshot:", v4);
  }

}

uint64_t __56__MKMapSnapshotter__drawAppleLogoIfNecessaryOnSnapshot___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deliverSnapshot:", *(_QWORD *)(a1 + 40));
}

- (void)_deliverSnapshot:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  MKMapSnapshotter *v12;
  id v13;

  v4 = a3;
  if (qword_1ECE2DE68 != -1)
    dispatch_once(&qword_1ECE2DE68, &__block_literal_global_146);
  v5 = (void *)qword_1ECE2DE60;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __37__MKMapSnapshotter__deliverSnapshot___block_invoke;
  v11 = &unk_1E20D7E58;
  v12 = self;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "dispatch:", &v8);
  +[MKUsageCounter sharedCounter](MKUsageCounter, "sharedCounter", v8, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "count:", 54);

}

void __37__MKMapSnapshotter__deliverSnapshot___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  os_signpost_id_t v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 16))
  {
    v3 = *(NSObject **)(v2 + 24);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__MKMapSnapshotter__deliverSnapshot___block_invoke_29;
    v9[3] = &unk_1E20D7E58;
    v9[4] = v2;
    v10 = *(id *)(a1 + 40);
    dispatch_async(v3, v9);

  }
  else
  {
    MKGetSnapshotLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
      *(_DWORD *)buf = 134217984;
      v12 = v5;
      _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "<%p> Snapshot succeeded, but snapshotter has already been canceled", buf, 0xCu);
    }

    MKGetSnapshotLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
    if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v8 = v7;
      if (os_signpost_enabled(v6))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18B0B0000, v6, OS_SIGNPOST_INTERVAL_END, v8, "PerformSnapshot", (const char *)&unk_18B2CC343, buf, 2u);
      }
    }

  }
}

void __37__MKMapSnapshotter__deliverSnapshot___block_invoke_29(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  uint64_t v9;
  os_signpost_id_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 16);
  while (1)
  {
    v3 = __ldxr(v2);
    if (v3 != 1)
      break;
    if (!__stxr(0, v2))
    {
      objc_msgSend(*(id *)(a1 + 32), "cancel");
      *(_QWORD *)v13 = 0;
      v14 = v13;
      v15 = 0x3032000000;
      v16 = __Block_byref_object_copy__23;
      v17 = __Block_byref_object_dispose__24;
      v18 = 0;
      v11 = MEMORY[0x1E0C809B0];
      v12 = *(_QWORD *)(a1 + 32);
      geo_isolate_sync_data();
      if (*((_QWORD *)v14 + 5))
      {
        MKGetSnapshotLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId", v11, 3221225472, __37__MKMapSnapshotter__deliverSnapshot___block_invoke_30, &unk_1E20D7E10, v12, v13);
          *(_DWORD *)buf = 134217984;
          v20 = v5;
          _os_log_impl(&dword_18B0B0000, v4, OS_LOG_TYPE_INFO, "<%p> Successfully rendered map snapshot", buf, 0xCu);
        }

        (*(void (**)(void))(*((_QWORD *)v14 + 5) + 16))();
      }
      MKGetSnapshotLog();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18B0B0000, v6, OS_SIGNPOST_INTERVAL_END, v7, "PerformSnapshot", (const char *)&unk_18B2CC343, buf, 2u);
      }

      _Block_object_dispose(v13, 8);
      return;
    }
  }
  __clrex();
  MKGetSnapshotLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v8, OS_SIGNPOST_INTERVAL_END, v10, "PerformSnapshot", (const char *)&unk_18B2CC343, v13, 2u);
    }
  }

}

void __37__MKMapSnapshotter__deliverSnapshot___block_invoke_30(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = MEMORY[0x18D778DB8](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = 0;

}

- (BOOL)_isWidget
{
  void *v2;
  void *v3;
  id v4;
  uint64_t (*CHSIsWidgetExtensionPointSymbolLoc)(id);
  char v6;

  if (!qword_1ECE2DE48)
    qword_1ECE2DE48 = _sl_dlopen();
  if (!qword_1ECE2DE48 || !getCHSIsWidgetExtensionPointSymbolLoc())
    return 0;
  objc_msgSend(MEMORY[0x1E0CA58E0], "extensionPointRecordForCurrentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "identifier");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    CHSIsWidgetExtensionPointSymbolLoc = (uint64_t (*)(id))getCHSIsWidgetExtensionPointSymbolLoc();
    if (!CHSIsWidgetExtensionPointSymbolLoc)
    {
      dlerror();
      abort_report_np();
    }
    v6 = CHSIsWidgetExtensionPointSymbolLoc(v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldRenderLogoForSnapshotDimensions
{
  double v3;
  double v5;

  -[MKMapSnapshotOptions size](self->_options, "size");
  if (v3 < (double)GEOConfigGetInteger())
    return 0;
  -[MKMapSnapshotOptions size](self->_options, "size");
  return v5 >= (double)GEOConfigGetInteger();
}

- (void)_setupCustomFeaturesForAnnotationViewsIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  MKMapSnapshotOptions *options;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[MKMapSnapshotOptions annotationViews](self->_options, "annotationViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "prepareForSnapshotting");
        if (objc_msgSend(v11, "isProvidingCustomFeature"))
        {
          objc_msgSend(v11, "_updateAnchorPosition:alignToPixels:", 1, v8, v9);
          objc_msgSend(v11, "customFeatureAnnotation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    -[MKMapSnapshotOptions _customFeatureAnnotations](self->_options, "_customFeatureAnnotations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    options = self->_options;
    if (v14)
    {
      -[MKMapSnapshotOptions _customFeatureAnnotations](options, "_customFeatureAnnotations");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKMapSnapshotOptions _setCustomFeatureAnnotations:](self->_options, "_setCustomFeatureAnnotations:", v17);

    }
    else
    {
      -[MKMapSnapshotOptions _setCustomFeatureAnnotations:](options, "_setCustomFeatureAnnotations:", v3);
    }
  }

}

uint64_t __36__MKMapSnapshotter__performSnapshot__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setupCustomFeaturesForAnnotationViewsIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_performSnapshotOnSnapshotQueue");
}

void __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_57(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  MKMapSnapshot *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    if (v5)
    {
      v7 = [MKMapSnapshot alloc];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "traitCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[MKMapSnapshot _initWithSnapshot:traitCollection:](v7, "_initWithSnapshot:traitCollection:", v5, v8);

      if (v9)
      {
        objc_msgSend(*(id *)(a1 + 32), "_succeedWithSnapshot:", v9);
      }
      else
      {
        MKGetSnapshotLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
          v17 = 134217984;
          v18 = v14;
          _os_log_impl(&dword_18B0B0000, v13, OS_LOG_TYPE_ERROR, "<%p> Failed to initialize final snapshot object", (uint8_t *)&v17, 0xCu);
        }

        v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v16 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", MKErrorDomain, 1, 0);
        objc_msgSend(*(id *)(a1 + 32), "_failWithError:", v16);

        v9 = 0;
      }
    }
    else
    {
      MKGetSnapshotLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
        v17 = 134218242;
        v18 = v11;
        v19 = 2114;
        v20 = v6;
        _os_log_impl(&dword_18B0B0000, v10, OS_LOG_TYPE_ERROR, "<%p> Snapshot failed to render: %{public}@", (uint8_t *)&v17, 0x16u);
      }

      v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v9 = (id)objc_msgSend(v12, "initWithDomain:code:userInfo:", MKErrorDomain, 2, 0);
      objc_msgSend(*(id *)(a1 + 32), "_failWithError:", v9);
    }

  }
}

uint64_t __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_67(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisplayScale:", *(double *)(a1 + 32));
}

void __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_79(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  _snapshotQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_2;
  v6[3] = &unk_1E20D7E58;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_signpost_id_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  MKGetSnapshotLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      LOWORD(v12) = 0;
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v2, OS_SIGNPOST_INTERVAL_END, v4, "SnapshotServiceRequest", (const char *)&unk_18B2CC343, (uint8_t *)&v12, 2u);
    }
  }

  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v16 = *MEMORY[0x1E0CB3388];
      v17[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    MKGetSnapshotLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 134218242;
      v13 = v8;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_18B0B0000, v7, OS_LOG_TYPE_ERROR, "<%p> Snapshot service encountered error: %{public}@", (uint8_t *)&v12, 0x16u);
    }

    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v11 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", MKErrorDomain, 1, v6);
    objc_msgSend(*(id *)(a1 + 32), "_failWithError:", v11);

  }
}

void __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_82(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  _snapshotQueue();
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_2_83;
  v11[3] = &unk_1E20DF968;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __51__MKMapSnapshotter__performSnapshotOnSnapshotQueue__block_invoke_2_83(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  MKGetSnapshotLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "signpostId");
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)v6 = 0;
      _os_signpost_emit_with_name_impl(&dword_18B0B0000, v2, OS_SIGNPOST_INTERVAL_END, v4, "SnapshotServiceRequest", (const char *)&unk_18B2CC343, v6, 2u);
    }
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  _snapshotQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__MKMapSnapshotter_cancel__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  dispatch_sync(v3, block);

  if (self->_needsResume)
  {
    self->_needsResume = 0;
    CFRelease(self);
  }
}

uint64_t __26__MKMapSnapshotter_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotCreator, 0);
  objc_storeStrong((id *)&self->_snapshotService, 0);
  objc_storeStrong((id *)&self->_isolation, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
