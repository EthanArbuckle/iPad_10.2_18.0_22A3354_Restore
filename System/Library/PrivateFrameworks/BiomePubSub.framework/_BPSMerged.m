@implementation _BPSMerged

- (_BPSMerged)initWithDownstream:(id)a3 count:(int64_t)a4
{
  id v7;
  _BPSMerged *v8;
  _BPSMerged *v9;
  uint64_t v10;
  NSMutableArray *subscriptions;
  uint64_t v12;
  NSMutableArray *upstreamBookmarks;
  uint64_t v14;
  NSMutableArray *buffers;
  NSMutableArray *v16;
  void *v17;
  NSMutableArray *v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  objc_super v23;

  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_BPSMerged;
  v8 = -[_BPSMerged init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_downstream, a3);
    v9->_count = a4;
    v9->_terminated = 0;
    v9->_upstreamFinished = 0;
    v9->_finished = 0;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    subscriptions = v9->_subscriptions;
    v9->_subscriptions = (NSMutableArray *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    upstreamBookmarks = v9->_upstreamBookmarks;
    v9->_upstreamBookmarks = (NSMutableArray *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
    buffers = v9->_buffers;
    v9->_buffers = (NSMutableArray *)v14;

    v9->_recursive = 0;
    v9->_demand = 0;
    v9->_pending = 0;
    v9->_lock._os_unfair_lock_opaque = 0;
    v9->_downstreamLock = 0;
    if (a4 >= 1)
    {
      do
      {
        v16 = v9->_subscriptions;
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v16, "addObject:", v17);

        v18 = v9->_upstreamBookmarks;
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v18, "addObject:", v19);

        v20 = v9->_buffers;
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v20, "addObject:", v21);

        --a4;
      }
      while (a4);
    }
  }

  return v9;
}

- (id)applyDownstreamWhileLocked:(BOOL)a3 apply:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;

  v6 = (void (**)(id, void *))a4;
  if (!a3)
    os_unfair_lock_lock(&self->_lock);
  -[_BPSMerged setRecursive:](self, "setRecursive:", 1);
  os_unfair_lock_unlock(&self->_lock);
  os_unfair_recursive_lock_lock_with_options();
  -[_BPSMerged downstream](self, "downstream");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_recursive_lock_unlock();
  os_unfair_lock_lock(&self->_lock);
  -[_BPSMerged setRecursive:](self, "setRecursive:", 0);
  if (!a3)
    os_unfair_lock_unlock(&self->_lock);

  return v8;
}

- (void)receiveCompletion:(id)a3 atIndex:(int64_t)a4
{
  id v6;
  _BPSMerged *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  os_unfair_lock_s *p_lock;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  _BYTE v80[128];
  uint8_t v81[128];
  uint8_t buf[4];
  id v83;
  __int16 v84;
  int64_t v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = self;
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v83 = (id)objc_opt_class();
    v84 = 2048;
    v85 = a4;
    v9 = v83;
    _os_log_impl(&dword_1A956A000, v8, OS_LOG_TYPE_INFO, "%@ - completion at index %ld", buf, 0x16u);

  }
  v10 = objc_msgSend(v6, "state");
  if (!v10)
  {
    p_lock = &v7->_lock;
    os_unfair_lock_lock(&v7->_lock);
    -[_BPSMerged setUpstreamFinished:](v7, "setUpstreamFinished:", -[_BPSMerged upstreamFinished](v7, "upstreamFinished") + 1);
    -[_BPSMerged updateBookmarksWhenLockedForIndex:](v7, "updateBookmarksWhenLockedForIndex:", a4);
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BPSMerged subscriptions](v7, "subscriptions");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:atIndexedSubscript:", v35, a4);

    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    -[_BPSMerged buffers](v7, "buffers");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v70;
      while (2)
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v70 != v39)
            objc_enumerationMutation(v37);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            LOBYTE(v38) = 1;
            goto LABEL_32;
          }
        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v69, v80, 16);
        if (v38)
          continue;
        break;
      }
    }
LABEL_32:

    v41 = -[_BPSMerged upstreamFinished](v7, "upstreamFinished");
    v42 = -[_BPSMerged count](v7, "count");
    if ((v38 & 1) == 0 && v41 == v42)
    {
      -[_BPSMerged setFinished:](v7, "setFinished:", 1);
      -[_BPSMerged subscriptions](v7, "subscriptions");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend(v43, "copy");

      -[_BPSMerged subscriptions](v7, "subscriptions");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "count");

      if (v46)
      {
        v47 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[_BPSMerged subscriptions](v7, "subscriptions");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setObject:atIndexedSubscript:", v48, v47);

          ++v47;
          -[_BPSMerged subscriptions](v7, "subscriptions");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = objc_msgSend(v50, "count");

        }
        while (v47 < v51);
      }
      -[_BPSMerged buffers](v7, "buffers");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "count");

      if (v53)
      {
        v54 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[_BPSMerged buffers](v7, "buffers");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:atIndexedSubscript:", v55, v54);

          ++v54;
          -[_BPSMerged buffers](v7, "buffers");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(v57, "count");

        }
        while (v54 < v58);
      }
      os_unfair_lock_unlock(&v7->_lock);
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v28 = v44;
      v59 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
      if (v59)
      {
        v60 = v59;
        v61 = *(_QWORD *)v66;
        do
        {
          for (j = 0; j != v60; ++j)
          {
            if (*(_QWORD *)v66 != v61)
              objc_enumerationMutation(v28);
            v63 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              objc_msgSend(v63, "cancel", (_QWORD)v65);
          }
          v60 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
        }
        while (v60);
      }

      v64 = -[_BPSMerged applyDownstreamWhileLocked:apply:](v7, "applyDownstreamWhileLocked:apply:", 0, &__block_literal_global_0);
      goto LABEL_50;
    }
LABEL_51:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_52;
  }
  if (v10 == 1)
  {
    p_lock = &v7->_lock;
    os_unfair_lock_lock(&v7->_lock);
    if (!-[_BPSMerged terminated](v7, "terminated"))
    {
      -[_BPSMerged setTerminated:](v7, "setTerminated:", 1);
      -[_BPSMerged subscriptions](v7, "subscriptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "copy");

      -[_BPSMerged subscriptions](v7, "subscriptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        v16 = 0;
        do
        {
          -[_BPSMerged updateBookmarksWhenLockedForIndex:](v7, "updateBookmarksWhenLockedForIndex:", v16);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[_BPSMerged subscriptions](v7, "subscriptions");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:atIndexedSubscript:", v17, v16);

          ++v16;
          -[_BPSMerged subscriptions](v7, "subscriptions");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

        }
        while (v16 < v20);
      }
      -[_BPSMerged buffers](v7, "buffers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

      if (v22)
      {
        v23 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[_BPSMerged buffers](v7, "buffers");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:atIndexedSubscript:", v24, v23);

          ++v23;
          -[_BPSMerged buffers](v7, "buffers");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "count");

        }
        while (v23 < v27);
      }
      os_unfair_lock_unlock(&v7->_lock);
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v28 = v13;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v76;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v76 != v31)
              objc_enumerationMutation(v28);
            v33 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              objc_msgSend(v33, "cancel");
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
        }
        while (v30);
      }

      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __40___BPSMerged_receiveCompletion_atIndex___block_invoke;
      v73[3] = &unk_1E554CD10;
      v74 = v6;
      v34 = -[_BPSMerged applyDownstreamWhileLocked:apply:](v7, "applyDownstreamWhileLocked:apply:", 0, v73);

LABEL_50:
      goto LABEL_52;
    }
    goto LABEL_51;
  }
LABEL_52:

}

- (int64_t)receiveInput:(id)a3 atIndex:(int64_t)a4
{
  id v7;
  _BPSMerged *v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v7 = a3;
  v8 = self;
  p_lock = &v8->_lock;
  os_unfair_lock_lock(&v8->_lock);
  if (-[_BPSMerged demand](v8, "demand") == 0x7FFFFFFFFFFFFFFFLL)
  {
    os_unfair_lock_unlock(p_lock);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __35___BPSMerged_receiveInput_atIndex___block_invoke;
    v27[3] = &unk_1E554CD10;
    v28 = v7;
    -[_BPSMerged applyDownstreamWhileLocked:apply:](v8, "applyDownstreamWhileLocked:apply:", 0, v27);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    v12 = v28;
LABEL_5:

    goto LABEL_6;
  }
  if (-[_BPSMerged demand](v8, "demand") >= 1)
  {
    -[_BPSMerged setDemand:](v8, "setDemand:", -[_BPSMerged demand](v8, "demand") - 1);
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __35___BPSMerged_receiveInput_atIndex___block_invoke_2;
    v25 = &unk_1E554CD10;
    v26 = v7;
    v11 = 1;
    -[_BPSMerged applyDownstreamWhileLocked:apply:](v8, "applyDownstreamWhileLocked:apply:", 1, &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue", v22, v23, v24, v25);

    -[_BPSMerged setDemand:](v8, "setDemand:", -[_BPSMerged pending](v8, "pending") + -[_BPSMerged demand](v8, "demand") + v14);
    -[_BPSMerged setPending:](v8, "setPending:", 0);
    os_unfair_lock_unlock(p_lock);
    v12 = v26;
    goto LABEL_5;
  }
  -[_BPSMerged buffers](v8, "buffers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqual:", v18);

  if ((v19 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("BPSMerge.m"), 181, CFSTR("Expecting buffer to be null"));

  }
  -[_BPSMerged buffers](v8, "buffers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:atIndexedSubscript:", v7, a4);

  os_unfair_lock_unlock(p_lock);
  v11 = 0;
LABEL_6:

  return v11;
}

- (void)receiveSubscription:(id)a3 atIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[_BPSMerged subscriptions](self, "subscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_8;
  }
  -[_BPSMerged subscriptions](self, "subscriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:atIndexedSubscript:", v13, a4);

  v11 = -[_BPSMerged demand](self, "demand");
  os_unfair_lock_unlock(&self->_lock);
  if (-[_BPSMerged terminated](self, "terminated"))
  {
LABEL_8:
    objc_msgSend(v13, "cancel");
    goto LABEL_9;
  }
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v12 = 1;
  objc_msgSend(v13, "requestDemand:", v12);
LABEL_9:

}

- (void)requestDemand:(int64_t)a3
{
  _BPSMerged *v4;
  os_unfair_lock_s *p_lock;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  _BPSMerged *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  int v44;
  os_unfair_lock_s *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  char v52;
  uint64_t v53;
  int v54;
  _BPSMerged *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  id v66;
  void *v67;
  uint64_t v68;
  BOOL v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t n;
  void *v75;
  void *v76;
  char v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  int v81;
  os_unfair_lock_t lock;
  id obj;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[5];
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _QWORD v101[5];
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v4 = self;
  p_lock = &v4->_lock;
  os_unfair_lock_lock(&v4->_lock);
  if (-[_BPSMerged terminated](v4, "terminated"))
    goto LABEL_7;
  v6 = -[_BPSMerged finished](v4, "finished");
  if (a3 < 1 || v6 || -[_BPSMerged demand](v4, "demand") == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_7;
  if (-[_BPSMerged recursive](v4, "recursive"))
  {
    -[_BPSMerged setPending:](v4, "setPending:", -[_BPSMerged pending](v4, "pending") + a3);
LABEL_7:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_8;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[_BPSMerged setDemand:](v4, "setDemand:", 0x7FFFFFFFFFFFFFFFLL);
    -[_BPSMerged buffers](v4, "buffers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BPSMerged buffers](v4, "buffers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_BPSMerged buffers](v4, "buffers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:atIndexedSubscript:", v11, v10);

        ++v10;
        -[_BPSMerged buffers](v4, "buffers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

      }
      while (v10 < v14);
    }
    v80 = -[_BPSMerged upstreamFinished](v4, "upstreamFinished");
    v78 = -[_BPSMerged count](v4, "count");
    v15 = v4;
    -[_BPSMerged subscriptions](v4, "subscriptions");
    lock = (os_unfair_lock_t)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    obj = v7;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v103;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v103 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "isEqual:", v21);

          if ((v22 & 1) == 0)
          {
            v101[0] = MEMORY[0x1E0C809B0];
            v101[1] = 3221225472;
            v101[2] = __28___BPSMerged_requestDemand___block_invoke;
            v101[3] = &unk_1E554CD58;
            v101[4] = v20;
            v23 = -[_BPSMerged applyDownstreamWhileLocked:apply:](v15, "applyDownstreamWhileLocked:apply:", 0, v101);
          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
      }
      while (v17);
    }

    if (v80 == v78)
    {
      v4 = v15;
      v24 = -[_BPSMerged applyDownstreamWhileLocked:apply:](v15, "applyDownstreamWhileLocked:apply:", 0, &__block_literal_global_9);
    }
    else
    {
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v45 = lock;
      v46 = -[os_unfair_lock_s countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
      v4 = v15;
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v98;
        do
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v98 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * j);
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v50, "isEqual:", v51);

            if ((v52 & 1) == 0)
              objc_msgSend(v50, "requestDemand:", 0x7FFFFFFFFFFFFFFFLL);
          }
          v47 = -[os_unfair_lock_s countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
        }
        while (v47);
      }

    }
  }
  else
  {
    -[_BPSMerged setDemand:](v4, "setDemand:", -[_BPSMerged demand](v4, "demand") + a3);
    v25 = (void *)MEMORY[0x1E0C9AA60];
    v26 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v27 = (void *)objc_msgSend(v25, "mutableCopy");
    -[_BPSMerged buffers](v4, "buffers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v29)
    {
      v30 = 0;
      do
      {
        if (!-[_BPSMerged demand](v4, "demand"))
          break;
        -[_BPSMerged buffers](v4, "buffers");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "isEqual:", v33);

        if ((v34 & 1) == 0)
        {
          -[_BPSMerged setDemand:](v4, "setDemand:", -[_BPSMerged demand](v4, "demand") - 1);
          objc_msgSend(v26, "addObject:", v32);
          -[_BPSMerged subscriptions](v4, "subscriptions");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectAtIndexedSubscript:", v30);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v36);

        }
        ++v30;
        -[_BPSMerged buffers](v4, "buffers");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "count");

      }
      while (v30 < v38);
    }
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    -[_BPSMerged buffers](v4, "buffers");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v93, v108, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v94;
      while (2)
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v94 != v42)
            objc_enumerationMutation(v39);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v44 = 0;
            goto LABEL_40;
          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v93, v108, 16);
        if (v41)
          continue;
        break;
      }
      v44 = 1;
LABEL_40:
      p_lock = &v4->_lock;
    }
    else
    {
      v44 = 1;
    }
    v79 = v27;

    v53 = -[_BPSMerged upstreamFinished](v4, "upstreamFinished");
    if (v53 == -[_BPSMerged count](v4, "count"))
      v54 = v44;
    else
      v54 = 0;
    v81 = v54;
    if (v54 == 1)
      -[_BPSMerged setFinished:](v4, "setFinished:", 1);
    v55 = v4;
    os_unfair_lock_unlock(p_lock);
    v56 = 0;
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v57 = v26;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v89, v107, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v90;
      v61 = MEMORY[0x1E0C809B0];
      v56 = 0;
      do
      {
        for (m = 0; m != v59; ++m)
        {
          if (*(_QWORD *)v90 != v60)
            objc_enumerationMutation(v57);
          v63 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * m);
          v88[0] = v61;
          v88[1] = 3221225472;
          v88[2] = __28___BPSMerged_requestDemand___block_invoke_3;
          v88[3] = &unk_1E554CD10;
          v88[4] = v63;
          -[_BPSMerged applyDownstreamWhileLocked:apply:](v55, "applyDownstreamWhileLocked:apply:", 0, v88);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v56 += objc_msgSend(v64, "integerValue");

        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v89, v107, 16);
      }
      while (v59);
    }

    os_unfair_lock_lock(p_lock);
    v65 = -[_BPSMerged pending](v55, "pending");
    -[_BPSMerged setPending:](v55, "setPending:", 0);
    os_unfair_lock_unlock(p_lock);
    if (v81)
    {
      v66 = -[_BPSMerged applyDownstreamWhileLocked:apply:](v55, "applyDownstreamWhileLocked:apply:", 0, &__block_literal_global_10);
      v4 = v55;
      v67 = v79;
    }
    else
    {
      v68 = v65 + v56;
      v69 = v65 + v56 < 1;
      v4 = v55;
      if (!v69)
      {
        os_unfair_lock_lock(p_lock);
        -[_BPSMerged setDemand:](v55, "setDemand:", -[_BPSMerged demand](v55, "demand") + v68);
        os_unfair_lock_unlock(p_lock);
      }
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v67 = v79;
      v70 = v79;
      v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v84, v106, 16);
      if (v71)
      {
        v72 = v71;
        v73 = *(_QWORD *)v85;
        do
        {
          for (n = 0; n != v72; ++n)
          {
            if (*(_QWORD *)v85 != v73)
              objc_enumerationMutation(v70);
            v75 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * n);
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = objc_msgSend(v75, "isEqual:", v76);

            if ((v77 & 1) == 0)
              objc_msgSend(v75, "requestDemand:", 1);
          }
          v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v84, v106, 16);
        }
        while (v72);
      }

    }
  }
LABEL_8:

}

- (void)cancel
{
  void *v3;
  id v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_4(v3);
  _os_log_debug_impl(&dword_1A956A000, a2, OS_LOG_TYPE_DEBUG, "%@ - cancel", v5, 0xCu);

  OUTLINED_FUNCTION_1();
}

- (id)upstreamSubscriptions
{
  void *v3;
  void *v4;
  NSObject *v5;

  -[_BPSMerged subscriptions](self, "subscriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_BPSMerged subscriptions](self, "subscriptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __biome_log_for_category();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_BPSMerged upstreamSubscriptions].cold.1((uint64_t)self, v5);

    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v4;
}

- (void)updateBookmarksWhenLockedForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  uint64_t v14;

  -[_BPSMerged subscriptions](self, "subscriptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EEAF3EE8))
    {
      v9 = v6;
      v10 = (void *)objc_msgSend(v9, "newBookmark");
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if ((v12 & 1) == 0)
          -[NSMutableArray setObject:atIndexedSubscript:](self->_upstreamBookmarks, "setObject:atIndexedSubscript:", v10, a3);
      }

    }
    else
    {
      __biome_log_for_category();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[_BPSMerged updateBookmarksWhenLockedForIndex:].cold.1((uint64_t)v6, v13, v14);

    }
  }

}

- (id)newBookmark
{
  BMBookmarkNode *v3;
  NSMutableArray *upstreamBookmarks;
  objc_class *v5;
  void *v6;
  BMBookmarkNode *v7;

  v3 = [BMBookmarkNode alloc];
  upstreamBookmarks = self->_upstreamBookmarks;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BMBookmarkNode initWithValue:upstreams:name:](v3, "initWithValue:upstreams:name:", 0, upstreamBookmarks, v6);

  return v7;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (void)setDownstream:(id)a3
{
  objc_storeStrong((id *)&self->_downstream, a3);
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (int64_t)demand
{
  return self->_demand;
}

- (void)setDemand:(int64_t)a3
{
  self->_demand = a3;
}

- (BOOL)terminated
{
  return self->_terminated;
}

- (void)setTerminated:(BOOL)a3
{
  self->_terminated = a3;
}

- (int64_t)upstreamFinished
{
  return self->_upstreamFinished;
}

- (void)setUpstreamFinished:(int64_t)a3
{
  self->_upstreamFinished = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSMutableArray)subscriptions
{
  return self->_subscriptions;
}

- (void)setSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptions, a3);
}

- (NSMutableArray)buffers
{
  return self->_buffers;
}

- (void)setBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_buffers, a3);
}

- (BOOL)recursive
{
  return self->_recursive;
}

- (void)setRecursive:(BOOL)a3
{
  self->_recursive = a3;
}

- (int64_t)pending
{
  return self->_pending;
}

- (void)setPending:(int64_t)a3
{
  self->_pending = a3;
}

- (NSMutableArray)upstreamBookmarks
{
  return self->_upstreamBookmarks;
}

- (void)setUpstreamBookmarks:(id)a3
{
  objc_storeStrong((id *)&self->_upstreamBookmarks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_upstreamBookmarks, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
}

- (void)upstreamSubscriptions
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_4(v3);
  OUTLINED_FUNCTION_0_1(&dword_1A956A000, a2, v5, "%@ - upstreamSubscriptions are nil", v6);

  OUTLINED_FUNCTION_1();
}

- (void)updateBookmarksWhenLockedForIndex:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1A956A000, a2, a3, "Subscription %@ could not create bookmark", (uint8_t *)&v3);
}

@end
