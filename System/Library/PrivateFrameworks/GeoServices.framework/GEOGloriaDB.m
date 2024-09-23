@implementation GEOGloriaDB

- (GEOGloriaDB)initWithFileURL:(id)a3 rootQuadKey:(unint64_t)a4 metadataClass:(Class)a5 dataClass:(Class)a6 log:(id)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  std::__shared_weak_count *v18;
  GEOGloriaDB *v19;
  id v20;
  int v21;
  _QWORD *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  NSObject *v32;
  int *v33;
  char *v34;
  _QWORD *v35;
  std::__shared_weak_count *v36;
  std::string __p;
  _QWORD *v38;
  std::__shared_weak_count *v39;
  char v40;
  std::string v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a7;
  v40 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v15, &v40);

  if ((v16 & 1) != 0)
  {
    v38 = 0;
    v39 = 0;
    if (v40)
    {
      objc_msgSend(v12, "path");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v17, "fileSystemRepresentation"));

      v18 = (std::__shared_weak_count *)operator new(0x38uLL);
      v18->__shared_owners_ = 0;
      v18->__shared_weak_owners_ = 0;
      v18->__vftable = (std::__shared_weak_count_vtbl *)&off_1E1BFB598;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v41, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      else
        v41 = __p;
      v22 = &v18[1].__vftable;
      gloria::DbReaderDisk::DbReaderDisk((uint64_t)&v18[1], (uint64_t)&v41);
      if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v41.__r_.__value_.__l.__data_);
      v38 = &v18[1].__vftable;
      v39 = v18;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      v20 = objc_retainAutorelease(v12);
      v21 = open((const char *)objc_msgSend(v20, "fileSystemRepresentation"), 0);
      if (v21 < 0)
      {
        v32 = v13;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = __error();
          v34 = strerror(*v33);
          LODWORD(v41.__r_.__value_.__l.__data_) = 138412546;
          *(std::string::size_type *)((char *)v41.__r_.__value_.__r.__words + 4) = (std::string::size_type)v20;
          WORD2(v41.__r_.__value_.__r.__words[1]) = 2080;
          *(std::string::size_type *)((char *)&v41.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v34;
          _os_log_error_impl(&dword_1885A9000, v32, OS_LOG_TYPE_ERROR, "[GEOGloriaDB] Error opening file at %@: %s", (uint8_t *)&v41, 0x16u);
        }

        v19 = 0;
        goto LABEL_23;
      }
      v18 = (std::__shared_weak_count *)operator new(0x90uLL);
      v18->__shared_owners_ = 0;
      v18->__shared_weak_owners_ = 0;
      v18->__vftable = (std::__shared_weak_count_vtbl *)&off_1E1BFB4F0;
      v22 = &v18[1].__vftable;
      geo::DbReaderTarFileDescriptor::DbReaderTarFileDescriptor((uint64_t)&v18[1], v21, v13);
      v38 = &v18[1].__vftable;
      v39 = v18;
    }
    v35 = v22;
    v36 = v18;
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v24 = __ldxr(p_shared_owners);
    while (__stxr(v24 + 1, p_shared_owners));
    self = -[GEOGloriaDB initWithDBAccess:rootQuadKey:metadataClass:dataClass:log:](self, "initWithDBAccess:rootQuadKey:metadataClass:dataClass:log:", &v35, a4, a5, a6, v13);
    v25 = v36;
    if (v36)
    {
      v26 = (unint64_t *)&v36->__shared_owners_;
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    v19 = self;
LABEL_23:
    v28 = v39;
    if (v39)
    {
      v29 = (unint64_t *)&v39->__shared_owners_;
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
    goto LABEL_28;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v41.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)v41.__r_.__value_.__r.__words + 4) = (std::string::size_type)v12;
    _os_log_error_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "[GEOGloriaDB] Refusing to open non-existent file at %@", (uint8_t *)&v41, 0xCu);
  }
  v19 = 0;
LABEL_28:

  return v19;
}

- (GEOGloriaDB)initWithDBAccess:(shared_ptr<gloria:(unint64_t)a4 :(Class)a5 DbReader>)a3 rootQuadKey:(Class)a6 metadataClass:(id)a7 dataClass:log:
{
  __shared_weak_count *var1;
  uint64_t *var0;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  GEOGloriaDB *v16;
  GEOGloriaDB *v17;
  NSObject **p_log;
  int v19;
  std::__shared_weak_count_vtbl *v20;
  std::__shared_weak_count *v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  DB *value;
  NSObject *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  GEOGloriaDB *v33;
  NSObject *v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  std::string *p_p;
  NSObject *v43;
  const char *v44;
  std::string __p;
  std::string v46;
  uint64_t v47;
  uint8_t v48[16];
  _BYTE v49[12];
  int v50;
  std::__shared_weak_count_vtbl *v51;
  std::__shared_weak_count *v52;
  uint64_t v53;
  char v54;
  objc_super v55;
  uint8_t buf[4];
  std::string *v57;
  uint64_t v58;

  var1 = a3.var1;
  var0 = (uint64_t *)a3.var0;
  v58 = *MEMORY[0x1E0C80C00];
  v13 = a6;
  if (a4)
  {
    v14 = objc_msgSend((id)a4, "superclass");
    if (v14 != objc_opt_class())
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
LABEL_53:
        v33 = 0;
        v17 = self;
        goto LABEL_46;
      }
      *(_WORD *)v48 = 0;
      v43 = MEMORY[0x1E0C81028];
      v44 = "Assertion failed: metadataClass == nullptr || metadataClass.superclass == PBCodable.class";
LABEL_55:
      _os_log_fault_impl(&dword_1885A9000, v43, OS_LOG_TYPE_FAULT, v44, v48, 2u);
      goto LABEL_53;
    }
  }
  if (a5)
  {
    v15 = -[objc_class superclass](a5, "superclass");
    if (v15 != objc_opt_class())
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        goto LABEL_53;
      *(_WORD *)v48 = 0;
      v43 = MEMORY[0x1E0C81028];
      v44 = "Assertion failed: dataClass == nullptr || dataClass.superclass == PBCodable.class";
      goto LABEL_55;
    }
  }
  v55.receiver = self;
  v55.super_class = (Class)GEOGloriaDB;
  v16 = -[GEOGloriaDB init](&v55, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_30;
  p_log = (NSObject **)&v16->_log;
  objc_storeStrong((id *)&v16->_log, a6);
  v19 = __clz((unint64_t)var1);
  LOBYTE(v19) = (int)((63 - v19 + (((63 - v19) & 0x80u) >> 7)) << 24) >> 25;
  v17->_rootTileId.tile_id_ = (unint64_t)var1 - gloria::LEADING_BITS_VALUE_LUT[v19];
  v17->_rootTileId.zoom_ = v19;
  v17->_metadataClass = (Class)a4;
  v17->_dataClass = a5;
  std::allocate_shared[abi:ne180100]<gloria::DbReaderDisk,std::allocator<gloria::DbReaderDisk>,char const(&)[1],void>((char *)&str, &v46);
  *(_OWORD *)v48 = *(_OWORD *)&v46.__r_.__value_.__l.__data_;
  memset(v49, 0, sizeof(v49));
  v50 = 1;
  v51 = 0;
  v52 = 0;
  v53 = 8;
  v54 = 0;
  std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::operator=[abi:ne180100](v48, var0);
  *(_QWORD *)&v49[4] = 0x200000002;
  v20 = (std::__shared_weak_count_vtbl *)operator new();
  v20->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_1E1BF6978;
  v21 = (std::__shared_weak_count *)operator new();
  v21->__vftable = (std::__shared_weak_count_vtbl *)&off_1E1BFB5D0;
  v21->__shared_owners_ = 0;
  v21->__shared_weak_owners_ = 0;
  v21[1].__vftable = v20;
  v22 = v52;
  v51 = v20;
  v52 = v21;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v24 = __ldaxr(p_shared_owners);
    while (__stlxr(v24 - 1, p_shared_owners));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v53 = 8;
  LODWORD(v46.__r_.__value_.__l.__data_) = 10;
  v47 = 0;
  *(_OWORD *)&v46.__r_.__value_.__r.__words[1] = 0uLL;
  gloria::DB::Open((uint64_t *)v48, &v46, (uint64_t ***)&__p);
  value = v17->_db.__ptr_.__value_;
  v17->_db.__ptr_.__value_ = (DB *)__p.__r_.__value_.__r.__words[0];
  if (value)
    (*(void (**)(DB *))(*(_QWORD *)&value->type + 8))(value);
  if (!LODWORD(v46.__r_.__value_.__l.__data_))
  {
    if (!v17->_db.__ptr_.__value_)
    {
      v34 = *p_log;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        LOWORD(__p.__r_.__value_.__l.__data_) = 0;
        _os_log_fault_impl(&dword_1885A9000, v34, OS_LOG_TYPE_FAULT, "[GEOGloriaDB] DB claimed to open successfully but returned nil", (uint8_t *)&__p, 2u);
      }
      goto LABEL_33;
    }
    if (SHIBYTE(v47) < 0)
      operator delete((void *)v46.__r_.__value_.__l.__size_);
    v27 = v52;
    if (v52)
    {
      v28 = (unint64_t *)&v52->__shared_owners_;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
    v30 = *(std::__shared_weak_count **)&v48[8];
    if (*(_QWORD *)&v48[8])
    {
      v31 = (unint64_t *)(*(_QWORD *)&v48[8] + 8);
      do
        v32 = __ldaxr(v31);
      while (__stlxr(v32 - 1, v31));
      if (!v32)
      {
        ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
        std::__shared_weak_count::__release_weak(v30);
      }
    }
LABEL_30:
    v17 = v17;
    v33 = v17;
    goto LABEL_46;
  }
  gloria::Status::ToString((gloria::Status *)&v46, &__p);
  v26 = *p_log;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    p_p = &__p;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136446210;
    v57 = p_p;
    _os_log_error_impl(&dword_1885A9000, v26, OS_LOG_TYPE_ERROR, "[GEOGloriaDB] Failed to open DB: %{public}s", buf, 0xCu);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_33:
  if (SHIBYTE(v47) < 0)
    operator delete((void *)v46.__r_.__value_.__l.__size_);
  v35 = v52;
  if (v52)
  {
    v36 = (unint64_t *)&v52->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  v38 = *(std::__shared_weak_count **)&v48[8];
  if (*(_QWORD *)&v48[8])
  {
    v39 = (unint64_t *)(*(_QWORD *)&v48[8] + 8);
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  v33 = 0;
LABEL_46:

  return v33;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = -1;
  *((_BYTE *)self + 32) = -1;
  return self;
}

- (GEOGloriaDB)initWithFileURL:(id)a3 rootQuadKey:(unint64_t)a4 log:(id)a5
{
  return -[GEOGloriaDB initWithFileURL:rootQuadKey:metadataClass:dataClass:log:](self, "initWithFileURL:rootQuadKey:metadataClass:dataClass:log:", a3, a4, 0, 0, a5);
}

- (BOOL)unsafeEnumerateDataAtLocation:(id)a3 radius:(double)a4 visitor:(id)a5
{
  double var1;
  double var0;
  id v9;
  Class metadataClass;
  _QWORD *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  __int128 v16;
  char *v17;
  char *v18;
  uint64_t v19;
  NSObject *log;
  BOOL v21;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  void *__p;
  void *v32;
  uint64_t v33;
  uint8_t buf[4];
  int v35;
  uint64_t v36;

  var1 = a3.var1;
  var0 = a3.var0;
  v36 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  metadataClass = self->_metadataClass;
  if (metadataClass != (Class)objc_opt_class())
  {
    v13 = 0;
    goto LABEL_19;
  }
  -[GEOGloriaDB metadata](self, "metadata");
  v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || !v11[2])
  {
    v13 = 0;
    goto LABEL_18;
  }
  __p = 0;
  v32 = 0;
  v33 = 0;
  v13 = GEOGloriaPopulateAvailableZoomRange(v11, (unint64_t *)&__p);
  if ((v13 & 1) != 0)
  {
    v14 = v32;
    if (v32 == __p)
    {
      v13 = 0;
      if (!v32)
        goto LABEL_18;
      goto LABEL_17;
    }
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __60__GEOGloriaDB_unsafeEnumerateDataAtLocation_radius_visitor___block_invoke;
    v24[3] = &unk_1E1C03660;
    v25 = v9;
    v26 = &v27;
    v15 = (void *)MEMORY[0x18D765024](v24);
    v17 = (char *)v32;
    if (__p != v32)
    {
      v18 = (char *)__p + 1;
      *(_QWORD *)&v16 = 67109120;
      v23 = v16;
      do
      {
        v19 = *(v18 - 1);
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v23;
          v35 = v19;
          _os_log_debug_impl(&dword_1885A9000, log, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Checking zoom %d", buf, 8u);
        }
        -[GEOGloriaDB unsafeEnumerateDataAtLocation:radius:zoom:visitor:](self, "unsafeEnumerateDataAtLocation:radius:zoom:visitor:", v19, v15, var0, var1, a4, v23);
        if (*((_BYTE *)v28 + 24))
          v21 = 1;
        else
          v21 = v18 == v17;
        ++v18;
      }
      while (!v21);
    }

    _Block_object_dispose(&v27, 8);
  }
  v14 = __p;
  if (__p)
  {
LABEL_17:
    v32 = v14;
    operator delete(v14);
  }
LABEL_18:

LABEL_19:
  return v13;
}

- (id)metadata
{
  return -[GEOGloriaDB _dataForQuadKey:ofType:](self, "_dataForQuadKey:ofType:", 0x7FFFFFFFFFFFFFFFLL, self->_metadataClass);
}

- (id)_dataForQuadKey:(unint64_t)a3 ofType:(Class)a4
{
  objc_class *metadataClass;
  BOOL v6;
  NSObject *log;
  id v10;
  void *v11;
  void *v12;
  OS_os_log *v13;
  NSObject *v14;
  std::string *v16;
  std::string::size_type v17;
  void *v18;
  void *v19[3];
  char v20;
  void *v21;
  const char *v22;
  _OWORD v23[2];
  char *v24;
  __int16 v25;
  char v26[4];
  int v27;
  unint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint8_t buf[4];
  unint64_t v32;
  __int16 v33;
  std::string *v34;
  std::string v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  metadataClass = self->_metadataClass;
  v6 = metadataClass == a4 || a3 != 0x7FFFFFFFFFFFFFFFLL || metadataClass == 0;
  if (!v6
    || a3 != 0x7FFFFFFFFFFFFFFFLL
    && self->_rootTileId.zoom_
    && !_isAncestor((gloria::TileId *)self->_rootTileId.tile_id_, self->_rootTileId.zoom_, a3))
  {
    return 0;
  }
  v26[0] = 1;
  v27 = 0;
  v28 = &v30;
  v29 = 8;
  LOBYTE(v21) = 1;
  HIDWORD(v21) = 0;
  v22 = "";
  memset(v23, 0, sizeof(v23));
  v24 = (char *)v23 + 8;
  v25 = 0;
  (*(void (**)(void **__return_ptr, DB *, char *, void **))(*(_QWORD *)self->_db.__ptr_.__value_ + 32))(v19, self->_db.__ptr_.__value_, v26, &v21);
  if (LODWORD(v19[0]))
  {
    gloria::Status::ToString((gloria::Status *)v19, &v35);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      v16 = &v35;
      if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v16 = (std::string *)v35.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 134283779;
      v32 = v30;
      v33 = 2082;
      v34 = v16;
      _os_log_debug_impl(&dword_1885A9000, log, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Failed to look up data for quad key %{private}llu: %{public}s", buf, 0x16u);
    }
    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v35.__r_.__value_.__l.__data_);
    v10 = 0;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v22, *(_QWORD *)&v23[0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v35.__r_.__value_.__l.__data_) = 134283521;
      *(std::string::size_type *)((char *)v35.__r_.__value_.__r.__words + 4) = v30;
      _os_log_error_impl(&dword_1885A9000, v14, OS_LOG_TYPE_ERROR, "[GEOGloriaDB] Failed to create data object for quad key %{private}llu", (uint8_t *)&v35, 0xCu);
    }
    goto LABEL_25;
  }
  if (!a4)
  {
    v10 = v11;
    goto LABEL_27;
  }
  v10 = (id)objc_msgSend([a4 alloc], "initWithData:", v11);
  if (!v10)
  {
    v13 = self->_log;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      v17 = v30;
      NSStringFromClass(a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v35.__r_.__value_.__l.__data_) = 134283779;
      *(std::string::size_type *)((char *)v35.__r_.__value_.__r.__words + 4) = v17;
      WORD2(v35.__r_.__value_.__r.__words[1]) = 2112;
      *(std::string::size_type *)((char *)&v35.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v18;
      _os_log_error_impl(&dword_1885A9000, (os_log_t)v13, OS_LOG_TYPE_ERROR, "[GEOGloriaDB] Failed to decode object for quad key %{private}llu or type %{publie}@", (uint8_t *)&v35, 0x16u);

    }
LABEL_25:
    v10 = 0;
  }
LABEL_27:

LABEL_28:
  if (v20 < 0)
    operator delete(v19[1]);
  gloria::ManagedSlice::~ManagedSlice(&v21);
  return v10;
}

- (BOOL)unsafeEnumerateDataAtLocation:(id)a3 radius:(double)a4 zoom:(unsigned __int8)a5 visitor:(id)a6
{
  void *v6;
  BOOL v7;

  -[GEOGloriaDB unsafeEnumerateDataAtLocation:radius:zoom:ifDifferentFrom:visitor:](self, "unsafeEnumerateDataAtLocation:radius:zoom:ifDifferentFrom:visitor:", a5, 0, a6, a3.var0, a3.var1, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

- (BOOL)unsafeDataForQuadKey:(unint64_t)a3 result:(id)a4
{
  return -[GEOGloriaDB _unsafeDataForQuadKey:ofType:result:](self, "_unsafeDataForQuadKey:ofType:result:", a3, self->_dataClass, a4);
}

- (BOOL)_unsafeDataForQuadKey:(unint64_t)a3 ofType:(Class)a4 result:(id)a5
{
  uint64_t (**v8)(id, id);
  objc_class *metadataClass;
  BOOL v11;
  NSObject *log;
  char v13;
  void *v14;
  void *v15;
  id v16;
  OS_os_log *v17;
  NSObject *v18;
  std::string *v20;
  std::string::size_type v21;
  void *v22;
  void *v23[3];
  char v24;
  void *v25;
  const char *v26;
  _OWORD v27[2];
  char *v28;
  __int16 v29;
  char v30[4];
  int v31;
  unint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  uint8_t buf[4];
  unint64_t v36;
  __int16 v37;
  std::string *v38;
  std::string v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v8 = (uint64_t (**)(id, id))a5;
  metadataClass = self->_metadataClass;
  v11 = metadataClass == a4 || a3 != 0x7FFFFFFFFFFFFFFFLL || metadataClass == 0;
  if (!v11
    || self->_rootTileId.zoom_
    && !_isAncestor((gloria::TileId *)self->_rootTileId.tile_id_, self->_rootTileId.zoom_, a3))
  {
    v13 = 0;
    goto LABEL_32;
  }
  v30[0] = 1;
  v31 = 0;
  v32 = &v34;
  v33 = 8;
  LOBYTE(v25) = 1;
  HIDWORD(v25) = 0;
  v26 = "";
  memset(v27, 0, sizeof(v27));
  v28 = (char *)v27 + 8;
  v29 = 0;
  (*(void (**)(void **__return_ptr, DB *, char *, void **))(*(_QWORD *)self->_db.__ptr_.__value_ + 32))(v23, self->_db.__ptr_.__value_, v30, &v25);
  if (LODWORD(v23[0]))
  {
    gloria::Status::ToString((gloria::Status *)v23, &v39);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      v20 = &v39;
      if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v20 = (std::string *)v39.__r_.__value_.__r.__words[0];
      *(_DWORD *)buf = 134283779;
      v36 = v34;
      v37 = 2082;
      v38 = v20;
      _os_log_debug_impl(&dword_1885A9000, log, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Failed to look up data for quad key %{private}llu: %{public}s", buf, 0x16u);
    }
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v39.__r_.__value_.__l.__data_);
    v13 = 0;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v26, *(_QWORD *)&v27[0], 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    v18 = self->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v39.__r_.__value_.__l.__data_) = 134283521;
      *(std::string::size_type *)((char *)v39.__r_.__value_.__r.__words + 4) = v34;
      _os_log_error_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "[GEOGloriaDB] Failed to create data object for quad key %{private}llu", (uint8_t *)&v39, 0xCu);
    }
    v13 = 0;
    goto LABEL_28;
  }
  if (a4)
  {
    v16 = (id)objc_msgSend([a4 alloc], "initWithData:", v14);
    if (!v16)
    {
      v17 = self->_log;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        v21 = v34;
        NSStringFromClass(a4);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v39.__r_.__value_.__l.__data_) = 134283779;
        *(std::string::size_type *)((char *)v39.__r_.__value_.__r.__words + 4) = v21;
        WORD2(v39.__r_.__value_.__r.__words[1]) = 2112;
        *(std::string::size_type *)((char *)&v39.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v22;
        _os_log_error_impl(&dword_1885A9000, (os_log_t)v17, OS_LOG_TYPE_ERROR, "[GEOGloriaDB] Failed to decode object for quad key %{private}llu or type %{publie}@", (uint8_t *)&v39, 0x16u);

      }
      v16 = 0;
      v13 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    v16 = v14;
  }
  v13 = v8[2](v8, v16);
LABEL_27:

LABEL_28:
LABEL_29:
  if (v24 < 0)
    operator delete(v23[1]);
  gloria::ManagedSlice::~ManagedSlice(&v25);
LABEL_32:

  return v13;
}

uint64_t __60__GEOGloriaDB_unsafeEnumerateDataAtLocation_radius_visitor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (void).cxx_destruct
{
  DB *value;

  value = self->_db.__ptr_.__value_;
  self->_db.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(DB *, SEL))(*(_QWORD *)&value->type + 8))(value, a2);
  objc_storeStrong((id *)&self->_log, 0);
}

- (GEOGloriaDB)initWithFileHandle:(id)a3 rootQuadKey:(unint64_t)a4 log:(id)a5
{
  return -[GEOGloriaDB initWithFileHandle:rootQuadKey:metadataClass:dataClass:log:](self, "initWithFileHandle:rootQuadKey:metadataClass:dataClass:log:", a3, a4, 0, 0, a5);
}

- (GEOGloriaDB)initWithFileHandle:(id)a3 rootQuadKey:(unint64_t)a4 metadataClass:(Class)a5 dataClass:(Class)a6 log:(id)a7
{
  id v12;
  id v13;
  int v14;
  std::__shared_weak_count *v15;
  GEOGloriaDB *v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  uint64_t v21;
  std::__shared_weak_count *v22;

  v12 = a3;
  v13 = a7;
  v14 = objc_msgSend(v12, "fileDescriptor");
  v15 = (std::__shared_weak_count *)operator new(0x90uLL);
  v15->__shared_owners_ = 0;
  v15->__shared_weak_owners_ = 0;
  v15->__vftable = (std::__shared_weak_count_vtbl *)&off_1E1BFB4F0;
  v21 = geo::DbReaderTarFileDescriptor::DbReaderTarFileDescriptor((uint64_t)&v15[1], v14, v13);
  v22 = v15;
  v16 = -[GEOGloriaDB initWithDBAccess:rootQuadKey:metadataClass:dataClass:log:](self, "initWithDBAccess:rootQuadKey:metadataClass:dataClass:log:", &v21, a4, a5, a6, v13, 0);
  v17 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }

  return v16;
}

- (BOOL)containsQuadKey:(unint64_t)a3
{
  int isAncestor;
  char v6[4];
  int v7;
  unint64_t *v8;
  uint64_t v9;
  unint64_t v10;

  v10 = a3;
  if (!self->_rootTileId.zoom_
    || (isAncestor = _isAncestor((gloria::TileId *)self->_rootTileId.tile_id_, self->_rootTileId.zoom_, a3)) != 0)
  {
    v6[0] = 1;
    v7 = 0;
    v8 = &v10;
    v9 = 8;
    LOBYTE(isAncestor) = (*(uint64_t (**)(DB *, char *))(*(_QWORD *)self->_db.__ptr_.__value_ + 16))(self->_db.__ptr_.__value_, v6);
  }
  return isAncestor;
}

- (BOOL)containsQuadKeyNum:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[GEOGloriaDB containsQuadKey:](self, "containsQuadKey:", objc_msgSend(v4, "unsignedLongLongValue"));

  return (char)self;
}

- (BOOL)unsafeMetadata:(id)a3
{
  return -[GEOGloriaDB _unsafeDataForQuadKey:ofType:result:](self, "_unsafeDataForQuadKey:ofType:result:", 0x7FFFFFFFFFFFFFFFLL, self->_metadataClass, a3);
}

- (id)dataForQuadKey:(unint64_t)a3
{
  return -[GEOGloriaDB _dataForQuadKey:ofType:](self, "_dataForQuadKey:ofType:", a3, self->_dataClass);
}

- (id)dataForQuadKeyNum:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[GEOGloriaDB _dataForQuadKey:ofType:](self, "_dataForQuadKey:ofType:", objc_msgSend(v4, "unsignedLongLongValue"), self->_dataClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)unsafeDataForQuadKeyNum:(id)a3 result:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  LOBYTE(self) = -[GEOGloriaDB _unsafeDataForQuadKey:ofType:result:](self, "_unsafeDataForQuadKey:ofType:result:", objc_msgSend(v6, "unsignedLongLongValue"), self->_dataClass, v7);

  return (char)self;
}

- (BOOL)enumerateDataAtLocation:(id)a3 radius:(double)a4 zoom:(unsigned __int8)a5 visitor:(id)a6
{
  void *v6;
  BOOL v7;

  -[GEOGloriaDB enumerateDataAtLocation:radius:zoom:ifDifferentFrom:visitor:](self, "enumerateDataAtLocation:radius:zoom:ifDifferentFrom:visitor:", a5, 0, a6, a3.var0, a3.var1, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") != 0;

  return v7;
}

- (id)enumerateDataAtLocation:(id)a3 radius:(double)a4 zoom:(unsigned __int8)a5 ifDifferentFrom:(id)a6 visitor:(id)a7
{
  int v8;
  double var1;
  double var0;
  id v13;
  uint64_t v14;
  const unsigned __int8 *v15;
  void (**v16)(id, _QWORD, void *, char *);
  id v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *log;
  _QWORD *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _QWORD *v30;
  _OWORD *v31;
  BOOL v32;
  uint64_t v33;
  char v35;
  unsigned __int8 v36;
  $F24F406B2B787EFB06265DBA3D28CBD5 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;

  v8 = a5;
  var1 = a3.var1;
  var0 = a3.var0;
  v44 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v36 = a5;
  v13 = a6;
  v16 = (void (**)(id, _QWORD, void *, char *))a7;
  if ((v8 - 31) < 0xE2u)
  {
    v17 = 0;
    goto LABEL_29;
  }
  v35 = 0;
  if (a4 > 0.0)
  {
    *((_QWORD *)&v42 + 1) = 0;
    v43 = 0;
    *(_QWORD *)&v42 = (char *)&v42 + 8;
    GEOGloriaPopulateQuadKeysWithinRadiusFromCoordinate(v8, (uint64_t **)&v42, var0, var1, a4, v14, v15);
    if (_quadKeySetsMatch(v13, &v42))
    {
      v17 = v13;
LABEL_26:
      std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::destroy((uint64_t)&v42, *((_QWORD **)&v42 + 1));
      goto LABEL_29;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = v43;
      _os_log_debug_impl(&dword_1885A9000, log, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Radius > 0, looking at %d tiles", buf, 8u);
    }
    v26 = (_QWORD *)v42;
    if ((__int128 *)v42 == (__int128 *)((char *)&v42 + 8))
      goto LABEL_26;
    while (1)
    {
      if (_isAncestor((gloria::TileId *)self->_rootTileId.tile_id_, self->_rootTileId.zoom_, v26[4]))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v26[4]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v27);

        if (!v35)
        {
          -[GEOGloriaDB dataForQuadKey:](self, "dataForQuadKey:", v26[4]);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = self->_log;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            v33 = v26[4];
            *(_DWORD *)buf = 134218241;
            v39 = v28;
            v40 = 2049;
            v41 = v33;
            _os_log_debug_impl(&dword_1885A9000, v29, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Got data %p quad key %{private}lld", buf, 0x16u);
            if (!v28)
              goto LABEL_17;
LABEL_16:
            v16[2](v16, v26[4], v28, &v35);

            goto LABEL_17;
          }
          if (v28)
            goto LABEL_16;
        }
      }
LABEL_17:
      v30 = (_QWORD *)v26[1];
      if (v30)
      {
        do
        {
          v31 = v30;
          v30 = (_QWORD *)*v30;
        }
        while (v30);
      }
      else
      {
        do
        {
          v31 = (_OWORD *)v26[2];
          v32 = *(_QWORD *)v31 == (_QWORD)v26;
          v26 = v31;
        }
        while (!v32);
      }
      v26 = v31;
      if (v31 == (__int128 *)((char *)&v42 + 8))
        goto LABEL_26;
    }
  }
  gloria::TileId::FromLatLng((gloria::TileId *)&v37, &v37.var1, (const double *)&v36, v15);
  v20 = v19 | gloria::LEADING_BITS_VALUE_LUT[v18];
  v21 = self->_log;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(v42) = 134283521;
    *(_QWORD *)((char *)&v42 + 4) = v20;
    _os_log_debug_impl(&dword_1885A9000, v21, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Radius 0, looking at exact tile only for key %{private}llu", (uint8_t *)&v42, 0xCu);
  }
  -[GEOGloriaDB dataForQuadKey:](self, "dataForQuadKey:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v16[2](v16, v20, v22, &v35);
    v23 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithObject:", v24);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_29:
  return v17;
}

- (BOOL)enumerateDataAtLocation:(id)a3 radius:(double)a4 visitor:(id)a5
{
  double var1;
  double var0;
  id v9;
  Class metadataClass;
  _QWORD *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  __int128 v16;
  char *v17;
  char *v18;
  uint64_t v19;
  NSObject *log;
  BOOL v21;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  void *__p;
  void *v32;
  uint64_t v33;
  uint8_t buf[4];
  int v35;
  uint64_t v36;

  var1 = a3.var1;
  var0 = a3.var0;
  v36 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  metadataClass = self->_metadataClass;
  if (metadataClass != (Class)objc_opt_class())
  {
    v13 = 0;
    goto LABEL_19;
  }
  -[GEOGloriaDB metadata](self, "metadata");
  v11 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || !v11[2])
  {
    v13 = 0;
    goto LABEL_18;
  }
  __p = 0;
  v32 = 0;
  v33 = 0;
  v13 = GEOGloriaPopulateAvailableZoomRange(v11, (unint64_t *)&__p);
  if ((v13 & 1) != 0)
  {
    v14 = v32;
    if (v32 == __p)
    {
      v13 = 0;
      if (!v32)
        goto LABEL_18;
      goto LABEL_17;
    }
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __54__GEOGloriaDB_enumerateDataAtLocation_radius_visitor___block_invoke;
    v24[3] = &unk_1E1C03660;
    v25 = v9;
    v26 = &v27;
    v15 = (void *)MEMORY[0x18D765024](v24);
    v17 = (char *)v32;
    if (__p != v32)
    {
      v18 = (char *)__p + 1;
      *(_QWORD *)&v16 = 67109120;
      v23 = v16;
      do
      {
        v19 = *(v18 - 1);
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v23;
          v35 = v19;
          _os_log_debug_impl(&dword_1885A9000, log, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Checking zoom %d", buf, 8u);
        }
        -[GEOGloriaDB enumerateDataAtLocation:radius:zoom:visitor:](self, "enumerateDataAtLocation:radius:zoom:visitor:", v19, v15, var0, var1, a4, v23);
        if (*((_BYTE *)v28 + 24))
          v21 = 1;
        else
          v21 = v18 == v17;
        ++v18;
      }
      while (!v21);
    }

    _Block_object_dispose(&v27, 8);
  }
  v14 = __p;
  if (__p)
  {
LABEL_17:
    v32 = v14;
    operator delete(v14);
  }
LABEL_18:

LABEL_19:
  return v13;
}

uint64_t __54__GEOGloriaDB_enumerateDataAtLocation_radius_visitor___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (id)unsafeEnumerateDataAtLocation:(id)a3 radius:(double)a4 zoom:(unsigned __int8)a5 ifDifferentFrom:(id)a6 visitor:(id)a7
{
  int v8;
  double var1;
  double var0;
  uint64_t v13;
  const unsigned __int8 *v14;
  id v15;
  id v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *log;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD *v24;
  uint64_t *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  _QWORD *v30;
  _OWORD *v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t *v39;
  _QWORD *v40;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  unsigned __int8 v49;
  $F24F406B2B787EFB06265DBA3D28CBD5 v50;
  uint8_t buf[4];
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;

  v8 = a5;
  var1 = a3.var1;
  var0 = a3.var0;
  v55 = *MEMORY[0x1E0C80C00];
  v50 = a3;
  v49 = a5;
  v36 = a6;
  v15 = a7;
  if ((v8 - 31) < 0xE2u)
  {
    v16 = 0;
  }
  else
  {
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    if (a4 <= 0.0)
    {
      gloria::TileId::FromLatLng((gloria::TileId *)&v50, &v50.var1, (const double *)&v49, v14);
      v19 = v18 | gloria::LEADING_BITS_VALUE_LUT[v17];
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v53) = 134283521;
        *(_QWORD *)((char *)&v53 + 4) = v19;
        _os_log_debug_impl(&dword_1885A9000, log, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Radius 0, looking at exact tile only for key %{private}llu", (uint8_t *)&v53, 0xCu);
      }
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __81__GEOGloriaDB_unsafeEnumerateDataAtLocation_radius_zoom_ifDifferentFrom_visitor___block_invoke;
      v41[3] = &unk_1E1C03688;
      v42 = v15;
      v43 = &v45;
      v44 = v19;
      if (-[GEOGloriaDB unsafeDataForQuadKey:result:](self, "unsafeDataForQuadKey:result:", v19, v41))
      {
        v21 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setWithObject:", v22);
        v16 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {

        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      *((_QWORD *)&v53 + 1) = 0;
      v54 = 0;
      *(_QWORD *)&v53 = (char *)&v53 + 8;
      GEOGloriaPopulateQuadKeysWithinRadiusFromCoordinate(v8, (uint64_t **)&v53, var0, var1, a4, v13, v14);
      if (_quadKeySetsMatch(v36, &v53))
      {
        v16 = v36;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v23 = self->_log;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v52) = v54;
          _os_log_debug_impl(&dword_1885A9000, v23, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Radius > 0, looking at %d tiles", buf, 8u);
        }
        v24 = (_QWORD *)v53;
        if ((__int128 *)v53 != (__int128 *)((char *)&v53 + 8))
        {
          do
          {
            v25 = v24 + 4;
            if (_isAncestor((gloria::TileId *)self->_rootTileId.tile_id_, self->_rootTileId.zoom_, v24[4]))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "addObject:", v26);

              if (!*((_BYTE *)v46 + 24))
              {
                v27 = self->_log;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                {
                  v33 = *v25;
                  *(_DWORD *)buf = 134283521;
                  v52 = v33;
                  _os_log_debug_impl(&dword_1885A9000, v27, OS_LOG_TYPE_DEBUG, "Checking quad key %{private}lld", buf, 0xCu);
                }
                v28 = *v25;
                v37[0] = MEMORY[0x1E0C809B0];
                v37[1] = 3221225472;
                v37[2] = __81__GEOGloriaDB_unsafeEnumerateDataAtLocation_radius_zoom_ifDifferentFrom_visitor___block_invoke_8;
                v37[3] = &unk_1E1C036B0;
                v37[4] = self;
                v40 = v24 + 4;
                v38 = v15;
                v39 = &v45;
                if (!-[GEOGloriaDB unsafeDataForQuadKey:result:](self, "unsafeDataForQuadKey:result:", v28, v37))
                {
                  v29 = self->_log;
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                  {
                    v34 = *v25;
                    *(_DWORD *)buf = 134283521;
                    v52 = v34;
                    _os_log_debug_impl(&dword_1885A9000, v29, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Got data (nil) quad key %{private}lld", buf, 0xCu);
                  }
                }

              }
            }
            v30 = (_QWORD *)v24[1];
            if (v30)
            {
              do
              {
                v31 = v30;
                v30 = (_QWORD *)*v30;
              }
              while (v30);
            }
            else
            {
              do
              {
                v31 = (_OWORD *)v24[2];
                v32 = *(_QWORD *)v31 == (_QWORD)v24;
                v24 = v31;
              }
              while (!v32);
            }
            v24 = v31;
          }
          while (v31 != (__int128 *)((char *)&v53 + 8));
        }
      }
      std::__tree<std::__value_type<unsigned int,unsigned long>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned long>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned long>>>::destroy((uint64_t)&v53, *((_QWORD **)&v53 + 1));
    }
    _Block_object_dispose(&v45, 8);
  }

  return v16;
}

uint64_t __81__GEOGloriaDB_unsafeEnumerateDataAtLocation_radius_zoom_ifDifferentFrom_visitor___block_invoke(_QWORD *a1, uint64_t a2)
{
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(a1[4] + 16))(a1[4], a1[6], a2, *(_QWORD *)(a1[5] + 8) + 24);
  return 1;
}

uint64_t __81__GEOGloriaDB_unsafeEnumerateDataAtLocation_radius_zoom_ifDifferentFrom_visitor___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v6 = **(_QWORD **)(a1 + 56);
    v7 = 134218241;
    v8 = v3;
    v9 = 2049;
    v10 = v6;
    _os_log_debug_impl(&dword_1885A9000, v4, OS_LOG_TYPE_DEBUG, "[GEOGloriaDB] Got data %p quad key %{private}lld", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return 1;
}

@end
