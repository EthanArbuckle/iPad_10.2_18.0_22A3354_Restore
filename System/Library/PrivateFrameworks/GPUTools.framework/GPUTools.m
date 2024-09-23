void sub_23C696474(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_23C6965D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23C696734(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_23C6968A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void std::vector<unsigned int>::resize(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __sz)
{
  std::vector<unsigned int>::size_type v2;

  v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2)
      this->__end_ = &this->__begin_[__sz];
  }
  else
  {
    std::vector<unsigned int>::__append(this, __sz - v2);
  }
}

void sub_23C699188(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<unsigned long long>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_QWORD *)v11 - 1);
        v11 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void sub_23C6993DC(_Unwind_Exception *a1, volatile int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)&a9, a2);
  _Unwind_Resume(a1);
}

void sub_23C699634(_Unwind_Exception *a1, volatile int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)&a9, a2);
  _Unwind_Resume(a1);
}

void sub_23C699D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_23C699E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_semaphore_t dsema)
{
  dispatch_semaphore_signal(dsema);
  _Unwind_Resume(a1);
}

void sub_23C69A0B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_23C69A228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, dispatch_semaphore_t dsema)
{
  dispatch_semaphore_signal(dsema);
  _Unwind_Resume(a1);
}

void sub_23C69A364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_semaphore_t dsema)
{
  dispatch_semaphore_signal(dsema);
  _Unwind_Resume(a1);
}

void sub_23C69A940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_semaphore_t dsema)
{
  dispatch_semaphore_signal(dsema);
  _Unwind_Resume(a1);
}

void sub_23C69A9E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_semaphore_t dsema)
{
  dispatch_semaphore_signal(dsema);
  _Unwind_Resume(a1);
}

void sub_23C69B070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_semaphore_t dsema)
{
  dispatch_semaphore_signal(dsema);
  _Unwind_Resume(a1);
}

void sub_23C69B64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_semaphore_t dsema)
{
  dispatch_semaphore_signal(dsema);
  _Unwind_Resume(a1);
}

void sub_23C69B890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23C69BA20(_Unwind_Exception *a1)
{
  uint64_t v1;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_23C69C1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_23C69C24C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_semaphore_t dsema)
{
  dispatch_semaphore_signal(dsema);
  _Unwind_Resume(a1);
}

void sub_23C69C3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_23C69C610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, dispatch_semaphore_t dsema)
{
  dispatch_semaphore_signal(dsema);
  _Unwind_Resume(a1);
}

void std::vector<DYCaptureArchiveCacheEntry>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 5;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 32 * a2;
  }
  else
  {
    std::vector<DYCaptureArchiveCacheEntry>::__append((void **)a1, a2 - v2);
  }
}

void sub_23C69C828(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24262211C](v1, 0x20C4093837F09);
  _Unwind_Resume(a1);
}

void sub_23C69D538(_Unwind_Exception *a1, volatile int *a2)
{
  GPUTools::DYLockUtils *v2;

  GPUTools::DYLockUtils::Unlock(v2, a2);
  _Unwind_Resume(a1);
}

void sub_23C69D5E0(_Unwind_Exception *a1, volatile int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)&a9, a2);
  _Unwind_Resume(a1);
}

void sub_23C69D828(_Unwind_Exception *a1, volatile int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)&a9, a2);
  _Unwind_Resume(a1);
}

void sub_23C69D988(_Unwind_Exception *a1, volatile int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)&a9, a2);
  _Unwind_Resume(a1);
}

void sub_23C69DB94(_Unwind_Exception *a1, volatile int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)&a9, a2);
  _Unwind_Resume(a1);
}

void sub_23C69DCD4(_Unwind_Exception *a1, volatile int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)&a9, a2);
  _Unwind_Resume(a1);
}

void sub_23C69DE4C(_Unwind_Exception *a1, volatile int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)&a9, a2);
  _Unwind_Resume(a1);
}

void sub_23C69E048(_Unwind_Exception *a1, volatile int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)&a9, a2);
  _Unwind_Resume(a1);
}

void sub_23C69E0D8(_Unwind_Exception *a1, volatile int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)&a9, a2);
  _Unwind_Resume(a1);
}

void sub_23C69E274(_Unwind_Exception *a1, volatile int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)&a9, a2);
  _Unwind_Resume(a1);
}

void sub_23C69E3B8(_Unwind_Exception *a1, volatile int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  AutoReaderLock::~AutoReaderLock((AutoReaderLock *)&a9, a2);
  _Unwind_Resume(a1);
}

void AutoReaderLock::AutoReaderLock(uint64_t a1, AutoReaderLock *this, uint64_t a3, uint64_t a4)
{
  volatile int *v6;
  _DWORD *v7;

  *(_QWORD *)a1 = this;
  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = a4;
  GPUTools::DYLockUtils::Lock(this, (volatile int *)this);
  v7 = *(_DWORD **)(a1 + 16);
  if (!(*v7)++)
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 8), 0xFFFFFFFFFFFFFFFFLL);
  GPUTools::DYLockUtils::Unlock(this, v6);
}

void AutoReaderLock::~AutoReaderLock(AutoReaderLock *this, volatile int *a2)
{
  GPUTools::DYLockUtils *v3;
  volatile int *v4;
  _DWORD *v5;

  v3 = *(GPUTools::DYLockUtils **)this;
  GPUTools::DYLockUtils::Lock(*(GPUTools::DYLockUtils **)this, a2);
  v5 = (_DWORD *)*((_QWORD *)this + 2);
  if ((*v5)-- == 1)
  {
    dispatch_semaphore_signal(*((dispatch_semaphore_t *)this + 1));
    v5 = (_DWORD *)*((_QWORD *)this + 2);
  }
  if ((*v5 & 0x80000000) != 0)
    __assert_rtn("AutoReaderLock::~AutoReaderLock()", "", 0, "*_blocking_readers >= 0");
  GPUTools::DYLockUtils::Unlock(v3, v4);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::vector<unsigned int>::__append(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  std::__compressed_pair<unsigned int *> *p_end_cap;
  unsigned int *v5;
  unsigned int *value;
  unsigned int *end;
  std::vector<unsigned int>::pointer begin;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  unsigned int *v16;
  unsigned int *v17;
  int v18;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v5 = value;
  end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    begin = this->__begin_;
    v9 = (char *)end - (char *)this->__begin_;
    v10 = __n + (v9 >> 2);
    if (v10 >> 62)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 2;
    v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)p_end_cap, v13);
      begin = this->__begin_;
      end = this->__end_;
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = (unsigned int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    v17 = (unsigned int *)&v15[4 * __n];
    while (end != begin)
    {
      v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<unsigned int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
      operator delete(begin);
  }
}

void std::vector<unsigned int>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_23C69EC60(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *,false>(uint64_t result, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  char v18;
  BOOL v19;
  uint64_t v20;

  v8 = (uint64_t *)result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = a2 - v9;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        result = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
        if ((_DWORD)result)
        {
          v20 = *v9;
          *v9 = *(a2 - 1);
          *(a2 - 1) = v20;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(v9, v9 + 1, a2 - 1, a3);
      case 4uLL:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(v9, v9 + 1, v9 + 2, a2 - 1, a3);
      case 5uLL:
        return std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(v9, v9 + 1, v9 + 2, v9 + 3, a2 - 1, a3);
      default:
        if (v12 <= 191)
        {
          if ((a5 & 1) != 0)
            return std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>((uint64_t)v9, a2, a3);
          else
            return std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>((uint64_t)v9, a2, a3);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[v13 >> 1];
          if ((unint64_t)v12 < 0x401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(&v9[v13 >> 1], v9, a2 - 1, a3);
            if ((a5 & 1) != 0)
              goto LABEL_12;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(v9, &v9[v13 >> 1], a2 - 1, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(v9 + 1, v15 - 1, a2 - 2, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(v9 + 2, &v9[v14 + 1], a2 - 3, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(v15 - 1, v15, &v9[v14 + 1], a3);
            v16 = *v9;
            *v9 = *v15;
            *v15 = v16;
            if ((a5 & 1) != 0)
              goto LABEL_12;
          }
          if (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0)
          {
            result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,unsigned long long *,BOOL({block_pointer}&)(unsigned long long,unsigned long long)>(v9, a2, a3);
            v9 = (uint64_t *)result;
            goto LABEL_17;
          }
LABEL_12:
          v17 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,unsigned long long *,BOOL({block_pointer}&)(unsigned long long,unsigned long long)>(v9, a2, a3);
          if ((v18 & 1) == 0)
            goto LABEL_15;
          v19 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(v9, v17, a3);
          v9 = v17 + 1;
          result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(v17 + 1, a2, a3);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v19)
              continue;
LABEL_15:
            result = std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *,false>(v8, v17, a3, -v11, a5 & 1);
            v9 = v17 + 1;
LABEL_17:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = v17;
          if (v19)
            return result;
          goto LABEL_2;
        }
        if (v9 != a2)
          return (uint64_t)std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *,unsigned long long *>(v9, a2, a2, a3);
        return result;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(uint64_t result, uint64_t *a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  if ((uint64_t *)result != a2)
  {
    v4 = (_QWORD *)result;
    v5 = (uint64_t *)(result + 8);
    if ((uint64_t *)(result + 8) != a2)
    {
      v7 = 0;
      do
      {
        v8 = v5;
        result = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
        if ((_DWORD)result)
        {
          v9 = *v8;
          v10 = v7;
          while (1)
          {
            *(_QWORD *)((char *)v4 + v10 + 8) = *(_QWORD *)((char *)v4 + v10);
            if (!v10)
              break;
            result = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
            v10 -= 8;
            if ((result & 1) == 0)
            {
              v11 = (_QWORD *)((char *)v4 + v10 + 8);
              goto LABEL_10;
            }
          }
          v11 = v4;
LABEL_10:
          *v11 = v9;
        }
        v5 = v8 + 1;
        v7 += 8;
      }
      while (v8 + 1 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(uint64_t result, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  if ((_QWORD *)result != a2)
  {
    v4 = (_QWORD *)(result + 8);
    if ((_QWORD *)(result + 8) != a2)
    {
      do
      {
        v6 = v4;
        result = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
        if ((_DWORD)result)
        {
          v7 = *v6;
          v8 = v6;
          do
          {
            v9 = v8;
            v10 = *--v8;
            *v9 = v10;
            result = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
          }
          while ((result & 1) != 0);
          *v8 = v7;
        }
        v4 = v6 + 1;
      }
      while (v6 + 1 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = (*(uint64_t (**)(void))(*(_QWORD *)a4 + 16))();
  result = (*(uint64_t (**)(void))(*(_QWORD *)a4 + 16))();
  if ((v8 & 1) == 0)
  {
    if (!(_DWORD)result)
      return result;
    v11 = *a2;
    *a2 = *a3;
    *a3 = v11;
    if (!(*(unsigned int (**)(void))(*(_QWORD *)a4 + 16))())
      return 1;
    v12 = *a1;
    *a1 = *a2;
    *a2 = v12;
    return 2;
  }
  v10 = *a1;
  if (!(_DWORD)result)
  {
    *a1 = *a2;
    *a2 = v10;
    if (!(*(unsigned int (**)(void))(*(_QWORD *)a4 + 16))())
      return 1;
    v13 = *a2;
    *a2 = *a3;
    *a3 = v13;
    return 2;
  }
  *a1 = *a3;
  *a3 = v10;
  return 1;
}

uint64_t *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,unsigned long long *,BOOL({block_pointer}&)(unsigned long long,unsigned long long)>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;

  v6 = *a1;
  if (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0)
  {
    v7 = a1;
    do
      ++v7;
    while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0);
  }
  else
  {
    v8 = a1 + 1;
    do
    {
      v7 = v8;
      if (v8 >= a2)
        break;
      ++v8;
    }
    while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))());
  }
  if (v7 < a2)
  {
    do
      --a2;
    while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
  }
  while (v7 < a2)
  {
    v9 = *v7;
    *v7 = *a2;
    *a2 = v9;
    do
      ++v7;
    while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))());
    do
      --a2;
    while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
  }
  if (v7 - 1 != a1)
    *a1 = *(v7 - 1);
  *(v7 - 1) = v6;
  return v7;
}

uint64_t *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,unsigned long long *,BOOL({block_pointer}&)(unsigned long long,unsigned long long)>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;

  v6 = 0;
  v7 = *a1;
  do
    ++v6;
  while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
  v8 = &a1[v6];
  v9 = &a1[v6 - 1];
  if (v6 == 1)
  {
    do
    {
      if (v8 >= a2)
        break;
      --a2;
    }
    while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0);
  }
  else
  {
    do
      --a2;
    while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))());
  }
  if (v8 < a2)
  {
    v10 = &a1[v6];
    v11 = a2;
    do
    {
      v12 = *v10;
      *v10 = *v11;
      *v11 = v12;
      do
        ++v10;
      while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
      do
        --v11;
      while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))());
    }
    while (v10 < v11);
    v9 = v10 - 1;
  }
  if (v9 != a1)
    *a1 = *v9;
  *v9 = v7;
  return v9;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;

  v6 = a2 - a1;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
      {
        v8 = *a1;
        *a1 = *(a2 - 1);
        *(a2 - 1) = v8;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(a1, a1 + 1, a2 - 1, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(a1, a1 + 1, a1 + 2, a2 - 1, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1, a3);
      return 1;
    default:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(a1, a1 + 1, a1 + 2, a3);
      v9 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v10 = 0;
      v11 = 0;
      break;
  }
  while (1)
  {
    if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
    {
      v12 = *v9;
      v13 = v10;
      while (1)
      {
        *(uint64_t *)((char *)a1 + v13 + 24) = *(uint64_t *)((char *)a1 + v13 + 16);
        if (v13 == -16)
          break;
        v13 -= 8;
        if (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0)
        {
          v14 = (uint64_t *)((char *)a1 + v13 + 24);
          goto LABEL_12;
        }
      }
      v14 = a1;
LABEL_12:
      *v14 = v12;
      if (++v11 == 8)
        return v9 + 1 == a2;
    }
    v10 += 8;
    if (++v9 == a2)
      return 1;
  }
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(a1, a2, a3, a5);
  result = (*(uint64_t (**)(void))(*(_QWORD *)a5 + 16))();
  if ((_DWORD)result)
  {
    v11 = *a3;
    *a3 = *a4;
    *a4 = v11;
    result = (*(uint64_t (**)(void))(*(_QWORD *)a5 + 16))();
    if ((_DWORD)result)
    {
      v12 = *a2;
      *a2 = *a3;
      *a3 = v12;
      result = (*(uint64_t (**)(void))(*(_QWORD *)a5 + 16))();
      if ((_DWORD)result)
      {
        v13 = *a1;
        *a1 = *a2;
        *a2 = v13;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(a1, a2, a3, a4, a6);
  result = (*(uint64_t (**)(void))(*(_QWORD *)a6 + 16))();
  if ((_DWORD)result)
  {
    v13 = *a4;
    *a4 = *a5;
    *a5 = v13;
    result = (*(uint64_t (**)(void))(*(_QWORD *)a6 + 16))();
    if ((_DWORD)result)
    {
      v14 = *a3;
      *a3 = *a4;
      *a4 = v14;
      result = (*(uint64_t (**)(void))(*(_QWORD *)a6 + 16))();
      if ((_DWORD)result)
      {
        v15 = *a2;
        *a2 = *a3;
        *a3 = v15;
        result = (*(uint64_t (**)(void))(*(_QWORD *)a6 + 16))();
        if ((_DWORD)result)
        {
          v16 = *a1;
          *a1 = *a2;
          *a2 = v16;
        }
      }
    }
  }
  return result;
}

uint64_t *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *,unsigned long long *>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;

  if (a1 != a2)
  {
    v8 = (char *)a2 - (char *)a1;
    v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = &a1[v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        if ((*(unsigned int (**)(void))(*(_QWORD *)a4 + 16))())
        {
          v15 = *v14;
          *v14 = *a1;
          *a1 = v15;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 9)
    {
      v16 = (unint64_t)v8 >> 3;
      v17 = a2 - 1;
      do
      {
        v18 = *a1;
        v19 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(a1, a4, v16);
        if (v17 == v19)
        {
          *v19 = v18;
        }
        else
        {
          *v19 = *v17;
          *v17 = v18;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>((uint64_t)a1, (uint64_t)(v19 + 1), a4, v19 + 1 - a1);
        }
        --v17;
      }
      while (v16-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  unint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;

  v4 = a3 - 2;
  if (a3 >= 2)
  {
    v5 = a4;
    v6 = result;
    v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 3)
    {
      v10 = ((uint64_t)a4 - result) >> 2;
      v11 = v10 + 1;
      v12 = (uint64_t *)(result + 8 * (v10 + 1));
      v13 = v10 + 2;
      if (v10 + 2 < a3 && (*(unsigned int (**)(void))(*(_QWORD *)a2 + 16))())
      {
        ++v12;
        v11 = v13;
      }
      result = (*(uint64_t (**)(void))(*(_QWORD *)a2 + 16))();
      if ((result & 1) == 0)
      {
        v14 = *v5;
        do
        {
          v15 = v12;
          *v5 = *v12;
          if (v7 < v11)
            break;
          v16 = (2 * v11) | 1;
          v12 = (uint64_t *)(v6 + 8 * v16);
          if (2 * v11 + 2 < a3)
          {
            if ((*(unsigned int (**)(void))(*(_QWORD *)a2 + 16))())
            {
              ++v12;
              v16 = 2 * v11 + 2;
            }
          }
          result = (*(uint64_t (**)(void))(*(_QWORD *)a2 + 16))();
          v5 = v15;
          v11 = v16;
        }
        while (!(_DWORD)result);
        *v15 = v14;
      }
    }
  }
  return result;
}

_QWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = 0;
  v7 = a3 - 2;
  if (a3 < 2)
    v7 = a3 - 1;
  v8 = v7 >> 1;
  do
  {
    v9 = &a1[v6 + 1];
    v10 = (2 * v6) | 1;
    v11 = 2 * v6 + 2;
    if (v11 < a3 && (*(unsigned int (**)(void))(*(_QWORD *)a2 + 16))())
    {
      ++v9;
      v10 = v11;
    }
    *a1 = *v9;
    a1 = v9;
    v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(unsigned long long,unsigned long long),unsigned long long *>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v6 = result;
    v7 = v4 >> 1;
    v8 = (uint64_t *)(result + 8 * (v4 >> 1));
    v9 = (uint64_t *)(a2 - 8);
    result = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
    if ((_DWORD)result)
    {
      v10 = *v9;
      do
      {
        v11 = v8;
        *v9 = *v8;
        if (!v7)
          break;
        v7 = (v7 - 1) >> 1;
        v8 = (uint64_t *)(v6 + 8 * v7);
        result = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
        v9 = v11;
      }
      while ((result & 1) != 0);
      *v11 = v10;
    }
  }
  return result;
}

void std::vector<DYCaptureArchiveCacheEntry>::__append(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 5)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 32 * a2);
      v7 += 32 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 5);
    if (v9 >> 59)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 5;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 4 > v9)
      v9 = v11 >> 4;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0)
      v12 = 0x7FFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<DYCaptureArchiveCacheEntry>>(v4, v12);
    else
      v13 = 0;
    v14 = &v13[32 * v10];
    v15 = &v13[32 * v12];
    bzero(v14, 32 * a2);
    v16 = &v14[32 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        v19 = *((_OWORD *)v17 - 1);
        *((_OWORD *)v14 - 2) = *((_OWORD *)v17 - 2);
        *((_OWORD *)v14 - 1) = v19;
        v14 -= 32;
        v17 -= 32;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<DYCaptureArchiveCacheEntry>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

uint64_t std::__thread_proxy[abi:ne180100]<std::tuple<std::unique_ptr<std::__thread_struct>,-[DYCaptureArchive cacheAllResources]::$_0>>(uint64_t *a1)
{
  std::__thread_specific_ptr<std::__thread_struct> *v1;
  const void *v2;
  unint64_t *v3;
  unint64_t v4;
  unint64_t *v5;
  unsigned int *v6;
  const void **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = (const void **)a1;
  v1 = std::__thread_local_data();
  v2 = *v8;
  *v8 = 0;
  pthread_setspecific(v1->__key_, v2);
  v3 = (unint64_t *)((char *)v8[1] + 280);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 + 1, v3));
  while (1)
  {
    v6 = (unsigned int *)v8[1];
    if (v4 >= v6[11])
      break;
    v10 = 0;
    v11 = 0;
    v9 = 0;
    if (objc_msgSend(v6, "requestDataForFilePosition:buffer:size:error:", v4, &v11, &v10, &v9))
      objc_msgSend((id)v8[1], "releaseBytesForFilePosition:", v4);
    v5 = (unint64_t *)((char *)v8[1] + 280);
    do
      v4 = __ldaxr(v5);
    while (__stlxr(v4 + 1, v5));
  }
  std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,-[DYCaptureArchive cacheAllResources]::$_0>>::~unique_ptr[abi:ne180100]((uint64_t **)&v8);
  return 0;
}

void sub_23C69FE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9)
{
  std::unique_ptr<std::tuple<std::unique_ptr<std::__thread_struct>,-[DYCaptureArchive cacheAllResources]::$_0>>::~unique_ptr[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

uint64_t std::unique_ptr<std::__thread_struct>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    MEMORY[0x2426220A4]();
    JUMPOUT(0x24262211CLL);
  }
  return result;
}

uint64_t DYHarvesterInitMetadata(uint64_t result, __int16 a2, int a3)
{
  *(_QWORD *)result = 0x63617074757265;
  *(_WORD *)(result + 8) = 2;
  *(_WORD *)(result + 10) = a2;
  *(_DWORD *)(result + 12) = a3;
  *(_QWORD *)(result + 16) = 0;
  return result;
}

uint64_t DYHarvesterGetMetadataSize(uint64_t result)
{
  if (result)
  {
    if (*(_WORD *)(result + 8) == 1)
      return *(int *)(result + 12) + 16;
    else
      return *(int *)(result + 12);
  }
  return result;
}

_QWORD *DYHarvesterGetMetadata(_QWORD *result)
{
  if (result)
  {
    if (*result != 0x63617074757265)
      return 0;
  }
  return result;
}

uint64_t DYHarvesterGetDataSize(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a1 && *(_QWORD *)a1 == 0x63617074757265)
  {
    v2 = *(int *)(a1 + 12);
    if (*(_WORD *)(a1 + 8) == 1)
      v2 += 16;
    a2 -= v2;
  }
  return a2;
}

uint64_t DYHarvesterGetOffset(uint64_t result)
{
  if (result)
  {
    if (*(_QWORD *)result == 0x63617074757265)
    {
      if (*(_WORD *)(result + 8) == 1)
        return *(int *)(result + 12) + 16;
      else
        return *(int *)(result + 12);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t DYHarvesterGetData(uint64_t result)
{
  uint64_t v1;

  if (result && *(_QWORD *)result == 0x63617074757265)
  {
    v1 = *(int *)(result + 12);
    if (*(_WORD *)(result + 8) == 1)
      v1 += 16;
    result += v1;
  }
  return result;
}

unint64_t DYHarvesterGetTextureMetadataRequiredSize(uint64_t a1)
{
  return (48 * a1 + 279) & 0xFFFFFFFFFFFFFF00;
}

uint64_t DYHarvesterGetTexturePlaneCount(uint64_t result)
{
  if (result)
  {
    if (*(_WORD *)(result + 10) == 1)
      return *(_QWORD *)(result + 16);
    else
      return 0;
  }
  return result;
}

uint64_t DYHarvesterGetTexturePlane(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (*(_WORD *)(result + 10) == 1)
    {
      if (*(_QWORD *)(result + 16) >= a2)
        result += 48 * a2 + 24;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

__n128 DYHarvesterAddTexturePlane(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  __n128 result;
  __int128 v4;

  v2 = a1 + 48 * *(_QWORD *)(a1 + 16);
  v4 = *a2;
  result = (__n128)a2[1];
  *(_OWORD *)(v2 + 56) = a2[2];
  *(_OWORD *)(v2 + 24) = v4;
  *(__n128 *)(v2 + 40) = result;
  ++*(_QWORD *)(a1 + 16);
  return result;
}

uint64_t MetalPluginTarget(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  int v6;
  unsigned int v7;
  int v9;
  int v10;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (!objc_msgSend(a1, "hasPrefix:", CFSTR("AGXMetal")))
    return 0xFFFFFFFFLL;
  v2 = (void *)objc_msgSend(a1, "substringFromIndex:", objc_msgSend(CFSTR("AGXMetal"), "length"));
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = v2;
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("G")) & 1) == 0
    && (objc_msgSend(v3, "hasPrefix:", CFSTR("A")) & 1) == 0
    && !objc_msgSend(v3, "hasPrefix:", CFSTR("1")))
  {
    return 0xFFFFFFFFLL;
  }
  v4 = objc_msgSend(v3, "UTF8String");
  v5 = objc_msgSend(v3, "hasPrefix:", CFSTR("1")) ^ 1;
  if (objc_msgSend(v3, "length") <= v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    do
    {
      v7 = *(char *)(v4 + v5) - 48;
      if (v7 > 9)
        break;
      v6 = v7 + 10 * v6;
      ++v5;
    }
    while (v5 < objc_msgSend(v3, "length"));
    if (v6 == 15)
    {
      if (v5 < objc_msgSend(v3, "length") && objc_msgSend(v3, "characterAtIndex:", v5) == 95
        || v5 == objc_msgSend(v3, "length"))
      {
        v6 = 14;
      }
      else
      {
        v6 = 15;
      }
    }
  }
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("A")))
    v9 = -11;
  else
    v9 = -10;
  v10 = v9 + v6;
  if (v10 < 0)
    return 0xFFFFFFFFLL;
  else
    return v10;
}

void sub_23C6A16C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)va);
  _Unwind_Resume(a1);
}

void sub_23C6A16D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)va);
  _Unwind_Resume(a1);
}

void sub_23C6A16E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)va);
  _Unwind_Resume(a1);
}

void sub_23C6A16FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24262211C](v1, 0x10A0C400E74B245);
  _Unwind_Resume(a1);
}

void sub_23C6A1720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::unique_ptr<GPUTools::Playback::FunctionStreamEntry>::~unique_ptr[abi:ne180100]((id **)va);
  _Unwind_Resume(a1);
}

void sub_23C6A1734(_Unwind_Exception *a1)
{
  GPUTools::Playback::DecodedFunctionStream **v1;
  GPUTools::Playback::DecodedFunctionStream *v3;

  v3 = *v1;
  *v1 = 0;
  if (v3)
    -[DYPlaybackEngineFSEBuilder visitFunctionStreamFile:].cold.1(v3);
  MEMORY[0x24262211C](v1, 0x10A0C4060767DF9);
  _Unwind_Resume(a1);
}

id **std::unique_ptr<GPUTools::Playback::FunctionStreamEntry>::~unique_ptr[abi:ne180100](id **a1)
{
  id *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    GPUTools::Playback::FunctionStreamEntry::~FunctionStreamEntry(v2);
    MEMORY[0x24262211C]();
  }
  return a1;
}

uint64_t std::shared_ptr<GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>>::~shared_ptr[abi:ne180100](uint64_t result)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = result;
  v2 = *(std::__shared_weak_count **)(result + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      return v1;
    }
  }
  return result;
}

void std::vector<std::unique_ptr<GPUTools::Playback::FunctionStreamEntry>>::reserve(uint64_t a1, unint64_t a2)
{
  char *v2;
  char *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  char *v23;
  id *v24;
  id *v25;

  v2 = *(char **)a1;
  if (a2 <= (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3)
    return;
  if (a2 >> 61)
    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
  v4 = *(char **)(a1 + 8);
  v5 = 8 * a2;
  v6 = (char *)operator new(8 * a2);
  v7 = &v6[v5];
  v8 = v4 - v2;
  v9 = (unint64_t)&v6[(v4 - v2) & 0xFFFFFFFFFFFFFFF8];
  if (v4 != v2)
  {
    v10 = v8 - 8;
    if ((unint64_t)(v8 - 8) >= 0x78)
    {
      v12 = (unint64_t)&v4[-(v10 & 0xFFFFFFFFFFFFFFF8) - 8] >= v9
         || &v6[(v8 & 0xFFFFFFFFFFFFFFF8) - (v10 & 0xFFFFFFFFFFFFFFF8) - 8] >= v4;
      v11 = &v6[(v4 - v2) & 0xFFFFFFFFFFFFFFF8];
      if (v12)
      {
        v13 = v8 >> 3;
        v14 = (v10 >> 3) + 1;
        v15 = 8 * (v14 & 0x3FFFFFFFFFFFFFFCLL);
        v11 = (char *)(v9 - v15);
        v16 = &v4[-v15];
        v17 = v4 - 16;
        v18 = &v6[8 * v13 - 16];
        v19 = v14 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v21 = *((_OWORD *)v17 - 1);
          v20 = *(_OWORD *)v17;
          *((_OWORD *)v17 - 1) = 0uLL;
          *(_OWORD *)v17 = 0uLL;
          *((_OWORD *)v18 - 1) = v21;
          *(_OWORD *)v18 = v20;
          v17 -= 32;
          v18 -= 32;
          v19 -= 4;
        }
        while (v19);
        v4 = v16;
        if (v14 == (v14 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_17:
          v23 = *(char **)a1;
          v2 = *(char **)(a1 + 8);
          *(_QWORD *)a1 = v11;
          *(_QWORD *)(a1 + 8) = v9;
          *(_QWORD *)(a1 + 16) = v7;
          if (v2 == v23)
          {
            if (v2)
              goto LABEL_19;
          }
          else
          {
            do
            {
              v25 = (id *)*((_QWORD *)v2 - 1);
              v2 -= 8;
              v24 = v25;
              *(_QWORD *)v2 = 0;
              if (v25)
              {
                GPUTools::Playback::FunctionStreamEntry::~FunctionStreamEntry(v24);
                MEMORY[0x24262211C]();
              }
            }
            while (v2 != v23);
            v2 = v23;
            if (v23)
              goto LABEL_19;
          }
          return;
        }
      }
    }
    else
    {
      v11 = &v6[(v4 - v2) & 0xFFFFFFFFFFFFFFF8];
    }
    do
    {
      v22 = *((_QWORD *)v4 - 1);
      v4 -= 8;
      *(_QWORD *)v4 = 0;
      *((_QWORD *)v11 - 1) = v22;
      v11 -= 8;
    }
    while (v4 != v2);
    goto LABEL_17;
  }
  *(_QWORD *)a1 = v9;
  *(_QWORD *)(a1 + 8) = v9;
  *(_QWORD *)(a1 + 16) = v7;
  if (v2)
LABEL_19:
    operator delete(v2);
}

void sub_23C6A1F3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, uint64_t a16, void *a17, uint64_t a18)
{
  if (__p)
    operator delete(__p);
  if (a17)
    operator delete(a17);
  _Unwind_Resume(exception_object);
}

GPUTools::Playback::PlaybackEngineDecodeCache *GPUTools::Playback::PlaybackEngineDecodeCache::PlaybackEngineDecodeCache(GPUTools::Playback::PlaybackEngineDecodeCache *this, uint64_t a2)
{
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = a2;
  *((_QWORD *)this + 8) = 0;
  GPUTools::VMBuffer::VMBuffer((GPUTools::Playback::PlaybackEngineDecodeCache *)((char *)this + 72));
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *((_DWORD *)this + 38) = 1065353216;
  return this;
}

void sub_23C6A2004(_Unwind_Exception *a1)
{
  _QWORD *v1;
  uint64_t v3;

  v3 = v1[5];
  v1[5] = 0;
  if (v3)
    GPUTools::Playback::PlaybackEngineDecodeCache::PlaybackEngineDecodeCache(v3);
  GPUTools::Playback::PlaybackEngineDecodeCache::PlaybackEngineDecodeCache(v1);
  _Unwind_Resume(a1);
}

void sub_23C6A20D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::unordered_map<void *,unsigned long>::~unordered_map[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_23C6A20EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::unordered_map<void *,unsigned long>::~unordered_map[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<void *,unsigned long>::~unordered_map[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

void sub_23C6A2690(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  for (; v2; v2 -= 456)
    GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(v1 - 440 + v2));
  MEMORY[0x242622104](v1, 0x1080C80609E9718);
  _Unwind_Resume(a1);
}

void sub_23C6A26CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)va);
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)&STACK[0x200]);
  _Unwind_Resume(a1);
}

void sub_23C6A26E8(_Unwind_Exception *a1)
{
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)&STACK[0x200]);
  _Unwind_Resume(a1);
}

void sub_23C6A26FC(_Unwind_Exception *a1)
{
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)&STACK[0x200]);
  _Unwind_Resume(a1);
}

void sub_23C6A2710(_Unwind_Exception *a1)
{
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)&STACK[0x200]);
  _Unwind_Resume(a1);
}

void sub_23C6A2724(_Unwind_Exception *a1)
{
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)&STACK[0x200]);
  _Unwind_Resume(a1);
}

void sub_23C6A2738(_Unwind_Exception *a1)
{
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)&STACK[0x200]);
  _Unwind_Resume(a1);
}

void sub_23C6A274C(_Unwind_Exception *a1)
{
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)&STACK[0x200]);
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<GPUTools::FD::CoreFunction []>::reset[abi:ne180100]<GPUTools::FD::CoreFunction*,0>(uint64_t *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    v3 = *(_QWORD *)(v2 - 8);
    if (v3)
    {
      v4 = 456 * v3;
      v5 = v2 - 456;
      do
      {
        GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(v5 + v4));
        v4 -= 456;
      }
      while (v4);
    }
    JUMPOUT(0x242622104);
  }
  return result;
}

void sub_23C6A293C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;

  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)&a71);
  _Unwind_Resume(a1);
}

void sub_23C6A2950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;

  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)&a9);
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)&a71);
  _Unwind_Resume(a1);
}

void sub_23C6A296C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;

  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)&a71);
  _Unwind_Resume(a1);
}

void GPUTools::Playback::PlaybackEngineDecodeCache::~PlaybackEngineDecodeCache(GPUTools::Playback::PlaybackEngineDecodeCache *this)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  id *v13;
  id *v14;

  v2 = (_QWORD *)*((_QWORD *)this + 17);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = (void *)*((_QWORD *)this + 15);
  *((_QWORD *)this + 15) = 0;
  if (v4)
    operator delete(v4);
  GPUTools::VMBuffer::~VMBuffer((GPUTools::Playback::PlaybackEngineDecodeCache *)((char *)this + 72));
  v5 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;
  if (v5)
  {
    v6 = v5 - 16;
    v7 = *(_QWORD *)(v5 - 8);
    if (v7)
    {
      v8 = 456 * v7;
      v9 = v5 - 456;
      do
      {
        GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(v9 + v8));
        v8 -= 456;
      }
      while (v8);
    }
    MEMORY[0x242622104](v6, 0x1080C80609E9718);
  }
  v10 = *(_QWORD **)this;
  if (*(_QWORD *)this)
  {
    v11 = (_QWORD *)*((_QWORD *)this + 1);
    v12 = *(void **)this;
    if (v11 != v10)
    {
      do
      {
        v14 = (id *)*--v11;
        v13 = v14;
        *v11 = 0;
        if (v14)
        {
          GPUTools::Playback::FunctionStreamEntry::~FunctionStreamEntry(v13);
          MEMORY[0x24262211C]();
        }
      }
      while (v11 != v10);
      v12 = *(void **)this;
    }
    *((_QWORD *)this + 1) = v10;
    operator delete(v12);
  }
}

void GPUTools::Playback::FunctionStreamEntry::~FunctionStreamEntry(id *this)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  GPUTools::Playback::DecodedFunctionStream *v5;

  v2 = (std::__shared_weak_count *)this[64];
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(this + 1));
  v5 = (GPUTools::Playback::DecodedFunctionStream *)*this;
  *this = 0;
  if (v5)
  {
    GPUTools::Playback::DecodedFunctionStream::~DecodedFunctionStream(v5);
    MEMORY[0x24262211C]();
  }
}

_QWORD *std::vector<std::unique_ptr<GPUTools::Playback::FunctionStreamEntry>>::__push_back_slow_path<std::unique_ptr<GPUTools::Playback::FunctionStreamEntry>>(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  char *v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  char *v26;
  id *v27;
  id *v28;

  v3 = a1[1] - *a1;
  v4 = v3 >> 3;
  v5 = (v3 >> 3) + 1;
  if (v5 >> 61)
    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
  v7 = a1[2] - *a1;
  if (v7 >> 2 > v5)
    v5 = v7 >> 2;
  if ((unint64_t)v7 >= 0x7FFFFFFFFFFFFFF8)
    v8 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v8 = v5;
  if (v8)
  {
    if (v8 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v9 = (char *)operator new(8 * v8);
  }
  else
  {
    v9 = 0;
  }
  v10 = &v9[8 * v4];
  v11 = &v9[8 * v8];
  v12 = *a2;
  *a2 = 0;
  *(_QWORD *)v10 = v12;
  v13 = v10 + 8;
  v14 = (char *)*a1;
  v15 = (char *)a1[1];
  if (v15 == (char *)*a1)
  {
    *a1 = v10;
    a1[1] = v13;
    a1[2] = v11;
    if (!v15)
      return v13;
    goto LABEL_26;
  }
  v16 = (unint64_t)&v15[-*a1 - 8];
  if (v16 < 0x78 || &v15[-(v16 & 0xFFFFFFFFFFFFFFF8) - 8] < v10 && &v9[v3 - (v16 & 0xFFFFFFFFFFFFFFF8) - 8] < v15)
    goto LABEL_34;
  v17 = (v16 >> 3) + 1;
  v18 = 8 * (v17 & 0x3FFFFFFFFFFFFFFCLL);
  v10 -= v18;
  v19 = &v15[-v18];
  v20 = v15 - 16;
  v21 = &v9[8 * v4 - 16];
  v22 = v17 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v24 = *((_OWORD *)v20 - 1);
    v23 = *(_OWORD *)v20;
    *((_OWORD *)v20 - 1) = 0uLL;
    *(_OWORD *)v20 = 0uLL;
    *((_OWORD *)v21 - 1) = v24;
    *(_OWORD *)v21 = v23;
    v20 -= 32;
    v21 -= 32;
    v22 -= 4;
  }
  while (v22);
  v15 = v19;
  if (v17 != (v17 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_34:
    do
    {
      v25 = *((_QWORD *)v15 - 1);
      v15 -= 8;
      *(_QWORD *)v15 = 0;
      *((_QWORD *)v10 - 1) = v25;
      v10 -= 8;
    }
    while (v15 != v14);
  }
  v26 = (char *)*a1;
  v15 = (char *)a1[1];
  *a1 = v10;
  a1[1] = v13;
  a1[2] = v11;
  if (v15 != v26)
  {
    do
    {
      v28 = (id *)*((_QWORD *)v15 - 1);
      v15 -= 8;
      v27 = v28;
      *(_QWORD *)v15 = 0;
      if (v28)
      {
        GPUTools::Playback::FunctionStreamEntry::~FunctionStreamEntry(v27);
        MEMORY[0x24262211C]();
      }
    }
    while (v15 != v26);
    v15 = v26;
  }
  if (v15)
LABEL_26:
    operator delete(v15);
  return v13;
}

void GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::Create(NSData *a1@<X0>, _DWORD *a2@<X1>, _QWORD *a3@<X2>, GPUTools::FD::BaseFunctionStream **a4@<X8>)
{
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  GPUTools::FD::BaseFunctionStream *v10;
  unint64_t v11;

  v8 = (std::__shared_weak_count *)operator new(0x40uLL);
  v8->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  v8->__shared_weak_owners_ = 0;
  v8->__vftable = (std::__shared_weak_count_vtbl *)&off_250D58B70;
  v10 = GPUTools::FD::BaseFunctionStream::BaseFunctionStream((GPUTools::FD::BaseFunctionStream *)&v8[1], a1, a2);
  if (LODWORD(v8[2].__shared_owners_))
  {
    if (a3)
      *a3 = objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080], v10, v8);
    *a4 = 0;
    a4[1] = 0;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  else
  {
    *a4 = v10;
    a4[1] = (GPUTools::FD::BaseFunctionStream *)v8;
  }
}

void sub_23C6A337C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_23C6A3390(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_250D58B70;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_250D58B70;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24262211CLL);
}

void std::__shared_ptr_emplace<GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);

}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long const,std::tuple<void *,unsigned long>>>(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD *v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v14;
  float v15;
  float v16;
  uint64_t v17;
  _QWORD *v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t prime;
  unint64_t v23;
  uint8x8_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = (_QWORD *)*v9;
      if (*v9)
      {
        if (v8.u32[0] < 2uLL)
        {
          while (1)
          {
            v12 = v10[1];
            if (v12 == v6)
            {
              if (v10[2] == v6)
                return v10;
            }
            else if ((v12 & (v7 - 1)) != v3)
            {
              goto LABEL_23;
            }
            v10 = (_QWORD *)*v10;
            if (!v10)
              goto LABEL_23;
          }
        }
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (v10[2] == v6)
              return v10;
          }
          else
          {
            if (v11 >= v7)
              v11 %= v7;
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
LABEL_23:
  v14 = operator new(0x28uLL);
  *v14 = 0;
  v14[1] = v6;
  *((_OWORD *)v14 + 1) = *(_OWORD *)a3;
  v14[4] = *(_QWORD *)(a3 + 16);
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (v7 && (float)(v16 * (float)v7) >= v15)
  {
    v17 = *(_QWORD *)a1;
    v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
    if (v18)
    {
LABEL_26:
      *v14 = *v18;
LABEL_61:
      *v18 = v14;
      goto LABEL_62;
    }
  }
  else
  {
    v19 = 1;
    if (v7 >= 3)
      v19 = (v7 & (v7 - 1)) != 0;
    v20 = v19 | (2 * v7);
    v21 = vcvtps_u32_f32(v15 / v16);
    if (v20 <= v21)
      prime = v21;
    else
      prime = v20;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
      v7 = *(_QWORD *)(a1 + 8);
    }
    if (prime > v7)
      goto LABEL_37;
    if (prime < v7)
    {
      v23 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v7 < 3 || (v24 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v24.i16[0] = vaddlv_u8(v24), v24.u32[0] > 1uLL))
      {
        v23 = std::__next_prime(v23);
      }
      else
      {
        v25 = 1 << -(char)__clz(v23 - 1);
        if (v23 >= 2)
          v23 = v25;
      }
      if (prime <= v23)
        prime = v23;
      if (prime < v7)
LABEL_37:
        std::__hash_table<std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>>>::__do_rehash<true>(a1, prime);
    }
    v7 = *(_QWORD *)(a1 + 8);
    v26 = v7 - 1;
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
      {
        v3 = v6 % v7;
        v17 = *(_QWORD *)a1;
        v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v6 % v7));
        if (v18)
          goto LABEL_26;
      }
      else
      {
        v3 = v6;
        v17 = *(_QWORD *)a1;
        v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v6);
        if (v18)
          goto LABEL_26;
      }
    }
    else
    {
      v3 = v26 & v6;
      v17 = *(_QWORD *)a1;
      v18 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v26 & v6));
      if (v18)
        goto LABEL_26;
    }
  }
  *v14 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v14;
  *(_QWORD *)(v17 + 8 * v3) = a1 + 16;
  if (*v14)
  {
    v27 = *(_QWORD *)(*v14 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v27 >= v7)
        v27 %= v7;
    }
    else
    {
      v27 &= v7 - 1;
    }
    v18 = (_QWORD *)(*(_QWORD *)a1 + 8 * v27);
    goto LABEL_61;
  }
LABEL_62:
  ++*(_QWORD *)(a1 + 24);
  return v14;
}

void sub_23C6A3740(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;

  if (!a2)
  {
    v15 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v15)
      operator delete(v15);
    *(_QWORD *)(a1 + 8) = 0;
    return;
  }
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v4 = operator new(8 * a2);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;
  if (v5)
    operator delete(v5);
  v6 = 0;
  *(_QWORD *)(a1 + 8) = a2;
  do
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
  while (a2 != v6);
  v8 = a1 + 16;
  v7 = *(_QWORD **)(a1 + 16);
  if (v7)
  {
    v9 = v7[1];
    v10 = a2 - 1;
    if ((a2 & (a2 - 1)) == 0)
    {
      v11 = v9 & v10;
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = v8;
      while (1)
      {
        v12 = (_QWORD *)*v7;
        if (!*v7)
          break;
        v13 = v12[1] & v10;
        if (v13 == v11)
        {
          v7 = (_QWORD *)*v7;
        }
        else if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v13))
        {
          *v7 = *v12;
          v14 = 8 * v13;
          *v12 = **(_QWORD **)(*(_QWORD *)a1 + v14);
          **(_QWORD **)(*(_QWORD *)a1 + v14) = v12;
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)a1 + 8 * v13) = v7;
          v7 = v12;
          v11 = v13;
        }
      }
      return;
    }
    if (v9 >= a2)
      v9 %= a2;
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v9) = v8;
    v16 = (_QWORD *)*v7;
    if (*v7)
    {
      while (1)
      {
        v18 = v16[1];
        if (v18 >= a2)
          v18 %= a2;
        if (v18 == v9)
          goto LABEL_25;
        if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v18))
        {
          *v7 = *v16;
          v17 = 8 * v18;
          *v16 = **(_QWORD **)(*(_QWORD *)a1 + v17);
          **(_QWORD **)(*(_QWORD *)a1 + v17) = v16;
          v16 = v7;
LABEL_25:
          v7 = v16;
          v16 = (_QWORD *)*v16;
          if (!v16)
            return;
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)a1 + 8 * v18) = v7;
          v7 = v16;
          v16 = (_QWORD *)*v16;
          v9 = v18;
          if (!v16)
            return;
        }
      }
    }
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__emplace_unique_key_args<void *,std::piecewise_construct_t const&,std::tuple<void * const&>,std::tuple<>>(uint64_t a1, uint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  _QWORD *v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v18;
  float v19;
  float v20;
  uint64_t v21;
  _QWORD *v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  size_t prime;
  unint64_t v27;
  uint8x8_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;

  v7 = *a2;
  v8 = HIDWORD(*a2);
  v9 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ v8);
  v10 = 0x9DDFEA08EB382D69
      * ((0x9DDFEA08EB382D69 * (v8 ^ (v9 >> 47) ^ v9)) ^ ((0x9DDFEA08EB382D69 * (v8 ^ (v9 >> 47) ^ v9)) >> 47));
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      v4 = 0x9DDFEA08EB382D69
         * ((0x9DDFEA08EB382D69 * (v8 ^ (v9 >> 47) ^ v9)) ^ ((0x9DDFEA08EB382D69 * (v8 ^ (v9 >> 47) ^ v9)) >> 47));
      if (v10 >= v11)
        v4 = v10 % v11;
    }
    else
    {
      v4 = v10 & (v11 - 1);
    }
    v13 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v13)
    {
      v14 = (_QWORD *)*v13;
      if (*v13)
      {
        if (v12.u32[0] < 2uLL)
        {
          while (1)
          {
            v16 = v14[1];
            if (v16 == v10)
            {
              if (v14[2] == v7)
                return v14;
            }
            else if ((v16 & (v11 - 1)) != v4)
            {
              goto LABEL_23;
            }
            v14 = (_QWORD *)*v14;
            if (!v14)
              goto LABEL_23;
          }
        }
        do
        {
          v15 = v14[1];
          if (v15 == v10)
          {
            if (v14[2] == v7)
              return v14;
          }
          else
          {
            if (v15 >= v11)
              v15 %= v11;
            if (v15 != v4)
              break;
          }
          v14 = (_QWORD *)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_23:
  v18 = operator new(0x20uLL);
  *v18 = 0;
  v18[1] = v10;
  v18[2] = **a4;
  v18[3] = 0;
  v19 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v20 = *(float *)(a1 + 32);
  if (v11 && (float)(v20 * (float)v11) >= v19)
  {
    v21 = *(_QWORD *)a1;
    v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v22)
    {
LABEL_26:
      *v18 = *v22;
LABEL_61:
      *v22 = v18;
      goto LABEL_62;
    }
  }
  else
  {
    v23 = 1;
    if (v11 >= 3)
      v23 = (v11 & (v11 - 1)) != 0;
    v24 = v23 | (2 * v11);
    v25 = vcvtps_u32_f32(v19 / v20);
    if (v24 <= v25)
      prime = v25;
    else
      prime = v24;
    if (prime == 1)
    {
      prime = 2;
    }
    else if ((prime & (prime - 1)) != 0)
    {
      prime = std::__next_prime(prime);
      v11 = *(_QWORD *)(a1 + 8);
    }
    if (prime > v11)
      goto LABEL_37;
    if (prime < v11)
    {
      v27 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
      if (v11 < 3 || (v28 = (uint8x8_t)vcnt_s8((int8x8_t)v11), v28.i16[0] = vaddlv_u8(v28), v28.u32[0] > 1uLL))
      {
        v27 = std::__next_prime(v27);
      }
      else
      {
        v29 = 1 << -(char)__clz(v27 - 1);
        if (v27 >= 2)
          v27 = v29;
      }
      if (prime <= v27)
        prime = v27;
      if (prime < v11)
LABEL_37:
        std::__hash_table<std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,std::tuple<void *,unsigned long>>>>::__do_rehash<true>(a1, prime);
    }
    v11 = *(_QWORD *)(a1 + 8);
    v30 = v11 - 1;
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
      {
        v4 = v10 % v11;
        v21 = *(_QWORD *)a1;
        v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v10 % v11));
        if (v22)
          goto LABEL_26;
      }
      else
      {
        v4 = v10;
        v21 = *(_QWORD *)a1;
        v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v10);
        if (v22)
          goto LABEL_26;
      }
    }
    else
    {
      v4 = v30 & v10;
      v21 = *(_QWORD *)a1;
      v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * (v30 & v10));
      if (v22)
        goto LABEL_26;
    }
  }
  *v18 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v18;
  *(_QWORD *)(v21 + 8 * v4) = a1 + 16;
  if (*v18)
  {
    v31 = *(_QWORD *)(*v18 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v31 >= v11)
        v31 %= v11;
    }
    else
    {
      v31 &= v11 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v31);
    goto LABEL_61;
  }
LABEL_62:
  ++*(_QWORD *)(a1 + 24);
  return v18;
}

void sub_23C6A3C48(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode_associated(uint64_t result, __int16 a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  __int16 v5;
  uint64_t v6;

  if ((a2 & 0x1000) != 0 && (a2 & 0x2000) == 0)
  {
    v2 = result;
    v3 = *(_QWORD *)(result + 464);
    while (1)
    {
      v4 = *(_QWORD *)(v2 + 472);
      if (v3 >= v4)
        break;
      v5 = (*(uint64_t (**)(_QWORD, unint64_t, unint64_t))(**(_QWORD **)(v2 + 480) + 56))(*(_QWORD *)(v2 + 480), v3, v4 - v3);
      result = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(v2 + 480) + 48))(*(_QWORD *)(v2 + 480), *(_QWORD *)(v2 + 464), *(_QWORD *)(v2 + 472) - *(_QWORD *)(v2 + 464));
      v3 = result + *(_QWORD *)(v2 + 464);
      *(_QWORD *)(v2 + 464) = v3;
      if ((v5 & 0x2000) != 0)
        return result;
    }
    v6 = dy_abort();
    return GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode(v6);
  }
  return result;
}

uint64_t GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  int v4;
  unint64_t v5;
  __int16 v6;
  DYDataFunctionStream *v7;
  SEL v8;

  result = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(**(_QWORD **)(a1 + 480) + 64))(*(_QWORD *)(a1 + 480), *(_QWORD *)(a1 + 456), *(_QWORD *)(a1 + 472) - *(_QWORD *)(a1 + 456), a1);
  if ((result & 1) != 0)
  {
    v3 = *(unsigned int *)(a1 + 432) + *(_QWORD *)(a1 + 456);
    *(_QWORD *)(a1 + 464) = v3;
    v4 = *(_DWORD *)(a1 + 4);
    if ((v4 & 0x1000) == 0)
      return result;
  }
  else
  {
    result = dy_abort();
  }
  if ((v4 & 0x2000) == 0)
  {
    while (1)
    {
      v5 = *(_QWORD *)(a1 + 472);
      if (v3 >= v5)
        break;
      v6 = (*(uint64_t (**)(_QWORD, unint64_t, unint64_t))(**(_QWORD **)(a1 + 480) + 56))(*(_QWORD *)(a1 + 480), v3, v5 - v3);
      result = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(a1 + 480) + 48))(*(_QWORD *)(a1 + 480), *(_QWORD *)(a1 + 464), *(_QWORD *)(a1 + 472) - *(_QWORD *)(a1 + 464));
      v3 = result + *(_QWORD *)(a1 + 464);
      *(_QWORD *)(a1 + 464) = v3;
      if ((v6 & 0x2000) != 0)
        return result;
    }
    v7 = (DYDataFunctionStream *)dy_abort();
    return (uint64_t)-[DYDataFunctionStream init](v7, v8);
  }
  return result;
}

void GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::Create(NSData *a1@<X0>, _DWORD *a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X8>)
{
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  _DWORD *v12;
  NSData *v13;

  v12 = a2;
  v13 = a1;
  std::allocate_shared[abi:ne180100]<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>,std::allocator<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>,NSData *&,void const*&,void>(&v13, &v12, &v10);
  if (*(_DWORD *)(v10 + 32))
  {
    if (a3)
      *a3 = objc_msgSend(MEMORY[0x24BE39108], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE39080]);
    *a4 = 0;
    a4[1] = 0;
    v6 = v11;
    if (v11)
    {
      p_shared_owners = (unint64_t *)&v11->__shared_owners_;
      do
        v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }
  }
  else
  {
    v9 = v11;
    *a4 = v10;
    a4[1] = v9;
  }
}

void sub_23C6A401C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::shared_ptr<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  return a1;
}

uint64_t GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::operator++(uint64_t a1)
{
  uint64_t v2;
  __int16 v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 544);
  if (v2 == *(_QWORD *)(a1 + 536))
  {
    if (*(_BYTE *)(a1 + 568))
    {
      v4 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(a1 + 560) + 56))(*(_QWORD *)(a1 + 560), v2, *(_QWORD *)(a1 + 552) - v2);
      v5 = *(_QWORD *)(a1 + 536);
      *(_QWORD *)(a1 + 544) = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(a1 + 560) + 48))(*(_QWORD *)(a1 + 560), v5, *(_QWORD *)(a1 + 552) - v5)+ v5;
      GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_decode_associated((_QWORD *)a1, v4);
    }
    else
    {
      GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_decode(a1);
    }
  }
  *(_QWORD *)(a1 + 536) = *(_QWORD *)(a1 + 544);
  return a1;
}

void sub_23C6A4538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)&a9);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;

  v6 = (_QWORD *)GPUTools::FD::Function::Function((GPUTools::FD::Function *)a1);
  v6[67] = a3;
  v6[68] = a3;
  v6[69] = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 560) = v7;
  *(_BYTE *)(a1 + 568) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7);
  return a1;
}

void sub_23C6A4668(_Unwind_Exception *a1)
{
  GPUTools::FD::Function *v1;

  GPUTools::FD::Function::~Function(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::allocate_shared[abi:ne180100]<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>,std::allocator<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>,NSData *&,void const*&,void>@<X0>(NSData **a1@<X1>, _DWORD **a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0x40uLL);
  result = std::__shared_ptr_emplace<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>::__shared_ptr_emplace[abi:ne180100]<NSData *&,void const*&,std::allocator<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_23C6A46C8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>::__shared_ptr_emplace[abi:ne180100]<NSData *&,void const*&,std::allocator<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>,0>(_QWORD *a1, NSData **a2, _DWORD **a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_250D58BA8;
  GPUTools::FD::BaseFunctionStream::BaseFunctionStream((GPUTools::FD::BaseFunctionStream *)(a1 + 3), *a2, *a3);
  return a1;
}

void sub_23C6A4718(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_250D58BA8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_250D58BA8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x24262211CLL);
}

void std::__shared_ptr_emplace<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>::__on_zero_shared(uint64_t a1)
{
  char v1;

  std::allocator<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>::destroy[abi:ne180100]((uint64_t)&v1, a1 + 24);
}

void std::allocator<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a2 + 8) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);

}

uint64_t std::shared_ptr<GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

uint64_t GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_decode(uint64_t a1)
{
  uint64_t v2;

  if (((*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(**(_QWORD **)(a1 + 560) + 72))(*(_QWORD *)(a1 + 560), *(_QWORD *)(a1 + 536), *(_QWORD *)(a1 + 552) - *(_QWORD *)(a1 + 536), a1) & 1) != 0)
  {
    *(_QWORD *)(a1 + 544) = *(unsigned int *)(a1 + 432) + *(_QWORD *)(a1 + 536);
    v2 = a1;
  }
  else
  {
    v2 = dy_abort();
  }
  return GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_decode_associated(v2);
}

uint64_t GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_decode_associated(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _Unwind_Exception *v6;

  v2 = *(_DWORD *)(result + 4);
  if ((v2 & 0x1000) != 0 && (v2 & 0x2000) == 0)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 544);
    v5 = result;
    do
    {
      if (v4 >= *(_QWORD *)(v3 + 552))
      {
        dy_abort();
LABEL_10:
        v6 = (_Unwind_Exception *)dy_abort();
        MEMORY[0x24262211C](v1, 0x10B0C40F47DA5FCLL);
        _Unwind_Resume(v6);
      }
      v1 = operator new();
      GPUTools::FD::Function::Function((GPUTools::FD::Function *)v1);
      *(_QWORD *)(v5 + 520) = v1;
      result = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(**(_QWORD **)(v3 + 560) + 72))(*(_QWORD *)(v3 + 560), *(_QWORD *)(v3 + 544), *(_QWORD *)(v3 + 552) - *(_QWORD *)(v3 + 544), v1);
      if ((result & 1) == 0)
        goto LABEL_10;
      v4 = *(_QWORD *)(v3 + 544) + *(unsigned int *)(v1 + 432);
      *(_QWORD *)(v3 + 544) = v4;
      v5 = v1;
    }
    while ((*(_BYTE *)(v1 + 5) & 0x20) == 0);
  }
  return result;
}

_QWORD *GPUTools::FD::TFunctionStream<GPUTools::FD::Function,void>::_Iterator<GPUTools::FD::Function>::_decode_associated(_QWORD *result, __int16 a2)
{
  _QWORD *v2;
  char *v3;
  unint64_t v4;
  __int16 v5;
  void *v6;
  SEL v7;
  id v8;
  id v9;

  if ((a2 & 0x1000) != 0 && (a2 & 0x2000) == 0)
  {
    v2 = result;
    v3 = (char *)result[68];
    while (1)
    {
      v4 = v2[69];
      if ((unint64_t)v3 >= v4)
        break;
      v5 = (*(uint64_t (**)(_QWORD, char *, unint64_t))(*(_QWORD *)v2[70] + 56))(v2[70], v3, v4 - (_QWORD)v3);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)v2[70] + 48))(v2[70], v2[68], v2[69] - v2[68]);
      v3 = (char *)result + v2[68];
      v2[68] = v3;
      if ((v5 & 0x2000) != 0)
        return result;
    }
    v6 = (void *)dy_abort();
    return +[DYFSStreamer streamItem:withTransport:](v6, v7, v8, v9);
  }
  return result;
}

void OUTLINED_FUNCTION_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
  __assert_rtn(a1, a2, 0, a4);
}

BOOL is_valid_plist_value(const void *a1)
{
  CFTypeID v2;

  v2 = CFGetTypeID(a1);
  if (v2 == CFArrayGetTypeID())
    return is_valid_plist_array((const __CFArray *)a1);
  if (v2 == CFDictionaryGetTypeID())
    return is_valid_plist_dictionary((const __CFDictionary *)a1);
  return is_valid_plist_value_type(v2);
}

BOOL is_valid_plist_array(const __CFArray *a1)
{
  CFIndex Count;
  CFIndex v3;
  const void **v4;
  BOOL v5;
  CFIndex i;
  CFRange v8;

  Count = CFArrayGetCount(a1);
  if (Count)
  {
    v3 = Count;
    v4 = (const void **)operator new[]();
    v8.location = 0;
    v8.length = v3;
    CFArrayGetValues(a1, v8, v4);
    if (v3 < 1)
    {
      v5 = 1;
    }
    else
    {
      v5 = 0;
      for (i = 0; i != v3; v5 = i >= v3)
      {
        if ((is_valid_plist_value(v4[i]) & 1) == 0)
          break;
        ++i;
      }
    }
    MEMORY[0x242622104](v4, 0xC0C80B8AA526DLL);
  }
  else
  {
    return 1;
  }
  return v5;
}

void sub_23C6A75FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x242622104](v1, 0xC0C80B8AA526DLL);
  _Unwind_Resume(a1);
}

BOOL is_valid_plist_dictionary(const __CFDictionary *a1)
{
  CFIndex Count;
  uint64_t v3;
  const void **v4;
  const void **v5;
  BOOL v6;
  uint64_t i;
  CFTypeID v8;

  Count = CFDictionaryGetCount(a1);
  if (Count)
  {
    v3 = Count;
    v4 = (const void **)operator new[]();
    v5 = (const void **)operator new[]();
    CFDictionaryGetKeysAndValues(a1, v4, v5);
    if (v3 < 1)
    {
      v6 = 1;
    }
    else
    {
      v6 = 0;
      for (i = 0; i != v3; v6 = i >= v3)
      {
        v8 = CFGetTypeID(v4[i]);
        if (v8 != CFStringGetTypeID())
          break;
        if ((is_valid_plist_value(v5[i]) & 1) == 0)
          break;
        ++i;
      }
    }
    MEMORY[0x242622104](v5, 0xC0C80B8AA526DLL);
    MEMORY[0x242622104](v4, 0xC0C80B8AA526DLL);
  }
  else
  {
    return 1;
  }
  return v6;
}

void sub_23C6A7740(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  MEMORY[0x242622104](v2, 0xC0C80B8AA526DLL);
  MEMORY[0x242622104](v1, 0xC0C80B8AA526DLL);
  _Unwind_Resume(a1);
}

BOOL is_valid_plist_value_type(uint64_t a1)
{
  return CFStringGetTypeID() == a1
      || CFDateGetTypeID() == a1
      || CFDataGetTypeID() == a1
      || CFNumberGetTypeID() == a1
      || CFBooleanGetTypeID() == a1;
}

CFTypeID plist_filter(void *a1)
{
  CFTypeID v2;
  CFTypeID result;

  v2 = CFGetTypeID(a1);
  if (v2 == CFArrayGetTypeID())
    return plist_filter_array((__CFArray *)a1);
  result = CFDictionaryGetTypeID();
  if (v2 == result)
    return plist_filter_dictionary((__CFDictionary *)a1);
  return result;
}

CFIndex plist_filter_array(__CFArray *a1)
{
  CFIndex result;
  CFIndex v3;
  const void **v4;
  CFIndex v5;
  CFTypeID v6;
  unint64_t v7;
  CFRange v8;

  result = CFArrayGetCount(a1);
  if (result)
  {
    v3 = result;
    v4 = (const void **)operator new[]();
    v8.location = 0;
    v8.length = v3;
    CFArrayGetValues(a1, v8, v4);
    if (v3 >= 2)
    {
      v5 = v3 - 1;
      do
      {
        v6 = CFGetTypeID(v4[v5]);
        if (v6 == CFArrayGetTypeID())
        {
          plist_filter_array((__CFArray *)v4[v5]);
        }
        else if (v6 == CFDictionaryGetTypeID())
        {
          plist_filter_dictionary((__CFDictionary *)v4[v5]);
        }
        else if (!is_valid_plist_value_type(v6))
        {
          CFArrayRemoveValueAtIndex(a1, v5);
        }
        v7 = v5-- + 1;
      }
      while (v7 > 2);
    }
    JUMPOUT(0x242622104);
  }
  return result;
}

void sub_23C6A7944(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x242622104](v1, 0xC0C80B8AA526DLL);
  _Unwind_Resume(a1);
}

CFIndex plist_filter_dictionary(__CFDictionary *a1)
{
  CFIndex result;
  uint64_t v3;
  const void **v4;
  const void **v5;
  CFTypeRef *v6;
  CFTypeRef *v7;
  CFTypeID v8;
  CFTypeID v9;

  result = CFDictionaryGetCount(a1);
  if (result)
  {
    v3 = result;
    v4 = (const void **)operator new[]();
    v5 = (const void **)operator new[]();
    CFDictionaryGetKeysAndValues(a1, v4, v5);
    if (v3 < 1)
    {
LABEL_14:
      MEMORY[0x242622104](v5, 0xC0C80B8AA526DLL);
      JUMPOUT(0x242622104);
    }
    v6 = v5;
    v7 = v4;
    while (1)
    {
      v8 = CFGetTypeID(*v7);
      if (v8 != CFStringGetTypeID())
        goto LABEL_7;
      v9 = CFGetTypeID(*v6);
      if (v9 != CFArrayGetTypeID())
        break;
      plist_filter_array((__CFArray *)*v6);
LABEL_8:
      ++v7;
      ++v6;
      if (!--v3)
        goto LABEL_14;
    }
    if (v9 == CFDictionaryGetTypeID())
    {
      plist_filter_dictionary((__CFDictionary *)*v6);
      goto LABEL_8;
    }
    if (is_valid_plist_value_type(v9))
      goto LABEL_8;
LABEL_7:
    CFDictionaryRemoveValue(a1, *v7);
    goto LABEL_8;
  }
  return result;
}

void sub_23C6A7AE8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  MEMORY[0x242622104](v2, 0xC0C80B8AA526DLL);
  MEMORY[0x242622104](v1, 0xC0C80B8AA526DLL);
  _Unwind_Resume(a1);
}

uint64_t new_ethernet_interfaces_iter(io_iterator_t *a1)
{
  CFMutableDictionaryRef v2;
  __CFDictionary *v3;
  __CFDictionary *Mutable;
  __CFDictionary *v5;

  v2 = IOServiceMatching("IOEthernetInterface");
  if (v2)
  {
    v3 = v2;
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v5 = Mutable;
      CFDictionarySetValue(Mutable, CFSTR("IOPrimaryInterface"), (const void *)*MEMORY[0x24BDBD270]);
      CFDictionarySetValue(v3, CFSTR("IOPropertyMatch"), v5);
      CFRelease(v5);
      return IOServiceGetMatchingServices(*MEMORY[0x24BDD8B20], v3, a1);
    }
    CFRelease(v3);
  }
  return 5;
}

const __CFData *copy_mac_address(io_iterator_t iterator)
{
  const __CFAllocator *v2;
  io_object_t v3;
  io_object_t v4;
  const __CFData *v5;
  const __CFData *CFProperty;
  io_registry_entry_t parent;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  while (1)
  {
    v3 = IOIteratorNext(iterator);
    if (!v3)
      break;
    v4 = v3;
    parent = 0;
    if (IORegistryEntryGetParentEntry(v3, "IOService", &parent))
    {
      v5 = 0;
    }
    else
    {
      CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(parent, CFSTR("IOMACAddress"), v2, 0);
      v5 = CFProperty;
      if (CFProperty && CFDataGetLength(CFProperty) <= 5)
      {
        CFRelease(v5);
        v5 = 0;
      }
      IOObjectRelease(parent);
    }
    IOObjectRelease(v4);
    if (v5)
      return v5;
  }
  return 0;
}

uint64_t copy_principal_mac_address()
{
  uint64_t v0;
  const __CFData *v1;
  const UInt8 *BytePtr;
  io_iterator_t v4;

  v4 = 0;
  if (new_ethernet_interfaces_iter(&v4))
    return 0;
  v1 = copy_mac_address(v4);
  IOObjectRelease(v4);
  if (!v1)
    return 0;
  BytePtr = CFDataGetBytePtr(v1);
  v0 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02x:%02x:%02x:%02x:%02x:%02x"), *BytePtr, BytePtr[1], BytePtr[2], BytePtr[3], BytePtr[4], BytePtr[5]);
  CFRelease(v1);
  return v0;
}

uint64_t copy_computer_name()
{
  char v1[1024];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  if (gethostname(v1, 0x400uLL))
    return 0;
  else
    return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v1);
}

const __CFString *copy_metal_version(void *a1)
{
  void *v1;

  v1 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", objc_msgSend(a1, "stringByAppendingPathComponent:", CFSTR("/System/Library/Frameworks/Metal.framework")));
  if (v1)
    return (const __CFString *)(id)objc_msgSend((id)objc_msgSend(v1, "objectForInfoDictionaryKey:", (id)CFMakeCollectable((CFTypeRef)*MEMORY[0x24BDBD2A0])), "copy");
  else
    return &stru_250D5A078;
}

id copy_system_version(void *a1)
{
  void *v1;
  id v2;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", objc_msgSend(a1, "stringByAppendingPathComponent:", CFSTR("/System/Library/CoreServices/SystemVersion.plist")));
  v2 = (id)objc_msgSend((id)objc_msgSend(v1, "objectForKey:", CFSTR("ProductVersion")), "copy");

  return v2;
}

id copy_system_build(void *a1)
{
  void *v1;
  id v2;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", objc_msgSend(a1, "stringByAppendingPathComponent:", CFSTR("/System/Library/CoreServices/SystemVersion.plist")));
  v2 = (id)objc_msgSend((id)objc_msgSend(v1, "objectForKey:", CFSTR("ProductBuildVersion")), "copy");

  return v2;
}

uint64_t copy_product_type()
{
  uint64_t v0;
  void *v2;
  void *v3;
  size_t size;
  int v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  size = 0;
  *(_QWORD *)v6 = 0x200000006;
  v0 = 0;
  if (sysctl(v6, 2u, 0, &size, 0, 0) != -1 && size != 0)
  {
    v2 = malloc_type_malloc(size, 0x660C6848uLL);
    if (v2)
    {
      v3 = v2;
      v0 = 0;
      if (!sysctl(v6, 2u, v2, &size, 0, 0))
        v0 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v3, 1);
      free(v3);
    }
    else
    {
      return 0;
    }
  }
  return v0;
}

uint64_t copy_hardware_uuid()
{
  int v0;
  uint64_t result;
  timespec v2;
  uuid_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  memset(v3, 0, sizeof(v3));
  v2.tv_sec = 0;
  v2.tv_nsec = 0;
  v0 = gethostuuid(v3, &v2);
  result = 0;
  if (!v0)
    return objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v3), "UUIDString");
  return result;
}

uint64_t GetAppURL(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", a1), "bundleURL");
}

void *PrettifyFenumString(void *result, int a2, int a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;

  if (result)
  {
    v5 = result;
    if (objc_msgSend(result, "hasPrefix:", CFSTR("kDYFE")))
      v5 = (void *)objc_msgSend(v5, "substringFromIndex:", 5);
    v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("_"));
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      v5 = (void *)objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("_"), CFSTR(" "), 0, v6, v7);
    v8 = objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(":"));
    v9 = CFSTR("+");
    if (!a2)
      v9 = CFSTR("-");
    if (a3)
      v10 = CFSTR(":");
    else
      v10 = &stru_250D5A078;
    return (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@[%@%@]"), v9, v8, v10);
  }
  return result;
}

double GPUTools::Playback::VariableCache::VariableCache(GPUTools::Playback::VariableCache *this)
{
  double result;

  result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 5) = 0;
  return result;
}

{
  double result;

  result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 5) = 0;
  return result;
}

void GPUTools::Playback::VariableCache::~VariableCache(GPUTools::Playback::VariableCache *this)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t i;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;

  v2 = *((unsigned int *)this + 12);
  if ((_DWORD)v2)
  {
    v3 = 0;
    for (i = 0; i < v2; ++i)
    {
      v5 = *((_QWORD *)this + 5);
      v6 = *(_QWORD *)(v5 + v3);
      v7 = ((unint64_t)(v6 - v5) >> 4);
      if (v6)
        v8 = v2 > v7;
      else
        v8 = 1;
      if (!v8)
      {
        MEMORY[0x242622104]();
        v2 = *((unsigned int *)this + 12);
      }
      v3 += 16;
    }
  }
  v9 = *((_QWORD *)this + 5);
  if (v9)
    MEMORY[0x242622104](v9, 0xB2C80428A0DD9);
  std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::~__hash_table((uint64_t)this);
}

void GPUTools::Playback::VariableCache::Add(GPUTools::Playback::VariableCache *this, char *__s, void *a3)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  _Unwind_Exception *v20;
  void *__p[2];
  char v22;
  void *v23;

  switch(*((_DWORD *)this + 15))
  {
    case 0:
      goto LABEL_3;
    case 1:
      ++*((_DWORD *)this + 12);
      ++*((_DWORD *)this + 14);
LABEL_3:
      std::string::basic_string[abi:ne180100]<0>(__p, __s);
      v23 = a3;
      std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__emplace_unique_key_args<std::string,std::pair<std::string,void *>>((uint64_t)this, (unsigned __int8 *)__p, (__int128 *)__p);
      if (v22 < 0)
        operator delete(__p[0]);
      return;
    case 2:
      v6 = *((unsigned int *)this + 14);
      v7 = *((_DWORD *)this + 12);
      if (v6 >= v7)
        goto LABEL_20;
      if (!(_DWORD)v6)
        goto LABEL_11;
      v8 = *((_QWORD *)this + 5);
      v9 = *((unsigned int *)this + 14);
      v10 = v8;
      break;
    case 3:
      v15 = *((unsigned int *)this + 14);
      v16 = *((_DWORD *)this + 12);
      if (v15 >= v16)
LABEL_20:
        __assert_rtn("void GPUTools::Playback::VariableCache::Add(const char *, void *)", "", 0, "_dataListIdx < _dataListSize");
      v17 = *((_QWORD *)this + 5);
      v18 = (uint64_t *)(v17 + 16 * v15);
      if (v16 <= ((unint64_t)(*v18 - v17) >> 4))
        v19 = v17 + 16 * v15;
      else
        v19 = *v18;
      *(_QWORD *)(v19 + 8) = a3;
      v14 = v15 + 1;
      goto LABEL_17;
    default:
      v20 = (_Unwind_Exception *)dy_abort();
      if (v22 < 0)
        operator delete(__p[0]);
      _Unwind_Resume(v20);
      return;
  }
  while (v7 > ((unint64_t)(*(_QWORD *)v10 - v8) >> 4) || strcmp(*(const char **)v10, __s))
  {
    v10 += 16;
    if (!--v9)
    {
LABEL_11:
      v11 = strlen(__s) + 1;
      v12 = (void *)operator new[]();
      memcpy(v12, __s, v11);
      *(_QWORD *)(*((_QWORD *)this + 5) + 16 * *((unsigned int *)this + 14)) = v12;
      v13 = *((unsigned int *)this + 14);
      *(_QWORD *)(*((_QWORD *)this + 5) + 16 * v13 + 8) = a3;
      v14 = v13 + 1;
      goto LABEL_17;
    }
  }
  *(_QWORD *)(v8 + 16 * v6) = v10;
  *(_QWORD *)(v10 + 8) = a3;
  v14 = *((_DWORD *)this + 14) + 1;
LABEL_17:
  *((_DWORD *)this + 14) = v14;
}

uint64_t GPUTools::Playback::VariableCache::Get(GPUTools::Playback::VariableCache *this, char *__s)
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  uint64_t result;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  _Unwind_Exception *v20;
  void *__p[2];
  char v22;

  switch(*((_DWORD *)this + 15))
  {
    case 0:
      goto LABEL_3;
    case 1:
      ++*((_DWORD *)this + 12);
      ++*((_DWORD *)this + 14);
LABEL_3:
      std::string::basic_string[abi:ne180100]<0>(__p, __s);
      v4 = std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::find<std::string>(this, (unsigned __int8 *)__p);
      v5 = v4;
      if (v22 < 0)
      {
        operator delete(__p[0]);
        if (v5)
          return *((_QWORD *)v5 + 5);
      }
      else if (v4)
      {
        return *((_QWORD *)v5 + 5);
      }
      return 0;
    case 2:
      v7 = *((unsigned int *)this + 14);
      v8 = *((_DWORD *)this + 12);
      if (v7 >= v8)
        goto LABEL_21;
      if (!(_DWORD)v7)
        goto LABEL_12;
      v9 = *((_QWORD *)this + 5);
      v10 = *((unsigned int *)this + 14);
      v11 = v9;
      while (v8 > ((unint64_t)(*(_QWORD *)v11 - v9) >> 4) || strcmp(*(const char **)v11, __s))
      {
        v11 += 16;
        if (!--v10)
        {
LABEL_12:
          v12 = strlen(__s) + 1;
          v13 = (void *)operator new[]();
          memcpy(v13, __s, v12);
          result = 0;
          *(_QWORD *)(*((_QWORD *)this + 5) + 16 * *((unsigned int *)this + 14)) = v13;
          v14 = *((unsigned int *)this + 14);
          *(_QWORD *)(*((_QWORD *)this + 5) + 16 * v14 + 8) = 0;
          *((_DWORD *)this + 14) = v14 + 1;
          return result;
        }
      }
      *(_QWORD *)(v9 + 16 * v7) = v11;
      ++*((_DWORD *)this + 14);
      return *(_QWORD *)(v11 + 8);
    case 3:
      v15 = *((unsigned int *)this + 14);
      v16 = *((_DWORD *)this + 12);
      if (v15 >= v16)
LABEL_21:
        __assert_rtn("void *GPUTools::Playback::VariableCache::Get(const char *)", "", 0, "_dataListIdx < _dataListSize");
      v17 = *((_QWORD *)this + 5);
      v18 = (uint64_t *)(v17 + 16 * v15);
      if (v16 <= ((unint64_t)(*v18 - v17) >> 4))
        v19 = v17 + 16 * v15;
      else
        v19 = *v18;
      *((_DWORD *)this + 14) = v15 + 1;
      return *(_QWORD *)(v19 + 8);
    default:
      v20 = (_Unwind_Exception *)dy_abort();
      if (v22 < 0)
        operator delete(__p[0]);
      _Unwind_Resume(v20);
      return result;
  }
}

void GPUTools::Playback::VariableCache::Begin(GPUTools::Playback::VariableCache *this)
{
  unint64_t v1;
  int v3;
  uint64_t v4;
  unint64_t i;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  size_t v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;

  v1 = *((unsigned int *)this + 12);
  if (v1 != *((_DWORD *)this + 14))
  {
    v19 = "_dataListSize == _dataListIdx";
    goto LABEL_30;
  }
  *((_DWORD *)this + 14) = *((_DWORD *)this + 13);
  v3 = *((_DWORD *)this + 15);
  if (v3 == 3)
    return;
  *((_DWORD *)this + 15) = v3 + 1;
  if (!v3)
  {
    v9 = *((_DWORD *)this + 6);
    *((_DWORD *)this + 13) = v9;
    *((_DWORD *)this + 14) = v9;
    *((_DWORD *)this + 12) = v9;
    return;
  }
  if (v3 != 1)
  {
    if (v3 == 2)
    {
      if (v1)
      {
        v4 = 0;
        for (i = 0; i < v1; ++i)
        {
          v6 = *((_QWORD *)this + 5);
          v7 = *(_QWORD *)(v6 + v4);
          if (v7)
            v8 = v1 > ((unint64_t)(v7 - v6) >> 4);
          else
            v8 = 1;
          if (!v8)
          {
            MEMORY[0x242622104]();
            *(_QWORD *)(v6 + v4) = 0;
            v1 = *((unsigned int *)this + 12);
          }
          v4 += 16;
        }
      }
    }
    else
    {
      v20 = dy_abort();
      std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::~__hash_table(v20);
    }
    return;
  }
  if (v1)
  {
    v10 = 16 * v1;
    v11 = (void *)operator new[]();
    bzero(v11, v10);
    *((_QWORD *)this + 5) = v11;
    if (*((_QWORD *)this + 3))
    {
      v12 = 0;
      do
      {
        v13 = *((_QWORD *)this + 2);
        if (*(char *)(v13 + 39) < 0)
          v14 = *(_QWORD *)(v13 + 24);
        else
          v14 = *(unsigned __int8 *)(v13 + 39);
        v15 = (_QWORD *)(v13 + 16);
        v16 = v14 + 1;
        v17 = (void *)operator new[]();
        v18 = v17;
        if (*(char *)(v13 + 39) < 0)
          v15 = (_QWORD *)*v15;
        memcpy(v17, v15, v16);
        *(_QWORD *)(*((_QWORD *)this + 5) + 16 * v12) = v18;
        *(_QWORD *)(*((_QWORD *)this + 5) + 16 * v12 + 8) = *(_QWORD *)(v13 + 40);
        std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::erase(this, (uint64_t *)v13);
        ++v12;
      }
      while (*((_QWORD *)this + 3));
    }
    else
    {
      v12 = 0;
    }
    if (v12 != *((_DWORD *)this + 13))
    {
      v19 = "index == _dataListIdxBase";
LABEL_30:
      __assert_rtn("void GPUTools::Playback::VariableCache::Begin()", "", 0, v19);
    }
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void *std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__emplace_unique_key_args<std::string,std::pair<std::string,void *>>(uint64_t a1, unsigned __int8 *a2, __int128 *a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  void **v13;
  void *i;
  unint64_t v15;
  _QWORD *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(void **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, (unsigned __int8 *)i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  v16 = (_QWORD *)(a1 + 16);
  i = operator new(0x30uLL);
  v17 = *a3;
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  v18 = *((_QWORD *)a3 + 2);
  v19 = *((_QWORD *)a3 + 3);
  *((_QWORD *)a3 + 2) = 0;
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v9;
  *((_OWORD *)i + 1) = v17;
  *((_QWORD *)i + 4) = v18;
  *((_QWORD *)i + 5) = v19;
  v20 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v21 = *(float *)(a1 + 32);
  if (!v10 || (float)(v21 * (float)v10) < v20)
  {
    v22 = 1;
    if (v10 >= 3)
      v22 = (v10 & (v10 - 1)) != 0;
    v23 = v22 | (2 * v10);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      v25 = v24;
    else
      v25 = v23;
    std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__rehash<true>(a1, v25);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v26 = *(_QWORD *)a1;
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v27)
  {
    *(_QWORD *)i = *v27;
LABEL_38:
    *v27 = i;
    goto LABEL_39;
  }
  *(_QWORD *)i = *v16;
  *v16 = i;
  *(_QWORD *)(v26 + 8 * v3) = v16;
  if (*(_QWORD *)i)
  {
    v28 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v28 >= v10)
        v28 %= v10;
    }
    else
    {
      v28 &= v10 - 1;
    }
    v27 = (_QWORD *)(*(_QWORD *)a1 + 8 * v28);
    goto LABEL_38;
  }
LABEL_39:
  ++*v7;
  return i;
}

void sub_23C6A906C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,void *>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,void *>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::erase(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  void **v3;
  void *__p;
  uint64_t v6;

  v2 = *a2;
  std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::remove(a1, a2, (uint64_t)&__p);
  v3 = (void **)__p;
  __p = 0;
  if (v3)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,void *>,void *>>>::operator()[abi:ne180100]((uint64_t)&v6, v3);
  return v2;
}

_QWORD *std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::remove@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  v6 = *(_QWORD **)(*result + 8 * v4);
  do
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2)
    goto LABEL_18;
  v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(_QWORD *)&v3)
      v8 %= *(_QWORD *)&v3;
  }
  else
  {
    v8 &= *(_QWORD *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2)
      goto LABEL_19;
    v9 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(_QWORD *)&v3)
        v9 %= *(_QWORD *)&v3;
    }
    else
    {
      v9 &= *(_QWORD *)&v3 - 1;
    }
    if (v9 != v4)
LABEL_19:
      *(_QWORD *)(*result + 8 * v4) = 0;
  }
  v10 = *a2;
  if (*a2)
  {
    v11 = *(_QWORD *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(_QWORD *)&v3)
        v11 %= *(_QWORD *)&v3;
    }
    else
    {
      v11 &= *(_QWORD *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(_QWORD *)(*result + 8 * v11) = v7;
      v10 = *a2;
    }
  }
  *v7 = v10;
  *a2 = 0;
  --result[3];
  *(_QWORD *)a3 = a2;
  *(_QWORD *)(a3 + 8) = result + 2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

uint64_t DYTextureChannelMappingsMerge(unint64_t a1, int a2)
{
  uint64_t v2;
  unint64_t v3;
  int v5;
  unsigned int v6;

  v2 = 0;
  v5 = a2;
  v6 = 50462976;
  do
  {
    LOBYTE(v3) = a1;
    switch(*((_BYTE *)&v5 + v2))
    {
      case 0:
        goto LABEL_7;
      case 1:
        v3 = a1 >> 8;
        goto LABEL_7;
      case 2:
        v3 = a1 >> 16;
        goto LABEL_7;
      case 3:
        v3 = a1 >> 24;
        goto LABEL_7;
      case 4:
      case 5:
        LOBYTE(v3) = *((_BYTE *)&v5 + v2);
LABEL_7:
        *((_BYTE *)&v6 + v2) = v3;
        break;
      default:
        break;
    }
    ++v2;
  }
  while (v2 != 4);
  return v6;
}

const __CFString *DYTextureChannelGetString(unsigned int a1)
{
  if (a1 > 5)
    return CFSTR("-");
  else
    return off_250D58D60[(char)a1];
}

const __CFString *DYTextureChannelMappingsCopyString(int a1)
{
  void *v1;
  uint64_t i;
  unint64_t v3;
  const __CFString *v4;
  int v6;

  v6 = a1;
  if (a1 == 50462976)
    return CFSTR("RGBA");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 4);
  for (i = 0; i != 4; ++i)
  {
    v3 = *((char *)&v6 + i);
    v4 = CFSTR("-");
    if (v3 <= 5)
      v4 = off_250D58D60[v3];
    objc_msgSend(v1, "appendString:", v4);
  }
  return (const __CFString *)v1;
}

id GPUTools::DYCaptureArchiveUtils::extendArchive(GPUTools::DYCaptureArchiveUtils *this, DYCaptureArchive *a2, NSMutableData *a3, NSData *a4, NSString *a5)
{
  id v9;
  uint64_t v10;
  DYCaptureArchive *v11;
  NSString *v12;
  DYCaptureArchive *v13;
  NSString *v14;
  DYCaptureArchive *v15;
  NSString *v16;
  GPUTools::DYCaptureArchiveUtils *v17;
  NSString *v18;
  NSData *v19;
  NSMutableData *v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t v25;

  v25 = 0;
  v9 = +[DYCaptureArchive createArchiveInTemporaryDirectory:](DYCaptureArchive, "createArchiveInTemporaryDirectory:", &v25, a4, a5);
  -[GPUTools::DYCaptureArchiveUtils commit:](this, "commit:", 0);
  -[DYCaptureArchive commit:](a2, "commit:", 0);
  objc_msgSend(v9, "setMetadataFromArchive:", this);
  v10 = MEMORY[0x24BDAC760];
  v23[4] = a4;
  v24 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = ___ZN8GPUTools21DYCaptureArchiveUtils13extendArchiveEP16DYCaptureArchiveS2_P6NSDataP8NSString_block_invoke;
  v23[3] = &unk_250D58D98;
  objc_msgSend(v9, "addFilesFromArchive:error:passingTest:", this, &v24, v23);
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = ___ZN8GPUTools21DYCaptureArchiveUtils13extendArchiveEP16DYCaptureArchiveS2_P6NSDataP8NSString_block_invoke_2;
  v22[3] = &unk_250D58D98;
  v22[4] = v9;
  objc_msgSend(v9, "addFilesFromArchive:error:passingTest:", a2, &v24, v22);
  objc_msgSend(v9, "commit:", 0);
  v11 = (DYCaptureArchive *)*MEMORY[0x24BE393B0];
  v13 = (DYCaptureArchive *)GPUTools::DYCaptureArchiveUtils::filenameForPrefixInArchive(this, (DYCaptureArchive *)*MEMORY[0x24BE393B0], v12);
  v15 = (DYCaptureArchive *)GPUTools::DYCaptureArchiveUtils::filenameForPrefixInArchive((GPUTools::DYCaptureArchiveUtils *)a2, v11, v14);
  v17 = (GPUTools::DYCaptureArchiveUtils *)GPUTools::DYCaptureArchiveUtils::openFunctionStreamData(this, v13, v16);
  v20 = (NSMutableData *)GPUTools::DYCaptureArchiveUtils::openFunctionStreamData((GPUTools::DYCaptureArchiveUtils *)a2, v15, v18);
  if (a3 && -[NSMutableData length](a3, "length"))
    GPUTools::DYCaptureArchiveUtils::appendFuntionStreams(v17, a3, v19);
  GPUTools::DYCaptureArchiveUtils::appendFuntionStreams(v17, v20, v19);
  objc_msgSend(v9, "addFileWithName:data:options:error:waitUntilDone:", v13, v17, 0, 0, 1);

  return v9;
}

BOOL ___ZN8GPUTools21DYCaptureArchiveUtils13extendArchiveEP16DYCaptureArchiveS2_P6NSDataP8NSString_block_invoke(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "containsString:", *MEMORY[0x24BE393B0]) & 1) == 0
      && !objc_msgSend(a2, "containsString:", *(_QWORD *)(a1 + 32));
}

BOOL ___ZN8GPUTools21DYCaptureArchiveUtils13extendArchiveEP16DYCaptureArchiveS2_P6NSDataP8NSString_block_invoke_2(uint64_t a1, void *a2)
{
  return (objc_msgSend(*(id *)(a1 + 32), "fileExistsForFilename:error:", a2, 0) & 1) == 0
      && !objc_msgSend(a2, "containsString:", *MEMORY[0x24BE393B0]);
}

uint64_t GPUTools::DYCaptureArchiveUtils::filenameForPrefixInArchive(GPUTools::DYCaptureArchiveUtils *this, DYCaptureArchive *a2, NSString *a3)
{
  void *v3;
  uint64_t result;
  uint64_t v5;

  v5 = 0;
  v3 = (void *)objc_msgSend((id)-[GPUTools::DYCaptureArchiveUtils filenamesWithPrefix:error:](this, "filenamesWithPrefix:error:", a2, &v5), "sortedArrayUsingSelector:", sel_dy_numericCompare_);
  result = 0;
  if (!v5)
  {
    if (objc_msgSend(v3, "count") == 1)
      return objc_msgSend(v3, "objectAtIndex:", 0);
    else
      return 0;
  }
  return result;
}

void *GPUTools::DYCaptureArchiveUtils::openFunctionStreamData(GPUTools::DYCaptureArchiveUtils *this, DYCaptureArchive *a2, NSString *a3)
{
  void *v3;
  void *result;
  uint64_t v5;

  v5 = 0;
  v3 = (void *)-[GPUTools::DYCaptureArchiveUtils openFileWithFilename:error:](this, "openFileWithFilename:error:", a2, &v5);
  if (v5)
    v3 = 0;
  v5 = 0;
  result = (void *)objc_msgSend(v3, "copyMutableData:", &v5);
  if (v5)
  {

    return 0;
  }
  return result;
}

void GPUTools::DYCaptureArchiveUtils::appendFuntionStreams(GPUTools::DYCaptureArchiveUtils *this, NSMutableData *a2, NSData *a3)
{
  uint64_t v5;
  id v6;

  v5 = -[NSMutableData bytes](a2, "bytes", a3);
  if (-[NSMutableData length](a2, "length") >= 8)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", v5 + 8, -[NSMutableData length](a2, "length") - 8);
    -[GPUTools::DYCaptureArchiveUtils appendData:](this, "appendData:", v6);

  }
}

uint64_t GPUTools::DYCaptureArchiveUtils::openFileInArchive(GPUTools::DYCaptureArchiveUtils *this, DYCaptureArchive *a2, NSString *a3)
{
  uint64_t result;
  uint64_t v4;

  v4 = 0;
  result = -[GPUTools::DYCaptureArchiveUtils openFileWithFilename:error:](this, "openFileWithFilename:error:", a2, &v4);
  if (v4)
    return 0;
  return result;
}

uint64_t GPUTools::DYCaptureArchiveUtils::openFunctionStream(GPUTools::DYCaptureArchiveUtils *this, DYCaptureArchive *a2, NSString *a3)
{
  void *v3;
  uint64_t result;
  uint64_t v5;

  v5 = 0;
  v3 = (void *)-[GPUTools::DYCaptureArchiveUtils openFileWithFilename:error:](this, "openFileWithFilename:error:", a2, &v5);
  if (v5)
    v3 = 0;
  v5 = 0;
  result = objc_msgSend(v3, "openFunctionStream:", &v5);
  if (v5)
    return 0;
  return result;
}

__CFString *DYDevicePlatformGetString(int a1)
{
  if ((a1 - 1) > 9)
    return 0;
  else
    return off_250D58EA8[a1 - 1];
}

__CFString *DYDevicePlatformGetDVTName(int a1)
{
  if ((a1 - 1) > 9)
    return 0;
  else
    return off_250D58E08[a1 - 1];
}

void sub_23C6AC020(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24262211C](v1, 0x1010C403911DF6DLL);
  _Unwind_Resume(a1);
}

void GPUTools::RunningStatistics<unsigned long long>::AddElement(uint64_t a1, _QWORD *a2)
{
  int v3;
  unsigned int v4;
  uint64_t v5;
  int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  size_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int *v24;
  uint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unsigned int *v36;
  int v37;
  int v38;
  _QWORD __compar[5];

  v3 = *(_DWORD *)(a1 + 224);
  v4 = *(_DWORD *)(a1 + 24);
  v5 = (*(_DWORD *)(a1 + 228) + 1) % v4;
  if (v4 >= v3 + 1)
    v6 = v3 + 1;
  else
    v6 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 224) = v6;
  *(_DWORD *)(a1 + 228) = v5;
  v7 = *(uint64_t **)a1;
  *(_QWORD *)(*(_QWORD *)a1 + 8 * v5) = *a2;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 80);
  v11 = *(_QWORD *)(a1 + 104);
  v12 = *(_QWORD *)(a1 + 128);
  v13 = *(_QWORD *)(a1 + 152);
  v14 = *(_QWORD *)(a1 + 176);
  if (v6 == 1)
  {
    v15 = *v7;
    *(_QWORD *)(v14 + 8 * v5) = v15;
    *(_QWORD *)(v13 + 8 * v5) = v15;
    *(_QWORD *)(v12 + 8 * v5) = v15;
    *(_QWORD *)(v11 + 8 * v5) = v15;
    *(_QWORD *)(v10 + 8 * v5) = v15;
    **(_DWORD **)(a1 + 200) = 0;
    *(_QWORD *)(v9 + 8 * v5) = v15;
    *(_QWORD *)(v8 + 8 * v5) = v15;
  }
  else
  {
    *(_QWORD *)(v8 + 8 * v5) = 0;
    v16 = *(_DWORD **)(a1 + 200);
    if (v6)
    {
      v17 = 0;
      v18 = 0;
      do
      {
        v16[v17] = v17;
        v18 += v7[v17];
        *(_QWORD *)(v8 + 8 * v5) = v18;
        ++v17;
        v19 = *(unsigned int *)(a1 + 224);
      }
      while (v17 < v19);
    }
    else
    {
      v19 = 0;
    }
    __compar[0] = MEMORY[0x24BDAC760];
    __compar[1] = 3221225472;
    __compar[2] = ___ZN8GPUTools17RunningStatisticsIyE10AddElementERKy_block_invoke;
    __compar[3] = &__block_descriptor_40_e15_i24__0r_v8r_v16l;
    __compar[4] = a1;
    qsort_b(v16, v19, 4uLL, __compar);
    v20 = *(_QWORD *)(v8 + 8 * v5);
    v21 = *(unsigned int *)(a1 + 224);
    v22 = v21 >> 1;
    if (v20)
      v23 = v20 + (v21 >> 1);
    else
      v23 = -(uint64_t)v22;
    *(_QWORD *)(v8 + 8 * v5) = v23 / v21;
    v24 = *(unsigned int **)(a1 + 200);
    v25 = *(uint64_t **)a1;
    *(_QWORD *)(v10 + 8 * v5) = *(_QWORD *)(*(_QWORD *)a1 + 8 * *v24);
    *(_QWORD *)(v14 + 8 * v5) = v25[v24[(v21 - 1)]];
    if ((v21 & 1) != 0)
      v26 = v25[v24[v22]];
    else
      v26 = (unint64_t)(v25[v24[v22]] + v25[v24[(v22 - 1)]]) >> 1;
    *(_QWORD *)(v12 + 8 * v5) = v26;
    v27 = v21 >> 2;
    v28 = ~(v21 >> 2);
    v29 = v21 + v28;
    v30 = v24[v21 >> 2];
    v31 = v25[v30];
    if ((v21 & 3) != 0)
    {
      *(_QWORD *)(v11 + 8 * v5) = v31;
      v32 = v24[v29];
      v33 = v25[v32];
    }
    else
    {
      *(_QWORD *)(v11 + 8 * v5) = (unint64_t)(v25[v24[(v27 - 1)]] + v31) >> 1;
      v32 = v24[v29];
      v33 = (unint64_t)(v25[v24[(v21 - v27)]] + v25[v32]) >> 1;
    }
    *(_QWORD *)(v13 + 8 * v5) = v33;
    v34 = (v21 & 0xFFFFFFFC) - (v21 & 0x3FFFFFFF) + 4;
    v35 = (v25[v32] + v25[v30]) * v34;
    *(_QWORD *)(v9 + 8 * v5) = v35;
    if ((int)v27 + 1 < v29)
    {
      v36 = &v24[v27 + 1];
      v37 = 2 * v27 - v21 + 2;
      do
      {
        v38 = *v36++;
        v35 += 4 * v25[v38];
        *(_QWORD *)(v9 + 8 * v5) = v35;
      }
      while (!__CFADD__(v37++, 1));
    }
    *(_QWORD *)(v9 + 8 * v5) = v35 / (4 * (v29 + v28) + 2 * (_DWORD)v34);
  }
}

unint64_t GPUTools::RunningStatistics<unsigned long long>::IQRtoIQMRatioMinMax(uint64_t a1, unsigned int a2, double *a3, double *a4)
{
  unint64_t v4;
  uint64_t v5;
  double v6;
  unsigned int v7;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  double v12;
  double *v13;

  LODWORD(v4) = *(_DWORD *)(a1 + 224);
  if (!(_DWORD)v4)
    return v4 & 1;
  if ((_DWORD)v4 == 1)
  {
    v5 = (*(_DWORD *)(a1 + 24) + *(_DWORD *)(a1 + 228)) % *(_DWORD *)(a1 + 24);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v5);
    if (v4)
    {
      v6 = (double)(unint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8 * v5)
                                    - *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8 * v5))
         / (double)v4;
      *a4 = v6;
      *a3 = v6;
      LOBYTE(v4) = 1;
    }
    return v4 & 1;
  }
  if (v4 >= a2)
    LODWORD(v4) = a2;
  if ((_DWORD)v4)
  {
    v7 = *(_DWORD *)(a1 + 228);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = 1;
    v10 = *(_DWORD *)(a1 + 24);
    while (1)
    {
      v11 = *(_QWORD *)(v8 + 8 * v7);
      if (v11)
      {
        v12 = (double)(unint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8 * v7)
                                       - *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8 * v7))
            / (double)v11;
        if ((v9 & 1) != 0)
        {
          *a4 = v12;
          v13 = a3;
        }
        else
        {
          v13 = a3;
          if (v12 >= *a3)
          {
            v13 = a4;
            if (v12 <= *a4)
            {
              v9 = 0;
              goto LABEL_15;
            }
          }
        }
        v9 = 0;
        *v13 = v12;
      }
LABEL_15:
      v7 = (v7 + v10 - 1) % v10;
      LODWORD(v4) = v4 - 1;
      if (!(_DWORD)v4)
        goto LABEL_19;
    }
  }
  v9 = 1;
LABEL_19:
  LOBYTE(v4) = v9 ^ 1;
  return v4 & 1;
}

void std::default_delete<GPUTools::RunningStatistics<unsigned long long>>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2)
  {
    v3 = *(void **)(a2 + 200);
    if (v3)
    {
      *(_QWORD *)(a2 + 208) = v3;
      operator delete(v3);
    }
    v4 = 0;
    while (1)
    {
      v5 = *(void **)(a2 + v4 + 176);
      if (v5)
      {
        *(_QWORD *)(a2 + v4 + 184) = v5;
        operator delete(v5);
      }
      v4 -= 24;
      if (v4 == -120)
      {
        v6 = *(void **)(a2 + 56);
        if (v6)
        {
          *(_QWORD *)(a2 + 64) = v6;
          operator delete(v6);
        }
        v7 = *(void **)(a2 + 32);
        if (v7)
        {
          *(_QWORD *)(a2 + 40) = v7;
          operator delete(v7);
        }
        v8 = *(void **)a2;
        if (*(_QWORD *)a2)
        {
          *(_QWORD *)(a2 + 8) = v8;
          operator delete(v8);
        }
        JUMPOUT(0x24262211CLL);
      }
    }
  }
}

uint64_t GPUTools::RunningStatistics<unsigned long long>::RunningStatistics(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  std::vector<unsigned int> *v5;
  unint64_t v6;
  std::vector<unsigned int>::size_type v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  std::vector<unsigned int>::value_type __x[2];

  *(_OWORD *)(a1 + 32) = 0u;
  v3 = a1 + 32;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  v4 = a1 + 56;
  v5 = (std::vector<unsigned int> *)(a1 + 200);
  *(_QWORD *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_DWORD *)(a1 + 224) = 0;
  *(_DWORD *)(a1 + 24) = a2;
  v6 = a2;
  *(_QWORD *)__x = 0;
  std::vector<unsigned long long>::resize(a1, a2, __x);
  v7 = *(unsigned int *)(a1 + 24);
  __x[0] = 0;
  std::vector<unsigned int>::resize(v5, v7, __x);
  v8 = *(unsigned int *)(a1 + 24);
  *(_QWORD *)__x = 0;
  std::vector<unsigned long long>::resize(v3, v8, __x);
  v9 = *(unsigned int *)(a1 + 24);
  *(_QWORD *)__x = 0;
  std::vector<unsigned long long>::resize(v4, v9, __x);
  for (i = 80; i != 200; i += 24)
  {
    *(_QWORD *)__x = 0;
    std::vector<unsigned long long>::resize(a1 + i, v6, __x);
  }
  *(_DWORD *)(a1 + 228) = *(_DWORD *)(a1 + 24) - 1;
  return a1;
}

void sub_23C6AC77C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void **v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = *v4;
  if (*v4)
  {
    *(_QWORD *)(v1 + 208) = v6;
    operator delete(v6);
  }
  v7 = 0;
  while (1)
  {
    v8 = *(void **)(v1 + v7 + 176);
    if (v8)
    {
      *(_QWORD *)(v1 + v7 + 184) = v8;
      operator delete(v8);
    }
    v7 -= 24;
    if (v7 == -120)
    {
      v9 = *v3;
      if (*v3)
      {
        *(_QWORD *)(v1 + 64) = v9;
        operator delete(v9);
      }
      v10 = *v2;
      if (*v2)
      {
        *(_QWORD *)(v1 + 40) = v10;
        operator delete(v10);
      }
      v11 = *(void **)v1;
      if (*(_QWORD *)v1)
      {
        *(_QWORD *)(v1 + 8) = v11;
        operator delete(v11);
      }
      _Unwind_Resume(exception_object);
    }
  }
}

void std::vector<unsigned long long>::resize(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<unsigned long long>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<unsigned int>::resize(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __sz, std::vector<unsigned int>::const_reference __x)
{
  std::vector<unsigned int>::size_type v3;

  v3 = this->__end_ - this->__begin_;
  if (__sz <= v3)
  {
    if (__sz < v3)
      this->__end_ = &this->__begin_[__sz];
  }
  else
  {
    std::vector<unsigned int>::__append(this, __sz - v3, __x);
  }
}

void std::vector<unsigned long long>::__append(void **a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  uint64_t v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 3)
  {
    if (a2)
    {
      v16 = 8 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 3);
    if (v11 >> 61)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v12 = v10 >> 3;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 2 > v11)
      v11 = v13 >> 2;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(v6, v14);
    else
      v15 = 0;
    v18 = &v15[8 * v12];
    v19 = &v18[8 * a2];
    v20 = 8 * a2;
    v21 = v18;
    do
    {
      *(_QWORD *)v21 = *a3;
      v21 += 8;
      v20 -= 8;
    }
    while (v20);
    v22 = &v15[8 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 8)
    {
      v25 = *((_QWORD *)i - 1);
      *((_QWORD *)v18 - 1) = v25;
      v18 -= 8;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

void std::vector<unsigned int>::__append(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n, std::vector<unsigned int>::const_reference __x)
{
  std::__compressed_pair<unsigned int *> *p_end_cap;
  unsigned int *v7;
  unsigned int *value;
  unsigned int *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  std::vector<unsigned int>::size_type v16;
  unsigned int *v17;
  unsigned int *v18;
  unsigned int *v19;
  std::vector<unsigned int>::size_type v20;
  unsigned int *v21;
  unsigned int *v22;
  std::vector<unsigned int>::pointer begin;
  std::vector<unsigned int>::pointer i;
  unsigned int v25;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v7 = value;
  v9 = p_end_cap[-1].__value_;
  if (__n <= value - v9)
  {
    if (__n)
    {
      v16 = 4 * __n;
      v17 = &v9[__n];
      do
      {
        *v9++ = *__x;
        v16 -= 4;
      }
      while (v16);
      v9 = v17;
    }
    this->__end_ = v9;
  }
  else
  {
    v10 = (char *)v9 - (char *)this->__begin_;
    v11 = __n + (v10 >> 2);
    if (v11 >> 62)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v12 = v10 >> 2;
    v13 = (char *)v7 - (char *)this->__begin_;
    if (v13 >> 1 > v11)
      v11 = v13 >> 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
      v14 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)p_end_cap, v14);
    else
      v15 = 0;
    v18 = (unsigned int *)&v15[4 * v12];
    v19 = &v18[__n];
    v20 = 4 * __n;
    v21 = v18;
    do
    {
      *v21++ = *__x;
      v20 -= 4;
    }
    while (v20);
    v22 = (unsigned int *)&v15[4 * v14];
    begin = this->__begin_;
    for (i = this->__end_; i != begin; --i)
    {
      v25 = *(i - 1);
      *--v18 = v25;
    }
    this->__begin_ = v18;
    this->__end_ = v19;
    this->__end_cap_.__value_ = v22;
    if (begin)
      operator delete(begin);
  }
}

uint64_t ___ZN8GPUTools17RunningStatisticsIyE10AddElementERKy_block_invoke(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  _BOOL4 v7;

  v3 = **(_QWORD **)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 8 * *a2);
  v5 = *(_QWORD *)(v3 + 8 * *a3);
  v6 = v4 >= v5;
  v7 = v4 > v5;
  if (v6)
    return v7;
  else
    return 0xFFFFFFFFLL;
}

double GPUTools::Playback::SequenceCache::SequenceCache(GPUTools::Playback::SequenceCache *this)
{
  double result;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 4) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  return result;
}

{
  double result;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 4) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  return result;
}

void GPUTools::Playback::SequenceCache::~SequenceCache(GPUTools::Playback::SequenceCache *this)
{
  void *v2;
  void **v3;

  v3 = (void **)((char *)this + 48);
  std::vector<std::vector<std::pair<unsigned int,unsigned int>>>::__destroy_vector::operator()[abi:ne180100](&v3);
  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    *((_QWORD *)this + 4) = v2;
    operator delete(v2);
  }
}

void GPUTools::Playback::SequenceCache::Begin(GPUTools::Playback::SequenceCache *this)
{
  int v2;
  std::vector<unsigned int>::size_type v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unsigned int v7;
  int v8;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  unsigned int v40;
  char v41;
  _DWORD *v42;
  uint64_t v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  unint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  unint64_t v78;
  _QWORD *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  char *v85;
  char *v86;
  char *v87;
  char *v88;
  uint64_t v89;
  const char *v90;
  _Unwind_Exception *v91;
  unsigned int v92;
  void *__p;
  char *v94;
  char *v95;

  v2 = *(_DWORD *)this;
  if (*(_DWORD *)this == 3)
    goto LABEL_127;
  *(_DWORD *)this = v2 + 1;
  if (!v2)
    goto LABEL_127;
  if (v2 != 2)
  {
    if (v2 != 1)
    {
      v91 = (_Unwind_Exception *)dy_abort();
      if (__p)
      {
        v94 = (char *)__p;
        operator delete(__p);
      }
      _Unwind_Resume(v91);
    }
    *((_DWORD *)this + 2) = *((_DWORD *)this + 1);
    v3 = *((unsigned int *)this + 3);
    *((_DWORD *)this + 4) = v3;
    std::vector<unsigned int>::reserve((std::vector<unsigned int> *)this + 1, v3);
    goto LABEL_127;
  }
  v4 = *((unsigned int *)this + 2);
  if ((_DWORD)v4 != *((_DWORD *)this + 1)
    || (v5 = *((_QWORD *)this + 4), *((_DWORD *)this + 4) != (v5 - *((_QWORD *)this + 3)) >> 2))
  {
    v90 = "(_streamNum == _streamIdx) && (_dataList.size() == _dataNum)";
    goto LABEL_131;
  }
  if (*(_DWORD *)(v5 - 4))
  {
    v90 = "_dataList.back() == 0";
LABEL_131:
    __assert_rtn("void GPUTools::Playback::SequenceCache::Begin()", "", 0, v90);
  }
  v6 = (uint64_t *)((char *)this + 48);
  std::vector<std::vector<std::pair<unsigned int,unsigned int>>>::reserve((uint64_t *)this + 6, v4);
  if (!*((_DWORD *)this + 4))
    goto LABEL_127;
  v7 = 0;
  do
  {
    v8 = 0;
    while (*(_DWORD *)(*((_QWORD *)this + 3) + 4 * (v7 + v8++)))
      ;
    __p = 0;
    v94 = 0;
    v95 = 0;
    std::vector<std::vector<std::pair<unsigned int,unsigned int>>>::push_back[abi:ne180100](v6, (uint64_t)&__p);
    if (__p)
    {
      v94 = (char *)__p;
      operator delete(__p);
    }
    v10 = v7 + v8;
    v11 = v8 - 1;
    if (v8 == 1)
      goto LABEL_126;
    __p = 0;
    v94 = 0;
    v95 = 0;
    std::vector<std::pair<unsigned int,unsigned int>>::reserve(&__p, (v8 - 1));
    v92 = v7 + v8;
    v12 = v10 - 1;
    v13 = v7 + 1;
    if (v13 >= v10 - 1)
    {
      v17 = v7;
    }
    else
    {
      v14 = v7;
      do
      {
        v15 = *((_QWORD *)this + 3);
        v16 = *(unsigned int *)(v15 + 4 * v14);
        if ((_DWORD)v16 == *(_DWORD *)(v15 + 4 * v13))
        {
          v17 = v14;
        }
        else
        {
          v17 = v13;
          v18 = v13 - v14;
          v19 = v94;
          if (v94 >= v95)
          {
            v21 = (v94 - (_BYTE *)__p) >> 3;
            if ((unint64_t)(v21 + 1) >> 61)
              std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
            v22 = (v95 - (_BYTE *)__p) >> 2;
            if (v22 <= v21 + 1)
              v22 = v21 + 1;
            if ((unint64_t)(v95 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
              v23 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v23 = v22;
            if (v23)
              v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v95, v23);
            else
              v24 = 0;
            v25 = &v24[8 * v21];
            *(_QWORD *)v25 = v18 | (v16 << 32);
            v20 = v25 + 8;
            v27 = (char *)__p;
            v26 = v94;
            if (v94 != __p)
            {
              do
              {
                v28 = *((_QWORD *)v26 - 1);
                v26 -= 8;
                *((_QWORD *)v25 - 1) = v28;
                v25 -= 8;
              }
              while (v26 != v27);
              v26 = (char *)__p;
            }
            __p = v25;
            v94 = v20;
            v95 = &v24[8 * v23];
            if (v26)
              operator delete(v26);
          }
          else
          {
            *(_QWORD *)v94 = v18 | (v16 << 32);
            v20 = v19 + 8;
          }
          v94 = v20;
          v14 = v13;
        }
        ++v13;
      }
      while (v12 != (_DWORD)v13);
      v11 = v7 - v17 + v8 - 1;
    }
    v29 = *(unsigned int *)(*((_QWORD *)this + 3) + 4 * v17);
    v30 = v94;
    if (v94 >= v95)
    {
      v32 = (v94 - (_BYTE *)__p) >> 3;
      if ((unint64_t)(v32 + 1) >> 61)
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      v33 = (v95 - (_BYTE *)__p) >> 2;
      if (v33 <= v32 + 1)
        v33 = v32 + 1;
      if ((unint64_t)(v95 - (_BYTE *)__p) >= 0x7FFFFFFFFFFFFFF8)
        v34 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v34 = v33;
      if (v34)
        v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>((uint64_t)&v95, v34);
      else
        v35 = 0;
      v36 = &v35[8 * v32];
      *(_QWORD *)v36 = v11 | (unint64_t)(v29 << 32);
      v31 = v36 + 8;
      v38 = (char *)__p;
      v37 = v94;
      if (v94 != __p)
      {
        do
        {
          v39 = *((_QWORD *)v37 - 1);
          v37 -= 8;
          *((_QWORD *)v36 - 1) = v39;
          v36 -= 8;
        }
        while (v37 != v38);
        v37 = (char *)__p;
      }
      __p = v36;
      v94 = v31;
      v95 = &v35[8 * v34];
      if (v37)
        operator delete(v37);
    }
    else
    {
      *(_QWORD *)v94 = v11 | (unint64_t)(v29 << 32);
      v31 = v30 + 8;
    }
    v40 = 0;
    v94 = v31;
    v41 = 1;
    while (2)
    {
      v42 = __p;
      if (v94 == __p)
        goto LABEL_121;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      do
      {
        v46 = v42[2 * v43];
        if (v46 <= 9)
        {
          v45 += v46;
          goto LABEL_100;
        }
        if (v45)
        {
          if ((v41 & 1) != 0)
          {
            ++v40;
LABEL_82:
            v45 = 0;
            ++v40;
            goto LABEL_100;
          }
          v47 = *((_QWORD *)this + 7);
          v48 = *(_QWORD **)(v47 - 16);
          v49 = *(_QWORD *)(v47 - 8);
          if ((unint64_t)v48 >= v49)
          {
            v51 = *(_QWORD *)(v47 - 24);
            v52 = ((uint64_t)v48 - v51) >> 3;
            if ((unint64_t)(v52 + 1) >> 61)
              goto LABEL_128;
            v53 = v49 - v51;
            v54 = v53 >> 2;
            if (v53 >> 2 <= (unint64_t)(v52 + 1))
              v54 = v52 + 1;
            if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF8)
              v55 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v55 = v54;
            if (v55)
              v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(v47 - 8, v55);
            else
              v56 = 0;
            v57 = &v56[8 * v52];
            *(_QWORD *)v57 = v45;
            v50 = v57 + 8;
            v59 = *(char **)(v47 - 24);
            v58 = *(char **)(v47 - 16);
            if (v58 != v59)
            {
              do
              {
                v60 = *((_QWORD *)v58 - 1);
                v58 -= 8;
                *((_QWORD *)v57 - 1) = v60;
                v57 -= 8;
              }
              while (v58 != v59);
              v58 = *(char **)(v47 - 24);
            }
            *(_QWORD *)(v47 - 24) = v57;
            *(_QWORD *)(v47 - 16) = v50;
            *(_QWORD *)(v47 - 8) = &v56[8 * v55];
            if (v58)
              operator delete(v58);
          }
          else
          {
            *v48 = v45;
            v50 = v48 + 1;
          }
          *(_QWORD *)(v47 - 16) = v50;
        }
        if ((v41 & 1) != 0)
          goto LABEL_82;
        v61 = *((_QWORD *)this + 7);
        v62 = __p;
        v63 = *(_QWORD **)(v61 - 16);
        v64 = *(_QWORD *)(v61 - 8);
        if ((unint64_t)v63 >= v64)
        {
          v66 = *(_QWORD *)(v61 - 24);
          v67 = ((uint64_t)v63 - v66) >> 3;
          if ((unint64_t)(v67 + 1) >> 61)
LABEL_128:
            std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
          v68 = v64 - v66;
          v69 = v68 >> 2;
          if (v68 >> 2 <= (unint64_t)(v67 + 1))
            v69 = v67 + 1;
          if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF8)
            v70 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v70 = v69;
          if (v70)
            v71 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(v61 - 8, v70);
          else
            v71 = 0;
          v72 = &v71[8 * v67];
          *(_QWORD *)v72 = v62[v43];
          v65 = v72 + 8;
          v74 = *(char **)(v61 - 24);
          v73 = *(char **)(v61 - 16);
          if (v73 != v74)
          {
            do
            {
              v75 = *((_QWORD *)v73 - 1);
              v73 -= 8;
              *((_QWORD *)v72 - 1) = v75;
              v72 -= 8;
            }
            while (v73 != v74);
            v73 = *(char **)(v61 - 24);
          }
          *(_QWORD *)(v61 - 24) = v72;
          *(_QWORD *)(v61 - 16) = v65;
          *(_QWORD *)(v61 - 8) = &v71[8 * v70];
          if (v73)
            operator delete(v73);
        }
        else
        {
          *v63 = *((_QWORD *)__p + v43);
          v65 = v63 + 1;
        }
        v45 = 0;
        *(_QWORD *)(v61 - 16) = v65;
LABEL_100:
        v42 = __p;
        v43 = ++v44;
      }
      while (v44 < (unint64_t)((v94 - (_BYTE *)__p) >> 3));
      if (v45)
      {
        if ((v41 & 1) != 0)
        {
          ++v40;
          goto LABEL_122;
        }
        v76 = *((_QWORD *)this + 7);
        v77 = *(_QWORD **)(v76 - 16);
        v78 = *(_QWORD *)(v76 - 8);
        if ((unint64_t)v77 >= v78)
        {
          v80 = *(_QWORD *)(v76 - 24);
          v81 = ((uint64_t)v77 - v80) >> 3;
          if ((unint64_t)(v81 + 1) >> 61)
            std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
          v82 = v78 - v80;
          v83 = v82 >> 2;
          if (v82 >> 2 <= (unint64_t)(v81 + 1))
            v83 = v81 + 1;
          if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF8)
            v84 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v84 = v83;
          if (v84)
            v85 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(v76 - 8, v84);
          else
            v85 = 0;
          v86 = &v85[8 * v81];
          *(_QWORD *)v86 = v45;
          v79 = v86 + 8;
          v88 = *(char **)(v76 - 24);
          v87 = *(char **)(v76 - 16);
          if (v87 != v88)
          {
            do
            {
              v89 = *((_QWORD *)v87 - 1);
              v87 -= 8;
              *((_QWORD *)v86 - 1) = v89;
              v86 -= 8;
            }
            while (v87 != v88);
            v87 = *(char **)(v76 - 24);
          }
          *(_QWORD *)(v76 - 24) = v86;
          *(_QWORD *)(v76 - 16) = v79;
          *(_QWORD *)(v76 - 8) = &v85[8 * v84];
          if (v87)
            operator delete(v87);
        }
        else
        {
          *v77 = v45;
          v79 = v77 + 1;
        }
        *(_QWORD *)(v76 - 16) = v79;
      }
LABEL_121:
      if ((v41 & 1) != 0)
      {
LABEL_122:
        std::vector<std::pair<unsigned int,unsigned int>>::reserve((void **)(*((_QWORD *)this + 7) - 24), v40);
        v41 = 0;
        continue;
      }
      break;
    }
    if (__p)
    {
      v94 = (char *)__p;
      operator delete(__p);
    }
    v6 = (uint64_t *)((char *)this + 48);
    v10 = v92;
LABEL_126:
    v7 = v10;
  }
  while (v10 < *((_DWORD *)this + 4));
LABEL_127:
  *((_DWORD *)this + 1) = 0;
  *((_DWORD *)this + 3) = 0;
}

void std::vector<unsigned int>::reserve(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  std::__compressed_pair<unsigned int *> *p_end_cap;
  unsigned int *value;
  int64_t v5;
  char *v6;
  unsigned int *v7;
  uint64_t v8;
  unsigned int *v9;
  std::vector<unsigned int>::pointer begin;
  unsigned int *end;
  unsigned int *v12;
  unsigned int v13;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  if (__n > value - this->__begin_)
  {
    if (__n >> 62)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v5 = (char *)this->__end_ - (char *)this->__begin_;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)p_end_cap, __n);
    v7 = (unsigned int *)&v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = (unsigned int *)&v6[4 * v8];
    begin = this->__begin_;
    end = this->__end_;
    v12 = v7;
    if (end != this->__begin_)
    {
      v12 = v7;
      do
      {
        v13 = *--end;
        *--v12 = v13;
      }
      while (end != begin);
    }
    this->__begin_ = v12;
    this->__end_ = v7;
    this->__end_cap_.__value_ = v9;
    if (begin)
      operator delete(begin);
  }
}

uint64_t std::vector<std::vector<std::pair<unsigned int,unsigned int>>>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<std::pair<unsigned int,unsigned int>>>>(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 24 * v6;
    std::vector<std::vector<std::pair<unsigned int,unsigned int>>>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_23C6AD310(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<std::pair<unsigned int,unsigned int>>>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD v16[5];

  v6 = a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    v9 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - *a1) >> 3);
    v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 3);
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v10;
    v16[4] = result;
    v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<std::pair<unsigned int,unsigned int>>>>(result, v12);
    v14 = &v13[24 * v9];
    v16[0] = v13;
    v16[1] = v14;
    v16[3] = &v13[24 * v15];
    *((_QWORD *)v14 + 1) = 0;
    *((_QWORD *)v14 + 2) = 0;
    *(_QWORD *)v14 = 0;
    *(_OWORD *)v14 = *(_OWORD *)a2;
    *((_QWORD *)v14 + 2) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    v16[2] = v14 + 24;
    std::vector<std::vector<std::pair<unsigned int,unsigned int>>>::__swap_out_circular_buffer(a1, v16);
    v8 = (_QWORD *)a1[1];
    result = std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)v16);
  }
  else
  {
    *v7 = 0;
    v7[1] = 0;
    v7[2] = 0;
    *(_OWORD *)v7 = *(_OWORD *)a2;
    v7[2] = *(_QWORD *)(a2 + 16);
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    v8 = v7 + 3;
    a1[1] = (uint64_t)(v7 + 3);
  }
  a1[1] = (uint64_t)v8;
  return result;
}

void sub_23C6AD44C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::vector<std::pair<unsigned int,unsigned int>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long long>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void std::vector<std::vector<std::pair<unsigned int,unsigned int>>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<std::pair<unsigned int,unsigned int>>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::vector<std::pair<unsigned int,unsigned int>>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

uint64_t std::vector<std::vector<std::pair<unsigned int,unsigned int>>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<std::pair<unsigned int,unsigned int>>>,std::reverse_iterator<std::vector<std::pair<unsigned int,unsigned int>>*>,std::reverse_iterator<std::vector<std::pair<unsigned int,unsigned int>>*>,std::reverse_iterator<std::vector<std::pair<unsigned int,unsigned int>>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<std::pair<unsigned int,unsigned int>>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<std::pair<unsigned int,unsigned int>>>,std::reverse_iterator<std::vector<std::pair<unsigned int,unsigned int>>*>,std::reverse_iterator<std::vector<std::pair<unsigned int,unsigned int>>*>,std::reverse_iterator<std::vector<std::pair<unsigned int,unsigned int>>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::pair<unsigned int,unsigned int>>>,std::reverse_iterator<std::vector<std::pair<unsigned int,unsigned int>>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::pair<unsigned int,unsigned int>>>,std::reverse_iterator<std::vector<std::pair<unsigned int,unsigned int>>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::pair<unsigned int,unsigned int>>>,std::reverse_iterator<std::vector<std::pair<unsigned int,unsigned int>>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<std::pair<unsigned int,unsigned int>>>,std::reverse_iterator<std::vector<std::pair<unsigned int,unsigned int>>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::vector<std::pair<unsigned int,unsigned int>>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void sub_23C6AD994(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<GPUTools::objc_ref<DYCaptureArchive *>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_23C6AE1CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  uint64_t v22;
  void *v24;

  v24 = *(void **)v22;
  if (*(_QWORD *)v22)
  {
    *(_QWORD *)(v22 + 8) = v24;
    operator delete(v24);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::pair<dy_capture_index_file_entry_t *,unsigned long>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 4)
  {
    if (a2 >> 60)
      std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_capture_index_file_entry_t *,unsigned long>>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    v9 = &v6[16 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

uint64_t std::vector<GPUTools::objc_ref<DYCaptureArchive *>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>,std::reverse_iterator<GPUTools::objc_ref<DYCaptureArchive *>*>,std::reverse_iterator<GPUTools::objc_ref<DYCaptureArchive *>*>,std::reverse_iterator<GPUTools::objc_ref<DYCaptureArchive *>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>,std::reverse_iterator<GPUTools::objc_ref<DYCaptureArchive *>*>,std::reverse_iterator<GPUTools::objc_ref<DYCaptureArchive *>*>,std::reverse_iterator<GPUTools::objc_ref<DYCaptureArchive *>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    v8 = a7;
    do
    {
      v9 = *--a3;
      *(_QWORD *)(v8 - 8) = v9;
      v8 -= 8;
      *a3 = 0;
      v7 -= 8;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v8;
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>,std::reverse_iterator<GPUTools::objc_ref<DYCaptureArchive *>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>,std::reverse_iterator<GPUTools::objc_ref<DYCaptureArchive *>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>,std::reverse_iterator<GPUTools::objc_ref<DYCaptureArchive *>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>,std::reverse_iterator<GPUTools::objc_ref<DYCaptureArchive *>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[8];
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[8];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v1 = (uint64_t *)a1[2];
  v3 = *v1;
  v2 = v1[1];
  v14 = v3;
  v15 = v2;
  v16 = v3;
  v17 = v2;
  v4 = *a1;
  v5 = (uint64_t *)a1[1];
  v7 = *v5;
  v6 = v5[1];
  v9 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v6;
  std::__allocator_destroy[abi:ne180100]<std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>,std::reverse_iterator<std::reverse_iterator<GPUTools::objc_ref<DYCaptureArchive *>*>>,std::reverse_iterator<std::reverse_iterator<GPUTools::objc_ref<DYCaptureArchive *>*>>>(v4, (uint64_t)v13, (uint64_t)v8);
}

void std::__allocator_destroy[abi:ne180100]<std::allocator<GPUTools::objc_ref<DYCaptureArchive *>>,std::reverse_iterator<std::reverse_iterator<GPUTools::objc_ref<DYCaptureArchive *>*>>,std::reverse_iterator<std::reverse_iterator<GPUTools::objc_ref<DYCaptureArchive *>*>>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id *i;

  for (i = *(id **)(a2 + 32); i != *(id **)(a3 + 32); *(_QWORD *)(a2 + 32) = i)
  {

    i = (id *)(*(_QWORD *)(a2 + 32) + 8);
  }
}

uint64_t std::__split_buffer<GPUTools::objc_ref<DYCaptureArchive *>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<GPUTools::objc_ref<DYCaptureArchive *>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<GPUTools::objc_ref<DYCaptureArchive *>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;

  while (1)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 == a2)
      break;
    v5 = *(void **)(v4 - 8);
    *(_QWORD *)(a1 + 16) = v4 - 8;

  }
}

void std::vector<GPUTools::objc_ref<DYCaptureArchive *>>::__base_destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t i;
  void *v5;

  for (i = *(_QWORD *)(a1 + 8); i != a2; i -= 8)
  {
    v5 = *(void **)(i - 8);

  }
  *(_QWORD *)(a1 + 8) = a2;
}

char *std::__hash_table<std::__hash_value_type<char const*,std::pair<dy_capture_index_file_entry_t *,unsigned long>>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,std::pair<dy_capture_index_file_entry_t *,unsigned long>>,GPUTools::CStringHash::hash,GPUTools::CStringHash::equal,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,std::pair<dy_capture_index_file_entry_t *,unsigned long>>,GPUTools::CStringHash::equal,GPUTools::CStringHash::hash,true>,std::allocator<std::__hash_value_type<char const*,std::pair<dy_capture_index_file_entry_t *,unsigned long>>>>::__emplace_unique_key_args<char const*,char const*&,std::pair<dy_capture_index_file_entry_t *,unsigned long>>(uint64_t a1, const char **a2, _QWORD *a3, _OWORD *a4)
{
  unint64_t v4;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  void **v15;
  char *v16;
  const char *v17;
  unint64_t v18;
  float v19;
  float v20;
  _BOOL8 v21;
  unint64_t v22;
  unint64_t v23;
  size_t v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t v27;

  v9 = (_QWORD *)(a1 + 24);
  v10 = GPUTools::CStringHash::hash::operator()(a1 + 24, *a2);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      v4 = v10;
      if (v10 >= v12)
        v4 = v10 % v12;
    }
    else
    {
      v4 = (v12 - 1) & v10;
    }
    v15 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      v16 = (char *)*v15;
      if (*v15)
      {
        v17 = *a2;
        do
        {
          v18 = *((_QWORD *)v16 + 1);
          if (v18 == v11)
          {
            if (!strcmp(*((const char **)v16 + 2), v17))
              return v16;
          }
          else
          {
            if (v14 > 1)
            {
              if (v18 >= v12)
                v18 %= v12;
            }
            else
            {
              v18 &= v12 - 1;
            }
            if (v18 != v4)
              break;
          }
          v16 = *(char **)v16;
        }
        while (v16);
      }
    }
  }
  v16 = (char *)operator new(0x28uLL);
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = v11;
  *((_QWORD *)v16 + 2) = *a3;
  *(_OWORD *)(v16 + 24) = *a4;
  v19 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v20 = *(float *)(a1 + 32);
  if (!v12 || (float)(v20 * (float)v12) < v19)
  {
    v21 = 1;
    if (v12 >= 3)
      v21 = (v12 & (v12 - 1)) != 0;
    v22 = v21 | (2 * v12);
    v23 = vcvtps_u32_f32(v19 / v20);
    if (v22 <= v23)
      v24 = v23;
    else
      v24 = v22;
    std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__rehash<true>(a1, v24);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v25 = *(_QWORD *)a1;
  v26 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v26)
  {
    *(_QWORD *)v16 = *v26;
LABEL_39:
    *v26 = v16;
    goto LABEL_40;
  }
  *(_QWORD *)v16 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v16;
  *(_QWORD *)(v25 + 8 * v4) = a1 + 16;
  if (*(_QWORD *)v16)
  {
    v27 = *(_QWORD *)(*(_QWORD *)v16 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v27 >= v12)
        v27 %= v12;
    }
    else
    {
      v27 &= v12 - 1;
    }
    v26 = (_QWORD *)(*(_QWORD *)a1 + 8 * v27);
    goto LABEL_39;
  }
LABEL_40:
  ++*v9;
  return v16;
}

void sub_23C6AF270(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::CStringHash::hash::operator()(uint64_t a1, _BYTE *a2)
{
  unsigned int v2;
  int v3;
  unsigned __int8 *v4;
  int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;

  v2 = -1640531527;
  v3 = *a2;
  if (*a2)
  {
    v4 = a2 + 2;
    while (1)
    {
      v5 = *(v4 - 1);
      if (!*(v4 - 1))
        break;
      v6 = v2 + v3;
      v7 = *v4;
      v4 += 2;
      v3 = v7;
      v2 = ((v6 << 16) ^ (v5 << 11) ^ v6) + (((v6 << 16) ^ (v5 << 11) ^ v6) >> 11);
      if (!v7)
        goto LABEL_7;
    }
    v2 = ((v2 + v3) ^ ((v2 + v3) << 11)) + (((v2 + v3) ^ ((v2 + v3) << 11)) >> 17);
  }
LABEL_7:
  v8 = (v2 ^ (8 * v2)) + ((v2 ^ (8 * v2)) >> 5);
  v9 = (v8 ^ (4 * v8)) + ((v8 ^ (4 * v8)) >> 15);
  v10 = v9 ^ (v9 << 10);
  if (v10)
    return v10;
  else
    return 0x40000000;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<dy_capture_index_file_entry_t *,unsigned long>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*,false>(uint64_t result, __int128 *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  char v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v8 = (uint64_t *)result;
LABEL_2:
  v9 = v8;
LABEL_3:
  v10 = 1 - a4;
  while (2)
  {
    v8 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = ((char *)a2 - (char *)v9) >> 4;
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        result = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
        if ((_DWORD)result)
        {
          v22 = *v9;
          v23 = v9[1];
          v24 = *((_QWORD *)a2 - 1);
          *v9 = *((_QWORD *)a2 - 2);
          v9[1] = v24;
          *((_QWORD *)a2 - 2) = v22;
          *((_QWORD *)a2 - 1) = v23;
        }
        return result;
      case 3uLL:
        return std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(v9, v9 + 2, (uint64_t *)a2 - 2, a3);
      case 4uLL:
        return std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(v9, v9 + 2, v9 + 4, (uint64_t *)a2 - 2, a3);
      case 5uLL:
        return std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(v9, v9 + 2, v9 + 4, v9 + 6, (uint64_t *)a2 - 2, a3);
      default:
        if (v12 <= 383)
        {
          if ((a5 & 1) != 0)
            return std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>((uint64_t)v9, a2, a3);
          else
            return std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>((uint64_t)v9, a2, a3);
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = &v9[2 * (v13 >> 1)];
          if ((unint64_t)v12 < 0x801)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(&v9[2 * (v13 >> 1)], v9, (uint64_t *)a2 - 2, a3);
            if ((a5 & 1) != 0)
              goto LABEL_12;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(v9, &v9[2 * (v13 >> 1)], (uint64_t *)a2 - 2, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(v9 + 2, v15 - 2, (uint64_t *)a2 - 4, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(v9 + 4, &v9[2 * v14 + 2], (uint64_t *)a2 - 6, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(v15 - 2, v15, &v9[2 * v14 + 2], a3);
            v16 = *v9;
            v17 = v9[1];
            v18 = v15[1];
            *v9 = *v15;
            v9[1] = v18;
            *v15 = v16;
            v15[1] = v17;
            if ((a5 & 1) != 0)
              goto LABEL_12;
          }
          if (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0)
          {
            result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<dy_capture_index_file_entry_t *,unsigned long> *,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long>&,std::pair<dy_capture_index_file_entry_t *,unsigned long>&)>(v9, a2, a3);
            v9 = (uint64_t *)result;
            goto LABEL_17;
          }
LABEL_12:
          v19 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<dy_capture_index_file_entry_t *,unsigned long> *,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long>&,std::pair<dy_capture_index_file_entry_t *,unsigned long>&)>(v9, a2, a3);
          if ((v20 & 1) == 0)
            goto LABEL_15;
          v21 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(v9, v19, a3);
          v9 = v19 + 2;
          result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(v19 + 2, (uint64_t *)a2, a3);
          if (!(_DWORD)result)
          {
            v10 = v11 + 1;
            if (v21)
              continue;
LABEL_15:
            result = std::__introsort<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*,false>(v8, v19, a3, -v11, a5 & 1);
            v9 = v19 + 2;
LABEL_17:
            a5 = 0;
            a4 = -v11;
            goto LABEL_3;
          }
          a4 = -v11;
          a2 = (__int128 *)v19;
          if (v21)
            return result;
          goto LABEL_2;
        }
        if (v9 != (uint64_t *)a2)
          return (uint64_t)std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*,std::pair<dy_capture_index_file_entry_t *,unsigned long>*>((uint64_t)v9, (uint64_t *)a2, (uint64_t *)a2, a3);
        return result;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(uint64_t result, __int128 *a2, uint64_t a3)
{
  _OWORD *v4;
  __int128 *v5;
  uint64_t v7;
  __int128 *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _OWORD *v12;
  __int128 v13;

  if ((__int128 *)result != a2)
  {
    v4 = (_OWORD *)result;
    v5 = (__int128 *)(result + 16);
    if ((__int128 *)(result + 16) != a2)
    {
      v7 = 0;
      do
      {
        v8 = v5;
        result = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
        if ((_DWORD)result)
        {
          v13 = *v8;
          v9 = v7;
          while (1)
          {
            v10 = (char *)v4 + v9;
            v11 = *(_QWORD *)((char *)v4 + v9 + 8);
            *((_QWORD *)v10 + 2) = *(_QWORD *)((char *)v4 + v9);
            *((_QWORD *)v10 + 3) = v11;
            if (!v9)
              break;
            v9 -= 16;
            result = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
            if ((result & 1) == 0)
            {
              v12 = (_OWORD *)((char *)v4 + v9 + 16);
              goto LABEL_10;
            }
          }
          v12 = v4;
LABEL_10:
          *v12 = v13;
        }
        v5 = v8 + 1;
        v7 += 16;
      }
      while (v8 + 1 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(uint64_t result, __int128 *a2, uint64_t a3)
{
  __int128 *v4;
  _QWORD *v6;
  __int128 *v7;
  _QWORD *v8;
  uint64_t v9;
  __int128 v10;

  if ((__int128 *)result != a2)
  {
    v4 = (__int128 *)(result + 16);
    if ((__int128 *)(result + 16) != a2)
    {
      v6 = (_QWORD *)(result - 16);
      do
      {
        v7 = v4;
        result = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
        if ((_DWORD)result)
        {
          v10 = *v7;
          v8 = v6;
          do
          {
            v9 = v8[3];
            v8[4] = v8[2];
            v8[5] = v9;
            result = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
            v8 -= 2;
          }
          while ((result & 1) != 0);
          *((_OWORD *)v8 + 2) = v10;
        }
        v4 = v7 + 1;
        v6 += 2;
      }
      while (v7 + 1 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v8 = (*(uint64_t (**)(void))(*(_QWORD *)a4 + 16))();
  result = (*(uint64_t (**)(void))(*(_QWORD *)a4 + 16))();
  if ((v8 & 1) != 0)
  {
    v10 = *a1;
    if ((_DWORD)result)
    {
      *a1 = *a3;
      *a3 = v10;
      v11 = a3 + 1;
      result = 1;
      v12 = a1 + 1;
LABEL_9:
      v15 = v11;
      goto LABEL_10;
    }
    v18 = a2[1];
    v19 = a1[1];
    *a1 = *a2;
    *a2 = v10;
    a1[1] = v18;
    a2[1] = v19;
    if ((*(unsigned int (**)(void))(*(_QWORD *)a4 + 16))())
    {
      v20 = *a2;
      *a2 = *a3;
      *a3 = v20;
      v11 = a3 + 1;
      result = 2;
      v12 = a2 + 1;
      goto LABEL_9;
    }
  }
  else
  {
    if (!(_DWORD)result)
      return result;
    v13 = *a2;
    v15 = a2 + 1;
    v14 = a2[1];
    v16 = a3[1];
    *a2 = *a3;
    a2[1] = v16;
    *a3 = v13;
    a3[1] = v14;
    if ((*(unsigned int (**)(void))(*(_QWORD *)a4 + 16))())
    {
      v17 = *a1;
      *a1 = *a2;
      v12 = a1 + 1;
      *a2 = v17;
      result = 2;
LABEL_10:
      v21 = *v12;
      *v12 = *v15;
      *v15 = v21;
      return result;
    }
  }
  return 1;
}

_QWORD *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<dy_capture_index_file_entry_t *,unsigned long> *,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long>&,std::pair<dy_capture_index_file_entry_t *,unsigned long>&)>(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;

  v12 = *(_OWORD *)a1;
  if (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0)
  {
    v6 = a1;
    do
      v6 += 2;
    while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0);
  }
  else
  {
    v7 = a1 + 2;
    do
    {
      v6 = v7;
      if (v7 >= a2)
        break;
      v8 = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
      v7 = v6 + 2;
    }
    while (!v8);
  }
  if (v6 < a2)
  {
    do
      a2 -= 2;
    while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
  }
  while (v6 < a2)
  {
    v9 = *v6;
    *v6 = *a2;
    *a2 = v9;
    v10 = v6[1];
    v6[1] = a2[1];
    a2[1] = v10;
    do
      v6 += 2;
    while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))());
    do
      a2 -= 2;
    while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
  }
  if (v6 - 2 != a1)
  {
    *a1 = *(v6 - 2);
    a1[1] = *(v6 - 1);
  }
  *((_OWORD *)v6 - 1) = v12;
  return v6;
}

_QWORD *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<dy_capture_index_file_entry_t *,unsigned long> *,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long>&,std::pair<dy_capture_index_file_entry_t *,unsigned long>&)>(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *result;
  __int128 v13;

  v6 = 0;
  v13 = *(_OWORD *)a1;
  do
    v6 += 2;
  while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
  v7 = &a1[v6];
  if (v6 == 2)
  {
    do
    {
      if (v7 >= a2)
        break;
      a2 -= 2;
    }
    while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0);
  }
  else
  {
    do
      a2 -= 2;
    while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))());
  }
  v8 = &a1[v6];
  if (v7 < a2)
  {
    v9 = a2;
    do
    {
      v10 = *v8;
      *v8 = *v9;
      *v9 = v10;
      v11 = v8[1];
      v8[1] = v9[1];
      v9[1] = v11;
      do
        v8 += 2;
      while (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) != 0);
      do
        v9 -= 2;
      while (!(*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))());
    }
    while (v8 < v9);
  }
  result = v8 - 2;
  if (v8 - 2 != a1)
  {
    *a1 = *(v8 - 2);
    a1[1] = *(v8 - 1);
  }
  *((_OWORD *)v8 - 1) = v13;
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  __int128 v17;

  v6 = ((char *)a2 - (char *)a1) >> 4;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
      {
        v8 = *a1;
        *a1 = *(a2 - 2);
        *(a2 - 2) = v8;
        v9 = a1[1];
        a1[1] = *(a2 - 1);
        *(a2 - 1) = v9;
      }
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(a1, a1 + 2, a2 - 2, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(a1, a1 + 2, a1 + 4, a2 - 2, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(a1, a1 + 2, a1 + 4, a1 + 6, a2 - 2, a3);
      return 1;
    default:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(a1, a1 + 2, a1 + 4, a3);
      v10 = (__int128 *)(a1 + 6);
      if (a1 + 6 == a2)
        return 1;
      v11 = 0;
      v12 = 0;
      break;
  }
  while (1)
  {
    if ((*(unsigned int (**)(void))(*(_QWORD *)a3 + 16))())
    {
      v17 = *v10;
      v13 = v11;
      while (1)
      {
        v14 = (char *)a1 + v13;
        v15 = *(uint64_t *)((char *)a1 + v13 + 40);
        *((_QWORD *)v14 + 6) = *(uint64_t *)((char *)a1 + v13 + 32);
        *((_QWORD *)v14 + 7) = v15;
        if (v13 == -32)
          break;
        v13 -= 16;
        if (((*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))() & 1) == 0)
        {
          v16 = (uint64_t *)((char *)a1 + v13 + 48);
          goto LABEL_12;
        }
      }
      v16 = a1;
LABEL_12:
      *(_OWORD *)v16 = v17;
      if (++v12 == 8)
        return v10 + 1 == (__int128 *)a2;
    }
    v11 += 16;
    if (++v10 == (__int128 *)a2)
      return 1;
  }
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(a1, a2, a3, a5);
  result = (*(uint64_t (**)(void))(*(_QWORD *)a5 + 16))();
  if ((_DWORD)result)
  {
    v11 = *a3;
    v12 = a3[1];
    v13 = a4[1];
    *a3 = *a4;
    a3[1] = v13;
    *a4 = v11;
    a4[1] = v12;
    result = (*(uint64_t (**)(void))(*(_QWORD *)a5 + 16))();
    if ((_DWORD)result)
    {
      v14 = *a2;
      v15 = a2[1];
      v16 = a3[1];
      *a2 = *a3;
      a2[1] = v16;
      *a3 = v14;
      a3[1] = v15;
      result = (*(uint64_t (**)(void))(*(_QWORD *)a5 + 16))();
      if ((_DWORD)result)
      {
        v17 = *a1;
        v18 = a1[1];
        v19 = a2[1];
        *a1 = *a2;
        a1[1] = v19;
        *a2 = v17;
        a2[1] = v18;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(a1, a2, a3, a4, a6);
  result = (*(uint64_t (**)(void))(*(_QWORD *)a6 + 16))();
  if ((_DWORD)result)
  {
    v13 = *a4;
    v14 = a4[1];
    v15 = a5[1];
    *a4 = *a5;
    a4[1] = v15;
    *a5 = v13;
    a5[1] = v14;
    result = (*(uint64_t (**)(void))(*(_QWORD *)a6 + 16))();
    if ((_DWORD)result)
    {
      v16 = *a3;
      v17 = a3[1];
      v18 = a4[1];
      *a3 = *a4;
      a3[1] = v18;
      *a4 = v16;
      a4[1] = v17;
      result = (*(uint64_t (**)(void))(*(_QWORD *)a6 + 16))();
      if ((_DWORD)result)
      {
        v19 = *a2;
        v20 = a2[1];
        v21 = a3[1];
        *a2 = *a3;
        a2[1] = v21;
        *a3 = v19;
        a3[1] = v20;
        result = (*(uint64_t (**)(void))(*(_QWORD *)a6 + 16))();
        if ((_DWORD)result)
        {
          v22 = *a1;
          v23 = a1[1];
          v24 = a2[1];
          *a1 = *a2;
          a1[1] = v24;
          *a2 = v22;
          a2[1] = v23;
        }
      }
    }
  }
  return result;
}

uint64_t *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*,std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;

  if ((uint64_t *)a1 != a2)
  {
    v8 = (uint64_t)a2 - a1;
    v9 = ((uint64_t)a2 - a1) >> 4;
    if ((uint64_t)a2 - a1 >= 17)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = (_OWORD *)(a1 + 16 * v10);
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        if ((*(unsigned int (**)(void))(*(_QWORD *)a4 + 16))())
        {
          v15 = *v14;
          v16 = v14[1];
          v17 = *(_QWORD *)(a1 + 8);
          *v14 = *(_QWORD *)a1;
          v14[1] = v17;
          *(_QWORD *)a1 = v15;
          *(_QWORD *)(a1 + 8) = v16;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(a1, a4, v9, (_OWORD *)a1);
        }
        v14 += 2;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 17)
    {
      v18 = (unint64_t)v8 >> 4;
      v19 = a2 - 2;
      do
      {
        v21 = *(_QWORD *)a1;
        v20 = *(_QWORD *)(a1 + 8);
        v22 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>((_QWORD *)a1, a4, v18);
        if (v19 == v22)
        {
          *v22 = v21;
          v22[1] = v20;
        }
        else
        {
          v23 = v19[1];
          *v22 = *v19;
          v22[1] = v23;
          *v19 = v21;
          v19[1] = v20;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(a1, (uint64_t)(v22 + 2), a4, ((uint64_t)v22 - a1 + 16) >> 4);
        }
        v19 -= 2;
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(uint64_t result, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  unint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  v4 = a3 - 2;
  if (a3 >= 2)
  {
    v5 = a4;
    v6 = result;
    v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - result) >> 4)
    {
      v10 = ((uint64_t)a4 - result) >> 3;
      v11 = v10 + 1;
      v12 = (_QWORD *)(result + 16 * (v10 + 1));
      v13 = v10 + 2;
      if (v10 + 2 < a3 && (*(unsigned int (**)(void))(*(_QWORD *)a2 + 16))())
      {
        v12 += 2;
        v11 = v13;
      }
      result = (*(uint64_t (**)(void))(*(_QWORD *)a2 + 16))();
      if ((result & 1) == 0)
      {
        v17 = *v5;
        do
        {
          v14 = v12;
          *(_QWORD *)v5 = *v12;
          *((_QWORD *)v5 + 1) = v12[1];
          if (v7 < v11)
            break;
          v15 = (2 * v11) | 1;
          v12 = (_QWORD *)(v6 + 16 * v15);
          v16 = 2 * v11 + 2;
          if (v16 < a3)
          {
            if ((*(unsigned int (**)(void))(*(_QWORD *)a2 + 16))())
            {
              v12 += 2;
              v15 = v16;
            }
          }
          result = (*(uint64_t (**)(void))(*(_QWORD *)a2 + 16))();
          v5 = v14;
          v11 = v15;
        }
        while (!(_DWORD)result);
        *v14 = v17;
      }
    }
  }
  return result;
}

_QWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = 0;
  v7 = a3 - 2;
  if (a3 < 2)
    v7 = a3 - 1;
  v8 = v7 >> 1;
  do
  {
    v9 = &a1[2 * v6 + 2];
    v10 = (2 * v6) | 1;
    v11 = 2 * v6 + 2;
    if (v11 < a3 && (*(unsigned int (**)(void))(*(_QWORD *)a2 + 16))())
    {
      v9 += 2;
      v10 = v11;
    }
    v12 = v9[1];
    *a1 = *v9;
    a1[1] = v12;
    a1 = v9;
    v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL({block_pointer}&)(std::pair<dy_capture_index_file_entry_t *,unsigned long> &,std::pair<dy_capture_index_file_entry_t *,unsigned long> &),std::pair<dy_capture_index_file_entry_t *,unsigned long>*>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v6 = result;
    v7 = v4 >> 1;
    v8 = (_QWORD *)(result + 16 * (v4 >> 1));
    v9 = (_OWORD *)(a2 - 16);
    result = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
    if ((_DWORD)result)
    {
      v11 = *v9;
      do
      {
        v10 = v8;
        *(_QWORD *)v9 = *v8;
        *((_QWORD *)v9 + 1) = v8[1];
        if (!v7)
          break;
        v7 = (v7 - 1) >> 1;
        v8 = (_QWORD *)(v6 + 16 * v7);
        result = (*(uint64_t (**)(void))(*(_QWORD *)a3 + 16))();
        v9 = v10;
      }
      while ((result & 1) != 0);
      *v10 = v11;
    }
  }
  return result;
}

void std::vector<GPUTools::objc_ref<DYCaptureArchive *>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<GPUTools::objc_ref<DYCaptureArchive *>>::__base_destruct_at_end[abi:ne180100]((uint64_t)v2, (uint64_t)*v2);
    operator delete(**a1);
  }
}

uint64_t DYKVCMutableCollections_Array_MutableGetter(objc_object *a1, objc_selector *a2)
{
  return -[objc_object mutableArrayValueForKey:](a1, "mutableArrayValueForKey:", objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "key"));
}

uint64_t DYKVCMutableCollections_Array_Getter(objc_object *a1, objc_selector *a2)
{
  return objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1);
}

uint64_t DYKVCMutableCollections_Array_Setter(objc_object *a1, objc_selector *a2, NSArray *a3)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "setArray:", a3);
}

uint64_t DYKVCMutableCollections_Array_InsertObjectAtIndex(objc_object *a1, objc_selector *a2, objc_object *a3, uint64_t a4)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "insertObject:atIndex:", a3, a4);
}

uint64_t DYKVCMutableCollections_Array_RemoveObjectAtIndex(objc_object *a1, objc_selector *a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "removeObjectAtIndex:", a3);
}

uint64_t DYKVCMutableCollections_Array_ReplaceObjectAtIndexWithObject(objc_object *a1, objc_selector *a2, uint64_t a3, objc_object *a4)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "replaceObjectAtIndex:withObject:", a3, a4);
}

uint64_t DYKVCMutableCollections_Array_InsertObjectsAtIndexes(objc_object *a1, objc_selector *a2, NSArray *a3, NSIndexSet *a4)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "insertObjects:atIndexes:", a3, a4);
}

uint64_t DYKVCMutableCollections_Array_RemoveObjectsAtIndexes(objc_object *a1, objc_selector *a2, NSIndexSet *a3)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "removeObjectsAtIndexes:", a3);
}

uint64_t DYKVCMutableCollections_Array_ReplaceObjectsAtIndexesWithObjects(objc_object *a1, objc_selector *a2, NSIndexSet *a3, NSArray *a4)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "replaceObjectsAtIndexes:withObjects:", a3, a4);
}

uint64_t DYKVCMutableCollections_Array_Count(objc_object *a1, objc_selector *a2)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "count");
}

uint64_t DYKVCMutableCollections_Array_ObjectAtIndex(objc_object *a1, objc_selector *a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "objectAtIndex:", a3);
}

uint64_t DYKVCMutableCollections_Array_ObjectsAtIndexes(objc_object *a1, objc_selector *a2, NSIndexSet *a3)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "objectsAtIndexes:", a3);
}

uint64_t DYKVCMutableCollections_Array_GetObjectsRange(objc_object *a1, objc_selector *a2, objc_object **a3, _NSRange a4)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "getObjects:range:", a3, a4.location, a4.length);
}

uint64_t DYKVCMutableCollections_Set_MutableGetter(objc_object *a1, objc_selector *a2)
{
  return -[objc_object mutableSetValueForKey:](a1, "mutableSetValueForKey:", objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "key"));
}

uint64_t DYKVCMutableCollections_Set_Getter(objc_object *a1, objc_selector *a2)
{
  return objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1);
}

uint64_t DYKVCMutableCollections_Set_Setter(objc_object *a1, objc_selector *a2, NSSet *a3)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "setSet:", a3);
}

uint64_t DYKVCMutableCollections_Set_AddObject(objc_object *a1, objc_selector *a2, objc_object *a3)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "addObject:", a3);
}

uint64_t DYKVCMutableCollections_Set_RemoveObject(objc_object *a1, objc_selector *a2, objc_object *a3)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "removeObject:", a3);
}

uint64_t DYKVCMutableCollections_Set_AddObjects(objc_object *a1, objc_selector *a2, NSSet *a3)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "unionSet:", a3);
}

uint64_t DYKVCMutableCollections_Set_RemoveObjects(objc_object *a1, objc_selector *a2, NSSet *a3)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "minusSet:", a3);
}

uint64_t DYKVCMutableCollections_Set_IntersectObjects(objc_object *a1, objc_selector *a2, NSSet *a3)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "intersectSet:", a3);
}

uint64_t DYKVCMutableCollections_Set_Count(objc_object *a1, objc_selector *a2)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "count");
}

uint64_t DYKVCMutableCollections_Set_ObjectEnumerator(objc_object *a1, objc_selector *a2)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "objectEnumerator");
}

uint64_t DYKVCMutableCollections_Set_Member(objc_object *a1, objc_selector *a2, objc_object *a3)
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_object _dy_mutableCollectionPropertyInfo](a1, "_dy_mutableCollectionPropertyInfo"), "bindingForSelector:", a2), "underlyingIvarValueForObject:", a1), "member:", a3);
}

double GPUTools::Playback::MemoryManager::MemoryManager(GPUTools::Playback::MemoryManager *this, __int32 a2, int8x8_t a3)
{
  uint8x8_t v3;
  __int32 v4;
  double result;

  *(_DWORD *)this = 0;
  *((_DWORD *)this + 1) = a2;
  a3.i32[0] = a2;
  v3 = (uint8x8_t)vcnt_s8(a3);
  v3.i16[0] = vaddlv_u8(v3);
  v4 = v3.i32[0];
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 52) = 0u;
  if (v4 != 1)
    __assert_rtn("GPUTools::Playback::MemoryManager::MemoryManager(uint32_t)", "", 0, "alignment && ((alignment & (alignment - 1)) == 0)");
  return result;
}

{
  uint8x8_t v3;
  __int32 v4;
  double result;

  *(_DWORD *)this = 0;
  *((_DWORD *)this + 1) = a2;
  a3.i32[0] = a2;
  v3 = (uint8x8_t)vcnt_s8(a3);
  v3.i16[0] = vaddlv_u8(v3);
  v4 = v3.i32[0];
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 52) = 0u;
  if (v4 != 1)
    __assert_rtn("GPUTools::Playback::MemoryManager::MemoryManager(uint32_t)", "", 0, "alignment && ((alignment & (alignment - 1)) == 0)");
  return result;
}

void GPUTools::Playback::MemoryManager::~MemoryManager(GPUTools::Playback::MemoryManager *this)
{
  void *v2;

  GPUTools::Playback::MemoryManager::AllocClear(this);
  v2 = (void *)*((_QWORD *)this + 2);
  if (v2)
    free(v2);
}

void GPUTools::Playback::MemoryManager::AllocClear(GPUTools::Playback::MemoryManager *this)
{
  int v1;
  BOOL v2;
  unsigned int v3;
  GPUTools::Playback::MemoryManager *v4;

  v1 = *(_DWORD *)this;
  if (*(_DWORD *)this)
    v2 = v1 == 2;
  else
    v2 = 1;
  if (v2)
  {
LABEL_9:
    *((_QWORD *)this + 5) = *((_QWORD *)this + 3);
    GPUTools::Playback::MemoryManager::memBlockFreeAll(this);
    return;
  }
  if (v1 == 1)
  {
    v3 = *((_DWORD *)this + 2);
    if (v3 <= *((_DWORD *)this + 3))
      v3 = *((_DWORD *)this + 3);
    *((_DWORD *)this + 2) = v3;
    *((_DWORD *)this + 3) = 0;
    goto LABEL_9;
  }
  v4 = (GPUTools::Playback::MemoryManager *)dy_abort();
  GPUTools::Playback::MemoryManager::~MemoryManager(v4);
}

_QWORD *GPUTools::Playback::MemoryManager::Begin(_QWORD *this)
{
  _QWORD *v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  GPUTools::Playback::MemoryManager *v8;
  unint64_t v9;

  if (this[6] || (v1 = this, *((_DWORD *)this + 16)) || this[5] != this[3])
  {
    v7 = "(_pMemBlockHead == nullptr) && (_memBlockCounter == 0) && (_pBufferPosition == _pBufferBegin)";
    goto LABEL_15;
  }
  v2 = *(_DWORD *)this;
  if (*(_DWORD *)this != 2)
  {
    *(_DWORD *)this = v2 + 1;
    if (v2)
    {
      if (v2 == 1)
      {
        v3 = *((_DWORD *)this + 2);
        if (v3)
        {
          v4 = *((_DWORD *)this + 1);
          if (((v4 - 1) & v3) != 0)
          {
            v7 = "(_bufferSize & (_alignment - 1)) == 0";
          }
          else if (this[2])
          {
            v7 = "_pBuffer == nullptr";
          }
          else
          {
            this = malloc_type_malloc((v3 + v4 - 1), 0x2C0CCEBAuLL);
            v1[2] = this;
            if (this)
            {
              v5 = ((unint64_t)this + *((unsigned int *)v1 + 1) - 1) & -(uint64_t)*((unsigned int *)v1 + 1);
              v6 = v5 + *((unsigned int *)v1 + 2);
              v1[3] = v5;
              v1[4] = v6;
              v1[5] = v5;
              return this;
            }
            v7 = "_pBuffer";
          }
LABEL_15:
          __assert_rtn("void GPUTools::Playback::MemoryManager::Begin()", "", 0, v7);
        }
      }
      else
      {
        v8 = (GPUTools::Playback::MemoryManager *)dy_abort();
        return (_QWORD *)GPUTools::Playback::MemoryManager::Alloc(v8, v9);
      }
    }
    else
    {
      this[7] = 0;
    }
  }
  return this;
}

uint64_t GPUTools::Playback::MemoryManager::Alloc(GPUTools::Playback::MemoryManager *this, uint64_t a2)
{
  int v2;
  uint64_t v3;
  unsigned int v5;

  v2 = *(_DWORD *)this;
  if (*(_DWORD *)this)
  {
    if (v2 == 1)
    {
      v5 = *((_DWORD *)this + 1);
      if (*((_DWORD *)this + 3) + ((a2 + v5 - 1) & -v5) > v5)
        v5 = *((_DWORD *)this + 3) + ((a2 + v5 - 1) & -v5);
      *((_DWORD *)this + 3) = v5;
    }
    else if (v2 == 2)
    {
      v3 = *((_QWORD *)this + 5);
      if ((unint64_t)(v3 + a2) <= *((_QWORD *)this + 4))
      {
        *((_QWORD *)this + 5) = ((a2 + *((unsigned int *)this + 1) - 1) & -(uint64_t)*((unsigned int *)this + 1)) + v3;
        return v3;
      }
    }
    else
    {
      this = (GPUTools::Playback::MemoryManager *)dy_abort();
    }
  }
  return GPUTools::Playback::MemoryManager::memBlockAlloc(this, a2);
}

uint64_t GPUTools::Playback::MemoryManager::memBlockAlloc(GPUTools::Playback::MemoryManager *this, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;

  v4 = malloc_type_malloc(a2 + *((unsigned int *)this + 1) + 23, 0xC4C2D5C8uLL);
  v5 = ((unint64_t)v4 + *((unsigned int *)this + 1) + 23) & -(uint64_t)*((unsigned int *)this + 1);
  *v4 = *((_QWORD *)this + 6);
  v4[1] = v5;
  v4[2] = a2;
  *((_QWORD *)this + 6) = v4;
  ++*((_DWORD *)this + 16);
  return v5;
}

_QWORD *GPUTools::Playback::MemoryManager::memBlockFreeAll(GPUTools::Playback::MemoryManager *this)
{
  _QWORD *result;
  unint64_t v3;
  unint64_t v4;

  result = (_QWORD *)*((_QWORD *)this + 6);
  if (result)
  {
    v3 = 0;
    do
    {
      *((_QWORD *)this + 6) = *result;
      --*((_DWORD *)this + 16);
      v3 += result[2];
      free(result);
      result = (_QWORD *)*((_QWORD *)this + 6);
    }
    while (result);
  }
  else
  {
    v3 = 0;
  }
  v4 = *((_QWORD *)this + 7);
  if (v4 <= v3)
    v4 = v3;
  *((_QWORD *)this + 7) = v4;
  return result;
}

uint64_t GPUTools::Playback::DecodedFunctionStream::DecodedFunctionStream(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4, unint64_t a5, uint64_t a6)
{
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t (**v15)();
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  BOOL v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t (**v30)();
  unint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v38;
  uint64_t v41;
  _BYTE v42[456];
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48[20];
  unsigned int v49;

  v10 = a4[2];
  v11 = (_QWORD *)GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)a1);
  v11[57] = v10;
  v11[58] = v10;
  v11[59] = a4[3];
  v12 = a4[1];
  *(_QWORD *)(a1 + 480) = v12;
  *(_BYTE *)(a1 + 488) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 16))(v12);
  *(_OWORD *)(a1 + 496) = 0u;
  *(_OWORD *)(a1 + 512) = 0u;
  *(_OWORD *)(a1 + 528) = 0u;
  if ((objc_msgSend(a3, "getInfo:error:", v48, 0) & 1) == 0)
    __assert_rtn("GPUTools::Playback::DecodedFunctionStream::DecodedFunctionStream(id<DYCaptureStore>, DYCaptureFile *, IDFSSegment::fstream &, size_t, FileDataCacheMap &)", "", 0, "ok");
  v38 = v49 / 0x46uLL;
  v13 = v38 + v49 / 0x230uLL;
  if (v13 < 0x8FA)
  {
    if (v13 < 0x47C)
    {
      v14 = operator new();
      if (v13 < 0x44)
        v15 = &off_250D59158;
      else
        v15 = &off_250D590E8;
    }
    else
    {
      v14 = operator new();
      v15 = &off_250D59078;
    }
  }
  else
  {
    v14 = operator new();
    v15 = &off_250D59008;
  }
  *(_QWORD *)v14 = v15;
  v16 = v15[3]();
  v17 = v16;
  if (v16 > v38)
    v18 = 1;
  else
    v18 = v38 / v16;
  v19 = a4[3];
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v42);
  v43 = v19;
  v44 = v19;
  v20 = a4[1];
  v45 = a4[3];
  v46 = v20;
  v21 = 0;
  v22 = 456 * v17;
  v47 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v20 + 16))(v20);
  v23 = v38;
  while (1)
  {
    v24 = *(_QWORD *)(a1 + 528) + v22;
    if (v24 > a5)
      break;
    if (v21 == v18)
    {
      if (v17 != 17)
      {
        v26 = *(_QWORD *)(a1 + 536);
        v27 = v38 >= v26;
        v28 = v38 - v26;
        if (v28 != 0 && v27)
          v23 = v28;
        v29 = v23 + (v23 >> 3);
        if (v29 < 0x8FA)
        {
          if (v29 < 0x47C)
          {
            v25 = operator new();
            if (v29 < 0x44)
              v30 = &off_250D59158;
            else
              v30 = &off_250D590E8;
          }
          else
          {
            v25 = operator new();
            v30 = &off_250D59078;
          }
        }
        else
        {
          v25 = operator new();
          v30 = &off_250D59008;
        }
        *(_QWORD *)v25 = v30;
        (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
        v31 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v25 + 24))(v25);
        v17 = v31;
        v21 = 0;
        if (v31 > v23)
          v18 = 1;
        else
          v18 = v23 / v31;
        v22 = 456 * v31;
        goto LABEL_31;
      }
      v21 = 0;
    }
    v25 = v14;
LABEL_31:
    v32 = (*(uint64_t (**)(uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t))(*(_QWORD *)v25 + 16))(v25, a1, v42, a2, a6);
    v41 = v32;
    v33 = *(uint64_t **)(a1 + 504);
    if ((unint64_t)v33 >= *(_QWORD *)(a1 + 512))
    {
      v34 = std::vector<std::unique_ptr<GPUTools::Playback::IDFSSegment>>::__push_back_slow_path<std::unique_ptr<GPUTools::Playback::IDFSSegment>>((_QWORD *)(a1 + 496), &v41);
    }
    else
    {
      v41 = 0;
      *v33 = v32;
      v34 = v33 + 1;
    }
    *(_QWORD *)(a1 + 504) = v34;
    v35 = v41;
    v41 = 0;
    if (v35)
      (*(void (**)(uint64_t))(*(_QWORD *)v35 + 8))(v35);
    *(_QWORD *)(a1 + 528) = v24;
    *(_QWORD *)(a1 + 536) += (*(uint64_t (**)(uint64_t))(*(_QWORD *)v32 + 24))(v32);
    v36 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v32 + 24))(v32);
    ++v21;
    v14 = v25;
    if (v36 != v17)
      goto LABEL_39;
  }
  v25 = v14;
LABEL_39:
  *(_QWORD *)(a1 + 520) = *(_QWORD *)(a1 + 496);
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v42);
  (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
  return a1;
}

void sub_23C6B324C(_Unwind_Exception *a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  GPUTools::FD::CoreFunction *v6;
  uint64_t v7;
  va_list va;

  va_start(va, a6);
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)va);
  (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  std::vector<std::unique_ptr<GPUTools::Playback::IDFSSegment>>::~vector[abi:ne180100](a3);
  GPUTools::FD::CoreFunction::~CoreFunction(v6);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<std::unique_ptr<GPUTools::Playback::IDFSSegment>>::~vector[abi:ne180100](_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (_QWORD *)*a1;
  if (*a1)
  {
    v3 = (_QWORD *)a1[1];
    v4 = (_QWORD *)*a1;
    if (v3 != v2)
    {
      do
      {
        v6 = *--v3;
        v5 = v6;
        *v3 = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
      }
      while (v3 != v2);
      v4 = (_QWORD *)*a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void GPUTools::Playback::DecodedFunctionStream::~DecodedFunctionStream(GPUTools::Playback::DecodedFunctionStream *this)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (_QWORD *)*((_QWORD *)this + 62);
  if (v2)
  {
    v3 = (_QWORD *)*((_QWORD *)this + 63);
    v4 = (void *)*((_QWORD *)this + 62);
    if (v3 != v2)
    {
      do
      {
        v6 = *--v3;
        v5 = v6;
        *v3 = 0;
        if (v6)
          (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
      }
      while (v3 != v2);
      v4 = (void *)*((_QWORD *)this + 62);
    }
    *((_QWORD *)this + 63) = v2;
    operator delete(v4);
  }
  GPUTools::FD::CoreFunction::~CoreFunction(this);
}

_QWORD *std::vector<std::unique_ptr<GPUTools::Playback::IDFSSegment>>::__push_back_slow_path<std::unique_ptr<GPUTools::Playback::IDFSSegment>>(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  char *v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = a1[1] - *a1;
  v4 = v3 >> 3;
  v5 = (v3 >> 3) + 1;
  if (v5 >> 61)
    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
  v7 = a1[2] - *a1;
  if (v7 >> 2 > v5)
    v5 = v7 >> 2;
  if ((unint64_t)v7 >= 0x7FFFFFFFFFFFFFF8)
    v8 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v8 = v5;
  if (v8)
  {
    if (v8 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v9 = (char *)operator new(8 * v8);
  }
  else
  {
    v9 = 0;
  }
  v10 = &v9[8 * v4];
  v11 = &v9[8 * v8];
  v12 = *a2;
  *a2 = 0;
  *(_QWORD *)v10 = v12;
  v13 = v10 + 8;
  v14 = (char *)*a1;
  v15 = (char *)a1[1];
  if (v15 == (char *)*a1)
  {
    *a1 = v10;
    a1[1] = v13;
    a1[2] = v11;
    if (!v15)
      return v13;
    goto LABEL_26;
  }
  v16 = (unint64_t)&v15[-*a1 - 8];
  if (v16 < 0x78 || &v15[-(v16 & 0xFFFFFFFFFFFFFFF8) - 8] < v10 && &v9[v3 - (v16 & 0xFFFFFFFFFFFFFFF8) - 8] < v15)
    goto LABEL_34;
  v17 = (v16 >> 3) + 1;
  v18 = 8 * (v17 & 0x3FFFFFFFFFFFFFFCLL);
  v10 -= v18;
  v19 = &v15[-v18];
  v20 = v15 - 16;
  v21 = &v9[8 * v4 - 16];
  v22 = v17 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v24 = *((_OWORD *)v20 - 1);
    v23 = *(_OWORD *)v20;
    *((_OWORD *)v20 - 1) = 0uLL;
    *(_OWORD *)v20 = 0uLL;
    *((_OWORD *)v21 - 1) = v24;
    *(_OWORD *)v21 = v23;
    v20 -= 32;
    v21 -= 32;
    v22 -= 4;
  }
  while (v22);
  v15 = v19;
  if (v17 != (v17 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_34:
    do
    {
      v25 = *((_QWORD *)v15 - 1);
      v15 -= 8;
      *(_QWORD *)v15 = 0;
      *((_QWORD *)v10 - 1) = v25;
      v10 -= 8;
    }
    while (v15 != v14);
  }
  v26 = (char *)*a1;
  v15 = (char *)a1[1];
  *a1 = v10;
  a1[1] = v13;
  a1[2] = v11;
  if (v15 != v26)
  {
    do
    {
      v28 = *((_QWORD *)v15 - 1);
      v15 -= 8;
      v27 = v28;
      *(_QWORD *)v15 = 0;
      if (v28)
        (*(void (**)(uint64_t))(*(_QWORD *)v27 + 8))(v27);
    }
    while (v15 != v26);
    v15 = v26;
  }
  if (v15)
LABEL_26:
    operator delete(v15);
  return v13;
}

void GPUTools::Playback::TDFSSegmentFactory<GPUTools::Playback::TDFSSegment<2097152ul>>::~TDFSSegmentFactory()
{
  JUMPOUT(0x24262211CLL);
}

_QWORD *GPUTools::Playback::TDFSSegmentFactory<GPUTools::Playback::TDFSSegment<2097152ul>>::new_segment(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _QWORD *a5)
{
  _QWORD *v9;

  v9 = (_QWORD *)operator new();
  GPUTools::Playback::TDFSSegment<2097152ul>::TDFSSegment(v9, a2, a3, a4, a5);
  return v9;
}

void sub_23C6B3628(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24262211C](v1, 0x1081C40313C73FELL);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::Playback::TDFSSegmentFactory<GPUTools::Playback::TDFSSegment<2097152ul>>::get_max_functions()
{
  return 4599;
}

_QWORD *GPUTools::Playback::TDFSSegment<2097152ul>::TDFSSegment(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, _QWORD *a5)
{
  _QWORD *v7;
  uint64_t i;
  uint64_t v9;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  int8x8_t v40;
  uint8x8_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char v46;
  unint64_t v47;
  uint64_t v48;
  int8x8_t v49;
  uint8x8_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  _BYTE *v66;
  char *v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  _BYTE *v74;
  char *v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  _OWORD *v80;
  char *v81;
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  _OWORD *v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  _OWORD *v91;
  char *v92;
  uint64_t v93;
  __int128 v94;
  uint64_t v95;
  _QWORD *v96;
  char *v97;
  _QWORD *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  char *v104;
  char *v105;
  char *v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char *v111;
  char *v112;
  char *v113;
  uint64_t v114;
  _QWORD *v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  __int128 *v120;
  _OWORD *v121;
  uint64_t v122;
  __int128 v123;
  _QWORD *v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD *v128;
  _QWORD *v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  __int16 v133;
  int v134;
  uint64_t v135;
  __int16 v136;
  uint64_t v137;
  uint64_t v139;
  _QWORD *v141;
  uint64_t v143;
  _QWORD *v144;
  _QWORD *v145;
  unint64_t v146;
  unint64_t v147;
  _QWORD v149[4];
  void *__p;
  char *v151;
  char *v152;
  char *v153;
  char *v154;
  char *v155;

  *a1 = &off_250D59038;
  v7 = a1 + 1;
  v141 = a1 + 0x40000;
  for (i = 1; i != 0x40000; i += 57)
    GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)&a1[i]);
  *v141 = 0;
  v153 = 0;
  v154 = 0;
  v155 = 0;
  __p = 0;
  v151 = 0;
  v152 = 0;
  v9 = *(_QWORD *)(a2 + 456);
  v145 = a5;
  v139 = a2;
  while (v9 != *(_QWORD *)(a3 + 456))
  {
    if (*(_DWORD *)a2 == -1 || *(_QWORD *)(a2 + 464) == v9)
      GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode(a2);
    GPUTools::FD::CoreFunction::operator=();
    if (*((_WORD *)v7 + 5))
    {
      v11 = v7 + 6;
      v12 = (uint64_t)&v7[3 * *((unsigned __int16 *)v7 + 5) + 6];
      v143 = v12;
      v144 = v7;
      do
      {
        if ((*((_WORD *)v11 + 11) & 8) == 0)
          goto LABEL_15;
        v14 = *((unsigned int *)v11 + 4);
        v15 = *((unsigned __int16 *)v11 + 10);
        v16 = 8 * v15;
        if (8 * v15 > v14)
          goto LABEL_15;
        v17 = v153;
        if (v15 <= (v155 - v153) >> 3)
        {
          v22 = v153;
          goto LABEL_30;
        }
        v18 = v154;
        v19 = (char *)operator new(8 * v15);
        v20 = v18 - v17;
        v21 = &v19[(v18 - v17) & 0xFFFFFFFFFFFFFFF8];
        v22 = v21;
        if (v18 != v17)
        {
          v23 = v18 - 8 - v17;
          if (v23 < 0x58)
          {
            v22 = &v19[(v18 - v17) & 0xFFFFFFFFFFFFFFF8];
            do
            {
LABEL_27:
              v32 = *((_QWORD *)v18 - 1);
              v18 -= 8;
              *((_QWORD *)v22 - 1) = v32;
              v22 -= 8;
            }
            while (v18 != v17);
            goto LABEL_28;
          }
          v22 = &v19[(v18 - v17) & 0xFFFFFFFFFFFFFFF8];
          if ((unint64_t)(v18 - &v19[v20 & 0xFFFFFFFFFFFFFFF8]) < 0x20)
            goto LABEL_27;
          v24 = v20 >> 3;
          v25 = (v23 >> 3) + 1;
          v26 = 8 * (v25 & 0x3FFFFFFFFFFFFFFCLL);
          v27 = &v18[-v26];
          v22 = &v21[-v26];
          v28 = &v19[8 * v24 - 16];
          v29 = v18 - 16;
          v30 = v25 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v31 = *(_OWORD *)v29;
            *((_OWORD *)v28 - 1) = *((_OWORD *)v29 - 1);
            *(_OWORD *)v28 = v31;
            v28 -= 32;
            v29 -= 32;
            v30 -= 4;
          }
          while (v30);
          v18 = v27;
          if (v25 != (v25 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_27;
        }
LABEL_28:
        v153 = v22;
        v154 = v21;
        v155 = &v19[8 * v15];
        if (v17)
        {
          operator delete(v17);
          v22 = v153;
        }
LABEL_30:
        v154 = v22;
        v33 = *((unsigned __int16 *)v11 + 10);
        if (8 * v33 > *((unsigned int *)v11 + 4))
          goto LABEL_15;
        v34 = (char *)__p;
        if (v33 <= (v152 - (_BYTE *)__p) >> 4)
        {
          v151 = (char *)__p;
          if ((*((_WORD *)v11 + 11) & 1) != 0)
            goto LABEL_43;
          goto LABEL_38;
        }
        v35 = v151;
        v36 = (char *)operator new(16 * v33);
        v37 = &v36[(v35 - v34) & 0xFFFFFFFFFFFFFFF0];
        v38 = v37;
        if (v35 != v34)
        {
          v39 = &v36[(v35 - v34) & 0xFFFFFFFFFFFFFFF0];
          do
          {
            v38 = v39 - 16;
            *((_OWORD *)v39 - 1) = *((_OWORD *)v35 - 1);
            v35 -= 16;
            v39 -= 16;
          }
          while (v35 != v34);
        }
        __p = v38;
        v151 = v37;
        v152 = &v36[16 * v33];
        if (v34)
        {
          operator delete(v34);
          v38 = (char *)__p;
        }
        v151 = v38;
        if ((*((_WORD *)v11 + 11) & 1) != 0)
        {
LABEL_43:
          v43 = GPUTools::FD::Argument::ViewAsCStringArray((GPUTools::FD::Argument *)v11);
          if (!*((_WORD *)v11 + 10))
            goto LABEL_13;
          v44 = v43;
          v45 = 0;
          v46 = 1;
          v146 = v14;
          v147 = v16;
          while (1)
          {
            v48 = *(_QWORD *)v44;
            if ((*(_WORD *)(v44 + 22) & 0x40) != 0)
            {
              if (!*(_BYTE *)(*(unsigned int *)(v48 + 4 * v45) + v48))
                goto LABEL_52;
LABEL_48:
              objc_msgSend(a4, "getInfo:forFilenameBuffer:error:", v149);
              v49 = (int8x8_t)a5[1];
              if (!*(_QWORD *)&v49)
                goto LABEL_72;
              v50 = (uint8x8_t)vcnt_s8(v49);
              v50.i16[0] = vaddlv_u8(v50);
              if (v50.u32[0] > 1uLL)
              {
                v51 = v149[0];
                if (v149[0] >= *(_QWORD *)&v49)
                  v51 = v149[0] % *(_QWORD *)&v49;
              }
              else
              {
                v51 = (*(_QWORD *)&v49 - 1) & v149[0];
              }
              v54 = *(_QWORD **)(*a5 + 8 * v51);
              if (!v54 || (v55 = (_QWORD *)*v54) == 0)
              {
LABEL_72:
                if (v16 > v14)
                {
                  LODWORD(v47) = *((unsigned __int16 *)v11 + 10);
                  goto LABEL_167;
                }
                v46 = 0;
LABEL_74:
                v59 = v154;
                if (v154 < v155)
                {
                  *(_QWORD *)v154 = v149[0];
                  v60 = (uint64_t)(v59 + 8);
LABEL_108:
                  v154 = (char *)v60;
                  goto LABEL_137;
                }
                v61 = v153;
                v62 = (v154 - v153) >> 3;
                v63 = v62 + 1;
                if ((unint64_t)(v62 + 1) >> 61)
                  std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                v64 = v155 - v153;
                if ((v155 - v153) >> 2 > v63)
                  v63 = v64 >> 2;
                if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFF8)
                  v65 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v65 = v63;
                if (v65)
                {
                  if (v65 >> 61)
LABEL_211:
                    std::__throw_bad_array_new_length[abi:ne180100]();
                  v66 = operator new(8 * v65);
                  v67 = &v66[8 * v62];
                  *(_QWORD *)v67 = v149[0];
                  v60 = (uint64_t)(v67 + 8);
                  if (v59 != v61)
                  {
LABEL_85:
                    v68 = v59 - 8 - v61;
                    if (v68 < 0x58)
                    {
                      v14 = v146;
                      goto LABEL_104;
                    }
                    v14 = v146;
                    if ((unint64_t)(v61 - v66) < 0x20)
                      goto LABEL_219;
                    v77 = (v68 >> 3) + 1;
                    v78 = 8 * (v77 & 0x3FFFFFFFFFFFFFFCLL);
                    v79 = &v59[-v78];
                    v67 -= v78;
                    v80 = &v66[8 * v62 - 16];
                    v81 = v59 - 16;
                    v82 = v77 & 0x3FFFFFFFFFFFFFFCLL;
                    do
                    {
                      v83 = *(_OWORD *)v81;
                      *(v80 - 1) = *((_OWORD *)v81 - 1);
                      *v80 = v83;
                      v80 -= 2;
                      v81 -= 32;
                      v82 -= 4;
                    }
                    while (v82);
                    v59 = v79;
                    if (v77 != (v77 & 0x3FFFFFFFFFFFFFFCLL))
                    {
LABEL_219:
                      do
                      {
LABEL_104:
                        v84 = *((_QWORD *)v59 - 1);
                        v59 -= 8;
                        *((_QWORD *)v67 - 1) = v84;
                        v67 -= 8;
                      }
                      while (v59 != v61);
                    }
LABEL_105:
                    v153 = v67;
                    v154 = (char *)v60;
                    v155 = &v66[8 * v65];
                    if (v61)
                      operator delete(v61);
                    a5 = v145;
                    v16 = v147;
                    goto LABEL_108;
                  }
                }
                else
                {
                  v66 = 0;
                  v67 = (char *)(8 * v62);
                  *(_QWORD *)(8 * v62) = v149[0];
                  v60 = 8 * v62 + 8;
                  if (v59 != v61)
                    goto LABEL_85;
                }
                v14 = v146;
                goto LABEL_105;
              }
              if (v50.u32[0] < 2uLL)
              {
                v56 = *(_QWORD *)&v49 - 1;
                while (1)
                {
                  v58 = v55[1];
                  if (v58 == v149[0])
                  {
                    if (v55[2] == v149[0])
                      goto LABEL_109;
                  }
                  else if ((v58 & v56) != v51)
                  {
                    goto LABEL_72;
                  }
                  v55 = (_QWORD *)*v55;
                  if (!v55)
                    goto LABEL_72;
                }
              }
              while (1)
              {
                v57 = v55[1];
                if (v57 == v149[0])
                  break;
                if (v57 >= *(_QWORD *)&v49)
                  v57 %= *(_QWORD *)&v49;
                if (v57 != v51)
                  goto LABEL_72;
LABEL_62:
                v55 = (_QWORD *)*v55;
                if (!v55)
                  goto LABEL_72;
              }
              if (v55[2] != v149[0])
                goto LABEL_62;
LABEL_109:
              v85 = v55 + 3;
              v86 = v151;
              if (v151 < v152)
              {
                *(_OWORD *)v151 = *v85;
                v87 = v86 + 16;
                goto LABEL_156;
              }
              v106 = (char *)__p;
              v107 = (v151 - (_BYTE *)__p) >> 4;
              v108 = v107 + 1;
              if ((unint64_t)(v107 + 1) >> 60)
                std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
              v109 = v152 - (_BYTE *)__p;
              if ((v152 - (_BYTE *)__p) >> 3 > v108)
                v108 = v109 >> 3;
              if ((unint64_t)v109 >= 0x7FFFFFFFFFFFFFF0)
                v110 = 0xFFFFFFFFFFFFFFFLL;
              else
                v110 = v108;
              if (!v110)
              {
                v111 = 0;
                v112 = (char *)(16 * v107);
                *(_OWORD *)(16 * v107) = *v85;
                v113 = (char *)(16 * v107);
                if (v86 != v106)
                  goto LABEL_152;
LABEL_159:
                a5 = v145;
                v87 = v112 + 16;
                __p = v113;
                v151 = v112 + 16;
                v152 = &v111[16 * v110];
                if (v86)
                  goto LABEL_155;
                goto LABEL_156;
              }
              if (v110 >> 60)
                goto LABEL_211;
              v111 = (char *)operator new(16 * v110);
              v14 = v146;
              v112 = &v111[16 * v107];
              *(_OWORD *)v112 = *v85;
              v113 = v112;
              if (v86 == v106)
                goto LABEL_159;
LABEL_152:
              a5 = v145;
              do
              {
                *((_OWORD *)v113 - 1) = *((_OWORD *)v86 - 1);
                v113 -= 16;
                v86 -= 16;
              }
              while (v86 != v106);
              v86 = (char *)__p;
              v87 = v112 + 16;
              __p = v113;
              v151 = v112 + 16;
              v152 = &v111[16 * v110];
              if (v86)
LABEL_155:
                operator delete(v86);
LABEL_156:
              v151 = v87;
              v16 = v147;
              if (v147 <= v14)
                goto LABEL_74;
LABEL_137:
              ++v45;
              v47 = *((unsigned __int16 *)v11 + 10);
              if (v45 >= v47)
              {
                if ((v46 & 1) != 0)
                {
                  v12 = v143;
                  v7 = v144;
                  if (*((_WORD *)v11 + 10))
                  {
                    v114 = 0;
                    v115 = (_QWORD *)*v11;
                    do
                    {
                      *v115++ = *(_QWORD *)((char *)__p + v114);
                      v114 += 16;
                    }
                    while (16 * v47 != v114);
                  }
LABEL_13:
                  *((_WORD *)v11 + 11) &= 0xFFB7u;
                  v13 = *((_DWORD *)v11 + 3);
LABEL_14:
                  *((_DWORD *)v11 + 2) = v13;
                  goto LABEL_15;
                }
LABEL_167:
                v12 = v143;
                v7 = v144;
                if ((_DWORD)v47)
                {
LABEL_168:
                  v116 = 0;
                  v117 = *v11;
                  v118 = v153;
                  v119 = v47;
                  if (v47 < 4)
                    goto LABEL_173;
                  if ((unint64_t)(v117 - (_QWORD)v153) < 0x20)
                    goto LABEL_173;
                  v116 = (unsigned __int16)v47 & 0xFFFC;
                  v120 = (__int128 *)(v153 + 16);
                  v121 = (_OWORD *)(v117 + 16);
                  v122 = (unsigned __int16)v119 & 0xFFFC;
                  do
                  {
                    v123 = *v120;
                    *(v121 - 1) = *(v120 - 1);
                    *v121 = v123;
                    v120 += 2;
                    v121 += 2;
                    v122 -= 4;
                  }
                  while (v122);
                  if (v116 != v119)
                  {
LABEL_173:
                    v124 = (_QWORD *)(v117 + 8 * v116);
                    v125 = &v118[8 * v116];
                    v126 = v119 - v116;
                    do
                    {
                      v127 = *(_QWORD *)v125;
                      v125 += 8;
                      *v124++ = v127;
                      --v126;
                    }
                    while (v126);
                  }
                }
LABEL_175:
                *((_WORD *)v11 + 11) = *((_WORD *)v11 + 11) & 0xFF97 | 0x20;
                v13 = 8;
                goto LABEL_14;
              }
            }
            else
            {
              if (**(_BYTE **)(v48 + 8 * v45))
                goto LABEL_48;
LABEL_52:
              if (v16 > v14)
                goto LABEL_122;
              v52 = v154;
              if (v154 >= v155)
              {
                v69 = v153;
                v70 = (v154 - v153) >> 3;
                v71 = v70 + 1;
                if ((unint64_t)(v70 + 1) >> 61)
                  std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                v72 = v155 - v153;
                if ((v155 - v153) >> 2 > v71)
                  v71 = v72 >> 2;
                if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFF8)
                  v73 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v73 = v71;
                if (v73)
                {
                  if (v73 >> 61)
                    std::__throw_bad_array_new_length[abi:ne180100]();
                  v74 = operator new(8 * v73);
                  v75 = &v74[8 * v70];
                  *(_QWORD *)v75 = -1;
                  v53 = (uint64_t)(v75 + 8);
                  if (v52 != v69)
                  {
LABEL_98:
                    v76 = v52 - 8 - v69;
                    if (v76 < 0x58)
                    {
                      v14 = v146;
                      goto LABEL_117;
                    }
                    v14 = v146;
                    if ((unint64_t)(v69 - v74) < 0x20)
                      goto LABEL_220;
                    v88 = (v76 >> 3) + 1;
                    v89 = 8 * (v88 & 0x3FFFFFFFFFFFFFFCLL);
                    v90 = &v52[-v89];
                    v75 -= v89;
                    v91 = &v74[8 * v70 - 16];
                    v92 = v52 - 16;
                    v93 = v88 & 0x3FFFFFFFFFFFFFFCLL;
                    do
                    {
                      v94 = *(_OWORD *)v92;
                      *(v91 - 1) = *((_OWORD *)v92 - 1);
                      *v91 = v94;
                      v91 -= 2;
                      v92 -= 32;
                      v93 -= 4;
                    }
                    while (v93);
                    v52 = v90;
                    if (v88 != (v88 & 0x3FFFFFFFFFFFFFFCLL))
                    {
LABEL_220:
                      do
                      {
LABEL_117:
                        v95 = *((_QWORD *)v52 - 1);
                        v52 -= 8;
                        *((_QWORD *)v75 - 1) = v95;
                        v75 -= 8;
                      }
                      while (v52 != v69);
                    }
LABEL_118:
                    v153 = v75;
                    v154 = (char *)v53;
                    v155 = &v74[8 * v73];
                    if (v69)
                      operator delete(v69);
                    a5 = v145;
                    v16 = v147;
                    goto LABEL_121;
                  }
                }
                else
                {
                  v74 = 0;
                  v75 = (char *)(8 * v70);
                  *(_QWORD *)(8 * v70) = -1;
                  v53 = 8 * v70 + 8;
                  if (v52 != v69)
                    goto LABEL_98;
                }
                v14 = v146;
                goto LABEL_118;
              }
              *(_QWORD *)v154 = -1;
              v53 = (uint64_t)(v52 + 8);
LABEL_121:
              v154 = (char *)v53;
LABEL_122:
              if ((v46 & 1) != 0)
              {
                v96 = v151;
                if (v151 < v152)
                {
                  v97 = v151 + 16;
                  *(_QWORD *)v151 = 0;
                  v96[1] = 0;
LABEL_136:
                  v16 = v147;
                  v151 = v97;
                  v46 = 1;
                  goto LABEL_137;
                }
                v98 = __p;
                v99 = (v151 - (_BYTE *)__p) >> 4;
                v100 = v99 + 1;
                if ((unint64_t)(v99 + 1) >> 60)
                  std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                v101 = v152 - (_BYTE *)__p;
                if ((v152 - (_BYTE *)__p) >> 3 > v100)
                  v100 = v101 >> 3;
                if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFF0)
                  v102 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v102 = v100;
                if (v102)
                {
                  if (v102 >> 60)
                    std::__throw_bad_array_new_length[abi:ne180100]();
                  v103 = (char *)operator new(16 * v102);
                  v104 = &v103[16 * v99];
                  *(_QWORD *)v104 = 0;
                  *((_QWORD *)v104 + 1) = 0;
                  v105 = v104;
                  if (v96 == v98)
                    goto LABEL_134;
                  do
                  {
LABEL_140:
                    *((_OWORD *)v105 - 1) = *((_OWORD *)v96 - 1);
                    v105 -= 16;
                    v96 -= 2;
                  }
                  while (v96 != v98);
                  v96 = __p;
                  v97 = v104 + 16;
                  __p = v105;
                  v151 = v104 + 16;
                  v152 = &v103[16 * v102];
                  if (!v96)
                    goto LABEL_136;
                }
                else
                {
                  v103 = 0;
                  v104 = (char *)(16 * v99);
                  *(_QWORD *)v104 = 0;
                  *((_QWORD *)v104 + 1) = 0;
                  v105 = (char *)(16 * v99);
                  if (v96 != v98)
                    goto LABEL_140;
LABEL_134:
                  v97 = v104 + 16;
                  __p = v105;
                  v151 = v104 + 16;
                  v152 = &v103[16 * v102];
                  if (!v96)
                    goto LABEL_136;
                }
                operator delete(v96);
                goto LABEL_136;
              }
              v46 = 0;
              ++v45;
              v47 = *((unsigned __int16 *)v11 + 10);
              if (v45 >= v47)
              {
                v12 = v143;
                v7 = v144;
                if (*((_WORD *)v11 + 10))
                  goto LABEL_168;
                goto LABEL_175;
              }
            }
          }
        }
LABEL_38:
        if (!*v11)
          goto LABEL_15;
        objc_msgSend(a4, "getInfo:forFilenameBuffer:error:", v149, *v11, 0);
        v40 = (int8x8_t)a5[1];
        if (v40)
        {
          v41 = (uint8x8_t)vcnt_s8(v40);
          v41.i16[0] = vaddlv_u8(v41);
          if (v41.u32[0] > 1uLL)
          {
            v42 = v149[0];
            if (v149[0] >= *(_QWORD *)&v40)
              v42 = v149[0] % *(_QWORD *)&v40;
          }
          else
          {
            v42 = (*(_QWORD *)&v40 - 1) & v149[0];
          }
          v128 = *(_QWORD **)(*a5 + 8 * v42);
          if (v128)
          {
            v129 = (_QWORD *)*v128;
            if (v129)
            {
              if (v41.u32[0] < 2uLL)
              {
                v130 = *(_QWORD *)&v40 - 1;
                while (1)
                {
                  v132 = v129[1];
                  if (v132 == v149[0])
                  {
                    if (v129[2] == v149[0])
                      goto LABEL_198;
                  }
                  else if ((v132 & v130) != v42)
                  {
                    goto LABEL_193;
                  }
                  v129 = (_QWORD *)*v129;
                  if (!v129)
                    goto LABEL_193;
                }
              }
              do
              {
                v131 = v129[1];
                if (v131 == v149[0])
                {
                  if (v129[2] == v149[0])
                  {
LABEL_198:
                    *v11 = v129[3];
                    v133 = *((_WORD *)v11 + 11) & 0xFFF7;
                    v134 = 13;
LABEL_195:
                    *((_WORD *)v11 + 11) = v133;
                    *((_DWORD *)v11 + 2) = v134;
                    goto LABEL_15;
                  }
                }
                else
                {
                  if (v131 >= *(_QWORD *)&v40)
                    v131 %= *(_QWORD *)&v40;
                  if (v131 != v42)
                    break;
                }
                v129 = (_QWORD *)*v129;
              }
              while (v129);
            }
          }
        }
LABEL_193:
        if (v16 <= v14)
        {
          *(_QWORD *)*v11 = v149[0];
          v133 = *((_WORD *)v11 + 11) & 0xFFD7 | 0x20;
          v134 = 8;
          goto LABEL_195;
        }
LABEL_15:
        v11 += 3;
      }
      while (v11 != (_QWORD *)v12);
    }
    a2 = v139;
    v135 = *(_QWORD *)(v139 + 464);
    if (v135 == *(_QWORD *)(v139 + 456))
    {
      if (*(_BYTE *)(v139 + 488))
      {
        v136 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v139 + 480) + 56))(*(_QWORD *)(v139 + 480), v135, *(_QWORD *)(v139 + 472) - v135);
        v137 = *(_QWORD *)(v139 + 456);
        *(_QWORD *)(v139 + 464) = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v139 + 480) + 48))(*(_QWORD *)(v139 + 480), v137, *(_QWORD *)(v139 + 472) - v137)+ v137;
        GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode_associated(v139, v136);
      }
      else
      {
        GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode(v139);
      }
    }
    v9 = *(_QWORD *)(v139 + 464);
    *(_QWORD *)(v139 + 456) = v9;
    v7 += 57;
    ++*v141;
    if (v7 == v141)
      break;
  }
  if (__p)
  {
    v151 = (char *)__p;
    operator delete(__p);
  }
  if (v153)
  {
    v154 = v153;
    operator delete(v153);
  }
  return a1;
}

void sub_23C6B4260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  uint64_t v25;
  void *v27;
  GPUTools::FD::CoreFunction *v28;
  uint64_t v29;
  uint64_t v30;

  if (__p)
    operator delete(__p);
  v27 = *(void **)(v25 - 112);
  if (v27)
  {
    *(_QWORD *)(v25 - 104) = v27;
    operator delete(v27);
  }
  v28 = (GPUTools::FD::CoreFunction *)(a13 + 2096696);
  v29 = -2097144;
  do
  {
    GPUTools::FD::CoreFunction::~CoreFunction(v28);
    v28 = (GPUTools::FD::CoreFunction *)(v30 - 456);
    v29 += 456;
  }
  while (v29);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::Playback::TDFSSegment<2097152ul>::~TDFSSegment(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  v3 = a1 + 2096696;
  do
  {
    GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(v3 + v2));
    v2 -= 456;
  }
  while (v2 != -2097144);
  return a1;
}

void GPUTools::Playback::TDFSSegment<2097152ul>::~TDFSSegment(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 0;
  v2 = a1 + 2096696;
  do
  {
    GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(v2 + v1));
    v1 -= 456;
  }
  while (v1 != -2097144);
  JUMPOUT(0x24262211CLL);
}

uint64_t GPUTools::Playback::TDFSSegment<2097152ul>::get_functions(uint64_t a1)
{
  return a1 + 8;
}

uint64_t GPUTools::Playback::TDFSSegment<2097152ul>::get_count(uint64_t a1)
{
  return *(_QWORD *)(a1 + 0x200000);
}

uint64_t GPUTools::Playback::TDFSSegment<2097152ul>::get_max_functions()
{
  return 4599;
}

uint64_t GPUTools::Playback::TDFSSegment<2097152ul>::operator=(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t i;

  if (a1 != a2)
  {
    v3 = (_QWORD *)(a2 + 0x200000);
    for (i = 8; i != 0x200000; i += 456)
      GPUTools::FD::CoreFunction::operator=();
    *(_QWORD *)(a1 + 0x200000) = *v3;
  }
  return a1;
}

void GPUTools::Playback::TDFSSegmentFactory<GPUTools::Playback::TDFSSegment<524288ul>>::~TDFSSegmentFactory()
{
  JUMPOUT(0x24262211CLL);
}

_QWORD *GPUTools::Playback::TDFSSegmentFactory<GPUTools::Playback::TDFSSegment<524288ul>>::new_segment(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _QWORD *a5)
{
  _QWORD *v9;

  v9 = (_QWORD *)operator new();
  GPUTools::Playback::TDFSSegment<524288ul>::TDFSSegment(v9, a2, a3, a4, a5);
  return v9;
}

void sub_23C6B44BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24262211C](v1, 0x1081C4025EF841FLL);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::Playback::TDFSSegmentFactory<GPUTools::Playback::TDFSSegment<524288ul>>::get_max_functions()
{
  return 1149;
}

_QWORD *GPUTools::Playback::TDFSSegment<524288ul>::TDFSSegment(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, _QWORD *a5)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  int8x8_t v39;
  uint8x8_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  uint64_t v47;
  int8x8_t v48;
  uint8x8_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  _BYTE *v64;
  char *v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  _BYTE *v73;
  char *v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  _OWORD *v79;
  char *v80;
  uint64_t v81;
  __int128 v82;
  uint64_t v83;
  _OWORD *v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  _OWORD *v90;
  char *v91;
  uint64_t v92;
  __int128 v93;
  uint64_t v94;
  _QWORD *v95;
  char *v96;
  _QWORD *v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  char *v102;
  char *v103;
  char *v104;
  char *v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char *v110;
  char *v111;
  char *v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  __int128 *v119;
  _OWORD *v120;
  uint64_t v121;
  __int128 v122;
  _QWORD *v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  _QWORD *v127;
  _QWORD *v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  __int16 v132;
  int v133;
  uint64_t v134;
  __int16 v135;
  uint64_t v136;
  uint64_t v138;
  _QWORD *v140;
  _QWORD *v142;
  _QWORD *v143;
  unint64_t v144;
  unint64_t v145;
  uint64_t v146;
  _QWORD v148[4];
  void *__p;
  char *v150;
  char *v151;
  char *v152;
  char *v153;
  char *v154;

  v7 = 0;
  *a1 = &off_250D590A8;
  v8 = a1 + 1;
  v140 = a1 + 65494;
  do
  {
    GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)&a1[v7 + 1]);
    v7 += 57;
  }
  while (v7 != 65493);
  *v140 = 0;
  v152 = 0;
  v153 = 0;
  v154 = 0;
  __p = 0;
  v150 = 0;
  v151 = 0;
  v9 = *(_QWORD *)(a2 + 456);
  v143 = a5;
  v138 = a2;
  while (v9 != *(_QWORD *)(a3 + 456))
  {
    if (*(_DWORD *)a2 == -1 || *(_QWORD *)(a2 + 464) == v9)
      GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode(a2);
    GPUTools::FD::CoreFunction::operator=();
    if (*((_WORD *)v8 + 5))
    {
      v11 = v8 + 6;
      v146 = (uint64_t)&v8[3 * *((unsigned __int16 *)v8 + 5) + 6];
      v142 = v8;
      do
      {
        if ((*((_WORD *)v11 + 11) & 8) == 0)
          goto LABEL_15;
        v13 = *((unsigned int *)v11 + 4);
        v14 = *((unsigned __int16 *)v11 + 10);
        v15 = 8 * v14;
        if (8 * v14 > v13)
          goto LABEL_15;
        v16 = v152;
        if (v14 <= (v154 - v152) >> 3)
        {
          v21 = v152;
          goto LABEL_30;
        }
        v17 = v153;
        v18 = (char *)operator new(8 * v14);
        v19 = v17 - v16;
        v20 = &v18[(v17 - v16) & 0xFFFFFFFFFFFFFFF8];
        v21 = v20;
        if (v17 != v16)
        {
          v22 = v17 - 8 - v16;
          if (v22 < 0x58)
          {
            v21 = &v18[(v17 - v16) & 0xFFFFFFFFFFFFFFF8];
            do
            {
LABEL_27:
              v31 = *((_QWORD *)v17 - 1);
              v17 -= 8;
              *((_QWORD *)v21 - 1) = v31;
              v21 -= 8;
            }
            while (v17 != v16);
            goto LABEL_28;
          }
          v21 = &v18[(v17 - v16) & 0xFFFFFFFFFFFFFFF8];
          if ((unint64_t)(v17 - &v18[v19 & 0xFFFFFFFFFFFFFFF8]) < 0x20)
            goto LABEL_27;
          v23 = v19 >> 3;
          v24 = (v22 >> 3) + 1;
          v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
          v26 = &v17[-v25];
          v21 = &v20[-v25];
          v27 = &v18[8 * v23 - 16];
          v28 = v17 - 16;
          v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v30 = *(_OWORD *)v28;
            *((_OWORD *)v27 - 1) = *((_OWORD *)v28 - 1);
            *(_OWORD *)v27 = v30;
            v27 -= 32;
            v28 -= 32;
            v29 -= 4;
          }
          while (v29);
          v17 = v26;
          if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_27;
        }
LABEL_28:
        v152 = v21;
        v153 = v20;
        v154 = &v18[8 * v14];
        if (v16)
        {
          operator delete(v16);
          v21 = v152;
        }
LABEL_30:
        v153 = v21;
        v32 = *((unsigned __int16 *)v11 + 10);
        if (8 * v32 > *((unsigned int *)v11 + 4))
          goto LABEL_15;
        v33 = (char *)__p;
        if (v32 <= (v151 - (_BYTE *)__p) >> 4)
        {
          v150 = (char *)__p;
          if ((*((_WORD *)v11 + 11) & 1) != 0)
            goto LABEL_43;
        }
        else
        {
          v34 = v150;
          v35 = (char *)operator new(16 * v32);
          v36 = &v35[(v34 - v33) & 0xFFFFFFFFFFFFFFF0];
          v37 = v36;
          if (v34 != v33)
          {
            v38 = &v35[(v34 - v33) & 0xFFFFFFFFFFFFFFF0];
            do
            {
              v37 = v38 - 16;
              *((_OWORD *)v38 - 1) = *((_OWORD *)v34 - 1);
              v34 -= 16;
              v38 -= 16;
            }
            while (v34 != v33);
          }
          __p = v37;
          v150 = v36;
          v151 = &v35[16 * v32];
          if (v33)
          {
            operator delete(v33);
            v37 = (char *)__p;
          }
          v150 = v37;
          if ((*((_WORD *)v11 + 11) & 1) != 0)
          {
LABEL_43:
            v42 = GPUTools::FD::Argument::ViewAsCStringArray((GPUTools::FD::Argument *)v11);
            if (!*((_WORD *)v11 + 10))
              goto LABEL_13;
            v43 = v42;
            v44 = 0;
            v45 = 1;
            v144 = v13;
            v145 = v15;
LABEL_47:
            while (2)
            {
              v47 = *(_QWORD *)v43;
              if ((*(_WORD *)(v43 + 22) & 0x40) != 0)
              {
                if (*(_BYTE *)(*(unsigned int *)(v47 + 4 * v44) + v47))
                {
LABEL_49:
                  objc_msgSend(a4, "getInfo:forFilenameBuffer:error:", v148);
                  v48 = (int8x8_t)a5[1];
                  if (!*(_QWORD *)&v48)
                    goto LABEL_73;
                  v49 = (uint8x8_t)vcnt_s8(v48);
                  v49.i16[0] = vaddlv_u8(v49);
                  if (v49.u32[0] > 1uLL)
                  {
                    v50 = v148[0];
                    if (v148[0] >= *(_QWORD *)&v48)
                      v50 = v148[0] % *(_QWORD *)&v48;
                  }
                  else
                  {
                    v50 = (*(_QWORD *)&v48 - 1) & v148[0];
                  }
                  v53 = *(_QWORD **)(*a5 + 8 * v50);
                  if (!v53 || (v54 = (_QWORD *)*v53) == 0)
                  {
LABEL_73:
                    if (v15 <= v13)
                    {
                      v45 = 0;
                      goto LABEL_75;
                    }
                    LODWORD(v46) = *((unsigned __int16 *)v11 + 10);
                    goto LABEL_167;
                  }
                  if (v49.u32[0] < 2uLL)
                  {
                    v55 = *(_QWORD *)&v48 - 1;
                    while (1)
                    {
                      v57 = v54[1];
                      if (v57 == v148[0])
                      {
                        if (v54[2] == v148[0])
                          goto LABEL_108;
                      }
                      else if ((v57 & v55) != v50)
                      {
                        goto LABEL_73;
                      }
                      v54 = (_QWORD *)*v54;
                      if (!v54)
                        goto LABEL_73;
                    }
                  }
                  while (1)
                  {
                    v56 = v54[1];
                    if (v56 == v148[0])
                    {
                      if (v54[2] == v148[0])
                      {
LABEL_108:
                        v84 = v54 + 3;
                        v85 = v150;
                        if (v150 < v151)
                        {
                          *(_OWORD *)v150 = *v84;
                          v86 = v85 + 16;
                          v15 = v145;
                          goto LABEL_156;
                        }
                        v105 = (char *)__p;
                        v106 = (v150 - (_BYTE *)__p) >> 4;
                        v107 = v106 + 1;
                        if ((unint64_t)(v106 + 1) >> 60)
                          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                        v108 = v151 - (_BYTE *)__p;
                        if ((v151 - (_BYTE *)__p) >> 3 > v107)
                          v107 = v108 >> 3;
                        if ((unint64_t)v108 >= 0x7FFFFFFFFFFFFFF0)
                          v109 = 0xFFFFFFFFFFFFFFFLL;
                        else
                          v109 = v107;
                        if (!v109)
                        {
                          v110 = 0;
                          v111 = (char *)(16 * v106);
                          *(_OWORD *)(16 * v106) = *v84;
                          v112 = (char *)(16 * v106);
                          if (v85 != v105)
                            goto LABEL_152;
LABEL_159:
                          a5 = v143;
                          v15 = v145;
                          v86 = v111 + 16;
                          __p = v112;
                          v150 = v111 + 16;
                          v151 = &v110[16 * v109];
                          if (v85)
                            goto LABEL_155;
                          goto LABEL_156;
                        }
                        if (v109 >> 60)
                          goto LABEL_211;
                        v110 = (char *)operator new(16 * v109);
                        v13 = v144;
                        v111 = &v110[16 * v106];
                        *(_OWORD *)v111 = *v84;
                        v112 = v111;
                        if (v85 == v105)
                          goto LABEL_159;
LABEL_152:
                        a5 = v143;
                        v15 = v145;
                        do
                        {
                          *((_OWORD *)v112 - 1) = *((_OWORD *)v85 - 1);
                          v112 -= 16;
                          v85 -= 16;
                        }
                        while (v85 != v105);
                        v85 = (char *)__p;
                        v86 = v111 + 16;
                        __p = v112;
                        v150 = v111 + 16;
                        v151 = &v110[16 * v109];
                        if (v85)
LABEL_155:
                          operator delete(v85);
LABEL_156:
                        v150 = v86;
                        if (v15 > v13)
                          goto LABEL_46;
LABEL_75:
                        v58 = v153;
                        if (v153 < v154)
                        {
                          *(_QWORD *)v153 = v148[0];
                          v153 = v58 + 8;
                          goto LABEL_46;
                        }
                        v59 = v152;
                        v60 = (v153 - v152) >> 3;
                        v61 = v60 + 1;
                        if ((unint64_t)(v60 + 1) >> 61)
                          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                        v62 = v154 - v152;
                        if ((v154 - v152) >> 2 > v61)
                          v61 = v62 >> 2;
                        if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8)
                          v63 = 0x1FFFFFFFFFFFFFFFLL;
                        else
                          v63 = v61;
                        if (!v63)
                        {
                          v64 = 0;
                          v65 = (char *)(8 * v60);
                          *(_QWORD *)(8 * v60) = v148[0];
                          v66 = 8 * v60 + 8;
                          if (v58 == v59)
                            goto LABEL_88;
LABEL_85:
                          v67 = v58 - 8 - v59;
                          if (v67 >= 0x58)
                          {
                            v13 = v144;
                            if ((unint64_t)(v59 - v64) >= 0x20)
                            {
                              v76 = (v67 >> 3) + 1;
                              v77 = 8 * (v76 & 0x3FFFFFFFFFFFFFFCLL);
                              v78 = &v58[-v77];
                              v65 -= v77;
                              v79 = &v64[8 * v60 - 16];
                              v80 = v58 - 16;
                              v81 = v76 & 0x3FFFFFFFFFFFFFFCLL;
                              do
                              {
                                v82 = *(_OWORD *)v80;
                                *(v79 - 1) = *((_OWORD *)v80 - 1);
                                *v79 = v82;
                                v79 -= 2;
                                v80 -= 32;
                                v81 -= 4;
                              }
                              while (v81);
                              v58 = v78;
                              if (v76 == (v76 & 0x3FFFFFFFFFFFFFFCLL))
                                goto LABEL_105;
                            }
                          }
                          else
                          {
                            v13 = v144;
                          }
                          do
                          {
                            v83 = *((_QWORD *)v58 - 1);
                            v58 -= 8;
                            *((_QWORD *)v65 - 1) = v83;
                            v65 -= 8;
                          }
                          while (v58 != v59);
                          goto LABEL_105;
                        }
                        if (v63 >> 61)
LABEL_211:
                          std::__throw_bad_array_new_length[abi:ne180100]();
                        v64 = operator new(8 * v63);
                        v65 = &v64[8 * v60];
                        *(_QWORD *)v65 = v148[0];
                        v66 = (uint64_t)(v65 + 8);
                        if (v58 != v59)
                          goto LABEL_85;
LABEL_88:
                        v13 = v144;
LABEL_105:
                        v152 = v65;
                        v153 = (char *)v66;
                        v154 = &v64[8 * v63];
                        if (v59)
                          operator delete(v59);
                        a5 = v143;
                        v15 = v145;
                        v153 = (char *)v66;
LABEL_46:
                        ++v44;
                        v46 = *((unsigned __int16 *)v11 + 10);
                        if (v44 < v46)
                          goto LABEL_47;
                        if ((v45 & 1) != 0)
                        {
                          v8 = v142;
                          if (*((_WORD *)v11 + 10))
                          {
                            v113 = 0;
                            v114 = (_QWORD *)*v11;
                            do
                            {
                              *v114++ = *(_QWORD *)((char *)__p + v113);
                              v113 += 16;
                            }
                            while (16 * v46 != v113);
                          }
LABEL_13:
                          *((_WORD *)v11 + 11) &= 0xFFB7u;
                          v12 = *((_DWORD *)v11 + 3);
LABEL_14:
                          *((_DWORD *)v11 + 2) = v12;
                          goto LABEL_15;
                        }
LABEL_167:
                        v8 = v142;
                        if ((_DWORD)v46)
                        {
LABEL_168:
                          v115 = 0;
                          v116 = *v11;
                          v117 = v152;
                          v118 = v46;
                          if (v46 < 4)
                            goto LABEL_173;
                          if ((unint64_t)(v116 - (_QWORD)v152) < 0x20)
                            goto LABEL_173;
                          v115 = (unsigned __int16)v46 & 0xFFFC;
                          v119 = (__int128 *)(v152 + 16);
                          v120 = (_OWORD *)(v116 + 16);
                          v121 = (unsigned __int16)v118 & 0xFFFC;
                          do
                          {
                            v122 = *v119;
                            *(v120 - 1) = *(v119 - 1);
                            *v120 = v122;
                            v119 += 2;
                            v120 += 2;
                            v121 -= 4;
                          }
                          while (v121);
                          if (v115 != v118)
                          {
LABEL_173:
                            v123 = (_QWORD *)(v116 + 8 * v115);
                            v124 = &v117[8 * v115];
                            v125 = v118 - v115;
                            do
                            {
                              v126 = *(_QWORD *)v124;
                              v124 += 8;
                              *v123++ = v126;
                              --v125;
                            }
                            while (v125);
                          }
                        }
LABEL_175:
                        *((_WORD *)v11 + 11) = *((_WORD *)v11 + 11) & 0xFF97 | 0x20;
                        v12 = 8;
                        goto LABEL_14;
                      }
                    }
                    else
                    {
                      if (v56 >= *(_QWORD *)&v48)
                        v56 %= *(_QWORD *)&v48;
                      if (v56 != v50)
                        goto LABEL_73;
                    }
                    v54 = (_QWORD *)*v54;
                    if (!v54)
                      goto LABEL_73;
                  }
                }
              }
              else if (**(_BYTE **)(v47 + 8 * v44))
              {
                goto LABEL_49;
              }
              if (v15 > v13)
                goto LABEL_121;
              v51 = v153;
              if (v153 < v154)
              {
                *(_QWORD *)v153 = -1;
                v52 = (uint64_t)(v51 + 8);
                goto LABEL_120;
              }
              v68 = v152;
              v69 = (v153 - v152) >> 3;
              v70 = v69 + 1;
              if ((unint64_t)(v69 + 1) >> 61)
                std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
              v71 = v154 - v152;
              if ((v154 - v152) >> 2 > v70)
                v70 = v71 >> 2;
              if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFF8)
                v72 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v72 = v70;
              if (v72)
              {
                if (v72 >> 61)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v73 = operator new(8 * v72);
                v74 = &v73[8 * v69];
                *(_QWORD *)v74 = -1;
                v52 = (uint64_t)(v74 + 8);
                if (v51 != v68)
                {
LABEL_98:
                  v75 = v51 - 8 - v68;
                  if (v75 < 0x58)
                  {
                    v13 = v144;
                    goto LABEL_116;
                  }
                  v13 = v144;
                  if ((unint64_t)(v68 - v73) < 0x20)
                    goto LABEL_219;
                  v87 = (v75 >> 3) + 1;
                  v88 = 8 * (v87 & 0x3FFFFFFFFFFFFFFCLL);
                  v89 = &v51[-v88];
                  v74 -= v88;
                  v90 = &v73[8 * v69 - 16];
                  v91 = v51 - 16;
                  v92 = v87 & 0x3FFFFFFFFFFFFFFCLL;
                  do
                  {
                    v93 = *(_OWORD *)v91;
                    *(v90 - 1) = *((_OWORD *)v91 - 1);
                    *v90 = v93;
                    v90 -= 2;
                    v91 -= 32;
                    v92 -= 4;
                  }
                  while (v92);
                  v51 = v89;
                  if (v87 != (v87 & 0x3FFFFFFFFFFFFFFCLL))
                  {
LABEL_219:
                    do
                    {
LABEL_116:
                      v94 = *((_QWORD *)v51 - 1);
                      v51 -= 8;
                      *((_QWORD *)v74 - 1) = v94;
                      v74 -= 8;
                    }
                    while (v51 != v68);
                  }
LABEL_117:
                  v152 = v74;
                  v153 = (char *)v52;
                  v154 = &v73[8 * v72];
                  if (v68)
                    operator delete(v68);
                  a5 = v143;
                  v15 = v145;
LABEL_120:
                  v153 = (char *)v52;
LABEL_121:
                  if ((v45 & 1) == 0)
                  {
                    v45 = 0;
                    ++v44;
                    v46 = *((unsigned __int16 *)v11 + 10);
                    if (v44 < v46)
                      continue;
                    v8 = v142;
                    if (*((_WORD *)v11 + 10))
                      goto LABEL_168;
                    goto LABEL_175;
                  }
                  v95 = v150;
                  if (v150 < v151)
                  {
                    v96 = v150 + 16;
                    *(_QWORD *)v150 = 0;
                    v95[1] = 0;
LABEL_139:
                    v150 = v96;
                    v45 = 1;
                    goto LABEL_46;
                  }
                  v97 = __p;
                  v98 = (v150 - (_BYTE *)__p) >> 4;
                  v99 = v98 + 1;
                  if ((unint64_t)(v98 + 1) >> 60)
                    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                  v100 = v151 - (_BYTE *)__p;
                  if ((v151 - (_BYTE *)__p) >> 3 > v99)
                    v99 = v100 >> 3;
                  if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFF0)
                    v101 = 0xFFFFFFFFFFFFFFFLL;
                  else
                    v101 = v99;
                  if (v101)
                  {
                    if (v101 >> 60)
                      std::__throw_bad_array_new_length[abi:ne180100]();
                    v102 = (char *)operator new(16 * v101);
                    v103 = &v102[16 * v98];
                    *(_QWORD *)v103 = 0;
                    *((_QWORD *)v103 + 1) = 0;
                    v104 = v103;
                    if (v95 != v97)
                      goto LABEL_135;
LABEL_141:
                    v15 = v145;
                    v96 = v103 + 16;
                    __p = v104;
                    v150 = v103 + 16;
                    v151 = &v102[16 * v101];
                    if (!v95)
                      goto LABEL_139;
                  }
                  else
                  {
                    v102 = 0;
                    v103 = (char *)(16 * v98);
                    *(_QWORD *)v103 = 0;
                    *((_QWORD *)v103 + 1) = 0;
                    v104 = (char *)(16 * v98);
                    if (v95 == v97)
                      goto LABEL_141;
LABEL_135:
                    v15 = v145;
                    do
                    {
                      *((_OWORD *)v104 - 1) = *((_OWORD *)v95 - 1);
                      v104 -= 16;
                      v95 -= 2;
                    }
                    while (v95 != v97);
                    v95 = __p;
                    v96 = v103 + 16;
                    __p = v104;
                    v150 = v103 + 16;
                    v151 = &v102[16 * v101];
                    if (!v95)
                      goto LABEL_139;
                  }
                  operator delete(v95);
                  goto LABEL_139;
                }
              }
              else
              {
                v73 = 0;
                v74 = (char *)(8 * v69);
                *(_QWORD *)(8 * v69) = -1;
                v52 = 8 * v69 + 8;
                if (v51 != v68)
                  goto LABEL_98;
              }
              break;
            }
            v13 = v144;
            goto LABEL_117;
          }
        }
        if (!*v11)
          goto LABEL_15;
        objc_msgSend(a4, "getInfo:forFilenameBuffer:error:", v148, *v11, 0);
        v39 = (int8x8_t)a5[1];
        if (v39)
        {
          v40 = (uint8x8_t)vcnt_s8(v39);
          v40.i16[0] = vaddlv_u8(v40);
          if (v40.u32[0] > 1uLL)
          {
            v41 = v148[0];
            if (v148[0] >= *(_QWORD *)&v39)
              v41 = v148[0] % *(_QWORD *)&v39;
          }
          else
          {
            v41 = (*(_QWORD *)&v39 - 1) & v148[0];
          }
          v127 = *(_QWORD **)(*a5 + 8 * v41);
          if (v127)
          {
            v128 = (_QWORD *)*v127;
            if (v128)
            {
              if (v40.u32[0] < 2uLL)
              {
                v129 = *(_QWORD *)&v39 - 1;
                while (1)
                {
                  v131 = v128[1];
                  if (v131 == v148[0])
                  {
                    if (v128[2] == v148[0])
                      goto LABEL_198;
                  }
                  else if ((v131 & v129) != v41)
                  {
                    goto LABEL_193;
                  }
                  v128 = (_QWORD *)*v128;
                  if (!v128)
                    goto LABEL_193;
                }
              }
              do
              {
                v130 = v128[1];
                if (v130 == v148[0])
                {
                  if (v128[2] == v148[0])
                  {
LABEL_198:
                    *v11 = v128[3];
                    v132 = *((_WORD *)v11 + 11) & 0xFFF7;
                    v133 = 13;
LABEL_195:
                    *((_WORD *)v11 + 11) = v132;
                    *((_DWORD *)v11 + 2) = v133;
                    goto LABEL_15;
                  }
                }
                else
                {
                  if (v130 >= *(_QWORD *)&v39)
                    v130 %= *(_QWORD *)&v39;
                  if (v130 != v41)
                    break;
                }
                v128 = (_QWORD *)*v128;
              }
              while (v128);
            }
          }
        }
LABEL_193:
        if (v15 <= v13)
        {
          *(_QWORD *)*v11 = v148[0];
          v132 = *((_WORD *)v11 + 11) & 0xFFD7 | 0x20;
          v133 = 8;
          goto LABEL_195;
        }
LABEL_15:
        v11 += 3;
      }
      while (v11 != (_QWORD *)v146);
    }
    a2 = v138;
    v134 = *(_QWORD *)(v138 + 464);
    if (v134 == *(_QWORD *)(v138 + 456))
    {
      if (*(_BYTE *)(v138 + 488))
      {
        v135 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v138 + 480) + 56))(*(_QWORD *)(v138 + 480), v134, *(_QWORD *)(v138 + 472) - v134);
        v136 = *(_QWORD *)(v138 + 456);
        *(_QWORD *)(v138 + 464) = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v138 + 480) + 48))(*(_QWORD *)(v138 + 480), v136, *(_QWORD *)(v138 + 472) - v136)+ v136;
        GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode_associated(v138, v135);
      }
      else
      {
        GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode(v138);
      }
    }
    v9 = *(_QWORD *)(v138 + 464);
    *(_QWORD *)(v138 + 456) = v9;
    v8 += 57;
    ++*v140;
    if (v8 == v140)
      break;
  }
  if (__p)
  {
    v150 = (char *)__p;
    operator delete(__p);
  }
  if (v152)
  {
    v153 = v152;
    operator delete(v152);
  }
  return a1;
}

void sub_23C6B511C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  uint64_t v25;
  void *v27;
  GPUTools::FD::CoreFunction *v28;
  uint64_t v29;
  uint64_t v30;

  if (__p)
    operator delete(__p);
  v27 = *(void **)(v25 - 112);
  if (v27)
  {
    *(_QWORD *)(v25 - 104) = v27;
    operator delete(v27);
  }
  v28 = (GPUTools::FD::CoreFunction *)(a13 + 523496);
  v29 = -523944;
  do
  {
    GPUTools::FD::CoreFunction::~CoreFunction(v28);
    v28 = (GPUTools::FD::CoreFunction *)(v30 - 456);
    v29 += 456;
  }
  while (v29);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::Playback::TDFSSegment<524288ul>::~TDFSSegment(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  v3 = a1 + 523496;
  do
  {
    GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(v3 + v2));
    v2 -= 456;
  }
  while (v2 != -523944);
  return a1;
}

void GPUTools::Playback::TDFSSegment<524288ul>::~TDFSSegment(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 0;
  v2 = a1 + 523496;
  do
  {
    GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(v2 + v1));
    v1 -= 456;
  }
  while (v1 != -523944);
  JUMPOUT(0x24262211CLL);
}

uint64_t GPUTools::Playback::TDFSSegment<524288ul>::get_functions(uint64_t a1)
{
  return a1 + 8;
}

uint64_t GPUTools::Playback::TDFSSegment<524288ul>::get_count(uint64_t a1)
{
  return *(_QWORD *)(a1 + 523952);
}

uint64_t GPUTools::Playback::TDFSSegment<524288ul>::get_max_functions()
{
  return 1149;
}

uint64_t GPUTools::Playback::TDFSSegment<524288ul>::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  if (a1 != a2)
  {
    v3 = a2 + 8;
    v4 = (_QWORD *)(a2 + 523952);
    v5 = a1 + 8;
    v6 = 523944;
    do
    {
      GPUTools::FD::CoreFunction::operator=();
      v3 += 456;
      v5 += 456;
      v6 -= 456;
    }
    while (v6);
    *(_QWORD *)(a1 + 523952) = *v4;
  }
  return a1;
}

void GPUTools::Playback::TDFSSegmentFactory<GPUTools::Playback::TDFSSegment<131072ul>>::~TDFSSegmentFactory()
{
  JUMPOUT(0x24262211CLL);
}

_QWORD *GPUTools::Playback::TDFSSegmentFactory<GPUTools::Playback::TDFSSegment<131072ul>>::new_segment(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _QWORD *a5)
{
  _QWORD *v9;

  v9 = (_QWORD *)operator new();
  GPUTools::Playback::TDFSSegment<131072ul>::TDFSSegment(v9, a2, a3, a4, a5);
  return v9;
}

void sub_23C6B5394(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24262211C](v1, 0x1081C408D3D1BC7);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::Playback::TDFSSegmentFactory<GPUTools::Playback::TDFSSegment<131072ul>>::get_max_functions()
{
  return 287;
}

_QWORD *GPUTools::Playback::TDFSSegment<131072ul>::TDFSSegment(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, _QWORD *a5)
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  int8x8_t v39;
  uint8x8_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  uint64_t v47;
  int8x8_t v48;
  uint8x8_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  _BYTE *v64;
  char *v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  _BYTE *v73;
  char *v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  _OWORD *v79;
  char *v80;
  uint64_t v81;
  __int128 v82;
  uint64_t v83;
  _OWORD *v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  _OWORD *v90;
  char *v91;
  uint64_t v92;
  __int128 v93;
  uint64_t v94;
  _QWORD *v95;
  char *v96;
  _QWORD *v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  char *v102;
  char *v103;
  char *v104;
  char *v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char *v110;
  char *v111;
  char *v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  __int128 *v119;
  _OWORD *v120;
  uint64_t v121;
  __int128 v122;
  _QWORD *v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  _QWORD *v127;
  _QWORD *v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  __int16 v132;
  int v133;
  uint64_t v134;
  __int16 v135;
  uint64_t v136;
  uint64_t v138;
  _QWORD *v140;
  _QWORD *v142;
  _QWORD *v143;
  unint64_t v144;
  unint64_t v145;
  uint64_t v146;
  _QWORD v148[4];
  void *__p;
  char *v150;
  char *v151;
  char *v152;
  char *v153;
  char *v154;

  v7 = 0;
  *a1 = &off_250D59118;
  v8 = a1 + 1;
  v140 = a1 + 16360;
  do
  {
    GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)&a1[v7 + 1]);
    v7 += 57;
  }
  while (v7 != 16359);
  *v140 = 0;
  v152 = 0;
  v153 = 0;
  v154 = 0;
  __p = 0;
  v150 = 0;
  v151 = 0;
  v9 = *(_QWORD *)(a2 + 456);
  v143 = a5;
  v138 = a2;
  while (v9 != *(_QWORD *)(a3 + 456))
  {
    if (*(_DWORD *)a2 == -1 || *(_QWORD *)(a2 + 464) == v9)
      GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode(a2);
    GPUTools::FD::CoreFunction::operator=();
    if (*((_WORD *)v8 + 5))
    {
      v11 = v8 + 6;
      v146 = (uint64_t)&v8[3 * *((unsigned __int16 *)v8 + 5) + 6];
      v142 = v8;
      do
      {
        if ((*((_WORD *)v11 + 11) & 8) == 0)
          goto LABEL_15;
        v13 = *((unsigned int *)v11 + 4);
        v14 = *((unsigned __int16 *)v11 + 10);
        v15 = 8 * v14;
        if (8 * v14 > v13)
          goto LABEL_15;
        v16 = v152;
        if (v14 <= (v154 - v152) >> 3)
        {
          v21 = v152;
          goto LABEL_30;
        }
        v17 = v153;
        v18 = (char *)operator new(8 * v14);
        v19 = v17 - v16;
        v20 = &v18[(v17 - v16) & 0xFFFFFFFFFFFFFFF8];
        v21 = v20;
        if (v17 != v16)
        {
          v22 = v17 - 8 - v16;
          if (v22 < 0x58)
          {
            v21 = &v18[(v17 - v16) & 0xFFFFFFFFFFFFFFF8];
            do
            {
LABEL_27:
              v31 = *((_QWORD *)v17 - 1);
              v17 -= 8;
              *((_QWORD *)v21 - 1) = v31;
              v21 -= 8;
            }
            while (v17 != v16);
            goto LABEL_28;
          }
          v21 = &v18[(v17 - v16) & 0xFFFFFFFFFFFFFFF8];
          if ((unint64_t)(v17 - &v18[v19 & 0xFFFFFFFFFFFFFFF8]) < 0x20)
            goto LABEL_27;
          v23 = v19 >> 3;
          v24 = (v22 >> 3) + 1;
          v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
          v26 = &v17[-v25];
          v21 = &v20[-v25];
          v27 = &v18[8 * v23 - 16];
          v28 = v17 - 16;
          v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v30 = *(_OWORD *)v28;
            *((_OWORD *)v27 - 1) = *((_OWORD *)v28 - 1);
            *(_OWORD *)v27 = v30;
            v27 -= 32;
            v28 -= 32;
            v29 -= 4;
          }
          while (v29);
          v17 = v26;
          if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_27;
        }
LABEL_28:
        v152 = v21;
        v153 = v20;
        v154 = &v18[8 * v14];
        if (v16)
        {
          operator delete(v16);
          v21 = v152;
        }
LABEL_30:
        v153 = v21;
        v32 = *((unsigned __int16 *)v11 + 10);
        if (8 * v32 > *((unsigned int *)v11 + 4))
          goto LABEL_15;
        v33 = (char *)__p;
        if (v32 <= (v151 - (_BYTE *)__p) >> 4)
        {
          v150 = (char *)__p;
          if ((*((_WORD *)v11 + 11) & 1) != 0)
            goto LABEL_43;
        }
        else
        {
          v34 = v150;
          v35 = (char *)operator new(16 * v32);
          v36 = &v35[(v34 - v33) & 0xFFFFFFFFFFFFFFF0];
          v37 = v36;
          if (v34 != v33)
          {
            v38 = &v35[(v34 - v33) & 0xFFFFFFFFFFFFFFF0];
            do
            {
              v37 = v38 - 16;
              *((_OWORD *)v38 - 1) = *((_OWORD *)v34 - 1);
              v34 -= 16;
              v38 -= 16;
            }
            while (v34 != v33);
          }
          __p = v37;
          v150 = v36;
          v151 = &v35[16 * v32];
          if (v33)
          {
            operator delete(v33);
            v37 = (char *)__p;
          }
          v150 = v37;
          if ((*((_WORD *)v11 + 11) & 1) != 0)
          {
LABEL_43:
            v42 = GPUTools::FD::Argument::ViewAsCStringArray((GPUTools::FD::Argument *)v11);
            if (!*((_WORD *)v11 + 10))
              goto LABEL_13;
            v43 = v42;
            v44 = 0;
            v45 = 1;
            v144 = v13;
            v145 = v15;
LABEL_47:
            while (2)
            {
              v47 = *(_QWORD *)v43;
              if ((*(_WORD *)(v43 + 22) & 0x40) != 0)
              {
                if (*(_BYTE *)(*(unsigned int *)(v47 + 4 * v44) + v47))
                {
LABEL_49:
                  objc_msgSend(a4, "getInfo:forFilenameBuffer:error:", v148);
                  v48 = (int8x8_t)a5[1];
                  if (!*(_QWORD *)&v48)
                    goto LABEL_73;
                  v49 = (uint8x8_t)vcnt_s8(v48);
                  v49.i16[0] = vaddlv_u8(v49);
                  if (v49.u32[0] > 1uLL)
                  {
                    v50 = v148[0];
                    if (v148[0] >= *(_QWORD *)&v48)
                      v50 = v148[0] % *(_QWORD *)&v48;
                  }
                  else
                  {
                    v50 = (*(_QWORD *)&v48 - 1) & v148[0];
                  }
                  v53 = *(_QWORD **)(*a5 + 8 * v50);
                  if (!v53 || (v54 = (_QWORD *)*v53) == 0)
                  {
LABEL_73:
                    if (v15 <= v13)
                    {
                      v45 = 0;
                      goto LABEL_75;
                    }
                    LODWORD(v46) = *((unsigned __int16 *)v11 + 10);
                    goto LABEL_167;
                  }
                  if (v49.u32[0] < 2uLL)
                  {
                    v55 = *(_QWORD *)&v48 - 1;
                    while (1)
                    {
                      v57 = v54[1];
                      if (v57 == v148[0])
                      {
                        if (v54[2] == v148[0])
                          goto LABEL_108;
                      }
                      else if ((v57 & v55) != v50)
                      {
                        goto LABEL_73;
                      }
                      v54 = (_QWORD *)*v54;
                      if (!v54)
                        goto LABEL_73;
                    }
                  }
                  while (1)
                  {
                    v56 = v54[1];
                    if (v56 == v148[0])
                    {
                      if (v54[2] == v148[0])
                      {
LABEL_108:
                        v84 = v54 + 3;
                        v85 = v150;
                        if (v150 < v151)
                        {
                          *(_OWORD *)v150 = *v84;
                          v86 = v85 + 16;
                          v15 = v145;
                          goto LABEL_156;
                        }
                        v105 = (char *)__p;
                        v106 = (v150 - (_BYTE *)__p) >> 4;
                        v107 = v106 + 1;
                        if ((unint64_t)(v106 + 1) >> 60)
                          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                        v108 = v151 - (_BYTE *)__p;
                        if ((v151 - (_BYTE *)__p) >> 3 > v107)
                          v107 = v108 >> 3;
                        if ((unint64_t)v108 >= 0x7FFFFFFFFFFFFFF0)
                          v109 = 0xFFFFFFFFFFFFFFFLL;
                        else
                          v109 = v107;
                        if (!v109)
                        {
                          v110 = 0;
                          v111 = (char *)(16 * v106);
                          *(_OWORD *)(16 * v106) = *v84;
                          v112 = (char *)(16 * v106);
                          if (v85 != v105)
                            goto LABEL_152;
LABEL_159:
                          a5 = v143;
                          v15 = v145;
                          v86 = v111 + 16;
                          __p = v112;
                          v150 = v111 + 16;
                          v151 = &v110[16 * v109];
                          if (v85)
                            goto LABEL_155;
                          goto LABEL_156;
                        }
                        if (v109 >> 60)
                          goto LABEL_211;
                        v110 = (char *)operator new(16 * v109);
                        v13 = v144;
                        v111 = &v110[16 * v106];
                        *(_OWORD *)v111 = *v84;
                        v112 = v111;
                        if (v85 == v105)
                          goto LABEL_159;
LABEL_152:
                        a5 = v143;
                        v15 = v145;
                        do
                        {
                          *((_OWORD *)v112 - 1) = *((_OWORD *)v85 - 1);
                          v112 -= 16;
                          v85 -= 16;
                        }
                        while (v85 != v105);
                        v85 = (char *)__p;
                        v86 = v111 + 16;
                        __p = v112;
                        v150 = v111 + 16;
                        v151 = &v110[16 * v109];
                        if (v85)
LABEL_155:
                          operator delete(v85);
LABEL_156:
                        v150 = v86;
                        if (v15 > v13)
                          goto LABEL_46;
LABEL_75:
                        v58 = v153;
                        if (v153 < v154)
                        {
                          *(_QWORD *)v153 = v148[0];
                          v153 = v58 + 8;
                          goto LABEL_46;
                        }
                        v59 = v152;
                        v60 = (v153 - v152) >> 3;
                        v61 = v60 + 1;
                        if ((unint64_t)(v60 + 1) >> 61)
                          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                        v62 = v154 - v152;
                        if ((v154 - v152) >> 2 > v61)
                          v61 = v62 >> 2;
                        if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8)
                          v63 = 0x1FFFFFFFFFFFFFFFLL;
                        else
                          v63 = v61;
                        if (!v63)
                        {
                          v64 = 0;
                          v65 = (char *)(8 * v60);
                          *(_QWORD *)(8 * v60) = v148[0];
                          v66 = 8 * v60 + 8;
                          if (v58 == v59)
                            goto LABEL_88;
LABEL_85:
                          v67 = v58 - 8 - v59;
                          if (v67 >= 0x58)
                          {
                            v13 = v144;
                            if ((unint64_t)(v59 - v64) >= 0x20)
                            {
                              v76 = (v67 >> 3) + 1;
                              v77 = 8 * (v76 & 0x3FFFFFFFFFFFFFFCLL);
                              v78 = &v58[-v77];
                              v65 -= v77;
                              v79 = &v64[8 * v60 - 16];
                              v80 = v58 - 16;
                              v81 = v76 & 0x3FFFFFFFFFFFFFFCLL;
                              do
                              {
                                v82 = *(_OWORD *)v80;
                                *(v79 - 1) = *((_OWORD *)v80 - 1);
                                *v79 = v82;
                                v79 -= 2;
                                v80 -= 32;
                                v81 -= 4;
                              }
                              while (v81);
                              v58 = v78;
                              if (v76 == (v76 & 0x3FFFFFFFFFFFFFFCLL))
                                goto LABEL_105;
                            }
                          }
                          else
                          {
                            v13 = v144;
                          }
                          do
                          {
                            v83 = *((_QWORD *)v58 - 1);
                            v58 -= 8;
                            *((_QWORD *)v65 - 1) = v83;
                            v65 -= 8;
                          }
                          while (v58 != v59);
                          goto LABEL_105;
                        }
                        if (v63 >> 61)
LABEL_211:
                          std::__throw_bad_array_new_length[abi:ne180100]();
                        v64 = operator new(8 * v63);
                        v65 = &v64[8 * v60];
                        *(_QWORD *)v65 = v148[0];
                        v66 = (uint64_t)(v65 + 8);
                        if (v58 != v59)
                          goto LABEL_85;
LABEL_88:
                        v13 = v144;
LABEL_105:
                        v152 = v65;
                        v153 = (char *)v66;
                        v154 = &v64[8 * v63];
                        if (v59)
                          operator delete(v59);
                        a5 = v143;
                        v15 = v145;
                        v153 = (char *)v66;
LABEL_46:
                        ++v44;
                        v46 = *((unsigned __int16 *)v11 + 10);
                        if (v44 < v46)
                          goto LABEL_47;
                        if ((v45 & 1) != 0)
                        {
                          v8 = v142;
                          if (*((_WORD *)v11 + 10))
                          {
                            v113 = 0;
                            v114 = (_QWORD *)*v11;
                            do
                            {
                              *v114++ = *(_QWORD *)((char *)__p + v113);
                              v113 += 16;
                            }
                            while (16 * v46 != v113);
                          }
LABEL_13:
                          *((_WORD *)v11 + 11) &= 0xFFB7u;
                          v12 = *((_DWORD *)v11 + 3);
LABEL_14:
                          *((_DWORD *)v11 + 2) = v12;
                          goto LABEL_15;
                        }
LABEL_167:
                        v8 = v142;
                        if ((_DWORD)v46)
                        {
LABEL_168:
                          v115 = 0;
                          v116 = *v11;
                          v117 = v152;
                          v118 = v46;
                          if (v46 < 4)
                            goto LABEL_173;
                          if ((unint64_t)(v116 - (_QWORD)v152) < 0x20)
                            goto LABEL_173;
                          v115 = (unsigned __int16)v46 & 0xFFFC;
                          v119 = (__int128 *)(v152 + 16);
                          v120 = (_OWORD *)(v116 + 16);
                          v121 = (unsigned __int16)v118 & 0xFFFC;
                          do
                          {
                            v122 = *v119;
                            *(v120 - 1) = *(v119 - 1);
                            *v120 = v122;
                            v119 += 2;
                            v120 += 2;
                            v121 -= 4;
                          }
                          while (v121);
                          if (v115 != v118)
                          {
LABEL_173:
                            v123 = (_QWORD *)(v116 + 8 * v115);
                            v124 = &v117[8 * v115];
                            v125 = v118 - v115;
                            do
                            {
                              v126 = *(_QWORD *)v124;
                              v124 += 8;
                              *v123++ = v126;
                              --v125;
                            }
                            while (v125);
                          }
                        }
LABEL_175:
                        *((_WORD *)v11 + 11) = *((_WORD *)v11 + 11) & 0xFF97 | 0x20;
                        v12 = 8;
                        goto LABEL_14;
                      }
                    }
                    else
                    {
                      if (v56 >= *(_QWORD *)&v48)
                        v56 %= *(_QWORD *)&v48;
                      if (v56 != v50)
                        goto LABEL_73;
                    }
                    v54 = (_QWORD *)*v54;
                    if (!v54)
                      goto LABEL_73;
                  }
                }
              }
              else if (**(_BYTE **)(v47 + 8 * v44))
              {
                goto LABEL_49;
              }
              if (v15 > v13)
                goto LABEL_121;
              v51 = v153;
              if (v153 < v154)
              {
                *(_QWORD *)v153 = -1;
                v52 = (uint64_t)(v51 + 8);
                goto LABEL_120;
              }
              v68 = v152;
              v69 = (v153 - v152) >> 3;
              v70 = v69 + 1;
              if ((unint64_t)(v69 + 1) >> 61)
                std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
              v71 = v154 - v152;
              if ((v154 - v152) >> 2 > v70)
                v70 = v71 >> 2;
              if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFF8)
                v72 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v72 = v70;
              if (v72)
              {
                if (v72 >> 61)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v73 = operator new(8 * v72);
                v74 = &v73[8 * v69];
                *(_QWORD *)v74 = -1;
                v52 = (uint64_t)(v74 + 8);
                if (v51 != v68)
                {
LABEL_98:
                  v75 = v51 - 8 - v68;
                  if (v75 < 0x58)
                  {
                    v13 = v144;
                    goto LABEL_116;
                  }
                  v13 = v144;
                  if ((unint64_t)(v68 - v73) < 0x20)
                    goto LABEL_219;
                  v87 = (v75 >> 3) + 1;
                  v88 = 8 * (v87 & 0x3FFFFFFFFFFFFFFCLL);
                  v89 = &v51[-v88];
                  v74 -= v88;
                  v90 = &v73[8 * v69 - 16];
                  v91 = v51 - 16;
                  v92 = v87 & 0x3FFFFFFFFFFFFFFCLL;
                  do
                  {
                    v93 = *(_OWORD *)v91;
                    *(v90 - 1) = *((_OWORD *)v91 - 1);
                    *v90 = v93;
                    v90 -= 2;
                    v91 -= 32;
                    v92 -= 4;
                  }
                  while (v92);
                  v51 = v89;
                  if (v87 != (v87 & 0x3FFFFFFFFFFFFFFCLL))
                  {
LABEL_219:
                    do
                    {
LABEL_116:
                      v94 = *((_QWORD *)v51 - 1);
                      v51 -= 8;
                      *((_QWORD *)v74 - 1) = v94;
                      v74 -= 8;
                    }
                    while (v51 != v68);
                  }
LABEL_117:
                  v152 = v74;
                  v153 = (char *)v52;
                  v154 = &v73[8 * v72];
                  if (v68)
                    operator delete(v68);
                  a5 = v143;
                  v15 = v145;
LABEL_120:
                  v153 = (char *)v52;
LABEL_121:
                  if ((v45 & 1) == 0)
                  {
                    v45 = 0;
                    ++v44;
                    v46 = *((unsigned __int16 *)v11 + 10);
                    if (v44 < v46)
                      continue;
                    v8 = v142;
                    if (*((_WORD *)v11 + 10))
                      goto LABEL_168;
                    goto LABEL_175;
                  }
                  v95 = v150;
                  if (v150 < v151)
                  {
                    v96 = v150 + 16;
                    *(_QWORD *)v150 = 0;
                    v95[1] = 0;
LABEL_139:
                    v150 = v96;
                    v45 = 1;
                    goto LABEL_46;
                  }
                  v97 = __p;
                  v98 = (v150 - (_BYTE *)__p) >> 4;
                  v99 = v98 + 1;
                  if ((unint64_t)(v98 + 1) >> 60)
                    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                  v100 = v151 - (_BYTE *)__p;
                  if ((v151 - (_BYTE *)__p) >> 3 > v99)
                    v99 = v100 >> 3;
                  if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFF0)
                    v101 = 0xFFFFFFFFFFFFFFFLL;
                  else
                    v101 = v99;
                  if (v101)
                  {
                    if (v101 >> 60)
                      std::__throw_bad_array_new_length[abi:ne180100]();
                    v102 = (char *)operator new(16 * v101);
                    v103 = &v102[16 * v98];
                    *(_QWORD *)v103 = 0;
                    *((_QWORD *)v103 + 1) = 0;
                    v104 = v103;
                    if (v95 != v97)
                      goto LABEL_135;
LABEL_141:
                    v15 = v145;
                    v96 = v103 + 16;
                    __p = v104;
                    v150 = v103 + 16;
                    v151 = &v102[16 * v101];
                    if (!v95)
                      goto LABEL_139;
                  }
                  else
                  {
                    v102 = 0;
                    v103 = (char *)(16 * v98);
                    *(_QWORD *)v103 = 0;
                    *((_QWORD *)v103 + 1) = 0;
                    v104 = (char *)(16 * v98);
                    if (v95 == v97)
                      goto LABEL_141;
LABEL_135:
                    v15 = v145;
                    do
                    {
                      *((_OWORD *)v104 - 1) = *((_OWORD *)v95 - 1);
                      v104 -= 16;
                      v95 -= 2;
                    }
                    while (v95 != v97);
                    v95 = __p;
                    v96 = v103 + 16;
                    __p = v104;
                    v150 = v103 + 16;
                    v151 = &v102[16 * v101];
                    if (!v95)
                      goto LABEL_139;
                  }
                  operator delete(v95);
                  goto LABEL_139;
                }
              }
              else
              {
                v73 = 0;
                v74 = (char *)(8 * v69);
                *(_QWORD *)(8 * v69) = -1;
                v52 = 8 * v69 + 8;
                if (v51 != v68)
                  goto LABEL_98;
              }
              break;
            }
            v13 = v144;
            goto LABEL_117;
          }
        }
        if (!*v11)
          goto LABEL_15;
        objc_msgSend(a4, "getInfo:forFilenameBuffer:error:", v148, *v11, 0);
        v39 = (int8x8_t)a5[1];
        if (v39)
        {
          v40 = (uint8x8_t)vcnt_s8(v39);
          v40.i16[0] = vaddlv_u8(v40);
          if (v40.u32[0] > 1uLL)
          {
            v41 = v148[0];
            if (v148[0] >= *(_QWORD *)&v39)
              v41 = v148[0] % *(_QWORD *)&v39;
          }
          else
          {
            v41 = (*(_QWORD *)&v39 - 1) & v148[0];
          }
          v127 = *(_QWORD **)(*a5 + 8 * v41);
          if (v127)
          {
            v128 = (_QWORD *)*v127;
            if (v128)
            {
              if (v40.u32[0] < 2uLL)
              {
                v129 = *(_QWORD *)&v39 - 1;
                while (1)
                {
                  v131 = v128[1];
                  if (v131 == v148[0])
                  {
                    if (v128[2] == v148[0])
                      goto LABEL_198;
                  }
                  else if ((v131 & v129) != v41)
                  {
                    goto LABEL_193;
                  }
                  v128 = (_QWORD *)*v128;
                  if (!v128)
                    goto LABEL_193;
                }
              }
              do
              {
                v130 = v128[1];
                if (v130 == v148[0])
                {
                  if (v128[2] == v148[0])
                  {
LABEL_198:
                    *v11 = v128[3];
                    v132 = *((_WORD *)v11 + 11) & 0xFFF7;
                    v133 = 13;
LABEL_195:
                    *((_WORD *)v11 + 11) = v132;
                    *((_DWORD *)v11 + 2) = v133;
                    goto LABEL_15;
                  }
                }
                else
                {
                  if (v130 >= *(_QWORD *)&v39)
                    v130 %= *(_QWORD *)&v39;
                  if (v130 != v41)
                    break;
                }
                v128 = (_QWORD *)*v128;
              }
              while (v128);
            }
          }
        }
LABEL_193:
        if (v15 <= v13)
        {
          *(_QWORD *)*v11 = v148[0];
          v132 = *((_WORD *)v11 + 11) & 0xFFD7 | 0x20;
          v133 = 8;
          goto LABEL_195;
        }
LABEL_15:
        v11 += 3;
      }
      while (v11 != (_QWORD *)v146);
    }
    a2 = v138;
    v134 = *(_QWORD *)(v138 + 464);
    if (v134 == *(_QWORD *)(v138 + 456))
    {
      if (*(_BYTE *)(v138 + 488))
      {
        v135 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v138 + 480) + 56))(*(_QWORD *)(v138 + 480), v134, *(_QWORD *)(v138 + 472) - v134);
        v136 = *(_QWORD *)(v138 + 456);
        *(_QWORD *)(v138 + 464) = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v138 + 480) + 48))(*(_QWORD *)(v138 + 480), v136, *(_QWORD *)(v138 + 472) - v136)+ v136;
        GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode_associated(v138, v135);
      }
      else
      {
        GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode(v138);
      }
    }
    v9 = *(_QWORD *)(v138 + 464);
    *(_QWORD *)(v138 + 456) = v9;
    v8 += 57;
    ++*v140;
    if (v8 == v140)
      break;
  }
  if (__p)
  {
    v150 = (char *)__p;
    operator delete(__p);
  }
  if (v152)
  {
    v153 = v152;
    operator delete(v152);
  }
  return a1;
}

void sub_23C6B5FF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  uint64_t v25;
  void *v27;
  GPUTools::FD::CoreFunction *v28;
  uint64_t v29;
  uint64_t v30;

  if (__p)
    operator delete(__p);
  v27 = *(void **)(v25 - 112);
  if (v27)
  {
    *(_QWORD *)(v25 - 104) = v27;
    operator delete(v27);
  }
  v28 = (GPUTools::FD::CoreFunction *)(a13 + 130424);
  v29 = -130872;
  do
  {
    GPUTools::FD::CoreFunction::~CoreFunction(v28);
    v28 = (GPUTools::FD::CoreFunction *)(v30 - 456);
    v29 += 456;
  }
  while (v29);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::Playback::TDFSSegment<131072ul>::~TDFSSegment(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  v3 = a1 + 130424;
  do
  {
    GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(v3 + v2));
    v2 -= 456;
  }
  while (v2 != -130872);
  return a1;
}

void GPUTools::Playback::TDFSSegment<131072ul>::~TDFSSegment(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = 0;
  v2 = a1 + 130424;
  do
  {
    GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(v2 + v1));
    v1 -= 456;
  }
  while (v1 != -130872);
  JUMPOUT(0x24262211CLL);
}

uint64_t GPUTools::Playback::TDFSSegment<131072ul>::get_functions(uint64_t a1)
{
  return a1 + 8;
}

uint64_t GPUTools::Playback::TDFSSegment<131072ul>::get_count(uint64_t a1)
{
  return *(_QWORD *)(a1 + 130880);
}

uint64_t GPUTools::Playback::TDFSSegment<131072ul>::get_max_functions()
{
  return 287;
}

uint64_t GPUTools::Playback::TDFSSegment<131072ul>::operator=(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  if (a1 != a2)
  {
    v3 = a2 + 8;
    v4 = (_QWORD *)(a2 + 130880);
    v5 = a1 + 8;
    v6 = 130872;
    do
    {
      GPUTools::FD::CoreFunction::operator=();
      v3 += 456;
      v5 += 456;
      v6 -= 456;
    }
    while (v6);
    *(_QWORD *)(a1 + 130880) = *v4;
  }
  return a1;
}

void GPUTools::Playback::TDFSSegmentFactory<GPUTools::Playback::TDFSSegment<8192ul>>::~TDFSSegmentFactory()
{
  JUMPOUT(0x24262211CLL);
}

_QWORD *GPUTools::Playback::TDFSSegmentFactory<GPUTools::Playback::TDFSSegment<8192ul>>::new_segment(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, _QWORD *a5)
{
  _QWORD *v9;

  v9 = (_QWORD *)operator new();
  GPUTools::Playback::TDFSSegment<8192ul>::TDFSSegment(v9, a2, a3, a4, a5);
  return v9;
}

void sub_23C6B6268(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24262211C](v1, 0x1081C407FB56C95);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::Playback::TDFSSegmentFactory<GPUTools::Playback::TDFSSegment<8192ul>>::get_max_functions()
{
  return 17;
}

_QWORD *GPUTools::Playback::TDFSSegment<8192ul>::TDFSSegment(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, _QWORD *a5)
{
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  int8x8_t v39;
  uint8x8_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  uint64_t v47;
  int8x8_t v48;
  uint8x8_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  _BYTE *v65;
  char *v66;
  unint64_t v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  _BYTE *v73;
  char *v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  _OWORD *v79;
  char *v80;
  uint64_t v81;
  __int128 v82;
  uint64_t v83;
  _OWORD *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  _OWORD *v89;
  char *v90;
  uint64_t v91;
  __int128 v92;
  uint64_t v93;
  char *v94;
  char *v95;
  char *v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unint64_t v100;
  char *v101;
  char *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  char *v110;
  char *v111;
  char *v112;
  uint64_t v113;
  _QWORD *v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  __int128 *v119;
  _OWORD *v120;
  uint64_t v121;
  __int128 v122;
  _QWORD *v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  _QWORD *v127;
  _QWORD *v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  __int16 v132;
  int v133;
  uint64_t v134;
  __int16 v135;
  uint64_t v136;
  _QWORD *v138;
  _QWORD *v139;
  _QWORD *v140;
  _QWORD *v141;
  _QWORD *v142;
  _QWORD *v143;
  _QWORD *v144;
  _QWORD *v145;
  _QWORD *v146;
  _QWORD *v147;
  _QWORD *v148;
  _QWORD *v149;
  _QWORD *v150;
  _QWORD *v151;
  _QWORD *v152;
  _QWORD *v153;
  _QWORD *v154;
  uint64_t v155;
  _QWORD *v157;
  unint64_t v158;
  uint64_t v159;
  unint64_t v161;
  _QWORD v163[4];
  char *v164;
  char *v165;
  char *v166;
  char *v167;
  char *v168;
  char *v169;

  *a1 = &off_250D59188;
  v7 = a1 + 1;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 1));
  v152 = a1 + 58;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 58));
  v151 = a1 + 115;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 115));
  v150 = a1 + 172;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 172));
  v149 = a1 + 229;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 229));
  v148 = a1 + 286;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 286));
  v147 = a1 + 343;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 343));
  v146 = a1 + 400;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 400));
  v145 = a1 + 457;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 457));
  v144 = a1 + 514;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 514));
  v143 = a1 + 571;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 571));
  v142 = a1 + 628;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 628));
  v141 = a1 + 685;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 685));
  v140 = a1 + 742;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 742));
  v139 = a1 + 799;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 799));
  v138 = a1 + 856;
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 856));
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 913));
  v153 = a1;
  v154 = a1 + 970;
  a1[970] = 0;
  v167 = 0;
  v168 = 0;
  v169 = 0;
  v164 = 0;
  v165 = 0;
  v166 = 0;
  v8 = *(_QWORD *)(a2 + 456);
  v9 = v7;
  v155 = a2;
  while (v8 != *(_QWORD *)(a3 + 456))
  {
    if (*(_DWORD *)a2 == -1 || *(_QWORD *)(a2 + 464) == v8)
      GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode(a2);
    GPUTools::FD::CoreFunction::operator=();
    if (*((_WORD *)v9 + 5))
    {
      v11 = v9 + 6;
      v159 = (uint64_t)&v9[3 * *((unsigned __int16 *)v9 + 5) + 6];
      v157 = v9;
      do
      {
        if ((*((_WORD *)v11 + 11) & 8) == 0)
          goto LABEL_13;
        v13 = *((unsigned int *)v11 + 4);
        v14 = *((unsigned __int16 *)v11 + 10);
        v15 = 8 * v14;
        if (8 * v14 > v13)
          goto LABEL_13;
        v16 = v167;
        if (v14 <= (v169 - v167) >> 3)
        {
          v21 = v167;
          goto LABEL_28;
        }
        v17 = v168;
        v18 = (char *)operator new(8 * v14);
        v19 = v17 - v16;
        v20 = &v18[(v17 - v16) & 0xFFFFFFFFFFFFFFF8];
        v21 = v20;
        if (v17 != v16)
        {
          v22 = v17 - 8 - v16;
          if (v22 < 0x58)
          {
            v21 = &v18[(v17 - v16) & 0xFFFFFFFFFFFFFFF8];
            do
            {
LABEL_25:
              v31 = *((_QWORD *)v17 - 1);
              v17 -= 8;
              *((_QWORD *)v21 - 1) = v31;
              v21 -= 8;
            }
            while (v17 != v16);
            goto LABEL_26;
          }
          v21 = &v18[(v17 - v16) & 0xFFFFFFFFFFFFFFF8];
          if ((unint64_t)(v17 - &v18[v19 & 0xFFFFFFFFFFFFFFF8]) < 0x20)
            goto LABEL_25;
          v23 = v19 >> 3;
          v24 = (v22 >> 3) + 1;
          v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
          v26 = &v17[-v25];
          v21 = &v20[-v25];
          v27 = &v18[8 * v23 - 16];
          v28 = v17 - 16;
          v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v30 = *(_OWORD *)v28;
            *((_OWORD *)v27 - 1) = *((_OWORD *)v28 - 1);
            *(_OWORD *)v27 = v30;
            v27 -= 32;
            v28 -= 32;
            v29 -= 4;
          }
          while (v29);
          v17 = v26;
          if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
            goto LABEL_25;
        }
LABEL_26:
        v167 = v21;
        v168 = v20;
        v169 = &v18[8 * v14];
        if (v16)
        {
          operator delete(v16);
          v21 = v167;
        }
LABEL_28:
        v168 = v21;
        v32 = *((unsigned __int16 *)v11 + 10);
        if (8 * v32 > *((unsigned int *)v11 + 4))
          goto LABEL_13;
        v33 = v164;
        if (v32 <= (v166 - v164) >> 4)
        {
          v165 = v164;
          if ((*((_WORD *)v11 + 11) & 1) != 0)
            goto LABEL_41;
          goto LABEL_36;
        }
        v34 = v165;
        v35 = (char *)operator new(16 * v32);
        v36 = &v35[(v34 - v33) & 0xFFFFFFFFFFFFFFF0];
        v37 = v36;
        if (v34 != v33)
        {
          v38 = &v35[(v34 - v33) & 0xFFFFFFFFFFFFFFF0];
          do
          {
            v37 = v38 - 16;
            *((_OWORD *)v38 - 1) = *((_OWORD *)v34 - 1);
            v34 -= 16;
            v38 -= 16;
          }
          while (v34 != v33);
        }
        v164 = v37;
        v165 = v36;
        v166 = &v35[16 * v32];
        if (v33)
        {
          operator delete(v33);
          v37 = v164;
        }
        v165 = v37;
        if ((*((_WORD *)v11 + 11) & 1) != 0)
        {
LABEL_41:
          v42 = GPUTools::FD::Argument::ViewAsCStringArray((GPUTools::FD::Argument *)v11);
          if (!*((_WORD *)v11 + 10))
            goto LABEL_11;
          v43 = v42;
          v44 = 0;
          v45 = 1;
          v158 = v13;
          v161 = v15;
          while (1)
          {
            v47 = *(_QWORD *)v43;
            if ((*(_WORD *)(v43 + 22) & 0x40) != 0)
            {
              if (!*(_BYTE *)(*(unsigned int *)(v47 + 4 * v44) + v47))
                goto LABEL_50;
LABEL_46:
              objc_msgSend(a4, "getInfo:forFilenameBuffer:error:", v163, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152);
              v48 = (int8x8_t)a5[1];
              if (!*(_QWORD *)&v48)
                goto LABEL_70;
              v49 = (uint8x8_t)vcnt_s8(v48);
              v49.i16[0] = vaddlv_u8(v49);
              if (v49.u32[0] > 1uLL)
              {
                v50 = v163[0];
                if (v163[0] >= *(_QWORD *)&v48)
                  v50 = v163[0] % *(_QWORD *)&v48;
              }
              else
              {
                v50 = (*(_QWORD *)&v48 - 1) & v163[0];
              }
              v53 = *(_QWORD **)(*a5 + 8 * v50);
              if (!v53 || (v54 = (_QWORD *)*v53) == 0)
              {
LABEL_70:
                if (v15 <= v13)
                {
                  v45 = 0;
                  goto LABEL_72;
                }
                LODWORD(v46) = *((unsigned __int16 *)v11 + 10);
                goto LABEL_166;
              }
              if (v49.u32[0] < 2uLL)
              {
                v55 = *(_QWORD *)&v48 - 1;
                while (1)
                {
                  v57 = v54[1];
                  if (v57 == v163[0])
                  {
                    if (v54[2] == v163[0])
                      goto LABEL_107;
                  }
                  else if ((v57 & v55) != v50)
                  {
                    goto LABEL_70;
                  }
                  v54 = (_QWORD *)*v54;
                  if (!v54)
                    goto LABEL_70;
                }
              }
              while (1)
              {
                v56 = v54[1];
                if (v56 == v163[0])
                  break;
                if (v56 >= *(_QWORD *)&v48)
                  v56 %= *(_QWORD *)&v48;
                if (v56 != v50)
                  goto LABEL_70;
LABEL_60:
                v54 = (_QWORD *)*v54;
                if (!v54)
                  goto LABEL_70;
              }
              if (v54[2] != v163[0])
                goto LABEL_60;
LABEL_107:
              v84 = v54 + 3;
              v85 = v165;
              if (v165 >= v166)
              {
                v104 = v164;
                v105 = (v165 - v164) >> 4;
                v106 = v105 + 1;
                if ((unint64_t)(v105 + 1) >> 60)
                  std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                v107 = v166 - v164;
                if ((v166 - v164) >> 3 > v106)
                  v106 = v107 >> 3;
                if ((unint64_t)v107 >= 0x7FFFFFFFFFFFFFF0)
                  v108 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v108 = v106;
                if (v108)
                {
                  if (v108 >> 60)
LABEL_210:
                    std::__throw_bad_array_new_length[abi:ne180100]();
                  v109 = (char *)operator new(16 * v108);
                  v110 = &v109[16 * v105];
                  *(_OWORD *)v110 = *v84;
                  v111 = v110;
                  if (v85 != v104)
                  {
LABEL_151:
                    v13 = v158;
                    v15 = v161;
                    do
                    {
                      *((_OWORD *)v111 - 1) = *((_OWORD *)v85 - 1);
                      v111 -= 16;
                      v85 -= 16;
                    }
                    while (v85 != v104);
                    v85 = v164;
                    v112 = v110 + 16;
                    v164 = v111;
                    v165 = v110 + 16;
                    v166 = &v109[16 * v108];
                    if (v85)
LABEL_154:
                      operator delete(v85);
LABEL_155:
                    v165 = v112;
                    if (v15 <= v13)
                      goto LABEL_72;
LABEL_109:
                    ++v44;
                    v46 = *((unsigned __int16 *)v11 + 10);
                    if (v44 >= v46)
                      goto LABEL_160;
                    continue;
                  }
                }
                else
                {
                  v109 = 0;
                  v110 = (char *)(16 * v105);
                  *(_OWORD *)(16 * v105) = *v84;
                  v111 = (char *)(16 * v105);
                  if (v85 != v104)
                    goto LABEL_151;
                }
                v13 = v158;
                v15 = v161;
                v112 = v110 + 16;
                v164 = v111;
                v165 = v110 + 16;
                v166 = &v109[16 * v108];
                if (v85)
                  goto LABEL_154;
                goto LABEL_155;
              }
              *(_OWORD *)v165 = *v84;
              v13 = v158;
              v165 = v85 + 16;
              if (v15 > v158)
                goto LABEL_109;
LABEL_72:
              v58 = v168;
              if (v168 < v169)
              {
                *(_QWORD *)v168 = v163[0];
                v59 = (uint64_t)(v58 + 8);
                goto LABEL_105;
              }
              v60 = v167;
              v61 = (v168 - v167) >> 3;
              v62 = v61 + 1;
              if ((unint64_t)(v61 + 1) >> 61)
                std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
              v63 = v169 - v167;
              if ((v169 - v167) >> 2 > v62)
                v62 = v63 >> 2;
              if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF8)
                v64 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v64 = v62;
              if (!v64)
              {
                v65 = 0;
                v66 = (char *)(8 * v61);
                *(_QWORD *)(8 * v61) = v163[0];
                v59 = 8 * v61 + 8;
                if (v58 == v60)
                  goto LABEL_86;
LABEL_83:
                v67 = v58 - 8 - v60;
                if (v67 >= 0x58)
                {
                  v13 = v158;
                  if ((unint64_t)(v60 - v65) >= 0x20)
                  {
                    v76 = (v67 >> 3) + 1;
                    v77 = 8 * (v76 & 0x3FFFFFFFFFFFFFFCLL);
                    v78 = &v58[-v77];
                    v66 -= v77;
                    v79 = &v65[8 * v61 - 16];
                    v80 = v58 - 16;
                    v81 = v76 & 0x3FFFFFFFFFFFFFFCLL;
                    do
                    {
                      v82 = *(_OWORD *)v80;
                      *(v79 - 1) = *((_OWORD *)v80 - 1);
                      *v79 = v82;
                      v79 -= 2;
                      v80 -= 32;
                      v81 -= 4;
                    }
                    while (v81);
                    v58 = v78;
                    if (v76 == (v76 & 0x3FFFFFFFFFFFFFFCLL))
                      goto LABEL_103;
                  }
                }
                else
                {
                  v13 = v158;
                }
                do
                {
                  v83 = *((_QWORD *)v58 - 1);
                  v58 -= 8;
                  *((_QWORD *)v66 - 1) = v83;
                  v66 -= 8;
                }
                while (v58 != v60);
                goto LABEL_103;
              }
              if (v64 >> 61)
                goto LABEL_210;
              v65 = operator new(8 * v64);
              v66 = &v65[8 * v61];
              *(_QWORD *)v66 = v163[0];
              v59 = (uint64_t)(v66 + 8);
              if (v58 != v60)
                goto LABEL_83;
LABEL_86:
              v13 = v158;
LABEL_103:
              v167 = v66;
              v168 = (char *)v59;
              v169 = &v65[8 * v64];
              if (v60)
                operator delete(v60);
LABEL_105:
              v168 = (char *)v59;
              v15 = v161;
              ++v44;
              v46 = *((unsigned __int16 *)v11 + 10);
              if (v44 >= v46)
              {
LABEL_160:
                if ((v45 & 1) != 0)
                {
                  v9 = v157;
                  if ((_DWORD)v46)
                  {
                    v113 = 0;
                    v114 = (_QWORD *)*v11;
                    do
                    {
                      *v114++ = *(_QWORD *)&v164[v113];
                      v113 += 16;
                    }
                    while (16 * v46 != v113);
                  }
LABEL_11:
                  *((_WORD *)v11 + 11) &= 0xFFB7u;
                  v12 = *((_DWORD *)v11 + 3);
LABEL_12:
                  *((_DWORD *)v11 + 2) = v12;
                  goto LABEL_13;
                }
LABEL_166:
                v9 = v157;
                if ((_DWORD)v46)
                {
LABEL_167:
                  v115 = 0;
                  v116 = *v11;
                  v117 = v167;
                  v118 = v46;
                  if (v46 < 4)
                    goto LABEL_172;
                  if ((unint64_t)(v116 - (_QWORD)v167) < 0x20)
                    goto LABEL_172;
                  v115 = (unsigned __int16)v46 & 0xFFFC;
                  v119 = (__int128 *)(v167 + 16);
                  v120 = (_OWORD *)(v116 + 16);
                  v121 = (unsigned __int16)v118 & 0xFFFC;
                  do
                  {
                    v122 = *v119;
                    *(v120 - 1) = *(v119 - 1);
                    *v120 = v122;
                    v119 += 2;
                    v120 += 2;
                    v121 -= 4;
                  }
                  while (v121);
                  if (v115 != v118)
                  {
LABEL_172:
                    v123 = (_QWORD *)(v116 + 8 * v115);
                    v124 = &v117[8 * v115];
                    v125 = v118 - v115;
                    do
                    {
                      v126 = *(_QWORD *)v124;
                      v124 += 8;
                      *v123++ = v126;
                      --v125;
                    }
                    while (v125);
                  }
                }
LABEL_174:
                *((_WORD *)v11 + 11) = *((_WORD *)v11 + 11) & 0xFF97 | 0x20;
                v12 = 8;
                goto LABEL_12;
              }
            }
            else
            {
              if (**(_BYTE **)(v47 + 8 * v44))
                goto LABEL_46;
LABEL_50:
              if (v15 > v13)
                goto LABEL_121;
              v51 = v168;
              if (v168 >= v169)
              {
                v68 = v167;
                v69 = (v168 - v167) >> 3;
                v70 = v69 + 1;
                if ((unint64_t)(v69 + 1) >> 61)
                  std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                v71 = v169 - v167;
                if ((v169 - v167) >> 2 > v70)
                  v70 = v71 >> 2;
                if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFF8)
                  v72 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v72 = v70;
                if (v72)
                {
                  if (v72 >> 61)
                    std::__throw_bad_array_new_length[abi:ne180100]();
                  v73 = operator new(8 * v72);
                  v74 = &v73[8 * v69];
                  *(_QWORD *)v74 = -1;
                  v52 = (uint64_t)(v74 + 8);
                  if (v51 != v68)
                  {
LABEL_96:
                    v75 = v51 - 8 - v68;
                    if (v75 < 0x58)
                    {
                      v13 = v158;
                      goto LABEL_117;
                    }
                    v13 = v158;
                    if ((unint64_t)(v68 - v73) < 0x20)
                      goto LABEL_218;
                    v86 = (v75 >> 3) + 1;
                    v87 = 8 * (v86 & 0x3FFFFFFFFFFFFFFCLL);
                    v88 = &v51[-v87];
                    v74 -= v87;
                    v89 = &v73[8 * v69 - 16];
                    v90 = v51 - 16;
                    v91 = v86 & 0x3FFFFFFFFFFFFFFCLL;
                    do
                    {
                      v92 = *(_OWORD *)v90;
                      *(v89 - 1) = *((_OWORD *)v90 - 1);
                      *v89 = v92;
                      v89 -= 2;
                      v90 -= 32;
                      v91 -= 4;
                    }
                    while (v91);
                    v51 = v88;
                    if (v86 != (v86 & 0x3FFFFFFFFFFFFFFCLL))
                    {
LABEL_218:
                      do
                      {
LABEL_117:
                        v93 = *((_QWORD *)v51 - 1);
                        v51 -= 8;
                        *((_QWORD *)v74 - 1) = v93;
                        v74 -= 8;
                      }
                      while (v51 != v68);
                    }
LABEL_118:
                    v167 = v74;
                    v168 = (char *)v52;
                    v169 = &v73[8 * v72];
                    if (v68)
                      operator delete(v68);
                    goto LABEL_120;
                  }
                }
                else
                {
                  v73 = 0;
                  v74 = (char *)(8 * v69);
                  *(_QWORD *)(8 * v69) = -1;
                  v52 = 8 * v69 + 8;
                  if (v51 != v68)
                    goto LABEL_96;
                }
                v13 = v158;
                goto LABEL_118;
              }
              *(_QWORD *)v168 = -1;
              v52 = (uint64_t)(v51 + 8);
LABEL_120:
              v168 = (char *)v52;
              v15 = v161;
LABEL_121:
              if ((v45 & 1) != 0)
              {
                v94 = v165;
                if (v165 < v166)
                {
                  v95 = v165 + 16;
                  *(_QWORD *)v165 = 0;
                  *((_QWORD *)v94 + 1) = 0;
                  goto LABEL_137;
                }
                v96 = v164;
                v97 = (v165 - v164) >> 4;
                v98 = v97 + 1;
                if ((unint64_t)(v97 + 1) >> 60)
                  std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
                v99 = v166 - v164;
                if ((v166 - v164) >> 3 > v98)
                  v98 = v99 >> 3;
                if ((unint64_t)v99 >= 0x7FFFFFFFFFFFFFF0)
                  v100 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v100 = v98;
                if (v100)
                {
                  if (v100 >> 60)
                    std::__throw_bad_array_new_length[abi:ne180100]();
                  v101 = (char *)operator new(16 * v100);
                  v102 = &v101[16 * v97];
                  *(_QWORD *)v102 = 0;
                  *((_QWORD *)v102 + 1) = 0;
                  v103 = v102;
                  if (v94 != v96)
                  {
LABEL_133:
                    v13 = v158;
                    do
                    {
                      *((_OWORD *)v103 - 1) = *((_OWORD *)v94 - 1);
                      v103 -= 16;
                      v94 -= 16;
                    }
                    while (v94 != v96);
                    v94 = v164;
                    v95 = v102 + 16;
                    v164 = v103;
                    v165 = v102 + 16;
                    v166 = &v101[16 * v100];
                    if (v94)
LABEL_136:
                      operator delete(v94);
LABEL_137:
                    v165 = v95;
                    v45 = 1;
                    ++v44;
                    v46 = *((unsigned __int16 *)v11 + 10);
                    if (v44 >= v46)
                      goto LABEL_160;
                    continue;
                  }
                }
                else
                {
                  v101 = 0;
                  v102 = (char *)(16 * v97);
                  *(_QWORD *)v102 = 0;
                  *((_QWORD *)v102 + 1) = 0;
                  v103 = (char *)(16 * v97);
                  if (v94 != v96)
                    goto LABEL_133;
                }
                v13 = v158;
                v95 = v102 + 16;
                v164 = v103;
                v165 = v102 + 16;
                v166 = &v101[16 * v100];
                if (v94)
                  goto LABEL_136;
                goto LABEL_137;
              }
              v45 = 0;
              ++v44;
              v46 = *((unsigned __int16 *)v11 + 10);
              if (v44 >= v46)
              {
                v9 = v157;
                if (*((_WORD *)v11 + 10))
                  goto LABEL_167;
                goto LABEL_174;
              }
            }
          }
        }
LABEL_36:
        if (!*v11)
          goto LABEL_13;
        objc_msgSend(a4, "getInfo:forFilenameBuffer:error:", v163, *v11, 0);
        v39 = (int8x8_t)a5[1];
        if (v39)
        {
          v40 = (uint8x8_t)vcnt_s8(v39);
          v40.i16[0] = vaddlv_u8(v40);
          if (v40.u32[0] > 1uLL)
          {
            v41 = v163[0];
            if (v163[0] >= *(_QWORD *)&v39)
              v41 = v163[0] % *(_QWORD *)&v39;
          }
          else
          {
            v41 = (*(_QWORD *)&v39 - 1) & v163[0];
          }
          v127 = *(_QWORD **)(*a5 + 8 * v41);
          if (v127)
          {
            v128 = (_QWORD *)*v127;
            if (v128)
            {
              if (v40.u32[0] < 2uLL)
              {
                v129 = *(_QWORD *)&v39 - 1;
                while (1)
                {
                  v131 = v128[1];
                  if (v131 == v163[0])
                  {
                    if (v128[2] == v163[0])
                      goto LABEL_197;
                  }
                  else if ((v131 & v129) != v41)
                  {
                    goto LABEL_192;
                  }
                  v128 = (_QWORD *)*v128;
                  if (!v128)
                    goto LABEL_192;
                }
              }
              do
              {
                v130 = v128[1];
                if (v130 == v163[0])
                {
                  if (v128[2] == v163[0])
                  {
LABEL_197:
                    *v11 = v128[3];
                    v132 = *((_WORD *)v11 + 11) & 0xFFF7;
                    v133 = 13;
LABEL_194:
                    *((_WORD *)v11 + 11) = v132;
                    *((_DWORD *)v11 + 2) = v133;
                    goto LABEL_13;
                  }
                }
                else
                {
                  if (v130 >= *(_QWORD *)&v39)
                    v130 %= *(_QWORD *)&v39;
                  if (v130 != v41)
                    break;
                }
                v128 = (_QWORD *)*v128;
              }
              while (v128);
            }
          }
        }
LABEL_192:
        if (v15 <= v13)
        {
          *(_QWORD *)*v11 = v163[0];
          v132 = *((_WORD *)v11 + 11) & 0xFFD7 | 0x20;
          v133 = 8;
          goto LABEL_194;
        }
LABEL_13:
        v11 += 3;
      }
      while (v11 != (_QWORD *)v159);
    }
    a2 = v155;
    v134 = *(_QWORD *)(v155 + 464);
    if (v134 == *(_QWORD *)(v155 + 456))
    {
      if (*(_BYTE *)(v155 + 488))
      {
        v135 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v155 + 480) + 56))(*(_QWORD *)(v155 + 480), v134, *(_QWORD *)(v155 + 472) - v134);
        v136 = *(_QWORD *)(v155 + 456);
        *(_QWORD *)(v155 + 464) = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v155 + 480) + 48))(*(_QWORD *)(v155 + 480), v136, *(_QWORD *)(v155 + 472) - v136)+ v136;
        GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode_associated(v155, v135);
      }
      else
      {
        GPUTools::FD::TFunctionStream<GPUTools::FD::CoreFunction,void>::_Iterator<GPUTools::FD::CoreFunction>::_decode(v155);
      }
    }
    v8 = *(_QWORD *)(v155 + 464);
    *(_QWORD *)(v155 + 456) = v8;
    v9 += 57;
    ++*v154;
    if (v9 == v154)
      break;
  }
  if (v164)
  {
    v165 = v164;
    operator delete(v164);
  }
  if (v167)
  {
    v168 = v167;
    operator delete(v167);
  }
  return v153;
}

void sub_23C6B7010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, GPUTools::FD::CoreFunction *a9, GPUTools::FD::CoreFunction *a10, GPUTools::FD::CoreFunction *a11, GPUTools::FD::CoreFunction *a12, GPUTools::FD::CoreFunction *a13, GPUTools::FD::CoreFunction *a14, GPUTools::FD::CoreFunction *a15, GPUTools::FD::CoreFunction *a16, GPUTools::FD::CoreFunction *a17, GPUTools::FD::CoreFunction *a18, GPUTools::FD::CoreFunction *a19, GPUTools::FD::CoreFunction *a20,GPUTools::FD::CoreFunction *a21,GPUTools::FD::CoreFunction *a22,GPUTools::FD::CoreFunction *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  GPUTools::FD::CoreFunction *v30;
  GPUTools::FD::CoreFunction *v31;

  do
  {
    v30 = (GPUTools::FD::CoreFunction *)((char *)v30 - 456);
    GPUTools::FD::CoreFunction::~CoreFunction(v30);
  }
  while (v30 != v31);
  _Unwind_Resume(a1);
}

void GPUTools::Playback::TDFSSegment<8192ul>::~TDFSSegment(uint64_t a1)
{
  GPUTools::Playback::TDFSSegment<8192ul>::~TDFSSegment(a1);
  JUMPOUT(0x24262211CLL);
}

uint64_t GPUTools::Playback::TDFSSegment<8192ul>::get_functions(uint64_t a1)
{
  return a1 + 8;
}

uint64_t GPUTools::Playback::TDFSSegment<8192ul>::get_count(uint64_t a1)
{
  return *(_QWORD *)(a1 + 7760);
}

uint64_t GPUTools::Playback::TDFSSegment<8192ul>::get_max_functions()
{
  return 17;
}

uint64_t GPUTools::Playback::TDFSSegment<8192ul>::operator=(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    GPUTools::FD::CoreFunction::operator=();
    *(_QWORD *)(a1 + 7760) = *(_QWORD *)(a2 + 7760);
  }
  return a1;
}

uint64_t GPUTools::Playback::TDFSSegment<8192ul>::~TDFSSegment(uint64_t a1)
{
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 7304));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 6848));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 6392));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 5936));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 5480));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 5024));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 4568));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 4112));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 3656));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 3200));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 2744));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 2288));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 1832));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 1376));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 920));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 464));
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(a1 + 8));
  return a1;
}

void sub_23C6B83F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 80), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t GetXcodeSelectDeveloperPath()
{
  char *v0;
  void *v2;
  const __CFString *v3;
  void *v4;

  v0 = getenv("DEVELOPER_DIR");
  if (v0)
    return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v0);
  if (GetXcodeSelectDeveloperPath_onceToken != -1)
    dispatch_once(&GetXcodeSelectDeveloperPath_onceToken, &__block_literal_global_80);
  if (GetXcodeSelectDeveloperPath__XCSelectXCodePath)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    if (objc_msgSend(v2, "fileExistsAtPath:", GetXcodeSelectDeveloperPath__XCSelectXCodePath))
      return GetXcodeSelectDeveloperPath__XCSelectXCodePath;
  }
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.dt.Xcode"));
  if (!v4
    || (v3 = (const __CFString *)objc_msgSend((id)objc_msgSend(v4, "bundlePath"), "stringByAppendingPathComponent:", CFSTR("Contents/Developer")), (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", v3) & 1) == 0))
  {
    v3 = CFSTR("/Applications/Xcode.app/Contents/Developer/");
    if (!objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", CFSTR("/Applications/Xcode.app/Contents/Developer/")))return 0;
  }
  return (uint64_t)v3;
}

void sub_23C6BA398(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::__move_assign(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::clear((_QWORD *)a1);
  v4 = *a2;
  *a2 = 0;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;
  if (v5)
    operator delete(v5);
  v8 = a2[2];
  v7 = a2 + 2;
  v6 = v8;
  v9 = *(v7 - 1);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  v10 = v7[1];
  *(_QWORD *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    v11 = *(_QWORD *)(v6 + 8);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v11 %= v12;
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = a1 + 16;
    *v7 = 0;
    v7[1] = 0;
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<void *,unsigned long>,std::__unordered_map_hasher<void *,std::__hash_value_type<void *,unsigned long>,std::hash<void *>,std::equal_to<void *>,true>,std::__unordered_map_equal<void *,std::__hash_value_type<void *,unsigned long>,std::equal_to<void *>,std::hash<void *>,true>,std::allocator<std::__hash_value_type<void *,unsigned long>>>::clear(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void std::vector<std::pair<std::string,BOOL>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0)
      operator delete(*(void **)(i - 32));
  }
  a1[1] = v2;
}

uint64_t std::vector<std::pair<std::string,BOOL>>::__emplace_back_slow_path<std::pair<char const*,BOOL>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = (a1[1] - *a1) >> 5;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59)
    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = a1[2] - v3;
  if (v8 >> 4 > v5)
    v5 = v8 >> 4;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0)
    v9 = 0x7FFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<DYCaptureArchiveCacheEntry>>(v7, v9);
  else
    v10 = 0;
  v13 = v10;
  v14 = &v10[32 * v4];
  v15 = v14;
  v16 = &v10[32 * v9];
  *((_BYTE *)std::string::basic_string[abi:ne180100]<0>(v14, *(char **)a2) + 24) = *(_BYTE *)(a2 + 8);
  v15 += 32;
  std::vector<std::pair<std::string,BOOL>>::__swap_out_circular_buffer(a1, &v13);
  v11 = a1[1];
  std::__split_buffer<std::pair<std::string,BOOL>>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_23C6BA800(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::pair<std::string,BOOL>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::pair<std::string,BOOL>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,BOOL>>,std::reverse_iterator<std::pair<std::string,BOOL>*>,std::reverse_iterator<std::pair<std::string,BOOL>*>,std::reverse_iterator<std::pair<std::string,BOOL>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,BOOL>>,std::reverse_iterator<std::pair<std::string,BOOL>*>,std::reverse_iterator<std::pair<std::string,BOOL>*>,std::reverse_iterator<std::pair<std::string,BOOL>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
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
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    v8 = a7;
    do
    {
      v9 = *(_OWORD *)(a3 - 32);
      *(_QWORD *)(v8 - 16) = *(_QWORD *)(a3 - 16);
      *(_OWORD *)(v8 - 32) = v9;
      *(_QWORD *)(a3 - 24) = 0;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 32) = 0;
      *(_BYTE *)(v8 - 8) = *(_BYTE *)(a3 - 8);
      v8 -= 32;
      v7 -= 32;
      a3 -= 32;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v8;
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,BOOL>>,std::reverse_iterator<std::pair<std::string,BOOL>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,BOOL>>,std::reverse_iterator<std::pair<std::string,BOOL>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,BOOL>>,std::reverse_iterator<std::pair<std::string,BOOL>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,BOOL>>,std::reverse_iterator<std::pair<std::string,BOOL>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 32;
  }
}

uint64_t std::__split_buffer<std::pair<std::string,BOOL>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::pair<std::string,BOOL>>::__destruct_at_end[abi:ne180100](a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::pair<std::string,BOOL>>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 4;
      *(_QWORD *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void std::vector<std::pair<std::string,BOOL>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::pair<std::string,BOOL>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

GPUTools::FD::BaseFunctionStream *GPUTools::FD::BaseFunctionStream::BaseFunctionStream(GPUTools::FD::BaseFunctionStream *this, NSData *a2, _DWORD *a3)
{
  int v5;

  *(_QWORD *)this = a2;
  *((_QWORD *)this + 1) = 0;
  *((_BYTE *)this + 36) = 0;
  v5 = GPUTools::FD::BaseFunctionStream::_scan_state(this);
  *((_DWORD *)this + 8) = v5;
  if ((v5 | 0x100) == 0x500)
  {
    v5 = GPUTools::FD::BaseFunctionStream::_scan_fbuf(this, a3);
    *((_DWORD *)this + 8) = v5;
  }
  if (!*((_QWORD *)this + 1) && !v5)
    __assert_rtn("GPUTools::FD::BaseFunctionStream::BaseFunctionStream(NSData *, const void *)", "", 0, "_decoder || _error_code != 0");
  return this;
}

void sub_23C6BAAFC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  GPUTools::objc_wrapper<NSData *>::~objc_wrapper((id *)v1);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::FD::BaseFunctionStream::_scan_state(GPUTools::FD::BaseFunctionStream *this)
{
  uint64_t result;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *((_QWORD *)this + 2) = objc_msgSend(*(id *)this, "bytes");
  if ((unint64_t)objc_msgSend(*(id *)this, "length") < 0x18)
    return 1024;
  v3 = *((_QWORD *)this + 2);
  if (*(_DWORD *)v3 == 1229539657)
  {
    if (!*((_BYTE *)this + 36))
    {
      if ((*(_DWORD *)(v3 + 16) | 2) == 3)
        goto LABEL_10;
      return 1280;
    }
  }
  else
  {
    if (*(_DWORD *)v3 != 1296911693)
      return 1280;
    *((_BYTE *)this + 36) = 1;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 41;
  v3 = objc_msgSend(*(id *)this, "mutableBytes");
  *((_QWORD *)this + 2) = v3;
  v4 = bswap32(*(_DWORD *)(v3 + 4));
  *(_QWORD *)(v3 + 8) = bswap64(*(_QWORD *)(v3 + 8));
  v5 = bswap32(*(_DWORD *)(v3 + 16));
  *(_DWORD *)(v3 + 16) = v5;
  *(_DWORD *)v3 = 1229539657;
  *(_DWORD *)(v3 + 4) = v4;
  if ((v5 | 2) != 3)
    return 1280;
LABEL_10:
  v6 = *(unsigned int *)(v3 + 4);
  if (objc_msgSend(*(id *)this, "length") != v6 || *(_DWORD *)(v3 + 20))
    return 1280;
  v7 = *((_QWORD *)this + 2);
  v8 = *(unsigned int *)(v3 + 4) + v7;
  *((_QWORD *)this + 2) = v7 + 24;
  *((_QWORD *)this + 3) = v8;
  v9 = operator new();
  GPUTools::FD::StateStreamDecoder::StateStreamDecoder(v9, v3, *((_BYTE *)this + 36));
  result = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v9;
  if (result)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)result + 8))(result);
    return 0;
  }
  return result;
}

void sub_23C6BACD4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24262211C](v1, 0x1081C40A0139527);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::FD::BaseFunctionStream::_scan_fbuf(GPUTools::FD::BaseFunctionStream *this, _DWORD *a2)
{
  _DWORD *v4;
  int v5;
  int v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  *((_QWORD *)this + 2) = objc_msgSend(*(id *)this, "bytes");
  v4 = a2;
  if (a2)
  {
    v5 = *a2;
    v6 = *MEMORY[0x24BE39198];
    if (*a2 == *MEMORY[0x24BE39198])
      goto LABEL_3;
  }
  else
  {
    if ((unint64_t)objc_msgSend(*(id *)this, "length") < 4)
      return 1024;
    v4 = (_DWORD *)*((_QWORD *)this + 2);
    v5 = *v4;
    v6 = *MEMORY[0x24BE39198];
    if (*v4 == *MEMORY[0x24BE39198])
    {
LABEL_3:
      if ((unint64_t)objc_msgSend(*(id *)this, "length") >= 8)
      {
        v7 = *((_BYTE *)v4 + 4) != 0;
        *((_BYTE *)this + 36) = v7;
        v8 = *((unsigned __int8 *)v4 + 5);
        v9 = 8;
        v10 = (unsigned __int8 *)this + 36;
        if (v7)
          goto LABEL_5;
        goto LABEL_15;
      }
      return 1024;
    }
  }
  if (v5 != 1296911693)
  {
    if (v5 != 1229539657)
      return 1280;
    v8 = 0;
    v9 = 4;
    v10 = (unsigned __int8 *)this + 36;
    if (*((_BYTE *)this + 36))
    {
LABEL_5:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        goto LABEL_6;
      return 41;
    }
LABEL_15:
    v13 = *((_QWORD *)this + 2);
    *((_QWORD *)this + 3) = objc_msgSend(*(id *)this, "length") + v13;
    if (a2)
      goto LABEL_17;
    goto LABEL_16;
  }
  v8 = 0;
  *((_BYTE *)this + 36) = 1;
  v10 = (unsigned __int8 *)this + 36;
  v9 = 4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 41;
LABEL_6:
  v11 = objc_msgSend(*(id *)this, "mutableBytes");
  *((_QWORD *)this + 2) = v11;
  if (v5 == v6)
  {
    *((_BYTE *)v4 + 4) = 0;
    *((_QWORD *)this + 3) = objc_msgSend(*(id *)this, "length") + v11;
    if (a2)
      goto LABEL_17;
    goto LABEL_16;
  }
  *v4 = 1229539657;
  *((_QWORD *)this + 3) = objc_msgSend(*(id *)this, "length") + v11;
  if (!a2)
LABEL_16:
    *((_QWORD *)this + 2) += v9;
LABEL_17:
  v14 = operator new();
  MEMORY[0x242621FE4](v14, v8, *v10);
  result = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = v14;
  if (result)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)result + 8))(result);
    return 0;
  }
  return result;
}

void sub_23C6BAF08(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x24262211C](v1, 0x1081C401812F650);
  _Unwind_Resume(a1);
}

id *GPUTools::objc_wrapper<NSData *>::~objc_wrapper(id *a1)
{

  return a1;
}

uint64_t GPUTools::FD::StateStreamDecoder::StateStreamDecoder(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)result = &off_250D592B8;
  *(_QWORD *)(result + 8) = v3;
  *(_DWORD *)(result + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(result + 20) = a3;
  return result;
}

uint64_t GPUTools::FD::StateStreamDecoder::HasFastEncodedSize(GPUTools::FD::StateStreamDecoder *this)
{
  return 0;
}

uint64_t GPUTools::FD::StateStreamDecoder::HasRichSemanticTypes(GPUTools::FD::StateStreamDecoder *this)
{
  return 0;
}

uint64_t GPUTools::FD::StateStreamDecoder::EmitsRichSemanticTypes(GPUTools::FD::StateStreamDecoder *this)
{
  return 0;
}

uint64_t GPUTools::FD::StateStreamDecoder::GetEncodedSize(GPUTools::FD::StateStreamDecoder *this, const void *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE v8[432];
  unsigned int v9;

  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v8);
  GPUTools::FD::StateStreamDecoder::Decode(this, a2, a3, (GPUTools::FD::CoreFunction *)v8);
  v6 = v9;
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v8);
  return v6;
}

void sub_23C6BAFF8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)va);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::FD::StateStreamDecoder::Decode(GPUTools::FD::StateStreamDecoder *this, const void *a2, uint64_t a3, GPUTools::FD::CoreFunction *a4)
{
  GPUTools::FD::CoreFunction *v8;
  _QWORD v11[2];
  const void *v12;
  GPUTools::FD::CoreFunction *v13;

  if (!a2)
    __assert_rtn("virtual BOOL GPUTools::FD::StateStreamDecoder::Decode(const void *, size_t, GPUTools::FD::CoreFunction &) const", "", 0, "encbuf");
  GPUTools::FD::CoreFunction::CoreFunction((GPUTools::FD::CoreFunction *)v11);
  GPUTools::FD::CoreFunction::operator=();
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)v11);
  v11[0] = a2;
  v11[1] = a3;
  v12 = a2;
  v13 = a4;
  GPUTools::FD::StateStreamDecoder::DecodeCore((uint64_t)this, (uint64_t)v11);
  v8 = v13;
  *((_DWORD *)v13 + 108) = (_DWORD)v12 - LODWORD(v11[0]);
  if (*((_WORD *)v8 + 5) && *((_DWORD *)v8 + 15) == 15 && *(_DWORD *)v8 != -8191 && *(_DWORD *)v8 != -8188)
    *((_QWORD *)v8 + 2) = **((_QWORD **)v8 + 6);
  return 1;
}

void sub_23C6BB0F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)va);
  _Unwind_Resume(a1);
}

uint64_t GPUTools::FD::StateStreamDecoder::DecodeFlags(GPUTools::FD::StateStreamDecoder *this, _DWORD *a2, unint64_t a3)
{
  unsigned int v3;
  __int16 v4;

  if (*((_DWORD *)this + 4) == 1)
  {
    if (a3 <= 7)
      __assert_rtn("void GPUTools::FD::StateStreamDecoder::DecodeHeader(DecodeJob &) const", "", 0, "job.capacity >= sizeof(dy_state_hdr_t)");
    v3 = 0;
  }
  else
  {
    if (a3 <= 0xB)
      __assert_rtn("void GPUTools::FD::StateStreamDecoder::DecodeHeader(DecodeJob &) const", "", 0, "job.capacity >= sizeof(dy_state_hdr_ex_t)");
    v3 = a2[1];
  }
  v4 = bswap32(v3);
  if (*((_BYTE *)this + 20))
    LOWORD(v3) = v4;
  return (unsigned __int16)v3;
}

void GPUTools::FD::StateStreamDecoder::DecodeCore(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  int *v5;
  int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;

  v4 = *(_QWORD *)(a2 + 8);
  if (*(_DWORD *)(a1 + 16) == 1)
  {
    if (v4 <= 7)
      __assert_rtn("void GPUTools::FD::StateStreamDecoder::DecodeHeader(DecodeJob &) const", "", 0, "job.capacity >= sizeof(dy_state_hdr_t)");
    v5 = *(int **)(a2 + 16);
    *(_QWORD *)(a2 + 16) = v5 + 2;
    v6 = *v5;
    LODWORD(v5) = v5[1];
    *(_DWORD *)(a2 + 36) = 0;
    *(_DWORD *)(a2 + 40) = (_DWORD)v5;
    *(_DWORD *)(a2 + 32) = v6;
    v7 = *(_DWORD *)(a2 + 32);
    if (*(_BYTE *)(a1 + 20))
    {
LABEL_4:
      v7 = bswap32(v7);
      v8 = bswap32(*(_DWORD *)(a2 + 40));
      v9 = bswap32(*(_DWORD *)(a2 + 36));
      *(_DWORD *)(a2 + 32) = v7;
      *(_DWORD *)(a2 + 36) = v9;
      *(_DWORD *)(a2 + 40) = v8;
      goto LABEL_8;
    }
  }
  else
  {
    if (v4 <= 0xB)
      __assert_rtn("void GPUTools::FD::StateStreamDecoder::DecodeHeader(DecodeJob &) const", "", 0, "job.capacity >= sizeof(dy_state_hdr_ex_t)");
    v10 = *(uint64_t **)(a2 + 16);
    v11 = *((_DWORD *)v10 + 2);
    v12 = *v10;
    *(_QWORD *)(a2 + 32) = *v10;
    *(_DWORD *)(a2 + 40) = v11;
    *(_QWORD *)(a2 + 16) = (char *)v10 + 12;
    v7 = v12;
    if (*(_BYTE *)(a1 + 20))
      goto LABEL_4;
  }
  LOWORD(v9) = *(_WORD *)(a2 + 36);
  v8 = *(_DWORD *)(a2 + 40);
LABEL_8:
  v13 = *(_QWORD *)(a2 + 24);
  *(_DWORD *)v13 = v7;
  *(_DWORD *)(v13 + 4) = (unsigned __int16)v9;
  *(_QWORD *)(v13 + 440) = *(_QWORD *)a2;
  *(_WORD *)(v13 + 10) = v8 + 1;
  v14 = malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  v15 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(v15 + 448) = v14;
  *(_DWORD *)(v15 + 436) = 8;
  *(_QWORD *)(v15 + 48) = v14;
  *(_QWORD *)(v15 + 56) = 0xF00000008;
  *(_QWORD *)(v15 + 64) = 0x100000008;
  *v14 = *(_QWORD *)(a1 + 8);
  GPUTools::FD::StateStreamDecoder::DecodeArguments(a1, a2, v15 + 72);
  if (*(_QWORD *)(a2 + 8) < *(_QWORD *)(a2 + 16) - *(_QWORD *)a2)
    __assert_rtn("void GPUTools::FD::StateStreamDecoder::DecodeCore(DecodeJob &) const", "", 0, "job.capacity >= BUFFER_DELTA(job.encbuf, job.read_ptr)");
  if ((*(_BYTE *)(a2 + 36) & 0x40) != 0)
    *(_DWORD *)(*(_QWORD *)(a2 + 24) + 4) |= 6u;
}

uint64_t GPUTools::FD::StateStreamDecoder::Decode(GPUTools::FD::StateStreamDecoder *this, const void *a2, uint64_t a3, GPUTools::FD::Function *a4)
{
  GPUTools::FD::Function *v8;
  _QWORD v11[2];
  const void *v12;
  GPUTools::FD::Function *v13;

  if (!a2)
    __assert_rtn("virtual BOOL GPUTools::FD::StateStreamDecoder::Decode(const void *, size_t, GPUTools::FD::Function &) const", "", 0, "encbuf");
  GPUTools::FD::Function::Function((GPUTools::FD::Function *)v11);
  GPUTools::FD::Function::operator=();
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)v11);
  v11[0] = a2;
  v11[1] = a3;
  v12 = a2;
  v13 = a4;
  GPUTools::FD::StateStreamDecoder::DecodeCore((uint64_t)this, (uint64_t)v11);
  v8 = v13;
  *((_DWORD *)v13 + 108) = (_DWORD)v12 - LODWORD(v11[0]);
  if (*((_WORD *)v8 + 5) && *((_DWORD *)v8 + 15) == 15 && *(_DWORD *)v8 != -8191 && *(_DWORD *)v8 != -8188)
    *((_QWORD *)v8 + 2) = **((_QWORD **)v8 + 6);
  return 1;
}

void sub_23C6BB43C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  GPUTools::FD::Function::~Function((GPUTools::FD::Function *)va);
  _Unwind_Resume(a1);
}

void GPUTools::FD::StateStreamDecoder::DecodeArguments(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned __int16 v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 *v16;
  __int16 v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unsigned __int16 *v23;
  size_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int16 *v28;
  int v29;
  size_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int8x16_t *v45;
  uint64_t v46;
  int8x16_t v47;
  unsigned int *v48;
  uint64_t v49;
  uint64_t v50;
  int8x16_t *v51;
  uint64_t v52;
  int8x16_t v53;
  unsigned int *v54;
  uint64_t v55;
  int8x16_t *v56;
  uint64_t v57;
  int8x16_t v58;
  unsigned int *v59;
  uint64_t v60;
  int8x16_t *v61;
  uint64_t v62;
  int8x16_t v63;
  unint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  int8x16_t *v67;
  uint64_t v68;
  int8x16_t v69;
  unint64_t *v70;
  uint64_t v71;
  int8x16_t *v72;
  uint64_t v73;
  int8x16_t v74;
  unint64_t *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  __int128 *v83;
  __int128 v84;
  GPUTools::FD::StateStreamDecoder *v85;
  uint64_t v86;
  uint64_t v88;

  v3 = a2;
  v4 = *(unsigned int *)(a2 + 40);
  if ((_DWORD)v4)
  {
    v5 = a3;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)(a2 + 16);
    v88 = v8 + 4 * v4;
    v9 = (unsigned int *)(v88 + 4 * v4);
    v10 = -1;
    v86 = v8;
    while (2)
    {
      v12 = v7;
      v13 = *(_DWORD *)(v8 + 4 * v7);
      v14 = (unsigned __int16)v13;
      v15 = v5 + 24 * v7;
      *(_QWORD *)v15 = v9;
      *(_WORD *)(v15 + 22) = 0;
      v16 = (__int16 *)(v15 + 22);
      if ((v13 & 0x20000) == 0)
      {
        *(_WORD *)(v5 + 24 * v7 + 20) = 1;
        switch((__int16)v13)
        {
          case 5120:
            v17 = 0;
            v18 = 1;
            *(_DWORD *)(v5 + 24 * v12 + 8) = 1;
            v19 = 1;
            goto LABEL_129;
          case 5121:
            v17 = 0;
            v19 = 2;
            *(_DWORD *)(v5 + 24 * v7 + 8) = 2;
            v18 = 1;
            goto LABEL_129;
          case 5122:
            if (*(_BYTE *)(a1 + 20))
              *(_WORD *)v9 = bswap32(*(unsigned __int16 *)v9) >> 16;
            v17 = 0;
            v33 = v5 + 24 * v7;
            v19 = 3;
            goto LABEL_25;
          case 5123:
            if (*(_BYTE *)(a1 + 20))
              *(_WORD *)v9 = bswap32(*(unsigned __int16 *)v9) >> 16;
            v17 = 0;
            v33 = v5 + 24 * v7;
            v19 = 4;
LABEL_25:
            *(_DWORD *)(v33 + 8) = v19;
            v18 = 2;
            goto LABEL_129;
          case 5124:
            if (*(_BYTE *)(a1 + 20))
              *v9 = bswap32(*v9);
            v17 = 0;
            v34 = v5 + 24 * v7;
            v19 = 5;
            goto LABEL_35;
          case 5125:
            if (*(_BYTE *)(a1 + 20))
              *v9 = bswap32(*v9);
            v17 = 0;
            v34 = v5 + 24 * v7;
            v19 = 6;
            goto LABEL_35;
          case 5126:
            if (*(_BYTE *)(a1 + 20))
              *v9 = bswap32(*v9);
            v17 = 0;
            v34 = v5 + 24 * v7;
            v19 = 9;
LABEL_35:
            *(_DWORD *)(v34 + 8) = v19;
            v18 = 4;
            goto LABEL_129;
          case 5127:
          case 5128:
          case 5129:
            goto LABEL_157;
          case 5130:
            if (*(_BYTE *)(a1 + 20))
              *(_QWORD *)v9 = bswap64(*(_QWORD *)v9);
            v17 = 0;
            v35 = v5 + 24 * v7;
            v19 = 10;
LABEL_45:
            *(_DWORD *)(v35 + 8) = v19;
            v18 = 8;
            goto LABEL_129;
          default:
            switch((unsigned __int16)v13)
            {
              case 0xFE00u:
                if (*(_BYTE *)(a1 + 20))
                  *(_QWORD *)v9 = bswap64(*(_QWORD *)v9);
                v17 = 0;
                *(_DWORD *)(v5 + 24 * v7 + 8) = 8;
                v18 = 8;
LABEL_143:
                v78 = v5 + 24 * v12;
                v79 = 13;
LABEL_149:
                *(_DWORD *)(v78 + 12) = v79;
                goto LABEL_130;
              case 0xFE01u:
              case 0xFE03u:
              case 0xFE04u:
              case 0xFE05u:
                *(_DWORD *)(v5 + 24 * v7 + 8) = 13;
                v24 = strlen((const char *)v9);
                v17 = 0;
                v18 = v24 + 1;
                v19 = 13;
                goto LABEL_127;
              case 0xFE02u:
                if (*(_BYTE *)(a1 + 20))
                  *(_QWORD *)v9 = bswap64(*(_QWORD *)v9);
                v17 = 0;
                v35 = v5 + 24 * v7;
                v19 = 12;
                goto LABEL_45;
              default:
                if ((unsigned __int16)v13 != 35670)
                  goto LABEL_157;
                v17 = 0;
                v19 = 2;
                *(_DWORD *)(v5 + 24 * v7 + 8) = 2;
                v18 = 1;
LABEL_145:
                *(_DWORD *)(v5 + 24 * v12 + 12) = 17;
                break;
            }
            goto LABEL_129;
        }
      }
      v20 = *(unsigned int *)(v88 + 4 * v7);
      if (v20 >= 0x10000)
        __assert_rtn("void GPUTools::FD::StateStreamDecoder::DecodeArguments(DecodeJob &, GPUTools::FD::Argument *) const", "", 0, "infoPtr[argi] <= std::numeric_limits<decltype(arguments[argi].length)>::max()");
      LODWORD(v21) = (unsigned __int16)*(_DWORD *)(v88 + 4 * v12);
      v22 = v5 + 24 * v12;
      *(_WORD *)(v22 + 20) = v20;
      v23 = (unsigned __int16 *)(v22 + 20);
      *v16 = 1;
      switch((__int16)v13)
      {
        case 5120:
          v17 = 1;
          *(_DWORD *)(v5 + 24 * v12 + 8) = 1;
          v19 = 1;
          v18 = 1;
          if ((v13 & 0xFFFD) == 0xFE01)
            goto LABEL_127;
          goto LABEL_125;
        case 5121:
LABEL_47:
          v19 = 2;
          *(_DWORD *)(v5 + 24 * v12 + 8) = 2;
          v18 = 1;
          v17 = 1;
          if ((v13 & 0xFFFD) == 0xFE01)
            goto LABEL_127;
          goto LABEL_125;
        case 5122:
          if (*(_BYTE *)(a1 + 20) && (_DWORD)v21)
          {
            v36 = 0;
            do
            {
              *((_WORD *)v9 + v36) = bswap32(*((unsigned __int16 *)v9 + v36)) >> 16;
              ++v36;
              v21 = *v23;
            }
            while (v36 < v21);
          }
          v37 = v5 + 24 * v12;
          v19 = 3;
          goto LABEL_60;
        case 5123:
          if (*(_BYTE *)(a1 + 20) && (_DWORD)v21)
          {
            v38 = 0;
            do
            {
              *((_WORD *)v9 + v38) = bswap32(*((unsigned __int16 *)v9 + v38)) >> 16;
              ++v38;
            }
            while (v38 < *v23);
            LODWORD(v21) = *v23;
          }
          v37 = v5 + 24 * v12;
          v19 = 4;
LABEL_60:
          *(_DWORD *)(v37 + 8) = v19;
          v17 = 1;
          v18 = 2;
          if ((v13 & 0xFFFD) == 0xFE01)
            goto LABEL_127;
          goto LABEL_125;
        case 5124:
          if (!*(_BYTE *)(a1 + 20) || !(_DWORD)v20)
            goto LABEL_91;
          if (v20 < 8)
          {
            v39 = 0;
LABEL_89:
            v48 = &v9[v39];
            v49 = v20 - v39;
            do
            {
              *v48 = bswap32(*v48);
              ++v48;
              --v49;
            }
            while (v49);
            goto LABEL_91;
          }
          v39 = (unsigned __int16)v20 & 0xFFF8;
          v45 = (int8x16_t *)(v9 + 4);
          v46 = v20 & 0xFFFFFFF8;
          do
          {
            v47 = vrev32q_s8(*v45);
            v45[-1] = vrev32q_s8(v45[-1]);
            *v45 = v47;
            v45 += 2;
            v46 -= 8;
          }
          while (v46);
          if (v39 != v20)
            goto LABEL_89;
LABEL_91:
          v50 = v5 + 24 * v12;
          v19 = 5;
          goto LABEL_104;
        case 5125:
          if (!*(_BYTE *)(a1 + 20) || !(_DWORD)v20)
            goto LABEL_97;
          if (v20 < 8)
          {
            v40 = 0;
LABEL_95:
            v54 = &v9[v40];
            v55 = v20 - v40;
            do
            {
              *v54 = bswap32(*v54);
              ++v54;
              --v55;
            }
            while (v55);
            goto LABEL_97;
          }
          v40 = (unsigned __int16)v20 & 0xFFF8;
          v51 = (int8x16_t *)(v9 + 4);
          v52 = v20 & 0xFFFFFFF8;
          do
          {
            v53 = vrev32q_s8(*v51);
            v51[-1] = vrev32q_s8(v51[-1]);
            *v51 = v53;
            v51 += 2;
            v52 -= 8;
          }
          while (v52);
          if (v40 != v20)
            goto LABEL_95;
LABEL_97:
          v50 = v5 + 24 * v12;
          v19 = 6;
          goto LABEL_104;
        case 5126:
          if (!*(_BYTE *)(a1 + 20) || !(_DWORD)v20)
            goto LABEL_103;
          if (v20 < 8)
          {
            v41 = 0;
LABEL_101:
            v59 = &v9[v41];
            v60 = v20 - v41;
            do
            {
              *v59 = bswap32(*v59);
              ++v59;
              --v60;
            }
            while (v60);
            goto LABEL_103;
          }
          v41 = (unsigned __int16)v20 & 0xFFF8;
          v56 = (int8x16_t *)(v9 + 4);
          v57 = v20 & 0xFFFFFFF8;
          do
          {
            v58 = vrev32q_s8(*v56);
            v56[-1] = vrev32q_s8(v56[-1]);
            *v56 = v58;
            v56 += 2;
            v57 -= 8;
          }
          while (v57);
          if (v41 != v20)
            goto LABEL_101;
LABEL_103:
          v50 = v5 + 24 * v12;
          v19 = 9;
LABEL_104:
          *(_DWORD *)(v50 + 8) = v19;
          v17 = 1;
          v18 = 4;
          if ((v13 & 0xFFFD) == 0xFE01)
            goto LABEL_127;
          goto LABEL_125;
        case 5127:
        case 5128:
        case 5129:
LABEL_157:
          v85 = (GPUTools::FD::StateStreamDecoder *)dy_abort();
          GPUTools::FD::StateStreamDecoder::~StateStreamDecoder(v85);
          return;
        case 5130:
          if (!*(_BYTE *)(a1 + 20) || !(_DWORD)v20)
            goto LABEL_111;
          if (v20 < 4)
          {
            v42 = 0;
LABEL_109:
            v64 = (unint64_t *)&v9[2 * v42];
            v65 = v20 - v42;
            do
            {
              *v64 = bswap64(*v64);
              ++v64;
              --v65;
            }
            while (v65);
            goto LABEL_111;
          }
          v42 = (unsigned __int16)v20 & 0xFFFC;
          v61 = (int8x16_t *)(v9 + 4);
          v62 = v20 & 0xFFFFFFFC;
          do
          {
            v63 = vrev64q_s8(*v61);
            v61[-1] = vrev64q_s8(v61[-1]);
            *v61 = v63;
            v61 += 2;
            v62 -= 4;
          }
          while (v62);
          if (v42 != v20)
            goto LABEL_109;
LABEL_111:
          v66 = v5 + 24 * v12;
          v19 = 10;
          goto LABEL_124;
        default:
          switch((unsigned __int16)v13)
          {
            case 0xFE00u:
              if (!*(_BYTE *)(a1 + 20) || !(_DWORD)v20)
                goto LABEL_117;
              if (v20 < 4)
              {
                v43 = 0;
LABEL_115:
                v70 = (unint64_t *)&v9[2 * v43];
                v71 = v20 - v43;
                do
                {
                  *v70 = bswap64(*v70);
                  ++v70;
                  --v71;
                }
                while (v71);
                goto LABEL_117;
              }
              v43 = (unsigned __int16)v20 & 0xFFFC;
              v67 = (int8x16_t *)(v9 + 4);
              v68 = v20 & 0xFFFFFFFC;
              do
              {
                v69 = vrev64q_s8(*v67);
                v67[-1] = vrev64q_s8(v67[-1]);
                *v67 = v69;
                v67 += 2;
                v68 -= 4;
              }
              while (v68);
              if (v43 != v20)
                goto LABEL_115;
LABEL_117:
              v66 = v5 + 24 * v12;
              v19 = 8;
              goto LABEL_124;
            case 0xFE01u:
            case 0xFE03u:
            case 0xFE04u:
            case 0xFE05u:
              *(_DWORD *)(v5 + 24 * v12 + 8) = 13;
              *v16 = 65;
              v25 = v6;
              v26 = v3;
              v27 = v9[v20 - 1];
              v28 = v16;
              v29 = (unsigned __int16)v20;
              v30 = strlen((const char *)v9 + v27);
              v17 = 65;
              LODWORD(v21) = v29;
              v14 = (unsigned __int16)v13;
              v16 = v28;
              v31 = v30 & 0xFFFFFFFFFFFFFFFCLL;
              v19 = 13;
              v32 = v27 + v31;
              v3 = v26;
              v6 = v25;
              v8 = v86;
              v5 = a3;
              v18 = v32 + 4;
              if ((v13 & 0xFFFD) == 0xFE01)
                goto LABEL_127;
              goto LABEL_125;
            case 0xFE02u:
              if (!*(_BYTE *)(a1 + 20) || !(_DWORD)v20)
                goto LABEL_123;
              if (v20 < 4)
              {
                v44 = 0;
LABEL_121:
                v75 = (unint64_t *)&v9[2 * v44];
                v76 = v20 - v44;
                do
                {
                  *v75 = bswap64(*v75);
                  ++v75;
                  --v76;
                }
                while (v76);
                goto LABEL_123;
              }
              v44 = (unsigned __int16)v20 & 0xFFFC;
              v72 = (int8x16_t *)(v9 + 4);
              v73 = v20 & 0xFFFFFFFC;
              do
              {
                v74 = vrev64q_s8(*v72);
                v72[-1] = vrev64q_s8(v72[-1]);
                *v72 = v74;
                v72 += 2;
                v73 -= 4;
              }
              while (v73);
              if (v44 != v20)
                goto LABEL_121;
LABEL_123:
              v66 = v5 + 24 * v12;
              v19 = 12;
LABEL_124:
              *(_DWORD *)(v66 + 8) = v19;
              v17 = 1;
              v18 = 8;
              if ((v13 & 0xFFFD) != 0xFE01)
              {
LABEL_125:
                if ((v14 - 65030) <= 0xFFFFFFFD)
                  v18 *= v21;
              }
LABEL_127:
              if ((unsigned __int16)v13 - 5120 > 0xA || ((1 << v13) & 0x47F) == 0)
              {
                switch((unsigned __int16)v13)
                {
                  case 0xFE00u:
                    goto LABEL_143;
                  case 0xFE01u:
                    *(_DWORD *)(v5 + 24 * v12 + 12) = 0;
                    v17 |= 8u;
                    *v16 = v17;
                    goto LABEL_130;
                  case 0xFE02u:
                    break;
                  case 0xFE03u:
                    v80 = v5 + 24 * v12;
                    v81 = 12;
                    goto LABEL_151;
                  case 0xFE04u:
                    v78 = v5 + 24 * v12;
                    v79 = 14;
                    goto LABEL_149;
                  case 0xFE05u:
                    v80 = v5 + 24 * v12;
                    v81 = 5;
LABEL_151:
                    *(_DWORD *)(v80 + 12) = v81;
                    v17 |= 0x10u;
                    *v16 = v17;
                    goto LABEL_130;
                  default:
                    if ((unsigned __int16)v13 == 35670)
                      goto LABEL_145;
                    goto LABEL_157;
                }
              }
LABEL_129:
              *(_DWORD *)(v5 + 24 * v12 + 12) = v19;
LABEL_130:
              v77 = *(_DWORD *)(v8 + 4 * v12);
              if ((v77 & 0x80000) != 0)
              {
                *(_DWORD *)(v5 + 24 * v12 + 12) = 18;
                if ((v77 & 0x100000) == 0)
                {
LABEL_132:
                  if ((v77 & 0x40000) != 0)
                    v10 = v12;
                  if ((_DWORD)v12 == 2)
                    goto LABEL_140;
                  goto LABEL_3;
                }
              }
              else if ((v77 & 0x100000) == 0)
              {
                goto LABEL_132;
              }
              *(_DWORD *)(v5 + 24 * v12 + 12) = 17;
              if ((v77 & 0x40000) != 0)
                v10 = v12;
              if ((_DWORD)v12 == 2)
              {
LABEL_140:
                if (**(_DWORD **)(v3 + 24) == 540)
                {
                  *(_DWORD *)(v5 + 24 * v12 + 12) = 1;
                  *v16 = v17 | 4;
                }
              }
LABEL_3:
              *(_DWORD *)(v5 + 24 * v12 + 16) = v18;
              v11 = (v18 + 3) & 0xFFFFFFFFFFFFFFFCLL;
              v9 = (unsigned int *)((char *)v9 + v11);
              v6 += 8 + v11;
              v7 = v12 + 1;
              if (*(_DWORD *)(v3 + 40) > (unsigned __int16)(v12 + 1))
                continue;
              if (v10 != 0xFFFF)
              {
                v82 = *(_QWORD *)(v3 + 24);
                --*(_WORD *)(v82 + 10);
                v83 = (__int128 *)(v5 + 24 * v10);
                v84 = *v83;
                *(_QWORD *)(v82 + 40) = *((_QWORD *)v83 + 2);
                *(_OWORD *)(v82 + 24) = v84;
              }
              break;
            default:
              if ((unsigned __int16)v13 == 35670)
                goto LABEL_47;
              goto LABEL_157;
          }
          break;
      }
      break;
    }
  }
  else
  {
    v6 = 0;
  }
  *(_QWORD *)(v3 + 16) += v6;
}

void GPUTools::FD::StateStreamDecoder::~StateStreamDecoder(GPUTools::FD::StateStreamDecoder *this)
{
  GPUTools::FD::IFunctionDecoder::~IFunctionDecoder(this);
  JUMPOUT(0x24262211CLL);
}

void sub_23C6BC520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_23C6BC8A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_23C6BC9B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_23C6BCACC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_23C6BCC90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_23C6BCE5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::__init_with_size[abi:ne180100]<char *,char *>(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = result;
    v4 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v4 = v10;
    v4 = (_QWORD *)((char *)v4 + 1);
  }
  *(_BYTE *)v4 = 0;
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<char const*,OpaqueJSString *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,OpaqueJSString *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,OpaqueJSString *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,OpaqueJSString *>>>::find<char const*>(_QWORD *a1, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint8x8_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *result;
  unint64_t v10;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  v4 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v3 >> 47) ^ v3);
  v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    v7 = v5;
    if (v5 >= *(_QWORD *)&v2)
      v7 = v5 % *(_QWORD *)&v2;
  }
  else
  {
    v7 = v5 & (*(_QWORD *)&v2 - 1);
  }
  v8 = *(_QWORD **)(*a1 + 8 * v7);
  if (!v8)
    return 0;
  result = (_QWORD *)*v8;
  if (*v8)
  {
    do
    {
      v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == *a2)
          return result;
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(_QWORD *)&v2)
            v10 %= *(_QWORD *)&v2;
        }
        else
        {
          v10 &= *(_QWORD *)&v2 - 1;
        }
        if (v10 != v7)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<char const*,OpaqueJSString *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,OpaqueJSString *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,OpaqueJSString *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,OpaqueJSString *>>>::__emplace_unique_key_args<char const*,std::piecewise_construct_t const&,std::tuple<char const* const&>,std::tuple<>>(uint64_t a1, _QWORD *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  _QWORD **v12;
  _QWORD *i;
  unint64_t v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v7 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  v8 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v7 >> 47) ^ v7);
  v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v4 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
      if (v9 >= v10)
        v4 = v9 % v10;
    }
    else
    {
      v4 = v9 & (v10 - 1);
    }
    v12 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v4);
    if (v12)
    {
      for (i = *v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2)
            return i;
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10)
              v14 %= v10;
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v4)
            break;
        }
      }
    }
  }
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v9;
  i[2] = **a4;
  i[3] = 0;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v10 || (float)(v16 * (float)v10) < v15)
  {
    v17 = 1;
    if (v10 >= 3)
      v17 = (v10 & (v10 - 1)) != 0;
    v18 = v17 | (2 * v10);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__rehash<true>(a1, v20);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v4 = v9 % v10;
      else
        v4 = v9;
    }
    else
    {
      v4 = (v10 - 1) & v9;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *i = *v22;
LABEL_38:
    *v22 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v21 + 8 * v4) = a1 + 16;
  if (*i)
  {
    v23 = *(_QWORD *)(*i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v23 >= v10)
        v23 %= v10;
    }
    else
    {
      v23 &= v10 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_23C6BD2B0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<char const*,OpaqueJSValue *>,std::__unordered_map_hasher<char const*,std::__hash_value_type<char const*,OpaqueJSValue *>,std::hash<char const*>,std::equal_to<char const*>,true>,std::__unordered_map_equal<char const*,std::__hash_value_type<char const*,OpaqueJSValue *>,std::equal_to<char const*>,std::hash<char const*>,true>,std::allocator<std::__hash_value_type<char const*,OpaqueJSValue *>>>::__emplace_unique_key_args<char const*,std::piecewise_construct_t const&,std::tuple<char const* const&>,std::tuple<>>(uint64_t a1, _QWORD *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  _QWORD **v12;
  _QWORD *i;
  unint64_t v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v7 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  v8 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v7 >> 47) ^ v7);
  v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v4 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
      if (v9 >= v10)
        v4 = v9 % v10;
    }
    else
    {
      v4 = v9 & (v10 - 1);
    }
    v12 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v4);
    if (v12)
    {
      for (i = *v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2)
            return i;
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10)
              v14 %= v10;
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v4)
            break;
        }
      }
    }
  }
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v9;
  i[2] = **a4;
  i[3] = 0;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v10 || (float)(v16 * (float)v10) < v15)
  {
    v17 = 1;
    if (v10 >= 3)
      v17 = (v10 & (v10 - 1)) != 0;
    v18 = v17 | (2 * v10);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::__hash_value_type<std::string,void *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,void *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,void *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,void *>>>::__rehash<true>(a1, v20);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v4 = v9 % v10;
      else
        v4 = v9;
    }
    else
    {
      v4 = (v10 - 1) & v9;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *i = *v22;
LABEL_38:
    *v22 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v21 + 8 * v4) = a1 + 16;
  if (*i)
  {
    v23 = *(_QWORD *)(*i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v23 >= v10)
        v23 %= v10;
    }
    else
    {
      v23 &= v10 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_23C6BD504(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t DYMachOGetDylibCompatibilityVersion(const char *a1)
{
  int v2;
  int v3;
  off_t v4;
  size_t st_size;
  uint64_t v6;
  _DWORD *v7;
  _DWORD *v8;
  int v10;
  stat v11;
  uint64_t v12;

  v2 = open(a1, 0);
  if (v2 != -1)
  {
    v3 = v2;
    v12 = 0;
    if (read(v2, &v12, 8uLL) == 8)
    {
      if ((_DWORD)v12 == -1095041334)
      {
        if (!HIDWORD(v12))
          goto LABEL_14;
        memset(&v11, 0, 20);
        if (read(v3, &v11, 0x14uLL) != 20)
          goto LABEL_14;
        v4 = bswap32(v11.st_ino);
        st_size = bswap32(HIDWORD(v11.st_ino));
      }
      else
      {
        memset(&v11, 0, sizeof(v11));
        if (stat(a1, &v11) == -1)
          goto LABEL_14;
        v4 = 0;
        st_size = v11.st_size;
      }
      v7 = mmap(0, st_size, 1, 2, v3, v4);
      if (v7 != (_DWORD *)-1)
      {
        if (*v7 == -17958193)
        {
          v8 = v7 + 8;
        }
        else
        {
          if (*v7 != -17958194)
            goto LABEL_21;
          v8 = v7 + 7;
        }
        v10 = v7[4];
        if (v10)
        {
          while (*v8 != 13)
          {
            v8 = (_DWORD *)((char *)v8 + v8[1]);
            if (!--v10)
              goto LABEL_21;
          }
          v6 = v8[5];
          goto LABEL_23;
        }
LABEL_21:
        v6 = 0;
LABEL_23:
        munmap((void *)0xFFFFFFFFFFFFFFFFLL, st_size);
        goto LABEL_15;
      }
    }
LABEL_14:
    v6 = 0;
LABEL_15:
    close(v3);
    return v6;
  }
  return 0;
}

uint64_t DYMobileArchivesDirectory()
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", getpwnam("mobile")->pw_dir, 4), "stringByAppendingPathComponent:", CFSTR("Library/GPUTools"));
}

void GPUTools::Playback::PlaybackEngineDecodeCache::PlaybackEngineDecodeCache(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v3;
  _QWORD *v4;
  id *v5;
  id *v6;

  v1 = (_QWORD *)*a1;
  if (*a1)
  {
    v3 = (_QWORD *)a1[1];
    v4 = (_QWORD *)*a1;
    if (v3 != v1)
    {
      do
      {
        v6 = (id *)*--v3;
        v5 = v6;
        *v3 = 0;
        if (v6)
        {
          GPUTools::Playback::FunctionStreamEntry::~FunctionStreamEntry(v5);
          MEMORY[0x24262211C]();
        }
      }
      while (v3 != v1);
      v4 = (_QWORD *)*a1;
    }
    a1[1] = v1;
    operator delete(v4);
  }
}

void GPUTools::Playback::PlaybackEngineDecodeCache::PlaybackEngineDecodeCache(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 - 8);
  if (v1)
  {
    v2 = 456 * v1;
    v3 = a1 - 456;
    do
    {
      GPUTools::FD::CoreFunction::~CoreFunction((GPUTools::FD::CoreFunction *)(v3 + v2));
      v2 -= 456;
    }
    while (v2);
  }
  JUMPOUT(0x242622104);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x24BDBB868](theArray, range.location, range.length, values);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBA48](url);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBBFE8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D8](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

uint64_t DYAppendInsertLibrary()
{
  return MEMORY[0x24BE39060]();
}

uint64_t DYCheckGLDispatchTableSize()
{
  return MEMORY[0x24BE39068]();
}

uint64_t DYDisableBufferSwaps()
{
  return MEMORY[0x24BE39078]();
}

uint64_t DYFSCreateTempFileURL()
{
  return MEMORY[0x24BE39088]();
}

uint64_t DYFSDirectoryExists()
{
  return MEMORY[0x24BE39090]();
}

uint64_t DYGetAllPerFunctionProfilingData()
{
  return MEMORY[0x24BE39098]();
}

uint64_t DYGetProfilingData()
{
  return MEMORY[0x24BE390C8]();
}

uint64_t DYLog()
{
  return MEMORY[0x24BE390D8]();
}

uint64_t DYModifyEnvironmentForDualCaptureSupport()
{
  return MEMORY[0x24BE390E0]();
}

uint64_t DYResetGraphicsTiming()
{
  return MEMORY[0x24BE390E8]();
}

uint64_t DYSetGTMTLCaptureMode()
{
  return MEMORY[0x24BE390F8]();
}

uint64_t DYTimingBenchmark()
{
  return MEMORY[0x24BE39100]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

JSObjectRef JSContextGetGlobalObject(JSContextRef ctx)
{
  return (JSObjectRef)MEMORY[0x24BDDA548](ctx);
}

JSValueRef JSObjectCallAsFunction(JSContextRef ctx, JSObjectRef object, JSObjectRef thisObject, size_t argumentCount, const JSValueRef arguments[], JSValueRef *exception)
{
  return (JSValueRef)MEMORY[0x24BDDA580](ctx, object, thisObject, argumentCount, arguments, exception);
}

JSValueRef JSObjectGetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef *exception)
{
  return (JSValueRef)MEMORY[0x24BDDA5A8](ctx, object, propertyName, exception);
}

JSObjectRef JSObjectMakeArray(JSContextRef ctx, size_t argumentCount, const JSValueRef arguments[], JSValueRef *exception)
{
  return (JSObjectRef)MEMORY[0x24BDDA5C0](ctx, argumentCount, arguments, exception);
}

void JSObjectSetProperty(JSContextRef ctx, JSObjectRef object, JSStringRef propertyName, JSValueRef value, JSPropertyAttributes attributes, JSValueRef *exception)
{
  MEMORY[0x24BDDA5D0](ctx, object, propertyName, value, *(_QWORD *)&attributes, exception);
}

void JSObjectSetPropertyAtIndex(JSContextRef ctx, JSObjectRef object, unsigned int propertyIndex, JSValueRef value, JSValueRef *exception)
{
  MEMORY[0x24BDDA5D8](ctx, object, *(_QWORD *)&propertyIndex, value, exception);
}

JSStringRef JSStringCreateWithUTF8CString(const char *string)
{
  return (JSStringRef)MEMORY[0x24BDDA648](string);
}

size_t JSStringGetLength(JSStringRef string)
{
  return MEMORY[0x24BDDA658](string);
}

size_t JSStringGetUTF8CString(JSStringRef string, char *buffer, size_t bufferSize)
{
  return MEMORY[0x24BDDA660](string, buffer, bufferSize);
}

void JSStringRelease(JSStringRef string)
{
  MEMORY[0x24BDDA670](string);
}

JSStringRef JSStringRetain(JSStringRef string)
{
  return (JSStringRef)MEMORY[0x24BDDA678](string);
}

JSStringRef JSValueCreateJSONString(JSContextRef ctx, JSValueRef value, unsigned int indent, JSValueRef *exception)
{
  return (JSStringRef)MEMORY[0x24BDDA680](ctx, value, *(_QWORD *)&indent, exception);
}

JSValueRef JSValueMakeFromJSONString(JSContextRef ctx, JSStringRef string)
{
  return (JSValueRef)MEMORY[0x24BDDA6D0](ctx, string);
}

JSValueRef JSValueMakeNumber(JSContextRef ctx, double number)
{
  return (JSValueRef)MEMORY[0x24BDDA6E0](ctx, number);
}

double JSValueToNumber(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  double result;

  MEMORY[0x24BDDA700](ctx, value, exception);
  return result;
}

JSObjectRef JSValueToObject(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return (JSObjectRef)MEMORY[0x24BDDA708](ctx, value, exception);
}

JSStringRef JSValueToStringCopy(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return (JSStringRef)MEMORY[0x24BDDA710](ctx, value, exception);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x24BDD1018](table, key);
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x24BDD1028](table, key, value);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _DYOCondLog()
{
  return MEMORY[0x24BE39150]();
}

uint64_t _DYOLog()
{
  return MEMORY[0x24BE39158]();
}

uint64_t _LSGetVersionFromString()
{
  return MEMORY[0x24BDC1608]();
}

uint64_t _LSVersionNumberCompare()
{
  return MEMORY[0x24BDC1628]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t GPUTools::DYLockUtils::Lock(GPUTools::DYLockUtils *this, volatile int *a2)
{
  return MEMORY[0x24BE39168](this, a2);
}

uint64_t GPUTools::DYLockUtils::Unlock(GPUTools::DYLockUtils *this, volatile int *a2)
{
  return MEMORY[0x24BE39170](this, a2);
}

uint64_t GPUTools::FB::Decoder::Decoder()
{
  return MEMORY[0x24BE391C0]();
}

uint64_t GPUTools::FD::CoreFunction::CoreFunction(GPUTools::FD::CoreFunction *this)
{
  return MEMORY[0x24BE391C8](this);
}

void GPUTools::FD::CoreFunction::~CoreFunction(GPUTools::FD::CoreFunction *this)
{
  MEMORY[0x24BE391D0](this);
}

uint64_t GPUTools::FD::CoreFunction::operator=()
{
  return MEMORY[0x24BE391D8]();
}

void GPUTools::FD::IFunctionDecoder::~IFunctionDecoder(GPUTools::FD::IFunctionDecoder *this)
{
  MEMORY[0x24BE391E0](this);
}

uint64_t GPUTools::FD::Function::Function(GPUTools::FD::Function *this)
{
  return MEMORY[0x24BE391F8](this);
}

void GPUTools::FD::Function::~Function(GPUTools::FD::Function *this)
{
  MEMORY[0x24BE39200](this);
}

uint64_t GPUTools::FD::Function::operator=()
{
  return MEMORY[0x24BE39208]();
}

uint64_t GPUTools::VMBuffer::VMBuffer(GPUTools::VMBuffer *this)
{
  return MEMORY[0x24BE39210](this);
}

void GPUTools::VMBuffer::~VMBuffer(GPUTools::VMBuffer *this)
{
  MEMORY[0x24BE39218](this);
}

uint64_t GPUTools::FD::Argument::ViewAsCStringArray(GPUTools::FD::Argument *this)
{
  return MEMORY[0x24BE39230](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x24BEDB038](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
  MEMORY[0x24BEDB040](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x24BEDB198]();
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x24BEDB1B0](*(_QWORD *)&__ev, __what_arg);
}

void std::thread::detach(std::thread *this)
{
  MEMORY[0x24BEDB470](this);
}

void std::thread::~thread(std::thread *this)
{
  MEMORY[0x24BEDB478](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_250D57FD0();
}

void operator delete(void *__p)
{
  off_250D57FD8(__p);
}

uint64_t operator delete()
{
  return off_250D57FE0();
}

uint64_t operator new[]()
{
  return off_250D57FE8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250D57FF0(__sz);
}

uint64_t operator new()
{
  return off_250D57FF8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __udivti3()
{
  return MEMORY[0x24BDAC940]();
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAD030](*(_QWORD *)&a1, a2, a3);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x24BEDCE40](cls, name, imp, types);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x24BEDCED0](cls);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB978](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB980](*(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB988](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x24BEDF1C0](crc, buf, *(_QWORD *)&len);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF1C8](strm, *(_QWORD *)&flush);
}

uLong deflateBound(z_streamp strm, uLong sourceLen)
{
  return MEMORY[0x24BEDF1D0](strm, sourceLen);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF1D8](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF1E8](strm, *(_QWORD *)&level, version, *(_QWORD *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x24BDADFD8](source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

BOOL dlopen_preflight(const char *__path)
{
  return MEMORY[0x24BDAE080](__path);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t dy_abort()
{
  return MEMORY[0x24BE39240]();
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAE2C8](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x24BDAE650](a1, a2);
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x24BDAE658](a1, a2);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
}

int gzclose(gzFile file)
{
  return MEMORY[0x24BEDF200](file);
}

int gzeof(gzFile file)
{
  return MEMORY[0x24BEDF218](file);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return (const char *)MEMORY[0x24BEDF220](file, errnum);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return (gzFile)MEMORY[0x24BEDF240](a1, a2);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x24BEDF248](file, buf, *(_QWORD *)&len);
}

kern_return_t host_page_size(host_t a1, vm_size_t *a2)
{
  return MEMORY[0x24BDAE800](*(_QWORD *)&a1, a2);
}

kern_return_t host_statistics(host_t host_priv, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x24BDAE820](*(_QWORD *)&host_priv, *(_QWORD *)&flavor, host_info_out, host_info_outCnt);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF278](strm, version, *(_QWORD *)&stream_size);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x24BDAE978](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int listen(int a1, int a2)
{
  return MEMORY[0x24BDAEA78](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x24BDAEB68]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x24BDAEC70](*(_QWORD *)&target, address, size, *(_QWORD *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x24BDAEC78](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_purgable_control(vm_map_t target_task, mach_vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x24BDAECA0](*(_QWORD *)&target_task, address, *(_QWORD *)&control, state);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
  MEMORY[0x24BDAEEB8](__b, __pattern4, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x24BEDD468](a1);
}

Ivar object_getInstanceVariable(id obj, const char *name, void **outValue)
{
  return (Ivar)MEMORY[0x24BEDD478](obj, name, outValue);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x24BDAFA20](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDAFA98](a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x24BDAFD10](__name, __value, *(_QWORD *)&__overwrite);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x24BDB0160](*(_QWORD *)&target_tport, *(_QWORD *)&pid, t);
}

kern_return_t task_resume(task_read_t target_task)
{
  return MEMORY[0x24BDB01A0](*(_QWORD *)&target_task);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

