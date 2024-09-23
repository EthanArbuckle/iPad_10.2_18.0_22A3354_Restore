void MTLCompilerHelper::~MTLCompilerHelper(MTLCompilerHelper *this)
{
  JUMPOUT(0x212BBA040);
}

_QWORD *createCompilerHelper()
{
  _QWORD *result;

  result = (_QWORD *)operator new();
  *result = &off_24C9348B8;
  return result;
}

void MTLCompilerBuiltInFileReaderImpl::~MTLCompilerBuiltInFileReaderImpl(MTLCompilerBuiltInFileReaderImpl *this)
{
  MTLCompilerBuiltInFileReaderImpl::~MTLCompilerBuiltInFileReaderImpl(this);
  JUMPOUT(0x212BBA040);
}

{
  uint64_t v2;

  *(_QWORD *)this = &off_24C934908;
  v2 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  free(*((void **)this + 2));
  free(*((void **)this + 4));
}

MTLCompilerBuiltInFileReaderImpl *MTLCompilerHelper::openBuiltInFileReader(MTLCompilerHelper *this, char *a2)
{
  MTLCompilerBuiltInFileReaderImpl *v3;

  v3 = (MTLCompilerBuiltInFileReaderImpl *)operator new();
  *(_QWORD *)v3 = &off_24C934908;
  *((_DWORD *)v3 + 2) = 0;
  *((_QWORD *)v3 + 8) = 0;
  *((_OWORD *)v3 + 1) = 0u;
  *((_OWORD *)v3 + 2) = 0u;
  *((_QWORD *)v3 + 6) = 0;
  if (!MTLCompilerBuiltInFileReaderImpl::open(v3, a2))
  {
    (*(void (**)(MTLCompilerBuiltInFileReaderImpl *))(*(_QWORD *)v3 + 8))(v3);
    return 0;
  }
  return v3;
}

BOOL MTLCompilerBuiltInFileReaderImpl::open(MTLCompilerBuiltInFileReaderImpl *this, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  unint64_t v6;
  unsigned int v7;
  BOOL v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *__p[2];
  char v19;
  void **v20;
  __int16 v21;
  uint64_t v22;
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(__p, a2);
  v21 = 260;
  v20 = __p;
  llvm::MemoryBuffer::getFile();
  if (v19 < 0)
    operator delete(__p[0]);
  if ((v23 & 1) != 0)
  {
    v3 = v22;
    if ((_DWORD)v22)
    {
LABEL_19:
      v8 = 0;
      goto LABEL_20;
    }
  }
  else
  {
    std::system_category();
    v3 = v22;
  }
  v22 = 0;
  v4 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = v3;
  if (v4)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    v3 = *((_QWORD *)this + 5);
  }
  v5 = *(unsigned int **)(v3 + 8);
  *((_QWORD *)this + 6) = v5;
  v6 = *(_QWORD *)(v3 + 16) - (_QWORD)v5;
  *((_QWORD *)this + 7) = 4;
  *((_QWORD *)this + 8) = v6;
  if (v6 < 4)
    goto LABEL_19;
  v7 = *v5;
  if (!*v5)
    goto LABEL_19;
  StaticHashTable::init((MTLCompilerBuiltInFileReaderImpl *)((char *)this + 8), *v5);
  v8 = 0;
  v9 = 0;
  do
  {
    v10 = *((_QWORD *)this + 7);
    v11 = *((_QWORD *)this + 8);
    if (v10 >= v11)
      break;
    v12 = *((_QWORD *)this + 6);
    v13 = *((_QWORD *)this + 7);
    while (1)
    {
      v14 = v13 + 1;
      if (!*(_BYTE *)(v12 + v13))
        break;
      ++v13;
      if (v11 == v14)
        goto LABEL_20;
    }
    *((_QWORD *)this + 7) = v14;
    if (v13 + 5 > v11)
      break;
    v15 = *(_DWORD *)(v12 + v13 + 1);
    *((_QWORD *)this + 7) = v13 + 5;
    StaticHashTable::addFunction((uint64_t)this + 8, (const char *)(v12 + v10), v15);
    v8 = ++v9 >= v7;
  }
  while (v9 != v7);
LABEL_20:
  if ((v23 & 1) == 0)
  {
    v16 = v22;
    v22 = 0;
    if (v16)
      (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  }
  return v8;
}

void sub_20E3639FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  if ((a22 & 1) == 0)
  {
    if (a20)
      (*(void (**)(uint64_t))(*(_QWORD *)a20 + 8))(a20);
  }
  _Unwind_Resume(exception_object);
}

uint64_t StaticHashTable::addFunction(uint64_t this, const char *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  int v7;
  int v8;
  unsigned int v9;
  uint64_t v10;
  int v11;

  v3 = *(unsigned int *)(this + 16);
  v4 = *(_QWORD *)(this + 24) + 16 * v3;
  *(_DWORD *)v4 = -1;
  *(_DWORD *)(v4 + 4) = a3;
  *(_QWORD *)(v4 + 8) = a2;
  LOBYTE(v5) = *a2;
  if (*a2)
  {
    v6 = 0;
    v7 = 1;
    v8 = 1;
    do
    {
      v6 += v8 * (char)v5;
      v8 *= 2;
      v5 = a2[v7++];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  v9 = v6 % *(_DWORD *)this;
  v10 = *(_QWORD *)(this + 8);
  v11 = *(_DWORD *)(v10 + 4 * v9);
  *(_DWORD *)(v10 + 4 * v9) = v3;
  if (v11 != -1)
    *(_DWORD *)v4 = v11;
  ++*(_DWORD *)(this + 16);
  return this;
}

uint64_t MTLCompilerBuiltInFileReaderImpl::getBuiltinsModule(_QWORD *a1, int a2, char **a3)
{
  char *v3;
  char *v4;
  uint64_t v7;
  char *v8;
  uint64_t BuiltinModuleByName;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  llvm::Value *v16;
  size_t v17;
  void *Name;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t *v33;
  int v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  llvm::GlobalValue *v39;
  uint64_t v41;
  void *__p[2];
  uint64_t v43;
  void *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  _BYTE v48[24];
  _BYTE *v49;
  _BYTE v50[24];
  _BYTE *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = *a3;
  v4 = a3[1];
  if (*a3 == v4)
    return 0;
  v7 = 0;
  do
  {
    v8 = v3;
    if (v3[23] < 0)
      v8 = *(char **)v3;
    BuiltinModuleByName = MTLCompilerBuiltInFileReaderImpl::getBuiltinModuleByName(a1, a2, v8);
    if (BuiltinModuleByName)
    {
      if (!v7)
      {
        v7 = BuiltinModuleByName;
        goto LABEL_16;
      }
      v47 = BuiltinModuleByName;
      v51 = 0;
      v10 = llvm::Linker::linkModules();
      v11 = v51;
      if (v51 == v50)
      {
        v11 = v50;
        v12 = 4;
      }
      else
      {
        if (!v51)
        {
LABEL_13:
          v47 = 0;
          v13 = MEMORY[0x212BB9FC8]();
          MEMORY[0x212BBA040](v13, 0x10B2C407FF26C1CLL);
          if (v10)
            abort();
          goto LABEL_16;
        }
        v12 = 5;
      }
      (*(void (**)(void))(*v11 + 8 * v12))();
      goto LABEL_13;
    }
LABEL_16:
    v3 += 24;
  }
  while (v3 != v4);
  if (v7)
  {
    v45 = 0;
    v46 = 0;
    v44 = 0;
    v14 = v7 + 8;
    v15 = *(_QWORD *)(v7 + 16);
    if (v15 != v7 + 8)
    {
      do
      {
        if (v15)
          v16 = (llvm::Value *)(v15 - 56);
        else
          v16 = 0;
        if ((*((_BYTE *)v16 + 32) & 0xF) == 0)
        {
          Name = (void *)llvm::Value::getName(v16);
          if (Name)
          {
            std::string::basic_string[abi:ne180100](__p, Name, v17);
            if (v43 >= 0)
              v19 = (char *)__p;
            else
              v19 = (char *)__p[0];
          }
          else
          {
            __p[0] = 0;
            __p[1] = 0;
            v19 = (char *)__p;
            v43 = 0;
          }
          v20 = MTLCompilerBuiltInFileReaderImpl::getBuiltinModuleByName(a1, a2, v19);
          v21 = v20;
          if (v20)
          {
            v22 = v45;
            if (v45 >= v46)
            {
              v24 = ((char *)v45 - (_BYTE *)v44) >> 3;
              if ((unint64_t)(v24 + 1) >> 61)
                std::vector<llvm::Module *>::__throw_length_error[abi:ne180100]();
              v25 = ((char *)v46 - (_BYTE *)v44) >> 2;
              if (v25 <= v24 + 1)
                v25 = v24 + 1;
              if ((unint64_t)((char *)v46 - (_BYTE *)v44) >= 0x7FFFFFFFFFFFFFF8)
                v26 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v26 = v25;
              if (v26)
                v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Module *>>((uint64_t)&v46, v26);
              else
                v27 = 0;
              v28 = (uint64_t *)&v27[8 * v24];
              *v28 = v21;
              v23 = v28 + 1;
              v30 = (char *)v44;
              v29 = (char *)v45;
              if (v45 != v44)
              {
                do
                {
                  v31 = *((_QWORD *)v29 - 1);
                  v29 -= 8;
                  *--v28 = v31;
                }
                while (v29 != v30);
                v29 = (char *)v44;
              }
              v44 = v28;
              v45 = v23;
              v46 = (uint64_t *)&v27[8 * v26];
              if (v29)
                operator delete(v29);
            }
            else
            {
              *v45 = v20;
              v23 = v22 + 1;
            }
            v45 = v23;
          }
          if (SHIBYTE(v43) < 0)
            operator delete(__p[0]);
        }
        v15 = *(_QWORD *)(v15 + 8);
      }
      while (v15 != v14);
      v32 = (uint64_t *)v44;
      v33 = v45;
      while (v32 != v33)
      {
        v41 = *v32;
        v49 = 0;
        v34 = llvm::Linker::linkModules();
        v35 = v49;
        if (v49 == v48)
        {
          v35 = v48;
          v36 = 4;
LABEL_55:
          (*(void (**)(void))(*v35 + 8 * v36))();
        }
        else if (v49)
        {
          v36 = 5;
          goto LABEL_55;
        }
        if (v41)
        {
          v37 = MEMORY[0x212BB9FC8]();
          MEMORY[0x212BBA040](v37, 0x10B2C407FF26C1CLL);
        }
        if (v34)
          abort();
        ++v32;
        continue;
      }
    }
    for (i = *(_QWORD *)(v7 + 16); i != v14; i = *(_QWORD *)(i + 8))
    {
      if (i)
        v39 = (llvm::GlobalValue *)(i - 56);
      else
        v39 = 0;
      if (llvm::GlobalValue::isDeclaration(v39))
        llvm::GlobalValue::setLinkage((uint64_t)v39, 0);
      else
        *((_DWORD *)v39 + 8) = *((_DWORD *)v39 + 8) & 0xFFFFBFC0 | 0x4007;
    }
    if (v44)
    {
      v45 = (uint64_t *)v44;
      operator delete(v44);
    }
  }
  return v7;
}

void sub_20E363E70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, uint64_t a19, char a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  if (a16 < 0)
    operator delete(__p);
  if (a17)
    operator delete(a17);
  _Unwind_Resume(exception_object);
}

uint64_t MTLCompilerBuiltInFileReaderImpl::getBuiltinModuleByName(_QWORD *a1, int a2, char *__s2)
{
  unsigned int FunctionOffset;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  llvm::MemoryBuffer *v9;
  uint64_t v10[2];
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  FunctionOffset = StaticHashTable::findFunctionOffset((StaticHashTable *)(a1 + 1), __s2);
  if (FunctionOffset == -1)
    return 0;
  v5 = FunctionOffset + 4;
  v6 = a1[8];
  if (v5 > v6 || v6 < (*(_DWORD *)(a1[6] + FunctionOffset) + v5))
    return 0;
  llvm::MemoryBuffer::getMemBuffer();
  llvm::MemoryBuffer::getMemBufferRef(v9);
  llvm::parseBitcodeFile();
  llvm::expectedToErrorOrAndEmitErrors<std::unique_ptr<llvm::Module>>(v10, (uint64_t)&v11);
  llvm::Expected<std::unique_ptr<llvm::Module>>::~Expected((uint64_t)v10);
  if ((v12 & 1) != 0)
    v7 = 0;
  else
    v7 = v11;
  if (v9)
    (*(void (**)())(*(_QWORD *)v9 + 8))();
  return v7;
}

void sub_20E364064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  llvm::Expected<std::unique_ptr<llvm::Module>>::~Expected((uint64_t)va);
  if (a7)
    (*(void (**)(uint64_t))(*(_QWORD *)a7 + 8))(a7);
  _Unwind_Resume(a1);
}

uint64_t MTLCompilerBuiltInFileReaderImpl::getBuiltinsModuleForSourceModule(MTLCompilerBuiltInFileReaderImpl *this, llvm::Module *a2)
{
  uint64_t v3;
  char *v4;
  char *v5;
  llvm::Value *v6;
  size_t v7;
  void *Name;
  std::vector<std::string>::pointer end;
  __int128 v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  std::string *v14;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  uint64_t v18;
  void *__p[2];
  std::string::size_type v21;
  std::vector<std::string> v22;
  std::__split_buffer<std::string> __v;

  v3 = *(_QWORD *)a2;
  memset(&v22, 0, sizeof(v22));
  v4 = (char *)a2 + 24;
  v5 = (char *)*((_QWORD *)a2 + 4);
  if (v5 != (char *)a2 + 24)
  {
    do
    {
      if (v5)
        v6 = (llvm::Value *)(v5 - 56);
      else
        v6 = 0;
      if (llvm::GlobalValue::isDeclaration(v6))
      {
        Name = (void *)llvm::Value::getName(v6);
        if (Name)
        {
          std::string::basic_string[abi:ne180100](__p, Name, v7);
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          v21 = 0;
        }
        end = v22.__end_;
        if (v22.__end_ >= v22.__end_cap_.__value_)
        {
          v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)v22.__end_ - (char *)v22.__begin_) >> 3);
          v12 = v11 + 1;
          if (v11 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<llvm::Module *>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v22.__end_cap_.__value_ - (char *)v22.__begin_) >> 3) > v12)
            v12 = 0x5555555555555556 * (((char *)v22.__end_cap_.__value_ - (char *)v22.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v22.__end_cap_.__value_ - (char *)v22.__begin_) >> 3) >= 0x555555555555555)
            v13 = 0xAAAAAAAAAAAAAAALL;
          else
            v13 = v12;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v22.__end_cap_;
          if (v13)
            v14 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v22.__end_cap_, v13);
          else
            v14 = 0;
          v15 = v14 + v11;
          __v.__first_ = v14;
          __v.__begin_ = v15;
          __v.__end_cap_.__value_ = &v14[v13];
          v16 = *(_OWORD *)__p;
          v15->__r_.__value_.__r.__words[2] = v21;
          *(_OWORD *)&v15->__r_.__value_.__l.__data_ = v16;
          __p[1] = 0;
          v21 = 0;
          __p[0] = 0;
          __v.__end_ = v15 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v22, &__v);
          v17 = v22.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          v22.__end_ = v17;
          if (SHIBYTE(v21) < 0)
            operator delete(__p[0]);
        }
        else
        {
          v10 = *(_OWORD *)__p;
          v22.__end_->__r_.__value_.__r.__words[2] = v21;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v10;
          v22.__end_ = end + 1;
        }
      }
      v5 = (char *)*((_QWORD *)v5 + 1);
    }
    while (v5 != v4);
  }
  v18 = (*(uint64_t (**)(MTLCompilerBuiltInFileReaderImpl *, uint64_t, std::vector<std::string> *))(*(_QWORD *)this + 16))(this, v3, &v22);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v22;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  return v18;
}

void sub_20E364288(_Unwind_Exception *a1, void *__p, uint64_t a3, int a4, __int16 a5, char a6, char a7, char a8, uint64_t a9, char *__pa, std::__split_buffer<std::string> *a11, uint64_t a12, char a13)
{
  __pa = &a13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  _Unwind_Resume(a1);
}

uint64_t StaticHashTable::findFunctionOffset(StaticHashTable *this, const char *__s2)
{
  int v3;
  unsigned int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  LOBYTE(v3) = *__s2;
  if (*__s2)
  {
    v4 = 0;
    v5 = 1;
    v6 = 1;
    do
    {
      v4 += v6 * (char)v3;
      v6 *= 2;
      v3 = __s2[v5++];
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  v7 = *(unsigned int *)(*((_QWORD *)this + 1) + 4 * (v4 % *(_DWORD *)this));
  if ((_DWORD)v7 == -1)
    return 0xFFFFFFFFLL;
  v8 = *((_QWORD *)this + 3);
  while (1)
  {
    v9 = v8 + 16 * v7;
    if (!strcmp(*(const char **)(v9 + 8), __s2))
      break;
    v7 = *(unsigned int *)(v8 + 16 * v7);
    if ((_DWORD)v7 == -1)
      return 0xFFFFFFFFLL;
  }
  return *(unsigned int *)(v9 + 4);
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::string *v4;
  std::string *begin;
  std::string *end;
  std::string *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100]((uint64_t)this, (void **)&this->__begin_->__r_.__value_.__l.__data_);
  if (this->__first_)
    operator delete(this->__first_);
}

void *StaticHashTable::init(StaticHashTable *this, unsigned int a2)
{
  size_t v4;
  void *v5;
  size_t v6;
  void *v7;
  void *result;

  *(_DWORD *)this = a2;
  v4 = 4 * a2;
  v5 = malloc_type_malloc(v4, 0xD18EAAFEuLL);
  *((_QWORD *)this + 1) = v5;
  memset(v5, 255, v4);
  *((_DWORD *)this + 5) = a2;
  v6 = 16 * a2;
  v7 = malloc_type_malloc(v6, 0x4699452uLL);
  *((_QWORD *)this + 3) = v7;
  result = memset(v7, 255, v6);
  *((_DWORD *)this + 4) = 0;
  return result;
}

uint64_t deleteCompilerHelper(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

void StaticHashTable::~StaticHashTable(void **this)
{
  free(this[1]);
  free(this[3]);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

BOOL MTLCompilerBuiltInFileReaderImpl::readBytes(MTLCompilerBuiltInFileReaderImpl *this, void *__dst, size_t a3)
{
  uint64_t v3;
  size_t v4;
  size_t v5;

  v3 = *((_QWORD *)this + 7);
  v4 = *((_QWORD *)this + 8);
  v5 = v3 + a3;
  if (v3 + a3 <= v4)
  {
    memcpy(__dst, (const void *)(*((_QWORD *)this + 6) + v3), a3);
    *((_QWORD *)this + 7) += a3;
  }
  return v5 <= v4;
}

uint64_t MTLCompilerBuiltInFileReaderImpl::readString(MTLCompilerBuiltInFileReaderImpl *this)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *((_QWORD *)this + 7);
  v2 = *((_QWORD *)this + 8);
  if (v1 >= v2)
    return 0;
  v3 = *((_QWORD *)this + 6);
  v4 = *((_QWORD *)this + 7);
  while (*(unsigned __int8 *)(v3 + v4++))
  {
    if (v2 == v4)
      return 0;
  }
  *((_QWORD *)this + 7) = v4;
  return v3 + v1;
}

void llvm::expectedToErrorOrAndEmitErrors<std::unique_ptr<llvm::Module>>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((a1[1] & 1) != 0)
  {
    v4 = *a1;
    *a1 = 0;
    v7 = v4;
    v5 = llvm::errorToErrorCodeAndEmitErrors();
    *(_BYTE *)(a2 + 16) |= 1u;
    *(_QWORD *)a2 = v5;
    *(_QWORD *)(a2 + 8) = v6;
    if (v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
  else
  {
    *(_BYTE *)(a2 + 16) &= ~1u;
    v3 = *a1;
    *a1 = 0;
    *(_QWORD *)a2 = v3;
  }
}

void sub_20E364614(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
  _Unwind_Resume(exception_object);
}

uint64_t llvm::GlobalValue::setLinkage(uint64_t this, int a2)
{
  uint64_t v2;
  int v3;
  unsigned int v4;

  v2 = this;
  v3 = *(_DWORD *)(this + 32);
  if ((a2 - 7) < 2)
    v3 &= 0xFFFFFFCF;
  v4 = v3 & 0xFFFFFFF0 | a2 & 0xF;
  *(_DWORD *)(this + 32) = v4;
  if ((a2 & 0xFu) - 7 < 2)
    goto LABEL_7;
  if ((v3 & 0x30) != 0)
  {
    this = llvm::GlobalValue::hasExternalWeakLinkage((llvm::GlobalValue *)this);
    if ((this & 1) == 0)
    {
      v4 = *(_DWORD *)(v2 + 32);
LABEL_7:
      *(_DWORD *)(v2 + 32) = v4 | 0x4000;
    }
  }
  return this;
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24C9347F8, MEMORY[0x24BEDAAF0]);
}

void sub_20E3647A0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void llvm::function_ref<llvm::Optional<std::string> ()(llvm::StringRef)>::callback_fn<llvm::$_0>(_BYTE *a1@<X8>)
{
  *a1 = 0;
  a1[24] = 0;
}

uint64_t llvm::Expected<std::unique_ptr<llvm::Module>>::~Expected(uint64_t a1)
{
  uint64_t v2;

  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    v2 = *(_QWORD *)a1;
    *(_QWORD *)a1 = 0;
    if (v2)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  }
  else
  {
    std::unique_ptr<llvm::Module>::reset[abi:ne180100]((uint64_t *)a1, 0);
  }
  return a1;
}

uint64_t std::unique_ptr<llvm::Module>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    MEMORY[0x212BB9FC8]();
    JUMPOUT(0x212BBA040);
  }
  return result;
}

void std::vector<llvm::Module *>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<llvm::Module *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t llvm::MemoryBuffer::getMemBuffer()
{
  return MEMORY[0x24BED5990]();
}

uint64_t llvm::MemoryBuffer::getFile()
{
  return MEMORY[0x24BED59A8]();
}

uint64_t llvm::parseBitcodeFile()
{
  return MEMORY[0x24BED6050]();
}

uint64_t llvm::errorToErrorCodeAndEmitErrors()
{
  return MEMORY[0x24BED6608]();
}

uint64_t llvm::Linker::linkModules()
{
  return MEMORY[0x24BED6F90]();
}

void llvm::Module::~Module(llvm::Module *this)
{
  MEMORY[0x24BED70D8](this);
}

uint64_t llvm::GlobalValue::isDeclaration(llvm::GlobalValue *this)
{
  return MEMORY[0x24BED79A8](this);
}

uint64_t llvm::GlobalValue::hasExternalWeakLinkage(llvm::GlobalValue *this)
{
  return MEMORY[0x24BED79D0](this);
}

uint64_t llvm::MemoryBuffer::getMemBufferRef(llvm::MemoryBuffer *this)
{
  return MEMORY[0x24BED7B38](this);
}

uint64_t llvm::Value::getName(llvm::Value *this)
{
  return MEMORY[0x24BED7FE0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB0B0]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24C934810(__p);
}

uint64_t operator delete()
{
  return off_24C934818();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C934820(__sz);
}

uint64_t operator new()
{
  return off_24C934828();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

