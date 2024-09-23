@implementation AVAudioSessionXPCServer

void __62__AVAudioSessionXPCServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "setExportedObject:", 0);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  as::server *v7;
  as::server *v8;
  NSObject *v9;
  NSMutableArray *v10;
  NSObject *v11;
  char *label;
  AVAudioSessionRemoteXPCClient *v13;
  AVAudioSessionRemoteXPCClient *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id from;
  id location;
  int data;
  id v24;
  id v25;
  std::string __p;
  id v27;
  std::string buf[2];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (as::server *)a4;
  v8 = v7;
  if (self->_needsDefaultWorldInit)
  {
    v9 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v7));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf[0].__r_.__value_.__l.__data_) = 136315394;
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)"AVAudioSessionXPCServer.mm";
      WORD2(buf[0].__r_.__value_.__r.__words[1]) = 1024;
      *(_DWORD *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 6) = 492;
      _os_log_impl(&dword_1C895C000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Performing deferred initialization", (uint8_t *)buf, 0x12u);
    }
    self->_needsDefaultWorldInit = 0;
  }
  v10 = self->_connections;
  objc_sync_enter(v10);
  -[NSMutableArray addObject:](self->_connections, "addObject:", v8);
  objc_sync_exit(v10);

  -[as::server setExportedInterface:](v8, "setExportedInterface:", self->_exportedInterface);
  -[as::server setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", self->_callbackInterface);
  -[as::server _queue](v8, "_queue");
  v11 = objc_claimAutoreleasedReturnValue();
  label = (char *)dispatch_queue_get_label(v11);
  std::string::basic_string[abi:ne180100]<0>(buf, label);
  as::CreateFixedPriorityDispatchQueue((const void **)&buf[0].__r_.__value_.__l.__data_, QOS_CLASS_USER_INTERACTIVE, &v27);
  if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf[0].__r_.__value_.__l.__data_);

  -[as::server _setQueue:](v8, "_setQueue:", v27);
  LODWORD(buf[0].__r_.__value_.__l.__data_) = 0;
  memset(&buf[0].__r_.__value_.__r.__words[1], 0, 40);
  LODWORD(buf[0].__r_.__value_.__l.__data_) = -[as::server processIdentifier](v8, "processIdentifier");
  objc_storeStrong((id *)&buf[0].__r_.__value_.__l.__size_, a4);
  v13 = [AVAudioSessionRemoteXPCClient alloc];
  data = (int)buf[0].__r_.__value_.__l.__data_;
  v24 = (id)buf[0].__r_.__value_.__l.__size_;
  objc_copyWeak(&v25, (id *)&buf[0].__r_.__value_.__r.__words[2]);
  if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, buf[1].__r_.__value_.__l.__data_, buf[1].__r_.__value_.__l.__size_);
  else
    __p = buf[1];
  v14 = -[AVAudioSessionRemoteXPCClient initWithServer:process:delegate:](v13, "initWithServer:process:delegate:", self, &data, self->_serverDelegate);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  objc_destroyWeak(&v25);

  objc_initWeak(&location, v14);
  objc_initWeak(&from, v8);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__AVAudioSessionXPCServer_listener_shouldAcceptNewConnection___block_invoke;
  v18[3] = &unk_1E8204ED0;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  v15 = (void *)MEMORY[0x1CAA39148](v18);
  -[as::server setInterruptionHandler:](v8, "setInterruptionHandler:", v15);
  -[as::server setInvalidationHandler:](v8, "setInvalidationHandler:", v15);
  -[as::server setExportedObject:](v8, "setExportedObject:", v14);
  -[as::server resume](v8, "resume");

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  if (SHIBYTE(buf[1].__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf[1].__r_.__value_.__l.__data_);
  objc_destroyWeak((id *)&buf[0].__r_.__value_.__r.__words[2]);

  v16 = v27;
  v27 = 0;

  return 1;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)removeConnection:(id)a3
{
  id v5;
  NSMutableArray *obj;

  obj = self->_connections;
  v5 = a3;
  objc_sync_enter(obj);
  -[NSMutableArray removeObject:](self->_connections, "removeObject:", v5);

  objc_sync_exit(obj);
}

- (void)init2
{
  _os_crash();
  __break(1u);
}

- (AVAudioSessionXPCServer)init
{
  NSObject *v3;
  AVAudioSessionXPCServer *v4;
  AVAudioSessionXPCServer *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  NSXPCListener *listener;
  NSObject *v11;
  char *label;
  as *v13;
  NSXPCListenerEndpoint *v14;
  id v15;
  id v17;
  objc_super v18;
  _BYTE buf[18];
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog((as::server *)self));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "AVAudioSessionXPCServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 431;
    _os_log_impl(&dword_1C895C000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Server starting", buf, 0x12u);
  }
  v18.receiver = self;
  v18.super_class = (Class)AVAudioSessionXPCServer;
  v4 = -[AVAudioSessionXPCServer init](&v18, sel_init);
  v5 = v4;
  if (v4)
  {
    as::WorkloopPool::Create((as::WorkloopPool *)0x14);
    std::shared_ptr<as::WorkloopPool>::operator=[abi:ne180100]((uint64_t)&v4->_workloopPool, (__int128 *)buf);
    v6 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v7 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 - 1, v7));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.audio.AudioSession"));
    listener = v5->_listener;
    v5->_listener = (NSXPCListener *)v9;

    -[NSXPCListener _queue](v5->_listener, "_queue");
    v11 = objc_claimAutoreleasedReturnValue();
    label = (char *)dispatch_queue_get_label(v11);
    std::string::basic_string[abi:ne180100]<0>(buf, label);
    as::CreateFixedPriorityDispatchQueue((const void **)buf, QOS_CLASS_USER_INTERACTIVE, &v17);
    if (v20 < 0)
      operator delete(*(void **)buf);

    -[NSXPCListener _setQueue:](v5->_listener, "_setQueue:", v17);
    -[NSXPCListener endpoint](v5->_listener, "endpoint");
    v13 = (as *)objc_claimAutoreleasedReturnValue();
    as::SetServerXPCListenerEndpoint(v13, v14);

    v5->_needsDefaultWorldInit = 1;
    -[AVAudioSessionXPCServer init2](v5, "init2");
    v15 = v17;
    v17 = 0;

  }
  return v5;
}

- (AVAudioSessionXPCServer)initWithDelegate:(id)a3
{
  as::server *v5;
  NSObject *v6;
  AVAudioSessionXPCServer *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  NSXPCListener *listener;
  NSObject *v13;
  char *label;
  as *v15;
  NSXPCListenerEndpoint *v16;
  id v17;
  id v19;
  objc_super v20;
  _BYTE buf[18];
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = (as::server *)a3;
  v6 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog(v5));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "AVAudioSessionXPCServer.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 450;
    _os_log_impl(&dword_1C895C000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Server starting", buf, 0x12u);
  }
  v20.receiver = self;
  v20.super_class = (Class)AVAudioSessionXPCServer;
  v7 = -[AVAudioSessionXPCServer init](&v20, sel_init);
  if (v7)
  {
    as::WorkloopPool::Create((as::WorkloopPool *)0x14);
    std::shared_ptr<as::WorkloopPool>::operator=[abi:ne180100]((uint64_t)&v7->_workloopPool, (__int128 *)buf);
    v8 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v9 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    objc_storeStrong((id *)&v7->_serverDelegate, a3);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.audio.AudioSession"));
    listener = v7->_listener;
    v7->_listener = (NSXPCListener *)v11;

    -[NSXPCListener _queue](v7->_listener, "_queue");
    v13 = objc_claimAutoreleasedReturnValue();
    label = (char *)dispatch_queue_get_label(v13);
    std::string::basic_string[abi:ne180100]<0>(buf, label);
    as::CreateFixedPriorityDispatchQueue((const void **)buf, QOS_CLASS_USER_INTERACTIVE, &v19);
    if (v22 < 0)
      operator delete(*(void **)buf);

    -[NSXPCListener _setQueue:](v7->_listener, "_setQueue:", v19);
    -[NSXPCListener endpoint](v7->_listener, "endpoint");
    v15 = (as *)objc_claimAutoreleasedReturnValue();
    as::SetServerXPCListenerEndpoint(v15, v16);

    v7->_needsDefaultWorldInit = 1;
    -[AVAudioSessionXPCServer init2](v7, "init2");
    v17 = v19;
    v19 = 0;

  }
  return v7;
}

- (void)start
{
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)dealloc
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSMutableArray *connections;
  std::promise<void> *value;
  NSObject *v11;
  objc_super v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  AVAudioSessionXPCServer *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = self->_connections;
  objc_sync_enter(v3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_connections;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "suspend");
        objc_msgSend(v8, "invalidate");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
    }
    while (v5);
  }

  connections = self->_connections;
  self->_connections = 0;

  objc_sync_exit(v3);
  value = (std::promise<void> *)self->_deallocPromise.__ptr_.__value_;
  if (value)
    std::promise<void>::set_value(value);
  v11 = objc_retainAutorelease(*(id *)as::server::gSessionServerLog((as::server *)value));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "AVAudioSessionXPCServer.mm";
    v19 = 1024;
    v20 = 486;
    v21 = 2048;
    v22 = self;
    _os_log_impl(&dword_1C895C000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Server %p deallocated", buf, 0x1Cu);
  }
  v12.receiver = self;
  v12.super_class = (Class)AVAudioSessionXPCServer;
  -[AVAudioSessionXPCServer dealloc](&v12, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_serverDelegate, 0);
  std::shared_ptr<as::server::AudioApplicationInfo>::~shared_ptr[abi:ne180100]((uint64_t)&self->_workloopPool);
  std::unique_ptr<std::promise<void>>::reset[abi:ne180100]((uint64_t *)&self->_deallocPromise, 0);
  objc_storeStrong((id *)&self->_callbackInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
