_QWORD *std::__shared_ptr_emplace<FileLocal>::__shared_ptr_emplace[abi:ne180100]<FileLocal&,std::allocator<FileLocal>,0>(_QWORD *a1, const FileLocal *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24CEEEF38;
  FileLocal::FileLocal((FileLocal *)(a1 + 3), a2);
  return a1;
}

void sub_212FC54DC(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void FileLocal::FileLocal(FileLocal *this, const FileLocal *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;

  Backend::Backend((Backend *)this);
  *(_QWORD *)v3 = &off_24CF0F5C0;
  *(_QWORD *)(v3 + 24) = &unk_24CF0F6A0;
  *(_QWORD *)(v3 + 32) = &unk_24CF0F6D8;
  v4 = *((_QWORD *)a2 + 5);
  v5 = *((_QWORD *)a2 + 6);
  *(_QWORD *)(v3 + 40) = v4;
  *(_QWORD *)(v3 + 48) = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    v4 = *(_QWORD *)(v3 + 40);
  }
  *(_QWORD *)(v3 + 56) = v4 + 8;
  *(_QWORD *)(v3 + 64) = v3 + 88;
  *(_OWORD *)(v3 + 72) = xmmword_212FEBC40;
}

void boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::priv_insert_forward_range_no_capacity<boost::container::dtl::insert_emplace_proxy<boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,FileLocal::promise_io_t*,FileLocal::promise_io_t>>(uint64_t *a1@<X0>, uint64_t a2@<X1>, const char *a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v10 = *a1;
  v11 = boost::container::vector_alloc_holder<boost::container::small_vector_allocator<udif::run_io_info,boost::container::new_allocator<void>,void>,unsigned long,boost::move_detail::integral_constant<unsigned int,1u>>::next_capacity<boost::container::growth_factor_60>((uint64_t)a1, a3);
  if (v11 >> 57)
    boost::container::throw_length_error((boost::container *)"get_next_capacity, allocator's max size reached", v12);
  v13 = v11;
  v14 = operator new(v11 << 6);
  boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::priv_insert_forward_range_new_allocation<boost::container::dtl::insert_emplace_proxy<boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,FileLocal::promise_io_t*,FileLocal::promise_io_t>>(a1, (uint64_t)v14, v13, a2, (uint64_t)a3, a4);
  *a5 = *a1 + a2 - v10;
}

void boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::priv_insert_forward_range_new_allocation<boost::container::dtl::insert_emplace_proxy<boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,FileLocal::promise_io_t*,FileLocal::promise_io_t>>(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;

  v10 = *a1;
  boost::container::uninitialized_move_and_insert_alloc<boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,FileLocal::promise_io_t*,FileLocal::promise_io_t*,boost::container::dtl::insert_emplace_proxy<boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,FileLocal::promise_io_t*,FileLocal::promise_io_t>>((uint64_t)a1, *a1, a4, *a1 + (a1[1] << 6), a2, a5, a6);
  if (v10)
  {
    for (i = a1[1]; i; v10 += 64)
    {
      v12 = *(_QWORD *)(v10 + 56);
      if (v12)
        *(_QWORD *)(v12 + 32) = 0;
      --i;
      std::shared_ptr<char>::~shared_ptr[abi:ne180100](v10);
    }
    if (a1 + 3 != (uint64_t *)*a1)
      operator delete((void *)*a1);
  }
  v13 = a1[1] + a5;
  *a1 = a2;
  a1[1] = v13;
  a1[2] = a3;
}

void sub_212FC56AC(_Unwind_Exception *exception_object)
{
  void *v1;
  uint64_t v2;

  if (v1)
  {
    if ((void *)(v2 + 24) != v1)
      operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

__n128 boost::container::uninitialized_move_and_insert_alloc<boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,FileLocal::promise_io_t*,FileLocal::promise_io_t*,boost::container::dtl::insert_emplace_proxy<boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,FileLocal::promise_io_t*,FileLocal::promise_io_t>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  __int128 v7;
  int v8;
  uint64_t v9;
  __n128 result;
  uint64_t v11;
  int v12;
  uint64_t v13;

  while (a2 != a3)
  {
    *(_OWORD *)a5 = *(_OWORD *)a2;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(a5 + 25) = *(_OWORD *)(a2 + 25);
    *(_OWORD *)(a5 + 16) = v7;
    v8 = *(_DWORD *)(a2 + 48);
    *(_QWORD *)(a5 + 56) = *(_QWORD *)(a2 + 56);
    v9 = a5 + 56;
    *(_DWORD *)(v9 - 8) = v8;
    *(_QWORD *)(a2 + 56) = 0;
    *(_QWORD *)(*(_QWORD *)v9 + 32) = v9;
    a5 = v9 + 8;
    a2 += 64;
  }
  *(_OWORD *)a5 = *(_OWORD *)a7;
  *(_QWORD *)a7 = 0;
  *(_QWORD *)(a7 + 8) = 0;
  result = *(__n128 *)(a7 + 16);
  *(_OWORD *)(a5 + 25) = *(_OWORD *)(a7 + 25);
  *(__n128 *)(a5 + 16) = result;
  *(_QWORD *)(a5 + 56) = *(_QWORD *)(a7 + 56);
  *(_DWORD *)(a5 + 48) = *(_DWORD *)(a7 + 48);
  *(_QWORD *)(a7 + 56) = 0;
  *(_QWORD *)(*(_QWORD *)(a5 + 56) + 32) = a5 + 56;
  if (a3 != a4)
  {
    v11 = a5 + (a6 << 6);
    do
    {
      *(_OWORD *)v11 = *(_OWORD *)a3;
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      result = *(__n128 *)(a3 + 16);
      *(_OWORD *)(v11 + 25) = *(_OWORD *)(a3 + 25);
      *(__n128 *)(v11 + 16) = result;
      v12 = *(_DWORD *)(a3 + 48);
      *(_QWORD *)(v11 + 56) = *(_QWORD *)(a3 + 56);
      v13 = v11 + 56;
      *(_DWORD *)(v13 - 8) = v12;
      *(_QWORD *)(a3 + 56) = 0;
      *(_QWORD *)(*(_QWORD *)v13 + 32) = v13;
      a3 += 64;
      v11 = v13 + 8;
    }
    while (a3 != a4);
  }
  return result;
}

uint64_t di_log::logger_buf<di_log::log_printer<66ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF0F900;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC5818(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<78ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF0FB20;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC5894(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<95ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF0FD40;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC5910(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<103ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF0FF60;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC598C(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void std::__call_once_proxy[abi:ne180100]<std::tuple<FileLocal::shared_state_t::init_unmap_zeros(void)::$_0 &&>>(uint64_t ***a1)
{
  uint64_t *v1;
  uint64_t v2;
  size_t f_bsize;
  void *v4;
  __int128 *v5;
  uint64_t v6;
  int v7;
  const std::error_category *v8;
  int v9;
  int v10;
  const std::error_category *v11;
  const std::error_category *v12;
  int64_t v13;
  std::bad_alloc *exception;
  std::bad_alloc *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  statfs v20;
  __int128 v21;
  int v22;
  __int128 *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v1 = **a1;
  v2 = *v1;
  if ((fstatfs(*(_DWORD *)(*v1 + 8), &v20) & 0x80000000) == 0)
  {
    f_bsize = v20.f_bsize;
    if (!*(_BYTE *)(v2 + 88))
      *(_BYTE *)(v2 + 88) = 1;
    *(_QWORD *)(v2 + 72) = f_bsize;
    v4 = malloc_type_valloc(f_bsize, 0xF8ED6DDuLL);
    if (!v4)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      v15 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v15, MEMORY[0x24BEDB758], MEMORY[0x24BEDB670]);
    }
    *(_QWORD *)&v21 = &off_24CF11FC0;
    v23 = &v21;
    v16 = v4;
    std::__function::__value_func<void ()(char *)>::__value_func[abi:ne180100]((uint64_t)&v17, (uint64_t)&v21);
    v5 = v23;
    if (v23 == &v21)
    {
      v6 = 4;
      v5 = &v21;
    }
    else
    {
      if (!v23)
        goto LABEL_14;
      v6 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
LABEL_14:
    std::expected<std::unique_ptr<char,std::function<void ()(char *)>>,std::error_code>::operator=[abi:ne180100]<std::unique_ptr<char,std::function<void ()(char *)>>>(v2 + 96, (uint64_t *)&v16);
    std::unique_ptr<char,std::function<void ()(char *)>>::~unique_ptr[abi:ne180100]((uint64_t *)&v16);
    v13 = *(_QWORD *)(v2 + 72);
    if (v13 >= 1)
      bzero(*(void **)(v2 + 96), v13);
    return;
  }
  *(_QWORD *)&v21 = "FileLocal::shared_state_t::init_unmap_zeros()::(anonymous class)::operator()() const";
  *((_QWORD *)&v21 + 1) = 76;
  v22 = 16;
  di_log::logger<di_log::log_printer<236ul>>::logger(&v16, &v21);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v18, (uint64_t)"fstatfs failed with err code ", 29);
  __error();
  std::ostream::operator<<();
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf((uint64_t)&v16);
  MEMORY[0x2199A89AC](&v19);
  v7 = *__error();
  v8 = std::generic_category();
  v9 = *(unsigned __int8 *)(v2 + 88);
  *(_DWORD *)(v2 + 72) = v7;
  *(_QWORD *)(v2 + 80) = v8;
  if (v9)
    *(_BYTE *)(v2 + 88) = 0;
  v10 = *__error();
  v11 = std::generic_category();
  v12 = v11;
  if (*(_BYTE *)(v2 + 136))
  {
    std::unique_ptr<char,std::function<void ()(char *)>>::~unique_ptr[abi:ne180100]((uint64_t *)(v2 + 96));
    *(_DWORD *)(v2 + 96) = v10;
    *(_QWORD *)(v2 + 104) = v12;
    *(_BYTE *)(v2 + 136) = 0;
  }
  else
  {
    *(_DWORD *)(v2 + 96) = v10;
    *(_QWORD *)(v2 + 104) = v11;
  }
}

void sub_212FC5BAC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<char,std::function<void ()(char *)>>::~unique_ptr[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

_QWORD *di_log::logger<di_log::log_printer<236ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<236ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF11DA8;
  a1[45] = &unk_24CF11EA8;
  a1[46] = &unk_24CF11ED0;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF11DA8;
  a1[45] = &unk_24CF11E30;
  a1[46] = &unk_24CF11E58;
  return a1;
}

void sub_212FC5C78(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<236ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

uint64_t std::expected<std::unique_ptr<char,std::function<void ()(char *)>>,std::error_code>::operator=[abi:ne180100]<std::unique_ptr<char,std::function<void ()(char *)>>>(uint64_t a1, uint64_t *a2)
{
  if (*(_BYTE *)(a1 + 40))
    std::unique_ptr<char,std::function<void ()(char *)>>::operator=[abi:ne180100]((uint64_t *)a1, a2);
  else
    std::expected<std::unique_ptr<char,std::function<void ()(char *)>>,std::error_code>::__reinit_expected[abi:ne180100]<std::in_place_t,std::unexpect_t,std::unique_ptr<char,std::function<void ()(char *)>>,std::error_code,std::unique_ptr<char,std::function<void ()(char *)>>>(a1, a1, a2);
  return a1;
}

uint64_t di_log::logger_buf<di_log::log_printer<236ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF11F40;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC5D8C(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF11F40;
  di_log::logger_buf<di_log::log_printer<236ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

void di_log::logger<di_log::log_printer<236ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<236ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<236ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<236ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<236ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<236ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<236ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<236ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FC6180(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

int *di_log::log_printer<236ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 236;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 236;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

uint64_t std::expected<std::unique_ptr<char,std::function<void ()(char *)>>,std::error_code>::__reinit_expected[abi:ne180100]<std::in_place_t,std::unexpect_t,std::unique_ptr<char,std::function<void ()(char *)>>,std::error_code,std::unique_ptr<char,std::function<void ()(char *)>>>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t result;

  if (*(_BYTE *)(a1 + 40))
    std::unique_ptr<char,std::function<void ()(char *)>>::~unique_ptr[abi:ne180100]((uint64_t *)a1);
  v5 = *a3;
  *a3 = 0;
  *(_QWORD *)a1 = v5;
  result = std::__function::__value_func<void ()(char *)>::__value_func[abi:ne180100](a1 + 8, (uint64_t)(a3 + 1));
  *(_BYTE *)(a1 + 40) = 1;
  return result;
}

uint64_t di_log::logger_buf<di_log::log_printer<298ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF10180;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC64E8(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<313ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF103A0;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC6564(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<331ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF105C0;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC65E0(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<336ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF107E0;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC665C(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<370ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF10A00;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC66D8(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<388ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF10C20;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC6754(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<411ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF10E40;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC67D0(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<424ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF11060;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC684C(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<432ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF11280;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC68C8(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<441ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF114A0;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC6944(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<449ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF116C0;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC69C0(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<489ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF118E0;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC6A3C(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<502ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF11B00;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC6AB8(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t *std::back_insert_iterator<boost::container::small_vector<iovec,16ul,void,void>>::operator=[abi:ne180100](uint64_t *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = *a1;
  v5 = *(_QWORD *)(v4 + 8);
  v6 = (char *)(*(_QWORD *)v4 + 16 * v5);
  if (v5 == *(_QWORD *)(v4 + 16))
  {
    boost::container::vector<std::pair<std::chrono::time_point<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>,unsigned long>,boost::container::small_vector_allocator<std::pair<std::chrono::time_point<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>,unsigned long>,boost::container::new_allocator<void>,void>,void>::priv_insert_forward_range_no_capacity<boost::container::dtl::insert_emplace_proxy<boost::container::small_vector_allocator<std::pair<std::chrono::time_point<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>,unsigned long>,boost::container::new_allocator<void>,void>,std::pair<std::chrono::time_point<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>,unsigned long>*,std::pair<std::chrono::time_point<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>>,unsigned long>>>((void **)v4, v6, (const char *)1, a2, &v8);
  }
  else
  {
    *(_OWORD *)v6 = *a2;
    ++*(_QWORD *)(v4 + 8);
  }
  return a1;
}

_QWORD *boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::priv_destroy_all(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result;
  v2 = result[1];
  if (v2)
  {
    result = (_QWORD *)*result;
    do
    {
      v3 = result[7];
      if (v3)
        *(_QWORD *)(v3 + 32) = 0;
      --v2;
      result = (_QWORD *)(std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)result) + 64);
    }
    while (v2);
  }
  v1[1] = 0;
  return result;
}

uint64_t di_log::logger_buf<di_log::log_printer<643ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF11D20;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC6BE4(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t Ram::write(uint64_t a1, uint64_t a2)
{
  size_t v3;
  uint64_t v4;
  __int128 v6;
  int v7;
  _QWORD v8[45];
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  if (v3 + v4 <= *(_QWORD *)(a1 + 72))
  {
    memcpy((void *)(*(_QWORD *)(a1 + 64) + v4), *(const void **)a2, v3);
    return *(unsigned int *)(a2 + 16);
  }
  else
  {
    *(_QWORD *)&v6 = "int Ram::write(const sg_entry &)";
    *((_QWORD *)&v6 + 1) = 14;
    v7 = 16;
    di_log::logger<di_log::log_printer<30ul>>::logger(v8, &v6);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"Trying to write @ ", 18);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)" ", 1);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"bytes, which is after end of ramdisk", 36);
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf((uint64_t)v8);
    MEMORY[0x2199A89AC](&v10);
    return 4294967274;
  }
}

void sub_212FC6CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  di_log::logger<di_log::log_printer<30ul>>::~logger((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *di_log::logger<di_log::log_printer<30ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<30ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF12120;
  a1[45] = &unk_24CF12220;
  a1[46] = &unk_24CF12248;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF12120;
  a1[45] = &unk_24CF121A8;
  a1[46] = &unk_24CF121D0;
  return a1;
}

void sub_212FC6D98(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<30ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

uint64_t Ram::read(uint64_t a1, uint64_t a2)
{
  size_t v3;
  uint64_t v4;
  __int128 v6;
  int v7;
  _QWORD v8[45];
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  if (v3 + v4 <= *(_QWORD *)(a1 + 72))
  {
    memcpy(*(void **)a2, (const void *)(*(_QWORD *)(a1 + 64) + v4), v3);
    return *(unsigned int *)(a2 + 16);
  }
  else
  {
    *(_QWORD *)&v6 = "int Ram::read(const sg_entry &)";
    *((_QWORD *)&v6 + 1) = 13;
    v7 = 16;
    di_log::logger<di_log::log_printer<42ul>>::logger(v8, &v6);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"Trying to read @ ", 17);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)" ", 1);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v9, (uint64_t)"bytes, which is after end of ramdisk", 36);
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf((uint64_t)v8);
    MEMORY[0x2199A89AC](&v10);
    return 4294967274;
  }
}

void sub_212FC6F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  di_log::logger<di_log::log_printer<42ul>>::~logger((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *di_log::logger<di_log::log_printer<42ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<42ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF12340;
  a1[45] = &unk_24CF12440;
  a1[46] = &unk_24CF12468;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF12340;
  a1[45] = &unk_24CF123C8;
  a1[46] = &unk_24CF123F0;
  return a1;
}

void sub_212FC6FA0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<42ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

void Ram::~Ram(Ram *this)
{
  Ram::~Ram(this);
  JUMPOUT(0x2199A8A18);
}

{
  std::__shared_weak_count *v2;

  *(_QWORD *)this = &off_24CF12040;
  std::unique_ptr<char,std::function<void ()(char *)>>::~unique_ptr[abi:ne180100]((uint64_t *)this + 3);
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

uint64_t Ram::flush()
{
  return 0;
}

uint64_t Ram::unmap_range(Ram *this, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v6;
  size_t v7;
  uint64_t v8;
  unint64_t v10;

  if (a3 == -1)
    return 0;
  v3 = *((_QWORD *)this + 12);
  v4 = (a2 + v3 - 1) / v3 * v3;
  if (a2 > v4 || v4 >= a3 + a2)
    return 0;
  v6 = a2 - v4 + a3;
  v7 = v6 / v3 * v3;
  if (v6 == v6 % v3)
    return 0;
  v8 = 4294967262;
  if (__CFADD__(v4, v7))
    return v8;
  v10 = *((_QWORD *)this + 9);
  if (v4 > v10 || v7 + v4 > v10)
    return v8;
  return madvise((void *)(*((_QWORD *)this + 8) + v4), v7, 5);
}

uint64_t Ram::supports_unmap(Ram *this)
{
  return 1;
}

uint64_t Ram::get_size(Ram *this)
{
  return *((_QWORD *)this + 9);
}

uint64_t Ram::is_writable(Ram *this)
{
  return 1;
}

uint64_t Ram::truncate(Ram *this, unint64_t a2)
{
  uint64_t result;

  if (*((_QWORD *)this + 9) < a2)
    return 0xFFFFFFFFLL;
  result = 0;
  *((_QWORD *)this + 9) = a2;
  return result;
}

_QWORD *Ram::name(uint64_t a1, _QWORD *a2)
{
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"ram", 3);
}

uint64_t Ram::get_identifier(Ram *this)
{
  return *((_QWORD *)this + 10);
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<30ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<30ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger<di_log::log_printer<30ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<30ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<30ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF122B8;
  di_log::logger_buf<di_log::log_printer<30ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<30ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<30ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FC74CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<30ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

int *di_log::log_printer<30ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 30;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 30;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<42ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<42ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger<di_log::log_printer<42ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<42ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<42ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF124D8;
  di_log::logger_buf<di_log::log_printer<42ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<42ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<42ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FC7AB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<42ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

int *di_log::log_printer<42ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 42;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 42;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

uint64_t di_log::logger_buf<di_log::log_printer<30ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF122B8;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC7D90(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<42ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF124D8;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FC7E0C(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t SparseBundleBackend::SparseBundleBackend(uint64_t a1, uint64_t a2, __int16 a3, unint64_t a4, _OWORD *a5)
{
  int v9;
  _BOOL4 v10;

  v9 = SparseBundleBackend::open_bundle(a2, a3);
  FileDescriptorBackend::FileDescriptorBackend((FileDescriptorBackend *)a1, v9, (a3 & 3) != 0);
  *(_QWORD *)a1 = &off_24CF12558;
  *(_QWORD *)(a1 + 24) = &unk_24CF12630;
  *(_QWORD *)(a1 + 72) = &unk_24CF12658;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 136) = *a5;
  if ((a3 & 0x200) != 0)
  {
    SparseBundleBackend::set_bytes_per_band(a1, a4);
    SparseBundleBackend::prepare_new_bundle((SparseBundleBackend *)a1);
    v10 = 1;
  }
  else if (*(_BYTE *)(a1 + 36))
  {
    v10 = faccessat(*(_DWORD *)(a1 + 32), "mapped", 0, 0) != 0;
  }
  else
  {
    v10 = 0;
  }
  if (!*(_QWORD *)(a1 + 112))
    SparseBundleBackend::read_info((SparseBundleBackend *)a1);
  if (v10)
    SparseBundleBackend::create_mapped_folder((SparseBundleBackend *)a1, (a3 & 0x200) != 0);
  return a1;
}

void sub_212FC7F20(_Unwind_Exception *a1)
{
  FileDescriptorBackend *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *((_QWORD *)v1 + 14);
  *((_QWORD *)v1 + 14) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)v1 + 96);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v2);
  FileDescriptorBackend::~FileDescriptorBackend(v1);
  _Unwind_Resume(a1);
}

uint64_t SparseBundleBackend::open_bundle(uint64_t a1, __int16 a2)
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  DiskImagesRuntimeException *exception;
  unsigned int v7;
  const char *v8;
  void *v9;
  _BYTE v10[520];
  stat v11;

  v2 = a1;
  if ((a2 & 0x200) != 0)
  {
    if (*(char *)(a1 + 23) < 0)
      a1 = *(_QWORD *)a1;
    if (mkdir((const char *)a1, 0x1FFu) != -1)
      return FileDescriptorWrapper::open_file(v2, 0);
    exception = (DiskImagesRuntimeException *)__cxa_allocate_exception(0x40uLL);
    v7 = *__error();
    v8 = "Failed creating sparsebundle folder";
LABEL_16:
    DiskImagesRuntimeException::DiskImagesRuntimeException(exception, v8, v7);
  }
  if ((a2 & 3) == 0 || geteuid())
    return FileDescriptorWrapper::open_file(v2, 0);
  if (*(char *)(v2 + 23) >= 0)
    v3 = (const char *)v2;
  else
    v3 = *(const char **)v2;
  if (stat(v3, &v11))
  {
    exception = (DiskImagesRuntimeException *)__cxa_allocate_exception(0x40uLL);
    v7 = *__error();
    v8 = "stat failed";
    goto LABEL_16;
  }
  if (!v11.st_uid)
    return FileDescriptorWrapper::open_file(v2, 0);
  set_euid_wrapper::set_euid_wrapper((set_euid_wrapper *)v10, v11.st_uid);
  v4 = FileDescriptorWrapper::open_file(v2, 0);
  set_euid_wrapper::~set_euid_wrapper((set_euid_wrapper *)v10);
  return v4;
}

void sub_212FC8070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, int a12, char a13)
{
  void *v13;

  __cxa_free_exception(v13);
  _Unwind_Resume(a1);
}

void FileDescriptorBackend::FileDescriptorBackend(FileDescriptorBackend *this, int a2, char a3)
{
  uint64_t v6;

  Backend::Backend((Backend *)this);
  FileDescriptor::FileDescriptor((FileDescriptor *)(v6 + 24), a2, a3);
  *(_QWORD *)this = off_24CF12700;
  *((_QWORD *)this + 3) = &unk_24CF127C0;
}

void sub_212FC81BC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  std::__shared_weak_count *v3;

  v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  _Unwind_Resume(exception_object);
}

uint64_t SparseBundleBackend::set_bytes_per_band(uint64_t this, unint64_t a2)
{
  void *exception;
  _QWORD v3[33];

  if (a2 < 0x100000 || a2 > 0x200000000 || (a2 & 0xFFF) != 0)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v3);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)"Invalid band size (", 19);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)" bytes)", 7);
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v3, 0x16u);
  }
  *(_QWORD *)(this + 128) = a2;
  return this;
}

void sub_212FC8294(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void SparseBundleBackend::prepare_new_bundle(SparseBundleBackend *this)
{
  int v2;
  int v3;
  int v4;
  int v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  DiskImagesRuntimeException *exception;
  int *v13;
  void *v14;
  void *v15[2];
  char v16;
  void *__p[2];
  std::__shared_weak_count *v18;
  void *v19;
  void *v20;
  std::__shared_weak_count *v21;
  uint64_t v22;
  void (**v23)(FileLocal *__hidden);
  std::__shared_weak_count *v24;
  void *v25;
  void *v26;
  std::__shared_weak_count *v27;
  _QWORD v28[132];

  v28[131] = *MEMORY[0x24BDAC8D0];
  if (mkdirat(*((_DWORD *)this + 8), "bands", 0x1FFu) == -1)
  {
    exception = (DiskImagesRuntimeException *)__cxa_allocate_exception(0x40uLL);
    v13 = __error();
    DiskImagesRuntimeException::DiskImagesRuntimeException(exception, "Failed creating bands folder", *v13);
  }
  SparseBundleBackend::write_info_plists(this);
  v2 = *((_DWORD *)this + 8);
  std::string::basic_string[abi:ne180100]<0>(__p, "token");
  v3 = FileDescriptorWrapper::open_from(v2, (uint64_t)__p, 1538);
  FileLocal::FileLocal((FileLocal *)&v23, v3, 1, 0);
  if (SHIBYTE(v18) < 0)
    operator delete(__p[0]);
  v4 = *((_DWORD *)this + 8);
  std::string::basic_string[abi:ne180100]<0>(v15, "lock");
  v5 = FileDescriptorWrapper::open_from(v4, (uint64_t)v15, 1538);
  FileLocal::FileLocal((FileLocal *)__p, v5, 1, 0);
  if (v16 < 0)
    operator delete(v15[0]);
  __p[0] = &off_24CF0F5C0;
  v19 = &unk_24CF0F6A0;
  v20 = &unk_24CF0F6D8;
  boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)&v22);
  v6 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (v18)
    std::__shared_weak_count::__release_weak(v18);
  v23 = &off_24CF0F5C0;
  v25 = &unk_24CF0F6A0;
  v26 = &unk_24CF0F6D8;
  boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)v28);
  v9 = v27;
  if (v27)
  {
    v10 = (unint64_t *)&v27->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (v24)
    std::__shared_weak_count::__release_weak(v24);
}

void sub_212FC84E0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void SparseBundleBackend::read_info(SparseBundleBackend *this)
{
  uint64_t v2;
  FileLocal *v3;
  void *__p[2];
  char v5;

  std::string::basic_string[abi:ne180100]<0>(__p, "Info.plist");
  SparseBundleBackend::read_info((uint64_t)this, (uint64_t)__p, &v3);
  v2 = *((_QWORD *)this + 14);
  *((_QWORD *)this + 14) = v3;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  if (v5 < 0)
    operator delete(__p[0]);
}

void sub_212FC85BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int128 a11, int a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61)
{
  SparseBundleBackend *v61;
  void *v64;
  const char *v65;
  size_t v66;
  uint64_t v67;

  if (a18 < 0)
    operator delete(__p);
  if (a2 == 1)
  {
    v64 = __cxa_begin_catch(exception_object);
    *(_QWORD *)&a11 = "SparseBundleBackend::read_info()";
    *((_QWORD *)&a11 + 1) = 30;
    a12 = 16;
    di_log::logger<di_log::log_printer<263ul>>::logger(&__p, &a11);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&a61, (uint64_t)"Failed to read ", 15);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&a61, (uint64_t)"Info.plist", 10);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&a61, (uint64_t)", ", 2);
    v65 = (const char *)(*(uint64_t (**)(void *))(*(_QWORD *)v64 + 16))(v64);
    v66 = strlen(v65);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&a61, (uint64_t)v65, v66);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&a61, (uint64_t)", reading from backup", 21);
    di_log::logger<di_log::log_printer<263ul>>::~logger((uint64_t)&__p);
    __cxa_end_catch();
    std::string::basic_string[abi:ne180100]<0>(&__p, "Info.bckup");
    SparseBundleBackend::read_info((uint64_t)v61, (uint64_t)&__p, (FileLocal **)&a10);
    v67 = a10;
    a10 = 0;
    if (v67)
      (*(void (**)(uint64_t))(*(_QWORD *)v67 + 8))(v67);
    if (a18 < 0)
      operator delete(__p);
    if ((*(unsigned int (**)(SparseBundleBackend *))(*(_QWORD *)v61 + 48))(v61))
      SparseBundleBackend::write_primary_info_plist(v61);
    JUMPOUT(0x212FC85A4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SparseBundleBackend::create_mapped_folder(SparseBundleBackend *this, char a2)
{
  uint64_t result;
  void *exception;
  int *v6;
  void *v7;
  int *v8;
  void *v9;
  int *v10;
  stat v11;
  _QWORD v12[33];

  result = mkdirat(*((_DWORD *)this + 8), "mapped", 0x1FFu);
  if ((_DWORD)result == -1)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"Failed creating ", 16);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"mapped", 6);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" folder", 7);
    v6 = __error();
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v12, *v6);
  }
  if ((a2 & 1) == 0)
  {
    memset(&v11, 0, sizeof(v11));
    FileDescriptor::get_stat((SparseBundleBackend *)((char *)this + 24), &v11);
    if (fchmodat(*((_DWORD *)this + 8), "mapped", v11.st_mode & 0x1FF, 0) == -1)
    {
      v7 = __cxa_allocate_exception(0x40uLL);
      std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"fchmodat failed for ", 20);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"mapped", 6);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" folder", 7);
      v8 = __error();
      DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)v7, (uint64_t)v12, *v8);
    }
    result = geteuid();
    if (!(_DWORD)result && v11.st_uid)
    {
      result = fchownat(*((_DWORD *)this + 8), "mapped", v11.st_uid, 0xFFFFFFFF, 0);
      if ((_DWORD)result == -1)
      {
        v9 = __cxa_allocate_exception(0x40uLL);
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v12);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"fchownat failed for ", 20);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)"mapped", 6);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" folder", 7);
        v10 = __error();
        DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)v9, (uint64_t)v12, *v10);
      }
    }
  }
  return result;
}

void sub_212FC8A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  std::ostringstream::~ostringstream((uint64_t)&a28);
  _Unwind_Resume(a1);
}

void FileDescriptorBackend::~FileDescriptorBackend(FileDescriptorBackend *this)
{
  std::__shared_weak_count *v2;

  FileDescriptorWrapper::~FileDescriptorWrapper((FileDescriptorBackend *)((char *)this + 24));
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

FileDescriptorBackend *SparseBundleBackend::SparseBundleBackend(FileDescriptorBackend *a1, int a2, char a3, _QWORD *a4, uint64_t *a5)
{
  _QWORD *v8;
  FileDescriptor *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  __int128 v14;
  int v15;
  stat v16[2];
  uint64_t v17;
  uint64_t v18;

  FileDescriptorBackend::FileDescriptorBackend(a1, a2, a3);
  *v8 = &off_24CF12558;
  v8[3] = &unk_24CF12630;
  v9 = (FileDescriptor *)(v8 + 3);
  v8[9] = &unk_24CF12658;
  v8[10] = *a4;
  v10 = a4[1];
  v8[11] = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  *((_QWORD *)a1 + 12) = 0;
  *((_QWORD *)a1 + 13) = 0;
  *((_QWORD *)a1 + 14) = 0;
  SparseBundleBackend::read_info(a1);
  std::shared_ptr<DiskImage>::operator=[abi:ne180100]((_QWORD *)a1 + 12, a5);
  if ((*(unsigned int (**)(FileDescriptorBackend *))(*(_QWORD *)a1 + 48))(a1))
  {
    FileDescriptor::get_stat(v9, v16);
    umask(v16[0].st_mode & 0x1B6 ^ 0x1B6);
    *(_QWORD *)&v14 = "SparseBundleBackend::SparseBundleBackend(int, BOOL, const shared_ptr<FileLocal> &, const shared_pt"
                      "r<crypto::format> &)";
    *((_QWORD *)&v14 + 1) = 40;
    v15 = 0;
    di_log::logger<di_log::log_printer<93ul>>::logger(v16, &v14);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v17, (uint64_t)"Mode for new files in bundle: ", 30);
    *(_DWORD *)((char *)&v17 + *(_QWORD *)(v17 - 24) + 8) = *(_DWORD *)((_BYTE *)&v17 + *(_QWORD *)(v17 - 24) + 8) & 0xFFFFFFB5 | 0x40;
    std::ostream::operator<<();
    *(_DWORD *)((char *)&v17 + *(_QWORD *)(v17 - 24) + 8) = *(_DWORD *)((_BYTE *)&v17 + *(_QWORD *)(v17 - 24) + 8) & 0xFFFFFFB5 | 2;
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<93ul>>::~logger_buf((uint64_t)v16);
    MEMORY[0x2199A89AC](&v18);
  }
  return a1;
}

void sub_212FC8C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  FileDescriptorBackend *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  va_list va;

  va_start(va, a4);
  di_log::logger<di_log::log_printer<93ul>>::~logger((uint64_t)va);
  v8 = *((_QWORD *)v4 + 14);
  *((_QWORD *)v4 + 14) = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v6);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v5);
  FileDescriptorBackend::~FileDescriptorBackend(v4);
  _Unwind_Resume(a1);
}

_QWORD *di_log::logger<di_log::log_printer<161ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<161ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF12C30;
  a1[45] = &unk_24CF12D30;
  a1[46] = &unk_24CF12D58;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF12C30;
  a1[45] = &unk_24CF12CB8;
  a1[46] = &unk_24CF12CE0;
  return a1;
}

void sub_212FC8D60(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<161ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

void SparseBundleBackend::write_info_plists(SparseBundleBackend *this)
{
  int v2;
  int v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  __int128 __p;
  int v8;
  char v9;
  _QWORD v10[2];
  std::__shared_weak_count *v11;
  void *v12;
  void *v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[94];

  v17[93] = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&__p = "SparseBundleBackend::write_info_plists()";
  *((_QWORD *)&__p + 1) = 38;
  v8 = 0;
  di_log::logger<di_log::log_printer<322ul>>::logger(v10, &__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v16, (uint64_t)"Updating ", 9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v16, (uint64_t)"Info.bckup", 10);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v16, (uint64_t)", disk size: ", 13);
  std::ostream::operator<<();
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf((uint64_t)v10);
  MEMORY[0x2199A89AC](v17);
  v2 = *((_DWORD *)this + 8);
  std::string::basic_string[abi:ne180100]<0>(&__p, "Info.bckup");
  v3 = FileDescriptorWrapper::open_from(v2, (uint64_t)&__p, 1538);
  FileLocal::FileLocal((FileLocal *)v10, v3, 1, 0);
  if (v9 < 0)
    operator delete((void *)__p);
  SparseBundleBackend::write_info_to_file(this, (Backend *)v10);
  SparseBundleBackend::write_primary_info_plist(this);
  v10[0] = &off_24CF0F5C0;
  v12 = &unk_24CF0F6A0;
  v13 = &unk_24CF0F6D8;
  boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)&v15);
  v4 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  if (v11)
    std::__shared_weak_count::__release_weak(v11);
}

void sub_212FC8F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  FileLocal::~FileLocal((FileLocal *)&a16);
  _Unwind_Resume(a1);
}

void SparseBundleBackend::read_info(uint64_t a1@<X0>, uint64_t a2@<X1>, FileLocal **a3@<X8>)
{
  int v6;
  BOOL v7;
  int v8;
  FileLocal *v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  int v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  const __CFAllocator *v20;
  CFDataRef v21;
  CFPropertyListRef v22;
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v25;
  const void *v26;
  CFTypeID v27;
  const __CFString *v28;
  CFTypeID v29;
  const char *v30;
  _QWORD *v31;
  const std::error_category *v32;
  void *exception;
  int *v34;
  _QWORD *v35;
  const std::error_category *v36;
  _QWORD *v37;
  const std::error_category *v38;
  cf::CFUtilException *v39;
  cf::CFUtilException *v40;
  cf::CFUtilException *v41;
  cf::CFUtilException *v42;
  cf::CFUtilException *v43;
  cf::CFUtilException *v44;
  cf::CFUtilException *v45;
  cf::CFUtilException *v46;
  const void *v47;
  CFErrorRef error;
  CFDataRef v49;
  __int128 bytes;
  int v51;
  unint64_t valuePtr;
  std::__shared_weak_count *v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;

  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
  v7 = v6;
  if (v6)
    v8 = 2;
  else
    v8 = 0;
  v9 = (FileLocal *)operator new();
  v10 = FileDescriptorWrapper::open_from(*(_DWORD *)(a1 + 32), a2, v8);
  FileLocal::FileLocal(v9, v10, v7, 0);
  *a3 = v9;
  v11 = (*(uint64_t (**)(FileLocal *))(*(_QWORD *)v9 + 40))(v9);
  if (v11 >= 0x401)
  {
    *(_QWORD *)&bytes = "SparseBundleBackend::read_info(const std::string &)";
    *((_QWORD *)&bytes + 1) = 30;
    v51 = 16;
    di_log::logger<di_log::log_printer<207ul>>::logger(&valuePtr, &bytes);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v58, (uint64_t)"Info.plist", 10);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v58, (uint64_t)" is ", 4);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v58, (uint64_t)" bytes, reading only ", 21);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v58, (uint64_t)" bytes", 6);
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf((uint64_t)&valuePtr);
    MEMORY[0x2199A89AC](&v59);
    v11 = 1024;
  }
  std::vector<unsigned char>::vector(&bytes, v11);
  v12 = bytes;
  v13 = (std::__shared_weak_count *)*((_QWORD *)details::get_dummy_shared_ptr() + 1);
  valuePtr = v12;
  v53 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  v54 = v11;
  v55 = 0;
  v56 = v11;
  v57 = 0;
  v16 = (*(uint64_t (**)(FileLocal *, unint64_t *))(*(_QWORD *)v9 + 88))(v9, &valuePtr);
  v17 = v53;
  if (v53)
  {
    v18 = (unint64_t *)&v53->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (v11 != v16)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&valuePtr);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&valuePtr, (uint64_t)"Failed reading ", 15);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&valuePtr, (uint64_t)"Info.plist", 10);
    v34 = __error();
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)&valuePtr, *v34);
  }
  v20 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v21 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)bytes, v11);
  v49 = v21;
  if (!v21)
  {
    v35 = __cxa_allocate_exception(0x40uLL);
    *v35 = &off_24CF07908;
    v36 = std::generic_category();
    v35[1] = 12;
    v35[2] = v36;
    *((_BYTE *)v35 + 24) = 0;
    *((_BYTE *)v35 + 48) = 0;
    v35[7] = "Failed creating CFData";
  }
  error = 0;
  v22 = CFPropertyListCreateWithData(v20, v21, 0, 0, &error);
  v47 = v22;
  TypeID = CFDictionaryGetTypeID();
  if (!v22)
  {
    v37 = __cxa_allocate_exception(0x40uLL);
    *v37 = &off_24CF07908;
    v38 = std::generic_category();
    v37[1] = 22;
    v37[2] = v38;
    *((_BYTE *)v37 + 24) = 0;
    *((_BYTE *)v37 + 48) = 0;
    v37[7] = "Corrupted plist";
  }
  if (CFGetTypeID(v22) != TypeID)
  {
    v39 = (cf::CFUtilException *)__cxa_allocate_exception(0x40uLL);
    CFGetTypeID(v22);
    v40 = cf::CFUtilException::CFUtilException(v39);
  }
  Value = CFDictionaryGetValue((CFDictionaryRef)v22, CFSTR("size"));
  v25 = CFNumberGetTypeID();
  if (Value && CFGetTypeID(Value) != v25)
  {
    v41 = (cf::CFUtilException *)__cxa_allocate_exception(0x40uLL);
    CFGetTypeID(Value);
    v42 = cf::CFUtilException::CFUtilException(v41);
  }
  v26 = CFDictionaryGetValue((CFDictionaryRef)v22, CFSTR("band-size"));
  v27 = CFNumberGetTypeID();
  if (v26 && CFGetTypeID(v26) != v27)
  {
    v43 = (cf::CFUtilException *)__cxa_allocate_exception(0x40uLL);
    CFGetTypeID(v26);
    v44 = cf::CFUtilException::CFUtilException(v43);
  }
  v28 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v22, CFSTR("uuid"));
  v29 = CFStringGetTypeID();
  if (v28 && CFGetTypeID(v28) != v29)
  {
    v45 = (cf::CFUtilException *)__cxa_allocate_exception(0x40uLL);
    CFGetTypeID(v28);
    v46 = cf::CFUtilException::CFUtilException(v45);
  }
  v30 = "Corrupted plist dictionary";
  if (!Value || !v26)
  {
LABEL_34:
    v31 = __cxa_allocate_exception(0x40uLL);
    *v31 = &off_24CF07908;
    v32 = std::generic_category();
    v31[1] = 22;
    v31[2] = v32;
    *((_BYTE *)v31 + 24) = 0;
    *((_BYTE *)v31 + 48) = 0;
    v31[7] = v30;
  }
  valuePtr = 0;
  if (!CFNumberGetValue((CFNumberRef)Value, kCFNumberLongLongType, &valuePtr)
    || (*(_QWORD *)(a1 + 120) = valuePtr,
        valuePtr = 0,
        !CFNumberGetValue((CFNumberRef)v26, kCFNumberLongLongType, &valuePtr)))
  {
    v30 = "Failed converting CFNumber to longlong";
    goto LABEL_34;
  }
  SparseBundleBackend::set_bytes_per_band(a1, valuePtr);
  if (v28)
    toNativeType(v28, &valuePtr);
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  CFAutoRelease<void const*>::~CFAutoRelease(&v47);
  CFAutoRelease<__CFData const*>::~CFAutoRelease((const void **)&v49);
  if ((_QWORD)bytes)
  {
    *((_QWORD *)&bytes + 1) = bytes;
    operator delete((void *)bytes);
  }
}

void sub_212FC95E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t *v21;
  uint64_t v23;

  std::ostringstream::~ostringstream((uint64_t)&a16);
  if (__p)
    operator delete(__p);
  v23 = *v21;
  *v21 = 0;
  if (v23)
    (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
  _Unwind_Resume(a1);
}

_QWORD *di_log::logger<di_log::log_printer<207ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<207ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF12E50;
  a1[45] = &unk_24CF12F50;
  a1[46] = &unk_24CF12F78;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF12E50;
  a1[45] = &unk_24CF12ED8;
  a1[46] = &unk_24CF12F00;
  return a1;
}

void sub_212FC97E0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<207ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

_QWORD *di_log::logger<di_log::log_printer<263ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<263ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF13070;
  a1[45] = &unk_24CF13170;
  a1[46] = &unk_24CF13198;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF13070;
  a1[45] = &unk_24CF130F8;
  a1[46] = &unk_24CF13120;
  return a1;
}

void sub_212FC98C8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<263ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

const void **SparseBundleBackend::write_primary_info_plist(SparseBundleBackend *this)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  DiskImagesRuntimeException *exception;
  void *v6;
  FileLocal *v7;
  int v8;
  uint64_t v9;
  __int128 v11;
  int v12;
  void *__p[2];
  char v14;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)&v11 = "SparseBundleBackend::write_primary_info_plist()";
  *((_QWORD *)&v11 + 1) = 45;
  v12 = 0;
  di_log::logger<di_log::log_printer<304ul>>::logger(__p, &v11);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v15, (uint64_t)"Updating ", 9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v15, (uint64_t)"Info.plist", 10);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf((uint64_t)__p);
  MEMORY[0x2199A89AC](&v16);
  v2 = *((_QWORD *)this + 14);
  if (v2)
  {
    v3 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 56))(v2, 0);
    if (v3)
    {
      v4 = v3;
      exception = (DiskImagesRuntimeException *)__cxa_allocate_exception(0x40uLL);
      DiskImagesRuntimeException::DiskImagesRuntimeException(exception, "Failed truncating plist", v4);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "Info.plist");
    v7 = (FileLocal *)operator new();
    v8 = FileDescriptorWrapper::open_from(*((_DWORD *)this + 8), (uint64_t)__p, 514);
    FileLocal::FileLocal(v7, v8, 1, 0);
    v9 = *((_QWORD *)this + 14);
    *((_QWORD *)this + 14) = v7;
    if (v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
    if (v14 < 0)
      operator delete(__p[0]);
  }
  return SparseBundleBackend::write_info_to_file(this, *((Backend **)this + 14));
}

void sub_212FC9A9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *di_log::logger<di_log::log_printer<270ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<270ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF13290;
  a1[45] = &unk_24CF13390;
  a1[46] = &unk_24CF133B8;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF13290;
  a1[45] = &unk_24CF13318;
  a1[46] = &unk_24CF13340;
  return a1;
}

void sub_212FC9B6C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<270ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

const void **SparseBundleBackend::write_info_to_file(SparseBundleBackend *this, Backend *a2)
{
  const __CFAllocator *v4;
  __CFDictionary *v5;
  _OWORD *v6;
  CFDataRef v7;
  CFIndex Length;
  UInt8 *BytePtr;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unsigned int v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  _QWORD *v18;
  const std::error_category *v19;
  void *exception;
  unsigned int Code;
  void *__p;
  __int128 v23;
  uint64_t v24;
  CFIndex v25;
  char v26;
  const __CFData *v27;
  CFErrorRef error;
  __CFDictionary *Mutable;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("diskimage-bundle-type"), CFSTR("com.apple.diskimage.sparsebundle"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDBD290], CFSTR("6.0"));
  addCFNumber64ToDict(Mutable, CFSTR("bundle-backingstore-version"), 2);
  addCFNumber64ToDict(Mutable, CFSTR("size"), *((_QWORD *)this + 15));
  addCFNumber64ToDict(Mutable, CFSTR("band-size"), *((_QWORD *)this + 16));
  v5 = Mutable;
  v6 = operator new(0x28uLL);
  __p = v6;
  v23 = xmmword_212FF0960;
  *v6 = 0u;
  v6[1] = 0u;
  *(_QWORD *)((char *)v6 + 29) = 0;
  boost::uuids::to_chars<char *>((uint64_t)this + 136, v6);
  addCFStringToDict(v5, CFSTR("uuid"), (uint64_t)&__p);
  if (SHIBYTE(v23) < 0)
    operator delete(__p);
  error = 0;
  v7 = CFPropertyListCreateData(v4, Mutable, kCFPropertyListXMLFormat_v1_0, 0, &error);
  v27 = v7;
  if (!v7)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&__p);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&__p, (uint64_t)"Failed creating property list", 29);
    Code = CFErrorGetCode(error);
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)&__p, Code);
  }
  Length = CFDataGetLength(v7);
  BytePtr = (UInt8 *)CFDataGetBytePtr(v27);
  v10 = *((_QWORD *)details::get_dummy_shared_ptr() + 1);
  __p = BytePtr;
  *(_QWORD *)&v23 = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  *((_QWORD *)&v23 + 1) = Length;
  v24 = 0;
  v25 = Length;
  v26 = 0;
  v13 = (*(uint64_t (**)(Backend *, void **))(*(_QWORD *)a2 + 96))(a2, &__p);
  v14 = (std::__shared_weak_count *)v23;
  if ((_QWORD)v23)
  {
    v15 = (unint64_t *)(v23 + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  if ((v13 & 0x80000000) != 0
    || (v13 = (*(uint64_t (**)(Backend *, uint64_t))(*(_QWORD *)a2 + 16))(a2, 2)) != 0)
  {
    v18 = __cxa_allocate_exception(0x40uLL);
    *v18 = &off_24CF07908;
    v19 = std::generic_category();
    v18[1] = v13;
    v18[2] = v19;
    *((_BYTE *)v18 + 24) = 0;
    *((_BYTE *)v18 + 48) = 0;
    v18[7] = "Failed writing sparsebundle info";
  }
  CFAutoRelease<__CFData const*>::~CFAutoRelease((const void **)&v27);
  CFAutoRelease<__CFError *>::~CFAutoRelease((const void **)&error);
  return CFAutoRelease<__CFDictionary *>::~CFAutoRelease((const void **)&Mutable);
}

void sub_212FC9E9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;

  std::ostringstream::~ostringstream((uint64_t)&__p);
  CFAutoRelease<__CFData const*>::~CFAutoRelease((const void **)(v14 - 72));
  CFAutoRelease<__CFError *>::~CFAutoRelease((const void **)(v14 - 64));
  CFAutoRelease<__CFDictionary *>::~CFAutoRelease((const void **)(v14 - 56));
  _Unwind_Resume(a1);
}

_QWORD *di_log::logger<di_log::log_printer<304ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<304ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF134B0;
  a1[45] = &unk_24CF135B0;
  a1[46] = &unk_24CF135D8;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF134B0;
  a1[45] = &unk_24CF13538;
  a1[46] = &unk_24CF13560;
  return a1;
}

void sub_212FC9FC4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<304ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

_QWORD *di_log::logger<di_log::log_printer<322ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<322ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF136D0;
  a1[45] = &unk_24CF137D0;
  a1[46] = &unk_24CF137F8;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF136D0;
  a1[45] = &unk_24CF13758;
  a1[46] = &unk_24CF13780;
  return a1;
}

void sub_212FCA0AC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<322ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

uint64_t SparseBundleBackend::truncate(SparseBundleBackend *this, uint64_t a2)
{
  *((_QWORD *)this + 15) = (a2 + 4095) & 0xFFFFFFFFFFFFF000;
  SparseBundleBackend::write_info_plists(this);
  return 0;
}

_QWORD *di_log::logger<di_log::log_printer<340ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<340ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF138F0;
  a1[45] = &unk_24CF139F0;
  a1[46] = &unk_24CF13A18;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF138F0;
  a1[45] = &unk_24CF13978;
  a1[46] = &unk_24CF139A0;
  return a1;
}

void sub_212FCA2C8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<340ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<340ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<340ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

void SparseBundleBackend::open_token_file(SparseBundleBackend *this@<X0>, _QWORD *a2@<X8>)
{
  int *v3;
  int v4;
  void *__p[2];
  char v6;
  int v7;

  v3 = (int *)((char *)this + 32);
  if ((*(unsigned int (**)(SparseBundleBackend *))(*(_QWORD *)this + 48))(this))
    v4 = 2;
  else
    v4 = 0;
  v7 = v4;
  std::string::basic_string[abi:ne180100]<0>(__p, "token");
  std::allocate_shared[abi:ne180100]<FileLocal,std::allocator<FileLocal>,int &,std::string,int &,void>(v3, (uint64_t)__p, &v7, a2);
  if (v6 < 0)
    operator delete(__p[0]);
}

void sub_212FCA3A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t SparseBundleBackend::lock(SparseBundleBackend *this)
{
  int v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  __int128 v7;
  int v8;
  void *__p[2];
  char v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  if (((*(uint64_t (**)(SparseBundleBackend *))(*(_QWORD *)this + 192))(this) & 1) == 0)
  {
    v13 = 0;
    if ((*(unsigned int (**)(SparseBundleBackend *))(*(_QWORD *)this + 48))(this))
      v2 = 550;
    else
      v2 = 20;
    v13 = v2;
    std::string::basic_string[abi:ne180100]<0>(__p, "lock");
    std::allocate_shared[abi:ne180100]<FileLocal,std::allocator<FileLocal>,int &,std::string,int &,void>((int *)this + 8, (uint64_t)__p, &v13, &v7);
    std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)this + 80, &v7);
    v3 = (std::__shared_weak_count *)*((_QWORD *)&v7 + 1);
    if (*((_QWORD *)&v7 + 1))
    {
      v4 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
      do
        v5 = __ldaxr(v4);
      while (__stlxr(v5 - 1, v4));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    if (v10 < 0)
      operator delete(__p[0]);
    *(_QWORD *)&v7 = "int SparseBundleBackend::lock()";
    *((_QWORD *)&v7 + 1) = 29;
    v8 = 0;
    di_log::logger<di_log::log_printer<361ul>>::logger(__p, &v7);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v11, (uint64_t)"Opened bundle's lock file with flags 0x", 39);
    *(_DWORD *)((char *)&v11 + *(_QWORD *)(v11 - 24) + 8) = *(_DWORD *)((_BYTE *)&v11 + *(_QWORD *)(v11 - 24) + 8) & 0xFFFFFFB5 | 8;
    std::ostream::operator<<();
    *(_DWORD *)((char *)&v11 + *(_QWORD *)(v11 - 24) + 8) = *(_DWORD *)((_BYTE *)&v11 + *(_QWORD *)(v11 - 24) + 8) & 0xFFFFFFB5 | 2;
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<361ul>>::~logger_buf((uint64_t)__p);
    MEMORY[0x2199A89AC](&v12);
  }
  return 0;
}

void sub_212FCA554(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int128 a10, int a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60)
{
  _DWORD *v60;
  int v61;
  BOOL v62;

  if (a2 == 1)
  {
    v60 = __cxa_begin_catch(exception_object);
    v61 = v60[2];
    if (v61 < 0)
      v61 = -v61;
    v62 = v61 == 45 || v61 == 2;
    *(_QWORD *)&a10 = "int SparseBundleBackend::lock()";
    *((_QWORD *)&a10 + 1) = 29;
    if (v62)
    {
      a11 = 0;
      di_log::logger<di_log::log_printer<367ul>>::logger(&__p, &a10);
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&a60, (uint64_t)"Cannot lock bundle, ignoring: ", 30);
      operator<<(&a60, (uint64_t)v60);
      di_log::logger<di_log::log_printer<367ul>>::~logger((uint64_t)&__p);
    }
    else
    {
      a11 = 16;
      di_log::logger<di_log::log_printer<370ul>>::logger(&__p, &a10);
      operator<<(&a60, (uint64_t)v60);
      di_log::logger<di_log::log_printer<370ul>>::~logger((uint64_t)&__p);
    }
    __cxa_end_catch();
    JUMPOUT(0x212FCA53CLL);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *di_log::logger<di_log::log_printer<367ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<367ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF13B10;
  a1[45] = &unk_24CF13C10;
  a1[46] = &unk_24CF13C38;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF13B10;
  a1[45] = &unk_24CF13B98;
  a1[46] = &unk_24CF13BC0;
  return a1;
}

void sub_212FCA71C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<367ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

uint64_t `non-virtual thunk to'SparseBundleBackend::lock(SparseBundleBackend *this)
{
  return SparseBundleBackend::lock((SparseBundleBackend *)((char *)this - 72));
}

uint64_t SparseBundleBackend::unlock_all(SparseBundleBackend *this)
{
  __int128 v3;
  int v4;
  _QWORD v5[45];
  uint64_t v6;
  uint64_t v7;

  if ((*(unsigned int (**)(SparseBundleBackend *))(*(_QWORD *)this + 192))(this))
  {
    std::shared_ptr<Backend>::reset[abi:ne180100]((_QWORD *)this + 10);
    *(_QWORD *)&v3 = "int SparseBundleBackend::unlock_all()";
    *((_QWORD *)&v3 + 1) = 35;
    v4 = 0;
    di_log::logger<di_log::log_printer<379ul>>::logger(v5, &v3);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v6, (uint64_t)"Bundle's lock file is closed", 28);
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf((uint64_t)v5);
    MEMORY[0x2199A89AC](&v7);
  }
  return 0;
}

void sub_212FCA82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  di_log::logger<di_log::log_printer<379ul>>::~logger((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *di_log::logger<di_log::log_printer<379ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<379ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF13D30;
  a1[45] = &unk_24CF13E30;
  a1[46] = &unk_24CF13E58;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF13D30;
  a1[45] = &unk_24CF13DB8;
  a1[46] = &unk_24CF13DE0;
  return a1;
}

void sub_212FCA8C4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<379ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

uint64_t `non-virtual thunk to'SparseBundleBackend::unlock_all(SparseBundleBackend *this)
{
  SparseBundleBackend::unlock_all((SparseBundleBackend *)((char *)this - 72));
  return 0;
}

BOOL SparseBundleBackend::is_locked(SparseBundleBackend *this)
{
  return *((_QWORD *)this + 10) != 0;
}

BOOL `non-virtual thunk to'SparseBundleBackend::is_locked(SparseBundleBackend *this)
{
  return *((_QWORD *)this + 1) != 0;
}

void SparseBundleBackend::open_bands_folder(SparseBundleBackend *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  int v5;
  void *__p[2];
  char v7;

  std::string::basic_string[abi:ne180100]<0>(__p, "bands");
  v4 = operator new();
  v5 = FileDescriptorWrapper::open_from(*((_DWORD *)this + 8), (uint64_t)__p, 0);
  *(_QWORD *)v4 = &off_24CF0F430;
  *(_DWORD *)(v4 + 8) = v5;
  *a2 = v4;
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_212FCA9F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x2199A8A18](v15, 0x1081C409227ACB4);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void SparseBundleBackend::open_mapped_folder(SparseBundleBackend *this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  int v5;
  void *__p[2];
  char v7;

  std::string::basic_string[abi:ne180100]<0>(__p, "mapped");
  v4 = operator new();
  v5 = FileDescriptorWrapper::open_from(*((_DWORD *)this + 8), (uint64_t)__p, 0);
  *(_QWORD *)v4 = &off_24CF0F430;
  *(_DWORD *)(v4 + 8) = v5;
  *a2 = v4;
  if (v7 < 0)
    operator delete(__p[0]);
}

void sub_212FCAAC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  MEMORY[0x2199A8A18](v15, 0x1081C409227ACB4);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t SparseBundleBackend::browse_bands_folder(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  dirent *v5;
  char *d_name;
  uint64_t v7;
  uint64_t v8;
  DIR *v10;
  void *__p[2];
  char v12;
  uint64_t v13;

  v3 = *(_DWORD *)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, "bands");
  v4 = FileDescriptorWrapper::open_from(v3, (uint64_t)__p, 0);
  if (v12 < 0)
    operator delete(__p[0]);
  dirEntries_t::dirEntries_t((dirEntries_t *)&v10, v4);
  while (1)
  {
    v5 = readdir(v10);
    if (!v5)
      break;
    *__error() = 0;
    d_name = v5->d_name;
    v7 = strtoll(d_name, 0, 16);
    if (!*__error())
    {
      std::string::basic_string[abi:ne180100]<0>(__p, d_name);
      v13 = v7;
      v8 = *(_QWORD *)(a2 + 24);
      if (!v8)
        std::__throw_bad_function_call[abi:ne180100]();
      (*(void (**)(uint64_t, void **, uint64_t *))(*(_QWORD *)v8 + 48))(v8, __p, &v13);
      if (v12 < 0)
        operator delete(__p[0]);
    }
  }
  return closedir(v10);
}

void sub_212FCAC04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, DIR *a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t SparseBundleBackend::get_existing_bands@<X0>(SparseBundleBackend *this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t result;
  __int128 v9;
  int v10;
  _QWORD v11[45];
  uint64_t v12;
  _BYTE v13[152];
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  _BYTE v17[24];
  _BYTE *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v16 = (unint64_t)(*((_QWORD *)this + 15) + *((_QWORD *)this + 16) - 1) / *((_QWORD *)this + 16);
  v4 = (_QWORD *)operator new();
  lock_free::bitmap_dynamically_allocated_t::bitmap_dynamically_allocated_t(v4, v16, 0);
  v14 = 0;
  v15 = v4;
  *(_QWORD *)&v9 = "SparseBundleBackend::get_existing_bands() const";
  *((_QWORD *)&v9 + 1) = 39;
  v10 = 0;
  di_log::logger<di_log::log_printer<437ul>>::logger(v11, &v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v12, (uint64_t)"Looking for existing bands", 26);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf((uint64_t)v11);
  MEMORY[0x2199A89AC](v13);
  v18 = 0;
  v5 = operator new(0x20uLL);
  *v5 = &off_24CF14388;
  v5[1] = &v16;
  v5[2] = &v15;
  v5[3] = &v14;
  v18 = v5;
  SparseBundleBackend::browse_bands_folder((uint64_t)this, (uint64_t)v17);
  v6 = v18;
  if (v18 == v17)
  {
    v7 = 4;
    v6 = v17;
    goto LABEL_5;
  }
  if (v18)
  {
    v7 = 5;
LABEL_5:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }
  *(_QWORD *)&v9 = "SparseBundleBackend::get_existing_bands() const";
  *((_QWORD *)&v9 + 1) = 39;
  v10 = 0;
  di_log::logger<di_log::log_printer<446ul>>::logger(v11, &v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v12, (uint64_t)"Found ", 6);
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v12, (uint64_t)" existing bands", 15);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf((uint64_t)v11);
  result = MEMORY[0x2199A89AC](v13);
  *a2 = v15;
  return result;
}

void sub_212FCAE44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  uint64_t v12;
  uint64_t v14;

  v14 = *(_QWORD *)(v12 - 104);
  *(_QWORD *)(v12 - 104) = 0;
  if (v14)
    (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  _Unwind_Resume(exception_object);
}

_QWORD *di_log::logger<di_log::log_printer<437ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<437ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF13F50;
  a1[45] = &unk_24CF14050;
  a1[46] = &unk_24CF14078;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF13F50;
  a1[45] = &unk_24CF13FD8;
  a1[46] = &unk_24CF14000;
  return a1;
}

void sub_212FCAF68(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<437ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

_QWORD *di_log::logger<di_log::log_printer<446ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<446ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF14170;
  a1[45] = &unk_24CF14270;
  a1[46] = &unk_24CF14298;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF14170;
  a1[45] = &unk_24CF141F8;
  a1[46] = &unk_24CF14220;
  return a1;
}

void sub_212FCB050(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<446ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

void SparseBundleBackend::~SparseBundleBackend(SparseBundleBackend *this)
{
  FileDescriptorWrapper *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;

  *(_QWORD *)this = &off_24CF12558;
  *((_QWORD *)this + 3) = &unk_24CF12630;
  v2 = (SparseBundleBackend *)((char *)this + 24);
  *((_QWORD *)this + 9) = &unk_24CF12658;
  v3 = *((_QWORD *)this + 14);
  *((_QWORD *)this + 14) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 96);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 80);
  FileDescriptorWrapper::~FileDescriptorWrapper(v2);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

{
  FileDescriptorWrapper *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;

  *(_QWORD *)this = &off_24CF12558;
  *((_QWORD *)this + 3) = &unk_24CF12630;
  v2 = (SparseBundleBackend *)((char *)this + 24);
  *((_QWORD *)this + 9) = &unk_24CF12658;
  v3 = *((_QWORD *)this + 14);
  *((_QWORD *)this + 14) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 96);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 80);
  FileDescriptorWrapper::~FileDescriptorWrapper(v2);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  JUMPOUT(0x2199A8A18);
}

uint64_t SparseBundleBackend::flush(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 112) + 16))(*(_QWORD *)(a1 + 112));
}

uint64_t SparseBundleBackend::get_size(SparseBundleBackend *this)
{
  return *((_QWORD *)this + 15);
}

uint64_t FileDescriptorBackend::is_writable(FileDescriptorBackend *this)
{
  return *((unsigned __int8 *)this + 36);
}

_QWORD *SparseBundleBackend::name(uint64_t a1, _QWORD *a2)
{
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"sparsebundle", 12);
}

uint64_t SparseBundleBackend::write()
{
  return 4294967251;
}

uint64_t SparseBundleBackend::read()
{
  return 4294967251;
}

uint64_t FileDescriptorBackend::get_identifier(FileDescriptorBackend *this)
{
  return *((_QWORD *)this + 7);
}

void `non-virtual thunk to'SparseBundleBackend::~SparseBundleBackend(SparseBundleBackend *this)
{
  uint64_t v2;
  std::__shared_weak_count *v3;

  *((_QWORD *)this - 3) = &off_24CF12558;
  *(_QWORD *)this = &unk_24CF12630;
  *((_QWORD *)this + 6) = &unk_24CF12658;
  v2 = *((_QWORD *)this + 11);
  *((_QWORD *)this + 11) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 72);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 56);
  FileDescriptorWrapper::~FileDescriptorWrapper(this);
  v3 = (std::__shared_weak_count *)*((_QWORD *)this - 1);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
}

{
  uint64_t v2;
  std::__shared_weak_count *v3;

  *((_QWORD *)this - 3) = &off_24CF12558;
  *(_QWORD *)this = &unk_24CF12630;
  *((_QWORD *)this + 6) = &unk_24CF12658;
  v2 = *((_QWORD *)this + 11);
  *((_QWORD *)this + 11) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 72);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 56);
  FileDescriptorWrapper::~FileDescriptorWrapper(this);
  v3 = (std::__shared_weak_count *)*((_QWORD *)this - 1);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  JUMPOUT(0x2199A8A18);
}

{
  FileDescriptorWrapper *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;

  *((_QWORD *)this - 9) = &off_24CF12558;
  *((_QWORD *)this - 6) = &unk_24CF12630;
  v2 = (SparseBundleBackend *)((char *)this - 48);
  *(_QWORD *)this = &unk_24CF12658;
  v3 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
  FileDescriptorWrapper::~FileDescriptorWrapper(v2);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this - 7);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
}

{
  FileDescriptorWrapper *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;

  *((_QWORD *)this - 9) = &off_24CF12558;
  *((_QWORD *)this - 6) = &unk_24CF12630;
  v2 = (SparseBundleBackend *)((char *)this - 48);
  *(_QWORD *)this = &unk_24CF12658;
  v3 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 8);
  FileDescriptorWrapper::~FileDescriptorWrapper(v2);
  v4 = (std::__shared_weak_count *)*((_QWORD *)this - 7);
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  JUMPOUT(0x2199A8A18);
}

void set_euid_wrapper::set_euid_wrapper(set_euid_wrapper *this, uid_t a2)
{
  void *exception;
  __int128 v3;
  int v4;
  _QWORD v5[45];
  uint64_t v6;
  uint64_t v7;

  if (seteuid(a2))
  {
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v5);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"failed to set euid to ", 22);
    std::ostream::operator<<();
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v5, 1u);
  }
  *(_QWORD *)&v3 = "set_euid_wrapper::set_euid_wrapper(uid_t)";
  *((_QWORD *)&v3 + 1) = 34;
  v4 = 0;
  di_log::logger<di_log::log_printer<128ul>>::logger(v5, &v3);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v6, (uint64_t)"uid temporarily set to ", 23);
  std::ostream::operator<<();
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf((uint64_t)v5);
  MEMORY[0x2199A89AC](&v7);
}

void sub_212FCB528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *di_log::logger<di_log::log_printer<128ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<128ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF127F0;
  a1[45] = &unk_24CF128F0;
  a1[46] = &unk_24CF12918;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF127F0;
  a1[45] = &unk_24CF12878;
  a1[46] = &unk_24CF128A0;
  return a1;
}

void sub_212FCB5F0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<128ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

uint64_t di_log::logger_buf<di_log::log_printer<128ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF12988;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FCB6BC(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF12988;
  di_log::logger_buf<di_log::log_printer<128ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

void di_log::logger<di_log::log_printer<128ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<128ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<128ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<128ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<128ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<128ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<128ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<128ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FCBAB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

int *di_log::log_printer<128ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 128;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 128;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

void set_euid_wrapper::~set_euid_wrapper(set_euid_wrapper *this)
{
  __int128 v1;
  int v2;
  _QWORD v3[45];
  uint64_t v4;
  uint64_t v5;

  seteuid(0);
  *(_QWORD *)&v1 = "set_euid_wrapper::~set_euid_wrapper()";
  *((_QWORD *)&v1 + 1) = 35;
  v2 = 0;
  di_log::logger<di_log::log_printer<133ul>>::logger(v3, &v1);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v4, (uint64_t)"uid restored to 0 (res=", 23);
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v4, (uint64_t)")", 1);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf((uint64_t)v3);
  MEMORY[0x2199A89AC](&v5);
}

_QWORD *di_log::logger<di_log::log_printer<133ul>>::logger(_QWORD *a1, __int128 *a2)
{
  std::ios_base *v3;

  v3 = (std::ios_base *)(a1 + 46);
  a1[46] = MEMORY[0x24BEDB898] + 16;
  di_log::logger_buf<di_log::log_printer<133ul>>::logger_buf((uint64_t)a1, a2);
  *a1 = &off_24CF12A10;
  a1[45] = &unk_24CF12B10;
  a1[46] = &unk_24CF12B38;
  std::ios_base::init(v3, a1);
  a1[63] = 0;
  *((_DWORD *)a1 + 128) = -1;
  *a1 = &off_24CF12A10;
  a1[45] = &unk_24CF12A98;
  a1[46] = &unk_24CF12AC0;
  return a1;
}

void sub_212FCBE00(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger<di_log::log_printer<133ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  return a1;
}

uint64_t di_log::logger_buf<di_log::log_printer<133ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF12BA8;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FCBECC(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF12BA8;
  di_log::logger_buf<di_log::log_printer<133ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

void di_log::logger<di_log::log_printer<133ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<133ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<133ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<133ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<133ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<133ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<133ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<133ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FCC2C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

int *di_log::log_printer<133ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 133;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 133;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<161ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<161ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger<di_log::log_printer<161ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<161ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<161ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF12DC8;
  di_log::logger_buf<di_log::log_printer<161ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<161ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<161ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FCC884(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<161ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

int *di_log::log_printer<161ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 161;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 161;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<207ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<207ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger<di_log::log_printer<207ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<207ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<207ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF12FE8;
  di_log::logger_buf<di_log::log_printer<207ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<207ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<207ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FCCE70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<207ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

int *di_log::log_printer<207ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 207;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 207;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

_QWORD *std::vector<unsigned char>::vector(_QWORD *a1, size_t a2)
{
  char *v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<std::byte>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_212FCD0F8(_Unwind_Exception *exception_object)
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

void `non-virtual thunk to'di_log::logger<di_log::log_printer<263ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<263ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger<di_log::log_printer<263ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<263ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<263ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF13208;
  di_log::logger_buf<di_log::log_printer<263ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<263ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<263ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FCD4CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<263ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

int *di_log::log_printer<263ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 263;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 263;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<270ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<270ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger<di_log::log_printer<270ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<270ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<270ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF13428;
  di_log::logger_buf<di_log::log_printer<270ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<270ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<270ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FCDAB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<270ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

int *di_log::log_printer<270ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 270;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 270;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<304ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<304ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger<di_log::log_printer<304ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<304ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<304ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF13648;
  di_log::logger_buf<di_log::log_printer<304ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<304ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<304ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FCE0A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<304ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

int *di_log::log_printer<304ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 304;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 304;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<322ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<322ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger<di_log::log_printer<322ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<322ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<322ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF13868;
  di_log::logger_buf<di_log::log_printer<322ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<322ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<322ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FCE690(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<322ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

int *di_log::log_printer<322ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 322;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 322;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<340ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<340ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<340ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<340ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<340ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<340ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger<di_log::log_printer<340ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<340ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<340ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<340ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<340ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF13A88;
  di_log::logger_buf<di_log::log_printer<340ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<340ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<340ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FCEC7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<340ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<340ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

int *di_log::log_printer<340ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 340;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 340;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<367ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<367ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger<di_log::log_printer<367ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<367ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<367ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF13CA8;
  di_log::logger_buf<di_log::log_printer<367ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<367ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<367ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FCF268(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<367ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

int *di_log::log_printer<367ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 367;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 367;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<379ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<379ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger<di_log::log_printer<379ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<379ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<379ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF13EC8;
  di_log::logger_buf<di_log::log_printer<379ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<379ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<379ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FCF854(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<379ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

int *di_log::log_printer<379ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 379;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 379;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

void dirEntries_t::dirEntries_t(dirEntries_t *this, int a2)
{
  DIR *v3;
  DiskImagesRuntimeException *exception;
  void *v5;

  v3 = fdopendir(a2);
  *(_QWORD *)this = v3;
  if (!v3)
  {
    exception = (DiskImagesRuntimeException *)__cxa_allocate_exception(0x40uLL);
    DiskImagesRuntimeException::DiskImagesRuntimeException(exception, "Failed opening folder for entries reading", 0x13u);
  }
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<437ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<437ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger<di_log::log_printer<437ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<437ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<437ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF140E8;
  di_log::logger_buf<di_log::log_printer<437ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<437ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<437ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FCFE9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<437ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

int *di_log::log_printer<437ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 437;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 437;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

void `non-virtual thunk to'di_log::logger<di_log::log_printer<446ul>>::~logger(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v2;

  v2 = a1 - 360;
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(v2);
  MEMORY[0x2199A89AC](a1 + 8);
  JUMPOUT(0x2199A8A18);
}

void `virtual thunk to'di_log::logger<di_log::log_printer<446ul>>::~logger(_QWORD *a1)
{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(v1);
  JUMPOUT(0x2199A89ACLL);
}

{
  uint64_t v1;

  v1 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(v1);
  MEMORY[0x2199A89AC](v1 + 368);
  JUMPOUT(0x2199A8A18);
}

void di_log::logger<di_log::log_printer<446ul>>::~logger(uint64_t a1)
{
  std::ostream::~ostream();
  di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(a1);
  MEMORY[0x2199A89AC](a1 + 368);
  JUMPOUT(0x2199A8A18);
}

uint64_t di_log::logger_buf<di_log::log_printer<446ul>>::xsputn(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 64))
    std::ostream::write();
  return a3;
}

uint64_t di_log::logger_buf<di_log::log_printer<446ul>>::overflow(_BYTE *a1, int a2)
{
  unsigned __int8 v2;

  v2 = a2;
  if (a1[64])
  {
    if (a2 == -1)
      (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 48))(a1);
    else
      std::ostream::put();
  }
  return v2;
}

uint64_t di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)a1 = &off_24CF14308;
  di_log::logger_buf<di_log::log_printer<446ul>>::_sync(a1);
  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96) = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + 96 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 104) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 191) < 0)
    operator delete(*(void **)(a1 + 168));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2199A89AC](a1 + 208);
  return std::streambuf::~streambuf();
}

uint64_t di_log::logger_buf<di_log::log_printer<446ul>>::_sync(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    v2 = (_QWORD *)(a1 + 96);
    v3 = a1 + 96 + *(_QWORD *)(*(_QWORD *)(a1 + 96) - 24);
    if ((*(_BYTE *)(v3 + 32) & 5) == 0)
    {
      (*(void (**)(void **__return_ptr, _QWORD, _QWORD, uint64_t, uint64_t))(**(_QWORD **)(v3 + 40) + 32))(__p, *(_QWORD *)(v3 + 40), 0, 1, 16);
      if (v7 >= 1)
      {
        std::stringbuf::str[abi:ne180100]<std::allocator<char>>(a1 + 104, __p);
        di_log::log_printer<446ul>::log((uint64_t *)(a1 + 72), (uint64_t *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
        std::ios_base::clear((std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)), 0);
        std::string::basic_string[abi:ne180100]<0>(__p, "");
        std::stringbuf::str[abi:ne180100](a1 + 104, (__int128 *)__p);
        if (v6 < 0)
          operator delete(__p[0]);
      }
    }
  }
  return 0;
}

void sub_212FD0488(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(uint64_t a1)
{
  di_log::logger_buf<di_log::log_printer<446ul>>::~logger_buf(a1);
  JUMPOUT(0x2199A8A18);
}

int *di_log::log_printer<446ul>::log(uint64_t *a1, uint64_t *a2)
{
  int v4;
  int v5;
  NSObject *DIOSLog;
  uint64_t v7;
  uint64_t *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t *v14;
  int *result;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = *((_DWORD *)a1 + 2);
  v5 = *__error();
  if (DIForwardLogs())
  {
    DIOSLog = getDIOSLog();
    os_log_type_enabled(DIOSLog, *((os_log_type_t *)a1 + 16));
    v7 = *a1;
    if (*((char *)a2 + 23) >= 0)
      v8 = a2;
    else
      v8 = (uint64_t *)*a2;
    *(_DWORD *)buf = 68158466;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    v20 = 2048;
    v21 = 446;
    v22 = 2082;
    v23 = v8;
    v9 = (const char *)_os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (char *)v9;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v10);
    }
  }
  else
  {
    v11 = getDIOSLog();
    v12 = *((_DWORD *)a1 + 4);
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *a1;
      if (*((char *)a2 + 23) >= 0)
        v14 = a2;
      else
        v14 = (uint64_t *)*a2;
      *(_DWORD *)buf = 68158466;
      v17 = v4;
      v18 = 2080;
      v19 = v13;
      v20 = 2048;
      v21 = 446;
      v22 = 2082;
      v23 = v14;
      _os_log_impl(&dword_212EB0000, v11, v12, "%.*s: <%lu> %{public}s", buf, 0x26u);
    }
  }
  result = __error();
  *result = v5;
  return result;
}

uint64_t di_log::logger_buf<di_log::log_printer<161ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF12DC8;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FD0724(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<207ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF12FE8;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FD07A0(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<263ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF13208;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FD081C(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<270ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF13428;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FD0898(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<304ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF13648;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FD0914(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<322ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF13868;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FD0990(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<340ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF13A88;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FD0A0C(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void std::allocate_shared[abi:ne180100]<FileLocal,std::allocator<FileLocal>,int &,std::string,int &,void>(int *a1@<X1>, uint64_t a2@<X2>, int *a3@<X3>, _QWORD *a4@<X8>)
{
  _QWORD *v8;

  v8 = operator new(0x470uLL);
  std::__shared_ptr_emplace<FileLocal>::__shared_ptr_emplace[abi:ne180100]<int &,std::string,int &,std::allocator<FileLocal>,0>(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  std::shared_ptr<PurgeableFileBackend>::__enable_weak_this[abi:ne180100]<Backend,PurgeableFileBackend,void>((uint64_t)a4, v8 + 4, (uint64_t)(v8 + 3));
}

void sub_212FD0A84(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<FileLocal>::__shared_ptr_emplace[abi:ne180100]<int &,std::string,int &,std::allocator<FileLocal>,0>(_QWORD *a1, int *a2, uint64_t a3, int *a4)
{
  int v5;
  int v6;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24CEEEF38;
  v5 = *a4;
  v6 = FileDescriptorWrapper::open_from(*a2, a3, *a4);
  FileLocal::FileLocal((FileLocal *)(a1 + 3), v6, (v5 & 3) != 0, 0);
  return a1;
}

void sub_212FD0AF4(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<367ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF13CA8;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FD0B70(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<379ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF13EC8;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FD0BEC(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

uint64_t di_log::logger_buf<di_log::log_printer<437ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF140E8;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FD0C68(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void std::__function::__func<SparseBundleBackend::get_existing_bands(void)::$_0,std::allocator<SparseBundleBackend::get_existing_bands(void)::$_0>,void ()(std::string const&,unsigned long long)>::~__func()
{
  JUMPOUT(0x2199A8A18);
}

__n128 std::__function::__func<SparseBundleBackend::get_existing_bands(void)::$_0,std::allocator<SparseBundleBackend::get_existing_bands(void)::$_0>,void ()(std::string const&,unsigned long long)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x20uLL);
  *(_QWORD *)v2 = &off_24CF14388;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  *((_QWORD *)v2 + 3) = *(_QWORD *)(a1 + 24);
  return result;
}

__n128 std::__function::__func<SparseBundleBackend::get_existing_bands(void)::$_0,std::allocator<SparseBundleBackend::get_existing_bands(void)::$_0>,void ()(std::string const&,unsigned long long)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_24CF14388;
  result = *(__n128 *)(a1 + 8);
  *(_QWORD *)(a2 + 24) = *(_QWORD *)(a1 + 24);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

BOOL std::__function::__func<SparseBundleBackend::get_existing_bands(void)::$_0,std::allocator<SparseBundleBackend::get_existing_bands(void)::$_0>,void ()(std::string const&,unsigned long long)>::operator()(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  _BOOL8 result;
  void *exception;
  int v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[33];

  if (**(_QWORD **)(a1 + 8) <= *a3)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v10);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)"Bands folder contains an out of range band (", 44);
    v7 = *(char *)(a2 + 23);
    if (v7 >= 0)
      v8 = a2;
    else
      v8 = *(_QWORD *)a2;
    if (v7 >= 0)
      v9 = *(unsigned __int8 *)(a2 + 23);
    else
      v9 = *(_QWORD *)(a2 + 8);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, v8, v9);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)")", 1);
    DiskImagesRuntimeException::DiskImagesRuntimeException((uint64_t)exception, (uint64_t)v10, 0x16u);
  }
  result = lock_free::bitmap_t::set_bit(**(lock_free::bitmap_t ***)(a1 + 16), *a3, 1);
  ++**(_QWORD **)(a1 + 24);
  return result;
}

void sub_212FD0DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  a10 = *MEMORY[0x24BEDB800];
  *(uint64_t *)((char *)&a10 + *(_QWORD *)(a10 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  a11 = MEMORY[0x24BEDB848] + 16;
  if (a24 < 0)
    operator delete(__p);
  std::__function::__func<info::DiskImageInfoSparseBundle::count_mapped_bytes(DiskImageSparseBundle const&)::$_0,std::allocator<info::DiskImageInfoSparseBundle::count_mapped_bytes(DiskImageSparseBundle const&)::$_0>,void ()(std::string const&,unsigned long long)>::operator()((uint64_t)&a11, (uint64_t)&a10);
  _Unwind_Resume(a1);
}

uint64_t std::__function::__func<SparseBundleBackend::get_existing_bands(void)::$_0,std::allocator<SparseBundleBackend::get_existing_bands(void)::$_0>,void ()(std::string const&,unsigned long long)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<SparseBundleBackend::get_existing_bands(void)::$_0,std::allocator<SparseBundleBackend::get_existing_bands(void)::$_0>,void ()(std::string const&,unsigned long long)>::target_type()
{
}

uint64_t di_log::logger_buf<di_log::log_printer<446ul>>::logger_buf(uint64_t a1, __int128 *a2)
{
  char v4;
  __int128 v5;

  *(_QWORD *)std::streambuf::basic_streambuf() = &off_24CF14308;
  if (*((_DWORD *)a2 + 4) == 2)
    v4 = DIDebugLogsEnabled();
  else
    v4 = 1;
  *(_BYTE *)(a1 + 64) = v4;
  v5 = *a2;
  *(_QWORD *)(a1 + 88) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 72) = v5;
  std::ostringstream::basic_ostringstream[abi:ne180100](a1 + 96);
  return a1;
}

void sub_212FD0F5C(_Unwind_Exception *a1)
{
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

const void **info::DiskImageStackableInfo::get_layers@<X0>(const DiskImageStackable *a1@<X1>, char a2@<W2>, const __CFArray **a3@<X8>)
{
  const __CFArray *Mutable;
  int *v8;
  int *v9;
  CFIndex Count;
  const __CFString *v11;
  __CFArray *v12;
  uint64_t v13;
  uint64_t j;
  uint64_t i;
  char *v16;
  uint64_t v18;
  const __CFString **v19;
  uint64_t v20;
  void *value;
  const __CFString *v22;
  char *v23;
  CFArrayRef theArray;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a1 + 3) - *((_QWORD *)a1 + 2)) >> 4), MEMORY[0x24BDBD690]);
  theArray = Mutable;
  v8 = (int *)*((_QWORD *)a1 + 2);
  v9 = (int *)*((_QWORD *)a1 + 3);
  if (v8 != v9)
  {
    do
    {
      (*(void (**)(char **__return_ptr, _QWORD, _QWORD))(**((_QWORD **)v8 + 3) + 48))(&v23, *((_QWORD *)v8 + 3), 0);
      Count = CFArrayGetCount(theArray);
      v11 = CFSTR("Base");
      if (Count != -1 - 0x5555555555555555 * ((uint64_t)(*((_QWORD *)a1 + 3) - *((_QWORD *)a1 + 2)) >> 4))
        v11 = off_24CF15158[*v8];
      v22 = v11;
      v12 = theArray;
      if ((a2 & 4) != 0)
      {
        v25 = CFSTR("Role");
        v26 = v11;
        CFRetain(v11);
        (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)&v23[*(_QWORD *)(*(_QWORD *)v23 - 96)] + 16))(&v18);
        v27 = CFSTR("Image");
        v28 = v18;
        v18 = 0;
        v19 = &v25;
        v20 = 2;
        cf::create_dict_from_list((uint64_t *)&v19, (CFMutableDictionaryRef *)&value);
        CFArrayAppendValue(v12, value);
        CFAutoRelease<__CFDictionary *>::~CFAutoRelease((const void **)&value);
        for (i = 24; i != -8; i -= 16)
          CFAutoRelease<void const*>::~CFAutoRelease((const void **)((char *)&v25 + i));
        CFAutoRelease<__CFDictionary const*>::~CFAutoRelease((const void **)&v18);
      }
      else
      {
        v25 = CFSTR("Role");
        v26 = v11;
        CFRetain(v11);
        v13 = (*(uint64_t (**)(char *))(*(_QWORD *)&v23[*(_QWORD *)(*(_QWORD *)v23 - 96)] + 24))(&v23[*(_QWORD *)(*(_QWORD *)v23 - 96)]);
        v27 = CFSTR("Image Format");
        v28 = v13;
        v19 = &v25;
        v20 = 2;
        cf::create_dict_from_list((uint64_t *)&v19, (CFMutableDictionaryRef *)&value);
        CFArrayAppendValue(v12, value);
        CFAutoRelease<__CFDictionary *>::~CFAutoRelease((const void **)&value);
        for (j = 24; j != -8; j -= 16)
          CFAutoRelease<void const*>::~CFAutoRelease((const void **)((char *)&v25 + j));
      }
      CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)&v22);
      v16 = v23;
      v23 = 0;
      if (v16)
        (*(void (**)(char *))(*(_QWORD *)v16 + 8))(v16);
      v8 += 12;
    }
    while (v8 != v9);
    Mutable = theArray;
  }
  *a3 = Mutable;
  theArray = 0;
  return CFAutoRelease<__CFArray *>::~CFAutoRelease((const void **)&theArray);
}

void sub_212FD11E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, const void *a11, uint64_t a12, uint64_t a13, const void *a14, const void *a15, uint64_t a16, const void *a17, char a18)
{
  uint64_t i;
  uint64_t v20;

  CFAutoRelease<__CFDictionary *>::~CFAutoRelease(&a14);
  for (i = 24; i != -8; i -= 16)
    CFAutoRelease<void const*>::~CFAutoRelease((const void **)(&a18 + i));
  CFAutoRelease<__CFDictionary const*>::~CFAutoRelease(&a11);
  CFAutoRelease<__CFString const*>::~CFAutoRelease(&a15);
  v20 = a16;
  a16 = 0;
  if (v20)
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
  CFAutoRelease<__CFArray *>::~CFAutoRelease(&a17);
  _Unwind_Resume(a1);
}

CFTypeRef *CFAutoRelease<__CFString const*>::operator=(CFTypeRef *a1, CFTypeRef *a2)
{
  if (*a2)
    CFRetain(*a2);
  if (*a1)
    CFRelease(*a1);
  *a1 = *a2;
  return a1;
}

info::DiskImageStackableInfo *info::DiskImageStackableInfo::DiskImageStackableInfo(info::DiskImageStackableInfo *this, const DiskImageStackable *a2, uint64_t a3)
{
  CFTypeRef *v6;
  CFTypeRef *v7;
  uint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  const void *v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  const void *v25;
  _QWORD v26[3];

  *(_QWORD *)this = off_24CF14930;
  *((_QWORD *)this + 7) = off_24CF14A98;
  *((_QWORD *)this + 8) = off_24CF14AE0;
  *((_QWORD *)this + 9) = &off_24CF14D68;
  *((_QWORD *)this + 3) = &off_24CF14DC0;
  *((_QWORD *)this + 4) = off_24CF149C0;
  *((_BYTE *)this + 96) = 0;
  *((_BYTE *)this + 104) = 0;
  *((_BYTE *)this + 112) = 0;
  *((_BYTE *)this + 120) = 0;
  *((_QWORD *)this + 17) = &off_24CF14EB0;
  *((_QWORD *)this + 5) = &off_24CF14F08;
  *((_QWORD *)this + 6) = off_24CF14A50;
  *((_BYTE *)this + 144) = 0;
  *((_BYTE *)this + 152) = 0;
  *((_QWORD *)this + 20) = 0;
  info::IdentityInfo::IdentityInfo<DiskImageStackable>((_QWORD *)this + 21, (DiskImage *)&off_24CF148B0, (uint64_t)a2);
  *(_QWORD *)this = &off_24CF14478;
  *((_QWORD *)this + 3) = &unk_24CF144C0;
  *((_QWORD *)this + 4) = &unk_24CF14508;
  *((_QWORD *)this + 5) = &unk_24CF14550;
  *((_QWORD *)this + 6) = &unk_24CF14598;
  *((_QWORD *)this + 7) = &unk_24CF145E0;
  *((_QWORD *)this + 8) = &unk_24CF14628;
  *((_QWORD *)this + 9) = &unk_24CF14688;
  *((_QWORD *)this + 17) = &unk_24CF146F8;
  *((_QWORD *)this + 1) = 0;
  v6 = (CFTypeRef *)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  v7 = (CFTypeRef *)((char *)this + 16);
  *((_QWORD *)this + 21) = &unk_24CF14768;
  v8 = *((_QWORD *)a2 + 2);
  v9 = *(_QWORD *)(v8 + 24);
  v10 = *(std::__shared_weak_count **)(v8 + 32);
  v26[1] = v9;
  v26[2] = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)v9 + 48))(v26, v9, a3);
  v13 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v26[0] + *(_QWORD *)(*(_QWORD *)v26[0] - 24)) + 16))(v26[0] + *(_QWORD *)(*(_QWORD *)v26[0] - 24));
  v14 = *(_QWORD *)this;
  *(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 112) + 16) = *(_QWORD *)(v13 + 16);
  *(_QWORD *)((char *)this + *(_QWORD *)(v14 - 112) + 8) = *(_QWORD *)(v13 + 8);
  *(_QWORD *)((char *)this + *(_QWORD *)(v14 - 112) + 56) = *(_QWORD *)(v13 + 56);
  v15 = (char *)this + *(_QWORD *)(v14 - 112);
  v16 = *(_QWORD *)(v13 + 40);
  v15[48] = *(_BYTE *)(v13 + 48);
  *((_QWORD *)v15 + 5) = v16;
  v17 = (char *)this + *(_QWORD *)(*(_QWORD *)this - 112);
  v18 = *(_QWORD *)(v13 + 24);
  v17[32] = *(_BYTE *)(v13 + 32);
  *((_QWORD *)v17 + 3) = v18;
  v19 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v26[0] + *(_QWORD *)(*(_QWORD *)v26[0] - 64)) + 16))(v26[0] + *(_QWORD *)(*(_QWORD *)v26[0] - 64));
  CFAutoRelease<__CFString const*>::operator=((CFTypeRef *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 128) + 16), (CFTypeRef *)(v19 + 16));
  CFAutoRelease<__CFString const*>::operator=((CFTypeRef *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 128) + 24), (CFTypeRef *)(v19 + 24));
  info::DiskImageStackableInfo::get_layers(a2, a3, (const __CFArray **)&v25);
  if (*v6)
    CFRelease(*v6);
  *v6 = v25;
  v25 = 0;
  CFAutoRelease<__CFArray const*>::~CFAutoRelease(&v25);
  v20 = (const void *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)(v26[0] + *(_QWORD *)(*(_QWORD *)v26[0] - 96))
                                                        + 24))(v26[0] + *(_QWORD *)(*(_QWORD *)v26[0] - 96));
  v25 = v20;
  if (*v7)
  {
    CFRelease(*v7);
    v20 = v25;
  }
  *v7 = v20;
  v25 = 0;
  CFAutoRelease<__CFString const*>::~CFAutoRelease(&v25);
  v21 = v26[0];
  v26[0] = 0;
  if (v21)
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
  if (v10)
  {
    v22 = (unint64_t *)&v10->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return this;
}

void sub_212FD15E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, uint64_t a10, char a11)
{
  uint64_t v11;
  const void **v12;
  const void **v13;
  const void **v14;
  const void **v15;
  uint64_t v16;
  uint64_t v18;

  CFAutoRelease<__CFString const*>::~CFAutoRelease(&a9);
  v18 = a10;
  a10 = 0;
  if (v18)
    (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  CFAutoRelease<__CFString const*>::~CFAutoRelease(v14);
  CFAutoRelease<__CFArray const*>::~CFAutoRelease(v15);
  info::IdentityInfo::~IdentityInfo(v13, (const void **)&off_24CF148B0);
  *(_QWORD *)(v11 + 136) = v16;
  *(_QWORD *)(v11 + 40) = v16 + 88;
  CFAutoRelease<__CFString const*>::~CFAutoRelease(v12);
  _Unwind_Resume(a1);
}

_QWORD *info::IdentityInfo::IdentityInfo<DiskImageStackable>(_QWORD *a1, DiskImage *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  CFTypeRef *v6;
  uint64_t identifier;
  uint64_t v8;
  uint64_t v9;
  const __CFAllocator *v10;
  CFStringRef v11;
  const __CFString *v13;
  const __CFUUID *v14;
  CFUUIDBytes v15;

  *a1 = off_24CEFA948;
  v4 = *((_QWORD *)a2 + 1);
  *a1 = v4;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v4 - 24)) = *((_QWORD *)a2 + 2);
  v5 = *(_QWORD *)a2;
  *a1 = *(_QWORD *)a2;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v5 - 24)) = *((_QWORD *)a2 + 3);
  a1[1] = 0;
  a1[2] = 0;
  v6 = (CFTypeRef *)(a1 + 1);
  a1[3] = 0;
  identifier = di_stackable::get_identifier(*(di_stackable **)(*(_QWORD *)(a3 + 16) + 24), a2);
  v9 = v8;
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  *(_QWORD *)&v15.byte0 = identifier;
  *(_QWORD *)&v15.byte8 = v9;
  v14 = CFUUIDCreateFromUUIDBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], v15);
  v11 = CFUUIDCreateString(v10, v14);
  v13 = v11;
  if (*v6)
  {
    CFRelease(*v6);
    v11 = v13;
  }
  a1[1] = v11;
  v13 = 0;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)&v13);
  CFAutoRelease<__CFUUID const*>::~CFAutoRelease((const void **)&v14);
  return a1;
}

void sub_212FD1764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  uint64_t v10;
  const void **v11;

  CFAutoRelease<__CFString const*>::~CFAutoRelease(&a9);
  CFAutoRelease<__CFUUID const*>::~CFAutoRelease(&a10);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)(v10 + 24));
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)(v10 + 16));
  CFAutoRelease<__CFString const*>::~CFAutoRelease(v11);
  _Unwind_Resume(a1);
}

void info::DiskImageStackableInfo::~DiskImageStackableInfo(info::DiskImageStackableInfo *this)
{
  *(_QWORD *)this = &off_24CF14478;
  *((_QWORD *)this + 3) = &unk_24CF144C0;
  *((_QWORD *)this + 4) = &unk_24CF14508;
  *((_QWORD *)this + 5) = &unk_24CF14550;
  *((_QWORD *)this + 6) = &unk_24CF14598;
  *((_QWORD *)this + 7) = &unk_24CF145E0;
  *((_QWORD *)this + 8) = &unk_24CF14628;
  *((_QWORD *)this + 9) = &unk_24CF14688;
  *((_QWORD *)this + 17) = &unk_24CF146F8;
  *((_QWORD *)this + 21) = &unk_24CF14768;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 2);
  CFAutoRelease<__CFArray const*>::~CFAutoRelease((const void **)this + 1);
  *((_QWORD *)this + 21) = &off_24CF14FF8;
  *((_QWORD *)this + 8) = &off_24CF15050;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 24);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 23);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 22);
  *((_QWORD *)this + 17) = &off_24CF14EB0;
  *((_QWORD *)this + 5) = &off_24CF14F08;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 20);
}

{
  *(_QWORD *)this = &off_24CF14478;
  *((_QWORD *)this + 3) = &unk_24CF144C0;
  *((_QWORD *)this + 4) = &unk_24CF14508;
  *((_QWORD *)this + 5) = &unk_24CF14550;
  *((_QWORD *)this + 6) = &unk_24CF14598;
  *((_QWORD *)this + 7) = &unk_24CF145E0;
  *((_QWORD *)this + 8) = &unk_24CF14628;
  *((_QWORD *)this + 9) = &unk_24CF14688;
  *((_QWORD *)this + 17) = &unk_24CF146F8;
  *((_QWORD *)this + 21) = &unk_24CF14768;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 2);
  CFAutoRelease<__CFArray const*>::~CFAutoRelease((const void **)this + 1);
  *((_QWORD *)this + 21) = &off_24CF14FF8;
  *((_QWORD *)this + 8) = &off_24CF15050;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 24);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 23);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 22);
  *((_QWORD *)this + 17) = &off_24CF14EB0;
  *((_QWORD *)this + 5) = &off_24CF14F08;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)this + 20);
  JUMPOUT(0x2199A8A18);
}

const void **info::DiskImageStackableInfo::serialize_to_dict@<X0>(CFArrayRef *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  CFNumberRef v5;
  CFArrayRef v6;
  uint64_t i;
  const void *v9;
  uint64_t v10[2];
  const void *v11;
  CFIndex valuePtr;
  _QWORD v13[15];

  v13[14] = *MEMORY[0x24BDAC8D0];
  v4 = (*((uint64_t (**)(CFArrayRef *))*this + 3))(this);
  v13[0] = CFSTR("Image Format");
  v13[1] = v4;
  v13[2] = CFSTR("Format Description");
  v13[3] = CFSTR("Stackable image");
  info::SizeInfo::serialize_to_dict((info::SizeInfo *)((char *)this + *((_QWORD *)*this - 14)), &valuePtr);
  v13[4] = CFSTR("Size Info");
  v13[5] = valuePtr;
  valuePtr = 0;
  CFAutoRelease<__CFDictionary const*>::~CFAutoRelease((const void **)&valuePtr);
  info::EncryptionInfo::serialize_to_dict((info::EncryptionInfo *)((char *)this + *((_QWORD *)*this - 15)), &valuePtr);
  v13[6] = CFSTR("Encryption Info");
  v13[7] = valuePtr;
  valuePtr = 0;
  CFAutoRelease<__CFDictionary const*>::~CFAutoRelease((const void **)&valuePtr);
  info::IdentityInfo::serialize_to_dict((info::IdentityInfo *)((char *)this + *((_QWORD *)*this - 16)), &valuePtr);
  v13[8] = CFSTR("Identity Info");
  v13[9] = valuePtr;
  valuePtr = 0;
  CFAutoRelease<__CFDictionary const*>::~CFAutoRelease((const void **)&valuePtr);
  valuePtr = CFArrayGetCount(this[1]);
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberLongType, &valuePtr);
  v13[10] = CFSTR("Images Count");
  v13[11] = v5;
  v9 = 0;
  v6 = this[1];
  v13[12] = CFSTR("Stack Info");
  v13[13] = v6;
  if (v6)
    CFRetain(v6);
  v10[0] = (uint64_t)v13;
  v10[1] = 7;
  cf::create_dict_from_list(v10, (CFMutableDictionaryRef *)&v11);
  *a2 = v11;
  v11 = 0;
  CFAutoRelease<__CFDictionary *>::~CFAutoRelease(&v11);
  for (i = 13; i != -1; i -= 2)
    CFAutoRelease<void const*>::~CFAutoRelease((const void **)&v13[i]);
  return CFAutoRelease<__CFNumber const*>::~CFAutoRelease(&v9);
}

void sub_212FD1B10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  const void **v14;

  CFAutoRelease<__CFNumber const*>::~CFAutoRelease(&a9);
  do
  {
    CFAutoRelease<void const*>::~CFAutoRelease(v14 - 1);
    v14 -= 2;
  }
  while (v14 != (const void **)&a14);
  _Unwind_Resume(a1);
}

const __CFString *info::DiskImageStackableInfo::get_category(info::DiskImageStackableInfo *this)
{
  return CFSTR("STCK");
}

void `virtual thunk to'info::DiskImageStackableInfo::~DiskImageStackableInfo(info::DiskImageStackableInfo *this)
{
  char *v1;

  v1 = (char *)this + *(_QWORD *)(*(_QWORD *)this - 24);
  *(_QWORD *)v1 = &off_24CF14478;
  *((_QWORD *)v1 + 3) = &unk_24CF144C0;
  *((_QWORD *)v1 + 4) = &unk_24CF14508;
  *((_QWORD *)v1 + 5) = &unk_24CF14550;
  *((_QWORD *)v1 + 6) = &unk_24CF14598;
  *((_QWORD *)v1 + 7) = &unk_24CF145E0;
  *((_QWORD *)v1 + 8) = &unk_24CF14628;
  *((_QWORD *)v1 + 9) = &unk_24CF14688;
  *((_QWORD *)v1 + 17) = &unk_24CF146F8;
  *((_QWORD *)v1 + 21) = &unk_24CF14768;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 2);
  CFAutoRelease<__CFArray const*>::~CFAutoRelease((const void **)v1 + 1);
  *((_QWORD *)v1 + 21) = &off_24CF14FF8;
  *((_QWORD *)v1 + 8) = &off_24CF15050;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 24);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 23);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 22);
  *((_QWORD *)v1 + 17) = &off_24CF14EB0;
  *((_QWORD *)v1 + 5) = &off_24CF14F08;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 20);
}

{
  char *v1;

  v1 = (char *)this + *(_QWORD *)(*(_QWORD *)this - 24);
  *(_QWORD *)v1 = &off_24CF14478;
  *((_QWORD *)v1 + 3) = &unk_24CF144C0;
  *((_QWORD *)v1 + 4) = &unk_24CF14508;
  *((_QWORD *)v1 + 5) = &unk_24CF14550;
  *((_QWORD *)v1 + 6) = &unk_24CF14598;
  *((_QWORD *)v1 + 7) = &unk_24CF145E0;
  *((_QWORD *)v1 + 8) = &unk_24CF14628;
  *((_QWORD *)v1 + 9) = &unk_24CF14688;
  *((_QWORD *)v1 + 17) = &unk_24CF146F8;
  *((_QWORD *)v1 + 21) = &unk_24CF14768;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 2);
  CFAutoRelease<__CFArray const*>::~CFAutoRelease((const void **)v1 + 1);
  *((_QWORD *)v1 + 21) = &off_24CF14FF8;
  *((_QWORD *)v1 + 8) = &off_24CF15050;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 24);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 23);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 22);
  *((_QWORD *)v1 + 17) = &off_24CF14EB0;
  *((_QWORD *)v1 + 5) = &off_24CF14F08;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 20);
  JUMPOUT(0x2199A8A18);
}

{
  char *v1;

  v1 = (char *)this + *(_QWORD *)(*(_QWORD *)this - 32);
  *(_QWORD *)v1 = &off_24CF14478;
  *((_QWORD *)v1 + 3) = &unk_24CF144C0;
  *((_QWORD *)v1 + 4) = &unk_24CF14508;
  *((_QWORD *)v1 + 5) = &unk_24CF14550;
  *((_QWORD *)v1 + 6) = &unk_24CF14598;
  *((_QWORD *)v1 + 7) = &unk_24CF145E0;
  *((_QWORD *)v1 + 8) = &unk_24CF14628;
  *((_QWORD *)v1 + 9) = &unk_24CF14688;
  *((_QWORD *)v1 + 17) = &unk_24CF146F8;
  *((_QWORD *)v1 + 21) = &unk_24CF14768;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 2);
  CFAutoRelease<__CFArray const*>::~CFAutoRelease((const void **)v1 + 1);
  *((_QWORD *)v1 + 21) = &off_24CF14FF8;
  *((_QWORD *)v1 + 8) = &off_24CF15050;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 24);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 23);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 22);
  *((_QWORD *)v1 + 17) = &off_24CF14EB0;
  *((_QWORD *)v1 + 5) = &off_24CF14F08;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 20);
}

{
  char *v1;

  v1 = (char *)this + *(_QWORD *)(*(_QWORD *)this - 32);
  *(_QWORD *)v1 = &off_24CF14478;
  *((_QWORD *)v1 + 3) = &unk_24CF144C0;
  *((_QWORD *)v1 + 4) = &unk_24CF14508;
  *((_QWORD *)v1 + 5) = &unk_24CF14550;
  *((_QWORD *)v1 + 6) = &unk_24CF14598;
  *((_QWORD *)v1 + 7) = &unk_24CF145E0;
  *((_QWORD *)v1 + 8) = &unk_24CF14628;
  *((_QWORD *)v1 + 9) = &unk_24CF14688;
  *((_QWORD *)v1 + 17) = &unk_24CF146F8;
  *((_QWORD *)v1 + 21) = &unk_24CF14768;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 2);
  CFAutoRelease<__CFArray const*>::~CFAutoRelease((const void **)v1 + 1);
  *((_QWORD *)v1 + 21) = &off_24CF14FF8;
  *((_QWORD *)v1 + 8) = &off_24CF15050;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 24);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 23);
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 22);
  *((_QWORD *)v1 + 17) = &off_24CF14EB0;
  *((_QWORD *)v1 + 5) = &off_24CF14F08;
  CFAutoRelease<__CFString const*>::~CFAutoRelease((const void **)v1 + 20);
  JUMPOUT(0x2199A8A18);
}

const void **`virtual thunk to'info::DiskImageStackableInfo::serialize_to_dict@<X0>(info::DiskImageStackableInfo *this@<X0>, _QWORD *a2@<X8>)
{
  return info::DiskImageStackableInfo::serialize_to_dict((CFArrayRef *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 40)), a2);
}

const __CFString *`virtual thunk to'info::DiskImageStackableInfo::get_category(info::DiskImageStackableInfo *this)
{
  return CFSTR("STCK");
}

void KnoxbackendData::KnoxbackendData(std::string *this, __int128 *a2, std::string::size_type a3, std::string::size_type *a4, std::string::size_type a5)
{
  __int128 v10;
  std::string::size_type v11;
  unint64_t *v12;
  unint64_t v13;
  int v14;
  std::string::value_type *v15;
  uint64_t v16;
  std::string::size_type v17;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v10 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v10;
  }
  v11 = a4[1];
  this[1].__r_.__value_.__l.__size_ = *a4;
  this[1].__r_.__value_.__r.__words[0] = a3;
  this[1].__r_.__value_.__r.__words[2] = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  v14 = *((char *)a2 + 23);
  if (v14 >= 0)
    v15 = (std::string::value_type *)a2;
  else
    v15 = *(std::string::value_type **)a2;
  if (v14 >= 0)
    v16 = *((unsigned __int8 *)a2 + 23);
  else
    v16 = *((_QWORD *)a2 + 1);
  this[2].__r_.__value_.__r.__words[0] = di_utils::buffer_to_uuid((di_utils *)v15, v16);
  this[2].__r_.__value_.__l.__size_ = v17;
  this[2].__r_.__value_.__r.__words[2] = a5;
}

void sub_212FD1F88(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(a1);
}

void Knoxbackend::KnoxCreateStreams(uint64_t a1, char *a2, uint64_t a3, uint8_t **a4)
{
  char *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  __int128 v10;
  AAByteStream v11;
  AEAContext v12;
  AAByteStream v13;

  if (a2[23] >= 0)
    v6 = a2;
  else
    v6 = *(char **)a2;
  *(_QWORD *)&v10 = AAS3DownloadStreamOpen(v6, 0, 0, 0);
  AEAwrapper::ByteStream::ByteStream(&v13, &v10);
  AEAwrapper::Context::Context((AEAwrapper::Context *)&v12, (AEAwrapper::ByteStream *)&v13);
  AEAwrapper::Context::setSymmetricKey(&v12, *a4, 0x20uLL);
  AEAwrapper::ByteStream::make_DecryptionRandomAccessInputStream(&v13, &v12, 0xFFFFFFFFFFFFFFFFLL, 0x4000000000000000uLL, 0, (uint64_t *)&v11);
  std::allocate_shared[abi:ne180100]<AEAwrapper::DecryptionStream,std::allocator<AEAwrapper::DecryptionStream>,AEAwrapper::ByteStream,AEAwrapper::Context,AEAwrapper::ByteStream,void>(&v13, (uint64_t *)&v12, &v11, &v10);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100](a1 + 40, &v10);
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
  if (*((_QWORD *)&v10 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  AEAwrapper::ByteStream::~ByteStream(&v11);
  AEAwrapper::Context::~Context(&v12);
  AEAwrapper::ByteStream::~ByteStream(&v13);
}

void sub_212FD20B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  AAByteStream v4;
  va_list va;
  AEAContext v6;
  va_list va1;
  va_list va2;

  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, AAByteStream);
  va_copy(va2, va1);
  v6 = va_arg(va2, AEAContext);
  AEAwrapper::ByteStream::~ByteStream((AAByteStream *)va);
  AEAwrapper::Context::~Context((AEAContext *)va1);
  AEAwrapper::ByteStream::~ByteStream((AAByteStream *)va2);
  _Unwind_Resume(a1);
}

Backend *Knoxbackend::Knoxbackend(Backend *a1, char **a2, uint64_t a3, std::string::size_type *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  AEAContext **v10;
  char *v11;
  uint8_t *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  __int128 *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::string::size_type CompressionBlockSize;
  std::string::size_type RawSize;
  __int128 v24;
  uint8_t *v25[2];

  Backend::Backend(a1);
  *(_OWORD *)(v8 + 24) = 0u;
  v9 = v8 + 24;
  *(_OWORD *)(v8 + 40) = 0u;
  v10 = (AEAContext **)(v8 + 40);
  *(_QWORD *)v8 = &off_24CF15180;
  v11 = *a2;
  v12 = (uint8_t *)a4[1];
  v25[0] = (uint8_t *)*a4;
  v25[1] = v12;
  if (v12)
  {
    v13 = (unint64_t *)(v12 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  Knoxbackend::KnoxCreateStreams((uint64_t)a1, v11, v7, v25);
  if (v12)
  {
    v15 = (unint64_t *)(v12 + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      (*(void (**)(uint8_t *))(*(_QWORD *)v12 + 16))(v12);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v12);
    }
  }
  v17 = (__int128 *)*a2;
  RawSize = AEAwrapper::DecryptionStream::getRawSize(*v10);
  CompressionBlockSize = AEAwrapper::DecryptionStream::getCompressionBlockSize(*v10);
  std::allocate_shared[abi:ne180100]<KnoxbackendData,std::allocator<KnoxbackendData>,std::string &,unsigned long long,std::shared_ptr<unsigned char> const&,unsigned long,void>(v17, &RawSize, a4, &CompressionBlockSize, &v24);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100](v9, &v24);
  v18 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
  if (*((_QWORD *)&v24 + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  return a1;
}

void sub_212FD222C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  std::__shared_weak_count *v5;

  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v3);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v2);
  v5 = *(std::__shared_weak_count **)(v1 + 16);
  if (v5)
    std::__shared_weak_count::__release_weak(v5);
  _Unwind_Resume(a1);
}

ssize_t Knoxbackend::read(uint64_t a1, uint64_t a2)
{
  return AEAwrapper::DecryptionStream::pread(*(AAByteStream **)(a1 + 40), *(void **)a2, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

void Knoxbackend::~Knoxbackend(Knoxbackend *this)
{
  Knoxbackend::~Knoxbackend(this);
  JUMPOUT(0x2199A8A18);
}

{
  std::__shared_weak_count *v2;

  *(_QWORD *)this = &off_24CF15180;
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 40);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

uint64_t Knoxbackend::flush()
{
  return 4294967251;
}

uint64_t Knoxbackend::get_size(Knoxbackend *this)
{
  return *(_QWORD *)(*((_QWORD *)this + 3) + 24);
}

uint64_t Knoxbackend::is_writable(Knoxbackend *this)
{
  return 0;
}

uint64_t Knoxbackend::truncate(Knoxbackend *this)
{
  return 4294967251;
}

_QWORD *Knoxbackend::name(uint64_t a1, _QWORD *a2)
{
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"knox", 4);
}

double Knoxbackend::getContext@<D0>(Knoxbackend *this@<X0>, _OWORD *a2@<X8>)
{
  double result;
  double v4[3];

  std::allocate_shared[abi:ne180100]<Knoxbackend,std::allocator<Knoxbackend>,Knoxbackend&,void>(this, v4);
  result = v4[0];
  *a2 = *(_OWORD *)v4;
  return result;
}

uint64_t Knoxbackend::write()
{
  return 4294967251;
}

uint64_t Knoxbackend::get_identifier(Knoxbackend *this)
{
  return *(_QWORD *)(*((_QWORD *)this + 3) + 48);
}

void std::allocate_shared[abi:ne180100]<Knoxbackend,std::allocator<Knoxbackend>,Knoxbackend&,void>(const Knoxbackend *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;

  v4 = operator new(0x50uLL);
  std::__shared_ptr_emplace<Knoxbackend>::__shared_ptr_emplace[abi:ne180100]<Knoxbackend&,std::allocator<Knoxbackend>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  std::shared_ptr<PurgeableFileBackend>::__enable_weak_this[abi:ne180100]<Backend,PurgeableFileBackend,void>((uint64_t)a2, v4 + 4, (uint64_t)(v4 + 3));
}

void sub_212FD23D0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<Knoxbackend>::__shared_ptr_emplace[abi:ne180100]<Knoxbackend&,std::allocator<Knoxbackend>,0>(_QWORD *a1, const Knoxbackend *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24CEEF760;
  Knoxbackend::Knoxbackend((Knoxbackend *)(a1 + 3), a2);
  return a1;
}

void sub_212FD2418(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void Knoxbackend::Knoxbackend(Knoxbackend *this, const Knoxbackend *a2)
{
  _QWORD *v3;
  _QWORD *v4;

  Backend::Backend((Backend *)this);
  *v3 = &off_24CF15180;
  *(_OWORD *)(v3 + 5) = 0u;
  v4 = v3 + 5;
  *(_OWORD *)(v3 + 3) = 0u;
  std::shared_ptr<DiskImage>::operator=[abi:ne180100](v3 + 3, (uint64_t *)a2 + 3);
  std::shared_ptr<DiskImage>::operator=[abi:ne180100](v4, (uint64_t *)a2 + 5);
}

std::string *std::allocate_shared[abi:ne180100]<KnoxbackendData,std::allocator<KnoxbackendData>,std::string &,unsigned long long,std::shared_ptr<unsigned char> const&,unsigned long,void>@<X0>(__int128 *a1@<X1>, std::string::size_type *a2@<X2>, std::string::size_type *a3@<X3>, std::string::size_type *a4@<X4>, _QWORD *a5@<X8>)
{
  std::string *v10;
  std::string *result;

  v10 = (std::string *)operator new(0x60uLL);
  result = std::__shared_ptr_emplace<KnoxbackendData>::__shared_ptr_emplace[abi:ne180100]<std::string &,unsigned long long,std::shared_ptr<unsigned char> const&,unsigned long,std::allocator<KnoxbackendData>,0>(v10, a1, a2, a3, a4);
  *a5 = v10 + 1;
  a5[1] = v10;
  return result;
}

void sub_212FD24F0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

std::string *std::__shared_ptr_emplace<KnoxbackendData>::__shared_ptr_emplace[abi:ne180100]<std::string &,unsigned long long,std::shared_ptr<unsigned char> const&,unsigned long,std::allocator<KnoxbackendData>,0>(std::string *a1, __int128 *a2, std::string::size_type *a3, std::string::size_type *a4, std::string::size_type *a5)
{
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  a1->__r_.__value_.__r.__words[0] = (std::string::size_type)&off_24CF15258;
  KnoxbackendData::KnoxbackendData(a1 + 1, a2, *a3, a4, *a5);
  return a1;
}

void sub_212FD2540(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<KnoxbackendData>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24CF15258;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<KnoxbackendData>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24CF15258;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199A8A18);
}

void std::__shared_ptr_emplace<KnoxbackendData>::__on_zero_shared(uint64_t a1)
{
  std::__destroy_at[abi:ne180100]<KnoxbackendData,0>(a1 + 24);
}

void std::__destroy_at[abi:ne180100]<KnoxbackendData,0>(uint64_t a1)
{
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](a1 + 32);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

Backend *readSynchronizer::readSynchronizer(Backend *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t **v4;
  uint64_t *v5;
  unint64_t *v6;
  uint64_t (**resources)(system_properties::$_2 *__hidden);
  int v8;
  unsigned int v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  _QWORD *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  int v26;
  __int128 v27;

  BackendInternalBackend::BackendInternalBackend(a1, a2);
  *(_QWORD *)v3 = &off_24CF152A8;
  *(_OWORD *)(v3 + 40) = 0u;
  v4 = (uint64_t **)(v3 + 40);
  *(_OWORD *)(v3 + 56) = 0u;
  v5 = (uint64_t *)(v3 + 56);
  *(_QWORD *)(v3 + 72) = 0;
  v6 = (unint64_t *)(v3 + 72);
  resources = system_properties::get_resources((system_properties *)v3);
  v8 = *((_DWORD *)resources + 2);
  if (v8 == 1)
  {
    v9 = ((uint64_t (*)(void))*resources)();
  }
  else
  {
    if (v8)
      std::__throw_bad_variant_access[abi:ne180100]();
    v9 = *(_DWORD *)resources;
  }
  LODWORD(v25) = v9 + 1;
  v26 = 0;
  std::allocate_shared[abi:ne180100]<ref::Allocator<CurrentReader,unsigned long long>,std::allocator<ref::Allocator<CurrentReader,unsigned long long>>,unsigned int,int,void>((unsigned int *)&v25, &v26, &v27);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)v5, &v27);
  v10 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
  if (*((_QWORD *)&v27 + 1))
  {
    v11 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = (_QWORD *)operator new();
  std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>::vector(v13, v9);
  std::shared_ptr<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::shared_ptr[abi:ne180100]<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>,void>(&v27, (uint64_t)v13);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)v4, &v27);
  v14 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
  if (*((_QWORD *)&v27 + 1))
  {
    v15 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  ref::Allocator<CurrentReader,unsigned long long>::allocate(*v5, (ref::details **)0xFFFFFFFFFFFFFFFELL, 1, (unint64_t *)&v27);
  ref::tagged_ptr<CurrentReader,unsigned long long>::operator=(v6, (unint64_t *)&v27);
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v27);
  v27 = 0uLL;
  v25 = 0;
  ref::tagged_ptr<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char>,unsigned long long>((uint64_t *)v6, (uint64_t *)&v27, &v25);
  v17 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
  if (*((_QWORD *)&v27 + 1))
  {
    v18 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if ((*v4)[1] != **v4)
  {
    v20 = 0;
    do
    {
      *(_QWORD *)&v27 = 0;
      v21 = atomic_load(v6);
      atomic_store(v21, (unint64_t *)&v27);
      v22 = **v4;
      do
        v23 = __ldaxr((unint64_t *)&v27);
      while (__stlxr(0, (unint64_t *)&v27));
      atomic_store(v23, (unint64_t *)(v22 + 8 * v20++));
    }
    while (v20 < ((*v4)[1] - **v4) >> 3);
  }
  return a1;
}

void sub_212FD2818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  BackendInternalBackend *v4;
  uint64_t v5;
  unint64_t *v6;
  uint64_t v7;
  va_list va;

  va_start(va, a4);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)va);
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset(v6);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v7);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v5);
  BackendInternalBackend::~BackendInternalBackend(v4);
  _Unwind_Resume(a1);
}

unint64_t *ref::Allocator<CurrentReader,unsigned long long>::allocate@<X0>(uint64_t a1@<X0>, ref::details **a2@<X1>, int a3@<W2>, unint64_t *a4@<X8>)
{
  unint64_t v7;
  unint64_t *min;
  uint64_t *v9;
  char v10;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t *v16;
  ref::details **v17;

  v16 = 0;
  v17 = a2;
  ref::Allocator<CurrentReader,unsigned long long>::add_tag(a1, a2, a3, &v14);
  if (v14 && !*(_BYTE *)(v14 + 312) || v14 && *(_BYTE *)(v14 + 312))
  {
    *a4 = 0;
    do
      v7 = __ldaxr(&v14);
    while (__stlxr(0, &v14));
LABEL_21:
    atomic_store(v7, a4);
    return ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&v14);
  }
  if (*(_BYTE *)(a1 + 704) && v15 != (_QWORD *)(a1 + 728))
  {
    do
    {
      ref::Allocator<CurrentReader,unsigned long long>::allocate_from_empty_pool(a1, (uint64_t)a2, &v12);
      v16 = v12;
      ref::tagged_ptr<CurrentReader,unsigned long long>::operator=(&v14, &v13);
      ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&v13);
      if (v14)
      {
        if (!*(_BYTE *)(v14 + 312))
          break;
      }
      min = (unint64_t *)ref::Allocator<CurrentReader,unsigned long long>::extract_min((_QWORD *)a1);
      if (min)
      {
        v16 = min;
        ref::Allocator<CurrentReader,unsigned long long>::insert_elem(a1, min, (uint64_t)a2, (unint64_t *)&v12);
        ref::tagged_ptr<CurrentReader,unsigned long long>::operator=(&v14, (unint64_t *)&v12);
        ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v12);
        break;
      }
    }
    while (*(_BYTE *)(a1 + 704));
    std::mutex::lock((std::mutex *)(a1 + 744));
    v9 = std::__tree<std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *>>>::__emplace_hint_unique_key_args<unsigned long long,unsigned long long const&,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *&>((uint64_t **)(a1 + 720), v15, (unint64_t *)&v17, (uint64_t *)&v17, (uint64_t *)&v16);
    if (!v10)
      v9[5] = (uint64_t)v16;
    std::condition_variable::notify_all((std::condition_variable *)(a1 + 808));
    std::mutex::unlock((std::mutex *)(a1 + 744));
    ref::Allocator<CurrentReader,unsigned long long>::run_failed_dtors_list(a1, 0, 0, 0);
    *a4 = 0;
    do
      v7 = __ldaxr(&v14);
    while (__stlxr(0, &v14));
    goto LABEL_21;
  }
  *a4 = 0;
  return ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&v14);
}

void sub_212FD2A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)va);
  _Unwind_Resume(a1);
}

unint64_t *ref::tagged_ptr<CurrentReader,unsigned long long>::operator=(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  if (a2 != a1)
  {
    do
      v3 = __ldaxr(a2);
    while (__stlxr(0, a2));
    ref::tagged_ptr<CurrentReader,unsigned long long>::reset(a1);
    atomic_store(v3, a1);
  }
  return a1;
}

uint64_t ref::tagged_ptr<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char>,unsigned long long>(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  return ref::details::ctrl_blk<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char>,unsigned long long>(*a1, a2, a3);
}

void sub_212FD2AE0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t *v10;
  uint64_t v11;

  __cxa_begin_catch(a1);
  if (*v10)
  {
    v11 = *(_QWORD *)(*v10 + 256);
    if (v11)
    {
      a10 = *v10;
      (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v11 + 48))(v11, &a10, v10);
    }
  }
  __cxa_rethrow();
}

void sub_212FD2B14(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

unint64_t *readSynchronizer::get_reader_ptr@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  ref::details **v6;
  unint64_t **v7;
  unint64_t *v8;
  unint64_t *v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t **v12;
  unint64_t *v13;
  unint64_t *v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int v19;
  int v20;
  int v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = (ref::details **)a2[3];
  v7 = *(unint64_t ***)(a1 + 40);
  v8 = *v7;
  v9 = v7[1];
  while (v8 != v9)
  {
    ref::tagged_weak_ptr<CurrentReader,unsigned long long>::lock_if_tag(v8, (uint64_t)v6, (unint64_t *)&v26);
    if (v26 && !*(_BYTE *)(v26 + 312))
    {
      ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr((unint64_t *)&v24, (unint64_t *)&v26);
      v25 = -2;
      *(_QWORD *)a3 = 0;
      do
        v22 = __ldaxr((unint64_t *)&v24);
      while (__stlxr(0, (unint64_t *)&v24));
      atomic_store(v22, (unint64_t *)a3);
      *(_DWORD *)(a3 + 8) = v25;
      ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v24);
      return ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v26);
    }
    ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v26);
    ++v8;
  }
  ref::Allocator<CurrentReader,unsigned long long>::allocate(*(_QWORD *)(a1 + 56), v6, 1, (unint64_t *)&v26);
  if (!v26 || (v10 = atomic_load((unsigned int *)(v26 + 24)), v10 != 2))
  {
    v24 = a2[3];
    ref::tagged_ptr<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char> const&,unsigned long long>(&v26, a2, &v24);
    v12 = *(unint64_t ***)(a1 + 40);
    v13 = *v12;
    v14 = v12[1];
    if (*v12 == v14)
    {
      v15 = 0;
      goto LABEL_37;
    }
    v15 = 0;
    while (1)
    {
      v16 = atomic_load(v13);
      while (!v16 || *(_QWORD *)(v16 + 32) == -2)
      {
        v17 = atomic_load((unint64_t *)&v26);
        v18 = __ldaxr(v13);
        if (v18 != v16)
        {
          __clrex();
LABEL_20:
          v19 = 0;
          goto LABEL_21;
        }
        if (__stlxr(v17, v13))
          goto LABEL_20;
        v19 = 1;
LABEL_21:
        v16 = v18;
        if (v19)
        {
          ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr((unint64_t *)&v24, (unint64_t *)&v26);
          goto LABEL_24;
        }
      }
      v24 = 0;
      atomic_store(0, (unint64_t *)&v24);
LABEL_24:
      if (v24)
        v20 = *(unsigned __int8 *)(v24 + 312) == 0;
      else
        v20 = 0;
      if (v26)
        v21 = *(unsigned __int8 *)(v26 + 312) == 0;
      else
        v21 = 0;
      ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v24);
      if (v20 != v21)
      {
        ++v15;
        if (++v13 != v14)
          continue;
      }
LABEL_37:
      ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr((unint64_t *)a3, (unint64_t *)&v26);
      *(_DWORD *)(a3 + 8) = v15;
      return ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v26);
    }
  }
  ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr((unint64_t *)&v24, (unint64_t *)&v26);
  v25 = -2;
  *(_QWORD *)a3 = 0;
  do
    v11 = __ldaxr((unint64_t *)&v24);
  while (__stlxr(0, (unint64_t *)&v24));
  atomic_store(v11, (unint64_t *)a3);
  *(_DWORD *)(a3 + 8) = v25;
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v24);
  return ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v26);
}

void sub_212FD2D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)va);
  _Unwind_Resume(a1);
}

unint64_t *ref::tagged_weak_ptr<CurrentReader,unsigned long long>::lock_if_tag@<X0>(unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v4;
  unint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v4 = atomic_load(result);
  if (v4 && *(_QWORD *)(v4 + 32) == a2)
  {
    v6 = (unint64_t *)atomic_load(result);
    ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr(&v9, v6, 1);
    if (v9 && !*(_BYTE *)(v9 + 312))
    {
      v7 = *(_QWORD *)(v9 + 32);
      *a3 = 0;
      if (v7 == a2)
      {
        do
          v8 = __ldaxr(&v9);
        while (__stlxr(0, &v9));
        atomic_store(v8, a3);
      }
    }
    else
    {
      *a3 = 0;
    }
    return ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&v9);
  }
  else
  {
    *a3 = 0;
  }
  return result;
}

uint64_t ref::tagged_ptr<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char> const&,unsigned long long>(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  return ref::details::ctrl_blk<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char> const&,unsigned long long>(*a1, a2, a3);
}

void sub_212FD2EA0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t *v10;
  uint64_t v11;

  __cxa_begin_catch(a1);
  if (*v10)
  {
    v11 = *(_QWORD *)(*v10 + 256);
    if (v11)
    {
      a10 = *v10;
      (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v11 + 48))(v11, &a10, v10);
    }
  }
  __cxa_rethrow();
}

void sub_212FD2ED4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t readSynchronizer::try_copy(uint64_t a1, uint64_t *a2, int *a3, void **a4)
{
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v7;
  size_t v8;
  void *v9;
  uint64_t v10;
  const void *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  unsigned int v18;

  if (*(_BYTE *)(*a2 + 192))
    v4 = *a2 + 40;
  else
    v4 = 0;
  v5 = atomic_load((unsigned __int8 *)(v4 + 140));
  if ((v5 & 1) != 0)
  {
    v7 = *(_BYTE *)(*a2 + 192) ? *a2 + 40 : 0;
    v8 = atomic_load((unsigned int *)(v7 + 144));
    *a3 = v8;
    if ((v8 & 0x80000000) == 0)
    {
      v9 = *a4;
      if (*(_BYTE *)(*a2 + 192))
        v10 = *a2 + 40;
      else
        v10 = 0;
      v11 = *(const void **)v10;
      v12 = *(std::__shared_weak_count **)(v10 + 8);
      if (v12)
      {
        p_shared_owners = (unint64_t *)&v12->__shared_owners_;
        do
          v14 = __ldxr(p_shared_owners);
        while (__stxr(v14 + 1, p_shared_owners));
        memcpy(v9, v11, *a3);
        do
          v15 = __ldaxr(p_shared_owners);
        while (__stlxr(v15 - 1, p_shared_owners));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
          std::__shared_weak_count::__release_weak(v12);
        }
      }
      else
      {
        memcpy(v9, v11, v8);
      }
      v16 = *a2;
      if (*a2)
      {
        if (*(_BYTE *)(v16 + 192))
          v16 += 40;
        else
          v16 = 0;
      }
      v17 = (unsigned int *)(v16 + 136);
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
    }
  }
  return v5 & 1;
}

void readSynchronizer::try_notify(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  std::mutex *v4;
  uint64_t v5;
  uint64_t v7;

  v3 = *a2;
  if (*a2)
  {
    if (*(_BYTE *)(v3 + 192))
      v3 += 40;
    else
      v3 = 0;
  }
  v4 = (std::mutex *)(v3 + 72);
  std::mutex::lock((std::mutex *)(v3 + 72));
  if (*(_BYTE *)(*a2 + 192))
    v5 = *a2 + 40;
  else
    v5 = 0;
  if (atomic_load((unsigned int *)(v5 + 136)))
  {
    v7 = *a2;
    if (*a2)
    {
      if (*(_BYTE *)(v7 + 192))
        v7 += 40;
      else
        v7 = 0;
    }
    std::condition_variable::notify_all((std::condition_variable *)(v7 + 24));
  }
  std::mutex::unlock(v4);
}

uint64_t readSynchronizer::_read(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  std::mutex *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *a2;
  if (*a2)
  {
    if (*(_BYTE *)(v6 + 192))
      v6 += 40;
    else
      v6 = 0;
  }
  v7 = (std::mutex *)(v6 + 72);
  std::mutex::lock((std::mutex *)(v6 + 72));
  v8 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 88))(*(_QWORD *)(a1 + 24), a3);
  v9 = v8;
  if (*(_BYTE *)(*a2 + 192))
    v10 = *a2 + 40;
  else
    v10 = 0;
  atomic_store(v8, (unsigned int *)(v10 + 144));
  if (*(_BYTE *)(*a2 + 192))
    v11 = *a2 + 40;
  else
    v11 = 0;
  atomic_store(1u, (unsigned __int8 *)(v11 + 140));
  std::mutex::unlock(v7);
  return v9;
}

void sub_212FD3128(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t readSynchronizer::read(uint64_t a1, uint64_t *a2)
{
  uint64_t p_shared_owners;
  unint64_t *reader_ptr;
  unint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  void *v21;
  uint64_t v22;
  const void *v23;
  std::__shared_weak_count *v24;
  unint64_t v25;
  unint64_t v26;
  std::unique_lock<std::mutex> __lk;
  uint64_t v29;
  int v30;
  unsigned int v31;

  p_shared_owners = (uint64_t)a2;
  v31 = 0;
  reader_ptr = readSynchronizer::get_reader_ptr(a1, a2, (uint64_t)&v29);
  v5 = v30;
  if (v30 != -2)
  {
    v13 = readSynchronizer::_read(a1, &v29, p_shared_owners);
    v31 = v13;
    readSynchronizer::try_notify(v13, &v29);
    if (v5 < (uint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) - **(_QWORD **)(a1 + 40)) >> 3)
    {
      __lk.__m_ = 0;
      v14 = atomic_load((unint64_t *)(a1 + 72));
      atomic_store(v14, (unint64_t *)&__lk);
      v15 = **(_QWORD **)(a1 + 40);
      do
        v16 = __ldaxr((unint64_t *)&__lk);
      while (__stlxr(0, (unint64_t *)&__lk));
      atomic_store(v16, (unint64_t *)(v15 + 8 * v5));
    }
    if (v29)
    {
      v17 = *(_QWORD *)(v29 + 256);
      if (v17)
      {
        __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)v29;
        (*(void (**)(uint64_t, std::unique_lock<std::mutex> *, uint64_t *))(*(_QWORD *)v17 + 48))(v17, &__lk, &v29);
      }
    }
    goto LABEL_44;
  }
  v6 = v29;
  if (v29)
  {
    if (*(_BYTE *)(v29 + 192))
      v6 = v29 + 40;
    else
      v6 = 0;
  }
  v7 = (unsigned int *)(v6 + 136);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 + 1, v7));
  if (readSynchronizer::try_copy((uint64_t)reader_ptr, &v29, (int *)&v31, (void **)p_shared_owners))
    goto LABEL_44;
  v9 = v29;
  if (v29)
  {
    if (*(_BYTE *)(v29 + 192))
      v9 = v29 + 40;
    else
      v9 = 0;
  }
  __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(v9 + 72);
  __lk.__owns_ = 1;
  std::mutex::lock((std::mutex *)(v9 + 72));
  v11 = readSynchronizer::try_copy(v10, &v29, (int *)&v31, (void **)p_shared_owners);
  v12 = v11;
  if (v11)
  {
    p_shared_owners = v31;
  }
  else
  {
    v18 = v29;
    if (v29)
    {
      if (*(_BYTE *)(v29 + 192))
        v18 = v29 + 40;
      else
        v18 = 0;
    }
    std::condition_variable::wait((std::condition_variable *)(v18 + 24), &__lk);
    if (*(_BYTE *)(v29 + 192))
      v19 = v29 + 40;
    else
      v19 = 0;
    v20 = atomic_load((unsigned int *)(v19 + 144));
    v31 = v20;
    if ((int)v20 >= 1)
    {
      v21 = *(void **)p_shared_owners;
      if (*(_BYTE *)(v29 + 192))
        v22 = v29 + 40;
      else
        v22 = 0;
      v23 = *(const void **)v22;
      v24 = *(std::__shared_weak_count **)(v22 + 8);
      if (v24)
      {
        p_shared_owners = (uint64_t)&v24->__shared_owners_;
        do
          v25 = __ldxr((unint64_t *)p_shared_owners);
        while (__stxr(v25 + 1, (unint64_t *)p_shared_owners));
        memcpy(v21, v23, v20);
        do
          v26 = __ldaxr((unint64_t *)p_shared_owners);
        while (__stlxr(v26 - 1, (unint64_t *)p_shared_owners));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      else
      {
        memcpy(v21, v23, v20);
      }
    }
  }
  if (__lk.__owns_)
    std::mutex::unlock(__lk.__m_);
  if ((v12 & 1) == 0)
LABEL_44:
    p_shared_owners = v31;
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v29);
  return p_shared_owners;
}

void sub_212FD3378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10, char a11, int a12, unint64_t a13)
{
  if (a11)
    std::mutex::unlock(a10);
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&a13);
  _Unwind_Resume(a1);
}

double readSynchronizer::construct_context_from_inner@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, _OWORD *a3@<X8>)
{
  double result;
  double v5[3];

  std::allocate_shared[abi:ne180100]<readSynchronizer,std::allocator<readSynchronizer>,readSynchronizer&,std::shared_ptr<Backend> const&,void>(a1, a2, v5);
  result = v5[0];
  *a3 = *(_OWORD *)v5;
  return result;
}

void readSynchronizer::~readSynchronizer(readSynchronizer *this)
{
  readSynchronizer::~readSynchronizer(this);
  JUMPOUT(0x2199A8A18);
}

{
  std::__shared_weak_count *v2;

  *(_QWORD *)this = &off_24CF152A8;
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)this + 9);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 56);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 40);
  *(_QWORD *)this = off_24CF08AD0;
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)this + 24);
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  if (v2)
    std::__shared_weak_count::__release_weak(v2);
}

_QWORD *readSynchronizer::name(uint64_t a1, _QWORD *a2)
{
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"readSynchronizer", 16);
}

_QWORD *std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<io_rings_sqe_t const*>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_212FD3484(_Unwind_Exception *exception_object)
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

unint64_t *ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr(unint64_t *a1, unint64_t *a2)
{
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  *a1 = 0;
  v3 = (unint64_t *)atomic_load(a2);
  if (!v3)
    goto LABEL_9;
  v4 = atomic_load(v3);
  if (!v4)
    goto LABEL_8;
  while (1)
  {
    v5 = __ldaxr(v3);
    if (v5 != v4)
    {
      __clrex();
      goto LABEL_7;
    }
    if (!__stlxr(v4 + 1, v3))
      break;
LABEL_7:
    v4 = v5;
    if (!v5)
      goto LABEL_8;
  }
  v7 = (unint64_t *)v3[37];
  if (v7)
  {
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
    v3[38] = v8;
  }
  if (!ref::details::ctrl_blk<CurrentReader,unsigned long long>::wait_for_ready((uint64_t)v3))
  {
    do
      v9 = __ldaxr(v3);
    while (__stlxr(v9 - 1, v3));
    if (v9 == 1)
    {
      v10 = v3[4];
      v3[4] = -1;
      ref::details::ctrl_blk<CurrentReader,unsigned long long>::reset_val((uint64_t)v3, v10, 1u);
    }
LABEL_8:
    v3 = 0;
  }
LABEL_9:
  atomic_store((unint64_t)v3, a1);
  return a1;
}

BOOL ref::details::ctrl_blk<CurrentReader,unsigned long long>::wait_for_ready(uint64_t a1)
{
  unsigned int *v2;
  unsigned int v3;
  unint64_t v4;
  unint64_t *v6;
  unint64_t v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;

  v2 = (unsigned int *)(a1 + 24);
  v3 = atomic_load((unsigned int *)(a1 + 24));
  if (v3 == 2)
  {
    v4 = atomic_load((unint64_t *)a1);
    return v4 > 1;
  }
  else
  {
    v6 = (unint64_t *)(a1 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 + 1, v6));
    v8 = atomic_load(v2);
    if (v8 != 2 && !*(_BYTE *)(a1 + 312))
      std::__atomic_base<ref::details::ctrl_blk<CurrentReader,unsigned long long>::ready_state,false>::wait[abi:ne180100](a1 + 24, 1u, 5u);
    do
      v9 = __ldaxr(v6);
    while (__stlxr(v9 - 1, v6));
    v10 = atomic_load((unint64_t *)a1);
    if (v10 < 2)
    {
      return 0;
    }
    else
    {
      v11 = atomic_load(v2);
      return v11 == 2;
    }
  }
}

BOOL std::__atomic_base<ref::details::ctrl_blk<CurrentReader,unsigned long long>::ready_state,false>::wait[abi:ne180100](uint64_t a1, unsigned int a2, unsigned int a3)
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;

  *(_QWORD *)&v4 = a1;
  *((_QWORD *)&v4 + 1) = __PAIR64__(a3, a2);
  v5 = a1;
  v6 = v4;
  return std::__libcpp_thread_poll_with_backoff[abi:ne180100]<std::__cxx_atomic_wait_test_fn_impl<std::__cxx_atomic_impl<ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state,std::__cxx_atomic_base_impl<ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state>>,ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state> &,std::__libcpp_atomic_wait_backoff_impl<std::__cxx_atomic_impl<ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state,std::__cxx_atomic_base_impl<ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state>>,std::__cxx_atomic_wait_test_fn_impl<std::__cxx_atomic_impl<ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state,std::__cxx_atomic_base_impl<ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state>>,ref::details::ctrl_blk<di_asif::details::map_element,unsigned long long>::ready_state>> &>((uint64_t)&v4, (uint64_t)&v5, 0);
}

uint64_t ref::details::ctrl_blk<CurrentReader,unsigned long long>::reset_val(uint64_t a1, uint64_t a2, unsigned int a3)
{
  char v3;
  unsigned int v6;
  uint64_t v7;
  int v8;
  __int128 v10;
  int v11;
  _QWORD v12[45];
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  if (*(_BYTE *)(a1 + 312)
    || (v6 = atomic_load((unsigned int *)(a1 + 24)), v6 != 2)
    || !*(_BYTE *)(a1 + 192)
    || (v7 = *(_QWORD *)(a1 + 288)) == 0)
  {
    v8 = (a3 >> 1) & 2;
    goto LABEL_11;
  }
  v8 = (a3 >> 1) & 2;
  if (!(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)v7 + 48))(v7, a1 + 40))
  {
LABEL_11:
    atomic_store(0, (unsigned int *)(a1 + 24));
    std::__optional_destruct_base<CurrentReader,false>::reset[abi:ne180100](a1 + 40);
    std::function<void ()(ref::details::ctrl_blk<di_asif::details::table,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::operator()(a1 + 200, a1, a2, v8);
    MEMORY[0x2199A88E0](a1 + 24);
    return 1;
  }
  if ((v3 & 2) != 0)
  {
    *(_QWORD *)&v10 = "ref::details::ctrl_blk<CurrentReader, unsigned long long>::reset_val(tag_t, details::reset_val_option_set) [T = CurrentReader, tag_t = unsigned long long]";
    *((_QWORD *)&v10 + 1) = 68;
    v11 = 16;
    di_log::logger<di_log::log_printer<210ul>>::logger(v12, &v10);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v13, (uint64_t)"Got error when trying to close ", 31);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v13, (uint64_t)" with ret ", 10);
    std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v13, (uint64_t)", Force closing.", 16);
    std::ostream::~ostream();
    di_log::logger_buf<di_log::log_printer<210ul>>::~logger_buf((uint64_t)v12);
    MEMORY[0x2199A89AC](&v14);
    goto LABEL_11;
  }
  if ((v3 & 1) != 0)
    std::function<void ()(ref::details::ctrl_blk<di_asif::details::table,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::operator()(a1 + 200, a1, a2, v8 | 1);
  return 0;
}

void sub_212FD37FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  di_log::logger<di_log::log_printer<210ul>>::~logger((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__optional_destruct_base<CurrentReader,false>::reset[abi:ne180100](uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(result + 152))
  {
    v1 = result;
    std::mutex::~mutex((std::mutex *)(result + 72));
    std::condition_variable::~condition_variable((std::condition_variable *)(v1 + 24));
    result = std::shared_ptr<char>::~shared_ptr[abi:ne180100](v1);
    *(_BYTE *)(v1 + 152) = 0;
  }
  return result;
}

unint64_t *ref::tagged_ptr<CurrentReader,unsigned long long>::reset(unint64_t *a1)
{
  unint64_t *result;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  do
    result = (unint64_t *)__ldaxr(a1);
  while (__stlxr(0, a1));
  if (result)
  {
    do
    {
      v3 = __ldaxr(result);
      v4 = v3 - 1;
    }
    while (__stlxr(v4, result));
    if (!v4)
    {
      v5 = result[4];
      result[4] = -1;
      return (unint64_t *)ref::details::ctrl_blk<CurrentReader,unsigned long long>::reset_val((uint64_t)result, v5, 1u);
    }
  }
  return result;
}

_QWORD *std::allocate_shared[abi:ne180100]<ref::Allocator<CurrentReader,unsigned long long>,std::allocator<ref::Allocator<CurrentReader,unsigned long long>>,unsigned int,int,void>@<X0>(unsigned int *a1@<X1>, int *a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0x580uLL);
  result = std::__shared_ptr_emplace<ref::Allocator<CurrentReader,unsigned long long>>::__shared_ptr_emplace[abi:ne180100]<unsigned int,int,std::allocator<ref::Allocator<CurrentReader,unsigned long long>>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_212FD3944(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<ref::Allocator<CurrentReader,unsigned long long>>::__shared_ptr_emplace[abi:ne180100]<unsigned int,int,std::allocator<ref::Allocator<CurrentReader,unsigned long long>>,0>(_QWORD *a1, unsigned int *a2, int *a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24CF15388;
  std::construct_at[abi:ne180100]<ref::Allocator<CurrentReader,unsigned long long>,unsigned int,int,ref::Allocator<CurrentReader,unsigned long long>*>((uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_212FD398C(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<ref::Allocator<CurrentReader,unsigned long long>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24CF15388;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ref::Allocator<CurrentReader,unsigned long long>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24CF15388;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199A8A18);
}

_QWORD *std::__shared_ptr_emplace<ref::Allocator<CurrentReader,unsigned long long>>::__on_zero_shared(uint64_t a1)
{
  return ref::Allocator<CurrentReader,unsigned long long>::~Allocator(a1 + 24);
}

uint64_t std::construct_at[abi:ne180100]<ref::Allocator<CurrentReader,unsigned long long>,unsigned int,int,ref::Allocator<CurrentReader,unsigned long long>*>(uint64_t a1, unsigned int *a2, int *a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _BYTE v9[24];
  _BYTE *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = *a2;
  v5 = *a3;
  v10 = 0;
  ref::Allocator<CurrentReader,unsigned long long>::Allocator(a1, v4, v5, (uint64_t)v9);
  v6 = v10;
  if (v10 == v9)
  {
    v7 = 4;
    v6 = v9;
    goto LABEL_5;
  }
  if (v10)
  {
    v7 = 5;
LABEL_5:
    (*(void (**)(void))(*v6 + 8 * v7))();
  }
  return a1;
}

void sub_212FD3A84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13)
{
  char *v13;
  char *v15;
  uint64_t v16;

  v15 = a13;
  if (a13 == v13)
  {
    v16 = 4;
    v15 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v16 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v15 + 8 * v16))();
LABEL_6:
  _Unwind_Resume(exception_object);
}

uint64_t ref::Allocator<CurrentReader,unsigned long long>::Allocator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  dispatch_object_t *v15;
  uint64_t v16;

  v8 = ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::error_ctrl_blk_t(a1);
  *(_QWORD *)(v8 + 424) = a2;
  *(_QWORD *)(v8 + 432) = a3;
  v9 = (_QWORD *)(v8 + 440);
  *(_OWORD *)(v8 + 440) = 0u;
  *(_OWORD *)(v8 + 456) = 0u;
  *(_OWORD *)(v8 + 472) = 0u;
  *(_QWORD *)(v8 + 488) = 850045863;
  *(_OWORD *)(v8 + 496) = 0u;
  *(_OWORD *)(v8 + 512) = 0u;
  *(_OWORD *)(v8 + 528) = 0u;
  *(_QWORD *)(v8 + 544) = 0;
  *(_OWORD *)(v8 + 560) = 0u;
  *(_OWORD *)(v8 + 576) = 0u;
  *(_QWORD *)(v8 + 592) = 850045863;
  *(_OWORD *)(v8 + 600) = 0u;
  *(_OWORD *)(v8 + 616) = 0u;
  *(_OWORD *)(v8 + 632) = 0u;
  *(_QWORD *)(v8 + 648) = 0;
  *(_QWORD *)(v8 + 656) = 1018212795;
  *(_QWORD *)(v8 + 696) = 0;
  *(_OWORD *)(v8 + 680) = 0u;
  *(_BYTE *)(v8 + 704) = 1;
  *(_OWORD *)(v8 + 664) = 0u;
  v15 = (dispatch_object_t *)(v8 + 712);
  gcd::gcd_queue::gcd_queue(v8 + 712, "dealloc_queue", 2);
  *(_QWORD *)(a1 + 736) = 0;
  *(_QWORD *)(a1 + 728) = 0;
  *(_QWORD *)(a1 + 720) = a1 + 728;
  *(_QWORD *)(a1 + 744) = 850045863;
  *(_OWORD *)(a1 + 752) = 0u;
  *(_OWORD *)(a1 + 768) = 0u;
  *(_OWORD *)(a1 + 784) = 0u;
  *(_QWORD *)(a1 + 800) = 0;
  *(_QWORD *)(a1 + 808) = 1018212795;
  *(_OWORD *)(a1 + 816) = 0u;
  *(_OWORD *)(a1 + 832) = 0u;
  *(_QWORD *)(a1 + 848) = 0;
  *(_QWORD *)(a1 + 856) = 850045863;
  *(_OWORD *)(a1 + 864) = 0u;
  *(_OWORD *)(a1 + 880) = 0u;
  *(_OWORD *)(a1 + 896) = 0u;
  *(_QWORD *)(a1 + 912) = 0;
  *(_QWORD *)(a1 + 920) = a1 + 920;
  *(_QWORD *)(a1 + 928) = a1 + 920;
  *(_QWORD *)(a1 + 936) = 0;
  std::__function::__value_func<diskimage_uio::expected_ns::std::experimental::fundamentals_v3::expected<std::unique_ptr<DiskImage::Context>,std::error_code> ()(void)>::__value_func[abi:ne180100](a1 + 944, a4);
  ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(a1 + 976, a1);
  *(_QWORD *)(a1 + 1320) = &off_24CF15688;
  *(_QWORD *)(a1 + 1328) = a1;
  *(_QWORD *)(a1 + 1344) = a1 + 1320;
  *(_QWORD *)(a1 + 1352) = &off_24CF15718;
  *(_QWORD *)(a1 + 1360) = a1;
  *(_QWORD *)(a1 + 1376) = a1 + 1352;
  v10 = (void *)operator new[]();
  v11 = v10;
  if (a2)
    bzero(v10, 8 * a2);
  *(_QWORD *)(a1 + 552) = v11;
  gcd::gcd_queue::set_target_priority(v15, 3);
  if (a2)
  {
    v12 = 0;
    do
    {
      v13 = operator new();
      ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(v13, a1);
      v16 = v13;
      std::deque<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>>::emplace_back<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>(v9, &v16);
      atomic_store(0, (unint64_t *)(*(_QWORD *)(a1 + 552) + 8 * v12++));
    }
    while (a2 != v12);
  }
  return a1;
}

void sub_212FD3CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD **a10, std::condition_variable *a11, _QWORD *a12, NSObject **a13)
{
  uint64_t v13;
  _QWORD *v14;
  std::mutex *v15;
  _QWORD *v16;
  _QWORD *v18;
  uint64_t v19;

  v18 = *(_QWORD **)(v13 + 968);
  if (v18 == a12)
  {
    v19 = 4;
    v18 = a12;
  }
  else
  {
    if (!v18)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*v18 + 8 * v19))();
LABEL_6:
  std::__list_imp<std::pair<ref::details::tagged_allocated_type<di_asif::details::table,unsigned long long> *,unsigned long long>>::clear(v16);
  std::mutex::~mutex((std::mutex *)(v13 + 856));
  std::condition_variable::~condition_variable((std::condition_variable *)(v13 + 808));
  std::mutex::~mutex((std::mutex *)(v13 + 744));
  std::__tree<std::__value_type<boost::icl::discrete_interval<unsigned long long,std::less>,udif::details::run_info>,std::__map_value_compare<boost::icl::discrete_interval<unsigned long long,std::less>,std::__value_type<boost::icl::discrete_interval<unsigned long long,std::less>,udif::details::run_info>,boost::icl::exclusive_less_than<boost::icl::discrete_interval<unsigned long long,std::less>>,true>,std::allocator<std::__value_type<boost::icl::discrete_interval<unsigned long long,std::less>,udif::details::run_info>>>::destroy(v13 + 720, *a10);
  gcd::gcd_group::~gcd_group(a13);
  std::condition_variable::~condition_variable(a11);
  std::mutex::~mutex(v15);
  std::mutex::~mutex((std::mutex *)(v13 + 488));
  std::deque<std::atomic<DiskImage::Context *>>::~deque[abi:ne180100](v14);
  ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::~error_ctrl_blk_t((_QWORD *)v13);
  _Unwind_Resume(a1);
}

uint64_t std::deque<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>>::emplace_back<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;

  v4 = a1[2];
  v5 = a1[1];
  if (v4 == v5)
    v6 = 0;
  else
    v6 = ((v4 - v5) << 6) - 1;
  v7 = a1[4];
  v8 = a1[5];
  v9 = v8 + v7;
  if (v6 == v8 + v7)
  {
    std::deque<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>>::__add_back_capacity(a1);
    v7 = a1[4];
    v8 = a1[5];
    v5 = a1[1];
    v9 = v7 + v8;
  }
  *(_QWORD *)(*(_QWORD *)(v5 + ((v9 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v9 & 0x1FF)) = *a2;
  a1[5] = v8 + 1;
  v10 = v7 + v8 + 1;
  v11 = a1[1];
  v12 = (_QWORD *)(v11 + 8 * (v10 >> 9));
  v13 = *v12 + 8 * (v10 & 0x1FF);
  if (a1[2] == v11)
    v13 = 0;
  if (v13 == *v12)
    v13 = *(v12 - 1) + 4096;
  return v13 - 8;
}

uint64_t ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::~tagged_allocated_type(uint64_t a1)
{
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)(a1 + 328));
  ref::details::ctrl_blk<CurrentReader,unsigned long long>::~ctrl_blk((_QWORD *)(a1 + 8));
  return a1;
}

uint64_t ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::error_ctrl_blk_t(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)(a1 + 32) = &off_24CF15468;
  *(_QWORD *)(a1 + 56) = a1 + 32;
  *(_QWORD *)a1 = &off_24CF153D8;
  *(_QWORD *)(a1 + 64) = &off_24CF154F8;
  *(_QWORD *)(a1 + 24) = a1;
  *(_QWORD *)(a1 + 88) = a1 + 64;
  *(_QWORD *)(a1 + 96) = 0;
  v2 = ref::details::ctrl_blk<CurrentReader,unsigned long long>::ctrl_blk(a1 + 104, a1, a1 + 32, a1 + 64, a1 + 96);
  ref::details::ctrl_blk<CurrentReader,unsigned long long>::init(v2, -1);
  atomic_store(0, (unsigned int *)(a1 + 128));
  *(_BYTE *)(a1 + 416) = 1;
  return a1;
}

void sub_212FD3FBC(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v7;
  uint64_t v8;

  v7 = *(_QWORD **)(v1 + 88);
  if (v7 == v5)
  {
    v8 = 4;
  }
  else
  {
    if (!v7)
      goto LABEL_6;
    v8 = 5;
    v5 = *(_QWORD **)(v1 + 88);
  }
  (*(void (**)(_QWORD *))(*v5 + 8 * v8))(v5);
LABEL_6:
  ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::error_ctrl_blk_t(v4, v3, v2, v1);
  _Unwind_Resume(a1);
}

uint64_t ref::details::ctrl_blk<CurrentReader,unsigned long long>::init(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t *v4;
  unint64_t v5;

  *(_QWORD *)(a1 + 32) = a2;
  *(_BYTE *)(a1 + 312) = 0;
  atomic_store(1uLL, (unint64_t *)a1);
  atomic_store(0, (unint64_t *)(a1 + 8));
  atomic_store(0, (unint64_t *)(a1 + 16));
  result = std::__optional_destruct_base<CurrentReader,false>::reset[abi:ne180100](a1 + 40);
  v4 = *(unint64_t **)(a1 + 296);
  if (v4)
  {
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
    *(_QWORD *)(a1 + 304) = v5;
  }
  atomic_store(1u, (unsigned int *)(a1 + 24));
  __dmb(0xBu);
  return result;
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::~__func()
{
  JUMPOUT(0x2199A8A18);
}

_QWORD *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24CF153D8;
  return result;
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24CF153D8;
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::target_type()
{
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::~__func()
{
  JUMPOUT(0x2199A8A18);
}

_QWORD *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24CF15468;
  return result;
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24CF15468;
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::target_type()
{
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1}>,int ()(CurrentReader&)>::~__func()
{
  JUMPOUT(0x2199A8A18);
}

_QWORD *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1}>,int ()(CurrentReader&)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_24CF154F8;
  return result;
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1}>,int ()(CurrentReader&)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_24CF154F8;
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1}>,int ()(CurrentReader&)>::operator()()
{
  return 0;
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1}>,int ()(CurrentReader&)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::{lambda(CurrentReader&)#1}>,int ()(CurrentReader&)>::target_type()
{
}

uint64_t ref::details::ctrl_blk<CurrentReader,unsigned long long>::ctrl_blk(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 32) = -1;
  *(_BYTE *)(a1 + 40) = 0;
  *(_BYTE *)(a1 + 192) = 0;
  std::__function::__value_func<diskimage_uio::expected_ns::std::experimental::fundamentals_v3::expected<std::unique_ptr<DiskImage::Context>,std::error_code> ()(void)>::__value_func[abi:ne180100](a1 + 200, a2);
  std::__function::__value_func<diskimage_uio::expected_ns::std::experimental::fundamentals_v3::expected<std::unique_ptr<DiskImage::Context>,std::error_code> ()(void)>::__value_func[abi:ne180100](a1 + 232, a3);
  std::__function::__value_func<diskimage_uio::expected_ns::std::experimental::fundamentals_v3::expected<std::unique_ptr<DiskImage::Context>,std::error_code> ()(void)>::__value_func[abi:ne180100](a1 + 264, a4);
  *(_QWORD *)(a1 + 296) = a5;
  *(_QWORD *)(a1 + 304) = 0;
  *(_BYTE *)(a1 + 312) = 0;
  return a1;
}

void sub_212FD42F0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  v6 = *(_QWORD **)(v2 + 256);
  if (v6 == v4)
  {
    v7 = 4;
  }
  else
  {
    if (!v6)
      goto LABEL_6;
    v7 = 5;
    v4 = *(_QWORD **)(v2 + 256);
  }
  (*(void (**)(_QWORD *))(*v4 + 8 * v7))(v4);
LABEL_6:
  v8 = *(_QWORD **)(v2 + 224);
  if (v8 == v3)
  {
    v9 = 4;
    v8 = v3;
  }
  else
  {
    if (!v8)
      goto LABEL_11;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_11:
  std::__optional_destruct_base<CurrentReader,false>::~__optional_destruct_base[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t std::__optional_destruct_base<CurrentReader,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 152))
  {
    std::mutex::~mutex((std::mutex *)(a1 + 72));
    std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 24));
    std::shared_ptr<char>::~shared_ptr[abi:ne180100](a1);
  }
  return a1;
}

_QWORD *ref::details::ctrl_blk<CurrentReader,unsigned long long>::~ctrl_blk(_QWORD *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v2 = a1 + 33;
  v3 = (_QWORD *)a1[36];
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  v5 = (_QWORD *)a1[32];
  if (v5 == a1 + 29)
  {
    v6 = 4;
    v5 = a1 + 29;
  }
  else
  {
    if (!v5)
      goto LABEL_11;
    v6 = 5;
  }
  (*(void (**)(void))(*v5 + 8 * v6))();
LABEL_11:
  v7 = (_QWORD *)a1[28];
  if (v7 == a1 + 25)
  {
    v8 = 4;
    v7 = a1 + 25;
    goto LABEL_15;
  }
  if (v7)
  {
    v8 = 5;
LABEL_15:
    (*(void (**)(void))(*v7 + 8 * v8))();
  }
  std::__optional_destruct_base<CurrentReader,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)(a1 + 5));
  return a1;
}

uint64_t ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v8[3];
  _QWORD *v9;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a1 = a2;
  v10[0] = &off_24CF15588;
  v10[1] = a1;
  v11 = v10;
  v8[0] = &off_24CF15608;
  v8[1] = a1;
  v9 = v8;
  ref::details::ctrl_blk<CurrentReader,unsigned long long>::ctrl_blk(a1 + 8, (uint64_t)v10, (uint64_t)v8, a2 + 944, a2 + 568);
  v3 = v9;
  if (v9 == v8)
  {
    v4 = 4;
    v3 = v8;
  }
  else
  {
    if (!v9)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  v5 = v11;
  if (v11 == v10)
  {
    v6 = 4;
    v5 = v10;
    goto LABEL_10;
  }
  if (v11)
  {
    v6 = 5;
LABEL_10:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  *(_QWORD *)(a1 + 328) = 0;
  *(_DWORD *)(a1 + 336) = 0;
  return a1;
}

void sub_212FD4560(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *a13, char a14, uint64_t a15, uint64_t a16, char *a17)
{
  char *v17;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;

  v19 = a13;
  if (a13 == v17)
  {
    v20 = 4;
    v19 = &a10;
  }
  else
  {
    if (!a13)
      goto LABEL_6;
    v20 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v19 + 8 * v20))();
LABEL_6:
  v21 = a17;
  if (a17 == &a14)
  {
    v22 = 4;
    v21 = &a14;
  }
  else
  {
    if (!a17)
      goto LABEL_11;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_11:
  _Unwind_Resume(exception_object);
}

void std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::~__func()
{
  JUMPOUT(0x2199A8A18);
}

_QWORD *std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24CF15588;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24CF15588;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::operator()(uint64_t a1, uint64_t a2, uint64_t *a3, int *a4)
{
  return std::function<void ()(ref::details::ctrl_blk<di_asif::details::table,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::operator()(**(_QWORD **)(a1 + 8) + 1320, *(_QWORD *)(a1 + 8), *a3, *a4);
}

uint64_t std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::target_type()
{
}

void std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::~__func()
{
  JUMPOUT(0x2199A8A18);
}

_QWORD *std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24CF15608;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24CF15608;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::operator()(uint64_t a1)
{
  return std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1} &,ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &>((uint64_t **)(a1 + 8));
}

uint64_t std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::target_type()
{
}

uint64_t std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::tagged_allocated_type(ref::Allocator<CurrentReader,unsigned long long> &)::{lambda(ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1} &,ref::details::ctrl_blk<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &>(uint64_t **a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v4;

  v1 = **a1;
  v4 = *a1;
  v2 = *(_QWORD *)(v1 + 1376);
  if (!v2)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, uint64_t **))(*(_QWORD *)v2 + 48))(v2, &v4);
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::~__func()
{
  JUMPOUT(0x2199A8A18);
}

_QWORD *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24CF15688;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24CF15688;
  a2[1] = v2;
  return result;
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::operator()(uint64_t a1, unint64_t *a2, unint64_t *a3, _DWORD *a4)
{
  ref::Allocator<CurrentReader,unsigned long long>::deleter(*(_QWORD *)(a1 + 8), *a2, *a3, *a4);
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,unsigned long long,diskimage_uio::option_set_ns::option_set<ref::details::deleter_options>)>::target_type()
{
}

void ref::Allocator<CurrentReader,unsigned long long>::deleter(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  unsigned int *v7;
  std::mutex *v8;
  _QWORD *v9;
  const void *v10;
  uint64_t v11;
  unsigned int v12;
  std::mutex *tagged_ptr_lock;
  const void *v14;
  std::condition_variable *tagged_ptr_cond;
  const void *v16;
  unsigned int v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t *v23;
  const void *v25;
  std::condition_variable *v27;

  if ((*(_DWORD *)(a2 + 336) & 1) == 0)
  {
    v7 = (unsigned int *)(a2 + 336);
    if ((a4 & 3) == 1)
    {
      v8 = (std::mutex *)(a1 + 856);
      std::mutex::lock((std::mutex *)(a1 + 856));
      v9 = operator new(0x20uLL);
      v9[2] = a2;
      v9[3] = a3;
      v11 = *(_QWORD *)(a1 + 920);
      *v9 = v11;
      v9[1] = a1 + 920;
      *(_QWORD *)(v11 + 8) = v9;
      *(_QWORD *)(a1 + 920) = v9;
      ++*(_QWORD *)(a1 + 936);
      do
        v12 = __ldaxr(v7);
      while (__stlxr(v12 | 4, v7));
      tagged_ptr_lock = (std::mutex *)ref::details::_get_tagged_ptr_lock(a2, v10);
      std::mutex::lock(tagged_ptr_lock);
      tagged_ptr_cond = (std::condition_variable *)ref::details::_get_tagged_ptr_cond(a2, v14);
      std::condition_variable::notify_all(tagged_ptr_cond);
      std::mutex::unlock(tagged_ptr_lock);
LABEL_20:
      std::mutex::unlock(v8);
      return;
    }
    ref::Allocator<CurrentReader,unsigned long long>::delete_tag(a1, a3);
    ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)(a2 + 328));
    do
      v17 = __ldaxr(v7);
    while (__stlxr(v17 | 1, v7));
    if ((v17 & 2) == 0)
      ref::Allocator<CurrentReader,unsigned long long>::add_to_free_pool(a1, a2);
    v18 = (unint64_t *)(a1 + 576);
    do
    {
      v19 = __ldaxr(v18);
      v20 = v19 - 1;
    }
    while (__stlxr(v20, v18));
    if (!v20)
    {
      if (atomic_load((unint64_t *)(a1 + 584)))
      {
        std::mutex::lock((std::mutex *)(a1 + 592));
        if (atomic_load((unint64_t *)(a1 + 584)))
          std::condition_variable::notify_all((std::condition_variable *)(a1 + 656));
        std::mutex::unlock((std::mutex *)(a1 + 592));
      }
    }
    v23 = (unint64_t *)(a1 + 560);
    if (atomic_load(v23))
    {
      v8 = (std::mutex *)ref::details::_get_tagged_ptr_lock(a2, v16);
      std::mutex::lock(v8);
      if (atomic_load(v23))
      {
        v27 = (std::condition_variable *)ref::details::_get_tagged_ptr_cond(a2, v25);
        std::condition_variable::notify_all(v27);
      }
      goto LABEL_20;
    }
  }
}

void sub_212FD49CC(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void ref::Allocator<CurrentReader,unsigned long long>::delete_tag(uint64_t a1, unint64_t a2)
{
  std::mutex *v3;
  unint64_t v4;

  v4 = a2;
  v3 = (std::mutex *)(a1 + 744);
  std::mutex::lock((std::mutex *)(a1 + 744));
  std::__tree<std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::table,unsigned long long> *>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::table,unsigned long long> *>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::table,unsigned long long> *>>>::__erase_unique<unsigned long long>(a1 + 720, &v4);
  std::condition_variable::notify_all((std::condition_variable *)(a1 + 808));
  std::mutex::unlock(v3);
}

void sub_212FD4A48(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void ref::Allocator<CurrentReader,unsigned long long>::add_to_free_pool(uint64_t a1, uint64_t a2)
{
  std::mutex *v3;
  uint64_t v4;

  v4 = a2;
  v3 = (std::mutex *)(a1 + 488);
  std::mutex::lock((std::mutex *)(a1 + 488));
  std::deque<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>>::push_back((_QWORD *)(a1 + 440), &v4);
  std::mutex::unlock(v3);
}

void sub_212FD4AA4(_Unwind_Exception *a1)
{
  std::mutex *v1;

  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void std::deque<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a1[2];
  v5 = a1[1];
  if (v4 == v5)
    v6 = 0;
  else
    v6 = ((v4 - v5) << 6) - 1;
  v7 = a1[5];
  v8 = v7 + a1[4];
  if (v6 == v8)
  {
    std::deque<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5];
    v8 = a1[4] + v7;
  }
  *(_QWORD *)(*(_QWORD *)(v5 + ((v8 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v8 & 0x1FF)) = *a2;
  a1[5] = v7 + 1;
}

void std::deque<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,std::allocator<ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *>>::__add_back_capacity(_QWORD *a1)
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
  v3 = v2 >= 0x200;
  v4 = v2 - 512;
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
      v34 = (char *)std::allocator<std::unique_ptr<diskimage_uio::stack_image_node const>>::allocate_at_least[abi:ne180100](v5, v33);
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
      *(_QWORD *)&v54 = operator new(0x1000uLL);
      std::__split_buffer<std::atomic<DiskImage::Context *> *,std::allocator<std::atomic<DiskImage::Context *> *>>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0x1000uLL);
    std::__split_buffer<std::atomic<DiskImage::Context *> *,std::allocator<std::atomic<DiskImage::Context *> *>>::push_front((uint64_t)a1, &v54);
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
      v34 = (char *)std::allocator<std::unique_ptr<diskimage_uio::stack_image_node const>>::allocate_at_least[abi:ne180100]((uint64_t)(a1 + 3), v46);
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
  *(_QWORD *)&v54 = std::allocator<std::unique_ptr<diskimage_uio::stack_image_node const>>::allocate_at_least[abi:ne180100]((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  std::__split_buffer<std::atomic<DiskImage::Context *> *,std::allocator<std::atomic<DiskImage::Context *> *> &>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<std::atomic<DiskImage::Context *> *,std::allocator<std::atomic<DiskImage::Context *> *> &>::push_front((uint64_t)&v54, v27);
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

void sub_212FD4E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::~__func()
{
  JUMPOUT(0x2199A8A18);
}

_QWORD *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_24CF15718;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_24CF15718;
  a2[1] = v2;
  return result;
}

void std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::operator()(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  ref::Allocator<CurrentReader,unsigned long long>::deallocate(*(_QWORD *)(a1 + 8), *a2, a3);
}

uint64_t std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1},std::allocator<ref::Allocator<CurrentReader,unsigned long long>::{lambda(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)#1}>,void ()(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::tagged_ptr<CurrentReader,unsigned long long> &)>::target_type()
{
}

void ref::Allocator<CurrentReader,unsigned long long>::deallocate(uint64_t a1, unint64_t a2, unint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v3 = *(_QWORD *)(a1 + 424);
  if (v3 >= 1)
  {
    v6 = 0;
    v7 = *(_QWORD *)(a1 + 552);
    v8 = v7 + 8 * v3;
    while (!(v7 + v6) || *(_QWORD *)(v7 + v6) != a2)
    {
      v6 += 8;
      if (v7 + v6 >= v8)
        return;
    }
    if ((v6 & 0x8000000000000000) == 0)
    {
      v9 = (unint64_t *)(v7 + v6);
      while (1)
      {
        v10 = __ldaxr(v9);
        if (v10 != a2)
          break;
        if (!__stlxr(0, v9))
        {
          ref::Allocator<CurrentReader,unsigned long long>::drop_elem(a1, a2, 1uLL, a3);
          ref::Allocator<CurrentReader,unsigned long long>::add_to_free_pool(a1, a2);
          return;
        }
      }
      __clrex();
    }
  }
}

uint64_t ref::Allocator<CurrentReader,unsigned long long>::drop_elem(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  const void *v19;
  const void *v20;
  uint64_t v21;
  char v22;
  std::condition_variable *v23;
  uint64_t v24;
  char v25;
  const void *v26;
  std::condition_variable *tagged_ptr_cond;
  std::chrono::system_clock::time_point v28;
  unsigned int v29;
  char v30;
  unint64_t *v31;
  unint64_t v32;
  unsigned int v33;
  unint64_t v35;
  char v36;
  _BYTE v37[7];
  uint64_t v38;
  std::chrono::duration<long long, std::ratio<1, 1000000>>::rep v39;
  std::unique_lock<std::mutex> __lk;
  _BYTE v41[7];

  v8 = a3 & 0x100;
  v9 = (a3 >> 8) & 1;
  v10 = (unint64_t *)(a1 + 576);
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11 + 1, v10));
  if ((a3 & 1) != 0)
  {
    v12 = (unint64_t *)(a1 + 560);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 + 1, v12));
  }
  v14 = (unsigned int *)(a2 + 336);
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 | 2, v14));
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)(a2 + 328));
  if (a4)
    ref::tagged_ptr<CurrentReader,unsigned long long>::reset(a4);
  if ((a3 & 1) != 0)
  {
    v16 = atomic_load(v14);
    if ((v16 & 4) == 0)
    {
      v17 = (a3 >> 16) & 1;
      do
      {
        if ((*v14 & 1) != 0)
          break;
        if ((_DWORD)v9)
        {
          std::mutex::lock((std::mutex *)(a1 + 488));
          v18 = *(_QWORD *)(a1 + 480);
          std::mutex::unlock((std::mutex *)(a1 + 488));
          if (v18)
            break;
        }
        if (ref::Allocator<CurrentReader,unsigned long long>::run_failed_dtors_list(a1, v17, 0, 0) == -1)
        {
          __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)ref::details::_get_tagged_ptr_lock(a2, v19);
          __lk.__owns_ = 1;
          std::mutex::lock(__lk.__m_);
          tagged_ptr_cond = (std::condition_variable *)ref::details::_get_tagged_ptr_cond(a2, v26);
          v28.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
          v38 = a1;
          v39 = v28.__d_.__rep_ + 200000;
          v35 = a2;
          v36 = v9;
          *(_DWORD *)v37 = *(_DWORD *)v41;
          *(_DWORD *)&v37[3] = *(_DWORD *)&v41[3];
          std::condition_variable::wait_until<std::chrono::system_clock,std::chrono::duration<long long,std::ratio<1l,1000000l>>,ref::Allocator<CurrentReader,unsigned long long>::drop_elem(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::Allocator<CurrentReader,unsigned long long>::drop_elem_options,ref::tagged_ptr<CurrentReader,unsigned long long> *)::{lambda(void)#1}>(tagged_ptr_cond, &__lk, &v39, (uint64_t)&v35);
        }
        else
        {
          __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)ref::details::_get_tagged_ptr_lock(a2, v19);
          __lk.__owns_ = 1;
          std::mutex::lock(__lk.__m_);
          v21 = ref::details::_get_tagged_ptr_cond(a2, v20);
          v22 = atomic_load(v14);
          if ((v22 & 4) == 0)
          {
            v23 = (std::condition_variable *)v21;
            do
            {
              if ((*v14 & 1) != 0)
                break;
              if ((_DWORD)v9)
              {
                std::mutex::lock((std::mutex *)(a1 + 488));
                v24 = *(_QWORD *)(a1 + 480);
                std::mutex::unlock((std::mutex *)(a1 + 488));
                if (v24)
                  break;
              }
              std::condition_variable::wait(v23, &__lk);
              v25 = atomic_load(v14);
            }
            while ((v25 & 4) == 0);
          }
        }
        if (__lk.__owns_)
          std::mutex::unlock(__lk.__m_);
        v29 = *v14;
        if (!v8 || (v29 & 1) != 0)
        {
          if ((v29 & 1) != 0)
            break;
        }
        else if (*(_QWORD *)(a1 + 480))
        {
          break;
        }
        v30 = atomic_load(v14);
      }
      while ((v30 & 4) == 0);
    }
    v31 = (unint64_t *)(a1 + 560);
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
  }
  do
    v33 = __ldaxr(v14);
  while (__stlxr(v33 & 0xFFFFFFFD, v14));
  return v33 & 1;
}

void sub_212FD51E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::mutex *a14, char a15)
{
  if (a15)
    std::mutex::unlock(a14);
  _Unwind_Resume(exception_object);
}

uint64_t ref::Allocator<CurrentReader,unsigned long long>::run_failed_dtors_list(uint64_t a1, int a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v12;
  const void *v13;
  std::mutex *tagged_ptr_lock;
  unsigned int *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t *v18;
  std::mutex *v20;

  if (!*(_QWORD *)(a1 + 936))
    return 0;
  v20 = (std::mutex *)(a1 + 856);
  std::mutex::lock((std::mutex *)(a1 + 856));
  if (*(_QWORD *)(a1 + 936))
  {
    v8 = *(uint64_t **)(a1 + 928);
    if (v8 == (uint64_t *)(a1 + 920))
    {
      v11 = 1;
    }
    else
    {
      v9 = a4;
      if (a2)
        v10 = 6;
      else
        v10 = 4;
      v11 = 1;
      do
      {
        v12 = v8[2];
        if ((ref::details::ctrl_blk<CurrentReader,unsigned long long>::reset_val(v12 + 8, v8[3], v10) | a2) == 1)
        {
          tagged_ptr_lock = (std::mutex *)ref::details::_get_tagged_ptr_lock(v12, v13);
          std::mutex::lock(tagged_ptr_lock);
          v15 = (unsigned int *)(v12 + 336);
          do
            v16 = __ldaxr(v15);
          while (__stlxr(v16 & 0xFFFFFFFB, v15));
          std::mutex::unlock(tagged_ptr_lock);
          v17 = *v8;
          v18 = (uint64_t *)v8[1];
          *(_QWORD *)(v17 + 8) = v18;
          *(_QWORD *)v8[1] = v17;
          --*(_QWORD *)(a1 + 936);
          operator delete(v8);
          v8 = v18;
        }
        else
        {
          if (!v9 || v8[3] == a3)
            v11 = 0xFFFFFFFFLL;
          v8 = (uint64_t *)v8[1];
        }
      }
      while (v8 != (uint64_t *)(a1 + 920));
    }
  }
  else
  {
    v11 = 0;
  }
  std::mutex::unlock(v20);
  return v11;
}

void sub_212FD5358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10)
{
  std::mutex::unlock(a10);
  _Unwind_Resume(a1);
}

uint64_t std::condition_variable::wait_until<std::chrono::system_clock,std::chrono::duration<long long,std::ratio<1l,1000000l>>,ref::Allocator<CurrentReader,unsigned long long>::drop_elem(ref::details::tagged_allocated_type<CurrentReader,unsigned long long> *,ref::Allocator<CurrentReader,unsigned long long>::drop_elem_options,ref::tagged_ptr<CurrentReader,unsigned long long> *)::{lambda(void)#1}>(std::condition_variable *a1, std::unique_lock<std::mutex> *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  char v9;
  std::mutex *v10;
  uint64_t v11;
  std::chrono::system_clock::time_point v12;
  uint64_t v13;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v14;
  uint64_t v15;
  char v16;
  _BOOL8 v17;

  do
  {
    v8 = *(_QWORD *)(a4 + 16);
    v9 = atomic_load((unsigned int *)(*(_QWORD *)a4 + 336));
    if ((v9 & 4) != 0)
      return 1;
    if ((*(_DWORD *)(*(_QWORD *)a4 + 336) & 1) != 0)
      return 1;
    if (*(_BYTE *)(a4 + 8))
    {
      v10 = (std::mutex *)(v8 + 488);
      std::mutex::lock((std::mutex *)(v8 + 488));
      v11 = *(_QWORD *)(v8 + 480);
      std::mutex::unlock(v10);
      if (v11)
        return 1;
    }
    v12.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
    v13 = *a3;
    if (*a3 <= v12.__d_.__rep_)
      break;
    if (!v13)
    {
      v14.__d_.__rep_ = 0;
      goto LABEL_14;
    }
    if (v13 < 1)
    {
      if ((unint64_t)v13 < 0xFFDF3B645A1CAC09)
      {
        v14.__d_.__rep_ = 0x8000000000000000;
        goto LABEL_14;
      }
    }
    else if ((unint64_t)v13 > 0x20C49BA5E353F7)
    {
      v14.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_14;
    }
    v14.__d_.__rep_ = 1000 * v13;
LABEL_14:
    std::condition_variable::__do_timed_wait(a1, a2, v14);
  }
  while (std::chrono::system_clock::now().__d_.__rep_ < *a3);
  v15 = *(_QWORD *)(a4 + 16);
  v16 = atomic_load((unsigned int *)(*(_QWORD *)a4 + 336));
  if ((v16 & 4) != 0 || (*(_DWORD *)(*(_QWORD *)a4 + 336) & 1) != 0)
    return 1;
  if (!*(_BYTE *)(a4 + 8))
    return 0;
  std::mutex::lock((std::mutex *)(v15 + 488));
  v17 = *(_QWORD *)(v15 + 480) != 0;
  std::mutex::unlock((std::mutex *)(v15 + 488));
  return v17;
}

_QWORD *ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::~error_ctrl_blk_t(_QWORD *a1)
{
  unint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  v2 = a1 + 13;
  do
  {
    v3 = __ldaxr(v2);
    v4 = v3 - 1;
  }
  while (__stlxr(v4, v2));
  if (!v4)
  {
    v5 = a1[17];
    a1[17] = -1;
    ref::details::ctrl_blk<CurrentReader,unsigned long long>::reset_val((uint64_t)(a1 + 13), v5, 1u);
  }
  ref::details::ctrl_blk<CurrentReader,unsigned long long>::~ctrl_blk(v2);
  v6 = (_QWORD *)a1[11];
  if (v6 == a1 + 8)
  {
    v7 = 4;
    v6 = a1 + 8;
  }
  else
  {
    if (!v6)
      goto LABEL_10;
    v7 = 5;
  }
  (*(void (**)(void))(*v6 + 8 * v7))();
LABEL_10:
  v8 = (_QWORD *)a1[7];
  if (v8 == a1 + 4)
  {
    v9 = 4;
    v8 = a1 + 4;
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_15:
  v10 = (_QWORD *)a1[3];
  if (v10 == a1)
  {
    v11 = 4;
    v10 = a1;
    goto LABEL_19;
  }
  if (v10)
  {
    v11 = 5;
LABEL_19:
    (*(void (**)(void))(*v10 + 8 * v11))();
  }
  return a1;
}

_QWORD *ref::Allocator<CurrentReader,unsigned long long>::~Allocator(uint64_t a1)
{
  unint64_t v1;
  unint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  *(_BYTE *)(a1 + 704) = 0;
  if (*(_QWORD *)(a1 + 424))
  {
    v3 = 0;
    do
    {
      v4 = (unint64_t *)(*(_QWORD *)(a1 + 552) + 8 * v3);
      do
        v5 = __ldaxr(v4);
      while (__stlxr(0, v4));
      if (v5)
      {
        v1 = v1 & 0xFFFFFFFFFF000000 | 0x10001;
        ref::Allocator<CurrentReader,unsigned long long>::drop_elem(a1, v5, v1, 0);
        ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)(v5 + 328));
        ref::details::ctrl_blk<CurrentReader,unsigned long long>::~ctrl_blk((_QWORD *)(v5 + 8));
        MEMORY[0x2199A8A18](v5, 0x1072C408B028EDDLL);
      }
      ++v3;
    }
    while (*(_QWORD *)(a1 + 424) > v3);
  }
  gcd::gcd_queue::barrier_sync((dispatch_queue_t *)(a1 + 712), &__block_literal_global_9);
  v6 = *(_QWORD *)(a1 + 552);
  if (v6)
    MEMORY[0x2199A8A00](v6, 0x20C8093837F09);
  std::mutex::lock((std::mutex *)(a1 + 488));
  v7 = *(_QWORD *)(a1 + 448);
  if (*(_QWORD *)(a1 + 456) != v7)
  {
    v8 = *(_QWORD *)(a1 + 472);
    v9 = (_QWORD *)(v7 + 8 * (v8 >> 9));
    v10 = (uint64_t *)(*v9 + 8 * (v8 & 0x1FF));
    v11 = *(_QWORD *)(v7 + (((*(_QWORD *)(a1 + 480) + v8) >> 6) & 0x3FFFFFFFFFFFFF8))
        + 8 * ((*(_QWORD *)(a1 + 480) + v8) & 0x1FF);
    while (v10 != (uint64_t *)v11)
    {
      v12 = *v10;
      if (*v10)
      {
        ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)(v12 + 328));
        ref::details::ctrl_blk<CurrentReader,unsigned long long>::~ctrl_blk((_QWORD *)(v12 + 8));
        MEMORY[0x2199A8A18](v12, 0x1072C408B028EDDLL);
      }
      if ((uint64_t *)((char *)++v10 - *v9) == (uint64_t *)4096)
      {
        v13 = (uint64_t *)v9[1];
        ++v9;
        v10 = v13;
      }
    }
  }
  std::mutex::unlock((std::mutex *)(a1 + 488));
  v14 = *(_QWORD **)(a1 + 1376);
  if (v14 == (_QWORD *)(a1 + 1352))
  {
    v15 = 4;
    v14 = (_QWORD *)(a1 + 1352);
  }
  else
  {
    if (!v14)
      goto LABEL_22;
    v15 = 5;
  }
  (*(void (**)(void))(*v14 + 8 * v15))();
LABEL_22:
  v16 = *(_QWORD **)(a1 + 1344);
  if (v16 == (_QWORD *)(a1 + 1320))
  {
    v17 = 4;
    v16 = (_QWORD *)(a1 + 1320);
  }
  else
  {
    if (!v16)
      goto LABEL_27;
    v17 = 5;
  }
  (*(void (**)(void))(*v16 + 8 * v17))();
LABEL_27:
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)(a1 + 1304));
  ref::details::ctrl_blk<CurrentReader,unsigned long long>::~ctrl_blk((_QWORD *)(a1 + 984));
  v18 = *(_QWORD **)(a1 + 968);
  if (v18 == (_QWORD *)(a1 + 944))
  {
    v19 = 4;
    v18 = (_QWORD *)(a1 + 944);
    goto LABEL_31;
  }
  if (v18)
  {
    v19 = 5;
LABEL_31:
    (*(void (**)(void))(*v18 + 8 * v19))();
  }
  std::__list_imp<std::pair<ref::details::tagged_allocated_type<di_asif::details::table,unsigned long long> *,unsigned long long>>::clear((_QWORD *)(a1 + 920));
  std::mutex::~mutex((std::mutex *)(a1 + 856));
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 808));
  std::mutex::~mutex((std::mutex *)(a1 + 744));
  std::__tree<std::__value_type<boost::icl::discrete_interval<unsigned long long,std::less>,udif::details::run_info>,std::__map_value_compare<boost::icl::discrete_interval<unsigned long long,std::less>,std::__value_type<boost::icl::discrete_interval<unsigned long long,std::less>,udif::details::run_info>,boost::icl::exclusive_less_than<boost::icl::discrete_interval<unsigned long long,std::less>>,true>,std::allocator<std::__value_type<boost::icl::discrete_interval<unsigned long long,std::less>,udif::details::run_info>>>::destroy(a1 + 720, *(_QWORD **)(a1 + 728));
  gcd::gcd_group::~gcd_group((NSObject **)(a1 + 712));
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 656));
  std::mutex::~mutex((std::mutex *)(a1 + 592));
  std::mutex::~mutex((std::mutex *)(a1 + 488));
  std::deque<std::atomic<DiskImage::Context *>>::~deque[abi:ne180100]((_QWORD *)(a1 + 440));
  return ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::~error_ctrl_blk_t((_QWORD *)a1);
}

_QWORD *std::shared_ptr<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::shared_ptr[abi:ne180100]<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>,void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &off_24CF157E8;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_212FD58C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  a10 = 0;
  if (v10)
    std::default_delete<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::operator()[abi:ne180100]((uint64_t)&a10, v10);
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>> *,std::shared_ptr<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::__shared_ptr_default_delete<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>,std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>,std::allocator<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x2199A8A18);
}

void std::__shared_ptr_pointer<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>> *,std::shared_ptr<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::__shared_ptr_default_delete<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>,std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>,std::allocator<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>>::__on_zero_shared(uint64_t a1)
{
  std::default_delete<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::operator()[abi:ne180100](a1 + 24, *(_QWORD *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>> *,std::shared_ptr<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::__shared_ptr_default_delete<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>,std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>,std::allocator<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void std::default_delete<std::vector<ref::tagged_weak_ptr<CurrentReader,unsigned long long>>>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  if (a2)
  {
    v2 = *(void **)a2;
    if (*(_QWORD *)a2)
    {
      *(_QWORD *)(a2 + 8) = v2;
      operator delete(v2);
    }
    JUMPOUT(0x2199A8A18);
  }
}

void ref::Allocator<CurrentReader,unsigned long long>::add_tag(uint64_t a1@<X0>, ref::details **a2@<X1>, int a3@<W2>, unint64_t *a4@<X8>)
{
  std::mutex *v7;
  _QWORD *v8;
  ref::details *v9;
  unint64_t *v10;
  ref::details **v11;
  uint64_t *v12;
  uint64_t *v13;
  char v14;
  unint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;
  BOOL v19;
  _QWORD *v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t *v24;
  const void *v25;
  unint64_t v26;
  const void *v27;
  std::condition_variable *tagged_ptr_cond;
  unint64_t v29;
  _QWORD *v30;
  ref::details **v31;
  _QWORD *v32;
  unint64_t v33;
  BOOL v34;
  _QWORD *v35;
  ref::details *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t *v45;
  std::condition_variable *v46;
  uint64_t **v47;
  std::unique_lock<std::mutex> v48;
  unint64_t v49;
  ref::details *v50;
  std::unique_lock<std::mutex> __lk;
  ref::details **v52;
  ref::details **v53;
  unint64_t *v54;
  ref::details ***v55;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v56;

  v52 = a2;
  v7 = (std::mutex *)(a1 + 744);
  v8 = (_QWORD *)(a1 + 728);
  v9 = (ref::details *)(a1 + 976);
  v10 = (unint64_t *)(a1 + 560);
  v45 = (unint64_t *)(a1 + 104);
  v46 = (std::condition_variable *)(a1 + 808);
  v47 = (uint64_t **)(a1 + 720);
  while (2)
  {
    __lk.__m_ = v7;
    __lk.__owns_ = 1;
    std::mutex::lock(v7);
    if (a3)
    {
      v11 = v52;
    }
    else
    {
      v16 = (_QWORD *)*v8;
      if (!*v8)
        goto LABEL_20;
      v11 = v52;
      v17 = v8;
      do
      {
        v18 = v16[4];
        v19 = v18 >= (unint64_t)v52;
        if (v18 >= (unint64_t)v52)
          v20 = v16;
        else
          v20 = v16 + 1;
        if (v19)
          v17 = v16;
        v16 = (_QWORD *)*v20;
      }
      while (*v20);
      if (v17 == v8 || (unint64_t)v52 < v17[4] || (ref::details *)v17[5] == v9)
      {
LABEL_20:
        v53 = 0;
        *a4 = 0;
        do
          v21 = __ldaxr((unint64_t *)&v53);
        while (__stlxr(0, (unint64_t *)&v53));
        atomic_store(v21, a4);
        a4[1] = (unint64_t)v8;
        ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v53);
        goto LABEL_23;
      }
    }
    v53 = v11;
    v54 = (unint64_t *)v9;
    v12 = std::__tree<std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *>>>::__emplace_unique_key_args<unsigned long long,std::pair<unsigned long long,ref::details::tagged_allocated_type<di_asif::details::map_element,unsigned long long> *>>(v47, (unint64_t *)&v53, (uint64_t *)&v53);
    v13 = v12;
    if (v14)
    {
      v53 = 0;
      *a4 = 0;
      do
        v15 = __ldaxr((unint64_t *)&v53);
      while (__stlxr(0, (unint64_t *)&v53));
      atomic_store(v15, a4);
      a4[1] = (unint64_t)v12;
      ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v53);
LABEL_23:
      v22 = 1;
      goto LABEL_24;
    }
    v50 = (ref::details *)v12[5];
    if (v50 == v9)
    {
      v30 = (_QWORD *)*v8;
      if (*v8)
      {
        v31 = v52;
        v32 = v8;
        while (1)
        {
          v33 = v30[4];
          v34 = v33 >= (unint64_t)v31;
          if (v33 >= (unint64_t)v31)
            v35 = v30;
          else
            v35 = v30 + 1;
          if (v34)
            v32 = v30;
          v30 = (_QWORD *)*v35;
          if (!*v35)
          {
            if (v32 == v8)
              break;
            if ((unint64_t)v31 < v32[4])
              break;
            v36 = (ref::details *)v32[5];
            if (v36 != v9)
            {
              v37 = *((_QWORD *)v36 + 41);
              if (v37)
              {
                if (!*(_BYTE *)(v37 + 312))
                  break;
              }
            }
            if (!*(_BYTE *)(a1 + 704))
              break;
            std::condition_variable::wait(v46, &__lk);
            v30 = (_QWORD *)*v8;
            v32 = v8;
            if (!*v8)
              break;
          }
        }
      }
      v22 = 0;
      goto LABEL_24;
    }
    std::unique_lock<std::mutex>::unlock(&__lk);
    ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr(&v49, (unint64_t *)v50 + 41);
    if (v49 && !*(_BYTE *)(v49 + 312))
    {
      v23 = (uint64_t)v52;
      if (*(ref::details ***)(v49 + 32) == v52)
      {
        *a4 = 0;
        do
          v39 = __ldaxr(&v49);
        while (__stlxr(0, &v49));
        atomic_store(v39, a4);
        a4[1] = (unint64_t)v13;
        goto LABEL_84;
      }
      if (*(_QWORD *)(v49 + 32) == -1)
      {
        v24 = v45;
        if ((a3 & 1) == 0)
        {
          v53 = 0;
          *a4 = 0;
          do
            v38 = __ldaxr((unint64_t *)&v53);
          while (__stlxr(0, (unint64_t *)&v53));
          goto LABEL_83;
        }
        goto LABEL_35;
      }
    }
    else
    {
      if (!a3)
      {
        v53 = 0;
        *a4 = 0;
        do
          v38 = __ldaxr((unint64_t *)&v53);
        while (__stlxr(0, (unint64_t *)&v53));
        goto LABEL_83;
      }
      v23 = (uint64_t)v52;
    }
    v24 = v45;
LABEL_35:
    if (ref::Allocator<CurrentReader,unsigned long long>::run_failed_dtors_list(a1, 0, v23, 1u) != -1)
    {
      do
        v26 = __ldaxr(v10);
      while (__stlxr(v26 + 1, v10));
      v48.__m_ = (std::unique_lock<std::mutex>::mutex_type *)ref::details::_get_tagged_ptr_lock((unint64_t)v50, v25);
      v48.__owns_ = 1;
      std::mutex::lock(v48.__m_);
      tagged_ptr_cond = (std::condition_variable *)ref::details::_get_tagged_ptr_cond((unint64_t)v50, v27);
      v56 = std::chrono::steady_clock::now().__d_.__rep_ + 200000000;
      v53 = &v50;
      v54 = &v49;
      v55 = &v52;
      std::condition_variable::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>,ref::Allocator<CurrentReader,unsigned long long>::add_tag(unsigned long long,BOOL)::{lambda(void)#1}>(tagged_ptr_cond, &v48, &v56, (uint64_t)&v53);
      do
        v29 = __ldaxr(v10);
      while (__stlxr(v29 - 1, v10));
      if (v48.__owns_)
        std::mutex::unlock(v48.__m_);
      v22 = 3;
      goto LABEL_85;
    }
    v53 = 0;
    v40 = atomic_load(v24);
    if (!v40)
      goto LABEL_81;
    while (1)
    {
      v41 = __ldaxr(v24);
      if (v41 != v40)
      {
        __clrex();
        goto LABEL_71;
      }
      if (!__stlxr(v40 + 1, v24))
        break;
LABEL_71:
      v40 = v41;
      if (!v41)
        goto LABEL_81;
    }
    v42 = *(unint64_t **)(a1 + 400);
    v40 = (unint64_t)v24;
    if (v42)
    {
      do
        v43 = __ldxr(v42);
      while (__stxr(v43 + 1, v42));
      *(_QWORD *)(a1 + 408) = v43;
      v40 = (unint64_t)v24;
    }
LABEL_81:
    atomic_store(v40, (unint64_t *)&v53);
    *a4 = 0;
    do
      v38 = __ldaxr((unint64_t *)&v53);
    while (__stlxr(0, (unint64_t *)&v53));
LABEL_83:
    atomic_store(v38, a4);
    a4[1] = (unint64_t)v8;
    ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v53);
LABEL_84:
    v22 = 1;
LABEL_85:
    ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&v49);
LABEL_24:
    if (__lk.__owns_)
      std::mutex::unlock(__lk.__m_);
    if (v22 != 1)
    {
      if (!*(_BYTE *)(a1 + 704))
      {
        v53 = 0;
        *a4 = 0;
        do
          v44 = __ldaxr((unint64_t *)&v53);
        while (__stlxr(0, (unint64_t *)&v53));
        atomic_store(v44, a4);
        a4[1] = (unint64_t)v8;
        ref::tagged_ptr<CurrentReader,unsigned long long>::reset((unint64_t *)&v53);
        return;
      }
      continue;
    }
    break;
  }
}

void sub_212FD5DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::mutex *a12, char a13, int a14, unint64_t a15, uint64_t a16, std::mutex *a17, char a18)
{
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&a15);
  if (a18)
    std::mutex::unlock(a17);
  _Unwind_Resume(a1);
}

unint64_t *ref::Allocator<CurrentReader,unsigned long long>::allocate_from_empty_pool@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t **a3@<X8>)
{
  std::mutex *v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v12;
  unint64_t v13[5];

  v12 = 0;
  v6 = (std::mutex *)(a1 + 488);
  std::mutex::lock((std::mutex *)(a1 + 488));
  v7 = *(_QWORD *)(a1 + 480);
  if (v7)
  {
    v8 = *(unint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 448) + ((*(_QWORD *)(a1 + 472) >> 6) & 0x3FFFFFFFFFFFFF8))
                              + 8 * (*(_QWORD *)(a1 + 472) & 0x1FFLL));
    ++*(_QWORD *)(a1 + 472);
    *(_QWORD *)(a1 + 480) = v7 - 1;
    std::deque<std::atomic<DiskImage::Context *>>::__maybe_remove_front_spare[abi:ne180100](a1 + 440, 1);
    ref::Allocator<CurrentReader,unsigned long long>::insert_elem(a1, v8, a2, v13);
    ref::tagged_ptr<CurrentReader,unsigned long long>::operator=(&v12, v13);
    ref::tagged_ptr<CurrentReader,unsigned long long>::reset(v13);
  }
  else
  {
    v8 = 0;
  }
  std::mutex::unlock(v6);
  v9 = atomic_load((unint64_t *)(a1 + 576));
  if (v9 + v7 >= *(_QWORD *)(a1 + 432))
  {
    ref::Allocator<CurrentReader,unsigned long long>::run_failed_dtors_list(a1, 0, 0, 0);
  }
  else
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 0x40000000;
    v13[2] = (unint64_t)___ZN3ref9AllocatorI13CurrentReaderyE9evict_lruEv_block_invoke;
    v13[3] = (unint64_t)&__block_descriptor_tmp_23;
    v13[4] = a1;
    gcd::gcd_queue::async((dispatch_queue_t *)(a1 + 712), v13);
  }
  *a3 = v8;
  a3[1] = 0;
  do
    v10 = __ldaxr(&v12);
  while (__stlxr(0, &v12));
  atomic_store(v10, (unint64_t *)a3 + 1);
  return ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&v12);
}

void sub_212FD5FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9)
{
  std::mutex *v9;

  std::mutex::unlock(v9);
  ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&a9);
  _Unwind_Resume(a1);
}

unint64_t ref::Allocator<CurrentReader,unsigned long long>::extract_min(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  v1 = atomic_load(a1 + 71);
  v2 = a1[53];
  if (!v2)
    return 0;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = a1[69];
    v7 = *(_QWORD *)(v6 + 8 * v3);
    if (v7 && v1 - *(_QWORD *)(v7 + 312) != -1)
    {
      v5 = *(_QWORD *)(v6 + 8 * v3);
      v4 = v3;
    }
    ++v3;
  }
  while (v2 != v3);
  if (!v5)
    return 0;
  v8 = (unint64_t *)(a1[69] + 8 * v4);
  do
  {
    v9 = __ldaxr(v8);
    if (v9 != v5)
    {
      __clrex();
      return 0;
    }
  }
  while (__stlxr(0, v8));
  if ((ref::Allocator<CurrentReader,unsigned long long>::drop_elem((uint64_t)a1, v5, 0x101uLL, 0) & 1) == 0)
    return 0;
  return v5;
}

unint64_t *ref::Allocator<CurrentReader,unsigned long long>::insert_elem@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v15;
  unint64_t v17;

  ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::mark_used((uint64_t)a2, a3);
  v7 = a2 + 1;
  v17 = 0;
  v8 = atomic_load(a2 + 1);
  if (!v8)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_11;
  }
  while (1)
  {
    v9 = __ldaxr(v7);
    if (v9 != v8)
    {
      __clrex();
      goto LABEL_6;
    }
    if (!__stlxr(v8 + 1, v7))
      break;
LABEL_6:
    v8 = v9;
    if (!v9)
      goto LABEL_7;
  }
  v10 = (unint64_t *)a2[38];
  if (v10)
  {
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
    a2[39] = v11;
  }
LABEL_11:
  atomic_store((unint64_t)v7, &v17);
  if (*(_QWORD *)(a1 + 424))
  {
    v12 = 0;
    while (2)
    {
      v13 = (unint64_t *)(*(_QWORD *)(a1 + 552) + 8 * v12);
      while (!__ldaxr(v13))
      {
        if (!__stlxr((unint64_t)a2, v13))
        {
          *a4 = 0;
          do
            v15 = __ldaxr(&v17);
          while (__stlxr(0, &v17));
          atomic_store(v15, a4);
          return ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&v17);
        }
      }
      __clrex();
      if (*(_QWORD *)(a1 + 424) > (unint64_t)++v12)
        continue;
      break;
    }
  }
  *a4 = 0;
  return ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&v17);
}

unint64_t *ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr(unint64_t *a1, unint64_t *a2, int a3)
{
  unint64_t *v3;
  unint64_t v5;
  unint64_t v6;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v3 = a2;
  *a1 = 0;
  if (!a2)
    goto LABEL_9;
  v5 = atomic_load(a2);
  if (!v5)
    goto LABEL_8;
  while (1)
  {
    v6 = __ldaxr(a2);
    if (v6 != v5)
    {
      __clrex();
      goto LABEL_7;
    }
    if (!__stlxr(v5 + 1, a2))
      break;
LABEL_7:
    v5 = v6;
    if (!v6)
      goto LABEL_8;
  }
  v8 = (unint64_t *)a2[37];
  if (v8)
  {
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
    a2[38] = v9;
  }
  if (a3 && !ref::details::ctrl_blk<CurrentReader,unsigned long long>::wait_for_ready((uint64_t)a2))
  {
    do
      v10 = __ldaxr(v3);
    while (__stlxr(v10 - 1, v3));
    if (v10 == 1)
    {
      v11 = v3[4];
      v3[4] = -1;
      ref::details::ctrl_blk<CurrentReader,unsigned long long>::reset_val((uint64_t)v3, v11, 1u);
    }
LABEL_8:
    v3 = 0;
  }
LABEL_9:
  atomic_store((unint64_t)v3, a1);
  return a1;
}

BOOL std::condition_variable::wait_until<std::chrono::steady_clock,std::chrono::duration<long long,std::ratio<1l,1000000000l>>,ref::Allocator<CurrentReader,unsigned long long>::add_tag(unsigned long long,BOOL)::{lambda(void)#1}>(std::condition_variable *a1, std::unique_lock<std::mutex> *a2, std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep *a3, uint64_t a4)
{
  uint64_t v8;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v9;
  std::chrono::steady_clock::time_point v10;
  std::chrono::system_clock::time_point v11;
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v12;
  std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v13;
  uint64_t v14;

  do
  {
    if ((*(_DWORD *)(**(_QWORD **)a4 + 336) & 1) != 0)
      return 1;
    v8 = *(_QWORD *)(a4 + 8);
    if (*(_QWORD *)v8)
    {
      if (!*(_BYTE *)(*(_QWORD *)v8 + 312) && *(_QWORD *)(*(_QWORD *)v8 + 32) == **(_QWORD **)(a4 + 16))
        return 1;
    }
    if (*a3 <= std::chrono::steady_clock::now().__d_.__rep_)
      break;
    v9 = *a3;
    v10.__d_.__rep_ = v9 - std::chrono::steady_clock::now().__d_.__rep_;
    if (v10.__d_.__rep_ >= 1)
    {
      std::chrono::steady_clock::now();
      v11.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
      if (v11.__d_.__rep_)
      {
        if (v11.__d_.__rep_ < 1)
        {
          if ((unint64_t)v11.__d_.__rep_ < 0xFFDF3B645A1CAC09)
          {
            v12 = 0x8000000000000000;
            goto LABEL_17;
          }
        }
        else if ((unint64_t)v11.__d_.__rep_ > 0x20C49BA5E353F7)
        {
          v12 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_15;
        }
        v12 = 1000 * v11.__d_.__rep_;
      }
      else
      {
        v12 = 0;
      }
LABEL_15:
      if (v12 > (v10.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
      {
        v13.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:
        std::condition_variable::__do_timed_wait(a1, a2, v13);
        std::chrono::steady_clock::now();
        continue;
      }
LABEL_17:
      v13.__d_.__rep_ = v12 + v10.__d_.__rep_;
      goto LABEL_18;
    }
  }
  while (std::chrono::steady_clock::now().__d_.__rep_ < *a3);
  if ((*(_DWORD *)(**(_QWORD **)a4 + 336) & 1) != 0)
    return 1;
  v14 = *(_QWORD *)(a4 + 8);
  return *(_QWORD *)v14
      && !*(_BYTE *)(*(_QWORD *)v14 + 312)
      && *(_QWORD *)(*(_QWORD *)v14 + 32) == **(_QWORD **)(a4 + 16);
}

uint64_t ___ZN3ref9AllocatorI13CurrentReaderyE9evict_lruEv_block_invoke(uint64_t a1)
{
  _QWORD *v1;
  unint64_t min;

  v1 = *(_QWORD **)(a1 + 32);
  min = ref::Allocator<CurrentReader,unsigned long long>::extract_min(v1);
  if (min)
    ref::Allocator<CurrentReader,unsigned long long>::add_to_free_pool((uint64_t)v1, min);
  return ref::Allocator<CurrentReader,unsigned long long>::run_failed_dtors_list((uint64_t)v1, 0, 0, 0);
}

unint64_t *ref::details::tagged_allocated_type<CurrentReader,unsigned long long>::mark_used(uint64_t a1, uint64_t a2)
{
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t *result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;

  atomic_store(0, (unsigned int *)(a1 + 336));
  v3 = (unint64_t *)(a1 + 8);
  ref::details::ctrl_blk<CurrentReader,unsigned long long>::init(a1 + 8, a2);
  v12 = 0;
  v4 = atomic_load(v3);
  if (!v4)
    goto LABEL_11;
  while (1)
  {
    v5 = __ldaxr(v3);
    if (v5 != v4)
    {
      __clrex();
      goto LABEL_6;
    }
    if (!__stlxr(v4 + 1, v3))
      break;
LABEL_6:
    v4 = v5;
    if (!v5)
      goto LABEL_11;
  }
  v6 = *(unint64_t **)(a1 + 304);
  v4 = (unint64_t)v3;
  if (v6)
  {
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    *(_QWORD *)(a1 + 312) = v7;
    v4 = (unint64_t)v3;
  }
LABEL_11:
  atomic_store(v4, &v12);
  ref::tagged_ptr<CurrentReader,unsigned long long>::operator=((unint64_t *)(a1 + 328), &v12);
  result = ref::tagged_ptr<CurrentReader,unsigned long long>::reset(&v12);
  do
  {
    v9 = __ldaxr(v3);
    v10 = v9 - 1;
  }
  while (__stlxr(v10, v3));
  if (!v10)
  {
    v11 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = -1;
    return (unint64_t *)ref::details::ctrl_blk<CurrentReader,unsigned long long>::reset_val((uint64_t)v3, v11, 1u);
  }
  return result;
}

uint64_t ref::details::ctrl_blk<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char>,unsigned long long>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;

  *(_QWORD *)(a1 + 304) = **(_QWORD **)(a1 + 296);
  v6 = a1 + 40;
  std::__optional_destruct_base<CurrentReader,false>::reset[abi:ne180100](a1 + 40);
  std::construct_at[abi:ne180100]<CurrentReader,std::shared_ptr<char>,unsigned long long,CurrentReader*>(v6, a2, a3);
  *(_BYTE *)(a1 + 192) = 1;
  atomic_store(2u, (unsigned int *)(a1 + 24));
  return ref::details::ctrl_blk<CurrentReader,unsigned long long>::notify_ready(a1);
}

void sub_212FD6598(void *a1)
{
  uint64_t v1;

  __cxa_begin_catch(a1);
  atomic_store(0, (unsigned int *)(v1 + 24));
  *(_BYTE *)(v1 + 312) = 1;
  ref::details::ctrl_blk<CurrentReader,unsigned long long>::notify_ready(v1);
  __cxa_rethrow();
}

void sub_212FD65BC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t ref::details::ctrl_blk<CurrentReader,unsigned long long>::notify_ready(uint64_t result)
{
  if (atomic_load((unint64_t *)(result + 8)))
    return MEMORY[0x2199A88E0](result + 24);
  return result;
}

uint64_t std::construct_at[abi:ne180100]<CurrentReader,std::shared_ptr<char>,unsigned long long,CurrentReader*>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v4 = *a2;
  v5 = (std::__shared_weak_count *)a2[1];
  *a2 = 0;
  a2[1] = 0;
  v6 = *a3;
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = 1018212795;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 850045863;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 125) = 0u;
  *(_DWORD *)(a1 + 144) = -1;
  if (v5)
  {
    v9 = (unint64_t *)&v5->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return a1;
}

uint64_t ref::details::ctrl_blk<CurrentReader,unsigned long long>::make_value<std::shared_ptr<char> const&,unsigned long long>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;

  *(_QWORD *)(a1 + 304) = **(_QWORD **)(a1 + 296);
  v6 = a1 + 40;
  std::__optional_destruct_base<CurrentReader,false>::reset[abi:ne180100](a1 + 40);
  std::construct_at[abi:ne180100]<CurrentReader,std::shared_ptr<char> const&,unsigned long long,CurrentReader*>(v6, a2, a3);
  *(_BYTE *)(a1 + 192) = 1;
  atomic_store(2u, (unsigned int *)(a1 + 24));
  return ref::details::ctrl_blk<CurrentReader,unsigned long long>::notify_ready(a1);
}

void sub_212FD6714(void *a1)
{
  uint64_t v1;

  __cxa_begin_catch(a1);
  atomic_store(0, (unsigned int *)(v1 + 24));
  *(_BYTE *)(v1 + 312) = 1;
  ref::details::ctrl_blk<CurrentReader,unsigned long long>::notify_ready(v1);
  __cxa_rethrow();
}

void sub_212FD6738(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:ne180100]<CurrentReader,std::shared_ptr<char> const&,unsigned long long,CurrentReader*>(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  v4 = *a2;
  v5 = (std::__shared_weak_count *)a2[1];
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
    v8 = *a3;
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v5;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  else
  {
    v8 = *a3;
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = 0;
  }
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = 1018212795;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 850045863;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 125) = 0u;
  *(_DWORD *)(a1 + 144) = -1;
  if (v5)
  {
    v10 = (unint64_t *)&v5->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return a1;
}

void std::allocate_shared[abi:ne180100]<readSynchronizer,std::allocator<readSynchronizer>,readSynchronizer&,std::shared_ptr<Backend> const&,void>(_QWORD *a1@<X1>, _QWORD *a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;

  v6 = operator new(0x68uLL);
  std::__shared_ptr_emplace<readSynchronizer>::__shared_ptr_emplace[abi:ne180100]<readSynchronizer&,std::shared_ptr<Backend> const&,std::allocator<readSynchronizer>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  std::shared_ptr<PurgeableFileBackend>::__enable_weak_this[abi:ne180100]<Backend,PurgeableFileBackend,void>((uint64_t)a3, v6 + 4, (uint64_t)(v6 + 3));
}

void sub_212FD6868(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<readSynchronizer>::__shared_ptr_emplace[abi:ne180100]<readSynchronizer&,std::shared_ptr<Backend> const&,std::allocator<readSynchronizer>,0>(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24CEEF670;
  readSynchronizer::readSynchronizer((uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_212FD68B0(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

uint64_t readSynchronizer::readSynchronizer(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  BackendInternalBackend::BackendInternalBackend((Backend *)a1, a3);
  *v5 = &off_24CF152A8;
  v6 = a2[6];
  v5[5] = a2[5];
  v5[6] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  v9 = a2[8];
  *(_QWORD *)(a1 + 56) = a2[7];
  *(_QWORD *)(a1 + 64) = v9;
  if (v9)
  {
    v10 = (unint64_t *)(v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  ref::tagged_ptr<CurrentReader,unsigned long long>::tagged_ptr((unint64_t *)(a1 + 72), a2 + 9);
  return a1;
}

void sub_212FD695C(_Unwind_Exception *a1)
{
  BackendInternalBackend *v1;
  uint64_t v2;
  uint64_t v3;

  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v3);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v2);
  BackendInternalBackend::~BackendInternalBackend(v1);
  _Unwind_Resume(a1);
}

uint64_t sg_vec_ns::details::buffer_iterator::make_value@<X0>(uint64_t this@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;

  if (*(_QWORD *)(this + 24) == *(_QWORD *)(this + 16))
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return this;
  }
  v3 = **(_QWORD **)this + *(_QWORD *)(this + 32);
  if (*(_QWORD *)(this + 56))
    v4 = a2 == 0;
  else
    v4 = 0;
  if (!v4)
  {
    v5 = *(_QWORD *)(*(_QWORD *)this + 8);
    if (!v5)
      goto LABEL_12;
LABEL_10:
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
    goto LABEL_12;
  }
  v5 = *(_QWORD *)(this + 64);
  if (v5)
    goto LABEL_10;
LABEL_12:
  *(_QWORD *)a3 = v3;
  *(_QWORD *)(a3 + 8) = v5;
  v8 = *(_QWORD *)(this + 32);
  v9 = *(_QWORD *)(*(_QWORD *)this + 16) - v8;
  if (v9 >= *(_QWORD *)(this + 24) - *(_QWORD *)(this + 16))
    v9 = *(_QWORD *)(this + 24) - *(_QWORD *)(this + 16);
  v10 = **(_QWORD **)(this + 8);
  v11 = v10 >= v8;
  v12 = v10 - v8;
  if (!v11)
    v12 = 0;
  *(_QWORD *)(a3 + 16) = v9;
  *(_QWORD *)(a3 + 24) = v12;
  return this;
}

sg_vec_ns::details::buffer_iterator *sg_vec_ns::details::buffer_iterator::buffer_iterator(sg_vec_ns::details::buffer_iterator *this, _QWORD *a2, unint64_t **a3, unint64_t a4, unint64_t a5, unint64_t a6, char a7)
{
  unint64_t v8;
  unint64_t *v9;
  char *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  __int128 v15[2];

  v8 = 0;
  *(_QWORD *)this = *a2;
  v9 = *a3;
  *((_QWORD *)this + 7) = 0;
  v10 = (char *)this + 56;
  *((_QWORD *)this + 1) = v9;
  *((_QWORD *)this + 2) = a4;
  *((_QWORD *)this + 3) = a5;
  *((_QWORD *)this + 4) = a6;
  *((_BYTE *)this + 48) = a7;
  *((_QWORD *)this + 8) = 0;
  if (a4 < a5)
  {
    v8 = **a3;
    if (v8 >= a6)
      v8 = a6;
  }
  *((_QWORD *)this + 5) = v8;
  sg_vec_ns::details::buffer_iterator::make_value((uint64_t)this, 1, (uint64_t)v15);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)v10, v15);
  *(_OWORD *)((char *)this + 72) = v15[1];
  v11 = (std::__shared_weak_count *)*((_QWORD *)&v15[0] + 1);
  if (*((_QWORD *)&v15[0] + 1))
  {
    v12 = (unint64_t *)(*((_QWORD *)&v15[0] + 1) + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  return this;
}

sg_vec_ns::details::buffer_iterator *sg_vec_ns::details::buffer_iterator::operator++(sg_vec_ns::details::buffer_iterator *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  __int128 v11[2];

  v2 = *((_QWORD *)this + 2);
  v3 = *((_QWORD *)this + 3);
  if (v2 != v3)
  {
    v4 = *((_QWORD *)this + 1);
    v5 = *(_QWORD *)(*(_QWORD *)this + 16) + v2 - *((_QWORD *)this + 4);
    v6 = *(_QWORD *)this + 24;
    *((_QWORD *)this + 4) = 0;
    *((_QWORD *)this + 5) = 0;
    *(_QWORD *)this = v6;
    *((_QWORD *)this + 1) = v4 + 8;
    *((_QWORD *)this + 2) = v5;
  }
  sg_vec_ns::details::buffer_iterator::make_value((uint64_t)this, v2 != v3, (uint64_t)v11);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)this + 56, v11);
  *(_OWORD *)((char *)this + 72) = v11[1];
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v11[0] + 1);
  if (*((_QWORD *)&v11[0] + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v11[0] + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return this;
}

sg_vec_ns::details::buffer_iterator *sg_vec_ns::details::buffer_iterator::operator+=(sg_vec_ns::details::buffer_iterator *this, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  _BOOL4 v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  __int128 v17[2];

  if (a2)
  {
    v3 = *((_QWORD *)this + 2);
    v4 = *((_QWORD *)this + 3) - v3;
    if (*(_QWORD *)(*(_QWORD *)this + 16) - *((_QWORD *)this + 4) < v4)
      v4 = *(_QWORD *)(*(_QWORD *)this + 16) - *((_QWORD *)this + 4);
    v5 = v4 <= a2;
    if (v4 <= a2)
    {
      v6 = *((unsigned __int8 *)this + 48);
      v7 = *((_QWORD *)this + 1) + 8;
      v8 = *(_QWORD *)this + 24;
      do
      {
        v9 = v7;
        v10 = v8;
        if (v6)
        {
          *(_QWORD *)(v7 - 8) = *((_QWORD *)this + 5) + v4;
          v3 = *((_QWORD *)this + 2);
        }
        *((_QWORD *)this + 4) = 0;
        *((_QWORD *)this + 5) = 0;
        v3 += v4;
        *((_QWORD *)this + 2) = v3;
        a2 -= v4;
        if (!a2)
          break;
        v4 = *(_QWORD *)(v8 + 16);
        if (v4 >= *((_QWORD *)this + 3) - v3)
          v4 = *((_QWORD *)this + 3) - v3;
        v7 += 8;
        v8 += 24;
        v11 = v4 > a2;
        if (v4 >= a2)
          v4 = a2;
      }
      while (!v11);
      *(_QWORD *)this = v10;
      *((_QWORD *)this + 1) = v9;
    }
  }
  else
  {
    v5 = 0;
  }
  v12 = *((_QWORD *)this + 5) + a2;
  *((_QWORD *)this + 5) = v12;
  if (v12 && *((_BYTE *)this + 48))
    **((_QWORD **)this + 1) = v12;
  *((_QWORD *)this + 2) += a2;
  *((_QWORD *)this + 4) += a2;
  sg_vec_ns::details::buffer_iterator::make_value((uint64_t)this, v5, (uint64_t)v17);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)this + 56, v17);
  *(_OWORD *)((char *)this + 72) = v17[1];
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v17[0] + 1);
  if (*((_QWORD *)&v17[0] + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v17[0] + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return this;
}

{
  char v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  __int128 v22[2];

  v3 = 0;
  if (a2)
  {
    v4 = *((_QWORD *)this + 4);
    v5 = *((_QWORD *)this + 2);
    v6 = *((_QWORD *)this + 3);
    v7 = *((_QWORD *)this + 1) + 8;
    v8 = *(_QWORD *)this + 24;
    while (1)
    {
      v9 = v6 - v5;
      if (*(_QWORD *)(v8 - 8) - v4 < v6 - v5)
        v9 = *(_QWORD *)(v8 - 8) - v4;
      v10 = *(_QWORD *)(v7 - 8);
      v11 = v10 >= v4;
      v12 = v10 - v4;
      v13 = v11 ? v12 : 0;
      v14 = v13 >= v9 ? v9 : v13;
      if (v14 >= a2 && (v9 > v13 || a2 != v14))
        break;
      v4 = 0;
      v5 += v9;
      *((_QWORD *)this + 1) = v7;
      *((_QWORD *)this + 2) = v5;
      *(_QWORD *)this = v8;
      if (a2 >= v14)
        v16 = a2 - v14;
      else
        v16 = 0;
      v7 += 8;
      *((_QWORD *)this + 4) = 0;
      *((_QWORD *)this + 5) = 0;
      v3 = 1;
      v8 += 24;
      v11 = v14 >= a2;
      a2 = v16;
      if (v11)
        goto LABEL_22;
    }
    v17 = *((_QWORD *)this + 5) + a2;
    *((_QWORD *)this + 2) = v5 + a2;
    *((_QWORD *)this + 4) = v4 + a2;
    *((_QWORD *)this + 5) = v17;
  }
LABEL_22:
  sg_vec_ns::details::buffer_iterator::make_value((uint64_t)this, v3 & 1, (uint64_t)v22);
  std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)this + 56, v22);
  *(_OWORD *)((char *)this + 72) = v22[1];
  v18 = (std::__shared_weak_count *)*((_QWORD *)&v22[0] + 1);
  if (*((_QWORD *)&v22[0] + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&v22[0] + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  return this;
}

_QWORD *sg_vec_ns::details::buffer_iterator::rtrim_written(_QWORD *this)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = this[2];
  if (v1 != this[3])
  {
    v2 = this[4];
    v3 = (_QWORD *)this[1];
    v4 = (uint64_t *)(*this + 16);
    do
    {
      *v3++ = v2;
      v5 = *v4;
      v4 += 3;
      v6 = this[3];
      v7 = v5 - v2;
      if (v7 >= v6 - v1)
        v7 = v6 - v1;
      v1 += v7;
      v2 = 0;
    }
    while (v1 != v6);
  }
  return this;
}

void sg_vec_ns::details::sg_vec_iterator::make_val(sg_vec_ns::details::sg_vec_iterator *this@<X0>, const sg_vec_ns::details::sg_vec_iterator *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;

  v6 = *((_QWORD *)this + 6);
  if (sg_vec_ns::details::sg_vec_iterator::operator==((uint64_t)this, (uint64_t)a2))
  {
    *(_OWORD *)(a3 + 25) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  else
  {
    sg_vec_ns::details::buffer_iterator::sync((sg_vec_ns::details::sg_vec_iterator *)((char *)this + 56));
    v7 = *((_QWORD *)this + 14);
    v8 = (std::__shared_weak_count *)*((_QWORD *)this + 15);
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
      v11 = *((_QWORD *)this + 16);
      v12 = *((_QWORD *)this + 18);
      v13 = *((_QWORD *)a2 + 18) - v12;
      if (v13 >= v11)
        v13 = *((_QWORD *)this + 16);
      do
        v14 = __ldxr(p_shared_owners);
      while (__stxr(v14 + 1, p_shared_owners));
      v15 = *(_BYTE *)(v6 + 200);
      *(_QWORD *)a3 = v7;
      *(_QWORD *)(a3 + 8) = v8;
      do
        v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
      *(_QWORD *)(a3 + 16) = v13;
      *(_QWORD *)(a3 + 24) = v12;
      *(_QWORD *)(a3 + 32) = v11;
      *(_BYTE *)(a3 + 40) = v15;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
      do
        v18 = __ldaxr(p_shared_owners);
      while (__stlxr(v18 - 1, p_shared_owners));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    else
    {
      v19 = *((_QWORD *)this + 16);
      v20 = *((_QWORD *)this + 18);
      v21 = *((_QWORD *)a2 + 18) - v20;
      if (v21 >= v19)
        v21 = *((_QWORD *)this + 16);
      v22 = *(_BYTE *)(v6 + 200);
      *(_QWORD *)a3 = v7;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = v21;
      *(_QWORD *)(a3 + 24) = v20;
      *(_QWORD *)(a3 + 32) = v19;
      *(_BYTE *)(a3 + 40) = v22;
    }
  }
}

BOOL sg_vec_ns::details::sg_vec_iterator::operator==(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _BOOL8 v3;
  BOOL v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  int v20;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;

  v2 = *(_QWORD **)(a1 + 48);
  if (v2 != *(_QWORD **)(a2 + 48))
    return 0;
  if (*(_BYTE *)(a1 + 152))
    v4 = *(_BYTE *)(a2 + 152) == 0;
  else
    v4 = 1;
  if (v4)
    return *(_QWORD *)(a1 + 144) == *(_QWORD *)(a2 + 144);
  v5 = (std::__shared_weak_count *)v2[27];
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v8 = v2[33];
  v9 = v2[34];
  v10 = v2[35];
  v11 = (std::__shared_weak_count *)v2[41];
  if (v11)
  {
    v12 = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  v14 = *(_QWORD *)(a1 + 56);
  v15 = v14 == v8 && *(_QWORD *)(a1 + 64) == v9 && *(_QWORD *)(a1 + 72) == v10;
  v17 = *(_QWORD *)(a2 + 56);
  v16 = *(_QWORD *)(a2 + 64);
  if (v17 == v8 && v16 == v9)
  {
    v20 = v15 ^ (*(_QWORD *)(a2 + 72) != v10);
    if (v14 != v8 || v20 == 0)
      goto LABEL_34;
  }
  else
  {
    v19 = v14 != v17 || v15;
    if ((v19 & 1) != 0)
      goto LABEL_34;
  }
  if (*(_QWORD *)(a1 + 64) == v16 && *(_QWORD *)(a1 + 72) == *(_QWORD *)(a2 + 72))
  {
    v3 = *(_QWORD *)(a1 + 144) == *(_QWORD *)(a2 + 144);
    goto LABEL_35;
  }
LABEL_34:
  v3 = 0;
LABEL_35:
  if (v11)
  {
    v22 = (unint64_t *)&v11->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (v5)
  {
    v24 = (unint64_t *)&v5->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v3;
}

double sg_vec_ref::end@<D0>(sg_vec_ref *this@<X0>, uint64_t a2@<X8>)
{
  double result;

  *(_QWORD *)&result = sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator(a2, (uint64_t)this + 208).n128_u64[0];
  return result;
}

void sg_vec_ref::sg_vec_ref(sg_vec_ref *this, const sg_vec_ns::details::buffer_iterator *a2, const sg_vec_ns::details::buffer_iterator *a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v7;
  const sg_vec_ns::details::buffer_iterator *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;

  v7 = *((_QWORD *)a3 + 2);
  *((_QWORD *)this + 1) = *(_QWORD *)a2;
  v8 = (sg_vec_ref *)((char *)this + 8);
  v9 = *((_QWORD *)a2 + 1);
  *(_QWORD *)this = v7 - *((_QWORD *)a2 + 2);
  *((_QWORD *)this + 2) = v9;
  v10 = *((_OWORD *)a2 + 1);
  v11 = *((_OWORD *)a2 + 2);
  *((_BYTE *)this + 56) = *((_BYTE *)a2 + 48);
  *(_OWORD *)((char *)this + 40) = v11;
  *(_OWORD *)((char *)this + 24) = v10;
  v12 = *((_QWORD *)a2 + 8);
  *((_QWORD *)this + 8) = *((_QWORD *)a2 + 7);
  *((_QWORD *)this + 9) = v12;
  if (v12)
  {
    v13 = (unint64_t *)(v12 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  *((_OWORD *)this + 5) = *(_OWORD *)((char *)a2 + 72);
  *((_QWORD *)this + 12) = *(_QWORD *)a3;
  *((_QWORD *)this + 13) = *((_QWORD *)a3 + 1);
  v15 = *((_OWORD *)a3 + 1);
  v16 = *((_OWORD *)a3 + 2);
  *((_BYTE *)this + 144) = *((_BYTE *)a3 + 48);
  *((_OWORD *)this + 7) = v15;
  *((_OWORD *)this + 8) = v16;
  v17 = *((_QWORD *)a3 + 8);
  *((_QWORD *)this + 19) = *((_QWORD *)a3 + 7);
  *((_QWORD *)this + 20) = v17;
  if (v17)
  {
    v18 = (unint64_t *)(v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  *(_OWORD *)((char *)this + 168) = *(_OWORD *)((char *)a3 + 72);
  *((_QWORD *)this + 23) = a4;
  *((_QWORD *)this + 24) = a5;
  *((_BYTE *)this + 200) = a6;
  sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator((sg_vec_ref *)((char *)this + 208), this, (sg_vec_ref *)((char *)this + 96), 0);
  sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator((sg_vec_ref *)((char *)this + 368), this, v8, 1);
}

void sub_212FD729C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v2 + 320);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v4);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v3);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t sg_vec_ref::sg_vec_ref(uint64_t a1, uint64_t *a2, uint64_t *a3, unint64_t **a4, unint64_t **a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v12 = *a2;
  v13 = *a3;
  if (*a2 == *a3)
  {
    v14 = 0;
  }
  else
  {
    v14 = 0;
    do
    {
      v15 = *(std::__shared_weak_count **)(v12 + 8);
      if (v15)
      {
        p_shared_owners = (unint64_t *)&v15->__shared_owners_;
        do
          v17 = __ldxr(p_shared_owners);
        while (__stxr(v17 + 1, p_shared_owners));
        v18 = *(_QWORD *)(v12 + 16);
        do
          v19 = __ldaxr(p_shared_owners);
        while (__stlxr(v19 - 1, p_shared_owners));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
          std::__shared_weak_count::__release_weak(v15);
        }
      }
      else
      {
        v18 = *(_QWORD *)(v12 + 16);
      }
      v14 += v18;
      v12 += 24;
    }
    while (v12 != v13);
  }
  *(_QWORD *)a1 = v14;
  sg_vec_ns::details::buffer_iterator::buffer_iterator((sg_vec_ns::details::buffer_iterator *)(a1 + 8), a2, a4, 0, v14, 0, 1);
  sg_vec_ns::details::buffer_iterator::buffer_iterator((sg_vec_ns::details::buffer_iterator *)(a1 + 96), a3, a5, *(_QWORD *)a1, *(_QWORD *)a1, 0, 1);
  *(_QWORD *)(a1 + 184) = a6;
  *(_QWORD *)(a1 + 192) = a7;
  *(_BYTE *)(a1 + 200) = 0;
  sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator((sg_vec_ns::details::sg_vec_iterator *)(a1 + 208), (sg_vec_ref *)a1, (const sg_vec_ns::details::buffer_iterator *)(a1 + 96), 0);
  sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator((sg_vec_ns::details::sg_vec_iterator *)(a1 + 368), (sg_vec_ref *)a1, (const sg_vec_ns::details::buffer_iterator *)(a1 + 8), 1);
  return a1;
}

void sub_212FD743C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v1 + 320);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v1 + 152);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v1 + 64);
  _Unwind_Resume(a1);
}

double sg_vec_ref::begin@<D0>(sg_vec_ref *this@<X0>, uint64_t a2@<X8>)
{
  double result;

  *(_QWORD *)&result = sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator(a2, (uint64_t)this + 368).n128_u64[0];
  return result;
}

void sg_vec_ref::subvec(sg_vec_ref *this@<X0>, const sg_vec_ns::details::sg_vec_iterator *a2@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  __int128 *v13;
  __int128 v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  _BOOL4 v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  _OWORD *v24;
  __int128 *v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  __int128 v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  __int128 v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  __n128 v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  std::__shared_weak_count *v51;
  unint64_t *v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t *v57;
  unint64_t v58;
  __int128 v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  __int128 v66;
  std::__shared_weak_count *v67;
  unint64_t *v68;
  unint64_t v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  std::__shared_weak_count *v73;
  unint64_t *v74;
  unint64_t v75;
  std::__shared_weak_count *v76;
  unint64_t *v77;
  unint64_t v78;
  unint64_t *v79;
  uint64_t v80;
  unint64_t *v81;
  unint64_t v82;
  std::__shared_weak_count *v83;
  unint64_t *v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  std::__shared_weak_count *v89;
  unint64_t *v90;
  unint64_t v91;
  __int128 v92;
  std::__shared_weak_count *v93;
  unint64_t *v94;
  unint64_t v95;
  __int128 v96;
  std::__shared_weak_count *v97;
  unint64_t *v98;
  unint64_t v99;
  std::__shared_weak_count *v100;
  unint64_t *v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t *v104;
  unint64_t v105;
  __int128 v106;
  std::__shared_weak_count *v107;
  unint64_t *v108;
  unint64_t v109;
  std::__shared_weak_count *v110;
  unint64_t *v111;
  unint64_t v112;
  __int128 v113;
  std::__shared_weak_count *v114;
  unint64_t *v115;
  unint64_t v116;
  unint64_t v117;
  std::__shared_weak_count *v118;
  unint64_t *v119;
  unint64_t v120;
  std::__shared_weak_count *v121;
  unint64_t *v122;
  unint64_t v123;
  unint64_t *v124;
  __n128 *v125;
  __int128 v126;
  _OWORD v127[2];
  uint64_t v128;
  std::__shared_weak_count *v129;
  _OWORD v130[2];
  uint64_t v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  char v135;
  uint64_t v136;
  std::__shared_weak_count *v137;
  __n128 v138;
  unint64_t v139;
  char v140;
  __int128 v141;
  _OWORD v142[2];
  uint64_t v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  char v147;
  uint64_t v148;
  std::__shared_weak_count *v149;
  __n128 v150;
  unint64_t v151;
  char v152;

  v10 = *((_QWORD *)this + 27);
  *(_QWORD *)&v141 = *((_QWORD *)this + 26);
  *((_QWORD *)&v141 + 1) = v10;
  if (v10)
  {
    v11 = (unint64_t *)(v10 + 8);
    do
      v12 = __ldxr(v11);
    while (__stxr(v12 + 1, v11));
  }
  v142[0] = *((_OWORD *)this + 14);
  *(_OWORD *)((char *)v142 + 9) = *(_OWORD *)((char *)this + 233);
  v13 = (__int128 *)((char *)this + 264);
  v144 = *(_OWORD *)((char *)this + 264);
  v14 = *(_OWORD *)((char *)this + 296);
  v145 = *(_OWORD *)((char *)this + 280);
  v143 = *((_QWORD *)this + 32);
  v147 = *((_BYTE *)this + 312);
  v146 = v14;
  v15 = (std::__shared_weak_count *)*((_QWORD *)this + 41);
  v148 = *((_QWORD *)this + 40);
  v149 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
  }
  v150 = *((__n128 *)this + 21);
  v151 = *((_QWORD *)this + 44);
  v152 = *((_BYTE *)this + 360);
  v18 = sg_vec_ns::details::sg_vec_iterator::operator==((uint64_t)a2, (uint64_t)&v141);
  if (v15)
  {
    v19 = (unint64_t *)&v15->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v21 = (std::__shared_weak_count *)*((_QWORD *)&v141 + 1);
  if (*((_QWORD *)&v141 + 1))
  {
    v22 = (unint64_t *)(*((_QWORD *)&v141 + 1) + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = (_OWORD *)((char *)this + 224);
  v25 = (__int128 *)((char *)this + 280);
  v125 = (__n128 *)((char *)this + 336);
  v26 = (uint64_t *)((char *)this + 352);
  if (v18)
  {
    v27 = *((_QWORD *)this + 27);
    *(_QWORD *)&v141 = *((_QWORD *)this + 26);
    *((_QWORD *)&v141 + 1) = v27;
    if (v27)
    {
      v28 = (unint64_t *)(v27 + 8);
      do
        v29 = __ldxr(v28);
      while (__stxr(v29 + 1, v28));
    }
    v142[0] = *v24;
    *(_OWORD *)((char *)v142 + 9) = *(_OWORD *)((char *)this + 233);
    v144 = *v13;
    v30 = *(_OWORD *)((char *)this + 296);
    v145 = *v25;
    v143 = *((_QWORD *)this + 32);
    v146 = v30;
    v147 = *((_BYTE *)this + 312);
    v31 = (std::__shared_weak_count *)*((_QWORD *)this + 41);
    v148 = *((_QWORD *)this + 40);
    v149 = v31;
    if (v31)
    {
      v32 = (unint64_t *)&v31->__shared_owners_;
      do
        v33 = __ldxr(v32);
      while (__stxr(v33 + 1, v32));
    }
    v150 = *v125;
    v151 = *v26;
    v152 = *((_BYTE *)this + 360);
    v34 = (std::__shared_weak_count *)*((_QWORD *)this + 27);
    v128 = *((_QWORD *)this + 26);
    v129 = v34;
    if (v34)
    {
      v35 = (unint64_t *)&v34->__shared_owners_;
      do
        v36 = __ldxr(v35);
      while (__stxr(v36 + 1, v35));
    }
    v130[0] = *v24;
    *(_OWORD *)((char *)v130 + 9) = *(_OWORD *)((char *)this + 233);
    v132 = *v13;
    v37 = *(_OWORD *)((char *)this + 296);
    v133 = *v25;
    v131 = *((_QWORD *)this + 32);
    v134 = v37;
    v135 = *((_BYTE *)this + 312);
    v38 = (std::__shared_weak_count *)*((_QWORD *)this + 41);
    v136 = *((_QWORD *)this + 40);
    v137 = v38;
    if (v38)
    {
      v39 = (unint64_t *)&v38->__shared_owners_;
      do
        v40 = __ldxr(v39);
      while (__stxr(v40 + 1, v39));
    }
    v138 = *v125;
    v139 = *v26;
    v140 = *((_BYTE *)this + 360);
    v41 = std::pair<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator>::pair[abi:ne180100]<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator,0>(a5, (uint64_t)&v141, (uint64_t)&v128);
    v42 = v137;
    if (v137)
    {
      v43 = (unint64_t *)&v137->__shared_owners_;
      do
        v44 = __ldaxr(v43);
      while (__stlxr(v44 - 1, v43));
      if (!v44)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v42->__on_zero_shared)(v42, v41);
        std::__shared_weak_count::__release_weak(v42);
      }
    }
    v45 = v129;
    if (v129)
    {
      v46 = (unint64_t *)&v129->__shared_owners_;
      do
        v47 = __ldaxr(v46);
      while (__stlxr(v47 - 1, v46));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v45->__on_zero_shared)(v45, v41);
        std::__shared_weak_count::__release_weak(v45);
      }
    }
    v48 = v149;
    if (v149)
    {
      v49 = (unint64_t *)&v149->__shared_owners_;
      do
        v50 = __ldaxr(v49);
      while (__stlxr(v50 - 1, v49));
      if (!v50)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v48->__on_zero_shared)(v48, v41);
        std::__shared_weak_count::__release_weak(v48);
      }
    }
    v51 = (std::__shared_weak_count *)*((_QWORD *)&v141 + 1);
    if (*((_QWORD *)&v141 + 1))
    {
      v52 = (unint64_t *)(*((_QWORD *)&v141 + 1) + 8);
      do
        v53 = __ldaxr(v52);
      while (__stlxr(v53 - 1, v52));
LABEL_144:
      if (!v53)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v51->__on_zero_shared)(v51, v41);
        std::__shared_weak_count::__release_weak(v51);
      }
    }
  }
  else
  {
    v54 = *((_QWORD *)this + 24);
    if (v54 + *((_QWORD *)this + 23) >= a3)
      v55 = a3;
    else
      v55 = v54 + *((_QWORD *)this + 23);
    if (v55 >= *((_QWORD *)a2 + 18))
    {
      v80 = *((_QWORD *)a2 + 1);
      *(_QWORD *)&v141 = *(_QWORD *)a2;
      *((_QWORD *)&v141 + 1) = v80;
      if (v80)
      {
        v81 = (unint64_t *)(v80 + 8);
        do
          v82 = __ldxr(v81);
        while (__stxr(v82 + 1, v81));
      }
      v142[0] = *((_OWORD *)a2 + 1);
      *(_OWORD *)((char *)v142 + 9) = *(_OWORD *)((char *)a2 + 25);
      v143 = *((_QWORD *)a2 + 6);
      v144 = *(_OWORD *)((char *)a2 + 56);
      v145 = *(_OWORD *)((char *)a2 + 72);
      v146 = *(_OWORD *)((char *)a2 + 88);
      v147 = *((_BYTE *)a2 + 104);
      v83 = (std::__shared_weak_count *)*((_QWORD *)a2 + 15);
      v148 = *((_QWORD *)a2 + 14);
      v149 = v83;
      if (v83)
      {
        v84 = (unint64_t *)&v83->__shared_owners_;
        do
          v85 = __ldxr(v84);
        while (__stxr(v85 + 1, v84));
      }
      v150 = *((__n128 *)a2 + 8);
      v151 = *((_QWORD *)a2 + 18);
      v152 = *((_BYTE *)a2 + 152);
      if (a4)
      {
        v86 = sg_vec_ns::length<written_bytes_t>(&v144, (uint64_t)this + 96);
        v87 = v86;
        if (v86 >= a4)
          v88 = a4;
        else
          v88 = v86;
        if (v88)
          sg_vec_ns::details::sg_vec_iterator::operator+=((uint64_t)&v141, v88);
        if (v87 < a4)
          sg_vec_ns::details::sg_vec_iterator::operator+=((uint64_t)&v141, a4 - v88);
      }
      v89 = (std::__shared_weak_count *)*((_QWORD *)this + 27);
      v128 = *((_QWORD *)this + 26);
      v129 = v89;
      if (v89)
      {
        v90 = (unint64_t *)&v89->__shared_owners_;
        do
          v91 = __ldxr(v90);
        while (__stxr(v91 + 1, v90));
      }
      v130[0] = *v24;
      *(_OWORD *)((char *)v130 + 9) = *(_OWORD *)((char *)this + 233);
      v132 = *v13;
      v92 = *(_OWORD *)((char *)this + 296);
      v133 = *v25;
      v131 = *((_QWORD *)this + 32);
      v134 = v92;
      v135 = *((_BYTE *)this + 312);
      v93 = (std::__shared_weak_count *)*((_QWORD *)this + 41);
      v136 = *((_QWORD *)this + 40);
      v137 = v93;
      if (v93)
      {
        v94 = (unint64_t *)&v93->__shared_owners_;
        do
          v95 = __ldxr(v94);
        while (__stxr(v95 + 1, v94));
      }
      v138 = *v125;
      v140 = *((_BYTE *)this + 360);
      v139 = v55;
      sg_vec_ns::details::sg_vec_iterator::make_val((sg_vec_ns::details::sg_vec_iterator *)&v141, (const sg_vec_ns::details::sg_vec_iterator *)&v128, (uint64_t)&v126);
      v96 = v126;
      v126 = 0uLL;
      v97 = (std::__shared_weak_count *)*((_QWORD *)&v141 + 1);
      v141 = v96;
      if (v97)
      {
        v98 = (unint64_t *)&v97->__shared_owners_;
        do
          v99 = __ldaxr(v98);
        while (__stlxr(v99 - 1, v98));
        if (!v99)
        {
          ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
          std::__shared_weak_count::__release_weak(v97);
        }
      }
      v142[0] = v127[0];
      *(_OWORD *)((char *)v142 + 9) = *(_OWORD *)((char *)v127 + 9);
      v100 = (std::__shared_weak_count *)*((_QWORD *)&v126 + 1);
      if (*((_QWORD *)&v126 + 1))
      {
        v101 = (unint64_t *)(*((_QWORD *)&v126 + 1) + 8);
        do
          v102 = __ldaxr(v101);
        while (__stlxr(v102 - 1, v101));
        if (!v102)
        {
          ((void (*)(std::__shared_weak_count *))v100->__on_zero_shared)(v100);
          std::__shared_weak_count::__release_weak(v100);
        }
      }
      v103 = *((_QWORD *)&v141 + 1);
      *(_QWORD *)a5 = v141;
      *(_QWORD *)(a5 + 8) = v103;
      if (v103)
      {
        v104 = (unint64_t *)(v103 + 8);
        do
          v105 = __ldxr(v104);
        while (__stxr(v105 + 1, v104));
      }
      *(_OWORD *)(a5 + 16) = v142[0];
      *(_OWORD *)(a5 + 25) = *(_OWORD *)((char *)v142 + 9);
      *(_OWORD *)(a5 + 56) = v144;
      v106 = v146;
      *(_OWORD *)(a5 + 72) = v145;
      *(_QWORD *)(a5 + 48) = v143;
      *(_OWORD *)(a5 + 88) = v106;
      *(_BYTE *)(a5 + 104) = v147;
      v107 = v149;
      *(_QWORD *)(a5 + 112) = v148;
      *(_QWORD *)(a5 + 120) = v107;
      if (v107)
      {
        v108 = (unint64_t *)&v107->__shared_owners_;
        do
          v109 = __ldxr(v108);
        while (__stxr(v109 + 1, v108));
      }
      *(__n128 *)(a5 + 128) = v150;
      *(_QWORD *)(a5 + 144) = v151;
      *(_BYTE *)(a5 + 152) = v152;
      v110 = v129;
      *(_QWORD *)(a5 + 160) = v128;
      *(_QWORD *)(a5 + 168) = v110;
      if (v110)
      {
        v111 = (unint64_t *)&v110->__shared_owners_;
        do
          v112 = __ldxr(v111);
        while (__stxr(v112 + 1, v111));
      }
      *(_OWORD *)(a5 + 176) = v130[0];
      *(_OWORD *)(a5 + 185) = *(_OWORD *)((char *)v130 + 9);
      *(_OWORD *)(a5 + 216) = v132;
      v113 = v134;
      *(_OWORD *)(a5 + 232) = v133;
      *(_QWORD *)(a5 + 208) = v131;
      *(_OWORD *)(a5 + 248) = v113;
      *(_BYTE *)(a5 + 264) = v135;
      v114 = v137;
      *(_QWORD *)(a5 + 272) = v136;
      *(_QWORD *)(a5 + 280) = v114;
      if (v114)
      {
        v115 = (unint64_t *)&v114->__shared_owners_;
        do
          v116 = __ldxr(v115);
        while (__stxr(v116 + 1, v115));
        v41 = v138;
        *(__n128 *)(a5 + 288) = v138;
        *(_QWORD *)(a5 + 304) = v139;
        *(_BYTE *)(a5 + 312) = v140;
        do
          v117 = __ldaxr(v115);
        while (__stlxr(v117 - 1, v115));
        if (!v117)
        {
          ((void (*)(std::__shared_weak_count *))v114->__on_zero_shared)(v114);
          std::__shared_weak_count::__release_weak(v114);
        }
      }
      else
      {
        v41 = v138;
        *(__n128 *)(a5 + 288) = v138;
        *(_QWORD *)(a5 + 304) = v139;
        *(_BYTE *)(a5 + 312) = v140;
      }
      v118 = v129;
      if (v129)
      {
        v119 = (unint64_t *)&v129->__shared_owners_;
        do
          v120 = __ldaxr(v119);
        while (__stlxr(v120 - 1, v119));
        if (!v120)
        {
          ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
          std::__shared_weak_count::__release_weak(v118);
        }
      }
      v121 = v149;
      if (v149)
      {
        v122 = (unint64_t *)&v149->__shared_owners_;
        do
          v123 = __ldaxr(v122);
        while (__stlxr(v123 - 1, v122));
        if (!v123)
        {
          ((void (*)(std::__shared_weak_count *))v121->__on_zero_shared)(v121);
          std::__shared_weak_count::__release_weak(v121);
        }
      }
      v51 = (std::__shared_weak_count *)*((_QWORD *)&v141 + 1);
      if (*((_QWORD *)&v141 + 1))
      {
        v124 = (unint64_t *)(*((_QWORD *)&v141 + 1) + 8);
        do
          v53 = __ldaxr(v124);
        while (__stlxr(v53 - 1, v124));
        goto LABEL_144;
      }
    }
    else
    {
      v56 = *((_QWORD *)this + 27);
      *(_QWORD *)&v141 = *((_QWORD *)this + 26);
      *((_QWORD *)&v141 + 1) = v56;
      if (v56)
      {
        v57 = (unint64_t *)(v56 + 8);
        do
          v58 = __ldxr(v57);
        while (__stxr(v58 + 1, v57));
      }
      v142[0] = *v24;
      *(_OWORD *)((char *)v142 + 9) = *(_OWORD *)((char *)this + 233);
      v144 = *v13;
      v59 = *(_OWORD *)((char *)this + 296);
      v145 = *v25;
      v143 = *((_QWORD *)this + 32);
      v146 = v59;
      v147 = *((_BYTE *)this + 312);
      v60 = (std::__shared_weak_count *)*((_QWORD *)this + 41);
      v148 = *((_QWORD *)this + 40);
      v149 = v60;
      if (v60)
      {
        v61 = (unint64_t *)&v60->__shared_owners_;
        do
          v62 = __ldxr(v61);
        while (__stxr(v62 + 1, v61));
      }
      v150 = *v125;
      v151 = *v26;
      v152 = *((_BYTE *)this + 360);
      v63 = (std::__shared_weak_count *)*((_QWORD *)this + 27);
      v128 = *((_QWORD *)this + 26);
      v129 = v63;
      if (v63)
      {
        v64 = (unint64_t *)&v63->__shared_owners_;
        do
          v65 = __ldxr(v64);
        while (__stxr(v65 + 1, v64));
      }
      v130[0] = *v24;
      *(_OWORD *)((char *)v130 + 9) = *(_OWORD *)((char *)this + 233);
      v132 = *v13;
      v66 = *(_OWORD *)((char *)this + 296);
      v133 = *v25;
      v131 = *((_QWORD *)this + 32);
      v134 = v66;
      v135 = *((_BYTE *)this + 312);
      v67 = (std::__shared_weak_count *)*((_QWORD *)this + 41);
      v136 = *((_QWORD *)this + 40);
      v137 = v67;
      if (v67)
      {
        v68 = (unint64_t *)&v67->__shared_owners_;
        do
          v69 = __ldxr(v68);
        while (__stxr(v69 + 1, v68));
      }
      v138 = *v125;
      v139 = *v26;
      v140 = *((_BYTE *)this + 360);
      v41 = std::pair<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator>::pair[abi:ne180100]<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator,0>(a5, (uint64_t)&v141, (uint64_t)&v128);
      v70 = v137;
      if (v137)
      {
        v71 = (unint64_t *)&v137->__shared_owners_;
        do
          v72 = __ldaxr(v71);
        while (__stlxr(v72 - 1, v71));
        if (!v72)
        {
          ((void (*)(std::__shared_weak_count *, __n128))v70->__on_zero_shared)(v70, v41);
          std::__shared_weak_count::__release_weak(v70);
        }
      }
      v73 = v129;
      if (v129)
      {
        v74 = (unint64_t *)&v129->__shared_owners_;
        do
          v75 = __ldaxr(v74);
        while (__stlxr(v75 - 1, v74));
        if (!v75)
        {
          ((void (*)(std::__shared_weak_count *, __n128))v73->__on_zero_shared)(v73, v41);
          std::__shared_weak_count::__release_weak(v73);
        }
      }
      v76 = v149;
      if (v149)
      {
        v77 = (unint64_t *)&v149->__shared_owners_;
        do
          v78 = __ldaxr(v77);
        while (__stlxr(v78 - 1, v77));
        if (!v78)
        {
          ((void (*)(std::__shared_weak_count *, __n128))v76->__on_zero_shared)(v76, v41);
          std::__shared_weak_count::__release_weak(v76);
        }
      }
      v51 = (std::__shared_weak_count *)*((_QWORD *)&v141 + 1);
      if (*((_QWORD *)&v141 + 1))
      {
        v79 = (unint64_t *)(*((_QWORD *)&v141 + 1) + 8);
        do
          v53 = __ldaxr(v79);
        while (__stlxr(v53 - 1, v79));
        goto LABEL_144;
      }
    }
  }
}

void sub_212FD7E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)&a51);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)&a37);
  _Unwind_Resume(a1);
}

uint64_t sg_vec_ns::length<written_bytes_t>(__int128 *a1, uint64_t a2)
{
  __int128 *v2;
  unint64_t v3;
  uint64_t v4;
  __int128 v6;
  __int128 v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  __int128 v21;

  v2 = a1 + 1;
  v3 = *(_QWORD *)(a2 + 16);
  if (*((_QWORD *)a1 + 2) > v3)
    return 0;
  v6 = *v2;
  v7 = a1[2];
  v15 = *a1;
  v16 = v6;
  v17 = v7;
  v18 = *((_BYTE *)a1 + 48);
  v8 = (std::__shared_weak_count *)*((_QWORD *)a1 + 8);
  v19 = *((_QWORD *)a1 + 7);
  v20 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
    v3 = *(_QWORD *)(a2 + 16);
  }
  v21 = *(__int128 *)((char *)a1 + 72);
  if ((unint64_t)v16 >= v3)
  {
    v4 = 0;
    if (!v8)
      return v4;
    goto LABEL_19;
  }
  v4 = 0;
  do
  {
    sg_vec_ns::details::buffer_iterator::sync((sg_vec_ns::details::buffer_iterator *)&v15);
    if (*(_QWORD *)(a2 + 16) - *(_QWORD *)v2 >= *((_QWORD *)&v21 + 1))
      v11 = *((_QWORD *)&v21 + 1);
    else
      v11 = *(_QWORD *)(a2 + 16) - *(_QWORD *)v2;
    if (v11)
      sg_vec_ns::details::buffer_iterator::operator+=((sg_vec_ns::details::buffer_iterator *)&v15, v11);
    else
      sg_vec_ns::details::buffer_iterator::operator++((sg_vec_ns::details::buffer_iterator *)&v15);
    v4 += v11;
  }
  while ((unint64_t)v16 < *(_QWORD *)(a2 + 16));
  v8 = v20;
  if (v20)
  {
LABEL_19:
    v12 = (unint64_t *)&v8->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v4;
}

void sub_212FD7FE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t sg_vec_ns::details::sg_vec_iterator::operator+=(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v20;
  std::__shared_weak_count *v21;
  _OWORD v22[2];
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  _OWORD v34[2];

  *(_QWORD *)(a1 + 144) += a2;
  sg_vec_ns::details::buffer_iterator::operator+=((sg_vec_ns::details::buffer_iterator *)(a1 + 56), a2);
  if (*(_QWORD *)(a1 + 80) != *(_QWORD *)(a1 + 72))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(std::__shared_weak_count **)(v3 + 216);
    v20 = *(_QWORD *)(v3 + 208);
    v21 = v4;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    v22[0] = *(_OWORD *)(v3 + 224);
    *(_OWORD *)((char *)v22 + 9) = *(_OWORD *)(v3 + 233);
    v23 = *(_QWORD *)(v3 + 256);
    v24 = *(_OWORD *)(v3 + 264);
    v27 = *(_BYTE *)(v3 + 312);
    v25 = *(_OWORD *)(v3 + 280);
    v26 = *(_OWORD *)(v3 + 296);
    v7 = *(std::__shared_weak_count **)(v3 + 328);
    v28 = *(_QWORD *)(v3 + 320);
    v29 = v7;
    if (v7)
    {
      v8 = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    v30 = *(_OWORD *)(v3 + 336);
    v31 = *(_QWORD *)(v3 + 352);
    v32 = *(_BYTE *)(v3 + 360);
    sg_vec_ns::details::sg_vec_iterator::make_val((sg_vec_ns::details::sg_vec_iterator *)a1, (const sg_vec_ns::details::sg_vec_iterator *)&v20, (uint64_t)&v33);
    std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100](a1, &v33);
    *(_OWORD *)(a1 + 16) = v34[0];
    *(_OWORD *)(a1 + 25) = *(_OWORD *)((char *)v34 + 9);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v33 + 1);
    if (*((_QWORD *)&v33 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v33 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = v29;
    if (v29)
    {
      v14 = (unint64_t *)&v29->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v16 = v21;
    if (v21)
    {
      v17 = (unint64_t *)&v21->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  return a1;
}

{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v20;
  std::__shared_weak_count *v21;
  _OWORD v22[2];
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  _OWORD v34[2];

  *(_QWORD *)(a1 + 144) += a2;
  sg_vec_ns::details::buffer_iterator::operator+=((sg_vec_ns::details::buffer_iterator *)(a1 + 56), a2);
  if (*(_QWORD *)(a1 + 80) != *(_QWORD *)(a1 + 72))
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(std::__shared_weak_count **)(v3 + 216);
    v20 = *(_QWORD *)(v3 + 208);
    v21 = v4;
    if (v4)
    {
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldxr(p_shared_owners);
      while (__stxr(v6 + 1, p_shared_owners));
    }
    v22[0] = *(_OWORD *)(v3 + 224);
    *(_OWORD *)((char *)v22 + 9) = *(_OWORD *)(v3 + 233);
    v23 = *(_QWORD *)(v3 + 256);
    v24 = *(_OWORD *)(v3 + 264);
    v27 = *(_BYTE *)(v3 + 312);
    v25 = *(_OWORD *)(v3 + 280);
    v26 = *(_OWORD *)(v3 + 296);
    v7 = *(std::__shared_weak_count **)(v3 + 328);
    v28 = *(_QWORD *)(v3 + 320);
    v29 = v7;
    if (v7)
    {
      v8 = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(v8);
      while (__stxr(v9 + 1, v8));
    }
    v30 = *(_OWORD *)(v3 + 336);
    v31 = *(_QWORD *)(v3 + 352);
    v32 = *(_BYTE *)(v3 + 360);
    sg_vec_ns::details::sg_vec_iterator::make_val((sg_vec_ns::details::sg_vec_iterator *)a1, (const sg_vec_ns::details::sg_vec_iterator *)&v20, (uint64_t)&v33);
    std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100](a1, &v33);
    *(_OWORD *)(a1 + 16) = v34[0];
    *(_OWORD *)(a1 + 25) = *(_OWORD *)((char *)v34 + 9);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v33 + 1);
    if (*((_QWORD *)&v33 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v33 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = v29;
    if (v29)
    {
      v14 = (unint64_t *)&v29->__shared_owners_;
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v16 = v21;
    if (v21)
    {
      v17 = (unint64_t *)&v21->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  return a1;
}

void sub_212FD81B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v9);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_212FD838C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v9);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sg_vec_ns::details::sg_vec_iterator::operator++(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v19;
  std::__shared_weak_count *v20;
  _OWORD v21[2];
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  __int128 v29;
  uint64_t v30;
  char v31;
  __int128 v32;
  _OWORD v33[2];

  sg_vec_ns::details::buffer_iterator::operator++((sg_vec_ns::details::buffer_iterator *)(a1 + 56));
  if (*(_QWORD *)(a1 + 80) != *(_QWORD *)(a1 + 72))
  {
    v2 = *(_QWORD *)(a1 + 48);
    v3 = *(std::__shared_weak_count **)(v2 + 216);
    v19 = *(_QWORD *)(v2 + 208);
    v20 = v3;
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }
    v21[0] = *(_OWORD *)(v2 + 224);
    *(_OWORD *)((char *)v21 + 9) = *(_OWORD *)(v2 + 233);
    v22 = *(_QWORD *)(v2 + 256);
    v23 = *(_OWORD *)(v2 + 264);
    v26 = *(_BYTE *)(v2 + 312);
    v24 = *(_OWORD *)(v2 + 280);
    v25 = *(_OWORD *)(v2 + 296);
    v6 = *(std::__shared_weak_count **)(v2 + 328);
    v27 = *(_QWORD *)(v2 + 320);
    v28 = v6;
    if (v6)
    {
      v7 = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
    v29 = *(_OWORD *)(v2 + 336);
    v30 = *(_QWORD *)(v2 + 352);
    v31 = *(_BYTE *)(v2 + 360);
    sg_vec_ns::details::sg_vec_iterator::make_val((sg_vec_ns::details::sg_vec_iterator *)a1, (const sg_vec_ns::details::sg_vec_iterator *)&v19, (uint64_t)&v32);
    std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100](a1, &v32);
    *(_OWORD *)(a1 + 16) = v33[0];
    *(_OWORD *)(a1 + 25) = *(_OWORD *)((char *)v33 + 9);
    v9 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
    if (*((_QWORD *)&v32 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    v12 = v28;
    if (v28)
    {
      v13 = (unint64_t *)&v28->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
    v15 = v20;
    if (v20)
    {
      v16 = (unint64_t *)&v20->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  return a1;
}

void sub_212FD8558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v9);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

BOOL sg_vec_ns::details::sg_vec_iterator::is_end_of_buffers(sg_vec_ns::details::sg_vec_iterator *this)
{
  return *((_QWORD *)this + 10) == *((_QWORD *)this + 9);
}

void sg_vec_ns::details::sg_vec_iterator::subvec(sg_vec_ns::details::sg_vec_iterator *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  unsigned int v7;
  unint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  __int128 *v26;
  __int128 v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  _BOOL4 v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  _OWORD *v37;
  __int128 *v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  __int128 v42;
  __int128 *v43;
  uint64_t *v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  __int128 v51;
  __int128 v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  __n128 v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  std::__shared_weak_count *v60;
  unint64_t *v61;
  unint64_t v62;
  std::__shared_weak_count *v63;
  unint64_t *v64;
  unint64_t v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  std::__shared_weak_count *v72;
  unint64_t *v73;
  unint64_t v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  sg_vec_ref *v87;
  unint64_t v88;
  uint64_t v89;
  const sg_vec_ns::details::sg_vec_iterator *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  std::__shared_weak_count *v94;
  _BYTE v95[25];
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  char v100;
  uint64_t v101;
  std::__shared_weak_count *v102;
  __int128 v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  std::__shared_weak_count *v107;
  _OWORD v108[2];
  uint64_t v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  char v113;
  uint64_t v114;
  std::__shared_weak_count *v115;
  __int128 v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  std::__shared_weak_count *v120;
  _OWORD v121[2];
  uint64_t v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  char v126;
  uint64_t v127;
  std::__shared_weak_count *v128;
  __int128 v129;
  uint64_t v130;
  char v131;

  v6 = *((_QWORD *)a1 + 3);
  v7 = *(unsigned __int8 *)(a2 + 16);
  if (v6 >= (unint64_t)(v7 & 1) + *(_QWORD *)(a2 + 8) - 1)
  {
    sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator(a4, a3);
    sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator(a4 + 160, a3);
    return;
  }
  v10 = *((_QWORD *)a1 + 2) + v6;
  v11 = v7 & 2;
  v12 = *(_QWORD *)a2;
  if ((v7 & 2) != 0)
    v13 = *(_QWORD *)a2;
  else
    v13 = v12 + 1;
  if (v10 > v13)
  {
LABEL_91:
    if (v11)
      v81 = v12;
    else
      v81 = v12 + 1;
    v82 = v81 - v6;
    if (v81 < v6)
    {
      if (v7)
      {
        if (v7 == 3)
        {
          v83 = *(_QWORD *)(a2 + 8);
          if (v83 < v12)
            goto LABEL_107;
        }
        else
        {
          v83 = *(_QWORD *)(a2 + 8);
          if (v12 >= v83)
          {
LABEL_107:
            v85 = boost::icl::identity_element<unsigned long long>::value(void)::_value;
            goto LABEL_108;
          }
        }
      }
      else
      {
        v83 = *(_QWORD *)(a2 + 8);
        if (v12 >= v83 || v12 + 1 >= v83)
          goto LABEL_107;
      }
      v85 = (v7 & 1) - v12 + (int)(((v7 >> 1) & 1) - 1) + v83;
LABEL_108:
      v86 = v85 + v81;
      v87 = (sg_vec_ref *)*((_QWORD *)a1 + 6);
      if (*(_QWORD *)(a3 + 144) >= v86)
        v88 = v86;
      else
        v88 = *(_QWORD *)(a3 + 144);
      v89 = a4;
      v90 = a1;
      v82 = 0;
LABEL_121:
      sg_vec_ref::subvec(v87, v90, v88, v82, v89);
      return;
    }
    if (v7)
    {
      if (v7 == 3)
      {
        v84 = *(_QWORD *)(a2 + 8);
        if (v84 < v12)
          goto LABEL_116;
      }
      else
      {
        v84 = *(_QWORD *)(a2 + 8);
        if (v12 >= v84)
        {
LABEL_116:
          v91 = boost::icl::identity_element<unsigned long long>::value(void)::_value;
          goto LABEL_117;
        }
      }
    }
    else
    {
      v84 = *(_QWORD *)(a2 + 8);
      if (v12 >= v84 || v12 + 1 >= v84)
        goto LABEL_116;
    }
    v91 = (v7 & 1) - v12 + (int)(((v7 >> 1) & 1) - 1) + v84;
LABEL_117:
    v92 = v91 + v81;
    v87 = (sg_vec_ref *)*((_QWORD *)a1 + 6);
    if (*(_QWORD *)(a3 + 144) >= v92)
      v88 = v92;
    else
      v88 = *(_QWORD *)(a3 + 144);
    v89 = a4;
    v90 = a1;
    goto LABEL_121;
  }
  v14 = *((_QWORD *)a1 + 6);
  v15 = (std::__shared_weak_count *)*((_QWORD *)a1 + 1);
  v119 = *(_QWORD *)a1;
  v120 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldxr(p_shared_owners);
    while (__stxr(v17 + 1, p_shared_owners));
    v18 = *((_QWORD *)a1 + 6);
  }
  else
  {
    v18 = v14;
  }
  v121[0] = *((_OWORD *)a1 + 1);
  *(_OWORD *)((char *)v121 + 9) = *(_OWORD *)((char *)a1 + 25);
  v122 = v18;
  v123 = *(_OWORD *)((char *)a1 + 56);
  v124 = *(_OWORD *)((char *)a1 + 72);
  v125 = *(_OWORD *)((char *)a1 + 88);
  v126 = *((_BYTE *)a1 + 104);
  v19 = (std::__shared_weak_count *)*((_QWORD *)a1 + 15);
  v127 = *((_QWORD *)a1 + 14);
  v128 = v19;
  if (v19)
  {
    v20 = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  v129 = *((_OWORD *)a1 + 8);
  v130 = *((_QWORD *)a1 + 18);
  v131 = *((_BYTE *)a1 + 152);
  while (!sg_vec_ns::details::sg_vec_iterator::operator==((uint64_t)&v119, a3))
  {
    v10 += *(_QWORD *)&v121[0];
    v22 = *(_QWORD *)a2;
    if ((*(_BYTE *)(a2 + 16) & 2) == 0)
      ++v22;
    if (v10 >= v22)
      break;
    sg_vec_ns::details::sg_vec_iterator::operator++((uint64_t)&v119);
  }
  v23 = *(std::__shared_weak_count **)(v14 + 216);
  v106 = *(_QWORD *)(v14 + 208);
  v107 = v23;
  if (v23)
  {
    v24 = (unint64_t *)&v23->__shared_owners_;
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  v108[0] = *(_OWORD *)(v14 + 224);
  *(_OWORD *)((char *)v108 + 9) = *(_OWORD *)(v14 + 233);
  v26 = (__int128 *)(v14 + 264);
  v110 = *(_OWORD *)(v14 + 264);
  v27 = *(_OWORD *)(v14 + 296);
  v111 = *(_OWORD *)(v14 + 280);
  v109 = *(_QWORD *)(v14 + 256);
  v113 = *(_BYTE *)(v14 + 312);
  v112 = v27;
  v28 = *(std::__shared_weak_count **)(v14 + 328);
  v114 = *(_QWORD *)(v14 + 320);
  v115 = v28;
  if (v28)
  {
    v29 = (unint64_t *)&v28->__shared_owners_;
    do
      v30 = __ldxr(v29);
    while (__stxr(v30 + 1, v29));
  }
  v116 = *(_OWORD *)(v14 + 336);
  v117 = *(_QWORD *)(v14 + 352);
  v118 = *(_BYTE *)(v14 + 360);
  v31 = sg_vec_ns::details::sg_vec_iterator::operator==((uint64_t)&v119, (uint64_t)&v106);
  if (v28)
  {
    v32 = (unint64_t *)&v28->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  v34 = v107;
  if (v107)
  {
    v35 = (unint64_t *)&v107->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
      if (v31)
        goto LABEL_37;
      goto LABEL_80;
    }
  }
  if (!v31)
  {
LABEL_80:
    v75 = v128;
    if (v128)
    {
      v76 = (unint64_t *)&v128->__shared_owners_;
      do
        v77 = __ldaxr(v76);
      while (__stlxr(v77 - 1, v76));
      if (!v77)
      {
        ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
        std::__shared_weak_count::__release_weak(v75);
      }
    }
    v78 = v120;
    if (v120)
    {
      v79 = (unint64_t *)&v120->__shared_owners_;
      do
        v80 = __ldaxr(v79);
      while (__stlxr(v80 - 1, v79));
      if (!v80)
      {
        ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
        std::__shared_weak_count::__release_weak(v78);
      }
    }
    v7 = *(unsigned __int8 *)(a2 + 16);
    v12 = *(_QWORD *)a2;
    v6 = *((_QWORD *)a1 + 3);
    v11 = v7 & 2;
    goto LABEL_91;
  }
LABEL_37:
  v37 = (_OWORD *)(v14 + 224);
  v38 = (__int128 *)(v14 + 280);
  v39 = *(std::__shared_weak_count **)(v14 + 216);
  v106 = *(_QWORD *)(v14 + 208);
  v107 = v39;
  if (v39)
  {
    v40 = (unint64_t *)&v39->__shared_owners_;
    do
      v41 = __ldxr(v40);
    while (__stxr(v41 + 1, v40));
  }
  v108[0] = *v37;
  *(_OWORD *)((char *)v108 + 9) = *(_OWORD *)(v14 + 233);
  v110 = *v26;
  v42 = *(_OWORD *)(v14 + 296);
  v111 = *v38;
  v43 = (__int128 *)(v14 + 336);
  v44 = (uint64_t *)(v14 + 352);
  v109 = *(_QWORD *)(v14 + 256);
  v112 = v42;
  v113 = *(_BYTE *)(v14 + 312);
  v45 = *(std::__shared_weak_count **)(v14 + 328);
  v114 = *(_QWORD *)(v14 + 320);
  v115 = v45;
  if (v45)
  {
    v46 = (unint64_t *)&v45->__shared_owners_;
    do
      v47 = __ldxr(v46);
    while (__stxr(v47 + 1, v46));
  }
  v116 = *v43;
  v117 = *v44;
  v118 = *(_BYTE *)(v14 + 360);
  v48 = *(std::__shared_weak_count **)(v14 + 216);
  v93 = *(_QWORD *)(v14 + 208);
  v94 = v48;
  if (v48)
  {
    v49 = (unint64_t *)&v48->__shared_owners_;
    do
      v50 = __ldxr(v49);
    while (__stxr(v50 + 1, v49));
  }
  *(_OWORD *)v95 = *v37;
  *(_OWORD *)&v95[9] = *(_OWORD *)(v14 + 233);
  v51 = *v38;
  v52 = *(_OWORD *)(v14 + 296);
  v97 = *v26;
  v98 = v51;
  v96 = *(_QWORD *)(v14 + 256);
  v99 = v52;
  v100 = *(_BYTE *)(v14 + 312);
  v53 = *(std::__shared_weak_count **)(v14 + 328);
  v101 = *(_QWORD *)(v14 + 320);
  v102 = v53;
  if (v53)
  {
    v54 = (unint64_t *)&v53->__shared_owners_;
    do
      v55 = __ldxr(v54);
    while (__stxr(v55 + 1, v54));
  }
  v103 = *v43;
  v104 = *v44;
  v105 = *(_BYTE *)(v14 + 360);
  v56 = std::pair<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator>::pair[abi:ne180100]<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator,0>(a4, (uint64_t)&v106, (uint64_t)&v93);
  v57 = v102;
  if (v102)
  {
    v58 = (unint64_t *)&v102->__shared_owners_;
    do
      v59 = __ldaxr(v58);
    while (__stlxr(v59 - 1, v58));
    if (!v59)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v57->__on_zero_shared)(v57, v56);
      std::__shared_weak_count::__release_weak(v57);
    }
  }
  v60 = v94;
  if (v94)
  {
    v61 = (unint64_t *)&v94->__shared_owners_;
    do
      v62 = __ldaxr(v61);
    while (__stlxr(v62 - 1, v61));
    if (!v62)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v60->__on_zero_shared)(v60, v56);
      std::__shared_weak_count::__release_weak(v60);
    }
  }
  v63 = v115;
  if (v115)
  {
    v64 = (unint64_t *)&v115->__shared_owners_;
    do
      v65 = __ldaxr(v64);
    while (__stlxr(v65 - 1, v64));
    if (!v65)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v63->__on_zero_shared)(v63, v56);
      std::__shared_weak_count::__release_weak(v63);
    }
  }
  v66 = v107;
  if (v107)
  {
    v67 = (unint64_t *)&v107->__shared_owners_;
    do
      v68 = __ldaxr(v67);
    while (__stlxr(v68 - 1, v67));
    if (!v68)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v66->__on_zero_shared)(v66, v56);
      std::__shared_weak_count::__release_weak(v66);
    }
  }
  v69 = v128;
  if (v128)
  {
    v70 = (unint64_t *)&v128->__shared_owners_;
    do
      v71 = __ldaxr(v70);
    while (__stlxr(v71 - 1, v70));
    if (!v71)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v69->__on_zero_shared)(v69, v56);
      std::__shared_weak_count::__release_weak(v69);
    }
  }
  v72 = v120;
  if (v120)
  {
    v73 = (unint64_t *)&v120->__shared_owners_;
    do
      v74 = __ldaxr(v73);
    while (__stlxr(v74 - 1, v73));
    if (!v74)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v72->__on_zero_shared)(v72, v56);
      std::__shared_weak_count::__release_weak(v72);
    }
  }
}

void sub_212FD8C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;
  uint64_t v31;

  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v30);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)&a30);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](a9);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v31 - 248);
  _Unwind_Resume(a1);
}

void sg_vec_ns::details::sg_vec_iterator::subvec(sg_vec_ns::details::sg_vec_iterator *this@<X0>, const sg_vec_ns::details::sg_vec_iterator *a2@<X2>, unint64_t a3@<X1>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  sg_vec_ref *v6;
  unint64_t v7;

  v6 = (sg_vec_ref *)*((_QWORD *)this + 6);
  if (*((_QWORD *)a2 + 18) >= a3)
    v7 = a3;
  else
    v7 = *((_QWORD *)a2 + 18);
  sg_vec_ref::subvec(v6, this, v7, a4, a5);
}

sg_vec_ns::details::sg_vec_iterator *sg_vec_ns::details::sg_vec_iterator::sg_vec_iterator(sg_vec_ns::details::sg_vec_iterator *this, sg_vec_ref *a2, const sg_vec_ns::details::buffer_iterator *a3, char a4)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  int v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  uint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  __int128 v35;
  __int128 v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *v44;
  unint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  uint64_t v50;
  std::__shared_weak_count *v51;
  _OWORD v52[2];
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  char v57;
  uint64_t v58;
  std::__shared_weak_count *v59;
  __int128 v60;
  uint64_t v61;
  char v62;
  __int128 v63;
  _OWORD v64[2];
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  char v69;
  uint64_t v70;
  std::__shared_weak_count *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  char v76;
  uint64_t v77;
  std::__shared_weak_count *v78;
  __int128 v79;

  *(_OWORD *)((char *)this + 25) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_QWORD *)this + 6) = a2;
  *((_QWORD *)this + 7) = *(_QWORD *)a3;
  *((_QWORD *)this + 8) = *((_QWORD *)a3 + 1);
  v6 = *((_OWORD *)a3 + 1);
  v7 = *((_OWORD *)a3 + 2);
  *((_BYTE *)this + 104) = *((_BYTE *)a3 + 48);
  *(_OWORD *)((char *)this + 88) = v7;
  *(_OWORD *)((char *)this + 72) = v6;
  *((_QWORD *)this + 14) = *((_QWORD *)a3 + 7);
  v8 = *((_QWORD *)a3 + 8);
  *((_QWORD *)this + 15) = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v11 = (__int128 *)((char *)a3 + 16);
  *((_OWORD *)this + 8) = *(_OWORD *)((char *)a3 + 72);
  *((_BYTE *)this + 152) = a4;
  v12 = *(_QWORD *)a3;
  if (*(_OWORD *)a3 == *((_OWORD *)a2 + 6) && *(_QWORD *)v11 == *((_QWORD *)a2 + 14))
  {
    *((_QWORD *)this + 18) = *((_QWORD *)a2 + 23) + *((_QWORD *)a2 + 24);
  }
  else
  {
    v73 = *(_OWORD *)((char *)a2 + 8);
    v74 = *(_OWORD *)((char *)a2 + 24);
    v75 = *(_OWORD *)((char *)a2 + 40);
    v76 = *((_BYTE *)a2 + 56);
    v13 = (std::__shared_weak_count *)*((_QWORD *)a2 + 9);
    v77 = *((_QWORD *)a2 + 8);
    v78 = v13;
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
      do
        v15 = __ldxr(p_shared_owners);
      while (__stxr(v15 + 1, p_shared_owners));
      v12 = *(_QWORD *)a3;
    }
    v79 = *((_OWORD *)a2 + 5);
    v16 = *((_QWORD *)a3 + 1);
    v65 = v12;
    v66 = v16;
    v17 = *((_OWORD *)a3 + 2);
    v67 = *v11;
    v68 = v17;
    v69 = *((_BYTE *)a3 + 48);
    v18 = (std::__shared_weak_count *)*((_QWORD *)a3 + 8);
    v70 = *((_QWORD *)a3 + 7);
    v71 = v18;
    if (v18)
    {
      v19 = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldxr(v19);
      while (__stxr(v20 + 1, v19));
    }
    v21 = 0;
    v72 = *(_OWORD *)((char *)a3 + 72);
    while ((_QWORD)v73 != v65 || *((_QWORD *)&v73 + 1) != v66 || (_QWORD)v74 != (_QWORD)v67)
    {
      sg_vec_ns::details::buffer_iterator::sync((sg_vec_ns::details::buffer_iterator *)&v73);
      v22 = v78;
      if (v78)
      {
        v23 = (unint64_t *)&v78->__shared_owners_;
        do
          v24 = __ldxr(v23);
        while (__stxr(v24 + 1, v23));
        v25 = DWORD2(v79);
        do
          v26 = __ldaxr(v23);
        while (__stlxr(v26 - 1, v23));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      else
      {
        v25 = DWORD2(v79);
      }
      v21 += v25;
      sg_vec_ns::details::buffer_iterator::operator++((sg_vec_ns::details::buffer_iterator *)&v73);
    }
    *((_QWORD *)this + 18) = *((_QWORD *)a2 + 23) + v21;
    if (v71)
    {
      v27 = &v71->__shared_owners_;
      do
        v28 = __ldaxr((unint64_t *)v27);
      while (__stlxr(v28 - 1, (unint64_t *)v27));
      if (!v28)
      {
        ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
        std::__shared_weak_count::__release_weak(v71);
      }
    }
    v29 = v78;
    if (v78)
    {
      v30 = (unint64_t *)&v78->__shared_owners_;
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 - 1, v30));
      if (!v31)
      {
        ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
        std::__shared_weak_count::__release_weak(v29);
      }
    }
    v32 = (std::__shared_weak_count *)*((_QWORD *)a2 + 27);
    v50 = *((_QWORD *)a2 + 26);
    v51 = v32;
    if (v32)
    {
      v33 = (unint64_t *)&v32->__shared_owners_;
      do
        v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
    }
    v52[0] = *((_OWORD *)a2 + 14);
    *(_OWORD *)((char *)v52 + 9) = *(_OWORD *)((char *)a2 + 233);
    v53 = *((_QWORD *)a2 + 32);
    v35 = *(_OWORD *)((char *)a2 + 264);
    v57 = *((_BYTE *)a2 + 312);
    v36 = *(_OWORD *)((char *)a2 + 280);
    v54 = v35;
    v55 = v36;
    v56 = *(_OWORD *)((char *)a2 + 296);
    v37 = (std::__shared_weak_count *)*((_QWORD *)a2 + 41);
    v58 = *((_QWORD *)a2 + 40);
    v59 = v37;
    if (v37)
    {
      v38 = (unint64_t *)&v37->__shared_owners_;
      do
        v39 = __ldxr(v38);
      while (__stxr(v39 + 1, v38));
    }
    v60 = *((_OWORD *)a2 + 21);
    v61 = *((_QWORD *)a2 + 44);
    v62 = *((_BYTE *)a2 + 360);
    sg_vec_ns::details::sg_vec_iterator::make_val(this, (const sg_vec_ns::details::sg_vec_iterator *)&v50, (uint64_t)&v63);
    std::shared_ptr<_di_plugin_t>::operator=[abi:ne180100]((uint64_t)this, &v63);
    *((_OWORD *)this + 1) = v64[0];
    *(_OWORD *)((char *)this + 25) = *(_OWORD *)((char *)v64 + 9);
    v40 = (std::__shared_weak_count *)*((_QWORD *)&v63 + 1);
    if (*((_QWORD *)&v63 + 1))
    {
      v41 = (unint64_t *)(*((_QWORD *)&v63 + 1) + 8);
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }
    v43 = v59;
    if (v59)
    {
      v44 = (unint64_t *)&v59->__shared_owners_;
      do
        v45 = __ldaxr(v44);
      while (__stlxr(v45 - 1, v44));
      if (!v45)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
    }
    v46 = v51;
    if (v51)
    {
      v47 = (unint64_t *)&v51->__shared_owners_;
      do
        v48 = __ldaxr(v47);
      while (__stlxr(v48 - 1, v47));
      if (!v48)
      {
        ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
        std::__shared_weak_count::__release_weak(v46);
      }
    }
  }
  return this;
}

void sub_212FD90FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  va_list va;

  va_start(va, a2);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v4);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v3);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

uint64_t sg_vec_ns::details::sg_vec_iterator::get_cow(sg_vec_ns::details::sg_vec_iterator *this)
{
  return *(unsigned __int8 *)(*((_QWORD *)this + 6) + 200);
}

void sg_vec_ns::generate_vec_ref(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, unint64_t a5@<X4>, sg_vec_ref *a6@<X8>)
{
  unint64_t v6;

  v6 = *(_QWORD *)(a2 + 144) - a3;
  if (v6 <= a4)
    v6 = a4;
  if (v6 < a5)
    a5 = v6;
  sg_vec_ref::sg_vec_ref(a6, (const sg_vec_ns::details::buffer_iterator *)(a1 + 56), (const sg_vec_ns::details::buffer_iterator *)(a2 + 56), a3, a5, *(_BYTE *)(*(_QWORD *)(a1 + 48) + 200));
}

BOOL sg_vec_ns::should_create_new_sg_vec_ref(sg_vec_ns *this, const sg_vec_ns::details::sg_vec_iterator *a2, const sg_vec_ns::details::sg_vec_iterator *a3, unint64_t a4)
{
  unint64_t v4;

  v4 = *((_QWORD *)this + 18);
  return v4 > (unint64_t)a3 || *((_QWORD *)a2 + 18) - v4 < a4;
}

uint64_t sg_vec_ns::make@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v11;
  __int128 v12;
  _QWORD v13[16];

  v13[15] = *MEMORY[0x24BDAC8D0];
  v5 = *a1;
  v4 = a1[1];
  if (v4)
  {
    v6 = (unint64_t *)(v4 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = a1[3];
  v9 = a1[4];
  v11 = v13;
  v13[0] = v5;
  v13[1] = v4;
  v13[2] = v9;
  v12 = xmmword_212FEB320;
  sg_vec::sg_vec(a2, (uint64_t)&v11, v8, a1[2]);
  return boost::container::vector<std::pair<std::shared_ptr<char>,unsigned long>,boost::container::small_vector_allocator<std::pair<std::shared_ptr<char>,unsigned long>,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)&v11);
}

void sub_212FD924C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  boost::container::vector<std::pair<std::shared_ptr<char>,unsigned long>,boost::container::small_vector_allocator<std::pair<std::shared_ptr<char>,unsigned long>,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)va1);
  std::shared_ptr<char>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

__n128 std::pair<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator>::pair[abi:ne180100]<sg_vec_ns::details::sg_vec_iterator,sg_vec_ns::details::sg_vec_iterator,0>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __n128 result;
  uint64_t v11;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(_OWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v4 = *(_OWORD *)(a2 + 72);
  v5 = *(_OWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v5;
  *(_OWORD *)(a1 + 72) = v4;
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_QWORD *)(a2 + 112) = 0;
  *(_QWORD *)(a2 + 120) = 0;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  v6 = *(_QWORD *)(a2 + 144);
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = v6;
  *(_OWORD *)(a1 + 160) = *(_OWORD *)a3;
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  v7 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(a1 + 185) = *(_OWORD *)(a3 + 25);
  *(_OWORD *)(a1 + 176) = v7;
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a3 + 48);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a3 + 56);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a3 + 64);
  v8 = *(_OWORD *)(a3 + 72);
  v9 = *(_OWORD *)(a3 + 88);
  *(_BYTE *)(a1 + 264) = *(_BYTE *)(a3 + 104);
  *(_OWORD *)(a1 + 248) = v9;
  *(_OWORD *)(a1 + 232) = v8;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a3 + 112);
  *(_QWORD *)(a3 + 112) = 0;
  *(_QWORD *)(a3 + 120) = 0;
  result = *(__n128 *)(a3 + 128);
  *(__n128 *)(a1 + 288) = result;
  v11 = *(_QWORD *)(a3 + 144);
  *(_BYTE *)(a1 + 312) = *(_BYTE *)(a3 + 152);
  *(_QWORD *)(a1 + 304) = v11;
  return result;
}

uint64_t zero_sg_entry(uint64_t a1)
{
  bzero(*(void **)a1, *(_QWORD *)(a1 + 16));
  return *(_QWORD *)(a1 + 16);
}

_QWORD *trim_sg_to_interval@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v3;
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;

  v3 = result[3];
  v4 = *(unsigned __int8 *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 8);
  if (v3 > (v4 & 1) + v5 - 1
    || ((v6 = result[2], v7 = v6 + v3, v8 = *(_QWORD *)a2, (v4 & 2) != 0) ? (v9 = *(_QWORD *)a2) : (v9 = v8 + 1),
        v7 <= v9))
  {
    *(_OWORD *)(a3 + 25) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return result;
  }
  v10 = v9 - v3;
  if (v9 >= v3)
  {
    if (*(_BYTE *)(a2 + 16))
    {
      if (v4 == 3)
      {
        if (v5 < v8)
          goto LABEL_31;
      }
      else if (v8 >= v5)
      {
LABEL_31:
        v18 = boost::icl::identity_element<unsigned long long>::value(void)::_value;
        goto LABEL_32;
      }
    }
    else if (v8 >= v5 || v8 + 1 >= v5)
    {
      goto LABEL_31;
    }
    v18 = v5 + (v4 & 1) + (int)(((v4 >> 1) & 1) - 1) - v8;
LABEL_32:
    if (v6 - v10 < v18)
      v18 = v6 - v10;
    v19 = result[4];
    v20 = result[1];
    *(_QWORD *)a3 = *result + v10;
    *(_QWORD *)(a3 + 8) = v20;
    if (v20)
    {
      v21 = (unint64_t *)(v20 + 8);
      do
        v22 = __ldxr(v21);
      while (__stxr(v22 + 1, v21));
    }
    *(_QWORD *)(a3 + 16) = v18;
    *(_QWORD *)(a3 + 24) = v9;
    *(_QWORD *)(a3 + 32) = v19 - v10;
    goto LABEL_38;
  }
  if (*(_BYTE *)(a2 + 16))
  {
    if (v4 == 3)
    {
      if (v5 < v8)
        goto LABEL_20;
    }
    else if (v8 >= v5)
    {
LABEL_20:
      v11 = boost::icl::identity_element<unsigned long long>::value(void)::_value;
      goto LABEL_21;
    }
  }
  else if (v8 >= v5 || v8 + 1 >= v5)
  {
    goto LABEL_20;
  }
  v11 = v5 + (v4 & 1) + (int)(((v4 >> 1) & 1) - 1) - v8;
LABEL_21:
  v12 = v11 + v9;
  if (v12 >= v7)
    v12 = v6 + v3;
  v13 = v12 - v3;
  v14 = result[4];
  v15 = result[1];
  *(_QWORD *)a3 = *result;
  *(_QWORD *)(a3 + 8) = v15;
  if (v15)
  {
    v16 = (unint64_t *)(v15 + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  *(_QWORD *)(a3 + 16) = v13;
  *(_QWORD *)(a3 + 24) = v3;
  *(_QWORD *)(a3 + 32) = v14;
LABEL_38:
  *(_BYTE *)(a3 + 40) = 0;
  return result;
}

gcd::gcd_group *gcd::gcd_group::gcd_group(gcd::gcd_group *this)
{
  *(_QWORD *)this = dispatch_group_create();
  return this;
}

void gcd::gcd_group::~gcd_group(NSObject **this)
{
  NSObject *v1;

  v1 = *this;
  if (v1)
    dispatch_release(v1);
}

intptr_t gcd::gcd_group::wait(dispatch_group_t *this, dispatch_time_t a2)
{
  return dispatch_group_wait(*this, a2);
}

dispatch_queue_t *gcd::gcd_queue::gcd_queue(dispatch_queue_t *a1, char *label, int a3)
{
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  NSObject *global_queue;

  switch(a3)
  {
    case 2:
      v6 = MEMORY[0x24BDAC9C0];
      v5 = label;
      goto LABEL_6;
    case 1:
      global_queue = dispatch_get_global_queue(21, 0);
      v7 = dispatch_queue_create_with_target_V2(label, 0, global_queue);
      goto LABEL_8;
    case 0:
      v5 = label;
      v6 = 0;
LABEL_6:
      v7 = dispatch_queue_create(v5, v6);
LABEL_8:
      *a1 = v7;
      break;
  }
  return a1;
}

_QWORD *gcd::gcd_queue::gcd_queue(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  *a2 = 0;
  return result;
}

void gcd::gcd_queue::async(dispatch_queue_t *a1, void *a2)
{
  dispatch_async(*a1, a2);
}

void gcd::gcd_queue::async(dispatch_queue_t *a1, dispatch_group_t *a2, void *a3)
{
  dispatch_group_async(*a2, *a1, a3);
}

void gcd::gcd_queue::async(dispatch_queue_t *a1, dispatch_block_t *a2, uint64_t a3)
{
  dispatch_block_t v4;
  dispatch_time_t v6;

  v4 = *a2;
  if (v4)
  {
    if (a3)
    {
      v6 = dispatch_time(0, 1000 * a3);
      dispatch_after(v6, *a1, *a2);
    }
    else
    {
      dispatch_async(*a1, v4);
    }
  }
}

void gcd::gcd_queue::sync(dispatch_queue_t *a1, void *a2)
{
  dispatch_sync(*a1, a2);
}

void gcd::gcd_queue::barrier_async(dispatch_queue_t *a1, void *a2)
{
  dispatch_barrier_async(*a1, a2);
}

void gcd::gcd_queue::barrier_sync(dispatch_queue_t *a1, void *a2)
{
  dispatch_barrier_sync(*a1, a2);
}

void gcd::gcd_queue::suspend(dispatch_object_t *this)
{
  dispatch_suspend(*this);
}

void gcd::gcd_queue::resume(dispatch_object_t *this)
{
  dispatch_resume(*this);
}

uint64_t gcd::gcd_queue::set_target_priority(dispatch_object_t *a1, int a2)
{
  intptr_t v3;
  NSObject *global_queue;

  if ((a2 - 1) > 2)
    v3 = 5;
  else
    v3 = *(_QWORD *)&asc_212FF75C8[8 * a2 - 8];
  global_queue = dispatch_get_global_queue(v3, 0);
  if (!global_queue)
    return 22;
  dispatch_set_target_queue(*a1, global_queue);
  return 0;
}

gcd::gcd_semaphore *gcd::gcd_semaphore::gcd_semaphore(gcd::gcd_semaphore *this, intptr_t value)
{
  *(_QWORD *)this = dispatch_semaphore_create(value);
  return this;
}

intptr_t gcd::gcd_semaphore::wait(dispatch_semaphore_t *this, dispatch_time_t a2)
{
  return dispatch_semaphore_wait(*this, a2);
}

intptr_t gcd::gcd_semaphore::signal(dispatch_semaphore_t *this)
{
  return dispatch_semaphore_signal(*this);
}

dispatch_block_t *gcd::gcd_block::gcd_block(dispatch_block_t *a1, void *a2)
{
  *a1 = dispatch_block_create((dispatch_block_flags_t)0, a2);
  return a1;
}

void gcd::gcd_block::cancel(void **this)
{
  void *v1;

  v1 = *this;
  if (v1)
    dispatch_block_cancel(v1);
}

void gcd::gcd_block::~gcd_block(const void **this)
{
  void *v2;

  v2 = (void *)*this;
  if (v2)
  {
    dispatch_block_cancel(v2);
    if (*this)
      _Block_release(*this);
  }
}

std::string *workqueue::workqueue::workqueue(std::string *this, __int128 *a2, unint64_t a3)
{
  __int128 v5;
  std::string *v6;
  std::string *v7;
  NSObject *v9;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&this[1].__r_.__value_.__r.__words[2] = 0u;
  this[2].__r_.__value_.__s.__data_[8] = a3 != 0;
  if (a3)
  {
    std::vector<gcd::gcd_queue>::reserve(this[1].__r_.__value_.__r.__words, a3);
    do
    {
      v6 = this;
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
        v6 = (std::string *)this->__r_.__value_.__r.__words[0];
      gcd::gcd_queue::gcd_queue(&v9, v6, 0);
      std::vector<gcd::gcd_queue>::emplace_back<gcd::gcd_queue>(this[1].__r_.__value_.__r.__words, &v9);
      gcd::gcd_group::~gcd_group(&v9);
      --a3;
    }
    while (a3);
  }
  else
  {
    v7 = this;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      v7 = (std::string *)this->__r_.__value_.__r.__words[0];
    gcd::gcd_queue::gcd_queue(&v9, v7, 2);
    std::vector<gcd::gcd_queue>::emplace_back<gcd::gcd_queue>(this[1].__r_.__value_.__r.__words, &v9);
    gcd::gcd_group::~gcd_group(&v9);
  }
  return this;
}

void sub_212FD9894(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  gcd::gcd_group::~gcd_group((NSObject **)va);
  std::vector<gcd::gcd_queue>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  if (*(char *)(v2 + 23) < 0)
    operator delete(*(void **)v2);
  _Unwind_Resume(a1);
}

uint64_t std::vector<gcd::gcd_queue>::reserve(_QWORD *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<iovec>::__throw_length_error[abi:ne180100]();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::allocator<std::unique_ptr<diskimage_uio::stack_image_node const>>::allocate_at_least[abi:ne180100](result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 8 * v6;
    std::vector<gcd::gcd_queue>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<gcd::gcd_queue>::~__split_buffer((uint64_t)v7);
  }
  return result;
}

void sub_212FD9954(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<gcd::gcd_queue>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

unint64_t std::vector<gcd::gcd_queue>::emplace_back<gcd::gcd_queue>(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v15;
  char *v16;
  _QWORD *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v9 = (uint64_t)(v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61)
      std::vector<iovec>::__throw_length_error[abi:ne180100]();
    v10 = v5 - *a1;
    v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v19 = v4;
    if (v12)
      v13 = (char *)std::allocator<std::unique_ptr<diskimage_uio::stack_image_node const>>::allocate_at_least[abi:ne180100](v4, v12);
    else
      v13 = 0;
    v15 = v13;
    v16 = &v13[8 * v9];
    v18 = &v13[8 * v12];
    gcd::gcd_queue::gcd_queue(v16, a2);
    v17 = v16 + 8;
    std::vector<gcd::gcd_queue>::__swap_out_circular_buffer(a1, &v15);
    v8 = a1[1];
    std::__split_buffer<gcd::gcd_queue>::~__split_buffer((uint64_t)&v15);
  }
  else
  {
    gcd::gcd_queue::gcd_queue(*(_QWORD **)(v4 - 8), a2);
    v8 = v7 + 8;
    a1[1] = v7 + 8;
  }
  a1[1] = v8;
  return v8 - 8;
}

void sub_212FD9A58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<gcd::gcd_queue>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t workqueue::workqueue::set_target_priority(uint64_t result, int a2)
{
  dispatch_object_t *v2;
  dispatch_object_t *i;

  v2 = *(dispatch_object_t **)(result + 24);
  for (i = *(dispatch_object_t **)(result + 32); v2 != i; ++v2)
    result = gcd::gcd_queue::set_target_priority(v2, a2);
  return result;
}

void workqueue::concurrent_limit::get(std::condition_variable *this)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL4 owns;
  std::unique_lock<std::mutex> v5;

  v5.__m_ = (std::unique_lock<std::mutex>::mutex_type *)&this[1];
  v5.__owns_ = 1;
  std::mutex::lock((std::mutex *)&this[1]);
  v2 = *(_QWORD *)&this[2].__cv_.__opaque[8];
  if (v2)
  {
    *(_QWORD *)&this[2].__cv_.__opaque[8] = v2 - 1;
LABEL_5:
    std::mutex::unlock(v5.__m_);
    return;
  }
  do
  {
    std::condition_variable::wait(this, &v5);
    v3 = *(_QWORD *)&this[2].__cv_.__opaque[8];
  }
  while (!v3);
  owns = v5.__owns_;
  *(_QWORD *)&this[2].__cv_.__opaque[8] = v3 - 1;
  if (owns)
    goto LABEL_5;
}

void workqueue::concurrent_limit::put(std::condition_variable *this)
{
  std::mutex *v2;

  v2 = (std::mutex *)&this[1];
  std::mutex::lock((std::mutex *)&this[1]);
  ++*(_QWORD *)&this[2].__cv_.__opaque[8];
  std::condition_variable::notify_one(this);
  std::mutex::unlock(v2);
}

void workqueue::transaction::add(dispatch_group_t *a1, void *a2)
{
  dispatch_group_t v4;
  unint64_t *v5;
  unint64_t v6;
  Class isa;
  NSObject *v8;
  unint64_t v9;
  dispatch_group_t v10;
  unint64_t *v11;
  unint64_t v12;
  _QWORD v13[6];

  if (*((_BYTE *)a1 + 136))
  {
    workqueue::concurrent_limit::get((std::condition_variable *)(a1 + 2));
    v4 = *a1;
    v5 = (unint64_t *)&(*a1)[6];
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 + 1, v5));
    v8 = v4 + 3;
    isa = v4[3].isa;
    v9 = v6 % ((v8[1].isa - isa) >> 3);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 0x40000000;
    v13[2] = ___ZN9workqueue11transaction3addEU13block_pointerFvvE_block_invoke;
    v13[3] = &unk_24CF15878;
    v13[4] = a2;
    v13[5] = a1;
    gcd::gcd_queue::async((dispatch_queue_t *)isa + v9, a1 + 1, v13);
  }
  else
  {
    v10 = *a1;
    v11 = (unint64_t *)&(*a1)[6];
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 + 1, v11));
    gcd::gcd_queue::async((dispatch_queue_t *)v10[3].isa + v12 % ((v10[4].isa - v10[3].isa) >> 3), a1 + 1, a2);
  }
}

void ___ZN9workqueue11transaction3addEU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  workqueue::concurrent_limit::put((std::condition_variable *)(v1 + 16));
}

intptr_t workqueue::transaction::flush(dispatch_group_t *this, dispatch_time_t a2)
{
  return gcd::gcd_group::wait(this + 1, a2);
}

void workqueue::transaction::~transaction(dispatch_group_t *this)
{
  NSObject **v2;

  v2 = this + 1;
  gcd::gcd_group::wait(this + 1, 0xFFFFFFFFFFFFFFFFLL);
  std::__optional_destruct_base<workqueue::concurrent_limit,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)(this + 2));
  gcd::gcd_group::~gcd_group(v2);
}

uint64_t workqueue::transaction::transaction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)a1 = a2;
  gcd::gcd_group::gcd_group((gcd::gcd_group *)(a1 + 8));
  *(_BYTE *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 136) = 0;
  if (a3)
  {
    std::__optional_destruct_base<workqueue::concurrent_limit,false>::reset[abi:ne180100](a1 + 16);
    *(_QWORD *)(a1 + 16) = 1018212795;
    *(_OWORD *)(a1 + 24) = 0u;
    *(_OWORD *)(a1 + 40) = 0u;
    *(_QWORD *)(a1 + 56) = 0;
    *(_QWORD *)(a1 + 64) = 850045863;
    *(_OWORD *)(a1 + 72) = 0u;
    *(_OWORD *)(a1 + 88) = 0u;
    *(_OWORD *)(a1 + 104) = 0u;
    *(_QWORD *)(a1 + 120) = 0;
    *(_QWORD *)(a1 + 128) = a3;
    *(_BYTE *)(a1 + 136) = 1;
  }
  return a1;
}

uint64_t workqueue::workqueue::create_transaction@<X0>(workqueue::workqueue *this@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return workqueue::transaction::transaction(a3, (uint64_t)this, a2);
}

uint64_t workqueue::workqueue::create_recurrent_block@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return workqueue::recurrent_block::recurrent_block(a4, a1, a2, a3);
}

uint64_t workqueue::recurrent_block::recurrent_block(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  unint64_t *v6;
  unint64_t v7;
  _QWORD v9[7];

  *(_QWORD *)a1 = a2;
  v6 = a2 + 6;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 + 1, v6));
  *(_QWORD *)(a1 + 8) = a2[3] + 8 * (v7 % ((uint64_t)(a2[4] - a2[3]) >> 3));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 0x40000000;
  v9[2] = ___ZN9workqueue15recurrent_blockC2ERNS_9workqueueEU13block_pointerFvvEy_block_invoke;
  v9[3] = &unk_24CF158A0;
  v9[4] = a3;
  v9[5] = a1;
  v9[6] = a4;
  gcd::gcd_block::gcd_block((dispatch_block_t *)(a1 + 16), v9);
  if (*(_QWORD *)(a1 + 16) && *(_BYTE *)(*(_QWORD *)a1 + 56))
    gcd::gcd_queue::async(*(dispatch_queue_t **)(a1 + 8), (dispatch_block_t *)(a1 + 16), a4);
  return a1;
}

void sub_212FD9E44(_Unwind_Exception *a1)
{
  gcd::gcd_block *v1;

  gcd::gcd_block::~gcd_block(v1);
  _Unwind_Resume(a1);
}

void ___ZN9workqueue15recurrent_blockC2ERNS_9workqueueEU13block_pointerFvvEy_block_invoke(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[5];
  (*(void (**)(void))(a1[4] + 16))();
  gcd::gcd_queue::async(*(dispatch_queue_t **)(v2 + 8), (dispatch_block_t *)(v2 + 16), a1[6]);
}

void workqueue::recurrent_block::~recurrent_block(workqueue::recurrent_block *this)
{
  workqueue::recurrent_block::cancel(this);
  gcd::gcd_block::~gcd_block((workqueue::recurrent_block *)((char *)this + 16));
}

void workqueue::recurrent_block::cancel(workqueue::recurrent_block *this)
{
  dispatch_queue_t *v2;
  _QWORD v3[5];

  if (*((_QWORD *)this + 2))
  {
    if (*(_BYTE *)(*(_QWORD *)this + 56))
    {
      v2 = (dispatch_queue_t *)*((_QWORD *)this + 1);
      v3[0] = MEMORY[0x24BDAC760];
      v3[1] = 0x40000000;
      v3[2] = ___ZN9workqueue15recurrent_block6cancelEv_block_invoke;
      v3[3] = &__block_descriptor_tmp_2_0;
      v3[4] = this;
      gcd::gcd_queue::async(v2, v3);
      gcd::gcd_queue::sync(*((dispatch_queue_t **)this + 1), &__block_literal_global_10);
    }
  }
}

void ___ZN9workqueue15recurrent_block6cancelEv_block_invoke(uint64_t a1)
{
  gcd::gcd_block::cancel((void **)(*(_QWORD *)(a1 + 32) + 16));
}

_QWORD *std::vector<gcd::gcd_queue>::__swap_out_circular_buffer(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *result;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (_QWORD *)*a1;
  v4 = (_QWORD *)a1[1];
  result = (_QWORD *)a2[1];
  while (v4 != v5)
    result = gcd::gcd_queue::gcd_queue(result - 1, --v4);
  a2[1] = result;
  v7 = (_QWORD *)*a1;
  *a1 = result;
  a2[1] = v7;
  v8 = a1[1];
  a1[1] = a2[2];
  a2[2] = v8;
  v9 = a1[2];
  a1[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<gcd::gcd_queue>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    gcd::gcd_group::~gcd_group((NSObject **)(i - 8));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::__optional_destruct_base<workqueue::concurrent_limit,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 120))
  {
    std::mutex::~mutex((std::mutex *)(a1 + 48));
    std::condition_variable::~condition_variable((std::condition_variable *)a1);
  }
  return a1;
}

void std::__optional_destruct_base<workqueue::concurrent_limit,false>::reset[abi:ne180100](uint64_t a1)
{
  if (*(_BYTE *)(a1 + 120))
  {
    std::mutex::~mutex((std::mutex *)(a1 + 48));
    std::condition_variable::~condition_variable((std::condition_variable *)a1);
    *(_BYTE *)(a1 + 120) = 0;
  }
}

void waitForDevCB(uint64_t a1, uint64_t a2)
{
  DIIOObject *v3;
  DIIOObject *v4;
  DIIOObject *v5;
  id v6;
  DIIOObject *v7;
  DIIOObject *v8;
  DIIOIterator *v9;

  v9 = -[DIIOIterator initWithIOIterator:retain:]([DIIOIterator alloc], "initWithIOIterator:retain:", a2, 1);
  v3 = -[DIIOObject initWithIteratorNext:]([DIIOObject alloc], "initWithIteratorNext:", v9);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    do
    {
      v6 = -[DIIOObject newIteratorWithOptions:error:](v4, "newIteratorWithOptions:error:", 3, 0);
      if (v6)
      {
        while (1)
        {
          v7 = v5;
          v5 = -[DIIOObject initWithIteratorNext:]([DIIOObject alloc], "initWithIteratorNext:", v6);

          if (!v5 || IOObjectConformsTo(-[DIIOObject ioObj](v5, "ioObj"), "IOMedia"))
            break;
          if (IOObjectIsEqualTo(-[DIIOObject ioObj](v5, "ioObj"), *(_DWORD *)(a1 + 8)))
          {
            **(_BYTE **)a1 = 1;

            goto LABEL_9;
          }
        }
      }

      v8 = -[DIIOObject initWithIteratorNext:]([DIIOObject alloc], "initWithIteratorNext:", v9);
      v4 = v8;
    }
    while (v8);
LABEL_9:

  }
}

uint64_t DiskImages2_Attach(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  BOOL v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v11;
  id v12;

  v11 = 0;
  v12 = 0;
  v5 = +[DICommonAttach defaultDiskImageAttach:BSDName:error:](DICommonAttach, "defaultDiskImageAttach:BSDName:error:", a1, &v12, &v11);
  v6 = v12;
  v7 = v11;
  v8 = v7;
  if (v5)
  {
    v9 = 0;
    if (a2)
      *a2 = v6;
  }
  else
  {
    if (a3)
      *a3 = v7;
    v9 = objc_msgSend(v8, "code");
  }

  return v9;
}

void *diskimage_uio::small_vector_ns::llvm::safe_malloc(size_t this)
{
  size_t v1;
  void *result;

  while (1)
  {
    v1 = this;
    result = malloc_type_malloc(this, 0xEFF1C82EuLL);
    if (result)
      break;
    this = 1;
    if (v1)
      abort();
  }
  return result;
}

void *diskimage_uio::small_vector_ns::llvm::safe_calloc(diskimage_uio::small_vector_ns::llvm *this, size_t a2)
{
  void *result;

  result = malloc_type_calloc((size_t)this, a2, 0x888F9946uLL);
  if (!result && (this && a2 || (result = malloc_type_malloc(1uLL, 0xEFF1C82EuLL)) == 0))
    abort();
  return result;
}

void *diskimage_uio::small_vector_ns::llvm::safe_realloc(diskimage_uio::small_vector_ns::llvm *this, size_t a2)
{
  void *result;

  result = malloc_type_realloc(this, a2, 0x78369460uLL);
  if (!result && (a2 || (result = malloc_type_malloc(1uLL, 0xEFF1C82EuLL)) == 0))
    abort();
  return result;
}

void diskimage_uio::small_vector_ns::report_size_overflow(diskimage_uio::small_vector_ns *this, unint64_t a2)
{
  std::string *v3;
  __int128 v4;
  std::string *v5;
  __int128 v6;
  std::string *p_p;
  std::string::size_type size;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  __int128 v12;
  std::logic_error *exception;
  std::string __p;
  std::string v15;
  std::string v16;
  std::string v17;
  std::string v18;
  std::string v19;

  std::to_string(&v15, (unint64_t)this);
  v3 = std::string::insert(&v15, 0, "SmallVector unable to grow. Requested capacity (", 0x30uLL);
  v4 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__r.__words[2] = v3->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v4;
  v3->__r_.__value_.__l.__size_ = 0;
  v3->__r_.__value_.__r.__words[2] = 0;
  v3->__r_.__value_.__r.__words[0] = 0;
  v5 = std::string::append(&v16, ") is larger than maximum value for size type (", 0x2EuLL);
  v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__r.__words[2] = v5->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v6;
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  std::to_string(&__p, a2);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v9 = std::string::append(&v17, (const std::string::value_type *)p_p, size);
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v18.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v18.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  v11 = std::string::append(&v18, ")", 1uLL);
  v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v19.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v19.__r_.__value_.__l.__data_ = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v18.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::logic_error::logic_error(exception, &v19);
  exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  __cxa_throw(exception, (struct type_info *)off_24CEEAFA0, MEMORY[0x24BEDAAF0]);
}

void sub_212FDC90C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;

  if (*(char *)(v33 - 25) < 0)
    operator delete(*(void **)(v33 - 48));
  _Unwind_Resume(exception_object);
}

void diskimage_uio::small_vector_ns::report_at_maximum_capacity(diskimage_uio::small_vector_ns *this)
{
  std::string *v1;
  __int128 v2;
  std::logic_error *exception;
  std::string v4;
  std::string v5;

  std::to_string(&v4, (unint64_t)this);
  v1 = std::string::insert(&v4, 0, "SmallVector capacity unable to grow. Already at maximum size ", 0x3DuLL);
  v2 = *(_OWORD *)&v1->__r_.__value_.__l.__data_;
  v5.__r_.__value_.__r.__words[2] = v1->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v5.__r_.__value_.__l.__data_ = v2;
  v1->__r_.__value_.__l.__size_ = 0;
  v1->__r_.__value_.__r.__words[2] = 0;
  v1->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v4.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__r_.__value_.__l.__data_);
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::logic_error::logic_error(exception, &v5);
  exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  __cxa_throw(exception, (struct type_info *)off_24CEEAFA0, MEMORY[0x24BEDAAF0]);
}

void sub_212FDCA44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL check_mntfromname(const char *a1)
{
  return !strcmp(a1, "lifs") || strcmp(a1, "fskit") == 0;
}

uint64_t _FSGetLocationFromStatfs(uint64_t a1, char *a2, size_t a3)
{
  void *v6;
  void *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = malloc_type_calloc(1uLL, 0x400uLL, 0x1359B406uLL);
  if (v6)
  {
    v7 = v6;
    if (check_mntfromname((const char *)(a1 + 72)))
    {
      v8 = strstr((char *)(a1 + 1112), "://");
      if (!v8 || (v9 = v8 + 3, (v10 = strchr(v8 + 3, 47)) == 0))
      {
        v12 = 22;
LABEL_17:
        free(v7);
        return v12;
      }
      if (v10 - v9 >= 1023)
        v11 = 1023;
      else
        v11 = v10 - v9;
      __memcpy_chk();
      *((_BYTE *)v7 + v11) = 0;
      if (!a2)
      {
LABEL_16:
        v12 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      if (strncmp((const char *)(a1 + 1112), "/dev/disk", 9uLL))
        strncmp((const char *)(a1 + 1112), "/dev/rdisk", 0xAuLL);
      __strlcpy_chk();
      if (!a2)
        goto LABEL_16;
    }
    strlcpy(a2, (const char *)v7, a3);
    goto LABEL_16;
  }
  return 12;
}

uint64_t aaS3ContextClone(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const void *v4;
  size_t v5;
  size_t v6;
  __int16 v7;
  void *v8;
  void *v9;
  const void *v10;
  size_t v11;
  size_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  const void *v16;
  size_t v17;
  size_t v18;
  void *v19;
  void *v20;
  const void *v21;
  size_t v22;
  size_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  curl_slist **p_list;
  curl_slist *v28;
  char **p_data;
  char *v30;
  _BOOL4 v31;
  curl_slist *v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v38;
  curl_slist **v39;
  curl_slist *v40;
  char **v41;
  char *v42;
  _BOOL4 v43;
  curl_slist *v44;
  char v46;
  curl_slist *list;

  v2 = malloc(0xAF8uLL);
  v3 = (uint64_t)v2;
  if (!v2)
  {
    v7 = 192;
LABEL_36:
    v33 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Context.c", (uint64_t)"aaS3ContextClone", v7, 80, *v33, "malloc", v34, v35, v46);
    AAS3ContextDestroy(v3);
    return 0;
  }
  memset_s(v2, 0xAF8uLL, 0, 0xAF8uLL);
  if (*(_DWORD *)a1)
  {
    *(_DWORD *)v3 = 1;
    memcpy((void *)(v3 + 4), (const void *)(a1 + 4), 0xAC4uLL);
  }
  v4 = *(const void **)(a1 + 2760);
  if (v4)
  {
    v5 = strlen(*(const char **)(a1 + 2760));
    v6 = v5 + 1;
    if (v5 + 1 >= 0x2000000001)
    {
      *__error() = 12;
LABEL_13:
      v13 = (_QWORD *)(v3 + 2760);
      v7 = 198;
LABEL_35:
      *v13 = 0;
      goto LABEL_36;
    }
    v8 = malloc(v5 + 1);
    if (!v8)
      goto LABEL_13;
    v9 = v8;
    memcpy(v8, v4, v6);
    *(_QWORD *)(v3 + 2760) = v9;
  }
  v10 = *(const void **)(a1 + 2768);
  if (v10)
  {
    v11 = strlen(*(const char **)(a1 + 2768));
    v12 = v11 + 1;
    if (v11 + 1 >= 0x2000000001)
    {
      *__error() = 12;
LABEL_19:
      v13 = (_QWORD *)(v3 + 2768);
      v7 = 199;
      goto LABEL_35;
    }
    v14 = malloc(v11 + 1);
    if (!v14)
      goto LABEL_19;
    v15 = v14;
    memcpy(v14, v10, v12);
    *(_QWORD *)(v3 + 2768) = v15;
  }
  v16 = *(const void **)(a1 + 2776);
  if (v16)
  {
    v17 = strlen(*(const char **)(a1 + 2776));
    v18 = v17 + 1;
    if (v17 + 1 >= 0x2000000001)
    {
      *__error() = 12;
LABEL_25:
      v13 = (_QWORD *)(v3 + 2776);
      v7 = 200;
      goto LABEL_35;
    }
    v19 = malloc(v17 + 1);
    if (!v19)
      goto LABEL_25;
    v20 = v19;
    memcpy(v19, v16, v18);
    *(_QWORD *)(v3 + 2776) = v20;
  }
  v21 = *(const void **)(a1 + 2784);
  if (v21)
  {
    v22 = strlen(*(const char **)(a1 + 2784));
    v23 = v22 + 1;
    if (v22 + 1 >= 0x2000000001)
    {
      *__error() = 12;
LABEL_34:
      v13 = (_QWORD *)(v3 + 2784);
      v7 = 201;
      goto LABEL_35;
    }
    v24 = malloc(v22 + 1);
    if (!v24)
      goto LABEL_34;
    v25 = v24;
    memcpy(v24, v21, v23);
    *(_QWORD *)(v3 + 2784) = v25;
  }
  v26 = *(_QWORD *)(a1 + 2792);
  if (v26)
  {
    list = 0;
    p_list = &list;
    while (1)
    {
      v28 = (curl_slist *)malloc(0x10uLL);
      if (!v28)
        break;
      p_data = &v28->data;
      v28->data = 0;
      v28->next = 0;
      *p_list = v28;
      v30 = strdup(*(const char **)v26);
      *p_data = v30;
      if (!v30)
        break;
      p_list = (curl_slist **)(p_data + 1);
      v26 = *(_QWORD *)(v26 + 8);
      if (!v26)
      {
        v31 = 1;
        v32 = list;
        goto LABEL_39;
      }
    }
    curl_slist_free_all(list);
    v32 = 0;
    v31 = *(_QWORD *)(a1 + 2792) != 0;
LABEL_39:
    *(_QWORD *)(v3 + 2792) = v32;
    if (v31 && v32 == 0)
    {
      v7 = 202;
      goto LABEL_36;
    }
  }
  else
  {
    *(_QWORD *)(v3 + 2792) = 0;
  }
  v38 = *(_QWORD *)(a1 + 2800);
  if (!v38)
  {
    *(_QWORD *)(v3 + 2800) = 0;
    return v3;
  }
  list = 0;
  v39 = &list;
  while (1)
  {
    v40 = (curl_slist *)malloc(0x10uLL);
    if (!v40)
      break;
    v41 = &v40->data;
    v40->data = 0;
    v40->next = 0;
    *v39 = v40;
    v42 = strdup(*(const char **)v38);
    *v41 = v42;
    if (!v42)
      break;
    v39 = (curl_slist **)(v41 + 1);
    v38 = *(_QWORD *)(v38 + 8);
    if (!v38)
    {
      v43 = 1;
      v44 = list;
      goto LABEL_53;
    }
  }
  curl_slist_free_all(list);
  v44 = 0;
  v43 = *(_QWORD *)(a1 + 2800) != 0;
LABEL_53:
  *(_QWORD *)(v3 + 2800) = v44;
  if (v43 && v44 == 0)
  {
    v7 = 203;
    goto LABEL_36;
  }
  return v3;
}

void AAS3ContextDestroy(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)(a1 + 2760));
    free(*(void **)(a1 + 2768));
    free(*(void **)(a1 + 2776));
    free(*(void **)(a1 + 2784));
    curl_slist_free_all(*(curl_slist **)(a1 + 2792));
    curl_slist_free_all(*(curl_slist **)(a1 + 2800));
    memset_s((void *)a1, 0xAF8uLL, 0, 0xAF8uLL);
    free((void *)a1);
  }
}

void *AAS3ContextCreate()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  v0 = malloc(0xAF8uLL);
  v1 = v0;
  if (!v0)
  {
    v9 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Context.c", (uint64_t)"AAS3ContextCreate", 355, 80, *v9, "malloc", v10, v11, v13);
    goto LABEL_5;
  }
  memset_s(v0, 0xAF8uLL, 0, 0xAF8uLL);
  if ((AAS3ContextSetFieldString((uint64_t)v1, 5, "Not A Ninja/1.0", v2, v3, v4, v5, v6) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Context.c", (uint64_t)"AAS3ContextCreate", 358, 80, 0, "set context", v7, v8, v13);
    memset_s(v1, 0xAF8uLL, 0, 0xAF8uLL);
LABEL_5:
    free(v1);
    return 0;
  }
  return v1;
}

uint64_t AAS3ContextSetFieldString(uint64_t a1, int a2, char *__s, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void **v9;
  curl_slist **v10;
  curl_slist *v11;
  curl_slist *v12;
  uint64_t result;
  size_t v14;
  size_t v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  __int16 v21;
  char v22;

  switch(a2)
  {
    case 0:
      v9 = (void **)(a1 + 2760);
      if (__s)
        goto LABEL_17;
      goto LABEL_20;
    case 1:
      v9 = (void **)(a1 + 2768);
      if (!__s)
        goto LABEL_20;
      goto LABEL_17;
    case 2:
      v9 = (void **)(a1 + 2776);
      if (!__s)
        goto LABEL_20;
      goto LABEL_17;
    case 3:
      v10 = (curl_slist **)(a1 + 2792);
      if (!__s)
        return 0;
      goto LABEL_12;
    case 4:
      v10 = (curl_slist **)(a1 + 2800);
      if (!__s)
        return 0;
LABEL_12:
      if (!*__s)
        return 0;
      v11 = curl_slist_append(*v10, __s);
      if (v11)
      {
        v12 = v11;
        result = 0;
        *v10 = v12;
        return result;
      }
      v18 = *__error();
      v21 = 407;
      goto LABEL_26;
    case 5:
      v9 = (void **)(a1 + 2784);
      if (!__s)
        goto LABEL_20;
LABEL_17:
      if (!*__s)
      {
LABEL_20:
        v16 = 0;
LABEL_21:
        free(*v9);
        result = 0;
        *v9 = v16;
        return result;
      }
      v14 = strlen(__s);
      v15 = v14 + 1;
      if (v14 + 1 >= 0x2000000001)
      {
        *__error() = 12;
        goto LABEL_24;
      }
      v17 = malloc(v14 + 1);
      if (v17)
      {
        v16 = v17;
        memcpy(v17, __s, v15);
        goto LABEL_21;
      }
LABEL_24:
      v18 = *__error();
      v21 = 399;
LABEL_26:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Context.c", (uint64_t)"AAS3ContextSetFieldString", v21, 80, v18, "malloc", v19, v20, v22);
      return 0xFFFFFFFFLL;
    default:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Context.c", (uint64_t)"AAS3ContextSetFieldString", 391, 80, 0, "invalid field %u", a7, a8, a2);
      return 0xFFFFFFFFLL;
  }
}

uint64_t downloadStreamClose_curl(uint64_t a1)
{
  double v2;
  FILE **v3;
  FILE *v4;
  unint64_t v5;
  unint64_t v6;
  FILE *v7;
  unint64_t v8;
  timeval v10;

  if (a1)
  {
    if (*(_QWORD *)a1 >> 62)
    {
      v10.tv_sec = 0;
      *(_QWORD *)&v10.tv_usec = 0;
      gettimeofday(&v10, 0);
      v2 = (double)v10.tv_sec + (double)v10.tv_usec * 0.000001 - *(double *)(a1 + 40);
      v3 = (FILE **)MEMORY[0x24BDAC8D8];
      fwrite("AAS3DownloadStream (curl)\n", 0x1AuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      v4 = *v3;
      v5 = atomic_load((unint64_t *)(a1 + 32));
      v6 = atomic_load((unint64_t *)(a1 + 32));
      fprintf(v4, "%12llu bytes downloaded (%.2f MB)\n", v5, (double)v6 * 0.000000953674316);
      v7 = *v3;
      v8 = atomic_load((unint64_t *)(a1 + 32));
      fprintf(v7, "%12.2f MB/s download speed\n", (double)v8 / v2 * 0.000000953674316);
    }
    s3StreamBaseRelease(a1);
    memset_s((void *)a1, 0x30uLL, 0, 0x30uLL);
    free((void *)a1);
  }
  return 0;
}

AAByteStream_impl *s3DownloadStreamOpen_curl(char *a1, uint64_t a2, uint64_t a3)
{
  AAByteStream_impl *v6;
  double *v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;
  timeval v12;

  curl_global_init(3);
  v6 = AACustomByteStreamOpen();
  v7 = (double *)malloc(0x30uLL);
  if (!v7 || (v8 = v7, memset_s(v7, 0x30uLL, 0, 0x30uLL), !v6))
  {
    perror("malloc");
    goto LABEL_7;
  }
  if ((s3StreamBaseInit(v8, a1, a2, a3) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamCurl.c", (uint64_t)"s3DownloadStreamOpen_curl", 132, 83, 0, "s3StreamBaseInit", v9, v10, v12.tv_sec);
LABEL_7:
    AAByteStreamClose(v6);
    return 0;
  }
  v12.tv_sec = 0;
  *(_QWORD *)&v12.tv_usec = 0;
  gettimeofday(&v12, 0);
  v8[5] = (double)v12.tv_sec + (double)v12.tv_usec * 0.000001;
  AACustomByteStreamSetData(v6, v8);
  AACustomByteStreamSetCloseProc(v6, (AAByteStreamCloseProc)downloadStreamClose_curl);
  AACustomByteStreamSetPReadProc(v6, (AAByteStreamPReadProc)downloadStreamPRead);
  AACustomByteStreamSetReadProc(v6, (AAByteStreamReadProc)downloadStreamRead);
  return v6;
}

uint64_t downloadStreamPRead(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  useconds_t v12;
  int v13;
  uint64_t result;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  const char *v23[2];
  char __str[200];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v21 = a2;
  *((_QWORD *)&v21 + 1) = a3;
  v22 = 0;
  v5 = a2;
  if (a3)
  {
    v18 = a2;
    v6 = a4 + a3;
    v7 = a4 + a3 - 1;
    while (1)
    {
      snprintf(__str, 0xC8uLL, "Range: bytes=%llu-%llu", v6 - a3, v7);
      v11 = 0;
      v23[0] = __str;
      v23[1] = 0;
      v19 = v21;
      v20 = v22;
      v12 = 125000;
      do
      {
        if (v11)
        {
          pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamCurl.c", (uint64_t)"downloadStreamPRead", 65, 83, "s3Perform retry after %u ms", v8, v9, v10, v12 / 0x3E8);
          usleep(v12);
          v12 *= 2;
        }
        v21 = v19;
        v22 = v20;
        v13 = s3Perform(1u, *(char **)(a1 + 8), a1, 0, &v21, 0, v23);
        if ((v13 & 0x80000000) == 0)
          break;
      }
      while (v11++ < 3);
      if (v13 < 0)
        break;
      a3 = *((_QWORD *)&v21 + 1);
      if (!*((_QWORD *)&v21 + 1))
      {
        v5 = v21;
        a2 = v18;
        goto LABEL_12;
      }
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamCurl.c", (uint64_t)"downloadStreamPRead", 81, 83, 0, "s3Perform failed (after retry), %s", v9, v10, (char)__str);
    return -1;
  }
  else
  {
LABEL_12:
    result = v5 - a2;
    v16 = (unint64_t *)(a1 + 32);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + result, v16));
  }
  return result;
}

uint64_t downloadStreamRead(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t *v3;
  uint64_t v4;

  v3 = (unint64_t *)(a1 + 24);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 + a3, v3));
  return downloadStreamPRead(a1, a2, a3, v4);
}

uint64_t s3HMAC_SHA256(_DWORD *a1, unsigned int *a2, const void *a3, size_t a4)
{
  CCHmacContext v8;

  memset(&v8, 0, sizeof(v8));
  CCHmacInit(&v8, 2u, a2 + 1, *a2);
  CCHmacUpdate(&v8, a3, a4);
  CCHmacFinal(&v8, a1 + 1);
  *a1 = 32;
  memset_s(a1 + 9, 0xE0uLL, 0, 0xE0uLL);
  memset_s(&v8, 0x180uLL, 0, 0x180uLL);
  return 0;
}

uint64_t s3SHA256(uint64_t a1, const void *a2, CC_LONG a3)
{
  CC_SHA256_CTX v7;

  memset(&v7, 0, sizeof(v7));
  CC_SHA256_Init(&v7);
  CC_SHA256_Update(&v7, a2, a3);
  CC_SHA256_Final((unsigned __int8 *)(a1 + 4), &v7);
  *(_DWORD *)a1 = 32;
  memset_s((void *)(a1 + 36), 0xE0uLL, 0, 0xE0uLL);
  return memset_s(&v7, 0x68uLL, 0, 0x68uLL);
}

size_t s3BufWrite(char *__src, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v10;

  v4 = __src;
  v5 = a3 * a2;
  v6 = *(_QWORD *)(a4 + 16);
  if (v6)
  {
    if (*(_QWORD *)(v6 + 24))
    {
      v7 = 0;
      if (v5)
      {
        while (1)
        {
          v8 = (*(uint64_t (**)(_QWORD, char *, size_t))(v6 + 24))(*(_QWORD *)v6, v4, v5);
          if (v8 < 1)
            break;
          v4 += v8;
          v7 += v8;
          v5 -= v8;
          if (!v5)
            return v7 & ~(v7 >> 63);
        }
        v7 = v8;
      }
    }
    else
    {
      v7 = -1;
    }
    return v7 & ~(v7 >> 63);
  }
  else
  {
    if (v5 >= *(_QWORD *)(a4 + 8))
      v5 = *(_QWORD *)(a4 + 8);
    memcpy(*(void **)a4, __src, v5);
    v10 = *(_QWORD *)(a4 + 8) - v5;
    *(_QWORD *)a4 += v5;
    *(_QWORD *)(a4 + 8) = v10;
    return v5;
  }
}

size_t s3BufRead(char *__dst, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v10;

  v4 = __dst;
  v5 = a3 * a2;
  v6 = *(_QWORD *)(a4 + 16);
  if (v6)
  {
    if (*(_QWORD *)(v6 + 16))
    {
      v7 = 0;
      if (v5)
      {
        while (1)
        {
          v8 = (*(uint64_t (**)(_QWORD, char *, size_t))(v6 + 16))(*(_QWORD *)v6, v4, v5);
          if (v8 < 0)
            break;
          if (v8)
          {
            v4 += v8;
            v7 += v8;
            v5 -= v8;
            if (v5)
              continue;
          }
          return v7 & ~(v7 >> 63);
        }
        v7 = v8;
      }
    }
    else
    {
      v7 = -1;
    }
    return v7 & ~(v7 >> 63);
  }
  else
  {
    if (v5 >= *(_QWORD *)(a4 + 8))
      v5 = *(_QWORD *)(a4 + 8);
    memcpy(__dst, *(const void **)a4, v5);
    v10 = *(_QWORD *)(a4 + 8) - v5;
    *(_QWORD *)a4 += v5;
    *(_QWORD *)(a4 + 8) = v10;
    return v5;
  }
}

uint64_t s3HeaderAppendWithFormat(curl_slist **a1, char *__format, ...)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  size_t v9;
  char *v10;
  char *v11;
  const char *v12;
  __int16 v13;
  int v14;
  curl_slist *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  va_list va;

  va_start(va, __format);
  v4 = vsnprintf(0, 0, __format, va);
  if (v4 < 0)
  {
    v11 = 0;
LABEL_8:
    v12 = "vsnprintf";
    v13 = 156;
    v14 = 0;
LABEL_12:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3HeaderAppendWithFormat", v13, 84, v14, v12, v5, v6, v20);
    v18 = 0xFFFFFFFFLL;
    v7 = v11;
  }
  else
  {
    v7 = 0;
    v8 = 1;
    while ((v8 & 1) != 0)
    {
      v9 = (v4 + 1);
      v10 = (char *)realloc(v7, v9);
      v11 = v10;
      if (!v10)
      {
        free(v7);
        v14 = *__error();
        v12 = "malloc";
        v13 = 161;
        goto LABEL_12;
      }
      v4 = vsnprintf(v10, v9, __format, va);
      v8 = 0;
      v7 = v11;
      if (v4 < 0)
        goto LABEL_8;
    }
    v15 = curl_slist_append(*a1, v7);
    if (v15)
    {
      v18 = 0;
      *a1 = v15;
    }
    else
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3HeaderAppendWithFormat", 168, 84, 0, "curl_slist_append failed\n", v16, v17, v20);
      v18 = 0xFFFFFFFFLL;
    }
  }
  free(v7);
  return v18;
}

uint64_t s3HeaderAppend(curl_slist **a1, const char *a2)
{
  curl_slist *v3;
  uint64_t v4;
  uint64_t v5;
  curl_slist *v6;
  char v8;

  v3 = curl_slist_append(*a1, a2);
  v6 = v3;
  if (v3)
    *a1 = v3;
  else
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3HeaderAppend", 182, 84, 0, "curl_slist_append failed\n", v4, v5, v8);
  if (v6)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

unint64_t curlWriteData(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v6 = a3 * a2;
  if ((*(_DWORD *)(a4 + 8) & 0x80000000) != 0)
  {
    v11 = 499;
    curl_easy_getinfo(*(CURL **)a4, CURLINFO_RESPONSE_CODE, &v11);
    v7 = v11;
    *(_DWORD *)(a4 + 8) = v11;
    if (v7 == 200)
    {
      if (*(_DWORD *)(a4 + 12))
        *(_QWORD *)(a4 + 24) = *(_QWORD *)(a4 + 16);
    }
  }
  v8 = *(_QWORD *)(a4 + 24);
  v9 = v6 - v8;
  if (v6 >= v8)
  {
    if (v8)
    {
      a1 += v8;
      *(_QWORD *)(a4 + 24) = 0;
    }
    else
    {
      v9 = v6;
    }
    s3BufWrite(a1, v9, 1, *(_QWORD *)(a4 + 32));
  }
  else
  {
    *(_QWORD *)(a4 + 24) = v8 - v6;
  }
  return v6;
}

uint64_t s3Perform(unsigned int a1, char *a2, uint64_t a3, uint64_t a4, __int128 *a5, uint64_t a6, const char **a7)
{
  uint64_t v14;
  uint64_t v15;
  CURL *v16;
  uint64_t v17;
  const char *v18;
  const char **v19;
  const char *v20;
  CURLcode v21;
  CURLcode v22;
  CURLcode v23;
  _BOOL4 v24;
  BOOL v25;
  FILE *v26;
  const char *v27;
  size_t v28;
  uint64_t v29;
  CURLcode v31;
  unsigned __int32 v32;
  CURLcode v33;
  CURLcode v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  const char *v39;
  int v40;
  int v41;
  char v42;
  const char *v43;
  int v44;
  int v45;
  CURLcode v46;
  CURLcode v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 *v58;
  __int128 v59;
  uint64_t v60;
  curl_slist *v61;

  v14 = *(_QWORD *)(a3 + 16);
  v61 = 0;
  if (a4)
    v15 = *(_QWORD *)(a4 + 8);
  else
    v15 = -1;
  v59 = 0uLL;
  v60 = 0;
  if (a5)
  {
    v59 = *a5;
    v60 = *((_QWORD *)a5 + 2);
  }
  v58 = 0;
  v56 = 0u;
  v57 = 0u;
  v16 = curl_easy_init();
  if (!v16)
  {
    v26 = (FILE *)*MEMORY[0x24BDAC8D8];
    v27 = "curl_easy_init failed\n";
    v28 = 22;
LABEL_42:
    fwrite(v27, v28, 1uLL, v26);
    goto LABEL_43;
  }
  if ((s3HeaderAppend(&v61, "Content-Type:") & 0x80000000) != 0
    || (s3HeaderAppend(&v61, "Transfer-Encoding:") & 0x80000000) != 0
    || (s3HeaderAppend(&v61, "Accept: application/xml") & 0x80000000) != 0
    || (v15 & 0x8000000000000000) == 0
    && (s3HeaderAppendWithFormat(&v61, "Content-Length: %zd", v15) & 0x80000000) != 0)
  {
    goto LABEL_43;
  }
  v17 = *(_QWORD *)(*(_QWORD *)(a3 + 16) + 2792);
  if (v17)
  {
    while ((s3HeaderAppend(&v61, *(const char **)v17) & 0x80000000) == 0)
    {
      v17 = *(_QWORD *)(v17 + 8);
      if (!v17)
        goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_15:
  if (a7)
  {
    v18 = *a7;
    if (*a7)
    {
      v19 = a7 + 1;
      while ((s3HeaderAppend(&v61, v18) & 0x80000000) == 0)
      {
        v20 = *v19++;
        v18 = v20;
        if (!v20)
          goto LABEL_20;
      }
      goto LABEL_43;
    }
  }
LABEL_20:
  if (*(_DWORD *)v14 && (s3Sign(&v61, a1, a2, v14, a4) & 0x80000000) != 0)
  {
    v26 = (FILE *)*MEMORY[0x24BDAC8D8];
    v27 = "Failed to sign request\n";
    v28 = 23;
    goto LABEL_42;
  }
  v21 = curl_easy_setopt(v16, CURLOPT_URL, a2);
  v22 = curl_easy_setopt(v16, CURLOPT_HTTPHEADER, v61);
  v23 = curl_easy_setopt(v16, CURLOPT_BUFFERSIZE, 102400);
  v24 = (curl_easy_setopt(v16, CURLOPT_TCP_KEEPALIVE, 1) | v23 | v22 | v21) == 0;
  if (*(_QWORD *)(v14 + 2784) && curl_easy_setopt(v16, CURLOPT_USERAGENT, *(_QWORD *)(v14 + 2784)))
    v24 = 0;
  if (*(_QWORD *)(v14 + 2760) && curl_easy_setopt(v16, CURLOPT_PROXY, *(_QWORD *)(v14 + 2760)))
    v24 = 0;
  if (*(_QWORD *)(v14 + 2768) && curl_easy_setopt(v16, CURLOPT_PINNEDPUBLICKEY, *(_QWORD *)(v14 + 2768)))
    v24 = 0;
  if (*(_QWORD *)(v14 + 2776) && curl_easy_setopt(v16, CURLOPT_PROXY_PINNEDPUBLICKEY, *(_QWORD *)(v14 + 2776)))
    v24 = 0;
  if (*(_QWORD *)(v14 + 2800) && curl_easy_setopt(v16, CURLOPT_PROXYHEADER, *(_QWORD *)(v14 + 2800)))
    v24 = 0;
  if (a1 != 2)
  {
    if (a1 == 1)
    {
      v33 = curl_easy_setopt(v16, CURLOPT_CUSTOMREQUEST, "GET");
      v25 = (curl_easy_setopt(v16, CURLOPT_FOLLOWLOCATION, 1) | v33) == 0;
    }
    else
    {
      if (a1)
        goto LABEL_53;
      v25 = curl_easy_setopt(v16, CURLOPT_PUT, 1) == CURLE_OK;
    }
    if (!v25)
      v24 = 0;
LABEL_53:
    if (!a4)
      goto LABEL_57;
    goto LABEL_54;
  }
  if (curl_easy_setopt(v16, CURLOPT_POST, 1))
    v24 = 0;
  if (!a4)
  {
    v31 = curl_easy_setopt(v16, CURLOPT_POSTFIELDS, "");
    v32 = curl_easy_setopt(v16, CURLOPT_POSTFIELDSIZE, 0) | v31;
    goto LABEL_55;
  }
LABEL_54:
  v34 = curl_easy_setopt(v16, CURLOPT_READFUNCTION, s3BufRead);
  v32 = curl_easy_setopt(v16, CURLOPT_READDATA, a4) | v34;
LABEL_55:
  if (v32)
    v24 = 0;
LABEL_57:
  if (a5)
  {
    *(_QWORD *)&v56 = v16;
    v58 = a5;
    DWORD2(v56) = -1;
    if (a7)
    {
      v35 = *a7;
      if (*a7)
      {
        v36 = 0;
        v37 = MEMORY[0x24BDAC740];
        do
        {
          if (!strncmp(v35, "Range:", 6uLL))
          {
            v40 = *((unsigned __int8 *)v35 + 6);
            v39 = v35 + 6;
            v38 = v40;
            if (v40)
            {
              do
              {
                if (v38 < 0)
                {
                  if (!__maskrune(v38, 0x4000uLL))
                    break;
                }
                else if ((*(_DWORD *)(v37 + 4 * v38 + 60) & 0x4000) == 0)
                {
                  break;
                }
                v41 = *(unsigned __int8 *)++v39;
                v38 = v41;
              }
              while (v41);
            }
            if (!strncmp(v39, "bytes=", 6uLL))
            {
              v44 = *((unsigned __int8 *)v39 + 6);
              v43 = v39 + 6;
              v42 = v44;
              if (v44)
              {
                do
                {
                  if (v42 < 0)
                  {
                    if (!__maskrune(v42, 0x4000uLL))
                      break;
                  }
                  else if ((*(_DWORD *)(v37 + 4 * v42 + 60) & 0x4000) == 0)
                  {
                    break;
                  }
                  v45 = *(unsigned __int8 *)++v43;
                  v42 = v45;
                }
                while (v45);
              }
              HIDWORD(v56) = 1;
              *(_QWORD *)&v57 = strtoull(v43, 0, 0);
            }
          }
          v35 = a7[++v36];
        }
        while (v35);
      }
    }
    v46 = curl_easy_setopt(v16, CURLOPT_WRITEFUNCTION, curlWriteData);
    if (curl_easy_setopt(v16, CURLOPT_WRITEDATA, &v56) | v46)
      v24 = 0;
  }
  if (a6)
  {
    if (curl_easy_setopt(v16, CURLOPT_HEADERFUNCTION, s3BufWrite))
      v24 = 0;
    if (curl_easy_setopt(v16, CURLOPT_HEADERDATA, a6))
      goto LABEL_86;
  }
  if (!v24)
  {
LABEL_86:
    v26 = (FILE *)*MEMORY[0x24BDAC8D8];
    v27 = "curl_easy_setopt failed\n";
    v28 = 24;
    goto LABEL_42;
  }
  v47 = curl_easy_perform(v16);
  if (v47 == CURLE_OK)
  {
    v55 = 499;
    curl_easy_getinfo(v16, CURLINFO_RESPONSE_CODE, &v55);
    if ((unint64_t)(v55 - 400) <= 0xC7)
    {
      if (a1 != 1 || v55 != 416)
      {
        pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3Perform", 401, 84, "HTTP %u\n", v52, v53, v54, v55);
        goto LABEL_43;
      }
      if (a5)
      {
        v29 = 0;
        *a5 = v59;
        *((_QWORD *)a5 + 2) = v60;
        goto LABEL_44;
      }
    }
    v29 = 0;
    goto LABEL_44;
  }
  v48 = v47;
  curl_easy_strerror(v47);
  pc_log_warning((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3Perform", 379, 84, "> %d %s\n", v49, v50, v51, v48);
LABEL_43:
  v29 = 0xFFFFFFFFLL;
LABEL_44:
  curl_slist_free_all(v61);
  curl_easy_cleanup(v16);
  return v29;
}

uint64_t s3Sign(curl_slist **a1, unsigned int a2, char *__s, uint64_t a4, uint64_t a5)
{
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v14;
  __int16 v15;
  int v16;
  _BOOL4 v17;
  uint64_t v19;
  char *v20;
  char *v21;
  const char *v22;
  char *v23;
  const char *v24;
  char *v25;
  const char *v26;
  size_t v27;
  BOOL v28;
  uint64_t v29;
  size_t v30;
  const void *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned __int8 *v34;
  uint64_t v35;
  size_t v36;
  char *v37;
  int v38;
  unsigned __int8 *v39;
  size_t v40;
  char *v41;
  int v42;
  curl_slist *v43;
  uint64_t v44;
  curl_slist *v45;
  uint64_t v46;
  uint64_t v47;
  const char *data;
  size_t v49;
  _BYTE *v50;
  _BYTE *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  unsigned int v55;
  size_t v56;
  size_t v57;
  char *v58;
  char *v59;
  char *v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  __int16 v64;
  size_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  size_t v72;
  char *v73;
  size_t v74;
  size_t v75;
  size_t v76;
  char *v77;
  size_t v78;
  char *v79;
  size_t v80;
  CC_LONG v81;
  unsigned __int8 *v82;
  uint64_t v83;
  size_t v84;
  char *v85;
  int v86;
  void **v87;
  void *v88;
  size_t v89;
  size_t v90;
  unsigned __int8 *v91;
  uint64_t v92;
  size_t v93;
  char *v94;
  int v95;
  size_t v96;
  size_t v97;
  size_t v98;
  size_t v99;
  size_t v100;
  char v101;
  curl_slist **v102;
  uint64_t v103;
  char *v104;
  size_t v105;
  char *__src;
  size_t __n;
  char *v108;
  unsigned int v109;
  const char *v110;
  char *v111;
  _QWORD *v112;
  unint64_t v113[2];
  const char *v114;
  unint64_t v115[2];
  char *v116;
  unint64_t v117[2];
  char *v118;
  unint64_t v119[2];
  char *v120;
  char v121[128];
  char __str[128];
  _OWORD __sa[16];
  int v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  int v141;
  uint64_t v142;

  v142 = *MEMORY[0x24BDAC8D0];
  v119[0] = 0;
  v119[1] = 0;
  v120 = 0;
  v117[0] = 0;
  v117[1] = 0;
  v118 = 0;
  v115[0] = 0;
  v115[1] = 0;
  v116 = 0;
  v113[0] = 0;
  v113[1] = 0;
  v114 = 0;
  v124 = 0;
  memset(__sa, 0, sizeof(__sa));
  v10 = strlen(__s);
  if (v10 < 7)
    goto LABEL_8;
  if (*(_DWORD *)__s == 1886680168 && *(_DWORD *)(__s + 3) == 791624304)
  {
    v19 = 7;
  }
  else
  {
    if (v10 < 8 || *(_QWORD *)__s != 0x2F2F3A7370747468)
    {
LABEL_8:
      v14 = "Invalid URL";
      v15 = 486;
LABEL_9:
      v16 = 0;
LABEL_10:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3Sign", v15, 84, v16, v14, v11, v12, v101);
LABEL_11:
      v17 = 0;
      goto LABEL_12;
    }
    v19 = 8;
  }
  v20 = &__s[v19];
  v21 = strchr(&__s[v19], 47);
  if (!v21)
  {
    v14 = "Invalid URL";
    v15 = 488;
    goto LABEL_9;
  }
  v22 = v21;
  v111 = v20;
  v109 = a2;
  v23 = strchr(v21, 63);
  v24 = "/";
  v110 = v22;
  if (!v23)
  {
    v30 = strlen(v22);
    if (v30 <= 1)
      v29 = 1;
    else
      v29 = v30;
    if (v30)
      v24 = v22;
    goto LABEL_32;
  }
  v25 = v23;
  v26 = v23 + 1;
  v27 = strlen(v23 + 1);
  v28 = v25 == v22;
  if (v25 == v22)
    v29 = 1;
  else
    v29 = v25 - v22;
  if (!v28)
    v24 = v22;
  if (!v27)
  {
LABEL_32:
    v27 = 0;
    v26 = "";
  }
  __n = v27;
  v108 = (char *)v26;
  if ((s3HeaderAppendWithFormat(a1, "X-Amz-Date: %s", (const char *)(a4 + 68)) & 0x80000000) != 0
    || *(_BYTE *)(a4 + 452)
    && (s3HeaderAppendWithFormat(a1, "X-Amz-Security-Token: %s", (const char *)(a4 + 452)) & 0x80000000) != 0)
  {
    goto LABEL_11;
  }
  __src = (char *)v24;
  if (a5)
  {
    v31 = *(const void **)a5;
    v32 = *(_QWORD *)(a5 + 8);
    v141 = 0;
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    s3SHA256((uint64_t)&v125, v31, v32);
    if ((_DWORD)v125)
    {
      v33 = v29;
      v34 = (unsigned __int8 *)&v125 + 4;
      v35 = 2 * v125;
      v36 = v35 | 1;
      v37 = __str;
      do
      {
        v38 = *v34++;
        snprintf(v37, v36, "%02x", v38);
        v36 -= 2;
        v37 += 2;
      }
      while (v36 != 1);
LABEL_44:
      v29 = v33;
      goto LABEL_46;
    }
  }
  else
  {
    v141 = 0;
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    s3SHA256((uint64_t)&v125, 0, 0);
    if ((_DWORD)v125)
    {
      v33 = v29;
      v39 = (unsigned __int8 *)&v125 + 4;
      v35 = 2 * v125;
      v40 = v35 | 1;
      v41 = __str;
      do
      {
        v42 = *v39++;
        snprintf(v41, v40, "%02x", v42);
        v40 -= 2;
        v41 += 2;
      }
      while (v40 != 1);
      goto LABEL_44;
    }
  }
  v35 = 0;
LABEL_46:
  __str[v35] = 0;
  memset_s(&v125, 0x104uLL, 0, 0x104uLL);
  if ((s3HeaderAppendWithFormat(a1, "X-Amz-Content-Sha256: %s", __str) & 0x80000000) != 0)
    goto LABEL_11;
  v43 = *a1;
  if (*a1)
  {
    v44 = 0;
    do
    {
      ++v44;
      v43 = v43->next;
    }
    while (v43);
  }
  else
  {
    v44 = 0;
  }
  v112 = calloc(v44 + 1, 8uLL);
  if (!v112)
  {
    v16 = *__error();
    v14 = "malloc";
    v15 = 520;
    goto LABEL_10;
  }
  v104 = (char *)(a4 + 68);
  v105 = v29;
  v102 = a1;
  v103 = a4;
  v45 = *a1;
  if (!v45)
  {
    v46 = 0;
LABEL_77:
    v56 = v22 - v111;
    v57 = v110 - v111 + 6;
    if (v57 >= 0x2000000001)
    {
      *__error() = 12;
LABEL_82:
      v61 = *__error();
      v64 = 554;
      goto LABEL_85;
    }
    v58 = (char *)malloc(v57);
    if (!v58)
      goto LABEL_82;
    v59 = &v58[v56];
    v112[v46] = v58;
    v58[4] = 58;
    *(_DWORD *)v58 = 1953722216;
    memcpy(v58 + 5, v111, v56);
    v59[5] = 0;
    qsort(v112, v46 + 1, 8uLL, (int (__cdecl *)(const void *, const void *))s3StringCompare);
    if (v109 > 3)
      v60 = "???";
    else
      v60 = off_24CF15920[v109];
    v65 = strlen(v60);
    if ((s3StringBufferAppend(v119, v60, v65) & 0x80000000) == 0
      && (s3StringBufferAppend(v119, "\n", 1uLL) & 0x80000000) == 0
      && (s3StringBufferAppend(v119, __src, v105) & 0x80000000) == 0
      && (s3StringBufferAppend(v119, "\n", 1uLL) & 0x80000000) == 0
      && (s3StringBufferAppend(v119, v108, __n) & 0x80000000) == 0
      && (s3StringBufferAppend(v119, "\n", 1uLL) & 0x80000000) == 0)
    {
      if (v46 == -1)
      {
LABEL_102:
        if ((s3StringBufferAppend(v119, "\n", 1uLL) & 0x80000000) == 0)
        {
          v73 = v118;
          v74 = strlen(v118);
          if ((s3StringBufferAppend(v119, v118, v74) & 0x80000000) == 0
            && (s3StringBufferAppend(v119, "\n", 1uLL) & 0x80000000) == 0)
          {
            v75 = strlen(__str);
            if ((s3StringBufferAppend(v119, __str, v75) & 0x80000000) == 0
              && (s3StringBufferAppend(v115, "AWS4-HMAC-SHA256\n", 0x11uLL) & 0x80000000) == 0)
            {
              v76 = strlen(v104);
              if ((s3StringBufferAppend(v115, v104, v76) & 0x80000000) == 0
                && (s3StringBufferAppend(v115, "\n", 1uLL) & 0x80000000) == 0)
              {
                v77 = (char *)(v103 + 4);
                v78 = strlen((const char *)(v103 + 4));
                if ((s3StringBufferAppend(v115, (void *)(v103 + 4), v78) & 0x80000000) == 0
                  && (s3StringBufferAppend(v115, "/", 1uLL) & 0x80000000) == 0)
                {
                  v79 = (char *)(v103 + 132);
                  v80 = strlen((const char *)(v103 + 132));
                  if ((s3StringBufferAppend(v115, (void *)(v103 + 132), v80) & 0x80000000) == 0
                    && (s3StringBufferAppend(v115, "/s3/aws4_request\n", 0x11uLL) & 0x80000000) == 0)
                  {
                    v141 = 0;
                    v139 = 0u;
                    v140 = 0u;
                    v137 = 0u;
                    v138 = 0u;
                    v135 = 0u;
                    v136 = 0u;
                    v133 = 0u;
                    v134 = 0u;
                    v131 = 0u;
                    v132 = 0u;
                    v129 = 0u;
                    v130 = 0u;
                    v127 = 0u;
                    v128 = 0u;
                    v125 = 0u;
                    v126 = 0u;
                    v81 = strlen(v120);
                    s3SHA256((uint64_t)&v125, v120, v81);
                    if ((_DWORD)v125)
                    {
                      v82 = (unsigned __int8 *)&v125 + 4;
                      v83 = 2 * v125;
                      v84 = v83 | 1;
                      v85 = v121;
                      do
                      {
                        v86 = *v82++;
                        snprintf(v85, v84, "%02x", v86);
                        v84 -= 2;
                        v85 += 2;
                      }
                      while (v84 != 1);
                    }
                    else
                    {
                      v83 = 0;
                    }
                    v121[v83] = 0;
                    memset_s(&v125, 0x104uLL, 0, 0x104uLL);
                    v89 = strlen(v121);
                    if ((s3StringBufferAppend(v115, v121, v89) & 0x80000000) == 0)
                    {
                      v90 = strlen(v116);
                      s3HMAC_SHA256(__sa, (unsigned int *)(v103 + 2500), v116, v90);
                      if (LODWORD(__sa[0]))
                      {
                        v91 = (unsigned __int8 *)__sa + 4;
                        v92 = 2 * LODWORD(__sa[0]);
                        v93 = v92 | 1;
                        v94 = v121;
                        do
                        {
                          v95 = *v91++;
                          snprintf(v94, v93, "%02x", v95);
                          v93 -= 2;
                          v94 += 2;
                        }
                        while (v93 != 1);
                      }
                      else
                      {
                        v92 = 0;
                      }
                      v121[v92] = 0;
                      if ((s3StringBufferAppend(v113, "AWS4-HMAC-SHA256 Credential=", 0x1CuLL) & 0x80000000) == 0)
                      {
                        v96 = strlen((const char *)(v103 + 196));
                        if ((s3StringBufferAppend(v113, (void *)(v103 + 196), v96) & 0x80000000) == 0
                          && (s3StringBufferAppend(v113, "/", 1uLL) & 0x80000000) == 0)
                        {
                          v97 = strlen(v77);
                          if ((s3StringBufferAppend(v113, v77, v97) & 0x80000000) == 0
                            && (s3StringBufferAppend(v113, "/", 1uLL) & 0x80000000) == 0)
                          {
                            v98 = strlen(v79);
                            if ((s3StringBufferAppend(v113, v79, v98) & 0x80000000) == 0
                              && (s3StringBufferAppend(v113, "/s3/aws4_request,SignedHeaders=", 0x1FuLL) & 0x80000000) == 0)
                            {
                              v99 = strlen(v73);
                              if ((s3StringBufferAppend(v113, v73, v99) & 0x80000000) == 0
                                && (s3StringBufferAppend(v113, ",Signature=", 0xBuLL) & 0x80000000) == 0)
                              {
                                v100 = strlen(v121);
                                if ((s3StringBufferAppend(v113, v121, v100) & 0x80000000) == 0)
                                {
                                  v17 = (int)s3HeaderAppendWithFormat(v102, "Authorization: %s", v114) >= 0;
                                  goto LABEL_119;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      else
      {
        v66 = 0;
        while (1)
        {
          v67 = (char *)v112[v66];
          v68 = strchr(v67, 58);
          if (!v68)
            break;
          v71 = v68;
          v72 = strlen(v67);
          if ((s3StringBufferAppend(v119, v67, v72) & 0x80000000) != 0
            || (s3StringBufferAppend(v119, "\n", 1uLL) & 0x80000000) != 0
            || v66 && (s3StringBufferAppend(v117, ";", 1uLL) & 0x80000000) != 0
            || (s3StringBufferAppend(v117, v67, v71 - v67) & 0x80000000) != 0)
          {
            goto LABEL_118;
          }
          if (v46 + 1 == ++v66)
            goto LABEL_102;
        }
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3Sign", 580, 84, 0, "Invalid header: %s", v69, v70, (char)v67);
      }
    }
LABEL_118:
    v17 = 0;
LABEL_119:
    ++v46;
    goto LABEL_120;
  }
  v46 = 0;
  v47 = MEMORY[0x24BDAC740];
  while (1)
  {
    data = v45->data;
    if (strncasecmp(v45->data, "x-amz-", 6uLL))
      goto LABEL_73;
    v49 = strlen(data);
    if (v49 + 1 >= 0x2000000001)
      break;
    v50 = malloc(v49 + 1);
    if (!v50)
      goto LABEL_84;
    v51 = v50;
    v112[v46] = v50;
    if (v49)
    {
      v52 = 0;
      v53 = 0;
      v54 = 1;
      while (1)
      {
        v55 = v45->data[v52];
        if ((v55 & 0x80000000) != 0)
        {
          if (!__maskrune(v45->data[v52], 0x4000uLL))
          {
LABEL_64:
            if (v55 == 58)
              v54 = 0;
            if (v54)
              LOBYTE(v55) = __tolower(v55);
            v51[v53++] = v55;
          }
        }
        else if ((*(_DWORD *)(v47 + 4 * v55 + 60) & 0x4000) == 0)
        {
          goto LABEL_64;
        }
        if (v49 == ++v52)
          goto LABEL_72;
      }
    }
    v53 = 0;
LABEL_72:
    ++v46;
    v51[v53] = 0;
LABEL_73:
    v45 = v45->next;
    if (!v45)
      goto LABEL_77;
  }
  *__error() = 12;
LABEL_84:
  v61 = *__error();
  v64 = 538;
LABEL_85:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3Sign", v64, 84, v61, "malloc", v62, v63, v101);
  v17 = 0;
LABEL_120:
  if (v46)
  {
    v87 = (void **)v112;
    do
    {
      v88 = *v87++;
      free(v88);
      --v46;
    }
    while (v46);
  }
  free(v112);
LABEL_12:
  memset_s(__sa, 0x104uLL, 0, 0x104uLL);
  memset_s(v121, 0x80uLL, 0, 0x80uLL);
  memset_s(__str, 0x80uLL, 0, 0x80uLL);
  s3StringBufferFree((uint64_t)v119);
  s3StringBufferFree((uint64_t)v117);
  s3StringBufferFree((uint64_t)v115);
  s3StringBufferFree((uint64_t)v113);
  if (v17)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t s3StringCompare(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

uint64_t s3StringBufferAppend(unint64_t *a1, void *__src, size_t __n)
{
  unint64_t v6;
  unint64_t v7;
  size_t v8;
  BOOL v9;
  size_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;
  unint64_t v16;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v7 = *a1;
  v6 = a1[1];
  v8 = v6 + __n + 1;
  v9 = v8 >= *a1;
  v10 = v8 - *a1;
  if (!v9)
    v10 = 0;
  v11 = (v10 + 255) & 0xFFFFFFFFFFFFFF00;
  v12 = v7 + v11;
  v13 = (char *)a1[2];
  if (v7 + v11 <= v7)
    goto LABEL_8;
  if (v12 < 0x2000000001)
  {
    v14 = (char *)realloc((void *)a1[2], v7 + v11);
    if (!v14)
    {
      free(v13);
      goto LABEL_10;
    }
    a1[2] = (unint64_t)v14;
    *a1 = v12;
    v13 = v14;
    v6 = a1[1];
LABEL_8:
    memcpy(&v13[v6], __src, __n);
    result = 0;
    v16 = a1[2];
    v17 = a1[1] + __n;
    a1[1] = v17;
    *(_BYTE *)(v16 + v17) = 0;
    return result;
  }
  *__error() = 12;
LABEL_10:
  a1[2] = 0;
  v18 = __error();
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3StringBufferAppend", 431, 84, *v18, "malloc", v19, v20, v21);
  *a1 = 0;
  a1[1] = 0;
  return 0xFFFFFFFFLL;
}

void s3StringBufferFree(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 16);
  if (v1)
    memset_s(*(void **)(a1 + 16), *(_QWORD *)a1, 0, *(_QWORD *)a1);
  free(v1);
}

uint64_t s3StreamBaseInit(_QWORD *__s, char *a2, uint64_t a3, uint64_t a4)
{
  size_t v8;
  size_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  __int16 v17;
  char v19;

  if (__s)
    memset_s(__s, 0x18uLL, 0, 0x18uLL);
  *__s = a4;
  if (a2)
  {
    v8 = strlen(a2);
    v9 = v8 + 1;
    if (v8 + 1 >= 0x2000000001)
    {
      *__error() = 12;
LABEL_10:
      __s[1] = 0;
      v13 = *__error();
      v16 = "strdup";
      v17 = 653;
      goto LABEL_15;
    }
    v10 = malloc(v8 + 1);
    if (!v10)
      goto LABEL_10;
    v11 = v10;
    memcpy(v10, a2, v9);
    __s[1] = v11;
  }
  if (a3)
    v12 = aaS3ContextClone(a3);
  else
    v12 = (uint64_t)AAS3ContextCreate();
  __s[2] = v12;
  if (v12)
    return 0;
  v13 = *__error();
  v16 = "malloc";
  v17 = 656;
LABEL_15:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Common.c", (uint64_t)"s3StreamBaseInit", v17, 84, v13, v16, v14, v15, v19);
  s3StreamBaseRelease((uint64_t)__s);
  return 0xFFFFFFFFLL;
}

uint64_t s3StreamBaseRelease(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  AAS3ContextDestroy(*(_QWORD *)(a1 + 16));
  return memset_s((void *)a1, 0x18uLL, 0, 0x18uLL);
}

AAByteStream_impl *AAS3DownloadStreamOpen(char *a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a2 && *(_DWORD *)a2)
    return s3DownloadStreamOpen_curl(a1, a2, a3);
  else
    return s3DownloadStreamOpen_urlsession(a1, a2, a3, a4);
}

void sub_212FDF3C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_32w(uint64_t a1, uint64_t a2)
{
  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));
}

void __destroy_helper_block_e8_32w(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 32));
}

uint64_t downloadStreamClose_urlsession(_QWORD *a1)
{
  void *v2;
  double v3;
  FILE **v4;
  FILE *v5;
  unint64_t v6;
  unint64_t v7;
  FILE *v8;
  unint64_t v9;
  timeval v11;

  if (a1)
  {
    v2 = (void *)a1[3];
    if (v2)
    {
      a1[3] = 0;
      atomic_store(objc_msgSend(v2, "bytesDownloaded"), a1 + 5);
      objc_msgSend(v2, "invalidateAndCancel");

    }
    if (*a1 >> 62)
    {
      v11.tv_sec = 0;
      *(_QWORD *)&v11.tv_usec = 0;
      gettimeofday(&v11, 0);
      v3 = (double)v11.tv_sec + (double)v11.tv_usec * 0.000001 - *((double *)a1 + 6);
      v4 = (FILE **)MEMORY[0x24BDAC8D8];
      fwrite("AAS3DownloadStream (NSURLSession)\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
      fprintf(*v4, "%12u max attempts for a request\n", *((_DWORD *)a1 + 14));
      fprintf(*v4, "%12u max requests in flight\n", *((_DWORD *)a1 + 16));
      fprintf(*v4, "%12.2f initial interval between retries (s)\n", *((float *)a1 + 15));
      v5 = *v4;
      v6 = atomic_load(a1 + 5);
      v7 = atomic_load(a1 + 5);
      fprintf(v5, "%12llu bytes downloaded (%.2f MB)\n", v6, (double)v7 * 0.000000953674316);
      v8 = *v4;
      v9 = atomic_load(a1 + 5);
      fprintf(v8, "%12.2f MB/s download speed\n", (double)v9 / v3 * 0.000000953674316);
    }
    s3StreamBaseRelease((uint64_t)a1);
    memset_s(a1, 0x48uLL, 0, 0x48uLL);
    free(a1);
  }
  return 0;
}

AAByteStream s3DownloadStreamOpen_urlsession(char *a1, uint64_t a2, uint64_t a3, int a4)
{
  AAByteStream v8;
  double *v9;
  double *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  AAS3DownloadSession *v14;
  void *v15;
  id v16;
  id v17;
  double v18;
  uint64_t v19;
  const char *v20;
  __int16 v21;
  timeval v23;

  v8 = AACustomByteStreamOpen();
  v9 = (double *)malloc(0x48uLL);
  v10 = v9;
  if (!v9 || (memset_s(v9, 0x48uLL, 0, 0x48uLL), !v8))
  {
    perror("malloc");
    goto LABEL_12;
  }
  if ((s3StreamBaseInit(v10, a1, a2, a3) & 0x80000000) != 0)
  {
    v20 = "s3StreamBaseInit";
    v21 = 697;
LABEL_11:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"s3DownloadStreamOpen_urlsession", v21, 121, 0, v20, v11, v12, v23.tv_sec);
LABEL_12:
    free(v8);
    downloadStreamClose_urlsession(v10);
    return 0;
  }
  v23.tv_sec = 0;
  *(_QWORD *)&v23.tv_usec = 0;
  gettimeofday(&v23, 0);
  v10[6] = (double)v23.tv_sec + (double)v23.tv_usec * 0.000001;
  v10[7] = 32.0;
  if (a4)
    v13 = a4;
  else
    v13 = 16;
  *((_DWORD *)v10 + 16) = v13;
  v14 = [AAS3DownloadSession alloc];
  v15 = (void *)MEMORY[0x24BDBCF48];
  v16 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
  v17 = (id)objc_msgSend(v15, "URLWithString:", v16);
  LODWORD(v18) = *((_DWORD *)v10 + 15);
  v19 = -[AAS3DownloadSession initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:](v14, "initWithURL:streamBase:maxAttempts:pauseInterval:maxRequestsInFlight:", v17, v10, *((unsigned int *)v10 + 14), *((unsigned int *)v10 + 16), v18);

  if (!v19)
  {
    v20 = "creating session";
    v21 = 710;
    goto LABEL_11;
  }
  *((_QWORD *)v10 + 3) = v19;
  *(_QWORD *)v8 = v10;
  *((_QWORD *)v8 + 1) = downloadStreamClose_urlsession;
  *((_QWORD *)v8 + 4) = downloadStreamPRead_0;
  *((_QWORD *)v8 + 2) = downloadStreamRead_0;
  *((_QWORD *)v8 + 10) = downloadStreamPReadAsync;
  return v8;
}

uint64_t downloadStreamPRead_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_QWORD *)a1 >> 62 == 3)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "NSURLSession read to buffer nbyte=%zx offset=%llx\n", a3, a4);
  return objc_msgSend(*(id *)(a1 + 24), "readToBuffer:size:atOffset:", a2, a3, a4);
}

uint64_t downloadStreamRead_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t *v3;
  uint64_t v4;

  v3 = (unint64_t *)(a1 + 32);
  do
    v4 = __ldaxr(v3);
  while (__stlxr(v4 + a3, v3));
  return downloadStreamPRead_0(a1, a2, a3, v4);
}

uint64_t downloadStreamPReadAsync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_QWORD *)a1 >> 62 == 3)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "NSURLSession read to stream nbyte=%zx offset=%llx\n", a3, a4);
  return objc_msgSend(*(id *)(a1 + 24), "readToAsyncByteStream:size:atOffset:", a2, a3, a4);
}

uint64_t contextCreate(char **a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  char *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  __int16 v11;
  int v13;
  char *v14;
  char *v15;
  char v16;

  v4 = malloc(0x58uLL);
  v5 = (uint64_t)v4;
  if (!v4)
  {
    v7 = *__error();
    v10 = "malloc";
    v11 = 308;
LABEL_12:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextCreate", v11, 125, v7, v10, v8, v9, v16);
    goto LABEL_13;
  }
  memset_s(v4, 0x58uLL, 0, 0x58uLL);
  *(_QWORD *)(v5 + 80) = a2;
  if (a1)
  {
    if ((contextSetString(v5, 0, *a1, "KNOX_APPLECONNECT_ACCOUNT") & 0x80000000) != 0
      || (contextSetString(v5, 1u, a1[1], "KNOX_KEYTAB_FILE") & 0x80000000) != 0
      || (contextSetString(v5, 2u, a1[2], "KNOX_DAW_TOKEN") & 0x80000000) != 0
      || (contextSetString(v5, 3u, a1[3], "KNOX_DAW_TOKEN_FILE") & 0x80000000) != 0
      || (contextSetString(v5, 4u, a1[4], "KNOX_WESTGATE_TOKEN") & 0x80000000) != 0
      || (contextSetString(v5, 5u, a1[5], "KNOX_WESTGATE_TOKEN_FILE") & 0x80000000) != 0
      || (contextSetString(v5, 8u, a1[6], "KNOX_USER_AGENT") & 0x80000000) != 0)
    {
      goto LABEL_13;
    }
    v6 = a1[7];
  }
  else
  {
    if ((contextSetString(v5, 0, 0, "KNOX_APPLECONNECT_ACCOUNT") & 0x80000000) != 0)
      goto LABEL_13;
    if ((contextSetString(v5, 1u, 0, "KNOX_KEYTAB_FILE") & 0x80000000) != 0)
      goto LABEL_13;
    if ((contextSetString(v5, 2u, 0, "KNOX_DAW_TOKEN") & 0x80000000) != 0)
      goto LABEL_13;
    if ((contextSetString(v5, 3u, 0, "KNOX_DAW_TOKEN_FILE") & 0x80000000) != 0)
      goto LABEL_13;
    if ((contextSetString(v5, 4u, 0, "KNOX_WESTGATE_TOKEN") & 0x80000000) != 0)
      goto LABEL_13;
    if ((contextSetString(v5, 5u, 0, "KNOX_WESTGATE_TOKEN_FILE") & 0x80000000) != 0)
      goto LABEL_13;
    v13 = contextSetString(v5, 8u, 0, "KNOX_USER_AGENT");
    v6 = 0;
    if (v13 < 0)
      goto LABEL_13;
  }
  if ((contextSetString(v5, 9u, v6, "KNOX_PROXY") & 0x80000000) != 0)
  {
LABEL_13:
    contextDestroy((char *)v5);
    return 0;
  }
  if (!*(_QWORD *)(v5 + 16))
  {
    v15 = *(char **)(v5 + 24);
    if (v15)
    {
      if ((contextLoadString(v5, 2u, v15) & 0x80000000) != 0)
      {
        v10 = "loading daw token";
        v11 = 324;
        goto LABEL_31;
      }
    }
  }
  if (!*(_QWORD *)(v5 + 32))
  {
    v14 = *(char **)(v5 + 40);
    if (v14)
    {
      if ((contextLoadString(v5, 4u, v14) & 0x80000000) != 0)
      {
        v10 = "loading westgate token";
        v11 = 327;
LABEL_31:
        v7 = 0;
        goto LABEL_12;
      }
    }
  }
  return v5;
}

uint64_t contextResolveWestgateToken(uint64_t a1, char *__s)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  AAByteStream_impl *v8;
  size_t v9;
  size_t v10;
  size_t v11;
  size_t v12;
  const char *v13;
  __int16 v14;
  int v15;
  void *v16;
  void *v17;
  size_t v18;
  size_t v19;
  void **v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  __int16 v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  AAByteStream_impl *v30;
  void **v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void **v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  FILE **v51;
  char *v52;
  void *v53;
  char *v54;
  char *v55;
  FILE *v56;
  FILE *v57;
  char *v58;
  size_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  const char *v63;
  __int16 v64;
  int *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  void **v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  const char *v83;
  __int16 v84;
  int *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  __int16 v89;
  const char *v90;
  int *v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  __int16 v99;
  const char *v100;
  __int16 v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  int v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  size_t i;
  size_t v110;
  int v111;
  char *v112;
  char *v113;
  BOOL v114;
  const char *v115;
  __int16 v116;
  char v117;
  char v118;
  char *__s1[2];
  char *__sa[2];
  __int128 v121;
  uint64_t v122;
  const char *v123[3];

  v123[2] = *(const char **)MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
    return 0;
  v5 = *(const char **)(a1 + 16);
  if (v5)
    goto LABEL_4;
  v11 = strlen(__s);
  v12 = v11 + 200;
  if (v11 + 200 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_72:
    v65 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetServiceName", 345, 125, *v65, "malloc", v66, v67, v117);
    v27 = 0;
    v38 = 0;
    v30 = 0;
LABEL_101:
    AAJSONInputStreamClose(v38);
    AAByteStreamClose(v30);
    free(v27);
    v24 = "getting service name and realm";
    v25 = 649;
    goto LABEL_102;
  }
  v26 = malloc(v11 + 200);
  if (!v26)
    goto LABEL_72;
  v27 = v26;
  v30 = (AAByteStream_impl *)AATempStreamOpen();
  if (!v30)
  {
    v88 = "AATempStreamOpen";
    v89 = 348;
LABEL_94:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetServiceName", v89, 125, 0, v88, v28, v29, v117);
    v38 = 0;
    goto LABEL_101;
  }
  snprintf((char *)v27, v12, "https://%s/westgate/appinfo", __s);
  if ((knoxRequest(a1, 1u, (char *)v27, 0, (uint64_t)v30) & 0x80000000) != 0)
  {
    v117 = (char)v27;
    v88 = "Knox request failed: %s";
    v89 = 351;
    goto LABEL_94;
  }
  AAByteStreamSeek(v30, 0, 0);
  v31 = (void **)AAJSONInputStreamOpen((uint64_t)v30);
  v38 = v31;
  if (!v31)
  {
    v100 = "AAJSONInputStreamOpen";
    v101 = 356;
    goto LABEL_100;
  }
  v122 = 0;
  *(_OWORD *)__sa = 0u;
  v121 = 0u;
  *(_OWORD *)__s1 = 0u;
  if ((AAJSONInputStreamRead((uint64_t)v31, (int *)__s1, v32, v33, v34, v35, v36, v37) & 0x80000000) != 0)
  {
LABEL_95:
    v100 = "parsing JSON";
    v101 = 363;
    goto LABEL_100;
  }
  v43 = 0;
  v44 = 0;
  while (1)
  {
    if (LODWORD(__s1[0]) < 2)
    {
      if (v44 == 1 && __s1[1] && !strcmp(__s1[1], "idms"))
        v43 = 1;
      ++v44;
      goto LABEL_41;
    }
    if (LODWORD(__s1[0]) != 2)
    {
      if (LODWORD(__s1[0]) == 3)
      {
        if (v43)
        {
          v45 = __s1[1];
          if (__s1[1])
          {
            if (strcmp(__s1[1], "realm"))
            {
LABEL_33:
              if (!strcmp(v45, "serviceName") && (contextSetString(a1, 7u, __sa[0], 0) & 0x80000000) != 0)
              {
                v100 = "serviceName";
                v101 = 378;
                goto LABEL_100;
              }
              goto LABEL_41;
            }
            if ((contextSetString(a1, 6u, __sa[0], 0) & 0x80000000) == 0)
            {
              v45 = __s1[1];
              goto LABEL_33;
            }
            v100 = "realm";
            v101 = 377;
LABEL_100:
            pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetServiceName", v101, 125, 0, v100, v36, v37, v118);
            goto LABEL_101;
          }
        }
      }
LABEL_41:
      if (!v44)
        break;
      goto LABEL_42;
    }
    v43 = 0;
    if (!--v44)
      break;
LABEL_42:
    v122 = 0;
    *(_OWORD *)__sa = 0u;
    v121 = 0u;
    *(_OWORD *)__s1 = 0u;
    if ((AAJSONInputStreamRead((uint64_t)v38, (int *)__s1, v39, v40, v41, v42, v36, v37) & 0x80000000) != 0)
      goto LABEL_95;
  }
  if (!*(_QWORD *)(a1 + 48) || !*(_QWORD *)(a1 + 56))
  {
    v100 = "could not parse service name and realm";
    v101 = 389;
    goto LABEL_100;
  }
  AAJSONInputStreamClose(v38);
  AAByteStreamClose(v30);
  free(v27);
  __s1[0] = 0;
  __s1[1] = 0;
  __sa[0] = 0;
  v48 = *(const char **)(a1 + 48);
  if (!v48 || (v49 = *(const char **)(a1 + 56)) == 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDAWToken", 411, 125, 0, "missing service name or realm", v46, v47, v118);
    v53 = 0;
LABEL_111:
    v94 = 0;
    v55 = 0;
    goto LABEL_156;
  }
  v50 = *(_QWORD *)(a1 + 80) >> 62;
  if (v50)
  {
    v51 = (FILE **)MEMORY[0x24BDAC8D8];
    fwrite("  obtaining a DAW token from the appleconnect CLI\n", 0x32uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    fprintf(*v51, "  - realm: %s\n", v48);
    fprintf(*v51, "  - service name: %s\n", v49);
  }
  v52 = (char *)malloc(0x4000uLL);
  v53 = v52;
  if (!v52)
  {
    __s1[0] = 0;
    __s1[1] = 0;
    __sa[0] = 0;
    v91 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDAWToken", 420, 125, *v91, "malloc", v92, v93, v118);
    goto LABEL_111;
  }
  __s1[1] = (char *)0x4000;
  __sa[0] = v52;
  v54 = (char *)malloc(0x4000uLL);
  v55 = v54;
  if (!v54)
  {
    v95 = *__error();
    v98 = "malloc";
    v99 = 422;
LABEL_115:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDAWToken", v99, 125, v95, v98, v96, v97, v118);
    v94 = 0;
    goto LABEL_156;
  }
  snprintf(v54, 0x4000uLL, "/usr/local/bin/appleconnect serviceTicket --show-signIn-dialog --dawToken --realm %s --serviceName %s", v48, v49);
  if (*(_QWORD *)a1)
  {
    if (v50)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "  - account: %s\n", *(const char **)a1);
    __strlcat_chk();
    __strlcat_chk();
  }
  if (*(_QWORD *)(a1 + 8))
  {
    if (v50)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "  - keytab file: %s\n", *(const char **)(a1 + 8));
    __strlcat_chk();
    __strlcat_chk();
  }
  v56 = popen(v55, "r");
  if (!v56)
  {
    v95 = *__error();
    v118 = (char)v55;
    v98 = "%s";
    v99 = 444;
    goto LABEL_115;
  }
  v57 = v56;
  v58 = 0;
  while (1)
  {
    v59 = fread(&v58[(_QWORD)v53], 1uLL, 0x4000 - (_QWORD)v58, v57);
    if (v59)
    {
      v62 = (unint64_t)&v58[v59];
      if (__CFADD__(v58, v59) || v62 > 0x4000)
      {
        __s1[0] = v58;
        v63 = "invalid read";
        v64 = 454;
        goto LABEL_153;
      }
      goto LABEL_70;
    }
    if (feof(v57))
      break;
    if (ferror(v57))
    {
      __s1[0] = v58;
      v111 = *__error();
      v63 = "fread";
      v64 = 452;
      goto LABEL_154;
    }
    v62 = (unint64_t)v58;
LABEL_70:
    v58 = (char *)v62;
    if (v62 == 0x4000)
    {
      __s1[0] = (char *)0x4000;
      v63 = "token is too long";
      v64 = 447;
      goto LABEL_153;
    }
  }
  __s1[0] = v58;
  if (v58)
  {
    v102 = (char *)v53 - 1;
    v103 = MEMORY[0x24BDAC740];
    do
    {
      v104 = v58[(_QWORD)v102];
      if (v58[(_QWORD)v102] < 0)
        v105 = __maskrune(v104, 0x4000uLL);
      else
        v105 = *(_DWORD *)(v103 + 4 * v104 + 60) & 0x4000;
      if (!v105)
        break;
      --v58;
    }
    while (v58);
    __s1[0] = v58;
  }
  v106 = (unint64_t)(v58 + 1);
  v107 = v58 == (char *)-1;
  v108 = v107 << 63 >> 63;
  if (v108 != v107 || v108 < 0 || (v106 & 0x8000000000000000) != 0)
    goto LABEL_152;
  if (v106 <= 0x4000)
  {
    v112 = __sa[0];
LABEL_140:
    __s1[0] = v58 + 1;
    v58[(_QWORD)v53] = 0;
    if ((unint64_t)(v58 + 1) >= 6
      && (*(_DWORD *)v112 == 1415004484 ? (v114 = *((unsigned __int16 *)v112 + 2) == 20043) : (v114 = 0), v114))
    {
      if ((contextSetString(a1, 2u, v112, 0) & 0x80000000) == 0)
      {
        v94 = 1;
        goto LABEL_147;
      }
      v115 = "daw token";
      v116 = 463;
    }
    else
    {
      v115 = "invalid token format";
      v116 = 460;
    }
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDAWToken", v116, 125, 0, v115, v60, v61, v117);
    v94 = 0;
LABEL_147:
    v53 = v112;
    goto LABEL_155;
  }
  for (i = 0x4000; i < v106; i += v110)
  {
    v110 = i >> 1;
    if ((i & (i >> 1)) != 0)
      v110 = i & (i >> 1);
  }
  if (i >= 0x2000000001)
  {
    *__error() = 12;
    goto LABEL_151;
  }
  v113 = (char *)realloc(v53, i);
  if (v113)
  {
    v112 = v113;
    __s1[1] = (char *)i;
    __sa[0] = v113;
    v53 = v113;
    goto LABEL_140;
  }
  free(v53);
LABEL_151:
  v53 = 0;
  __s1[0] = 0;
  __s1[1] = 0;
  __sa[0] = 0;
LABEL_152:
  v63 = "token is too long";
  v64 = 459;
LABEL_153:
  v111 = 0;
LABEL_154:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDAWToken", v64, 125, v111, v63, v60, v61, v117);
  v94 = 0;
LABEL_155:
  pclose(v57);
LABEL_156:
  free(v55);
  free(v53);
  memset_s(__s1, 0x18uLL, 0, 0x18uLL);
  if (!v94)
  {
    v24 = "getting DAW token";
    v25 = 650;
    goto LABEL_102;
  }
  if (*(_QWORD *)(a1 + 32))
    return 0;
  v5 = *(const char **)(a1 + 16);
  if (!v5)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetWestgateToken", 486, 125, 0, "missing host or DAW token", v22, v23, v117);
    v20 = 0;
    v8 = 0;
LABEL_17:
    v21 = 0;
    v17 = 0;
LABEL_18:
    AAJSONInputStreamClose(v20);
    AAByteStreamClose(v8);
    free(v17);
    free(v21);
    v24 = "getting Westgate token";
    v25 = 655;
LABEL_102:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextResolveWestgateToken", v25, 125, 0, v24, v22, v23, v117);
    return 0xFFFFFFFFLL;
  }
LABEL_4:
  if (*(_QWORD *)(a1 + 80) >> 62)
    fwrite("  requesting Westgate token from the Knox server\n", 0x31uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  v8 = (AAByteStream_impl *)AATempStreamOpen();
  if (!v8)
  {
    v13 = "AATempStreamOpen";
    v14 = 491;
    v15 = 0;
LABEL_16:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetWestgateToken", v14, 125, v15, v13, v6, v7, v117);
    v20 = 0;
    goto LABEL_17;
  }
  v9 = strlen(__s);
  v10 = v9 + 200;
  if (v9 + 200 >= 0x2000000001)
  {
    *__error() = 12;
    goto LABEL_15;
  }
  v16 = malloc(v9 + 200);
  if (!v16)
  {
LABEL_15:
    v15 = *__error();
    v13 = "malloc";
    v14 = 495;
    goto LABEL_16;
  }
  v17 = v16;
  v18 = strlen(v5);
  v19 = v18 + 200;
  if (v18 + 200 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_91:
    v85 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetWestgateToken", 498, 125, *v85, "malloc", v86, v87, v117);
    v20 = 0;
    v21 = 0;
    goto LABEL_18;
  }
  v68 = (char *)malloc(v18 + 200);
  if (!v68)
    goto LABEL_91;
  v21 = v68;
  snprintf(v68, v19, "Authorization: Bearer %s", v5);
  v123[0] = v21;
  v123[1] = 0;
  snprintf((char *)v17, v10, "https://%s/westgate/token", __s);
  if ((knoxRequest(a1, 2u, (char *)v17, v123, (uint64_t)v8) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetWestgateToken", 505, 125, 0, "Knox request failed: %s", v69, v70, (char)v17);
    v20 = 0;
    goto LABEL_18;
  }
  AAByteStreamSeek(v8, 0, 0);
  v71 = (void **)AAJSONInputStreamOpen((uint64_t)v8);
  v20 = v71;
  if (!v71)
  {
    v83 = "AAJSONInputStreamOpen";
    v84 = 510;
    goto LABEL_106;
  }
  v122 = 0;
  *(_OWORD *)__sa = 0u;
  v121 = 0u;
  *(_OWORD *)__s1 = 0u;
  if ((AAJSONInputStreamRead((uint64_t)v71, (int *)__s1, v72, v73, v74, v75, v76, v77) & 0x80000000) != 0)
  {
LABEL_90:
    v83 = "parsing JSON";
    v84 = 516;
LABEL_106:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetWestgateToken", v84, 125, 0, v83, v76, v77, v117);
    goto LABEL_18;
  }
  v82 = 0;
  while (1)
  {
    if (LODWORD(__s1[0]) < 2)
    {
      ++v82;
      goto LABEL_88;
    }
    if (LODWORD(__s1[0]) == 2)
      break;
    if (LODWORD(__s1[0]) != 3 || v82 != 1 || !__s1[1])
      goto LABEL_88;
    if (!strcasecmp(__s1[1], "password") && (contextSetString(a1, 4u, __sa[0], 0) & 0x80000000) != 0)
    {
      v83 = "password";
      v84 = 529;
      goto LABEL_106;
    }
    v82 = 1;
LABEL_89:
    v122 = 0;
    *(_OWORD *)__sa = 0u;
    v121 = 0u;
    *(_OWORD *)__s1 = 0u;
    if ((AAJSONInputStreamRead((uint64_t)v20, (int *)__s1, v78, v79, v80, v81, v76, v77) & 0x80000000) != 0)
      goto LABEL_90;
  }
  --v82;
LABEL_88:
  if (v82)
    goto LABEL_89;
  v90 = *(const char **)(a1 + 32);
  if (!v90 || strncmp(v90, "WGTKN", 5uLL))
  {
    v83 = "invalid/missing token";
    v84 = 537;
    goto LABEL_106;
  }
  AAJSONInputStreamClose(v20);
  AAByteStreamClose(v8);
  free(v17);
  free(v21);
  if (!*(_QWORD *)(a1 + 32))
  {
    v24 = "invalid Westgate token";
    v25 = 658;
    goto LABEL_102;
  }
  return 0;
}

void contextDestroy(char *a1)
{
  uint64_t i;

  if (a1)
  {
    for (i = 0; i != 80; i += 8)
      free(*(void **)&a1[i]);
    free(a1);
  }
}

uint64_t knoxRequest(uint64_t a1, unsigned int a2, char *a3, const char **a4, uint64_t a5)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t (**v16)(int *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (**v22)(int *);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t (*v34)(int *);
  uint64_t v35;
  uint64_t v36;
  size_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  const char *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  size_t v52;
  size_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  __int16 v58;
  uint64_t v59;
  __int16 v61;
  int v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  char v69;
  char *v70;
  const char **v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  uint64_t (**v76)(int *);
  _QWORD v77[2];
  uint64_t v78;

  v77[0] = 0;
  v77[1] = 0;
  v75 = 0uLL;
  v76 = 0;
  v72 = 0;
  v73 = 0;
  v74 = 0;
  v10 = AAS3ContextCreate();
  v78 = (uint64_t)v10;
  if (!v10)
  {
    v57 = "AAS3ContextCreate";
    v58 = 189;
LABEL_41:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxRequest", v58, 125, 0, v57, v11, v12, v68);
    v22 = 0;
LABEL_42:
    v29 = 0;
    v28 = 0;
LABEL_43:
    v59 = 0xFFFFFFFFLL;
    goto LABEL_44;
  }
  v13 = (uint64_t)v10;
  v14 = malloc(0x18uLL);
  v15 = v14;
  if (!v14)
  {
    v22 = (uint64_t (**)(int *))calloc(1uLL, 0x68uLL);
    goto LABEL_40;
  }
  memset_s(v14, 0x18uLL, 0, 0x18uLL);
  v16 = (uint64_t (**)(int *))calloc(1uLL, 0x68uLL);
  v22 = v16;
  if (!v16)
  {
LABEL_40:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxPageStreamOpen", 165, 125, 0, "malloc", v20, v21, v68);
    free(v15);
    free(v22);
    v57 = "open page stream";
    v58 = 192;
    goto LABEL_41;
  }
  *v15 = a5;
  *v16 = (uint64_t (*)(int *))v15;
  v16[1] = knoxPageStreamClose;
  v16[3] = (uint64_t (*)(int *))knoxPageStreamWrite;
  if ((AAS3ContextSetFieldString(v13, 5, *(char **)(a1 + 64), v17, v18, v19, v20, v21) & 0x80000000) != 0)
  {
    v61 = 194;
LABEL_47:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxRequest", v61, 125, 0, "setup context", v26, v27, v68);
    goto LABEL_42;
  }
  if ((AAS3ContextSetFieldString(v13, 0, *(char **)(a1 + 72), v23, v24, v25, v26, v27) & 0x80000000) != 0)
  {
    v61 = 195;
    goto LABEL_47;
  }
  v28 = (char *)malloc(0x800uLL);
  if (!v28)
  {
    v62 = *__error();
    v63 = 200;
LABEL_53:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxRequest", v63, 125, v62, "malloc", v55, v56, v68);
    v29 = 0;
    goto LABEL_43;
  }
  v29 = 0;
  v30 = "link:";
  v70 = a3;
  v71 = a4;
  while (2)
  {
    memset_s(v28, 0x800uLL, 0, 0x800uLL);
    v75 = 0uLL;
    v76 = v22;
    v72 = v28;
    v73 = 2047;
    v33 = a3;
    v74 = 0;
    if (v29)
    {
      if (v22[1] == knoxPageStreamClose)
      {
        v34 = *v22;
        if (*((int *)*v22 + 2) < 1 || !*((_DWORD *)v34 + 4))
          goto LABEL_15;
        if (!*((_DWORD *)v34 + 5) || AAByteStreamWrite(*(AAByteStream *)v34, ",", 1uLL) == 1)
        {
          *(_QWORD *)((char *)v34 + 12) = 1;
LABEL_15:
          *((_DWORD *)v34 + 5) = 0;
          v33 = v29;
          goto LABEL_16;
        }
        v64 = "writing ','";
        v65 = 146;
      }
      else
      {
        v64 = "invalid stream";
        v65 = 132;
      }
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxPageStreamEndPage", v65, 125, 0, v64, v31, v32, v68);
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxRequest", 209, 125, 0, "page stream next page", v66, v67, v69);
      goto LABEL_43;
    }
LABEL_16:
    if ((s3Perform(a2, v33, (uint64_t)v77, 0, &v75, (uint64_t)&v72, a4) & 0x80000000) != 0)
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxRequest", 212, 125, 0, "request: %s", v35, v36, (char)v33);
      goto LABEL_43;
    }
    free(v29);
    v37 = strlen(v28);
    if (v37)
    {
      v38 = v37;
      v29 = 0;
      v39 = 0;
      do
      {
        if (v38 <= v39 + 1)
          v40 = v39 + 1;
        else
          v40 = v38;
        v41 = v39;
        while (v28[v41] != 10)
        {
          if (v40 == ++v41)
          {
            v41 = v40;
            break;
          }
        }
        v28[v41] = 0;
        if (v41 - v39 >= 5)
        {
          v42 = &v28[v39];
          if (!strncmp(&v28[v39], v30, 5uLL))
          {
            v43 = v30;
            v44 = strchr(v42, 60);
            v45 = strrchr(v42, 62);
            if (!v44 || (v48 = v45) == 0 || v45 <= v44)
            {
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxRequest", 231, 125, 0, "invalid link header (1): %s", v46, v47, (char)v42);
              goto LABEL_43;
            }
            if (!strstr(v45, "rel=\"next\""))
            {
              pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxRequest", 233, 125, 0, "invalid link header (2): %s", v49, v50, (char)v42);
              goto LABEL_43;
            }
            *v48 = 0;
            v51 = v44 + 1;
            v52 = strlen(v51);
            v53 = v52 + 1;
            if (v52 + 1 >= 0x2000000001)
            {
              *__error() = 12;
LABEL_52:
              v63 = 236;
              v62 = 0;
              goto LABEL_53;
            }
            v54 = (char *)malloc(v52 + 1);
            if (!v54)
              goto LABEL_52;
            v29 = v54;
            memcpy(v54, v51, v53);
            v30 = v43;
          }
        }
        v39 = v41 + 1;
      }
      while (v41 + 1 < v38);
      a3 = v70;
      a4 = v71;
      if (v29)
        continue;
    }
    else
    {
      v29 = 0;
    }
    break;
  }
  v59 = 0;
LABEL_44:
  free(v29);
  free(v28);
  AAByteStreamClose((AAByteStream)v22);
  AAS3ContextDestroy(v78);
  return v59;
}

uint64_t contextGetDecryptionComponents(uint64_t a1, const char *a2, const char *a3, const char *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  unint64_t v9;
  uint64_t v16;
  uint64_t v17;
  AAByteStream_impl *v18;
  size_t v19;
  size_t v20;
  void **v21;
  const char *v22;
  __int16 v23;
  int v24;
  size_t v25;
  size_t v26;
  char *v27;
  uint64_t v28;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void **v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  int v46;
  const char *v47;
  char *v48;
  size_t v49;
  size_t v50;
  void *v51;
  void *v52;
  const char *v53;
  char *v54;
  size_t v55;
  size_t v56;
  void *v57;
  void *v58;
  int *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  __int16 v63;
  char v64;
  const char *v65;
  char v66;
  const char *v67;
  int v68;
  int v69;
  char *v70;
  char *__str;
  char *__s1[2];
  char *__s[2];
  __int128 v74;
  uint64_t v75;
  const char *v76[3];

  v76[2] = *(const char **)MEMORY[0x24BDAC8D0];
  v8 = *(char **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 80);
  *a5 = 0;
  *a6 = 0;
  if (!v8)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDecryptionComponents", 568, 125, 0, "missing Westgate token", a7, a8, v64);
    v21 = 0;
    v18 = 0;
LABEL_14:
    v27 = 0;
    goto LABEL_15;
  }
  if (v9 >> 62)
    fwrite("  requesting decryption components from the Knox server\n", 0x38uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  v18 = (AAByteStream_impl *)AATempStreamOpen();
  if (!v18)
  {
    v22 = "AATempStreamOpen";
    v23 = 573;
    v24 = 0;
LABEL_13:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDecryptionComponents", v23, 125, v24, v22, v16, v17, v64);
    v21 = 0;
    v8 = 0;
    goto LABEL_14;
  }
  v19 = strlen(a2);
  v20 = v19 + 200;
  if (v19 + 200 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_12:
    v24 = *__error();
    v22 = "malloc";
    v23 = 577;
    goto LABEL_13;
  }
  __str = (char *)malloc(v19 + 200);
  if (!__str)
    goto LABEL_12;
  v25 = strlen(v8);
  v26 = v25 + 200;
  if (v25 + 200 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_54:
    v59 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDecryptionComponents", 580, 125, *v59, "malloc", v60, v61, v64);
    v21 = 0;
    v8 = 0;
    v28 = 0xFFFFFFFFLL;
    v27 = __str;
    goto LABEL_16;
  }
  v30 = (char *)malloc(v25 + 200);
  if (!v30)
    goto LABEL_54;
  v65 = v8;
  v8 = v30;
  snprintf(v30, v26, "Authorization: Bearer %s", v65);
  v76[0] = v8;
  v76[1] = 0;
  v67 = a4;
  v27 = __str;
  snprintf(__str, v20, "https://%s/spaces/%s/files/%s/decryption-components", a2, a3, v67);
  if ((knoxRequest(a1, 2u, __str, v76, (uint64_t)v18) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDecryptionComponents", 587, 125, 0, "Knox request failed: %s", v31, v32, (char)__str);
    v21 = 0;
    goto LABEL_15;
  }
  AAByteStreamSeek(v18, 0, 0);
  v33 = (void **)AAJSONInputStreamOpen((uint64_t)v18);
  v21 = v33;
  if (!v33)
  {
    v62 = "AAJSONInputStreamOpen";
    v63 = 592;
    goto LABEL_62;
  }
  v75 = 0;
  *(_OWORD *)__s = 0u;
  v74 = 0u;
  *(_OWORD *)__s1 = 0u;
  if ((AAJSONInputStreamRead((uint64_t)v33, (int *)__s1, v34, v35, v36, v37, v38, v39) & 0x80000000) != 0)
  {
LABEL_56:
    v62 = "parsing JSON";
    v63 = 600;
    goto LABEL_62;
  }
  v44 = 0;
  v45 = 0;
  v46 = 0;
  v70 = v8;
  while (LODWORD(__s1[0]) >= 2)
  {
    if (LODWORD(__s1[0]) == 2)
    {
      v45 = 0;
      v44 = 0;
      --v46;
      goto LABEL_47;
    }
    if (LODWORD(__s1[0]) != 3)
      goto LABEL_47;
    v47 = __s1[1];
    if (v46 == 2 && v45 && __s1[1] && !strcmp(__s1[1], "key"))
    {
      v68 = v44;
      v48 = __s[0];
      if (!__s[0])
        goto LABEL_64;
      v49 = strlen(__s[0]);
      v50 = v49 + 1;
      if (v49 + 1 >= 0x2000000001)
      {
        *__error() = 12;
LABEL_64:
        *a6 = 0;
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDecryptionComponents", 618, 125, 0, "key", v38, v39, v66);
        v8 = v70;
        v27 = __str;
        goto LABEL_15;
      }
      v51 = malloc(v49 + 1);
      if (!v51)
        goto LABEL_64;
      v52 = v51;
      memcpy(v51, v48, v50);
      *a6 = v52;
      v27 = __str;
      v44 = v68;
    }
    if (v46 != 2 || !v44 || !v47)
    {
      v8 = v70;
      goto LABEL_47;
    }
    if (!strcmp(v47, "uri"))
    {
      v69 = v44;
      v54 = __s[0];
      v8 = v70;
      if (!__s[0])
        goto LABEL_66;
      v55 = strlen(__s[0]);
      v56 = v55 + 1;
      if (v55 + 1 >= 0x2000000001)
      {
        *__error() = 12;
LABEL_66:
        *a5 = 0;
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDecryptionComponents", 623, 125, 0, "uri", v38, v39, v66);
        v27 = __str;
        goto LABEL_15;
      }
      v57 = malloc(v55 + 1);
      if (!v57)
        goto LABEL_66;
      v58 = v57;
      memcpy(v57, v54, v56);
      *a5 = v58;
      v46 = 2;
      v27 = __str;
      v44 = v69;
    }
    else
    {
      v46 = 2;
      v8 = v70;
    }
LABEL_48:
    v75 = 0;
    *(_OWORD *)__s = 0u;
    v74 = 0u;
    *(_OWORD *)__s1 = 0u;
    if ((AAJSONInputStreamRead((uint64_t)v21, (int *)__s1, v40, v41, v42, v43, v38, v39) & 0x80000000) != 0)
      goto LABEL_56;
  }
  if (v46 == 1)
  {
    v53 = __s1[1];
    if (__s1[1])
    {
      if (!strcmp(__s1[1], "encryption"))
        v45 = 1;
      if (!strcmp(v53, "location"))
        v44 = 1;
    }
  }
  ++v46;
LABEL_47:
  if (v46)
    goto LABEL_48;
  if (*a5 && *a6)
  {
    v28 = 0;
    goto LABEL_16;
  }
  v62 = "invalid/missing decryption components";
  v63 = 631;
LABEL_62:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextGetDecryptionComponents", v63, 125, 0, v62, v38, v39, v66);
LABEL_15:
  v28 = 0xFFFFFFFFLL;
LABEL_16:
  AAJSONInputStreamClose(v21);
  AAByteStreamClose(v18);
  free(v27);
  free(v8);
  return v28;
}

uint64_t AAS3KnoxResolveURL(uint64_t a1, char **a2, _QWORD *a3, size_t a4, _BYTE *a5, size_t *a6, unint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  size_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  __int16 v30;
  int v31;
  char *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v38;
  char *v39;
  char *v40;
  size_t v41;
  size_t v42;
  char *v43;
  size_t v44;
  _BYTE *v45;
  _BYTE *v46;
  size_t v47;
  unsigned int v48;
  int v49;
  char *v51;
  FILE **v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  size_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  size_t v64;
  const char *v65;
  __int16 v66;
  int *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  __int16 v71;
  char v72;
  size_t *v73;
  char *__s;

  __s = 0;
  if (strncmp((const char *)a1, "knox://", 7uLL))
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", 854, 125, 0, "invalid Knox scheme: %s", v14, v15, a1);
LABEL_13:
    v23 = 0;
    v24 = 0;
    v20 = 0;
    goto LABEL_14;
  }
  v16 = a1 + 7;
  v17 = strchr((char *)(a1 + 7), 47);
  v20 = v17;
  if (!v17)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", 859, 125, 0, "invalid Knox host: %s", v18, v19, a1);
    v23 = 0;
    v24 = 0;
LABEL_14:
    v32 = 0;
    v26 = 0;
    goto LABEL_15;
  }
  v21 = &v17[-v16];
  v22 = (size_t)&v17[-v16 + 1];
  if (v22 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_12:
    v33 = *__error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", 863, 125, v33, "malloc", v34, v35, v72);
    goto LABEL_13;
  }
  v73 = a6;
  v25 = (char *)malloc(v22);
  if (!v25)
    goto LABEL_12;
  v26 = v25;
  memcpy(v25, (const void *)(a1 + 7), (size_t)&v20[-v16]);
  v21[(_QWORD)v26] = 0;
  if (strncmp(v20 + 1, "download/", 9uLL))
  {
    v72 = a1;
    v29 = "invalid Knox action: %s";
    v30 = 869;
LABEL_10:
    v31 = 0;
LABEL_11:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", v30, 125, v31, v29, v27, v28, v72);
    v23 = 0;
    v24 = 0;
    v20 = 0;
    v32 = 0;
    goto LABEL_15;
  }
  v38 = v20 + 10;
  v39 = strchr(v38, 47);
  if (!v39)
  {
    v72 = a1;
    v29 = "invalid Knox space: %s";
    v30 = 874;
    goto LABEL_10;
  }
  v40 = v39;
  v41 = v39 - v38;
  v42 = v39 - v38 + 1;
  if (v42 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_37:
    v31 = *__error();
    v29 = "malloc";
    v30 = 878;
    goto LABEL_11;
  }
  v43 = (char *)malloc(v42);
  if (!v43)
    goto LABEL_37;
  v32 = v43;
  memcpy(v43, v38, v41);
  v44 = 0;
  v32[v41] = 0;
  v45 = v40 + 1;
  v46 = v40 + 1;
  do
  {
    v47 = v44;
    v48 = (char)v45[v44];
    if (!v45[v44])
      break;
    if ((v48 & 0x80000000) != 0)
    {
      v49 = __maskrune((char)v45[v44], 0x4000uLL);
      v45 = v46;
    }
    else
    {
      v49 = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v48 + 60) & 0x4000;
    }
    if ((v48 - 127) < 0xA1u)
      break;
    if (v48 == 47 || (v48 - 37) < 2u)
      break;
    if (v48 == 35)
      break;
    v44 = v47 + 1;
  }
  while (!v49);
  if (v47 + 1 >= 0x2000000001)
  {
    *__error() = 12;
LABEL_48:
    v67 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", 895, 125, *v67, "malloc", v68, v69, v72);
    v23 = 0;
    v24 = 0;
    v20 = 0;
    goto LABEL_15;
  }
  v51 = (char *)malloc(v47 + 1);
  if (!v51)
    goto LABEL_48;
  v20 = v51;
  memcpy(v51, v46, v47);
  v20[v47] = 0;
  if (a7 >> 62)
  {
    v52 = (FILE **)MEMORY[0x24BDAC8D8];
    fwrite("Knox resolve URL\n", 0x11uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    fprintf(*v52, "  host: %s\n", v26);
    fprintf(*v52, "  space: %s\n", v32);
    fprintf(*v52, "  file digest: %s\n", v20);
  }
  v53 = contextCreate(a2, a7);
  v24 = (char *)v53;
  if (!v53)
  {
    v70 = "contextInit failed";
    v71 = 909;
LABEL_51:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", v71, 125, 0, v70, v54, v55, v72);
    v23 = 0;
    goto LABEL_15;
  }
  if ((contextResolveWestgateToken(v53, v26) & 0x80000000) != 0)
  {
    v70 = "getting Westgate token";
    v71 = 912;
    goto LABEL_51;
  }
  if ((contextGetDecryptionComponents((uint64_t)v24, v26, v32, v20, a3, &__s, v54, v55) & 0x80000000) != 0)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", 915, 125, 0, "getting decryption credentials", v56, v57, v72);
    v36 = 0xFFFFFFFFLL;
    v23 = __s;
    goto LABEL_16;
  }
  v23 = __s;
  v58 = strlen(__s);
  if (!v58 || (v58 & 1) != 0)
  {
    v72 = v58;
    v65 = "invalid key length: %zu";
    v66 = 919;
  }
  else
  {
    v64 = v58 >> 1;
    if (v58 >> 1 <= a4)
    {
      if ((aaParseHexString(v58 >> 1, a5, (uint64_t)__s, v59, v60, v61, v62, v63) & 0x80000000) == 0)
      {
        v36 = 0;
        *v73 = v64;
        goto LABEL_16;
      }
      v65 = "invalid hex key";
      v66 = 922;
    }
    else
    {
      v65 = "key_capacity is too low";
      v66 = 921;
    }
  }
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"AAS3KnoxResolveURL", v66, 125, 0, v65, v62, v63, v72);
LABEL_15:
  v36 = 0xFFFFFFFFLL;
LABEL_16:
  free(v26);
  free(v32);
  free(v20);
  free(v23);
  contextDestroy(v24);
  return v36;
}

uint64_t contextSetString(uint64_t a1, unsigned int a2, char *__s, char *a4)
{
  char *v4;
  size_t v7;
  size_t v8;
  uint64_t result;
  void *v10;
  void *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v4 = __s;
  if (!__s)
  {
    if (a4)
      v4 = getenv(a4);
  }
  if (!v4)
  {
    result = 0;
    *(_QWORD *)(a1 + 8 * a2) = 0;
    return result;
  }
  v7 = strlen(v4);
  v8 = v7 + 1;
  if (v7 + 1 < 0x2000000001)
  {
    v10 = malloc(v7 + 1);
    if (v10)
    {
      v11 = v10;
      memcpy(v10, v4, v8);
      result = 0;
      *(_QWORD *)(a1 + 8 * a2) = v11;
      return result;
    }
  }
  else
  {
    *__error() = 12;
  }
  *(_QWORD *)(a1 + 8 * a2) = 0;
  v12 = __error();
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextSetString", 259, 125, *v12, "malloc", v13, v14, v15);
  return 0xFFFFFFFFLL;
}

uint64_t contextLoadString(uint64_t a1, unsigned int a2, char *a3)
{
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  off_t st_size;
  BOOL v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  ssize_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  off_t v22;
  unsigned int v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v29;
  __int16 v30;
  const char *v31;
  char v32;
  stat v33;

  memset(&v33, 0, sizeof(v33));
  v6 = open(a3, 0);
  if ((v6 & 0x80000000) == 0)
  {
    v7 = v6;
    if (fstat(v6, &v33) < 0
      || ((st_size = v33.st_size, (v33.st_mode & 0xF000) == 0x8000) ? (v11 = v33.st_size == 0) : (v11 = 1), v11))
    {
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextLoadString", 274, 125, 0, "invalid file: %s", v8, v9, (char)a3);
    }
    else
    {
      if ((unint64_t)(v33.st_size + 1) < 0x2000000001)
      {
        v16 = malloc(v33.st_size + 1);
        if (v16)
        {
          v17 = v16;
          v18 = read(v7, v16, st_size);
          if (v18 < 0)
          {
            v29 = *__error();
            v30 = 280;
            v31 = a3;
          }
          else
          {
            if (v18 == st_size)
            {
              v21 = MEMORY[0x24BDAC740];
              do
              {
                v22 = st_size;
                if (!st_size)
                  break;
                v23 = (char)v17[st_size - 1];
                v24 = (v23 & 0x80000000) != 0 ? __maskrune(v23, 0x4000uLL) : *(_DWORD *)(v21 + 4 * v23 + 60) & 0x4000;
                --st_size;
              }
              while (v24);
              v15 = 0;
              v17[v22] = 0;
              *(_QWORD *)(a1 + 8 * a2) = v17;
              goto LABEL_25;
            }
            v31 = "truncated read";
            v30 = 281;
            v29 = 0;
          }
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextLoadString", v30, 125, v29, v31, v19, v20, v32);
LABEL_24:
          free(v17);
          v15 = 0xFFFFFFFFLL;
LABEL_25:
          close(v7);
          return v15;
        }
      }
      else
      {
        *__error() = 12;
      }
      v25 = *__error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextLoadString", 277, 125, v25, "malloc", v26, v27, v32);
    }
    v17 = 0;
    goto LABEL_24;
  }
  v12 = __error();
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"contextLoadString", 273, 125, *v12, a3, v13, v14, v32);
  return 0xFFFFFFFFLL;
}

uint64_t knoxPageStreamClose(int *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;

  if (!a1)
    return 0;
  if (a1[2] >= 1 && a1[4] && AAByteStreamWrite(*(AAByteStream *)a1, "]\n", 2uLL) != 2)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxPageStreamClose", 67, 125, 0, "writing final ']'", v2, v3, v6);
    v4 = 0xFFFFFFFFLL;
  }
  else
  {
    v4 = 0;
  }
  free(a1);
  return v4;
}

uint64_t knoxPageStreamWrite(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _BYTE *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  AAByteStream v20;
  uint64_t v21;
  char v23;

  v8 = a3;
  v9 = a2;
  v11 = *(_DWORD *)(a1 + 8);
  if (v11)
  {
    if (v11 < 1)
    {
      v12 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    if (!a3 || *a2 != 91)
    {
      v12 = 0;
      *(_DWORD *)(a1 + 8) = -1;
      goto LABEL_28;
    }
    *(_DWORD *)(a1 + 8) = 1;
  }
  v12 = 0;
  if (a3 && *(_DWORD *)(a1 + 12))
  {
    if (*a2 != 91)
    {
      v14 = "expected '['";
      v15 = 93;
LABEL_41:
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxPageStreamWrite", v15, 125, 0, v14, a7, a8, v23);
      return -1;
    }
    *(_DWORD *)(a1 + 12) = 0;
    v9 = a2 + 1;
    v8 = a3 - 1;
    v12 = 1;
  }
  if (!v8)
    goto LABEL_35;
  if (!*(_DWORD *)(a1 + 16))
  {
    v13 = 0;
    goto LABEL_18;
  }
  if (AAByteStreamWrite(*(AAByteStream *)a1, "]", 1uLL) != 1)
  {
    v14 = "writing ']'";
    v15 = 105;
    goto LABEL_41;
  }
  *(_DWORD *)(a1 + 16) = 0;
  v13 = 1;
LABEL_18:
  v16 = v12 + 1;
  v17 = v8 - 1;
  v18 = MEMORY[0x24BDAC740];
  while (1)
  {
    v19 = (char)v9[v17];
    if ((v19 & 0x80000000) != 0)
      break;
    if ((*(_DWORD *)(v18 + 4 * v19 + 60) & 0x4000) == 0)
      goto LABEL_25;
LABEL_23:
    ++v16;
    if (--v17 == -1)
      goto LABEL_27;
  }
  if (__maskrune(v19, 0x4000uLL))
    goto LABEL_23;
LABEL_25:
  if (v9[v17] == 93)
  {
    *(_DWORD *)(a1 + 16) = 1;
    v12 = v16;
    v8 = v17;
  }
LABEL_27:
  if (v8)
  {
LABEL_28:
    *(_DWORD *)(a1 + 20) = 1;
    v20 = *(AAByteStream *)a1;
    if (*((_QWORD *)v20 + 3))
    {
      if (v8)
      {
        v13 = 0;
        while (1)
        {
          v21 = (*((uint64_t (**)(_QWORD, _BYTE *, uint64_t))v20 + 3))(*(_QWORD *)v20, v9, v8);
          if (v21 < 1)
            break;
          v9 += v21;
          v13 += v21;
          v8 -= v21;
          if (!v8)
          {
            if ((v13 & 0x8000000000000000) == 0)
              goto LABEL_39;
            goto LABEL_37;
          }
        }
        v13 = v21;
        if (v21 < 0)
          goto LABEL_37;
        goto LABEL_39;
      }
LABEL_35:
      v13 = 0;
      goto LABEL_39;
    }
    v13 = -1;
LABEL_37:
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3Knox.c", (uint64_t)"knoxPageStreamWrite", 124, 125, 0, "write", a7, a8, v23);
  }
  else
  {
LABEL_39:
    v13 += v12;
  }
  return v13;
}

size_t pc_log_error(uint64_t a1, uint64_t a2, __int16 a3, int a4, int a5, const char *a6, uint64_t a7, uint64_t a8, char a9)
{
  _WORD *v13;
  char *v14;
  size_t v15;
  char __str[1024];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  bzero(__str, 0x400uLL);
  v13 = (_WORD *)(((a3 & 0x3FFF) << 10) | (a4 << 24) | a5 & 0x3FF | 0x80000000);
  if (a5 >= 1)
  {
    v14 = strerror(a5);
    snprintf(__str, 0x400uLL, "%s: ", v14);
  }
  v15 = strlen(__str);
  vsnprintf(&__str[v15], 1024 - v15, a6, &a9);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    pc_log_error_cold_1((uint64_t)__str, (int)v13);
  return ParallelCompressionUpdateError(v13, (size_t)__str);
}

uint64_t pc_log_warning(uint64_t a1, uint64_t a2, __int16 a3, int a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v12;
  size_t v13;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  char *v18;
  char __s[1024];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  bzero(__s, 0x400uLL);
  v12 = ((a3 & 0x3FFF) << 10) | (a4 << 24) | 0x80000000;
  v13 = strlen(__s);
  vsnprintf(&__s[v13], 1024 - v13, a5, &a9);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v16 = v12;
    v17 = 2080;
    v18 = __s;
    _os_log_impl(&dword_212EB0000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "[0x%08x](warning) %s", buf, 0x12u);
  }
  return ParallelCompressionUpdateWarning(v12, __s);
}

void pc_log_error_cold_1(uint64_t a1, int a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109378;
  v2[1] = a2;
  v3 = 2080;
  v4 = a1;
  _os_log_error_impl(&dword_212EB0000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[0x%08x] %s", (uint8_t *)v2, 0x12u);
}

size_t appendThreadErrorContextString(size_t result)
{
  const void *v1;
  size_t v2;
  pthread_key_t ErrorContextKey;
  size_t v4;
  __int16 v5;
  uint64_t v6;
  size_t v7;
  size_t v8;

  if (result)
  {
    v1 = (const void *)result;
    result = strlen((const char *)result);
    if (result - 8193 >= 0xFFFFFFFFFFFFE000)
    {
      v2 = result;
      ErrorContextKey = getErrorContextKey();
      result = (size_t)pthread_getspecific(ErrorContextKey);
      if (result)
      {
        v4 = result;
        v5 = v2 + 3;
        v6 = *(unsigned __int16 *)(result + 72);
        if (v6 + (unsigned __int16)(v2 + 3) <= *(unsigned __int16 *)(result + 74))
        {
          v7 = result + v6;
          *(_WORD *)(v7 + 76) = v5;
          v8 = v7 + 78;
          result = (size_t)memcpy((void *)(v7 + 78), v1, v2);
          *(_BYTE *)(v8 + v2) = 0;
          *(_WORD *)(v4 + 72) += v5;
        }
      }
    }
  }
  return result;
}

_WORD *updateThreadErrorContextErrorCode(_WORD *result)
{
  int v1;
  pthread_key_t ErrorContextKey;

  if ((result & 0x80000000) != 0)
  {
    v1 = (int)result;
    ErrorContextKey = getErrorContextKey();
    result = pthread_getspecific(ErrorContextKey);
    if (result)
    {
      if ((*(_DWORD *)result & 0x80000000) == 0)
      {
        *(_DWORD *)result = v1;
        result[3] = 0;
      }
    }
  }
  return result;
}

_DWORD *updateThreadErrorContextWarningCode(_DWORD *result)
{
  int v1;
  pthread_key_t ErrorContextKey;
  uint64_t v3;

  if ((result & 0x80000000) != 0)
  {
    v1 = (int)result;
    ErrorContextKey = getErrorContextKey();
    result = pthread_getspecific(ErrorContextKey);
    if (result)
    {
      if ((*result & 0x80000000) == 0)
      {
        v3 = *((unsigned __int16 *)result + 3);
        if (v3 <= 0xF)
        {
          result[v3 + 2] = v1;
          *((_WORD *)result + 3) = v3 + 1;
        }
      }
    }
  }
  return result;
}

size_t ParallelCompressionUpdateError(_WORD *a1, size_t a2)
{
  updateThreadErrorContextErrorCode(a1);
  return appendThreadErrorContextString(a2);
}

uint64_t getErrorContextKey()
{
  int *v0;

  if (pthread_once(&getErrorContextKey_errorContextOnce, (void (*)(void))createErrorContextKey))
  {
    v0 = __error();
    pc_log_error("/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/Threads.c", "getErrorContextKey", 53, 5, *v0, "pthread_once");
  }
  return gErrorContextKey;
}

uint64_t createErrorContextKey()
{
  uint64_t result;
  int *v1;

  result = pthread_key_create((pthread_key_t *)&gErrorContextKey, 0);
  if ((_DWORD)result)
  {
    v1 = __error();
    return pc_log_error("/Library/Caches/com.apple.xbs/Sources/ParallelCompression/Common/Threads.c", "createErrorContextKey", 42, 5, *v1, "pthread_key_create");
  }
  return result;
}

uint64_t aaParseHexString(int a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  uint64_t v9;
  char v10;
  int v11;
  int v12;
  char v13;
  const char *v14;
  __int16 v15;
  char v17;

  v8 = (2 * a1);
  if (!(_DWORD)v8)
  {
LABEL_13:
    v11 = 0;
    return (v11 << 31 >> 31);
  }
  v9 = 0;
  v10 = 0;
  v11 = 1;
  while (1)
  {
    v12 = *(unsigned __int8 *)(a3 + v9);
    if (!*(_BYTE *)(a3 + v9))
    {
      v14 = "truncated hex string";
      v15 = 13;
      goto LABEL_16;
    }
    if ((v12 - 48) >= 0xA)
      break;
    v13 = -48;
LABEL_10:
    v10 = v13 + 16 * v10 + v12;
    if ((v9 & 1) != 0)
    {
      *a2++ = v10;
      v10 = 0;
    }
    v11 = ++v9 < v8;
    if (v8 == v9)
      goto LABEL_13;
  }
  if ((v12 - 97) < 6)
  {
    v13 = -87;
    goto LABEL_10;
  }
  if ((v12 - 65) < 6)
  {
    v13 = -55;
    goto LABEL_10;
  }
  v14 = "invalid hex string";
  v15 = 18;
LABEL_16:
  pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AASerialization.c", (uint64_t)"aaParseHexString", v15, 106, 0, v14, a7, a8, v17);
  return (v11 << 31 >> 31);
}

uint64_t jsonPushLabel(uint64_t a1, char a2)
{
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  _BYTE *v7;
  size_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  char v14;

  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 80);
  v6 = (_QWORD *)(a1 + 72);
  if (v5 >= v4)
  {
    if (v4)
      v8 = v4 + (v4 >> 1);
    else
      v8 = 256;
    *(_QWORD *)(a1 + 72) = v8;
    v7 = reallocf(*(void **)(a1 + 88), v8);
    *(_QWORD *)(a1 + 88) = v7;
    if (!v7)
    {
      v10 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"jsonPushLabel", 358, 109, *v10, "malloc", v11, v12, v14);
      *v6 = 0;
      v6[1] = 0;
      return 0xFFFFFFFFLL;
    }
    v5 = *(_QWORD *)(a1 + 80);
  }
  else
  {
    v7 = *(_BYTE **)(a1 + 88);
  }
  v9 = 0;
  *(_QWORD *)(a1 + 80) = v5 + 1;
  v7[v5] = a2;
  return v9;
}

uint64_t jsonPushValue(uint64_t a1, char a2)
{
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  _BYTE *v7;
  size_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  char v14;

  v4 = *(_QWORD *)(a1 + 96);
  v5 = *(_QWORD *)(a1 + 104);
  v6 = (_QWORD *)(a1 + 96);
  if (v5 >= v4)
  {
    if (v4)
      v8 = v4 + (v4 >> 1);
    else
      v8 = 256;
    *(_QWORD *)(a1 + 96) = v8;
    v7 = reallocf(*(void **)(a1 + 112), v8);
    *(_QWORD *)(a1 + 112) = v7;
    if (!v7)
    {
      v10 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"jsonPushValue", 372, 109, *v10, "malloc", v11, v12, v14);
      *v6 = 0;
      v6[1] = 0;
      return 0xFFFFFFFFLL;
    }
    v5 = *(_QWORD *)(a1 + 104);
  }
  else
  {
    v7 = *(_BYTE **)(a1 + 112);
  }
  v9 = 0;
  *(_QWORD *)(a1 + 104) = v5 + 1;
  v7[v5] = a2;
  return v9;
}

_QWORD *AAJSONInputStreamOpen(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;
  char v12;

  v2 = malloc(0x78uLL);
  v3 = v2;
  if (v2)
  {
    memset_s(v2, 0x78uLL, 0, 0x78uLL);
    v3[1] = a1;
    v3[5] = 0x10000;
    v4 = malloc(0x10000uLL);
    v3[8] = v4;
    if (v4)
    {
      *(_QWORD *)((char *)v3 + 20) = 32;
      v3[4] = calloc(0x20uLL, 4uLL);
    }
    else
    {
      v8 = __error();
      pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamOpen", 387, 109, *v8, "malloc", v9, v10, v12);
      AAJSONInputStreamClose((void **)v3);
      return 0;
    }
  }
  else
  {
    v5 = __error();
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamOpen", 382, 109, *v5, "malloc", v6, v7, v12);
  }
  return v3;
}

void AAJSONInputStreamClose(void **a1)
{
  if (a1)
  {
    free(a1[4]);
    free(a1[11]);
    free(a1[14]);
    free(a1[8]);
    free(a1);
  }
}

uint64_t AAJSONInputStreamRead(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  unsigned __int8 *v16;
  ssize_t v17;
  int v18;
  char v19;
  unsigned __int8 v20;
  unint64_t v21;
  char v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  int v27;
  const char *v28;
  int v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  _BOOL4 v35;
  int v37;
  uint64_t v38;
  int v39;
  const char *v40;
  unint64_t v41;
  int v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;

  if (atomic_load((unsigned int *)a1))
    return 0xFFFFFFFFLL;
  v10 = *(_DWORD *)(a1 + 16);
  if (v10 == 9 || v10 == -1)
  {
    pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamRead", 418, 109, 0, "unexpected read call", a7, a8, v46);
    return 0xFFFFFFFFLL;
  }
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  v14 = MEMORY[0x24BDAC740];
  while (2)
  {
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(unsigned __int8 **)(a1 + 64);
    if (v15 >= *(_QWORD *)(a1 + 48))
    {
      v17 = AAByteStreamRead(*(AAByteStream *)(a1 + 8), v16, *(_QWORD *)(a1 + 40));
      if (v17 < 0)
      {
        pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamRead", 430, 109, 0, "read error: %zd", a7, a8, v17);
LABEL_104:
        result = 0xFFFFFFFFLL;
        *(_DWORD *)(a1 + 16) = -1;
        return result;
      }
      if (!v17)
      {
        v30 = "EOF reached";
        v31 = 431;
        goto LABEL_103;
      }
      v15 = 0;
      *(_QWORD *)(a1 + 48) = v17;
      v16 = *(unsigned __int8 **)(a1 + 64);
    }
    *(_QWORD *)(a1 + 56) = v15 + 1;
    v18 = v16[v15];
    v19 = v16[v15];
    switch(*(_DWORD *)(a1 + 16))
    {
      case 0:
        *(_QWORD *)(a1 + 104) = 0;
        if ((char)v18 < 0)
        {
          if (__maskrune((char)v18, 0x4000uLL))
            continue;
        }
        else if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }
        if (v18 == 34)
          goto LABEL_68;
        if (v18 == 43 || v18 == 45 || ((char)v18 - 48) <= 9)
        {
          if ((jsonPushValue(a1, v18) & 0x80000000) == 0)
          {
            v23 = 3;
            goto LABEL_69;
          }
          v30 = "jsonPushValue";
          v31 = 451;
          goto LABEL_103;
        }
        if (v18 == 123)
        {
          v32 = *(unsigned int *)(a1 + 24);
          if ((_DWORD)v32 == *(_DWORD *)(a1 + 20))
          {
            v30 = "max level reached";
            v31 = 465;
            goto LABEL_103;
          }
          v27 = 0;
          v44 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)(a1 + 24) = v32 + 1;
          *(_DWORD *)(v44 + 4 * v32) = 0;
          v37 = 6;
          goto LABEL_125;
        }
        if (v18 == 91)
        {
          v33 = *(unsigned int *)(a1 + 24);
          if ((_DWORD)v33 == *(_DWORD *)(a1 + 20))
          {
            v30 = "max level reached";
            v31 = 457;
            goto LABEL_103;
          }
          v37 = 0;
          v45 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)(a1 + 24) = v33 + 1;
          v27 = 1;
          *(_DWORD *)(v45 + 4 * v33) = 1;
          goto LABEL_125;
        }
        if (((char)v18 - 97) <= 0x19)
        {
          if ((jsonPushValue(a1, v18) & 0x80000000) == 0)
          {
            v23 = 4;
            goto LABEL_69;
          }
          v30 = "jsonPushValue";
          v31 = 473;
          goto LABEL_103;
        }
        v25 = *(_DWORD *)(a1 + 24) - 1;
        v34 = (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v25) & 1) == 0 || (char)v18 != 93;
        v35 = (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v25) & 1) == 0 && (char)v18 == 125;
        if (v34 && !v35)
          goto LABEL_102;
        goto LABEL_121;
      case 1:
        if (v18 == 92)
        {
          v23 = 2;
          goto LABEL_69;
        }
        if (v18 == 34)
        {
          *(_DWORD *)(a1 + 16) = 5;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            v27 = 3;
            goto LABEL_126;
          }
          v30 = "jsonPushValue";
          v31 = 499;
          goto LABEL_103;
        }
        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          v30 = "jsonPushValue";
          v31 = 503;
          goto LABEL_103;
        }
        continue;
      case 2:
        HIDWORD(v21) = (char)v18;
        LODWORD(v21) = ((char)v18 << 24) - 1644167168;
        v20 = v21 >> 25;
        if (v20 < 0xAu && ((0x341u >> v20) & 1) != 0)
        {
          v22 = asc_212FF7621[(char)v20];
        }
        else if ((char)v18 == 102)
        {
          v22 = 12;
        }
        else
        {
          v22 = v19;
        }
        if ((jsonPushValue(a1, v22) & 0x80000000) != 0)
        {
          v30 = "jsonPushValue";
          v31 = 512;
          goto LABEL_103;
        }
LABEL_68:
        v23 = 1;
        goto LABEL_69;
      case 3:
        if (((char)v18 - 48) > 9)
        {
          *(_DWORD *)(a1 + 16) = 5;
          *(_QWORD *)(a1 + 56) = v15;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            v27 = 4;
            goto LABEL_126;
          }
          v30 = "jsonPushValue";
          v31 = 539;
          goto LABEL_103;
        }
        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          v30 = "jsonPushValue";
          v31 = 533;
          goto LABEL_103;
        }
        continue;
      case 4:
        if (((char)v18 - 97) > 0x19)
        {
          *(_DWORD *)(a1 + 16) = 5;
          *(_QWORD *)(a1 + 56) = v15;
          if ((jsonPushValue(a1, 0) & 0x80000000) == 0)
          {
            v28 = *(const char **)(a1 + 112);
            if (!strcmp(v28, "false") || !strcmp(v28, "true"))
            {
              v27 = 6;
            }
            else
            {
              if (strcmp(v28, "null"))
                goto LABEL_102;
              v27 = 7;
            }
            goto LABEL_126;
          }
          v30 = "jsonPushValue";
          v31 = 524;
          goto LABEL_103;
        }
        if ((jsonPushValue(a1, v18) & 0x80000000) != 0)
        {
          v30 = "jsonPushValue";
          v31 = 519;
          goto LABEL_103;
        }
        continue;
      case 5:
        if ((char)v18 < 0)
        {
          if (__maskrune((char)v18, 0x4000uLL))
            continue;
        }
        else if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }
        v24 = *(_DWORD *)(a1 + 24);
        if (!v24)
        {
          v30 = "invalid JSON state";
          v31 = 546;
          goto LABEL_103;
        }
        v25 = v24 - 1;
        v26 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v25);
        if (v18 != 44)
        {
          if (v18 == 93)
          {
            if ((v26 & 1) != 0)
              goto LABEL_121;
            v19 = 93;
          }
          else if (v18 == 125)
          {
            goto LABEL_91;
          }
LABEL_102:
          v46 = v19;
          v30 = "invalid char %c %s";
          v31 = 610;
          goto LABEL_103;
        }
        if ((v26 & 1) != 0)
          v23 = 0;
        else
          v23 = 6;
LABEL_69:
        *(_DWORD *)(a1 + 16) = v23;
        continue;
      case 6:
        *(_QWORD *)(a1 + 80) = 0;
        if (((char)v18 & 0x80000000) == 0)
        {
          if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) == 0)
            goto LABEL_61;
          continue;
        }
        if (__maskrune((char)v18, 0x4000uLL))
          continue;
LABEL_61:
        if (v18 == 34)
        {
          v23 = 7;
          goto LABEL_69;
        }
        if (v18 != 125)
          goto LABEL_102;
        v29 = *(_DWORD *)(a1 + 24);
        if (!v29)
          goto LABEL_92;
        v25 = v29 - 1;
        v26 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v25);
LABEL_91:
        if ((v26 & 1) != 0)
        {
LABEL_92:
          v19 = 125;
          goto LABEL_102;
        }
LABEL_121:
        *(_DWORD *)(a1 + 24) = v25;
        if (v25)
          v37 = 5;
        else
          v37 = 9;
        v27 = 2;
LABEL_125:
        *(_DWORD *)(a1 + 16) = v37;
LABEL_126:
        if (a2)
          memset_s(a2, 0x38uLL, 0, 0x38uLL);
        *a2 = v27;
        v38 = *(_QWORD *)(a1 + 80);
        if (v38)
          v38 = *(_QWORD *)(a1 + 88);
        *((_QWORD *)a2 + 1) = v38;
        a2[12] = *(_DWORD *)(a1 + 24);
        if (v27 == 6)
        {
          v39 = strcmp(*(const char **)(a1 + 112), "true");
          result = 0;
          a2[9] = v39 == 0;
        }
        else if (v27 == 4)
        {
          v40 = *(const char **)(a1 + 112);
          if (*v40 == 45)
          {
            v41 = strtoull(v40 + 1, 0, 10);
            result = 0;
            *((_QWORD *)a2 + 3) = v41;
            v42 = -1;
          }
          else
          {
            v43 = strtoull(v40, 0, 0);
            result = 0;
            *((_QWORD *)a2 + 3) = v43;
            v42 = v43 != 0;
          }
          a2[8] = v42;
        }
        else
        {
          result = 0;
          if (v27 == 3)
            *((_QWORD *)a2 + 2) = *(_QWORD *)(a1 + 112);
        }
        return result;
      case 7:
        if ((char)v18 == 34)
        {
          if ((jsonPushLabel(a1, 0) & 0x80000000) == 0)
          {
            v23 = 8;
            goto LABEL_69;
          }
          v30 = "jsonPushLabel";
          v31 = 587;
LABEL_103:
          pc_log_error((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchive/AAJSONStreams.c", (uint64_t)"AAJSONInputStreamRead", v31, 109, 0, v30, a7, a8, v46);
          goto LABEL_104;
        }
        if ((jsonPushLabel(a1, v18) & 0x80000000) != 0)
        {
          v30 = "jsonPushLabel";
          v31 = 591;
          goto LABEL_103;
        }
        continue;
      case 8:
        if ((char)v18 < 0)
        {
          if (__maskrune((char)v18, 0x4000uLL))
            continue;
        }
        else if ((*(_DWORD *)(v14 + 4 * (char)v18 + 60) & 0x4000) != 0)
        {
          continue;
        }
        if ((char)v18 != 58)
          goto LABEL_102;
        v23 = 0;
        goto LABEL_69;
      default:
        goto LABEL_102;
    }
  }
}

id frk_unwrapped_symmetric_key_with_shipping_private_key(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  const __CFString **v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(a1, "objectForKey:", CFSTR("com.apple.wkms.fcs-response"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!v5)
  {
    v31 = a3;
    v18 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0FC8];
    v44[0] = CFSTR("ERROR: Shipping private key is NULL.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = 26;
LABEL_14:
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.internal.fetchrestorekeys"), v20, v12);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v10 = 0;
    v11 = 0;
LABEL_16:
    v14 = 0;
    v16 = 0;
    goto LABEL_17;
  }
  if (!v6)
  {
    v31 = a3;
    v21 = (void *)MEMORY[0x24BDD1540];
    v41 = *MEMORY[0x24BDD0FC8];
    v42 = CFSTR("ERROR: This archive does not contain a shipping key response.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v21;
    v20 = 25;
    goto LABEL_14;
  }
  v34 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v34);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v34;
  if (!v8)
  {
    v10 = 0;
    v11 = 0;
    v14 = 0;
    v16 = 0;
    if (!a3)
      goto LABEL_19;
    goto LABEL_18;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("wrapped-key"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("enc-request"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = a3;
  if (!v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || !v11
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v39 = *MEMORY[0x24BDD0FC8];
    v40 = CFSTR("ERROR: Response dictionary is missing required keys. Will fail");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.internal.fetchrestorekeys"), 23, v12);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v10, 0);
  v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v11, 0);
  v30 = (void *)v13;
  if (!v12)
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FC8];
    v38 = CFSTR("ERROR: shipping key wrapped-key failed base64 decode");
    v26 = (void *)MEMORY[0x24BDBCE70];
    v27 = &v38;
    v28 = &v37;
LABEL_24:
    objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1, v30);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.internal.fetchrestorekeys"), 19, v15);
    v29 = objc_claimAutoreleasedReturnValue();

    v17 = (id)v29;
    v14 = 0;
    v16 = 0;
    goto LABEL_25;
  }
  if (!v13)
  {
    v25 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0FC8];
    v36 = CFSTR("ERROR: shipping key enc-request failed base64 decode");
    v26 = (void *)MEMORY[0x24BDBCE70];
    v27 = &v36;
    v28 = &v35;
    goto LABEL_24;
  }
  v33 = v9;
  +[CryptoKitWrapper convertPrivateKeyTox963WithPemPrivateKey:error:](_TtC16FetchRestoreKeys16CryptoKitWrapper, "convertPrivateKeyTox963WithPemPrivateKey:error:", v5, &v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v33;

  if (!v14)
  {
    v16 = 0;
    goto LABEL_26;
  }
  v32 = v15;
  +[CryptoKitWrapper unwrapEncryptionKeyWithWrappedKey:encapsulatedKey:privateKey:error:](_TtC16FetchRestoreKeys16CryptoKitWrapper, "unwrapEncryptionKeyWithWrappedKey:encapsulatedKey:privateKey:error:", v12, v30, v14, &v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v32;
LABEL_25:

  v15 = v17;
LABEL_26:

LABEL_17:
  v9 = v15;
  a3 = v31;
  if (v31)
LABEL_18:
    *a3 = objc_retainAutorelease(v9);
LABEL_19:
  v23 = v16;

  return v23;
}

id frk_metadata_from_aea_auth_data(AEAAuthData_impl *a1, _QWORD *a2)
{
  void *v4;
  uint32_t EntryCount;
  uint32_t v6;
  uint32_t v7;
  size_t v8;
  void *v9;
  void *v10;
  uint8_t *v11;
  uint8_t *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString **v22;
  uint64_t *v23;
  void *v25;
  void *v26;
  size_t data_size;
  size_t key_length;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  const __CFString *v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  EntryCount = AEAAuthDataGetEntryCount(a1);
  if (!EntryCount)
  {
LABEL_12:
    v16 = (void *)objc_msgSend(v4, "copy");
    v17 = 0;
    if (a2)
      goto LABEL_23;
    goto LABEL_24;
  }
  v6 = EntryCount;
  v7 = 0;
  while (1)
  {
    data_size = 0;
    key_length = 0;
    if (AEAAuthDataGetEntry(a1, v7, 0, 0, &key_length, 0, 0, &data_size))
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BDD0FC8];
      v30 = CFSTR("Failed to parse auth data blob.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.internal.fetchrestorekeys"), 17, v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_22;
    }
    if (!key_length)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v41 = *MEMORY[0x24BDD0FC8];
      v42[0] = CFSTR("Failed to parse key in KVS (zero size key).");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = (const __CFString **)v42;
      v23 = &v41;
LABEL_20:
      objc_msgSend(v21, "dictionaryWithObjects:forKeys:count:", v22, v23, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.internal.fetchrestorekeys"), 17, v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    v8 = ++key_length;
    if (!data_size)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v39 = *MEMORY[0x24BDD0FC8];
      v40 = CFSTR("Failed to parse key in KVS (zero size data).");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = &v40;
      v23 = &v39;
      goto LABEL_20;
    }
    v9 = malloc_type_calloc(1uLL, v8, 0xA4E106D4uLL);
    if (!v9)
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BDD0FC8];
      v38 = CFSTR("KVS keyBuffer allocation failure.");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = &v38;
      v23 = &v37;
      goto LABEL_20;
    }
    v10 = v9;
    v11 = (uint8_t *)malloc_type_calloc(1uLL, data_size, 0xE9F1B555uLL);
    if (!v11)
    {
      free(v10);
      v20 = (void *)MEMORY[0x24BDD1540];
      v35 = *MEMORY[0x24BDD0FC8];
      v36 = CFSTR("KVS dataBuffer allocation failure.");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = &v36;
      v23 = &v35;
      goto LABEL_20;
    }
    v12 = v11;
    if (AEAAuthDataGetEntry(a1, v7, key_length, (char *)v10, &key_length, data_size, v11, &data_size))
    {
      free(v10);
      free(v12);
      v20 = (void *)MEMORY[0x24BDD1540];
      v33 = *MEMORY[0x24BDD0FC8];
      v34 = CFSTR("KVS data fetch failure.");
      v21 = (void *)MEMORY[0x24BDBCE70];
      v22 = &v34;
      v23 = &v33;
      goto LABEL_20;
    }
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v10);
    v14 = objc_alloc(MEMORY[0x24BDBCE50]);
    v15 = (void *)objc_msgSend(v14, "initWithBytesNoCopy:length:freeWhenDone:", v12, data_size, 1);
    free(v10);
    if (!v13 || !v15)
      break;
    objc_msgSend(v4, "setObject:forKey:", v15, v13);

    if (v6 == ++v7)
      goto LABEL_12;
  }
  v25 = (void *)MEMORY[0x24BDD1540];
  v31 = *MEMORY[0x24BDD0FC8];
  v32 = CFSTR("KVS key value - parse failure.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.internal.fetchrestorekeys"), 17, v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
LABEL_22:
  v16 = 0;
  if (a2)
LABEL_23:
    *a2 = objc_retainAutorelease(v17);
LABEL_24:

  return v16;
}

unint64_t sub_212FE4BCC(uint64_t a1, unint64_t a2)
{
  return sub_212FE53D4(a1, a2);
}

unint64_t sub_212FE4BE0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6CF40);
  v2 = sub_212FE7034();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_212FE68EC(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_212FE5290(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_212FE6934(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_212FE4D08(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B6CF38);
  v2 = (_QWORD *)sub_212FE7034();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_212FE5290(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void *sub_212FE4E34()
{
  return sub_212FE5658();
}

id sub_212FE4E54(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t (*a5)(uint64_t, unint64_t))
{
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;

  v6 = a3;
  v7 = sub_212FE6F08();
  v9 = v8;

  v10 = a5(v7, v9);
  v12 = v11;
  sub_212FE67E0(v7, v9);
  v13 = (void *)sub_212FE6EF0();
  sub_212FE67E0(v10, v12);
  return v13;
}

uint64_t *sub_212FE4F3C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  return sub_212FE58B8(a1, a2, a3, a4, a5, a6);
}

char *sub_212FE50C4(uint64_t a1, uint64_t a2, __SecCertificate *a3)
{
  return sub_212FE5DAC(a1, a2, a3);
}

id sub_212FE51D4()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id sub_212FE51F4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CryptoKitWrapper();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_212FE5260()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CryptoKitWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_212FE5290(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_212FE704C();
  sub_212FE7028();
  v4 = sub_212FE7058();
  return sub_212FE52F4(a1, a2, v4);
}

unint64_t sub_212FE52F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_212FE7040() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_212FE7040() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_212FE53D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t inited;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _BYTE v21[80];
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v5 = sub_212FE701C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_212FE6FC8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = &v21[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v22 = a1;
  v23 = a2;
  sub_212FE68A8(a1, a2);
  sub_212FE6FBC();
  if (!v2)
  {
    v24 = v9;
    sub_212FE6FA4();
    sub_212FE7010();
    a2 = sub_212FE6FF8();
    v14 = v13;
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    if (v14 >> 60 == 15)
    {
      sub_212FE6FEC();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B6CF20);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_212FF7630;
      *(_QWORD *)(inited + 32) = sub_212FE6FEC();
      *(_QWORD *)(inited + 40) = v16;
      a2 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(inited + 48) = 0xD000000000000017;
      *(_QWORD *)(inited + 56) = 0x8000000213018480;
      sub_212FE4BE0(inited);
      v17 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v18 = (void *)sub_212FE6FE0();
      swift_bridgeObjectRelease();
      v19 = (void *)sub_212FE6FD4();
      swift_bridgeObjectRelease();
      objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, 31, v19);

      swift_willThrow();
      (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v24);
    }
    else
    {
      (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v24);
    }
  }
  return a2;
}

void *sub_212FE5658()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  _BYTE v15[80];

  v1 = v0;
  v2 = sub_212FE701C();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_212FE6FC8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  sub_212FE7010();
  v7 = sub_212FE7004();
  if (v8)
  {
    MEMORY[0x24BDAC7A8](v7);
    sub_212FE6F98();
    if (!v0)
    {
      v13 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 32))(&v15[-v6], &v15[-v6], v3);
      v1 = (void *)MEMORY[0x2199A7F50](v13);
      (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(&v15[-v6], v3);
    }
  }
  else
  {
    sub_212FE6FEC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B6CF20);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_212FF7630;
    *(_QWORD *)(inited + 32) = sub_212FE6FEC();
    *(_QWORD *)(inited + 40) = v10;
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 48) = 0xD000000000000017;
    *(_QWORD *)(inited + 56) = 0x8000000213018480;
    sub_212FE4BE0(inited);
    v11 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v12 = (void *)sub_212FE6FE0();
    swift_bridgeObjectRelease();
    v1 = (void *)sub_212FE6FD4();
    swift_bridgeObjectRelease();
    objc_msgSend(v11, sel_initWithDomain_code_userInfo_, v12, 31, v1);

    swift_willThrow();
  }
  return v1;
}

uint64_t *sub_212FE58B8(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  BOOL v7;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t inited;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t (*v25)(char *);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;

  if (MEMORY[0x24BDC6850])
    v7 = MEMORY[0x24BDC6860] == 0;
  else
    v7 = 1;
  if (v7 || MEMORY[0x24BDC6858] == 0)
  {
    sub_212FE6FEC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B6CF20);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_212FF7630;
    *(_QWORD *)(inited + 32) = sub_212FE6FEC();
    *(_QWORD *)(inited + 40) = v16;
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 48) = 0xD000000000000027;
    *(_QWORD *)(inited + 56) = 0x8000000213018450;
    sub_212FE4BE0(inited);
    v13 = (uint64_t *)objc_allocWithZone(MEMORY[0x24BDD1540]);
    v17 = (void *)sub_212FE6FE0();
    swift_bridgeObjectRelease();
    v18 = (void *)sub_212FE6FD4();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v17, 12, v18);

    swift_willThrow();
  }
  else
  {
    v46 = a2;
    v47 = a4;
    v45 = a1;
    v12 = sub_212FE6FC8();
    v13 = &v33;
    v50 = *(_QWORD *)(v12 - 8);
    v14 = *(_QWORD *)(v50 + 64);
    MEMORY[0x24BDAC7A8](v12);
    v48 = a5;
    v49 = a6;
    sub_212FE68A8(a5, a6);
    sub_212FE6FBC();
    if (!v6)
    {
      v38 = &v33;
      v43 = sub_212FE6F20();
      v37 = &v33;
      v19 = *(_QWORD *)(v43 - 8);
      v20 = *(_QWORD *)(v19 + 64);
      MEMORY[0x24BDAC7A8](v43);
      v44 = a3;
      sub_212FE6F14();
      v21 = sub_212FE6F74();
      v36 = &v33;
      v34 = v21;
      v33 = *(_QWORD *)(v21 - 8);
      v22 = MEMORY[0x24BDAC7A8](v21);
      v24 = (char *)&v33 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
      v42 = &v33;
      MEMORY[0x24BDAC7A8](v22);
      v25 = *(uint64_t (**)(char *))(v50 + 16);
      v40 = v26;
      v27 = v25((char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
      v39 = &v33;
      MEMORY[0x24BDAC7A8](v27);
      v28 = v43;
      v41 = v19;
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))((char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), (char *)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), v43);
      sub_212FE68A8(v44, v47);
      v35 = v24;
      sub_212FE6F5C();
      v47 = (unint64_t)&v33 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      v29 = v40;
      v30 = v41;
      v48 = v45;
      v49 = v46;
      sub_212FE6944();
      v31 = v35;
      v13 = (uint64_t *)sub_212FE6F68();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v31, v34);
      (*(void (**)(unint64_t, uint64_t))(v30 + 8))(v47, v28);
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v29, v12);
    }
  }
  return v13;
}

char *sub_212FE5DAC(uint64_t a1, uint64_t a2, SecCertificateRef certificate)
{
  uint64_t v3;
  BOOL v4;
  __SecKey *v6;
  __SecKey *v7;
  CFDataRef v8;
  CFDataRef v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t inited;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];
  CFDataRef v34;
  __SecKey *v35;
  _QWORD *v36;
  _QWORD *v37;
  char *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x24BDC6850])
    v4 = MEMORY[0x24BDC6860] == 0;
  else
    v4 = 1;
  if (v4 || MEMORY[0x24BDC6858] == 0)
  {
    sub_212FE6FEC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B6CF20);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_212FF7630;
    *(_QWORD *)(inited + 32) = sub_212FE6FEC();
    *(_QWORD *)(inited + 40) = v16;
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 48) = 0xD000000000000027;
    *(_QWORD *)(inited + 56) = 0x8000000213018450;
    sub_212FE4BE0(inited);
    v17 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v18 = (void *)sub_212FE6FE0();
    swift_bridgeObjectRelease();
    v12 = (char *)sub_212FE6FD4();
    swift_bridgeObjectRelease();
    objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, 12, v12);

    swift_willThrow();
    return v12;
  }
  v45 = a2;
  v44 = a1;
  v6 = SecCertificateCopyKey(certificate);
  if (!v6)
  {
    __break(1u);
    goto LABEL_18;
  }
  v7 = v6;
  v8 = SecKeyCopyExternalRepresentation(v6, 0);
  if (!v8)
  {
LABEL_18:
    __break(1u);
    JUMPOUT(0x212FE67B0);
  }
  v9 = v8;
  v10 = sub_212FE6F8C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(char **)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (unint64_t)(v12 + 15) & 0xFFFFFFFFFFFFFFF0;
  v47 = sub_212FE6F08();
  v48 = v14;
  sub_212FE6F80();
  if (v3)
  {

  }
  else
  {
    v34 = v9;
    v35 = v7;
    v42 = v33;
    v43 = sub_212FE6F20();
    v36 = v33;
    v20 = *(_QWORD *)(v43 - 8);
    v21 = v11;
    v41 = 0;
    v22 = *(_QWORD *)(v20 + 64);
    MEMORY[0x24BDAC7A8](v43);
    v46 = v10;
    v23 = (char *)v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_212FE6F14();
    v24 = sub_212FE6F50();
    v37 = v33;
    v33[4] = v24;
    v33[3] = *(_QWORD *)(v24 - 8);
    v25 = MEMORY[0x24BDAC7A8](v24);
    v27 = (char *)v33 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
    v40 = v33;
    MEMORY[0x24BDAC7A8](v25);
    v12 = (char *)v33 - v13;
    v39 = v21;
    v28 = *(uint64_t (**)(char *, char *, uint64_t))(v21 + 16);
    v29 = v43;
    v38 = (char *)v33 - v13;
    v30 = v28((char *)v33 - v13, (char *)v33 - v13, v46);
    MEMORY[0x24BDAC7A8](v30);
    v31 = v46;
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v23, v23, v29);
    v32 = v41;
    sub_212FE6F2C();
    if (!v32)
    {
      v33[2] = v27;
      v33[1] = (char *)v33 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
      v41 = v20;
      __asm { BR              X10 }
    }

    (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v29);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v38, v31);
  }
  return v12;
}

uint64_t type metadata accessor for CryptoKitWrapper()
{
  return objc_opt_self();
}

uint64_t sub_212FE67E0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199A94D4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_212FE6864()
{
  unint64_t result;

  result = qword_254B6CF28;
  if (!qword_254B6CF28)
  {
    result = MEMORY[0x2199A94E0](MEMORY[0x24BDCFB88], MEMORY[0x24BEE0F88]);
    atomic_store(result, (unint64_t *)&qword_254B6CF28);
  }
  return result;
}

uint64_t sub_212FE68A8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_212FE68EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B6CF48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_212FE6934(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_212FE6944()
{
  unint64_t result;

  result = qword_254B6CF50;
  if (!qword_254B6CF50)
  {
    result = MEMORY[0x2199A94E0](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254B6CF50);
  }
  return result;
}

void di_hybrid_subscriber_t::handle_sub_cqe(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v7 = *(std::__shared_weak_count **)(a1 + 8);
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  *(_QWORD *)a4 = a2;
  *(_DWORD *)(a4 + 8) = a3;
}

void di_hybrid_subscriber_t::handle_sub_cqe(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void std::__function::__func<di_hybrid_subscriber_t::di_hybrid_subscriber_t(io_rings_desc_t *,diskimage_uio::details::diskimage_impl &)::$_0,std::allocator<di_hybrid_subscriber_t::di_hybrid_subscriber_t(io_rings_desc_t *,diskimage_uio::details::diskimage_impl &)::$_0>,diskimage_uio::expected_ns::std::experimental::fundamentals_v3::expected<std::unique_ptr<DiskImage::Context>,std::error_code> ()(void)>::operator()(void *a1, uint64_t a2, uint64_t a3)
{
  int v4;
  const std::error_category *v5;

  v4 = *((_DWORD *)__cxa_begin_catch(a1) + 2);
  v5 = std::generic_category();
  *(_DWORD *)a3 = v4;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  __cxa_end_catch();
}

void diskimage_uio::diskimage_open_params::create(void *a1)
{
  _OWORD *v1;

  v1 = OUTLINED_FUNCTION_7(a1);
  OUTLINED_FUNCTION_1(v1);
  OUTLINED_FUNCTION_3();
}

void diskimage_uio::diskimage::create(void *a1)
{
  uint64_t v1;

  *(_OWORD *)v1 = *(_OWORD *)OUTLINED_FUNCTION_7(a1);
  *(_BYTE *)(v1 + 16) = 0;
  OUTLINED_FUNCTION_8();
}

uint64_t diskimage_uio::details::diskimage_impl::create_context(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  *a1 = 0;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 40))(result);
  return result;
}

void diskimage_uio::details::diskimage_open_params_impl::diskimage_open_params_impl(uint64_t a1, uint64_t a2)
{
  std::shared_ptr<char>::~shared_ptr[abi:ne180100](a1);
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
  else
    OUTLINED_FUNCTION_3();
}

void diskimage_uio::details::diskimage_impl::create_context_impl(void *a1)
{
  uint64_t v1;
  int v2;
  const std::error_category *v3;

  v2 = *((_DWORD *)OUTLINED_FUNCTION_7(a1) + 2);
  v3 = std::generic_category();
  *(_DWORD *)v1 = v2;
  *(_QWORD *)(v1 + 8) = v3;
  *(_BYTE *)(v1 + 16) = 0;
  OUTLINED_FUNCTION_8();
}

void diskimage_uio::details::setup_sync_subscriber(io_rings_subscriber_sync_t &)::$_0::__invoke()
{
  uint64_t v0;
  unint64_t *v1;
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_5();
  if (v0)
  {
    v1 = (unint64_t *)(v0 + 8);
    do
      OUTLINED_FUNCTION_0(v1);
    while (v3);
    if (!v2)
    {
      OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_9();
    }
  }
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6();
}

{
  unint64_t *v0;
  uint64_t v1;
  int v2;

  OUTLINED_FUNCTION_11();
  do
    OUTLINED_FUNCTION_0(v0);
  while (v2);
  if (!v1)
  {
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_10();
  }
  OUTLINED_FUNCTION_3();
}

uint64_t std::__function::__func<info::DiskImageInfoSparseBundle::count_mapped_bytes(DiskImageSparseBundle const&)::$_0,std::allocator<info::DiskImageInfoSparseBundle::count_mapped_bytes(DiskImageSparseBundle const&)::$_0>,void ()(std::string const&,unsigned long long)>::operator()(uint64_t a1, uint64_t a2)
{
  std::streambuf::~streambuf();
  OUTLINED_FUNCTION_0_0();
  return MEMORY[0x2199A89AC](a2 + 112);
}

void std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void di_asif::details::table::read(di_asif::details::ContextASIF &,sg_vec_ns::details::sg_vec_iterator const&,sg_vec_ns::details::sg_vec_iterator const&)::bitmap_handle_t::~bitmap_handle_t(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
  OUTLINED_FUNCTION_3();
}

void ref::Allocator<di_asif::details::table,unsigned long long>::error_ctrl_blk_t::error_ctrl_blk_t()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_3_0();
  if (v4)
  {
    v5 = 4;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v5 = 5;
    v2 = v3;
  }
  OUTLINED_FUNCTION_1_0(v2, v5);
LABEL_6:
  if ((_QWORD *)*v1 == v0)
  {
    v6 = 4;
    goto LABEL_10;
  }
  if (*v1)
  {
    v6 = 5;
    v0 = (_QWORD *)*v1;
LABEL_10:
    OUTLINED_FUNCTION_0_1((uint64_t)v0, *(uint64_t (**)(void))(*v0 + 8 * v6));
    return;
  }
  OUTLINED_FUNCTION_3();
}

uint64_t DiskImage::extents_t::extents_t(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  *a1 = 0;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 40))(result);
  return result;
}

void replace_internal_backend(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  unint64_t v3;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    v3 = __ldaxr(p_shared_owners);
  while (__stlxr(v3 - 1, p_shared_owners));
  if (!v3)
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t boost::container::uninitialized_move_alloc<boost::container::small_vector_allocator<CompressedBackend::promise_io_t,boost::container::new_allocator<void>,void>,CompressedBackend::promise_io_t*,CompressedBackend::promise_io_t*>(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;

  std::shared_ptr<char>::~shared_ptr[abi:ne180100](a1);
  for (result = (uint64_t)__cxa_begin_catch(a2); a4 != a1; a4 += 104)
  {
    v8 = *(_QWORD *)(a4 + 48);
    if (v8)
      *(_QWORD *)(v8 + 32) = 0;
    result = std::shared_ptr<char>::~shared_ptr[abi:ne180100](a4);
  }
  return result;
}

_QWORD *ref::Allocator<CurrentReader,unsigned long long>::error_ctrl_blk_t::error_ctrl_blk_t(_QWORD *result, _QWORD *a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v6;

  if ((_QWORD *)*result == a2)
  {
    v6 = 4;
  }
  else
  {
    if (!*result)
      goto LABEL_6;
    v6 = 5;
    a2 = (_QWORD *)*result;
  }
  result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*a2 + 8 * v6))(a2);
LABEL_6:
  if (*a3 == a4)
    return (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a4 + 32))(a4);
  if (*a3)
    return (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)*a3 + 40))(*a3);
  return result;
}

uint64_t sub_212FE6EC0()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_212FE6ECC()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_212FE6ED8()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_212FE6EE4()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_212FE6EF0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_212FE6EFC()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_212FE6F08()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_212FE6F14()
{
  return MEMORY[0x24BDC6720]();
}

uint64_t sub_212FE6F20()
{
  return MEMORY[0x24BDC6748]();
}

uint64_t sub_212FE6F2C()
{
  return MEMORY[0x24BDC67A8]();
}

uint64_t sub_212FE6F38()
{
  return MEMORY[0x24BDC67C0]();
}

uint64_t sub_212FE6F44()
{
  return MEMORY[0x24BDC67D8]();
}

uint64_t sub_212FE6F50()
{
  return MEMORY[0x24BDC67E8]();
}

uint64_t sub_212FE6F5C()
{
  return MEMORY[0x24BDC6818]();
}

uint64_t sub_212FE6F68()
{
  return MEMORY[0x24BDC6828]();
}

uint64_t sub_212FE6F74()
{
  return MEMORY[0x24BDC6838]();
}

uint64_t sub_212FE6F80()
{
  return MEMORY[0x24BDC6890]();
}

uint64_t sub_212FE6F8C()
{
  return MEMORY[0x24BDC68D8]();
}

uint64_t sub_212FE6F98()
{
  return MEMORY[0x24BDC6900]();
}

uint64_t sub_212FE6FA4()
{
  return MEMORY[0x24BDC6908]();
}

uint64_t sub_212FE6FB0()
{
  return MEMORY[0x24BDC6928]();
}

uint64_t sub_212FE6FBC()
{
  return MEMORY[0x24BDC6938]();
}

uint64_t sub_212FE6FC8()
{
  return MEMORY[0x24BDC6970]();
}

uint64_t sub_212FE6FD4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_212FE6FE0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_212FE6FEC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_212FE6FF8()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_212FE7004()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_212FE7010()
{
  return MEMORY[0x24BDCFAD8]();
}

uint64_t sub_212FE701C()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_212FE7028()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_212FE7034()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_212FE7040()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_212FE704C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_212FE7058()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AAAsyncByteStreamProcess()
{
  return MEMORY[0x24BED2A20]();
}

int AAByteStreamClose(AAByteStream s)
{
  return MEMORY[0x24BED2A30](s);
}

ssize_t AAByteStreamPRead(AAByteStream s, void *buf, size_t nbyte, off_t offset)
{
  return MEMORY[0x24BED2A48](s, buf, nbyte, offset);
}

ssize_t AAByteStreamRead(AAByteStream s, void *buf, size_t nbyte)
{
  return MEMORY[0x24BED2A60](s, buf, nbyte);
}

off_t AAByteStreamSeek(AAByteStream s, off_t offset, int whence)
{
  return MEMORY[0x24BED2A70](s, offset, *(_QWORD *)&whence);
}

ssize_t AAByteStreamWrite(AAByteStream s, const void *buf, size_t nbyte)
{
  return MEMORY[0x24BED2A88](s, buf, nbyte);
}

AAByteStream AACustomByteStreamOpen(void)
{
  return (AAByteStream)MEMORY[0x24BED2AE0]();
}

void AACustomByteStreamSetCloseProc(AAByteStream s, AAByteStreamCloseProc proc)
{
  MEMORY[0x24BED2AF8](s, proc);
}

void AACustomByteStreamSetData(AAByteStream s, void *data)
{
  MEMORY[0x24BED2B08](s, data);
}

void AACustomByteStreamSetPReadProc(AAByteStream s, AAByteStreamPReadProc proc)
{
  MEMORY[0x24BED2B20](s, proc);
}

void AACustomByteStreamSetReadProc(AAByteStream s, AAByteStreamReadProc proc)
{
  MEMORY[0x24BED2B38](s, proc);
}

AAByteStream AAFileStreamOpenWithFD(int fd, int automatic_close)
{
  return (AAByteStream)MEMORY[0x24BED2C80](*(_QWORD *)&fd, *(_QWORD *)&automatic_close);
}

uint64_t AATempStreamOpen()
{
  return MEMORY[0x24BED2D88]();
}

AEAAuthData AEAAuthDataCreateWithContext(AEAContext context)
{
  return (AEAAuthData)MEMORY[0x24BED2D90](context);
}

void AEAAuthDataDestroy(AEAAuthData auth_data)
{
  MEMORY[0x24BED2D98](auth_data);
}

int AEAAuthDataGetEntry(AEAAuthData auth_data, uint32_t i, size_t key_capacity, char *key, size_t *key_length, size_t data_capacity, uint8_t *data, size_t *data_size)
{
  return MEMORY[0x24BED2DA0](auth_data, *(_QWORD *)&i, key_capacity, key, key_length, data_capacity, data, data_size);
}

uint32_t AEAAuthDataGetEntryCount(AEAAuthData auth_data)
{
  return MEMORY[0x24BED2DA8](auth_data);
}

AEAContext AEAContextCreateWithEncryptedStream(AAByteStream encrypted_stream)
{
  return (AEAContext)MEMORY[0x24BED2DB0](encrypted_stream);
}

void AEAContextDestroy(AEAContext context)
{
  MEMORY[0x24BED2DD0](context);
}

int AEAContextGetFieldBlob(AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, size_t buf_capacity, uint8_t *buf, size_t *buf_size)
{
  return MEMORY[0x24BED2DE8](context, *(_QWORD *)&field, *(_QWORD *)&representation, buf_capacity, buf, buf_size);
}

uint64_t AEAContextGetFieldUInt(AEAContext context, AEAContextField field)
{
  return MEMORY[0x24BED2E00](context, *(_QWORD *)&field);
}

int AEAContextSetFieldBlob(AEAContext context, AEAContextField field, AEAContextFieldRepresentation representation, const uint8_t *buf, size_t buf_size)
{
  return MEMORY[0x24BED2E10](context, *(_QWORD *)&field, *(_QWORD *)&representation, buf, buf_size);
}

AAByteStream AEADecryptionRandomAccessInputStreamOpen(AAByteStream encrypted_stream, AEAContext context, size_t alloc_limit, AAFlagSet flags, int n_threads)
{
  return (AAByteStream)MEMORY[0x24BED2E30](encrypted_stream, context, alloc_limit, flags, *(_QWORD *)&n_threads);
}

int BZ2_bzBuffToBuffCompress(char *dest, unsigned int *destLen, char *source, unsigned int sourceLen, int blockSize100k, int verbosity, int workFactor)
{
  return MEMORY[0x24BEDA918](dest, destLen, source, *(_QWORD *)&sourceLen, *(_QWORD *)&blockSize100k, *(_QWORD *)&verbosity, *(_QWORD *)&workFactor);
}

int BZ2_bzBuffToBuffDecompress(char *dest, unsigned int *destLen, char *source, unsigned int sourceLen, int small, int verbosity)
{
  return MEMORY[0x24BEDA920](dest, destLen, source, *(_QWORD *)&sourceLen, *(_QWORD *)&small, *(_QWORD *)&verbosity);
}

unsigned int CCCalibratePBKDF(CCPBKDFAlgorithm algorithm, size_t passwordLen, size_t saltLen, CCPseudoRandomAlgorithm prf, size_t derivedKeyLen, uint32_t msec)
{
  return MEMORY[0x24BDAC0D8](*(_QWORD *)&algorithm, passwordLen, saltLen, *(_QWORD *)&prf, derivedKeyLen, *(_QWORD *)&msec);
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC0E8](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x24BDAC110](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x24BDAC188](cryptorRef);
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  return MEMORY[0x24BDAC190](cryptorRef, iv);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC198](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
  MEMORY[0x24BDAC240](ctx, macOut);
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
  MEMORY[0x24BDAC248](ctx, *(_QWORD *)&algorithm, key, keyLength);
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
  MEMORY[0x24BDAC250](ctx, data, dataLength);
}

int CCKeyDerivationPBKDF(CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  return MEMORY[0x24BDAC280](*(_QWORD *)&algorithm, password, passwordLen, salt, saltLen, *(_QWORD *)&prf, *(_QWORD *)&rounds, derivedKey);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  return MEMORY[0x24BDAC2D0](bytes, count);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x24BDBB868](theArray, range.location, range.length, values);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
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

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return (CFStringRef)MEMORY[0x24BDBC948](userNotification, key, idx);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

CFDictionaryRef DADiskCopyDescription(DADiskRef disk)
{
  return (CFDictionaryRef)MEMORY[0x24BE2D000](disk);
}

DADiskRef DADiskCreateFromBSDName(CFAllocatorRef allocator, DASessionRef session, const char *name)
{
  return (DADiskRef)MEMORY[0x24BE2D018](allocator, session, name);
}

DADiskRef DADiskCreateFromVolumePath(CFAllocatorRef allocator, DASessionRef session, CFURLRef path)
{
  return (DADiskRef)MEMORY[0x24BE2D020](allocator, session, path);
}

void DADiskEject(DADiskRef disk, DADiskEjectOptions options, DADiskEjectCallback callback, void *context)
{
  MEMORY[0x24BE2D028](disk, *(_QWORD *)&options, callback, context);
}

void DADiskUnmount(DADiskRef disk, DADiskUnmountOptions options, DADiskUnmountCallback callback, void *context)
{
  MEMORY[0x24BE2D030](disk, *(_QWORD *)&options, callback, context);
}

uint64_t DADissenterGetProcessID()
{
  return MEMORY[0x24BE2D038]();
}

DAReturn DADissenterGetStatus(DADissenterRef dissenter)
{
  return MEMORY[0x24BE2D040](dissenter);
}

void DARegisterDiskDisappearedCallback(DASessionRef session, CFDictionaryRef match, DADiskDisappearedCallback callback, void *context)
{
  MEMORY[0x24BE2D048](session, match, callback, context);
}

uint64_t DARegisterIdleCallback()
{
  return MEMORY[0x24BE2D050]();
}

DASessionRef DASessionCreate(CFAllocatorRef allocator)
{
  return (DASessionRef)MEMORY[0x24BE2D060](allocator);
}

void DASessionScheduleWithRunLoop(DASessionRef session, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x24BE2D068](session, runLoop, runLoopMode);
}

void DASessionUnscheduleFromRunLoop(DASessionRef session, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x24BE2D070](session, runLoop, runLoopMode);
}

void DAUnregisterCallback(DASessionRef session, void *callback, void *context)
{
  MEMORY[0x24BE2D078](session, callback, context);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD7EB0](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8660](*(_QWORD *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
  MEMORY[0x24BDD8670](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x24BDD86C8](*(_QWORD *)&object);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x24BDD86F0](*(_QWORD *)&object, *(_QWORD *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88B8](*(_QWORD *)&entry, plane, *(_QWORD *)&options, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD8918](entryID);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return MEMORY[0x24BDD89C8](*(_QWORD *)&service, waitTime);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x24BDE8888](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AA8](key, error);
}

CFDataRef SecKeyCreateDecryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef ciphertext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8AE8](key, algorithm, ciphertext, error);
}

CFDataRef SecKeyCreateEncryptedData(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef plaintext, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDE8B00](key, algorithm, plaintext, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x24BEDA9C0](this, __s);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x24BEDAA88](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAB0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB30](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB40](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x24BEDAB60](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
  MEMORY[0x24BEDABC0](a1, a2, a3);
}

std::__sp_mut *__cdecl std::__get_sp_mut(const void *a1)
{
  return (std::__sp_mut *)MEMORY[0x24BEDABE0](a1);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x24BEDAC08](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string::iterator std::string::insert(std::string *this, std::string::const_iterator __pos, std::string::value_type __c)
{
  return (std::string::iterator)MEMORY[0x24BEDAC78](this, __pos.__i_, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x24BEDACC0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x24BEDAEF0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF18]();
}

{
  return MEMORY[0x24BEDAF28]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF58]();
}

{
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF70]();
}

{
  return MEMORY[0x24BEDAF80]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

void std::error_category::~error_category(std::error_category *this)
{
  MEMORY[0x24BEDB028](this);
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x24BEDB038](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
  MEMORY[0x24BEDB040](this);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

uint64_t std::stringbuf::basic_stringbuf()
{
  return MEMORY[0x24BEDB070]();
}

const std::error_category *std::generic_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB0B8]();
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x24BEDB0F8](this);
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
  MEMORY[0x24BEDB100](this);
}

void std::condition_variable::__do_timed_wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk, std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> a3)
{
  MEMORY[0x24BEDB108](this, __lk, a3.__d_.__rep_);
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x24BEDB110](this, __lk);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x24BEDB198]();
}

void std::__libcpp_atomic_wait(const void *a1, std::__cxx_contention_t a2)
{
  MEMORY[0x24BEDB1A8](a1, a2);
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x24BEDB1B0](*(_QWORD *)&__ev, __what_arg);
}

void std::__cxx_atomic_notify_all(const void *a1)
{
  MEMORY[0x24BEDB1C0](a1);
}

std::__cxx_contention_t std::__libcpp_atomic_monitor(const void *a1)
{
  return MEMORY[0x24BEDB1C8](a1);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x24BEDB308](a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x24BEDB3E0]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x24BEDB3F0]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::thread::join(std::thread *this)
{
  MEMORY[0x24BEDB468](this);
}

void std::thread::~thread(std::thread *this)
{
  MEMORY[0x24BEDB478](this);
}

void std::__sp_mut::lock(std::__sp_mut *this)
{
  MEMORY[0x24BEDB4F0](this);
}

void std::__sp_mut::unlock(std::__sp_mut *this)
{
  MEMORY[0x24BEDB4F8](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::move(std::ios_base *this, std::ios_base *a2)
{
  MEMORY[0x24BEDB520](this, a2);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB620](retstr, __val);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x24BEDB660](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24CEEB018();
}

void operator delete(void *__p)
{
  off_24CEEB020(__p);
}

uint64_t operator delete()
{
  return off_24CEEB028();
}

uint64_t operator new[]()
{
  return off_24CEEB030();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CEEB038(__sz);
}

uint64_t operator new()
{
  return off_24CEEB040();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_cast(void)
{
  MEMORY[0x24BEDB900]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x24BEDB920](lpmangled, lpout, lpoutlen, lpstatus);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
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

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x24BDAC908]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDAD038](a1, *(_QWORD *)&a2);
}

char *__cdecl basename_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAD2B8](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x24BDAD328](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
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

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB990](*(_QWORD *)&algorithm);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDADA08](*(_QWORD *)&a1, a2, a3);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x24BEDF1C0](crc, buf, *(_QWORD *)&len);
}

void curl_easy_cleanup(CURL *curl)
{
  MEMORY[0x24BEE9DD8](curl);
}

CURLcode curl_easy_getinfo(CURL *curl, CURLINFO info, ...)
{
  return MEMORY[0x24BEE9DE0](curl, *(_QWORD *)&info);
}

CURL *curl_easy_init(void)
{
  return (CURL *)MEMORY[0x24BEE9DE8]();
}

CURLcode curl_easy_perform(CURL *curl)
{
  return MEMORY[0x24BEE9DF0](curl);
}

CURLcode curl_easy_setopt(CURL *curl, CURLoption option, ...)
{
  return MEMORY[0x24BEE9DF8](curl, *(_QWORD *)&option);
}

const char *__cdecl curl_easy_strerror(CURLcode a1)
{
  return (const char *)MEMORY[0x24BEE9E00](*(_QWORD *)&a1);
}

CURLcode curl_global_init(uint64_t flags)
{
  return MEMORY[0x24BEE9E08](flags);
}

curl_slist *__cdecl curl_slist_append(curl_slist *list, const char *data)
{
  return (curl_slist *)MEMORY[0x24BEE9E10](list, data);
}

void curl_slist_free_all(curl_slist *list)
{
  MEMORY[0x24BEE9E18](list);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x24BDADC70](iterations, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x24BDADD10](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
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

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return MEMORY[0x24BDAE2A8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  return MEMORY[0x24BDAE2C0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fchownat(int a1, const char *a2, uid_t a3, gid_t a4, int a5)
{
  return MEMORY[0x24BDAE2D0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x24BDAE308](*(_QWORD *)&a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

int flock(int a1, int a2)
{
  return MEMORY[0x24BDAE3B0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x24BDAE510](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x24BDAE518](*(_QWORD *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x24BDAE528](*(_QWORD *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x24BDAE588](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

group *__cdecl getgrgid(gid_t a1)
{
  return (group *)MEMORY[0x24BDAE618](*(_QWORD *)&a1);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return MEMORY[0x24BDAE698](a1, *(_QWORD *)&a2);
}

int getpagesize(void)
{
  return MEMORY[0x24BDAE6B8]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

int isatty(int a1)
{
  return MEMORY[0x24BDAE8E0](*(_QWORD *)&a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAED00](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED90](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x24BDAEF30](*(_QWORD *)&a1, a2, a3);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

int pclose(FILE *a1)
{
  return MEMORY[0x24BDAF5A0](a1);
}

void perror(const char *a1)
{
  MEMORY[0x24BDAF5A8](a1);
}

FILE *__cdecl popen(const char *a1, const char *a2)
{
  return (FILE *)MEMORY[0x24BDAF5E0](a1, a2);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t preadv(int a1, const iovec *a2, int a3, off_t a4)
{
  return MEMORY[0x24BDAF6A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwritev(int a1, const iovec *a2, int a3, off_t a4)
{
  return MEMORY[0x24BDAFA08](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

int raise(int a1)
{
  return MEMORY[0x24BDAFA30](*(_QWORD *)&a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

char *__cdecl readpassphrase(const char *a1, char *a2, size_t a3, int a4)
{
  return (char *)MEMORY[0x24BDAFAA8](a1, a2, a3, *(_QWORD *)&a4);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB0](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

int sched_yield(void)
{
  return MEMORY[0x24BDAFC68]();
}

int seteuid(uid_t a1)
{
  return MEMORY[0x24BDAFD18](*(_QWORD *)&a1);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x24BDAFFD0](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0010](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x24BDB02A0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

void uuid_generate_random(uuid_t out)
{
  MEMORY[0x24BDB0320](out);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

