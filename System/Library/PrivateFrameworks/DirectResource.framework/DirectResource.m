re::DirectFence *re::DirectFence::DirectFence(re::DirectFence *this, char *a2)
{
  uint64_t v4;

  ArcSharedObject::ArcSharedObject(this, 0);
  *(_QWORD *)v4 = &off_250B64D48;
  *(_DWORD *)(v4 + 16) = 0;
  *(_BYTE *)(v4 + 20) = 1;
  *(_QWORD *)(v4 + 24) = 0;
  std::string::basic_string[abi:nn180100]<0>((_QWORD *)(v4 + 32), a2);
  *((_QWORD *)this + 7) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  return this;
}

ArcSharedObject *re::DirectFence::DirectFence(ArcSharedObject *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  char *v7;
  char __str[128];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  ArcSharedObject::ArcSharedObject(a1, 0);
  *(_QWORD *)v4 = &off_250B64D48;
  *(_DWORD *)(v4 + 16) = 1;
  *(_BYTE *)(v4 + 20) = 1;
  *(_OWORD *)(v4 + 32) = 0u;
  v5 = v4 + 32;
  *(_QWORD *)(v4 + 24) = a2;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  v6 = objc_msgSend(a2, sel_label);
  if (v6)
  {
    v7 = (char *)objc_msgSend(v6, sel_UTF8String);
  }
  else
  {
    snprintf(__str, 0x80uLL, "CommandBuffer %p", a2);
    v7 = __str;
  }
  MEMORY[0x23B84F8BC](v5, v7);
  return a1;
}

void re::DirectFence::~DirectFence(re::DirectFence *this)
{
  void **v2;

  *(_QWORD *)this = &off_250B64D48;
  if (*((_BYTE *)this + 20))
    re::DirectFence::~DirectFence();
  v2 = (void **)((char *)this + 56);
  std::vector<std::function<void ()(re::DirectFence *)>>::__destroy_vector::operator()[abi:nn180100](&v2);
  if (*((char *)this + 55) < 0)
    operator delete(*((void **)this + 4));
  ArcSharedObject::~ArcSharedObject(this);
}

{
  re::DirectFence::~DirectFence(this);
  JUMPOUT(0x23B84F8E0);
}

uint64_t re::DirectFence::invalidate(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (!*(_BYTE *)(this + 20))
    re::DirectFence::invalidate();
  v1 = this;
  *(_BYTE *)(this + 20) = 0;
  v2 = *(_QWORD *)(this + 56);
  v3 = *(_QWORD *)(this + 64);
  while (v2 != v3)
  {
    v6 = v1;
    v4 = *(_QWORD *)(v2 + 24);
    if (!v4)
    {
      v5 = std::__throw_bad_function_call[abi:nn180100]();
      return re::DirectFence::addInvalidateHandler(v5);
    }
    this = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v4 + 48))(v4, &v6);
    v2 += 32;
  }
  return this;
}

void **re::DirectFence::addInvalidateHandler(uint64_t a1, uint64_t a2)
{
  return std::vector<std::function<void ()(re::DirectFence *)>>::push_back[abi:nn180100]((uint64_t *)(a1 + 56), a2);
}

void **std::vector<std::function<void ()(re::DirectFence *)>>::push_back[abi:nn180100](uint64_t *a1, uint64_t a2)
{
  void **result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17[5];

  v6 = a1[2];
  result = (void **)(a1 + 2);
  v5 = v6;
  v7 = (unint64_t)*(result - 1);
  if (v7 >= v6)
  {
    v9 = (uint64_t)(v7 - *a1) >> 5;
    if ((unint64_t)(v9 + 1) >> 59)
      abort();
    v10 = v5 - *a1;
    v11 = v10 >> 4;
    if (v10 >> 4 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFE0)
      v12 = 0x7FFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v17[4] = result;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>((uint64_t)result, v12);
    else
      v13 = 0;
    v14 = &v13[32 * v9];
    v17[0] = v13;
    v17[1] = v14;
    v17[3] = &v13[32 * v12];
    v15 = *(_QWORD *)(a2 + 24);
    if (v15)
    {
      if (v15 == a2)
      {
        *((_QWORD *)v14 + 3) = v14;
        (*(void (**)(_QWORD, char *))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), v14);
      }
      else
      {
        *((_QWORD *)v14 + 3) = v15;
        *(_QWORD *)(a2 + 24) = 0;
      }
    }
    else
    {
      *((_QWORD *)v14 + 3) = 0;
    }
    v17[2] = v14 + 32;
    std::vector<std::function<void ()(re::DirectFence *)>>::__swap_out_circular_buffer(a1, v17);
    v16 = a1[1];
    result = std::__split_buffer<std::function<void ()(re::DirectFence *)>>::~__split_buffer(v17);
  }
  else
  {
    v8 = *(_QWORD *)(a2 + 24);
    if (v8)
    {
      if (v8 == a2)
      {
        *(_QWORD *)(v7 + 24) = v7;
        result = (void **)(*(uint64_t (**)(_QWORD, unint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), v7);
      }
      else
      {
        *(_QWORD *)(v7 + 24) = v8;
        *(_QWORD *)(a2 + 24) = 0;
      }
    }
    else
    {
      *(_QWORD *)(v7 + 24) = 0;
    }
    v16 = v7 + 32;
  }
  a1[1] = v16;
  return result;
}

void re::DirectFence::description(re::DirectFence *this@<X0>, std::string *a2@<X8>)
{
  const std::string::value_type *v4;
  char *v5;
  const std::string::value_type *v6;
  int v7;
  const std::string::value_type *v8;
  std::string::size_type v9;
  std::string *v10;
  std::string v11;

  std::string::basic_string[abi:nn180100]<0>(&v11, "Fence: ");
  v6 = (const std::string::value_type *)*((_QWORD *)this + 4);
  v5 = (char *)this + 32;
  v4 = v6;
  v7 = v5[23];
  if (v7 >= 0)
    v8 = v5;
  else
    v8 = v4;
  if (v7 >= 0)
    v9 = v5[23];
  else
    v9 = *((_QWORD *)v5 + 1);
  v10 = std::string::append(&v11, v8, v9);
  *a2 = *v10;
  v10->__r_.__value_.__r.__words[0] = 0;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
}

_QWORD *std::string::basic_string[abi:nn180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    abort();
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

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

void std::vector<std::function<void ()(re::DirectFence *)>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  char *v2;
  char *v4;
  void *v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v1 = *a1;
  v2 = (char *)**a1;
  if (!v2)
    return;
  v4 = (char *)v1[1];
  v5 = **a1;
  if (v4 == v2)
    goto LABEL_10;
  do
  {
    v6 = v4 - 32;
    v7 = (char *)*((_QWORD *)v4 - 1);
    if (v4 - 32 == v7)
    {
      v7 = v4 - 32;
      v8 = 4;
    }
    else
    {
      if (!v7)
        goto LABEL_8;
      v8 = 5;
    }
    (*(void (**)(void))(*(_QWORD *)v7 + 8 * v8))();
LABEL_8:
    v4 = v6;
  }
  while (v6 != v2);
  v5 = **a1;
LABEL_10:
  v1[1] = v2;
  operator delete(v5);
}

uint64_t std::__throw_bad_function_call[abi:nn180100]()
{
  std::__libcpp_verbose_abort("bad_function_call was thrown in -fno-exceptions mode");
  return std::vector<std::function<void ()(re::DirectFence *)>>::__swap_out_circular_buffer();
}

uint64_t std::vector<std::function<void ()(re::DirectFence *)>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>,std::reverse_iterator<std::function<void ()(re::DirectFence *)>*>,std::reverse_iterator<std::function<void ()(re::DirectFence *)>*>,std::reverse_iterator<std::function<void ()(re::DirectFence *)>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>,std::reverse_iterator<std::function<void ()(re::DirectFence *)>*>,std::reverse_iterator<std::function<void ()(re::DirectFence *)>*>,std::reverse_iterator<std::function<void ()(re::DirectFence *)>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a7;
  if (a3 != a5)
  {
    v10 = a7 - 32;
    do
    {
      v11 = a3 - 32;
      v12 = *(_QWORD *)(a3 - 8);
      if (v12)
      {
        if (v11 == v12)
        {
          *(_QWORD *)(v10 + 24) = v10;
          (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a3 - 8) + 24))(*(_QWORD *)(a3 - 8), v10);
        }
        else
        {
          *(_QWORD *)(v10 + 24) = v12;
          *(_QWORD *)(a3 - 8) = 0;
        }
      }
      else
      {
        *(_QWORD *)(v10 + 24) = 0;
      }
      v7 -= 32;
      v10 -= 32;
      a3 = v11;
    }
    while (v11 != a5);
  }
  return a6;
}

void **std::__split_buffer<std::function<void ()(re::DirectFence *)>>::~__split_buffer(void **a1)
{
  std::__split_buffer<std::function<void ()(re::DirectFence *)>>::clear[abi:nn180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

_QWORD *std::__split_buffer<std::function<void ()(re::DirectFence *)>>::clear[abi:nn180100](_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v2 = (_QWORD *)result[1];
  v1 = (_QWORD *)result[2];
  if (v1 != v2)
  {
    v3 = result;
    while (1)
    {
      result = v1 - 4;
      v3[2] = v1 - 4;
      v4 = (_QWORD *)*(v1 - 1);
      if (v4 == result)
        break;
      if (v4)
      {
        result = v4;
        v5 = 5;
LABEL_7:
        (*(void (**)(void))(*result + 8 * v5))();
        result = (_QWORD *)v3[2];
      }
      v1 = result;
      if (result == v2)
        return result;
    }
    v5 = 4;
    goto LABEL_7;
  }
  return result;
}

BOOL re::MeshValidation::validateIndices_neon(uint16x8_t *this, unint64_t a2, unsigned int a3)
{
  uint16x8_t v3;
  unint64_t v4;
  int16x8_t v5;
  uint16x8_t *v6;
  uint16x8_t v7;
  unint64_t v8;
  unsigned int v9;
  const unsigned __int16 *v11;
  unint64_t v12;
  unsigned int v13;

  if (a2 >= 8)
  {
    v3 = (uint16x8_t)vdupq_n_s16(a3);
    v4 = a2 >> 3;
    v5.i64[0] = -1;
    v5.i64[1] = -1;
    v6 = this;
    do
    {
      v7 = (uint16x8_t)vorrq_s8((int8x16_t)vcgtq_u16(v3, *v6), (int8x16_t)vceqq_s16(*(int16x8_t *)v6, v5));
      v7.i16[0] = vminvq_u16(v7);
      if (!v7.i32[0])
        return 0;
      ++v6;
    }
    while (--v4);
  }
  v8 = a2 & 0xFFFFFFFFFFFFFFF8;
  if ((a2 & 0xFFFFFFFFFFFFFFF8) >= a2)
    return 1;
  v9 = this->u16[v8];
  if (v9 >= a3 && v9 != 0xFFFF)
    return 0;
  v11 = (const unsigned __int16 *)(v8 + 1);
  do
  {
    v12 = (unint64_t)v11;
    if ((const unsigned __int16 *)a2 == v11)
      break;
    v13 = this->u16[(_QWORD)v11];
    v11 = (const unsigned __int16 *)((char *)v11 + 1);
  }
  while (v13 < a3 || v13 == 0xFFFF);
  return v12 >= a2;
}

BOOL re::MeshValidation::validateIndices_neon(uint32x4_t *this, unint64_t a2, unsigned int a3)
{
  uint32x4_t v3;
  unint64_t v4;
  int32x4_t v5;
  uint32x4_t *v6;
  unint64_t v7;
  unsigned int v8;
  const unsigned int *v10;
  unint64_t v11;
  unsigned int v12;

  if (a2 >= 4)
  {
    v3 = (uint32x4_t)vdupq_n_s32(a3);
    v4 = a2 >> 2;
    v5.i64[0] = -1;
    v5.i64[1] = -1;
    v6 = this;
    while (vminvq_u32((uint32x4_t)vorrq_s8((int8x16_t)vcgtq_u32(v3, *v6), (int8x16_t)vceqq_s32(*(int32x4_t *)v6, v5))))
    {
      ++v6;
      if (!--v4)
        goto LABEL_5;
    }
    return 0;
  }
LABEL_5:
  v7 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  if ((a2 & 0xFFFFFFFFFFFFFFFCLL) >= a2)
    return 1;
  v8 = this->u32[v7];
  if (v8 >= a3 && v8 != -1)
    return 0;
  v10 = (const unsigned int *)(v7 + 1);
  do
  {
    v11 = (unint64_t)v10;
    if ((const unsigned int *)a2 == v10)
      break;
    v12 = this->u32[(_QWORD)v10];
    v10 = (const unsigned int *)((char *)v10 + 1);
  }
  while (v12 < a3 || v12 == -1);
  return v11 >= a2;
}

BOOL re::MeshValidation::validateIndices(uint64_t a1, uint32x4_t *this, unint64_t a3, unsigned __int16 a4)
{
  if (a1 == 1)
    return re::MeshValidation::validateIndices_neon(this, a3 >> 2, a4);
  if (a1)
    return 0;
  return re::MeshValidation::validateIndices_neon((uint16x8_t *)this, a3 >> 1, a4);
}

uint64_t re::directResourceLog(re *this)
{
  unsigned __int8 v1;
  unint64_t v2;
  int v4;

  v2 = 0x25698A000uLL;
  if ((v1 & 1) == 0)
  {
    v2 = 0x25698A000;
    if (v4)
    {
      re::directResourceLog(void)::log = (uint64_t)os_log_create("com.apple.re", "DirectResource");
      v2 = 0x25698A000;
    }
  }
  return *(_QWORD *)(v2 + 2576);
}

uint64_t re::DirectMaterialParameters::create@<X0>(unint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  BOOL v4;
  void *v5;
  uint64_t result;

  if (*a1 > 0x10 || (*a1 == (uint64_t)(a1[2] - a1[1]) >> 3 ? (v4 = a1[4] > 0x10) : (v4 = 1), v4))
  {
    result = 0;
  }
  else
  {
    v5 = operator new(0x88uLL);
    result = re::DirectMaterialParameters::DirectMaterialParameters((uint64_t)v5, a1);
  }
  *a2 = result;
  return result;
}

uint64_t re::DirectMaterialParameters::DirectMaterialParameters(uint64_t a1, unint64_t *a2)
{
  re::DirectResource *v4;

  v4 = re::DirectResource::DirectResource((re::DirectResource *)a1);
  *(_QWORD *)v4 = &off_250B64D80;
  *((_QWORD *)v4 + 6) = *a2;
  std::vector<unsigned long>::vector((_QWORD *)v4 + 7, (uint64_t)(a2 + 1));
  *(_QWORD *)(a1 + 80) = a2[4];
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  std::vector<re::SharedPtr<re::DirectBuffer>>::resize(a1 + 88, *a2);
  std::vector<re::SharedPtr<re::DirectBuffer>>::resize(a1 + 112, a2[4]);
  return a1;
}

void std::vector<re::SharedPtr<re::DirectBuffer>>::resize(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = (v3 - *(_QWORD *)a1) >> 3;
  if (a2 <= v4)
  {
    if (a2 < v4)
    {
      v5 = *(_QWORD *)a1 + 8 * a2;
      if (v3 != v5)
      {
        v6 = *(_QWORD *)(a1 + 8);
        do
        {
          v8 = *(_QWORD *)(v6 - 8);
          v6 -= 8;
          v7 = v8;
          if (v8)
          {

            *(_QWORD *)(v3 - 8) = 0;
          }
          v3 = v6;
        }
        while (v6 != v5);
      }
      *(_QWORD *)(a1 + 8) = v5;
    }
  }
  else
  {
    std::vector<re::SharedPtr<re::DirectBuffer>>::__append((char **)a1, a2 - v4);
  }
}

void re::DirectMaterialParameters::~DirectMaterialParameters(re::DirectMaterialParameters *this)
{
  void *v2;
  void **v3;

  v3 = (void **)((char *)this + 112);
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = (void **)((char *)this + 88);
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  v2 = (void *)*((_QWORD *)this + 7);
  if (v2)
  {
    *((_QWORD *)this + 8) = v2;
    operator delete(v2);
  }
  re::DirectResource::~DirectResource(this);
}

{
  re::DirectMaterialParameters::~DirectMaterialParameters(this);
  JUMPOUT(0x23B84F8E0);
}

uint64_t re::DirectMaterialParameters::forEachSlot(uint64_t result, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (_QWORD *)result;
  if (*(_QWORD *)(result + 96) != *(_QWORD *)(result + 88))
  {
    v4 = 0;
    do
    {
      v8 = 4;
      v9 = v4;
      v5 = *(_QWORD *)(a2 + 24);
      if (!v5)
        goto LABEL_10;
      result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v5 + 48))(v5, &v8);
    }
    while (++v4 < (unint64_t)((uint64_t)(v3[12] - v3[11]) >> 3));
  }
  if (v3[15] != v3[14])
  {
    v6 = 0;
    while (1)
    {
      v8 = 5;
      v9 = v6;
      v7 = *(_QWORD *)(a2 + 24);
      if (!v7)
        break;
      result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v7 + 48))(v7, &v8);
      if (++v6 >= (unint64_t)((uint64_t)(v3[15] - v3[14]) >> 3))
        return result;
    }
LABEL_10:
    std::__throw_bad_function_call[abi:nn180100]();
    return re::DirectMaterialParameters::setPayload();
  }
  return result;
}

uint64_t re::DirectMaterialParameters::setPayload()
{
  return 0;
}

uint64_t re::DirectMaterialParameters::payload()
{
  return 0;
}

uint64_t re::DirectMaterialParameters::type(re::DirectMaterialParameters *this)
{
  return 4;
}

uint64_t re::DirectMaterialParameters::attachToDevice()
{
  return 1;
}

uint64_t re::DirectMaterialParameters::isAttachedToDevice(re::DirectMaterialParameters *this)
{
  return 1;
}

_QWORD *std::vector<unsigned long>::vector(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  const void *v4;
  int64_t v5;
  char *v6;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = *(const void **)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v5 = v3 - *(_QWORD *)a2;
  if (v3 != *(_QWORD *)a2)
  {
    std::vector<unsigned long>::__vallocate[abi:nn180100](a1, v5 >> 3);
    v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *std::vector<unsigned long>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(8 * a2);
}

void std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<re::SharedPtr<re::DirectBuffer>>::__clear[abi:nn180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<re::SharedPtr<re::DirectBuffer>>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *a1;
  v3 = a1[1];
  if (v3 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(_QWORD *)(v4 - 8);
      v4 -= 8;
      v5 = v6;
      if (v6)
      {

        *(_QWORD *)(v3 - 8) = 0;
      }
      v3 = v4;
    }
    while (v4 != v2);
  }
  a1[1] = v2;
}

void std::vector<re::SharedPtr<re::DirectBuffer>>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  __int128 v19;
  char *v20;
  uint64_t v21;
  __int128 v22;
  char *v23;
  uint64_t v24;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 3);
    if (v10 >> 61)
      abort();
    v11 = v9 >> 3;
    v12 = v5 - v8;
    if (v12 >> 2 > v10)
      v10 = v12 >> 2;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    v24 = v4;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[8 * v11];
    v16 = &v14[8 * v13];
    v23 = v16;
    bzero(v15, 8 * a2);
    v17 = &v15[8 * a2];
    *((_QWORD *)&v22 + 1) = v17;
    if (v7 != v8)
    {
      do
      {
        v18 = *((_QWORD *)v7 - 1);
        v7 -= 8;
        *((_QWORD *)v15 - 1) = v18;
        v15 -= 8;
        *(_QWORD *)v7 = 0;
      }
      while (v7 != v8);
      v17 = (char *)*((_QWORD *)&v22 + 1);
      v16 = v23;
    }
    v19 = *(_OWORD *)a1;
    *a1 = v15;
    a1[1] = v17;
    v22 = v19;
    v20 = a1[2];
    a1[2] = v16;
    v23 = v20;
    v21 = v19;
    std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)&v21);
  }
}

uint64_t std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::__destruct_at_end[abi:nn180100](a1, *(_QWORD **)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::__destruct_at_end[abi:nn180100](uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD **)(a1 + 16);
  while (v2 != a2)
  {
    v6 = *--v2;
    v5 = v6;
    *(_QWORD *)(a1 + 16) = v2;
    if (v6)
    {

      *v2 = 0;
      v2 = *(_QWORD **)(a1 + 16);
    }
  }
}

void re::SharedPtr<re::DirectBuffer>::reset(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  id v5;

  v2 = *a1;
  if (*a1 != a2)
  {
    if (a2)
    {
      v5 = (id)(a2 + 8);
      v2 = *a1;
    }
    if (v2)

    *a1 = a2;
  }
}

void re::XPCObject::~XPCObject(void **this)
{
  void *v2;

  v2 = *this;
  if (v2)
  {
    xpc_release(v2);
    *this = 0;
  }
}

void re::XPCObject::setValue(xpc_object_t *this, xpc_object_t object)
{
  if (object)
    xpc_retain(object);
  if (*this)
    xpc_release(*this);
  *this = object;
}

void **re::XPCObject::operator=(void **a1, void **a2)
{
  void *v4;

  v4 = *a1;
  if (v4)
    xpc_release(v4);
  *a1 = *a2;
  *a2 = 0;
  return a1;
}

_QWORD *re::DirectResourceEvent::DirectResourceEvent(_QWORD *this)
{
  *this = 0;
  return this;
}

xpc_object_t *re::DirectResourceEvent::operator=(xpc_object_t *a1, xpc_object_t *a2)
{
  re::XPCObject::setValue(a1, *a2);
  return a1;
}

xpc_object_t *re::DirectResourceEvent::operator=(xpc_object_t *a1, id a2)
{
  xpc_object_t v4;
  id v5;
  uint64_t v6;

  v4 = *a1;
  if (v4)
  {
    xpc_release(v4);
    *a1 = 0;
  }
  if (a2)
  {
    v5 = objc_msgSend(a2, sel_newSharedEventHandle);
    objc_msgSend(v5, sel_eventPort);
    v6 = xpc_mach_send_create();
    if (*a1)
      xpc_release(*a1);
    *a1 = (xpc_object_t)v6;
    if (v5)

  }
  return a1;
}

id re::DirectResourceEvent::makeEvent@<X0>(void *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t right;
  id result;

  right = xpc_mach_send_get_right();
  if ((objc_msgSend(a1, sel_respondsToSelector_, sel_newSharedEventWithMachPort_) & 1) != 0
    || (result = objc_msgSend(a1, sel_methodSignatureForSelector_, sel_newSharedEventWithMachPort_)) != 0)
  {
    result = objc_msgSend(a1, sel_newSharedEventWithMachPort_, right);
  }
  *a2 = result;
  return result;
}

void re::toString(re *this@<X0>, char *a2@<X8>)
{
  uuid_unparse((const unsigned __int8 *)this, a2);
}

uint64_t re::lengthInBytes(uint64_t a1)
{
  if (a1)
    return 4 * (a1 == 1);
  else
    return 2;
}

unint64_t re::lengthInBytes(uint64_t a1, _QWORD *a2, unint64_t a3)
{
  unsigned __int8 v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  if (a2[4])
  {
    v3 = 0;
    v4 = 0;
    v5 = a2[2];
    if (!is_mul_ok(v5, a3))
      return v4 | v3;
    v6 = v5 * a3;
    v7 = *(_QWORD *)(a1 + 24);
    v8 = a2[1];
    v9 = v7 + v8;
    v10 = __CFADD__(v7, v8);
    v11 = MTLAttributeFormatSize(*(MTLAttributeFormat *)(a1 + 8));
    if (v11 <= v6)
      v12 = v6;
    else
      v12 = v11;
    v13 = __CFADD__(v12, v9);
    v14 = v12 + v9;
    v15 = v13;
    if (v10)
    {
LABEL_13:
      v3 = 0;
      v4 = 0;
      return v4 | v3;
    }
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 24);
    v17 = a2[1];
    v18 = v16 + v17;
    v19 = __CFADD__(v16, v17);
    v20 = MTLAttributeFormatSize(*(MTLAttributeFormat *)(a1 + 8));
    v14 = v20 + v18;
    v15 = __CFADD__(v20, v18);
    if (v19)
      goto LABEL_13;
  }
  v3 = 0;
  v4 = 0;
  if (!v15)
  {
    v4 = v14 & 0xFFFFFFFFFFFFFF00;
    v3 = v14;
  }
  return v4 | v3;
}

const char *re::toString(unsigned int a1)
{
  if (a1 > 4)
    return "???";
  else
    return off_250B64DE0[a1];
}

const char *re::toString(int a1)
{
  if ((a1 + 1) > 7)
    return "???";
  else
    return off_250B64E08[a1 + 1];
}

void re::DirectBuffer::create(_QWORD *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  char *v6;
  re::DirectResource *v7;

  if (*a2 && re::DirectBufferValidation::isWellFormed(a1))
  {
    v6 = (char *)operator new(0x58uLL);
    v7 = re::DirectResource::DirectResource((re::DirectResource *)v6);
    *(_QWORD *)v7 = &off_250B64E58;
    *((_OWORD *)v7 + 3) = *(_OWORD *)a1;
    *((_QWORD *)v7 + 9) = 0;
    *((_QWORD *)v7 + 10) = 0;
    *((_QWORD *)v7 + 8) = 0;
    if (re::DirectBuffer::allocateStorage((uint64_t)v7, (uint64_t)a2))
    {
      *a3 = v6;
    }
    else
    {
      *a3 = 0;

    }
  }
  else
  {
    *a3 = 0;
  }
}

BOOL re::DirectBuffer::allocateStorage(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  if (*(_BYTE *)(a2 + 8))
    v3 = 11;
  else
    v3 = 3;
  re::DirectMemoryResource::create(*(re::MemoryMappedRegion **)(a1 + 48), (re::DirectMemoryResource *)v3, *(void **)a2, &v7);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = v7;
  *(_QWORD *)(a1 + 72) = v7;
  v7 = v4;
  if (v4)
  {

    v5 = *(_QWORD *)(a1 + 72);
  }
  if (v5)
    *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 48);
  return v5 != 0;
}

__n128 re::DirectBuffer::DirectBuffer(re::DirectResource *a1, __n128 *a2)
{
  re::DirectResource *v3;
  __n128 result;

  v3 = re::DirectResource::DirectResource(a1);
  *(_QWORD *)v3 = &off_250B64E58;
  result = *a2;
  *((__n128 *)v3 + 3) = *a2;
  *((_QWORD *)v3 + 9) = 0;
  *((_QWORD *)v3 + 10) = 0;
  *((_QWORD *)v3 + 8) = 0;
  return result;
}

void re::DirectBuffer::~DirectBuffer(re::DirectBuffer *this)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)*((_QWORD *)this + 10);
  if (v2)
  {

    *((_QWORD *)this + 10) = 0;
  }
  v3 = *((_QWORD *)this + 9);
  if (v3)
  {

    *((_QWORD *)this + 9) = 0;
  }
  re::DirectResource::~DirectResource(this);
}

{
  re::DirectBuffer::~DirectBuffer(this);
  JUMPOUT(0x23B84F8E0);
}

uint64_t re::DirectBuffer::attachToDevice(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v5;
  id v6;

  v2 = re::DirectMemoryResource::bindToResource(*(_QWORD *)(a1 + 72), 3, 3);
  if ((_DWORD)v2)
  {
    if (!*(_QWORD *)re::DirectMemoryResource::runtimeResource(*(re::DirectMemoryResource **)(a1 + 72)))
    {
      v3 = *(_QWORD *)(a1 + 72);
      re::DirectMemoryResource::makeBuffer(v3);
      v6 = v5;
      re::DirectMemoryResource::setRuntimeResource(v3, &v6);
      if (v6)
      {

        v6 = 0;
      }
    }
  }
  return v2;
}

re::DirectMemoryResource *re::DirectBuffer::isAttachedToDevice(re::DirectBuffer *this)
{
  re::DirectMemoryResource *result;

  result = (re::DirectMemoryResource *)*((_QWORD *)this + 9);
  if (result)
    return (re::DirectMemoryResource *)(*(_QWORD *)re::DirectMemoryResource::runtimeResource(result) != 0);
  return result;
}

uint64_t re::DirectBuffer::payload(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;

  result = 0;
  if (a2 == 3 && !a3)
    return *(_QWORD *)(a1 + 72);
  return result;
}

uint64_t re::DirectBuffer::setPayload(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  BOOL v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = (_DWORD)a2 == 3 && a3 == 0;
  v6 = v5;
  if (v5)
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 40))(v10, a1, a2, a3);
    v11 = *(_QWORD *)(a1 + 72);
    *(_QWORD *)(a1 + 72) = *a4;
    *a4 = v11;
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 48))(v12, a1, a2, a3);
  }
  return v6;
}

uint64_t re::DirectBuffer::forEachSlot(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  re::DirectBuffer *v4;
  unint64_t v5;
  __int128 v6;

  v6 = xmmword_23A4F97B0;
  v2 = *(_QWORD *)(a2 + 24);
  if (v2)
    return (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)v2 + 48))(v2, &v6);
  v4 = (re::DirectBuffer *)std::__throw_bad_function_call[abi:nn180100]();
  return re::DirectBuffer::isValidBytesUsed(v4, v5);
}

BOOL re::DirectBuffer::isValidBytesUsed(re::DirectBuffer *this, unint64_t a2)
{
  return re::DirectBufferValidation::isValidBytesUsed(a2, (unint64_t *)this + 6);
}

BOOL re::DirectBuffer::setBytesUsed(re::DirectBuffer *this, unint64_t a2)
{
  _BOOL8 result;

  if (*((_QWORD *)this + 8) != a2)
  {
    result = re::DirectBufferValidation::isValidBytesUsed(a2, (unint64_t *)this + 6);
    if (!result)
      return result;
    *((_QWORD *)this + 8) = a2;
    re::DirectResource::didChange((uint64_t)this, 0, 0, 0);
  }
  return 1;
}

uint64_t re::DirectBuffer::read(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(a1 + 72));
  return (*(uint64_t (**)(uint64_t, id, _QWORD))(a2 + 16))(a2, v4, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 40));
}

uint64_t re::DirectBuffer::update(uint64_t a1, uint64_t a2)
{
  id v4;

  re::DirectResource::willChange(a1, 3, 0, 0, 0);
  v4 = re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(a1 + 72));
  (*(void (**)(uint64_t, id, _QWORD))(a2 + 16))(a2, v4, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 40));
  return re::DirectResource::didChange(a1, 3, 0, 0);
}

uint64_t re::DirectBuffer::replace(uint64_t a1, uint64_t a2)
{
  id v4;

  re::DirectResource::willChange(a1, 3, 0, 1, 0);
  v4 = re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(a1 + 72));
  (*(void (**)(uint64_t, id, _QWORD))(a2 + 16))(a2, v4, *(_QWORD *)(*(_QWORD *)(a1 + 72) + 40));
  return re::DirectResource::didChange(a1, 3, 0, 0);
}

id re::DirectBuffer::read@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = *(id *)(a1 + 80);
  *a2 = result;
  return result;
}

id re::DirectBuffer::replace@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  id result;

  re::DirectResource::willChange(a1, 3, 0, 1, a2);
  result = *(id *)(a1 + 80);
  *a3 = result;
  return result;
}

uint64_t re::DirectBuffer::type(re::DirectBuffer *this)
{
  return 3;
}

BOOL re::xpc_get_value(void *a1, uint64_t *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = MEMORY[0x23B84FD00]();
  v5 = MEMORY[0x24BDACFF8];
  if (v4 == MEMORY[0x24BDACFF8])
    *a2 = xpc_uint64_get_value(v3);

  return v4 == v5;
}

BOOL re::xpc_get_value(void *a1, unsigned __int8 *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  const unsigned __int8 *bytes;

  v3 = a1;
  v4 = MEMORY[0x23B84FD00]();
  v5 = MEMORY[0x24BDAD000];
  if (v4 == MEMORY[0x24BDAD000])
  {
    bytes = xpc_uuid_get_bytes(v3);
    uuid_copy(a2, bytes);
  }

  return v4 == v5;
}

{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  v3 = a1;
  xpc_dictionary_get_value(v3, "partCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (re::xpc_get_value<unsigned long>(v4, (uint64_t)a2))
  {
    xpc_dictionary_get_value(v3, "parts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (re::xpc_get_value<re::DirectResourceId>(v5, a2 + 16))
    {
      xpc_dictionary_get_value(v3, "indices");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (re::xpc_get_value<re::DirectResourceId>(v6, a2 + 33))
      {
        xpc_dictionary_get_array(v3, "vertices");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = re::xpc_array_get_values<std::optional<re::DirectResourceId>,4ul>(v7, a2 + 50);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

{
  id v3;
  const unsigned __int8 *uuid;
  void *v5;
  void *v6;
  _BOOL8 value;

  v3 = a1;
  uuid = xpc_dictionary_get_uuid(v3, "identifier");
  if (uuid)
  {
    uuid_copy(a2, uuid);
    xpc_dictionary_get_dictionary(v3, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (re::xpc_get_value(v5, (uint64_t)(a2 + 16)))
    {
      xpc_dictionary_get_dictionary(v3, "contents");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      value = re::xpc_get_value(v6, a2 + 96);

    }
    else
    {
      value = 0;
    }

  }
  else
  {
    value = 0;
  }

  return value;
}

{
  id v3;
  const unsigned __int8 *uuid;
  void *v5;
  _BOOL8 value;

  v3 = a1;
  uuid = xpc_dictionary_get_uuid(v3, "identifier");
  if (uuid)
  {
    uuid_copy(a2, uuid);
    xpc_dictionary_get_dictionary(v3, "contents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    value = re::xpc_get_value(v5, a2 + 16);

  }
  else
  {
    value = 0;
  }

  return value;
}

{
  id v3;
  const unsigned __int8 *uuid;
  void *v5;
  const unsigned __int8 *v6;
  _BOOL8 v7;

  v3 = a1;
  uuid = xpc_dictionary_get_uuid(v3, "identifier");
  if (uuid)
  {
    uuid_copy(a2, uuid);
    xpc_dictionary_get_dictionary(v3, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    re::xpc_get_value(v5, (uint64_t)(a2 + 16));
    v6 = xpc_dictionary_get_uuid(v3, "contents");
    v7 = v6 != 0;
    if (v6)
      uuid_copy(a2 + 88, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

{
  id v3;
  const unsigned __int8 *uuid;
  void *v5;
  _BOOL8 value;

  v3 = a1;
  uuid = xpc_dictionary_get_uuid(v3, "identifier");
  if (uuid)
  {
    uuid_copy(a2, uuid);
    xpc_dictionary_get_dictionary(v3, "contents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    value = re::xpc_get_value(v5, (uint64_t)(a2 + 16));

  }
  else
  {
    value = 0;
  }

  return value;
}

id re::xpc_dictionary_create(uint64_t a1, uint64_t a2)
{
  xpc_object_t empty;
  uint64_t v5;
  const char *v6;
  void *v7;

  empty = xpc_dictionary_create_empty();
  if (a2)
  {
    v5 = a1 + 16 * a2;
    do
    {
      v6 = *(const char **)a1;
      v7 = *(void **)(a1 + 8);
      a1 += 16;
      xpc_dictionary_set_value(empty, v6, v7);
    }
    while (a1 != v5);
  }
  return empty;
}

id re::xpc_object_create(uint64_t *a1)
{
  xpc_object_t empty;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "semantic", *(int *)a1);
  xpc_dictionary_set_uint64(empty, "format", a1[1]);
  xpc_dictionary_set_uint64(empty, "layoutIndex", a1[2]);
  xpc_dictionary_set_uint64(empty, "offset", a1[3]);
  return empty;
}

{
  xpc_object_t empty;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "bufferIndex", *a1);
  xpc_dictionary_set_uint64(empty, "bufferOffset", a1[1]);
  xpc_dictionary_set_uint64(empty, "bufferStride", a1[2]);
  xpc_dictionary_set_uint64(empty, "stepRate", a1[3]);
  xpc_dictionary_set_uint64(empty, "stepFunction", a1[4]);
  return empty;
}

{
  xpc_object_t empty;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "capacity", *a1);
  xpc_dictionary_set_uint64(empty, "sizeMultiple", a1[1]);
  return empty;
}

uint64_t re::xpc_get_value(void *a1, uint64_t a2)
{
  id v3;
  uint64_t uint64;

  v3 = a1;
  *(_DWORD *)a2 = xpc_dictionary_get_uint64(v3, "semantic");
  *(_QWORD *)(a2 + 8) = xpc_dictionary_get_uint64(v3, "format");
  *(_QWORD *)(a2 + 16) = xpc_dictionary_get_uint64(v3, "layoutIndex");
  uint64 = xpc_dictionary_get_uint64(v3, "offset");

  *(_QWORD *)(a2 + 24) = uint64;
  return 1;
}

{
  id v3;
  int uint64;

  v3 = a1;
  *(_QWORD *)a2 = xpc_dictionary_get_uint64(v3, "width");
  *(_QWORD *)(a2 + 8) = xpc_dictionary_get_uint64(v3, "height");
  *(_QWORD *)(a2 + 16) = xpc_dictionary_get_uint64(v3, "depth");
  *(_QWORD *)(a2 + 24) = xpc_dictionary_get_uint64(v3, "mipmapLevelCount");
  *(_QWORD *)(a2 + 32) = xpc_dictionary_get_uint64(v3, "arrayLength");
  *(_QWORD *)(a2 + 40) = xpc_dictionary_get_uint64(v3, "pixelFormat");
  *(_QWORD *)(a2 + 48) = xpc_dictionary_get_uint64(v3, "textureType");
  *(_QWORD *)(a2 + 56) = xpc_dictionary_get_uint64(v3, "textureUsage");
  uint64 = xpc_dictionary_get_uint64(v3, "swizzle");

  *(_DWORD *)(a2 + 64) = uint64;
  return 1;
}

uint64_t re::xpc_get_value(void *a1, uint64_t *a2)
{
  id v3;
  uint64_t uint64;

  v3 = a1;
  *a2 = xpc_dictionary_get_uint64(v3, "bufferIndex");
  a2[1] = xpc_dictionary_get_uint64(v3, "bufferOffset");
  a2[2] = xpc_dictionary_get_uint64(v3, "bufferStride");
  a2[3] = xpc_dictionary_get_uint64(v3, "stepRate");
  uint64 = xpc_dictionary_get_uint64(v3, "stepFunction");

  a2[4] = uint64;
  return 1;
}

{
  id v3;
  uint64_t uint64;

  v3 = a1;
  *a2 = xpc_dictionary_get_uint64(v3, "capacity");
  uint64 = xpc_dictionary_get_uint64(v3, "sizeMultiple");

  a2[1] = uint64;
  return 1;
}

{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v16;

  v3 = a1;
  re::make::shared::object<re::DirectResourceCommands>(&v16);
  v4 = *a2;
  *a2 = v16;
  v16 = v4;
  if (v4)

  *(_QWORD *)(*a2 + 16) = xpc_dictionary_get_uint64(v3, "identifier");
  xpc_dictionary_get_value(v3, "userPayload");
  v16 = objc_claimAutoreleasedReturnValue();
  re::XPCObject::operator=((void **)(*a2 + 24), (void **)&v16);
  re::XPCObject::~XPCObject((void **)&v16);
  xpc_dictionary_get_value(v3, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && !re::xpc_get_value(v5, (void **)(*a2 + 32)))
    goto LABEL_16;

  xpc_dictionary_get_dictionary(v3, "meshes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  if (v7)
  {
    if (!re::xpc_get_value<re::CreateDirectMesh,re::UpdateDirectMesh>(v7, *a2 + 40))
      goto LABEL_16;
  }

  xpc_dictionary_get_dictionary(v3, "textures");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v8)
  {
    if (!re::xpc_get_value<re::CreateDirectTexture,re::UpdateDirectTexture>(v8, (void **)(*a2 + 112)))
      goto LABEL_16;
  }

  xpc_dictionary_get_dictionary(v3, "buffers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v9 && !re::xpc_get_value<re::CreateDirectBuffer,re::UpdateDirectBuffer>(v9, (void **)(*a2 + 184)))
  {
LABEL_16:
    LOBYTE(v14) = 0;
  }
  else
  {

    xpc_dictionary_get_dictionary(v3, "payloads");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v10)
    {
      xpc_dictionary_get_array(v10, "create");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11 && !re::xpc_array_get_values<re::CreateDirectPayload>(v11, (char **)(*a2 + 256)))
      {
        LOBYTE(v14) = 0;
      }
      else
      {

        xpc_dictionary_get_array(v6, "destroy");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v13;
        if (v13)
          v14 = re::xpc_array_get_values<re::DestroyResource>(v13, (void **)(*a2 + 280)) << 31 >> 31;
        else
          LOBYTE(v14) = 1;
      }

    }
    else
    {
      LOBYTE(v14) = 1;
    }
  }

  return v14 & 1;
}

BOOL re::xpc_get_value(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v3 = a1;
  *(_QWORD *)a2 = xpc_dictionary_get_uint64(v3, "indexCapacity");
  *(_QWORD *)(a2 + 8) = xpc_dictionary_get_uint64(v3, "indexType");
  *(_QWORD *)(a2 + 16) = xpc_dictionary_get_uint64(v3, "vertexBufferCount");
  *(_QWORD *)(a2 + 24) = xpc_dictionary_get_uint64(v3, "vertexCapacity");
  xpc_dictionary_get_array(v3, "vertexAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = !re::xpc_array_get_values<re::DirectMeshVertexAttribute>(v4, (void **)(a2 + 32));
  else
    v6 = 1;

  xpc_dictionary_get_array(v3, "vertexLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = 0;
  if (v7 && !v6)
    v9 = re::xpc_array_get_values<re::DirectMeshVertexLayout>(v7, (void **)(a2 + 56));

  return v9;
}

{
  id v3;
  const unsigned __int8 *uuid;
  void *v5;
  _BOOL8 value;

  v3 = a1;
  uuid = xpc_dictionary_get_uuid(v3, "identifier");
  if (uuid)
  {
    uuid_copy((unsigned __int8 *)a2, uuid);
    xpc_dictionary_get_dictionary(v3, "contents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    value = re::xpc_get_value(v5, (re::DirectMemoryResource **)(a2 + 16));

  }
  else
  {
    value = 0;
  }

  return value;
}

{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  xpc_dictionary_get_value(v3, "bytesUsed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (re::xpc_get_value<unsigned long>(v4, a2))
  {
    xpc_dictionary_get_value(v3, "contents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = re::xpc_get_value<re::DirectResourceId>(v5, (unsigned __int8 *)(a2 + 16));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

{
  id v3;
  const unsigned __int8 *uuid;
  void *v5;
  void *v6;
  _BOOL8 value;

  v3 = a1;
  uuid = xpc_dictionary_get_uuid(v3, "identifier");
  if (uuid)
  {
    uuid_copy((unsigned __int8 *)a2, uuid);
    xpc_dictionary_get_dictionary(v3, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    re::xpc_get_value(v5, (uint64_t *)(a2 + 16));
    xpc_dictionary_get_dictionary(v3, "contents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    value = re::xpc_get_value(v6, a2 + 32);

  }
  else
  {
    value = 0;
  }

  return value;
}

BOOL re::xpc_array_get_values<re::DirectMeshVertexAttribute>(void *a1, void **a2)
{
  id v3;
  size_t count;
  _BOOL8 v5;
  _QWORD applier[5];

  v3 = a1;
  count = xpc_array_get_count(v3);
  std::vector<re::DirectMeshVertexAttribute>::reserve(a2, count);
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_25DirectMeshVertexAttributeEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  v5 = xpc_array_apply(v3, applier);

  return v5;
}

BOOL re::xpc_array_get_values<re::DirectMeshVertexLayout>(void *a1, void **a2)
{
  id v3;
  size_t count;
  _BOOL8 v5;
  _QWORD applier[5];

  v3 = a1;
  count = xpc_array_get_count(v3);
  std::vector<re::DirectMeshVertexLayout>::reserve(a2, count);
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_22DirectMeshVertexLayoutEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  v5 = xpc_array_apply(v3, applier);

  return v5;
}

id re::xpc_object_create(uint64_t a1)
{
  xpc_object_t empty;
  void *v3;
  void *v4;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "indexCapacity", *(_QWORD *)a1);
  xpc_dictionary_set_uint64(empty, "indexType", *(_QWORD *)(a1 + 8));
  xpc_dictionary_set_uint64(empty, "vertexBufferCount", *(_QWORD *)(a1 + 16));
  xpc_dictionary_set_uint64(empty, "vertexCapacity", *(_QWORD *)(a1 + 24));
  re::xpc_array_create_with<re::DirectMeshVertexAttribute>((uint64_t **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_value(empty, "vertexAttributes", v3);

  re::xpc_array_create_with<re::DirectMeshVertexLayout>((uint64_t **)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_value(empty, "vertexLayouts", v4);

  return empty;
}

{
  xpc_object_t empty;

  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "width", *(_QWORD *)a1);
  xpc_dictionary_set_uint64(empty, "height", *(_QWORD *)(a1 + 8));
  xpc_dictionary_set_uint64(empty, "depth", *(_QWORD *)(a1 + 16));
  xpc_dictionary_set_uint64(empty, "mipmapLevelCount", *(_QWORD *)(a1 + 24));
  xpc_dictionary_set_uint64(empty, "arrayLength", *(_QWORD *)(a1 + 32));
  xpc_dictionary_set_uint64(empty, "pixelFormat", *(_QWORD *)(a1 + 40));
  xpc_dictionary_set_uint64(empty, "textureType", *(_QWORD *)(a1 + 48));
  xpc_dictionary_set_uint64(empty, "textureUsage", *(_QWORD *)(a1 + 56));
  xpc_dictionary_set_uint64(empty, "swizzle", *(unsigned int *)(a1 + 64));
  return empty;
}

{
  xpc_object_t v2;
  const re::DirectMemoryResource *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v2 = xpc_uuid_create((const unsigned __int8 *)a1);
  v7[0] = "identifier";
  v7[1] = v2;
  re::xpc_object_create(*(re **)(a1 + 16), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = "contents";
  v7[3] = v4;
  re::xpc_dictionary_create((uint64_t)v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[9];

  v8[8] = *MEMORY[0x24BDAC8D0];
  re::xpc_object_create<unsigned long>(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = "partCount";
  v8[1] = v2;
  re::xpc_object_create<re::DirectResourceId>(a1 + 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = "parts";
  v8[3] = v3;
  re::xpc_object_create<re::DirectResourceId>(a1 + 33);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = "indices";
  v8[5] = v4;
  re::xpc_array_create_with<std::optional<re::DirectResourceId>,4ul>(a1 + 50);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[6] = "vertices";
  v8[7] = v5;
  re::xpc_dictionary_create((uint64_t)v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  re::xpc_object_create<unsigned long>(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = "bytesUsed";
  v6[1] = v2;
  re::xpc_object_create<re::DirectResourceId>(a1 + 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = "contents";
  v6[3] = v3;
  re::xpc_dictionary_create((uint64_t)v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

{
  xpc_object_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  v2 = xpc_uuid_create((const unsigned __int8 *)a1);
  v7[0] = "identifier";
  v7[1] = v2;
  re::xpc_object_create((uint64_t *)(a1 + 16));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = "description";
  v7[3] = v3;
  re::xpc_object_create(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = "contents";
  v7[5] = v4;
  re::xpc_dictionary_create((uint64_t)v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id re::xpc_array_create_with<re::DirectMeshVertexAttribute>(uint64_t **a1)
{
  uint64_t *v1;
  uint64_t *v3[2];

  v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  re::xpc_array_create_with<re::DirectMeshVertexAttribute>(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

{
  xpc_object_t empty;
  uint64_t *v3;
  uint64_t *v4;
  void *v5;
  xpc_object_t v6;

  empty = xpc_array_create_empty();
  v3 = *a1;
  v4 = a1[1];
  while (v3 != v4)
  {
    re::xpc_object_create(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);

    }
    v3 += 4;
  }
  return empty;
}

id re::xpc_array_create_with<re::DirectMeshVertexLayout>(uint64_t **a1)
{
  uint64_t *v1;
  uint64_t *v3[2];

  v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  re::xpc_array_create_with<re::DirectMeshVertexLayout>(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

{
  xpc_object_t empty;
  uint64_t *v3;
  uint64_t *v4;
  void *v5;
  xpc_object_t v6;

  empty = xpc_array_create_empty();
  v3 = *a1;
  v4 = a1[1];
  while (v3 != v4)
  {
    re::xpc_object_create(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);

    }
    v3 += 5;
  }
  return empty;
}

id re::XPCObject::retain@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = a1;
  *a2 = result;
  return result;
}

void re::DirectResourceEvent::setValue(void **a1, void *a2)
{
  id v3;

  v3 = a2;
  re::XPCObject::operator=(a1, &v3);
  re::XPCObject::~XPCObject(&v3);
}

id re::DirectResourceEvent::value(id *this)
{
  return *this;
}

BOOL re::xpc_get_value(void *a1, void **a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1;
  v4 = MEMORY[0x23B84FD00]();
  v5 = MEMORY[0x24BDACFD8];
  if (v4 == MEMORY[0x24BDACFD8])
    re::DirectResourceEvent::setValue(a2, v3);

  return v4 == v5;
}

id re::xpc_object_create(re *this, const re::DirectMemoryResource *a2)
{
  xpc_object_t v3;
  void *v4;
  int v5;
  const void *v6;
  xpc_object_t XPCObject;
  const char *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v3 = xpc_uuid_create((const unsigned __int8 *)this + 16);
  v10[0] = "identifier";
  v10[1] = v3;
  re::xpc_dictionary_create((uint64_t)v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *((_DWORD *)this + 8);
  if ((v5 - 1) >= 4)
  {
    if (v5 == 6)
    {
      XPCObject = IOSurfaceCreateXPCObject(*((IOSurfaceRef *)this + 7));
      v8 = "iosurface";
    }
    else
    {
      if (v5 != 7)
        return v4;
      XPCObject = xpc_shmem_create(*(void **)(*((_QWORD *)this + 8) + 16), *(_QWORD *)(*((_QWORD *)this + 8) + 24));
      v8 = "shmem";
    }
    xpc_dictionary_set_value(v4, v8, XPCObject);

    return v4;
  }
  v6 = (const void *)re::DirectMemoryResource::bytes(this);
  xpc_dictionary_set_data(v4, "data", v6, *((_QWORD *)this + 5));
  return v4;
}

BOOL re::xpc_get_value(void *a1, re::DirectMemoryResource **a2)
{
  id v3;
  const unsigned __int8 *uuid;
  re::DirectMemoryResource *v5;
  re::DirectMemoryResource *v6;
  re::DirectMemoryResource *v7;
  const void *data;
  _BOOL8 v9;
  void *v10;
  void *v11;
  __IOSurface *v12;
  __IOSurface *v13;
  void *v14;
  size_t v15;
  uint64_t v16;
  re::DirectMemoryResource *v17;
  re::MemoryMappedRegion *v18;
  uint64_t v19;
  uint64_t v21;
  void *region;
  size_t length;
  uuid_t dst;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (MEMORY[0x23B84FD00]() != MEMORY[0x24BDACFE0])
  {
    memset(dst, 0, sizeof(dst));
    uuid = xpc_dictionary_get_uuid(v3, "identifier");
    if (!uuid)
    {
      v9 = 0;
      goto LABEL_20;
    }
    uuid_copy(dst, uuid);
    v5 = (re::DirectMemoryResource *)operator new(0x68uLL);
    v6 = re::DirectMemoryResource::DirectMemoryResource(v5, (const unsigned __int8 (*)[16])dst);
    v7 = *a2;
    *a2 = v6;
    if (v7)

    length = 0;
    data = xpc_dictionary_get_data(v3, "data", &length);
    if (data)
    {
      v9 = re::DirectMemoryResource::copyFromPrivateMemory(*a2, data, (re::MemoryMappedRegion *)length, 0);
      goto LABEL_20;
    }
    xpc_dictionary_get_value(v3, "iosurface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      v12 = IOSurfaceLookupFromXPCObject(v10);
      if (v12)
      {
        v13 = v12;
        v9 = re::DirectMemoryResource::assignIOSurface(*a2, v12);
        CFRelease(v13);
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      xpc_dictionary_get_value(v3, "shmem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v14;
      if (v14)
      {
        region = 0;
        v15 = xpc_shmem_map(v14, &region);
        if (v15)
        {
          v16 = v15;
          v17 = *a2;
          v18 = (re::MemoryMappedRegion *)operator new(0x20uLL);
          re::MemoryMappedRegion::MemoryMappedRegion(v18, region, v16);
          v21 = v19;
          v9 = re::DirectMemoryResource::assignSharedMemory((uint64_t)v17, &v21);
          if (v21)
          {

            v21 = 0;
          }
          goto LABEL_19;
        }
      }
    }
    v9 = 0;
    goto LABEL_19;
  }
  if (*a2)
  {

    *a2 = 0;
  }
  v9 = 1;
LABEL_20:

  return v9;
}

BOOL re::xpc_get_value<unsigned long>(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  _BOOL8 value;

  v3 = a1;
  v4 = v3;
  if (!v3 || MEMORY[0x23B84FD00](v3) == MEMORY[0x24BDACFE0])
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 8) = 0;
    value = 1;
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_BYTE *)(a2 + 8) = 1;
    value = re::xpc_get_value(v4, (uint64_t *)a2);
  }

  return value;
}

BOOL re::xpc_get_value<re::DirectResourceId>(void *a1, unsigned __int8 *a2)
{
  id v3;
  void *v4;
  _BOOL8 value;

  v3 = a1;
  v4 = v3;
  if (!v3 || MEMORY[0x23B84FD00](v3) == MEMORY[0x24BDACFE0])
  {
    *a2 = 0;
    a2[16] = 0;
    value = 1;
  }
  else
  {
    if (a2[16])
      a2[16] = 0;
    uuid_copy(a2, UUID_NULL);
    a2[16] = 1;
    value = re::xpc_get_value(v4, a2);
  }

  return value;
}

BOOL re::xpc_array_get_values<std::optional<re::DirectResourceId>,4ul>(void *a1, unsigned __int8 *a2)
{
  id v3;
  size_t count;
  unint64_t v5;
  size_t v6;
  unsigned __int8 *v7;
  void *v8;
  BOOL v9;
  _BOOL8 v10;
  unint64_t v11;
  unsigned __int8 *v12;
  unint64_t v13;
  xpc_object_t v14;

  v3 = a1;
  count = xpc_array_get_count(v3);
  if (count >= 4)
    v5 = 4;
  else
    v5 = count;
  if (v5)
  {
    v6 = 0;
    v7 = a2;
    do
    {
      xpc_array_get_value(v3, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = re::xpc_get_value<re::DirectResourceId>(v8, v7);

      if (!v9)
      {
        v10 = 0;
        goto LABEL_15;
      }
      ++v6;
      v7 += 17;
    }
    while (v5 != v6);
    if (v5 <= 3)
      goto LABEL_10;
    v10 = 1;
  }
  else
  {
LABEL_10:
    v11 = v5 - 3;
    v12 = &a2[17 * v5];
    do
    {
      v13 = v11;
      v14 = xpc_null_create();
      v10 = re::xpc_get_value<re::DirectResourceId>(v14, v12);

      if (!v10)
        break;
      v11 = v13 + 1;
      v12 += 17;
    }
    while (v13);
  }
LABEL_15:

  return v10;
}

id re::xpc_object_create<unsigned long>(uint64_t a1)
{
  xpc_object_t v1;

  if (*(_BYTE *)(a1 + 8))
    v1 = xpc_uint64_create(*(_QWORD *)a1);
  else
    v1 = 0;
  return v1;
}

id re::xpc_object_create<re::DirectResourceId>(uint64_t a1)
{
  xpc_object_t v1;

  if (*(_BYTE *)(a1 + 16))
    v1 = xpc_uuid_create((const unsigned __int8 *)a1);
  else
    v1 = 0;
  return v1;
}

id re::xpc_array_create_with<std::optional<re::DirectResourceId>,4ul>(uint64_t a1)
{
  uint64_t v2[2];

  v2[0] = a1;
  v2[1] = a1 + 68;
  re::xpc_array_create_with<std::optional<re::DirectResourceId> const>(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id re::xpc_object_create(const unsigned __int8 *a1)
{
  xpc_object_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  v2 = xpc_uuid_create(a1);
  v7[0] = "identifier";
  v7[1] = v2;
  re::xpc_object_create((uint64_t)(a1 + 16));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = "description";
  v7[3] = v3;
  re::xpc_object_create((uint64_t)(a1 + 96));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = "contents";
  v7[5] = v4;
  re::xpc_dictionary_create((uint64_t)v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

{
  xpc_object_t v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = xpc_uuid_create(a1);
  v6[0] = "identifier";
  v6[1] = v2;
  re::xpc_object_create((uint64_t)(a1 + 16));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = "contents";
  v6[3] = v3;
  re::xpc_dictionary_create((uint64_t)v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  v2 = xpc_uuid_create(a1);
  v7[0] = "identifier";
  v7[1] = v2;
  re::xpc_object_create((uint64_t)(a1 + 16));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = "description";
  v7[3] = v3;
  v4 = xpc_uuid_create(a1 + 88);
  v7[4] = "contents";
  v7[5] = v4;
  re::xpc_dictionary_create((uint64_t)v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

{
  xpc_object_t v2;
  xpc_object_t v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = xpc_uuid_create(a1);
  v6[0] = "identifier";
  v6[1] = v2;
  v3 = xpc_uuid_create(a1 + 16);
  v6[2] = "contents";
  v6[3] = v3;
  re::xpc_dictionary_create((uint64_t)v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

{
  xpc_object_t v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = xpc_uuid_create(a1);
  v6[0] = "identifier";
  v6[1] = v2;
  re::xpc_object_create((uint64_t)(a1 + 16));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = "contents";
  v6[3] = v3;
  re::xpc_dictionary_create((uint64_t)v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t re::xpc_get_value(void *a1, unsigned __int8 *a2)
{
  id v3;
  const unsigned __int8 *uuid;
  const unsigned __int8 *v5;
  uint64_t v6;

  v3 = a1;
  uuid = xpc_dictionary_get_uuid(v3, "identifier");
  if (uuid && (uuid_copy(a2, uuid), (v5 = xpc_dictionary_get_uuid(v3, "contents")) != 0))
  {
    uuid_copy(a2 + 16, v5);
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t re::xpc_get_value<re::CreateDirectMesh,re::UpdateDirectMesh>(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a1;
  xpc_dictionary_get_array(v3, "create");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !re::xpc_array_get_values<re::CreateDirectMesh>(v4, (uint64_t *)a2))
    goto LABEL_8;

  xpc_dictionary_get_array(v3, "update");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  if (v6)
  {
    if (!re::xpc_array_get_values<re::UpdateDirectMesh>(v6, (void **)(a2 + 24)))
      goto LABEL_8;
  }

  xpc_dictionary_get_array(v3, "destroy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v7 && !re::xpc_array_get_values<re::DestroyResource>(v7, (void **)(a2 + 48)))
LABEL_8:
    v8 = 0;
  else
    v8 = 1;

  return v8;
}

uint64_t re::xpc_get_value<re::CreateDirectTexture,re::UpdateDirectTexture>(void *a1, void **a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a1;
  xpc_dictionary_get_array(v3, "create");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !re::xpc_array_get_values<re::CreateDirectTexture>(v4, a2))
    goto LABEL_8;

  xpc_dictionary_get_array(v3, "update");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  if (v6)
  {
    if (!re::xpc_array_get_values<re::UpdateDirectTexture>(v6, a2 + 3))
      goto LABEL_8;
  }

  xpc_dictionary_get_array(v3, "destroy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v7 && !re::xpc_array_get_values<re::DestroyResource>(v7, a2 + 6))
LABEL_8:
    v8 = 0;
  else
    v8 = 1;

  return v8;
}

uint64_t re::xpc_get_value<re::CreateDirectBuffer,re::UpdateDirectBuffer>(void *a1, void **a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a1;
  xpc_dictionary_get_array(v3, "create");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !re::xpc_array_get_values<re::CreateDirectBuffer>(v4, a2))
    goto LABEL_8;

  xpc_dictionary_get_array(v3, "update");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  if (v6)
  {
    if (!re::xpc_array_get_values<re::UpdateDirectBuffer>(v6, a2 + 3))
      goto LABEL_8;
  }

  xpc_dictionary_get_array(v3, "destroy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v7 && !re::xpc_array_get_values<re::DestroyResource>(v7, a2 + 6))
LABEL_8:
    v8 = 0;
  else
    v8 = 1;

  return v8;
}

BOOL re::xpc_array_get_values<re::CreateDirectPayload>(void *a1, char **a2)
{
  id v3;
  size_t count;
  _BOOL8 v5;
  _QWORD applier[5];

  v3 = a1;
  count = xpc_array_get_count(v3);
  std::vector<re::CreateDirectPayload>::reserve(a2, count);
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_19CreateDirectPayloadEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  v5 = xpc_array_apply(v3, applier);

  return v5;
}

BOOL re::xpc_array_get_values<re::DestroyResource>(void *a1, void **a2)
{
  id v3;
  size_t count;
  _BOOL8 v5;
  _QWORD applier[5];

  v3 = a1;
  count = xpc_array_get_count(v3);
  std::vector<re::DestroyResource>::reserve(a2, count);
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_15DestroyResourceEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  v5 = xpc_array_apply(v3, applier);

  return v5;
}

id re::xpc_object_create(re *this, const re::DirectResourceCommands *a2)
{
  xpc_object_t empty;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "identifier", *((_QWORD *)this + 2));
  v4 = (void *)*((_QWORD *)this + 3);
  if (v4)
    xpc_dictionary_set_value(empty, "userPayload", v4);
  if (*((_QWORD *)this + 4))
  {
    re::DirectResourceEvent::value((id *)this + 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(empty, "event", v5);

  }
  if (*((_QWORD *)this + 5) != *((_QWORD *)this + 6)
    || *((_QWORD *)this + 8) != *((_QWORD *)this + 9)
    || *((_QWORD *)this + 11) != *((_QWORD *)this + 12))
  {
    re::xpc_object_create<re::CreateDirectMesh,re::UpdateDirectMesh>((const unsigned __int8 **)this + 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(empty, "meshes", v6);

  }
  if (*((_QWORD *)this + 14) != *((_QWORD *)this + 15)
    || *((_QWORD *)this + 17) != *((_QWORD *)this + 18)
    || *((_QWORD *)this + 20) != *((_QWORD *)this + 21))
  {
    re::xpc_object_create<re::CreateDirectTexture,re::UpdateDirectTexture>((const unsigned __int8 **)this + 14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(empty, "textures", v7);

  }
  if (*((_QWORD *)this + 23) != *((_QWORD *)this + 24)
    || *((_QWORD *)this + 26) != *((_QWORD *)this + 27)
    || *((_QWORD *)this + 29) != *((_QWORD *)this + 30))
  {
    re::xpc_object_create<re::CreateDirectBuffer,re::UpdateDirectBuffer>((uint64_t)this + 184);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(empty, "buffers", v8);

  }
  if (*((_QWORD *)this + 32) != *((_QWORD *)this + 33) || *((_QWORD *)this + 35) != *((_QWORD *)this + 36))
  {
    re::xpc_array_create_unless_empty<re::CreateDirectPayload>((uint64_t *)this + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = "create";
    v13[1] = v9;
    re::xpc_array_create_unless_empty<re::DestroyResource>((const unsigned __int8 **)this + 35);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = "destroy";
    v13[3] = v10;
    re::xpc_dictionary_create((uint64_t)v13, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_value(empty, "payloads", v11);

  }
  return empty;
}

id re::xpc_object_create<re::CreateDirectMesh,re::UpdateDirectMesh>(const unsigned __int8 **a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  re::xpc_array_create_unless_empty<re::CreateDirectMesh>(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = "create";
  v7[1] = v2;
  re::xpc_array_create_unless_empty<re::UpdateDirectMesh>(a1 + 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = "update";
  v7[3] = v3;
  re::xpc_array_create_unless_empty<re::DestroyResource>(a1 + 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = "destroy";
  v7[5] = v4;
  re::xpc_dictionary_create((uint64_t)v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id re::xpc_object_create<re::CreateDirectTexture,re::UpdateDirectTexture>(const unsigned __int8 **a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  re::xpc_array_create_unless_empty<re::CreateDirectTexture>(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = "create";
  v7[1] = v2;
  re::xpc_array_create_unless_empty<re::UpdateDirectTexture>(a1 + 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = "update";
  v7[3] = v3;
  re::xpc_array_create_unless_empty<re::DestroyResource>(a1 + 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = "destroy";
  v7[5] = v4;
  re::xpc_dictionary_create((uint64_t)v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id re::xpc_object_create<re::CreateDirectBuffer,re::UpdateDirectBuffer>(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[7];

  v7[6] = *MEMORY[0x24BDAC8D0];
  re::xpc_array_create_unless_empty<re::CreateDirectBuffer>((uint64_t *)a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = "create";
  v7[1] = v2;
  re::xpc_array_create_unless_empty<re::UpdateDirectBuffer>((const unsigned __int8 **)(a1 + 24));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = "update";
  v7[3] = v3;
  re::xpc_array_create_unless_empty<re::DestroyResource>((const unsigned __int8 **)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = "destroy";
  v7[5] = v4;
  re::xpc_dictionary_create((uint64_t)v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id re::xpc_array_create_unless_empty<re::CreateDirectPayload>(uint64_t *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v4[2];

  v1 = a1[1];
  if (*a1 == v1)
  {
    v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    re::xpc_array_create_with<re::CreateDirectPayload>(v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id re::xpc_array_create_unless_empty<re::DestroyResource>(const unsigned __int8 **a1)
{
  const unsigned __int8 *v1;
  void *v2;
  const unsigned __int8 *v4[2];

  v1 = a1[1];
  if (*a1 == v1)
  {
    v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    re::xpc_array_create_with<re::DestroyResource>(v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void std::vector<re::DirectMeshVertexAttribute>::reserve(void **a1, unint64_t a2)
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
  __int128 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 5)
  {
    if (a2 >> 59)
      abort();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFE0];
    v9 = &v6[32 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 32;
        v10 -= 32;
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

uint64_t ___ZN2re20xpc_array_get_valuesINS_25DirectMeshVertexAttributeEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  __int128 v17;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD **)(v5 + 8);
  v7 = *(_QWORD *)(v5 + 16);
  if ((unint64_t)v6 >= v7)
  {
    v9 = *(_QWORD **)v5;
    v10 = ((uint64_t)v6 - *(_QWORD *)v5) >> 5;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 59)
      abort();
    v12 = v7 - (_QWORD)v9;
    if (v12 >> 4 > v11)
      v11 = v12 >> 4;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFE0)
      v13 = 0x7FFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>(v5 + 16, v13);
      v9 = *(_QWORD **)v5;
      v6 = *(_QWORD **)(v5 + 8);
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[32 * v10];
    *(_DWORD *)v15 = -1;
    *((_QWORD *)v15 + 2) = 0;
    *((_QWORD *)v15 + 3) = 0;
    v16 = &v14[32 * v13];
    v8 = v15 + 32;
    *((_QWORD *)v15 + 1) = 0;
    if (v6 != v9)
    {
      do
      {
        v17 = *((_OWORD *)v6 - 1);
        *((_OWORD *)v15 - 2) = *((_OWORD *)v6 - 2);
        *((_OWORD *)v15 - 1) = v17;
        v15 -= 32;
        v6 -= 4;
      }
      while (v6 != v9);
      v9 = *(_QWORD **)v5;
    }
    *(_QWORD *)v5 = v15;
    *(_QWORD *)(v5 + 8) = v8;
    *(_QWORD *)(v5 + 16) = v16;
    if (v9)
      operator delete(v9);
  }
  else
  {
    *(_DWORD *)v6 = -1;
    v8 = (char *)(v6 + 4);
    v6[2] = 0;
    v6[3] = 0;
    v6[1] = 0;
  }
  *(_QWORD *)(v5 + 8) = v8;
  re::xpc_get_value(v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) - 32);

  return 1;
}

void std::vector<re::DirectMeshVertexLayout>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xCCCCCCCCCCCCCCCDLL * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x666666666666667)
      abort();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 40;
    v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DirectMeshVertexLayout>>(v3, a2);
    v7 = &v6[40 * v5];
    v9 = &v6[40 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 40);
        v14 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v14;
        *(_OWORD *)(v12 - 40) = v13;
        v12 -= 40;
        v10 -= 40;
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

uint64_t ___ZN2re20xpc_array_get_valuesINS_22DirectMeshVertexLayoutEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  char *v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  __int128 v17;
  __int128 v18;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD **)(v5 + 8);
  v7 = *(_QWORD *)(v5 + 16);
  if ((unint64_t)v6 >= v7)
  {
    v9 = *(_QWORD **)v5;
    v10 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v6 - *(_QWORD *)v5) >> 3);
    v11 = v10 + 1;
    if (v10 + 1 > 0x666666666666666)
      abort();
    v12 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v7 - (_QWORD)v9) >> 3);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0x333333333333333)
      v13 = 0x666666666666666;
    else
      v13 = v11;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DirectMeshVertexLayout>>(v5 + 16, v13);
      v9 = *(_QWORD **)v5;
      v6 = *(_QWORD **)(v5 + 8);
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[40 * v10];
    v16 = &v14[40 * v13];
    *(_QWORD *)v15 = 0;
    *((_QWORD *)v15 + 1) = 0;
    *((_QWORD *)v15 + 2) = 0;
    *(int64x2_t *)(v15 + 24) = vdupq_n_s64(1uLL);
    v8 = v15 + 40;
    if (v6 != v9)
    {
      do
      {
        v17 = *(_OWORD *)(v6 - 5);
        v18 = *(_OWORD *)(v6 - 3);
        *((_QWORD *)v15 - 1) = *(v6 - 1);
        *(_OWORD *)(v15 - 24) = v18;
        *(_OWORD *)(v15 - 40) = v17;
        v15 -= 40;
        v6 -= 5;
      }
      while (v6 != v9);
      v9 = *(_QWORD **)v5;
    }
    *(_QWORD *)v5 = v15;
    *(_QWORD *)(v5 + 8) = v8;
    *(_QWORD *)(v5 + 16) = v16;
    if (v9)
      operator delete(v9);
  }
  else
  {
    *v6 = 0;
    v6[1] = 0;
    v6[2] = 0;
    *(int64x2_t *)(v6 + 3) = vdupq_n_s64(1uLL);
    v8 = (char *)(v6 + 5);
  }
  *(_QWORD *)(v5 + 8) = v8;
  re::xpc_get_value(v4, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) - 40));

  return 1;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::DirectMeshVertexLayout>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(40 * a2);
}

id re::xpc_array_create_with<std::optional<re::DirectResourceId> const>(uint64_t *a1)
{
  xpc_object_t empty;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  xpc_object_t v6;

  empty = xpc_array_create_empty();
  v3 = *a1;
  v4 = a1[1];
  while (v3 != v4)
  {
    re::xpc_object_create<re::DirectResourceId>(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);

    }
    v3 += 17;
  }
  return empty;
}

double re::make::shared::object<re::DirectResourceCommands>@<D0>(_QWORD *a1@<X8>)
{
  _OWORD *v2;
  _QWORD *v3;
  double result;

  v2 = operator new(0x130uLL);
  *v2 = 0u;
  v2[1] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  v2[5] = 0u;
  v2[6] = 0u;
  v2[7] = 0u;
  v2[8] = 0u;
  v2[9] = 0u;
  v2[10] = 0u;
  v2[11] = 0u;
  v2[12] = 0u;
  v2[13] = 0u;
  v2[14] = 0u;
  v2[15] = 0u;
  v2[16] = 0u;
  v2[17] = 0u;
  v2[18] = 0u;
  v2[2] = 0u;
  ArcSharedObject::ArcSharedObject((ArcSharedObject *)v2, 0);
  *v3 = &off_250B64EE8;
  v3[2] = 0;
  v3[3] = 0;
  re::DirectResourceEvent::DirectResourceEvent((_QWORD *)v2 + 4);
  *((_QWORD *)v2 + 37) = 0;
  result = 0.0;
  *(_OWORD *)((char *)v2 + 248) = 0u;
  *(_OWORD *)((char *)v2 + 232) = 0u;
  *(_OWORD *)((char *)v2 + 216) = 0u;
  *(_OWORD *)((char *)v2 + 200) = 0u;
  *(_OWORD *)((char *)v2 + 184) = 0u;
  *(_OWORD *)((char *)v2 + 168) = 0u;
  *(_OWORD *)((char *)v2 + 152) = 0u;
  *(_OWORD *)((char *)v2 + 136) = 0u;
  *(_OWORD *)((char *)v2 + 120) = 0u;
  *(_OWORD *)((char *)v2 + 104) = 0u;
  *(_OWORD *)((char *)v2 + 88) = 0u;
  *(_OWORD *)((char *)v2 + 72) = 0u;
  *(_OWORD *)((char *)v2 + 56) = 0u;
  *(_OWORD *)((char *)v2 + 40) = 0u;
  *(_OWORD *)((char *)v2 + 264) = 0u;
  *(_OWORD *)((char *)v2 + 280) = 0u;
  *a1 = v2;
  return result;
}

void re::DirectResourceCommands::~DirectResourceCommands(re::DirectResourceCommands *this)
{
  re::DirectResourceCommands::~DirectResourceCommands(this);
  JUMPOUT(0x23B84F8E0);
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;

  *(_QWORD *)this = &off_250B64EE8;
  v2 = (void *)*((_QWORD *)this + 35);
  if (v2)
  {
    *((_QWORD *)this + 36) = v2;
    operator delete(v2);
  }
  v11 = (void **)((char *)this + 256);
  std::vector<re::CreateDirectPayload>::__destroy_vector::operator()[abi:nn180100](&v11);
  v3 = (void *)*((_QWORD *)this + 29);
  if (v3)
  {
    *((_QWORD *)this + 30) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 26);
  if (v4)
  {
    *((_QWORD *)this + 27) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 23);
  if (v5)
  {
    *((_QWORD *)this + 24) = v5;
    operator delete(v5);
  }
  v6 = (void *)*((_QWORD *)this + 20);
  if (v6)
  {
    *((_QWORD *)this + 21) = v6;
    operator delete(v6);
  }
  v7 = (void *)*((_QWORD *)this + 17);
  if (v7)
  {
    *((_QWORD *)this + 18) = v7;
    operator delete(v7);
  }
  v8 = (void *)*((_QWORD *)this + 14);
  if (v8)
  {
    *((_QWORD *)this + 15) = v8;
    operator delete(v8);
  }
  v9 = (void *)*((_QWORD *)this + 11);
  if (v9)
  {
    *((_QWORD *)this + 12) = v9;
    operator delete(v9);
  }
  v10 = (void *)*((_QWORD *)this + 8);
  if (v10)
  {
    *((_QWORD *)this + 9) = v10;
    operator delete(v10);
  }
  v11 = (void **)((char *)this + 40);
  std::vector<re::CreateDirectMesh>::__destroy_vector::operator()[abi:nn180100](&v11);
  re::XPCObject::~XPCObject((void **)this + 4);
  re::XPCObject::~XPCObject((void **)this + 3);
  ArcSharedObject::~ArcSharedObject(this);
}

void std::vector<re::CreateDirectPayload>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<re::CreateDirectPayload>::__clear[abi:nn180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<re::CreateDirectPayload>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    v4 = *(_QWORD *)(i - 8);
    if (v4)
    {

      *(_QWORD *)(i - 8) = 0;
    }
  }
  a1[1] = v2;
}

void std::vector<re::CreateDirectMesh>::__destroy_vector::operator()[abi:nn180100](void ***a1)
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
        v4 -= 27;
        std::allocator<re::CreateDirectMesh>::destroy[abi:nn180100]((uint64_t)(v1 + 2), v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<re::CreateDirectMesh>::destroy[abi:nn180100](uint64_t a1, _QWORD *a2)
{
  void *v3;
  void *v4;

  v3 = (void *)a2[9];
  if (v3)
  {
    a2[10] = v3;
    operator delete(v3);
  }
  v4 = (void *)a2[6];
  if (v4)
  {
    a2[7] = v4;
    operator delete(v4);
  }
}

BOOL re::xpc_array_get_values<re::CreateDirectMesh>(void *a1, uint64_t *a2)
{
  id v3;
  size_t count;
  _BOOL8 v5;
  _QWORD applier[5];

  v3 = a1;
  count = xpc_array_get_count(v3);
  std::vector<re::CreateDirectMesh>::reserve(a2, count);
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_16CreateDirectMeshEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  v5 = xpc_array_apply(v3, applier);

  return v5;
}

BOOL re::xpc_array_get_values<re::UpdateDirectMesh>(void *a1, void **a2)
{
  id v3;
  size_t count;
  _BOOL8 v5;
  _QWORD applier[5];

  v3 = a1;
  count = xpc_array_get_count(v3);
  std::vector<re::UpdateDirectMesh>::reserve(a2, count);
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_16UpdateDirectMeshEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  v5 = xpc_array_apply(v3, applier);

  return v5;
}

void **std::vector<re::CreateDirectMesh>::reserve(uint64_t *a1, unint64_t a2)
{
  void **result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7[5];

  v4 = a1[2];
  result = (void **)(a1 + 2);
  if (0x84BDA12F684BDA13 * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0x12F684BDA12F685)
      abort();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectMesh>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    v7[2] = (char *)v7[0] + v5;
    v7[3] = (char *)v7[0] + 216 * v6;
    std::vector<re::CreateDirectMesh>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<re::CreateDirectMesh>::~__split_buffer(v7);
  }
  return result;
}

BOOL ___ZN2re20xpc_array_get_valuesINS_16CreateDirectMeshEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t Direct;
  void *v17;
  _BOOL8 value;
  __int128 v20;
  __int128 v21;
  _BYTE v22[40];
  _BYTE __p[40];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(uint64_t **)(a1 + 32);
  uuid_copy((unsigned __int8 *)&v20, UUID_NULL);
  v21 = xmmword_23A4F97D0;
  *(_QWORD *)v22 = 1;
  __p[32] = 0;
  LOBYTE(v24) = 0;
  LOWORD(v25) = 0;
  BYTE1(v26) = 0;
  memset(&v22[8], 0, 32);
  memset(__p, 0, 25);
  v6 = 146;
  do
  {
    v7 = (char *)&v20 + v6;
    *v7 = 0;
    v7[16] = 0;
    v6 += 17;
  }
  while (v7 + 17 != (char *)v30 + 6);
  v8 = v5[1];
  if (v8 >= v5[2])
  {
    Direct = std::vector<re::CreateDirectMesh>::__push_back_slow_path<re::CreateDirectMesh>(v5, (uint64_t)&v20);
    v17 = *(void **)__p;
    v5[1] = Direct;
    if (v17)
    {
      *(_QWORD *)&__p[8] = v17;
      operator delete(v17);
    }
  }
  else
  {
    *(_OWORD *)v8 = v20;
    v9 = *(_OWORD *)v22;
    *(_OWORD *)(v8 + 16) = v21;
    *(_OWORD *)(v8 + 32) = v9;
    *(_QWORD *)(v8 + 56) = 0;
    *(_QWORD *)(v8 + 64) = 0;
    *(_QWORD *)(v8 + 48) = 0;
    *(_OWORD *)(v8 + 48) = *(_OWORD *)&v22[16];
    *(_QWORD *)(v8 + 64) = *(_QWORD *)&v22[32];
    *(_QWORD *)(v8 + 72) = 0;
    memset(&v22[16], 0, 24);
    *(_QWORD *)(v8 + 80) = 0;
    *(_QWORD *)(v8 + 88) = 0;
    *(_OWORD *)(v8 + 72) = *(_OWORD *)__p;
    *(_QWORD *)(v8 + 88) = *(_QWORD *)&__p[16];
    memset(__p, 0, 24);
    v10 = *(_OWORD *)&__p[24];
    v11 = v24;
    v12 = v26;
    *(_OWORD *)(v8 + 128) = v25;
    *(_OWORD *)(v8 + 144) = v12;
    *(_OWORD *)(v8 + 96) = v10;
    *(_OWORD *)(v8 + 112) = v11;
    v13 = v27;
    v14 = v28;
    v15 = v29;
    *(_QWORD *)(v8 + 208) = v30[0];
    *(_OWORD *)(v8 + 176) = v14;
    *(_OWORD *)(v8 + 192) = v15;
    *(_OWORD *)(v8 + 160) = v13;
    v5[1] = v8 + 216;
  }
  if (*(_QWORD *)&v22[16])
  {
    *(_QWORD *)&v22[24] = *(_QWORD *)&v22[16];
    operator delete(*(void **)&v22[16]);
  }
  value = re::xpc_get_value(v4, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) - 216));

  return value;
}

void std::vector<re::CreateDirectMesh>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  std::__uninitialized_allocator_move_if_noexcept[abi:nn180100]<std::allocator<re::CreateDirectMesh>,std::reverse_iterator<re::CreateDirectMesh*>,std::reverse_iterator<re::CreateDirectMesh*>,std::reverse_iterator<re::CreateDirectMesh*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectMesh>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x12F684BDA12F685)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(216 * a2);
}

__n128 std::__uninitialized_allocator_move_if_noexcept[abi:nn180100]<std::allocator<re::CreateDirectMesh>,std::reverse_iterator<re::CreateDirectMesh*>,std::reverse_iterator<re::CreateDirectMesh*>,std::reverse_iterator<re::CreateDirectMesh*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  __n128 result;
  __int128 v15;
  __int128 v16;

  if (a3 != a5)
  {
    v7 = 0;
    do
    {
      v8 = a7 + v7;
      v9 = a3 + v7;
      *(_OWORD *)(v8 - 216) = *(_OWORD *)(a3 + v7 - 216);
      v10 = *(_OWORD *)(a3 + v7 - 200);
      *(_OWORD *)(v8 - 184) = *(_OWORD *)(a3 + v7 - 184);
      *(_QWORD *)(v8 - 160) = 0;
      *(_QWORD *)(v8 - 152) = 0;
      *(_QWORD *)(v8 - 168) = 0;
      *(_OWORD *)(v8 - 200) = v10;
      *(_OWORD *)(v8 - 168) = *(_OWORD *)(a3 + v7 - 168);
      *(_QWORD *)(v8 - 152) = *(_QWORD *)(a3 + v7 - 152);
      *(_QWORD *)(v9 - 168) = 0;
      *(_QWORD *)(v9 - 160) = 0;
      *(_QWORD *)(v9 - 152) = 0;
      *(_QWORD *)(v8 - 144) = 0;
      *(_QWORD *)(v8 - 136) = 0;
      *(_QWORD *)(v8 - 128) = 0;
      *(_OWORD *)(v8 - 144) = *(_OWORD *)(a3 + v7 - 144);
      *(_QWORD *)(v8 - 128) = *(_QWORD *)(a3 + v7 - 128);
      *(_QWORD *)(v9 - 136) = 0;
      *(_QWORD *)(v9 - 128) = 0;
      *(_QWORD *)(v9 - 144) = 0;
      v11 = *(_OWORD *)(a3 + v7 - 40);
      v12 = *(_OWORD *)(a3 + v7 - 24);
      v13 = *(_QWORD *)(a3 + v7 - 8);
      *(_OWORD *)(v8 - 56) = *(_OWORD *)(a3 + v7 - 56);
      *(_QWORD *)(v8 - 8) = v13;
      *(_OWORD *)(v8 - 24) = v12;
      *(_OWORD *)(v8 - 40) = v11;
      result = *(__n128 *)(a3 + v7 - 120);
      v15 = *(_OWORD *)(a3 + v7 - 104);
      v16 = *(_OWORD *)(a3 + v7 - 88);
      *(_OWORD *)(v8 - 72) = *(_OWORD *)(a3 + v7 - 72);
      *(_OWORD *)(v8 - 88) = v16;
      *(_OWORD *)(v8 - 104) = v15;
      *(__n128 *)(v8 - 120) = result;
      v7 -= 216;
    }
    while (a3 + v7 != a5);
  }
  return result;
}

void **std::__split_buffer<re::CreateDirectMesh>::~__split_buffer(void **a1)
{
  std::__split_buffer<re::CreateDirectMesh>::clear[abi:nn180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<re::CreateDirectMesh>::clear[abi:nn180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 216;
    std::allocator<re::CreateDirectMesh>::destroy[abi:nn180100](v4, (_QWORD *)(i - 216));
  }
}

uint64_t std::vector<re::CreateDirectMesh>::__push_back_slow_path<re::CreateDirectMesh>(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *Direct;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  void *v22[5];

  v2 = *a1;
  v3 = 0x84BDA12F684BDA13 * ((a1[1] - *a1) >> 3);
  v4 = v3 + 1;
  if (v3 + 1 > 0x12F684BDA12F684)
    abort();
  v8 = a1[2];
  v7 = a1 + 2;
  v9 = 0x84BDA12F684BDA13 * ((v8 - v2) >> 3);
  if (2 * v9 > v4)
    v4 = 2 * v9;
  if (v9 >= 0x97B425ED097B42)
    v10 = 0x12F684BDA12F684;
  else
    v10 = v4;
  v22[4] = v7;
  if (v10)
    Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectMesh>>((uint64_t)v7, v10);
  else
    Direct = 0;
  v12 = &Direct[216 * v3];
  v22[0] = Direct;
  v22[1] = v12;
  v22[3] = &Direct[216 * v10];
  *(_OWORD *)v12 = *(_OWORD *)a2;
  v13 = *(_OWORD *)(a2 + 32);
  *((_OWORD *)v12 + 1) = *(_OWORD *)(a2 + 16);
  *((_OWORD *)v12 + 2) = v13;
  *((_QWORD *)v12 + 7) = 0;
  *((_QWORD *)v12 + 8) = 0;
  *((_QWORD *)v12 + 6) = 0;
  *((_OWORD *)v12 + 3) = *(_OWORD *)(a2 + 48);
  *((_QWORD *)v12 + 8) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *((_QWORD *)v12 + 9) = 0;
  *((_QWORD *)v12 + 10) = 0;
  *((_QWORD *)v12 + 11) = 0;
  *(_OWORD *)(v12 + 72) = *(_OWORD *)(a2 + 72);
  *((_QWORD *)v12 + 11) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v15 = *(_OWORD *)(a2 + 176);
  v14 = *(_OWORD *)(a2 + 192);
  v16 = *(_OWORD *)(a2 + 160);
  *((_QWORD *)v12 + 26) = *(_QWORD *)(a2 + 208);
  *((_OWORD *)v12 + 11) = v15;
  *((_OWORD *)v12 + 12) = v14;
  *((_OWORD *)v12 + 10) = v16;
  v17 = *(_OWORD *)(a2 + 96);
  v18 = *(_OWORD *)(a2 + 112);
  v19 = *(_OWORD *)(a2 + 144);
  *((_OWORD *)v12 + 8) = *(_OWORD *)(a2 + 128);
  *((_OWORD *)v12 + 9) = v19;
  *((_OWORD *)v12 + 6) = v17;
  *((_OWORD *)v12 + 7) = v18;
  v22[2] = v12 + 216;
  std::vector<re::CreateDirectMesh>::__swap_out_circular_buffer(a1, v22);
  v20 = a1[1];
  std::__split_buffer<re::CreateDirectMesh>::~__split_buffer(v22);
  return v20;
}

void std::vector<re::UpdateDirectMesh>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *updated;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0xF0F0F0F0F0F0F0F1 * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x1E1E1E1E1E1E1E2)
      abort();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 136;
    updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectMesh>>(v3, a2);
    v7 = &updated[136 * v5];
    v9 = &updated[136 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *(_OWORD *)(v12 - 136) = *(_OWORD *)(v10 - 136);
        v13 = *(_OWORD *)(v10 - 120);
        v14 = *(_OWORD *)(v10 - 104);
        v15 = *(_OWORD *)(v10 - 88);
        *(_OWORD *)(v12 - 72) = *(_OWORD *)(v10 - 72);
        *(_OWORD *)(v12 - 88) = v15;
        *(_OWORD *)(v12 - 104) = v14;
        *(_OWORD *)(v12 - 120) = v13;
        v16 = *(_OWORD *)(v10 - 56);
        v17 = *(_OWORD *)(v10 - 40);
        v18 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v18;
        *(_OWORD *)(v12 - 40) = v17;
        *(_OWORD *)(v12 - 56) = v16;
        v12 -= 136;
        v10 -= 136;
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

BOOL ___ZN2re20xpc_array_get_valuesINS_16UpdateDirectMeshEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void **v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *updated;
  char *v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char *v30;
  char *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BOOL8 value;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(void ***)(a1 + 32);
  uuid_copy((unsigned __int8 *)&v40, UUID_NULL);
  LOBYTE(v41) = 0;
  BYTE8(v41) = 0;
  LOBYTE(v42) = 0;
  LOWORD(v43) = 0;
  v6 = 66;
  BYTE1(v44) = 0;
  do
  {
    v7 = (char *)&v40 + v6;
    *v7 = 0;
    v7[16] = 0;
    v6 += 17;
  }
  while (v7 + 17 != (char *)v48 + 6);
  v8 = (char *)v5[2];
  v9 = (char *)v5[1];
  if (v9 >= v8)
  {
    v17 = 0xF0F0F0F0F0F0F0F1 * ((v9 - (_BYTE *)*v5) >> 3);
    v18 = v17 + 1;
    if (v17 + 1 > 0x1E1E1E1E1E1E1E1)
      abort();
    v19 = 0xF0F0F0F0F0F0F0F1 * ((v8 - (_BYTE *)*v5) >> 3);
    if (2 * v19 > v18)
      v18 = 2 * v19;
    if (v19 >= 0xF0F0F0F0F0F0F0)
      v20 = 0x1E1E1E1E1E1E1E1;
    else
      v20 = v18;
    if (v20)
      updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectMesh>>((uint64_t)(v5 + 2), v20);
    else
      updated = 0;
    v22 = &updated[136 * v17];
    v23 = &updated[136 * v20];
    *(_OWORD *)v22 = v40;
    v24 = v41;
    v25 = v42;
    v26 = v44;
    *((_OWORD *)v22 + 3) = v43;
    *((_OWORD *)v22 + 4) = v26;
    *((_OWORD *)v22 + 1) = v24;
    *((_OWORD *)v22 + 2) = v25;
    v27 = v45;
    v28 = v46;
    v29 = v47;
    *((_QWORD *)v22 + 16) = v48[0];
    *((_OWORD *)v22 + 6) = v28;
    *((_OWORD *)v22 + 7) = v29;
    *((_OWORD *)v22 + 5) = v27;
    v16 = v22 + 136;
    v31 = (char *)*v5;
    v30 = (char *)v5[1];
    if (v30 != *v5)
    {
      do
      {
        *(_OWORD *)(v22 - 136) = *(_OWORD *)(v30 - 136);
        v32 = *(_OWORD *)(v30 - 120);
        v33 = *(_OWORD *)(v30 - 104);
        v34 = *(_OWORD *)(v30 - 88);
        *(_OWORD *)(v22 - 72) = *(_OWORD *)(v30 - 72);
        *(_OWORD *)(v22 - 88) = v34;
        *(_OWORD *)(v22 - 104) = v33;
        *(_OWORD *)(v22 - 120) = v32;
        v35 = *(_OWORD *)(v30 - 56);
        v36 = *(_OWORD *)(v30 - 40);
        v37 = *(_OWORD *)(v30 - 24);
        *((_QWORD *)v22 - 1) = *((_QWORD *)v30 - 1);
        *(_OWORD *)(v22 - 24) = v37;
        *(_OWORD *)(v22 - 40) = v36;
        *(_OWORD *)(v22 - 56) = v35;
        v22 -= 136;
        v30 -= 136;
      }
      while (v30 != v31);
      v30 = (char *)*v5;
    }
    *v5 = v22;
    v5[1] = v16;
    v5[2] = v23;
    if (v30)
      operator delete(v30);
  }
  else
  {
    *(_OWORD *)v9 = v40;
    v10 = v41;
    v11 = v42;
    v12 = v44;
    *((_OWORD *)v9 + 3) = v43;
    *((_OWORD *)v9 + 4) = v12;
    *((_OWORD *)v9 + 1) = v10;
    *((_OWORD *)v9 + 2) = v11;
    v13 = v45;
    v14 = v46;
    v15 = v47;
    *((_QWORD *)v9 + 16) = v48[0];
    *((_OWORD *)v9 + 6) = v14;
    *((_OWORD *)v9 + 7) = v15;
    *((_OWORD *)v9 + 5) = v13;
    v16 = v9 + 136;
  }
  v5[1] = v16;
  value = re::xpc_get_value(v4, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) - 136));

  return value;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectMesh>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1E1E1E1E1E1E1E2)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(136 * a2);
}

BOOL re::xpc_array_get_values<re::CreateDirectTexture>(void *a1, void **a2)
{
  id v3;
  size_t count;
  _BOOL8 v5;
  _QWORD applier[5];

  v3 = a1;
  count = xpc_array_get_count(v3);
  std::vector<re::CreateDirectTexture>::reserve(a2, count);
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_19CreateDirectTextureEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  v5 = xpc_array_apply(v3, applier);

  return v5;
}

BOOL re::xpc_array_get_values<re::UpdateDirectTexture>(void *a1, void **a2)
{
  id v3;
  size_t count;
  _BOOL8 v5;
  _QWORD applier[5];

  v3 = a1;
  count = xpc_array_get_count(v3);
  std::vector<re::DirectMeshVertexAttribute>::reserve(a2, count);
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_19UpdateDirectTextureEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  v5 = xpc_array_apply(v3, applier);

  return v5;
}

void std::vector<re::CreateDirectTexture>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *Direct;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0x4EC4EC4EC4EC4EC5 * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x276276276276277)
      abort();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 104;
    Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectTexture>>(v3, a2);
    v7 = &Direct[104 * v5];
    v9 = &Direct[104 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 104);
        v14 = *(_OWORD *)(v10 - 88);
        *(_OWORD *)(v12 - 72) = *(_OWORD *)(v10 - 72);
        *(_OWORD *)(v12 - 88) = v14;
        *(_OWORD *)(v12 - 104) = v13;
        v15 = *(_OWORD *)(v10 - 56);
        v16 = *(_OWORD *)(v10 - 40);
        v17 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v17;
        *(_OWORD *)(v12 - 40) = v16;
        *(_OWORD *)(v12 - 56) = v15;
        v12 -= 104;
        v10 -= 104;
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

BOOL ___ZN2re20xpc_array_get_valuesINS_19CreateDirectTextureEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void **v5;
  int64x2_t *v6;
  int64x2_t *v7;
  int64x2_t v8;
  int64x2_t v9;
  __int128 v10;
  __int128 v11;
  int64x2_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *Direct;
  int64x2_t *v19;
  char *v20;
  int64x2_t v21;
  int64x2_t v22;
  __int128 v23;
  __int128 v24;
  int64x2_t v25;
  char *v26;
  char *v27;
  int64x2_t v28;
  int64x2_t v29;
  int64x2_t v30;
  int64x2_t v31;
  int64x2_t v32;
  _BOOL8 value;
  int64x2_t v35;
  int64x2_t v36;
  int64x2_t v37;
  __int128 v38;
  __int128 v39;
  int64x2_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(void ***)(a1 + 32);
  uuid_copy((unsigned __int8 *)&v35, UUID_NULL);
  v36 = vdupq_n_s64(1uLL);
  v37 = v36;
  v38 = xmmword_23A4F97E0;
  v39 = xmmword_23A4F97F0;
  v40.i32[0] = 84148994;
  uuid_copy(&v40.u8[8], UUID_NULL);
  v6 = (int64x2_t *)v5[1];
  v7 = (int64x2_t *)v5[2];
  if (v6 >= v7)
  {
    v14 = 0x4EC4EC4EC4EC4EC5 * (((char *)v6 - (_BYTE *)*v5) >> 3);
    v15 = v14 + 1;
    if ((unint64_t)(v14 + 1) > 0x276276276276276)
      abort();
    v16 = 0x4EC4EC4EC4EC4EC5 * (((char *)v7 - (_BYTE *)*v5) >> 3);
    if (2 * v16 > v15)
      v15 = 2 * v16;
    if (v16 >= 0x13B13B13B13B13BLL)
      v17 = 0x276276276276276;
    else
      v17 = v15;
    if (v17)
      Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectTexture>>((uint64_t)(v5 + 2), v17);
    else
      Direct = 0;
    v19 = (int64x2_t *)&Direct[104 * v14];
    v20 = &Direct[104 * v17];
    v21 = v35;
    v22 = v37;
    v19[1] = v36;
    v19[2] = v22;
    *v19 = v21;
    v23 = v38;
    v24 = v39;
    v25 = v40;
    v19[6].i64[0] = v41;
    v19[4] = (int64x2_t)v24;
    v19[5] = v25;
    v19[3] = (int64x2_t)v23;
    v13 = &v19[6].i8[8];
    v27 = (char *)*v5;
    v26 = (char *)v5[1];
    if (v26 != *v5)
    {
      do
      {
        v28 = *(int64x2_t *)(v26 - 104);
        v29 = *(int64x2_t *)(v26 - 88);
        *(int64x2_t *)((char *)v19 - 72) = *(int64x2_t *)(v26 - 72);
        *(int64x2_t *)((char *)v19 - 88) = v29;
        *(int64x2_t *)((char *)v19 - 104) = v28;
        v30 = *(int64x2_t *)(v26 - 56);
        v31 = *(int64x2_t *)(v26 - 40);
        v32 = *(int64x2_t *)(v26 - 24);
        v19[-1].i64[1] = *((_QWORD *)v26 - 1);
        *(int64x2_t *)((char *)v19 - 24) = v32;
        *(int64x2_t *)((char *)v19 - 40) = v31;
        *(int64x2_t *)((char *)v19 - 56) = v30;
        v19 = (int64x2_t *)((char *)v19 - 104);
        v26 -= 104;
      }
      while (v26 != v27);
      v26 = (char *)*v5;
    }
    *v5 = v19;
    v5[1] = v13;
    v5[2] = v20;
    if (v26)
      operator delete(v26);
  }
  else
  {
    v8 = v35;
    v9 = v37;
    v6[1] = v36;
    v6[2] = v9;
    *v6 = v8;
    v10 = v38;
    v11 = v39;
    v12 = v40;
    v6[6].i64[0] = v41;
    v6[4] = (int64x2_t)v11;
    v6[5] = v12;
    v6[3] = (int64x2_t)v10;
    v13 = &v6[6].i8[8];
  }
  v5[1] = v13;
  value = re::xpc_get_value(v4, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) - 104));

  return value;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectTexture>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x276276276276277)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(104 * a2);
}

uint64_t ___ZN2re20xpc_array_get_valuesINS_19UpdateDirectTextureEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void **v5;
  _OWORD *v6;
  unint64_t v7;
  __int128 v8;
  _OWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  __int128 v17;
  char *v18;
  char *v19;
  __int128 v20;
  uint64_t value;
  uuid_t dst;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(void ***)(a1 + 32);
  uuid_copy(dst, UUID_NULL);
  uuid_copy((unsigned __int8 *)&v24, UUID_NULL);
  v6 = v5[1];
  v7 = (unint64_t)v5[2];
  if ((unint64_t)v6 >= v7)
  {
    v10 = ((char *)v6 - (_BYTE *)*v5) >> 5;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 59)
      abort();
    v12 = v7 - (_QWORD)*v5;
    if (v12 >> 4 > v11)
      v11 = v12 >> 4;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFE0)
      v13 = 0x7FFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>((uint64_t)(v5 + 2), v13);
    else
      v14 = 0;
    v15 = &v14[32 * v10];
    v16 = &v14[32 * v13];
    v17 = v24;
    *(_OWORD *)v15 = *(_OWORD *)dst;
    *((_OWORD *)v15 + 1) = v17;
    v9 = v15 + 32;
    v19 = (char *)*v5;
    v18 = (char *)v5[1];
    if (v18 != *v5)
    {
      do
      {
        v20 = *((_OWORD *)v18 - 1);
        *((_OWORD *)v15 - 2) = *((_OWORD *)v18 - 2);
        *((_OWORD *)v15 - 1) = v20;
        v15 -= 32;
        v18 -= 32;
      }
      while (v18 != v19);
      v18 = (char *)*v5;
    }
    *v5 = v15;
    v5[1] = v9;
    v5[2] = v16;
    if (v18)
      operator delete(v18);
  }
  else
  {
    v8 = v24;
    *v6 = *(_OWORD *)dst;
    v6[1] = v8;
    v9 = v6 + 2;
  }
  v5[1] = v9;
  value = re::xpc_get_value(v4, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) - 32));

  return value;
}

BOOL re::xpc_array_get_values<re::CreateDirectBuffer>(void *a1, void **a2)
{
  id v3;
  size_t count;
  _BOOL8 v5;
  _QWORD applier[5];

  v3 = a1;
  count = xpc_array_get_count(v3);
  std::vector<re::CreateDirectBuffer>::reserve(a2, count);
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_18CreateDirectBufferEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  v5 = xpc_array_apply(v3, applier);

  return v5;
}

BOOL re::xpc_array_get_values<re::UpdateDirectBuffer>(void *a1, void **a2)
{
  id v3;
  size_t count;
  _BOOL8 v5;
  _QWORD applier[5];

  v3 = a1;
  count = xpc_array_get_count(v3);
  std::vector<re::UpdateDirectBuffer>::reserve(a2, count);
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_18UpdateDirectBufferEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  v5 = xpc_array_apply(v3, applier);

  return v5;
}

void std::vector<re::CreateDirectBuffer>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *Direct;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0x8E38E38E38E38E39 * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x38E38E38E38E38FLL)
      abort();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 72;
    Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectBuffer>>(v3, a2);
    v7 = &Direct[72 * v5];
    v9 = &Direct[72 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *(_OWORD *)(v12 - 72) = *(_OWORD *)(v10 - 72);
        v13 = *(_OWORD *)(v10 - 56);
        v14 = *(_OWORD *)(v10 - 40);
        v15 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v15;
        *(_OWORD *)(v12 - 40) = v14;
        *(_OWORD *)(v12 - 56) = v13;
        v12 -= 72;
        v10 -= 72;
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

BOOL ___ZN2re20xpc_array_get_valuesINS_18CreateDirectBufferEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void **v5;
  char *v6;
  char *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *Direct;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char *v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BOOL8 value;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(void ***)(a1 + 32);
  uuid_copy((unsigned __int8 *)&v29, UUID_NULL);
  v30 = xmmword_23A4F9800;
  LOBYTE(v31) = 0;
  BYTE8(v31) = 0;
  LOBYTE(v32) = 0;
  LOBYTE(v33) = 0;
  v6 = (char *)v5[1];
  v7 = (char *)v5[2];
  if (v6 >= v7)
  {
    v12 = 0x8E38E38E38E38E39 * ((v6 - (_BYTE *)*v5) >> 3);
    v13 = v12 + 1;
    if (v12 + 1 > 0x38E38E38E38E38ELL)
      abort();
    v14 = 0x8E38E38E38E38E39 * ((v7 - (_BYTE *)*v5) >> 3);
    if (2 * v14 > v13)
      v13 = 2 * v14;
    if (v14 >= 0x1C71C71C71C71C7)
      v15 = 0x38E38E38E38E38ELL;
    else
      v15 = v13;
    if (v15)
      Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectBuffer>>((uint64_t)(v5 + 2), v15);
    else
      Direct = 0;
    v17 = &Direct[72 * v12];
    v18 = &Direct[72 * v15];
    *(_OWORD *)v17 = v29;
    v19 = v30;
    v20 = v31;
    v21 = v32;
    *((_QWORD *)v17 + 8) = v33;
    *((_OWORD *)v17 + 2) = v20;
    *((_OWORD *)v17 + 3) = v21;
    *((_OWORD *)v17 + 1) = v19;
    v11 = v17 + 72;
    v23 = (char *)*v5;
    v22 = (char *)v5[1];
    if (v22 != *v5)
    {
      do
      {
        *(_OWORD *)(v17 - 72) = *(_OWORD *)(v22 - 72);
        v24 = *(_OWORD *)(v22 - 56);
        v25 = *(_OWORD *)(v22 - 40);
        v26 = *(_OWORD *)(v22 - 24);
        *((_QWORD *)v17 - 1) = *((_QWORD *)v22 - 1);
        *(_OWORD *)(v17 - 24) = v26;
        *(_OWORD *)(v17 - 40) = v25;
        *(_OWORD *)(v17 - 56) = v24;
        v17 -= 72;
        v22 -= 72;
      }
      while (v22 != v23);
      v22 = (char *)*v5;
    }
    *v5 = v17;
    v5[1] = v11;
    v5[2] = v18;
    if (v22)
      operator delete(v22);
  }
  else
  {
    *(_OWORD *)v6 = v29;
    v8 = v30;
    v9 = v31;
    v10 = v32;
    *((_QWORD *)v6 + 8) = v33;
    *((_OWORD *)v6 + 2) = v9;
    *((_OWORD *)v6 + 3) = v10;
    *((_OWORD *)v6 + 1) = v8;
    v11 = v6 + 72;
  }
  v5[1] = v11;
  value = re::xpc_get_value(v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) - 72);

  return value;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectBuffer>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(72 * a2);
}

void std::vector<re::UpdateDirectBuffer>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  char *updated;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((v4 - (_BYTE *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x492492492492493)
      abort();
    v5 = ((_BYTE *)a1[1] - (_BYTE *)*a1) / 56;
    updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>(v3, a2);
    v7 = &updated[56 * v5];
    v9 = &updated[56 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *(_OWORD *)(v10 - 56);
        v14 = *(_OWORD *)(v10 - 40);
        v15 = *(_OWORD *)(v10 - 24);
        *((_QWORD *)v12 - 1) = *((_QWORD *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v15;
        *(_OWORD *)(v12 - 40) = v14;
        *(_OWORD *)(v12 - 56) = v13;
        v12 -= 56;
        v10 -= 56;
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

BOOL ___ZN2re20xpc_array_get_valuesINS_18UpdateDirectBufferEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void **v5;
  char *v6;
  char *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *updated;
  char *v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char *v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BOOL8 value;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(void ***)(a1 + 32);
  uuid_copy((unsigned __int8 *)&v29, UUID_NULL);
  LOBYTE(v30) = 0;
  BYTE8(v30) = 0;
  LOBYTE(v31) = 0;
  LOBYTE(v32) = 0;
  v6 = (char *)v5[1];
  v7 = (char *)v5[2];
  if (v6 >= v7)
  {
    v12 = 0x6DB6DB6DB6DB6DB7 * ((v6 - (_BYTE *)*v5) >> 3);
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) > 0x492492492492492)
      abort();
    v14 = 0x6DB6DB6DB6DB6DB7 * ((v7 - (_BYTE *)*v5) >> 3);
    if (2 * v14 > v13)
      v13 = 2 * v14;
    if (v14 >= 0x249249249249249)
      v15 = 0x492492492492492;
    else
      v15 = v13;
    if (v15)
      updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>((uint64_t)(v5 + 2), v15);
    else
      updated = 0;
    v17 = &updated[56 * v12];
    v18 = &updated[56 * v15];
    v19 = v29;
    v20 = v30;
    v21 = v31;
    *((_QWORD *)v17 + 6) = v32;
    *((_OWORD *)v17 + 1) = v20;
    *((_OWORD *)v17 + 2) = v21;
    *(_OWORD *)v17 = v19;
    v11 = v17 + 56;
    v23 = (char *)*v5;
    v22 = (char *)v5[1];
    if (v22 != *v5)
    {
      do
      {
        v24 = *(_OWORD *)(v22 - 56);
        v25 = *(_OWORD *)(v22 - 40);
        v26 = *(_OWORD *)(v22 - 24);
        *((_QWORD *)v17 - 1) = *((_QWORD *)v22 - 1);
        *(_OWORD *)(v17 - 24) = v26;
        *(_OWORD *)(v17 - 40) = v25;
        *(_OWORD *)(v17 - 56) = v24;
        v17 -= 56;
        v22 -= 56;
      }
      while (v22 != v23);
      v22 = (char *)*v5;
    }
    *v5 = v17;
    v5[1] = v11;
    v5[2] = v18;
    if (v22)
      operator delete(v22);
  }
  else
  {
    v8 = v29;
    v9 = v30;
    v10 = v31;
    *((_QWORD *)v6 + 6) = v32;
    *((_OWORD *)v6 + 1) = v9;
    *((_OWORD *)v6 + 2) = v10;
    *(_OWORD *)v6 = v8;
    v11 = v6 + 56;
  }
  v5[1] = v11;
  value = re::xpc_get_value(v4, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) - 56));

  return value;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(56 * a2);
}

uint64_t std::vector<re::CreateDirectPayload>::reserve(char **a1, unint64_t a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  char *Direct;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  char *v10;
  int64x2_t v11;
  char *v12;
  uint64_t v13;
  int64x2_t v14;
  char *v15;
  uint64_t v16;

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL)
      abort();
    v5 = a1[1] - *a1;
    v16 = result;
    Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectPayload>>(result, a2);
    v9 = *a1;
    v8 = (unint64_t)a1[1];
    if ((char *)v8 == *a1)
    {
      v11 = vdupq_n_s64(v8);
      v10 = &Direct[v5];
    }
    else
    {
      v10 = &Direct[v5];
      do
      {
        *(_OWORD *)(v10 - 24) = *(_OWORD *)(v8 - 24);
        *((_QWORD *)v10 - 1) = *(_QWORD *)(v8 - 8);
        v10 -= 24;
        *(_QWORD *)(v8 - 8) = 0;
        v8 -= 24;
      }
      while ((char *)v8 != v9);
      v11 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &Direct[v5];
    v14 = v11;
    v12 = a1[2];
    a1[2] = &Direct[24 * v7];
    v15 = v12;
    v13 = v11.i64[0];
    return std::__split_buffer<re::CreateDirectPayload>::~__split_buffer((uint64_t)&v13);
  }
  return result;
}

BOOL ___ZN2re20xpc_array_get_valuesINS_19CreateDirectPayloadEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  char **v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *Direct;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  _BOOL8 value;
  _QWORD v24[5];
  uuid_t dst;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(char ***)(a1 + 32);
  uuid_copy(dst, UUID_NULL);
  v26 = 0;
  v6 = (unint64_t)v5[1];
  v7 = (unint64_t)v5[2];
  if (v6 >= v7)
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - (_QWORD)*v5) >> 3);
    v9 = v8 + 1;
    if (v8 + 1 > 0xAAAAAAAAAAAAAAALL)
      abort();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (_QWORD)*v5) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    v24[4] = v5 + 2;
    Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectPayload>>((uint64_t)(v5 + 2), v11);
    v14 = &Direct[24 * v8];
    *(_OWORD *)v14 = *(_OWORD *)dst;
    *((_QWORD *)v14 + 2) = v26;
    v26 = 0;
    v16 = *v5;
    v15 = v5[1];
    if (v15 == *v5)
    {
      v18 = v5[1];
      v17 = &Direct[24 * v8];
    }
    else
    {
      v17 = &Direct[24 * v8];
      do
      {
        *(_OWORD *)(v17 - 24) = *(_OWORD *)(v15 - 24);
        *((_QWORD *)v17 - 1) = *((_QWORD *)v15 - 1);
        v17 -= 24;
        *((_QWORD *)v15 - 1) = 0;
        v15 -= 24;
      }
      while (v15 != v16);
      v18 = *v5;
      v15 = v5[1];
    }
    v19 = v14 + 24;
    *v5 = v17;
    v24[0] = v18;
    v24[1] = v18;
    v5[1] = v14 + 24;
    v24[2] = v15;
    v20 = v5[2];
    v5[2] = &Direct[24 * v13];
    v24[3] = v20;
    std::__split_buffer<re::CreateDirectPayload>::~__split_buffer((uint64_t)v24);
    v21 = v26;
    v5[1] = v19;
    if (v21)

  }
  else
  {
    *(_OWORD *)v6 = *(_OWORD *)dst;
    *(_QWORD *)(v6 + 16) = v26;
    v5[1] = (char *)(v6 + 24);
  }
  value = re::xpc_get_value(v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) - 24);

  return value;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectPayload>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(24 * a2);
}

uint64_t std::__split_buffer<re::CreateDirectPayload>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<re::CreateDirectPayload>::__destruct_at_end[abi:nn180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<re::CreateDirectPayload>::__destruct_at_end[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    *(_QWORD *)(a1 + 16) = v2 - 24;
    v5 = *(_QWORD *)(v2 - 8);
    if (v5)
    {

      *(_QWORD *)(v2 - 8) = 0;
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void std::vector<re::DestroyResource>::reserve(void **a1, unint64_t a2)
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
      abort();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>(v3, a2);
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

BOOL ___ZN2re20xpc_array_get_valuesINS_15DestroyResourceEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void **v5;
  _OWORD *v6;
  unint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  _BOOL8 value;
  uuid_t dst;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(void ***)(a1 + 32);
  uuid_copy(dst, UUID_NULL);
  v6 = v5[1];
  v7 = (unint64_t)v5[2];
  if ((unint64_t)v6 >= v7)
  {
    v9 = ((char *)v6 - (_BYTE *)*v5) >> 4;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60)
      abort();
    v11 = v7 - (_QWORD)*v5;
    if (v11 >> 3 > v10)
      v10 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>((uint64_t)(v5 + 2), v12);
    else
      v13 = 0;
    v14 = &v13[16 * v9];
    v15 = &v13[16 * v12];
    *(_OWORD *)v14 = *(_OWORD *)dst;
    v8 = v14 + 16;
    v17 = (char *)*v5;
    v16 = (char *)v5[1];
    if (v16 != *v5)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v16 - 1);
        v14 -= 16;
        v16 -= 16;
      }
      while (v16 != v17);
      v16 = (char *)*v5;
    }
    *v5 = v14;
    v5[1] = v8;
    v5[2] = v15;
    if (v16)
      operator delete(v16);
  }
  else
  {
    *v6 = *(_OWORD *)dst;
    v8 = v6 + 1;
  }
  v5[1] = v8;
  value = re::xpc_get_value(v4, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) - 16));

  return value;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(16 * a2);
}

id re::xpc_array_create_unless_empty<re::CreateDirectMesh>(const unsigned __int8 **a1)
{
  const unsigned __int8 *v1;
  void *v2;
  const unsigned __int8 *v4[2];

  v1 = a1[1];
  if (*a1 == v1)
  {
    v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    re::xpc_array_create_with<re::CreateDirectMesh>(v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id re::xpc_array_create_unless_empty<re::UpdateDirectMesh>(const unsigned __int8 **a1)
{
  const unsigned __int8 *v1;
  void *v2;
  const unsigned __int8 *v4[2];

  v1 = a1[1];
  if (*a1 == v1)
  {
    v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    re::xpc_array_create_with<re::UpdateDirectMesh>(v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id re::xpc_array_create_with<re::CreateDirectMesh>(const unsigned __int8 **a1)
{
  xpc_object_t empty;
  const unsigned __int8 *v3;
  const unsigned __int8 *v4;
  void *v5;
  xpc_object_t v6;

  empty = xpc_array_create_empty();
  v3 = *a1;
  v4 = a1[1];
  while (v3 != v4)
  {
    re::xpc_object_create(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);

    }
    v3 += 216;
  }
  return empty;
}

id re::xpc_array_create_with<re::UpdateDirectMesh>(const unsigned __int8 **a1)
{
  xpc_object_t empty;
  const unsigned __int8 *v3;
  const unsigned __int8 *v4;
  void *v5;
  xpc_object_t v6;

  empty = xpc_array_create_empty();
  v3 = *a1;
  v4 = a1[1];
  while (v3 != v4)
  {
    re::xpc_object_create(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);

    }
    v3 += 136;
  }
  return empty;
}

id re::xpc_array_create_unless_empty<re::CreateDirectTexture>(const unsigned __int8 **a1)
{
  const unsigned __int8 *v1;
  void *v2;
  const unsigned __int8 *v4[2];

  v1 = a1[1];
  if (*a1 == v1)
  {
    v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    re::xpc_array_create_with<re::CreateDirectTexture>(v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id re::xpc_array_create_unless_empty<re::UpdateDirectTexture>(const unsigned __int8 **a1)
{
  const unsigned __int8 *v1;
  void *v2;
  const unsigned __int8 *v4[2];

  v1 = a1[1];
  if (*a1 == v1)
  {
    v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    re::xpc_array_create_with<re::UpdateDirectTexture>(v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id re::xpc_array_create_with<re::CreateDirectTexture>(const unsigned __int8 **a1)
{
  xpc_object_t empty;
  const unsigned __int8 *v3;
  const unsigned __int8 *v4;
  void *v5;
  xpc_object_t v6;

  empty = xpc_array_create_empty();
  v3 = *a1;
  v4 = a1[1];
  while (v3 != v4)
  {
    re::xpc_object_create(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);

    }
    v3 += 104;
  }
  return empty;
}

id re::xpc_array_create_with<re::UpdateDirectTexture>(const unsigned __int8 **a1)
{
  xpc_object_t empty;
  const unsigned __int8 *v3;
  const unsigned __int8 *v4;
  void *v5;
  xpc_object_t v6;

  empty = xpc_array_create_empty();
  v3 = *a1;
  v4 = a1[1];
  while (v3 != v4)
  {
    re::xpc_object_create(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);

    }
    v3 += 32;
  }
  return empty;
}

id re::xpc_array_create_unless_empty<re::CreateDirectBuffer>(uint64_t *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v4[2];

  v1 = a1[1];
  if (*a1 == v1)
  {
    v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    re::xpc_array_create_with<re::CreateDirectBuffer>(v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id re::xpc_array_create_unless_empty<re::UpdateDirectBuffer>(const unsigned __int8 **a1)
{
  const unsigned __int8 *v1;
  void *v2;
  const unsigned __int8 *v4[2];

  v1 = a1[1];
  if (*a1 == v1)
  {
    v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    re::xpc_array_create_with<re::UpdateDirectBuffer>(v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id re::xpc_array_create_with<re::CreateDirectBuffer>(uint64_t *a1)
{
  xpc_object_t empty;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  xpc_object_t v6;

  empty = xpc_array_create_empty();
  v3 = *a1;
  v4 = a1[1];
  while (v3 != v4)
  {
    re::xpc_object_create(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);

    }
    v3 += 72;
  }
  return empty;
}

id re::xpc_array_create_with<re::UpdateDirectBuffer>(const unsigned __int8 **a1)
{
  xpc_object_t empty;
  const unsigned __int8 *v3;
  const unsigned __int8 *v4;
  void *v5;
  xpc_object_t v6;

  empty = xpc_array_create_empty();
  v3 = *a1;
  v4 = a1[1];
  while (v3 != v4)
  {
    re::xpc_object_create(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);

    }
    v3 += 56;
  }
  return empty;
}

id re::xpc_array_create_with<re::CreateDirectPayload>(uint64_t *a1)
{
  xpc_object_t empty;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  xpc_object_t v6;

  empty = xpc_array_create_empty();
  v3 = *a1;
  v4 = a1[1];
  while (v3 != v4)
  {
    re::xpc_object_create(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);

    }
    v3 += 24;
  }
  return empty;
}

id re::xpc_array_create_with<re::DestroyResource>(const unsigned __int8 **a1)
{
  xpc_object_t empty;
  const unsigned __int8 *v3;
  const unsigned __int8 *v4;
  xpc_object_t v5;
  xpc_object_t v6;

  empty = xpc_array_create_empty();
  v3 = *a1;
  v4 = a1[1];
  while (v3 != v4)
  {
    v5 = xpc_uuid_create(v3);
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);

    }
    v3 += 16;
  }
  return empty;
}

void re::MemoryMappedRegion::MemoryMappedRegion(re::MemoryMappedRegion *this, void *a2, uint64_t a3)
{
  _QWORD *v5;

  ArcSharedObject::ArcSharedObject(this, 0);
  *v5 = &off_250B64F20;
  v5[2] = a2;
  v5[3] = a3;
}

void re::MemoryMappedRegion::~MemoryMappedRegion(re::MemoryMappedRegion *this)
{
  *(_QWORD *)this = &off_250B64F20;
  if (munmap(*((void **)this + 2), *((_QWORD *)this + 3)))
    re::MemoryMappedRegion::~MemoryMappedRegion();
  ArcSharedObject::~ArcSharedObject(this);
}

{
  re::MemoryMappedRegion::~MemoryMappedRegion(this);
  JUMPOUT(0x23B84F8E0);
}

void re::MemoryMappedRegion::map(re::MemoryMappedRegion *this@<X0>, int a2@<W1>, int a3@<W2>, const void *a4@<X3>, _QWORD *a5@<X8>)
{
  unint64_t v9;
  size_t v10;
  uint8x8_t v11;
  size_t v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;
  _QWORD *v17;
  ArcSharedObject *v18;

  v9 = (unint64_t)this + *MEMORY[0x24BDB03C8] - 1;
  v10 = v9 / *MEMORY[0x24BDB03C8] * *MEMORY[0x24BDB03C8];
  v11 = (uint8x8_t)vcnt_s8(*MEMORY[0x24BDB03C8]);
  v11.i16[0] = vaddlv_u8(v11);
  v12 = v9 & -*MEMORY[0x24BDB03C8];
  if (v11.u32[0] == 1)
    v13 = v12;
  else
    v13 = v10;
  v14 = (char *)mmap(0, v13, a2, a3, -1, 0);
  if (v14 != (char *)-1)
  {
    v15 = v14;
    if (a4)
    {
      memcpy(v14, a4, (size_t)this);
      v16 = v13 - (_QWORD)this;
      if (v13 <= (unint64_t)this)
      {
LABEL_11:
        v18 = (ArcSharedObject *)operator new(0x20uLL);
        ArcSharedObject::ArcSharedObject(v18, 0);
        *v17 = &off_250B64F20;
        v17[2] = v15;
        v17[3] = v13;
        goto LABEL_12;
      }
      v14 = (char *)this + (_QWORD)v15;
    }
    else
    {
      v16 = v13;
    }
    bzero(v14, v16);
    goto LABEL_11;
  }
  v17 = 0;
LABEL_12:
  *a5 = v17;
}

BOOL re::isPrivateToThisProcess(int a1)
{
  return (a1 & 0xFFFFFFFE) != 6;
}

uint64_t re::DirectMemoryResource::capabilities(uint64_t result)
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    if ((objc_msgSend((id)result, sel_respondsToSelector_, sel_supportsBufferWithIOSurface) & 1) != 0
      || objc_msgSend(v1, sel_methodSignatureForSelector_, sel_supportsBufferWithIOSurface))
    {
      if (objc_msgSend(v1, sel_supportsBufferWithIOSurface))
        return 3;
      else
        return 2;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t re::DirectMemoryResource::typeForUsage(re::DirectMemoryResource *this, char a2, unint64_t a3)
{
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;

  if ((a2 & 2) != 0)
    v3 = 4;
  else
    v3 = 2;
  if ((this & 2) != 0)
    v4 = v3;
  else
    v4 = 1;
  if ((this & 4) != 0)
    v5 = 3;
  else
    v5 = a2 & 1 ^ 7;
  if ((this & 8) != 0)
    v6 = v5;
  else
    v6 = v4;
  if ((a2 & 2) != 0)
    v7 = 4;
  else
    v7 = 2;
  if ((this & 2) != 0)
    v8 = v7;
  else
    v8 = 1;
  if (a3 <= 0xFFF)
    return v8;
  else
    return v6;
}

void re::DirectMemoryResource::create(re::MemoryMappedRegion *a1@<X0>, re::DirectMemoryResource *a2@<X1>, char a3@<W2>, void *a4@<X3>, _QWORD *a5@<X8>)
{
  char *v10;
  int v11;
  int v12;

  v10 = (char *)operator new(0x68uLL);
  re::DirectMemoryResource::DirectMemoryResource((re::DirectMemoryResource *)v10);
  v11 = re::DirectMemoryResource::typeForUsage(a2, a3, (unint64_t)a1);
  if (!re::DirectMemoryResource::allocate((re::DirectMemoryResource *)v10, a1, (int)a2, v12, v11, a4))
  {

    v10 = 0;
  }
  *a5 = v10;
}

BOOL re::DirectMemoryResource::allocate(re::DirectMemoryResource *a1, re::MemoryMappedRegion *a2, int a3, int a4, int a5, id a6)
{
  _BOOL8 result;

  *((_DWORD *)a1 + 9) = a3;
  switch(a5)
  {
    case 0:
    case 5:
      re::DirectMemoryResource::reset(a1);
      goto LABEL_3;
    case 1:
      result = re::DirectMemoryResource::allocatePrivateNonAligned(a1, (size_t)a2);
      break;
    case 2:
      result = re::DirectMemoryResource::allocatePrivatePageAligned(a1, (uint64_t)a2);
      break;
    case 3:
      result = re::DirectMemoryResource::allocatePrivateMemoryMap(a1, a2);
      break;
    case 4:
      result = re::DirectMemoryResource::allocatePrivateMTLBuffer((uint64_t)a1, a6, (uint64_t)a2);
      break;
    case 6:
      result = re::DirectMemoryResource::allocateIOSurface(a1, (uint64_t)a2);
      break;
    case 7:
      result = re::DirectMemoryResource::allocateSharedMemory(a1, a2);
      break;
    default:
LABEL_3:
      result = 0;
      break;
  }
  return result;
}

void re::DirectMemoryResource::create(re::MemoryMappedRegion *a1@<X0>, re::DirectMemoryResource *a2@<X1>, void *a3@<X2>, _QWORD *a4@<X8>)
{
  char v8;

  v8 = re::DirectMemoryResource::capabilities((uint64_t)a3);
  re::DirectMemoryResource::create(a1, a2, v8, a3, a4);
}

void re::DirectMemoryResource::createWithSharedTexture(void *a1@<X0>, int a2@<W1>, re::DirectMemoryResource **a3@<X8>)
{
  id v6;
  void *v7;
  void **v8;
  id v9;

  if ((objc_msgSend(a1, sel_isShareable) & 1) == 0)
    re::DirectMemoryResource::createWithSharedTexture();
  v6 = objc_msgSend(a1, sel_newSharedTextureHandle);
  if (v6)
  {
    v7 = v6;
    v8 = (void **)operator new(0x68uLL);
    *a3 = re::DirectMemoryResource::DirectMemoryResource((re::DirectMemoryResource *)v8);
    re::DirectMemoryResource::assignIOSurface((re::DirectMemoryResource *)v8, (IOSurfaceRef)objc_msgSend(v7, sel_ioSurface));
    *((_DWORD *)v8 + 9) = a2;
    v9 = a1;
    NS::SharedPtr<MTL::Resource>::operator=<MTL::Texture>(v8 + 12, &v9);
    if (v9)

    v8[11] = (void *)0x300000002;
  }
  else
  {
    *a3 = 0;
  }
}

BOOL re::DirectMemoryResource::assignIOSurface(re::DirectMemoryResource *this, IOSurfaceRef buffer)
{
  if (buffer)
  {
    *((_DWORD *)this + 8) = 6;
    *((_QWORD *)this + 5) = IOSurfaceGetAllocSize(buffer);
    *((_QWORD *)this + 7) = buffer;
    CFRetain(buffer);
  }
  return buffer != 0;
}

void **NS::SharedPtr<MTL::Resource>::operator=<MTL::Texture>(void **a1, void **a2)
{
  void *v4;
  void *v5;

  v4 = *a1;
  v5 = *a2;
  if (v4 == *a2)
  {

  }
  else
  {
    if (v4)
    {

      v5 = *a2;
    }
    *a1 = v5;
  }
  *a2 = 0;
  return a1;
}

double re::DirectMemoryResource::createWithPrivateTexture@<D0>(void *a1@<X0>, int a2@<W1>, re::DirectMemoryResource **a3@<X8>)
{
  void **v6;
  re::DirectMemoryResource *v7;
  double result;
  id v9;

  v6 = (void **)operator new(0x68uLL);
  v7 = re::DirectMemoryResource::DirectMemoryResource((re::DirectMemoryResource *)v6);
  *a3 = v7;
  *((_DWORD *)v7 + 8) = 5;
  v6[5] = objc_msgSend(a1, sel_allocatedSize);
  *((_DWORD *)v6 + 9) = a2;
  v9 = a1;
  NS::SharedPtr<MTL::Resource>::operator=<MTL::Texture>(v6 + 12, &v9);
  if (v9)

  *(_QWORD *)&result = 0x300000002;
  v6[11] = (void *)0x300000002;
  return result;
}

re::DirectMemoryResource *re::DirectMemoryResource::DirectMemoryResource(re::DirectMemoryResource *this, const unsigned __int8 (*a2)[16])
{
  uint64_t v4;

  ArcSharedObject::ArcSharedObject(this, 0);
  *(_QWORD *)v4 = &off_250B64F58;
  uuid_copy((unsigned __int8 *)(v4 + 16), (const unsigned __int8 *)a2);
  *(_OWORD *)((char *)this + 76) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_DWORD *)this + 23) = -1;
  *((_QWORD *)this + 12) = 0;
  return this;
}

re::DirectMemoryResource *re::DirectMemoryResource::DirectMemoryResource(re::DirectMemoryResource *this)
{
  uint64_t v2;
  unsigned __int8 *v3;

  ArcSharedObject::ArcSharedObject(this, 0);
  *(_QWORD *)v2 = &off_250B64F58;
  v3 = (unsigned __int8 *)(v2 + 16);
  uuid_copy((unsigned __int8 *)(v2 + 16), UUID_NULL);
  *(_OWORD *)((char *)this + 76) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_DWORD *)this + 23) = -1;
  *((_QWORD *)this + 12) = 0;
  uuid_generate_random(v3);
  return this;
}

void re::DirectMemoryResource::~DirectMemoryResource(re::DirectMemoryResource *this)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  re::DirectMemoryResource::reset(this);
  v2 = (void *)*((_QWORD *)this + 12);
  if (v2)
  {

    *((_QWORD *)this + 12) = 0;
  }
  v3 = (void *)*((_QWORD *)this + 10);
  if (v3)
  {

    *((_QWORD *)this + 10) = 0;
  }
  v4 = *((_QWORD *)this + 9);
  if (v4)
  {

    *((_QWORD *)this + 9) = 0;
  }
  v5 = *((_QWORD *)this + 8);
  if (v5)
  {

    *((_QWORD *)this + 8) = 0;
  }
  ArcSharedObject::~ArcSharedObject(this);
}

{
  re::DirectMemoryResource::~DirectMemoryResource(this);
  JUMPOUT(0x23B84F8E0);
}

void re::DirectMemoryResource::reset(re::DirectMemoryResource *this)
{
  const void *v2;
  char *v3;
  uint64_t v4;
  void *v5;

  switch(*((_DWORD *)this + 8))
  {
    case 1:
    case 2:
      v3 = (char *)this + 48;
      v2 = (const void *)*((_QWORD *)this + 6);
      if (v2)
        goto LABEL_8;
      goto LABEL_14;
    case 3:
      v3 = (char *)this + 72;
      v4 = *((_QWORD *)this + 9);
      if (v4)
        goto LABEL_10;
      goto LABEL_14;
    case 4:
      v3 = (char *)this + 80;
      v5 = (void *)*((_QWORD *)this + 10);
      goto LABEL_12;
    case 5:
      v3 = (char *)this + 96;
      v5 = (void *)*((_QWORD *)this + 12);
      goto LABEL_12;
    case 6:
      v3 = (char *)this + 56;
      v2 = (const void *)*((_QWORD *)this + 7);
      if (!v2)
        goto LABEL_14;
LABEL_8:
      CFRelease(v2);
      break;
    case 7:
      v3 = (char *)this + 64;
      v4 = *((_QWORD *)this + 8);
      if (!v4)
        goto LABEL_14;
LABEL_10:
      v5 = (void *)(v4 + 8);
LABEL_12:

      break;
    default:
      goto LABEL_14;
  }
  *(_QWORD *)v3 = 0;
LABEL_14:

  *((_QWORD *)this + 12) = 0;
  *((_DWORD *)this + 8) = 0;
}

id re::DirectMemoryResource::bytes(re::DirectMemoryResource *this)
{
  id result;
  uint64_t v3;

  result = 0;
  switch(*((_DWORD *)this + 8))
  {
    case 1:
    case 2:
      result = CFDataGetMutableBytePtr(*((CFMutableDataRef *)this + 6));
      break;
    case 3:
      v3 = *((_QWORD *)this + 9);
      goto LABEL_7;
    case 4:
      result = objc_msgSend(*((id *)this + 10), sel_contents);
      break;
    case 6:
      result = IOSurfaceGetBaseAddress(*((IOSurfaceRef *)this + 7));
      break;
    case 7:
      v3 = *((_QWORD *)this + 8);
LABEL_7:
      result = *(id *)(v3 + 16);
      break;
    default:
      return result;
  }
  return result;
}

BOOL re::DirectMemoryResource::allocatePrivateNonAligned(re::DirectMemoryResource *this, size_t size)
{
  UInt8 *v4;
  const UInt8 *v5;

  v4 = (UInt8 *)malloc_type_malloc(size, 0x9C5B0D6FuLL);
  v5 = v4;
  if (v4)
  {
    bzero(v4, size);
    *((_DWORD *)this + 8) = 1;
    *((_QWORD *)this + 5) = size;
    *((_QWORD *)this + 6) = CFDataCreateWithBytesNoCopy(0, v5, size, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
  }
  return v5 != 0;
}

BOOL re::DirectMemoryResource::allocatePrivatePageAligned(re::DirectMemoryResource *this, uint64_t a2)
{
  unsigned __int8 v3;
  uint8x8_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  size_t v8;
  int v9;
  uint64_t v11;
  int v12;
  void *memptr;

  if ((v3 & 1) == 0)
  {
    v11 = a2;
    a2 = v11;
    if (v12)
    {
      re::DirectMemoryResource::allocatePrivatePageAligned(unsigned long)::kMetalBufferAlignment = *MEMORY[0x24BDB03C8];
      a2 = v11;
    }
  }
  v4 = (uint8x8_t)vcnt_s8((int8x8_t)re::DirectMemoryResource::allocatePrivatePageAligned(unsigned long)::kMetalBufferAlignment);
  v4.i16[0] = vaddlv_u8(v4);
  v5 = a2 + re::DirectMemoryResource::allocatePrivatePageAligned(unsigned long)::kMetalBufferAlignment - 1;
  v6 = v5
     / re::DirectMemoryResource::allocatePrivatePageAligned(unsigned long)::kMetalBufferAlignment
     * re::DirectMemoryResource::allocatePrivatePageAligned(unsigned long)::kMetalBufferAlignment;
  v7 = v5 & -re::DirectMemoryResource::allocatePrivatePageAligned(unsigned long)::kMetalBufferAlignment;
  if (v4.u32[0] == 1)
    v8 = v7;
  else
    v8 = v6;
  memptr = 0;
  v9 = malloc_type_posix_memalign(&memptr, re::DirectMemoryResource::allocatePrivatePageAligned(unsigned long)::kMetalBufferAlignment, v8, 0xE9AFD140uLL);
  if (!v9)
  {
    bzero(memptr, v8);
    *((_DWORD *)this + 8) = 2;
    *((_QWORD *)this + 5) = v8;
    *((_QWORD *)this + 6) = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)memptr, v8, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
  }
  return v9 == 0;
}

BOOL re::DirectMemoryResource::allocateIOSurface(re::DirectMemoryResource *this, uint64_t a2)
{
  CFNumberRef v4;
  CFStringRef v5;
  void *v6;
  const __CFDictionary *v7;
  IOSurfaceRef v8;
  uint64_t valuePtr;
  char __str[1024];
  char out[40];
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)this + 16, out);
  snprintf(__str, 0x400uLL, "Buffer %s", out);
  *((_DWORD *)this + 8) = 6;
  *((_QWORD *)this + 5) = a2;
  valuePtr = a2;
  v4 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  v5 = CFStringCreateWithCString(0, __str, 0x8000100u);
  v6 = (void *)*MEMORY[0x24BDD8EE0];
  keys[0] = *(void **)MEMORY[0x24BDD8E18];
  keys[1] = v6;
  values[0] = v4;
  values[1] = (void *)v5;
  v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8 = IOSurfaceCreate(v7);
  CFRelease(v7);
  CFRelease(v4);
  CFRelease(v5);
  *((_QWORD *)this + 7) = v8;
  return v8 != 0;
}

BOOL re::DirectMemoryResource::allocateSharedMemory(re::DirectMemoryResource *this, re::MemoryMappedRegion *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  re::MemoryMappedRegion::map(a2, 3, 4097, 0, &v6);
  v3 = v6;
  if (v6)
  {
    *((_DWORD *)this + 8) = 7;
    *((_QWORD *)this + 5) = *(_QWORD *)(v3 + 24);
    v4 = *((_QWORD *)this + 8);
    *((_QWORD *)this + 8) = v3;
    if (v4)

  }
  return v3 != 0;
}

BOOL re::DirectMemoryResource::allocatePrivateMemoryMap(re::DirectMemoryResource *this, re::MemoryMappedRegion *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  re::MemoryMappedRegion::map(a2, 3, 4098, 0, &v6);
  v3 = v6;
  if (v6)
  {
    *((_DWORD *)this + 8) = 3;
    *((_QWORD *)this + 5) = *(_QWORD *)(v3 + 24);
    v4 = *((_QWORD *)this + 9);
    *((_QWORD *)this + 9) = v3;
    if (v4)

  }
  return v3 != 0;
}

BOOL re::DirectMemoryResource::allocatePrivateMTLBuffer(uint64_t a1, id a2, uint64_t a3)
{
  void **v4;
  id v6;

  *(_DWORD *)(a1 + 32) = 4;
  *(_QWORD *)(a1 + 40) = a3;
  v6 = objc_msgSend(a2, sel_newBufferWithLength_options_);
  v4 = (void **)(a1 + 80);
  NS::SharedPtr<MTL::Buffer>::operator=(v4, &v6);
  if (v6)

  return *v4 != 0;
}

BOOL re::DirectMemoryResource::copyFromPrivateMemory(re::DirectMemoryResource *this, const void *a2, re::MemoryMappedRegion *a3, char a4)
{
  CFDataRef v5;
  _BOOL8 v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v11;

  if ((a4 & 2) != 0)
  {
    re::MemoryMappedRegion::map(a3, 3, 4097, a2, &v11);
    v7 = v11;
    v6 = v11 != 0;
    if (v11)
    {
      v8 = (id)(v11 + 8);
      *((_DWORD *)this + 8) = 3;
      *((_QWORD *)this + 5) = *(_QWORD *)(v7 + 24);
      v9 = *((_QWORD *)this + 9);
      *((_QWORD *)this + 9) = v7;
      if (v9)

    }
  }
  else
  {
    *((_DWORD *)this + 8) = 1;
    *((_QWORD *)this + 5) = a3;
    v5 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)a2, (CFIndex)a3);
    *((_QWORD *)this + 6) = v5;
    return v5 != 0;
  }
  return v6;
}

BOOL re::DirectMemoryResource::assignSharedMemory(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  if (*a2)
  {
    *(_DWORD *)(a1 + 32) = 7;
    *(_QWORD *)(a1 + 40) = *(_QWORD *)(v2 + 24);
    v3 = *(_QWORD *)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v2;
    *a2 = v3;
  }
  return v2 != 0;
}

void **NS::SharedPtr<MTL::Buffer>::operator=(void **a1, void **a2)
{
  void *v4;
  void *v5;

  v4 = *a1;
  v5 = *a2;
  if (v4 == *a2)
  {

  }
  else
  {
    if (v4)
    {

      v5 = *a2;
    }
    *a1 = v5;
  }
  *a2 = 0;
  return a1;
}

void re::DirectMemoryResource::makeBuffer(uint64_t a1)
{
  __asm { BR              X10 }
}

void sub_23A4E7BA0()
{
  _QWORD *v0;

  *v0 = 0;
}

void ___ZNK2re20DirectMemoryResource10makeBufferEPN3MTL6DeviceE_block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {

    *(_QWORD *)(a1 + 40) = 0;
  }
}

void ___ZNK2re20DirectMemoryResource10makeBufferEPN3MTL6DeviceE_block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(_QWORD *)(v1 + 40);
  if (v2)
  {

    *(_QWORD *)(v1 + 40) = 0;
  }
}

void ___ZNK2re20DirectMemoryResource10makeBufferEPN3MTL6DeviceE_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(_QWORD *)(v1 + 40);
  if (v2)
  {

    *(_QWORD *)(v1 + 40) = 0;
  }
}

void **re::DirectMemoryResource::setRuntimeResource(uint64_t a1, void **a2)
{
  return NS::SharedPtr<MTL::Buffer>::operator=((void **)(a1 + 96), a2);
}

uint64_t re::DirectMemoryResource::runtimeResource(re::DirectMemoryResource *this)
{
  return (uint64_t)this + 96;
}

uint64_t re::DirectMemoryResource::bindToResource(uint64_t a1, int a2, int a3)
{
  int v3;

  v3 = *(_DWORD *)(a1 + 88);
  if (v3)
  {
    if (v3 != a2 || *(_DWORD *)(a1 + 92) != a3)
      return 0;
  }
  else
  {
    *(_DWORD *)(a1 + 88) = a2;
    *(_DWORD *)(a1 + 92) = a3;
  }
  return 1;
}

void re::makeCommand(re *this@<X0>, uint64_t a2@<X8>)
{
  __int128 v5;
  __int128 v6;
  const unsigned __int8 *v7;

  uuid_copy((unsigned __int8 *)a2, (const unsigned __int8 *)this + 16);
  v5 = *((_OWORD *)this + 6);
  *(_OWORD *)(a2 + 48) = *((_OWORD *)this + 5);
  *(_OWORD *)(a2 + 64) = v5;
  *(_DWORD *)(a2 + 80) = *((_DWORD *)this + 28);
  v6 = *((_OWORD *)this + 4);
  *(_OWORD *)(a2 + 16) = *((_OWORD *)this + 3);
  *(_OWORD *)(a2 + 32) = v6;
  v7 = (const unsigned __int8 *)(re::DirectTexture::payload((uint64_t)this, 3, 0) + 16);
  uuid_copy((unsigned __int8 *)(a2 + 88), v7);
}

{
  __int128 v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;

  uuid_copy((unsigned __int8 *)a2, (const unsigned __int8 *)this + 16);
  v5 = *((_OWORD *)this + 4);
  *(_OWORD *)(a2 + 16) = *((_OWORD *)this + 3);
  *(_OWORD *)(a2 + 32) = v5;
  std::vector<re::DirectMeshVertexAttribute>::vector((_QWORD *)(a2 + 48), (uint64_t)this + 80);
  std::vector<re::DirectMeshVertexLayout>::vector((_QWORD *)(a2 + 72), (uint64_t)this + 104);
  *(_QWORD *)(a2 + 96) = *((_QWORD *)this + 16);
  *(_BYTE *)(a2 + 104) = 1;
  v6 = re::DirectMesh::partsPayload(this);
  if (v6)
  {
    uuid_copy((unsigned __int8 *)(a2 + 112), (const unsigned __int8 *)(v6 + 16));
    v7 = 1;
  }
  else
  {
    v7 = 0;
    *(_BYTE *)(a2 + 112) = 0;
  }
  *(_BYTE *)(a2 + 128) = v7;
  v8 = re::DirectMesh::indexPayload(this);
  if (v8)
  {
    uuid_copy((unsigned __int8 *)(a2 + 129), (const unsigned __int8 *)(v8 + 16));
    v9 = 1;
  }
  else
  {
    v9 = 0;
    *(_BYTE *)(a2 + 129) = 0;
  }
  *(_BYTE *)(a2 + 145) = v9;
  v10 = re::DirectMesh::vertexPayload(this, 0);
  if (v10)
  {
    uuid_copy((unsigned __int8 *)(a2 + 146), (const unsigned __int8 *)(v10 + 16));
    v11 = 1;
  }
  else
  {
    v11 = 0;
    *(_BYTE *)(a2 + 146) = 0;
  }
  *(_BYTE *)(a2 + 162) = v11;
  v12 = re::DirectMesh::vertexPayload(this, 1uLL);
  if (v12)
  {
    uuid_copy((unsigned __int8 *)(a2 + 163), (const unsigned __int8 *)(v12 + 16));
    v13 = 1;
  }
  else
  {
    v13 = 0;
    *(_BYTE *)(a2 + 163) = 0;
  }
  *(_BYTE *)(a2 + 179) = v13;
  v14 = re::DirectMesh::vertexPayload(this, 2uLL);
  if (v14)
  {
    uuid_copy((unsigned __int8 *)(a2 + 180), (const unsigned __int8 *)(v14 + 16));
    v15 = 1;
  }
  else
  {
    v15 = 0;
    *(_BYTE *)(a2 + 180) = 0;
  }
  *(_BYTE *)(a2 + 196) = v15;
  v16 = re::DirectMesh::vertexPayload(this, 3uLL);
  if (v16)
  {
    uuid_copy((unsigned __int8 *)(a2 + 197), (const unsigned __int8 *)(v16 + 16));
    v17 = 1;
  }
  else
  {
    v17 = 0;
    *(_BYTE *)(a2 + 197) = 0;
  }
  *(_BYTE *)(a2 + 213) = v17;
}

{
  uint64_t v5;
  char v6;

  uuid_copy((unsigned __int8 *)a2, (const unsigned __int8 *)this + 16);
  *(_OWORD *)(a2 + 16) = *((_OWORD *)this + 3);
  *(_QWORD *)(a2 + 32) = *((_QWORD *)this + 8);
  *(_BYTE *)(a2 + 40) = 1;
  v5 = re::DirectBuffer::payload((uint64_t)this, 3, 0);
  if (v5)
  {
    uuid_copy((unsigned __int8 *)(a2 + 48), (const unsigned __int8 *)(v5 + 16));
    v6 = 1;
  }
  else
  {
    v6 = 0;
    *(_BYTE *)(a2 + 48) = 0;
  }
  *(_BYTE *)(a2 + 64) = v6;
}

void re::makeCommand(_OWORD *a1@<X0>, re::DirectMeshUpdate *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;

  *(_OWORD *)a3 = *a1;
  v5 = *((_QWORD *)a2 + 3);
  *(_QWORD *)(a3 + 16) = *((_QWORD *)a2 + 2);
  *(_BYTE *)(a3 + 24) = 1;
  v6 = (unsigned __int8 *)(a3 + 32);
  if (v5)
  {
    uuid_copy(v6, (const unsigned __int8 *)(v5 + 16));
    LOBYTE(v5) = 1;
  }
  else
  {
    *v6 = 0;
  }
  *(_BYTE *)(a3 + 48) = v5;
  v7 = (unsigned __int8 *)(a3 + 49);
  v8 = *((_QWORD *)a2 + 4);
  if (v8)
  {
    uuid_copy(v7, (const unsigned __int8 *)(v8 + 16));
    LOBYTE(v8) = 1;
  }
  else
  {
    *v7 = 0;
  }
  *(_BYTE *)(a3 + 65) = v8;
  v9 = re::DirectMeshUpdate::vertexUpdate(a2, 0);
  if (v9)
  {
    uuid_copy((unsigned __int8 *)(a3 + 66), (const unsigned __int8 *)(v9 + 16));
    v10 = 1;
  }
  else
  {
    v10 = 0;
    *(_BYTE *)(a3 + 66) = 0;
  }
  *(_BYTE *)(a3 + 82) = v10;
  v11 = re::DirectMeshUpdate::vertexUpdate(a2, 1uLL);
  if (v11)
  {
    uuid_copy((unsigned __int8 *)(a3 + 83), (const unsigned __int8 *)(v11 + 16));
    v12 = 1;
  }
  else
  {
    v12 = 0;
    *(_BYTE *)(a3 + 83) = 0;
  }
  *(_BYTE *)(a3 + 99) = v12;
  v13 = re::DirectMeshUpdate::vertexUpdate(a2, 2uLL);
  if (v13)
  {
    uuid_copy((unsigned __int8 *)(a3 + 100), (const unsigned __int8 *)(v13 + 16));
    v14 = 1;
  }
  else
  {
    v14 = 0;
    *(_BYTE *)(a3 + 100) = 0;
  }
  *(_BYTE *)(a3 + 116) = v14;
  v15 = re::DirectMeshUpdate::vertexUpdate(a2, 3uLL);
  if (v15)
  {
    uuid_copy((unsigned __int8 *)(a3 + 117), (const unsigned __int8 *)(v15 + 16));
    v16 = 1;
  }
  else
  {
    v16 = 0;
    *(_BYTE *)(a3 + 117) = 0;
  }
  *(_BYTE *)(a3 + 133) = v16;
}

void re::makeCommand(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unsigned __int8 *v4;
  uint64_t v5;
  char v6;

  *(_OWORD *)a3 = *a1;
  *(_QWORD *)(a3 + 16) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a3 + 24) = *(_BYTE *)(a2 + 32);
  v4 = (unsigned __int8 *)(a3 + 32);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)a2 + 40))(a2, 3, 0);
  if (v5)
  {
    uuid_copy(v4, (const unsigned __int8 *)(v5 + 16));
    v6 = 1;
  }
  else
  {
    v6 = 0;
    *v4 = 0;
  }
  *(_BYTE *)(a3 + 48) = v6;
}

void re::makeCommands(re *this@<X0>, uint64_t **a2@<X8>)
{
  uint64_t *v5;
  _QWORD *i;
  uint64_t v7;
  id v8;
  int64x2_t *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *Direct;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  int64x2_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *j;
  uint64_t v29;
  id v30;
  int64x2_t *v31;
  id v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  int64x2_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *k;
  uint64_t v51;
  id v52;
  uint64_t *v53;
  unint64_t v54;
  _OWORD *v55;
  _OWORD *v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  char *v66;
  _QWORD *m;
  uint64_t v68;
  id v69;
  uint64_t *v70;
  unint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  void *v80;
  uint64_t *n;
  uint64_t v82;
  id v83;
  uint64_t *v84;
  unint64_t v85;
  unint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  char *v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  char *updated;
  char *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  char *v107;
  char *v108;
  char *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t *ii;
  uint64_t v117;
  id v118;
  uint64_t *v119;
  _OWORD *v120;
  unint64_t v121;
  _OWORD *v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  uint64_t v126;
  unint64_t v127;
  char *v128;
  char *v129;
  char *v130;
  char *v131;
  char *v132;
  _QWORD *jj;
  uint64_t v134;
  id v135;
  uint64_t *v136;
  unint64_t v137;
  unint64_t v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  char *v150;
  char *v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  char *v157;
  char *v158;
  char *v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  uint64_t *kk;
  uint64_t v166;
  id v167;
  uint64_t *v168;
  uint64_t v169;
  _OWORD *v170;
  unint64_t v171;
  __int128 v172;
  _OWORD *v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t v177;
  unint64_t v178;
  char *v179;
  char *v180;
  __int128 v181;
  char *v182;
  char *v183;
  char *v184;
  __int128 v185;
  uint64_t *mm;
  uint64_t v187;
  id v188;
  uint64_t *v189;
  _OWORD *v190;
  unint64_t v191;
  _OWORD *v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t v195;
  uint64_t v196;
  unint64_t v197;
  char *v198;
  char *v199;
  char *v200;
  char *v201;
  char *v202;
  _QWORD *nn;
  uint64_t v204;
  id v205;
  uint64_t *v206;
  unint64_t v207;
  unint64_t v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  char *v212;
  uint64_t v213;
  unint64_t v214;
  unint64_t v215;
  unint64_t v216;
  unint64_t v217;
  char *v218;
  char *v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  char *v223;
  char *v224;
  char *v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  uint64_t *i1;
  uint64_t v230;
  id v231;
  uint64_t *v232;
  unint64_t v233;
  unint64_t v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  char *v238;
  uint64_t v239;
  uint64_t v240;
  unint64_t v241;
  unint64_t v242;
  unint64_t v243;
  char *v244;
  void **v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  char *v249;
  char *v250;
  void **v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  uint64_t *i2;
  uint64_t v256;
  id v257;
  uint64_t *v258;
  _OWORD *v259;
  unint64_t v260;
  _OWORD *v261;
  uint64_t v262;
  uint64_t v263;
  unint64_t v264;
  uint64_t v265;
  unint64_t v266;
  char *v267;
  char *v268;
  char *v269;
  char *v270;
  char *v271;
  _BYTE v272[32];
  __int128 v273;
  void *v274[2];
  _BYTE __p[32];
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  uint64_t v283;
  uuid_t dst;
  uint64_t v285;
  uint64_t v286;

  v286 = *MEMORY[0x24BDAC8D0];
  re::make::shared::object<re::DirectResourceCommands>(a2);
  v5 = *a2;
  v5[2] = *((_QWORD *)this + 2);
  re::DirectResourceEvent::operator=((xpc_object_t *)v5 + 4, (xpc_object_t *)this + 4);
  re::XPCObject::setValue((xpc_object_t *)*a2 + 3, *((xpc_object_t *)this + 3));
  std::vector<re::CreateDirectPayload>::reserve((char **)*a2 + 32, *((_QWORD *)this + 73) + *((_QWORD *)this + 68));
  std::vector<re::DestroyResource>::reserve((void **)*a2 + 35, *((_QWORD *)this + 78));
  for (i = (_QWORD *)*((_QWORD *)this + 67); i; i = (_QWORD *)*i)
  {
    v7 = i[4];
    if (v7)
      v8 = (id)(v7 + 8);
    v9 = (int64x2_t *)*a2;
    uuid_copy(dst, (const unsigned __int8 *)(v7 + 16));
    v285 = v7;
    if (v7)
      v10 = (id)(v7 + 8);
    v12 = v9[16].u64[1];
    v11 = v9[17].u64[0];
    if (v12 >= v11)
    {
      v13 = v9[16].i64[0];
      v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - v13) >> 3);
      v15 = v14 + 1;
      if (v14 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_256:
        abort();
      v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v13) >> 3);
      if (2 * v16 > v15)
        v15 = 2 * v16;
      if (v16 >= 0x555555555555555)
        v17 = 0xAAAAAAAAAAAAAAALL;
      else
        v17 = v15;
      *(_QWORD *)&v273 = v9 + 17;
      Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectPayload>>((uint64_t)v9[17].i64, v17);
      v20 = &Direct[24 * v14];
      *(_OWORD *)v20 = *(_OWORD *)dst;
      *((_QWORD *)v20 + 2) = v285;
      v285 = 0;
      v22 = v9[16].i64[0];
      v21 = v9[16].u64[1];
      if (v21 == v22)
      {
        v24 = vdupq_n_s64(v21);
        v23 = &Direct[24 * v14];
      }
      else
      {
        v23 = &Direct[24 * v14];
        do
        {
          *(_OWORD *)(v23 - 24) = *(_OWORD *)(v21 - 24);
          *((_QWORD *)v23 - 1) = *(_QWORD *)(v21 - 8);
          v23 -= 24;
          *(_QWORD *)(v21 - 8) = 0;
          v21 -= 24;
        }
        while (v21 != v22);
        v24 = v9[16];
      }
      v25 = v20 + 24;
      v9[16].i64[0] = (uint64_t)v23;
      v9[16].i64[1] = (uint64_t)(v20 + 24);
      *(int64x2_t *)&v272[8] = v24;
      v26 = v9[17].i64[0];
      v9[17].i64[0] = (uint64_t)&Direct[24 * v19];
      *(_QWORD *)&v272[24] = v26;
      *(_QWORD *)v272 = v24.i64[0];
      std::__split_buffer<re::CreateDirectPayload>::~__split_buffer((uint64_t)v272);
      v27 = v285;
      v9[16].i64[1] = (uint64_t)v25;
      if (v27)

    }
    else
    {
      *(_OWORD *)v12 = *(_OWORD *)dst;
      *(_QWORD *)(v12 + 16) = v285;
      v9[16].i64[1] = v12 + 24;
    }
    if (v7)

  }
  for (j = (_QWORD *)*((_QWORD *)this + 72); j; j = (_QWORD *)*j)
  {
    v29 = j[4];
    if (v29)
      v30 = (id)(v29 + 8);
    v31 = (int64x2_t *)*a2;
    uuid_copy(dst, (const unsigned __int8 *)(v29 + 16));
    v285 = v29;
    if (v29)
      v32 = (id)(v29 + 8);
    v34 = v31[16].u64[1];
    v33 = v31[17].u64[0];
    if (v34 >= v33)
    {
      v35 = v31[16].i64[0];
      v36 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v34 - v35) >> 3);
      v37 = v36 + 1;
      if (v36 + 1 > 0xAAAAAAAAAAAAAAALL)
        goto LABEL_256;
      v38 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v33 - v35) >> 3);
      if (2 * v38 > v37)
        v37 = 2 * v38;
      if (v38 >= 0x555555555555555)
        v39 = 0xAAAAAAAAAAAAAAALL;
      else
        v39 = v37;
      *(_QWORD *)&v273 = v31 + 17;
      v40 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectPayload>>((uint64_t)v31[17].i64, v39);
      v42 = &v40[24 * v36];
      *(_OWORD *)v42 = *(_OWORD *)dst;
      *((_QWORD *)v42 + 2) = v285;
      v285 = 0;
      v44 = v31[16].i64[0];
      v43 = v31[16].u64[1];
      if (v43 == v44)
      {
        v46 = vdupq_n_s64(v43);
        v45 = &v40[24 * v36];
      }
      else
      {
        v45 = &v40[24 * v36];
        do
        {
          *(_OWORD *)(v45 - 24) = *(_OWORD *)(v43 - 24);
          *((_QWORD *)v45 - 1) = *(_QWORD *)(v43 - 8);
          v45 -= 24;
          *(_QWORD *)(v43 - 8) = 0;
          v43 -= 24;
        }
        while (v43 != v44);
        v46 = v31[16];
      }
      v47 = v42 + 24;
      v31[16].i64[0] = (uint64_t)v45;
      v31[16].i64[1] = (uint64_t)(v42 + 24);
      *(int64x2_t *)&v272[8] = v46;
      v48 = v31[17].i64[0];
      v31[17].i64[0] = (uint64_t)&v40[24 * v41];
      *(_QWORD *)&v272[24] = v48;
      *(_QWORD *)v272 = v46.i64[0];
      std::__split_buffer<re::CreateDirectPayload>::~__split_buffer((uint64_t)v272);
      v49 = v285;
      v31[16].i64[1] = (uint64_t)v47;
      if (v49)

    }
    else
    {
      *(_OWORD *)v34 = *(_OWORD *)dst;
      *(_QWORD *)(v34 + 16) = v285;
      v31[16].i64[1] = v34 + 24;
    }
    if (v29)

  }
  for (k = (uint64_t *)*((_QWORD *)this + 77); k; k = (uint64_t *)*k)
  {
    *(_OWORD *)v272 = *((_OWORD *)k + 1);
    v51 = k[4];
    if (v51)
      v52 = (id)(v51 + 8);
    v53 = *a2;
    v55 = (_OWORD *)(*a2)[36];
    v54 = (*a2)[37];
    if ((unint64_t)v55 >= v54)
    {
      v57 = v53[35];
      v58 = ((uint64_t)v55 - v57) >> 4;
      v59 = v58 + 1;
      if ((unint64_t)(v58 + 1) >> 60)
        goto LABEL_256;
      v60 = v54 - v57;
      if (v60 >> 3 > v59)
        v59 = v60 >> 3;
      if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF0)
        v61 = 0xFFFFFFFFFFFFFFFLL;
      else
        v61 = v59;
      if (v61)
        v62 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>((uint64_t)(v53 + 37), v61);
      else
        v62 = 0;
      v63 = &v62[16 * v58];
      *(_OWORD *)v63 = *(_OWORD *)v272;
      v65 = (char *)v53[35];
      v64 = (char *)v53[36];
      v66 = v63;
      if (v64 != v65)
      {
        do
        {
          *((_OWORD *)v66 - 1) = *((_OWORD *)v64 - 1);
          v66 -= 16;
          v64 -= 16;
        }
        while (v64 != v65);
        v64 = (char *)v53[35];
      }
      v56 = v63 + 16;
      v53[35] = (uint64_t)v66;
      v53[36] = (uint64_t)(v63 + 16);
      v53[37] = (uint64_t)&v62[16 * v61];
      if (v64)
        operator delete(v64);
    }
    else
    {
      *v55 = *(_OWORD *)v272;
      v56 = v55 + 1;
    }
    v53[36] = (uint64_t)v56;
    if (v51)

  }
  for (m = (_QWORD *)*((_QWORD *)this + 7); m; m = (_QWORD *)*m)
  {
    v68 = m[4];
    if (v68)
      v69 = (id)(v68 + 8);
    v70 = *a2;
    re::makeCommand((re *)v68, (uint64_t)v272);
    v71 = v70[6];
    if (v71 >= v70[7])
    {
      v79 = std::vector<re::CreateDirectMesh>::__push_back_slow_path<re::CreateDirectMesh>(v70 + 5, (uint64_t)v272);
      v80 = *(void **)&__p[8];
      v70[6] = v79;
      if (v80)
      {
        *(_QWORD *)&__p[16] = v80;
        operator delete(v80);
      }
    }
    else
    {
      *(_OWORD *)v71 = *(_OWORD *)v272;
      v72 = v273;
      *(_OWORD *)(v71 + 16) = *(_OWORD *)&v272[16];
      *(_OWORD *)(v71 + 32) = v72;
      *(_QWORD *)(v71 + 56) = 0;
      *(_QWORD *)(v71 + 64) = 0;
      *(_QWORD *)(v71 + 48) = 0;
      *(_OWORD *)(v71 + 48) = *(_OWORD *)v274;
      *(_QWORD *)(v71 + 64) = *(_QWORD *)__p;
      *(_QWORD *)(v71 + 72) = 0;
      v274[0] = 0;
      v274[1] = 0;
      *(_QWORD *)__p = 0;
      *(_QWORD *)(v71 + 80) = 0;
      *(_QWORD *)(v71 + 88) = 0;
      *(_OWORD *)(v71 + 72) = *(_OWORD *)&__p[8];
      *(_QWORD *)(v71 + 88) = *(_QWORD *)&__p[24];
      memset(&__p[8], 0, 24);
      v73 = v276;
      v74 = v277;
      v75 = v279;
      *(_OWORD *)(v71 + 128) = v278;
      *(_OWORD *)(v71 + 144) = v75;
      *(_OWORD *)(v71 + 96) = v73;
      *(_OWORD *)(v71 + 112) = v74;
      v76 = v280;
      v77 = v281;
      v78 = v282;
      *(_QWORD *)(v71 + 208) = v283;
      *(_OWORD *)(v71 + 176) = v77;
      *(_OWORD *)(v71 + 192) = v78;
      *(_OWORD *)(v71 + 160) = v76;
      v70[6] = v71 + 216;
    }
    if (v274[0])
    {
      v274[1] = v274[0];
      operator delete(v274[0]);
    }
    if (v68)

  }
  for (n = (uint64_t *)*((_QWORD *)this + 12); n; n = (uint64_t *)*n)
  {
    *(_OWORD *)dst = *((_OWORD *)n + 1);
    v82 = n[4];
    v285 = v82;
    if (v82)
      v83 = (id)(v82 + 8);
    v84 = *a2;
    re::makeCommand(dst, (re::DirectMeshUpdate *)v82, (uint64_t)v272);
    v85 = v84[9];
    v86 = v84[10];
    if (v85 >= v86)
    {
      v94 = v84[8];
      v95 = 0xF0F0F0F0F0F0F0F1 * ((uint64_t)(v85 - v94) >> 3);
      v96 = v95 + 1;
      if (v95 + 1 > 0x1E1E1E1E1E1E1E1)
        goto LABEL_256;
      v97 = 0xF0F0F0F0F0F0F0F1 * ((uint64_t)(v86 - v94) >> 3);
      if (2 * v97 > v96)
        v96 = 2 * v97;
      if (v97 >= 0xF0F0F0F0F0F0F0)
        v98 = 0x1E1E1E1E1E1E1E1;
      else
        v98 = v96;
      if (v98)
        updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectMesh>>((uint64_t)(v84 + 10), v98);
      else
        updated = 0;
      v100 = &updated[136 * v95];
      *(_OWORD *)v100 = *(_OWORD *)v272;
      v101 = *(_OWORD *)&v272[16];
      v102 = v273;
      v103 = *(_OWORD *)__p;
      *((_OWORD *)v100 + 3) = *(_OWORD *)v274;
      *((_OWORD *)v100 + 4) = v103;
      *((_OWORD *)v100 + 1) = v101;
      *((_OWORD *)v100 + 2) = v102;
      v104 = *(_OWORD *)&__p[16];
      v105 = v276;
      v106 = v277;
      *((_QWORD *)v100 + 16) = v278;
      *((_OWORD *)v100 + 6) = v105;
      *((_OWORD *)v100 + 7) = v106;
      *((_OWORD *)v100 + 5) = v104;
      v108 = (char *)v84[8];
      v107 = (char *)v84[9];
      v109 = v100;
      if (v107 != v108)
      {
        do
        {
          *(_OWORD *)(v109 - 136) = *(_OWORD *)(v107 - 136);
          v110 = *(_OWORD *)(v107 - 120);
          v111 = *(_OWORD *)(v107 - 104);
          v112 = *(_OWORD *)(v107 - 88);
          *(_OWORD *)(v109 - 72) = *(_OWORD *)(v107 - 72);
          *(_OWORD *)(v109 - 88) = v112;
          *(_OWORD *)(v109 - 104) = v111;
          *(_OWORD *)(v109 - 120) = v110;
          v113 = *(_OWORD *)(v107 - 56);
          v114 = *(_OWORD *)(v107 - 40);
          v115 = *(_OWORD *)(v107 - 24);
          *((_QWORD *)v109 - 1) = *((_QWORD *)v107 - 1);
          *(_OWORD *)(v109 - 24) = v115;
          *(_OWORD *)(v109 - 40) = v114;
          *(_OWORD *)(v109 - 56) = v113;
          v109 -= 136;
          v107 -= 136;
        }
        while (v107 != v108);
        v107 = (char *)v84[8];
      }
      v93 = v100 + 136;
      v84[8] = (uint64_t)v109;
      v84[9] = (uint64_t)(v100 + 136);
      v84[10] = (uint64_t)&updated[136 * v98];
      if (v107)
        operator delete(v107);
    }
    else
    {
      *(_OWORD *)v85 = *(_OWORD *)v272;
      v87 = *(_OWORD *)&v272[16];
      v88 = v273;
      v89 = *(_OWORD *)__p;
      *(_OWORD *)(v85 + 48) = *(_OWORD *)v274;
      *(_OWORD *)(v85 + 64) = v89;
      *(_OWORD *)(v85 + 16) = v87;
      *(_OWORD *)(v85 + 32) = v88;
      v90 = *(_OWORD *)&__p[16];
      v91 = v276;
      v92 = v277;
      *(_QWORD *)(v85 + 128) = v278;
      *(_OWORD *)(v85 + 96) = v91;
      *(_OWORD *)(v85 + 112) = v92;
      *(_OWORD *)(v85 + 80) = v90;
      v93 = (char *)(v85 + 136);
    }
    v84[9] = (uint64_t)v93;
    if (v82)

  }
  for (ii = (uint64_t *)*((_QWORD *)this + 17); ii; ii = (uint64_t *)*ii)
  {
    *(_OWORD *)v272 = *((_OWORD *)ii + 1);
    v117 = ii[4];
    if (v117)
      v118 = (id)(v117 + 8);
    v119 = *a2;
    v120 = (_OWORD *)(*a2)[12];
    v121 = (*a2)[13];
    if ((unint64_t)v120 >= v121)
    {
      v123 = v119[11];
      v124 = ((uint64_t)v120 - v123) >> 4;
      v125 = v124 + 1;
      if ((unint64_t)(v124 + 1) >> 60)
        goto LABEL_256;
      v126 = v121 - v123;
      if (v126 >> 3 > v125)
        v125 = v126 >> 3;
      if ((unint64_t)v126 >= 0x7FFFFFFFFFFFFFF0)
        v127 = 0xFFFFFFFFFFFFFFFLL;
      else
        v127 = v125;
      if (v127)
        v128 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>((uint64_t)(*a2 + 13), v127);
      else
        v128 = 0;
      v129 = &v128[16 * v124];
      *(_OWORD *)v129 = *(_OWORD *)v272;
      v131 = (char *)v119[11];
      v130 = (char *)v119[12];
      v132 = v129;
      if (v130 != v131)
      {
        do
        {
          *((_OWORD *)v132 - 1) = *((_OWORD *)v130 - 1);
          v132 -= 16;
          v130 -= 16;
        }
        while (v130 != v131);
        v130 = (char *)v119[11];
      }
      v122 = v129 + 16;
      v119[11] = (uint64_t)v132;
      v119[12] = (uint64_t)(v129 + 16);
      v119[13] = (uint64_t)&v128[16 * v127];
      if (v130)
        operator delete(v130);
    }
    else
    {
      *v120 = *(_OWORD *)v272;
      v122 = v120 + 1;
    }
    v119[12] = (uint64_t)v122;
    if (v117)

  }
  for (jj = (_QWORD *)*((_QWORD *)this + 22); jj; jj = (_QWORD *)*jj)
  {
    v134 = jj[4];
    if (v134)
      v135 = (id)(v134 + 8);
    v136 = *a2;
    re::makeCommand((re *)v134, (uint64_t)v272);
    v137 = v136[15];
    v138 = v136[16];
    if (v137 >= v138)
    {
      v145 = v136[14];
      v146 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v137 - v145) >> 3);
      v147 = v146 + 1;
      if ((unint64_t)(v146 + 1) > 0x276276276276276)
        goto LABEL_256;
      v148 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v138 - v145) >> 3);
      if (2 * v148 > v147)
        v147 = 2 * v148;
      if (v148 >= 0x13B13B13B13B13BLL)
        v149 = 0x276276276276276;
      else
        v149 = v147;
      if (v149)
        v150 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectTexture>>((uint64_t)(v136 + 16), v149);
      else
        v150 = 0;
      v151 = &v150[104 * v146];
      v152 = *(_OWORD *)v272;
      v153 = v273;
      *((_OWORD *)v151 + 1) = *(_OWORD *)&v272[16];
      *((_OWORD *)v151 + 2) = v153;
      *(_OWORD *)v151 = v152;
      v154 = *(_OWORD *)v274;
      v155 = *(_OWORD *)__p;
      v156 = *(_OWORD *)&__p[16];
      *((_QWORD *)v151 + 12) = v276;
      *((_OWORD *)v151 + 4) = v155;
      *((_OWORD *)v151 + 5) = v156;
      *((_OWORD *)v151 + 3) = v154;
      v158 = (char *)v136[14];
      v157 = (char *)v136[15];
      v159 = v151;
      if (v157 != v158)
      {
        do
        {
          v160 = *(_OWORD *)(v157 - 104);
          v161 = *(_OWORD *)(v157 - 88);
          *(_OWORD *)(v159 - 72) = *(_OWORD *)(v157 - 72);
          *(_OWORD *)(v159 - 88) = v161;
          *(_OWORD *)(v159 - 104) = v160;
          v162 = *(_OWORD *)(v157 - 56);
          v163 = *(_OWORD *)(v157 - 40);
          v164 = *(_OWORD *)(v157 - 24);
          *((_QWORD *)v159 - 1) = *((_QWORD *)v157 - 1);
          *(_OWORD *)(v159 - 24) = v164;
          *(_OWORD *)(v159 - 40) = v163;
          *(_OWORD *)(v159 - 56) = v162;
          v159 -= 104;
          v157 -= 104;
        }
        while (v157 != v158);
        v157 = (char *)v136[14];
      }
      v144 = v151 + 104;
      v136[14] = (uint64_t)v159;
      v136[15] = (uint64_t)(v151 + 104);
      v136[16] = (uint64_t)&v150[104 * v149];
      if (v157)
        operator delete(v157);
    }
    else
    {
      v139 = *(_OWORD *)v272;
      v140 = v273;
      *(_OWORD *)(v137 + 16) = *(_OWORD *)&v272[16];
      *(_OWORD *)(v137 + 32) = v140;
      *(_OWORD *)v137 = v139;
      v141 = *(_OWORD *)v274;
      v142 = *(_OWORD *)__p;
      v143 = *(_OWORD *)&__p[16];
      *(_QWORD *)(v137 + 96) = v276;
      *(_OWORD *)(v137 + 64) = v142;
      *(_OWORD *)(v137 + 80) = v143;
      *(_OWORD *)(v137 + 48) = v141;
      v144 = (char *)(v137 + 104);
    }
    v136[15] = (uint64_t)v144;
    if (v134)

  }
  for (kk = (uint64_t *)*((_QWORD *)this + 27); kk; kk = (uint64_t *)*kk)
  {
    *(_OWORD *)dst = *((_OWORD *)kk + 1);
    v166 = kk[4];
    if (v166)
      v167 = (id)(v166 + 8);
    v168 = *a2;
    *(_OWORD *)v272 = *(_OWORD *)dst;
    v169 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v166 + 40))(v166, 3, 0);
    uuid_copy(&v272[16], (const unsigned __int8 *)(v169 + 16));
    v170 = (_OWORD *)v168[18];
    v171 = v168[19];
    if ((unint64_t)v170 >= v171)
    {
      v174 = v168[17];
      v175 = ((uint64_t)v170 - v174) >> 5;
      v176 = v175 + 1;
      if ((unint64_t)(v175 + 1) >> 59)
        goto LABEL_256;
      v177 = v171 - v174;
      if (v177 >> 4 > v176)
        v176 = v177 >> 4;
      if ((unint64_t)v177 >= 0x7FFFFFFFFFFFFFE0)
        v178 = 0x7FFFFFFFFFFFFFFLL;
      else
        v178 = v176;
      if (v178)
        v179 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>((uint64_t)(v168 + 19), v178);
      else
        v179 = 0;
      v180 = &v179[32 * v175];
      v181 = *(_OWORD *)&v272[16];
      *(_OWORD *)v180 = *(_OWORD *)v272;
      *((_OWORD *)v180 + 1) = v181;
      v183 = (char *)v168[17];
      v182 = (char *)v168[18];
      v184 = v180;
      if (v182 != v183)
      {
        do
        {
          v185 = *((_OWORD *)v182 - 1);
          *((_OWORD *)v184 - 2) = *((_OWORD *)v182 - 2);
          *((_OWORD *)v184 - 1) = v185;
          v184 -= 32;
          v182 -= 32;
        }
        while (v182 != v183);
        v182 = (char *)v168[17];
      }
      v173 = v180 + 32;
      v168[17] = (uint64_t)v184;
      v168[18] = (uint64_t)(v180 + 32);
      v168[19] = (uint64_t)&v179[32 * v178];
      if (v182)
        operator delete(v182);
    }
    else
    {
      v172 = *(_OWORD *)&v272[16];
      *v170 = *(_OWORD *)v272;
      v170[1] = v172;
      v173 = v170 + 2;
    }
    v168[18] = (uint64_t)v173;

  }
  for (mm = (uint64_t *)*((_QWORD *)this + 32); mm; mm = (uint64_t *)*mm)
  {
    *(_OWORD *)v272 = *((_OWORD *)mm + 1);
    v187 = mm[4];
    if (v187)
      v188 = (id)(v187 + 8);
    v189 = *a2;
    v190 = (_OWORD *)(*a2)[21];
    v191 = (*a2)[22];
    if ((unint64_t)v190 >= v191)
    {
      v193 = v189[20];
      v194 = ((uint64_t)v190 - v193) >> 4;
      v195 = v194 + 1;
      if ((unint64_t)(v194 + 1) >> 60)
        goto LABEL_256;
      v196 = v191 - v193;
      if (v196 >> 3 > v195)
        v195 = v196 >> 3;
      if ((unint64_t)v196 >= 0x7FFFFFFFFFFFFFF0)
        v197 = 0xFFFFFFFFFFFFFFFLL;
      else
        v197 = v195;
      if (v197)
        v198 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>((uint64_t)(*a2 + 22), v197);
      else
        v198 = 0;
      v199 = &v198[16 * v194];
      *(_OWORD *)v199 = *(_OWORD *)v272;
      v201 = (char *)v189[20];
      v200 = (char *)v189[21];
      v202 = v199;
      if (v200 != v201)
      {
        do
        {
          *((_OWORD *)v202 - 1) = *((_OWORD *)v200 - 1);
          v202 -= 16;
          v200 -= 16;
        }
        while (v200 != v201);
        v200 = (char *)v189[20];
      }
      v192 = v199 + 16;
      v189[20] = (uint64_t)v202;
      v189[21] = (uint64_t)(v199 + 16);
      v189[22] = (uint64_t)&v198[16 * v197];
      if (v200)
        operator delete(v200);
    }
    else
    {
      *v190 = *(_OWORD *)v272;
      v192 = v190 + 1;
    }
    v189[21] = (uint64_t)v192;
    if (v187)

  }
  for (nn = (_QWORD *)*((_QWORD *)this + 37); nn; nn = (_QWORD *)*nn)
  {
    v204 = nn[4];
    if (v204)
      v205 = (id)(v204 + 8);
    v206 = *a2;
    re::makeCommand((re *)v204, (uint64_t)v272);
    v207 = v206[24];
    v208 = v206[25];
    if (v207 >= v208)
    {
      v213 = v206[23];
      v214 = 0x8E38E38E38E38E39 * ((uint64_t)(v207 - v213) >> 3);
      v215 = v214 + 1;
      if (v214 + 1 > 0x38E38E38E38E38ELL)
        goto LABEL_256;
      v216 = 0x8E38E38E38E38E39 * ((uint64_t)(v208 - v213) >> 3);
      if (2 * v216 > v215)
        v215 = 2 * v216;
      if (v216 >= 0x1C71C71C71C71C7)
        v217 = 0x38E38E38E38E38ELL;
      else
        v217 = v215;
      if (v217)
        v218 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectBuffer>>((uint64_t)(v206 + 25), v217);
      else
        v218 = 0;
      v219 = &v218[72 * v214];
      *(_OWORD *)v219 = *(_OWORD *)v272;
      v220 = *(_OWORD *)&v272[16];
      v221 = v273;
      v222 = *(_OWORD *)v274;
      *((_QWORD *)v219 + 8) = *(_QWORD *)__p;
      *((_OWORD *)v219 + 2) = v221;
      *((_OWORD *)v219 + 3) = v222;
      *((_OWORD *)v219 + 1) = v220;
      v224 = (char *)v206[23];
      v223 = (char *)v206[24];
      v225 = v219;
      if (v223 != v224)
      {
        do
        {
          *(_OWORD *)(v225 - 72) = *(_OWORD *)(v223 - 72);
          v226 = *(_OWORD *)(v223 - 56);
          v227 = *(_OWORD *)(v223 - 40);
          v228 = *(_OWORD *)(v223 - 24);
          *((_QWORD *)v225 - 1) = *((_QWORD *)v223 - 1);
          *(_OWORD *)(v225 - 24) = v228;
          *(_OWORD *)(v225 - 40) = v227;
          *(_OWORD *)(v225 - 56) = v226;
          v225 -= 72;
          v223 -= 72;
        }
        while (v223 != v224);
        v223 = (char *)v206[23];
      }
      v212 = v219 + 72;
      v206[23] = (uint64_t)v225;
      v206[24] = (uint64_t)(v219 + 72);
      v206[25] = (uint64_t)&v218[72 * v217];
      if (v223)
        operator delete(v223);
    }
    else
    {
      *(_OWORD *)v207 = *(_OWORD *)v272;
      v209 = *(_OWORD *)&v272[16];
      v210 = v273;
      v211 = *(_OWORD *)v274;
      *(_QWORD *)(v207 + 64) = *(_QWORD *)__p;
      *(_OWORD *)(v207 + 32) = v210;
      *(_OWORD *)(v207 + 48) = v211;
      *(_OWORD *)(v207 + 16) = v209;
      v212 = (char *)(v207 + 72);
    }
    v206[24] = (uint64_t)v212;
    if (v204)

  }
  for (i1 = (uint64_t *)*((_QWORD *)this + 42); i1; i1 = (uint64_t *)*i1)
  {
    *(_OWORD *)dst = *((_OWORD *)i1 + 1);
    v230 = i1[4];
    v285 = v230;
    if (v230)
      v231 = (id)(v230 + 8);
    v232 = *a2;
    re::makeCommand(dst, v230, (uint64_t)v272);
    v233 = v232[27];
    v234 = v232[28];
    if (v233 >= v234)
    {
      v239 = v232[26];
      v240 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v233 - v239) >> 3);
      v241 = v240 + 1;
      if ((unint64_t)(v240 + 1) > 0x492492492492492)
        goto LABEL_256;
      v242 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v234 - v239) >> 3);
      if (2 * v242 > v241)
        v241 = 2 * v242;
      if (v242 >= 0x249249249249249)
        v243 = 0x492492492492492;
      else
        v243 = v241;
      if (v243)
        v244 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>((uint64_t)(v232 + 28), v243);
      else
        v244 = 0;
      v245 = (void **)&v244[56 * v240];
      v246 = *(_OWORD *)v272;
      v247 = *(_OWORD *)&v272[16];
      v248 = v273;
      v245[6] = v274[0];
      *((_OWORD *)v245 + 1) = v247;
      *((_OWORD *)v245 + 2) = v248;
      *(_OWORD *)v245 = v246;
      v250 = (char *)v232[26];
      v249 = (char *)v232[27];
      v251 = v245;
      if (v249 != v250)
      {
        do
        {
          v252 = *(_OWORD *)(v249 - 56);
          v253 = *(_OWORD *)(v249 - 40);
          v254 = *(_OWORD *)(v249 - 24);
          *(v251 - 1) = (void *)*((_QWORD *)v249 - 1);
          *(_OWORD *)(v251 - 3) = v254;
          *(_OWORD *)(v251 - 5) = v253;
          *(_OWORD *)(v251 - 7) = v252;
          v251 -= 7;
          v249 -= 56;
        }
        while (v249 != v250);
        v249 = (char *)v232[26];
      }
      v238 = (char *)(v245 + 7);
      v232[26] = (uint64_t)v251;
      v232[27] = (uint64_t)(v245 + 7);
      v232[28] = (uint64_t)&v244[56 * v243];
      if (v249)
        operator delete(v249);
    }
    else
    {
      v235 = *(_OWORD *)v272;
      v236 = *(_OWORD *)&v272[16];
      v237 = v273;
      *(void **)(v233 + 48) = v274[0];
      *(_OWORD *)(v233 + 16) = v236;
      *(_OWORD *)(v233 + 32) = v237;
      *(_OWORD *)v233 = v235;
      v238 = (char *)(v233 + 56);
    }
    v232[27] = (uint64_t)v238;
    if (v230)

  }
  for (i2 = (uint64_t *)*((_QWORD *)this + 47); i2; i2 = (uint64_t *)*i2)
  {
    *(_OWORD *)v272 = *((_OWORD *)i2 + 1);
    v256 = i2[4];
    if (v256)
      v257 = (id)(v256 + 8);
    v258 = *a2;
    v259 = (_OWORD *)(*a2)[30];
    v260 = (*a2)[31];
    if ((unint64_t)v259 >= v260)
    {
      v262 = v258[29];
      v263 = ((uint64_t)v259 - v262) >> 4;
      v264 = v263 + 1;
      if ((unint64_t)(v263 + 1) >> 60)
        goto LABEL_256;
      v265 = v260 - v262;
      if (v265 >> 3 > v264)
        v264 = v265 >> 3;
      if ((unint64_t)v265 >= 0x7FFFFFFFFFFFFFF0)
        v266 = 0xFFFFFFFFFFFFFFFLL;
      else
        v266 = v264;
      if (v266)
        v267 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>((uint64_t)(*a2 + 31), v266);
      else
        v267 = 0;
      v268 = &v267[16 * v263];
      *(_OWORD *)v268 = *(_OWORD *)v272;
      v270 = (char *)v258[29];
      v269 = (char *)v258[30];
      v271 = v268;
      if (v269 != v270)
      {
        do
        {
          *((_OWORD *)v271 - 1) = *((_OWORD *)v269 - 1);
          v271 -= 16;
          v269 -= 16;
        }
        while (v269 != v270);
        v269 = (char *)v258[29];
      }
      v261 = v268 + 16;
      v258[29] = (uint64_t)v271;
      v258[30] = (uint64_t)(v268 + 16);
      v258[31] = (uint64_t)&v267[16 * v266];
      if (v269)
        operator delete(v269);
    }
    else
    {
      *v259 = *(_OWORD *)v272;
      v261 = v259 + 1;
    }
    v258[30] = (uint64_t)v261;
    if (v256)

  }
}

uint64_t re::DirectResourceLoader::missingPayload(re *a1, re *a2, re *a3, unsigned int a4, int a5, uint64_t a6)
{
  NSObject *v12;
  const char *v14;
  const char *v15;
  char v16[37];
  char v17[37];
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v12 = re::directResourceLog(a1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    re::toString(a3, v17);
    v14 = re::toString(a4);
    v15 = re::toString(a5);
    re::toString(a2, v16);
    *(_DWORD *)buf = 136316162;
    v19 = v17;
    v20 = 2080;
    v21 = v14;
    v22 = 2080;
    v23 = v15;
    v24 = 2048;
    v25 = a6;
    v26 = 2080;
    v27 = v16;
    _os_log_error_impl(&dword_23A4DF000, v12, OS_LOG_TYPE_ERROR, "MissingPayload %s for %s.%s[%zu] %s", buf, 0x34u);
  }
  *(_BYTE *)a1 = 0;
  return 0;
}

uint64_t re::DirectResourceLoader::corruptResource(re *a1, re *a2)
{
  NSObject *v4;

  v4 = re::directResourceLog(a1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    re::DirectResourceLoader::corruptResource(a2, v4);
  *(_BYTE *)a1 = 0;
  return 0;
}

uint64_t re::DirectResourceLoader::setPayload(re *a1, const unsigned __int8 *a2, uint64_t a3, uint64_t a4, re *a5)
{
  uint64_t v6;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v16;
  uint64_t v17;
  uuid_t dst;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)a5 + 16))
    return 1;
  v6 = *((_QWORD *)a1 + 4);
  if (v6)
  {
    v11 = (*(uint64_t (**)(uint64_t, re *))(*(_QWORD *)v6 + 48))(v6, a5);
    if (v11)
    {
      v17 = v11;
      v12 = (id)(v11 + 8);
      v13 = (*(uint64_t (**)(const unsigned __int8 *, uint64_t, uint64_t, uint64_t *))(*(_QWORD *)a2 + 56))(a2, a3, a4, &v17);
      if (v17)

    }
    else
    {
      uuid_copy(dst, a2 + 16);
      v14 = (*(uint64_t (**)(const unsigned __int8 *))(*(_QWORD *)a2 + 40))(a2);
      re::DirectResourceLoader::missingPayload(a1, (re *)dst, a5, v14, a3, a4);
      return 0;
    }
    return v13;
  }
  v16 = std::__throw_bad_function_call[abi:nn180100]();
  return re::DirectResourceLoader::setUpdatePayload(v16);
}

void re::DirectResourceLoader::setUpdatePayload(re *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, re *a7)
{
  uint64_t v8;
  uint64_t v13;
  id v14;
  unsigned int v15;
  uint64_t v16;
  re *v17;
  unsigned __int8 **v18;
  uint64_t v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v20[0] = a2;
  v20[1] = a3;
  if (*((_BYTE *)a7 + 16))
  {
    v8 = *((_QWORD *)a1 + 4);
    if (v8)
    {
      v13 = (*(uint64_t (**)(uint64_t, re *))(*(_QWORD *)v8 + 48))(v8, a7);
      if (v13)
      {
        v19 = v13;
        v14 = (id)(v13 + 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(_QWORD *)a4 + 48))(a4, a5, a6, &v19);
        if (v19)

      }
      else
      {
        v15 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a4 + 64))(a4);
        re::DirectResourceLoader::missingPayload(a1, (re *)v20, a7, v15, a5, a6);
      }
    }
    else
    {
      v16 = std::__throw_bad_function_call[abi:nn180100]();
      re::load(v16, v17, v18);
    }
  }
}

void re::load(uint64_t a1@<X0>, re *a2@<X1>, unsigned __int8 **a3@<X8>)
{
  uint64_t v6;
  unsigned __int8 *v7;
  re::DirectResource *v8;
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  re *v14;
  const re::DirectMesh *v15;
  uint64_t v16;

  v6 = a1 + 16;
  if ((re::DirectMeshValidation::isWellFormed(a1 + 16) & 1) == 0)
  {
    re::DirectResourceLoader::corruptResource(a2, (re *)a1);
    *a3 = 0;
    return;
  }
  v7 = (unsigned __int8 *)operator new(0xB8uLL);
  v8 = (re::DirectResource *)re::DirectMesh::DirectMesh(v7, v6);
  v9.n128_f64[0] = re::DirectResource::setIdentifier(v8, (const unsigned __int8 (*)[16])a1);
  if (*(_BYTE *)(a1 + 128))
  {
    v10 = *((_QWORD *)a2 + 4);
    if (!v10)
    {
      v16 = std::__throw_bad_function_call[abi:nn180100]();
      re::load(v16);
      return;
    }
    if (*(_BYTE *)(a1 + 104))
      v11 = *(_QWORD *)(a1 + 96);
    else
      v11 = 0;
    v12 = (*(uint64_t (**)(uint64_t, uint64_t, __n128))(*(_QWORD *)v10 + 48))(v10, a1 + 112, v9);
    re::DirectMesh::setParts((uint64_t)v7, v11, v12);
  }
  re::DirectResourceLoader::setPayload(a2, v7, 1, 0, (re *)(a1 + 129));
  v13 = 0;
  v14 = (re *)(a1 + 146);
  do
  {
    re::DirectResourceLoader::setPayload(a2, v7, 2, v13++, v14);
    v14 = (re *)((char *)v14 + 17);
  }
  while (v13 != 4);
  if (re::DirectMeshValidation::isValid((re::DirectMeshValidation *)v7, v15))
  {
    *a3 = v7;
  }
  else
  {
    re::DirectResourceLoader::corruptResource(a2, (re *)a1);
    *a3 = 0;

  }
}

void re::load(uint64_t a1@<X0>, re *a2@<X1>, _QWORD *a3@<X8>)
{
  re::DirectMeshUpdate *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  re *v10;

  v6 = (re::DirectMeshUpdate *)operator new(0x40uLL);
  re::DirectMeshUpdate::DirectMeshUpdate(v6);
  *a3 = v7;
  if (*(_BYTE *)(a1 + 24))
  {
    v8 = *(_QWORD *)(a1 + 8);
    *((_QWORD *)v6 + 2) = *(_QWORD *)(a1 + 16);
    re::DirectResourceLoader::setUpdatePayload(a2, *(_QWORD *)a1, v8, (uint64_t)v6, 0, 0, (re *)(a1 + 32));
  }
  re::DirectResourceLoader::setUpdatePayload(a2, *(_QWORD *)a1, *(_QWORD *)(a1 + 8), (uint64_t)v6, 1, 0, (re *)(a1 + 49));
  v9 = 0;
  v10 = (re *)(a1 + 66);
  do
  {
    re::DirectResourceLoader::setUpdatePayload(a2, *(_QWORD *)a1, *(_QWORD *)(a1 + 8), (uint64_t)v6, 2, v9++, v10);
    v10 = (re *)((char *)v10 + 17);
  }
  while (v9 != 4);
}

{
  re::DirectContentsUpdate *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = (re::DirectContentsUpdate *)operator new(0x18uLL);
  *((_QWORD *)v6 + 1) = 0;
  *((_QWORD *)v6 + 2) = 0;
  *(_QWORD *)v6 = 0;
  re::DirectContentsUpdate::DirectContentsUpdate(v6);
  *v7 = &unk_250B65128;
  *a3 = v7;
  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_OWORD *)(a1 + 16);
  v11 = 1;
  re::DirectResourceLoader::setUpdatePayload(a2, v8, v9, (uint64_t)v6, 3, 0, (re *)&v10);
}

uint64_t re::load@<X0>(uint64_t a1@<X0>, re *a2@<X1>, const unsigned __int8 **a3@<X8>)
{
  uint64_t v6;
  const unsigned __int8 *v7;
  re::DirectResource *v8;
  uint64_t result;
  __int128 v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a1 + 16;
  if ((re::DirectTextureValidation::isWellFormed() & 1) != 0)
  {
    v7 = (const unsigned __int8 *)operator new(0x88uLL);
    v8 = (re::DirectResource *)re::DirectTexture::DirectTexture(v7, v6);
    re::DirectResource::setIdentifier(v8, (const unsigned __int8 (*)[16])a1);
    v10 = *(_OWORD *)(a1 + 88);
    v11 = 1;
    result = re::DirectResourceLoader::setPayload(a2, v7, 3, 0, (re *)&v10);
  }
  else
  {
    result = re::DirectResourceLoader::corruptResource(a2, (re *)a1);
    v7 = 0;
  }
  *a3 = v7;
  return result;
}

void re::load(__n128 *a1@<X0>, re *a2@<X1>, _QWORD *a3@<X8>)
{
  __n128 *v6;
  char *v7;
  re::DirectResource *v8;
  unint64_t v9;
  const re::DirectBuffer *v10;

  v6 = a1 + 1;
  if (re::DirectBufferValidation::isWellFormed((__n128 *)a1[1].n128_u64))
  {
    v7 = (char *)operator new(0x58uLL);
    re::DirectBuffer::DirectBuffer((re::DirectResource *)v7, v6);
    re::DirectResource::setIdentifier(v8, (const unsigned __int8 (*)[16])a1);
    if (a1[2].n128_u8[8])
      v9 = a1[2].n128_u64[0];
    else
      v9 = 0;
    re::DirectBuffer::setBytesUsed((re::DirectBuffer *)v7, v9);
    re::DirectResourceLoader::setPayload(a2, (const unsigned __int8 *)v7, 3, 0, (re *)&a1[3]);
    if (re::DirectBufferValidation::isValid((re::DirectBufferValidation *)v7, v10))
    {
      *a3 = v7;
    }
    else
    {
      re::DirectResourceLoader::corruptResource(a2, (re *)a1);
      *a3 = 0;

    }
  }
  else
  {
    re::DirectResourceLoader::corruptResource(a2, (re *)a1);
    *a3 = 0;
  }
}

void re::load(uint64_t *a1@<X0>, re *a2@<X1>, _QWORD *a3@<X8>)
{
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = operator new(0x28uLL);
  *v6 = 0u;
  v6[1] = 0u;
  *((_QWORD *)v6 + 4) = 0;
  re::DirectContentsUpdate::DirectContentsUpdate((re::DirectContentsUpdate *)v6);
  *(_QWORD *)v7 = &unk_250B65198;
  *a3 = v7;
  v8 = a1[3];
  *(_QWORD *)(v7 + 24) = a1[2];
  *(_BYTE *)(v7 + 32) = v8;
  re::DirectResourceLoader::setUpdatePayload(a2, *a1, a1[1], (uint64_t)v6, 3, 0, (re *)(a1 + 4));
}

void re::load(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  unsigned __int8 *v12;
  unsigned __int8 *j;
  char *v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  unsigned __int8 *v20;
  unsigned __int8 *k;
  unsigned __int8 *v22;
  unsigned __int8 *m;
  unsigned __int8 *v24;
  unsigned __int8 *n;
  unsigned __int8 *v26;
  unsigned __int8 *ii;
  unsigned __int8 *v28;
  unsigned __int8 *jj;
  unsigned __int8 *v30;
  unsigned __int8 *v31;
  _QWORD *v32;
  __n128 *v33;
  __n128 *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *v37;
  _QWORD *v38;
  unsigned __int8 *v39;
  unsigned __int8 *v40;
  _QWORD *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const unsigned __int8 *v50;
  uint64_t v51;
  uint64_t v52;
  unsigned __int8 *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[3];
  _QWORD *v57;
  char *v58;
  char v59[8];
  _BYTE v60[24];
  _BYTE *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)operator new(0x280uLL);
  v7 = re::DirectResourcesCommit::DirectResourcesCommit((re::DirectResourcesCommit *)v6);
  *a3 = v7;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(a1 + 16);
  re::DirectResourceEvent::operator=((xpc_object_t *)(v7 + 32), (xpc_object_t *)(a1 + 32));
  re::XPCObject::setValue((xpc_object_t *)v6 + 3, *(xpc_object_t *)(a1 + 24));
  v8 = *(_QWORD *)(a1 + 256);
  for (i = *(_QWORD *)(a1 + 264); v8 != i; v8 += 24)
  {
    v10 = *(_QWORD *)(v8 + 16);
    v55 = v10;
    if (v10)
      v11 = (id)(v10 + 8);
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create((uint64_t *)v6 + 65, (unsigned __int8 *)v8, &v55);
    if (v55)
    {

      v55 = 0;
    }
  }
  v12 = *(unsigned __int8 **)(a1 + 280);
  for (j = *(unsigned __int8 **)(a1 + 288); v12 != j; v12 += 16)
  {
    v54 = 0;
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy((_QWORD *)v6 + 65, v12, &v54);
    if (v54)
    {

      v54 = 0;
    }
  }
  std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__value_func[abi:nn180100]((uint64_t)v56, a2);
  v58 = v6;
  v14 = v6 + 8;
  v15 = operator new(0x30uLL);
  v16 = v15;
  *v15 = &off_250B65000;
  v17 = v15 + 1;
  if (!v57)
  {
    v18 = v15 + 4;
    goto LABEL_15;
  }
  if (v57 != v56)
  {
    v18 = &v57;
    v15[4] = v57;
LABEL_15:
    *v18 = 0;
    v15[5] = v58;
    v58 = 0;
    v59[0] = 1;
    v19 = v60;
    v61 = v15;
    goto LABEL_16;
  }
  v15[4] = v17;
  (*(void (**)(_QWORD *))(v56[0] + 24))(v56);
  v43 = v57;
  v16[5] = v58;
  v58 = 0;
  v59[0] = 1;
  v19 = v60;
  v61 = v16;
  if (v43 == v56)
  {
    v44 = 4;
    v43 = v56;
  }
  else
  {
    if (!v43)
      goto LABEL_16;
    v44 = 5;
  }
  (*(void (**)(void))(*v43 + 8 * v44))();
LABEL_16:
  v20 = *(unsigned __int8 **)(a1 + 40);
  for (k = *(unsigned __int8 **)(a1 + 48); v20 != k; v20 += 216)
  {
    re::load((uint64_t)v20, (re *)v59, &v53);
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create((uint64_t *)v6 + 5, v20, (uint64_t *)&v53);
    if (v53)
    {

      v53 = 0;
    }
  }
  v22 = *(unsigned __int8 **)(a1 + 64);
  for (m = *(unsigned __int8 **)(a1 + 72); v22 != m; v22 += 136)
  {
    re::load((uint64_t)v22, (re *)v59, &v52);
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::setUpdate((_QWORD *)v6 + 5, v22, &v52);
    if (v52)
    {

      v52 = 0;
    }
  }
  v24 = *(unsigned __int8 **)(a1 + 88);
  for (n = *(unsigned __int8 **)(a1 + 96); v24 != n; v24 += 16)
  {
    v51 = 0;
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy((_QWORD *)v6 + 5, v24, &v51);
    if (v51)
    {

      v51 = 0;
    }
  }
  v26 = *(unsigned __int8 **)(a1 + 112);
  for (ii = *(unsigned __int8 **)(a1 + 120); v26 != ii; v26 += 104)
  {
    re::load((uint64_t)v26, (re *)v59, &v50);
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create((uint64_t *)v6 + 20, v26, (uint64_t *)&v50);
    if (v50)
    {

      v50 = 0;
    }
  }
  v28 = *(unsigned __int8 **)(a1 + 136);
  for (jj = *(unsigned __int8 **)(a1 + 144); v28 != jj; v28 += 32)
  {
    re::load((uint64_t)v28, (re *)v59, &v49);
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::setUpdate((_QWORD *)v6 + 20, v28, &v49);
    if (v49)
    {

      v49 = 0;
    }
  }
  v30 = *(unsigned __int8 **)(a1 + 160);
  v31 = *(unsigned __int8 **)(a1 + 168);
  if (v30 != v31)
  {
    v32 = v6 + 160;
    do
    {
      v48 = 0;
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy(v32, v30, &v48);
      if (v48)
      {

        v48 = 0;
      }
      v30 += 16;
    }
    while (v30 != v31);
  }
  v33 = *(__n128 **)(a1 + 184);
  v34 = *(__n128 **)(a1 + 192);
  if (v33 != v34)
  {
    v35 = (uint64_t *)(*a3 + 280);
    do
    {
      re::load(v33, (re *)v59, &v47);
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create(v35, (unsigned __int8 *)v33, &v47);
      if (v47)
      {

        v47 = 0;
      }
      v33 = (__n128 *)((char *)v33 + 72);
    }
    while (v33 != v34);
  }
  v36 = *(uint64_t **)(a1 + 208);
  v37 = *(uint64_t **)(a1 + 216);
  if (v36 != v37)
  {
    v38 = (_QWORD *)(*a3 + 280);
    do
    {
      re::load(v36, (re *)v59, &v46);
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::setUpdate(v38, (unsigned __int8 *)v36, &v46);
      if (v46)
      {

        v46 = 0;
      }
      v36 += 7;
    }
    while (v36 != v37);
  }
  v40 = *(unsigned __int8 **)(a1 + 232);
  v39 = *(unsigned __int8 **)(a1 + 240);
  if (v40 != v39)
  {
    v41 = (_QWORD *)(*a3 + 280);
    do
    {
      v45 = 0;
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy(v41, v40, &v45);
      if (v45)
      {

        v45 = 0;
      }
      v40 += 16;
    }
    while (v40 != v39);
  }
  if (v61 == v60)
  {
    v42 = 4;
  }
  else
  {
    if (!v61)
      return;
    v42 = 5;
    v19 = v61;
  }
  (*(void (**)(_QWORD *, _QWORD *))(*v19 + 8 * v42))(v19, v17);
}

_QWORD *std::vector<re::DirectMeshVertexAttribute>::vector(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  const void *v4;
  int64_t v5;
  char *v6;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = *(const void **)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v5 = v3 - *(_QWORD *)a2;
  if (v3 != *(_QWORD *)a2)
  {
    std::vector<re::DirectMeshVertexAttribute>::__vallocate[abi:nn180100](a1, v5 >> 5);
    v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *std::vector<re::DirectMeshVertexAttribute>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 59)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

_QWORD *std::vector<re::DirectMeshVertexLayout>::vector(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  const void *v4;
  int64_t v5;
  char *v6;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = *(const void **)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v5 = v3 - *(_QWORD *)a2;
  if (v3 != *(_QWORD *)a2)
  {
    std::vector<re::DirectMeshVertexLayout>::__vallocate[abi:nn180100](a1, 0xCCCCCCCCCCCCCCCDLL * (v5 >> 3));
    v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *std::vector<re::DirectMeshVertexLayout>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x666666666666667)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DirectMeshVertexLayout>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

uint64_t std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(_QWORD *)(a1 + 24) = a1;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 24) + 24))(*(_QWORD *)(a2 + 24), a1);
    }
    else
    {
      *(_QWORD *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
    }
  }
  else
  {
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

_QWORD *std::__function::__func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  *a1 = &off_250B65000;
  v2 = a1 + 1;
  v3 = a1[5];
  if (v3)
  {

    a1[5] = 0;
  }
  v4 = (_QWORD *)a1[4];
  if (v4 == v2)
  {
    v5 = 4;
    v4 = v2;
    goto LABEL_7;
  }
  if (v4)
  {
    v5 = 5;
LABEL_7:
    (*(void (**)(void))(*v4 + 8 * v5))();
  }
  return a1;
}

void std::__function::__func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::~__func(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  *a1 = &off_250B65000;
  v2 = a1 + 1;
  v3 = a1[5];
  if (v3)
  {

    a1[5] = 0;
  }
  v4 = (_QWORD *)a1[4];
  if (v4 == v2)
  {
    v5 = 4;
    v4 = v2;
  }
  else
  {
    if (!v4)
      goto LABEL_8;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
LABEL_8:
  JUMPOUT(0x23B84F8E0);
}

_QWORD *std::__function::__func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__clone(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = a1 + 8;
  v2 = operator new(0x30uLL);
  *v2 = &off_250B65000;
  std::__compressed_pair_elem<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,0,false>::__compressed_pair_elem[abi:nn180100]<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> && const&,0ul>((uint64_t)(v2 + 1), v1);
  return v2;
}

uint64_t std::__function::__func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_250B65000;
  return std::__compressed_pair_elem<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,0,false>::__compressed_pair_elem[abi:nn180100]<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> && const&,0ul>((uint64_t)(a2 + 1), a1 + 8);
}

void std::__function::__func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::destroy(uint64_t a1)
{
  std::__function::__alloc_func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::destroy[abi:nn180100]((_QWORD *)(a1 + 8));
}

void std::__function::__func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::destroy_deallocate(_QWORD *a1)
{
  std::__function::__alloc_func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::destroy[abi:nn180100](a1 + 1);
  operator delete(a1);
}

uint64_t std::__function::__func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::operator()(uint64_t a1, unsigned __int8 *a2)
{
  const unsigned __int8 *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>((_QWORD *)(*(_QWORD *)(a1 + 40) + 520), a2);
  if (v4)
    return *((_QWORD *)v4 + 4);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    return (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(_QWORD *)v6 + 48))(v6, a2);
  v7 = std::__throw_bad_function_call[abi:nn180100]();
  return std::__compressed_pair_elem<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,0,false>::__compressed_pair_elem[abi:nn180100]<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> && const&,0ul>(v7, v8);
}

uint64_t std::__compressed_pair_elem<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,0,false>::__compressed_pair_elem[abi:nn180100]<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> && const&,0ul>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__value_func[abi:nn180100](a1, a2);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(v4 + 32) = v5;
  if (v5)
    v6 = (id)(v5 + 8);
  return a1;
}

void std::__function::__alloc_func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::destroy[abi:nn180100](_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = a1[4];
  if (v2)
  {

    a1[4] = 0;
  }
  v3 = (_QWORD *)a1[3];
  if (v3 == a1)
  {
    (*(void (**)(_QWORD *))(*a1 + 32))(a1);
  }
  else if (v3)
  {
    (*(void (**)(_QWORD))(*(_QWORD *)a1[3] + 40))(a1[3]);
  }
}

const unsigned __int8 *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(_QWORD *a1, unsigned __int8 *uu2)
{
  int8x8_t v2;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;
  uint64_t v7;
  const unsigned __int8 **v8;
  const unsigned __int8 *i;
  unint64_t v10;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v4 = (*((_QWORD *)uu2 + 1) + (*(_QWORD *)uu2 << 6) + (*(_QWORD *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(_QWORD *)uu2;
  v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  v6 = v5.u32[0];
  if (v5.u32[0] > 1uLL)
  {
    v7 = (*((_QWORD *)uu2 + 1) + (*(_QWORD *)uu2 << 6) + (*(_QWORD *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(_QWORD *)uu2;
    if (v4 >= *(_QWORD *)&v2)
      v7 = v4 % *(_QWORD *)&v2;
  }
  else
  {
    v7 = v4 & (*(_QWORD *)&v2 - 1);
  }
  v8 = *(const unsigned __int8 ***)(*a1 + 8 * v7);
  if (!v8)
    return 0;
  for (i = *v8; i; i = *(const unsigned __int8 **)i)
  {
    v10 = *((_QWORD *)i + 1);
    if (v10 == v4)
    {
      if (!uuid_compare(i + 16, uu2))
        return i;
    }
    else
    {
      if (v6 > 1)
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
  }
  return i;
}

uint64_t re::DirectTextureValidation::isWellFormed()
{
  return 1;
}

double re::DirectMeshUpdate::DirectMeshUpdate(re::DirectMeshUpdate *this)
{
  uint64_t v1;
  double result;

  ArcSharedObject::ArcSharedObject(this, 0);
  *(_QWORD *)v1 = &off_250B65048;
  result = 0.0;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  return result;
}

void re::DirectMeshUpdate::~DirectMeshUpdate(re::DirectMeshUpdate *this)
{
  uint64_t v2;
  uint64_t v3;
  void **v4;

  *(_QWORD *)this = &off_250B65048;
  v4 = (void **)((char *)this + 40);
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v4);
  v2 = *((_QWORD *)this + 4);
  if (v2)
  {

    *((_QWORD *)this + 4) = 0;
  }
  v3 = *((_QWORD *)this + 3);
  if (v3)
  {

    *((_QWORD *)this + 3) = 0;
  }
  ArcSharedObject::~ArcSharedObject(this);
}

{
  re::DirectMeshUpdate::~DirectMeshUpdate(this);
  JUMPOUT(0x23B84F8E0);
}

uint64_t re::DirectMeshUpdate::type(re::DirectMeshUpdate *this)
{
  return 1;
}

uint64_t re::DirectMeshUpdate::setPayload(_QWORD *a1, int a2, unint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;

  switch(a2)
  {
    case 2:
      if (a3 <= 3)
      {
        v7 = *a4;
        *a4 = 0;
        v8 = a1[5];
        v9 = a1 + 5;
        if (a3 >= (a1[6] - v8) >> 3)
        {
          std::vector<re::SharedPtr<re::DirectBuffer>>::resize((uint64_t)v9, a3 + 1);
          v8 = *v9;
        }
        v10 = *(_QWORD *)(v8 + 8 * a3);
        *(_QWORD *)(v8 + 8 * a3) = v7;
        if (v10)

        return 1;
      }
      break;
    case 1:
      v4 = a1[4];
      a1[4] = *a4;
      goto LABEL_6;
    case 0:
      v4 = a1[3];
      a1[3] = *a4;
LABEL_6:
      *a4 = v4;
      return 1;
  }
  return 0;
}

uint64_t re::DirectMeshUpdate::forEachSlot(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  int v7;
  unint64_t v8;
  __int128 v9;

  v3 = 0;
  while (1)
  {
    v9 = re::DirectMeshUpdate::forEachSlot(std::function<void ()(re::DirectResourceSlot)> const&)const::kAllMeshSlots[v3];
    v4 = *(_QWORD *)(a2 + 24);
    if (!v4)
      break;
    result = (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)v4 + 48))(v4, &v9);
    if (++v3 == 6)
      return result;
  }
  v6 = std::__throw_bad_function_call[abi:nn180100]();
  return re::DirectMeshUpdate::payload(v6, v7, v8);
}

uint64_t re::DirectMeshUpdate::payload(uint64_t a1, int a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  switch(a2)
  {
    case 2:
      v4 = *(_QWORD *)(a1 + 40);
      if (a3 < (*(_QWORD *)(a1 + 48) - v4) >> 3)
      {
        v3 = v4 + 8 * a3;
        return *(_QWORD *)v3;
      }
      break;
    case 1:
      v3 = a1 + 32;
      return *(_QWORD *)v3;
    case 0:
      v3 = a1 + 24;
      return *(_QWORD *)v3;
  }
  return 0;
}

uint64_t re::DirectMeshUpdate::vertexUpdate(re::DirectMeshUpdate *this, unint64_t a2)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 5);
  if (a2 >= (*((_QWORD *)this + 6) - v2) >> 3)
    return 0;
  else
    return *(_QWORD *)(v2 + 8 * a2);
}

BOOL re::DirectMeshUpdate::validate(re::DirectMeshUpdate *this, const re::DirectResource *a2)
{
  _BOOL8 result;
  uint64_t v5;
  _BOOL8 isPrivateToThisProcess;
  NSObject *v7;
  _BOOL4 v8;
  uint8_t v9[16];

  if ((*(unsigned int (**)(const re::DirectResource *))(*(_QWORD *)a2 + 40))(a2) != 1)
    return 0;
  result = re::DirectMeshValidation::isValid((uint64_t)this, (unint64_t *)a2 + 6);
  if (!result)
    return result;
  v5 = *((_QWORD *)this + 4);
  if (!v5)
    return 1;
  isPrivateToThisProcess = re::isPrivateToThisProcess(*(_DWORD *)(v5 + 32));
  if (isPrivateToThisProcess)
    return 1;
  v7 = re::directResourceLog((re *)isPrivateToThisProcess);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v8)
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23A4DF000, v7, OS_LOG_TYPE_DEFAULT, "Index buffer must be private", v9, 2u);
    return 0;
  }
  return result;
}

uint64_t re::DirectMeshUpdate::attachToDevice(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  uint64_t result;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  re::DirectMemoryResource *v8;
  uint64_t v9;
  id v10;
  re::DirectMemoryResource **v11;
  re::DirectMemoryResource **v12;
  re::DirectMemoryResource *v13;
  id v14;
  id v15;
  id v16;

  v2 = a1[3];
  if (!v2 || (v3 = re::DirectMemoryResource::bindToResource(v2, 1, 0), result = 0, v3))
  {
    v5 = a1[4];
    if (!v5 || (result = re::DirectMemoryResource::bindToResource(v5, 1, 1), (_DWORD)result))
    {
      v6 = (uint64_t *)a1[5];
      v7 = (uint64_t *)a1[6];
      while (v6 != v7)
      {
        if (*v6)
        {
          result = re::DirectMemoryResource::bindToResource(*v6, 1, 2);
          if (!(_DWORD)result)
            return result;
        }
        ++v6;
      }
      v8 = (re::DirectMemoryResource *)a1[4];
      if (v8)
      {
        if (!*(_QWORD *)re::DirectMemoryResource::runtimeResource(v8))
        {
          v9 = a1[4];
          re::DirectMemoryResource::makeBuffer(v9);
          v10 = v15;
          v15 = 0;
          v16 = v10;
          re::DirectMemoryResource::setRuntimeResource(v9, &v16);
          if (v16)
          {

            v16 = 0;
          }
        }
      }
      v11 = (re::DirectMemoryResource **)a1[5];
      v12 = (re::DirectMemoryResource **)a1[6];
      while (v11 != v12)
      {
        v13 = *v11;
        if (*v11 && !*(_QWORD *)re::DirectMemoryResource::runtimeResource(*v11))
        {
          re::DirectMemoryResource::makeBuffer((uint64_t)v13);
          v14 = v15;
          v15 = 0;
          re::DirectMemoryResource::setRuntimeResource((uint64_t)v13, &v14);
          if (v14)
          {

            v14 = 0;
          }
          if (v15)

        }
        ++v11;
      }
      return 1;
    }
  }
  return result;
}

void re::DirectMeshUpdate::apply(re::DirectMeshUpdate *this, re::DirectResource *a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  if ((*(unsigned int (**)(re::DirectResource *))(*(_QWORD *)a2 + 40))(a2) == 1)
  {
    v4 = *((_QWORD *)this + 3);
    if (v4)
      re::DirectMesh::setParts((uint64_t)a2, *((_QWORD *)this + 2), v4);
    v5 = (char *)&re::DirectMeshUpdate::apply(re::DirectResource *)::kMeshSlots;
    do
    {
      v6 = *(_QWORD *)v5;
      v7 = *((_QWORD *)v5 + 1);
      v8 = (*(uint64_t (**)(re::DirectMeshUpdate *, _QWORD, unint64_t))(*(_QWORD *)this + 40))(this, *(_QWORD *)v5, v7);
      if (v8)
      {
        v10 = v8;
        v9 = (id)(v8 + 8);
        re::DirectMesh::setPayload((uint64_t)a2, v6, v7, &v10);
        if (v10)
        {

          v10 = 0;
        }
      }
      v5 += 16;
    }
    while (v5 != &jpt_23A4EBE50);
  }
}

void re::DirectContentsUpdate::DirectContentsUpdate(re::DirectContentsUpdate *this)
{
  _QWORD *v1;

  ArcSharedObject::ArcSharedObject(this, 0);
  *v1 = off_250B650B8;
  v1[2] = 0;
}

void re::DirectContentsUpdate::~DirectContentsUpdate(re::DirectContentsUpdate *this)
{
  uint64_t v2;

  *(_QWORD *)this = off_250B650B8;
  v2 = *((_QWORD *)this + 2);
  if (v2)
  {

    *((_QWORD *)this + 2) = 0;
  }
  ArcSharedObject::~ArcSharedObject(this);
}

uint64_t re::DirectContentsUpdate::payload(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;

  result = 0;
  if (a2 == 3 && !a3)
    return *(_QWORD *)(a1 + 16);
  return result;
}

uint64_t re::DirectContentsUpdate::setPayload(uint64_t a1, int a2, uint64_t a3, _QWORD *a4)
{
  BOOL v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2 == 3 && a3 == 0;
  v5 = v4;
  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = *a4;
    *a4 = v6;
  }
  return v5;
}

void re::DirectContentsUpdate::apply(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)a1 + 40))(a1, 3, 0);
  if (v3)
  {
    v5 = v3;
    v4 = (id)(v3 + 8);
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t *))(*(_QWORD *)a2 + 56))(a2, 3, 0, &v5);
    if (v5)

  }
}

void re::DirectContentsUpdate::forEachSlot(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  re::DirectTextureUpdate *v3;
  __int128 v4;

  v4 = xmmword_23A4F97B0;
  v2 = *(_QWORD *)(a2 + 24);
  if (v2)
  {
    (*(void (**)(uint64_t, __int128 *))(*(_QWORD *)v2 + 48))(v2, &v4);
  }
  else
  {
    v3 = (re::DirectTextureUpdate *)std::__throw_bad_function_call[abi:nn180100]();
    re::DirectTextureUpdate::~DirectTextureUpdate(v3);
  }
}

void re::DirectTextureUpdate::~DirectTextureUpdate(re::DirectTextureUpdate *this)
{
  re::DirectContentsUpdate::~DirectContentsUpdate(this);
  JUMPOUT(0x23B84F8E0);
}

uint64_t re::DirectTextureUpdate::type(re::DirectTextureUpdate *this)
{
  return 2;
}

BOOL re::DirectTextureUpdate::validate(uint64_t a1, uint64_t a2)
{
  return (*(unsigned int (**)(uint64_t))(*(_QWORD *)a2 + 40))(a2) == 2;
}

uint64_t re::DirectTextureUpdate::attachToDevice(uint64_t a1, uint64_t a2, void *a3)
{
  re::DirectMemoryResource *v6;

  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a2 + 40))(a2) != 2)
    return 0;
  v6 = *(re::DirectMemoryResource **)(a1 + 16);
  if (v6 && !*(_QWORD *)re::DirectMemoryResource::runtimeResource(v6))
    return re::DirectTexture::allocateRuntimeResource(a2 + 48, *(re::DirectMemoryResource **)(a1 + 16), a3);
  else
    return 1;
}

void re::DirectBufferUpdate::~DirectBufferUpdate(re::DirectBufferUpdate *this)
{
  re::DirectContentsUpdate::~DirectContentsUpdate(this);
  JUMPOUT(0x23B84F8E0);
}

uint64_t re::DirectBufferUpdate::type(re::DirectBufferUpdate *this)
{
  return 3;
}

BOOL re::DirectBufferUpdate::validate(re::DirectBufferUpdate *this, const re::DirectResource *a2)
{
  unint64_t *v4;
  _BOOL8 result;
  uint64_t v6;

  if ((*(unsigned int (**)(const re::DirectResource *))(*(_QWORD *)a2 + 40))(a2) != 3)
    return 0;
  v4 = (unint64_t *)((char *)a2 + 48);
  if (!*((_BYTE *)this + 32)
    || (result = re::DirectBufferValidation::isValidBytesUsed(*((_QWORD *)this + 3), v4), (_DWORD)result))
  {
    v6 = *((_QWORD *)this + 2);
    return !v6 || *(_QWORD *)(v6 + 40) >= *v4;
  }
  return result;
}

uint64_t re::DirectBufferUpdate::attachToDevice(uint64_t a1)
{
  re::DirectMemoryResource *v1;
  uint64_t result;
  id v3;
  id v4;

  v1 = *(re::DirectMemoryResource **)(a1 + 16);
  if (v1)
  {
    result = re::DirectMemoryResource::bindToResource(*(_QWORD *)(a1 + 16), 3, 3);
    if (!(_DWORD)result)
      return result;
    if (!*(_QWORD *)re::DirectMemoryResource::runtimeResource(v1))
    {
      re::DirectMemoryResource::makeBuffer((uint64_t)v1);
      v4 = v3;
      re::DirectMemoryResource::setRuntimeResource((uint64_t)v1, &v4);
      if (v4)
      {

        v4 = 0;
      }
    }
  }
  return 1;
}

void re::DirectBufferUpdate::apply(re::DirectBufferUpdate *this, re::DirectResource *a2)
{
  if ((*(unsigned int (**)(re::DirectResource *))(*(_QWORD *)a2 + 40))(a2) == 3)
  {
    if (*((_BYTE *)this + 32))
      re::DirectBuffer::setBytesUsed(a2, *((_QWORD *)this + 3));
    re::DirectContentsUpdate::apply((uint64_t)this, (uint64_t)a2);
  }
}

BOOL re::DirectMeshValidation::isValid(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if ((unint64_t)a1[2] > 4 || (unint64_t)a1[4] > 1)
    return 0;
  v4 = *a1;
  return v4 + a1[1] * re::lengthInBytes(a3) <= a2;
}

uint64_t re::DirectMeshValidation::isWellFormed(unsigned int *a1, unsigned int *a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  memset(v6, 0, 13);
  if (a1 == a2)
    return 1;
  while (1)
  {
    v3 = *a1;
    if (v3 > 0xC
      || (unint64_t)(*((_QWORD *)a1 + 1) - 1) > 0x34
      || *((_QWORD *)a1 + 2) >= a3
      || *((_BYTE *)v6 + v3))
    {
      break;
    }
    v4 = 1;
    *((_BYTE *)v6 + v3) = 1;
    a1 += 8;
    if (a1 == a2)
      return v4;
  }
  return 0;
}

BOOL re::DirectMeshValidation::isWellFormed(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v2;
  _BOOL4 v3;
  _BOOL4 v4;

  if (*a1 > 3uLL)
    return 0;
  v1 = a1[4];
  if (v1 > 2)
    return 0;
  v2 = a1[3];
  if (!v1)
    return v2 == 0;
  v3 = v2 != 0;
  v4 = v2 == 1;
  if (v1 != 1)
    v4 = 0;
  if (v1 == 2)
    return v3;
  else
    return v4;
}

uint64_t re::DirectMeshValidation::isWellFormed(uint64_t a1)
{
  uint64_t result;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _BYTE v7[48];

  if ((unint64_t)(*(_QWORD *)(a1 + 16) - 5) < 0xFFFFFFFFFFFFFFFCLL || *(_QWORD *)a1 == 0)
    return 0;
  result = re::lengthInBytes(*(_QWORD *)(a1 + 8));
  if (result)
  {
    v4 = *(_QWORD **)(a1 + 56);
    v5 = *(_QWORD **)(a1 + 64);
    result = re::DirectMeshValidation::isWellFormed(*(unsigned int **)(a1 + 32), *(unsigned int **)(a1 + 40), 0xCCCCCCCCCCCCCCCDLL * (v5 - v4));
    if ((_DWORD)result)
    {
      if (v5 != v4)
      {
        v6 = 8 * (v5 - v4);
        while (re::DirectMeshValidation::isWellFormed(v4))
        {
          v4 += 5;
          v6 -= 40;
          if (!v6)
            goto LABEL_13;
        }
        return 0;
      }
LABEL_13:
      if (is_mul_ok(*(_QWORD *)a1, re::lengthInBytes(*(_QWORD *)(a1 + 8))))
      {
        re::calculateBufferSizes((unint64_t *)a1, (uint64_t)v7);
        return v7[40] != 0;
      }
      return 0;
    }
  }
  return result;
}

uint64_t re::DirectMeshValidation::validateBufferSizes(re::DirectMeshValidation *this, const re::DirectMesh *a2)
{
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  _QWORD v7[5];
  char v8;

  re::calculateBufferSizes((unint64_t *)this + 6, (uint64_t)v7);
  if (v8)
  {
    v3 = re::DirectMesh::indexPayload(this);
    if (*(_QWORD *)(v3 + 40) >= v7[0])
    {
      v5 = 0;
      while (1)
      {
        v6 = v7[v5 + 1];
        if (v6)
        {
          result = re::DirectMesh::vertexPayload(this, v5);
          if (!result)
            return result;
          if (*(_QWORD *)(result + 40) < v6)
            break;
        }
        if (++v5 == 4)
          return 1;
      }
    }
  }
  return 0;
}

BOOL re::DirectMeshValidation::validateBufferSizes(re::DirectMeshUpdate *a1, unint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  _QWORD v10[5];
  char v11;

  re::calculateBufferSizes(a2, (uint64_t)v10);
  if (v11)
  {
    v3 = *((_QWORD *)a1 + 4);
    if (!v3 || *(_QWORD *)(v3 + 40) >= v10[0])
    {
      v4 = 0;
      while (1)
      {
        v5 = v10[v4 + 1];
        v6 = re::DirectMeshUpdate::vertexUpdate(a1, v4);
        v7 = !v5 || v6 == 0;
        if (!v7 && *(_QWORD *)(v6 + 40) < v5)
          break;
        if (++v4 == 4)
        {
          v8 = *((_QWORD *)a1 + 3);
          return !v8 || *(_QWORD *)(v8 + 40) >= (unint64_t)(96 * *((_QWORD *)a1 + 2));
        }
      }
    }
  }
  return 0;
}

uint64_t re::DirectMeshValidation::validateAndFixupIndices(uint64_t a1, _WORD *a2, unint64_t a3, unsigned int a4)
{
  uint64_t result;
  unint64_t v5;
  unsigned int v6;
  unint64_t v8;

  if (a1 != 1)
  {
    if (a1)
      return 2;
    if (a3 >= 2)
    {
      result = 0;
      v5 = a3 >> 1;
      do
      {
        v6 = (unsigned __int16)*a2;
        if (v6 >= (unsigned __int16)a4 && v6 != 0xFFFF)
        {
          *a2 = -1;
          result = 1;
        }
        ++a2;
        --v5;
      }
      while (v5);
      return result;
    }
    return 0;
  }
  if (a3 < 4)
    return 0;
  result = 0;
  v8 = a3 >> 2;
  do
  {
    if (*(_DWORD *)a2 >= a4 && *(_DWORD *)a2 != -1)
    {
      *(_DWORD *)a2 = -1;
      result = 1;
    }
    a2 += 2;
    --v8;
  }
  while (v8);
  return result;
}

BOOL re::DirectMeshValidation::isValid(re::DirectMeshValidation *this, const re::DirectMesh *a2)
{
  uint64_t v3;
  re::DirectMemoryResource *v4;
  uint32x4_t *v5;
  uint64_t v6;
  re::DirectMemoryResource *v7;

  if (!re::DirectMeshValidation::validateBufferSizes(this, a2))
    return 0;
  v3 = *((_QWORD *)this + 7);
  v4 = (re::DirectMemoryResource *)re::DirectMesh::indexPayload(this);
  v5 = (uint32x4_t *)re::DirectMemoryResource::bytes(v4);
  v6 = re::DirectMesh::indexPayload(this);
  if (!re::MeshValidation::validateIndices(v3, v5, *(_QWORD *)(v6 + 40), *((_QWORD *)this + 9)))
    return 0;
  v7 = (re::DirectMemoryResource *)re::DirectMesh::partsPayload(this);
  return re::DirectMeshValidation::isValidParts(v7, *((_QWORD *)this + 16), (uint64_t *)this + 6);
}

BOOL re::DirectMeshValidation::isValidParts(re::DirectMemoryResource *a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 result;
  uint64_t v14;

  if (a2 >= *((_QWORD *)a1 + 5) / 0x60uLL)
    return 0;
  v6 = *a3;
  v7 = re::lengthInBytes(a3[1]);
  v8 = a3[1];
  v9 = re::DirectMemoryResource::bytes(a1);
  if (!a2)
    return 1;
  v10 = (uint64_t *)v9;
  v11 = v7 * v6;
  v12 = 96 * a2 - 96;
  do
  {
    result = re::DirectMeshValidation::isValid(v10, v11, v8);
    if (!result)
      break;
    v10 += 12;
    v14 = v12;
    v12 -= 96;
  }
  while (v14);
  return result;
}

BOOL re::DirectMeshValidation::isValid(uint64_t a1, unint64_t *a2)
{
  _BOOL8 result;
  uint64_t v5;
  uint64_t v6;
  uint32x4_t *v7;
  re::DirectMemoryResource *v8;

  result = re::DirectMeshValidation::validateBufferSizes((re::DirectMeshUpdate *)a1, a2);
  if (result)
  {
    v5 = *(_QWORD *)(a1 + 32);
    if (!v5
      || (v6 = a2[1],
          v7 = (uint32x4_t *)re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(a1 + 32)),
          result = re::MeshValidation::validateIndices(v6, v7, *(_QWORD *)(v5 + 40), a2[3])))
    {
      v8 = *(re::DirectMemoryResource **)(a1 + 24);
      if (!v8)
        return 1;
      result = re::DirectMeshValidation::isValidParts(v8, *(_QWORD *)(a1 + 16), (uint64_t *)a2);
      if (result)
        return 1;
    }
  }
  return result;
}

BOOL __REALITYKIT_WAITING_ON_RENDERER__(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  int v5;
  _BOOL8 result;
  unint64_t v7;

  v2 = atomic_load(a1);
  if (v2 >= a2)
    return 1;
  do
  {
    v5 = __ulock_wait();
    result = v5 >= 0;
    if (v5 < 0)
      break;
    v7 = atomic_load(a1);
  }
  while (v7 < a2);
  return result;
}

uint64_t re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::~DirectResourceChanges(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear(a1);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear(a1 + 40);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear(a1 + 80);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table(a1 + 80);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table(a1 + 40);
  return std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table(a1);
}

uint64_t *re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create(uint64_t *result, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *a3;
  if (*a3)
  {
    v5 = (uint64_t)result;
    v7 = *(_OWORD *)a2;
    v8 = v3;
    v6 = (id)(v3 + 8);
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>(v5, (unsigned __int8 *)&v7, (uint64_t)&v7);
    if (v8)

    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::__erase_unique<re::DirectResourceId>((_QWORD *)(v5 + 40), a2);
    return std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::__erase_unique<re::DirectResourceId>((_QWORD *)(v5 + 80), a2);
  }
  return result;
}

void re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::setUpdate(_QWORD *a1, unsigned __int8 *a2, uint64_t *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (*a3
    && !std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a1, a2))
  {
    v6 = *(_OWORD *)a2;
    v7 = *a3;
    *a3 = 0;
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>((uint64_t)(a1 + 5), (unsigned __int8 *)&v6, (uint64_t)&v6);
    if (v7)

  }
}

void re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy(_QWORD *a1, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::__erase_unique<re::DirectResourceId>(a1, a2);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::__erase_unique<re::DirectResourceId>(a1 + 5, a2);
  v6 = (uint64_t)(a1 + 10);
  v9 = *(_OWORD *)a2;
  v7 = *a3;
  v10 = v7;
  if (v7)
    v8 = (id)(v7 + 8);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>(v6, (unsigned __int8 *)&v9, (uint64_t)&v9);
  if (v10)

}

uint64_t re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::ensureUpdate(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v3;
  const unsigned __int8 *v4;
  uint64_t v5;
  re::DirectMeshUpdate *v6;
  uint64_t v7;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a1 + 40;
  v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>((_QWORD *)(a1 + 40), a2);
  if (v4)
    return *((_QWORD *)v4 + 4);
  v6 = (re::DirectMeshUpdate *)operator new(0x40uLL);
  re::DirectMeshUpdate::DirectMeshUpdate(v6);
  v9 = *(_OWORD *)a2;
  v10 = v7;
  v5 = *((_QWORD *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>(v3, (unsigned __int8 *)&v9, (uint64_t)&v9)+ 4);
  if (v10)

  return v5;
}

uint64_t re::DirectResourceChanges<re::DirectTexture,re::DirectTextureUpdate>::ensureUpdate(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v3;
  const unsigned __int8 *v4;
  uint64_t v5;
  re::DirectContentsUpdate *v6;
  _QWORD *v7;
  __int128 v9;
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a1 + 40;
  v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>((_QWORD *)(a1 + 40), a2);
  if (v4)
    return *((_QWORD *)v4 + 4);
  v6 = (re::DirectContentsUpdate *)operator new(0x18uLL);
  *((_QWORD *)v6 + 1) = 0;
  *((_QWORD *)v6 + 2) = 0;
  *(_QWORD *)v6 = 0;
  re::DirectContentsUpdate::DirectContentsUpdate(v6);
  *v7 = &unk_250B65128;
  v9 = *(_OWORD *)a2;
  v10 = v7;
  v5 = *((_QWORD *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>(v3, (unsigned __int8 *)&v9, (uint64_t)&v9)+ 4);
  if (v10)

  return v5;
}

uint64_t re::DirectResourceChanges<re::DirectBuffer,re::DirectBufferUpdate>::ensureUpdate(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v3;
  const unsigned __int8 *v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a1 + 40;
  v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>((_QWORD *)(a1 + 40), a2);
  if (v4)
    return *((_QWORD *)v4 + 4);
  v6 = operator new(0x28uLL);
  *v6 = 0u;
  v6[1] = 0u;
  *((_QWORD *)v6 + 4) = 0;
  re::DirectContentsUpdate::DirectContentsUpdate((re::DirectContentsUpdate *)v6);
  *(_QWORD *)v7 = &unk_250B65198;
  *(_BYTE *)(v7 + 24) = 0;
  *(_BYTE *)(v7 + 32) = 0;
  v9 = *(_OWORD *)a2;
  v10 = v7;
  v5 = *((_QWORD *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>(v3, (unsigned __int8 *)&v9, (uint64_t)&v9)+ 4);
  if (v10)

  return v5;
}

void re::DirectResourcesResolvedCommit::~DirectResourcesResolvedCommit(void **this)
{
  void **v2;
  void **v3;

  *this = &off_250B65208;
  v2 = this + 24;
  v3 = this + 30;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = this + 27;
  std::vector<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = v2;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = this + 21;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = this + 18;
  std::vector<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = this + 15;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = this + 12;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = this + 9;
  std::vector<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::__destroy_vector::operator()[abi:nn180100](&v3);
  v3 = this + 6;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  re::XPCObject::~XPCObject(this + 5);
  re::XPCObject::~XPCObject(this + 4);
  ArcSharedObject::~ArcSharedObject((ArcSharedObject *)this);
}

{
  re::DirectResourcesResolvedCommit::~DirectResourcesResolvedCommit(this);
  JUMPOUT(0x23B84F8E0);
}

uint64_t re::DirectResourcesResolvedCommit::apply(re::DirectResourcesResolvedCommit *this, re::DirectResourceContext *a2)
{
  kdebug_trace();
  re::ResolvedResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::apply((uint64_t)this + 48, a2);
  re::ResolvedResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::apply((uint64_t)this + 120, a2);
  re::ResolvedResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::apply((uint64_t)this + 192, a2);
  return kdebug_trace();
}

void re::ResolvedResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::apply(uint64_t a1, re::DirectResourceContext *this)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  id v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  re::DirectResource **v12;
  re::DirectResource **v13;
  re::DirectResource *v14;
  uint64_t v15;

  v4 = *(uint64_t **)a1;
  v5 = *(uint64_t **)(a1 + 8);
  while (v4 != v5)
  {
    v6 = *v4;
    v15 = v6;
    if (v6)
      v7 = (id)(v6 + 8);
    re::DirectResourceContext::addResource((uint64_t)this, &v15);
    if (v15)

    ++v4;
  }
  v8 = *(uint64_t **)(a1 + 24);
  v9 = *(uint64_t **)(a1 + 32);
  while (v8 != v9)
  {
    v11 = *v8;
    v10 = v8[1];
    v8 += 2;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v10 + 88))(v10, v11);
  }
  v13 = *(re::DirectResource ***)(a1 + 48);
  v12 = *(re::DirectResource ***)(a1 + 56);
  while (v13 != v12)
  {
    v14 = *v13++;
    re::DirectResourceContext::removeResource(this, v14);
  }
}

re::DirectResourcesCommit *re::DirectResourcesCommit::DirectResourcesCommit(re::DirectResourcesCommit *this)
{
  _QWORD *v2;

  ArcSharedObject::ArcSharedObject(this, 0);
  *v2 = &off_250B65240;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  re::DirectResourceEvent::DirectResourceEvent(v2 + 4);
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_DWORD *)this + 18) = 1065353216;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = 1065353216;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = 1065353216;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_DWORD *)this + 48) = 1065353216;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((_DWORD *)this + 58) = 1065353216;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_DWORD *)this + 68) = 1065353216;
  *(_OWORD *)((char *)this + 280) = 0u;
  *(_OWORD *)((char *)this + 296) = 0u;
  *((_DWORD *)this + 78) = 1065353216;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_DWORD *)this + 88) = 1065353216;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *((_DWORD *)this + 98) = 1065353216;
  *((_OWORD *)this + 25) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_DWORD *)this + 108) = 1065353216;
  *(_OWORD *)((char *)this + 440) = 0u;
  *(_OWORD *)((char *)this + 456) = 0u;
  *((_DWORD *)this + 118) = 1065353216;
  *((_OWORD *)this + 30) = 0u;
  *((_OWORD *)this + 31) = 0u;
  *((_DWORD *)this + 128) = 1065353216;
  *(_OWORD *)((char *)this + 520) = 0u;
  *(_OWORD *)((char *)this + 536) = 0u;
  *((_DWORD *)this + 138) = 1065353216;
  *((_OWORD *)this + 35) = 0u;
  *((_OWORD *)this + 36) = 0u;
  *((_DWORD *)this + 148) = 1065353216;
  *(_OWORD *)((char *)this + 600) = 0u;
  *(_OWORD *)((char *)this + 616) = 0u;
  *((_DWORD *)this + 158) = 1065353216;
  return this;
}

void re::DirectResourcesCommit::~DirectResourcesCommit(void **this)
{
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::~DirectResourceChanges((uint64_t)(this + 65));
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::~DirectResourceChanges((uint64_t)(this + 50));
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::~DirectResourceChanges((uint64_t)(this + 35));
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::~DirectResourceChanges((uint64_t)(this + 20));
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::~DirectResourceChanges((uint64_t)(this + 5));
  re::XPCObject::~XPCObject(this + 4);
  re::XPCObject::~XPCObject(this + 3);
  ArcSharedObject::~ArcSharedObject((ArcSharedObject *)this);
}

{
  re::DirectResourcesCommit::~DirectResourcesCommit(this);
  JUMPOUT(0x23B84F8E0);
}

BOOL re::DirectResourcesCommit::isCreatePending(re::DirectResourcesCommit *this, re::DirectResource *a2)
{
  const unsigned __int8 *v4;
  _BOOL8 result;
  uuid_t dst;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  switch((*(unsigned int (**)(re::DirectResource *))(*(_QWORD *)a2 + 40))(a2))
  {
    case 1u:
      uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
      v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>((_QWORD *)this + 5, dst);
      goto LABEL_7;
    case 2u:
      uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
      v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>((_QWORD *)this + 20, dst);
      goto LABEL_7;
    case 3u:
      uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
      v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>((_QWORD *)this + 35, dst);
      goto LABEL_7;
    case 4u:
      uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
      v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>((_QWORD *)this + 50, dst);
LABEL_7:
      result = v4 != 0;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

std::string *re::DirectResourcesCommit::debugDescription@<X0>(re::DirectResourcesCommit *this@<X0>, std::string *a2@<X8>)
{
  char __str[1024];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  snprintf(__str, 0x400uLL, "Commit %llu", *((_QWORD *)this + 2));
  return std::string::append(a2, __str);
}

uint64_t re::DirectResourcesPendingCommit::DirectResourcesPendingCommit(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  re::DirectResourcesCommit *v5;
  void *v6;

  ArcSharedObject::ArcSharedObject((ArcSharedObject *)a1, 0);
  *(_QWORD *)v4 = &off_250B65278;
  *(_DWORD *)(v4 + 16) = 0;
  v5 = (re::DirectResourcesCommit *)operator new(0x280uLL);
  *(_QWORD *)(a1 + 24) = re::DirectResourcesCommit::DirectResourcesCommit(v5);
  *(_QWORD *)(a1 + 32) = 0;
  if (a2)
    v6 = (void *)(a2 + 8);
  else
    v6 = 0;
  objc_initWeak((id *)(a1 + 40), v6);
  *(_DWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  return a1;
}

void re::DirectResourcesPendingCommit::~DirectResourcesPendingCommit(id *this)
{
  char *v2;
  char *v3;
  void **v4;

  v4 = this + 7;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v4);
  objc_destroyWeak(this + 5);
  this[5] = 0;
  v2 = (char *)this[4];
  if (v2)
  {

    this[4] = 0;
  }
  v3 = (char *)this[3];
  if (v3)
  {

    this[3] = 0;
  }
  ArcSharedObject::~ArcSharedObject((ArcSharedObject *)this);
}

{
  re::DirectResourcesPendingCommit::~DirectResourcesPendingCommit(this);
  JUMPOUT(0x23B84F8E0);
}

void re::DirectResourcesPendingCommit::setUserPayload(re::DirectResourcesPendingCommit *this, xpc_object_t *a2)
{
  re::XPCObject::setValue((xpc_object_t *)(*((_QWORD *)this + 3) + 24), *a2);
}

void re::DirectResourcesPendingCommit::addResource(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t *v4;
  const unsigned __int8 *v5;
  uint64_t v6;
  uint64_t *v7;
  const unsigned __int8 *v8;
  uint64_t *v9;
  const unsigned __int8 *v10;
  uint64_t *v11;
  const unsigned __int8 *v12;
  const unsigned __int8 *v13;
  const unsigned __int8 *v14;
  const unsigned __int8 *v15;
  const unsigned __int8 *v16;
  uuid_t dst;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  switch((*(unsigned int (**)(const unsigned __int8 *))(*(_QWORD *)a2 + 40))(a2))
  {
    case 1u:
      v4 = (uint64_t *)(*(_QWORD *)(a1 + 24) + 40);
      uuid_copy(dst, a2 + 16);
      v16 = a2;
      v5 = (id)(a2 + 8);
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create(v4, dst, (uint64_t *)&v16);
      v6 = (uint64_t)v16;
      if (v16)
        goto LABEL_9;
      break;
    case 2u:
      v7 = (uint64_t *)(*(_QWORD *)(a1 + 24) + 160);
      uuid_copy(dst, a2 + 16);
      v15 = a2;
      v8 = (id)(a2 + 8);
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create(v7, dst, (uint64_t *)&v15);
      v6 = (uint64_t)v15;
      if (v15)
        goto LABEL_9;
      break;
    case 3u:
      v9 = (uint64_t *)(*(_QWORD *)(a1 + 24) + 280);
      uuid_copy(dst, a2 + 16);
      v14 = a2;
      v10 = (id)(a2 + 8);
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create(v9, dst, (uint64_t *)&v14);
      v6 = (uint64_t)v14;
      if (v14)
        goto LABEL_9;
      break;
    case 4u:
      v11 = (uint64_t *)(*(_QWORD *)(a1 + 24) + 400);
      uuid_copy(dst, a2 + 16);
      v13 = a2;
      v12 = (id)(a2 + 8);
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create(v11, dst, (uint64_t *)&v13);
      v6 = (uint64_t)v13;
      if (v13)
LABEL_9:

      break;
    default:
      return;
  }
}

void re::DirectResourcesPendingCommit::destroyResource(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v13[0] = a3;
  v13[1] = a4;
  switch(a2)
  {
    case 1:
      v4 = (_QWORD *)(*(_QWORD *)(a1 + 24) + 40);
      v12 = 0;
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy(v4, (unsigned __int8 *)v13, &v12);
      v5 = v12;
      if (v12)
        goto LABEL_7;
      break;
    case 2:
      v6 = (_QWORD *)(*(_QWORD *)(a1 + 24) + 160);
      v11 = 0;
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy(v6, (unsigned __int8 *)v13, &v11);
      v5 = v11;
      if (v11)
        goto LABEL_7;
      break;
    case 3:
      v7 = (_QWORD *)(*(_QWORD *)(a1 + 24) + 280);
      v10 = 0;
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy(v7, (unsigned __int8 *)v13, &v10);
      v5 = v10;
      if (v10)
        goto LABEL_7;
      break;
    case 4:
      v8 = (_QWORD *)(*(_QWORD *)(a1 + 24) + 400);
      v9 = 0;
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy(v8, (unsigned __int8 *)v13, &v9);
      v5 = v9;
      if (v9)
LABEL_7:

      break;
    default:
      return;
  }
}

void re::DirectResourcesPendingCommit::addPayload(uint64_t a1, uint64_t a2)
{
  uint64_t *v3;
  id v4;
  uint64_t v5;
  uuid_t dst;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (uint64_t *)(*(_QWORD *)(a1 + 24) + 520);
  uuid_copy(dst, (const unsigned __int8 *)(a2 + 16));
  v5 = a2;
  if (a2)
    v4 = (id)(a2 + 8);
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create(v3, dst, &v5);
  if (v5)

}

void re::DirectResourcesPendingCommit::updatePayload(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  id v4;
  uint64_t v5;
  uuid_t dst;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (_QWORD *)(*(_QWORD *)(a1 + 24) + 520);
  uuid_copy(dst, (const unsigned __int8 *)(a2 + 16));
  v5 = a2;
  if (a2)
    v4 = (id)(a2 + 8);
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::setUpdate(v3, dst, &v5);
  if (v5)

}

void re::DirectResourcesPendingCommit::removePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v5[0] = a2;
  v5[1] = a3;
  v3 = (_QWORD *)(*(_QWORD *)(a1 + 24) + 520);
  v4 = 0;
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy(v3, (unsigned __int8 *)v5, &v4);
  if (v4)

}

uint64_t re::DirectResourcesPendingCommit::ensureUpdate(re::DirectResourcesPendingCommit *this, re::DirectResource *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uuid_t dst;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*((_QWORD *)a2 + 4))
    re::DirectResourcesPendingCommit::ensureUpdate();
  v4 = (*(uint64_t (**)(re::DirectResource *))(*(_QWORD *)a2 + 40))(a2);
  switch(v4)
  {
    case 3:
      v8 = *((_QWORD *)this + 3) + 280;
      uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
      return re::DirectResourceChanges<re::DirectBuffer,re::DirectBufferUpdate>::ensureUpdate(v8, dst);
    case 2:
      v7 = *((_QWORD *)this + 3) + 160;
      uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
      return re::DirectResourceChanges<re::DirectTexture,re::DirectTextureUpdate>::ensureUpdate(v7, dst);
    case 1:
      v5 = *((_QWORD *)this + 3) + 40;
      uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
      return re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::ensureUpdate(v5, dst);
    default:
      return 0;
  }
}

void re::DirectResourcesPendingCommit::addCommandBuffer(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  uint64_t v9;

  if ((re::DirectResourcesPendingCommit::isPending(a1, (uint64_t)a2) & 1) == 0)
  {
    v4 = operator new(0x50uLL);
    v5 = re::DirectFence::DirectFence(v4, a2);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1174405120;
    v8[2] = ___ZN2re28DirectResourcesPendingCommit16addCommandBufferEPN3MTL13CommandBufferE_block_invoke;
    v8[3] = &__block_descriptor_tmp_0;
    v9 = v5;
    v6 = (void *)(v5 + 8);
    v7 = (id)(v5 + 8);
    objc_msgSend(a2, sel_addCompletedHandler_, v8);
    re::DirectResourcesPendingCommit::addFence(a1, (uint64_t)v4);
    if (v9)
    {

      v9 = 0;
    }

  }
}

uint64_t re::DirectResourcesPendingCommit::isPending(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v4;
  uint64_t i;
  uint64_t v6;

  v4 = (os_unfair_lock_s *)(a1 + 48);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  for (i = *(_QWORD *)(a1 + 56); ; i += 8)
  {
    if (i == *(_QWORD *)(a1 + 64))
    {
      v6 = 0;
      goto LABEL_8;
    }
    if (*(_DWORD *)(*(_QWORD *)i + 16) == 1 && *(_QWORD *)(*(_QWORD *)i + 24) == a2)
      break;
  }
  v6 = 1;
LABEL_8:
  os_unfair_lock_unlock(v4);
  return v6;
}

uint64_t ___ZN2re28DirectResourcesPendingCommit16addCommandBufferEPN3MTL13CommandBufferE_block_invoke(uint64_t a1)
{
  return re::DirectFence::invalidate(*(_QWORD *)(a1 + 32));
}

_QWORD *__copy_helper_block_8_32c38_ZTSN2re9SharedPtrINS_11DirectFenceEEE(_QWORD *result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 32);
  result[4] = v2;
  if (v2)
    return (id)(v2 + 8);
  return result;
}

void __destroy_helper_block_8_32c38_ZTSN2re9SharedPtrINS_11DirectFenceEEE(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {

    *(_QWORD *)(a1 + 32) = 0;
  }
}

void re::DirectResourcesPendingCommit::addFence(uint64_t a1, uint64_t a2)
{
  id v4;
  id v5;
  uint64_t (***v6)();
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t *v18;
  uint64_t (***v19)();
  uint64_t v20;
  __int128 v21;
  uint64_t (***v22)();
  uint64_t (**v23)();
  __int128 v24;
  uint64_t (***v25)();
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  v4 = (id)(a1 + 8);
  v5 = (id)(a1 + 8);
  v23 = &off_250B654E0;
  *(_QWORD *)&v24 = a1;
  v25 = &v23;
  re::DirectFence::addInvalidateHandler(a2, (uint64_t)&v23);
  v6 = v25;
  if (v25 == &v23)
  {
    v7 = 4;
    v6 = &v23;
  }
  else
  {
    if (!v25)
      goto LABEL_6;
    v7 = 5;
  }
  (*v6)[v7]();
LABEL_6:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if (a2)
    v8 = (id)(a2 + 8);
  v9 = *(_QWORD *)(a1 + 72);
  v10 = *(uint64_t **)(a1 + 64);
  if ((unint64_t)v10 >= v9)
  {
    v12 = *(_QWORD **)(a1 + 56);
    v13 = v10 - v12;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 61)
      abort();
    v15 = v9 - (_QWORD)v12;
    if (v15 >> 2 > v14)
      v14 = v15 >> 2;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
      v16 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v16 = v14;
    v26 = a1 + 72;
    if (v16)
    {
      v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(a1 + 72, v16);
      v12 = *(_QWORD **)(a1 + 56);
      v10 = *(uint64_t **)(a1 + 64);
    }
    else
    {
      v17 = 0;
    }
    v18 = (uint64_t *)&v17[8 * v13];
    v19 = (uint64_t (***)())&v17[8 * v16];
    v25 = v19;
    *v18 = a2;
    *((_QWORD *)&v24 + 1) = v18 + 1;
    if (v10 == v12)
    {
      v11 = v18 + 1;
    }
    else
    {
      do
      {
        v20 = *--v10;
        *--v18 = v20;
        *v10 = 0;
      }
      while (v10 != v12);
      v11 = (_QWORD *)*((_QWORD *)&v24 + 1);
      v19 = v25;
    }
    v21 = *(_OWORD *)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v18;
    *(_QWORD *)(a1 + 64) = v11;
    v24 = v21;
    v22 = *(uint64_t (****)())(a1 + 72);
    *(_QWORD *)(a1 + 72) = v19;
    v25 = v22;
    v23 = (uint64_t (**)())v21;
    std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)&v23);
  }
  else
  {
    *v10 = a2;
    v11 = v10 + 1;
  }
  *(_QWORD *)(a1 + 64) = v11;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));

}

void re::DirectResourcesPendingCommit::forEachFence(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  re::DirectResourcesPendingCommit *v8;
  re::DirectFence *v9;
  uint64_t v10;

  v4 = (os_unfair_lock_s *)(a1 + 48);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  v6 = *(uint64_t **)(a1 + 56);
  v5 = *(uint64_t **)(a1 + 64);
  while (1)
  {
    if (v6 == v5)
    {
      os_unfair_lock_unlock(v4);
      return;
    }
    v10 = *v6;
    v7 = *(_QWORD *)(a2 + 24);
    if (!v7)
      break;
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v7 + 48))(v7, &v10);
    ++v6;
  }
  v8 = (re::DirectResourcesPendingCommit *)std::__throw_bad_function_call[abi:nn180100]();
  re::DirectResourcesPendingCommit::fenceCompleted_threadSafe(v8, v9);
}

void re::DirectResourcesPendingCommit::fenceCompleted_threadSafe(re::DirectResourcesPendingCommit *this, re::DirectFence *a2)
{
  os_unfair_lock_s *v4;
  re::DirectFence **v5;
  re::DirectFence **v6;
  re::DirectFence **v7;
  re::DirectFence *v8;
  re::DirectFence **v9;
  uint64_t v10;
  uint64_t v11;
  re::DirectFence **v12;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v14;
  const os_unfair_lock *v15;
  os_unfair_lock_s *v16;

  v4 = (os_unfair_lock_s *)((char *)this + 48);
  os_unfair_lock_lock((os_unfair_lock_t)this + 12);
  v5 = (re::DirectFence **)*((_QWORD *)this + 7);
  v6 = (re::DirectFence **)*((_QWORD *)this + 8);
  if (v5 != v6)
  {
    while (*v5 != a2)
    {
      if (++v5 == v6)
      {
        v5 = (re::DirectFence **)*((_QWORD *)this + 8);
        break;
      }
    }
  }
  if (v5 == v6)
  {
    os_unfair_lock_unlock(v4);
  }
  else
  {
    v7 = v5 + 1;
    if (v5 + 1 != v6)
    {
      v8 = *v5;
      do
      {
        *(v7 - 1) = *v7;
        *v7++ = v8;
        ++v5;
      }
      while (v7 != v6);
      v6 = (re::DirectFence **)*((_QWORD *)this + 8);
    }
    if (v6 != v5)
    {
      v9 = v6;
      do
      {
        v11 = (uint64_t)*--v9;
        v10 = v11;
        if (v11)
        {

          *(v6 - 1) = 0;
        }
        v6 = v9;
      }
      while (v9 != v5);
    }
    *((_QWORD *)this + 8) = v5;
    v12 = (re::DirectFence **)*((_QWORD *)this + 7);
    os_unfair_lock_unlock(v4);
    if (v12 == v5)
    {
      WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)this + 5);
      if (WeakRetained)
      {
        v14 = WeakRetained;
        v15 = WeakRetained - 2;
        v16 = WeakRetained + 16;
        os_unfair_lock_lock(WeakRetained + 16);
        re::DirectResourceContext::sendIfReady(v15);
        os_unfair_lock_unlock(v16);

      }
    }
  }
}

void re::DirectResourcesPendingCommit::scheduled(re::DirectResourcesPendingCommit *this)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;

  if (*((_DWORD *)this + 4))
    re::DirectResourcesPendingCommit::scheduled();
  *((_DWORD *)this + 4) = 1;
  re::makeCommands(*((re **)this + 3), &v4);
  v2 = (uint64_t *)*((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = v4;
  v4 = v2;
  if (v2)

  v3 = *((_QWORD *)this + 3);
  if (v3)
  {

    *((_QWORD *)this + 3) = 0;
  }
}

ArcSharedObject *re::DirectResourceCommitSignaling::DirectResourceCommitSignaling(ArcSharedObject *a1, uint64_t a2, void *a3)
{
  _QWORD *v6;
  void **v7;
  void **v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;

  ArcSharedObject::ArcSharedObject(a1, 0);
  *v6 = &off_250B652E0;
  v6[3] = 0;
  v7 = (void **)(v6 + 3);
  v6[2] = 0;
  v8 = (void **)(v6 + 2);
  location = objc_msgSend(a3, sel_newSharedEvent);
  NS::SharedPtr<MTL::Buffer>::operator=(v8, &location);
  if (location)

  location = objc_msgSend(objc_msgSend(MEMORY[0x24BDDD6F8], sel_alloc), sel_init);
  NS::SharedPtr<MTL::Buffer>::operator=(v7, &location);
  if (location)

  if (a2)
    v9 = (void *)(a2 + 8);
  else
    v9 = 0;
  objc_initWeak(&location, v9);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1174405120;
  v11[2] = ___ZN2re29DirectResourceCommitSignalingC2ENS_10UnownedPtrINS_21DirectResourceContextEEEPN3MTL6DeviceE_block_invoke;
  v11[3] = &__block_descriptor_tmp_7_0;
  v12 = 0;
  objc_copyWeak(&v12, &location);
  *((_QWORD *)a1 + 4) = _Block_copy(v11);
  objc_destroyWeak(&v12);
  v12 = 0;
  objc_destroyWeak(&location);
  return a1;
}

void ___ZN2re29DirectResourceCommitSignalingC2ENS_10UnownedPtrINS_21DirectResourceContextEEEPN3MTL6DeviceE_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  char *WeakRetained;
  void *v5;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    re::DirectResourceContext::freeListReady((re::DirectResourceContext *)(WeakRetained - 8), a3);

  }
}

void re::DirectResourceContext::freeListReady(re::DirectResourceContext *this, unint64_t a2)
{
  os_unfair_lock_s *v4;
  uint64_t *i;
  uint64_t v6;
  id v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *__p[2];
  uint64_t v26;
  void *v27[2];
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uuid_t dst;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = (os_unfair_lock_s *)((char *)this + 208);
  os_unfair_lock_lock((os_unfair_lock_t)this + 52);
  for (i = (uint64_t *)*((_QWORD *)this + 27); i != *((uint64_t **)this + 28); i = (uint64_t *)*((_QWORD *)this + 27))
  {
    v6 = *i;
    if (*(_QWORD *)(*i + 16) > a2)
      break;
    v7 = (id)(v6 + 8);
    v9 = (uint64_t *)*((_QWORD *)this + 27);
    v8 = (uint64_t *)*((_QWORD *)this + 28);
    v10 = v9 + 1;
    if (v9 + 1 != v8)
    {
      v11 = *v9;
      do
      {
        *(v10 - 1) = *v10;
        *v10++ = v11;
        ++v9;
      }
      while (v10 != v8);
      v10 = (uint64_t *)*((_QWORD *)this + 28);
    }
    if (v10 != v9)
    {
      v12 = v10;
      do
      {
        v14 = *--v12;
        v13 = v14;
        if (v14)
        {

          *(v10 - 1) = 0;
        }
        v10 = v12;
      }
      while (v12 != v9);
    }
    *((_QWORD *)this + 28) = v9;
    kdebug_trace();
    re::DirectResourcesReusePool::mergeFrom(*((_QWORD *)this + 30), v6);

  }
  atomic_store(a2, (unint64_t *)this + 31);
  __ulock_wake();
  v15 = *((_QWORD *)this + 6);
  v16 = a2 > v15;
  v17 = a2 - v15;
  if (v16)
  {
    v29 = 0uLL;
    v30 = 0;
    re::DirectResourcesReusePool::purgeBefore(*((_QWORD **)this + 30), v17, (char **)v27);
    std::vector<re::DirectResourcesReuseList::Entry>::__vdeallocate((uint64_t *)&v29);
    v29 = *(_OWORD *)v27;
    v30 = v28;
    *(_QWORD *)dst = v27;
    v27[1] = 0;
    v28 = 0;
    v27[0] = 0;
    std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100]((void ***)dst);
    if ((_QWORD)v29 != *((_QWORD *)&v29 + 1))
    {
      kdebug_trace();
      v27[0] = 0;
      v27[1] = 0;
      v28 = 0;
      std::vector<re::DirectResourceId>::resize(v27, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)&v29 + 1) - v29) >> 3));
      v18 = v29;
      if (*((_QWORD *)&v29 + 1) != (_QWORD)v29)
      {
        v19 = 0;
        v20 = 0;
        v21 = 48;
        do
        {
          uuid_copy(dst, (const unsigned __int8 *)(*(_QWORD *)(v18 + v21) + 16));
          *(_OWORD *)((char *)v27[0] + v19) = *(_OWORD *)dst;
          ++v20;
          v18 = v29;
          v19 += 16;
          v21 += 56;
        }
        while (v20 < 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)&v29 + 1) - v29) >> 3));
      }
      *(_OWORD *)__p = *(_OWORD *)v27;
      v26 = v28;
      v27[1] = 0;
      v28 = 0;
      v27[0] = 0;
      re::DirectResourceContext::destroyPayloads_anyThread(this, (uint64_t *)__p);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      v23 = *((_QWORD *)&v29 + 1);
      v22 = v29;
      while (v23 != v22)
      {
        v24 = *(_QWORD *)(v23 - 8);
        if (v24)
        {

          *(_QWORD *)(v23 - 8) = 0;
        }
        v23 -= 56;
      }
      *((_QWORD *)&v29 + 1) = v22;
      if (v27[0])
      {
        v27[1] = v27[0];
        operator delete(v27[0]);
      }
      kdebug_trace();
    }
    v27[0] = &v29;
    std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100]((void ***)v27);
  }
  os_unfair_lock_unlock(v4);
}

void __copy_helper_block_8_32c50_ZTSN2re10ArcWeakPtrINS_21DirectResourceContextEEE(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 32) = 0;
  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));
}

void __destroy_helper_block_8_32c50_ZTSN2re10ArcWeakPtrINS_21DirectResourceContextEEE(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 32));
  *(_QWORD *)(a1 + 32) = 0;
}

void re::DirectResourceCommitSignaling::~DirectResourceCommitSignaling(re::DirectResourceCommitSignaling *this)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {

    *((_QWORD *)this + 3) = 0;
  }
  v3 = (void *)*((_QWORD *)this + 2);
  if (v3)
  {

    *((_QWORD *)this + 2) = 0;
  }
  ArcSharedObject::~ArcSharedObject(this);
}

{
  re::DirectResourceCommitSignaling::~DirectResourceCommitSignaling(this);
  JUMPOUT(0x23B84F8E0);
}

void re::DirectResourceContext::recreatePayloadIfNecessary(re::DirectResourceContext *a1, re::DirectResource *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  re::DirectResourcesCommit **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int v17;
  id v18;
  id v19;
  size_t v20;
  char *v21;
  id v22;
  uint64_t v23;
  re::DirectMemoryResource *v24;
  re::DirectMemoryResource *v25;

  v12 = (re::DirectResourcesCommit **)re::DirectResourceContext::ensureUncommitted(a1);
  if (!re::DirectResourcesCommit::isCreatePending(v12[3], a2))
  {
    v13 = re::DirectResourcesPendingCommit::ensureUpdate((re::DirectResourcesPendingCommit *)v12, a2);
    if (!(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v13 + 40))(v13, a3, a4))
    {
      v14 = (*(uint64_t (**)(re::DirectResource *, uint64_t, uint64_t))(*(_QWORD *)a2 + 48))(a2, a3, a4);
      v15 = v14;
      if (v14)
        v16 = (id)(v14 + 8);
      v17 = *(_DWORD *)(v15 + 36);
      if ((v17 & 8) != 0)
      {
        if ((v17 & 6) != 4)
        {
LABEL_8:
          re::DirectResourceContext::createPayload((uint64_t)a1, (unsigned __int8 *)a2, a3, a4, (uint64_t *)&v25);
          if (!a5)
          {
            v18 = re::DirectMemoryResource::bytes(v25);
            v19 = re::DirectMemoryResource::bytes((re::DirectMemoryResource *)v15);
            if (*(_QWORD *)(v15 + 40) >= *((_QWORD *)v25 + 5))
              v20 = *((_QWORD *)v25 + 5);
            else
              v20 = *(_QWORD *)(v15 + 40);
            memcpy(v18, v19, v20);
          }
          v24 = v25;
          if (v25)
            v21 = (char *)v25 + 8;
          (*(void (**)(re::DirectResource *, uint64_t, uint64_t, re::DirectMemoryResource **))(*(_QWORD *)a2 + 56))(a2, a3, a4, &v24);
          if (v24)
          {

            v24 = 0;
          }
          if (v25)

LABEL_24:
          return;
        }
      }
      else if (!a6 && (v17 & 2) != 0)
      {
        goto LABEL_8;
      }
      v23 = v15;
      v22 = (id)(v15 + 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(_QWORD *)v13 + 48))(v13, a3, a4, &v23);
      if (v23)
      {

        v23 = 0;
      }
      if (re::isPrivateToThisProcess(*(_DWORD *)(v15 + 32)))
        re::DirectResourcesPendingCommit::updatePayload((uint64_t)v12, v15);
      goto LABEL_24;
    }
  }
}

uint64_t re::DirectResourceContext::ensureUncommitted(re::DirectResourceContext *this)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = *((_QWORD *)this + 21);
  if (!result)
  {
    kdebug_trace();
    v3 = operator new(0x50uLL);
    result = re::DirectResourcesPendingCommit::DirectResourcesPendingCommit((uint64_t)v3, (uint64_t)this);
    v4 = *((_QWORD *)this + 21);
    *((_QWORD *)this + 21) = result;
    if (v4)
    {

      result = *((_QWORD *)this + 21);
    }
    v6 = *((_QWORD *)this + 19);
    v5 = *((_QWORD *)this + 20);
    *((_QWORD *)this + 20) = v5 + 1;
    *(_QWORD *)(*(_QWORD *)(result + 24) + 16) = v5;
    if (v6)
    {
      if (*(_DWORD *)(result + 16))
        v5 = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
      std::function<void ()(re::DirectResourceContext *,unsigned long long)>::operator()((uint64_t)this + 128, (uint64_t)this, v5);
      return *((_QWORD *)this + 21);
    }
  }
  return result;
}

void re::DirectResourceContext::createPayload(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  int v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uuid_t v19;
  uuid_t dst;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  uuid_copy(dst, a2 + 16);
  v10 = (*(uint64_t (**)(unsigned __int8 *))(*(_QWORD *)a2 + 40))(a2);
  re::DirectResourceContext::reusePayload(a1, *(uint64_t *)dst, *(uint64_t *)&dst[8], v10, a3, a4, a5);
  if (!*a5)
  {
    if (*(_QWORD *)(a1 + 40) != 3)
      goto LABEL_8;
    v11 = *(_QWORD *)(a1 + 56);
    if (!v11)
      goto LABEL_8;
    v12 = *(_QWORD *)(a1 + 160) - 1;
    if (v12 <= v11)
      goto LABEL_8;
    re::DirectResourceContext::freeListWait((unint64_t *)a1, v12 - v11);
    uuid_copy(v19, a2 + 16);
    v13 = (*(uint64_t (**)(unsigned __int8 *))(*(_QWORD *)a2 + 40))(a2);
    re::DirectResourceContext::reusePayload(a1, *(uint64_t *)v19, *(uint64_t *)&v19[8], v13, a3, a4, &v18);
    v14 = *a5;
    v15 = v18;
    *a5 = v18;
    v18 = v14;
    if (v14)
    {

      v15 = *a5;
    }
    if (!v15)
    {
LABEL_8:
      (*(void (**)(uint64_t *__return_ptr, unsigned __int8 *, uint64_t, uint64_t, _QWORD))(*(_QWORD *)a2 + 88))(&v18, a2, a3, a4, *(_QWORD *)(a1 + 64));
      v16 = *a5;
      v17 = v18;
      *a5 = v18;
      v18 = v16;
      if (v16)
      {

        v17 = *a5;
      }
      if (v17)
        re::DirectResourceContext::addPayload((dispatch_queue_t *)a1, a2, a5);
    }
  }
}

uint64_t std::function<void ()(re::DirectResourceContext *,unsigned long long)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  re::DirectResourceContext *v5;
  uint64_t v6;
  uint64_t v7;

  v6 = a3;
  v7 = a2;
  v3 = *(_QWORD *)(a1 + 24);
  if (v3)
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(_QWORD *)v3 + 48))(v3, &v7, &v6);
  v5 = (re::DirectResourceContext *)std::__throw_bad_function_call[abi:nn180100]();
  return re::DirectResourceContext::ensureUncommittedFreeList(v5);
}

void re::DirectResourceContext::ensureUncommittedFreeList(re::DirectResourceContext *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  re::DirectResourcesReuseList *v5;
  uint64_t v6;
  uint64_t v7;

  if (!*((_QWORD *)this + 22))
  {
    v2 = re::DirectResourceContext::ensureUncommitted(this);
    if (*(_DWORD *)(v2 + 16))
      v3 = *(_QWORD *)(v2 + 32);
    else
      v3 = *(_QWORD *)(v2 + 24);
    v4 = *(_QWORD *)(v3 + 16);
    v5 = (re::DirectResourcesReuseList *)operator new(0x38uLL);
    re::DirectResourcesReuseList::DirectResourcesReuseList(v5, v4);
    v6 = *((_QWORD *)this + 22);
    *((_QWORD *)this + 22) = v7;
    if (v6)

  }
}

void re::DirectResourceContext::sendIfReady(const os_unfair_lock *this)
{
  os_unfair_lock_s **i;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  os_unfair_lock_assert_owner(this + 18);
  for (i = *(os_unfair_lock_s ***)&this[46]._os_unfair_lock_opaque;
        i != *(os_unfair_lock_s ***)&this[48]._os_unfair_lock_opaque;
        i = *(os_unfair_lock_s ***)&this[46]._os_unfair_lock_opaque)
  {
    v3 = *i;
    v4 = *i + 12;
    os_unfair_lock_lock(v4);
    v6 = *(_QWORD *)&v3[14]._os_unfair_lock_opaque;
    v5 = *(_QWORD *)&v3[16]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v4);
    if (v6 != v5)
      break;
    kdebug_trace();
    v7 = *(uint64_t **)&this[46]._os_unfair_lock_opaque;
    v8 = *v7;
    if (*v7)
    {
      v9 = (id)(v8 + 8);
      v7 = *(uint64_t **)&this[46]._os_unfair_lock_opaque;
    }
    v10 = v7 + 1;
    v11 = *(uint64_t **)&this[48]._os_unfair_lock_opaque;
    if (v7 + 1 != v11)
    {
      v12 = *v7;
      do
      {
        *(v10 - 1) = *v10;
        *v10++ = v12;
        ++v7;
      }
      while (v10 != v11);
      v10 = *(uint64_t **)&this[48]._os_unfair_lock_opaque;
    }
    if (v10 != v7)
    {
      v13 = v10;
      do
      {
        v15 = *--v13;
        v14 = v15;
        if (v15)
        {

          *(v10 - 1) = 0;
        }
        v10 = v13;
      }
      while (v13 != v7);
    }
    *(_QWORD *)&this[48]._os_unfair_lock_opaque = v7;
    kdebug_trace();
    if (*(_DWORD *)(v8 + 16) != 1)
      re::DirectResourceContext::sendIfReady();
    *(_DWORD *)(v8 + 16) = 2;
    v16 = *(_QWORD *)&this[20]._os_unfair_lock_opaque;
    if (v16)
    {
      v17 = *(_QWORD *)(v8 + 32);
      re::DirectResourceEvent::operator=((xpc_object_t *)(v17 + 32), *(id *)(v16 + 16));
      objc_msgSend(*(id *)(v16 + 16), sel_notifyListener_atValue_block_, *(_QWORD *)(v16 + 24), *(_QWORD *)(v17 + 16), *(_QWORD *)(v16 + 32));
    }
    if (*(_QWORD *)&this[30]._os_unfair_lock_opaque)
      std::function<void ()(re::DirectResourceContext *,unsigned long long)>::operator()((uint64_t)&this[24], (uint64_t)this, *(_QWORD *)(v8 + 32));
    kdebug_trace();
    kdebug_trace();

  }
}

void std::vector<re::DirectResourceId>::resize(_QWORD *a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(a1[1] - *a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2)
      a1[1] = *a1 + 16 * a2;
  }
  else
  {
    std::vector<re::DirectResourceId>::__append(a1, a2 - v2);
  }
}

void re::DirectResourceContext::destroyPayloads_anyThread(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  void *__p[3];
  id location;

  if (dispatch_get_specific(a1))
  {
    v5 = *a2;
    v4 = a2[1];
    while (v5 != v4)
    {
      re::DirectResourceContext::removePayload((uint64_t)a1, v5);
      v5 += 16;
    }
  }
  else
  {
    if (a1)
      v6 = a1 + 1;
    else
      v6 = 0;
    objc_initWeak(&location, v6);
    v7 = a1[3];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN2re21DirectResourceContext25destroyPayloads_anyThreadENSt3__16vectorINS_16DirectResourceIdENS1_9allocatorIS3_EEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_10;
    v9 = 0;
    objc_copyWeak(&v9, &location);
    std::vector<re::DirectResourceId>::vector(__p, (uint64_t)a2);
    dispatch_async(v7, block);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    objc_destroyWeak(&v9);
    v9 = 0;
    objc_destroyWeak(&location);
  }
}

unint64_t *re::DirectResourceContext::freeListWait(unint64_t *this, unint64_t a2)
{
  unint64_t *v2;
  unint64_t v3;
  re::DirectResourceContext *v5;

  v2 = this + 31;
  v3 = atomic_load(this + 31);
  if (v3 < a2)
  {
    v5 = (re::DirectResourceContext *)this;
    kdebug_trace();
    if (!__REALITYKIT_WAITING_ON_RENDERER__(v2, a2))
    {
      re::DirectResourceContext::freeListWaitTimedOut(v5, a2);
      __REALITYKIT_WAITING_ON_RENDERER__(v2, a2);
    }
    return (unint64_t *)kdebug_trace();
  }
  return this;
}

void re::DirectResourceContext::freeListWaitTimedOut(re::DirectResourceContext *this, unint64_t a2)
{
  re *v4;
  NSObject *v5;
  _BOOL8 v6;
  NSObject *v7;
  re *v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_unfair_lock_s *lock;
  _BYTE buf[12];
  __int16 v21;
  unint64_t v22;
  re *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  lock = (os_unfair_lock_s *)((char *)this + 72);
  os_unfair_lock_lock((os_unfair_lock_t)this + 18);
  v5 = re::directResourceLog(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v6)
    re::DirectResourceContext::freeListWaitTimedOut(v5);
  v7 = re::directResourceLog((re *)v6);
  v8 = (re *)os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v8)
  {
    v9 = atomic_load((unint64_t *)this + 31);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v9;
    v21 = 2048;
    v22 = a2;
    _os_log_impl(&dword_23A4DF000, v7, OS_LOG_TYPE_DEFAULT, "Renderer is at commit %llu, waiting for commit %llu", buf, 0x16u);
  }
  v10 = (uint64_t *)*((_QWORD *)this + 23);
  v11 = (uint64_t *)*((_QWORD *)this + 24);
  if (v10 != v11)
  {
    while (1)
    {
      v12 = *v10;
      v13 = *(_QWORD **)(*v10 + 32);
      if (v13)
        v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v13[33] - v13[32]) >> 3) + ((uint64_t)(v13[36] - v13[35]) >> 4);
      else
        v14 = 0;
      v15 = re::directResourceLog(v8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        if (*(_DWORD *)(v12 + 16))
          v16 = *(_QWORD *)(v12 + 32);
        else
          v16 = *(_QWORD *)(v12 + 24);
        v17 = *(_QWORD *)(v16 + 16);
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v17;
        v21 = 2048;
        v22 = v14;
        _os_log_impl(&dword_23A4DF000, v15, OS_LOG_TYPE_DEFAULT, "\tCommit %llu pending with %zu payloads", buf, 0x16u);
      }
      *(_QWORD *)buf = &off_250B65528;
      v23 = (re *)buf;
      re::DirectResourcesPendingCommit::forEachFence(v12, (uint64_t)buf);
      v8 = v23;
      if (v23 == (re *)buf)
        break;
      if (v23)
      {
        v18 = 5;
LABEL_18:
        v8 = (re *)(*(uint64_t (**)(void))(*(_QWORD *)v8 + 8 * v18))();
      }
      if (++v10 == v11)
        goto LABEL_20;
    }
    v8 = (re *)buf;
    v18 = 4;
    goto LABEL_18;
  }
LABEL_20:
  os_unfair_lock_unlock(lock);
}

uint64_t re::DirectResourceContext::DirectResourceContext(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  re::DirectResourcesReusePool *v7;
  uint64_t v8;
  ArcSharedObject *v9;
  ArcSharedObject *v10;
  uint64_t v11;

  ArcSharedObject::ArcSharedObject((ArcSharedObject *)a1, 0);
  *(_QWORD *)v4 = &off_250B65348;
  *(_QWORD *)(v4 + 16) = &unk_250B653C8;
  v5 = *a2;
  v6 = a2[1];
  *(_QWORD *)(v4 + 56) = *((_QWORD *)a2 + 4);
  *(_OWORD *)(v4 + 40) = v6;
  *(_OWORD *)(v4 + 24) = v5;
  *(_QWORD *)(a1 + 64) = *((id *)a2 + 5);
  *(_DWORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 76) = 1;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 160) = 1;
  *(_QWORD *)(a1 + 224) = 0;
  *(_QWORD *)(a1 + 232) = 0;
  *(_QWORD *)(a1 + 216) = 0;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 196) = 0u;
  v7 = (re::DirectResourcesReusePool *)operator new();
  re::DirectResourcesReusePool::DirectResourcesReusePool(v7);
  *(_OWORD *)(a1 + 248) = 0u;
  *(_QWORD *)(a1 + 240) = v8;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_QWORD *)(a1 + 280) = 0;
  *(_DWORD *)(a1 + 288) = 1065353216;
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_DWORD *)(a1 + 328) = 1065353216;
  *(_BYTE *)(a1 + 76) = *((_QWORD *)a2 + 1) == 0;
  if (*(_QWORD *)(a1 + 40) == 3)
  {
    v9 = (ArcSharedObject *)operator new(0x28uLL);
    v10 = re::DirectResourceCommitSignaling::DirectResourceCommitSignaling(v9, a1, *(void **)(a1 + 64));
    v11 = *(_QWORD *)(a1 + 80);
    *(_QWORD *)(a1 + 80) = v10;
    if (v11)

  }
  dispatch_retain(*(dispatch_object_t *)(a1 + 24));
  dispatch_queue_set_specific(*(dispatch_queue_t *)(a1 + 24), (const void *)a1, (void *)a1, 0);
  return a1;
}

void re::DirectResourceContext::~DirectResourceContext(re::DirectResourceContext *this)
{
  char *v2;
  id *i;
  id WeakRetained;
  void *v5;
  re::DirectResourcesReusePool *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  re::DirectResourceContext *v10;
  uint64_t v11;
  re::DirectResourceContext *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void **v16;

  v2 = (char *)this + 256;
  for (i = (id *)*((_QWORD *)this + 34); i; i = (id *)*i)
  {
    WeakRetained = objc_loadWeakRetained(i + 4);
    if (WeakRetained)
    {
      v5 = WeakRetained;
      re::DirectResource::setDelegate((uint64_t)WeakRetained - 8, 0);

    }
  }
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::clear((uint64_t)v2);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear((uint64_t)this + 296);
  v6 = (re::DirectResourcesReusePool *)*((_QWORD *)this + 30);
  if (v6)
  {
    re::DirectResourcesReusePool::~DirectResourcesReusePool(v6);
    MEMORY[0x23B84F8E0]();
  }
  *((_QWORD *)this + 30) = 0;
  v7 = (const void *)*((_QWORD *)this + 11);
  if (v7)
  {
    _Block_release(v7);
    *((_QWORD *)this + 11) = 0;
  }
  dispatch_queue_set_specific(*((dispatch_queue_t *)this + 3), this, 0, 0);
  dispatch_release(*((dispatch_object_t *)this + 3));
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table((uint64_t)this + 296);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::~__hash_table((uint64_t)v2);
  __ulock_wake();
  v16 = (void **)((char *)this + 216);
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v16);
  v16 = (void **)((char *)this + 184);
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v16);
  v8 = *((_QWORD *)this + 22);
  if (v8)
  {

    *((_QWORD *)this + 22) = 0;
  }
  v9 = *((_QWORD *)this + 21);
  if (v9)
  {

    *((_QWORD *)this + 21) = 0;
  }
  v10 = (re::DirectResourceContext *)*((_QWORD *)this + 19);
  if (v10 == (re::DirectResourceContext *)((char *)this + 128))
  {
    v11 = 4;
    v10 = (re::DirectResourceContext *)((char *)this + 128);
  }
  else
  {
    if (!v10)
      goto LABEL_18;
    v11 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v10 + 8 * v11))();
LABEL_18:
  v12 = (re::DirectResourceContext *)*((_QWORD *)this + 15);
  if (v12 == (re::DirectResourceContext *)((char *)this + 96))
  {
    v13 = 4;
    v12 = (re::DirectResourceContext *)((char *)this + 96);
  }
  else
  {
    if (!v12)
      goto LABEL_23;
    v13 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v12 + 8 * v13))();
LABEL_23:
  v14 = *((_QWORD *)this + 10);
  if (v14)
  {

    *((_QWORD *)this + 10) = 0;
  }
  v15 = (void *)*((_QWORD *)this + 8);
  if (v15)
  {

    *((_QWORD *)this + 8) = 0;
  }
  ArcSharedObject::~ArcSharedObject(this);
}

{
  re::DirectResourceContext::~DirectResourceContext(this);
  JUMPOUT(0x23B84F8E0);
}

void `non-virtual thunk to're::DirectResourceContext::~DirectResourceContext(re::DirectResourceContext *this)
{
  re::DirectResourceContext::~DirectResourceContext((re::DirectResourceContext *)((char *)this - 16));
}

{
  re::DirectResourceContext::~DirectResourceContext((re::DirectResourceContext *)((char *)this - 16));
  JUMPOUT(0x23B84F8E0);
}

void re::DirectResourceContext::createMesh(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  _BOOL8 v6;
  uint64_t v7;
  id v8;
  uint64_t v9[2];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  v6 = *(_QWORD *)(a1 + 32) != 2;
  v9[0] = *(_QWORD *)(a1 + 64);
  v9[1] = v6;
  re::DirectMesh::create(a2, v9, a3);
  v7 = *a3;
  if (*a3)
  {
    v9[0] = *a3;
    v8 = (id)(v7 + 8);
    re::DirectResourceContext::addResource(a1, v9);
    if (v9[0])

  }
}

uint64_t re::DirectResourceContext::addResource(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t result;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  re::DirectResource::setDelegate(*a2, a1 + 16);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__emplace_unique_impl<unsigned char const(&)[16],re::SharedPtr<re::DirectResource> const&>((_QWORD *)(a1 + 256), (const unsigned __int8 *)(*a2 + 16), a2);
  if (*(_QWORD *)(*a2 + 32))
    goto LABEL_10;
  v4 = re::DirectResourceContext::ensureUncommitted((re::DirectResourceContext *)a1);
  re::DirectResourcesPendingCommit::addResource(v4, (const unsigned __int8 *)*a2);
  v5 = *a2;
  if (*a2)
  {
    v6 = (id)(v5 + 8);
    v12 = 0;
    v7 = (id)(v5 + 8);
  }
  v11[0] = &off_250B65570;
  v11[1] = a1;
  v11[2] = v5;
  v12 = v11;
  (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v5 + 64))(v5, v11);
  v8 = v12;
  if (v12 == v11)
  {
    v9 = 4;
    v8 = v11;
    goto LABEL_8;
  }
  if (v12)
  {
    v9 = 5;
LABEL_8:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }

LABEL_10:
  result = *(_QWORD *)(a1 + 88);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(result + 16))(result, a1, 0, *a2);
  return result;
}

void re::DirectResourceContext::createTexture(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  _BOOL8 v6;
  uint64_t v7;
  id v8;
  uint64_t v9[2];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  v6 = *(_QWORD *)(a1 + 32) != 2;
  v9[0] = *(_QWORD *)(a1 + 64);
  v9[1] = v6;
  re::DirectTexture::create(a2, v9, a3);
  v7 = *a3;
  if (*a3)
  {
    v9[0] = *a3;
    v8 = (id)(v7 + 8);
    re::DirectResourceContext::addResource(a1, v9);
    if (v9[0])

  }
}

void re::DirectResourceContext::createBuffer(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  _BOOL8 v6;
  uint64_t v7;
  id v8;
  uint64_t v9[2];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  v6 = *(_QWORD *)(a1 + 32) != 2;
  v9[0] = *(_QWORD *)(a1 + 64);
  v9[1] = v6;
  re::DirectBuffer::create(a2, v9, a3);
  v7 = *a3;
  if (*a3)
  {
    v9[0] = *a3;
    v8 = (id)(v7 + 8);
    re::DirectResourceContext::addResource(a1, v9);
    if (v9[0])

  }
}

void re::DirectResourceContext::createMaterial(uint64_t a1@<X0>, unint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  _BOOL8 v6;
  uint64_t v7;
  id v8;
  uint64_t v9[2];

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  v6 = *(_QWORD *)(a1 + 32) != 2;
  v9[0] = *(_QWORD *)(a1 + 64);
  v9[1] = v6;
  re::DirectMaterialParameters::create(a2, a3);
  v7 = *a3;
  if (*a3)
  {
    v9[0] = *a3;
    v8 = (id)(v7 + 8);
    re::DirectResourceContext::addResource(a1, v9);
    if (v9[0])

  }
}

void re::DirectResourceContext::reusePayload(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  os_unfair_lock_s *v14;

  v14 = (os_unfair_lock_s *)(a1 + 208);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
  re::DirectResourcesReusePool::take(*(_QWORD **)(a1 + 240), a2, a3, a4, a5, a6, a7);
  os_unfair_lock_unlock(v14);
}

void re::DirectResourceContext::addPayload(dispatch_queue_t *a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v6;
  unsigned __int8 v7[16];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(a1[3]);
  if (a2[4])
    re::DirectResourceContext::addPayload();
  (*(void (**)(_QWORD *))(*a2 + 40))(a2);
  kdebug_trace();
  v6 = re::DirectResourceContext::ensureUncommitted((re::DirectResourceContext *)a1);
  re::DirectResourcesPendingCommit::addPayload(v6, *a3);
  std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMemoryResource>>::pair[abi:nn180100]<unsigned char const(&)[16],re::SharedPtr<re::DirectMemoryResource> const&,0>((uint64_t)v7, (const unsigned __int8 *)(*a3 + 16), a3);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>((uint64_t)(a1 + 37), v7, (uint64_t)v7);
  if (v8)

}

uint64_t re::DirectResourceContext::removeResource(re::DirectResourceContext *this, re::DirectResource *a2)
{
  uint64_t v4;
  int v5;
  unsigned __int8 *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uuid_t v12;
  uuid_t v13;
  uuid_t dst;
  re::DirectResource *v15;
  unsigned __int8 *v16;
  uuid_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*((dispatch_queue_t *)this + 3));
  re::DirectResource::setDelegate((uint64_t)a2, 0);
  uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__erase_unique<re::DirectResourceId>((_QWORD *)this + 32, dst);
  if (*((_QWORD *)a2 + 4))
    goto LABEL_11;
  v4 = re::DirectResourceContext::ensureUncommitted(this);
  v5 = (*(uint64_t (**)(re::DirectResource *))(*(_QWORD *)a2 + 40))(a2);
  uuid_copy(v17, (const unsigned __int8 *)a2 + 16);
  re::DirectResourcesPendingCommit::destroyResource(v4, v5, *(uint64_t *)v17, *(uint64_t *)&v17[8]);
  *(_QWORD *)dst = &off_250B655B8;
  *(_QWORD *)&dst[8] = this;
  v15 = a2;
  v16 = dst;
  (*(void (**)(re::DirectResource *, unsigned __int8 *))(*(_QWORD *)a2 + 64))(a2, dst);
  v6 = v16;
  if (v16 == dst)
  {
    v7 = 4;
    v6 = dst;
  }
  else
  {
    if (!v16)
      goto LABEL_7;
    v7 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v6 + 8 * v7))();
LABEL_7:
  os_unfair_lock_lock((os_unfair_lock_t)this + 52);
  v8 = (_QWORD *)*((_QWORD *)this + 30);
  uuid_copy(v13, (const unsigned __int8 *)a2 + 16);
  re::DirectResourcesReusePool::purgePayloads(v8, *(uint64_t *)v13, *(uint64_t *)&v13[8], (uint64_t *)dst);
  v9 = *(_QWORD *)dst;
  v10 = *(_QWORD *)&dst[8];
  while (v9 != v10)
  {
    uuid_copy(v12, (const unsigned __int8 *)(*(_QWORD *)(v9 + 48) + 16));
    re::DirectResourceContext::removePayload((uint64_t)this, (uint64_t)v12);
    v9 += 56;
  }
  *(_QWORD *)v12 = dst;
  std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100]((void ***)v12);
  os_unfair_lock_unlock((os_unfair_lock_t)this + 52);
LABEL_11:
  result = *((_QWORD *)this + 11);
  if (result)
    return (*(uint64_t (**)(uint64_t, re::DirectResourceContext *, uint64_t, re::DirectResource *))(result + 16))(result, this, 2, a2);
  return result;
}

void re::DirectResourceContext::removePayload(uint64_t a1, uint64_t a2)
{
  const unsigned __int8 *v4;
  uint64_t *v5;
  uint64_t v6;
  NSObject *v7;
  char v8[37];
  uint8_t buf[4];
  char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>((_QWORD *)(a1 + 296), (unsigned __int8 *)a2);
  if (v4)
  {
    v5 = (uint64_t *)v4;
    kdebug_trace();
    v6 = re::DirectResourceContext::ensureUncommitted((re::DirectResourceContext *)a1);
    re::DirectResourcesPendingCommit::removePayload(v6, *(_QWORD *)a2, *(_QWORD *)(a2 + 8));
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::erase((_QWORD *)(a1 + 296), v5);
  }
  else
  {
    v7 = re::directResourceLog(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      re::toString((re *)a2, v8);
      *(_DWORD *)buf = 136315138;
      v10 = v8;
      _os_log_impl(&dword_23A4DF000, v7, OS_LOG_TYPE_DEFAULT, "Unable to find payload %s for removal", buf, 0xCu);
    }
  }
}

void re::DirectResourceContext::willChange(uint64_t a1, re::DirectResource *a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
  uint64_t v12;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (!*((_QWORD *)a2 + 4))
  {
    re::DirectResourceContext::recreatePayloadIfNecessary((re::DirectResourceContext *)a1, a2, a3, a4, a5, (uint64_t)a6);
    if (a6)
    {
      v12 = *(_QWORD *)(a1 + 168);
      if (v12)
      {
        if (*(_BYTE *)(a1 + 76))
          re::DirectResourcesPendingCommit::addCommandBuffer(v12, a6);
      }
    }
  }
}

void `non-virtual thunk to're::DirectResourceContext::willChange(uint64_t a1, re::DirectResource *a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
  re::DirectResourceContext::willChange(a1 - 16, a2, a3, a4, a5, a6);
}

uint64_t re::DirectResourceContext::didChange(uint64_t a1, re::DirectResource *a2, int a3, uint64_t a4)
{
  re::DirectResourcesPendingCommit *v12;
  uint64_t v13;
  re::DirectResourcesPendingCommit *v14;
  uint64_t result;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (!*((_QWORD *)a2 + 4))
  {
    if ((*(unsigned int (**)(re::DirectResource *))(*(_QWORD *)a2 + 40))(a2) == 1 && a3 == 0 && a4 == 0)
    {
      v14 = (re::DirectResourcesPendingCommit *)re::DirectResourceContext::ensureUncommitted((re::DirectResourceContext *)a1);
      *(_QWORD *)(re::DirectResourcesPendingCommit::ensureUpdate(v14, a2) + 16) = *((_QWORD *)a2 + 16);
    }
    else if ((*(unsigned int (**)(re::DirectResource *))(*(_QWORD *)a2 + 40))(a2) == 3
           && a3 == 0
           && a4 == 0)
    {
      v12 = (re::DirectResourcesPendingCommit *)re::DirectResourceContext::ensureUncommitted((re::DirectResourceContext *)a1);
      v13 = re::DirectResourcesPendingCommit::ensureUpdate(v12, a2);
      *(_QWORD *)(v13 + 24) = *((_QWORD *)a2 + 8);
      *(_BYTE *)(v13 + 32) = 1;
    }
  }
  result = (*(uint64_t (**)(re::DirectResource *))(*(_QWORD *)a2 + 40))(a2);
  if ((_DWORD)result == 1 && a3 == 0 && a4 == 0)
  {
    result = *(_QWORD *)(a1 + 88);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, re::DirectResource *))(result + 16))(result, a1, 1, a2);
  }
  return result;
}

uint64_t `non-virtual thunk to're::DirectResourceContext::didChange(uint64_t a1, re::DirectResource *a2, int a3, uint64_t a4)
{
  return re::DirectResourceContext::didChange(a1 - 16, a2, a3, a4);
}

void re::DirectResourceContext::payloadWillReplace(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  int64x2_t *v14;
  int64x2_t *v15;
  int v16;
  id v17;
  uint64_t v18;
  uuid_t dst;
  uuid_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (*(_QWORD *)(a1 + 40))
  {
    v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a2 + 48))(a2, a3, a4);
    if (v8)
    {
      v9 = v8;
      v10 = (void *)(v8 + 8);
      v11 = (id)(v8 + 8);
      v12 = *(_QWORD *)(a2 + 32);
      if ((*(_DWORD *)(v9 + 32) - 1) <= 6 && v12 == 0)
      {
        re::DirectResourceContext::ensureUncommittedFreeList((re::DirectResourceContext *)a1);
        v15 = v14;
        uuid_copy(v20, (const unsigned __int8 *)(a2 + 16));
        v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 40))(a2);
        v18 = v9;
        v17 = v10;
        re::DirectResourcesReuseList::add(v15, *(uint64_t *)v20, *(uint64_t *)&v20[8], v16, a3, a4, &v18);
        if (v18)
        {

          v18 = 0;
        }
      }
      else if (!v12)
      {
        uuid_copy(dst, (const unsigned __int8 *)(v9 + 16));
        re::DirectResourceContext::removePayload(a1, (uint64_t)dst);
      }

    }
  }
}

void `non-virtual thunk to're::DirectResourceContext::payloadWillReplace(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  re::DirectResourceContext::payloadWillReplace(a1 - 16, a2, a3, a4);
}

uint64_t re::DirectResourceContext::payloadDidReplace(uint64_t a1, re::DirectResource *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  re::DirectResourcesPendingCommit *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (!*((_QWORD *)a2 + 4))
  {
    v9 = (*(uint64_t (**)(re::DirectResource *, uint64_t, uint64_t))(*(_QWORD *)a2 + 48))(a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = (re::DirectResourcesPendingCommit *)re::DirectResourceContext::ensureUncommitted((re::DirectResourceContext *)a1);
      v12 = re::DirectResourcesPendingCommit::ensureUpdate(v11, a2);
      if (v12)
      {
        v13 = v12;
        v16 = v10;
        v14 = (id)(v10 + 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(_QWORD *)v13 + 48))(v13, a3, a4, &v16);
        if (v16)
        {

          v16 = 0;
        }
      }
      if (re::isPrivateToThisProcess(*(_DWORD *)(v10 + 32)))
      {
        v15 = re::DirectResourceContext::ensureUncommitted((re::DirectResourceContext *)a1);
        re::DirectResourcesPendingCommit::updatePayload(v15, v10);
      }
    }
  }
  result = *(_QWORD *)(a1 + 88);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, re::DirectResource *))(result + 16))(result, a1, 1, a2);
  return result;
}

uint64_t `non-virtual thunk to're::DirectResourceContext::payloadDidReplace(uint64_t a1, re::DirectResource *a2, uint64_t a3, uint64_t a4)
{
  return re::DirectResourceContext::payloadDidReplace(a1 - 16, a2, a3, a4);
}

void re::DirectResourceContext::destroyResource(re::DirectResourceContext *this, re::DirectResource *a2)
{
  char *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7[2];
  id location;

  if (dispatch_get_specific(this))
  {
    re::DirectResourceContext::removeResource(this, a2);
    re::DirectResource::dispose(a2);
  }
  else
  {
    if (this)
      v4 = (char *)this + 8;
    else
      v4 = 0;
    objc_initWeak(&location, v4);
    v5 = *((_QWORD *)this + 3);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 1174405120;
    block[2] = ___ZN2re21DirectResourceContext15destroyResourceEPNS_14DirectResourceE_block_invoke;
    block[3] = &__block_descriptor_tmp_9;
    v7[0] = 0;
    objc_copyWeak(v7, &location);
    v7[1] = a2;
    dispatch_async(v5, block);
    objc_destroyWeak(v7);
    v7[0] = 0;
    objc_destroyWeak(&location);
  }
}

void ___ZN2re21DirectResourceContext15destroyResourceEPNS_14DirectResourceE_block_invoke(uint64_t a1)
{
  char *WeakRetained;
  void *v3;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    re::DirectResourceContext::removeResource((re::DirectResourceContext *)(WeakRetained - 8), *(re::DirectResource **)(a1 + 40));

  }
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = 0;
  re::DirectResource::dispose(*(re::DirectResource **)(a1 + 40));
}

void `non-virtual thunk to're::DirectResourceContext::destroyResource(re::DirectResourceContext *this, re::DirectResource *a2)
{
  re::DirectResourceContext::destroyResource((re::DirectResourceContext *)((char *)this - 16), a2);
}

void ___ZN2re21DirectResourceContext25destroyPayloads_anyThreadENSt3__16vectorINS_16DirectResourceIdENS1_9allocatorIS3_EEEE_block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v3 = (uint64_t)WeakRetained - 8;
  else
    v3 = 0;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    while (v5 != v6)
    {
      re::DirectResourceContext::removePayload(v3, v5);
      v5 += 16;
    }

  }
}

_QWORD *__copy_helper_block_8_32c50_ZTSN2re10ArcWeakPtrINS_21DirectResourceContextEEE40c63_ZTSNSt3__16vectorIN2re16DirectResourceIdENS_9allocatorIS2_EEEE(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)(a1 + 32) = 0;
  v3 = a1 + 32;
  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));
  return std::vector<re::DirectResourceId>::vector((_QWORD *)(v3 + 8), a2 + 40);
}

void __destroy_helper_block_8_32c50_ZTSN2re10ArcWeakPtrINS_21DirectResourceContextEEE40c63_ZTSNSt3__16vectorIN2re16DirectResourceIdENS_9allocatorIS2_EEEE(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(_QWORD *)(a1 + 48) = v2;
    operator delete(v2);
  }
  objc_destroyWeak((id *)(a1 + 32));
  *(_QWORD *)(a1 + 32) = 0;
}

void *re::DirectResourceContext::setObserver(uint64_t a1, void *aBlock)
{
  const void *v4;
  void *result;

  v4 = *(const void **)(a1 + 88);
  if (v4)
    _Block_release(v4);
  result = _Block_copy(aBlock);
  *(_QWORD *)(a1 + 88) = result;
  return result;
}

_QWORD *re::DirectResourceContext::setBeginCallback(uint64_t a1, uint64_t a2)
{
  return std::function<void ()(re::DirectResourceContext *,unsigned long long)>::operator=((_QWORD *)(a1 + 128), a2);
}

_QWORD *std::function<void ()(re::DirectResourceContext *,unsigned long long)>::operator=(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__value_func[abi:nn180100]((uint64_t)v6, a2);
  std::__function::__value_func<void ()(re::DirectResourceContext *,unsigned long long)>::swap[abi:nn180100](v6, a1);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
    goto LABEL_5;
  }
  if (v7)
  {
    v4 = 5;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }
  return a1;
}

_QWORD *re::DirectResourceContext::setCompleteCallback(uint64_t a1, uint64_t a2)
{
  return std::function<void ()(re::DirectResourceContext *,unsigned long long)>::operator=((_QWORD *)(a1 + 96), a2);
}

void re::DirectResourceContext::commit(re::DirectResourceContext *this)
{
  os_unfair_lock_s *v2;
  re::DirectResourcesPendingCommit *v3;
  unint64_t v4;
  re::DirectResourcesPendingCommit **v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  re::DirectResourcesPendingCommit **v13;
  char *v14;
  re::DirectResourcesPendingCommit *v15;
  __int128 v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  char *v25;
  char *v26;

  v2 = (os_unfair_lock_s *)((char *)this + 72);
  os_unfair_lock_lock((os_unfair_lock_t)this + 18);
  if (*((_QWORD *)this + 21))
  {
    kdebug_trace();
    v3 = (re::DirectResourcesPendingCommit *)*((_QWORD *)this + 21);
    *((_QWORD *)this + 21) = 0;
    re::DirectResourcesPendingCommit::scheduled(v3);
    v4 = *((_QWORD *)this + 25);
    v5 = (re::DirectResourcesPendingCommit **)*((_QWORD *)this + 24);
    if ((unint64_t)v5 >= v4)
    {
      v7 = (_QWORD *)*((_QWORD *)this + 23);
      v8 = v5 - (re::DirectResourcesPendingCommit **)v7;
      v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) >> 61)
        abort();
      v10 = v4 - (_QWORD)v7;
      if (v10 >> 2 > v9)
        v9 = v10 >> 2;
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8)
        v11 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v11 = v9;
      v26 = (char *)this + 200;
      if (v11)
      {
        v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)this + 200, v11);
        v7 = (_QWORD *)*((_QWORD *)this + 23);
        v5 = (re::DirectResourcesPendingCommit **)*((_QWORD *)this + 24);
      }
      else
      {
        v12 = 0;
      }
      v13 = (re::DirectResourcesPendingCommit **)&v12[8 * v8];
      v14 = &v12[8 * v11];
      v25 = v14;
      *v13 = v3;
      *((_QWORD *)&v24 + 1) = v13 + 1;
      if (v5 == v7)
      {
        v6 = v13 + 1;
      }
      else
      {
        do
        {
          v15 = *--v5;
          *--v13 = v15;
          *v5 = 0;
        }
        while (v5 != v7);
        v6 = (_QWORD *)*((_QWORD *)&v24 + 1);
        v14 = v25;
      }
      v16 = *(_OWORD *)((char *)this + 184);
      *((_QWORD *)this + 23) = v13;
      *((_QWORD *)this + 24) = v6;
      v24 = v16;
      v17 = (char *)*((_QWORD *)this + 25);
      *((_QWORD *)this + 25) = v14;
      v25 = v17;
      v23 = v16;
      std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)&v23);
    }
    else
    {
      *v5 = v3;
      v6 = v5 + 1;
    }
    *((_QWORD *)this + 24) = v6;
  }
  if (*((_QWORD *)this + 22))
  {
    kdebug_trace();
    re::DirectResourceContext::freeListAppend((uint64_t)this, (_QWORD *)this + 22);
    v18 = *((_QWORD *)this + 22);
    if (v18)
    {

      *((_QWORD *)this + 22) = 0;
    }
  }
  re::DirectResourceContext::sendIfReady((const os_unfair_lock *)this);
  v19 = *((_QWORD *)this + 5);
  if (v19 == 2)
  {
    v22 = *((_QWORD *)this + 20);
    v21 = v22 - 2;
    if (v22 >= 2)
      goto LABEL_27;
  }
  else if (v19 == 1)
  {
    v20 = *((_QWORD *)this + 20);
    if (v20)
    {
      v21 = v20 - 1;
LABEL_27:
      re::DirectResourceContext::freeListReady(this, v21);
    }
  }
  os_unfair_lock_unlock(v2);
}

void re::DirectResourceContext::freeListAppend(uint64_t a1, _QWORD *a2)
{
  os_unfair_lock_s *v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  __int128 v17;
  char *v18;
  uint64_t v19;
  __int128 v20;
  char *v21;
  uint64_t v22;

  v4 = (os_unfair_lock_s *)(a1 + 208);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
  v5 = *(_QWORD *)(a1 + 232);
  v6 = *(_QWORD **)(a1 + 224);
  if ((unint64_t)v6 >= v5)
  {
    v8 = *(_QWORD **)(a1 + 216);
    v9 = v6 - v8;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61)
      abort();
    v11 = v5 - (_QWORD)v8;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    v22 = a1 + 232;
    if (v12)
    {
      v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(a1 + 232, v12);
      v8 = *(_QWORD **)(a1 + 216);
      v6 = *(_QWORD **)(a1 + 224);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    v21 = v15;
    *(_QWORD *)v14 = *a2;
    *a2 = 0;
    *((_QWORD *)&v20 + 1) = v14 + 8;
    if (v6 == v8)
    {
      v7 = v14 + 8;
    }
    else
    {
      do
      {
        v16 = *--v6;
        *((_QWORD *)v14 - 1) = v16;
        v14 -= 8;
        *v6 = 0;
      }
      while (v6 != v8);
      v7 = (_QWORD *)*((_QWORD *)&v20 + 1);
      v15 = v21;
    }
    v17 = *(_OWORD *)(a1 + 216);
    *(_QWORD *)(a1 + 216) = v14;
    *(_QWORD *)(a1 + 224) = v7;
    v20 = v17;
    v18 = *(char **)(a1 + 232);
    *(_QWORD *)(a1 + 232) = v15;
    v21 = v18;
    v19 = v17;
    std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)&v19);
  }
  else
  {
    *v6 = *a2;
    v7 = v6 + 1;
    *a2 = 0;
  }
  *(_QWORD *)(a1 + 224) = v7;
  os_unfair_lock_unlock(v4);
}

uint64_t re::DirectResourcesCommitQueue::DirectResourcesCommitQueue(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  id v5;

  ArcSharedObject::ArcSharedObject((ArcSharedObject *)a1, 0);
  *v4 = &off_250B65470;
  v4[2] = *(_QWORD *)(a2 + 24);
  v4[3] = 0;
  v4[4] = a2;
  v5 = (id)(a2 + 8);
  *(_DWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  return a1;
}

void re::DirectResourcesCommitQueue::~DirectResourcesCommitQueue(dispatch_object_t *this)
{
  dispatch_object_t v2;
  void **v3;

  dispatch_release(this[2]);
  v3 = (void **)(this + 6);
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  v2 = this[4];
  if (v2)
  {

    this[4] = 0;
  }
  ArcSharedObject::~ArcSharedObject((ArcSharedObject *)this);
}

{
  re::DirectResourcesCommitQueue::~DirectResourcesCommitQueue(this);
  JUMPOUT(0x23B84F8E0);
}

void re::DirectResourcesCommitQueue::enumerate(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (os_unfair_lock_s *)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(a1 + 56) == v5)
  {
LABEL_6:
    os_unfair_lock_unlock(v4);
  }
  else
  {
    v6 = 0;
    while (1)
    {
      v9 = *(_QWORD *)(v5 + 8 * v6);
      v7 = *(_QWORD *)(a2 + 24);
      if (!v7)
        break;
      if (((*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v7 + 48))(v7, &v9) & 1) != 0)
      {
        ++v6;
        v5 = *(_QWORD *)(a1 + 48);
        if (v6 < (*(_QWORD *)(a1 + 56) - v5) >> 3)
          continue;
      }
      goto LABEL_6;
    }
    v8 = std::__throw_bad_function_call[abi:nn180100]();
    re::DirectResourcesCommitQueue::commitThrough(v8);
  }
}

void re::DirectResourcesCommitQueue::commitThrough(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v6;
  __int128 v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t *v10;
  re::DirectResourcesResolvedCommit **v11;
  re::DirectResourcesResolvedCommit **v12;
  re::DirectResourcesResolvedCommit *v13;
  re::DirectResourcesResolvedCommit **v14;
  re::DirectResourcesResolvedCommit **v15;
  re::DirectResourcesResolvedCommit *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  re::DirectResourcesResolvedCommit **v21;
  __int128 v22;
  re::DirectResourcesResolvedCommit ***v23;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  v21 = *(re::DirectResourcesResolvedCommit ***)(a1 + 48);
  v6 = (uint64_t *)v21;
  v7 = *(_OWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  v22 = v7;
  *(_QWORD *)(a1 + 64) = 0;
  v8 = (uint64_t *)v7;
  if ((uint64_t *)v7 != v6)
  {
    v9 = (uint64_t)(v7 - (_QWORD)v6) >> 3;
    if (v9 <= 1)
      v9 = 1;
    v10 = v6;
    while (*(_QWORD *)(*v6 + 24) <= a2)
    {
      ++v10;
      ++v6;
      if (!--v9)
        goto LABEL_9;
    }
    std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::__insert_with_size[abi:nn180100]<std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>>((uint64_t *)(a1 + 48), 0, v10, (uint64_t *)v7, (uint64_t)(v7 - (_QWORD)v10) >> 3);
    std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::erase((uint64_t)&v21, v10, v8);
  }
LABEL_9:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  if (v21 != (re::DirectResourcesResolvedCommit **)v22)
  {
    kdebug_trace();
    v11 = v21;
    v12 = (re::DirectResourcesResolvedCommit **)v22;
    while (v11 != v12)
    {
      v13 = *v11++;
      re::DirectResourcesResolvedCommit::apply(v13, *(re::DirectResourceContext **)(a1 + 32));
    }
    if (*(_QWORD *)(a3 + 24))
    {
      v14 = v21;
      v15 = (re::DirectResourcesResolvedCommit **)v22;
      while (v14 != v15)
      {
        v16 = *v14;
        v23 = (re::DirectResourcesResolvedCommit ***)*((_QWORD *)*v14 + 3);
        v17 = *(_QWORD *)(a3 + 24);
        if (!v17)
        {
          v18 = std::__throw_bad_function_call[abi:nn180100]();
          std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::erase(v18, v19, v20);
          return;
        }
        (*(void (**)(uint64_t, uint64_t, re::DirectResourcesResolvedCommit ****))(*(_QWORD *)v17 + 48))(v17, (uint64_t)v16 + 40, &v23);
        ++v14;
      }
    }
    kdebug_trace();
  }
  v23 = &v21;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v23);
}

uint64_t *std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::erase(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (a2 != a3)
  {
    v5 = a3;
    v6 = *(uint64_t **)(a1 + 8);
    if (a3 == v6)
    {
      v8 = a2;
    }
    else
    {
      v7 = a3 - a2;
      v8 = a2;
      do
      {
        v9 = *v8;
        *v8 = v8[v7];
        v8[v7] = v9;
        ++v8;
      }
      while (&v8[v7] != v6);
      v5 = *(uint64_t **)(a1 + 8);
    }
    if (v5 != v8)
    {
      v10 = v5;
      do
      {
        v12 = *--v10;
        v11 = v12;
        if (v12)
        {

          *(v5 - 1) = 0;
        }
        v5 = v10;
      }
      while (v10 != v8);
    }
    *(_QWORD *)(a1 + 8) = v8;
  }
  return a2;
}

void re::DirectResourcesCommitQueue::enqueueCommit_threadSafe(uint64_t a1, _QWORD *a2)
{
  os_unfair_lock_s *v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  __int128 v17;
  char *v18;
  uint64_t v19;
  __int128 v20;
  char *v21;
  uint64_t v22;

  v4 = (os_unfair_lock_s *)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  kdebug_trace();
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD **)(a1 + 56);
  if ((unint64_t)v6 >= v5)
  {
    v8 = *(_QWORD **)(a1 + 48);
    v9 = v6 - v8;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61)
      abort();
    v11 = v5 - (_QWORD)v8;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    v22 = a1 + 64;
    if (v12)
    {
      v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(a1 + 64, v12);
      v8 = *(_QWORD **)(a1 + 48);
      v6 = *(_QWORD **)(a1 + 56);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    v21 = v15;
    *(_QWORD *)v14 = *a2;
    *a2 = 0;
    *((_QWORD *)&v20 + 1) = v14 + 8;
    if (v6 == v8)
    {
      v7 = v14 + 8;
    }
    else
    {
      do
      {
        v16 = *--v6;
        *((_QWORD *)v14 - 1) = v16;
        v14 -= 8;
        *v6 = 0;
      }
      while (v6 != v8);
      v7 = (_QWORD *)*((_QWORD *)&v20 + 1);
      v15 = v21;
    }
    v17 = *(_OWORD *)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v14;
    *(_QWORD *)(a1 + 56) = v7;
    v20 = v17;
    v18 = *(char **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v15;
    v21 = v18;
    v19 = v17;
    std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)&v19);
  }
  else
  {
    *v6 = *a2;
    v7 = v6 + 1;
    *a2 = 0;
  }
  *(_QWORD *)(a1 + 56) = v7;
  os_unfair_lock_unlock(v4);
}

void re::DirectResourcesCommitQueue::takeCommits_threadSafe(re::DirectResourcesCommitQueue *this, re::DirectResourcesCommitQueue *a2)
{
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  uint64_t *v6;
  uint64_t *v7;

  v4 = (os_unfair_lock_s *)((char *)this + 40);
  v5 = (os_unfair_lock_s *)((char *)a2 + 40);
  std::lock[abi:nn180100]<re::UnfairLock,re::UnfairLock>((os_unfair_lock_s *)this + 10, (os_unfair_lock_s *)a2 + 10);
  v6 = (uint64_t *)*((_QWORD *)a2 + 6);
  v7 = (uint64_t *)*((_QWORD *)a2 + 7);
  if (v6 != v7)
  {
    std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::__insert_with_size[abi:nn180100]<std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>>((uint64_t *)this + 6, *((_QWORD *)this + 7), v6, v7, v7 - v6);
    *((_QWORD *)a2 + 3) = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a2 + 7) - 8) + 24);
    std::vector<re::SharedPtr<re::DirectBuffer>>::__clear[abi:nn180100]((uint64_t *)a2 + 6);
  }
  os_unfair_lock_unlock(v4);
  os_unfair_lock_unlock(v5);
}

void re::DirectResourcesCommitQueue::takeCommitsThrough_threadSafe(re::DirectResourcesCommitQueue *this, re::DirectResourcesCommitQueue *a2, unint64_t a3)
{
  os_unfair_lock_s *v6;
  os_unfair_lock_s *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v6 = (os_unfair_lock_s *)((char *)this + 40);
  v7 = (os_unfair_lock_s *)((char *)a2 + 40);
  std::lock[abi:nn180100]<re::UnfairLock,re::UnfairLock>((os_unfair_lock_s *)this + 10, (os_unfair_lock_s *)a2 + 10);
  v8 = (uint64_t *)*((_QWORD *)a2 + 6);
  v9 = *((_QWORD *)a2 + 7) - (_QWORD)v8;
  if (v9)
  {
    v10 = 0;
    v11 = v9 >> 3;
    if (v11 <= 1)
      v11 = 1;
    while (*(_QWORD *)(v8[v10] + 24) <= a3)
    {
      if (v11 == ++v10)
      {
        v10 = v11;
        goto LABEL_8;
      }
    }
    if (!v10)
      goto LABEL_9;
LABEL_8:
    std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::__insert_with_size[abi:nn180100]<std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>>((uint64_t *)this + 6, *((_QWORD *)this + 7), *((uint64_t **)a2 + 6), &v8[v10], v10);
    *((_QWORD *)a2 + 3) = *(_QWORD *)(*(_QWORD *)(*((_QWORD *)a2 + 6) + 8 * v10 - 8) + 24);
    std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::erase((uint64_t)a2 + 48, v8, &v8[v10]);
  }
LABEL_9:
  os_unfair_lock_unlock(v6);
  os_unfair_lock_unlock(v7);
}

uint64_t re::DirectResourcesCommitQueue::device(re::DirectResourcesCommitQueue *this)
{
  return *(_QWORD *)(*((_QWORD *)this + 4) + 64);
}

uint64_t re::DirectResourcesCommitQueue::availableCommitId_threadSafe(os_unfair_lock_s *this)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v5;

  v2 = this + 10;
  os_unfair_lock_lock(this + 10);
  v3 = *(_QWORD *)&this[14]._os_unfair_lock_opaque;
  if (*(_QWORD *)&this[12]._os_unfair_lock_opaque == v3)
    v4 = this + 6;
  else
    v4 = (os_unfair_lock_s *)(*(_QWORD *)(v3 - 8) + 24);
  v5 = *(_QWORD *)&v4->_os_unfair_lock_opaque;
  os_unfair_lock_unlock(v2);
  return v5;
}

uint64_t re::DirectResourceClientReceiver::DirectResourceClientReceiver(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  _QWORD *v8;

  ArcSharedObject::ArcSharedObject((ArcSharedObject *)a1, 0);
  *v8 = &off_250B654A8;
  v8[2] = a2;
  v8[3] = a3;
  *(_QWORD *)(a1 + 32) = a4;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_DWORD *)(a1 + 72) = 1065353216;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 1065353216;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_DWORD *)(a1 + 152) = 1065353216;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_DWORD *)(a1 + 192) = 1065353216;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_DWORD *)(a1 + 232) = 1065353216;
  dispatch_retain(*(dispatch_object_t *)(a1 + 24));
  return a1;
}

void re::DirectResourceClientReceiver::~DirectResourceClientReceiver(dispatch_object_t *this)
{
  dispatch_object_t v2;

  dispatch_release(this[3]);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table((uint64_t)(this + 25));
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table((uint64_t)(this + 20));
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table((uint64_t)(this + 15));
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table((uint64_t)(this + 10));
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table((uint64_t)(this + 5));
  v2 = this[4];
  if (v2)
  {

    this[4] = 0;
  }
  ArcSharedObject::~ArcSharedObject((ArcSharedObject *)this);
}

{
  re::DirectResourceClientReceiver::~DirectResourceClientReceiver(this);
  JUMPOUT(0x23B84F8E0);
}

void re::DirectResourceClientReceiver::destroyAll(re::DirectResourceClientReceiver *this@<X0>, ArcSharedObject **a2@<X8>)
{
  _QWORD *i;
  _QWORD *j;
  _QWORD *k;
  uint64_t v7;

  dispatch_assert_queue_V2(*((dispatch_queue_t *)this + 3));
  v7 = -1;
  re::make::shared::object<re::DirectResourcesResolvedCommit,unsigned long long const&,unsigned long long>((uint64_t *)this + 2, &v7, a2);
  for (i = (_QWORD *)*((_QWORD *)this + 7); i; i = (_QWORD *)*i)
    std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)*a2 + 12, i + 4);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear((uint64_t)this + 40);
  for (j = (_QWORD *)*((_QWORD *)this + 12); j; j = (_QWORD *)*j)
    std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)*a2 + 21, j + 4);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear((uint64_t)this + 80);
  for (k = (_QWORD *)*((_QWORD *)this + 17); k; k = (_QWORD *)*k)
    std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)*a2 + 30, k + 4);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear((uint64_t)this + 120);
}

_QWORD *std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100](char **a1, uint64_t *a2)
{
  _QWORD *result;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  id v18;
  char *v19;
  char *v20;
  uint64_t v21;
  int64x2_t v22;
  char *v23;
  uint64_t v24;
  int64x2_t v25;
  char *v26;
  _QWORD *v27;

  v6 = (unint64_t)a1[2];
  result = a1 + 2;
  v5 = v6;
  v7 = (char *)*(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    v10 = (v7 - *a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61)
      abort();
    v11 = v5 - (_QWORD)*a1;
    v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v27 = result;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)result, v13);
    else
      v14 = 0;
    v15 = &v14[8 * v10];
    v16 = &v14[8 * v13];
    v26 = v16;
    v17 = *a2;
    *(_QWORD *)v15 = *a2;
    if (v17)
      v18 = (id)(v17 + 8);
    v9 = v15 + 8;
    v25.i64[1] = (uint64_t)(v15 + 8);
    v20 = *a1;
    v19 = a1[1];
    if (v19 == *a1)
    {
      v22 = vdupq_n_s64((unint64_t)v19);
    }
    else
    {
      do
      {
        v21 = *((_QWORD *)v19 - 1);
        v19 -= 8;
        *((_QWORD *)v15 - 1) = v21;
        v15 -= 8;
        *(_QWORD *)v19 = 0;
      }
      while (v19 != v20);
      v22 = *(int64x2_t *)a1;
      v9 = (char *)v25.i64[1];
      v16 = v26;
    }
    *a1 = v15;
    a1[1] = v9;
    v25 = v22;
    v23 = a1[2];
    a1[2] = v16;
    v26 = v23;
    v24 = v22.i64[0];
    result = (_QWORD *)std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)&v24);
  }
  else
  {
    v8 = *a2;
    *(_QWORD *)v7 = *a2;
    if (v8)
      result = (id)(v8 + 8);
    v9 = v7 + 8;
  }
  a1[1] = v9;
  return result;
}

void re::DirectResourceClientReceiver::resolvePayloadChanges(uint64_t a1, uint64_t a2)
{
  uint64_t *i;
  uint64_t v5;
  id v6;
  unsigned __int8 *v7;
  _QWORD *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  for (i = *(uint64_t **)(a2 + 16); i; i = (uint64_t *)*i)
  {
    v9 = *((_OWORD *)i + 1);
    v5 = i[4];
    v10 = v5;
    if (v5)
      v6 = (id)(v5 + 8);
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>(a1 + 200, (unsigned __int8 *)&v9, (uint64_t)&v9);
    if (v10)

  }
  v7 = *(unsigned __int8 **)(a2 + 96);
  if (v7)
  {
    v8 = (_QWORD *)(a1 + 200);
    do
    {
      std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::__erase_unique<re::DirectResourceId>(v8, v7 + 16);
      v7 = *(unsigned __int8 **)v7;
    }
    while (v7);
  }
}

BOOL re::DirectResourceClientReceiver::receiveCommit(re::DirectResourceClientReceiver *this, void *a2, re::DirectResourcesCommitQueue *a3)
{
  _BOOL8 v5;
  char *v6;
  ArcSharedObject *v8;
  ArcSharedObject *v9;
  uint64_t v10;
  uint64_t v11;

  v11 = 0;
  if (re::xpc_get_value(a2, &v11)
    && (re::DirectResourceClientReceiver::load((uint64_t)this, &v11, &v10), v10))
  {
    re::DirectResourceClientReceiver::validateAndResolve((uint64_t)this, (uint64_t)&v10, &v9);
    v5 = v9 != 0;
    if (v9)
    {
      v8 = v9;
      v6 = (char *)v9 + 8;
      re::DirectResourcesCommitQueue::enqueueCommit_threadSafe((uint64_t)a3, &v8);
      if (v8)

      if (v9)
    }
    if (v10)

  }
  else
  {
    v5 = 0;
  }
  if (v11)

  return v5;
}

_QWORD *re::DirectResourceClientReceiver::load@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  _QWORD *result;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v6[0] = &off_250B65600;
  v6[1] = a1;
  v7 = v6;
  re::load(v3, (uint64_t)v6, a3);
  result = v7;
  if (v7 == v6)
  {
    v5 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v5 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v5))();
}

uint64_t re::DirectResourceClientReceiver::validateAndResolve@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, ArcSharedObject **a3@<X8>)
{
  uint64_t *v6;
  ArcSharedObject *v7;
  ArcSharedObject *v8;
  uint64_t *v9;
  re *v10;
  NSObject *v11;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  void **v19;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  v6 = (uint64_t *)(a1 + 16);
  kdebug_trace();
  if ((re::DirectResourceClientReceiver::isValid((_QWORD *)a1, a2) & 1) != 0)
  {
    re::DirectResourceClientReceiver::resolvePayloadChanges(a1, *(_QWORD *)a2 + 520);
    re::make::shared::object<re::DirectResourcesResolvedCommit,unsigned long long const&,unsigned long long>((uint64_t *)(a1 + 16), (uint64_t *)(*(_QWORD *)a2 + 16), a3);
    re::DirectResourceEvent::operator=((xpc_object_t *)*a3 + 5, (xpc_object_t *)(*(_QWORD *)a2 + 32));
    re::XPCObject::setValue((xpc_object_t *)*a3 + 4, *(xpc_object_t *)(*(_QWORD *)a2 + 24));
    re::DirectResourceClientReceiver::resolve<re::DirectMesh,re::DirectMeshUpdate>(a1, (_QWORD *)(*(_QWORD *)a2 + 40), (_QWORD *)(a1 + 40), (uint64_t)&v13);
    v7 = *a3;
    std::vector<re::SharedPtr<re::DirectMesh>>::__vdeallocate((uint64_t *)*a3 + 6);
    *((_OWORD *)v7 + 3) = v13;
    *((_QWORD *)v7 + 8) = v14;
    v14 = 0;
    v13 = 0uLL;
    std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__vdeallocate((_QWORD *)v7 + 9);
    *(_OWORD *)((char *)v7 + 72) = v15;
    *((_QWORD *)v7 + 11) = v16;
    v16 = 0;
    v15 = 0uLL;
    std::vector<re::SharedPtr<re::DirectMesh>>::__vdeallocate((uint64_t *)v7 + 12);
    *((_OWORD *)v7 + 6) = v17;
    *((_QWORD *)v7 + 14) = v18;
    v18 = 0;
    v17 = 0uLL;
    v19 = (void **)&v17;
    std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v19);
    v19 = (void **)&v15;
    std::vector<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::__destroy_vector::operator()[abi:nn180100](&v19);
    v19 = (void **)&v13;
    std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v19);
    re::DirectResourceClientReceiver::resolve<re::DirectBuffer,re::DirectBufferUpdate>(a1, (_QWORD *)(*(_QWORD *)a2 + 280), (_QWORD *)(a1 + 120), (uint64_t)&v13);
    v8 = *a3;
    std::vector<re::SharedPtr<re::DirectMesh>>::__vdeallocate((uint64_t *)*a3 + 24);
    *((_OWORD *)v8 + 12) = v13;
    *((_QWORD *)v8 + 26) = v14;
    v14 = 0;
    v13 = 0uLL;
    std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__vdeallocate((_QWORD *)v8 + 27);
    *(_OWORD *)((char *)v8 + 216) = v15;
    *((_QWORD *)v8 + 29) = v16;
    v16 = 0;
    v15 = 0uLL;
    std::vector<re::SharedPtr<re::DirectMesh>>::__vdeallocate((uint64_t *)v8 + 30);
    *((_OWORD *)v8 + 15) = v17;
    *((_QWORD *)v8 + 32) = v18;
    v18 = 0;
    v17 = 0uLL;
    v19 = (void **)&v17;
    std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v19);
    v19 = (void **)&v15;
    std::vector<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::__destroy_vector::operator()[abi:nn180100](&v19);
    v19 = (void **)&v13;
    std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v19);
    re::DirectResourceClientReceiver::resolve<re::DirectTexture,re::DirectTextureUpdate>(a1, (_QWORD *)(*(_QWORD *)a2 + 160), (_QWORD *)(a1 + 80), (uint64_t)&v13);
    v9 = (uint64_t *)*a3;
    std::vector<re::SharedPtr<re::DirectMesh>>::__vdeallocate(v9 + 15);
    *(_OWORD *)(v9 + 15) = v13;
    v9[17] = v14;
    v14 = 0;
    v13 = 0uLL;
    std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__vdeallocate(v9 + 18);
    *((_OWORD *)v9 + 9) = v15;
    v9[20] = v16;
    v16 = 0;
    v15 = 0uLL;
    std::vector<re::SharedPtr<re::DirectMesh>>::__vdeallocate(v9 + 21);
    *(_OWORD *)(v9 + 21) = v17;
    v9[23] = v18;
    v18 = 0;
    v17 = 0uLL;
    v19 = (void **)&v17;
    std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v19);
    v19 = (void **)&v15;
    std::vector<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::__destroy_vector::operator()[abi:nn180100](&v19);
    v19 = (void **)&v13;
    std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v19);
  }
  else
  {
    v10 = (re *)kdebug_trace();
    v11 = re::directResourceLog(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      re::DirectResourceClientReceiver::validateAndResolve(v6, v11);
    *a3 = 0;
  }
  return kdebug_trace();
}

uint64_t re::DirectResourceClientReceiver::isValid(_QWORD *a1, uint64_t a2)
{
  if (re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>((uint64_t)a1, (_QWORD *)(*(_QWORD *)a2 + 40), a1 + 5)&& re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>((uint64_t)a1, (_QWORD *)(*(_QWORD *)a2 + 160), a1 + 10))
  {
    return re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>((uint64_t)a1, (_QWORD *)(*(_QWORD *)a2 + 280), a1 + 15);
  }
  else
  {
    return 0;
  }
}

void re::DirectResourceClientReceiver::resolve<re::DirectMesh,re::DirectMeshUpdate>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v8;
  uint64_t *i;
  uint64_t v10;
  _OWORD *v11;
  char *v12;
  uint64_t *j;
  const unsigned __int8 *v14;
  const unsigned __int8 *v15;
  _OWORD *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 *k;
  const unsigned __int8 *v28;
  uint64_t *v29;
  __int128 v30;
  unsigned __int8 uu2[16];
  _OWORD *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a4 + 64) = 0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  std::vector<re::SharedPtr<re::DirectMesh>>::reserve((char **)a4, a2[3]);
  v8 = (_QWORD *)(a4 + 24);
  std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::reserve((_QWORD *)(a4 + 24), a2[8]);
  std::vector<re::SharedPtr<re::DirectMesh>>::reserve((char **)(a4 + 48), a2[13]);
  for (i = (uint64_t *)a2[2]; i; i = (uint64_t *)*i)
  {
    v10 = i[4];
    *(_QWORD *)(v10 + 32) = *(_QWORD *)(a1 + 16);
    re::DirectMesh::attachToDevice(v10);
    *(_OWORD *)uu2 = *((_OWORD *)i + 1);
    v11 = (_OWORD *)i[4];
    v32 = v11;
    if (v11)
      v12 = (char *)v11 + 8;
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>((uint64_t)a3, uu2, (uint64_t)uu2);
    if (v32)

    std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)a4, i + 4);
  }
  for (j = (uint64_t *)a2[7]; j; j = (uint64_t *)*j)
  {
    v14 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a3, (unsigned __int8 *)j + 16);
    if (v14)
    {
      v15 = v14;
      (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)j[4] + 80))(j[4], *((_QWORD *)v14 + 4), *(_QWORD *)(a1 + 32));
      std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>::pair[abi:nn180100]<re::SharedPtr<re::DirectMesh>&,re::SharedPtr<re::DirectMeshUpdate> const&,0>((uint64_t *)&v30, (uint64_t *)v15 + 4, j + 4);
      v16 = *(_OWORD **)(a4 + 32);
      v17 = *(_QWORD *)(a4 + 40);
      if ((unint64_t)v16 >= v17)
      {
        v18 = ((uint64_t)v16 - *v8) >> 4;
        v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 60)
          abort();
        v20 = v17 - *v8;
        if (v20 >> 3 > v19)
          v19 = v20 >> 3;
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0)
          v21 = 0xFFFFFFFFFFFFFFFLL;
        else
          v21 = v19;
        v34 = a4 + 40;
        v22 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>(a4 + 40, v21);
        v23 = &v22[16 * v18];
        *(_QWORD *)uu2 = v22;
        *(_QWORD *)&uu2[8] = v23;
        v33 = &v22[16 * v24];
        *(_OWORD *)v23 = v30;
        v30 = 0uLL;
        v32 = v23 + 16;
        std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__swap_out_circular_buffer((_QWORD *)(a4 + 24), uu2);
        v25 = *(_QWORD *)(a4 + 32);
        std::__split_buffer<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::~__split_buffer((void **)uu2);
        v26 = *((_QWORD *)&v30 + 1);
        *(_QWORD *)(a4 + 32) = v25;
        if (v26)
        {

          *((_QWORD *)&v30 + 1) = 0;
        }
      }
      else
      {
        *v16 = v30;
        v30 = 0uLL;
        *(_QWORD *)(a4 + 32) = v16 + 1;
      }
      if ((_QWORD)v30)

    }
  }
  for (k = (unsigned __int8 *)a2[12]; k; k = *(unsigned __int8 **)k)
  {
    v28 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a3, k + 16);
    if (v28)
    {
      v29 = (uint64_t *)v28;
      std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)(a4 + 48), (uint64_t *)v28 + 4);
      std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::erase(a3, v29);
    }
  }
}

void re::DirectResourceClientReceiver::resolve<re::DirectBuffer,re::DirectBufferUpdate>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v8;
  uint64_t *i;
  uint64_t v10;
  _OWORD *v11;
  char *v12;
  uint64_t *j;
  const unsigned __int8 *v14;
  const unsigned __int8 *v15;
  _OWORD *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 *k;
  const unsigned __int8 *v28;
  uint64_t *v29;
  __int128 v30;
  unsigned __int8 uu2[16];
  _OWORD *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a4 + 64) = 0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  std::vector<re::SharedPtr<re::DirectMesh>>::reserve((char **)a4, a2[3]);
  v8 = (_QWORD *)(a4 + 24);
  std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::reserve((_QWORD *)(a4 + 24), a2[8]);
  std::vector<re::SharedPtr<re::DirectMesh>>::reserve((char **)(a4 + 48), a2[13]);
  for (i = (uint64_t *)a2[2]; i; i = (uint64_t *)*i)
  {
    v10 = i[4];
    *(_QWORD *)(v10 + 32) = *(_QWORD *)(a1 + 16);
    re::DirectBuffer::attachToDevice(v10);
    *(_OWORD *)uu2 = *((_OWORD *)i + 1);
    v11 = (_OWORD *)i[4];
    v32 = v11;
    if (v11)
      v12 = (char *)v11 + 8;
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>((uint64_t)a3, uu2, (uint64_t)uu2);
    if (v32)

    std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)a4, i + 4);
  }
  for (j = (uint64_t *)a2[7]; j; j = (uint64_t *)*j)
  {
    v14 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a3, (unsigned __int8 *)j + 16);
    if (v14)
    {
      v15 = v14;
      (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)j[4] + 80))(j[4], *((_QWORD *)v14 + 4), *(_QWORD *)(a1 + 32));
      std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>::pair[abi:nn180100]<re::SharedPtr<re::DirectMesh>&,re::SharedPtr<re::DirectMeshUpdate> const&,0>((uint64_t *)&v30, (uint64_t *)v15 + 4, j + 4);
      v16 = *(_OWORD **)(a4 + 32);
      v17 = *(_QWORD *)(a4 + 40);
      if ((unint64_t)v16 >= v17)
      {
        v18 = ((uint64_t)v16 - *v8) >> 4;
        v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 60)
          abort();
        v20 = v17 - *v8;
        if (v20 >> 3 > v19)
          v19 = v20 >> 3;
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0)
          v21 = 0xFFFFFFFFFFFFFFFLL;
        else
          v21 = v19;
        v34 = a4 + 40;
        v22 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>(a4 + 40, v21);
        v23 = &v22[16 * v18];
        *(_QWORD *)uu2 = v22;
        *(_QWORD *)&uu2[8] = v23;
        v33 = &v22[16 * v24];
        *(_OWORD *)v23 = v30;
        v30 = 0uLL;
        v32 = v23 + 16;
        std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__swap_out_circular_buffer((_QWORD *)(a4 + 24), uu2);
        v25 = *(_QWORD *)(a4 + 32);
        std::__split_buffer<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::~__split_buffer((void **)uu2);
        v26 = *((_QWORD *)&v30 + 1);
        *(_QWORD *)(a4 + 32) = v25;
        if (v26)
        {

          *((_QWORD *)&v30 + 1) = 0;
        }
      }
      else
      {
        *v16 = v30;
        v30 = 0uLL;
        *(_QWORD *)(a4 + 32) = v16 + 1;
      }
      if ((_QWORD)v30)

    }
  }
  for (k = (unsigned __int8 *)a2[12]; k; k = *(unsigned __int8 **)k)
  {
    v28 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a3, k + 16);
    if (v28)
    {
      v29 = (uint64_t *)v28;
      std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)(a4 + 48), (uint64_t *)v28 + 4);
      std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::erase(a3, v29);
    }
  }
}

void re::DirectResourceClientReceiver::resolve<re::DirectTexture,re::DirectTextureUpdate>(uint64_t a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  _QWORD *v8;
  uint64_t *i;
  uint64_t v10;
  _OWORD *v11;
  char *v12;
  uint64_t *j;
  const unsigned __int8 *v14;
  const unsigned __int8 *v15;
  _OWORD *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 *k;
  const unsigned __int8 *v28;
  uint64_t *v29;
  __int128 v30;
  unsigned __int8 uu2[16];
  _OWORD *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a4 + 64) = 0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  std::vector<re::SharedPtr<re::DirectMesh>>::reserve((char **)a4, a2[3]);
  v8 = (_QWORD *)(a4 + 24);
  std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::reserve((_QWORD *)(a4 + 24), a2[8]);
  std::vector<re::SharedPtr<re::DirectMesh>>::reserve((char **)(a4 + 48), a2[13]);
  for (i = (uint64_t *)a2[2]; i; i = (uint64_t *)*i)
  {
    v10 = i[4];
    *(_QWORD *)(v10 + 32) = *(_QWORD *)(a1 + 16);
    re::DirectTexture::attachToDevice(v10, *(void **)(a1 + 32));
    *(_OWORD *)uu2 = *((_OWORD *)i + 1);
    v11 = (_OWORD *)i[4];
    v32 = v11;
    if (v11)
      v12 = (char *)v11 + 8;
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>((uint64_t)a3, uu2, (uint64_t)uu2);
    if (v32)

    std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)a4, i + 4);
  }
  for (j = (uint64_t *)a2[7]; j; j = (uint64_t *)*j)
  {
    v14 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a3, (unsigned __int8 *)j + 16);
    if (v14)
    {
      v15 = v14;
      (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)j[4] + 80))(j[4], *((_QWORD *)v14 + 4), *(_QWORD *)(a1 + 32));
      std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>::pair[abi:nn180100]<re::SharedPtr<re::DirectMesh>&,re::SharedPtr<re::DirectMeshUpdate> const&,0>((uint64_t *)&v30, (uint64_t *)v15 + 4, j + 4);
      v16 = *(_OWORD **)(a4 + 32);
      v17 = *(_QWORD *)(a4 + 40);
      if ((unint64_t)v16 >= v17)
      {
        v18 = ((uint64_t)v16 - *v8) >> 4;
        v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 60)
          abort();
        v20 = v17 - *v8;
        if (v20 >> 3 > v19)
          v19 = v20 >> 3;
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0)
          v21 = 0xFFFFFFFFFFFFFFFLL;
        else
          v21 = v19;
        v34 = a4 + 40;
        v22 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>(a4 + 40, v21);
        v23 = &v22[16 * v18];
        *(_QWORD *)uu2 = v22;
        *(_QWORD *)&uu2[8] = v23;
        v33 = &v22[16 * v24];
        *(_OWORD *)v23 = v30;
        v30 = 0uLL;
        v32 = v23 + 16;
        std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__swap_out_circular_buffer((_QWORD *)(a4 + 24), uu2);
        v25 = *(_QWORD *)(a4 + 32);
        std::__split_buffer<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::~__split_buffer((void **)uu2);
        v26 = *((_QWORD *)&v30 + 1);
        *(_QWORD *)(a4 + 32) = v25;
        if (v26)
        {

          *((_QWORD *)&v30 + 1) = 0;
        }
      }
      else
      {
        *v16 = v30;
        v30 = 0uLL;
        *(_QWORD *)(a4 + 32) = v16 + 1;
      }
      if ((_QWORD)v30)

    }
  }
  for (k = (unsigned __int8 *)a2[12]; k; k = *(unsigned __int8 **)k)
  {
    v28 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a3, k + 16);
    if (v28)
    {
      v29 = (uint64_t *)v28;
      std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)(a4 + 48), (uint64_t *)v28 + 4);
      std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::erase(a3, v29);
    }
  }
}

uint64_t re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t *v5;
  uint64_t v6;
  id v7;
  re *v8;
  uint64_t *v9;
  uint64_t v10;
  id v11;
  uint64_t *v12;
  re *v13;
  uint64_t *v14;
  uint64_t v15;
  id v16;
  uint64_t *v17;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  unsigned __int8 uu2[16];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  v5 = (uint64_t *)a2[2];
  if (v5)
  {
    while (1)
    {
      *(_OWORD *)uu2 = *((_OWORD *)v5 + 1);
      v6 = v5[4];
      v25 = v6;
      if (v6)
        v7 = (id)(v6 + 8);
      v8 = (re *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>(a3, uu2);
      if (v8)
        break;
      if (v25)

      v5 = (uint64_t *)*v5;
      if (!v5)
        goto LABEL_8;
    }
    v19 = re::directResourceLog(v8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>((re *)uu2);
  }
  else
  {
LABEL_8:
    v9 = (uint64_t *)a2[7];
    if (v9)
    {
      while (1)
      {
        *(_OWORD *)uu2 = *((_OWORD *)v9 + 1);
        v10 = v9[4];
        v25 = v10;
        if (v10)
          v11 = (id)(v10 + 8);
        v23 = 0;
        v12 = (uint64_t *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>(a3, uu2);
        if (v12
          || (v12 = (uint64_t *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>(a2, uu2)) != 0)
        {
          re::SharedPtr<re::DirectBuffer>::reset(&v23, v12[4]);
        }
        if (!v23)
          break;
        v13 = (re *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v25 + 72))(v25);
        if ((v13 & 1) == 0)
        {
          v21 = re::directResourceLog(v13);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>((re *)uu2);
          goto LABEL_40;
        }
        if (v23)

        if (v25)
        v9 = (uint64_t *)*v9;
        if (!v9)
          goto LABEL_21;
      }
      v20 = re::directResourceLog((re *)v12);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>((re *)uu2);
    }
    else
    {
LABEL_21:
      v14 = (uint64_t *)a2[12];
      if (!v14)
        return 1;
      while (1)
      {
        *(_OWORD *)uu2 = *((_OWORD *)v14 + 1);
        v15 = v14[4];
        v25 = v15;
        if (v15)
          v16 = (id)(v15 + 8);
        v23 = 0;
        v17 = (uint64_t *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>(a3, uu2);
        if (v17
          || (v17 = (uint64_t *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>(a2, uu2)) != 0)
        {
          re::SharedPtr<re::DirectBuffer>::reset(&v23, v17[4]);
        }
        if (!v23)
          break;

        if (v25)
        v14 = (uint64_t *)*v14;
        if (!v14)
          return 1;
      }
      v22 = re::directResourceLog((re *)v17);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>((re *)uu2);
    }
LABEL_40:
    if (v23)

  }
  if (v25)

  return 0;
}

void std::vector<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
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
        v4 -= 2;
        std::allocator<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::destroy[abi:nn180100]((uint64_t)(v1 + 2), v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::destroy[abi:nn180100](uint64_t a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  if (v3)
  {

    a2[1] = 0;
  }
  if (*a2)
  {

    *a2 = 0;
  }
}

uint64_t std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMemoryResource>>::pair[abi:nn180100]<unsigned char const(&)[16],re::SharedPtr<re::DirectMemoryResource> const&,0>(uint64_t a1, const unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t v5;
  id v6;

  uuid_copy((unsigned __int8 *)a1, a2);
  v5 = *a3;
  *(_QWORD *)(a1 + 16) = *a3;
  if (v5)
    v6 = (id)(v5 + 8);
  return a1;
}

void std::vector<re::SharedPtr<re::DirectMesh>>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<re::SharedPtr<re::DirectBuffer>>::__clear[abi:nn180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__vdeallocate(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v3;
  _QWORD *v4;

  v1 = (_QWORD *)*a1;
  if (*a1)
  {
    v3 = (_QWORD *)a1[1];
    v4 = (_QWORD *)*a1;
    if (v3 != v1)
    {
      do
      {
        v3 -= 2;
        std::allocator<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::destroy[abi:nn180100]((uint64_t)(a1 + 2), v3);
      }
      while (v3 != v1);
      v4 = (_QWORD *)*a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

uint64_t std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__deallocate_node(int a1, _QWORD *__p)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (_QWORD *)*v2;
      v4 = v2[4];
      if (v4)

      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

const unsigned __int8 *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>(_QWORD *a1, unsigned __int8 *uu2)
{
  int8x8_t v2;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;
  uint64_t v7;
  const unsigned __int8 **v8;
  const unsigned __int8 *i;
  unint64_t v10;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v4 = (*((_QWORD *)uu2 + 1) + (*(_QWORD *)uu2 << 6) + (*(_QWORD *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(_QWORD *)uu2;
  v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  v6 = v5.u32[0];
  if (v5.u32[0] > 1uLL)
  {
    v7 = (*((_QWORD *)uu2 + 1) + (*(_QWORD *)uu2 << 6) + (*(_QWORD *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(_QWORD *)uu2;
    if (v4 >= *(_QWORD *)&v2)
      v7 = v4 % *(_QWORD *)&v2;
  }
  else
  {
    v7 = v4 & (*(_QWORD *)&v2 - 1);
  }
  v8 = *(const unsigned __int8 ***)(*a1 + 8 * v7);
  if (!v8)
    return 0;
  for (i = *v8; i; i = *(const unsigned __int8 **)i)
  {
    v10 = *((_QWORD *)i + 1);
    if (v4 == v10)
    {
      if (!uuid_compare(i + 16, uu2))
        return i;
    }
    else
    {
      if (v6 > 1)
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
  }
  return i;
}

void *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>(uint64_t a1, unsigned __int8 *uu2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v9;
  unint64_t v10;
  void **v11;
  void *i;
  unint64_t v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v6 = (*((_QWORD *)uu2 + 1) + (*(_QWORD *)uu2 << 6) + (*(_QWORD *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(_QWORD *)uu2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v9.i16[0] = vaddlv_u8(v9);
    v10 = v9.u32[0];
    if (v9.u32[0] > 1uLL)
    {
      v3 = (*((_QWORD *)uu2 + 1) + (*(_QWORD *)uu2 << 6) + (*(_QWORD *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(_QWORD *)uu2;
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = v6 & (v7 - 1);
    }
    v11 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v11)
    {
      for (i = *v11; i; i = *(void **)i)
      {
        v13 = *((_QWORD *)i + 1);
        if (v13 == v6)
        {
          if (!uuid_compare((const unsigned __int8 *)i + 16, uu2))
            return i;
        }
        else
        {
          if (v10 > 1)
          {
            if (v13 >= v7)
              v13 %= v7;
          }
          else
          {
            v13 &= v7 - 1;
          }
          if (v13 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x28uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v6;
  *((_OWORD *)i + 1) = *(_OWORD *)a3;
  *((_QWORD *)i + 4) = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(a3 + 16) = 0;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    v16 = 1;
    if (v7 >= 3)
      v16 = (v7 & (v7 - 1)) != 0;
    v17 = v16 | (2 * v7);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__rehash<true>(a1, v19);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v21)
  {
    *(_QWORD *)i = *v21;
LABEL_38:
    *v21 = i;
    goto LABEL_39;
  }
  *(_QWORD *)i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v20 + 8 * v3) = a1 + 16;
  if (*(_QWORD *)i)
  {
    v22 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v22 >= v7)
        v22 %= v7;
    }
    else
    {
      v22 &= v7 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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
      std::__throw_bad_array_new_length[abi:nn180100]();
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

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,void *>>>::operator()[abi:nn180100](uint64_t a1, _QWORD *__p)
{
  uint64_t v3;

  if (*(_BYTE *)(a1 + 8))
  {
    v3 = __p[4];
    if (v3)

  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::__erase_unique<re::DirectResourceId>(_QWORD *a1, unsigned __int8 *a2)
{
  uint64_t *result;

  result = (uint64_t *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::erase(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;
  void *__p;
  uint64_t v6;

  v2 = *a2;
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::remove(a1, a2, (uint64_t)&__p);
  v3 = __p;
  __p = 0;
  if (v3)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,void *>>>::operator()[abi:nn180100]((uint64_t)&v6, v3);
  return v2;
}

_QWORD *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::remove@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
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

_QWORD *std::__function::__func<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0,std::allocator<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0>,void ()(re::DirectFence*)>::~__func(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_250B654E0;
  v2 = a1[1];
  if (v2)
  {

    a1[1] = 0;
  }
  return a1;
}

void std::__function::__func<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0,std::allocator<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0>,void ()(re::DirectFence*)>::~__func(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_250B654E0;
  v2 = a1[1];
  if (v2)
  {

    a1[1] = 0;
  }
  JUMPOUT(0x23B84F8E0);
}

_QWORD *std::__function::__func<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0,std::allocator<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0>,void ()(re::DirectFence*)>::__clone(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;

  v2 = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *v2 = &off_250B654E0;
  v2[1] = v3;
  if (v3)
    v4 = (id)(v3 + 8);
  return v2;
}

_QWORD *std::__function::__func<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0,std::allocator<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0>,void ()(re::DirectFence*)>::__clone(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = &off_250B654E0;
  a2[1] = v2;
  if (v2)
    return (id)(v2 + 8);
  return result;
}

void std::__function::__func<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0,std::allocator<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0>,void ()(re::DirectFence*)>::destroy(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1)
  {

    *(_QWORD *)(a1 + 8) = 0;
  }
}

void std::__function::__func<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0,std::allocator<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0>,void ()(re::DirectFence*)>::destroy_deallocate(_QWORD *__p)
{
  uint64_t v2;

  v2 = __p[1];
  if (v2)

  operator delete(__p);
}

void std::__function::__func<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0,std::allocator<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0>,void ()(re::DirectFence*)>::operator()(uint64_t a1, re::DirectFence **a2)
{
  re::DirectResourcesPendingCommit::fenceCompleted_threadSafe(*(re::DirectResourcesPendingCommit **)(a1 + 8), *a2);
}

void std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<re::DirectResourcesReuseList::Entry>::__clear[abi:nn180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<re::DirectResourcesReuseList::Entry>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 56)
  {
    v4 = *(_QWORD *)(i - 8);
    if (v4)
    {

      *(_QWORD *)(i - 8) = 0;
    }
  }
  a1[1] = v2;
}

void std::vector<re::DirectResourcesReuseList::Entry>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<re::DirectResourcesReuseList::Entry>::__clear[abi:nn180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void std::vector<re::DirectResourceId>::__append(_QWORD *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  char *v22;
  char *v23;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(unsigned __int8 **)(v4 - 8);
  if (a2 <= (v6 - (uint64_t)v7) >> 4)
  {
    if (a2)
    {
      v16 = 16 * a2;
      v17 = &v7[16 * a2];
      do
      {
        uuid_copy(v7, UUID_NULL);
        v7 += 16;
        v16 -= 16;
      }
      while (v16);
      v7 = v17;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = (uint64_t)&v7[-*a1];
    v9 = a2 + (v8 >> 4);
    if (v9 >> 60)
      abort();
    v10 = v8 >> 4;
    v11 = v5 - *a1;
    if (v11 >> 3 > v9)
      v9 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
    {
      v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>(v4, v12);
      v15 = v14;
    }
    else
    {
      v13 = 0;
      v15 = 0;
    }
    v18 = (unsigned __int8 *)&v13[16 * v10];
    v19 = &v18[16 * a2];
    v20 = 16 * a2;
    v21 = v18;
    do
    {
      uuid_copy(v21, UUID_NULL);
      v21 += 16;
      v20 -= 16;
    }
    while (v20);
    v23 = (char *)*a1;
    v22 = (char *)a1[1];
    if (v22 != (char *)*a1)
    {
      do
      {
        *((_OWORD *)v18 - 1) = *((_OWORD *)v22 - 1);
        v18 -= 16;
        v22 -= 16;
      }
      while (v22 != v23);
      v22 = (char *)*a1;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = &v13[16 * v15];
    if (v22)
      operator delete(v22);
  }
}

void std::__function::__func<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0,std::allocator<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0>,void ()(re::DirectFence *)>::~__func()
{
  JUMPOUT(0x23B84F8E0);
}

_QWORD *std::__function::__func<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0,std::allocator<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0>,void ()(re::DirectFence *)>::__clone()
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_250B65528;
  return result;
}

void std::__function::__func<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0,std::allocator<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0>,void ()(re::DirectFence *)>::__clone(uint64_t a1, _QWORD *a2)
{
  *a2 = &off_250B65528;
}

void std::__function::__func<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0,std::allocator<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0>,void ()(re::DirectFence *)>::operator()(re *a1, uint64_t *a2)
{
  uint64_t v2;
  NSObject *v3;
  void **v4;
  void *__p[2];
  char v6;
  uint8_t buf[4];
  void **v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *a2;
  v3 = re::directResourceLog(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)v2 + 24))(__p, v2);
    if (v6 >= 0)
      v4 = __p;
    else
      v4 = (void **)__p[0];
    *(_DWORD *)buf = 136315138;
    v8 = v4;
    _os_log_impl(&dword_23A4DF000, v3, OS_LOG_TYPE_DEFAULT, "\t\tWaiting for %s", buf, 0xCu);
    if (v6 < 0)
      operator delete(__p[0]);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__deallocate_node(a1, *(id **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__deallocate_node(uint64_t a1, id *a2)
{
  id *v2;
  id *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (id *)*v2;
      objc_destroyWeak(v2 + 4);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__deallocate_node(a1, *(id **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

const unsigned __int8 *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__emplace_unique_impl<unsigned char const(&)[16],re::SharedPtr<re::DirectResource> const&>(_QWORD *a1, const unsigned __int8 *a2, _QWORD *a3)
{
  const unsigned __int8 *inserted;
  char v5;
  uint64_t v7[3];

  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__construct_node<unsigned char const(&)[16],re::SharedPtr<re::DirectResource> const&>((uint64_t)a1, a2, a3, (uint64_t)v7);
  inserted = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__node_insert_unique(a1, v7[0]);
  if ((v5 & 1) != 0)
    v7[0] = 0;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,void *>>>>::reset[abi:nn180100]((uint64_t)v7, 0);
  return inserted;
}

id std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__construct_node<unsigned char const(&)[16],re::SharedPtr<re::DirectResource> const&>@<X0>(uint64_t a1@<X0>, const unsigned __int8 *a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  void *v8;
  void *v9;
  id result;

  v7 = a1 + 16;
  v8 = operator new(0x28uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  uuid_copy((unsigned __int8 *)v8 + 16, a2);
  if (*a3)
    v9 = (void *)(*a3 + 8);
  else
    v9 = 0;
  result = objc_initWeak((id *)v8 + 4, v9);
  *(_BYTE *)(a4 + 16) = 1;
  *((_QWORD *)v8 + 1) = (*((_QWORD *)v8 + 3)
                       + (*((_QWORD *)v8 + 2) << 6)
                       + (*((_QWORD *)v8 + 2) >> 2)
                       - 0x61C8864680B583E9) ^ *((_QWORD *)v8 + 2);
  return result;
}

const unsigned __int8 *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__node_insert_unique(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  unsigned __int8 *v4;
  unint64_t v5;
  const unsigned __int8 *v6;

  v2 = (_QWORD *)a2;
  v4 = (unsigned __int8 *)(a2 + 16);
  v5 = (*(_QWORD *)(a2 + 24) + (*(_QWORD *)(a2 + 16) << 6) + (*(_QWORD *)(a2 + 16) >> 2) - 0x61C8864680B583E9) ^ *(_QWORD *)(a2 + 16);
  *((_QWORD *)v4 - 1) = v5;
  v6 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__node_insert_unique_prepare[abi:nn180100]((uint64_t)a1, v5, v4);
  if (v6)
    return v6;
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__node_insert_unique_perform[abi:nn180100](a1, v2);
  return (const unsigned __int8 *)v2;
}

const unsigned __int8 *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__node_insert_unique_prepare[abi:nn180100](uint64_t a1, unint64_t a2, unsigned __int8 *uu2)
{
  unint64_t v4;
  uint8x8_t v7;
  unint64_t v8;
  uint64_t v9;
  const unsigned __int8 **v10;
  const unsigned __int8 *i;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = (uint8x8_t)vcnt_s8((int8x8_t)v4);
    v7.i16[0] = vaddlv_u8(v7);
    v8 = v7.u32[0];
    if (v7.u32[0] > 1uLL)
      v9 = v4 <= a2 ? a2 % v4 : a2;
    else
      v9 = (v4 - 1) & a2;
    v10 = *(const unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v9);
    if (v10)
    {
      for (i = *v10; i; i = *(const unsigned __int8 **)i)
      {
        v12 = *((_QWORD *)i + 1);
        if (v12 == a2)
        {
          if (!uuid_compare(i + 16, uu2))
            return i;
        }
        else
        {
          if (v8 > 1)
          {
            if (v12 >= v4)
              v12 %= v4;
          }
          else
          {
            v12 &= v4 - 1;
          }
          if (v12 != v9)
            break;
        }
      }
    }
  }
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v4 || (float)(v14 * (float)v4) < v13)
  {
    v15 = 1;
    if (v4 >= 3)
      v15 = (v4 & (v4 - 1)) != 0;
    v16 = v15 | (2 * v4);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__rehash<true>(a1, v18);
  }
  return 0;
}

_QWORD *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__node_insert_unique_perform[abi:nn180100](_QWORD *result, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  _QWORD *v5;
  unint64_t v6;

  v2 = (int8x8_t)result[1];
  v3 = a2[1];
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(_QWORD *)&v2)
      v3 %= *(_QWORD *)&v2;
  }
  else
  {
    v3 &= *(_QWORD *)&v2 - 1;
  }
  v5 = *(_QWORD **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    *v5 = a2;
    goto LABEL_14;
  }
  *a2 = result[2];
  result[2] = a2;
  *(_QWORD *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v2)
        v6 %= *(_QWORD *)&v2;
    }
    else
    {
      v6 &= *(_QWORD *)&v2 - 1;
    }
    v5 = (_QWORD *)(*result + 8 * v6);
    goto LABEL_13;
  }
LABEL_14:
  ++result[3];
  return result;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  id *v2;

  v2 = *(id **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      objc_destroyWeak(v2 + 4);
    operator delete(v2);
  }
}

_QWORD *std::__function::__func<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0,std::allocator<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0>,void ()(re::DirectResourceSlot)>::~__func(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_250B65570;
  v2 = a1[2];
  if (v2)
  {

    a1[2] = 0;
  }
  return a1;
}

void std::__function::__func<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0,std::allocator<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0>,void ()(re::DirectResourceSlot)>::~__func(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_250B65570;
  v2 = a1[2];
  if (v2)
  {

    a1[2] = 0;
  }
  JUMPOUT(0x23B84F8E0);
}

_QWORD *std::__function::__func<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0,std::allocator<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0>,void ()(re::DirectResourceSlot)>::__clone(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *v2 = &off_250B65570;
  v2[1] = v4;
  v2[2] = v3;
  if (v3)
    v5 = (id)(v3 + 8);
  return v2;
}

_QWORD *std::__function::__func<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0,std::allocator<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0>,void ()(re::DirectResourceSlot)>::__clone(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = result[1];
  v2 = result[2];
  *a2 = &off_250B65570;
  a2[1] = v3;
  a2[2] = v2;
  if (v2)
    return (id)(v2 + 8);
  return result;
}

void std::__function::__func<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0,std::allocator<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0>,void ()(re::DirectResourceSlot)>::destroy(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {

    *(_QWORD *)(a1 + 16) = 0;
  }
}

void std::__function::__func<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0,std::allocator<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0>,void ()(re::DirectResourceSlot)>::destroy_deallocate(_QWORD *__p)
{
  uint64_t v2;

  v2 = __p[2];
  if (v2)

  operator delete(__p);
}

void std::__function::__func<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0,std::allocator<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0>,void ()(re::DirectResourceSlot)>::operator()(uint64_t a1, _QWORD *a2)
{
  dispatch_queue_t *v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;

  v3 = *(dispatch_queue_t **)(a1 + 8);
  v4 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(a1 + 16) + 48))(*(_QWORD *)(a1 + 16), *a2, a2[1]);
  if (v4)
  {
    v5 = *(_QWORD **)(a1 + 16);
    v7 = v4;
    v6 = (id)(v4 + 8);
    re::DirectResourceContext::addPayload(v3, v5, &v7);
    if (v7)

  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__erase_unique<re::DirectResourceId>(_QWORD *a1, unsigned __int8 *a2)
{
  unsigned __int8 *result;
  _BYTE v4[24];

  result = (unsigned __int8 *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::remove(a1, result, (uint64_t)v4);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,void *>>>>::reset[abi:nn180100]((uint64_t)v4, 0);
    return (unsigned __int8 *)1;
  }
  return result;
}

void std::__function::__func<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0,std::allocator<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0>,void ()(re::DirectResourceSlot)>::~__func()
{
  JUMPOUT(0x23B84F8E0);
}

__n128 std::__function::__func<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0,std::allocator<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0>,void ()(re::DirectResourceSlot)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x18uLL);
  *(_QWORD *)v2 = &off_250B655B8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0,std::allocator<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0>,void ()(re::DirectResourceSlot)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_QWORD *)a2 = &off_250B655B8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0,std::allocator<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0>,void ()(re::DirectResourceSlot)>::operator()(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uuid_t dst;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 8);
  v3 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)(a1 + 16) + 48))(*(_QWORD *)(a1 + 16), *a2, a2[1]);
  if (v3)
  {
    uuid_copy(dst, (const unsigned __int8 *)(v3 + 16));
    re::DirectResourceContext::removePayload(v2, (uint64_t)dst);
  }
}

_QWORD *std::vector<re::DirectResourceId>::vector(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  const void *v4;
  int64_t v5;
  char *v6;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v4 = *(const void **)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v5 = v3 - *(_QWORD *)a2;
  if (v3 != *(_QWORD *)a2)
  {
    std::vector<re::DirectResourceId>::__vallocate[abi:nn180100](a1, v5 >> 4);
    v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *std::vector<re::DirectResourceId>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

_QWORD *std::__function::__value_func<void ()(re::DirectResourceContext *,unsigned long long)>::swap[abi:nn180100](_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  if (a2 != result)
  {
    v3 = result;
    v4 = (_QWORD *)result[3];
    v5 = (_QWORD *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, v6);
        (*(void (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(_QWORD *, _QWORD *))(v6[0] + 24))(v6, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *))(*result + 24))(result, a2);
        result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, result);
      result = (_QWORD *)(*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

uint64_t *std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::__insert_with_size[abi:nn180100]<std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>>(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t *v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  id v40;
  uint64_t *v42;
  uint64_t v43;
  _QWORD v44[5];

  v5 = *a1;
  v6 = a2 - *a1;
  v7 = (uint64_t *)(*a1 + (v6 & 0xFFFFFFFFFFFFFFF8));
  if (a5 < 1)
    return v7;
  v9 = a3;
  v11 = v6 >> 3;
  v14 = a1[2];
  v12 = (uint64_t)(a1 + 2);
  v13 = v14;
  v15 = *(_QWORD *)(v12 - 8);
  if (a5 > (uint64_t)(v14 - v15) >> 3)
  {
    v16 = a5 + ((uint64_t)(v15 - v5) >> 3);
    if (v16 >> 61)
      abort();
    v17 = v13 - v5;
    if (v17 >> 2 > v16)
      v16 = v17 >> 2;
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
      v18 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v18 = v16;
    v44[4] = v12;
    if (v18)
      v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v12, v18);
    else
      v19 = 0;
    v36 = (uint64_t *)&v19[8 * v11];
    v44[0] = v19;
    v44[1] = v36;
    v44[3] = &v19[8 * v18];
    v37 = 8 * a5;
    v38 = &v36[a5];
    do
    {
      v39 = *v9;
      *v36 = *v9;
      if (v39)
        v40 = (id)(v39 + 8);
      ++v36;
      ++v9;
      v37 -= 8;
    }
    while (v37);
    v44[2] = v38;
    v7 = (uint64_t *)std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::__swap_out_circular_buffer(a1, v44, v7);
    std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)v44);
    return v7;
  }
  v20 = (uint64_t)(v15 - (_QWORD)v7) >> 3;
  if (v20 >= a5)
  {
    v27 = &a3[a5];
    v23 = *(_QWORD **)(v12 - 8);
    goto LABEL_20;
  }
  v43 = v11;
  v22 = &a3[v20];
  v42 = v22;
  v23 = *(_QWORD **)(v12 - 8);
  if (v22 != a4)
  {
    v24 = *(uint64_t **)(v12 - 8);
    do
    {
      v25 = *v22;
      *v24 = *v22;
      if (v25)
        v26 = (id)(v25 + 8);
      ++v22;
      ++v24;
      ++v23;
    }
    while (v22 != a4);
  }
  a1[1] = (uint64_t)v23;
  if ((uint64_t)(v15 - (_QWORD)v7) >= 1)
  {
    v27 = v42;
    v11 = v43;
LABEL_20:
    v28 = &v7[a5];
    v29 = &v23[-a5];
    v30 = v23;
    if ((unint64_t)v29 < v15)
    {
      v30 = v23;
      do
      {
        *v30++ = *v29;
        *v29++ = 0;
      }
      while ((unint64_t)v29 < v15);
    }
    a1[1] = (uint64_t)v30;
    if (v23 != v28)
    {
      v31 = v23 - v28;
      v32 = v23 - 1;
      v33 = 8 * v31;
      v34 = v5 + 8 * v11 - 8;
      do
      {
        v35 = *v32;
        *v32-- = *(_QWORD *)(v34 + v33);
        *(_QWORD *)(v34 + v33) = v35;
        v33 -= 8;
      }
      while (v33);
    }
    std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit> *>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit> *>,re::SharedPtr<re::DirectResourcesResolvedCommit> *,0>(v9, v27, v7);
  }
  return v7;
}

uint64_t std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::__swap_out_circular_buffer(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  result = a2[1];
  v5 = (_QWORD *)*a1;
  v6 = result;
  if ((_QWORD *)*a1 != a3)
  {
    v7 = a3;
    v6 = a2[1];
    do
    {
      v8 = *--v7;
      *(_QWORD *)(v6 - 8) = v8;
      v6 -= 8;
      *v7 = 0;
    }
    while (v7 != v5);
  }
  a2[1] = v6;
  v9 = (_QWORD *)a1[1];
  v10 = (_QWORD *)a2[2];
  if (v9 != a3)
  {
    do
    {
      *v10++ = *a3;
      *a3++ = 0;
    }
    while (a3 != v9);
    v6 = a2[1];
  }
  a2[2] = v10;
  v11 = (_QWORD *)*a1;
  *a1 = v6;
  a2[1] = v11;
  v12 = a1[1];
  a1[1] = a2[2];
  a2[2] = v12;
  v13 = a1[2];
  a1[2] = a2[3];
  a2[3] = v13;
  *a2 = a2[1];
  return result;
}

uint64_t *std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit> *>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit> *>,re::SharedPtr<re::DirectResourcesResolvedCommit> *,0>(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t *v4;
  uint64_t v6;

  v4 = a1;
  if (a1 != a2)
  {
    do
    {
      v6 = *v4++;
      re::SharedPtr<re::DirectBuffer>::reset(a3++, v6);
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

BOOL std::lock[abi:nn180100]<re::UnfairLock,re::UnfairLock>(os_unfair_lock_s *a1, os_unfair_lock_s *a2)
{
  _BOOL8 result;

  os_unfair_lock_lock(a1);
  for (result = os_unfair_lock_trylock(a2); !result; result = os_unfair_lock_trylock(a2))
  {
    os_unfair_lock_unlock(a1);
    sched_yield();
    os_unfair_lock_lock(a2);
    result = os_unfair_lock_trylock(a1);
    if (result)
      break;
    os_unfair_lock_unlock(a2);
    sched_yield();
    os_unfair_lock_lock(a1);
  }
  return result;
}

double re::make::shared::object<re::DirectResourcesResolvedCommit,unsigned long long const&,unsigned long long>@<D0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, ArcSharedObject **a3@<X8>)
{
  ArcSharedObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  double result;

  v6 = (ArcSharedObject *)operator new(0x108uLL);
  v7 = *a1;
  v8 = *a2;
  ArcSharedObject::ArcSharedObject(v6, 0);
  *v9 = &off_250B65208;
  v9[2] = v7;
  v9[3] = v8;
  v9[4] = 0;
  re::DirectResourceEvent::DirectResourceEvent(v9 + 5);
  *((_QWORD *)v6 + 32) = 0;
  result = 0.0;
  *((_OWORD *)v6 + 14) = 0u;
  *((_OWORD *)v6 + 15) = 0u;
  *((_OWORD *)v6 + 12) = 0u;
  *((_OWORD *)v6 + 13) = 0u;
  *((_OWORD *)v6 + 10) = 0u;
  *((_OWORD *)v6 + 11) = 0u;
  *((_OWORD *)v6 + 8) = 0u;
  *((_OWORD *)v6 + 9) = 0u;
  *((_OWORD *)v6 + 6) = 0u;
  *((_OWORD *)v6 + 7) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *a3 = v6;
  return result;
}

uint64_t std::vector<re::SharedPtr<re::DirectMesh>>::reserve(char **a1, unint64_t a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int64x2_t v12;
  char *v13;
  uint64_t v14;
  int64x2_t v15;
  char *v16;
  uint64_t v17;

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61)
      abort();
    v5 = a1[1] - *a1;
    v17 = result;
    v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(result, a2);
    v9 = *a1;
    v8 = a1[1];
    if (v8 == *a1)
    {
      v12 = vdupq_n_s64((unint64_t)v8);
      v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        v11 = *((_QWORD *)v8 - 1);
        v8 -= 8;
        *((_QWORD *)v10 - 1) = v11;
        v10 -= 8;
        *(_QWORD *)v8 = 0;
      }
      while (v8 != v9);
      v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v15 = v12;
    v13 = a1[2];
    a1[2] = &v6[8 * v7];
    v16 = v13;
    v14 = v12.i64[0];
    return std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)&v14);
  }
  return result;
}

void **std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::reserve(_QWORD *a1, unint64_t a2)
{
  void **result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7[5];

  v4 = a1[2];
  result = (void **)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60)
      abort();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    v7[2] = (char *)v7[0] + v5;
    v7[3] = (char *)v7[0] + 16 * v6;
    std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::~__split_buffer(v7);
  }
  return result;
}

_QWORD *std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__swap_out_circular_buffer(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  __int128 v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (_QWORD *)*result;
  v2 = (_QWORD *)result[1];
  v4 = a2[1];
  while (v2 != v3)
  {
    v5 = *((_OWORD *)v2 - 1);
    v2 -= 2;
    *(_OWORD *)(v4 - 16) = v5;
    v4 -= 16;
    *v2 = 0;
    v2[1] = 0;
  }
  a2[1] = v4;
  v6 = (_QWORD *)*result;
  *result = v4;
  a2[1] = v6;
  v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void **std::__split_buffer<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::~__split_buffer(void **a1)
{
  std::__split_buffer<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::clear[abi:nn180100](a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void std::__split_buffer<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::clear[abi:nn180100](_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 16;
    std::allocator<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::destroy[abi:nn180100](v4, (_QWORD *)(i - 16));
  }
}

uint64_t *std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>::pair[abi:nn180100]<re::SharedPtr<re::DirectMesh>&,re::SharedPtr<re::DirectMeshUpdate> const&,0>(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = *a2;
  *a1 = *a2;
  if (v5)
    v6 = (id)(v5 + 8);
  v7 = *a3;
  a1[1] = *a3;
  if (v7)
    v8 = (id)(v7 + 8);
  return a1;
}

void std::__function::__func<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0,std::allocator<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::~__func()
{
  JUMPOUT(0x23B84F8E0);
}

_QWORD *std::__function::__func<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0,std::allocator<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__clone(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_250B65600;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0,std::allocator<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__clone(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_250B65600;
  a2[1] = v2;
  return result;
}

const unsigned __int8 *std::__function::__func<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0,std::allocator<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::operator()(uint64_t a1, unsigned __int8 *a2)
{
  const unsigned __int8 *result;

  result = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>((_QWORD *)(*(_QWORD *)(a1 + 8) + 200), a2);
  if (result)
    return (const unsigned __int8 *)*((_QWORD *)result + 4);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(re *a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, __int16 a5, char a6, char a7)
{
  uint64_t v7;

  *(_QWORD *)(v7 - 24) = a2;
  re::toString(a1, &a7);
}

uint64_t ArcObjectDestroy(char *a1, objc_selector *a2)
{
  if (a1)
    return (*(uint64_t (**)(char *))(*((_QWORD *)a1 - 1) + 16))(a1 - 8);
  else
    return (*(uint64_t (**)(_QWORD))(MEMORY[0] + 16))(0);
}

uint64_t ArcObjectDescription(char *a1, objc_selector *a2)
{
  char *v2;
  void **v3;
  uint64_t v4;
  void *__p[2];
  char v7;

  if (a1)
    v2 = a1 - 8;
  else
    v2 = 0;
  (*(void (**)(void **__return_ptr))(*(_QWORD *)v2 + 24))(__p);
  if (v7 >= 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
  if (v7 < 0)
    operator delete(__p[0]);
  return v4;
}

uint64_t ArcObjectDebugDescription(char *a1, objc_selector *a2)
{
  char *v2;
  void **v3;
  uint64_t v4;
  void *__p[2];
  char v7;

  if (a1)
    v2 = a1 - 8;
  else
    v2 = 0;
  (*(void (**)(void **__return_ptr))(*(_QWORD *)v2 + 32))(__p);
  if (v7 >= 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
  if (v7 < 0)
    operator delete(__p[0]);
  return v4;
}

uint64_t ArcObjectClass(void)
{
  unsigned __int8 v0;
  unint64_t v1;
  int v3;

  v1 = 0x25698A000uLL;
  if ((v0 & 1) == 0)
  {
    v1 = 0x25698A000;
    if (v3)
    {
      ArcObjectClass(void)::cls = (uint64_t)ArcObjectClass(void)::$_0::operator()();
      v1 = 0x25698A000;
    }
  }
  return *(_QWORD *)(v1 + 2608);
}

Class ArcObjectClass(void)::$_0::operator()()
{
  objc_class *v0;
  objc_class *ClassPair;
  objc_class *v2;

  v0 = (objc_class *)objc_opt_class();
  ClassPair = objc_allocateClassPair(v0, "_DRObject", 0);
  if (!ClassPair)
    return objc_getClass("_DRObject");
  v2 = ClassPair;
  class_addMethod(ClassPair, sel_dealloc, (IMP)ArcObjectDestroy, "");
  class_addMethod(v2, sel_description, (IMP)ArcObjectDescription, "");
  class_addMethod(v2, sel_debugDescription, (IMP)ArcObjectDebugDescription, "");
  objc_registerClassPair(v2);
  return v2;
}

void ArcSharedObject::ArcSharedObject(ArcSharedObject *this, Class cls)
{
  objc_class *v2;

  v2 = cls;
  *(_QWORD *)this = &off_250B65648;
  if (!cls)
    v2 = (objc_class *)ArcObjectClass();
  *((_QWORD *)this + 1) = 0;
  objc_constructInstance(v2, (char *)this + 8);
}

void ArcSharedObject::~ArcSharedObject(ArcSharedObject *this)
{
  *(_QWORD *)this = &off_250B65648;
  objc_destructInstance((char *)this + 8);
}

{
  *(_QWORD *)this = &off_250B65648;
  objc_destructInstance((char *)this + 8);
}

{
  *(_QWORD *)this = &off_250B65648;
  objc_destructInstance((char *)this + 8);
  JUMPOUT(0x23B84F8E0);
}

void ArcSharedObject::dispose(ArcSharedObject *this)
{
  (**(void (***)(ArcSharedObject *))this)(this);
  free(this);
}

_QWORD *ArcSharedObject::description@<X0>(_QWORD *a1@<X8>)
{
  return std::string::basic_string[abi:nn180100]<0>(a1, "DRObject");
}

uint64_t ArcSharedObject::debugDescription(ArcSharedObject *this)
{
  return (*(uint64_t (**)(ArcSharedObject *))(*(_QWORD *)this + 24))(this);
}

double re::DirectResourcesReuseList::DirectResourcesReuseList(re::DirectResourcesReuseList *this, uint64_t a2)
{
  uint64_t v3;
  double result;

  ArcSharedObject::ArcSharedObject(this, 0);
  *(_QWORD *)v3 = off_250B65680;
  *(_QWORD *)(v3 + 16) = a2;
  result = 0.0;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 40) = 0u;
  return result;
}

void re::DirectResourcesReuseList::~DirectResourcesReuseList(re::DirectResourcesReuseList *this)
{
  void **v2;

  v2 = (void **)((char *)this + 32);
  std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100](&v2);
  ArcSharedObject::~ArcSharedObject(this);
}

{
  void **v2;

  v2 = (void **)((char *)this + 32);
  std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100](&v2);
  ArcSharedObject::~ArcSharedObject(this);
  MEMORY[0x23B84F8E0]();
}

uint64_t re::DirectResourcesReuseList::add(int64x2_t *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t result;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *updated;
  uint64_t v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  char *v31;
  __int128 v32;
  __int128 v33;
  int64x2_t v34;
  uint64_t v35;
  uint64_t v36;
  int64x2_t v37;
  uint64_t v38;
  int64x2_t *v39;

  v14 = a1[1].i64[0];
  v15 = *a7;
  if (*a7)
    v16 = (id)(v15 + 8);
  result = (uint64_t)a1[3].i64;
  v18 = a1[3].u64[0];
  v19 = a1[2].u64[1];
  if (v19 >= v18)
  {
    v21 = a1[2].i64[0];
    v22 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v19 - v21) >> 3);
    v23 = v22 + 1;
    if ((unint64_t)(v22 + 1) > 0x492492492492492)
      abort();
    v24 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v18 - v21) >> 3);
    if (2 * v24 > v23)
      v23 = 2 * v24;
    if (v24 >= 0x249249249249249)
      v25 = 0x492492492492492;
    else
      v25 = v23;
    v39 = a1 + 3;
    updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>(result, v25);
    v28 = &updated[56 * v22];
    *(_QWORD *)v28 = v14;
    *((_QWORD *)v28 + 1) = a2;
    *((_QWORD *)v28 + 2) = a3;
    *((_DWORD *)v28 + 6) = a4;
    *((_QWORD *)v28 + 4) = a5;
    *((_QWORD *)v28 + 5) = a6;
    *((_QWORD *)v28 + 6) = v15;
    v30 = a1[2].i64[0];
    v29 = a1[2].u64[1];
    if (v29 == v30)
    {
      v34 = vdupq_n_s64(v29);
      v31 = &updated[56 * v22];
    }
    else
    {
      v31 = &updated[56 * v22];
      do
      {
        v32 = *(_OWORD *)(v29 - 56);
        v33 = *(_OWORD *)(v29 - 40);
        *(_OWORD *)(v31 - 24) = *(_OWORD *)(v29 - 24);
        *(_OWORD *)(v31 - 40) = v33;
        *(_OWORD *)(v31 - 56) = v32;
        *((_QWORD *)v31 - 1) = *(_QWORD *)(v29 - 8);
        v31 -= 56;
        *(_QWORD *)(v29 - 8) = 0;
        v29 -= 56;
      }
      while (v29 != v30);
      v34 = a1[2];
    }
    v20 = v28 + 56;
    a1[2].i64[0] = (uint64_t)v31;
    a1[2].i64[1] = (uint64_t)(v28 + 56);
    v37 = v34;
    v35 = a1[3].i64[0];
    a1[3].i64[0] = (uint64_t)&updated[56 * v27];
    v38 = v35;
    v36 = v34.i64[0];
    result = std::__split_buffer<re::DirectResourcesReuseList::Entry>::~__split_buffer((uint64_t)&v36);
  }
  else
  {
    *(_QWORD *)v19 = v14;
    *(_QWORD *)(v19 + 8) = a2;
    *(_QWORD *)(v19 + 16) = a3;
    *(_DWORD *)(v19 + 24) = a4;
    *(_QWORD *)(v19 + 32) = a5;
    *(_QWORD *)(v19 + 40) = a6;
    v20 = (char *)(v19 + 56);
    *(_QWORD *)(v19 + 48) = v15;
  }
  a1[2].i64[1] = (uint64_t)v20;
  a1[1].i64[1] += *(_QWORD *)(*a7 + 40);
  return result;
}

double re::DirectResourcesReusePool::DirectResourcesReusePool(re::DirectResourcesReusePool *this)
{
  double result;

  result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  return result;
}

void re::DirectResourcesReusePool::take(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  _QWORD *v10;
  const unsigned __int8 *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  unsigned __int8 uu2[8];
  uint64_t v40;
  uint64_t v41;

  v10 = a1;
  v41 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)uu2 = a2;
  v40 = a3;
  *a7 = 0;
  v12 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a1, uu2);
  if (v12)
  {
    v13 = (uint64_t *)v12;
    v14 = *((_QWORD *)v12 + 5);
    v15 = 0x6DB6DB6DB6DB6DB7 * ((v14 - *((_QWORD *)v12 + 4)) >> 3);
    v16 = v15 - 1;
    if ((int)v15 >= 1)
    {
      v37 = a7;
      v38 = v10;
      v17 = -1227133513 * ((v14 - *((_QWORD *)v12 + 4)) >> 3) + 1;
      while (1)
      {
        v18 = (v17 - 2);
        v19 = v13[4];
        v20 = v19 + 56 * v18;
        if (!uuid_compare((const unsigned __int8 *)(v20 + 8), uu2) && *(_DWORD *)(v20 + 24) == a4)
        {
          v22 = v19 + 56 * v18;
          v23 = *(_DWORD *)(v22 + 32);
          v24 = *(_QWORD *)(v22 + 40);
          if (v23 == a5 && v24 == a6)
            break;
        }
        --v16;
        if ((unint64_t)--v17 <= 1)
        {
          v14 = v13[5];
          v10 = v38;
          goto LABEL_24;
        }
      }
      v26 = v19 + 56 * v18;
      v27 = *(_QWORD *)(v26 + 48);
      v10 = v38;
      *v37 = v27;
      *(_QWORD *)(v26 + 48) = 0;
      v28 = v38[6] - *(_QWORD *)(v27 + 40);
      --v38[5];
      v38[6] = v28;
      v30 = v13[4];
      v29 = v13[5];
      v14 = v30 + 56 * v18;
      v31 = v14 + 56;
      if (v14 + 56 != v29)
      {
        v32 = v30 + 56 * v18;
        v14 = v30 + 56 * v16;
        do
        {
          v33 = *(_OWORD *)(v32 + 72);
          *(_OWORD *)v32 = *(_OWORD *)(v32 + 56);
          *(_OWORD *)(v32 + 16) = v33;
          *(_OWORD *)(v32 + 32) = *(_OWORD *)(v32 + 88);
          v34 = *(_QWORD *)(v32 + 48);
          *(_QWORD *)(v32 + 48) = *(_QWORD *)(v32 + 104);
          *(_QWORD *)(v32 + 104) = v34;
          v35 = v32 + 112;
          v32 += 56;
          v14 += 56;
        }
        while (v35 != v29);
        v31 = v13[5];
      }
      while (v31 != v14)
      {
        v36 = *(_QWORD *)(v31 - 8);
        if (v36)
        {

          *(_QWORD *)(v31 - 8) = 0;
        }
        v31 -= 56;
      }
      v13[5] = v14;
    }
LABEL_24:
    if (v14 == v13[4])
      std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::erase(v10, v13);
  }
}

void re::DirectResourcesReusePool::mergeFrom(uint64_t a1, uint64_t a2)
{
  __int128 *v2;
  __int128 *i;
  uint64_t v5;
  int64x2_t *v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *updated;
  uint64_t v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  int64x2_t v27;
  uint64_t v28;
  _QWORD v29[3];
  void **v30;
  int64x2_t v31;
  uint64_t v32;
  int64x2_t *v33;
  unsigned __int8 uu2[16];
  _QWORD v35[4];

  v35[3] = *MEMORY[0x24BDAC8D0];
  v2 = *(__int128 **)(a2 + 32);
  for (i = *(__int128 **)(a2 + 40); v2 != i; v2 = (__int128 *)((char *)v2 + 56))
  {
    v5 = *(_QWORD *)(a1 + 48);
    ++*(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 48) = v5 + *(_QWORD *)(*((_QWORD *)v2 + 6) + 40);
    memset(v29, 0, sizeof(v29));
    *(_OWORD *)uu2 = *(__int128 *)((char *)v2 + 8);
    memset(v35, 0, 24);
    std::vector<re::DirectResourcesReuseList::Entry>::__init_with_size[abi:nn180100]<re::DirectResourcesReuseList::Entry*,re::DirectResourcesReuseList::Entry*>(v35, 0, 0, 0);
    v6 = (int64x2_t *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,std::vector<re::DirectResourcesReuseList::Entry>>>(a1, uu2, (uint64_t)uu2);
    v7 = v6[2].u64[1];
    v8 = v6[3].u64[0];
    if (v7 >= v8)
    {
      v12 = v6[2].i64[0];
      v13 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v7 - v12) >> 3);
      v14 = v13 + 1;
      if ((unint64_t)(v13 + 1) > 0x492492492492492)
        abort();
      v15 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v8 - v12) >> 3);
      if (2 * v15 > v14)
        v14 = 2 * v15;
      if (v15 >= 0x249249249249249)
        v16 = 0x492492492492492;
      else
        v16 = v14;
      v33 = v6 + 3;
      updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>((uint64_t)v6[3].i64, v16);
      v19 = &updated[56 * v13];
      v20 = *v2;
      v21 = v2[2];
      *((_OWORD *)v19 + 1) = v2[1];
      *((_OWORD *)v19 + 2) = v21;
      *(_OWORD *)v19 = v20;
      *((_QWORD *)v19 + 6) = *((_QWORD *)v2 + 6);
      *((_QWORD *)v2 + 6) = 0;
      v23 = v6[2].i64[0];
      v22 = v6[2].u64[1];
      if (v22 == v23)
      {
        v27 = vdupq_n_s64(v22);
        v24 = &updated[56 * v13];
      }
      else
      {
        v24 = &updated[56 * v13];
        do
        {
          v25 = *(_OWORD *)(v22 - 56);
          v26 = *(_OWORD *)(v22 - 40);
          *(_OWORD *)(v24 - 24) = *(_OWORD *)(v22 - 24);
          *(_OWORD *)(v24 - 40) = v26;
          *(_OWORD *)(v24 - 56) = v25;
          *((_QWORD *)v24 - 1) = *(_QWORD *)(v22 - 8);
          v24 -= 56;
          *(_QWORD *)(v22 - 8) = 0;
          v22 -= 56;
        }
        while (v22 != v23);
        v27 = v6[2];
      }
      v11 = v19 + 56;
      v6[2].i64[0] = (uint64_t)v24;
      v6[2].i64[1] = (uint64_t)(v19 + 56);
      v31 = v27;
      v28 = v6[3].i64[0];
      v6[3].i64[0] = (uint64_t)&updated[56 * v18];
      v32 = v28;
      v30 = (void **)v27.i64[0];
      std::__split_buffer<re::DirectResourcesReuseList::Entry>::~__split_buffer((uint64_t)&v30);
    }
    else
    {
      v9 = *v2;
      v10 = v2[2];
      *(_OWORD *)(v7 + 16) = v2[1];
      *(_OWORD *)(v7 + 32) = v10;
      *(_OWORD *)v7 = v9;
      *(_QWORD *)(v7 + 48) = *((_QWORD *)v2 + 6);
      *((_QWORD *)v2 + 6) = 0;
      v11 = (char *)(v7 + 56);
    }
    v6[2].i64[1] = (uint64_t)v11;
    v30 = (void **)v35;
    std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100](&v30);
    v30 = (void **)v29;
    std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100](&v30);
  }
}

_QWORD *re::DirectResourcesReusePool::purgeBefore@<X0>(_QWORD *this@<X0>, unint64_t a2@<X1>, char **a3@<X8>)
{
  _QWORD *v3;
  uint64_t v6;
  __int128 *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *updated;
  uint64_t v25;
  char *v26;
  __int128 v27;
  __int128 v28;
  unint64_t v29;
  char *v30;
  char *v31;
  __int128 v32;
  __int128 v33;
  int64x2_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int64x2_t v42;
  char *v43;
  uint64_t v44;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v37 = (uint64_t)this;
  v3 = (_QWORD *)this[2];
  if (v3)
  {
    v6 = 0;
    v39 = 0;
    v40 = (uint64_t)(a3 + 2);
    while (1)
    {
      v7 = (__int128 *)v3[4];
      this = v3 + 4;
      if ((__int128 *)v3[5] != v7)
      {
        if (*(_QWORD *)v7 >= a2)
        {
          v9 = 0;
          v8 = 0;
          v10 = v3[4];
LABEL_24:
          if (!v8)
            goto LABEL_28;
        }
        else
        {
          v38 = v6;
          v8 = 0;
          v9 = 0;
          v10 = v3[4];
          while (1)
          {
            v11 = v10 + 56 * v8;
            v13 = *(_QWORD *)(v11 + 48);
            v12 = (_QWORD *)(v11 + 48);
            v14 = *(_QWORD *)(v13 + 40);
            v15 = (unint64_t)a3[1];
            v16 = (unint64_t)a3[2];
            if (v15 >= v16)
            {
              v20 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v15 - (_QWORD)*a3) >> 3);
              v21 = v20 + 1;
              if ((unint64_t)(v20 + 1) > 0x492492492492492)
                abort();
              v22 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v16 - (_QWORD)*a3) >> 3);
              if (2 * v22 > v21)
                v21 = 2 * v22;
              v23 = v22 >= 0x249249249249249 ? 0x492492492492492 : v21;
              v44 = v40;
              updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>(v40, v23);
              v26 = &updated[56 * v20];
              v27 = *v7;
              v28 = v7[2];
              *((_OWORD *)v26 + 1) = v7[1];
              *((_OWORD *)v26 + 2) = v28;
              *(_OWORD *)v26 = v27;
              *((_QWORD *)v26 + 6) = *v12;
              *v12 = 0;
              v30 = *a3;
              v29 = (unint64_t)a3[1];
              if ((char *)v29 == *a3)
              {
                v34 = vdupq_n_s64(v29);
                v31 = &updated[56 * v20];
              }
              else
              {
                v31 = &updated[56 * v20];
                do
                {
                  v32 = *(_OWORD *)(v29 - 56);
                  v33 = *(_OWORD *)(v29 - 40);
                  *(_OWORD *)(v31 - 24) = *(_OWORD *)(v29 - 24);
                  *(_OWORD *)(v31 - 40) = v33;
                  *(_OWORD *)(v31 - 56) = v32;
                  *((_QWORD *)v31 - 1) = *(_QWORD *)(v29 - 8);
                  v31 -= 56;
                  *(_QWORD *)(v29 - 8) = 0;
                  v29 -= 56;
                }
                while ((char *)v29 != v30);
                v34 = *(int64x2_t *)a3;
              }
              v19 = v26 + 56;
              *a3 = v31;
              a3[1] = v26 + 56;
              v42 = v34;
              v35 = a3[2];
              a3[2] = &updated[56 * v25];
              v43 = v35;
              v41 = v34.i64[0];
              std::__split_buffer<re::DirectResourcesReuseList::Entry>::~__split_buffer((uint64_t)&v41);
            }
            else
            {
              v17 = *v7;
              v18 = v7[2];
              *(_OWORD *)(v15 + 16) = v7[1];
              *(_OWORD *)(v15 + 32) = v18;
              *(_OWORD *)v15 = v17;
              *(_QWORD *)(v15 + 48) = *v12;
              *v12 = 0;
              v19 = (char *)(v15 + 56);
            }
            v9 += v14;
            a3[1] = v19;
            ++v8;
            v10 = v3[4];
            if (v8 >= 0x6DB6DB6DB6DB6DB7 * ((v3[5] - v10) >> 3))
              break;
            v7 = (__int128 *)(v10 + 56 * v8);
            if (*(_QWORD *)v7 >= a2)
            {
              v7 = (__int128 *)v3[4];
              this = v3 + 4;
              v6 = v38;
              goto LABEL_24;
            }
          }
          v7 = (__int128 *)v3[4];
          this = v3 + 4;
          v6 = v38;
        }
        this = (_QWORD *)std::vector<re::DirectResourcesReuseList::Entry>::erase((uint64_t)this, (uint64_t)v7, v10 + 56 * v8);
        v39 += v8;
        v6 += v9;
      }
LABEL_28:
      v3 = (_QWORD *)*v3;
      if (!v3)
        goto LABEL_31;
    }
  }
  v6 = 0;
  v39 = 0;
LABEL_31:
  v36 = *(_QWORD *)(v37 + 48) - v6;
  *(_QWORD *)(v37 + 40) -= v39;
  *(_QWORD *)(v37 + 48) = v36;
  return this;
}

uint64_t std::vector<re::DirectResourcesReuseList::Entry>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  if (a2 != a3)
  {
    v5 = a3;
    v6 = *(_QWORD *)(a1 + 8);
    if (a3 == v6)
    {
      v8 = a2;
    }
    else
    {
      v7 = 8 * ((a3 - a2) >> 3);
      v8 = a2;
      do
      {
        v9 = *(_OWORD *)(v8 + v7);
        v10 = *(_OWORD *)(v8 + v7 + 32);
        *(_OWORD *)(v8 + 16) = *(_OWORD *)(v8 + v7 + 16);
        *(_OWORD *)(v8 + 32) = v10;
        *(_OWORD *)v8 = v9;
        v11 = *(_QWORD *)(v8 + 48);
        *(_QWORD *)(v8 + 48) = *(_QWORD *)(v8 + v7 + 48);
        *(_QWORD *)(v8 + v7 + 48) = v11;
        v8 += 56;
      }
      while (v8 + v7 != v6);
      v5 = *(_QWORD *)(a1 + 8);
    }
    while (v5 != v8)
    {
      v12 = *(_QWORD *)(v5 - 8);
      if (v12)
      {

        *(_QWORD *)(v5 - 8) = 0;
      }
      v5 -= 56;
    }
    *(_QWORD *)(a1 + 8) = v8;
  }
  return a2;
}

const unsigned __int8 *re::DirectResourcesReusePool::purgePayloads@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  const unsigned __int8 *result;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 uu2[8];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)uu2 = a2;
  v14 = a3;
  a4[1] = 0;
  a4[2] = 0;
  *a4 = 0;
  result = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a1, uu2);
  if (result)
  {
    v7 = (unsigned __int8 *)result;
    v8 = *((_QWORD *)result + 4);
    v9 = *((_QWORD *)result + 5);
    v10 = result + 32;
    if (v8 != v9)
    {
      v11 = a1[5];
      v12 = a1[6];
      do
      {
        --v11;
        v12 -= *(_QWORD *)(*(_QWORD *)(v8 + 48) + 40);
        v8 += 56;
      }
      while (v8 != v9);
      a1[5] = v11;
      a1[6] = v12;
    }
    std::vector<re::DirectResourcesReuseList::Entry>::__vdeallocate(a4);
    *(_OWORD *)a4 = *((_OWORD *)v7 + 2);
    a4[2] = *((_QWORD *)v7 + 6);
    *v10 = 0;
    v10[1] = 0;
    v10[2] = 0;
    return (const unsigned __int8 *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::erase(a1, (uint64_t *)v7);
  }
  return result;
}

_QWORD *std::vector<re::DirectResourcesReuseList::Entry>::__init_with_size[abi:nn180100]<re::DirectResourcesReuseList::Entry*,re::DirectResourcesReuseList::Entry*>(_QWORD *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<re::DirectResourcesReuseList::Entry>::__vallocate[abi:nn180100](result, a4);
    return std::vector<re::DirectResourcesReuseList::Entry>::__construct_at_end<re::DirectResourcesReuseList::Entry*,re::DirectResourcesReuseList::Entry*>(v6, a2, a3);
  }
  return result;
}

char *std::vector<re::DirectResourcesReuseList::Entry>::__vallocate[abi:nn180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x492492492492493)
    abort();
  result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[56 * v4];
  return result;
}

_QWORD *std::vector<re::DirectResourcesReuseList::Entry>::__construct_at_end<re::DirectResourcesReuseList::Entry*,re::DirectResourcesReuseList::Entry*>(_QWORD *result, __int128 *a2, __int128 *a3)
{
  _QWORD *v3;
  uint64_t v4;
  __int128 *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v3 = result;
  v4 = result[1];
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      v7 = *v6;
      v8 = v6[2];
      *(_OWORD *)(v4 + 16) = v6[1];
      *(_OWORD *)(v4 + 32) = v8;
      *(_OWORD *)v4 = v7;
      v9 = *((_QWORD *)v6 + 6);
      *(_QWORD *)(v4 + 48) = v9;
      if (v9)
        result = (id)(v9 + 8);
      v4 += 56;
      v6 = (__int128 *)((char *)v6 + 56);
    }
    while (v6 != a3);
  }
  v3[1] = v4;
  return result;
}

uint64_t std::__split_buffer<re::DirectResourcesReuseList::Entry>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<re::DirectResourcesReuseList::Entry>::__destruct_at_end[abi:nn180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<re::DirectResourcesReuseList::Entry>::__destruct_at_end[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    *(_QWORD *)(a1 + 16) = v2 - 56;
    v5 = *(_QWORD *)(v2 - 8);
    if (v5)
    {

      *(_QWORD *)(v2 - 8) = 0;
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 56;
    }
  }
}

uint64_t std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::__deallocate_node(a1, *(char **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::__deallocate_node(uint64_t a1, char *a2)
{
  char *v2;
  char *v3;
  void **v4;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = *(char **)v2;
      v4 = (void **)(v2 + 32);
      std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100](&v4);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::erase(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  void **v3;
  void *__p;
  uint64_t v6;

  v2 = *a2;
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::remove(a1, a2, (uint64_t)&__p);
  v3 = (void **)__p;
  __p = 0;
  if (v3)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,void *>>>::operator()[abi:nn180100]((uint64_t)&v6, v3);
  return v2;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,void *>>>::operator()[abi:nn180100](uint64_t a1, void **__p)
{
  void **v3;

  if (*(_BYTE *)(a1 + 8))
  {
    v3 = __p + 4;
    std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100](&v3);
  }
  if (__p)
    operator delete(__p);
}

void *std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,std::vector<re::DirectResourcesReuseList::Entry>>>(uint64_t a1, unsigned __int8 *uu2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v9;
  unint64_t v10;
  void **v11;
  void *i;
  unint64_t v13;
  __int128 v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v6 = (*((_QWORD *)uu2 + 1) + (*(_QWORD *)uu2 << 6) + (*(_QWORD *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(_QWORD *)uu2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v9.i16[0] = vaddlv_u8(v9);
    v10 = v9.u32[0];
    if (v9.u32[0] > 1uLL)
    {
      v3 = (*((_QWORD *)uu2 + 1) + (*(_QWORD *)uu2 << 6) + (*(_QWORD *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(_QWORD *)uu2;
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = v6 & (v7 - 1);
    }
    v11 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v11)
    {
      for (i = *v11; i; i = *(void **)i)
      {
        v13 = *((_QWORD *)i + 1);
        if (v13 == v6)
        {
          if (!uuid_compare((const unsigned __int8 *)i + 16, uu2))
            return i;
        }
        else
        {
          if (v10 > 1)
          {
            if (v13 >= v7)
              v13 %= v7;
          }
          else
          {
            v13 &= v7 - 1;
          }
          if (v13 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x38uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v6;
  v14 = *(_OWORD *)(a3 + 16);
  *((_OWORD *)i + 1) = *(_OWORD *)a3;
  *((_OWORD *)i + 2) = v14;
  *((_QWORD *)i + 6) = *(_QWORD *)(a3 + 32);
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 32) = 0;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v7 || (float)(v16 * (float)v7) < v15)
  {
    v17 = 1;
    if (v7 >= 3)
      v17 = (v7 & (v7 - 1)) != 0;
    v18 = v17 | (2 * v7);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__rehash<true>(a1, v20);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *(_QWORD *)i = *v22;
LABEL_38:
    *v22 = i;
    goto LABEL_39;
  }
  *(_QWORD *)i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v21 + 8 * v3) = a1 + 16;
  if (*(_QWORD *)i)
  {
    v23 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v23 >= v7)
        v23 %= v7;
    }
    else
    {
      v23 &= v7 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

BOOL re::DirectBufferValidation::isWellFormed(_QWORD *a1)
{
  return (*a1 & 0xFLL) == 0 && *a1 != 0;
}

BOOL re::DirectBufferValidation::isValid(re::DirectBufferValidation *this, const re::DirectBuffer *a2)
{
  return *(_QWORD *)(re::DirectBuffer::payload((uint64_t)this, 3, 0) + 40) >= *((_QWORD *)this + 6)
      && re::DirectBuffer::isValidBytesUsed(this, *((_QWORD *)this + 8));
}

BOOL re::DirectBufferValidation::isValidBytesUsed(unint64_t a1, unint64_t *a2)
{
  return !(a1 % a2[1]) && *a2 >= a1;
}

re::DirectResource *re::DirectResource::DirectResource(re::DirectResource *this)
{
  uint64_t v2;
  unsigned __int8 *v3;

  ArcSharedObject::ArcSharedObject(this, 0);
  *(_QWORD *)v2 = off_250B656B8;
  v3 = (unsigned __int8 *)(v2 + 16);
  uuid_copy((unsigned __int8 *)(v2 + 16), UUID_NULL);
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  uuid_generate_random(v3);
  return this;
}

void re::DirectResource::dispose(re::DirectResource *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 5);
  if (v2)
    (*(void (**)(uint64_t, re::DirectResource *))(*(_QWORD *)v2 + 32))(v2, this);
  else
    ArcSharedObject::dispose(this);
}

double re::DirectResource::setIdentifier(re::DirectResource *this, const unsigned __int8 (*a2)[16])
{
  double result;
  uuid_t dst;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (*((_QWORD *)this + 5))
    re::DirectResource::setIdentifier();
  uuid_copy(dst, (const unsigned __int8 *)a2);
  result = *(double *)dst;
  *((_OWORD *)this + 1) = *(_OWORD *)dst;
  return result;
}

uint64_t re::DirectResource::setDelegate(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = a2;
  return result;
}

uint64_t re::DirectResource::willChange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)result + 16))(result, a1, a2, a3, a4, a5);
  return result;
}

uint64_t re::DirectResource::didChange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)result + 24))(result, a1, a2, a3, a4);
  return result;
}

void re::DirectResource::newPayload(uint64_t a1@<X0>, void *a2@<X3>, _QWORD *a3@<X8>)
{
  uint64_t v5;

  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
  if (v5)
    re::DirectMemoryResource::create(*(re::MemoryMappedRegion **)(v5 + 40), (re::DirectMemoryResource *)*(unsigned int *)(v5 + 36), a2, a3);
  else
    *a3 = 0;
}

void re::DirectTexture::create(uint64_t a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  char *v6;
  uint64_t v7;

  if (*a2 && (re::DirectTextureValidation::isWellFormed() & 1) != 0)
  {
    v6 = (char *)operator new(0x88uLL);
    v7 = re::DirectTexture::DirectTexture((uint64_t)v6, a1);
    if (re::DirectTexture::allocateStorage(v7, (uint64_t)a2))
    {
      *a3 = v6;
    }
    else
    {
      *a3 = 0;

    }
  }
  else
  {
    *a3 = 0;
  }
}

BOOL re::DirectTexture::allocateStorage(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  re::DirectMemoryResource *v4;
  re::DirectMemoryResource *v6;

  re::DirectTexture::allocatePayload(*(id *)a2, a1, *(unsigned __int8 *)(a2 + 8), &v6);
  v3 = *(_QWORD *)(a1 + 128);
  v4 = v6;
  *(_QWORD *)(a1 + 128) = v6;
  v6 = (re::DirectMemoryResource *)v3;
  if (v3)
  {

    v4 = *(re::DirectMemoryResource **)(a1 + 128);
  }
  return v4 != 0;
}

uint64_t re::DirectTexture::DirectTexture(uint64_t a1, uint64_t a2)
{
  re::DirectResource *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  id v8;

  v4 = re::DirectResource::DirectResource((re::DirectResource *)a1);
  *(_QWORD *)v4 = &off_250B65728;
  *((_OWORD *)v4 + 3) = *(_OWORD *)a2;
  v5 = *(_OWORD *)(a2 + 16);
  v6 = *(_OWORD *)(a2 + 32);
  v7 = *(_OWORD *)(a2 + 48);
  *((_QWORD *)v4 + 14) = *(_QWORD *)(a2 + 64);
  *((_OWORD *)v4 + 5) = v6;
  *((_OWORD *)v4 + 6) = v7;
  *((_OWORD *)v4 + 4) = v5;
  v8 = objc_msgSend(objc_msgSend(MEMORY[0x24BDDD740], sel_alloc), sel_init);
  *(_QWORD *)(a1 + 120) = v8;
  objc_msgSend(v8, sel_setWidth_, *(_QWORD *)(a1 + 48));
  objc_msgSend(v8, sel_setHeight_, *(_QWORD *)(a1 + 56));
  objc_msgSend(v8, sel_setDepth_, *(_QWORD *)(a1 + 64));
  objc_msgSend(v8, sel_setMipmapLevelCount_, *(_QWORD *)(a1 + 72));
  objc_msgSend(v8, sel_setArrayLength_, *(_QWORD *)(a1 + 80));
  objc_msgSend(v8, sel_setPixelFormat_, *(_QWORD *)(a1 + 88));
  objc_msgSend(v8, sel_setTextureType_, *(_QWORD *)(a1 + 96));
  objc_msgSend(v8, sel_setUsage_, *(_QWORD *)(a1 + 104));
  objc_msgSend(v8, sel_setSwizzle_, *(unsigned int *)(a1 + 112));
  objc_msgSend(v8, sel_setStorageMode_, 2);
  objc_msgSend(v8, sel_setResourceOptions_, 32);
  *(_QWORD *)(a1 + 128) = 0;
  return a1;
}

void re::DirectTexture::allocatePayload(id a1@<X1>, uint64_t a2@<X0>, int a3@<W2>, re::DirectMemoryResource **a4@<X8>)
{
  uint64_t v5;
  char **v6;
  id v7;
  id v8;

  v8 = 0;
  if (a3)
  {
    v5 = *(_QWORD *)(a2 + 120);
    v6 = &selRef_newSharedTextureWithDescriptor_;
  }
  else
  {
    v5 = *(_QWORD *)(a2 + 120);
    v6 = &selRef_newTextureWithDescriptor_;
  }
  v7 = objc_msgSend(a1, *v6, v5);
  NS::SharedPtr<MTL::Buffer>::operator=(&v8, &v7);
  if (v7)

  if (v8)
  {
    if (objc_msgSend(v8, sel_isShareable))
      re::DirectMemoryResource::createWithSharedTexture(v8, 10, a4);
    else
      re::DirectMemoryResource::createWithPrivateTexture(v8, 2, a4);
    if (v8)

  }
  else
  {
    *a4 = 0;
  }
}

BOOL re::DirectTexture::isAttachedToDevice(re::DirectMemoryResource **this)
{
  id v1;
  id v2;

  v1 = *(id *)re::DirectMemoryResource::runtimeResource(this[16]);
  v2 = v1;
  if (v1)

  return v2 != 0;
}

uint64_t re::DirectTexture::attachToDevice(uint64_t a1, void *a2)
{
  return re::DirectTexture::allocateRuntimeResource(a1, *(re::DirectMemoryResource **)(a1 + 128), a2);
}

uint64_t re::DirectTexture::allocateRuntimeResource(uint64_t a1, re::DirectMemoryResource *a2, void *a3)
{
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  id v9;
  id v10;
  id v11;

  if (!re::DirectMemoryResource::bindToResource((uint64_t)a2, 2, 3))
    return 0;
  if (*(_QWORD *)re::DirectMemoryResource::runtimeResource(a2))
    return 1;
  v6 = *((_QWORD *)a2 + 7);
  if (!v6)
    return 0;
  v11 = 0;
  v10 = objc_msgSend(objc_msgSend(MEMORY[0x24BDDD700], sel_alloc), sel_initWithIOSurface_label_, v6, &stru_250B65B50);
  NS::SharedPtr<MTL::Buffer>::operator=(&v11, &v10);
  if (v10)

  v7 = objc_msgSend(a3, sel_newSharedTextureWithHandle_, v11);
  v9 = v7;
  re::DirectMemoryResource::setRuntimeResource((uint64_t)a2, &v9);
  if (v9)
  {

    v9 = 0;
  }
  v5 = v7 != 0;
  if (v7)

  if (v11)
  return v5;
}

void re::DirectTexture::newPayload(id a1@<X3>, uint64_t a2@<X0>, int a3@<W1>, uint64_t a4@<X2>, re::DirectMemoryResource **a5@<X8>)
{
  if (a1 && a3 == 3 && !a4)
    re::DirectTexture::allocatePayload(a1, a2, (*(_DWORD *)(*(_QWORD *)(a2 + 128) + 36) >> 3) & 1, a5);
  else
    *a5 = 0;
}

uint64_t re::DirectTexture::payload(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;

  result = 0;
  if (a2 == 3 && !a3)
    return *(_QWORD *)(a1 + 128);
  return result;
}

uint64_t re::DirectTexture::setPayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = re::DirectMemoryResource::bindToResource(*a4, 2, a2);
  if ((_DWORD)result)
  {
    result = 0;
    if ((_DWORD)a2 == 3 && !a3)
    {
      v9 = *(_QWORD *)(a1 + 40);
      if (v9)
        (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v9 + 40))(v9, a1, a2, 0);
      v10 = *(_QWORD *)(a1 + 128);
      *(_QWORD *)(a1 + 128) = *a4;
      *a4 = v10;
      v11 = *(_QWORD *)(a1 + 40);
      if (v11)
        (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v11 + 48))(v11, a1, a2, 0);
      return 1;
    }
  }
  return result;
}

uint64_t re::DirectTexture::forEachSlot(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  re::DirectTexture *v4;
  __int128 v5;

  v5 = xmmword_23A4F97B0;
  v2 = *(_QWORD *)(a2 + 24);
  if (v2)
    return (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)v2 + 48))(v2, &v5);
  v4 = (re::DirectTexture *)std::__throw_bad_function_call[abi:nn180100]();
  return re::DirectTexture::readTexture(v4);
}

id re::DirectTexture::readTexture@<X0>(re::DirectMemoryResource **this@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = *(id *)re::DirectMemoryResource::runtimeResource(this[16]);
  *a2 = result;
  return result;
}

id re::DirectTexture::replaceTexture@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  id result;

  re::DirectResource::willChange(a1, 3, 0, 1, a2);
  result = *(id *)re::DirectMemoryResource::runtimeResource(*(re::DirectMemoryResource **)(a1 + 128));
  *a3 = result;
  return result;
}

void re::DirectTexture::~DirectTexture(re::DirectTexture *this)
{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)this + 16);
  if (v2)
  {

    *((_QWORD *)this + 16) = 0;
  }
  v3 = (void *)*((_QWORD *)this + 15);
  if (v3)
  {

    *((_QWORD *)this + 15) = 0;
  }
  re::DirectResource::~DirectResource(this);
}

{
  uint64_t v2;
  void *v3;

  v2 = *((_QWORD *)this + 16);
  if (v2)
  {

    *((_QWORD *)this + 16) = 0;
  }
  v3 = (void *)*((_QWORD *)this + 15);
  if (v3)
  {

    *((_QWORD *)this + 15) = 0;
  }
  re::DirectResource::~DirectResource(this);
  JUMPOUT(0x23B84F8E0);
}

uint64_t re::DirectTexture::type(re::DirectTexture *this)
{
  return 2;
}

void re::DirectMesh::create(_OWORD *a1@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  char *v6;
  unint64_t *v7;

  if (*a2 && (re::DirectMeshValidation::isWellFormed((uint64_t)a1) & 1) != 0)
  {
    v6 = (char *)operator new(0xB8uLL);
    v7 = (unint64_t *)re::DirectMesh::DirectMesh((uint64_t)v6, a1);
    if (re::DirectMesh::allocateStorage(v7, (uint64_t)a2))
    {
      re::DirectMesh::attachToDevice((uint64_t)v6);
      *a3 = v6;
    }
    else
    {
      *a3 = 0;

    }
  }
  else
  {
    *a3 = 0;
  }
}

BOOL re::DirectMesh::allocateStorage(unint64_t *a1, uint64_t a2)
{
  void *v3;
  char v4;
  re::DirectMemoryResource *v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t *v10;
  char v11;
  re::MemoryMappedRegion *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _BOOL8 v17;
  unint64_t v19;
  re::MemoryMappedRegion *v20[5];
  char v21;

  v3 = *(void **)a2;
  if (*(_BYTE *)(a2 + 8))
    v4 = -1;
  else
    v4 = -9;
  re::calculateBufferSizes(a1 + 6, (uint64_t)v20);
  if (!v21)
    return 0;
  v5 = (re::DirectMemoryResource *)(v4 & 0xB);
  re::DirectMemoryResource::create(v20[0], (re::DirectMemoryResource *)(v4 & 0xF), v3, &v19);
  v6 = a1[18];
  v7 = v19;
  a1[18] = v19;
  v19 = v6;
  v8 = v7 != 0;
  if (v6)

  v9 = 0;
  v10 = a1 + 19;
  do
  {
    v11 = v8;
    v12 = v20[v9 + 1];
    v8 &= v12 == 0;
    if (v12)
    {
      if ((v11 & 1) != 0)
      {
        re::DirectMemoryResource::create(v12, v5, v3, &v19);
        v13 = v10[v9];
        v14 = v19;
        v10[v9] = v19;
        v19 = v13;
        v8 = v14 != 0;
        if (v13)

      }
    }
    ++v9;
  }
  while (v9 != 4);
  if ((v8 & 1) != 0)
  {
    re::DirectMemoryResource::create((re::MemoryMappedRegion *)0x300, (re::DirectMemoryResource *)5, v3, &v19);
    v15 = a1[17];
    v16 = v19;
    a1[17] = v19;
    v19 = v15;
    v17 = v16 != 0;
    if (v15)

  }
  else
  {
    v17 = 0;
  }
  a1[16] = 0;
  return v17;
}

uint64_t re::DirectMesh::attachToDevice(uint64_t a1)
{
  uint64_t *v2;
  uint64_t *v3;
  int *v4;
  int v5;
  uint64_t *v6;
  unint64_t v7;
  re::DirectMemoryResource *v8;
  uint64_t result;
  void *v10;
  id v11;
  id v12;

  v2 = (uint64_t *)(a1 + 144);
  v3 = (uint64_t *)(a1 + 136);
  v4 = &re::DirectMesh::attachToDevice(MTL::Device *)::gpuSlots;
  do
  {
    v5 = *v4;
    v6 = v3;
    if (*v4)
    {
      if (v5 == 2)
      {
        v7 = *((_QWORD *)v4 + 1);
        if (v7 > 3)
          goto LABEL_13;
        v6 = (uint64_t *)(a1 + 8 * v7 + 152);
      }
      else
      {
        v6 = v2;
        if (v5 != 1)
          goto LABEL_13;
      }
    }
    v8 = (re::DirectMemoryResource *)*v6;
    if (*v6)
    {
      result = re::DirectMemoryResource::bindToResource(*v6, 1, v5);
      if (!(_DWORD)result)
        return result;
      if (!*(_QWORD *)re::DirectMemoryResource::runtimeResource(v8))
      {
        re::DirectMemoryResource::makeBuffer((uint64_t)v8);
        v10 = v11;
        v11 = 0;
        v12 = v10;
        re::DirectMemoryResource::setRuntimeResource((uint64_t)v8, &v12);
        if (v12)
        {

          v12 = 0;
        }
      }
    }
LABEL_13:
    v4 += 4;
  }
  while (v4 != (int *)re::DirectMesh::forEachSlot(std::function<void ()(re::DirectResourceSlot)> const&)const::allSlots);
  return 1;
}

uint64_t re::DirectMesh::DirectMesh(uint64_t a1, _OWORD *a2)
{
  re::DirectResource *v4;
  __int128 v5;

  v4 = re::DirectResource::DirectResource((re::DirectResource *)a1);
  *(_QWORD *)v4 = &off_250B65798;
  v5 = a2[1];
  *((_OWORD *)v4 + 3) = *a2;
  *((_OWORD *)v4 + 4) = v5;
  std::vector<re::DirectMeshVertexAttribute>::vector((_QWORD *)v4 + 10, (uint64_t)(a2 + 2));
  std::vector<re::DirectMeshVertexLayout>::vector((_QWORD *)(a1 + 104), (uint64_t)a2 + 56);
  *(_QWORD *)(a1 + 176) = 0;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  return a1;
}

void re::DirectMesh::~DirectMesh(re::DirectMesh *this)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  for (i = 176; i != 144; i -= 8)
  {
    v3 = *(_QWORD *)((char *)this + i);
    if (v3)
    {

      *(_QWORD *)((char *)this + i) = 0;
    }
  }
  v4 = *((_QWORD *)this + 18);
  if (v4)
  {

    *((_QWORD *)this + 18) = 0;
  }
  v5 = *((_QWORD *)this + 17);
  if (v5)
  {

    *((_QWORD *)this + 17) = 0;
  }
  v6 = (void *)*((_QWORD *)this + 13);
  if (v6)
  {
    *((_QWORD *)this + 14) = v6;
    operator delete(v6);
  }
  v7 = (void *)*((_QWORD *)this + 10);
  if (v7)
  {
    *((_QWORD *)this + 11) = v7;
    operator delete(v7);
  }
  re::DirectResource::~DirectResource(this);
}

{
  re::DirectMesh::~DirectMesh(this);
  JUMPOUT(0x23B84F8E0);
}

unint64_t re::calculateBufferSizes@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  char v11;
  _BYTE *v12;
  unint64_t v13;
  __int128 v14;
  _BYTE v15[40];

  memset(&v15[8], 0, 32);
  result = re::lengthInBytes(a1[1]);
  if (is_mul_ok(result, *a1))
  {
    *(_QWORD *)v15 = result * *a1;
    v6 = a1[4];
    v7 = a1[5];
    if (v6 == v7)
    {
LABEL_10:
      v14 = *(_OWORD *)&v15[16];
      *(_OWORD *)a2 = *(_OWORD *)v15;
      *(_OWORD *)(a2 + 16) = v14;
      *(_QWORD *)(a2 + 32) = *(_QWORD *)&v15[32];
      v5 = 1;
      goto LABEL_11;
    }
    while (1)
    {
      v8 = *(_QWORD *)(v6 + 16);
      v9 = a1[7];
      if (v8 >= 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a1[8] - v9) >> 3))
        break;
      v10 = (_QWORD *)(v9 + 40 * v8);
      if (*v10 >= 4uLL)
        break;
      result = re::lengthInBytes(v6, v10, a1[3]);
      if (!v11)
        break;
      v12 = &v15[8 * *v10];
      v13 = *((_QWORD *)v12 + 1);
      if (v13 <= result)
        v13 = result;
      *((_QWORD *)v12 + 1) = v13;
      v6 += 32;
      if (v6 == v7)
        goto LABEL_10;
    }
  }
  v5 = 0;
  *(_BYTE *)a2 = 0;
LABEL_11:
  *(_BYTE *)(a2 + 40) = v5;
  return result;
}

re::DirectMemoryResource *re::DirectMesh::isAttachedToDevice(re::DirectMesh *this)
{
  re::DirectMemoryResource *result;

  result = (re::DirectMemoryResource *)*((_QWORD *)this + 18);
  if (result)
    return (re::DirectMemoryResource *)(*(_QWORD *)re::DirectMemoryResource::runtimeResource(result) != 0);
  return result;
}

uint64_t re::DirectMesh::payload(uint64_t a1, int a2, unint64_t a3)
{
  uint64_t v3;

  switch(a2)
  {
    case 2:
      if (a3 <= 3)
      {
        v3 = a1 + 8 * a3 + 152;
        return *(_QWORD *)v3;
      }
      break;
    case 1:
      v3 = a1 + 144;
      return *(_QWORD *)v3;
    case 0:
      v3 = a1 + 136;
      return *(_QWORD *)v3;
  }
  return 0;
}

uint64_t re::DirectMesh::indexPayload(re::DirectMesh *this)
{
  return *((_QWORD *)this + 18);
}

uint64_t re::DirectMesh::partsPayload(re::DirectMesh *this)
{
  return *((_QWORD *)this + 17);
}

uint64_t re::DirectMesh::vertexPayload(re::DirectMesh *this, unint64_t a2)
{
  if (a2 > 3)
    return 0;
  else
    return *((_QWORD *)this + a2 + 19);
}

id re::DirectMesh::parts(re::DirectMemoryResource **this)
{
  return re::DirectMemoryResource::bytes(this[17]);
}

void re::DirectMesh::setParts(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;

  v6 = a3;
  if (a3)
    v5 = (id)(a3 + 8);
  re::DirectMesh::setPayload(a1, 0, 0, &v6);
  if (v6)

  if (*(_QWORD *)(a1 + 128) != a2)
  {
    re::DirectResource::willChange(a1, 0, 0, 0, 0);
    *(_QWORD *)(a1 + 128) = a2;
    re::DirectResource::didChange(a1, 0, 0, 0);
  }
}

uint64_t re::DirectMesh::setPayload(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = re::DirectMemoryResource::bindToResource(*a4, 1, a2);
  if (!(_DWORD)result)
    return result;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, uint64_t, unint64_t))(*(_QWORD *)v9 + 40))(v9, a1, a2, a3);
  if ((_DWORD)a2 == 2)
  {
    if (a3 <= 3)
    {
      v11 = *a4;
      v10 = (uint64_t *)(a1 + 8 * a3 + 152);
      v14 = *a4;
      *a4 = 0;
      v12 = &v14;
      goto LABEL_12;
    }
    return 0;
  }
  if ((_DWORD)a2 == 1)
  {
    v10 = (uint64_t *)(a1 + 144);
    v11 = *a4;
    v15 = *a4;
    *a4 = 0;
    v12 = &v15;
    goto LABEL_12;
  }
  if ((_DWORD)a2)
    return 0;
  v10 = (uint64_t *)(a1 + 136);
  v11 = *a4;
  v16 = *a4;
  *a4 = 0;
  v12 = &v16;
LABEL_12:
  re::DirectMesh::replaceInternal(a1, v10, v12);
  if (v11)

  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, uint64_t, unint64_t))(*(_QWORD *)v13 + 48))(v13, a1, a2, a3);
  return 1;
}

uint64_t re::DirectMesh::setPartCount(uint64_t this, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  id v8;
  char *v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  re::DirectMemoryResource *v13;
  re::DirectMemoryResource *v14;

  if (*(_QWORD *)(this + 128) != a2)
  {
    v3 = this;
    re::DirectResource::willChange(this, 0, 0, 0, 0);
    v4 = *(_QWORD *)(v3 + 128);
    v5 = *(_QWORD *)(*(_QWORD *)(v3 + 136) + 40) / 0x60uLL;
    if (v5 < a2)
    {
      v6 = 2 * v5;
      if (v6 <= a2)
        v6 = a2;
      re::DirectMemoryResource::create((re::MemoryMappedRegion *)(96 * v6), (re::DirectMemoryResource *)5, 0, &v14);
      if (v14)
      {
        v7 = re::DirectMemoryResource::bytes(v14);
        v8 = re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(v3 + 136));
        memcpy(v7, v8, 96 * v4);
        v13 = v14;
        if (v14)
          v9 = (char *)v14 + 8;
      }
      else
      {
        v13 = 0;
      }
      re::DirectMesh::setPayload(v3, 0, 0, (uint64_t *)&v13);
      if (v13)

      if (v14)
    }
    *(_QWORD *)(v3 + 128) = a2;
    v10 = a2 > v4;
    v11 = a2 - v4;
    if (v10)
    {
      v12 = (char *)re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(v3 + 136)) + 96 * v4 + 24;
      do
      {
        *((_QWORD *)v12 - 3) = 0;
        *((_QWORD *)v12 - 2) = 0;
        *((_QWORD *)v12 - 1) = 3;
        *(_QWORD *)v12 = 0;
        *((_QWORD *)v12 + 1) = 0;
        *(_OWORD *)(v12 + 24) = 0uLL;
        *(_OWORD *)(v12 + 40) = 0uLL;
        *((_QWORD *)v12 + 7) = 0;
        v12 += 96;
        --v11;
      }
      while (v11);
    }
    return re::DirectResource::didChange(v3, 0, 0, 0);
  }
  return this;
}

uint64_t re::DirectMesh::updateParts(uint64_t a1, uint64_t a2)
{
  id v4;

  re::DirectResource::willChange(a1, 0, 0, 0, 0);
  v4 = re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(a1 + 136));
  (*(void (**)(uint64_t, id, _QWORD))(a2 + 16))(a2, v4, *(_QWORD *)(a1 + 128));
  return re::DirectResource::didChange(a1, 0, 0, 0);
}

uint64_t re::DirectMesh::readBuffer(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4;
  re::DirectMemoryResource *v5;
  uint64_t v6;
  re::DirectMemoryResource *v7;
  id v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, id, uint64_t);
  uint64_t v11;

  if (a2 <= 3 && (v4 = a1 + 8 * a2, v7 = *(re::DirectMemoryResource **)(v4 + 152), v6 = v4 + 152, (v5 = v7) != 0))
  {
    v8 = re::DirectMemoryResource::bytes(v5);
    v9 = *(_QWORD *)(*(_QWORD *)v6 + 40);
    v10 = *(uint64_t (**)(uint64_t, id, uint64_t))(a3 + 16);
    v11 = a3;
  }
  else
  {
    v10 = *(uint64_t (**)(uint64_t, id, uint64_t))(a3 + 16);
    v11 = a3;
    v8 = 0;
    v9 = 0;
  }
  return v10(v11, v8, v9);
}

uint64_t re::DirectMesh::readIndices(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(a1 + 144));
  return (*(uint64_t (**)(uint64_t, id, _QWORD))(a2 + 16))(a2, v4, *(_QWORD *)(*(_QWORD *)(a1 + 144) + 40));
}

uint64_t re::DirectMesh::updateBuffer(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6;
  re::DirectMemoryResource **v7;
  uint64_t v8;
  id v9;

  if (a2 > 3)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a3 + 16))(a3, 0, 0);
  v6 = a1 + 8 * a2;
  v8 = *(_QWORD *)(v6 + 152);
  v7 = (re::DirectMemoryResource **)(v6 + 152);
  if (!v8)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a3 + 16))(a3, 0, 0);
  re::DirectResource::willChange(a1, 2, a2, 0, 0);
  v9 = re::DirectMemoryResource::bytes(*v7);
  (*(void (**)(uint64_t, id, _QWORD))(a3 + 16))(a3, v9, *((_QWORD *)*v7 + 5));
  return re::DirectResource::didChange(a1, 2, a2, 0);
}

{
  unint64_t v3;
  re::DirectMemoryResource **v4;
  uint64_t v5;

  if (a2 > 3)
    return 0;
  v3 = a1 + 8 * a2;
  v5 = *(_QWORD *)(v3 + 152);
  v4 = (re::DirectMemoryResource **)(v3 + 152);
  if (!v5)
    return 0;
  re::DirectResource::willChange(a1, 2, a2, 0, a3);
  return *(_QWORD *)re::DirectMemoryResource::runtimeResource(*v4);
}

uint64_t re::DirectMesh::updateIndices(re::DirectMemoryResource **a1, uint64_t a2)
{
  id v4;

  re::DirectResource::willChange((uint64_t)a1, 1, 0, 0, 0);
  v4 = re::DirectMemoryResource::bytes(a1[18]);
  (*(void (**)(uint64_t, id, _QWORD))(a2 + 16))(a2, v4, *((_QWORD *)a1[18] + 5));
  re::DirectMesh::validateIndices((re::DirectMesh *)a1);
  return re::DirectResource::didChange((uint64_t)a1, 1, 0, 0);
}

BOOL re::DirectMesh::validateIndices(re::DirectMesh *this)
{
  uint64_t v2;
  _WORD *v3;

  v2 = *((_QWORD *)this + 7);
  v3 = re::DirectMemoryResource::bytes(*((re::DirectMemoryResource **)this + 18));
  return re::DirectMeshValidation::validateAndFixupIndices(v2, v3, *(_QWORD *)(*((_QWORD *)this + 18) + 40), *((_QWORD *)this + 9)) == 0;
}

uint64_t re::DirectMesh::replaceBuffer(uint64_t a1, unint64_t a2, uint64_t a3)
{
  unint64_t v6;
  re::DirectMemoryResource **v7;
  uint64_t v8;
  id v9;

  if (a2 > 3)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a3 + 16))(a3, 0, 0);
  v6 = a1 + 8 * a2;
  v8 = *(_QWORD *)(v6 + 152);
  v7 = (re::DirectMemoryResource **)(v6 + 152);
  if (!v8)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a3 + 16))(a3, 0, 0);
  re::DirectResource::willChange(a1, 2, a2, 1, 0);
  v9 = re::DirectMemoryResource::bytes(*v7);
  (*(void (**)(uint64_t, id, _QWORD))(a3 + 16))(a3, v9, *((_QWORD *)*v7 + 5));
  return re::DirectResource::didChange(a1, 2, a2, 0);
}

{
  unint64_t v3;
  re::DirectMemoryResource **v4;
  uint64_t v5;

  if (a2 > 3)
    return 0;
  v3 = a1 + 8 * a2;
  v5 = *(_QWORD *)(v3 + 152);
  v4 = (re::DirectMemoryResource **)(v3 + 152);
  if (!v5)
    return 0;
  re::DirectResource::willChange(a1, 2, a2, 1, a3);
  return *(_QWORD *)re::DirectMemoryResource::runtimeResource(*v4);
}

uint64_t re::DirectMesh::replaceIndices(re::DirectMemoryResource **a1, uint64_t a2)
{
  id v4;

  re::DirectResource::willChange((uint64_t)a1, 1, 0, 1, 0);
  v4 = re::DirectMemoryResource::bytes(a1[18]);
  (*(void (**)(uint64_t, id, _QWORD))(a2 + 16))(a2, v4, *((_QWORD *)a1[18] + 5));
  re::DirectMesh::validateIndices((re::DirectMesh *)a1);
  return re::DirectResource::didChange((uint64_t)a1, 1, 0, 0);
}

re::DirectMemoryResource *re::DirectMesh::readBuffer(uint64_t a1, unint64_t a2)
{
  re::DirectMemoryResource *result;

  if (a2 > 3)
    return 0;
  result = *(re::DirectMemoryResource **)(a1 + 8 * a2 + 152);
  if (result)
    return *(re::DirectMemoryResource **)re::DirectMemoryResource::runtimeResource(result);
  return result;
}

uint64_t re::DirectMesh::readIndices(uint64_t a1)
{
  return *(_QWORD *)re::DirectMemoryResource::runtimeResource(*(re::DirectMemoryResource **)(a1 + 144));
}

uint64_t re::DirectMesh::updateIndices(uint64_t a1, uint64_t a2)
{
  re::DirectResource::willChange(a1, 1, 0, 0, a2);
  return *(_QWORD *)re::DirectMemoryResource::runtimeResource(*(re::DirectMemoryResource **)(a1 + 144));
}

uint64_t re::DirectMesh::replaceIndices(uint64_t a1, uint64_t a2)
{
  re::DirectResource::willChange(a1, 1, 0, 1, a2);
  return *(_QWORD *)re::DirectMemoryResource::runtimeResource(*(re::DirectMemoryResource **)(a1 + 144));
}

void re::DirectMesh::replaceInternal(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  re::DirectMemoryResource *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v6 = *(re::DirectMemoryResource **)(a1 + 144);
  if (v6 && *(_QWORD *)re::DirectMemoryResource::runtimeResource(v6))
  {
    v7 = objc_msgSend(*(id *)re::DirectMemoryResource::runtimeResource(*(re::DirectMemoryResource **)(a1 + 144)), sel_device);
    re::SharedPtr<re::DirectBuffer>::reset(a2, *a3);
    if (v7 && !*(_QWORD *)re::DirectMemoryResource::runtimeResource((re::DirectMemoryResource *)*a3))
    {
      v8 = *a3;
      re::DirectMemoryResource::makeBuffer(v8);
      v10 = v9;
      re::DirectMemoryResource::setRuntimeResource(v8, &v10);
      if (v10)
      {

        v10 = 0;
      }
    }
  }
  else
  {
    re::SharedPtr<re::DirectBuffer>::reset(a2, *a3);
  }
}

uint64_t re::DirectMesh::forEachSlot(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  re::DirectMesh *v6;
  __int128 v7;

  v3 = 0;
  while (1)
  {
    v7 = re::DirectMesh::forEachSlot(std::function<void ()(re::DirectResourceSlot)> const&)const::allSlots[v3];
    v4 = *(_QWORD *)(a2 + 24);
    if (!v4)
      break;
    result = (*(uint64_t (**)(uint64_t, __int128 *))(*(_QWORD *)v4 + 48))(v4, &v7);
    if (++v3 == 6)
      return result;
  }
  v6 = (re::DirectMesh *)std::__throw_bad_function_call[abi:nn180100]();
  return re::DirectMesh::type(v6);
}

uint64_t re::DirectMesh::type(re::DirectMesh *this)
{
  return 1;
}

uint64_t DRMeshDescriptorCreate()
{
  ArcSharedObject *v0;
  uint64_t v1;

  v0 = (ArcSharedObject *)operator new(0x60uLL);
  *(_OWORD *)v0 = 0u;
  *((_OWORD *)v0 + 1) = 0u;
  *((_OWORD *)v0 + 2) = 0u;
  *((_OWORD *)v0 + 3) = 0u;
  *((_OWORD *)v0 + 4) = 0u;
  *((_OWORD *)v0 + 5) = 0u;
  ArcSharedObject::ArcSharedObject(v0, 0);
  *(_OWORD *)(v1 + 16) = xmmword_23A4F97D0;
  *(_QWORD *)(v1 + 32) = 1;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 72) = 0u;
  *(_QWORD *)(v1 + 88) = 0;
  *(_QWORD *)v1 = &off_250B65898;
  return v1 + 8;
}

uint64_t DRMeshDescriptorGetVertexBufferCount(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 32);
}

uint64_t DRMeshDescriptorSetVertexBufferCount(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t DRMeshDescriptorGetVertexCapacity(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 40);
}

uint64_t DRMeshDescriptorSetVertexCapacity(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t DRMeshDescriptorGetIndexCapacity(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 16);
}

uint64_t DRMeshDescriptorSetIndexCapacity(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t DRMeshDescriptorGetIndexType(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 24);
}

uint64_t DRMeshDescriptorSetIndexType(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t DRMeshDescriptorGetVertexAttributeCount(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return (uint64_t)(*(_QWORD *)(v1 + 56) - *(_QWORD *)(v1 + 48)) >> 5;
}

void DRMeshDescriptorSetVertexAttributeCount(void *a1, unint64_t a2)
{
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  __int128 v17;
  id v18;
  _OWORD v19[2];

  v3 = a1;
  v18 = v3;
  if (v3)
    v4 = v3 - 8;
  else
    v4 = 0;
  v5 = *((_QWORD *)v4 + 6);
  v6 = (char *)*((_QWORD *)v4 + 7);
  v7 = (uint64_t)&v6[-v5] >> 5;
  if (v7 < a2)
  {
    v8 = v4 + 64;
    do
    {
      memset(v19, 0, 28);
      if ((unint64_t)v6 >= *v8)
      {
        if ((v7 + 1) >> 59)
          abort();
        v9 = *v8 - v5;
        v10 = v9 >> 4;
        if (v9 >> 4 <= v7 + 1)
          v10 = v7 + 1;
        if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFE0)
          v11 = 0x7FFFFFFFFFFFFFFLL;
        else
          v11 = v10;
        if (v11)
          v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>((uint64_t)(v4 + 64), v11);
        else
          v12 = 0;
        v13 = &v12[32 * v7];
        *(_DWORD *)v13 = -1;
        *(_QWORD *)(v13 + 4) = 0;
        *(_QWORD *)(v13 + 20) = 0;
        *(_QWORD *)(v13 + 12) = 0;
        *((_DWORD *)v13 + 7) = 0;
        v15 = (char *)*((_QWORD *)v4 + 6);
        v14 = (char *)*((_QWORD *)v4 + 7);
        v16 = v13;
        if (v14 != v15)
        {
          do
          {
            v17 = *((_OWORD *)v14 - 1);
            *((_OWORD *)v16 - 2) = *((_OWORD *)v14 - 2);
            *((_OWORD *)v16 - 1) = v17;
            v16 -= 32;
            v14 -= 32;
          }
          while (v14 != v15);
          v14 = (char *)*((_QWORD *)v4 + 6);
        }
        v6 = v13 + 32;
        *((_QWORD *)v4 + 6) = v16;
        *((_QWORD *)v4 + 7) = v13 + 32;
        *((_QWORD *)v4 + 8) = &v12[32 * v11];
        if (v14)
          operator delete(v14);
      }
      else
      {
        *(_DWORD *)v6 = -1;
        *((_OWORD *)v6 + 1) = *(_OWORD *)((char *)v19 + 12);
        *(_OWORD *)(v6 + 4) = v19[0];
        v6 += 32;
      }
      *((_QWORD *)v4 + 7) = v6;
      v5 = *((_QWORD *)v4 + 6);
      v7 = (uint64_t)&v6[-v5] >> 5;
    }
    while (v7 < a2);
  }

}

BOOL DRMeshDescriptorGetVertexAttributeFormat(uint64_t a1, unint64_t a2, _DWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a1 - 8;
  if (!a1)
    v6 = 0;
  v7 = *(_QWORD *)(v6 + 48);
  v8 = (*(_QWORD *)(v6 + 56) - v7) >> 5;
  if (v8 > a2)
  {
    v9 = v7 + 32 * a2;
    *a3 = *(_DWORD *)v9;
    v10 = *(_QWORD *)(v9 + 16);
    *a4 = *(_QWORD *)(v9 + 8);
    *a5 = v10;
    *a6 = *(_QWORD *)(v9 + 24);
  }
  return v8 > a2;
}

uint64_t DRMeshDescriptorSetVertexAttributeFormat(uint64_t result, unint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = result - 8;
  if (!result)
    v6 = 0;
  v8 = v6 + 48;
  v7 = *(_QWORD *)(v6 + 48);
  if (a2 < (*(_QWORD *)(v8 + 8) - v7) >> 5)
  {
    v9 = v7 + 32 * a2;
    *(_DWORD *)v9 = a3;
    *(_QWORD *)(v9 + 8) = a4;
    *(_QWORD *)(v9 + 16) = a5;
    *(_QWORD *)(v9 + 24) = a6;
  }
  return result;
}

unint64_t DRMeshDescriptorGetVertexLayoutCount(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(v1 + 80) - *(_QWORD *)(v1 + 72)) >> 3);
}

void DRMeshDescriptorSetVertexLayoutCount(void *a1, unint64_t a2)
{
  char *v3;
  char *v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  id v19;
  int64x2_t v20;

  v3 = a1;
  v19 = v3;
  if (v3)
    v4 = v3 - 8;
  else
    v4 = 0;
  v5 = *((_QWORD *)v4 + 9);
  v6 = (char *)*((_QWORD *)v4 + 10);
  v7 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v6[-v5] >> 3);
  if (v7 < a2)
  {
    v8 = v4 + 88;
    v20 = vdupq_n_s64(1uLL);
    do
    {
      if ((unint64_t)v6 >= *v8)
      {
        if (v7 + 1 > 0x666666666666666)
          abort();
        v9 = 0xCCCCCCCCCCCCCCCDLL * ((*v8 - v5) >> 3);
        v10 = 2 * v9;
        if (2 * v9 <= v7 + 1)
          v10 = v7 + 1;
        if (v9 >= 0x333333333333333)
          v11 = 0x666666666666666;
        else
          v11 = v10;
        if (v11)
          v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DirectMeshVertexLayout>>((uint64_t)(v4 + 88), v11);
        else
          v12 = 0;
        v13 = &v12[40 * v7];
        *(_QWORD *)v13 = 0;
        *((_QWORD *)v13 + 1) = 0;
        *((_QWORD *)v13 + 2) = 0;
        *(int64x2_t *)(v13 + 24) = vdupq_n_s64(1uLL);
        v15 = (char *)*((_QWORD *)v4 + 9);
        v14 = (char *)*((_QWORD *)v4 + 10);
        v16 = v13;
        if (v14 != v15)
        {
          do
          {
            v17 = *(_OWORD *)(v14 - 40);
            v18 = *(_OWORD *)(v14 - 24);
            *((_QWORD *)v16 - 1) = *((_QWORD *)v14 - 1);
            *(_OWORD *)(v16 - 24) = v18;
            *(_OWORD *)(v16 - 40) = v17;
            v16 -= 40;
            v14 -= 40;
          }
          while (v14 != v15);
          v14 = (char *)*((_QWORD *)v4 + 9);
        }
        v6 = v13 + 40;
        *((_QWORD *)v4 + 9) = v16;
        *((_QWORD *)v4 + 10) = v13 + 40;
        *((_QWORD *)v4 + 11) = &v12[40 * v11];
        if (v14)
          operator delete(v14);
      }
      else
      {
        *(_QWORD *)v6 = 0;
        *((_QWORD *)v6 + 1) = 0;
        *((_QWORD *)v6 + 2) = 0;
        *(int64x2_t *)(v6 + 24) = v20;
        v6 += 40;
      }
      *((_QWORD *)v4 + 10) = v6;
      v5 = *((_QWORD *)v4 + 9);
      v7 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v6[-v5] >> 3);
    }
    while (v7 < a2);
  }

}

BOOL DRMeshDescriptorGetVertexLayout(uint64_t a1, unint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;

  v5 = a1 - 8;
  if (!a1)
    v5 = 0;
  v6 = *(_QWORD *)(v5 + 72);
  v7 = 0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(v5 + 80) - v6) >> 3);
  if (v7 > a2)
  {
    v8 = (_QWORD *)(v6 + 40 * a2);
    *a3 = *v8;
    *a4 = v8[1];
    *a5 = v8[2];
  }
  return v7 > a2;
}

uint64_t DRMeshDescriptorSetVertexLayout(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = result - 8;
  if (!result)
    v5 = 0;
  v7 = v5 + 72;
  v6 = *(_QWORD *)(v5 + 72);
  if (0xCCCCCCCCCCCCCCCDLL * ((*(_QWORD *)(v7 + 8) - v6) >> 3) > a2)
  {
    v8 = (_QWORD *)(v6 + 40 * a2);
    *v8 = a3;
    v8[1] = a4;
    v8[2] = a5;
  }
  return result;
}

uint64_t DRMeshCreateUnmanaged(uint64_t a1, void *a2, CFErrorRef *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *userInfoKeys;
  void *userInfoValues;
  uint64_t v12;
  id v13;
  char v14;

  v5 = a2;
  v13 = v5;
  v14 = 0;
  v6 = a1 - 8;
  if (!a1)
    v6 = 0;
  re::DirectMesh::create((_OWORD *)(v6 + 16), &v13, &v12);
  v7 = v12;
  if (a3 && !v12)
  {
    userInfoValues = (void *)CFStringCreateWithCString(0, "Direct Mesh Validation Failed", 0x8000100u);
    userInfoKeys = (void *)*MEMORY[0x24BDBD378];
    *a3 = CFErrorCreateWithUserInfoKeysAndValues(0, CFSTR("DRMeshErrorDomain"), 100, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(userInfoValues);
    v7 = v12;
  }
  if (v7)
    v8 = v7 + 8;
  else
    v8 = 0;

  return v8;
}

char *DRMeshCopyDescriptor(void *a1)
{
  char *v1;
  char *v2;
  char *v3;
  uint64_t v4;
  char *v5;
  __int128 v6;
  _BYTE *v7;
  _BYTE *v8;
  size_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  _BYTE *v15;
  size_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void **v22;
  _BYTE *v23;
  char *v24;
  void *v25;
  char *v26;

  v1 = a1;
  v2 = (char *)operator new(0x60uLL);
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 2) = 0u;
  *((_OWORD *)v2 + 4) = 0u;
  *((_OWORD *)v2 + 5) = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v3 = v2 + 16;
  *((_OWORD *)v2 + 3) = 0u;
  ArcSharedObject::ArcSharedObject((ArcSharedObject *)v2, 0);
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *((_OWORD *)v2 + 3) = 0u;
  *(_QWORD *)v4 = &off_250B65898;
  if (v1)
    v5 = v1 - 8;
  else
    v5 = 0;
  v6 = *((_OWORD *)v5 + 3);
  *(_OWORD *)(v4 + 32) = *((_OWORD *)v5 + 4);
  *(_OWORD *)v3 = v6;
  if (v3 != v5 + 48)
  {
    v8 = (_BYTE *)*((_QWORD *)v5 + 10);
    v7 = (_BYTE *)*((_QWORD *)v5 + 11);
    v9 = v7 - v8;
    v10 = (v7 - v8) >> 5;
    if (v7 == v8)
    {
      v11 = 0;
    }
    else
    {
      if ((v9 & 0x8000000000000000) != 0)
        goto LABEL_29;
      std::vector<re::DirectMeshVertexAttribute>::__vallocate[abi:nn180100]((_QWORD *)v2 + 6, (v7 - v8) >> 5);
      v11 = (char *)*((_QWORD *)v2 + 7);
      memmove(v11, v8, v9);
    }
    v12 = &v11[32 * v10];
    v13 = (char *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 7) = v12;
    v14 = (char *)*((_QWORD *)v5 + 13);
    v15 = (_BYTE *)*((_QWORD *)v5 + 14);
    v16 = v15 - v14;
    v17 = 0xCCCCCCCCCCCCCCCDLL * ((v15 - v14) >> 3);
    v18 = *((_QWORD *)v2 + 11);
    if (0xCCCCCCCCCCCCCCCDLL * ((v18 - (uint64_t)v13) >> 3) >= v17)
    {
      v22 = (void **)(v2 + 80);
      v23 = (_BYTE *)*((_QWORD *)v2 + 10);
      if (0xCCCCCCCCCCCCCCCDLL * ((v23 - v13) >> 3) < v17)
      {
        v24 = &v14[8 * ((v23 - v13) >> 3)];
        if (v23 != v13)
        {
          memmove(v13, v14, v23 - v13);
          v13 = (char *)*v22;
        }
        v16 = v15 - v24;
        if (v15 == v24)
          goto LABEL_27;
        v25 = v13;
        v26 = v24;
        goto LABEL_26;
      }
LABEL_24:
      if (v15 == v14)
      {
LABEL_27:
        *v22 = &v13[v16];
        goto LABEL_28;
      }
      v25 = v13;
      v26 = v14;
LABEL_26:
      memmove(v25, v26, v16);
      goto LABEL_27;
    }
    if (v13)
    {
      *((_QWORD *)v2 + 10) = v13;
      operator delete(v13);
      v18 = 0;
      *((_QWORD *)v2 + 9) = 0;
      *((_QWORD *)v2 + 10) = 0;
      *((_QWORD *)v2 + 11) = 0;
    }
    if (v17 <= 0x666666666666666)
    {
      v19 = 0xCCCCCCCCCCCCCCCDLL * (v18 >> 3);
      v20 = 2 * v19;
      if (2 * v19 <= v17)
        v20 = 0xCCCCCCCCCCCCCCCDLL * ((v15 - v14) >> 3);
      if (v19 >= 0x333333333333333)
        v21 = 0x666666666666666;
      else
        v21 = v20;
      std::vector<re::DirectMeshVertexLayout>::__vallocate[abi:nn180100]((_QWORD *)v2 + 9, v21);
      v22 = (void **)(v2 + 80);
      v13 = (char *)*((_QWORD *)v2 + 10);
      goto LABEL_24;
    }
LABEL_29:
    abort();
  }
LABEL_28:

  return v2 + 8;
}

uint64_t DRMeshGetVertexCapacity(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 72);
}

uint64_t DRMeshGetIndexCapacity(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 48);
}

unint64_t DRMeshGetPartCount(uint64_t a1)
{
  re::DirectMemoryResource **v1;
  id v2;
  uint64_t v3;

  if (a1)
    v1 = (re::DirectMemoryResource **)(a1 - 8);
  else
    v1 = 0;
  v2 = re::DirectMesh::parts(v1);
  return 0xAAAAAAAAAAAAAAABLL * ((v3 - (uint64_t)v2) >> 5);
}

uint64_t DRMeshSetPartCount(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if ((a2 & 0x8000000000000000) == 0)
      return re::DirectMesh::setPartCount(result - 8, a2);
  }
  return result;
}

void DRMeshSetPartAt(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, __n128 a7, __n128 a8)
{
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD v19[4];
  __n128 v20;
  __n128 v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v13 = a1;
  v14 = v13;
  if (v13)
  {
    if ((a2 & 0x8000000000000000) == 0)
    {
      v15 = re::DirectMesh::parts((re::DirectMemoryResource **)v13 - 1);
      if (0xAAAAAAAAAAAAAAABLL * ((v16 - (uint64_t)v15) >> 5) > a2)
      {
        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __DRMeshSetPartAt_block_invoke;
        v19[3] = &__block_descriptor_104_e34_v24__0__DirectMeshPart_QQQQQQ_8Q16l;
        v22 = a2;
        v23 = a3;
        v24 = a4;
        v25 = a5;
        v26 = a6;
        v20 = a7;
        v21 = a8;
        re::DirectMesh::updateParts((uint64_t)v14 - 8, (uint64_t)v19);
      }
    }
  }

}

uint64_t DRMeshGetPartAt(void *a1, unint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _OWORD *a7, _OWORD *a8)
{
  re::DirectMemoryResource **v15;
  re::DirectMemoryResource **v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;

  v15 = a1;
  v16 = v15;
  v17 = 0;
  if (v15 && (a2 & 0x8000000000000000) == 0)
  {
    v18 = re::DirectMesh::parts(v15 - 1);
    if (0xAAAAAAAAAAAAAAABLL * ((v19 - (uint64_t)v18) >> 5) <= a2)
    {
      v17 = 0;
    }
    else
    {
      v20 = (char *)re::DirectMesh::parts(v16 - 1) + 96 * a2;
      v21 = *((_QWORD *)v20 + 1);
      v22 = *((_QWORD *)v20 + 2);
      v23 = *((_QWORD *)v20 + 3);
      v24 = *((_OWORD *)v20 + 3);
      v25 = *((_OWORD *)v20 + 4);
      *a3 = *(_QWORD *)v20;
      *a4 = v21;
      *a5 = v22;
      *a6 = v23;
      *a7 = v24;
      *a8 = v25;
      v17 = 1;
    }
  }

  return v17;
}

uint64_t DRMeshGetPartRenderFlagsAt(void *a1, unint64_t a2)
{
  re::DirectMemoryResource **v3;
  re::DirectMemoryResource **v4;
  uint64_t v5;
  id v6;
  uint64_t v7;

  v3 = a1;
  v4 = v3;
  v5 = 0;
  if (v3 && (a2 & 0x8000000000000000) == 0)
  {
    v6 = re::DirectMesh::parts(v3 - 1);
    if (0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)v6) >> 5) <= a2)
      v5 = 0;
    else
      v5 = *((_QWORD *)re::DirectMesh::parts(v4 - 1) + 12 * a2 + 10);
  }

  return v5;
}

void DRMeshSetPartRenderFlagsAt(void *a1, unint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[6];

  v5 = a1;
  v6 = v5;
  if (v5)
  {
    if ((a2 & 0x8000000000000000) == 0)
    {
      v7 = re::DirectMesh::parts((re::DirectMemoryResource **)v5 - 1);
      if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)v7) >> 5) > a2)
      {
        v9[0] = MEMORY[0x24BDAC760];
        v9[1] = 3221225472;
        v9[2] = __DRMeshSetPartRenderFlagsAt_block_invoke;
        v9[3] = &__block_descriptor_48_e34_v24__0__DirectMeshPart_QQQQQQ_8Q16l;
        v9[4] = a2;
        v9[5] = a3;
        re::DirectMesh::updateParts((uint64_t)v6 - 8, (uint64_t)v9);
      }
    }
  }

}

unint64_t DRMeshDescriptorCalculateBufferSizes(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  unint64_t result;
  unint64_t v9;
  uint64_t v10;
  _OWORD v11[2];
  uint64_t v12;
  _OWORD v13[2];
  uint64_t v14;

  v7 = a1 - 8;
  if (!a1)
    v7 = 0;
  result = re::calculateBufferSizes((unint64_t *)(v7 + 16), (uint64_t)v11);
  v13[0] = v11[0];
  v13[1] = v11[1];
  v14 = v12;
  *a2 = *(_QWORD *)&v11[0];
  if (a4)
  {
    v9 = 0;
    do
    {
      if (v9 > 3)
        v10 = 0;
      else
        v10 = *((_QWORD *)v13 + v9 + 1);
      *(_QWORD *)(a3 + 8 * v9++) = v10;
    }
    while (a4 != v9);
  }
  return result;
}

void DRMeshReadVertices(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if (a1)
    v6 = a1 - 8;
  else
    v6 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __DRMeshReadVertices_block_invoke;
  v8[3] = &unk_250B65840;
  v9 = v5;
  v7 = v5;
  re::DirectMesh::readBuffer(v6, a2, (uint64_t)v8);

}

void DRMeshReplaceVertices(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if (a1)
    v6 = a1 - 8;
  else
    v6 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __DRMeshReplaceVertices_block_invoke;
  v8[3] = &unk_250B65868;
  v9 = v5;
  v7 = v5;
  re::DirectMesh::replaceBuffer(v6, a2, (uint64_t)v8);

}

void DRMeshUpdateVertices(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if (a1)
    v6 = a1 - 8;
  else
    v6 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __DRMeshUpdateVertices_block_invoke;
  v8[3] = &unk_250B65868;
  v9 = v5;
  v7 = v5;
  re::DirectMesh::updateBuffer(v6, a2, (uint64_t)v8);

}

void DRMeshReadIndices(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (a1)
    v4 = a1 - 8;
  else
    v4 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __DRMeshReadIndices_block_invoke;
  v6[3] = &unk_250B65840;
  v7 = v3;
  v5 = v3;
  re::DirectMesh::readIndices(v4, (uint64_t)v6);

}

void DRMeshReplaceIndices(uint64_t a1, void *a2)
{
  id v3;
  re::DirectMemoryResource **v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (a1)
    v4 = (re::DirectMemoryResource **)(a1 - 8);
  else
    v4 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __DRMeshReplaceIndices_block_invoke;
  v6[3] = &unk_250B65868;
  v7 = v3;
  v5 = v3;
  re::DirectMesh::replaceIndices(v4, (uint64_t)v6);

}

void DRMeshUpdateIndices(uint64_t a1, void *a2)
{
  id v3;
  re::DirectMemoryResource **v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  if (a1)
    v4 = (re::DirectMemoryResource **)(a1 - 8);
  else
    v4 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __DRMeshUpdateIndices_block_invoke;
  v6[3] = &unk_250B65868;
  v7 = v3;
  v5 = v3;
  re::DirectMesh::updateIndices(v4, (uint64_t)v6);

}

re::DirectMemoryResource *DRMeshReadVerticesUsing(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  if (a1)
    v2 = a1 - 8;
  else
    v2 = 0;
  return re::DirectMesh::readBuffer(v2, a2);
}

uint64_t DRMeshUpdateVerticesUsing(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (a1)
    v3 = a1 - 8;
  else
    v3 = 0;
  return re::DirectMesh::updateBuffer(v3, a2, a3);
}

uint64_t DRMeshReplaceVerticesUsing(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (a1)
    v3 = a1 - 8;
  else
    v3 = 0;
  return re::DirectMesh::replaceBuffer(v3, a2, a3);
}

uint64_t DRMeshReadIndicesUsing(uint64_t a1)
{
  if (a1)
    return re::DirectMesh::readIndices(a1 - 8);
  else
    return re::DirectMesh::readIndices(0);
}

uint64_t DRMeshUpdateIndicesUsing(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a1)
    v2 = a1 - 8;
  else
    v2 = 0;
  return re::DirectMesh::updateIndices(v2, a2);
}

uint64_t DRMeshReplaceIndicesUsing(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a1)
    v2 = a1 - 8;
  else
    v2 = 0;
  return re::DirectMesh::replaceIndices(v2, a2);
}

void re::DirectMeshDescriptor::~DirectMeshDescriptor(re::DirectMeshDescriptor *this)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 9);
  if (v2)
  {
    *((_QWORD *)this + 10) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 6);
  if (v3)
  {
    *((_QWORD *)this + 7) = v3;
    operator delete(v3);
  }
  ArcSharedObject::~ArcSharedObject(this);
}

{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 9);
  if (v2)
  {
    *((_QWORD *)this + 10) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 6);
  if (v3)
  {
    *((_QWORD *)this + 7) = v3;
    operator delete(v3);
  }
  ArcSharedObject::~ArcSharedObject(this);
  JUMPOUT(0x23B84F8E0);
}

char *DRFenceCreate(char *a1)
{
  char *v1;
  re::DirectFence *v2;

  if (a1)
    v1 = a1;
  else
    v1 = "";
  v2 = (re::DirectFence *)operator new(0x50uLL);
  return (char *)re::DirectFence::DirectFence(v2, v1) + 8;
}

uint64_t DRFenceInvalidate(uint64_t a1)
{
  if (a1)
    return re::DirectFence::invalidate(a1 - 8);
  else
    return re::DirectFence::invalidate(0);
}

uint64_t DRFenceGetLabel(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  result = v1 + 32;
  if (*(char *)(v1 + 55) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t DRTextureCreateUnmanaged(uint64_t a1, void *a2, CFErrorRef *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  void *userInfoKeys;
  void *userInfoValues;
  uint64_t v13;
  id v14;
  char v15;

  v5 = a2;
  v14 = v5;
  v15 = 0;
  v6 = a1 - 8;
  if (!a1)
    v6 = 0;
  re::DirectTexture::create(v6 + 16, &v14, &v13);
  v7 = v13;
  if (a3 && !v13)
  {
    v8 = (__CFString *)CFStringCreateWithCString(0, "Direct Texture Validation Failed", 0x8000100u);
    userInfoKeys = (void *)*MEMORY[0x24BDBD378];
    userInfoValues = v8;
    *a3 = CFErrorCreateWithUserInfoKeysAndValues(0, CFSTR("DirectResourceErrorDomain"), 100, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(userInfoValues);
    v7 = v13;
  }
  if (v7)
    v9 = v7 + 8;
  else
    v9 = 0;

  return v9;
}

uint64_t DRTextureDescriptorCreate()
{
  uint64_t v1;

  re::make::shared::object<re::DirectTextureDescriptor>(&v1);
  if (v1)
    return v1 + 8;
  else
    return 0;
}

uint64_t DRTextureDescriptorGetWidth(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 16);
}

uint64_t DRTextureDescriptorSetWidth(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetHeight(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 24);
}

uint64_t DRTextureDescriptorSetHeight(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetDepth(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 32);
}

uint64_t DRTextureDescriptorSetDepth(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetMipmapLevelCount(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 40);
}

uint64_t DRTextureDescriptorSetMipmapLevelCount(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetPixelFormat(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 56);
}

uint64_t DRTextureDescriptorSetPixelFormat(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetTextureType(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 64);
}

uint64_t DRTextureDescriptorSetTextureType(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 64) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetTextureUsage(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 72);
}

uint64_t DRTextureDescriptorSetTextureUsage(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 72) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetArrayLength(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 48);
}

uint64_t DRTextureDescriptorSetArrayLength(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetSwizzle(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(unsigned int *)(v1 + 80);
}

uint64_t DRTextureDescriptorSetSwizzle(uint64_t result, int a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_DWORD *)(v2 + 80) = a2;
  return result;
}

id DRTextureCopyDescriptor(void *a1)
{
  char *v1;
  uint64_t v2;
  char *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;

  v1 = a1;
  re::make::shared::object<re::DirectTextureDescriptor>(&v11);
  v2 = v11;
  v3 = v1 - 8;
  if (!v1)
    v3 = 0;
  *(_OWORD *)(v11 + 16) = *((_OWORD *)v3 + 3);
  v5 = *((_OWORD *)v3 + 5);
  v4 = *((_OWORD *)v3 + 6);
  v6 = *((_OWORD *)v3 + 4);
  *(_DWORD *)(v2 + 80) = *((_DWORD *)v3 + 28);
  *(_OWORD *)(v2 + 48) = v5;
  *(_OWORD *)(v2 + 64) = v4;
  *(_OWORD *)(v2 + 32) = v6;

  v7 = (void *)(v2 + 8);
  if (v2)
    v8 = (void *)(v2 + 8);
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

id DRTextureReadTexture(uint64_t a1)
{
  re::DirectMemoryResource **v1;
  id v2;
  void *v3;
  id v5;

  if (a1)
    v1 = (re::DirectMemoryResource **)(a1 - 8);
  else
    v1 = 0;
  re::DirectTexture::readTexture(v1, &v5);
  v2 = v5;
  v3 = v2;
  if (v2)

  return v3;
}

id DRTextureReplaceTexture(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v6;

  if (a1)
    v2 = a1 - 8;
  else
    v2 = 0;
  re::DirectTexture::replaceTexture(v2, a2, &v6);
  v3 = v6;
  v4 = v3;
  if (v3)

  return v4;
}

double re::make::shared::object<re::DirectTextureDescriptor>(_QWORD *a1)
{
  _OWORD *v2;
  int64x2_t v3;
  uint64_t v4;
  double result;

  v2 = operator new(0x58uLL);
  *v2 = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  *((_QWORD *)v2 + 10) = 0;
  ArcSharedObject::ArcSharedObject((ArcSharedObject *)v2, 0);
  v3 = vdupq_n_s64(1uLL);
  *(int64x2_t *)(v4 + 16) = v3;
  *(int64x2_t *)(v4 + 32) = v3;
  *(_OWORD *)(v4 + 48) = xmmword_23A4F97E0;
  *(_OWORD *)(v4 + 64) = xmmword_23A4F97F0;
  *(_QWORD *)&result = 84148994;
  *(_DWORD *)(v4 + 80) = 84148994;
  *(_QWORD *)v4 = &off_250B658D8;
  *a1 = v4;
  return result;
}

void re::DirectTextureDescriptor::~DirectTextureDescriptor(re::DirectTextureDescriptor *this)
{
  ArcSharedObject::~ArcSharedObject(this);
  JUMPOUT(0x23B84F8E0);
}

uint64_t DRContextConfigCreate()
{
  ArcSharedObject *v0;
  uint64_t v1;

  v0 = (ArcSharedObject *)operator new(0x40uLL);
  *(_OWORD *)v0 = 0u;
  *((_OWORD *)v0 + 1) = 0u;
  *((_OWORD *)v0 + 2) = 0u;
  *((_OWORD *)v0 + 3) = 0u;
  ArcSharedObject::ArcSharedObject(v0, 0);
  *(_QWORD *)(v1 + 16) = 0;
  *(_OWORD *)(v1 + 24) = xmmword_23A4F97F0;
  *(_OWORD *)(v1 + 40) = xmmword_23A4F9A70;
  *(_QWORD *)(v1 + 56) = 0;
  *(_QWORD *)v1 = &off_250B65960;
  return v1 + 8;
}

void DRContextConfigSetDispatchQueue(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = a1 - 8;
  if (!a1)
    v2 = 0;
  objc_storeStrong((id *)(v2 + 16), a2);
}

uint64_t DRContextConfigSetMode(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t DRContextConfigGetMode(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 24);
}

uint64_t DRContextConfigSetReuseStrategy(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t DRContextConfigSetMaxPendingFrames(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t DRContextConfigSetUnusedResourceMaxAge(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

void DRContextConfigSetDevice(void *a1, void *a2)
{
  char *v3;
  id v4;
  id v5;
  char *v6;
  id v7;
  id v8;

  v8 = a2;
  v3 = a1;
  v4 = v8;
  v5 = v8;
  if (v3)
    v6 = v3 - 8;
  else
    v6 = 0;
  v7 = (id)*((_QWORD *)v6 + 7);
  if (v7 == v8)
  {

  }
  else
  {
    if (v7)
    {

      v5 = v8;
    }
    *((_QWORD *)v6 + 7) = v5;
  }

}

char *DRContextCreate(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  id v4;
  __int128 v5;
  __int128 v6;
  id v7;

  if (a1)
    v1 = a1 - 8;
  else
    v1 = 0;
  v2 = (char *)operator new(0x150uLL);
  v4 = *(id *)(v1 + 16);
  v5 = *(_OWORD *)(v1 + 24);
  v6 = *(_OWORD *)(v1 + 40);
  v7 = *(id *)(v1 + 56);
  re::DirectResourceContext::DirectResourceContext(v2, &v4);
  if (v7)
  {

    v7 = 0;
  }

  return v2 + 8;
}

uint64_t DRContextCreateMesh(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  void *userInfoKeys;
  void *userInfoValues;
  uint64_t v11;

  if (a1)
    v4 = a1 - 8;
  else
    v4 = 0;
  v5 = a2 - 8;
  if (!a2)
    v5 = 0;
  re::DirectResourceContext::createMesh(v4, (_OWORD *)(v5 + 16), &v11);
  v6 = v11;
  if (a3 && !v11)
  {
    v7 = (__CFString *)CFStringCreateWithCString(0, "Direct Mesh Validation Failed", 0x8000100u);
    userInfoKeys = (void *)*MEMORY[0x24BDBD378];
    userInfoValues = v7;
    *a3 = CFErrorCreateWithUserInfoKeysAndValues(0, CFSTR("DirectResourceErrorDomain"), 100, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(userInfoValues);
    v6 = v11;
  }
  if (v6)
    return v6 + 8;
  else
    return 0;
}

uint64_t DRContextCreateTexture(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  void *userInfoKeys;
  void *userInfoValues;
  uint64_t v11;

  if (a1)
    v4 = a1 - 8;
  else
    v4 = 0;
  v5 = a2 - 8;
  if (!a2)
    v5 = 0;
  re::DirectResourceContext::createTexture(v4, v5 + 16, &v11);
  v6 = v11;
  if (a3 && !v11)
  {
    v7 = (__CFString *)CFStringCreateWithCString(0, "Direct Texture Validation Failed", 0x8000100u);
    userInfoKeys = (void *)*MEMORY[0x24BDBD378];
    userInfoValues = v7;
    *a3 = CFErrorCreateWithUserInfoKeysAndValues(0, CFSTR("DirectResourceErrorDomain"), 100, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(userInfoValues);
    v6 = v11;
  }
  if (v6)
    return v6 + 8;
  else
    return 0;
}

uint64_t DRContextCreateBuffer(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  void *userInfoKeys;
  void *userInfoValues;
  uint64_t v11;

  if (a1)
    v4 = a1 - 8;
  else
    v4 = 0;
  v5 = a2 - 8;
  if (!a2)
    v5 = 0;
  re::DirectResourceContext::createBuffer(v4, (_QWORD *)(v5 + 16), &v11);
  v6 = v11;
  if (a3 && !v11)
  {
    v7 = (__CFString *)CFStringCreateWithCString(0, "Direct Texture Validation Failed", 0x8000100u);
    userInfoKeys = (void *)*MEMORY[0x24BDBD378];
    userInfoValues = v7;
    *a3 = CFErrorCreateWithUserInfoKeysAndValues(0, CFSTR("DirectResourceErrorDomain"), 100, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(userInfoValues);
    v6 = v11;
  }
  if (v6)
    return v6 + 8;
  else
    return 0;
}

BOOL DRContextHasOpenCommit(char *a1)
{
  char *v1;
  NSObject *v2;
  char *v3;
  uint64_t v4;

  if (a1)
    v1 = a1 - 8;
  else
    v1 = 0;
  v2 = *((_QWORD *)v1 + 3);
  v3 = a1;
  dispatch_assert_queue_V2(v2);
  v4 = *((_QWORD *)v1 + 21);

  return v4 != 0;
}

void DRContextCommit(char *a1)
{
  re::DirectResourceContext *v1;
  NSObject *v2;
  char *v3;

  if (a1)
    v1 = (re::DirectResourceContext *)(a1 - 8);
  else
    v1 = 0;
  v2 = *((_QWORD *)v1 + 3);
  v3 = a1;
  dispatch_assert_queue_V2(v2);
  re::DirectResourceContext::commit(v1);

}

BOOL DRContextSetCommitUserPayload(char *a1, void *a2)
{
  id v3;
  char *v4;
  NSObject *v5;
  char *v6;
  re::DirectResourcesPendingCommit *v7;
  void *v9;

  v3 = a2;
  if (a1)
    v4 = a1 - 8;
  else
    v4 = 0;
  v5 = *((_QWORD *)v4 + 3);
  v6 = a1;
  dispatch_assert_queue_V2(v5);
  v7 = (re::DirectResourcesPendingCommit *)*((_QWORD *)v4 + 21);

  if (v7)
  {
    re::XPCObject::retain(v3, &v9);
    re::DirectResourcesPendingCommit::setUserPayload(v7, &v9);
    re::XPCObject::~XPCObject(&v9);
  }

  return v7 != 0;
}

id DRContextGetCommitUserPayload(char *a1)
{
  char *v1;
  NSObject *v2;
  char *v3;
  uint64_t v4;
  id v5;

  if (a1)
    v1 = a1 - 8;
  else
    v1 = 0;
  v2 = *((_QWORD *)v1 + 3);
  v3 = a1;
  dispatch_assert_queue_V2(v2);
  v4 = *((_QWORD *)v1 + 21);

  if (v4)
    v5 = *(id *)(*(_QWORD *)(v4 + 24) + 24);
  else
    v5 = 0;
  return v5;
}

BOOL DRContextCommitAddFence(char *a1, void *a2)
{
  id v3;
  char *v4;
  NSObject *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2;
  if (a1)
    v4 = a1 - 8;
  else
    v4 = 0;
  v5 = *((_QWORD *)v4 + 3);
  v6 = a1;
  dispatch_assert_queue_V2(v5);
  v7 = *((_QWORD *)v4 + 21);

  if (v7)
  {
    if (v3)
      v8 = (uint64_t)v3 - 8;
    else
      v8 = 0;
    re::DirectResourcesPendingCommit::addFence(v7, v8);
  }

  return v7 != 0;
}

void DRContextSetOnCommitBegan(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[3];
  _QWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
    v4 = (uint64_t)a1 - 8;
  else
    v4 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __DRContextSetOnCommitBegan_block_invoke;
  v14[3] = &unk_250B65868;
  v5 = v3;
  v15 = v5;
  v16[0] = &off_250B65998;
  v6 = a1;
  v16[1] = _Block_copy(v14);
  v17 = v16;
  re::DirectResourceContext::setBeginCallback(v4, (uint64_t)v16);

  v12 = v17;
  if (v17 == v16)
  {
    v13 = 4;
    v12 = v16;
    goto LABEL_8;
  }
  if (v17)
  {
    v13 = 5;
LABEL_8:
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*v12 + 8 * v13))(v12, v7, v8, v9, v10, v11);
  }

}

id re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(uint64_t a1)
{
  if (a1)
    return (id)(a1 + 8);
  else
    return 0;
}

void DRContextSetOnCommitComplete(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[3];
  _QWORD *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
    v4 = (uint64_t)a1 - 8;
  else
    v4 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __DRContextSetOnCommitComplete_block_invoke;
  v14[3] = &unk_250B65908;
  v5 = v3;
  v15 = v5;
  v16[0] = &off_250B659E0;
  v6 = a1;
  v16[1] = _Block_copy(v14);
  v17 = v16;
  re::DirectResourceContext::setCompleteCallback(v4, (uint64_t)v16);

  v12 = v17;
  if (v17 == v16)
  {
    v13 = 4;
    v12 = v16;
    goto LABEL_8;
  }
  if (v17)
  {
    v13 = 5;
LABEL_8:
    (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*v12 + 8 * v13))(v12, v7, v8, v9, v10, v11);
  }

}

void DRContextSetChangeObserver(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD aBlock[4];
  id v7;

  v3 = a2;
  if (a1)
    v4 = a1 - 8;
  else
    v4 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __DRContextSetChangeObserver_block_invoke;
  aBlock[3] = &unk_250B65930;
  v7 = v3;
  v5 = v3;
  re::DirectResourceContext::setObserver(v4, aBlock);

}

void ContextConfig::~ContextConfig(ContextConfig *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 7);
  if (v2)
  {

    *((_QWORD *)this + 7) = 0;
  }

  ArcSharedObject::~ArcSharedObject(this);
}

{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 7);
  if (v2)
  {

    *((_QWORD *)this + 7) = 0;
  }

  ArcSharedObject::~ArcSharedObject(this);
  JUMPOUT(0x23B84F8E0);
}

uint64_t std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long)>,void ()(re::DirectResourceContext *,unsigned long long)>::~__func(uint64_t a1)
{

  return a1;
}

void std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long)>,void ()(re::DirectResourceContext *,unsigned long long)>::~__func(uint64_t a1)
{

  JUMPOUT(0x23B84F8E0);
}

uint64_t std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long)>,void ()(re::DirectResourceContext *,unsigned long long)>::__clone()
{
  return 0;
}

void *std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long)>,void ()(re::DirectResourceContext *,unsigned long long)>::__clone(uint64_t a1, _QWORD *a2)
{
  void *result;

  *a2 = &off_250B65998;
  result = _Block_copy(*(const void **)(a1 + 8));
  a2[1] = result;
  return result;
}

void std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long)>,void ()(re::DirectResourceContext *,unsigned long long)>::destroy(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;

}

uint64_t std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long)>,void ()(re::DirectResourceContext *,unsigned long long)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

uint64_t std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *)>,void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::~__func(uint64_t a1)
{

  return a1;
}

void std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *)>,void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::~__func(uint64_t a1)
{

  JUMPOUT(0x23B84F8E0);
}

uint64_t std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *)>,void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::__clone()
{
  return 0;
}

void *std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *)>,void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::__clone(uint64_t a1, _QWORD *a2)
{
  void *result;

  *a2 = &off_250B659E0;
  result = _Block_copy(*(const void **)(a1 + 8));
  a2[1] = result;
  return result;
}

void std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *)>,void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::destroy(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;

}

uint64_t std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *)>,void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

void DRResourceGetIdentifier(uint64_t a1, uuid_t dst)
{
  uint64_t v2;

  v2 = a1 - 8;
  if (!a1)
    v2 = 0;
  uuid_copy(dst, (const unsigned __int8 *)(v2 + 16));
}

uint64_t DRResourceGetClientIdentifier(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 32);
}

id DRResourceAsMesh(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  v2 = v1;
  if (v1 && (*(unsigned int (**)(uint64_t))(*((_QWORD *)v1 - 1) + 40))((uint64_t)v1 - 8) == 1)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id DRMeshAsResource(uint64_t a1)
{
  uint64_t v1;

  if (a1)
    v1 = a1 - 8;
  else
    v1 = 0;
  re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(v1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id DRResourceAsTexture(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  v2 = v1;
  if (v1 && (*(unsigned int (**)(uint64_t))(*((_QWORD *)v1 - 1) + 40))((uint64_t)v1 - 8) == 2)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id DRTextureAsResource(uint64_t a1)
{
  if (a1)
    return re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(a1 - 8);
  else
    return re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(0);
}

id DRResourceAsBuffer(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  v2 = v1;
  if (v1 && (*(unsigned int (**)(uint64_t))(*((_QWORD *)v1 - 1) + 40))((uint64_t)v1 - 8) == 3)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id DRBufferAsResource(uint64_t a1)
{
  if (a1)
    return re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(a1 - 8);
  else
    return re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(0);
}

id DRResourceAsMaterial(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  v2 = v1;
  if (v1 && (*(unsigned int (**)(uint64_t))(*((_QWORD *)v1 - 1) + 40))((uint64_t)v1 - 8) == 4)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

id DRMaterialAsResource(uint64_t a1)
{
  if (a1)
    return re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(a1 - 8);
  else
    return re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(0);
}

uint64_t DRResourceIsAttachedToDevice_RemoveMeAfterVerification(uint64_t a1)
{
  if (a1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 - 8) + 80))(a1 - 8);
  else
    return (*(uint64_t (**)(_QWORD))(MEMORY[0] + 80))(0);
}

uint64_t DRBufferDescriptorCreate()
{
  ArcSharedObject *v0;
  uint64_t v1;

  v0 = (ArcSharedObject *)operator new(0x20uLL);
  *(_OWORD *)v0 = 0u;
  *((_OWORD *)v0 + 1) = 0u;
  ArcSharedObject::ArcSharedObject(v0, 0);
  *(_OWORD *)(v1 + 16) = xmmword_23A4F9800;
  *(_QWORD *)v1 = &off_250B65A28;
  return v1 + 8;
}

uint64_t DRBufferDescriptorGetCapacity(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 16);
}

uint64_t DRBufferDescriptorSetCapacity(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t DRBufferDescriptorGetSizeMultiple(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 24);
}

uint64_t DRBufferDescriptorSetSizeMultiple(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t DRBufferCreateUnmanaged(uint64_t a1, void *a2, CFErrorRef *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  void *userInfoKeys;
  void *userInfoValues;
  uint64_t v13;
  id v14;
  char v15;

  v5 = a2;
  v14 = v5;
  v15 = 0;
  v6 = a1 - 8;
  if (!a1)
    v6 = 0;
  re::DirectBuffer::create((_QWORD *)(v6 + 16), &v14, &v13);
  v7 = v13;
  if (a3 && !v13)
  {
    v8 = (__CFString *)CFStringCreateWithCString(0, "Buffer Validation Failed", 0x8000100u);
    userInfoKeys = (void *)*MEMORY[0x24BDBD378];
    userInfoValues = v8;
    *a3 = CFErrorCreateWithUserInfoKeysAndValues(0, CFSTR("DirectResourceErrorDomain"), 100, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(userInfoValues);
    v7 = v13;
  }
  if (v7)
    v9 = v7 + 8;
  else
    v9 = 0;

  return v9;
}

char *DRBufferCopyDescriptor(void *a1)
{
  char *v1;
  ArcSharedObject *v2;
  uint64_t v3;
  char *v4;

  v1 = a1;
  v2 = (ArcSharedObject *)operator new(0x20uLL);
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  ArcSharedObject::ArcSharedObject(v2, 0);
  *(_QWORD *)v3 = &off_250B65A28;
  v4 = v1 - 8;
  if (!v1)
    v4 = 0;
  *(_OWORD *)(v3 + 16) = *((_OWORD *)v4 + 3);

  return (char *)v2 + 8;
}

uint64_t DRBufferGetBytesUsed(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 64);
}

BOOL DRBufferSetBytesUsed(uint64_t a1, unint64_t a2)
{
  re::DirectBuffer *v2;

  if (a1)
    v2 = (re::DirectBuffer *)(a1 - 8);
  else
    v2 = 0;
  return re::DirectBuffer::setBytesUsed(v2, a2);
}

uint64_t DRBufferRead(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a1)
    v2 = a1 - 8;
  else
    v2 = 0;
  return re::DirectBuffer::read(v2, a2);
}

uint64_t DRBufferReplace(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a1)
    v2 = a1 - 8;
  else
    v2 = 0;
  return re::DirectBuffer::replace(v2, a2);
}

uint64_t DRBufferUpdate(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a1)
    v2 = a1 - 8;
  else
    v2 = 0;
  return re::DirectBuffer::update(v2, a2);
}

id DRBufferReadUsing(uint64_t a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  id v5;

  if (a1)
    v1 = a1 - 8;
  else
    v1 = 0;
  re::DirectBuffer::read(v1, &v5);
  v2 = v5;
  v3 = v2;
  if (v2)

  return v3;
}

id DRBufferReplaceUsing(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v6;

  if (a1)
    v2 = a1 - 8;
  else
    v2 = 0;
  re::DirectBuffer::replace(v2, a2, &v6);
  v3 = v6;
  v4 = v3;
  if (v3)

  return v4;
}

void re::DirectBufferDescriptor::~DirectBufferDescriptor(re::DirectBufferDescriptor *this)
{
  ArcSharedObject::~ArcSharedObject(this);
  JUMPOUT(0x23B84F8E0);
}

uint64_t DRMemoryResourceCreate(re::MemoryMappedRegion *a1, re::DirectMemoryResource *a2, void *a3)
{
  uint64_t v4;

  re::DirectMemoryResource::create(a1, a2, a3, &v4);
  if (v4)
    return v4 + 8;
  else
    return 0;
}

uint64_t DRMemoryResourceCopyBuffer(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  if (a1)
    v1 = a1 - 8;
  else
    v1 = 0;
  re::DirectMemoryResource::makeBuffer(v1);
  return v3;
}

uint64_t DRMemoryResourceCopyToXPC(uint64_t a1, const re::DirectMemoryResource *a2)
{
  re *v2;

  if (a1)
    v2 = (re *)(a1 - 8);
  else
    v2 = 0;
  re::xpc_object_create(v2, a2);
  return objc_claimAutoreleasedReturnValue();
}

char *DRMemoryResourceCreateFromXPC(void *a1)
{
  re::DirectMemoryResource *v2;

  v2 = 0;
  if (re::xpc_get_value(a1, &v2))
  {
    if (v2)
      return (char *)v2 + 8;
    else
      return 0;
  }
  else
  {
    if (v2)

    return 0;
  }
}

BOOL DRMemoryResourceIsPrivateToProcess(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return re::isPrivateToThisProcess(*(_DWORD *)(v1 + 32));
}

uint64_t DRMemoryResourceGetLength(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 40);
}

id DRMemoryResourceGetBytes(uint64_t a1)
{
  if (a1)
    return re::DirectMemoryResource::bytes((re::DirectMemoryResource *)(a1 - 8));
  else
    return re::DirectMemoryResource::bytes(0);
}

void DRMemoryResourceDidUpdateBytes(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  v2 = *(id *)(v1 + 80);
  if (v2)

}

_QWORD *DRClientConnectionConfigCreate()
{
  ArcSharedObject *v0;
  _QWORD *v1;

  v0 = (ArcSharedObject *)operator new(0x20uLL);
  *(_OWORD *)v0 = 0u;
  *((_OWORD *)v0 + 1) = 0u;
  ArcSharedObject::ArcSharedObject(v0, 0);
  *v1 = &off_250B65A60;
  v1[2] = 0;
  v1[3] = 0;
  return v1 + 1;
}

uint64_t DRClientConnectionConfigSetUserData(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = result - 8;
  if (!result)
    v2 = 0;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

void DRClientConnectionConfigSetServiceQueue(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = a1 - 8;
  if (!a1)
    v2 = 0;
  objc_storeStrong((id *)(v2 + 24), a2);
}

char *DRContextCreateClient(void *a1, void *a2)
{
  char *v3;
  char *v4;
  void *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
    v6 = v3 - 8;
  else
    v6 = 0;
  if (v4)
    v7 = v4 - 8;
  else
    v7 = 0;
  v8 = (char *)operator new(0x20uLL);
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  v9 = (uint64_t *)(v8 + 16);
  ArcSharedObject::ArcSharedObject((ArcSharedObject *)v8, 0);
  *v10 = &off_250B65A98;
  v10[3] = 0;
  *((_QWORD *)v8 + 2) = 0;
  v11 = operator new(0x48uLL);
  v12 = re::DirectResourcesCommitQueue::DirectResourcesCommitQueue(v11, v6);
  v13 = *((_QWORD *)v8 + 3);
  *((_QWORD *)v8 + 3) = v12;
  if (v13)

  v14 = *((_QWORD *)v7 + 2);
  v15 = *((_QWORD *)v7 + 3);
  v16 = *((_QWORD *)v6 + 8);
  v17 = operator new(0xF0uLL);
  v18 = re::DirectResourceClientReceiver::DirectResourceClientReceiver(v17, v14, v15, v16);
  v19 = *v9;
  *v9 = v18;
  if (v19)

  return v8 + 8;
}

id DRClientConnectionGetCommitQueue(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(*(_QWORD *)(v1 + 24));
}

BOOL DRClientConnectionReceive(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = a1 - 8;
  if (!a1)
    v2 = 0;
  return re::DirectResourceClientReceiver::receiveCommit(*(re::DirectResourceClientReceiver **)(v2 + 16), a2, *(re::DirectResourcesCommitQueue **)(v2 + 24));
}

id DRClientConnectionTearDown(void *a1)
{
  char *v1;
  void *v2;
  char *v3;
  uint64_t v4;
  id v5;
  ArcSharedObject *v7;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = v1 - 8;
  else
    v3 = 0;
  v4 = *((_QWORD *)v3 + 3);
  re::DirectResourceClientReceiver::destroyAll(*((re::DirectResourceClientReceiver **)v3 + 2), &v7);
  re::DirectResourcesCommitQueue::enqueueCommit_threadSafe(v4, &v7);
  if (v7)
  {

    v7 = 0;
  }
  v5 = re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(*((_QWORD *)v3 + 3));

  return v5;
}

uint64_t DRContextCreateCommitQueue(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (a1)
    v1 = a1 - 8;
  else
    v1 = 0;
  v2 = operator new(0x48uLL);
  return re::DirectResourcesCommitQueue::DirectResourcesCommitQueue(v2, v1) + 8;
}

_QWORD *DRCommitQueueEnumerate(void *a1, const void *a2)
{
  uint64_t v3;
  id v4;
  _QWORD *result;
  uint64_t v6;
  _QWORD v7[3];
  _QWORD *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (a1)
    v3 = (uint64_t)a1 - 8;
  else
    v3 = 0;
  v4 = a1;
  v7[0] = &off_250B65AD0;
  v7[1] = _Block_copy(a2);
  v8 = v7;
  re::DirectResourcesCommitQueue::enumerate(v3, (uint64_t)v7);

  result = v8;
  if (v8 == v7)
  {
    v6 = 4;
    result = v7;
  }
  else
  {
    if (!v8)
      return result;
    v6 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v6))();
}

void DRCommitQueueApplyThrough(void *a1, unint64_t a2, const void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = v5;
  if (v5)
    v7 = (uint64_t)v5 - 8;
  else
    v7 = 0;
  v10[0] = &off_250B65B18;
  v10[1] = v7;
  v10[2] = _Block_copy(a3);
  v11 = v10;
  re::DirectResourcesCommitQueue::commitThrough(v7, a2, (uint64_t)v10);
  v8 = v11;
  if (v11 == v10)
  {
    v9 = 4;
    v8 = v10;
    goto LABEL_8;
  }
  if (v11)
  {
    v9 = 5;
LABEL_8:
    (*(void (**)(void))(*v8 + 8 * v9))();
  }

}

void DRCommitQueueApplyAll(void *a1, const void *a2)
{
  DRCommitQueueApplyThrough(a1, 0xFFFFFFFFFFFFFFFFLL, a2);
}

uint64_t DRCommitQueueGetLastAppliedCommitId(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 24);
}

uint64_t DRCommitQueueGetLatestAvailableCommitId(uint64_t a1)
{
  if (a1)
    return re::DirectResourcesCommitQueue::availableCommitId_threadSafe((os_unfair_lock_s *)(a1 - 8));
  else
    return re::DirectResourcesCommitQueue::availableCommitId_threadSafe(0);
}

void DRCommitQueueTakeFrom(uint64_t a1, uint64_t a2)
{
  re::DirectResourcesCommitQueue *v2;
  re::DirectResourcesCommitQueue *v3;

  if (a1)
    v2 = (re::DirectResourcesCommitQueue *)(a1 - 8);
  else
    v2 = 0;
  if (a2)
    v3 = (re::DirectResourcesCommitQueue *)(a2 - 8);
  else
    v3 = 0;
  re::DirectResourcesCommitQueue::takeCommits_threadSafe(v2, v3);
}

void DRCommitQueueTakeThrough(uint64_t a1, uint64_t a2, unint64_t a3)
{
  re::DirectResourcesCommitQueue *v3;
  re::DirectResourcesCommitQueue *v4;

  if (a1)
    v3 = (re::DirectResourcesCommitQueue *)(a1 - 8);
  else
    v3 = 0;
  if (a2)
    v4 = (re::DirectResourcesCommitQueue *)(a2 - 8);
  else
    v4 = 0;
  re::DirectResourcesCommitQueue::takeCommitsThrough_threadSafe(v3, v4, a3);
}

uint64_t DRCommitQueueEntryGetCommitId(uint64_t a1)
{
  return *(_QWORD *)a1;
}

id DRCommitQueueEntryGetUserPayload(uint64_t a1)
{
  return *(id *)(a1 + 8);
}

void ClientConnectionConfig::~ClientConnectionConfig(id *this)
{

  ArcSharedObject::~ArcSharedObject((ArcSharedObject *)this);
}

{

  ArcSharedObject::~ArcSharedObject((ArcSharedObject *)this);
  JUMPOUT(0x23B84F8E0);
}

void ClientConnection::~ClientConnection(ClientConnection *this)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = &off_250B65A98;
  v2 = *((_QWORD *)this + 3);
  if (v2)
  {

    *((_QWORD *)this + 3) = 0;
  }
  v3 = *((_QWORD *)this + 2);
  if (v3)
  {

    *((_QWORD *)this + 2) = 0;
  }
  ArcSharedObject::~ArcSharedObject(this);
}

{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = &off_250B65A98;
  v2 = *((_QWORD *)this + 3);
  if (v2)
  {

    *((_QWORD *)this + 3) = 0;
  }
  v3 = *((_QWORD *)this + 2);
  if (v3)
  {

    *((_QWORD *)this + 2) = 0;
  }
  ArcSharedObject::~ArcSharedObject(this);
  JUMPOUT(0x23B84F8E0);
}

uint64_t std::__function::__func<DRCommitQueueEnumerate::$_0,std::allocator<DRCommitQueueEnumerate::$_0>,BOOL ()(re::DirectResourcesResolvedCommit const*)>::~__func(uint64_t a1)
{

  return a1;
}

void std::__function::__func<DRCommitQueueEnumerate::$_0,std::allocator<DRCommitQueueEnumerate::$_0>,BOOL ()(re::DirectResourcesResolvedCommit const*)>::~__func(uint64_t a1)
{

  JUMPOUT(0x23B84F8E0);
}

_QWORD *std::__function::__func<DRCommitQueueEnumerate::$_0,std::allocator<DRCommitQueueEnumerate::$_0>,BOOL ()(re::DirectResourcesResolvedCommit const*)>::__clone(uint64_t a1)
{
  _QWORD *v2;

  v2 = operator new(0x10uLL);
  *v2 = &off_250B65AD0;
  v2[1] = _Block_copy(*(const void **)(a1 + 8));
  return v2;
}

void *std::__function::__func<DRCommitQueueEnumerate::$_0,std::allocator<DRCommitQueueEnumerate::$_0>,BOOL ()(re::DirectResourcesResolvedCommit const*)>::__clone(uint64_t a1, _QWORD *a2)
{
  void *result;

  *a2 = &off_250B65AD0;
  result = _Block_copy(*(const void **)(a1 + 8));
  a2[1] = result;
  return result;
}

void std::__function::__func<DRCommitQueueEnumerate::$_0,std::allocator<DRCommitQueueEnumerate::$_0>,BOOL ()(re::DirectResourcesResolvedCommit const*)>::destroy(uint64_t a1)
{

}

void std::__function::__func<DRCommitQueueEnumerate::$_0,std::allocator<DRCommitQueueEnumerate::$_0>,BOOL ()(re::DirectResourcesResolvedCommit const*)>::destroy_deallocate(id *a1)
{

  operator delete(a1);
}

uint64_t std::__function::__func<DRCommitQueueEnumerate::$_0,std::allocator<DRCommitQueueEnumerate::$_0>,BOOL ()(re::DirectResourcesResolvedCommit const*)>::operator()(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v6;
  id v7;

  v3 = *(void **)(*(_QWORD *)a2 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)a2 + 24);
  v7 = v3;
  v4 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 8) + 16))(*(_QWORD *)(a1 + 8));

  return v4;
}

uint64_t std::__function::__func<DRCommitQueueApplyThrough::$_0,std::allocator<DRCommitQueueApplyThrough::$_0>,void ()(re::DirectResourceEvent const&,unsigned long long)>::~__func(uint64_t a1)
{

  return a1;
}

void std::__function::__func<DRCommitQueueApplyThrough::$_0,std::allocator<DRCommitQueueApplyThrough::$_0>,void ()(re::DirectResourceEvent const&,unsigned long long)>::~__func(uint64_t a1)
{

  JUMPOUT(0x23B84F8E0);
}

_QWORD *std::__function::__func<DRCommitQueueApplyThrough::$_0,std::allocator<DRCommitQueueApplyThrough::$_0>,void ()(re::DirectResourceEvent const&,unsigned long long)>::__clone(uint64_t a1)
{
  _QWORD *v2;
  const void *v3;
  uint64_t v4;

  v2 = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(const void **)(a1 + 16);
  *v2 = &off_250B65B18;
  v2[1] = v4;
  v2[2] = _Block_copy(v3);
  return v2;
}

void *std::__function::__func<DRCommitQueueApplyThrough::$_0,std::allocator<DRCommitQueueApplyThrough::$_0>,void ()(re::DirectResourceEvent const&,unsigned long long)>::__clone(uint64_t a1, _QWORD *a2)
{
  const void *v3;
  uint64_t v4;
  void *result;

  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(const void **)(a1 + 16);
  *a2 = &off_250B65B18;
  a2[1] = v4;
  result = _Block_copy(v3);
  a2[2] = result;
  return result;
}

void std::__function::__func<DRCommitQueueApplyThrough::$_0,std::allocator<DRCommitQueueApplyThrough::$_0>,void ()(re::DirectResourceEvent const&,unsigned long long)>::destroy(uint64_t a1)
{

}

void std::__function::__func<DRCommitQueueApplyThrough::$_0,std::allocator<DRCommitQueueApplyThrough::$_0>,void ()(re::DirectResourceEvent const&,unsigned long long)>::destroy_deallocate(id *a1)
{

  operator delete(a1);
}

void std::__function::__func<DRCommitQueueApplyThrough::$_0,std::allocator<DRCommitQueueApplyThrough::$_0>,void ()(re::DirectResourceEvent const&,unsigned long long)>::operator()(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (*a2)
  {
    v3 = *a3;
    v4 = *(_QWORD *)(a1 + 16);
    v5 = (void *)re::DirectResourcesCommitQueue::device(*(re::DirectResourcesCommitQueue **)(a1 + 8));
    re::DirectResourceEvent::makeEvent(v5, &v6);
    (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v6, v3);
    if (v6)

  }
}

uint64_t DRResourcesCommitCopyToXPC(uint64_t a1, const re::DirectResourceCommands *a2)
{
  re *v2;

  if (a1)
    v2 = (re *)(a1 - 8);
  else
    v2 = 0;
  re::xpc_object_create(v2, a2);
  return objc_claimAutoreleasedReturnValue();
}

id DRResourcesCommitCopyEventWithDevice(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v5;

  re::DirectResourceEvent::makeEvent(a2, &v5);
  v2 = v5;
  v3 = v2;
  if (v2)

  return v3;
}

BOOL DRResourcesCommitHasEvent(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 32) != 0;
}

uint64_t DRResourcesCommitGetId(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(_QWORD *)(v1 + 16);
}

id DRResourcesCommitGetUserPayload(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 8;
  if (!a1)
    v1 = 0;
  return *(id *)(v1 + 24);
}

void re::DirectFence::~DirectFence()
{
  __assert_rtn("~DirectFence", "DirectFence.cpp", 39, "!m_active");
}

void re::DirectFence::invalidate()
{
  __assert_rtn("invalidate", "DirectFence.cpp", 44, "m_active");
}

void re::MemoryMappedRegion::~MemoryMappedRegion()
{
  __assert_rtn("~MemoryMappedRegion", "DirectMemoryResource.cpp", 109, "false");
}

void re::DirectMemoryResource::createWithSharedTexture()
{
  __assert_rtn("createWithSharedTexture", "DirectMemoryResource.cpp", 234, "sharedTexture->shareable()");
}

void re::DirectResourceLoader::corruptResource(re *a1, NSObject *a2)
{
  int v3;
  char *v4;
  char v5[37];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  re::toString(a1, v5);
  v3 = 136315138;
  v4 = v5;
  _os_log_error_impl(&dword_23A4DF000, a2, OS_LOG_TYPE_ERROR, "CorruptResource %s", (uint8_t *)&v3, 0xCu);
}

void re::DirectResourcesPendingCommit::ensureUpdate()
{
  __assert_rtn("ensureUpdate", "DirectResourceContext.cpp", 337, "!resource->isReplica()");
}

void re::DirectResourcesPendingCommit::scheduled()
{
  __assert_rtn("scheduled", "DirectResourceContext.cpp", 441, "m_state == State::kOpen");
}

void re::DirectResourceContext::sendIfReady()
{
  __assert_rtn("completed", "DirectResourceContext.cpp", 450, "m_state == State::kScheduled");
}

void re::DirectResourceContext::freeListWaitTimedOut(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23A4DF000, log, OS_LOG_TYPE_ERROR, "Timed out waiting for renderer to free resources.", v1, 2u);
}

void re::DirectResourceContext::addPayload()
{
  __assert_rtn("addPayload", "DirectResourceContext.cpp", 938, "!resource->isReplica()");
}

void re::DirectResourceClientReceiver::validateAndResolve(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_23A4DF000, a2, OS_LOG_TYPE_ERROR, "Discarding invalid commit from client %llu", (uint8_t *)&v3, 0xCu);
}

void re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>(re *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;
  uint64_t v9;
  int v10;

  OUTLINED_FUNCTION_1(a1, *MEMORY[0x24BDAC8D0], v7, v9, v10, SBYTE2(v10), SHIBYTE(v10));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23A4DF000, v1, v2, "Attempting to destroy unknown resource %s", v3, v4, v5, v6, v8);
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;
  uint64_t v9;
  int v10;

  OUTLINED_FUNCTION_1(a1, *MEMORY[0x24BDAC8D0], v7, v9, v10, SBYTE2(v10), SHIBYTE(v10));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23A4DF000, v1, v2, "Update destined for unknown resource %s", v3, v4, v5, v6, v8);
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;
  uint64_t v9;
  int v10;

  OUTLINED_FUNCTION_1(a1, *MEMORY[0x24BDAC8D0], v7, v9, v10, SBYTE2(v10), SHIBYTE(v10));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23A4DF000, v1, v2, "Update failed validation for resource %s", v3, v4, v5, v6, v8);
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;
  uint64_t v9;
  int v10;

  OUTLINED_FUNCTION_1(a1, *MEMORY[0x24BDAC8D0], v7, v9, v10, SBYTE2(v10), SHIBYTE(v10));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_23A4DF000, v1, v2, "Attempting to create a resource %s which already exists", v3, v4, v5, v6, v8);
  OUTLINED_FUNCTION_2();
}

void re::DirectResource::setIdentifier()
{
  __assert_rtn("setIdentifier", "DirectResource.cpp", 40, "m_delegate == nullptr");
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x24BDBBE90](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x24BDD8B60](aSurface);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B78](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8D28](xobj);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t MTLAttributeFormatSize(MTLAttributeFormat a1)
{
  return MEMORY[0x24BDDD9F8](a1);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
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

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x24BEDB1B8](__format);
}

void operator delete(void *__p)
{
  off_250B649A0(__p);
}

uint64_t operator delete()
{
  return off_250B649A8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_250B649B0(__sz);
}

uint64_t operator new()
{
  return off_250B649B8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

uint64_t __ulock_wait()
{
  return MEMORY[0x24BDAC948]();
}

uint64_t __ulock_wake()
{
  return MEMORY[0x24BDAC950]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x24BEDCE40](cls, name, imp, types);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
{
  return (Class)MEMORY[0x24BEDCF90](superclass, name, extraBytes);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_constructInstance(Class cls, void *bytes)
{
  return (id)MEMORY[0x24BEDCFF8](cls, bytes);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void *__cdecl objc_destructInstance(id obj)
{
  return (void *)MEMORY[0x24BEDD040](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_registerClassPair(Class cls)
{
  MEMORY[0x24BEDD170](cls);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x24BDAF478](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int sched_yield(void)
{
  return MEMORY[0x24BDAFC68]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x24BDB0308](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

void uuid_generate_random(uuid_t out)
{
  MEMORY[0x24BDB0320](out);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0648]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x24BDB06D0](xarray, index, value);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB08F8](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0928](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x24BDB0960](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x24BDB0A98]();
}

uint64_t xpc_mach_send_get_right()
{
  return MEMORY[0x24BDB0AA8]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x24BDB0B60](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x24BDB0B70](xshmem, region);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0BD8](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x24BDB0BF8](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x24BDB0C00](xuuid);
}

