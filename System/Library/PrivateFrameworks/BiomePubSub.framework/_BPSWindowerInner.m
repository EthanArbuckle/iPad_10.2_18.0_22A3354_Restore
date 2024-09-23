@implementation _BPSWindowerInner

- (_BPSWindowerInner)initWithDownstream:(id)a3 key:(id)a4 assigner:(id)a5
{
  id v9;
  id v10;
  id v11;
  _BPSWindowerInner *v12;
  _BPSWindowerInner *v13;
  void *v14;
  id key;
  BPSSubscriptionStatus *v16;
  BPSSubscriptionStatus *status;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *windows;
  uint64_t v21;
  NSMutableDictionary *windowsDemand;
  uint64_t v23;
  NSMutableDictionary *windowsBuffer;
  uint64_t v25;
  NSMutableDictionary *windowsStatus;
  uint64_t v27;
  NSMutableArray *buffer;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)_BPSWindowerInner;
  v12 = -[_BPSWindowerInner init](&v30, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_downstream, a3);
    v14 = _Block_copy(v10);
    key = v13->_key;
    v13->_key = v14;

    objc_storeStrong((id *)&v13->_assigner, a5);
    v16 = -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 0, 0);
    status = v13->_status;
    v13->_status = v16;

    v13->_demand = 0;
    v18 = (void *)MEMORY[0x1E0C9AA70];
    v19 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    windows = v13->_windows;
    v13->_windows = (NSMutableDictionary *)v19;

    v21 = objc_msgSend(v18, "mutableCopy");
    windowsDemand = v13->_windowsDemand;
    v13->_windowsDemand = (NSMutableDictionary *)v21;

    v23 = objc_msgSend(v18, "mutableCopy");
    windowsBuffer = v13->_windowsBuffer;
    v13->_windowsBuffer = (NSMutableDictionary *)v23;

    v25 = objc_msgSend(v18, "mutableCopy");
    windowsStatus = v13->_windowsStatus;
    v13->_windowsStatus = (NSMutableDictionary *)v25;

    v27 = objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    buffer = v13->_buffer;
    v13->_buffer = (NSMutableArray *)v27;

    v13->_recursion = 0;
    v13->_sideRecursion = 0;
  }

  return v13;
}

- (void)receiveCompletion:(id)a3
{
  id v4;
  _BPSWindowerInner *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  os_unfair_lock_s *p_lock;
  void *v32;
  NSMutableDictionary *obj;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  os_unfair_lock_lock(&v5->_lock);
  if (-[BPSSubscriptionStatus state](v5->_status, "state") == 1)
  {
    p_lock = &v5->_lock;
    v32 = v4;
    v6 = (void *)MEMORY[0x1E0C9AA60];
    v38 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v37 = (void *)objc_msgSend(v6, "mutableCopy");
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v5->_windowsStatus;
    v35 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v35)
    {
      v34 = *(_QWORD *)v44;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v44 != v34)
            objc_enumerationMutation(obj);
          v36 = v7;
          v8 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v7);
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          -[NSMutableDictionary objectForKeyedSubscript:](v5->_windowsStatus, "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v40 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
                -[NSMutableDictionary objectForKeyedSubscript:](v5->_windows, "objectForKeyedSubscript:", v8);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKeyedSubscript:", v14);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "addObject:", v16);

                -[NSMutableDictionary objectForKeyedSubscript:](v5->_windowsStatus, "objectForKeyedSubscript:", v8);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectForKeyedSubscript:", v14);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "addObject:", v18);

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v11);
          }

          v7 = v36 + 1;
        }
        while (v36 + 1 != v35);
        v35 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v35);
    }

    v4 = v32;
    if (objc_msgSend(v38, "count"))
    {
      v19 = 0;
      do
      {
        objc_msgSend(v37, "objectAtIndexedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "state");

        if (v21 == 1)
        {
          os_unfair_lock_unlock(p_lock);
          objc_msgSend(v38, "objectAtIndexedSubscript:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "receiveCompletion:", v32);

          os_unfair_lock_lock(p_lock);
          objc_msgSend(v37, "objectAtIndexedSubscript:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setState:", 2);

          objc_msgSend(v37, "objectAtIndexedSubscript:", v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setSubscription:", 0);

        }
        ++v19;
      }
      while (objc_msgSend(v38, "count") > v19);
    }
    -[BPSSubscriptionStatus setState:](v5->_status, "setState:", 2);
    -[BPSSubscriptionStatus setSubscription:](v5->_status, "setSubscription:", 0);
    -[NSMutableDictionary removeAllObjects](v5->_windows, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](v5->_windowsDemand, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](v5->_windowsBuffer, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](v5->_windowsStatus, "removeAllObjects");
    -[_BPSWindowerInner downstream](v5, "downstream");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v32, "state");
    if (v26 == 1)
    {
      objc_msgSend(v32, "error");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeAllObjects](v5->_buffer, "removeAllObjects");
      os_unfair_lock_unlock(p_lock);
      +[BPSCompletion failureWithError:](BPSCompletion, "failureWithError:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "receiveCompletion:", v30);

    }
    else
    {
      if (v26)
      {
LABEL_30:

        goto LABEL_31;
      }
      if (v5->_demand >= 1)
      {
        do
        {
          if (!-[NSMutableArray count](v5->_buffer, "count"))
            break;
          --v5->_demand;
          -[NSMutableArray objectAtIndexedSubscript:](v5->_buffer, "objectAtIndexedSubscript:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray removeObjectAtIndex:](v5->_buffer, "removeObjectAtIndex:", 0);
          os_unfair_lock_unlock(p_lock);
          v28 = objc_msgSend(v25, "receiveInput:", v27);
          os_unfair_lock_lock(p_lock);
          v5->_demand += v28;

        }
        while (v5->_demand > 0);
      }
      os_unfair_lock_unlock(p_lock);
      +[BPSCompletion success](BPSCompletion, "success");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "receiveCompletion:", v29);
    }

    goto LABEL_30;
  }
  os_unfair_lock_unlock(&v5->_lock);
LABEL_31:

}

- (int64_t)receiveInput:(id)a3
{
  id v4;
  _BPSWindowerInner *v5;
  void *v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BPSWindowAssigner *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _BPSWindowerSide *v26;
  id *v27;
  _BPSWindowerSide *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  os_unfair_lock_s *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  id *p_isa;
  void *v59;
  void *v60;
  BPSSubscriptionStatus *v61;
  void *v62;
  void *v63;
  BPSWindowAssigner *v65;
  id obj;
  void *v67;
  _BPSWindowerInner *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _BPSWindowerSide *v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  v71 = v4;
  (*((void (**)(void))v5->_key + 2))();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", 0);

  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  if (-[BPSSubscriptionStatus state](v5->_status, "state") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v5->_windows, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = 0x1EEAEF000uLL;
    v11 = 0x1EEAEF000uLL;
    if (v9)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v5->_windows, "objectForKeyedSubscript:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "allValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C9AA70];
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_windows, "setObject:forKeyedSubscript:", v15, v7);

      v16 = (void *)objc_msgSend(v14, "mutableCopy");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_windowsDemand, "setObject:forKeyedSubscript:", v16, v7);

      v17 = (void *)objc_msgSend(v14, "mutableCopy");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_windowsBuffer, "setObject:forKeyedSubscript:", v17, v7);

      v12 = (void *)objc_msgSend(v14, "mutableCopy");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5->_windowsStatus, "setObject:forKeyedSubscript:", v12, v7);
      v13 = (void *)MEMORY[0x1E0C9AA60];
    }

    v18 = v5->_assigner;
    os_unfair_lock_unlock(&v5->_lock);
    v65 = v18;
    -[BPSWindowAssigner assignWindow:input:](v18, "assignWindow:input:", v13, v71);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&v5->_lock);
    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v19;
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
    if (v72)
    {
      v68 = v5;
      v69 = *(_QWORD *)v78;
      v67 = v7;
      v70 = v13;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v78 != v69)
            objc_enumerationMutation(obj);
          v73 = v20;
          v21 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v20);
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "containsObject:", v21))
          {
            v23 = *(int *)(v11 + 2780);
            objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + v23), "objectForKeyedSubscript:", v7);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v71);

            v74 = *(int *)(v10 + 2776);
            objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + v74), "objectForKeyedSubscript:", v7);
            v26 = (_BPSWindowerSide *)objc_claimAutoreleasedReturnValue();
            -[_BPSWindowerSide objectForKeyedSubscript:](v26, "objectForKeyedSubscript:", v22);
            v27 = (id *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v27, "integerValue") < 1)
            {
              v63 = v22;
            }
            else
            {
              objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + v23), "objectForKeyedSubscript:", v7);
              v28 = v26;
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKeyedSubscript:", v22);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = v23;
              v31 = objc_msgSend(v30, "count");

              if (!v31)
                goto LABEL_21;
              while (1)
              {
                v32 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + v74), "objectForKeyedSubscript:", v7);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "objectForKeyedSubscript:", v22);
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "numberWithInteger:", objc_msgSend(v34, "integerValue") - 1);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + v74), "objectForKeyedSubscript:", v7);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "setObject:forKeyedSubscript:", v35, v22);

                objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + v76), "objectForKeyedSubscript:", v7);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "objectForKeyedSubscript:", v22);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
                v39 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + v76), "objectForKeyedSubscript:", v7);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "objectForKeyedSubscript:", v22);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "removeObjectAtIndex:", 0);

                -[NSMutableDictionary objectForKeyedSubscript:](v5->_windows, "objectForKeyedSubscript:", v7);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "objectForKeyedSubscript:", v22);
                v27 = (id *)objc_claimAutoreleasedReturnValue();

                os_unfair_lock_unlock(p_lock);
                v75 = (_BPSWindowerSide *)v39;
                v43 = objc_msgSend(v27, "receiveInput:", v39);
                v44 = p_lock;
                os_unfair_lock_lock(p_lock);
                v45 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + v74), "objectForKeyedSubscript:", v7);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "objectForKeyedSubscript:", v22);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "numberWithInteger:", objc_msgSend(v47, "integerValue") + v43);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + v74), "objectForKeyedSubscript:", v7);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "setObject:forKeyedSubscript:", v48, v22);

                objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + v74), "objectForKeyedSubscript:", v7);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "objectForKeyedSubscript:", v22);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v51, "integerValue") < 1)
                  break;
                objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + v76), "objectForKeyedSubscript:", v7);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "objectForKeyedSubscript:", v22);
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = objc_msgSend(v53, "count");

                p_lock = v44;
                if (!v54)
                  goto LABEL_21;
              }
              v63 = v22;

              p_lock = v44;
              v26 = v75;
            }
          }
          else
          {
            -[NSMutableDictionary objectForKeyedSubscript:](v5->_windows, "objectForKeyedSubscript:", v7);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "setObject:forKeyedSubscript:", v21, v22);

            objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + *(int *)(v10 + 2776)), "objectForKeyedSubscript:", v7);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setObject:forKeyedSubscript:", &unk_1E5565738, v22);

            v81 = v71;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            p_isa = (id *)&v5->super.super.super.isa;
            v59 = (void *)objc_msgSend(v57, "mutableCopy");
            objc_msgSend(*(id *)((char *)p_isa + *(int *)(v11 + 2780)), "objectForKeyedSubscript:", v7);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "setObject:forKeyedSubscript:", v59, v22);

            v61 = -[BPSSubscriptionStatus initWithState:subscription:]([BPSSubscriptionStatus alloc], "initWithState:subscription:", 0, v21);
            objc_msgSend(p_isa[7], "objectForKeyedSubscript:", v7);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "setObject:forKeyedSubscript:", v61, v22);

            v27 = p_isa;
            os_unfair_lock_unlock(p_lock);
            v63 = v22;
            v26 = -[_BPSWindowerSide initWithKey:identifier:windowerInner:]([_BPSWindowerSide alloc], "initWithKey:identifier:windowerInner:", v7, v22, v27);
            objc_msgSend(v21, "setDownstream:", v26);
            objc_msgSend(v21, "receiveSubscription:", v26);
            os_unfair_lock_lock(p_lock);
          }

          v7 = v67;
          v5 = v68;
          v22 = v63;
LABEL_21:

          v20 = v73 + 1;
          v10 = 0x1EEAEF000;
          v11 = 0x1EEAEF000;
          v13 = v70;
        }
        while (v73 + 1 != v72);
        v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
      }
      while (v72);
    }

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(&v5->_lock);
  }

  return 0;
}

- (void)receiveSubscription:(id)a3
{
  os_unfair_lock_s *p_lock;
  BPSSubscriber *downstream;
  _BPSWindowerInner *v6;
  BPSSubscriber *v7;
  id v8;

  p_lock = &self->_lock;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  if (-[BPSSubscriptionStatus state](self->_status, "state"))
  {
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v8, "cancel");
  }
  else
  {
    -[BPSSubscriptionStatus setState:](self->_status, "setState:", 1);
    -[BPSSubscriptionStatus setSubscription:](self->_status, "setSubscription:", v8);
    downstream = self->_downstream;
    v6 = self;
    v7 = downstream;
    os_unfair_lock_unlock(p_lock);
    -[BPSSubscriber receiveSubscription:](v7, "receiveSubscription:", v6);

    objc_msgSend(v8, "requestDemand:", 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (void)cancel
{
  _BPSWindowerInner *v2;
  os_unfair_lock_s *p_lock;
  void *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = self;
  p_lock = &v2->_lock;
  os_unfair_lock_lock(&v2->_lock);
  if (-[BPSSubscriptionStatus state](v2->_status, "state") == 1)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v5 = v2->_windowsStatus;
    v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          -[NSMutableDictionary objectForKeyedSubscript:](v2->_windowsStatus, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "allValues");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v11);

        }
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v7);
    }

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = v4;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
          if (objc_msgSend(v17, "state") == 1)
          {
            os_unfair_lock_unlock(p_lock);
            objc_msgSend(v17, "subscription");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "cancel");

            os_unfair_lock_lock(p_lock);
            objc_msgSend(v17, "setState:", 2);
            objc_msgSend(v17, "setSubscription:", 0);
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v14);
    }

    -[BPSSubscriptionStatus setState:](v2->_status, "setState:", 2);
    -[NSMutableDictionary removeAllObjects](v2->_windows, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](v2->_windowsDemand, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](v2->_windowsBuffer, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](v2->_windowsStatus, "removeAllObjects");
    -[BPSSubscriptionStatus subscription](v2->_status, "subscription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSSubscriptionStatus setSubscription:](v2->_status, "setSubscription:", 0);
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(v19, "cancel");

  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }

}

- (void)requestDemand:(int64_t)a3
{
  _BPSWindowerInner *v5;
  os_unfair_lock_s *p_lock;
  uint64_t v7;
  _BPSWindowerInner *v8;
  uint64_t v9;
  int64_t demand;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _BPSWindowerInner *v16;

  v5 = self;
  v16 = v5;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("BPSWindower.m"), 308, CFSTR("Expecting demand to be greater than 0"));

    v5 = v16;
  }
  p_lock = &v5->_lock;
  os_unfair_lock_lock(&v5->_lock);
  v7 = -[BPSSubscriptionStatus state](v16->_status, "state");
  v8 = v16;
  if (v7 == 1 && !v16->_recursion)
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      demand = v16->_demand;
      if (demand != 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = demand + a3;
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          v9 = v11;
      }
    }
    v16->_demand = v9;
    if (v9 >= 1)
    {
      do
      {
        if (!-[NSMutableArray count](v8->_buffer, "count"))
          break;
        --v16->_demand;
        -[NSMutableArray objectAtIndexedSubscript:](v16->_buffer, "objectAtIndexedSubscript:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray removeObjectAtIndex:](v16->_buffer, "removeObjectAtIndex:", 0);
        -[_BPSWindowerInner downstream](v16, "downstream");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16->_recursion = 1;
        os_unfair_lock_unlock(p_lock);
        v14 = objc_msgSend(v13, "receiveInput:", v12);
        os_unfair_lock_lock(p_lock);
        v16->_recursion = 0;
        v16->_demand += v14;

        v8 = v16;
      }
      while (v16->_demand > 0);
    }
  }
  os_unfair_lock_unlock(p_lock);

}

- (void)receiveCompletion:(id)a3 key:(id)a4 identifier:(id)a5
{
  id v7;
  _BPSWindowerInner *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a4;
  v7 = a5;
  v8 = self;
  os_unfair_lock_lock(&v8->_lock);
  if (-[BPSSubscriptionStatus state](v8->_status, "state") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v8->_windowsStatus, "objectForKeyedSubscript:", v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
LABEL_5:

      goto LABEL_6;
    }
    v11 = (void *)v10;
    -[NSMutableDictionary objectForKeyedSubscript:](v8->_windowsStatus, "objectForKeyedSubscript:", v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "state");

    if (v14 == 1)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v8->_windowsStatus, "objectForKeyedSubscript:", v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setState:", 2);

      -[NSMutableDictionary objectForKeyedSubscript:](v8->_windowsStatus, "objectForKeyedSubscript:", v22);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSubscription:", 0);

      -[NSMutableDictionary objectForKeyedSubscript:](v8->_windows, "objectForKeyedSubscript:", v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "removeObjectForKey:", v7);

      -[NSMutableDictionary objectForKeyedSubscript:](v8->_windowsDemand, "objectForKeyedSubscript:", v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeObjectForKey:", v7);

      -[NSMutableDictionary objectForKeyedSubscript:](v8->_windowsBuffer, "objectForKeyedSubscript:", v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObjectForKey:", v7);

      -[NSMutableDictionary objectForKeyedSubscript:](v8->_windowsStatus, "objectForKeyedSubscript:", v22);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", v7);
      goto LABEL_5;
    }
  }
LABEL_6:
  os_unfair_lock_unlock(&v8->_lock);

}

- (int64_t)receiveInput:(id)a3 key:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BPSWindowerInner *v11;
  os_unfair_lock_s *p_lock;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  NSMutableArray *buffer;
  BPSWindowerInput *v21;
  void *v22;
  void *v23;
  void *v24;
  BPSWindowerInput *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  p_lock = &v11->_lock;
  os_unfair_lock_lock(&v11->_lock);
  if (-[BPSSubscriptionStatus state](v11->_status, "state") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v11->_windowsStatus, "objectForKeyedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      -[NSMutableDictionary objectForKeyedSubscript:](v11->_windowsStatus, "objectForKeyedSubscript:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v8;
      v18 = objc_msgSend(v17, "state");

      v19 = v18 == 1;
      v8 = v30;
      if (v19)
      {
        buffer = v11->_buffer;
        v21 = [BPSWindowerInput alloc];
        -[NSMutableDictionary objectForKeyedSubscript:](v11->_windows, "objectForKeyedSubscript:", v9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "metadata");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[BPSWindowerInput initWithAggregate:key:metadata:](v21, "initWithAggregate:key:metadata:", v30, v9, v24);
        -[NSMutableArray addObject:](buffer, "addObject:", v25);

        v8 = v30;
        if (v11->_demand >= 1)
        {
          do
          {
            if (!-[NSMutableArray count](v11->_buffer, "count"))
              break;
            --v11->_demand;
            -[NSMutableArray objectAtIndexedSubscript:](v11->_buffer, "objectAtIndexedSubscript:", 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray removeObjectAtIndex:](v11->_buffer, "removeObjectAtIndex:", 0);
            -[_BPSWindowerInner downstream](v11, "downstream");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            os_unfair_lock_unlock(p_lock);
            v28 = objc_msgSend(v27, "receiveInput:", v26);
            os_unfair_lock_lock(p_lock);
            v11->_demand += v28;

          }
          while (v11->_demand > 0);
        }
      }
    }
    else
    {

    }
  }
  os_unfair_lock_unlock(p_lock);

  return 0;
}

- (void)receiveSubscription:(id)a3 key:(id)a4 identifier:(id)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a4;
  v9 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[BPSSubscriptionStatus state](self->_status, "state") != 1)
    goto LABEL_6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_windowsStatus, "objectForKeyedSubscript:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v9);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {

    goto LABEL_6;
  }
  v13 = (void *)v12;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_windowsStatus, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "state");

  if (v16)
  {
LABEL_6:
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v21, "cancel");
    goto LABEL_7;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_windowsStatus, "objectForKeyedSubscript:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setState:", 1);

  -[NSMutableDictionary objectForKeyedSubscript:](self->_windowsStatus, "objectForKeyedSubscript:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSubscription:", v21);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v21, "requestDemand:", 0x7FFFFFFFFFFFFFFFLL);
LABEL_7:

}

- (void)cancelWithKey:(id)a3 identifier:(id)a4
{
  id v6;
  _BPSWindowerInner *v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  v7 = self;
  p_lock = &v7->_lock;
  os_unfair_lock_lock(&v7->_lock);
  if (-[BPSSubscriptionStatus state](v7->_status, "state") != 1)
    goto LABEL_6;
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_windowsStatus, "objectForKeyedSubscript:", v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    goto LABEL_6;
  }
  v11 = (void *)v10;
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_windowsStatus, "objectForKeyedSubscript:", v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "state");

  if (v14 != 1)
  {
LABEL_6:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_7;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](v7->_windowsStatus, "objectForKeyedSubscript:", v26);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "subscription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](v7->_windowsStatus, "objectForKeyedSubscript:", v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setState:", 2);

  -[NSMutableDictionary objectForKeyedSubscript:](v7->_windows, "objectForKeyedSubscript:", v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObjectForKey:", v6);

  -[NSMutableDictionary objectForKeyedSubscript:](v7->_windowsDemand, "objectForKeyedSubscript:", v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "removeObjectForKey:", v6);

  -[NSMutableDictionary objectForKeyedSubscript:](v7->_windowsBuffer, "objectForKeyedSubscript:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeObjectForKey:", v6);

  -[NSMutableDictionary objectForKeyedSubscript:](v7->_windowsStatus, "objectForKeyedSubscript:", v26);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeObjectForKey:", v6);

  -[NSMutableDictionary objectForKeyedSubscript:](v7->_windowsStatus, "objectForKeyedSubscript:", v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSubscription:", 0);

  os_unfair_lock_unlock(p_lock);
  objc_msgSend(v17, "cancel");

LABEL_7:
}

- (void)requestDemand:(int64_t)a3 key:(id)a4 identifier:(id)a5
{
  id v9;
  _BPSWindowerInner *v10;
  os_unfair_lock_s *p_lock;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  os_unfair_lock_s *v56;
  id v57;

  v57 = a4;
  v9 = a5;
  v10 = self;
  if (a3 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("BPSWindower.m"), 444, CFSTR("Expecting demand to be greater than 0"));

  }
  p_lock = &v10->_lock;
  os_unfair_lock_lock(&v10->_lock);
  if (-[BPSSubscriptionStatus state](v10->_status, "state") == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v10->_windowsStatus, "objectForKeyedSubscript:", v57);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
LABEL_22:

      goto LABEL_23;
    }
    v14 = (void *)v13;
    -[NSMutableDictionary objectForKeyedSubscript:](v10->_windowsStatus, "objectForKeyedSubscript:", v57);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "state");

    if (v17 == 1 && !v10->_sideRecursion)
    {
      if (a3 == 0x7FFFFFFFFFFFFFFFLL
        || (-[NSMutableDictionary objectForKeyedSubscript:](v10->_windowsDemand, "objectForKeyedSubscript:", v57),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v18, "objectForKeyedSubscript:", v9),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v20 = objc_msgSend(v19, "integerValue"),
            v19,
            v18,
            v20 == 0x7FFFFFFFFFFFFFFFLL))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0x7FFFFFFFFFFFFFFFLL);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = (void *)MEMORY[0x1E0CB37E8];
        -[NSMutableDictionary objectForKeyedSubscript:](v10->_windowsDemand, "objectForKeyedSubscript:", v57);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v9);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "integerValue") + a3;

        if (v25 == 0x7FFFFFFFFFFFFFFFLL)
          v26 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v26 = v25;
        objc_msgSend(v22, "numberWithInteger:", v26);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[NSMutableDictionary objectForKeyedSubscript:](v10->_windowsDemand, "objectForKeyedSubscript:", v57);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v21, v9);

      -[NSMutableDictionary objectForKeyedSubscript:](v10->_windowsDemand, "objectForKeyedSubscript:", v57);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v9);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "integerValue") < 1)
      {
LABEL_21:

        goto LABEL_22;
      }
      v29 = 48;
      -[NSMutableDictionary objectForKeyedSubscript:](v10->_windowsBuffer, "objectForKeyedSubscript:", v57);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectForKeyedSubscript:", v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");

      if (v32)
      {
        v56 = &v10->_lock;
        while (1)
        {
          v33 = (void *)MEMORY[0x1E0CB37E8];
          -[NSMutableDictionary objectForKeyedSubscript:](v10->_windowsDemand, "objectForKeyedSubscript:", v57, v56);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v9);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "numberWithInteger:", objc_msgSend(v35, "integerValue") - 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v10->_windowsDemand, "objectForKeyedSubscript:", v57);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, v9);

          objc_msgSend(*(id *)((char *)&v10->super.super.super.isa + v29), "objectForKeyedSubscript:", v57);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKeyedSubscript:", v9);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)((char *)&v10->super.super.super.isa + v29), "objectForKeyedSubscript:", v57);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "objectForKeyedSubscript:", v9);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "removeObjectAtIndex:", 0);

          -[NSMutableDictionary objectForKeyedSubscript:](v10->_windows, "objectForKeyedSubscript:", v57);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectForKeyedSubscript:", v9);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v10->_sideRecursion = 1;
          os_unfair_lock_unlock(p_lock);
          v43 = objc_msgSend(v28, "receiveInput:", v12);
          os_unfair_lock_lock(p_lock);
          v10->_sideRecursion = 0;
          v44 = (void *)MEMORY[0x1E0CB37E8];
          -[NSMutableDictionary objectForKeyedSubscript:](v10->_windowsDemand, "objectForKeyedSubscript:", v57);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "objectForKeyedSubscript:", v9);
          v46 = v29;
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "numberWithInteger:", objc_msgSend(v47, "integerValue") + v43);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v10->_windowsDemand, "objectForKeyedSubscript:", v57);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setObject:forKeyedSubscript:", v48, v9);

          -[NSMutableDictionary objectForKeyedSubscript:](v10->_windowsDemand, "objectForKeyedSubscript:", v57);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectForKeyedSubscript:", v9);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v51, "integerValue") < 1)
            break;
          objc_msgSend(*(id *)((char *)&v10->super.super.super.isa + v46), "objectForKeyedSubscript:", v57);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "objectForKeyedSubscript:", v9);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "count");

          v29 = v46;
          p_lock = v56;
          if (!v54)
            goto LABEL_23;
        }

        p_lock = v56;
        goto LABEL_21;
      }
    }
  }
LABEL_23:
  os_unfair_lock_unlock(p_lock);

}

- (id)upstreamSubscriptions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  -[NSMutableDictionary allKeys](self->_windowsStatus, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_windowsStatus, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

- (BPSSubscriber)downstream
{
  return self->_downstream;
}

- (id)key
{
  return self->_key;
}

- (BPSWindowAssigner)assigner
{
  return self->_assigner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assigner, 0);
  objc_storeStrong(&self->_key, 0);
  objc_storeStrong((id *)&self->_downstream, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_windowsStatus, 0);
  objc_storeStrong((id *)&self->_windowsBuffer, 0);
  objc_storeStrong((id *)&self->_windowsDemand, 0);
  objc_storeStrong((id *)&self->_windows, 0);
  objc_storeStrong((id *)&self->_status, 0);
}

@end
