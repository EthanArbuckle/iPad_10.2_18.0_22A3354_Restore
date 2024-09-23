@implementation DYDataFunctionStream

- (DYDataFunctionStream)init
{
  -[DYDataFunctionStream doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYDataFunctionStream)initWithData:(id)a3 error:(id *)a4
{
  return -[DYDataFunctionStream initWithData:header:error:](self, "initWithData:header:error:", a3, 0, a4);
}

- (DYDataFunctionStream)initWithData:(id)a3 header:(const void *)a4 error:(id *)a5
{
  char *v8;
  uint64_t *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  _QWORD v14[71];
  char v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)DYDataFunctionStream;
  v8 = -[DYDataFunctionStream init](&v16, sel_init);
  if (v8)
  {
    *((_QWORD *)v8 + 1) = a3;
    GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::Create((NSData *)a3, a4, a5, v14);
    v9 = (uint64_t *)(v8 + 16);
    std::shared_ptr<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>::operator=[abi:ne180100]((uint64_t)(v8 + 16), (__int128 *)v14);
    v10 = (std::__shared_weak_count *)v14[1];
    if (v14[1])
    {
      v11 = (unint64_t *)(v14[1] + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    if (*v9)
    {
      GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator((uint64_t)v14, *v9, *(_QWORD *)(*v9 + 16));
      *(_OWORD *)(v8 + 568) = *(_OWORD *)&v14[67];
      *(_OWORD *)(v8 + 584) = *(_OWORD *)&v14[69];
      v8[600] = v15;
      GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v14);
      *(_OWORD *)(v8 + 1144) = *(_OWORD *)(v8 + 568);
      *(_OWORD *)(v8 + 1160) = *(_OWORD *)(v8 + 584);
      v8[1176] = v8[600];
    }
    else
    {

      return 0;
    }
  }
  return (DYDataFunctionStream *)v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYDataFunctionStream;
  -[DYDataFunctionStream dealloc](&v3, sel_dealloc);
}

- (BOOL)swapsByteOrder
{
  return *(_BYTE *)(*((_QWORD *)self + 2) + 36);
}

- (void)reset
{
  *((_QWORD *)self + 71) = *((_QWORD *)self + 143);
  *((_OWORD *)self + 36) = *((_OWORD *)self + 72);
  *((_QWORD *)self + 74) = *((_QWORD *)self + 146);
  *((_BYTE *)self + 600) = *((_BYTE *)self + 1176);
}

- (void)setResetMarker
{
  *((_QWORD *)self + 143) = *((_QWORD *)self + 71);
  *((_OWORD *)self + 72) = *((_OWORD *)self + 36);
  *((_QWORD *)self + 146) = *((_QWORD *)self + 74);
  *((_BYTE *)self + 1176) = *((_BYTE *)self + 600);
}

- (void)clearResetMarker
{
  _QWORD v3[68];
  __int128 v4;
  uint64_t v5;
  char v6;

  GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator((uint64_t)v3, *((_QWORD *)self + 2), *(_QWORD *)(*((_QWORD *)self + 2) + 16));
  *((_QWORD *)self + 143) = v3[67];
  *((_OWORD *)self + 72) = v4;
  *((_QWORD *)self + 146) = v5;
  *((_BYTE *)self + 1176) = v6;
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v3);
}

- (BOOL)resetToFunction:(const Function *)a3
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  BOOL v8;
  _BYTE v10[536];
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  char v14;

  v4 = *((_QWORD *)self + 2);
  v5 = *((_QWORD *)a3 + 55);
  if (v5 < *(_QWORD *)(v4 + 24) && v5 >= *(_QWORD *)(v4 + 16))
    v7 = *((_QWORD *)a3 + 55);
  else
    v7 = *(_QWORD *)(v4 + 24);
  GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator((uint64_t)v10, v4, v7);
  *((_QWORD *)self + 71) = v11;
  *((_OWORD *)self + 36) = v12;
  *((_QWORD *)self + 74) = v13;
  *((_BYTE *)self + 600) = v14;
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v10);
  GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator((uint64_t)v10, *((_QWORD *)self + 2), *(_QWORD *)(*((_QWORD *)self + 2) + 24));
  v8 = *((_QWORD *)self + 71) != v11;
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v10);
  return v8;
}

- (const)peekFunction
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[72];

  v2 = (char *)self + 32;
  GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator((uint64_t)v6, *((_QWORD *)self + 2), *(_QWORD *)(*((_QWORD *)self + 2) + 24));
  v3 = *((_QWORD *)v2 + 67);
  v4 = v6[67];
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v6);
  if (v3 == v4)
    return 0;
  if (*(_DWORD *)v2 == -1 || *((_QWORD *)v2 + 68) == *((_QWORD *)v2 + 67))
    GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_decode((uint64_t)v2);
  return (const Function *)v2;
}

- (const)readFunction
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[72];

  v2 = (char *)self + 32;
  GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator((uint64_t)v6, *((_QWORD *)self + 2), *(_QWORD *)(*((_QWORD *)self + 2) + 24));
  v3 = *((_QWORD *)v2 + 67);
  v4 = v6[67];
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v6);
  if (v3 == v4)
    return 0;
  if (*(_DWORD *)v2 == -1 || *((_QWORD *)v2 + 68) == *((_QWORD *)v2 + 67))
    GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_decode((uint64_t)v2);
  GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::operator++((uint64_t)v2);
  return (const Function *)v2;
}

- (unint64_t)readFunctions:(Function *)a3 maxCount:(unint64_t)a4
{
  unint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[72];

  GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator((uint64_t)v11, *((_QWORD *)self + 2), *(_QWORD *)(*((_QWORD *)self + 2) + 24));
  v7 = 0;
  if (a4)
  {
    v8 = (char *)self + 32;
    while (1)
    {
      v9 = *((_QWORD *)v8 + 67);
      if (v9 == v11[67])
        break;
      if (*(_DWORD *)v8 == -1 || *((_QWORD *)v8 + 68) == v9)
        GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_decode((uint64_t)v8);
      GPUTools::FD::Function::operator=();
      GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::operator++((uint64_t)v8);
      ++v7;
      a3 = (Function *)((char *)a3 + 536);
      if (a4 == v7)
      {
        v7 = a4;
        break;
      }
    }
  }
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v11);
  return v7;
}

- (NSData)data
{
  return (NSData *)*((_QWORD *)self + 1);
}

- (void).cxx_destruct
{
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)((char *)self + 608));
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)((char *)self + 32));
  std::shared_ptr<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>::~shared_ptr[abi:ne180100]((uint64_t)self + 16);
}

- (id).cxx_construct
{
  uint64_t v3;
  uint64_t v4;

  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  v3 = GPUTools::FD::Function::Function((GPUTools::FD::Function *)((char *)self + 32));
  *(_OWORD *)(v3 + 536) = 0u;
  *(_OWORD *)(v3 + 552) = 0u;
  v4 = GPUTools::FD::Function::Function((GPUTools::FD::Function *)((char *)self + 608));
  *(_OWORD *)(v4 + 536) = 0u;
  *(_OWORD *)(v4 + 552) = 0u;
  return self;
}

@end
