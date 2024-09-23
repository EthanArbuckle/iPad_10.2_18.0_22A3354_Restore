void sub_20ADAD9A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32)
{

  _Unwind_Resume(a1);
}

void sub_20ADADAB0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

uint64_t std::vector<AlgosScoreStreamFrameRow>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<AlgosScoreStreamFrameRow>,std::reverse_iterator<AlgosScoreStreamFrameRow*>,std::reverse_iterator<AlgosScoreStreamFrameRow*>,std::reverse_iterator<AlgosScoreStreamFrameRow*>>((uint64_t)(a1 + 2), a1[1], (const AlgosScoreStreamFrameRow *)a1[1], *a1, (const AlgosScoreStreamFrameRow *)*a1, a2[1], a2[1]);
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

void **std::__split_buffer<AlgosScoreStreamFrameRow>::~__split_buffer(void **a1)
{
  std::__split_buffer<AlgosScoreStreamFrameRow>::clear[abi:ne180100]((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow(AlgosScoreStreamFrameRow *this, const AlgosScoreStreamFrameRow *a2)
{
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 5) = (char *)this + 48;
  *((_QWORD *)this + 7) = 0;
  AlgosScoreStreamFrameRow::operator=((uint64_t)this, (uint64_t)a2);
}

void sub_20ADADBE4(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD **v2;
  _QWORD **v3;

  v3 = v2;
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v1, *v3);
  _Unwind_Resume(a1);
}

uint64_t AlgosScoreStreamFrameRow::operator=(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  if (a1 != a2)
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,std::string>,std::__tree_node<std::__value_type<std::string,std::string>,void *> *,long>>((uint64_t **)(a1 + 40), *(__int128 **)(a2 + 40), (__int128 *)(a2 + 48));
  return a1;
}

uint64_t AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow(uint64_t a1, int a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 40) = a1 + 48;
  *(_QWORD *)(a1 + 56) = 0;
  *(_DWORD *)a1 = a2;
  *(double *)(a1 + 8) = a4;
  *(double *)(a1 + 16) = a5;
  *(double *)(a1 + 24) = a6;
  *(double *)(a1 + 32) = a7;
  if (a1 + 40 != a3)
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,std::string>,std::__tree_node<std::__value_type<std::string,std::string>,void *> *,long>>((uint64_t **)(a1 + 40), *(__int128 **)a3, (__int128 *)(a3 + 8));
  return a1;
}

void sub_20ADADCB0(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD **v2;

  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v1, *v2);
  _Unwind_Resume(a1);
}

uint64_t **std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<std::string,std::string>,std::__tree_node<std::__value_type<std::string,std::string>,void *> *,long>>(uint64_t **result, __int128 *a2, __int128 *a3)
{
  uint64_t **v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  __int128 *v9;
  uint64_t **leaf_high;
  __int128 *v11;
  BOOL v12;
  __int128 *v13;
  __int128 *v14;
  uint64_t **v15;
  uint64_t *v16;
  const void **v17;
  uint64_t v18;

  v5 = result;
  if (result[2])
  {
    v6 = *result;
    v7 = result[1];
    *result = (uint64_t *)(result + 1);
    v7[2] = 0;
    result[1] = 0;
    result[2] = 0;
    if (v6[1])
      v8 = (uint64_t *)v6[1];
    else
      v8 = v6;
    v15 = result;
    v16 = v8;
    v17 = (const void **)v8;
    if (v8)
    {
      v16 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::_DetachedTreeCache::__detach_next((uint64_t)v8);
      if (a2 != a3)
      {
        v9 = a2;
        do
        {
          std::string::operator=((std::string *)(v8 + 4), (const std::string *)(v9 + 2));
          std::string::operator=((std::string *)(v8 + 7), (const std::string *)((char *)v9 + 56));
          leaf_high = (uint64_t **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_leaf_high((uint64_t)v5, &v18, v17 + 4);
          std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__insert_node_at(v5, v18, leaf_high, (uint64_t *)v17);
          v17 = (const void **)v16;
          if (v16)
            v16 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::_DetachedTreeCache::__detach_next((uint64_t)v16);
          v11 = (__int128 *)*((_QWORD *)v9 + 1);
          if (v11)
          {
            do
            {
              a2 = v11;
              v11 = *(__int128 **)v11;
            }
            while (v11);
          }
          else
          {
            do
            {
              a2 = (__int128 *)*((_QWORD *)v9 + 2);
              v12 = *(_QWORD *)a2 == (_QWORD)v9;
              v9 = a2;
            }
            while (!v12);
          }
          v8 = (uint64_t *)v17;
          if (v17)
            v12 = a2 == a3;
          else
            v12 = 1;
          v9 = a2;
        }
        while (!v12);
      }
    }
    result = (uint64_t **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&v15);
  }
  if (a2 != a3)
  {
    do
    {
      result = (uint64_t **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_multi<std::pair<std::string const,std::string> const&>(v5, a2 + 2);
      v13 = (__int128 *)*((_QWORD *)a2 + 1);
      if (v13)
      {
        do
        {
          v14 = v13;
          v13 = *(__int128 **)v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v14 = (__int128 *)*((_QWORD *)a2 + 2);
          v12 = *(_QWORD *)v14 == (_QWORD)a2;
          a2 = v14;
        }
        while (!v12);
      }
      a2 = v14;
    }
    while (v14 != a3);
  }
  return result;
}

void sub_20ADADE40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_20ADADEF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20ADADFD8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_20ADAE8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41)
{
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  if (__p)
    operator delete(__p);
  if (a37)
    operator delete(a37);
  if (a40)
    operator delete(a40);

  _Unwind_Resume(a1);
}

uint64_t std::vector<AlgosScoreConnectionFrameRow>::__push_back_slow_path<AlgosScoreConnectionFrameRow>(uint64_t a1, const AlgosScoreConnectionFrameRow *a2)
{
  const AlgosScoreConnectionFrameRow *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  void *__p;
  AlgosScoreConnectionFrameRow *v14;
  AlgosScoreConnectionFrameRow *v15;
  char *v16;
  uint64_t v17;

  v3 = *(const AlgosScoreConnectionFrameRow **)a1;
  v4 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 6;
  v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 58)
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  v7 = a1 + 16;
  v8 = *(_QWORD *)(a1 + 16) - (_QWORD)v3;
  if (v8 >> 5 > v5)
    v5 = v8 >> 5;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFC0)
    v9 = 0x3FFFFFFFFFFFFFFLL;
  else
    v9 = v5;
  v17 = a1 + 16;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AlgosScoreConnectionFrameRow>>(v7, v9);
  else
    v10 = 0;
  __p = v10;
  v14 = (AlgosScoreConnectionFrameRow *)&v10[64 * v4];
  v16 = &v10[64 * v9];
  AlgosScoreConnectionFrameRow::AlgosScoreConnectionFrameRow(v14, a2);
  v15 = (AlgosScoreConnectionFrameRow *)((char *)v14 + 64);
  std::vector<AlgosScoreConnectionFrameRow>::__swap_out_circular_buffer((const AlgosScoreConnectionFrameRow **)a1, &__p);
  v11 = *(_QWORD *)(a1 + 8);
  if (v15 != v14)
    v15 = (AlgosScoreConnectionFrameRow *)((char *)v15 + ((v14 - v15 + 63) & 0xFFFFFFFFFFFFFFC0));
  if (__p)
    operator delete(__p);
  return v11;
}

void sub_20ADAEAC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<AlgosScoreConnectionFrameRow>::__swap_out_circular_buffer(const AlgosScoreConnectionFrameRow **a1, _QWORD *a2)
{
  const AlgosScoreConnectionFrameRow *v4;
  const AlgosScoreConnectionFrameRow *v5;
  const AlgosScoreConnectionFrameRow *v6;
  const AlgosScoreConnectionFrameRow *v7;
  const AlgosScoreConnectionFrameRow *v8;
  const AlgosScoreConnectionFrameRow *v9;

  v5 = *a1;
  v4 = a1[1];
  v6 = (const AlgosScoreConnectionFrameRow *)a2[1];
  while (v4 != v5)
  {
    v4 = (const AlgosScoreConnectionFrameRow *)((char *)v4 - 64);
    AlgosScoreConnectionFrameRow::AlgosScoreConnectionFrameRow((const AlgosScoreConnectionFrameRow *)((char *)v6 - 64), v4);
  }
  a2[1] = v6;
  v7 = *a1;
  *a1 = v6;
  a2[1] = v7;
  v8 = a1[1];
  a1[1] = (const AlgosScoreConnectionFrameRow *)a2[2];
  a2[2] = v8;
  v9 = a1[2];
  a1[2] = (const AlgosScoreConnectionFrameRow *)a2[3];
  a2[3] = v9;
  *a2 = a2[1];
}

void std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24C3CAE38, MEMORY[0x24BEDAAF0]);
}

void sub_20ADAEBD4(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<AlgosScoreConnectionFrameRow>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(a2 << 6);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

uint64_t AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(uint64_t a1, const std::string *a2, char a3, int a4, double a5, double a6, double a7, double a8, double a9)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  std::string::operator=((std::string *)a1, a2);
  *(double *)(a1 + 24) = a5;
  *(double *)(a1 + 32) = a6;
  *(double *)(a1 + 40) = a7;
  *(double *)(a1 + 48) = a8;
  *(double *)(a1 + 56) = a9;
  *(_BYTE *)(a1 + 64) = a3;
  *(_DWORD *)(a1 + 68) = a4;
  return a1;
}

void sub_20ADAED18(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  std::string::operator=((std::string *)a1, (const std::string *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
  return a1;
}

void sub_20ADAED90(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t AlgosScoreStreamCSVFrameRow::operator=(uint64_t a1, uint64_t a2)
{
  std::string::operator=((std::string *)a1, (const std::string *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a2 + 68);
  return a1;
}

_QWORD *AlgosScoreStreamCSVFrameRow::GetDescription@<X0>(AlgosScoreStreamCSVFrameRow *this@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  const char *v4;
  char __str[256];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (const char *)this;
  if (*((char *)this + 23) < 0)
    v3 = *(const char **)this;
  v4 = "Yes";
  if (!*((_BYTE *)this + 64))
    v4 = "No ";
  snprintf(__str, 0x100uLL, "%s: %1.2f: duration: %1.2f, deltaT: %1.2f, weight: %1.2f, quality: %1.2f, wifi: %s, failed: %d", v3, *((double *)this + 5), *((double *)this + 4), *((double *)this + 3), *((double *)this + 6), *((double *)this + 7), v4, *((_DWORD *)this + 17));
  return std::string::basic_string[abi:ne180100]<0>(a2, __str);
}

_QWORD *AlgosScoreStreamCSVFrameRow::GetHeaderDescription@<X0>(_QWORD *a1@<X8>)
{
  char __str[256];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x100uLL, "     %-10s %-10s %-10s %-10s %-7s %-7s %-10s %-10s", "deltaT", "event", "duration", "quality", "wifi", "failed", "rel_time", "weight");
  return std::string::basic_string[abi:ne180100]<0>(a1, __str);
}

_QWORD *AlgosScoreStreamCSVFrameRow::GetRawDescription@<X0>(AlgosScoreStreamCSVFrameRow *this@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  const char *v4;
  const char *v5;
  char __str[256];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (const char *)this;
  if (*((char *)this + 23) < 0)
    v3 = *(const char **)this;
  v4 = "True";
  if (*((_BYTE *)this + 64))
    v5 = "True";
  else
    v5 = "False";
  if (!*((_DWORD *)this + 17))
    v4 = "False";
  snprintf(__str, 0x100uLL, "%-10.3f %-10s %-10.3f %-10.3f %-7s %-7s %-10.3f %-10.3f", *((double *)this + 3), v3, *((double *)this + 4), *((double *)this + 7), v5, v4, *((double *)this + 5), *((double *)this + 6));
  return std::string::basic_string[abi:ne180100]<0>(a2, __str);
}

void AlgosScoreStreamCSVFrame::DebugPrint(AlgosScoreStreamCSVFrame *this, int a2)
{
  void **v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void **v8;
  BOOL v9;
  void *v10[2];
  char v11;
  void *__p[2];
  char v13;

  AlgosScoreStreamCSVFrameRow::GetHeaderDescription(__p);
  if (v13 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  puts((const char *)v4);
  if (v13 < 0)
    operator delete(__p[0]);
  v5 = *(_QWORD *)this;
  v6 = *((_QWORD *)this + 1);
  if (*(_QWORD *)this != v6)
  {
    v7 = 0;
    do
    {
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((uint64_t)__p, v5);
      if (a2 >= 1)
      {
        AlgosScoreStreamCSVFrameRow::GetRawDescription((AlgosScoreStreamCSVFrameRow *)__p, v10);
        if (v11 >= 0)
          v8 = v10;
        else
          v8 = (void **)v10[0];
        printf("%3d: %s\n", v7, (const char *)v8);
        if (v11 < 0)
          operator delete(v10[0]);
        ++v7;
      }
      if (v13 < 0)
        operator delete(__p[0]);
      v9 = __OFSUB__(a2--, 1);
      if (a2 < 0 != v9)
        break;
      v5 += 72;
    }
    while (v5 != v6);
  }
}

void sub_20ADAF140(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
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

void sub_20ADAF2B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_20ADAF454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21)
{
  void *v21;
  void *v22;

  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(&a21);
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);

  _Unwind_Resume(a1);
}

void **std::vector<AlgosScoreCombinerFrameRow>::push_back[abi:ne180100](uint64_t *a1, AlgosScoreCombinerFrameRow *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void **result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  void *v15;
  AlgosScoreCombinerFrameRow *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - *a1) >> 6;
    if ((unint64_t)(v10 + 1) >> 58)
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    v11 = v5 - *a1;
    v12 = v11 >> 5;
    if (v11 >> 5 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFC0)
      v13 = 0x3FFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v19 = v4;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AlgosScoreConnectionFrameRow>>(v4, v13);
    else
      v14 = 0;
    v15 = v14;
    v16 = (AlgosScoreCombinerFrameRow *)&v14[64 * v10];
    v18 = &v14[64 * v13];
    AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow(v16, a2);
    v17 = (char *)v16 + 64;
    std::vector<AlgosScoreCombinerFrameRow>::__swap_out_circular_buffer(a1, &v15);
    v9 = a1[1];
    result = std::__split_buffer<AlgosScoreCombinerFrameRow>::~__split_buffer(&v15);
  }
  else
  {
    result = (void **)AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow(*(AlgosScoreCombinerFrameRow **)(v4 - 8), a2);
    v9 = v7 + 64;
    a1[1] = v7 + 64;
  }
  a1[1] = v9;
  return result;
}

void sub_20ADAF598(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

void AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(void **this)
{
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

void sub_20ADAF75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow((void **)va);
  _Unwind_Resume(a1);
}

void sub_20ADAFC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, char a11)
{
  void *v11;
  void *v12;

  a10 = (void **)&a11;
  std::vector<AlgosScoreCombinerFrameRow>::__destroy_vector::operator()[abi:ne180100](&a10);

  _Unwind_Resume(a1);
}

double amean(const AlgosScoreCombinerFrameRow **a1)
{
  const AlgosScoreCombinerFrameRow *v1;
  const AlgosScoreCombinerFrameRow *v2;
  double v3;
  double v4;
  double v5;
  void *v7;
  char v8;
  void *__p;
  char v10;
  double v11;

  v1 = *a1;
  v2 = a1[1];
  if (*a1 == v2)
    return 0.0;
  v3 = (double)(unint64_t)((v2 - v1) >> 6);
  v4 = 0.0;
  do
  {
    AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v7, v1);
    v5 = v11;
    if (v10 < 0)
      operator delete(__p);
    if (v8 < 0)
      operator delete(v7);
    v4 = v4 + v5 / v3;
    v1 = (const AlgosScoreCombinerFrameRow *)((char *)v1 + 64);
  }
  while (v1 != v2);
  return v4;
}

double stddev(const AlgosScoreCombinerFrameRow **a1)
{
  double v3;
  const AlgosScoreCombinerFrameRow *v4;
  const AlgosScoreCombinerFrameRow *v5;
  double v6;
  double v7;
  double v8;
  const AlgosScoreCombinerFrameRow *v9;
  void *v10;
  char v11;
  void *__p;
  char v13;
  double v14;

  if ((unint64_t)(a1[1] - *a1) <= 0x7F)
    return nan("stddev");
  v3 = amean(a1);
  v4 = *a1;
  v5 = a1[1];
  if (*a1 == v5)
  {
    v7 = 0.0;
    v9 = *a1;
  }
  else
  {
    v6 = v3;
    v7 = 0.0;
    do
    {
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v10, v4);
      v8 = v14;
      if (v13 < 0)
        operator delete(__p);
      if (v11 < 0)
        operator delete(v10);
      v7 = v7 + (v8 - v6) * (v8 - v6);
      v4 = (const AlgosScoreCombinerFrameRow *)((char *)v4 + 64);
    }
    while (v4 != v5);
    v4 = *a1;
    v9 = a1[1];
  }
  return sqrt(v7 / (double)(unint64_t)(((v9 - v4) >> 6) - 1));
}

BOOL compareScores(AlgosScoreCombinerFrameRow *a1, AlgosScoreCombinerFrameRow *a2)
{
  return *((double *)a1 + 7) < *((double *)a2 + 7);
}

AlgosScoreCombinerFrameRow *std::vector<AlgosScoreCombinerFrameRow>::__init_with_size[abi:ne180100]<AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*>(AlgosScoreCombinerFrameRow *result, AlgosScoreCombinerFrameRow *a2, AlgosScoreCombinerFrameRow *a3, unint64_t a4)
{
  AlgosScoreCombinerFrameRow *v6;

  if (a4)
  {
    v6 = result;
    std::vector<AlgosScoreCombinerFrameRow>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<AlgosScoreCombinerFrameRow>,AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*>((uint64_t)v6 + 16, a2, a3, *((AlgosScoreCombinerFrameRow **)v6 + 1));
    *((_QWORD *)v6 + 1) = result;
  }
  return result;
}

void sub_20ADAFF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<AlgosScoreCombinerFrameRow>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<AlgosScoreCombinerFrameRow>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 58)
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AlgosScoreConnectionFrameRow>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[64 * v4];
  return result;
}

AlgosScoreCombinerFrameRow *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<AlgosScoreCombinerFrameRow>,AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*>(uint64_t a1, AlgosScoreCombinerFrameRow *a2, AlgosScoreCombinerFrameRow *a3, AlgosScoreCombinerFrameRow *this)
{
  AlgosScoreCombinerFrameRow *v4;
  const AlgosScoreCombinerFrameRow *v6;
  _QWORD v8[3];
  char v9;
  AlgosScoreCombinerFrameRow *v10;
  AlgosScoreCombinerFrameRow *v11;

  v4 = this;
  v10 = this;
  v11 = this;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow(v4, v6);
      v6 = (const AlgosScoreCombinerFrameRow *)((char *)v6 + 64);
      v4 = (AlgosScoreCombinerFrameRow *)((char *)v11 + 64);
      v11 = (AlgosScoreCombinerFrameRow *)((char *)v11 + 64);
    }
    while (v6 != a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,AlgosScoreCombinerFrameRow*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_20ADB0014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,AlgosScoreCombinerFrameRow*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,AlgosScoreCombinerFrameRow*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,AlgosScoreCombinerFrameRow*>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,AlgosScoreCombinerFrameRow*>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (uint64_t *)a1[1];
  v1 = (uint64_t *)a1[2];
  v3 = *v1;
  v4 = *v2;
  if (*v1 != *v2)
  {
    v5 = *a1;
    do
    {
      v3 -= 64;
      std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100](v5, v3);
    }
    while (v3 != v4);
  }
}

void std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 47) < 0)
    operator delete(*(void **)(a2 + 24));
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

void std::vector<AlgosScoreCombinerFrameRow>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 64;
        std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*,false>(AlgosScoreCombinerFrameRow *a1, std::string *a2, uint64_t (**a3)(std::string *, const AlgosScoreCombinerFrameRow *), uint64_t a4, char a5)
{
  const AlgosScoreCombinerFrameRow *v7;
  const AlgosScoreCombinerFrameRow *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  std::string *v13;
  std::string *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  std::string *v18;
  char v19;
  _BOOL4 v20;
  uint64_t (*v21)(std::string *, const AlgosScoreCombinerFrameRow *);
  std::string *v22;
  std::string *v23;
  AlgosScoreCombinerFrameRow *v24;

  v7 = (const AlgosScoreCombinerFrameRow *)a2;
  v8 = a1;
  v23 = a2;
  v24 = a1;
  while (2)
  {
    v9 = 1 - a4;
LABEL_3:
    v10 = v7 - v8;
    v11 = (v7 - v8) >> 6;
    switch(v11)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v21 = *a3;
        v23 = (std::string *)((char *)v7 - 64);
        if (((unsigned int (*)(void))v21)())
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v24, &v23);
        return;
      case 3uLL:
        v23 = (std::string *)((char *)v7 - 64);
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(v8, (std::string *)((char *)v8 + 64), (std::string *)((char *)v7 - 64), a3);
        return;
      case 4uLL:
        v23 = (std::string *)((char *)v7 - 64);
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(v8, (std::string *)((char *)v8 + 64), (std::string *)((char *)v8 + 128), (std::string *)((char *)v7 - 64), a3);
        return;
      case 5uLL:
        v23 = (std::string *)((char *)v7 - 64);
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(v8, (std::string *)((char *)v8 + 64), (std::string *)((char *)v8 + 128), (std::string *)v8 + 8, (std::string *)((char *)v7 - 64), a3);
        return;
      default:
        if (v10 <= 1535)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(v8, v7, (uint64_t (**)(std::string *, uint64_t))a3);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((uint64_t)v8, v7, a3);
          return;
        }
        if (v9 == 1)
        {
          if (v8 != v7)
            std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*>(v8, v7, v7, (uint64_t (**)(const std::string *, const AlgosScoreCombinerFrameRow *))a3);
          return;
        }
        v12 = v11 >> 1;
        v13 = (std::string *)((char *)v7 - 64);
        if ((unint64_t)v10 <= 0x2000)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((const AlgosScoreCombinerFrameRow *)((char *)v8 + 64 * (v11 >> 1)), (std::string *)v8, v13, a3);
          if ((a5 & 1) != 0)
          {
LABEL_11:
            v7 = (const AlgosScoreCombinerFrameRow *)v23;
            goto LABEL_12;
          }
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(v8, (std::string *)((char *)v8 + 64 * (v11 >> 1)), v13, a3);
          v14 = v23;
          v15 = (v12 << 6) - 64;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((AlgosScoreCombinerFrameRow *)((char *)v24 + 64), (std::string *)((char *)v24 + v15), (std::string *)((char *)v23 - 128), a3);
          v16 = (v12 << 6) + 64;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((AlgosScoreCombinerFrameRow *)((char *)v24 + 128), (std::string *)((char *)v24 + v16), v14 - 8, a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((AlgosScoreCombinerFrameRow *)((char *)v24 + v15), (std::string *)((char *)v24 + 64 * v12), (std::string *)((char *)v24 + v16), a3);
          v22 = (std::string *)((char *)v24 + 64 * v12);
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *>(&v24, &v22);
          if ((a5 & 1) != 0)
            goto LABEL_11;
        }
        v17 = ((uint64_t (*)(char *))*a3)((char *)v24 - 64);
        v7 = (const AlgosScoreCombinerFrameRow *)v23;
        if ((v17 & 1) == 0)
        {
          v8 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,AlgosScoreCombinerFrameRow *,BOOL (*&)(AlgosScoreCombinerFrameRow&,AlgosScoreCombinerFrameRow&)>(v24, v23, (unsigned int (**)(std::string *))a3);
          goto LABEL_20;
        }
LABEL_12:
        v18 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,AlgosScoreCombinerFrameRow *,BOOL (*&)(AlgosScoreCombinerFrameRow&,AlgosScoreCombinerFrameRow&)>(v24, (std::string *)v7, (uint64_t (**)(void))a3);
        if ((v19 & 1) == 0)
          goto LABEL_19;
        v20 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((uint64_t)v24, v18, a3);
        v8 = (const AlgosScoreCombinerFrameRow *)&v18[2].__r_.__value_.__r.__words[2];
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((uint64_t)&v18[2].__r_.__value_.__r.__words[2], (std::string *)v7, a3))
        {
          if (v20)
          {
            v24 = (AlgosScoreCombinerFrameRow *)&v18[2].__r_.__value_.__r.__words[2];
            goto LABEL_18;
          }
LABEL_19:
          std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*,false>(v24, v18, a3, -v9, a5 & 1);
          v8 = (const AlgosScoreCombinerFrameRow *)&v18[2].__r_.__value_.__r.__words[2];
LABEL_20:
          a5 = 0;
          v24 = v8;
          a4 = -v9;
          continue;
        }
        if (!v20)
        {
          v23 = v18;
          v8 = v24;
          v7 = (const AlgosScoreCombinerFrameRow *)v18;
LABEL_18:
          ++v9;
          goto LABEL_3;
        }
        return;
    }
  }
}

void std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(const AlgosScoreCombinerFrameRow **a1, std::string **a2)
{
  const AlgosScoreCombinerFrameRow *v2;
  std::string *v3;
  std::string v4;
  void *__p;
  char v6;

  v2 = *a1;
  v3 = *a2;
  AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v4, *a1);
  AlgosScoreCombinerFrameRow::operator=((std::string *)v2, v3);
  AlgosScoreCombinerFrameRow::operator=(v3, &v4);
  if (v6 < 0)
    operator delete(__p);
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_20ADB04A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(const AlgosScoreCombinerFrameRow *a1, const AlgosScoreCombinerFrameRow *a2, uint64_t (**a3)(std::string *, uint64_t))
{
  const AlgosScoreCombinerFrameRow *v5;
  uint64_t v7;
  const AlgosScoreCombinerFrameRow *v8;
  const AlgosScoreCombinerFrameRow *v9;
  uint64_t v10;
  char v11;
  std::string *v12;
  std::string v13;
  void *__p;
  char v15;

  if (a1 != a2)
  {
    v5 = (const AlgosScoreCombinerFrameRow *)((char *)a1 + 64);
    if ((const AlgosScoreCombinerFrameRow *)((char *)a1 + 64) != a2)
    {
      v7 = 0;
      v8 = a1;
      do
      {
        v9 = v8;
        v8 = v5;
        if ((*a3)((std::string *)v5, (uint64_t)v9))
        {
          AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v13, v8);
          v10 = v7;
          while (1)
          {
            AlgosScoreCombinerFrameRow::operator=((std::string *)((char *)a1 + v10 + 64), (const std::string *)((char *)a1 + v10));
            if (!v10)
              break;
            v11 = (*a3)(&v13, (uint64_t)a1 + v10 - 64);
            v10 -= 64;
            if ((v11 & 1) == 0)
            {
              v12 = (std::string *)((char *)a1 + v10 + 64);
              goto LABEL_10;
            }
          }
          v12 = (std::string *)a1;
LABEL_10:
          AlgosScoreCombinerFrameRow::operator=(v12, &v13);
          if (v15 < 0)
            operator delete(__p);
          if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v13.__r_.__value_.__l.__data_);
        }
        v5 = (const AlgosScoreCombinerFrameRow *)((char *)v8 + 64);
        v7 += 64;
      }
      while ((const AlgosScoreCombinerFrameRow *)((char *)v8 + 64) != a2);
    }
  }
}

void sub_20ADB05B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(&a9);
  _Unwind_Resume(a1);
}

void std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(uint64_t a1, const AlgosScoreCombinerFrameRow *a2, uint64_t (**a3)(std::string *, const AlgosScoreCombinerFrameRow *))
{
  const AlgosScoreCombinerFrameRow *v4;
  const AlgosScoreCombinerFrameRow *v5;
  const AlgosScoreCombinerFrameRow *v7;
  std::string v8;
  void *__p;
  char v10;

  if ((const AlgosScoreCombinerFrameRow *)a1 != a2)
  {
    v4 = (const AlgosScoreCombinerFrameRow *)a1;
    v5 = (const AlgosScoreCombinerFrameRow *)(a1 + 64);
    if ((const AlgosScoreCombinerFrameRow *)(a1 + 64) != a2)
    {
      do
      {
        v7 = v5;
        if ((*a3)((std::string *)v5, v4))
        {
          AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v8, v7);
          do
          {
            AlgosScoreCombinerFrameRow::operator=((std::string *)((char *)v4 + 64), (const std::string *)v4);
            v4 = (const AlgosScoreCombinerFrameRow *)((char *)v4 - 64);
          }
          while (((*a3)(&v8, v4) & 1) != 0);
          AlgosScoreCombinerFrameRow::operator=((std::string *)((char *)v4 + 64), &v8);
          if (v10 < 0)
            operator delete(__p);
          if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v8.__r_.__value_.__l.__data_);
        }
        v5 = (const AlgosScoreCombinerFrameRow *)((char *)v7 + 64);
        v4 = v7;
      }
      while ((const AlgosScoreCombinerFrameRow *)((char *)v7 + 64) != a2);
    }
  }
}

void sub_20ADB069C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(const AlgosScoreCombinerFrameRow *a1, std::string *a2, std::string *a3, uint64_t (**a4)(std::string *, const AlgosScoreCombinerFrameRow *))
{
  char v7;
  uint64_t result;
  const AlgosScoreCombinerFrameRow **v9;
  std::string **v10;
  std::string *v11;
  std::string *v12;
  const AlgosScoreCombinerFrameRow *v13;

  v12 = a2;
  v13 = a1;
  v11 = a3;
  v7 = (*a4)(a2, a1);
  result = (*a4)(a3, (const AlgosScoreCombinerFrameRow *)a2);
  if ((v7 & 1) == 0)
  {
    if (!(_DWORD)result)
      return result;
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((const AlgosScoreCombinerFrameRow **)&v12, &v11);
    if (!(*a4)(v12, v13))
      return 1;
    v9 = &v13;
    v10 = &v12;
    goto LABEL_9;
  }
  if (!(_DWORD)result)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v13, &v12);
    if (!(*a4)(v11, (const AlgosScoreCombinerFrameRow *)v12))
      return 1;
    v9 = (const AlgosScoreCombinerFrameRow **)&v12;
    v10 = &v11;
LABEL_9:
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(v9, v10);
    return 2;
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v13, &v11);
  return 1;
}

void std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *>(const AlgosScoreCombinerFrameRow **a1, std::string **a2)
{
  const AlgosScoreCombinerFrameRow *v2;
  std::string *v3;
  std::string v4;
  void *__p;
  char v6;

  v2 = *a1;
  v3 = *a2;
  AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v4, *a1);
  AlgosScoreCombinerFrameRow::operator=((std::string *)v2, v3);
  AlgosScoreCombinerFrameRow::operator=(v3, &v4);
  if (v6 < 0)
    operator delete(__p);
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
}

void sub_20ADB07F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((uint64_t)&a9);
  _Unwind_Resume(a1);
}

const AlgosScoreCombinerFrameRow *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,AlgosScoreCombinerFrameRow *,BOOL (*&)(AlgosScoreCombinerFrameRow&,AlgosScoreCombinerFrameRow&)>(AlgosScoreCombinerFrameRow *a1, std::string *a2, unsigned int (**a3)(std::string *))
{
  const AlgosScoreCombinerFrameRow *v6;
  const AlgosScoreCombinerFrameRow *v7;
  int v8;
  std::string *v9;
  const AlgosScoreCombinerFrameRow *v10;
  std::string v12;
  void *__p;
  char v14;
  std::string *v15;
  const AlgosScoreCombinerFrameRow *v16;

  v15 = a2;
  v16 = a1;
  AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v12, a1);
  if ((((uint64_t (*)(std::string *, std::string::size_type *))*a3)(&v12, &a2[-3].__r_.__value_.__l.__size_) & 1) != 0)
  {
    v6 = a1;
    do
    {
      v6 = (const AlgosScoreCombinerFrameRow *)((char *)v6 + 64);
      v16 = v6;
    }
    while ((((uint64_t (*)(std::string *, const AlgosScoreCombinerFrameRow *))*a3)(&v12, v6) & 1) == 0);
  }
  else
  {
    v7 = (AlgosScoreCombinerFrameRow *)((char *)a1 + 64);
    do
    {
      v6 = v7;
      v16 = v7;
      if (v7 >= (const AlgosScoreCombinerFrameRow *)v15)
        break;
      v8 = ((uint64_t (*)(std::string *, const AlgosScoreCombinerFrameRow *))*a3)(&v12, v7);
      v7 = (const AlgosScoreCombinerFrameRow *)((char *)v6 + 64);
    }
    while (!v8);
  }
  v9 = v15;
  if (v6 < (const AlgosScoreCombinerFrameRow *)v15)
  {
    do
    {
      v9 = (std::string *)((char *)v9 - 64);
      v15 = v9;
    }
    while ((((uint64_t (*)(std::string *, std::string *))*a3)(&v12, v9) & 1) != 0);
    v6 = v16;
  }
  if (v6 < (const AlgosScoreCombinerFrameRow *)v9)
  {
    do
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v16, &v15);
      do
        v16 = (const AlgosScoreCombinerFrameRow *)((char *)v16 + 64);
      while (!(*a3)(&v12));
      do
        v15 = (std::string *)((char *)v15 - 64);
      while ((((uint64_t (*)(std::string *))*a3)(&v12) & 1) != 0);
      v6 = v16;
    }
    while (v16 < (const AlgosScoreCombinerFrameRow *)v15);
  }
  if ((const AlgosScoreCombinerFrameRow *)((char *)v6 - 64) != a1)
    AlgosScoreCombinerFrameRow::operator=((std::string *)a1, (const std::string *)((char *)v6 - 64));
  AlgosScoreCombinerFrameRow::operator=((std::string *)((char *)v6 - 64), &v12);
  v10 = v16;
  if (v14 < 0)
    operator delete(__p);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  return v10;
}

void sub_20ADB0998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(&a9);
  _Unwind_Resume(a1);
}

std::string *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,AlgosScoreCombinerFrameRow *,BOOL (*&)(AlgosScoreCombinerFrameRow&,AlgosScoreCombinerFrameRow&)>(AlgosScoreCombinerFrameRow *a1, std::string *a2, uint64_t (**a3)(void))
{
  uint64_t v5;
  std::string *v6;
  std::string *v7;
  int v8;
  const AlgosScoreCombinerFrameRow *v9;
  uint64_t (*v10)(void);
  const AlgosScoreCombinerFrameRow *v11;
  std::string *v12;
  std::string v14;
  void *__p;
  char v16;
  std::string *v17;
  const AlgosScoreCombinerFrameRow *v18;

  v17 = a2;
  AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v14, a1);
  v5 = 0;
  do
  {
    v18 = (AlgosScoreCombinerFrameRow *)((char *)a1 + v5 + 64);
    v5 += 64;
  }
  while (((*a3)() & 1) != 0);
  v6 = v17;
  if (v5 == 64)
  {
    v9 = (AlgosScoreCombinerFrameRow *)((char *)a1 + 64);
    do
    {
      if (v9 >= (const AlgosScoreCombinerFrameRow *)v6)
        break;
      v10 = *a3;
      v6 = (std::string *)((char *)v6 - 64);
      v17 = v6;
    }
    while ((((uint64_t (*)(std::string *, std::string *))v10)(v6, &v14) & 1) == 0);
  }
  else
  {
    v7 = (std::string *)((char *)v17 - 64);
    do
    {
      v17 = v7;
      v8 = ((uint64_t (*)(std::string *, std::string *))*a3)(v7, &v14);
      v7 = (std::string *)((char *)v7 - 64);
    }
    while (!v8);
    v9 = v18;
  }
  v11 = v9;
  if (v9 < (const AlgosScoreCombinerFrameRow *)v17)
  {
    do
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v18, &v17);
      do
        v18 = (const AlgosScoreCombinerFrameRow *)((char *)v18 + 64);
      while (((*a3)() & 1) != 0);
      do
        v17 = (std::string *)((char *)v17 - 64);
      while (!(*a3)());
      v11 = v18;
    }
    while (v18 < (const AlgosScoreCombinerFrameRow *)v17);
  }
  v12 = (std::string *)((char *)v11 - 64);
  if ((const AlgosScoreCombinerFrameRow *)((char *)v11 - 64) != a1)
    AlgosScoreCombinerFrameRow::operator=((std::string *)a1, (const std::string *)((char *)v11 - 64));
  AlgosScoreCombinerFrameRow::operator=(v12, &v14);
  if (v16 < 0)
    operator delete(__p);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
  return v12;
}

void sub_20ADB0B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(&a9);
  _Unwind_Resume(a1);
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(uint64_t a1, std::string *a2, uint64_t (**a3)(std::string *, const AlgosScoreCombinerFrameRow *))
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t (*v8)(std::string *, const AlgosScoreCombinerFrameRow *);
  const AlgosScoreCombinerFrameRow *v9;
  const AlgosScoreCombinerFrameRow *v10;
  int v11;
  std::string *v12;
  std::string *v13;
  std::string v14;
  void *__p;
  char v16;
  std::string *v17;
  const AlgosScoreCombinerFrameRow *v18;

  v18 = (const AlgosScoreCombinerFrameRow *)a1;
  v17 = a2;
  v6 = ((uint64_t)a2 - a1) >> 6;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = *a3;
      v17 = (std::string *)((char *)a2 - 64);
      if (((unsigned int (*)(void))v8)())
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v18, &v17);
      return 1;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((const AlgosScoreCombinerFrameRow *)a1, (std::string *)(a1 + 64), (std::string *)((char *)a2 - 64), a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((const AlgosScoreCombinerFrameRow *)a1, (std::string *)(a1 + 64), (std::string *)(a1 + 128), (std::string *)((char *)a2 - 64), a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((const AlgosScoreCombinerFrameRow *)a1, (std::string *)(a1 + 64), (std::string *)(a1 + 128), (std::string *)(a1 + 192), (std::string *)((char *)a2 - 64), a3);
      return 1;
    default:
      v9 = (const AlgosScoreCombinerFrameRow *)(a1 + 128);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((const AlgosScoreCombinerFrameRow *)a1, (std::string *)(a1 + 64), (std::string *)(a1 + 128), a3);
      v10 = (const AlgosScoreCombinerFrameRow *)(a1 + 192);
      if (v10 == (const AlgosScoreCombinerFrameRow *)a2)
        return 1;
      v11 = 0;
      break;
  }
  do
  {
    if (((*a3)((std::string *)v10, v9) & 1) != 0)
    {
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v14, v10);
      do
      {
        v12 = (std::string *)v9;
        AlgosScoreCombinerFrameRow::operator=((std::string *)((char *)v9 + 64), (const std::string *)v9);
        if (v9 == v18)
          break;
        v9 = (const AlgosScoreCombinerFrameRow *)((char *)v9 - 64);
      }
      while (((*a3)(&v14, (const AlgosScoreCombinerFrameRow *)&v12[-3].__r_.__value_.__r.__words[1]) & 1) != 0);
      AlgosScoreCombinerFrameRow::operator=(v12, &v14);
      v13 = v17;
      if (v16 < 0)
        operator delete(__p);
      if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v14.__r_.__value_.__l.__data_);
      if (++v11 == 8)
        return (std::string *)((char *)v10 + 64) == v13;
    }
    else
    {
      v13 = v17;
    }
    v9 = v10;
    v10 = (const AlgosScoreCombinerFrameRow *)((char *)v10 + 64);
  }
  while (v10 != (const AlgosScoreCombinerFrameRow *)v13);
  return 1;
}

void sub_20ADB0D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(&a9);
  _Unwind_Resume(a1);
}

void std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(const AlgosScoreCombinerFrameRow *a1, std::string *a2, std::string *a3, std::string *a4, uint64_t (**a5)(std::string *, const AlgosScoreCombinerFrameRow *))
{
  std::string *v10;
  std::string *v11;
  std::string *v12;
  const AlgosScoreCombinerFrameRow *v13;

  v12 = a2;
  v13 = a1;
  v10 = a4;
  v11 = a3;
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(a1, a2, a3, a5);
  if ((*a5)(a4, (const AlgosScoreCombinerFrameRow *)a3))
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((const AlgosScoreCombinerFrameRow **)&v11, &v10);
    if ((*a5)(v11, (const AlgosScoreCombinerFrameRow *)a2))
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((const AlgosScoreCombinerFrameRow **)&v12, &v11);
      if ((*a5)(v12, a1))
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v13, &v12);
    }
  }
}

void std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(const AlgosScoreCombinerFrameRow *a1, std::string *a2, std::string *a3, std::string *a4, std::string *a5, uint64_t (**a6)(std::string *, const AlgosScoreCombinerFrameRow *))
{
  std::string *v12;
  std::string *v13;
  std::string *v14;
  std::string *v15;
  const AlgosScoreCombinerFrameRow *v16;

  v15 = a2;
  v16 = a1;
  v13 = a4;
  v14 = a3;
  v12 = a5;
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(a1, a2, a3, a4, a6);
  if ((*a6)(a5, (const AlgosScoreCombinerFrameRow *)a4))
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((const AlgosScoreCombinerFrameRow **)&v13, &v12);
    if ((*a6)(v13, (const AlgosScoreCombinerFrameRow *)a3))
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((const AlgosScoreCombinerFrameRow **)&v14, &v13);
      if ((*a6)(v14, (const AlgosScoreCombinerFrameRow *)a2))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>((const AlgosScoreCombinerFrameRow **)&v15, &v14);
        if ((*a6)(v15, a1))
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v16, &v15);
      }
    }
  }
}

const AlgosScoreCombinerFrameRow *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*,AlgosScoreCombinerFrameRow*>(AlgosScoreCombinerFrameRow *a1, const AlgosScoreCombinerFrameRow *a2, const AlgosScoreCombinerFrameRow *a3, uint64_t (**a4)(const std::string *, const AlgosScoreCombinerFrameRow *))
{
  const AlgosScoreCombinerFrameRow *v6;
  AlgosScoreCombinerFrameRow *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  const AlgosScoreCombinerFrameRow *v12;
  const AlgosScoreCombinerFrameRow *v13;
  unint64_t v14;
  const AlgosScoreCombinerFrameRow *v17;
  AlgosScoreCombinerFrameRow *v18;

  v18 = a1;
  if (a1 != a2)
  {
    v6 = a2;
    v7 = a1;
    v8 = a2 - a1;
    v9 = (a2 - a1) >> 6;
    if (a2 - a1 >= 65)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = (AlgosScoreCombinerFrameRow *)((char *)a1 + 64 * v10);
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((uint64_t)v7, a4, v9, v12);
        v12 = (const AlgosScoreCombinerFrameRow *)((char *)v12 - 64);
        --v11;
      }
      while (v11);
    }
    v17 = v6;
    if (v6 == a3)
    {
      a3 = v6;
    }
    else
    {
      v13 = v6;
      do
      {
        if ((*a4)((const std::string *)v13, v18))
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(&v17, (std::string **)&v18);
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((uint64_t)v18, a4, v9, v18);
        }
        v13 = (const AlgosScoreCombinerFrameRow *)((char *)v17 + 64);
        v17 = v13;
      }
      while (v13 != a3);
      v7 = v18;
      v8 = v6 - v18;
    }
    if (v8 >= 65)
    {
      v14 = (unint64_t)v8 >> 6;
      do
      {
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(v7, (uint64_t)v6, (unsigned int (**)(uint64_t, uint64_t))a4, v14);
        v6 = (const AlgosScoreCombinerFrameRow *)((char *)v6 - 64);
      }
      while (v14-- > 2);
      return v17;
    }
  }
  return a3;
}

void std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(uint64_t a1, uint64_t (**a2)(const std::string *, const AlgosScoreCombinerFrameRow *), uint64_t a3, const AlgosScoreCombinerFrameRow *a4)
{
  unint64_t v4;
  const AlgosScoreCombinerFrameRow *v5;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  const std::string *v12;
  uint64_t v13;
  std::string *v14;
  uint64_t v15;
  std::string v16;
  void *__p;
  char v18;

  v4 = a3 - 2;
  if (a3 >= 2)
  {
    v5 = a4;
    v7 = v4 >> 1;
    if ((uint64_t)(v4 >> 1) >= ((uint64_t)a4 - a1) >> 6)
    {
      v10 = ((uint64_t)a4 - a1) >> 5;
      v11 = v10 + 1;
      v12 = (const std::string *)(a1 + ((v10 + 1) << 6));
      v13 = v10 + 2;
      if (v10 + 2 < a3
        && (*a2)(v12, (const AlgosScoreCombinerFrameRow *)&v12[2].__r_.__value_.__r.__words[2]))
      {
        v12 = (const std::string *)((char *)v12 + 64);
        v11 = v13;
      }
      if (((*a2)(v12, v5) & 1) == 0)
      {
        AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v16, v5);
        do
        {
          v14 = (std::string *)v12;
          AlgosScoreCombinerFrameRow::operator=((std::string *)v5, v12);
          if (v7 < v11)
            break;
          v15 = (2 * v11) | 1;
          v12 = (const std::string *)(a1 + (v15 << 6));
          v11 = 2 * v11 + 2;
          if (v11 >= a3)
          {
            v11 = v15;
          }
          else if ((*a2)((const std::string *)(a1 + (v15 << 6)), (const AlgosScoreCombinerFrameRow *)&v12[2].__r_.__value_.__r.__words[2]))
          {
            v12 = (const std::string *)((char *)v12 + 64);
          }
          else
          {
            v11 = v15;
          }
          v5 = (const AlgosScoreCombinerFrameRow *)v14;
        }
        while (!(*a2)(v12, (const AlgosScoreCombinerFrameRow *)&v16));
        AlgosScoreCombinerFrameRow::operator=(v14, &v16);
        if (v18 < 0)
          operator delete(__p);
        if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v16.__r_.__value_.__l.__data_);
      }
    }
  }
}

void sub_20ADB1174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(&a9);
  _Unwind_Resume(a1);
}

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(AlgosScoreCombinerFrameRow *a1, uint64_t a2, unsigned int (**a3)(uint64_t, uint64_t), uint64_t a4)
{
  std::string *v8;
  std::string *v9;
  std::string *v10;
  std::string v11;
  void *__p;
  char v13;

  if (a4 >= 2)
  {
    AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v11, a1);
    v8 = (std::string *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((std::string *)a1, a3, a4);
    v9 = v8;
    v10 = (std::string *)(a2 - 64);
    if (v8 == v10)
    {
      AlgosScoreCombinerFrameRow::operator=(v8, &v11);
    }
    else
    {
      AlgosScoreCombinerFrameRow::operator=(v8, v10);
      AlgosScoreCombinerFrameRow::operator=(v10, &v11);
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>((uint64_t)a1, (uint64_t)&v9[2].__r_.__value_.__r.__words[2], (uint64_t (**)(const std::string *, std::string *))a3, ((char *)&v9[2].__r_.__value_.__r.__words[2] - (char *)a1) >> 6);
    }
    if (v13 < 0)
      operator delete(__p);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v11.__r_.__value_.__l.__data_);
  }
}

void sub_20ADB1258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(&a9);
  _Unwind_Resume(a1);
}

const std::string *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(std::string *a1, unsigned int (**a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const std::string *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = 0;
  v7 = a3 - 2;
  if (a3 < 2)
    v7 = a3 - 1;
  v8 = v7 >> 1;
  do
  {
    v9 = (std::string *)((char *)a1 + 64 * v6 + 64);
    v10 = (2 * v6) | 1;
    v11 = 2 * v6 + 2;
    if (v11 < a3
      && (*a2)((uint64_t)&a1[2].__r_.__value_.__r.__words[8 * v6 + 2], (uint64_t)(&a1[5].__r_.__value_.__l.__size_ + 8 * v6)))
    {
      v9 = (const std::string *)((char *)v9 + 64);
      v10 = v11;
    }
    AlgosScoreCombinerFrameRow::operator=(a1, v9);
    a1 = (std::string *)v9;
    v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(AlgosScoreCombinerFrameRow &,AlgosScoreCombinerFrameRow &),AlgosScoreCombinerFrameRow*>(uint64_t a1, uint64_t a2, uint64_t (**a3)(const std::string *, std::string *), uint64_t a4)
{
  unint64_t v4;
  unint64_t v7;
  const std::string *v8;
  const AlgosScoreCombinerFrameRow *v9;
  std::string *v10;
  std::string v11;
  void *__p;
  char v13;

  v4 = a4 - 2;
  if (a4 >= 2)
  {
    v7 = v4 >> 1;
    v8 = (const std::string *)(a1 + (v4 >> 1 << 6));
    v9 = (const AlgosScoreCombinerFrameRow *)(a2 - 64);
    if ((*a3)(v8, (std::string *)(a2 - 64)))
    {
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v11, v9);
      do
      {
        v10 = (std::string *)v8;
        AlgosScoreCombinerFrameRow::operator=((std::string *)v9, v8);
        if (!v7)
          break;
        v7 = (v7 - 1) >> 1;
        v8 = (const std::string *)(a1 + (v7 << 6));
        v9 = (const AlgosScoreCombinerFrameRow *)v10;
      }
      while (((*a3)(v8, &v11) & 1) != 0);
      AlgosScoreCombinerFrameRow::operator=(v10, &v11);
      if (v13 < 0)
        operator delete(__p);
      if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v11.__r_.__value_.__l.__data_);
    }
  }
}

void sub_20ADB13EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(&a9);
  _Unwind_Resume(a1);
}

double standard_moment(const AlgosScoreCombinerFrameRow **a1, int a2)
{
  uint64_t v2;
  double v6;
  double v7;
  double v8;
  double v9;
  const AlgosScoreCombinerFrameRow *v10;
  const AlgosScoreCombinerFrameRow *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  char v16;
  void *__p;
  char v18;
  double v19;

  v2 = a1[1] - *a1;
  if ((unint64_t)v2 <= 0xBF)
    return nan("standard_moment");
  v6 = amean(a1);
  v7 = stddev(a1);
  v8 = (double)a2;
  v9 = pow(v7, (double)a2);
  v10 = *a1;
  v11 = a1[1];
  if (v10 == v11)
    return 0.0;
  v12 = v9 * (double)(unint64_t)((v2 >> 6) - 1);
  v13 = 0.0;
  do
  {
    AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)&v15, v10);
    v14 = pow(v19 - v6, v8);
    if (v18 < 0)
      operator delete(__p);
    if (v16 < 0)
      operator delete(v15);
    v13 = v13 + v14 / v12;
    v10 = (const AlgosScoreCombinerFrameRow *)((char *)v10 + 64);
  }
  while (v10 != v11);
  return v13;
}

uint64_t std::vector<AlgosScoreCombinerFrameRow>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<AlgosScoreCombinerFrameRow>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>>((uint64_t)(a1 + 2), a1[1], (const AlgosScoreCombinerFrameRow *)a1[1], *a1, (const AlgosScoreCombinerFrameRow *)*a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<AlgosScoreCombinerFrameRow>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>>(uint64_t a1, uint64_t a2, const AlgosScoreCombinerFrameRow *a3, uint64_t a4, const AlgosScoreCombinerFrameRow *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  const AlgosScoreCombinerFrameRow *v9;
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
  v13 = 0;
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    v9 = a3;
    do
    {
      v9 = (const AlgosScoreCombinerFrameRow *)((char *)v9 - 64);
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)(v7 - 64), v9);
      v7 = *((_QWORD *)&v15 + 1) - 64;
      *((_QWORD *)&v15 + 1) -= 64;
    }
    while (v9 != a5);
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

void sub_20ADB1638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreCombinerFrameRow>,std::reverse_iterator<AlgosScoreCombinerFrameRow*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1[2] + 8);
  v2 = *(_QWORD *)(a1[1] + 8);
  if (v1 != v2)
  {
    v3 = *a1;
    do
    {
      std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100](v3, v1);
      v1 += 64;
    }
    while (v1 != v2);
  }
}

void **std::__split_buffer<AlgosScoreCombinerFrameRow>::~__split_buffer(void **a1)
{
  std::__split_buffer<AlgosScoreCombinerFrameRow>::clear[abi:ne180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<AlgosScoreCombinerFrameRow>::clear[abi:ne180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 64;
    std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100](v4, i - 64);
  }
}

void sub_20ADB17EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20ADB1D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::locale a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  void *v37;

  _Unwind_Resume(a1);
}

void sub_20ADB2078(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20ADB28E8()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_end_catch();
  JUMPOUT(0x20ADB29D8);
}

void sub_20ADB28FC()
{
  void *v0;
  void *v1;
  void *v2;
  _Unwind_Exception *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  _Unwind_Resume(v3);
}

void sub_20ADB2914()
{
  void *v0;
  _Unwind_Exception *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(v1);
}

void sub_20ADB2988()
{
  JUMPOUT(0x20ADB29B4);
}

void sub_20ADB2994()
{
  JUMPOUT(0x20ADB29B0);
}

void sub_20ADB299C()
{
  void *v0;

  JUMPOUT(0x20ADB29B0);
}

void sub_20ADB29C0()
{
  void *v0;

  JUMPOUT(0x20ADB29D0);
}

void sub_20ADB29CC()
{
  void *v0;

  JUMPOUT(0x20ADB29D8);
}

void sub_20ADB2A88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void std::vector<AlgosScoreStreamCSVFrameRow>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 72)
  {
    if (*(char *)(i - 49) < 0)
      operator delete(*(void **)(i - 72));
  }
  a1[1] = v2;
}

std::regex_traits<char> *std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](std::regex_traits<char> *a1, char *a2, int a3)
{
  std::regex_traits<char> *v6;
  size_t v7;

  v6 = std::regex_traits<char>::regex_traits(a1);
  LODWORD(v6[1].__loc_.__locale_) = a3;
  *(_OWORD *)((char *)&v6[1].__loc_.__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v6[1].__col_ + 4) = 0u;
  HIDWORD(v6[2].__ct_) = 0;
  v7 = strlen(a2);
  if (std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>((uint64_t)a1, (std::basic_regex<char> *)a2, (std::basic_regex<char> *)&a2[v7]) != (std::basic_regex<char> *)&a2[v7])std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>();
  return a1;
}

void sub_20ADB2C84(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100]((uint64_t)&v1[5]);
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::regex_traits<char> *__cdecl std::regex_traits<char>::regex_traits(std::regex_traits<char> *this)
{
  const std::locale *v2;

  v2 = (const std::locale *)MEMORY[0x20BD3120C]();
  this->__ct_ = (const std::ctype<char> *)std::locale::use_facet(v2, MEMORY[0x24BEDB350]);
  this->__col_ = (const std::collate<char> *)std::locale::use_facet(&this->__loc_, MEMORY[0x24BEDB4B0]);
  return this;
}

void sub_20ADB2CE8(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  unsigned int v8;

  v6 = (_QWORD *)operator new();
  *v6 = &unk_24C3CB3D0;
  v7 = (_QWORD *)operator new();
  v7[1] = v6;
  std::shared_ptr<std::__empty_state<char>>::reset[abi:ne180100]<std::__empty_state<char>,void>((_QWORD *)(a1 + 40), (uint64_t)v7);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 40);
  v8 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v8 > 0x3F)
  {
    switch(v8)
    {
      case 0x40u:
        return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, a2, a3);
      case 0x80u:
        return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_grep<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
      case 0x100u:
        return std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<char const*>((std::basic_regex<char> *)a1, a2, a3);
      default:
        goto LABEL_14;
    }
  }
  else if (v8)
  {
    if (v8 != 16)
    {
      if (v8 != 32)
LABEL_14:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
      return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, a2, a3);
    }
    return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
  }
  else
  {
    return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)a2, (char *)a3);
  }
}

void sub_20ADB2E50(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 17);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADB2EA4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::shared_ptr<std::__empty_state<char>>::reset[abi:ne180100]<std::__empty_state<char>,void>(_QWORD *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  __int128 v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  __int128 v7;

  std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(&v7, a2);
  v3 = (std::__shared_weak_count *)a1[1];
  v4 = v7;
  *(_QWORD *)&v7 = *a1;
  *((_QWORD *)&v7 + 1) = v3;
  *(_OWORD *)a1 = v4;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  std::__node<char> *v9;
  std::__owns_one_state<char> *v10;
  std::__node<char> *first;
  std::__owns_one_state<char> *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  std::__node<char> *v15;
  std::__owns_one_state<char> *v16;
  std::__node<char> *v17;

  end = a1->__end_;
  v7 = a2;
  do
  {
    v8 = v7;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(a1, (char *)v7, a3);
  }
  while (v7 != v8);
  if (v8 == a2)
  {
    v9 = (std::__node<char> *)operator new();
    v10 = a1->__end_;
    first = v10->__first_;
    v9[1].__vftable = (std::__node<char>_vtbl *)first;
    v10->__first_ = v9;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  if (v8 != (unsigned __int8 *)a3)
  {
    while (*v8 == 124)
    {
      v12 = a1->__end_;
      v13 = v8 + 1;
      v14 = v8 + 1;
      do
      {
        v8 = v14;
        v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(a1, (char *)v14, a3);
      }
      while (v14 != v8);
      if (v8 == v13)
      {
        v15 = (std::__node<char> *)operator new();
        v16 = a1->__end_;
        v17 = v16->__first_;
        v15[1].__vftable = (std::__node<char>_vtbl *)v17;
        v16->__first_ = v15;
        a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v12);
      if (v8 == (unsigned __int8 *)a3)
        return a3;
    }
    return (char *)v8;
  }
  return a3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  char *v4;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  if (a2 == a3)
    return (char *)a2;
  v4 = (char *)a3;
  if (*a2 == 94)
  {
    v6 = operator new();
    v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(v8 + 8);
    *(_QWORD *)v6 = &unk_24C3CB640;
    *(_QWORD *)(v6 + 8) = v9;
    *(_BYTE *)(v6 + 16) = v7;
    *(_QWORD *)(v8 + 8) = v6;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    ++v3;
  }
  if (v3 != (unsigned __int8 *)v4)
  {
    do
    {
      v10 = v3;
      v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>((std::basic_regex<char> *)a1, (char *)v3, v4);
    }
    while (v3 != v10);
    if (v10 != (unsigned __int8 *)v4)
    {
      if (v10 + 1 != (unsigned __int8 *)v4 || *v10 != 36)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(v13 + 8);
      *(_QWORD *)v11 = &unk_24C3CB6A0;
      *(_QWORD *)(v11 + 8) = v14;
      *(_BYTE *)(v11 + 16) = v12;
      *(_QWORD *)(v13 + 8) = v11;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
  }
  return v4;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  std::basic_regex<char> *v3;
  std::__owns_one_state<char> *end;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  std::__owns_one_state<char> *v9;
  unsigned __int8 *v10;

  v3 = a3;
  end = a1->__end_;
  v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>((uint64_t)a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2)
LABEL_9:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  v8 = v7;
  while (v8 != (unsigned __int8 *)v3)
  {
    if (*v8 != 124)
      return (std::basic_regex<char> *)v8;
    v9 = a1->__end_;
    v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>((uint64_t)a1, (std::basic_regex<char> *)(v8 + 1), v3);
    if (v10 == v8 + 1)
      goto LABEL_9;
    v8 = v10;
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v9);
  }
  return v3;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_grep<char const*>(std::basic_regex<char> *a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  std::__owns_one_state<char> *end;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  std::__node<char> *v9;
  std::__owns_one_state<char> *v10;
  std::__node<char> *first;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  std::__owns_one_state<char> *v15;
  std::__node<char> *v16;
  std::__owns_one_state<char> *v17;
  std::__node<char> *v18;

  end = a1->__end_;
  v7 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  if (v8 == __s)
  {
    v9 = (std::__node<char> *)operator new();
    v10 = a1->__end_;
    first = v10->__first_;
    v9[1].__vftable = (std::__node<char>_vtbl *)first;
    v10->__first_ = v9;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>((uint64_t)a1, __s, v8);
  }
  if (v8 == a3)
    v12 = v8;
  else
    v12 = v8 + 1;
  while (v12 != a3)
  {
    v13 = (unsigned __int8 *)memchr(v12, 10, a3 - v12);
    if (v13)
      v14 = v13;
    else
      v14 = a3;
    v15 = a1->__end_;
    if (v14 == v12)
    {
      v16 = (std::__node<char> *)operator new();
      v17 = a1->__end_;
      v18 = v17->__first_;
      v16[1].__vftable = (std::__node<char>_vtbl *)v18;
      v17->__first_ = v16;
      a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>((uint64_t)a1, v12, v14);
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v15);
    if (v14 == a3)
      v12 = v14;
    else
      v12 = v14 + 1;
  }
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_egrep<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *__s, std::basic_regex<char> *a3)
{
  std::__owns_one_state<char> *end;
  std::basic_regex<char> *v7;
  std::basic_regex<char> *v8;
  std::__node<char> *v9;
  std::__owns_one_state<char> *v10;
  std::__node<char> *first;
  std::basic_regex<char> *v12;
  std::basic_regex<char> *v13;
  std::basic_regex<char> *v14;
  std::__owns_one_state<char> *v15;
  std::__node<char> *v16;
  std::__owns_one_state<char> *v17;
  std::__node<char> *v18;

  end = a1->__end_;
  v7 = (std::basic_regex<char> *)memchr(__s, 10, (char *)a3 - (char *)__s);
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  if (v8 == __s)
  {
    v9 = (std::__node<char> *)operator new();
    v10 = a1->__end_;
    first = v10->__first_;
    v9[1].__vftable = (std::__node<char>_vtbl *)first;
    v10->__first_ = v9;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  else
  {
    std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, __s, v8);
  }
  if (v8 == a3)
    v12 = v8;
  else
    v12 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
  while (v12 != a3)
  {
    v13 = (std::basic_regex<char> *)memchr(v12, 10, (char *)a3 - (char *)v12);
    if (v13)
      v14 = v13;
    else
      v14 = a3;
    v15 = a1->__end_;
    if (v14 == v12)
    {
      v16 = (std::__node<char> *)operator new();
      v17 = a1->__end_;
      v18 = v17->__first_;
      v16[1].__vftable = (std::__node<char>_vtbl *)v18;
      v17->__first_ = v16;
      a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, v12, v14);
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_alternation(a1, end, v15);
    if (v14 == a3)
      v12 = v14;
    else
      v12 = (std::basic_regex<char> *)((char *)&v14->__traits_.__loc_.__locale_ + 1);
  }
  return a3;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 14);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADB3544(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__end_state<char>::~__end_state()
{
  JUMPOUT(0x20BD3126CLL);
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

_QWORD *std::shared_ptr<std::__empty_state<char>>::shared_ptr[abi:ne180100]<std::__empty_state<char>,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &unk_24C3CB6D0;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_20ADB35DC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD3126CLL);
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

void (__cdecl ***std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x20BD3126CLL);
}

void std::__empty_state<char>::__exec(const std::__empty_state<char> *this, std::__empty_state<char>::__state *a2)
{
  a2->__do_ = -994;
  a2->__node_ = this->__first_;
}

void std::__owns_one_state<char>::~__owns_one_state(std::__owns_one_state<char> *this)
{
  std::__node<char> *first;

  first = this->__first_;
  if (first)
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
}

{
  std::__node<char> *first;

  first = this->__first_;
  if (first)
    ((void (*)(std::__node<char> *))first->~__node_0)(first);
  JUMPOUT(0x20BD3126CLL);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_alternation(std::basic_regex<char> *this, std::__owns_one_state<char> *__sa, std::__owns_one_state<char> *__sb)
{
  std::__node<char> *v6;
  std::__node<char> *first;
  std::__node<char> *v8;
  std::__node<char> *v9;
  std::__node<char> *v10;
  std::__node<char> *v11;

  v6 = (std::__node<char> *)operator new();
  first = __sb->__first_;
  v6[1].__vftable = (std::__node<char>_vtbl *)__sa->__first_;
  v6[2].__vftable = (std::__node<char>_vtbl *)first;
  v6->__vftable = (std::__node<char>_vtbl *)&unk_24C3CB3A0;
  __sa->__first_ = v6;
  __sb->__first_ = 0;
  v8 = (std::__node<char> *)operator new();
  v9 = this->__end_->__first_;
  v8[1].__vftable = (std::__node<char>_vtbl *)v9;
  __sb->__first_ = v8;
  this->__end_->__first_ = 0;
  v10 = (std::__node<char> *)operator new();
  v11 = __sb->__first_;
  v10->__vftable = (std::__node<char>_vtbl *)&unk_24C3CB708;
  v10[1].__vftable = (std::__node<char>_vtbl *)v11;
  this->__end_->__first_ = v10;
  this->__end_ = (std::__owns_one_state<char> *)__sb->__first_;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_term<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  unsigned __int8 *result;
  std::__owns_one_state<char> *end;
  unsigned int marked_count;
  unsigned __int8 *v9;

  result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    end = a1->__end_;
    marked_count = a1->__marked_count_;
    v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
    result = (unsigned __int8 *)a2;
    if (v9 != (unsigned __int8 *)a2)
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)a1, v9, (unsigned __int8 *)a3, end, marked_count + 1, a1->__marked_count_ + 1);
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(std::basic_regex<char> *this, char *a2, char *a3)
{
  char *v3;
  int v6;
  char *v7;
  BOOL v8;
  char *v9;
  int v11;
  char *v12;
  unsigned int v13;
  uint64_t v14;
  BOOL v15;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  char *v18;
  int v20;
  BOOL v21;
  unsigned int marked_count;
  std::basic_regex<char> v23;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v6 = *a2;
  if (v6 <= 91)
  {
    if (v6 != 36)
    {
      v8 = v6 == 40;
      v7 = a2 + 1;
      v8 = !v8 || v7 == a3;
      if (!v8)
      {
        v8 = *v7 == 63;
        v9 = a2 + 2;
        if (v8 && v9 != a3)
        {
          v11 = *v9;
          if (v11 == 33)
          {
            std::regex_traits<char>::regex_traits(&v23.__traits_);
            memset(&v23.__flags_, 0, 40);
            v23.__flags_ = this->__flags_;
            v12 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v23, v3 + 3, a3);
            marked_count = v23.__marked_count_;
            std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v23, 1, this->__marked_count_);
            this->__marked_count_ += marked_count;
            if (v12 == a3 || *v12 != 41)
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
            goto LABEL_31;
          }
          if (v11 == 61)
          {
            std::regex_traits<char>::regex_traits(&v23.__traits_);
            memset(&v23.__flags_, 0, 40);
            v23.__flags_ = this->__flags_;
            v12 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v23, v3 + 3, a3);
            v13 = v23.__marked_count_;
            std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(this, &v23, 0, this->__marked_count_);
            this->__marked_count_ += v13;
            if (v12 == a3 || *v12 != 41)
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
LABEL_31:
            v3 = v12 + 1;
            std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100]((uint64_t)&v23.__start_);
            std::locale::~locale(&v23.__traits_.__loc_);
            return v3;
          }
        }
      }
      return v3;
    }
    v14 = operator new();
    v15 = (this->__flags_ & 0x5F0) == 1024;
    end = this->__end_;
    first = end->__first_;
LABEL_21:
    *(_QWORD *)v14 = v18 + 16;
    *(_QWORD *)(v14 + 8) = first;
    *(_BYTE *)(v14 + 16) = v15;
    end->__first_ = (std::__node<char> *)v14;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
    return ++v3;
  }
  if (v6 != 92)
  {
    if (v6 != 94)
      return v3;
    v14 = operator new();
    v15 = (this->__flags_ & 0x5F0) == 1024;
    end = this->__end_;
    first = end->__first_;
    goto LABEL_21;
  }
  if (a2 + 1 != a3)
  {
    v20 = a2[1];
    if (v20 == 66)
    {
      v21 = 1;
    }
    else
    {
      if (v20 != 98)
        return v3;
      v21 = 0;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(this, v21);
    v3 += 2;
  }
  return v3;
}

void sub_20ADB3BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100]((uint64_t)&a14);
  std::locale::~locale(&a9);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  int v6;
  std::__node<char> *v7;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  int *p_open_count;
  unsigned __int8 *v12;
  unsigned int marked_count;
  unsigned __int8 *v14;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v6 = (char)*a2;
  if (v6 > 62)
  {
    if (v6 > 91)
    {
      if (v6 == 92)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<char const*>(this, a2, a3);
      if (v6 != 123)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(this, a2, a3);
    }
    else
    {
      if (v6 == 91)
        return (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, (char *)a2, (char *)a3);
      if (v6 != 63)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(this, a2, a3);
    }
LABEL_29:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
  }
  if (v6 == 40)
  {
    if (a2 + 1 == a3)
      goto LABEL_30;
    if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
    {
      p_open_count = &this->__open_count_;
      ++this->__open_count_;
      v12 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, a2 + 3, a3);
      if (v12 == a3)
        goto LABEL_30;
      v3 = v12;
      if (*v12 != 41)
        goto LABEL_30;
    }
    else
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(this);
      marked_count = this->__marked_count_;
      p_open_count = &this->__open_count_;
      ++this->__open_count_;
      v14 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, v3 + 1, a3);
      if (v14 == a3 || (v3 = v14, *v14 != 41))
LABEL_30:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(this, marked_count);
    }
    --*p_open_count;
    return ++v3;
  }
  if (v6 == 46)
  {
    v7 = (std::__node<char> *)operator new();
    end = this->__end_;
    first = end->__first_;
    v7->__vftable = (std::__node<char>_vtbl *)&unk_24C3CB738;
    v7[1].__vftable = (std::__node<char>_vtbl *)first;
    end->__first_ = v7;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
    return ++v3;
  }
  if ((v6 - 42) < 2)
    goto LABEL_29;
  return std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(this, a2, a3);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t a5, size_t a6)
{
  unsigned int v6;
  unsigned int v7;
  uint64_t v10;
  int v11;
  int v12;
  unsigned __int8 *v13;
  size_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  size_t v18;
  BOOL v19;
  BOOL v20;
  std::__owns_one_state<char> *v21;
  BOOL v22;
  unsigned __int8 *v23;
  unsigned __int8 *v25;
  int v26;
  int v27;
  size_t __max;

  if (a2 == a3)
    return a2;
  v6 = a6;
  v7 = a5;
  v10 = a1;
  v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  v12 = (char)*a2;
  if (v12 > 62)
  {
    if (v12 == 63)
    {
      v13 = a2 + 1;
      if (v11)
        v20 = 1;
      else
        v20 = v13 == a3;
      if (!v20 && *v13 == 63)
      {
        v13 = a2 + 2;
        a5 = a5;
        a6 = a6;
        v14 = 0;
        v18 = 1;
        goto LABEL_33;
      }
      a5 = a5;
      a6 = a6;
      v14 = 0;
      v18 = 1;
      goto LABEL_45;
    }
    if (v12 != 123)
      return a2;
    v15 = a2 + 1;
    v16 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(a1, a2 + 1, a3, (int *)&__max);
    if (v16 != v15)
    {
      if (v16 != a3)
      {
        v17 = (char)*v16;
        if (v17 != 44)
        {
          if (v17 == 125)
          {
            v13 = v16 + 1;
            if (!v11 && v13 != a3 && *v13 == 63)
            {
              v13 = v16 + 2;
              v14 = (int)__max;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              v18 = (int)__max;
LABEL_33:
              v21 = __s;
              v22 = 0;
LABEL_46:
              std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }
            v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            v18 = (int)__max;
LABEL_45:
            v21 = __s;
            v22 = 1;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
        v23 = v16 + 1;
        if (v16 + 1 == a3)
          goto LABEL_58;
        if (*v23 == 125)
        {
          v13 = v16 + 2;
          if (!v11 && v13 != a3 && *v13 == 63)
          {
            v13 = v16 + 3;
            v14 = (int)__max;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }
          v14 = (int)__max;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          v18 = -1;
          goto LABEL_45;
        }
        v27 = -1;
        v25 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(v10, v23, a3, &v27);
        if (v25 != v23 && v25 != a3 && *v25 == 125)
        {
          v18 = v27;
          v14 = (int)__max;
          if (v27 >= (int)__max)
          {
            v13 = v25 + 1;
            v22 = 1;
            if (!v11 && v13 != a3)
            {
              v26 = v25[1];
              v22 = v26 != 63;
              if (v26 == 63)
                v13 = v25 + 2;
            }
            a5 = v7;
            a6 = v6;
            a1 = v10;
            v21 = __s;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
LABEL_58:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  if (v12 == 42)
  {
    v13 = a2 + 1;
    if (v11)
      v19 = 1;
    else
      v19 = v13 == a3;
    if (!v19 && *v13 == 63)
    {
      v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      v14 = 0;
      goto LABEL_26;
    }
    a5 = a5;
    a6 = a6;
    v14 = 0;
    goto LABEL_36;
  }
  if (v12 == 43)
  {
    v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      v13 = a2 + 2;
      a5 = a5;
      a6 = a6;
      v14 = 1;
LABEL_26:
      v18 = -1;
      goto LABEL_33;
    }
    a5 = a5;
    a6 = a6;
    v14 = 1;
    goto LABEL_36;
  }
  return a2;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_word_boundary(std::basic_regex<char> *this, BOOL a2)
{
  uint64_t v4;
  std::__node<char> *first;

  v4 = operator new();
  first = this->__end_->__first_;
  *(_QWORD *)v4 = &unk_24C3CB4C0;
  *(_QWORD *)(v4 + 8) = first;
  std::locale::locale((std::locale *)(v4 + 16), &this->__traits_.__loc_);
  *(_OWORD *)(v4 + 24) = *(_OWORD *)&this->__traits_.__ct_;
  *(_BYTE *)(v4 + 40) = a2;
  this->__end_->__first_ = (std::__node<char> *)v4;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
  std::__node<char> *v8;

  v8 = (std::__node<char> *)operator new();
  std::__lookahead<char,std::regex_traits<char>>::__lookahead[abi:ne180100]((uint64_t)v8, (uint64_t)a2, a3, (uint64_t)this->__end_->__first_, a4);
  this->__end_->__first_ = v8;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_20ADB4234(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD3126C](v1, 0x10E1C4030FC3181);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 6);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADB4290(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x20BD3126CLL);
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  int v2;
  uint64_t v4;

  if (*(_BYTE *)(a2 + 92))
  {
    if (*(_QWORD *)(a2 + 16) != *(_QWORD *)(a2 + 8) || (*(_BYTE *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(_BYTE *)(result + 16))
      goto LABEL_12;
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10)
      goto LABEL_12;
  }
  *(_DWORD *)a2 = -994;
  v4 = *(_QWORD *)(result + 8);
LABEL_13:
  *(_QWORD *)(a2 + 80) = v4;
  return result;
}

void (__cdecl ***std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x20BD3126CLL);
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  int v3;
  BOOL v4;
  uint64_t v5;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(_BYTE *)(a2 + 88) & 2) == 0
    || *(_BYTE *)(result + 16) && ((v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    v5 = *(_QWORD *)(result + 8);
  }
  else
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24C3CB4C0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24C3CB4C0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x20BD3126CLL);
}

uint64_t std::__word_boundary<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;

  v2 = *(unsigned __int8 **)(a2 + 8);
  v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3)
    goto LABEL_17;
  v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(_BYTE *)(a2 + 88) & 8) == 0)
    {
      v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  v7 = *(v4 - 1);
  v8 = *v4;
  v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  v11 = (_DWORD)v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    v12 = 0;
    v13 = -993;
  }
  else
  {
    v12 = *(_QWORD *)(result + 8);
    v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(_QWORD *)(a2 + 80) = v12;
  return result;
}

uint64_t std::__lookahead<char,std::regex_traits<char>>::__lookahead[abi:ne180100](uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  *(_QWORD *)a1 = &unk_24C3CB400;
  *(_QWORD *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 64) = v9;
  if (v9)
  {
    v10 = (unint64_t *)(v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 80) = a5;
  *(_BYTE *)(a1 + 84) = a3;
  return a1;
}

void (__cdecl ***std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  std::locale *v2;
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24C3CB400;
  v2 = (std::locale *)(a1 + 2);
  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 7));
  std::locale::~locale(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  std::locale *v2;
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24C3CB400;
  v2 = (std::locale *)(a1 + 2);
  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 7));
  std::locale::~locale(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x20BD3126CLL);
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  std::vector<std::csub_match>::size_type v4;
  uint64_t v5;
  const char *v6;
  BOOL v7;
  char v8;
  std::sub_match<const char *> *begin;
  unint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  std::sub_match<const char *> *v15;
  uint64_t v16;
  std::vector<std::csub_match> __p;
  std::vector<std::csub_match>::value_type v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  std::vector<std::csub_match>::value_type v22;
  char v23;
  uint64_t v24;

  v19 = 0;
  v20 = 0;
  v21 = 0;
  memset(&v22, 0, 17);
  v23 = 0;
  v24 = 0;
  memset(&__p, 0, sizeof(__p));
  v4 = (*(_DWORD *)(a1 + 44) + 1);
  v5 = *(_QWORD *)(a2 + 16);
  v18.first = *(const char **)(a2 + 24);
  v18.second = v18.first;
  v18.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v4, &v18);
  v19 = v5;
  v20 = v5;
  v21 = 0;
  v22 = v18;
  v24 = v5;
  v23 = 1;
  v6 = *(const char **)(a2 + 16);
  if (*(_BYTE *)(a2 + 92))
    v7 = v6 == *(const char **)(a2 + 8);
  else
    v7 = 0;
  v8 = v7;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v6, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v8))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    begin = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 8);
  begin = __p.__begin_;
  v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v10 < 2)
  {
LABEL_13:
    if (!begin)
      return;
    goto LABEL_14;
  }
  v11 = 0;
  v12 = *(_DWORD *)(a1 + 80);
  v13 = *(_QWORD *)(a2 + 32);
  v14 = 1;
  do
  {
    v15 = &begin[v14];
    v16 = v13 + 24 * (v12 + v11);
    *(std::pair<const char *, const char *> *)v16 = v15->std::pair<const char *, const char *>;
    *(_BYTE *)(v16 + 16) = v15->matched;
    v14 = (v11 + 2);
    ++v11;
  }
  while (v10 > v14);
LABEL_14:
  __p.__end_ = begin;
  operator delete(begin);
}

void sub_20ADB492C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::match_results<char const*>::__init(std::match_results<const char *> *this, unsigned int __s, const char *__f, const char *__l, BOOL __no_update_pos)
{
  std::match_results<const char *>::value_type *p_unmatched;

  this->__unmatched_.first = __l;
  p_unmatched = &this->__unmatched_;
  this->__unmatched_.second = __l;
  this->__unmatched_.matched = 0;
  std::vector<std::sub_match<char const*>>::assign(&this->__matches_, __s, &this->__unmatched_);
  this->__prefix_.first = __f;
  this->__prefix_.second = __f;
  this->__prefix_.matched = 0;
  this->__suffix_ = *p_unmatched;
  if (!__no_update_pos)
    this->__position_start_ = __f;
  this->__ready_ = 1;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  _OWORD *v11;
  _OWORD *v12;
  unsigned int v13;
  uint64_t v14;
  _QWORD *v15;
  _OWORD *v16;
  const char *v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t v20;
  _OWORD *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _BYTE *v29;
  unsigned int v30;
  uint64_t v31;
  char v32;
  uint64_t *v34;
  _BYTE v37[56];
  void *__p[2];
  _QWORD v39[4];
  std::vector<std::csub_match>::value_type __x;
  _OWORD *v41;
  _OWORD *v42;
  unint64_t v43;

  v41 = 0;
  v42 = 0;
  v43 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    __x.first = a3;
    __x.second = a3;
    __x.matched = 0;
    *(_DWORD *)v37 = 0;
    memset(&v37[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v39, 0, 21);
    v42 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v41, (uint64_t)v37);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(_QWORD *)&v37[32])
    {
      *(_QWORD *)&v37[40] = *(_QWORD *)&v37[32];
      operator delete(*(void **)&v37[32]);
    }
    v34 = a4;
    v11 = v42;
    *((_DWORD *)v42 - 24) = 0;
    *((_QWORD *)v11 - 11) = a2;
    *((_QWORD *)v11 - 10) = a2;
    *((_QWORD *)v11 - 9) = a3;
    std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v11 - 4), *(unsigned int *)(a1 + 28), &__x);
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)((char *)v42 - 40), *(unsigned int *)(a1 + 32));
    v12 = v42;
    *((_QWORD *)v42 - 2) = v6;
    *((_DWORD *)v12 - 2) = a5;
    *((_BYTE *)v12 - 4) = a6;
    v13 = 1;
    while (2)
    {
      if ((v13 & 0xFFF) == 0 && (int)(v13 >> 12) >= (int)a3 - (int)a2)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      v15 = v12 - 1;
      v14 = *((_QWORD *)v12 - 2);
      v16 = v12 - 6;
      if (v14)
        (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v14 + 16))(v14, v12 - 6);
      switch(*(_DWORD *)v16)
      {
        case 0xFFFFFC18:
          v17 = (const char *)*((_QWORD *)v12 - 10);
          if ((a5 & 0x20) != 0 && v17 == a2 || (a5 & 0x1000) != 0 && v17 != a3)
            goto LABEL_16;
          v25 = *v34;
          *(_QWORD *)v25 = a2;
          *(_QWORD *)(v25 + 8) = v17;
          *(_BYTE *)(v25 + 16) = 1;
          v26 = *((_QWORD *)v12 - 8);
          v27 = *((_QWORD *)v12 - 7) - v26;
          if (v27)
          {
            v28 = 0xAAAAAAAAAAAAAAABLL * (v27 >> 3);
            v29 = (_BYTE *)(v26 + 16);
            v30 = 1;
            do
            {
              v31 = v25 + 24 * v30;
              *(_OWORD *)v31 = *((_OWORD *)v29 - 1);
              v32 = *v29;
              v29 += 24;
              *(_BYTE *)(v31 + 16) = v32;
            }
            while (v28 > v30++);
          }
          v6 = 1;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          v18 = v42 - 6;
          std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)&v43, (_QWORD *)v42 - 12);
          v42 = v18;
          goto LABEL_23;
        case 0xFFFFFC20:
          v19 = *(v12 - 5);
          *(_OWORD *)v37 = *v16;
          *(_OWORD *)&v37[16] = v19;
          memset(&v37[32], 0, 24);
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v37[32], *((__int128 **)v12 - 8), *((__int128 **)v12 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v12 - 7) - *((_QWORD *)v12 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v39[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((__int128 **)v12 - 5), *((__int128 **)v12 - 4), (uint64_t)(*((_QWORD *)v12 - 4) - *((_QWORD *)v12 - 5)) >> 4);
          v20 = *v15;
          *(_QWORD *)((char *)&v39[1] + 5) = *(_QWORD *)((char *)v12 - 11);
          v39[1] = v20;
          (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)*v15 + 24))(*v15, 1, v12 - 6);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v39[1] + 24))(v39[1], 0, v37);
          v21 = v42;
          if ((unint64_t)v42 >= v43)
          {
            v42 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v41, (uint64_t)v37);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v22 = *(_OWORD *)&v37[16];
            *v42 = *(_OWORD *)v37;
            v21[1] = v22;
            *((_QWORD *)v21 + 4) = 0;
            *((_QWORD *)v21 + 5) = 0;
            *((_QWORD *)v21 + 6) = 0;
            *((_QWORD *)v21 + 7) = 0;
            v21[2] = *(_OWORD *)&v37[32];
            *((_QWORD *)v21 + 6) = *(_QWORD *)&v37[48];
            memset(&v37[32], 0, 24);
            *((_QWORD *)v21 + 8) = 0;
            *((_QWORD *)v21 + 9) = 0;
            *(_OWORD *)((char *)v21 + 56) = *(_OWORD *)__p;
            *((_QWORD *)v21 + 9) = v39[0];
            __p[0] = 0;
            __p[1] = 0;
            v39[0] = 0;
            v23 = v39[1];
            *(_QWORD *)((char *)v21 + 85) = *(_QWORD *)((char *)&v39[1] + 5);
            *((_QWORD *)v21 + 10) = v23;
            v42 = v21 + 6;
          }
          if (*(_QWORD *)&v37[32])
          {
            *(_QWORD *)&v37[40] = *(_QWORD *)&v37[32];
            operator delete(*(void **)&v37[32]);
          }
LABEL_23:
          v12 = v42;
          ++v13;
          if (v41 != v42)
            continue;
          v6 = 0;
          break;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  *(_QWORD *)v37 = &v41;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v37);
  return v6;
}

void sub_20ADB4D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  uint64_t v18;

  std::__state<char>::~__state(&a13);
  a13 = v18 - 112;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a13);
  _Unwind_Resume(a1);
}

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  std::sub_match<const char *> *value;
  std::sub_match<const char *> *begin;
  unint64_t v8;
  std::vector<std::csub_match>::size_type v9;
  unint64_t v10;
  std::vector<std::csub_match>::pointer v11;
  std::sub_match<const char *> *v12;
  std::vector<std::csub_match>::size_type v13;
  std::pair<const char *, const char *> v14;
  std::vector<std::csub_match>::pointer end;
  std::vector<std::csub_match>::size_type v16;
  std::vector<std::csub_match>::size_type v17;
  std::vector<std::csub_match>::value_type *v18;
  std::sub_match<const char *> *v19;
  std::vector<std::csub_match>::size_type v20;
  std::pair<const char *, const char *> v21;

  value = this->__end_cap_.__value_;
  begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) >= __n)
  {
    end = this->__end_;
    v16 = end - begin;
    if (v16 >= __n)
      v17 = __n;
    else
      v17 = end - begin;
    if (v17)
    {
      v18 = begin;
      do
      {
        *v18++ = *__u;
        --v17;
      }
      while (v17);
    }
    if (__n <= v16)
    {
      this->__end_ = &begin[__n];
    }
    else
    {
      v19 = &end[__n - v16];
      v20 = 24 * __n - 24 * v16;
      do
      {
        v21 = __u->std::pair<const char *, const char *>;
        *(_QWORD *)&end->matched = *(_QWORD *)&__u->matched;
        end->std::pair<const char *, const char *> = v21;
        ++end;
        v20 -= 24;
      }
      while (v20);
      this->__end_ = v19;
    }
  }
  else
  {
    if (begin)
    {
      this->__end_ = begin;
      operator delete(begin);
      value = 0;
      this->__begin_ = 0;
      this->__end_ = 0;
      this->__end_cap_.__value_ = 0;
    }
    if (__n > 0xAAAAAAAAAAAAAAALL)
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    v9 = 2 * v8;
    if (2 * v8 <= __n)
      v9 = __n;
    if (v8 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v9;
    std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](this, v10);
    v11 = this->__end_;
    v12 = &v11[__n];
    v13 = 24 * __n;
    do
    {
      v14 = __u->std::pair<const char *, const char *>;
      *(_QWORD *)&v11->matched = *(_QWORD *)&__u->matched;
      v11->std::pair<const char *, const char *> = v14;
      ++v11;
      v13 -= 24;
    }
    while (v13);
    this->__end_ = v12;
  }
}

char *std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

_QWORD *std::__state<char>::~__state(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void std::vector<std::sub_match<char const*>>::resize(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __sz, std::vector<std::csub_match>::const_reference __x)
{
  std::vector<std::csub_match>::size_type v3;
  BOOL v4;
  std::vector<std::csub_match>::size_type v5;

  v3 = 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3);
  v4 = __sz >= v3;
  v5 = __sz - v3;
  if (v5 != 0 && v4)
  {
    std::vector<std::sub_match<char const*>>::__append(this, v5, __x);
  }
  else if (!v4)
  {
    this->__end_ = &this->__begin_[__sz];
  }
}

void std::vector<std::pair<unsigned long,char const*>>::resize(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __sz)
{
  std::vector<std::pair<unsigned long, const char *>>::size_type v2;

  v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2)
      this->__end_ = &this->__begin_[__sz];
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append(this, __sz - v2);
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 12);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADB50A8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 16);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADB50F4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  void *v16[5];

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL)
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x155555555555555)
    v9 = 0x2AAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v16[4] = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char>>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[96 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[96 * v9];
  v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v11 = *(_OWORD *)a2;
  *((_OWORD *)v11 + 1) = v12;
  *((_QWORD *)v11 + 5) = 0;
  *((_QWORD *)v11 + 6) = 0;
  *((_QWORD *)v11 + 4) = 0;
  *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
  *((_QWORD *)v11 + 6) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *((_QWORD *)v11 + 7) = 0;
  *((_QWORD *)v11 + 8) = 0;
  *((_QWORD *)v11 + 9) = 0;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((_QWORD *)v11 + 9) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v13 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v11 + 85) = *(_QWORD *)(a2 + 85);
  *((_QWORD *)v11 + 10) = v13;
  v16[2] = v11 + 96;
  std::vector<std::__state<char>>::__swap_out_circular_buffer(a1, v16);
  v14 = a1[1];
  std::__split_buffer<std::__state<char>>::~__split_buffer(v16);
  return v14;
}

void sub_20ADB5240(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::__state<char>>::~__split_buffer((void **)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::__state<char>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::__state<char>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(96 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>,std::reverse_iterator<std::__state<char>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
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
    do
    {
      v8 = *(_OWORD *)(a3 - 80);
      *(_OWORD *)(v7 - 96) = *(_OWORD *)(a3 - 96);
      *(_OWORD *)(v7 - 80) = v8;
      *(_QWORD *)(v7 - 56) = 0;
      *(_QWORD *)(v7 - 48) = 0;
      *(_QWORD *)(v7 - 64) = 0;
      *(_OWORD *)(v7 - 64) = *(_OWORD *)(a3 - 64);
      *(_QWORD *)(v7 - 48) = *(_QWORD *)(a3 - 48);
      *(_QWORD *)(a3 - 64) = 0;
      *(_QWORD *)(a3 - 56) = 0;
      *(_QWORD *)(a3 - 48) = 0;
      *(_QWORD *)(v7 - 40) = 0;
      *(_QWORD *)(v7 - 32) = 0;
      *(_QWORD *)(v7 - 24) = 0;
      *(_OWORD *)(v7 - 40) = *(_OWORD *)(a3 - 40);
      *(_QWORD *)(v7 - 24) = *(_QWORD *)(a3 - 24);
      *(_QWORD *)(a3 - 40) = 0;
      *(_QWORD *)(a3 - 32) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v9 = *(_QWORD *)(a3 - 16);
      *(_QWORD *)(v7 - 11) = *(_QWORD *)(a3 - 11);
      *(_QWORD *)(v7 - 16) = v9;
      v7 = *((_QWORD *)&v15 + 1) - 96;
      *((_QWORD *)&v15 + 1) -= 96;
      a3 -= 96;
    }
    while (a3 != a5);
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::__state<char>>,std::reverse_iterator<std::__state<char>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(_QWORD **)(a1[2] + 8);
  v2 = *(_QWORD **)(a1[1] + 8);
  if (v1 != v2)
  {
    v3 = *a1;
    do
    {
      std::allocator<std::__state<char>>::destroy[abi:ne180100](v3, v1);
      v1 += 12;
    }
    while (v1 != v2);
  }
}

void std::allocator<std::__state<char>>::destroy[abi:ne180100](uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;

  v3 = (void *)a2[7];
  if (v3)
  {
    a2[8] = v3;
    operator delete(v3);
  }
  v4 = (void *)a2[4];
  if (v4)
  {
    a2[5] = v4;
    operator delete(v4);
  }
}

void **std::__split_buffer<std::__state<char>>::~__split_buffer(void **a1)
{
  std::__split_buffer<std::__state<char>>::clear[abi:ne180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<std::__state<char>>::clear[abi:ne180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 96;
    std::allocator<std::__state<char>>::destroy[abi:ne180100](v4, (_QWORD *)(i - 96));
  }
}

void std::vector<std::sub_match<char const*>>::__append(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __x)
{
  std::__compressed_pair<std::csub_match *> *p_end_cap;
  std::sub_match<const char *> *v7;
  std::sub_match<const char *> *value;
  std::sub_match<const char *> *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  std::sub_match<const char *> *v15;
  std::vector<std::csub_match>::size_type v16;
  std::pair<const char *, const char *> v17;
  std::sub_match<const char *> *v18;
  std::sub_match<const char *> *v19;
  std::vector<std::csub_match>::size_type v20;
  std::pair<const char *, const char *> *v21;
  std::pair<const char *, const char *> v22;
  std::sub_match<const char *> *v23;
  std::sub_match<const char *> *end;
  std::vector<std::csub_match>::pointer begin;
  std::pair<const char *, const char *> v26;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v7 = value;
  v9 = p_end_cap[-1].__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v9) >> 3) >= __n)
  {
    if (__n)
    {
      v15 = &v9[__n];
      v16 = 24 * __n;
      do
      {
        v17 = __x->std::pair<const char *, const char *>;
        *(_QWORD *)&v9->matched = *(_QWORD *)&__x->matched;
        v9->std::pair<const char *, const char *> = v17;
        ++v9;
        v16 -= 24;
      }
      while (v16);
      v9 = v15;
    }
    this->__end_ = v9;
  }
  else
  {
    v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (char *)this->__begin_) >> 3);
    v11 = v10 + __n;
    if (v10 + __n > 0xAAAAAAAAAAAAAAALL)
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (char *)this->__begin_) >> 3);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0x555555555555555)
      v13 = 0xAAAAAAAAAAAAAAALL;
    else
      v13 = v11;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)p_end_cap, v13);
    else
      v14 = 0;
    v18 = (std::sub_match<const char *> *)&v14[24 * v10];
    v19 = &v18[__n];
    v20 = 24 * __n;
    v21 = v18;
    do
    {
      v22 = __x->std::pair<const char *, const char *>;
      v21[1].first = *(const char **)&__x->matched;
      *v21 = v22;
      v21 = (std::pair<const char *, const char *> *)((char *)v21 + 24);
      v20 -= 24;
    }
    while (v20);
    v23 = (std::sub_match<const char *> *)&v14[24 * v13];
    begin = this->__begin_;
    end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        v26 = end[-1].std::pair<const char *, const char *>;
        *(_QWORD *)&v18[-1].matched = *(_QWORD *)&end[-1].matched;
        v18[-1].std::pair<const char *, const char *> = v26;
        --v18;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v18;
    this->__end_ = v19;
    this->__end_cap_.__value_ = v23;
    if (end)
      operator delete(end);
  }
}

void std::vector<std::pair<unsigned long,char const*>>::__append(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __n)
{
  std::__compressed_pair<std::pair<unsigned long, const char *> *, std::allocator<std::pair<unsigned long, const char *>>> *p_end_cap;
  std::pair<unsigned long, const char *> *v5;
  std::pair<unsigned long, const char *> *value;
  std::pair<unsigned long, const char *> *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  std::pair<unsigned long, const char *> *v14;
  std::pair<unsigned long, const char *> *v15;
  std::pair<unsigned long, const char *> *v16;
  std::pair<unsigned long, const char *> *end;
  std::vector<std::pair<unsigned long, const char *>>::pointer begin;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v5 = value;
  v7 = p_end_cap[-1].__value_;
  if (__n <= value - v7)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 16 * __n);
      v7 += __n;
    }
    this->__end_ = v7;
  }
  else
  {
    v8 = (char *)v7 - (char *)this->__begin_;
    v9 = __n + (v8 >> 4);
    if (v9 >> 60)
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 4;
    v11 = (char *)v5 - (char *)this->__begin_;
    if (v11 >> 3 > v9)
      v9 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>((uint64_t)p_end_cap, v12);
    else
      v13 = 0;
    v14 = (std::pair<unsigned long, const char *> *)&v13[16 * v10];
    v15 = (std::pair<unsigned long, const char *> *)&v13[16 * v12];
    bzero(v14, 16 * __n);
    v16 = &v14[__n];
    begin = this->__begin_;
    end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        v14[-1] = end[-1];
        --v14;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v14;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v15;
    if (end)
      operator delete(end);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

char *std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  uint64_t v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](result, a4);
    v7 = *((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2;
      *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
      *(_OWORD *)v7 = v8;
      v7 += 24;
      a2 = (__int128 *)((char *)a2 + 24);
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_20ADB583C(_Unwind_Exception *exception_object)
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

char *std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  _OWORD *v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](result, a4);
    v7 = (_OWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_20ADB58AC(_Unwind_Exception *exception_object)
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

char *std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<unsigned long,char const*>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_atom_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v5;
  unsigned __int8 *result;

  if (a2 == a3 || *a2 != 92)
    return a2;
  v5 = a2 + 1;
  if (a2 + 1 == a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  result = std::basic_regex<char,std::regex_traits<char>>::__parse_decimal_escape<char const*>(a1, a2 + 1, a3);
  if (result == v5)
  {
    result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<char const*>(a1, (char *)a2 + 1, (char *)a3);
    if (result == v5)
    {
      result = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, (std::basic_regex<char> *)(a2 + 1), (std::basic_regex<char> *)a3, 0);
      if (result == v5)
        return a2;
    }
  }
  return result;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>(uint64_t a1, char *a2, char *a3)
{
  char *v5;
  std::__bracket_expression<char, std::regex_traits<char>> *started;
  uint64_t *v7;
  char *v8;

  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3)
      goto LABEL_20;
    v5 = a2[1] == 94 ? a2 + 2 : a2 + 1;
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list((std::basic_regex<char> *)a1, a2[1] == 94);
    if (v5 == a3)
      goto LABEL_20;
    v7 = (uint64_t *)started;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v5 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)started, 93);
      ++v5;
    }
    if (v5 == a3)
      goto LABEL_20;
    do
    {
      v8 = v5;
      v5 = std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<char const*>(a1, v5, a3, v7);
    }
    while (v5 != v8);
    if (v8 == a3)
      goto LABEL_20;
    if (*v8 == 45)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v7, 45);
      ++v8;
    }
    if (v8 == a3 || *v8 != 93)
LABEL_20:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
    return v8 + 1;
  }
  return a2;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(std::basic_regex<char> *this)
{
  uint64_t v2;
  unsigned int v3;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if ((this->__flags_ & 2) == 0)
  {
    v2 = operator new();
    v3 = this->__marked_count_ + 1;
    this->__marked_count_ = v3;
    end = this->__end_;
    first = end->__first_;
    *(_QWORD *)v2 = &unk_24C3CB798;
    *(_QWORD *)(v2 + 8) = first;
    *(_DWORD *)(v2 + 16) = v3;
    end->__first_ = (std::__node<char> *)v2;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  }
}

void std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(std::basic_regex<char> *this, unsigned int a2)
{
  uint64_t v4;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if ((this->__flags_ & 2) == 0)
  {
    v4 = operator new();
    end = this->__end_;
    first = end->__first_;
    *(_QWORD *)v4 = &unk_24C3CB768;
    *(_QWORD *)(v4 + 8) = first;
    *(_DWORD *)(v4 + 16) = a2;
    end->__first_ = (std::__node<char> *)v4;
    this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  }
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 11);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADB5C54(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_BYTE *std::basic_regex<char,std::regex_traits<char>>::__parse_pattern_character<char const*>(std::basic_regex<char> *a1, _BYTE *a2, _BYTE *a3)
{
  _BYTE *v3;
  int v4;
  BOOL v5;

  v3 = a2;
  if (a2 != a3)
  {
    v4 = (char)*a2;
    v5 = (v4 - 36) > 0x3A || ((1 << (*a2 - 36)) & 0x7800000080004F1) == 0;
    if (v5 && (v4 - 123) >= 3)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v4);
      ++v3;
    }
  }
  return v3;
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x20BD3126CLL);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 3);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADB5DA8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_decimal_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v4;
  unsigned int v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int v8;

  if (a2 == a3)
    return a2;
  v4 = *a2;
  v5 = v4 - 48;
  if (v4 == 48)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
    return a2 + 1;
  }
  if ((v4 - 49) > 8)
    return a2;
  v6 = a3;
  v7 = a2 + 1;
  if (a2 + 1 != a3)
  {
    while (1)
    {
      v8 = *v7;
      if ((v8 - 48) > 9)
        break;
      if (v5 >= 0x19999999)
        goto LABEL_16;
      ++v7;
      v5 = v8 + 10 * v5 - 48;
      if (v7 == a3)
        goto LABEL_12;
    }
    v6 = v7;
LABEL_12:
    if (!v5)
      goto LABEL_16;
  }
  if (v5 > a1->__marked_count_)
LABEL_16:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(a1, v5);
  return v6;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_character_class_escape<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  char *v3;
  int v4;
  BOOL v5;
  BOOL v6;
  std::__bracket_expression<char, std::regex_traits<char>> *started;
  int v8;
  BOOL v9;
  std::__bracket_expression<char, std::regex_traits<char>> *v10;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v4 = *a2;
  if (v4 > 99)
  {
    if (v4 == 119)
    {
      v5 = 0;
      goto LABEL_15;
    }
    if (v4 == 115)
    {
      v9 = 0;
      goto LABEL_17;
    }
    if (v4 != 100)
      return v3;
    v6 = 0;
LABEL_12:
    started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v6);
    v8 = started->__mask_ | 0x400;
LABEL_18:
    started->__mask_ = v8;
    goto LABEL_19;
  }
  switch(v4)
  {
    case 'D':
      v6 = 1;
      goto LABEL_12;
    case 'S':
      v9 = 1;
LABEL_17:
      started = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v9);
      v8 = started->__mask_ | 0x4000;
      goto LABEL_18;
    case 'W':
      v5 = 1;
LABEL_15:
      v10 = std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(a1, v5);
      v10->__mask_ |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v10, 95);
LABEL_19:
      ++v3;
      break;
  }
  return v3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::string *a4)
{
  std::basic_regex<char> *v4;
  int locale_low;
  char v6;
  std::string *v7;
  std::basic_regex<char>::value_type locale;
  int v9;
  int v10;
  char v11;
  int v12;
  char v13;
  int v14;
  char v15;
  std::string::value_type v16;
  char v17;
  std::string::value_type v18;

  v4 = this;
  if (this != a3)
  {
    locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
    if (locale_low > 109)
    {
      v6 = 0;
      switch(LOBYTE(this->__traits_.__loc_.__locale_))
      {
        case 'n':
          if (a4)
          {
            v7 = a4;
            locale = 10;
            goto LABEL_50;
          }
          locale = 10;
          goto LABEL_59;
        case 'r':
          if (a4)
          {
            v7 = a4;
            locale = 13;
            goto LABEL_50;
          }
          locale = 13;
          goto LABEL_59;
        case 't':
          if (a4)
          {
            v7 = a4;
            locale = 9;
            goto LABEL_50;
          }
          locale = 9;
          goto LABEL_59;
        case 'u':
          if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3)
            goto LABEL_64;
          v9 = BYTE1(this->__traits_.__loc_.__locale_);
          if ((v9 & 0xF8) != 0x30 && (v9 & 0xFE) != 0x38 && (v9 | 0x20u) - 97 >= 6)
            goto LABEL_64;
          v4 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2);
          if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) == a3)
            goto LABEL_64;
          v10 = LOBYTE(v4->__traits_.__loc_.__locale_);
          v11 = -48;
          if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38)
            goto LABEL_24;
          v10 |= 0x20u;
          if ((v10 - 97) >= 6)
            goto LABEL_64;
          v11 = -87;
LABEL_24:
          v6 = 16 * (v11 + v10);
LABEL_25:
          if ((std::basic_regex<char> *)((char *)&v4->__traits_.__loc_.__locale_ + 1) == a3)
            goto LABEL_64;
          v12 = BYTE1(v4->__traits_.__loc_.__locale_);
          v13 = -48;
          if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38)
            goto LABEL_30;
          v12 |= 0x20u;
          if ((v12 - 97) >= 6)
            goto LABEL_64;
          v13 = -87;
LABEL_30:
          if ((std::basic_regex<char> *)((char *)&v4->__traits_.__loc_.__locale_ + 2) == a3)
            goto LABEL_64;
          v14 = BYTE2(v4->__traits_.__loc_.__locale_);
          v15 = -48;
          if ((v14 & 0xF8) == 0x30 || (v14 & 0xFE) == 0x38)
            goto LABEL_35;
          v14 |= 0x20u;
          if ((v14 - 97) >= 6)
            goto LABEL_64;
          v15 = -87;
LABEL_35:
          v16 = v15 + v14 + 16 * (v13 + v12 + v6);
          if (a4)
            std::string::operator=(a4, v16);
          else
            std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v16);
          return (std::basic_regex<char> *)((char *)v4 + 3);
        case 'v':
          if (a4)
          {
            v7 = a4;
            locale = 11;
            goto LABEL_50;
          }
          locale = 11;
          break;
        case 'x':
          goto LABEL_25;
        default:
          goto LABEL_45;
      }
      goto LABEL_59;
    }
    if (locale_low == 48)
    {
      if (a4)
      {
        v7 = a4;
        locale = 0;
        goto LABEL_50;
      }
      locale = 0;
LABEL_59:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, locale);
      return (std::basic_regex<char> *)((char *)v4 + 1);
    }
    if (locale_low != 99)
    {
      if (locale_low == 102)
      {
        if (a4)
        {
          v7 = a4;
          locale = 12;
LABEL_50:
          std::string::operator=(v7, locale);
          return (std::basic_regex<char> *)((char *)v4 + 1);
        }
        locale = 12;
        goto LABEL_59;
      }
LABEL_45:
      if (LOBYTE(this->__traits_.__loc_.__locale_) != 95
        && ((locale_low & 0x80) != 0
         || (a1->__traits_.__ct_->__tab_[LOBYTE(this->__traits_.__loc_.__locale_)] & 0x500) == 0))
      {
        locale = (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_;
        if (a4)
        {
          v7 = a4;
          goto LABEL_50;
        }
        goto LABEL_59;
      }
LABEL_64:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
    }
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3)
      goto LABEL_64;
    v17 = BYTE1(this->__traits_.__loc_.__locale_);
    if (((v17 & 0xDF) - 65) > 0x19u)
      goto LABEL_64;
    v18 = v17 & 0x1F;
    if (a4)
      std::string::operator=(a4, v18);
    else
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v18);
    return (std::basic_regex<char> *)((char *)v4 + 2);
  }
  return v4;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  uint64_t v2;
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  uint64_t v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  uint64_t v8;
  std::__node<char> *first;

  v2 = __c;
  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = operator new();
    std::__match_char_icase<char,std::regex_traits<char>>::__match_char_icase[abi:ne180100](v8, (uint64_t)this, v2, (uint64_t)this->__end_->__first_);
LABEL_6:
    this->__end_->__first_ = (std::__node<char> *)v8;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = operator new();
    first = this->__end_->__first_;
    *(_QWORD *)v8 = &unk_24C3CB670;
    *(_QWORD *)(v8 + 8) = first;
    std::locale::locale((std::locale *)(v8 + 16), &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    *(_BYTE *)(v8 + 40) = v2;
    goto LABEL_6;
  }
  v5 = operator new();
  end = this->__end_;
  v7 = end->__first_;
  *(_QWORD *)v5 = &unk_24C3CB460;
  *(_QWORD *)(v5 + 8) = v7;
  *(_BYTE *)(v5 + 16) = v2;
  end->__first_ = (std::__node<char> *)v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_20ADB6310(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD3126C](v1, 0x10E1C4010F5D982);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 4);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADB636C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  uint64_t v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  std::locale *v8;
  std::locale *v9;
  std::__node<char> *first;
  char *v11;

  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = (std::locale *)operator new();
    v9 = v8;
    first = this->__end_->__first_;
LABEL_6:
    v8->__locale_ = (std::locale::__imp *)(v11 + 16);
    v8[1].__locale_ = (std::locale::__imp *)first;
    std::locale::locale(v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)&this->__traits_.__ct_;
    LODWORD(v9[5].__locale_) = __i;
    this->__end_->__first_ = (std::__node<char> *)v9;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = (std::locale *)operator new();
    v9 = v8;
    first = this->__end_->__first_;
    goto LABEL_6;
  }
  v5 = operator new();
  end = this->__end_;
  v7 = end->__first_;
  *(_QWORD *)v5 = &unk_24C3CB370;
  *(_QWORD *)(v5 + 8) = v7;
  *(_DWORD *)(v5 + 16) = __i;
  end->__first_ = (std::__node<char> *)v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__match_char_icase[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)a1 = &unk_24C3CB5E0;
  *(_QWORD *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 40) = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 8) + 40))(*(_QWORD *)(a2 + 8), a3);
  return a1;
}

void sub_20ADB64E8(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);
  std::locale *v2;
  void (__cdecl **v4)(std::__owns_one_state<char> *__hidden);

  std::locale::~locale(v2);
  v4 = v1[1];
  if (v4)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  _Unwind_Resume(a1);
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24C3CB5E0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24C3CB5E0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x20BD3126CLL);
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (v4 = result,
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(result + 24) + 40))(*(_QWORD *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(v4 + 8);
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24C3CB670;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24C3CB670;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x20BD3126CLL);
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

void (__cdecl ***std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_char<char>::~__match_char(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x20BD3126CLL);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24C3CB4F0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24C3CB4F0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x20BD3126CLL);
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v3 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(_BYTE *)(v3 + 16))
  {
    v4 = *(_QWORD *)(v3 + 8) - *(_QWORD *)v3;
    v5 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v5 >= v4)
    {
      v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v5 + v4;
        v6 = *(_QWORD *)(v7 + 8);
        goto LABEL_10;
      }
      v8 = 0;
      while (1)
      {
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)v3 + v8));
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)(a2 + 16) + v8));
        if (v9 != (_DWORD)result)
          break;
        if (v4 == ++v8)
        {
          v5 = *(_QWORD *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(_QWORD *)(a2 + 80) = v6;
  return result;
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24C3CB5B0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_24C3CB5B0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x20BD3126CLL);
}

uint64_t std::__back_ref_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  unsigned __int8 **v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;

  v2 = *(_DWORD *)(result + 40) - 1;
  v3 = *(_QWORD *)(a2 + 32);
  if (*(_BYTE *)(v3 + 24 * v2 + 16))
  {
    v4 = (unsigned __int8 **)(v3 + 24 * v2);
    v5 = *v4;
    v6 = v4[1] - *v4;
    v7 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v7 + v6;
        v8 = *(_QWORD *)(result + 8);
        goto LABEL_9;
      }
      v9 = *(unsigned __int8 **)(a2 + 16);
      v10 = v6;
      while (1)
      {
        v12 = *v5++;
        v11 = v12;
        v13 = *v9++;
        if (v11 != v13)
          break;
        if (!--v10)
          goto LABEL_8;
      }
    }
  }
  v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(_QWORD *)(a2 + 80) = v8;
  return result;
}

void (__cdecl ***std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__back_ref<char>::~__back_ref(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x20BD3126CLL);
}

unsigned int *std::__back_ref<char>::__exec(unsigned int *result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = result[4];
  v3 = *(_QWORD *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a2 + 40) - v3) >> 3) < v2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  v5 = v2 - 1;
  if (*(_BYTE *)(v3 + 24 * v5 + 16)
    && (v6 = result,
        v7 = v3 + 24 * v5,
        result = *(unsigned int **)v7,
        v8 = *(_QWORD *)(v7 + 8) - *(_QWORD *)v7,
        v9 = *(_QWORD *)(a2 + 16),
        *(_QWORD *)(a2 + 24) - v9 >= v8)
    && (result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !(_DWORD)result))
  {
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 16) = v9 + v8;
    v10 = *((_QWORD *)v6 + 1);
  }
  else
  {
    v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v10;
  return result;
}

std::__bracket_expression<char, std::regex_traits<char>> *__cdecl std::basic_regex<char,std::regex_traits<char>>::__start_matching_list(std::basic_regex<char> *this, BOOL __negate)
{
  std::__bracket_expression<char, std::regex_traits<char>> *v4;

  v4 = (std::__bracket_expression<char, std::regex_traits<char>> *)operator new();
  std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v4, (uint64_t)this, (uint64_t)this->__end_->__first_, __negate, this->__flags_ & 1, (this->__flags_ & 8) != 0);
  this->__end_->__first_ = v4;
  this->__end_ = v4;
  return v4;
}

void sub_20ADB6CFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD3126C](v1, 0x10F1C4061CF1F02);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _BYTE *v22;
  char v23;
  unint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  _BYTE *v29;
  char v30;
  _BYTE *v31;
  char v32;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      v6 = (unint64_t *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = &v5[-v7];
      v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        v10 = v4 - v7;
        if (2 * v10 > v9)
          v9 = 2 * v10;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
          v12 = operator new(v11);
        else
          v12 = 0;
        v20 = &v8[(_QWORD)v12];
        v21 = (char *)v12 + v11;
        v8[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v8[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          v22 = &v5[~v7];
          do
          {
            v23 = *--v5;
            (v22--)[(_QWORD)v12] = v23;
          }
          while (v5 != (_BYTE *)v7);
LABEL_45:
          v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  v6 = (unint64_t *)(a1 + 40);
  v5 = *(_BYTE **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v12 = operator new(v28);
        else
          v12 = 0;
        v20 = &v25[(_QWORD)v12];
        v21 = (char *)v12 + v28;
        v25[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v25[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(_QWORD)v12] = v32;
          }
          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13)
    goto LABEL_22;
  v14 = *v6;
  v15 = &v5[-*v6];
  v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0)
    goto LABEL_50;
  v17 = v13 - v14;
  if (2 * v17 > v16)
    v16 = 2 * v17;
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL)
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
    v12 = operator new(v18);
  else
    v12 = 0;
  v20 = &v15[(_QWORD)v12];
  v21 = (char *)v12 + v18;
  v15[(_QWORD)v12] = v2;
  v19 = (uint64_t)&v15[(_QWORD)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    v29 = &v5[~v14];
    do
    {
      v30 = *--v5;
      (v29--)[(_QWORD)v12] = v30;
    }
    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }
LABEL_46:
  v12 = v20;
LABEL_47:
  *(_QWORD *)(a1 + 40) = v12;
  *(_QWORD *)(a1 + 48) = v19;
  *(_QWORD *)(a1 + 56) = v21;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 48) = v19;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  const std::locale *v11;
  __int128 v12;
  BOOL v13;
  std::locale v15;
  std::string v16;

  *(_QWORD *)(a1 + 8) = a3;
  v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  v12 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 24) = v12;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_BYTE *)(a1 + 168) = a4;
  *(_BYTE *)(a1 + 169) = a5;
  *(_BYTE *)(a1 + 170) = a6;
  std::locale::locale(&v15, v11);
  std::locale::name(&v16, &v15);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
  {
    v13 = v16.__r_.__value_.__l.__size_ != 1 || *v16.__r_.__value_.__l.__data_ != 67;
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  else
  {
    v13 = SHIBYTE(v16.__r_.__value_.__r.__words[2]) != 1 || v16.__r_.__value_.__s.__data_[0] != 67;
  }
  std::locale::~locale(&v15);
  *(_BYTE *)(a1 + 171) = v13;
  return a1;
}

void sub_20ADB705C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10)
{
  void (__cdecl ***v10)(std::__owns_one_state<char> *__hidden);
  std::locale *v11;
  void **v12;
  void (__cdecl **v14)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v15)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v16)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v17)(std::__owns_one_state<char> *__hidden);

  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  v14 = v10[14];
  if (v14)
  {
    v10[15] = v14;
    operator delete(v14);
  }
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  v15 = v10[8];
  if (v15)
  {
    v10[9] = v15;
    operator delete(v15);
  }
  v16 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))*v12;
  if (*v12)
  {
    v10[6] = v16;
    operator delete(v16);
  }
  std::locale::~locale(v11);
  v17 = v10[1];
  if (v17)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v17 + 1))(v17);
  _Unwind_Resume(a1);
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  v7 = a1 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return a1;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  v7 = a1 + 17;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v7);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return MEMORY[0x20BD3126C](a1, 0x10F1C4061CF1F02);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  char *current;
  char *last;
  signed __int8 v6;
  signed __int8 v7;
  std::regex_traits<char> *p_traits;
  std::vector<std::pair<char, char>>::pointer begin;
  uint64_t v10;
  uint64_t v11;
  char *p_second;
  std::vector<std::pair<std::string, std::string>>::pointer v14;
  char v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  size_t v19;
  const void *p_p;
  uint64_t v21;
  BOOL v22;
  int v23;
  size_t size;
  std::vector<std::pair<std::string, std::string>>::pointer v25;
  size_t v26;
  int v27;
  _BOOL4 v28;
  int v29;
  size_t v30;
  std::string *data;
  size_t v32;
  int v33;
  BOOL v34;
  int v35;
  _BOOL4 negate;
  uint64_t v37;
  size_t v38;
  unsigned __int8 v39;
  std::vector<char>::pointer v40;
  unint64_t v41;
  int v42;
  std::regex_traits<char>::char_class_type v43;
  int v44;
  std::vector<char>::pointer end;
  std::vector<char>::pointer v46;
  char *v47;
  std::vector<std::pair<std::string, std::string>>::pointer v48;
  std::vector<std::pair<std::string, std::string>>::pointer v49;
  int64_t v50;
  uint64_t v51;
  unint64_t v52;
  size_t v53;
  const void *v54;
  uint64_t v55;
  BOOL v56;
  int v57;
  size_t v58;
  std::vector<std::pair<std::string, std::string>>::pointer v59;
  size_t v60;
  int v61;
  _BOOL4 v62;
  int v63;
  size_t v64;
  std::string *v65;
  size_t v66;
  int v67;
  BOOL v68;
  std::vector<std::string>::pointer v69;
  uint64_t v70;
  int64_t v71;
  uint64_t v72;
  unint64_t v73;
  void *v74;
  size_t v75;
  size_t v76;
  uint64_t v77;
  BOOL v78;
  std::string *v79;
  std::string::size_type v80;
  int v81;
  std::string *v82;
  void **v83;
  uint64_t v84;
  unint64_t v85;
  int v86;
  std::regex_traits<char>::char_class_type v87;
  int v88;
  std::vector<std::string>::pointer v89;
  uint64_t v90;
  int64_t v91;
  uint64_t v92;
  unint64_t v93;
  size_t v94;
  void *v95;
  size_t v96;
  uint64_t v97;
  BOOL v98;
  std::string *v99;
  std::string::size_type v100;
  int v101;
  std::string *v102;
  void **v103;
  uint64_t v104;
  int v105;
  std::regex_traits<char>::char_class_type mask;
  const std::ctype_base::mask *tab;
  std::ctype_base::mask v108;
  std::regex_traits<char>::char_class_type neg_mask;
  int v110;
  std::__node<char> *first;
  int v112;
  char v113;
  char v114;
  uint64_t v115;
  _BOOL4 v116;
  _BOOL4 v117;
  unint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *__p;
  size_t v123;
  char v124;
  unsigned __int8 v125;
  unsigned __int8 v126;
  uint64_t v127;

  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    v37 = 0;
    negate = this->__negate_;
    goto LABEL_221;
  }
  if (!this->__might_have_digraph_ || current + 1 == last)
    goto LABEL_58;
  v6 = *current;
  v125 = *current;
  v7 = current[1];
  v126 = v7;
  if (this->__icase_)
  {
    v125 = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    v126 = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  p_traits = &this->__traits_;
  std::regex_traits<char>::__lookup_collatename<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v127, (uint64_t)&__p);
  if ((v124 & 0x80000000) == 0)
  {
    if (v124)
      goto LABEL_8;
LABEL_58:
    negate = 0;
    v37 = 1;
    goto LABEL_59;
  }
  v38 = v123;
  operator delete(__p);
  if (!v38)
    goto LABEL_58;
LABEL_8:
  begin = this->__digraphs_.__begin_;
  v10 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v10)
  {
    v11 = v10 >> 1;
    if ((unint64_t)(v10 >> 1) <= 1)
      v11 = 1;
    p_second = &begin->second;
    do
    {
      if (v125 == *(p_second - 1) && v126 == *p_second)
        goto LABEL_218;
      p_second += 2;
      --v11;
    }
    while (v11);
  }
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    negate = 0;
  }
  else
  {
    std::regex_traits<char>::transform<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v127);
    v14 = this->__ranges_.__begin_;
    v15 = v124;
    v16 = (char *)this->__ranges_.__end_ - (char *)v14;
    if (v16)
    {
      v17 = 0;
      v18 = v16 / 48;
      v113 = v124;
      if (v124 >= 0)
        v19 = v124;
      else
        v19 = v123;
      if (v124 >= 0)
        p_p = &__p;
      else
        p_p = __p;
      if (v18 <= 1)
        v21 = 1;
      else
        v21 = v16 / 48;
      v22 = 1;
      while (1)
      {
        v23 = SHIBYTE(v14->first.__r_.__value_.__r.__words[2]);
        if (v23 >= 0)
          size = HIBYTE(v14->first.__r_.__value_.__r.__words[2]);
        else
          size = v14->first.__r_.__value_.__l.__size_;
        if (v23 >= 0)
          v25 = v14;
        else
          v25 = (std::vector<std::pair<std::string, std::string>>::pointer)v14->first.__r_.__value_.__r.__words[0];
        if (size >= v19)
          v26 = v19;
        else
          v26 = size;
        v27 = memcmp(p_p, v25, v26);
        v28 = v19 >= size;
        if (v27)
          v28 = v27 >= 0;
        if (v28)
        {
          v29 = SHIBYTE(v14->second.__r_.__value_.__r.__words[2]);
          if (v29 >= 0)
            v30 = HIBYTE(v14->second.__r_.__value_.__r.__words[2]);
          else
            v30 = v14->second.__r_.__value_.__l.__size_;
          if (v29 >= 0)
            data = &v14->second;
          else
            data = (std::string *)v14->second.__r_.__value_.__l.__data_;
          if (v19 >= v30)
            v32 = v30;
          else
            v32 = v19;
          v33 = memcmp(data, p_p, v32);
          v34 = v30 >= v19;
          if (v33)
            v34 = v33 >= 0;
          if (v34)
            break;
        }
        v22 = ++v17 < v18;
        ++v14;
        if (v21 == v17)
        {
          v35 = 0;
          negate = 0;
          goto LABEL_162;
        }
      }
      negate = 1;
      v35 = 5;
LABEL_162:
      p_traits = &this->__traits_;
      v15 = v113;
    }
    else
    {
      v22 = 0;
      v35 = 0;
      negate = 0;
    }
    if (v15 < 0)
      operator delete(__p);
    if (v22)
      goto LABEL_195;
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
    goto LABEL_200;
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)p_traits, (char *)&v125, (char *)&v127, (uint64_t)&__p);
  v89 = this->__equivalences_.__begin_;
  v90 = v124;
  v91 = (char *)this->__equivalences_.__end_ - (char *)v89;
  if (v91)
  {
    v92 = 0;
    v93 = v91 / 24;
    v95 = __p;
    v94 = v123;
    if (v124 >= 0)
      v96 = v124;
    else
      v96 = v123;
    if (v93 <= 1)
      v97 = 1;
    else
      v97 = v91 / 24;
    v98 = 1;
    while (1)
    {
      v99 = &v89[v92];
      v100 = HIBYTE(v99->__r_.__value_.__r.__words[2]);
      v101 = (char)v100;
      if ((v100 & 0x80u) != 0)
        v100 = v99->__r_.__value_.__l.__size_;
      if (v96 == v100)
      {
        if (v101 >= 0)
          v102 = &v89[v92];
        else
          v102 = (std::string *)v99->__r_.__value_.__r.__words[0];
        if ((v90 & 0x80) == 0)
        {
          if ((_DWORD)v90)
          {
            v103 = &__p;
            v104 = v90;
            do
            {
              if (*(unsigned __int8 *)v103 != v102->__r_.__value_.__s.__data_[0])
                goto LABEL_188;
              v103 = (void **)((char *)v103 + 1);
              v102 = (std::string *)((char *)v102 + 1);
              --v104;
            }
            while (v104);
            negate = 1;
            v35 = 5;
            goto LABEL_192;
          }
          negate = 1;
          if (v98)
            goto LABEL_220;
LABEL_200:
          if ((char)v125 < 0)
          {
            neg_mask = this->__neg_mask_;
            goto LABEL_213;
          }
          mask = this->__mask_;
          tab = this->__traits_.__ct_->__tab_;
          v108 = tab[v125];
          if ((v108 & mask) == 0 && (v125 != 95 || (mask & 0x80) == 0)
            || (char)v126 < 0
            || (tab[v126] & mask) == 0 && ((mask & 0x80) == 0 || v126 != 95))
          {
            neg_mask = this->__neg_mask_;
            if ((v108 & neg_mask) != 0 || v125 == 95 && (neg_mask & 0x80) != 0)
            {
LABEL_217:
              v110 = negate;
              goto LABEL_219;
            }
LABEL_213:
            if (((char)v126 & 0x80000000) == 0)
            {
              if ((this->__traits_.__ct_->__tab_[v126] & neg_mask) != 0)
                goto LABEL_217;
              v110 = 1;
              if (v126 == 95 && (neg_mask & 0x80) != 0)
                goto LABEL_217;
LABEL_219:
              negate = v110;
LABEL_220:
              v37 = 2;
              goto LABEL_221;
            }
          }
LABEL_218:
          v110 = 1;
          goto LABEL_219;
        }
        v118 = v93;
        v121 = v90;
        v105 = memcmp(v95, v102, v94);
        v93 = v118;
        v90 = v121;
        if (!v105)
          break;
      }
LABEL_188:
      v98 = ++v92 < v93;
      if (v92 == v97)
        goto LABEL_191;
    }
    v35 = 5;
    negate = 1;
    goto LABEL_193;
  }
  v98 = 0;
LABEL_191:
  v35 = 0;
LABEL_192:
  if ((v90 & 0x80) != 0)
LABEL_193:
    operator delete(__p);
  if (!v98)
    goto LABEL_200;
LABEL_195:
  if (v35)
    goto LABEL_220;
  v37 = 2;
LABEL_59:
  v39 = *a2->__current_;
  v125 = v39;
  if (this->__icase_)
  {
    v39 = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v39);
    v125 = v39;
  }
  v40 = this->__chars_.__begin_;
  v41 = this->__chars_.__end_ - v40;
  if (v41)
  {
    if (v41 <= 1)
      v41 = 1;
    while (1)
    {
      v42 = *v40++;
      if (v42 == v39)
        break;
      if (!--v41)
        goto LABEL_66;
    }
LABEL_77:
    negate = 1;
    goto LABEL_221;
  }
LABEL_66:
  v43 = this->__neg_mask_;
  if (v43 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v39 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v39] & v43) == 0)
      v44 = (v39 == 95) & (v43 >> 7);
    else
      LOBYTE(v44) = 1;
    end = this->__neg_chars_.__end_;
    v46 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v39, end - this->__neg_chars_.__begin_);
    v47 = v46 ? v46 : end;
    if ((v44 & 1) == 0 && v47 == end)
      goto LABEL_77;
  }
  v49 = this->__ranges_.__begin_;
  v48 = this->__ranges_.__end_;
  if (v49 != v48)
  {
    if (this->__collate_)
    {
      std::regex_traits<char>::transform<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v126);
      v49 = this->__ranges_.__begin_;
      v48 = this->__ranges_.__end_;
    }
    else
    {
      v124 = 1;
      LOWORD(__p) = v39;
    }
    v50 = (char *)v48 - (char *)v49;
    if (v50)
    {
      v119 = v37;
      v116 = negate;
      v51 = 0;
      v52 = v50 / 48;
      v114 = v124;
      if (v124 >= 0)
        v53 = v124;
      else
        v53 = v123;
      if (v124 >= 0)
        v54 = &__p;
      else
        v54 = __p;
      if (v52 <= 1)
        v55 = 1;
      else
        v55 = v50 / 48;
      v56 = 1;
      while (1)
      {
        v57 = SHIBYTE(v49->first.__r_.__value_.__r.__words[2]);
        if (v57 >= 0)
          v58 = HIBYTE(v49->first.__r_.__value_.__r.__words[2]);
        else
          v58 = v49->first.__r_.__value_.__l.__size_;
        if (v57 >= 0)
          v59 = v49;
        else
          v59 = (std::vector<std::pair<std::string, std::string>>::pointer)v49->first.__r_.__value_.__r.__words[0];
        if (v58 >= v53)
          v60 = v53;
        else
          v60 = v58;
        v61 = memcmp(v54, v59, v60);
        v62 = v53 >= v58;
        if (v61)
          v62 = v61 >= 0;
        if (v62)
        {
          v63 = SHIBYTE(v49->second.__r_.__value_.__r.__words[2]);
          if (v63 >= 0)
            v64 = HIBYTE(v49->second.__r_.__value_.__r.__words[2]);
          else
            v64 = v49->second.__r_.__value_.__l.__size_;
          if (v63 >= 0)
            v65 = &v49->second;
          else
            v65 = (std::string *)v49->second.__r_.__value_.__l.__data_;
          if (v53 >= v64)
            v66 = v64;
          else
            v66 = v53;
          v67 = memcmp(v65, v54, v66);
          v68 = v64 >= v53;
          if (v67)
            v68 = v67 >= 0;
          if (v68)
            break;
        }
        v56 = ++v51 < v52;
        ++v49;
        if (v55 == v51)
        {
          negate = v116;
          goto LABEL_123;
        }
      }
      negate = 1;
LABEL_123:
      v37 = v119;
      if ((v114 & 0x80) == 0)
        goto LABEL_125;
    }
    else
    {
      v56 = 0;
      if ((v124 & 0x80) == 0)
        goto LABEL_125;
    }
    operator delete(__p);
LABEL_125:
    if (v56)
      goto LABEL_221;
  }
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
    goto LABEL_154;
  std::regex_traits<char>::__transform_primary<char *>((uint64_t)&this->__traits_, (char *)&v125, (char *)&v126, (uint64_t)&__p);
  v69 = this->__equivalences_.__begin_;
  v70 = v124;
  v71 = (char *)this->__equivalences_.__end_ - (char *)v69;
  if (v71)
  {
    v120 = v37;
    v72 = 0;
    v73 = v71 / 24;
    v74 = __p;
    v75 = v123;
    if (v124 >= 0)
      v76 = v124;
    else
      v76 = v123;
    if (v73 <= 1)
      v77 = 1;
    else
      v77 = v71 / 24;
    v78 = 1;
    while (1)
    {
      v79 = &v69[v72];
      v80 = HIBYTE(v79->__r_.__value_.__r.__words[2]);
      v81 = (char)v80;
      if ((v80 & 0x80u) != 0)
        v80 = v79->__r_.__value_.__l.__size_;
      if (v76 == v80)
      {
        if (v81 >= 0)
          v82 = &v69[v72];
        else
          v82 = (std::string *)v79->__r_.__value_.__r.__words[0];
        if ((v70 & 0x80) != 0)
        {
          v117 = negate;
          v85 = v73;
          v115 = v77;
          v86 = memcmp(v74, v82, v75);
          v77 = v115;
          v73 = v85;
          negate = v117;
          if (!v86)
          {
            negate = 1;
            v37 = v120;
            goto LABEL_152;
          }
        }
        else
        {
          if (!(_DWORD)v70)
          {
            negate = 1;
            v37 = v120;
            if (!v78)
              goto LABEL_154;
            goto LABEL_221;
          }
          v83 = &__p;
          v84 = v70;
          while (*(unsigned __int8 *)v83 == v82->__r_.__value_.__s.__data_[0])
          {
            v83 = (void **)((char *)v83 + 1);
            v82 = (std::string *)((char *)v82 + 1);
            if (!--v84)
            {
              negate = 1;
              goto LABEL_149;
            }
          }
        }
      }
      v78 = ++v72 < v73;
      if (v72 == v77)
      {
LABEL_149:
        v37 = v120;
        if ((v70 & 0x80) == 0)
          goto LABEL_153;
        goto LABEL_152;
      }
    }
  }
  v78 = 0;
  if (v124 < 0)
LABEL_152:
    operator delete(__p);
LABEL_153:
  if (!v78)
  {
LABEL_154:
    if ((char)v125 < 0)
      goto LABEL_221;
    v87 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v125] & v87) == 0)
    {
      v88 = (v87 >> 7) & 1;
      if (v125 != 95)
        v88 = 0;
      if (v88 != 1)
        goto LABEL_221;
    }
    goto LABEL_77;
  }
LABEL_221:
  if (negate == this->__negate_)
  {
    first = 0;
    v112 = -993;
  }
  else
  {
    a2->__current_ += v37;
    first = this->__first_;
    v112 = -995;
  }
  a2->__do_ = v112;
  a2->__node_ = first;
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

void std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100]((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::regex_traits<char>::transform<char *>(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4;
  void **v5;
  void *__p[2];
  unsigned __int8 v7;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  v4 = v7;
  if ((v7 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v7 & 0x80u) != 0)
    v4 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0)
    operator delete(__p[0]);
}

void sub_20ADB7CAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__lookup_collatename<char *>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string *p_s;
  unint64_t v7;
  unint64_t v8;
  std::string::size_type size;
  std::string *v10;
  int v11;
  uint64_t v12;
  std::string v13;
  std::string __s;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(&__s, a2, a3, a3 - a2);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__s.__r_.__value_.__s + 23))
      return;
    p_s = &__s;
  }
  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  v7 = v13.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a4 + 16) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      return;
    v10 = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a1 + 16) + 32))(&v13, *(_QWORD *)(a1 + 16), v10, (char *)v10 + size);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(std::string *)a4 = v13;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    v11 = *(unsigned __int8 *)(a4 + 23);
    if (v11 != 12 && v11 != 1)
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(a4 + 8);
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(_BYTE **)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
}

void sub_20ADB7E28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
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

void std::regex_traits<char>::__transform_primary<char *>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v7, (char *)v7 + v6);
  v8 = *(unsigned __int8 *)(a4 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0)
        v10 = (_BYTE *)a4;
      else
        v10 = *(_BYTE **)a4;
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(_QWORD *)(a4 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
}

void sub_20ADB7FD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 5);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADB802C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_BYTE *std::basic_regex<char,std::regex_traits<char>>::__parse_expression_term<char const*>(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  _BYTE *v4;
  int v5;
  uint64_t v6;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  char *v13;
  char *v14;
  int v15;
  _BYTE *v16;
  std::string *v17;
  uint64_t v18;
  std::string::size_type size;
  char v20;
  uint64_t v22;
  std::string __p;
  std::string v24;
  std::string v25;
  std::string v26;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  if (v5 == 93)
    return v4;
  v6 = (uint64_t)a4;
  memset(&v26, 0, sizeof(v26));
  if (a2 + 1 == a3 || v5 != 91)
  {
LABEL_9:
    v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
    goto LABEL_10;
  }
  v9 = a2[1];
  if (v9 != 46)
  {
    if (v9 == 58)
    {
      v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_class<char const*>(a1, a2 + 2, a3, (uint64_t)a4);
      goto LABEL_34;
    }
    if (v9 == 61)
    {
      v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<char const*>(a1, a2 + 2, a3, a4);
LABEL_34:
      v6 = v10;
      v20 = 0;
      goto LABEL_38;
    }
    goto LABEL_9;
  }
  v18 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(a1, a2 + 2, a3, (uint64_t)&v26);
  v4 = (_BYTE *)v18;
  v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v26.__r_.__value_.__l.__size_;
  v14 = (char *)v18;
  if (!size)
  {
LABEL_10:
    if ((v11 | 0x40) == 0x40)
    {
      v12 = *v4;
      if (v12 == 92)
      {
        v13 = v4 + 1;
        if (v11)
        {
          v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v13, a3, &v26);
        }
        else
        {
          v14 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)v13, (std::basic_regex<char> *)a3, &v26, v6);
          v11 = 0;
        }
        goto LABEL_16;
      }
    }
    else
    {
      LOBYTE(v12) = *v4;
    }
    std::string::operator=(&v26, v12);
    v14 = v4 + 1;
  }
LABEL_16:
  if (v14 == a3
    || (v15 = *v14, v15 == 93)
    || (v16 = v14 + 1, v14 + 1 == a3)
    || v15 != 45
    || *v16 == 93)
  {
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v26.__r_.__value_.__l.__size_)
      {
        if (v26.__r_.__value_.__l.__size_ != 1)
        {
          v17 = (std::string *)v26.__r_.__value_.__r.__words[0];
LABEL_36:
          std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](v6, v17->__r_.__value_.__s.__data_[0], v17->__r_.__value_.__s.__data_[1]);
          goto LABEL_37;
        }
        v17 = (std::string *)v26.__r_.__value_.__r.__words[0];
        goto LABEL_28;
      }
    }
    else if (*((_BYTE *)&v26.__r_.__value_.__s + 23))
    {
      v17 = &v26;
      if (HIBYTE(v26.__r_.__value_.__r.__words[2]) != 1)
        goto LABEL_36;
LABEL_28:
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](v6, v17->__r_.__value_.__s.__data_[0]);
    }
LABEL_37:
    v20 = 1;
    v4 = v14;
    goto LABEL_38;
  }
  memset(&v25, 0, sizeof(v25));
  v4 = v14 + 2;
  if (v14 + 2 != a3 && *v16 == 91 && *v4 == 46)
  {
    v22 = std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(a1, v14 + 3, a3, (uint64_t)&v25);
LABEL_55:
    v4 = (_BYTE *)v22;
    goto LABEL_56;
  }
  if ((v11 | 0x40) == 0x40)
  {
    LODWORD(v16) = *v16;
    if ((_DWORD)v16 == 92)
    {
      if (v11)
        v22 = (uint64_t)std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v14 + 2, a3, &v25);
      else
        v22 = (uint64_t)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)(v14 + 2), (std::basic_regex<char> *)a3, &v25, v6);
      goto LABEL_55;
    }
  }
  else
  {
    LOBYTE(v16) = *v16;
  }
  std::string::operator=(&v25, (std::string::value_type)v16);
LABEL_56:
  v24 = v26;
  memset(&v26, 0, sizeof(v26));
  __p = v25;
  memset(&v25, 0, sizeof(v25));
  std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](v6, (char *)&v24, (char *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v24.__r_.__value_.__l.__data_);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v25.__r_.__value_.__l.__data_);
  v20 = 1;
LABEL_38:
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  if ((v20 & 1) != 0)
    return v4;
  return (_BYTE *)v6;
}

void sub_20ADB838C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  if (a14 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a28 < 0)
    operator delete(a23);
  if (*(char *)(v28 - 49) < 0)
    operator delete(*(void **)(v28 - 72));
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__parse_equivalence_class<char const*>(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  uint64_t i;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  void *__p[2];
  unsigned __int8 v16;
  void *v17;
  uint64_t v18;
  unsigned __int8 v19;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_33;
  for (i = 0; a2[i] != 61 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_33;
  }
  if (&a2[i] == a3)
LABEL_33:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<char const*>(a1, a2, &a2[i], (uint64_t)&v17);
  if (((char)v19 & 0x80000000) == 0)
  {
    v8 = v19;
    if (v19)
    {
      v9 = (char *)&v17;
      goto LABEL_14;
    }
LABEL_34:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  }
  v8 = v18;
  if (!v18)
    goto LABEL_34;
  v9 = (char *)v17;
LABEL_14:
  std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(a1, v9, &v9[v8], (uint64_t)__p);
  v10 = v16;
  if ((v16 & 0x80u) != 0)
    v10 = (unint64_t)__p[1];
  if (v10)
  {
    std::__bracket_expression<char,std::regex_traits<char>>::__add_equivalence[abi:ne180100](a4, (__int128 *)__p);
  }
  else
  {
    v11 = v19;
    if ((v19 & 0x80u) != 0)
      v11 = v18;
    if (v11 == 2)
    {
      v13 = (char *)&v17;
      if ((v19 & 0x80u) != 0)
        v13 = (char *)v17;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)a4, *v13, v13[1]);
    }
    else
    {
      if (v11 != 1)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
      v12 = (char *)&v17;
      if ((v19 & 0x80u) != 0)
        v12 = (char *)v17;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)a4, *v12);
    }
  }
  if ((char)v16 < 0)
    operator delete(__p[0]);
  if ((char)v19 < 0)
    operator delete(v17);
  return (uint64_t)&a2[i + 2];
}

void sub_20ADB8590(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__parse_character_class<char const*>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t i;
  int v7;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_11;
  for (i = 0; a2[i] != 58 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_11;
  }
  if (&a2[i] == a3)
LABEL_11:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  v7 = std::regex_traits<char>::__lookup_classname<char const*>(a1, a2, &a2[i], *(_BYTE *)(a1 + 24) & 1);
  if (!v7)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
  *(_DWORD *)(a4 + 160) |= v7;
  return (uint64_t)&a2[i + 2];
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__parse_collating_symbol<char const*>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  __int128 v10;
  unint64_t v11;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_15;
  for (i = 0; a2[i] != 46 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_15;
  }
  if (&a2[i] == a3)
LABEL_15:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
  std::regex_traits<char>::__lookup_collatename<char const*>(a1, a2, &a2[i], (uint64_t)&v10);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(_OWORD *)a4 = v10;
  v7 = v11;
  *(_QWORD *)(a4 + 16) = v11;
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 - 1 >= 2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
  return (uint64_t)&a2[i + 2];
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::string *a4, uint64_t a5)
{
  int locale_low;
  int v7;
  int v8;
  std::string::value_type v9;
  std::string *v10;

  if (this == a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low > 97)
  {
    if (locale_low > 114)
    {
      if (locale_low != 115)
      {
        if (locale_low != 119)
          return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, this, a3, a4);
        *(_DWORD *)(a5 + 160) |= 0x500u;
        std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
        return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      }
      v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (locale_low == 98)
      {
        v10 = a4;
        v9 = 8;
LABEL_19:
        std::string::operator=(v10, v9);
        return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      }
      if (locale_low != 100)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, this, a3, a4);
      v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v8;
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  if (locale_low <= 82)
  {
    if (LOBYTE(this->__traits_.__loc_.__locale_))
    {
      if (locale_low == 68)
      {
        v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_21:
        *(_DWORD *)(a5 + 164) = v7;
        return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      }
      return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, this, a3, a4);
    }
    v9 = 0;
    v10 = a4;
    goto LABEL_19;
  }
  if (locale_low == 83)
  {
    v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_21;
  }
  if (locale_low == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](a5, 95);
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  return std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, this, a3, a4);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>(std::basic_regex<char> *a1, char *a2, char *a3, std::string *this)
{
  int v5;
  std::string *v6;
  std::string::value_type v7;
  char *v8;
  char v9;
  int v10;
  std::string::value_type v11;

  if (a2 == a3)
LABEL_52:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v5 = *a2;
  if (v5 > 97)
  {
    switch(v5)
    {
      case 'n':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 10;
          goto LABEL_16;
        }
        LOBYTE(v5) = 10;
        goto LABEL_49;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_21;
      case 'r':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 13;
          goto LABEL_16;
        }
        LOBYTE(v5) = 13;
        goto LABEL_49;
      case 't':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 9;
          goto LABEL_16;
        }
        LOBYTE(v5) = 9;
        goto LABEL_49;
      case 'v':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 11;
          goto LABEL_16;
        }
        LOBYTE(v5) = 11;
        goto LABEL_49;
      default:
        if (v5 == 98)
        {
          if (this)
          {
            v6 = this;
            LOBYTE(v5) = 8;
            goto LABEL_16;
          }
          LOBYTE(v5) = 8;
        }
        else
        {
          if (v5 != 102)
            goto LABEL_21;
          if (this)
          {
            v6 = this;
            LOBYTE(v5) = 12;
            goto LABEL_16;
          }
          LOBYTE(v5) = 12;
        }
        break;
    }
    goto LABEL_49;
  }
  if (v5 > 91)
  {
    if (v5 != 92)
    {
      if (v5 != 97)
        goto LABEL_21;
      if (this)
      {
        v6 = this;
        LOBYTE(v5) = 7;
LABEL_16:
        std::string::operator=(v6, v5);
        return a2 + 1;
      }
      LOBYTE(v5) = 7;
LABEL_49:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
      return a2 + 1;
    }
LABEL_14:
    if (this)
    {
      v6 = this;
      goto LABEL_16;
    }
    goto LABEL_49;
  }
  if (v5 == 34 || v5 == 47)
    goto LABEL_14;
LABEL_21:
  if ((v5 & 0xFFFFFFF8) != 0x30)
    goto LABEL_52;
  v7 = v5 - 48;
  v8 = a2 + 1;
  if (a2 + 1 != a3)
  {
    if ((*v8 & 0xF8) != 0x30)
      goto LABEL_39;
    v7 = *v8 + 8 * v7 - 48;
    if (a2 + 2 != a3)
    {
      v9 = a2[2];
      v10 = v9 & 0xF8;
      v11 = v9 + 8 * v7 - 48;
      if (v10 == 48)
        v8 = a2 + 3;
      else
        v8 = a2 + 2;
      if (v10 == 48)
        v7 = v11;
      goto LABEL_39;
    }
  }
  v8 = a3;
LABEL_39:
  if (this)
    std::string::operator=(this, v7);
  else
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
  return v8;
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](uint64_t a1, char *a2, char *a3)
{
  char *v3;
  char *v4;
  unint64_t i;
  unint64_t v7;
  char *v8;
  char v9;
  char *v10;
  unint64_t j;
  unint64_t v12;
  char *v13;
  char v14;
  char *v15;
  uint64_t v16;
  unint64_t k;
  unint64_t v18;
  char *v19;
  char *v20;
  unint64_t m;
  unint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char v31;
  _BYTE *v32;
  char *v33;
  char v34;
  _BYTE *v35;
  void *v36[2];
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  void *v40[2];
  uint64_t v41;
  void *__p[2];
  uint64_t v43;

  v3 = a3;
  v4 = a2;
  if (*(_BYTE *)(a1 + 170))
  {
    if (*(_BYTE *)(a1 + 169))
    {
      for (i = 0; ; ++i)
      {
        v7 = v4[23] < 0 ? *((_QWORD *)v4 + 1) : v4[23];
        if (i >= v7)
          break;
        v8 = v4;
        if (v4[23] < 0)
          v8 = *(char **)v4;
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v8[i]);
        v10 = v4;
        if (v4[23] < 0)
          v10 = *(char **)v4;
        v10[i] = v9;
      }
      for (j = 0; ; ++j)
      {
        v12 = v3[23] < 0 ? *((_QWORD *)v3 + 1) : v3[23];
        if (j >= v12)
          break;
        v13 = v3;
        if (v3[23] < 0)
          v13 = *(char **)v3;
        v14 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v13[j]);
        v15 = v3;
        if (v3[23] < 0)
          v15 = *(char **)v3;
        v15[j] = v14;
      }
    }
    else
    {
      for (k = 0; ; ++k)
      {
        v18 = a2[23] < 0 ? *((_QWORD *)a2 + 1) : a2[23];
        if (k >= v18)
          break;
        v19 = a2;
        if (a2[23] < 0)
          v19 = *(char **)a2;
        v20 = a2;
        if (a2[23] < 0)
          v20 = *(char **)a2;
        v20[k] = v19[k];
      }
      for (m = 0; ; ++m)
      {
        v22 = a3[23] < 0 ? *((_QWORD *)a3 + 1) : a3[23];
        if (m >= v22)
          break;
        v23 = a3;
        if (a3[23] < 0)
          v23 = *(char **)a3;
        v24 = a3;
        if (a3[23] < 0)
          v24 = *(char **)a3;
        v24[m] = v23[m];
      }
    }
    if (v4[23] < 0)
    {
      v26 = v4;
      v4 = *(char **)v4;
      v25 = *((_QWORD *)v26 + 1);
    }
    else
    {
      v25 = v4[23];
    }
    std::regex_traits<char>::transform<std::__wrap_iter<char *>>(a1 + 16, v4, &v4[v25]);
    if (v3[23] < 0)
    {
      v28 = v3;
      v3 = *(char **)v3;
      v27 = *((_QWORD *)v28 + 1);
    }
    else
    {
      v27 = v3[23];
    }
    std::regex_traits<char>::transform<std::__wrap_iter<char *>>(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)v40 = v38;
    v41 = v39;
    *(_OWORD *)__p = *(_OWORD *)v36;
    v43 = v37;
    std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100]((std::vector<std::pair<std::string, std::string>> *)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v41) < 0)
      operator delete(v40[0]);
  }
  else
  {
    if (a2[23] < 0)
      v16 = *((_QWORD *)a2 + 1);
    else
      v16 = a2[23];
    if (v16 != 1 || (a3[23] < 0 ? (v29 = *((_QWORD *)a3 + 1)) : (v29 = a3[23]), v29 != 1))
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
    if (*(_BYTE *)(a1 + 169))
    {
      v30 = a2;
      if (a2[23] < 0)
        v30 = *(char **)a2;
      v31 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v30);
      v32 = v4;
      if (v4[23] < 0)
        v32 = *(_BYTE **)v4;
      *v32 = v31;
      v33 = v3;
      if (v3[23] < 0)
        v33 = *(char **)v3;
      v34 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v33);
      v35 = v3;
      if (v3[23] < 0)
        v35 = *(_BYTE **)v3;
      *v35 = v34;
    }
    *(_OWORD *)v40 = *(_OWORD *)v4;
    v41 = *((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 1) = 0;
    *((_QWORD *)v4 + 2) = 0;
    *(_QWORD *)v4 = 0;
    *(_OWORD *)__p = *(_OWORD *)v3;
    v43 = *((_QWORD *)v3 + 2);
    *(_QWORD *)v3 = 0;
    *((_QWORD *)v3 + 1) = 0;
    *((_QWORD *)v3 + 2) = 0;
    std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100]((std::vector<std::pair<std::string, std::string>> *)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v41) < 0)
      operator delete(v40[0]);
  }
}

void sub_20ADB8DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21)
{
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(&a21);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  __int16 v6;
  unint64_t v7;
  __int16 v8;
  _WORD *v9;
  char **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  _WORD *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  __int16 v39;
  char *v40;
  __int16 v41;

  if (!*(_BYTE *)(a1 + 169))
  {
    v18 = a1 + 128;
    v19 = *(_QWORD *)(a1 + 128);
    v10 = (char **)(a1 + 112);
    v8 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    v9 = *(_WORD **)(a1 + 120);
    if (*(_BYTE *)(a1 + 170))
    {
      if ((unint64_t)v9 < v19)
        goto LABEL_24;
      v20 = (char *)v9 - *v10;
      if (v20 > -3)
      {
        v21 = v20 >> 1;
        v22 = v19 - (_QWORD)*v10;
        if (v22 <= (v20 >> 1) + 1)
          v23 = v21 + 1;
        else
          v23 = v22;
        if (v22 >= 0x7FFFFFFFFFFFFFFELL)
          v24 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v24 = v23;
        if (v24)
          v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v18, v24);
        else
          v25 = 0;
        v27 = &v25[2 * v21];
        v28 = &v25[2 * v24];
        *(_WORD *)v27 = v8;
        v26 = v27 + 2;
        v38 = *(char **)(a1 + 112);
        v29 = *(char **)(a1 + 120);
        if (v29 == v38)
          goto LABEL_46;
        do
        {
          v39 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v39;
          v27 -= 2;
        }
        while (v29 != v38);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v9 < v19)
        goto LABEL_24;
      v32 = (char *)v9 - *v10;
      if (v32 > -3)
      {
        v33 = v32 >> 1;
        v34 = v19 - (_QWORD)*v10;
        if (v34 <= (v32 >> 1) + 1)
          v35 = v33 + 1;
        else
          v35 = v34;
        if (v34 >= 0x7FFFFFFFFFFFFFFELL)
          v36 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v36 = v35;
        if (v36)
          v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(v18, v36);
        else
          v37 = 0;
        v27 = &v37[2 * v33];
        v28 = &v37[2 * v36];
        *(_WORD *)v27 = v8;
        v26 = v27 + 2;
        v40 = *(char **)(a1 + 112);
        v29 = *(char **)(a1 + 120);
        if (v29 == v40)
          goto LABEL_46;
        do
        {
          v41 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v41;
          v27 -= 2;
        }
        while (v29 != v40);
        goto LABEL_45;
      }
    }
LABEL_49:
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  }
  v5 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
  v6 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a3);
  v7 = *(_QWORD *)(a1 + 128);
  v8 = v5 | (unsigned __int16)(v6 << 8);
  v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    *v9 = v8;
    v26 = v9 + 1;
    goto LABEL_48;
  }
  v10 = (char **)(a1 + 112);
  v11 = *(_QWORD *)(a1 + 112);
  v12 = (uint64_t)v9 - v11;
  if ((uint64_t)v9 - v11 <= -3)
    goto LABEL_49;
  v13 = v12 >> 1;
  v14 = v7 - v11;
  if (v14 <= (v12 >> 1) + 1)
    v15 = v13 + 1;
  else
    v15 = v14;
  if (v14 >= 0x7FFFFFFFFFFFFFFELL)
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v16 = v15;
  if (v16)
    v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(a1 + 128, v16);
  else
    v17 = 0;
  v27 = &v17[2 * v13];
  v28 = &v17[2 * v16];
  *(_WORD *)v27 = v8;
  v26 = v27 + 2;
  v30 = *(char **)(a1 + 112);
  v29 = *(char **)(a1 + 120);
  if (v29 == v30)
    goto LABEL_46;
  do
  {
    v31 = *((_WORD *)v29 - 1);
    v29 -= 2;
    *((_WORD *)v27 - 1) = v31;
    v27 -= 2;
  }
  while (v29 != v30);
LABEL_45:
  v29 = *v10;
LABEL_46:
  *(_QWORD *)(a1 + 112) = v27;
  *(_QWORD *)(a1 + 120) = v26;
  *(_QWORD *)(a1 + 128) = v28;
  if (v29)
    operator delete(v29);
LABEL_48:
  *(_QWORD *)(a1 + 120) = v26;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 1);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADB9090(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__add_equivalence[abi:ne180100](uint64_t *a1, __int128 *a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t result;

  v3 = a1 + 17;
  v4 = a1[18];
  if (v4 >= a1[19])
  {
    result = std::vector<std::string>::__push_back_slow_path<std::string const&>(v3, a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v3, a2);
    result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

void std::regex_traits<char>::__lookup_collatename<char const*>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string *p_s;
  unint64_t v7;
  unint64_t v8;
  std::string::size_type size;
  std::string *v10;
  int v11;
  uint64_t v12;
  std::string v13;
  std::string __s;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(&__s, a2, a3, a3 - a2);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__s.__r_.__value_.__s + 23))
      return;
    p_s = &__s;
  }
  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  v7 = v13.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a4 + 16) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      return;
    v10 = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a1 + 16) + 32))(&v13, *(_QWORD *)(a1 + 16), v10, (char *)v10 + size);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(std::string *)a4 = v13;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    v11 = *(unsigned __int8 *)(a4 + 23);
    if (v11 != 12 && v11 != 1)
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(a4 + 8);
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(_BYTE **)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
}

void sub_20ADB9244(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v7, (char *)v7 + v6);
  v8 = *(unsigned __int8 *)(a4 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0)
        v10 = (_BYTE *)a4;
      else
        v10 = *(_BYTE **)a4;
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(_QWORD *)(a4 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
}

void sub_20ADB9350(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *(_QWORD *)(v3 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v3 = v4;
  }
  *(_QWORD *)(a1 + 8) = v3 + 24;
}

void sub_20ADB93C0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  std::string *v10;
  std::__split_buffer<std::string>::pointer end;
  __int128 v12;
  uint64_t v13;
  std::__split_buffer<std::string> __v;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9)
    v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>(v7, v9);
  else
    v10 = 0;
  end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    end = __v.__end_;
  }
  else
  {
    v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_20ADB94D4(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
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

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100]((uint64_t)this, (void **)&this->__begin_->__r_.__value_.__l.__data_);
  if (this->__first_)
    operator delete(this->__first_);
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

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 2);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADB97BC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t std::regex_traits<char>::__lookup_classname<char const*>(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  unint64_t v6;
  void **v7;
  void **v8;
  uint64_t classname;
  void *__p[2];
  unsigned __int8 v12;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), v7, (char *)v7 + v6);
  if ((v12 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  classname = std::__get_classname((const char *)v8, a4);
  if ((char)v12 < 0)
    operator delete(__p[0]);
  return classname;
}

void sub_20ADB986C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _BYTE *v22;
  char v23;
  unint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  _BYTE *v29;
  char v30;
  _BYTE *v31;
  char v32;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 72);
    v4 = *(_QWORD *)(a1 + 80);
    if ((unint64_t)v5 >= v4)
    {
      v6 = (unint64_t *)(a1 + 64);
      v7 = *(_QWORD *)(a1 + 64);
      v8 = &v5[-v7];
      v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        v10 = v4 - v7;
        if (2 * v10 > v9)
          v9 = 2 * v10;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
          v12 = operator new(v11);
        else
          v12 = 0;
        v20 = &v8[(_QWORD)v12];
        v21 = (char *)v12 + v11;
        v8[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v8[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          v22 = &v5[~v7];
          do
          {
            v23 = *--v5;
            (v22--)[(_QWORD)v12] = v23;
          }
          while (v5 != (_BYTE *)v7);
LABEL_45:
          v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    }
    goto LABEL_22;
  }
  v6 = (unint64_t *)(a1 + 64);
  v5 = *(_BYTE **)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 80);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v12 = operator new(v28);
        else
          v12 = 0;
        v20 = &v25[(_QWORD)v12];
        v21 = (char *)v12 + v28;
        v25[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v25[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(_QWORD)v12] = v32;
          }
          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13)
    goto LABEL_22;
  v14 = *v6;
  v15 = &v5[-*v6];
  v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0)
    goto LABEL_50;
  v17 = v13 - v14;
  if (2 * v17 > v16)
    v16 = 2 * v17;
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL)
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
    v12 = operator new(v18);
  else
    v12 = 0;
  v20 = &v15[(_QWORD)v12];
  v21 = (char *)v12 + v18;
  v15[(_QWORD)v12] = v2;
  v19 = (uint64_t)&v15[(_QWORD)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    v29 = &v5[~v14];
    do
    {
      v30 = *--v5;
      (v29--)[(_QWORD)v12] = v30;
    }
    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }
LABEL_46:
  v12 = v20;
LABEL_47:
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = v19;
  *(_QWORD *)(a1 + 80) = v21;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 72) = v19;
}

void std::vector<std::pair<std::string,std::string>>::push_back[abi:ne180100](std::vector<std::pair<std::string, std::string>> *a1, __int128 *a2)
{
  std::allocator<std::pair<std::string, std::string>> *p_end_cap;
  std::pair<std::string, std::string> *v5;
  std::pair<std::string, std::string> *value;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  std::pair<std::string, std::string> *end;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  std::pair<std::string, std::string> *v15;
  std::pair<std::string, std::string> *v16;
  __int128 v17;
  __int128 v18;
  std::__split_buffer<std::pair<std::string, std::string>> __v;

  value = a1->__end_cap_.__value_;
  p_end_cap = (std::allocator<std::pair<std::string, std::string>> *)&a1->__end_cap_;
  v5 = value;
  v7 = *((_QWORD *)p_end_cap - 1);
  if (v7 >= (unint64_t)value)
  {
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (unint64_t)a1->__begin_) >> 4);
    v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555)
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (char *)a1->__begin_) >> 4);
    if (2 * v13 > v12)
      v12 = 2 * v13;
    if (v13 >= 0x2AAAAAAAAAAAAAALL)
      v14 = 0x555555555555555;
    else
      v14 = v12;
    __v.__end_cap_.__value_ = p_end_cap;
    if (v14)
      v15 = (std::pair<std::string, std::string> *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>>((uint64_t)p_end_cap, v14);
    else
      v15 = 0;
    v16 = v15 + v11;
    __v.__first_ = v15;
    __v.__begin_ = v16;
    __v.__end_cap_.__value_ = &v15[v14];
    v17 = *a2;
    v16->first.__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v16->first.__r_.__value_.__l.__data_ = v17;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v18 = *(__int128 *)((char *)a2 + 24);
    v16->second.__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 5);
    *(_OWORD *)&v16->second.__r_.__value_.__l.__data_ = v18;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    __v.__end_ = v16 + 1;
    std::vector<std::pair<std::string,std::string>>::__swap_out_circular_buffer(a1, &__v);
    end = a1->__end_;
    std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer(&__v);
  }
  else
  {
    v8 = *a2;
    *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v7 = v8;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v9 = *(__int128 *)((char *)a2 + 24);
    *(_QWORD *)(v7 + 40) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    end = (std::pair<std::string, std::string> *)(v7 + 48);
    a1->__end_ = (std::vector<std::pair<std::string, std::string>>::pointer)(v7 + 48);
  }
  a1->__end_ = end;
}

void sub_20ADB9C08(_Unwind_Exception *a1, std::__split_buffer<std::pair<std::string, std::string>> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer((std::__split_buffer<std::pair<std::string, std::string>> *)&a10);
  _Unwind_Resume(a1);
}

void std::regex_traits<char>::transform<std::__wrap_iter<char *>>(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4;
  void **v5;
  void *__p[2];
  unsigned __int8 v7;

  std::string::__init_with_size[abi:ne180100]<char *,char *>(__p, a2, a3, a3 - a2);
  v4 = v7;
  if ((v7 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v7 & 0x80u) != 0)
    v4 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0)
    operator delete(__p[0]);
}

void sub_20ADB9C9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 9);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADB9CF0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::vector<std::pair<std::string,std::string>>::__swap_out_circular_buffer(std::vector<std::pair<std::string, std::string>> *this, std::__split_buffer<std::pair<std::string, std::string>> *__v)
{
  std::pair<std::string, std::string> *v4;
  std::pair<std::string, std::string> *begin;
  std::pair<std::string, std::string> *end;
  std::pair<std::string, std::string> *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>,std::reverse_iterator<std::pair<std::string,std::string>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _QWORD v13[3];
  char v14;
  __int128 v15;
  __int128 v16;

  v7 = a7;
  *(_QWORD *)&v16 = a6;
  *((_QWORD *)&v16 + 1) = a7;
  v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 48);
      *(_QWORD *)(v9 - 32) = *(_QWORD *)(a3 - 32);
      *(_OWORD *)(v9 - 48) = v10;
      *(_QWORD *)(a3 - 40) = 0;
      *(_QWORD *)(a3 - 32) = 0;
      *(_QWORD *)(a3 - 48) = 0;
      v11 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v11;
      v9 -= 48;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 48;
      a3 -= 48;
    }
    while (a3 != a5);
    *((_QWORD *)&v16 + 1) = v9;
  }
  v14 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v13);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>::operator()[abi:ne180100]((uint64_t *)a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,std::string>>,std::reverse_iterator<std::pair<std::string,std::string>*>>::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1[2] + 8);
  v2 = *(_QWORD *)(a1[1] + 8);
  if (v1 != v2)
  {
    v3 = *a1;
    do
    {
      std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100](v3, v1);
      v1 += 48;
    }
    while (v1 != v2);
  }
}

void std::__split_buffer<std::pair<std::string,std::string>>::~__split_buffer(std::__split_buffer<std::pair<std::string, std::string>> *this)
{
  std::__split_buffer<std::pair<std::string,std::string>>::clear[abi:ne180100](this);
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__split_buffer<std::pair<std::string,std::string>>::clear[abi:ne180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 48;
    std::allocator<AlgosScoreCombinerFrameRow>::destroy[abi:ne180100](v4, i - 48);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<char,char>>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a2);
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x20BD3126CLL);
}

uint64_t std::__begin_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(*(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x20BD3126CLL);
}

uint64_t std::__end_marked_subexpression<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_DWORD *)a2 = -994;
  v2 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(_QWORD *)(v2 + 8) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(v2 + 16) = 1;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_loop(std::basic_regex<char> *this, size_t __min, size_t __max, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end, BOOL __greedy)
{
  int v8;
  int v9;
  _QWORD *v14;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  uint64_t v17;
  unsigned int loop_count;
  std::__node<char> *v19;
  std::__node<char> *v20;

  v8 = __mexp_end;
  v9 = __mexp_begin;
  v14 = (_QWORD *)operator new();
  end = this->__end_;
  first = end->__first_;
  v14[1] = first;
  end->__first_ = 0;
  v17 = operator new();
  loop_count = this->__loop_count_;
  v19 = __s->__first_;
  *(_QWORD *)v17 = &unk_24C3CB7C8;
  *(_QWORD *)(v17 + 8) = v19;
  *(_QWORD *)(v17 + 16) = v14;
  *(_QWORD *)(v17 + 24) = __min;
  *(_QWORD *)(v17 + 32) = __max;
  *(_DWORD *)(v17 + 40) = loop_count;
  *(_DWORD *)(v17 + 44) = v9;
  *(_DWORD *)(v17 + 48) = v8;
  *(_BYTE *)(v17 + 52) = __greedy;
  __s->__first_ = 0;
  v20 = (std::__node<char> *)operator new();
  v20->__vftable = (std::__node<char>_vtbl *)&unk_24C3CB580;
  v20[1].__vftable = (std::__node<char>_vtbl *)v17;
  this->__end_->__first_ = v20;
  this->__end_ = *(std::__owns_one_state<char> **)(v17 + 16);
  __s->__first_ = (std::__node<char> *)v17;
  ++this->__loop_count_;
}

void sub_20ADBA250(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
{
  int v4;
  int v5;
  int v6;

  if (a2 != a3)
  {
    v4 = *a2;
    if ((v4 & 0xF8) == 0x30 || (v4 & 0xFE) == 0x38)
    {
      v5 = v4 - 48;
      *a4 = v5;
      if (++a2 == a3)
      {
        return a3;
      }
      else
      {
        while (1)
        {
          v6 = *a2;
          if ((v6 & 0xF8) != 0x30 && (v6 & 0xFE) != 0x38)
            break;
          if (v5 >= 214748364)
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
          v5 = v6 + 10 * v5 - 48;
          *a4 = v5;
          if (++a2 == a3)
            return a3;
        }
      }
    }
  }
  return a2;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 8);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADBA34C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 7);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADBA398(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24C3CB550;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24C3CB550;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x20BD3126CLL);
}

unsigned int *std::__loop<char>::__exec(unsigned int *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v10;

  v2 = result[10];
  v3 = a2[7];
  v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    v5 = *v4 + 1;
    *v4 = v5;
    v6 = *((_QWORD *)result + 3);
    v7 = *((_QWORD *)result + 4);
    v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      v10 = *(_QWORD *)(v3 + 16 * v2 + 8);
      v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8)
        goto LABEL_25;
LABEL_22:
      a2[10] = *((_QWORD *)result + 1);
      return std::__loop<char>::__init_repeat[abi:ne180100](result, a2);
    }
    goto LABEL_23;
  }
  *v4 = 0;
  if (*((_QWORD *)result + 4))
  {
    if (*((_QWORD *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((_QWORD *)result + 2);
  return result;
}

unsigned int *std::__loop<char>::__exec_split(unsigned int *result, int a2, _QWORD *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((_QWORD *)result + 2);
  }
  else
  {
    a3[10] = *((_QWORD *)result + 1);
    return std::__loop<char>::__init_repeat[abi:ne180100](result, a3);
  }
  return result;
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24C3CB550;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24C3CB550;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x20BD3126CLL);
}

unsigned int *std::__loop<char>::__init_repeat[abi:ne180100](unsigned int *result, _QWORD *a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = result[11];
  *(_QWORD *)(a2[7] + 16 * result[10] + 8) = a2[2];
  v3 = result[12];
  if (v2 != v3)
  {
    v4 = v2 - 1;
    v5 = a2[3];
    v6 = v3 - 1 - v4;
    v7 = a2[4] + 24 * v4 + 8;
    do
    {
      *(_QWORD *)(v7 - 8) = v5;
      *(_QWORD *)v7 = v5;
      *(_BYTE *)(v7 + 8) = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

void std::__repeat_one_loop<char>::~__repeat_one_loop()
{
  JUMPOUT(0x20BD3126CLL);
}

uint64_t std::__repeat_one_loop<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void (__cdecl ***std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24C3CB550;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&unk_24C3CB550;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  JUMPOUT(0x20BD3126CLL);
}

void std::__alternate<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t std::__alternate<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;

  *(_DWORD *)a3 = -994;
  v3 = 8;
  if (a2)
    v3 = 16;
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + v3);
  return result;
}

void std::__empty_non_own_state<char>::~__empty_non_own_state()
{
  JUMPOUT(0x20BD3126CLL);
}

uint64_t std::__empty_non_own_state<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x20BD31128](exception, 15);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_20ADBA844(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  unsigned int marked_count;
  unsigned __int8 *v8;

  if (a2 == a3)
    return (unsigned __int8 *)a2;
  end = a1->__end_;
  marked_count = a1->__marked_count_;
  v8 = (unsigned __int8 *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(a1, a2, a3);
  if (v8 == (unsigned __int8 *)a2)
    return (unsigned __int8 *)a2;
  else
    return std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>(a1, v8, (unsigned __int8 *)a3, end, marked_count + 1, a1->__marked_count_ + 1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  char *v6;
  char *v7;
  int v8;
  uint64_t v9;
  unsigned int marked_count;
  char *v11;
  _BOOL4 v13;
  uint64_t v14;

  v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<char const*>(a1, a2, a3);
  v7 = v6;
  if (v6 == a2 && v6 != a3)
  {
    if (a2 + 1 == a3 || *a2 != 92)
    {
      return a2;
    }
    else
    {
      v8 = a2[1];
      if (v8 == 40)
      {
        v9 = (uint64_t)(a2 + 2);
        std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression(a1);
        marked_count = a1->__marked_count_;
        do
        {
          v11 = (char *)v9;
          v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_simple_RE<char const*>(a1, v9, a3);
        }
        while ((char *)v9 != v11);
        if (v11 == a3 || v11 + 1 == a3 || *v11 != 92 || v11[1] != 41)
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
        v7 = v11 + 2;
        std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression(a1, marked_count);
      }
      else
      {
        v13 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(a1, v8);
        v14 = 2;
        if (!v13)
          v14 = 0;
        return &a2[v14];
      }
    }
  }
  return v7;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>(std::basic_regex<char> *this, unsigned __int8 *a2, unsigned __int8 *a3, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end)
{
  unsigned __int8 *v6;
  unsigned int v7;
  unsigned int v8;
  int v11;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;
  unsigned __int8 *v17;
  size_t v18;
  size_t v19;
  size_t v20;
  size_t v21;
  std::basic_regex<char> *v22;
  int v24;
  int v25;

  v6 = a2;
  if (a2 != a3)
  {
    v7 = __mexp_end;
    v8 = __mexp_begin;
    v11 = *a2;
    if (v11 == 42)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(this, 0, 0xFFFFFFFFFFFFFFFFLL, __s, __mexp_begin, __mexp_end, 1);
      return ++v6;
    }
    if (a2 + 1 != a3 && v11 == 92 && a2[1] == 123)
    {
      v13 = a2 + 2;
      v25 = 0;
      v14 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>((uint64_t)this, a2 + 2, a3, &v25);
      if (v14 == v13)
        goto LABEL_16;
      if (v14 != a3)
      {
        v15 = v14 + 1;
        v16 = *v14;
        if (v16 == 44)
        {
          v24 = -1;
          v17 = std::basic_regex<char,std::regex_traits<char>>::__parse_DUP_COUNT<char const*>((uint64_t)this, v15, a3, &v24);
          if (v17 != a3 && v17 + 1 != a3 && *v17 == 92 && v17[1] == 125)
          {
            v19 = v24;
            v18 = v25;
            if (v24 == -1)
            {
              v19 = -1;
            }
            else if (v24 < v25)
            {
LABEL_16:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
            }
            v6 = &v17[2 * (v17[1] == 125)];
            v20 = v8;
            v21 = v7;
            v22 = this;
LABEL_23:
            std::basic_regex<char,std::regex_traits<char>>::__push_loop(v22, v18, v19, __s, v20, v21, 1);
            return v6;
          }
        }
        else if (v15 != a3 && v16 == 92 && *v15 == 125)
        {
          v6 = v14 + 2;
          v18 = v25;
          v20 = v8;
          v21 = v7;
          v22 = this;
          v19 = v25;
          goto LABEL_23;
        }
      }
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    }
  }
  return v6;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_RE<char const*>(std::basic_regex<char> *this, char *a2, char *a3)
{
  int v6;
  char *result;
  std::__node<char> *v9;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  if (a2 == a3)
  {
    result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(this, a2, a3);
    if (result != a2)
      return result;
    return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
  }
  v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v6);
    return a2 + 1;
  }
  result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(this, a2, a3);
  if (result != a2)
    return result;
  if (*a2 != 46)
    return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
  v9 = (std::__node<char> *)operator new();
  end = this->__end_;
  first = end->__first_;
  v9->__vftable = (std::__node<char>_vtbl *)&unk_24C3CB430;
  v9[1].__vftable = (std::__node<char>_vtbl *)first;
  end->__first_ = v9;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
  return a2 + 1;
}

_BYTE *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR<char const*>(std::basic_regex<char> *a1, _BYTE *a2, _BYTE *a3)
{
  _BYTE *v3;
  int v4;

  v3 = a2;
  if (a2 != a3 && a2 + 1 != a3 && *a2 == 92)
  {
    v4 = (char)a2[1];
    if ((v4 - 36) <= 0x3A && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v4);
      v3 += 2;
    }
  }
  return v3;
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v1)(std::__owns_one_state<char> *__hidden);

  v1 = a1[1];
  if (v1)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v1 + 1))(v1);
  JUMPOUT(0x20BD3126CLL);
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v3;

  v2 = *(_BYTE **)(a2 + 16);
  if (v2 == *(_BYTE **)(a2 + 24) || !*v2)
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

BOOL std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(std::basic_regex<char> *this, char a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8)
    return 0;
  if (a2 - 48 > this->__marked_count_)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, a2 - 48);
  return 1;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_branch<char const*>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;

  v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  do
  {
    v7 = v6;
    v6 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, (std::basic_regex<char> *)v6, a3);
  }
  while (v6 != v7);
  return v7;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  std::__owns_one_state<char> *v6;
  int v7;
  char *v8;
  unsigned __int8 *v9;
  int locale_low;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unsigned int v16;
  std::basic_regex<char> *v17;
  std::basic_regex<char> *v18;

  v6 = *(std::__owns_one_state<char> **)(a1 + 56);
  v7 = *(_DWORD *)(a1 + 28);
  v8 = std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_ERE<char const*>((std::basic_regex<char> *)a1, a2, a3);
  v9 = (unsigned __int8 *)v8;
  if (v8 != (char *)a2 || v8 == (char *)a3)
    goto LABEL_12;
  locale_low = SLOBYTE(a2->__traits_.__loc_.__locale_);
  switch(locale_low)
  {
    case '$':
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      goto LABEL_8;
    case '(':
      std::basic_regex<char,std::regex_traits<char>>::__push_begin_marked_subexpression((std::basic_regex<char> *)a1);
      v16 = *(_DWORD *)(a1 + 28);
      ++*(_DWORD *)(a1 + 36);
      v17 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(a1, (char *)&a2->__traits_.__loc_.__locale_ + 1, a3);
      if (v17 == a3 || (v18 = v17, LOBYTE(v17->__traits_.__loc_.__locale_) != 41))
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      std::basic_regex<char,std::regex_traits<char>>::__push_end_marked_subexpression((std::basic_regex<char> *)a1, v16);
      --*(_DWORD *)(a1 + 36);
      v9 = (unsigned __int8 *)&v18->__traits_.__loc_.__locale_ + 1;
LABEL_12:
      if (v9 != (unsigned __int8 *)a2)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, v9, (unsigned __int8 *)a3, v6, (v7 + 1), (*(_DWORD *)(a1 + 28) + 1));
      return (unsigned __int8 *)a2;
    case '^':
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
LABEL_8:
      v15 = *(_QWORD *)(v13 + 8);
      *(_QWORD *)v11 = v14 + 16;
      *(_QWORD *)(v11 + 8) = v15;
      *(_BYTE *)(v11 + 16) = v12;
      *(_QWORD *)(v13 + 8) = v11;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = (unsigned __int8 *)&a2->__traits_.__loc_.__locale_ + 1;
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, v9, (unsigned __int8 *)a3, v6, (v7 + 1), (*(_DWORD *)(a1 + 28) + 1));
  }
  return (unsigned __int8 *)a2;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_one_char_or_coll_elem_ERE<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  char *result;
  std::__node<char> *v7;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;

  result = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<char const*>(a1, a2, a3);
  if (result == (char *)a2)
  {
    result = std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<char const*>((uint64_t)a1, (char *)a2, (char *)a3);
    if (result == (char *)a2)
    {
      if (a2 == a3 || LOBYTE(a2->__traits_.__loc_.__locale_) != 46)
      {
        return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)a1, (char *)a2, (char *)a3);
      }
      else
      {
        v7 = (std::__node<char> *)operator new();
        end = a1->__end_;
        first = end->__first_;
        v7->__vftable = (std::__node<char>_vtbl *)&unk_24C3CB430;
        v7[1].__vftable = (std::__node<char>_vtbl *)first;
        end->__first_ = v7;
        a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
        return (char *)&a2->__traits_.__loc_.__locale_ + 1;
      }
    }
  }
  return result;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ORD_CHAR_ERE<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3)
{
  std::basic_regex<char> *v3;
  int locale_low;
  uint64_t v5;

  v3 = this;
  if (this != a3)
  {
    locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
    v5 = (locale_low - 36);
    if (v5 > 0x3A)
      goto LABEL_8;
    if (((1 << (locale_low - 36)) & 0x5800000080004D1) != 0)
      return v3;
    if (v5 == 5)
    {
      if (a1->__open_count_)
        return v3;
    }
    else
    {
LABEL_8:
      if ((locale_low - 123) < 2)
        return v3;
    }
    std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, (std::basic_regex<char>::value_type)this->__traits_.__loc_.__locale_);
    return (std::basic_regex<char> *)((char *)v3 + 1);
  }
  return v3;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_QUOTED_CHAR_ERE<char const*>(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  char *v4;
  int v5;
  std::basic_regex<char>::value_type v6;
  BOOL v7;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v4 = a2 + 1;
  if (v3 + 1 == a3 || *v3 != 92)
    return v3;
  v5 = *v4;
  v6 = *v4;
  v7 = (v5 - 36) > 0x3A || ((1 << (*v4 - 36)) & 0x5800000080004F1) == 0;
  if (!v7 || (v5 - 123) < 3)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v6);
    v3 += 2;
    return v3;
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0x40)
  {
    v9 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref((std::basic_regex<char> *)a1, v6);
    v10 = 2;
    if (!v9)
      v10 = 0;
    v3 += v10;
    return v3;
  }
  return std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v4, a3, 0);
}

uint64_t std::regex_match[abi:ne180100]<std::__wrap_iter<char const*>,std::allocator<std::sub_match<std::__wrap_iter<char const*>>>,char,std::regex_traits<char>>(char *__f, char *__l, uint64_t a3, uint64_t a4, int a5)
{
  __int16 v5;
  int v9;
  uint64_t result;
  std::match_results<const char *> __p;

  v5 = a5;
  memset(&__p.__prefix_, 0, 17);
  memset(&__p.__suffix_, 0, 17);
  __p.__ready_ = 0;
  __p.__position_start_ = 0;
  memset(&__p, 0, 41);
  v9 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(a4, __f, __l, &__p, a5 | 0x1040u);
  std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((std::vector<std::ssub_match> *)a3, (uint64_t)__f, (std::sub_match<std::__wrap_iter<const char *>> *)__l, (uint64_t *)&__p, (v5 & 0x800) != 0);
  if (__p.__matches_.__begin_)
  {
    __p.__matches_.__end_ = __p.__matches_.__begin_;
    operator delete(__p.__matches_.__begin_);
  }
  if (!v9)
    return 0;
  if (!*(_BYTE *)(a3 + 88))
    return 1;
  result = 0;
  *(_QWORD *)(a3 + 8) = *(_QWORD *)a3;
  return result;
}

void sub_20ADBB348(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(uint64_t a1, char *__f, char *__l, std::match_results<const char *> *this, int a5)
{
  int v9;
  std::match_results<const char *>::value_type *p_unmatched;
  const char *first;
  const char *second;
  uint64_t result;
  int v14;
  const char *v15;
  int v16;
  std::vector<std::csub_match>::pointer end;
  std::vector<std::csub_match>::pointer begin;

  if ((a5 & 0x80) != 0)
    v9 = a5 & 0xFFA;
  else
    v9 = a5;
  std::match_results<char const*>::__init(this, *(_DWORD *)(a1 + 28) + 1, __f, __l, (unsigned __int16)(v9 & 0x800) >> 11);
  if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, __f, __l, (uint64_t *)this, v9, (v9 & 0x800) == 0))
  {
    if (this->__matches_.__end_ == this->__matches_.__begin_)
      p_unmatched = &this->__unmatched_;
    else
      p_unmatched = this->__matches_.__begin_;
LABEL_8:
    first = p_unmatched->first;
    this->__prefix_.second = p_unmatched->first;
    this->__prefix_.matched = this->__prefix_.first != first;
    second = p_unmatched->second;
    this->__suffix_.first = second;
    this->__suffix_.matched = second != this->__suffix_.second;
    return 1;
  }
  if (__f != __l && (v9 & 0x40) == 0)
  {
    v14 = v9 | 0x80;
    v15 = __f + 1;
    if (v15 != __l)
    {
      while (1)
      {
        std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__matches_.__end_ - (char *)this->__matches_.__begin_) >> 3), &this->__unmatched_);
        v16 = std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, v15, __l, (uint64_t *)this, v14, 0);
        begin = this->__matches_.__begin_;
        end = this->__matches_.__end_;
        if (v16)
          break;
        std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3), &this->__unmatched_);
        if (++v15 == __l)
          goto LABEL_14;
      }
      if (end == begin)
        p_unmatched = &this->__unmatched_;
      else
        p_unmatched = this->__matches_.__begin_;
      goto LABEL_8;
    }
LABEL_14:
    std::vector<std::sub_match<char const*>>::assign(&this->__matches_, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__matches_.__end_ - (char *)this->__matches_.__begin_) >> 3), &this->__unmatched_);
    if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(a1, __l, __l, (uint64_t *)this, v14, 0))
    {
      if (this->__matches_.__end_ == this->__matches_.__begin_)
        p_unmatched = &this->__unmatched_;
      else
        p_unmatched = this->__matches_.__begin_;
      goto LABEL_8;
    }
  }
  result = 0;
  this->__matches_.__end_ = this->__matches_.__begin_;
  return result;
}

void std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(std::vector<std::ssub_match> *a1, uint64_t a2, std::sub_match<std::__wrap_iter<const char *>> *a3, uint64_t *a4, char a5)
{
  uint64_t v10;
  std::vector<std::ssub_match>::pointer begin;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  char v21;
  std::vector<std::ssub_match>::pointer end;
  std::sub_match<std::__wrap_iter<const char *>> *v23;

  v10 = a4[6];
  std::vector<std::sub_match<std::__wrap_iter<char const*>>>::resize(a1, 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3));
  begin = a1->__begin_;
  if (a1->__end_ != a1->__begin_)
  {
    v12 = 0;
    v13 = 0;
    v15 = *a4;
    v14 = a4[1];
    do
    {
      v16 = 0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3);
      v17 = (_QWORD *)(v15 + v12 * 24);
      if (v16 <= v13)
        v18 = a4 + 3;
      else
        v18 = v17;
      begin[v12].first.__i_ = (std::__wrap_iter<const char *>::iterator_type)(a2 + *v18 - v10);
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v13)
        v19 = a4 + 3;
      else
        v19 = (uint64_t *)(*a4 + v12 * 24);
      a1->__begin_[v12].second.__i_ = (std::__wrap_iter<const char *>::iterator_type)(a2 + v19[1] - v10);
      v15 = *a4;
      v14 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v14 - *a4) >> 3) <= v13)
        v20 = a4 + 3;
      else
        v20 = (uint64_t *)(*a4 + v12 * 24);
      v21 = *((_BYTE *)v20 + 16);
      begin = a1->__begin_;
      end = a1->__end_;
      a1->__begin_[v12].matched = v21;
      ++v13;
      ++v12;
    }
    while (v13 < 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)begin) >> 3));
  }
  a1[1].__begin_ = a3;
  a1[1].__end_ = a3;
  LOBYTE(a1[1].__end_cap_.__value_) = 0;
  v23 = (std::sub_match<std::__wrap_iter<const char *>> *)(a2 + a4[6] - v10);
  a1[2].__begin_ = v23;
  a1[2].__end_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[7] - v10);
  LOBYTE(a1[2].__end_cap_.__value_) = *((_BYTE *)a4 + 64);
  a1[3].__begin_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[9] - v10);
  a1[3].__end_ = (std::vector<std::ssub_match>::pointer)(a2 + a4[10] - v10);
  LOBYTE(a1[3].__end_cap_.__value_) = *((_BYTE *)a4 + 88);
  if ((a5 & 1) == 0)
    a1[4].__end_ = v23;
  LOBYTE(a1[4].__begin_) = *((_BYTE *)a4 + 96);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0)
    return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, a2, a3, a4, a5, a6);
  if (*(_DWORD *)(a1 + 28))
    return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, a2, a3, a4, a5, a6);
  return std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  BOOL v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  void **v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  unint64_t v43;
  _QWORD *v44;
  __int128 v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  char v53;
  _BYTE v55[40];
  __int128 v56;
  void *__p[2];
  _QWORD v58[3];
  __int128 v59;
  __int128 v60;
  __int128 v61;

  v60 = 0u;
  v61 = 0u;
  v59 = 0u;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)v55 = 0;
    memset(&v55[8], 0, 32);
    v56 = 0uLL;
    *(_OWORD *)__p = 0uLL;
    memset(v58, 0, 21);
    std::deque<std::__state<char>>::push_back(&v59, (uint64_t)v55);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(_QWORD *)&v55[32])
    {
      *(_QWORD *)&v56 = *(_QWORD *)&v55[32];
      operator delete(*(void **)&v55[32]);
    }
    v12 = *((_QWORD *)&v59 + 1);
    v13 = *((_QWORD *)&v61 + 1) + v61 - 1;
    v14 = v13 / 0x2A;
    v15 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (v13 / 0x2A));
    v16 = 3 * (v13 % 0x2A);
    v17 = v15 + 32 * v16;
    *(_DWORD *)v17 = 0;
    *(_QWORD *)(v17 + 8) = a2;
    *(_QWORD *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(_QWORD *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 56), *(unsigned int *)(a1 + 32));
    v53 = 0;
    v18 = 0;
    v51 = 0;
    v52 = a2;
    v19 = a3 - a2;
    v20 = *((_QWORD *)&v61 + 1);
    v21 = *((_QWORD *)&v59 + 1);
    v22 = *((_QWORD *)&v61 + 1) + v61 - 1;
    v23 = v22 / 0x2A;
    v24 = 3 * (v22 % 0x2A);
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v23) + 32 * v24 + 80) = v6;
    v25 = *(_QWORD *)(v21 + 8 * v23) + 32 * v24;
    *(_DWORD *)(v25 + 88) = a5;
    *(_BYTE *)(v25 + 92) = a6;
    while (2)
    {
      if ((++v18 & 0xFFF) == 0 && (int)(v18 >> 12) >= (int)v19)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      v27 = v20 + v61 - 1;
      v28 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (v27 / 0x2A));
      v29 = v27 % 0x2A;
      v30 = v28 + 96 * (v27 % 0x2A);
      v32 = (_QWORD *)(v30 + 80);
      v31 = *(_QWORD *)(v30 + 80);
      if (v31)
        (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v31 + 16))(v31, v28 + 96 * v29);
      switch(*(_DWORD *)v30)
      {
        case 0xFFFFFC18:
          v33 = *(_QWORD *)(v28 + 96 * v29 + 16);
          v35 = (a5 & 0x1000) == 0 || v33 == a3;
          v36 = v33 != v52 || (a5 & 0x20) == 0;
          if (!v36 || !v35)
            goto LABEL_37;
          v37 = v33 - *(_QWORD *)(v28 + 96 * v29 + 8);
          v38 = v51;
          if ((v53 & (v51 >= v37)) == 0)
            v38 = v37;
          if (v38 != v19)
          {
            v51 = v38;
            std::deque<std::__state<char>>::pop_back(&v59);
            v53 = 1;
            goto LABEL_38;
          }
          v39 = (void **)*((_QWORD *)&v59 + 1);
          v40 = v60;
          if ((_QWORD)v60 == *((_QWORD *)&v59 + 1))
          {
            v40 = *((_QWORD *)&v59 + 1);
          }
          else
          {
            v41 = (_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * ((unint64_t)v61 / 0x2A));
            v42 = (_QWORD *)(*v41 + 96 * ((unint64_t)v61 % 0x2A));
            v43 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * ((*((_QWORD *)&v61 + 1) + (_QWORD)v61) / 0x2AuLL))
                + 96 * ((*((_QWORD *)&v61 + 1) + (_QWORD)v61) % 0x2AuLL);
            if (v42 != (_QWORD *)v43)
            {
              do
              {
                std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)&v61 + 8, v42);
                v42 += 12;
                if ((_QWORD *)((char *)v42 - *v41) == (_QWORD *)4032)
                {
                  v44 = (_QWORD *)v41[1];
                  ++v41;
                  v42 = v44;
                }
              }
              while (v42 != (_QWORD *)v43);
              v39 = (void **)*((_QWORD *)&v59 + 1);
              v40 = v60;
            }
          }
          *((_QWORD *)&v61 + 1) = 0;
          v47 = v40 - (_QWORD)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              v39 = (void **)(*((_QWORD *)&v59 + 1) + 8);
              *((_QWORD *)&v59 + 1) = v39;
              v47 = v60 - (_QWORD)v39;
            }
            while ((_QWORD)v60 - (_QWORD)v39 > 0x10uLL);
          }
          if (v47 >> 3 == 1)
          {
            v48 = 21;
          }
          else
          {
            if (v47 >> 3 != 2)
              goto LABEL_53;
            v48 = 42;
          }
          *(_QWORD *)&v61 = v48;
LABEL_53:
          v53 = 1;
          v51 = v19;
LABEL_38:
          v20 = *((_QWORD *)&v61 + 1);
          if (*((_QWORD *)&v61 + 1))
            continue;
          if ((v53 & 1) != 0)
          {
            v49 = *a4;
            *(_QWORD *)v49 = v52;
            *(_QWORD *)(v49 + 8) = v52 + v51;
            v6 = 1;
            *(_BYTE *)(v49 + 16) = 1;
          }
          else
          {
            v6 = 0;
          }
          break;
        case 0xFFFFFC19:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_38;
        case 0xFFFFFC1D:
          std::deque<std::__state<char>>::push_front((uint64_t)&v59, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          std::deque<std::__state<char>>::pop_back(&v59);
          goto LABEL_38;
        case 0xFFFFFC20:
          v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)v55 = *(_OWORD *)v30;
          *(_OWORD *)&v55[16] = v45;
          v56 = 0uLL;
          *(_QWORD *)&v55[32] = 0;
          std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v55[32], *(__int128 **)(v28 + 96 * v29 + 32), *(__int128 **)(v28 + 96 * v29 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v28 + 96 * v29 + 40) - *(_QWORD *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v58[0] = 0;
          std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *(__int128 **)(v28 + 96 * v29 + 56), *(__int128 **)(v28 + 96 * v29 + 64), (uint64_t)(*(_QWORD *)(v28 + 96 * v29 + 64) - *(_QWORD *)(v28 + 96 * v29 + 56)) >> 4);
          v46 = *v32;
          *(_QWORD *)((char *)&v58[1] + 5) = *(_QWORD *)(v30 + 85);
          v58[1] = v46;
          (*(void (**)(_QWORD, uint64_t, unint64_t))(*(_QWORD *)*v32 + 24))(*v32, 1, v28 + 96 * v29);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v58[1] + 24))(v58[1], 0, v55);
          std::deque<std::__state<char>>::push_back(&v59, (uint64_t)v55);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*(_QWORD *)&v55[32])
          {
            *(_QWORD *)&v56 = *(_QWORD *)&v55[32];
            operator delete(*(void **)&v55[32]);
          }
          goto LABEL_38;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  std::deque<std::__state<char>>::~deque[abi:ne180100](&v59);
  return v6;
}

void sub_20ADBBBD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  uint64_t v22;

  std::deque<std::__state<char>>::~deque[abi:ne180100]((_QWORD *)(v22 - 144));
  _Unwind_Resume(a1);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  _OWORD *v11;
  unsigned int v12;
  const char *v13;
  _OWORD *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD *v17;
  _BYTE *v18;
  const char *v19;
  _OWORD *v20;
  __int128 v21;
  void *v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  __int128 v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  _OWORD *v32;
  uint64_t v33;
  unint64_t v34;
  _BYTE *v35;
  unsigned int v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v41;
  const char *v42;
  char v43;
  _BYTE v46[56];
  void *__p[2];
  _QWORD v48[4];
  std::vector<std::csub_match>::value_type __x;
  _BYTE v50[40];
  __int128 v51;
  void *v52[6];
  _OWORD *v53;
  _OWORD *v54;
  _QWORD v55[3];

  v53 = 0;
  v54 = 0;
  v55[0] = 0;
  *(_DWORD *)v50 = 0;
  memset(&v50[8], 0, 32);
  v51 = 0u;
  memset(v52, 0, 37);
  v6 = *(_QWORD *)(a1 + 40);
  if (!v6)
    goto LABEL_43;
  __x.first = a3;
  __x.second = a3;
  __x.matched = 0;
  *(_DWORD *)v46 = 0;
  memset(&v46[8], 0, 48);
  *(_OWORD *)__p = 0uLL;
  memset(v48, 0, 21);
  v54 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v53, (uint64_t)v46);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (*(_QWORD *)&v46[32])
  {
    *(_QWORD *)&v46[40] = *(_QWORD *)&v46[32];
    operator delete(*(void **)&v46[32]);
  }
  v41 = a4;
  v11 = v54;
  *((_DWORD *)v54 - 24) = 0;
  *((_QWORD *)v11 - 11) = a2;
  *((_QWORD *)v11 - 10) = a2;
  *((_QWORD *)v11 - 9) = a3;
  std::vector<std::sub_match<char const*>>::resize((std::vector<std::csub_match> *)(v11 - 4), *(unsigned int *)(a1 + 28), &__x);
  std::vector<std::pair<unsigned long,char const*>>::resize((std::vector<std::pair<unsigned long, const char *>> *)((char *)v54 - 40), *(unsigned int *)(a1 + 32));
  v42 = 0;
  v43 = 0;
  v12 = 0;
  v13 = (const char *)(a3 - a2);
  v14 = v54;
  *((_QWORD *)v54 - 2) = v6;
  *((_DWORD *)v14 - 2) = a5;
  *((_BYTE *)v14 - 4) = a6;
  do
  {
    v15 = (++v12 & 0xFFF) != 0 || (int)(v12 >> 12) < (int)v13;
    if (!v15)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    v17 = v14 - 1;
    v16 = *((_QWORD *)v14 - 2);
    v18 = v14 - 6;
    if (v16)
      (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v16 + 16))(v16, v14 - 6);
    switch(*(_DWORD *)v18)
    {
      case 0xFFFFFC18:
        v19 = (const char *)*((_QWORD *)v14 - 10);
        if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != a3)
          goto LABEL_19;
        v26 = &v19[-*((_QWORD *)v14 - 11)];
        v27 = v42;
        if ((v43 & ((uint64_t)v42 >= (uint64_t)v26)) == 0)
        {
          v28 = *(v14 - 5);
          *(_OWORD *)v50 = *(_OWORD *)v18;
          *(_OWORD *)&v50[16] = v28;
          if (v50 != v18)
          {
            std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v50[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
            std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(v52, *((uint64_t **)v14 - 5), *((uint64_t **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
          }
          v29 = (void *)*v17;
          *(void **)((char *)&v52[3] + 5) = *(void **)((char *)v14 - 11);
          v52[3] = v29;
          v27 = v26;
        }
        v30 = v54;
        if (v27 == v13)
        {
          v31 = (uint64_t)v53;
          while (v30 != (_QWORD *)v31)
          {
            v30 -= 12;
            std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v55, v30);
          }
          v54 = (_OWORD *)v31;
          v43 = 1;
          v42 = (const char *)(a3 - a2);
        }
        else
        {
          v42 = v27;
          v32 = v54 - 6;
          std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v55, (_QWORD *)v54 - 12);
          v54 = v32;
          v43 = 1;
        }
        break;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        break;
      case 0xFFFFFC1F:
LABEL_19:
        v20 = v54 - 6;
        std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v55, (_QWORD *)v54 - 12);
        v54 = v20;
        break;
      case 0xFFFFFC20:
        v21 = *(v14 - 5);
        *(_OWORD *)v46 = *(_OWORD *)v18;
        *(_OWORD *)&v46[16] = v21;
        memset(&v46[32], 0, 24);
        std::vector<std::sub_match<char const*>>::__init_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(&v46[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
        __p[0] = 0;
        __p[1] = 0;
        v48[0] = 0;
        std::vector<std::pair<unsigned long,char const*>>::__init_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>((char *)__p, *((__int128 **)v14 - 5), *((__int128 **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
        v22 = (void *)*v17;
        *(_QWORD *)((char *)&v48[1] + 5) = *(_QWORD *)((char *)v14 - 11);
        v48[1] = v22;
        (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)*v17 + 24))(*v17, 1, v14 - 6);
        (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v48[1] + 24))(v48[1], 0, v46);
        v23 = v54;
        if ((unint64_t)v54 >= v55[0])
        {
          v54 = (_OWORD *)std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((uint64_t *)&v53, (uint64_t)v46);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        else
        {
          v24 = *(_OWORD *)&v46[16];
          *v54 = *(_OWORD *)v46;
          v23[1] = v24;
          *((_QWORD *)v23 + 4) = 0;
          *((_QWORD *)v23 + 5) = 0;
          *((_QWORD *)v23 + 6) = 0;
          *((_QWORD *)v23 + 7) = 0;
          v23[2] = *(_OWORD *)&v46[32];
          *((_QWORD *)v23 + 6) = *(_QWORD *)&v46[48];
          memset(&v46[32], 0, 24);
          *((_QWORD *)v23 + 8) = 0;
          *((_QWORD *)v23 + 9) = 0;
          *(_OWORD *)((char *)v23 + 56) = *(_OWORD *)__p;
          *((_QWORD *)v23 + 9) = v48[0];
          __p[0] = 0;
          __p[1] = 0;
          v48[0] = 0;
          v25 = v48[1];
          *(_QWORD *)((char *)v23 + 85) = *(_QWORD *)((char *)&v48[1] + 5);
          *((_QWORD *)v23 + 10) = v25;
          v54 = v23 + 6;
        }
        if (*(_QWORD *)&v46[32])
        {
          *(_QWORD *)&v46[40] = *(_QWORD *)&v46[32];
          operator delete(*(void **)&v46[32]);
        }
        break;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
    v14 = v54;
  }
  while (v53 != v54);
  if ((v43 & 1) != 0)
  {
    v33 = *v41;
    *(_QWORD *)v33 = a2;
    *(_QWORD *)(v33 + 8) = &v42[(_QWORD)a2];
    *(_BYTE *)(v33 + 16) = 1;
    if ((_QWORD)v51 != *(_QWORD *)&v50[32])
    {
      v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v51 - *(_QWORD *)&v50[32]) >> 3);
      v35 = (_BYTE *)(*(_QWORD *)&v50[32] + 16);
      v36 = 1;
      do
      {
        v37 = v33 + 24 * v36;
        *(_OWORD *)v37 = *((_OWORD *)v35 - 1);
        v38 = *v35;
        v35 += 24;
        *(_BYTE *)(v37 + 16) = v38;
        v15 = v34 > v36++;
      }
      while (v15);
    }
    v39 = 1;
  }
  else
  {
LABEL_43:
    v39 = 0;
  }
  if (v52[0])
  {
    v52[1] = v52[0];
    operator delete(v52[0]);
  }
  if (*(_QWORD *)&v50[32])
  {
    *(_QWORD *)&v51 = *(_QWORD *)&v50[32];
    operator delete(*(void **)&v50[32]);
  }
  *(_QWORD *)v50 = &v53;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)v50);
  return v39;
}

void sub_20ADBC128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v35;

  std::__state<char>::~__state(&a19);
  std::__state<char>::~__state(&a35);
  a35 = v35 - 120;
  std::vector<std::__state<char>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a35);
  _Unwind_Resume(a1);
}

__n128 std::deque<std::__state<char>>::push_back(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  __n128 result;
  uint64_t v11;

  v4 = a1[2];
  v5 = a1[1];
  v6 = 42 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5)
    v6 = 0;
  v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    std::deque<std::__state<char>>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5] + a1[4];
  }
  v8 = *(_QWORD *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(_QWORD *)(v8 + 40) = 0;
  *(_QWORD *)(v8 + 48) = 0;
  *(_QWORD *)(v8 + 32) = 0;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v8 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v8 + 56) = 0;
  *(_QWORD *)(v8 + 64) = 0;
  *(_QWORD *)(v8 + 72) = 0;
  result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v8 + 56) = result;
  *(_QWORD *)(v8 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v11 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v8 + 85) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v8 + 80) = v11;
  ++a1[5];
  return result;
}

uint64_t std::deque<std::__state<char>>::pop_back(_QWORD *a1)
{
  _QWORD *v2;
  unint64_t v3;

  v2 = a1 + 5;
  v3 = a1[5] + a1[4] - 1;
  std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)(a1 + 5), (_QWORD *)(*(_QWORD *)(a1[1] + 8 * (v3 / 0x2A)) + 96 * (v3 % 0x2A)));
  --*v2;
  return std::deque<std::__state<char>>::__maybe_remove_back_spare[abi:ne180100](a1, 1);
}

int64x2_t std::deque<std::__state<char>>::push_front(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  int64x2_t result;

  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    std::deque<std::__state<char>>::__add_front_capacity((void **)a1);
    v4 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(_QWORD *)(a1 + 8);
  v6 = (_QWORD *)(v5 + 8 * (v4 / 0x2A));
  v7 = *v6 + 96 * (v4 % 0x2A);
  if (*(_QWORD *)(a1 + 16) == v5)
    v7 = 0;
  if (v7 == *v6)
    v7 = *(v6 - 1) + 4032;
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 - 96) = *(_OWORD *)a2;
  *(_OWORD *)(v7 - 80) = v8;
  *(_QWORD *)(v7 - 56) = 0;
  *(_QWORD *)(v7 - 48) = 0;
  *(_QWORD *)(v7 - 64) = 0;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v7 - 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v7 - 40) = 0;
  *(_QWORD *)(v7 - 32) = 0;
  *(_QWORD *)(v7 - 24) = 0;
  *(_OWORD *)(v7 - 40) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(v7 - 24) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v9 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v7 - 11) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v7 - 16) = v9;
  result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_20ADC5510);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void std::deque<std::__state<char>>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x2A;
  v4 = v2 - 42;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0xFC0uLL);
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0xFC0uLL);
  std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_20ADBC6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;

  v5 = (char *)a1[3];
  v4 = (uint64_t)(a1 + 3);
  v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    v7 = (char *)a1[1];
    v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v18 = 1;
      else
        v18 = (uint64_t)&v6[-*a1] >> 2;
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v4, v18);
      v21 = &v19[8 * (v18 >> 2)];
      v22 = (uint64_t *)a1[1];
      v6 = v21;
      v23 = a1[2] - (_QWORD)v22;
      if (v23)
      {
        v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        v24 = 8 * (v23 >> 3);
        v25 = &v19[8 * (v18 >> 2)];
        do
        {
          v26 = *v22++;
          *(_QWORD *)v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        v6 = (char *)a1[2];
      }
    }
    else
    {
      v9 = v8 >> 3;
      v10 = v8 >> 3 < -1;
      v11 = (v8 >> 3) + 2;
      if (v10)
        v12 = v11;
      else
        v12 = v9 + 1;
      v13 = -(v12 >> 1);
      v14 = v12 >> 1;
      v15 = &v7[-8 * v14];
      v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        v6 = (char *)a1[1];
      }
      v17 = &v6[8 * v13];
      v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(_QWORD *)v6 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = a1 + 24;
    v7 = *(_BYTE **)(a1 + 24);
    v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4)
        v12 = 1;
      else
        v12 = (v7 - v4) >> 2;
      v13 = 2 * v12;
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v6, v12);
      v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      v16 = *(uint64_t **)(a1 + 8);
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 16) - (_QWORD)v16;
      if (v18)
      {
        v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        v19 = 8 * (v18 >> 3);
        v20 = v5;
        do
        {
          v21 = *v16++;
          *(_QWORD *)v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      v22 = *(char **)a1;
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v9 = (v7 - v8) >> 3;
      if (v9 >= -1)
        v10 = v9 + 1;
      else
        v10 = v9 + 2;
      v11 = v10 >> 1;
      v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(_QWORD *a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(*(_QWORD *)(a1 + 32), v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

uint64_t std::deque<std::__state<char>>::__maybe_remove_back_spare[abi:ne180100](_QWORD *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v7;

  v3 = a1[1];
  v2 = a1[2];
  if (v2 == v3)
    v4 = 0;
  else
    v4 = 42 * ((v2 - v3) >> 3) - 1;
  v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x2A)
    a2 = 1;
  if (v5 < 0x54)
    v7 = a2;
  else
    v7 = 0;
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

void std::deque<std::__state<char>>::__add_front_capacity(void **a1)
{
  _BYTE *v2;
  _BYTE *v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int64_t v21;
  char *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void *v41;
  void *__p;
  char *v43;
  char *v44;
  char *v45;
  _QWORD *v46;

  v2 = a1[1];
  v3 = a1[2];
  v4 = (v3 - v2) >> 3;
  if (v3 == v2)
    v5 = 0;
  else
    v5 = 42 * v4 - 1;
  v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(_QWORD)a1[5]] < 0x2A)
  {
    v7 = (uint64_t)(a1 + 3);
    v8 = a1[3];
    v9 = *a1;
    v10 = v8 - (_BYTE *)*a1;
    if (v4 >= v10 >> 3)
    {
      if (v8 == v9)
        v11 = 1;
      else
        v11 = v10 >> 2;
      v46 = a1 + 3;
      __p = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v7, v11);
      v43 = (char *)__p;
      v44 = (char *)__p;
      v45 = (char *)__p + 8 * v12;
      v41 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *> &>::push_back(&__p, &v41);
      v13 = (char *)a1[1];
      v14 = v44;
      if (v13 == a1[2])
      {
        v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            v15 = v43 - (_BYTE *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p)
                v23 = 1;
              else
                v23 = (v14 - (_BYTE *)__p) >> 2;
              v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)v46, v23);
              v26 = v43;
              v14 = &v24[8 * (v23 >> 2)];
              v27 = v44 - v43;
              if (v44 != v43)
              {
                v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                v28 = 8 * (v27 >> 3);
                v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  v30 = *(_QWORD *)v26;
                  v26 += 8;
                  *(_QWORD *)v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              v31 = __p;
              __p = v24;
              v43 = &v24[8 * (v23 >> 2)];
              v44 = v14;
              v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                v14 = v44;
              }
            }
            else
            {
              v16 = v15 >> 3;
              v17 = v15 >> 3 < -1;
              v18 = (v15 >> 3) + 2;
              if (v17)
                v19 = v18;
              else
                v19 = v16 + 1;
              v20 = &v43[-8 * (v19 >> 1)];
              v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                v14 = v43;
              }
              v22 = &v14[-8 * (v19 >> 1)];
              v14 = &v20[v21];
              v43 = v22;
              v44 = &v20[v21];
            }
          }
          v32 = *(_QWORD *)v13;
          v13 += 8;
          *(_QWORD *)v14 = v32;
          v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        v33 = (char *)a1[1];
      }
      v36 = *a1;
      v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      __p = v36;
      v43 = v33;
      v38 = (char *)a1[3];
      v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      v44 = v13;
      v45 = v38;
      if (v14 - v37 == 8)
        v40 = 21;
      else
        v40 = (uint64_t)a1[4] + 42;
      a1[4] = (void *)v40;
      if (v13 != v33)
        v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      if (v36)
        operator delete(v36);
    }
    else
    {
      if (v2 == v9)
      {
        __p = operator new(0xFC0uLL);
        std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(a1, &__p);
        v34 = a1[2];
        __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        __p = operator new(0xFC0uLL);
      }
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &__p);
      if ((_BYTE *)a1[2] - (_BYTE *)a1[1] == 8)
        v35 = 21;
      else
        v35 = (uint64_t)a1[4] + 42;
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 42;
    __p = (void *)*((_QWORD *)v3 - 1);
    a1[2] = v3 - 8;
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((uint64_t)a1, &__p);
  }
}

void sub_20ADBCEA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  void *v12;

  operator delete(v12);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t std::deque<std::__state<char>>::~deque[abi:ne180100](_QWORD *a1)
{
  _QWORD *v2;
  void **v3;
  void **v4;
  unint64_t v5;
  void **v6;
  char *v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;

  v2 = a1 + 5;
  v3 = (void **)a1[1];
  v4 = (void **)a1[2];
  if (v4 == v3)
  {
    v4 = (void **)a1[1];
  }
  else
  {
    v5 = a1[4];
    v6 = &v3[v5 / 0x2A];
    v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    v8 = (unint64_t)v3[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        std::allocator<std::__state<char>>::destroy[abi:ne180100]((uint64_t)v2, v7);
        v7 += 96;
        if (v7 - (_BYTE *)*v6 == 4032)
        {
          v9 = (char *)v6[1];
          ++v6;
          v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      v3 = (void **)a1[1];
      v4 = (void **)a1[2];
    }
  }
  *v2 = 0;
  v10 = (char *)v4 - (char *)v3;
  if ((unint64_t)((char *)v4 - (char *)v3) >= 0x11)
  {
    do
    {
      operator delete(*v3);
      v4 = (void **)a1[2];
      v3 = (void **)(a1[1] + 8);
      a1[1] = v3;
      v10 = (char *)v4 - (char *)v3;
    }
    while ((unint64_t)((char *)v4 - (char *)v3) > 0x10);
  }
  v11 = v10 >> 3;
  if (v11 == 1)
  {
    v12 = 21;
  }
  else
  {
    if (v11 != 2)
      goto LABEL_16;
    v12 = 42;
  }
  a1[4] = v12;
LABEL_16:
  while (v3 != v4)
  {
    v13 = *v3++;
    operator delete(v13);
  }
  return std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
    *(_QWORD *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v4);
  return a1;
}

char *std::vector<std::sub_match<char const*>>::__assign_with_size[abi:ne180100]<std::sub_match<char const*>*,std::sub_match<char const*>*>(_QWORD *a1, __int128 *a2, __int128 *a3, unint64_t a4)
{
  __int128 *v6;
  uint64_t v8;
  char *result;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  __int128 v17;
  int64_t v18;
  char *v19;
  unint64_t v20;
  __int128 *v21;
  char *v22;
  char *v23;
  __int128 v24;
  char *v25;
  char *v26;

  v6 = a2;
  v8 = a1[2];
  result = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= a4)
  {
    v19 = (char *)a1[1];
    v14 = a1 + 1;
    v13 = v19;
    v20 = 0xAAAAAAAAAAAAAAABLL * ((v19 - result) >> 3);
    if (v20 >= a4)
    {
      v25 = result;
      if (a2 != a3)
      {
        v26 = result;
        do
        {
          *(_OWORD *)v26 = *v6;
          v26[16] = *((_BYTE *)v6 + 16);
          v25 += 24;
          v6 = (__int128 *)((char *)v6 + 24);
          v26 += 24;
        }
        while (v6 != a3);
      }
      v18 = v25 - result;
      v13 = result;
    }
    else
    {
      v21 = (__int128 *)((char *)a2 + 24 * v20);
      if (v13 != result)
      {
        do
        {
          *(_OWORD *)result = *v6;
          result[16] = *((_BYTE *)v6 + 16);
          v6 = (__int128 *)((char *)v6 + 24);
          result += 24;
        }
        while (v6 != v21);
      }
      v22 = v13;
      if (v21 != a3)
      {
        v23 = v13;
        do
        {
          v24 = *v21;
          *((_QWORD *)v23 + 2) = *((_QWORD *)v21 + 2);
          *(_OWORD *)v23 = v24;
          v23 += 24;
          v21 = (__int128 *)((char *)v21 + 24);
          v22 += 24;
        }
        while (v21 != a3);
      }
      v18 = v22 - v13;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v11;
    result = std::vector<std::sub_match<char const*>>::__vallocate[abi:ne180100](a1, v12);
    v15 = (char *)a1[1];
    v14 = a1 + 1;
    v13 = v15;
    v16 = v15;
    if (v6 != a3)
    {
      v16 = v13;
      do
      {
        v17 = *v6;
        *((_QWORD *)v16 + 2) = *((_QWORD *)v6 + 2);
        *(_OWORD *)v16 = v17;
        v16 += 24;
        v6 = (__int128 *)((char *)v6 + 24);
      }
      while (v6 != a3);
    }
    v18 = v16 - v13;
  }
  *v14 = &v13[v18];
  return result;
}

char *std::vector<std::pair<unsigned long,char const*>>::__assign_with_size[abi:ne180100]<std::pair<unsigned long,char const*>*,std::pair<unsigned long,char const*>*>(_QWORD *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t *v6;
  uint64_t v8;
  char *result;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  char *v15;
  __int128 v16;
  char *v17;
  char *v18;
  unint64_t v19;
  __int128 *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a2;
  v8 = a1[2];
  result = (char *)*a1;
  if (a4 <= (v8 - (uint64_t)result) >> 4)
  {
    v18 = (char *)a1[1];
    v13 = a1 + 1;
    v12 = v18;
    v19 = (v18 - result) >> 4;
    if (v19 >= a4)
    {
      v26 = result;
      if (a2 != a3)
      {
        v27 = result;
        do
        {
          v28 = *v6;
          v29 = v6[1];
          v6 += 2;
          *(_QWORD *)v27 = v28;
          *((_QWORD *)v27 + 1) = v29;
          v27 += 16;
          v26 += 16;
        }
        while (v6 != a3);
      }
      v17 = (char *)(v26 - result);
      v12 = result;
    }
    else
    {
      v20 = (__int128 *)&a2[2 * v19];
      if (v12 != result)
      {
        do
        {
          v21 = *v6;
          v22 = v6[1];
          v6 += 2;
          *(_QWORD *)result = v21;
          *((_QWORD *)result + 1) = v22;
          result += 16;
        }
        while (v6 != (uint64_t *)v20);
      }
      v23 = v12;
      if (v20 != (__int128 *)a3)
      {
        v24 = v12;
        do
        {
          v25 = *v20++;
          *(_OWORD *)v24 = v25;
          v24 += 16;
          v23 += 16;
        }
        while (v20 != (__int128 *)a3);
      }
      v17 = (char *)(v23 - v12);
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60)
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 3;
    if (v8 >> 3 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
      v11 = 0xFFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<std::pair<unsigned long,char const*>>::__vallocate[abi:ne180100](a1, v11);
    v14 = (char *)a1[1];
    v13 = a1 + 1;
    v12 = v14;
    v15 = v14;
    if (v6 != a3)
    {
      v15 = v12;
      do
      {
        v16 = *(_OWORD *)v6;
        v6 += 2;
        *(_OWORD *)v15 = v16;
        v15 += 16;
      }
      while (v6 != a3);
    }
    v17 = (char *)(v15 - v12);
  }
  *v13 = &v17[(_QWORD)v12];
  return result;
}

void std::vector<std::sub_match<std::__wrap_iter<char const*>>>::resize(std::vector<std::ssub_match> *this, std::vector<std::ssub_match>::size_type __sz)
{
  std::vector<std::ssub_match>::size_type v2;
  BOOL v3;
  std::vector<std::ssub_match>::size_type v4;

  v2 = 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3);
  v3 = __sz >= v2;
  v4 = __sz - v2;
  if (v4 != 0 && v3)
  {
    std::vector<std::sub_match<std::__wrap_iter<char const*>>>::__append(this, v4);
  }
  else if (!v3)
  {
    this->__end_ = &this->__begin_[__sz];
  }
}

void std::vector<std::sub_match<std::__wrap_iter<char const*>>>::__append(std::vector<std::ssub_match> *this, std::vector<std::ssub_match>::size_type __n)
{
  std::__compressed_pair<std::ssub_match *> *p_end_cap;
  std::sub_match<std::__wrap_iter<const char *>> *v5;
  std::sub_match<std::__wrap_iter<const char *>> *value;
  std::sub_match<std::__wrap_iter<const char *>> *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  std::sub_match<std::__wrap_iter<const char *>> *v13;
  std::vector<std::ssub_match>::size_type v14;
  std::sub_match<std::__wrap_iter<const char *>> *v15;
  std::sub_match<std::__wrap_iter<const char *>> *v16;
  std::vector<std::ssub_match>::size_type v17;
  std::sub_match<std::__wrap_iter<const char *>> *v18;
  std::sub_match<std::__wrap_iter<const char *>> *v19;
  std::sub_match<std::__wrap_iter<const char *>> *end;
  std::vector<std::ssub_match>::pointer begin;
  std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> v22;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v5 = value;
  v7 = p_end_cap[-1].__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)v7) >> 3) >= __n)
  {
    if (__n)
    {
      v13 = &v7[__n];
      v14 = 24 * __n;
      do
      {
        v7->first.__i_ = 0;
        v7->second.__i_ = 0;
        v7->matched = 0;
        ++v7;
        v14 -= 24;
      }
      while (v14);
      v7 = v13;
    }
    this->__end_ = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (char *)this->__begin_) >> 3);
    v9 = v8 + __n;
    if (v8 + __n > 0xAAAAAAAAAAAAAAALL)
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (char *)this->__begin_) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::sub_match<char const*>>>((uint64_t)p_end_cap, v11);
    else
      v12 = 0;
    v15 = (std::sub_match<std::__wrap_iter<const char *>> *)&v12[24 * v8];
    v16 = &v15[__n];
    v17 = 24 * __n;
    v18 = v15;
    do
    {
      v18->first.__i_ = 0;
      v18->second.__i_ = 0;
      v18->matched = 0;
      ++v18;
      v17 -= 24;
    }
    while (v17);
    v19 = (std::sub_match<std::__wrap_iter<const char *>> *)&v12[24 * v11];
    begin = this->__begin_;
    end = this->__end_;
    if (end != this->__begin_)
    {
      do
      {
        v22 = end[-1].std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>>;
        *(_QWORD *)&v15[-1].matched = *(_QWORD *)&end[-1].matched;
        v15[-1].std::pair<std::__wrap_iter<const char *>, std::__wrap_iter<const char *>> = v22;
        --v15;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v15;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v19;
    if (end)
      operator delete(end);
  }
}

void std::vector<AlgosScoreStreamCSVFrameRow>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<AlgosScoreStreamCSVFrameRow>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void sub_20ADBD73C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_20ADBD7FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20ADBD984(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20ADBDA4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20ADBE720(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  __break(1u);
}

void sub_20ADBE8F4()
{
  void *v0;
  void *v1;

  objc_end_catch();
  JUMPOUT(0x20ADBE90CLL);
}

uint64_t std::vector<AlgosScoreStreamCSVFrameRow>::__push_back_slow_path<AlgosScoreStreamCSVFrameRow>(uint64_t *a1, const AlgosScoreStreamCSVFrameRow *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  char *v13;
  AlgosScoreStreamCSVFrameRow *v14;
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0x8E38E38E38E38E39 * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0x38E38E38E38E38ELL)
    std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0x8E38E38E38E38E39 * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x1C71C71C71C71C7)
    v9 = 0x38E38E38E38E38ELL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AlgosScoreStreamCSVFrameRow>>(v7, v9);
  else
    v10 = 0;
  v13 = v10;
  v14 = (AlgosScoreStreamCSVFrameRow *)&v10[72 * v4];
  v16 = &v10[72 * v9];
  AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow(v14, a2);
  v15 = (char *)v14 + 72;
  std::vector<AlgosScoreStreamCSVFrameRow>::__swap_out_circular_buffer(a1, &v13);
  v11 = a1[1];
  std::__split_buffer<AlgosScoreStreamCSVFrameRow>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_20ADBEA80(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<AlgosScoreStreamCSVFrameRow>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<AlgosScoreStreamCSVFrameRow>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<AlgosScoreStreamCSVFrameRow>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>>((uint64_t)(a1 + 2), a1[1], (const AlgosScoreStreamCSVFrameRow *)a1[1], *a1, (const AlgosScoreStreamCSVFrameRow *)*a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<AlgosScoreStreamCSVFrameRow>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(72 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<AlgosScoreStreamCSVFrameRow>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>>(uint64_t a1, uint64_t a2, const AlgosScoreStreamCSVFrameRow *a3, uint64_t a4, const AlgosScoreStreamCSVFrameRow *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  const AlgosScoreStreamCSVFrameRow *v9;
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
  v13 = 0;
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    v9 = a3;
    do
    {
      v9 = (const AlgosScoreStreamCSVFrameRow *)((char *)v9 - 72);
      AlgosScoreStreamCSVFrameRow::AlgosScoreStreamCSVFrameRow((AlgosScoreStreamCSVFrameRow *)(v7 - 72), v9);
      v7 = *((_QWORD *)&v15 + 1) - 72;
      *((_QWORD *)&v15 + 1) -= 72;
    }
    while (v9 != a5);
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamCSVFrameRow>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

void sub_20ADBEBF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamCSVFrameRow>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamCSVFrameRow>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamCSVFrameRow>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamCSVFrameRow>,std::reverse_iterator<AlgosScoreStreamCSVFrameRow*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 72;
  }
}

uint64_t std::__split_buffer<AlgosScoreStreamCSVFrameRow>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<AlgosScoreStreamCSVFrameRow>::__destruct_at_end[abi:ne180100](a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<AlgosScoreStreamCSVFrameRow>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 9;
      *(_QWORD *)(a1 + 16) = v2 - 9;
      if (*((char *)v2 - 49) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void **std::vector<AlgosScoreStreamFrameRow>::push_back[abi:ne180100](uint64_t *a1, AlgosScoreStreamFrameRow *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void **result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  void *v15;
  AlgosScoreStreamFrameRow *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - *a1) >> 6;
    if ((unint64_t)(v10 + 1) >> 58)
      std::vector<AlgosScoreConnectionFrameRow>::__throw_length_error[abi:ne180100]();
    v11 = v5 - *a1;
    v12 = v11 >> 5;
    if (v11 >> 5 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFC0)
      v13 = 0x3FFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v19 = v4;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AlgosScoreConnectionFrameRow>>(v4, v13);
    else
      v14 = 0;
    v15 = v14;
    v16 = (AlgosScoreStreamFrameRow *)&v14[64 * v10];
    v18 = &v14[64 * v13];
    AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow(v16, a2);
    v17 = (char *)v16 + 64;
    std::vector<AlgosScoreStreamFrameRow>::__swap_out_circular_buffer(a1, &v15);
    v9 = a1[1];
    result = std::__split_buffer<AlgosScoreStreamFrameRow>::~__split_buffer(&v15);
  }
  else
  {
    result = (void **)AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow(*(AlgosScoreStreamFrameRow **)(v4 - 8), a2);
    v9 = v7 + 64;
    a1[1] = v7 + 64;
  }
  a1[1] = v9;
  return result;
}

void sub_20ADBEE14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

void sub_20ADBF144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_QWORD *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,_QWORD *a33)
{
  void *v33;
  void *v34;

  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&a24, a25);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&a32, a33);

  _Unwind_Resume(a1);
}

void sub_20ADBFB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,void *__p,uint64_t a47,int a48,__int16 a49,char a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,_QWORD *a58)
{
  void *v58;
  uint64_t v59;

  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v59, a58);

  _Unwind_Resume(a1);
}

_QWORD *AlgosScoreStreamFrameRow::StringForEvent@<X0>(unsigned int a1@<W0>, _QWORD *a2@<X8>)
{
  char *v2;

  if (a1 >= 6)
    v2 = "INVALID EVENT";
  else
    v2 = (&AlgosScoreStreamFrameRow::event_strings)[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void AlgosScoreStreamFrameRow::GetParam(uint64_t a1@<X0>, const void **a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  uint64_t v7;
  __int128 v8;
  const std::string::value_type *v9;
  std::string::size_type v10;

  v7 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(a1 + 40, a2);
  if (a1 + 48 == v7)
  {
    if ((*(char *)(a3 + 23) & 0x80000000) == 0)
    {
      *(_OWORD *)&a4->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
      a4->__r_.__value_.__r.__words[2] = *(_QWORD *)(a3 + 16);
      return;
    }
    v9 = *(const std::string::value_type **)a3;
    v10 = *(_QWORD *)(a3 + 8);
  }
  else
  {
    if ((*(char *)(v7 + 79) & 0x80000000) == 0)
    {
      v8 = *(_OWORD *)(v7 + 56);
      a4->__r_.__value_.__r.__words[2] = *(_QWORD *)(v7 + 72);
      *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v8;
      return;
    }
    v9 = *(const std::string::value_type **)(v7 + 56);
    v10 = *(_QWORD *)(v7 + 64);
  }
  std::string::__init_copy_ctor_external(a4, v9, v10);
}

void sub_20ADBFF08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  void *v28;
  void *v29;
  void *v30;

  if (a28 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_20ADC01C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  void *v24;
  void *v25;
  void *v26;

  _Unwind_Resume(a1);
}

uint64_t std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t *v8;

  v2 = a1 + 8;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return v2;
  v5 = a1 + 16;
  v6 = a1 + 8;
  do
  {
    v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)(v3 + 32), a2);
    v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      v8 = (uint64_t *)v3;
      v6 = v3;
    }
    v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || std::less<std::string>::operator()[abi:ne180100](v5, a2, (const void **)(v6 + 32)))
    return v2;
  return v6;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

_OWORD *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  void **v6;
  _OWORD *v7;
  uint64_t **v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v12[2];
  char v13;
  uint64_t v14;

  v6 = (void **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x50uLL);
    v12[1] = a1 + 1;
    v9 = *a4;
    v10 = *((_QWORD *)*a4 + 2);
    v7[2] = **a4;
    *((_QWORD *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    *v9 = 0;
    *((_QWORD *)v7 + 8) = 0;
    *((_QWORD *)v7 + 9) = 0;
    *((_QWORD *)v7 + 7) = 0;
    v13 = 1;
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__insert_node_at(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v7;
}

_QWORD *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<AlgosScoreStreamFrameRow>,std::reverse_iterator<AlgosScoreStreamFrameRow*>,std::reverse_iterator<AlgosScoreStreamFrameRow*>,std::reverse_iterator<AlgosScoreStreamFrameRow*>>(uint64_t a1, uint64_t a2, const AlgosScoreStreamFrameRow *a3, uint64_t a4, const AlgosScoreStreamFrameRow *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  const AlgosScoreStreamFrameRow *v9;
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
  v13 = 0;
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    v9 = a3;
    do
    {
      v9 = (const AlgosScoreStreamFrameRow *)((char *)v9 - 64);
      AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow((AlgosScoreStreamFrameRow *)(v7 - 64), v9);
      v7 = *((_QWORD *)&v15 + 1) - 64;
      *((_QWORD *)&v15 + 1) -= 64;
    }
    while (v9 != a5);
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamFrameRow>,std::reverse_iterator<AlgosScoreStreamFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

void sub_20ADC084C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamFrameRow>,std::reverse_iterator<AlgosScoreStreamFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamFrameRow>,std::reverse_iterator<AlgosScoreStreamFrameRow*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamFrameRow>,std::reverse_iterator<AlgosScoreStreamFrameRow*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<AlgosScoreStreamFrameRow>,std::reverse_iterator<AlgosScoreStreamFrameRow*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  if (v1 != v2)
  {
    v3 = v1 + 40;
    do
    {
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v3, *(_QWORD **)(v3 + 8));
      v4 = v3 + 24;
      v3 += 64;
    }
    while (v4 != v2);
  }
}

void std::__split_buffer<AlgosScoreStreamFrameRow>::clear[abi:ne180100](uint64_t a1)
{
  uint64_t i;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 64;
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(i - 24, *(_QWORD **)(i - 16));
  }
}

void std::vector<AlgosScoreStreamFrameRow>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;

  v1 = *a1;
  v2 = (char *)**a1;
  if (v2)
  {
    v4 = (char *)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v6 = v4 - 64;
        std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)(v4 - 24), *((_QWORD **)v4 - 2));
        v4 = v6;
      }
      while (v6 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void AlgosScoreConnectionFrameRow::AlgosScoreConnectionFrameRow(AlgosScoreConnectionFrameRow *this, unint64_t a2, double a3, double a4, double a5, double a6, double a7, int a8)
{
  *((double *)this + 1) = a3;
  *((double *)this + 2) = a4;
  *((double *)this + 3) = a5;
  *((double *)this + 4) = a6;
  *((double *)this + 5) = a7;
  *((_DWORD *)this + 14) = a8;
  *(_QWORD *)this = a2;
  if (a4 == -1.0)
  {
    *((_QWORD *)this + 6) = 0;
    *((_DWORD *)this + 14) = -1;
  }
  else if (a4 == 0.0)
  {
    *((_QWORD *)this + 6) = 0x54E6DC186EF9F45CLL;
  }
  else
  {
    *((double *)this + 6) = (double)a2 / a4;
  }
}

void AlgosScoreConnectionFrameRow::AlgosScoreConnectionFrameRow(AlgosScoreConnectionFrameRow *this, const AlgosScoreConnectionFrameRow *a2)
{
  *(_OWORD *)((char *)this + 8) = *(_OWORD *)((char *)a2 + 8);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)a2 + 24);
  *((_DWORD *)this + 14) = *((_DWORD *)a2 + 14);
  *(_OWORD *)((char *)this + 40) = *(_OWORD *)((char *)a2 + 40);
  *(_QWORD *)this = *(_QWORD *)a2;
}

void sub_20ADC1934(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_20ADC19E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20ADC1B70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20ADC1C24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

#error "20ADC2B34: call analysis failed (funcsize=35)"

void sub_20ADC2B4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow(uint64_t a1, const std::string *a2, const std::string *a3, double a4, double a5)
{
  std::string *v8;

  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  v8 = (std::string *)(a1 + 24);
  *(_OWORD *)a1 = 0u;
  *(double *)(a1 + 56) = a4;
  std::string::operator=((std::string *)a1, a2);
  *(double *)(a1 + 48) = a5;
  std::string::operator=(v8, a3);
  return a1;
}

void sub_20ADC2C0C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 47) < 0)
    operator delete(*v2);
  AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((void **)v1);
  _Unwind_Resume(a1);
}

void AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow(AlgosScoreCombinerFrameRow *this, const std::string *a2)
{
  std::string *v4;

  v4 = (std::string *)((char *)this + 24);
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  *((_QWORD *)this + 7) = a2[2].__r_.__value_.__l.__size_;
  std::string::operator=((std::string *)this, a2);
  *((_QWORD *)this + 6) = a2[2].__r_.__value_.__l.__data_;
  std::string::operator=(v4, a2 + 1);
}

void sub_20ADC2C90(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 47) < 0)
    operator delete(*v2);
  AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((void **)v1);
  _Unwind_Resume(a1);
}

std::string *AlgosScoreCombinerFrameRow::operator=(std::string *a1, const std::string *a2)
{
  a1[2].__r_.__value_.__l.__size_ = a2[2].__r_.__value_.__l.__size_;
  std::string::operator=(a1, a2);
  a1[2].__r_.__value_.__r.__words[0] = a2[2].__r_.__value_.__r.__words[0];
  std::string::operator=(a1 + 1, a2 + 1);
  return a1;
}

_QWORD *AlgosScoreCombinerFrameRow::GetHeaderDescription@<X0>(_QWORD *a1@<X8>)
{
  char __str[256];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x100uLL, "     %-10s %-10s %-10s %-10s", "score", "type", "weight", "label");
  return std::string::basic_string[abi:ne180100]<0>(a1, __str);
}

_QWORD *AlgosScoreCombinerFrameRow::GetRawDescription@<X0>(AlgosScoreCombinerFrameRow *this@<X0>, _QWORD *a2@<X8>)
{
  const char *v3;
  const char *v4;
  char __str[256];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (const char *)this;
  if (*((char *)this + 23) < 0)
    v3 = *(const char **)this;
  v4 = (char *)this + 24;
  if (*((char *)this + 47) < 0)
    v4 = *(const char **)v4;
  snprintf(__str, 0x100uLL, "%-10.3f %-10s %-10.3f %-10s", *((double *)this + 7), v3, *((double *)this + 6), v4);
  return std::string::basic_string[abi:ne180100]<0>(a2, __str);
}

void AlgosScoreCombinerFrame::DebugPrint(const std::string **this, int a2)
{
  void **v4;
  const std::string *v5;
  const std::string *v6;
  int v7;
  void **v8;
  BOOL v9;
  void *v10[2];
  char v11;
  void *__p[2];
  char v13;
  void *v14;
  char v15;

  AlgosScoreCombinerFrameRow::GetHeaderDescription(__p);
  if (v13 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  puts((const char *)v4);
  if (v13 < 0)
    operator delete(__p[0]);
  v5 = *this;
  v6 = this[1];
  if (*this != v6)
  {
    v7 = 0;
    do
    {
      AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow((AlgosScoreCombinerFrameRow *)__p, v5);
      if (a2 >= 1)
      {
        AlgosScoreCombinerFrameRow::GetRawDescription((AlgosScoreCombinerFrameRow *)__p, v10);
        if (v11 >= 0)
          v8 = v10;
        else
          v8 = (void **)v10[0];
        printf("%3d: %s\n", v7, (const char *)v8);
        if (v11 < 0)
          operator delete(v10[0]);
        ++v7;
      }
      if (v15 < 0)
        operator delete(v14);
      if (v13 < 0)
        operator delete(__p[0]);
      v9 = __OFSUB__(a2--, 1);
      if (a2 < 0 != v9)
        break;
      v5 = (const std::string *)((char *)v5 + 64);
    }
    while (v5 != v6);
  }
}

void sub_20ADC2F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow((void **)va);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void **a1)
{
  operator delete(*a1);
}

_QWORD *AlgosScoreStreamFrameRow::AlgosScoreStreamFrameRow(_QWORD *a1, const std::string *a2)
{
  std::logic_error *exception;

  a1[6] = 0;
  a1[5] = a1 + 6;
  a1[7] = 0;
  if (!AlgosScoreStreamFrameRow::SetCSVRow((uint64_t)a1, a2))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "AlgosScoreStreamFrameRow can't parse the CSV");
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8D0] + 16);
    __cxa_throw(exception, (struct type_info *)off_24C3CAE48, MEMORY[0x24BEDAB88]);
  }
  return a1;
}

void sub_20ADC2FE4(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  _QWORD **v3;

  __cxa_free_exception(v2);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v1, *v3);
  _Unwind_Resume(a1);
}

BOOL AlgosScoreStreamFrameRow::SetCSVRow(uint64_t a1, const std::string *a2)
{
  _QWORD *v3;
  std::string *v4;
  __int128 v5;
  std::string *v6;
  std::string::size_type *v7;
  uint64_t v8;
  std::string::size_type v9;
  std::string::size_type size;
  std::string::size_type v11;
  _BOOL8 v12;
  uint64_t **v13;
  _QWORD *v14;
  int64_t v15;
  std::string *v16;
  _BYTE *v17;
  size_t v18;
  std::string *v19;
  _BYTE *v20;
  std::string::size_type v21;
  _OWORD *v22;
  void **v23;
  std::string::size_type v24;
  std::string::size_type v25;
  std::string v27;
  std::string v28;
  std::string v29;
  uint64_t v30;
  void *__p;
  char v32;
  uint64_t v33;
  std::string __str;
  const void **v35;
  std::string *v36;
  unint64_t v37;
  std::string v38;
  _QWORD v39[13];
  char v40;
  uint64_t v41;
  _OWORD *v42[3];

  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](v39, a2, 24);
  memset(&v38, 0, sizeof(v38));
  v35 = 0;
  v36 = 0;
  v37 = 0;
  while (1)
  {
    v3 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v39, (uint64_t)&v38, 0x2Cu);
    v4 = v36;
    if ((*((_BYTE *)v3 + *(_QWORD *)(*v3 - 24) + 32) & 5) != 0)
      break;
    if ((unint64_t)v36 >= v37)
    {
      v6 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v35, (__int128 *)&v38);
    }
    else
    {
      if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(v36, v38.__r_.__value_.__l.__data_, v38.__r_.__value_.__l.__size_);
      }
      else
      {
        v5 = *(_OWORD *)&v38.__r_.__value_.__l.__data_;
        v36->__r_.__value_.__r.__words[2] = v38.__r_.__value_.__r.__words[2];
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v5;
      }
      v6 = v4 + 1;
    }
    v36 = v6;
  }
  v7 = (std::string::size_type *)MEMORY[0x24BEDB7F0];
  v8 = MEMORY[0x24BEDB848];
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v36 - (char *)v35) >> 3) < 6)
    goto LABEL_21;
  *(_DWORD *)a1 = AlgosScoreStreamFrameRow::EventForString(v35);
  *(double *)(a1 + 8) = std::stod((const std::string *)v35 + 1, 0);
  *(double *)(a1 + 16) = std::stod((const std::string *)v35 + 2, 0);
  *(double *)(a1 + 24) = std::stod((const std::string *)v35 + 3, 0);
  *(double *)(a1 + 32) = std::stod((const std::string *)v35 + 4, 0);
  if (*((char *)v35 + 143) < 0)
    std::string::__init_copy_ctor_external(&__str, (const std::string::value_type *)v35[15], (std::string::size_type)v35[16]);
  else
    __str = *(std::string *)((_BYTE *)v35 + 5);
  v9 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
  {
    if (*__str.__r_.__value_.__l.__data_ != 34)
      goto LABEL_47;
    size = __str.__r_.__value_.__l.__size_;
  }
  else
  {
    if (__str.__r_.__value_.__s.__data_[0] != 34)
    {
LABEL_21:
      v12 = 0;
      goto LABEL_53;
    }
    size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  }
  v11 = size - 1;
  if ((*((_BYTE *)&__str.__r_.__value_.__s + 23) & 0x80) != 0)
  {
    if (*(_BYTE *)(__str.__r_.__value_.__r.__words[0] + v11) == 34)
    {
      v9 = __str.__r_.__value_.__l.__size_;
      goto LABEL_24;
    }
LABEL_47:
    v12 = 0;
LABEL_52:
    operator delete(__str.__r_.__value_.__l.__data_);
    goto LABEL_53;
  }
  if (__str.__r_.__value_.__s.__data_[v11] != 34)
    goto LABEL_21;
LABEL_24:
  std::string::basic_string(&v29, &__str, 1uLL, v9 - 2, (std::allocator<char> *)&v28);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  __str = v29;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](&v29, &__str, 24);
  v13 = (uint64_t **)(a1 + 40);
  while (1)
  {
    v14 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v29, (uint64_t)&v38, 0x20u);
    v12 = (*(_DWORD *)((_BYTE *)v14 + *(_QWORD *)(*v14 - 24) + 32) & 5) != 0;
    if ((*(_DWORD *)((_BYTE *)v14 + *(_QWORD *)(*v14 - 24) + 32) & 5) != 0)
      break;
    v15 = (v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? HIBYTE(v38.__r_.__value_.__r.__words[2])
        : v38.__r_.__value_.__l.__size_;
    v16 = (v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v38
        : (std::string *)v38.__r_.__value_.__r.__words[0];
    if (v15 < 1)
      break;
    v17 = (char *)v16 + v15;
    v18 = v15;
    v19 = v16;
    while (1)
    {
      v20 = memchr(v19, 58, v18);
      if (!v20)
      {
LABEL_48:
        v12 = 0;
        goto LABEL_49;
      }
      if (*v20 == 58)
        break;
      v19 = (std::string *)(v20 + 1);
      v18 = v17 - (_BYTE *)v19;
      if (v17 - (_BYTE *)v19 < 1)
        goto LABEL_48;
    }
    if (v20 == v17)
      break;
    v21 = v20 - (_BYTE *)v16;
    if (v21 == -1)
      break;
    std::string::basic_string(&v28, &v38, v21 + 1, v15 - 2, (std::allocator<char> *)&v27);
    std::string::basic_string(&v27, &v38, 0, v21, (std::allocator<char> *)v42);
    v42[0] = &v27;
    v22 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(v13, (const void **)&v27.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, v42);
    v23 = (void **)v22 + 7;
    if (*((char *)v22 + 79) < 0)
      operator delete(*v23);
    *(std::string *)v23 = v28;
    *((_BYTE *)&v28.__r_.__value_.__s + 23) = 0;
    v28.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v27.__r_.__value_.__l.__data_);
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v28.__r_.__value_.__l.__data_);
    }
  }
LABEL_49:
  v29.__r_.__value_.__r.__words[0] = *v7;
  v24 = v7[9];
  *(std::string::size_type *)((char *)v29.__r_.__value_.__r.__words + *(_QWORD *)(v29.__r_.__value_.__r.__words[0] - 24)) = v7[8];
  v29.__r_.__value_.__r.__words[2] = v24;
  v30 = v8 + 16;
  if (v32 < 0)
    operator delete(__p);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x20BD3123C](&v33);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_52;
LABEL_53:
  v29.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v29);
  if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v38.__r_.__value_.__l.__data_);
  v39[0] = *v7;
  v25 = v7[9];
  *(_QWORD *)((char *)v39 + *(_QWORD *)(v39[0] - 24)) = v7[8];
  v39[2] = v25;
  v39[3] = v8 + 16;
  if (v40 < 0)
    operator delete((void *)v39[11]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x20BD3123C](&v41);
  return v12;
}

void sub_20ADC3480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,void *a57,uint64_t a58,int a59,__int16 a60,char a61,char a62,char a63)
{
  void *a66;
  char a71;
  char a72;

  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a22);
  if (a62 < 0)
    operator delete(a57);
  a22 = (uint64_t)&a63;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a22);
  if (a71 < 0)
    operator delete(a66);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a72);
  _Unwind_Resume(a1);
}

void AlgosScoreStreamFrameRow::GetParamString(AlgosScoreStreamFrameRow *this@<X0>, uint64_t a2@<X8>)
{
  __int128 *v3;
  char *v4;
  _QWORD *v5;
  std::string *v6;
  __int128 v7;
  void **v8;
  std::string::size_type v9;
  std::string *v10;
  __int128 v11;
  std::string *v12;
  std::string::size_type v13;
  char v14;
  __int128 *v15;
  __int128 *v16;
  BOOL v17;
  std::string v18;
  std::string v19;
  std::string v20;
  std::string v21;
  void *__p[2];
  unsigned __int8 v23;
  _QWORD v24[5];

  v24[2] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  v3 = (__int128 *)*((_QWORD *)this + 5);
  v4 = (char *)this + 48;
  if (v3 != (__int128 *)((char *)this + 48))
  {
    v5 = (_QWORD *)(a2 + 8);
    do
    {
      std::pair<std::string const,std::string>::pair[abi:ne180100](&v21, v3 + 2);
      std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a2, (const void **)&v21.__r_.__value_.__l.__data_, (uint64_t)&v18);
      v6 = std::string::append(&v18, ":");
      v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
      v19.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v7;
      v6->__r_.__value_.__l.__size_ = 0;
      v6->__r_.__value_.__r.__words[2] = 0;
      v6->__r_.__value_.__r.__words[0] = 0;
      if ((v23 & 0x80u) == 0)
        v8 = __p;
      else
        v8 = (void **)__p[0];
      if ((v23 & 0x80u) == 0)
        v9 = v23;
      else
        v9 = (std::string::size_type)__p[1];
      v10 = std::string::append(&v19, (const std::string::value_type *)v8, v9);
      v11 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
      v20.__r_.__value_.__r.__words[2] = v10->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v11;
      v10->__r_.__value_.__l.__size_ = 0;
      v10->__r_.__value_.__r.__words[2] = 0;
      v10->__r_.__value_.__r.__words[0] = 0;
      v12 = std::string::append(&v20, " ");
      v13 = v12->__r_.__value_.__r.__words[0];
      v24[0] = v12->__r_.__value_.__l.__size_;
      *(_QWORD *)((char *)v24 + 7) = *(std::string::size_type *)((char *)&v12->__r_.__value_.__r.__words[1] + 7);
      v14 = HIBYTE(v12->__r_.__value_.__r.__words[2]);
      v12->__r_.__value_.__l.__size_ = 0;
      v12->__r_.__value_.__r.__words[2] = 0;
      v12->__r_.__value_.__r.__words[0] = 0;
      if (*(char *)(a2 + 23) < 0)
        operator delete(*(void **)a2);
      *(_QWORD *)a2 = v13;
      *v5 = v24[0];
      *(_QWORD *)(a2 + 15) = *(_QWORD *)((char *)v24 + 7);
      *(_BYTE *)(a2 + 23) = v14;
      if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v20.__r_.__value_.__l.__data_);
      if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v19.__r_.__value_.__l.__data_);
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v18.__r_.__value_.__l.__data_);
      if ((char)v23 < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v21.__r_.__value_.__l.__data_);
      v15 = (__int128 *)*((_QWORD *)v3 + 1);
      if (v15)
      {
        do
        {
          v16 = v15;
          v15 = *(__int128 **)v15;
        }
        while (v15);
      }
      else
      {
        do
        {
          v16 = (__int128 *)*((_QWORD *)v3 + 2);
          v17 = *(_QWORD *)v16 == (_QWORD)v3;
          v3 = v16;
        }
        while (!v17);
      }
      v3 = v16;
    }
    while (v16 != (__int128 *)v4);
  }
}

void sub_20ADC3724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,void *a29)
{
  uint64_t v29;

  if (a28 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a15 < 0)
    operator delete(a10);
  AlgosScoreCombinerFrameRow::~AlgosScoreCombinerFrameRow(&a29);
  if (*(char *)(v29 + 23) < 0)
    operator delete(*(void **)v29);
  _Unwind_Resume(a1);
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  size_t v5;
  size_t v6;
  uint64_t result;
  char *v8;
  const void *v9;
  char *v10;
  const void *v11;

  if (*((char *)a1 + 23) >= 0)
    v5 = *((unsigned __int8 *)a1 + 23);
  else
    v5 = (size_t)a1[1];
  if (*((char *)a2 + 23) >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  result = std::string::basic_string[abi:ne180100](a3, v6 + v5);
  if (*(char *)(result + 23) >= 0)
    v8 = (char *)result;
  else
    v8 = *(char **)result;
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0)
      v9 = a1;
    else
      v9 = *a1;
    result = (uint64_t)memmove(v8, v9, v5);
  }
  v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0)
      v11 = a2;
    else
      v11 = *a2;
    result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

std::string *AlgosScoreStreamFrameRow::GetCSVHeader@<X0>(AlgosScoreStreamFrameRow *this@<X0>, std::string *a2@<X8>)
{
  int v2;
  std::string *result;
  std::string *v5;

  v2 = (int)this;
  result = (std::string *)std::string::basic_string[abi:ne180100]<0>(a2, "Event,Start,End,Weight,Quality,Params");
  if (v2)
  {
    v5 = std::string::append(a2, "\n");
    return std::string::operator=(a2, v5);
  }
  return result;
}

void sub_20ADC38B0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void AlgosScoreStreamFrameRow::GetCSVRow(AlgosScoreStreamFrameRow *this@<X0>, int a2@<W1>, _QWORD *a3@<X8>)
{
  std::string *v6;
  std::string *v7;
  int v8;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  void **v15;
  void *__p[2];
  char v17;
  void *v18[2];
  char v19;
  std::string v20;
  char __str[1024];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(&v20, "%s,%.17g,%.17g,%.17g,%.17g,\"%s\"");
  if (a2)
  {
    v6 = std::string::append(&v20, "\n");
    std::string::operator=(&v20, v6);
  }
  if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v7 = &v20;
  else
    v7 = (std::string *)v20.__r_.__value_.__r.__words[0];
  AlgosScoreStreamFrameRow::StringForEvent(*(_DWORD *)this, v18);
  v8 = v19;
  v9 = (void **)v18[0];
  v10 = *((_QWORD *)this + 1);
  v11 = *((_QWORD *)this + 2);
  v12 = *((_QWORD *)this + 3);
  v13 = *((_QWORD *)this + 4);
  AlgosScoreStreamFrameRow::GetParamString(this, (uint64_t)__p);
  v14 = v18;
  if (v8 < 0)
    v14 = v9;
  if (v17 >= 0)
    v15 = __p;
  else
    v15 = (void **)__p[0];
  snprintf(__str, 0x400uLL, (const char *)v7, v14, v10, v11, v12, v13, v15);
  if (v17 < 0)
    operator delete(__p[0]);
  if (v19 < 0)
    operator delete(v18[0]);
  std::string::basic_string[abi:ne180100]<0>(a3, __str);
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v20.__r_.__value_.__l.__data_);
}

void sub_20ADC3A34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a23 < 0)
    operator delete(__p);
  if (a29 < 0)
    operator delete(a24);
  _Unwind_Resume(exception_object);
}

_QWORD *std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](_QWORD *a1, const std::string *a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  std::ios_base *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = MEMORY[0x24BEDB858];
  v6 = MEMORY[0x24BEDB858] + 104;
  a1[16] = MEMORY[0x24BEDB858] + 104;
  a1[2] = v5 + 64;
  v7 = a1 + 2;
  v8 = (uint64_t)(a1 + 3);
  v9 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v10 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v11 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *a1 = v10;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v10 - 24)) = v11;
  a1[1] = 0;
  v12 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v12, a1 + 3);
  v12[1].__vftable = 0;
  v12[1].__fmtflags_ = -1;
  v13 = v9[4];
  v14 = v9[5];
  a1[2] = v13;
  *(_QWORD *)((char *)v7 + *(_QWORD *)(v13 - 24)) = v14;
  v15 = v9[1];
  *a1 = v15;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v15 - 24)) = v9[6];
  *a1 = v5 + 24;
  a1[16] = v6;
  a1[2] = v5 + 64;
  std::stringbuf::basic_stringbuf[abi:ne180100](v8, a2, a3);
  return a1;
}

void sub_20ADC3B6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x20BD3123C](v1);
  _Unwind_Resume(a1);
}

_QWORD *std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v8;
  int v9;
  char v11;

  MEMORY[0x20BD31194](&v11, a1, 1);
  if (!v11)
    return a1;
  if (*(char *)(a2 + 23) < 0)
  {
    **(_BYTE **)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 23) = 0;
  }
  v6 = 0;
  while (1)
  {
    v7 = *(_QWORD **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 40);
    v8 = (_BYTE *)v7[3];
    if (v8 != (_BYTE *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(_QWORD *))(*v7 + 80))(v7);
    if ((_DWORD)v7 == -1)
      break;
LABEL_9:
    if (v7 == a3)
    {
      v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(_QWORD *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6)
    v9 = 2;
  else
    v9 = 6;
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_20ADC3CC0(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  __cxa_begin_catch(a1);
  v2 = *v1;
  *(_DWORD *)((char *)v1 + *(_QWORD *)(*v1 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(_QWORD *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x20ADC3C8CLL);
  }
  __cxa_rethrow();
}

void sub_20ADC3D04(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t AlgosScoreStreamFrameRow::EventForString(const void **a1)
{
  unsigned __int8 v2;
  uint64_t i;
  uint64_t v4;
  std::logic_error *exception;
  std::string *v7;
  __int128 v8;
  std::string *v9;
  __int128 v10;
  std::string v11;
  std::string v12;
  std::string __p;

  if ((v2 & 1) == 0
  {
    qword_254626FD0 = 0;
    qword_254626FC8 = 0;
    AlgosScoreStreamFrameRow::EventForString(std::string &)::event_map = (uint64_t)&qword_254626FC8;
    __cxa_atexit((void (*)(void *))std::map<std::string,AlgosEventTypes>::~map[abi:ne180100], &AlgosScoreStreamFrameRow::EventForString(std::string &)::event_map, &dword_20ADAC000);
  }
  if (!qword_254626FD0)
  {
    for (i = 0; i != 6; ++i)
    {
      std::string::basic_string[abi:ne180100]<0>(&__p, (&AlgosScoreStreamFrameRow::event_strings)[i]);
      v12.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
      *((_DWORD *)std::__tree<std::__value_type<std::string,AlgosEventTypes>,std::__map_value_compare<std::string,std::__value_type<std::string,AlgosEventTypes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,AlgosEventTypes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&AlgosScoreStreamFrameRow::EventForString(std::string &)::event_map, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, &v12)+ 14) = i;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  v4 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>((uint64_t)&AlgosScoreStreamFrameRow::EventForString(std::string &)::event_map, a1);
  if ((uint64_t *)v4 == &qword_254626FC8)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    v7 = std::string::append(&v11, "\"");
    v8 = *(_OWORD *)&v7->__r_.__value_.__l.__data_;
    v12.__r_.__value_.__r.__words[2] = v7->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v12.__r_.__value_.__l.__data_ = v8;
    v7->__r_.__value_.__l.__size_ = 0;
    v7->__r_.__value_.__r.__words[2] = 0;
    v7->__r_.__value_.__r.__words[0] = 0;
    v9 = std::string::append(&v12, " is not a valid event");
    v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    __p.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    std::logic_error::logic_error(exception, &__p);
    exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
    __cxa_throw(exception, (struct type_info *)off_24C3CAE40, MEMORY[0x24BEDAB00]);
  }
  return *(unsigned int *)(v4 + 56);
}

void sub_20ADC3EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  void *v28;
  int v29;

  if (a28 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a15 < 0)
  {
    operator delete(a10);
    if ((v29 & 1) == 0)
LABEL_10:
      _Unwind_Resume(a1);
  }
  else if (!v29)
  {
    goto LABEL_10;
  }
  __cxa_free_exception(v28);
  goto LABEL_10;
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x20BD3123C](a1 + 128);
  return a1;
}

std::string *std::pair<std::string const,std::string>::pair[abi:ne180100](std::string *this, __int128 *a2)
{
  __int128 v4;
  std::string *v5;
  __int128 v6;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((_QWORD *)a2 + 4));
  }
  else
  {
    v6 = *(__int128 *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  return this;
}

void sub_20ADC4084(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t std::map<std::string,AlgosEventTypes>::~map[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<std::string,AlgosEventTypes>,std::__map_value_compare<std::string,std::__value_type<std::string,AlgosEventTypes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,AlgosEventTypes>>>::destroy(a1, *(char **)(a1 + 8));
  return a1;
}

void std::__tree<std::__value_type<std::string,AlgosEventTypes>,std::__map_value_compare<std::string,std::__value_type<std::string,AlgosEventTypes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,AlgosEventTypes>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,AlgosEventTypes>,std::__map_value_compare<std::string,std::__value_type<std::string,AlgosEventTypes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,AlgosEventTypes>>>::destroy(a1, *(_QWORD *)a2);
    std::__tree<std::__value_type<std::string,AlgosEventTypes>,std::__map_value_compare<std::string,std::__value_type<std::string,AlgosEventTypes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,AlgosEventTypes>>>::destroy(a1, *((_QWORD *)a2 + 1));
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

_OWORD *std::__tree<std::__value_type<std::string,AlgosEventTypes>,std::__map_value_compare<std::string,std::__value_type<std::string,AlgosEventTypes>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,AlgosEventTypes>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  void **v6;
  _OWORD *v7;
  uint64_t **v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;

  v6 = (void **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>((uint64_t)a1, &v12, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x40uLL);
    v9 = *a4;
    v10 = *((_QWORD *)*a4 + 2);
    v7[2] = **a4;
    *((_QWORD *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    *v9 = 0;
    *((_DWORD *)v7 + 14) = 0;
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__insert_node_at(a1, v12, v8, (uint64_t *)v7);
  }
  return v7;
}

_QWORD *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_leaf_high(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *result;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v5 = (_QWORD *)v4;
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v5;
        result = v5;
        if (!*v5)
          goto LABEL_9;
      }
      v4 = v5[1];
    }
    while (v4);
    result = v5 + 1;
  }
  else
  {
    result = (_QWORD *)(a1 + 8);
  }
LABEL_9:
  *a2 = v5;
  return result;
}

_QWORD *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::_DetachedTreeCache::__detach_next(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  _QWORD *v4;

  result = *(_QWORD **)(a1 + 16);
  if (result)
  {
    v3 = (_QWORD *)*result;
    if (*result == a1)
    {
      *result = 0;
      while (1)
      {
        v4 = (_QWORD *)result[1];
        if (!v4)
          break;
        do
        {
          result = v4;
          v4 = (_QWORD *)*v4;
        }
        while (v4);
      }
    }
    else
    {
      for (result[1] = 0; v3; v3 = (_QWORD *)result[1])
      {
        do
        {
          result = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
    }
  }
  return result;
}

uint64_t std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::_DetachedTreeCache::~_DetachedTreeCache[abi:ne180100](uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(_QWORD *)a1, *(_QWORD **)(a1 + 16));
  v2 = *(_QWORD **)(a1 + 8);
  if (v2)
  {
    v3 = (_QWORD *)v2[2];
    if (v3)
    {
      do
      {
        v2 = v3;
        v3 = (_QWORD *)v3[2];
      }
      while (v3);
      *(_QWORD *)(a1 + 8) = v2;
    }
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*(_QWORD *)a1, v2);
  }
  return a1;
}

uint64_t *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_multi<std::pair<std::string const,std::string> const&>(uint64_t **a1, __int128 *a2)
{
  uint64_t **leaf_high;
  uint64_t *v4;
  uint64_t v6;
  uint64_t *v7[3];

  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__construct_node<std::pair<std::string const,std::string> const&>((uint64_t)a1, a2, (uint64_t)v7);
  leaf_high = (uint64_t **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_leaf_high((uint64_t)a1, &v6, (const void **)v7[0] + 4);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__insert_node_at(a1, v6, leaf_high, v7[0]);
  v4 = v7[0];
  v7[0] = 0;
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v7, 0);
  return v4;
}

void sub_20ADC4338(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__construct_node<std::pair<std::string const,std::string> const&>@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  std::string *result;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x50uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  result = std::pair<std::string const,std::string>::pair[abi:ne180100]((std::string *)(v6 + 32), a2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_20ADC43A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a2 > 0x16)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v4 = a2 | 7;
    v5 = v4 + 1;
    v6 = operator new(v4 + 1);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

uint64_t std::stringbuf::basic_stringbuf[abi:ne180100](uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6;

  v6 = std::streambuf::basic_streambuf();
  *(_QWORD *)v6 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  std::stringbuf::__init_buf_ptrs[abi:ne180100](a1);
  return a1;
}

void sub_20ADC44A8(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 87) < 0)
    operator delete(*v2);
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void std::stringbuf::__init_buf_ptrs[abi:ne180100](uint64_t a1)
{
  std::string *v2;
  char v3;
  std::string *v4;
  unint64_t v5;
  int v6;
  std::string::size_type v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  *(_QWORD *)(a1 + 88) = 0;
  v2 = (std::string *)(a1 + 64);
  v3 = *(_BYTE *)(a1 + 87);
  if (v3 < 0)
  {
    v4 = *(std::string **)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 72);
  }
  else
  {
    v4 = v2;
    v5 = *(unsigned __int8 *)(a1 + 87);
  }
  v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    v7 = v3 < 0 ? (*(_QWORD *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    v8 = *(char *)(a1 + 87) < 0 ? *(_QWORD *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(_QWORD *)(a1 + 40) = v4;
    *(_QWORD *)(a1 + 48) = v4;
    *(_QWORD *)(a1 + 56) = (char *)v4 + v8;
    if ((*(_BYTE *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        v5 = v5 - v10 - 0x7FFFFFFF;
        *(_QWORD *)(a1 + 48) = v4;
      }
      if (v5)
        *(_QWORD *)(a1 + 48) = (char *)v4 + v5;
    }
  }
}

void std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AlgosScoreCombinerFrameRow *&,AlgosScoreCombinerFrameRow *&>(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void AlgosScoreCombinerFrameRow::AlgosScoreCombinerFrameRow(void **a1)
{
  if (*((char *)a1 + 23) < 0)
    OUTLINED_FUNCTION_0(a1);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x24BEDAA50](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAB0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x24BEDABC8](this, *(_QWORD *)&__ecode);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAD08](this, __c);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x24BEDB030](__s, __icase);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x24BEDB1A0](retstr, __s);
}

double std::stod(const std::string *__str, size_t *__idx)
{
  double result;

  MEMORY[0x24BEDB320](__str, __idx);
  return result;
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x24BEDB438](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x24BEDB440](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24C3CAE90(__p);
}

uint64_t operator delete()
{
  return off_24C3CAE98();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C3CAEA0(__sz);
}

uint64_t operator new()
{
  return off_24C3CAEA8();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

long double log1p(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAC0](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

double nan(const char *a1)
{
  double result;

  MEMORY[0x24BDAEFF8](a1);
  return result;
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

