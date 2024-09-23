void sub_20ABDE2B8(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&off_24C3801A8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&off_24C380208;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x20BD2D02CLL);
}

uint64_t sub_20ABDE318(uint64_t result, uint64_t a2)
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
    goto LABEL_18;
  v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(_BYTE *)(a2 + 88) & 8) == 0)
    {
      v6 = *(v3 - 1);
      if (v6 != 95)
      {
LABEL_15:
        if ((v6 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
          goto LABEL_17;
        goto LABEL_18;
      }
LABEL_17:
      v10 = 1;
      goto LABEL_25;
    }
LABEL_18:
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
        if (v6 != 95)
          goto LABEL_15;
        goto LABEL_17;
      }
      goto LABEL_18;
    }
  }
  v7 = *(v4 - 1);
  v8 = *v4;
  if (v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v7) & 0x500) != 0)
  {
    v9 = 1;
    if ((_DWORD)v8 == 95)
      goto LABEL_22;
  }
  else
  {
    v9 = 0;
    if ((_DWORD)v8 == 95)
      goto LABEL_22;
  }
  if ((v8 & 0x80) != 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v8) & 0x500) == 0)
  {
    v11 = 0;
    goto LABEL_24;
  }
LABEL_22:
  v11 = 1;
LABEL_24:
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

void sub_20ABDE440(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD2D02CLL);
}

uint64_t sub_20ABDE464(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

_QWORD *sub_20ABDE480(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_24C380208;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_20ABDE4C0(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &off_24C380208;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x20BD2D02CLL);
}

uint64_t sub_20ABDE510(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void sub_20ABDE528()
{
  JUMPOUT(0x20BD2D02CLL);
}

void sub_20ABDE53C(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

BOOL cva::utils::string::ignoreWhitespace(_QWORD *a1)
{
  unsigned __int8 v2;
  _QWORD *v3;
  int v4;
  int v5;

  v2 = 0;
  v3 = a1 + 4;
  while (1)
  {
    v4 = std::istream::get();
    if (v4 != -1)
      v2 = v4;
    v5 = *(_DWORD *)((char *)v3 + *(_QWORD *)(*a1 - 24));
    if (v5)
      break;
    if (v2 > 0x20u || ((1 << v2) & 0x100002600) == 0)
    {
      std::istream::putback();
      return v5 == 0;
    }
  }
  return v5 == 0;
}

void cva::utils::string::ignoreComments(_QWORD *a1)
{
  unsigned __int8 v2;
  _QWORD *v3;
  int v4;
  const std::locale::facet *v6;
  unsigned __int8 v7;
  _QWORD *v8;
  void *__p[2];
  uint64_t v10;
  std::locale v11;

  if (!*(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32))
  {
    v2 = 0;
    v3 = a1 + 4;
    while (1)
    {
      v4 = std::istream::get();
      if (v4 != -1)
        v2 = v4;
      if (*(_DWORD *)((char *)v3 + *(_QWORD *)(*a1 - 24)))
        break;
      if (v2 > 0x20u || ((1 << v2) & 0x100002600) == 0)
      {
        std::istream::putback();
        break;
      }
    }
    if (std::istream::peek() == 35)
    {
      __p[0] = 0;
      __p[1] = 0;
      v10 = 0;
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v6 = std::locale::use_facet(&v11, MEMORY[0x24BEDB350]);
      v7 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10);
      std::locale::~locale(&v11);
      v8 = sub_20AB96AD8(a1, (uint64_t)__p, v7);
      cva::utils::string::ignoreComments(v8);
      if (SHIBYTE(v10) < 0)
        operator delete(__p[0]);
    }
  }
}

_QWORD *cva::utils::string::getline(_QWORD *a1, uint64_t a2)
{
  const std::locale::facet *v4;
  unsigned __int8 v5;
  std::locale v7;

  cva::utils::string::ignoreComments(a1);
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
  v4 = std::locale::use_facet(&v7, MEMORY[0x24BEDB350]);
  v5 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v4->__vftable[2].~facet_0)(v4, 10);
  std::locale::~locale(&v7);
  return sub_20AB96AD8(a1, a2, v5);
}

unint64_t cva::utils::string::trimmed@<X0>(unint64_t result@<X0>, _QWORD *a2@<X8>)
{
  unint64_t v2;
  unint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int v16;
  unint64_t v17;
  size_t v18;
  size_t v19;
  size_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;

  v2 = result;
  v4 = *(unsigned __int8 *)(result + 23);
  v5 = *(char *)(result + 23) < 0;
  v6 = *(_QWORD *)(result + 8);
  if (*(char *)(result + 23) >= 0)
    v6 = *(unsigned __int8 *)(result + 23);
  v7 = MEMORY[0x24BDAC740];
  v8 = 0;
  if (v6)
  {
    do
    {
      if (v5)
        v9 = *(_QWORD *)v2;
      else
        v9 = v2;
      v10 = *(char *)(v9 + v8);
      if ((v10 & 0x80000000) != 0)
      {
        result = __maskrune(v10, 0x4000uLL);
        v4 = *(unsigned __int8 *)(v2 + 23);
        if (!(_DWORD)result)
          break;
      }
      else
      {
        result = *(_DWORD *)(v7 + 4 * v10 + 60) & 0x4000;
        if (!(_DWORD)result)
          break;
      }
      ++v8;
      v5 = (v4 & 0x80u) != 0;
      v11 = *(_QWORD *)(v2 + 8);
      if ((v4 & 0x80u) == 0)
        v11 = v4;
    }
    while (v8 < v11);
  }
  if ((v4 & 0x80) != 0)
  {
    v4 = *(_QWORD *)(v2 + 8);
    if (v8 == v4)
      goto LABEL_16;
  }
  else if (v8 == v4)
  {
LABEL_16:
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    return result;
  }
  v12 = v4 - 1;
  do
  {
    while (1)
    {
      v13 = v12;
      LODWORD(v14) = *(char *)(v2 + 23);
      if (v12 <= v8)
      {
        v17 = v12 + 1;
        if ((v14 & 0x80) == 0)
          goto LABEL_29;
LABEL_26:
        v14 = *(_QWORD *)(v2 + 8);
        if (v14 >= v8)
        {
          v2 = *(_QWORD *)v2;
          goto LABEL_30;
        }
LABEL_42:
        abort();
      }
      v15 = *(_QWORD *)v2;
      if ((v14 & 0x80000000) == 0)
        v15 = v2;
      v16 = *(char *)(v15 + v13);
      if ((v16 & 0x80000000) != 0)
        break;
      result = *(_DWORD *)(v7 + 4 * v16 + 60) & 0x4000;
      v12 = v13 - 1;
      if (!(_DWORD)result)
        goto LABEL_25;
    }
    result = __maskrune(v16, 0x4000uLL);
    v12 = v13 - 1;
  }
  while ((_DWORD)result);
LABEL_25:
  v17 = v13 + 1;
  LOBYTE(v14) = *(_BYTE *)(v2 + 23);
  if ((v14 & 0x80) != 0)
    goto LABEL_26;
LABEL_29:
  v14 = v14;
  if (v8 > v14)
    goto LABEL_42;
LABEL_30:
  v18 = v17 - v8;
  v19 = v14 - v8;
  if (v19 >= v18)
    v20 = v18;
  else
    v20 = v19;
  if (v20 >= 0x7FFFFFFFFFFFFFF8)
    goto LABEL_42;
  if (v20 >= 0x17)
  {
    v21 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v20 | 7) != 0x17)
      v21 = v20 | 7;
    v22 = v21 + 1;
    v23 = operator new(v21 + 1);
    a2[1] = v20;
    a2[2] = v22 | 0x8000000000000000;
    *a2 = v23;
    a2 = v23;
    goto LABEL_40;
  }
  *((_BYTE *)a2 + 23) = v20;
  if (v20)
LABEL_40:
    result = (unint64_t)memmove(a2, (const void *)(v2 + v8), v20);
  *((_BYTE *)a2 + v20) = 0;
  return result;
}

void cva::utils::string::replace_whitespace(std::string::value_type *a1@<X0>, uint64_t a2@<X8>)
{
  std::string::size_type v4;
  uint64_t v5;
  std::string::value_type *v6;
  std::string::value_type *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  std::string::value_type *v19;
  unsigned int v20;
  std::string::value_type v21;
  uint64_t v22;
  std::string::value_type *v23;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  if (a1[23] >= 0)
    v4 = a1[23];
  else
    v4 = *((_QWORD *)a1 + 1);
  std::string::reserve((std::string *)a2, v4);
  v5 = a1[23];
  v6 = *(std::string::value_type **)a1;
  if ((v5 & 0x80u) == 0)
    v7 = a1;
  else
    v7 = *(std::string::value_type **)a1;
  v8 = MEMORY[0x24BDAC740];
LABEL_9:
  while (1)
  {
    v9 = (char)v5;
    v10 = *((_QWORD *)a1 + 1);
    while (1)
    {
      v11 = v9 < 0;
      v12 = (uint64_t)(v9 >= 0 ? a1 : v6);
      v13 = v11 ? v10 : v5;
      if (v7 == (std::string::value_type *)(v12 + v13))
        break;
      v14 = *v7;
      if ((v14 & 0x80000000) != 0)
      {
        v15 = __maskrune(v14, 0x4000uLL);
        v5 = a1[23];
        v6 = *(std::string::value_type **)a1;
        v10 = *((_QWORD *)a1 + 1);
        if (!v15)
          break;
      }
      else if ((*(_DWORD *)(v8 + 4 * v14 + 60) & 0x4000) == 0)
      {
        break;
      }
      ++v7;
      v9 = (char)v5;
    }
    v16 = (uint64_t)((v5 & 0x80u) == 0 ? a1 : v6);
    v17 = (v5 & 0x80u) == 0 ? v5 : v10;
    if (v7 == (std::string::value_type *)(v16 + v17))
      break;
    v18 = *(unsigned __int8 *)(a2 + 23);
    if ((v18 & 0x80u) != 0)
      v18 = *(_QWORD *)(a2 + 8);
    if (v18)
    {
      std::string::push_back((std::string *)a2, 95);
      v5 = a1[23];
      v6 = *(std::string::value_type **)a1;
      v10 = *((_QWORD *)a1 + 1);
    }
    if ((v5 & 0x80u) == 0)
      v19 = a1;
    else
      v19 = v6;
    if ((v5 & 0x80u) == 0)
      v10 = v5;
    if (v7 != &v19[v10])
    {
      while (1)
      {
        v20 = *v7;
        if ((v20 & 0x80000000) != 0)
        {
          if (__maskrune(v20, 0x4000uLL))
          {
LABEL_8:
            v5 = a1[23];
            v6 = *(std::string::value_type **)a1;
            goto LABEL_9;
          }
        }
        else if ((*(_DWORD *)(v8 + 4 * v20 + 60) & 0x4000) != 0)
        {
          goto LABEL_8;
        }
        v21 = *v7++;
        std::string::push_back((std::string *)a2, v21);
        v5 = a1[23];
        v6 = *(std::string::value_type **)a1;
        v22 = *((_QWORD *)a1 + 1);
        if ((v5 & 0x80u) == 0)
          v23 = a1;
        else
          v23 = *(std::string::value_type **)a1;
        if ((v5 & 0x80u) == 0)
          v22 = a1[23];
        if (v7 == &v23[v22])
          goto LABEL_9;
      }
    }
  }
}

uint64_t cva::utils::string::get_block(_QWORD *a1, uint64_t a2)
{
  unsigned __int8 v4;
  _QWORD *v5;
  int v6;
  int v8;
  int v9;
  char v10;
  int v11;
  int v12;
  size_t v13;
  unint64_t v14;
  __int128 *v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  char *v19;
  uint64_t result;
  int v21;
  size_t v22;
  unint64_t v23;
  __int128 *p_dst;
  uint64_t v25;
  uint64_t v26;
  const void *v27;
  __int128 __dst;
  unint64_t v29;

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
  v4 = 0;
  v5 = a1 + 4;
  while (1)
  {
    v6 = std::istream::get();
    if (v6 != -1)
      v4 = v6;
    if (*(_DWORD *)((char *)v5 + *(_QWORD *)(*a1 - 24)))
      break;
    if (v4 > 0x20u || ((1 << v4) & 0x100002600) == 0)
    {
      std::istream::putback();
      break;
    }
  }
  v8 = std::istream::get();
  v9 = *(_DWORD *)((_BYTE *)a1 + *(_QWORD *)(*a1 - 24) + 32) & 5;
  if (v8 == -1)
  {
    result = 0;
    if (v9)
      return result;
    goto LABEL_40;
  }
  if (!v9)
  {
    if (v8 == 123)
    {
      v10 = 123;
      while (1)
      {
        v11 = std::istream::get();
        if (v11 != -1)
          v10 = v11;
        if ((*((_BYTE *)v5 + *(_QWORD *)(*a1 - 24)) & 5) != 0)
          return 0;
        if (v10 == 125)
        {
          v21 = *(char *)(a2 + 23);
          if (v21 >= 0)
            v22 = *(unsigned __int8 *)(a2 + 23);
          else
            v22 = *(_QWORD *)(a2 + 8);
          v23 = v22 + 1;
          if (v22 + 1 > 0x7FFFFFFFFFFFFFF7)
LABEL_60:
            abort();
          if (v23 >= 0x17)
          {
            v25 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v23 | 7) != 0x17)
              v25 = v23 | 7;
            v26 = v25 + 1;
            p_dst = (__int128 *)operator new(v25 + 1);
            *((_QWORD *)&__dst + 1) = v22 + 1;
            v29 = v26 | 0x8000000000000000;
            *(_QWORD *)&__dst = p_dst;
          }
          else
          {
            v29 = 0;
            __dst = 0uLL;
            p_dst = &__dst;
            HIBYTE(v29) = v22 + 1;
            if (!v22)
            {
LABEL_57:
              *(_WORD *)((char *)p_dst + v22) = 10;
              if (*(char *)(a2 + 23) < 0)
                operator delete(*(void **)a2);
              *(_OWORD *)a2 = __dst;
              *(_QWORD *)(a2 + 16) = v29;
              return 1;
            }
          }
          if (v21 >= 0)
            v27 = (const void *)a2;
          else
            v27 = *(const void **)a2;
          memmove(p_dst, v27, v22);
          goto LABEL_57;
        }
        v12 = *(char *)(a2 + 23);
        if (v12 >= 0)
          v13 = *(unsigned __int8 *)(a2 + 23);
        else
          v13 = *(_QWORD *)(a2 + 8);
        v14 = v13 + 1;
        if (v13 + 1 > 0x7FFFFFFFFFFFFFF7)
          goto LABEL_60;
        if (v14 >= 0x17)
        {
          v16 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v14 | 7) != 0x17)
            v16 = v14 | 7;
          v17 = v16 + 1;
          v15 = (__int128 *)operator new(v16 + 1);
          *((_QWORD *)&__dst + 1) = v13 + 1;
          v29 = v17 | 0x8000000000000000;
          *(_QWORD *)&__dst = v15;
        }
        else
        {
          v29 = 0;
          __dst = 0uLL;
          v15 = &__dst;
          HIBYTE(v29) = v13 + 1;
          if (!v13)
            goto LABEL_37;
        }
        if (v12 >= 0)
          v18 = (const void *)a2;
        else
          v18 = *(const void **)a2;
        memmove(v15, v18, v13);
LABEL_37:
        v19 = (char *)v15 + v13;
        *v19 = v10;
        v19[1] = 0;
        if (*(char *)(a2 + 23) < 0)
          operator delete(*(void **)a2);
        *(_OWORD *)a2 = __dst;
        *(_QWORD *)(a2 + 16) = v29;
      }
    }
LABEL_40:
    std::istream::putback();
  }
  return 0;
}

void *cva::utils::string::common_suffix@<X0>(void *result@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *v3;
  size_t v5;
  unsigned __int8 v6;
  size_t v7;
  size_t v8;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  __darwin_ct_rune_t v14;
  uint64_t v15;
  uint64_t *v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  v3 = result;
  v5 = *((unsigned __int8 *)result + 23);
  v6 = v5;
  if ((v5 & 0x80u) != 0)
    v5 = *((_QWORD *)result + 1);
  v7 = *((unsigned __int8 *)a2 + 23);
  if ((v7 & 0x80u) != 0)
    v7 = a2[1];
  if (v7 >= v5)
    v8 = v5;
  else
    v8 = v7;
  if (!v8)
  {
    v10 = 0;
    if ((v6 & 0x80) == 0)
      goto LABEL_24;
LABEL_27:
    v17 = v3[1];
    if (v17 < v10)
      goto LABEL_38;
    v3 = (_QWORD *)*v3;
    goto LABEL_29;
  }
  v10 = 0;
  v11 = -1;
  while (1)
  {
    v12 = *((unsigned __int8 *)v3 + 23);
    if ((v12 & 0x80u) == 0)
      v13 = v3;
    else
      v13 = (_QWORD *)*v3;
    if ((v12 & 0x80u) != 0)
      v12 = v3[1];
    v14 = __toupper(*((char *)v13 + v12 + v11));
    v15 = *((unsigned __int8 *)a2 + 23);
    if ((v15 & 0x80u) == 0)
      v16 = a2;
    else
      v16 = (uint64_t *)*a2;
    if ((v15 & 0x80u) != 0)
      v15 = a2[1];
    result = (void *)__toupper(*((char *)v16 + v15 + v11));
    if (v14 != (_DWORD)result)
      break;
    ++v10;
    --v11;
    if (v8 == v10)
    {
      v10 = v8;
      break;
    }
  }
  v6 = *((_BYTE *)v3 + 23);
  if ((v6 & 0x80) != 0)
    goto LABEL_27;
LABEL_24:
  v17 = v6;
  if (v10 > v6)
LABEL_38:
    abort();
LABEL_29:
  if (v10 >= 0x7FFFFFFFFFFFFFF8)
    goto LABEL_38;
  if (v10 >= 0x17)
  {
    v18 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v18 = v10 | 7;
    v19 = v18 + 1;
    v20 = operator new(v18 + 1);
    a3[1] = v10;
    a3[2] = v19 | 0x8000000000000000;
    *a3 = v20;
    a3 = v20;
  }
  else
  {
    *((_BYTE *)a3 + 23) = v10;
    if (!v10)
      goto LABEL_37;
  }
  result = memmove(a3, (char *)v3 + v17 - v10, v10);
LABEL_37:
  *((_BYTE *)a3 + v10) = 0;
  return result;
}

double cva::utils::string::common_suffix@<D0>(__int128 **a1@<X0>, uint64_t a2@<X8>)
{
  __int128 *v3;
  __int128 *v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;

  v3 = *a1;
  v4 = a1[1];
  if (v4 == *a1)
  {
    *(_BYTE *)(a2 + 23) = 0;
    *(_BYTE *)a2 = 0;
  }
  else
  {
    if (*((char *)v3 + 23) < 0)
    {
      sub_20AB88C14((_BYTE *)a2, *(void **)v3, *((_QWORD *)v3 + 1));
      v3 = *a1;
      v4 = a1[1];
    }
    else
    {
      v6 = *v3;
      *(_OWORD *)a2 = *v3;
      *(_QWORD *)(a2 + 16) = *((_QWORD *)v3 + 2);
    }
    if ((int)(-1431655765 * ((unint64_t)((char *)v4 - (char *)v3) >> 3)) >= 1)
    {
      v7 = 0;
      v8 = 0;
      do
      {
        cva::utils::string::common_suffix((void *)a2, (uint64_t *)((char *)v3 + v7), &v10);
        if (*(char *)(a2 + 23) < 0)
          operator delete(*(void **)a2);
        *(_QWORD *)&v6 = v10;
        *(_OWORD *)a2 = v10;
        *(_QWORD *)(a2 + 16) = v11;
        ++v8;
        v3 = *a1;
        v7 += 24;
      }
      while (v8 < (int)(-1431655765 * ((unint64_t)((char *)a1[1] - (char *)*a1) >> 3)));
    }
  }
  return *(double *)&v6;
}

void cva::utils::string::split(uint64_t a1, const std::string *a2, char *__s, char a4)
{
  void **v7;
  void **i;
  std::string::size_type size;
  std::string::size_type v10;
  std::string::size_type v11;
  std::string::size_type v12;
  std::string::size_type first_of;
  std::string::size_type v14;
  std::string::size_type v15;
  const std::string *v16;
  size_t v17;
  size_t v18;
  __int128 *p_dst;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  int v24;
  std::string::size_type first_not_of;
  std::string::size_type v26;
  void **v27;
  void **v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  __int128 v39;
  void **v40;
  void **v41;
  size_t v42;
  __int128 *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  int v48;
  size_t __n;
  __int128 __dst;
  unint64_t v52;

  __n = strlen(__s);
  v7 = *(void ***)a1;
  for (i = *(void ***)(a1 + 8); i != v7; i -= 3)
  {
    if (*((char *)i - 1) < 0)
      operator delete(*(i - 3));
  }
  *(_QWORD *)(a1 + 8) = v7;
  size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  LODWORD(v10) = (char)size;
  v11 = 0;
  if ((size & 0x80u) != 0)
    size = a2->__r_.__value_.__l.__size_;
  if (size)
  {
    do
    {
      first_of = std::string::find_first_of(a2, __s, v11, __n);
      v14 = HIBYTE(a2->__r_.__value_.__r.__words[2]);
      LODWORD(v10) = (char)v14;
      if (first_of == -1)
        break;
      v15 = first_of;
      if ((char)v14 < 0)
      {
        v14 = a2->__r_.__value_.__l.__size_;
        if (v14 < v11)
          goto LABEL_84;
        v16 = (const std::string *)a2->__r_.__value_.__r.__words[0];
      }
      else
      {
        v16 = a2;
        if (v11 > v14)
          goto LABEL_84;
      }
      v17 = v14 - v11;
      if (v17 >= first_of - v11)
        v18 = first_of - v11;
      else
        v18 = v17;
      if (v18 > 0x7FFFFFFFFFFFFFF7)
        goto LABEL_84;
      if (v18 >= 0x17)
      {
        v20 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v18 | 7) != 0x17)
          v20 = v18 | 7;
        v21 = v20 + 1;
        p_dst = (__int128 *)operator new(v20 + 1);
        *((_QWORD *)&__dst + 1) = v18;
        v52 = v21 | 0x8000000000000000;
        *(_QWORD *)&__dst = p_dst;
      }
      else
      {
        HIBYTE(v52) = v18;
        p_dst = &__dst;
        if (!v18)
          goto LABEL_33;
      }
      memmove(p_dst, (char *)v16 + v11, v18);
LABEL_33:
      *((_BYTE *)p_dst + v18) = 0;
      v22 = *(_QWORD *)(a1 + 8);
      if (v22 >= *(_QWORD *)(a1 + 16))
      {
        v23 = sub_20ABDF524((void **)a1, (uint64_t)&__dst);
        v24 = SHIBYTE(v52);
        *(_QWORD *)(a1 + 8) = v23;
        if (v24 < 0)
          operator delete((void *)__dst);
      }
      else
      {
        *(_OWORD *)v22 = __dst;
        *(_QWORD *)(v22 + 16) = v52;
        *(_QWORD *)(a1 + 8) = v22 + 24;
      }
      first_not_of = std::string::find_first_not_of(a2, __s, v15, __n);
      v26 = HIBYTE(a2->__r_.__value_.__r.__words[2]);
      if ((v26 & 0x80u) != 0)
        v26 = a2->__r_.__value_.__l.__size_;
      if (v26 >= first_not_of)
        v11 = first_not_of;
      else
        v11 = v26;
      if ((a4 & 1) == 0)
      {
        v28 = *(void ***)a1;
        v27 = *(void ***)(a1 + 8);
        v29 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v27 - *(_QWORD *)a1) >> 3);
        v30 = v11 + ~v15;
        v31 = v30 - 0x5555555555555555 * (((uint64_t)v27 - *(_QWORD *)a1) >> 3);
        if (v29 >= v31)
        {
          if (v29 > v31)
          {
            v41 = &v28[3 * v31];
            while (v27 != v41)
            {
              if (*((char *)v27 - 1) < 0)
                operator delete(*(v27 - 3));
              v27 -= 3;
            }
            *(_QWORD *)(a1 + 8) = v41;
          }
        }
        else
        {
          v32 = *(_QWORD *)(a1 + 16);
          if (0xAAAAAAAAAAAAAAABLL * ((v32 - (uint64_t)v27) >> 3) >= v30)
          {
            if (v30)
            {
              bzero(*(void **)(a1 + 8), 24 * ((24 * v30 - 24) / 0x18) + 24);
              v27 += 3 * ((24 * v30 - 24) / 0x18) + 3;
            }
            *(_QWORD *)(a1 + 8) = v27;
          }
          else
          {
            if (v31 > 0xAAAAAAAAAAAAAAALL)
              goto LABEL_84;
            v33 = 0xAAAAAAAAAAAAAAABLL * ((v32 - (uint64_t)v28) >> 3);
            if (2 * v33 > v31)
              v31 = 2 * v33;
            if (v33 >= 0x555555555555555)
              v31 = 0xAAAAAAAAAAAAAAALL;
            if (v31 > 0xAAAAAAAAAAAAAAALL)
              sub_20ABAD09C();
            v34 = 24 * v31;
            v35 = (char *)operator new(24 * v31);
            v36 = &v35[24 * v29];
            v37 = &v35[v34];
            bzero(v36, 24 * ((24 * v30 - 24) / 0x18) + 24);
            v38 = &v36[24 * ((24 * v30 - 24) / 0x18) + 24];
            if (v27 == v28)
            {
              *(_QWORD *)a1 = v36;
              *(_QWORD *)(a1 + 8) = v38;
              *(_QWORD *)(a1 + 16) = v37;
            }
            else
            {
              do
              {
                v39 = *(_OWORD *)(v27 - 3);
                *((_QWORD *)v36 - 1) = *(v27 - 1);
                *(_OWORD *)(v36 - 24) = v39;
                v36 -= 24;
                *(v27 - 2) = 0;
                *(v27 - 1) = 0;
                *(v27 - 3) = 0;
                v27 -= 3;
              }
              while (v27 != v28);
              v27 = *(void ***)a1;
              v40 = *(void ***)(a1 + 8);
              *(_QWORD *)a1 = v36;
              *(_QWORD *)(a1 + 8) = v38;
              *(_QWORD *)(a1 + 16) = v37;
              while (v40 != v27)
              {
                if (*((char *)v40 - 1) < 0)
                  operator delete(*(v40 - 3));
                v40 -= 3;
              }
            }
            if (v27)
              operator delete(v27);
          }
        }
      }
      v12 = HIBYTE(a2->__r_.__value_.__r.__words[2]);
      LODWORD(v10) = (char)v12;
      if ((v12 & 0x80u) != 0)
        v12 = a2->__r_.__value_.__l.__size_;
    }
    while (v11 < v12);
  }
  if ((v10 & 0x80000000) != 0)
  {
    v10 = a2->__r_.__value_.__l.__size_;
    if (v10 < v11)
      goto LABEL_84;
    a2 = (const std::string *)a2->__r_.__value_.__r.__words[0];
  }
  else
  {
    v10 = v10;
    if (v11 > v10)
LABEL_84:
      abort();
  }
  v42 = v10 - v11;
  if (v10 - v11 > 0x7FFFFFFFFFFFFFF7)
    goto LABEL_84;
  if (v42 >= 0x17)
  {
    v44 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v42 | 7) != 0x17)
      v44 = v42 | 7;
    v45 = v44 + 1;
    v43 = (__int128 *)operator new(v44 + 1);
    *((_QWORD *)&__dst + 1) = v42;
    v52 = v45 | 0x8000000000000000;
    *(_QWORD *)&__dst = v43;
    goto LABEL_79;
  }
  HIBYTE(v52) = v10 - v11;
  v43 = &__dst;
  if (v10 != v11)
LABEL_79:
    memmove(v43, (char *)a2 + v11, v42);
  *((_BYTE *)v43 + v42) = 0;
  v46 = *(_QWORD *)(a1 + 8);
  if (v46 >= *(_QWORD *)(a1 + 16))
  {
    v47 = sub_20ABDF524((void **)a1, (uint64_t)&__dst);
    v48 = SHIBYTE(v52);
    *(_QWORD *)(a1 + 8) = v47;
    if (v48 < 0)
      operator delete((void *)__dst);
  }
  else
  {
    *(_OWORD *)v46 = __dst;
    *(_QWORD *)(v46 + 16) = v52;
    *(_QWORD *)(a1 + 8) = v46 + 24;
  }
}

char *sub_20ABDF524(void **a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  void **v11;
  void **v12;
  __int128 v13;
  void **v14;

  v2 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 3);
  v3 = v2 + 1;
  if (v2 + 1 > 0xAAAAAAAAAAAAAAALL)
    abort();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) > v3)
    v3 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) >= 0x555555555555555)
    v6 = 0xAAAAAAAAAAAAAAALL;
  else
    v6 = v3;
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL)
      sub_20ABAD09C();
    v7 = (char *)operator new(24 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[24 * v2];
  v9 = &v7[24 * v6];
  *(_OWORD *)v8 = *(_OWORD *)a2;
  *((_QWORD *)v8 + 2) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  v10 = v8 + 24;
  v11 = (void **)*a1;
  v12 = (void **)a1[1];
  if (v12 == *a1)
  {
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
  }
  else
  {
    do
    {
      v13 = *(_OWORD *)(v12 - 3);
      *((_QWORD *)v8 - 1) = *(v12 - 1);
      *(_OWORD *)(v8 - 24) = v13;
      v8 -= 24;
      *(v12 - 2) = 0;
      *(v12 - 1) = 0;
      *(v12 - 3) = 0;
      v12 -= 3;
    }
    while (v12 != v11);
    v12 = (void **)*a1;
    v14 = (void **)a1[1];
    *a1 = v8;
    a1[1] = v10;
    a1[2] = v9;
    while (v14 != v12)
    {
      if (*((char *)v14 - 1) < 0)
        operator delete(*(v14 - 3));
      v14 -= 3;
    }
  }
  if (v12)
    operator delete(v12);
  return v10;
}

__int128 **cva::utils::string::join@<X0>(__int128 **result@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  __int128 **v4;
  __int128 *v6;
  char *v7;
  __int128 v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  const std::string::value_type *v12;
  std::string::size_type v13;
  uint64_t v14;
  uint64_t v15;
  const std::string::value_type *v16;
  const std::string::value_type *v17;
  int v18;
  const std::string::value_type *v19;
  std::string::size_type v20;

  v4 = result;
  v6 = *result;
  v7 = (char *)result[1];
  if (*result == (__int128 *)v7)
  {
    a3->__r_.__value_.__r.__words[0] = 0;
    a3->__r_.__value_.__l.__size_ = 0;
    v7 = (char *)v6;
    a3->__r_.__value_.__r.__words[2] = 0;
  }
  else if (*((char *)v6 + 23) < 0)
  {
    result = (__int128 **)sub_20AB88C14(a3, *(void **)v6, *((_QWORD *)v6 + 1));
    v6 = *v4;
    v7 = (char *)v4[1];
  }
  else
  {
    v8 = *v6;
    a3->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v8;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((v7 - (char *)v6) >> 3) >= 2)
  {
    v9 = 0;
    v10 = 1;
    do
    {
      v11 = *(char *)(a2 + 23);
      if (v11 >= 0)
        v12 = (const std::string::value_type *)a2;
      else
        v12 = *(const std::string::value_type **)a2;
      if (v11 >= 0)
        v13 = *(unsigned __int8 *)(a2 + 23);
      else
        v13 = *(_QWORD *)(a2 + 8);
      std::string::append(a3, v12, v13);
      v14 = (uint64_t)*v4 + v9;
      v17 = *(const std::string::value_type **)(v14 + 24);
      v15 = v14 + 24;
      v16 = v17;
      v18 = *(char *)(v15 + 23);
      if (v18 >= 0)
        v19 = (const std::string::value_type *)v15;
      else
        v19 = v16;
      if (v18 >= 0)
        v20 = *(unsigned __int8 *)(v15 + 23);
      else
        v20 = *(_QWORD *)(v15 + 8);
      result = (__int128 **)std::string::append(a3, v19, v20);
      ++v10;
      v9 += 24;
    }
    while (v10 < 0xAAAAAAAAAAAAAAABLL * (((char *)v4[1] - (char *)*v4) >> 3));
  }
  return result;
}

uint64_t cva::utils::string::to_upper(uint64_t result)
{
  uint64_t v1;
  int v2;
  _BYTE *v3;
  _BYTE *v4;
  _BYTE *v5;

  v1 = *(unsigned __int8 *)(result + 23);
  v2 = (char)v1;
  v3 = (_BYTE *)(result + v1);
  if (v2 >= 0)
    v4 = v3;
  else
    v4 = (_BYTE *)(*(_QWORD *)result + *(_QWORD *)(result + 8));
  if (v2 >= 0)
    v5 = (_BYTE *)result;
  else
    v5 = *(_BYTE **)result;
  for (; v5 != v4; ++v5)
  {
    result = __toupper((char)*v5);
    *v5 = result;
  }
  return result;
}

uint64_t cva::utils::string::to_lower(uint64_t result)
{
  uint64_t v1;
  int v2;
  _BYTE *v3;
  _BYTE *v4;
  _BYTE *v5;

  v1 = *(unsigned __int8 *)(result + 23);
  v2 = (char)v1;
  v3 = (_BYTE *)(result + v1);
  if (v2 >= 0)
    v4 = v3;
  else
    v4 = (_BYTE *)(*(_QWORD *)result + *(_QWORD *)(result + 8));
  if (v2 >= 0)
    v5 = (_BYTE *)result;
  else
    v5 = *(_BYTE **)result;
  for (; v5 != v4; ++v5)
  {
    result = __tolower((char)*v5);
    *v5 = result;
  }
  return result;
}

uint64_t cva::utils::string::iequals(char *a1, char *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  char *v6;
  char *v7;
  uint64_t v8;
  __darwin_ct_rune_t v9;
  __darwin_ct_rune_t v10;
  __darwin_ct_rune_t v11;
  __darwin_ct_rune_t v12;
  uint64_t result;
  BOOL v14;

  v2 = a1[23];
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *((_QWORD *)a1 + 1);
  v4 = a2[23];
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *((_QWORD *)a2 + 1);
  if (v2 != v4)
    return 0;
  if (v5 >= 0)
    v6 = a2;
  else
    v6 = *(char **)a2;
  if (!v2)
    return 1;
  if (v3 >= 0)
    v7 = a1;
  else
    v7 = *(char **)a1;
  v8 = v2 - 1;
  do
  {
    v10 = *v6++;
    v9 = v10;
    v11 = *v7++;
    v12 = __toupper(v9);
    v14 = v12 == __toupper(v11);
    result = v14;
    v14 = !v14 || v8-- == 0;
  }
  while (!v14);
  return result;
}

uint64_t cva::utils::string::istarts_with(char *a1, char *a2)
{
  unint64_t v2;
  int v3;
  unint64_t v4;
  int v5;
  uint64_t result;
  char *v7;
  char *v8;
  unint64_t v9;
  __darwin_ct_rune_t v10;
  __darwin_ct_rune_t v11;
  __darwin_ct_rune_t v12;
  __darwin_ct_rune_t v13;
  BOOL v14;

  v2 = a2[23];
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *((_QWORD *)a2 + 1);
  v4 = a1[23];
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *((_QWORD *)a1 + 1);
  if (v2 > v4)
    return 0;
  if (v3 >= 0)
    v7 = a2;
  else
    v7 = *(char **)a2;
  if (!v2)
    return 1;
  if (v5 >= 0)
    v8 = a1;
  else
    v8 = *(char **)a1;
  v9 = v2 - 1;
  do
  {
    v11 = *v7++;
    v10 = v11;
    v12 = *v8++;
    v13 = __toupper(v10);
    v14 = v13 == __toupper(v12);
    result = v14;
    v14 = !v14 || v9-- == 0;
  }
  while (!v14);
  return result;
}

uint64_t cva::utils::string::iends_with(uint64_t *a1, char *a2)
{
  unint64_t v2;
  int v3;
  unint64_t v4;
  int v5;
  uint64_t result;
  char *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  __darwin_ct_rune_t v11;
  __darwin_ct_rune_t v12;
  __darwin_ct_rune_t v13;
  BOOL v14;

  v2 = a2[23];
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *((_QWORD *)a2 + 1);
  v4 = *((unsigned __int8 *)a1 + 23);
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = a1[1];
  if (v2 > v4)
    return 0;
  if (v3 >= 0)
    v7 = a2;
  else
    v7 = *(char **)a2;
  if (!v2)
    return 1;
  v8 = (uint64_t *)*a1;
  if (v5 >= 0)
    v8 = a1;
  v9 = (uint64_t)v8 + v4;
  v10 = -(uint64_t)v2;
  do
  {
    v11 = *v7++;
    v12 = *(char *)(v9 + v10);
    v13 = __toupper(v11);
    v14 = v13 == __toupper(v12);
    result = v14;
    v14 = !v14 || v10++ == -1;
  }
  while (!v14);
  return result;
}

BOOL cva::utils::string::icontains(uint64_t a1, __int128 *a2)
{
  void **v3;
  void **v4;
  int64_t v5;
  char v6;
  int64_t v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char v12;
  void **v13;
  int64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  int v20;
  void **v21;
  uint64_t v22;
  char *v23;
  __int128 v24;
  uint64_t v25;
  void *__p[2];
  uint64_t v27;

  if (*(char *)(a1 + 23) < 0)
  {
    sub_20AB88C14(__p, *(void **)a1, *(_QWORD *)(a1 + 8));
    if ((*((char *)a2 + 23) & 0x80000000) == 0)
      goto LABEL_3;
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a1;
    v27 = *(_QWORD *)(a1 + 16);
    if ((*((char *)a2 + 23) & 0x80000000) == 0)
    {
LABEL_3:
      v24 = *a2;
      v25 = *((_QWORD *)a2 + 2);
      goto LABEL_6;
    }
  }
  sub_20AB88C14(&v24, *(void **)a2, *((_QWORD *)a2 + 1));
LABEL_6:
  if (v27 >= 0)
    v3 = (void **)((char *)__p + HIBYTE(v27));
  else
    v3 = (void **)((char *)__p[0] + (unint64_t)__p[1]);
  if (v27 >= 0)
    v4 = __p;
  else
    v4 = (void **)__p[0];
  for (; v4 != v3; v4 = (void **)((char *)v4 + 1))
    *(_BYTE *)v4 = __toupper(*(char *)v4);
  v5 = HIBYTE(v25);
  v6 = HIBYTE(v25);
  v7 = *((_QWORD *)&v24 + 1);
  v8 = (char *)v24;
  v9 = (char *)&v24;
  if (v25 >= 0)
    v10 = (char *)&v24 + HIBYTE(v25);
  else
    v10 = (char *)(v24 + *((_QWORD *)&v24 + 1));
  if (v25 >= 0)
    v11 = (char *)&v24;
  else
    v11 = (char *)v24;
  if (v11 != v10)
  {
    do
    {
      *v11 = __toupper(*v11);
      ++v11;
    }
    while (v11 != v10);
    v5 = HIBYTE(v25);
    v7 = *((_QWORD *)&v24 + 1);
    v8 = (char *)v24;
    v6 = HIBYTE(v25);
  }
  v12 = HIBYTE(v27);
  if (v27 >= 0)
    v13 = __p;
  else
    v13 = (void **)__p[0];
  if (v6 >= 0)
  {
    v14 = v5;
  }
  else
  {
    v9 = v8;
    v14 = v7;
  }
  if (v14)
  {
    v15 = (uint64_t)__p[1];
    if (v27 >= 0)
      v15 = HIBYTE(v27);
    v16 = (char *)v13 + v15;
    if (v15 >= v14)
    {
      v20 = *v9;
      v21 = v13;
      do
      {
        v22 = v15 - v14;
        if (v22 == -1)
          break;
        v23 = (char *)memchr(v21, v20, v22 + 1);
        if (!v23)
          break;
        v17 = v23;
        if (!memcmp(v23, v9, v14))
          goto LABEL_34;
        v21 = (void **)(v17 + 1);
        v15 = v16 - (v17 + 1);
      }
      while (v15 >= v14);
    }
    v17 = v16;
LABEL_34:
    if (v17 == v16)
      v18 = -1;
    else
      v18 = v17 - (char *)v13;
    if (v6 < 0)
      goto LABEL_38;
  }
  else
  {
    v18 = 0;
    if (v6 < 0)
    {
LABEL_38:
      operator delete(v8);
      v12 = HIBYTE(v27);
    }
  }
  if (v12 < 0)
    operator delete(__p[0]);
  return v18 != -1;
}

void cva::VecLibSparse<float>::multiply(uint64_t a1, __int128 *a2, __int128 *a3)
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  _OWORD v8[2];
  uint64_t v9;

  v3 = *(_OWORD *)(a1 + 16);
  v8[0] = *(_OWORD *)a1;
  v8[1] = v3;
  v9 = *(_QWORD *)(a1 + 32);
  v6 = *a2;
  v7 = *((_QWORD *)a2 + 2);
  v4 = *a3;
  v5 = *((_QWORD *)a3 + 2);
  sub_20ABDFC94((uint64_t)v8, (int *)&v6, (uint64_t)&v4, 1.0);
}

void sub_20ABDFC94(uint64_t a1, int *a2, uint64_t a3, float a4)
{
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  __int128 v16;
  NSObject *v17;
  const char *v18;
  DenseMatrix_Float v19;
  DenseMatrix_Float x;
  SparseMatrix_Float A;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[14];
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a3 + 8);
  v5 = *(_DWORD *)a3;
  if (v4 >= *(_DWORD *)a3)
  {
    v7 = a2[2];
    v8 = *a2;
    if (v7 >= *a2)
    {
      v9 = *(_WORD *)(a3 + 12);
      if ((v9 & 1) == 0)
        v5 = *(_DWORD *)(a3 + 4);
      v10 = a2[(a2[3] & 1) == 0];
      v11 = *(_DWORD *)(a3 + 4 * (v9 & 1));
      v12 = a2[a2[3] & 1];
      if (v5 == v10)
      {
        if (v5 <= 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v23 = "Y";
            v24 = 1024;
            v25 = v11;
            v26 = 1024;
            *(_DWORD *)v27 = v5;
            _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", buf, 0x18u);
          }
          goto LABEL_24;
        }
        v13 = *(unsigned __int8 *)(a1 + 28);
        v14 = *(_DWORD *)(a1 + 4 * (*(_WORD *)(a1 + 24) & 1)) * v13;
        v15 = *(_DWORD *)(a1 + 4 * ((*(_WORD *)(a1 + 24) & 1) == 0)) * v13;
        if (v11 == v14)
        {
          if (v12 == v15)
          {
            v16 = *(_OWORD *)(a1 + 16);
            *(_OWORD *)&A.structure.rowCount = *(_OWORD *)a1;
            *(_OWORD *)&A.structure.rowIndices = v16;
            A.data = *(float **)(a1 + 32);
            x = *(DenseMatrix_Float *)a2;
            v19 = *(DenseMatrix_Float *)a3;
            _SparseSpMV_Float(a4, &A, &x, 0, &v19);
            return;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_DWORD *)buf = 136316418;
          v23 = "X";
          v24 = 1024;
          v25 = v12;
          v26 = 1024;
          *(_DWORD *)v27 = v5;
          *(_WORD *)&v27[4] = 2080;
          *(_QWORD *)&v27[6] = "matrix A";
          v28 = 1024;
          v29 = v15;
          v30 = 1024;
          v31 = v14;
          v17 = MEMORY[0x24BDACB70];
          v18 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_DWORD *)buf = 136316418;
          v23 = "Y";
          v24 = 1024;
          v25 = v11;
          v26 = 1024;
          *(_DWORD *)v27 = v5;
          *(_WORD *)&v27[4] = 2080;
          *(_QWORD *)&v27[6] = "matrix A";
          v28 = 1024;
          v29 = v15;
          v30 = 1024;
          v31 = v14;
          v17 = MEMORY[0x24BDACB70];
          v18 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
        }
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_24;
        *(_DWORD *)buf = 136316418;
        v23 = "Y";
        v24 = 1024;
        v25 = v11;
        v26 = 1024;
        *(_DWORD *)v27 = v5;
        *(_WORD *)&v27[4] = 2080;
        *(_QWORD *)&v27[6] = "X";
        v28 = 1024;
        v29 = v12;
        v30 = 1024;
        v31 = v10;
        v17 = MEMORY[0x24BDACB70];
        v18 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
      }
      _os_log_error_impl(&dword_20AB80000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x2Eu);
      goto LABEL_24;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v23 = "X";
      v24 = 1024;
      v25 = v7;
      v26 = 2080;
      *(_QWORD *)v27 = "X";
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)&v27[10] = v8;
      v6 = MEMORY[0x24BDACB70];
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v23 = "Y";
    v24 = 1024;
    v25 = v4;
    v26 = 2080;
    *(_QWORD *)v27 = "Y";
    *(_WORD *)&v27[8] = 1024;
    *(_DWORD *)&v27[10] = v5;
    v6 = MEMORY[0x24BDACB70];
LABEL_7:
    _os_log_error_impl(&dword_20AB80000, v6, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", buf, 0x22u);
  }
LABEL_24:
  _SparseTrap();
}

void cva::VecLibSparse<float>::multiply(uint64_t a1, __int128 *a2, __int128 *a3, float a4)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  _OWORD v9[2];
  uint64_t v10;

  v4 = *(_OWORD *)(a1 + 16);
  v9[0] = *(_OWORD *)a1;
  v9[1] = v4;
  v10 = *(_QWORD *)(a1 + 32);
  v7 = *a2;
  v8 = *((_QWORD *)a2 + 2);
  v5 = *a3;
  v6 = *((_QWORD *)a3 + 2);
  sub_20ABDFC94((uint64_t)v9, (int *)&v7, (uint64_t)&v5, a4);
}

void cva::VecLibSparse<float>::multiply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  _OWORD v4[2];
  uint64_t v5;

  v3 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v3;
  v5 = *(_QWORD *)(a1 + 32);
  sub_20ABE0144((uint64_t)v4, *(_QWORD *)a2, *(float **)(a2 + 8), *(_QWORD *)a3, *(float **)(a3 + 8), 1.0);
}

void sub_20ABE0144(uint64_t a1, int a2, float *a3, int a4, float *a5, float a6)
{
  int v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  __int128 v15;
  NSObject *v16;
  const char *v17;
  DenseMatrix_Float v18;
  DenseMatrix_Float x;
  SparseMatrix_Float A;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = *(unsigned __int8 *)(a1 + 28);
  v8 = *(_WORD *)(a1 + 24) & 1;
  v9 = (_DWORD)v8 == 0;
  v10 = *(_DWORD *)(a1 + 4 * v8);
  v11 = v9;
  v12 = v10 * v7;
  v13 = *(_DWORD *)(a1 + 4 * v11) * v7;
  if (v13 != a2)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_DWORD *)buf = 67109888;
    v22 = v12;
    v23 = 1024;
    v24 = v13;
    v25 = 1024;
    v26 = a2;
    v27 = 1024;
    v28 = 1;
    v16 = MEMORY[0x24BDACB70];
    v17 = "Matrix dimensions (%dx%d) do not match x vector dimensions %dx%d\n";
LABEL_13:
    _os_log_error_impl(&dword_20AB80000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x1Au);
    goto LABEL_10;
  }
  if (v12 == a4)
  {
    v15 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&A.structure.rowCount = *(_OWORD *)a1;
    *(_OWORD *)&A.structure.rowIndices = v15;
    A.data = *(float **)(a1 + 32);
    x.rowCount = a2;
    x.columnCount = 1;
    x.columnStride = a2;
    x.attributes = 0;
    x.data = a3;
    v18.rowCount = a4;
    v18.columnCount = 1;
    v18.columnStride = a4;
    v18.attributes = 0;
    v18.data = a5;
    _SparseSpMV_Float(a6, &A, &x, 0, &v18);
    return;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109888;
    v22 = v12;
    v23 = 1024;
    v24 = a2;
    v25 = 1024;
    v26 = a4;
    v27 = 1024;
    v28 = 1;
    v16 = MEMORY[0x24BDACB70];
    v17 = "Matrix dimensions (%dx%d) do not match y vector dimensions %dx%d\n";
    goto LABEL_13;
  }
LABEL_10:
  _SparseTrap();
}

void cva::VecLibSparse<float>::multiply(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  __int128 v4;
  _OWORD v5[2];
  uint64_t v6;

  v4 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v4;
  v6 = *(_QWORD *)(a1 + 32);
  sub_20ABE0144((uint64_t)v5, *(_QWORD *)a2, *(float **)(a2 + 8), *(_QWORD *)a3, *(float **)(a3 + 8), a4);
}

void cva::VecLibSparse<float>::multiplyAdd(uint64_t a1, __int128 *a2, __int128 *a3)
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  _OWORD v8[2];
  uint64_t v9;

  v3 = *(_OWORD *)(a1 + 16);
  v8[0] = *(_OWORD *)a1;
  v8[1] = v3;
  v9 = *(_QWORD *)(a1 + 32);
  v6 = *a2;
  v7 = *((_QWORD *)a2 + 2);
  v4 = *a3;
  v5 = *((_QWORD *)a3 + 2);
  sub_20ABE0388((uint64_t)v8, (int *)&v6, (uint64_t)&v4, 1.0);
}

void sub_20ABE0388(uint64_t a1, int *a2, uint64_t a3, float a4)
{
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  __int128 v16;
  NSObject *v17;
  const char *v18;
  DenseMatrix_Float v19;
  DenseMatrix_Float x;
  SparseMatrix_Float A;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[14];
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a3 + 8);
  v5 = *(_DWORD *)a3;
  if (v4 >= *(_DWORD *)a3)
  {
    v7 = a2[2];
    v8 = *a2;
    if (v7 >= *a2)
    {
      v9 = *(_WORD *)(a3 + 12);
      if ((v9 & 1) == 0)
        v5 = *(_DWORD *)(a3 + 4);
      v10 = a2[(a2[3] & 1) == 0];
      v11 = *(_DWORD *)(a3 + 4 * (v9 & 1));
      v12 = a2[a2[3] & 1];
      if (v5 == v10)
      {
        if (v5 <= 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v23 = "Y";
            v24 = 1024;
            v25 = v11;
            v26 = 1024;
            *(_DWORD *)v27 = v5;
            _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", buf, 0x18u);
          }
          goto LABEL_24;
        }
        v13 = *(unsigned __int8 *)(a1 + 28);
        v14 = *(_DWORD *)(a1 + 4 * (*(_WORD *)(a1 + 24) & 1)) * v13;
        v15 = *(_DWORD *)(a1 + 4 * ((*(_WORD *)(a1 + 24) & 1) == 0)) * v13;
        if (v11 == v14)
        {
          if (v12 == v15)
          {
            v16 = *(_OWORD *)(a1 + 16);
            *(_OWORD *)&A.structure.rowCount = *(_OWORD *)a1;
            *(_OWORD *)&A.structure.rowIndices = v16;
            A.data = *(float **)(a1 + 32);
            x = *(DenseMatrix_Float *)a2;
            v19 = *(DenseMatrix_Float *)a3;
            _SparseSpMV_Float(a4, &A, &x, 1, &v19);
            return;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_DWORD *)buf = 136316418;
          v23 = "X";
          v24 = 1024;
          v25 = v12;
          v26 = 1024;
          *(_DWORD *)v27 = v5;
          *(_WORD *)&v27[4] = 2080;
          *(_QWORD *)&v27[6] = "matrix A";
          v28 = 1024;
          v29 = v15;
          v30 = 1024;
          v31 = v14;
          v17 = MEMORY[0x24BDACB70];
          v18 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_DWORD *)buf = 136316418;
          v23 = "Y";
          v24 = 1024;
          v25 = v11;
          v26 = 1024;
          *(_DWORD *)v27 = v5;
          *(_WORD *)&v27[4] = 2080;
          *(_QWORD *)&v27[6] = "matrix A";
          v28 = 1024;
          v29 = v15;
          v30 = 1024;
          v31 = v14;
          v17 = MEMORY[0x24BDACB70];
          v18 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
        }
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_24;
        *(_DWORD *)buf = 136316418;
        v23 = "Y";
        v24 = 1024;
        v25 = v11;
        v26 = 1024;
        *(_DWORD *)v27 = v5;
        *(_WORD *)&v27[4] = 2080;
        *(_QWORD *)&v27[6] = "X";
        v28 = 1024;
        v29 = v12;
        v30 = 1024;
        v31 = v10;
        v17 = MEMORY[0x24BDACB70];
        v18 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
      }
      _os_log_error_impl(&dword_20AB80000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x2Eu);
      goto LABEL_24;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v23 = "X";
      v24 = 1024;
      v25 = v7;
      v26 = 2080;
      *(_QWORD *)v27 = "X";
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)&v27[10] = v8;
      v6 = MEMORY[0x24BDACB70];
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v23 = "Y";
    v24 = 1024;
    v25 = v4;
    v26 = 2080;
    *(_QWORD *)v27 = "Y";
    *(_WORD *)&v27[8] = 1024;
    *(_DWORD *)&v27[10] = v5;
    v6 = MEMORY[0x24BDACB70];
LABEL_7:
    _os_log_error_impl(&dword_20AB80000, v6, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", buf, 0x22u);
  }
LABEL_24:
  _SparseTrap();
}

void cva::VecLibSparse<float>::multiplyAdd(uint64_t a1, __int128 *a2, __int128 *a3, float a4)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  _OWORD v9[2];
  uint64_t v10;

  v4 = *(_OWORD *)(a1 + 16);
  v9[0] = *(_OWORD *)a1;
  v9[1] = v4;
  v10 = *(_QWORD *)(a1 + 32);
  v7 = *a2;
  v8 = *((_QWORD *)a2 + 2);
  v5 = *a3;
  v6 = *((_QWORD *)a3 + 2);
  sub_20ABE0388((uint64_t)v9, (int *)&v7, (uint64_t)&v5, a4);
}

void cva::VecLibSparse<float>::multiplyAdd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  _OWORD v4[2];
  uint64_t v5;

  v3 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v3;
  v5 = *(_QWORD *)(a1 + 32);
  sub_20ABE0838((uint64_t)v4, *(_QWORD *)a2, *(float **)(a2 + 8), *(_QWORD *)a3, *(float **)(a3 + 8), 1.0);
}

void sub_20ABE0838(uint64_t a1, int a2, float *a3, int a4, float *a5, float a6)
{
  int v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  __int128 v15;
  NSObject *v16;
  const char *v17;
  DenseMatrix_Float v18;
  DenseMatrix_Float x;
  SparseMatrix_Float A;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = *(unsigned __int8 *)(a1 + 28);
  v8 = *(_WORD *)(a1 + 24) & 1;
  v9 = (_DWORD)v8 == 0;
  v10 = *(_DWORD *)(a1 + 4 * v8);
  v11 = v9;
  v12 = v10 * v7;
  v13 = *(_DWORD *)(a1 + 4 * v11) * v7;
  if (v13 != a2)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_DWORD *)buf = 67109888;
    v22 = v12;
    v23 = 1024;
    v24 = v13;
    v25 = 1024;
    v26 = a2;
    v27 = 1024;
    v28 = 1;
    v16 = MEMORY[0x24BDACB70];
    v17 = "Matrix dimensions (%dx%d) do not match x vector dimensions %dx%d\n";
LABEL_13:
    _os_log_error_impl(&dword_20AB80000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x1Au);
    goto LABEL_10;
  }
  if (v12 == a4)
  {
    v15 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&A.structure.rowCount = *(_OWORD *)a1;
    *(_OWORD *)&A.structure.rowIndices = v15;
    A.data = *(float **)(a1 + 32);
    x.rowCount = a2;
    x.columnCount = 1;
    x.columnStride = a2;
    x.attributes = 0;
    x.data = a3;
    v18.rowCount = a4;
    v18.columnCount = 1;
    v18.columnStride = a4;
    v18.attributes = 0;
    v18.data = a5;
    _SparseSpMV_Float(a6, &A, &x, 1, &v18);
    return;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109888;
    v22 = v12;
    v23 = 1024;
    v24 = a2;
    v25 = 1024;
    v26 = a4;
    v27 = 1024;
    v28 = 1;
    v16 = MEMORY[0x24BDACB70];
    v17 = "Matrix dimensions (%dx%d) do not match y vector dimensions %dx%d\n";
    goto LABEL_13;
  }
LABEL_10:
  _SparseTrap();
}

void cva::VecLibSparse<float>::multiplyAdd(uint64_t a1, uint64_t a2, uint64_t a3, float a4)
{
  __int128 v4;
  _OWORD v5[2];
  uint64_t v6;

  v4 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v4;
  v6 = *(_QWORD *)(a1 + 32);
  sub_20ABE0838((uint64_t)v5, *(_QWORD *)a2, *(float **)(a2 + 8), *(_QWORD *)a3, *(float **)(a3 + 8), a4);
}

double cva::VecLibSparse<float>::transpose@<D0>(__int128 *a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v3 = a1[5];
  v16 = a1[4];
  v17 = v3;
  v4 = a1[7];
  v18 = a1[6];
  v19 = v4;
  v5 = a1[1];
  v12 = *a1;
  v13 = v5;
  v6 = a1[3];
  v14 = a1[2];
  v15 = v6;
  LOWORD(v12) = v12 ^ 1;
  _SparseRetainNumeric_Float((SparseOpaqueFactorization_Float *)((char *)&v12 + 8));
  v7 = v17;
  a2[4] = v16;
  a2[5] = v7;
  v8 = v19;
  a2[6] = v18;
  a2[7] = v8;
  v9 = v13;
  *a2 = v12;
  a2[1] = v9;
  result = *(double *)&v14;
  v11 = v15;
  a2[2] = v14;
  a2[3] = v11;
  return result;
}

__n128 cva::VecLibSparse<float>::transpose@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  SparseOpaqueFactorization_Float v9;
  uint64_t v10;

  v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v9.userFactorStorage = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v9.solveWorkspaceRequiredStatic = v3;
  v10 = *(_QWORD *)(a1 + 96);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v9.status = *(_OWORD *)a1;
  *(_OWORD *)&v9.symbolicFactorization.columnCount = v4;
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v9.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v9.symbolicFactorization.factorSize_Float = v5;
  *(_WORD *)&v9.attributes ^= 1u;
  _SparseRetainNumeric_Float(&v9);
  v6 = *(_OWORD *)&v9.solveWorkspaceRequiredStatic;
  *(_OWORD *)(a2 + 64) = *(_OWORD *)&v9.userFactorStorage;
  *(_OWORD *)(a2 + 80) = v6;
  *(_QWORD *)(a2 + 96) = v10;
  v7 = *(_OWORD *)&v9.symbolicFactorization.columnCount;
  *(_OWORD *)a2 = *(_OWORD *)&v9.status;
  *(_OWORD *)(a2 + 16) = v7;
  result = *(__n128 *)&v9.symbolicFactorization.factorSize_Float;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v9.symbolicFactorization.workspaceSize_Float;
  *(__n128 *)(a2 + 48) = result;
  return result;
}

{
  __n128 result;
  __int16 v3;

  result = *(__n128 *)a1;
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 16);
  v3 = *(_WORD *)(a1 + 24);
  *(_QWORD *)(a2 + 26) = *(_QWORD *)(a1 + 26);
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  *(_WORD *)(a2 + 24) = v3 ^ 1;
  return result;
}

void cva::VecLibSparse<float>::release(_OWORD *a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD v5[8];

  v1 = a1[5];
  v5[4] = a1[4];
  v5[5] = v1;
  v2 = a1[7];
  v5[6] = a1[6];
  v5[7] = v2;
  v3 = a1[1];
  v5[0] = *a1;
  v5[1] = v3;
  v4 = a1[3];
  v5[2] = a1[2];
  v5[3] = v4;
  _SparseDestroyOpaqueNumeric_Float((SparseOpaqueFactorization_Float *)((char *)v5 + 8));
}

__n128 cva::VecLibSparse<float>::release(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __n128 result;
  SparseOpaqueFactorization_Float v5;
  uint64_t v6;

  v1 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v5.userFactorStorage = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v5.solveWorkspaceRequiredStatic = v1;
  v6 = *(_QWORD *)(a1 + 96);
  v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v5.status = *(_OWORD *)a1;
  *(_OWORD *)&v5.symbolicFactorization.columnCount = v2;
  v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v5.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v5.symbolicFactorization.factorSize_Float = v3;
  _SparseDestroyOpaqueNumeric_Float(&v5);
  return result;
}

void cva::VecLibSparse<float>::retain(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  void (*v4)(_BYTE *);
  NSObject *v5;
  SparseOpaqueFactorization_Float v6;
  uint64_t v7;
  _BYTE v8[63];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v6.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v6.symbolicFactorization.factorSize_Float = v1;
  v2 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v6.userFactorStorage = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v6.solveWorkspaceRequiredStatic = v2;
  v7 = *(_QWORD *)(a1 + 96);
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v6.status = *(_OWORD *)a1;
  *(_OWORD *)&v6.symbolicFactorization.columnCount = v3;
  if (v6.symbolicFactorization.status || !v6.symbolicFactorization.workspaceSize_Float)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      v5 = MEMORY[0x24BDACB70];
      goto LABEL_14;
    }
LABEL_7:
    _SparseTrap();
    return;
  }
  _SparseGetOptionsFromSymbolicFactor((SparseSymbolicFactorOptions *)v8, &v6.symbolicFactorization);
  v4 = *(void (**)(_BYTE *))&v8[40];
  if (v6.status == SparseStatusOK && v6.solveWorkspaceRequiredStatic)
  {
    _SparseRetainNumeric_Float(&v6);
    return;
  }
  if (!*(_QWORD *)&v8[40])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      v5 = MEMORY[0x24BDACB70];
LABEL_14:
      _os_log_error_impl(&dword_20AB80000, v5, OS_LOG_TYPE_ERROR, "Can only retain valid numeric factorizations.\n", v8, 2u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v21 = 0;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  *(_OWORD *)&v8[47] = 0u;
  strcpy(v8, "Can only retain valid numeric factorizations.\n");
  v4(v8);
}

void cva::VecLibSparse<float>::retain(__int128 *a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  void (__cdecl *reportError)(const char *);
  NSObject *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  SparseSymbolicFactorOptions v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v1 = a1[5];
  v11 = a1[4];
  v12 = v1;
  v2 = a1[7];
  v13 = a1[6];
  v14 = v2;
  v3 = a1[1];
  v7 = *a1;
  v8 = v3;
  v4 = a1[3];
  v9 = a1[2];
  v10 = v4;
  if ((_DWORD)v3 || !*((_QWORD *)&v9 + 1))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15.control) = 0;
      v6 = MEMORY[0x24BDACB70];
      goto LABEL_14;
    }
LABEL_7:
    _SparseTrap();
    return;
  }
  _SparseGetOptionsFromSymbolicFactor(&v15, (SparseOpaqueSymbolicFactorization *)&v8);
  reportError = v15.reportError;
  if (!DWORD2(v7) && *((_QWORD *)&v12 + 1))
  {
    _SparseRetainNumeric_Float((SparseOpaqueFactorization_Float *)((char *)&v7 + 8));
    return;
  }
  if (!v15.reportError)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15.control) = 0;
      v6 = MEMORY[0x24BDACB70];
LABEL_14:
      _os_log_error_impl(&dword_20AB80000, v6, OS_LOG_TYPE_ERROR, "Can only retain valid objects.\n", (uint8_t *)&v15, 2u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  *(_OWORD *)&v15.free = 0u;
  v16 = 0u;
  strcpy((char *)&v15, "Can only retain valid objects.\n");
  ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v15);
}

double cva::VecLibSparse<float>::factor@<D0>(SparseFactorization_t factorType@<W1>, uint64_t a2@<X0>, uint64_t a3@<X8>)
{
  __int128 v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint32_t v8;
  double result;
  SparseNumericFactorOptions v10;
  SparseSymbolicFactorOptions sfoptions;
  SparseMatrix_Float Matrix;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int rowCount;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int columnCount;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&Matrix.structure.rowCount = *(_OWORD *)a2;
  *(_OWORD *)&Matrix.structure.rowIndices = v4;
  Matrix.data = *(float **)(a2 + 32);
  sfoptions = *(SparseSymbolicFactorOptions *)byte_24C37F3A8;
  v10 = *(SparseNumericFactorOptions *)ymmword_20AC062B0;
  if (Matrix.structure.rowCount <= 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136315394;
    v14 = "Matrix.structure";
    v15 = 1024;
    LODWORD(v16) = Matrix.structure.rowCount;
    v6 = MEMORY[0x24BDACB70];
    v7 = "%s.rowCount must be > 0, but is %d.\n";
LABEL_14:
    v8 = 18;
    goto LABEL_15;
  }
  if (Matrix.structure.columnCount <= 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136315394;
    v14 = "Matrix.structure";
    v15 = 1024;
    LODWORD(v16) = Matrix.structure.rowCount;
    v6 = MEMORY[0x24BDACB70];
    v7 = "%s.columnCount must be > 0, but is %d.\n";
    goto LABEL_14;
  }
  if (!*(&Matrix.structure.blockSize + 2))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136315394;
    v14 = "Matrix.structure";
    v15 = 1024;
    LODWORD(v16) = 0;
    v6 = MEMORY[0x24BDACB70];
    v7 = "%s.blockSize must be > 0, but is %d.]n";
    goto LABEL_14;
  }
  v5 = *(_BYTE *)&Matrix.structure.attributes & 0xC;
  if (Matrix.structure.rowCount == Matrix.structure.columnCount || v5 != 12)
  {
    if ((factorType & 0xFE) == 0x28)
    {
      _SparseFactorQR_Float((SparseOpaqueFactorization_Float *)a3, factorType, &Matrix, &sfoptions, &v10);
      return result;
    }
    if (v5 == 12)
    {
      _SparseFactorSymmetric_Float((SparseOpaqueFactorization_Float *)a3, factorType, &Matrix, &sfoptions, &v10);
      return result;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v6 = MEMORY[0x24BDACB70];
      v7 = "Cannot perform symmetric matrix factorization of non-square matrix.\n";
      v8 = 2;
      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v14 = "Matrix.structure";
    v15 = 2080;
    v16 = "Matrix.structure";
    v17 = 1024;
    rowCount = Matrix.structure.rowCount;
    v19 = 2080;
    v20 = "Matrix.structure";
    v21 = 1024;
    columnCount = Matrix.structure.columnCount;
    v6 = MEMORY[0x24BDACB70];
    v7 = "%s.attributes.kind=SparseSymmetric, but %s.rowCount (%d) != %s.columnCount (%d).\n";
    v8 = 44;
LABEL_15:
    _os_log_error_impl(&dword_20AB80000, v6, OS_LOG_TYPE_ERROR, v7, buf, v8);
  }
LABEL_21:
  _SparseTrap();
  result = 0.0;
  *(_QWORD *)(a3 + 96) = 0;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_DWORD *)a3 = -4;
  *(_DWORD *)(a3 + 8) = -4;
  return result;
}

void cva::VecLibSparse<float>::refactor(__int128 *a1, SparseOpaqueFactorization_Float *factor)
{
  SparseOpaqueSymbolicFactorization *p_symbolicFactorization;
  void (__cdecl *free)(void *);
  void (__cdecl *reportError)(const char *);
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  size_t workspaceSize_Double;
  __int128 v11;
  __int128 v12;
  void (__cdecl *v13)(void *);
  SparseNumericFactorOptions v14;
  SparseNumericFactorOptions v15;
  SparseNumericFactorOptions nfoptions;
  SparseSymbolicFactorOptions v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v11 = *a1;
  v12 = a1[1];
  v13 = (void (__cdecl *)(void *))*((_QWORD *)a1 + 4);
  p_symbolicFactorization = &factor->symbolicFactorization;
  if (factor->symbolicFactorization.status || !factor->symbolicFactorization.workspaceSize_Float)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    LOWORD(v17.control) = 0;
    v8 = MEMORY[0x24BDACB70];
    v9 = "Factorization does not hold a completed matrix factorization.\n";
LABEL_21:
    _os_log_error_impl(&dword_20AB80000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v17, 2u);
    goto LABEL_3;
  }
  memset(&v15, 0, sizeof(v15));
  _SparseGetOptionsFromNumericFactor_Float(&v15, factor);
  v14 = v15;
  if (factor->symbolicFactorization.status || !factor->symbolicFactorization.workspaceSize_Float)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    LOWORD(v17.control) = 0;
    v8 = MEMORY[0x24BDACB70];
    v9 = "Factorization does not hold a valid symbolic matrix factorization.\n";
    goto LABEL_21;
  }
  _SparseGetOptionsFromSymbolicFactor(&v17, p_symbolicFactorization);
  free = v17.free;
  reportError = v17.reportError;
  v6 = (void *)((uint64_t (*)(size_t))v17.malloc)(factor->symbolicFactorization.workspaceSize_Double);
  if (!v6)
  {
    factor->status = SparseInternalError;
    if (reportError)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v18 = 0u;
      memset(&v17, 0, sizeof(v17));
      snprintf((char *)&v17, 0x100uLL, "Failed to allocate workspace of size %ld.", factor->symbolicFactorization.workspaceSize_Double);
      ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v17);
      return;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      workspaceSize_Double = factor->symbolicFactorization.workspaceSize_Double;
      v17.control = 134217984;
      *(_QWORD *)&v17.orderMethod = workspaceSize_Double;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to allocate workspace of size %ld.", (uint8_t *)&v17, 0xCu);
    }
LABEL_3:
    _SparseTrap();
    return;
  }
  v7 = v6;
  *(_OWORD *)&v17.control = v11;
  *(_OWORD *)&v17.ignoreRowsAndColumns = v12;
  v17.free = v13;
  nfoptions = v14;
  if ((_DWORD)v11 == factor->symbolicFactorization.rowCount
    && *(_DWORD *)&v17.orderMethod == factor->symbolicFactorization.columnCount
    && BYTE4(v17.malloc) == LOBYTE(factor->symbolicFactorization.factorization)
    && ((*(_WORD *)&factor->symbolicFactorization.attributes ^ LOWORD(v17.malloc)) & 1) == 0)
  {
    if ((BYTE1(factor->symbolicFactorization.factorization) & 0xFE) == 0x28)
      _SparseRefactorQR_Float((const SparseMatrix_Float *)&v17, factor, &nfoptions, v6);
    else
      _SparseRefactorSymmetric_Float((const SparseMatrix_Float *)&v17, factor, &nfoptions, v6);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "Matrix";
      v33 = 2080;
      v34 = "Factored->symbolicFactorization";
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s does not match that used for symbolic factorization stored in %s.\n", buf, 0x16u);
    }
    _SparseTrap();
  }
  ((void (*)(void *))free)(v7);
}

void cva::VecLibSparse<float>::solve(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  SparseControl_t v12;
  int *v13;
  int v14;
  float *v15;
  void (__cdecl *reportError)(const char *);
  int v17;
  int v18;
  int v19;
  int v20;
  float *v21;
  int v22;
  float *v23;
  int v24;
  int v25;
  int v26;
  void (__cdecl *free)(void *);
  size_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  SparseOpaqueFactorization_Float v34;
  uint64_t v35;
  SparseOpaqueFactorization_Float Factored;
  uint64_t v37;
  DenseMatrix_Float v38;
  DenseMatrix_Float Soln;
  SparseSymbolicFactorOptions v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v4 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&Factored.userFactorStorage = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&Factored.solveWorkspaceRequiredStatic = v4;
    v37 = *(_QWORD *)(a1 + 96);
    v5 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&Factored.status = *(_OWORD *)a1;
    *(_OWORD *)&Factored.symbolicFactorization.columnCount = v5;
    v6 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)&Factored.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
    *(_OWORD *)&Factored.symbolicFactorization.factorSize_Float = v6;
    if (Factored.symbolicFactorization.status == SparseStatusOK && Factored.symbolicFactorization.workspaceSize_Float)
    {
      v12 = *(_DWORD *)a3;
      v13 = *(int **)(a3 + 8);
      v14 = *(_DWORD *)a2;
      v15 = *(float **)(a2 + 8);
      _SparseGetOptionsFromSymbolicFactor(&v40, &Factored.symbolicFactorization);
      reportError = v40.reportError;
      if (Factored.symbolicFactorization.status == SparseStatusOK
        && Factored.symbolicFactorization.workspaceSize_Float
        && Factored.status == SparseStatusOK
        && Factored.solveWorkspaceRequiredStatic)
      {
        if (((*(_BYTE *)&Factored.attributes ^ *(_BYTE *)&Factored.symbolicFactorization.attributes) & 1) != 0)
          v17 = Factored.symbolicFactorization.columnCount * LOBYTE(Factored.symbolicFactorization.factorization);
        else
          v17 = Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization);
        if (((*(_BYTE *)&Factored.attributes ^ *(_BYTE *)&Factored.symbolicFactorization.attributes) & 1) != 0)
          v18 = Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization);
        else
          v18 = Factored.symbolicFactorization.columnCount * LOBYTE(Factored.symbolicFactorization.factorization);
        if (BYTE1(Factored.symbolicFactorization.factorization) == 40)
          v19 = v17;
        else
          v19 = v18;
        if (v18 == v14)
        {
          if (v19 == v12)
          {
            v40.control = v12;
            *(_DWORD *)&v40.orderMethod = 1;
            v40.ignoreRowsAndColumns = v13;
            v40.order = (int *)v12;
            Soln.rowCount = v14;
            Soln.columnCount = 1;
            *(_DWORD *)&Soln.attributes = 0;
            Soln.data = v15;
            Soln.columnStride = v14;
            _SparseSolveOpaque_Float(&Factored, (const DenseMatrix_Float *)&v40, &Soln, a4);
            return;
          }
          if (v40.reportError)
            goto LABEL_62;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v40.control = 136316162;
            *(_QWORD *)&v40.orderMethod = "b";
            *(_DWORD *)((char *)&v40.order + 6) = v12;
            WORD1(v40.ignoreRowsAndColumns) = 2080;
            WORD2(v40.order) = 1024;
            *(int **)((char *)&v40.ignoreRowsAndColumns + 4) = (int *)"Factored";
            WORD2(v40.malloc) = 1024;
            *(_DWORD *)((char *)&v40.malloc + 6) = v19;
            WORD1(v40.free) = 1024;
            HIDWORD(v40.free) = v14;
            v33 = MEMORY[0x24BDACB70];
            goto LABEL_72;
          }
LABEL_7:
          _SparseTrap();
          return;
        }
        if (v40.reportError)
          goto LABEL_62;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v40.control = 136316162;
        *(_QWORD *)&v40.orderMethod = "x";
        *(_DWORD *)((char *)&v40.order + 6) = v14;
        WORD1(v40.ignoreRowsAndColumns) = 2080;
        WORD2(v40.order) = 1024;
        *(int **)((char *)&v40.ignoreRowsAndColumns + 4) = (int *)"Factored";
        WORD2(v40.malloc) = 1024;
        *(_DWORD *)((char *)&v40.malloc + 6) = v19;
        WORD1(v40.free) = 1024;
        HIDWORD(v40.free) = v18;
        v33 = MEMORY[0x24BDACB70];
LABEL_72:
        _os_log_error_impl(&dword_20AB80000, v33, OS_LOG_TYPE_ERROR, "%s (size %dx1) does not match dimensions of matrix factorization %s (%d x %d).\n", (uint8_t *)&v40, 0x28u);
        goto LABEL_7;
      }
      if (!v40.reportError)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v40.control = 136315138;
        *(_QWORD *)&v40.orderMethod = "Factored";
        v31 = MEMORY[0x24BDACB70];
        v32 = "%s does not hold a completed matrix factorization.\n";
        goto LABEL_58;
      }
      goto LABEL_47;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    LOWORD(v40.control) = 0;
    v7 = MEMORY[0x24BDACB70];
LABEL_55:
    _os_log_error_impl(&dword_20AB80000, v7, OS_LOG_TYPE_ERROR, "Factored does not hold a completed matrix factorization.\n", (uint8_t *)&v40, 2u);
    goto LABEL_7;
  }
  v8 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v34.userFactorStorage = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v34.solveWorkspaceRequiredStatic = v8;
  v35 = *(_QWORD *)(a1 + 96);
  v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v34.status = *(_OWORD *)a1;
  *(_OWORD *)&v34.symbolicFactorization.columnCount = v9;
  v10 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v34.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v34.symbolicFactorization.factorSize_Float = v10;
  if (v34.symbolicFactorization.status || !v34.symbolicFactorization.workspaceSize_Float)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    LOWORD(v40.control) = 0;
    v7 = MEMORY[0x24BDACB70];
    goto LABEL_55;
  }
  v20 = *(_DWORD *)a3;
  v21 = *(float **)(a3 + 8);
  v22 = *(_DWORD *)a2;
  v23 = *(float **)(a2 + 8);
  _SparseGetOptionsFromSymbolicFactor(&v40, &v34.symbolicFactorization);
  reportError = v40.reportError;
  if (v34.symbolicFactorization.status == SparseStatusOK
    && v34.symbolicFactorization.workspaceSize_Float
    && v34.status == SparseStatusOK
    && v34.solveWorkspaceRequiredStatic)
  {
    if (((*(_BYTE *)&v34.attributes ^ *(_BYTE *)&v34.symbolicFactorization.attributes) & 1) != 0)
      v24 = v34.symbolicFactorization.columnCount * LOBYTE(v34.symbolicFactorization.factorization);
    else
      v24 = v34.symbolicFactorization.rowCount * LOBYTE(v34.symbolicFactorization.factorization);
    if (((*(_BYTE *)&v34.attributes ^ *(_BYTE *)&v34.symbolicFactorization.attributes) & 1) != 0)
      v25 = v34.symbolicFactorization.rowCount * LOBYTE(v34.symbolicFactorization.factorization);
    else
      v25 = v34.symbolicFactorization.columnCount * LOBYTE(v34.symbolicFactorization.factorization);
    if (BYTE1(v34.symbolicFactorization.factorization) == 40)
      v26 = v24;
    else
      v26 = v25;
    if (v25 != v22)
    {
      if (v40.reportError)
        goto LABEL_62;
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v40.control = 136316162;
      *(_QWORD *)&v40.orderMethod = "x";
      *(_DWORD *)((char *)&v40.order + 6) = v22;
      WORD1(v40.ignoreRowsAndColumns) = 2080;
      WORD2(v40.order) = 1024;
      *(int **)((char *)&v40.ignoreRowsAndColumns + 4) = (int *)"Factored";
      WORD2(v40.malloc) = 1024;
      *(_DWORD *)((char *)&v40.malloc + 6) = v26;
      WORD1(v40.free) = 1024;
      HIDWORD(v40.free) = v25;
      v33 = MEMORY[0x24BDACB70];
      goto LABEL_72;
    }
    if (v26 != v20)
    {
      if (!v40.reportError)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v40.control = 136316162;
          *(_QWORD *)&v40.orderMethod = "b";
          *(_DWORD *)((char *)&v40.order + 6) = v20;
          WORD1(v40.ignoreRowsAndColumns) = 2080;
          WORD2(v40.order) = 1024;
          *(int **)((char *)&v40.ignoreRowsAndColumns + 4) = (int *)"Factored";
          WORD2(v40.malloc) = 1024;
          *(_DWORD *)((char *)&v40.malloc + 6) = v26;
          WORD1(v40.free) = 1024;
          HIDWORD(v40.free) = v22;
          v33 = MEMORY[0x24BDACB70];
          goto LABEL_72;
        }
        goto LABEL_7;
      }
LABEL_62:
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v41 = 0u;
      memset(&v40, 0, sizeof(v40));
      snprintf((char *)&v40, 0x100uLL, "%s (size %dx1) does not match dimensions of matrix factorization %s (%d x %d).\n");
      goto LABEL_63;
    }
    free = v40.free;
    Soln.rowCount = v20;
    Soln.columnCount = 1;
    *(_DWORD *)&Soln.attributes = 0;
    Soln.data = v21;
    Soln.columnStride = v20;
    *(_DWORD *)&v38.attributes = 0;
    v38.data = v23;
    v38.rowCount = v22;
    v38.columnCount = 1;
    v38.columnStride = v22;
    v28 = v35 + v34.solveWorkspaceRequiredPerRHS;
    v29 = (void *)((uint64_t (*)(size_t))v40.malloc)(v35 + v34.solveWorkspaceRequiredPerRHS);
    if (v29)
    {
      v30 = v29;
      _SparseSolveOpaque_Float(&v34, &Soln, &v38, v29);
      ((void (*)(void *))free)(v30);
      return;
    }
    if (reportError)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v41 = 0u;
      memset(&v40, 0, sizeof(v40));
      snprintf((char *)&v40, 0x100uLL, "Failed to allocate workspace of size %ld for SparseSolve().\n");
      goto LABEL_63;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v40.control = 134217984;
    *(_QWORD *)&v40.orderMethod = v28;
    v31 = MEMORY[0x24BDACB70];
    v32 = "Failed to allocate workspace of size %ld for SparseSolve().\n";
LABEL_58:
    _os_log_error_impl(&dword_20AB80000, v31, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v40, 0xCu);
    goto LABEL_7;
  }
  if (!v40.reportError)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v40.control = 136315138;
    *(_QWORD *)&v40.orderMethod = "Factored";
    v31 = MEMORY[0x24BDACB70];
    v32 = "%s does not hold a completed matrix factorization.\n";
    goto LABEL_58;
  }
LABEL_47:
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  memset(&v40, 0, sizeof(v40));
  snprintf((char *)&v40, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
LABEL_63:
  ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v40);
}

void cva::VecLibSparse<float>::solve(uint64_t a1, DenseMatrix_Float *a2, DenseMatrix_Float *a3, void *a4)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void (__cdecl *reportError)(const char *);
  int v13;
  int v14;
  int v15;
  void (__cdecl *v16)(const char *);
  int v17;
  int v18;
  int v19;
  NSObject *v20;
  const char *v21;
  int rowCount;
  int columnCount;
  int v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  void (__cdecl *free)(void *);
  size_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  NSObject *v39;
  DenseMatrix_Float v40;
  DenseMatrix_Float v41;
  SparseOpaqueFactorization_Float v42;
  uint64_t v43;
  DenseMatrix_Float Soln;
  DenseMatrix_Float RHS;
  SparseOpaqueFactorization_Float Factored;
  uint64_t v47;
  SparseSymbolicFactorOptions v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v4 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&Factored.userFactorStorage = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&Factored.solveWorkspaceRequiredStatic = v4;
    v47 = *(_QWORD *)(a1 + 96);
    v5 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&Factored.status = *(_OWORD *)a1;
    *(_OWORD *)&Factored.symbolicFactorization.columnCount = v5;
    v6 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)&Factored.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
    *(_OWORD *)&Factored.symbolicFactorization.factorSize_Float = v6;
    RHS = *a3;
    Soln = *a2;
    if (Factored.symbolicFactorization.status == SparseStatusOK && Factored.symbolicFactorization.workspaceSize_Float)
    {
      _SparseGetOptionsFromSymbolicFactor(&v48, &Factored.symbolicFactorization);
      reportError = v48.reportError;
      if (Factored.symbolicFactorization.status == SparseStatusOK
        && Factored.symbolicFactorization.workspaceSize_Float
        && Factored.status == SparseStatusOK
        && Factored.solveWorkspaceRequiredStatic)
      {
        if (((*(_BYTE *)&Factored.attributes ^ *(_BYTE *)&Factored.symbolicFactorization.attributes) & 1) != 0)
          v13 = Factored.symbolicFactorization.columnCount * LOBYTE(Factored.symbolicFactorization.factorization);
        else
          v13 = Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization);
        if (((*(_BYTE *)&Factored.attributes ^ *(_BYTE *)&Factored.symbolicFactorization.attributes) & 1) != 0)
          v14 = Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization);
        else
          v14 = Factored.symbolicFactorization.columnCount * LOBYTE(Factored.symbolicFactorization.factorization);
        if (BYTE1(Factored.symbolicFactorization.factorization) == 40)
          v15 = v13;
        else
          v15 = v14;
        if (RHS.columnStride < RHS.rowCount)
        {
          if (v48.reportError)
            goto LABEL_48;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v48.control = 136315906;
            *(_QWORD *)&v48.orderMethod = "B";
            WORD2(v48.order) = 1024;
            *(_DWORD *)((char *)&v48.order + 6) = RHS.columnStride;
            WORD1(v48.ignoreRowsAndColumns) = 2080;
            *(int **)((char *)&v48.ignoreRowsAndColumns + 4) = (int *)"B";
            WORD2(v48.malloc) = 1024;
            *(_DWORD *)((char *)&v48.malloc + 6) = RHS.rowCount;
            v26 = MEMORY[0x24BDACB70];
LABEL_108:
            _os_log_error_impl(&dword_20AB80000, v26, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", (uint8_t *)&v48, 0x22u);
            goto LABEL_7;
          }
          goto LABEL_7;
        }
        if (Soln.columnStride < Soln.rowCount)
        {
          if (v48.reportError)
          {
LABEL_48:
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            v49 = 0u;
            memset(&v48, 0, sizeof(v48));
            snprintf((char *)&v48, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
            goto LABEL_49;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v48.control = 136315906;
            *(_QWORD *)&v48.orderMethod = "X";
            WORD2(v48.order) = 1024;
            *(_DWORD *)((char *)&v48.order + 6) = Soln.columnStride;
            WORD1(v48.ignoreRowsAndColumns) = 2080;
            *(int **)((char *)&v48.ignoreRowsAndColumns + 4) = (int *)"X";
            WORD2(v48.malloc) = 1024;
            *(_DWORD *)((char *)&v48.malloc + 6) = Soln.rowCount;
            v26 = MEMORY[0x24BDACB70];
            goto LABEL_108;
          }
          goto LABEL_7;
        }
        if ((*(_BYTE *)&RHS.attributes & 1) != 0)
          rowCount = RHS.rowCount;
        else
          rowCount = RHS.columnCount;
        if ((*(_BYTE *)&RHS.attributes & 1) != 0)
          columnCount = RHS.columnCount;
        else
          columnCount = RHS.rowCount;
        if ((*(_BYTE *)&Soln.attributes & 1) != 0)
          v24 = Soln.rowCount;
        else
          v24 = Soln.columnCount;
        if ((*(_BYTE *)&Soln.attributes & 1) != 0)
          v25 = Soln.columnCount;
        else
          v25 = Soln.rowCount;
        if (rowCount != v24)
        {
          if (v48.reportError)
          {
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            v49 = 0u;
            memset(&v48, 0, sizeof(v48));
            snprintf((char *)&v48, 0x100uLL, "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n", "B");
            goto LABEL_49;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_7;
          v48.control = 136316418;
          *(_QWORD *)&v48.orderMethod = "B";
          WORD2(v48.order) = 1024;
          *(_DWORD *)((char *)&v48.order + 6) = columnCount;
          WORD1(v48.ignoreRowsAndColumns) = 1024;
          HIDWORD(v48.ignoreRowsAndColumns) = rowCount;
          LOWORD(v48.malloc) = 2080;
          *(void *(__cdecl **)(size_t))((char *)&v48.malloc + 2) = (void *(__cdecl *)(size_t))"X";
          WORD1(v48.free) = 1024;
          HIDWORD(v48.free) = v25;
          LOWORD(v48.reportError) = 1024;
          *(_DWORD *)((char *)&v48.reportError + 2) = v24;
          v35 = MEMORY[0x24BDACB70];
          v36 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
          goto LABEL_142;
        }
        if (rowCount > 0)
        {
          if (columnCount == v15)
          {
            if (v25 == v14)
            {
              _SparseSolveOpaque_Float(&Factored, &RHS, &Soln, a4);
              return;
            }
            if (v48.reportError)
            {
              v60 = 0u;
              v61 = 0u;
              v58 = 0u;
              v59 = 0u;
              v56 = 0u;
              v57 = 0u;
              v54 = 0u;
              v55 = 0u;
              v52 = 0u;
              v53 = 0u;
              v50 = 0u;
              v51 = 0u;
              v49 = 0u;
              memset(&v48, 0, sizeof(v48));
              v37 = "X";
              goto LABEL_123;
            }
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_7;
            v48.control = 136316418;
            *(_QWORD *)&v48.orderMethod = "X";
            WORD2(v48.order) = 1024;
            *(_DWORD *)((char *)&v48.order + 6) = v25;
            WORD1(v48.ignoreRowsAndColumns) = 1024;
            HIDWORD(v48.ignoreRowsAndColumns) = rowCount;
            LOWORD(v48.malloc) = 2080;
            *(void *(__cdecl **)(size_t))((char *)&v48.malloc + 2) = (void *(__cdecl *)(size_t))"matrix factorization Factored";
            WORD1(v48.free) = 1024;
            HIDWORD(v48.free) = v14;
            LOWORD(v48.reportError) = 1024;
            *(_DWORD *)((char *)&v48.reportError + 2) = v15;
            v35 = MEMORY[0x24BDACB70];
            v36 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
          }
          else
          {
            if (v48.reportError)
            {
              v60 = 0u;
              v61 = 0u;
              v58 = 0u;
              v59 = 0u;
              v56 = 0u;
              v57 = 0u;
              v54 = 0u;
              v55 = 0u;
              v52 = 0u;
              v53 = 0u;
              v50 = 0u;
              v51 = 0u;
              v49 = 0u;
              memset(&v48, 0, sizeof(v48));
              v37 = "B";
LABEL_123:
              snprintf((char *)&v48, 0x100uLL, "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n", v37);
              goto LABEL_49;
            }
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_7;
            v48.control = 136316418;
            *(_QWORD *)&v48.orderMethod = "B";
            WORD2(v48.order) = 1024;
            *(_DWORD *)((char *)&v48.order + 6) = columnCount;
            WORD1(v48.ignoreRowsAndColumns) = 1024;
            HIDWORD(v48.ignoreRowsAndColumns) = rowCount;
            LOWORD(v48.malloc) = 2080;
            *(void *(__cdecl **)(size_t))((char *)&v48.malloc + 2) = (void *(__cdecl *)(size_t))"matrix factorization Factored";
            WORD1(v48.free) = 1024;
            HIDWORD(v48.free) = v14;
            LOWORD(v48.reportError) = 1024;
            *(_DWORD *)((char *)&v48.reportError + 2) = v15;
            v35 = MEMORY[0x24BDACB70];
            v36 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
          }
LABEL_142:
          _os_log_error_impl(&dword_20AB80000, v35, OS_LOG_TYPE_ERROR, v36, (uint8_t *)&v48, 0x2Eu);
          goto LABEL_7;
        }
        if (v48.reportError)
        {
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v49 = 0u;
          memset(&v48, 0, sizeof(v48));
          snprintf((char *)&v48, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
          goto LABEL_49;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v48.control = 136315650;
        *(_QWORD *)&v48.orderMethod = "B";
        WORD2(v48.order) = 1024;
        *(_DWORD *)((char *)&v48.order + 6) = columnCount;
        WORD1(v48.ignoreRowsAndColumns) = 1024;
        HIDWORD(v48.ignoreRowsAndColumns) = rowCount;
        v39 = MEMORY[0x24BDACB70];
LABEL_133:
        _os_log_error_impl(&dword_20AB80000, v39, OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", (uint8_t *)&v48, 0x18u);
        goto LABEL_7;
      }
      if (v48.reportError)
      {
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v49 = 0u;
        memset(&v48, 0, sizeof(v48));
        snprintf((char *)&v48, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
LABEL_49:
        ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v48);
        return;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v48.control = 136315138;
      *(_QWORD *)&v48.orderMethod = "Factored";
      v20 = MEMORY[0x24BDACB70];
      v21 = "%s does not hold a completed matrix factorization.\n";
LABEL_77:
      _os_log_error_impl(&dword_20AB80000, v20, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v48, 0xCu);
      goto LABEL_7;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    LOWORD(v48.control) = 0;
    v7 = MEMORY[0x24BDACB70];
LABEL_74:
    _os_log_error_impl(&dword_20AB80000, v7, OS_LOG_TYPE_ERROR, "Factored does not hold a completed matrix factorization.\n", (uint8_t *)&v48, 2u);
    goto LABEL_7;
  }
  v8 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v42.userFactorStorage = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v42.solveWorkspaceRequiredStatic = v8;
  v43 = *(_QWORD *)(a1 + 96);
  v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v42.status = *(_OWORD *)a1;
  *(_OWORD *)&v42.symbolicFactorization.columnCount = v9;
  v10 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v42.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v42.symbolicFactorization.factorSize_Float = v10;
  v41 = *a3;
  v40 = *a2;
  if (v42.symbolicFactorization.status || !v42.symbolicFactorization.workspaceSize_Float)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    LOWORD(v48.control) = 0;
    v7 = MEMORY[0x24BDACB70];
    goto LABEL_74;
  }
  _SparseGetOptionsFromSymbolicFactor(&v48, &v42.symbolicFactorization);
  v16 = v48.reportError;
  if (v42.symbolicFactorization.status
    || !v42.symbolicFactorization.workspaceSize_Float
    || v42.status
    || !v42.solveWorkspaceRequiredStatic)
  {
    if (!v48.reportError)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v48.control = 136315138;
      *(_QWORD *)&v48.orderMethod = "Factored";
      v20 = MEMORY[0x24BDACB70];
      v21 = "%s does not hold a completed matrix factorization.\n";
      goto LABEL_77;
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    memset(&v48, 0, sizeof(v48));
    snprintf((char *)&v48, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
LABEL_55:
    ((void (*)(SparseSymbolicFactorOptions *))v16)(&v48);
    return;
  }
  if (((*(_BYTE *)&v42.attributes ^ *(_BYTE *)&v42.symbolicFactorization.attributes) & 1) != 0)
    v17 = v42.symbolicFactorization.columnCount * LOBYTE(v42.symbolicFactorization.factorization);
  else
    v17 = v42.symbolicFactorization.rowCount * LOBYTE(v42.symbolicFactorization.factorization);
  if (((*(_BYTE *)&v42.attributes ^ *(_BYTE *)&v42.symbolicFactorization.attributes) & 1) != 0)
    v18 = v42.symbolicFactorization.rowCount * LOBYTE(v42.symbolicFactorization.factorization);
  else
    v18 = v42.symbolicFactorization.columnCount * LOBYTE(v42.symbolicFactorization.factorization);
  if (BYTE1(v42.symbolicFactorization.factorization) == 40)
    v19 = v17;
  else
    v19 = v18;
  if (v41.columnStride < v41.rowCount)
  {
    if (!v48.reportError)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v48.control = 136315906;
        *(_QWORD *)&v48.orderMethod = "B";
        WORD2(v48.order) = 1024;
        *(_DWORD *)((char *)&v48.order + 6) = v41.columnStride;
        WORD1(v48.ignoreRowsAndColumns) = 2080;
        *(int **)((char *)&v48.ignoreRowsAndColumns + 4) = (int *)"B";
        WORD2(v48.malloc) = 1024;
        *(_DWORD *)((char *)&v48.malloc + 6) = v41.rowCount;
        v26 = MEMORY[0x24BDACB70];
        goto LABEL_108;
      }
LABEL_7:
      _SparseTrap();
      return;
    }
    goto LABEL_54;
  }
  if (v40.columnStride < v40.rowCount)
  {
    if (!v48.reportError)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v48.control = 136315906;
        *(_QWORD *)&v48.orderMethod = "X";
        WORD2(v48.order) = 1024;
        *(_DWORD *)((char *)&v48.order + 6) = v40.columnStride;
        WORD1(v48.ignoreRowsAndColumns) = 2080;
        *(int **)((char *)&v48.ignoreRowsAndColumns + 4) = (int *)"X";
        WORD2(v48.malloc) = 1024;
        *(_DWORD *)((char *)&v48.malloc + 6) = v40.rowCount;
        v26 = MEMORY[0x24BDACB70];
        goto LABEL_108;
      }
      goto LABEL_7;
    }
LABEL_54:
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    memset(&v48, 0, sizeof(v48));
    snprintf((char *)&v48, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
    goto LABEL_55;
  }
  if ((*(_BYTE *)&v41.attributes & 1) != 0)
    v27 = v41.rowCount;
  else
    v27 = v41.columnCount;
  if ((*(_BYTE *)&v41.attributes & 1) != 0)
    v28 = v41.columnCount;
  else
    v28 = v41.rowCount;
  if ((*(_BYTE *)&v40.attributes & 1) != 0)
    v29 = v40.rowCount;
  else
    v29 = v40.columnCount;
  if ((*(_BYTE *)&v40.attributes & 1) != 0)
    v30 = v40.columnCount;
  else
    v30 = v40.rowCount;
  if ((_DWORD)v27 != v29)
  {
    if (!v48.reportError)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v48.control = 136316418;
      *(_QWORD *)&v48.orderMethod = "B";
      WORD2(v48.order) = 1024;
      *(_DWORD *)((char *)&v48.order + 6) = v28;
      WORD1(v48.ignoreRowsAndColumns) = 1024;
      HIDWORD(v48.ignoreRowsAndColumns) = v27;
      LOWORD(v48.malloc) = 2080;
      *(void *(__cdecl **)(size_t))((char *)&v48.malloc + 2) = (void *(__cdecl *)(size_t))"X";
      WORD1(v48.free) = 1024;
      HIDWORD(v48.free) = v30;
      LOWORD(v48.reportError) = 1024;
      *(_DWORD *)((char *)&v48.reportError + 2) = v29;
      v35 = MEMORY[0x24BDACB70];
      v36 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
      goto LABEL_142;
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    memset(&v48, 0, sizeof(v48));
    snprintf((char *)&v48, 0x100uLL, "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n", "B");
    goto LABEL_55;
  }
  if ((int)v27 <= 0)
  {
    if (!v48.reportError)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v48.control = 136315650;
      *(_QWORD *)&v48.orderMethod = "B";
      WORD2(v48.order) = 1024;
      *(_DWORD *)((char *)&v48.order + 6) = v28;
      WORD1(v48.ignoreRowsAndColumns) = 1024;
      HIDWORD(v48.ignoreRowsAndColumns) = v27;
      v39 = MEMORY[0x24BDACB70];
      goto LABEL_133;
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    memset(&v48, 0, sizeof(v48));
    snprintf((char *)&v48, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
    goto LABEL_55;
  }
  if (v28 != v19)
  {
    if (!v48.reportError)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v48.control = 136316418;
      *(_QWORD *)&v48.orderMethod = "B";
      WORD2(v48.order) = 1024;
      *(_DWORD *)((char *)&v48.order + 6) = v28;
      WORD1(v48.ignoreRowsAndColumns) = 1024;
      HIDWORD(v48.ignoreRowsAndColumns) = v27;
      LOWORD(v48.malloc) = 2080;
      *(void *(__cdecl **)(size_t))((char *)&v48.malloc + 2) = (void *(__cdecl *)(size_t))"matrix factorization Factored";
      WORD1(v48.free) = 1024;
      HIDWORD(v48.free) = v18;
      LOWORD(v48.reportError) = 1024;
      *(_DWORD *)((char *)&v48.reportError + 2) = v19;
      v35 = MEMORY[0x24BDACB70];
      v36 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
      goto LABEL_142;
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    memset(&v48, 0, sizeof(v48));
    v38 = "B";
    goto LABEL_130;
  }
  if (v30 != v18)
  {
    if (!v48.reportError)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v48.control = 136316418;
      *(_QWORD *)&v48.orderMethod = "X";
      WORD2(v48.order) = 1024;
      *(_DWORD *)((char *)&v48.order + 6) = v30;
      WORD1(v48.ignoreRowsAndColumns) = 1024;
      HIDWORD(v48.ignoreRowsAndColumns) = v27;
      LOWORD(v48.malloc) = 2080;
      *(void *(__cdecl **)(size_t))((char *)&v48.malloc + 2) = (void *(__cdecl *)(size_t))"matrix factorization Factored";
      WORD1(v48.free) = 1024;
      HIDWORD(v48.free) = v18;
      LOWORD(v48.reportError) = 1024;
      *(_DWORD *)((char *)&v48.reportError + 2) = v19;
      v35 = MEMORY[0x24BDACB70];
      v36 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
      goto LABEL_142;
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    memset(&v48, 0, sizeof(v48));
    v38 = "X";
LABEL_130:
    snprintf((char *)&v48, 0x100uLL, "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n", v38);
    goto LABEL_55;
  }
  free = v48.free;
  v32 = v42.solveWorkspaceRequiredPerRHS + v43 * v27;
  v33 = (void *)((uint64_t (*)(size_t))v48.malloc)(v32);
  if (!v33)
  {
    if (!v16)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v48.control = 134217984;
      *(_QWORD *)&v48.orderMethod = v32;
      v20 = MEMORY[0x24BDACB70];
      v21 = "Failed to allocate workspace of size %ld for SparseSolve().\n";
      goto LABEL_77;
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    memset(&v48, 0, sizeof(v48));
    snprintf((char *)&v48, 0x100uLL, "Failed to allocate workspace of size %ld for SparseSolve().\n");
    goto LABEL_55;
  }
  v34 = v33;
  _SparseSolveOpaque_Float(&v42, &v41, &v40, v33);
  ((void (*)(void *))free)(v34);
}

void cva::VecLibSparse<float>::solve(uint64_t a1, uint64_t a2, void *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  NSObject *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  SparseControl_t v11;
  int *v12;
  void (__cdecl *reportError)(const char *);
  int v14;
  int v15;
  float *v16;
  void (__cdecl *v17)(const char *);
  int v18;
  void (__cdecl *free)(void *);
  size_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  SparseOpaqueFactorization_Float v26;
  uint64_t v27;
  SparseOpaqueFactorization_Float Factored;
  uint64_t v29;
  DenseMatrix_Float Soln;
  SparseSymbolicFactorOptions v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&Factored.userFactorStorage = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&Factored.solveWorkspaceRequiredStatic = v3;
    v29 = *(_QWORD *)(a1 + 96);
    v4 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&Factored.status = *(_OWORD *)a1;
    *(_OWORD *)&Factored.symbolicFactorization.columnCount = v4;
    v5 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)&Factored.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
    *(_OWORD *)&Factored.symbolicFactorization.factorSize_Float = v5;
    if (Factored.symbolicFactorization.status == SparseStatusOK && Factored.symbolicFactorization.workspaceSize_Float)
    {
      v11 = *(_DWORD *)a2;
      v12 = *(int **)(a2 + 8);
      _SparseGetOptionsFromSymbolicFactor(&v31, &Factored.symbolicFactorization);
      reportError = v31.reportError;
      if (Factored.symbolicFactorization.status == SparseStatusOK
        && Factored.symbolicFactorization.workspaceSize_Float
        && Factored.status == SparseStatusOK
        && Factored.solveWorkspaceRequiredStatic)
      {
        v14 = Factored.symbolicFactorization.columnCount * LOBYTE(Factored.symbolicFactorization.factorization);
        if (Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization) > v14)
          v14 = Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization);
        if (v14 == v11)
        {
          v31.control = v11;
          *(_DWORD *)&v31.orderMethod = 1;
          v31.ignoreRowsAndColumns = v12;
          v31.order = (int *)v11;
          _SparseSolveOpaque_Float(&Factored, 0, (const DenseMatrix_Float *)&v31, a3);
          return;
        }
        if (v31.reportError)
        {
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v32 = 0u;
          memset(&v31, 0, sizeof(v31));
          snprintf((char *)&v31, 0x100uLL, "%s.count (%d) is not equal to largest dimension of matrix factorization %s.\n");
          goto LABEL_34;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v31.control = 136315650;
        *(_QWORD *)&v31.orderMethod = "xb";
        WORD2(v31.order) = 1024;
        *(_DWORD *)((char *)&v31.order + 6) = v11;
        WORD1(v31.ignoreRowsAndColumns) = 2080;
        *(int **)((char *)&v31.ignoreRowsAndColumns + 4) = (int *)"Factored";
        v25 = MEMORY[0x24BDACB70];
        goto LABEL_51;
      }
      if (v31.reportError)
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v32 = 0u;
        memset(&v31, 0, sizeof(v31));
        snprintf((char *)&v31, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
LABEL_34:
        ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v31);
        return;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v31.control = 136315138;
      *(_QWORD *)&v31.orderMethod = "Factored";
      v23 = MEMORY[0x24BDACB70];
      v24 = "%s does not hold a completed matrix factorization.\n";
      goto LABEL_43;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v31.control) = 0;
      v6 = MEMORY[0x24BDACB70];
LABEL_40:
      _os_log_error_impl(&dword_20AB80000, v6, OS_LOG_TYPE_ERROR, "Factored does not hold a completed matrix factorization.\n", (uint8_t *)&v31, 2u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v7 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v26.userFactorStorage = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v26.solveWorkspaceRequiredStatic = v7;
  v27 = *(_QWORD *)(a1 + 96);
  v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v26.status = *(_OWORD *)a1;
  *(_OWORD *)&v26.symbolicFactorization.columnCount = v8;
  v9 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v26.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v26.symbolicFactorization.factorSize_Float = v9;
  if (v26.symbolicFactorization.status == SparseStatusOK && v26.symbolicFactorization.workspaceSize_Float)
  {
    v15 = *(_DWORD *)a2;
    v16 = *(float **)(a2 + 8);
    _SparseGetOptionsFromSymbolicFactor(&v31, &v26.symbolicFactorization);
    v17 = v31.reportError;
    if (v26.symbolicFactorization.status
      || !v26.symbolicFactorization.workspaceSize_Float
      || v26.status
      || !v26.solveWorkspaceRequiredStatic)
    {
      if (!v31.reportError)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v31.control = 136315138;
        *(_QWORD *)&v31.orderMethod = "Factored";
        v23 = MEMORY[0x24BDACB70];
        v24 = "%s does not hold a completed matrix factorization.\n";
        goto LABEL_43;
      }
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v32 = 0u;
      memset(&v31, 0, sizeof(v31));
      snprintf((char *)&v31, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
    }
    else
    {
      v18 = v26.symbolicFactorization.columnCount * LOBYTE(v26.symbolicFactorization.factorization);
      if (v26.symbolicFactorization.rowCount * LOBYTE(v26.symbolicFactorization.factorization) > v18)
        v18 = v26.symbolicFactorization.rowCount * LOBYTE(v26.symbolicFactorization.factorization);
      if (v18 == v15)
      {
        free = v31.free;
        Soln.rowCount = v15;
        Soln.columnCount = 1;
        *(_DWORD *)&Soln.attributes = 0;
        Soln.data = v16;
        Soln.columnStride = v15;
        v20 = v27 + v26.solveWorkspaceRequiredPerRHS;
        v21 = (void *)((uint64_t (*)(size_t))v31.malloc)(v27 + v26.solveWorkspaceRequiredPerRHS);
        if (v21)
        {
          v22 = v21;
          _SparseSolveOpaque_Float(&v26, 0, &Soln, v21);
          ((void (*)(void *))free)(v22);
          return;
        }
        if (v17)
        {
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v32 = 0u;
          memset(&v31, 0, sizeof(v31));
          snprintf((char *)&v31, 0x100uLL, "Failed to allocate workspace of size %ld for SparseSolve().\n");
          goto LABEL_48;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v31.control = 134217984;
        *(_QWORD *)&v31.orderMethod = v20;
        v23 = MEMORY[0x24BDACB70];
        v24 = "Failed to allocate workspace of size %ld for SparseSolve().\n";
LABEL_43:
        _os_log_error_impl(&dword_20AB80000, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v31, 0xCu);
        goto LABEL_7;
      }
      if (!v31.reportError)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v31.control = 136315650;
          *(_QWORD *)&v31.orderMethod = "xb";
          WORD2(v31.order) = 1024;
          *(_DWORD *)((char *)&v31.order + 6) = v15;
          WORD1(v31.ignoreRowsAndColumns) = 2080;
          *(int **)((char *)&v31.ignoreRowsAndColumns + 4) = (int *)"Factored";
          v25 = MEMORY[0x24BDACB70];
LABEL_51:
          _os_log_error_impl(&dword_20AB80000, v25, OS_LOG_TYPE_ERROR, "%s.count (%d) is not equal to largest dimension of matrix factorization %s.\n", (uint8_t *)&v31, 0x1Cu);
          goto LABEL_7;
        }
        goto LABEL_7;
      }
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v32 = 0u;
      memset(&v31, 0, sizeof(v31));
      snprintf((char *)&v31, 0x100uLL, "%s.count (%d) is not equal to largest dimension of matrix factorization %s.\n");
    }
LABEL_48:
    ((void (*)(SparseSymbolicFactorOptions *))v17)(&v31);
    return;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v31.control) = 0;
    v6 = MEMORY[0x24BDACB70];
    goto LABEL_40;
  }
LABEL_7:
  _SparseTrap();
}

void cva::VecLibSparse<float>::solve(uint64_t a1, DenseMatrix_Float *a2, void *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  NSObject *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void (__cdecl *reportError)(const char *);
  void (__cdecl *v12)(const char *);
  int columnCount;
  int rowCount;
  int v15;
  NSObject *v16;
  const char *v17;
  int v18;
  uint64_t v19;
  int v20;
  void (__cdecl *free)(void *);
  size_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  DenseMatrix_Float v28;
  SparseOpaqueFactorization_Float v29;
  uint64_t v30;
  DenseMatrix_Float Soln;
  SparseOpaqueFactorization_Float Factored;
  uint64_t v33;
  SparseSymbolicFactorOptions v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&Factored.userFactorStorage = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&Factored.solveWorkspaceRequiredStatic = v3;
    v33 = *(_QWORD *)(a1 + 96);
    v4 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&Factored.status = *(_OWORD *)a1;
    *(_OWORD *)&Factored.symbolicFactorization.columnCount = v4;
    v5 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)&Factored.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
    *(_OWORD *)&Factored.symbolicFactorization.factorSize_Float = v5;
    Soln = *a2;
    if (Factored.symbolicFactorization.status == SparseStatusOK && Factored.symbolicFactorization.workspaceSize_Float)
    {
      _SparseGetOptionsFromSymbolicFactor(&v34, &Factored.symbolicFactorization);
      reportError = v34.reportError;
      if (Factored.symbolicFactorization.status == SparseStatusOK
        && Factored.symbolicFactorization.workspaceSize_Float
        && Factored.status == SparseStatusOK
        && Factored.solveWorkspaceRequiredStatic)
      {
        if (Soln.columnStride < Soln.rowCount)
        {
          if (v34.reportError)
          {
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v35 = 0u;
            memset(&v34, 0, sizeof(v34));
            snprintf((char *)&v34, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
LABEL_27:
            ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v34);
            return;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_7;
          v34.control = 136315906;
          *(_QWORD *)&v34.orderMethod = "XB";
          WORD2(v34.order) = 1024;
          *(_DWORD *)((char *)&v34.order + 6) = Soln.columnStride;
          WORD1(v34.ignoreRowsAndColumns) = 2080;
          *(int **)((char *)&v34.ignoreRowsAndColumns + 4) = (int *)"XB";
          WORD2(v34.malloc) = 1024;
          *(_DWORD *)((char *)&v34.malloc + 6) = Soln.rowCount;
          v25 = MEMORY[0x24BDACB70];
          goto LABEL_71;
        }
        if ((*(_BYTE *)&Soln.attributes & 1) != 0)
          columnCount = Soln.columnCount;
        else
          columnCount = Soln.rowCount;
        if ((*(_BYTE *)&Soln.attributes & 1) != 0)
          rowCount = Soln.rowCount;
        else
          rowCount = Soln.columnCount;
        if (rowCount > 0)
        {
          if (Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization) <= Factored.symbolicFactorization.columnCount * LOBYTE(Factored.symbolicFactorization.factorization))
            v15 = Factored.symbolicFactorization.columnCount * LOBYTE(Factored.symbolicFactorization.factorization);
          else
            v15 = Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization);
          if (columnCount == v15)
          {
            _SparseSolveOpaque_Float(&Factored, 0, &Soln, a3);
            return;
          }
          if (v34.reportError)
          {
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v35 = 0u;
            memset(&v34, 0, sizeof(v34));
            snprintf((char *)&v34, 0x100uLL, "%s (%dx%d) is not consistent with largest dimension of matrix factorization %s (%d).\n");
            goto LABEL_27;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_7;
          v34.control = 136316162;
          *(_QWORD *)&v34.orderMethod = "XB";
          WORD2(v34.order) = 1024;
          *(_DWORD *)((char *)&v34.order + 6) = columnCount;
          WORD1(v34.ignoreRowsAndColumns) = 1024;
          HIDWORD(v34.ignoreRowsAndColumns) = rowCount;
          LOWORD(v34.malloc) = 2080;
          *(void *(__cdecl **)(size_t))((char *)&v34.malloc + 2) = (void *(__cdecl *)(size_t))"Factored";
          WORD1(v34.free) = 1024;
          HIDWORD(v34.free) = v15;
          v27 = MEMORY[0x24BDACB70];
          goto LABEL_87;
        }
        if (v34.reportError)
        {
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v35 = 0u;
          memset(&v34, 0, sizeof(v34));
          snprintf((char *)&v34, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
          goto LABEL_27;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v34.control = 136315650;
        *(_QWORD *)&v34.orderMethod = "XB";
        WORD2(v34.order) = 1024;
        *(_DWORD *)((char *)&v34.order + 6) = columnCount;
        WORD1(v34.ignoreRowsAndColumns) = 1024;
        HIDWORD(v34.ignoreRowsAndColumns) = rowCount;
        v26 = MEMORY[0x24BDACB70];
LABEL_82:
        _os_log_error_impl(&dword_20AB80000, v26, OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", (uint8_t *)&v34, 0x18u);
        goto LABEL_7;
      }
      if (v34.reportError)
      {
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = 0u;
        memset(&v34, 0, sizeof(v34));
        snprintf((char *)&v34, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
        goto LABEL_27;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v34.control = 136315138;
      *(_QWORD *)&v34.orderMethod = "Factored";
      v16 = MEMORY[0x24BDACB70];
      v17 = "%s does not hold a completed matrix factorization.\n";
      goto LABEL_62;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v34.control) = 0;
      v6 = MEMORY[0x24BDACB70];
LABEL_59:
      _os_log_error_impl(&dword_20AB80000, v6, OS_LOG_TYPE_ERROR, "Factored does not hold a completed matrix factorization.\n", (uint8_t *)&v34, 2u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v7 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v29.userFactorStorage = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v29.solveWorkspaceRequiredStatic = v7;
  v30 = *(_QWORD *)(a1 + 96);
  v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v29.status = *(_OWORD *)a1;
  *(_OWORD *)&v29.symbolicFactorization.columnCount = v8;
  v9 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v29.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v29.symbolicFactorization.factorSize_Float = v9;
  v28 = *a2;
  if (v29.symbolicFactorization.status == SparseStatusOK && v29.symbolicFactorization.workspaceSize_Float)
  {
    _SparseGetOptionsFromSymbolicFactor(&v34, &v29.symbolicFactorization);
    v12 = v34.reportError;
    if (v29.symbolicFactorization.status
      || !v29.symbolicFactorization.workspaceSize_Float
      || v29.status
      || !v29.solveWorkspaceRequiredStatic)
    {
      if (v34.reportError)
      {
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = 0u;
        memset(&v34, 0, sizeof(v34));
        snprintf((char *)&v34, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
        goto LABEL_30;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v34.control = 136315138;
      *(_QWORD *)&v34.orderMethod = "Factored";
      v16 = MEMORY[0x24BDACB70];
      v17 = "%s does not hold a completed matrix factorization.\n";
    }
    else
    {
      if (v28.columnStride < v28.rowCount)
      {
        if (!v34.reportError)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v34.control = 136315906;
            *(_QWORD *)&v34.orderMethod = "XB";
            WORD2(v34.order) = 1024;
            *(_DWORD *)((char *)&v34.order + 6) = v28.columnStride;
            WORD1(v34.ignoreRowsAndColumns) = 2080;
            *(int **)((char *)&v34.ignoreRowsAndColumns + 4) = (int *)"XB";
            WORD2(v34.malloc) = 1024;
            *(_DWORD *)((char *)&v34.malloc + 6) = v28.rowCount;
            v25 = MEMORY[0x24BDACB70];
LABEL_71:
            _os_log_error_impl(&dword_20AB80000, v25, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", (uint8_t *)&v34, 0x22u);
            goto LABEL_7;
          }
          goto LABEL_7;
        }
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = 0u;
        memset(&v34, 0, sizeof(v34));
        snprintf((char *)&v34, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
LABEL_30:
        ((void (*)(SparseSymbolicFactorOptions *))v12)(&v34);
        return;
      }
      if ((*(_BYTE *)&v28.attributes & 1) != 0)
        v18 = v28.columnCount;
      else
        v18 = v28.rowCount;
      if ((*(_BYTE *)&v28.attributes & 1) != 0)
        v19 = v28.rowCount;
      else
        v19 = v28.columnCount;
      if ((int)v19 <= 0)
      {
        if (!v34.reportError)
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_7;
          v34.control = 136315650;
          *(_QWORD *)&v34.orderMethod = "XB";
          WORD2(v34.order) = 1024;
          *(_DWORD *)((char *)&v34.order + 6) = v18;
          WORD1(v34.ignoreRowsAndColumns) = 1024;
          HIDWORD(v34.ignoreRowsAndColumns) = v19;
          v26 = MEMORY[0x24BDACB70];
          goto LABEL_82;
        }
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = 0u;
        memset(&v34, 0, sizeof(v34));
        snprintf((char *)&v34, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
        goto LABEL_30;
      }
      if (v29.symbolicFactorization.rowCount * LOBYTE(v29.symbolicFactorization.factorization) <= v29.symbolicFactorization.columnCount
                                                                                                 * LOBYTE(v29.symbolicFactorization.factorization))
        v20 = v29.symbolicFactorization.columnCount * LOBYTE(v29.symbolicFactorization.factorization);
      else
        v20 = v29.symbolicFactorization.rowCount * LOBYTE(v29.symbolicFactorization.factorization);
      if (v18 != v20)
      {
        if (!v34.reportError)
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_7;
          v34.control = 136316162;
          *(_QWORD *)&v34.orderMethod = "XB";
          WORD2(v34.order) = 1024;
          *(_DWORD *)((char *)&v34.order + 6) = v18;
          WORD1(v34.ignoreRowsAndColumns) = 1024;
          HIDWORD(v34.ignoreRowsAndColumns) = v19;
          LOWORD(v34.malloc) = 2080;
          *(void *(__cdecl **)(size_t))((char *)&v34.malloc + 2) = (void *(__cdecl *)(size_t))"Factored";
          WORD1(v34.free) = 1024;
          HIDWORD(v34.free) = v20;
          v27 = MEMORY[0x24BDACB70];
LABEL_87:
          _os_log_error_impl(&dword_20AB80000, v27, OS_LOG_TYPE_ERROR, "%s (%dx%d) is not consistent with largest dimension of matrix factorization %s (%d).\n", (uint8_t *)&v34, 0x28u);
          goto LABEL_7;
        }
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = 0u;
        memset(&v34, 0, sizeof(v34));
        snprintf((char *)&v34, 0x100uLL, "%s (%dx%d) is not consistent with largest dimension of matrix factorization %s (%d).\n");
        goto LABEL_30;
      }
      free = v34.free;
      v22 = v29.solveWorkspaceRequiredPerRHS + v30 * v19;
      v23 = (void *)((uint64_t (*)(size_t))v34.malloc)(v22);
      if (v23)
      {
        v24 = v23;
        _SparseSolveOpaque_Float(&v29, 0, &v28, v23);
        ((void (*)(void *))free)(v24);
        return;
      }
      if (v12)
      {
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = 0u;
        memset(&v34, 0, sizeof(v34));
        snprintf((char *)&v34, 0x100uLL, "Failed to allocate workspace of size %ld for SparseSolve().\n");
        goto LABEL_30;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v34.control = 134217984;
      *(_QWORD *)&v34.orderMethod = v22;
      v16 = MEMORY[0x24BDACB70];
      v17 = "Failed to allocate workspace of size %ld for SparseSolve().\n";
    }
LABEL_62:
    _os_log_error_impl(&dword_20AB80000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v34, 0xCu);
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v34.control) = 0;
    v6 = MEMORY[0x24BDACB70];
    goto LABEL_59;
  }
LABEL_7:
  _SparseTrap();
}

double cva::VecLibSparse<float>::subfactor@<D0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void (*v8)(_BYTE *);
  __int16 v9;
  double result;
  const char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  size_t v16;
  __int128 v17;
  __int128 v18;
  NSObject *v19;
  const char *v20;
  SparseOpaqueFactorization_Float v21;
  uint64_t v22;
  size_t workPerRHS;
  size_t workStatic;
  _BYTE v25[256];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)&v21.userFactorStorage = *(_OWORD *)(a2 + 64);
  *(_OWORD *)&v21.solveWorkspaceRequiredStatic = v4;
  v22 = *(_QWORD *)(a2 + 96);
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v21.status = *(_OWORD *)a2;
  *(_OWORD *)&v21.symbolicFactorization.columnCount = v5;
  v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)&v21.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a2 + 32);
  *(_OWORD *)&v21.symbolicFactorization.factorSize_Float = v6;
  if (v21.symbolicFactorization.status == SparseStatusOK
    && v21.symbolicFactorization.workspaceSize_Float
    && v21.status == SparseStatusOK
    && v21.solveWorkspaceRequiredStatic)
  {
    _SparseGetOptionsFromSymbolicFactor((SparseSymbolicFactorOptions *)v25, &v21.symbolicFactorization);
    v8 = *(void (**)(_BYTE *))&v25[40];
    v9 = 2;
    switch(a1)
    {
      case 1:
        goto LABEL_24;
      case 2:
      case 4:
        if (BYTE1(v21.symbolicFactorization.factorization) - 2 < 3)
          goto LABEL_24;
        if (*(_QWORD *)&v25[40])
        {
          memset(&v25[53], 0, 203);
          strcpy(v25, "Subfactor Type only valid for LDL^T factorizations.\n");
          goto LABEL_32;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        *(_WORD *)v25 = 0;
        v19 = MEMORY[0x24BDACB70];
        v20 = "Subfactor Type only valid for LDL^T factorizations.\n";
        goto LABEL_29;
      case 3:
      case 5:
        if (a1 == 5)
          v9 = 2;
        else
          v9 = 6;
        if (BYTE1(v21.symbolicFactorization.factorization) <= 4u && BYTE1(v21.symbolicFactorization.factorization) != 1)
          goto LABEL_24;
        if (*(_QWORD *)&v25[40])
        {
          memset(&v25[66], 0, 190);
          strcpy(&v25[64], "\n");
          v11 = "Subfactor Type only valid for Cholesky and LDL^T factorizations.\n";
          goto LABEL_27;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        *(_WORD *)v25 = 0;
        v19 = MEMORY[0x24BDACB70];
        v20 = "Subfactor Type only valid for Cholesky and LDL^T factorizations.\n";
        goto LABEL_29;
      case 6:
        if (BYTE1(v21.symbolicFactorization.factorization) == 40)
          goto LABEL_24;
        if (*(_QWORD *)&v25[40])
        {
          memset(&v25[52], 0, 204);
          strcpy(v25, "SparseSubfactorQ only valid for QR factorizations.\n");
          goto LABEL_32;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        *(_WORD *)v25 = 0;
        v19 = MEMORY[0x24BDACB70];
        v20 = "SparseSubfactorQ only valid for QR factorizations.\n";
        goto LABEL_29;
      case 7:
      case 8:
        if ((BYTE1(v21.symbolicFactorization.factorization) & 0xFE) == 0x28)
        {
          v9 = 4;
LABEL_24:
          _SparseRetainNumeric_Float(&v21);
          workPerRHS = 0;
          workStatic = 0;
          *(SparseOpaqueFactorization_Float *)v25 = v21;
          *(_QWORD *)&v25[96] = v22;
          _SparseGetWorkspaceRequired_Float((SparseSubfactor_t)a1, (SparseOpaqueFactorization_Float *)v25, &workStatic, &workPerRHS);
          v12 = *(_OWORD *)&v21.symbolicFactorization.workspaceSize_Float;
          *(_OWORD *)(a3 + 56) = *(_OWORD *)&v21.symbolicFactorization.factorSize_Float;
          v13 = *(_OWORD *)&v21.solveWorkspaceRequiredStatic;
          *(_OWORD *)(a3 + 72) = *(_OWORD *)&v21.userFactorStorage;
          *(_OWORD *)(a3 + 88) = v13;
          result = *(double *)&v21.status;
          v14 = *(_OWORD *)&v21.symbolicFactorization.columnCount;
          *(_OWORD *)(a3 + 8) = *(_OWORD *)&v21.status;
          *(_OWORD *)(a3 + 24) = v14;
          *(_WORD *)a3 = v9;
          *(_WORD *)(a3 + 2) = 0;
          *(_BYTE *)(a3 + 4) = a1;
          v15 = v22;
          *(_OWORD *)(a3 + 40) = v12;
          v16 = workStatic;
          *(_QWORD *)(a3 + 104) = v15;
          *(_QWORD *)(a3 + 112) = v16;
          *(_QWORD *)(a3 + 120) = workPerRHS;
          return result;
        }
        if (*(_QWORD *)&v25[40])
        {
          memset(&v25[66], 0, 190);
          strcpy(&v25[64], "\n");
          v11 = "Subfactor Type only valid for QR and CholeskyAtA factorizations.\n";
LABEL_27:
          v17 = *((_OWORD *)v11 + 1);
          *(_OWORD *)v25 = *(_OWORD *)v11;
          *(_OWORD *)&v25[16] = v17;
          v18 = *((_OWORD *)v11 + 3);
          *(_OWORD *)&v25[32] = *((_OWORD *)v11 + 2);
          *(_OWORD *)&v25[48] = v18;
          goto LABEL_32;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        *(_WORD *)v25 = 0;
        v19 = MEMORY[0x24BDACB70];
        v20 = "Subfactor Type only valid for QR and CholeskyAtA factorizations.\n";
        goto LABEL_29;
      default:
        if (*(_QWORD *)&v25[40])
        {
          memset(&v25[24], 0, 232);
          strcpy(v25, "Invalid subfactor type.");
LABEL_32:
          v8(v25);
          goto LABEL_11;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        *(_WORD *)v25 = 0;
        v19 = MEMORY[0x24BDACB70];
        v20 = "Invalid subfactor type.";
        break;
    }
    goto LABEL_29;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v25 = 0;
    v19 = MEMORY[0x24BDACB70];
    v20 = "Bad factor.\n";
LABEL_29:
    _os_log_error_impl(&dword_20AB80000, v19, OS_LOG_TYPE_ERROR, v20, v25, 2u);
  }
LABEL_10:
  _SparseTrap();
LABEL_11:
  result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_DWORD *)(a3 + 8) = -3;
  *(_DWORD *)(a3 + 16) = -3;
  return result;
}

void cva::VecLibSparse<float>::solve(_OWORD *a1, uint64_t a2, uint64_t a3, char *a4)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  float *v10;
  DenseMatrix_Float v11;
  _DWORD v12[4];
  uint64_t v13;
  _OWORD v14[8];

  v4 = a1[5];
  v14[4] = a1[4];
  v14[5] = v4;
  v5 = a1[7];
  v14[6] = a1[6];
  v14[7] = v5;
  v6 = a1[1];
  v14[0] = *a1;
  v14[1] = v6;
  v7 = a1[3];
  v14[2] = a1[2];
  v14[3] = v7;
  v8 = *(_QWORD *)(a3 + 8);
  v9 = *(_DWORD *)a2;
  v10 = *(float **)(a2 + 8);
  v12[0] = *(_DWORD *)a3;
  v12[1] = 1;
  v12[2] = v12[0];
  v12[3] = 0;
  v13 = v8;
  v11.rowCount = v9;
  v11.columnCount = 1;
  v11.columnStride = v9;
  *(_DWORD *)&v11.attributes = 0;
  v11.data = v10;
  if (a4)
    sub_20ABE3EC0((const SparseOpaqueSubfactor_Float *)v14, (uint64_t)v12, &v11, a4);
  else
    sub_20ABE4510((const SparseOpaqueSubfactor_Float *)v14, (uint64_t)v12, &v11);
}

void sub_20ABE3EC0(const SparseOpaqueSubfactor_Float *a1, uint64_t a2, const DenseMatrix_Float *a3, char *a4)
{
  void (__cdecl *reportError)(const char *);
  SparseAttributes_t attributes;
  int factorization_low;
  int v11;
  int v12;
  int v13;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int columnStride;
  int rowCount;
  __int16 v22;
  int v23;
  unsigned int v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  int v31;
  int v32;
  SparseSymbolicFactorOptions v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)&a1->contents + 2))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v33.control) = 0;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Subfactor does not hold a valid factor subobject.\n", (uint8_t *)&v33, 2u);
    }
    goto LABEL_58;
  }
  _SparseGetOptionsFromSymbolicFactor(&v33, &a1->factor.symbolicFactorization);
  reportError = v33.reportError;
  attributes = a1->attributes;
  factorization_low = LOBYTE(a1->factor.symbolicFactorization.factorization);
  v11 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  v12 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  if (v11 >= v12)
    v13 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  else
    v13 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  if (v11 <= v12)
    v11 = v12;
  if (*((_BYTE *)&a1->contents + 2) == 6 && BYTE1(a1->factor.symbolicFactorization.factorization) == 40)
    v15 = v11;
  else
    v15 = v13;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v16 = v15;
  else
    v16 = v13;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v17 = v13;
  else
    v17 = v15;
  v18 = *(_DWORD *)(a2 + 8);
  v19 = *(_DWORD *)a2;
  if (v18 < *(_DWORD *)a2)
  {
    if (v33.reportError)
      goto LABEL_26;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_58;
    v33.control = 136315906;
    *(_QWORD *)&v33.orderMethod = "B";
    WORD2(v33.order) = 1024;
    *(_DWORD *)((char *)&v33.order + 6) = v18;
    WORD1(v33.ignoreRowsAndColumns) = 2080;
    *(int **)((char *)&v33.ignoreRowsAndColumns + 4) = (int *)"B";
    WORD2(v33.malloc) = 1024;
    *(_DWORD *)((char *)&v33.malloc + 6) = v19;
    v26 = MEMORY[0x24BDACB70];
    goto LABEL_41;
  }
  columnStride = a3->columnStride;
  rowCount = a3->rowCount;
  if (columnStride >= a3->rowCount)
  {
    v22 = *(_WORD *)(a2 + 12);
    if ((v22 & 1) == 0)
      v19 = *(_DWORD *)(a2 + 4);
    v23 = *(&a3->rowCount + ((*(_WORD *)&a3->attributes & 1) == 0));
    v24 = v22 & 1;
    v25 = *(&a3->rowCount + (*(_WORD *)&a3->attributes & 1));
    if (v19 == v23)
    {
      if (v19 <= 0)
      {
        if (v33.reportError)
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v34 = 0u;
          memset(&v33, 0, sizeof(v33));
          snprintf((char *)&v33, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
          goto LABEL_27;
        }
        v31 = *(_DWORD *)(a2 + 4 * v24);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v33.control = 136315650;
          *(_QWORD *)&v33.orderMethod = "B";
          WORD2(v33.order) = 1024;
          *(_DWORD *)((char *)&v33.order + 6) = v31;
          WORD1(v33.ignoreRowsAndColumns) = 1024;
          HIDWORD(v33.ignoreRowsAndColumns) = v19;
          _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", (uint8_t *)&v33, 0x18u);
        }
        goto LABEL_58;
      }
      if (*(_DWORD *)(a2 + 4 * v24) == v17)
      {
        if (v25 == v16)
        {
          _SparseSolveSubfactor_Float(a1, (const DenseMatrix_Float *)a2, a3, a4);
          return;
        }
        if (v33.reportError)
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v34 = 0u;
          memset(&v33, 0, sizeof(v33));
          v30 = "X";
          goto LABEL_50;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_58;
        v33.control = 136316418;
        *(_QWORD *)&v33.orderMethod = "X";
        WORD2(v33.order) = 1024;
        *(_DWORD *)((char *)&v33.order + 6) = v25;
        WORD1(v33.ignoreRowsAndColumns) = 1024;
        HIDWORD(v33.ignoreRowsAndColumns) = v19;
        LOWORD(v33.malloc) = 2080;
        *(void *(__cdecl **)(size_t))((char *)&v33.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
        WORD1(v33.free) = 1024;
        HIDWORD(v33.free) = v16;
        LOWORD(v33.reportError) = 1024;
        *(_DWORD *)((char *)&v33.reportError + 2) = v17;
        v28 = MEMORY[0x24BDACB70];
        v29 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
      }
      else
      {
        if (v33.reportError)
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v34 = 0u;
          memset(&v33, 0, sizeof(v33));
          v30 = "B";
LABEL_50:
          snprintf((char *)&v33, 0x100uLL, "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n", v30);
          goto LABEL_27;
        }
        v32 = *(_DWORD *)(a2 + 4 * v24);
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_58;
        v33.control = 136316418;
        *(_QWORD *)&v33.orderMethod = "B";
        WORD2(v33.order) = 1024;
        *(_DWORD *)((char *)&v33.order + 6) = v32;
        WORD1(v33.ignoreRowsAndColumns) = 1024;
        HIDWORD(v33.ignoreRowsAndColumns) = v19;
        LOWORD(v33.malloc) = 2080;
        *(void *(__cdecl **)(size_t))((char *)&v33.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
        WORD1(v33.free) = 1024;
        HIDWORD(v33.free) = v16;
        LOWORD(v33.reportError) = 1024;
        *(_DWORD *)((char *)&v33.reportError + 2) = v17;
        v28 = MEMORY[0x24BDACB70];
        v29 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
      }
    }
    else
    {
      if (v33.reportError)
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v34 = 0u;
        memset(&v33, 0, sizeof(v33));
        snprintf((char *)&v33, 0x100uLL, "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n", "B");
        goto LABEL_27;
      }
      v27 = *(_DWORD *)(a2 + 4 * v24);
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_58;
      v33.control = 136316418;
      *(_QWORD *)&v33.orderMethod = "B";
      WORD2(v33.order) = 1024;
      *(_DWORD *)((char *)&v33.order + 6) = v27;
      WORD1(v33.ignoreRowsAndColumns) = 1024;
      HIDWORD(v33.ignoreRowsAndColumns) = v19;
      LOWORD(v33.malloc) = 2080;
      *(void *(__cdecl **)(size_t))((char *)&v33.malloc + 2) = (void *(__cdecl *)(size_t))"X";
      WORD1(v33.free) = 1024;
      HIDWORD(v33.free) = v25;
      LOWORD(v33.reportError) = 1024;
      *(_DWORD *)((char *)&v33.reportError + 2) = v23;
      v28 = MEMORY[0x24BDACB70];
      v29 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
    }
    _os_log_error_impl(&dword_20AB80000, v28, OS_LOG_TYPE_ERROR, v29, (uint8_t *)&v33, 0x2Eu);
    goto LABEL_58;
  }
  if (v33.reportError)
  {
LABEL_26:
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    memset(&v33, 0, sizeof(v33));
    snprintf((char *)&v33, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
LABEL_27:
    ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v33);
    return;
  }
  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    goto LABEL_58;
  v33.control = 136315906;
  *(_QWORD *)&v33.orderMethod = "X";
  WORD2(v33.order) = 1024;
  *(_DWORD *)((char *)&v33.order + 6) = columnStride;
  WORD1(v33.ignoreRowsAndColumns) = 2080;
  *(int **)((char *)&v33.ignoreRowsAndColumns + 4) = (int *)"X";
  WORD2(v33.malloc) = 1024;
  *(_DWORD *)((char *)&v33.malloc + 6) = rowCount;
  v26 = MEMORY[0x24BDACB70];
LABEL_41:
  _os_log_error_impl(&dword_20AB80000, v26, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", (uint8_t *)&v33, 0x22u);
LABEL_58:
  _SparseTrap();
}

void sub_20ABE4510(const SparseOpaqueSubfactor_Float *a1, uint64_t a2, const DenseMatrix_Float *a3)
{
  void (__cdecl *reportError)(const char *);
  SparseAttributes_t attributes;
  int factorization_low;
  int v9;
  int v10;
  int v11;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int columnStride;
  int rowCount;
  __int16 v20;
  int v21;
  int v22;
  int v23;
  void (__cdecl *free)(void *);
  size_t v25;
  char *v26;
  char *v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  SparseSymbolicFactorOptions v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)&a1->contents + 2))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32.control) = 0;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Subfactor does not hold a valid factorization.\n", (uint8_t *)&v32, 2u);
    }
    goto LABEL_63;
  }
  _SparseGetOptionsFromSymbolicFactor(&v32, &a1->factor.symbolicFactorization);
  reportError = v32.reportError;
  attributes = a1->attributes;
  factorization_low = LOBYTE(a1->factor.symbolicFactorization.factorization);
  v9 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  v10 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  if (v9 >= v10)
    v11 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  else
    v11 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  if (v9 <= v10)
    v9 = v10;
  if (*((_BYTE *)&a1->contents + 2) == 6 && BYTE1(a1->factor.symbolicFactorization.factorization) == 40)
    v13 = v9;
  else
    v13 = v11;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v14 = v13;
  else
    v14 = v11;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v15 = v11;
  else
    v15 = v13;
  v16 = *(_DWORD *)(a2 + 8);
  v17 = *(_DWORD *)a2;
  if (v16 < *(_DWORD *)a2)
  {
    if (v32.reportError)
      goto LABEL_26;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136315906;
    *(_QWORD *)&v32.orderMethod = "B";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v16;
    WORD1(v32.ignoreRowsAndColumns) = 2080;
    *(int **)((char *)&v32.ignoreRowsAndColumns + 4) = (int *)"B";
    WORD2(v32.malloc) = 1024;
    *(_DWORD *)((char *)&v32.malloc + 6) = v17;
    v28 = MEMORY[0x24BDACB70];
    goto LABEL_42;
  }
  columnStride = a3->columnStride;
  rowCount = a3->rowCount;
  if (columnStride < a3->rowCount)
  {
    if (v32.reportError)
    {
LABEL_26:
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      snprintf((char *)&v32, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
LABEL_27:
      ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v32);
      return;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136315906;
    *(_QWORD *)&v32.orderMethod = "X";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = columnStride;
    WORD1(v32.ignoreRowsAndColumns) = 2080;
    *(int **)((char *)&v32.ignoreRowsAndColumns + 4) = (int *)"X";
    WORD2(v32.malloc) = 1024;
    *(_DWORD *)((char *)&v32.malloc + 6) = rowCount;
    v28 = MEMORY[0x24BDACB70];
LABEL_42:
    _os_log_error_impl(&dword_20AB80000, v28, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", (uint8_t *)&v32, 0x22u);
    goto LABEL_63;
  }
  v20 = *(_WORD *)(a2 + 12);
  if ((v20 & 1) == 0)
    v17 = *(_DWORD *)(a2 + 4);
  v21 = *(&a3->rowCount + ((*(_WORD *)&a3->attributes & 1) == 0));
  v22 = *(_DWORD *)(a2 + 4 * (v20 & 1));
  v23 = *(&a3->rowCount + (*(_WORD *)&a3->attributes & 1));
  if (v17 != v21)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      snprintf((char *)&v32, 0x100uLL, "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n", "B");
      goto LABEL_27;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136316418;
    *(_QWORD *)&v32.orderMethod = "B";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v22;
    WORD1(v32.ignoreRowsAndColumns) = 1024;
    HIDWORD(v32.ignoreRowsAndColumns) = v17;
    LOWORD(v32.malloc) = 2080;
    *(void *(__cdecl **)(size_t))((char *)&v32.malloc + 2) = (void *(__cdecl *)(size_t))"X";
    WORD1(v32.free) = 1024;
    HIDWORD(v32.free) = v23;
    LOWORD(v32.reportError) = 1024;
    *(_DWORD *)((char *)&v32.reportError + 2) = v21;
    v29 = MEMORY[0x24BDACB70];
    v30 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
    goto LABEL_60;
  }
  if (v17 <= 0)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      snprintf((char *)&v32, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
      goto LABEL_27;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v32.control = 136315650;
      *(_QWORD *)&v32.orderMethod = "B";
      WORD2(v32.order) = 1024;
      *(_DWORD *)((char *)&v32.order + 6) = v22;
      WORD1(v32.ignoreRowsAndColumns) = 1024;
      HIDWORD(v32.ignoreRowsAndColumns) = v17;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", (uint8_t *)&v32, 0x18u);
    }
    goto LABEL_63;
  }
  if (v22 != v15)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      v31 = "B";
LABEL_51:
      snprintf((char *)&v32, 0x100uLL, "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n", v31);
      goto LABEL_27;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136316418;
    *(_QWORD *)&v32.orderMethod = "B";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v22;
    WORD1(v32.ignoreRowsAndColumns) = 1024;
    HIDWORD(v32.ignoreRowsAndColumns) = v17;
    LOWORD(v32.malloc) = 2080;
    *(void *(__cdecl **)(size_t))((char *)&v32.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
    WORD1(v32.free) = 1024;
    HIDWORD(v32.free) = v14;
    LOWORD(v32.reportError) = 1024;
    *(_DWORD *)((char *)&v32.reportError + 2) = v15;
    v29 = MEMORY[0x24BDACB70];
    v30 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
LABEL_60:
    _os_log_error_impl(&dword_20AB80000, v29, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v32, 0x2Eu);
    goto LABEL_63;
  }
  if (v23 != v14)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      v31 = "X";
      goto LABEL_51;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136316418;
    *(_QWORD *)&v32.orderMethod = "X";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v23;
    WORD1(v32.ignoreRowsAndColumns) = 1024;
    HIDWORD(v32.ignoreRowsAndColumns) = v17;
    LOWORD(v32.malloc) = 2080;
    *(void *(__cdecl **)(size_t))((char *)&v32.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
    WORD1(v32.free) = 1024;
    HIDWORD(v32.free) = v14;
    LOWORD(v32.reportError) = 1024;
    *(_DWORD *)((char *)&v32.reportError + 2) = v15;
    v29 = MEMORY[0x24BDACB70];
    v30 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
    goto LABEL_60;
  }
  free = v32.free;
  v25 = a1->workspaceRequiredPerRHS + *(_QWORD *)&a1[1].attributes * v17;
  v26 = (char *)((uint64_t (*)(size_t))v32.malloc)(v25);
  if (v26)
  {
    v27 = v26;
    _SparseSolveSubfactor_Float(a1, (const DenseMatrix_Float *)a2, a3, v26);
    ((void (*)(char *))free)(v27);
    return;
  }
  if (reportError)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
    memset(&v32, 0, sizeof(v32));
    snprintf((char *)&v32, 0x100uLL, "Failed to allocate workspace of size %ld.\n");
    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v32.control = 134217984;
    *(_QWORD *)&v32.orderMethod = v25;
    _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to allocate workspace of size %ld.\n", (uint8_t *)&v32, 0xCu);
  }
LABEL_63:
  _SparseTrap();
}

__n128 cva::VecLibSparse<float>::solve(_OWORD *a1, DenseMatrix_Float *a2, __int128 *a3, char *a4)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  DenseMatrix_Float v14;
  __int128 v15;
  uint64_t v16;
  _OWORD v17[8];
  DenseMatrix_Float v18;
  __int128 v19;
  uint64_t v20;
  _OWORD v21[8];

  v4 = a1[5];
  if (a4)
  {
    v21[4] = a1[4];
    v21[5] = v4;
    v5 = a1[7];
    v21[6] = a1[6];
    v21[7] = v5;
    v6 = a1[1];
    v21[0] = *a1;
    v21[1] = v6;
    v7 = a1[3];
    v21[2] = a1[2];
    v21[3] = v7;
    v8 = *a3;
    v20 = *((_QWORD *)a3 + 2);
    v19 = v8;
    v18 = *a2;
    sub_20ABE3EC0((const SparseOpaqueSubfactor_Float *)v21, (uint64_t)&v19, &v18, a4);
  }
  else
  {
    v17[4] = a1[4];
    v17[5] = v4;
    v10 = a1[7];
    v17[6] = a1[6];
    v17[7] = v10;
    v11 = a1[1];
    v17[0] = *a1;
    v17[1] = v11;
    v12 = a1[3];
    v17[2] = a1[2];
    v17[3] = v12;
    v13 = *a3;
    v16 = *((_QWORD *)a3 + 2);
    v15 = v13;
    v14 = *a2;
    sub_20ABE4510((const SparseOpaqueSubfactor_Float *)v17, (uint64_t)&v15, &v14);
  }
  return result;
}

void cva::VecLibSparse<float>::solve(_OWORD *a1, uint64_t a2, char *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  _DWORD v8[4];
  uint64_t v9;
  _OWORD v10[8];

  v3 = a1[5];
  v10[4] = a1[4];
  v10[5] = v3;
  v4 = a1[7];
  v10[6] = a1[6];
  v10[7] = v4;
  v5 = a1[1];
  v10[0] = *a1;
  v10[1] = v5;
  v6 = a1[3];
  v10[2] = a1[2];
  v10[3] = v6;
  v7 = *(_QWORD *)(a2 + 8);
  v8[0] = *(_DWORD *)a2;
  v8[1] = 1;
  v8[2] = v8[0];
  v8[3] = 0;
  v9 = v7;
  if (a3)
    sub_20ABE4D80((const SparseOpaqueSubfactor_Float *)v10, (uint64_t)v8, a3);
  else
    sub_20ABE5018((const SparseOpaqueSubfactor_Float *)v10, (uint64_t)v8);
}

void sub_20ABE4D80(const SparseOpaqueSubfactor_Float *a1, uint64_t a2, char *a3)
{
  void (*v6)(_BYTE *);
  int v7;
  SparseAttributes_t attributes;
  int factorization_low;
  int v10;
  int v11;
  int v12;
  int v14;
  BOOL v15;
  int v16;
  int v17;
  NSObject *v18;
  const char *v19;
  _BYTE v20[256];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)&a1->contents + 2))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_WORD *)v20 = 0;
    v18 = MEMORY[0x24BDACB70];
    v19 = "Subfactor does not hold a valid factor subobject.\n";
LABEL_37:
    _os_log_error_impl(&dword_20AB80000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_25;
  }
  _SparseGetOptionsFromSymbolicFactor((SparseSymbolicFactorOptions *)v20, &a1->factor.symbolicFactorization);
  v6 = *(void (**)(_BYTE *))&v20[40];
  if (*(int *)(a2 + 4 * ((*(_WORD *)(a2 + 12) & 1) == 0)) > 0)
  {
    v7 = *(_DWORD *)(a2 + 4 * (*(_WORD *)(a2 + 12) & 1));
    attributes = a1->attributes;
    factorization_low = LOBYTE(a1->factor.symbolicFactorization.factorization);
    v10 = a1->factor.symbolicFactorization.rowCount * factorization_low;
    v11 = a1->factor.symbolicFactorization.columnCount * factorization_low;
    if (v10 <= v11)
      v12 = v11;
    else
      v12 = v10;
    if (v10 < v11)
      v11 = v10;
    if (*((_BYTE *)&a1->contents + 2) == 6 && BYTE1(a1->factor.symbolicFactorization.factorization) == 40)
      v14 = v12;
    else
      v14 = v11;
    v15 = (*(_BYTE *)&attributes & 1) == 0;
    if ((*(_BYTE *)&attributes & 1) != 0)
      v16 = v11;
    else
      v16 = v14;
    if (v15)
      v14 = v11;
    if (v16 <= v14)
      v17 = v14;
    else
      v17 = v16;
    if (v7 == v17)
    {
      _SparseSolveSubfactor_Float(a1, 0, (const DenseMatrix_Float *)a2, a3);
      return;
    }
    if (*(_QWORD *)&v20[40])
    {
      memset(v20, 0, sizeof(v20));
      snprintf(v20, 0x100uLL, "XB dimension (%d) must match maximum subfactor dimension (%d).\n", v7, v17);
      goto LABEL_30;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v20 = 67109376;
      *(_DWORD *)&v20[4] = v7;
      *(_WORD *)&v20[8] = 1024;
      *(_DWORD *)&v20[10] = v17;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "XB dimension (%d) must match maximum subfactor dimension (%d).\n", v20, 0xEu);
    }
LABEL_25:
    _SparseTrap();
    return;
  }
  if (!*(_QWORD *)&v20[40])
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_WORD *)v20 = 0;
    v18 = MEMORY[0x24BDACB70];
    v19 = "XB must have non-zero dimension.\n";
    goto LABEL_37;
  }
  memset(&v20[34], 0, 222);
  strcpy(v20, "XB must have non-zero dimension.\n");
LABEL_30:
  v6(v20);
}

void sub_20ABE5018(const SparseOpaqueSubfactor_Float *a1, uint64_t a2)
{
  void (*v4)(_BYTE *);
  uint64_t v5;
  uint64_t v6;
  int v7;
  SparseAttributes_t attributes;
  int factorization_low;
  int v10;
  int v11;
  int v12;
  int v14;
  BOOL v15;
  int v16;
  int v17;
  void (*v18)(char *);
  uint64_t v19;
  char *v20;
  char *v21;
  NSObject *v22;
  const char *v23;
  _BYTE v24[256];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)&a1->contents + 2))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_WORD *)v24 = 0;
    v22 = MEMORY[0x24BDACB70];
    v23 = "Subfactor does not hold a valid factorization.\n";
    goto LABEL_42;
  }
  _SparseGetOptionsFromSymbolicFactor((SparseSymbolicFactorOptions *)v24, &a1->factor.symbolicFactorization);
  v4 = *(void (**)(_BYTE *))&v24[40];
  v5 = *(_WORD *)(a2 + 12) & 1;
  v6 = *(unsigned int *)(a2 + 4 * ((_DWORD)v5 == 0));
  if ((int)v6 <= 0)
  {
    if (*(_QWORD *)&v24[40])
    {
      memset(&v24[34], 0, 222);
      strcpy(v24, "XB must have non-zero dimension.\n");
      goto LABEL_35;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_WORD *)v24 = 0;
    v22 = MEMORY[0x24BDACB70];
    v23 = "XB must have non-zero dimension.\n";
LABEL_42:
    _os_log_error_impl(&dword_20AB80000, v22, OS_LOG_TYPE_ERROR, v23, v24, 2u);
    goto LABEL_26;
  }
  v7 = *(_DWORD *)(a2 + 4 * v5);
  attributes = a1->attributes;
  factorization_low = LOBYTE(a1->factor.symbolicFactorization.factorization);
  v10 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  v11 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  if (v10 <= v11)
    v12 = v11;
  else
    v12 = v10;
  if (v10 < v11)
    v11 = v10;
  if (*((_BYTE *)&a1->contents + 2) == 6 && BYTE1(a1->factor.symbolicFactorization.factorization) == 40)
    v14 = v12;
  else
    v14 = v11;
  v15 = (*(_BYTE *)&attributes & 1) == 0;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v16 = v11;
  else
    v16 = v14;
  if (v15)
    v14 = v11;
  if (v16 <= v14)
    v17 = v14;
  else
    v17 = v16;
  if (v7 == v17)
  {
    v18 = *(void (**)(char *))&v24[32];
    v19 = a1->workspaceRequiredPerRHS + *(_QWORD *)&a1[1].attributes * v6;
    v20 = (char *)(*(uint64_t (**)(uint64_t))&v24[24])(v19);
    if (v20)
    {
      v21 = v20;
      _SparseSolveSubfactor_Float(a1, 0, (const DenseMatrix_Float *)a2, v20);
      v18(v21);
      return;
    }
    if (v4)
    {
      memset(v24, 0, sizeof(v24));
      snprintf(v24, 0x100uLL, "Failed to allocate workspace of size %ld.\n");
      goto LABEL_35;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 134217984;
      *(_QWORD *)&v24[4] = v19;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to allocate workspace of size %ld.\n", v24, 0xCu);
    }
LABEL_26:
    _SparseTrap();
    return;
  }
  if (!*(_QWORD *)&v24[40])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 67109376;
      *(_DWORD *)&v24[4] = v7;
      *(_WORD *)&v24[8] = 1024;
      *(_DWORD *)&v24[10] = v17;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "XB dimension (%d) must match maximum subfactor dimension (%d).\n", v24, 0xEu);
    }
    goto LABEL_26;
  }
  memset(v24, 0, sizeof(v24));
  snprintf(v24, 0x100uLL, "XB dimension (%d) must match maximum subfactor dimension (%d).\n");
LABEL_35:
  v4(v24);
}

__n128 cva::VecLibSparse<float>::solve(_OWORD *a1, __int128 *a2, char *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _OWORD v15[8];
  __int128 v16;
  uint64_t v17;
  _OWORD v18[8];

  v3 = a1[5];
  if (a3)
  {
    v18[4] = a1[4];
    v18[5] = v3;
    v4 = a1[7];
    v18[6] = a1[6];
    v18[7] = v4;
    v5 = a1[1];
    v18[0] = *a1;
    v18[1] = v5;
    v6 = a1[3];
    v18[2] = a1[2];
    v18[3] = v6;
    v7 = *a2;
    v17 = *((_QWORD *)a2 + 2);
    v16 = v7;
    sub_20ABE4D80((const SparseOpaqueSubfactor_Float *)v18, (uint64_t)&v16, a3);
  }
  else
  {
    v15[4] = a1[4];
    v15[5] = v3;
    v9 = a1[7];
    v15[6] = a1[6];
    v15[7] = v9;
    v10 = a1[1];
    v15[0] = *a1;
    v15[1] = v10;
    v11 = a1[3];
    v15[2] = a1[2];
    v15[3] = v11;
    v12 = *a2;
    v14 = *((_QWORD *)a2 + 2);
    v13 = v12;
    sub_20ABE5018((const SparseOpaqueSubfactor_Float *)v15, (uint64_t)&v13);
  }
  return result;
}

__n128 cva::VecLibSparse<float>::multiply(_OWORD *a1, __int128 *a2, __int128 *a3, char *a4)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  DenseMatrix_Float v14;
  __int128 v15;
  uint64_t v16;
  _OWORD v17[8];
  __int128 v18;
  uint64_t v19;
  DenseMatrix_Float v20;
  _OWORD v21[8];

  v4 = a1[5];
  if (a4)
  {
    v21[4] = a1[4];
    v21[5] = v4;
    v5 = a1[7];
    v21[6] = a1[6];
    v21[7] = v5;
    v6 = a1[1];
    v21[0] = *a1;
    v21[1] = v6;
    v7 = a1[3];
    v21[2] = a1[2];
    v21[3] = v7;
    v8 = *a2;
    v20.data = (float *)*((_QWORD *)a2 + 2);
    *(_OWORD *)&v20.rowCount = v8;
    v19 = *((_QWORD *)a3 + 2);
    v18 = *a3;
    sub_20ABE54C0((const SparseOpaqueSubfactor_Float *)v21, &v20, (uint64_t)&v18, a4);
  }
  else
  {
    v17[4] = a1[4];
    v17[5] = v4;
    v10 = a1[7];
    v17[6] = a1[6];
    v17[7] = v10;
    v11 = a1[1];
    v17[0] = *a1;
    v17[1] = v11;
    v12 = a1[3];
    v17[2] = a1[2];
    v17[3] = v12;
    v13 = *a2;
    v16 = *((_QWORD *)a2 + 2);
    v15 = v13;
    v14 = *(DenseMatrix_Float *)a3;
    sub_20ABE5B10((const SparseOpaqueSubfactor_Float *)v17, (uint64_t)&v15, &v14);
  }
  return result;
}

void sub_20ABE54C0(const SparseOpaqueSubfactor_Float *a1, const DenseMatrix_Float *a2, uint64_t a3, char *a4)
{
  void (__cdecl *reportError)(const char *);
  SparseAttributes_t attributes;
  int factorization_low;
  int v11;
  int v12;
  int v13;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int columnStride;
  int rowCount;
  __int16 v22;
  int v23;
  unsigned int v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  int v31;
  int v32;
  SparseSymbolicFactorOptions v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)&a1->contents + 2))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v33.control) = 0;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Subfactor does not hold a valid factor subobject.\n", (uint8_t *)&v33, 2u);
    }
    goto LABEL_58;
  }
  _SparseGetOptionsFromSymbolicFactor(&v33, &a1->factor.symbolicFactorization);
  reportError = v33.reportError;
  attributes = a1->attributes;
  factorization_low = LOBYTE(a1->factor.symbolicFactorization.factorization);
  v11 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  v12 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  if (v11 >= v12)
    v13 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  else
    v13 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  if (v11 <= v12)
    v11 = v12;
  if (*((_BYTE *)&a1->contents + 2) == 6 && BYTE1(a1->factor.symbolicFactorization.factorization) == 40)
    v15 = v11;
  else
    v15 = v13;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v16 = v15;
  else
    v16 = v13;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v17 = v13;
  else
    v17 = v15;
  v18 = *(_DWORD *)(a3 + 8);
  v19 = *(_DWORD *)a3;
  if (v18 < *(_DWORD *)a3)
  {
    if (v33.reportError)
      goto LABEL_26;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_58;
    v33.control = 136315906;
    *(_QWORD *)&v33.orderMethod = "Y";
    WORD2(v33.order) = 1024;
    *(_DWORD *)((char *)&v33.order + 6) = v18;
    WORD1(v33.ignoreRowsAndColumns) = 2080;
    *(int **)((char *)&v33.ignoreRowsAndColumns + 4) = (int *)"Y";
    WORD2(v33.malloc) = 1024;
    *(_DWORD *)((char *)&v33.malloc + 6) = v19;
    v26 = MEMORY[0x24BDACB70];
    goto LABEL_41;
  }
  columnStride = a2->columnStride;
  rowCount = a2->rowCount;
  if (columnStride >= a2->rowCount)
  {
    v22 = *(_WORD *)(a3 + 12);
    if ((v22 & 1) == 0)
      v19 = *(_DWORD *)(a3 + 4);
    v23 = *(&a2->rowCount + ((*(_WORD *)&a2->attributes & 1) == 0));
    v24 = v22 & 1;
    v25 = *(&a2->rowCount + (*(_WORD *)&a2->attributes & 1));
    if (v19 == v23)
    {
      if (v19 <= 0)
      {
        if (v33.reportError)
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v34 = 0u;
          memset(&v33, 0, sizeof(v33));
          snprintf((char *)&v33, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
          goto LABEL_27;
        }
        v31 = *(_DWORD *)(a3 + 4 * v24);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v33.control = 136315650;
          *(_QWORD *)&v33.orderMethod = "Y";
          WORD2(v33.order) = 1024;
          *(_DWORD *)((char *)&v33.order + 6) = v31;
          WORD1(v33.ignoreRowsAndColumns) = 1024;
          HIDWORD(v33.ignoreRowsAndColumns) = v19;
          _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", (uint8_t *)&v33, 0x18u);
        }
        goto LABEL_58;
      }
      if (*(_DWORD *)(a3 + 4 * v24) == v17)
      {
        if (v25 == v16)
        {
          _SparseMultiplySubfactor_Float(a1, a2, (const DenseMatrix_Float *)a3, a4);
          return;
        }
        if (v33.reportError)
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v34 = 0u;
          memset(&v33, 0, sizeof(v33));
          v30 = "X";
          goto LABEL_50;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_58;
        v33.control = 136316418;
        *(_QWORD *)&v33.orderMethod = "X";
        WORD2(v33.order) = 1024;
        *(_DWORD *)((char *)&v33.order + 6) = v25;
        WORD1(v33.ignoreRowsAndColumns) = 1024;
        HIDWORD(v33.ignoreRowsAndColumns) = v19;
        LOWORD(v33.malloc) = 2080;
        *(void *(__cdecl **)(size_t))((char *)&v33.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
        WORD1(v33.free) = 1024;
        HIDWORD(v33.free) = v16;
        LOWORD(v33.reportError) = 1024;
        *(_DWORD *)((char *)&v33.reportError + 2) = v17;
        v28 = MEMORY[0x24BDACB70];
        v29 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
      }
      else
      {
        if (v33.reportError)
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v34 = 0u;
          memset(&v33, 0, sizeof(v33));
          v30 = "Y";
LABEL_50:
          snprintf((char *)&v33, 0x100uLL, "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n", v30);
          goto LABEL_27;
        }
        v32 = *(_DWORD *)(a3 + 4 * v24);
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_58;
        v33.control = 136316418;
        *(_QWORD *)&v33.orderMethod = "Y";
        WORD2(v33.order) = 1024;
        *(_DWORD *)((char *)&v33.order + 6) = v32;
        WORD1(v33.ignoreRowsAndColumns) = 1024;
        HIDWORD(v33.ignoreRowsAndColumns) = v19;
        LOWORD(v33.malloc) = 2080;
        *(void *(__cdecl **)(size_t))((char *)&v33.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
        WORD1(v33.free) = 1024;
        HIDWORD(v33.free) = v16;
        LOWORD(v33.reportError) = 1024;
        *(_DWORD *)((char *)&v33.reportError + 2) = v17;
        v28 = MEMORY[0x24BDACB70];
        v29 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
      }
    }
    else
    {
      if (v33.reportError)
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v34 = 0u;
        memset(&v33, 0, sizeof(v33));
        snprintf((char *)&v33, 0x100uLL, "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n", "Y");
        goto LABEL_27;
      }
      v27 = *(_DWORD *)(a3 + 4 * v24);
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_58;
      v33.control = 136316418;
      *(_QWORD *)&v33.orderMethod = "Y";
      WORD2(v33.order) = 1024;
      *(_DWORD *)((char *)&v33.order + 6) = v27;
      WORD1(v33.ignoreRowsAndColumns) = 1024;
      HIDWORD(v33.ignoreRowsAndColumns) = v19;
      LOWORD(v33.malloc) = 2080;
      *(void *(__cdecl **)(size_t))((char *)&v33.malloc + 2) = (void *(__cdecl *)(size_t))"X";
      WORD1(v33.free) = 1024;
      HIDWORD(v33.free) = v25;
      LOWORD(v33.reportError) = 1024;
      *(_DWORD *)((char *)&v33.reportError + 2) = v23;
      v28 = MEMORY[0x24BDACB70];
      v29 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
    }
    _os_log_error_impl(&dword_20AB80000, v28, OS_LOG_TYPE_ERROR, v29, (uint8_t *)&v33, 0x2Eu);
    goto LABEL_58;
  }
  if (v33.reportError)
  {
LABEL_26:
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    memset(&v33, 0, sizeof(v33));
    snprintf((char *)&v33, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
LABEL_27:
    ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v33);
    return;
  }
  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    goto LABEL_58;
  v33.control = 136315906;
  *(_QWORD *)&v33.orderMethod = "X";
  WORD2(v33.order) = 1024;
  *(_DWORD *)((char *)&v33.order + 6) = columnStride;
  WORD1(v33.ignoreRowsAndColumns) = 2080;
  *(int **)((char *)&v33.ignoreRowsAndColumns + 4) = (int *)"X";
  WORD2(v33.malloc) = 1024;
  *(_DWORD *)((char *)&v33.malloc + 6) = rowCount;
  v26 = MEMORY[0x24BDACB70];
LABEL_41:
  _os_log_error_impl(&dword_20AB80000, v26, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", (uint8_t *)&v33, 0x22u);
LABEL_58:
  _SparseTrap();
}

void sub_20ABE5B10(const SparseOpaqueSubfactor_Float *a1, uint64_t a2, const DenseMatrix_Float *a3)
{
  void (__cdecl *reportError)(const char *);
  SparseAttributes_t attributes;
  int factorization_low;
  int v9;
  int v10;
  int v11;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int columnStride;
  int rowCount;
  __int16 v20;
  int v21;
  int v22;
  int v23;
  void (__cdecl *free)(void *);
  size_t v25;
  char *v26;
  char *v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  SparseSymbolicFactorOptions v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)&a1->contents + 2))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32.control) = 0;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Subfactor does not hold a valid factor subobject.\n", (uint8_t *)&v32, 2u);
    }
    goto LABEL_63;
  }
  _SparseGetOptionsFromSymbolicFactor(&v32, &a1->factor.symbolicFactorization);
  reportError = v32.reportError;
  attributes = a1->attributes;
  factorization_low = LOBYTE(a1->factor.symbolicFactorization.factorization);
  v9 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  v10 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  if (v9 >= v10)
    v11 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  else
    v11 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  if (v9 <= v10)
    v9 = v10;
  if (*((_BYTE *)&a1->contents + 2) == 6 && BYTE1(a1->factor.symbolicFactorization.factorization) == 40)
    v13 = v9;
  else
    v13 = v11;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v14 = v13;
  else
    v14 = v11;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v15 = v11;
  else
    v15 = v13;
  v16 = *(_DWORD *)(a2 + 8);
  v17 = *(_DWORD *)a2;
  if (v16 < *(_DWORD *)a2)
  {
    if (v32.reportError)
      goto LABEL_26;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136315906;
    *(_QWORD *)&v32.orderMethod = "X";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v16;
    WORD1(v32.ignoreRowsAndColumns) = 2080;
    *(int **)((char *)&v32.ignoreRowsAndColumns + 4) = (int *)"X";
    WORD2(v32.malloc) = 1024;
    *(_DWORD *)((char *)&v32.malloc + 6) = v17;
    v28 = MEMORY[0x24BDACB70];
    goto LABEL_42;
  }
  columnStride = a3->columnStride;
  rowCount = a3->rowCount;
  if (columnStride < a3->rowCount)
  {
    if (v32.reportError)
    {
LABEL_26:
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      snprintf((char *)&v32, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
LABEL_27:
      ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v32);
      return;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136315906;
    *(_QWORD *)&v32.orderMethod = "Y";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = columnStride;
    WORD1(v32.ignoreRowsAndColumns) = 2080;
    *(int **)((char *)&v32.ignoreRowsAndColumns + 4) = (int *)"Y";
    WORD2(v32.malloc) = 1024;
    *(_DWORD *)((char *)&v32.malloc + 6) = rowCount;
    v28 = MEMORY[0x24BDACB70];
LABEL_42:
    _os_log_error_impl(&dword_20AB80000, v28, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", (uint8_t *)&v32, 0x22u);
    goto LABEL_63;
  }
  v20 = *(_WORD *)(a2 + 12);
  if ((v20 & 1) == 0)
    v17 = *(_DWORD *)(a2 + 4);
  v21 = *(&a3->rowCount + ((*(_WORD *)&a3->attributes & 1) == 0));
  v22 = *(_DWORD *)(a2 + 4 * (v20 & 1));
  v23 = *(&a3->rowCount + (*(_WORD *)&a3->attributes & 1));
  if (v17 != v21)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      snprintf((char *)&v32, 0x100uLL, "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n", "X");
      goto LABEL_27;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136316418;
    *(_QWORD *)&v32.orderMethod = "X";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v22;
    WORD1(v32.ignoreRowsAndColumns) = 1024;
    HIDWORD(v32.ignoreRowsAndColumns) = v17;
    LOWORD(v32.malloc) = 2080;
    *(void *(__cdecl **)(size_t))((char *)&v32.malloc + 2) = (void *(__cdecl *)(size_t))"Y";
    WORD1(v32.free) = 1024;
    HIDWORD(v32.free) = v23;
    LOWORD(v32.reportError) = 1024;
    *(_DWORD *)((char *)&v32.reportError + 2) = v21;
    v29 = MEMORY[0x24BDACB70];
    v30 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
    goto LABEL_60;
  }
  if (v17 <= 0)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      snprintf((char *)&v32, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
      goto LABEL_27;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v32.control = 136315650;
      *(_QWORD *)&v32.orderMethod = "X";
      WORD2(v32.order) = 1024;
      *(_DWORD *)((char *)&v32.order + 6) = v22;
      WORD1(v32.ignoreRowsAndColumns) = 1024;
      HIDWORD(v32.ignoreRowsAndColumns) = v17;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", (uint8_t *)&v32, 0x18u);
    }
    goto LABEL_63;
  }
  if (v22 != v14)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      v31 = "X";
LABEL_51:
      snprintf((char *)&v32, 0x100uLL, "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n", v31);
      goto LABEL_27;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136316418;
    *(_QWORD *)&v32.orderMethod = "X";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v22;
    WORD1(v32.ignoreRowsAndColumns) = 1024;
    HIDWORD(v32.ignoreRowsAndColumns) = v17;
    LOWORD(v32.malloc) = 2080;
    *(void *(__cdecl **)(size_t))((char *)&v32.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
    WORD1(v32.free) = 1024;
    HIDWORD(v32.free) = v15;
    LOWORD(v32.reportError) = 1024;
    *(_DWORD *)((char *)&v32.reportError + 2) = v14;
    v29 = MEMORY[0x24BDACB70];
    v30 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
LABEL_60:
    _os_log_error_impl(&dword_20AB80000, v29, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v32, 0x2Eu);
    goto LABEL_63;
  }
  if (v23 != v15)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      v31 = "Y";
      goto LABEL_51;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136316418;
    *(_QWORD *)&v32.orderMethod = "Y";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v23;
    WORD1(v32.ignoreRowsAndColumns) = 1024;
    HIDWORD(v32.ignoreRowsAndColumns) = v17;
    LOWORD(v32.malloc) = 2080;
    *(void *(__cdecl **)(size_t))((char *)&v32.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
    WORD1(v32.free) = 1024;
    HIDWORD(v32.free) = v15;
    LOWORD(v32.reportError) = 1024;
    *(_DWORD *)((char *)&v32.reportError + 2) = v14;
    v29 = MEMORY[0x24BDACB70];
    v30 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
    goto LABEL_60;
  }
  free = v32.free;
  v25 = a1->workspaceRequiredPerRHS + *(_QWORD *)&a1[1].attributes * v17;
  v26 = (char *)((uint64_t (*)(size_t))v32.malloc)(v25);
  if (v26)
  {
    v27 = v26;
    _SparseMultiplySubfactor_Float(a1, (const DenseMatrix_Float *)a2, a3, v26);
    ((void (*)(char *))free)(v27);
    return;
  }
  if (reportError)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
    memset(&v32, 0, sizeof(v32));
    snprintf((char *)&v32, 0x100uLL, "Failed to allocate workspace of size %ld.\n");
    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v32.control = 134217984;
    *(_QWORD *)&v32.orderMethod = v25;
    _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to allocate workspace of size %ld.\n", (uint8_t *)&v32, 0xCu);
  }
LABEL_63:
  _SparseTrap();
}

void cva::VecLibSparse<float>::multiply(_OWORD *a1, uint64_t a2, uint64_t a3, char *a4)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  float *v8;
  int v9;
  float *v10;
  DenseMatrix_Float v11;
  DenseMatrix_Float v12;
  _OWORD v13[8];

  v4 = a1[5];
  v13[4] = a1[4];
  v13[5] = v4;
  v5 = a1[7];
  v13[6] = a1[6];
  v13[7] = v5;
  v6 = a1[1];
  v13[0] = *a1;
  v13[1] = v6;
  v7 = a1[3];
  v13[2] = a1[2];
  v13[3] = v7;
  v8 = *(float **)(a2 + 8);
  v9 = *(_DWORD *)a3;
  v10 = *(float **)(a3 + 8);
  v12.rowCount = *(_DWORD *)a2;
  v12.columnCount = 1;
  v12.columnStride = v12.rowCount;
  *(_DWORD *)&v12.attributes = 0;
  v12.data = v8;
  v11.rowCount = v9;
  v11.columnCount = 1;
  v11.columnStride = v9;
  *(_DWORD *)&v11.attributes = 0;
  v11.data = v10;
  if (a4)
    sub_20ABE54C0((const SparseOpaqueSubfactor_Float *)v13, &v12, (uint64_t)&v11, a4);
  else
    sub_20ABE5B10((const SparseOpaqueSubfactor_Float *)v13, (uint64_t)&v12, &v11);
}

void cva::VecLibSparse<double>::multiply(uint64_t a1, __int128 *a2, __int128 *a3)
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  _OWORD v8[2];
  uint64_t v9;

  v3 = *(_OWORD *)(a1 + 16);
  v8[0] = *(_OWORD *)a1;
  v8[1] = v3;
  v9 = *(_QWORD *)(a1 + 32);
  v6 = *a2;
  v7 = *((_QWORD *)a2 + 2);
  v4 = *a3;
  v5 = *((_QWORD *)a3 + 2);
  sub_20ABE6338((uint64_t)v8, (int *)&v6, (uint64_t)&v4, 1.0);
}

void sub_20ABE6338(uint64_t a1, int *a2, uint64_t a3, double a4)
{
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  __int128 v16;
  NSObject *v17;
  const char *v18;
  DenseMatrix_Double v19;
  DenseMatrix_Double x;
  SparseMatrix_Double A;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[14];
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a3 + 8);
  v5 = *(_DWORD *)a3;
  if (v4 >= *(_DWORD *)a3)
  {
    v7 = a2[2];
    v8 = *a2;
    if (v7 >= *a2)
    {
      v9 = *(_WORD *)(a3 + 12);
      if ((v9 & 1) == 0)
        v5 = *(_DWORD *)(a3 + 4);
      v10 = a2[(a2[3] & 1) == 0];
      v11 = *(_DWORD *)(a3 + 4 * (v9 & 1));
      v12 = a2[a2[3] & 1];
      if (v5 == v10)
      {
        if (v5 <= 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v23 = "Y";
            v24 = 1024;
            v25 = v11;
            v26 = 1024;
            *(_DWORD *)v27 = v5;
            _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", buf, 0x18u);
          }
          goto LABEL_24;
        }
        v13 = *(unsigned __int8 *)(a1 + 28);
        v14 = *(_DWORD *)(a1 + 4 * (*(_WORD *)(a1 + 24) & 1)) * v13;
        v15 = *(_DWORD *)(a1 + 4 * ((*(_WORD *)(a1 + 24) & 1) == 0)) * v13;
        if (v11 == v14)
        {
          if (v12 == v15)
          {
            v16 = *(_OWORD *)(a1 + 16);
            *(_OWORD *)&A.structure.rowCount = *(_OWORD *)a1;
            *(_OWORD *)&A.structure.rowIndices = v16;
            A.data = *(double **)(a1 + 32);
            x = *(DenseMatrix_Double *)a2;
            v19 = *(DenseMatrix_Double *)a3;
            _SparseSpMV_Double(a4, &A, &x, 0, &v19);
            return;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_DWORD *)buf = 136316418;
          v23 = "X";
          v24 = 1024;
          v25 = v12;
          v26 = 1024;
          *(_DWORD *)v27 = v5;
          *(_WORD *)&v27[4] = 2080;
          *(_QWORD *)&v27[6] = "matrix A";
          v28 = 1024;
          v29 = v15;
          v30 = 1024;
          v31 = v14;
          v17 = MEMORY[0x24BDACB70];
          v18 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_DWORD *)buf = 136316418;
          v23 = "Y";
          v24 = 1024;
          v25 = v11;
          v26 = 1024;
          *(_DWORD *)v27 = v5;
          *(_WORD *)&v27[4] = 2080;
          *(_QWORD *)&v27[6] = "matrix A";
          v28 = 1024;
          v29 = v15;
          v30 = 1024;
          v31 = v14;
          v17 = MEMORY[0x24BDACB70];
          v18 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
        }
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_24;
        *(_DWORD *)buf = 136316418;
        v23 = "Y";
        v24 = 1024;
        v25 = v11;
        v26 = 1024;
        *(_DWORD *)v27 = v5;
        *(_WORD *)&v27[4] = 2080;
        *(_QWORD *)&v27[6] = "X";
        v28 = 1024;
        v29 = v12;
        v30 = 1024;
        v31 = v10;
        v17 = MEMORY[0x24BDACB70];
        v18 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
      }
      _os_log_error_impl(&dword_20AB80000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x2Eu);
      goto LABEL_24;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v23 = "X";
      v24 = 1024;
      v25 = v7;
      v26 = 2080;
      *(_QWORD *)v27 = "X";
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)&v27[10] = v8;
      v6 = MEMORY[0x24BDACB70];
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v23 = "Y";
    v24 = 1024;
    v25 = v4;
    v26 = 2080;
    *(_QWORD *)v27 = "Y";
    *(_WORD *)&v27[8] = 1024;
    *(_DWORD *)&v27[10] = v5;
    v6 = MEMORY[0x24BDACB70];
LABEL_7:
    _os_log_error_impl(&dword_20AB80000, v6, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", buf, 0x22u);
  }
LABEL_24:
  _SparseTrap();
}

void cva::VecLibSparse<double>::multiply(uint64_t a1, __int128 *a2, __int128 *a3, double a4)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  _OWORD v9[2];
  uint64_t v10;

  v4 = *(_OWORD *)(a1 + 16);
  v9[0] = *(_OWORD *)a1;
  v9[1] = v4;
  v10 = *(_QWORD *)(a1 + 32);
  v7 = *a2;
  v8 = *((_QWORD *)a2 + 2);
  v5 = *a3;
  v6 = *((_QWORD *)a3 + 2);
  sub_20ABE6338((uint64_t)v9, (int *)&v7, (uint64_t)&v5, a4);
}

void cva::VecLibSparse<double>::multiply(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  _OWORD v4[2];
  uint64_t v5;

  v3 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v3;
  v5 = *(_QWORD *)(a1 + 32);
  sub_20ABE67E8((uint64_t)v4, *(_QWORD *)a2, *(double **)(a2 + 8), *(_QWORD *)a3, *(double **)(a3 + 8), 1.0);
}

void sub_20ABE67E8(uint64_t a1, int a2, double *a3, int a4, double *a5, double a6)
{
  int v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  __int128 v15;
  NSObject *v16;
  const char *v17;
  DenseMatrix_Double v18;
  DenseMatrix_Double x;
  SparseMatrix_Double A;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = *(unsigned __int8 *)(a1 + 28);
  v8 = *(_WORD *)(a1 + 24) & 1;
  v9 = (_DWORD)v8 == 0;
  v10 = *(_DWORD *)(a1 + 4 * v8);
  v11 = v9;
  v12 = v10 * v7;
  v13 = *(_DWORD *)(a1 + 4 * v11) * v7;
  if (v13 != a2)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_DWORD *)buf = 67109888;
    v22 = v12;
    v23 = 1024;
    v24 = v13;
    v25 = 1024;
    v26 = a2;
    v27 = 1024;
    v28 = 1;
    v16 = MEMORY[0x24BDACB70];
    v17 = "Matrix dimensions (%dx%d) do not match x vector dimensions %dx%d\n";
LABEL_13:
    _os_log_error_impl(&dword_20AB80000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x1Au);
    goto LABEL_10;
  }
  if (v12 == a4)
  {
    v15 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&A.structure.rowCount = *(_OWORD *)a1;
    *(_OWORD *)&A.structure.rowIndices = v15;
    A.data = *(double **)(a1 + 32);
    x.rowCount = a2;
    x.columnCount = 1;
    x.columnStride = a2;
    x.attributes = 0;
    x.data = a3;
    v18.rowCount = a4;
    v18.columnCount = 1;
    v18.columnStride = a4;
    v18.attributes = 0;
    v18.data = a5;
    _SparseSpMV_Double(a6, &A, &x, 0, &v18);
    return;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109888;
    v22 = v12;
    v23 = 1024;
    v24 = a2;
    v25 = 1024;
    v26 = a4;
    v27 = 1024;
    v28 = 1;
    v16 = MEMORY[0x24BDACB70];
    v17 = "Matrix dimensions (%dx%d) do not match y vector dimensions %dx%d\n";
    goto LABEL_13;
  }
LABEL_10:
  _SparseTrap();
}

void cva::VecLibSparse<double>::multiply(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  __int128 v4;
  _OWORD v5[2];
  uint64_t v6;

  v4 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v4;
  v6 = *(_QWORD *)(a1 + 32);
  sub_20ABE67E8((uint64_t)v5, *(_QWORD *)a2, *(double **)(a2 + 8), *(_QWORD *)a3, *(double **)(a3 + 8), a4);
}

void cva::VecLibSparse<double>::multiplyAdd(uint64_t a1, __int128 *a2, __int128 *a3)
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  _OWORD v8[2];
  uint64_t v9;

  v3 = *(_OWORD *)(a1 + 16);
  v8[0] = *(_OWORD *)a1;
  v8[1] = v3;
  v9 = *(_QWORD *)(a1 + 32);
  v6 = *a2;
  v7 = *((_QWORD *)a2 + 2);
  v4 = *a3;
  v5 = *((_QWORD *)a3 + 2);
  sub_20ABE6A2C((uint64_t)v8, (int *)&v6, (uint64_t)&v4, 1.0);
}

void sub_20ABE6A2C(uint64_t a1, int *a2, uint64_t a3, double a4)
{
  int v4;
  int v5;
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  __int128 v16;
  NSObject *v17;
  const char *v18;
  DenseMatrix_Double v19;
  DenseMatrix_Double x;
  SparseMatrix_Double A;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  _BYTE v27[14];
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(a3 + 8);
  v5 = *(_DWORD *)a3;
  if (v4 >= *(_DWORD *)a3)
  {
    v7 = a2[2];
    v8 = *a2;
    if (v7 >= *a2)
    {
      v9 = *(_WORD *)(a3 + 12);
      if ((v9 & 1) == 0)
        v5 = *(_DWORD *)(a3 + 4);
      v10 = a2[(a2[3] & 1) == 0];
      v11 = *(_DWORD *)(a3 + 4 * (v9 & 1));
      v12 = a2[a2[3] & 1];
      if (v5 == v10)
      {
        if (v5 <= 0)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v23 = "Y";
            v24 = 1024;
            v25 = v11;
            v26 = 1024;
            *(_DWORD *)v27 = v5;
            _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", buf, 0x18u);
          }
          goto LABEL_24;
        }
        v13 = *(unsigned __int8 *)(a1 + 28);
        v14 = *(_DWORD *)(a1 + 4 * (*(_WORD *)(a1 + 24) & 1)) * v13;
        v15 = *(_DWORD *)(a1 + 4 * ((*(_WORD *)(a1 + 24) & 1) == 0)) * v13;
        if (v11 == v14)
        {
          if (v12 == v15)
          {
            v16 = *(_OWORD *)(a1 + 16);
            *(_OWORD *)&A.structure.rowCount = *(_OWORD *)a1;
            *(_OWORD *)&A.structure.rowIndices = v16;
            A.data = *(double **)(a1 + 32);
            x = *(DenseMatrix_Double *)a2;
            v19 = *(DenseMatrix_Double *)a3;
            _SparseSpMV_Double(a4, &A, &x, 1, &v19);
            return;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_DWORD *)buf = 136316418;
          v23 = "X";
          v24 = 1024;
          v25 = v12;
          v26 = 1024;
          *(_DWORD *)v27 = v5;
          *(_WORD *)&v27[4] = 2080;
          *(_QWORD *)&v27[6] = "matrix A";
          v28 = 1024;
          v29 = v15;
          v30 = 1024;
          v31 = v14;
          v17 = MEMORY[0x24BDACB70];
          v18 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_24;
          *(_DWORD *)buf = 136316418;
          v23 = "Y";
          v24 = 1024;
          v25 = v11;
          v26 = 1024;
          *(_DWORD *)v27 = v5;
          *(_WORD *)&v27[4] = 2080;
          *(_QWORD *)&v27[6] = "matrix A";
          v28 = 1024;
          v29 = v15;
          v30 = 1024;
          v31 = v14;
          v17 = MEMORY[0x24BDACB70];
          v18 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
        }
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_24;
        *(_DWORD *)buf = 136316418;
        v23 = "Y";
        v24 = 1024;
        v25 = v11;
        v26 = 1024;
        *(_DWORD *)v27 = v5;
        *(_WORD *)&v27[4] = 2080;
        *(_QWORD *)&v27[6] = "X";
        v28 = 1024;
        v29 = v12;
        v30 = 1024;
        v31 = v10;
        v17 = MEMORY[0x24BDACB70];
        v18 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
      }
      _os_log_error_impl(&dword_20AB80000, v17, OS_LOG_TYPE_ERROR, v18, buf, 0x2Eu);
      goto LABEL_24;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v23 = "X";
      v24 = 1024;
      v25 = v7;
      v26 = 2080;
      *(_QWORD *)v27 = "X";
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)&v27[10] = v8;
      v6 = MEMORY[0x24BDACB70];
      goto LABEL_7;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v23 = "Y";
    v24 = 1024;
    v25 = v4;
    v26 = 2080;
    *(_QWORD *)v27 = "Y";
    *(_WORD *)&v27[8] = 1024;
    *(_DWORD *)&v27[10] = v5;
    v6 = MEMORY[0x24BDACB70];
LABEL_7:
    _os_log_error_impl(&dword_20AB80000, v6, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", buf, 0x22u);
  }
LABEL_24:
  _SparseTrap();
}

void cva::VecLibSparse<double>::multiplyAdd(uint64_t a1, __int128 *a2, __int128 *a3, double a4)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  _OWORD v9[2];
  uint64_t v10;

  v4 = *(_OWORD *)(a1 + 16);
  v9[0] = *(_OWORD *)a1;
  v9[1] = v4;
  v10 = *(_QWORD *)(a1 + 32);
  v7 = *a2;
  v8 = *((_QWORD *)a2 + 2);
  v5 = *a3;
  v6 = *((_QWORD *)a3 + 2);
  sub_20ABE6A2C((uint64_t)v9, (int *)&v7, (uint64_t)&v5, a4);
}

void cva::VecLibSparse<double>::multiplyAdd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3;
  _OWORD v4[2];
  uint64_t v5;

  v3 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v3;
  v5 = *(_QWORD *)(a1 + 32);
  sub_20ABE6EDC((uint64_t)v4, *(_QWORD *)a2, *(double **)(a2 + 8), *(_QWORD *)a3, *(double **)(a3 + 8), 1.0);
}

void sub_20ABE6EDC(uint64_t a1, int a2, double *a3, int a4, double *a5, double a6)
{
  int v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  __int128 v15;
  NSObject *v16;
  const char *v17;
  DenseMatrix_Double v18;
  DenseMatrix_Double x;
  SparseMatrix_Double A;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = *(unsigned __int8 *)(a1 + 28);
  v8 = *(_WORD *)(a1 + 24) & 1;
  v9 = (_DWORD)v8 == 0;
  v10 = *(_DWORD *)(a1 + 4 * v8);
  v11 = v9;
  v12 = v10 * v7;
  v13 = *(_DWORD *)(a1 + 4 * v11) * v7;
  if (v13 != a2)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_DWORD *)buf = 67109888;
    v22 = v12;
    v23 = 1024;
    v24 = v13;
    v25 = 1024;
    v26 = a2;
    v27 = 1024;
    v28 = 1;
    v16 = MEMORY[0x24BDACB70];
    v17 = "Matrix dimensions (%dx%d) do not match x vector dimensions %dx%d\n";
LABEL_13:
    _os_log_error_impl(&dword_20AB80000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x1Au);
    goto LABEL_10;
  }
  if (v12 == a4)
  {
    v15 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&A.structure.rowCount = *(_OWORD *)a1;
    *(_OWORD *)&A.structure.rowIndices = v15;
    A.data = *(double **)(a1 + 32);
    x.rowCount = a2;
    x.columnCount = 1;
    x.columnStride = a2;
    x.attributes = 0;
    x.data = a3;
    v18.rowCount = a4;
    v18.columnCount = 1;
    v18.columnStride = a4;
    v18.attributes = 0;
    v18.data = a5;
    _SparseSpMV_Double(a6, &A, &x, 1, &v18);
    return;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109888;
    v22 = v12;
    v23 = 1024;
    v24 = a2;
    v25 = 1024;
    v26 = a4;
    v27 = 1024;
    v28 = 1;
    v16 = MEMORY[0x24BDACB70];
    v17 = "Matrix dimensions (%dx%d) do not match y vector dimensions %dx%d\n";
    goto LABEL_13;
  }
LABEL_10:
  _SparseTrap();
}

void cva::VecLibSparse<double>::multiplyAdd(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  __int128 v4;
  _OWORD v5[2];
  uint64_t v6;

  v4 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v4;
  v6 = *(_QWORD *)(a1 + 32);
  sub_20ABE6EDC((uint64_t)v5, *(_QWORD *)a2, *(double **)(a2 + 8), *(_QWORD *)a3, *(double **)(a3 + 8), a4);
}

double cva::VecLibSparse<double>::transpose@<D0>(__int128 *a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  double result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v3 = a1[5];
  v16 = a1[4];
  v17 = v3;
  v4 = a1[7];
  v18 = a1[6];
  v19 = v4;
  v5 = a1[1];
  v12 = *a1;
  v13 = v5;
  v6 = a1[3];
  v14 = a1[2];
  v15 = v6;
  LOWORD(v12) = v12 ^ 1;
  _SparseRetainNumeric_Double((SparseOpaqueFactorization_Double *)((char *)&v12 + 8));
  v7 = v17;
  a2[4] = v16;
  a2[5] = v7;
  v8 = v19;
  a2[6] = v18;
  a2[7] = v8;
  v9 = v13;
  *a2 = v12;
  a2[1] = v9;
  result = *(double *)&v14;
  v11 = v15;
  a2[2] = v14;
  a2[3] = v11;
  return result;
}

__n128 cva::VecLibSparse<double>::transpose@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  SparseOpaqueFactorization_Double v9;
  uint64_t v10;

  v3 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v9.userFactorStorage = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v9.solveWorkspaceRequiredStatic = v3;
  v10 = *(_QWORD *)(a1 + 96);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v9.status = *(_OWORD *)a1;
  *(_OWORD *)&v9.symbolicFactorization.columnCount = v4;
  v5 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v9.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v9.symbolicFactorization.factorSize_Float = v5;
  *(_WORD *)&v9.attributes ^= 1u;
  _SparseRetainNumeric_Double(&v9);
  v6 = *(_OWORD *)&v9.solveWorkspaceRequiredStatic;
  *(_OWORD *)(a2 + 64) = *(_OWORD *)&v9.userFactorStorage;
  *(_OWORD *)(a2 + 80) = v6;
  *(_QWORD *)(a2 + 96) = v10;
  v7 = *(_OWORD *)&v9.symbolicFactorization.columnCount;
  *(_OWORD *)a2 = *(_OWORD *)&v9.status;
  *(_OWORD *)(a2 + 16) = v7;
  result = *(__n128 *)&v9.symbolicFactorization.factorSize_Float;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v9.symbolicFactorization.workspaceSize_Float;
  *(__n128 *)(a2 + 48) = result;
  return result;
}

{
  __n128 result;
  __int16 v3;

  result = *(__n128 *)a1;
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 16);
  v3 = *(_WORD *)(a1 + 24);
  *(_QWORD *)(a2 + 26) = *(_QWORD *)(a1 + 26);
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  *(_WORD *)(a2 + 24) = v3 ^ 1;
  return result;
}

void cva::VecLibSparse<double>::release(_OWORD *a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  _OWORD v5[8];

  v1 = a1[5];
  v5[4] = a1[4];
  v5[5] = v1;
  v2 = a1[7];
  v5[6] = a1[6];
  v5[7] = v2;
  v3 = a1[1];
  v5[0] = *a1;
  v5[1] = v3;
  v4 = a1[3];
  v5[2] = a1[2];
  v5[3] = v4;
  _SparseDestroyOpaqueNumeric_Double((SparseOpaqueFactorization_Double *)((char *)v5 + 8));
}

__n128 cva::VecLibSparse<double>::release(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __n128 result;
  SparseOpaqueFactorization_Double v5;
  uint64_t v6;

  v1 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v5.userFactorStorage = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v5.solveWorkspaceRequiredStatic = v1;
  v6 = *(_QWORD *)(a1 + 96);
  v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v5.status = *(_OWORD *)a1;
  *(_OWORD *)&v5.symbolicFactorization.columnCount = v2;
  v3 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v5.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v5.symbolicFactorization.factorSize_Float = v3;
  _SparseDestroyOpaqueNumeric_Double(&v5);
  return result;
}

void cva::VecLibSparse<double>::retain(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  void (*v4)(_BYTE *);
  NSObject *v5;
  SparseOpaqueFactorization_Double v6;
  uint64_t v7;
  _BYTE v8[63];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v1 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v6.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v6.symbolicFactorization.factorSize_Float = v1;
  v2 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v6.userFactorStorage = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v6.solveWorkspaceRequiredStatic = v2;
  v7 = *(_QWORD *)(a1 + 96);
  v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v6.status = *(_OWORD *)a1;
  *(_OWORD *)&v6.symbolicFactorization.columnCount = v3;
  if (v6.symbolicFactorization.status || !v6.symbolicFactorization.workspaceSize_Float)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      v5 = MEMORY[0x24BDACB70];
      goto LABEL_14;
    }
LABEL_7:
    _SparseTrap();
    return;
  }
  _SparseGetOptionsFromSymbolicFactor((SparseSymbolicFactorOptions *)v8, &v6.symbolicFactorization);
  v4 = *(void (**)(_BYTE *))&v8[40];
  if (v6.status == SparseStatusOK && v6.solveWorkspaceRequiredStatic)
  {
    _SparseRetainNumeric_Double(&v6);
    return;
  }
  if (!*(_QWORD *)&v8[40])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      v5 = MEMORY[0x24BDACB70];
LABEL_14:
      _os_log_error_impl(&dword_20AB80000, v5, OS_LOG_TYPE_ERROR, "Can only retain valid numeric factorizations.\n", v8, 2u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v21 = 0;
  v20 = 0u;
  v19 = 0u;
  v18 = 0u;
  v17 = 0u;
  v16 = 0u;
  v15 = 0u;
  v14 = 0u;
  v13 = 0u;
  v12 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  *(_OWORD *)&v8[47] = 0u;
  strcpy(v8, "Can only retain valid numeric factorizations.\n");
  v4(v8);
}

void cva::VecLibSparse<double>::retain(__int128 *a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;
  void (__cdecl *reportError)(const char *);
  NSObject *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  SparseSymbolicFactorOptions v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v1 = a1[5];
  v11 = a1[4];
  v12 = v1;
  v2 = a1[7];
  v13 = a1[6];
  v14 = v2;
  v3 = a1[1];
  v7 = *a1;
  v8 = v3;
  v4 = a1[3];
  v9 = a1[2];
  v10 = v4;
  if ((_DWORD)v3 || !*((_QWORD *)&v9 + 1))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15.control) = 0;
      v6 = MEMORY[0x24BDACB70];
      goto LABEL_14;
    }
LABEL_7:
    _SparseTrap();
    return;
  }
  _SparseGetOptionsFromSymbolicFactor(&v15, (SparseOpaqueSymbolicFactorization *)&v8);
  reportError = v15.reportError;
  if (!DWORD2(v7) && *((_QWORD *)&v12 + 1))
  {
    _SparseRetainNumeric_Double((SparseOpaqueFactorization_Double *)((char *)&v7 + 8));
    return;
  }
  if (!v15.reportError)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15.control) = 0;
      v6 = MEMORY[0x24BDACB70];
LABEL_14:
      _os_log_error_impl(&dword_20AB80000, v6, OS_LOG_TYPE_ERROR, "Can only retain valid objects.\n", (uint8_t *)&v15, 2u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  *(_OWORD *)&v15.free = 0u;
  v16 = 0u;
  strcpy((char *)&v15, "Can only retain valid objects.\n");
  ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v15);
}

double cva::VecLibSparse<double>::factor@<D0>(SparseFactorization_t factorType@<W1>, uint64_t a2@<X0>, uint64_t a3@<X8>)
{
  __int128 v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint32_t v8;
  double result;
  SparseNumericFactorOptions v10;
  SparseSymbolicFactorOptions sfoptions;
  SparseMatrix_Double Matrix;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int rowCount;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int columnCount;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&Matrix.structure.rowCount = *(_OWORD *)a2;
  *(_OWORD *)&Matrix.structure.rowIndices = v4;
  Matrix.data = *(double **)(a2 + 32);
  sfoptions = *(SparseSymbolicFactorOptions *)byte_24C37F3A8;
  v10 = *(SparseNumericFactorOptions *)ymmword_20AC062D0;
  if (Matrix.structure.rowCount <= 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136315394;
    v14 = "Matrix.structure";
    v15 = 1024;
    LODWORD(v16) = Matrix.structure.rowCount;
    v6 = MEMORY[0x24BDACB70];
    v7 = "%s.rowCount must be > 0, but is %d.\n";
LABEL_14:
    v8 = 18;
    goto LABEL_15;
  }
  if (Matrix.structure.columnCount <= 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136315394;
    v14 = "Matrix.structure";
    v15 = 1024;
    LODWORD(v16) = Matrix.structure.rowCount;
    v6 = MEMORY[0x24BDACB70];
    v7 = "%s.columnCount must be > 0, but is %d.\n";
    goto LABEL_14;
  }
  if (!*(&Matrix.structure.blockSize + 2))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    *(_DWORD *)buf = 136315394;
    v14 = "Matrix.structure";
    v15 = 1024;
    LODWORD(v16) = 0;
    v6 = MEMORY[0x24BDACB70];
    v7 = "%s.blockSize must be > 0, but is %d.]n";
    goto LABEL_14;
  }
  v5 = *(_BYTE *)&Matrix.structure.attributes & 0xC;
  if (Matrix.structure.rowCount == Matrix.structure.columnCount || v5 != 12)
  {
    if ((factorType & 0xFE) == 0x28)
    {
      _SparseFactorQR_Double((SparseOpaqueFactorization_Double *)a3, factorType, &Matrix, &sfoptions, &v10);
      return result;
    }
    if (v5 == 12)
    {
      _SparseFactorSymmetric_Double((SparseOpaqueFactorization_Double *)a3, factorType, &Matrix, &sfoptions, &v10);
      return result;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v6 = MEMORY[0x24BDACB70];
      v7 = "Cannot perform symmetric matrix factorization of non-square matrix.\n";
      v8 = 2;
      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v14 = "Matrix.structure";
    v15 = 2080;
    v16 = "Matrix.structure";
    v17 = 1024;
    rowCount = Matrix.structure.rowCount;
    v19 = 2080;
    v20 = "Matrix.structure";
    v21 = 1024;
    columnCount = Matrix.structure.columnCount;
    v6 = MEMORY[0x24BDACB70];
    v7 = "%s.attributes.kind=SparseSymmetric, but %s.rowCount (%d) != %s.columnCount (%d).\n";
    v8 = 44;
LABEL_15:
    _os_log_error_impl(&dword_20AB80000, v6, OS_LOG_TYPE_ERROR, v7, buf, v8);
  }
LABEL_21:
  _SparseTrap();
  result = 0.0;
  *(_QWORD *)(a3 + 96) = 0;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_DWORD *)a3 = -4;
  *(_DWORD *)(a3 + 8) = -4;
  return result;
}

void cva::VecLibSparse<double>::refactor(__int128 *a1, SparseOpaqueFactorization_Double *factor)
{
  SparseOpaqueSymbolicFactorization *p_symbolicFactorization;
  void (__cdecl *free)(void *);
  void (__cdecl *reportError)(const char *);
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  size_t factorSize_Float;
  __int128 v11;
  __int128 v12;
  void (__cdecl *v13)(void *);
  SparseNumericFactorOptions v14;
  SparseNumericFactorOptions v15;
  SparseNumericFactorOptions nfoptions;
  SparseSymbolicFactorOptions v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v11 = *a1;
  v12 = a1[1];
  v13 = (void (__cdecl *)(void *))*((_QWORD *)a1 + 4);
  p_symbolicFactorization = &factor->symbolicFactorization;
  if (factor->symbolicFactorization.status || !factor->symbolicFactorization.workspaceSize_Float)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    LOWORD(v17.control) = 0;
    v8 = MEMORY[0x24BDACB70];
    v9 = "Factorization does not hold a completed matrix factorization.\n";
LABEL_21:
    _os_log_error_impl(&dword_20AB80000, v8, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v17, 2u);
    goto LABEL_3;
  }
  memset(&v15, 0, sizeof(v15));
  _SparseGetOptionsFromNumericFactor_Double(&v15, factor);
  v14 = v15;
  if (factor->symbolicFactorization.status || !factor->symbolicFactorization.workspaceSize_Float)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    LOWORD(v17.control) = 0;
    v8 = MEMORY[0x24BDACB70];
    v9 = "Factorization does not hold a valid symbolic matrix factorization.\n";
    goto LABEL_21;
  }
  _SparseGetOptionsFromSymbolicFactor(&v17, p_symbolicFactorization);
  free = v17.free;
  reportError = v17.reportError;
  v6 = (void *)((uint64_t (*)(size_t))v17.malloc)(factor->symbolicFactorization.factorSize_Float);
  if (!v6)
  {
    factor->status = SparseInternalError;
    if (reportError)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v18 = 0u;
      memset(&v17, 0, sizeof(v17));
      snprintf((char *)&v17, 0x100uLL, "Failed to allocate workspace of size %ld.", factor->symbolicFactorization.factorSize_Float);
      ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v17);
      return;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      factorSize_Float = factor->symbolicFactorization.factorSize_Float;
      v17.control = 134217984;
      *(_QWORD *)&v17.orderMethod = factorSize_Float;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to allocate workspace of size %ld.", (uint8_t *)&v17, 0xCu);
    }
LABEL_3:
    _SparseTrap();
    return;
  }
  v7 = v6;
  *(_OWORD *)&v17.control = v11;
  *(_OWORD *)&v17.ignoreRowsAndColumns = v12;
  v17.free = v13;
  nfoptions = v14;
  if ((_DWORD)v11 == factor->symbolicFactorization.rowCount
    && *(_DWORD *)&v17.orderMethod == factor->symbolicFactorization.columnCount
    && BYTE4(v17.malloc) == LOBYTE(factor->symbolicFactorization.factorization)
    && ((*(_WORD *)&factor->symbolicFactorization.attributes ^ LOWORD(v17.malloc)) & 1) == 0)
  {
    if ((BYTE1(factor->symbolicFactorization.factorization) & 0xFE) == 0x28)
      _SparseRefactorQR_Double((const SparseMatrix_Double *)&v17, factor, &nfoptions, v6);
    else
      _SparseRefactorSymmetric_Double((const SparseMatrix_Double *)&v17, factor, &nfoptions, v6);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "Matrix";
      v33 = 2080;
      v34 = "Factored->symbolicFactorization";
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s does not match that used for symbolic factorization stored in %s.\n", buf, 0x16u);
    }
    _SparseTrap();
  }
  ((void (*)(void *))free)(v7);
}

void cva::VecLibSparse<double>::solve(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  SparseControl_t v12;
  int *v13;
  int v14;
  double *v15;
  void (__cdecl *reportError)(const char *);
  int v17;
  int v18;
  int v19;
  int v20;
  double *v21;
  int v22;
  double *v23;
  int v24;
  int v25;
  int v26;
  void (__cdecl *free)(void *);
  size_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  SparseOpaqueFactorization_Double v34;
  uint64_t v35;
  SparseOpaqueFactorization_Double Factored;
  uint64_t v37;
  DenseMatrix_Double v38;
  DenseMatrix_Double Soln;
  SparseSymbolicFactorOptions v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v4 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&Factored.userFactorStorage = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&Factored.solveWorkspaceRequiredStatic = v4;
    v37 = *(_QWORD *)(a1 + 96);
    v5 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&Factored.status = *(_OWORD *)a1;
    *(_OWORD *)&Factored.symbolicFactorization.columnCount = v5;
    v6 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)&Factored.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
    *(_OWORD *)&Factored.symbolicFactorization.factorSize_Float = v6;
    if (Factored.symbolicFactorization.status == SparseStatusOK && Factored.symbolicFactorization.workspaceSize_Float)
    {
      v12 = *(_DWORD *)a3;
      v13 = *(int **)(a3 + 8);
      v14 = *(_DWORD *)a2;
      v15 = *(double **)(a2 + 8);
      _SparseGetOptionsFromSymbolicFactor(&v40, &Factored.symbolicFactorization);
      reportError = v40.reportError;
      if (Factored.symbolicFactorization.status == SparseStatusOK
        && Factored.symbolicFactorization.workspaceSize_Float
        && Factored.status == SparseStatusOK
        && Factored.solveWorkspaceRequiredStatic)
      {
        if (((*(_BYTE *)&Factored.attributes ^ *(_BYTE *)&Factored.symbolicFactorization.attributes) & 1) != 0)
          v17 = Factored.symbolicFactorization.columnCount * LOBYTE(Factored.symbolicFactorization.factorization);
        else
          v17 = Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization);
        if (((*(_BYTE *)&Factored.attributes ^ *(_BYTE *)&Factored.symbolicFactorization.attributes) & 1) != 0)
          v18 = Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization);
        else
          v18 = Factored.symbolicFactorization.columnCount * LOBYTE(Factored.symbolicFactorization.factorization);
        if (BYTE1(Factored.symbolicFactorization.factorization) == 40)
          v19 = v17;
        else
          v19 = v18;
        if (v18 == v14)
        {
          if (v19 == v12)
          {
            v40.control = v12;
            *(_DWORD *)&v40.orderMethod = 1;
            v40.ignoreRowsAndColumns = v13;
            v40.order = (int *)v12;
            Soln.rowCount = v14;
            Soln.columnCount = 1;
            *(_DWORD *)&Soln.attributes = 0;
            Soln.data = v15;
            Soln.columnStride = v14;
            _SparseSolveOpaque_Double(&Factored, (const DenseMatrix_Double *)&v40, &Soln, a4);
            return;
          }
          if (v40.reportError)
            goto LABEL_62;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v40.control = 136316162;
            *(_QWORD *)&v40.orderMethod = "b";
            *(_DWORD *)((char *)&v40.order + 6) = v12;
            WORD1(v40.ignoreRowsAndColumns) = 2080;
            WORD2(v40.order) = 1024;
            *(int **)((char *)&v40.ignoreRowsAndColumns + 4) = (int *)"Factored";
            WORD2(v40.malloc) = 1024;
            *(_DWORD *)((char *)&v40.malloc + 6) = v19;
            WORD1(v40.free) = 1024;
            HIDWORD(v40.free) = v14;
            v33 = MEMORY[0x24BDACB70];
            goto LABEL_72;
          }
LABEL_7:
          _SparseTrap();
          return;
        }
        if (v40.reportError)
          goto LABEL_62;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v40.control = 136316162;
        *(_QWORD *)&v40.orderMethod = "x";
        *(_DWORD *)((char *)&v40.order + 6) = v14;
        WORD1(v40.ignoreRowsAndColumns) = 2080;
        WORD2(v40.order) = 1024;
        *(int **)((char *)&v40.ignoreRowsAndColumns + 4) = (int *)"Factored";
        WORD2(v40.malloc) = 1024;
        *(_DWORD *)((char *)&v40.malloc + 6) = v19;
        WORD1(v40.free) = 1024;
        HIDWORD(v40.free) = v18;
        v33 = MEMORY[0x24BDACB70];
LABEL_72:
        _os_log_error_impl(&dword_20AB80000, v33, OS_LOG_TYPE_ERROR, "%s (size %dx1) does not match dimensions of matrix factorization %s (%d x %d).\n", (uint8_t *)&v40, 0x28u);
        goto LABEL_7;
      }
      if (!v40.reportError)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v40.control = 136315138;
        *(_QWORD *)&v40.orderMethod = "Factored";
        v31 = MEMORY[0x24BDACB70];
        v32 = "%s does not hold a completed matrix factorization.\n";
        goto LABEL_58;
      }
      goto LABEL_47;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    LOWORD(v40.control) = 0;
    v7 = MEMORY[0x24BDACB70];
LABEL_55:
    _os_log_error_impl(&dword_20AB80000, v7, OS_LOG_TYPE_ERROR, "Factored does not hold a completed matrix factorization.\n", (uint8_t *)&v40, 2u);
    goto LABEL_7;
  }
  v8 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v34.userFactorStorage = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v34.solveWorkspaceRequiredStatic = v8;
  v35 = *(_QWORD *)(a1 + 96);
  v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v34.status = *(_OWORD *)a1;
  *(_OWORD *)&v34.symbolicFactorization.columnCount = v9;
  v10 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v34.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v34.symbolicFactorization.factorSize_Float = v10;
  if (v34.symbolicFactorization.status || !v34.symbolicFactorization.workspaceSize_Float)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    LOWORD(v40.control) = 0;
    v7 = MEMORY[0x24BDACB70];
    goto LABEL_55;
  }
  v20 = *(_DWORD *)a3;
  v21 = *(double **)(a3 + 8);
  v22 = *(_DWORD *)a2;
  v23 = *(double **)(a2 + 8);
  _SparseGetOptionsFromSymbolicFactor(&v40, &v34.symbolicFactorization);
  reportError = v40.reportError;
  if (v34.symbolicFactorization.status == SparseStatusOK
    && v34.symbolicFactorization.workspaceSize_Float
    && v34.status == SparseStatusOK
    && v34.solveWorkspaceRequiredStatic)
  {
    if (((*(_BYTE *)&v34.attributes ^ *(_BYTE *)&v34.symbolicFactorization.attributes) & 1) != 0)
      v24 = v34.symbolicFactorization.columnCount * LOBYTE(v34.symbolicFactorization.factorization);
    else
      v24 = v34.symbolicFactorization.rowCount * LOBYTE(v34.symbolicFactorization.factorization);
    if (((*(_BYTE *)&v34.attributes ^ *(_BYTE *)&v34.symbolicFactorization.attributes) & 1) != 0)
      v25 = v34.symbolicFactorization.rowCount * LOBYTE(v34.symbolicFactorization.factorization);
    else
      v25 = v34.symbolicFactorization.columnCount * LOBYTE(v34.symbolicFactorization.factorization);
    if (BYTE1(v34.symbolicFactorization.factorization) == 40)
      v26 = v24;
    else
      v26 = v25;
    if (v25 != v22)
    {
      if (v40.reportError)
        goto LABEL_62;
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v40.control = 136316162;
      *(_QWORD *)&v40.orderMethod = "x";
      *(_DWORD *)((char *)&v40.order + 6) = v22;
      WORD1(v40.ignoreRowsAndColumns) = 2080;
      WORD2(v40.order) = 1024;
      *(int **)((char *)&v40.ignoreRowsAndColumns + 4) = (int *)"Factored";
      WORD2(v40.malloc) = 1024;
      *(_DWORD *)((char *)&v40.malloc + 6) = v26;
      WORD1(v40.free) = 1024;
      HIDWORD(v40.free) = v25;
      v33 = MEMORY[0x24BDACB70];
      goto LABEL_72;
    }
    if (v26 != v20)
    {
      if (!v40.reportError)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v40.control = 136316162;
          *(_QWORD *)&v40.orderMethod = "b";
          *(_DWORD *)((char *)&v40.order + 6) = v20;
          WORD1(v40.ignoreRowsAndColumns) = 2080;
          WORD2(v40.order) = 1024;
          *(int **)((char *)&v40.ignoreRowsAndColumns + 4) = (int *)"Factored";
          WORD2(v40.malloc) = 1024;
          *(_DWORD *)((char *)&v40.malloc + 6) = v26;
          WORD1(v40.free) = 1024;
          HIDWORD(v40.free) = v22;
          v33 = MEMORY[0x24BDACB70];
          goto LABEL_72;
        }
        goto LABEL_7;
      }
LABEL_62:
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v41 = 0u;
      memset(&v40, 0, sizeof(v40));
      snprintf((char *)&v40, 0x100uLL, "%s (size %dx1) does not match dimensions of matrix factorization %s (%d x %d).\n");
      goto LABEL_63;
    }
    free = v40.free;
    Soln.rowCount = v20;
    Soln.columnCount = 1;
    *(_DWORD *)&Soln.attributes = 0;
    Soln.data = v21;
    Soln.columnStride = v20;
    *(_DWORD *)&v38.attributes = 0;
    v38.data = v23;
    v38.rowCount = v22;
    v38.columnCount = 1;
    v38.columnStride = v22;
    v28 = v35 + v34.solveWorkspaceRequiredPerRHS;
    v29 = (void *)((uint64_t (*)(size_t))v40.malloc)(v35 + v34.solveWorkspaceRequiredPerRHS);
    if (v29)
    {
      v30 = v29;
      _SparseSolveOpaque_Double(&v34, &Soln, &v38, v29);
      ((void (*)(void *))free)(v30);
      return;
    }
    if (reportError)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v41 = 0u;
      memset(&v40, 0, sizeof(v40));
      snprintf((char *)&v40, 0x100uLL, "Failed to allocate workspace of size %ld for SparseSolve().\n");
      goto LABEL_63;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v40.control = 134217984;
    *(_QWORD *)&v40.orderMethod = v28;
    v31 = MEMORY[0x24BDACB70];
    v32 = "Failed to allocate workspace of size %ld for SparseSolve().\n";
LABEL_58:
    _os_log_error_impl(&dword_20AB80000, v31, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v40, 0xCu);
    goto LABEL_7;
  }
  if (!v40.reportError)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v40.control = 136315138;
    *(_QWORD *)&v40.orderMethod = "Factored";
    v31 = MEMORY[0x24BDACB70];
    v32 = "%s does not hold a completed matrix factorization.\n";
    goto LABEL_58;
  }
LABEL_47:
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  memset(&v40, 0, sizeof(v40));
  snprintf((char *)&v40, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
LABEL_63:
  ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v40);
}

void cva::VecLibSparse<double>::solve(uint64_t a1, DenseMatrix_Double *a2, DenseMatrix_Double *a3, void *a4)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  NSObject *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void (__cdecl *reportError)(const char *);
  int v13;
  int v14;
  int v15;
  void (__cdecl *v16)(const char *);
  int v17;
  int v18;
  int v19;
  NSObject *v20;
  const char *v21;
  int rowCount;
  int columnCount;
  int v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  void (__cdecl *free)(void *);
  size_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  NSObject *v39;
  DenseMatrix_Double v40;
  DenseMatrix_Double v41;
  SparseOpaqueFactorization_Double v42;
  uint64_t v43;
  DenseMatrix_Double Soln;
  DenseMatrix_Double RHS;
  SparseOpaqueFactorization_Double Factored;
  uint64_t v47;
  SparseSymbolicFactorOptions v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v4 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&Factored.userFactorStorage = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&Factored.solveWorkspaceRequiredStatic = v4;
    v47 = *(_QWORD *)(a1 + 96);
    v5 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&Factored.status = *(_OWORD *)a1;
    *(_OWORD *)&Factored.symbolicFactorization.columnCount = v5;
    v6 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)&Factored.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
    *(_OWORD *)&Factored.symbolicFactorization.factorSize_Float = v6;
    RHS = *a3;
    Soln = *a2;
    if (Factored.symbolicFactorization.status == SparseStatusOK && Factored.symbolicFactorization.workspaceSize_Float)
    {
      _SparseGetOptionsFromSymbolicFactor(&v48, &Factored.symbolicFactorization);
      reportError = v48.reportError;
      if (Factored.symbolicFactorization.status == SparseStatusOK
        && Factored.symbolicFactorization.workspaceSize_Float
        && Factored.status == SparseStatusOK
        && Factored.solveWorkspaceRequiredStatic)
      {
        if (((*(_BYTE *)&Factored.attributes ^ *(_BYTE *)&Factored.symbolicFactorization.attributes) & 1) != 0)
          v13 = Factored.symbolicFactorization.columnCount * LOBYTE(Factored.symbolicFactorization.factorization);
        else
          v13 = Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization);
        if (((*(_BYTE *)&Factored.attributes ^ *(_BYTE *)&Factored.symbolicFactorization.attributes) & 1) != 0)
          v14 = Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization);
        else
          v14 = Factored.symbolicFactorization.columnCount * LOBYTE(Factored.symbolicFactorization.factorization);
        if (BYTE1(Factored.symbolicFactorization.factorization) == 40)
          v15 = v13;
        else
          v15 = v14;
        if (RHS.columnStride < RHS.rowCount)
        {
          if (v48.reportError)
            goto LABEL_48;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v48.control = 136315906;
            *(_QWORD *)&v48.orderMethod = "B";
            WORD2(v48.order) = 1024;
            *(_DWORD *)((char *)&v48.order + 6) = RHS.columnStride;
            WORD1(v48.ignoreRowsAndColumns) = 2080;
            *(int **)((char *)&v48.ignoreRowsAndColumns + 4) = (int *)"B";
            WORD2(v48.malloc) = 1024;
            *(_DWORD *)((char *)&v48.malloc + 6) = RHS.rowCount;
            v26 = MEMORY[0x24BDACB70];
LABEL_108:
            _os_log_error_impl(&dword_20AB80000, v26, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", (uint8_t *)&v48, 0x22u);
            goto LABEL_7;
          }
          goto LABEL_7;
        }
        if (Soln.columnStride < Soln.rowCount)
        {
          if (v48.reportError)
          {
LABEL_48:
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            v49 = 0u;
            memset(&v48, 0, sizeof(v48));
            snprintf((char *)&v48, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
            goto LABEL_49;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v48.control = 136315906;
            *(_QWORD *)&v48.orderMethod = "X";
            WORD2(v48.order) = 1024;
            *(_DWORD *)((char *)&v48.order + 6) = Soln.columnStride;
            WORD1(v48.ignoreRowsAndColumns) = 2080;
            *(int **)((char *)&v48.ignoreRowsAndColumns + 4) = (int *)"X";
            WORD2(v48.malloc) = 1024;
            *(_DWORD *)((char *)&v48.malloc + 6) = Soln.rowCount;
            v26 = MEMORY[0x24BDACB70];
            goto LABEL_108;
          }
          goto LABEL_7;
        }
        if ((*(_BYTE *)&RHS.attributes & 1) != 0)
          rowCount = RHS.rowCount;
        else
          rowCount = RHS.columnCount;
        if ((*(_BYTE *)&RHS.attributes & 1) != 0)
          columnCount = RHS.columnCount;
        else
          columnCount = RHS.rowCount;
        if ((*(_BYTE *)&Soln.attributes & 1) != 0)
          v24 = Soln.rowCount;
        else
          v24 = Soln.columnCount;
        if ((*(_BYTE *)&Soln.attributes & 1) != 0)
          v25 = Soln.columnCount;
        else
          v25 = Soln.rowCount;
        if (rowCount != v24)
        {
          if (v48.reportError)
          {
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            v54 = 0u;
            v55 = 0u;
            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            v49 = 0u;
            memset(&v48, 0, sizeof(v48));
            snprintf((char *)&v48, 0x100uLL, "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n", "B");
            goto LABEL_49;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_7;
          v48.control = 136316418;
          *(_QWORD *)&v48.orderMethod = "B";
          WORD2(v48.order) = 1024;
          *(_DWORD *)((char *)&v48.order + 6) = columnCount;
          WORD1(v48.ignoreRowsAndColumns) = 1024;
          HIDWORD(v48.ignoreRowsAndColumns) = rowCount;
          LOWORD(v48.malloc) = 2080;
          *(void *(__cdecl **)(size_t))((char *)&v48.malloc + 2) = (void *(__cdecl *)(size_t))"X";
          WORD1(v48.free) = 1024;
          HIDWORD(v48.free) = v25;
          LOWORD(v48.reportError) = 1024;
          *(_DWORD *)((char *)&v48.reportError + 2) = v24;
          v35 = MEMORY[0x24BDACB70];
          v36 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
          goto LABEL_142;
        }
        if (rowCount > 0)
        {
          if (columnCount == v15)
          {
            if (v25 == v14)
            {
              _SparseSolveOpaque_Double(&Factored, &RHS, &Soln, a4);
              return;
            }
            if (v48.reportError)
            {
              v60 = 0u;
              v61 = 0u;
              v58 = 0u;
              v59 = 0u;
              v56 = 0u;
              v57 = 0u;
              v54 = 0u;
              v55 = 0u;
              v52 = 0u;
              v53 = 0u;
              v50 = 0u;
              v51 = 0u;
              v49 = 0u;
              memset(&v48, 0, sizeof(v48));
              v37 = "X";
              goto LABEL_123;
            }
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_7;
            v48.control = 136316418;
            *(_QWORD *)&v48.orderMethod = "X";
            WORD2(v48.order) = 1024;
            *(_DWORD *)((char *)&v48.order + 6) = v25;
            WORD1(v48.ignoreRowsAndColumns) = 1024;
            HIDWORD(v48.ignoreRowsAndColumns) = rowCount;
            LOWORD(v48.malloc) = 2080;
            *(void *(__cdecl **)(size_t))((char *)&v48.malloc + 2) = (void *(__cdecl *)(size_t))"matrix factorization Factored";
            WORD1(v48.free) = 1024;
            HIDWORD(v48.free) = v14;
            LOWORD(v48.reportError) = 1024;
            *(_DWORD *)((char *)&v48.reportError + 2) = v15;
            v35 = MEMORY[0x24BDACB70];
            v36 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
          }
          else
          {
            if (v48.reportError)
            {
              v60 = 0u;
              v61 = 0u;
              v58 = 0u;
              v59 = 0u;
              v56 = 0u;
              v57 = 0u;
              v54 = 0u;
              v55 = 0u;
              v52 = 0u;
              v53 = 0u;
              v50 = 0u;
              v51 = 0u;
              v49 = 0u;
              memset(&v48, 0, sizeof(v48));
              v37 = "B";
LABEL_123:
              snprintf((char *)&v48, 0x100uLL, "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n", v37);
              goto LABEL_49;
            }
            if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              goto LABEL_7;
            v48.control = 136316418;
            *(_QWORD *)&v48.orderMethod = "B";
            WORD2(v48.order) = 1024;
            *(_DWORD *)((char *)&v48.order + 6) = columnCount;
            WORD1(v48.ignoreRowsAndColumns) = 1024;
            HIDWORD(v48.ignoreRowsAndColumns) = rowCount;
            LOWORD(v48.malloc) = 2080;
            *(void *(__cdecl **)(size_t))((char *)&v48.malloc + 2) = (void *(__cdecl *)(size_t))"matrix factorization Factored";
            WORD1(v48.free) = 1024;
            HIDWORD(v48.free) = v14;
            LOWORD(v48.reportError) = 1024;
            *(_DWORD *)((char *)&v48.reportError + 2) = v15;
            v35 = MEMORY[0x24BDACB70];
            v36 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
          }
LABEL_142:
          _os_log_error_impl(&dword_20AB80000, v35, OS_LOG_TYPE_ERROR, v36, (uint8_t *)&v48, 0x2Eu);
          goto LABEL_7;
        }
        if (v48.reportError)
        {
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v49 = 0u;
          memset(&v48, 0, sizeof(v48));
          snprintf((char *)&v48, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
          goto LABEL_49;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v48.control = 136315650;
        *(_QWORD *)&v48.orderMethod = "B";
        WORD2(v48.order) = 1024;
        *(_DWORD *)((char *)&v48.order + 6) = columnCount;
        WORD1(v48.ignoreRowsAndColumns) = 1024;
        HIDWORD(v48.ignoreRowsAndColumns) = rowCount;
        v39 = MEMORY[0x24BDACB70];
LABEL_133:
        _os_log_error_impl(&dword_20AB80000, v39, OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", (uint8_t *)&v48, 0x18u);
        goto LABEL_7;
      }
      if (v48.reportError)
      {
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v49 = 0u;
        memset(&v48, 0, sizeof(v48));
        snprintf((char *)&v48, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
LABEL_49:
        ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v48);
        return;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v48.control = 136315138;
      *(_QWORD *)&v48.orderMethod = "Factored";
      v20 = MEMORY[0x24BDACB70];
      v21 = "%s does not hold a completed matrix factorization.\n";
LABEL_77:
      _os_log_error_impl(&dword_20AB80000, v20, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v48, 0xCu);
      goto LABEL_7;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    LOWORD(v48.control) = 0;
    v7 = MEMORY[0x24BDACB70];
LABEL_74:
    _os_log_error_impl(&dword_20AB80000, v7, OS_LOG_TYPE_ERROR, "Factored does not hold a completed matrix factorization.\n", (uint8_t *)&v48, 2u);
    goto LABEL_7;
  }
  v8 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v42.userFactorStorage = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v42.solveWorkspaceRequiredStatic = v8;
  v43 = *(_QWORD *)(a1 + 96);
  v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v42.status = *(_OWORD *)a1;
  *(_OWORD *)&v42.symbolicFactorization.columnCount = v9;
  v10 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v42.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v42.symbolicFactorization.factorSize_Float = v10;
  v41 = *a3;
  v40 = *a2;
  if (v42.symbolicFactorization.status || !v42.symbolicFactorization.workspaceSize_Float)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    LOWORD(v48.control) = 0;
    v7 = MEMORY[0x24BDACB70];
    goto LABEL_74;
  }
  _SparseGetOptionsFromSymbolicFactor(&v48, &v42.symbolicFactorization);
  v16 = v48.reportError;
  if (v42.symbolicFactorization.status
    || !v42.symbolicFactorization.workspaceSize_Float
    || v42.status
    || !v42.solveWorkspaceRequiredStatic)
  {
    if (!v48.reportError)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v48.control = 136315138;
      *(_QWORD *)&v48.orderMethod = "Factored";
      v20 = MEMORY[0x24BDACB70];
      v21 = "%s does not hold a completed matrix factorization.\n";
      goto LABEL_77;
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    memset(&v48, 0, sizeof(v48));
    snprintf((char *)&v48, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
LABEL_55:
    ((void (*)(SparseSymbolicFactorOptions *))v16)(&v48);
    return;
  }
  if (((*(_BYTE *)&v42.attributes ^ *(_BYTE *)&v42.symbolicFactorization.attributes) & 1) != 0)
    v17 = v42.symbolicFactorization.columnCount * LOBYTE(v42.symbolicFactorization.factorization);
  else
    v17 = v42.symbolicFactorization.rowCount * LOBYTE(v42.symbolicFactorization.factorization);
  if (((*(_BYTE *)&v42.attributes ^ *(_BYTE *)&v42.symbolicFactorization.attributes) & 1) != 0)
    v18 = v42.symbolicFactorization.rowCount * LOBYTE(v42.symbolicFactorization.factorization);
  else
    v18 = v42.symbolicFactorization.columnCount * LOBYTE(v42.symbolicFactorization.factorization);
  if (BYTE1(v42.symbolicFactorization.factorization) == 40)
    v19 = v17;
  else
    v19 = v18;
  if (v41.columnStride < v41.rowCount)
  {
    if (!v48.reportError)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v48.control = 136315906;
        *(_QWORD *)&v48.orderMethod = "B";
        WORD2(v48.order) = 1024;
        *(_DWORD *)((char *)&v48.order + 6) = v41.columnStride;
        WORD1(v48.ignoreRowsAndColumns) = 2080;
        *(int **)((char *)&v48.ignoreRowsAndColumns + 4) = (int *)"B";
        WORD2(v48.malloc) = 1024;
        *(_DWORD *)((char *)&v48.malloc + 6) = v41.rowCount;
        v26 = MEMORY[0x24BDACB70];
        goto LABEL_108;
      }
LABEL_7:
      _SparseTrap();
      return;
    }
    goto LABEL_54;
  }
  if (v40.columnStride < v40.rowCount)
  {
    if (!v48.reportError)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v48.control = 136315906;
        *(_QWORD *)&v48.orderMethod = "X";
        WORD2(v48.order) = 1024;
        *(_DWORD *)((char *)&v48.order + 6) = v40.columnStride;
        WORD1(v48.ignoreRowsAndColumns) = 2080;
        *(int **)((char *)&v48.ignoreRowsAndColumns + 4) = (int *)"X";
        WORD2(v48.malloc) = 1024;
        *(_DWORD *)((char *)&v48.malloc + 6) = v40.rowCount;
        v26 = MEMORY[0x24BDACB70];
        goto LABEL_108;
      }
      goto LABEL_7;
    }
LABEL_54:
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    memset(&v48, 0, sizeof(v48));
    snprintf((char *)&v48, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
    goto LABEL_55;
  }
  if ((*(_BYTE *)&v41.attributes & 1) != 0)
    v27 = v41.rowCount;
  else
    v27 = v41.columnCount;
  if ((*(_BYTE *)&v41.attributes & 1) != 0)
    v28 = v41.columnCount;
  else
    v28 = v41.rowCount;
  if ((*(_BYTE *)&v40.attributes & 1) != 0)
    v29 = v40.rowCount;
  else
    v29 = v40.columnCount;
  if ((*(_BYTE *)&v40.attributes & 1) != 0)
    v30 = v40.columnCount;
  else
    v30 = v40.rowCount;
  if ((_DWORD)v27 != v29)
  {
    if (!v48.reportError)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v48.control = 136316418;
      *(_QWORD *)&v48.orderMethod = "B";
      WORD2(v48.order) = 1024;
      *(_DWORD *)((char *)&v48.order + 6) = v28;
      WORD1(v48.ignoreRowsAndColumns) = 1024;
      HIDWORD(v48.ignoreRowsAndColumns) = v27;
      LOWORD(v48.malloc) = 2080;
      *(void *(__cdecl **)(size_t))((char *)&v48.malloc + 2) = (void *(__cdecl *)(size_t))"X";
      WORD1(v48.free) = 1024;
      HIDWORD(v48.free) = v30;
      LOWORD(v48.reportError) = 1024;
      *(_DWORD *)((char *)&v48.reportError + 2) = v29;
      v35 = MEMORY[0x24BDACB70];
      v36 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
      goto LABEL_142;
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    memset(&v48, 0, sizeof(v48));
    snprintf((char *)&v48, 0x100uLL, "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n", "B");
    goto LABEL_55;
  }
  if ((int)v27 <= 0)
  {
    if (!v48.reportError)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v48.control = 136315650;
      *(_QWORD *)&v48.orderMethod = "B";
      WORD2(v48.order) = 1024;
      *(_DWORD *)((char *)&v48.order + 6) = v28;
      WORD1(v48.ignoreRowsAndColumns) = 1024;
      HIDWORD(v48.ignoreRowsAndColumns) = v27;
      v39 = MEMORY[0x24BDACB70];
      goto LABEL_133;
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    memset(&v48, 0, sizeof(v48));
    snprintf((char *)&v48, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
    goto LABEL_55;
  }
  if (v28 != v19)
  {
    if (!v48.reportError)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v48.control = 136316418;
      *(_QWORD *)&v48.orderMethod = "B";
      WORD2(v48.order) = 1024;
      *(_DWORD *)((char *)&v48.order + 6) = v28;
      WORD1(v48.ignoreRowsAndColumns) = 1024;
      HIDWORD(v48.ignoreRowsAndColumns) = v27;
      LOWORD(v48.malloc) = 2080;
      *(void *(__cdecl **)(size_t))((char *)&v48.malloc + 2) = (void *(__cdecl *)(size_t))"matrix factorization Factored";
      WORD1(v48.free) = 1024;
      HIDWORD(v48.free) = v18;
      LOWORD(v48.reportError) = 1024;
      *(_DWORD *)((char *)&v48.reportError + 2) = v19;
      v35 = MEMORY[0x24BDACB70];
      v36 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
      goto LABEL_142;
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    memset(&v48, 0, sizeof(v48));
    v38 = "B";
    goto LABEL_130;
  }
  if (v30 != v18)
  {
    if (!v48.reportError)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v48.control = 136316418;
      *(_QWORD *)&v48.orderMethod = "X";
      WORD2(v48.order) = 1024;
      *(_DWORD *)((char *)&v48.order + 6) = v30;
      WORD1(v48.ignoreRowsAndColumns) = 1024;
      HIDWORD(v48.ignoreRowsAndColumns) = v27;
      LOWORD(v48.malloc) = 2080;
      *(void *(__cdecl **)(size_t))((char *)&v48.malloc + 2) = (void *(__cdecl *)(size_t))"matrix factorization Factored";
      WORD1(v48.free) = 1024;
      HIDWORD(v48.free) = v18;
      LOWORD(v48.reportError) = 1024;
      *(_DWORD *)((char *)&v48.reportError + 2) = v19;
      v35 = MEMORY[0x24BDACB70];
      v36 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
      goto LABEL_142;
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    memset(&v48, 0, sizeof(v48));
    v38 = "X";
LABEL_130:
    snprintf((char *)&v48, 0x100uLL, "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n", v38);
    goto LABEL_55;
  }
  free = v48.free;
  v32 = v42.solveWorkspaceRequiredPerRHS + v43 * v27;
  v33 = (void *)((uint64_t (*)(size_t))v48.malloc)(v32);
  if (!v33)
  {
    if (!v16)
    {
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v48.control = 134217984;
      *(_QWORD *)&v48.orderMethod = v32;
      v20 = MEMORY[0x24BDACB70];
      v21 = "Failed to allocate workspace of size %ld for SparseSolve().\n";
      goto LABEL_77;
    }
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v49 = 0u;
    memset(&v48, 0, sizeof(v48));
    snprintf((char *)&v48, 0x100uLL, "Failed to allocate workspace of size %ld for SparseSolve().\n");
    goto LABEL_55;
  }
  v34 = v33;
  _SparseSolveOpaque_Double(&v42, &v41, &v40, v33);
  ((void (*)(void *))free)(v34);
}

void cva::VecLibSparse<double>::solve(uint64_t a1, uint64_t a2, void *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  NSObject *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  SparseControl_t v11;
  int *v12;
  void (__cdecl *reportError)(const char *);
  int v14;
  int v15;
  double *v16;
  void (__cdecl *v17)(const char *);
  int v18;
  void (__cdecl *free)(void *);
  size_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  SparseOpaqueFactorization_Double v26;
  uint64_t v27;
  SparseOpaqueFactorization_Double Factored;
  uint64_t v29;
  DenseMatrix_Double Soln;
  SparseSymbolicFactorOptions v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&Factored.userFactorStorage = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&Factored.solveWorkspaceRequiredStatic = v3;
    v29 = *(_QWORD *)(a1 + 96);
    v4 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&Factored.status = *(_OWORD *)a1;
    *(_OWORD *)&Factored.symbolicFactorization.columnCount = v4;
    v5 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)&Factored.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
    *(_OWORD *)&Factored.symbolicFactorization.factorSize_Float = v5;
    if (Factored.symbolicFactorization.status == SparseStatusOK && Factored.symbolicFactorization.workspaceSize_Float)
    {
      v11 = *(_DWORD *)a2;
      v12 = *(int **)(a2 + 8);
      _SparseGetOptionsFromSymbolicFactor(&v31, &Factored.symbolicFactorization);
      reportError = v31.reportError;
      if (Factored.symbolicFactorization.status == SparseStatusOK
        && Factored.symbolicFactorization.workspaceSize_Float
        && Factored.status == SparseStatusOK
        && Factored.solveWorkspaceRequiredStatic)
      {
        v14 = Factored.symbolicFactorization.columnCount * LOBYTE(Factored.symbolicFactorization.factorization);
        if (Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization) > v14)
          v14 = Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization);
        if (v14 == v11)
        {
          v31.control = v11;
          *(_DWORD *)&v31.orderMethod = 1;
          v31.ignoreRowsAndColumns = v12;
          v31.order = (int *)v11;
          _SparseSolveOpaque_Double(&Factored, 0, (const DenseMatrix_Double *)&v31, a3);
          return;
        }
        if (v31.reportError)
        {
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v32 = 0u;
          memset(&v31, 0, sizeof(v31));
          snprintf((char *)&v31, 0x100uLL, "%s.count (%d) is not equal to largest dimension of matrix factorization %s.\n");
          goto LABEL_34;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v31.control = 136315650;
        *(_QWORD *)&v31.orderMethod = "xb";
        WORD2(v31.order) = 1024;
        *(_DWORD *)((char *)&v31.order + 6) = v11;
        WORD1(v31.ignoreRowsAndColumns) = 2080;
        *(int **)((char *)&v31.ignoreRowsAndColumns + 4) = (int *)"Factored";
        v25 = MEMORY[0x24BDACB70];
        goto LABEL_51;
      }
      if (v31.reportError)
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v32 = 0u;
        memset(&v31, 0, sizeof(v31));
        snprintf((char *)&v31, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
LABEL_34:
        ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v31);
        return;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v31.control = 136315138;
      *(_QWORD *)&v31.orderMethod = "Factored";
      v23 = MEMORY[0x24BDACB70];
      v24 = "%s does not hold a completed matrix factorization.\n";
      goto LABEL_43;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v31.control) = 0;
      v6 = MEMORY[0x24BDACB70];
LABEL_40:
      _os_log_error_impl(&dword_20AB80000, v6, OS_LOG_TYPE_ERROR, "Factored does not hold a completed matrix factorization.\n", (uint8_t *)&v31, 2u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v7 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v26.userFactorStorage = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v26.solveWorkspaceRequiredStatic = v7;
  v27 = *(_QWORD *)(a1 + 96);
  v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v26.status = *(_OWORD *)a1;
  *(_OWORD *)&v26.symbolicFactorization.columnCount = v8;
  v9 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v26.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v26.symbolicFactorization.factorSize_Float = v9;
  if (v26.symbolicFactorization.status == SparseStatusOK && v26.symbolicFactorization.workspaceSize_Float)
  {
    v15 = *(_DWORD *)a2;
    v16 = *(double **)(a2 + 8);
    _SparseGetOptionsFromSymbolicFactor(&v31, &v26.symbolicFactorization);
    v17 = v31.reportError;
    if (v26.symbolicFactorization.status
      || !v26.symbolicFactorization.workspaceSize_Float
      || v26.status
      || !v26.solveWorkspaceRequiredStatic)
    {
      if (!v31.reportError)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v31.control = 136315138;
        *(_QWORD *)&v31.orderMethod = "Factored";
        v23 = MEMORY[0x24BDACB70];
        v24 = "%s does not hold a completed matrix factorization.\n";
        goto LABEL_43;
      }
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v32 = 0u;
      memset(&v31, 0, sizeof(v31));
      snprintf((char *)&v31, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
    }
    else
    {
      v18 = v26.symbolicFactorization.columnCount * LOBYTE(v26.symbolicFactorization.factorization);
      if (v26.symbolicFactorization.rowCount * LOBYTE(v26.symbolicFactorization.factorization) > v18)
        v18 = v26.symbolicFactorization.rowCount * LOBYTE(v26.symbolicFactorization.factorization);
      if (v18 == v15)
      {
        free = v31.free;
        Soln.rowCount = v15;
        Soln.columnCount = 1;
        *(_DWORD *)&Soln.attributes = 0;
        Soln.data = v16;
        Soln.columnStride = v15;
        v20 = v27 + v26.solveWorkspaceRequiredPerRHS;
        v21 = (void *)((uint64_t (*)(size_t))v31.malloc)(v27 + v26.solveWorkspaceRequiredPerRHS);
        if (v21)
        {
          v22 = v21;
          _SparseSolveOpaque_Double(&v26, 0, &Soln, v21);
          ((void (*)(void *))free)(v22);
          return;
        }
        if (v17)
        {
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v32 = 0u;
          memset(&v31, 0, sizeof(v31));
          snprintf((char *)&v31, 0x100uLL, "Failed to allocate workspace of size %ld for SparseSolve().\n");
          goto LABEL_48;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v31.control = 134217984;
        *(_QWORD *)&v31.orderMethod = v20;
        v23 = MEMORY[0x24BDACB70];
        v24 = "Failed to allocate workspace of size %ld for SparseSolve().\n";
LABEL_43:
        _os_log_error_impl(&dword_20AB80000, v23, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v31, 0xCu);
        goto LABEL_7;
      }
      if (!v31.reportError)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v31.control = 136315650;
          *(_QWORD *)&v31.orderMethod = "xb";
          WORD2(v31.order) = 1024;
          *(_DWORD *)((char *)&v31.order + 6) = v15;
          WORD1(v31.ignoreRowsAndColumns) = 2080;
          *(int **)((char *)&v31.ignoreRowsAndColumns + 4) = (int *)"Factored";
          v25 = MEMORY[0x24BDACB70];
LABEL_51:
          _os_log_error_impl(&dword_20AB80000, v25, OS_LOG_TYPE_ERROR, "%s.count (%d) is not equal to largest dimension of matrix factorization %s.\n", (uint8_t *)&v31, 0x1Cu);
          goto LABEL_7;
        }
        goto LABEL_7;
      }
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v32 = 0u;
      memset(&v31, 0, sizeof(v31));
      snprintf((char *)&v31, 0x100uLL, "%s.count (%d) is not equal to largest dimension of matrix factorization %s.\n");
    }
LABEL_48:
    ((void (*)(SparseSymbolicFactorOptions *))v17)(&v31);
    return;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v31.control) = 0;
    v6 = MEMORY[0x24BDACB70];
    goto LABEL_40;
  }
LABEL_7:
  _SparseTrap();
}

void cva::VecLibSparse<double>::solve(uint64_t a1, DenseMatrix_Double *a2, void *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  NSObject *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void (__cdecl *reportError)(const char *);
  void (__cdecl *v12)(const char *);
  int columnCount;
  int rowCount;
  int v15;
  NSObject *v16;
  const char *v17;
  int v18;
  uint64_t v19;
  int v20;
  void (__cdecl *free)(void *);
  size_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  DenseMatrix_Double v28;
  SparseOpaqueFactorization_Double v29;
  uint64_t v30;
  DenseMatrix_Double Soln;
  SparseOpaqueFactorization_Double Factored;
  uint64_t v33;
  SparseSymbolicFactorOptions v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&Factored.userFactorStorage = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&Factored.solveWorkspaceRequiredStatic = v3;
    v33 = *(_QWORD *)(a1 + 96);
    v4 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&Factored.status = *(_OWORD *)a1;
    *(_OWORD *)&Factored.symbolicFactorization.columnCount = v4;
    v5 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)&Factored.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
    *(_OWORD *)&Factored.symbolicFactorization.factorSize_Float = v5;
    Soln = *a2;
    if (Factored.symbolicFactorization.status == SparseStatusOK && Factored.symbolicFactorization.workspaceSize_Float)
    {
      _SparseGetOptionsFromSymbolicFactor(&v34, &Factored.symbolicFactorization);
      reportError = v34.reportError;
      if (Factored.symbolicFactorization.status == SparseStatusOK
        && Factored.symbolicFactorization.workspaceSize_Float
        && Factored.status == SparseStatusOK
        && Factored.solveWorkspaceRequiredStatic)
      {
        if (Soln.columnStride < Soln.rowCount)
        {
          if (v34.reportError)
          {
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v35 = 0u;
            memset(&v34, 0, sizeof(v34));
            snprintf((char *)&v34, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
LABEL_27:
            ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v34);
            return;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_7;
          v34.control = 136315906;
          *(_QWORD *)&v34.orderMethod = "XB";
          WORD2(v34.order) = 1024;
          *(_DWORD *)((char *)&v34.order + 6) = Soln.columnStride;
          WORD1(v34.ignoreRowsAndColumns) = 2080;
          *(int **)((char *)&v34.ignoreRowsAndColumns + 4) = (int *)"XB";
          WORD2(v34.malloc) = 1024;
          *(_DWORD *)((char *)&v34.malloc + 6) = Soln.rowCount;
          v25 = MEMORY[0x24BDACB70];
          goto LABEL_71;
        }
        if ((*(_BYTE *)&Soln.attributes & 1) != 0)
          columnCount = Soln.columnCount;
        else
          columnCount = Soln.rowCount;
        if ((*(_BYTE *)&Soln.attributes & 1) != 0)
          rowCount = Soln.rowCount;
        else
          rowCount = Soln.columnCount;
        if (rowCount > 0)
        {
          if (Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization) <= Factored.symbolicFactorization.columnCount * LOBYTE(Factored.symbolicFactorization.factorization))
            v15 = Factored.symbolicFactorization.columnCount * LOBYTE(Factored.symbolicFactorization.factorization);
          else
            v15 = Factored.symbolicFactorization.rowCount * LOBYTE(Factored.symbolicFactorization.factorization);
          if (columnCount == v15)
          {
            _SparseSolveOpaque_Double(&Factored, 0, &Soln, a3);
            return;
          }
          if (v34.reportError)
          {
            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v35 = 0u;
            memset(&v34, 0, sizeof(v34));
            snprintf((char *)&v34, 0x100uLL, "%s (%dx%d) is not consistent with largest dimension of matrix factorization %s (%d).\n");
            goto LABEL_27;
          }
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_7;
          v34.control = 136316162;
          *(_QWORD *)&v34.orderMethod = "XB";
          WORD2(v34.order) = 1024;
          *(_DWORD *)((char *)&v34.order + 6) = columnCount;
          WORD1(v34.ignoreRowsAndColumns) = 1024;
          HIDWORD(v34.ignoreRowsAndColumns) = rowCount;
          LOWORD(v34.malloc) = 2080;
          *(void *(__cdecl **)(size_t))((char *)&v34.malloc + 2) = (void *(__cdecl *)(size_t))"Factored";
          WORD1(v34.free) = 1024;
          HIDWORD(v34.free) = v15;
          v27 = MEMORY[0x24BDACB70];
          goto LABEL_87;
        }
        if (v34.reportError)
        {
          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v35 = 0u;
          memset(&v34, 0, sizeof(v34));
          snprintf((char *)&v34, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
          goto LABEL_27;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        v34.control = 136315650;
        *(_QWORD *)&v34.orderMethod = "XB";
        WORD2(v34.order) = 1024;
        *(_DWORD *)((char *)&v34.order + 6) = columnCount;
        WORD1(v34.ignoreRowsAndColumns) = 1024;
        HIDWORD(v34.ignoreRowsAndColumns) = rowCount;
        v26 = MEMORY[0x24BDACB70];
LABEL_82:
        _os_log_error_impl(&dword_20AB80000, v26, OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", (uint8_t *)&v34, 0x18u);
        goto LABEL_7;
      }
      if (v34.reportError)
      {
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = 0u;
        memset(&v34, 0, sizeof(v34));
        snprintf((char *)&v34, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
        goto LABEL_27;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v34.control = 136315138;
      *(_QWORD *)&v34.orderMethod = "Factored";
      v16 = MEMORY[0x24BDACB70];
      v17 = "%s does not hold a completed matrix factorization.\n";
      goto LABEL_62;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v34.control) = 0;
      v6 = MEMORY[0x24BDACB70];
LABEL_59:
      _os_log_error_impl(&dword_20AB80000, v6, OS_LOG_TYPE_ERROR, "Factored does not hold a completed matrix factorization.\n", (uint8_t *)&v34, 2u);
      goto LABEL_7;
    }
    goto LABEL_7;
  }
  v7 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v29.userFactorStorage = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v29.solveWorkspaceRequiredStatic = v7;
  v30 = *(_QWORD *)(a1 + 96);
  v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v29.status = *(_OWORD *)a1;
  *(_OWORD *)&v29.symbolicFactorization.columnCount = v8;
  v9 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)&v29.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v29.symbolicFactorization.factorSize_Float = v9;
  v28 = *a2;
  if (v29.symbolicFactorization.status == SparseStatusOK && v29.symbolicFactorization.workspaceSize_Float)
  {
    _SparseGetOptionsFromSymbolicFactor(&v34, &v29.symbolicFactorization);
    v12 = v34.reportError;
    if (v29.symbolicFactorization.status
      || !v29.symbolicFactorization.workspaceSize_Float
      || v29.status
      || !v29.solveWorkspaceRequiredStatic)
    {
      if (v34.reportError)
      {
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = 0u;
        memset(&v34, 0, sizeof(v34));
        snprintf((char *)&v34, 0x100uLL, "%s does not hold a completed matrix factorization.\n");
        goto LABEL_30;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v34.control = 136315138;
      *(_QWORD *)&v34.orderMethod = "Factored";
      v16 = MEMORY[0x24BDACB70];
      v17 = "%s does not hold a completed matrix factorization.\n";
    }
    else
    {
      if (v28.columnStride < v28.rowCount)
      {
        if (!v34.reportError)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            v34.control = 136315906;
            *(_QWORD *)&v34.orderMethod = "XB";
            WORD2(v34.order) = 1024;
            *(_DWORD *)((char *)&v34.order + 6) = v28.columnStride;
            WORD1(v34.ignoreRowsAndColumns) = 2080;
            *(int **)((char *)&v34.ignoreRowsAndColumns + 4) = (int *)"XB";
            WORD2(v34.malloc) = 1024;
            *(_DWORD *)((char *)&v34.malloc + 6) = v28.rowCount;
            v25 = MEMORY[0x24BDACB70];
LABEL_71:
            _os_log_error_impl(&dword_20AB80000, v25, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", (uint8_t *)&v34, 0x22u);
            goto LABEL_7;
          }
          goto LABEL_7;
        }
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = 0u;
        memset(&v34, 0, sizeof(v34));
        snprintf((char *)&v34, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
LABEL_30:
        ((void (*)(SparseSymbolicFactorOptions *))v12)(&v34);
        return;
      }
      if ((*(_BYTE *)&v28.attributes & 1) != 0)
        v18 = v28.columnCount;
      else
        v18 = v28.rowCount;
      if ((*(_BYTE *)&v28.attributes & 1) != 0)
        v19 = v28.rowCount;
      else
        v19 = v28.columnCount;
      if ((int)v19 <= 0)
      {
        if (!v34.reportError)
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_7;
          v34.control = 136315650;
          *(_QWORD *)&v34.orderMethod = "XB";
          WORD2(v34.order) = 1024;
          *(_DWORD *)((char *)&v34.order + 6) = v18;
          WORD1(v34.ignoreRowsAndColumns) = 1024;
          HIDWORD(v34.ignoreRowsAndColumns) = v19;
          v26 = MEMORY[0x24BDACB70];
          goto LABEL_82;
        }
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = 0u;
        memset(&v34, 0, sizeof(v34));
        snprintf((char *)&v34, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
        goto LABEL_30;
      }
      if (v29.symbolicFactorization.rowCount * LOBYTE(v29.symbolicFactorization.factorization) <= v29.symbolicFactorization.columnCount
                                                                                                 * LOBYTE(v29.symbolicFactorization.factorization))
        v20 = v29.symbolicFactorization.columnCount * LOBYTE(v29.symbolicFactorization.factorization);
      else
        v20 = v29.symbolicFactorization.rowCount * LOBYTE(v29.symbolicFactorization.factorization);
      if (v18 != v20)
      {
        if (!v34.reportError)
        {
          if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            goto LABEL_7;
          v34.control = 136316162;
          *(_QWORD *)&v34.orderMethod = "XB";
          WORD2(v34.order) = 1024;
          *(_DWORD *)((char *)&v34.order + 6) = v18;
          WORD1(v34.ignoreRowsAndColumns) = 1024;
          HIDWORD(v34.ignoreRowsAndColumns) = v19;
          LOWORD(v34.malloc) = 2080;
          *(void *(__cdecl **)(size_t))((char *)&v34.malloc + 2) = (void *(__cdecl *)(size_t))"Factored";
          WORD1(v34.free) = 1024;
          HIDWORD(v34.free) = v20;
          v27 = MEMORY[0x24BDACB70];
LABEL_87:
          _os_log_error_impl(&dword_20AB80000, v27, OS_LOG_TYPE_ERROR, "%s (%dx%d) is not consistent with largest dimension of matrix factorization %s (%d).\n", (uint8_t *)&v34, 0x28u);
          goto LABEL_7;
        }
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = 0u;
        memset(&v34, 0, sizeof(v34));
        snprintf((char *)&v34, 0x100uLL, "%s (%dx%d) is not consistent with largest dimension of matrix factorization %s (%d).\n");
        goto LABEL_30;
      }
      free = v34.free;
      v22 = v29.solveWorkspaceRequiredPerRHS + v30 * v19;
      v23 = (void *)((uint64_t (*)(size_t))v34.malloc)(v22);
      if (v23)
      {
        v24 = v23;
        _SparseSolveOpaque_Double(&v29, 0, &v28, v23);
        ((void (*)(void *))free)(v24);
        return;
      }
      if (v12)
      {
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = 0u;
        memset(&v34, 0, sizeof(v34));
        snprintf((char *)&v34, 0x100uLL, "Failed to allocate workspace of size %ld for SparseSolve().\n");
        goto LABEL_30;
      }
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_7;
      v34.control = 134217984;
      *(_QWORD *)&v34.orderMethod = v22;
      v16 = MEMORY[0x24BDACB70];
      v17 = "Failed to allocate workspace of size %ld for SparseSolve().\n";
    }
LABEL_62:
    _os_log_error_impl(&dword_20AB80000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v34, 0xCu);
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v34.control) = 0;
    v6 = MEMORY[0x24BDACB70];
    goto LABEL_59;
  }
LABEL_7:
  _SparseTrap();
}

double cva::VecLibSparse<double>::subfactor@<D0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  void (*v8)(_BYTE *);
  __int16 v9;
  double result;
  const char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  size_t v16;
  __int128 v17;
  __int128 v18;
  NSObject *v19;
  const char *v20;
  SparseOpaqueFactorization_Double v21;
  uint64_t v22;
  size_t workPerRHS;
  size_t workStatic;
  _BYTE v25[256];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)&v21.userFactorStorage = *(_OWORD *)(a2 + 64);
  *(_OWORD *)&v21.solveWorkspaceRequiredStatic = v4;
  v22 = *(_QWORD *)(a2 + 96);
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v21.status = *(_OWORD *)a2;
  *(_OWORD *)&v21.symbolicFactorization.columnCount = v5;
  v6 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)&v21.symbolicFactorization.workspaceSize_Float = *(_OWORD *)(a2 + 32);
  *(_OWORD *)&v21.symbolicFactorization.factorSize_Float = v6;
  if (v21.symbolicFactorization.status == SparseStatusOK
    && v21.symbolicFactorization.workspaceSize_Float
    && v21.status == SparseStatusOK
    && v21.solveWorkspaceRequiredStatic)
  {
    _SparseGetOptionsFromSymbolicFactor((SparseSymbolicFactorOptions *)v25, &v21.symbolicFactorization);
    v8 = *(void (**)(_BYTE *))&v25[40];
    v9 = 2;
    switch(a1)
    {
      case 1:
        goto LABEL_24;
      case 2:
      case 4:
        if (BYTE1(v21.symbolicFactorization.factorization) - 2 < 3)
          goto LABEL_24;
        if (*(_QWORD *)&v25[40])
        {
          memset(&v25[53], 0, 203);
          strcpy(v25, "Subfactor Type only valid for LDL^T factorizations.\n");
          goto LABEL_32;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        *(_WORD *)v25 = 0;
        v19 = MEMORY[0x24BDACB70];
        v20 = "Subfactor Type only valid for LDL^T factorizations.\n";
        goto LABEL_29;
      case 3:
      case 5:
        if (a1 == 5)
          v9 = 2;
        else
          v9 = 6;
        if (BYTE1(v21.symbolicFactorization.factorization) <= 4u && BYTE1(v21.symbolicFactorization.factorization) != 1)
          goto LABEL_24;
        if (*(_QWORD *)&v25[40])
        {
          memset(&v25[66], 0, 190);
          strcpy(&v25[64], "\n");
          v11 = "Subfactor Type only valid for Cholesky and LDL^T factorizations.\n";
          goto LABEL_27;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        *(_WORD *)v25 = 0;
        v19 = MEMORY[0x24BDACB70];
        v20 = "Subfactor Type only valid for Cholesky and LDL^T factorizations.\n";
        goto LABEL_29;
      case 6:
        if (BYTE1(v21.symbolicFactorization.factorization) == 40)
          goto LABEL_24;
        if (*(_QWORD *)&v25[40])
        {
          memset(&v25[52], 0, 204);
          strcpy(v25, "SparseSubfactorQ only valid for QR factorizations.\n");
          goto LABEL_32;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        *(_WORD *)v25 = 0;
        v19 = MEMORY[0x24BDACB70];
        v20 = "SparseSubfactorQ only valid for QR factorizations.\n";
        goto LABEL_29;
      case 7:
      case 8:
        if ((BYTE1(v21.symbolicFactorization.factorization) & 0xFE) == 0x28)
        {
          v9 = 4;
LABEL_24:
          _SparseRetainNumeric_Double(&v21);
          workPerRHS = 0;
          workStatic = 0;
          *(SparseOpaqueFactorization_Double *)v25 = v21;
          *(_QWORD *)&v25[96] = v22;
          _SparseGetWorkspaceRequired_Double((SparseSubfactor_t)a1, (SparseOpaqueFactorization_Double *)v25, &workStatic, &workPerRHS);
          v12 = *(_OWORD *)&v21.symbolicFactorization.workspaceSize_Float;
          *(_OWORD *)(a3 + 56) = *(_OWORD *)&v21.symbolicFactorization.factorSize_Float;
          v13 = *(_OWORD *)&v21.solveWorkspaceRequiredStatic;
          *(_OWORD *)(a3 + 72) = *(_OWORD *)&v21.userFactorStorage;
          *(_OWORD *)(a3 + 88) = v13;
          result = *(double *)&v21.status;
          v14 = *(_OWORD *)&v21.symbolicFactorization.columnCount;
          *(_OWORD *)(a3 + 8) = *(_OWORD *)&v21.status;
          *(_OWORD *)(a3 + 24) = v14;
          *(_WORD *)a3 = v9;
          *(_WORD *)(a3 + 2) = 0;
          *(_BYTE *)(a3 + 4) = a1;
          v15 = v22;
          *(_OWORD *)(a3 + 40) = v12;
          v16 = workStatic;
          *(_QWORD *)(a3 + 104) = v15;
          *(_QWORD *)(a3 + 112) = v16;
          *(_QWORD *)(a3 + 120) = workPerRHS;
          return result;
        }
        if (*(_QWORD *)&v25[40])
        {
          memset(&v25[66], 0, 190);
          strcpy(&v25[64], "\n");
          v11 = "Subfactor Type only valid for QR and CholeskyAtA factorizations.\n";
LABEL_27:
          v17 = *((_OWORD *)v11 + 1);
          *(_OWORD *)v25 = *(_OWORD *)v11;
          *(_OWORD *)&v25[16] = v17;
          v18 = *((_OWORD *)v11 + 3);
          *(_OWORD *)&v25[32] = *((_OWORD *)v11 + 2);
          *(_OWORD *)&v25[48] = v18;
          goto LABEL_32;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        *(_WORD *)v25 = 0;
        v19 = MEMORY[0x24BDACB70];
        v20 = "Subfactor Type only valid for QR and CholeskyAtA factorizations.\n";
        goto LABEL_29;
      default:
        if (*(_QWORD *)&v25[40])
        {
          memset(&v25[24], 0, 232);
          strcpy(v25, "Invalid subfactor type.");
LABEL_32:
          v8(v25);
          goto LABEL_11;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_10;
        *(_WORD *)v25 = 0;
        v19 = MEMORY[0x24BDACB70];
        v20 = "Invalid subfactor type.";
        break;
    }
    goto LABEL_29;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v25 = 0;
    v19 = MEMORY[0x24BDACB70];
    v20 = "Bad factor.\n";
LABEL_29:
    _os_log_error_impl(&dword_20AB80000, v19, OS_LOG_TYPE_ERROR, v20, v25, 2u);
  }
LABEL_10:
  _SparseTrap();
LABEL_11:
  result = 0.0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_DWORD *)(a3 + 8) = -3;
  *(_DWORD *)(a3 + 16) = -3;
  return result;
}

void cva::VecLibSparse<double>::solve(_OWORD *a1, uint64_t a2, uint64_t a3, char *a4)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  double *v10;
  DenseMatrix_Double v11;
  _DWORD v12[4];
  uint64_t v13;
  _OWORD v14[8];

  v4 = a1[5];
  v14[4] = a1[4];
  v14[5] = v4;
  v5 = a1[7];
  v14[6] = a1[6];
  v14[7] = v5;
  v6 = a1[1];
  v14[0] = *a1;
  v14[1] = v6;
  v7 = a1[3];
  v14[2] = a1[2];
  v14[3] = v7;
  v8 = *(_QWORD *)(a3 + 8);
  v9 = *(_DWORD *)a2;
  v10 = *(double **)(a2 + 8);
  v12[0] = *(_DWORD *)a3;
  v12[1] = 1;
  v12[2] = v12[0];
  v12[3] = 0;
  v13 = v8;
  v11.rowCount = v9;
  v11.columnCount = 1;
  v11.columnStride = v9;
  *(_DWORD *)&v11.attributes = 0;
  v11.data = v10;
  if (a4)
    sub_20ABEA564((const SparseOpaqueSubfactor_Double *)v14, (uint64_t)v12, &v11, a4);
  else
    sub_20ABEABB4((const SparseOpaqueSubfactor_Double *)v14, (uint64_t)v12, &v11);
}

void sub_20ABEA564(const SparseOpaqueSubfactor_Double *a1, uint64_t a2, const DenseMatrix_Double *a3, char *a4)
{
  void (__cdecl *reportError)(const char *);
  SparseAttributes_t attributes;
  int factorization_low;
  int v11;
  int v12;
  int v13;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int columnStride;
  int rowCount;
  __int16 v22;
  int v23;
  unsigned int v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  int v31;
  int v32;
  SparseSymbolicFactorOptions v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)&a1->contents + 2))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v33.control) = 0;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Subfactor does not hold a valid factor subobject.\n", (uint8_t *)&v33, 2u);
    }
    goto LABEL_58;
  }
  _SparseGetOptionsFromSymbolicFactor(&v33, &a1->factor.symbolicFactorization);
  reportError = v33.reportError;
  attributes = a1->attributes;
  factorization_low = LOBYTE(a1->factor.symbolicFactorization.factorization);
  v11 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  v12 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  if (v11 >= v12)
    v13 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  else
    v13 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  if (v11 <= v12)
    v11 = v12;
  if (*((_BYTE *)&a1->contents + 2) == 6 && BYTE1(a1->factor.symbolicFactorization.factorization) == 40)
    v15 = v11;
  else
    v15 = v13;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v16 = v15;
  else
    v16 = v13;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v17 = v13;
  else
    v17 = v15;
  v18 = *(_DWORD *)(a2 + 8);
  v19 = *(_DWORD *)a2;
  if (v18 < *(_DWORD *)a2)
  {
    if (v33.reportError)
      goto LABEL_26;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_58;
    v33.control = 136315906;
    *(_QWORD *)&v33.orderMethod = "B";
    WORD2(v33.order) = 1024;
    *(_DWORD *)((char *)&v33.order + 6) = v18;
    WORD1(v33.ignoreRowsAndColumns) = 2080;
    *(int **)((char *)&v33.ignoreRowsAndColumns + 4) = (int *)"B";
    WORD2(v33.malloc) = 1024;
    *(_DWORD *)((char *)&v33.malloc + 6) = v19;
    v26 = MEMORY[0x24BDACB70];
    goto LABEL_41;
  }
  columnStride = a3->columnStride;
  rowCount = a3->rowCount;
  if (columnStride >= a3->rowCount)
  {
    v22 = *(_WORD *)(a2 + 12);
    if ((v22 & 1) == 0)
      v19 = *(_DWORD *)(a2 + 4);
    v23 = *(&a3->rowCount + ((*(_WORD *)&a3->attributes & 1) == 0));
    v24 = v22 & 1;
    v25 = *(&a3->rowCount + (*(_WORD *)&a3->attributes & 1));
    if (v19 == v23)
    {
      if (v19 <= 0)
      {
        if (v33.reportError)
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v34 = 0u;
          memset(&v33, 0, sizeof(v33));
          snprintf((char *)&v33, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
          goto LABEL_27;
        }
        v31 = *(_DWORD *)(a2 + 4 * v24);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v33.control = 136315650;
          *(_QWORD *)&v33.orderMethod = "B";
          WORD2(v33.order) = 1024;
          *(_DWORD *)((char *)&v33.order + 6) = v31;
          WORD1(v33.ignoreRowsAndColumns) = 1024;
          HIDWORD(v33.ignoreRowsAndColumns) = v19;
          _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", (uint8_t *)&v33, 0x18u);
        }
        goto LABEL_58;
      }
      if (*(_DWORD *)(a2 + 4 * v24) == v17)
      {
        if (v25 == v16)
        {
          _SparseSolveSubfactor_Double(a1, (const DenseMatrix_Double *)a2, a3, a4);
          return;
        }
        if (v33.reportError)
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v34 = 0u;
          memset(&v33, 0, sizeof(v33));
          v30 = "X";
          goto LABEL_50;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_58;
        v33.control = 136316418;
        *(_QWORD *)&v33.orderMethod = "X";
        WORD2(v33.order) = 1024;
        *(_DWORD *)((char *)&v33.order + 6) = v25;
        WORD1(v33.ignoreRowsAndColumns) = 1024;
        HIDWORD(v33.ignoreRowsAndColumns) = v19;
        LOWORD(v33.malloc) = 2080;
        *(void *(__cdecl **)(size_t))((char *)&v33.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
        WORD1(v33.free) = 1024;
        HIDWORD(v33.free) = v16;
        LOWORD(v33.reportError) = 1024;
        *(_DWORD *)((char *)&v33.reportError + 2) = v17;
        v28 = MEMORY[0x24BDACB70];
        v29 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
      }
      else
      {
        if (v33.reportError)
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v34 = 0u;
          memset(&v33, 0, sizeof(v33));
          v30 = "B";
LABEL_50:
          snprintf((char *)&v33, 0x100uLL, "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n", v30);
          goto LABEL_27;
        }
        v32 = *(_DWORD *)(a2 + 4 * v24);
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_58;
        v33.control = 136316418;
        *(_QWORD *)&v33.orderMethod = "B";
        WORD2(v33.order) = 1024;
        *(_DWORD *)((char *)&v33.order + 6) = v32;
        WORD1(v33.ignoreRowsAndColumns) = 1024;
        HIDWORD(v33.ignoreRowsAndColumns) = v19;
        LOWORD(v33.malloc) = 2080;
        *(void *(__cdecl **)(size_t))((char *)&v33.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
        WORD1(v33.free) = 1024;
        HIDWORD(v33.free) = v16;
        LOWORD(v33.reportError) = 1024;
        *(_DWORD *)((char *)&v33.reportError + 2) = v17;
        v28 = MEMORY[0x24BDACB70];
        v29 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
      }
    }
    else
    {
      if (v33.reportError)
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v34 = 0u;
        memset(&v33, 0, sizeof(v33));
        snprintf((char *)&v33, 0x100uLL, "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n", "B");
        goto LABEL_27;
      }
      v27 = *(_DWORD *)(a2 + 4 * v24);
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_58;
      v33.control = 136316418;
      *(_QWORD *)&v33.orderMethod = "B";
      WORD2(v33.order) = 1024;
      *(_DWORD *)((char *)&v33.order + 6) = v27;
      WORD1(v33.ignoreRowsAndColumns) = 1024;
      HIDWORD(v33.ignoreRowsAndColumns) = v19;
      LOWORD(v33.malloc) = 2080;
      *(void *(__cdecl **)(size_t))((char *)&v33.malloc + 2) = (void *(__cdecl *)(size_t))"X";
      WORD1(v33.free) = 1024;
      HIDWORD(v33.free) = v25;
      LOWORD(v33.reportError) = 1024;
      *(_DWORD *)((char *)&v33.reportError + 2) = v23;
      v28 = MEMORY[0x24BDACB70];
      v29 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
    }
    _os_log_error_impl(&dword_20AB80000, v28, OS_LOG_TYPE_ERROR, v29, (uint8_t *)&v33, 0x2Eu);
    goto LABEL_58;
  }
  if (v33.reportError)
  {
LABEL_26:
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    memset(&v33, 0, sizeof(v33));
    snprintf((char *)&v33, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
LABEL_27:
    ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v33);
    return;
  }
  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    goto LABEL_58;
  v33.control = 136315906;
  *(_QWORD *)&v33.orderMethod = "X";
  WORD2(v33.order) = 1024;
  *(_DWORD *)((char *)&v33.order + 6) = columnStride;
  WORD1(v33.ignoreRowsAndColumns) = 2080;
  *(int **)((char *)&v33.ignoreRowsAndColumns + 4) = (int *)"X";
  WORD2(v33.malloc) = 1024;
  *(_DWORD *)((char *)&v33.malloc + 6) = rowCount;
  v26 = MEMORY[0x24BDACB70];
LABEL_41:
  _os_log_error_impl(&dword_20AB80000, v26, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", (uint8_t *)&v33, 0x22u);
LABEL_58:
  _SparseTrap();
}

void sub_20ABEABB4(const SparseOpaqueSubfactor_Double *a1, uint64_t a2, const DenseMatrix_Double *a3)
{
  void (__cdecl *reportError)(const char *);
  SparseAttributes_t attributes;
  int factorization_low;
  int v9;
  int v10;
  int v11;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int columnStride;
  int rowCount;
  __int16 v20;
  int v21;
  int v22;
  int v23;
  void (__cdecl *free)(void *);
  size_t v25;
  char *v26;
  char *v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  SparseSymbolicFactorOptions v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)&a1->contents + 2))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32.control) = 0;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Subfactor does not hold a valid factorization.\n", (uint8_t *)&v32, 2u);
    }
    goto LABEL_63;
  }
  _SparseGetOptionsFromSymbolicFactor(&v32, &a1->factor.symbolicFactorization);
  reportError = v32.reportError;
  attributes = a1->attributes;
  factorization_low = LOBYTE(a1->factor.symbolicFactorization.factorization);
  v9 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  v10 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  if (v9 >= v10)
    v11 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  else
    v11 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  if (v9 <= v10)
    v9 = v10;
  if (*((_BYTE *)&a1->contents + 2) == 6 && BYTE1(a1->factor.symbolicFactorization.factorization) == 40)
    v13 = v9;
  else
    v13 = v11;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v14 = v13;
  else
    v14 = v11;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v15 = v11;
  else
    v15 = v13;
  v16 = *(_DWORD *)(a2 + 8);
  v17 = *(_DWORD *)a2;
  if (v16 < *(_DWORD *)a2)
  {
    if (v32.reportError)
      goto LABEL_26;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136315906;
    *(_QWORD *)&v32.orderMethod = "B";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v16;
    WORD1(v32.ignoreRowsAndColumns) = 2080;
    *(int **)((char *)&v32.ignoreRowsAndColumns + 4) = (int *)"B";
    WORD2(v32.malloc) = 1024;
    *(_DWORD *)((char *)&v32.malloc + 6) = v17;
    v28 = MEMORY[0x24BDACB70];
    goto LABEL_42;
  }
  columnStride = a3->columnStride;
  rowCount = a3->rowCount;
  if (columnStride < a3->rowCount)
  {
    if (v32.reportError)
    {
LABEL_26:
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      snprintf((char *)&v32, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
LABEL_27:
      ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v32);
      return;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136315906;
    *(_QWORD *)&v32.orderMethod = "X";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = columnStride;
    WORD1(v32.ignoreRowsAndColumns) = 2080;
    *(int **)((char *)&v32.ignoreRowsAndColumns + 4) = (int *)"X";
    WORD2(v32.malloc) = 1024;
    *(_DWORD *)((char *)&v32.malloc + 6) = rowCount;
    v28 = MEMORY[0x24BDACB70];
LABEL_42:
    _os_log_error_impl(&dword_20AB80000, v28, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", (uint8_t *)&v32, 0x22u);
    goto LABEL_63;
  }
  v20 = *(_WORD *)(a2 + 12);
  if ((v20 & 1) == 0)
    v17 = *(_DWORD *)(a2 + 4);
  v21 = *(&a3->rowCount + ((*(_WORD *)&a3->attributes & 1) == 0));
  v22 = *(_DWORD *)(a2 + 4 * (v20 & 1));
  v23 = *(&a3->rowCount + (*(_WORD *)&a3->attributes & 1));
  if (v17 != v21)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      snprintf((char *)&v32, 0x100uLL, "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n", "B");
      goto LABEL_27;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136316418;
    *(_QWORD *)&v32.orderMethod = "B";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v22;
    WORD1(v32.ignoreRowsAndColumns) = 1024;
    HIDWORD(v32.ignoreRowsAndColumns) = v17;
    LOWORD(v32.malloc) = 2080;
    *(void *(__cdecl **)(size_t))((char *)&v32.malloc + 2) = (void *(__cdecl *)(size_t))"X";
    WORD1(v32.free) = 1024;
    HIDWORD(v32.free) = v23;
    LOWORD(v32.reportError) = 1024;
    *(_DWORD *)((char *)&v32.reportError + 2) = v21;
    v29 = MEMORY[0x24BDACB70];
    v30 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
    goto LABEL_60;
  }
  if (v17 <= 0)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      snprintf((char *)&v32, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
      goto LABEL_27;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v32.control = 136315650;
      *(_QWORD *)&v32.orderMethod = "B";
      WORD2(v32.order) = 1024;
      *(_DWORD *)((char *)&v32.order + 6) = v22;
      WORD1(v32.ignoreRowsAndColumns) = 1024;
      HIDWORD(v32.ignoreRowsAndColumns) = v17;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", (uint8_t *)&v32, 0x18u);
    }
    goto LABEL_63;
  }
  if (v22 != v15)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      v31 = "B";
LABEL_51:
      snprintf((char *)&v32, 0x100uLL, "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n", v31);
      goto LABEL_27;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136316418;
    *(_QWORD *)&v32.orderMethod = "B";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v22;
    WORD1(v32.ignoreRowsAndColumns) = 1024;
    HIDWORD(v32.ignoreRowsAndColumns) = v17;
    LOWORD(v32.malloc) = 2080;
    *(void *(__cdecl **)(size_t))((char *)&v32.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
    WORD1(v32.free) = 1024;
    HIDWORD(v32.free) = v14;
    LOWORD(v32.reportError) = 1024;
    *(_DWORD *)((char *)&v32.reportError + 2) = v15;
    v29 = MEMORY[0x24BDACB70];
    v30 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
LABEL_60:
    _os_log_error_impl(&dword_20AB80000, v29, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v32, 0x2Eu);
    goto LABEL_63;
  }
  if (v23 != v14)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      v31 = "X";
      goto LABEL_51;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136316418;
    *(_QWORD *)&v32.orderMethod = "X";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v23;
    WORD1(v32.ignoreRowsAndColumns) = 1024;
    HIDWORD(v32.ignoreRowsAndColumns) = v17;
    LOWORD(v32.malloc) = 2080;
    *(void *(__cdecl **)(size_t))((char *)&v32.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
    WORD1(v32.free) = 1024;
    HIDWORD(v32.free) = v14;
    LOWORD(v32.reportError) = 1024;
    *(_DWORD *)((char *)&v32.reportError + 2) = v15;
    v29 = MEMORY[0x24BDACB70];
    v30 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
    goto LABEL_60;
  }
  free = v32.free;
  v25 = a1->workspaceRequiredPerRHS + *(_QWORD *)&a1[1].attributes * v17;
  v26 = (char *)((uint64_t (*)(size_t))v32.malloc)(v25);
  if (v26)
  {
    v27 = v26;
    _SparseSolveSubfactor_Double(a1, (const DenseMatrix_Double *)a2, a3, v26);
    ((void (*)(char *))free)(v27);
    return;
  }
  if (reportError)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
    memset(&v32, 0, sizeof(v32));
    snprintf((char *)&v32, 0x100uLL, "Failed to allocate workspace of size %ld.\n");
    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v32.control = 134217984;
    *(_QWORD *)&v32.orderMethod = v25;
    _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to allocate workspace of size %ld.\n", (uint8_t *)&v32, 0xCu);
  }
LABEL_63:
  _SparseTrap();
}

__n128 cva::VecLibSparse<double>::solve(_OWORD *a1, DenseMatrix_Double *a2, __int128 *a3, char *a4)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  DenseMatrix_Double v14;
  __int128 v15;
  uint64_t v16;
  _OWORD v17[8];
  DenseMatrix_Double v18;
  __int128 v19;
  uint64_t v20;
  _OWORD v21[8];

  v4 = a1[5];
  if (a4)
  {
    v21[4] = a1[4];
    v21[5] = v4;
    v5 = a1[7];
    v21[6] = a1[6];
    v21[7] = v5;
    v6 = a1[1];
    v21[0] = *a1;
    v21[1] = v6;
    v7 = a1[3];
    v21[2] = a1[2];
    v21[3] = v7;
    v8 = *a3;
    v20 = *((_QWORD *)a3 + 2);
    v19 = v8;
    v18 = *a2;
    sub_20ABEA564((const SparseOpaqueSubfactor_Double *)v21, (uint64_t)&v19, &v18, a4);
  }
  else
  {
    v17[4] = a1[4];
    v17[5] = v4;
    v10 = a1[7];
    v17[6] = a1[6];
    v17[7] = v10;
    v11 = a1[1];
    v17[0] = *a1;
    v17[1] = v11;
    v12 = a1[3];
    v17[2] = a1[2];
    v17[3] = v12;
    v13 = *a3;
    v16 = *((_QWORD *)a3 + 2);
    v15 = v13;
    v14 = *a2;
    sub_20ABEABB4((const SparseOpaqueSubfactor_Double *)v17, (uint64_t)&v15, &v14);
  }
  return result;
}

void cva::VecLibSparse<double>::solve(_OWORD *a1, uint64_t a2, char *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  _DWORD v8[4];
  uint64_t v9;
  _OWORD v10[8];

  v3 = a1[5];
  v10[4] = a1[4];
  v10[5] = v3;
  v4 = a1[7];
  v10[6] = a1[6];
  v10[7] = v4;
  v5 = a1[1];
  v10[0] = *a1;
  v10[1] = v5;
  v6 = a1[3];
  v10[2] = a1[2];
  v10[3] = v6;
  v7 = *(_QWORD *)(a2 + 8);
  v8[0] = *(_DWORD *)a2;
  v8[1] = 1;
  v8[2] = v8[0];
  v8[3] = 0;
  v9 = v7;
  if (a3)
    sub_20ABEB424((const SparseOpaqueSubfactor_Double *)v10, (uint64_t)v8, a3);
  else
    sub_20ABEB6BC((const SparseOpaqueSubfactor_Double *)v10, (uint64_t)v8);
}

void sub_20ABEB424(const SparseOpaqueSubfactor_Double *a1, uint64_t a2, char *a3)
{
  void (*v6)(_BYTE *);
  int v7;
  SparseAttributes_t attributes;
  int factorization_low;
  int v10;
  int v11;
  int v12;
  int v14;
  BOOL v15;
  int v16;
  int v17;
  NSObject *v18;
  const char *v19;
  _BYTE v20[256];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)&a1->contents + 2))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_WORD *)v20 = 0;
    v18 = MEMORY[0x24BDACB70];
    v19 = "Subfactor does not hold a valid factor subobject.\n";
LABEL_37:
    _os_log_error_impl(&dword_20AB80000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_25;
  }
  _SparseGetOptionsFromSymbolicFactor((SparseSymbolicFactorOptions *)v20, &a1->factor.symbolicFactorization);
  v6 = *(void (**)(_BYTE *))&v20[40];
  if (*(int *)(a2 + 4 * ((*(_WORD *)(a2 + 12) & 1) == 0)) > 0)
  {
    v7 = *(_DWORD *)(a2 + 4 * (*(_WORD *)(a2 + 12) & 1));
    attributes = a1->attributes;
    factorization_low = LOBYTE(a1->factor.symbolicFactorization.factorization);
    v10 = a1->factor.symbolicFactorization.rowCount * factorization_low;
    v11 = a1->factor.symbolicFactorization.columnCount * factorization_low;
    if (v10 <= v11)
      v12 = v11;
    else
      v12 = v10;
    if (v10 < v11)
      v11 = v10;
    if (*((_BYTE *)&a1->contents + 2) == 6 && BYTE1(a1->factor.symbolicFactorization.factorization) == 40)
      v14 = v12;
    else
      v14 = v11;
    v15 = (*(_BYTE *)&attributes & 1) == 0;
    if ((*(_BYTE *)&attributes & 1) != 0)
      v16 = v11;
    else
      v16 = v14;
    if (v15)
      v14 = v11;
    if (v16 <= v14)
      v17 = v14;
    else
      v17 = v16;
    if (v7 == v17)
    {
      _SparseSolveSubfactor_Double(a1, 0, (const DenseMatrix_Double *)a2, a3);
      return;
    }
    if (*(_QWORD *)&v20[40])
    {
      memset(v20, 0, sizeof(v20));
      snprintf(v20, 0x100uLL, "XB dimension (%d) must match maximum subfactor dimension (%d).\n", v7, v17);
      goto LABEL_30;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v20 = 67109376;
      *(_DWORD *)&v20[4] = v7;
      *(_WORD *)&v20[8] = 1024;
      *(_DWORD *)&v20[10] = v17;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "XB dimension (%d) must match maximum subfactor dimension (%d).\n", v20, 0xEu);
    }
LABEL_25:
    _SparseTrap();
    return;
  }
  if (!*(_QWORD *)&v20[40])
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_WORD *)v20 = 0;
    v18 = MEMORY[0x24BDACB70];
    v19 = "XB must have non-zero dimension.\n";
    goto LABEL_37;
  }
  memset(&v20[34], 0, 222);
  strcpy(v20, "XB must have non-zero dimension.\n");
LABEL_30:
  v6(v20);
}

void sub_20ABEB6BC(const SparseOpaqueSubfactor_Double *a1, uint64_t a2)
{
  void (*v4)(_BYTE *);
  uint64_t v5;
  uint64_t v6;
  int v7;
  SparseAttributes_t attributes;
  int factorization_low;
  int v10;
  int v11;
  int v12;
  int v14;
  BOOL v15;
  int v16;
  int v17;
  void (*v18)(char *);
  uint64_t v19;
  char *v20;
  char *v21;
  NSObject *v22;
  const char *v23;
  _BYTE v24[256];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)&a1->contents + 2))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_WORD *)v24 = 0;
    v22 = MEMORY[0x24BDACB70];
    v23 = "Subfactor does not hold a valid factorization.\n";
    goto LABEL_42;
  }
  _SparseGetOptionsFromSymbolicFactor((SparseSymbolicFactorOptions *)v24, &a1->factor.symbolicFactorization);
  v4 = *(void (**)(_BYTE *))&v24[40];
  v5 = *(_WORD *)(a2 + 12) & 1;
  v6 = *(unsigned int *)(a2 + 4 * ((_DWORD)v5 == 0));
  if ((int)v6 <= 0)
  {
    if (*(_QWORD *)&v24[40])
    {
      memset(&v24[34], 0, 222);
      strcpy(v24, "XB must have non-zero dimension.\n");
      goto LABEL_35;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_26;
    *(_WORD *)v24 = 0;
    v22 = MEMORY[0x24BDACB70];
    v23 = "XB must have non-zero dimension.\n";
LABEL_42:
    _os_log_error_impl(&dword_20AB80000, v22, OS_LOG_TYPE_ERROR, v23, v24, 2u);
    goto LABEL_26;
  }
  v7 = *(_DWORD *)(a2 + 4 * v5);
  attributes = a1->attributes;
  factorization_low = LOBYTE(a1->factor.symbolicFactorization.factorization);
  v10 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  v11 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  if (v10 <= v11)
    v12 = v11;
  else
    v12 = v10;
  if (v10 < v11)
    v11 = v10;
  if (*((_BYTE *)&a1->contents + 2) == 6 && BYTE1(a1->factor.symbolicFactorization.factorization) == 40)
    v14 = v12;
  else
    v14 = v11;
  v15 = (*(_BYTE *)&attributes & 1) == 0;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v16 = v11;
  else
    v16 = v14;
  if (v15)
    v14 = v11;
  if (v16 <= v14)
    v17 = v14;
  else
    v17 = v16;
  if (v7 == v17)
  {
    v18 = *(void (**)(char *))&v24[32];
    v19 = a1->workspaceRequiredPerRHS + *(_QWORD *)&a1[1].attributes * v6;
    v20 = (char *)(*(uint64_t (**)(uint64_t))&v24[24])(v19);
    if (v20)
    {
      v21 = v20;
      _SparseSolveSubfactor_Double(a1, 0, (const DenseMatrix_Double *)a2, v20);
      v18(v21);
      return;
    }
    if (v4)
    {
      memset(v24, 0, sizeof(v24));
      snprintf(v24, 0x100uLL, "Failed to allocate workspace of size %ld.\n");
      goto LABEL_35;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 134217984;
      *(_QWORD *)&v24[4] = v19;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to allocate workspace of size %ld.\n", v24, 0xCu);
    }
LABEL_26:
    _SparseTrap();
    return;
  }
  if (!*(_QWORD *)&v24[40])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v24 = 67109376;
      *(_DWORD *)&v24[4] = v7;
      *(_WORD *)&v24[8] = 1024;
      *(_DWORD *)&v24[10] = v17;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "XB dimension (%d) must match maximum subfactor dimension (%d).\n", v24, 0xEu);
    }
    goto LABEL_26;
  }
  memset(v24, 0, sizeof(v24));
  snprintf(v24, 0x100uLL, "XB dimension (%d) must match maximum subfactor dimension (%d).\n");
LABEL_35:
  v4(v24);
}

__n128 cva::VecLibSparse<double>::solve(_OWORD *a1, __int128 *a2, char *a3)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _OWORD v15[8];
  __int128 v16;
  uint64_t v17;
  _OWORD v18[8];

  v3 = a1[5];
  if (a3)
  {
    v18[4] = a1[4];
    v18[5] = v3;
    v4 = a1[7];
    v18[6] = a1[6];
    v18[7] = v4;
    v5 = a1[1];
    v18[0] = *a1;
    v18[1] = v5;
    v6 = a1[3];
    v18[2] = a1[2];
    v18[3] = v6;
    v7 = *a2;
    v17 = *((_QWORD *)a2 + 2);
    v16 = v7;
    sub_20ABEB424((const SparseOpaqueSubfactor_Double *)v18, (uint64_t)&v16, a3);
  }
  else
  {
    v15[4] = a1[4];
    v15[5] = v3;
    v9 = a1[7];
    v15[6] = a1[6];
    v15[7] = v9;
    v10 = a1[1];
    v15[0] = *a1;
    v15[1] = v10;
    v11 = a1[3];
    v15[2] = a1[2];
    v15[3] = v11;
    v12 = *a2;
    v14 = *((_QWORD *)a2 + 2);
    v13 = v12;
    sub_20ABEB6BC((const SparseOpaqueSubfactor_Double *)v15, (uint64_t)&v13);
  }
  return result;
}

__n128 cva::VecLibSparse<double>::multiply(_OWORD *a1, __int128 *a2, __int128 *a3, char *a4)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  DenseMatrix_Double v14;
  __int128 v15;
  uint64_t v16;
  _OWORD v17[8];
  __int128 v18;
  uint64_t v19;
  DenseMatrix_Double v20;
  _OWORD v21[8];

  v4 = a1[5];
  if (a4)
  {
    v21[4] = a1[4];
    v21[5] = v4;
    v5 = a1[7];
    v21[6] = a1[6];
    v21[7] = v5;
    v6 = a1[1];
    v21[0] = *a1;
    v21[1] = v6;
    v7 = a1[3];
    v21[2] = a1[2];
    v21[3] = v7;
    v8 = *a2;
    v20.data = (double *)*((_QWORD *)a2 + 2);
    *(_OWORD *)&v20.rowCount = v8;
    v19 = *((_QWORD *)a3 + 2);
    v18 = *a3;
    sub_20ABEBB64((const SparseOpaqueSubfactor_Double *)v21, &v20, (uint64_t)&v18, a4);
  }
  else
  {
    v17[4] = a1[4];
    v17[5] = v4;
    v10 = a1[7];
    v17[6] = a1[6];
    v17[7] = v10;
    v11 = a1[1];
    v17[0] = *a1;
    v17[1] = v11;
    v12 = a1[3];
    v17[2] = a1[2];
    v17[3] = v12;
    v13 = *a2;
    v16 = *((_QWORD *)a2 + 2);
    v15 = v13;
    v14 = *(DenseMatrix_Double *)a3;
    sub_20ABEC1B4((const SparseOpaqueSubfactor_Double *)v17, (uint64_t)&v15, &v14);
  }
  return result;
}

void sub_20ABEBB64(const SparseOpaqueSubfactor_Double *a1, const DenseMatrix_Double *a2, uint64_t a3, char *a4)
{
  void (__cdecl *reportError)(const char *);
  SparseAttributes_t attributes;
  int factorization_low;
  int v11;
  int v12;
  int v13;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int columnStride;
  int rowCount;
  __int16 v22;
  int v23;
  unsigned int v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  const char *v29;
  const char *v30;
  int v31;
  int v32;
  SparseSymbolicFactorOptions v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)&a1->contents + 2))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v33.control) = 0;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Subfactor does not hold a valid factor subobject.\n", (uint8_t *)&v33, 2u);
    }
    goto LABEL_58;
  }
  _SparseGetOptionsFromSymbolicFactor(&v33, &a1->factor.symbolicFactorization);
  reportError = v33.reportError;
  attributes = a1->attributes;
  factorization_low = LOBYTE(a1->factor.symbolicFactorization.factorization);
  v11 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  v12 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  if (v11 >= v12)
    v13 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  else
    v13 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  if (v11 <= v12)
    v11 = v12;
  if (*((_BYTE *)&a1->contents + 2) == 6 && BYTE1(a1->factor.symbolicFactorization.factorization) == 40)
    v15 = v11;
  else
    v15 = v13;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v16 = v15;
  else
    v16 = v13;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v17 = v13;
  else
    v17 = v15;
  v18 = *(_DWORD *)(a3 + 8);
  v19 = *(_DWORD *)a3;
  if (v18 < *(_DWORD *)a3)
  {
    if (v33.reportError)
      goto LABEL_26;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_58;
    v33.control = 136315906;
    *(_QWORD *)&v33.orderMethod = "Y";
    WORD2(v33.order) = 1024;
    *(_DWORD *)((char *)&v33.order + 6) = v18;
    WORD1(v33.ignoreRowsAndColumns) = 2080;
    *(int **)((char *)&v33.ignoreRowsAndColumns + 4) = (int *)"Y";
    WORD2(v33.malloc) = 1024;
    *(_DWORD *)((char *)&v33.malloc + 6) = v19;
    v26 = MEMORY[0x24BDACB70];
    goto LABEL_41;
  }
  columnStride = a2->columnStride;
  rowCount = a2->rowCount;
  if (columnStride >= a2->rowCount)
  {
    v22 = *(_WORD *)(a3 + 12);
    if ((v22 & 1) == 0)
      v19 = *(_DWORD *)(a3 + 4);
    v23 = *(&a2->rowCount + ((*(_WORD *)&a2->attributes & 1) == 0));
    v24 = v22 & 1;
    v25 = *(&a2->rowCount + (*(_WORD *)&a2->attributes & 1));
    if (v19 == v23)
    {
      if (v19 <= 0)
      {
        if (v33.reportError)
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v34 = 0u;
          memset(&v33, 0, sizeof(v33));
          snprintf((char *)&v33, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
          goto LABEL_27;
        }
        v31 = *(_DWORD *)(a3 + 4 * v24);
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v33.control = 136315650;
          *(_QWORD *)&v33.orderMethod = "Y";
          WORD2(v33.order) = 1024;
          *(_DWORD *)((char *)&v33.order + 6) = v31;
          WORD1(v33.ignoreRowsAndColumns) = 1024;
          HIDWORD(v33.ignoreRowsAndColumns) = v19;
          _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", (uint8_t *)&v33, 0x18u);
        }
        goto LABEL_58;
      }
      if (*(_DWORD *)(a3 + 4 * v24) == v17)
      {
        if (v25 == v16)
        {
          _SparseMultiplySubfactor_Double(a1, a2, (const DenseMatrix_Double *)a3, a4);
          return;
        }
        if (v33.reportError)
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v34 = 0u;
          memset(&v33, 0, sizeof(v33));
          v30 = "X";
          goto LABEL_50;
        }
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_58;
        v33.control = 136316418;
        *(_QWORD *)&v33.orderMethod = "X";
        WORD2(v33.order) = 1024;
        *(_DWORD *)((char *)&v33.order + 6) = v25;
        WORD1(v33.ignoreRowsAndColumns) = 1024;
        HIDWORD(v33.ignoreRowsAndColumns) = v19;
        LOWORD(v33.malloc) = 2080;
        *(void *(__cdecl **)(size_t))((char *)&v33.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
        WORD1(v33.free) = 1024;
        HIDWORD(v33.free) = v16;
        LOWORD(v33.reportError) = 1024;
        *(_DWORD *)((char *)&v33.reportError + 2) = v17;
        v28 = MEMORY[0x24BDACB70];
        v29 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
      }
      else
      {
        if (v33.reportError)
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v34 = 0u;
          memset(&v33, 0, sizeof(v33));
          v30 = "Y";
LABEL_50:
          snprintf((char *)&v33, 0x100uLL, "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n", v30);
          goto LABEL_27;
        }
        v32 = *(_DWORD *)(a3 + 4 * v24);
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_58;
        v33.control = 136316418;
        *(_QWORD *)&v33.orderMethod = "Y";
        WORD2(v33.order) = 1024;
        *(_DWORD *)((char *)&v33.order + 6) = v32;
        WORD1(v33.ignoreRowsAndColumns) = 1024;
        HIDWORD(v33.ignoreRowsAndColumns) = v19;
        LOWORD(v33.malloc) = 2080;
        *(void *(__cdecl **)(size_t))((char *)&v33.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
        WORD1(v33.free) = 1024;
        HIDWORD(v33.free) = v16;
        LOWORD(v33.reportError) = 1024;
        *(_DWORD *)((char *)&v33.reportError + 2) = v17;
        v28 = MEMORY[0x24BDACB70];
        v29 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
      }
    }
    else
    {
      if (v33.reportError)
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v34 = 0u;
        memset(&v33, 0, sizeof(v33));
        snprintf((char *)&v33, 0x100uLL, "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n", "Y");
        goto LABEL_27;
      }
      v27 = *(_DWORD *)(a3 + 4 * v24);
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        goto LABEL_58;
      v33.control = 136316418;
      *(_QWORD *)&v33.orderMethod = "Y";
      WORD2(v33.order) = 1024;
      *(_DWORD *)((char *)&v33.order + 6) = v27;
      WORD1(v33.ignoreRowsAndColumns) = 1024;
      HIDWORD(v33.ignoreRowsAndColumns) = v19;
      LOWORD(v33.malloc) = 2080;
      *(void *(__cdecl **)(size_t))((char *)&v33.malloc + 2) = (void *(__cdecl *)(size_t))"X";
      WORD1(v33.free) = 1024;
      HIDWORD(v33.free) = v25;
      LOWORD(v33.reportError) = 1024;
      *(_DWORD *)((char *)&v33.reportError + 2) = v23;
      v28 = MEMORY[0x24BDACB70];
      v29 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
    }
    _os_log_error_impl(&dword_20AB80000, v28, OS_LOG_TYPE_ERROR, v29, (uint8_t *)&v33, 0x2Eu);
    goto LABEL_58;
  }
  if (v33.reportError)
  {
LABEL_26:
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v34 = 0u;
    memset(&v33, 0, sizeof(v33));
    snprintf((char *)&v33, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
LABEL_27:
    ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v33);
    return;
  }
  if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    goto LABEL_58;
  v33.control = 136315906;
  *(_QWORD *)&v33.orderMethod = "X";
  WORD2(v33.order) = 1024;
  *(_DWORD *)((char *)&v33.order + 6) = columnStride;
  WORD1(v33.ignoreRowsAndColumns) = 2080;
  *(int **)((char *)&v33.ignoreRowsAndColumns + 4) = (int *)"X";
  WORD2(v33.malloc) = 1024;
  *(_DWORD *)((char *)&v33.malloc + 6) = rowCount;
  v26 = MEMORY[0x24BDACB70];
LABEL_41:
  _os_log_error_impl(&dword_20AB80000, v26, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", (uint8_t *)&v33, 0x22u);
LABEL_58:
  _SparseTrap();
}

void sub_20ABEC1B4(const SparseOpaqueSubfactor_Double *a1, uint64_t a2, const DenseMatrix_Double *a3)
{
  void (__cdecl *reportError)(const char *);
  SparseAttributes_t attributes;
  int factorization_low;
  int v9;
  int v10;
  int v11;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int columnStride;
  int rowCount;
  __int16 v20;
  int v21;
  int v22;
  int v23;
  void (__cdecl *free)(void *);
  size_t v25;
  char *v26;
  char *v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  SparseSymbolicFactorOptions v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  if (!*((_BYTE *)&a1->contents + 2))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32.control) = 0;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Subfactor does not hold a valid factor subobject.\n", (uint8_t *)&v32, 2u);
    }
    goto LABEL_63;
  }
  _SparseGetOptionsFromSymbolicFactor(&v32, &a1->factor.symbolicFactorization);
  reportError = v32.reportError;
  attributes = a1->attributes;
  factorization_low = LOBYTE(a1->factor.symbolicFactorization.factorization);
  v9 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  v10 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  if (v9 >= v10)
    v11 = a1->factor.symbolicFactorization.columnCount * factorization_low;
  else
    v11 = a1->factor.symbolicFactorization.rowCount * factorization_low;
  if (v9 <= v10)
    v9 = v10;
  if (*((_BYTE *)&a1->contents + 2) == 6 && BYTE1(a1->factor.symbolicFactorization.factorization) == 40)
    v13 = v9;
  else
    v13 = v11;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v14 = v13;
  else
    v14 = v11;
  if ((*(_BYTE *)&attributes & 1) != 0)
    v15 = v11;
  else
    v15 = v13;
  v16 = *(_DWORD *)(a2 + 8);
  v17 = *(_DWORD *)a2;
  if (v16 < *(_DWORD *)a2)
  {
    if (v32.reportError)
      goto LABEL_26;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136315906;
    *(_QWORD *)&v32.orderMethod = "X";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v16;
    WORD1(v32.ignoreRowsAndColumns) = 2080;
    *(int **)((char *)&v32.ignoreRowsAndColumns + 4) = (int *)"X";
    WORD2(v32.malloc) = 1024;
    *(_DWORD *)((char *)&v32.malloc + 6) = v17;
    v28 = MEMORY[0x24BDACB70];
    goto LABEL_42;
  }
  columnStride = a3->columnStride;
  rowCount = a3->rowCount;
  if (columnStride < a3->rowCount)
  {
    if (v32.reportError)
    {
LABEL_26:
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      snprintf((char *)&v32, 0x100uLL, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n");
LABEL_27:
      ((void (*)(SparseSymbolicFactorOptions *))reportError)(&v32);
      return;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136315906;
    *(_QWORD *)&v32.orderMethod = "Y";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = columnStride;
    WORD1(v32.ignoreRowsAndColumns) = 2080;
    *(int **)((char *)&v32.ignoreRowsAndColumns + 4) = (int *)"Y";
    WORD2(v32.malloc) = 1024;
    *(_DWORD *)((char *)&v32.malloc + 6) = rowCount;
    v28 = MEMORY[0x24BDACB70];
LABEL_42:
    _os_log_error_impl(&dword_20AB80000, v28, OS_LOG_TYPE_ERROR, "%s.columnStride (%d) must be at least %s.rowCount (%d).\n", (uint8_t *)&v32, 0x22u);
    goto LABEL_63;
  }
  v20 = *(_WORD *)(a2 + 12);
  if ((v20 & 1) == 0)
    v17 = *(_DWORD *)(a2 + 4);
  v21 = *(&a3->rowCount + ((*(_WORD *)&a3->attributes & 1) == 0));
  v22 = *(_DWORD *)(a2 + 4 * (v20 & 1));
  v23 = *(&a3->rowCount + (*(_WORD *)&a3->attributes & 1));
  if (v17 != v21)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      snprintf((char *)&v32, 0x100uLL, "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n", "X");
      goto LABEL_27;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136316418;
    *(_QWORD *)&v32.orderMethod = "X";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v22;
    WORD1(v32.ignoreRowsAndColumns) = 1024;
    HIDWORD(v32.ignoreRowsAndColumns) = v17;
    LOWORD(v32.malloc) = 2080;
    *(void *(__cdecl **)(size_t))((char *)&v32.malloc + 2) = (void *(__cdecl *)(size_t))"Y";
    WORD1(v32.free) = 1024;
    HIDWORD(v32.free) = v23;
    LOWORD(v32.reportError) = 1024;
    *(_DWORD *)((char *)&v32.reportError + 2) = v21;
    v29 = MEMORY[0x24BDACB70];
    v30 = "%s (%dx%d) and %s (%dx%d) do not represent the same number of right-hand sides.\n";
    goto LABEL_60;
  }
  if (v17 <= 0)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      snprintf((char *)&v32, 0x100uLL, "%s (%dx%d) must represent at least one right-hand side.\n");
      goto LABEL_27;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v32.control = 136315650;
      *(_QWORD *)&v32.orderMethod = "X";
      WORD2(v32.order) = 1024;
      *(_DWORD *)((char *)&v32.order + 6) = v22;
      WORD1(v32.ignoreRowsAndColumns) = 1024;
      HIDWORD(v32.ignoreRowsAndColumns) = v17;
      _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s (%dx%d) must represent at least one right-hand side.\n", (uint8_t *)&v32, 0x18u);
    }
    goto LABEL_63;
  }
  if (v22 != v14)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      v31 = "X";
LABEL_51:
      snprintf((char *)&v32, 0x100uLL, "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n", v31);
      goto LABEL_27;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136316418;
    *(_QWORD *)&v32.orderMethod = "X";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v22;
    WORD1(v32.ignoreRowsAndColumns) = 1024;
    HIDWORD(v32.ignoreRowsAndColumns) = v17;
    LOWORD(v32.malloc) = 2080;
    *(void *(__cdecl **)(size_t))((char *)&v32.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
    WORD1(v32.free) = 1024;
    HIDWORD(v32.free) = v15;
    LOWORD(v32.reportError) = 1024;
    *(_DWORD *)((char *)&v32.reportError + 2) = v14;
    v29 = MEMORY[0x24BDACB70];
    v30 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
LABEL_60:
    _os_log_error_impl(&dword_20AB80000, v29, OS_LOG_TYPE_ERROR, v30, (uint8_t *)&v32, 0x2Eu);
    goto LABEL_63;
  }
  if (v23 != v15)
  {
    if (v32.reportError)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(&v32, 0, sizeof(v32));
      v31 = "Y";
      goto LABEL_51;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_63;
    v32.control = 136316418;
    *(_QWORD *)&v32.orderMethod = "Y";
    WORD2(v32.order) = 1024;
    *(_DWORD *)((char *)&v32.order + 6) = v23;
    WORD1(v32.ignoreRowsAndColumns) = 1024;
    HIDWORD(v32.ignoreRowsAndColumns) = v17;
    LOWORD(v32.malloc) = 2080;
    *(void *(__cdecl **)(size_t))((char *)&v32.malloc + 2) = (void *(__cdecl *)(size_t))"subfactor dimension";
    WORD1(v32.free) = 1024;
    HIDWORD(v32.free) = v15;
    LOWORD(v32.reportError) = 1024;
    *(_DWORD *)((char *)&v32.reportError + 2) = v14;
    v29 = MEMORY[0x24BDACB70];
    v30 = "%s (size %dx%d) does not match dimensions of %s (%d x %d).\n";
    goto LABEL_60;
  }
  free = v32.free;
  v25 = a1->workspaceRequiredPerRHS + *(_QWORD *)&a1[1].attributes * v17;
  v26 = (char *)((uint64_t (*)(size_t))v32.malloc)(v25);
  if (v26)
  {
    v27 = v26;
    _SparseMultiplySubfactor_Double(a1, (const DenseMatrix_Double *)a2, a3, v26);
    ((void (*)(char *))free)(v27);
    return;
  }
  if (reportError)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v33 = 0u;
    memset(&v32, 0, sizeof(v32));
    snprintf((char *)&v32, 0x100uLL, "Failed to allocate workspace of size %ld.\n");
    goto LABEL_27;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v32.control = 134217984;
    *(_QWORD *)&v32.orderMethod = v25;
    _os_log_error_impl(&dword_20AB80000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to allocate workspace of size %ld.\n", (uint8_t *)&v32, 0xCu);
  }
LABEL_63:
  _SparseTrap();
}

void cva::VecLibSparse<double>::multiply(_OWORD *a1, uint64_t a2, uint64_t a3, char *a4)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  double *v8;
  int v9;
  double *v10;
  DenseMatrix_Double v11;
  DenseMatrix_Double v12;
  _OWORD v13[8];

  v4 = a1[5];
  v13[4] = a1[4];
  v13[5] = v4;
  v5 = a1[7];
  v13[6] = a1[6];
  v13[7] = v5;
  v6 = a1[1];
  v13[0] = *a1;
  v13[1] = v6;
  v7 = a1[3];
  v13[2] = a1[2];
  v13[3] = v7;
  v8 = *(double **)(a2 + 8);
  v9 = *(_DWORD *)a3;
  v10 = *(double **)(a3 + 8);
  v12.rowCount = *(_DWORD *)a2;
  v12.columnCount = 1;
  v12.columnStride = v12.rowCount;
  *(_DWORD *)&v12.attributes = 0;
  v12.data = v8;
  v11.rowCount = v9;
  v11.columnCount = 1;
  v11.columnStride = v9;
  *(_DWORD *)&v11.attributes = 0;
  v11.data = v10;
  if (a4)
    sub_20ABEBB64((const SparseOpaqueSubfactor_Double *)v13, &v12, (uint64_t)&v11, a4);
  else
    sub_20ABEC1B4((const SparseOpaqueSubfactor_Double *)v13, (uint64_t)&v12, &v11);
}

BOOL cva::adp::Version::operator<(_DWORD *a1, _DWORD *a2)
{
  if (*a1 < *a2)
    return 1;
  if (*a1 == *a2)
    return a1[1] < a2[1];
  return 0;
}

BOOL cva::adp::Version::operator==(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

BOOL cva::adp::Version::operator>(_DWORD *a1, _DWORD *a2)
{
  if (*a1 > *a2)
    return 1;
  if (*a1 == *a2)
    return a1[1] > a2[1];
  return 0;
}

BOOL cva::adp::Version::isCurrent(cva::adp::Version *this)
{
  return !*(_DWORD *)this && *((_DWORD *)this + 1) == 9;
}

uint64_t cva::adp::Version::defaultVersion(cva::adp::Version *this)
{
  return 0x100000000;
}

uint64_t cva::adp::Version::currentVersion(cva::adp::Version *this)
{
  return 0x900000000;
}

uint64_t cva::adp::io::openInputStream@<X0>(const char **this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  std::ios_base *v10;
  const char *v11;
  uint64_t result;
  const char *v13;
  stat v14;

  v5 = MEMORY[0x24BEDB838];
  v6 = MEMORY[0x24BEDB838] + 64;
  a2[53] = MEMORY[0x24BEDB838] + 64;
  v7 = a2 + 2;
  v9 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 8);
  v8 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 16);
  *a2 = v9;
  *(_QWORD *)((char *)a2 + *(_QWORD *)(v9 - 24)) = v8;
  a2[1] = 0;
  v10 = (std::ios_base *)((char *)a2 + *(_QWORD *)(*a2 - 24));
  std::ios_base::init(v10, v7);
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  *a2 = v5 + 24;
  a2[53] = v6;
  MEMORY[0x20BD2CD74](v7);
  v11 = *this;
  if ((*this)[23] < 0)
    v11 = *(const char **)v11;
  result = access(v11, 0);
  if (!(_DWORD)result)
  {
    v13 = *this;
    if ((*this)[23] < 0)
      v13 = *(const char **)v13;
    result = stat(v13, &v14);
    if (!(_DWORD)result && (v14.st_mode & 0xF000) == 0x8000)
      return std::ifstream::open();
  }
  return result;
}

uint64_t cva::adp::io::openOutputStream@<X0>(const cva::Path *a1@<X1>, char a2@<W2>, _QWORD *a3@<X8>)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  std::ios_base *v12;

  v5 = (int)a1;
  v7 = MEMORY[0x24BEDB840];
  v8 = MEMORY[0x24BEDB840] + 64;
  a3[52] = MEMORY[0x24BEDB840] + 64;
  v9 = a3 + 1;
  v11 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 8);
  v10 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 16);
  *a3 = v11;
  *(_QWORD *)((char *)a3 + *(_QWORD *)(v11 - 24)) = v10;
  v12 = (std::ios_base *)((char *)a3 + *(_QWORD *)(*a3 - 24));
  std::ios_base::init(v12, v9);
  v12[1].__vftable = 0;
  v12[1].__fmtflags_ = -1;
  *a3 = v7 + 24;
  a3[52] = v8;
  MEMORY[0x20BD2CD74](v9);
  if ((a2 & 1) == 0)
    *(_QWORD *)((char *)a3 + *(_QWORD *)(*a3 - 24) + 16) = v5;
  return std::ofstream::open();
}

uint64_t cva::adp::io::openOutputStream@<X0>(const cva::Path *a1@<X1>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  std::ios_base *v10;

  v3 = (char)a1;
  v5 = MEMORY[0x24BEDB840];
  v6 = MEMORY[0x24BEDB840] + 64;
  a2[52] = MEMORY[0x24BEDB840] + 64;
  v7 = a2 + 1;
  v9 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 8);
  v8 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 16);
  *a2 = v9;
  *(_QWORD *)((char *)a2 + *(_QWORD *)(v9 - 24)) = v8;
  v10 = (std::ios_base *)((char *)a2 + *(_QWORD *)(*a2 - 24));
  std::ios_base::init(v10, v7);
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  *a2 = v5 + 24;
  a2[52] = v6;
  MEMORY[0x20BD2CD74](v7);
  if ((v3 & 1) == 0)
    *(_QWORD *)((char *)a2 + *(_QWORD *)(*a2 - 24) + 16) = 16;
  return std::ofstream::open();
}

BOOL cva::adp::io::createPath(const char **this, const cva::Path *a2)
{
  const char *v3;
  const char *v4;
  const char *v5;
  _BOOL8 result;
  const char *v7;
  int v8;
  stat v9;

  v3 = *this;
  if (v3[23] < 0)
    v3 = *(const char **)v3;
  if (!access(v3, 0))
    return 1;
  v4 = *this;
  if ((*this)[23] < 0)
    v4 = *(const char **)v4;
  if (access(v4, 0))
  {
    v5 = *this;
    if ((*this)[23] < 0)
      v5 = *(const char **)v5;
    return !mkdir(v5, 0x1FFu);
  }
  v7 = *this;
  if ((*this)[23] < 0)
    v7 = *(const char **)v7;
  v8 = stat(v7, &v9);
  result = 0;
  if (!v8 && (v9.st_mode & 0xF000) == 0x4000)
    return 1;
  return result;
}

uint64_t cva::adp::io::whiteSpace@<X0>(uint64_t this@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if ((this & 1) != 0)
  {
    v2 = 0;
    v3 = 0;
  }
  else
  {
    a2[1] = 0;
    v3 = 32;
    v2 = 1;
  }
  a2[23] = v2;
  *a2 = v3;
  return this;
}

uint64_t cva::adp::io::endLine@<X0>(uint64_t this@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if ((this & 1) != 0)
  {
    v2 = 0;
    v3 = 0;
  }
  else
  {
    a2[1] = 0;
    v3 = 10;
    v2 = 1;
  }
  a2[23] = v2;
  *a2 = v3;
  return this;
}

void sub_20ABECE00(uint64_t a1)
{
  cva::Buffer<float>::~Buffer(a1);
  JUMPOUT(0x20BD2D02CLL);
}

uint64_t cva::BufferTiled<float>::doResize(uint64_t result, uint64_t *a2)
{
  int v2;
  uint64_t v3;

  v2 = *((_DWORD *)a2 + 2);
  v3 = *a2;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = v3;
  *(_DWORD *)(result + 24) = v2;
  return result;
}

void cva::BufferTiled<float>::allocTexture(_DWORD *a1, id *a2, char a3, _QWORD *a4)
{
  id v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  id v18;

  v7 = *a2;
  if ((a3 & 1) == 0)
  {
    if (a4[1])
      goto LABEL_26;
    v18 = v7;
    if (*a4)
    {
      v10 = *(id *)(*a4 + 8);
      if (objc_msgSend(v10, "pixelFormat") == 55)
        goto LABEL_25;
      v14 = (void *)objc_msgSend(v10, "newTextureViewWithPixelFormat:", 55);
      v15 = *a4;
      if (*a4)
      {

        MEMORY[0x20BD2D02C](v15, 0xE0C400670D255);
      }
      v13 = v14;
      if (v13)
        goto LABEL_19;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 55, (a1[5] * a1[4]), a1[6], 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v18, "newTextureWithDescriptor:", v10);
      if (v13)
      {
LABEL_19:
        v17 = (_QWORD *)operator new();
        *v17 = 0;
        v17[1] = v13;
        v17[2] = 0;
LABEL_23:

        *a4 = v17;
        goto LABEL_24;
      }
    }
    v17 = 0;
    goto LABEL_23;
  }
  v8 = a1[4];
  if ((v8 & 3) == 0)
  {
    v18 = v7;
    v9 = a4[1];
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 125, a1[5] * (v8 >> 2), a1[6], 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v18, "newTextureWithDescriptor:", v10);
      if (v13)
      {
LABEL_17:
        v16 = (_QWORD *)operator new();
        *v16 = 0;
        v16[1] = v13;
        v16[2] = 0;
LABEL_21:

        a4[1] = v16;
LABEL_24:

        goto LABEL_25;
      }
LABEL_20:
      v16 = 0;
      goto LABEL_21;
    }
    v10 = *(id *)(v9 + 8);
    if (objc_msgSend(v10, "pixelFormat") != 125)
    {
      v11 = (void *)objc_msgSend(v10, "newTextureViewWithPixelFormat:", 125);
      v12 = a4[1];
      if (v12)
      {

        MEMORY[0x20BD2D02C](v12, 0xE0C400670D255);
      }
      v13 = v11;
      if (v13)
        goto LABEL_17;
      goto LABEL_20;
    }
LABEL_25:

    v7 = v18;
  }
LABEL_26:

}

void sub_20ABED0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_20ABED12C(uint64_t a1)
{
  cva::Buffer<unsigned short>::~Buffer(a1);
  JUMPOUT(0x20BD2D02CLL);
}

uint64_t cva::BufferTiled<unsigned short>::doResize(uint64_t result, uint64_t *a2)
{
  int v2;
  uint64_t v3;

  v2 = *((_DWORD *)a2 + 2);
  v3 = *a2;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = v3;
  *(_DWORD *)(result + 24) = v2;
  return result;
}

void cva::BufferTiled<unsigned short>::allocTexture(_DWORD *a1, id *a2, char a3, _QWORD *a4)
{
  id v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  id v18;

  v7 = *a2;
  if ((a3 & 1) == 0)
  {
    if (a4[1])
      goto LABEL_26;
    v18 = v7;
    if (*a4)
    {
      v10 = *(id *)(*a4 + 8);
      if (objc_msgSend(v10, "pixelFormat") == 23)
        goto LABEL_25;
      v14 = (void *)objc_msgSend(v10, "newTextureViewWithPixelFormat:", 23);
      v15 = *a4;
      if (*a4)
      {

        MEMORY[0x20BD2D02C](v15, 0xE0C400670D255);
      }
      v13 = v14;
      if (v13)
        goto LABEL_19;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 23, (a1[5] * a1[4]), a1[6], 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v18, "newTextureWithDescriptor:", v10);
      if (v13)
      {
LABEL_19:
        v17 = (_QWORD *)operator new();
        *v17 = 0;
        v17[1] = v13;
        v17[2] = 0;
LABEL_23:

        *a4 = v17;
        goto LABEL_24;
      }
    }
    v17 = 0;
    goto LABEL_23;
  }
  v8 = a1[4];
  if ((v8 & 3) == 0)
  {
    v18 = v7;
    v9 = a4[1];
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 113, a1[5] * (v8 >> 2), a1[6], 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v18, "newTextureWithDescriptor:", v10);
      if (v13)
      {
LABEL_17:
        v16 = (_QWORD *)operator new();
        *v16 = 0;
        v16[1] = v13;
        v16[2] = 0;
LABEL_21:

        a4[1] = v16;
LABEL_24:

        goto LABEL_25;
      }
LABEL_20:
      v16 = 0;
      goto LABEL_21;
    }
    v10 = *(id *)(v9 + 8);
    if (objc_msgSend(v10, "pixelFormat") != 113)
    {
      v11 = (void *)objc_msgSend(v10, "newTextureViewWithPixelFormat:", 113);
      v12 = a4[1];
      if (v12)
      {

        MEMORY[0x20BD2D02C](v12, 0xE0C400670D255);
      }
      v13 = v11;
      if (v13)
        goto LABEL_17;
      goto LABEL_20;
    }
LABEL_25:

    v7 = v18;
  }
LABEL_26:

}

void sub_20ABED400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_20ABED458(uint64_t a1)
{
  cva::Buffer<unsigned char>::~Buffer(a1);
  JUMPOUT(0x20BD2D02CLL);
}

uint64_t cva::BufferTiled<unsigned char>::doResize(uint64_t result, uint64_t *a2)
{
  int v2;
  uint64_t v3;

  v2 = *((_DWORD *)a2 + 2);
  v3 = *a2;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = v3;
  *(_DWORD *)(result + 24) = v2;
  return result;
}

void cva::BufferTiled<unsigned char>::allocTexture(_DWORD *a1, id *a2, char a3, _QWORD *a4)
{
  id v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  id v18;

  v7 = *a2;
  if ((a3 & 1) == 0)
  {
    if (a4[1])
      goto LABEL_26;
    v18 = v7;
    if (*a4)
    {
      v10 = *(id *)(*a4 + 8);
      if (objc_msgSend(v10, "pixelFormat") == 13)
        goto LABEL_25;
      v14 = (void *)objc_msgSend(v10, "newTextureViewWithPixelFormat:", 13);
      v15 = *a4;
      if (*a4)
      {

        MEMORY[0x20BD2D02C](v15, 0xE0C400670D255);
      }
      v13 = v14;
      if (v13)
        goto LABEL_19;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 13, (a1[5] * a1[4]), a1[6], 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v18, "newTextureWithDescriptor:", v10);
      if (v13)
      {
LABEL_19:
        v17 = (_QWORD *)operator new();
        *v17 = 0;
        v17[1] = v13;
        v17[2] = 0;
LABEL_23:

        *a4 = v17;
        goto LABEL_24;
      }
    }
    v17 = 0;
    goto LABEL_23;
  }
  v8 = a1[4];
  if ((v8 & 3) == 0)
  {
    v18 = v7;
    v9 = a4[1];
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 73, a1[5] * (v8 >> 2), a1[6], 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v18, "newTextureWithDescriptor:", v10);
      if (v13)
      {
LABEL_17:
        v16 = (_QWORD *)operator new();
        *v16 = 0;
        v16[1] = v13;
        v16[2] = 0;
LABEL_21:

        a4[1] = v16;
LABEL_24:

        goto LABEL_25;
      }
LABEL_20:
      v16 = 0;
      goto LABEL_21;
    }
    v10 = *(id *)(v9 + 8);
    if (objc_msgSend(v10, "pixelFormat") != 73)
    {
      v11 = (void *)objc_msgSend(v10, "newTextureViewWithPixelFormat:", 73);
      v12 = a4[1];
      if (v12)
      {

        MEMORY[0x20BD2D02C](v12, 0xE0C400670D255);
      }
      v13 = v11;
      if (v13)
        goto LABEL_17;
      goto LABEL_20;
    }
LABEL_25:

    v7 = v18;
  }
LABEL_26:

}

void sub_20ABED72C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_20ABED784(uint64_t a1)
{
  cva::Buffer<unsigned int>::~Buffer(a1);
  JUMPOUT(0x20BD2D02CLL);
}

uint64_t cva::BufferTiled<unsigned int>::doResize(uint64_t result, uint64_t *a2)
{
  int v2;
  uint64_t v3;

  v2 = *((_DWORD *)a2 + 2);
  v3 = *a2;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = v3;
  *(_DWORD *)(result + 24) = v2;
  return result;
}

void cva::BufferTiled<unsigned int>::allocTexture(_DWORD *a1, id *a2, char a3, _QWORD *a4)
{
  id v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  id v18;

  v7 = *a2;
  if ((a3 & 1) == 0)
  {
    if (a4[1])
      goto LABEL_26;
    v18 = v7;
    if (*a4)
    {
      v10 = *(id *)(*a4 + 8);
      if (objc_msgSend(v10, "pixelFormat") == 53)
        goto LABEL_25;
      v14 = (void *)objc_msgSend(v10, "newTextureViewWithPixelFormat:", 53);
      v15 = *a4;
      if (*a4)
      {

        MEMORY[0x20BD2D02C](v15, 0xE0C400670D255);
      }
      v13 = v14;
      if (v13)
        goto LABEL_19;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 53, (a1[5] * a1[4]), a1[6], 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v18, "newTextureWithDescriptor:", v10);
      if (v13)
      {
LABEL_19:
        v17 = (_QWORD *)operator new();
        *v17 = 0;
        v17[1] = v13;
        v17[2] = 0;
LABEL_23:

        *a4 = v17;
        goto LABEL_24;
      }
    }
    v17 = 0;
    goto LABEL_23;
  }
  v8 = a1[4];
  if ((v8 & 3) == 0)
  {
    v18 = v7;
    v9 = a4[1];
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 123, a1[5] * (v8 >> 2), a1[6], 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v18, "newTextureWithDescriptor:", v10);
      if (v13)
      {
LABEL_17:
        v16 = (_QWORD *)operator new();
        *v16 = 0;
        v16[1] = v13;
        v16[2] = 0;
LABEL_21:

        a4[1] = v16;
LABEL_24:

        goto LABEL_25;
      }
LABEL_20:
      v16 = 0;
      goto LABEL_21;
    }
    v10 = *(id *)(v9 + 8);
    if (objc_msgSend(v10, "pixelFormat") != 123)
    {
      v11 = (void *)objc_msgSend(v10, "newTextureViewWithPixelFormat:", 123);
      v12 = a4[1];
      if (v12)
      {

        MEMORY[0x20BD2D02C](v12, 0xE0C400670D255);
      }
      v13 = v11;
      if (v13)
        goto LABEL_17;
      goto LABEL_20;
    }
LABEL_25:

    v7 = v18;
  }
LABEL_26:

}

void sub_20ABEDA58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_20ABEDAB0(uint64_t a1)
{
  cva::Buffer<cva::half>::~Buffer(a1);
  JUMPOUT(0x20BD2D02CLL);
}

uint64_t cva::BufferTiled<cva::half>::doResize(uint64_t result, uint64_t *a2)
{
  int v2;
  uint64_t v3;

  v2 = *((_DWORD *)a2 + 2);
  v3 = *a2;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = v3;
  *(_DWORD *)(result + 24) = v2;
  return result;
}

void cva::BufferTiled<cva::half>::allocTexture(_DWORD *a1, id *a2, char a3, _QWORD *a4)
{
  id v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  id v18;

  v7 = *a2;
  if ((a3 & 1) == 0)
  {
    if (a4[1])
      goto LABEL_26;
    v18 = v7;
    if (*a4)
    {
      v10 = *(id *)(*a4 + 8);
      if (objc_msgSend(v10, "pixelFormat") == 25)
        goto LABEL_25;
      v14 = (void *)objc_msgSend(v10, "newTextureViewWithPixelFormat:", 25);
      v15 = *a4;
      if (*a4)
      {

        MEMORY[0x20BD2D02C](v15, 0xE0C400670D255);
      }
      v13 = v14;
      if (v13)
        goto LABEL_19;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 25, (a1[5] * a1[4]), a1[6], 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v18, "newTextureWithDescriptor:", v10);
      if (v13)
      {
LABEL_19:
        v17 = (_QWORD *)operator new();
        *v17 = 0;
        v17[1] = v13;
        v17[2] = 0;
LABEL_23:

        *a4 = v17;
        goto LABEL_24;
      }
    }
    v17 = 0;
    goto LABEL_23;
  }
  v8 = a1[4];
  if ((v8 & 3) == 0)
  {
    v18 = v7;
    v9 = a4[1];
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, a1[5] * (v8 >> 2), a1[6], 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v18, "newTextureWithDescriptor:", v10);
      if (v13)
      {
LABEL_17:
        v16 = (_QWORD *)operator new();
        *v16 = 0;
        v16[1] = v13;
        v16[2] = 0;
LABEL_21:

        a4[1] = v16;
LABEL_24:

        goto LABEL_25;
      }
LABEL_20:
      v16 = 0;
      goto LABEL_21;
    }
    v10 = *(id *)(v9 + 8);
    if (objc_msgSend(v10, "pixelFormat") != 115)
    {
      v11 = (void *)objc_msgSend(v10, "newTextureViewWithPixelFormat:", 115);
      v12 = a4[1];
      if (v12)
      {

        MEMORY[0x20BD2D02C](v12, 0xE0C400670D255);
      }
      v13 = v11;
      if (v13)
        goto LABEL_17;
      goto LABEL_20;
    }
LABEL_25:

    v7 = v18;
  }
LABEL_26:

}

void sub_20ABEDD84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t cva::Buffer<float>::texture(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v5;

  v3 = a3;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, a3, a1 + 56);
  v5 = 56;
  if (v3)
    v5 = 64;
  return *(_QWORD *)(a1 + v5);
}

void cva::Buffer<float>::allocTexture(uint64_t a1, id *a2, char a3, _QWORD *a4)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD *v17;
  int v18;
  int v19;
  size_t v20;
  id v21;
  void *v22;
  _QWORD *v23;
  id v24;
  CVMetalTextureRef image;

  if ((a3 & 1) != 0)
  {
    if ((*(_BYTE *)(a1 + 36) & 0xF) != 0)
      return;
    v6 = a4[1];
    if (v6)
    {
      v24 = *(id *)(v6 + 8);
      if (objc_msgSend(v24, "pixelFormat") != 125)
      {
        v7 = (void *)objc_msgSend(v24, "newTextureViewWithPixelFormat:", 125);
        v8 = a4[1];
        if (v8)
        {

          MEMORY[0x20BD2D02C](v8, 0xE0C400670D255);
        }
        v9 = v7;
        if (v9)
        {
          v10 = (_QWORD *)operator new();
          *v10 = 0;
          v10[1] = v9;
          v10[2] = 0;
        }
        else
        {
          v10 = 0;
        }

        a4[1] = v10;
LABEL_29:

        goto LABEL_30;
      }
      goto LABEL_30;
    }
    v18 = *(_DWORD *)(a1 + 16);
    v19 = *(_DWORD *)(a1 + 20);
    v20 = *(unsigned int *)(a1 + 24);
    image = 0;
    v21 = *a2;
    sub_20ABEE194(v21);
    CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x24BDBD240], (CVMetalTextureCacheRef)qword_2546165B0, *(CVImageBufferRef *)(a1 + 48), 0, MTLPixelFormatRGBA32Float, (v19 * v18 + 3) >> 2, v20, 0, &image);

    CVMetalTextureGetTexture(image);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(image);
    v16 = v22;
    if (v16)
    {
      v23 = (_QWORD *)operator new();
      *v23 = 0;
      v23[1] = v16;
      v23[2] = 0;
    }
    else
    {
      v23 = 0;
    }

    a4[1] = v23;
  }
  else
  {
    if (*a4)
    {
      v24 = *(id *)(*a4 + 8);
      if (objc_msgSend(v24, "pixelFormat") != 55)
      {
        v11 = (void *)objc_msgSend(v24, "newTextureViewWithPixelFormat:", 55);
        v12 = *a4;
        if (*a4)
        {

          MEMORY[0x20BD2D02C](v12, 0xE0C400670D255);
        }
        v9 = v11;
        if (v9)
        {
          v13 = (_QWORD *)operator new();
          *v13 = 0;
          v13[1] = v9;
          v13[2] = 0;
        }
        else
        {
          v13 = 0;
        }

        *a4 = v13;
        goto LABEL_29;
      }
LABEL_30:

      return;
    }
    image = 0;
    v14 = *a2;
    sub_20ABEE194(v14);
    CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x24BDBD240], (CVMetalTextureCacheRef)qword_2546165B0, *(CVImageBufferRef *)(a1 + 48), 0, MTLPixelFormatR32Float, (*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 16)), *(unsigned int *)(a1 + 24), 0, &image);

    CVMetalTextureGetTexture(image);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(image);
    v16 = v15;
    if (v16)
    {
      v17 = (_QWORD *)operator new();
      *v17 = 0;
      v17[1] = v16;
      v17[2] = 0;
    }
    else
    {
      v17 = 0;
    }

    *a4 = v17;
  }

}

void sub_20ABEE134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_20ABEE194(void *a1)
{
  id v1;
  unsigned __int8 v2;
  int v3;
  void *v4;

  v1 = a1;
  v2 = atomic_load((unsigned __int8 *)&qword_2546165B8);
  if ((v2 & 1) == 0)
  {
    v4 = v1;
    v3 = __cxa_guard_acquire(&qword_2546165B8);
    v1 = v4;
    if (v3)
    {
      sub_20ABEE23C(v4);
      __cxa_atexit((void (*)(void *))sub_20ABEE2BC, &qword_2546165A8, &dword_20AB80000);
      __cxa_guard_release(&qword_2546165B8);
      v1 = v4;
    }
  }

}

void sub_20ABEE21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  __cxa_guard_abort(&qword_2546165B8);

  _Unwind_Resume(a1);
}

void sub_20ABEE23C(void *a1)
{
  id v1;

  qword_2546165A8 = a1;
  qword_2546165B0 = 0;
  v1 = (id)qword_2546165A8;
  CVMetalTextureCacheCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, (id)qword_2546165A8, 0, (CVMetalTextureCacheRef *)&qword_2546165B0);

}

void sub_20ABEE29C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v10;
  uint64_t v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

id *sub_20ABEE2BC(id *a1)
{

  return a1;
}

uint64_t cva::Buffer<unsigned short>::texture(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v5;

  v3 = a3;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, a3, a1 + 56);
  v5 = 56;
  if (v3)
    v5 = 64;
  return *(_QWORD *)(a1 + v5);
}

void cva::Buffer<unsigned short>::allocTexture(uint64_t a1, id *a2, char a3, _QWORD *a4)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD *v17;
  int v18;
  int v19;
  size_t v20;
  id v21;
  void *v22;
  _QWORD *v23;
  id v24;
  CVMetalTextureRef image;

  if ((a3 & 1) != 0)
  {
    if ((*(_BYTE *)(a1 + 36) & 7) != 0)
      return;
    v6 = a4[1];
    if (v6)
    {
      v24 = *(id *)(v6 + 8);
      if (objc_msgSend(v24, "pixelFormat") != 113)
      {
        v7 = (void *)objc_msgSend(v24, "newTextureViewWithPixelFormat:", 113);
        v8 = a4[1];
        if (v8)
        {

          MEMORY[0x20BD2D02C](v8, 0xE0C400670D255);
        }
        v9 = v7;
        if (v9)
        {
          v10 = (_QWORD *)operator new();
          *v10 = 0;
          v10[1] = v9;
          v10[2] = 0;
        }
        else
        {
          v10 = 0;
        }

        a4[1] = v10;
LABEL_29:

        goto LABEL_30;
      }
      goto LABEL_30;
    }
    v18 = *(_DWORD *)(a1 + 16);
    v19 = *(_DWORD *)(a1 + 20);
    v20 = *(unsigned int *)(a1 + 24);
    image = 0;
    v21 = *a2;
    sub_20ABEE194(v21);
    CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x24BDBD240], (CVMetalTextureCacheRef)qword_2546165B0, *(CVImageBufferRef *)(a1 + 48), 0, MTLPixelFormatRGBA16Uint, (v19 * v18 + 3) >> 2, v20, 0, &image);

    CVMetalTextureGetTexture(image);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(image);
    v16 = v22;
    if (v16)
    {
      v23 = (_QWORD *)operator new();
      *v23 = 0;
      v23[1] = v16;
      v23[2] = 0;
    }
    else
    {
      v23 = 0;
    }

    a4[1] = v23;
  }
  else
  {
    if (*a4)
    {
      v24 = *(id *)(*a4 + 8);
      if (objc_msgSend(v24, "pixelFormat") != 23)
      {
        v11 = (void *)objc_msgSend(v24, "newTextureViewWithPixelFormat:", 23);
        v12 = *a4;
        if (*a4)
        {

          MEMORY[0x20BD2D02C](v12, 0xE0C400670D255);
        }
        v9 = v11;
        if (v9)
        {
          v13 = (_QWORD *)operator new();
          *v13 = 0;
          v13[1] = v9;
          v13[2] = 0;
        }
        else
        {
          v13 = 0;
        }

        *a4 = v13;
        goto LABEL_29;
      }
LABEL_30:

      return;
    }
    image = 0;
    v14 = *a2;
    sub_20ABEE194(v14);
    CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x24BDBD240], (CVMetalTextureCacheRef)qword_2546165B0, *(CVImageBufferRef *)(a1 + 48), 0, MTLPixelFormatR16Uint, (*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 16)), *(unsigned int *)(a1 + 24), 0, &image);

    CVMetalTextureGetTexture(image);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(image);
    v16 = v15;
    if (v16)
    {
      v17 = (_QWORD *)operator new();
      *v17 = 0;
      v17[1] = v16;
      v17[2] = 0;
    }
    else
    {
      v17 = 0;
    }

    *a4 = v17;
  }

}

void sub_20ABEE640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t cva::Buffer<unsigned char>::texture(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v5;

  v3 = a3;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, a3, a1 + 56);
  v5 = 56;
  if (v3)
    v5 = 64;
  return *(_QWORD *)(a1 + v5);
}

void cva::Buffer<unsigned char>::allocTexture(uint64_t a1, id *a2, char a3, _QWORD *a4)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD *v17;
  int v18;
  int v19;
  size_t v20;
  id v21;
  void *v22;
  _QWORD *v23;
  id v24;
  CVMetalTextureRef image;

  if ((a3 & 1) != 0)
  {
    if ((*(_BYTE *)(a1 + 36) & 3) != 0)
      return;
    v6 = a4[1];
    if (v6)
    {
      v24 = *(id *)(v6 + 8);
      if (objc_msgSend(v24, "pixelFormat") != 73)
      {
        v7 = (void *)objc_msgSend(v24, "newTextureViewWithPixelFormat:", 73);
        v8 = a4[1];
        if (v8)
        {

          MEMORY[0x20BD2D02C](v8, 0xE0C400670D255);
        }
        v9 = v7;
        if (v9)
        {
          v10 = (_QWORD *)operator new();
          *v10 = 0;
          v10[1] = v9;
          v10[2] = 0;
        }
        else
        {
          v10 = 0;
        }

        a4[1] = v10;
LABEL_29:

        goto LABEL_30;
      }
      goto LABEL_30;
    }
    v18 = *(_DWORD *)(a1 + 16);
    v19 = *(_DWORD *)(a1 + 20);
    v20 = *(unsigned int *)(a1 + 24);
    image = 0;
    v21 = *a2;
    sub_20ABEE194(v21);
    CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x24BDBD240], (CVMetalTextureCacheRef)qword_2546165B0, *(CVImageBufferRef *)(a1 + 48), 0, MTLPixelFormatRGBA8Uint, (v19 * v18 + 3) >> 2, v20, 0, &image);

    CVMetalTextureGetTexture(image);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(image);
    v16 = v22;
    if (v16)
    {
      v23 = (_QWORD *)operator new();
      *v23 = 0;
      v23[1] = v16;
      v23[2] = 0;
    }
    else
    {
      v23 = 0;
    }

    a4[1] = v23;
  }
  else
  {
    if (*a4)
    {
      v24 = *(id *)(*a4 + 8);
      if (objc_msgSend(v24, "pixelFormat") != 13)
      {
        v11 = (void *)objc_msgSend(v24, "newTextureViewWithPixelFormat:", 13);
        v12 = *a4;
        if (*a4)
        {

          MEMORY[0x20BD2D02C](v12, 0xE0C400670D255);
        }
        v9 = v11;
        if (v9)
        {
          v13 = (_QWORD *)operator new();
          *v13 = 0;
          v13[1] = v9;
          v13[2] = 0;
        }
        else
        {
          v13 = 0;
        }

        *a4 = v13;
        goto LABEL_29;
      }
LABEL_30:

      return;
    }
    image = 0;
    v14 = *a2;
    sub_20ABEE194(v14);
    CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x24BDBD240], (CVMetalTextureCacheRef)qword_2546165B0, *(CVImageBufferRef *)(a1 + 48), 0, MTLPixelFormatR8Uint, (*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 16)), *(unsigned int *)(a1 + 24), 0, &image);

    CVMetalTextureGetTexture(image);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(image);
    v16 = v15;
    if (v16)
    {
      v17 = (_QWORD *)operator new();
      *v17 = 0;
      v17[1] = v16;
      v17[2] = 0;
    }
    else
    {
      v17 = 0;
    }

    *a4 = v17;
  }

}

void sub_20ABEE9FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t cva::Buffer<unsigned int>::texture(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v5;

  v3 = a3;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, a3, a1 + 56);
  v5 = 56;
  if (v3)
    v5 = 64;
  return *(_QWORD *)(a1 + v5);
}

void cva::Buffer<unsigned int>::allocTexture(uint64_t a1, id *a2, char a3, _QWORD *a4)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD *v17;
  int v18;
  int v19;
  size_t v20;
  id v21;
  void *v22;
  _QWORD *v23;
  id v24;
  CVMetalTextureRef image;

  if ((a3 & 1) != 0)
  {
    if ((*(_BYTE *)(a1 + 36) & 0xF) != 0)
      return;
    v6 = a4[1];
    if (v6)
    {
      v24 = *(id *)(v6 + 8);
      if (objc_msgSend(v24, "pixelFormat") != 123)
      {
        v7 = (void *)objc_msgSend(v24, "newTextureViewWithPixelFormat:", 123);
        v8 = a4[1];
        if (v8)
        {

          MEMORY[0x20BD2D02C](v8, 0xE0C400670D255);
        }
        v9 = v7;
        if (v9)
        {
          v10 = (_QWORD *)operator new();
          *v10 = 0;
          v10[1] = v9;
          v10[2] = 0;
        }
        else
        {
          v10 = 0;
        }

        a4[1] = v10;
LABEL_29:

        goto LABEL_30;
      }
      goto LABEL_30;
    }
    v18 = *(_DWORD *)(a1 + 16);
    v19 = *(_DWORD *)(a1 + 20);
    v20 = *(unsigned int *)(a1 + 24);
    image = 0;
    v21 = *a2;
    sub_20ABEE194(v21);
    CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x24BDBD240], (CVMetalTextureCacheRef)qword_2546165B0, *(CVImageBufferRef *)(a1 + 48), 0, MTLPixelFormatRGBA32Uint, (v19 * v18 + 3) >> 2, v20, 0, &image);

    CVMetalTextureGetTexture(image);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(image);
    v16 = v22;
    if (v16)
    {
      v23 = (_QWORD *)operator new();
      *v23 = 0;
      v23[1] = v16;
      v23[2] = 0;
    }
    else
    {
      v23 = 0;
    }

    a4[1] = v23;
  }
  else
  {
    if (*a4)
    {
      v24 = *(id *)(*a4 + 8);
      if (objc_msgSend(v24, "pixelFormat") != 53)
      {
        v11 = (void *)objc_msgSend(v24, "newTextureViewWithPixelFormat:", 53);
        v12 = *a4;
        if (*a4)
        {

          MEMORY[0x20BD2D02C](v12, 0xE0C400670D255);
        }
        v9 = v11;
        if (v9)
        {
          v13 = (_QWORD *)operator new();
          *v13 = 0;
          v13[1] = v9;
          v13[2] = 0;
        }
        else
        {
          v13 = 0;
        }

        *a4 = v13;
        goto LABEL_29;
      }
LABEL_30:

      return;
    }
    image = 0;
    v14 = *a2;
    sub_20ABEE194(v14);
    CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x24BDBD240], (CVMetalTextureCacheRef)qword_2546165B0, *(CVImageBufferRef *)(a1 + 48), 0, MTLPixelFormatR32Uint, (*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 16)), *(unsigned int *)(a1 + 24), 0, &image);

    CVMetalTextureGetTexture(image);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(image);
    v16 = v15;
    if (v16)
    {
      v17 = (_QWORD *)operator new();
      *v17 = 0;
      v17[1] = v16;
      v17[2] = 0;
    }
    else
    {
      v17 = 0;
    }

    *a4 = v17;
  }

}

void sub_20ABEEDB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t cva::Buffer<cva::half>::texture(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v5;

  v3 = a3;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, a3, a1 + 56);
  v5 = 56;
  if (v3)
    v5 = 64;
  return *(_QWORD *)(a1 + v5);
}

void cva::Buffer<cva::half>::allocTexture(uint64_t a1, id *a2, char a3, _QWORD *a4)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD *v17;
  int v18;
  int v19;
  size_t v20;
  id v21;
  void *v22;
  _QWORD *v23;
  id v24;
  CVMetalTextureRef image;

  if ((a3 & 1) != 0)
  {
    if ((*(_BYTE *)(a1 + 36) & 7) != 0)
      return;
    v6 = a4[1];
    if (v6)
    {
      v24 = *(id *)(v6 + 8);
      if (objc_msgSend(v24, "pixelFormat") != 115)
      {
        v7 = (void *)objc_msgSend(v24, "newTextureViewWithPixelFormat:", 115);
        v8 = a4[1];
        if (v8)
        {

          MEMORY[0x20BD2D02C](v8, 0xE0C400670D255);
        }
        v9 = v7;
        if (v9)
        {
          v10 = (_QWORD *)operator new();
          *v10 = 0;
          v10[1] = v9;
          v10[2] = 0;
        }
        else
        {
          v10 = 0;
        }

        a4[1] = v10;
LABEL_29:

        goto LABEL_30;
      }
      goto LABEL_30;
    }
    v18 = *(_DWORD *)(a1 + 16);
    v19 = *(_DWORD *)(a1 + 20);
    v20 = *(unsigned int *)(a1 + 24);
    image = 0;
    v21 = *a2;
    sub_20ABEE194(v21);
    CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x24BDBD240], (CVMetalTextureCacheRef)qword_2546165B0, *(CVImageBufferRef *)(a1 + 48), 0, MTLPixelFormatRGBA16Float, (v19 * v18 + 3) >> 2, v20, 0, &image);

    CVMetalTextureGetTexture(image);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(image);
    v16 = v22;
    if (v16)
    {
      v23 = (_QWORD *)operator new();
      *v23 = 0;
      v23[1] = v16;
      v23[2] = 0;
    }
    else
    {
      v23 = 0;
    }

    a4[1] = v23;
  }
  else
  {
    if (*a4)
    {
      v24 = *(id *)(*a4 + 8);
      if (objc_msgSend(v24, "pixelFormat") != 25)
      {
        v11 = (void *)objc_msgSend(v24, "newTextureViewWithPixelFormat:", 25);
        v12 = *a4;
        if (*a4)
        {

          MEMORY[0x20BD2D02C](v12, 0xE0C400670D255);
        }
        v9 = v11;
        if (v9)
        {
          v13 = (_QWORD *)operator new();
          *v13 = 0;
          v13[1] = v9;
          v13[2] = 0;
        }
        else
        {
          v13 = 0;
        }

        *a4 = v13;
        goto LABEL_29;
      }
LABEL_30:

      return;
    }
    image = 0;
    v14 = *a2;
    sub_20ABEE194(v14);
    CVMetalTextureCacheCreateTextureFromImage((CFAllocatorRef)*MEMORY[0x24BDBD240], (CVMetalTextureCacheRef)qword_2546165B0, *(CVImageBufferRef *)(a1 + 48), 0, MTLPixelFormatR16Float, (*(_DWORD *)(a1 + 20) * *(_DWORD *)(a1 + 16)), *(unsigned int *)(a1 + 24), 0, &image);

    CVMetalTextureGetTexture(image);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(image);
    v16 = v15;
    if (v16)
    {
      v17 = (_QWORD *)operator new();
      *v17 = 0;
      v17[1] = v16;
      v17[2] = 0;
    }
    else
    {
      v17 = 0;
    }

    *a4 = v17;
  }

}

void sub_20ABEF174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

double cva::BufferTiled<float>::BufferTiled(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F440;
  return result;
}

{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F440;
  return result;
}

double cva::BufferTiled<float>::BufferTiled(uint64_t a1, uint64_t *a2)
{
  double result;
  int v3;
  uint64_t v4;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F440;
  v3 = *((_DWORD *)a2 + 2);
  v4 = *a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v4;
  *(_DWORD *)(a1 + 24) = v3;
  return result;
}

{
  double result;
  int v3;
  uint64_t v4;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F440;
  v3 = *((_DWORD *)a2 + 2);
  v4 = *a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v4;
  *(_DWORD *)(a1 + 24) = v3;
  return result;
}

uint64_t cva::BufferTiled<float>::BufferTiled(uint64_t result, int a2, int a3, int a4)
{
  *(_QWORD *)(result + 36) = 0;
  *(_QWORD *)(result + 28) = 0;
  *(_DWORD *)(result + 44) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)result = &unk_24C37F440;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = a3;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

{
  *(_QWORD *)(result + 36) = 0;
  *(_QWORD *)(result + 28) = 0;
  *(_DWORD *)(result + 44) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)result = &unk_24C37F440;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = a3;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

double cva::BufferTiled<unsigned short>::BufferTiled(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F4D0;
  return result;
}

{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F4D0;
  return result;
}

double cva::BufferTiled<unsigned short>::BufferTiled(uint64_t a1, uint64_t *a2)
{
  double result;
  int v3;
  uint64_t v4;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F4D0;
  v3 = *((_DWORD *)a2 + 2);
  v4 = *a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v4;
  *(_DWORD *)(a1 + 24) = v3;
  return result;
}

{
  double result;
  int v3;
  uint64_t v4;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F4D0;
  v3 = *((_DWORD *)a2 + 2);
  v4 = *a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v4;
  *(_DWORD *)(a1 + 24) = v3;
  return result;
}

uint64_t cva::BufferTiled<unsigned short>::BufferTiled(uint64_t result, int a2, int a3, int a4)
{
  *(_QWORD *)(result + 36) = 0;
  *(_QWORD *)(result + 28) = 0;
  *(_DWORD *)(result + 44) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)result = &unk_24C37F4D0;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = a3;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

{
  *(_QWORD *)(result + 36) = 0;
  *(_QWORD *)(result + 28) = 0;
  *(_DWORD *)(result + 44) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)result = &unk_24C37F4D0;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = a3;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

double cva::BufferTiled<unsigned char>::BufferTiled(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F470;
  return result;
}

{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F470;
  return result;
}

double cva::BufferTiled<unsigned char>::BufferTiled(uint64_t a1, uint64_t *a2)
{
  double result;
  int v3;
  uint64_t v4;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F470;
  v3 = *((_DWORD *)a2 + 2);
  v4 = *a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v4;
  *(_DWORD *)(a1 + 24) = v3;
  return result;
}

{
  double result;
  int v3;
  uint64_t v4;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F470;
  v3 = *((_DWORD *)a2 + 2);
  v4 = *a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v4;
  *(_DWORD *)(a1 + 24) = v3;
  return result;
}

uint64_t cva::BufferTiled<unsigned char>::BufferTiled(uint64_t result, int a2, int a3, int a4)
{
  *(_QWORD *)(result + 36) = 0;
  *(_QWORD *)(result + 28) = 0;
  *(_DWORD *)(result + 44) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)result = &unk_24C37F470;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = a3;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

{
  *(_QWORD *)(result + 36) = 0;
  *(_QWORD *)(result + 28) = 0;
  *(_DWORD *)(result + 44) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)result = &unk_24C37F470;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = a3;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

double cva::BufferTiled<unsigned int>::BufferTiled(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F4A0;
  return result;
}

{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F4A0;
  return result;
}

double cva::BufferTiled<unsigned int>::BufferTiled(uint64_t a1, uint64_t *a2)
{
  double result;
  int v3;
  uint64_t v4;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F4A0;
  v3 = *((_DWORD *)a2 + 2);
  v4 = *a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v4;
  *(_DWORD *)(a1 + 24) = v3;
  return result;
}

{
  double result;
  int v3;
  uint64_t v4;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F4A0;
  v3 = *((_DWORD *)a2 + 2);
  v4 = *a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v4;
  *(_DWORD *)(a1 + 24) = v3;
  return result;
}

uint64_t cva::BufferTiled<unsigned int>::BufferTiled(uint64_t result, int a2, int a3, int a4)
{
  *(_QWORD *)(result + 36) = 0;
  *(_QWORD *)(result + 28) = 0;
  *(_DWORD *)(result + 44) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)result = &unk_24C37F4A0;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = a3;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

{
  *(_QWORD *)(result + 36) = 0;
  *(_QWORD *)(result + 28) = 0;
  *(_DWORD *)(result + 44) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)result = &unk_24C37F4A0;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = a3;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

double cva::BufferTiled<cva::half>::BufferTiled(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F410;
  return result;
}

{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F410;
  return result;
}

double cva::BufferTiled<cva::half>::BufferTiled(uint64_t a1, uint64_t *a2)
{
  double result;
  int v3;
  uint64_t v4;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F410;
  v3 = *((_DWORD *)a2 + 2);
  v4 = *a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v4;
  *(_DWORD *)(a1 + 24) = v3;
  return result;
}

{
  double result;
  int v3;
  uint64_t v4;

  result = 0.0;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)a1 = &unk_24C37F410;
  v3 = *((_DWORD *)a2 + 2);
  v4 = *a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = v4;
  *(_DWORD *)(a1 + 24) = v3;
  return result;
}

uint64_t cva::BufferTiled<cva::half>::BufferTiled(uint64_t result, int a2, int a3, int a4)
{
  *(_QWORD *)(result + 36) = 0;
  *(_QWORD *)(result + 28) = 0;
  *(_DWORD *)(result + 44) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)result = &unk_24C37F410;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = a3;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

{
  *(_QWORD *)(result + 36) = 0;
  *(_QWORD *)(result + 28) = 0;
  *(_DWORD *)(result + 44) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)result = &unk_24C37F410;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = a2;
  *(_DWORD *)(result + 20) = a3;
  *(_DWORD *)(result + 24) = a4;
  return result;
}

_QWORD *cva::adp::io::PListSerializer::PListSerializer(_QWORD *this)
{
  *this = 0;
  this[1] = 0;
  return this;
}

{
  *this = 0;
  this[1] = 0;
  return this;
}

void cva::adp::io::PListSerializer::~PListSerializer(cva::adp::io::PListSerializer *this)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
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
    v5 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (v5)
    {
      v6 = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
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
    v5 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (v5)
    {
      v6 = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

void cva::adp::io::PListSerializer::clear(cva::adp::io::PListSerializer *this)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void cva::adp::io::PListSerializer::create(cva::adp::io::PListSerializer *this)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;

  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
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
  v5 = operator new();
  *(_QWORD *)v5 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  *(_BYTE *)(v5 + 8) = 1;
  v6 = (_QWORD *)operator new();
  *v6 = &off_24C3804D0;
  v6[1] = 0;
  v6[2] = 0;
  v6[3] = v5;
  v7 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  *(_QWORD *)this = v5;
  *((_QWORD *)this + 1) = v6;
  if (v7)
  {
    v8 = (unint64_t *)&v7->__shared_owners_;
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

void sub_20ABEFC58(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD2D02CLL);
}

uint64_t sub_20ABEFC7C(uint64_t result)
{
  CFTypeRef *v1;

  v1 = *(CFTypeRef **)(result + 24);
  if (v1)
  {
    if (*v1)
      CFRelease(*v1);
    JUMPOUT(0x20BD2D02CLL);
  }
  return result;
}

BOOL cva::adp::io::PListSerializer::isValid(cva::adp::io::PListSerializer *this)
{
  return *(_QWORD *)this != 0;
}

BOOL cva::adp::io::PListSerializer::read(_QWORD *a1, uint64_t *a2)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  __int128 v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  __int128 v15;

  v4 = (std::__shared_weak_count *)a1[1];
  *a1 = 0;
  a1[1] = 0;
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
  cva::DictionaryHandler::readPlistFile(a2, &v15);
  v7 = v15;
  v15 = 0uLL;
  v8 = (std::__shared_weak_count *)a1[1];
  *(_OWORD *)a1 = v7;
  if (!v8)
    goto LABEL_10;
  v9 = (unint64_t *)&v8->__shared_owners_;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
    if (!*((_QWORD *)&v15 + 1))
      return *a1 != 0;
  }
  else
  {
LABEL_10:
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
    if (!*((_QWORD *)&v15 + 1))
      return *a1 != 0;
  }
  v12 = (unint64_t *)&v11->__shared_owners_;
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13 - 1, v12));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
  return *a1 != 0;
}

id *cva::adp::io::PListSerializer::write(id **a1, uint64_t *a2)
{
  id *result;

  result = *a1;
  if (result)
    return (id *)cva::DictionaryHandler::writePlistFile(result, a2);
  return result;
}

BOOL cva::adp::io::processFullPath(std::string *__str, std::string *this)
{
  unsigned int v3;
  std::string *v4;
  std::string::size_type size;
  std::string *v7;
  std::string *v8;
  std::string *i;
  std::string::size_type v10;
  std::string::size_type v11;
  std::string *v12;
  std::string *v13;
  std::string::size_type v14;
  int v15;
  std::string::size_type v16;
  size_t v17;
  __int128 *p_dst;
  uint64_t v19;
  uint64_t v20;
  __int128 __dst;
  unint64_t v22;

  v3 = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
  {
    size = __str->__r_.__value_.__l.__size_;
    if (size < 2)
    {
      if (!size)
        return 0;
      v4 = (std::string *)__str->__r_.__value_.__r.__words[0];
LABEL_8:
      if (v4->__r_.__value_.__s.__data_[0] == 47)
      {
        std::string::operator=(this, __str);
        return 1;
      }
      return 0;
    }
    v7 = (std::string *)__str->__r_.__value_.__r.__words[0];
  }
  else
  {
    if (v3 < 2)
    {
      v4 = __str;
      if (!*((_BYTE *)&__str->__r_.__value_.__s + 23))
        return 0;
      goto LABEL_8;
    }
    v7 = __str;
    size = HIBYTE(__str->__r_.__value_.__r.__words[2]);
  }
  v8 = (std::string *)((char *)v7 + size);
  for (i = v7; i->__r_.__value_.__s.__data_[0] != 47; i = (std::string *)((char *)i + 1))
  {
    if (!--size)
      return 0;
  }
  if (i == v8 || (char *)i - (char *)v7 == -1)
    return 0;
  v10 = i == v7;
  v12 = (std::string *)__str->__r_.__value_.__r.__words[0];
  v11 = __str->__r_.__value_.__l.__size_;
  v13 = (v3 & 0x80u) == 0 ? __str : (std::string *)__str->__r_.__value_.__r.__words[0];
  v14 = (v3 & 0x80u) == 0 ? HIBYTE(__str->__r_.__value_.__r.__words[2]) : __str->__r_.__value_.__l.__size_;
  do
  {
    if (!v14)
      return 0;
    v15 = v13->__r_.__value_.__s.__data_[--v14];
  }
  while (v15 != 47);
  v16 = v14;
  if (v14 + 1 < 2)
    return 0;
  if ((v3 & 0x80) != 0)
  {
    if (v11 < v10)
      goto LABEL_46;
  }
  else
  {
    v11 = HIBYTE(__str->__r_.__value_.__r.__words[2]);
    v12 = __str;
    if (v10 > v11)
      goto LABEL_46;
  }
  if (v11 - v10 >= v14)
    v17 = v14;
  else
    v17 = v11 - v10;
  if (v17 >= 0x7FFFFFFFFFFFFFF8)
LABEL_46:
    abort();
  if (v17 >= 0x17)
  {
    v19 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v19 = v17 | 7;
    v20 = v19 + 1;
    p_dst = (__int128 *)operator new(v19 + 1);
    *((_QWORD *)&__dst + 1) = v17;
    v22 = v20 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
  }
  else
  {
    HIBYTE(v22) = v17;
    p_dst = &__dst;
    if (!v17)
      goto LABEL_43;
  }
  memmove(p_dst, (char *)v12 + v10, v17);
LABEL_43:
  *((_BYTE *)p_dst + v17) = 0;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    operator delete(this->__r_.__value_.__l.__data_);
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = __dst;
  this->__r_.__value_.__r.__words[2] = v22;
  return v10 != v16;
}

BOOL cva::adp::io::PListSerializer::decomposePath(int a1, std::string *__str, uint64_t a3)
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  std::ios_base *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v19[2];
  uint64_t v20;
  _QWORD v21[8];
  void *__p[2];
  __int128 v23;
  int v24;
  uint64_t v25[19];
  __int128 v26;
  uint64_t v27;
  std::string v28;

  memset(&v28, 0, sizeof(v28));
  v4 = cva::adp::io::processFullPath(__str, &v28);
  if (v4)
  {
    v26 = 0uLL;
    v27 = 0;
    v5 = MEMORY[0x24BEDB858];
    v6 = MEMORY[0x24BEDB858] + 104;
    v25[0] = MEMORY[0x24BEDB858] + 104;
    v7 = MEMORY[0x24BEDB858] + 64;
    v8 = (_QWORD *)MEMORY[0x24BEDB7F0];
    v9 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
    v10 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
    v20 = MEMORY[0x24BEDB858] + 64;
    v19[0] = v9;
    *(_QWORD *)((char *)v19 + *(_QWORD *)(v9 - 24)) = v10;
    v19[1] = 0;
    v11 = (std::ios_base *)((char *)v19 + *(_QWORD *)(v19[0] - 24));
    std::ios_base::init(v11, v21);
    v11[1].__vftable = 0;
    v11[1].__fmtflags_ = -1;
    v12 = v8[5];
    v20 = v8[4];
    *(_QWORD *)((char *)&v21[-1] + *(_QWORD *)(v20 - 24)) = v12;
    v19[0] = v8[1];
    *(_QWORD *)((char *)v19 + *(_QWORD *)(v19[0] - 24)) = v8[6];
    v25[0] = v6;
    v19[0] = v5 + 24;
    v20 = v7;
    std::streambuf::basic_streambuf();
    v13 = MEMORY[0x24BEDB848];
    v21[0] = MEMORY[0x24BEDB848] + 16;
    *(_OWORD *)__p = 0u;
    v23 = 0u;
    v24 = 24;
    std::stringbuf::str();
    while (1)
    {
      sub_20AB96AD8(v19, (uint64_t)&v26, 0x2Fu);
      if ((*((_BYTE *)&v21[1] + *(_QWORD *)(v19[0] - 24)) & 5) != 0)
        break;
      v14 = HIBYTE(v27);
      if (v27 < 0)
        v14 = *((_QWORD *)&v26 + 1);
      if (v14)
      {
        v15 = *(_QWORD *)(a3 + 8);
        if (v15 >= *(_QWORD *)(a3 + 16))
        {
          *(_QWORD *)(a3 + 8) = sub_20ABDB5B4(a3, (uint64_t)&v26);
        }
        else
        {
          if (SHIBYTE(v27) < 0)
          {
            sub_20AB88C14(*(_BYTE **)(a3 + 8), (void *)v26, *((unint64_t *)&v26 + 1));
          }
          else
          {
            v16 = v26;
            *(_QWORD *)(v15 + 16) = v27;
            *(_OWORD *)v15 = v16;
          }
          *(_QWORD *)(a3 + 8) = v15 + 24;
        }
      }
    }
    v19[0] = *v8;
    v17 = v8[9];
    *(_QWORD *)((char *)v19 + *(_QWORD *)(v19[0] - 24)) = v8[8];
    v20 = v17;
    v21[0] = v13 + 16;
    if (SBYTE7(v23) < 0)
      operator delete(__p[0]);
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x20BD2D008](v25);
    if (SHIBYTE(v27) < 0)
    {
      operator delete((void *)v26);
      if ((SHIBYTE(v28.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        return v4;
      goto LABEL_17;
    }
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
LABEL_17:
    operator delete(v28.__r_.__value_.__l.__data_);
  return v4;
}

void cva::adp::io::PListSerializer::createPath(cva::adp::io::PListSerializer *this@<X0>, std::string *__str@<X1>, _QWORD *a3@<X8>)
{
  void **v6;
  void **i;
  void *__p;
  void **v9;
  uint64_t v10;

  if (!*(_QWORD *)this)
    cva::adp::io::PListSerializer::create(this);
  __p = 0;
  v9 = 0;
  v10 = 0;
  if (cva::adp::io::PListSerializer::decomposePath((int)this, __str, (uint64_t)&__p))
  {
    cva::adp::io::PListSerializer::createPath((uint64_t *)&__p, (uint64_t *)this, a3);
    v6 = (void **)__p;
    if (!__p)
      return;
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    v6 = (void **)__p;
    if (!__p)
      return;
  }
  for (i = v9; i != v6; i -= 3)
  {
    if (*((char *)i - 1) < 0)
      operator delete(*(i - 3));
  }
  operator delete(v6);
}

void cva::adp::io::PListSerializer::createPath(uint64_t *a1@<X1>, uint64_t *a2@<X2>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFAllocator *v9;
  const __CFAllocator *v10;
  const CFDictionaryValueCallBacks *v11;
  const char *v12;
  CFStringRef v13;
  void *v14;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v16;
  const char *v17;
  CFStringRef v18;
  int v19;
  const char *v20;
  CFStringRef v21;
  const void *v22;
  char v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  CFTypeRef cf;
  char v34;
  uint64_t v35;
  std::__shared_weak_count *v36;

  v3 = *a2;
  v4 = (std::__shared_weak_count *)a2[1];
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v7 = *a1;
  v8 = a1[1];
  if (*a1 != v8)
  {
    v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
    v11 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
    while (1)
    {
      if (*(char *)(v7 + 23) >= 0)
        v12 = (const char *)v7;
      else
        v12 = *(const char **)v7;
      v13 = CFStringCreateWithCStringNoCopy(v9, v12, 0x8000100u, v10);
      objc_msgSend(*(id *)v3, "valueForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      CFRelease(v13);
      if (!v14)
      {
        Mutable = CFDictionaryCreateMutable(v9, 0, MEMORY[0x24BDBD2A8], v11);
        v16 = Mutable;
        if (Mutable)
          CFRetain(Mutable);
        if (*(char *)(v7 + 23) >= 0)
          v17 = (const char *)v7;
        else
          v17 = *(const char **)v7;
        v18 = CFStringCreateWithCStringNoCopy(v9, v17, 0x8000100u, v10);
        v19 = *(unsigned __int8 *)(v3 + 8);
        if (*(_BYTE *)(v3 + 8))
          objc_msgSend(*(id *)v3, "setValue:forKey:", v16, v18);
        CFRelease(v18);
        if (v16)
        {
          CFRelease(v16);
          CFRelease(v16);
        }
        if (!v19)
        {
          *a3 = 0;
          a3[1] = 0;
          if (v4)
          {
            v30 = (unint64_t *)&v4->__shared_owners_;
            do
              v31 = __ldaxr(v30);
            while (__stlxr(v31 - 1, v30));
            if (!v31)
            {
              ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
              std::__shared_weak_count::__release_weak(v4);
            }
          }
          return;
        }
      }
      if (*(char *)(v7 + 23) >= 0)
        v20 = (const char *)v7;
      else
        v20 = *(const char **)v7;
      v21 = CFStringCreateWithCStringNoCopy(v9, v20, 0x8000100u, v10);
      v22 = (const void *)objc_msgSend(*(id *)v3, "objectForKey:", v21);
      v23 = *(_BYTE *)(v3 + 8);
      cf = v22;
      v34 = v23;
      if (v22)
        CFRetain(v22);
      else
        v34 = 0;
      CFRelease(v21);
      cva::ItemHandler::getDictionary((uint64_t)&cf, &v35);
      v3 = v35;
      v24 = v36;
      v35 = 0;
      v36 = 0;
      if (!v4)
        goto LABEL_31;
      v25 = (unint64_t *)&v4->__shared_owners_;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
        v27 = v36;
        if (v36)
        {
LABEL_32:
          v28 = (unint64_t *)&v27->__shared_owners_;
          do
            v29 = __ldaxr(v28);
          while (__stlxr(v29 - 1, v28));
          if (!v29)
          {
            ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
            std::__shared_weak_count::__release_weak(v27);
          }
        }
      }
      else
      {
LABEL_31:
        v27 = v36;
        if (v36)
          goto LABEL_32;
      }
      if (cf)
        CFRelease(cf);
      v7 += 24;
      v4 = v24;
      if (v7 == v8)
        goto LABEL_40;
    }
  }
  v24 = v4;
LABEL_40:
  *a3 = v3;
  a3[1] = v24;
}

void sub_20ABF05C0(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t cva::adp::io::PListSerializer::hasPath(std::string::size_type *a1, std::string *a2)
{
  _BOOL8 v3;
  uint64_t hasPath;
  void **v5;
  void **i;
  void *__p;
  void **v9;
  uint64_t v10;

  if (!*a1)
    return 0;
  __p = 0;
  v9 = 0;
  v10 = 0;
  v3 = cva::adp::io::PListSerializer::decomposePath((int)a1, a2, (uint64_t)&__p);
  if (v3)
  {
    hasPath = cva::adp::io::PListSerializer::hasPath(v3, (uint64_t *)&__p, a1);
    v5 = (void **)__p;
    if (!__p)
      return hasPath;
  }
  else
  {
    hasPath = 0;
    v5 = (void **)__p;
    if (!__p)
      return hasPath;
  }
  for (i = v9; i != v5; i -= 3)
  {
    if (*((char *)i - 1) < 0)
      operator delete(*(i - 3));
  }
  operator delete(v5);
  return hasPath;
}

uint64_t cva::adp::io::PListSerializer::hasPath(uint64_t a1, uint64_t *a2, std::string::size_type *a3)
{
  std::__shared_weak_count *v4;
  std::string::size_type v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFAllocator *v10;
  const __CFAllocator *v11;
  const char *v12;
  CFStringRef v13;
  void *v14;
  const char *v15;
  CFStringRef v16;
  const void *v17;
  char v18;
  std::string::size_type size;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const std::string::value_type *p_cf;
  std::string::size_type v29;
  unint64_t *v30;
  unint64_t v31;
  CFTypeRef cf;
  std::string::size_type v34;
  unsigned __int8 v35;
  std::string v36;

  v5 = *a3;
  v4 = (std::__shared_weak_count *)a3[1];
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v8 = *a2;
  v9 = a2[1];
  if (*a2 == v9)
  {
    v25 = 1;
    if (v4)
      goto LABEL_47;
    return v25;
  }
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
  while (1)
  {
    v12 = *(char *)(v8 + 23) >= 0 ? (const char *)v8 : *(const char **)v8;
    v13 = CFStringCreateWithCStringNoCopy(v10, v12, 0x8000100u, v11);
    objc_msgSend(*(id *)v5, "valueForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    CFRelease(v13);
    if (!v14)
      break;
    if (*(char *)(v8 + 23) >= 0)
      v15 = (const char *)v8;
    else
      v15 = *(const char **)v8;
    v16 = CFStringCreateWithCStringNoCopy(v10, v15, 0x8000100u, v11);
    v17 = (const void *)objc_msgSend(*(id *)v5, "objectForKey:", v16);
    v18 = *(_BYTE *)(v5 + 8);
    cf = v17;
    LOBYTE(v34) = v18;
    if (v17)
      CFRetain(v17);
    else
      LOBYTE(v34) = 0;
    CFRelease(v16);
    cva::ItemHandler::getDictionary((uint64_t)&cf, &v36);
    size = v36.__r_.__value_.__l.__size_;
    v5 = v36.__r_.__value_.__r.__words[0];
    *(_OWORD *)&v36.__r_.__value_.__l.__data_ = 0uLL;
    if (!v4)
      goto LABEL_21;
    v20 = (unint64_t *)&v4->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      v22 = (std::__shared_weak_count *)v36.__r_.__value_.__l.__size_;
      if (v36.__r_.__value_.__l.__size_)
      {
LABEL_22:
        v23 = (unint64_t *)&v22->__shared_owners_;
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
    }
    else
    {
LABEL_21:
      v22 = (std::__shared_weak_count *)v36.__r_.__value_.__l.__size_;
      if (v36.__r_.__value_.__l.__size_)
        goto LABEL_22;
    }
    if (cf)
      CFRelease(cf);
    v8 += 24;
    v4 = (std::__shared_weak_count *)size;
    if (v8 == v9)
    {
      v25 = 1;
      v4 = (std::__shared_weak_count *)size;
      if (size)
        goto LABEL_47;
      return v25;
    }
  }
  memset(&v36, 0, sizeof(v36));
  v26 = *a2;
  v27 = a2[1];
  if (*a2 != v27)
  {
    do
    {
      std::operator+<char>();
      if ((v35 & 0x80u) == 0)
        p_cf = (const std::string::value_type *)&cf;
      else
        p_cf = (const std::string::value_type *)cf;
      if ((v35 & 0x80u) == 0)
        v29 = v35;
      else
        v29 = v34;
      std::string::append(&v36, p_cf, v29);
      if ((char)v35 < 0)
        operator delete((void *)cf);
      v26 += 24;
    }
    while (v26 != v27);
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v36.__r_.__value_.__l.__data_);
  }
  v25 = 0;
  if (!v4)
    return v25;
LABEL_47:
  v30 = (unint64_t *)&v4->__shared_owners_;
  do
    v31 = __ldaxr(v30);
  while (__stlxr(v31 - 1, v30));
  if (!v31)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  return v25;
}

void sub_20ABF093C(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

void cva::adp::io::PListSerializer::getPath(std::string::size_type *a1@<X0>, std::string *a2@<X1>, std::string::size_type *a3@<X8>)
{
  void **v5;
  void **i;
  void *__p;
  void **v8;
  uint64_t v9;

  if (!*a1)
  {
    *a3 = 0;
    a3[1] = 0;
    return;
  }
  __p = 0;
  v8 = 0;
  v9 = 0;
  if (cva::adp::io::PListSerializer::decomposePath((int)a1, a2, (uint64_t)&__p))
  {
    cva::adp::io::PListSerializer::getPath((uint64_t *)&__p, a1, a3);
    v5 = (void **)__p;
    if (!__p)
      return;
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    v5 = (void **)__p;
    if (!__p)
      return;
  }
  for (i = v8; i != v5; i -= 3)
  {
    if (*((char *)i - 1) < 0)
      operator delete(*(i - 3));
  }
  operator delete(v5);
}

{
  void **v5;
  void **i;
  void *__p;
  void **v8;
  uint64_t v9;

  if (!*a1)
  {
    *a3 = 0;
    a3[1] = 0;
    return;
  }
  __p = 0;
  v8 = 0;
  v9 = 0;
  if (cva::adp::io::PListSerializer::decomposePath((int)a1, a2, (uint64_t)&__p))
  {
    cva::adp::io::PListSerializer::getPath((uint64_t *)&__p, a1, a3);
    v5 = (void **)__p;
    if (!__p)
      return;
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    v5 = (void **)__p;
    if (!__p)
      return;
  }
  for (i = v8; i != v5; i -= 3)
  {
    if (*((char *)i - 1) < 0)
      operator delete(*(i - 3));
  }
  operator delete(v5);
}

void cva::adp::io::PListSerializer::getPath(uint64_t *a1@<X1>, std::string::size_type *a2@<X2>, std::string::size_type *a3@<X8>)
{
  std::__shared_weak_count *v5;
  std::string::size_type v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFAllocator *v11;
  const __CFAllocator *v12;
  const char *v13;
  CFStringRef v14;
  void *v15;
  const char *v16;
  CFStringRef v17;
  const void *v18;
  char v19;
  std::string::size_type size;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const std::string::value_type *p_cf;
  std::string::size_type v29;
  int v30;
  unint64_t *v31;
  unint64_t v32;
  CFTypeRef cf;
  std::string::size_type v34;
  unsigned __int8 v35;
  std::string v36;

  v6 = *a2;
  v5 = (std::__shared_weak_count *)a2[1];
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = *a1;
  v10 = a1[1];
  if (*a1 != v10)
  {
    v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v12 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
    while (1)
    {
      if (*(char *)(v9 + 23) >= 0)
        v13 = (const char *)v9;
      else
        v13 = *(const char **)v9;
      v14 = CFStringCreateWithCStringNoCopy(v11, v13, 0x8000100u, v12);
      objc_msgSend(*(id *)v6, "valueForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      CFRelease(v14);
      if (!v15)
      {
        memset(&v36, 0, sizeof(v36));
        v26 = *a1;
        v27 = a1[1];
        if (*a1 == v27)
        {
          *a3 = 0;
          a3[1] = 0;
        }
        else
        {
          do
          {
            std::operator+<char>();
            if ((v35 & 0x80u) == 0)
              p_cf = (const std::string::value_type *)&cf;
            else
              p_cf = (const std::string::value_type *)cf;
            if ((v35 & 0x80u) == 0)
              v29 = v35;
            else
              v29 = v34;
            std::string::append(&v36, p_cf, v29);
            if ((char)v35 < 0)
              operator delete((void *)cf);
            v26 += 24;
          }
          while (v26 != v27);
          v30 = SHIBYTE(v36.__r_.__value_.__r.__words[2]);
          *a3 = 0;
          a3[1] = 0;
          if (v30 < 0)
            operator delete(v36.__r_.__value_.__l.__data_);
        }
        if (v5)
        {
          v31 = (unint64_t *)&v5->__shared_owners_;
          do
            v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
            std::__shared_weak_count::__release_weak(v5);
          }
        }
        return;
      }
      if (*(char *)(v9 + 23) >= 0)
        v16 = (const char *)v9;
      else
        v16 = *(const char **)v9;
      v17 = CFStringCreateWithCStringNoCopy(v11, v16, 0x8000100u, v12);
      v18 = (const void *)objc_msgSend(*(id *)v6, "objectForKey:", v17);
      v19 = *(_BYTE *)(v6 + 8);
      cf = v18;
      LOBYTE(v34) = v19;
      if (v18)
        CFRetain(v18);
      else
        LOBYTE(v34) = 0;
      CFRelease(v17);
      cva::ItemHandler::getDictionary((uint64_t)&cf, &v36);
      size = v36.__r_.__value_.__l.__size_;
      v6 = v36.__r_.__value_.__r.__words[0];
      *(_OWORD *)&v36.__r_.__value_.__l.__data_ = 0uLL;
      if (!v5)
        goto LABEL_21;
      v21 = (unint64_t *)&v5->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
        v23 = (std::__shared_weak_count *)v36.__r_.__value_.__l.__size_;
        if (v36.__r_.__value_.__l.__size_)
        {
LABEL_22:
          v24 = (unint64_t *)&v23->__shared_owners_;
          do
            v25 = __ldaxr(v24);
          while (__stlxr(v25 - 1, v24));
          if (!v25)
          {
            ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
            std::__shared_weak_count::__release_weak(v23);
          }
        }
      }
      else
      {
LABEL_21:
        v23 = (std::__shared_weak_count *)v36.__r_.__value_.__l.__size_;
        if (v36.__r_.__value_.__l.__size_)
          goto LABEL_22;
      }
      if (cf)
        CFRelease(cf);
      v9 += 24;
      v5 = (std::__shared_weak_count *)size;
      if (v9 == v10)
        goto LABEL_30;
    }
  }
  size = (std::string::size_type)v5;
LABEL_30:
  *a3 = v6;
  a3[1] = size;
}

{
  std::__shared_weak_count *v5;
  std::string::size_type v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFAllocator *v11;
  const __CFAllocator *v12;
  const char *v13;
  CFStringRef v14;
  void *v15;
  const char *v16;
  CFStringRef v17;
  const void *v18;
  char v19;
  std::string::size_type size;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const std::string::value_type *p_cf;
  std::string::size_type v29;
  int v30;
  unint64_t *v31;
  unint64_t v32;
  CFTypeRef cf;
  std::string::size_type v34;
  unsigned __int8 v35;
  std::string v36;

  v6 = *a2;
  v5 = (std::__shared_weak_count *)a2[1];
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = *a1;
  v10 = a1[1];
  if (*a1 != v10)
  {
    v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v12 = (const __CFAllocator *)*MEMORY[0x24BDBD258];
    while (1)
    {
      if (*(char *)(v9 + 23) >= 0)
        v13 = (const char *)v9;
      else
        v13 = *(const char **)v9;
      v14 = CFStringCreateWithCStringNoCopy(v11, v13, 0x8000100u, v12);
      objc_msgSend(*(id *)v6, "valueForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      CFRelease(v14);
      if (!v15)
      {
        memset(&v36, 0, sizeof(v36));
        v26 = *a1;
        v27 = a1[1];
        if (*a1 == v27)
        {
          *a3 = 0;
          a3[1] = 0;
        }
        else
        {
          do
          {
            std::operator+<char>();
            if ((v35 & 0x80u) == 0)
              p_cf = (const std::string::value_type *)&cf;
            else
              p_cf = (const std::string::value_type *)cf;
            if ((v35 & 0x80u) == 0)
              v29 = v35;
            else
              v29 = v34;
            std::string::append(&v36, p_cf, v29);
            if ((char)v35 < 0)
              operator delete((void *)cf);
            v26 += 24;
          }
          while (v26 != v27);
          v30 = SHIBYTE(v36.__r_.__value_.__r.__words[2]);
          *a3 = 0;
          a3[1] = 0;
          if (v30 < 0)
            operator delete(v36.__r_.__value_.__l.__data_);
        }
        if (v5)
        {
          v31 = (unint64_t *)&v5->__shared_owners_;
          do
            v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
            std::__shared_weak_count::__release_weak(v5);
          }
        }
        return;
      }
      if (*(char *)(v9 + 23) >= 0)
        v16 = (const char *)v9;
      else
        v16 = *(const char **)v9;
      v17 = CFStringCreateWithCStringNoCopy(v11, v16, 0x8000100u, v12);
      v18 = (const void *)objc_msgSend(*(id *)v6, "objectForKey:", v17);
      v19 = *(_BYTE *)(v6 + 8);
      cf = v18;
      LOBYTE(v34) = v19;
      if (v18)
        CFRetain(v18);
      else
        LOBYTE(v34) = 0;
      CFRelease(v17);
      cva::ItemHandler::getDictionary((uint64_t)&cf, &v36);
      size = v36.__r_.__value_.__l.__size_;
      v6 = v36.__r_.__value_.__r.__words[0];
      *(_OWORD *)&v36.__r_.__value_.__l.__data_ = 0uLL;
      if (!v5)
        goto LABEL_21;
      v21 = (unint64_t *)&v5->__shared_owners_;
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
        v23 = (std::__shared_weak_count *)v36.__r_.__value_.__l.__size_;
        if (v36.__r_.__value_.__l.__size_)
        {
LABEL_22:
          v24 = (unint64_t *)&v23->__shared_owners_;
          do
            v25 = __ldaxr(v24);
          while (__stlxr(v25 - 1, v24));
          if (!v25)
          {
            ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
            std::__shared_weak_count::__release_weak(v23);
          }
        }
      }
      else
      {
LABEL_21:
        v23 = (std::__shared_weak_count *)v36.__r_.__value_.__l.__size_;
        if (v36.__r_.__value_.__l.__size_)
          goto LABEL_22;
      }
      if (cf)
        CFRelease(cf);
      v9 += 24;
      v5 = (std::__shared_weak_count *)size;
      if (v9 == v10)
        goto LABEL_30;
    }
  }
  size = (std::string::size_type)v5;
LABEL_30:
  *a3 = v6;
  a3[1] = size;
}

void sub_20ABF0CB0(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_20ABF1024(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t cva::adp::io::PListSerializer::getKeys(std::string::size_type *a1, std::string *a2, void **a3)
{
  void **v5;
  CFDictionaryRef *v6;
  void **v7;
  void **v8;
  void *v9;
  uint64_t v10;
  void **i;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  cva::DictionaryHandler *v16;
  std::__shared_weak_count *v17;
  void *__p[2];
  void *v19;

  if (!*a1)
  {
    v10 = 0;
    v16 = 0;
    v17 = 0;
    goto LABEL_23;
  }
  __p[0] = 0;
  __p[1] = 0;
  v19 = 0;
  if (cva::adp::io::PListSerializer::decomposePath((int)a1, a2, (uint64_t)__p))
  {
    cva::adp::io::PListSerializer::getPath((uint64_t *)__p, a1, (std::string::size_type *)&v16);
    v5 = (void **)__p[0];
    if (!__p[0])
      goto LABEL_4;
LABEL_13:
    for (i = (void **)__p[1]; i != v5; i -= 3)
    {
      if (*((char *)i - 1) < 0)
        operator delete(*(i - 3));
    }
    operator delete(v5);
    v6 = (CFDictionaryRef *)v16;
    if (v16)
      goto LABEL_5;
LABEL_19:
    v10 = 0;
    goto LABEL_23;
  }
  v16 = 0;
  v17 = 0;
  v5 = (void **)__p[0];
  if (__p[0])
    goto LABEL_13;
LABEL_4:
  v6 = (CFDictionaryRef *)v16;
  if (!v16)
    goto LABEL_19;
LABEL_5:
  cva::DictionaryHandler::getKeys(v6, __p);
  v7 = (void **)*a3;
  if (*a3)
  {
    v8 = (void **)a3[1];
    v9 = *a3;
    if (v8 != v7)
    {
      do
      {
        if (*((char *)v8 - 1) < 0)
          operator delete(*(v8 - 3));
        v8 -= 3;
      }
      while (v8 != v7);
      v9 = *a3;
    }
    a3[1] = v7;
    operator delete(v9);
  }
  *(_OWORD *)a3 = *(_OWORD *)__p;
  a3[2] = v19;
  v10 = 1;
LABEL_23:
  v12 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v10;
}

uint64_t cva::adp::io::PListSerializer::getItem<int>(std::string::size_type *a1, std::string *a2, uint64_t a3, _DWORD *a4)
{
  void **v7;
  void **i;
  id *v9;
  uint64_t v10;
  const char *v11;
  CFStringRef v12;
  __CFString *v13;
  __CFString *v14;
  std::__shared_weak_count *v15;
  CFStringRef v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  id *v20;
  std::__shared_weak_count *v21;
  void *__p;
  void **v23;
  uint64_t v24;

  if (!*a1)
  {
    v10 = 0;
    v20 = 0;
    v21 = 0;
    return v10;
  }
  __p = 0;
  v23 = 0;
  v24 = 0;
  if (!cva::adp::io::PListSerializer::decomposePath((int)a1, a2, (uint64_t)&__p))
  {
    v20 = 0;
    v21 = 0;
    v7 = (void **)__p;
    if (__p)
      goto LABEL_4;
LABEL_13:
    v9 = v20;
    if (!v20)
      goto LABEL_24;
    goto LABEL_14;
  }
  cva::adp::io::PListSerializer::getPath((uint64_t *)&__p, a1, (std::string::size_type *)&v20);
  v7 = (void **)__p;
  if (!__p)
    goto LABEL_13;
LABEL_4:
  for (i = v23; i != v7; i -= 3)
  {
    if (*((char *)i - 1) < 0)
      operator delete(*(i - 3));
  }
  operator delete(v7);
  v9 = v20;
  if (!v20)
  {
LABEL_24:
    v10 = 0;
    v15 = v21;
    if (!v21)
      return v10;
    goto LABEL_25;
  }
LABEL_14:
  if (*(char *)(a3 + 23) >= 0)
    v11 = (const char *)a3;
  else
    v11 = *(const char **)a3;
  v12 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v13 = (__CFString *)objc_msgSend(*v9, "objectForKey:", v12);
  v14 = v13;
  if (!v13)
  {
    v16 = v12;
LABEL_23:
    CFRelease(v16);
    goto LABEL_24;
  }
  CFRetain(v13);
  CFRelease(v12);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = v14;
    goto LABEL_23;
  }
  *a4 = -[__CFString intValue](v14, "intValue");
  CFRelease(v14);
  v10 = 1;
  v15 = v21;
  if (!v21)
    return v10;
LABEL_25:
  p_shared_owners = (unint64_t *)&v15->__shared_owners_;
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
  return v10;
}

void sub_20ABF1358(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t cva::adp::io::PListSerializer::getItem<long long>(std::string::size_type *a1, std::string *a2, uint64_t a3, _QWORD *a4)
{
  void **v7;
  void **i;
  id *v9;
  uint64_t v10;
  const char *v11;
  CFStringRef v12;
  __CFString *v13;
  __CFString *v14;
  std::__shared_weak_count *v15;
  CFStringRef v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  id *v20;
  std::__shared_weak_count *v21;
  void *__p;
  void **v23;
  uint64_t v24;

  if (!*a1)
  {
    v10 = 0;
    v20 = 0;
    v21 = 0;
    return v10;
  }
  __p = 0;
  v23 = 0;
  v24 = 0;
  if (!cva::adp::io::PListSerializer::decomposePath((int)a1, a2, (uint64_t)&__p))
  {
    v20 = 0;
    v21 = 0;
    v7 = (void **)__p;
    if (__p)
      goto LABEL_4;
LABEL_13:
    v9 = v20;
    if (!v20)
      goto LABEL_24;
    goto LABEL_14;
  }
  cva::adp::io::PListSerializer::getPath((uint64_t *)&__p, a1, (std::string::size_type *)&v20);
  v7 = (void **)__p;
  if (!__p)
    goto LABEL_13;
LABEL_4:
  for (i = v23; i != v7; i -= 3)
  {
    if (*((char *)i - 1) < 0)
      operator delete(*(i - 3));
  }
  operator delete(v7);
  v9 = v20;
  if (!v20)
  {
LABEL_24:
    v10 = 0;
    v15 = v21;
    if (!v21)
      return v10;
    goto LABEL_25;
  }
LABEL_14:
  if (*(char *)(a3 + 23) >= 0)
    v11 = (const char *)a3;
  else
    v11 = *(const char **)a3;
  v12 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v13 = (__CFString *)objc_msgSend(*v9, "objectForKey:", v12);
  v14 = v13;
  if (!v13)
  {
    v16 = v12;
LABEL_23:
    CFRelease(v16);
    goto LABEL_24;
  }
  CFRetain(v13);
  CFRelease(v12);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = v14;
    goto LABEL_23;
  }
  *a4 = -[__CFString longLongValue](v14, "longLongValue");
  CFRelease(v14);
  v10 = 1;
  v15 = v21;
  if (!v21)
    return v10;
LABEL_25:
  p_shared_owners = (unint64_t *)&v15->__shared_owners_;
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
  return v10;
}

void sub_20ABF1524(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t cva::adp::io::PListSerializer::getItem<unsigned int>(std::string::size_type *a1, std::string *a2, uint64_t a3, _DWORD *a4)
{
  void **v7;
  void **i;
  id *v9;
  uint64_t v10;
  const char *v11;
  CFStringRef v12;
  __CFString *v13;
  __CFString *v14;
  std::__shared_weak_count *v15;
  CFStringRef v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  id *v20;
  std::__shared_weak_count *v21;
  void *__p;
  void **v23;
  uint64_t v24;

  if (!*a1)
  {
    v10 = 0;
    v20 = 0;
    v21 = 0;
    return v10;
  }
  __p = 0;
  v23 = 0;
  v24 = 0;
  if (!cva::adp::io::PListSerializer::decomposePath((int)a1, a2, (uint64_t)&__p))
  {
    v20 = 0;
    v21 = 0;
    v7 = (void **)__p;
    if (__p)
      goto LABEL_4;
LABEL_13:
    v9 = v20;
    if (!v20)
      goto LABEL_24;
    goto LABEL_14;
  }
  cva::adp::io::PListSerializer::getPath((uint64_t *)&__p, a1, (std::string::size_type *)&v20);
  v7 = (void **)__p;
  if (!__p)
    goto LABEL_13;
LABEL_4:
  for (i = v23; i != v7; i -= 3)
  {
    if (*((char *)i - 1) < 0)
      operator delete(*(i - 3));
  }
  operator delete(v7);
  v9 = v20;
  if (!v20)
  {
LABEL_24:
    v10 = 0;
    v15 = v21;
    if (!v21)
      return v10;
    goto LABEL_25;
  }
LABEL_14:
  if (*(char *)(a3 + 23) >= 0)
    v11 = (const char *)a3;
  else
    v11 = *(const char **)a3;
  v12 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v13 = (__CFString *)objc_msgSend(*v9, "objectForKey:", v12);
  v14 = v13;
  if (!v13)
  {
    v16 = v12;
LABEL_23:
    CFRelease(v16);
    goto LABEL_24;
  }
  CFRetain(v13);
  CFRelease(v12);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = v14;
    goto LABEL_23;
  }
  *a4 = -[__CFString unsignedIntValue](v14, "unsignedIntValue");
  CFRelease(v14);
  v10 = 1;
  v15 = v21;
  if (!v21)
    return v10;
LABEL_25:
  p_shared_owners = (unint64_t *)&v15->__shared_owners_;
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
  return v10;
}

void sub_20ABF16F0(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t cva::adp::io::PListSerializer::getItem<unsigned long long>(std::string::size_type *a1, std::string *a2, uint64_t a3, _QWORD *a4)
{
  void **v7;
  void **i;
  id *v9;
  uint64_t v10;
  const char *v11;
  CFStringRef v12;
  __CFString *v13;
  __CFString *v14;
  std::__shared_weak_count *v15;
  CFStringRef v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  id *v20;
  std::__shared_weak_count *v21;
  void *__p;
  void **v23;
  uint64_t v24;

  if (!*a1)
  {
    v10 = 0;
    v20 = 0;
    v21 = 0;
    return v10;
  }
  __p = 0;
  v23 = 0;
  v24 = 0;
  if (!cva::adp::io::PListSerializer::decomposePath((int)a1, a2, (uint64_t)&__p))
  {
    v20 = 0;
    v21 = 0;
    v7 = (void **)__p;
    if (__p)
      goto LABEL_4;
LABEL_13:
    v9 = v20;
    if (!v20)
      goto LABEL_24;
    goto LABEL_14;
  }
  cva::adp::io::PListSerializer::getPath((uint64_t *)&__p, a1, (std::string::size_type *)&v20);
  v7 = (void **)__p;
  if (!__p)
    goto LABEL_13;
LABEL_4:
  for (i = v23; i != v7; i -= 3)
  {
    if (*((char *)i - 1) < 0)
      operator delete(*(i - 3));
  }
  operator delete(v7);
  v9 = v20;
  if (!v20)
  {
LABEL_24:
    v10 = 0;
    v15 = v21;
    if (!v21)
      return v10;
    goto LABEL_25;
  }
LABEL_14:
  if (*(char *)(a3 + 23) >= 0)
    v11 = (const char *)a3;
  else
    v11 = *(const char **)a3;
  v12 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v13 = (__CFString *)objc_msgSend(*v9, "objectForKey:", v12);
  v14 = v13;
  if (!v13)
  {
    v16 = v12;
LABEL_23:
    CFRelease(v16);
    goto LABEL_24;
  }
  CFRetain(v13);
  CFRelease(v12);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = v14;
    goto LABEL_23;
  }
  *a4 = -[__CFString unsignedLongLongValue](v14, "unsignedLongLongValue");
  CFRelease(v14);
  v10 = 1;
  v15 = v21;
  if (!v21)
    return v10;
LABEL_25:
  p_shared_owners = (unint64_t *)&v15->__shared_owners_;
  do
    v18 = __ldaxr(p_shared_owners);
  while (__stlxr(v18 - 1, p_shared_owners));
  if (!v18)
  {
    ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
    std::__shared_weak_count::__release_weak(v15);
  }
  return v10;
}

void sub_20ABF18BC(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t cva::adp::io::PListSerializer::getItem<float>(std::string::size_type *a1, std::string *a2, uint64_t a3, _DWORD *a4)
{
  void **v7;
  void **i;
  id *v9;
  uint64_t v10;
  const char *v11;
  CFStringRef v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  std::__shared_weak_count *v16;
  CFStringRef v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  id *v21;
  std::__shared_weak_count *v22;
  void *__p;
  void **v24;
  uint64_t v25;

  if (!*a1)
  {
    v10 = 0;
    v21 = 0;
    v22 = 0;
    return v10;
  }
  __p = 0;
  v24 = 0;
  v25 = 0;
  if (!cva::adp::io::PListSerializer::decomposePath((int)a1, a2, (uint64_t)&__p))
  {
    v21 = 0;
    v22 = 0;
    v7 = (void **)__p;
    if (__p)
      goto LABEL_4;
LABEL_13:
    v9 = v21;
    if (!v21)
      goto LABEL_24;
    goto LABEL_14;
  }
  cva::adp::io::PListSerializer::getPath((uint64_t *)&__p, a1, (std::string::size_type *)&v21);
  v7 = (void **)__p;
  if (!__p)
    goto LABEL_13;
LABEL_4:
  for (i = v24; i != v7; i -= 3)
  {
    if (*((char *)i - 1) < 0)
      operator delete(*(i - 3));
  }
  operator delete(v7);
  v9 = v21;
  if (!v21)
  {
LABEL_24:
    v10 = 0;
    v16 = v22;
    if (!v22)
      return v10;
    goto LABEL_25;
  }
LABEL_14:
  if (*(char *)(a3 + 23) >= 0)
    v11 = (const char *)a3;
  else
    v11 = *(const char **)a3;
  v12 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v13 = (__CFString *)objc_msgSend(*v9, "objectForKey:", v12);
  v14 = v13;
  if (!v13)
  {
    v17 = v12;
LABEL_23:
    CFRelease(v17);
    goto LABEL_24;
  }
  CFRetain(v13);
  CFRelease(v12);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = v14;
    goto LABEL_23;
  }
  -[__CFString floatValue](v14, "floatValue");
  *a4 = v15;
  CFRelease(v14);
  v10 = 1;
  v16 = v22;
  if (!v22)
    return v10;
LABEL_25:
  p_shared_owners = (unint64_t *)&v16->__shared_owners_;
  do
    v19 = __ldaxr(p_shared_owners);
  while (__stlxr(v19 - 1, p_shared_owners));
  if (!v19)
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  return v10;
}

void sub_20ABF1A88(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t cva::adp::io::PListSerializer::getItem<double>(std::string::size_type *a1, std::string *a2, uint64_t a3, _QWORD *a4)
{
  void **v7;
  void **i;
  id *v9;
  uint64_t v10;
  const char *v11;
  CFStringRef v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  std::__shared_weak_count *v16;
  CFStringRef v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  id *v21;
  std::__shared_weak_count *v22;
  void *__p;
  void **v24;
  uint64_t v25;

  if (!*a1)
  {
    v10 = 0;
    v21 = 0;
    v22 = 0;
    return v10;
  }
  __p = 0;
  v24 = 0;
  v25 = 0;
  if (!cva::adp::io::PListSerializer::decomposePath((int)a1, a2, (uint64_t)&__p))
  {
    v21 = 0;
    v22 = 0;
    v7 = (void **)__p;
    if (__p)
      goto LABEL_4;
LABEL_13:
    v9 = v21;
    if (!v21)
      goto LABEL_24;
    goto LABEL_14;
  }
  cva::adp::io::PListSerializer::getPath((uint64_t *)&__p, a1, (std::string::size_type *)&v21);
  v7 = (void **)__p;
  if (!__p)
    goto LABEL_13;
LABEL_4:
  for (i = v24; i != v7; i -= 3)
  {
    if (*((char *)i - 1) < 0)
      operator delete(*(i - 3));
  }
  operator delete(v7);
  v9 = v21;
  if (!v21)
  {
LABEL_24:
    v10 = 0;
    v16 = v22;
    if (!v22)
      return v10;
    goto LABEL_25;
  }
LABEL_14:
  if (*(char *)(a3 + 23) >= 0)
    v11 = (const char *)a3;
  else
    v11 = *(const char **)a3;
  v12 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v13 = (__CFString *)objc_msgSend(*v9, "objectForKey:", v12);
  v14 = v13;
  if (!v13)
  {
    v17 = v12;
LABEL_23:
    CFRelease(v17);
    goto LABEL_24;
  }
  CFRetain(v13);
  CFRelease(v12);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = v14;
    goto LABEL_23;
  }
  -[__CFString doubleValue](v14, "doubleValue");
  *a4 = v15;
  CFRelease(v14);
  v10 = 1;
  v16 = v22;
  if (!v22)
    return v10;
LABEL_25:
  p_shared_owners = (unint64_t *)&v16->__shared_owners_;
  do
    v19 = __ldaxr(p_shared_owners);
  while (__stlxr(v19 - 1, p_shared_owners));
  if (!v19)
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
  return v10;
}

void sub_20ABF1C54(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t cva::adp::io::PListSerializer::getItem<BOOL>(std::string::size_type *a1, std::string *a2, uint64_t a3, _BYTE *a4)
{
  void **v7;
  id *v8;
  uint64_t v9;
  void **i;
  const char *v11;
  CFStringRef v12;
  __CFString *v13;
  __CFString *v14;
  CFStringRef v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  id *v20;
  std::__shared_weak_count *v21;
  void *__p;
  void **v23;
  uint64_t v24;

  if (*a1)
  {
    __p = 0;
    v23 = 0;
    v24 = 0;
    if (cva::adp::io::PListSerializer::decomposePath((int)a1, a2, (uint64_t)&__p))
    {
      cva::adp::io::PListSerializer::getPath((uint64_t *)&__p, a1, (std::string::size_type *)&v20);
      v7 = (void **)__p;
      if (!__p)
        goto LABEL_4;
    }
    else
    {
      v20 = 0;
      v21 = 0;
      v7 = (void **)__p;
      if (!__p)
      {
LABEL_4:
        v8 = v20;
        if (!v20)
          goto LABEL_23;
LABEL_14:
        if (*(char *)(a3 + 23) >= 0)
          v11 = (const char *)a3;
        else
          v11 = *(const char **)a3;
        v12 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
        v13 = (__CFString *)objc_msgSend(*v8, "objectForKey:", v12);
        v14 = v13;
        if (v13)
        {
          CFRetain(v13);
          CFRelease(v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            *a4 = -[__CFString BOOLValue](v14, "BOOLValue");
            CFRelease(v14);
            v9 = 1;
            goto LABEL_24;
          }
          v15 = v14;
        }
        else
        {
          v15 = v12;
        }
        CFRelease(v15);
LABEL_23:
        v9 = 0;
        goto LABEL_24;
      }
    }
    for (i = v23; i != v7; i -= 3)
    {
      if (*((char *)i - 1) < 0)
        operator delete(*(i - 3));
    }
    operator delete(v7);
    v8 = v20;
    if (!v20)
      goto LABEL_23;
    goto LABEL_14;
  }
  v9 = 0;
  v20 = 0;
  v21 = 0;
LABEL_24:
  v16 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v18 = __ldaxr(p_shared_owners);
    while (__stlxr(v18 - 1, p_shared_owners));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  return v9;
}

void sub_20ABF1E10(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t cva::adp::io::PListSerializer::getItem<std::string>(std::string::size_type *a1, std::string *a2, uint64_t a3, uint64_t a4)
{
  void **v7;
  std::string::size_type v8;
  uint64_t v9;
  void **i;
  const char *v11;
  CFStringRef v12;
  const __CFString *v13;
  const __CFString *v14;
  char v15;
  CFStringRef v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  CFTypeRef cf;
  char v22;
  std::string::size_type v23;
  std::__shared_weak_count *v24;
  void *__p[2];
  uint64_t v26;

  if (!*a1)
  {
    v9 = 0;
    v23 = 0;
    v24 = 0;
    goto LABEL_28;
  }
  __p[0] = 0;
  __p[1] = 0;
  v26 = 0;
  if (cva::adp::io::PListSerializer::decomposePath((int)a1, a2, (uint64_t)__p))
  {
    cva::adp::io::PListSerializer::getPath((uint64_t *)__p, a1, &v23);
    v7 = (void **)__p[0];
    if (!__p[0])
      goto LABEL_4;
LABEL_8:
    for (i = (void **)__p[1]; i != v7; i -= 3)
    {
      if (*((char *)i - 1) < 0)
        operator delete(*(i - 3));
    }
    operator delete(v7);
    v8 = v23;
    if (!v23)
      goto LABEL_27;
    goto LABEL_14;
  }
  v23 = 0;
  v24 = 0;
  v7 = (void **)__p[0];
  if (__p[0])
    goto LABEL_8;
LABEL_4:
  v8 = v23;
  if (!v23)
    goto LABEL_27;
LABEL_14:
  if (*(char *)(a3 + 23) >= 0)
    v11 = (const char *)a3;
  else
    v11 = *(const char **)a3;
  v12 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v13 = (const __CFString *)objc_msgSend(*(id *)v8, "objectForKey:", v12);
  v14 = v13;
  v15 = *(_BYTE *)(v8 + 8);
  cf = v13;
  v22 = v15;
  if (!v13)
  {
    v22 = 0;
    v16 = v12;
LABEL_26:
    CFRelease(v16);
LABEL_27:
    v9 = 0;
    goto LABEL_28;
  }
  CFRetain(v13);
  CFRelease(v12);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = v14;
    goto LABEL_26;
  }
  cva::ItemHandler::getValue<std::string>((id *)&cf, __p);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(_OWORD *)a4 = *(_OWORD *)__p;
  *(_QWORD *)(a4 + 16) = v26;
  if (cf)
    CFRelease(cf);
  v9 = 1;
LABEL_28:
  v17 = v24;
  if (v24)
  {
    p_shared_owners = (unint64_t *)&v24->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  return v9;
}

void sub_20ABF2000(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL cva::adp::io::PListSerializer::setItem<int>(cva::adp::io::PListSerializer *a1, std::string *a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v6;
  id v7;
  const void *v8;
  const char *v9;
  CFStringRef v10;
  _BOOL8 v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;

  cva::adp::io::PListSerializer::createPath(a1, a2, &v16);
  v6 = v16;
  if (!v16 || (v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", *a4)) == 0)
  {
    v11 = 0;
    v12 = v17;
    if (!v17)
      return v11;
    goto LABEL_11;
  }
  v8 = v7;
  CFRetain(v7);
  if (*(char *)(a3 + 23) >= 0)
    v9 = (const char *)a3;
  else
    v9 = *(const char **)a3;
  v10 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v11 = *(_BYTE *)(v6 + 8) != 0;
  if (*(_BYTE *)(v6 + 8))
    objc_msgSend(*(id *)v6, "setValue:forKey:", v8, v10);
  CFRelease(v10);
  CFRelease(v8);
  v12 = v17;
  if (v17)
  {
LABEL_11:
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v11;
}

void sub_20ABF2130(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL cva::adp::io::PListSerializer::setItem<long long>(cva::adp::io::PListSerializer *a1, std::string *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  id v7;
  const void *v8;
  const char *v9;
  CFStringRef v10;
  _BOOL8 v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;

  cva::adp::io::PListSerializer::createPath(a1, a2, &v16);
  v6 = v16;
  if (!v16
    || (v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", *a4)) == 0)
  {
    v11 = 0;
    v12 = v17;
    if (!v17)
      return v11;
    goto LABEL_11;
  }
  v8 = v7;
  CFRetain(v7);
  if (*(char *)(a3 + 23) >= 0)
    v9 = (const char *)a3;
  else
    v9 = *(const char **)a3;
  v10 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v11 = *(_BYTE *)(v6 + 8) != 0;
  if (*(_BYTE *)(v6 + 8))
    objc_msgSend(*(id *)v6, "setValue:forKey:", v8, v10);
  CFRelease(v10);
  CFRelease(v8);
  v12 = v17;
  if (v17)
  {
LABEL_11:
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v11;
}

void sub_20ABF2260(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL cva::adp::io::PListSerializer::setItem<unsigned int>(cva::adp::io::PListSerializer *a1, std::string *a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v6;
  id v7;
  const void *v8;
  const char *v9;
  CFStringRef v10;
  _BOOL8 v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;

  cva::adp::io::PListSerializer::createPath(a1, a2, &v16);
  v6 = v16;
  if (!v16
    || (v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", *a4)) == 0)
  {
    v11 = 0;
    v12 = v17;
    if (!v17)
      return v11;
    goto LABEL_11;
  }
  v8 = v7;
  CFRetain(v7);
  if (*(char *)(a3 + 23) >= 0)
    v9 = (const char *)a3;
  else
    v9 = *(const char **)a3;
  v10 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v11 = *(_BYTE *)(v6 + 8) != 0;
  if (*(_BYTE *)(v6 + 8))
    objc_msgSend(*(id *)v6, "setValue:forKey:", v8, v10);
  CFRelease(v10);
  CFRelease(v8);
  v12 = v17;
  if (v17)
  {
LABEL_11:
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v11;
}

void sub_20ABF2390(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL cva::adp::io::PListSerializer::setItem<unsigned long long>(cva::adp::io::PListSerializer *a1, std::string *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  id v7;
  const void *v8;
  const char *v9;
  CFStringRef v10;
  _BOOL8 v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;

  cva::adp::io::PListSerializer::createPath(a1, a2, &v16);
  v6 = v16;
  if (!v16
    || (v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", *a4)) == 0)
  {
    v11 = 0;
    v12 = v17;
    if (!v17)
      return v11;
    goto LABEL_11;
  }
  v8 = v7;
  CFRetain(v7);
  if (*(char *)(a3 + 23) >= 0)
    v9 = (const char *)a3;
  else
    v9 = *(const char **)a3;
  v10 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v11 = *(_BYTE *)(v6 + 8) != 0;
  if (*(_BYTE *)(v6 + 8))
    objc_msgSend(*(id *)v6, "setValue:forKey:", v8, v10);
  CFRelease(v10);
  CFRelease(v8);
  v12 = v17;
  if (v17)
  {
LABEL_11:
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v11;
}

void sub_20ABF24C0(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL cva::adp::io::PListSerializer::setItem<float>(cva::adp::io::PListSerializer *a1, std::string *a2, uint64_t a3, int *a4)
{
  uint64_t v6;
  int v7;
  id v8;
  double v9;
  id v10;
  const void *v11;
  const char *v12;
  CFStringRef v13;
  _BOOL8 v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v19;
  std::__shared_weak_count *v20;

  cva::adp::io::PListSerializer::createPath(a1, a2, &v19);
  v6 = v19;
  if (!v19
    || (v7 = *a4,
        v8 = objc_alloc(MEMORY[0x24BDD16E0]),
        LODWORD(v9) = v7,
        (v10 = (id)objc_msgSend(v8, "initWithFloat:", v9)) == 0))
  {
    v14 = 0;
    v15 = v20;
    if (!v20)
      return v14;
    goto LABEL_11;
  }
  v11 = v10;
  CFRetain(v10);
  if (*(char *)(a3 + 23) >= 0)
    v12 = (const char *)a3;
  else
    v12 = *(const char **)a3;
  v13 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v12, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v14 = *(_BYTE *)(v6 + 8) != 0;
  if (*(_BYTE *)(v6 + 8))
    objc_msgSend(*(id *)v6, "setValue:forKey:", v11, v13);
  CFRelease(v13);
  CFRelease(v11);
  v15 = v20;
  if (v20)
  {
LABEL_11:
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return v14;
}

void sub_20ABF25F8(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL cva::adp::io::PListSerializer::setItem<double>(cva::adp::io::PListSerializer *a1, std::string *a2, uint64_t a3, double *a4)
{
  uint64_t v6;
  id v7;
  const void *v8;
  const char *v9;
  CFStringRef v10;
  _BOOL8 v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;

  cva::adp::io::PListSerializer::createPath(a1, a2, &v16);
  v6 = v16;
  if (!v16 || (v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", *a4)) == 0)
  {
    v11 = 0;
    v12 = v17;
    if (!v17)
      return v11;
    goto LABEL_11;
  }
  v8 = v7;
  CFRetain(v7);
  if (*(char *)(a3 + 23) >= 0)
    v9 = (const char *)a3;
  else
    v9 = *(const char **)a3;
  v10 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v11 = *(_BYTE *)(v6 + 8) != 0;
  if (*(_BYTE *)(v6 + 8))
    objc_msgSend(*(id *)v6, "setValue:forKey:", v8, v10);
  CFRelease(v10);
  CFRelease(v8);
  v12 = v17;
  if (v17)
  {
LABEL_11:
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v11;
}

void sub_20ABF2730(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL cva::adp::io::PListSerializer::setItem<BOOL>(cva::adp::io::PListSerializer *a1, std::string *a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v6;
  id v7;
  const void *v8;
  const char *v9;
  CFStringRef v10;
  _BOOL8 v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;

  cva::adp::io::PListSerializer::createPath(a1, a2, &v16);
  v6 = v16;
  if (!v16 || (v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", *a4)) == 0)
  {
    v11 = 0;
    v12 = v17;
    if (!v17)
      return v11;
    goto LABEL_11;
  }
  v8 = v7;
  CFRetain(v7);
  if (*(char *)(a3 + 23) >= 0)
    v9 = (const char *)a3;
  else
    v9 = *(const char **)a3;
  v10 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v11 = *(_BYTE *)(v6 + 8) != 0;
  if (*(_BYTE *)(v6 + 8))
    objc_msgSend(*(id *)v6, "setValue:forKey:", v8, v10);
  CFRelease(v10);
  CFRelease(v8);
  v12 = v17;
  if (v17)
  {
LABEL_11:
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v11;
}

void sub_20ABF2860(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL cva::adp::io::PListSerializer::setItem<std::string>(cva::adp::io::PListSerializer *a1, std::string *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  id v7;
  const void *v8;
  const char *v9;
  CFStringRef v10;
  _BOOL8 v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  uint64_t v16;
  std::__shared_weak_count *v17;

  cva::adp::io::PListSerializer::createPath(a1, a2, &v16);
  v6 = v16;
  if (!v16)
    goto LABEL_12;
  if (*((char *)a4 + 23) < 0)
    a4 = (uint64_t *)*a4;
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a4);
  if (!v7)
  {
LABEL_12:
    v11 = 0;
    v12 = v17;
    if (!v17)
      return v11;
    goto LABEL_13;
  }
  v8 = v7;
  CFRetain(v7);
  if (*(char *)(a3 + 23) >= 0)
    v9 = (const char *)a3;
  else
    v9 = *(const char **)a3;
  v10 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v11 = *(_BYTE *)(v6 + 8) != 0;
  if (*(_BYTE *)(v6 + 8))
    objc_msgSend(*(id *)v6, "setValue:forKey:", v8, v10);
  CFRelease(v10);
  CFRelease(v8);
  v12 = v17;
  if (v17)
  {
LABEL_13:
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  return v11;
}

void sub_20ABF299C(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t *cva::ProgramOptions::ProgramOptions(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;

  v8 = operator new();
  v9 = v8;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_20AB88C14((_BYTE *)v8, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)v8 = *(_OWORD *)a2;
    *(_QWORD *)(v8 + 16) = *(_QWORD *)(a2 + 16);
  }
  v10 = (_BYTE *)(v9 + 24);
  if (*(char *)(a3 + 23) < 0)
  {
    sub_20AB88C14(v10, *(void **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)v10 = *(_OWORD *)a3;
    *(_QWORD *)(v9 + 40) = *(_QWORD *)(a3 + 16);
  }
  v11 = (_BYTE *)(v9 + 48);
  if (*(char *)(a4 + 23) < 0)
  {
    sub_20AB88C14(v11, *(void **)a4, *(_QWORD *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)v11 = *(_OWORD *)a4;
    *(_QWORD *)(v9 + 64) = *(_QWORD *)(a4 + 16);
  }
  *(_QWORD *)(v9 + 72) = 0;
  *(_QWORD *)(v9 + 80) = 0;
  *(_QWORD *)(v9 + 112) = 0;
  *(_QWORD *)(v9 + 120) = 0;
  *(_QWORD *)(v9 + 104) = 0;
  *(_QWORD *)(v9 + 88) = 0;
  *(_QWORD *)(v9 + 96) = v9 + 104;
  *(_QWORD *)(v9 + 128) = 0;
  *(_QWORD *)(v9 + 136) = 0;
  *(_BYTE *)(v9 + 144) = 0;
  *a1 = v9;
  return a1;
}

{
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;

  v8 = operator new();
  v9 = v8;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_20AB88C14((_BYTE *)v8, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)v8 = *(_OWORD *)a2;
    *(_QWORD *)(v8 + 16) = *(_QWORD *)(a2 + 16);
  }
  v10 = (_BYTE *)(v9 + 24);
  if (*(char *)(a3 + 23) < 0)
  {
    sub_20AB88C14(v10, *(void **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)v10 = *(_OWORD *)a3;
    *(_QWORD *)(v9 + 40) = *(_QWORD *)(a3 + 16);
  }
  v11 = (_BYTE *)(v9 + 48);
  if (*(char *)(a4 + 23) < 0)
  {
    sub_20AB88C14(v11, *(void **)a4, *(_QWORD *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)v11 = *(_OWORD *)a4;
    *(_QWORD *)(v9 + 64) = *(_QWORD *)(a4 + 16);
  }
  *(_QWORD *)(v9 + 72) = 0;
  *(_QWORD *)(v9 + 80) = 0;
  *(_QWORD *)(v9 + 112) = 0;
  *(_QWORD *)(v9 + 120) = 0;
  *(_QWORD *)(v9 + 104) = 0;
  *(_QWORD *)(v9 + 88) = 0;
  *(_QWORD *)(v9 + 96) = v9 + 104;
  *(_QWORD *)(v9 + 128) = 0;
  *(_QWORD *)(v9 + 136) = 0;
  *(_BYTE *)(v9 + 144) = 0;
  *a1 = v9;
  return a1;
}

void cva::ProgramOptions::~ProgramOptions(cva::ProgramOptions *this)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)this;
  *(_QWORD *)this = 0;
  if (v2)
  {
    v3 = sub_20ABF2BD4(v2);
    MEMORY[0x20BD2D02C](v3, 0x1032C407DCE974ALL);
  }
}

{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)this;
  *(_QWORD *)this = 0;
  if (v2)
  {
    v3 = sub_20ABF2BD4(v2);
    MEMORY[0x20BD2D02C](v3, 0x1032C407DCE974ALL);
  }
}

uint64_t sub_20ABF2BD4(uint64_t a1)
{
  void **v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void **)(a1 + 120);
  if (*(_QWORD *)(a1 + 120))
  {
    sub_20ABF2CAC((void ***)(a1 + 120));
    operator delete(*v2);
  }
  sub_20ABF2D74(*(_QWORD *)(a1 + 104));
  v3 = *(_QWORD *)(a1 + 72);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 80);
    v5 = *(void **)(a1 + 72);
    if (v4 != v3)
    {
      do
      {
        if (*(char *)(v4 - 1) < 0)
          operator delete(*(void **)(v4 - 24));
        v4 -= 24;
      }
      while (v4 != v3);
      v5 = *(void **)(a1 + 72);
    }
    *(_QWORD *)(a1 + 80) = v3;
    operator delete(v5);
  }
  if ((*(char *)(a1 + 71) & 0x80000000) == 0)
  {
    if ((*(char *)(a1 + 47) & 0x80000000) == 0)
      goto LABEL_13;
LABEL_16:
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0)
      return a1;
LABEL_17:
    operator delete(*(void **)a1);
    return a1;
  }
  operator delete(*(void **)(a1 + 48));
  if (*(char *)(a1 + 47) < 0)
    goto LABEL_16;
LABEL_13:
  if (*(char *)(a1 + 23) < 0)
    goto LABEL_17;
  return a1;
}

void sub_20ABF2CAC(void ***a1)
{
  void **v2;
  void **v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  void **v7;

  v2 = *a1;
  v3 = a1[1];
  if (v3 != *a1)
  {
    do
    {
      if (*((char *)v3 - 9) < 0)
      {
        operator delete(*(v3 - 4));
        v4 = (std::__shared_weak_count *)*(v3 - 5);
        if (!v4)
          goto LABEL_11;
      }
      else
      {
        v4 = (std::__shared_weak_count *)*(v3 - 5);
        if (!v4)
          goto LABEL_11;
      }
      p_shared_owners = (unint64_t *)&v4->__shared_owners_;
      do
        v6 = __ldaxr(p_shared_owners);
      while (__stlxr(v6 - 1, p_shared_owners));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
        if ((*((char *)v3 - 49) & 0x80000000) == 0)
          goto LABEL_13;
LABEL_12:
        operator delete(*(v3 - 9));
        goto LABEL_13;
      }
LABEL_11:
      if (*((char *)v3 - 49) < 0)
        goto LABEL_12;
LABEL_13:
      v7 = v3 - 12;
      if (*((char *)v3 - 73) < 0)
        operator delete(*v7);
      v3 -= 12;
    }
    while (v7 != v2);
  }
  a1[1] = v2;
}

void sub_20ABF2D74(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    sub_20ABF2D74(*(_QWORD *)a1);
    sub_20ABF2D74(*(_QWORD *)(a1 + 8));
    v2 = *(_QWORD *)(a1 + 80);
    if (v2)
    {
      v3 = *(_QWORD *)(a1 + 88);
      v4 = *(void **)(a1 + 80);
      if (v3 != v2)
      {
        do
        {
          if (*(char *)(v3 - 1) < 0)
            operator delete(*(void **)(v3 - 24));
          v3 -= 24;
        }
        while (v3 != v2);
        v4 = *(void **)(a1 + 80);
      }
      *(_QWORD *)(a1 + 88) = v2;
      operator delete(v4);
    }
    if (*(char *)(a1 + 79) < 0)
    {
      operator delete(*(void **)(a1 + 56));
      if ((*(char *)(a1 + 55) & 0x80000000) == 0)
        goto LABEL_13;
    }
    else if ((*(char *)(a1 + 55) & 0x80000000) == 0)
    {
LABEL_13:
      operator delete((void *)a1);
      return;
    }
    operator delete(*(void **)(a1 + 32));
    goto LABEL_13;
  }
}

void cva::ProgramOptions::Private::registerCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t **v6;
  void *v7[2];
  uint64_t v8;
  __int128 __p;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 120);
  v3 = *(_QWORD *)(a1 + 128);
  if (v2 != v3)
  {
    while (!sub_20ABF2F60(v2, a2))
    {
      v2 += 96;
      if (v2 == v3)
        return;
    }
    v6 = (uint64_t **)(a1 + 96);
    if (*(char *)(v2 + 23) < 0)
    {
      sub_20AB88C14(v7, *(void **)v2, *(_QWORD *)(v2 + 8));
    }
    else
    {
      *(_OWORD *)v7 = *(_OWORD *)v2;
      v8 = *(_QWORD *)(v2 + 16);
    }
    if (*(char *)(v2 + 47) < 0)
    {
      sub_20AB88C14(&__p, *(void **)(v2 + 24), *(_QWORD *)(v2 + 32));
    }
    else
    {
      __p = *(_OWORD *)(v2 + 24);
      v10 = *(_QWORD *)(v2 + 40);
    }
    sub_20ABF3020(v6, v7, (uint64_t)v7);
    if ((SHIBYTE(v10) & 0x80000000) == 0)
    {
      if ((SHIBYTE(v8) & 0x80000000) == 0)
        return;
LABEL_15:
      operator delete(v7[0]);
      return;
    }
    operator delete((void *)__p);
    if (SHIBYTE(v8) < 0)
      goto LABEL_15;
  }
}

BOOL sub_20ABF2F60(uint64_t a1, uint64_t a2)
{
  _BOOL8 v4;
  void *v6[2];
  uint64_t v7;
  __int128 __p;
  uint64_t v9;

  if (*(char *)(a1 + 23) < 0)
  {
    sub_20AB88C14(v6, *(void **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)v6 = *(_OWORD *)a1;
    v7 = *(_QWORD *)(a1 + 16);
  }
  if (*(char *)(a1 + 47) < 0)
  {
    sub_20AB88C14(&__p, *(void **)(a1 + 24), *(_QWORD *)(a1 + 32));
  }
  else
  {
    __p = *(_OWORD *)(a1 + 24);
    v9 = *(_QWORD *)(a1 + 40);
  }
  v4 = sub_20ABF3208((unsigned __int8 *)v6, a2);
  if (SHIBYTE(v9) < 0)
  {
    operator delete((void *)__p);
    if ((SHIBYTE(v7) & 0x80000000) == 0)
      return v4;
LABEL_11:
    operator delete(v6[0]);
    return v4;
  }
  if (SHIBYTE(v7) < 0)
    goto LABEL_11;
  return v4;
}

char *sub_20ABF3020(uint64_t **a1, _QWORD *a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  char *v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    while (1)
    {
      while (1)
      {
        v8 = (char *)v5;
        v9 = v5 + 4;
        if (!sub_20ABF3128(a2, v5 + 4))
          break;
        v5 = *(uint64_t **)v8;
        v6 = (uint64_t **)v8;
        if (!*(_QWORD *)v8)
          goto LABEL_9;
      }
      if (!sub_20ABF3128(v9, a2))
        break;
      v6 = (uint64_t **)(v8 + 8);
      v5 = (uint64_t *)*((_QWORD *)v8 + 1);
      if (!v5)
        goto LABEL_9;
    }
  }
  else
  {
    v8 = (char *)(a1 + 1);
LABEL_9:
    v10 = v8;
    v8 = (char *)operator new(0x68uLL);
    *((_OWORD *)v8 + 2) = *(_OWORD *)a3;
    *((_QWORD *)v8 + 6) = *(_QWORD *)(a3 + 16);
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_OWORD *)(v8 + 56) = *(_OWORD *)(a3 + 24);
    v11 = *(_QWORD *)(a3 + 40);
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 24) = 0;
    *(_QWORD *)(a3 + 32) = 0;
    *(_QWORD *)(a3 + 40) = 0;
    *((_QWORD *)v8 + 9) = v11;
    *((_QWORD *)v8 + 10) = 0;
    *((_QWORD *)v8 + 11) = 0;
    *((_QWORD *)v8 + 12) = 0;
    *(_QWORD *)v8 = 0;
    *((_QWORD *)v8 + 1) = 0;
    *((_QWORD *)v8 + 2) = v10;
    *v6 = (uint64_t *)v8;
    v12 = (uint64_t *)v8;
    v13 = (uint64_t *)**a1;
    if (v13)
    {
      *a1 = v13;
      v12 = *v6;
    }
    sub_20AB96C04(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return v8;
}

uint64_t sub_20ABF3128(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  int v4;
  int v5;
  size_t v6;
  size_t v7;
  size_t v8;
  int v9;
  unsigned int v10;
  const void *v11;
  _QWORD *v12;
  const void *v13;
  int v14;
  const void *v15;
  _QWORD *v16;
  const void *v17;
  int v18;
  size_t v19;
  const void *v20;
  size_t v21;
  const void *v22;
  size_t v23;
  int v24;

  v2 = a2;
  v3 = a1;
  v4 = *((char *)a2 + 23);
  v5 = *((char *)a1 + 23);
  if (v5 >= 0)
    v6 = *((unsigned __int8 *)a1 + 23);
  else
    v6 = a1[1];
  if (v5 < 0)
    a1 = (_QWORD *)*a1;
  if (v4 >= 0)
    v7 = *((unsigned __int8 *)a2 + 23);
  else
    v7 = a2[1];
  if (v4 < 0)
    a2 = (_QWORD *)*a2;
  if (v7 >= v6)
    v8 = v6;
  else
    v8 = v7;
  v9 = memcmp(a1, a2, v8);
  if (v6 < v7)
    v10 = -1;
  else
    v10 = v7 < v6;
  if (v9)
    v10 = v9;
  if (!v10)
  {
    v13 = (const void *)v2[3];
    v12 = v2 + 3;
    v11 = v13;
    v14 = *((char *)v12 + 23);
    v17 = (const void *)v3[3];
    v16 = v3 + 3;
    v15 = v17;
    v18 = *((char *)v16 + 23);
    if (v18 >= 0)
      v19 = *((unsigned __int8 *)v16 + 23);
    else
      v19 = v16[1];
    if (v18 >= 0)
      v20 = v16;
    else
      v20 = v15;
    if (v14 >= 0)
      v21 = *((unsigned __int8 *)v12 + 23);
    else
      v21 = v12[1];
    if (v14 >= 0)
      v22 = v12;
    else
      v22 = v11;
    if (v21 >= v19)
      v23 = v19;
    else
      v23 = v21;
    v24 = memcmp(v20, v22, v23);
    if (v19 < v21)
      v10 = -1;
    else
      v10 = v21 < v19;
    if (v24)
      v10 = v24;
  }
  return v10 >> 31;
}

BOOL sub_20ABF3208(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;
  size_t v3;
  uint64_t v4;
  const void **v5;
  uint64_t v7;
  int v8;
  unsigned __int8 *v9;
  const void **v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  BOOL v24;
  _BOOL8 result;

  v2 = *(unsigned __int8 *)(a2 + 23);
  v3 = *(_QWORD *)(a2 + 8);
  if ((v2 & 0x80u) == 0)
    v4 = *(unsigned __int8 *)(a2 + 23);
  else
    v4 = *(_QWORD *)(a2 + 8);
  if (!v4)
    return 0;
  v5 = (const void **)a2;
  v7 = a1[23];
  v8 = (char)v7;
  if ((v7 & 0x80u) != 0)
    v7 = *((_QWORD *)a1 + 1);
  if (v4 == v7)
  {
    if (v8 >= 0)
      v9 = a1;
    else
      v9 = *(unsigned __int8 **)a1;
    if ((v2 & 0x80) != 0)
    {
      if (!memcmp(*v5, v9, v3))
        return 1;
    }
    else
    {
      if (!(_DWORD)v2)
        return 1;
      v10 = v5;
      v11 = v2;
      while (*(unsigned __int8 *)v10 == *v9)
      {
        v10 = (const void **)((char *)v10 + 1);
        ++v9;
        if (!--v11)
          return 1;
      }
    }
  }
  v12 = a1[47];
  v13 = (char)v12;
  if ((v12 & 0x80u) != 0)
    v12 = *((_QWORD *)a1 + 4);
  if (v4 != v12)
    return 0;
  v16 = (unsigned __int8 *)*((_QWORD *)a1 + 3);
  v15 = a1 + 24;
  v14 = v16;
  if (v13 >= 0)
    v17 = v15;
  else
    v17 = v14;
  if ((v2 & 0x80) != 0)
    return memcmp(*v5, v17, v3) == 0;
  if (!(_DWORD)v2)
    return 1;
  v18 = v2 - 1;
  do
  {
    v20 = *(unsigned __int8 *)v5;
    v5 = (const void **)((char *)v5 + 1);
    v19 = v20;
    v22 = *v17++;
    v21 = v22;
    v24 = v18-- != 0;
    result = v19 == v21;
  }
  while (v19 == v21 && v24);
  return result;
}

_BYTE *cva::ProgramOptions::Description::Option::key@<X0>(cva::ProgramOptions::Description::Option *this@<X0>, uint64_t a2@<X8>)
{
  _BYTE *result;

  if (*((char *)this + 23) < 0)
  {
    sub_20AB88C14((_BYTE *)a2, *(void **)this, *((_QWORD *)this + 1));
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)this;
    *(_QWORD *)(a2 + 16) = *((_QWORD *)this + 2);
  }
  result = (_BYTE *)(a2 + 24);
  if (*((char *)this + 47) < 0)
    return sub_20AB88C14(result, *((void **)this + 3), *((_QWORD *)this + 4));
  *(_OWORD *)result = *(_OWORD *)((char *)this + 24);
  *(_QWORD *)(a2 + 40) = *((_QWORD *)this + 5);
  return result;
}

void cva::ProgramOptions::Private::addValue(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t **v8;
  char *v9;
  char *v10;
  unint64_t v11;
  __int128 v12;
  char *v13;
  void *v14[2];
  uint64_t v15;
  __int128 __p;
  uint64_t v17;

  v3 = *(_QWORD *)(a1 + 120);
  v4 = *(_QWORD *)(a1 + 128);
  if (v3 != v4)
  {
    while (!sub_20ABF2F60(v3, a2))
    {
      v3 += 96;
      if (v3 == v4)
        return;
    }
    v8 = (uint64_t **)(a1 + 96);
    if (*(char *)(v3 + 23) < 0)
    {
      sub_20AB88C14(v14, *(void **)v3, *(_QWORD *)(v3 + 8));
    }
    else
    {
      *(_OWORD *)v14 = *(_OWORD *)v3;
      v15 = *(_QWORD *)(v3 + 16);
    }
    if (*(char *)(v3 + 47) < 0)
    {
      sub_20AB88C14(&__p, *(void **)(v3 + 24), *(_QWORD *)(v3 + 32));
    }
    else
    {
      __p = *(_OWORD *)(v3 + 24);
      v17 = *(_QWORD *)(v3 + 40);
    }
    v9 = sub_20ABF3020(v8, v14, (uint64_t)v14);
    v10 = v9;
    v11 = *((_QWORD *)v9 + 11);
    if (v11 >= *((_QWORD *)v9 + 12))
    {
      v13 = sub_20ABDB5B4((uint64_t)(v9 + 80), a3);
    }
    else
    {
      if (*(char *)(a3 + 23) < 0)
      {
        sub_20AB88C14(*((_BYTE **)v9 + 11), *(void **)a3, *(_QWORD *)(a3 + 8));
      }
      else
      {
        v12 = *(_OWORD *)a3;
        *(_QWORD *)(v11 + 16) = *(_QWORD *)(a3 + 16);
        *(_OWORD *)v11 = v12;
      }
      v13 = (char *)(v11 + 24);
    }
    *((_QWORD *)v10 + 11) = v13;
    if ((SHIBYTE(v17) & 0x80000000) == 0)
    {
      if ((SHIBYTE(v15) & 0x80000000) == 0)
        return;
LABEL_21:
      operator delete(v14[0]);
      return;
    }
    operator delete((void *)__p);
    if (SHIBYTE(v15) < 0)
      goto LABEL_21;
  }
}

void cva::ProgramOptions::Private::checkCommand(cva::ProgramOptions::Private *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v4;
  __int128 v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  size_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  BOOL v24;
  std::string *v25;
  std::string *v26;
  char *v27;
  int v28;
  uint64_t v29;
  size_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  unsigned __int8 *v35;
  unsigned __int8 *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t *v40;
  unsigned __int8 *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  unint64_t v50;
  char *v51;
  int v52;
  void **v53;
  uint64_t **v54;
  std::string __p;
  __int128 v56;
  uint64_t v57;
  std::string v58;

  v2 = *((_QWORD *)this + 15);
  v1 = *((_QWORD *)this + 16);
  if (v2 != v1)
  {
    v4 = (uint64_t *)((char *)this + 104);
    v53 = (void **)((char *)this + 72);
    v54 = (uint64_t **)((char *)this + 96);
    while (1)
    {
      v6 = *(char *)(v2 + 23) < 0 ? *(_QWORD *)(v2 + 8) : *(unsigned __int8 *)(v2 + 23);
      v7 = (unsigned __int8 *)(v6 ? v2 : v2 + 24);
      if (!*(_BYTE *)(v2 + 92))
        break;
      v8 = v7[23];
      v9 = *((_QWORD *)v7 + 1);
      if ((v8 & 0x80u) == 0)
        v10 = v7[23];
      else
        v10 = *((_QWORD *)v7 + 1);
      if (v10)
      {
        v11 = *v54;
        if (*v54 != v4)
        {
          do
          {
            v12 = *((unsigned __int8 *)v11 + 55);
            v13 = (char)v12;
            if ((v12 & 0x80u) != 0)
              v12 = v11[5];
            if (v10 == v12)
            {
              if (v13 >= 0)
                v14 = (unsigned __int8 *)(v11 + 4);
              else
                v14 = (unsigned __int8 *)v11[4];
              if ((v8 & 0x80) != 0)
              {
                if (!memcmp(*(const void **)v7, v14, v9))
                  goto LABEL_54;
              }
              else
              {
                if (!(_DWORD)v8)
                  goto LABEL_54;
                v15 = v7;
                v16 = v8;
                while (*v15 == *v14)
                {
                  ++v15;
                  ++v14;
                  if (!--v16)
                    goto LABEL_54;
                }
              }
            }
            v17 = *((unsigned __int8 *)v11 + 79);
            v18 = (char)v17;
            if ((v17 & 0x80u) != 0)
              v17 = v11[8];
            if (v10 == v17)
            {
              if (v18 >= 0)
                v19 = (unsigned __int8 *)(v11 + 7);
              else
                v19 = (unsigned __int8 *)v11[7];
              if ((v8 & 0x80) != 0)
              {
                if (!memcmp(*(const void **)v7, v19, v9))
                  goto LABEL_54;
              }
              else
              {
                if (!(_DWORD)v8)
                  goto LABEL_54;
                v20 = v7;
                v21 = v8;
                while (*v20 == *v19)
                {
                  ++v20;
                  ++v19;
                  if (!--v21)
                    goto LABEL_54;
                }
              }
            }
            v22 = (uint64_t *)v11[1];
            if (v22)
            {
              do
              {
                v23 = v22;
                v22 = (uint64_t *)*v22;
              }
              while (v22);
            }
            else
            {
              do
              {
                v23 = (uint64_t *)v11[2];
                v24 = *v23 == (_QWORD)v11;
                v11 = v23;
              }
              while (!v24);
            }
            v11 = v23;
          }
          while (v23 != v4);
        }
      }
      std::operator+<char>();
      v25 = std::string::append(&v58, " is required!");
      __p = *v25;
      v25->__r_.__value_.__r.__words[0] = 0;
      v25->__r_.__value_.__l.__size_ = 0;
      v25->__r_.__value_.__r.__words[2] = 0;
      v26 = (std::string *)*((_QWORD *)this + 10);
      if ((unint64_t)v26 >= *((_QWORD *)this + 11))
      {
        v27 = sub_20ABDF524(v53, (uint64_t)&__p);
        v28 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
        *((_QWORD *)this + 10) = v27;
        if (v28 < 0)
        {
          operator delete(__p.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v58.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            break;
        }
        else if ((SHIBYTE(v58.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          break;
        }
      }
      else
      {
        *v26 = __p;
        *((_QWORD *)this + 10) = v26 + 1;
        if ((SHIBYTE(v58.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          break;
      }
      operator delete(v58.__r_.__value_.__l.__data_);
      if ((*(_DWORD *)(v2 + 88) & 0x80000000) != 0)
        goto LABEL_4;
LABEL_55:
      v29 = v7[23];
      v30 = *((_QWORD *)v7 + 1);
      if ((v29 & 0x80u) == 0)
        v31 = v7[23];
      else
        v31 = *((_QWORD *)v7 + 1);
      if (!v31)
        goto LABEL_4;
      v32 = *v54;
      if (*v54 == v4)
        goto LABEL_4;
      while (1)
      {
        v33 = *((unsigned __int8 *)v32 + 55);
        v34 = (char)v33;
        if ((v33 & 0x80u) != 0)
          v33 = v32[5];
        if (v31 == v33)
        {
          if (v34 >= 0)
            v35 = (unsigned __int8 *)(v32 + 4);
          else
            v35 = (unsigned __int8 *)v32[4];
          if ((v29 & 0x80) != 0)
          {
            if (!memcmp(*(const void **)v7, v35, v30))
              goto LABEL_93;
          }
          else
          {
            if (!(_DWORD)v29)
              goto LABEL_93;
            v36 = v7;
            v37 = v29;
            while (*v36 == *v35)
            {
              ++v36;
              ++v35;
              if (!--v37)
                goto LABEL_93;
            }
          }
        }
        v38 = *((unsigned __int8 *)v32 + 79);
        v39 = (char)v38;
        if ((v38 & 0x80u) != 0)
          v38 = v32[8];
        if (v31 != v38)
          goto LABEL_86;
        v40 = v39 >= 0 ? v32 + 7 : (uint64_t *)v32[7];
        if ((v29 & 0x80) != 0)
          break;
        if (!(_DWORD)v29)
          goto LABEL_93;
        v41 = v7;
        v42 = v29;
        while (*v41 == *(unsigned __int8 *)v40)
        {
          ++v41;
          v40 = (uint64_t *)((char *)v40 + 1);
          if (!--v42)
            goto LABEL_93;
        }
LABEL_86:
        v43 = (uint64_t *)v32[1];
        if (v43)
        {
          do
          {
            v44 = v43;
            v43 = (uint64_t *)*v43;
          }
          while (v43);
        }
        else
        {
          do
          {
            v44 = (uint64_t *)v32[2];
            v24 = *v44 == (_QWORD)v32;
            v32 = v44;
          }
          while (!v24);
        }
        v32 = v44;
        if (v44 == v4)
          goto LABEL_4;
      }
      if (memcmp(*(const void **)v7, v40, v30))
        goto LABEL_86;
LABEL_93:
      if (*(char *)(v2 + 23) < 0)
      {
        sub_20AB88C14(&__p, *(void **)v2, *(_QWORD *)(v2 + 8));
        if (*(char *)(v2 + 47) < 0)
          goto LABEL_97;
LABEL_95:
        v56 = *(_OWORD *)(v2 + 24);
        v57 = *(_QWORD *)(v2 + 40);
      }
      else
      {
        __p = *(std::string *)v2;
        if ((*(char *)(v2 + 47) & 0x80000000) == 0)
          goto LABEL_95;
LABEL_97:
        sub_20AB88C14(&v56, *(void **)(v2 + 24), *(_QWORD *)(v2 + 32));
      }
      v45 = sub_20ABF3020(v54, &__p, (uint64_t)&__p);
      v47 = *((_QWORD *)v45 + 10);
      v46 = *((_QWORD *)v45 + 11);
      if (SHIBYTE(v57) < 0)
      {
        operator delete((void *)v56);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
LABEL_100:
          operator delete(__p.__r_.__value_.__l.__data_);
      }
      else if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        goto LABEL_100;
      }
      v48 = -1431655765 * ((unint64_t)(v46 - v47) >> 3);
      v49 = *(_DWORD *)(v2 + 88);
      if (v49 > v48 || v49 < v48)
      {
        std::operator+<char>();
        v50 = *((_QWORD *)this + 10);
        if (v50 < *((_QWORD *)this + 11))
        {
          v5 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          *(_QWORD *)(v50 + 16) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
          *(_OWORD *)v50 = v5;
          *((_QWORD *)this + 10) = v50 + 24;
        }
        else
        {
          v51 = sub_20ABDF524(v53, (uint64_t)&__p);
          v52 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
          *((_QWORD *)this + 10) = v51;
          if (v52 < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
LABEL_4:
      v2 += 96;
      if (v2 == v1)
        return;
    }
LABEL_54:
    if ((*(_DWORD *)(v2 + 88) & 0x80000000) != 0)
      goto LABEL_4;
    goto LABEL_55;
  }
}

BOOL cva::ProgramOptions::Private::hasCommand(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  _BOOL8 result;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  BOOL v9;

  v2 = *(unsigned __int8 *)(a2 + 23);
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (!v2)
    return 0;
  v3 = *(unsigned __int8 **)(a1 + 96);
  v4 = (unsigned __int8 *)(a1 + 104);
  if (v3 == (unsigned __int8 *)(a1 + 104))
    return 0;
  do
  {
    result = sub_20ABF3208(v3 + 32, a2);
    if (result)
      break;
    v7 = (unsigned __int8 *)*((_QWORD *)v3 + 1);
    if (v7)
    {
      do
      {
        v8 = v7;
        v7 = *(unsigned __int8 **)v7;
      }
      while (v7);
    }
    else
    {
      do
      {
        v8 = (unsigned __int8 *)*((_QWORD *)v3 + 2);
        v9 = *(_QWORD *)v8 == (_QWORD)v3;
        v3 = v8;
      }
      while (!v9);
    }
    v3 = v8;
  }
  while (v8 != v4);
  return result;
}

uint64_t *cva::ProgramOptions::Private::getValues(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  BOOL v7;
  unsigned __int8 v8;
  uint64_t *v9;

  v2 = *(unsigned __int8 **)(a1 + 96);
  v3 = (unsigned __int8 *)(a1 + 104);
  if (v2 == (unsigned __int8 *)(a1 + 104))
  {
LABEL_11:
    v8 = atomic_load((unsigned __int8 *)&qword_2546165D8);
    if ((v8 & 1) != 0)
    {
      return &qword_2546165C0;
    }
    else
    {
      v9 = &qword_2546165C0;
      if (__cxa_guard_acquire(&qword_2546165D8))
      {
        qword_2546165C0 = 0;
        *(_QWORD *)algn_2546165C8 = 0;
        qword_2546165D0 = 0;
        __cxa_atexit((void (*)(void *))sub_20ABF3B94, &qword_2546165C0, &dword_20AB80000);
        __cxa_guard_release(&qword_2546165D8);
      }
    }
  }
  else
  {
    while (!sub_20ABF3208(v2 + 32, a2))
    {
      v5 = (unsigned __int8 *)*((_QWORD *)v2 + 1);
      if (v5)
      {
        do
        {
          v6 = v5;
          v5 = *(unsigned __int8 **)v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          v6 = (unsigned __int8 *)*((_QWORD *)v2 + 2);
          v7 = *(_QWORD *)v6 == (_QWORD)v2;
          v2 = v6;
        }
        while (!v7);
      }
      v2 = v6;
      if (v6 == v3)
        goto LABEL_11;
    }
    return (uint64_t *)(v2 + 80);
  }
  return v9;
}

void **sub_20ABF3B94(void **a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0)
          operator delete(*(v3 - 3));
        v3 -= 3;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

uint64_t cva::ProgramOptions::areUnregisteredCommandsAllowed(cva::ProgramOptions *this)
{
  return *(unsigned __int8 *)(*(_QWORD *)this + 144);
}

uint64_t cva::ProgramOptions::setUnregisteredCommandsAllowed(uint64_t this, char a2)
{
  *(_BYTE *)(*(_QWORD *)this + 144) = a2;
  return this;
}

uint64_t cva::ProgramOptions::parseCommands(cva::ProgramOptions *this, int a2, const char *const *a3, __int128 **a4, char a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t *v12;
  _QWORD *v13;
  uint64_t v14;
  __int128 *v15;
  __int128 *v16;
  unint64_t v17;
  uint64_t v18;
  std::string *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  char *v24;
  __int128 *v25;
  std::string *v26;
  std::string *v27;
  std::string *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  size_t v33;
  size_t v34;
  char **p_dst;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char **v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  std::string::size_type v44;
  std::string::size_type v45;
  std::locale::__imp *locale;
  unsigned __int8 *v47;
  std::string *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 *v51;
  uint64_t v52;
  std::string *v53;
  int v54;
  int v55;
  int v56;
  int v57;
  BOOL v58;
  char v59;
  BOOL v60;
  char **v61;
  std::string::size_type v62;
  uint64_t v63;
  std::string *v64;
  std::string::size_type v65;
  std::string *v66;
  std::string::size_type v67;
  std::string *v68;
  unint64_t v69;
  char *v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  std::string::size_type v75;
  std::string::size_type v76;
  std::locale::__imp *v77;
  unsigned __int8 *v78;
  std::string *v79;
  uint64_t v80;
  uint64_t v81;
  __int128 *v82;
  uint64_t v83;
  std::string *v84;
  int v85;
  int v86;
  int v87;
  int v88;
  char v89;
  BOOL v90;
  std::string *v91;
  std::string::size_type v92;
  const std::string::value_type *v93;
  std::string::size_type v94;
  std::string *v95;
  unint64_t v96;
  char *v97;
  char *v98;
  int v99;
  std::string::size_type v100;
  std::string *p_p;
  uint64_t v102;
  uint64_t v103;
  std::string::size_type v104;
  std::__shared_weak_count *size;
  unint64_t *p_shared_owners;
  unint64_t v107;
  void **p_data;
  cva::ProgramOptions::Private *v109;
  unsigned __int8 *v110;
  unsigned __int8 *v111;
  unsigned __int8 *v112;
  BOOL v113;
  uint64_t v114;
  _QWORD *v115;
  const std::locale::facet *v116;
  uint64_t v117;
  uint64_t v118;
  std::locale::id *v119;
  int v120;
  uint64_t v121;
  uint64_t v122;
  const std::locale::facet *v123;
  int v124;
  int v125;
  uint64_t v127;
  uint64_t v128;
  const cva::ProgramOptions::Description *v129;
  std::string v131;
  std::string v132;
  std::string __p;
  char *__dst;
  unint64_t v135;
  int64_t v136;
  std::string v137;
  std::locale v138[2];
  int64_t v139;
  __int128 v140;
  uint64_t v141;

  v9 = *(_QWORD *)this;
  v10 = *(_QWORD *)(*(_QWORD *)this + 72);
  for (i = *(_QWORD *)(*(_QWORD *)this + 80); i != v10; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  *(_QWORD *)(v9 + 80) = v10;
  v12 = (uint64_t *)(*(_QWORD *)this + 104);
  sub_20ABF2D74(*v12);
  *(v12 - 1) = (uint64_t)v12;
  *v12 = 0;
  v12[1] = 0;
  v13 = *(_QWORD **)this;
  v14 = *(_QWORD *)this + 120;
  if ((__int128 **)v14 != a4)
  {
    v16 = *a4;
    v15 = a4[1];
    v17 = 0xAAAAAAAAAAAAAAABLL * (((char *)v15 - (char *)*a4) >> 5);
    v18 = v13[17];
    v19 = (std::string *)v13[15];
    if (0xAAAAAAAAAAAAAAABLL * ((v18 - (uint64_t)v19) >> 5) < v17)
    {
      if (v19)
      {
        sub_20ABF2CAC((void ***)(*(_QWORD *)this + 120));
        operator delete(*(void **)v14);
        v18 = 0;
        *(_QWORD *)v14 = 0;
        *(_QWORD *)(v14 + 8) = 0;
        *(_QWORD *)(v14 + 16) = 0;
      }
      if (v17 > 0x2AAAAAAAAAAAAAALL)
        goto LABEL_262;
      v20 = 0xAAAAAAAAAAAAAAABLL * (v18 >> 5);
      v21 = 2 * v20;
      if (2 * v20 <= v17)
        v21 = v17;
      v22 = v20 >= 0x155555555555555 ? 0x2AAAAAAAAAAAAAALL : v21;
      if (v22 > 0x2AAAAAAAAAAAAAALL)
LABEL_262:
        abort();
      v23 = 96 * v22;
      v24 = (char *)operator new(96 * v22);
      v13[15] = v24;
      v13[16] = v24;
      v13[17] = &v24[v23];
      v25 = v16;
      goto LABEL_20;
    }
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v13[16] - (_QWORD)v19) >> 5) < v17)
    {
      v26 = (std::string *)&v16[2 * ((uint64_t)(v13[16] - (_QWORD)v19) >> 5)];
      sub_20ABF5454((std::string *)*a4, v26, v19);
      v24 = (char *)v13[16];
      v25 = (__int128 *)v26;
LABEL_20:
      v13[16] = sub_20ABF5530(v25, v15, v24);
      goto LABEL_23;
    }
    v27 = sub_20ABF5454((std::string *)*a4, (std::string *)a4[1], v19);
    v28 = (std::string *)v13[16];
    if (v28 == v27)
    {
LABEL_22:
      v13[16] = v27;
      goto LABEL_23;
    }
    while (1)
    {
      if (v28[-1].__r_.__value_.__s.__data_[15] < 0)
      {
        operator delete((void *)v28[-2].__r_.__value_.__r.__words[2]);
        size = (std::__shared_weak_count *)v28[-2].__r_.__value_.__l.__size_;
        if (!size)
          goto LABEL_226;
      }
      else
      {
        size = (std::__shared_weak_count *)v28[-2].__r_.__value_.__l.__size_;
        if (!size)
          goto LABEL_226;
      }
      p_shared_owners = (unint64_t *)&size->__shared_owners_;
      do
        v107 = __ldaxr(p_shared_owners);
      while (__stlxr(v107 - 1, p_shared_owners));
      if (!v107)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
        if ((SHIBYTE(v28[-3].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_228;
LABEL_227:
        operator delete(v28[-3].__r_.__value_.__l.__data_);
        goto LABEL_228;
      }
LABEL_226:
      if (SHIBYTE(v28[-3].__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_227;
LABEL_228:
      p_data = (void **)&v28[-4].__r_.__value_.__l.__data_;
      if (SHIBYTE(v28[-4].__r_.__value_.__r.__words[2]) < 0)
        operator delete(*p_data);
      v28 -= 4;
      if (p_data == (void **)v27)
        goto LABEL_22;
    }
  }
LABEL_23:
  v129 = (const cva::ProgramOptions::Description *)a4;
  memset(&v137, 0, sizeof(v137));
  if (a2 >= 2)
  {
    v29 = 0;
    v30 = a2;
    v31 = 1;
    while (1)
    {
      v32 = a3[v31];
      v33 = strlen(v32);
      if (v33 > 0x7FFFFFFFFFFFFFF7)
        goto LABEL_262;
      v34 = v33;
      if (v33 >= 0x17)
        break;
      HIBYTE(v136) = v33;
      p_dst = &__dst;
      if (v33)
        goto LABEL_34;
LABEL_35:
      *((_BYTE *)p_dst + v34) = 0;
      v38 = HIBYTE(v136);
      if (v136 < 0)
      {
        if (v135 != 2)
        {
          if (v135 <= 2)
            goto LABEL_99;
          v61 = (char **)__dst;
LABEL_98:
          if (*(_WORD *)v61 != 11565)
          {
LABEL_99:
            memset(&__p, 0, sizeof(__p));
LABEL_100:
            if (v29)
            {
              v62 = HIBYTE(v137.__r_.__value_.__r.__words[2]);
              if ((v137.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v62 = v137.__r_.__value_.__l.__size_;
              if (!v62)
                goto LABEL_213;
              cva::ProgramOptions::Private::addValue(*(_QWORD *)this, (uint64_t)&v137, (uint64_t)&__dst);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                goto LABEL_25;
LABEL_214:
              if ((SHIBYTE(v136) & 0x80000000) == 0)
                goto LABEL_26;
LABEL_215:
              operator delete(__dst);
              goto LABEL_26;
            }
            v63 = *(_QWORD *)this;
            std::operator+<char>();
            v64 = std::string::append(&v131, " while parsing command ");
            v65 = v64->__r_.__value_.__r.__words[2];
            *(_OWORD *)&v132.__r_.__value_.__l.__data_ = *(_OWORD *)&v64->__r_.__value_.__l.__data_;
            v132.__r_.__value_.__r.__words[2] = v65;
            v64->__r_.__value_.__l.__size_ = 0;
            v64->__r_.__value_.__r.__words[2] = 0;
            v64->__r_.__value_.__r.__words[0] = 0;
            if ((v137.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v66 = &v137;
            else
              v66 = (std::string *)v137.__r_.__value_.__r.__words[0];
            if ((v137.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v67 = HIBYTE(v137.__r_.__value_.__r.__words[2]);
            else
              v67 = v137.__r_.__value_.__l.__size_;
            v68 = std::string::append(&v132, (const std::string::value_type *)v66, v67);
            *(_OWORD *)&v138[0].__locale_ = *(_OWORD *)&v68->__r_.__value_.__l.__data_;
            v139 = v68->__r_.__value_.__r.__words[2];
            v68->__r_.__value_.__r.__words[0] = 0;
            v68->__r_.__value_.__l.__size_ = 0;
            v68->__r_.__value_.__r.__words[2] = 0;
            v69 = *(_QWORD *)(v63 + 80);
            if (v69 >= *(_QWORD *)(v63 + 88))
            {
              v70 = sub_20ABDF524((void **)(v63 + 72), (uint64_t)v138);
              v71 = SHIBYTE(v139);
              *(_QWORD *)(v63 + 80) = v70;
              if (v71 < 0)
              {
                operator delete(v138[0].__locale_);
                if ((SHIBYTE(v132.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  goto LABEL_118;
              }
              else if ((SHIBYTE(v132.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
                goto LABEL_118;
              }
LABEL_114:
              operator delete(v132.__r_.__value_.__l.__data_);
              if ((SHIBYTE(v131.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
LABEL_119:
                v29 = 0;
                if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  goto LABEL_214;
                goto LABEL_25;
              }
            }
            else
            {
              *(_OWORD *)v69 = *(_OWORD *)&v138[0].__locale_;
              *(_QWORD *)(v69 + 16) = v139;
              *(_QWORD *)(v63 + 80) = v69 + 24;
              if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0)
                goto LABEL_114;
LABEL_118:
              if ((SHIBYTE(v131.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                goto LABEL_119;
            }
            operator delete(v131.__r_.__value_.__l.__data_);
            goto LABEL_119;
          }
          if (v136 < 0)
          {
            v38 = v135;
            if (v135 < 2)
              goto LABEL_262;
            v97 = __dst + 2;
          }
          else
          {
            v97 = (char *)&__dst + 2;
          }
          v100 = v38 - 2;
          if (v38 - 2 > 0x7FFFFFFFFFFFFFF7)
            goto LABEL_262;
          if (v100 >= 0x17)
          {
            v102 = (v100 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v100 | 7) != 0x17)
              v102 = v100 | 7;
            v103 = v102 + 1;
            p_p = (std::string *)operator new(v102 + 1);
            __p.__r_.__value_.__l.__size_ = v100;
            __p.__r_.__value_.__r.__words[2] = v103 | 0x8000000000000000;
            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)p_p;
          }
          else
          {
            *((_BYTE *)&__p.__r_.__value_.__s + 23) = v38 - 2;
            p_p = &__p;
            if (v38 == 2)
            {
LABEL_207:
              p_p->__r_.__value_.__s.__data_[v100] = 0;
              v104 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v104 = __p.__r_.__value_.__l.__size_;
              if (!v104)
                goto LABEL_100;
              goto LABEL_42;
            }
          }
          memmove(p_p, v97, v100);
          goto LABEL_207;
        }
        v39 = (char **)__dst;
        if (*__dst != 45)
          goto LABEL_99;
      }
      else
      {
        if (HIBYTE(v136) != 2)
        {
          if (HIBYTE(v136) <= 2u)
            goto LABEL_99;
          v61 = &__dst;
          goto LABEL_98;
        }
        if (__dst != 45)
          goto LABEL_99;
        v39 = &__dst;
      }
      *((_BYTE *)&__p.__r_.__value_.__s + 23) = 1;
      LOWORD(__p.__r_.__value_.__l.__data_) = *((unsigned __int8 *)v39 + 1);
LABEL_42:
      v40 = *(_QWORD *)this;
      v41 = *(_QWORD *)(*(_QWORD *)this + 120);
      v42 = *(_QWORD *)(*(_QWORD *)this + 128);
      if (v41 == v42)
        goto LABEL_173;
      while (1)
      {
        if (*(char *)(v41 + 23) < 0)
        {
          sub_20AB88C14(v138, *(void **)v41, *(_QWORD *)(v41 + 8));
          if ((*(char *)(v41 + 47) & 0x80000000) == 0)
          {
LABEL_45:
            v140 = *(_OWORD *)(v41 + 24);
            v141 = *(_QWORD *)(v41 + 40);
            goto LABEL_48;
          }
        }
        else
        {
          *(_OWORD *)&v138[0].__locale_ = *(_OWORD *)v41;
          v139 = *(_QWORD *)(v41 + 16);
          if ((*(char *)(v41 + 47) & 0x80000000) == 0)
            goto LABEL_45;
        }
        sub_20AB88C14(&v140, *(void **)(v41 + 24), *(_QWORD *)(v41 + 32));
LABEL_48:
        v43 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        v44 = __p.__r_.__value_.__l.__size_;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v45 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          v45 = __p.__r_.__value_.__l.__size_;
        if (!v45)
          goto LABEL_83;
        locale = (std::locale::__imp *)HIBYTE(v139);
        if (v139 < 0)
          locale = v138[1].__locale_;
        if ((std::locale::__imp *)v45 == locale)
        {
          if (v139 >= 0)
            v47 = (unsigned __int8 *)v138;
          else
            v47 = (unsigned __int8 *)v138[0].__locale_;
          if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
          {
            if (!memcmp(__p.__r_.__value_.__l.__data_, v47, __p.__r_.__value_.__l.__size_))
            {
LABEL_88:
              v60 = 1;
              if ((SHIBYTE(v141) & 0x80000000) == 0)
                goto LABEL_80;
              goto LABEL_84;
            }
          }
          else
          {
            if (!*((_BYTE *)&__p.__r_.__value_.__s + 23))
              goto LABEL_88;
            v48 = &__p;
            v49 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            while (v48->__r_.__value_.__s.__data_[0] == *v47)
            {
              v48 = (std::string *)((char *)v48 + 1);
              ++v47;
              if (!--v49)
                goto LABEL_88;
            }
          }
        }
        v50 = HIBYTE(v141);
        if (v141 < 0)
          v50 = *((_QWORD *)&v140 + 1);
        if (v45 != v50)
        {
LABEL_83:
          v60 = 0;
          if ((SHIBYTE(v141) & 0x80000000) == 0)
            goto LABEL_80;
          goto LABEL_84;
        }
        v51 = v141 >= 0 ? &v140 : (__int128 *)v140;
        if ((v43 & 0x80) != 0)
        {
          v60 = memcmp(__p.__r_.__value_.__l.__data_, v51, v44) == 0;
          if ((SHIBYTE(v141) & 0x80000000) == 0)
            goto LABEL_80;
        }
        else if ((_DWORD)v43)
        {
          v52 = v43 - 1;
          v53 = &__p;
          do
          {
            v55 = v53->__r_.__value_.__s.__data_[0];
            v53 = (std::string *)((char *)v53 + 1);
            v54 = v55;
            v57 = *(unsigned __int8 *)v51;
            v51 = (__int128 *)((char *)v51 + 1);
            v56 = v57;
            v58 = v52-- != 0;
            v59 = v58;
            v60 = v54 == v56;
          }
          while (v54 == v56 && (v59 & 1) != 0);
          if ((SHIBYTE(v141) & 0x80000000) == 0)
          {
LABEL_80:
            if ((SHIBYTE(v139) & 0x80000000) == 0)
              goto LABEL_81;
            goto LABEL_85;
          }
        }
        else
        {
          v60 = 1;
          if ((SHIBYTE(v141) & 0x80000000) == 0)
            goto LABEL_80;
        }
LABEL_84:
        operator delete((void *)v140);
        if ((SHIBYTE(v139) & 0x80000000) == 0)
        {
LABEL_81:
          if (v60)
            break;
          goto LABEL_86;
        }
LABEL_85:
        operator delete(v138[0].__locale_);
        if (v60)
          break;
LABEL_86:
        v41 += 96;
        if (v41 == v42)
        {
          v40 = *(_QWORD *)this;
LABEL_173:
          if (*(_BYTE *)(v40 + 144))
            goto LABEL_193;
          std::operator+<char>();
          v91 = std::string::append(&v131, " while parsing token ");
          v92 = v91->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v132.__r_.__value_.__l.__data_ = *(_OWORD *)&v91->__r_.__value_.__l.__data_;
          v132.__r_.__value_.__r.__words[2] = v92;
          v91->__r_.__value_.__l.__size_ = 0;
          v91->__r_.__value_.__r.__words[2] = 0;
          v91->__r_.__value_.__r.__words[0] = 0;
          if (v136 >= 0)
            v93 = (const std::string::value_type *)&__dst;
          else
            v93 = __dst;
          if (v136 >= 0)
            v94 = HIBYTE(v136);
          else
            v94 = v135;
          v95 = std::string::append(&v132, v93, v94);
          *(_OWORD *)&v138[0].__locale_ = *(_OWORD *)&v95->__r_.__value_.__l.__data_;
          v139 = v95->__r_.__value_.__r.__words[2];
          v95->__r_.__value_.__r.__words[0] = 0;
          v95->__r_.__value_.__l.__size_ = 0;
          v95->__r_.__value_.__r.__words[2] = 0;
          v96 = *(_QWORD *)(v40 + 80);
          if (v96 >= *(_QWORD *)(v40 + 88))
          {
            v98 = sub_20ABDF524((void **)(v40 + 72), (uint64_t)v138);
            v99 = SHIBYTE(v139);
            *(_QWORD *)(v40 + 80) = v98;
            if (v99 < 0)
            {
              operator delete(v138[0].__locale_);
              if ((SHIBYTE(v132.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                goto LABEL_192;
            }
            else if ((SHIBYTE(v132.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
              goto LABEL_192;
            }
LABEL_182:
            operator delete(v132.__r_.__value_.__l.__data_);
            if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0)
              goto LABEL_183;
LABEL_193:
            if ((SHIBYTE(v137.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              goto LABEL_194;
LABEL_184:
            *v137.__r_.__value_.__l.__data_ = 0;
            v137.__r_.__value_.__l.__size_ = 0;
          }
          else
          {
            *(_OWORD *)v96 = *(_OWORD *)&v138[0].__locale_;
            *(_QWORD *)(v96 + 16) = v139;
            *(_QWORD *)(v40 + 80) = v96 + 24;
            if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0)
              goto LABEL_182;
LABEL_192:
            if ((SHIBYTE(v131.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              goto LABEL_193;
LABEL_183:
            operator delete(v131.__r_.__value_.__l.__data_);
            if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
              goto LABEL_184;
LABEL_194:
            v137.__r_.__value_.__s.__data_[0] = 0;
            *((_BYTE *)&v137.__r_.__value_.__s + 23) = 0;
          }
          v29 = -1;
          if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_214;
          goto LABEL_25;
        }
      }
      v72 = *(_QWORD *)(*(_QWORD *)this + 120);
      v73 = *(_QWORD *)(*(_QWORD *)this + 128);
      if (v72 == v73)
      {
LABEL_187:
        v29 = 0;
        goto LABEL_212;
      }
      while (2)
      {
        if (*(char *)(v72 + 23) < 0)
        {
          sub_20AB88C14(v138, *(void **)v72, *(_QWORD *)(v72 + 8));
          if (*(char *)(v72 + 47) < 0)
            goto LABEL_126;
LABEL_124:
          v140 = *(_OWORD *)(v72 + 24);
          v141 = *(_QWORD *)(v72 + 40);
        }
        else
        {
          *(_OWORD *)&v138[0].__locale_ = *(_OWORD *)v72;
          v139 = *(_QWORD *)(v72 + 16);
          if ((*(char *)(v72 + 47) & 0x80000000) == 0)
            goto LABEL_124;
LABEL_126:
          sub_20AB88C14(&v140, *(void **)(v72 + 24), *(_QWORD *)(v72 + 32));
        }
        v74 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        v75 = __p.__r_.__value_.__l.__size_;
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v76 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          v76 = __p.__r_.__value_.__l.__size_;
        if (!v76)
          goto LABEL_162;
        v77 = (std::locale::__imp *)HIBYTE(v139);
        if (v139 < 0)
          v77 = v138[1].__locale_;
        if ((std::locale::__imp *)v76 != v77)
          goto LABEL_144;
        if (v139 >= 0)
          v78 = (unsigned __int8 *)v138;
        else
          v78 = (unsigned __int8 *)v138[0].__locale_;
        if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
        {
          if (memcmp(__p.__r_.__value_.__l.__data_, v78, __p.__r_.__value_.__l.__size_))
            goto LABEL_144;
LABEL_167:
          v90 = 1;
          if ((SHIBYTE(v141) & 0x80000000) == 0)
            goto LABEL_159;
LABEL_163:
          operator delete((void *)v140);
          if ((SHIBYTE(v139) & 0x80000000) == 0)
            goto LABEL_160;
          goto LABEL_164;
        }
        if (!*((_BYTE *)&__p.__r_.__value_.__s + 23))
          goto LABEL_167;
        v79 = &__p;
        v80 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        while (v79->__r_.__value_.__s.__data_[0] == *v78)
        {
          v79 = (std::string *)((char *)v79 + 1);
          ++v78;
          if (!--v80)
            goto LABEL_167;
        }
LABEL_144:
        v81 = HIBYTE(v141);
        if (v141 < 0)
          v81 = *((_QWORD *)&v140 + 1);
        if (v76 != v81)
        {
LABEL_162:
          v90 = 0;
          if ((SHIBYTE(v141) & 0x80000000) == 0)
            goto LABEL_159;
          goto LABEL_163;
        }
        if (v141 >= 0)
          v82 = &v140;
        else
          v82 = (__int128 *)v140;
        if ((v74 & 0x80) != 0)
        {
          v90 = memcmp(__p.__r_.__value_.__l.__data_, v82, v75) == 0;
          if ((SHIBYTE(v141) & 0x80000000) == 0)
            goto LABEL_159;
          goto LABEL_163;
        }
        if (!(_DWORD)v74)
        {
          v90 = 1;
          if ((SHIBYTE(v141) & 0x80000000) == 0)
            goto LABEL_159;
          goto LABEL_163;
        }
        v83 = v74 - 1;
        v84 = &__p;
        do
        {
          v86 = v84->__r_.__value_.__s.__data_[0];
          v84 = (std::string *)((char *)v84 + 1);
          v85 = v86;
          v88 = *(unsigned __int8 *)v82;
          v82 = (__int128 *)((char *)v82 + 1);
          v87 = v88;
          v58 = v83-- != 0;
          v89 = v58;
          v90 = v85 == v87;
        }
        while (v85 == v87 && (v89 & 1) != 0);
        if (SHIBYTE(v141) < 0)
          goto LABEL_163;
LABEL_159:
        if ((SHIBYTE(v139) & 0x80000000) == 0)
        {
LABEL_160:
          if (v90)
            break;
          goto LABEL_165;
        }
LABEL_164:
        operator delete(v138[0].__locale_);
        if (!v90)
        {
LABEL_165:
          v72 += 96;
          if (v72 == v73)
            goto LABEL_187;
          continue;
        }
        break;
      }
      v29 = *(_DWORD *)(v72 + 88);
LABEL_212:
      std::string::operator=(&v137, &__p);
      cva::ProgramOptions::Private::registerCommand(*(_QWORD *)this, (uint64_t)&__p);
LABEL_213:
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_214;
LABEL_25:
      operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v136) < 0)
        goto LABEL_215;
LABEL_26:
      if (++v31 == v30)
        goto LABEL_232;
    }
    v36 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v33 | 7) != 0x17)
      v36 = v33 | 7;
    v37 = v36 + 1;
    p_dst = (char **)operator new(v36 + 1);
    v135 = v34;
    v136 = v37 | 0x8000000000000000;
    __dst = (char *)p_dst;
LABEL_34:
    memmove(p_dst, v32, v34);
    goto LABEL_35;
  }
LABEL_232:
  v109 = *(cva::ProgramOptions::Private **)this;
  if ((a5 & 1) != 0)
  {
    HIBYTE(v139) = 4;
    strcpy((char *)v138, "help");
    v110 = (unsigned __int8 *)*((_QWORD *)v109 + 12);
    if (v110 != (unsigned __int8 *)((char *)v109 + 104))
    {
      while (!sub_20ABF3208(v110 + 32, (uint64_t)v138))
      {
        v111 = (unsigned __int8 *)*((_QWORD *)v110 + 1);
        if (v111)
        {
          do
          {
            v112 = v111;
            v111 = *(unsigned __int8 **)v111;
          }
          while (v111);
        }
        else
        {
          do
          {
            v112 = (unsigned __int8 *)*((_QWORD *)v110 + 2);
            v113 = *(_QWORD *)v112 == (_QWORD)v110;
            v110 = v112;
          }
          while (!v113);
        }
        v110 = v112;
        if (v112 == (unsigned __int8 *)((char *)v109 + 104))
          goto LABEL_243;
      }
      cva::ProgramOptions::display_help((uint64_t **)this, v129);
      v114 = *(_QWORD *)this;
      v127 = *(_QWORD *)(*(_QWORD *)this + 72);
      v128 = *(_QWORD *)(*(_QWORD *)this + 80);
      v125 = 1;
      if (v127 != v128)
      {
        v124 = 0;
        if ((SHIBYTE(v137.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          return v124 & (v125 ^ 1u);
        goto LABEL_254;
      }
LABEL_257:
      cva::ProgramOptions::Description::set_default_arguments((uint64_t *)(v114 + 120), (uint64_t **)(v114 + 96));
      v124 = 1;
      if ((SHIBYTE(v137.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        return v124 & (v125 ^ 1u);
      goto LABEL_254;
    }
  }
LABEL_243:
  cva::ProgramOptions::Private::checkCommand(v109);
  v114 = *(_QWORD *)this;
  if (*(_QWORD *)(*(_QWORD *)this + 72) == *(_QWORD *)(*(_QWORD *)this + 80))
  {
    v125 = 0;
    goto LABEL_257;
  }
  v115 = (_QWORD *)MEMORY[0x24BEDB318];
  sub_20AB89270(MEMORY[0x24BEDB318], (uint64_t)"Could not parse commandline:", 28);
  std::ios_base::getloc((const std::ios_base *)((char *)v115 + *(_QWORD *)(*v115 - 24)));
  v116 = std::locale::use_facet(v138, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v116->__vftable[2].~facet_0)(v116, 10);
  std::locale::~locale(v138);
  std::ostream::put();
  std::ostream::flush();
  v117 = *(_QWORD *)(*(_QWORD *)this + 72);
  v118 = *(_QWORD *)(*(_QWORD *)this + 80);
  if (v117 != v118)
  {
    v119 = (std::locale::id *)MEMORY[0x24BEDB350];
    do
    {
      v120 = *(char *)(v117 + 23);
      if (v120 >= 0)
        v121 = v117;
      else
        v121 = *(_QWORD *)v117;
      if (v120 >= 0)
        v122 = *(unsigned __int8 *)(v117 + 23);
      else
        v122 = *(_QWORD *)(v117 + 8);
      sub_20AB89270(v115, v121, v122);
      std::ios_base::getloc((const std::ios_base *)((char *)v115 + *(_QWORD *)(*v115 - 24)));
      v123 = std::locale::use_facet(v138, v119);
      ((void (*)(const std::locale::facet *, uint64_t))v123->__vftable[2].~facet_0)(v123, 10);
      std::locale::~locale(v138);
      std::ostream::put();
      std::ostream::flush();
      v117 += 24;
    }
    while (v117 != v118);
  }
  v124 = 0;
  v125 = 0;
  if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
LABEL_254:
    operator delete(v137.__r_.__value_.__l.__data_);
  return v124 & (v125 ^ 1u);
}

uint64_t *cva::ProgramOptions::display_help(uint64_t **this, const cva::ProgramOptions::Description *a2)
{
  uint64_t *v4;
  _QWORD *v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _BYTE *v10;
  _BYTE *v11;
  _BYTE *v12;
  int v13;
  std::locale::id *v14;
  const std::locale::facet *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  const std::locale::facet *v24;
  const std::locale::facet *v25;
  unint64_t v26;
  _BYTE *v27;
  const void *v28;
  size_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  std::locale::id *v33;
  const std::locale::facet *v34;
  void **v35;
  uint64_t v36;
  const std::locale::facet *v37;
  const std::locale::facet *v38;
  const std::locale::facet *v39;
  size_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  std::locale::id *v45;
  const std::locale::facet *v46;
  void **v47;
  uint64_t v48;
  const std::locale::facet *v49;
  const std::locale::facet *v50;
  void *__p[2];
  int64_t v52;
  std::locale v53;

  v4 = *this;
  v5 = *this + 6;
  v6 = *((unsigned __int8 *)*this + 71);
  if (*((char *)*this + 71) < 0)
  {
    v7 = v4[6];
    v8 = v4[7];
  }
  else
  {
    v7 = (uint64_t)(*this + 6);
    v8 = *((unsigned __int8 *)*this + 71);
  }
  v9 = (_QWORD *)MEMORY[0x24BEDB318];
  if (!v8)
  {
LABEL_8:
    v12 = 0;
    v13 = 1;
    goto LABEL_9;
  }
  v10 = (_BYTE *)(v7 + v8);
  v11 = (_BYTE *)v7;
  while (*v11 != 10)
  {
    ++v11;
    if (!--v8)
      goto LABEL_8;
  }
  v12 = 0;
  v13 = 1;
  if (v11 != v10)
  {
    v27 = &v11[-v7];
    if (&v11[-v7] != (_BYTE *)-1)
    {
      if ((v6 & 0x80) != 0)
      {
        v28 = (const void *)v4[6];
        v6 = v4[7];
      }
      else
      {
        v28 = *this + 6;
      }
      if (v6 >= (unint64_t)v27)
        v41 = (size_t)&v11[-v7];
      else
        v41 = v6;
      if (v41 > 0x7FFFFFFFFFFFFFF7)
LABEL_77:
        abort();
      if (v41 >= 0x17)
      {
        v43 = (v41 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v41 | 7) != 0x17)
          v43 = v41 | 7;
        v44 = v43 + 1;
        v42 = operator new(v43 + 1);
        __p[1] = (void *)v41;
        v52 = v44 | 0x8000000000000000;
        __p[0] = v42;
      }
      else
      {
        HIBYTE(v52) = v41;
        v42 = __p;
        if (!v41)
          goto LABEL_68;
      }
      memmove(v42, v28, v41);
LABEL_68:
      *((_BYTE *)v42 + v41) = 0;
      sub_20AB89270(v9, (uint64_t)"BRIEF:", 6);
      std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
      v45 = (std::locale::id *)MEMORY[0x24BEDB350];
      v46 = std::locale::use_facet(&v53, MEMORY[0x24BEDB350]);
      ((void (*)(const std::locale::facet *, uint64_t))v46->__vftable[2].~facet_0)(v46, 10);
      std::locale::~locale(&v53);
      std::ostream::put();
      std::ostream::flush();
      if (v52 >= 0)
        v47 = __p;
      else
        v47 = (void **)__p[0];
      if (v52 >= 0)
        v48 = HIBYTE(v52);
      else
        v48 = (uint64_t)__p[1];
      sub_20AB89270(v9, (uint64_t)v47, v48);
      std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
      v49 = std::locale::use_facet(&v53, v45);
      ((void (*)(const std::locale::facet *, uint64_t))v49->__vftable[2].~facet_0)(v49, 10);
      std::locale::~locale(&v53);
      std::ostream::put();
      std::ostream::flush();
      std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
      v50 = std::locale::use_facet(&v53, v45);
      ((void (*)(const std::locale::facet *, uint64_t))v50->__vftable[2].~facet_0)(v50, 10);
      std::locale::~locale(&v53);
      std::ostream::put();
      std::ostream::flush();
      if (SHIBYTE(v52) < 0)
        operator delete(__p[0]);
      v13 = 0;
      v12 = v27 + 1;
    }
  }
LABEL_9:
  sub_20AB89270(v9, (uint64_t)"SYNOPSIS:", 9);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
  v14 = (std::locale::id *)MEMORY[0x24BEDB350];
  v15 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v15->__vftable[2].~facet_0)(v15, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put();
  std::ostream::flush();
  v16 = *((char *)*this + 23);
  if (v16 >= 0)
    v17 = (uint64_t)*this;
  else
    v17 = **this;
  if (v16 >= 0)
    v18 = *((unsigned __int8 *)*this + 23);
  else
    v18 = (*this)[1];
  v19 = sub_20AB89270(v9, v17, v18);
  v20 = sub_20AB89270(v19, (uint64_t)" ", 1);
  v21 = *((char *)*this + 47);
  if (v21 >= 0)
    v22 = (uint64_t)(*this + 3);
  else
    v22 = (*this)[3];
  if (v21 >= 0)
    v23 = *((unsigned __int8 *)*this + 47);
  else
    v23 = (*this)[4];
  sub_20AB89270(v20, v22, v23);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
  v24 = std::locale::use_facet((const std::locale *)__p, v14);
  ((void (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put();
  std::ostream::flush();
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
  v25 = std::locale::use_facet((const std::locale *)__p, v14);
  ((void (*)(const std::locale::facet *, uint64_t))v25->__vftable[2].~facet_0)(v25, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put();
  std::ostream::flush();
  v26 = *((unsigned __int8 *)v4 + 71);
  if (*((char *)v4 + 71) < 0)
  {
    if (!v4[7])
      goto LABEL_55;
  }
  else if (!*((_BYTE *)v4 + 71))
  {
    goto LABEL_55;
  }
  if (!v13)
  {
    if ((v26 & 0x80) != 0)
    {
      v26 = v4[7];
      if (v26 < (unint64_t)v12)
        goto LABEL_77;
      v5 = (_QWORD *)*v5;
    }
    else if ((unint64_t)v12 > v26)
    {
      goto LABEL_77;
    }
    v29 = v26 - (_QWORD)v12;
    if (v26 - (unint64_t)v12 > 0x7FFFFFFFFFFFFFF7)
      goto LABEL_77;
    if (v29 >= 0x17)
    {
      v31 = (v29 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v29 | 7) != 0x17)
        v31 = v29 | 7;
      v32 = v31 + 1;
      v30 = operator new(v31 + 1);
      __p[1] = (void *)v29;
      v52 = v32 | 0x8000000000000000;
      __p[0] = v30;
    }
    else
    {
      HIBYTE(v52) = v26 - (_BYTE)v12;
      v30 = __p;
      if ((_BYTE *)v26 == v12)
        goto LABEL_46;
    }
    memmove(v30, &v12[(_QWORD)v5], v29);
LABEL_46:
    *((_BYTE *)v30 + v29) = 0;
    goto LABEL_47;
  }
  if ((v26 & 0x80) != 0)
  {
    sub_20AB88C14(__p, (void *)v4[6], v4[7]);
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)v5;
    v52 = v5[2];
  }
LABEL_47:
  sub_20AB89270(v9, (uint64_t)"DESCRIPTION:", 12);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
  v33 = (std::locale::id *)MEMORY[0x24BEDB350];
  v34 = std::locale::use_facet(&v53, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v34->__vftable[2].~facet_0)(v34, 10);
  std::locale::~locale(&v53);
  std::ostream::put();
  std::ostream::flush();
  if (v52 >= 0)
    v35 = __p;
  else
    v35 = (void **)__p[0];
  if (v52 >= 0)
    v36 = HIBYTE(v52);
  else
    v36 = (uint64_t)__p[1];
  sub_20AB89270(v9, (uint64_t)v35, v36);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
  v37 = std::locale::use_facet(&v53, v33);
  ((void (*)(const std::locale::facet *, uint64_t))v37->__vftable[2].~facet_0)(v37, 10);
  std::locale::~locale(&v53);
  std::ostream::put();
  std::ostream::flush();
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
  v38 = std::locale::use_facet(&v53, v33);
  ((void (*)(const std::locale::facet *, uint64_t))v38->__vftable[2].~facet_0)(v38, 10);
  std::locale::~locale(&v53);
  std::ostream::put();
  std::ostream::flush();
  if (SHIBYTE(v52) < 0)
    operator delete(__p[0]);
LABEL_55:
  sub_20AB89270(v9, (uint64_t)"OPTIONS:", 8);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
  v39 = std::locale::use_facet((const std::locale *)__p, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v39->__vftable[2].~facet_0)(v39, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put();
  std::ostream::flush();
  return cva::ProgramOptions::Description::display_help((uint64_t *)a2);
}

void cva::ProgramOptions::Description::set_default_arguments(uint64_t *a1, uint64_t **a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  char *v14;
  void *__p[2];
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v2 = *a1;
  v3 = a1[1];
  if (*a1 != v3)
  {
    do
    {
      if (!*(_QWORD *)(v2 + 48))
        goto LABEL_4;
      if (*(char *)(v2 + 23) < 0)
      {
        sub_20AB88C14(__p, *(void **)v2, *(_QWORD *)(v2 + 8));
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v2;
        v16 = *(_QWORD *)(v2 + 16);
      }
      v5 = (__int128 *)(v2 + 24);
      if (*(char *)(v2 + 47) < 0)
      {
        sub_20AB88C14(&v17, *(void **)(v2 + 24), *(_QWORD *)(v2 + 32));
      }
      else
      {
        v17 = *v5;
        v18 = *(_QWORD *)(v2 + 40);
      }
      v6 = sub_20ABF3020(a2, __p, (uint64_t)__p);
      v7 = *((_QWORD *)v6 + 10);
      v8 = *((_QWORD *)v6 + 11);
      if (SHIBYTE(v18) < 0)
      {
        operator delete((void *)v17);
        if ((SHIBYTE(v16) & 0x80000000) == 0)
        {
LABEL_16:
          if (v7 != v8)
            goto LABEL_4;
          goto LABEL_17;
        }
      }
      else if ((SHIBYTE(v16) & 0x80000000) == 0)
      {
        goto LABEL_16;
      }
      operator delete(__p[0]);
      if (v7 != v8)
        goto LABEL_4;
LABEL_17:
      if (*(char *)(v2 + 23) < 0)
      {
        sub_20AB88C14(__p, *(void **)v2, *(_QWORD *)(v2 + 8));
        if ((*(char *)(v2 + 47) & 0x80000000) == 0)
        {
LABEL_19:
          v17 = *v5;
          v18 = *(_QWORD *)(v2 + 40);
          goto LABEL_22;
        }
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v2;
        v16 = *(_QWORD *)(v2 + 16);
        if ((*(char *)(v2 + 47) & 0x80000000) == 0)
          goto LABEL_19;
      }
      sub_20AB88C14(&v17, *(void **)(v2 + 24), *(_QWORD *)(v2 + 32));
LABEL_22:
      v9 = sub_20ABF3020(a2, __p, (uint64_t)__p);
      v10 = v9;
      v11 = *(_QWORD *)(v2 + 48);
      v12 = *((_QWORD *)v9 + 11);
      if (v12 >= *((_QWORD *)v9 + 12))
      {
        v14 = sub_20ABDB5B4((uint64_t)(v9 + 80), v11);
      }
      else
      {
        if (*(char *)(v11 + 23) < 0)
        {
          sub_20AB88C14(*((_BYTE **)v9 + 11), *(void **)v11, *(_QWORD *)(v11 + 8));
        }
        else
        {
          v13 = *(_OWORD *)v11;
          *(_QWORD *)(v12 + 16) = *(_QWORD *)(v11 + 16);
          *(_OWORD *)v12 = v13;
        }
        v14 = (char *)(v12 + 24);
      }
      *((_QWORD *)v10 + 11) = v14;
      if (SHIBYTE(v18) < 0)
      {
        operator delete((void *)v17);
        if (SHIBYTE(v16) < 0)
LABEL_32:
          operator delete(__p[0]);
      }
      else if (SHIBYTE(v16) < 0)
      {
        goto LABEL_32;
      }
LABEL_4:
      v2 += 96;
    }
    while (v2 != v3);
  }
}

uint64_t *cva::ProgramOptions::Description::display_help(uint64_t *this)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  std::locale::id *v4;
  _QWORD *v5;
  const char *v6;
  uint64_t v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  const std::locale::facet *v13;
  _QWORD *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  int v19;
  const char *v20;
  uint64_t v21;
  _QWORD *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  __int128 *v26;
  __int128 v27;
  unint64_t v28;
  void **v29;
  uint64_t v30;
  void *__p[2];
  uint64_t v32;

  v1 = *this;
  v2 = this[1];
  if (*this != v2)
  {
    v3 = (_QWORD *)MEMORY[0x24BEDB318];
    v4 = (std::locale::id *)MEMORY[0x24BEDB350];
    do
    {
      if (*(char *)(v1 + 47) < 0)
      {
        if (*(_QWORD *)(v1 + 32))
          goto LABEL_17;
      }
      else if (*(_BYTE *)(v1 + 47))
      {
        goto LABEL_17;
      }
      if (*(char *)(v1 + 23) < 0)
      {
        if (!*(_QWORD *)(v1 + 8))
        {
LABEL_50:
          v5 = v3;
          v6 = "\n\n";
          v7 = 2;
          goto LABEL_4;
        }
      }
      else if (!*(_BYTE *)(v1 + 23))
      {
        goto LABEL_50;
      }
LABEL_17:
      if ((*(_BYTE *)(v1 + 47) & 0x80) != 0)
      {
        if (!*(_QWORD *)(v1 + 32))
        {
LABEL_29:
          v18 = sub_20AB89270(v3, (uint64_t)"--", 2);
          v19 = *(char *)(v1 + 23);
          if (v19 >= 0)
            v20 = (const char *)v1;
          else
            v20 = *(const char **)v1;
          if (v19 >= 0)
            v21 = *(unsigned __int8 *)(v1 + 23);
          else
            v21 = *(_QWORD *)(v1 + 8);
          goto LABEL_43;
        }
      }
      else if (!*(_BYTE *)(v1 + 47))
      {
        goto LABEL_29;
      }
      v14 = sub_20AB89270(v3, (uint64_t)"-", 1);
      v15 = *(char *)(v1 + 47);
      if (v15 >= 0)
        v16 = v1 + 24;
      else
        v16 = *(_QWORD *)(v1 + 24);
      if (v15 >= 0)
        v17 = *(unsigned __int8 *)(v1 + 47);
      else
        v17 = *(_QWORD *)(v1 + 32);
      sub_20AB89270(v14, v16, v17);
      if (*(char *)(v1 + 23) < 0)
      {
        if (!*(_QWORD *)(v1 + 8))
          goto LABEL_44;
LABEL_36:
        v22 = sub_20AB89270(v3, (uint64_t)" [ --", 5);
        v23 = *(char *)(v1 + 23);
        if (v23 >= 0)
          v24 = v1;
        else
          v24 = *(_QWORD *)v1;
        if (v23 >= 0)
          v25 = *(unsigned __int8 *)(v1 + 23);
        else
          v25 = *(_QWORD *)(v1 + 8);
        v18 = sub_20AB89270(v22, v24, v25);
        v20 = " ]";
        v21 = 2;
LABEL_43:
        sub_20AB89270(v18, (uint64_t)v20, v21);
        goto LABEL_44;
      }
      if (*(_BYTE *)(v1 + 23))
        goto LABEL_36;
LABEL_44:
      if (*(_DWORD *)(v1 + 88))
      {
        sub_20AB89270(v3, (uint64_t)" ", 1);
        v26 = *(__int128 **)(v1 + 48);
        if (!v26)
          goto LABEL_53;
        if (*((char *)v26 + 23) < 0)
        {
          v28 = *((_QWORD *)v26 + 1);
          if (!v28)
            goto LABEL_53;
          sub_20AB88C14(__p, *(void **)v26, v28);
        }
        else
        {
          if (*((_BYTE *)v26 + 23))
          {
            v27 = *v26;
            v32 = *((_QWORD *)v26 + 2);
            *(_OWORD *)__p = v27;
            goto LABEL_54;
          }
LABEL_53:
          HIBYTE(v32) = 3;
          LODWORD(__p[0]) = 6779489;
        }
LABEL_54:
        if (v32 >= 0)
          v29 = __p;
        else
          v29 = (void **)__p[0];
        if (v32 >= 0)
          v30 = HIBYTE(v32);
        else
          v30 = (uint64_t)__p[1];
        sub_20AB89270(v3, (uint64_t)v29, v30);
        if (SHIBYTE(v32) < 0)
          operator delete(__p[0]);
      }
      v5 = v3;
      v6 = "\n";
      v7 = 1;
LABEL_4:
      v8 = sub_20AB89270(v5, (uint64_t)v6, v7);
      v9 = *(char *)(v1 + 87);
      if (v9 >= 0)
        v10 = v1 + 64;
      else
        v10 = *(_QWORD *)(v1 + 64);
      if (v9 >= 0)
        v11 = *(unsigned __int8 *)(v1 + 87);
      else
        v11 = *(_QWORD *)(v1 + 72);
      v12 = sub_20AB89270(v8, v10, v11);
      sub_20AB89270(v12, (uint64_t)"\n", 1);
      std::ios_base::getloc((const std::ios_base *)((char *)v3 + *(_QWORD *)(*v3 - 24)));
      v13 = std::locale::use_facet((const std::locale *)__p, v4);
      ((void (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 10);
      std::locale::~locale((std::locale *)__p);
      std::ostream::put();
      this = (uint64_t *)std::ostream::flush();
      v1 += 96;
    }
    while (v1 != v2);
  }
  return this;
}

std::string *sub_20ABF5454(std::string *__str, std::string *a2, std::string *this)
{
  std::string *v5;
  std::string::value_type v6;
  std::string::size_type size;
  std::string::size_type v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;

  if (__str != a2)
  {
    v5 = __str;
    do
    {
      std::string::operator=(this, v5);
      std::string::operator=(this + 1, v5 + 1);
      v8 = v5[2].__r_.__value_.__r.__words[0];
      size = v5[2].__r_.__value_.__l.__size_;
      if (size)
      {
        v9 = (unint64_t *)(size + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }
      v11 = (std::__shared_weak_count *)this[2].__r_.__value_.__l.__size_;
      this[2].__r_.__value_.__r.__words[0] = v8;
      this[2].__r_.__value_.__l.__size_ = size;
      if (v11)
      {
        p_shared_owners = (unint64_t *)&v11->__shared_owners_;
        do
          v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
      std::string::operator=((std::string *)((char *)this + 64), (std::string *)((char *)v5 + 64));
      v6 = v5[3].__r_.__value_.__s.__data_[20];
      LODWORD(this[3].__r_.__value_.__r.__words[2]) = v5[3].__r_.__value_.__r.__words[2];
      this[3].__r_.__value_.__s.__data_[20] = v6;
      v5 += 4;
      this += 4;
    }
    while (v5 != a2);
  }
  return this;
}

char *sub_20ABF5530(__int128 *a1, __int128 *a2, char *__dst)
{
  __int128 *v5;
  int v6;
  __int128 v7;
  _BYTE *v8;
  __int128 v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  _BYTE *v13;
  __int128 v14;

  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      if (*((char *)v5 + 23) < 0)
      {
        sub_20AB88C14(__dst, *(void **)v5, *((_QWORD *)v5 + 1));
      }
      else
      {
        v7 = *v5;
        *((_QWORD *)__dst + 2) = *((_QWORD *)v5 + 2);
        *(_OWORD *)__dst = v7;
      }
      v8 = __dst + 24;
      if (*((char *)v5 + 47) < 0)
      {
        sub_20AB88C14(v8, *((void **)v5 + 3), *((_QWORD *)v5 + 4));
      }
      else
      {
        v9 = *(__int128 *)((char *)v5 + 24);
        *((_QWORD *)__dst + 5) = *((_QWORD *)v5 + 5);
        *(_OWORD *)v8 = v9;
      }
      v10 = *((_QWORD *)v5 + 7);
      *((_QWORD *)__dst + 6) = *((_QWORD *)v5 + 6);
      *((_QWORD *)__dst + 7) = v10;
      if (v10)
      {
        v11 = (unint64_t *)(v10 + 8);
        do
          v12 = __ldxr(v11);
        while (__stxr(v12 + 1, v11));
      }
      v13 = __dst + 64;
      if (*((char *)v5 + 87) < 0)
      {
        sub_20AB88C14(v13, *((void **)v5 + 8), *((_QWORD *)v5 + 9));
      }
      else
      {
        v14 = v5[4];
        *((_QWORD *)__dst + 10) = *((_QWORD *)v5 + 10);
        *(_OWORD *)v13 = v14;
      }
      v6 = *((_DWORD *)v5 + 22);
      __dst[92] = *((_BYTE *)v5 + 92);
      *((_DWORD *)__dst + 22) = v6;
      v5 += 6;
      __dst += 96;
    }
    while (v5 != a2);
  }
  return __dst;
}

BOOL cva::ProgramOptions::Description::has(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL8 result;

  v2 = *a1;
  v3 = a1[1];
  if (*a1 == v3)
    return 0;
  do
  {
    result = sub_20ABF2F60(v2, a2);
    if (result)
      break;
    v2 += 96;
  }
  while (v2 != v3);
  return result;
}

uint64_t cva::ProgramOptions::Description::expected_args(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = a1[1];
  if (*a1 == v3)
    return 0;
  while (!sub_20ABF2F60(v2, a2))
  {
    v2 += 96;
    if (v2 == v3)
      return 0;
  }
  return *(unsigned int *)(v2 + 88);
}

BOOL cva::ProgramOptions::has(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t v4;
  _BOOL8 result;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  BOOL v9;

  v2 = *(unsigned __int8 *)(a2 + 23);
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (!v2)
    return 0;
  v3 = *(unsigned __int8 **)(*(_QWORD *)a1 + 96);
  v4 = *(_QWORD *)a1 + 104;
  if (v3 == (unsigned __int8 *)v4)
    return 0;
  do
  {
    result = sub_20ABF3208(v3 + 32, a2);
    if (result)
      break;
    v7 = (unsigned __int8 *)*((_QWORD *)v3 + 1);
    if (v7)
    {
      do
      {
        v8 = v7;
        v7 = *(unsigned __int8 **)v7;
      }
      while (v7);
    }
    else
    {
      do
      {
        v8 = (unsigned __int8 *)*((_QWORD *)v3 + 2);
        v9 = *(_QWORD *)v8 == (_QWORD)v3;
        v3 = v8;
      }
      while (!v9);
    }
    v3 = v8;
  }
  while (v8 != (unsigned __int8 *)v4);
  return result;
}

void cva::ProgramOptions::as_string(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;
  unsigned __int8 v10;
  uint64_t *v11;
  uint64_t v12;

  v4 = *(_QWORD **)(*(_QWORD *)a1 + 96);
  v5 = *(_QWORD *)a1 + 104;
  if (v4 == (_QWORD *)v5)
  {
LABEL_11:
    v10 = atomic_load((unsigned __int8 *)&qword_2546165D8);
    if ((v10 & 1) != 0)
    {
      v11 = &qword_2546165C0;
    }
    else
    {
      v11 = &qword_2546165C0;
      if (__cxa_guard_acquire(&qword_2546165D8))
      {
        qword_2546165C0 = 0;
        *(_QWORD *)algn_2546165C8 = 0;
        qword_2546165D0 = 0;
        __cxa_atexit((void (*)(void *))sub_20ABF3B94, &qword_2546165C0, &dword_20AB80000);
        __cxa_guard_release(&qword_2546165D8);
      }
    }
  }
  else
  {
    while (!sub_20ABF3208((unsigned __int8 *)v4 + 32, a2))
    {
      v7 = (_QWORD *)v4[1];
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (_QWORD *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (_QWORD *)v4[2];
          v9 = *v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
      if (v8 == (_QWORD *)v5)
        goto LABEL_11;
    }
    v11 = v4 + 10;
  }
  v12 = *v11;
  if (*v11 == v11[1])
  {
    *(_BYTE *)(a3 + 23) = 0;
    *(_BYTE *)a3 = 0;
  }
  else if (*(char *)(v12 + 23) < 0)
  {
    sub_20AB88C14((_BYTE *)a3, *(void **)v12, *(_QWORD *)(v12 + 8));
  }
  else
  {
    *(_OWORD *)a3 = *(_OWORD *)v12;
    *(_QWORD *)(a3 + 16) = *(_QWORD *)(v12 + 16);
  }
}

uint64_t *cva::ProgramOptions::as_vector_string(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  BOOL v7;
  unsigned __int8 v8;
  uint64_t *v9;

  v2 = *(unsigned __int8 **)(*(_QWORD *)a1 + 96);
  v3 = *(_QWORD *)a1 + 104;
  if (v2 == (unsigned __int8 *)v3)
  {
LABEL_11:
    v8 = atomic_load((unsigned __int8 *)&qword_2546165D8);
    if ((v8 & 1) != 0)
    {
      return &qword_2546165C0;
    }
    else
    {
      v9 = &qword_2546165C0;
      if (__cxa_guard_acquire(&qword_2546165D8))
      {
        qword_2546165C0 = 0;
        *(_QWORD *)algn_2546165C8 = 0;
        qword_2546165D0 = 0;
        __cxa_atexit((void (*)(void *))sub_20ABF3B94, &qword_2546165C0, &dword_20AB80000);
        __cxa_guard_release(&qword_2546165D8);
      }
    }
  }
  else
  {
    while (!sub_20ABF3208(v2 + 32, a2))
    {
      v5 = (unsigned __int8 *)*((_QWORD *)v2 + 1);
      if (v5)
      {
        do
        {
          v6 = v5;
          v5 = *(unsigned __int8 **)v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          v6 = (unsigned __int8 *)*((_QWORD *)v2 + 2);
          v7 = *(_QWORD *)v6 == (_QWORD)v2;
          v2 = v6;
        }
        while (!v7);
      }
      v2 = v6;
      if (v6 == (unsigned __int8 *)v3)
        goto LABEL_11;
    }
    return (uint64_t *)(v2 + 80);
  }
  return v9;
}

const char *cva::ProgramOptions::as_c_str(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v5;
  _QWORD *v6;
  BOOL v7;
  unsigned __int8 v8;
  uint64_t *v9;
  const char *result;

  v2 = *(_QWORD **)(*(_QWORD *)a1 + 96);
  v3 = *(_QWORD *)a1 + 104;
  if (v2 == (_QWORD *)v3)
  {
LABEL_11:
    v8 = atomic_load((unsigned __int8 *)&qword_2546165D8);
    if ((v8 & 1) != 0)
    {
      v9 = &qword_2546165C0;
    }
    else
    {
      v9 = &qword_2546165C0;
      if (__cxa_guard_acquire(&qword_2546165D8))
      {
        qword_2546165C0 = 0;
        *(_QWORD *)algn_2546165C8 = 0;
        qword_2546165D0 = 0;
        __cxa_atexit((void (*)(void *))sub_20ABF3B94, &qword_2546165C0, &dword_20AB80000);
        __cxa_guard_release(&qword_2546165D8);
      }
    }
  }
  else
  {
    while (!sub_20ABF3208((unsigned __int8 *)v2 + 32, a2))
    {
      v5 = (_QWORD *)v2[1];
      if (v5)
      {
        do
        {
          v6 = v5;
          v5 = (_QWORD *)*v5;
        }
        while (v5);
      }
      else
      {
        do
        {
          v6 = (_QWORD *)v2[2];
          v7 = *v6 == (_QWORD)v2;
          v2 = v6;
        }
        while (!v7);
      }
      v2 = v6;
      if (v6 == (_QWORD *)v3)
        goto LABEL_11;
    }
    v9 = v2 + 10;
  }
  result = (const char *)*v9;
  if (*v9 == v9[1])
    return "";
  if (result[23] < 0)
    return *(const char **)result;
  return result;
}

uint64_t cva::ProgramOptions::as_int(uint64_t a1, uint64_t a2)
{
  const char *v2;

  v2 = cva::ProgramOptions::as_c_str(a1, a2);
  return atoi(v2);
}

BOOL cva::ProgramOptions::as_BOOL(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  char *v5;
  __darwin_ct_rune_t v6;
  __darwin_ct_rune_t v7;
  __darwin_ct_rune_t v8;
  __darwin_ct_rune_t v9;
  __darwin_ct_rune_t v10;
  __darwin_ct_rune_t v11;
  __darwin_ct_rune_t v12;
  __darwin_ct_rune_t v13;
  char *p_p;
  __darwin_ct_rune_t v15;
  __darwin_ct_rune_t v16;
  char *v17;
  __darwin_ct_rune_t v18;
  __darwin_ct_rune_t v19;
  __darwin_ct_rune_t v20;
  __darwin_ct_rune_t v21;
  __darwin_ct_rune_t v22;
  _BOOL8 v23;
  unsigned __int8 *v24;
  void *__p;
  uint64_t v27;
  unsigned __int8 v28;

  cva::ProgramOptions::as_string(a1, a2, (uint64_t)&__p);
  v2 = v28;
  v3 = (char)v28;
  v4 = v27;
  if ((v28 & 0x80u) != 0)
    v2 = v27;
  switch(v2)
  {
    case 2:
      if ((v28 & 0x80u) == 0)
        p_p = (char *)&__p;
      else
        p_p = (char *)__p;
      v15 = *p_p;
      v16 = __toupper(111);
      if (v16 != __toupper(v15))
        goto LABEL_27;
      v12 = p_p[1];
      v13 = 110;
      break;
    case 3:
      if ((v28 & 0x80u) == 0)
        v17 = (char *)&__p;
      else
        v17 = (char *)__p;
      v18 = *v17;
      v19 = __toupper(121);
      if (v19 != __toupper(v18))
        goto LABEL_27;
      v20 = v17[1];
      v21 = __toupper(101);
      if (v21 != __toupper(v20))
        goto LABEL_27;
      v12 = v17[2];
      v13 = 115;
      break;
    case 4:
      v5 = (v28 & 0x80u) == 0 ? (char *)&__p : (char *)__p;
      v6 = *v5;
      v7 = __toupper(116);
      if (v7 != __toupper(v6))
        goto LABEL_27;
      v8 = v5[1];
      v9 = __toupper(114);
      if (v9 != __toupper(v8))
        goto LABEL_27;
      v10 = v5[2];
      v11 = __toupper(117);
      if (v11 != __toupper(v10))
        goto LABEL_27;
      v12 = v5[3];
      v13 = 101;
      break;
    default:
      goto LABEL_27;
  }
  v22 = __toupper(v13);
  if (v22 == __toupper(v12))
  {
    v23 = 1;
    if (v3 < 0)
      goto LABEL_36;
    return v23;
  }
LABEL_27:
  if (v3 < 0)
  {
    if (v4 != 1)
    {
      v23 = 0;
LABEL_36:
      operator delete(__p);
      return v23;
    }
    v24 = (unsigned __int8 *)__p;
  }
  else
  {
    if (v3 != 1)
      return 0;
    v24 = (unsigned __int8 *)&__p;
  }
  v23 = *v24 == 49;
  if (v3 < 0)
    goto LABEL_36;
  return v23;
}

double cva::ProgramOptions::as_double(uint64_t a1, uint64_t a2)
{
  const char *v2;

  v2 = cva::ProgramOptions::as_c_str(a1, a2);
  return atof(v2);
}

float cva::ProgramOptions::as_float(uint64_t a1, uint64_t a2)
{
  const char *v2;

  v2 = cva::ProgramOptions::as_c_str(a1, a2);
  return atof(v2);
}

void cva::ProgramOptions::as_vector_int(uint64_t a1@<X0>, uint64_t a2@<X1>, int **a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;
  unsigned __int8 v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  void **v15;
  int v16;
  int v17;
  unint64_t v18;
  int *v19;
  int *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _BYTE *v25;
  int *v26;
  unint64_t v27;
  uint64_t v28;
  _OWORD *v29;
  int *v30;
  uint64_t v31;
  __int128 v32;
  int v33;
  uint64_t v34;
  void *__p[2];
  uint64_t v36;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v4 = *(_QWORD **)(*(_QWORD *)a1 + 96);
  v5 = *(_QWORD *)a1 + 104;
  if (v4 == (_QWORD *)v5)
  {
LABEL_11:
    v10 = atomic_load((unsigned __int8 *)&qword_2546165D8);
    if ((v10 & 1) != 0)
    {
      v11 = &qword_2546165C0;
    }
    else
    {
      v11 = &qword_2546165C0;
      if (__cxa_guard_acquire(&qword_2546165D8))
      {
        qword_2546165C0 = 0;
        *(_QWORD *)algn_2546165C8 = 0;
        qword_2546165D0 = 0;
        __cxa_atexit((void (*)(void *))sub_20ABF3B94, &qword_2546165C0, &dword_20AB80000);
        __cxa_guard_release(&qword_2546165D8);
      }
    }
  }
  else
  {
    while (!sub_20ABF3208((unsigned __int8 *)v4 + 32, a2))
    {
      v7 = (_QWORD *)v4[1];
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (_QWORD *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (_QWORD *)v4[2];
          v9 = *v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
      if (v8 == (_QWORD *)v5)
        goto LABEL_11;
    }
    v11 = v4 + 10;
  }
  v13 = *v11;
  v12 = v11[1];
  if (v13 != v12)
  {
    v14 = *a3;
    v34 = v12;
    do
    {
      if (*(char *)(v13 + 23) < 0)
      {
        sub_20AB88C14(__p, *(void **)v13, *(_QWORD *)(v13 + 8));
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v13;
        v36 = *(_QWORD *)(v13 + 16);
      }
      if (v36 >= 0)
        v15 = __p;
      else
        v15 = (void **)__p[0];
      v16 = atoi((const char *)v15);
      v17 = v16;
      v19 = a3[1];
      v18 = (unint64_t)a3[2];
      if ((unint64_t)v19 >= v18)
      {
        v21 = v19 - v14;
        v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 62)
          abort();
        v23 = v18 - (_QWORD)v14;
        if (v23 >> 1 > v22)
          v22 = v23 >> 1;
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL)
          v24 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v24 = v22;
        if (v24)
        {
          if (v24 >> 62)
            sub_20ABAD09C();
          v25 = operator new(4 * v24);
        }
        else
        {
          v25 = 0;
        }
        v26 = (int *)&v25[4 * v21];
        *v26 = v17;
        v20 = v26 + 1;
        if (v19 != v14)
        {
          v27 = (char *)(v19 - 1) - (char *)v14;
          if (v27 < 0x2C)
            goto LABEL_56;
          if ((unint64_t)((char *)v14 - v25) < 0x20)
            goto LABEL_56;
          v28 = (v27 >> 2) + 1;
          v29 = &v25[4 * v21 - 16];
          v30 = v19 - 4;
          v31 = v28 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            v32 = *(_OWORD *)v30;
            *(v29 - 1) = *((_OWORD *)v30 - 1);
            *v29 = v32;
            v29 -= 2;
            v30 -= 8;
            v31 -= 8;
          }
          while (v31);
          v26 -= v28 & 0x7FFFFFFFFFFFFFF8;
          v19 -= v28 & 0x7FFFFFFFFFFFFFF8;
          if (v28 != (v28 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_56:
            do
            {
              v33 = *--v19;
              *--v26 = v33;
            }
            while (v19 != v14);
          }
        }
        *a3 = v26;
        a3[1] = v20;
        a3[2] = (int *)&v25[4 * v24];
        if (v14)
          operator delete(v14);
        v14 = v26;
        v12 = v34;
      }
      else
      {
        *v19 = v16;
        v20 = v19 + 1;
      }
      a3[1] = v20;
      if (SHIBYTE(v36) < 0)
        operator delete(__p[0]);
      v13 += 24;
    }
    while (v13 != v12);
  }
}

void cva::ProgramOptions::as_vector_double(uint64_t a1@<X0>, uint64_t a2@<X1>, double **a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;
  unsigned __int8 v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  void **v15;
  double v16;
  double v17;
  unint64_t v18;
  double *v19;
  double *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _BYTE *v25;
  double *v26;
  unint64_t v27;
  uint64_t v28;
  _OWORD *v29;
  double *v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  void *__p[2];
  uint64_t v35;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v4 = *(_QWORD **)(*(_QWORD *)a1 + 96);
  v5 = *(_QWORD *)a1 + 104;
  if (v4 == (_QWORD *)v5)
  {
LABEL_11:
    v10 = atomic_load((unsigned __int8 *)&qword_2546165D8);
    if ((v10 & 1) != 0)
    {
      v11 = &qword_2546165C0;
    }
    else
    {
      v11 = &qword_2546165C0;
      if (__cxa_guard_acquire(&qword_2546165D8))
      {
        qword_2546165C0 = 0;
        *(_QWORD *)algn_2546165C8 = 0;
        qword_2546165D0 = 0;
        __cxa_atexit((void (*)(void *))sub_20ABF3B94, &qword_2546165C0, &dword_20AB80000);
        __cxa_guard_release(&qword_2546165D8);
      }
    }
  }
  else
  {
    while (!sub_20ABF3208((unsigned __int8 *)v4 + 32, a2))
    {
      v7 = (_QWORD *)v4[1];
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (_QWORD *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (_QWORD *)v4[2];
          v9 = *v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
      if (v8 == (_QWORD *)v5)
        goto LABEL_11;
    }
    v11 = v4 + 10;
  }
  v12 = *v11;
  v13 = v11[1];
  if (*v11 != v13)
  {
    v14 = *a3;
    do
    {
      if (*(char *)(v12 + 23) < 0)
      {
        sub_20AB88C14(__p, *(void **)v12, *(_QWORD *)(v12 + 8));
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v12;
        v35 = *(_QWORD *)(v12 + 16);
      }
      if (v35 >= 0)
        v15 = __p;
      else
        v15 = (void **)__p[0];
      v16 = atof((const char *)v15);
      v17 = v16;
      v19 = a3[1];
      v18 = (unint64_t)a3[2];
      if ((unint64_t)v19 >= v18)
      {
        v21 = v19 - v14;
        v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 61)
          abort();
        v23 = v18 - (_QWORD)v14;
        if (v23 >> 2 > v22)
          v22 = v23 >> 2;
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF8)
          v24 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v24 = v22;
        if (v24)
        {
          if (v24 >> 61)
            sub_20ABAD09C();
          v25 = operator new(8 * v24);
        }
        else
        {
          v25 = 0;
        }
        v26 = (double *)&v25[8 * v21];
        *v26 = v17;
        v20 = v26 + 1;
        if (v19 != v14)
        {
          v27 = (char *)(v19 - 1) - (char *)v14;
          if (v27 < 0x58)
            goto LABEL_54;
          if ((unint64_t)((char *)v14 - v25) < 0x20)
            goto LABEL_54;
          v28 = (v27 >> 3) + 1;
          v29 = &v25[8 * v21 - 16];
          v30 = v19 - 2;
          v31 = v28 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v32 = *(_OWORD *)v30;
            *(v29 - 1) = *((_OWORD *)v30 - 1);
            *v29 = v32;
            v29 -= 2;
            v30 -= 4;
            v31 -= 4;
          }
          while (v31);
          v26 -= v28 & 0x3FFFFFFFFFFFFFFCLL;
          v19 -= v28 & 0x3FFFFFFFFFFFFFFCLL;
          if (v28 != (v28 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_54:
            do
            {
              v33 = *((_QWORD *)v19-- - 1);
              *((_QWORD *)v26-- - 1) = v33;
            }
            while (v19 != v14);
          }
        }
        *a3 = v26;
        a3[1] = v20;
        a3[2] = (double *)&v25[8 * v24];
        if (v14)
          operator delete(v14);
        v14 = v26;
      }
      else
      {
        *v19 = v16;
        v20 = v19 + 1;
      }
      a3[1] = v20;
      if (SHIBYTE(v35) < 0)
        operator delete(__p[0]);
      v12 += 24;
    }
    while (v12 != v13);
  }
}

void cva::ProgramOptions::as_vector_float(uint64_t a1@<X0>, uint64_t a2@<X1>, float **a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;
  unsigned __int8 v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  float *v14;
  void **v15;
  float v16;
  unint64_t v17;
  float *v18;
  float *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _BYTE *v24;
  float *v25;
  unint64_t v26;
  uint64_t v27;
  _OWORD *v28;
  float *v29;
  uint64_t v30;
  __int128 v31;
  int v32;
  void *__p[2];
  uint64_t v34;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v4 = *(_QWORD **)(*(_QWORD *)a1 + 96);
  v5 = *(_QWORD *)a1 + 104;
  if (v4 == (_QWORD *)v5)
  {
LABEL_11:
    v10 = atomic_load((unsigned __int8 *)&qword_2546165D8);
    if ((v10 & 1) != 0)
    {
      v11 = &qword_2546165C0;
    }
    else
    {
      v11 = &qword_2546165C0;
      if (__cxa_guard_acquire(&qword_2546165D8))
      {
        qword_2546165C0 = 0;
        *(_QWORD *)algn_2546165C8 = 0;
        qword_2546165D0 = 0;
        __cxa_atexit((void (*)(void *))sub_20ABF3B94, &qword_2546165C0, &dword_20AB80000);
        __cxa_guard_release(&qword_2546165D8);
      }
    }
  }
  else
  {
    while (!sub_20ABF3208((unsigned __int8 *)v4 + 32, a2))
    {
      v7 = (_QWORD *)v4[1];
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (_QWORD *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (_QWORD *)v4[2];
          v9 = *v8 == (_QWORD)v4;
          v4 = v8;
        }
        while (!v9);
      }
      v4 = v8;
      if (v8 == (_QWORD *)v5)
        goto LABEL_11;
    }
    v11 = v4 + 10;
  }
  v12 = *v11;
  v13 = v11[1];
  if (*v11 != v13)
  {
    v14 = *a3;
    do
    {
      if (*(char *)(v12 + 23) < 0)
      {
        sub_20AB88C14(__p, *(void **)v12, *(_QWORD *)(v12 + 8));
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v12;
        v34 = *(_QWORD *)(v12 + 16);
      }
      if (v34 >= 0)
        v15 = __p;
      else
        v15 = (void **)__p[0];
      v16 = atof((const char *)v15);
      v18 = a3[1];
      v17 = (unint64_t)a3[2];
      if ((unint64_t)v18 >= v17)
      {
        v20 = v18 - v14;
        v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 62)
          abort();
        v22 = v17 - (_QWORD)v14;
        if (v22 >> 1 > v21)
          v21 = v22 >> 1;
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL)
          v23 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v23 = v21;
        if (v23)
        {
          if (v23 >> 62)
            sub_20ABAD09C();
          v24 = operator new(4 * v23);
        }
        else
        {
          v24 = 0;
        }
        v25 = (float *)&v24[4 * v20];
        *v25 = v16;
        v19 = v25 + 1;
        if (v18 != v14)
        {
          v26 = (char *)(v18 - 1) - (char *)v14;
          if (v26 < 0x2C)
            goto LABEL_54;
          if ((unint64_t)((char *)v14 - v24) < 0x20)
            goto LABEL_54;
          v27 = (v26 >> 2) + 1;
          v28 = &v24[4 * v20 - 16];
          v29 = v18 - 4;
          v30 = v27 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            v31 = *(_OWORD *)v29;
            *(v28 - 1) = *((_OWORD *)v29 - 1);
            *v28 = v31;
            v28 -= 2;
            v29 -= 8;
            v30 -= 8;
          }
          while (v30);
          v25 -= v27 & 0x7FFFFFFFFFFFFFF8;
          v18 -= v27 & 0x7FFFFFFFFFFFFFF8;
          if (v27 != (v27 & 0x7FFFFFFFFFFFFFF8))
          {
LABEL_54:
            do
            {
              v32 = *((_DWORD *)v18-- - 1);
              *((_DWORD *)v25-- - 1) = v32;
            }
            while (v18 != v14);
          }
        }
        *a3 = v25;
        a3[1] = v19;
        a3[2] = (float *)&v24[4 * v23];
        if (v14)
          operator delete(v14);
        v14 = v25;
      }
      else
      {
        *v18 = v16;
        v19 = v18 + 1;
      }
      a3[1] = v19;
      if (SHIBYTE(v34) < 0)
        operator delete(__p[0]);
      v12 += 24;
    }
    while (v12 != v13);
  }
}

void ***cva::ProgramOptions::Description::newGroupHeader(void ***a1, std::string *__str)
{
  unint64_t v4;
  void **v5;
  void **v6;
  void **v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  void **v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int v18;
  void **v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  void **v23;

  v5 = a1[1];
  v4 = (unint64_t)a1[2];
  if ((unint64_t)v5 < v4)
  {
    *((_OWORD *)v5 + 4) = 0u;
    *((_OWORD *)v5 + 5) = 0u;
    *((_OWORD *)v5 + 2) = 0u;
    *((_OWORD *)v5 + 3) = 0u;
    *(_OWORD *)v5 = 0u;
    *((_OWORD *)v5 + 1) = 0u;
    v6 = v5 + 12;
    goto LABEL_34;
  }
  v7 = *a1;
  v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (char *)*a1) >> 5);
  v9 = v8 + 1;
  if (v8 + 1 > 0x2AAAAAAAAAAAAAALL)
    abort();
  v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - (_QWORD)v7) >> 5);
  if (2 * v10 > v9)
    v9 = 2 * v10;
  if (v10 >= 0x155555555555555)
    v11 = 0x2AAAAAAAAAAAAAALL;
  else
    v11 = v9;
  if (v11)
  {
    if (v11 > 0x2AAAAAAAAAAAAAALL)
      sub_20ABAD09C();
    v12 = (char *)operator new(96 * v11);
  }
  else
  {
    v12 = 0;
  }
  v13 = &v12[96 * v8];
  *((_OWORD *)v13 + 4) = 0u;
  *((_OWORD *)v13 + 5) = 0u;
  *((_OWORD *)v13 + 2) = 0u;
  *((_OWORD *)v13 + 3) = 0u;
  v14 = (void **)&v12[96 * v11];
  *(_OWORD *)v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  v6 = (void **)(v13 + 96);
  if (v5 != v7)
  {
    do
    {
      v15 = *((_OWORD *)v5 - 6);
      *((_QWORD *)v13 - 10) = *(v5 - 10);
      *((_OWORD *)v13 - 6) = v15;
      *(v5 - 11) = 0;
      *(v5 - 10) = 0;
      *(v5 - 12) = 0;
      v16 = *(_OWORD *)(v5 - 9);
      *((_QWORD *)v13 - 7) = *(v5 - 7);
      *(_OWORD *)(v13 - 72) = v16;
      *(v5 - 8) = 0;
      *(v5 - 7) = 0;
      *(v5 - 9) = 0;
      *((_OWORD *)v13 - 3) = *((_OWORD *)v5 - 3);
      *(v5 - 6) = 0;
      *(v5 - 5) = 0;
      v17 = *((_OWORD *)v5 - 2);
      *((_QWORD *)v13 - 2) = *(v5 - 2);
      *((_OWORD *)v13 - 2) = v17;
      *(v5 - 3) = 0;
      *(v5 - 2) = 0;
      *(v5 - 4) = 0;
      v18 = *((_DWORD *)v5 - 2);
      *(v13 - 4) = *((_BYTE *)v5 - 4);
      *((_DWORD *)v13 - 2) = v18;
      v13 -= 96;
      v5 -= 12;
    }
    while (v5 != v7);
    v5 = *a1;
    v19 = a1[1];
    *a1 = (void **)v13;
    a1[1] = v6;
    a1[2] = v14;
    if (v19 == v5)
      goto LABEL_32;
    while (1)
    {
      if (*((char *)v19 - 9) < 0)
      {
        operator delete(*(v19 - 4));
        v20 = (std::__shared_weak_count *)*(v19 - 5);
        if (!v20)
          goto LABEL_25;
      }
      else
      {
        v20 = (std::__shared_weak_count *)*(v19 - 5);
        if (!v20)
          goto LABEL_25;
      }
      p_shared_owners = (unint64_t *)&v20->__shared_owners_;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
        if ((*((char *)v19 - 49) & 0x80000000) == 0)
          goto LABEL_27;
LABEL_26:
        operator delete(*(v19 - 9));
        goto LABEL_27;
      }
LABEL_25:
      if (*((char *)v19 - 49) < 0)
        goto LABEL_26;
LABEL_27:
      v23 = v19 - 12;
      if (*((char *)v19 - 73) < 0)
        operator delete(*v23);
      v19 -= 12;
      if (v23 == v5)
        goto LABEL_32;
    }
  }
  *a1 = (void **)v13;
  a1[1] = v6;
  a1[2] = v14;
LABEL_32:
  if (v5)
    operator delete(v5);
LABEL_34:
  a1[1] = v6;
  std::string::operator=((std::string *)(v6 - 4), __str);
  return a1;
}

std::string **cva::ProgramOptions::Description::operator()(std::string **a1, const std::string *a2, uint64_t *a3, int a4, const std::string *a5, int a6)
{
  const std::string *v11;
  const std::string *v12;
  std::string *v13;
  const std::string *v14;
  unint64_t v15;
  unint64_t v16;
  std::string::size_type size;
  std::string::size_type v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *p_shared_owners;
  unint64_t v25;
  std::string *v26;
  std::string *v27;
  __int128 v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _BYTE *v33;
  std::string *v34;
  __int128 v35;
  uint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  std::string::value_type *v39;
  __int128 v40;
  int v41;
  std::string *v42;
  std::string *v43;
  _BYTE *v44;
  uint64_t v45;
  char *v46;
  unint64_t *v47;
  unint64_t v48;
  _BYTE *v49;
  std::string *v50;
  char *v51;
  void **v52;
  void **v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  int v57;
  std::string *v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  void **p_data;
  void **v63;
  void **i;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  void *__p;
  void **v70;
  uint64_t v71;
  std::string v72[2];
  __int128 v73;
  std::string v74;
  int v75;
  BOOL v76;

  v73 = 0u;
  memset(&v74, 0, sizeof(v74));
  memset(v72, 0, sizeof(v72));
  __p = 0;
  v70 = 0;
  v71 = 0;
  cva::utils::string::split((uint64_t)&__p, a2, ",", 1);
  v11 = (const std::string *)__p;
  if ((char *)v70 - (_BYTE *)__p != 24)
  {
    if (*((char *)__p + 23) < 0)
    {
      v15 = *((_QWORD *)__p + 1);
      LODWORD(v16) = *((char *)__p + 47);
      if ((v16 & 0x80000000) == 0)
        goto LABEL_7;
    }
    else
    {
      v15 = *((unsigned __int8 *)__p + 23);
      LODWORD(v16) = *((char *)__p + 47);
      if ((v16 & 0x80000000) == 0)
      {
LABEL_7:
        v16 = v16;
        goto LABEL_12;
      }
    }
    v16 = *((_QWORD *)__p + 4);
LABEL_12:
    std::string::operator=(v72, (const std::string *)__p + (v15 <= v16));
    if (SHIBYTE(v11->__r_.__value_.__r.__words[2]) < 0)
    {
      size = v11->__r_.__value_.__l.__size_;
      LODWORD(v18) = SHIBYTE(v11[1].__r_.__value_.__r.__words[2]);
      if ((v18 & 0x80000000) == 0)
        goto LABEL_14;
    }
    else
    {
      size = HIBYTE(v11->__r_.__value_.__r.__words[2]);
      LODWORD(v18) = SHIBYTE(v11[1].__r_.__value_.__r.__words[2]);
      if ((v18 & 0x80000000) == 0)
      {
LABEL_14:
        v18 = v18;
LABEL_17:
        v14 = &v11[size > v18];
        v13 = &v72[1];
        goto LABEL_18;
      }
    }
    v18 = v11[1].__r_.__value_.__l.__size_;
    goto LABEL_17;
  }
  v12 = (const std::string *)MEMORY[0x20BD2CD14](&v72[1], "");
  std::string::operator=(v72, v12);
  if (SHIBYTE(v11->__r_.__value_.__r.__words[2]) < 0)
  {
    if (v11->__r_.__value_.__l.__size_ >= 2)
      goto LABEL_4;
  }
  else if (HIBYTE(v11->__r_.__value_.__r.__words[2]) >= 2uLL)
  {
LABEL_4:
    v13 = v72;
    v14 = v11;
    goto LABEL_18;
  }
  v13 = &v72[1];
  v14 = v11;
LABEL_18:
  std::string::operator=(v13, v14);
  std::string::operator=(&v74, a5);
  v20 = *a3;
  v19 = a3[1];
  if (v19)
  {
    v21 = (unint64_t *)(v19 + 8);
    do
      v22 = __ldxr(v21);
    while (__stxr(v22 + 1, v21));
  }
  v23 = (std::__shared_weak_count *)*((_QWORD *)&v73 + 1);
  *(_QWORD *)&v73 = v20;
  *((_QWORD *)&v73 + 1) = v19;
  if (v23)
  {
    p_shared_owners = (unint64_t *)&v23->__shared_owners_;
    do
      v25 = __ldaxr(p_shared_owners);
    while (__stlxr(v25 - 1, p_shared_owners));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v75 = a4;
  v76 = a6 == 1;
  v27 = a1[1];
  v26 = a1[2];
  if (v27 < v26)
  {
    if (SHIBYTE(v72[0].__r_.__value_.__r.__words[2]) < 0)
    {
      sub_20AB88C14(a1[1], v72[0].__r_.__value_.__l.__data_, v72[0].__r_.__value_.__l.__size_);
    }
    else
    {
      v28 = *(_OWORD *)&v72[0].__r_.__value_.__l.__data_;
      v27->__r_.__value_.__r.__words[2] = v72[0].__r_.__value_.__r.__words[2];
      *(_OWORD *)&v27->__r_.__value_.__l.__data_ = v28;
    }
    v34 = v27 + 1;
    if (SHIBYTE(v72[1].__r_.__value_.__r.__words[2]) < 0)
    {
      sub_20AB88C14(v34, v72[1].__r_.__value_.__l.__data_, v72[1].__r_.__value_.__l.__size_);
    }
    else
    {
      v35 = *(_OWORD *)&v72[1].__r_.__value_.__l.__data_;
      v27[1].__r_.__value_.__r.__words[2] = v72[1].__r_.__value_.__r.__words[2];
      *(_OWORD *)&v34->__r_.__value_.__l.__data_ = v35;
    }
    v27[2].__r_.__value_.__r.__words[0] = v73;
    v36 = *((_QWORD *)&v73 + 1);
    v27[2].__r_.__value_.__l.__size_ = *((_QWORD *)&v73 + 1);
    if (v36)
    {
      v37 = (unint64_t *)(v36 + 8);
      do
        v38 = __ldxr(v37);
      while (__stxr(v38 + 1, v37));
    }
    v39 = &v27[2].__r_.__value_.__s.__data_[16];
    if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0)
    {
      sub_20AB88C14(v39, v74.__r_.__value_.__l.__data_, v74.__r_.__value_.__l.__size_);
    }
    else
    {
      v40 = *(_OWORD *)&v74.__r_.__value_.__l.__data_;
      v27[3].__r_.__value_.__l.__size_ = v74.__r_.__value_.__r.__words[2];
      *(_OWORD *)v39 = v40;
    }
    v41 = v75;
    v27[3].__r_.__value_.__s.__data_[20] = v76;
    LODWORD(v27[3].__r_.__value_.__r.__words[2]) = v41;
    v42 = v27 + 4;
    goto LABEL_83;
  }
  v29 = 0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (char *)*a1) >> 5);
  if (v29 + 1 > 0x2AAAAAAAAAAAAAALL)
    abort();
  v30 = 0xAAAAAAAAAAAAAAABLL * (((char *)v26 - (char *)*a1) >> 5);
  v31 = 2 * v30;
  if (2 * v30 <= v29 + 1)
    v31 = v29 + 1;
  if (v30 >= 0x155555555555555)
    v32 = 0x2AAAAAAAAAAAAAALL;
  else
    v32 = v31;
  if (v32)
  {
    if (v32 > 0x2AAAAAAAAAAAAAALL)
      sub_20ABAD09C();
    v33 = operator new(96 * v32);
  }
  else
  {
    v33 = 0;
  }
  v43 = (std::string *)&v33[96 * v29];
  if (SHIBYTE(v72[0].__r_.__value_.__r.__words[2]) < 0)
    sub_20AB88C14(&v33[96 * v29], v72[0].__r_.__value_.__l.__data_, v72[0].__r_.__value_.__l.__size_);
  else
    *v43 = v72[0];
  v44 = &v33[96 * v29 + 24];
  if (SHIBYTE(v72[1].__r_.__value_.__r.__words[2]) < 0)
  {
    sub_20AB88C14(v44, v72[1].__r_.__value_.__l.__data_, v72[1].__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)v44 = *(_OWORD *)&v72[1].__r_.__value_.__l.__data_;
    *(_QWORD *)&v33[96 * v29 + 40] = *((_QWORD *)&v72[1].__r_.__value_.__l + 2);
  }
  v45 = *((_QWORD *)&v73 + 1);
  v46 = &v33[96 * v29];
  *((_QWORD *)v46 + 6) = v73;
  *((_QWORD *)v46 + 7) = v45;
  if (v45)
  {
    v47 = (unint64_t *)(v45 + 8);
    do
      v48 = __ldxr(v47);
    while (__stxr(v48 + 1, v47));
  }
  v49 = &v33[96 * v29 + 64];
  if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0)
  {
    sub_20AB88C14(v49, v74.__r_.__value_.__l.__data_, v74.__r_.__value_.__l.__size_);
  }
  else
  {
    *(_OWORD *)v49 = *(_OWORD *)&v74.__r_.__value_.__l.__data_;
    *(_QWORD *)&v33[96 * v29 + 80] = *((_QWORD *)&v74.__r_.__value_.__l + 2);
  }
  v50 = (std::string *)&v33[96 * v32];
  v51 = &v33[96 * v29];
  *((_DWORD *)v51 + 22) = v75;
  v51[92] = v76;
  v42 = v43 + 4;
  v52 = (void **)*a1;
  v53 = (void **)a1[1];
  if (v53 == (void **)*a1)
  {
    *a1 = v43;
    a1[1] = v42;
    a1[2] = v50;
    goto LABEL_81;
  }
  do
  {
    v54 = *((_OWORD *)v53 - 6);
    v43[-4].__r_.__value_.__r.__words[2] = (std::string::size_type)*(v53 - 10);
    *(_OWORD *)&v43[-4].__r_.__value_.__l.__data_ = v54;
    *(v53 - 11) = 0;
    *(v53 - 10) = 0;
    *(v53 - 12) = 0;
    v55 = *(_OWORD *)(v53 - 9);
    v43[-3].__r_.__value_.__r.__words[2] = (std::string::size_type)*(v53 - 7);
    *(_OWORD *)&v43[-3].__r_.__value_.__l.__data_ = v55;
    *(v53 - 8) = 0;
    *(v53 - 7) = 0;
    *(v53 - 9) = 0;
    *(_OWORD *)&v43[-2].__r_.__value_.__l.__data_ = *((_OWORD *)v53 - 3);
    *(v53 - 6) = 0;
    *(v53 - 5) = 0;
    v56 = *((_OWORD *)v53 - 2);
    v43[-1].__r_.__value_.__l.__size_ = (std::string::size_type)*(v53 - 2);
    *(_OWORD *)&v43[-2].__r_.__value_.__r.__words[2] = v56;
    *(v53 - 3) = 0;
    *(v53 - 2) = 0;
    *(v53 - 4) = 0;
    v57 = *((_DWORD *)v53 - 2);
    v43[-1].__r_.__value_.__s.__data_[20] = *((_BYTE *)v53 - 4);
    LODWORD(v43[-1].__r_.__value_.__r.__words[2]) = v57;
    v43 -= 4;
    v53 -= 12;
  }
  while (v53 != v52);
  v53 = (void **)*a1;
  v58 = a1[1];
  *a1 = v43;
  a1[1] = v42;
  a1[2] = v50;
  if (v58 != (std::string *)v53)
  {
    do
    {
      if (v58[-1].__r_.__value_.__s.__data_[15] < 0)
      {
        operator delete((void *)v58[-2].__r_.__value_.__r.__words[2]);
        v59 = (std::__shared_weak_count *)v58[-2].__r_.__value_.__l.__size_;
        if (!v59)
          goto LABEL_74;
      }
      else
      {
        v59 = (std::__shared_weak_count *)v58[-2].__r_.__value_.__l.__size_;
        if (!v59)
          goto LABEL_74;
      }
      v60 = (unint64_t *)&v59->__shared_owners_;
      do
        v61 = __ldaxr(v60);
      while (__stlxr(v61 - 1, v60));
      if (!v61)
      {
        ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
        std::__shared_weak_count::__release_weak(v59);
        if ((SHIBYTE(v58[-3].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_76;
LABEL_75:
        operator delete(v58[-3].__r_.__value_.__l.__data_);
        goto LABEL_76;
      }
LABEL_74:
      if (SHIBYTE(v58[-3].__r_.__value_.__r.__words[2]) < 0)
        goto LABEL_75;
LABEL_76:
      p_data = (void **)&v58[-4].__r_.__value_.__l.__data_;
      if (SHIBYTE(v58[-4].__r_.__value_.__r.__words[2]) < 0)
        operator delete(*p_data);
      v58 -= 4;
    }
    while (p_data != v53);
  }
LABEL_81:
  if (v53)
    operator delete(v53);
LABEL_83:
  a1[1] = v42;
  v63 = (void **)__p;
  if (__p)
  {
    for (i = v70; i != v63; i -= 3)
    {
      if (*((char *)i - 1) < 0)
        operator delete(*(i - 3));
    }
    operator delete(v63);
  }
  if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v74.__r_.__value_.__l.__data_);
  v65 = (std::__shared_weak_count *)*((_QWORD *)&v73 + 1);
  if (!*((_QWORD *)&v73 + 1))
    goto LABEL_96;
  v66 = (unint64_t *)(*((_QWORD *)&v73 + 1) + 8);
  do
    v67 = __ldaxr(v66);
  while (__stlxr(v67 - 1, v66));
  if (v67)
  {
LABEL_96:
    if ((SHIBYTE(v72[1].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_97;
LABEL_100:
    operator delete(v72[1].__r_.__value_.__l.__data_);
    if ((SHIBYTE(v72[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return a1;
LABEL_101:
    operator delete(v72[0].__r_.__value_.__l.__data_);
    return a1;
  }
  ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
  std::__shared_weak_count::__release_weak(v65);
  if (SHIBYTE(v72[1].__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_100;
LABEL_97:
  if (SHIBYTE(v72[0].__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_101;
  return a1;
}

void cva::ProgramOptions::Description::tokenize(const std::string *a1, uint64_t a2)
{
  cva::utils::string::split(a2, a1, ",", 1);
}

CFTypeRef cva::ItemHandler::createValue<int>@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeRef result;

  result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", *a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  if (result)
    return CFRetain(result);
  return result;
}

cva::ItemHandler *cva::ItemHandler::ItemHandler(cva::ItemHandler *this, CFTypeRef cf, char a3)
{
  *(_QWORD *)this = cf;
  *((_BYTE *)this + 8) = a3;
  if (cf)
    CFRetain(cf);
  else
    *((_BYTE *)this + 8) = 0;
  return this;
}

{
  *(_QWORD *)this = cf;
  *((_BYTE *)this + 8) = a3;
  if (cf)
    CFRetain(cf);
  else
    *((_BYTE *)this + 8) = 0;
  return this;
}

CFTypeRef cva::ItemHandler::createValue<unsigned int>@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeRef result;

  result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", *a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef cva::ItemHandler::createValue<long long>@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeRef result;

  result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithLongLong:", *a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef cva::ItemHandler::createValue<unsigned long long>@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeRef result;

  result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", *a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef cva::ItemHandler::createValue<float>@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  int v3;
  id v4;
  double v5;
  CFTypeRef result;

  v3 = *a1;
  v4 = objc_alloc(MEMORY[0x24BDD16E0]);
  LODWORD(v5) = v3;
  result = (id)objc_msgSend(v4, "initWithFloat:", v5);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef cva::ItemHandler::createValue<double>@<X0>(double *a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeRef result;

  result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", *a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef cva::ItemHandler::createValue<BOOL>@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  CFTypeRef result;

  result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", *a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  if (result)
    return CFRetain(result);
  return result;
}

CFTypeRef cva::ItemHandler::createValue<std::string>@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v3;
  CFTypeRef result;

  if (*((char *)a1 + 23) >= 0)
    v3 = a1;
  else
    v3 = (uint64_t *)*a1;
  result = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v3);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  if (result)
    return CFRetain(result);
  return result;
}

void cva::ItemHandler::createVector<BOOL>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *cf;

  cf = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(unsigned int *)(a1 + 16));
  if (*(_DWORD *)(a1 + 16))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithBool:", *(unsigned __int8 *)(*(_QWORD *)a1 + v4) != 0);
      objc_msgSend(cf, "addObject:", v5);

      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 16));
  }
  v6 = cf;
  *(_QWORD *)a2 = cf;
  *(_BYTE *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    v6 = cf;
  }

}

void sub_20ABF7174(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void cva::ItemHandler::createVector<unsigned int>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *cf;

  cf = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(unsigned int *)(a1 + 16));
  if (*(_DWORD *)(a1 + 16))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)a1 + 4 * v4));
      objc_msgSend(cf, "addObject:", v5);

      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 16));
  }
  v6 = cf;
  *(_QWORD *)a2 = cf;
  *(_BYTE *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    v6 = cf;
  }

}

{
  __ZN3cva11ItemHandler12createVectorIjEES0_RKNS_6MatrixIT_Lj0ELj1EXclsr6detailE7IsSmallIS3_XLj0EEXLj1EEEEEEE(a1, a2);
}

void sub_20ABF7250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void cva::ItemHandler::createVector<int>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *cf;

  cf = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(unsigned int *)(a1 + 16));
  if (*(_DWORD *)(a1 + 16))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", *(unsigned int *)(*(_QWORD *)a1 + 4 * v4));
      objc_msgSend(cf, "addObject:", v5);

      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 16));
  }
  v6 = cf;
  *(_QWORD *)a2 = cf;
  *(_BYTE *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    v6 = cf;
  }

}

void sub_20ABF732C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void cva::ItemHandler::createVector<float>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4;
  int v5;
  id v6;
  double v7;
  void *v8;
  void *v9;
  void *cf;

  cf = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(unsigned int *)(a1 + 16));
  if (*(_DWORD *)(a1 + 16))
  {
    v4 = 0;
    do
    {
      v5 = *(_DWORD *)(*(_QWORD *)a1 + 4 * v4);
      v6 = objc_alloc(MEMORY[0x24BDD16E0]);
      LODWORD(v7) = v5;
      v8 = (void *)objc_msgSend(v6, "initWithFloat:", v7);
      objc_msgSend(cf, "addObject:", v8);

      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 16));
  }
  v9 = cf;
  *(_QWORD *)a2 = cf;
  *(_BYTE *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    v9 = cf;
  }

}

void sub_20ABF7410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void cva::ItemHandler::createVector<double>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *cf;

  cf = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(unsigned int *)(a1 + 16));
  if (*(_DWORD *)(a1 + 16))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", *(double *)(*(_QWORD *)a1 + 8 * v4));
      objc_msgSend(cf, "addObject:", v5);

      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 16));
  }
  v6 = cf;
  *(_QWORD *)a2 = cf;
  *(_BYTE *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    v6 = cf;
  }

}

void sub_20ABF74F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void cva::ItemHandler::createMatrix<int>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *cf;

  cf = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(unsigned int *)(a1 + 16));
  if (*(_DWORD *)(a1 + 16))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(unsigned int *)(a1 + 20));
      if (*(_DWORD *)(a1 + 20))
      {
        v6 = 0;
        do
        {
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", *(unsigned int *)(*(_QWORD *)a1 + 4 * (v4 + *(_DWORD *)(a1 + 16) * v6)));
          objc_msgSend(v5, "addObject:", v7);

          ++v6;
        }
        while (v6 < *(_DWORD *)(a1 + 20));
      }
      objc_msgSend(cf, "addObject:", v5);

      ++v4;
    }
    while (v4 < *(_DWORD *)(a1 + 16));
  }
  v8 = cf;
  *(_QWORD *)a2 = cf;
  *(_BYTE *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    v8 = cf;
  }

}

void sub_20ABF7620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void cva::ItemHandler::createMatrix<float>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4;
  void *v5;
  unsigned int v6;
  int v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *cf;

  cf = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(unsigned int *)(a1 + 16));
  if (*(_DWORD *)(a1 + 16))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(unsigned int *)(a1 + 20));
      if (*(_DWORD *)(a1 + 20))
      {
        v6 = 0;
        do
        {
          v7 = *(_DWORD *)(*(_QWORD *)a1 + 4 * (v4 + *(_DWORD *)(a1 + 16) * v6));
          v8 = objc_alloc(MEMORY[0x24BDD16E0]);
          LODWORD(v9) = v7;
          v10 = (void *)objc_msgSend(v8, "initWithFloat:", v9);
          objc_msgSend(v5, "addObject:", v10);

          ++v6;
        }
        while (v6 < *(_DWORD *)(a1 + 20));
      }
      objc_msgSend(cf, "addObject:", v5);

      ++v4;
    }
    while (v4 < *(_DWORD *)(a1 + 16));
  }
  v11 = cf;
  *(_QWORD *)a2 = cf;
  *(_BYTE *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    v11 = cf;
  }

}

void sub_20ABF7764(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void cva::ItemHandler::createMatrix<double>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *cf;

  cf = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(unsigned int *)(a1 + 16));
  if (*(_DWORD *)(a1 + 16))
  {
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(unsigned int *)(a1 + 20));
      if (*(_DWORD *)(a1 + 20))
      {
        v6 = 0;
        do
        {
          v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", *(double *)(*(_QWORD *)a1 + 8 * (v4 + *(_DWORD *)(a1 + 16) * v6)));
          objc_msgSend(v5, "addObject:", v7);

          ++v6;
        }
        while (v6 < *(_DWORD *)(a1 + 20));
      }
      objc_msgSend(cf, "addObject:", v5);

      ++v4;
    }
    while (v4 < *(_DWORD *)(a1 + 16));
  }
  v8 = cf;
  *(_QWORD *)a2 = cf;
  *(_BYTE *)(a2 + 8) = 0;
  if (cf)
  {
    CFRetain(cf);
    v8 = cf;
  }

}

void sub_20ABF78A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void *cva::ItemHandler::getValue<unsigned int>(void **a1)
{
  void *result;

  result = *a1;
  if (result)
    return (void *)objc_msgSend(result, "unsignedIntValue");
  return result;
}

void *cva::ItemHandler::getValue<long long>(void **a1)
{
  void *result;

  result = *a1;
  if (result)
    return (void *)objc_msgSend(result, "longLongValue");
  return result;
}

void *cva::ItemHandler::getValue<unsigned long long>(void **a1)
{
  void *result;

  result = *a1;
  if (result)
    return (void *)objc_msgSend(result, "unsignedLongLongValue");
  return result;
}

float cva::ItemHandler::getValue<float>(void **a1)
{
  void *v1;
  float result;

  v1 = *a1;
  if (!v1)
    return 0.0;
  objc_msgSend(v1, "floatValue");
  return result;
}

double cva::ItemHandler::getValue<double>(void **a1)
{
  void *v1;
  double result;

  v1 = *a1;
  if (!v1)
    return 0.0;
  objc_msgSend(v1, "doubleValue");
  return result;
}

void cva::ItemHandler::getVector<BOOL>(const void **a1@<X0>, uint64_t a2@<X8>)
{
  id *v4;
  unsigned int v5;
  size_t v6;
  _BYTE *v7;
  uint64_t v8;
  id v9;
  const void *v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  id *v15;
  std::__shared_weak_count *v16;
  void *memptr;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  if ((cva::ItemHandler::isVectorType(a1) & 1) == 0)
    return;
  cva::ItemHandler::getArray((uint64_t)a1, &v15);
  v4 = v15;
  if (v15)
  {
    if (*v15)
    {
      v5 = objc_msgSend(*v15, "count");
      *(_DWORD *)(a2 + 16) = v5;
      if (v5)
      {
        v6 = (v5 + 31) & 0x1FFFFFFE0;
        *(_QWORD *)a2 = 0;
        *(_QWORD *)(a2 + 8) = v6;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v6, 0x49090899uLL);
        v7 = memptr;
        *(_QWORD *)a2 = memptr;
LABEL_8:
        v8 = 0;
        v9 = *v4;
        if (!*v4)
          goto LABEL_12;
LABEL_9:
        LODWORD(v9) = objc_msgSend(v9, "count");
LABEL_12:
        while (v8 < (int)v9)
        {
          if (*v4
            && v8 < (int)objc_msgSend(*v4, "count")
            && (v10 = (const void *)objc_msgSend(*v4, "objectAtIndex:", v8), (v11 = (void *)v10) != 0))
          {
            CFRetain(v10);
            v7[v8] = objc_msgSend(v11, "BOOLValue");
            CFRelease(v11);
          }
          else
          {
            v7[v8] = 0;
          }
          ++v8;
          v9 = *v4;
          if (*v4)
            goto LABEL_9;
        }
        goto LABEL_17;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 16) = 0;
    }
    v7 = 0;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    goto LABEL_8;
  }
LABEL_17:
  v12 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

void sub_20ABF7A94(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_20ABF7C34((uint64_t)va);
  free(0);
  _Unwind_Resume(a1);
}

unint64_t cva::ItemHandler::isVectorType(const void **this)
{
  unint64_t v1;
  id *v3;
  uint64_t v4;
  id v5;
  const void *v6;
  char isKindOfClass;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  id *v12;
  std::__shared_weak_count *v13;

  v1 = (unint64_t)*this;
  if (*this)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      cva::ItemHandler::getArray((uint64_t)this, &v12);
      v3 = v12;
      if (v12)
      {
        v4 = 0;
        while (1)
        {
          v5 = *v3;
          if (*v3)
            LODWORD(v5) = objc_msgSend(v5, "count");
          v1 = v4 >= (int)v5;
          if (v4 >= (int)v5)
            break;
          if (*v3 && v4 < (int)objc_msgSend(*v3, "count"))
          {
            v6 = (const void *)objc_msgSend(*v3, "objectAtIndex:", v4);
            v1 = (unint64_t)v6;
            if (!v6)
              break;
            CFRetain(v6);
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();
            CFRelease((CFTypeRef)v1);
            ++v4;
            if ((isKindOfClass & 1) != 0)
              continue;
          }
          goto LABEL_12;
        }
      }
      else
      {
LABEL_12:
        v1 = 0;
      }
      v8 = v13;
      if (v13)
      {
        p_shared_owners = (unint64_t *)&v13->__shared_owners_;
        do
          v10 = __ldaxr(p_shared_owners);
        while (__stlxr(v10 - 1, p_shared_owners));
        if (!v10)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

void sub_20ABF7C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_20ABF7C34((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_20ABF7C34(uint64_t a1)
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

void sub_20ABF7C8C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C380428;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_20ABF7C9C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C380428;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD2D02CLL);
}

void sub_20ABF7CCC(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 24);
  if (v1)
    CFRelease(v1);
}

void cva::ItemHandler::getVector<int>(const void **a1@<X0>, uint64_t a2@<X8>)
{
  id *v4;
  unsigned int v5;
  size_t v6;
  _DWORD *v7;
  uint64_t v8;
  id v9;
  const void *v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  id *v15;
  std::__shared_weak_count *v16;
  void *memptr;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  if ((cva::ItemHandler::isVectorType(a1) & 1) == 0)
    return;
  cva::ItemHandler::getArray((uint64_t)a1, &v15);
  v4 = v15;
  if (v15)
  {
    if (*v15)
    {
      v5 = objc_msgSend(*v15, "count");
      *(_DWORD *)(a2 + 16) = v5;
      if (v5)
      {
        v6 = (4 * v5 + 31) & 0x7FFFFFFE0;
        *(_QWORD *)a2 = 0;
        *(_QWORD *)(a2 + 8) = v6 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v6, 0x49090899uLL);
        v7 = memptr;
        *(_QWORD *)a2 = memptr;
LABEL_8:
        v8 = 0;
        v9 = *v4;
        if (!*v4)
          goto LABEL_12;
LABEL_9:
        LODWORD(v9) = objc_msgSend(v9, "count");
LABEL_12:
        while (v8 < (int)v9)
        {
          if (*v4
            && v8 < (int)objc_msgSend(*v4, "count")
            && (v10 = (const void *)objc_msgSend(*v4, "objectAtIndex:", v8), (v11 = (void *)v10) != 0))
          {
            CFRetain(v10);
            v7[v8] = objc_msgSend(v11, "intValue");
            CFRelease(v11);
          }
          else
          {
            v7[v8] = 0;
          }
          ++v8;
          v9 = *v4;
          if (*v4)
            goto LABEL_9;
        }
        goto LABEL_17;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 16) = 0;
    }
    v7 = 0;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    goto LABEL_8;
  }
LABEL_17:
  v12 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

void sub_20ABF7E48(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_20ABF7C34((uint64_t)va);
  free(0);
  _Unwind_Resume(a1);
}

void cva::ItemHandler::getVector<unsigned int>(const void **a1@<X0>, uint64_t a2@<X8>)
{
  id *v4;
  unsigned int v5;
  size_t v6;
  _DWORD *v7;
  uint64_t v8;
  id v9;
  const void *v10;
  void *v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  id *v15;
  std::__shared_weak_count *v16;
  void *memptr;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  if ((cva::ItemHandler::isVectorType(a1) & 1) == 0)
    return;
  cva::ItemHandler::getArray((uint64_t)a1, &v15);
  v4 = v15;
  if (v15)
  {
    if (*v15)
    {
      v5 = objc_msgSend(*v15, "count");
      *(_DWORD *)(a2 + 16) = v5;
      if (v5)
      {
        v6 = (4 * v5 + 31) & 0x7FFFFFFE0;
        *(_QWORD *)a2 = 0;
        *(_QWORD *)(a2 + 8) = v6 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v6, 0x49090899uLL);
        v7 = memptr;
        *(_QWORD *)a2 = memptr;
LABEL_8:
        v8 = 0;
        v9 = *v4;
        if (!*v4)
          goto LABEL_12;
LABEL_9:
        LODWORD(v9) = objc_msgSend(v9, "count");
LABEL_12:
        while (v8 < (int)v9)
        {
          if (*v4
            && v8 < (int)objc_msgSend(*v4, "count")
            && (v10 = (const void *)objc_msgSend(*v4, "objectAtIndex:", v8), (v11 = (void *)v10) != 0))
          {
            CFRetain(v10);
            v7[v8] = objc_msgSend(v11, "unsignedIntValue");
            CFRelease(v11);
          }
          else
          {
            v7[v8] = 0;
          }
          ++v8;
          v9 = *v4;
          if (*v4)
            goto LABEL_9;
        }
        goto LABEL_17;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 16) = 0;
    }
    v7 = 0;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    goto LABEL_8;
  }
LABEL_17:
  v12 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

{
  __ZNK3cva11ItemHandler9getVectorIjEENS_6MatrixIT_Lj0ELj1EXclsr6detailE7IsSmallIS3_XLj0EEXLj1EEEEEEEv(a1, a2);
}

void sub_20ABF7FFC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_20ABF7C34((uint64_t)va);
  free(0);
  _Unwind_Resume(a1);
}

void cva::ItemHandler::getVector<float>(const void **a1@<X0>, uint64_t a2@<X8>)
{
  id *v4;
  unsigned int v5;
  size_t v6;
  _DWORD *v7;
  uint64_t v8;
  id v9;
  const void *v10;
  void *v11;
  int v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  id *v16;
  std::__shared_weak_count *v17;
  void *memptr;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  if ((cva::ItemHandler::isVectorType(a1) & 1) == 0)
    return;
  cva::ItemHandler::getArray((uint64_t)a1, &v16);
  v4 = v16;
  if (v16)
  {
    if (*v16)
    {
      v5 = objc_msgSend(*v16, "count");
      *(_DWORD *)(a2 + 16) = v5;
      if (v5)
      {
        v6 = (4 * v5 + 31) & 0x7FFFFFFE0;
        *(_QWORD *)a2 = 0;
        *(_QWORD *)(a2 + 8) = v6 >> 2;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v6, 0x49090899uLL);
        v7 = memptr;
        *(_QWORD *)a2 = memptr;
LABEL_8:
        v8 = 0;
        v9 = *v4;
        if (!*v4)
          goto LABEL_12;
LABEL_9:
        LODWORD(v9) = objc_msgSend(v9, "count");
LABEL_12:
        while (v8 < (int)v9)
        {
          if (*v4
            && v8 < (int)objc_msgSend(*v4, "count")
            && (v10 = (const void *)objc_msgSend(*v4, "objectAtIndex:", v8), (v11 = (void *)v10) != 0))
          {
            CFRetain(v10);
            objc_msgSend(v11, "floatValue");
            v7[v8] = v12;
            CFRelease(v11);
          }
          else
          {
            v7[v8] = 0;
          }
          ++v8;
          v9 = *v4;
          if (*v4)
            goto LABEL_9;
        }
        goto LABEL_17;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 16) = 0;
    }
    v7 = 0;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    goto LABEL_8;
  }
LABEL_17:
  v13 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

{
  __ZNK3cva11ItemHandler9getVectorIfEENS_6MatrixIT_Lj0ELj1EXclsr6detailE7IsSmallIS3_XLj0EEXLj1EEEEEEEv(a1, a2);
}

void sub_20ABF81B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_20ABF7C34((uint64_t)va);
  free(0);
  _Unwind_Resume(a1);
}

void cva::ItemHandler::getVector<double>(const void **a1@<X0>, uint64_t a2@<X8>)
{
  id *v4;
  unsigned int v5;
  size_t v6;
  _QWORD *v7;
  uint64_t v8;
  id v9;
  const void *v10;
  void *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  id *v16;
  std::__shared_weak_count *v17;
  void *memptr;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  if ((cva::ItemHandler::isVectorType(a1) & 1) == 0)
    return;
  cva::ItemHandler::getArray((uint64_t)a1, &v16);
  v4 = v16;
  if (v16)
  {
    if (*v16)
    {
      v5 = objc_msgSend(*v16, "count");
      *(_DWORD *)(a2 + 16) = v5;
      if (v5)
      {
        v6 = (8 * v5 + 31) & 0xFFFFFFFE0;
        *(_QWORD *)a2 = 0;
        *(_QWORD *)(a2 + 8) = v6 >> 3;
        memptr = 0;
        malloc_type_posix_memalign(&memptr, 0x20uLL, v6, 0x49090899uLL);
        v7 = memptr;
        *(_QWORD *)a2 = memptr;
LABEL_8:
        v8 = 0;
        v9 = *v4;
        if (!*v4)
          goto LABEL_12;
LABEL_9:
        LODWORD(v9) = objc_msgSend(v9, "count");
LABEL_12:
        while (v8 < (int)v9)
        {
          if (*v4
            && v8 < (int)objc_msgSend(*v4, "count")
            && (v10 = (const void *)objc_msgSend(*v4, "objectAtIndex:", v8), (v11 = (void *)v10) != 0))
          {
            CFRetain(v10);
            objc_msgSend(v11, "doubleValue");
            v7[v8] = v12;
            CFRelease(v11);
          }
          else
          {
            v7[v8] = 0;
          }
          ++v8;
          v9 = *v4;
          if (*v4)
            goto LABEL_9;
        }
        goto LABEL_17;
      }
    }
    else
    {
      *(_DWORD *)(a2 + 16) = 0;
    }
    v7 = 0;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    goto LABEL_8;
  }
LABEL_17:
  v13 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

{
  __ZNK3cva11ItemHandler9getVectorIdEENS_6MatrixIT_Lj0ELj1EXclsr6detailE7IsSmallIS3_XLj0EEXLj1EEEEEEEv(a1, a2);
}

void sub_20ABF8364(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_20ABF7C34((uint64_t)va);
  free(0);
  _Unwind_Resume(a1);
}

void cva::ItemHandler::getMatrix<int>(cva::ItemHandler *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  id *v5;
  void *v6;
  const void *v7;
  char v8;
  id *v9;
  int v10;
  int v11;
  _DWORD *v12;
  unint64_t v13;
  size_t v14;
  uint64_t v15;
  int i;
  id v17;
  int v18;
  const void *v19;
  void *v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  int v27;
  void *memptr;
  char v29;
  id *v30;
  std::__shared_weak_count *v31;
  id *v32;
  std::__shared_weak_count *v33;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  if ((cva::ItemHandler::isMatrixType(a1) & 1) != 0)
  {
    cva::ItemHandler::getArray((uint64_t)a1, &v32);
    if (v32)
    {
      if (*v32)
      {
        v27 = objc_msgSend(*v32, "count");
        if (v27 >= 1)
        {
          v4 = 0;
          while (1)
          {
            v5 = v32;
            if (!*v32 || v4 >= (int)objc_msgSend(*v32, "count"))
              break;
            v6 = (void *)objc_msgSend(*v5, "objectAtIndex:", v4);
            v7 = v6;
            v8 = *((_BYTE *)v5 + 8);
            memptr = v6;
            v29 = v8;
            if (!v6)
              goto LABEL_12;
            CFRetain(v6);
LABEL_13:
            cva::ItemHandler::getArray((uint64_t)&memptr, &v30);
            if (v7)
              CFRelease(v7);
            v9 = v30;
            if (v30)
            {
              if (v4)
              {
                v11 = *(_DWORD *)(a2 + 16);
                v10 = *(_DWORD *)(a2 + 20);
                v12 = *(_DWORD **)a2;
              }
              else
              {
                if (*v30)
                  v10 = objc_msgSend(*v30, "count");
                else
                  v10 = 0;
                *(_DWORD *)(a2 + 16) = v27;
                *(_DWORD *)(a2 + 20) = v10;
                v13 = (v10 * v27);
                if ((_DWORD)v13)
                {
                  v12 = *(_DWORD **)a2;
                  if (*(_QWORD *)(a2 + 8) < v13)
                  {
                    free(*(void **)a2);
                    v14 = (4 * v13 + 31) & 0x7FFFFFFE0;
                    *(_QWORD *)a2 = 0;
                    *(_QWORD *)(a2 + 8) = v14 >> 2;
                    memptr = 0;
                    malloc_type_posix_memalign(&memptr, 0x20uLL, v14, 0x49090899uLL);
                    v12 = memptr;
                    *(_QWORD *)a2 = memptr;
                  }
                  v11 = v27;
                }
                else
                {
                  free(*(void **)a2);
                  v12 = 0;
                  *(_QWORD *)a2 = 0;
                  *(_QWORD *)(a2 + 8) = 0;
                  v11 = v27;
                }
              }
              v15 = 0;
              for (i = v4; ; i += v11)
              {
                v17 = *v9;
                if (*v9)
                  LODWORD(v17) = objc_msgSend(v17, "count");
                v18 = (int)v17 >= v10 ? v10 : (int)v17;
                if (v15 >= v18)
                  break;
                if (*v9
                  && v15 < (int)objc_msgSend(*v9, "count")
                  && (v19 = (const void *)objc_msgSend(*v9, "objectAtIndex:", v15), (v20 = (void *)v19) != 0))
                {
                  CFRetain(v19);
                  v12[i] = objc_msgSend(v20, "intValue");
                  CFRelease(v20);
                }
                else
                {
                  v12[i] = 0;
                }
                ++v15;
              }
            }
            v21 = v31;
            if (v31)
            {
              p_shared_owners = (unint64_t *)&v31->__shared_owners_;
              do
                v23 = __ldaxr(p_shared_owners);
              while (__stlxr(v23 - 1, p_shared_owners));
              if (!v23)
              {
                ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
                std::__shared_weak_count::__release_weak(v21);
              }
            }
            if (++v4 == v27)
              goto LABEL_44;
          }
          memptr = 0;
LABEL_12:
          v7 = 0;
          v29 = 0;
          goto LABEL_13;
        }
      }
    }
LABEL_44:
    v24 = v33;
    if (v33)
    {
      v25 = (unint64_t *)&v33->__shared_owners_;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
  }
}

void sub_20ABF8650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  sub_20ABF7C34((uint64_t)va);
  free(0);
  _Unwind_Resume(a1);
}

void cva::ItemHandler::getMatrix<double>(cva::ItemHandler *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  id *v5;
  void *v6;
  const void *v7;
  char v8;
  id *v9;
  int v10;
  int v11;
  _QWORD *v12;
  unint64_t v13;
  size_t v14;
  uint64_t v15;
  int i;
  id v17;
  int v18;
  const void *v19;
  void *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  int v28;
  void *memptr;
  char v30;
  id *v31;
  std::__shared_weak_count *v32;
  id *v33;
  std::__shared_weak_count *v34;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  if ((cva::ItemHandler::isMatrixType(a1) & 1) != 0)
  {
    cva::ItemHandler::getArray((uint64_t)a1, &v33);
    if (v33)
    {
      if (*v33)
      {
        v28 = objc_msgSend(*v33, "count");
        if (v28 >= 1)
        {
          v4 = 0;
          while (1)
          {
            v5 = v33;
            if (!*v33 || v4 >= (int)objc_msgSend(*v33, "count"))
              break;
            v6 = (void *)objc_msgSend(*v5, "objectAtIndex:", v4);
            v7 = v6;
            v8 = *((_BYTE *)v5 + 8);
            memptr = v6;
            v30 = v8;
            if (!v6)
              goto LABEL_12;
            CFRetain(v6);
LABEL_13:
            cva::ItemHandler::getArray((uint64_t)&memptr, &v31);
            if (v7)
              CFRelease(v7);
            v9 = v31;
            if (v31)
            {
              if (v4)
              {
                v11 = *(_DWORD *)(a2 + 16);
                v10 = *(_DWORD *)(a2 + 20);
                v12 = *(_QWORD **)a2;
              }
              else
              {
                if (*v31)
                  v10 = objc_msgSend(*v31, "count");
                else
                  v10 = 0;
                *(_DWORD *)(a2 + 16) = v28;
                *(_DWORD *)(a2 + 20) = v10;
                v13 = (v10 * v28);
                if ((_DWORD)v13)
                {
                  v12 = *(_QWORD **)a2;
                  if (*(_QWORD *)(a2 + 8) < v13)
                  {
                    free(*(void **)a2);
                    v14 = (8 * v13 + 31) & 0xFFFFFFFE0;
                    *(_QWORD *)a2 = 0;
                    *(_QWORD *)(a2 + 8) = v14 >> 3;
                    memptr = 0;
                    malloc_type_posix_memalign(&memptr, 0x20uLL, v14, 0x49090899uLL);
                    v12 = memptr;
                    *(_QWORD *)a2 = memptr;
                  }
                  v11 = v28;
                }
                else
                {
                  free(*(void **)a2);
                  v12 = 0;
                  *(_QWORD *)a2 = 0;
                  *(_QWORD *)(a2 + 8) = 0;
                  v11 = v28;
                }
              }
              v15 = 0;
              for (i = v4; ; i += v11)
              {
                v17 = *v9;
                if (*v9)
                  LODWORD(v17) = objc_msgSend(v17, "count");
                v18 = (int)v17 >= v10 ? v10 : (int)v17;
                if (v15 >= v18)
                  break;
                if (*v9
                  && v15 < (int)objc_msgSend(*v9, "count")
                  && (v19 = (const void *)objc_msgSend(*v9, "objectAtIndex:", v15), (v20 = (void *)v19) != 0))
                {
                  CFRetain(v19);
                  objc_msgSend(v20, "doubleValue");
                  v12[i] = v21;
                  CFRelease(v20);
                }
                else
                {
                  v12[i] = 0;
                }
                ++v15;
              }
            }
            v22 = v32;
            if (v32)
            {
              p_shared_owners = (unint64_t *)&v32->__shared_owners_;
              do
                v24 = __ldaxr(p_shared_owners);
              while (__stlxr(v24 - 1, p_shared_owners));
              if (!v24)
              {
                ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
                std::__shared_weak_count::__release_weak(v22);
              }
            }
            if (++v4 == v28)
              goto LABEL_44;
          }
          memptr = 0;
LABEL_12:
          v7 = 0;
          v30 = 0;
          goto LABEL_13;
        }
      }
    }
LABEL_44:
    v25 = v34;
    if (v34)
    {
      v26 = (unint64_t *)&v34->__shared_owners_;
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
  }
}

void sub_20ABF8968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  sub_20ABF7C34((uint64_t)va);
  free(0);
  _Unwind_Resume(a1);
}

uint64_t cva::ItemHandler::ItemHandler(uint64_t this)
{
  *(_QWORD *)this = 0;
  *(_BYTE *)(this + 8) = 0;
  return this;
}

{
  *(_QWORD *)this = 0;
  *(_BYTE *)(this + 8) = 0;
  return this;
}

uint64_t cva::ItemHandler::ItemHandler(uint64_t result, uint64_t a2)
{
  *(_QWORD *)result = *(_QWORD *)a2;
  *(_BYTE *)(result + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a2 = 0;
  return result;
}

{
  *(_QWORD *)result = *(_QWORD *)a2;
  *(_BYTE *)(result + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a2 = 0;
  return result;
}

uint64_t cva::ItemHandler::ItemHandler(uint64_t a1, uint64_t a2)
{
  const void *v3;

  v3 = *(const void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  if (v3)
    CFRetain(v3);
  else
    *(_BYTE *)(a1 + 8) = 0;
  return a1;
}

{
  const void *v3;

  v3 = *(const void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  if (v3)
    CFRetain(v3);
  else
    *(_BYTE *)(a1 + 8) = 0;
  return a1;
}

cva::ItemHandler *cva::ItemHandler::ItemHandler(cva::ItemHandler *this, const cva::DictionaryHandler *a2)
{
  const void *v3;

  v3 = *(const void **)a2;
  *(_QWORD *)this = *(_QWORD *)a2;
  *((_BYTE *)this + 8) = *((_BYTE *)a2 + 8);
  if (v3)
    CFRetain(v3);
  else
    *((_BYTE *)this + 8) = 0;
  return this;
}

{
  const void *v3;

  v3 = *(const void **)a2;
  *(_QWORD *)this = *(_QWORD *)a2;
  *((_BYTE *)this + 8) = *((_BYTE *)a2 + 8);
  if (v3)
    CFRetain(v3);
  else
    *((_BYTE *)this + 8) = 0;
  return this;
}

CFTypeRef cva::ItemHandler::createData@<X0>(CFTypeRef this@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = this;
  *(_BYTE *)(a2 + 8) = 0;
  if (this)
    return CFRetain(this);
  return this;
}

void cva::ItemHandler::createVector(cva::ItemHandler *this@<X0>, uint64_t a2@<X8>)
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", this);
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = 1;
  v4 = v3;
  if (v3)
    CFRetain(v3);
  else
    *(_BYTE *)(a2 + 8) = 0;

}

void sub_20ABF8C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t cva::ItemHandler::isDataType(cva::ItemHandler *this)
{
  char isKindOfClass;

  if (*(_QWORD *)this)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t cva::ItemHandler::isNumberType(cva::ItemHandler *this)
{
  char isKindOfClass;

  if (*(_QWORD *)this)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t cva::ItemHandler::isBoolType(cva::ItemHandler *this)
{
  char isKindOfClass;

  if (*(_QWORD *)this)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t cva::ItemHandler::isStringType(cva::ItemHandler *this)
{
  char isKindOfClass;

  if (*(_QWORD *)this)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t cva::ItemHandler::isArrayType(cva::ItemHandler *this)
{
  char isKindOfClass;

  if (*(_QWORD *)this)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t cva::ItemHandler::isDictionaryType(cva::ItemHandler *this)
{
  char isKindOfClass;

  if (*(_QWORD *)this)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

BOOL cva::ItemHandler::isVectorTypeOfSize(const void **this, int a2)
{
  void *v4;
  _BOOL8 v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  void **v10;
  std::__shared_weak_count *v11;

  if (!cva::ItemHandler::isVectorType(this))
    return 0;
  cva::ItemHandler::getArray((uint64_t)this, &v10);
  if (!v10)
  {
    v5 = 0;
    v6 = v11;
    if (!v11)
      return v5;
    goto LABEL_9;
  }
  v4 = *v10;
  if (*v10)
    LODWORD(v4) = objc_msgSend(v4, "count");
  v5 = (_DWORD)v4 == a2;
  v6 = v11;
  if (v11)
  {
LABEL_9:
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  return v5;
}

void sub_20ABF8E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_20ABF7C34((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_20ABF8E70(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C380498;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_20ABF8E80(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C380498;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD2D02CLL);
}

void sub_20ABF8EB0(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 24);
  if (v1)
    CFRelease(v1);
}

uint64_t cva::ItemHandler::getData(cva::ItemHandler *this)
{
  if (*(_QWORD *)this && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    return *(_QWORD *)this;
  else
    return 0;
}

uint64_t cva::DictionaryHandler::DictionaryHandler(uint64_t result, uint64_t a2)
{
  *(_QWORD *)result = *(_QWORD *)a2;
  *(_BYTE *)(result + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a2 = 0;
  return result;
}

{
  *(_QWORD *)result = *(_QWORD *)a2;
  *(_BYTE *)(result + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a2 = 0;
  return result;
}

CFIndex cva::DictionaryHandler::size(CFDictionaryRef *this)
{
  return CFDictionaryGetCount(*this);
}

void cva::DictionaryHandler::getKeys(CFDictionaryRef *this@<X0>, void **a2@<X8>)
{
  CFIndex Count;
  int v5;
  void **v6;
  void **v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  __int128 v12;
  void **v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  const char *v18;
  const char *v19;
  _BYTE *v20;
  _QWORD *v21;
  size_t v22;
  size_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  size_t v32;
  size_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  void **v38;
  void **v39;
  __int128 v40;
  void **v41;
  id v42;
  char *v43;
  char *v44;
  char *v45;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  Count = CFDictionaryGetCount(*this);
  v5 = Count;
  v6 = (void **)*a2;
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a2[2] - (_BYTE *)*a2) >> 3) < (int)Count)
  {
    if (Count << 32 < 0)
      abort();
    v7 = (void **)a2[1];
    v8 = (char *)operator new(24 * (int)Count);
    v9 = &v8[24 * v5];
    v10 = &v8[24 * (((char *)v7 - (char *)v6) / 24)];
    if (v7 == v6)
    {
      *a2 = v10;
      a2[1] = v10;
      a2[2] = v9;
    }
    else
    {
      v11 = &v8[24 * (((char *)v7 - (char *)v6) / 24)];
      do
      {
        v12 = *(_OWORD *)(v7 - 3);
        *((_QWORD *)v11 - 1) = *(v7 - 1);
        *(_OWORD *)(v11 - 24) = v12;
        v11 -= 24;
        *(v7 - 2) = 0;
        *(v7 - 1) = 0;
        *(v7 - 3) = 0;
        v7 -= 3;
      }
      while (v7 != v6);
      v6 = (void **)*a2;
      v13 = (void **)a2[1];
      *a2 = v11;
      a2[1] = v10;
      a2[2] = v9;
      while (v13 != v6)
      {
        if (*((char *)v13 - 1) < 0)
          operator delete(*(v13 - 3));
        v13 -= 3;
      }
    }
    if (v6)
      operator delete(v6);
  }
  -[__CFDictionary keyEnumerator](*this, "keyEnumerator");
  v42 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "nextObject");
  while (1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      break;
    v17 = objc_retainAutorelease(v16);
    v18 = (const char *)objc_msgSend(v17, "UTF8String");
    v19 = v18;
    v21 = a2[1];
    v20 = a2[2];
    if (v21 < (_QWORD *)v20)
    {
      v22 = strlen(v18);
      if (v22 > 0x7FFFFFFFFFFFFFF7)
        abort();
      v23 = v22;
      if (v22 < 0x17)
      {
        *((_BYTE *)v21 + 23) = v22;
        v14 = v21;
        if (v22)
          goto LABEL_16;
      }
      else
      {
        v24 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v22 | 7) != 0x17)
          v24 = v22 | 7;
        v25 = v24 + 1;
        v14 = operator new(v24 + 1);
        v21[1] = v23;
        v21[2] = v25 | 0x8000000000000000;
        *v21 = v14;
LABEL_16:
        memmove(v14, v19, v23);
      }
      *((_BYTE *)v14 + v23) = 0;
      v15 = v21 + 3;
      a2[1] = v21 + 3;
      goto LABEL_18;
    }
    v26 = 0xAAAAAAAAAAAAAAABLL * (((char *)v21 - (_BYTE *)*a2) >> 3);
    v27 = v26 + 1;
    if (v26 + 1 > 0xAAAAAAAAAAAAAAALL)
      abort();
    v28 = 0xAAAAAAAAAAAAAAABLL * ((v20 - (_BYTE *)*a2) >> 3);
    if (2 * v28 > v27)
      v27 = 2 * v28;
    if (v28 >= 0x555555555555555)
      v29 = 0xAAAAAAAAAAAAAAALL;
    else
      v29 = v27;
    if (v29)
    {
      if (v29 > 0xAAAAAAAAAAAAAAALL)
        sub_20ABAD09C();
      v30 = (char *)operator new(24 * v29);
    }
    else
    {
      v30 = 0;
    }
    v31 = &v30[24 * v26];
    v43 = v31;
    v44 = v31;
    v45 = &v30[24 * v29];
    v32 = strlen(v19);
    if (v32 > 0x7FFFFFFFFFFFFFF7)
      abort();
    v33 = v32;
    if (v32 >= 0x17)
    {
      v34 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v32 | 7) != 0x17)
        v34 = v32 | 7;
      v35 = v34 + 1;
      v36 = (char *)operator new(v34 + 1);
      *((_QWORD *)v31 + 1) = v33;
      *((_QWORD *)v31 + 2) = v35 | 0x8000000000000000;
      *(_QWORD *)v31 = v36;
      v31 = v36;
    }
    else
    {
      v31[23] = v32;
      if (!v32)
        goto LABEL_44;
    }
    memmove(v31, v19, v33);
LABEL_44:
    v31[v33] = 0;
    v37 = v43;
    v15 = v44 + 24;
    v38 = (void **)*a2;
    v39 = (void **)a2[1];
    if (v39 == *a2)
    {
      *a2 = v43;
      a2[1] = v15;
      a2[2] = v45;
    }
    else
    {
      do
      {
        v40 = *(_OWORD *)(v39 - 3);
        *((_QWORD *)v37 - 1) = *(v39 - 1);
        *(_OWORD *)(v37 - 24) = v40;
        v37 -= 24;
        *(v39 - 2) = 0;
        *(v39 - 1) = 0;
        *(v39 - 3) = 0;
        v39 -= 3;
      }
      while (v39 != v38);
      v39 = (void **)*a2;
      v41 = (void **)a2[1];
      *a2 = v37;
      a2[1] = v15;
      a2[2] = v45;
      while (v41 != v39)
      {
        if (*((char *)v41 - 1) < 0)
          operator delete(*(v41 - 3));
        v41 -= 3;
      }
    }
    if (v39)
      operator delete(v39);
LABEL_18:
    a2[1] = v15;

    objc_msgSend(v42, "nextObject");
  }

}

void sub_20ABF9414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, char a12)
{
  void **v12;

  sub_20ABF3B94(v12);
  _Unwind_Resume(a1);
}

uint64_t sub_20ABF9470(uint64_t a1)
{
  void **v2;
  void **v3;
  void **v5;

  v3 = *(void ***)(a1 + 8);
  v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
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
    while (v5 != v3);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

BOOL cva::DictionaryHandler::hasKey(id *this, const char *a2)
{
  CFStringRef v3;
  void *v4;
  _BOOL8 v5;

  v3 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  objc_msgSend(*this, "valueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  CFRelease(v3);
  return v5;
}

void sub_20ABF9540(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

void cva::DictionaryHandler::item(id *this@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  CFStringRef v5;
  const void *v6;
  char v7;

  v5 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v6 = (const void *)objc_msgSend(*this, "objectForKey:", v5);
  v7 = *((_BYTE *)this + 8);
  *(_QWORD *)a3 = v6;
  *(_BYTE *)(a3 + 8) = v7;
  if (v6)
    CFRetain(v6);
  else
    *(_BYTE *)(a3 + 8) = 0;
  CFRelease(v5);
}

void sub_20ABF95D0(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL cva::DictionaryHandler::setItem(id *this, const __CFString *a2, const cva::ItemHandler *a3)
{
  int v3;

  v3 = *((unsigned __int8 *)this + 8);
  if (*((_BYTE *)this + 8))
    objc_msgSend(*this, "setValue:forKey:", *(_QWORD *)a3, a2);
  return v3 != 0;
}

BOOL cva::DictionaryHandler::setItem(id *this, const char *a2, const cva::ItemHandler *a3)
{
  CFStringRef v5;
  int v6;

  v5 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v6 = *((unsigned __int8 *)this + 8);
  if (*((_BYTE *)this + 8))
    objc_msgSend(*this, "setValue:forKey:", *(_QWORD *)a3, v5);
  CFRelease(v5);
  return v6 != 0;
}

void sub_20ABF9698(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL cva::DictionaryHandler::removeItem(id *this, const __CFString *a2)
{
  int v2;

  v2 = *((unsigned __int8 *)this + 8);
  if (*((_BYTE *)this + 8))
    objc_msgSend(*this, "removeObjectForKey:", a2);
  return v2 != 0;
}

BOOL cva::DictionaryHandler::removeItem(id *this, const char *a2)
{
  CFStringRef v3;
  int v4;

  v3 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  v4 = *((unsigned __int8 *)this + 8);
  if (*((_BYTE *)this + 8))
    objc_msgSend(*this, "removeObjectForKey:", v3);
  CFRelease(v3);
  return v4 != 0;
}

void sub_20ABF9754(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t cva::DictionaryHandler::writeJsonFile(void **a1, uint64_t *a2, int a3, unsigned int a4)
{
  return sub_20ABF9770(*a1, a2, a3, a4);
}

uint64_t sub_20ABF9770(void *a1, uint64_t *a2, int a3, unsigned int a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a1;
  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v7) & 1) != 0)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF08]), "initToMemory");
    objc_msgSend(v8, "open");
    objc_msgSend(v8, "streamError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9
      || (v11 = objc_msgSend(MEMORY[0x24BDD1608], "writeJSONObject:toStream:options:error:", v7, v8, a3 ^ 1u, 0),
          objc_msgSend(v8, "close"),
          !v11))
    {
      v10 = 0;
    }
    else
    {
      v12 = objc_alloc(MEMORY[0x24BDD17C8]);
      if (*((char *)a2 + 23) >= 0)
        v13 = a2;
      else
        v13 = (uint64_t *)*a2;
      v14 = (void *)objc_msgSend(v12, "initWithUTF8String:", v13);
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF08]), "initToFileAtPath:append:", v14, 0);
      objc_msgSend(v15, "open");
      objc_msgSend(v15, "streamError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v10 = 0;
      }
      else
      {
        objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BDBCB88]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v17, "writeToFile:options:error:", v14, a4, 0);
        objc_msgSend(v15, "close");

      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_20ABF98E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void cva::DictionaryHandler::readJsonFile(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  id v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  char *v14;

  v4 = (void *)MEMORY[0x20BD2D50C]();
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (*((char *)a1 + 23) >= 0)
    v6 = a1;
  else
    v6 = (uint64_t *)*a1;
  v7 = (void *)objc_msgSend(v5, "initWithUTF8String:", v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE90]), "initWithFileAtPath:", v7);
  objc_msgSend(v8, "open");
  objc_msgSend(v8, "streamError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    *a2 = 0;
    a2[1] = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithStream:options:error:", v8, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "close");
    if (v10)
    {
      v11 = (void *)objc_msgSend(v10, "mutableCopy");
      v12 = operator new(0x28uLL);
      v13 = v12;
      v12[1] = 0;
      v12[2] = 0;
      *v12 = &off_24C380498;
      v12[3] = v11;
      v14 = (char *)(v12 + 3);
      *((_BYTE *)v12 + 32) = 1;
      if (v11)
        CFRetain(v11);
      else
        *((_BYTE *)v12 + 32) = 0;
      *a2 = v14;
      a2[1] = v13;

    }
    else
    {
      *a2 = 0;
      a2[1] = 0;
    }

  }
  objc_autoreleasePoolPop(v4);
}

void sub_20ABF9A6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  std::__shared_weak_count *v5;
  void *v7;

  std::__shared_weak_count::~__shared_weak_count(v5);
  operator delete(v7);

  _Unwind_Resume(a1);
}

uint64_t cva::DictionaryHandler::writePlistFile(id *a1, uint64_t *a2)
{
  id v3;
  id v4;
  uint64_t *v5;
  void *v6;
  uint64_t v7;

  v3 = *a1;
  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (*((char *)a2 + 23) >= 0)
    v5 = a2;
  else
    v5 = (uint64_t *)*a2;
  v6 = (void *)objc_msgSend(v4, "initWithUTF8String:", v5);
  v7 = objc_msgSend(v3, "writeToFile:atomically:", v6, 0);

  return v7;
}

void sub_20ABF9B34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void cva::DictionaryHandler::readPlistFile(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  id v4;
  uint64_t *v5;
  void *v6;
  _QWORD *v7;
  id v8;

  v4 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (*((char *)a1 + 23) >= 0)
    v5 = a1;
  else
    v5 = (uint64_t *)*a1;
  v8 = (id)objc_msgSend(v4, "initWithUTF8String:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v8);
  if (v6)
  {
    v7 = operator new(0x28uLL);
    v7[1] = 0;
    v7[2] = 0;
    *v7 = &off_24C380498;
    v7[3] = v6;
    *((_BYTE *)v7 + 32) = 1;
    CFRetain(v6);
    *a2 = v7 + 3;
    a2[1] = v7;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }

}

void sub_20ABF9C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  std::__shared_weak_count *v11;
  void *v13;

  std::__shared_weak_count::~__shared_weak_count(v11);
  operator delete(v13);

  _Unwind_Resume(a1);
}

uint64_t cva::DictionaryHandler::isConvertibleToJSON(cva::DictionaryHandler *this)
{
  return objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", *(_QWORD *)this);
}

cva::ArrayHandler *cva::ArrayHandler::ArrayHandler(cva::ArrayHandler *this)
{
  *(_QWORD *)this = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  *((_BYTE *)this + 8) = 1;
  return this;
}

{
  *(_QWORD *)this = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  *((_BYTE *)this + 8) = 1;
  return this;
}

uint64_t cva::ArrayHandler::ArrayHandler(uint64_t result, uint64_t a2)
{
  *(_QWORD *)result = *(_QWORD *)a2;
  *(_BYTE *)(result + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a2 = 0;
  return result;
}

{
  *(_QWORD *)result = *(_QWORD *)a2;
  *(_BYTE *)(result + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a2 = 0;
  return result;
}

cva::ArrayHandler *cva::ArrayHandler::ArrayHandler(cva::ArrayHandler *this, CFTypeRef cf)
{
  *(_QWORD *)this = cf;
  *((_BYTE *)this + 8) = 1;
  if (cf)
    CFRetain(cf);
  else
    *((_BYTE *)this + 8) = 0;
  return this;
}

{
  *(_QWORD *)this = cf;
  *((_BYTE *)this + 8) = 1;
  if (cf)
    CFRetain(cf);
  else
    *((_BYTE *)this + 8) = 0;
  return this;
}

{
  *(_QWORD *)this = cf;
  *((_BYTE *)this + 8) = 0;
  if (cf)
    CFRetain(cf);
  return this;
}

{
  *(_QWORD *)this = cf;
  *((_BYTE *)this + 8) = 0;
  if (cf)
    CFRetain(cf);
  return this;
}

void cva::ArrayHandler::~ArrayHandler(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

uint64_t *cva::ArrayHandler::operator=(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *result;
  *result = *a2;
  *a2 = v2;
  LOBYTE(v2) = *((_BYTE *)result + 8);
  *((_BYTE *)result + 8) = *((_BYTE *)a2 + 8);
  *((_BYTE *)a2 + 8) = v2;
  return result;
}

uint64_t cva::ArrayHandler::getArray(cva::ArrayHandler *this)
{
  return *(_QWORD *)this;
}

BOOL cva::ArrayHandler::validIndex(void **this, int a2)
{
  _BOOL8 result;
  void *v4;

  result = 0;
  if ((a2 & 0x80000000) == 0)
  {
    v4 = *this;
    if (v4)
      return (int)objc_msgSend(v4, "count") > a2;
  }
  return result;
}

uint64_t cva::ArrayHandler::setItem(id *this, int a2, const cva::ItemHandler *a3)
{
  uint64_t result;

  if (!*(_QWORD *)a3)
    return 0;
  result = 0;
  if ((a2 & 0x80000000) == 0 && *this)
  {
    if ((int)objc_msgSend(*this, "count") > a2 && *((_BYTE *)this + 8))
    {
      objc_msgSend(*this, "replaceObjectAtIndex:withObject:", a2, *(_QWORD *)a3);
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t cva::ArrayHandler::addItem(cva::ArrayHandler *this, const cva::ItemHandler *a2)
{
  if (!*(_QWORD *)a2 || !*((_BYTE *)this + 8))
    return 0;
  objc_msgSend(*(id *)this, "addObject:");
  return 1;
}

uint64_t cva::ArrayHandler::writeJsonFile(void **a1, uint64_t *a2, int a3, unsigned int a4)
{
  return sub_20ABF9770(*a1, a2, a3, a4);
}

void cva::ArrayHandler::readJsonFile(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v4;
  id v5;
  uint64_t *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  char *v14;

  v4 = (void *)MEMORY[0x20BD2D50C]();
  v5 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (*((char *)a1 + 23) >= 0)
    v6 = a1;
  else
    v6 = (uint64_t *)*a1;
  v7 = (void *)objc_msgSend(v5, "initWithUTF8String:", v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE90]), "initWithFileAtPath:", v7);
  objc_msgSend(v8, "open");
  objc_msgSend(v8, "streamError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    *a2 = 0;
    a2[1] = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithStream:options:error:", v8, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "close");
    if (v10)
    {
      v11 = (void *)objc_msgSend(v10, "mutableCopy");
      v12 = operator new(0x28uLL);
      v13 = v12;
      v12[1] = 0;
      v12[2] = 0;
      *v12 = &off_24C380428;
      v12[3] = v11;
      v14 = (char *)(v12 + 3);
      *((_BYTE *)v12 + 32) = 1;
      if (v11)
        CFRetain(v11);
      else
        *((_BYTE *)v12 + 32) = 0;
      *a2 = v14;
      a2[1] = v13;

    }
    else
    {
      *a2 = 0;
      a2[1] = 0;
    }

  }
  objc_autoreleasePoolPop(v4);
}

void sub_20ABFA0B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  std::__shared_weak_count *v5;
  void *v7;

  std::__shared_weak_count::~__shared_weak_count(v5);
  operator delete(v7);

  _Unwind_Resume(a1);
}

cva::DirectoryIterator::Private *cva::DirectoryIterator::Private::Private(cva::DirectoryIterator::Private *this)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = (_QWORD *)operator new();
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  *(_QWORD *)this = v2;
  *((_QWORD *)this + 1) = 0;
  v3 = (_QWORD *)operator new();
  v3[1] = 0;
  v3[2] = 0;
  *v3 = 0;
  *((_QWORD *)this + 2) = v3;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  return this;
}

{
  _QWORD *v2;
  _QWORD *v3;

  v2 = (_QWORD *)operator new();
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  *(_QWORD *)this = v2;
  *((_QWORD *)this + 1) = 0;
  v3 = (_QWORD *)operator new();
  v3[1] = 0;
  v3[2] = 0;
  *v3 = 0;
  *((_QWORD *)this + 2) = v3;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  return this;
}

uint64_t *cva::DirectoryIterator::Private::Private(uint64_t *a1, const char ***a2, __int128 *a3)
{
  const char **v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  _QWORD *v10;
  _BYTE *v11;
  __int128 v12;
  const char *v13;
  const char *v14;
  stat v16;

  v6 = *a2;
  v7 = operator new();
  v8 = v7;
  if (*((char *)v6 + 23) < 0)
  {
    sub_20AB88C14((_BYTE *)v7, (void *)*v6, (unint64_t)v6[1]);
  }
  else
  {
    v9 = *(_OWORD *)v6;
    *(_QWORD *)(v7 + 16) = v6[2];
    *(_OWORD *)v7 = v9;
  }
  *a1 = v8;
  a1[1] = 0;
  v10 = (_QWORD *)operator new();
  v10[1] = 0;
  v10[2] = 0;
  *v10 = 0;
  a1[2] = (uint64_t)v10;
  v11 = a1 + 3;
  if (*((char *)a3 + 23) < 0)
  {
    sub_20AB88C14(v11, *(void **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v12 = *a3;
    a1[5] = *((_QWORD *)a3 + 2);
    *(_OWORD *)v11 = v12;
  }
  v13 = (const char *)*a2;
  if (*((char *)*a2 + 23) < 0)
    v13 = *(const char **)v13;
  if (!stat(v13, &v16) && (v16.st_mode & 0xF000) == 0x4000)
  {
    if (*((char *)*a2 + 23) >= 0)
      v14 = (const char *)*a2;
    else
      v14 = **a2;
    a1[1] = (uint64_t)opendir(v14);
  }
  cva::DirectoryIterator::Private::seek_valid((cva::DirectoryIterator::Private *)a1);
  return a1;
}

void cva::DirectoryIterator::Private::seek_valid(cva::DirectoryIterator::Private *this)
{
  std::string **v2;
  char *v3;
  DIR *v4;
  size_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  __int128 *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  char *v18;
  const std::string::value_type *v19;
  int v20;
  const std::string::value_type *v21;
  std::string::size_type v22;
  uint64_t v23;
  uint64_t v24;
  void **v25;
  _BOOL4 v26;
  std::string *v27;
  std::string *v28;
  __darwin_ino64_t st_gid_high;
  int v30;
  uint64_t v31;
  int v32;
  char *v33;
  stat *v34;
  __darwin_ino64_t v35;
  __darwin_ct_rune_t v36;
  __darwin_ct_rune_t v37;
  __darwin_ct_rune_t st_dev_low;
  __darwin_ct_rune_t v39;
  __darwin_ct_rune_t v40;
  DIR *v42;
  uint64_t v43;
  char *v44;
  void *__p[2];
  unint64_t v46;
  dirent *v47;
  stat v48;
  dirent v49;
  uint64_t v50;

  v2 = (std::string **)((char *)this + 16);
  v50 = *MEMORY[0x24BDAC8D0];
  v3 = (char *)this + 24;
  while (1)
  {
    v4 = (DIR *)*((_QWORD *)this + 1);
    if (!v4)
      break;
    v47 = 0;
    if (readdir_r(v4, &v49, &v47) || !v47)
    {
      v42 = (DIR *)*((_QWORD *)this + 1);
      if (v42)
      {
        closedir(v42);
        *((_QWORD *)this + 1) = 0;
      }
      v43 = operator new();
      *(_QWORD *)(v43 + 8) = 0;
      *(_QWORD *)(v43 + 16) = 0;
      *(_QWORD *)v43 = 0;
      std::string::operator=(*v2, (const std::string *)v43);
      if (*(char *)(v43 + 23) < 0)
        operator delete(*(void **)v43);
      MEMORY[0x20BD2D02C](v43, 0x1012C40EC159624);
      return;
    }
    v5 = strlen(v49.d_name);
    if (v5 >= 0x7FFFFFFFFFFFFFF8)
      abort();
    v6 = (void *)v5;
    if (v5 >= 0x17)
    {
      v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v5 | 7) != 0x17)
        v8 = v5 | 7;
      v9 = v8 + 1;
      v7 = operator new(v8 + 1);
      __p[1] = v6;
      v46 = v9 | 0x8000000000000000;
      __p[0] = v7;
LABEL_13:
      memcpy(v7, v49.d_name, (size_t)v6);
      goto LABEL_14;
    }
    HIBYTE(v46) = v5;
    v7 = __p;
    if (v5)
      goto LABEL_13;
LABEL_14:
    *((_BYTE *)v6 + (_QWORD)v7) = 0;
    v10 = operator new();
    v11 = v10;
    v12 = HIBYTE(v46);
    if ((v46 & 0x8000000000000000) != 0)
    {
      sub_20AB88C14((_BYTE *)v10, __p[0], (unint64_t)__p[1]);
    }
    else
    {
      *(_OWORD *)v10 = *(_OWORD *)__p;
      *(_QWORD *)(v10 + 16) = v46;
    }
    v13 = *(__int128 **)this;
    v14 = operator new();
    v15 = v14;
    if (*((char *)v13 + 23) < 0)
    {
      sub_20AB88C14((_BYTE *)v14, *(void **)v13, *((_QWORD *)v13 + 1));
      LODWORD(v17) = *(char *)(v15 + 23);
      if ((v17 & 0x80000000) != 0)
      {
LABEL_22:
        v17 = *(_QWORD *)(v15 + 8);
        if (!v17)
          goto LABEL_32;
        v18 = *(char **)v15;
        goto LABEL_24;
      }
    }
    else
    {
      v16 = *v13;
      *(_QWORD *)(v14 + 16) = *((_QWORD *)v13 + 2);
      *(_OWORD *)v14 = v16;
      LODWORD(v17) = *(char *)(v14 + 23);
      if ((v17 & 0x80000000) != 0)
        goto LABEL_22;
    }
    v17 = v17;
    if (!(_BYTE)v17)
      goto LABEL_32;
    v18 = (char *)v15;
LABEL_24:
    if (v18[v17 - 1] != 47)
    {
      if (*(char *)(v11 + 23) < 0)
      {
        if (*(_QWORD *)(v11 + 8))
        {
          v19 = *(const std::string::value_type **)v11;
LABEL_30:
          if (*v19 != 47)
            std::string::push_back((std::string *)v15, 47);
        }
      }
      else
      {
        v19 = (const std::string::value_type *)v11;
        if (*(_BYTE *)(v11 + 23))
          goto LABEL_30;
      }
    }
LABEL_32:
    v20 = *(char *)(v11 + 23);
    if (v20 >= 0)
      v21 = (const std::string::value_type *)v11;
    else
      v21 = *(const std::string::value_type **)v11;
    if (v20 >= 0)
      v22 = *(unsigned __int8 *)(v11 + 23);
    else
      v22 = *(_QWORD *)(v11 + 8);
    std::string::append((std::string *)v15, v21, v22);
    v23 = operator new();
    v24 = v23;
    if (*(char *)(v15 + 23) < 0)
    {
      sub_20AB88C14((_BYTE *)v23, *(void **)v15, *(_QWORD *)(v15 + 8));
      if (*(char *)(v15 + 23) < 0)
        operator delete(*(void **)v15);
    }
    else
    {
      *(_OWORD *)v23 = *(_OWORD *)v15;
      *(_QWORD *)(v23 + 16) = *(_QWORD *)(v15 + 16);
    }
    MEMORY[0x20BD2D02C](v15, 0x1012C40EC159624);
    std::string::operator=(*v2, (const std::string *)v24);
    if (*(char *)(v24 + 23) < 0)
      operator delete(*(void **)v24);
    MEMORY[0x20BD2D02C](v24, 0x1012C40EC159624);
    if (*(char *)(v11 + 23) < 0)
      operator delete(*(void **)v11);
    MEMORY[0x20BD2D02C](v11, 0x1012C40EC159624);
    if ((v12 & 0x80) != 0)
    {
      if (__p[1] != (void *)1)
      {
        if (__p[1] != (void *)2)
          goto LABEL_59;
        v25 = (void **)__p[0];
        goto LABEL_53;
      }
      if (*(_BYTE *)__p[0] != 46)
        goto LABEL_59;
      operator delete(__p[0]);
    }
    else if (v12 == 1)
    {
      if (LOBYTE(__p[0]) != 46)
        goto LABEL_59;
    }
    else
    {
      if (v12 != 2)
        goto LABEL_59;
      v25 = __p;
LABEL_53:
      if (*(_WORD *)v25 == 11822)
      {
        v26 = 0;
        goto LABEL_62;
      }
LABEL_59:
      v27 = *v2;
      if (SHIBYTE((*v2)->__r_.__value_.__r.__words[2]) < 0)
        v27 = (std::string *)v27->__r_.__value_.__r.__words[0];
      v26 = 0;
      if (access((const char *)v27, 0))
        goto LABEL_62;
      if (*((char *)this + 47) < 0)
      {
        if (!*((_QWORD *)this + 4))
        {
LABEL_91:
          v26 = 1;
          goto LABEL_62;
        }
      }
      else if (!*((_BYTE *)this + 47))
      {
        goto LABEL_91;
      }
      v28 = *v2;
      if (SHIBYTE((*v2)->__r_.__value_.__r.__words[2]) < 0)
        v28 = (std::string *)v28->__r_.__value_.__r.__words[0];
      v26 = 0;
      if (stat((const char *)v28, &v48) || (v48.st_mode & 0xF000) != 0x8000)
        goto LABEL_62;
      cva::Path::extension((cva::Path *)v2, &v48);
      st_gid_high = HIBYTE(v48.st_gid);
      v30 = SHIBYTE(v48.st_gid);
      if ((v48.st_gid & 0x80000000) != 0)
        st_gid_high = v48.st_ino;
      v31 = *((unsigned __int8 *)this + 47);
      v32 = (char)v31;
      if ((v31 & 0x80u) != 0)
        v31 = *((_QWORD *)this + 4);
      if (st_gid_high == v31)
      {
        if (v32 >= 0)
          v33 = v3;
        else
          v33 = *(char **)v3;
        if (st_gid_high)
        {
          v44 = v3;
          if ((v48.st_gid & 0x80000000) == 0)
            v34 = &v48;
          else
            v34 = *(stat **)&v48.st_dev;
          v35 = st_gid_high - 1;
          do
          {
            v37 = *v33++;
            v36 = v37;
            st_dev_low = SLOBYTE(v34->st_dev);
            v34 = (stat *)((char *)v34 + 1);
            v39 = __toupper(v36);
            v40 = __toupper(st_dev_low);
            v26 = v39 == v40;
          }
          while (v39 == v40 && v35-- != 0);
          v3 = v44;
        }
        else
        {
          v26 = 1;
        }
        if ((v30 & 0x80000000) == 0)
          goto LABEL_62;
LABEL_96:
        operator delete(*(void **)&v48.st_dev);
        goto LABEL_62;
      }
      v26 = 0;
      if (SHIBYTE(v48.st_gid) < 0)
        goto LABEL_96;
LABEL_62:
      if ((v12 & 0x80) != 0)
      {
        operator delete(__p[0]);
        if (v26)
          return;
      }
      else if (v26)
      {
        return;
      }
    }
  }
}

void cva::DirectoryIterator::Private::close(cva::DirectoryIterator::Private *this)
{
  DIR *v2;
  uint64_t v3;

  v2 = (DIR *)*((_QWORD *)this + 1);
  if (v2)
  {
    closedir(v2);
    *((_QWORD *)this + 1) = 0;
  }
  v3 = operator new();
  *(_QWORD *)(v3 + 8) = 0;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)v3 = 0;
  std::string::operator=(*((std::string **)this + 2), (const std::string *)v3);
  if (*(char *)(v3 + 23) < 0)
    operator delete(*(void **)v3);
  JUMPOUT(0x20BD2D02CLL);
}

cva::DirectoryIterator *cva::DirectoryIterator::DirectoryIterator(cva::DirectoryIterator *this)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = (_QWORD *)operator new();
  v3 = (_QWORD *)operator new();
  v3[1] = 0;
  v3[2] = 0;
  *v3 = 0;
  *v2 = v3;
  v2[1] = 0;
  v4 = (_QWORD *)operator new();
  v4[1] = 0;
  v4[2] = 0;
  *v4 = 0;
  v2[2] = v4;
  v2[3] = 0;
  v2[4] = 0;
  v2[5] = 0;
  *(_QWORD *)this = v2;
  return this;
}

{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = (_QWORD *)operator new();
  v3 = (_QWORD *)operator new();
  v3[1] = 0;
  v3[2] = 0;
  *v3 = 0;
  *v2 = v3;
  v2[1] = 0;
  v4 = (_QWORD *)operator new();
  v4[1] = 0;
  v4[2] = 0;
  *v4 = 0;
  v2[2] = v4;
  v2[3] = 0;
  v2[4] = 0;
  v2[5] = 0;
  *(_QWORD *)this = v2;
  return this;
}

cva::DirectoryIterator *cva::DirectoryIterator::DirectoryIterator(cva::DirectoryIterator *this, const char ***a2)
{
  uint64_t *v4;
  __int128 v6;
  char v7;

  v4 = (uint64_t *)operator new();
  v7 = 0;
  LOBYTE(v6) = 0;
  *(_QWORD *)this = cva::DirectoryIterator::Private::Private(v4, a2, &v6);
  return this;
}

{
  uint64_t *v4;
  __int128 v6;
  char v7;

  v4 = (uint64_t *)operator new();
  v7 = 0;
  LOBYTE(v6) = 0;
  *(_QWORD *)this = cva::DirectoryIterator::Private::Private(v4, a2, &v6);
  return this;
}

uint64_t **cva::DirectoryIterator::DirectoryIterator(uint64_t **a1, const char ***a2, __int128 *a3)
{
  uint64_t *v6;

  v6 = (uint64_t *)operator new();
  *a1 = cva::DirectoryIterator::Private::Private(v6, a2, a3);
  return a1;
}

{
  uint64_t *v6;

  v6 = (uint64_t *)operator new();
  *a1 = cva::DirectoryIterator::Private::Private(v6, a2, a3);
  return a1;
}

void cva::DirectoryIterator::~DirectoryIterator(uint64_t **this)
{
  uint64_t *v2;
  DIR *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *this;
  v3 = (DIR *)(*this)[1];
  if (v3)
  {
    closedir(v3);
    v2[1] = 0;
  }
  v4 = operator new();
  *(_QWORD *)(v4 + 8) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)v4 = 0;
  std::string::operator=((std::string *)v2[2], (const std::string *)v4);
  if (*(char *)(v4 + 23) < 0)
    operator delete(*(void **)v4);
  MEMORY[0x20BD2D02C](v4, 0x1012C40EC159624);
  v5 = *this;
  *this = 0;
  if (v5)
  {
    if (*((char *)v5 + 47) < 0)
      operator delete((void *)v5[3]);
    v6 = v5[2];
    v5[2] = 0;
    if (v6)
    {
      if (*(char *)(v6 + 23) < 0)
        operator delete(*(void **)v6);
      MEMORY[0x20BD2D02C](v6, 0x1012C40EC159624);
    }
    v7 = *v5;
    *v5 = 0;
    if (v7)
    {
      if (*(char *)(v7 + 23) < 0)
        operator delete(*(void **)v7);
      MEMORY[0x20BD2D02C](v7, 0x1012C40EC159624);
    }
    MEMORY[0x20BD2D02C](v5, 0x1032C402EA5C23ELL);
  }
}

BOOL cva::DirectoryIterator::operator BOOL(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)a1 + 8) != 0;
}

uint64_t cva::DirectoryIterator::operator*(_QWORD *a1)
{
  return *a1 + 16;
}

uint64_t cva::DirectoryIterator::operator->(_QWORD *a1)
{
  return *a1 + 16;
}

cva::DirectoryIterator::Private **cva::DirectoryIterator::operator++(cva::DirectoryIterator::Private **a1)
{
  cva::DirectoryIterator::Private::seek_valid(*a1);
  return a1;
}

uint64_t cva::operator==(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  BOOL v6;
  unsigned __int8 *v7;
  unsigned __int8 **v8;
  uint64_t v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  int v12;
  unsigned __int8 *v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  BOOL v20;

  v2 = *a1;
  v3 = *(_QWORD *)(*a1 + 8);
  v4 = *(_QWORD *)(*(_QWORD *)a2 + 8);
  result = (v3 | v4) == 0;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = *(unsigned __int8 **)(v2 + 16);
    v8 = *(unsigned __int8 ***)(*(_QWORD *)a2 + 16);
    v9 = v7[23];
    if ((v9 & 0x80u) == 0)
      v10 = (unsigned __int8 *)v7[23];
    else
      v10 = (unsigned __int8 *)*((_QWORD *)v7 + 1);
    v11 = (unsigned __int8 *)*((unsigned __int8 *)v8 + 23);
    v12 = (char)v11;
    if ((char)v11 < 0)
      v11 = v8[1];
    if (v10 == v11)
    {
      if (v12 >= 0)
        v13 = *(unsigned __int8 **)(*(_QWORD *)a2 + 16);
      else
        v13 = *v8;
      if ((v9 & 0x80) != 0)
      {
        return memcmp(*(const void **)v7, v13, *((_QWORD *)v7 + 1)) == 0;
      }
      else if (v7[23])
      {
        v14 = v9 - 1;
        do
        {
          v16 = *v7++;
          v15 = v16;
          v18 = *v13++;
          v17 = v18;
          v20 = v14-- != 0;
          result = v15 == v17;
        }
        while (v15 == v17 && v20);
      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

double cva::ImageDirectory::ImageDirectory(cva::ImageDirectory *this)
{
  double result;

  *((_QWORD *)this + 10) = 0;
  result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = (char *)this + 80;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = (char *)this + 80;
  return result;
}

{
  double result;

  *((_QWORD *)this + 10) = 0;
  result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = (char *)this + 80;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 12) = (char *)this + 80;
  return result;
}

uint64_t cva::ImageDirectory::open(std::string *a1, const std::string *a2, const std::string *a3)
{
  uint64_t i;
  const char *v6;
  size_t v7;
  size_t v8;
  __int128 *p_dst;
  uint64_t v10;
  uint64_t v11;
  std::string::size_type size;
  char *v13;
  int v14;
  __int128 __dst;
  unint64_t v17;

  std::string::operator=(a1, a2);
  std::string::operator=(a1 + 1, a3);
  for (i = 0; i != 6; ++i)
  {
    v6 = (&off_24C380748)[i];
    v7 = strlen(v6);
    if (v7 >= 0x7FFFFFFFFFFFFFF8)
      abort();
    v8 = v7;
    if (v7 >= 0x17)
    {
      v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v7 | 7) != 0x17)
        v10 = v7 | 7;
      v11 = v10 + 1;
      p_dst = (__int128 *)operator new(v10 + 1);
      *((_QWORD *)&__dst + 1) = v8;
      v17 = v11 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
LABEL_11:
      memmove(p_dst, v6, v8);
      goto LABEL_12;
    }
    HIBYTE(v17) = v7;
    p_dst = &__dst;
    if (v7)
      goto LABEL_11;
LABEL_12:
    *((_BYTE *)p_dst + v8) = 0;
    size = a1[2].__r_.__value_.__l.__size_;
    if (size < a1[2].__r_.__value_.__r.__words[2])
    {
      *(_OWORD *)size = __dst;
      *(_QWORD *)(size + 16) = v17;
      a1[2].__r_.__value_.__l.__size_ = size + 24;
    }
    else
    {
      v13 = sub_20ABDF524((void **)&a1[2].__r_.__value_.__l.__data_, (uint64_t)&__dst);
      v14 = SHIBYTE(v17);
      a1[2].__r_.__value_.__l.__size_ = (std::string::size_type)v13;
      if (v14 < 0)
        operator delete((void *)__dst);
    }
  }
  return cva::ImageDirectory::parseDirectory((cva::ImageDirectory *)a1);
}

uint64_t cva::ImageDirectory::parseDirectory(cva::ImageDirectory *this)
{
  uint64_t v2;
  const char **v3;
  const char *v4;
  uint64_t v5;
  const char *v7;
  uint64_t *v8;
  uint64_t v9;
  cva::Path *v10;
  __darwin_ino64_t st_gid_high;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char **v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  char v23;
  char v24;
  char *v25;
  int64_t v26;
  std::string *p_str;
  int64_t size;
  char *v29;
  int v30;
  int64_t v31;
  std::string *v32;
  int64_t v33;
  char *v34;
  char *v35;
  int64_t v36;
  char *v37;
  char *v38;
  unint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  unint64_t v44;
  _BYTE *v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  std::ios_base *v50;
  char *v51;
  uint64_t v52;
  __int128 v53;
  void **v54;
  int v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  int v60;
  unint64_t v61;
  __int128 *v62;
  _OWORD *v63;
  unint64_t v64;
  __int128 v65;
  char *v66;
  int v67;
  uint64_t v68;
  char *v69;
  char *v70;
  uint64_t **v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t *v75;
  void **i;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  size_t __idx;
  void *v88;
  char *v89;
  unint64_t v90;
  void *__p[2];
  unint64_t v92;
  stat v93;
  std::string __str;
  char *v95;
  uint64_t v96;
  unsigned __int8 v97;
  uint64_t *v98;
  const char **v99;

  v2 = operator new();
  v3 = (const char **)v2;
  if (*((char *)this + 23) < 0)
  {
    sub_20AB88C14((_BYTE *)v2, *(void **)this, *((_QWORD *)this + 1));
  }
  else
  {
    *(_OWORD *)v2 = *(_OWORD *)this;
    *(_QWORD *)(v2 + 16) = *((_QWORD *)this + 2);
  }
  v99 = v3;
  v4 = (const char *)v3;
  if (*((char *)v3 + 23) < 0)
    v4 = *v3;
  if (!access(v4, 0))
  {
    v7 = (const char *)v3;
    if (*((char *)v3 + 23) < 0)
      v7 = *v3;
    v5 = 0;
    if (stat(v7, &v93) || (v93.st_mode & 0xF000) != 0x4000)
      goto LABEL_8;
    sub_20AB96A90(*((char **)this + 10));
    *((_QWORD *)this + 9) = (char *)this + 80;
    *((_QWORD *)this + 10) = 0;
    *((_QWORD *)this + 11) = 0;
    v8 = (uint64_t *)operator new();
    HIBYTE(v93.st_gid) = 0;
    LOBYTE(v93.st_dev) = 0;
    v98 = cva::DirectoryIterator::Private::Private(v8, &v99, (__int128 *)&v93.st_dev);
    v86 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
    v84 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 32);
    v85 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
    v82 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 48);
    v83 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 40);
    v81 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 8);
    v79 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
    v80 = *MEMORY[0x24BEDB7F0];
    v78 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
    v77 = MEMORY[0x24BEDB848] + 16;
    while (1)
    {
      if (!v8[1])
      {
        *((_QWORD *)this + 12) = *((_QWORD *)this + 9);
        cva::DirectoryIterator::~DirectoryIterator(&v98);
        v3 = v99;
        v5 = 1;
        if (!v99)
          return v5;
        goto LABEL_8;
      }
      v10 = (cva::Path *)(v8 + 2);
      v9 = v8[2];
      if (*(char *)(v9 + 23) < 0)
        v9 = *(_QWORD *)v9;
      if (stat((const char *)v9, &v93) || (v93.st_mode & 0xF000) != 0x4000)
        break;
LABEL_18:
      cva::DirectoryIterator::Private::seek_valid((cva::DirectoryIterator::Private *)v8);
    }
    cva::Path::extension((cva::Path *)(v8 + 2), &v93);
    if ((v93.st_gid & 0x80000000) == 0)
      st_gid_high = HIBYTE(v93.st_gid);
    else
      st_gid_high = v93.st_ino;
    if (SHIBYTE(v93.st_gid) < 0)
    {
      operator delete(*(void **)&v93.st_dev);
      if (!st_gid_high)
        goto LABEL_18;
    }
    else if (!st_gid_high)
    {
      goto LABEL_18;
    }
    cva::Path::extension((cva::Path *)(v8 + 2), &v95);
    if ((v97 & 0x80u) == 0)
      v12 = (char *)&v95 + v97;
    else
      v12 = &v95[v96];
    if ((v97 & 0x80u) == 0)
      v13 = (char *)&v95;
    else
      v13 = v95;
    for (; v13 != v12; ++v13)
      *v13 = __tolower(*v13);
    v14 = *((_QWORD *)this + 6);
    v15 = *((_QWORD *)this + 7);
    if (v14 != v15)
    {
      if ((v97 & 0x80u) == 0)
        v16 = v97;
      else
        v16 = v96;
      if ((v97 & 0x80u) == 0)
        v17 = &v95;
      else
        v17 = (char **)v95;
      while (1)
      {
        v18 = *(unsigned __int8 *)(v14 + 23);
        if ((v18 & 0x80u) == 0)
          v19 = *(unsigned __int8 *)(v14 + 23);
        else
          v19 = *(_QWORD *)(v14 + 8);
        if (v19 == v16)
        {
          if ((v18 & 0x80) != 0)
          {
            if (!memcmp(*(const void **)v14, v17, *(_QWORD *)(v14 + 8)))
              break;
          }
          else
          {
            if (!*(_BYTE *)(v14 + 23))
              break;
            v20 = 0;
            while (*(unsigned __int8 *)(v14 + v20) == *((unsigned __int8 *)v17 + v20))
            {
              if (v18 == ++v20)
                goto LABEL_57;
            }
          }
        }
        v14 += 24;
        if (v14 == v15)
          goto LABEL_161;
      }
    }
LABEL_57:
    if (v14 == v15)
    {
LABEL_161:
      if ((char)v97 < 0)
        operator delete(v95);
      v8 = v98;
      goto LABEL_18;
    }
    cva::Path::filename(v10, (uint64_t *)&v93.st_dev);
    v21 = *(_QWORD *)&v93.st_dev;
    if (*(char *)(*(_QWORD *)&v93.st_dev + 23) < 0)
    {
      sub_20AB88C14(&__str, **(void ***)&v93.st_dev, *(_QWORD *)(*(_QWORD *)&v93.st_dev + 8));
      if ((*(char *)(v21 + 23) & 0x80000000) == 0)
      {
LABEL_61:
        MEMORY[0x20BD2D02C](v21, 0x1012C40EC159624);
        v23 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        v24 = *((_BYTE *)this + 47);
        if (v24 >= 0)
          v25 = (char *)this + 24;
        else
          v25 = (char *)*((_QWORD *)this + 3);
        if (v24 >= 0)
          v26 = *((unsigned __int8 *)this + 47);
        else
          v26 = *((_QWORD *)this + 4);
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_str = &__str;
        else
          p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        else
          size = __str.__r_.__value_.__l.__size_;
        if (v26)
        {
          if (size >= v26)
          {
            v29 = (char *)p_str + size;
            v30 = *v25;
            v31 = size;
            v32 = p_str;
            while (1)
            {
              v33 = v31 - v26;
              if (v33 == -1)
                break;
              v34 = (char *)memchr(v32, v30, v33 + 1);
              if (!v34)
                break;
              v35 = v34;
              if (!memcmp(v34, v25, v26))
              {
                if (v35 != v29)
                {
                  v36 = v35 - (char *)p_str;
                  if (v35 - (char *)p_str != -1)
                    goto LABEL_84;
                }
                goto LABEL_159;
              }
              v32 = (std::string *)(v35 + 1);
              v31 = v29 - (v35 + 1);
              if (v31 < v26)
                goto LABEL_159;
            }
          }
          goto LABEL_159;
        }
        v36 = 0;
LABEL_84:
        v37 = (char *)p_str + v36 + v26;
        v38 = (char *)p_str + size;
        v39 = size - (v36 + v26);
        if (v39 >= 0x7FFFFFFFFFFFFFF8)
          abort();
        if (v39 > 0x16)
        {
          v41 = (v39 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v39 | 7) != 0x17)
            v41 = v39 | 7;
          v42 = v41 + 1;
          v40 = operator new(v41 + 1);
          __p[1] = (void *)(size - (v36 + v26));
          v92 = v42 | 0x8000000000000000;
          __p[0] = v40;
          if (v37 == v38)
            goto LABEL_96;
        }
        else
        {
          HIBYTE(v92) = size - (v36 + v26);
          v40 = __p;
          if (v37 == v38)
            goto LABEL_96;
        }
        v43 = v26 + v36;
        v44 = size - (v26 + v36);
        if (v44 >= 0x20 && (unint64_t)(v40 - ((char *)p_str + v43)) >= 0x20)
        {
          v61 = v44 & 0xFFFFFFFFFFFFFFE0;
          v45 = &v40[v44 & 0xFFFFFFFFFFFFFFE0];
          v62 = (__int128 *)((char *)&p_str->__r_.__value_.__r.__words[2] + v43);
          v63 = v40 + 16;
          v64 = v44 & 0xFFFFFFFFFFFFFFE0;
          do
          {
            v65 = *v62;
            *(v63 - 1) = *(v62 - 1);
            *v63 = v65;
            v62 += 2;
            v63 += 2;
            v64 -= 32;
          }
          while (v64);
          if (v44 == v61)
          {
            v40 += v44 & 0xFFFFFFFFFFFFFFE0;
            goto LABEL_96;
          }
          v37 += v61;
        }
        else
        {
          v45 = v40;
        }
        v40 = v45;
        do
        {
          v46 = *v37++;
          *v40++ = v46;
        }
        while (v37 != v38);
LABEL_96:
        *v40 = 0;
        v47 = MEMORY[0x24BEDB858];
        v48 = MEMORY[0x24BEDB858] + 104;
        v93.st_qspare[0] = MEMORY[0x24BEDB858] + 104;
        v49 = MEMORY[0x24BEDB858] + 64;
        *(_QWORD *)&v93.st_uid = MEMORY[0x24BEDB858] + 64;
        *(_QWORD *)&v93.st_dev = v86;
        *(_QWORD *)((char *)&v93.st_dev + *(_QWORD *)(v86 - 24)) = v85;
        v93.st_ino = 0;
        v50 = (std::ios_base *)((char *)&v93 + *(_QWORD *)(*(_QWORD *)&v93.st_dev - 24));
        std::ios_base::init(v50, &v93.st_rdev);
        v50[1].__vftable = 0;
        v50[1].__fmtflags_ = -1;
        *(_QWORD *)((char *)&v93.st_uid + *(_QWORD *)(v84 - 24)) = v83;
        *(_QWORD *)((char *)&v93.st_dev + *(_QWORD *)(v81 - 24)) = v82;
        v93.st_qspare[0] = v48;
        *(_QWORD *)&v93.st_dev = v47 + 24;
        *(_QWORD *)&v93.st_uid = v49;
        std::streambuf::basic_streambuf();
        *(_QWORD *)&v93.st_rdev = v77;
        memset(&v93.st_birthtimespec.tv_nsec, 0, 32);
        v93.st_gen = 24;
        std::stringbuf::str();
        if (SHIBYTE(v92) < 0)
          operator delete(__p[0]);
        v51 = 0;
        __p[0] = 0;
        __p[1] = 0;
        v92 = 0;
        v88 = 0;
        v89 = 0;
        v90 = 0;
        v52 = MEMORY[0x24BDAC740];
        while (1)
        {
          sub_20AB96AD8(&v93, (uint64_t)__p, 0x2Eu);
          if ((*((_BYTE *)&v93.st_atimespec.tv_sec + *(_QWORD *)(*(_QWORD *)&v93.st_dev - 24)) & 5) != 0)
            break;
          if ((unint64_t)v51 >= v90)
          {
            v51 = sub_20ABDB5B4((uint64_t)&v88, (uint64_t)__p);
            v89 = v51;
          }
          else
          {
            if (SHIBYTE(v92) < 0)
            {
              sub_20AB88C14(v51, __p[0], (unint64_t)__p[1]);
            }
            else
            {
              v53 = *(_OWORD *)__p;
              *((_QWORD *)v51 + 2) = v92;
              *(_OWORD *)v51 = v53;
            }
            v51 += 24;
            v89 = v51;
          }
        }
        v54 = (void **)v88;
        if (v51 - 24 == v88)
        {
LABEL_147:
          if (v54)
          {
            for (i = (void **)v89; i != v54; i -= 3)
            {
              if (*((char *)i - 1) < 0)
                operator delete(*(i - 3));
            }
            operator delete(v54);
          }
          if (SHIBYTE(v92) < 0)
            operator delete(__p[0]);
          *(_QWORD *)&v93.st_dev = v80;
          *(_QWORD *)((char *)&v93.st_dev + *(_QWORD *)(v80 - 24)) = v79;
          *(_QWORD *)&v93.st_uid = v78;
          *(_QWORD *)&v93.st_rdev = MEMORY[0x24BEDB848] + 16;
          if (SHIBYTE(v93.st_blocks) < 0)
            operator delete((void *)v93.st_birthtimespec.tv_nsec);
          std::streambuf::~streambuf();
          std::iostream::~basic_iostream();
          MEMORY[0x20BD2D008](v93.st_qspare);
          v23 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
LABEL_159:
          if (v23 < 0)
            operator delete(__str.__r_.__value_.__l.__data_);
          goto LABEL_161;
        }
        v55 = *(v51 - 25);
        if (v55 >= 0)
          v56 = v51 - 48;
        else
          v56 = (char *)*((_QWORD *)v51 - 6);
        v57 = *(v51 - 25);
        if (v55 < 0)
          v57 = *((_QWORD *)v51 - 5);
        v58 = &v56[v57];
        if (v57)
        {
          while ((*v56 & 0x80000000) == 0 && (*(_DWORD *)(v52 + 4 * *v56 + 60) & 0x400) != 0)
          {
            ++v56;
            if (!--v57)
              goto LABEL_133;
          }
          if (v56 == v58 || v56 + 1 == v58)
          {
            v58 = v56;
            v66 = v51 - 48;
            if ((v55 & 0x80) == 0)
              goto LABEL_135;
            goto LABEL_134;
          }
          v59 = 1;
          v58 = v56;
          do
          {
            v60 = v56[v59];
            if ((v60 & 0x80000000) == 0 && (*(_DWORD *)(v52 + 4 * v56[v59] + 60) & 0x400) != 0)
              *v58++ = v60;
            ++v59;
          }
          while (v57 != v59);
          LOBYTE(v55) = *(v51 - 25);
        }
LABEL_133:
        v66 = v51 - 48;
        if ((v55 & 0x80) == 0)
        {
LABEL_135:
          std::string::erase((std::string *)v51 - 2, v58 - v66, 1uLL);
          __idx = 0;
          v67 = std::stoi((const std::string *)v51 - 2, &__idx, 10);
          if (__idx)
          {
            v68 = v67;
            v69 = (char *)this + 80;
            while (1)
            {
              v70 = *(char **)v69;
              v71 = (uint64_t **)v69;
              if (!*(_QWORD *)v69)
                break;
              while (1)
              {
                v69 = v70;
                v72 = *((_QWORD *)v70 + 4);
                if (v72 > v67)
                  break;
                if (v72 >= v67)
                  goto LABEL_145;
                v70 = (char *)*((_QWORD *)v69 + 1);
                if (!v70)
                {
                  v71 = (uint64_t **)(v69 + 8);
                  goto LABEL_142;
                }
              }
            }
LABEL_142:
            v73 = v69;
            v69 = (char *)operator new(0x40uLL);
            *((_QWORD *)v69 + 4) = v68;
            *((_QWORD *)v69 + 5) = 0;
            *((_QWORD *)v69 + 6) = 0;
            *((_QWORD *)v69 + 7) = 0;
            *(_QWORD *)v69 = 0;
            *((_QWORD *)v69 + 1) = 0;
            *((_QWORD *)v69 + 2) = v73;
            *v71 = (uint64_t *)v69;
            v74 = **((_QWORD **)this + 9);
            v75 = (uint64_t *)v69;
            if (v74)
            {
              *((_QWORD *)this + 9) = v74;
              v75 = *v71;
            }
            sub_20AB96C04(*((uint64_t **)this + 10), v75);
            ++*((_QWORD *)this + 11);
LABEL_145:
            std::string::operator=((std::string *)(v69 + 40), &__str);
          }
          v54 = (void **)v88;
          goto LABEL_147;
        }
LABEL_134:
        v66 = (char *)*((_QWORD *)v51 - 6);
        goto LABEL_135;
      }
    }
    else
    {
      v22 = *(_OWORD *)*(_QWORD *)&v93.st_dev;
      __str.__r_.__value_.__r.__words[2] = *(_QWORD *)(*(_QWORD *)&v93.st_dev + 16);
      *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v22;
      if ((*(char *)(*(_QWORD *)&v93.st_dev + 23) & 0x80000000) == 0)
        goto LABEL_61;
    }
    operator delete(*(void **)v21);
    goto LABEL_61;
  }
  v5 = 0;
LABEL_8:
  if (*((char *)v3 + 23) < 0)
    operator delete((void *)*v3);
  MEMORY[0x20BD2D02C](v3, 0x1012C40EC159624);
  return v5;
}

uint64_t cva::ImageDirectory::open(std::string *a1, const std::string *a2, const std::string *a3, uint64_t a4)
{
  std::string::pointer data;
  std::string::size_type i;
  __int128 v9;
  char *v10;

  std::string::operator=(a1, a2);
  std::string::operator=(a1 + 1, a3);
  data = a1[2].__r_.__value_.__l.__data_;
  for (i = a1[2].__r_.__value_.__l.__size_; (std::string::pointer)i != data; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[2].__r_.__value_.__l.__size_ = (std::string::size_type)data;
  if ((unint64_t)data >= a1[2].__r_.__value_.__r.__words[2])
  {
    v10 = sub_20ABDB5B4((uint64_t)&a1[2], a4);
  }
  else
  {
    if (*(char *)(a4 + 23) < 0)
    {
      sub_20AB88C14(data, *(void **)a4, *(_QWORD *)(a4 + 8));
    }
    else
    {
      v9 = *(_OWORD *)a4;
      *((_QWORD *)data + 2) = *(_QWORD *)(a4 + 16);
      *(_OWORD *)data = v9;
    }
    v10 = data + 24;
  }
  a1[2].__r_.__value_.__l.__size_ = (std::string::size_type)v10;
  return cva::ImageDirectory::parseDirectory((cva::ImageDirectory *)a1);
}

void cva::ImageDirectory::close(char **this)
{
  _QWORD *v1;

  v1 = this + 10;
  sub_20AB96A90(this[10]);
  *(v1 - 1) = v1;
  *v1 = 0;
  v1[1] = 0;
  v1[2] = v1;
}

uint64_t cva::ImageDirectory::getCurrentImageName(cva::ImageDirectory *this)
{
  return *((_QWORD *)this + 12) + 40;
}

void cva::ImageDirectory::getCurrentImagePath(cva::ImageDirectory *this@<X0>, std::string *a2@<X8>)
{
  int v3;
  size_t v4;
  unint64_t v5;
  std::string *p_dst;
  uint64_t v8;
  uint64_t v9;
  cva::ImageDirectory *v10;
  uint64_t v11;
  uint64_t v12;
  const std::string::value_type *v13;
  const std::string::value_type *v14;
  int v15;
  const std::string::value_type *v16;
  std::string::size_type v17;
  std::string *v18;
  std::string __dst;

  v3 = *((char *)this + 23);
  if (v3 >= 0)
    v4 = *((unsigned __int8 *)this + 23);
  else
    v4 = *((_QWORD *)this + 1);
  v5 = v4 + 1;
  if (v4 + 1 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  if (v5 >= 0x17)
  {
    v8 = (v5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v5 | 7) != 0x17)
      v8 = v5 | 7;
    v9 = v8 + 1;
    p_dst = (std::string *)operator new(v8 + 1);
    __dst.__r_.__value_.__l.__size_ = v4 + 1;
    __dst.__r_.__value_.__r.__words[2] = v9 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
  }
  else
  {
    memset(&__dst, 0, sizeof(__dst));
    p_dst = &__dst;
    *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v4 + 1;
    if (!v4)
      goto LABEL_15;
  }
  if (v3 >= 0)
    v10 = this;
  else
    v10 = *(cva::ImageDirectory **)this;
  memmove(p_dst, v10, v4);
LABEL_15:
  *(_WORD *)((char *)&p_dst->__r_.__value_.__l.__data_ + v4) = 47;
  v11 = *((_QWORD *)this + 12);
  v14 = *(const std::string::value_type **)(v11 + 40);
  v12 = v11 + 40;
  v13 = v14;
  v15 = *(char *)(v12 + 23);
  if (v15 >= 0)
    v16 = (const std::string::value_type *)v12;
  else
    v16 = v13;
  if (v15 >= 0)
    v17 = *(unsigned __int8 *)(v12 + 23);
  else
    v17 = *(_QWORD *)(v12 + 8);
  v18 = std::string::append(&__dst, v16, v17);
  *a2 = *v18;
  v18->__r_.__value_.__r.__words[0] = 0;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
}

const char *cva::ImageDirectory::getCurrentImageFormat(cva::ImageDirectory **this, char *a2, unsigned int *a3, unsigned int *a4)
{
  unsigned int *v7;
  std::string *p_p;
  const char *v9;
  std::string __p;

  if (this[12] == (cva::ImageDirectory *)(this + 10))
    return 0;
  cva::ImageDirectory::getCurrentImagePath((cva::ImageDirectory *)this, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v9 = cva::imfinfo((const char *)p_p, a2, a3, a4, v7);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v9;
}

uint64_t cva::ImageDirectory::getCurrentFrame(cva::ImageDirectory *this)
{
  return *(_QWORD *)(*((_QWORD *)this + 12) + 32);
}

uint64_t cva::ImageDirectory::getCurrentPosition(cva::ImageDirectory *this)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t result;
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;

  v1 = (_QWORD *)*((_QWORD *)this + 9);
  v2 = (_QWORD *)*((_QWORD *)this + 12);
  if (v1 == v2)
    return 0;
  result = 0;
  do
  {
    v4 = (_QWORD *)v1[1];
    if (v4)
    {
      do
      {
        v5 = v4;
        v4 = (_QWORD *)*v4;
      }
      while (v4);
    }
    else
    {
      do
      {
        v5 = (_QWORD *)v1[2];
        v6 = *v5 == (_QWORD)v1;
        v1 = v5;
      }
      while (!v6);
    }
    ++result;
    v1 = v5;
  }
  while (v5 != v2);
  return result;
}

uint64_t cva::ImageDirectory::getNumberOfImages(cva::ImageDirectory *this)
{
  return *((_QWORD *)this + 11);
}

BOOL cva::ImageDirectory::forward(cva::ImageDirectory *this, uint64_t a2)
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  BOOL v6;
  _BOOL8 v7;

  if (!a2)
    return 1;
  v2 = (char *)this + 80;
  v3 = (char *)*((_QWORD *)this + 12);
  while (1)
  {
    v4 = (char *)*((_QWORD *)v3 + 1);
    v5 = v3;
    if (v4)
    {
      do
      {
        v3 = v4;
        v4 = *(char **)v4;
      }
      while (v4);
    }
    else
    {
      do
      {
        v3 = (char *)*((_QWORD *)v5 + 2);
        v6 = *(_QWORD *)v3 == (_QWORD)v5;
        v5 = v3;
      }
      while (!v6);
    }
    v7 = v3 != v2;
    if (v3 == v2)
      break;
    if (!--a2)
      goto LABEL_13;
  }
  v3 = (char *)this + 80;
LABEL_13:
  *((_QWORD *)this + 12) = v3;
  return v7;
}

BOOL cva::ImageDirectory::backward(cva::ImageDirectory *this, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _BOOL8 v4;
  _QWORD *v5;
  _QWORD *v6;
  BOOL v7;

  if (!a2)
    return 1;
  v2 = (_QWORD *)*((_QWORD *)this + 9);
  v3 = (_QWORD *)*((_QWORD *)this + 12);
  while (1)
  {
    v4 = v3 != v2;
    if (v3 == v2)
      break;
    v5 = (_QWORD *)*v3;
    if (*v3)
    {
      do
      {
        v6 = v5;
        v5 = (_QWORD *)v5[1];
      }
      while (v5);
    }
    else
    {
      do
      {
        v6 = (_QWORD *)v3[2];
        v7 = *v6 == (_QWORD)v3;
        v3 = v6;
      }
      while (v7);
    }
    *((_QWORD *)this + 12) = v6;
    v3 = v6;
    if (!--a2)
      return 1;
  }
  return v4;
}

BOOL cva::ImageDirectory::isAtEnd(cva::ImageDirectory *this)
{
  return *((_QWORD *)this + 12) == (_QWORD)this + 80;
}

uint64_t cva::ImageDirectory::seekToFrame(cva::ImageDirectory *this, unint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  unint64_t v4;
  BOOL v5;
  _QWORD *v6;

  v2 = (_QWORD *)*((_QWORD *)this + 10);
  if (!v2)
    return 0;
  v3 = (_QWORD *)((char *)this + 80);
  do
  {
    v4 = v2[4];
    v5 = v4 >= a2;
    if (v4 >= a2)
      v6 = v2;
    else
      v6 = v2 + 1;
    if (v5)
      v3 = v2;
    v2 = (_QWORD *)*v6;
  }
  while (*v6);
  if (v3 == (_QWORD *)((char *)this + 80) || v3[4] > a2)
    return 0;
  *((_QWORD *)this + 12) = v3;
  return 1;
}

BOOL cva::ImageDirectory::seekToPosition(cva::ImageDirectory *this, unint64_t a2)
{
  unint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;
  unint64_t v9;
  _QWORD *v11;

  v2 = *((_QWORD *)this + 11);
  if (v2 > a2)
  {
    v3 = (_QWORD *)*((_QWORD *)this + 9);
    *((_QWORD *)this + 12) = v3;
    if ((a2 & 0x8000000000000000) != 0)
    {
      v9 = a2;
      do
      {
        v11 = (_QWORD *)*v3;
        if (*v3)
        {
          do
          {
            v7 = v11;
            v11 = (_QWORD *)v11[1];
          }
          while (v11);
        }
        else
        {
          do
          {
            v7 = (_QWORD *)v3[2];
            v8 = *v7 == (_QWORD)v3;
            v3 = v7;
          }
          while (v8);
        }
        v3 = v7;
      }
      while (!__CFADD__(v9++, 1));
      goto LABEL_19;
    }
    if (a2)
    {
      v4 = a2;
      do
      {
        v6 = (_QWORD *)v3[1];
        if (v6)
        {
          do
          {
            v7 = v6;
            v6 = (_QWORD *)*v6;
          }
          while (v6);
        }
        else
        {
          do
          {
            v7 = (_QWORD *)v3[2];
            v8 = *v7 == (_QWORD)v3;
            v3 = v7;
          }
          while (!v8);
        }
        v3 = v7;
      }
      while (v4-- > 1);
LABEL_19:
      *((_QWORD *)this + 12) = v7;
    }
  }
  return v2 > a2;
}

BOOL cva::adp::io::detail::endsWith(uint64_t **a1, _QWORD *a2)
{
  size_t v2;
  size_t v3;
  size_t v4;
  int v5;
  size_t v6;
  size_t v7;
  size_t v10;
  BOOL v11;
  size_t v12;

  v2 = *((unsigned __int8 *)a1 + 23);
  v3 = (size_t)a1[1];
  if ((v2 & 0x80u) == 0)
    v4 = *((unsigned __int8 *)a1 + 23);
  else
    v4 = (size_t)a1[1];
  v5 = *((char *)a2 + 23);
  if (v5 >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = a2[1];
  v11 = v4 >= v6;
  v7 = v4 - v6;
  if (!v11)
    return 0;
  if ((v2 & 0x80) != 0)
  {
    v11 = v6 != -1 && v3 >= v7;
    if (v11)
    {
      v12 = v3 - v7;
      if (v12 >= v6)
        v10 = v6;
      else
        v10 = v12;
      a1 = (uint64_t **)*a1;
      goto LABEL_26;
    }
LABEL_34:
    abort();
  }
  if (v2 < v7 || v6 == -1)
    goto LABEL_34;
  if (v2 - v7 >= v6)
    v10 = v6;
  else
    v10 = v2 - v7;
LABEL_26:
  if (v5 < 0)
    a2 = (_QWORD *)*a2;
  return !memcmp((char *)a1 + v7, a2, v10) && v10 == v6;
}

uint64_t cva::adp::io::detail::hasDelimiter(char **a1, char *a2, uint64_t a3)
{
  int v4;
  int v5;
  char *v6;
  int64_t v7;
  char *v8;
  size_t v9;
  uint64_t result;
  size_t v11;
  size_t v12;
  __int128 *p_dst;
  char *v14;
  int v15;
  char *v16;
  void *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 __dst;
  unint64_t v23;

  v4 = *((char *)a1 + 23);
  v5 = a2[23];
  if (v5 >= 0)
    v6 = a2;
  else
    v6 = *(char **)a2;
  if (v5 >= 0)
    v7 = a2[23];
  else
    v7 = *((_QWORD *)a2 + 1);
  if (v4 >= 0)
    v8 = (char *)a1;
  else
    v8 = *a1;
  if (v4 >= 0)
    v9 = *((unsigned __int8 *)a1 + 23);
  else
    v9 = (size_t)a1[1];
  if (!v7)
  {
    v11 = 0;
LABEL_17:
    if (v9 >= v11)
      v12 = v11;
    else
      v12 = v9;
    if (v12 >= 0x7FFFFFFFFFFFFFF8)
      abort();
    if (v12 >= 0x17)
    {
      v20 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v12 | 7) != 0x17)
        v20 = v12 | 7;
      v21 = v20 + 1;
      p_dst = (__int128 *)operator new(v20 + 1);
      *((_QWORD *)&__dst + 1) = v12;
      v23 = v21 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
    }
    else
    {
      HIBYTE(v23) = v12;
      p_dst = &__dst;
      if (!v12)
        goto LABEL_34;
    }
    memmove(p_dst, v8, v12);
LABEL_34:
    *((_BYTE *)p_dst + v12) = 0;
    if (*(char *)(a3 + 23) < 0)
      operator delete(*(void **)a3);
    *(_OWORD *)a3 = __dst;
    *(_QWORD *)(a3 + 16) = v23;
    return 1;
  }
  if ((uint64_t)v9 >= v7)
  {
    v14 = &v8[v9];
    v15 = *v6;
    v16 = (char *)v9;
    v17 = v8;
    do
    {
      v18 = &v16[-v7];
      if (v18 == (char *)-1)
        break;
      result = (uint64_t)memchr(v17, v15, (size_t)(v18 + 1));
      if (!result)
        return result;
      v19 = result;
      result = memcmp((const void *)result, v6, v7);
      if (!(_DWORD)result)
      {
        if ((char *)v19 != v14)
        {
          v11 = v19 - (_QWORD)v8;
          if (v19 - (_QWORD)v8 != -1)
            goto LABEL_17;
        }
        return result;
      }
      v17 = (void *)(v19 + 1);
      v16 = &v14[-v19 - 1];
    }
    while ((uint64_t)v16 >= v7);
  }
  return 0;
}

uint64_t cva::adp::io::detail::hasSensor(_QWORD *a1, unsigned __int8 **a2, _QWORD *a3)
{
  _QWORD *v3;
  _QWORD *v4;
  char v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unsigned __int8 *v10;
  const void **v11;
  unsigned __int8 *v12;
  _QWORD *v13;
  _QWORD *v14;
  BOOL v15;

  v3 = a1 + 1;
  v4 = (_QWORD *)*a1;
  if ((_QWORD *)*a1 != a1 + 1)
  {
    v6 = *((_BYTE *)a2 + 23);
    if (v6 >= 0)
      v7 = (unsigned __int8 *)*((unsigned __int8 *)a2 + 23);
    else
      v7 = a2[1];
    if (v6 >= 0)
      v8 = (unsigned __int8 *)a2;
    else
      v8 = *a2;
    do
    {
      v9 = *((unsigned __int8 *)v4 + 63);
      if ((v9 & 0x80u) == 0)
        v10 = (unsigned __int8 *)*((unsigned __int8 *)v4 + 63);
      else
        v10 = (unsigned __int8 *)v4[6];
      if (v10 == v7)
      {
        v11 = (const void **)(v4 + 5);
        if ((v9 & 0x80) != 0)
        {
          if (!memcmp(*v11, v8, v4[6]))
          {
LABEL_26:
            *a3 = v4[4];
            return 1;
          }
        }
        else
        {
          if (!*((_BYTE *)v4 + 63))
            goto LABEL_26;
          v12 = v8;
          while (*(unsigned __int8 *)v11 == *v12)
          {
            v11 = (const void **)((char *)v11 + 1);
            ++v12;
            if (!--v9)
              goto LABEL_26;
          }
        }
      }
      v13 = (_QWORD *)v4[1];
      if (v13)
      {
        do
        {
          v14 = v13;
          v13 = (_QWORD *)*v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v14 = (_QWORD *)v4[2];
          v15 = *v14 == (_QWORD)v4;
          v4 = v14;
        }
        while (!v15);
      }
      v4 = v14;
    }
    while (v14 != v3);
  }
  return 0;
}

_QWORD *cva::adp::io::detail::reverseFind(uint64_t a1, _QWORD *a2, unsigned __int8 *a3)
{
  _QWORD *v3;
  _QWORD *v4;
  BOOL v5;

  if ((_QWORD *)(a1 + 8) != a2)
  {
    while (*((unsigned __int8 *)a2 + 26) != *a3)
    {
      v3 = (_QWORD *)a2[1];
      if (v3)
      {
        do
        {
          v4 = v3;
          v3 = (_QWORD *)*v3;
        }
        while (v3);
      }
      else
      {
        do
        {
          v4 = (_QWORD *)a2[2];
          v5 = *v4 == (_QWORD)a2;
          a2 = v4;
        }
        while (!v5);
      }
      a2 = v4;
      if (v4 == (_QWORD *)(a1 + 8))
        return (_QWORD *)(a1 + 8);
    }
  }
  return a2;
}

uint64_t cva::adp::io::detail::keysToNames(std::string::size_type *a1, const void **a2, const std::string **a3, uint64_t a4, uint64_t **a5)
{
  const std::string *v5;
  const std::string *v6;
  uint64_t **v7;
  const char *v8;
  std::string::size_type v9;
  std::string::size_type size;
  std::string::size_type v11;
  int v12;
  std::string::size_type v13;
  std::string::size_type v14;
  _BOOL4 v15;
  const char *v16;
  int v17;
  size_t v18;
  int v19;
  size_t v20;
  unint64_t v21;
  std::string *p_dst;
  BOOL v23;
  std::string::size_type v24;
  size_t v25;
  const std::string *v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  char *v30;
  const std::string *v31;
  std::string *v32;
  std::string::size_type v33;
  int v34;
  std::string *p_p;
  int v37;
  uint64_t *v39;
  unint64_t v40;
  uint64_t **v41;
  uint64_t *v42;
  unint64_t v43;
  BOOL v44;
  uint64_t **v45;
  uint64_t **v46;
  char *v47;
  unint64_t v48;
  char *v49;
  uint64_t *v50;
  uint64_t *v51;
  const std::string *v54;
  void *v57[2];
  char v58;
  std::string __dst;
  unint64_t v60;
  std::string __p;

  v5 = *a3;
  v6 = a3[1];
  if (*a3 == v6)
    return 1;
  v7 = a5 + 1;
  v8 = " ";
  v54 = a3[1];
  while (1)
  {
    std::operator+<char>();
    v9 = HIBYTE(v5->__r_.__value_.__r.__words[2]);
    size = v5->__r_.__value_.__l.__size_;
    if ((v9 & 0x80u) == 0)
      v11 = HIBYTE(v5->__r_.__value_.__r.__words[2]);
    else
      v11 = v5->__r_.__value_.__l.__size_;
    v12 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v13 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v13 = __p.__r_.__value_.__l.__size_;
    v23 = v11 >= v13;
    v14 = v11 - v13;
    if (!v23)
    {
      v15 = 0;
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_15;
LABEL_14:
      operator delete(__p.__r_.__value_.__l.__data_);
      goto LABEL_15;
    }
    if ((v9 & 0x80) != 0)
    {
      if (v13 == -1 || size < v14)
LABEL_102:
        abort();
      if (size - v14 >= v13)
        v25 = v13;
      else
        v25 = size - v14;
      v26 = (const std::string *)v5->__r_.__value_.__r.__words[0];
    }
    else
    {
      v23 = v13 != -1 && v9 >= v14;
      if (!v23)
        goto LABEL_102;
      v24 = v9 - v14;
      if (v24 >= v13)
        v25 = v13;
      else
        v25 = v24;
      v26 = v5;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    v37 = memcmp((char *)v26 + v14, p_p, v25);
    v15 = v25 == v13 && v37 == 0;
    if (v12 < 0)
      goto LABEL_14;
LABEL_15:
    if (!v15)
      goto LABEL_5;
    v16 = v8;
    v60 = 0;
    v17 = *((char *)a2 + 23);
    if (v17 >= 0)
      v18 = *((unsigned __int8 *)a2 + 23);
    else
      v18 = (size_t)a2[1];
    v19 = SHIBYTE(v5->__r_.__value_.__r.__words[2]);
    if (v19 >= 0)
      v20 = HIBYTE(v5->__r_.__value_.__r.__words[2]);
    else
      v20 = v5->__r_.__value_.__l.__size_;
    v21 = v20 + v18;
    if (v20 + v18 >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_102;
    if (v21 <= 0x16)
    {
      memset(&__dst, 0, sizeof(__dst));
      p_dst = &__dst;
      *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v20 + v18;
      if (!v18)
        goto LABEL_43;
LABEL_39:
      if (v17 >= 0)
        v29 = a2;
      else
        v29 = *a2;
      memmove(p_dst, v29, v18);
      goto LABEL_43;
    }
    v27 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v21 | 7) != 0x17)
      v27 = v21 | 7;
    v28 = v27 + 1;
    p_dst = (std::string *)operator new(v27 + 1);
    __dst.__r_.__value_.__l.__size_ = v20 + v18;
    __dst.__r_.__value_.__r.__words[2] = v28 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    if (v18)
      goto LABEL_39;
LABEL_43:
    v30 = (char *)p_dst + v18;
    if (v20)
    {
      if (v19 >= 0)
        v31 = v5;
      else
        v31 = (const std::string *)v5->__r_.__value_.__r.__words[0];
      memmove(v30, v31, v20);
    }
    v30[v20] = 0;
    v32 = std::string::append(&__dst, "/");
    v33 = v32->__r_.__value_.__r.__words[2];
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
    __p.__r_.__value_.__r.__words[2] = v33;
    v32->__r_.__value_.__l.__size_ = 0;
    v32->__r_.__value_.__r.__words[2] = 0;
    v32->__r_.__value_.__r.__words[0] = 0;
    v58 = 2;
    strcpy((char *)v57, "ID");
    v34 = cva::adp::io::PListSerializer::getItem<unsigned long long>(a1, &__p, (uint64_t)v57, &v60);
    v6 = v54;
    if (v58 < 0)
      operator delete(v57[0]);
    v8 = v16;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_52:
        if (!v34)
          return 0;
        goto LABEL_76;
      }
    }
    else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_52;
    }
    operator delete(__dst.__r_.__value_.__l.__data_);
    if (!v34)
      return 0;
LABEL_76:
    v39 = *v7;
    v40 = v60;
    if (*v7)
      break;
    v46 = v7;
    v47 = (char *)v7;
    if (v60 >= 0xFF)
      return 0;
LABEL_98:
    v49 = v47;
    v47 = (char *)operator new(0x40uLL);
    *((_QWORD *)v47 + 4) = v40;
    *((_QWORD *)v47 + 5) = 0;
    *((_QWORD *)v47 + 6) = 0;
    *((_QWORD *)v47 + 7) = 0;
    *(_QWORD *)v47 = 0;
    *((_QWORD *)v47 + 1) = 0;
    *((_QWORD *)v47 + 2) = v49;
    *v46 = (uint64_t *)v47;
    v50 = (uint64_t *)**a5;
    v51 = (uint64_t *)v47;
    if (v50)
    {
      *a5 = v50;
      v51 = *v46;
    }
    sub_20AB96C04(a5[1], v51);
    a5[2] = (uint64_t *)((char *)a5[2] + 1);
LABEL_4:
    std::string::operator=((std::string *)(v47 + 40), v5);
LABEL_5:
    if (++v5 == v6)
      return 1;
  }
  v41 = v7;
  v42 = *v7;
  do
  {
    v43 = v42[4];
    v44 = v43 >= v60;
    if (v43 >= v60)
      v45 = (uint64_t **)v42;
    else
      v45 = (uint64_t **)(v42 + 1);
    if (v44)
      v41 = (uint64_t **)v42;
    v42 = *v45;
  }
  while (*v45);
  if (v41 != v7)
  {
    if (v60 >= (unint64_t)v41[4] || v60 > 0xFE)
      return 0;
    while (1)
    {
LABEL_94:
      while (1)
      {
        v47 = (char *)v39;
        v48 = v39[4];
        if (v60 >= v48)
          break;
        v39 = *(uint64_t **)v47;
        v46 = (uint64_t **)v47;
        if (!*(_QWORD *)v47)
          goto LABEL_98;
      }
      if (v48 >= v60)
        goto LABEL_4;
      v39 = (uint64_t *)*((_QWORD *)v47 + 1);
      if (!v39)
      {
        v46 = (uint64_t **)(v47 + 8);
        goto LABEL_98;
      }
    }
  }
  if (v60 < 0xFF)
    goto LABEL_94;
  return 0;
}

uint64_t cva::adp::io::detail::createFromToTree(_QWORD *a1, uint64_t *a2, unsigned __int8 *a3, uint64_t **a4)
{
  _QWORD *v4;
  _QWORD *v5;
  unsigned __int8 **v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  size_t v13;
  char *v14;
  int v15;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  char *v24;
  int v25;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  int hasDelimiter;
  uint64_t v33;
  int v34;
  size_t v35;
  uint64_t v36;
  int v37;
  unsigned __int8 *v38;
  void **p_s1;
  unsigned int v40;
  unsigned __int8 *v41;
  uint64_t **v42;
  _QWORD *v43;
  unsigned int v44;
  _QWORD *v45;
  uint64_t *v46;
  uint64_t *v47;
  _QWORD *v48;
  void **v49;
  uint64_t v50;
  uint64_t v51;
  const void **v52;
  void **v53;
  _QWORD *v54;
  _QWORD *v55;
  unint64_t v56;
  unsigned int v57;
  unsigned __int8 *v58;
  unsigned __int8 **v59;
  unsigned __int8 **v60;
  char v61;
  _QWORD *v62;
  _QWORD *v63;
  unsigned int v64;
  _BYTE *v65;
  uint64_t *v66;
  unsigned __int8 *v67;
  unsigned int v68;
  void *__p[2];
  char v73;
  void *__s1;
  size_t __n;
  uint64_t v76;

  v4 = a1 + 1;
  v5 = (_QWORD *)*a1;
  if ((_QWORD *)*a1 == a1 + 1)
    return 1;
  v8 = (unsigned __int8 **)(a4 + 1);
  while (2)
  {
    v10 = *a2;
    v9 = a2[1];
    if (*a2 != v9)
    {
      v11 = *((char *)v5 + 63);
      if (v11 >= 0)
        v12 = *((unsigned __int8 *)v5 + 63);
      else
        v12 = v5[6];
      if (v12 == -1)
      {
        if (v11 < 0)
        {
          while ((*(char *)(v10 + 23) & 0x80000000) == 0 || *(_QWORD *)(v10 + 8) != -1)
          {
            v10 += 24;
            if (v10 == v9)
              goto LABEL_84;
          }
        }
        else
        {
          while ((*(char *)(v10 + 23) & 0x80000000) == 0 || *(_QWORD *)(v10 + 8) != -1)
          {
            v10 += 24;
            if (v10 == v9)
              goto LABEL_84;
          }
        }
LABEL_152:
        abort();
      }
      if (v11 < 0)
      {
        while (1)
        {
          v27 = *(unsigned __int8 *)(v10 + 23);
          v28 = *(_QWORD *)(v10 + 8);
          v29 = (v27 & 0x80u) == 0 ? *(unsigned __int8 *)(v10 + 23) : *(_QWORD *)(v10 + 8);
          v20 = v29 >= v12;
          v30 = v29 - v12;
          if (v20)
          {
            if ((v27 & 0x80) != 0)
            {
              if (v28 < v30)
                goto LABEL_152;
              v23 = v28 - v30 >= v12 ? v12 : v28 - v30;
              v24 = *(char **)v10;
            }
            else
            {
              v20 = v27 >= v30;
              v31 = v27 - v30;
              if (!v20)
                goto LABEL_152;
              v23 = v31 >= v12 ? v12 : v31;
              v24 = (char *)v10;
            }
            v25 = memcmp(&v24[v30], (const void *)v5[5], v23);
            if (v23 == v12 && v25 == 0)
              break;
          }
          v10 += 24;
          if (v10 == v9)
            goto LABEL_84;
        }
      }
      else
      {
        while (1)
        {
          v17 = *(unsigned __int8 *)(v10 + 23);
          v18 = *(_QWORD *)(v10 + 8);
          v19 = (v17 & 0x80u) == 0 ? *(unsigned __int8 *)(v10 + 23) : *(_QWORD *)(v10 + 8);
          v20 = v19 >= v12;
          v21 = v19 - v12;
          if (v20)
          {
            if ((v17 & 0x80) != 0)
            {
              if (v18 < v21)
                goto LABEL_152;
              v13 = v18 - v21 >= v12 ? v12 : v18 - v21;
              v14 = *(char **)v10;
            }
            else
            {
              v20 = v17 >= v21;
              v22 = v17 - v21;
              if (!v20)
                goto LABEL_152;
              v13 = v22 >= v12 ? v12 : v22;
              v14 = (char *)v10;
            }
            v15 = memcmp(&v14[v21], v5 + 5, v13);
            v16 = v13 == v12 && v15 == 0;
            if (v16)
              break;
          }
          v10 += 24;
          if (v10 == v9)
            goto LABEL_84;
        }
      }
    }
    if (v10 == v9)
    {
LABEL_84:
      v40 = *((unsigned __int8 *)v5 + 32);
      v41 = *v8;
      v42 = (uint64_t **)v8;
      v43 = v8;
      if (*v8)
      {
        while (1)
        {
          while (1)
          {
            v43 = v41;
            v44 = v41[25];
            if (v44 <= v40)
              break;
            v41 = (unsigned __int8 *)*v43;
            v42 = (uint64_t **)v43;
            if (!*v43)
              goto LABEL_91;
          }
          if (v44 >= v40)
            break;
          v41 = (unsigned __int8 *)v43[1];
          if (!v41)
          {
            v42 = (uint64_t **)(v43 + 1);
            goto LABEL_91;
          }
        }
      }
      else
      {
LABEL_91:
        v45 = v43;
        v43 = operator new(0x20uLL);
        *((_BYTE *)v43 + 25) = v40;
        *((_BYTE *)v43 + 26) = 0;
        *v43 = 0;
        v43[1] = 0;
        v43[2] = v45;
        *v42 = v43;
        v46 = (uint64_t *)**a4;
        v47 = v43;
        if (v46)
        {
          *a4 = v46;
          v47 = *v42;
        }
        sub_20AB96C04(a4[1], v47);
        a4[2] = (uint64_t *)((char *)a4[2] + 1);
      }
      *((_BYTE *)v43 + 26) = -1;
      goto LABEL_124;
    }
    __s1 = 0;
    __n = 0;
    v76 = 0;
    v73 = 4;
    strcpy((char *)__p, " To ");
    hasDelimiter = cva::adp::io::detail::hasDelimiter((char **)v10, (char *)__p, (uint64_t)&__s1);
    if (v73 < 0)
      operator delete(__p[0]);
    v33 = HIBYTE(v76);
    v34 = SHIBYTE(v76);
    if (!hasDelimiter)
      goto LABEL_121;
    if (v76 >= 0)
      v35 = HIBYTE(v76);
    else
      v35 = __n;
    v36 = a3[23];
    v37 = (char)v36;
    if ((v36 & 0x80u) != 0)
      v36 = *((_QWORD *)a3 + 1);
    if (v35 == v36)
    {
      if (v37 >= 0)
        v38 = a3;
      else
        v38 = *(unsigned __int8 **)a3;
      if (SHIBYTE(v76) < 0)
      {
        if (!memcmp(__s1, v38, __n))
        {
LABEL_137:
          LODWORD(v56) = *((unsigned __int8 *)v5 + 32);
          v67 = *v8;
          v59 = v8;
          v60 = v8;
          if (!*v8)
          {
LABEL_144:
            v65 = operator new(0x20uLL);
            v65[25] = v56;
            v65[26] = 0;
            *(_QWORD *)v65 = 0;
            *((_QWORD *)v65 + 1) = 0;
            *((_QWORD *)v65 + 2) = v60;
            *v59 = v65;
            v66 = (uint64_t *)**a4;
            LOBYTE(v56) = -1;
            v60 = (unsigned __int8 **)v65;
            if (!v66)
              goto LABEL_146;
            goto LABEL_145;
          }
          while (1)
          {
            while (1)
            {
              v60 = (unsigned __int8 **)v67;
              v68 = v67[25];
              if (v68 <= v56)
                break;
              v67 = *v60;
              v59 = v60;
              if (!*v60)
                goto LABEL_144;
            }
            if (v68 >= v56)
              break;
            v67 = v60[1];
            if (!v67)
            {
              v59 = v60 + 1;
              goto LABEL_144;
            }
          }
          LOBYTE(v56) = -1;
          goto LABEL_147;
        }
      }
      else
      {
        if (!HIBYTE(v76))
          goto LABEL_137;
        p_s1 = &__s1;
        while (*(unsigned __int8 *)p_s1 == *v38)
        {
          p_s1 = (void **)((char *)p_s1 + 1);
          ++v38;
          if (!--v33)
            goto LABEL_137;
        }
      }
    }
    v48 = (_QWORD *)*a1;
    if ((_QWORD *)*a1 == v4)
      goto LABEL_121;
    v49 = v34 >= 0 ? &__s1 : (void **)__s1;
    while (1)
    {
      v50 = *((unsigned __int8 *)v48 + 63);
      if ((v50 & 0x80u) == 0)
        v51 = *((unsigned __int8 *)v48 + 63);
      else
        v51 = v48[6];
      if (v51 != v35)
        goto LABEL_112;
      v52 = (const void **)(v48 + 5);
      if ((v50 & 0x80) != 0)
        break;
      if (!*((_BYTE *)v48 + 63))
        goto LABEL_118;
      v53 = v49;
      while (*(unsigned __int8 *)v52 == *(unsigned __int8 *)v53)
      {
        v52 = (const void **)((char *)v52 + 1);
        v53 = (void **)((char *)v53 + 1);
        if (!--v50)
          goto LABEL_118;
      }
LABEL_112:
      v54 = (_QWORD *)v48[1];
      if (v54)
      {
        do
        {
          v55 = v54;
          v54 = (_QWORD *)*v54;
        }
        while (v54);
      }
      else
      {
        do
        {
          v55 = (_QWORD *)v48[2];
          v16 = *v55 == (_QWORD)v48;
          v48 = v55;
        }
        while (!v16);
      }
      v48 = v55;
      if (v55 == v4)
        goto LABEL_121;
    }
    if (memcmp(*v52, v49, v48[6]))
      goto LABEL_112;
LABEL_118:
    v56 = v48[4];
    if (v56 > 0xFE)
    {
LABEL_121:
      v61 = 0;
      if ((v34 & 0x80) != 0)
        goto LABEL_122;
      goto LABEL_123;
    }
    v57 = *((unsigned __int8 *)v5 + 32);
    v58 = *v8;
    v59 = v8;
    v60 = v8;
    if (!*v8)
    {
LABEL_135:
      v65 = operator new(0x20uLL);
      v65[25] = v57;
      v65[26] = 0;
      *(_QWORD *)v65 = 0;
      *((_QWORD *)v65 + 1) = 0;
      *((_QWORD *)v65 + 2) = v60;
      *v59 = v65;
      v66 = (uint64_t *)**a4;
      v60 = (unsigned __int8 **)v65;
      if (!v66)
      {
LABEL_146:
        sub_20AB96C04(a4[1], (uint64_t *)v65);
        a4[2] = (uint64_t *)((char *)a4[2] + 1);
        LOBYTE(v34) = HIBYTE(v76);
        goto LABEL_147;
      }
LABEL_145:
      v60 = (unsigned __int8 **)v65;
      *a4 = v66;
      v65 = *v59;
      goto LABEL_146;
    }
    while (1)
    {
      while (1)
      {
        v60 = (unsigned __int8 **)v58;
        v64 = v58[25];
        if (v64 <= v57)
          break;
        v58 = *v60;
        v59 = v60;
        if (!*v60)
          goto LABEL_135;
      }
      if (v64 >= v57)
        break;
      v58 = v60[1];
      if (!v58)
      {
        v59 = v60 + 1;
        goto LABEL_135;
      }
    }
LABEL_147:
    *((_BYTE *)v60 + 26) = v56;
    v61 = 1;
    if ((v34 & 0x80) != 0)
LABEL_122:
      operator delete(__s1);
LABEL_123:
    if ((v61 & 1) == 0)
      return 0;
LABEL_124:
    v62 = (_QWORD *)v5[1];
    if (v62)
    {
      do
      {
        v63 = v62;
        v62 = (_QWORD *)*v62;
      }
      while (v62);
    }
    else
    {
      do
      {
        v63 = (_QWORD *)v5[2];
        v16 = *v63 == (_QWORD)v5;
        v5 = v63;
      }
      while (!v16);
    }
    v5 = v63;
    if (v63 != v4)
      continue;
    return 1;
  }
}

void cva::adp::io::detail::findChildNodes(_QWORD *a1, int a2, unint64_t *a3)
{
  _QWORD *v5;
  _QWORD *v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  size_t v13;
  void *v14;
  char *v15;
  uint64_t v16;
  _BYTE *v17;
  char *v18;
  char v19;
  _QWORD *v20;
  _QWORD *v21;
  BOOL v22;
  _QWORD *v23;
  _QWORD *v24;
  unint64_t v25;
  _OWORD *v26;
  __int128 *v27;
  unint64_t v28;
  __int128 v29;
  unint64_t v30;
  _BYTE *v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;

  v5 = a1 + 1;
  v6 = (_QWORD *)*a1;
  if (a1 + 1 != (_QWORD *)*a1)
  {
    while (*((unsigned __int8 *)v6 + 26) != a2)
    {
      v35 = (_QWORD *)v6[1];
      if (v35)
      {
        do
        {
          v36 = v35;
          v35 = (_QWORD *)*v35;
        }
        while (v35);
      }
      else
      {
        do
        {
          v36 = (_QWORD *)v6[2];
          v22 = *v36 == (_QWORD)v6;
          v6 = v36;
        }
        while (!v22);
      }
      v6 = v36;
      if (v36 == v5)
        return;
    }
  }
  if (v6 != v5)
  {
    v7 = (_BYTE *)a3[1];
    while (1)
    {
      v8 = a3[2];
      if ((unint64_t)v7 < v8)
      {
        *v7++ = *((_BYTE *)v6 + 25);
        goto LABEL_28;
      }
      v9 = *a3;
      v10 = (unint64_t)&v7[-*a3];
      v11 = v10 + 1;
      if ((uint64_t)(v10 + 1) < 0)
        abort();
      v12 = v8 - v9;
      if (2 * v12 > v11)
        v11 = 2 * v12;
      v13 = v12 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v11;
      v14 = v13 ? operator new(v13) : 0;
      v15 = (char *)v14 + v10;
      *((_BYTE *)v14 + v10) = *((_BYTE *)v6 + 25);
      v16 = (uint64_t)v14 + v10 + 1;
      if (v7 != (_BYTE *)v9)
        break;
LABEL_25:
      *a3 = (unint64_t)v15;
      a3[1] = v16;
      a3[2] = (unint64_t)v14 + v13;
      if (v7)
        operator delete(v7);
      v7 = (_BYTE *)v16;
LABEL_28:
      a3[1] = (unint64_t)v7;
      v20 = (_QWORD *)v6[1];
      if (v20)
      {
        do
        {
          v21 = v20;
          v20 = (_QWORD *)*v20;
        }
        while (v20);
      }
      else
      {
        do
        {
          v21 = (_QWORD *)v6[2];
          v22 = *v21 == (_QWORD)v6;
          v6 = v21;
        }
        while (!v22);
      }
      if (v5 != v21)
      {
        v6 = v21;
        while (*((unsigned __int8 *)v6 + 26) != a2)
        {
          v23 = (_QWORD *)v6[1];
          if (v23)
          {
            do
            {
              v24 = v23;
              v23 = (_QWORD *)*v23;
            }
            while (v23);
          }
          else
          {
            do
            {
              v24 = (_QWORD *)v6[2];
              v22 = *v24 == (_QWORD)v6;
              v6 = v24;
            }
            while (!v22);
          }
          v6 = v24;
          if (v24 == v5)
            return;
        }
        if (v6 != v5)
          continue;
      }
      return;
    }
    if (v10 < 8
      || (char *)v14 + v10 + v9 - (_QWORD)v7 > (char *)v14 + v10 - 1
      || v9 > (unint64_t)(v7 - 1)
      || v9 - (unint64_t)v14 < 0x20)
    {
      v17 = v7;
      goto LABEL_21;
    }
    if (v10 >= 0x20)
    {
      v25 = v10 & 0xFFFFFFFFFFFFFFE0;
      v26 = (char *)v14 + v10 - 16;
      v27 = (__int128 *)(v7 - 16);
      v28 = v10 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        v29 = *v27;
        *(v26 - 1) = *(v27 - 1);
        *v26 = v29;
        v26 -= 2;
        v27 -= 2;
        v28 -= 32;
      }
      while (v28);
      if (v10 == v25)
        goto LABEL_54;
      if ((v10 & 0x18) == 0)
      {
        v15 -= v25;
        v17 = &v7[-v25];
        goto LABEL_21;
      }
    }
    else
    {
      v25 = 0;
    }
    v17 = &v7[-(v10 & 0xFFFFFFFFFFFFFFF8)];
    v30 = v25 - (v10 & 0xFFFFFFFFFFFFFFF8);
    v31 = &v7[-v25];
    v32 = &v7[-v25 - v9 - 8 + (_QWORD)v14];
    v33 = (uint64_t *)(v31 - 8);
    do
    {
      v34 = *v33--;
      *v32-- = v34;
      v30 += 8;
    }
    while (v30);
    if (v10 == (v10 & 0xFFFFFFFFFFFFFFF8))
    {
LABEL_54:
      v7 = (_BYTE *)v9;
LABEL_24:
      v15 = (char *)v14;
      goto LABEL_25;
    }
    v15 -= v10 & 0xFFFFFFFFFFFFFFF8;
LABEL_21:
    v18 = v15 - 1;
    do
    {
      v19 = *--v17;
      *v18-- = v19;
    }
    while (v17 != (_BYTE *)v9);
    v7 = (_BYTE *)*a3;
    goto LABEL_24;
  }
}

uint64_t cva::RigidBodyKinematics::integrateAndJacobians(uint64_t a1, unsigned int *a2, double **a3, uint64_t a4, uint64_t a5, double *a6, double *a7, unint64_t a8, double a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double *v32;
  double v33;
  double v34;
  long double v35;
  double v36;
  double v37;
  double v38;
  float64x2_t v39;
  double v45;
  double v46;
  float64x2_t v47;
  __int128 v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v59;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  uint64_t v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  unint64_t v75;
  BOOL v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t i;
  unint64_t v82;
  BOOL v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t *v88;
  uint64_t j;
  uint64_t v90;
  unint64_t v91;
  BOOL v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  unint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  unint64_t v99;
  BOOL v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  BOOL v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  unint64_t v111;
  uint64_t *v112;
  uint64_t k;
  uint64_t v114;
  unint64_t v115;
  BOOL v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  BOOL v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  unint64_t v127;
  uint64_t *v128;
  uint64_t m;
  uint64_t v130;
  unint64_t v131;
  BOOL v132;
  unint64_t v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  unint64_t v140;
  BOOL v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  unint64_t v145;
  uint64_t n;
  unint64_t v147;
  BOOL v148;
  unint64_t v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  unint64_t v156;
  BOOL v157;
  uint64_t v158;
  uint64_t v159;
  unint64_t v160;
  unint64_t v161;
  uint64_t ii;
  unint64_t v163;
  BOOL v164;
  unint64_t v165;
  uint64_t v166;
  unint64_t v167;
  double v168;
  double v169;
  float64x2_t v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v179;
  double v180;
  double v181;
  float64x2_t v182;
  double v183;
  uint64_t *v185;
  double *v186;
  uint64_t **v187;
  __int128 *v188;
  _OWORD v189[4];
  uint64_t v190;
  uint64_t v191;
  __int128 v192;
  uint64_t v193;
  uint64_t v194;
  __int128 v195;
  uint64_t v196;
  uint64_t v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  _OWORD v207[4];
  uint64_t v208;
  _OWORD v209[4];
  uint64_t v210;
  _OWORD v211[4];
  uint64_t v212;
  uint64_t v213;
  __int128 v214;
  uint64_t v215;
  uint64_t v216;
  __int128 v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  __int128 v221;
  uint64_t v222;
  uint64_t v223;
  __int128 v224;
  uint64_t v225;
  uint64_t v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  double v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  unint64_t v236;
  _OWORD v237[4];
  uint64_t v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  float64x2_t v242;
  double v243;
  uint64_t v244;
  __int128 v245;
  uint64_t v246;
  uint64_t v247;
  __int128 v248;
  uint64_t v249;
  uint64_t v250;
  _OWORD v251[4];
  double v252;
  float64x2_t v253;
  float64x2_t v254;
  float64x2_t v255;
  float64x2_t v256;
  double v257;
  _BYTE v258[32];
  _BYTE v259[32];
  double v260;
  double v261;
  double v262;
  float64x2_t v263;
  double v264;
  double v265;
  double v266;
  double v267;
  double v268;
  _OWORD v269[2];
  __int128 v270;
  float64x2_t v271;
  double v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;

  if (a9 < 0.0)
    return 0;
  v273 = v26;
  v274 = v25;
  v275 = v24;
  v276 = v23;
  v277 = v22;
  v278 = v21;
  v279 = v20;
  v280 = v19;
  v281 = v17;
  v282 = v18;
  v257 = 0.0;
  v256 = 0u;
  v255 = 0u;
  v254 = 0u;
  v253 = 0u;
  *(_QWORD *)&v258[16] = 0;
  *(_QWORD *)&v258[8] = 0;
  v32 = *a3;
  *(double *)v258 = **a3 * a9;
  *(float64x2_t *)&v258[8] = vmulq_n_f64(*(float64x2_t *)(v32 + 1), a9);
  if ((v32 & 1) == 0
  {
    cva::Rotation3<double>::ExpAndJacobian(cva::MatrixRef<double const,3u,1u,false> const&,cva::Matrix<double,3u,3u,false> *)::kThreshold = 0x3E50000000000000;
  }
  v33 = sqrt(*(double *)v258 * *(double *)v258+ *(double *)&v258[8] * *(double *)&v258[8]+ *(double *)&v258[16] * *(double *)&v258[16]);
  v172 = cos(v33 * 0.5);
  v173 = *(double *)&v258[8];
  v174 = *(double *)&v258[16];
  v175 = *(double *)v258;
  if (v33 <= *(double *)&cva::Rotation3<double>::ExpAndJacobian(cva::MatrixRef<double const,3u,1u,false> const&,cva::Matrix<double,3u,3u,false> *)::kThreshold)
  {
    v171 = v33 * v33 / -48.0 + 0.5;
    v253.f64[1] = *(double *)&v258[16] * 0.5;
    v254.f64[0] = *(double *)&v258[8] * -0.5;
    v254.f64[1] = *(double *)&v258[16] * -0.5;
    v255.f64[1] = *(double *)v258 * 0.5;
    v256.f64[0] = *(double *)&v258[8] * 0.5;
    v256.f64[1] = *(double *)v258 * -0.5;
    v253.f64[0] = 1.0;
    v255.f64[0] = 1.0;
    v257 = 1.0;
    v36 = 1.0;
  }
  else
  {
    v34 = sin(v33 * 0.5);
    v261 = 0.0;
    v263.f64[1] = -(*(double *)&v258[16] / v33);
    v264 = 0.0;
    v267 = -(*(double *)v258 / v33);
    v262 = *(double *)&v258[16] / v33;
    v263.f64[0] = -(*(double *)&v258[8] / v33);
    v266 = *(double *)&v258[8] / v33;
    v265 = *(double *)v258 / v33;
    v268 = 0.0;
    v171 = v34 / v33;
    v35 = (v33 - sin(v33)) / v33;
    v254.f64[0] = -(*(double *)&v258[8] / v33 * v35);
    v254.f64[1] = -(*(double *)&v258[16] / v33 * v35);
    v256.f64[0] = v35 * (*(double *)&v258[8] / v33);
    v256.f64[1] = -(*(double *)v258 / v33 * v35);
    v253.f64[1] = v35 * (*(double *)&v258[16] / v33);
    v253.f64[0] = 2.0 / v33 * (v34 * v34) + v35 * 0.0;
    v255.f64[1] = v35 * (*(double *)v258 / v33);
    v255.f64[0] = v253.f64[0];
    v257 = v253.f64[0];
    *(_QWORD *)&v251[0] = &v253;
    *((_QWORD *)&v251[0] + 1) = &v261;
    memset(v269, 0, sizeof(v269));
    v270 = 0u;
    v271 = 0u;
    v272 = 0.0;
    sub_20AB92ED0((uint64_t)v269, (double **)v251);
    v253.f64[1] = *((float64_t *)v269 + 1);
    v254 = (float64x2_t)v269[1];
    v255.f64[1] = *((float64_t *)&v270 + 1);
    v256 = v271;
    v253.f64[0] = *(double *)v269 + 1.0;
    v255.f64[0] = *(double *)&v270 + 1.0;
    v36 = v272 + 1.0;
    v257 = v272 + 1.0;
  }
  v251[0] = vmulq_n_f64(v253, a9);
  v251[1] = vmulq_n_f64(v254, a9);
  v251[2] = vmulq_n_f64(v255, a9);
  v251[3] = vmulq_n_f64(v256, a9);
  v252 = v36 * a9;
  v243 = 0.0;
  v242 = 0u;
  v241 = 0u;
  v240 = 0u;
  v239 = 0u;
  v261 = 0.0;
  v264 = 0.0;
  v37 = *(double *)(a1 + 24);
  v38 = *(double *)(a1 + 32);
  v267 = -v38;
  v268 = 0.0;
  v39 = *(float64x2_t *)(a1 + 40);
  v265 = v38;
  v262 = v39.f64[1];
  v266 = v39.f64[0];
  v263 = vnegq_f64(v39);
  __asm { FMOV            V1.2D, #-2.0 }
  v182 = _Q1;
  v170 = v39;
  *(float64x2_t *)&v258[16] = vmulq_f64(v39, _Q1);
  *(float64x2_t *)&v259[8] = vaddq_f64(*(float64x2_t *)(a1 + 32), *(float64x2_t *)(a1 + 32));
  v169 = v37;
  *(double *)&v258[8] = v39.f64[1] + v39.f64[1];
  *(double *)v258 = v37 + v37 + 0.0;
  *(double *)&v259[24] = v38 * -2.0;
  *(double *)v259 = *(double *)v258;
  v260 = *(double *)v258;
  v244 = (uint64_t)v258;
  *(_QWORD *)&v245 = &v261;
  memset(v269, 0, sizeof(v269));
  v270 = 0u;
  v271 = 0u;
  v272 = 0.0;
  sub_20AB92ED0((uint64_t)v269, (double **)&v244);
  *(_QWORD *)&v258[8] = *((_QWORD *)&v269[0] + 1);
  *(_OWORD *)&v258[16] = v269[1];
  *(_QWORD *)&v259[8] = *((_QWORD *)&v270 + 1);
  *(float64x2_t *)&v259[16] = v271;
  *(double *)v258 = *(double *)v269 + 1.0;
  *(double *)v259 = *(double *)&v270 + 1.0;
  v260 = v272 + 1.0;
  v243 = v272 + 1.0;
  v242 = v271;
  v241 = *(_OWORD *)v259;
  v239 = *(_OWORD *)v258;
  v240 = v269[1];
  v248 = 0u;
  v246 = 0;
  v245 = 0u;
  v244 = 0x3FF0000000000000;
  v247 = 0x3FF0000000000000;
  v249 = 0;
  v250 = 0x3FF0000000000000;
  *(_QWORD *)&v269[0] = &v239;
  *((_QWORD *)&v269[0] + 1) = v251;
  memset(v237, 0, sizeof(v237));
  v238 = 0;
  sub_20AB92ED0((uint64_t)v237, (double **)v269);
  v236 = 0;
  v234 = 0u;
  v235 = 0u;
  v232 = 0u;
  v233 = 0u;
  v231 = 0.0;
  v229 = 0u;
  v230 = 0u;
  v227 = 0u;
  v228 = 0u;
  v261 = 0.0;
  v264 = 0.0;
  v46 = *(double *)(a1 + 24);
  v45 = *(double *)(a1 + 32);
  v267 = -v45;
  v268 = 0.0;
  v47 = *(float64x2_t *)(a1 + 40);
  v265 = v45;
  v266 = v47.f64[0];
  v263 = vnegq_f64(v47);
  v262 = v47.f64[1];
  *(float64x2_t *)&v258[16] = vmulq_f64(v47, v182);
  *(float64x2_t *)&v259[8] = vaddq_f64(*(float64x2_t *)(a1 + 32), *(float64x2_t *)(a1 + 32));
  *(double *)&v258[8] = v47.f64[1] + v47.f64[1];
  *(double *)v258 = v46 + v46 + 0.0;
  *(double *)&v259[24] = v45 * -2.0;
  *(double *)v259 = *(double *)v258;
  v260 = *(double *)v258;
  v220 = (uint64_t)v258;
  *(_QWORD *)&v221 = &v261;
  memset(v269, 0, sizeof(v269));
  v270 = 0u;
  v271 = 0u;
  v272 = 0.0;
  sub_20AB92ED0((uint64_t)v269, (double **)&v220);
  *(_QWORD *)&v258[8] = *((_QWORD *)&v269[0] + 1);
  *(_OWORD *)&v258[16] = v269[1];
  *(_QWORD *)&v259[8] = *((_QWORD *)&v270 + 1);
  *(float64x2_t *)&v259[16] = v271;
  *(double *)v258 = *(double *)v269 + 1.0;
  *(double *)v259 = *(double *)&v270 + 1.0;
  v260 = v272 + 1.0;
  v261 = COERCE_DOUBLE(v258);
  v262 = *(double *)&a4;
  memset(v269, 0, 24);
  sub_20ABA29D8((uint64_t)v269, (uint64_t)&v261);
  v48 = *(_OWORD *)((char *)v269 + 8);
  *(_QWORD *)&v232 = 0x8000000000000000;
  *((double *)&v232 + 1) = -*(double *)&v269[1];
  v233 = *(_OWORD *)((char *)v269 + 8);
  *(_QWORD *)&v234 = 0x8000000000000000;
  *((double *)&v234 + 1) = -*(double *)v269;
  *(double *)&v235 = -*((double *)v269 + 1);
  *((_QWORD *)&v235 + 1) = *(_QWORD *)&v269[0];
  v236 = 0x8000000000000000;
  v229 = *(_OWORD *)v259;
  v230 = *(_OWORD *)&v259[16];
  v231 = v260;
  v227 = *(_OWORD *)v258;
  v228 = *(_OWORD *)&v258[16];
  v49 = *(double *)v269 + **(double **)a5;
  v181 = *(double *)(*(_QWORD *)a5 + 16);
  v183 = *(double *)(*(_QWORD *)a5 + 8);
  v50 = *(double *)(*(_QWORD *)a2 + 8);
  v51 = **(double **)a2 * a9;
  v180 = *(double *)(*(_QWORD *)a2 + 16);
  *(double *)v269 = a9;
  *((double *)v269 + 1) = a9 * 0.0;
  *(double *)&v269[1] = a9 * 0.0;
  *((double *)&v269[1] + 1) = a9 * 0.0;
  *(double *)&v270 = a9;
  *((double *)&v270 + 1) = a9 * 0.0;
  v271.f64[0] = a9 * 0.0;
  v271.f64[1] = a9 * 0.0;
  v272 = a9;
  v52 = *(double *)&v270 * 0.5 * *(double *)&v270;
  v261 = v52;
  v262 = v52 * 0.0;
  v263.f64[0] = v52 * 0.0;
  v263.f64[1] = v52 * 0.0;
  v264 = v52;
  v265 = v52 * 0.0;
  v266 = v52 * 0.0;
  v267 = v52 * 0.0;
  v268 = v52;
  v53 = *(double *)(a1 + 8);
  v168 = v49;
  v54 = v52 * v49 + *(double *)a1 + v51;
  v179 = *(double *)(a1 + 16);
  memset(&v259[8], 0, 24);
  memset(&v258[8], 0, 24);
  *(_QWORD *)v258 = 0x3FF0000000000000;
  *(_QWORD *)v259 = 0x3FF0000000000000;
  v260 = 1.0;
  v222 = 0;
  v224 = 0u;
  v221 = 0u;
  v220 = 0x3FF0000000000000;
  v223 = 0x3FF0000000000000;
  v225 = 0;
  v226 = 0x3FF0000000000000;
  v215 = 0;
  v217 = 0u;
  v214 = 0u;
  v213 = 0x3FF0000000000000;
  v216 = 0x3FF0000000000000;
  v218 = 0;
  v219 = 0x3FF0000000000000;
  *(_QWORD *)&v209[0] = &v220;
  *((_QWORD *)&v209[0] + 1) = v269;
  memset(v211, 0, sizeof(v211));
  v212 = 0;
  sub_20AB92ED0((uint64_t)v211, (double **)v209);
  v198 = COERCE_DOUBLE(&v213);
  v199 = COERCE_DOUBLE(&v261);
  *(_QWORD *)&v207[0] = &v198;
  *((_QWORD *)&v207[0] + 1) = &v227;
  memset(v209, 0, sizeof(v209));
  v210 = 0;
  sub_20ABFDA24((uint64_t)v209, (uint64_t)v207);
  v191 = (uint64_t)&v213;
  *(_QWORD *)&v192 = &v261;
  v198 = COERCE_DOUBLE(&v191);
  v199 = COERCE_DOUBLE(&v232);
  memset(v207, 0, sizeof(v207));
  v208 = 0;
  sub_20ABFDA24((uint64_t)v207, (uint64_t)&v198);
  v198 = a9;
  v199 = a9 * 0.0;
  v200 = a9 * 0.0;
  v201 = a9 * 0.0;
  v202 = a9;
  v203 = a9 * 0.0;
  v204 = a9 * 0.0;
  v205 = a9 * 0.0;
  v206 = a9;
  v193 = 0;
  v195 = 0u;
  v192 = 0u;
  v191 = 0x3FF0000000000000;
  v196 = 0;
  v197 = 0x3FF0000000000000;
  v194 = 0x3FF0000000000000;
  v185 = &v191;
  v186 = &v198;
  v187 = &v185;
  v188 = &v232;
  memset(v189, 0, sizeof(v189));
  v190 = 0;
  sub_20ABFDA24((uint64_t)v189, (uint64_t)&v187);
  if ((*(_QWORD *)&v54 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
    return 0;
  v55 = v52 * (*(double *)&v48 + v183) + v53 + v50 * a9;
  if (COERCE__INT64(fabs(v55)) > 0x7FEFFFFFFFFFFFFFLL)
    return 0;
  v56 = v52 * (*((double *)&v48 + 1) + v181) + v179 + v180 * a9;
  if (COERCE__INT64(fabs(v56)) > 0x7FEFFFFFFFFFFFFFLL)
    return 0;
  _D5 = v171 * v173;
  _V24.D[1] = v170.f64[1];
  v59 = v172 * v169 - (v171 * v175 * v38 + v171 * v173 * v170.f64[0] + vmuld_lane_f64(v171 * v174, v170, 1));
  __asm { FMLA            D19, D5, V24.D[1] }
  v61 = v38 * v172 + v171 * v175 * v169 - _D19;
  v62 = v172 * v170.f64[0] + v171 * v173 * v169 - (vmuld_lane_f64(-(v171 * v175), v170, 1) + v171 * v174 * v38);
  v63 = vmuld_lane_f64(v172, v170, 1) + v171 * v174 * v169 - vmlad_n_f64(-(v171 * v173 * v38), v171 * v175, v170.f64[0]);
  v64 = (v59 * v59 + v63 * v63 + v61 * v61 + v62 * v62) * -0.5 + 1.5;
  v65 = v62 * v64;
  v66 = (*(double *)&v48 + v183) * a9;
  a6[4] = v61 * v64;
  a6[5] = v65;
  a6[6] = v63 * v64;
  *a6 = v54;
  a6[1] = v55;
  a6[2] = v56;
  a6[3] = v59 * v64;
  v67 = *(_QWORD *)a2;
  v68 = v168 * a9 + **(double **)a2;
  if ((double *)(*(_QWORD *)a2 - 8 * a2[3]) == &a7[-HIDWORD(a8)])
  {
    v69 = *(double *)(v67 + 16);
    v70 = v66 + *(double *)(v67 + 8);
    *a7 = v68;
    a7[1] = v70;
  }
  else
  {
    *a7 = v68;
    a7[1] = v66 + *(double *)(v67 + 8);
    v69 = *(double *)(v67 + 16);
  }
  a7[2] = (*((double *)&v48 + 1) + v181) * a9 + v69;
  if (a10)
  {
    v71 = 0;
    v72 = 0x300000000;
    v73 = &v244;
    do
    {
      v74 = *v73++;
      *(_QWORD *)(a10 + 8 * v71) = v74;
      v75 = HIDWORD(v72);
      v76 = (int)v72 < 2;
      if ((int)v72 < 2)
        v75 = 0;
      v77 = v71 + v75;
      v78 = (v72 + 1);
      v79 = v72 & 0xFFFFFFFF00000000;
      if (!v76)
        v78 = 0;
      v72 = v78 | v79;
      v71 = v77 + 1;
    }
    while (v71 != 18);
    v80 = 0x300000000;
    for (i = 18; i != 36; i = v84 + 1)
    {
      *(_QWORD *)(a10 + 8 * i) = 0;
      v82 = HIDWORD(v80);
      v83 = (int)v80 < 2;
      if ((int)v80 < 2)
        v82 = 0;
      v84 = i + v82;
      v85 = (v80 + 1);
      v86 = v80 & 0xFFFFFFFF00000000;
      if (!v83)
        v85 = 0;
      v80 = v85 | v86;
    }
    v87 = 0x300000000;
    v88 = (uint64_t *)v207;
    for (j = 3; j != 21; j = v93 + 1)
    {
      v90 = *v88++;
      *(_QWORD *)(a10 + 8 * j) = v90;
      v91 = HIDWORD(v87);
      v92 = (int)v87 < 2;
      if ((int)v87 < 2)
        v91 = 0;
      v93 = j + v91;
      v94 = (v87 + 1);
      v95 = v87 & 0xFFFFFFFF00000000;
      if (!v92)
        v94 = 0;
      v87 = v94 | v95;
    }
    v96 = 0x300000000;
    v97 = (uint64_t *)v258;
    do
    {
      v98 = *v97++;
      *(_QWORD *)(a10 + 8 * j) = v98;
      v99 = HIDWORD(v96);
      v100 = (int)v96 < 2;
      if ((int)v96 < 2)
        v99 = 0;
      v101 = j + v99;
      v102 = (v96 + 1);
      v103 = v96 & 0xFFFFFFFF00000000;
      if (!v100)
        v102 = 0;
      v96 = v102 | v103;
      j = v101 + 1;
    }
    while (j != 39);
  }
  if (a11)
  {
    v104 = 0;
    v105 = 0x300000000;
    do
    {
      *(_QWORD *)(a11 + 8 * v104) = 0;
      v106 = HIDWORD(v105);
      v107 = (int)v105 < 2;
      if ((int)v105 < 2)
        v106 = 0;
      v108 = v104 + v106;
      v109 = (v105 + 1);
      v110 = v105 & 0xFFFFFFFF00000000;
      if (!v107)
        v109 = 0;
      v105 = v109 | v110;
      v104 = v108 + 1;
    }
    while (v104 != 18);
    v111 = 0x300000000;
    v112 = (uint64_t *)v211;
    for (k = 3; k != 21; k = v117 + 1)
    {
      v114 = *v112++;
      *(_QWORD *)(a11 + 8 * k) = v114;
      v115 = HIDWORD(v111);
      v116 = (int)v111 < 2;
      if ((int)v111 < 2)
        v115 = 0;
      v117 = k + v115;
      v118 = (v111 + 1);
      v119 = v111 & 0xFFFFFFFF00000000;
      if (!v116)
        v118 = 0;
      v111 = v118 | v119;
    }
  }
  if (a13)
  {
    v120 = 0;
    v121 = 0x300000000;
    do
    {
      *(_QWORD *)(a13 + 8 * v120) = 0;
      v122 = HIDWORD(v121);
      v123 = (int)v121 < 2;
      if ((int)v121 < 2)
        v122 = 0;
      v124 = v120 + v122;
      v125 = (v121 + 1);
      v126 = v121 & 0xFFFFFFFF00000000;
      if (!v123)
        v125 = 0;
      v121 = v125 | v126;
      v120 = v124 + 1;
    }
    while (v120 != 18);
    v127 = 0x300000000;
    v128 = (uint64_t *)v209;
    for (m = 3; m != 21; m = v133 + 1)
    {
      v130 = *v128++;
      *(_QWORD *)(a13 + 8 * m) = v130;
      v131 = HIDWORD(v127);
      v132 = (int)v127 < 2;
      if ((int)v127 < 2)
        v131 = 0;
      v133 = m + v131;
      v134 = (v127 + 1);
      v135 = v127 & 0xFFFFFFFF00000000;
      if (!v132)
        v134 = 0;
      v127 = v134 | v135;
    }
  }
  if (a12)
  {
    v136 = 0;
    v137 = 0x300000000;
    v138 = (uint64_t *)v237;
    do
    {
      v139 = *v138++;
      *(_QWORD *)(a12 + 8 * v136) = v139;
      v140 = HIDWORD(v137);
      v141 = (int)v137 < 2;
      if ((int)v137 < 2)
        v140 = 0;
      v142 = v136 + v140;
      v143 = (v137 + 1);
      v144 = v137 & 0xFFFFFFFF00000000;
      if (!v141)
        v143 = 0;
      v137 = v143 | v144;
      v136 = v142 + 1;
    }
    while (v136 != 18);
    v145 = 0x300000000;
    for (n = 3; n != 21; n = v149 + 1)
    {
      *(_QWORD *)(a12 + 8 * n) = 0;
      v147 = HIDWORD(v145);
      v148 = (int)v145 < 2;
      if ((int)v145 < 2)
        v147 = 0;
      v149 = n + v147;
      v150 = (v145 + 1);
      v151 = v145 & 0xFFFFFFFF00000000;
      if (!v148)
        v150 = 0;
      v145 = v150 | v151;
    }
  }
  if (a14)
  {
    v152 = 0;
    v153 = 0;
    v154 = (uint64_t *)v189;
    do
    {
      v155 = *v154++;
      *(_QWORD *)(a14 + 8 * v152) = v155;
      v156 = HIDWORD(v153);
      v157 = (int)v153 < 2;
      if ((int)v153 < 2)
        v156 = 0;
      v158 = v152 + v156;
      v159 = (v153 + 1);
      v160 = v153 & 0xFFFFFFFF00000000;
      if (!v157)
        v159 = 0;
      v153 = v159 | v160;
      v152 = v158 + 1;
    }
    while (v152 != 9);
    v161 = 0;
    for (ii = 9; ii != 18; ii = v165 + 1)
    {
      *(_QWORD *)(a14 + 8 * ii) = 0;
      v163 = HIDWORD(v161);
      v164 = (int)v161 < 2;
      if ((int)v161 < 2)
        v163 = 0;
      v165 = ii + v163;
      v166 = (v161 + 1);
      v167 = v161 & 0xFFFFFFFF00000000;
      if (!v164)
        v166 = 0;
      v161 = v166 | v167;
    }
  }
  if (a15)
  {
    *(_OWORD *)(a15 + 24) = 0u;
    *(_OWORD *)(a15 + 40) = 0u;
    *(_OWORD *)(a15 + 8) = 0u;
    *(_QWORD *)a15 = 0x3FF0000000000000;
    *(_QWORD *)(a15 + 32) = 0x3FF0000000000000;
    *(_QWORD *)(a15 + 56) = 0;
    *(_QWORD *)(a15 + 64) = 0x3FF0000000000000;
  }
  if (a17)
  {
    v185 = &v191;
    v186 = &v198;
    v187 = &v185;
    v188 = &v227;
    sub_20ABFDA24(a17, (uint64_t)&v187);
  }
  if (a16)
  {
    *(_QWORD *)(a16 + 64) = 0;
    *(_OWORD *)(a16 + 32) = 0u;
    *(_OWORD *)(a16 + 48) = 0u;
    *(_OWORD *)a16 = 0u;
    *(_OWORD *)(a16 + 16) = 0u;
  }
  return 1;
}

__n128 sub_20ABFDA24(uint64_t a1, uint64_t a2)
{
  double *v3;
  double **v4;
  __int128 v5;
  __n128 v6;
  __int128 v7;
  __int128 v8;
  double v9;
  __n128 result;
  __int128 v11;
  __int128 v12;
  __n128 v13;
  __int128 v14;
  __int128 v15;
  double v16;

  v3 = *(double **)(a2 + 8);
  if (v3 == (double *)a1)
  {
    v16 = 0.0;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    sub_20ABFDA24(&v12);
    v11 = v15;
    *(_OWORD *)(a1 + 32) = v14;
    *(_OWORD *)(a1 + 48) = v11;
    *(double *)(a1 + 64) = v16;
    result = v13;
    *(_OWORD *)a1 = v12;
    *(__n128 *)(a1 + 16) = result;
  }
  else
  {
    v4 = *(double ***)a2;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0.0;
    sub_20AB92ED0((uint64_t)&v12, v4);
    v5 = v12;
    v6 = v13;
    v7 = v15;
    *(double *)a1 = *(double *)&v12 * *v3 + 0.0 + v13.n128_f64[1] * v3[1] + *(double *)&v15 * v3[2];
    v8 = v14;
    *(double *)(a1 + 8) = *((double *)&v5 + 1) * *v3 + 0.0 + *(double *)&v14 * v3[1] + *((double *)&v7 + 1) * v3[2];
    v9 = v16;
    *(double *)(a1 + 16) = v6.n128_f64[0] * *v3 + 0.0 + *((double *)&v8 + 1) * v3[1] + v16 * v3[2];
    *(double *)(a1 + 24) = *(double *)&v5 * v3[3] + 0.0 + v6.n128_f64[1] * v3[4] + *(double *)&v7 * v3[5];
    *(double *)(a1 + 32) = *((double *)&v5 + 1) * v3[3] + 0.0 + *(double *)&v8 * v3[4] + *((double *)&v7 + 1) * v3[5];
    *(double *)(a1 + 40) = v6.n128_f64[0] * v3[3] + 0.0 + *((double *)&v8 + 1) * v3[4] + v9 * v3[5];
    *(double *)(a1 + 48) = *(double *)&v5 * v3[6] + 0.0 + v6.n128_f64[1] * v3[7] + *(double *)&v7 * v3[8];
    *(double *)(a1 + 56) = *((double *)&v5 + 1) * v3[6] + 0.0 + *(double *)&v8 * v3[7] + *((double *)&v7 + 1) * v3[8];
    result.n128_f64[0] = v6.n128_f64[0] * v3[6] + 0.0 + *((double *)&v8 + 1) * v3[7] + v9 * v3[8];
    *(_QWORD *)(a1 + 64) = result.n128_u64[0];
  }
  return result;
}

uint64_t cva::RigidBodyKinematics::integrate(uint64_t a1, unsigned int *a2, double **a3, uint64_t a4, uint64_t a5, double *a6, double *a7, unint64_t a8, double a9)
{
  return cva::RigidBodyKinematics::integrateAndJacobians(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0, 0, 0, 0, 0, 0, 0, 0);
}

const char *cva::imfinfo(const char *this, char *a2, unsigned int *a3, unsigned int *a4, unsigned int *a5)
{
  const __CFAllocator *v8;
  const __CFString *v9;
  const __CFURL *v10;
  CGImageSource *v11;
  CGImage *ImageAtIndex;
  CGColorSpace *ColorSpace;
  int NumberOfComponents;
  int BitsPerComponent;
  CGBitmapInfo BitmapInfo;
  CGImageAlphaInfo AlphaInfo;
  int v19;
  const char *v20;

  if (this)
  {
    *(_DWORD *)a2 = 0;
    *a3 = 0;
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v9 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], this, 0x8000100u);
    v10 = CFURLCreateWithFileSystemPath(v8, v9, kCFURLPOSIXPathStyle, 0);
    CFRelease(v9);
    v11 = CGImageSourceCreateWithURL(v10, 0);
    CFRelease(v10);
    if (v11)
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v11, 0, 0);
      CFRelease(v11);
      if (ImageAtIndex)
      {
        *(_DWORD *)a2 = CGImageGetWidth(ImageAtIndex);
        *a3 = CGImageGetHeight(ImageAtIndex);
        ColorSpace = CGImageGetColorSpace(ImageAtIndex);
        NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
        BitsPerComponent = CGImageGetBitsPerComponent(ImageAtIndex);
        BitmapInfo = CGImageGetBitmapInfo(ImageAtIndex);
        AlphaInfo = CGImageGetAlphaInfo(ImageAtIndex);
        CGImageRelease(ImageAtIndex);
        if (AlphaInfo > kCGImageAlphaNoneSkipFirst || ((1 << AlphaInfo) & 0x61) == 0)
        {
          if (NumberOfComponents == 3 && AlphaInfo == kCGImageAlphaFirst)
          {
            if (BitsPerComponent == 16)
              v19 = 1647719521;
            else
              v19 = 0;
            if (BitsPerComponent == 8)
              v19 = 32;
            goto LABEL_37;
          }
        }
        else
        {
          if (NumberOfComponents == 3)
          {
            if (BitsPerComponent == 16)
              v19 = 1647589490;
            else
              v19 = 0;
            if (BitsPerComponent == 8)
              v19 = 24;
            goto LABEL_37;
          }
          if (NumberOfComponents == 1)
          {
            v19 = 1278226488;
            switch(BitsPerComponent)
            {
              case 8:
LABEL_37:
                *a4 = v19;
                return (const char *)(v19 != 0);
              case 32:
                v19 = ((int)(BitmapInfo << 23) >> 31) & 0x4C303066;
                goto LABEL_37;
              case 16:
                v19 = 1278226536;
                if ((BitmapInfo & 0x100) == 0)
                  v19 = 1647392359;
                goto LABEL_37;
            }
          }
        }
        v19 = 0;
        goto LABEL_37;
      }
      v20 = "CGImageSourceCreateImageAtIndex() failed!";
    }
    else
    {
      v20 = "CGImageSourceCreateWithURL() failed!";
    }
    puts(v20);
    return 0;
  }
  return this;
}

uint64_t cva::ppml008read@<X0>(cva *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  FILE *v5;
  BOOL v6;
  size_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  char *v11;
  void *v12;
  int v13;
  uint64_t v14;
  size_t size;

  result = (uint64_t)fopen((const char *)this, "rb");
  if (!result)
    goto LABEL_7;
  v5 = (FILE *)result;
  v14 = 0;
  v13 = 0;
  if (sub_20ABFDF38((FILE *)result, (_DWORD *)&v14 + 1, &v14, &v13))
    v6 = v13 == 1278226488;
  else
    v6 = 0;
  if (!v6)
  {
    result = fclose(v5);
LABEL_7:
    *a2 = 0;
    return result;
  }
  v8 = v14;
  v7 = HIDWORD(v14);
  v9 = (_QWORD *)operator new();
  v10 = v9;
  *v9 = 0;
  v9[1] = v7 | (v8 << 32);
  v9[2] = ((unint64_t)((((_DWORD)v7 + 15) & 0xFFFFFFF0) >> 4) << 36) | 1;
  size = v8 * (unint64_t)(((_DWORD)v7 + 15) & 0xFFFFFFF0);
  if (size)
  {
    v11 = (char *)malloc_type_malloc(size, 0xA153FF5uLL);
    v10[3] = v11;
    if ((_DWORD)v8)
      goto LABEL_10;
    goto LABEL_12;
  }
  v11 = 0;
  v9[3] = 0;
  if (!(_DWORD)v8)
  {
LABEL_12:
    result = fclose(v5);
    *a2 = v10;
    return result;
  }
LABEL_10:
  while ((_DWORD)v7 == fread(v11, 1uLL, v7, v5))
  {
    v11 += *((unsigned int *)v10 + 5);
    LODWORD(v8) = v8 - 1;
    if (!(_DWORD)v8)
      goto LABEL_12;
  }
  fclose(v5);
  *a2 = 0;
  v12 = (void *)v10[3];
  if (v12)
  {
    free(v12);
    v10[3] = 0;
  }
  return MEMORY[0x20BD2D02C](v10, 0x1010C40313BCFEBLL);
}

uint64_t sub_20ABFDF38(FILE *a1, _DWORD *a2, _DWORD *a3, int *a4)
{
  uint64_t result;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  char v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *a2 = 0;
  *a3 = 0;
  *a4 = 0;
  v15[0] = 35;
  while (!feof(a1) && v15[0] == 35)
  {
    result = (uint64_t)fgets(v15, 512, a1);
    if (!result)
      return result;
  }
  if (*(unsigned __int16 *)v15 == 13904)
  {
    v9 = 24;
  }
  else
  {
    result = 0;
    if (*(unsigned __int16 *)v15 != 13648)
      return result;
    v9 = 0;
  }
  *a4 = v9;
  v15[0] = 35;
  while (!feof(a1) && v15[0] == 35)
  {
    result = (uint64_t)fgets(v15, 512, a1);
    if (!result)
      return result;
  }
  v14 = 0;
  v10 = sscanf(v15, "%d %d", (char *)&v14 + 4, &v14);
  result = 0;
  if (v10 == 2)
  {
    v15[0] = 35;
    while (!feof(a1) && v15[0] == 35)
    {
      result = (uint64_t)fgets(v15, 512, a1);
      if (!result)
        return result;
    }
    v13 = 0;
    v11 = sscanf(v15, "%d", &v13);
    result = 0;
    if (v11 == 1)
    {
      if (!*a4)
      {
        if (v13 < 257)
        {
          v12 = 1278226488;
LABEL_27:
          *a4 = v12;
          goto LABEL_28;
        }
        if (v13 <= 0x10000)
        {
          v12 = 1647392359;
          goto LABEL_27;
        }
      }
LABEL_28:
      *a2 = HIDWORD(v14);
      *a3 = v14;
      return 1;
    }
  }
  return result;
}

uint64_t cva::ppmb16gread@<X0>(cva *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  FILE *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  size_t v11;
  char *v12;
  void *v13;
  int v14;
  uint64_t v15;
  size_t size;

  result = (uint64_t)fopen((const char *)this, "rb");
  if (!result)
    goto LABEL_7;
  v5 = (FILE *)result;
  v15 = 0;
  v14 = 0;
  if (sub_20ABFDF38((FILE *)result, (_DWORD *)&v15 + 1, &v15, &v14))
    v6 = v14 == 1647392359;
  else
    v6 = 0;
  if (!v6)
  {
    result = fclose(v5);
LABEL_7:
    *a2 = 0;
    return result;
  }
  v8 = v15;
  v7 = HIDWORD(v15);
  v9 = (_QWORD *)operator new();
  v10 = v9;
  v11 = (2 * v7);
  *v9 = 0;
  v9[1] = v7 | (v8 << 32);
  v9[2] = ((unint64_t)((((_DWORD)v11 + 15) & 0xFFFFFFF0) >> 4) << 36) | 2;
  size = v8 * (unint64_t)(((_DWORD)v11 + 15) & 0xFFFFFFF0);
  if (size)
  {
    v12 = (char *)malloc_type_malloc(size, 0xA153FF5uLL);
    v10[3] = v12;
    if ((_DWORD)v8)
      goto LABEL_10;
    goto LABEL_12;
  }
  v12 = 0;
  v9[3] = 0;
  if (!(_DWORD)v8)
  {
LABEL_12:
    result = fclose(v5);
    *a2 = v10;
    return result;
  }
LABEL_10:
  while ((_DWORD)v11 == fread(v12, 1uLL, v11, v5))
  {
    v12 += *((unsigned int *)v10 + 5);
    LODWORD(v8) = v8 - 1;
    if (!(_DWORD)v8)
      goto LABEL_12;
  }
  fclose(v5);
  *a2 = 0;
  v13 = (void *)v10[3];
  if (v13)
  {
    free(v13);
    v10[3] = 0;
  }
  return MEMORY[0x20BD2D02C](v10, 0x1010C40313BCFEBLL);
}

uint64_t cva::ppmrgb8read@<X0>(cva *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  FILE *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  size_t v11;
  char *v12;
  void *v13;
  int v14;
  uint64_t v15;
  size_t size;

  result = (uint64_t)fopen((const char *)this, "rb");
  if (!result)
    goto LABEL_7;
  v5 = (FILE *)result;
  v15 = 0;
  v14 = 0;
  if (sub_20ABFDF38((FILE *)result, (_DWORD *)&v15 + 1, &v15, &v14))
    v6 = v14 == 24;
  else
    v6 = 0;
  if (!v6)
  {
    result = fclose(v5);
LABEL_7:
    *a2 = 0;
    return result;
  }
  v8 = v15;
  v7 = HIDWORD(v15);
  v9 = (_QWORD *)operator new();
  v10 = v9;
  v11 = (3 * v7);
  *v9 = 0;
  v9[1] = v7 | (v8 << 32);
  v9[2] = ((unint64_t)((((_DWORD)v11 + 15) & 0xFFFFFFF0) >> 4) << 36) | 3;
  size = v8 * (unint64_t)(((_DWORD)v11 + 15) & 0xFFFFFFF0);
  if (size)
  {
    v12 = (char *)malloc_type_malloc(size, 0xA153FF5uLL);
    v10[3] = v12;
    if ((_DWORD)v8)
      goto LABEL_10;
    goto LABEL_12;
  }
  v12 = 0;
  v9[3] = 0;
  if (!(_DWORD)v8)
  {
LABEL_12:
    result = fclose(v5);
    *a2 = v10;
    return result;
  }
LABEL_10:
  while (fread(v12, 1uLL, v11, v5) == v11)
  {
    v12 += *((unsigned int *)v10 + 5);
    LODWORD(v8) = v8 - 1;
    if (!(_DWORD)v8)
      goto LABEL_12;
  }
  fclose(v5);
  *a2 = 0;
  v13 = (void *)v10[3];
  if (v13)
  {
    free(v13);
    v10[3] = 0;
  }
  return MEMORY[0x20BD2D02C](v10, 0x1020C40A5B76CDFLL);
}

uint64_t cva::imread<unsigned char>@<X0>(cva *a1@<X0>, size_t *a2@<X8>)
{
  uint64_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  char *v9;
  void *v10;
  int v11;
  CGBitmapInfo v12;
  int v13;
  int v14;
  unsigned int v15;
  _DWORD v16[2];
  size_t size;

  strcpy((char *)&size, ".ppm");
  strcpy((char *)v16, ".pgm");
  if (sub_20ABFE598((char *)a1, (char *)&size) || sub_20ABFE598((char *)a1, (char *)v16))
  {
    result = cva::ppml008read(a1, &size);
    v5 = size;
  }
  else
  {
    v15 = 0;
    v16[0] = 0;
    result = sub_20ABFE674((char *)a1, v16, &v15, &v14, &v13, &v12, (CGImageAlphaInfo *)&v11);
    if (!(_DWORD)result)
    {
      *a2 = 0;
      return result;
    }
    v7 = v15;
    v6 = v16[0];
    v5 = operator new();
    v8 = (v6 + 15) & 0xFFFFFFF0;
    *(_QWORD *)v5 = 0;
    *(_QWORD *)(v5 + 8) = v6 | (v7 << 32);
    *(_QWORD *)(v5 + 16) = ((unint64_t)(v8 >> 4) << 36) | 1;
    size = v7 * (unint64_t)v8;
    if (size)
    {
      v9 = (char *)malloc_type_malloc(size, 0xA153FF5uLL);
      LODWORD(v6) = *(_DWORD *)(v5 + 8);
      LODWORD(v7) = *(_DWORD *)(v5 + 12);
      v8 = *(_DWORD *)(v5 + 20);
    }
    else
    {
      v9 = 0;
    }
    *(_QWORD *)(v5 + 24) = v9;
    result = sub_20ABFE7A4((char *)a1, v9, v6, v7, v8);
    if ((result & 1) == 0)
    {
      v10 = *(void **)(v5 + 24);
      if (v10)
      {
        free(v10);
        *(_QWORD *)(v5 + 24) = 0;
      }
      result = MEMORY[0x20BD2D02C](v5, 0x1010C40313BCFEBLL);
      v5 = 0;
    }
  }
  *a2 = v5;
  return result;
}

uint64_t sub_20ABFE598(char *__s, char *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  __darwin_ct_rune_t v8;
  size_t v9;
  size_t v10;

  result = 0;
  if (__s && a2)
  {
    if (!*__s || !*a2)
      return 0;
    result = (uint64_t)strchr(__s, 46);
    if (result)
    {
      result = (uint64_t)strchr(a2, 46);
      if (result)
      {
        v5 = -1;
        v6 = -1;
        while (1)
        {
          v7 = strlen(__s);
          if (v5 + 1 >= v7)
            break;
          v8 = __tolower(__s[v7 + v6]);
          v9 = strlen(a2);
          if (v8 != __tolower(a2[v9 + v6]))
            break;
          v10 = strlen(a2) - 1;
          --v6;
          ++v5;
          result = 1;
          if (v5 == v10)
            return result;
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_20ABFE674(char *cStr, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, CGBitmapInfo *a6, CGImageAlphaInfo *a7)
{
  const __CFAllocator *v13;
  const __CFString *v14;
  const __CFURL *v15;
  CGImageSource *v16;
  CGImage *ImageAtIndex;
  CGColorSpace *ColorSpace;

  *a2 = 0;
  *a3 = 0;
  v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v14 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
  v15 = CFURLCreateWithFileSystemPath(v13, v14, kCFURLPOSIXPathStyle, 0);
  CFRelease(v14);
  v16 = CGImageSourceCreateWithURL(v15, 0);
  CFRelease(v15);
  if (!v16)
    return 0;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v16, 0, 0);
  CFRelease(v16);
  if (!ImageAtIndex)
    return 0;
  *a2 = CGImageGetWidth(ImageAtIndex);
  *a3 = CGImageGetHeight(ImageAtIndex);
  ColorSpace = CGImageGetColorSpace(ImageAtIndex);
  *a4 = CGColorSpaceGetNumberOfComponents(ColorSpace);
  *a5 = CGImageGetBitsPerComponent(ImageAtIndex);
  *a6 = CGImageGetBitmapInfo(ImageAtIndex);
  *a7 = CGImageGetAlphaInfo(ImageAtIndex);
  CGImageRelease(ImageAtIndex);
  return 1;
}

BOOL sub_20ABFE7A4(char *cStr, char *a2, unsigned int a3, int a4, unsigned int a5)
{
  uint64_t v6;
  const __CFAllocator *v9;
  const __CFString *v10;
  const __CFURL *v11;
  CGImageSource *v12;
  CGImage *ImageAtIndex;
  CGDataProvider *DataProvider;
  const __CFData *v15;
  const __CFData *v16;
  UInt8 *BytePtr;
  vImagePixelCount v18;
  CGColorSpace *ColorSpace;
  size_t NumberOfComponents;
  int BitsPerPixel;
  unsigned int BytesPerRow;
  CGImageAlphaInfo AlphaInfo;
  int v26;
  int v27;
  size_t v28;
  vImage_Error v29;
  vImage_Error v30;
  vImage_Buffer v31;
  vImage_Buffer v32;

  LODWORD(v6) = a4;
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
  v11 = CFURLCreateWithFileSystemPath(v9, v10, kCFURLPOSIXPathStyle, 0);
  CFRelease(v10);
  v12 = CGImageSourceCreateWithURL(v11, 0);
  CFRelease(v11);
  if (!v12)
    return 0;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v12, 0, 0);
  CFRelease(v12);
  if (!ImageAtIndex)
    return 0;
  DataProvider = CGImageGetDataProvider(ImageAtIndex);
  v15 = CGDataProviderCopyData(DataProvider);
  if (!v15)
  {
LABEL_6:
    CGImageRelease(ImageAtIndex);
    return 0;
  }
  v16 = v15;
  BytePtr = (UInt8 *)CFDataGetBytePtr(v15);
  v18 = a3;
  ColorSpace = CGImageGetColorSpace(ImageAtIndex);
  NumberOfComponents = CGColorSpaceGetNumberOfComponents(ColorSpace);
  if (((CGImageGetBitsPerComponent(ImageAtIndex) * NumberOfComponents) >> 3) * v18 > a5)
  {
    CFRelease(v16);
    goto LABEL_6;
  }
  BitsPerPixel = CGImageGetBitsPerPixel(ImageAtIndex);
  BytesPerRow = CGImageGetBytesPerRow(ImageAtIndex);
  AlphaInfo = CGImageGetAlphaInfo(ImageAtIndex);
  if (BitsPerPixel != 32 || AlphaInfo - 5 >= 2)
  {
    if ((_DWORD)v6)
    {
      v26 = 0;
      v27 = 0;
      if (BytesPerRow >= a5)
        v28 = a5;
      else
        v28 = BytesPerRow;
      v6 = v6;
      do
      {
        memcpy(&a2[v26], &BytePtr[v27], v28);
        v27 += BytesPerRow;
        v26 += a5;
        --v6;
      }
      while (v6);
    }
    CFRelease(v16);
    CGImageRelease(ImageAtIndex);
    return 1;
  }
  else
  {
    v32.data = BytePtr;
    v32.height = v6;
    v32.width = v18;
    v32.rowBytes = BytesPerRow;
    v31.data = a2;
    v31.height = v6;
    v31.width = v18;
    v31.rowBytes = a5;
    if (AlphaInfo == kCGImageAlphaNoneSkipLast)
      v29 = vImageConvert_RGBA8888toRGB888(&v32, &v31, 0);
    else
      v29 = vImageConvert_ARGB8888toRGB888(&v32, &v31, 0);
    v30 = v29;
    CFRelease(v16);
    CGImageRelease(ImageAtIndex);
    return v30 == 0;
  }
}

uint64_t cva::imread<unsigned short>@<X0>(cva *a1@<X0>, size_t *a2@<X8>)
{
  uint64_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  char *v9;
  void *v10;
  int v11;
  CGBitmapInfo v12;
  int v13;
  int v14;
  unsigned int v15;
  _DWORD v16[2];
  size_t size;

  strcpy((char *)&size, ".ppm");
  strcpy((char *)v16, ".pgm");
  if (sub_20ABFE598((char *)a1, (char *)&size) || sub_20ABFE598((char *)a1, (char *)v16))
  {
    result = cva::ppmb16gread(a1, &size);
    v5 = size;
  }
  else
  {
    v15 = 0;
    v16[0] = 0;
    result = sub_20ABFE674((char *)a1, v16, &v15, &v14, &v13, &v12, (CGImageAlphaInfo *)&v11);
    if (!(_DWORD)result)
    {
      *a2 = 0;
      return result;
    }
    v7 = v15;
    v6 = v16[0];
    v5 = operator new();
    v8 = (2 * v6 + 15) & 0xFFFFFFF0;
    *(_QWORD *)v5 = 0;
    *(_QWORD *)(v5 + 8) = v6 | (v7 << 32);
    *(_QWORD *)(v5 + 16) = ((unint64_t)(v8 >> 4) << 36) | 2;
    size = v7 * (unint64_t)v8;
    if (size)
    {
      v9 = (char *)malloc_type_malloc(size, 0xA153FF5uLL);
      LODWORD(v6) = *(_DWORD *)(v5 + 8);
      LODWORD(v7) = *(_DWORD *)(v5 + 12);
      v8 = *(_DWORD *)(v5 + 20);
    }
    else
    {
      v9 = 0;
    }
    *(_QWORD *)(v5 + 24) = v9;
    result = sub_20ABFE7A4((char *)a1, v9, v6, v7, v8);
    if ((result & 1) == 0)
    {
      v10 = *(void **)(v5 + 24);
      if (v10)
      {
        free(v10);
        *(_QWORD *)(v5 + 24) = 0;
      }
      result = MEMORY[0x20BD2D02C](v5, 0x1010C40313BCFEBLL);
      v5 = 0;
    }
  }
  *a2 = v5;
  return result;
}

uint64_t cva::imread<float>@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  char *v9;
  void *v10;
  int v11;
  CGBitmapInfo v12;
  int v13;
  int v14;
  uint64_t v15;
  size_t size;

  strcpy((char *)&size, ".tiff");
  result = sub_20ABFE598(a1, (char *)&size);
  if (!(_DWORD)result)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v15 = 0;
  result = sub_20ABFE674(a1, (_DWORD *)&v15 + 1, &v15, &v14, &v13, &v12, (CGImageAlphaInfo *)&v11);
  if (!(_DWORD)result)
  {
    *a2 = 0;
    return result;
  }
  v6 = v15;
  v5 = HIDWORD(v15);
  v7 = operator new();
  v8 = (4 * v5 + 15) & 0xFFFFFFF0;
  *(_QWORD *)v7 = 0;
  *(_QWORD *)(v7 + 8) = v5 | (v6 << 32);
  *(_QWORD *)(v7 + 16) = ((unint64_t)(v8 >> 4) << 36) | 4;
  size = v6 * (unint64_t)v8;
  if (size)
  {
    v9 = (char *)malloc_type_malloc(size, 0xA153FF5uLL);
    LODWORD(v5) = *(_DWORD *)(v7 + 8);
    LODWORD(v6) = *(_DWORD *)(v7 + 12);
    v8 = *(_DWORD *)(v7 + 20);
  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)(v7 + 24) = v9;
  result = sub_20ABFE7A4(a1, v9, v5, v6, v8);
  if ((result & 1) == 0)
  {
    v10 = *(void **)(v7 + 24);
    if (v10)
    {
      free(v10);
      *(_QWORD *)(v7 + 24) = 0;
    }
    result = MEMORY[0x20BD2D02C](v7, 0x1080C4019856BD9);
    goto LABEL_11;
  }
LABEL_12:
  *a2 = v7;
  return result;
}

uint64_t cva::imread<cva::Matrix<unsigned char,3u,1u,false>>@<X0>(cva *a1@<X0>, size_t *a2@<X8>)
{
  uint64_t result;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  char *v9;
  void *v10;
  int v11;
  CGBitmapInfo v12;
  int v13;
  int v14;
  unsigned int v15;
  _DWORD v16[2];
  size_t size;

  strcpy((char *)&size, ".ppm");
  strcpy((char *)v16, ".pgm");
  if (sub_20ABFE598((char *)a1, (char *)&size) || sub_20ABFE598((char *)a1, (char *)v16))
  {
    result = cva::ppmrgb8read(a1, &size);
    v5 = size;
  }
  else
  {
    v15 = 0;
    v16[0] = 0;
    result = sub_20ABFE674((char *)a1, v16, &v15, &v14, &v13, &v12, (CGImageAlphaInfo *)&v11);
    if (!(_DWORD)result)
    {
      *a2 = 0;
      return result;
    }
    v7 = v15;
    v6 = v16[0];
    v5 = operator new();
    v8 = (3 * v6 + 15) & 0xFFFFFFF0;
    *(_QWORD *)v5 = 0;
    *(_QWORD *)(v5 + 8) = v6 | (v7 << 32);
    *(_QWORD *)(v5 + 16) = ((unint64_t)(v8 >> 4) << 36) | 3;
    size = v7 * (unint64_t)v8;
    if (size)
    {
      v9 = (char *)malloc_type_malloc(size, 0xA153FF5uLL);
      LODWORD(v6) = *(_DWORD *)(v5 + 8);
      LODWORD(v7) = *(_DWORD *)(v5 + 12);
      v8 = *(_DWORD *)(v5 + 20);
    }
    else
    {
      v9 = 0;
    }
    *(_QWORD *)(v5 + 24) = v9;
    result = sub_20ABFE7A4((char *)a1, v9, v6, v7, v8);
    if ((result & 1) == 0)
    {
      v10 = *(void **)(v5 + 24);
      if (v10)
      {
        free(v10);
        *(_QWORD *)(v5 + 24) = 0;
      }
      result = MEMORY[0x20BD2D02C](v5, 0x1020C40A5B76CDFLL);
      v5 = 0;
    }
  }
  *a2 = v5;
  return result;
}

uint64_t cva::imread<cva::Matrix<unsigned char,4u,1u,false>>@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  char *v9;
  void *v10;
  int v11;
  CGBitmapInfo v12;
  int v13;
  int v14;
  unsigned int v15;
  _DWORD v16[2];
  size_t size;

  strcpy((char *)&size, ".ppm");
  strcpy((char *)v16, ".pgm");
  result = sub_20ABFE598(a1, (char *)&size);
  if ((_DWORD)result
    || (result = sub_20ABFE598(a1, (char *)v16), (result & 1) != 0)
    || (strcpy((char *)&size, ".tiff"), result = sub_20ABFE598(a1, (char *)&size), (result & 1) != 0))
  {
LABEL_4:
    v5 = 0;
    goto LABEL_5;
  }
  v15 = 0;
  v16[0] = 0;
  result = sub_20ABFE674(a1, v16, &v15, &v14, &v13, &v12, (CGImageAlphaInfo *)&v11);
  if (!(_DWORD)result)
  {
    *a2 = 0;
    return result;
  }
  v7 = v15;
  v6 = v16[0];
  v5 = operator new();
  v8 = (4 * v6 + 15) & 0xFFFFFFF0;
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = v6 | (v7 << 32);
  *(_QWORD *)(v5 + 16) = ((unint64_t)(v8 >> 4) << 36) | 4;
  size = v7 * (unint64_t)v8;
  if (size)
  {
    v9 = (char *)malloc_type_malloc(size, 0xA153FF5uLL);
    LODWORD(v6) = *(_DWORD *)(v5 + 8);
    LODWORD(v7) = *(_DWORD *)(v5 + 12);
    v8 = *(_DWORD *)(v5 + 20);
  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)(v5 + 24) = v9;
  result = sub_20ABFE7A4(a1, v9, v6, v7, v8);
  if ((result & 1) == 0)
  {
    v10 = *(void **)(v5 + 24);
    if (v10)
    {
      free(v10);
      *(_QWORD *)(v5 + 24) = 0;
    }
    result = MEMORY[0x20BD2D02C](v5, 0x1020C40A5B76CDFLL);
    goto LABEL_4;
  }
LABEL_5:
  *a2 = v5;
  return result;
}

uint64_t cva::imread<cva::Matrix<unsigned short,4u,1u,false>>@<X0>(char *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  char *v9;
  void *v10;
  int v11;
  CGBitmapInfo v12;
  int v13;
  int v14;
  unsigned int v15;
  _DWORD v16[2];
  size_t size;

  strcpy((char *)&size, ".ppm");
  strcpy((char *)v16, ".pgm");
  result = sub_20ABFE598(a1, (char *)&size);
  if ((_DWORD)result
    || (result = sub_20ABFE598(a1, (char *)v16), (result & 1) != 0)
    || (strcpy((char *)&size, ".tiff"), result = sub_20ABFE598(a1, (char *)&size), (result & 1) != 0))
  {
LABEL_4:
    v5 = 0;
    goto LABEL_5;
  }
  v15 = 0;
  v16[0] = 0;
  result = sub_20ABFE674(a1, v16, &v15, &v14, &v13, &v12, (CGImageAlphaInfo *)&v11);
  if (!(_DWORD)result)
  {
    *a2 = 0;
    return result;
  }
  v7 = v15;
  v6 = v16[0];
  v5 = operator new();
  v8 = (8 * v6 + 15) & 0xFFFFFFF0;
  *(_QWORD *)v5 = 0;
  *(_QWORD *)(v5 + 8) = v6 | (v7 << 32);
  *(_QWORD *)(v5 + 16) = ((unint64_t)(v8 >> 4) << 36) | 8;
  size = v7 * (unint64_t)v8;
  if (size)
  {
    v9 = (char *)malloc_type_malloc(size, 0xA153FF5uLL);
    LODWORD(v6) = *(_DWORD *)(v5 + 8);
    LODWORD(v7) = *(_DWORD *)(v5 + 12);
    v8 = *(_DWORD *)(v5 + 20);
  }
  else
  {
    v9 = 0;
  }
  *(_QWORD *)(v5 + 24) = v9;
  result = sub_20ABFE7A4(a1, v9, v6, v7, v8);
  if ((result & 1) == 0)
  {
    v10 = *(void **)(v5 + 24);
    if (v10)
    {
      free(v10);
      *(_QWORD *)(v5 + 24) = 0;
    }
    result = MEMORY[0x20BD2D02C](v5, 0x1020C40A5B76CDFLL);
    goto LABEL_4;
  }
LABEL_5:
  *a2 = v5;
  return result;
}

FILE *cva::imread(cva *this, const char *a2)
{
  FILE *result;
  FILE *v4;
  OSType v5;
  size_t v6;
  size_t v7;
  __CFDictionary *AttributeDictionary;
  __CFDictionary *v9;
  CVReturn v10;
  int v11;
  int v12;
  char *v13;
  unint64_t v14;
  size_t v15;
  int v16;
  int v17;
  int v18;
  size_t v19;
  size_t v20;
  FILE *v21;
  CVReturn v22;
  BOOL v23;
  BOOL v24;
  CVPixelBufferRef pixelBuffer;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  int v31;
  unint64_t v32;
  char *v33;
  CVPixelBufferRef pixelBufferOut;
  OSType v35;
  uint64_t v36;

  v27 = 0;
  v28 = 0;
  pixelBuffer = 0;
  v26 = 0;
  strcpy((char *)&v29, ".ppm");
  strcpy((char *)&pixelBufferOut, ".pgm");
  if (sub_20ABFE598((char *)this, (char *)&v29)
    || sub_20ABFE598((char *)this, (char *)&pixelBufferOut))
  {
    result = fopen((const char *)this, "rb");
    if (!result)
      return result;
    v4 = result;
    v36 = 0;
    v35 = 0;
    pixelBufferOut = 0;
    if (sub_20ABFDF38(result, (_DWORD *)&v36 + 1, &v36, (int *)&v35))
    {
      v5 = v35;
      if (v35 == 24 || v35 == 1647392359 || v35 == 1278226488)
      {
        v6 = v36;
        v7 = HIDWORD(v36);
        AttributeDictionary = cva::createAttributeDictionary((cva *)HIDWORD(v36), v36, v35, 16, 16, 0, 1, 0, v24);
        if (AttributeDictionary
          && (v9 = AttributeDictionary,
              v10 = CVPixelBufferCreate(0, v7, v6, v5, AttributeDictionary, &pixelBufferOut),
              CFRelease(v9),
              !v10))
        {
          CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
          cva::imageViewFromPixelBuffer<unsigned char>(pixelBufferOut, &v29);
          if (!(_DWORD)v6)
          {
LABEL_30:
            CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
            fclose(v4);
            return (FILE *)pixelBufferOut;
          }
          v13 = v33;
          v14 = HIDWORD(v32);
          v15 = v32 * v30;
          while (fread(v13, 1uLL, v15, v4) == v15)
          {
            v13 += v14;
            LODWORD(v6) = v6 - 1;
            if (!(_DWORD)v6)
              goto LABEL_30;
          }
          if (pixelBufferOut)
          {
            CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
            CFRelease(pixelBufferOut);
          }
        }
        else
        {
          pixelBufferOut = 0;
        }
      }
    }
    fclose(v4);
    return 0;
  }
  if (!sub_20ABFE674((char *)this, (_DWORD *)&v28 + 1, &v28, (_DWORD *)&v27 + 1, &v27, (CGBitmapInfo *)&v26 + 1, (CGImageAlphaInfo *)&v26))return 0;
  if (v26 <= 6 && ((1 << v26) & 0x61) != 0)
  {
    if (HIDWORD(v27) == 3)
    {
      if ((_DWORD)v27 == 16)
        v18 = 1647589490;
      else
        v18 = 0;
      if ((_DWORD)v27 == 8)
        v11 = 24;
      else
        v11 = v18;
    }
    else if (HIDWORD(v27) == 1)
    {
      v11 = 1278226488;
      if ((_DWORD)v27 != 8)
      {
        if ((v26 & 0x10000000000) != 0)
          v12 = 1278226536;
        else
          v12 = 1647392359;
        if ((_DWORD)v27 != 16)
          v12 = 0;
        if ((_DWORD)v27 == 32)
          v11 = ((int)(HIDWORD(v26) << 23) >> 31) & 0x4C303066;
        else
          v11 = v12;
      }
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    if ((_DWORD)v27 == 16)
      v16 = 1647719521;
    else
      v16 = 0;
    if ((_DWORD)v27 == 8)
      v17 = 32;
    else
      v17 = v16;
    if ((_DWORD)v26 != 4)
      v17 = 0;
    if (HIDWORD(v27) == 3)
      v11 = v17;
    else
      v11 = 0;
  }
  v20 = v28;
  v19 = HIDWORD(v28);
  result = (FILE *)cva::createAttributeDictionary((cva *)HIDWORD(v28), v28, v11, 16, 16, 0, 1, 0, v24);
  if (result)
  {
    v21 = result;
    v22 = CVPixelBufferCreate(0, v19, v20, v11, (CFDictionaryRef)result, &pixelBuffer);
    CFRelease(v21);
    result = 0;
    if (!v22)
    {
      CVPixelBufferLockBaseAddress(pixelBuffer, 0);
      cva::imageViewFromPixelBuffer<unsigned char>(pixelBuffer, &v29);
      v23 = sub_20ABFE7A4((char *)this, v33, v30, v31, HIDWORD(v32));
      CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
      result = (FILE *)pixelBuffer;
      if (!v23)
      {
        CFRelease(pixelBuffer);
        return 0;
      }
    }
  }
  return result;
}

CGDataProvider *cva::imwrite<unsigned char>(uint64_t a1, char *__s)
{
  FILE *v4;
  FILE *v5;
  _BOOL8 v6;
  int v7;
  size_t v8;
  char *v9;
  size_t v10;
  char v12[8];
  char v13[8];

  strcpy(v13, ".ppm");
  strcpy(v12, ".pgm");
  if (!sub_20ABFE598(__s, v13) && !sub_20ABFE598(__s, v12))
    return sub_20ABFF60C(*(void **)(a1 + 24), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 20), __s, 0, 0, 0, 8u);
  v4 = fopen(__s, "wb");
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 1;
  fwrite("P5\n", 3uLL, 1uLL, v4);
  fprintf(v5, "%d %d\n", *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  fwrite("255\n", 4uLL, 1uLL, v5);
  if (*(_DWORD *)(a1 + 12))
  {
    v7 = 0;
    v8 = (*(_DWORD *)(a1 + 16) * *(_DWORD *)(a1 + 8));
    v9 = *(char **)(a1 + 24);
    while (1)
    {
      v10 = fwrite(v9, 1uLL, v8, v5);
      v6 = v10 == v8;
      if (v10 != v8)
        break;
      v9 += *(unsigned int *)(a1 + 20);
      if (++v7 >= *(_DWORD *)(a1 + 12))
      {
        v6 = 1;
        break;
      }
    }
  }
  fclose(v5);
  return (CGDataProvider *)v6;
}

CGDataProvider *sub_20ABFF60C(void *data, unsigned int a2, unsigned int a3, unsigned int a4, char *a5, int a6, CGBitmapInfo a7, int a8, unsigned int a9)
{
  CGDataProvider *v15;
  CGColorSpace *DeviceRGB;
  int NumberOfComponents;
  int v18;
  CGImage *v19;
  const __CFAllocator *v20;
  const __CFString *v21;
  const __CFURL *v22;
  char *v23;
  const __CFString *v24;
  const __CFString *PreferredIdentifierForTag;
  CGImageDestination *v26;
  int info;

  info = a8;
  v15 = CGDataProviderCreateWithData(&info, data, a4 * a3, 0);
  if (v15)
  {
    if (a6)
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      if (DeviceRGB)
        goto LABEL_4;
    }
    else
    {
      DeviceRGB = CGColorSpaceCreateDeviceGray();
      if (DeviceRGB)
      {
LABEL_4:
        NumberOfComponents = CGColorSpaceGetNumberOfComponents(DeviceRGB);
        if (info == 3)
          v18 = NumberOfComponents + 1;
        else
          v18 = NumberOfComponents;
        v19 = CGImageCreate(a2, a3, a9, v18 * a9, a4, DeviceRGB, a7, v15, 0, 0, kCGRenderingIntentDefault);
        CGColorSpaceRelease(DeviceRGB);
        CGDataProviderRelease(v15);
        if (v19)
        {
          v20 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v21 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], a5, 0);
          v22 = CFURLCreateWithFileSystemPath(v20, v21, kCFURLPOSIXPathStyle, 0);
          v23 = strrchr(a5, 46);
          v24 = CFStringCreateWithCString(v20, v23 + 1, 0x8000100u);
          PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1658], v24, 0);
          v26 = CGImageDestinationCreateWithURL(v22, PreferredIdentifierForTag, 1uLL, 0);
          CFRelease(v21);
          CFRelease(v22);
          CFRelease(v24);
          CFRelease(PreferredIdentifierForTag);
          if (v26)
          {
            CGImageDestinationAddImage(v26, v19, 0);
            v15 = (CGDataProvider *)CGImageDestinationFinalize(v26);
            CFRelease(v26);
            CGImageRelease(v19);
            return v15;
          }
          CGImageRelease(v19);
        }
        return 0;
      }
    }
    CGDataProviderRelease(v15);
    return 0;
  }
  return v15;
}

CGDataProvider *cva::imwrite<unsigned short>(uint64_t a1, char *__s)
{
  FILE *v4;
  FILE *v5;
  _BOOL8 v6;
  int v7;
  size_t v8;
  char *v9;
  size_t v10;
  char v12[8];
  char v13[8];

  strcpy(v13, ".ppm");
  strcpy(v12, ".pgm");
  if (!sub_20ABFE598(__s, v13) && !sub_20ABFE598(__s, v12))
    return sub_20ABFF60C(*(void **)(a1 + 24), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 20), __s, 0, 0x1000u, 0, 0x10u);
  v4 = fopen(__s, "wb");
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 1;
  fwrite("P5\n", 3uLL, 1uLL, v4);
  fprintf(v5, "%d %d\n", *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  fwrite("65535\n", 6uLL, 1uLL, v5);
  if (*(_DWORD *)(a1 + 12))
  {
    v7 = 0;
    v8 = (*(_DWORD *)(a1 + 16) * *(_DWORD *)(a1 + 8));
    v9 = *(char **)(a1 + 24);
    while (1)
    {
      v10 = fwrite(v9, 1uLL, v8, v5);
      v6 = v10 == v8;
      if (v10 != v8)
        break;
      v9 += *(unsigned int *)(a1 + 20);
      if (++v7 >= *(_DWORD *)(a1 + 12))
      {
        v6 = 1;
        break;
      }
    }
  }
  fclose(v5);
  return (CGDataProvider *)v6;
}

CGDataProvider *cva::imwrite<float>(uint64_t a1, char *__s)
{
  CGDataProvider *result;
  char v5[8];

  strcpy(v5, ".tiff");
  result = (CGDataProvider *)sub_20ABFE598(__s, v5);
  if ((_DWORD)result)
    return sub_20ABFF60C(*(void **)(a1 + 24), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 20), __s, 0, 0x2F00u, 0, 0x20u);
  return result;
}

CGDataProvider *cva::imwrite<cva::Matrix<unsigned char,3u,1u,false>>(uint64_t a1, char *__s)
{
  FILE *v4;
  FILE *v5;
  _BOOL8 v6;
  int v7;
  size_t v8;
  char *v9;
  size_t v10;
  char v12[8];
  char v13[8];

  strcpy(v13, ".ppm");
  strcpy(v12, ".pgm");
  if (!sub_20ABFE598(__s, v13) && !sub_20ABFE598(__s, v12))
    return sub_20ABFF60C(*(void **)(a1 + 24), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 20), __s, 1, 0, 0, 8u);
  v4 = fopen(__s, "wb");
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 1;
  fwrite("P6\n", 3uLL, 1uLL, v4);
  fprintf(v5, "%d %d\n", *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12));
  fwrite("255\n", 4uLL, 1uLL, v5);
  if (*(_DWORD *)(a1 + 12))
  {
    v7 = 0;
    v8 = (*(_DWORD *)(a1 + 16) * *(_DWORD *)(a1 + 8));
    v9 = *(char **)(a1 + 24);
    while (1)
    {
      v10 = fwrite(v9, 1uLL, v8, v5);
      v6 = v10 == v8;
      if (v10 != v8)
        break;
      v9 += *(unsigned int *)(a1 + 20);
      if (++v7 >= *(_DWORD *)(a1 + 12))
      {
        v6 = 1;
        break;
      }
    }
  }
  fclose(v5);
  return (CGDataProvider *)v6;
}

CGDataProvider *cva::imwrite<cva::Matrix<unsigned char,4u,1u,false>>(uint64_t a1, char *__s)
{
  char v5[8];
  char v6[8];

  strcpy(v6, ".ppm");
  strcpy(v5, ".pgm");
  if (sub_20ABFE598(__s, v6))
    return 0;
  if ((sub_20ABFE598(__s, v5) & 1) != 0)
    return 0;
  strcpy(v6, ".tiff");
  if ((sub_20ABFE598(__s, v6) & 1) != 0)
    return 0;
  else
    return sub_20ABFF60C(*(void **)(a1 + 24), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 20), __s, 1, 1u, 3, 8u);
}

CGDataProvider *cva::imwrite<cva::Matrix<unsigned short,4u,1u,false>>(uint64_t a1, char *__s)
{
  char v5[8];
  char v6[8];

  strcpy(v6, ".ppm");
  strcpy(v5, ".pgm");
  if (sub_20ABFE598(__s, v6))
    return 0;
  if ((sub_20ABFE598(__s, v5) & 1) != 0)
    return 0;
  strcpy(v6, ".tiff");
  if ((sub_20ABFE598(__s, v6) & 1) != 0)
    return 0;
  else
    return sub_20ABFF60C(*(void **)(a1 + 24), *(_DWORD *)(a1 + 8), *(_DWORD *)(a1 + 12), *(_DWORD *)(a1 + 20), __s, 1, 0x1003u, 3, 0x10u);
}

_QWORD *cva::Path::Private::Private(_QWORD *this)
{
  *this = 0;
  this[1] = 0;
  this[2] = 0;
  return this;
}

{
  *this = 0;
  this[1] = 0;
  this[2] = 0;
  return this;
}

_QWORD *cva::Path::Private::Private(_QWORD *__dst, __int128 *a2)
{
  __int128 v3;

  if (*((char *)a2 + 23) < 0)
  {
    sub_20AB88C14(__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v3 = *a2;
    __dst[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)__dst = v3;
  }
  return __dst;
}

{
  __int128 v3;

  if (*((char *)a2 + 23) < 0)
  {
    sub_20AB88C14(__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v3 = *a2;
    __dst[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)__dst = v3;
  }
  return __dst;
}

cva::Path *cva::Path::Path(cva::Path *this)
{
  _QWORD *v2;

  v2 = (_QWORD *)operator new();
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  *(_QWORD *)this = v2;
  return this;
}

{
  _QWORD *v2;

  v2 = (_QWORD *)operator new();
  v2[1] = 0;
  v2[2] = 0;
  *v2 = 0;
  *(_QWORD *)this = v2;
  return this;
}

void sub_20ABFFE94(uint64_t *a1, const char **a2)
{
  uint64_t v4;
  const char *v5;
  size_t v6;
  size_t v7;
  __int128 *p_dst;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 __dst;
  unint64_t v13;

  v4 = operator new();
  v5 = *a2;
  v6 = strlen(*a2);
  if (v6 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v7 = v6;
  if (v6 >= 0x17)
  {
    v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v6 | 7) != 0x17)
      v9 = v6 | 7;
    v10 = v9 + 1;
    p_dst = (__int128 *)operator new(v9 + 1);
    *((_QWORD *)&__dst + 1) = v7;
    v13 = v10 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v13) = v6;
  p_dst = &__dst;
  if (v6)
LABEL_8:
    memmove(p_dst, v5, v7);
  *((_BYTE *)p_dst + v7) = 0;
  if (SHIBYTE(v13) < 0)
  {
    v11 = (void *)__dst;
    sub_20AB88C14((_BYTE *)v4, (void *)__dst, *((unint64_t *)&__dst + 1));
    operator delete(v11);
  }
  else
  {
    *(_OWORD *)v4 = __dst;
    *(_QWORD *)(v4 + 16) = v13;
  }
  *a1 = v4;
}

std::string **cva::Path::operator=(std::string **a1, const std::string **a2)
{
  if (a2 != (const std::string **)a1)
    std::string::operator=(*a1, *a2);
  return a1;
}

uint64_t cva::Path::forwardString(cva::Path *this)
{
  return *(_QWORD *)this;
}

void cva::Path::directory(const std::string **this@<X0>, uint64_t *a2@<X8>)
{
  const std::string *v3;
  int v4;
  const std::string *v5;
  std::string::size_type size;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  size_t v10;
  void **v11;
  void **v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void **v16;
  std::string *v17;
  void *v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  size_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  const std::string *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *__p;
  char v34;
  std::string v35;
  _DWORD v36[2];
  size_t __sz[2];
  unint64_t v38;

  v3 = *this;
  v4 = HIBYTE((*this)->__r_.__value_.__r.__words[2]);
  if (SHIBYTE((*this)->__r_.__value_.__r.__words[2]) < 0)
  {
    size = v3->__r_.__value_.__l.__size_;
    if (size)
    {
      v5 = (const std::string *)v3->__r_.__value_.__r.__words[0];
      if (*(_BYTE *)(v3->__r_.__value_.__r.__words[0] + size - 1) != 47)
      {
        if (size != 1)
        {
          if (size != 2)
            goto LABEL_15;
LABEL_14:
          if (LOWORD(v5->__r_.__value_.__l.__data_) != 11822)
            goto LABEL_15;
          goto LABEL_45;
        }
        if (v5->__r_.__value_.__s.__data_[0] != 46)
          goto LABEL_15;
LABEL_45:
        v23 = (char)v4;
        if ((v4 & 0x80u) == 0)
          v24 = HIBYTE((*this)->__r_.__value_.__r.__words[2]);
        else
          v24 = v3->__r_.__value_.__l.__size_;
        v25 = v24 + 1;
        if (v24 + 1 >= 0x7FFFFFFFFFFFFFF8)
          abort();
        if (v25 >= 0x17)
        {
          v27 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v25 | 7) != 0x17)
            v27 = v25 | 7;
          v28 = v27 + 1;
          v26 = (char *)operator new(v27 + 1);
          __sz[1] = v24 + 1;
          v38 = v28 | 0x8000000000000000;
          __sz[0] = (size_t)v26;
        }
        else
        {
          __sz[1] = 0;
          v38 = 0;
          __sz[0] = 0;
          v26 = (char *)__sz;
          HIBYTE(v38) = v24 + 1;
          if (!v24)
          {
LABEL_59:
            *(_WORD *)&v26[v24] = 47;
            v30 = operator new();
            v31 = v30;
            if (SHIBYTE(v38) < 0)
            {
              v32 = (void *)__sz[0];
              sub_20AB88C14((_BYTE *)v30, (void *)__sz[0], __sz[1]);
              operator delete(v32);
            }
            else
            {
              *(_OWORD *)v30 = *(_OWORD *)__sz;
              *(_QWORD *)(v30 + 16) = v38;
            }
            *a2 = v31;
            return;
          }
        }
        if (v23 >= 0)
          v29 = v3;
        else
          v29 = (const std::string *)v3->__r_.__value_.__r.__words[0];
        memmove(v26, v29, v24);
        goto LABEL_59;
      }
    }
LABEL_9:
    v7 = operator new();
    v8 = v7;
    if (SHIBYTE(v3->__r_.__value_.__r.__words[2]) < 0)
    {
      sub_20AB88C14((_BYTE *)v7, v3->__r_.__value_.__l.__data_, v3->__r_.__value_.__l.__size_);
      *a2 = v8;
    }
    else
    {
      v9 = *(_OWORD *)&v3->__r_.__value_.__l.__data_;
      *(_QWORD *)(v7 + 16) = *((_QWORD *)&v3->__r_.__value_.__l + 2);
      *(_OWORD *)v7 = v9;
      *a2 = v7;
    }
    return;
  }
  if (!*((_BYTE *)&(*this)->__r_.__value_.__s + 23)
    || v3->__r_.__value_.__s.__data_[HIBYTE((*this)->__r_.__value_.__r.__words[2]) - 1] == 47)
  {
    goto LABEL_9;
  }
  if (v4 == 1)
  {
    if (v3->__r_.__value_.__s.__data_[0] != 46)
      goto LABEL_15;
    goto LABEL_45;
  }
  v5 = *this;
  if (v4 == 2)
    goto LABEL_14;
LABEL_15:
  __sz[0] = 0;
  __sz[1] = 0;
  v38 = 0;
  cva::utils::string::split((uint64_t)__sz, v3, "/", 1);
  v10 = __sz[1];
  v11 = (void **)(__sz[1] - 24);
  if (*(char *)(__sz[1] - 1) < 0)
    operator delete(*v11);
  __sz[1] = (size_t)v11;
  v12 = (void **)__sz[0];
  if ((void **)__sz[0] == v11)
  {
    if ((unint64_t)v11 >= v38)
    {
      v13 = 0x5555555555555556 * ((uint64_t)(v38 - (_QWORD)v11) >> 3);
      if (v13 <= 1)
        v13 = 1;
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v38 - (_QWORD)v11) >> 3) >= 0x555555555555555)
        v14 = 0xAAAAAAAAAAAAAAALL;
      else
        v14 = v13;
      if (v14 > 0xAAAAAAAAAAAAAAALL)
        sub_20ABAD09C();
      v15 = 3 * v14;
      v16 = (void **)operator new(24 * v14);
      *v16 = (void *)46;
      *((_BYTE *)v16 + 23) = 1;
      v10 = (size_t)(v16 + 3);
      __sz[0] = (size_t)v16;
      v38 = (unint64_t)&v16[v15];
      operator delete(v11);
      v11 = v16;
    }
    else
    {
      *(_QWORD *)(v10 - 24) = 46;
      *(_BYTE *)(v10 - 1) = 1;
    }
    v12 = v11;
    __sz[1] = v10;
    v11 = (void **)v10;
  }
  v34 = 1;
  LOWORD(__p) = 47;
  cva::utils::string::join((__int128 **)__sz, (uint64_t)&__p, &v35);
  v17 = std::string::append(&v35, "/");
  v18 = (void *)v17->__r_.__value_.__r.__words[0];
  v19 = v17->__r_.__value_.__l.__size_;
  v36[0] = v17->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v36 + 3) = *(_DWORD *)((char *)&v17->__r_.__value_.__r.__words[2] + 3);
  v20 = SHIBYTE(v17->__r_.__value_.__r.__words[2]);
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v35.__r_.__value_.__l.__data_);
    if ((v34 & 0x80000000) == 0)
      goto LABEL_32;
LABEL_36:
    operator delete(__p);
    goto LABEL_32;
  }
  if (v34 < 0)
    goto LABEL_36;
LABEL_32:
  v21 = operator new();
  v22 = v21;
  if (v20 < 0)
  {
    sub_20AB88C14((_BYTE *)v21, v18, v19);
    operator delete(v18);
    *a2 = v22;
    if (!v12)
      return;
  }
  else
  {
    *(_QWORD *)v21 = v18;
    *(_QWORD *)(v21 + 8) = v19;
    *(_DWORD *)(v21 + 16) = v36[0];
    *(_DWORD *)(v21 + 19) = *(_DWORD *)((char *)v36 + 3);
    *(_BYTE *)(v21 + 23) = v20;
    *a2 = v21;
    if (!v12)
      return;
  }
  while (v11 != v12)
  {
    if (*((char *)v11 - 1) < 0)
      operator delete(*(v11 - 3));
    v11 -= 3;
  }
  __sz[1] = (size_t)v12;
  operator delete(v12);
}

void cva::Path::parentPath(cva::Path *this@<X0>, uint64_t *a2@<X8>)
{
  sub_20AC004E8(a2, *(_QWORD *)this, 1);
}

void sub_20AC004E8(uint64_t *a1, uint64_t a2, int a3)
{
  void **v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  _BYTE *v14;
  void **v15;
  int v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  char *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  std::string::size_type v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  __int128 *v33;
  __int128 v34;
  char *v35;
  void **v36;
  uint64_t v37;
  unint64_t v38;
  int v39;
  std::string *v40;
  void *v41;
  unint64_t size;
  int v43;
  uint64_t v44;
  uint64_t v45;
  void *__p;
  char v47;
  _DWORD v48[2];
  char *v49;
  void **v50;
  char *v51;
  std::string v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  if ((*(char *)(a2 + 23) & 0x80000000) == 0)
  {
    if (*(_BYTE *)(a2 + 23))
      goto LABEL_3;
LABEL_7:
    v8 = operator new();
    v9 = v8;
    if (*(char *)(a2 + 23) < 0)
    {
      sub_20AB88C14((_BYTE *)v8, *(void **)a2, *(_QWORD *)(a2 + 8));
      *a1 = v9;
    }
    else
    {
      *(_OWORD *)v8 = *(_OWORD *)a2;
      *(_QWORD *)(v8 + 16) = *(_QWORD *)(a2 + 16);
      *a1 = v8;
    }
    return;
  }
  if (!*(_QWORD *)(a2 + 8))
    goto LABEL_7;
LABEL_3:
  v49 = 0;
  v50 = 0;
  v51 = 0;
  cva::utils::string::split((uint64_t)&v49, (const std::string *)a2, "/", 1);
  v6 = v50;
  v7 = v50 - 3;
  if (*((char *)v50 - 1) < 0)
  {
    if (*(v50 - 2))
      goto LABEL_12;
    operator delete(*v7);
  }
  else if (*((_BYTE *)v50 - 1))
  {
    goto LABEL_12;
  }
  v50 = v7;
  v6 = v7;
LABEL_12:
  v10 = (__int128 *)v49;
  v11 = (char *)v6 - v49 - 24;
  if ((char *)v6 - v49 != 24)
    goto LABEL_15;
  if ((*((char *)v6 - 1) & 0x80000000) == 0)
  {
    if (*((_BYTE *)v6 - 1))
      goto LABEL_15;
LABEL_39:
    v52.__r_.__value_.__r.__words[0] = (std::string::size_type)"/";
    sub_20ABFFE94(a1, (const char **)&v52.__r_.__value_.__l.__data_);
    if (!v10)
      return;
    goto LABEL_118;
  }
  if (!*(v6 - 2))
    goto LABEL_39;
LABEL_15:
  if (!a3)
  {
    v15 = v6 - 3;
    if (*((char *)v6 - 1) < 0)
      operator delete(*v15);
    v50 = v6 - 3;
    if (v10 != (__int128 *)v15)
      goto LABEL_107;
    if (v10 < (__int128 *)v51)
    {
      *(_QWORD *)v10 = 46;
      *((_BYTE *)v6 - 1) = 1;
      v50 = v6;
      goto LABEL_108;
    }
    v19 = 0x5555555555555556 * ((v51 - (char *)v10) >> 3);
    if (v19 <= 1)
      v19 = 1;
    if (0xAAAAAAAAAAAAAAABLL * ((v51 - (char *)v10) >> 3) >= 0x555555555555555)
      v20 = 0xAAAAAAAAAAAAAAALL;
    else
      v20 = v19;
    if (v20 <= 0xAAAAAAAAAAAAAAALL)
    {
      v21 = 24 * v20;
      v22 = (char *)operator new(24 * v20);
      *(_QWORD *)v22 = 46;
      v22[23] = 1;
      v6 = (void **)(v22 + 24);
      v49 = v22;
      v51 = &v22[v21];
      operator delete(v10);
      v50 = (void **)(v22 + 24);
      v10 = (__int128 *)v22;
      goto LABEL_108;
    }
    goto LABEL_123;
  }
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v6 - v49) >> 3) >= 2)
  {
    while (1)
    {
      v13 = *((char *)v6 - 1);
      if (v13 < 0)
      {
        if (*(v6 - 2) != (void *)1 || (v14 = *(v6 - 3), *v14 != 46))
        {
LABEL_32:
          v50 = v6;
          break;
        }
        operator delete(v14);
      }
      else if (v13 != 1 || *((_BYTE *)v6 - 24) != 46)
      {
        goto LABEL_32;
      }
      v6 -= 3;
      v12 = 0xAAAAAAAAAAAAAAABLL * (v11 >> 3);
      v11 -= 24;
      if (v12 <= 1)
        goto LABEL_32;
    }
  }
  v15 = v6 - 3;
  if (*((char *)v6 - 1) < 0)
  {
    v17 = (uint64_t)*(v6 - 2);
    if (v17 == 1)
    {
      v18 = *v15;
      if (*(_BYTE *)*v15 == 46)
        goto LABEL_55;
    }
    else if (v17 == 2)
    {
      v18 = *v15;
      if (*(_WORD *)*v15 == 11822)
        goto LABEL_55;
    }
    else
    {
      v18 = *v15;
    }
    operator delete(v18);
LABEL_68:
    v50 = v6 - 3;
    if (v10 != (__int128 *)v15)
      goto LABEL_97;
    if (v15 >= (void **)v51)
    {
      v28 = 0xAAAAAAAAAAAAAAABLL * (((char *)v15 - (char *)v10) >> 3);
      v29 = v28 + 1;
      if (v28 + 1 > 0xAAAAAAAAAAAAAAALL)
        goto LABEL_124;
      if (0x5555555555555556 * ((v51 - (char *)v10) >> 3) > v29)
        v29 = 0x5555555555555556 * ((v51 - (char *)v10) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * ((v51 - (char *)v10) >> 3) >= 0x555555555555555)
        v30 = 0xAAAAAAAAAAAAAAALL;
      else
        v30 = v29;
      if (v30)
      {
        if (v30 > 0xAAAAAAAAAAAAAAALL)
          goto LABEL_123;
        v31 = (char *)operator new(24 * v30);
      }
      else
      {
        v31 = 0;
      }
      v35 = &v31[24 * v28];
      *(_QWORD *)v35 = 46;
      v35[23] = 1;
      v52.__r_.__value_.__r.__words[0] = 0;
      *(std::string::size_type *)((char *)v52.__r_.__value_.__r.__words + 7) = 0;
      v6 = (void **)(v35 + 24);
      v49 = v35;
      v51 = &v31[24 * v30];
      if (v10)
        operator delete(v10);
    }
    else
    {
      *(v6 - 3) = (void *)46;
      v27 = v52.__r_.__value_.__r.__words[0];
      *(void **)((char *)v6 - 9) = *(void **)((char *)v52.__r_.__value_.__r.__words + 7);
      *(v6 - 2) = (void *)v27;
      *((_BYTE *)v6 - 1) = 1;
    }
    v50 = v6;
    v15 = v6;
    goto LABEL_97;
  }
  v16 = *((unsigned __int8 *)v6 - 1);
  if (v16 == 1)
  {
    if (*(_BYTE *)v15 == 46)
      goto LABEL_55;
    goto LABEL_68;
  }
  if (v16 != 2 || *(_WORD *)v15 != 11822)
    goto LABEL_68;
LABEL_55:
  if (v6 < (void **)v51)
  {
    *v6 = (void *)11822;
    v23 = *(void **)((char *)v52.__r_.__value_.__r.__words + 7);
    v6[1] = (void *)v52.__r_.__value_.__r.__words[0];
    *(void **)((char *)v6 + 15) = v23;
    *((_BYTE *)v6 + 23) = 2;
    v15 = v6 + 3;
    v50 = v6 + 3;
    goto LABEL_97;
  }
  v24 = 0xAAAAAAAAAAAAAAABLL * (((char *)v6 - (char *)v10) >> 3) + 1;
  if (v24 > 0xAAAAAAAAAAAAAAALL)
LABEL_124:
    abort();
  if (0x5555555555555556 * ((v51 - (char *)v10) >> 3) > v24)
    v24 = 0x5555555555555556 * ((v51 - (char *)v10) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * ((v51 - (char *)v10) >> 3) >= 0x555555555555555)
    v25 = 0xAAAAAAAAAAAAAAALL;
  else
    v25 = v24;
  if (!v25)
  {
    v26 = 0;
    goto LABEL_81;
  }
  if (v25 > 0xAAAAAAAAAAAAAAALL)
LABEL_123:
    sub_20ABAD09C();
  v26 = (char *)operator new(24 * v25);
LABEL_81:
  v32 = &v26[8 * (((char *)v6 - (char *)v10) >> 3)];
  *(_QWORD *)v32 = 11822;
  v32[23] = 2;
  v52.__r_.__value_.__r.__words[0] = 0;
  *(std::string::size_type *)((char *)v52.__r_.__value_.__r.__words + 7) = 0;
  v15 = (void **)(v32 + 24);
  if (v6 == (void **)v10)
  {
    v49 = &v26[8 * (((char *)v6 - (char *)v10) >> 3)];
    v51 = &v26[24 * v25];
  }
  else
  {
    v33 = (__int128 *)v6;
    do
    {
      v34 = *(__int128 *)((char *)v33 - 24);
      *((_QWORD *)v32 - 1) = *((_QWORD *)v33 - 1);
      *(_OWORD *)(v32 - 24) = v34;
      v32 -= 24;
      *((_QWORD *)v33 - 2) = 0;
      *((_QWORD *)v33 - 1) = 0;
      *((_QWORD *)v33 - 3) = 0;
      v33 = (__int128 *)((char *)v33 - 24);
    }
    while (v33 != v10);
    v49 = v32;
    v50 = v15;
    v51 = &v26[24 * v25];
    while (v6 != (void **)v10)
    {
      if (*((char *)v6 - 1) < 0)
        operator delete(*(v6 - 3));
      v6 -= 3;
    }
  }
  if (v10)
    operator delete(v10);
  v50 = v15;
LABEL_97:
  v10 = (__int128 *)v49;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v15 - v49) >> 3) < 2)
  {
LABEL_107:
    v6 = v15;
    goto LABEL_108;
  }
  v36 = v15 - 3;
  v37 = (char *)(v15 - 3) - v49;
  do
  {
    v39 = *((char *)v36 + 23);
    if ((v39 & 0x80000000) == 0)
    {
      if (v39 != 1 || *(_BYTE *)v36 != 46)
        goto LABEL_107;
      goto LABEL_100;
    }
    if (v36[1] != (void *)1)
      break;
    if (*(_BYTE *)*v36 != 46)
      goto LABEL_107;
    operator delete(*v36);
LABEL_100:
    v15 -= 3;
    v50 = v36;
    v38 = 0xAAAAAAAAAAAAAAABLL * (v37 >> 3);
    v36 -= 3;
    v37 -= 24;
  }
  while (v38 > 1);
  v6 = v36 + 3;
LABEL_108:
  v47 = 1;
  LOWORD(__p) = 47;
  cva::utils::string::join((__int128 **)&v49, (uint64_t)&__p, &v52);
  v40 = std::string::append(&v52, "/");
  v41 = (void *)v40->__r_.__value_.__r.__words[0];
  size = v40->__r_.__value_.__l.__size_;
  v48[0] = v40->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v48 + 3) = *(_DWORD *)((char *)&v40->__r_.__value_.__r.__words[2] + 3);
  v43 = SHIBYTE(v40->__r_.__value_.__r.__words[2]);
  v40->__r_.__value_.__l.__size_ = 0;
  v40->__r_.__value_.__r.__words[2] = 0;
  v40->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v52.__r_.__value_.__l.__data_);
    if (v47 < 0)
      goto LABEL_113;
  }
  else
  {
    if ((v47 & 0x80000000) == 0)
      goto LABEL_110;
LABEL_113:
    operator delete(__p);
  }
LABEL_110:
  v44 = operator new();
  v45 = v44;
  if (v43 < 0)
  {
    sub_20AB88C14((_BYTE *)v44, v41, size);
    operator delete(v41);
  }
  else
  {
    *(_QWORD *)v44 = v41;
    *(_QWORD *)(v44 + 8) = size;
    *(_DWORD *)(v44 + 16) = v48[0];
    *(_DWORD *)(v44 + 19) = *(_DWORD *)((char *)v48 + 3);
    *(_BYTE *)(v44 + 23) = v43;
  }
  *a1 = v45;
  if (v10)
  {
LABEL_118:
    while (v6 != (void **)v10)
    {
      if (*((char *)v6 - 1) < 0)
        operator delete(*(v6 - 3));
      v6 -= 3;
    }
    v50 = (void **)v10;
    operator delete(v10);
  }
}

void cva::Path::filename(cva::Path *this@<X0>, uint64_t *a2@<X8>)
{
  __int128 *v3;
  __int128 v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  std::string __p;
  __int128 v11;
  uint64_t v12;

  v3 = *(__int128 **)this;
  if (*(char *)(*(_QWORD *)this + 23) < 0)
  {
    v5 = *((_QWORD *)v3 + 1);
    if (v5 && *(_BYTE *)(*(_QWORD *)v3 + v5 - 1) != 47)
    {
      sub_20AB88C14(&__p, *(void **)v3, v5);
      goto LABEL_9;
    }
LABEL_7:
    v6 = (_QWORD *)operator new();
    v6[1] = 0;
    v6[2] = 0;
    *v6 = 0;
    *a2 = (uint64_t)v6;
    return;
  }
  if (!*(_BYTE *)(*(_QWORD *)this + 23) || *((_BYTE *)v3 + *(unsigned __int8 *)(*(_QWORD *)this + 23) - 1) == 47)
    goto LABEL_7;
  v4 = *v3;
  __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v3 + 2);
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v4;
LABEL_9:
  cva::Path::safeBasename(&__p, &v11);
  v7 = operator new();
  v8 = v7;
  if (SHIBYTE(v12) < 0)
  {
    v9 = (void *)v11;
    sub_20AB88C14((_BYTE *)v7, (void *)v11, *((unint64_t *)&v11 + 1));
    operator delete(v9);
  }
  else
  {
    *(_OWORD *)v7 = v11;
    *(_QWORD *)(v7 + 16) = v12;
  }
  *a2 = v8;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

std::string *cva::Path::safeBasename@<X0>(std::string *this@<X0>, _BYTE *a2@<X8>)
{
  std::string *v2;
  _QWORD *v3;
  unsigned int i;
  std::string::size_type v5;
  std::string *v6;
  std::string::size_type size;
  unint64_t v8;
  char *v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v2 = this;
  v3 = a2;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    if (this->__r_.__value_.__l.__size_)
      goto LABEL_3;
LABEL_14:
    a2[23] = 1;
    *(_WORD *)a2 = 46;
    return this;
  }
  if (!*((_BYTE *)&this->__r_.__value_.__s + 23))
    goto LABEL_14;
LABEL_3:
  for (i = HIBYTE(this->__r_.__value_.__r.__words[2]); (i & 0x80) == 0; i = HIBYTE(this->__r_.__value_.__r.__words[2]))
  {
    size = i;
    if (i <= 1)
      goto LABEL_15;
    if (*((_BYTE *)&this[-1].__r_.__value_.__r.__words[2] + i + 7) != 47)
      goto LABEL_16;
    v5 = i - 1;
    *((_BYTE *)&this->__r_.__value_.__s + 23) = size - 1;
    v6 = this;
LABEL_5:
    v6->__r_.__value_.__s.__data_[v5] = 0;
  }
  size = this->__r_.__value_.__l.__size_;
  v5 = size - 1;
  if (size > 1)
  {
    v6 = (std::string *)this->__r_.__value_.__r.__words[0];
    if (*(_BYTE *)(this->__r_.__value_.__r.__words[0] + size - 1) != 47)
      goto LABEL_16;
    this->__r_.__value_.__l.__size_ = v5;
    goto LABEL_5;
  }
LABEL_15:
  if (size == 1)
  {
LABEL_20:
    *(_OWORD *)v3 = *(_OWORD *)&v2->__r_.__value_.__l.__data_;
    v3[2] = *((_QWORD *)&v2->__r_.__value_.__l + 2);
    v2->__r_.__value_.__l.__size_ = 0;
    v2->__r_.__value_.__r.__words[2] = 0;
    v2->__r_.__value_.__r.__words[0] = 0;
    return this;
  }
LABEL_16:
  this = (std::string *)std::string::rfind(this, 47, 0xFFFFFFFFFFFFFFFFLL);
  if (this == (std::string *)-1)
    goto LABEL_20;
  if (SHIBYTE(v2->__r_.__value_.__r.__words[2]) < 0)
  {
    v8 = v2->__r_.__value_.__l.__size_;
    if (v8 <= (unint64_t)this)
      goto LABEL_32;
    v2 = (std::string *)v2->__r_.__value_.__r.__words[0];
  }
  else
  {
    v8 = HIBYTE(v2->__r_.__value_.__r.__words[2]);
    if ((unint64_t)this >= v8)
LABEL_32:
      abort();
  }
  v9 = &this->__r_.__value_.__s.__data_[1];
  v10 = v8 - ((_QWORD)this->__r_.__value_.__r.__words + 1);
  if (v10 >= 0x7FFFFFFFFFFFFFF8)
    goto LABEL_32;
  if (v10 >= 0x17)
  {
    v11 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v11 = v10 | 7;
    v12 = v11 + 1;
    v13 = operator new(v11 + 1);
    v3[1] = v10;
    v3[2] = v12 | 0x8000000000000000;
    *v3 = v13;
    v3 = v13;
    goto LABEL_30;
  }
  *((_BYTE *)v3 + 23) = v10;
  if ((char *)v8 != v9)
LABEL_30:
    this = (std::string *)memmove(v3, &v9[(_QWORD)v2], v10);
  *((_BYTE *)v3 + v10) = 0;
  return this;
}

void cva::Path::stem(cva::Path *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  __int128 v4;
  int v5;
  std::string *v6;
  std::string *v7;
  std::string::size_type v8;
  std::string::size_type size;
  std::string *v10;
  size_t v11;
  __int128 *p_dst;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 __dst;
  unint64_t v19;
  std::string v20;

  cva::Path::filename(this, (uint64_t *)&__dst);
  v3 = __dst;
  if (*(char *)(__dst + 23) < 0)
  {
    sub_20AB88C14(&v20, *(void **)__dst, *(_QWORD *)(__dst + 8));
    if (*(char *)(v3 + 23) < 0)
      operator delete(*(void **)v3);
  }
  else
  {
    v4 = *(_OWORD *)__dst;
    v20.__r_.__value_.__r.__words[2] = *(_QWORD *)(__dst + 16);
    *(_OWORD *)&v20.__r_.__value_.__l.__data_ = v4;
  }
  MEMORY[0x20BD2D02C](v3, 0x1012C40EC159624);
  v5 = SHIBYTE(v20.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
  {
    if (v20.__r_.__value_.__l.__size_ == 1)
    {
      if (*v20.__r_.__value_.__l.__data_ == 46)
      {
        v7 = (std::string *)operator new();
LABEL_20:
        sub_20AB88C14(v7, v20.__r_.__value_.__l.__data_, v20.__r_.__value_.__l.__size_);
        *a2 = v7;
        goto LABEL_39;
      }
      goto LABEL_21;
    }
    if (v20.__r_.__value_.__l.__size_ != 2)
      goto LABEL_21;
    v6 = (std::string *)v20.__r_.__value_.__r.__words[0];
    goto LABEL_12;
  }
  if (HIBYTE(v20.__r_.__value_.__r.__words[2]) != 1)
  {
    if (HIBYTE(v20.__r_.__value_.__r.__words[2]) != 2)
      goto LABEL_21;
    v6 = &v20;
LABEL_12:
    if (LOWORD(v6->__r_.__value_.__l.__data_) == 11822)
    {
      v7 = (std::string *)operator new();
      if (v5 < 0)
        goto LABEL_20;
LABEL_17:
      *v7 = v20;
      *a2 = v7;
      goto LABEL_39;
    }
    goto LABEL_21;
  }
  if (v20.__r_.__value_.__s.__data_[0] == 46)
  {
    v7 = (std::string *)operator new();
    goto LABEL_17;
  }
LABEL_21:
  v8 = std::string::rfind(&v20, 46, 0xFFFFFFFFFFFFFFFFLL);
  size = HIBYTE(v20.__r_.__value_.__r.__words[2]);
  if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
  {
    v10 = &v20;
  }
  else
  {
    size = v20.__r_.__value_.__l.__size_;
    v10 = (std::string *)v20.__r_.__value_.__r.__words[0];
  }
  if (size >= v8)
    v11 = v8;
  else
    v11 = size;
  if (v11 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  if (v11 >= 0x17)
  {
    v13 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17)
      v13 = v11 | 7;
    v14 = v13 + 1;
    p_dst = (__int128 *)operator new(v13 + 1);
    *((_QWORD *)&__dst + 1) = v11;
    v19 = v14 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
  }
  else
  {
    HIBYTE(v19) = v11;
    p_dst = &__dst;
    if (!v11)
      goto LABEL_35;
  }
  memmove(p_dst, v10, v11);
LABEL_35:
  *((_BYTE *)p_dst + v11) = 0;
  v15 = operator new();
  v16 = v15;
  if (SHIBYTE(v19) < 0)
  {
    v17 = (void *)__dst;
    sub_20AB88C14((_BYTE *)v15, (void *)__dst, *((unint64_t *)&__dst + 1));
    operator delete(v17);
  }
  else
  {
    *(_OWORD *)v15 = __dst;
    *(_QWORD *)(v15 + 16) = v19;
  }
  *a2 = v16;
  LOBYTE(v5) = *((_BYTE *)&v20.__r_.__value_.__s + 23);
LABEL_39:
  if ((v5 & 0x80) != 0)
    operator delete(v20.__r_.__value_.__l.__data_);
}

void cva::Path::extension(cva::Path *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  __int128 v4;
  std::string *p_dst;
  unint64_t v6;
  unint64_t v7;
  std::string::size_type size;
  std::string *v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  __int128 *v14;
  std::string __dst;

  cva::Path::filename(this, (uint64_t *)&v14);
  v3 = (uint64_t)v14;
  if (*((char *)v14 + 23) < 0)
  {
    sub_20AB88C14(&__dst, *(void **)v14, *((_QWORD *)v14 + 1));
    if (*(char *)(v3 + 23) < 0)
      operator delete(*(void **)v3);
  }
  else
  {
    v4 = *v14;
    __dst.__r_.__value_.__r.__words[2] = *((_QWORD *)v14 + 2);
    *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v4;
  }
  MEMORY[0x20BD2D02C](v3, 0x1012C40EC159624);
  if ((*((_BYTE *)&__dst.__r_.__value_.__s + 23) & 0x80) != 0)
  {
    if (__dst.__r_.__value_.__l.__size_ == 1)
    {
      if (*__dst.__r_.__value_.__l.__data_ == 46)
        goto LABEL_21;
      goto LABEL_17;
    }
    if (__dst.__r_.__value_.__l.__size_ != 2)
      goto LABEL_17;
    p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
    goto LABEL_12;
  }
  if (HIBYTE(__dst.__r_.__value_.__r.__words[2]) != 1)
  {
    if (HIBYTE(__dst.__r_.__value_.__r.__words[2]) != 2)
      goto LABEL_17;
    p_dst = &__dst;
LABEL_12:
    if (LOWORD(p_dst->__r_.__value_.__l.__data_) == 11822)
      goto LABEL_21;
    goto LABEL_17;
  }
  if (__dst.__r_.__value_.__s.__data_[0] == 46)
  {
LABEL_21:
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
    goto LABEL_22;
  }
LABEL_17:
  v6 = std::string::rfind(&__dst, 46, 0xFFFFFFFFFFFFFFFFLL);
  if (v6 == -1)
    goto LABEL_21;
  v7 = v6;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __dst.__r_.__value_.__l.__size_;
    if (__dst.__r_.__value_.__l.__size_ < v6)
      goto LABEL_36;
    v9 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
    if (v6 > HIBYTE(__dst.__r_.__value_.__r.__words[2]))
      goto LABEL_36;
    v9 = &__dst;
  }
  v10 = size - v6;
  if (size - v6 >= 0x7FFFFFFFFFFFFFF8)
LABEL_36:
    abort();
  if (v10 >= 0x17)
  {
    v11 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17)
      v11 = v10 | 7;
    v12 = v11 + 1;
    v13 = operator new(v11 + 1);
    a2[1] = v10;
    a2[2] = v12 | 0x8000000000000000;
    *a2 = v13;
    a2 = v13;
    goto LABEL_33;
  }
  *((_BYTE *)a2 + 23) = v10;
  if (size != v6)
LABEL_33:
    memmove(a2, (char *)v9 + v7, v10);
  *((_BYTE *)a2 + v10) = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
LABEL_22:
    operator delete(__dst.__r_.__value_.__l.__data_);
}

void cva::Path::workingDirectory(uint64_t *a1@<X8>)
{
  char *v3;
  char *v4;
  _QWORD *v5;
  char *v6;

  v3 = getcwd(0, 0);
  if (v3)
  {
    v4 = v3;
    v6 = v3;
    sub_20ABFFE94(a1, (const char **)&v6);
    free(v4);
  }
  else
  {
    v5 = (_QWORD *)operator new();
    v5[1] = 0;
    v5[2] = 0;
    *v5 = 0;
    *a1 = (uint64_t)v5;
  }
}

void cva::Path::canonical(const std::string::value_type ***this@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  const char *v4;
  const char *v5;
  char *v6;
  char *v7;
  std::string *v8;
  _QWORD *v9;
  std::string *__str;
  char *v11;

  if (*((char *)*this + 23) < 0)
  {
    if ((*this)[1])
      goto LABEL_3;
LABEL_13:
    v9 = (_QWORD *)operator new();
    v9[1] = 0;
    v9[2] = 0;
    *v9 = 0;
    *a2 = (uint64_t)v9;
    return;
  }
  if (!*((_BYTE *)*this + 23))
    goto LABEL_13;
LABEL_3:
  cva::Path::absolute(this, a2);
  v3 = *a2;
  v4 = (const char *)v3;
  if (*(char *)(v3 + 23) < 0)
    v4 = *(const char **)v3;
  if (!access(v4, 0))
  {
    v5 = (const char *)v3;
    if (*(char *)(v3 + 23) < 0)
      v5 = *(const char **)v3;
    v6 = realpath_DARWIN_EXTSN(v5, 0);
    if (v6)
    {
      v7 = v6;
      v11 = v6;
      sub_20ABFFE94((uint64_t *)&__str, (const char **)&v11);
      v8 = __str;
      std::string::operator=((std::string *)v3, __str);
      if (SHIBYTE(v8->__r_.__value_.__r.__words[2]) < 0)
        operator delete(v8->__r_.__value_.__l.__data_);
      MEMORY[0x20BD2D02C](v8, 0x1012C40EC159624);
      free(v7);
    }
  }
}

std::string *cva::Path::absolute@<X0>(const std::string::value_type ***this@<X0>, uint64_t *a2@<X8>)
{
  const std::string::value_type **v4;
  const std::string::value_type **v5;
  std::string *result;
  std::string *v7;
  __int128 v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const std::string::value_type **v14;
  int v15;
  const std::string::value_type *v16;
  std::string::size_type v17;
  char *v18;

  v4 = *this;
  if (*((char *)*this + 23) < 0)
  {
    if (!v4[1])
      goto LABEL_9;
    v5 = (const std::string::value_type **)*v4;
  }
  else
  {
    v5 = *this;
    if (!*((_BYTE *)*this + 23))
    {
LABEL_9:
      v9 = getcwd(0, 0);
      if (v9)
      {
        v10 = v9;
        v18 = v9;
        sub_20ABFFE94(a2, (const char **)&v18);
        free(v10);
        v11 = *a2;
        LODWORD(v12) = *(char *)(*a2 + 23);
        if ((v12 & 0x80000000) == 0)
        {
LABEL_11:
          v12 = v12;
          if (!(_BYTE)v12)
            goto LABEL_26;
          v13 = v11;
LABEL_16:
          if (*(_BYTE *)(v13 + v12 - 1) != 47)
          {
            v14 = *this;
            if ((*((char *)*this + 23) & 0x80000000) == 0)
            {
              if (!*((_BYTE *)*this + 23))
                goto LABEL_26;
LABEL_24:
              if (*(_BYTE *)v14 != 47)
                std::string::push_back((std::string *)v11, 47);
              goto LABEL_26;
            }
            if (v14[1])
            {
              v14 = (const std::string::value_type **)*v14;
              goto LABEL_24;
            }
          }
LABEL_26:
          v15 = *((char *)*this + 23);
          if (v15 >= 0)
            v16 = (const std::string::value_type *)*this;
          else
            v16 = **this;
          if (v15 >= 0)
            v17 = *((unsigned __int8 *)*this + 23);
          else
            v17 = (std::string::size_type)(*this)[1];
          return std::string::append((std::string *)v11, v16, v17);
        }
      }
      else
      {
        v11 = operator new();
        *(_QWORD *)(v11 + 8) = 0;
        *(_QWORD *)(v11 + 16) = 0;
        *(_QWORD *)v11 = 0;
        *a2 = v11;
        LODWORD(v12) = *(char *)(v11 + 23);
        if ((v12 & 0x80000000) == 0)
          goto LABEL_11;
      }
      v12 = *(_QWORD *)(v11 + 8);
      if (!v12)
        goto LABEL_26;
      v13 = *(_QWORD *)v11;
      goto LABEL_16;
    }
  }
  if (*(_BYTE *)v5 != 47)
    goto LABEL_9;
  result = (std::string *)operator new();
  v7 = result;
  if (*((char *)v4 + 23) < 0)
  {
    result = (std::string *)sub_20AB88C14(result, (void *)*v4, (unint64_t)v4[1]);
  }
  else
  {
    v8 = *(_OWORD *)v4;
    result->__r_.__value_.__r.__words[2] = (std::string::size_type)v4[2];
    *(_OWORD *)&result->__r_.__value_.__l.__data_ = v8;
  }
  *a2 = (uint64_t)v7;
  return result;
}

BOOL cva::Path::isAbsolute(cva::Path *this)
{
  _QWORD *v1;

  v1 = *(_QWORD **)this;
  if ((*(char *)(*(_QWORD *)this + 23) & 0x80000000) == 0)
  {
    if (!*(_BYTE *)(*(_QWORD *)this + 23))
      return 0;
    return *(_BYTE *)v1 == 47;
  }
  if (v1[1])
  {
    v1 = (_QWORD *)*v1;
    return *(_BYTE *)v1 == 47;
  }
  return 0;
}

uint64_t cva::Path::makeRelative(const std::string **this, const std::string **a2)
{
  void **v4;
  void **v5;
  void **v6;
  void **v7;
  void **v8;
  void **i;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  int v13;
  unsigned __int8 *v14;
  uint64_t v15;
  uint64_t v16;
  void **j;
  uint64_t v19;
  int v20;
  int v21;
  const std::string::value_type *v22;
  std::string::size_type v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  char *v28;
  const std::string::value_type *v29;
  std::string *v30;
  std::string *__str;
  void *__p;
  void **v33;
  uint64_t v34;
  void **v35;
  void **v36;
  uint64_t v37;
  const char *v38;

  v35 = 0;
  v36 = 0;
  v37 = 0;
  __p = 0;
  v33 = 0;
  v34 = 0;
  cva::utils::string::split((uint64_t)&v35, *this, "/", 1);
  cva::utils::string::split((uint64_t)&__p, *a2, "/", 1);
  v4 = v35;
  v5 = v36;
  v6 = (void **)__p;
  if (v35 == v36)
    goto LABEL_29;
  v7 = v33;
  if (__p == v33)
    goto LABEL_29;
  if (*((char *)v33 - 1) < 0)
  {
    if (!*(v33 - 2))
    {
      operator delete(*(v33 - 3));
LABEL_8:
      v33 = v7 - 3;
      v7 -= 3;
    }
  }
  else if (!*((_BYTE *)v33 - 1))
  {
    goto LABEL_8;
  }
  v8 = v4;
  if (v6 != v7)
  {
    v8 = v4;
    for (i = v6; i != v7; i += 3)
    {
      if (v8 == v5)
        goto LABEL_29;
      v10 = *((unsigned __int8 *)v8 + 23);
      if ((v10 & 0x80u) == 0)
        v11 = (unsigned __int8 *)*((unsigned __int8 *)v8 + 23);
      else
        v11 = (unsigned __int8 *)v8[1];
      v12 = (unsigned __int8 *)*((unsigned __int8 *)i + 23);
      v13 = (char)v12;
      if ((char)v12 < 0)
        v12 = (unsigned __int8 *)i[1];
      if (v11 != v12)
        goto LABEL_29;
      if (v13 >= 0)
        v14 = (unsigned __int8 *)i;
      else
        v14 = (unsigned __int8 *)*i;
      if ((v10 & 0x80) != 0)
      {
        if (memcmp(*v8, v14, (size_t)v8[1]))
          goto LABEL_29;
      }
      else if (*((_BYTE *)v8 + 23))
      {
        v15 = 0;
        while (*((unsigned __int8 *)v8 + v15) == v14[v15])
        {
          if (v10 == ++v15)
            goto LABEL_12;
        }
LABEL_29:
        v16 = 0;
        if (!v6)
          goto LABEL_36;
LABEL_30:
        for (j = v33; j != v6; j -= 3)
        {
          if (*((char *)j - 1) < 0)
            operator delete(*(j - 3));
        }
        operator delete(v6);
        goto LABEL_36;
      }
LABEL_12:
      v8 += 3;
    }
  }
  v19 = operator new();
  *(_QWORD *)(v19 + 8) = 0;
  *(_QWORD *)(v19 + 16) = 0;
  *(_QWORD *)v19 = 0;
  if (v8 == v5)
  {
    LOBYTE(v20) = 0;
    goto LABEL_70;
  }
  do
  {
    v24 = operator new();
    v25 = v24;
    if (*((char *)v8 + 23) < 0)
    {
      sub_20AB88C14((_BYTE *)v24, *v8, (unint64_t)v8[1]);
      LODWORD(v27) = *(char *)(v19 + 23);
      if ((v27 & 0x80000000) == 0)
      {
LABEL_56:
        v27 = v27;
        if (!(_BYTE)v27)
          goto LABEL_45;
        v28 = (char *)v19;
        goto LABEL_61;
      }
    }
    else
    {
      v26 = *(_OWORD *)v8;
      *(_QWORD *)(v24 + 16) = v8[2];
      *(_OWORD *)v24 = v26;
      LODWORD(v27) = *(char *)(v19 + 23);
      if ((v27 & 0x80000000) == 0)
        goto LABEL_56;
    }
    v27 = *(_QWORD *)(v19 + 8);
    if (!v27)
      goto LABEL_45;
    v28 = *(char **)v19;
LABEL_61:
    if (v28[v27 - 1] == 47)
      goto LABEL_45;
    if (*(char *)(v25 + 23) < 0)
    {
      if (!*(_QWORD *)(v25 + 8))
        goto LABEL_45;
      v29 = *(const std::string::value_type **)v25;
    }
    else
    {
      v29 = (const std::string::value_type *)v25;
      if (!*(_BYTE *)(v25 + 23))
        goto LABEL_45;
    }
    if (*v29 != 47)
      std::string::push_back((std::string *)v19, 47);
LABEL_45:
    v21 = *(char *)(v25 + 23);
    if (v21 >= 0)
      v22 = (const std::string::value_type *)v25;
    else
      v22 = *(const std::string::value_type **)v25;
    if (v21 >= 0)
      v23 = *(unsigned __int8 *)(v25 + 23);
    else
      v23 = *(_QWORD *)(v25 + 8);
    std::string::append((std::string *)v19, v22, v23);
    if (*(char *)(v25 + 23) < 0)
      operator delete(*(void **)v25);
    MEMORY[0x20BD2D02C](v25, 0x1012C40EC159624);
    v8 += 3;
  }
  while (v8 != v5);
  v20 = *(char *)(v19 + 23);
  if (v20 < 0)
  {
    if (!*(_QWORD *)(v19 + 8))
      goto LABEL_73;
  }
  else
  {
LABEL_70:
    if (!(_BYTE)v20)
    {
LABEL_73:
      v38 = ".";
      sub_20ABFFE94((uint64_t *)&__str, &v38);
      v30 = __str;
      std::string::operator=((std::string *)v19, __str);
      if (SHIBYTE(v30->__r_.__value_.__r.__words[2]) < 0)
        operator delete(v30->__r_.__value_.__l.__data_);
      MEMORY[0x20BD2D02C](v30, 0x1012C40EC159624);
    }
  }
  std::string::operator=((std::string *)*this, (const std::string *)v19);
  if (*(char *)(v19 + 23) < 0)
    operator delete(*(void **)v19);
  MEMORY[0x20BD2D02C](v19, 0x1012C40EC159624);
  v16 = 1;
  if (v6)
    goto LABEL_30;
LABEL_36:
  if (v4)
  {
    for (; v5 != v4; v5 -= 3)
    {
      if (*((char *)v5 - 1) < 0)
        operator delete(*(v5 - 3));
    }
    operator delete(v4);
  }
  return v16;
}

BOOL cva::Path::isDirectory(const char **this)
{
  const char *v1;
  stat v4;

  v1 = *this;
  if (v1[23] < 0)
    v1 = *(const char **)v1;
  return !stat(v1, &v4) && (v4.st_mode & 0xF000) == 0x4000;
}

BOOL cva::Path::isRegularFile(const char **this)
{
  const char *v1;
  stat v4;

  v1 = *this;
  if (v1[23] < 0)
    v1 = *(const char **)v1;
  return !stat(v1, &v4) && (v4.st_mode & 0xF000) == 0x8000;
}

BOOL cva::Path::createDirectory(const char **this, const cva::Path *a2)
{
  const char *v3;
  const char *v4;
  const char *v6;
  stat v8;

  v3 = *this;
  if (v3[23] < 0)
    v3 = *(const char **)v3;
  if (access(v3, 0))
  {
    v4 = *this;
    if ((*this)[23] < 0)
      v4 = *(const char **)v4;
    return mkdir(v4, 0x1FFu) == 0;
  }
  else
  {
    v6 = *this;
    if ((*this)[23] < 0)
      v6 = *(const char **)v6;
    return !stat(v6, &v8) && (v8.st_mode & 0xF000) == 0x4000;
  }
}

BOOL cva::Path::createDirectory(cva::Path *this, const cva::Path *a2)
{
  uint64_t v3;
  int v4;
  BOOL v5;
  int Directory;
  uint64_t v7;
  const char *v8;
  const char *v10;
  stat v12;

  v3 = *(_QWORD *)this;
  v4 = *(char *)(v3 + 23);
  if ((a2 & 1) != 0)
  {
    if (v4 < 0)
      v3 = *(_QWORD *)v3;
    if (!access((const char *)v3, 0))
      goto LABEL_17;
    sub_20AC004E8((uint64_t *)&v12.st_dev, *(_QWORD *)this, 0);
    Directory = cva::Path::createDirectory((cva::Path *)&v12, (const cva::Path *)1, v5);
    v7 = *(_QWORD *)&v12.st_dev;
    if (*(_QWORD *)&v12.st_dev)
    {
      if (*(char *)(*(_QWORD *)&v12.st_dev + 23) < 0)
        operator delete(**(void ***)&v12.st_dev);
      MEMORY[0x20BD2D02C](v7, 0x1012C40EC159624);
    }
    if (!Directory)
      return 0;
    v3 = *(_QWORD *)this;
    v4 = *(char *)(*(_QWORD *)this + 23);
  }
  if (v4 < 0)
    v3 = *(_QWORD *)v3;
  if (!access((const char *)v3, 0))
  {
LABEL_17:
    v10 = *(const char **)this;
    if (*(char *)(*(_QWORD *)this + 23) < 0)
      v10 = *(const char **)v10;
    return !stat(v10, &v12) && (v12.st_mode & 0xF000) == 0x4000;
  }
  v8 = *(const char **)this;
  if (*(char *)(*(_QWORD *)this + 23) < 0)
    v8 = *(const char **)v8;
  return mkdir(v8, 0x1FFu) == 0;
}

uint64_t cva::Path::tempDirectory@<X0>(const char **a1@<X8>)
{
  uint64_t v3;
  char *v4;
  std::string *v5;
  const char *v6;
  uint64_t result;
  uint64_t v8;
  std::string *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  std::string *__str;
  stat v14;

  v3 = operator new();
  *(_QWORD *)(v3 + 8) = 0;
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)v3 = 0;
  *a1 = (const char *)v3;
  v4 = getenv("TMPDIR");
  if (!v4 || !*v4)
  {
    v4 = getenv("TMP");
    if (!v4 || !*v4)
    {
      v4 = getenv("TEMP");
      if (!v4 || !*v4)
      {
        v4 = getenv("TEMPDIR");
        if (!v4 || !*v4)
          v4 = "/tmp";
      }
    }
  }
  *(_QWORD *)&v14.st_dev = v4;
  sub_20ABFFE94((uint64_t *)&__str, (const char **)&v14);
  v5 = __str;
  std::string::operator=((std::string *)v3, __str);
  if (SHIBYTE(v5->__r_.__value_.__r.__words[2]) < 0)
    operator delete(v5->__r_.__value_.__l.__data_);
  MEMORY[0x20BD2D02C](v5, 0x1012C40EC159624);
  v6 = (const char *)v3;
  if (*(char *)(v3 + 23) < 0)
    v6 = *(const char **)v3;
  result = stat(v6, &v14);
  if ((_DWORD)result || (v14.st_mode & 0xF000) != 0x4000)
  {
    *(_QWORD *)&v14.st_dev = "tmp";
    sub_20ABFFE94((uint64_t *)&__str, (const char **)&v14);
    cva::Path::canonical((const std::string::value_type ***)&__str, (uint64_t *)&v14.st_dev);
    v8 = *(_QWORD *)&v14.st_dev;
    std::string::operator=((std::string *)v3, *(const std::string **)&v14.st_dev);
    *(_QWORD *)&v14.st_dev = 0;
    if (*(char *)(v8 + 23) < 0)
      operator delete(*(void **)v8);
    MEMORY[0x20BD2D02C](v8, 0x1012C40EC159624);
    v9 = __str;
    if (__str)
    {
      if (SHIBYTE(__str->__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str->__r_.__value_.__l.__data_);
      MEMORY[0x20BD2D02C](v9, 0x1012C40EC159624);
    }
    v10 = *a1;
    if ((*a1)[23] < 0)
      v10 = *(const char **)v10;
    if (access(v10, 0))
    {
      v11 = *a1;
      if ((*a1)[23] < 0)
        v11 = *(const char **)v11;
      return mkdir(v11, 0x1FFu);
    }
    else
    {
      v12 = *a1;
      if ((*a1)[23] < 0)
        v12 = *(const char **)v12;
      return stat(v12, &v14);
    }
  }
  return result;
}

void cva::Path::randomFilename(uint64_t *a1@<X8>)
{
  std::chrono::steady_clock::time_point v3;
  int rep;
  unint64_t rep_high;
  unsigned int v6;
  _DWORD *v7;
  _DWORD *v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  unsigned int v24;
  int v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  void *__p[2];
  uint64_t v31;

  v3.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  rep = v3.__d_.__rep_;
  rep_high = HIDWORD(v3.__d_.__rep_);
  do
    v6 = __ldaxr((unsigned int *)&unk_2546165E0);
  while (__stlxr(v6 + 1, (unsigned int *)&unk_2546165E0));
  v7 = operator new(8uLL);
  *v7 = rep;
  v7[1] = rep_high;
  v8 = operator new(0x10uLL);
  v8[2] = v6;
  *(_QWORD *)v8 = *(_QWORD *)v7;
  operator delete(v7);
  v9 = *v8 - 1500454533;
  v10 = *v8 + 840723718;
  v11 = 1664525 * (v9 ^ v10 ^ 0x83DBDFDA ^ ((v9 ^ v10 ^ 0x83DBDFDA) >> 27));
  v12 = v11 + v10;
  v13 = v8[1] + v11;
  v14 = v13 + 2;
  v15 = v12 ^ (v13 + 2);
  v13 += 1371501271;
  v16 = 1664525 * (v15 ^ v13 ^ ((v15 ^ v13) >> 27));
  v17 = v8[2] + v16 + 3;
  v18 = v17 + v9;
  v19 = 1566083941 * ((v18 + v16 + v13 + v17) ^ ((v18 + v16 + v13 + v17) >> 27));
  v20 = v19 ^ v14;
  v21 = 1566083941 * ((v20 + (v19 ^ v18) + v19) ^ ((v20 + (v19 ^ v18) + v19) >> 27));
  v22 = v21-- ^ v20;
  v23 = v21 ^ v17;
  v24 = 1566083941 * ((v23 + v22 + v21) ^ ((v23 + v22 + v21) >> 27));
  v25 = v24 ^ v23;
  v24 -= 2;
  v26 = v24 ^ v19;
  LOWORD(v25) = -29851 * ((v26 + v25 + v24) ^ ((v26 + v25 + v24) >> 27));
  cva::Sprintf::sprintf((cva::Sprintf *)"%04x-%04x-%04x-%04x", (uint64_t)__p, (unsigned __int16)(v25 ^ v26), (unsigned __int16)((v25 - 3) ^ v21), (unsigned __int16)v24, (unsigned __int16)(v25 - 3));
  v27 = operator new();
  v28 = v27;
  if (SHIBYTE(v31) < 0)
  {
    sub_20AB88C14((_BYTE *)v27, __p[0], (unint64_t)__p[1]);
    v29 = SHIBYTE(v31);
    *a1 = v28;
    if (v29 < 0)
      operator delete(__p[0]);
  }
  else
  {
    *(_OWORD *)v27 = *(_OWORD *)__p;
    *(_QWORD *)(v27 + 16) = v31;
    *a1 = v27;
  }
  operator delete(v8);
}

void cva::Path::tempFilename(const char **a1@<X8>)
{
  std::string *v3;
  std::string::size_type size;
  const char *v5;
  _BYTE *v6;
  uint64_t v7;
  int v8;
  const std::string::value_type *v9;
  std::string::size_type v10;
  uint64_t v11;

  cva::Path::tempDirectory(a1);
  cva::Path::randomFilename(&v11);
  v3 = (std::string *)*a1;
  if ((*a1)[23] < 0)
  {
    size = v3->__r_.__value_.__l.__size_;
    if (!size)
      goto LABEL_14;
    v5 = (const char *)v3->__r_.__value_.__r.__words[0];
  }
  else
  {
    size = *((unsigned __int8 *)*a1 + 23);
    if (!(*a1)[23])
      goto LABEL_14;
    v5 = *a1;
  }
  if (v5[size - 1] != 47)
  {
    v6 = (_BYTE *)v11;
    if (*(char *)(v11 + 23) < 0)
    {
      if (!*(_QWORD *)(v11 + 8))
        goto LABEL_14;
      v6 = *(_BYTE **)v11;
    }
    else if (!*(_BYTE *)(v11 + 23))
    {
      goto LABEL_14;
    }
    if (*v6 != 47)
    {
      std::string::push_back(v3, 47);
      v3 = (std::string *)*a1;
    }
  }
LABEL_14:
  v7 = v11;
  v8 = *(char *)(v11 + 23);
  if (v8 >= 0)
    v9 = (const std::string::value_type *)v11;
  else
    v9 = *(const std::string::value_type **)v11;
  if (v8 >= 0)
    v10 = *(unsigned __int8 *)(v11 + 23);
  else
    v10 = *(_QWORD *)(v11 + 8);
  std::string::append(v3, v9, v10);
  if (*(char *)(v7 + 23) < 0)
    operator delete(*(void **)v7);
  JUMPOUT(0x20BD2D02CLL);
}

std::string *cva::Path::concatenate(std::string **a1, const std::string::value_type *a2)
{
  std::string *v2;
  std::string::size_type v3;
  std::string::size_type v4;

  v2 = *a1;
  v3 = *((_QWORD *)a2 + 1);
  if (a2[23] >= 0)
  {
    v4 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = *(const std::string::value_type **)a2;
    v4 = v3;
  }
  return std::string::append(v2, a2, v4);
}

BOOL cva::Path::remove(const char *a1)
{
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  return unlink(a1) == 0;
}

BOOL cva::Path::rmdir(const char *a1)
{
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  return rmdir(a1) == 0;
}

BOOL cva::Path::copyFile(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  BOOL v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _BOOL8 v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  std::ios_base *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  std::ios_base *v26;
  uint64_t v28;
  _BYTE v29[408];
  uint64_t v30[19];
  stat v31;
  _QWORD v32[21];

  v32[19] = *MEMORY[0x24BDAC8D0];
  v6 = operator new();
  v7 = v6;
  if (*(char *)(a1 + 23) < 0)
  {
    sub_20AB88C14((_BYTE *)v6, *(void **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)v6 = *(_OWORD *)a1;
    *(_QWORD *)(v6 + 16) = *(_QWORD *)(a1 + 16);
  }
  v8 = (const char *)v7;
  if (*(char *)(v7 + 23) < 0)
    v8 = *(const char **)v7;
  if (stat(v8, &v31))
    v9 = 0;
  else
    v9 = (v31.st_mode & 0xF000) == 0x8000;
  v10 = v9;
  if (*(char *)(v7 + 23) < 0)
    operator delete(*(void **)v7);
  MEMORY[0x20BD2D02C](v7, 0x1012C40EC159624);
  if (!v10)
    return 0;
  v11 = operator new();
  v12 = v11;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_20AB88C14((_BYTE *)v11, *(void **)a2, *(_QWORD *)(a2 + 8));
    if ((*(char *)(v12 + 23) & 0x80000000) == 0)
      goto LABEL_17;
LABEL_22:
    v15 = access(*(const char **)v12, 0);
    operator delete(*(void **)v12);
    MEMORY[0x20BD2D02C](v12, 0x1012C40EC159624);
    if (!v15)
    {
      v14 = 0;
      if ((a3 & 1) == 0)
        return v14;
    }
    goto LABEL_24;
  }
  *(_OWORD *)v11 = *(_OWORD *)a2;
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(a2 + 16);
  if (*(char *)(v11 + 23) < 0)
    goto LABEL_22;
LABEL_17:
  v13 = access((const char *)v12, 0);
  MEMORY[0x20BD2D02C](v12, 0x1012C40EC159624);
  if (!v13)
  {
    v14 = 0;
    if (!a3)
      return v14;
  }
LABEL_24:
  v16 = MEMORY[0x24BEDB838];
  v17 = MEMORY[0x24BEDB838] + 64;
  v18 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 8);
  v19 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 16);
  v32[0] = MEMORY[0x24BEDB838] + 64;
  *(_QWORD *)&v31.st_dev = v18;
  *(_QWORD *)((char *)&v31.st_dev + *(_QWORD *)(v18 - 24)) = v19;
  v31.st_ino = 0;
  v20 = (std::ios_base *)((char *)&v31 + *(_QWORD *)(*(_QWORD *)&v31.st_dev - 24));
  std::ios_base::init(v20, &v31.st_uid);
  v20[1].__vftable = 0;
  v20[1].__fmtflags_ = -1;
  *(_QWORD *)&v31.st_dev = v16 + 24;
  v32[0] = v17;
  MEMORY[0x20BD2CD74](&v31.st_uid);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)&v31 + *(_QWORD *)(*(_QWORD *)&v31.st_dev - 24)), *(_DWORD *)((char *)&v31.st_atimespec.tv_sec + *(_QWORD *)(*(_QWORD *)&v31.st_dev - 24)) | 4);
  v21 = MEMORY[0x24BEDB840];
  v22 = MEMORY[0x24BEDB840] + 64;
  v23 = (uint64_t *)MEMORY[0x24BEDB7E8];
  v24 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 8);
  v25 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 16);
  v30[0] = MEMORY[0x24BEDB840] + 64;
  v28 = v24;
  *(_QWORD *)&v29[*(_QWORD *)(v24 - 24) - 8] = v25;
  v26 = (std::ios_base *)&v29[*(_QWORD *)(v28 - 24) - 8];
  std::ios_base::init(v26, v29);
  v26[1].__vftable = 0;
  v26[1].__fmtflags_ = -1;
  v28 = v21 + 24;
  v30[0] = v22;
  MEMORY[0x20BD2CD74](v29);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)&v29[*(_QWORD *)(v28 - 24) - 8], *(_DWORD *)&v29[*(_QWORD *)(v28 - 24) + 24] | 4);
  std::ostream::operator<<();
  v14 = (*(_DWORD *)&v29[*(_QWORD *)(v28 - 24) + 24] & 5) == 0;
  v28 = *v23;
  *(_QWORD *)&v29[*(_QWORD *)(v28 - 24) - 8] = v23[3];
  MEMORY[0x20BD2CD80](v29);
  std::ostream::~ostream();
  MEMORY[0x20BD2D008](v30);
  *(_QWORD *)&v31.st_dev = *MEMORY[0x24BEDB7E0];
  *(_QWORD *)((char *)&v31.st_dev + *(_QWORD *)(*(_QWORD *)&v31.st_dev - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 24);
  MEMORY[0x20BD2CD80](&v31.st_uid);
  std::istream::~istream();
  MEMORY[0x20BD2D008](v32);
  return v14;
}

BOOL cva::Path::rename(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  std::error_code *v7;
  const std::__fs::filesystem::path *v8;
  const std::__fs::filesystem::path *v9;
  int v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  BOOL v15;
  int v16;
  const char *v17;
  stat v19;

  v4 = operator new();
  v5 = v4;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_20AB88C14((_BYTE *)v4, *(void **)a2, *(_QWORD *)(a2 + 8));
    if ((*(char *)(v5 + 23) & 0x80000000) == 0)
      goto LABEL_3;
  }
  else
  {
    *(_OWORD *)v4 = *(_OWORD *)a2;
    *(_QWORD *)(v4 + 16) = *(_QWORD *)(a2 + 16);
    if ((*(char *)(v4 + 23) & 0x80000000) == 0)
    {
LABEL_3:
      v6 = access((const char *)v5, 0);
      goto LABEL_6;
    }
  }
  v6 = access(*(const char **)v5, 0);
  operator delete(*(void **)v5);
LABEL_6:
  MEMORY[0x20BD2D02C](v5, 0x1012C40EC159624);
  if (!v6)
    return 0;
  if (*(char *)(a1 + 23) >= 0)
    v8 = (const std::__fs::filesystem::path *)a1;
  else
    v8 = *(const std::__fs::filesystem::path **)a1;
  if (*(char *)(a2 + 23) >= 0)
    v9 = (const std::__fs::filesystem::path *)a2;
  else
    v9 = *(const std::__fs::filesystem::path **)a2;
  rename(v8, v9, v7);
  v11 = v10 == 0;
  if (*__error() == 18)
  {
    v12 = operator new();
    v13 = v12;
    if (*(char *)(a1 + 23) < 0)
    {
      sub_20AB88C14((_BYTE *)v12, *(void **)a1, *(_QWORD *)(a1 + 8));
    }
    else
    {
      *(_OWORD *)v12 = *(_OWORD *)a1;
      *(_QWORD *)(v12 + 16) = *(_QWORD *)(a1 + 16);
    }
    v14 = (const char *)v13;
    if (*(char *)(v13 + 23) < 0)
      v14 = *(const char **)v13;
    if (stat(v14, &v19))
      v15 = 0;
    else
      v15 = (v19.st_mode & 0xF000) == 0x8000;
    v16 = v15;
    if (*(char *)(v13 + 23) < 0)
      operator delete(*(void **)v13);
    MEMORY[0x20BD2D02C](v13, 0x1012C40EC159624);
    if (v16)
    {
      v11 = 0;
      if (cva::Path::copyFile(a1, a2, 0))
      {
        if (*(char *)(a1 + 23) >= 0)
          v17 = (const char *)a1;
        else
          v17 = *(const char **)a1;
        return unlink(v17) == 0;
      }
    }
  }
  return v11;
}

BOOL cva::Path::resize(const char *a1, off_t a2)
{
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  return truncate(a1, a2) == 0;
}

uint64_t cva::plistParseScalar<unsigned char>(CFTypeRef *a1, _BYTE *a2)
{
  CFTypeID v4;
  unint64_t v5;

  v4 = CFGetTypeID(*a1);
  if (v4 != CFNumberGetTypeID())
    return 0;
  v5 = objc_msgSend((id)*a1, "unsignedIntegerValue");
  if (v5 > 0xFF)
    return 0;
  *a2 = v5;
  return 1;
}

uint64_t cva::plistParseScalar<unsigned short>(CFTypeRef *a1, _WORD *a2)
{
  CFTypeID v4;
  unint64_t v5;

  v4 = CFGetTypeID(*a1);
  if (v4 != CFNumberGetTypeID())
    return 0;
  v5 = objc_msgSend((id)*a1, "unsignedIntegerValue");
  if (v5 >> 16)
    return 0;
  *a2 = v5;
  return 1;
}

uint64_t cva::plistParseScalar<unsigned int>(CFTypeRef *a1, _DWORD *a2)
{
  CFTypeID v4;
  unint64_t v5;

  v4 = CFGetTypeID(*a1);
  if (v4 != CFNumberGetTypeID())
    return 0;
  v5 = objc_msgSend((id)*a1, "unsignedIntegerValue");
  if (HIDWORD(v5))
    return 0;
  *a2 = v5;
  return 1;
}

BOOL cva::plistParseScalar<unsigned long long>(CFTypeRef *a1, _QWORD *a2)
{
  CFTypeID v4;
  CFTypeID TypeID;

  v4 = CFGetTypeID(*a1);
  TypeID = CFNumberGetTypeID();
  if (v4 == TypeID)
    *a2 = objc_msgSend((id)*a1, "unsignedIntegerValue");
  return v4 == TypeID;
}

uint64_t cva::plistParseScalar<signed char>(CFTypeRef *a1, _BYTE *a2)
{
  CFTypeID v4;
  uint64_t v5;

  v4 = CFGetTypeID(*a1);
  if (v4 != CFNumberGetTypeID())
    return 0;
  v5 = objc_msgSend((id)*a1, "integerValue");
  if (v5 != (char)v5)
    return 0;
  *a2 = v5;
  return 1;
}

uint64_t cva::plistParseScalar<short>(CFTypeRef *a1, _WORD *a2)
{
  CFTypeID v4;
  uint64_t v5;

  v4 = CFGetTypeID(*a1);
  if (v4 != CFNumberGetTypeID())
    return 0;
  v5 = objc_msgSend((id)*a1, "integerValue");
  if (v5 != (__int16)v5)
    return 0;
  *a2 = v5;
  return 1;
}

uint64_t cva::plistParseScalar<int>(CFTypeRef *a1, _DWORD *a2)
{
  CFTypeID v4;
  uint64_t v5;

  v4 = CFGetTypeID(*a1);
  if (v4 != CFNumberGetTypeID())
    return 0;
  v5 = objc_msgSend((id)*a1, "integerValue");
  if (v5 != (int)v5)
    return 0;
  *a2 = v5;
  return 1;
}

BOOL cva::plistParseScalar<long long>(CFTypeRef *a1, _QWORD *a2)
{
  CFTypeID v4;
  CFTypeID TypeID;

  v4 = CFGetTypeID(*a1);
  TypeID = CFNumberGetTypeID();
  if (v4 == TypeID)
    *a2 = objc_msgSend((id)*a1, "integerValue");
  return v4 == TypeID;
}

BOOL cva::plistParseScalar<BOOL>(CFTypeRef *a1, _BYTE *a2)
{
  CFTypeID v4;
  CFTypeID TypeID;

  v4 = CFGetTypeID(*a1);
  TypeID = CFBooleanGetTypeID();
  if (v4 == TypeID)
    *a2 = objc_msgSend((id)*a1, "BOOLValue");
  return v4 == TypeID;
}

BOOL cva::plistParseScalar<float>(CFTypeRef *a1, _DWORD *a2)
{
  CFTypeID v4;
  CFTypeID TypeID;
  int v6;

  v4 = CFGetTypeID(*a1);
  TypeID = CFNumberGetTypeID();
  if (v4 == TypeID)
  {
    objc_msgSend((id)*a1, "floatValue");
    *a2 = v6;
  }
  return v4 == TypeID;
}

BOOL cva::plistParseScalar<double>(CFTypeRef *a1, _QWORD *a2)
{
  CFTypeID v4;
  CFTypeID TypeID;
  uint64_t v6;

  v4 = CFGetTypeID(*a1);
  TypeID = CFNumberGetTypeID();
  if (v4 == TypeID)
  {
    objc_msgSend((id)*a1, "doubleValue");
    *a2 = v6;
  }
  return v4 == TypeID;
}

BOOL cva::plistParseScalar<std::string>(CFTypeRef *a1, uint64_t a2)
{
  CFTypeID v4;
  CFTypeID TypeID;
  id v6;

  v4 = CFGetTypeID(*a1);
  TypeID = CFStringGetTypeID();
  if (v4 == TypeID)
  {
    v6 = objc_retainAutorelease((id)(id)*a1);
    MEMORY[0x20BD2CD14](a2, objc_msgSend(v6, "UTF8String"));

  }
  return v4 == TypeID;
}

void sub_20AC02C48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

CFPropertyListRef cva::createPlistLoadFile(cva *this, const char *a2)
{
  const __CFAllocator *v2;
  const __CFString *v3;
  const __CFURL *v4;
  __CFReadStream *v5;
  CFPropertyListRef v6;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)this, 0);
  v4 = CFURLCreateWithFileSystemPath(v2, v3, kCFURLPOSIXPathStyle, 0);
  v5 = CFReadStreamCreateWithFile(v2, v4);
  CFReadStreamOpen(v5);
  v6 = CFPropertyListCreateWithStream(v2, v5, 0, 1uLL, 0, 0);
  CFReadStreamClose(v5);
  CFRelease(v5);
  CFRelease(v4);
  CFRelease(v3);
  return v6;
}

uint64_t cva::plistSaveFile(cva *this, const void *a2, const char *a3)
{
  void *v4;
  CFDataRef Data;
  CFDataRef v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a2, objc_msgSend(MEMORY[0x24BDD17C8], "defaultCStringEncoding", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x24BDBD240], this, kCFPropertyListXMLFormat_v1_0, 0, 0);
  v6 = Data;
  if (Data)
  {
    v7 = -[__CFData writeToFile:atomically:](Data, "writeToFile:atomically:", v4, 1);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_20AC02DAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL cva::plistGetDictElement(CFTypeRef *this, const void *const *a2, const void **a3, const void **a4)
{
  CFTypeID v7;
  CFStringRef v8;
  _BOOL8 v9;

  v7 = CFGetTypeID(*this);
  if (v7 != CFDictionaryGetTypeID())
    return 0;
  v8 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)a2, 0);
  v9 = CFDictionaryGetValueIfPresent((CFDictionaryRef)*this, v8, a3) != 0;
  CFRelease(v8);
  return v9;
}

BOOL cva::plistGetDataElement(CFTypeRef *this, const void **a2, unsigned __int8 *a3)
{
  int v3;
  CFTypeID v6;
  id v7;
  size_t v8;
  BOOL v9;
  _BOOL8 v10;

  v3 = (int)a3;
  v6 = CFGetTypeID(*this);
  if (v6 != CFDataGetTypeID())
    return 0;
  v7 = (id)*this;
  v8 = objc_msgSend(v7, "length");
  v9 = v8 == v3;
  v10 = v9;
  if (v9)
    memcpy(a2, (const void *)objc_msgSend(objc_retainAutorelease(v7), "bytes"), v8);

  return v10;
}

void sub_20AC02EDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void cva::plistPrintDict(CFDictionaryRef *this, const __CFDictionary *const *a2)
{
  CFIndex Count;
  const void **v4;
  const void **v5;
  const void **v6;
  const void **v7;
  const void *v8;
  const void *v9;

  Count = CFDictionaryGetCount(*this);
  v4 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
  v5 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
  CFDictionaryGetKeysAndValues(*this, v4, v5);
  if (Count)
  {
    v6 = v4;
    v7 = v5;
    do
    {
      v8 = *v6++;
      CFShow(v8);
      v9 = *v7++;
      CFShow(v9);
      --Count;
    }
    while (Count);
  }
  free(v4);
  free(v5);
}

uint64_t cva::adp::PListPath::PListPath(uint64_t this)
{
  *(_BYTE *)(this + 23) = 1;
  *(_WORD *)this = 47;
  return this;
}

{
  *(_BYTE *)(this + 23) = 1;
  *(_WORD *)this = 47;
  return this;
}

uint64_t cva::adp::PListPath::PListPath(uint64_t a1, _QWORD *a2)
{
  cva::adp::PListPath::convertToPath(a2, a1);
  return a1;
}

{
  cva::adp::PListPath::convertToPath(a2, a1);
  return a1;
}

void cva::adp::PListPath::convertToPath(_QWORD *a1@<X1>, uint64_t a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  size_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  const void *v11;

  v3 = (_QWORD *)a2;
  v4 = *((unsigned __int8 *)a1 + 23);
  if (*((char *)a1 + 23) < 0)
  {
    v5 = a1[1];
    if (v5)
    {
      v6 = (void *)*a1;
      if (*(_BYTE *)(*a1 + v5 - 1) == 47)
      {
        sub_20AB88C14((_BYTE *)a2, v6, a1[1]);
        return;
      }
      goto LABEL_9;
    }
LABEL_8:
    *(_BYTE *)(a2 + 23) = 1;
    *(_WORD *)a2 = 47;
    return;
  }
  if (!*((_BYTE *)a1 + 23))
    goto LABEL_8;
  v5 = *((unsigned __int8 *)a1 + 23);
  if (*((_BYTE *)a1 + v4 - 1) == 47)
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_QWORD *)(a2 + 16) = a1[2];
    return;
  }
LABEL_9:
  v7 = v5 + 1;
  if (v5 + 1 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  if (v7 > 0x16)
  {
    v8 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v8 = v7 | 7;
    v9 = v8 + 1;
    v10 = operator new(v8 + 1);
    v3[1] = v7;
    v3[2] = v9 | 0x8000000000000000;
    *v3 = v10;
    v3 = v10;
  }
  else
  {
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    *(_QWORD *)a2 = 0;
    *(_BYTE *)(a2 + 23) = v7;
  }
  if ((v4 & 0x80u) == 0)
    v11 = a1;
  else
    v11 = (const void *)*a1;
  memmove(v3, v11, v5);
  *(_WORD *)((char *)v3 + v5) = 47;
}

std::string *cva::adp::PListPath::operator+@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  int v5;
  const std::string::value_type *v6;
  std::string::size_type v7;

  if (*(char *)(a1 + 23) < 0)
  {
    sub_20AB88C14(a3, *(void **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    a3->__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 16);
  }
  v5 = *(char *)(a2 + 23);
  if (v5 >= 0)
    v6 = (const std::string::value_type *)a2;
  else
    v6 = *(const std::string::value_type **)a2;
  if (v5 >= 0)
    v7 = *(unsigned __int8 *)(a2 + 23);
  else
    v7 = *(_QWORD *)(a2 + 8);
  return std::string::append(a3, v6, v7);
}

void cva::adp::PListPath::operator+(uint64_t a1@<X0>, _QWORD *a2@<X1>, std::string *a3@<X8>)
{
  void **v5;
  std::string::size_type v6;
  void *__p[2];
  unsigned __int8 v8;

  if (*(char *)(a1 + 23) < 0)
  {
    sub_20AB88C14(a3, *(void **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
    a3->__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 16);
  }
  cva::adp::PListPath::convertToPath(a2, (uint64_t)__p);
  if ((v8 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v8 & 0x80u) == 0)
    v6 = v8;
  else
    v6 = (std::string::size_type)__p[1];
  std::string::append(a3, (const std::string::value_type *)v5, v6);
  if ((char)v8 < 0)
    operator delete(__p[0]);
}

void cva::PrintError::print(cva::PrintError *this@<X0>, uint64_t a2@<X8>)
{
  char __strerrbuf[1024];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  strerror_r((int)this, __strerrbuf, 0x400uLL);
  cva::Sprintf::sprintf((cva::Sprintf *)"%s (%d)", a2, __strerrbuf, this);
}

void cva::FileTarget::~FileTarget(cva::FileTarget *this)
{
  FILE *v2;

  v2 = (FILE *)*((_QWORD *)this + 10);
  if (v2)
  {
    fflush(v2);
    fclose(*((FILE **)this + 10));
  }
  *(_QWORD *)this = off_24C37FF10;
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

{
  FILE *v2;

  v2 = (FILE *)*((_QWORD *)this + 10);
  if (v2)
  {
    fflush(v2);
    fclose(*((FILE **)this + 10));
  }
  *(_QWORD *)this = off_24C37FF10;
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
  JUMPOUT(0x20BD2D02CLL);
}

{
  FILE *v2;

  v2 = (FILE *)*((_QWORD *)this + 10);
  if (v2)
  {
    fflush(v2);
    fclose(*((FILE **)this + 10));
  }
  *(_QWORD *)this = off_24C37FF10;
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

FILE *cva::FileTarget::logImpl(uint64_t a1, int a2, const char *a3, va_list a4)
{
  FILE *result;

  result = *(FILE **)(a1 + 80);
  if (result)
  {
    fprintf(result, "< %-8s > ", (&off_24C380778)[a2]);
    vfprintf(*(FILE **)(a1 + 80), a3, a4);
    result = (FILE *)fputc(10, *(FILE **)(a1 + 80));
    if (*(_BYTE *)(a1 + 88))
      return (FILE *)fflush(*(FILE **)(a1 + 80));
  }
  return result;
}

uint64_t sub_20AC03408(uint64_t a1)
{
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  *(_QWORD *)a1 = off_24C37FF10;
  std::mutex::~mutex((std::mutex *)(a1 + 8));
  return a1;
}

void sub_20AC0344C(uint64_t a1)
{
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  *(_QWORD *)a1 = off_24C37FF10;
  std::mutex::~mutex((std::mutex *)(a1 + 8));
  JUMPOUT(0x20BD2D02CLL);
}

uint64_t cva::ConsoleTarget::logImpl(uint64_t a1, int a2, const char *a3, va_list a4)
{
  FILE *v7;
  const char *v8;

  v7 = *(FILE **)(a1 + 80);
  v8 = (const char *)(a1 + 88);
  if (*(char *)(a1 + 111) < 0)
    v8 = *(const char **)v8;
  fprintf(v7, "[%s] < %-8s > ", v8, (&off_24C380778)[a2]);
  vfprintf(*(FILE **)(a1 + 80), a3, a4);
  return fputc(10, *(FILE **)(a1 + 80));
}

uint64_t sub_20AC0351C(uint64_t a1)
{
  *(_QWORD *)a1 = off_24C37FF10;
  std::mutex::~mutex((std::mutex *)(a1 + 8));
  return a1;
}

void sub_20AC0354C(uint64_t a1)
{
  *(_QWORD *)a1 = off_24C37FF10;
  std::mutex::~mutex((std::mutex *)(a1 + 8));
  JUMPOUT(0x20BD2D02CLL);
}

void cva::OsLogTarget::logImpl(uint64_t a1, unsigned int a2, const char *a3, va_list a4)
{
  int v7;
  int v8;
  char *v9;
  char *v10;
  size_t v11;
  NSObject *v12;
  unint64_t v13;
  os_log_type_t v14;
  char *v15;
  uint8_t buf[4];
  char *v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = vsnprintf(0, 0, a3, a4);
  v8 = v7 + 1;
  if (v7 == -1)
  {
    v9 = 0;
    v10 = 0;
  }
  else
  {
    if (v7 <= -2)
      abort();
    v11 = v8;
    v9 = (char *)operator new(v8);
    v10 = &v9[v11];
    bzero(v9, v11);
  }
  vsnprintf(v9, v10 - v9, a3, a4);
  v12 = *(NSObject **)(a1 + 80);
  v13 = 0x1110000102uLL >> (8 * a2);
  if (a2 >= 6)
    LOBYTE(v13) = 2;
  v14 = v13;
  if (os_log_type_enabled(v12, (os_log_type_t)v13))
  {
    v15 = (&off_24C380778)[a2];
    *(_DWORD *)buf = 136315394;
    v18 = v15;
    v19 = 2080;
    v20 = v9;
    _os_log_impl(&dword_20AB80000, v12, v14, "< %-8s > %s", buf, 0x16u);
  }
  if (v9)
    operator delete(v9);
}

char *cva::toString(int a1)
{
  return (&off_24C380778)[a1];
}

void cva::Logger::Target::~Target(cva::Logger::Target *this)
{
  *(_QWORD *)this = off_24C37FF10;
  std::mutex::~mutex((std::mutex *)((char *)this + 8));
}

uint64_t ***cva::Logger::instance(cva::Logger *this)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)&qword_2546165F0);
  if ((v1 & 1) == 0 && __cxa_guard_acquire(&qword_2546165F0))
  {
    cva::Logger::Logger(&qword_2546165E8);
    __cxa_atexit((void (*)(void *))sub_20AC03908, &qword_2546165E8, &dword_20AB80000);
    __cxa_guard_release(&qword_2546165F0);
  }
  return &qword_2546165E8;
}

cva::Logger *cva::Logger::Logger(uint64_t ***this)
{
  uint64_t v2;
  const char *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  const char *v6;
  uint64_t **v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  __int128 v14;

  v2 = operator new();
  *(_OWORD *)v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_QWORD *)v2 = v2 + 8;
  *(_QWORD *)(v2 + 24) = 850045863;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_QWORD *)(v2 + 80) = 0;
  *this = (uint64_t **)v2;
  v3 = (const char *)cva::Logger::kDefaultCategory;
  v4 = (std::__shared_weak_count *)operator new(0x70uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__shared_weak_owners_ = 0;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&off_24C3803F0;
  v4[1].__shared_owners_ = 850045863;
  *(_OWORD *)&v4[1].__shared_weak_owners_ = 0u;
  *(_OWORD *)&v4[2].__shared_owners_ = 0u;
  v4[3].std::__shared_count = 0u;
  *(_OWORD *)((char *)&v4[3].__shared_owners_ + 1) = 0u;
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)&off_24C37F500;
  v4[4].__shared_owners_ = (uint64_t)os_log_create("com.apple", v3);
  v6 = (const char *)cva::Logger::kDefaultCategory;
  v7 = *this;
  *(_QWORD *)&v14 = v4 + 1;
  *((_QWORD *)&v14 + 1) = v4;
  do
    v8 = __ldxr(p_shared_owners);
  while (__stxr(v8 + 1, p_shared_owners));
  cva::Logger::Private::setTarget(v7, &v14, v6);
  v9 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
  if (*((_QWORD *)&v14 + 1))
  {
    v10 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
  return (cva::Logger *)this;
}

uint64_t *sub_20AC03908(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    std::mutex::~mutex((std::mutex *)(v2 + 24));
    sub_20AC0395C(*(_QWORD *)(v2 + 8));
    MEMORY[0x20BD2D02C](v2, 0x1020C40791C62A7);
  }
  return a1;
}

void sub_20AC0395C(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  if (a1)
  {
    sub_20AC0395C(*(_QWORD *)a1);
    sub_20AC0395C(*(_QWORD *)(a1 + 8));
    v2 = *(std::__shared_weak_count **)(a1 + 64);
    if (!v2)
      goto LABEL_6;
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
      if ((*(char *)(a1 + 55) & 0x80000000) == 0)
        goto LABEL_8;
    }
    else
    {
LABEL_6:
      if ((*(char *)(a1 + 55) & 0x80000000) == 0)
      {
LABEL_8:
        operator delete((void *)a1);
        return;
      }
    }
    operator delete(*(void **)(a1 + 32));
    goto LABEL_8;
  }
}

void cva::Logger::Private::setTarget(uint64_t **a1, __int128 *a2, const char *a3)
{
  std::mutex *v6;
  size_t v7;
  size_t v8;
  __int128 *p_dst;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t **v13;
  size_t v14;
  __int128 *v15;
  char *v16;
  _QWORD *v17;
  const void *v18;
  const void *v19;
  int v20;
  size_t v21;
  const void *v22;
  size_t v23;
  int v24;
  _BOOL4 v25;
  int v26;
  _BOOL4 v27;
  char *v28;
  int64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  __int128 v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  __int128 __dst;
  int64_t v37;

  v6 = (std::mutex *)(a1 + 3);
  std::mutex::lock((std::mutex *)(a1 + 3));
  v7 = strlen(a3);
  if (v7 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v8 = v7;
  if (v7 >= 0x17)
  {
    v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v10 = v7 | 7;
    v11 = v10 + 1;
    p_dst = (__int128 *)operator new(v10 + 1);
    *((_QWORD *)&__dst + 1) = v8;
    v37 = v11 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v37) = v7;
  p_dst = &__dst;
  if (v7)
LABEL_8:
    memcpy(p_dst, a3, v8);
  *((_BYTE *)p_dst + v8) = 0;
  v13 = a1 + 1;
  v12 = a1[1];
  if (v12)
  {
    if (v37 >= 0)
      v14 = HIBYTE(v37);
    else
      v14 = *((_QWORD *)&__dst + 1);
    if (v37 >= 0)
      v15 = &__dst;
    else
      v15 = (__int128 *)__dst;
    while (1)
    {
      while (1)
      {
        v16 = (char *)v12;
        v19 = (const void *)v12[4];
        v17 = v12 + 4;
        v18 = v19;
        v20 = *((char *)v17 + 23);
        if (v20 >= 0)
          v21 = *((unsigned __int8 *)v17 + 23);
        else
          v21 = v17[1];
        if (v20 >= 0)
          v22 = v17;
        else
          v22 = v18;
        if (v21 >= v14)
          v23 = v14;
        else
          v23 = v21;
        v24 = memcmp(v15, v22, v23);
        v25 = v14 < v21;
        if (v24)
          v25 = v24 < 0;
        if (!v25)
          break;
        v12 = *(uint64_t **)v16;
        v13 = (uint64_t **)v16;
        if (!*(_QWORD *)v16)
          goto LABEL_35;
      }
      v26 = memcmp(v22, v15, v23);
      v27 = v21 < v14;
      if (v26)
        v27 = v26 < 0;
      if (!v27)
        break;
      v12 = (uint64_t *)*((_QWORD *)v16 + 1);
      if (!v12)
      {
        v13 = (uint64_t **)(v16 + 8);
        goto LABEL_35;
      }
    }
  }
  else
  {
    v16 = (char *)(a1 + 1);
LABEL_35:
    v28 = v16;
    v16 = (char *)operator new(0x48uLL);
    *((_OWORD *)v16 + 2) = __dst;
    v29 = v37;
    __dst = 0uLL;
    v37 = 0;
    *((_QWORD *)v16 + 7) = 0;
    *((_QWORD *)v16 + 8) = 0;
    *((_QWORD *)v16 + 6) = v29;
    *(_QWORD *)v16 = 0;
    *((_QWORD *)v16 + 1) = 0;
    *((_QWORD *)v16 + 2) = v28;
    *v13 = (uint64_t *)v16;
    v30 = (uint64_t *)**a1;
    v31 = (uint64_t *)v16;
    if (v30)
    {
      *a1 = v30;
      v31 = *v13;
    }
    sub_20AB96C04(a1[1], v31);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  v32 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v33 = (std::__shared_weak_count *)*((_QWORD *)v16 + 8);
  *(_OWORD *)(v16 + 56) = v32;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v35 = __ldaxr(p_shared_owners);
    while (__stlxr(v35 - 1, p_shared_owners));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
      if ((SHIBYTE(v37) & 0x80000000) == 0)
        goto LABEL_44;
      goto LABEL_43;
    }
  }
  if (SHIBYTE(v37) < 0)
LABEL_43:
    operator delete((void *)__dst);
LABEL_44:
  std::mutex::unlock(v6);
}

void sub_20AC03C4C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C3803F0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_20AC03C5C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C3803F0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD2D02CLL);
}

void sub_20AC03C8C(uint64_t a1)
{
  *(_QWORD *)(a1 + 24) = off_24C37FF10;
  std::mutex::~mutex((std::mutex *)(a1 + 32));
}

void cva::Logger::setTarget(uint64_t ***a1, _QWORD *a2, const char *a3)
{
  uint64_t **v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  __int128 v10;

  v3 = *a1;
  v4 = a2[1];
  *(_QWORD *)&v10 = *a2;
  *((_QWORD *)&v10 + 1) = v4;
  if (v4)
  {
    v5 = (unint64_t *)(v4 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  cva::Logger::Private::setTarget(v3, &v10, a3);
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
}

os_log_t cva::Logger::makeOsLogTarget@<X0>(cva::Logger *this@<X0>, const char *a2@<X1>, _QWORD *a3@<X8>)
{
  char *v7;
  os_log_t result;

  v7 = (char *)operator new(0x70uLL);
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = 0;
  *(_QWORD *)v7 = &off_24C3803F0;
  *((_QWORD *)v7 + 4) = 850045863;
  *(_OWORD *)(v7 + 40) = 0u;
  *(_OWORD *)(v7 + 56) = 0u;
  *(_OWORD *)(v7 + 72) = 0u;
  *(_OWORD *)(v7 + 81) = 0u;
  *((_QWORD *)v7 + 3) = &off_24C37F500;
  result = os_log_create(a2, (const char *)this);
  *((_QWORD *)v7 + 13) = result;
  *a3 = v7 + 24;
  a3[1] = v7;
  return result;
}

void cva::Logger::Private::getTarget(cva::Logger::Private *this@<X0>, const char *a2@<X1>, _QWORD *a3@<X8>)
{
  std::mutex *v6;
  size_t v7;
  size_t v8;
  void ***p_dst;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;
  size_t v16;
  void **v17;
  char *v18;
  int v19;
  size_t v20;
  const void *v21;
  size_t v22;
  int v23;
  _BOOL4 v24;
  BOOL v25;
  char **v26;
  int v27;
  size_t v28;
  const void *v29;
  size_t v30;
  int v31;
  _BOOL4 v32;
  uint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  void **__dst;
  size_t v37;
  int64_t v38;

  v6 = (std::mutex *)((char *)this + 24);
  std::mutex::lock((std::mutex *)((char *)this + 24));
  v7 = strlen(a2);
  if (v7 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v8 = v7;
  if (v7 >= 0x17)
  {
    v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v10 = v7 | 7;
    v11 = v10 + 1;
    p_dst = (void ***)operator new(v10 + 1);
    v37 = v8;
    v38 = v11 | 0x8000000000000000;
    __dst = (void **)p_dst;
  }
  else
  {
    HIBYTE(v38) = v7;
    p_dst = &__dst;
    if (!v7)
      goto LABEL_9;
  }
  memcpy(p_dst, a2, v8);
LABEL_9:
  *((_BYTE *)p_dst + v8) = 0;
  v14 = (char *)*((_QWORD *)this + 1);
  v12 = (char *)this + 8;
  v13 = v14;
  v15 = HIBYTE(v38);
  if (!v14)
    goto LABEL_54;
  v16 = v38 >= 0 ? HIBYTE(v38) : v37;
  v17 = v38 >= 0 ? (void **)&__dst : __dst;
  v18 = v12;
  do
  {
    v19 = v13[55];
    if (v19 >= 0)
      v20 = v13[55];
    else
      v20 = *((_QWORD *)v13 + 5);
    if (v19 >= 0)
      v21 = v13 + 32;
    else
      v21 = (const void *)*((_QWORD *)v13 + 4);
    if (v16 >= v20)
      v22 = v20;
    else
      v22 = v16;
    v23 = memcmp(v21, v17, v22);
    v24 = v20 < v16;
    if (v23)
      v24 = v23 < 0;
    v25 = !v24;
    if (v24)
      v26 = (char **)(v13 + 8);
    else
      v26 = (char **)v13;
    if (v25)
      v18 = v13;
    v13 = *v26;
  }
  while (*v26);
  if (v18 == v12)
    goto LABEL_54;
  v27 = v18[55];
  if (v27 >= 0)
    v28 = v18[55];
  else
    v28 = *((_QWORD *)v18 + 5);
  if (v27 >= 0)
    v29 = v18 + 32;
  else
    v29 = (const void *)*((_QWORD *)v18 + 4);
  if (v28 >= v16)
    v30 = v16;
  else
    v30 = v28;
  v31 = memcmp(v17, v29, v30);
  v32 = v16 < v28;
  if (v31)
    v32 = v31 < 0;
  if (v32)
  {
LABEL_54:
    v18 = v12;
    if ((v15 & 0x80) == 0)
    {
LABEL_49:
      if (v18 != v12)
        goto LABEL_50;
LABEL_56:
      *a3 = 0;
      a3[1] = 0;
      goto LABEL_57;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_49;
  }
  operator delete(__dst);
  if (v18 == v12)
    goto LABEL_56;
LABEL_50:
  v33 = *((_QWORD *)v18 + 8);
  *a3 = *((_QWORD *)v18 + 7);
  a3[1] = v33;
  if (v33)
  {
    v34 = (unint64_t *)(v33 + 8);
    do
      v35 = __ldxr(v34);
    while (__stxr(v35 + 1, v34));
  }
LABEL_57:
  std::mutex::unlock(v6);
}

void cva::Logger::logInCategory(cva::Logger::Private **a1, uint64_t a2, char *a3, uint64_t a4, ...)
{
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  va_list va;

  va_start(va, a4);
  cva::Logger::Private::getTarget(*a1, a3, &v10);
  v6 = v10;
  if (v10 && (_DWORD)a2 != 5 && *(unsigned __int8 *)(v10 + 72) <= a2)
  {
    std::mutex::lock((std::mutex *)(v10 + 8));
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(_QWORD *)v6 + 16))(v6, a2, a4, (uint64_t *)va);
    std::mutex::unlock((std::mutex *)(v6 + 8));
  }
  v7 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

BOOL cva::Logger::setMinimumSeverity(cva::Logger::Private **a1, int a2, char *a3)
{
  _BOOL8 v3;
  char v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;

  if (a2 == 5)
    return 0;
  v4 = a2;
  cva::Logger::Private::getTarget(*a1, a3, &v9);
  v3 = v9 != 0;
  if (v9)
    *(_BYTE *)(v9 + 72) = v4;
  v5 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  return v3;
}

uint64_t cva::Logger::getMinimumSeverity(cva::Logger::Private **this, const char *a2)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  uint64_t v7;
  std::__shared_weak_count *v8;

  cva::Logger::Private::getTarget(*this, a2, &v7);
  if (v7)
  {
    v2 = *(unsigned __int8 *)(v7 + 72);
    v3 = v8;
    if (!v8)
      return v2;
  }
  else
  {
    v2 = 5;
    v3 = v8;
    if (!v8)
      return v2;
  }
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (!v5)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
  return v2;
}

unint64_t cva::Logger::makeConsoleTarget@<X0>(cva::Logger *this@<X0>, const char *a2@<X1>, _QWORD *a3@<X8>)
{
  int v3;
  char *v6;
  _QWORD *v7;
  char *v8;
  _QWORD *v9;
  unint64_t result;
  size_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = (int)a2;
  v6 = (char *)operator new(0x88uLL);
  v7 = v6;
  *((_QWORD *)v6 + 1) = 0;
  *((_QWORD *)v6 + 2) = 0;
  *(_QWORD *)v6 = &off_24C380460;
  *((_QWORD *)v6 + 3) = off_24C37F8A8;
  v8 = v6 + 24;
  *((_QWORD *)v6 + 4) = 850045863;
  *(_OWORD *)(v6 + 40) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  *(_OWORD *)(v6 + 72) = 0u;
  *(_OWORD *)(v6 + 81) = 0u;
  v9 = (_QWORD *)MEMORY[0x24BDAC8D8];
  if (!v3)
    v9 = (_QWORD *)MEMORY[0x24BDAC8E8];
  *((_QWORD *)v6 + 13) = *v9;
  result = strlen((const char *)this);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v11 = result;
  if (result >= 0x17)
  {
    v13 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v13 = result | 7;
    v14 = v13 + 1;
    v12 = operator new(v13 + 1);
    v7[15] = v11;
    v7[16] = v14 | 0x8000000000000000;
    v7[14] = v12;
  }
  else
  {
    v12 = v7 + 14;
    *((_BYTE *)v7 + 135) = result;
    if (!result)
      goto LABEL_11;
  }
  result = (unint64_t)memcpy(v12, this, v11);
LABEL_11:
  *((_BYTE *)v12 + v11) = 0;
  *a3 = v8;
  a3[1] = v7;
  return result;
}

void sub_20AC042D8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C380460;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_20AC042E8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C380460;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD2D02CLL);
}

void sub_20AC04318(uint64_t a1)
{
  if (*(char *)(a1 + 135) < 0)
    operator delete(*(void **)(a1 + 112));
  *(_QWORD *)(a1 + 24) = off_24C37FF10;
  std::mutex::~mutex((std::mutex *)(a1 + 32));
}

cva::FileTarget *cva::FileTarget::FileTarget(cva::FileTarget *this, const char *__filename, int a3, int a4)
{
  char v5;
  const char *v8;
  FILE *v9;
  FILE *v10;
  char *v11;
  time_t v13;

  v5 = a3;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)((char *)this + 57) = 0u;
  *(_QWORD *)this = &off_24C37F3E8;
  *((_QWORD *)this + 1) = 850045863;
  if (a3)
    v8 = "a";
  else
    v8 = "w";
  v9 = fopen(__filename, v8);
  *((_QWORD *)this + 10) = v9;
  *((_BYTE *)this + 88) = a4;
  if (v9)
  {
    if ((v5 & 1) == 0)
    {
      v13 = time(0);
      v10 = (FILE *)*((_QWORD *)this + 10);
      v11 = ctime(&v13);
      fprintf(v10, "-- %s", v11);
      a4 = *((unsigned __int8 *)this + 88);
    }
    if (a4)
      fflush(*((FILE **)this + 10));
  }
  return this;
}

{
  char v5;
  const char *v8;
  FILE *v9;
  FILE *v10;
  char *v11;
  time_t v13;

  v5 = a3;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)((char *)this + 57) = 0u;
  *(_QWORD *)this = &off_24C37F3E8;
  *((_QWORD *)this + 1) = 850045863;
  if (a3)
    v8 = "a";
  else
    v8 = "w";
  v9 = fopen(__filename, v8);
  *((_QWORD *)this + 10) = v9;
  *((_BYTE *)this + 88) = a4;
  if (v9)
  {
    if ((v5 & 1) == 0)
    {
      v13 = time(0);
      v10 = (FILE *)*((_QWORD *)this + 10);
      v11 = ctime(&v13);
      fprintf(v10, "-- %s", v11);
      a4 = *((unsigned __int8 *)this + 88);
    }
    if (a4)
      fflush(*((FILE **)this + 10));
  }
  return this;
}

FILE *cva::Logger::makeFileTarget@<X0>(cva::Logger *this@<X0>, const char *a2@<X1>, int a3@<W2>, _QWORD *a4@<X8>)
{
  int v5;
  char *v8;
  char *v9;
  char *v10;
  const char *v11;
  FILE *result;
  FILE *v13;
  char *v14;
  time_t v15;

  v5 = (int)a2;
  v8 = (char *)operator new(0x78uLL);
  v9 = v8;
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = 0;
  *(_QWORD *)v8 = &off_24C3803B8;
  *((_QWORD *)v8 + 3) = &off_24C37F3E8;
  v10 = v8 + 24;
  *((_QWORD *)v8 + 4) = 850045863;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 56) = 0u;
  *(_OWORD *)(v8 + 72) = 0u;
  if (v5)
    v11 = "a";
  else
    v11 = "w";
  *(_OWORD *)(v8 + 81) = 0uLL;
  result = fopen((const char *)this, v11);
  *((_QWORD *)v9 + 13) = result;
  v9[112] = a3;
  if (result)
  {
    v13 = result;
    if ((v5 & 1) == 0)
    {
      v15 = time(0);
      v14 = ctime(&v15);
      result = (FILE *)fprintf(v13, "-- %s", v14);
    }
    if (a3)
      result = (FILE *)fflush(v13);
  }
  *a4 = v10;
  a4[1] = v9;
  return result;
}

void sub_20AC04630(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24C3803B8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_20AC04640(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24C3803B8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x20BD2D02CLL);
}

void sub_20AC04670(uint64_t a1)
{
  FILE *v2;

  v2 = *(FILE **)(a1 + 104);
  if (v2)
  {
    fflush(v2);
    fclose(*(FILE **)(a1 + 104));
  }
  *(_QWORD *)(a1 + 24) = off_24C37FF10;
  std::mutex::~mutex((std::mutex *)(a1 + 32));
}

uint64_t cva::OsLogTarget::getOsLogType(unsigned int a1)
{
  unint64_t v1;

  v1 = 0x1110000102uLL >> (8 * a1);
  if (a1 >= 6)
    LOBYTE(v1) = 2;
  return v1;
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
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

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
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

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1F0](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x24BDBC218](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x24BDBC438](obj);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC578](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB80]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC20](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x24BDBE168](provider);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE190](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE620](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x24BDBE638](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE668](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

CVReturn CVMetalTextureCacheCreate(CFAllocatorRef allocator, CFDictionaryRef cacheAttributes, id metalDevice, CFDictionaryRef textureAttributes, CVMetalTextureCacheRef *cacheOut)
{
  return MEMORY[0x24BDC51F8](allocator, cacheAttributes, metalDevice, textureAttributes, cacheOut);
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x24BDC5200](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x24BDC5210](image);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

CVReturn CVPixelBufferCreateWithBytes(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, void *baseAddress, size_t bytesPerRow, CVPixelBufferReleaseBytesCallback releaseCallback, void *releaseRefCon, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5250](allocator, width, height, *(_QWORD *)&pixelFormatType, baseAddress, bytesPerRow, releaseCallback, releaseRefCon);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDC5288](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC5298](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D8](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x24BDC5318](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

CFDictionaryRef CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocatorRef allocator, OSType pixelFormat)
{
  return (CFDictionaryRef)MEMORY[0x24BDC53C0](allocator, *(_QWORD *)&pixelFormat);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x24BDC15E0](inTagClass, inTag, inConformingToUTI);
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return MEMORY[0x24BDAC770](buf, bufsize);
}

void _SparseDestroyOpaqueNumeric_Double(SparseOpaqueFactorization_Double *toFree)
{
  MEMORY[0x24BDB29B0](toFree);
}

void _SparseDestroyOpaqueNumeric_Float(SparseOpaqueFactorization_Float *toFree)
{
  MEMORY[0x24BDB29B8](toFree);
}

SparseOpaqueFactorization_Double *__cdecl _SparseFactorQR_Double(SparseOpaqueFactorization_Double *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Double *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Double *)MEMORY[0x24BDB29C0](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseOpaqueFactorization_Float *__cdecl _SparseFactorQR_Float(SparseOpaqueFactorization_Float *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Float *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Float *)MEMORY[0x24BDB29C8](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseOpaqueFactorization_Double *__cdecl _SparseFactorSymmetric_Double(SparseOpaqueFactorization_Double *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Double *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Double *)MEMORY[0x24BDB29D0](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseOpaqueFactorization_Float *__cdecl _SparseFactorSymmetric_Float(SparseOpaqueFactorization_Float *__return_ptr retstr, SparseFactorization_t factorType, const SparseMatrix_Float *Matrix, const SparseSymbolicFactorOptions *sfoptions, const SparseNumericFactorOptions *nfoptions)
{
  return (SparseOpaqueFactorization_Float *)MEMORY[0x24BDB29D8](retstr, factorType, Matrix, sfoptions, nfoptions);
}

SparseNumericFactorOptions *__cdecl _SparseGetOptionsFromNumericFactor_Double(SparseNumericFactorOptions *__return_ptr retstr, SparseOpaqueFactorization_Double *factor)
{
  return (SparseNumericFactorOptions *)MEMORY[0x24BDB29E0](retstr, factor);
}

SparseNumericFactorOptions *__cdecl _SparseGetOptionsFromNumericFactor_Float(SparseNumericFactorOptions *__return_ptr retstr, SparseOpaqueFactorization_Float *factor)
{
  return (SparseNumericFactorOptions *)MEMORY[0x24BDB29E8](retstr, factor);
}

SparseSymbolicFactorOptions *__cdecl _SparseGetOptionsFromSymbolicFactor(SparseSymbolicFactorOptions *__return_ptr retstr, SparseOpaqueSymbolicFactorization *factor)
{
  return (SparseSymbolicFactorOptions *)MEMORY[0x24BDB29F0](retstr, factor);
}

void _SparseGetWorkspaceRequired_Double(SparseSubfactor_t Subfactor, SparseOpaqueFactorization_Double *Factor, size_t *workStatic, size_t *workPerRHS)
{
  MEMORY[0x24BDB29F8](Subfactor, Factor, workStatic, workPerRHS);
}

void _SparseGetWorkspaceRequired_Float(SparseSubfactor_t Subfactor, SparseOpaqueFactorization_Float *Factor, size_t *workStatic, size_t *workPerRHS)
{
  MEMORY[0x24BDB2A00](Subfactor, Factor, workStatic, workPerRHS);
}

void _SparseMultiplySubfactor_Double(const SparseOpaqueSubfactor_Double *Subfactor, const DenseMatrix_Double *x, const DenseMatrix_Double *y, char *workspace)
{
  MEMORY[0x24BDB2A08](Subfactor, x, y, workspace);
}

void _SparseMultiplySubfactor_Float(const SparseOpaqueSubfactor_Float *Subfactor, const DenseMatrix_Float *x, const DenseMatrix_Float *y, char *workspace)
{
  MEMORY[0x24BDB2A10](Subfactor, x, y, workspace);
}

void _SparseRefactorQR_Double(const SparseMatrix_Double *Matrix, SparseOpaqueFactorization_Double *Factorization, const SparseNumericFactorOptions *nfoptions, void *workspace)
{
  MEMORY[0x24BDB2A18](Matrix, Factorization, nfoptions, workspace);
}

void _SparseRefactorQR_Float(const SparseMatrix_Float *Matrix, SparseOpaqueFactorization_Float *Factorization, const SparseNumericFactorOptions *nfoptions, void *workspace)
{
  MEMORY[0x24BDB2A20](Matrix, Factorization, nfoptions, workspace);
}

void _SparseRefactorSymmetric_Double(const SparseMatrix_Double *Matrix, SparseOpaqueFactorization_Double *Factorization, const SparseNumericFactorOptions *nfoptions, void *workspace)
{
  MEMORY[0x24BDB2A28](Matrix, Factorization, nfoptions, workspace);
}

void _SparseRefactorSymmetric_Float(const SparseMatrix_Float *Matrix, SparseOpaqueFactorization_Float *Factorization, const SparseNumericFactorOptions *nfoptions, void *workspace)
{
  MEMORY[0x24BDB2A30](Matrix, Factorization, nfoptions, workspace);
}

void _SparseRetainNumeric_Double(SparseOpaqueFactorization_Double *numericFactor)
{
  MEMORY[0x24BDB2A38](numericFactor);
}

void _SparseRetainNumeric_Float(SparseOpaqueFactorization_Float *numericFactor)
{
  MEMORY[0x24BDB2A40](numericFactor);
}

void _SparseSolveOpaque_Double(const SparseOpaqueFactorization_Double *Factored, const DenseMatrix_Double *RHS, const DenseMatrix_Double *Soln, void *workspace)
{
  MEMORY[0x24BDB2A48](Factored, RHS, Soln, workspace);
}

void _SparseSolveOpaque_Float(const SparseOpaqueFactorization_Float *Factored, const DenseMatrix_Float *RHS, const DenseMatrix_Float *Soln, void *workspace)
{
  MEMORY[0x24BDB2A50](Factored, RHS, Soln, workspace);
}

void _SparseSolveSubfactor_Double(const SparseOpaqueSubfactor_Double *Subfactor, const DenseMatrix_Double *b, const DenseMatrix_Double *x, char *workspace)
{
  MEMORY[0x24BDB2A58](Subfactor, b, x, workspace);
}

void _SparseSolveSubfactor_Float(const SparseOpaqueSubfactor_Float *Subfactor, const DenseMatrix_Float *b, const DenseMatrix_Float *x, char *workspace)
{
  MEMORY[0x24BDB2A60](Subfactor, b, x, workspace);
}

void _SparseSpMV_Double(double alpha, SparseMatrix_Double *A, DenseMatrix_Double *x, BOOL accumulate, DenseMatrix_Double *y)
{
  MEMORY[0x24BDB2A68](A, x, accumulate, y, alpha);
}

void _SparseSpMV_Float(float alpha, SparseMatrix_Float *A, DenseMatrix_Float *x, BOOL accumulate, DenseMatrix_Float *y)
{
  MEMORY[0x24BDB2A70](A, x, accumulate, y, alpha);
}

void _SparseTrap(void)
{
  MEMORY[0x24BDB2A78]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::string::size_type std::string::find_first_of(const std::string *this, const std::string::value_type *__s, std::string::size_type __pos, std::string::size_type __n)
{
  return MEMORY[0x24BEDA990](this, __s, __pos, __n);
}

std::string::size_type std::string::find_first_not_of(const std::string *this, const std::string::value_type *__s, std::string::size_type __pos, std::string::size_type __n)
{
  return MEMORY[0x24BEDA998](this, __s, __pos, __n);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B8](this, __c, __pos);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

{
  return MEMORY[0x24BEDB068]();
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x24BEDAA50](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
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

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDACA0](this, __pos, __n1, __s);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x24BEDACB8](this, __requested_capacity);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAD08](this, __c);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::get()
{
  return MEMORY[0x24BEDAE08]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x24BEDAE10]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x24BEDAE18]();
}

uint64_t std::istream::ignore()
{
  return MEMORY[0x24BEDAE48]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::putback()
{
  return MEMORY[0x24BEDAE60]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAE80]();
}

{
  return MEMORY[0x24BEDAE88]();
}

{
  return MEMORY[0x24BEDAE90]();
}

{
  return MEMORY[0x24BEDAEA8]();
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
  return MEMORY[0x24BEDAF20]();
}

{
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF40]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF70]();
}

uint64_t std::ifstream::open()
{
  return MEMORY[0x24BEDB008]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x24BEDB020]();
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

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x24BEDB1A0](retstr, __s);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x24BEDB1B8](__format);
}

double std::stod(const std::string *__str, size_t *__idx)
{
  double result;

  MEMORY[0x24BEDB320](__str, __idx);
  return result;
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB330](__str, __idx, *(_QWORD *)&__base);
}

const std::ctype_base::mask *std::ctype<char>::classic_table(void)
{
  return (const std::ctype_base::mask *)MEMORY[0x24BEDB348]();
}

std::ctype<char> *__cdecl std::ctype<char>::ctype(std::ctype<char> *this, const std::ctype_base::mask *__tab, BOOL __del, size_t __refs)
{
  return (std::ctype<char> *)MEMORY[0x24BEDB358](this, __tab, __del, __refs);
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

void std::locale::__install_ctor(std::locale *this, const std::locale *a2, std::locale::facet *a3, uint64_t a4)
{
  MEMORY[0x24BEDB418](this, a2, a3, a4);
}

uint64_t std::locale::id::__get(std::locale::id *this)
{
  return MEMORY[0x24BEDB420](this);
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

const std::locale *__cdecl std::locale::operator=(std::locale *this, const std::locale *a2)
{
  return (const std::locale *)MEMORY[0x24BEDB450](this, a2);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

std::locale std::ios_base::imbue(std::ios_base *this, const std::locale *__loc)
{
  return (std::locale)MEMORY[0x24BEDB538](this, __loc);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

void operator delete(void *__p)
{
  off_24C37EB88(__p);
}

uint64_t operator delete()
{
  return off_24C37EB90();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C37EB98(__sz);
}

uint64_t operator new()
{
  return off_24C37EBA0();
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x24BEDB920](lpmangled, lpout, lpoutlen, lpstatus);
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

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
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

int access(const char *a1, int a2)
{
  return MEMORY[0x24BDAD038](a1, *(_QWORD *)&a2);
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

uint64_t appleblas_dgeadd_NEWLAPACK()
{
  return MEMORY[0x24BDB2A80]();
}

uint64_t appleblas_sgeadd_NEWLAPACK()
{
  return MEMORY[0x24BDB2A88]();
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x24BDAD188](__x);
  return result;
}

float asinf(float a1)
{
  float result;

  MEMORY[0x24BDAD190](a1);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAD228](a1, a2);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x24BDAD230](a1);
  return result;
}

double atof(const char *a1)
{
  double result;

  MEMORY[0x24BDAD250](a1);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x24BDAD288](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x24BDAD2A0](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t cblas_dgemm_NEWLAPACK()
{
  return MEMORY[0x24BDB2AD0]();
}

uint64_t cblas_dgemv_NEWLAPACK()
{
  return MEMORY[0x24BDB2AE0]();
}

uint64_t cblas_dger_NEWLAPACK()
{
  return MEMORY[0x24BDB2AF0]();
}

uint64_t cblas_dsyrk_NEWLAPACK()
{
  return MEMORY[0x24BDB2B30]();
}

uint64_t cblas_dtrsm_NEWLAPACK()
{
  return MEMORY[0x24BDB2B50]();
}

uint64_t cblas_dtrsv_NEWLAPACK()
{
  return MEMORY[0x24BDB2B60]();
}

uint64_t cblas_sgemm_NEWLAPACK()
{
  return MEMORY[0x24BDB2BD0]();
}

uint64_t cblas_sgemv_NEWLAPACK()
{
  return MEMORY[0x24BDB2BE8]();
}

uint64_t cblas_sger_NEWLAPACK()
{
  return MEMORY[0x24BDB2C00]();
}

uint64_t cblas_ssyrk_NEWLAPACK()
{
  return MEMORY[0x24BDB2C30]();
}

uint64_t cblas_strsm_NEWLAPACK()
{
  return MEMORY[0x24BDB2C40]();
}

uint64_t cblas_strsv_NEWLAPACK()
{
  return MEMORY[0x24BDB2C50]();
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x24BDADBE8](a1);
  return result;
}

char *__cdecl ctime(const time_t *a1)
{
  return (char *)MEMORY[0x24BDADC18](a1);
}

uint64_t dgbsv_NEWLAPACK()
{
  return MEMORY[0x24BDB2C78]();
}

uint64_t dgbtrf_NEWLAPACK()
{
  return MEMORY[0x24BDB2C80]();
}

uint64_t dgbtrs_NEWLAPACK()
{
  return MEMORY[0x24BDB2C88]();
}

uint64_t dgeev_NEWLAPACK()
{
  return MEMORY[0x24BDB2CB0]();
}

uint64_t dgels_NEWLAPACK()
{
  return MEMORY[0x24BDB2CD0]();
}

uint64_t dgelsd_NEWLAPACK()
{
  return MEMORY[0x24BDB2CD8]();
}

uint64_t dgelss_NEWLAPACK()
{
  return MEMORY[0x24BDB2CE0]();
}

uint64_t dgeqrf_NEWLAPACK()
{
  return MEMORY[0x24BDB2CF0]();
}

uint64_t dgerqf_NEWLAPACK()
{
  return MEMORY[0x24BDB2D00]();
}

uint64_t dgesdd_NEWLAPACK()
{
  return MEMORY[0x24BDB2D08]();
}

uint64_t dgesv_NEWLAPACK()
{
  return MEMORY[0x24BDB2D18]();
}

uint64_t dgesvd_NEWLAPACK()
{
  return MEMORY[0x24BDB2D20]();
}

uint64_t dgetrf_NEWLAPACK()
{
  return MEMORY[0x24BDB2D30]();
}

uint64_t dgetri_NEWLAPACK()
{
  return MEMORY[0x24BDB2D40]();
}

uint64_t dgetrs_NEWLAPACK()
{
  return MEMORY[0x24BDB2D50]();
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x24BDAE058](a1, a2);
}

uint64_t dorgqr_NEWLAPACK()
{
  return MEMORY[0x24BDB2DA8]();
}

uint64_t dormqr_NEWLAPACK()
{
  return MEMORY[0x24BDB2DC0]();
}

uint64_t dposv_NEWLAPACK()
{
  return MEMORY[0x24BDB2DC8]();
}

uint64_t dpotrf_NEWLAPACK()
{
  return MEMORY[0x24BDB2DD0]();
}

uint64_t dpotrs_NEWLAPACK()
{
  return MEMORY[0x24BDB2DE8]();
}

uint64_t dpstrf_NEWLAPACK()
{
  return MEMORY[0x24BDB2E00]();
}

uint64_t dsyev_NEWLAPACK()
{
  return MEMORY[0x24BDB2E20]();
}

uint64_t dsysv_NEWLAPACK()
{
  return MEMORY[0x24BDB2E38]();
}

uint64_t dsytrf_NEWLAPACK()
{
  return MEMORY[0x24BDB2E50]();
}

uint64_t dsytrs_NEWLAPACK()
{
  return MEMORY[0x24BDB2E60]();
}

uint64_t dtrtri_NEWLAPACK()
{
  return MEMORY[0x24BDB2E80]();
}

uint64_t dtrtrs_NEWLAPACK()
{
  return MEMORY[0x24BDB2E88]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x24BDAE5D8](a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x24BDAED80](memptr, alignment, size, type_id);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
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

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x24BDAF908](a1, *(_QWORD *)&a2);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x24BDAFA90](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

int rmdir(const char *a1)
{
  return MEMORY[0x24BDAFBB0](a1);
}

uint64_t sgbsv_NEWLAPACK()
{
  return MEMORY[0x24BDB2F00]();
}

uint64_t sgeev_NEWLAPACK()
{
  return MEMORY[0x24BDB2F28]();
}

uint64_t sgels_NEWLAPACK()
{
  return MEMORY[0x24BDB2F40]();
}

uint64_t sgelsd_NEWLAPACK()
{
  return MEMORY[0x24BDB2F48]();
}

uint64_t sgelss_NEWLAPACK()
{
  return MEMORY[0x24BDB2F50]();
}

uint64_t sgeqrf_NEWLAPACK()
{
  return MEMORY[0x24BDB2F58]();
}

uint64_t sgerqf_NEWLAPACK()
{
  return MEMORY[0x24BDB2F70]();
}

uint64_t sgesdd_NEWLAPACK()
{
  return MEMORY[0x24BDB2F78]();
}

uint64_t sgesv_NEWLAPACK()
{
  return MEMORY[0x24BDB2F88]();
}

uint64_t sgesvd_NEWLAPACK()
{
  return MEMORY[0x24BDB2F98]();
}

uint64_t sgetrf_NEWLAPACK()
{
  return MEMORY[0x24BDB2FB0]();
}

uint64_t sgetri_NEWLAPACK()
{
  return MEMORY[0x24BDB2FC0]();
}

uint64_t sgetrs_NEWLAPACK()
{
  return MEMORY[0x24BDB2FD0]();
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

uint64_t sorgqr_NEWLAPACK()
{
  return MEMORY[0x24BDB3008]();
}

uint64_t sormqr_NEWLAPACK()
{
  return MEMORY[0x24BDB3020]();
}

uint64_t sposv_NEWLAPACK()
{
  return MEMORY[0x24BDB3098]();
}

uint64_t spotrf_NEWLAPACK()
{
  return MEMORY[0x24BDB30A0]();
}

uint64_t spotrs_NEWLAPACK()
{
  return MEMORY[0x24BDB30A8]();
}

uint64_t spstrf_NEWLAPACK()
{
  return MEMORY[0x24BDB30B0]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

uint64_t ssyev_NEWLAPACK()
{
  return MEMORY[0x24BDB30C0]();
}

uint64_t ssysv_NEWLAPACK()
{
  return MEMORY[0x24BDB30D0]();
}

uint64_t ssytrf_NEWLAPACK()
{
  return MEMORY[0x24BDB30D8]();
}

uint64_t ssytrs_NEWLAPACK()
{
  return MEMORY[0x24BDB30E8]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x24BDAFF20](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

uint64_t strtri_NEWLAPACK()
{
  return MEMORY[0x24BDB3100]();
}

uint64_t strtrs_NEWLAPACK()
{
  return MEMORY[0x24BDB3108]();
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x24BDB0138](__x);
  return result;
}

float tanf(float a1)
{
  float result;

  MEMORY[0x24BDB0140](a1);
  return result;
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int truncate(const char *a1, off_t a2)
{
  return MEMORY[0x24BDB0290](a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

vImage_Error vImageConvert_16UToF(const vImage_Buffer *src, const vImage_Buffer *dest, float offset, float scale, vImage_Flags flags)
{
  return MEMORY[0x24BDB3668](src, dest, *(_QWORD *)&flags, offset, scale);
}

vImage_Error vImageConvert_420Yp8_CbCr8ToARGB8888(const vImage_Buffer *srcYp, const vImage_Buffer *srcCbCr, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x24BDB3678](srcYp, srcCbCr, dest, info, permuteMap, alpha, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_422CbYpCrYp8ToARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x24BDB3688](src, dest, info, permuteMap, alpha, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_422YpCbYpCr8ToARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_YpCbCrToARGB *info, const uint8_t permuteMap[4], const uint8_t alpha, vImage_Flags flags)
{
  return MEMORY[0x24BDB3690](src, dest, info, permuteMap, alpha, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGB8888To420Yp8_CbCr8(const vImage_Buffer *src, const vImage_Buffer *destYp, const vImage_Buffer *destCbCr, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x24BDB3698](src, destYp, destCbCr, info, permuteMap, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGB8888To422YpCbYpCr8(const vImage_Buffer *src, const vImage_Buffer *dest, const vImage_ARGBToYpCbCr *info, const uint8_t permuteMap[4], vImage_Flags flags)
{
  return MEMORY[0x24BDB36A8](src, dest, info, permuteMap, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGB8888toPlanar8(const vImage_Buffer *srcARGB, const vImage_Buffer *destA, const vImage_Buffer *destR, const vImage_Buffer *destG, const vImage_Buffer *destB, vImage_Flags flags)
{
  return MEMORY[0x24BDB36B0](srcARGB, destA, destR, destG, destB, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGB8888toPlanarF(const vImage_Buffer *src, const vImage_Buffer *alpha, const vImage_Buffer *red, const vImage_Buffer *green, const vImage_Buffer *blue, const Pixel_FFFF maxFloat, const Pixel_FFFF minFloat, vImage_Flags flags)
{
  return MEMORY[0x24BDB36B8](src, alpha, red, green, blue, maxFloat, minFloat, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ARGB8888toRGB888(const vImage_Buffer *a1, const vImage_Buffer *a2, vImage_Flags a3)
{
  return MEMORY[0x24BDB36C0](a1, a2, *(_QWORD *)&a3);
}

vImage_Error vImageConvert_ARGBToYpCbCr_GenerateConversion(const vImage_ARGBToYpCbCrMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_ARGBToYpCbCr *outInfo, vImageARGBType inARGBType, vImageYpCbCrType outYpCbCrType, vImage_Flags flags)
{
  return MEMORY[0x24BDB36E8](matrix, pixelRange, outInfo, *(_QWORD *)&inARGBType, *(_QWORD *)&outYpCbCrType, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_BGRA8888toRGB888(const vImage_Buffer *a1, const vImage_Buffer *a2, vImage_Flags a3)
{
  return MEMORY[0x24BDB3700](a1, a2, *(_QWORD *)&a3);
}

vImage_Error vImageConvert_ChunkyToPlanar8(const void *srcChannels[], const vImage_Buffer *destPlanarBuffers[], unsigned int channelCount, size_t srcStrideBytes, vImagePixelCount srcWidth, vImagePixelCount srcHeight, size_t srcRowBytes, vImage_Flags flags)
{
  return MEMORY[0x24BDB3708](srcChannels, destPlanarBuffers, *(_QWORD *)&channelCount, srcStrideBytes, srcWidth, srcHeight, srcRowBytes, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_ChunkyToPlanarF(const void *srcChannels[], const vImage_Buffer *destPlanarBuffers[], unsigned int channelCount, size_t srcStrideBytes, vImagePixelCount srcWidth, vImagePixelCount srcHeight, size_t srcRowBytes, vImage_Flags flags)
{
  return MEMORY[0x24BDB3718](srcChannels, destPlanarBuffers, *(_QWORD *)&channelCount, srcStrideBytes, srcWidth, srcHeight, srcRowBytes, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_FTo16U(const vImage_Buffer *src, const vImage_Buffer *dest, float offset, float scale, vImage_Flags flags)
{
  return MEMORY[0x24BDB3720](src, dest, *(_QWORD *)&flags, offset, scale);
}

vImage_Error vImageConvert_Planar16UtoPlanar8_dithered(const vImage_Buffer *src, const vImage_Buffer *dest, int dither, vImage_Flags flags)
{
  return MEMORY[0x24BDB3738](src, dest, *(_QWORD *)&dither, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_Planar8To16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3740](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_Planar8toARGB8888(const vImage_Buffer *srcA, const vImage_Buffer *srcR, const vImage_Buffer *srcG, const vImage_Buffer *srcB, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3788](srcA, srcR, srcG, srcB, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_Planar8toPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x24BDB37A0](src, dest, *(_QWORD *)&flags, maxFloat, minFloat);
}

vImage_Error vImageConvert_Planar8toRGB888(const vImage_Buffer *planarRed, const vImage_Buffer *planarGreen, const vImage_Buffer *planarBlue, const vImage_Buffer *rgbDest, vImage_Flags flags)
{
  return MEMORY[0x24BDB37B0](planarRed, planarGreen, planarBlue, rgbDest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_PlanarFToARGB8888(const vImage_Buffer *alpha, const vImage_Buffer *red, const vImage_Buffer *green, const vImage_Buffer *blue, const vImage_Buffer *dest, const Pixel_FFFF maxFloat, const Pixel_FFFF minFloat, vImage_Flags flags)
{
  return MEMORY[0x24BDB37B8](alpha, red, green, blue, dest, maxFloat, minFloat, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x24BDB3800](src, dest, *(_QWORD *)&flags, maxFloat, minFloat);
}

vImage_Error vImageConvert_RGB888toARGB8888(const vImage_Buffer *a1, const vImage_Buffer *a2, Pixel_8 a3, const vImage_Buffer *a4, BOOL a5, vImage_Flags a6)
{
  return MEMORY[0x24BDB3810](a1, a2, a3, a4, a5, *(_QWORD *)&a6);
}

vImage_Error vImageConvert_RGB888toBGRA8888(const vImage_Buffer *a1, const vImage_Buffer *a2, Pixel_8 a3, const vImage_Buffer *a4, BOOL a5, vImage_Flags a6)
{
  return MEMORY[0x24BDB3818](a1, a2, a3, a4, a5, *(_QWORD *)&a6);
}

vImage_Error vImageConvert_RGB888toPlanar8(const vImage_Buffer *rgbSrc, const vImage_Buffer *redDest, const vImage_Buffer *greenDest, const vImage_Buffer *blueDest, vImage_Flags flags)
{
  return MEMORY[0x24BDB3820](rgbSrc, redDest, greenDest, blueDest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_RGB888toRGBA8888(const vImage_Buffer *a1, const vImage_Buffer *a2, Pixel_8 a3, const vImage_Buffer *a4, BOOL a5, vImage_Flags a6)
{
  return MEMORY[0x24BDB3828](a1, a2, a3, a4, a5, *(_QWORD *)&a6);
}

vImage_Error vImageConvert_RGBA8888toRGB888(const vImage_Buffer *a1, const vImage_Buffer *a2, vImage_Flags a3)
{
  return MEMORY[0x24BDB3830](a1, a2, *(_QWORD *)&a3);
}

vImage_Error vImageConvert_YpCbCrToARGB_GenerateConversion(const vImage_YpCbCrToARGBMatrix *matrix, const vImage_YpCbCrPixelRange *pixelRange, vImage_YpCbCrToARGB *outInfo, vImageYpCbCrType inYpCbCrType, vImageARGBType outARGBType, vImage_Flags flags)
{
  return MEMORY[0x24BDB3848](matrix, pixelRange, outInfo, *(_QWORD *)&inYpCbCrType, *(_QWORD *)&outARGBType, *(_QWORD *)&flags);
}

vImage_Error vImageMatrixMultiply_ARGB8888ToPlanar8(const vImage_Buffer *src, const vImage_Buffer *dest, const int16_t matrix[4], int32_t divisor, const int16_t pre_bias[4], int32_t post_bias, vImage_Flags flags)
{
  return MEMORY[0x24BDB3918](src, dest, matrix, *(_QWORD *)&divisor, pre_bias, *(_QWORD *)&post_bias, *(_QWORD *)&flags);
}

vImage_Error vImageOverwriteChannelsWithScalar_ARGB8888(Pixel_8 scalar, const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x24BDB3938](scalar, src, dest, copyMask, *(_QWORD *)&flags);
}

vImage_Error vImageOverwriteChannels_ARGB8888(const vImage_Buffer *newSrc, const vImage_Buffer *origSrc, const vImage_Buffer *dest, uint8_t copyMask, vImage_Flags flags)
{
  return MEMORY[0x24BDB3940](newSrc, origSrc, dest, copyMask, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGB16S(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB39F8](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGB16U(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A00](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A10](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_ARGBFFFF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A20](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_Planar16S(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A50](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A58](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A60](src, dest, tempBuffer, *(_QWORD *)&flags);
}

vImage_Error vImageScale_PlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImage_Flags flags)
{
  return MEMORY[0x24BDB3A70](src, dest, tempBuffer, *(_QWORD *)&flags);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0370](a1, a2, a3);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

