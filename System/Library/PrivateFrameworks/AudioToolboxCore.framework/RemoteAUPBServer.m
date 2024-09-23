@implementation RemoteAUPBServer

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RemoteAUPBServer;
  -[RemoteAUPBServer dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (serverRef=%p)"), -[NSXPCConnection description](self->xpcConnection, "description"), self->ref);
}

- (void)addSema:(id)a3
{
  id *value;
  __end_cap_ **var0;
  __end_cap_ **v7;
  __end_ **begin;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  __end_ **v14;
  __end_ *v15;

  var0 = self->replySemas.var0;
  value = self->replySemas.var1.__value_;
  if (var0 >= (__end_cap_ **)value)
  {
    begin = self->replySemas.__begin_;
    v9 = var0 - begin;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v11 = (char *)value - (char *)begin;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      if (v12 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v13 = (char *)operator new(8 * v12);
    }
    else
    {
      v13 = 0;
    }
    v14 = (__end_ **)&v13[8 * v9];
    *v14 = (__end_ *)a3;
    v7 = v14 + 1;
    if (var0 != begin)
    {
      do
      {
        v15 = *--var0;
        *--v14 = v15;
      }
      while (var0 != begin);
      var0 = self->replySemas.__begin_;
    }
    self->replySemas.__begin_ = v14;
    self->replySemas.var0 = v7;
    self->replySemas.var1.__value_ = (id *)&v13[8 * v12];
    if (var0)
      operator delete(var0);
  }
  else
  {
    *var0 = (__end_cap_ *)a3;
    v7 = var0 + 1;
  }
  self->replySemas.var0 = v7;
}

- (void)removeSema:(id)a3
{
  __end_cap_ **var0;
  __end_ **begin;
  int64_t v6;

  begin = self->replySemas.__begin_;
  var0 = self->replySemas.var0;
  if (begin != var0)
  {
    while (*begin != a3)
    {
      if (++begin == var0)
        return;
    }
    v6 = (char *)var0 - (char *)(begin + 1);
    if (var0 != begin + 1)
      memmove(begin, begin + 1, (char *)var0 - (char *)(begin + 1));
    self->replySemas.var0 = (__end_ **)((char *)begin + v6);
  }
}

- (void)signalAllSemaphores
{
  __end_cap_ **var0;
  __end_ **begin;
  __end_ **v4;
  NSObject *v5;
  __end_cap_ *v6;
  RemoteAUPBServer *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  __end_ **v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  begin = self->replySemas.__begin_;
  var0 = self->replySemas.var0;
  if (begin != var0)
  {
    v7 = self;
    v4 = self->replySemas.__begin_;
    while (gLogScope)
    {
      v5 = *(NSObject **)gLogScope;
      if (*(_QWORD *)gLogScope)
        goto LABEL_7;
LABEL_9:
      v6 = *begin++;
      dispatch_semaphore_signal((dispatch_semaphore_t)v6);
      ++v4;
      if (begin == var0)
      {
        self = v7;
        begin = v7->replySemas.__begin_;
        goto LABEL_11;
      }
    }
    v5 = MEMORY[0x1E0C81028];
LABEL_7:
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v9 = "AUPBClientManager.mm";
      v10 = 1024;
      v11 = 92;
      v12 = 2048;
      v13 = v4;
      _os_log_impl(&dword_18EE07000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Signaling an outstanding sema %p\n", buf, 0x1Cu);
    }
    goto LABEL_9;
  }
LABEL_11:
  self->replySemas.var0 = begin;
}

- (NSXPCConnection)xpcConnection
{
  return self->xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (AUPBServing)proxyInterface
{
  return self->proxyInterface;
}

- (void)setProxyInterface:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (OpaqueAUPBServer)ref
{
  return self->ref;
}

- (void)setRef:(OpaqueAUPBServer *)a3
{
  self->ref = a3;
}

- (void).cxx_destruct
{
  __end_ **begin;

  begin = self->replySemas.__begin_;
  if (begin)
  {
    self->replySemas.var0 = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

@end
