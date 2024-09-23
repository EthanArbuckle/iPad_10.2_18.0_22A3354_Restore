@implementation Remote_Driver_Host_Delegate

- (id)init_with_remote_plugin:(shared_ptr<HALS_UCRemotePlugIn>)a3
{
  HALS_UCRemotePlugIn *ptr;
  Remote_Driver_Host_Delegate *v4;
  Remote_Driver_Host_Delegate *v5;
  objc_super v7;

  ptr = a3.__ptr_;
  v7.receiver = self;
  v7.super_class = (Class)Remote_Driver_Host_Delegate;
  v4 = -[Remote_Driver_Host_Delegate init](&v7, sel_init, a3.__ptr_, a3.__cntrl_);
  v5 = v4;
  if (v4)
    std::shared_ptr<HALS_UCRemotePlugIn>::operator=[abi:ne180100](&v4->_remote_plugin.__ptr_, *(_QWORD *)ptr, *((_QWORD *)ptr + 1));
  return v5;
}

- (void)teardown
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v5;
  std::__shared_weak_count *v6;

  v5 = 0;
  v6 = 0;
  -[Remote_Driver_Host_Delegate setRemote_plugin:](self, "setRemote_plugin:", &v5);
  v2 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
}

- (void)object_properties_changed:(unsigned int)a3 data:(id)a4
{
  id v6;
  id v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  id v10;
  unsigned __int8 v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  unint64_t *v15;
  unint64_t v16;
  id v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  id v25[4];
  unsigned __int8 v26[8];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  dispatch_semaphore_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[Remote_Driver_Host_Delegate remote_plugin](self, "remote_plugin");
  if (v22)
  {
    v7 = *(id *)(v22 + 376);
    v27 = 0;
    v28 = 0;
    v25[0] = v7;
    memset(&v25[1], 0, 24);
    *(_WORD *)v26 = 0;
    v29 = 0;
    v30 = 850045863;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v36 = 850045863;
    v42 = 850045863;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v47 = dispatch_semaphore_create(0);
    if (v23)
    {
      p_shared_owners = (unint64_t *)&v23->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    v10 = v6;
    v11 = atomic_load(v26);
    if ((v11 & 1) != 0)
      atomic_store(1u, &v26[1]);
    v12 = v25[0];
    v13 = operator new();
    v14 = (void *)v13;
    *(_QWORD *)v13 = v22;
    *(_QWORD *)(v13 + 8) = v23;
    if (v23)
    {
      v15 = (unint64_t *)&v23->__shared_owners_;
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    *(_DWORD *)(v13 + 16) = a3;
    *(_QWORD *)(v13 + 24) = v10;
    v24 = 0;
    v17 = v10;
    dispatch_async_f(v12, v14, (dispatch_function_t)applesauce::dispatch::v1::async<-[Remote_Driver_Host_Delegate object_properties_changed:data:]::$_7 &>(NSObject  {objcproto17OS_dispatch_queue}*,-[Remote_Driver_Host_Delegate object_properties_changed:data:]::$_7 &)::{lambda(void *)#1}::__invoke);
    std::unique_ptr<-[Remote_Driver_Host_Delegate object_properties_changed:data:]::$_7>::~unique_ptr[abi:ne180100](&v24);

    if (v23)
    {
      v18 = (unint64_t *)&v23->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)())v23->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)v25);
  }
  if (v23)
  {
    v20 = (unint64_t *)&v23->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)())v23->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v23);
    }
  }

}

- (void)request_config_change:(unsigned int)a3 change_action:(unint64_t)a4 change_token:(unint64_t)a5
{
  id v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unsigned __int8 v11;
  NSObject *v12;
  _QWORD *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  uint64_t v22;
  id v23[4];
  unsigned __int8 v24[8];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  dispatch_semaphore_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[Remote_Driver_Host_Delegate remote_plugin](self, "remote_plugin");
  if (v20)
  {
    v8 = *(id *)(v20 + 376);
    v25 = 0;
    v26 = 0;
    v23[0] = v8;
    memset(&v23[1], 0, 24);
    *(_WORD *)v24 = 0;
    v27 = 0;
    v28 = 850045863;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v34 = 850045863;
    v40 = 850045863;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v45 = dispatch_semaphore_create(0);
    if (v21)
    {
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    v11 = atomic_load(v24);
    if ((v11 & 1) != 0)
      atomic_store(1u, &v24[1]);
    v12 = v23[0];
    v13 = (_QWORD *)operator new();
    *v13 = v20;
    v13[1] = v21;
    if (v21)
    {
      v14 = (unint64_t *)&v21->__shared_owners_;
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
    }
    *((_DWORD *)v13 + 4) = a3;
    v13[3] = a4;
    v13[4] = a5;
    v22 = 0;
    dispatch_async_f(v12, v13, (dispatch_function_t)applesauce::dispatch::v1::async<-[Remote_Driver_Host_Delegate request_config_change:change_action:change_token:]::$_8 &>(NSObject  {objcproto17OS_dispatch_queue}*,-[Remote_Driver_Host_Delegate request_config_change:change_action:change_token:]::$_8 &)::{lambda(void *)#1}::__invoke);
    std::unique_ptr<-[Remote_Driver_Host_Delegate request_config_change:change_action:change_token:]::$_8>::~unique_ptr[abi:ne180100](&v22);

    if (v21)
    {
      v16 = (unint64_t *)&v21->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)())v21->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)v23);
  }
  if (v21)
  {
    v18 = (unint64_t *)&v21->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)())v21->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v21);
    }
  }
}

- (int)write_storage_settings:(__CFString *)a3 storage_data:(void *)a4
{
  int v4;
  NSObject *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unsigned __int8 v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _QWORD v18[6];
  std::__shared_weak_count *v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  dispatch_queue_t queue[4];
  unsigned __int8 v29[8];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  dispatch_semaphore_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = 560947818;
  if (a4)
  {
    -[Remote_Driver_Host_Delegate remote_plugin](self, "remote_plugin");
    if (v26)
    {
      v7 = *(id *)(v26 + 376);
      v30 = 0;
      v31 = 0;
      queue[0] = v7;
      memset(&queue[1], 0, 24);
      *(_WORD *)v29 = 0;
      v32 = 0;
      v33 = 850045863;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v39 = 850045863;
      v45 = 850045863;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v50 = dispatch_semaphore_create(0);
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3321888768;
      v18[2] = __67__Remote_Driver_Host_Delegate_write_storage_settings_storage_data___block_invoke;
      v18[3] = &unk_1E696B810;
      v18[5] = v26;
      v19 = v27;
      if (v27)
      {
        p_shared_owners = (unint64_t *)&v27->__shared_owners_;
        do
          v9 = __ldxr(p_shared_owners);
        while (__stxr(v9 + 1, p_shared_owners));
      }
      v18[4] = &v22;
      v20 = a4;
      v21 = a3;
      v10 = atomic_load(v29);
      if ((v10 & 1) != 0)
        atomic_store(1u, &v29[1]);
      dispatch_sync(queue[0], v18);
      v4 = *((_DWORD *)v23 + 6);
      v11 = v19;
      if (v19)
      {
        v12 = (unint64_t *)&v19->__shared_owners_;
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      _Block_object_dispose(&v22, 8);
      AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)queue);
    }
    v14 = v27;
    if (v27)
    {
      v15 = (unint64_t *)&v27->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
  return v4;
}

- (pair<int,)copy_storage_settings:(__CFString *)a3
{
  NSObject *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[7];
  std::__shared_weak_count *v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  dispatch_queue_t queue[4];
  unsigned __int8 v32[8];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  dispatch_semaphore_t v53;
  uint64_t v54;
  pair<int, const void *> result;

  v54 = *MEMORY[0x1E0C80C00];
  -[Remote_Driver_Host_Delegate remote_plugin](self, "remote_plugin");
  if (v29)
  {
    v4 = *(id *)(v29 + 376);
    v33 = 0;
    v34 = 0;
    queue[0] = v4;
    memset(&queue[1], 0, 24);
    *(_WORD *)v32 = 0;
    v35 = 0;
    v36 = 850045863;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v42 = 850045863;
    v48 = 850045863;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v53 = dispatch_semaphore_create(0);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3321888768;
    v18[2] = __53__Remote_Driver_Host_Delegate_copy_storage_settings___block_invoke;
    v18[3] = &unk_1E696B848;
    v18[6] = v29;
    v19 = v30;
    if (v30)
    {
      p_shared_owners = (unint64_t *)&v30->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    v20 = a3;
    v18[4] = &v25;
    v18[5] = &v21;
    v7 = atomic_load(v32);
    if ((v7 & 1) != 0)
      atomic_store(1u, &v32[1]);
    dispatch_sync(queue[0], v18);
    v8 = *((unsigned int *)v26 + 6);
    v9 = (void *)v22[3];
    v10 = v19;
    if (v19)
    {
      v11 = (unint64_t *)&v19->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);
    AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)queue);
  }
  else
  {
    v9 = 0;
    v8 = 560947818;
  }
  v13 = v30;
  if (v30)
  {
    v14 = (unint64_t *)&v30->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v16 = v8;
  v17 = v9;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (int)delete_storage_settings:(__CFString *)a3
{
  NSObject *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unsigned __int8 v7;
  int v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD block[6];
  std::__shared_weak_count *v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  std::__shared_weak_count *v24;
  dispatch_queue_t queue[4];
  unsigned __int8 v26[8];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  dispatch_semaphore_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[Remote_Driver_Host_Delegate remote_plugin](self, "remote_plugin");
  if (v23)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v4 = *(id *)(v23 + 376);
    v27 = 0;
    v28 = 0;
    queue[0] = v4;
    memset(&queue[1], 0, 24);
    *(_WORD *)v26 = 0;
    v29 = 0;
    v30 = 850045863;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 850045863;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 850045863;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v47 = dispatch_semaphore_create(0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3321888768;
    block[2] = __55__Remote_Driver_Host_Delegate_delete_storage_settings___block_invoke;
    block[3] = &unk_1E696B880;
    block[5] = v23;
    v17 = v24;
    if (v24)
    {
      p_shared_owners = (unint64_t *)&v24->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    block[4] = &v19;
    v18 = a3;
    v7 = atomic_load(v26);
    if ((v7 & 1) != 0)
      atomic_store(1u, &v26[1]);
    dispatch_sync(queue[0], block);
    v8 = *((_DWORD *)v20 + 6);
    v9 = v17;
    if (v17)
    {
      v10 = (unint64_t *)&v17->__shared_owners_;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    AMCP::Utility::Dispatch_Queue::~Dispatch_Queue((AMCP::Utility::Dispatch_Queue *)queue);
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v8 = 560947818;
  }
  v12 = v24;
  if (v24)
  {
    v13 = (unint64_t *)&v24->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v8;
}

- (shared_ptr<HALS_UCRemotePlugIn>)remote_plugin
{
  HALS_UCRemotePlugIn **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<HALS_UCRemotePlugIn> result;

  cntrl = self->_remote_plugin.__cntrl_;
  *v2 = self->_remote_plugin.__ptr_;
  v2[1] = (HALS_UCRemotePlugIn *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (HALS_UCRemotePlugIn *)self;
  return result;
}

- (void)setRemote_plugin:(shared_ptr<HALS_UCRemotePlugIn>)a3
{
  std::shared_ptr<HALS_UCRemotePlugIn>::operator=[abi:ne180100](&self->_remote_plugin.__ptr_, *(_QWORD *)a3.__ptr_, *((_QWORD *)a3.__ptr_ + 1));
}

- (void).cxx_destruct
{
  std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100]((uint64_t)&self->_remote_plugin);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (uint64_t)request_config_change:(NSObject  *){objcproto17OS_dispatch_queue} change_action:(id)& change_token:
{
  _QWORD *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  _QWORD *v7;
  __n128 v8;
  unint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  __n128 *v13;
  NSObject *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  __n128 *v24;
  unint64_t v25;
  char *v26;
  __int128 v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  _opaque_pthread_t *v33;
  mach_port_t v34;
  int v35;
  __n128 v36;
  _DWORD *v37;
  uint8_t buf[8];
  _BYTE v39[10];
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v37 = a1;
  v2 = *(_QWORD **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 720);
  if (v3)
  {
    v4 = (std::__shared_weak_count *)operator new(0x20uLL);
    v5 = v4;
    v4->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    v4->__shared_weak_owners_ = 0;
    v4->__vftable = (std::__shared_weak_count_vtbl *)&off_1E696BB28;
    v4[1].__vftable = (std::__shared_weak_count_vtbl *)*((_QWORD *)a1 + 4);
    v7 = &v4[1].__vftable;
    v8.n128_u64[0] = (unint64_t)&v4[1];
    v8.n128_u64[1] = (unint64_t)v4;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
    v10 = (char *)v2[92];
    v11 = v2[93];
    if ((unint64_t)v10 >= v11)
    {
      v18 = (char *)v2[91];
      v19 = (v10 - v18) >> 4;
      v20 = v19 + 1;
      if ((unint64_t)(v19 + 1) >> 60)
        std::vector<std::tuple<std::pair<std::string,std::string>,std::shared_ptr<AMCP::Log::Scope>>>::__throw_length_error[abi:ne180100]();
      v36 = v8;
      v21 = v11 - (_QWORD)v18;
      if (v21 >> 3 > v20)
        v20 = v21 >> 3;
      if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0)
        v22 = 0xFFFFFFFFFFFFFFFLL;
      else
        v22 = v20;
      if (v22 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v23 = (char *)operator new(16 * v22);
      v24 = (__n128 *)&v23[16 * v19];
      *v24 = v36;
      do
        v25 = __ldxr(p_shared_owners);
      while (__stxr(v25 + 1, p_shared_owners));
      if (v10 == v18)
      {
        v8 = (__n128)vdupq_n_s64((unint64_t)v10);
        v26 = &v23[16 * v19];
      }
      else
      {
        v26 = &v23[16 * v19];
        do
        {
          v27 = *((_OWORD *)v10 - 1);
          v10 -= 16;
          *((_OWORD *)v26 - 1) = v27;
          v26 -= 16;
          *(_QWORD *)v10 = 0;
          *((_QWORD *)v10 + 1) = 0;
        }
        while (v10 != v18);
        v8 = *(__n128 *)(v2 + 91);
      }
      v13 = v24 + 1;
      v2[91] = v26;
      v2[92] = v24 + 1;
      v2[93] = &v23[16 * v22];
      v28 = v8.n128_i64[1];
      v29 = (void *)v8.n128_u64[0];
      while ((void *)v28 != v29)
        v28 = std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100](v28 - 16);
      if (v29)
        operator delete(v29);
    }
    else
    {
      *(_QWORD *)v10 = v7;
      *((_QWORD *)v10 + 1) = v4;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
      v13 = (__n128 *)(v10 + 16);
    }
    v2[92] = v13;
    do
      v30 = __ldaxr(p_shared_owners);
    while (__stlxr(v30 - 1, p_shared_owners));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v5->__on_zero_shared)(v5, v8);
      std::__shared_weak_count::__release_weak(v5);
    }
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD *, __n128))(v3 + 32))(v3, a1[4], *((_QWORD *)a1 + 3), v7, v8);
    do
      v31 = __ldaxr(p_shared_owners);
    while (__stlxr(v31 - 1, p_shared_owners));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  else
  {
    AMCP::Log::Scope_Registry::get((AMCP::Log::Scope_Registry *)a1);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v14 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    v15 = *(std::__shared_weak_count **)v39;
    if (*(_QWORD *)v39)
    {
      v16 = (unint64_t *)(*(_QWORD *)v39 + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v33 = pthread_self();
      v34 = pthread_mach_thread_np(v33);
      v35 = a1[4];
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v34;
      *(_WORD *)v39 = 2080;
      *(_QWORD *)&v39[2] = "HALS_UCRemotePlugIn.mm";
      v40 = 1024;
      v41 = 123;
      v42 = 1024;
      v43 = v35;
      _os_log_error_impl(&dword_1B57BA000, v14, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d The host ref is null, cannot request config change for object id %u", buf, 0x1Eu);
    }

  }
  return std::unique_ptr<-[Remote_Driver_Host_Delegate request_config_change:change_action:change_token:]::$_8>::~unique_ptr[abi:ne180100]((uint64_t *)&v37);
}

- (uint64_t)request_config_change:(uint64_t *)a1 change_action:change_token:
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    v3 = std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100](v2);
    MEMORY[0x1B5E50688](v3, 0x1020C40992E6479);
  }
  return a1;
}

- (uint64_t)object_properties_changed:(NSObject  *){objcproto17OS_dispatch_queue} data:(id)&
{
  uint64_t v2;
  unint64_t v3;
  void (**v4)(_QWORD, _QWORD, unint64_t, uint64_t);
  NSObject *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  _opaque_pthread_t *v10;
  mach_port_t v11;
  int v12;
  uint64_t v13;
  uint8_t buf[8];
  _BYTE v15[10];
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v2 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 24)), "bytes");
  v3 = objc_msgSend(*(id *)(a1 + 24), "length");
  v4 = *(void (***)(_QWORD, _QWORD, unint64_t, uint64_t))(*(_QWORD *)a1 + 720);
  if (v4)
  {
    (*v4)(v4, *(unsigned int *)(a1 + 16), v3 / 0xC, v2);
  }
  else
  {
    AMCP::Log::Scope_Registry::get(0);
    AMCP::Log::Scope_Registry::fetch((AMCP::Log::Scope_Registry *)buf, "com.apple.coreaudio", "AMCP");
    v5 = **(NSObject ***)buf;
    AMCP::Log::Scope::get_os_log_t(**(id **)buf);
    objc_claimAutoreleasedReturnValue();
    v6 = *(std::__shared_weak_count **)v15;
    if (*(_QWORD *)v15)
    {
      v7 = (unint64_t *)(*(_QWORD *)v15 + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = pthread_self();
      v11 = pthread_mach_thread_np(v10);
      v12 = *(_DWORD *)(a1 + 16);
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v11;
      *(_WORD *)v15 = 2080;
      *(_QWORD *)&v15[2] = "HALS_UCRemotePlugIn.mm";
      v16 = 1024;
      v17 = 97;
      v18 = 1024;
      v19 = v12;
      _os_log_error_impl(&dword_1B57BA000, v5, OS_LOG_TYPE_ERROR, "%6u %32s:%-5d The host ref is null, cannot issue properties changed for object id %u", buf, 0x1Eu);
    }

  }
  return std::unique_ptr<-[Remote_Driver_Host_Delegate object_properties_changed:data:]::$_7>::~unique_ptr[abi:ne180100](&v13);
}

- (uint64_t)object_properties_changed:(uint64_t *)a1 data:
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    v3 = std::shared_ptr<AMCP::Log::Scope>::~shared_ptr[abi:ne180100](v2);
    MEMORY[0x1B5E50688](v3, 0x10A0C405C5CD52DLL);
  }
  return a1;
}

@end
