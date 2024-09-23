@implementation FigCaptureDisplayLayoutMonitor

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[FigCaptureDisplayLayoutMonitor debugDescription](self, "debugDescription"));
}

- (NSString)debugDescription
{
  unint64_t displayType;

  displayType = self->_displayType;
  if (displayType > 2)
    return 0;
  else
    return &off_1E49238D0[displayType]->isa;
}

- (void)addLayoutObserver:(id)a3
{
  -[FigCaptureDisplayLayoutMonitor _addLayoutObserver:withImmediateCallback:]((uint64_t)self, a3, 1);
}

NSObject *__92__FigCaptureDisplayLayoutMonitor_initWithFBSDisplayLayoutMonitorCreateFunction_displayType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *result;

  -[FigCaptureDisplayLayoutMonitor _parseDisplayLayout:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  result = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (result)
  {
    result = dispatch_semaphore_signal(result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
  }
  return result;
}

- (uint64_t)_parseDisplayLayout:(uint64_t)result
{
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  _BOOL4 v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  os_log_type_t type;
  int v72;
  _QWORD v73[12];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;
  CGRect v77;
  CGRect v78;

  v76 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  v58 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v57 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v62 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  result = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v50 = (void *)result;
  if (dword_1ECFE9550)
  {
    v72 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    result = fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a2)
  {
    v5 = *(_QWORD *)(v3 + 8);
    if (!v5)
    {
      result = objc_msgSend((id)objc_msgSend(a2, "displayConfiguration"), "isMainDisplay");
      if ((result & 1) != 0)
        goto LABEL_13;
      v5 = *(_QWORD *)(v3 + 8);
    }
    if (v5 == 1)
    {
      result = objc_msgSend((id)objc_msgSend(a2, "displayConfiguration"), "isExternal");
      if ((result & 1) != 0)
        goto LABEL_13;
      v5 = *(_QWORD *)(v3 + 8);
    }
    if (v5 != 2)
      return result;
    result = objc_msgSend((id)objc_msgSend(a2, "displayConfiguration"), "isExternal");
    if (!(_DWORD)result)
      return result;
  }
LABEL_13:
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v6 = (void *)objc_msgSend(a2, "elements", v44, v45);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  v8 = (uint64_t *)MEMORY[0x1E0D22C78];
  v9 = (uint64_t *)MEMORY[0x1E0DAB658];
  if (!v7)
  {
    v11 = 0;
LABEL_27:
    v18 = v3;
    pthread_mutex_lock(*(pthread_mutex_t **)(v3 + 32));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v19 = (void *)objc_msgSend(a2, "elements");
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
    if (!v20)
    {
      v48 = 0;
      v46 = 0;
      v47 = 0;
      v59 = 0;
      v61 = 0;
      goto LABEL_64;
    }
    v21 = v20;
    v48 = 0;
    v46 = 0;
    v47 = 0;
    v59 = 0;
    v61 = 0;
    v22 = *(_QWORD *)v64;
    v23 = *MEMORY[0x1E0D22C88];
    v55 = *v8;
    v56 = *MEMORY[0x1E0D22C80];
    v54 = *MEMORY[0x1E0D22C70];
    v53 = *v9;
    v52 = *MEMORY[0x1E0DAB698];
    v51 = *MEMORY[0x1E0DAB6A8];
    while (1)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v64 != v22)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(v25, "frame");
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;
        objc_msgSend(a2, "bounds");
        v78.origin.x = v34;
        v78.origin.y = v35;
        v78.size.width = v36;
        v78.size.height = v37;
        v77.origin.x = v27;
        v77.origin.y = v29;
        v77.size.width = v31;
        v77.size.height = v33;
        v38 = CGRectEqualToRect(v77, v78);
        if (objc_msgSend(v25, "isUIApplicationElement"))
        {
          if (objc_msgSend(v25, "level") < v11)
          {
            v39 = objc_msgSend(v25, "bundleIdentifier");
            v40 = v62;
LABEL_35:
            objc_msgSend(v40, "addObject:", v39);
            continue;
          }
          if (objc_msgSend(v25, "layoutRole") == 5)
          {
            if ((objc_msgSend(v25, "sb_isStashedPIP") & 1) == 0)
            {
              v39 = objc_msgSend(v25, "bundleIdentifier");
              v40 = v50;
              goto LABEL_35;
            }
          }
          else
          {
            if ((objc_msgSend(v58, "containsObject:", objc_msgSend(v25, "bundleIdentifier")) & 1) == 0
              && (objc_msgSend(v57, "containsObject:", objc_msgSend(v25, "bundleIdentifier")) & 1) == 0)
            {
              v42 = objc_msgSend(v25, "bundleIdentifier");
              if (v38)
                v43 = v58;
              else
                v43 = v57;
              objc_msgSend(v43, "addObject:", v42);
            }
            if (objc_msgSend(v25, "level") > v59)
              v59 = objc_msgSend(v25, "level");
            if (objc_msgSend(v25, "sb_isTransitioning"))
            {
              v39 = objc_msgSend(v25, "bundleIdentifier");
              v40 = (void *)v49;
              goto LABEL_35;
            }
          }
        }
        else if (v38)
        {
          v41 = *(id *)(v18 + 56);
          if (!v41)
          {
            v73[0] = v23;
            v73[1] = v56;
            v73[2] = v55;
            v73[3] = v54;
            v73[4] = CFSTR("com.apple.CMViewSrvc");
            v73[5] = v53;
            v73[6] = v52;
            v73[7] = v51;
            v73[8] = CFSTR("SBControlCenterModuleTransientOverlayViewController");
            v73[9] = 0x1E493D518;
            v73[10] = 0x1E493D6D8;
            v73[11] = 0x1E493D6F8;
            v41 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 12);
            *(_QWORD *)(v18 + 56) = v41;
          }
          if ((objc_msgSend(v41, "containsObject:", objc_msgSend(v25, "identifier")) & 1) != 0)
          {
            if ((objc_msgSend((id)objc_msgSend(v25, "identifier"), "isEqualToString:", v23) & 1) != 0)
            {
              v48 = 1;
            }
            else if ((objc_msgSend((id)objc_msgSend(v25, "identifier"), "isEqualToString:", 0x1E493D518) & 1) != 0
                   || objc_msgSend((id)objc_msgSend(v25, "identifier"), "isEqualToString:", 0x1E493D6D8))
            {
              v46 = 1;
            }
          }
          else if (objc_msgSend(v25, "level") > v61)
          {
            v61 = objc_msgSend(v25, "level");
            v47 = objc_msgSend(v25, "identifier");
          }
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
      if (!v21)
      {
LABEL_64:
        if (v61 > v59 || (v46 & 1) != 0)
        {
          objc_msgSend(v62, "addObjectsFromArray:", v58);
          objc_msgSend(v62, "addObjectsFromArray:", v57);
          objc_msgSend(v62, "addObjectsFromArray:", v50);
          objc_msgSend(v58, "removeAllObjects");
          objc_msgSend(v57, "removeAllObjects");
          objc_msgSend(v50, "removeAllObjects");
          if (!((v47 == 0) | v46 & 1))
            objc_msgSend(v58, "addObject:", v47);
        }
        objc_msgSend(v58, "count");
        objc_msgSend(v57, "count");

        *(_QWORD *)(v18 + 48) = -[FigCaptureDisplayLayout _init]([FigCaptureDisplayLayout alloc], "_init");
        objc_msgSend(*(id *)(v18 + 48), "setTimestamp:", objc_msgSend(a2, "timestamp"));
        objc_msgSend(*(id *)(v18 + 48), "setDisplayType:", *(_QWORD *)(v18 + 8));
        objc_msgSend(*(id *)(v18 + 48), "setForegroundApps:", objc_msgSend(v58, "arrayByAddingObjectsFromArray:", v57));
        objc_msgSend(*(id *)(v18 + 48), "setObscuredApps:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v62));
        objc_msgSend(*(id *)(v18 + 48), "setTransitioningApps:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v49));
        objc_msgSend(*(id *)(v18 + 48), "setPipApps:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v50));
        objc_msgSend(*(id *)(v18 + 48), "setSiriVisible:", v48 & 1);
        objc_msgSend(*(id *)(v18 + 48), "setPaymentServiceVisible:", v46 & 1);
        if (*(_QWORD *)(v18 + 8) == 2)
          *(_BYTE *)(v18 + 40) = a2 != 0;
        -[FigCaptureDisplayLayoutMonitor _updateObserversWithLayout:](v18, *(_QWORD *)(v18 + 48));
        return pthread_mutex_unlock(*(pthread_mutex_t **)(v18 + 32));
      }
    }
  }
  v10 = v7;
  v60 = v3;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v68;
  v14 = *MEMORY[0x1E0DAB658];
  v15 = *MEMORY[0x1E0D22C78];
  do
  {
    v16 = 0;
    do
    {
      if (*(_QWORD *)v68 != v13)
        objc_enumerationMutation(v6);
      v17 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v16);
      if ((objc_msgSend((id)objc_msgSend(v17, "identifier"), "isEqualToString:", v14) & 1) != 0)
      {
        v12 = 1;
      }
      else if (objc_msgSend((id)objc_msgSend(v17, "identifier"), "isEqualToString:", v15))
      {
        v11 = objc_msgSend(v17, "level");
      }
      ++v16;
    }
    while (v10 != v16);
    result = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    v10 = result;
  }
  while (result);
  v3 = v60;
  v9 = (uint64_t *)MEMORY[0x1E0DAB658];
  v8 = (uint64_t *)MEMORY[0x1E0D22C78];
  if ((v12 & 1) == 0)
    goto LABEL_27;
  return result;
}

- (void)_updateObserversWithLayout:(uint64_t)a1
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  os_log_type_t type;
  int v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    FigSimpleMutexCheckIsLockedOnThisThread();
    if (dword_1ECFE9550)
    {
      v17 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 16));
    v5 = (void *)objc_msgSend(*(id *)(a1 + 24), "copy");
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 16));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "layoutMonitor:didUpdateLayout:", a1, a2, v10, v11);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      }
      while (v7);
    }

  }
}

+ (id)sharedDisplayLayoutMonitor
{
  if (sharedDisplayLayoutMonitor_sLayoutMonitorOnceToken != -1)
    dispatch_once(&sharedDisplayLayoutMonitor_sLayoutMonitorOnceToken, &__block_literal_global_69);
  return (id)sharedDisplayLayoutMonitor_sLayoutMonitor;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

FigCaptureDisplayLayoutMonitor *__60__FigCaptureDisplayLayoutMonitor_sharedDisplayLayoutMonitor__block_invoke()
{
  FigCaptureDisplayLayoutMonitor *result;

  result = -[FigCaptureDisplayLayoutMonitor initWithFBSDisplayLayoutMonitorCreateFunction:displayType:]([FigCaptureDisplayLayoutMonitor alloc], "initWithFBSDisplayLayoutMonitorCreateFunction:displayType:", fcdlm_createLayoutMonitorForMainDisplay, 0);
  sharedDisplayLayoutMonitor_sLayoutMonitor = (uint64_t)result;
  return result;
}

+ (id)sharedExternalDisplayLayoutMonitor
{
  if (sharedExternalDisplayLayoutMonitor_sDisplayLayoutMonitorOnceToken != -1)
    dispatch_once(&sharedExternalDisplayLayoutMonitor_sDisplayLayoutMonitorOnceToken, &__block_literal_global_12);
  return (id)sharedExternalDisplayLayoutMonitor_sDisplayLayoutMonitor;
}

FigCaptureDisplayLayoutMonitor *__68__FigCaptureDisplayLayoutMonitor_sharedExternalDisplayLayoutMonitor__block_invoke()
{
  FigCaptureDisplayLayoutMonitor *result;

  result = -[FigCaptureDisplayLayoutMonitor initWithFBSDisplayLayoutMonitorCreateFunction:displayType:]([FigCaptureDisplayLayoutMonitor alloc], "initWithFBSDisplayLayoutMonitorCreateFunction:displayType:", fcdlm_createLayoutMonitorForExternalDisplay, 1);
  sharedExternalDisplayLayoutMonitor_sDisplayLayoutMonitor = (uint64_t)result;
  return result;
}

+ (id)sharedContinuityDisplayLayoutMonitor
{
  if (sharedContinuityDisplayLayoutMonitor_sContinuityDisplayLayoutMonitorOnceToken != -1)
    dispatch_once(&sharedContinuityDisplayLayoutMonitor_sContinuityDisplayLayoutMonitorOnceToken, &__block_literal_global_13);
  return (id)sharedContinuityDisplayLayoutMonitor_sContinuityDisplayLayoutMonitor;
}

FigCaptureDisplayLayoutMonitor *__70__FigCaptureDisplayLayoutMonitor_sharedContinuityDisplayLayoutMonitor__block_invoke()
{
  FigCaptureDisplayLayoutMonitor *result;

  result = -[FigCaptureDisplayLayoutMonitor initWithFBSDisplayLayoutMonitorCreateFunction:displayType:]([FigCaptureDisplayLayoutMonitor alloc], "initWithFBSDisplayLayoutMonitorCreateFunction:displayType:", fcdlm_createLayoutMonitorForContinuityDisplay, 2);
  sharedContinuityDisplayLayoutMonitor_sContinuityDisplayLayoutMonitor = (uint64_t)result;
  return result;
}

- (FigCaptureDisplayLayoutMonitor)initWithFBSDisplayLayoutMonitorCreateFunction:(void *)a3 displayType:(int64_t)a4
{
  FigCaptureDisplayLayoutMonitor *v6;
  FigCaptureDisplayLayoutMonitor *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v9;
  uint64_t v10;
  SBSExternalDisplayService *v11;
  FigCaptureOSStateHandle *v12;
  unint64_t displayType;
  __CFString *v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[6];
  os_log_type_t type;
  int v20;
  objc_super v21;
  _QWORD v22[7];
  _QWORD v23[17];

  v23[16] = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)FigCaptureDisplayLayoutMonitor;
  v6 = -[FigCaptureDisplayLayoutMonitor init](&v21, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  v6->_displayType = a4;
  v6->_layoutObserversLock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  v7->_layoutObservers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7->_layoutLock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  v7->_layout = (FigCaptureDisplayLayout *)-[FigCaptureDisplayLayout _init]([FigCaptureDisplayLayout alloc], "_init");
  -[FigCaptureDisplayLayout setTimestamp:](v7->_layout, "setTimestamp:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
  -[FigCaptureDisplayLayout setDisplayType:](v7->_layout, "setDisplayType:", v7->_displayType);
  if (dword_1ECFE9550)
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3052000000;
  v23[3] = __Block_byref_object_copy__26;
  v23[4] = __Block_byref_object_dispose__26;
  v23[5] = v7;
  v9 = dispatch_semaphore_create(0);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3052000000;
  v22[3] = __Block_byref_object_copy__26;
  v22[4] = __Block_byref_object_dispose__26;
  v22[5] = v9;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __92__FigCaptureDisplayLayoutMonitor_initWithFBSDisplayLayoutMonitorCreateFunction_displayType___block_invoke;
  v18[3] = &unk_1E4923888;
  v18[4] = v23;
  v18[5] = v22;
  v7->_displayConnected = v7->_displayType == 0;
  v10 = ((uint64_t (*)(_QWORD *))a3)(v18);
  v7->_layoutMonitor = (FBSDisplayLayoutMonitor *)v10;
  if (v10)
  {
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    if (v7->_displayType != 1)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (v7->_displayType == 1)
  {
    v7->_displayConnected = 0;
LABEL_9:
    v11 = (SBSExternalDisplayService *)objc_alloc_init(MEMORY[0x1E0DAAE48]);
    v7->_externalDisplayService = v11;
    -[SBSExternalDisplayService addObserver:](v11, "addObserver:", v7);
  }
LABEL_10:

  v12 = [FigCaptureOSStateHandle alloc];
  displayType = v7->_displayType;
  if (displayType > 2)
    v14 = 0;
  else
    v14 = off_1E49238D0[displayType];
  v7->_osStateHandle = -[FigCaptureOSStateHandle initWithTitle:queue:dataProvider:](v12, "initWithTitle:queue:dataProvider:", v14, 0, v7, v16, v17);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[FBSDisplayLayoutMonitor invalidate](self->_layoutMonitor, "invalidate");
  FigSimpleMutexDestroy();
  FigSimpleMutexDestroy();

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDisplayLayoutMonitor;
  -[FigCaptureDisplayLayoutMonitor dealloc](&v3, sel_dealloc);
}

- (uint64_t)_addLayoutObserver:(int)a3 withImmediateCallback:
{
  uint64_t v5;

  if (result)
  {
    v5 = result;
    pthread_mutex_lock(*(pthread_mutex_t **)(result + 16));
    objc_msgSend(*(id *)(v5 + 24), "addObject:", a2);
    result = pthread_mutex_unlock(*(pthread_mutex_t **)(v5 + 16));
    if (a3)
    {
      pthread_mutex_lock(*(pthread_mutex_t **)(v5 + 32));
      objc_msgSend(a2, "layoutMonitor:didUpdateLayout:", v5, *(_QWORD *)(v5 + 48));
      return pthread_mutex_unlock(*(pthread_mutex_t **)(v5 + 32));
    }
  }
  return result;
}

- (void)addLayoutObserverWithoutImmediateCallback:(id)a3
{
  -[FigCaptureDisplayLayoutMonitor _addLayoutObserver:withImmediateCallback:]((uint64_t)self, a3, 0);
}

- (void)removeLayoutObserver:(id)a3
{
  pthread_mutex_lock((pthread_mutex_t *)self->_layoutLock);
  pthread_mutex_lock((pthread_mutex_t *)self->_layoutObserversLock);
  -[NSMutableArray removeObject:](self->_layoutObservers, "removeObject:", a3);
  pthread_mutex_unlock((pthread_mutex_t *)self->_layoutObserversLock);
  pthread_mutex_unlock((pthread_mutex_t *)self->_layoutLock);
}

- (FigCaptureDisplayLayout)currentLayout
{
  FigCaptureDisplayLayout *v3;

  pthread_mutex_lock((pthread_mutex_t *)self->_layoutLock);
  v3 = self->_layout;
  pthread_mutex_unlock((pthread_mutex_t *)self->_layoutLock);
  return v3;
}

- (BOOL)isOnHomeScreen
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[FBSDisplayLayoutMonitor currentLayout](self->_layoutMonitor, "currentLayout");
  if (objc_msgSend((id)objc_msgSend(v2, "elements"), "count") == 1
    || objc_msgSend((id)objc_msgSend(v2, "elements"), "count") == 2)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = (void *)objc_msgSend(v2, "elements", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      v7 = *MEMORY[0x1E0DAB668];
      v8 = *MEMORY[0x1E0DAB660];
LABEL_5:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_msgSend((id)objc_msgSend(v10, "identifier"), "isEqualToString:", v7) & 1) == 0)
        {
          v11 = objc_msgSend((id)objc_msgSend(v10, "identifier"), "isEqualToString:", v8);
          if (!v11)
            break;
        }
        if (v5 == ++v9)
        {
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v5)
            goto LABEL_5;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      LOBYTE(v11) = 1;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (BOOL)isOnLockScreen
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[FBSDisplayLayoutMonitor currentLayout](self->_layoutMonitor, "currentLayout");
  v3 = objc_msgSend(v2, "displayBacklightLevel");
  if (v3)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = (void *)objc_msgSend(v2, "elements", 0);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      v8 = *MEMORY[0x1E0D22C78];
      v9 = 0x8000000000000000;
      v10 = 0x8000000000000000;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v13 = objc_msgSend((id)objc_msgSend(v12, "identifier"), "isEqualToString:", v8);
          v14 = objc_msgSend(v12, "level");
          if ((v13 & 1) != 0)
          {
            v9 = v14;
          }
          else if (v14 > v10)
          {
            v10 = objc_msgSend(v12, "level");
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }
    else
    {
      v9 = 0x8000000000000000;
      v10 = 0x8000000000000000;
    }
    LOBYTE(v3) = v9 > v10;
  }
  return v3;
}

- (void)_startMonitoringDisplayWithIdentity:(uint64_t)a1
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t type;
  int v13;
  _QWORD v14[28];

  v14[27] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3052000000;
    v14[3] = __Block_byref_object_copy__26;
    v14[4] = __Block_byref_object_dispose__26;
    v14[5] = a1;
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 == 1)
    {
      v5 = objc_msgSend(a2, "isExternal");
    }
    else
    {
      if (v4)
      {
LABEL_12:
        _Block_object_dispose(v14, 8);
        return;
      }
      v5 = objc_msgSend(a2, "isMainDisplay");
    }
    if ((v5 & 1) != 0)
    {
      if (objc_msgSend(a2, "isExternal"))
      {
        v6 = SBSCreateLayoutServiceEndpointForExternalDisplay();
        if (v6)
        {
          if (dword_1ECFE9550)
          {
            v13 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v8 = (void *)objc_msgSend(MEMORY[0x1E0D230E0], "configurationWithEndpoint:", v6, v9, v10, MEMORY[0x1E0C809B0], 3221225472, __70__FigCaptureDisplayLayoutMonitor__startMonitoringDisplayWithIdentity___block_invoke, &unk_1E49238B0, v14);
          objc_msgSend(v8, "setNeedsUserInteractivePriority:", 1);
          objc_msgSend(v8, "setTransitionHandler:", &v11);
          pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 32));
          *(_BYTE *)(a1 + 40) = 1;
          objc_msgSend(*(id *)(a1 + 64), "invalidate");

          *(_QWORD *)(a1 + 64) = (id)objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v8);
          pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 32));
        }
      }
    }
    goto LABEL_12;
  }
}

uint64_t __70__FigCaptureDisplayLayoutMonitor__startMonitoringDisplayWithIdentity___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return -[FigCaptureDisplayLayoutMonitor _parseDisplayLayout:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
}

- (uint64_t)_stopMonitoringDisplayWithIdentity:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (result)
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 8);
    if (v3 == 1)
    {
      result = objc_msgSend(a2, "isExternal");
      if (!(_DWORD)result)
        return result;
    }
    else
    {
      if (v3)
        return result;
      result = objc_msgSend(a2, "isMainDisplay");
      if ((result & 1) == 0)
        return result;
    }
    if (dword_1ECFE9550)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    pthread_mutex_lock(*(pthread_mutex_t **)(v2 + 32));
    *(_BYTE *)(v2 + 40) = 0;
    objc_msgSend(*(id *)(v2 + 64), "invalidate");

    *(_QWORD *)(v2 + 64) = 0;
    *(_QWORD *)(v2 + 48) = -[FigCaptureDisplayLayout _init]([FigCaptureDisplayLayout alloc], "_init");
    objc_msgSend(*(id *)(v2 + 48), "setTimestamp:", objc_msgSend(MEMORY[0x1E0C99D68], "date"));
    objc_msgSend(*(id *)(v2 + 48), "setDisplayType:", *(_QWORD *)(v2 + 8));
    -[FigCaptureDisplayLayoutMonitor _updateObserversWithLayout:](v2, *(_QWORD *)(v2 + 48));
    return pthread_mutex_unlock(*(pthread_mutex_t **)(v2 + 32));
  }
  return result;
}

- (uint64_t)_displayIdentityForDisplayInfo:(uint64_t)a1
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0D23100]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_msgSend(v4, "connectedIdentities", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11 = *(_QWORD *)(a1 + 8);
        if (v11 == 1)
        {
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "isExternal"))
            goto LABEL_13;
        }
        else if (v11 || (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "isMainDisplay") & 1) == 0)
        {
          goto LABEL_13;
        }
        if ((objc_msgSend((id)objc_msgSend(a2, "identifier"), "isEqualToString:", objc_msgSend((id)objc_msgSend(v4, "configurationForIdentity:", v10), "hardwareIdentifier")) & 1) != 0)goto LABEL_16;
LABEL_13:
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  v10 = 0;
LABEL_16:
  objc_msgSend(v4, "invalidate");

  return v10;
}

- (void)externalDisplayDidConnect:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v6;
  void *v7;
  int64_t displayType;

  if (dword_1ECFE9550)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6 = (void *)-[FigCaptureDisplayLayoutMonitor _displayIdentityForDisplayInfo:]((uint64_t)self, a3);
  if (self)
  {
    v7 = v6;
    displayType = self->_displayType;
    if (displayType == 1)
    {
      if (!objc_msgSend(v6, "isExternal"))
        return;
    }
    else if (displayType || (objc_msgSend(v6, "isMainDisplay") & 1) == 0)
    {
      return;
    }
    -[FigCaptureDisplayLayoutMonitor _startMonitoringDisplayWithIdentity:]((uint64_t)self, v7);
  }
}

- (void)externalDisplayWillDisconnect:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v6;
  void *v7;
  int64_t displayType;

  if (dword_1ECFE9550)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6 = (void *)-[FigCaptureDisplayLayoutMonitor _displayIdentityForDisplayInfo:]((uint64_t)self, a3);
  if (self)
  {
    v7 = v6;
    displayType = self->_displayType;
    if (displayType == 1)
    {
      if (!objc_msgSend(v6, "isExternal"))
        return;
    }
    else if (displayType || (objc_msgSend(v6, "isMainDisplay") & 1) == 0)
    {
      return;
    }
    -[FigCaptureDisplayLayoutMonitor _stopMonitoringDisplayWithIdentity:]((uint64_t)self, v7);
  }
}

- (id)osStatePropertyList
{
  void *v3;
  _BOOL4 displayConnected;
  NSMutableArray *layoutObservers;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  const __CFString *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  _QWORD v18[4];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  pthread_mutex_lock((pthread_mutex_t *)self->_layoutLock);
  displayConnected = self->_displayConnected;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  layoutObservers = self->_layoutObservers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](layoutObservers, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(layoutObservers);
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "description"));
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](layoutObservers, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v7);
  }
  v10 = -[FigCaptureDisplayLayout description](self->_layout, "description");
  if (-[FBSDisplayLayoutMonitor currentLayout](self->_layoutMonitor, "currentLayout"))
    v11 = (const __CFString *)objc_msgSend((id)objc_msgSend((id)-[FBSDisplayLayoutMonitor currentLayout](self->_layoutMonitor, "currentLayout"), "description"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E4928818);
  else
    v11 = CFSTR("nil");
  pthread_mutex_unlock((pthread_mutex_t *)self->_layoutLock);
  v17[0] = CFSTR("connected");
  v18[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", displayConnected);
  v18[1] = v3;
  v17[1] = CFSTR("observers");
  v17[2] = CFSTR("layout");
  v17[3] = CFSTR("FBSDisplayLayout");
  v18[2] = v10;
  v18[3] = v11;
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
}

- (int64_t)displayType
{
  return self->_displayType;
}

- (BOOL)isDisplayConnected
{
  return self->_displayConnected;
}

@end
