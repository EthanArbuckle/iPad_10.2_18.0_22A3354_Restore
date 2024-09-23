@implementation FileLocalXPC

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FileLocalXPC)initWithURL:(id)a3 fileOpenFlags:(int)a4
{
  id v6;
  FileLocalXPC *v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  char *v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  int v19;

  v6 = a3;
  v19 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FileLocalXPC;
  v7 = -[FileLocalXPC init](&v18, sel_init);
  if (v7)
  {
    v15 = (char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
    std::allocate_shared[abi:ne180100]<FileLocal,std::allocator<FileLocal>,char const*,int &,void>(&v15, &v19, &v16);
    v17 = v16;
    v16 = 0uLL;
    -[BackendXPC setBackend:](v7, "setBackend:", &v17);
    v8 = (std::__shared_weak_count *)*((_QWORD *)&v17 + 1);
    if (*((_QWORD *)&v17 + 1))
    {
      v9 = (unint64_t *)(*((_QWORD *)&v17 + 1) + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }

  return v7;
}

- (FileLocalXPC)initWithCoder:(id)a3
{
  id v4;
  FileLocalXPC *v5;
  void *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  int v16;
  char v17;
  BOOL v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FileLocalXPC;
  v5 = -[BackendXPC initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("file_handle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is_writable"));
    v17 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("is_locked"));
    v16 = dup(objc_msgSend(v6, "fileDescriptor"));
    std::allocate_shared[abi:ne180100]<FileLocal,std::allocator<FileLocal>,int &,BOOL &,BOOL &,void>(&v16, &v18, &v17, &v14);
    v15 = v14;
    v14 = 0uLL;
    -[BackendXPC setBackend:](v5, "setBackend:", &v15, 0);
    v7 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
    if (*((_QWORD *)&v15 + 1))
    {
      v8 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
    if (*((_QWORD *)&v14 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  std::__shared_weak_count *v5;
  FileLocal *v6;
  void *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  objc_super v10;
  FileLocal *v11;
  std::__shared_weak_count *v12;
  FileLocal *v13;
  std::__shared_weak_count *v14;

  v4 = a3;
  -[BackendXPC backend](self, "backend");
  v6 = v11;
  v5 = v12;
  v13 = v11;
  v14 = v12;
  v10.receiver = self;
  v10.super_class = (Class)FileLocalXPC;
  -[BackendXPC encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:", (*(uint64_t (**)(FileLocal *))(*(_QWORD *)v6 + 176))(v6));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("file_handle"));
  objc_msgSend(v4, "encodeBool:forKey:", (*(uint64_t (**)(FileLocal *))(*(_QWORD *)v6 + 48))(v6), CFSTR("is_writable"));
  objc_msgSend(v4, "encodeBool:forKey:", FileLocal::remove_lock_ownership(v6), CFSTR("is_locked"));

  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }

}

@end
