@implementation CLTileRemoteDownloader

- (CLTileRemoteDownloader)initWithQueue:(id)a3
{
  CLTileRemoteDownloader *v4;
  CLTileRemoteDownloader *v5;
  xpc_connection_t v6;
  CLConnection *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CLTileRemoteDownloader;
  v4 = -[CLTileRemoteDownloader init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    -[CLTileRemoteDownloader setQueue:](v4, "setQueue:", a3);
    v6 = xpc_connection_create("com.apple.location.tilesservice", (dispatch_queue_t)-[CLTileRemoteDownloader queue](v5, "queue"));
    v7 = (CLConnection *)operator new();
    MEMORY[0x23B8399C4](v7, v6, -[CLTileRemoteDownloader queue](v5, "queue"));
    std::unique_ptr<CLConnection,CLConnectionDeleter>::reset[abi:ne180100](&v5->_connection.__ptr_.__value_, v7);
    xpc_release(v6);
    -[CLTileRemoteDownloader setup](v5, "setup");
  }
  return v5;
}

- (CLTileRemoteDownloader)initWithConnection:()unique_ptr<CLConnection onQueue:(CLConnectionDeleter>)a3
{
  CLTileRemoteDownloader *v6;
  CLTileRemoteDownloader *v7;
  CLConnection *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CLTileRemoteDownloader;
  v6 = -[CLTileRemoteDownloader init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[CLTileRemoteDownloader setQueue:](v6, "setQueue:", a4);
    v8 = *(CLConnection **)a3.__ptr_.__value_;
    *(_QWORD *)a3.__ptr_.__value_ = 0;
    std::unique_ptr<CLConnection,CLConnectionDeleter>::reset[abi:ne180100](&v7->_connection.__ptr_.__value_, v8);
    -[CLTileRemoteDownloader setup](v7, "setup");
  }
  return v7;
}

- (void)setup
{
  void *v3;
  id v4[5];
  id v5[5];
  id v6;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)-[CLTileRemoteDownloader queue](self, "queue"));
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x24BDAC760];
  v5[1] = (id)MEMORY[0x24BDAC760];
  v5[2] = (id)3221225472;
  v5[3] = __31__CLTileRemoteDownloader_setup__block_invoke;
  v5[4] = &unk_250AC1268;
  objc_copyWeak(&v6, &location);
  CLConnection::setDefaultMessageHandler();
  v4[1] = v3;
  v4[2] = (id)3221225472;
  v4[3] = __31__CLTileRemoteDownloader_setup__block_invoke_2;
  v4[4] = &unk_250AC1290;
  objc_copyWeak(v5, &location);
  CLConnection::setDisconnectionHandler();
  objc_copyWeak(v4, &location);
  CLConnection::setInterruptionHandler();
  CLConnection::start(self->_connection.__ptr_.__value_);
  objc_destroyWeak(v4);
  objc_destroyWeak(v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __31__CLTileRemoteDownloader_setup__block_invoke(uint64_t a1, uint64_t *a2)
{
  id Weak;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;

  Weak = objc_loadWeak((id *)(a1 + 32));
  v4 = (std::__shared_weak_count *)a2[1];
  v10 = *a2;
  v11 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  objc_msgSend(Weak, "handleMessage:", &v10);
  v7 = v11;
  if (v11)
  {
    v8 = (unint64_t *)&v11->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

uint64_t __31__CLTileRemoteDownloader_setup__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "handleDisconnection");
}

uint64_t __31__CLTileRemoteDownloader_setup__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "handleDisconnection");
}

- (void)dealloc
{
  OS_dispatch_queue *v3;
  CLConnection *value;
  OS_dispatch_queue *v5;
  objc_super v6;
  _QWORD block[6];
  _QWORD v8[4];

  -[CLTileRemoteDownloader setOnDownloadAndDecompression:](self, "setOnDownloadAndDecompression:", 0);
  v3 = -[CLTileRemoteDownloader queue](self, "queue");
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  value = self->_connection.__ptr_.__value_;
  self->_connection.__ptr_.__value_ = 0;
  v8[3] = value;
  v5 = -[CLTileRemoteDownloader queue](self, "queue");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__CLTileRemoteDownloader_dealloc__block_invoke;
  block[3] = &unk_250AC12B8;
  block[4] = v3;
  block[5] = v8;
  dispatch_async((dispatch_queue_t)v5, block);
  -[CLTileRemoteDownloader setQueue:](self, "setQueue:", 0);
  v6.receiver = self;
  v6.super_class = (Class)CLTileRemoteDownloader;
  -[CLTileRemoteDownloader dealloc](&v6, sel_dealloc);
  _Block_object_dispose(v8, 8);
}

CLConnection *__33__CLTileRemoteDownloader_dealloc__block_invoke(uint64_t a1)
{
  CLConnection *result;

  result = *(CLConnection **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (result)
  {
    result = (CLConnection *)CLConnection::deferredDelete(result);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)downloadAndDecompressFrom:(const char *)a3 toDecompressedDestination:(const char *)a4 withTimeout:(double)a5 withCompletionHandler:(id)a6
{
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  CLConnection *value;
  char v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  const char *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v31;
  std::__shared_weak_count *v32;
  _QWORD v33[2];
  _QWORD v34[2];
  uint8_t buf[8];
  __int16 v36;
  void *v37;
  __int16 v38;
  double v39;
  __int16 v40;
  CLConnection *v41;
  __int16 v42;
  _BOOL4 v43;
  __int16 v44;
  double v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)-[CLTileRemoteDownloader queue](self, "queue"));
  if (a5 <= 0.0)
  {
    if (onceToken_TilesFramework_Default != -1)
      dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
    v23 = logObject_TilesFramework_Default;
    if (os_log_type_enabled((os_log_t)logObject_TilesFramework_Default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      *(_DWORD *)&buf[4] = 0;
      v36 = 2082;
      v37 = &unk_2392598E1;
      v38 = 2050;
      v39 = a5;
      _os_log_impl(&dword_239256000, v23, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Ignoring #TileRemoteDownloader request with invalid timeout\", \"Timeout_s\":\"%{public}.09f\"}", buf, 0x1Cu);
      if (onceToken_TilesFramework_Default != -1)
        dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
    }
    v24 = logObject_TilesFramework_Default;
    if (!os_signpost_enabled((os_log_t)logObject_TilesFramework_Default))
      return 0;
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v36 = 2082;
    v37 = &unk_2392598E1;
    v38 = 2050;
    v39 = a5;
    v25 = "Ignoring #TileRemoteDownloader request with invalid timeout";
    v26 = "{\"msg%{public}.0s\":\"Ignoring #TileRemoteDownloader request with invalid timeout\", \"Timeout_s\":\"%{public}.09f\"}";
    goto LABEL_42;
  }
  *(double *)&v11 = COERCE_DOUBLE(objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3)));
  if (*(double *)&v11 == 0.0)
  {
    if (onceToken_TilesFramework_Default != -1)
      dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
    v27 = logObject_TilesFramework_Default;
    if (os_log_type_enabled((os_log_t)logObject_TilesFramework_Default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      v36 = 2082;
      v37 = &unk_2392598E1;
      v38 = 2081;
      v39 = *(double *)&a3;
      _os_log_impl(&dword_239256000, v27, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TileRemoteDownloader Ignoring new download request with invalid source string\", \"URLString\":%{private, location:escape_only}s}", buf, 0x1Cu);
      if (onceToken_TilesFramework_Default != -1)
        dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
    }
    v24 = logObject_TilesFramework_Default;
    if (!os_signpost_enabled((os_log_t)logObject_TilesFramework_Default))
      return 0;
    *(_DWORD *)buf = 68289283;
    *(_DWORD *)&buf[4] = 0;
    v36 = 2082;
    v37 = &unk_2392598E1;
    v38 = 2081;
    v39 = *(double *)&a3;
    v25 = "#TileRemoteDownloader Ignoring new download request with invalid source string";
    v26 = "{\"msg%{public}.0s\":\"#TileRemoteDownloader Ignoring new download request with invalid source string\", \"URL"
          "String\":%{private, location:escape_only}s}";
    goto LABEL_42;
  }
  v12 = *(double *)&v11;
  v13 = objc_msgSend(MEMORY[0x24BDB7458], "requestWithURL:", v11);
  if (!v13)
  {
    if (onceToken_TilesFramework_Default != -1)
      dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
    v28 = logObject_TilesFramework_Default;
    if (os_log_type_enabled((os_log_t)logObject_TilesFramework_Default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      v36 = 2082;
      v37 = &unk_2392598E1;
      v38 = 2113;
      v39 = v12;
      _os_log_impl(&dword_239256000, v28, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#TileRemoteDownloader Ignoring new download request with invalid source url\", \"URL\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (onceToken_TilesFramework_Default != -1)
        dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
    }
    v24 = logObject_TilesFramework_Default;
    if (!os_signpost_enabled((os_log_t)logObject_TilesFramework_Default))
      return 0;
    *(_DWORD *)buf = 68289283;
    *(_DWORD *)&buf[4] = 0;
    v36 = 2082;
    v37 = &unk_2392598E1;
    v38 = 2113;
    v39 = v12;
    v25 = "#TileRemoteDownloader Ignoring new download request with invalid source url";
    v26 = "{\"msg%{public}.0s\":\"#TileRemoteDownloader Ignoring new download request with invalid source url\", \"URL\":"
          "%{private, location:escape_only}@}";
    goto LABEL_42;
  }
  v14 = (void *)v13;
  v15 = objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a4), 0);
  if (!v15)
  {
    if (onceToken_TilesFramework_Default != -1)
      dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
    v29 = logObject_TilesFramework_Default;
    if (os_log_type_enabled((os_log_t)logObject_TilesFramework_Default, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289283;
      *(_DWORD *)&buf[4] = 0;
      v36 = 2082;
      v37 = &unk_2392598E1;
      v38 = 2113;
      v39 = 0.0;
      _os_log_impl(&dword_239256000, v29, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"TileRemoteDownloader Ignoring new download request with invalid decompressed destination url\", \"decompressedDestination\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (onceToken_TilesFramework_Default != -1)
        dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
    }
    v24 = logObject_TilesFramework_Default;
    if (!os_signpost_enabled((os_log_t)logObject_TilesFramework_Default))
      return 0;
    *(_DWORD *)buf = 68289283;
    *(_DWORD *)&buf[4] = 0;
    v36 = 2082;
    v37 = &unk_2392598E1;
    v38 = 2113;
    v39 = 0.0;
    v25 = "TileRemoteDownloader Ignoring new download request with invalid decompressed destination url";
    v26 = "{\"msg%{public}.0s\":\"TileRemoteDownloader Ignoring new download request with invalid decompressed destinatio"
          "n url\", \"decompressedDestination\":%{private, location:escape_only}@}";
LABEL_42:
    _os_signpost_emit_with_name_impl(&dword_239256000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v25, v26, buf, 0x1Cu);
    return 0;
  }
  v16 = v15;
  if (onceToken_TilesFramework_Default != -1)
    dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
  v17 = logObject_TilesFramework_Default;
  if (os_log_type_enabled((os_log_t)logObject_TilesFramework_Default, OS_LOG_TYPE_DEFAULT))
  {
    value = self->_connection.__ptr_.__value_;
    *(_DWORD *)buf = 68290307;
    *(_DWORD *)&buf[4] = 0;
    v36 = 2082;
    v37 = &unk_2392598E1;
    v38 = 2050;
    v39 = *(double *)&self;
    v40 = 2050;
    v41 = value;
    v42 = 1026;
    v43 = -[CLTileRemoteDownloader canDownloadOverCelullar](self, "canDownloadOverCelullar");
    v44 = 2113;
    v45 = v12;
    v46 = 2113;
    v47 = v16;
    _os_log_impl(&dword_239256000, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TileRemoteDownloader - starting request\", \"self\":\"%{public}p\", \"connection\":\"%{public}p\", \"canDownloadOverCelullar\":%{public}hhd, \"srcURL\":%{private, location:escape_only}@, \"decompressedDestination\":%{private, location:escape_only}@}", buf, 0x40u);
  }
  objc_msgSend(v14, "setTimeoutInterval:", a5);
  objc_msgSend(v14, "setAllowsCellularAccess:", -[CLTileRemoteDownloader canDownloadOverCelullar](self, "canDownloadOverCelullar"));
  -[CLTileRemoteDownloader setOnDownloadAndDecompression:](self, "setOnDownloadAndDecompression:", a6);
  v33[0] = CFSTR("kCLConnectionDownloadAndDecompressDestinationURLKey");
  v33[1] = CFSTR("kCLConnectionDownloadAndDecompressRequestKey");
  v34[0] = v16;
  v34[1] = v14;
  *(_QWORD *)buf = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
  std::allocate_shared[abi:ne180100]<CLConnectionMessage,std::allocator<CLConnectionMessage>,char const(&)[35],NSDictionary *&,void>("kCLConnectionDownloadAndDecompress", buf, &v31);
  v19 = CLConnection::sendMessage();
  v20 = v32;
  if (v32)
  {
    p_shared_owners = (unint64_t *)&v32->__shared_owners_;
    do
      v22 = __ldaxr(p_shared_owners);
    while (__stlxr(v22 - 1, p_shared_owners));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  return v19;
}

- (void)cancel
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;

  dispatch_assert_queue_V2((dispatch_queue_t)-[CLTileRemoteDownloader queue](self, "queue"));
  if (-[CLTileRemoteDownloader onDownloadAndDecompression](self, "onDownloadAndDecompression"))
  {
    std::allocate_shared[abi:ne180100]<CLConnectionMessage,std::allocator<CLConnectionMessage>,char const(&)[41],void>("kCLConnectionDownloadAndDecompressCancel", &v6);
    CLConnection::sendMessage();
    v3 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
  }
}

- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage **var0;
  uint64_t v5;
  __int128 v6;
  NSObject *v7;
  NSObject *v8;
  std::string *v9;
  std::string::size_type size;
  std::string *v11;
  CLConnectionMessage *v12;
  void *v13;
  uint64_t v14;
  NSSet *v15;
  void *DictionaryOfClasses;
  uint64_t v17;
  uint64_t v18;
  void (**v19)(id, uint64_t, uint64_t, _QWORD);
  std::string *v20;
  CLConnectionMessage *v21;
  objc_class *v22;
  uint64_t ObjectOfClass;
  id v24;
  os_activity_scope_state_s state;
  std::string v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  std::string *v34;
  __int16 v35;
  CLTileRemoteDownloader *v36;
  uint64_t v37;

  var0 = (CLConnectionMessage **)a3.var0;
  v37 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)-[CLTileRemoteDownloader queue](self, "queue", a3.var0, a3.var1));
  v5 = CLConnectionMessage::name(*var0);
  if (*(char *)(v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)v5, *(_QWORD *)(v5 + 8));
  }
  else
  {
    v6 = *(_OWORD *)v5;
    v26.__r_.__value_.__r.__words[2] = *(_QWORD *)(v5 + 16);
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v6;
  }
  v7 = _os_activity_create(&dword_239256000, "CL: #TileRemoteDownloader Handling message from service", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  if (onceToken_TilesFramework_Default != -1)
    dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
  v8 = logObject_TilesFramework_Default;
  if (os_log_type_enabled((os_log_t)logObject_TilesFramework_Default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = &v26;
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v9 = (std::string *)v26.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 68289794;
    v28 = 0;
    v29 = 2082;
    v30 = &unk_2392598E1;
    v31 = 2082;
    v32 = "activity";
    v33 = 2082;
    v34 = v9;
    v35 = 2050;
    v36 = self;
    _os_log_impl(&dword_239256000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TileRemoteDownloader Handling message from service\", \"event\":%{public, location:escape_only}s, \"messageName\":%{public, location:escape_only}s, \"self\":\"%{public}p\"}", buf, 0x30u);
  }
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
  else
    size = v26.__r_.__value_.__l.__size_;
  if (size == 39)
  {
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v20 = &v26;
    else
      v20 = (std::string *)v26.__r_.__value_.__r.__words[0];
    if (!memcmp(v20, "kCLConnectionDownloadAndDecompressError", 0x27uLL))
    {
      v21 = *var0;
      v22 = (objc_class *)objc_opt_class();
      ObjectOfClass = CLConnectionMessage::getObjectOfClass(v21, v22);
      v24 = -[CLTileRemoteDownloader onDownloadAndDecompression](self, "onDownloadAndDecompression");
      (*((void (**)(id, _QWORD, _QWORD, uint64_t))v24 + 2))(v24, 0, 0, ObjectOfClass);
    }
  }
  else if (size == 41)
  {
    v11 = (v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v26
        : (std::string *)v26.__r_.__value_.__r.__words[0];
    if (!memcmp(v11, "kCLConnectionDownloadAndDecompressSuccess", 0x29uLL))
    {
      v12 = *var0;
      v13 = (void *)MEMORY[0x24BDBCF20];
      v14 = objc_opt_class();
      v15 = (NSSet *)objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
      DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(v12, v15);
      v17 = objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", CFSTR("kCLConnectionDownloadAndDecompressFileKey"));
      v18 = objc_msgSend(DictionaryOfClasses, "objectForKeyedSubscript:", CFSTR("kCLConnectionDownloadAndDecompressURLResponseKey"));
      v19 = -[CLTileRemoteDownloader onDownloadAndDecompression](self, "onDownloadAndDecompression");
      v19[2](v19, v17, v18, 0);
    }
  }
  -[CLTileRemoteDownloader setOnDownloadAndDecompression:](self, "setOnDownloadAndDecompression:", 0);
  os_activity_scope_leave(&state);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
}

- (void)handleDisconnection
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  os_activity_scope_state_s v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)-[CLTileRemoteDownloader queue](self, "queue"));
  if (-[CLTileRemoteDownloader onDownloadAndDecompression](self, "onDownloadAndDecompression"))
  {
    v3 = _os_activity_create(&dword_239256000, "CL: #TileRemoteDownloader Service is unavailable, sending error to clients", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v3, &v7);

    if (onceToken_TilesFramework_Default != -1)
      dispatch_once(&onceToken_TilesFramework_Default, &__block_literal_global_0);
    v4 = logObject_TilesFramework_Default;
    if (os_log_type_enabled((os_log_t)logObject_TilesFramework_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289282;
      v9 = 0;
      v10 = 2082;
      v11 = &unk_2392598E1;
      v12 = 2082;
      v13 = "activity";
      _os_log_impl(&dword_239256000, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#TileRemoteDownloader Service is unavailable, sending error to clients\", \"event\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    v5 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kCLTileErrorDomain"), 2, 0);
    v6 = -[CLTileRemoteDownloader onDownloadAndDecompression](self, "onDownloadAndDecompression");
    (*((void (**)(id, _QWORD, _QWORD, uint64_t))v6 + 2))(v6, 0, 0, v5);
    -[CLTileRemoteDownloader setOnDownloadAndDecompression:](self, "setOnDownloadAndDecompression:", 0);
    os_activity_scope_leave(&v7);
  }
}

- (BOOL)canDownloadOverCelullar
{
  return self->_canDownloadOverCelullar;
}

- (void)setCanDownloadOverCelullar:(BOOL)a3
{
  self->_canDownloadOverCelullar = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (id)onDownloadAndDecompression
{
  return self->_onDownloadAndDecompression;
}

- (void)setOnDownloadAndDecompression:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  std::unique_ptr<CLConnection,CLConnectionDeleter>::reset[abi:ne180100](&self->_connection.__ptr_.__value_, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
