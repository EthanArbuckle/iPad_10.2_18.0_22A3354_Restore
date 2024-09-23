uint64_t std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(uint64_t a1, std::sub_match<const char *> *a2, std::sub_match<const char *> *a3, std::vector<std::csub_match> *this, int a5)
{
  int v9;
  int v10;
  const std::vector<std::csub_match>::value_type *v11;
  int v12;
  const char *i;
  std::vector<std::csub_match>::pointer begin;
  std::sub_match<const char *> *first;
  std::sub_match<const char *> *second;
  uint64_t result;

  if ((a5 & 0x80) != 0)
    v9 = a5 & 0xFFA;
  else
    v9 = a5;
  v10 = *(_DWORD *)(a1 + 28);
  this[1].__begin_ = a3;
  v11 = (const std::vector<std::csub_match>::value_type *)&this[1];
  this[1].__end_ = a3;
  LOBYTE(this[1].__end_cap_.__value_) = 0;
  std::vector<std::sub_match<char const*>>::assign(this, (v10 + 1), (std::vector<std::csub_match>::const_reference)&this[1]);
  this[2].__begin_ = a2;
  this[2].__end_ = a2;
  LOBYTE(this[2].__end_cap_.__value_) = 0;
  *(std::pair<const char *, const char *> *)&this[3].__begin_ = v11->std::pair<const char *, const char *>;
  LOBYTE(this[3].__end_cap_.__value_) = this[1].__end_cap_.__value_;
  if ((v9 & 0x800) == 0)
    this[4].__end_ = a2;
  LOBYTE(this[4].__begin_) = 1;
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0)
  {
    if ((std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a2, (const char *)a3, (uint64_t *)this, v9, (v9 & 0x800) == 0) & 1) != 0)goto LABEL_28;
    goto LABEL_13;
  }
  if (*(_DWORD *)(a1 + 28))
  {
    if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a2, (const char *)a3, (uint64_t *)this, v9, (v9 & 0x800) == 0))goto LABEL_28;
LABEL_13:
    if (a2 != a3 && (v9 & 0x40) == 0)
    {
      v12 = v9 | 0x80;
      for (i = (char *)&a2->first + 1; i != (const char *)a3; ++i)
      {
        std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
        if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0)
        {
          if (*(_DWORD *)(a1 + 28))
          {
            if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, i, (const char *)a3, (uint64_t *)this, v12, 0))goto LABEL_28;
          }
          else if ((std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)i, (uint64_t)a3, (uint64_t *)this, v12, 0) & 1) != 0)
          {
            goto LABEL_28;
          }
        }
        else if ((std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, i, (const char *)a3, (uint64_t *)this, v12, 0) & 1) != 0)
        {
          goto LABEL_28;
        }
        std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
      }
      std::vector<std::sub_match<char const*>>::assign(this, 0xAAAAAAAAAAAAAAABLL * (((char *)this->__end_ - (char *)this->__begin_) >> 3), v11);
      if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0)
      {
        if (*(_DWORD *)(a1 + 28))
        {
          if (std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a3, (const char *)a3, (uint64_t *)this, v12, 0))goto LABEL_28;
        }
        else if ((std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)a3, (uint64_t)a3, (uint64_t *)this, v12, 0) & 1) != 0)
        {
          goto LABEL_28;
        }
      }
      else if ((std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1, (const char *)a3, (const char *)a3, (uint64_t *)this, v12, 0) & 1) != 0)
      {
        goto LABEL_28;
      }
    }
    result = 0;
    this->__end_ = this->__begin_;
    return result;
  }
  if ((std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(a1, (uint64_t)a2, (uint64_t)a3, (uint64_t *)this, v9, (v9 & 0x800) == 0) & 1) == 0)goto LABEL_13;
LABEL_28:
  if (this->__end_ == this->__begin_)
    begin = (std::vector<std::csub_match>::pointer)v11;
  else
    begin = this->__begin_;
  first = (std::sub_match<const char *> *)begin->first;
  this[2].__end_ = (std::vector<std::csub_match>::pointer)begin->first;
  LOBYTE(this[2].__end_cap_.__value_) = this[2].__begin_ != first;
  second = (std::sub_match<const char *> *)begin->second;
  this[3].__begin_ = second;
  LOBYTE(this[3].__end_cap_.__value_) = second != this[3].__end_;
  return 1;
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int v20;
  char *v21;
  uint64_t v22;
  const char *v23;
  char *v24;
  void *v25;
  void *v26;
  __int128 v27;
  char *v28;
  __int128 v29;
  uint64_t v30;
  char *i;
  void *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  _BYTE *v39;
  unsigned int v40;
  uint64_t v41;
  char v42;
  _BYTE v44[96];
  std::vector<std::csub_match>::value_type __x;
  char *v46;
  char *v47;
  unint64_t v48;

  v46 = 0;
  v47 = 0;
  v48 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    __x.second = a3;
    *(_QWORD *)&__x.matched = 0xAAAAAAAAAAAAAA00;
    __x.first = a3;
    *(_DWORD *)v44 = 0;
    memset(&v44[8], 0, 85);
    v13 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v46, (uint64_t)v44);
    v47 = v13;
    if (*(_QWORD *)&v44[56])
      operator delete(*(void **)&v44[56]);
    if (*(_QWORD *)&v44[32])
      operator delete(*(void **)&v44[32]);
    v14 = *((_QWORD *)v13 - 8);
    *((_DWORD *)v13 - 24) = 0;
    *((_QWORD *)v13 - 11) = a2;
    *((_QWORD *)v13 - 10) = a2;
    *((_QWORD *)v13 - 9) = a3;
    v15 = *(unsigned int *)(a1 + 28);
    v16 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v13 - 7) - v14) >> 3);
    if (v15 <= v16)
    {
      if (v15 < v16)
        *((_QWORD *)v13 - 7) = v14 + 24 * v15;
    }
    else
    {
      std::vector<std::sub_match<char const*>>::__append((std::vector<std::csub_match> *)(v13 - 64), v15 - v16, &__x);
    }
    v17 = *((_QWORD *)v13 - 5);
    v18 = *(unsigned int *)(a1 + 32);
    v19 = (*((_QWORD *)v13 - 4) - v17) >> 4;
    if (v18 <= v19)
    {
      if (v18 < v19)
        *((_QWORD *)v13 - 4) = v17 + 16 * v18;
    }
    else
    {
      std::vector<std::pair<unsigned long,char const*>>::__append((std::vector<std::pair<unsigned long, const char *>> *)(v13 - 40), v18 - v19);
    }
    *((_QWORD *)v13 - 2) = v6;
    *((_DWORD *)v13 - 2) = a5;
    *(v13 - 4) = a6;
    v20 = 1;
    while (2)
    {
      if ((v20 & 0xFFF) == 0 && (int)(v20 >> 12) >= (int)a3 - (int)a2)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
      v22 = *((_QWORD *)v13 - 2);
      if (v22)
        (*(void (**)(uint64_t, char *))(*(_QWORD *)v22 + 16))(v22, v13 - 96);
      switch(*((_DWORD *)v13 - 24))
      {
        case 0xFFFFFC18:
          v23 = (const char *)*((_QWORD *)v13 - 10);
          if ((a5 & 0x20) != 0 && v23 == a2 || (a5 & 0x1000) != 0 && v23 != a3)
            goto LABEL_26;
          v35 = *a4;
          *(_QWORD *)v35 = a2;
          *(_QWORD *)(v35 + 8) = v23;
          *(_BYTE *)(v35 + 16) = 1;
          v36 = *((_QWORD *)v13 - 8);
          v37 = *((_QWORD *)v13 - 7) - v36;
          if (v37)
          {
            v38 = 0xAAAAAAAAAAAAAAABLL * (v37 >> 3);
            v39 = (_BYTE *)(v36 + 16);
            v40 = 1;
            do
            {
              v41 = v35 + 24 * v40;
              *(_OWORD *)v41 = *((_OWORD *)v39 - 1);
              v42 = *v39;
              v39 += 24;
              *(_BYTE *)(v41 + 16) = v42;
            }
            while (v38 > v40++);
          }
          v6 = 1;
          v21 = v46;
          if (!v46)
            return v6;
          goto LABEL_37;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_16;
        case 0xFFFFFC1F:
LABEL_26:
          v24 = v47;
          v25 = (void *)*((_QWORD *)v47 - 5);
          if (v25)
          {
            *((_QWORD *)v47 - 4) = v25;
            operator delete(v25);
          }
          v26 = (void *)*((_QWORD *)v24 - 8);
          if (v26)
          {
            *((_QWORD *)v24 - 7) = v26;
            operator delete(v26);
          }
          v47 = v24 - 96;
          goto LABEL_16;
        case 0xFFFFFC20:
          *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)&v44[64] = v27;
          *(_OWORD *)&v44[80] = v27;
          *(_OWORD *)&v44[32] = v27;
          *(_OWORD *)&v44[48] = v27;
          *(_OWORD *)v44 = v27;
          *(_OWORD *)&v44[16] = v27;
          std::__state<char>::__state((uint64_t)v44, (__int128 *)v13 - 6);
          (*(void (**)(_QWORD, uint64_t, char *))(**((_QWORD **)v13 - 2) + 24))(*((_QWORD *)v13 - 2), 1, v13 - 96);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(**(_QWORD **)&v44[80] + 24))(*(_QWORD *)&v44[80], 0, v44);
          v28 = v47;
          if ((unint64_t)v47 >= v48)
          {
            v47 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v46, (uint64_t)v44);
            if (*(_QWORD *)&v44[56])
            {
              *(_QWORD *)&v44[64] = *(_QWORD *)&v44[56];
              operator delete(*(void **)&v44[56]);
            }
          }
          else
          {
            v29 = *(_OWORD *)&v44[16];
            *(_OWORD *)v47 = *(_OWORD *)v44;
            *((_OWORD *)v28 + 1) = v29;
            *((_QWORD *)v28 + 4) = 0;
            *((_QWORD *)v28 + 5) = 0;
            *((_QWORD *)v28 + 6) = 0;
            *((_QWORD *)v28 + 7) = 0;
            *((_OWORD *)v28 + 2) = *(_OWORD *)&v44[32];
            *((_QWORD *)v28 + 6) = *(_QWORD *)&v44[48];
            memset(&v44[32], 0, 24);
            *((_QWORD *)v28 + 8) = 0;
            *((_QWORD *)v28 + 9) = 0;
            *(_OWORD *)(v28 + 56) = *(_OWORD *)&v44[56];
            *((_QWORD *)v28 + 9) = *(_QWORD *)&v44[72];
            memset(&v44[56], 0, 24);
            v30 = *(_QWORD *)&v44[80];
            *(_QWORD *)(v28 + 85) = *(_QWORD *)&v44[85];
            *((_QWORD *)v28 + 10) = v30;
            v47 = v28 + 96;
          }
          if (*(_QWORD *)&v44[32])
          {
            *(_QWORD *)&v44[40] = *(_QWORD *)&v44[32];
            operator delete(*(void **)&v44[32]);
          }
LABEL_16:
          v21 = v46;
          v13 = v47;
          ++v20;
          if (v46 != v47)
            continue;
          v6 = 0;
          if (v46)
          {
LABEL_37:
            for (i = v47; i != v21; i -= 96)
            {
              v32 = (void *)*((_QWORD *)i - 5);
              if (v32)
              {
                *((_QWORD *)i - 4) = v32;
                operator delete(v32);
              }
              v33 = (void *)*((_QWORD *)i - 8);
              if (v33)
              {
                *((_QWORD *)i - 7) = v33;
                operator delete(v33);
              }
            }
            operator delete(v21);
          }
          break;
        default:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
      }
      break;
    }
  }
  return v6;
}

void sub_21246E5C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_21246E5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  std::__state<char>::~__state((uint64_t *)va);
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_21246E624(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void sub_21246E638(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v1 - 112));
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__exec(const std::__bracket_expression<char, std::regex_traits<char>> *this, std::__bracket_expression<char, std::regex_traits<char>>::__state *a2)
{
  std::__bracket_expression<char, std::regex_traits<char>>::__state *v2;
  char *current;
  char *last;
  char v6;
  char v7;
  std::string::size_type size;
  int v9;
  std::string *p_s;
  uint64_t v11;
  _BOOL4 negate;
  std::string::size_type v13;
  std::vector<std::pair<char, char>>::pointer begin;
  uint64_t v15;
  uint64_t v16;
  char *p_second;
  std::vector<std::pair<std::string, std::string>>::pointer v19;
  char v20;
  int64_t v21;
  uint64_t v22;
  unint64_t v23;
  std::string *v24;
  char v25;
  std::string::size_type v26;
  uint64_t v27;
  unsigned __int8 *v28;
  BOOL v29;
  std::string::size_type v30;
  unsigned __int8 v31;
  std::vector<char>::pointer v32;
  unint64_t v33;
  int v34;
  std::regex_traits<char>::char_class_type v35;
  char v36;
  int v37;
  std::vector<char>::pointer end;
  std::vector<char>::pointer v39;
  char *v40;
  std::vector<std::pair<std::string, std::string>>::pointer v41;
  std::vector<std::pair<std::string, std::string>>::pointer v42;
  unsigned int v43;
  int64_t v44;
  uint64_t v45;
  unint64_t v46;
  std::string *v47;
  std::string::size_type v48;
  uint64_t v49;
  unsigned __int8 *v50;
  BOOL v51;
  int v52;
  char *v53;
  size_t v54;
  size_t v55;
  int v56;
  int v57;
  char *v58;
  size_t v59;
  size_t v60;
  int v61;
  int v62;
  char *v63;
  size_t v64;
  size_t v65;
  int v66;
  int v67;
  char *v68;
  size_t v69;
  size_t v70;
  int v71;
  int v72;
  std::vector<std::string>::pointer v73;
  uint64_t v74;
  int64_t v75;
  unint64_t v76;
  unint64_t v77;
  const void *v78;
  size_t v79;
  std::string::size_type v80;
  uint64_t v81;
  BOOL v82;
  std::string *v83;
  std::string::size_type v84;
  int v85;
  std::string *v86;
  uint64_t v87;
  const void *v88;
  size_t v89;
  std::regex_traits<char>::char_class_type v90;
  int v91;
  std::string *v92;
  size_t v93;
  std::__bracket_expression<char, std::regex_traits<char>>::__state *v94;
  std::vector<std::string>::pointer v95;
  int v96;
  int64_t v97;
  unint64_t v98;
  size_t v99;
  std::string::size_type v100;
  uint64_t v101;
  uint64_t v102;
  BOOL v103;
  std::string *v104;
  std::string::size_type v105;
  int v106;
  std::string *v107;
  uint64_t v108;
  uint64_t v109;
  const void *v110;
  uint64_t v111;
  std::string::size_type v112;
  int v113;
  std::vector<std::string>::pointer v114;
  std::regex_traits<char>::char_class_type mask;
  const std::ctype_base::mask *tab;
  std::ctype_base::mask v117;
  std::regex_traits<char>::char_class_type neg_mask;
  int v119;
  std::__node<char> *first;
  int v121;
  std::string::size_type v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  std::string::value_type *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  int v130;
  std::__bracket_expression<char, std::regex_traits<char>>::__state *v131;
  uint64_t v132;
  _BOOL4 v133;
  std::string __p;
  __int16 __src;
  std::string v136;
  std::string __s;

  v2 = a2;
  current = a2->__current_;
  last = a2->__last_;
  if (current == last)
  {
    v11 = 0;
    negate = this->__negate_;
    goto LABEL_265;
  }
  if (!this->__might_have_digraph_ || current + 1 == last)
    goto LABEL_43;
  v6 = *current;
  LOBYTE(__src) = *current;
  v7 = current[1];
  HIBYTE(__src) = v7;
  if (this->__icase_)
  {
    LOBYTE(__src) = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v6);
    HIBYTE(__src) = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v7);
  }
  __s.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[2] = 0x2AAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAA00AAAALL;
  LOWORD(__s.__r_.__value_.__l.__data_) = __src;
  std::__get_collation_name(&v136, (const char *)&__s);
  __p = v136;
  size = HIBYTE(v136.__r_.__value_.__r.__words[2]);
  v9 = SHIBYTE(v136.__r_.__value_.__r.__words[2]);
  if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v136.__r_.__value_.__l.__size_;
  if (size)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    v13 = __s.__r_.__value_.__l.__size_;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
    if (__s.__r_.__value_.__l.__size_ >= 3)
    {
LABEL_11:
      operator delete(p_s);
      goto LABEL_16;
    }
    goto LABEL_169;
  }
  v13 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  if (HIBYTE(__s.__r_.__value_.__r.__words[2]) < 3u)
  {
    p_s = &__s;
LABEL_169:
    (*(void (**)(std::string *__return_ptr, const std::collate<char> *, std::string *, char *))(*(_QWORD *)this->__traits_.__col_ + 32))(&v136, this->__traits_.__col_, p_s, (char *)p_s + v13);
    if (v9 < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    __p = v136;
    if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0)
    {
      if (__p.__r_.__value_.__l.__size_ == 1 || __p.__r_.__value_.__l.__size_ == 12)
      {
        if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v92 = &__s;
        else
          v92 = (std::string *)__s.__r_.__value_.__r.__words[0];
        if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v93 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
        else
          v93 = __s.__r_.__value_.__l.__size_;
        std::string::__assign_no_alias<false>((void **)&__p.__r_.__value_.__l.__data_, v92, v93);
      }
      else
      {
        *__p.__r_.__value_.__l.__data_ = 0;
        __p.__r_.__value_.__l.__size_ = 0;
      }
    }
    else if (HIBYTE(v136.__r_.__value_.__r.__words[2]) == 1 || HIBYTE(v136.__r_.__value_.__r.__words[2]) == 12)
    {
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
        std::string::__assign_no_alias<true>(&__p, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
      else
        __p = __s;
    }
    else
    {
      __p.__r_.__value_.__s.__data_[0] = 0;
      *((_BYTE *)&__p.__r_.__value_.__s + 23) = 0;
    }
LABEL_9:
    if ((SHIBYTE(__s.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_16;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
    goto LABEL_11;
  }
LABEL_16:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    v30 = __p.__r_.__value_.__l.__size_;
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v30)
      goto LABEL_18;
LABEL_43:
    negate = 0;
    v11 = 1;
    v31 = *v2->__current_;
    __p.__r_.__value_.__s.__data_[0] = v31;
    if (!this->__icase_)
      goto LABEL_45;
    goto LABEL_44;
  }
  if (!*((_BYTE *)&__p.__r_.__value_.__s + 23))
    goto LABEL_43;
LABEL_18:
  begin = this->__digraphs_.__begin_;
  v15 = (char *)this->__digraphs_.__end_ - (char *)begin;
  if (v15)
  {
    v16 = v15 >> 1;
    if ((unint64_t)(v15 >> 1) <= 1)
      v16 = 1;
    p_second = &begin->second;
    while (__src != *(p_second - 1) || HIBYTE(__src) != *p_second)
    {
      p_second += 2;
      if (!--v16)
        goto LABEL_27;
    }
    goto LABEL_262;
  }
LABEL_27:
  if (!this->__collate_ || this->__ranges_.__begin_ == this->__ranges_.__end_)
  {
    negate = 0;
    goto LABEL_200;
  }
  memset(&v136, 170, sizeof(v136));
  __s.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[2] = 0x2AAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAA00AAAALL;
  LOWORD(__s.__r_.__value_.__l.__data_) = __src;
  (*(void (**)(std::string *__return_ptr, const std::collate<char> *, std::string *, std::string::value_type *))(*(_QWORD *)this->__traits_.__col_ + 32))(&v136, this->__traits_.__col_, &__s, &__s.__r_.__value_.__s.__data_[2]);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  v19 = this->__ranges_.__begin_;
  v20 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
  v21 = (char *)this->__ranges_.__end_ - (char *)v19;
  if (!v21)
  {
    v29 = 0;
    v72 = 0;
    negate = 0;
    goto LABEL_197;
  }
  v131 = v2;
  v22 = 0;
  v23 = v21 / 48;
  if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v24 = &v136;
  else
    v24 = (std::string *)v136.__r_.__value_.__r.__words[0];
  v25 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
  if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v26 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
  else
    v26 = v136.__r_.__value_.__l.__size_;
  if (v23 <= 1)
    v27 = 1;
  else
    v27 = v21 / 48;
  v28 = (unsigned __int8 *)&v19->second.__r_.__value_.__r.__words[2] + 7;
  v29 = 1;
  do
  {
    v62 = (char)*(v28 - 24);
    if (v62 >= 0)
      v63 = (char *)(v28 - 47);
    else
      v63 = *(char **)(v28 - 47);
    if (v62 >= 0)
      v64 = *(v28 - 24);
    else
      v64 = *(_QWORD *)(v28 - 39);
    if (v26 >= v64)
      v65 = v64;
    else
      v65 = v26;
    v66 = memcmp(v63, v24, v65);
    if (v66)
    {
      if ((v66 & 0x80000000) == 0)
        goto LABEL_107;
    }
    else if (v64 > v26)
    {
      goto LABEL_107;
    }
    v67 = (char)*v28;
    if (v67 >= 0)
      v68 = (char *)(v28 - 23);
    else
      v68 = *(char **)(v28 - 23);
    if (v67 >= 0)
      v69 = *v28;
    else
      v69 = *(_QWORD *)(v28 - 15);
    if (v69 >= v26)
      v70 = v26;
    else
      v70 = v69;
    v71 = memcmp(v24, v68, v70);
    if (v71)
    {
      if (v71 < 0)
      {
LABEL_132:
        negate = 1;
        v72 = 5;
        goto LABEL_186;
      }
    }
    else if (v26 <= v69)
    {
      goto LABEL_132;
    }
LABEL_107:
    v29 = ++v22 < v23;
    v28 += 48;
  }
  while (v27 != v22);
  v72 = 0;
  negate = 0;
LABEL_186:
  v2 = v131;
  v20 = v25;
LABEL_197:
  if (v20 < 0)
    operator delete(v136.__r_.__value_.__l.__data_);
  if (v29)
    goto LABEL_241;
LABEL_200:
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
    goto LABEL_244;
  v94 = v2;
  memset(&__s, 170, sizeof(__s));
  std::regex_traits<char>::__transform_primary<char *>(&__s, (uint64_t)&this->__traits_, &__src, &v136);
  v95 = this->__equivalences_.__begin_;
  v96 = SHIBYTE(__s.__r_.__value_.__r.__words[2]);
  v97 = (char *)this->__equivalences_.__end_ - (char *)v95;
  if (!v97)
  {
    v103 = 0;
    v72 = 0;
    v2 = v94;
    goto LABEL_238;
  }
  v133 = negate;
  v98 = v97 / 24;
  v99 = __s.__r_.__value_.__l.__size_;
  v100 = (__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
       ? HIBYTE(__s.__r_.__value_.__r.__words[2])
       : __s.__r_.__value_.__l.__size_;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    v132 = SHIBYTE(__s.__r_.__value_.__r.__words[2]);
    v109 = 0;
    v110 = (const void *)__s.__r_.__value_.__r.__words[0];
    v111 = v98 <= 1 ? 1 : v97 / 24;
    v103 = 1;
    do
    {
      v112 = HIBYTE(v95->__r_.__value_.__r.__words[2]);
      v113 = (char)v112;
      if ((v112 & 0x80u) != 0)
        v112 = v95->__r_.__value_.__l.__size_;
      if (v100 == v112)
      {
        v114 = v113 >= 0 ? v95 : (std::vector<std::string>::pointer)v95->__r_.__value_.__r.__words[0];
        if (!memcmp(v110, v114, v99))
        {
          negate = 1;
          v72 = 5;
          v2 = v94;
          goto LABEL_237;
        }
      }
      v103 = ++v109 < v98;
      ++v95;
    }
    while (v111 != v109);
    v72 = 0;
    v2 = v94;
    negate = v133;
LABEL_237:
    v96 = v132;
  }
  else
  {
    if (*((_BYTE *)&__s.__r_.__value_.__s + 23))
    {
      v101 = 0;
      if (v98 <= 1)
        v102 = 1;
      else
        v102 = v97 / 24;
      v103 = 1;
      do
      {
        v104 = &v95[v101];
        v105 = HIBYTE(v104->__r_.__value_.__r.__words[2]);
        v106 = (char)v105;
        if ((v105 & 0x80u) != 0)
          v105 = v104->__r_.__value_.__l.__size_;
        if (v100 == v105)
        {
          if (v106 < 0)
            v104 = (std::string *)v104->__r_.__value_.__r.__words[0];
          v107 = &__s;
          v108 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
          while (v107->__r_.__value_.__s.__data_[0] == v104->__r_.__value_.__s.__data_[0])
          {
            v107 = (std::string *)((char *)v107 + 1);
            v104 = (std::string *)((char *)v104 + 1);
            if (!--v108)
            {
              negate = 1;
              v72 = 5;
              v2 = v94;
              goto LABEL_238;
            }
          }
        }
        v103 = ++v101 < v98;
      }
      while (v101 != v102);
      v103 = 0;
      v72 = 0;
      v2 = v94;
      negate = v133;
      goto LABEL_238;
    }
    v122 = HIBYTE(v95->__r_.__value_.__r.__words[2]);
    if ((v122 & 0x80u) != 0)
      v122 = v95->__r_.__value_.__l.__size_;
    if (v122 == HIBYTE(__s.__r_.__value_.__r.__words[2]))
    {
      negate = 1;
      v2 = v94;
      goto LABEL_264;
    }
    v123 = 0;
    v124 = v98 <= 1 ? 1 : v98;
    v125 = v124 - 1;
    v126 = &v95[1].__r_.__value_.__s.__data_[8];
    v2 = v94;
    while (v125 != v123)
    {
      ++v123;
      v127 = v126[15];
      v129 = *(_QWORD *)v126;
      v126 += 24;
      v128 = v129;
      if ((v127 & 0x80u) != 0)
        v127 = v128;
      if (v100 == v127)
      {
        v103 = v123 < v98;
        negate = 1;
        v72 = 5;
        goto LABEL_238;
      }
    }
    v103 = 0;
    v72 = 0;
    negate = v133;
  }
LABEL_238:
  if (v96 < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  if (!v103)
  {
LABEL_244:
    if ((char)__src < 0)
    {
      neg_mask = this->__neg_mask_;
    }
    else
    {
      mask = this->__mask_;
      tab = this->__traits_.__ct_->__tab_;
      v117 = tab[__src];
      if (((v117 & mask) != 0 || __src == 95 && (mask & 0x80) != 0)
        && (SHIBYTE(__src) & 0x80000000) == 0
        && ((tab[HIBYTE(__src)] & mask) != 0 || (mask & 0x80) != 0 && HIBYTE(__src) == 95))
      {
        goto LABEL_262;
      }
      neg_mask = this->__neg_mask_;
      if ((neg_mask & v117) != 0 || __src == 95 && (neg_mask & 0x80) != 0)
      {
LABEL_261:
        v119 = negate;
LABEL_263:
        negate = v119;
        goto LABEL_264;
      }
    }
    if ((SHIBYTE(__src) & 0x80000000) == 0)
    {
      if ((this->__traits_.__ct_->__tab_[HIBYTE(__src)] & neg_mask) == 0)
      {
        v119 = 1;
        if (HIBYTE(__src) != 95 || (neg_mask & 0x80) == 0)
          goto LABEL_263;
      }
      goto LABEL_261;
    }
LABEL_262:
    v119 = 1;
    goto LABEL_263;
  }
LABEL_241:
  if (v72)
  {
LABEL_264:
    v11 = 2;
    goto LABEL_265;
  }
  v11 = 2;
  v31 = *v2->__current_;
  __p.__r_.__value_.__s.__data_[0] = v31;
  if (this->__icase_)
  {
LABEL_44:
    v31 = ((uint64_t (*)(const std::ctype<char> *, _QWORD))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, (char)v31);
    __p.__r_.__value_.__s.__data_[0] = v31;
  }
LABEL_45:
  v32 = this->__chars_.__begin_;
  v33 = this->__chars_.__end_ - v32;
  if (v33)
  {
    if (v33 <= 1)
      v33 = 1;
    while (1)
    {
      v34 = *v32++;
      if (v34 == v31)
        break;
      if (!--v33)
        goto LABEL_50;
    }
LABEL_184:
    negate = 1;
    goto LABEL_265;
  }
LABEL_50:
  v35 = this->__neg_mask_;
  if (v35 || this->__neg_chars_.__begin_ != this->__neg_chars_.__end_)
  {
    if ((v31 & 0x80) != 0 || (this->__traits_.__ct_->__tab_[v31] & v35) == 0)
    {
      v37 = (v35 >> 7) & 1;
      v36 = v31 == 95 ? v37 : 0;
    }
    else
    {
      v36 = 1;
    }
    end = this->__neg_chars_.__end_;
    v39 = (std::vector<char>::pointer)memchr(this->__neg_chars_.__begin_, (char)v31, end - this->__neg_chars_.__begin_);
    v40 = v39 ? v39 : end;
    if ((v36 & 1) == 0 && v40 == end)
      goto LABEL_184;
  }
  v41 = this->__ranges_.__begin_;
  v42 = this->__ranges_.__end_;
  if (v41 == v42)
    goto LABEL_137;
  memset(&v136, 170, sizeof(v136));
  v133 = negate;
  if (!this->__collate_)
  {
    v43 = 1;
    *((_BYTE *)&v136.__r_.__value_.__s + 23) = 1;
    LOWORD(v136.__r_.__value_.__l.__data_) = v31;
    v44 = (char *)v42 - (char *)v41;
    if (v44)
      goto LABEL_68;
LABEL_164:
    v51 = 0;
    if ((v43 & 0x80) != 0)
      goto LABEL_135;
    goto LABEL_136;
  }
  __s.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[2] = 0x1AAAAAAAAAAAAAALL;
  __s.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAA00AALL;
  __s.__r_.__value_.__s.__data_[0] = v31;
  (*(void (**)(std::string *__return_ptr, const std::collate<char> *, std::string *, std::string::value_type *))(*(_QWORD *)this->__traits_.__col_ + 32))(&v136, this->__traits_.__col_, &__s, &__s.__r_.__value_.__s.__data_[1]);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  v41 = this->__ranges_.__begin_;
  v43 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
  v44 = (char *)this->__ranges_.__end_ - (char *)v41;
  if (!v44)
    goto LABEL_164;
LABEL_68:
  v131 = v2;
  v132 = v11;
  v45 = 0;
  v46 = v44 / 48;
  LOBYTE(v130) = v43;
  if ((v43 & 0x80u) == 0)
    v47 = &v136;
  else
    v47 = (std::string *)v136.__r_.__value_.__r.__words[0];
  if ((v43 & 0x80u) == 0)
    v48 = v43;
  else
    v48 = v136.__r_.__value_.__l.__size_;
  if (v46 <= 1)
    v49 = 1;
  else
    v49 = v44 / 48;
  v50 = (unsigned __int8 *)&v41->second.__r_.__value_.__r.__words[2] + 7;
  v51 = 1;
  while (2)
  {
    v52 = (char)*(v50 - 24);
    if (v52 >= 0)
      v53 = (char *)(v50 - 47);
    else
      v53 = *(char **)(v50 - 47);
    if (v52 >= 0)
      v54 = *(v50 - 24);
    else
      v54 = *(_QWORD *)(v50 - 39);
    if (v48 >= v54)
      v55 = v54;
    else
      v55 = v48;
    v56 = memcmp(v53, v47, v55);
    if (v56)
    {
      if (v56 < 0)
        goto LABEL_93;
    }
    else if (v54 <= v48)
    {
LABEL_93:
      v57 = (char)*v50;
      if (v57 >= 0)
        v58 = (char *)(v50 - 23);
      else
        v58 = *(char **)(v50 - 23);
      if (v57 >= 0)
        v59 = *v50;
      else
        v59 = *(_QWORD *)(v50 - 15);
      if (v59 >= v48)
        v60 = v48;
      else
        v60 = v59;
      v61 = memcmp(v47, v58, v60);
      if (v61)
      {
        if (v61 < 0)
        {
LABEL_104:
          negate = 1;
          v2 = v131;
          v11 = v132;
          if ((v130 & 0x80) == 0)
            goto LABEL_136;
          goto LABEL_135;
        }
      }
      else if (v48 <= v59)
      {
        goto LABEL_104;
      }
    }
    v51 = ++v45 < v46;
    v50 += 48;
    if (v49 != v45)
      continue;
    break;
  }
  v2 = v131;
  v11 = v132;
  negate = v133;
  if ((v130 & 0x80) == 0)
    goto LABEL_136;
LABEL_135:
  operator delete(v136.__r_.__value_.__l.__data_);
LABEL_136:
  if (v51)
    goto LABEL_265;
LABEL_137:
  if (this->__equivalences_.__begin_ == this->__equivalences_.__end_)
  {
LABEL_179:
    if ((v31 & 0x80) != 0)
      goto LABEL_265;
    v90 = this->__mask_;
    if ((this->__traits_.__ct_->__tab_[v31] & v90) == 0)
    {
      v91 = (v90 >> 7) & 1;
      if (v31 != 95)
        v91 = 0;
      if (v91 != 1)
        goto LABEL_265;
    }
    goto LABEL_184;
  }
  v132 = v11;
  memset(&__s, 170, sizeof(__s));
  std::regex_traits<char>::__transform_primary<char *>(&__s, (uint64_t)&this->__traits_, &__p, &__p.__r_.__value_.__s.__data_[1]);
  v73 = this->__equivalences_.__begin_;
  v74 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  v75 = (char *)this->__equivalences_.__end_ - (char *)v73;
  if (!v75)
  {
    if ((*((_BYTE *)&__s.__r_.__value_.__s + 23) & 0x80) != 0)
      operator delete(__s.__r_.__value_.__l.__data_);
LABEL_178:
    v31 = __p.__r_.__value_.__s.__data_[0];
    goto LABEL_179;
  }
  v131 = v2;
  v76 = 0;
  v77 = v75 / 24;
  v79 = __s.__r_.__value_.__l.__size_;
  v78 = (const void *)__s.__r_.__value_.__r.__words[0];
  if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v80 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
  else
    v80 = __s.__r_.__value_.__l.__size_;
  if (v77 <= 1)
    v81 = 1;
  else
    v81 = v75 / 24;
  v82 = 1;
  while (2)
  {
    v83 = &v73[v76];
    v84 = HIBYTE(v83->__r_.__value_.__r.__words[2]);
    v85 = (char)v84;
    if ((v84 & 0x80u) != 0)
      v84 = v83->__r_.__value_.__l.__size_;
    if (v80 != v84)
    {
LABEL_158:
      if (++v76 == v81)
      {
        if ((v74 & 0x80) != 0)
LABEL_276:
          operator delete(__s.__r_.__value_.__l.__data_);
        v2 = v131;
        v11 = v132;
        goto LABEL_178;
      }
      goto LABEL_162;
    }
    if (v85 >= 0)
      v86 = &v73[v76];
    else
      v86 = (std::string *)v83->__r_.__value_.__r.__words[0];
    if ((v74 & 0x80) == 0)
    {
      if (!(_DWORD)v74)
      {
LABEL_166:
        negate = 1;
        v2 = v131;
        v11 = v132;
        if (!v82)
          goto LABEL_178;
        goto LABEL_265;
      }
      v87 = 0;
      while (__s.__r_.__value_.__s.__data_[v87] == v86->__r_.__value_.__s.__data_[v87])
      {
        if (v74 == ++v87)
          goto LABEL_166;
      }
      goto LABEL_158;
    }
    LOBYTE(v130) = v82;
    v88 = v78;
    v89 = v79;
    if (memcmp(v78, v86, v79))
    {
      ++v76;
      v79 = v89;
      v78 = v88;
      if (v76 == v81)
        goto LABEL_276;
LABEL_162:
      v82 = v76 < v77;
      continue;
    }
    break;
  }
  operator delete(__s.__r_.__value_.__l.__data_);
  negate = 1;
  v2 = v131;
  v11 = v132;
  if ((v130 & 1) == 0)
    goto LABEL_178;
LABEL_265:
  if (negate == this->__negate_)
  {
    first = 0;
    v121 = -993;
  }
  else
  {
    v2->__current_ += v11;
    first = this->__first_;
    v121 = -995;
  }
  v2->__do_ = v121;
  v2->__node_ = first;
}

void sub_21246F244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a18 < 0)
  {
    operator delete(__p);
    if (a28 < 0)
    {
LABEL_5:
      operator delete(a23);
      _Unwind_Resume(a1);
    }
  }
  else if (a28 < 0)
  {
    goto LABEL_5;
  }
  _Unwind_Resume(a1);
}

uint64_t std::__loop<char>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _BYTE *v35;

  v2 = *(unsigned int *)(result + 40);
  v3 = *(_QWORD *)(a2 + 56);
  v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 != -991)
  {
    *v4 = 0;
    if (!*(_QWORD *)(result + 32))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_28;
    }
    if (*(_QWORD *)(result + 24))
    {
      *(_DWORD *)a2 = -994;
      *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
      *(_QWORD *)(v3 + 16 * v2 + 8) = *(_QWORD *)(a2 + 16);
      v20 = *(_DWORD *)(result + 44);
      v21 = *(_DWORD *)(result + 48);
      if (v20 == v21)
        return result;
      v22 = (v21 - 1);
      v23 = (v20 - 1);
      v24 = *(_QWORD *)(a2 + 24);
      v25 = *(_QWORD *)(a2 + 32);
      v26 = v22 - v23;
      if ((unint64_t)(v22 - v23) >= 2)
      {
        v27 = (v26 & 0xFFFFFFFFFFFFFFFELL) + v23;
        v28 = v25 + 24 * v23 + 24;
        v29 = v26 & 0xFFFFFFFFFFFFFFFELL;
        do
        {
          *(_QWORD *)(v28 - 24) = v24;
          *(_QWORD *)(v28 - 16) = v24;
          *(_QWORD *)v28 = v24;
          *(_QWORD *)(v28 + 8) = v24;
          *(_BYTE *)(v28 - 8) = 0;
          *(_BYTE *)(v28 + 16) = 0;
          v28 += 48;
          v29 -= 2;
        }
        while (v29);
        if (v26 == (v26 & 0xFFFFFFFFFFFFFFFELL))
          return result;
      }
      else
      {
        v27 = v23;
      }
      v30 = v22 - v27;
      v31 = (_BYTE *)(v25 + 24 * v27 + 16);
      do
      {
        *((_QWORD *)v31 - 2) = v24;
        *((_QWORD *)v31 - 1) = v24;
        *v31 = 0;
        v31 += 24;
        --v30;
      }
      while (v30);
      return result;
    }
LABEL_26:
    *(_DWORD *)a2 = -992;
    return result;
  }
  v5 = *v4 + 1;
  *v4 = v5;
  v6 = *(_QWORD *)(result + 24);
  v7 = *(_QWORD *)(result + 32);
  v8 = v5 < v7;
  if (v5 < v7 && v5 >= v6)
    v8 = v5 < v7 && *(_QWORD *)(v3 + 16 * v2 + 8) != *(_QWORD *)(a2 + 16);
  if (v8 && v5 >= v6)
    goto LABEL_26;
  *(_DWORD *)a2 = -994;
  if (!v8)
  {
LABEL_28:
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 16);
    return result;
  }
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  *(_QWORD *)(v3 + 16 * v2 + 8) = *(_QWORD *)(a2 + 16);
  v12 = *(_DWORD *)(result + 44);
  v13 = *(_DWORD *)(result + 48);
  if (v12 == v13)
    return result;
  v14 = (v13 - 1);
  v15 = (v12 - 1);
  v16 = *(_QWORD *)(a2 + 24);
  v17 = *(_QWORD *)(a2 + 32);
  v18 = v14 - v15;
  if ((unint64_t)(v14 - v15) < 2)
  {
    v19 = v15;
LABEL_39:
    v34 = v14 - v19;
    v35 = (_BYTE *)(v17 + 24 * v19 + 16);
    do
    {
      *((_QWORD *)v35 - 2) = v16;
      *((_QWORD *)v35 - 1) = v16;
      *v35 = 0;
      v35 += 24;
      --v34;
    }
    while (v34);
    return result;
  }
  v19 = (v18 & 0xFFFFFFFFFFFFFFFELL) + v15;
  v32 = v17 + 24 * v15 + 24;
  v33 = v18 & 0xFFFFFFFFFFFFFFFELL;
  do
  {
    *(_QWORD *)(v32 - 24) = v16;
    *(_QWORD *)(v32 - 16) = v16;
    *(_QWORD *)v32 = v16;
    *(_QWORD *)(v32 + 8) = v16;
    *(_BYTE *)(v32 - 8) = 0;
    *(_BYTE *)(v32 + 16) = 0;
    v32 += 48;
    v33 -= 2;
  }
  while (v33);
  if (v18 != (v18 & 0xFFFFFFFFFFFFFFFELL))
    goto LABEL_39;
  return result;
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

void std::vector<std::sub_match<char const*>>::assign(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __u)
{
  std::sub_match<const char *> *value;
  std::sub_match<const char *> *begin;
  unint64_t v8;
  std::vector<std::csub_match>::size_type v9;
  unint64_t v10;
  uint64_t v11;
  std::sub_match<const char *> *v12;
  std::vector<std::csub_match>::size_type v13;
  std::sub_match<const char *> *v14;
  std::vector<std::csub_match>::pointer end;
  unint64_t v16;
  std::vector<std::csub_match>::size_type v17;
  std::vector<std::csub_match>::value_type *v18;
  std::sub_match<const char *> *v19;
  std::vector<std::csub_match>::size_type v20;
  std::pair<const char *, const char *> v21;

  value = this->__end_cap_.__value_;
  begin = this->__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)begin) >> 3) < __n)
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
      goto LABEL_26;
    v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)value >> 3);
    v9 = 2 * v8;
    if (2 * v8 <= __n)
      v9 = __n;
    v10 = v8 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v9;
    if (v10 > 0xAAAAAAAAAAAAAAALL)
LABEL_26:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v11 = v10;
    v12 = (std::sub_match<const char *> *)operator new(24 * v10);
    this->__begin_ = v12;
    this->__end_ = v12;
    this->__end_cap_.__value_ = &v12[v11];
    v13 = 24 * __n;
    v14 = &v12[__n];
    do
    {
      v12->std::pair<const char *, const char *> = __u->std::pair<const char *, const char *>;
      *(_QWORD *)&v12->matched = *(_QWORD *)&__u->matched;
      ++v12;
      v13 -= 24;
    }
    while (v13);
    goto LABEL_25;
  }
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
    v14 = &begin[__n];
LABEL_25:
    this->__end_ = v14;
    return;
  }
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

void std::__alternate<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t std::__repeat_one_loop<char>::__exec(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void std::vector<std::pair<unsigned long,char const*>>::__append(std::vector<std::pair<unsigned long, const char *>> *this, std::vector<std::pair<unsigned long, const char *>>::size_type __n)
{
  std::pair<unsigned long, const char *> *value;
  std::pair<unsigned long, const char *> *end;
  std::vector<std::pair<unsigned long, const char *>>::pointer begin;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  std::vector<std::pair<unsigned long, const char *>>::size_type v12;
  std::pair<unsigned long, const char *> *v13;
  size_t v14;
  std::pair<unsigned long, const char *> *v15;
  std::pair<unsigned long, const char *> *v16;

  end = this->__end_;
  value = this->__end_cap_.__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      v12 = 16 * __n;
      bzero(this->__end_, 16 * __n);
      end = (std::pair<unsigned long, const char *> *)((char *)end + v12);
    }
    this->__end_ = end;
  }
  else
  {
    begin = this->__begin_;
    v7 = end - this->__begin_;
    v8 = v7 + __n;
    if ((v7 + __n) >> 60)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v9 = (char *)value - (char *)begin;
    if (v9 >> 3 > v8)
      v8 = v9 >> 3;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0)
      v10 = 0xFFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
    {
      if (v10 >> 60)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v11 = (char *)operator new(16 * v10);
    }
    else
    {
      v11 = 0;
    }
    v13 = (std::pair<unsigned long, const char *> *)&v11[16 * v7];
    v14 = __n;
    v15 = (std::pair<unsigned long, const char *> *)&v11[16 * v10];
    bzero(v13, v14 * 16);
    v16 = &v13[v14];
    if (end != begin)
    {
      do
      {
        v13[-1] = end[-1];
        --v13;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v13;
    this->__end_ = v16;
    this->__end_cap_.__value_ = v15;
    if (end)
      operator delete(end);
  }
}

void std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale *v1;

  v1 = std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(a1);
  operator delete(v1);
}

void std::__empty_state<char>::~__empty_state(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

void std::__alternate<char>::~__alternate(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *__p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24CDC11B0;
  v2 = __p[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = __p[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  operator delete(__p);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  char *v7;
  char *v8;
  std::__owns_one_state<char> *v9;
  unsigned int marked_count;
  std::basic_regex<char> *v11;
  std::__node<char> *v12;
  std::__owns_one_state<char> *v13;
  std::__node<char> *first;
  std::__node<char> *v15;
  std::__node<char> *v16;
  std::__node<char> *v17;
  std::__node<char> *v18;
  std::__node<char> *v19;
  std::__node<char> *v20;
  std::__owns_one_state<char> *v21;
  char *v22;
  char *v23;
  std::__owns_one_state<char> *v24;
  unsigned int v25;
  std::basic_regex<char> *v26;
  std::__node<char> *v27;
  std::__owns_one_state<char> *v28;
  std::__node<char> *v29;

  end = a1->__end_;
  v7 = a2;
  while (1)
  {
    v8 = v7;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>((uint64_t)a1, v7, a3);
    if (v7 == v8)
      break;
LABEL_2:
    if (v7 == v8)
      goto LABEL_6;
  }
  v9 = a1->__end_;
  marked_count = a1->__marked_count_;
  v11 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(a1);
  if (v11 != (std::basic_regex<char> *)v8)
  {
    v7 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)a1, v11, (std::basic_regex<char> *)a3, v9, marked_count + 1, a1->__marked_count_ + 1);
    goto LABEL_2;
  }
LABEL_6:
  if (v8 == a2)
  {
    v12 = (std::__node<char> *)operator new(0x10uLL);
    v13 = a1->__end_;
    first = v13->__first_;
    v12[1].__vftable = (std::__node<char>_vtbl *)first;
    v13->__first_ = v12;
    a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  }
  if (v8 == a3)
    return a3;
  while (2)
  {
    if (*v8 != 124)
      return v8;
    v21 = a1->__end_;
    v22 = v8 + 1;
    v23 = v8 + 1;
    while (2)
    {
      v8 = v23;
      v23 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>((uint64_t)a1, v23, a3);
      if (v23 != v8)
      {
LABEL_14:
        if (v23 == v8)
          goto LABEL_17;
        continue;
      }
      break;
    }
    v24 = a1->__end_;
    v25 = a1->__marked_count_;
    v26 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(a1);
    if (v26 != (std::basic_regex<char> *)v8)
    {
      v23 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)a1, v26, (std::basic_regex<char> *)a3, v24, v25 + 1, a1->__marked_count_ + 1);
      goto LABEL_14;
    }
LABEL_17:
    if (v8 == v22)
    {
      v27 = (std::__node<char> *)operator new(0x10uLL);
      v28 = a1->__end_;
      v29 = v28->__first_;
      v27[1].__vftable = (std::__node<char>_vtbl *)v29;
      v28->__first_ = v27;
      a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
    }
    v15 = (std::__node<char> *)operator new(0x18uLL);
    v16 = v21->__first_;
    v15[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
    v15[2].__vftable = (std::__node<char>_vtbl *)v16;
    v15->__vftable = (std::__node<char>_vtbl *)&off_24CDC1228;
    end->__first_ = v15;
    v21->__first_ = 0;
    v17 = (std::__node<char> *)operator new(0x10uLL);
    v18 = a1->__end_->__first_;
    v17[1].__vftable = (std::__node<char>_vtbl *)v18;
    v21->__first_ = v17;
    a1->__end_->__first_ = 0;
    v19 = (std::__node<char> *)operator new(0x10uLL);
    v20 = v21->__first_;
    v19->__vftable = (std::__node<char>_vtbl *)off_24CDC1270;
    v19[1].__vftable = (std::__node<char>_vtbl *)v20;
    a1->__end_->__first_ = v19;
    a1->__end_ = (std::__owns_one_state<char> *)v21->__first_;
    if (v8 != a3)
      continue;
    return a3;
  }
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  int v5;
  char v6;
  uint64_t v7;
  void *v8;
  std::basic_regex<char>::value_type *v9;
  std::basic_regex<char>::value_type *v10;
  int v11;
  int v12;
  std::basic_regex<char>::value_type *v13;
  uint64_t v14;
  std::basic_regex<char>::value_type *v15;
  uint64_t v16;
  char *v17;
  size_t v18;
  uint64_t v19;
  int v20;
  _BYTE *v21;
  _BYTE *v22;
  std::basic_regex<char>::value_type *v23;
  std::basic_regex<char>::value_type *v24;
  std::basic_regex<char>::value_type *v25;
  int v26;
  unint64_t v27;
  char *v28;
  int v29;
  int v30;
  std::basic_regex<char>::value_type *v31;
  std::basic_regex<char>::value_type *v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  const char *v38;
  std::regex_traits<char>::char_class_type classname;
  char v40;
  std::basic_regex<char>::value_type *v41;
  std::string::value_type *v42;
  unint64_t v43;
  __int128 v44;
  uint64_t v45;
  char *v46;
  int v47;
  void **v48;
  _BYTE *v49;
  _BYTE *v50;
  int64_t v51;
  std::basic_regex<char>::value_type *v52;
  std::basic_regex<char>::value_type *v53;
  int v54;
  std::string::value_type *v55;
  std::basic_regex<char>::value_type *v56;
  char *v57;
  std::basic_regex<char>::value_type *v59;
  void *v60[2];
  std::string::value_type *v61;
  void *__p[2];
  unint64_t v63;
  std::string::value_type *__s[4];
  _OWORD __dst[2];

  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3)
      goto LABEL_178;
    v5 = a2[1];
    v6 = v5 == 94;
    v7 = (uint64_t)(v5 == 94 ? a2 + 2 : a2 + 1);
    v8 = operator new(0xB0uLL);
    std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v8, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), v6, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v8;
    *(_QWORD *)(a1 + 56) = v8;
    if ((std::basic_regex<char>::value_type *)v7 == a3)
      goto LABEL_178;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *(_BYTE *)v7 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 93);
      ++v7;
    }
    if ((std::basic_regex<char>::value_type *)v7 == a3)
      goto LABEL_178;
    v59 = a3 - 4;
    while (1)
    {
      v9 = (std::basic_regex<char>::value_type *)v7;
      v10 = a3;
      if ((std::basic_regex<char>::value_type *)v7 == a3)
        goto LABEL_14;
      v11 = *(unsigned __int8 *)v7;
      v10 = (std::basic_regex<char>::value_type *)v7;
      if (v11 == 93)
        goto LABEL_14;
      __p[0] = 0;
      __p[1] = 0;
      v63 = 0;
      v10 = (std::basic_regex<char>::value_type *)v7;
      if ((std::basic_regex<char>::value_type *)(v7 + 1) == a3 || v11 != 91)
        goto LABEL_60;
      v12 = *(unsigned __int8 *)(v7 + 1);
      if (v12 != 46)
      {
        if (v12 == 58)
        {
          if ((uint64_t)&a3[-v7 - 2] < 2)
            goto LABEL_177;
          v18 = 0;
          v19 = v7;
          if (*(_BYTE *)(v7 + 2) == 58)
            goto LABEL_36;
          do
          {
            do
            {
              if (&v59[-v7] == (std::basic_regex<char>::value_type *)v18)
                goto LABEL_177;
              ++v18;
              v19 = v7 + v18;
            }
            while (*(_BYTE *)(v7 + v18 + 2) != 58);
LABEL_36:
            ;
          }
          while (*(_BYTE *)(v19 + 3) != 93);
          if ((std::basic_regex<char>::value_type *)(v7 + v18 + 2) == a3)
            goto LABEL_177;
          v20 = *(_DWORD *)(a1 + 24);
          memset(__dst, 170, 24);
          if (v18 >= 0x7FFFFFFFFFFFFFF8)
            std::string::__throw_length_error[abi:ne180100]();
          if (v18 >= 0x17)
          {
            v34 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v18 | 7) != 0x17)
              v34 = v18 | 7;
            v35 = v34 + 1;
            v21 = operator new(v34 + 1);
            *((_QWORD *)&__dst[0] + 1) = v18;
            *(_QWORD *)&__dst[1] = v35 | 0x8000000000000000;
            *(_QWORD *)&__dst[0] = v21;
          }
          else
          {
            BYTE7(__dst[1]) = v18;
            v21 = __dst;
            if (!v18)
            {
LABEL_75:
              *v21 = 0;
              v36 = BYTE7(__dst[1]);
              if ((SBYTE7(__dst[1]) & 0x80u) == 0)
                v37 = (char *)__dst;
              else
                v37 = *(char **)&__dst[0];
              if (SBYTE7(__dst[1]) < 0)
                v36 = *((_QWORD *)&__dst[0] + 1);
              (*(void (**)(_QWORD, char *, char *))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), v37, &v37[v36]);
              if ((SBYTE7(__dst[1]) & 0x80u) == 0)
                v38 = (const char *)__dst;
              else
                v38 = *(const char **)&__dst[0];
              classname = std::__get_classname(v38, v20 & 1);
              if (SBYTE7(__dst[1]) < 0)
                operator delete(*(void **)&__dst[0]);
              if (!classname)
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
              v40 = 0;
              *((_DWORD *)v8 + 40) |= classname;
              v7 = (uint64_t)&v9[v18 + 4];
              v41 = v9;
              if ((SHIBYTE(v63) & 0x80000000) == 0)
              {
LABEL_138:
                v10 = v41;
                if ((v40 & 1) == 0)
                  goto LABEL_15;
                goto LABEL_14;
              }
              goto LABEL_151;
            }
          }
          memcpy(v21, v9 + 2, v18);
          v21 += v18;
          goto LABEL_75;
        }
        if (v12 == 61)
        {
          if ((uint64_t)&a3[-v7 - 2] < 2)
            goto LABEL_177;
          v13 = 0;
          v14 = v7;
          if (*(_BYTE *)(v7 + 2) == 61)
            goto LABEL_27;
          do
          {
            do
            {
              if (&v59[-v7] == v13)
LABEL_177:
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
              ++v13;
              v14 = (uint64_t)&v13[v7];
            }
            while (v13[v7 + 2] != 61);
LABEL_27:
            ;
          }
          while (*(_BYTE *)(v14 + 3) != 93);
          v15 = &v13[v7 + 2];
          if (v15 == a3)
            goto LABEL_177;
          memset(__dst, 170, 24);
          std::regex_traits<char>::__lookup_collatename<char const*>((uint64_t)__dst, a1, (_BYTE *)(v7 + 2), v15);
          if (SBYTE7(__dst[1]) < 0)
          {
            v16 = *((_QWORD *)&__dst[0] + 1);
            if (!*((_QWORD *)&__dst[0] + 1))
LABEL_180:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
            memset(__s, 170, 24);
            v17 = *(char **)&__dst[0];
          }
          else
          {
            v16 = BYTE7(__dst[1]);
            if (!BYTE7(__dst[1]))
              goto LABEL_180;
            v17 = (char *)__dst;
            memset(__s, 170, 24);
          }
          std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(__s, a1, (uint64_t)v17, &v17[v16]);
          v42 = (std::string::value_type *)HIBYTE(__s[2]);
          if (SHIBYTE(__s[2]) < 0)
            v42 = __s[1];
          if (v42)
          {
            v43 = *((_QWORD *)v8 + 18);
            if (v43 >= *((_QWORD *)v8 + 19))
            {
              *((_QWORD *)v8 + 18) = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)v8 + 17, (uint64_t)__s);
              if (SHIBYTE(__s[2]) < 0)
                goto LABEL_157;
            }
            else
            {
              if (SHIBYTE(__s[2]) < 0)
              {
                std::string::__init_copy_ctor_external(*((std::string **)v8 + 18), __s[0], (std::string::size_type)__s[1]);
              }
              else
              {
                v44 = *(_OWORD *)__s;
                *(std::string::value_type **)(v43 + 16) = __s[2];
                *(_OWORD *)v43 = v44;
              }
              *((_QWORD *)v8 + 18) = v43 + 24;
              *((_QWORD *)v8 + 18) = v43 + 24;
              if (SHIBYTE(__s[2]) < 0)
                goto LABEL_157;
            }
LABEL_149:
            if ((SBYTE7(__dst[1]) & 0x80000000) == 0)
              goto LABEL_150;
          }
          else
          {
            v45 = BYTE7(__dst[1]);
            if (SBYTE7(__dst[1]) < 0)
              v45 = *((_QWORD *)&__dst[0] + 1);
            if (v45 == 2)
            {
              if ((SBYTE7(__dst[1]) & 0x80u) == 0)
                v57 = (char *)__dst;
              else
                v57 = *(char **)&__dst[0];
              std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v8, *v57, v57[1]);
            }
            else
            {
              if (v45 != 1)
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
              if ((SBYTE7(__dst[1]) & 0x80u) == 0)
                v46 = (char *)__dst;
              else
                v46 = *(char **)&__dst[0];
              std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, *v46);
            }
            if ((SHIBYTE(__s[2]) & 0x80000000) == 0)
              goto LABEL_149;
LABEL_157:
            operator delete(__s[0]);
            if ((SBYTE7(__dst[1]) & 0x80000000) == 0)
            {
LABEL_150:
              v40 = 0;
              v7 += (uint64_t)(v13 + 4);
              v41 = v9;
              if ((SHIBYTE(v63) & 0x80000000) == 0)
                goto LABEL_138;
              goto LABEL_151;
            }
          }
          operator delete(*(void **)&__dst[0]);
          goto LABEL_150;
        }
        v10 = (std::basic_regex<char>::value_type *)v7;
LABEL_60:
        v7 = *(_DWORD *)(a1 + 24) & 0x1F0;
        v29 = 0;
        goto LABEL_61;
      }
      v22 = (_BYTE *)(v7 + 2);
      if ((uint64_t)&a3[-v7 - 2] < 2)
        goto LABEL_177;
      v23 = &v59[-v7];
      v24 = (std::basic_regex<char>::value_type *)(v7 + 2);
      v25 = (std::basic_regex<char>::value_type *)(v7 + 3);
      if (*v22 != 46)
        break;
LABEL_46:
      if (*v25 != 93)
        goto LABEL_44;
      if (v24 == a3)
        goto LABEL_177;
      std::regex_traits<char>::__lookup_collatename<char const*>((uint64_t)__dst, a1, v22, v24);
      if (SHIBYTE(v63) < 0)
        operator delete(__p[0]);
      *(_OWORD *)__p = __dst[0];
      v63 = *(_QWORD *)&__dst[1];
      v27 = *((_QWORD *)&__dst[0] + 1);
      if ((SBYTE7(__dst[1]) & 0x80u) == 0)
        v28 = (char *)HIBYTE(v63);
      else
        v28 = (char *)__p[1];
      if ((unint64_t)(v28 - 1) >= 2)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
      v10 = v24 + 2;
      v7 = *(_DWORD *)(a1 + 24) & 0x1F0;
      v29 = SBYTE7(__dst[1]);
      if ((SBYTE7(__dst[1]) & 0x80u) == 0)
        v27 = HIBYTE(v63);
      if (v27)
      {
        if (v10 == a3)
          goto LABEL_109;
        goto LABEL_108;
      }
LABEL_61:
      if ((v7 | 0x40) == 0x40)
      {
        v30 = *v10;
        if (v30 == 92)
        {
          v31 = v10 + 1;
          if ((_DWORD)v7)
            v32 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v31, a3, (uint64_t *)__p);
          else
            v32 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v31, (unsigned __int8 *)a3, (uint64_t)__p, (uint64_t)v8);
          v10 = v32;
          if (v32 == a3)
            goto LABEL_109;
          goto LABEL_108;
        }
      }
      else
      {
        LOBYTE(v30) = *v10;
      }
      if (v29 < 0)
      {
        v33 = __p[0];
        __p[1] = (void *)1;
        *(_BYTE *)__p[0] = v30;
        v33[1] = 0;
        if (++v10 == a3)
          goto LABEL_109;
      }
      else
      {
        HIBYTE(v63) = 1;
        LOWORD(__p[0]) = v30;
        if (++v10 == a3)
          goto LABEL_109;
      }
LABEL_108:
      v47 = *v10;
      if (v47 != 93)
      {
        v49 = v10 + 1;
        if (v10 + 1 != a3 && v47 == 45 && *v49 != 93)
        {
          memset(__s, 0, 24);
          v41 = v10 + 2;
          if (v10 + 2 == a3 || *v49 != 91 || *v41 != 46)
          {
            if ((v7 | 0x40) == 0x40)
            {
              LODWORD(v49) = *v49;
              if ((_DWORD)v49 == 92)
              {
                if ((_DWORD)v7)
                  v56 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>((std::basic_regex<char> *)a1, v10 + 2, a3, (uint64_t *)__s);
                else
                  v56 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>((std::basic_regex<char> *)a1, (unsigned __int8 *)v10 + 2, (unsigned __int8 *)a3, (uint64_t)__s, (uint64_t)v8);
                v41 = v56;
                goto LABEL_161;
              }
            }
            else
            {
              LOBYTE(v49) = *v49;
            }
            HIBYTE(__s[2]) = 1;
            LOWORD(__s[0]) = v49;
            goto LABEL_161;
          }
          v50 = v10 + 3;
          if (a3 - (v10 + 3) < 2)
            goto LABEL_179;
          v51 = a3 - 5 - v10;
          v52 = v10 + 3;
          v53 = v50 + 1;
          if (*v50 == 46)
            goto LABEL_127;
          do
          {
            do
            {
              if (!v51)
                goto LABEL_179;
              --v51;
              v52 = v53;
              v54 = *v53++;
            }
            while (v54 != 46);
LABEL_127:
            ;
          }
          while (*v53 != 93);
          if (v52 == a3)
LABEL_179:
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
          std::regex_traits<char>::__lookup_collatename<char const*>((uint64_t)__dst, a1, v50, v52);
          if (SHIBYTE(__s[2]) < 0)
            operator delete(__s[0]);
          __s[2] = *(std::string::value_type **)&__dst[1];
          *(_OWORD *)__s = __dst[0];
          v55 = (std::string::value_type *)HIBYTE(*(_QWORD *)&__dst[1]);
          if (SBYTE7(__dst[1]) < 0)
            v55 = __s[1];
          if ((unint64_t)(v55 - 1) >= 2)
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
          v41 = v52 + 2;
LABEL_161:
          __dst[0] = *(_OWORD *)__p;
          *(_QWORD *)&__dst[1] = v63;
          __p[1] = 0;
          v63 = 0;
          __p[0] = 0;
          *(_OWORD *)v60 = *(_OWORD *)__s;
          v61 = __s[2];
          memset(__s, 0, 24);
          std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100]((uint64_t)v8, (char *)__dst, (uint64_t)v60);
          if (SHIBYTE(v61) < 0)
          {
            operator delete(v60[0]);
            if (SBYTE7(__dst[1]) < 0)
              goto LABEL_167;
LABEL_163:
            if ((SHIBYTE(__s[2]) & 0x80000000) == 0)
              goto LABEL_164;
LABEL_168:
            operator delete(__s[0]);
            v40 = 1;
            if ((SHIBYTE(v63) & 0x80000000) == 0)
              goto LABEL_138;
          }
          else
          {
            if ((SBYTE7(__dst[1]) & 0x80000000) == 0)
              goto LABEL_163;
LABEL_167:
            operator delete(*(void **)&__dst[0]);
            if (SHIBYTE(__s[2]) < 0)
              goto LABEL_168;
LABEL_164:
            v40 = 1;
            if ((SHIBYTE(v63) & 0x80000000) == 0)
              goto LABEL_138;
          }
LABEL_151:
          operator delete(__p[0]);
          v10 = v41;
          if ((v40 & 1) == 0)
            goto LABEL_15;
          goto LABEL_14;
        }
      }
LABEL_109:
      if (SHIBYTE(v63) < 0)
      {
        if (__p[1])
        {
          if (__p[1] == (void *)1)
          {
            v48 = (void **)__p[0];
LABEL_116:
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, *(char *)v48);
LABEL_137:
            v40 = 1;
            v41 = v10;
            if ((SHIBYTE(v63) & 0x80000000) == 0)
              goto LABEL_138;
            goto LABEL_151;
          }
          v48 = (void **)__p[0];
LABEL_136:
          std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v8, *(char *)v48, *((char *)v48 + 1));
          goto LABEL_137;
        }
        operator delete(__p[0]);
      }
      else if (HIBYTE(v63))
      {
        v48 = __p;
        if (HIBYTE(v63) == 1)
          goto LABEL_116;
        goto LABEL_136;
      }
LABEL_14:
      v7 = (uint64_t)v10;
LABEL_15:
      if ((std::basic_regex<char>::value_type *)v7 == v9)
      {
        if (v9 != a3)
        {
          if (*v9 == 45)
          {
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 45);
            ++v9;
          }
          if (v9 != a3 && *v9 == 93)
            return v9 + 1;
        }
LABEL_178:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      }
    }
    do
    {
LABEL_44:
      if (!v23)
        goto LABEL_177;
      --v23;
      v24 = v25;
      v26 = *v25++;
    }
    while (v26 != 46);
    goto LABEL_46;
  }
  return a2;
}

void sub_2124703F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  *(_QWORD *)(v32 + 144) = v33;
  if (a32 < 0)
    operator delete(__p);
  if (*(char *)(v34 - 89) < 0)
    operator delete(*(void **)(v34 - 112));
  if (a25 < 0)
    operator delete(a20);
  _Unwind_Resume(exception_object);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(uint64_t a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  int v6;
  int locale_low;
  std::basic_regex<char> *v8;
  char *v9;
  size_t v10;
  char *v11;
  int v12;
  int v13;
  char *v14;
  int v15;
  int v16;
  std::basic_regex<char> *v17;
  unsigned __int8 *v18;
  BOOL v20;
  std::basic_regex<char> *v21;
  BOOL v22;
  char *v23;
  size_t v24;
  std::basic_regex<char> *v25;
  int v26;
  int v27;
  std::basic_regex<char> *v28;
  int v29;
  std::basic_regex<char> *v30;
  _BYTE *v31;

  if (this == a3)
    return this;
  v6 = *(_DWORD *)(a1 + 24) & 0x1F0;
  locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low <= 62)
  {
    if (locale_low == 42)
    {
      v8 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (v6)
        v20 = 1;
      else
        v20 = v8 == a3;
      if (!v20 && LOBYTE(v8->__traits_.__loc_.__locale_) == 63)
      {
        v9 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        v10 = 0;
        goto LABEL_35;
      }
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
      v24 = 0;
      goto LABEL_44;
    }
    if (locale_low == 43)
    {
      v8 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (!v6 && v8 != a3 && LOBYTE(v8->__traits_.__loc_.__locale_) == 63)
      {
        v9 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        v10 = 1;
LABEL_35:
        std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v10, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 0);
        return (std::basic_regex<char> *)v9;
      }
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
      v24 = 1;
      goto LABEL_44;
    }
    return this;
  }
  if (locale_low == 63)
  {
    v21 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
    if (v6)
      v22 = 1;
    else
      v22 = v21 == a3;
    if (v22 || LOBYTE(v21->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 1);
      return v21;
    }
    else
    {
      v23 = (char *)&this->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v23;
    }
  }
  else
  {
    if (locale_low != 123)
      return this;
    v11 = (char *)&this->__traits_.__loc_.__locale_ + 1;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3)
      goto LABEL_71;
    v12 = *v11;
    if ((v12 & 0xF8) != 0x30 && (v12 & 0xFE) != 0x38)
      goto LABEL_71;
    v13 = v12 - 48;
    v14 = (char *)&this->__traits_.__loc_.__locale_ + 2;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_19:
      v14 = (char *)a3;
    }
    else
    {
      while (1)
      {
        v15 = *v14;
        if ((v15 & 0xF8) != 0x30 && (v15 & 0xFE) != 0x38)
          break;
        if (v13 >= 214748364)
          goto LABEL_71;
        v13 = v15 + 10 * v13 - 48;
        if (++v14 == (char *)a3)
          goto LABEL_19;
      }
    }
    if (v14 == v11)
      goto LABEL_71;
    if (v14 == (char *)a3)
      goto LABEL_72;
    v16 = *v14;
    if (v16 != 44)
    {
      if (v16 == 125)
      {
        v17 = (std::basic_regex<char> *)(v14 + 1);
        if (v6 || v17 == a3 || LOBYTE(v17->__traits_.__loc_.__locale_) != 63)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v13, a4, __mexp_begin, __mexp_end, 1);
          return v17;
        }
        else
        {
          v18 = (unsigned __int8 *)(v14 + 2);
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v13, a4, __mexp_begin, __mexp_end, 0);
          return (std::basic_regex<char> *)v18;
        }
      }
LABEL_71:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
    }
    v25 = (std::basic_regex<char> *)(v14 + 1);
    if (v14 + 1 == (char *)a3)
      goto LABEL_71;
    v26 = LOBYTE(v25->__traits_.__loc_.__locale_);
    if (v26 == 125)
    {
      v8 = (std::basic_regex<char> *)(v14 + 2);
      if (!v6 && v8 != a3 && LOBYTE(v8->__traits_.__loc_.__locale_) == 63)
      {
        v10 = v13;
        v9 = v14 + 3;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        goto LABEL_35;
      }
      v24 = v13;
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
LABEL_44:
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v24, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
      return v8;
    }
    if ((v26 & 0xF8) != 0x30 && (v26 & 0xFE) != 0x38)
      goto LABEL_72;
    v27 = v26 - 48;
    v28 = (std::basic_regex<char> *)(v14 + 2);
    if (v28 == a3)
    {
LABEL_60:
      v28 = a3;
    }
    else
    {
      while (1)
      {
        v29 = LOBYTE(v28->__traits_.__loc_.__locale_);
        if ((v29 & 0xF8) != 0x30 && (v29 & 0xFE) != 0x38)
          break;
        if (v27 >= 214748364)
          goto LABEL_71;
        v27 = v29 + 10 * v27 - 48;
        v28 = (std::basic_regex<char> *)((char *)v28 + 1);
        if (v28 == a3)
          goto LABEL_60;
      }
    }
    if (v28 == v25 || v28 == a3 || LOBYTE(v28->__traits_.__loc_.__locale_) != 125)
LABEL_72:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    if (v27 < v13)
      goto LABEL_71;
    v30 = (std::basic_regex<char> *)((char *)&v28->__traits_.__loc_.__locale_ + 1);
    if (v6 || v30 == a3 || LOBYTE(v30->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v27, a4, __mexp_begin, __mexp_end, 1);
      return v30;
    }
    else
    {
      v31 = (char *)&v28->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v13, v27, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v31;
    }
  }
}

void std::basic_regex<char,std::regex_traits<char>>::__push_loop(std::basic_regex<char> *this, size_t __min, size_t __max, std::__owns_one_state<char> *__s, size_t __mexp_begin, size_t __mexp_end, BOOL __greedy)
{
  int v8;
  int v9;
  _QWORD *v14;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  void *v17;
  std::__node<char> *v18;
  std::__node<char> *v19;

  v8 = __mexp_end;
  v9 = __mexp_begin;
  v14 = operator new(0x10uLL);
  end = this->__end_;
  first = end->__first_;
  v14[1] = first;
  end->__first_ = 0;
  v17 = operator new(0x38uLL);
  LODWORD(first) = this->__loop_count_;
  v18 = __s->__first_;
  *(_QWORD *)v17 = &off_24CDC1150;
  *((_QWORD *)v17 + 1) = v18;
  *((_QWORD *)v17 + 2) = v14;
  *((_QWORD *)v17 + 3) = __min;
  *((_QWORD *)v17 + 4) = __max;
  *((_DWORD *)v17 + 10) = (_DWORD)first;
  *((_DWORD *)v17 + 11) = v9;
  *((_DWORD *)v17 + 12) = v8;
  *((_BYTE *)v17 + 52) = __greedy;
  __s->__first_ = 0;
  v19 = (std::__node<char> *)operator new(0x10uLL);
  v19->__vftable = (std::__node<char>_vtbl *)off_24CDC11E0;
  v19[1].__vftable = (std::__node<char>_vtbl *)v17;
  this->__end_->__first_ = v19;
  this->__end_ = (std::__owns_one_state<char> *)*((_QWORD *)v17 + 2);
  __s->__first_ = (std::__node<char> *)v17;
  this->__loop_count_ = (_DWORD)first + 1;
}

void sub_2124709B0(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);

  std::__loop<char>::~__loop(v1);
  _Unwind_Resume(a1);
}

void sub_2124709C4(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);
  uint64_t v2;

  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(uint64_t a1, char *a2, char *a3)
{
  int v6;
  char *v7;
  BOOL v8;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (**v14)();
  int v15;
  char *v16;
  uint64_t v17;
  char *v18;
  int v20;
  __int128 v21;
  char *v22;
  unsigned int v23;
  uint64_t v24;
  __int128 v25;
  unsigned int marked_count;
  std::basic_regex<char> v27;

  if (a2 == a3)
    return a2;
  v6 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 != a3)
      {
        v15 = a2[1];
        if (v15 == 66)
        {
          v16 = (char *)operator new(0x30uLL);
          v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          *(_QWORD *)v16 = off_24CDC0DF0;
          *((_QWORD *)v16 + 1) = v24;
          std::locale::locale((std::locale *)v16 + 2, (const std::locale *)a1);
          *(_OWORD *)(v16 + 24) = *(_OWORD *)(a1 + 8);
          v16[40] = 1;
        }
        else
        {
          if (v15 != 98)
            return a2;
          v16 = (char *)operator new(0x30uLL);
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          *(_QWORD *)v16 = off_24CDC0DF0;
          *((_QWORD *)v16 + 1) = v17;
          std::locale::locale((std::locale *)v16 + 2, (const std::locale *)a1);
          *(_OWORD *)(v16 + 24) = *(_OWORD *)(a1 + 8);
          v16[40] = 0;
        }
        *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v16;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        return a2 + 2;
      }
      return a2;
    }
    if (v6 != 94)
      return a2;
    v10 = operator new(0x18uLL);
    v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(v12 + 8);
    v14 = &off_24CDC0D60;
LABEL_14:
    *v10 = v14;
    v10[1] = v13;
    *((_BYTE *)v10 + 16) = v11;
    *(_QWORD *)(v12 + 8) = v10;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    return a2 + 1;
  }
  if (v6 == 36)
  {
    v10 = operator new(0x18uLL);
    v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(v12 + 8);
    v14 = &off_24CDC0DA8;
    goto LABEL_14;
  }
  v8 = v6 == 40;
  v7 = a2 + 1;
  v8 = !v8 || v7 == a3;
  if (v8)
    return a2;
  v8 = *v7 == 63;
  v18 = a2 + 2;
  if (!v8 || v18 == a3)
    return a2;
  v20 = *v18;
  if (v20 == 33)
  {
    *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v27.__loop_count_ = v25;
    *(_OWORD *)&v27.__start_.__cntrl_ = v25;
    *(_OWORD *)&v27.__traits_.__loc_.__locale_ = v25;
    *(_OWORD *)&v27.__traits_.__col_ = v25;
    std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v27);
    v27.__flags_ = *(_DWORD *)(a1 + 24);
    v22 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v27, a2 + 3, a3);
    marked_count = v27.__marked_count_;
    std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v27, 1, *(_DWORD *)(a1 + 28));
    *(_DWORD *)(a1 + 28) += marked_count;
    if (v22 == a3 || *v22 != 41)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    goto LABEL_32;
  }
  if (v20 != 61)
    return a2;
  *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v27.__loop_count_ = v21;
  *(_OWORD *)&v27.__start_.__cntrl_ = v21;
  *(_OWORD *)&v27.__traits_.__loc_.__locale_ = v21;
  *(_OWORD *)&v27.__traits_.__col_ = v21;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v27);
  v27.__flags_ = *(_DWORD *)(a1 + 24);
  v22 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(&v27, a2 + 3, a3);
  v23 = v27.__marked_count_;
  std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v27, 0, *(_DWORD *)(a1 + 28));
  *(_DWORD *)(a1 + 28) += v23;
  if (v22 == a3 || *v22 != 41)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
LABEL_32:
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v27.__traits_.__loc_);
  return v22 + 1;
}

void sub_212470CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_212470CFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_212470D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_212470D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>(std::basic_regex<char> *this, std::basic_regex<char>::value_type *a2, char *a3)
{
  std::basic_regex<char>::value_type *v3;
  int v5;
  char *v7;
  std::__node<char> *v9;
  std::__owns_one_state<char> *v10;
  std::__node<char> *v11;
  int *p_open_count;
  char *v13;
  unsigned __int8 *v14;
  int v15;
  unsigned int v16;
  std::__node<char> *v17;
  unsigned int marked_count;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  char *v21;
  std::__node<char> *v22;
  std::__owns_one_state<char> *v23;
  std::__node<char> *v24;
  int v25;
  std::__owns_one_state<char> *v26;
  unsigned __int8 *v27;
  std::__owns_one_state<char> *v28;
  int v29;

  v3 = a2;
  if (a2 == a3)
    return a2;
  v5 = *a2;
  v7 = a2;
  switch(*a2)
  {
    case '$':
    case ')':
    case ']':
    case '^':
    case '|':
    case '}':
      return v7;
    case '(':
      if (a2 + 1 == a3)
        goto LABEL_56;
      if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
      {
        p_open_count = &this->__open_count_;
        ++this->__open_count_;
        v13 = std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, a2 + 3, a3);
        if (v13 == a3)
          goto LABEL_56;
        v3 = v13;
        if (*v13 != 41)
          goto LABEL_56;
      }
      else
      {
        if ((this->__flags_ & 2) != 0)
        {
          marked_count = this->__marked_count_;
        }
        else
        {
          v17 = (std::__node<char> *)operator new(0x18uLL);
          marked_count = this->__marked_count_ + 1;
          this->__marked_count_ = marked_count;
          end = this->__end_;
          first = end->__first_;
          v17->__vftable = (std::__node<char>_vtbl *)&off_24CDC10C0;
          v17[1].__vftable = (std::__node<char>_vtbl *)first;
          LODWORD(v17[2].__vftable) = marked_count;
          end->__first_ = v17;
          this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
        }
        p_open_count = &this->__open_count_;
        ++this->__open_count_;
        v21 = std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<char const*>(this, v3 + 1, a3);
        if (v21 == a3 || (v3 = v21, *v21 != 41))
LABEL_56:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
        if ((this->__flags_ & 2) == 0)
        {
          v22 = (std::__node<char> *)operator new(0x18uLL);
          v23 = this->__end_;
          v24 = v23->__first_;
          v22->__vftable = (std::__node<char>_vtbl *)&off_24CDC1108;
          v22[1].__vftable = (std::__node<char>_vtbl *)v24;
          LODWORD(v22[2].__vftable) = marked_count;
          v23->__first_ = v22;
          this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
        }
      }
      --*p_open_count;
      return v3 + 1;
    case '*':
    case '+':
    case '?':
    case '{':
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
    case '.':
      v9 = (std::__node<char> *)operator new(0x10uLL);
      v10 = this->__end_;
      v11 = v10->__first_;
      v9->__vftable = (std::__node<char>_vtbl *)&off_24CDC0E80;
      v9[1].__vftable = (std::__node<char>_vtbl *)v11;
      v10->__first_ = v9;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      return v3 + 1;
    case '[':
      return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, a3);
    case '\\':
      if (v5 != 92)
        return a2;
      v14 = (unsigned __int8 *)(a2 + 1);
      if (a2 + 1 == a3)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
      v15 = *v14;
      v16 = v15 - 48;
      if (v15 != 48)
      {
        if ((v15 - 49) <= 8)
        {
          v7 = v3 + 2;
          if (v3 + 2 == a3)
          {
            v7 = a3;
          }
          else
          {
            while (1)
            {
              v25 = *v7;
              if ((v25 - 48) > 9)
                break;
              if (v16 >= 0x19999999)
                goto LABEL_57;
              ++v7;
              v16 = v25 + 10 * v16 - 48;
              if (v7 == a3)
              {
                v7 = a3;
                break;
              }
            }
            if (!v16)
LABEL_57:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
          }
          if (v16 > this->__marked_count_)
            goto LABEL_57;
          std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, v16);
          if (v7 != (char *)v14)
            return v7;
          LOBYTE(v15) = *v14;
        }
        switch((char)v15)
        {
          case 'D':
            v26 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v26, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_48;
          case 'S':
            v26 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v26, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_52;
          case 'W':
            v28 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v28, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_50;
          case 'd':
            v26 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v26, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_48:
            this->__end_->__first_ = v26;
            this->__end_ = v26;
            v29 = LODWORD(v26[10].__vftable) | 0x400;
            goto LABEL_53;
          case 's':
            v26 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v26, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_52:
            this->__end_->__first_ = v26;
            this->__end_ = v26;
            v29 = LODWORD(v26[10].__vftable) | 0x4000;
LABEL_53:
            LODWORD(v26[10].__vftable) = v29;
            break;
          case 'w':
            v28 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v28, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_50:
            this->__end_->__first_ = v28;
            this->__end_ = v28;
            LODWORD(v28[10].__vftable) |= 0x500u;
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v28, 95);
            break;
          default:
            v27 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(this, (unsigned __int8 *)v3 + 1, (unsigned __int8 *)a3, 0);
            if (v27 == v14)
              return v3;
            else
              return (std::basic_regex<char>::value_type *)v27;
        }
        return v3 + 2;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v16);
      return v3 + 2;
    default:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v5);
      return v3 + 1;
  }
}

void sub_212471218(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21247122C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212471240(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212471254(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_212471268(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_21247127C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void Timestamp::Timestamp(Timestamp *this)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  char *v7;
  uint64_t v8;
  uint64_t *v9;
  int *v10;
  char *v11;
  unsigned __int128 v12;
  uint8_t buf[4];
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)this + 1) = 0;
  v2 = (_QWORD *)((char *)this + 8);
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = (char *)this + 8;
  v12 = 0uLL;
  if ((gettimeofday((timeval *)&v12, 0) & 0x80000000) == 0
    || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v3 = *v2;
    v4 = v2;
    if (*v2)
      goto LABEL_4;
LABEL_10:
    v7 = (char *)operator new(0x38uLL);
    *((_DWORD *)v7 + 8) = 0;
    *((_QWORD *)v7 + 5) = 0;
    *((_QWORD *)v7 + 6) = 0;
    *(_QWORD *)v7 = 0;
    *((_QWORD *)v7 + 1) = 0;
    *((_QWORD *)v7 + 2) = v4;
    *v2 = v7;
    v8 = **(_QWORD **)this;
    v9 = (uint64_t *)v7;
    if (v8)
    {
      *(_QWORD *)this = v8;
      v9 = (uint64_t *)*v2;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)this + 1), v9);
    ++*((_QWORD *)this + 2);
    goto LABEL_13;
  }
  v10 = __error();
  v11 = strerror(*v10);
  *(_DWORD *)buf = 136315138;
  v14 = v11;
  _os_log_error_impl(&dword_21246D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to get current time. Error: %s\n", buf, 0xCu);
  v3 = *v2;
  v4 = v2;
  if (!*v2)
    goto LABEL_10;
LABEL_4:
  v5 = v3;
  while (1)
  {
    while (1)
    {
      v4 = (_QWORD *)v5;
      v6 = *(_DWORD *)(v5 + 32);
      if (v6 < 1)
        break;
      v5 = *v4;
      v2 = v4;
      if (!*v4)
        goto LABEL_10;
    }
    if ((v6 & 0x80000000) == 0)
      break;
    v5 = v4[1];
    if (!v5)
    {
      v2 = v4 + 1;
      goto LABEL_10;
    }
  }
  v7 = (char *)v4;
LABEL_13:
  *(_OWORD *)(v7 + 40) = v12;
}

void sub_21247141C(_Unwind_Exception *a1)
{
  _QWORD **v1;

  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

void sub_212471434(_Unwind_Exception *a1)
{
  _QWORD *v1;

  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v1);
  _Unwind_Resume(a1);
}

void Timestamp::Timestamp(Timestamp *this, const Timestamp *a2)
{
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = (char *)this + 8;
  std::map<Timestamp::TimeDomain,timeval>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Timestamp::TimeDomain,timeval>,std::__tree_node<std::__value_type<Timestamp::TimeDomain,timeval>,void *> *,long>>>((uint64_t *)this, *(_QWORD **)a2, (_QWORD *)a2 + 1);
}

{
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = (char *)this + 8;
  std::map<Timestamp::TimeDomain,timeval>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Timestamp::TimeDomain,timeval>,std::__tree_node<std::__value_type<Timestamp::TimeDomain,timeval>,void *> *,long>>>((uint64_t *)this, *(_QWORD **)a2, (_QWORD *)a2 + 1);
}

void sub_212471488(_Unwind_Exception *a1)
{
  _QWORD **v1;

  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

void sub_2124714D8(_Unwind_Exception *a1)
{
  _QWORD **v1;

  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

_QWORD *Timestamp::Timestamp(_QWORD *a1, _OWORD *a2, int a3)
{
  _QWORD *v6;
  char *v7;

  a1[2] = 0;
  a1[1] = 0;
  v6 = a1 + 1;
  *a1 = a1 + 1;
  v7 = (char *)operator new(0x38uLL);
  *((_DWORD *)v7 + 8) = a3;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = v6;
  *v6 = v7;
  *a1 = v7;
  v7[24] = 1;
  a1[2] = 1;
  *(_OWORD *)(v7 + 40) = *a2;
  return a1;
}

{
  _QWORD *v6;
  char *v7;

  a1[2] = 0;
  a1[1] = 0;
  v6 = a1 + 1;
  *a1 = a1 + 1;
  v7 = (char *)operator new(0x38uLL);
  *((_DWORD *)v7 + 8) = a3;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = v6;
  *v6 = v7;
  *a1 = v7;
  v7[24] = 1;
  a1[2] = 1;
  *(_OWORD *)(v7 + 40) = *a2;
  return a1;
}

__n128 Timestamp::set(uint64_t **a1, __n128 *a2, int a3)
{
  char *v6;
  uint64_t **v7;
  char *v8;
  int v9;
  char *v10;
  uint64_t *v11;
  uint64_t *v12;
  __n128 result;

  v7 = a1 + 1;
  v6 = (char *)a1[1];
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        v8 = v6;
        v9 = *((_DWORD *)v6 + 8);
        if (v9 <= a3)
          break;
        v6 = *(char **)v8;
        v7 = (uint64_t **)v8;
        if (!*(_QWORD *)v8)
          goto LABEL_8;
      }
      if (v9 >= a3)
        break;
      v6 = (char *)*((_QWORD *)v8 + 1);
      if (!v6)
      {
        v7 = (uint64_t **)(v8 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
    v8 = (char *)(a1 + 1);
LABEL_8:
    v10 = v8;
    v8 = (char *)operator new(0x38uLL);
    *((_DWORD *)v8 + 8) = a3;
    *((_QWORD *)v8 + 5) = 0;
    *((_QWORD *)v8 + 6) = 0;
    *(_QWORD *)v8 = 0;
    *((_QWORD *)v8 + 1) = 0;
    *((_QWORD *)v8 + 2) = v10;
    *v7 = (uint64_t *)v8;
    v11 = (uint64_t *)**a1;
    v12 = (uint64_t *)v8;
    if (v11)
    {
      *a1 = v11;
      v12 = *v7;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v12);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  result = *a2;
  *(__n128 *)(v8 + 40) = *a2;
  return result;
}

_QWORD *Timestamp::Timestamp(_QWORD *a1, uint64_t a2, int a3)
{
  _QWORD *v6;
  _DWORD *v7;

  a1[2] = 0;
  a1[1] = 0;
  v6 = a1 + 1;
  *a1 = a1 + 1;
  v7 = operator new(0x38uLL);
  v7[8] = a3;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = v6;
  *v6 = v7;
  *a1 = v7;
  *((_BYTE *)v7 + 24) = 1;
  a1[2] = 1;
  *((_QWORD *)v7 + 5) = a2;
  *((_QWORD *)v7 + 6) = 0xAAAAAAAAAAAAAAAALL;
  return a1;
}

{
  _QWORD *v6;
  _DWORD *v7;

  a1[2] = 0;
  a1[1] = 0;
  v6 = a1 + 1;
  *a1 = a1 + 1;
  v7 = operator new(0x38uLL);
  v7[8] = a3;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = v6;
  *v6 = v7;
  *a1 = v7;
  *((_BYTE *)v7 + 24) = 1;
  a1[2] = 1;
  *((_QWORD *)v7 + 5) = a2;
  *((_QWORD *)v7 + 6) = 0xAAAAAAAAAAAAAAAALL;
  return a1;
}

uint64_t **Timestamp::Timestamp(uint64_t **a1, char *a2, char a3, int a4)
{
  const char *v5;
  uint64_t **v7;
  int *v8;
  char *v9;
  NSObject *v10;
  const char *v11;
  uint64_t *v12;
  uint64_t **v13;
  _QWORD *v14;
  int v15;
  char *v16;
  uint64_t *v17;
  uint64_t *v18;
  int *v20;
  char *v21;
  int *v22;
  char *v23;
  unsigned __int128 v24;
  tm v25;
  void *__p[4];
  uint8_t buf[4];
  char *v28;
  uint64_t v29;

  v5 = a2;
  v29 = *MEMORY[0x24BDAC8D0];
  a1[1] = 0;
  v7 = a1 + 1;
  a1[2] = 0;
  *a1 = (uint64_t *)(a1 + 1);
  __p[2] = (void *)0x11AAAAAAAAAA0053;
  *(_OWORD *)__p = *(_OWORD *)"%Y-%m-%d-%H-%M-%S";
  if ((a3 & 0x10) != 0)
  {
    HIBYTE(__p[2]) = 19;
    strcpy((char *)__p, "%Y.%m.%d_%H-%M-%S%z");
  }
  *((_QWORD *)&v24 + 1) = 0xAAAAAAAA00000000;
  memset(&v25, 0, sizeof(v25));
  if (a2[23] < 0)
    v5 = *(const char **)a2;
  if (strptime(v5, (const char *)__p, &v25))
  {
    v25.tm_isdst = -1;
    *(_QWORD *)&v24 = mktime(&v25);
    if ((_QWORD)v24 != -1)
      goto LABEL_15;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      v20 = __error();
      v21 = strerror(*v20);
      *(_DWORD *)buf = 136315138;
      v28 = v21;
      _os_log_error_impl(&dword_21246D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to convert to absolute time. Error: %s\n", buf, 0xCu);
      v24 = 0uLL;
      if ((gettimeofday((timeval *)&v24, 0) & 0x80000000) == 0)
        goto LABEL_15;
    }
    else
    {
      v24 = 0uLL;
      if ((gettimeofday((timeval *)&v24, 0) & 0x80000000) == 0)
        goto LABEL_15;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v8 = __error();
    v9 = strerror(*v8);
    *(_DWORD *)buf = 136315138;
    v28 = v9;
    v10 = MEMORY[0x24BDACB70];
    v11 = "Failed to get current time after absolute time conversion failed. Error: %s\n";
    goto LABEL_32;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21246D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to convert time from string format\n", buf, 2u);
  }
  v24 = 0uLL;
  if (gettimeofday((timeval *)&v24, 0) < 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v22 = __error();
    v23 = strerror(*v22);
    *(_DWORD *)buf = 136315138;
    v28 = v23;
    v10 = MEMORY[0x24BDACB70];
    v11 = "Failed to get current time after conversion failure. Error: %s\n";
LABEL_32:
    _os_log_error_impl(&dword_21246D000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0xCu);
  }
LABEL_15:
  v12 = *v7;
  v13 = v7;
  v14 = v7;
  if (*v7)
  {
    while (1)
    {
      while (1)
      {
        v14 = v12;
        v15 = *((_DWORD *)v12 + 8);
        if (v15 <= a4)
          break;
        v12 = (uint64_t *)*v14;
        v13 = (uint64_t **)v14;
        if (!*v14)
          goto LABEL_22;
      }
      if (v15 >= a4)
        break;
      v12 = (uint64_t *)v14[1];
      if (!v12)
      {
        v13 = (uint64_t **)(v14 + 1);
        goto LABEL_22;
      }
    }
    *(_OWORD *)(v14 + 5) = v24;
    if (SHIBYTE(__p[2]) < 0)
      goto LABEL_25;
  }
  else
  {
LABEL_22:
    v16 = (char *)operator new(0x38uLL);
    *((_DWORD *)v16 + 8) = a4;
    *((_QWORD *)v16 + 5) = 0;
    *((_QWORD *)v16 + 6) = 0;
    *(_QWORD *)v16 = 0;
    *((_QWORD *)v16 + 1) = 0;
    *((_QWORD *)v16 + 2) = v14;
    *v13 = (uint64_t *)v16;
    v17 = (uint64_t *)**a1;
    v18 = (uint64_t *)v16;
    if (v17)
    {
      *a1 = v17;
      v18 = *v13;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v18);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    *(_OWORD *)(v16 + 40) = v24;
    if (SHIBYTE(__p[2]) < 0)
LABEL_25:
      operator delete(__p[0]);
  }
  return a1;
}

void sub_212471ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  _QWORD **v24;

  if (a24 < 0)
    operator delete(__p);
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(*v24);
  _Unwind_Resume(a1);
}

uint64_t Timestamp::get(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  uint64_t *v9;

  *a2 = 0;
  a2[1] = 0;
  v5 = *(_QWORD *)(a1 + 8);
  v3 = a1 + 8;
  v4 = v5;
  if (!v5)
    return 0;
  v6 = v3;
  do
  {
    v7 = *(_DWORD *)(v4 + 32);
    v8 = v7 < a3;
    if (v7 >= a3)
      v9 = (uint64_t *)v4;
    else
      v9 = (uint64_t *)(v4 + 8);
    if (!v8)
      v6 = v4;
    v4 = *v9;
  }
  while (*v9);
  if (v6 == v3 || *(_DWORD *)(v6 + 32) > a3)
    return 0;
  *(_OWORD *)a2 = *(_OWORD *)(v6 + 40);
  return 1;
}

uint64_t Timestamp::now(timeval *this, timeval *a2)
{
  return gettimeofday(this, 0);
}

uint64_t Timestamp::asString@<X0>(uint64_t a1@<X0>, int a2@<W1>, char a3@<W2>, _BYTE *a4@<X8>)
{
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::ios_base *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  BOOL v22;
  uint64_t *v23;
  _BYTE *v24;
  time_t v25;
  __int128 v26;
  const char *v27;
  size_t v28;
  uint64_t v29;
  char *v30;
  const std::locale::facet *v31;
  size_t v32;
  uint64_t v33;
  const void *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  tm v41;
  time_t v42;
  _QWORD v43[2];
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 __p;
  __int128 v50;
  unint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  std::locale v62;
  char __s[16];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v61 = v7;
  v51 = 0xAAAAAAAAAAAAAAAALL;
  v60 = v7;
  v59 = v7;
  v58 = v7;
  v57 = v7;
  v56 = v7;
  v55 = v7;
  v54 = v7;
  v53 = v7;
  v50 = v7;
  __p = v7;
  v48 = v7;
  v47 = v7;
  v46 = v7;
  v45 = v7;
  v8 = MEMORY[0x24BEDB858];
  v9 = MEMORY[0x24BEDB858] + 104;
  v52 = MEMORY[0x24BEDB858] + 104;
  v10 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v11 = MEMORY[0x24BEDB858] + 64;
  v12 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v13 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  v44 = MEMORY[0x24BEDB858] + 64;
  v43[0] = v12;
  *(_QWORD *)((char *)v43 + *(_QWORD *)(v12 - 24)) = v13;
  v43[1] = 0;
  v14 = (std::ios_base *)((char *)v43 + *(_QWORD *)(v43[0] - 24));
  std::ios_base::init(v14, &v45);
  v14[1].__vftable = 0;
  v14[1].__fmtflags_ = -1;
  v15 = v10[5];
  v44 = v10[4];
  *(uint64_t *)((char *)&v44 + *(_QWORD *)(v44 - 24)) = v15;
  v43[0] = v10[1];
  *(_QWORD *)((char *)v43 + *(_QWORD *)(v43[0] - 24)) = v10[6];
  v52 = v9;
  v43[0] = v8 + 24;
  v44 = v11;
  std::streambuf::basic_streambuf();
  v16 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v45 = MEMORY[0x24BEDB848] + 16;
  __p = 0u;
  v50 = 0u;
  LODWORD(v51) = 24;
  v19 = *(_QWORD *)(a1 + 8);
  v18 = a1 + 8;
  v17 = v19;
  if (!v19)
    goto LABEL_13;
  v20 = v18;
  do
  {
    v21 = *(_DWORD *)(v17 + 32);
    v22 = v21 < a2;
    if (v21 >= a2)
      v23 = (uint64_t *)v17;
    else
      v23 = (uint64_t *)(v17 + 8);
    if (!v22)
      v20 = v17;
    v17 = *v23;
  }
  while (*v23);
  if (v20 == v18)
  {
LABEL_13:
    v25 = 0;
    v24 = a4;
    if ((a3 & 0x11) != 0)
      goto LABEL_14;
    goto LABEL_22;
  }
  v24 = a4;
  if (*(_DWORD *)(v20 + 32) <= a2)
  {
    v25 = *(_QWORD *)(v20 + 40);
    if ((a3 & 0x11) != 0)
      goto LABEL_14;
LABEL_22:
    std::ostream::operator<<();
    if ((a3 & 4) != 0 || (a3 & 8) != 0)
    {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v44, (uint64_t)".", 1);
      std::ostream::operator<<();
    }
    goto LABEL_25;
  }
  v25 = 0;
  if ((a3 & 0x11) == 0)
    goto LABEL_22;
LABEL_14:
  v41.tm_zone = (char *)0xAAAAAAAAAAAAAAAALL;
  v42 = v25;
  *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v41.tm_mon = v26;
  *(_OWORD *)&v41.tm_isdst = v26;
  *(_OWORD *)&v41.tm_sec = v26;
  localtime_r(&v42, &v41);
  v65 = 0u;
  v66 = 0u;
  *(_OWORD *)__s = 0u;
  v64 = 0u;
  if ((a3 & 0x10) != 0)
    v27 = "%Y.%m.%d_%H-%M-%S%z";
  else
    v27 = "%Y-%m-%d-%H-%M-%S";
  strftime(__s, 0x40uLL, v27, &v41);
  v28 = strlen(__s);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v44, (uint64_t)__s, v28);
  if ((a3 & 8) != 0)
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v44, (uint64_t)"-", 1);
    v29 = v44;
    v30 = (char *)&v44 + *(_QWORD *)(v44 - 24);
    if (*((_DWORD *)v30 + 36) == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)&v44 + *(_QWORD *)(v44 - 24)));
      v31 = std::locale::use_facet(&v62, MEMORY[0x24BEDB350]);
      ((void (*)(const std::locale::facet *, uint64_t))v31->__vftable[2].~facet_0)(v31, 32);
      std::locale::~locale(&v62);
      v29 = v44;
    }
    *((_DWORD *)v30 + 36) = 48;
    *(_QWORD *)((char *)&v46 + *(_QWORD *)(v29 - 24)) = 3;
    std::ostream::operator<<();
  }
LABEL_25:
  if ((v51 & 0x10) != 0)
  {
    v33 = *((_QWORD *)&v50 + 1);
    if (*((_QWORD *)&v50 + 1) < (unint64_t)v48)
    {
      *((_QWORD *)&v50 + 1) = v48;
      v33 = v48;
    }
    v34 = (const void *)*((_QWORD *)&v47 + 1);
    v32 = v33 - *((_QWORD *)&v47 + 1);
    if ((unint64_t)(v33 - *((_QWORD *)&v47 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_42;
  }
  else
  {
    if ((v51 & 8) == 0)
    {
      v32 = 0;
      v24[23] = 0;
      goto LABEL_38;
    }
    v34 = (const void *)v46;
    v32 = v47 - v46;
    if ((_QWORD)v47 - (_QWORD)v46 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_42:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v32 >= 0x17)
  {
    v35 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v32 | 7) != 0x17)
      v35 = v32 | 7;
    v36 = v35 + 1;
    v37 = operator new(v35 + 1);
    *((_QWORD *)v24 + 1) = v32;
    *((_QWORD *)v24 + 2) = v36 | 0x8000000000000000;
    *(_QWORD *)v24 = v37;
    v24 = v37;
    goto LABEL_37;
  }
  v24[23] = v32;
  if (v32)
LABEL_37:
    memmove(v24, v34, v32);
LABEL_38:
  v24[v32] = 0;
  v43[0] = *MEMORY[0x24BEDB7F0];
  v38 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v43 + *(_QWORD *)(v43[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v44 = v38;
  *(_QWORD *)&v45 = v16 + 16;
  if (SBYTE7(v50) < 0)
    operator delete((void *)__p);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x212BEA458](&v52);
}

void sub_212472014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_212472028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  std::locale::~locale((std::locale *)(v11 - 184));
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_212472044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_212472058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::iostream::~basic_iostream();
  MEMORY[0x212BEA458](a9);
  _Unwind_Resume(a1);
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
  MEMORY[0x212BEA458](a1 + 128);
  return a1;
}

uint64_t *Timestamp::convert(uint64_t a1)
{
  uint64_t *v1;
  uint64_t **v2;
  uint64_t *v3;
  uint64_t **v4;
  uint64_t **v5;
  int v6;
  uint64_t **v7;
  uint64_t *v9;
  std::string __p;
  uint64_t *v11[3];

  memset(v11, 170, sizeof(v11));
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    __p = *(std::string *)a1;
  Timestamp::Timestamp(v11, (char *)&__p, 9, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    v1 = v11[1];
    if (!v11[1])
    {
LABEL_18:
      std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v1);
      return 0;
    }
  }
  else
  {
    v1 = v11[1];
    if (!v11[1])
      goto LABEL_18;
  }
  v2 = &v11[1];
  v3 = v1;
  do
  {
    v4 = (uint64_t **)v3;
    v5 = v2;
    v6 = *((_DWORD *)v3 + 8);
    if (v6 >= 0)
      v2 = (uint64_t **)v3;
    else
      ++v3;
    v3 = (uint64_t *)*v3;
  }
  while (v3);
  if (v2 == &v11[1])
    goto LABEL_18;
  v7 = v6 >= 0 ? v4 : v5;
  if (*((int *)v7 + 8) > 0)
    goto LABEL_18;
  if (v6 < 0)
    v4 = v5;
  v9 = v4[5];
  std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(v1);
  return v9;
}

void sub_212472250(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
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
  __cxa_throw(exception, (struct type_info *)off_24CDC0888, MEMORY[0x24BEDAAF0]);
}

void sub_2124722BC(_Unwind_Exception *a1)
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

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
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

void std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(*a1);
    std::__tree<std::__value_type<Timestamp::TimeDomain,timeval>,std::__map_value_compare<Timestamp::TimeDomain,std::__value_type<Timestamp::TimeDomain,timeval>,std::less<Timestamp::TimeDomain>,true>,std::allocator<std::__value_type<Timestamp::TimeDomain,timeval>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 == result)
    return result;
  while (1)
  {
    v2 = a2[2];
    if (*(_BYTE *)(v2 + 24))
      return result;
    v3 = *(uint64_t **)(v2 + 16);
    v4 = *v3;
    if (*v3 != v2)
      break;
    v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(_BYTE *)(v2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v11 = *(_QWORD *)(v2 + 8);
        *v3 = v11;
        if (v11)
          goto LABEL_15;
      }
      else
      {
        v9 = *(uint64_t **)(v2 + 8);
        v10 = *v9;
        *(_QWORD *)(v2 + 8) = *v9;
        if (v10)
        {
          *(_QWORD *)(v10 + 16) = v2;
          v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = v9;
        *v9 = v2;
        *(_QWORD *)(v2 + 16) = v9;
        v3 = (uint64_t *)v9[2];
        v2 = *v3;
        *((_BYTE *)v9 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v11 = *(_QWORD *)(v2 + 8);
        *v3 = v11;
        if (v11)
LABEL_15:
          *(_QWORD *)(v11 + 16) = v3;
      }
      *(_QWORD *)(v2 + 16) = v3[2];
      *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
      *(_QWORD *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(_BYTE *)(v2 + 24) = 1;
    a2 = v3;
    *((_BYTE *)v3 + 24) = v3 == result;
    *v5 = 1;
    if (v3 == result)
      return result;
  }
  if (v4)
  {
    v6 = *(unsigned __int8 *)(v4 + 24);
    v5 = (_BYTE *)(v4 + 24);
    if (!v6)
      goto LABEL_3;
  }
  if (*(uint64_t **)v2 == a2)
  {
    v12 = a2[1];
    *(_QWORD *)v2 = v12;
    if (v12)
    {
      *(_QWORD *)(v12 + 16) = v2;
      v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(_QWORD *)(v2 + 16) = a2;
    v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((_BYTE *)a2 + 24) = 1;
  *((_BYTE *)v3 + 24) = 0;
  v13 = (uint64_t *)v3[1];
  v14 = *v13;
  v3[1] = *v13;
  if (v14)
    *(_QWORD *)(v14 + 16) = v3;
  v13[2] = v3[2];
  *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v13;
  *v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

uint64_t *std::map<Timestamp::TimeDomain,timeval>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<Timestamp::TimeDomain,timeval>,std::__tree_node<std::__value_type<Timestamp::TimeDomain,timeval>,void *> *,long>>>(uint64_t *result, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v4;
  uint64_t *v5;
  uint64_t *v6;
  int v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  BOOL v12;
  uint64_t **v13;
  uint64_t **v14;
  int v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD *v21;

  if (a2 != a3)
  {
    v4 = a2;
    v5 = result;
    v6 = result + 1;
    do
    {
      v7 = *((_DWORD *)v4 + 8);
      v8 = (uint64_t *)v5[1];
      v9 = v6;
      if ((uint64_t *)*v5 == v6)
        goto LABEL_10;
      v10 = v5[1];
      v11 = v6;
      if (v8)
      {
        do
        {
          v9 = (uint64_t *)v10;
          v10 = *(_QWORD *)(v10 + 8);
        }
        while (v10);
      }
      else
      {
        do
        {
          v9 = (uint64_t *)v11[2];
          v12 = *v9 == (_QWORD)v11;
          v11 = v9;
        }
        while (v12);
      }
      if (*((_DWORD *)v9 + 8) < v7)
      {
LABEL_10:
        if (v8)
          v13 = (uint64_t **)v9;
        else
          v13 = (uint64_t **)v6;
        if (v8)
          v14 = (uint64_t **)(v9 + 1);
        else
          v14 = (uint64_t **)v6;
        if (*v14)
          goto LABEL_29;
      }
      else
      {
        v14 = (uint64_t **)v6;
        v13 = (uint64_t **)v6;
        if (v8)
        {
          while (1)
          {
            while (1)
            {
              v13 = (uint64_t **)v8;
              v15 = *((_DWORD *)v8 + 8);
              if (v15 <= v7)
                break;
              v8 = *v13;
              v14 = v13;
              if (!*v13)
                goto LABEL_25;
            }
            if (v15 >= v7)
              goto LABEL_29;
            v8 = v13[1];
            if (!v8)
            {
              v14 = v13 + 1;
              break;
            }
          }
        }
      }
LABEL_25:
      v16 = operator new(0x38uLL);
      v17 = v4[6];
      v16[2] = *((_OWORD *)v4 + 2);
      *((_QWORD *)v16 + 6) = v17;
      *(_QWORD *)v16 = 0;
      *((_QWORD *)v16 + 1) = 0;
      *((_QWORD *)v16 + 2) = v13;
      *v14 = (uint64_t *)v16;
      v18 = *(_QWORD *)*v5;
      if (v18)
      {
        *v5 = v18;
        v19 = *v14;
      }
      else
      {
        v19 = (uint64_t *)v16;
      }
      result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v5[1], v19);
      ++v5[2];
LABEL_29:
      v20 = (_QWORD *)v4[1];
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
          v21 = (_QWORD *)v4[2];
          v12 = *v21 == (_QWORD)v4;
          v4 = v21;
        }
        while (!v12);
      }
      v4 = v21;
    }
    while (v21 != a3);
  }
  return result;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  const std::locale::facet *v12;
  uint64_t v13;
  BOOL v14;
  size_t v15;
  size_t v16;
  std::locale::__imp *v17;
  uint64_t v18;
  uint64_t v19;
  void *locale;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  std::locale __b[3];

  v24[0] = 0xAAAAAAAAAAAAAAAALL;
  v24[1] = 0xAAAAAAAAAAAAAAAALL;
  MEMORY[0x212BEA38C](v24, a1);
  if (LOBYTE(v24[0]))
  {
    v6 = (char *)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *((_QWORD *)v6 + 5);
    v8 = *((_DWORD *)v6 + 2);
    v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v12 = std::locale::use_facet(__b, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v12->__vftable[2].~facet_0)(v12, 32);
      std::locale::~locale(__b);
      *((_DWORD *)v6 + 36) = v9;
      v10 = a2 + a3;
      if ((v8 & 0xB0) == 0x20)
        v11 = a2 + a3;
      else
        v11 = a2;
      if (!v7)
        goto LABEL_34;
    }
    else
    {
      v10 = a2 + a3;
      if ((*((_DWORD *)v6 + 2) & 0xB0) == 0x20)
        v11 = a2 + a3;
      else
        v11 = a2;
      if (!v7)
        goto LABEL_34;
    }
    v13 = *((_QWORD *)v6 + 3);
    v14 = v13 <= a3;
    v15 = v13 - a3;
    if (v14)
      v16 = 0;
    else
      v16 = v15;
    if (v11 - a2 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, a2, v11 - a2) == v11 - a2)
    {
      if ((uint64_t)v16 >= 1)
      {
        memset(__b, 170, sizeof(__b));
        if (v16 >= 0x7FFFFFFFFFFFFFF8)
          std::string::__throw_length_error[abi:ne180100]();
        if (v16 >= 0x17)
        {
          v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v16 | 7) != 0x17)
            v18 = v16 | 7;
          v19 = v18 + 1;
          v17 = (std::locale::__imp *)operator new(v18 + 1);
          __b[1].__locale_ = (std::locale::__imp *)v16;
          __b[2].__locale_ = (std::locale::__imp *)(v19 | 0x8000000000000000);
          __b[0].__locale_ = v17;
        }
        else
        {
          HIBYTE(__b[2].__locale_) = v16;
          v17 = (std::locale::__imp *)__b;
        }
        memset(v17, v9, v16);
        *((_BYTE *)v17 + v16) = 0;
        if (SHIBYTE(__b[2].__locale_) >= 0)
          locale = __b;
        else
          locale = __b[0].__locale_;
        v21 = (*(uint64_t (**)(uint64_t, void *, size_t))(*(_QWORD *)v7 + 96))(v7, locale, v16);
        v22 = v21;
        if (SHIBYTE(__b[2].__locale_) < 0)
        {
          operator delete(__b[0].__locale_);
          if (v22 != v16)
            goto LABEL_34;
        }
        else if (v21 != v16)
        {
          goto LABEL_34;
        }
      }
      if (v10 - v11 < 1
        || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, v11, v10 - v11) == v10 - v11)
      {
        *((_QWORD *)v6 + 3) = 0;
        goto LABEL_35;
      }
    }
LABEL_34:
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
LABEL_35:
  MEMORY[0x212BEA398](v24);
  return a1;
}

void sub_212472964(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _QWORD *v17;

  if (a17 < 0)
    operator delete(__p);
  MEMORY[0x212BEA398](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(_QWORD *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x212472934);
}

void sub_2124729C4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t *GetOsLogContext(void)
{
  unsigned __int8 v0;

  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_253D37FF0 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_21246D000);
  }
  if (GetOsLogContext(void)::onceToken != -1)
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
  return &GetOsLogContext(void)::sOsLogContext;
}

void ___Z15GetOsLogContextv_block_invoke()
{
  _BYTE v0[16];

  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v0, "com.apple.telephony.abm", "global");
  ctu::OsLogContext::operator=();
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v0);
}

void *GetGlobalLogger(uint64_t *a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  _QWORD v10[5];
  std::__shared_weak_count *v11;

  v2 = atomic_load((unsigned __int8 *)&qword_253D38008);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_253D38008))
  {
    MEMORY[0x212BEA278](&unk_253D38010);
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED98A0], &unk_253D38010, &dword_21246D000);
    __cxa_guard_release(&qword_253D38008);
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1174405120;
  v10[2] = ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke;
  v10[3] = &__block_descriptor_tmp_3;
  v3 = *a1;
  v4 = (std::__shared_weak_count *)a1[1];
  v10[4] = v3;
  v11 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  if (_MergedGlobals != -1)
  {
    dispatch_once(&_MergedGlobals, v10);
    v4 = v11;
    if (v11)
      goto LABEL_7;
    return &unk_253D38010;
  }
  if (!v4)
    return &unk_253D38010;
LABEL_7:
  v7 = (unint64_t *)&v4->__shared_owners_;
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 - 1, v7));
  if (v8)
    return &unk_253D38010;
  ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
  std::__shared_weak_count::__release_weak(v4);
  return &unk_253D38010;
}

void sub_212472C00(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_253D38008);
  _Unwind_Resume(a1);
}

void ___Z15GetGlobalLoggerNSt3__110shared_ptrIN3ctu9LogServerEEE_block_invoke(uint64_t a1)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _BYTE v10[16];
  _BYTE v11[48];
  uint64_t v12;
  uint64_t v13;

  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_253D37FF0 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_21246D000);
  }
  if (GetOsLogContext(void)::onceToken != -1)
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v10, (const ctu::OsLogContext *)&GetOsLogContext(void)::sOsLogContext);
  MEMORY[0x212BEA26C](v11, v10, a1 + 32);
  ctu::LoggerCommonBase::operator=();
  v4 = v12;
  v3 = v13;
  if (v13)
  {
    v5 = (unint64_t *)(v13 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)qword_253D38048;
  qword_253D38040 = v4;
  qword_253D38048 = v3;
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
  ctu::StaticLogger::~StaticLogger((ctu::StaticLogger *)v11);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v10);
}

void sub_212472D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&a9);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(result + 40) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_32c42_ZTSNSt3__110shared_ptrIN3ctu9LogServerEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = *(std::__shared_weak_count **)(a1 + 40);
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

const char *diag::config::toString(unsigned int a1)
{
  if (a1 > 4)
    return "Unknown";
  else
    return off_24CDC0B90[a1];
}

{
  if (a1 > 2)
    return "Unknown";
  else
    return off_24CDC0BB8[a1];
}

{
  if (a1 > 2)
    return "Unknown";
  else
    return off_24CDC0BD0[a1];
}

const char *diag::config::toStringCompact(unsigned int a1)
{
  if (a1 > 2)
    return "unknown";
  else
    return off_24CDC0BE8[a1];
}

BOOL diag::config::equal_nocase(const char *a1, const char *a2)
{
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  if (a2[23] < 0)
    a2 = *(const char **)a2;
  return strcasecmp(a1, a2) == 0;
}

uint64_t diag::config::asEnum(uint64_t a1, _DWORD *a2)
{
  const char *v3;
  int v4;
  uint64_t result;
  char v6[23];
  char v7;

  v7 = 4;
  strcpy(v6, "none");
  if (*(char *)(a1 + 23) >= 0)
    v3 = (const char *)a1;
  else
    v3 = *(const char **)a1;
  if (!strcasecmp(v3, v6))
  {
    *a2 = 0;
    return 1;
  }
  else
  {
    v7 = 5;
    strcpy(v6, "reset");
    if (!strcasecmp(v3, v6))
    {
      *a2 = 1;
      return 1;
    }
    else
    {
      v7 = 11;
      strcpy(v6, "reconfigure");
      v4 = strcasecmp(v3, v6);
      result = 0;
      if (!v4)
      {
        *a2 = 2;
        return 1;
      }
    }
  }
  return result;
}

uint64_t diag::config::getShouldAlwaysFilter(diag::config *this)
{
  int IsCarrierBuild;
  int IsInternalBuild;

  IsCarrierBuild = TelephonyUtilIsCarrierBuild();
  IsInternalBuild = TelephonyUtilIsInternalBuild();
  return (IsCarrierBuild | IsInternalBuild | TelephonyUtilIsVendorBuild()) ^ 1;
}

const char *ABMGetProjectVersion(void)
{
  return "AppleBasebandManager-AppleBasebandServices_Manager-1180";
}

uint64_t support::fs::toString@<X0>(uint64_t result@<X0>, char *a2@<X8>)
{
  if ((_DWORD)result == 1)
  {
    a2[23] = 9;
    strcpy(a2, "_wireless");
  }
  else if ((_DWORD)result)
  {
    a2[23] = 0;
    *a2 = 0;
  }
  else
  {
    a2[23] = 6;
    strcpy(a2, "mobile");
  }
  return result;
}

uint64_t support::fs::updateOwner(const char *a1, uint64_t a2, uint64_t a3)
{
  const char *v5;
  timespec v6;
  size_t v7;
  __darwin_ino64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  stat *v14;
  uint64_t updated;
  void *v16;
  const char *v17;
  DIR *v18;
  DIR *v19;
  dirent *v20;
  char *v21;
  const std::string::value_type **v22;
  char v23;
  __int128 v24;
  int v25;
  size_t v26;
  unint64_t v27;
  char *p_dst;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  std::string *v32;
  std::string::size_type size;
  std::string *v34;
  __int128 v35;
  std::string::size_type v36;
  std::string *v37;
  std::string *v38;
  timespec v39;
  std::string *v40;
  std::string *p_p;
  size_t v42;
  __darwin_ino64_t v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  int st_gid_high;
  void *v48;
  stat *v49;
  void *v50;
  std::string *v51;
  DIR *v52;
  DIR *v53;
  dirent *v54;
  void **v55;
  char *v57;
  std::string v58;
  std::string __p;
  std::string v60;
  void *v61;
  char *v62;
  uint64_t v63;
  stat __dst;

  v5 = a1;
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&__dst.st_blksize = v6;
  *(timespec *)__dst.st_qspare = v6;
  __dst.st_birthtimespec = v6;
  *(timespec *)&__dst.st_size = v6;
  __dst.st_mtimespec = v6;
  __dst.st_ctimespec = v6;
  *(timespec *)&__dst.st_uid = v6;
  __dst.st_atimespec = v6;
  *(timespec *)&__dst.st_dev = v6;
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  if (!stat(a1, &__dst))
  {
    v17 = v5[23] >= 0 ? v5 : *(const char **)v5;
    v18 = opendir(v17);
    if (v18)
    {
      v19 = v18;
      v20 = readdir(v18);
      closedir(v19);
      if (v20)
      {
        v61 = 0;
        v62 = 0;
        v63 = 0;
        support::fs::readDir(v5, (uint64_t)&v61);
        v21 = (char *)v61;
        v57 = v62;
        if (v61 == v62)
        {
          updated = 0;
          if (v61)
            goto LABEL_105;
          return updated;
        }
        v22 = (const std::string::value_type **)((char *)v61 + 24);
        while (1)
        {
          memset(&v60, 170, sizeof(v60));
          if (*((char *)v22 - 1) < 0)
          {
            std::string::__init_copy_ctor_external(&v60, *(v22 - 3), (std::string::size_type)*(v22 - 2));
          }
          else
          {
            v24 = *(_OWORD *)(v22 - 3);
            v60.__r_.__value_.__r.__words[2] = (std::string::size_type)*(v22 - 1);
            *(_OWORD *)&v60.__r_.__value_.__l.__data_ = v24;
          }
          memset(&__p, 170, sizeof(__p));
          v25 = v5[23];
          if (v25 >= 0)
            v26 = *((unsigned __int8 *)v5 + 23);
          else
            v26 = *((_QWORD *)v5 + 1);
          v27 = v26 + 1;
          memset(&__dst, 170, 24);
          if (v26 + 1 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          if (v27 >= 0x17)
          {
            v29 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v27 | 7) != 0x17)
              v29 = v27 | 7;
            v30 = v29 + 1;
            p_dst = (char *)operator new(v29 + 1);
            __dst.st_ino = v26 + 1;
            *(_QWORD *)&__dst.st_uid = v30 | 0x8000000000000000;
            *(_QWORD *)&__dst.st_dev = p_dst;
          }
          else
          {
            memset(&__dst, 0, 24);
            p_dst = (char *)&__dst;
            HIBYTE(__dst.st_gid) = v26 + 1;
            if (!v26)
              goto LABEL_47;
          }
          if (v25 >= 0)
            v31 = v5;
          else
            v31 = *(const char **)v5;
          memmove(p_dst, v31, v26);
LABEL_47:
          *(_WORD *)&p_dst[v26] = 47;
          if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v32 = &v60;
          else
            v32 = (std::string *)v60.__r_.__value_.__r.__words[0];
          if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            size = HIBYTE(v60.__r_.__value_.__r.__words[2]);
          else
            size = v60.__r_.__value_.__l.__size_;
          v34 = std::string::append((std::string *)&__dst, (const std::string::value_type *)v32, size);
          v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
          __p.__r_.__value_.__r.__words[2] = v34->__r_.__value_.__r.__words[2];
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v35;
          v34->__r_.__value_.__l.__size_ = 0;
          v34->__r_.__value_.__r.__words[2] = 0;
          v34->__r_.__value_.__r.__words[0] = 0;
          if (SHIBYTE(__dst.st_gid) < 0)
            operator delete(*(void **)&__dst.st_dev);
          v36 = HIBYTE(v60.__r_.__value_.__r.__words[2]);
          if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v36 = v60.__r_.__value_.__l.__size_;
          if (v36 == 2)
          {
            v38 = &v60;
            if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              v38 = (std::string *)v60.__r_.__value_.__r.__words[0];
            if (LOWORD(v38->__r_.__value_.__l.__data_) == 11822)
            {
LABEL_70:
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                p_p = &__p;
              else
                p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
              v42 = strlen((const char *)p_p);
              if (v42 > 0x7FFFFFFFFFFFFFF7)
                std::string::__throw_length_error[abi:ne180100]();
              v43 = v42;
              if (v42 >= 0x17)
              {
                v45 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
                if ((v42 | 7) != 0x17)
                  v45 = v42 | 7;
                v46 = v45 + 1;
                v44 = operator new(v45 + 1);
                __dst.st_ino = v43;
                *(_QWORD *)&__dst.st_uid = v46 | 0x8000000000000000;
                *(_QWORD *)&__dst.st_dev = v44;
              }
              else
              {
                HIBYTE(__dst.st_gid) = v42;
                v44 = &__dst;
                if (!v42)
                {
LABEL_81:
                  v44[v43] = 0;
                  st_gid_high = SHIBYTE(__dst.st_gid);
                  v48 = *(void **)&__dst.st_dev;
                  if ((__dst.st_gid & 0x80000000) == 0)
                    v49 = &__dst;
                  else
                    v49 = *(stat **)&__dst.st_dev;
                  updated = chown((const char *)v49, a2, a3) == 0;
                  if (st_gid_high < 0)
                  {
                    v50 = v48;
LABEL_86:
                    operator delete(v50);
                    goto LABEL_87;
                  }
                  goto LABEL_87;
                }
              }
              memmove(v44, p_p, v43);
              goto LABEL_81;
            }
          }
          else if (v36 == 1)
          {
            v37 = &v60;
            if ((v60.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
              v37 = (std::string *)v60.__r_.__value_.__r.__words[0];
            if (v37->__r_.__value_.__s.__data_[0] == 46)
              goto LABEL_70;
          }
          v39.tv_sec = 0xAAAAAAAAAAAAAAAALL;
          v39.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
          *(timespec *)&__dst.st_blksize = v39;
          *(timespec *)__dst.st_qspare = v39;
          __dst.st_birthtimespec = v39;
          *(timespec *)&__dst.st_size = v39;
          __dst.st_mtimespec = v39;
          __dst.st_ctimespec = v39;
          *(timespec *)&__dst.st_uid = v39;
          __dst.st_atimespec = v39;
          *(timespec *)&__dst.st_dev = v39;
          if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v40 = &__p;
          else
            v40 = (std::string *)__p.__r_.__value_.__r.__words[0];
          if (stat((const char *)v40, &__dst))
            goto LABEL_70;
          v51 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
              ? &__p
              : (std::string *)__p.__r_.__value_.__r.__words[0];
          v52 = opendir((const char *)v51);
          v53 = v52;
          if (!v52)
            goto LABEL_70;
          v54 = readdir(v52);
          closedir(v53);
          if (!v54)
            goto LABEL_70;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            std::string::__init_copy_ctor_external(&v58, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
          else
            v58 = __p;
          updated = support::fs::updateOwner(&v58, a2, a3);
          if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
          {
            v50 = (void *)v58.__r_.__value_.__r.__words[0];
            goto LABEL_86;
          }
LABEL_87:
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(__p.__r_.__value_.__l.__data_);
            if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
LABEL_91:
              operator delete(v60.__r_.__value_.__l.__data_);
          }
          else if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0)
          {
            goto LABEL_91;
          }
          if (v22 == (const std::string::value_type **)v57)
            v23 = 0;
          else
            v23 = updated;
          v22 += 3;
          if ((v23 & 1) == 0)
          {
            v21 = (char *)v61;
            if (!v61)
              return updated;
LABEL_105:
            v55 = (void **)v62;
            v16 = v21;
            if (v62 != v21)
            {
              do
              {
                if (*((char *)v55 - 1) < 0)
                  operator delete(*(v55 - 3));
                v55 -= 3;
              }
              while (v55 != (void **)v21);
              v16 = v61;
            }
            v62 = v21;
LABEL_112:
            operator delete(v16);
            return updated;
          }
        }
      }
    }
  }
  if (v5[23] < 0)
    v5 = *(const char **)v5;
  v7 = strlen(v5);
  if (v7 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v8 = v7;
  if (v7 >= 0x17)
  {
    v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v10 = v7 | 7;
    v11 = v10 + 1;
    v9 = operator new(v10 + 1);
    __dst.st_ino = v8;
    *(_QWORD *)&__dst.st_uid = v11 | 0x8000000000000000;
    *(_QWORD *)&__dst.st_dev = v9;
    goto LABEL_13;
  }
  HIBYTE(__dst.st_gid) = v7;
  v9 = &__dst;
  if (v7)
LABEL_13:
    memmove(v9, v5, v8);
  *((_BYTE *)v9 + v8) = 0;
  v12 = SHIBYTE(__dst.st_gid);
  v13 = *(void **)&__dst.st_dev;
  if ((__dst.st_gid & 0x80000000) == 0)
    v14 = &__dst;
  else
    v14 = *(stat **)&__dst.st_dev;
  updated = chown((const char *)v14, a2, a3) == 0;
  if (v12 < 0)
  {
    v16 = v13;
    goto LABEL_112;
  }
  return updated;
}

void sub_2124735CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31)
{
  std::vector<std::string>::~vector[abi:ne180100](&a31);
  _Unwind_Resume(a1);
}

void sub_2124735FC()
{
  JUMPOUT(0x21247362CLL);
}

DIR *support::fs::isDir(const char *a1)
{
  const char *v1;
  timespec v2;
  DIR *result;
  const char *v4;
  DIR *v5;
  dirent *v6;
  stat v7;

  v1 = a1;
  v2.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v7.st_blksize = v2;
  *(timespec *)v7.st_qspare = v2;
  v7.st_birthtimespec = v2;
  *(timespec *)&v7.st_size = v2;
  v7.st_mtimespec = v2;
  v7.st_ctimespec = v2;
  *(timespec *)&v7.st_uid = v2;
  v7.st_atimespec = v2;
  *(timespec *)&v7.st_dev = v2;
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  if (stat(a1, &v7))
    return 0;
  if (v1[23] >= 0)
    v4 = v1;
  else
    v4 = *(const char **)v1;
  result = opendir(v4);
  if (result)
  {
    v5 = result;
    v6 = readdir(result);
    closedir(v5);
    return (DIR *)(v6 != 0);
  }
  return result;
}

BOOL support::fs::chown(const char *a1, uid_t a2, gid_t a3)
{
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  return chown(a1, a2, a3) == 0;
}

DIR *support::fs::readDir(const char *a1, uint64_t a2)
{
  DIR *result;
  DIR *v4;
  dirent *v5;
  dirent *v6;
  size_t d_namlen;
  _BYTE *v8;
  std::string *v9;
  char v10;
  uint64_t v11;
  std::string *v12;
  char v13;
  _BYTE __dst[24];

  if (a1[23] < 0)
    a1 = *(const char **)a1;
  result = opendir(a1);
  if (result)
  {
    v4 = result;
    v5 = readdir(result);
    if (v5)
    {
      v6 = v5;
      do
      {
        memset(__dst, 170, sizeof(__dst));
        d_namlen = v6->d_namlen;
        if (d_namlen >= 0x17)
        {
          if ((d_namlen | 7) == 0x17)
            v11 = ((unsigned __int16)d_namlen & 0xFFF8) + 8;
          else
            v11 = d_namlen | 7;
          v8 = operator new(v11 + 1);
          *(_QWORD *)&__dst[8] = d_namlen;
          *(_QWORD *)&__dst[16] = v11 - 0x7FFFFFFFFFFFFFFFLL;
          *(_QWORD *)__dst = v8;
        }
        else
        {
          __dst[23] = v6->d_namlen;
          v8 = __dst;
          if (!(_DWORD)d_namlen)
          {
            __dst[d_namlen] = 0;
            v9 = *(std::string **)(a2 + 8);
            if ((unint64_t)v9 < *(_QWORD *)(a2 + 16))
              goto LABEL_10;
            goto LABEL_17;
          }
        }
        memmove(v8, v6->d_name, d_namlen);
        v8[d_namlen] = 0;
        v9 = *(std::string **)(a2 + 8);
        if ((unint64_t)v9 < *(_QWORD *)(a2 + 16))
        {
LABEL_10:
          v10 = __dst[23];
          if ((__dst[23] & 0x80000000) != 0)
          {
            std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)__dst, *(std::string::size_type *)&__dst[8]);
          }
          else
          {
            *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)__dst;
            v9->__r_.__value_.__r.__words[2] = *(_QWORD *)&__dst[16];
          }
          *(_QWORD *)(a2 + 8) = v9 + 1;
          *(_QWORD *)(a2 + 8) = v9 + 1;
          if ((v10 & 0x80) == 0)
            goto LABEL_6;
LABEL_21:
          operator delete(*(void **)__dst);
          goto LABEL_6;
        }
LABEL_17:
        v12 = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)a2, (uint64_t)__dst);
        v13 = __dst[23];
        *(_QWORD *)(a2 + 8) = v12;
        if (v13 < 0)
          goto LABEL_21;
LABEL_6:
        v6 = readdir(v4);
      }
      while (v6);
    }
    return (DIR *)closedir(v4);
  }
  return result;
}

void sub_2124738A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v15 + 8) = v16;
  operator delete(__p);
  _Unwind_Resume(a1);
}

void **std::vector<std::string>::~vector[abi:ne180100](void **a1)
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

uint64_t support::fs::getUidGid(int a1, uid_t *a2, gid_t *a3)
{
  passwd *v5;
  unsigned __int8 v7;
  NSObject *v8;
  void *__p[3];
  uint8_t buf[4];
  void **v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  memset(__p, 170, sizeof(__p));
  if (a1 == 1)
  {
    HIBYTE(__p[2]) = 9;
    strcpy((char *)__p, "_wireless");
    v5 = getpwnam((const char *)__p);
    if (v5)
      goto LABEL_4;
    goto LABEL_6;
  }
  if (!a1)
  {
    HIBYTE(__p[2]) = 6;
    strcpy((char *)__p, "mobile");
    v5 = getpwnam((const char *)__p);
    if (v5)
    {
LABEL_4:
      *a2 = v5->pw_uid;
      *a3 = v5->pw_gid;
      return 1;
    }
LABEL_6:
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_253D37FF0 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_21246D000);
    }
    if (GetOsLogContext(void)::onceToken == -1)
    {
      v8 = qword_253D37FF0;
      if (!os_log_type_enabled((os_log_t)qword_253D37FF0, OS_LOG_TYPE_ERROR))
        return 0;
    }
    else
    {
      dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
      v8 = qword_253D37FF0;
      if (!os_log_type_enabled((os_log_t)qword_253D37FF0, OS_LOG_TYPE_ERROR))
        return 0;
    }
    *(_DWORD *)buf = 136315138;
    v11 = __p;
    _os_log_error_impl(&dword_21246D000, v8, OS_LOG_TYPE_ERROR, "Getting uid and gid: failed to get passwd for %s", buf, 0xCu);
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
  }
  return 0;
}

BOOL support::fs::writeToCompletion(support::fs *this, char *__buf, size_t __nbyte)
{
  int v4;
  size_t v5;
  ssize_t v6;

  v4 = (int)this;
  do
  {
    v5 = __nbyte;
    if (!__nbyte)
      break;
    v6 = write(v4, __buf, __nbyte);
    __nbyte = v5 - v6;
    __buf += v6;
  }
  while ((v6 & 0x8000000000000000) == 0);
  return v5 == 0;
}

BOOL support::fs::writeToCompletion(FILE *__stream, __sFILE *__ptr, size_t __nitems)
{
  size_t v5;
  size_t v6;

  while (1)
  {
    v5 = __nitems;
    if (!__nitems)
      break;
    v6 = fwrite(__ptr, 1uLL, __nitems, __stream);
    __nitems = v5 - v6;
    __ptr = (__sFILE *)((char *)__ptr + v6);
    if (!v6)
      return v5 == 0;
  }
  fflush(__stream);
  return 1;
}

uint64_t support::fs::openFile(const char *a1, int a2, unsigned int a3)
{
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  return open(a1, a2, a3);
}

BOOL support::fs::closeFile(support::fs *this)
{
  int v1;
  int v2;

  v1 = (int)this;
  do
    v2 = close(v1);
  while (v2 && *__error() == 4);
  return v2 == 0;
}

BOOL support::fs::copyFile(const char *a1, const char *a2, int a3)
{
  const char *v6;
  size_t v7;
  size_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  int v13;
  int v14;
  const char *v15;
  size_t v16;
  size_t v17;
  _BYTE *v18;
  unsigned __int8 v19;
  NSObject *v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  int v25;
  int v26;
  ssize_t v27;
  _BYTE *v28;
  ssize_t v29;
  __int128 v30;
  unsigned __int8 v31;
  NSObject *v32;
  const char *v34;
  const char *v35;
  _BYTE __dst[1024];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (a1[23] >= 0)
    v6 = a1;
  else
    v6 = *(const char **)a1;
  v7 = strlen(v6);
  if (v7 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v8 = v7;
  if (v7 >= 0x17)
  {
    v10 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v10 = v7 | 7;
    v11 = v10 + 1;
    v9 = operator new(v10 + 1);
    *(_QWORD *)&__dst[8] = v8;
    *(_QWORD *)&__dst[16] = v11 | 0x8000000000000000;
    *(_QWORD *)__dst = v9;
    goto LABEL_11;
  }
  __dst[23] = v7;
  v9 = __dst;
  if (v7)
LABEL_11:
    memmove(v9, v6, v8);
  v9[v8] = 0;
  if (__dst[23] >= 0)
    v12 = __dst;
  else
    v12 = *(const char **)__dst;
  v13 = open(v12, 0, 420);
  v14 = v13;
  if ((__dst[23] & 0x80000000) == 0)
  {
    if ((v13 & 0x80000000) == 0)
      goto LABEL_17;
LABEL_25:
    {
      GetOsLogContext(void)::sOsLogContext = 0;
      qword_253D37FF0 = 0;
      __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_21246D000);
    }
    if (GetOsLogContext(void)::onceToken == -1)
    {
      v20 = qword_253D37FF0;
      if (!os_log_type_enabled((os_log_t)qword_253D37FF0, OS_LOG_TYPE_ERROR))
        return 0;
    }
    else
    {
      dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
      v20 = qword_253D37FF0;
      if (!os_log_type_enabled((os_log_t)qword_253D37FF0, OS_LOG_TYPE_ERROR))
        return 0;
    }
    if (a1[23] >= 0)
      v34 = a1;
    else
      v34 = *(const char **)a1;
    *(_DWORD *)__dst = 136315138;
    *(_QWORD *)&__dst[4] = v34;
    _os_log_error_impl(&dword_21246D000, v20, OS_LOG_TYPE_ERROR, "Failed to open the source file(%s)", __dst, 0xCu);
    return 0;
  }
  operator delete(*(void **)__dst);
  if (v14 < 0)
    goto LABEL_25;
LABEL_17:
  if (a2[23] >= 0)
    v15 = a2;
  else
    v15 = *(const char **)a2;
  v16 = strlen(v15);
  if (v16 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v17 = v16;
  if (v16 >= 0x17)
  {
    v22 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v22 = v16 | 7;
    v23 = v22 + 1;
    v18 = operator new(v22 + 1);
    *(_QWORD *)&__dst[8] = v17;
    *(_QWORD *)&__dst[16] = v23 | 0x8000000000000000;
    *(_QWORD *)__dst = v18;
    goto LABEL_32;
  }
  __dst[23] = v16;
  v18 = __dst;
  if (v16)
LABEL_32:
    memmove(v18, v15, v17);
  v18[v17] = 0;
  if (__dst[23] >= 0)
    v24 = __dst;
  else
    v24 = *(const char **)__dst;
  v25 = open(v24, 1541, 420);
  v26 = v25;
  if ((__dst[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)__dst);
    if ((v26 & 0x80000000) == 0)
      goto LABEL_38;
  }
  else if ((v25 & 0x80000000) == 0)
  {
LABEL_38:
    memset(__dst, 170, sizeof(__dst));
    v27 = read(v14, __dst, 0x400uLL);
    if (v27 < 1)
    {
LABEL_44:
      v21 = v27 == 0;
      if (!v27 && a3)
      {
        *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&__dst[112] = v30;
        *(_OWORD *)&__dst[128] = v30;
        *(_OWORD *)&__dst[80] = v30;
        *(_OWORD *)&__dst[96] = v30;
        *(_OWORD *)&__dst[48] = v30;
        *(_OWORD *)&__dst[64] = v30;
        *(_OWORD *)&__dst[16] = v30;
        *(_OWORD *)&__dst[32] = v30;
        *(_OWORD *)__dst = v30;
        if (fstat(v14, (stat *)__dst))
          v21 = 0;
        else
          v21 = fchmod(v26, *(mode_t *)&__dst[4]) == 0;
      }
    }
    else
    {
      v28 = __dst;
      do
      {
        while (!v27)
        {
          memset(__dst, 170, sizeof(__dst));
          v27 = read(v14, __dst, 0x400uLL);
          v28 = __dst;
          if (v27 <= 0)
            goto LABEL_44;
        }
        v29 = write(v26, v28, v27);
        v27 -= v29;
        v28 += v29;
      }
      while ((v29 & 0x8000000000000000) == 0);
      v21 = 0;
    }
    while (close(v26) && *__error() == 4)
      ;
    goto LABEL_56;
  }
  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_253D37FF0 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_21246D000);
  }
  if (GetOsLogContext(void)::onceToken != -1)
  {
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
    v32 = qword_253D37FF0;
    if (!os_log_type_enabled((os_log_t)qword_253D37FF0, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
LABEL_65:
    if (a2[23] >= 0)
      v35 = a2;
    else
      v35 = *(const char **)a2;
    *(_DWORD *)__dst = 136315138;
    *(_QWORD *)&__dst[4] = v35;
    _os_log_error_impl(&dword_21246D000, v32, OS_LOG_TYPE_ERROR, "Failed to open the destination file(%s)", __dst, 0xCu);
    goto LABEL_52;
  }
  v32 = qword_253D37FF0;
  if (os_log_type_enabled((os_log_t)qword_253D37FF0, OS_LOG_TYPE_ERROR))
    goto LABEL_65;
LABEL_52:
  v21 = 0;
LABEL_56:
  while (close(v14) && *__error() == 4)
    ;
  return v21;
}

void sub_21247416C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

BOOL support::fs::loadFile(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  _BOOL8 v4;
  char *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  size_t v13;
  char *v14;
  char *v15;
  char *v16;
  unint64_t v17;
  char *v18;
  char *v19;
  unint64_t v20;
  __int128 v21;
  char *v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  char v27;
  _QWORD __b[91];

  __b[89] = *MEMORY[0x24BDAC8D0];
  memset(__b, 170, 0x240uLL);
  std::ifstream::basic_ifstream(__b);
  if (!__b[17]
    || (std::istream::tellg(), std::istream::seekg(), std::istream::tellg(), v3 = __b[88], std::istream::seekg(), !v3)
    || *(_DWORD *)((char *)&__b[4] + *(_QWORD *)(__b[0] - 24)))
  {
    v4 = 0;
    goto LABEL_5;
  }
  v7 = *(char **)a2;
  v6 = *(char **)(a2 + 8);
  v8 = (unint64_t)&v6[-*(_QWORD *)a2];
  v9 = v3 - v8;
  if (v3 <= v8)
  {
    if (v3 < v8)
      *(_QWORD *)(a2 + 8) = &v7[v3];
    goto LABEL_36;
  }
  v10 = *(_QWORD *)(a2 + 16);
  if (v10 - (uint64_t)v6 < v9)
  {
    if ((v3 & 0x8000000000000000) != 0)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v11 = v10 - (_QWORD)v7;
    v12 = 2 * v11;
    if (2 * v11 <= v3)
      v12 = v3;
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v14 = (char *)operator new(v13);
    v15 = &v14[v8];
    v16 = &v14[v13];
    bzero(&v14[v8], v3 - v8);
    if (v6 == v7)
      goto LABEL_34;
    if (v8 >= 8 && (unint64_t)(v7 - v14) >= 0x20)
    {
      if (v8 < 0x20)
      {
        v17 = 0;
        goto LABEL_26;
      }
      v17 = v8 & 0xFFFFFFFFFFFFFFE0;
      v18 = v6 - 16;
      v19 = &v14[v6 - 16 - v7];
      v20 = v8 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        v21 = *(_OWORD *)v18;
        *((_OWORD *)v19 - 1) = *((_OWORD *)v18 - 1);
        *(_OWORD *)v19 = v21;
        v19 -= 32;
        v18 -= 32;
        v20 -= 32;
      }
      while (v20);
      if (v8 == v17)
        goto LABEL_33;
      if ((v8 & 0x18) != 0)
      {
LABEL_26:
        v15 -= v8 & 0xFFFFFFFFFFFFFFF8;
        v22 = &v6[-v17 - 8];
        v23 = (char *)(v22 - v7);
        v24 = v17 - (v8 & 0xFFFFFFFFFFFFFFF8);
        do
        {
          v25 = *(_QWORD *)v22;
          v22 -= 8;
          *(_QWORD *)&v23[(_QWORD)v14] = v25;
          v23 -= 8;
          v24 += 8;
        }
        while (v24);
        v6 -= v8 & 0xFFFFFFFFFFFFFFF8;
        if (v8 == (v8 & 0xFFFFFFFFFFFFFFF8))
          goto LABEL_33;
        goto LABEL_31;
      }
      v15 -= v17;
      v6 -= v17;
    }
LABEL_31:
    v26 = v15 - 1;
    do
    {
      v27 = *--v6;
      *v26-- = v27;
    }
    while (v6 != v7);
LABEL_33:
    v6 = v7;
    v15 = v14;
LABEL_34:
    *(_QWORD *)a2 = v15;
    *(_QWORD *)(a2 + 8) = &v14[v3];
    *(_QWORD *)(a2 + 16) = v16;
    if (v6)
      operator delete(v6);
    goto LABEL_36;
  }
  bzero(*(void **)(a2 + 8), v3 - v8);
  *(_QWORD *)(a2 + 8) = &v6[v9];
LABEL_36:
  std::istream::read();
  v4 = __b[1] == (int)v3;
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)((char *)__b + *(_QWORD *)(__b[0] - 24)), *(_DWORD *)((char *)&__b[4] + *(_QWORD *)(__b[0] - 24)) | 4);
LABEL_5:
  __b[0] = *MEMORY[0x24BEDB7E0];
  *(_QWORD *)((char *)__b + *(_QWORD *)(__b[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 24);
  MEMORY[0x212BEA338](&__b[2]);
  std::istream::~istream();
  MEMORY[0x212BEA458](&__b[53]);
  return v4;
}

void sub_2124744A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::ifstream::~ifstream((uint64_t *)va);
  _Unwind_Resume(a1);
}

_QWORD *std::ifstream::basic_ifstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  std::ios_base *v7;

  v2 = MEMORY[0x24BEDB838];
  v3 = MEMORY[0x24BEDB838] + 64;
  a1[53] = MEMORY[0x24BEDB838] + 64;
  v4 = a1 + 2;
  v5 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 8);
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 16);
  *a1 = v5;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v5 - 24)) = v6;
  a1[1] = 0;
  v7 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v7, a1 + 2);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  *a1 = v2 + 24;
  a1[53] = v3;
  MEMORY[0x212BEA32C](v4);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 4);
  return a1;
}

void sub_21247459C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::istream::~istream();
  MEMORY[0x212BEA458](v1 + 424);
  _Unwind_Resume(a1);
}

BOOL support::fs::getFileSize(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 136);
  if (v2)
  {
    std::istream::tellg();
    std::istream::seekg();
    std::istream::tellg();
    *a2 = v5;
    std::istream::seekg();
  }
  return v2 != 0;
}

{
  uint64_t v2;
  _BOOL8 v4;
  _QWORD v6[90];

  v6[89] = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 23);
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0;
  memset(v6, 170, 0x240uLL);
  std::ifstream::basic_ifstream(v6);
  v4 = v6[17] != 0;
  if (v6[17])
  {
    std::istream::tellg();
    std::istream::seekg();
    std::istream::tellg();
    *a2 = v6[88];
    std::istream::seekg();
    if (!std::filebuf::close())
      std::ios_base::clear((std::ios_base *)((char *)v6 + *(_QWORD *)(v6[0] - 24)), *(_DWORD *)((char *)&v6[4] + *(_QWORD *)(v6[0] - 24)) | 4);
  }
  v6[0] = *MEMORY[0x24BEDB7E0];
  *(_QWORD *)((char *)v6 + *(_QWORD *)(v6[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7E0] + 24);
  MEMORY[0x212BEA338](&v6[2]);
  std::istream::~istream();
  MEMORY[0x212BEA458](&v6[53]);
  return v4;
}

_QWORD *std::ifstream::~ifstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E0];
  v3 = *MEMORY[0x24BEDB7E0];
  *a1 = *MEMORY[0x24BEDB7E0];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x212BEA338](a1 + 2);
  std::istream::~istream();
  MEMORY[0x212BEA458](a1 + 53);
  return a1;
}

uint64_t support::fs::loadFile(const char *a1, uint64_t a2)
{
  FILE *v3;
  FILE *v4;
  unint64_t v5;
  size_t v6;
  char *v7;
  char *v8;
  unint64_t v9;
  size_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  size_t v14;
  char *v15;
  char *v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  unint64_t v22;
  __int128 v23;
  char *v24;
  char *v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  char v29;
  char *v30;

  if (a1[23] < 0)
    a1 = *(const char **)a1;
  v3 = fopen(a1, "rb");
  if (v3)
  {
    v4 = v3;
    fseek(v3, 0, 2);
    v5 = MEMORY[0x212BEA5F0](v4);
    if (v5 != -1)
    {
      v6 = v5;
      v8 = *(char **)a2;
      v7 = *(char **)(a2 + 8);
      v9 = (unint64_t)&v7[-*(_QWORD *)a2];
      v10 = v5 - v9;
      if (v5 <= v9)
      {
        if (v5 < v9)
          *(_QWORD *)(a2 + 8) = &v8[v5];
        goto LABEL_36;
      }
      v11 = *(_QWORD *)(a2 + 16);
      if (v11 - (uint64_t)v7 >= v10)
      {
        bzero(*(void **)(a2 + 8), v10);
        *(_QWORD *)(a2 + 8) = &v7[v10];
LABEL_36:
        rewind(v4);
        v30 = *(char **)a2;
        v19 = 1;
        fread(v30, v6, 1uLL, v4);
        fclose(v4);
        return v19;
      }
      if ((v5 & 0x8000000000000000) != 0)
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      v12 = v11 - (_QWORD)v8;
      v13 = 2 * v12;
      if (2 * v12 <= v5)
        v13 = v5;
      if (v12 >= 0x3FFFFFFFFFFFFFFFLL)
        v14 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v14 = v13;
      v15 = (char *)operator new(v14);
      v16 = &v15[v9];
      v17 = &v15[v14];
      bzero(&v15[v9], v10);
      if (v7 == v8)
      {
LABEL_34:
        *(_QWORD *)a2 = v16;
        *(_QWORD *)(a2 + 8) = &v15[v6];
        *(_QWORD *)(a2 + 16) = v17;
        if (v7)
          operator delete(v7);
        goto LABEL_36;
      }
      if (v9 >= 8 && (unint64_t)(v8 - v15) >= 0x20)
      {
        if (v9 < 0x20)
        {
          v18 = 0;
          goto LABEL_26;
        }
        v18 = v9 & 0xFFFFFFFFFFFFFFE0;
        v20 = v7 - 16;
        v21 = &v15[v7 - 16 - v8];
        v22 = v9 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v23 = *(_OWORD *)v20;
          *((_OWORD *)v21 - 1) = *((_OWORD *)v20 - 1);
          *(_OWORD *)v21 = v23;
          v21 -= 32;
          v20 -= 32;
          v22 -= 32;
        }
        while (v22);
        if (v9 == v18)
          goto LABEL_33;
        if ((v9 & 0x18) != 0)
        {
LABEL_26:
          v16 -= v9 & 0xFFFFFFFFFFFFFFF8;
          v24 = &v7[-v18 - 8];
          v25 = (char *)(v24 - v8);
          v26 = v18 - (v9 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            v27 = *(_QWORD *)v24;
            v24 -= 8;
            *(_QWORD *)&v25[(_QWORD)v15] = v27;
            v25 -= 8;
            v26 += 8;
          }
          while (v26);
          v7 -= v9 & 0xFFFFFFFFFFFFFFF8;
          if (v9 == (v9 & 0xFFFFFFFFFFFFFFF8))
            goto LABEL_33;
          goto LABEL_31;
        }
        v16 -= v18;
        v7 -= v18;
      }
LABEL_31:
      v28 = v16 - 1;
      do
      {
        v29 = *--v7;
        *v28-- = v29;
      }
      while (v7 != v8);
LABEL_33:
      v7 = v8;
      v16 = v15;
      goto LABEL_34;
    }
  }
  return 0;
}

BOOL support::fs::fileExists(const char *a1)
{
  timespec v1;
  stat v3;

  v1.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v1.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v3.st_blksize = v1;
  *(timespec *)v3.st_qspare = v1;
  v3.st_birthtimespec = v1;
  *(timespec *)&v3.st_size = v1;
  v3.st_mtimespec = v1;
  v3.st_ctimespec = v1;
  *(timespec *)&v3.st_uid = v1;
  v3.st_atimespec = v1;
  *(timespec *)&v3.st_dev = v1;
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  return stat(a1, &v3) == 0;
}

void support::fs::createUniqueFilename(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v3;
  uint64_t v4;
  unsigned int v5;
  timespec v6;
  std::string *v7;
  uint64_t v8;
  std::sub_match<const char *> *v9;
  uint64_t v10;
  __int128 v11;
  int v12;
  int v13;
  unsigned int v14;
  std::string *v15;
  __int128 v16;
  std::string *v17;
  __int128 v18;
  int v19;
  std::sub_match<const char *> *v20;
  uint64_t v21;
  void **v22;
  __int128 v23;
  void *tv_nsec;
  unsigned __int8 *v25;
  char *tv_sec;
  uint64_t v27;
  size_t size;
  std::string *v29;
  _BYTE *v30;
  char v31;
  std::string *v32;
  size_t v33;
  unint64_t v34;
  uint64_t v35;
  std::string *v36;
  char *v37;
  size_t v38;
  std::string *v39;
  _BYTE *v40;
  int v41;
  unsigned __int8 *v42;
  int v43;
  char *v44;
  char *v45;
  char *v46;
  char v47;
  unsigned __int8 v48;
  std::string *v49;
  size_t v50;
  size_t v51;
  unint64_t v52;
  uint64_t v53;
  void *v54;
  std::string::size_type v55;
  char *v56;
  char *v57;
  uint64_t v58;
  char *v59;
  char v60;
  unsigned __int8 v61;
  std::string *v62;
  size_t v63;
  size_t v64;
  unint64_t v65;
  uint64_t v66;
  void *v67;
  std::string::size_type v68;
  char *v69;
  unint64_t v70;
  uint64_t v71;
  unsigned int v72;
  uint64_t v73;
  __darwin_time_t v74;
  BOOL v75;
  char **v76;
  char *v77;
  timespec *v78;
  char *v79;
  unsigned __int8 v80;
  std::string *v81;
  char *v82;
  char v83;
  unsigned __int8 v84;
  std::string *v85;
  size_t v86;
  size_t v87;
  unint64_t v88;
  uint64_t v89;
  void *v90;
  std::string::size_type v91;
  char *v92;
  size_t v93;
  unint64_t v94;
  uint64_t v95;
  std::string *v96;
  char *v97;
  char *v98;
  char *v99;
  char v100;
  unsigned __int8 v101;
  std::string *v102;
  size_t v103;
  size_t v104;
  unint64_t v105;
  uint64_t v106;
  void *v107;
  std::string::size_type v108;
  char *v109;
  char *st_blocks;
  dev_t st_rdev;
  int v112;
  _QWORD *v113;
  timespec *p_st_ctimespec;
  std::sub_match<const char *> *v115;
  std::sub_match<const char *> *st_ino;
  __int128 v117;
  char v118;
  __int128 v119;
  int v120;
  char *v121;
  size_t v122;
  std::string *v123;
  _BYTE *v124;
  char v125;
  std::string *v126;
  size_t v127;
  unint64_t v128;
  uint64_t v129;
  std::string *v130;
  char *v131;
  char first;
  unsigned __int8 v133;
  std::string *v134;
  size_t v135;
  size_t v136;
  unint64_t v137;
  uint64_t v138;
  void *v139;
  std::string::size_type v140;
  char *v141;
  std::__shared_weak_count *v142;
  unint64_t *v143;
  unint64_t v144;
  uint64_t v145;
  unsigned int v147;
  char *__s;
  size_t v149;
  char *v150;
  uint64_t *p_tv_nsec;
  std::string v152;
  void *__p[4];
  std::string v154;
  std::locale v155[2];
  _BYTE v156[48];
  stat v157;
  std::string v158[2];
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  __int128 v164;
  uint64_t v165;

  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v156[32] = v3;
  *(_OWORD *)v156 = v3;
  *(_OWORD *)&v156[16] = v3;
  *(_OWORD *)&v155[0].__locale_ = v3;
  MEMORY[0x212BEA41C](v155);
  v155[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v155, MEMORY[0x24BEDB350]);
  *(_QWORD *)v156 = std::locale::use_facet(v155, MEMORY[0x24BEDB4B0]);
  memset(&v156[8], 0, 40);
  if (std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>((uint64_t)v155, (std::basic_regex<char> *)"^([/_\\-[:alnum:]]*)(.*)", (std::basic_regex<char> *)"") != (std::basic_regex<char> *)"")std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>();
  memset(&v154, 170, sizeof(v154));
  v4 = a1;
  v145 = a2;
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v154, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v154 = *(std::string *)a1;
  v5 = 0;
  p_tv_nsec = &v157.st_mtimespec.tv_nsec;
LABEL_6:
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v157.st_blksize = v6;
  *(timespec *)v157.st_qspare = v6;
  v157.st_birthtimespec = v6;
  *(timespec *)&v157.st_size = v6;
  v157.st_mtimespec = v6;
  v157.st_ctimespec = v6;
  *(timespec *)&v157.st_uid = v6;
  v157.st_atimespec = v6;
  *(timespec *)&v157.st_dev = v6;
  if ((v154.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v7 = &v154;
  else
    v7 = (std::string *)v154.__r_.__value_.__r.__words[0];
  if (stat((const char *)v7, &v157))
  {
    *(std::string *)v145 = v154;
  }
  else
  {
    v8 = *(unsigned __int8 *)(v4 + 23);
    if ((v8 & 0x80u) == 0)
      v9 = (std::sub_match<const char *> *)v4;
    else
      v9 = *(std::sub_match<const char *> **)v4;
    if ((v8 & 0x80u) != 0)
      v8 = *(_QWORD *)(v4 + 8);
    v10 = (uint64_t)v9 + v8;
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v164 = v11;
    v161 = 0xAAAAAAAAAAAAAA00;
    v158[1].__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAAAALL;
    v159 = 0;
    v160 = 0;
    v162 = 0;
    v163 = 0;
    LOBYTE(v164) = 0;
    BYTE8(v164) = 0;
    v165 = 0;
    memset(v158, 0, 41);
    *(_OWORD *)&v157.st_birthtimespec.tv_nsec = v11;
    v157.st_ctimespec.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v157.st_atimespec.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    memset(&v157.st_mtimespec, 0, 17);
    memset(&v157.st_ctimespec.tv_nsec, 0, 17);
    LOBYTE(v157.st_size) = 0;
    v157.st_blocks = 0;
    memset(&v157, 0, 41);
    v12 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v155, v9, (std::sub_match<const char *> *)((char *)v9 + v8), (std::vector<std::csub_match> *)&v157, 4160);
    std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((uint64_t)v158, (uint64_t)v9, v10, (uint64_t *)&v157.st_dev, 0);
    if (*(_QWORD *)&v157.st_dev)
      operator delete(*(void **)&v157.st_dev);
    if ((_BYTE)v164)
      v13 = v12 ^ 1;
    else
      v13 = 1;
    if (v158[0].__r_.__value_.__r.__words[0])
      operator delete(v158[0].__r_.__value_.__l.__data_);
    if ((v12 & v13) != 0)
    {
      v14 = v5 + 1;
      memset(__p, 170, 24);
      std::to_string(v158, v14);
      v15 = std::string::insert(v158, 0, "$1-", 3uLL);
      v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
      *(_QWORD *)&v157.st_uid = *((_QWORD *)&v15->__r_.__value_.__l + 2);
      *(_OWORD *)&v157.st_dev = v16;
      v15->__r_.__value_.__l.__size_ = 0;
      v15->__r_.__value_.__r.__words[2] = 0;
      v15->__r_.__value_.__r.__words[0] = 0;
      v17 = std::string::append((std::string *)&v157, "$2", 2uLL);
      v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
      __p[2] = (void *)v17->__r_.__value_.__r.__words[2];
      *(_OWORD *)__p = v18;
      v17->__r_.__value_.__l.__size_ = 0;
      v17->__r_.__value_.__r.__words[2] = 0;
      v17->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v157.st_gid) < 0)
      {
        operator delete(*(void **)&v157.st_dev);
        if ((SHIBYTE(v158[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_25;
      }
      else if ((SHIBYTE(v158[0].__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_25:
        memset(&v152, 0, sizeof(v152));
        v19 = *(char *)(v4 + 23);
        if (v19 >= 0)
          v20 = (std::sub_match<const char *> *)v4;
        else
          v20 = *(std::sub_match<const char *> **)v4;
        if (v19 >= 0)
          v21 = *(unsigned __int8 *)(v4 + 23);
        else
          v21 = *(_QWORD *)(v4 + 8);
        v22 = __p;
        if (SHIBYTE(__p[2]) < 0)
          v22 = (void **)__p[0];
        __s = (char *)v22;
        *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v157.st_gen = v23;
        v157.st_size = 0xAAAAAAAAAAAAAAAALL;
        v157.st_ctimespec.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
        *(&v157.st_rdev + 1) = -1431655766;
        *(_QWORD *)&v157.st_dev = v20;
        v157.st_ino = (__darwin_ino64_t)v20 + v21;
        *(_QWORD *)&v157.st_uid = v155;
        v157.st_rdev = 0;
        memset(&v157.st_birthtimespec, 0, 17);
        memset(&v157.st_blocks, 0, 17);
        LOBYTE(v157.st_qspare[0]) = 0;
        v157.st_qspare[1] = 0;
        memset(&v157.st_atimespec, 0, 41);
        v164 = v23;
        v161 = 0xAAAAAAAAAAAAAA00;
        v158[1].__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAAAALL;
        v159 = 0;
        v160 = 0;
        v162 = 0;
        v163 = 0;
        LOBYTE(v164) = 0;
        BYTE8(v164) = 0;
        v165 = 0;
        memset(v158, 0, 41);
        std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>((uint64_t)v155, v20, (std::sub_match<const char *> *)((char *)v20 + v21), (std::vector<std::csub_match> *)v158, 0);
        std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((uint64_t)&v157.st_atimespec, (uint64_t)v20, (uint64_t)v20 + v21, (uint64_t *)v158, 0);
        v147 = v14;
        if (v158[0].__r_.__value_.__r.__words[0])
          operator delete(v158[0].__r_.__value_.__l.__data_);
        tv_nsec = (void *)v157.st_atimespec.tv_nsec;
        if (v157.st_atimespec.tv_nsec != v157.st_atimespec.tv_sec)
        {
          v149 = strlen(__s);
          v25 = (unsigned __int8 *)&__s[v149];
          while (1)
          {
            tv_sec = (char *)v157.st_birthtimespec.tv_sec;
            v27 = v157.st_birthtimespec.tv_nsec;
            while (tv_sec != (char *)v27)
            {
              v31 = *tv_sec;
              if ((SHIBYTE(v152.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
                if (HIBYTE(v152.__r_.__value_.__r.__words[2]) != 22)
                {
                  size = HIBYTE(v152.__r_.__value_.__r.__words[2]);
                  *((_BYTE *)&v152.__r_.__value_.__s + 23) = (*((_BYTE *)&v152.__r_.__value_.__s + 23) + 1) & 0x7F;
                  v29 = &v152;
                  goto LABEL_41;
                }
                v32 = &v152;
                size = 22;
LABEL_49:
                if (size + 1 > 2 * size)
                  v34 = size + 1;
                else
                  v34 = 2 * size;
                v35 = (v34 & 0x7FFFFFFFFFFFFFF8) + 8;
                if ((v34 | 7) != 0x17)
                  v35 = v34 | 7;
                if (v34 >= 0x17)
                  v33 = v35 + 1;
                else
                  v33 = 23;
LABEL_57:
                v36 = (std::string *)operator new(v33);
                v29 = v36;
                if (!size || (memmove(v36, v32, size), size != 22))
                  operator delete(v32);
                v152.__r_.__value_.__r.__words[0] = (std::string::size_type)v29;
                v152.__r_.__value_.__r.__words[2] = v33 | 0x8000000000000000;
                goto LABEL_62;
              }
              size = (v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
              if (v152.__r_.__value_.__l.__size_ == size)
              {
                if ((v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8)
                  std::string::__throw_length_error[abi:ne180100]();
                v32 = (std::string *)v152.__r_.__value_.__r.__words[0];
                v33 = 0x7FFFFFFFFFFFFFF7;
                if (size < 0x3FFFFFFFFFFFFFF3)
                  goto LABEL_49;
                goto LABEL_57;
              }
              size = v152.__r_.__value_.__l.__size_;
              v29 = (std::string *)v152.__r_.__value_.__r.__words[0];
LABEL_62:
              v152.__r_.__value_.__l.__size_ = size + 1;
LABEL_41:
              v30 = (char *)v29 + size;
              *v30 = v31;
              v30[1] = 0;
              ++tv_sec;
            }
            if (v149)
              break;
LABEL_201:
            st_blocks = (char *)v157.st_blocks;
            v150 = *(char **)&v157.st_blksize;
            st_rdev = v157.st_rdev;
            v112 = v157.st_rdev | 0x800;
            v157.st_rdev |= 0x800u;
            tv_nsec = (void *)v157.st_atimespec.tv_sec;
            v113 = p_tv_nsec;
            if (v157.st_atimespec.tv_nsec != v157.st_atimespec.tv_sec)
              v113 = (_QWORD *)v157.st_atimespec.tv_sec;
            p_st_ctimespec = (timespec *)(v157.st_atimespec.tv_sec + 8);
            if (v157.st_atimespec.tv_nsec == v157.st_atimespec.tv_sec)
              p_st_ctimespec = &v157.st_ctimespec;
            v115 = (std::sub_match<const char *> *)p_st_ctimespec->tv_sec;
            st_ino = (std::sub_match<const char *> *)v157.st_ino;
            if (*v113 != p_st_ctimespec->tv_sec)
            {
LABEL_206:
              v157.st_rdev = v112 | 0x80;
              *(_QWORD *)&v117 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v117 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v164 = v117;
              v161 = 0xAAAAAAAAAAAAAA00;
              v158[1].__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAAAALL;
              v159 = 0;
              v160 = 0;
              v162 = 0;
              v163 = 0;
              LOBYTE(v164) = 0;
              BYTE8(v164) = 0;
              v165 = 0;
              memset(v158, 0, 41);
              v118 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(*(uint64_t *)&v157.st_uid, v115, st_ino, (std::vector<std::csub_match> *)v158, v112 | 0x80u);
              std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((uint64_t)&v157.st_atimespec, (uint64_t)v115, (uint64_t)st_ino, (uint64_t *)v158, (v112 & 0x800) != 0);
              if (v158[0].__r_.__value_.__r.__words[0])
                operator delete(v158[0].__r_.__value_.__l.__data_);
              tv_nsec = (void *)v157.st_atimespec.tv_sec;
              if ((v118 & 1) != 0)
                goto LABEL_38;
              goto LABEL_215;
            }
            if ((std::sub_match<const char *> *)v157.st_ino == v115)
            {
LABEL_215:
              if (tv_nsec)
                operator delete(tv_nsec);
              tv_nsec = 0;
              LOBYTE(v157.st_qspare[0]) = 0;
              memset(&v157.st_atimespec, 0, 41);
              memset(&v157.st_birthtimespec, 0, 17);
              memset(&v157.st_blocks, 0, 17);
              v157.st_qspare[1] = 0;
              goto LABEL_38;
            }
            *(_QWORD *)&v119 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v119 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v164 = v119;
            v161 = 0xAAAAAAAAAAAAAA00;
            v158[1].__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAAAALL;
            v159 = 0;
            v160 = 0;
            v162 = 0;
            v163 = 0;
            LOBYTE(v164) = 0;
            BYTE8(v164) = 0;
            v165 = 0;
            memset(v158, 0, 41);
            v120 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(*(uint64_t *)&v157.st_uid, v115, (std::sub_match<const char *> *)v157.st_ino, (std::vector<std::csub_match> *)v158, st_rdev | 0x860u);
            std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((uint64_t)&v157.st_atimespec, (uint64_t)v115, (uint64_t)st_ino, (uint64_t *)v158, 1);
            if (v158[0].__r_.__value_.__r.__words[0])
              operator delete(v158[0].__r_.__value_.__l.__data_);
            if (!v120)
            {
              v115 = (std::sub_match<const char *> *)((char *)v115 + 1);
              v112 = v157.st_rdev;
              st_ino = (std::sub_match<const char *> *)v157.st_ino;
              goto LABEL_206;
            }
            tv_nsec = (void *)v157.st_atimespec.tv_sec;
LABEL_38:
            if ((void *)v157.st_atimespec.tv_nsec == tv_nsec)
            {
              v121 = v150;
              while (1)
              {
                if (st_blocks == v121)
                  goto LABEL_272;
                v125 = *st_blocks;
                if ((SHIBYTE(v152.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  break;
                v122 = (v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
                if (v152.__r_.__value_.__l.__size_ == v122)
                {
                  if ((v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8)
                    std::string::__throw_length_error[abi:ne180100]();
                  v126 = (std::string *)v152.__r_.__value_.__r.__words[0];
                  v127 = 0x7FFFFFFFFFFFFFF7;
                  if (v122 < 0x3FFFFFFFFFFFFFF3)
                    goto LABEL_228;
                  goto LABEL_236;
                }
                v122 = v152.__r_.__value_.__l.__size_;
                v123 = (std::string *)v152.__r_.__value_.__r.__words[0];
LABEL_241:
                v152.__r_.__value_.__l.__size_ = v122 + 1;
LABEL_220:
                v124 = (char *)v123 + v122;
                *v124 = v125;
                v124[1] = 0;
                ++st_blocks;
              }
              if (HIBYTE(v152.__r_.__value_.__r.__words[2]) != 22)
              {
                v122 = HIBYTE(v152.__r_.__value_.__r.__words[2]);
                *((_BYTE *)&v152.__r_.__value_.__s + 23) = (*((_BYTE *)&v152.__r_.__value_.__s + 23) + 1) & 0x7F;
                v123 = &v152;
                goto LABEL_220;
              }
              v126 = &v152;
              v122 = 22;
LABEL_228:
              if (v122 + 1 > 2 * v122)
                v128 = v122 + 1;
              else
                v128 = 2 * v122;
              v129 = (v128 & 0x7FFFFFFFFFFFFFF8) + 8;
              if ((v128 | 7) != 0x17)
                v129 = v128 | 7;
              if (v128 >= 0x17)
                v127 = v129 + 1;
              else
                v127 = 23;
LABEL_236:
              v130 = (std::string *)operator new(v127);
              v123 = v130;
              if (!v122 || (memmove(v130, v126, v122), v122 != 22))
                operator delete(v126);
              v152.__r_.__value_.__r.__words[0] = (std::string::size_type)v123;
              v152.__r_.__value_.__r.__words[2] = v127 | 0x8000000000000000;
              v121 = v150;
              goto LABEL_241;
            }
          }
          v37 = __s;
          while (1)
          {
            v41 = *v37;
            if (v41 != 36)
              goto LABEL_134;
            v42 = (unsigned __int8 *)(v37 + 1);
            if (v37 + 1 == (char *)v25)
              goto LABEL_133;
            v43 = (char)*v42;
            v41 = *v42;
            if (v43 > 38)
              break;
            if (v43 == 36)
            {
              ++v37;
              v80 = HIBYTE(v152.__r_.__value_.__r.__words[2]);
              if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
              {
LABEL_160:
                v38 = (v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
                if (v152.__r_.__value_.__l.__size_ == v38)
                {
                  if ((v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8)
LABEL_283:
                    std::string::__throw_length_error[abi:ne180100]();
                  v81 = (std::string *)v152.__r_.__value_.__r.__words[0];
                  v93 = 0x7FFFFFFFFFFFFFF7;
                  if (v38 < 0x3FFFFFFFFFFFFFF3)
                  {
LABEL_163:
                    if (v38 + 1 > 2 * v38)
                      v94 = v38 + 1;
                    else
                      v94 = 2 * v38;
                    v95 = (v94 & 0x7FFFFFFFFFFFFFF8) + 8;
                    if ((v94 | 7) != 0x17)
                      v95 = v94 | 7;
                    if (v94 >= 0x17)
                      v93 = v95 + 1;
                    else
                      v93 = 23;
                  }
                  v96 = (std::string *)operator new(v93);
                  v39 = v96;
                  if (!v38 || (memmove(v96, v81, v38), v38 != 22))
                    operator delete(v81);
                  v152.__r_.__value_.__r.__words[0] = (std::string::size_type)v39;
                  v152.__r_.__value_.__r.__words[2] = v93 | 0x8000000000000000;
                }
                else
                {
                  v38 = v152.__r_.__value_.__l.__size_;
                  v39 = (std::string *)v152.__r_.__value_.__r.__words[0];
                }
                v152.__r_.__value_.__l.__size_ = v38 + 1;
                goto LABEL_66;
              }
LABEL_135:
              if (v80 == 22)
              {
                v81 = &v152;
                v38 = 22;
                goto LABEL_163;
              }
              v38 = v80;
              *((_BYTE *)&v152.__r_.__value_.__s + 23) = (v80 + 1) & 0x7F;
              v39 = &v152;
LABEL_66:
              v40 = (char *)v39 + v38;
              *v40 = v41;
              v40[1] = 0;
              if (++v37 == (char *)v25)
                goto LABEL_201;
            }
            else
            {
              if (v43 != 38)
                goto LABEL_122;
              v44 = *(char **)v157.st_atimespec.tv_sec;
              v45 = *(char **)(v157.st_atimespec.tv_sec + 8);
              if (*(char **)v157.st_atimespec.tv_sec != v45)
              {
                while (1)
                {
                  while (1)
                  {
                    v47 = *v44;
                    v48 = HIBYTE(v152.__r_.__value_.__r.__words[2]);
                    if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
                      break;
                    if (HIBYTE(v152.__r_.__value_.__r.__words[2]) == 22)
                    {
                      v49 = &v152;
                      v50 = 22;
                      goto LABEL_81;
                    }
                    *((_BYTE *)&v152.__r_.__value_.__s + 23) = (*((_BYTE *)&v152.__r_.__value_.__s + 23) + 1) & 0x7F;
                    v46 = (char *)&v152 + v48;
                    *v46 = v47;
                    v46[1] = 0;
                    if (++v44 == v45)
                      goto LABEL_200;
                  }
                  v50 = (v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
                  if (v152.__r_.__value_.__l.__size_ == v50)
                    break;
                  v50 = v152.__r_.__value_.__l.__size_;
                  v55 = v152.__r_.__value_.__r.__words[0];
LABEL_94:
                  v152.__r_.__value_.__l.__size_ = v50 + 1;
                  v56 = (char *)(v55 + v50);
                  *v56 = v47;
                  v56[1] = 0;
                  if (++v44 == v45)
                    goto LABEL_200;
                }
                if ((v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8)
                  goto LABEL_283;
                v49 = (std::string *)v152.__r_.__value_.__r.__words[0];
                v51 = 0x7FFFFFFFFFFFFFF7;
                if (v50 < 0x3FFFFFFFFFFFFFF3)
                {
LABEL_81:
                  if (v50 + 1 > 2 * v50)
                    v52 = v50 + 1;
                  else
                    v52 = 2 * v50;
                  v53 = (v52 & 0x7FFFFFFFFFFFFFF8) + 8;
                  if ((v52 | 7) != 0x17)
                    v53 = v52 | 7;
                  if (v52 >= 0x17)
                    v51 = v53 + 1;
                  else
                    v51 = 23;
                }
                v54 = operator new(v51);
                v55 = (std::string::size_type)v54;
                if (!v50 || (memmove(v54, v49, v50), v50 != 22))
                  operator delete(v49);
                v152.__r_.__value_.__r.__words[0] = v55;
                v152.__r_.__value_.__r.__words[2] = v51 | 0x8000000000000000;
                goto LABEL_94;
              }
LABEL_200:
              v37 = (char *)(v42 + 1);
              if (v42 + 1 == v25)
                goto LABEL_201;
            }
          }
          if (v43 == 39)
          {
            v97 = (char *)v157.st_blocks;
            v98 = *(char **)&v157.st_blksize;
            if (v157.st_blocks == *(_QWORD *)&v157.st_blksize)
              goto LABEL_200;
            while (2)
            {
              while (2)
              {
                v100 = *v97;
                v101 = HIBYTE(v152.__r_.__value_.__r.__words[2]);
                if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
                {
                  v103 = (v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
                  if (v152.__r_.__value_.__l.__size_ == v103)
                  {
                    if ((v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8)
                      goto LABEL_283;
                    v102 = (std::string *)v152.__r_.__value_.__r.__words[0];
                    v104 = 0x7FFFFFFFFFFFFFF7;
                    if (v103 < 0x3FFFFFFFFFFFFFF3)
                      goto LABEL_186;
                    goto LABEL_194;
                  }
                  v103 = v152.__r_.__value_.__l.__size_;
                  v108 = v152.__r_.__value_.__r.__words[0];
                }
                else
                {
                  if (HIBYTE(v152.__r_.__value_.__r.__words[2]) != 22)
                  {
                    *((_BYTE *)&v152.__r_.__value_.__s + 23) = (*((_BYTE *)&v152.__r_.__value_.__s + 23) + 1) & 0x7F;
                    v99 = (char *)&v152 + v101;
                    *v99 = v100;
                    v99[1] = 0;
                    if (++v97 == v98)
                      goto LABEL_200;
                    continue;
                  }
                  v102 = &v152;
                  v103 = 22;
LABEL_186:
                  if (v103 + 1 > 2 * v103)
                    v105 = v103 + 1;
                  else
                    v105 = 2 * v103;
                  v106 = (v105 & 0x7FFFFFFFFFFFFFF8) + 8;
                  if ((v105 | 7) != 0x17)
                    v106 = v105 | 7;
                  if (v105 >= 0x17)
                    v104 = v106 + 1;
                  else
                    v104 = 23;
LABEL_194:
                  v107 = operator new(v104);
                  v108 = (std::string::size_type)v107;
                  if (!v103 || (memmove(v107, v102, v103), v103 != 22))
                    operator delete(v102);
                  v152.__r_.__value_.__r.__words[0] = v108;
                  v152.__r_.__value_.__r.__words[2] = v104 | 0x8000000000000000;
                }
                break;
              }
              v152.__r_.__value_.__l.__size_ = v103 + 1;
              v109 = (char *)(v108 + v103);
              *v109 = v100;
              v109[1] = 0;
              if (++v97 == v98)
                goto LABEL_200;
              continue;
            }
          }
          if (v43 == 96)
          {
            v57 = (char *)v157.st_birthtimespec.tv_sec;
            v58 = v157.st_birthtimespec.tv_nsec;
            if (v157.st_birthtimespec.tv_sec == v157.st_birthtimespec.tv_nsec)
              goto LABEL_200;
            while (2)
            {
              while (2)
              {
                v60 = *v57;
                v61 = HIBYTE(v152.__r_.__value_.__r.__words[2]);
                if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
                {
                  v63 = (v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
                  if (v152.__r_.__value_.__l.__size_ == v63)
                  {
                    if ((v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8)
                      goto LABEL_283;
                    v62 = (std::string *)v152.__r_.__value_.__r.__words[0];
                    v64 = 0x7FFFFFFFFFFFFFF7;
                    if (v63 < 0x3FFFFFFFFFFFFFF3)
                      goto LABEL_107;
                    goto LABEL_115;
                  }
                  v63 = v152.__r_.__value_.__l.__size_;
                  v68 = v152.__r_.__value_.__r.__words[0];
                }
                else
                {
                  if (HIBYTE(v152.__r_.__value_.__r.__words[2]) != 22)
                  {
                    *((_BYTE *)&v152.__r_.__value_.__s + 23) = (*((_BYTE *)&v152.__r_.__value_.__s + 23) + 1) & 0x7F;
                    v59 = (char *)&v152 + v61;
                    *v59 = v60;
                    v59[1] = 0;
                    if (++v57 == (char *)v58)
                      goto LABEL_200;
                    continue;
                  }
                  v62 = &v152;
                  v63 = 22;
LABEL_107:
                  if (v63 + 1 > 2 * v63)
                    v65 = v63 + 1;
                  else
                    v65 = 2 * v63;
                  v66 = (v65 & 0x7FFFFFFFFFFFFFF8) + 8;
                  if ((v65 | 7) != 0x17)
                    v66 = v65 | 7;
                  if (v65 >= 0x17)
                    v64 = v66 + 1;
                  else
                    v64 = 23;
LABEL_115:
                  v67 = operator new(v64);
                  v68 = (std::string::size_type)v67;
                  if (!v63 || (memmove(v67, v62, v63), v63 != 22))
                    operator delete(v62);
                  v152.__r_.__value_.__r.__words[0] = v68;
                  v152.__r_.__value_.__r.__words[2] = v64 | 0x8000000000000000;
                }
                break;
              }
              v152.__r_.__value_.__l.__size_ = v63 + 1;
              v69 = (char *)(v68 + v63);
              *v69 = v60;
              v69[1] = 0;
              if (++v57 == (char *)v58)
                goto LABEL_200;
              continue;
            }
          }
LABEL_122:
          if ((v41 - 48) <= 9)
          {
            v70 = *v42 - 48;
            if (v37 + 2 != (char *)v25)
            {
              v71 = v37[2];
              v72 = v71 - 48;
              v73 = v71 + 10 * (int)v70 - 48;
              if (v72 > 9)
              {
                v42 = (unsigned __int8 *)(v37 + 1);
              }
              else
              {
                v70 = v73;
                v42 = (unsigned __int8 *)(v37 + 2);
              }
            }
            v74 = v157.st_atimespec.tv_sec + 24 * (int)v70;
            v75 = 0xAAAAAAAAAAAAAAABLL * ((v157.st_atimespec.tv_nsec - v157.st_atimespec.tv_sec) >> 3) > v70;
            v76 = (char **)p_tv_nsec;
            if (v75)
              v76 = (char **)v74;
            v77 = *v76;
            v78 = (timespec *)(v74 + 8);
            if (!v75)
              v78 = &v157.st_ctimespec;
            v79 = (char *)v78->tv_sec;
            if (v77 == (char *)v78->tv_sec)
              goto LABEL_200;
            while (2)
            {
              while (2)
              {
                v83 = *v77;
                v84 = HIBYTE(v152.__r_.__value_.__r.__words[2]);
                if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
                {
                  v86 = (v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
                  if (v152.__r_.__value_.__l.__size_ == v86)
                  {
                    if ((v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8)
                      goto LABEL_283;
                    v85 = (std::string *)v152.__r_.__value_.__r.__words[0];
                    v87 = 0x7FFFFFFFFFFFFFF7;
                    if (v86 < 0x3FFFFFFFFFFFFFF3)
                      goto LABEL_144;
                    goto LABEL_152;
                  }
                  v86 = v152.__r_.__value_.__l.__size_;
                  v91 = v152.__r_.__value_.__r.__words[0];
                }
                else
                {
                  if (HIBYTE(v152.__r_.__value_.__r.__words[2]) != 22)
                  {
                    *((_BYTE *)&v152.__r_.__value_.__s + 23) = (*((_BYTE *)&v152.__r_.__value_.__s + 23) + 1) & 0x7F;
                    v82 = (char *)&v152 + v84;
                    *v82 = v83;
                    v82[1] = 0;
                    if (++v77 == v79)
                      goto LABEL_200;
                    continue;
                  }
                  v85 = &v152;
                  v86 = 22;
LABEL_144:
                  if (v86 + 1 > 2 * v86)
                    v88 = v86 + 1;
                  else
                    v88 = 2 * v86;
                  v89 = (v88 & 0x7FFFFFFFFFFFFFF8) + 8;
                  if ((v88 | 7) != 0x17)
                    v89 = v88 | 7;
                  if (v88 >= 0x17)
                    v87 = v89 + 1;
                  else
                    v87 = 23;
LABEL_152:
                  v90 = operator new(v87);
                  v91 = (std::string::size_type)v90;
                  if (!v86 || (memmove(v90, v85, v86), v86 != 22))
                    operator delete(v85);
                  v152.__r_.__value_.__r.__words[0] = v91;
                  v152.__r_.__value_.__r.__words[2] = v87 | 0x8000000000000000;
                }
                break;
              }
              v152.__r_.__value_.__l.__size_ = v86 + 1;
              v92 = (char *)(v91 + v86);
              *v92 = v83;
              v92[1] = 0;
              if (++v77 == v79)
                goto LABEL_200;
              continue;
            }
          }
LABEL_133:
          LOBYTE(v41) = 36;
LABEL_134:
          v80 = HIBYTE(v152.__r_.__value_.__r.__words[2]);
          if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
            goto LABEL_160;
          goto LABEL_135;
        }
        if (!v21)
        {
          if (!v157.st_atimespec.tv_nsec)
            goto LABEL_247;
          goto LABEL_246;
        }
        while (1)
        {
          while (1)
          {
            first = (char)v20->first;
            v133 = HIBYTE(v152.__r_.__value_.__r.__words[2]);
            if (SHIBYTE(v152.__r_.__value_.__r.__words[2]) < 0)
              break;
            if (HIBYTE(v152.__r_.__value_.__r.__words[2]) == 22)
            {
              v134 = &v152;
              v135 = 22;
              goto LABEL_258;
            }
            *((_BYTE *)&v152.__r_.__value_.__s + 23) = (*((_BYTE *)&v152.__r_.__value_.__s + 23) + 1) & 0x7F;
            v131 = (char *)&v152 + v133;
            *v131 = first;
            v131[1] = 0;
            v20 = (std::sub_match<const char *> *)((char *)v20 + 1);
            if (!--v21)
              goto LABEL_272;
          }
          v135 = (v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
          if (v152.__r_.__value_.__l.__size_ == v135)
            break;
          v135 = v152.__r_.__value_.__l.__size_;
          v140 = v152.__r_.__value_.__r.__words[0];
LABEL_271:
          v152.__r_.__value_.__l.__size_ = v135 + 1;
          v141 = (char *)(v140 + v135);
          *v141 = first;
          v141[1] = 0;
          v20 = (std::sub_match<const char *> *)((char *)v20 + 1);
          if (!--v21)
          {
LABEL_272:
            v4 = a1;
            if (!tv_nsec)
            {
LABEL_247:
              if (SHIBYTE(v154.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v154.__r_.__value_.__l.__data_);
              v154 = v152;
              v5 = v147;
              if (SHIBYTE(__p[2]) < 0)
                operator delete(__p[0]);
              goto LABEL_6;
            }
LABEL_246:
            operator delete(tv_nsec);
            goto LABEL_247;
          }
        }
        if ((v152.__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8)
          std::string::__throw_length_error[abi:ne180100]();
        v134 = (std::string *)v152.__r_.__value_.__r.__words[0];
        v136 = 0x7FFFFFFFFFFFFFF7;
        if (v135 < 0x3FFFFFFFFFFFFFF3)
        {
LABEL_258:
          if (v135 + 1 > 2 * v135)
            v137 = v135 + 1;
          else
            v137 = 2 * v135;
          v138 = (v137 & 0x7FFFFFFFFFFFFFF8) + 8;
          if ((v137 | 7) != 0x17)
            v138 = v137 | 7;
          if (v137 >= 0x17)
            v136 = v138 + 1;
          else
            v136 = 23;
        }
        v139 = operator new(v136);
        v140 = (std::string::size_type)v139;
        if (!v135 || (memmove(v139, v134, v135), v135 != 22))
          operator delete(v134);
        v152.__r_.__value_.__r.__words[0] = v140;
        v152.__r_.__value_.__r.__words[2] = v136 | 0x8000000000000000;
        goto LABEL_271;
      }
      operator delete(v158[0].__r_.__value_.__l.__data_);
      goto LABEL_25;
    }
    *(_BYTE *)(v145 + 23) = 0;
    *(_BYTE *)v145 = 0;
    if (SHIBYTE(v154.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v154.__r_.__value_.__l.__data_);
  }
  v142 = *(std::__shared_weak_count **)&v156[32];
  if (*(_QWORD *)&v156[32])
  {
    v143 = (unint64_t *)(*(_QWORD *)&v156[32] + 8);
    do
      v144 = __ldaxr(v143);
    while (__stlxr(v144 - 1, v143));
    if (!v144)
    {
      ((void (*)(std::__shared_weak_count *))v142->__on_zero_shared)(v142);
      std::__shared_weak_count::__release_weak(v142);
    }
  }
  std::locale::~locale(v155);
}

void sub_212475AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,std::locale a39)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a39);
  _Unwind_Resume(a1);
}

void sub_212475AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,std::locale a39)
{
  uint64_t v39;

  std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](v39);
  std::locale::~locale(&a39);
  _Unwind_Resume(a1);
}

void sub_212475AF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,std::locale a39)
{
  std::locale::~locale(&a39);
  _Unwind_Resume(a1);
}

void sub_212475B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46,uint64_t a47,std::locale a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,void *__p,uint64_t a57,int a58,__int16 a59,char a60,char a61,uint64_t a62,void *a63)
{
  uint64_t v63;

  if (a61 < 0)
    operator delete(__p);
  if (*(char *)(v63 - 185) < 0)
    operator delete(*(void **)(v63 - 208));
  if (a46 < 0)
    operator delete(a41);
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a48);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::~basic_regex(std::locale *this)
{
  std::__shared_weak_count *locale;
  unint64_t *p_shared_owners;
  unint64_t v4;

  locale = (std::__shared_weak_count *)this[6].__locale_;
  if (!locale)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&locale->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
    std::__shared_weak_count::__release_weak(locale);
    std::locale::~locale(this);
  }
  else
  {
LABEL_5:
    std::locale::~locale(this);
  }
}

void support::fs::createUniquePath(const char *a1@<X0>, std::string *a2@<X8>)
{
  const char *v2;
  timespec v4;
  timespec v5;
  size_t v6;
  __darwin_ino64_t v7;
  int v8;
  timespec v9;
  stat *p_dst;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const std::string::value_type *v14;
  std::string::size_type v15;
  std::string *v16;
  __int128 v17;
  timespec v18;
  const char *v19;
  stat __dst;
  stat __src;
  timespec v22;
  timespec v23;
  timespec v24;
  timespec v25;
  timespec v26;
  timespec v27;
  timespec v28;
  uint64_t v29;

  v2 = a1;
  v29 = *MEMORY[0x24BDAC8D0];
  v4.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v4.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&__src.st_blksize = v4;
  *(timespec *)__src.st_qspare = v4;
  __src.st_birthtimespec = v4;
  *(timespec *)&__src.st_size = v4;
  __src.st_mtimespec = v4;
  __src.st_ctimespec = v4;
  *(timespec *)&__src.st_uid = v4;
  __src.st_atimespec = v4;
  *(timespec *)&__src.st_dev = v4;
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  if (!stat(a1, &__src))
  {
    v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    v27 = v5;
    v28 = v5;
    v25 = v5;
    v26 = v5;
    v23 = v5;
    v24 = v5;
    *(timespec *)__src.st_qspare = v5;
    v22 = v5;
    *(timespec *)&__src.st_size = v5;
    *(timespec *)&__src.st_blksize = v5;
    __src.st_ctimespec = v5;
    __src.st_birthtimespec = v5;
    __src.st_atimespec = v5;
    __src.st_mtimespec = v5;
    *(timespec *)&__src.st_dev = v5;
    *(timespec *)&__src.st_uid = v5;
    snprintf((char *)&__src, 0x100uLL, "-%u", 1);
    memset(a2, 170, sizeof(std::string));
    v6 = strlen((const char *)&__src);
    if (v6 > 0x7FFFFFFFFFFFFFF7)
LABEL_32:
      std::string::__throw_length_error[abi:ne180100]();
    v7 = v6;
    v8 = 2;
    while (v7 < 0x17)
    {
      HIBYTE(__dst.st_gid) = v7;
      p_dst = &__dst;
      if (v7)
        goto LABEL_15;
LABEL_16:
      *((_BYTE *)&p_dst->st_dev + v7) = 0;
      v13 = v2[23];
      if (v13 >= 0)
        v14 = v2;
      else
        v14 = *(const std::string::value_type **)v2;
      if (v13 >= 0)
        v15 = *((unsigned __int8 *)v2 + 23);
      else
        v15 = *((_QWORD *)v2 + 1);
      v16 = std::string::insert((std::string *)&__dst, 0, v14, v15);
      v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
      a2->__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
      *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v17;
      v16->__r_.__value_.__l.__size_ = 0;
      v16->__r_.__value_.__r.__words[2] = 0;
      v16->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(__dst.st_gid) < 0)
        operator delete(*(void **)&__dst.st_dev);
      v18.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v18.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&__dst.st_blksize = v18;
      *(timespec *)__dst.st_qspare = v18;
      __dst.st_birthtimespec = v18;
      *(timespec *)&__dst.st_size = v18;
      __dst.st_mtimespec = v18;
      __dst.st_ctimespec = v18;
      *(timespec *)&__dst.st_uid = v18;
      __dst.st_atimespec = v18;
      *(timespec *)&__dst.st_dev = v18;
      if ((a2->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v19 = (const char *)a2;
      else
        v19 = (const char *)a2->__r_.__value_.__r.__words[0];
      if (stat(v19, &__dst))
        return;
      if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
        operator delete(a2->__r_.__value_.__l.__data_);
      v9.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v9.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      v27 = v9;
      v28 = v9;
      v25 = v9;
      v26 = v9;
      v23 = v9;
      v24 = v9;
      *(timespec *)__src.st_qspare = v9;
      v22 = v9;
      *(timespec *)&__src.st_size = v9;
      *(timespec *)&__src.st_blksize = v9;
      __src.st_ctimespec = v9;
      __src.st_birthtimespec = v9;
      __src.st_atimespec = v9;
      __src.st_mtimespec = v9;
      *(timespec *)&__src.st_dev = v9;
      *(timespec *)&__src.st_uid = v9;
      snprintf((char *)&__src, 0x100uLL, "-%u", v8);
      memset(a2, 170, sizeof(std::string));
      v7 = strlen((const char *)&__src);
      ++v8;
      if (v7 > 0x7FFFFFFFFFFFFFF7)
        goto LABEL_32;
    }
    v11 = (v7 & 0x7FFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v11 = v7 | 7;
    v12 = v11 + 1;
    p_dst = (stat *)operator new(v11 + 1);
    __dst.st_ino = v7;
    *(_QWORD *)&__dst.st_uid = v12 | 0x8000000000000000;
    *(_QWORD *)&__dst.st_dev = p_dst;
LABEL_15:
    memcpy(p_dst, &__src, v7);
    goto LABEL_16;
  }
  if (v2[23] < 0)
  {
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)v2, *((_QWORD *)v2 + 1));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)v2;
    a2->__r_.__value_.__r.__words[2] = *((_QWORD *)v2 + 2);
  }
}

void sub_212475F20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

BOOL support::fs::createDir(const char *a1, mode_t a2, int a3)
{
  const char *v5;
  timespec v6;
  const char *v7;
  uint64_t v8;
  unint64_t v9;
  unsigned int v10;
  void **v11;
  std::string::size_type v12;
  uint64_t v13;
  int v14;
  const std::string::value_type *v15;
  std::string::size_type v16;
  timespec v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _BYTE __p[56];
  void *v27[2];
  uint64_t v28;
  stat v29;

  v5 = a1;
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v29.st_blksize = v6;
  *(timespec *)v29.st_qspare = v6;
  v29.st_birthtimespec = v6;
  *(timespec *)&v29.st_size = v6;
  v29.st_mtimespec = v6;
  v29.st_ctimespec = v6;
  *(timespec *)&v29.st_uid = v6;
  v29.st_atimespec = v6;
  *(timespec *)&v29.st_dev = v6;
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  if (!stat(a1, &v29))
    return 1;
  if (!a3)
  {
    if (v5[23] >= 0)
      v21 = v5;
    else
      v21 = *(const char **)v5;
    return mkdir(v21, a2) == 0;
  }
  v27[1] = (void *)0xAAAAAAAAAAAAAAAALL;
  v28 = 0x1AAAAAAAAAAAAAALL;
  v27[0] = (void *)0xAAAAAAAAAAAA002FLL;
  memset(&__p[32], 170, 24);
  ctu::tokenize();
  memset(__p, 0, 24);
  if (v5[23] >= 0)
    v7 = v5;
  else
    v7 = *(const char **)v5;
  if (*v7 == 47)
  {
    *(_OWORD *)__p = *(_OWORD *)v27;
    *(_QWORD *)&__p[16] = v28;
  }
  v8 = *(_QWORD *)&__p[32];
  if (*(_QWORD *)&__p[40] != *(_QWORD *)&__p[32])
  {
    v9 = 0;
    v10 = 1;
    while (1)
    {
      if (v10 != 1)
      {
        if (v28 >= 0)
          v11 = v27;
        else
          v11 = (void **)v27[0];
        if (v28 >= 0)
          v12 = HIBYTE(v28);
        else
          v12 = (std::string::size_type)v27[1];
        std::string::append((std::string *)__p, (const std::string::value_type *)v11, v12);
        v8 = *(_QWORD *)&__p[32];
      }
      v13 = v8 + 24 * v9;
      v14 = *(char *)(v13 + 23);
      v15 = v14 >= 0 ? (const std::string::value_type *)v13 : *(const std::string::value_type **)v13;
      v16 = v14 >= 0 ? *(unsigned __int8 *)(v13 + 23) : *(_QWORD *)(v13 + 8);
      std::string::append((std::string *)__p, v15, v16);
      v17.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v17.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&v29.st_blksize = v17;
      *(timespec *)v29.st_qspare = v17;
      v29.st_birthtimespec = v17;
      *(timespec *)&v29.st_size = v17;
      v29.st_mtimespec = v17;
      v29.st_ctimespec = v17;
      *(timespec *)&v29.st_uid = v17;
      v29.st_atimespec = v17;
      *(timespec *)&v29.st_dev = v17;
      v18 = __p[23] >= 0 ? __p : *(const char **)__p;
      if (stat(v18, &v29))
      {
        v19 = __p[23] >= 0 ? __p : *(const char **)__p;
        if (mkdir(v19, a2))
          break;
      }
      v9 = v10;
      v8 = *(_QWORD *)&__p[32];
      ++v10;
      if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&__p[40] - *(_QWORD *)&__p[32]) >> 3) <= v9)
        goto LABEL_42;
    }
    v20 = 0;
    if ((__p[23] & 0x80000000) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_42:
  v20 = 1;
  if ((__p[23] & 0x80000000) != 0)
LABEL_43:
    operator delete(*(void **)__p);
LABEL_44:
  v22 = *(_QWORD *)&__p[32];
  if (*(_QWORD *)&__p[32])
  {
    v23 = *(_QWORD *)&__p[40];
    v24 = *(void **)&__p[32];
    if (*(_QWORD *)&__p[40] != *(_QWORD *)&__p[32])
    {
      do
      {
        if (*(char *)(v23 - 1) < 0)
          operator delete(*(void **)(v23 - 24));
        v23 -= 24;
      }
      while (v23 != v22);
      v24 = *(void **)&__p[32];
    }
    *(_QWORD *)&__p[40] = v22;
    operator delete(v24);
  }
  if (SHIBYTE(v28) < 0)
    operator delete(v27[0]);
  return v20;
}

void sub_2124761E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a14 < 0)
  {
    operator delete(__p);
    std::vector<std::string>::~vector[abi:ne180100](&a16);
    if ((a24 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(a1);
  }
  else
  {
    std::vector<std::string>::~vector[abi:ne180100](&a16);
    if ((a24 & 0x80000000) == 0)
      goto LABEL_3;
  }
  operator delete(a19);
  _Unwind_Resume(a1);
}

BOOL support::fs::rename(const std::__fs::filesystem::path *a1, const std::__fs::filesystem::path *a2, std::error_code *a3)
{
  int v3;

  if ((a1->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    a1 = (const std::__fs::filesystem::path *)a1->__pn_.__r_.__value_.__r.__words[0];
  if ((a2->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    a2 = (const std::__fs::filesystem::path *)a2->__pn_.__r_.__value_.__r.__words[0];
  rename(a1, a2, a3);
  return v3 == 0;
}

BOOL support::fs::chmod(const char *a1, mode_t a2)
{
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  return chmod(a1, a2) == 0;
}

uint64_t support::fs::removeDir(const char *a1)
{
  const std::__fs::filesystem::path *v1;
  timespec v2;
  _BOOL8 v3;
  std::error_code *v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  char *v8;
  __int128 v9;
  int v10;
  std::string::size_type size;
  std::string *v12;
  std::string *p_p;
  int v14;
  size_t v15;
  unint64_t v16;
  char *p_dst;
  uint64_t v18;
  uint64_t v19;
  const std::__fs::filesystem::path *v20;
  std::string *v21;
  std::string *v22;
  std::string::size_type v23;
  char v24;
  timespec v25;
  std::string *v26;
  std::error_code *v27;
  const std::__fs::filesystem::path *v28;
  std::string *v29;
  char v30;
  std::string *v31;
  DIR *v32;
  DIR *v33;
  dirent *v34;
  const std::__fs::filesystem::path *v35;
  const char *v36;
  void **v37;
  void **v38;
  void *v39;
  std::string __p;
  void *v42;
  void **v43;
  uint64_t v44;
  stat __dst;
  _QWORD v46[5];

  v1 = (const std::__fs::filesystem::path *)a1;
  v46[2] = *MEMORY[0x24BDAC8D0];
  v2.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&__dst.st_blksize = v2;
  *(timespec *)__dst.st_qspare = v2;
  __dst.st_birthtimespec = v2;
  *(timespec *)&__dst.st_size = v2;
  __dst.st_mtimespec = v2;
  __dst.st_ctimespec = v2;
  *(timespec *)&__dst.st_uid = v2;
  __dst.st_atimespec = v2;
  *(timespec *)&__dst.st_dev = v2;
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  if (stat(a1, &__dst))
    return 1;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  support::fs::readDir((const char *)v1, (uint64_t)&v42);
  v5 = 0;
  while (1)
  {
    v6 = v5;
    v7 = 0xAAAAAAAAAAAAAAABLL * (((char *)v43 - (_BYTE *)v42) >> 3);
    v3 = v7 <= v5;
    if (v7 <= v5)
      break;
    v8 = (char *)v42 + 24 * v5;
    memset(&__p, 170, sizeof(__p));
    if (v8[23] < 0)
    {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v8, *((_QWORD *)v8 + 1));
    }
    else
    {
      v9 = *(_OWORD *)v8;
      __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v8 + 2);
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v9;
    }
    v10 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      size = __p.__r_.__value_.__l.__size_;
    if (size == 2)
    {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      if (LOWORD(p_p->__r_.__value_.__l.__data_) == 11822)
      {
LABEL_58:
        v30 = 1;
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_7;
        goto LABEL_6;
      }
    }
    else if (size == 1)
    {
      v12 = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v12 = &__p;
      if (v12->__r_.__value_.__s.__data_[0] == 46)
        goto LABEL_58;
    }
    v14 = SHIBYTE(v1->__pn_.__r_.__value_.__r.__words[2]);
    if (v14 >= 0)
      v15 = HIBYTE(v1->__pn_.__r_.__value_.__r.__words[2]);
    else
      v15 = v1->__pn_.__r_.__value_.__l.__size_;
    v16 = v15 + 1;
    memset(&__dst, 170, 24);
    if (v15 + 1 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    if (v16 >= 0x17)
    {
      v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v16 | 7) != 0x17)
        v18 = v16 | 7;
      v19 = v18 + 1;
      p_dst = (char *)operator new(v18 + 1);
      __dst.st_ino = v15 + 1;
      *(_QWORD *)&__dst.st_uid = v19 | 0x8000000000000000;
      *(_QWORD *)&__dst.st_dev = p_dst;
    }
    else
    {
      memset(&__dst, 0, 24);
      p_dst = (char *)&__dst;
      HIBYTE(__dst.st_gid) = v15 + 1;
      if (!v15)
        goto LABEL_38;
    }
    if (v14 >= 0)
      v20 = v1;
    else
      v20 = (const std::__fs::filesystem::path *)v1->__pn_.__r_.__value_.__r.__words[0];
    memmove(p_dst, v20, v15);
LABEL_38:
    *(_WORD *)&p_dst[v15] = 47;
    if (v10 >= 0)
      v21 = &__p;
    else
      v21 = (std::string *)__p.__r_.__value_.__r.__words[0];
    v22 = std::string::append((std::string *)&__dst, (const std::string::value_type *)v21, size);
    v23 = v22->__r_.__value_.__r.__words[0];
    v46[0] = v22->__r_.__value_.__l.__size_;
    *(_QWORD *)((char *)v46 + 7) = *(std::string::size_type *)((char *)&v22->__r_.__value_.__r.__words[1] + 7);
    v24 = HIBYTE(v22->__r_.__value_.__r.__words[2]);
    v22->__r_.__value_.__l.__size_ = 0;
    v22->__r_.__value_.__r.__words[2] = 0;
    v22->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    __p.__r_.__value_.__r.__words[0] = v23;
    __p.__r_.__value_.__l.__size_ = v46[0];
    *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)v46 + 7);
    *((_BYTE *)&__p.__r_.__value_.__s + 23) = v24;
    if (SHIBYTE(__dst.st_gid) < 0)
    {
      operator delete(*(void **)&__dst.st_dev);
      v24 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      v23 = __p.__r_.__value_.__r.__words[0];
    }
    v25.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v25.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&__dst.st_blksize = v25;
    *(timespec *)__dst.st_qspare = v25;
    __dst.st_birthtimespec = v25;
    *(timespec *)&__dst.st_size = v25;
    __dst.st_mtimespec = v25;
    __dst.st_ctimespec = v25;
    *(timespec *)&__dst.st_uid = v25;
    __dst.st_atimespec = v25;
    if (v24 >= 0)
      v26 = &__p;
    else
      v26 = (std::string *)v23;
    *(timespec *)&__dst.st_dev = v25;
    if (!stat((const char *)v26, &__dst)
      && ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? (v31 = &__p)
        : (v31 = (std::string *)__p.__r_.__value_.__r.__words[0]),
          (v32 = opendir((const char *)v31), (v33 = v32) != 0) && (v34 = readdir(v32), closedir(v33), v34)))
    {
      std::string::append(&__p, "/", 1uLL);
      v30 = support::fs::removeDir(&__p);
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_7;
    }
    else
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v28 = (const std::__fs::filesystem::path *)&__p;
      else
        v28 = (const std::__fs::filesystem::path *)__p.__r_.__value_.__r.__words[0];
      if (!remove(v28, v27))
        goto LABEL_58;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v29 = &__p;
      else
        v29 = (std::string *)__p.__r_.__value_.__r.__words[0];
      v30 = unlink((const char *)v29) == 0;
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_7;
    }
LABEL_6:
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_7:
    v5 = v6 + 1;
    if ((v30 & 1) == 0)
      goto LABEL_75;
  }
  if ((v1->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v35 = v1;
  else
    v35 = (const std::__fs::filesystem::path *)v1->__pn_.__r_.__value_.__r.__words[0];
  if (remove(v35, v4))
  {
    if ((v1->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v36 = (const char *)v1;
    else
      v36 = (const char *)v1->__pn_.__r_.__value_.__r.__words[0];
    unlink(v36);
  }
LABEL_75:
  v37 = (void **)v42;
  if (v42)
  {
    v38 = v43;
    v39 = v42;
    if (v43 != v42)
    {
      do
      {
        if (*((char *)v38 - 1) < 0)
          operator delete(*(v38 - 3));
        v38 -= 3;
      }
      while (v38 != v37);
      v39 = v42;
    }
    v43 = v37;
    operator delete(v39);
  }
  return v3;
}

void sub_2124766C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  std::vector<std::string>::~vector[abi:ne180100]((void **)va);
  _Unwind_Resume(a1);
}

void sub_2124766D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if ((a16 & 0x80000000) == 0)
  {
    std::vector<std::string>::~vector[abi:ne180100](&a17);
    _Unwind_Resume(a1);
  }
  operator delete(__p);
  std::vector<std::string>::~vector[abi:ne180100](&a17);
  _Unwind_Resume(a1);
}

BOOL support::fs::removeFile(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  const std::__fs::filesystem::path *v2;
  const char *v3;

  v2 = a1;
  if ((a1->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    a1 = (const std::__fs::filesystem::path *)a1->__pn_.__r_.__value_.__r.__words[0];
  if (!remove(a1, a2))
    return 1;
  if ((v2->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v3 = (const char *)v2;
  else
    v3 = (const char *)v2->__pn_.__r_.__value_.__r.__words[0];
  return unlink(v3) == 0;
}

uint64_t support::fs::removeDirContents(const char *a1, unint64_t a2)
{
  const char *v3;
  void **v4;
  void **v5;
  double v6;
  __int128 v7;
  int v8;
  std::string::size_type v9;
  std::string *v10;
  std::string *v11;
  int v12;
  size_t v13;
  unint64_t v14;
  stat *p_dst;
  std::string::size_type v16;
  void **v17;
  void **v18;
  const char *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  std::string *v24;
  std::string *v25;
  __int128 v26;
  timespec v27;
  void **v28;
  char v29;
  int v30;
  timespec v31;
  void **v32;
  std::error_code *v33;
  const std::__fs::filesystem::path *v34;
  void **v35;
  void **v36;
  DIR *v37;
  DIR *v38;
  dirent *v39;
  int v40;
  size_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  std::string *v47;
  std::string::size_type size;
  std::string *v49;
  __int128 v50;
  char v51;
  char v52;
  void **v53;
  void *v54;
  time_t v56;
  char v57;
  int v58;
  std::string v59;
  void *__p[4];
  std::string v61;
  void *v62;
  void **v63;
  uint64_t v64;
  stat __dst;

  v3 = a1;
  v62 = 0;
  v63 = 0;
  v64 = 0;
  support::fs::readDir(a1, (uint64_t)&v62);
  v56 = time(0);
  v5 = (void **)v62;
  v4 = v63;
  if (v62 == v63)
  {
    v52 = 1;
    if (v62)
      goto LABEL_105;
    return v52 & 1;
  }
  v6 = (double)a2;
  v57 = 1;
  while (1)
  {
    memset(&v61, 170, sizeof(v61));
    if (*((char *)v5 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v61, (const std::string::value_type *)*v5, (std::string::size_type)v5[1]);
    }
    else
    {
      v7 = *(_OWORD *)v5;
      v61.__r_.__value_.__r.__words[2] = (std::string::size_type)v5[2];
      *(_OWORD *)&v61.__r_.__value_.__l.__data_ = v7;
    }
    v8 = SHIBYTE(v61.__r_.__value_.__r.__words[2]);
    v9 = (v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
       ? HIBYTE(v61.__r_.__value_.__r.__words[2])
       : v61.__r_.__value_.__l.__size_;
    if (v9 == 2)
      break;
    if (v9 == 1)
    {
      v10 = (std::string *)v61.__r_.__value_.__r.__words[0];
      if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v10 = &v61;
      if (v10->__r_.__value_.__s.__data_[0] == 46)
        goto LABEL_95;
    }
LABEL_19:
    memset(__p, 170, 24);
    v12 = v3[23];
    if (v12 >= 0)
      v13 = *((unsigned __int8 *)v3 + 23);
    else
      v13 = *((_QWORD *)v3 + 1);
    v14 = v13 + 1;
    memset(&__dst, 170, 24);
    if (v13 + 1 > 0x7FFFFFFFFFFFFFF7)
      std::string::__throw_length_error[abi:ne180100]();
    if (v14 >= 0x17)
    {
      v58 = SHIBYTE(v61.__r_.__value_.__r.__words[2]);
      v16 = v9;
      v17 = v5;
      v18 = v4;
      v19 = v3;
      v20 = a2;
      v21 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v14 | 7) != 0x17)
        v21 = v14 | 7;
      v22 = v21 + 1;
      p_dst = (stat *)operator new(v21 + 1);
      __dst.st_ino = v13 + 1;
      *(_QWORD *)&__dst.st_uid = v22 | 0x8000000000000000;
      *(_QWORD *)&__dst.st_dev = p_dst;
      a2 = v20;
      v3 = v19;
      v4 = v18;
      v5 = v17;
      v9 = v16;
      v8 = v58;
    }
    else
    {
      memset(&__dst, 0, 24);
      p_dst = &__dst;
      HIBYTE(__dst.st_gid) = v13 + 1;
      if (!v13)
        goto LABEL_33;
    }
    if (v12 >= 0)
      v23 = v3;
    else
      v23 = *(const char **)v3;
    memmove(p_dst, v23, v13);
LABEL_33:
    *(_WORD *)((char *)&p_dst->st_dev + v13) = 47;
    if (v8 >= 0)
      v24 = &v61;
    else
      v24 = (std::string *)v61.__r_.__value_.__r.__words[0];
    v25 = std::string::append((std::string *)&__dst, (const std::string::value_type *)v24, v9);
    v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
    __p[2] = (void *)v25->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v26;
    v25->__r_.__value_.__l.__size_ = 0;
    v25->__r_.__value_.__r.__words[2] = 0;
    v25->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__dst.st_gid) < 0)
    {
      operator delete(*(void **)&__dst.st_dev);
      if (!a2)
        goto LABEL_47;
    }
    else if (!a2)
    {
      goto LABEL_47;
    }
    v27.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v27.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&__dst.st_blksize = v27;
    *(timespec *)__dst.st_qspare = v27;
    __dst.st_birthtimespec = v27;
    *(timespec *)&__dst.st_size = v27;
    __dst.st_mtimespec = v27;
    __dst.st_ctimespec = v27;
    __dst.st_atimespec = v27;
    *(timespec *)&__dst.st_dev = v27;
    *(timespec *)&__dst.st_uid = v27;
    if (SHIBYTE(__p[2]) >= 0)
      v28 = __p;
    else
      v28 = (void **)__p[0];
    if (!stat((const char *)v28, &__dst) && difftime(v56, __dst.st_ctimespec.tv_sec) >= v6)
    {
LABEL_47:
      v31.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v31.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&__dst.st_blksize = v31;
      *(timespec *)__dst.st_qspare = v31;
      __dst.st_birthtimespec = v31;
      *(timespec *)&__dst.st_size = v31;
      __dst.st_mtimespec = v31;
      __dst.st_ctimespec = v31;
      __dst.st_atimespec = v31;
      *(timespec *)&__dst.st_dev = v31;
      *(timespec *)&__dst.st_uid = v31;
      if (SHIBYTE(__p[2]) >= 0)
        v32 = __p;
      else
        v32 = (void **)__p[0];
      if (stat((const char *)v32, &__dst)
        || (SHIBYTE(__p[2]) >= 0 ? (v36 = __p) : (v36 = (void **)__p[0]),
            (v37 = opendir((const char *)v36), (v38 = v37) == 0) || (v39 = readdir(v37), closedir(v38), !v39)))
      {
        if (SHIBYTE(__p[2]) >= 0)
          v34 = (const std::__fs::filesystem::path *)__p;
        else
          v34 = (const std::__fs::filesystem::path *)__p[0];
        if (!remove(v34, v33)
          || (SHIBYTE(__p[2]) >= 0 ? (v35 = __p) : (v35 = (void **)__p[0]), !unlink((const char *)v35)))
        {
LABEL_89:
          v30 = 0;
          v57 = 1;
          v29 = 1;
          if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
            goto LABEL_91;
          goto LABEL_90;
        }
        goto LABEL_59;
      }
      v40 = v3[23];
      if (v40 >= 0)
        v41 = *((unsigned __int8 *)v3 + 23);
      else
        v41 = *((_QWORD *)v3 + 1);
      v42 = v41 + 1;
      memset(&v59, 170, sizeof(v59));
      if (v41 + 1 > 0x7FFFFFFFFFFFFFF7)
        std::string::__throw_length_error[abi:ne180100]();
      if (v42 >= 0x17)
      {
        v44 = (v42 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v42 | 7) != 0x17)
          v44 = v42 | 7;
        v45 = v44 + 1;
        v43 = (char *)operator new(v44 + 1);
        v59.__r_.__value_.__l.__size_ = v41 + 1;
        v59.__r_.__value_.__r.__words[2] = v45 | 0x8000000000000000;
        v59.__r_.__value_.__r.__words[0] = (std::string::size_type)v43;
      }
      else
      {
        memset(&v59, 0, sizeof(v59));
        v43 = (char *)&v59;
        *((_BYTE *)&v59.__r_.__value_.__s + 23) = v41 + 1;
        if (!v41)
          goto LABEL_80;
      }
      if (v40 >= 0)
        v46 = v3;
      else
        v46 = *(const char **)v3;
      memmove(v43, v46, v41);
LABEL_80:
      *(_WORD *)&v43[v41] = 47;
      if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v47 = &v61;
      else
        v47 = (std::string *)v61.__r_.__value_.__r.__words[0];
      if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v61.__r_.__value_.__r.__words[2]);
      else
        size = v61.__r_.__value_.__l.__size_;
      v49 = std::string::append(&v59, (const std::string::value_type *)v47, size);
      v50 = *(_OWORD *)&v49->__r_.__value_.__l.__data_;
      *(_QWORD *)&__dst.st_uid = *((_QWORD *)&v49->__r_.__value_.__l + 2);
      *(_OWORD *)&__dst.st_dev = v50;
      v49->__r_.__value_.__l.__size_ = 0;
      v49->__r_.__value_.__r.__words[2] = 0;
      v49->__r_.__value_.__r.__words[0] = 0;
      v51 = support::fs::removeDir((const char *)&__dst);
      if (SHIBYTE(__dst.st_gid) < 0)
      {
        operator delete(*(void **)&__dst.st_dev);
        if ((SHIBYTE(v59.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_88;
      }
      else if ((SHIBYTE(v59.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_88:
        if ((v51 & 1) != 0)
          goto LABEL_89;
LABEL_59:
        v57 = 0;
        v29 = 0;
        v30 = 2;
        if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
          goto LABEL_91;
        goto LABEL_90;
      }
      operator delete(v59.__r_.__value_.__l.__data_);
      if ((v51 & 1) != 0)
        goto LABEL_89;
      goto LABEL_59;
    }
    v29 = 0;
    v30 = 3;
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
      goto LABEL_91;
LABEL_90:
    operator delete(__p[0]);
LABEL_91:
    if ((v29 & 1) != 0)
      goto LABEL_95;
    if ((SHIBYTE(v61.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_93;
LABEL_96:
    operator delete(v61.__r_.__value_.__l.__data_);
    if (v30 != 3)
      goto LABEL_97;
LABEL_3:
    v5 += 3;
    if (v5 == v4)
      goto LABEL_102;
  }
  v11 = (std::string *)v61.__r_.__value_.__r.__words[0];
  if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v11 = &v61;
  if (LOWORD(v11->__r_.__value_.__l.__data_) != 11822)
    goto LABEL_19;
LABEL_95:
  v30 = 0;
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_96;
LABEL_93:
  if (v30 == 3)
    goto LABEL_3;
LABEL_97:
  if (!v30)
    goto LABEL_3;
LABEL_102:
  v5 = (void **)v62;
  v52 = v57;
  if (!v62)
    return v52 & 1;
LABEL_105:
  v53 = v63;
  v54 = v5;
  if (v63 != v5)
  {
    do
    {
      if (*((char *)v53 - 1) < 0)
        operator delete(*(v53 - 3));
      v53 -= 3;
    }
    while (v53 != v5);
    v54 = v62;
  }
  v63 = v5;
  operator delete(v54);
  return v52 & 1;
}

void sub_212476D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (a23 < 0)
    operator delete(__p);
  if (a30 < 0)
    operator delete(a25);
  std::vector<std::string>::~vector[abi:ne180100](&a31);
  _Unwind_Resume(a1);
}

void support::fs::moveDirUnique(const char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  const std::__fs::filesystem::path *v4;
  timespec v6;
  const char *v7;
  DIR *v8;
  DIR *v9;
  dirent *v10;
  std::error_code *v11;
  const std::__fs::filesystem::path *v12;
  const std::__fs::filesystem::path *v13;
  int v14;
  std::string __p;
  stat v16;

  v4 = (const std::__fs::filesystem::path *)a1;
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v16.st_blksize = v6;
  *(timespec *)v16.st_qspare = v6;
  v16.st_birthtimespec = v6;
  *(timespec *)&v16.st_size = v6;
  v16.st_mtimespec = v6;
  v16.st_ctimespec = v6;
  *(timespec *)&v16.st_uid = v6;
  v16.st_atimespec = v6;
  *(timespec *)&v16.st_dev = v6;
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  if (stat(a1, &v16))
    goto LABEL_4;
  v7 = (v4->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
     ? (const char *)v4
     : (const char *)v4->__pn_.__r_.__value_.__r.__words[0];
  v8 = opendir(v7);
  if (!v8)
    goto LABEL_4;
  v9 = v8;
  v10 = readdir(v8);
  closedir(v9);
  if (!v10)
    goto LABEL_4;
  memset((void *)a3, 170, 24);
  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  support::fs::createUniquePath((const char *)&__p, (std::string *)a3);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if ((v4->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v12 = v4;
  else
    v12 = (const std::__fs::filesystem::path *)v4->__pn_.__r_.__value_.__r.__words[0];
  if (*(char *)(a3 + 23) >= 0)
    v13 = (const std::__fs::filesystem::path *)a3;
  else
    v13 = *(const std::__fs::filesystem::path **)a3;
  rename(v12, v13, v11);
  if (v14)
  {
    if (*(char *)(a3 + 23) < 0)
      operator delete(*(void **)a3);
LABEL_4:
    *(_BYTE *)(a3 + 23) = 0;
    *(_BYTE *)a3 = 0;
  }
}

void sub_212476F24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void support::fs::getFileName(std::string *a1@<X8>)
{
  __int128 v2;
  void **v3;
  void *v4;
  void *__p[3];

  memset(__p, 170, sizeof(__p));
  ctu::tokenize();
  if (*((char *)__p[1] - 1) < 0)
  {
    std::string::__init_copy_ctor_external(a1, *((const std::string::value_type **)__p[1] - 3), *((_QWORD *)__p[1] - 2));
  }
  else
  {
    v2 = *(_OWORD *)((char *)__p[1] - 24);
    a1->__r_.__value_.__r.__words[2] = *((_QWORD *)__p[1] - 1);
    *(_OWORD *)&a1->__r_.__value_.__l.__data_ = v2;
  }
  if (__p[0])
  {
    v3 = (void **)__p[1];
    v4 = __p[0];
    if (__p[1] != __p[0])
    {
      do
      {
        if (*((char *)v3 - 1) < 0)
          operator delete(*(v3 - 3));
        v3 -= 3;
      }
      while (v3 != __p[0]);
      v4 = __p[0];
    }
    operator delete(v4);
  }
}

void sub_212476FF4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<std::string>::~vector[abi:ne180100]((void **)va);
  _Unwind_Resume(a1);
}

uint64_t support::fs::lockDir(const char *a1)
{
  uint64_t v1;
  _QWORD v3[2];
  pid_t v4;
  int v5;

  if (a1[23] < 0)
    a1 = *(const char **)a1;
  v1 = open(a1, 0);
  if ((v1 & 0x80000000) != 0)
    return v1;
  v5 = 1;
  v3[0] = 0;
  v3[1] = 0;
  v4 = getpid();
  if ((fcntl(v1, 9, v3) & 0x80000000) == 0)
    return v1;
  close(v1);
  return 0xFFFFFFFFLL;
}

BOOL support::fs::unlockDir(support::fs *this)
{
  int v1;
  _BOOL8 v2;
  _QWORD v4[2];
  pid_t v5;
  int v6;

  v1 = (int)this;
  v6 = 2;
  v4[0] = 0;
  v4[1] = 0;
  v5 = getpid();
  v2 = fcntl(v1, 9, v4) == 0;
  close(v1);
  return v2;
}

BOOL support::fs::getFilteredFiles(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  DIR *v7;
  DIR *v8;
  dirent *v9;
  char *d_name;
  size_t v11;
  size_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  std::string::size_type v19;
  _BYTE *v20;
  _WORD *v21;
  DIR *v22;
  uint64_t v23;
  uint64_t v24;
  timespec v25;
  int v26;
  size_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const std::string::value_type *v33;
  std::string *v34;
  __int128 v35;
  void **v36;
  std::sub_match<const char *> *v37;
  uint64_t v38;
  __int128 v39;
  int v40;
  int v41;
  unint64_t v42;
  __int128 v43;
  std::string *v44;
  unsigned __int8 v45;
  NSObject *v46;
  _BOOL8 result;
  int *v48;
  char *v49;
  char v50;
  const char *v52;
  std::string v53;
  _BYTE __dst[24];
  void *__p[2];
  _QWORD v56[9];
  __int128 v57;
  uint64_t v58;
  stat v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  *__error() = 0;
  if (a1[23] < 0)
  {
    v7 = opendir(*(const char **)a1);
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v7 = opendir(a1);
    if (v7)
    {
LABEL_3:
      v8 = v7;
      v9 = readdir(v7);
      if (v9)
      {
        v52 = a1;
        v50 = 0;
        while (1)
        {
          d_name = v9->d_name;
          memset(__dst, 170, sizeof(__dst));
          v11 = strlen(v9->d_name);
          if (v11 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          v12 = v11;
          if (v11 >= 0x17)
            break;
          __dst[23] = v11;
          v13 = __dst;
          if (v11)
            goto LABEL_12;
LABEL_13:
          v13[v12] = 0;
          v16 = __dst[23];
          v17 = __dst[23];
          v18 = *(_QWORD *)&__dst[8];
          if (__dst[23] >= 0)
            v19 = __dst[23];
          else
            v19 = *(_QWORD *)&__dst[8];
          if (v19 == 2)
          {
            v21 = *(_WORD **)__dst;
            if (__dst[23] >= 0)
              v21 = __dst;
            if (*v21 == 11822)
              goto LABEL_73;
          }
          else if (v19 == 1)
          {
            v20 = *(_BYTE **)__dst;
            if (__dst[23] >= 0)
              v20 = __dst;
            if (*v20 == 46)
              goto LABEL_73;
          }
          if ((a4 & 1) != 0)
            goto LABEL_53;
          v22 = v8;
          v23 = a4;
          v24 = a3;
          v25.tv_sec = 0xAAAAAAAAAAAAAAAALL;
          v25.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
          *(timespec *)&v59.st_blksize = v25;
          *(timespec *)v59.st_qspare = v25;
          v59.st_birthtimespec = v25;
          *(timespec *)&v59.st_size = v25;
          v59.st_mtimespec = v25;
          v59.st_ctimespec = v25;
          *(timespec *)&v59.st_uid = v25;
          v59.st_atimespec = v25;
          *(timespec *)&v59.st_dev = v25;
          v26 = v52[23];
          if (v26 >= 0)
            v27 = *((unsigned __int8 *)v52 + 23);
          else
            v27 = *((_QWORD *)v52 + 1);
          v28 = v27 + 1;
          memset(&v53, 170, sizeof(v53));
          if (v27 + 1 > 0x7FFFFFFFFFFFFFF7)
            std::string::__throw_length_error[abi:ne180100]();
          if (v28 >= 0x17)
          {
            v30 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v28 | 7) != 0x17)
              v30 = v28 | 7;
            v31 = v30 + 1;
            v29 = (char *)operator new(v30 + 1);
            v53.__r_.__value_.__l.__size_ = v27 + 1;
            v53.__r_.__value_.__r.__words[2] = v31 | 0x8000000000000000;
            v53.__r_.__value_.__r.__words[0] = (std::string::size_type)v29;
          }
          else
          {
            memset(&v53, 0, sizeof(v53));
            v29 = (char *)&v53;
            *((_BYTE *)&v53.__r_.__value_.__s + 23) = v27 + 1;
            if (!v27)
              goto LABEL_40;
          }
          if (v26 >= 0)
            v32 = v52;
          else
            v32 = *(const char **)v52;
          memmove(v29, v32, v27);
LABEL_40:
          a3 = v24;
          *(_WORD *)&v29[v27] = 47;
          if (v17 >= 0)
            v33 = __dst;
          else
            v33 = *(const std::string::value_type **)__dst;
          v34 = std::string::append(&v53, v33, v19);
          a4 = v23;
          v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
          v56[0] = *((_QWORD *)&v34->__r_.__value_.__l + 2);
          *(_OWORD *)__p = v35;
          v34->__r_.__value_.__l.__size_ = 0;
          v34->__r_.__value_.__r.__words[2] = 0;
          v34->__r_.__value_.__r.__words[0] = 0;
          if (v56[0] >= 0)
            v36 = __p;
          else
            v36 = (void **)__p[0];
          lstat((const char *)v36, &v59);
          v8 = v22;
          if (SHIBYTE(v56[0]) < 0)
          {
            operator delete(__p[0]);
            if ((SHIBYTE(v53.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_48:
              if ((v59.st_mode & 0xF000) != 0xA000)
                goto LABEL_52;
              goto LABEL_73;
            }
          }
          else if ((SHIBYTE(v53.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          {
            goto LABEL_48;
          }
          operator delete(v53.__r_.__value_.__l.__data_);
          if ((v59.st_mode & 0xF000) != 0xA000)
          {
LABEL_52:
            v16 = __dst[23];
            v18 = *(_QWORD *)&__dst[8];
            LOBYTE(v17) = __dst[23];
LABEL_53:
            if ((v17 & 0x80u) == 0)
              v37 = (std::sub_match<const char *> *)__dst;
            else
              v37 = *(std::sub_match<const char *> **)__dst;
            if ((v17 & 0x80u) != 0)
              v16 = v18;
            v38 = (uint64_t)v37 + v16;
            *(_QWORD *)&v39 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v57 = v39;
            v56[6] = 0xAAAAAAAAAAAAAA00;
            v56[3] = 0xAAAAAAAAAAAAAAAALL;
            v56[4] = 0;
            v56[5] = 0;
            v56[7] = 0;
            v56[8] = 0;
            LOBYTE(v57) = 0;
            BYTE8(v57) = 0;
            v58 = 0;
            *(_OWORD *)__p = 0u;
            memset(v56, 0, 25);
            *(_OWORD *)&v59.st_birthtimespec.tv_nsec = v39;
            v59.st_ctimespec.tv_sec = 0xAAAAAAAAAAAAAAAALL;
            v59.st_atimespec.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
            memset(&v59.st_mtimespec, 0, 17);
            memset(&v59.st_ctimespec.tv_nsec, 0, 17);
            LOBYTE(v59.st_size) = 0;
            v59.st_blocks = 0;
            memset(&v59, 0, 41);
            v40 = std::basic_regex<char,std::regex_traits<char>>::__search<std::allocator<std::sub_match<char const*>>>(a2, v37, (std::sub_match<const char *> *)((char *)v37 + v16), (std::vector<std::csub_match> *)&v59, 4160);
            std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>((uint64_t)__p, (uint64_t)v37, v38, (uint64_t *)&v59.st_dev, 0);
            if (*(_QWORD *)&v59.st_dev)
              operator delete(*(void **)&v59.st_dev);
            if ((_BYTE)v57)
              v41 = v40 ^ 1;
            else
              v41 = 1;
            if (__p[0])
              operator delete(__p[0]);
            if ((v40 & v41) != 0)
            {
              v42 = *(_QWORD *)(a3 + 8);
              if (v42 >= *(_QWORD *)(a3 + 16))
              {
                v44 = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)a3, (uint64_t)__dst);
              }
              else
              {
                if ((__dst[23] & 0x80000000) != 0)
                {
                  std::string::__init_copy_ctor_external(*(std::string **)(a3 + 8), *(const std::string::value_type **)__dst, *(std::string::size_type *)&__dst[8]);
                }
                else
                {
                  v43 = *(_OWORD *)__dst;
                  *(_QWORD *)(v42 + 16) = *(_QWORD *)&__dst[16];
                  *(_OWORD *)v42 = v43;
                }
                v44 = (std::string *)(v42 + 24);
                *(_QWORD *)(a3 + 8) = v42 + 24;
              }
              *(_QWORD *)(a3 + 8) = v44;
              v50 = 1;
            }
          }
LABEL_73:
          if ((__dst[23] & 0x80000000) != 0)
            operator delete(*(void **)__dst);
          v9 = readdir(v8);
          if (!v9)
            goto LABEL_85;
        }
        v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v11 | 7) != 0x17)
          v14 = v11 | 7;
        v15 = v14 + 1;
        v13 = operator new(v14 + 1);
        *(_QWORD *)&__dst[8] = v12;
        *(_QWORD *)&__dst[16] = v15 | 0x8000000000000000;
        *(_QWORD *)__dst = v13;
LABEL_12:
        memmove(v13, d_name, v12);
        goto LABEL_13;
      }
      v50 = 0;
LABEL_85:
      closedir(v8);
      return v50 & 1;
    }
  }
  {
    GetOsLogContext(void)::sOsLogContext = 0;
    qword_253D37FF0 = 0;
    __cxa_atexit((void (*)(void *))MEMORY[0x24BED9868], &GetOsLogContext(void)::sOsLogContext, &dword_21246D000);
  }
  if (GetOsLogContext(void)::onceToken == -1)
  {
    v46 = qword_253D37FF0;
    result = os_log_type_enabled((os_log_t)qword_253D37FF0, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
  }
  else
  {
    dispatch_once(&GetOsLogContext(void)::onceToken, &__block_literal_global);
    v46 = qword_253D37FF0;
    result = os_log_type_enabled((os_log_t)qword_253D37FF0, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
  }
  if (a1[23] < 0)
    a1 = *(const char **)a1;
  v48 = __error();
  v49 = strerror(*v48);
  v59.st_dev = 136315394;
  *(_QWORD *)&v59.st_mode = a1;
  WORD2(v59.st_ino) = 2080;
  *(__darwin_ino64_t *)((char *)&v59.st_ino + 6) = (__darwin_ino64_t)v49;
  _os_log_error_impl(&dword_21246D000, v46, OS_LOG_TYPE_ERROR, "Error %s (%s)\n", (uint8_t *)&v59, 0x16u);
  return 0;
}

void sub_2124776F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *a48)
{
  uint64_t v48;
  uint64_t v49;

  *(_QWORD *)(v48 + 8) = v49;
  if (a30 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_2124778F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::ifstream::~ifstream(&a9);
  _Unwind_Resume(a1);
}

void support::fs::getBasePath(const std::string::value_type **a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 *v2;
  size_t v4;
  size_t v5;
  std::string::size_type size;
  char v7;
  std::string *p_p;
  unsigned __int8 *v9;
  BOOL v10;
  BOOL v11;
  size_t v12;
  __int128 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  unint64_t v22;
  std::string __p;

  v2 = (unsigned __int8 *)a1;
  if (*((char *)a1 + 23) < 0)
  {
    if (!a1[1])
    {
      std::string::__init_copy_ctor_external((std::string *)a2, *a1, 0);
      return;
    }
  }
  else if (!*((_BYTE *)a1 + 23))
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_QWORD *)(a2 + 16) = a1[2];
    return;
  }
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  memset(&__p, 170, sizeof(__p));
  support::fs::getFileName(&__p);
  v4 = *((_QWORD *)v2 + 1);
  if ((v2[23] & 0x80u) == 0)
  {
    v5 = v2[23];
  }
  else
  {
    v2 = *(unsigned __int8 **)v2;
    v5 = v4;
  }
  size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  v7 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __p.__r_.__value_.__l.__size_;
  v9 = &v2[v5];
  if (v5)
    v10 = size == 0;
  else
    v10 = 1;
  if (v10)
  {
    v15 = &v2[v5];
  }
  else
  {
    v14 = v2;
    v15 = &v2[v5];
    do
    {
      if (*v14 == p_p->__r_.__value_.__s.__data_[0])
      {
        v16 = 1;
        while (size != v16)
        {
          if (&v14[v16] == v9)
            goto LABEL_20;
          v17 = v14[v16];
          v18 = p_p->__r_.__value_.__s.__data_[v16++];
          if (v17 != v18)
            goto LABEL_37;
        }
        v15 = v14;
      }
LABEL_37:
      ++v14;
    }
    while (v14 != v9);
  }
LABEL_20:
  v11 = v15 != v9 || size == 0;
  if (v11 && v15 - v2 != -1)
  {
    if (v5 >= v15 - v2)
      v12 = v15 - v2;
    else
      v12 = v5;
    if (v12 >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    if (v12 >= 0x17)
    {
      v19 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v12 | 7) != 0x17)
        v19 = v12 | 7;
      v20 = v19 + 1;
      v13 = (__int128 *)operator new(v19 + 1);
      *((_QWORD *)&v21 + 1) = v12;
      v22 = v20 | 0x8000000000000000;
      *(_QWORD *)&v21 = v13;
    }
    else
    {
      HIBYTE(v22) = v12;
      v13 = &v21;
      if (!v12)
      {
        LOBYTE(v21) = 0;
        if ((*(char *)(a2 + 23) & 0x80000000) == 0)
        {
LABEL_33:
          *(_OWORD *)a2 = v21;
          *(_QWORD *)(a2 + 16) = v22;
          v7 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          goto LABEL_34;
        }
LABEL_49:
        operator delete(*(void **)a2);
        goto LABEL_33;
      }
    }
    memmove(v13, v2, v12);
    *((_BYTE *)v13 + v12) = 0;
    if ((*(char *)(a2 + 23) & 0x80000000) == 0)
      goto LABEL_33;
    goto LABEL_49;
  }
LABEL_34:
  if (v7 < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_212477B38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void support::fs::getLastNumberDir(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  std::string *v4;
  std::string *v5;
  std::string::size_type size;
  std::string::size_type v7;
  std::string::size_type v8;
  int v9;
  std::string::size_type v10;
  std::string::size_type v11;
  std::string::size_type v12;
  int v13;
  size_t v14;
  unint64_t v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  std::string *v19;
  __int128 v20;
  std::locale::__imp *v21;
  char *v22;
  std::basic_regex<char>::value_type *v23;
  unint64_t *v24;
  unint64_t v25;
  void **v26;
  void **v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  char *v34;
  char *v35;
  unsigned int v36;
  void *v37;
  __int128 v38;
  std::string *v39;
  unsigned int v40;
  std::string::size_type v41;
  std::string::size_type v42;
  void **v43;
  int v44;
  size_t v45;
  unint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  std::string *v50;
  std::string *v51;
  std::string::size_type v52;
  std::string *v53;
  __int128 v54;
  std::string *v55;
  __int128 v56;
  void **v57;
  void *v58;
  std::__shared_weak_count *v59;
  unint64_t *v60;
  unint64_t v61;
  std::string v62;
  std::string v63;
  std::string __p;
  std::locale v65;
  __int128 v66;
  __int128 v67;
  std::locale::__imp *locale;
  std::locale::__imp *v69;
  std::locale::__imp *v70;
  std::string v71;
  void *v72;
  void **v73;
  uint64_t v74;
  std::locale v75[9];
  void *__dst[3];
  std::string v77;
  std::string v78;
  std::string v79;

  memset(&v79, 170, sizeof(v79));
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v79, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v79 = *(std::string *)a1;
  v4 = (std::string *)v79.__r_.__value_.__r.__words[0];
  if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = &v79;
  else
    v5 = (std::string *)v79.__r_.__value_.__r.__words[0];
  if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v79.__r_.__value_.__r.__words[2]);
  else
    size = v79.__r_.__value_.__l.__size_;
  v7 = size + 1;
  do
  {
    v8 = v7 - 1;
    if (v7 == 1)
      goto LABEL_20;
    v9 = v5->__r_.__value_.__s.__data_[v7-- - 2];
  }
  while (v9 == 47);
  if (v8)
  {
    v10 = v8 - 1;
    if ((*((_BYTE *)&v79.__r_.__value_.__s + 23) & 0x80) != 0)
    {
      if (v79.__r_.__value_.__l.__size_ > v10)
      {
        v79.__r_.__value_.__l.__size_ = v8;
        goto LABEL_19;
      }
    }
    else if (v10 < HIBYTE(v79.__r_.__value_.__r.__words[2]))
    {
      *((_BYTE *)&v79.__r_.__value_.__s + 23) = v8 & 0x7F;
      v4 = &v79;
LABEL_19:
      v4->__r_.__value_.__s.__data_[v8] = 0;
      goto LABEL_20;
    }
    std::string::__throw_out_of_range[abi:ne180100]();
  }
LABEL_20:
  memset(&v78, 170, sizeof(v78));
  support::fs::getBasePath((const std::string::value_type **)&v79.__r_.__value_.__l.__data_, (uint64_t)&v78);
  v11 = HIBYTE(v79.__r_.__value_.__r.__words[2]);
  if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v11 = v79.__r_.__value_.__l.__size_;
  if (!v11)
    goto LABEL_33;
  v12 = HIBYTE(v78.__r_.__value_.__r.__words[2]);
  if ((v78.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v12 = v78.__r_.__value_.__l.__size_;
  if (!v12)
  {
LABEL_33:
    if ((*(char *)(a1 + 23) & 0x80000000) == 0)
    {
      *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
      a2->__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 16);
      if ((SHIBYTE(v78.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_138;
      goto LABEL_143;
    }
    std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
    goto LABEL_137;
  }
  memset(&v77, 170, sizeof(v77));
  support::fs::getFileName(&v77);
  v13 = SHIBYTE(v77.__r_.__value_.__r.__words[2]);
  if ((v77.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v14 = HIBYTE(v77.__r_.__value_.__r.__words[2]);
  else
    v14 = v77.__r_.__value_.__l.__size_;
  v15 = v14 + 13;
  memset(__dst, 170, sizeof(__dst));
  if (v14 + 13 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v15 >= 0x17)
  {
    v17 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17)
      v17 = v15 | 7;
    v18 = v17 + 1;
    v16 = (void **)operator new(v17 + 1);
    __dst[1] = (void *)(v14 + 13);
    __dst[2] = (void *)(v18 | 0x8000000000000000);
    __dst[0] = v16;
  }
  else
  {
    memset(__dst, 0, sizeof(__dst));
    v16 = __dst;
    HIBYTE(__dst[2]) = v14 + 13;
    if (!v14)
      goto LABEL_44;
  }
  if (v13 >= 0)
    v19 = &v77;
  else
    v19 = (std::string *)v77.__r_.__value_.__r.__words[0];
  memmove(v16, v19, v14);
LABEL_44:
  strcpy((char *)v16 + v14, "-[[:alnum:]]*");
  *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v75[4].__locale_ = v20;
  *(_OWORD *)&v75[6].__locale_ = v20;
  *(_OWORD *)&v75[0].__locale_ = v20;
  *(_OWORD *)&v75[2].__locale_ = v20;
  MEMORY[0x212BEA41C](v75);
  v75[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v75, MEMORY[0x24BEDB350]);
  v21 = (std::locale::__imp *)std::locale::use_facet(v75, MEMORY[0x24BEDB4B0]);
  memset(&v75[3], 0, 40);
  v75[2].__locale_ = v21;
  v22 = (char *)HIBYTE(__dst[2]);
  if (SHIBYTE(__dst[2]) >= 0)
    v23 = (std::basic_regex<char>::value_type *)__dst;
  else
    v23 = (std::basic_regex<char>::value_type *)__dst[0];
  if (SHIBYTE(__dst[2]) < 0)
    v22 = (char *)__dst[1];
  if ((std::basic_regex<char> *)&v22[(_QWORD)v23] != std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>((uint64_t)v75, v23, (std::basic_regex<char> *)&v22[(_QWORD)v23]))std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>();
  v72 = 0;
  v73 = 0;
  v74 = 0;
  if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v71, v78.__r_.__value_.__l.__data_, v78.__r_.__value_.__l.__size_);
  else
    v71 = v78;
  std::locale::locale(&v65, v75);
  v66 = *(_OWORD *)&v75[1].__locale_;
  v67 = *(_OWORD *)&v75[3].__locale_;
  locale = v75[5].__locale_;
  v69 = v75[6].__locale_;
  if (v75[6].__locale_)
  {
    v24 = (unint64_t *)((char *)v75[6].__locale_ + 8);
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  v70 = v75[7].__locale_;
  if (!support::fs::getFilteredFiles((const char *)&v71, (uint64_t)&v65, (uint64_t)&v72, 0))
  {
    v31 = (std::__shared_weak_count *)v69;
    if (v69)
    {
      v32 = (unint64_t *)((char *)v69 + 8);
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
    std::locale::~locale(&v65);
    if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v71.__r_.__value_.__l.__data_);
    goto LABEL_95;
  }
  v26 = (void **)v72;
  v27 = v73;
  v28 = (std::__shared_weak_count *)v69;
  if (v69)
  {
    v29 = (unint64_t *)((char *)v69 + 8);
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  std::locale::~locale(&v65);
  if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v71.__r_.__value_.__l.__data_);
    if (v26 == v27)
    {
LABEL_95:
      if ((*(char *)(a1 + 23) & 0x80000000) == 0)
      {
        *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
        a2->__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 16);
        v43 = (void **)v72;
        if (!v72)
          goto LABEL_131;
        goto LABEL_124;
      }
      std::string::__init_copy_ctor_external(a2, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
LABEL_123:
      v43 = (void **)v72;
      if (!v72)
        goto LABEL_131;
      goto LABEL_124;
    }
  }
  else if (v26 == v27)
  {
    goto LABEL_95;
  }
  v34 = (char *)v72;
  v35 = (char *)v73;
  if (v72 != v73)
  {
    v36 = 0;
    while (1)
    {
      memset(&__p, 170, sizeof(__p));
      ctu::tokenize();
      memset(&v63, 170, sizeof(v63));
      if (*(char *)(__p.__r_.__value_.__l.__size_ - 1) < 0)
      {
        std::string::__init_copy_ctor_external(&v63, *(const std::string::value_type **)(__p.__r_.__value_.__l.__size_ - 24), *(_QWORD *)(__p.__r_.__value_.__l.__size_ - 16));
      }
      else
      {
        v38 = *(_OWORD *)(__p.__r_.__value_.__l.__size_ - 24);
        v63.__r_.__value_.__r.__words[2] = *(_QWORD *)(__p.__r_.__value_.__l.__size_ - 8);
        *(_OWORD *)&v63.__r_.__value_.__l.__data_ = v38;
      }
      if ((v63.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v39 = &v63;
      else
        v39 = (std::string *)v63.__r_.__value_.__r.__words[0];
      v40 = strtol((const char *)v39, 0, 0);
      if (v36 <= v40)
        v36 = v40;
      if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v63.__r_.__value_.__l.__data_);
        v41 = __p.__r_.__value_.__r.__words[0];
        if (__p.__r_.__value_.__r.__words[0])
        {
LABEL_90:
          v42 = __p.__r_.__value_.__l.__size_;
          v37 = (void *)v41;
          if (__p.__r_.__value_.__l.__size_ != v41)
          {
            do
            {
              if (*(char *)(v42 - 1) < 0)
                operator delete(*(void **)(v42 - 24));
              v42 -= 24;
            }
            while (v42 != v41);
            v37 = (void *)__p.__r_.__value_.__r.__words[0];
          }
          __p.__r_.__value_.__l.__size_ = v41;
          operator delete(v37);
        }
      }
      else
      {
        v41 = __p.__r_.__value_.__r.__words[0];
        if (__p.__r_.__value_.__r.__words[0])
          goto LABEL_90;
      }
      v34 += 24;
      if (v34 == v35)
        goto LABEL_100;
    }
  }
  v36 = 0;
LABEL_100:
  v44 = SHIBYTE(v79.__r_.__value_.__r.__words[2]);
  if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v45 = HIBYTE(v79.__r_.__value_.__r.__words[2]);
  else
    v45 = v79.__r_.__value_.__l.__size_;
  v46 = v45 + 1;
  memset(&v63, 170, sizeof(v63));
  if (v45 + 1 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (v46 >= 0x17)
  {
    v48 = (v46 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v46 | 7) != 0x17)
      v48 = v46 | 7;
    v49 = v48 + 1;
    v47 = (char *)operator new(v48 + 1);
    v63.__r_.__value_.__l.__size_ = v45 + 1;
    v63.__r_.__value_.__r.__words[2] = v49 | 0x8000000000000000;
    v63.__r_.__value_.__r.__words[0] = (std::string::size_type)v47;
  }
  else
  {
    memset(&v63, 0, sizeof(v63));
    v47 = (char *)&v63;
    *((_BYTE *)&v63.__r_.__value_.__s + 23) = v45 + 1;
    if (!v45)
      goto LABEL_114;
  }
  if (v44 >= 0)
    v50 = &v79;
  else
    v50 = (std::string *)v79.__r_.__value_.__r.__words[0];
  memmove(v47, v50, v45);
LABEL_114:
  *(_WORD *)&v47[v45] = 45;
  std::to_string(&v62, v36);
  if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v51 = &v62;
  else
    v51 = (std::string *)v62.__r_.__value_.__r.__words[0];
  if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v52 = HIBYTE(v62.__r_.__value_.__r.__words[2]);
  else
    v52 = v62.__r_.__value_.__l.__size_;
  v53 = std::string::append(&v63, (const std::string::value_type *)v51, v52);
  v54 = *(_OWORD *)&v53->__r_.__value_.__l.__data_;
  __p.__r_.__value_.__r.__words[2] = v53->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v54;
  v53->__r_.__value_.__l.__size_ = 0;
  v53->__r_.__value_.__r.__words[2] = 0;
  v53->__r_.__value_.__r.__words[0] = 0;
  v55 = std::string::append(&__p, "/", 1uLL);
  v56 = *(_OWORD *)&v55->__r_.__value_.__l.__data_;
  a2->__r_.__value_.__r.__words[2] = v55->__r_.__value_.__r.__words[2];
  *(_OWORD *)&a2->__r_.__value_.__l.__data_ = v56;
  v55->__r_.__value_.__l.__size_ = 0;
  v55->__r_.__value_.__r.__words[2] = 0;
  v55->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v62.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_122:
      if ((SHIBYTE(v63.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_123;
      goto LABEL_147;
    }
  }
  else if ((SHIBYTE(v62.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_122;
  }
  operator delete(v62.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v63.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    goto LABEL_123;
LABEL_147:
  operator delete(v63.__r_.__value_.__l.__data_);
  v43 = (void **)v72;
  if (!v72)
    goto LABEL_131;
LABEL_124:
  v57 = v73;
  v58 = v43;
  if (v73 != v43)
  {
    do
    {
      if (*((char *)v57 - 1) < 0)
        operator delete(*(v57 - 3));
      v57 -= 3;
    }
    while (v57 != v43);
    v58 = v72;
  }
  v73 = v43;
  operator delete(v58);
LABEL_131:
  v59 = (std::__shared_weak_count *)v75[6].__locale_;
  if (!v75[6].__locale_)
    goto LABEL_135;
  v60 = (unint64_t *)((char *)v75[6].__locale_ + 8);
  do
    v61 = __ldaxr(v60);
  while (__stlxr(v61 - 1, v60));
  if (!v61)
  {
    ((void (*)(std::__shared_weak_count *))v59->__on_zero_shared)(v59);
    std::__shared_weak_count::__release_weak(v59);
    std::locale::~locale(v75);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
    {
LABEL_136:
      if ((SHIBYTE(v77.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_137;
      goto LABEL_142;
    }
  }
  else
  {
LABEL_135:
    std::locale::~locale(v75);
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
      goto LABEL_136;
  }
  operator delete(__dst[0]);
  if ((SHIBYTE(v77.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_137:
    if ((SHIBYTE(v78.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_138;
    goto LABEL_143;
  }
LABEL_142:
  operator delete(v77.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v78.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_138:
    if ((SHIBYTE(v79.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
LABEL_144:
    operator delete(v79.__r_.__value_.__l.__data_);
    return;
  }
LABEL_143:
  operator delete(v78.__r_.__value_.__l.__data_);
  if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_144;
}

void sub_212478324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,std::locale a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,void *a44,uint64_t a45,uint64_t a46,std::locale a47)
{
  uint64_t v47;

  if (a28 < 0)
  {
    operator delete(__p);
    if ((a15 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a21 & 0x80000000) == 0)
      {
LABEL_8:
        std::vector<std::string>::~vector[abi:ne180100](&a44);
        std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a47);
        if (*(char *)(v47 - 161) < 0)
        {
          operator delete(*(void **)(v47 - 184));
          if ((*(char *)(v47 - 137) & 0x80000000) == 0)
          {
LABEL_10:
            if ((*(char *)(v47 - 113) & 0x80000000) == 0)
              goto LABEL_11;
            goto LABEL_15;
          }
        }
        else if ((*(char *)(v47 - 137) & 0x80000000) == 0)
        {
          goto LABEL_10;
        }
        operator delete(*(void **)(v47 - 160));
        if ((*(char *)(v47 - 113) & 0x80000000) == 0)
        {
LABEL_11:
          if ((*(char *)(v47 - 89) & 0x80000000) == 0)
            goto LABEL_12;
          goto LABEL_16;
        }
LABEL_15:
        operator delete(*(void **)(v47 - 136));
        if ((*(char *)(v47 - 89) & 0x80000000) == 0)
LABEL_12:
          _Unwind_Resume(a1);
LABEL_16:
        operator delete(*(void **)(v47 - 112));
        _Unwind_Resume(a1);
      }
LABEL_7:
      operator delete(a16);
      goto LABEL_8;
    }
  }
  else if ((a15 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a10);
  if ((a21 & 0x80000000) == 0)
    goto LABEL_8;
  goto LABEL_7;
}

BOOL support::fs::getPartitionInfo(uint64_t a1, _QWORD *a2, _QWORD *a3, unint64_t *a4)
{
  int v7;
  _BOOL8 result;
  int v9;
  uint64_t f_bavail;
  statvfs v11;

  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    if (*(_BYTE *)(a1 + 23))
    {
      memset(&v11, 0, sizeof(v11));
      v7 = statvfs((const char *)a1, &v11);
      result = v7 == 0;
      if (v7)
        return result;
LABEL_7:
      *a4 = v11.f_frsize;
      f_bavail = v11.f_bavail;
      *a2 = v11.f_blocks;
      *a3 = f_bavail;
      return result;
    }
    return 0;
  }
  if (!*(_QWORD *)(a1 + 8))
    return 0;
  memset(&v11, 0, sizeof(v11));
  v9 = statvfs(*(const char **)a1, &v11);
  result = v9 == 0;
  if (!v9)
    goto LABEL_7;
  return result;
}

void support::fs::readCurrentLine(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  const std::locale::facet *v6;
  unsigned __int8 v7;
  uint64_t v8;
  _QWORD *v9;
  _BYTE *v10;
  int v11;
  std::locale v12[16];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  std::istream::tellg();
  v4 = v13;
  if (v13 >= 2)
  {
    do
    {
      std::istream::seekg();
      if (std::istream::peek() == 10)
        break;
    }
    while (v4-- > 1);
  }
  std::istream::seekg();
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
  v6 = std::locale::use_facet(v12, MEMORY[0x24BEDB350]);
  v7 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v6->__vftable[2].~facet_0)(v6, 10);
  std::locale::~locale(v12);
  LOBYTE(v12[0].__locale_) = -86;
  MEMORY[0x212BEA374](v12, a1, 1);
  if (!LOBYTE(v12[0].__locale_))
    return;
  v8 = 0;
  *(_BYTE *)a2 = 0;
  *(_BYTE *)(a2 + 23) = 0;
  while (1)
  {
    v9 = *(_QWORD **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 40);
    v10 = (_BYTE *)v9[3];
    if (v10 != (_BYTE *)v9[4])
    {
      v9[3] = v10 + 1;
      LOBYTE(v9) = *v10;
      goto LABEL_10;
    }
    LODWORD(v9) = (*(uint64_t (**)(_QWORD *))(*v9 + 80))(v9);
    if ((_DWORD)v9 == -1)
      break;
LABEL_10:
    if (v7 == v9)
    {
      v11 = 0;
      goto LABEL_18;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v9);
    --v8;
    if (*(char *)(a2 + 23) < 0 && *(_QWORD *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      v11 = 4;
      goto LABEL_18;
    }
  }
  if (v8)
    v11 = 2;
  else
    v11 = 6;
LABEL_18:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | v11);
}

void sub_212478758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::locale::~locale(&a9);
  _Unwind_Resume(a1);
}

void sub_21247876C(_Unwind_Exception *exception_object, int a2)
{
  _QWORD *v2;
  uint64_t v3;

  if (a2)
  {
    __cxa_begin_catch(exception_object);
    v3 = *v2;
    *(_DWORD *)((char *)v2 + *(_QWORD *)(*v2 - 24) + 32) |= 1u;
    if ((*((_BYTE *)v2 + *(_QWORD *)(v3 - 24) + 36) & 1) == 0)
    {
      __cxa_end_catch();
      JUMPOUT(0x21247870CLL);
    }
    __cxa_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

std::string *std::vector<std::string>::__push_back_slow_path<std::string const&>(char **a1, uint64_t a2)
{
  char *v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v8;
  char *v9;
  std::string *v10;
  std::string *v11;
  __int128 v12;
  char *v13;
  void **v14;
  std::string *v16;
  std::string *v17;
  char *v18;

  v2 = *a1;
  v3 = a1[1];
  v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * ((a1[2] - v2) >> 3) > v5)
    v5 = 0x5555555555555556 * ((a1[2] - v2) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - v2) >> 3) >= 0x555555555555555)
    v8 = 0xAAAAAAAAAAAAAAALL;
  else
    v8 = v5;
  if (v8)
  {
    if (v8 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v9 = (char *)operator new(24 * v8);
  }
  else
  {
    v9 = 0;
  }
  v10 = (std::string *)&v9[24 * v4];
  v16 = v10;
  v17 = v10;
  v18 = &v9[24 * v8];
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    v2 = *a1;
    v3 = a1[1];
    v10 = v16;
    v11 = v17 + 1;
    if (v3 == *a1)
    {
LABEL_17:
      v13 = v2;
      goto LABEL_18;
    }
  }
  else
  {
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    v10->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 16);
    v11 = v10 + 1;
    if (v3 == v2)
      goto LABEL_17;
  }
  do
  {
    v12 = *(_OWORD *)(v3 - 24);
    v10[-1].__r_.__value_.__r.__words[2] = *((_QWORD *)v3 - 1);
    *(_OWORD *)&v10[-1].__r_.__value_.__l.__data_ = v12;
    --v10;
    *((_QWORD *)v3 - 2) = 0;
    *((_QWORD *)v3 - 1) = 0;
    *((_QWORD *)v3 - 3) = 0;
    v3 -= 24;
  }
  while (v3 != v2);
  v13 = *a1;
  v2 = a1[1];
LABEL_18:
  *a1 = (char *)v10;
  a1[1] = (char *)v11;
  a1[2] = v18;
  if (v2 != v13)
  {
    v14 = (void **)(v2 - 24);
    do
    {
      if (*((char *)v14 + 23) < 0)
        operator delete(*v14);
      v14 -= 3;
    }
    while (v14 + 3 != (void **)v13);
    v2 = v13;
  }
  if (v2)
    operator delete(v2);
  return v11;
}

void sub_2124789E4(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer end;
  std::__split_buffer<std::string>::pointer begin;
  std::__split_buffer<std::string>::pointer v4;

  begin = this->__begin_;
  end = this->__end_;
  if (end != begin)
  {
    do
    {
      v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        v4 = this->__end_;
      }
      end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_)
    operator delete(this->__first_);
}

void std::vector<std::string>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]();
}

void std::__throw_out_of_range[abi:ne180100]()
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_24CDC0890, MEMORY[0x24BEDAB00]);
}

void sub_212478AB0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

uint64_t std::shared_ptr<std::__empty_state<char>>::~shared_ptr[abi:ne180100](uint64_t result)
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

_QWORD *std::string::__assign_no_alias<true>(_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL)
      std::string::__throw_length_error[abi:ne180100]();
    v7 = 44;
    if (__len > 0x2C)
      v7 = __len;
    v8 = (v7 | 7) + 1;
    v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      v6 = __dst;
    }
  }
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void **std::string::__assign_no_alias<false>(void **a1, void *__src, size_t __len)
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  size_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v13;
  uint64_t v14;

  v6 = (unint64_t)a1[2];
  v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    v8 = *a1;
    a1[1] = (void *)__len;
    if (__len)
      memmove(v8, __src, __len);
    goto LABEL_12;
  }
  v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1)
    std::string::__throw_length_error[abi:ne180100]();
  v10 = v7 - 1;
  v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2)
      goto LABEL_7;
LABEL_14:
    v13 = 2 * v10;
    if (__len > 2 * v10)
      v13 = __len;
    v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v14 = v13 | 7;
    if (v13 >= 0x17)
      v9 = v14 + 1;
    else
      v9 = 23;
    v8 = operator new(v9);
    if (!__len)
      goto LABEL_9;
    goto LABEL_8;
  }
  v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2)
    goto LABEL_14;
LABEL_7:
  v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len)
LABEL_8:
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22)
    operator delete(v11);
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((_BYTE *)v8 + __len) = 0;
  return a1;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse<char const*>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char> *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  std::basic_regex<char> *v14;
  std::basic_regex<char> *v15;
  char *v17;
  std::basic_regex<char>::value_type *v18;
  std::__owns_one_state<char> *v19;
  int v20;
  std::basic_regex<char> *v21;
  std::basic_regex<char>::value_type *v22;
  std::basic_regex<char>::value_type *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  std::basic_regex<char>::value_type *v34;
  char *v35;
  std::__owns_one_state<char> *v36;
  int v37;
  std::basic_regex<char> *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  std::basic_regex<char> *v53;
  std::basic_regex<char> *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  std::basic_regex<char>::value_type *v66;
  std::basic_regex<char>::value_type *v67;

  v6 = operator new(8uLL);
  *v6 = off_24CDC0C10;
  v7 = operator new(0x10uLL);
  v7[1] = v6;
  v8 = operator new(0x20uLL);
  *v8 = off_24CDC0C68;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  v9 = *(std::__shared_weak_count **)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
      v12 = *(_QWORD *)(a1 + 40);
      *(_QWORD *)(a1 + 56) = v12;
      v13 = *(_DWORD *)(a1 + 24) & 0x1F0;
      if (v13 <= 0x3F)
        goto LABEL_6;
LABEL_11:
      if (v13 != 64)
      {
        if (v13 == 128)
        {
          v22 = (std::basic_regex<char>::value_type *)memchr(a2, 10, (char *)a3 - (char *)a2);
          if (v22)
            v23 = v22;
          else
            v23 = (std::basic_regex<char>::value_type *)a3;
          if (v23 == (std::basic_regex<char>::value_type *)a2)
          {
            v55 = operator new(0x10uLL);
            v56 = *(_QWORD *)(v12 + 8);
            v55[1] = v56;
            *(_QWORD *)(v12 + 8) = v55;
            *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            if (v23 != (std::basic_regex<char>::value_type *)a3)
              ++v23;
            if (v23 == (std::basic_regex<char>::value_type *)a3)
              return a3;
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, a2, v23);
            if (v23 != (std::basic_regex<char>::value_type *)a3)
              ++v23;
            if (v23 == (std::basic_regex<char>::value_type *)a3)
              return a3;
          }
          v57 = *(_QWORD *)(a1 + 56);
          do
          {
            v66 = (std::basic_regex<char>::value_type *)memchr(v23, 10, (char *)a3 - v23);
            if (v66)
              v67 = v66;
            else
              v67 = (std::basic_regex<char>::value_type *)a3;
            if (v67 == v23)
            {
              v58 = operator new(0x10uLL);
              v59 = *(_QWORD *)(v57 + 8);
              v58[1] = v59;
              *(_QWORD *)(v57 + 8) = v58;
              *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            }
            else
            {
              std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, (std::basic_regex<char> *)v23, v67);
            }
            v60 = operator new(0x18uLL);
            v61 = *(_QWORD *)(v57 + 8);
            v60[1] = *(_QWORD *)(v12 + 8);
            v60[2] = v61;
            *v60 = &off_24CDC1228;
            *(_QWORD *)(v12 + 8) = v60;
            *(_QWORD *)(v57 + 8) = 0;
            v62 = operator new(0x10uLL);
            v63 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v62[1] = v63;
            *(_QWORD *)(v57 + 8) = v62;
            *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
            v64 = operator new(0x10uLL);
            v65 = *(_QWORD *)(v57 + 8);
            *v64 = off_24CDC1270;
            v64[1] = v65;
            *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v64;
            v57 = *(_QWORD *)(v57 + 8);
            *(_QWORD *)(a1 + 56) = v57;
            if (v67 == (std::basic_regex<char>::value_type *)a3)
              v23 = v67;
            else
              v23 = v67 + 1;
          }
          while (v23 != (std::basic_regex<char>::value_type *)a3);
          return a3;
        }
        if (v13 == 256)
        {
          v14 = (std::basic_regex<char> *)memchr(a2, 10, (char *)a3 - (char *)a2);
          if (v14)
            v15 = v14;
          else
            v15 = a3;
          if (v15 == a2)
          {
            v42 = operator new(0x10uLL);
            v43 = *(_QWORD *)(v12 + 8);
            v42[1] = v43;
            *(_QWORD *)(v12 + 8) = v42;
            *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            if (v15 != a3)
              v15 = (std::basic_regex<char> *)((char *)v15 + 1);
            if (v15 == a3)
              return a3;
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, (std::basic_regex<char>::value_type *)a2, v15);
            if (v15 != a3)
              v15 = (std::basic_regex<char> *)((char *)v15 + 1);
            if (v15 == a3)
              return a3;
          }
          v44 = *(_QWORD *)(a1 + 56);
          do
          {
            v53 = (std::basic_regex<char> *)memchr(v15, 10, (char *)a3 - (char *)v15);
            if (v53)
              v54 = v53;
            else
              v54 = a3;
            if (v54 == v15)
            {
              v45 = operator new(0x10uLL);
              v46 = *(_QWORD *)(v44 + 8);
              v45[1] = v46;
              *(_QWORD *)(v44 + 8) = v45;
              *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            }
            else
            {
              std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, (std::basic_regex<char>::value_type *)v15, v54);
            }
            v47 = operator new(0x18uLL);
            v48 = *(_QWORD *)(v44 + 8);
            v47[1] = *(_QWORD *)(v12 + 8);
            v47[2] = v48;
            *v47 = &off_24CDC1228;
            *(_QWORD *)(v12 + 8) = v47;
            *(_QWORD *)(v44 + 8) = 0;
            v49 = operator new(0x10uLL);
            v50 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v49[1] = v50;
            *(_QWORD *)(v44 + 8) = v49;
            *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
            v51 = operator new(0x10uLL);
            v52 = *(_QWORD *)(v44 + 8);
            *v51 = off_24CDC1270;
            v51[1] = v52;
            *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v51;
            v44 = *(_QWORD *)(v44 + 8);
            *(_QWORD *)(a1 + 56) = v44;
            if (v54 == a3)
              v15 = v54;
            else
              v15 = (std::basic_regex<char> *)((char *)&v54->__traits_.__loc_.__locale_ + 1);
          }
          while (v15 != a3);
          return a3;
        }
        goto LABEL_80;
      }
      return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, (std::basic_regex<char>::value_type *)a2, a3);
    }
  }
  v12 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 56) = v12;
  v13 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v13 > 0x3F)
    goto LABEL_11;
LABEL_6:
  if (v13)
  {
    if (v13 == 16)
      return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(a1, a2, (std::basic_regex<char>::value_type *)a3);
    if (v13 != 32)
LABEL_80:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
    return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>((std::basic_regex<char> *)a1, (std::basic_regex<char>::value_type *)a2, a3);
  }
  v17 = (char *)a2;
  while (1)
  {
    v18 = v17;
    v17 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(a1, v17, (char *)a3);
    if (v17 == v18)
      break;
LABEL_24:
    if (v17 == v18)
      goto LABEL_37;
  }
  v19 = *(std::__owns_one_state<char> **)(a1 + 56);
  v20 = *(_DWORD *)(a1 + 28);
  v21 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>((std::basic_regex<char> *)a1, v18, (char *)a3);
  if (v21 != (std::basic_regex<char> *)v18)
  {
    v17 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, v21, a3, v19, (v20 + 1), (*(_DWORD *)(a1 + 28) + 1));
    goto LABEL_24;
  }
LABEL_37:
  if (v18 == (std::basic_regex<char>::value_type *)a2)
  {
    v24 = operator new(0x10uLL);
    v25 = *(_QWORD *)(a1 + 56);
    v26 = *(_QWORD *)(v25 + 8);
    v24[1] = v26;
    *(_QWORD *)(v25 + 8) = v24;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  if (v18 == (std::basic_regex<char>::value_type *)a3)
    return a3;
  while (2)
  {
    if (*v18 != 124)
      return (std::basic_regex<char> *)v18;
    v33 = *(_QWORD *)(a1 + 56);
    v34 = v18 + 1;
    v35 = v18 + 1;
    while (2)
    {
      v18 = v35;
      v35 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<char const*>(a1, v35, (char *)a3);
      if (v35 != v18)
      {
LABEL_46:
        if (v35 == v18)
          goto LABEL_41;
        continue;
      }
      break;
    }
    v36 = *(std::__owns_one_state<char> **)(a1 + 56);
    v37 = *(_DWORD *)(a1 + 28);
    v38 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<char const*>((std::basic_regex<char> *)a1, v18, (char *)a3);
    if (v38 != (std::basic_regex<char> *)v18)
    {
      v35 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>(a1, v38, a3, v36, (v37 + 1), (*(_DWORD *)(a1 + 28) + 1));
      goto LABEL_46;
    }
LABEL_41:
    if (v18 == v34)
    {
      v39 = operator new(0x10uLL);
      v40 = *(_QWORD *)(a1 + 56);
      v41 = *(_QWORD *)(v40 + 8);
      v39[1] = v41;
      *(_QWORD *)(v40 + 8) = v39;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    v27 = operator new(0x18uLL);
    v28 = *(_QWORD *)(v33 + 8);
    v27[1] = *(_QWORD *)(v12 + 8);
    v27[2] = v28;
    *v27 = &off_24CDC1228;
    *(_QWORD *)(v12 + 8) = v27;
    *(_QWORD *)(v33 + 8) = 0;
    v29 = operator new(0x10uLL);
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v29[1] = v30;
    *(_QWORD *)(v33 + 8) = v29;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
    v31 = operator new(0x10uLL);
    v32 = *(_QWORD *)(v33 + 8);
    *v31 = off_24CDC1270;
    v31[1] = v32;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v31;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(v33 + 8);
    if (v18 != (std::basic_regex<char>::value_type *)a3)
      continue;
    return a3;
  }
}

void sub_212479358(_Unwind_Exception *a1)
{
  void *v1;
  void (__cdecl ***v2)(std::__owns_one_state<char> *__hidden);

  operator delete(v1);
  operator delete(v2);
  (*(void (**)(void *))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_212479390(_Unwind_Exception *a1)
{
  void *v1;

  std::__end_state<char>::~__end_state(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)17>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BEA2E4](exception, 17);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_2124793E8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<char const*>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char>::value_type *a3)
{
  std::basic_regex<char> *v3;
  _QWORD *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  std::basic_regex<char>::value_type *v10;
  std::__owns_one_state<char> *v11;
  int v12;
  unsigned __int8 *v13;
  _QWORD *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  if (a2 == (std::basic_regex<char> *)a3)
    return (std::basic_regex<char>::value_type *)a2;
  if (LOBYTE(a2->__traits_.__loc_.__locale_) == 94)
  {
    v6 = operator new(0x18uLL);
    v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(v8 + 8);
    *v6 = &off_24CDC0D60;
    v6[1] = v9;
    *((_BYTE *)v6 + 16) = v7;
    *(_QWORD *)(v8 + 8) = v6;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v3 = (std::basic_regex<char> *)((char *)v3 + 1);
  }
  if (v3 != (std::basic_regex<char> *)a3)
  {
    while (v3 != (std::basic_regex<char> *)a3)
    {
      v10 = (std::basic_regex<char>::value_type *)v3;
      v11 = *(std::__owns_one_state<char> **)(a1 + 56);
      v12 = *(_DWORD *)(a1 + 28);
      v13 = std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(a1, v10, a3);
      if (v13 != (unsigned __int8 *)v10)
      {
        v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>((std::basic_regex<char> *)a1, (std::basic_regex<char> *)v13, (std::basic_regex<char> *)a3, v11, (v12 + 1), (*(_DWORD *)(a1 + 28) + 1));
        if (v3 != (std::basic_regex<char> *)v10)
          continue;
      }
      if (v10 + 1 != a3 || *v10 != 36)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      v14 = operator new(0x18uLL);
      v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v16 = *(_QWORD *)(a1 + 56);
      v17 = *(_QWORD *)(v16 + 8);
      *v14 = &off_24CDC0DA8;
      v14[1] = v17;
      *((_BYTE *)v14 + 16) = v15;
      *(_QWORD *)(v16 + 8) = v14;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      return a3;
    }
  }
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char> *a3)
{
  std::basic_regex<char> *v3;
  std::__owns_one_state<char> *end;
  std::basic_regex<char> *v7;
  std::basic_regex<char> *v8;
  std::__owns_one_state<char> *v9;
  std::basic_regex<char> *v10;
  std::basic_regex<char> *v11;
  std::__node<char> *v12;
  std::__node<char> *first;
  std::__node<char> *v14;
  std::__node<char> *v15;
  std::__node<char> *v16;
  std::__node<char> *v17;

  v3 = a3;
  end = a1->__end_;
  v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, a2, a3);
  if (v7 == (std::basic_regex<char> *)a2)
    goto LABEL_13;
  do
  {
    v8 = v7;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, (std::basic_regex<char>::value_type *)v7, v3);
  }
  while (v7 != v8);
  if (v8 == (std::basic_regex<char> *)a2)
LABEL_13:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  if (v8 != v3)
  {
    while (LOBYTE(v8->__traits_.__loc_.__locale_) == 124)
    {
      v9 = a1->__end_;
      v10 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
      v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, (std::basic_regex<char>::value_type *)&v8->__traits_.__loc_.__locale_ + 1, v3);
      if (v11 == (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1))
        goto LABEL_13;
      do
      {
        v8 = v11;
        v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(a1, (std::basic_regex<char>::value_type *)v11, v3);
      }
      while (v11 != v8);
      if (v8 == v10)
        goto LABEL_13;
      v12 = (std::__node<char> *)operator new(0x18uLL);
      first = v9->__first_;
      v12[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
      v12[2].__vftable = (std::__node<char>_vtbl *)first;
      v12->__vftable = (std::__node<char>_vtbl *)&off_24CDC1228;
      end->__first_ = v12;
      v9->__first_ = 0;
      v14 = (std::__node<char> *)operator new(0x10uLL);
      v15 = a1->__end_->__first_;
      v14[1].__vftable = (std::__node<char>_vtbl *)v15;
      v9->__first_ = v14;
      a1->__end_->__first_ = 0;
      v16 = (std::__node<char> *)operator new(0x10uLL);
      v17 = v9->__first_;
      v16->__vftable = (std::__node<char>_vtbl *)off_24CDC1270;
      v16[1].__vftable = (std::__node<char>_vtbl *)v17;
      a1->__end_->__first_ = v16;
      a1->__end_ = (std::__owns_one_state<char> *)v9->__first_;
      if (v8 == v3)
        return v3;
    }
    return v8;
  }
  return v3;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BEA2E4](exception, 14);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_212479704(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__end_state<char>::__exec(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void std::__shared_ptr_pointer<std::__empty_state<char> *,std::shared_ptr<std::__empty_state<char>>::__shared_ptr_default_delete<std::__empty_state<char>,std::__empty_state<char>>,std::allocator<std::__empty_state<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
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
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000021248551ELL)
    return a1 + 24;
  if (((v3 & 0x800000021248551ELL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000021248551ELL))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000021248551ELL & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
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
  operator delete(this);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100](uint64_t a1)
{
  const std::locale *v2;

  v2 = (const std::locale *)MEMORY[0x212BEA41C]();
  *(_QWORD *)(a1 + 8) = std::locale::use_facet(v2, MEMORY[0x24BEDB350]);
  *(_QWORD *)(a1 + 16) = std::locale::use_facet((const std::locale *)a1, MEMORY[0x24BEDB4B0]);
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_QWORD *)(a1 + 56) = 0;
  return a1;
}

void sub_21247990C(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_lookahead(std::basic_regex<char> *this, const std::basic_regex<char> *a2, BOOL a3, unsigned int a4)
{
  char *v8;
  std::__node<char> *first;
  std::__shared_weak_count *cntrl;
  unint64_t *p_shared_owners;
  unint64_t v12;

  v8 = (char *)operator new(0x58uLL);
  first = this->__end_->__first_;
  *(_QWORD *)v8 = off_24CDC0E38;
  *((_QWORD *)v8 + 1) = first;
  std::locale::locale((std::locale *)v8 + 2, &a2->__traits_.__loc_);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)&a2->__traits_.__ct_;
  *(_OWORD *)(v8 + 40) = *(_OWORD *)&a2->__flags_;
  cntrl = a2->__start_.__cntrl_;
  *((_QWORD *)v8 + 7) = a2->__start_.__ptr_;
  *((_QWORD *)v8 + 8) = cntrl;
  if (cntrl)
  {
    p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  *((_QWORD *)v8 + 9) = a2->__end_;
  *((_DWORD *)v8 + 20) = a4;
  v8[84] = a3;
  this->__end_->__first_ = (std::__node<char> *)v8;
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BEA2E4](exception, 6);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_212479A0C(_Unwind_Exception *a1)
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

void std::__l_anchor_multiline<char>::~__l_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__l_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  int v2;

  if (!*(_BYTE *)(a2 + 92))
  {
    if (!*(_BYTE *)(result + 16))
      goto LABEL_12;
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10)
      goto LABEL_12;
LABEL_11:
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
    return result;
  }
  if (*(_QWORD *)(a2 + 16) == *(_QWORD *)(a2 + 8) && (*(_BYTE *)(a2 + 88) & 1) == 0)
    goto LABEL_11;
LABEL_12:
  *(_DWORD *)a2 = -993;
  *(_QWORD *)(a2 + 80) = 0;
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

void std::__r_anchor_multiline<char>::~__r_anchor_multiline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__r_anchor_multiline<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  int v3;
  BOOL v4;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(_BYTE *)(a2 + 88) & 2) == 0
    || *(_BYTE *)(result + 16) && ((v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  }
  else
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  return result;
}

std::locale *std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CDC0DF0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__word_boundary<char,std::regex_traits<char>>::~__word_boundary(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CDC0DF0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
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
  uint64_t v10;

  v2 = *(unsigned __int8 **)(a2 + 8);
  v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3)
    goto LABEL_19;
  v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 != v3)
  {
    if (v4 == v2)
    {
      v5 = *(_DWORD *)(a2 + 88);
      if ((v5 & 0x80) == 0)
      {
        if ((v5 & 4) == 0)
        {
          v6 = *v2;
          if (v6 == 95)
            goto LABEL_17;
          goto LABEL_15;
        }
        goto LABEL_19;
      }
    }
    v7 = *(v4 - 1);
    v8 = *v4;
    if (v7 == 95
      || (v7 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v7) & 0x500) != 0)
    {
      v9 = 1;
      if ((_DWORD)v8 == 95)
        goto LABEL_24;
    }
    else
    {
      v9 = 0;
      if ((_DWORD)v8 == 95)
        goto LABEL_24;
    }
    if ((v8 & 0x80) != 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v8) & 0x500) == 0)
    {
      if (*(_BYTE *)(result + 40) == (v9 != 0))
        goto LABEL_20;
      goto LABEL_27;
    }
LABEL_24:
    if (*(_BYTE *)(result + 40) != (v9 != 1))
      goto LABEL_27;
    goto LABEL_20;
  }
  if ((*(_BYTE *)(a2 + 88) & 8) == 0)
  {
    v6 = *(v3 - 1);
    if (v6 == 95)
      goto LABEL_17;
LABEL_15:
    if ((v6 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
    {
LABEL_17:
      if (*(_BYTE *)(result + 40) != 1)
        goto LABEL_27;
LABEL_20:
      *(_DWORD *)a2 = -993;
      *(_QWORD *)(a2 + 80) = 0;
      return result;
    }
  }
LABEL_19:
  if (!*(_BYTE *)(result + 40))
    goto LABEL_20;
LABEL_27:
  v10 = *(_QWORD *)(result + 8);
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = v10;
  return result;
}

void (__cdecl ***std::__lookahead<char,std::regex_traits<char>>::~__lookahead(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  std::locale *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  void (__cdecl **v6)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))off_24CDC0E38;
  v2 = (std::locale *)(a1 + 2);
  v3 = (std::__shared_weak_count *)a1[8];
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  std::locale::~locale(v2);
  v6 = a1[1];
  if (v6)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v6 + 1))(v6);
  return a1;
}

void std::__lookahead<char,std::regex_traits<char>>::~__lookahead(std::locale *a1)
{
  std::locale *v2;
  std::__shared_weak_count *locale;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::locale::__imp *v6;

  a1->__locale_ = (std::locale::__imp *)off_24CDC0E38;
  v2 = a1 + 2;
  locale = (std::__shared_weak_count *)a1[8].__locale_;
  if (locale)
  {
    p_shared_owners = (unint64_t *)&locale->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))locale->__on_zero_shared)(locale);
      std::__shared_weak_count::__release_weak(locale);
    }
  }
  std::locale::~locale(v2);
  v6 = a1[1].__locale_;
  if (v6)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v6 + 8))(v6);
  operator delete(a1);
}

void std::__lookahead<char,std::regex_traits<char>>::__exec(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  std::vector<std::csub_match>::size_type v5;
  uint64_t v6;
  const char *v7;
  BOOL v8;
  char v9;
  std::vector<std::csub_match>::pointer begin;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  std::sub_match<const char *> *v16;
  uint64_t v17;
  std::vector<std::csub_match> __p;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v22 = 0xAAAAAAAAAAAAAA00;
  v24 = v4;
  v21 = 0;
  v23 = 0uLL;
  LOBYTE(v24) = 0;
  BYTE8(v24) = 0;
  v25 = 0;
  memset(&__p, 0, sizeof(__p));
  v5 = (*(_DWORD *)(a1 + 44) + 1);
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)&v19 = *(_QWORD *)(a2 + 24);
  *((_QWORD *)&v19 + 1) = v19;
  LOBYTE(v20) = 0;
  std::vector<std::sub_match<char const*>>::assign(&__p, v5, (std::vector<std::csub_match>::const_reference)&v19);
  *((_QWORD *)&v20 + 1) = v6;
  v21 = v6;
  LOBYTE(v22) = 0;
  v23 = v19;
  LOBYTE(v24) = v20;
  v25 = v6;
  BYTE8(v24) = 1;
  v7 = *(const char **)(a2 + 16);
  if (*(_BYTE *)(a2 + 92))
    v8 = v7 == *(const char **)(a2 + 8);
  else
    v8 = 0;
  v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == std::basic_regex<char,std::regex_traits<char>>::__match_at_start_ecma<std::allocator<std::sub_match<char const*>>>(a1 + 16, v7, *(const char **)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    begin = __p.__begin_;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 8);
  begin = __p.__begin_;
  v11 = 0xAAAAAAAAAAAAAAABLL * (((char *)__p.__end_ - (char *)__p.__begin_) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!begin)
      return;
    goto LABEL_14;
  }
  v12 = 0;
  v13 = *(_DWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a2 + 32);
  v15 = 1;
  do
  {
    v16 = &begin[v15];
    v17 = v14 + 24 * (v13 + v12);
    *(std::pair<const char *, const char *> *)v17 = v16->std::pair<const char *, const char *>;
    *(_BYTE *)(v17 + 16) = v16->matched;
    v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:
  operator delete(begin);
}

void sub_21247A07C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
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

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BEA2E4](exception, 12);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_21247A110(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BEA2E4](exception, 16);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_21247A15C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void **std::vector<std::__state<char>>::~vector[abi:ne180100](void **a1)
{
  char *v2;
  char *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        v5 = (void *)*((_QWORD *)v3 - 5);
        if (v5)
        {
          *((_QWORD *)v3 - 4) = v5;
          operator delete(v5);
        }
        v6 = (void *)*((_QWORD *)v3 - 8);
        if (v6)
        {
          *((_QWORD *)v3 - 7) = v6;
          operator delete(v6);
        }
        v3 -= 96;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

char *std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>(void **a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v6;
  char *v7;
  __int128 v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  __int128 v19;
  uint64_t v20;
  char *v21;
  void *v22;
  void *v23;

  v2 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 5);
  v3 = v2 + 1;
  if (v2 + 1 > 0x2AAAAAAAAAAAAAALL)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 5) > v3)
    v3 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 5);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 5) >= 0x155555555555555)
    v6 = 0x2AAAAAAAAAAAAAALL;
  else
    v6 = v3;
  if (v6)
  {
    if (v6 > 0x2AAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v7 = (char *)operator new(96 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = *(_OWORD *)(a2 + 16);
  v9 = &v7[96 * v2];
  *(_OWORD *)v9 = *(_OWORD *)a2;
  *((_OWORD *)v9 + 1) = v8;
  v10 = &v7[96 * v6];
  *((_OWORD *)v9 + 2) = *(_OWORD *)(a2 + 32);
  *((_QWORD *)v9 + 6) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(v9 + 85) = *(_QWORD *)(a2 + 85);
  v11 = *(_QWORD *)(a2 + 72);
  v12 = *(_QWORD *)(a2 + 80);
  *((_QWORD *)v9 + 9) = 0;
  *((_QWORD *)v9 + 10) = v12;
  *(_OWORD *)(v9 + 56) = *(_OWORD *)(a2 + 56);
  *((_QWORD *)v9 + 9) = v11;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  v13 = v9 + 96;
  v14 = (char *)*a1;
  v15 = (char *)a1[1];
  if (v15 == *a1)
  {
    *a1 = v9;
    a1[1] = v13;
    a1[2] = v10;
  }
  else
  {
    v16 = 0;
    do
    {
      v17 = &v9[v16];
      v18 = &v15[v16];
      v19 = *(_OWORD *)&v15[v16 - 80];
      *((_OWORD *)v17 - 6) = *(_OWORD *)&v15[v16 - 96];
      *((_OWORD *)v17 - 5) = v19;
      *((_QWORD *)v17 - 7) = 0;
      *((_QWORD *)v17 - 6) = 0;
      *((_OWORD *)v17 - 4) = *(_OWORD *)&v15[v16 - 64];
      *((_QWORD *)v17 - 6) = *(_QWORD *)&v15[v16 - 48];
      *((_QWORD *)v18 - 8) = 0;
      *((_QWORD *)v18 - 7) = 0;
      *((_QWORD *)v18 - 6) = 0;
      *((_QWORD *)v17 - 4) = 0;
      *((_QWORD *)v17 - 3) = 0;
      *(_OWORD *)(v17 - 40) = *(_OWORD *)&v15[v16 - 40];
      *((_QWORD *)v17 - 3) = *(_QWORD *)&v15[v16 - 24];
      *((_QWORD *)v18 - 5) = 0;
      *((_QWORD *)v18 - 4) = 0;
      *((_QWORD *)v18 - 3) = 0;
      v20 = *(_QWORD *)&v15[v16 - 16];
      *(_QWORD *)(v17 - 11) = *(_QWORD *)&v15[v16 - 11];
      *((_QWORD *)v17 - 2) = v20;
      v16 -= 96;
    }
    while (&v15[v16] != v14);
    v15 = (char *)*a1;
    v21 = (char *)a1[1];
    *a1 = &v9[v16];
    a1[1] = v13;
    a1[2] = v10;
    while (v21 != v15)
    {
      v22 = (void *)*((_QWORD *)v21 - 5);
      if (v22)
      {
        *((_QWORD *)v21 - 4) = v22;
        operator delete(v22);
      }
      v23 = (void *)*((_QWORD *)v21 - 8);
      if (v23)
      {
        *((_QWORD *)v21 - 7) = v23;
        operator delete(v23);
      }
      v21 -= 96;
    }
  }
  if (v15)
    operator delete(v15);
  return v13;
}

void std::vector<std::sub_match<char const*>>::__append(std::vector<std::csub_match> *this, std::vector<std::csub_match>::size_type __n, std::vector<std::csub_match>::const_reference __x)
{
  std::sub_match<const char *> *value;
  std::vector<std::csub_match>::pointer end;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  std::sub_match<const char *> *v13;
  std::vector<std::csub_match>::size_type v14;
  std::pair<const char *, const char *> v15;
  std::sub_match<const char *> *v16;
  std::vector<std::csub_match>::size_type v17;
  std::sub_match<const char *> *v18;
  std::pair<const char *, const char *> *v19;
  std::pair<const char *, const char *> v20;
  std::vector<std::csub_match>::pointer begin;
  std::pair<const char *, const char *> v22;

  end = this->__end_;
  value = this->__end_cap_.__value_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)end) >> 3) >= __n)
  {
    if (__n)
    {
      v13 = &end[__n];
      v14 = 24 * __n;
      do
      {
        v15 = __x->std::pair<const char *, const char *>;
        *(_QWORD *)&end->matched = *(_QWORD *)&__x->matched;
        end->std::pair<const char *, const char *> = v15;
        ++end;
        v14 -= 24;
      }
      while (v14);
      end = v13;
    }
    this->__end_ = end;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3);
    v9 = v8 + __n;
    if (v8 + __n > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)value - (char *)this->__begin_) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    if (v11)
    {
      if (v11 > 0xAAAAAAAAAAAAAAALL)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v12 = (char *)operator new(24 * v11);
    }
    else
    {
      v12 = 0;
    }
    v16 = (std::sub_match<const char *> *)&v12[24 * v8];
    v17 = 24 * __n;
    v18 = &v16[__n];
    v19 = v16;
    do
    {
      v20 = __x->std::pair<const char *, const char *>;
      v19[1].first = *(const char **)&__x->matched;
      *v19 = v20;
      v19 = (std::pair<const char *, const char *> *)((char *)v19 + 24);
      v17 -= 24;
    }
    while (v17);
    begin = this->__begin_;
    if (end != this->__begin_)
    {
      do
      {
        v22 = end[-1].std::pair<const char *, const char *>;
        *(_QWORD *)&v16[-1].matched = *(_QWORD *)&end[-1].matched;
        v16[-1].std::pair<const char *, const char *> = v22;
        --v16;
        --end;
      }
      while (end != begin);
      end = this->__begin_;
    }
    this->__begin_ = v16;
    this->__end_ = v18;
    this->__end_cap_.__value_ = (std::sub_match<const char *> *)&v12[24 * v11];
    if (end)
      operator delete(end);
  }
}

uint64_t std::__state<char>::__state(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  _BYTE *v6;
  _BYTE *v7;
  int64_t v8;
  char *v9;
  size_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  char *v14;
  size_t v15;
  uint64_t v16;

  v4 = *a2;
  v5 = a2[1];
  *(_QWORD *)(a1 + 32) = 0;
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  v7 = (_BYTE *)*((_QWORD *)a2 + 4);
  v6 = (_BYTE *)*((_QWORD *)a2 + 5);
  v8 = v6 - v7;
  if (v6 != v7)
  {
    if (0xAAAAAAAAAAAAAAABLL * (v8 >> 3) >= 0xAAAAAAAAAAAAAABLL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v9 = (char *)operator new(v8);
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = v9;
    *(_QWORD *)(a1 + 48) = &v9[8 * (v8 >> 3)];
    v10 = 24 * ((v8 - 24) / 0x18uLL) + 24;
    memcpy(v9, v7, v10);
    *(_QWORD *)(a1 + 40) = &v9[v10];
  }
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  v12 = (_BYTE *)*((_QWORD *)a2 + 7);
  v11 = (_BYTE *)*((_QWORD *)a2 + 8);
  v13 = v11 - v12;
  if (v11 != v12)
  {
    if (v13 < 0)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v14 = (char *)operator new(v11 - v12);
    *(_QWORD *)(a1 + 56) = v14;
    *(_QWORD *)(a1 + 64) = v14;
    *(_QWORD *)(a1 + 72) = &v14[16 * (v13 >> 4)];
    v15 = v13 & 0xFFFFFFFFFFFFFFF0;
    memcpy(v14, v12, v15);
    *(_QWORD *)(a1 + 64) = &v14[v15];
  }
  v16 = *((_QWORD *)a2 + 10);
  *(_QWORD *)(a1 + 85) = *(_QWORD *)((char *)a2 + 85);
  *(_QWORD *)(a1 + 80) = v16;
  return a1;
}

void sub_21247A694(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;
  void *v6;

  v5 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 64) = v5;
    operator delete(v5);
  }
  v6 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 40) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BEA2E4](exception, 11);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_21247A700(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any_but_newline<char>::~__match_any_but_newline(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BEA2E4](exception, 3);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_21247A7CC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  std::basic_regex<char>::value_type v6;
  unsigned __int8 *result;
  unsigned __int8 v8;
  std::basic_regex<char>::value_type v9;
  int v10;
  int v11;
  unsigned __int8 v12;
  char v13;
  unsigned __int8 v14;
  char v15;
  std::basic_regex<char>::value_type v16;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  v6 = v5;
  switch((char)v5)
  {
    case '0':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 0);
        return v4 + 1;
      }
    case 'c':
      if (v4 + 1 == a3)
        goto LABEL_81;
      v8 = v4[1];
      if (((v8 & 0xDF) - 65) > 0x19u)
        goto LABEL_81;
      v9 = v8 & 0x1F;
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v9;
        *((_BYTE *)a4 + 1) = 0;
        return v4 + 2;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v9);
        return v4 + 2;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return v4 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return v4 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return v4 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return v4 + 1;
      }
    case 'u':
      if (v4 + 1 != a3)
      {
        v10 = v4[1];
        if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38 || (v10 | 0x20u) - 97 < 6)
        {
          v4 += 2;
          if (v4 != a3)
          {
            v11 = *v4;
            if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38 || (v11 | 0x20u) - 97 < 6)
              goto LABEL_38;
          }
        }
      }
      goto LABEL_81;
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return v4 + 1;
      }
      else
      {
        v6 = 11;
LABEL_65:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        return v4 + 1;
      }
    case 'x':
LABEL_38:
      if (v4 + 1 == a3)
        goto LABEL_81;
      v12 = v4[1];
      v13 = -48;
      if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38)
        goto LABEL_43;
      v12 |= 0x20u;
      if ((v12 - 97) >= 6u)
        goto LABEL_81;
      v13 = -87;
LABEL_43:
      if (v4 + 2 == a3)
        goto LABEL_81;
      v14 = v4[2];
      v15 = -48;
      if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38)
      {
        v14 |= 0x20u;
        if ((v14 - 97) >= 6u)
LABEL_81:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
        v15 = -87;
      }
      v16 = v14 + 16 * (v12 + v13) + v15;
      if (!a4)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v16);
        v4 += 3;
        return v4;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v16;
      *((_BYTE *)a4 + 1) = 0;
      result = v4 + 3;
      break;
    default:
      if ((char)v5 == 95 || ((char)v5 & 0x80000000) == 0 && (a1->__traits_.__ct_->__tab_[v5] & 0x500) != 0)
        goto LABEL_81;
      if (!a4)
        goto LABEL_65;
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v5;
      *((_BYTE *)a4 + 1) = 0;
      return v4 + 1;
  }
  return result;
}

void std::basic_regex<char,std::regex_traits<char>>::__push_char(std::basic_regex<char> *this, std::basic_regex<char>::value_type __c)
{
  uint64_t v2;
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  std::__node<char> *v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  char *v8;
  std::__node<char> *first;
  std::__node<char> *v10;

  v2 = __c;
  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = (char *)operator new(0x30uLL);
    first = this->__end_->__first_;
    *(_QWORD *)v8 = off_24CDC0EC8;
    *((_QWORD *)v8 + 1) = first;
    std::locale::locale((std::locale *)v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    v8[40] = ((uint64_t (*)(const std::ctype<char> *, uint64_t))this->__traits_.__ct_->do_tolower)(this->__traits_.__ct_, v2);
LABEL_6:
    this->__end_->__first_ = (std::__node<char> *)v8;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = (char *)operator new(0x30uLL);
    v10 = this->__end_->__first_;
    *(_QWORD *)v8 = off_24CDC0F10;
    *((_QWORD *)v8 + 1) = v10;
    std::locale::locale((std::locale *)v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)&this->__traits_.__ct_;
    v8[40] = v2;
    goto LABEL_6;
  }
  v5 = (std::__node<char> *)operator new(0x18uLL);
  end = this->__end_;
  v7 = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&off_24CDC0F58;
  v5[1].__vftable = (std::__node<char>_vtbl *)v7;
  LOBYTE(v5[2].__vftable) = v2;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

void sub_21247AD9C(_Unwind_Exception *a1)
{
  void (__cdecl ***v1)(std::__owns_one_state<char> *__hidden);
  std::locale *v2;
  void (__cdecl **v4)(std::__owns_one_state<char> *__hidden);

  std::locale::~locale(v2);
  v4 = v1[1];
  if (v4)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v4 + 1))(v4);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BEA2E4](exception, 4);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_21247AE10(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(std::basic_regex<char> *this, int __i)
{
  std::basic_regex<_CharT, _Traits>::flag_type flags;
  std::__node<char> *v5;
  std::__owns_one_state<char> *end;
  std::__node<char> *v7;
  std::locale *v8;
  std::locale *v9;
  std::__node<char> *first;
  uint64_t (**v11)();

  flags = this->__flags_;
  if ((flags & 1) != 0)
  {
    v8 = (std::locale *)operator new(0x30uLL);
    v9 = v8;
    first = this->__end_->__first_;
    v11 = off_24CDC0FA0;
LABEL_6:
    v8->__locale_ = (std::locale::__imp *)v11;
    v8[1].__locale_ = (std::locale::__imp *)first;
    std::locale::locale(v8 + 2, &this->__traits_.__loc_);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)&this->__traits_.__ct_;
    LODWORD(v9[5].__locale_) = __i;
    this->__end_->__first_ = (std::__node<char> *)v9;
    goto LABEL_7;
  }
  if ((flags & 8) != 0)
  {
    v8 = (std::locale *)operator new(0x30uLL);
    v9 = v8;
    first = this->__end_->__first_;
    v11 = off_24CDC0FE8;
    goto LABEL_6;
  }
  v5 = (std::__node<char> *)operator new(0x18uLL);
  end = this->__end_;
  v7 = end->__first_;
  v5->__vftable = (std::__node<char>_vtbl *)&off_24CDC1030;
  v5[1].__vftable = (std::__node<char>_vtbl *)v7;
  LODWORD(v5[2].__vftable) = __i;
  end->__first_ = v5;
LABEL_7:
  this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
}

std::locale *std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CDC0EC8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_icase<char,std::regex_traits<char>>::~__match_char_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CDC0EC8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__match_char_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  char *v3;
  uint64_t v4;

  v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (v4 = result,
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(result + 24) + 40))(*(_QWORD *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(_QWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(v4 + 8);
  }
  return result;
}

std::locale *std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CDC0F10;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__match_char_collate<char,std::regex_traits<char>>::~__match_char_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CDC0F10;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__match_char_collate<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  }
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

void std::__match_char<char>::~__match_char(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__match_char<char>::__exec(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  }
  return result;
}

std::locale *std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CDC0FA0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_icase<char,std::regex_traits<char>>::~__back_ref_icase(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CDC0FA0;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
}

uint64_t std::__back_ref_icase<char,std::regex_traits<char>>::__exec(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v3 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (!*(_BYTE *)(v3 + 16)
    || (v4 = *(_QWORD *)(v3 + 8) - *(_QWORD *)v3, v5 = *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24) - v5 < v4))
  {
LABEL_3:
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    return result;
  }
  v6 = result;
  if (v4 >= 1)
  {
    v7 = 0;
    while (1)
    {
      v8 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v6 + 24) + 40))(*(_QWORD *)(v6 + 24), *(char *)(*(_QWORD *)v3 + v7));
      result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v6 + 24) + 40))(*(_QWORD *)(v6 + 24), *(char *)(*(_QWORD *)(a2 + 16) + v7));
      if (v8 != (_DWORD)result)
        goto LABEL_3;
      if (v4 == ++v7)
      {
        v5 = *(_QWORD *)(a2 + 16);
        break;
      }
    }
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 16) = v5 + v4;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(v6 + 8);
  return result;
}

std::locale *std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CDC0FE8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void std::__back_ref_collate<char,std::regex_traits<char>>::~__back_ref_collate(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_24CDC0FE8;
  std::locale::~locale(a1 + 2);
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete(a1);
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
  int v10;
  int v11;
  int v12;

  v2 = *(_DWORD *)(result + 40) - 1;
  v3 = *(_QWORD *)(a2 + 32);
  if (!*(_BYTE *)(v3 + 24 * v2 + 16)
    || (v4 = (unsigned __int8 **)(v3 + 24 * v2),
        v5 = *v4,
        v6 = v4[1] - *v4,
        v7 = *(_QWORD *)(a2 + 16),
        *(_QWORD *)(a2 + 24) - v7 < v6))
  {
LABEL_3:
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    return result;
  }
  if (v6 >= 1)
  {
    v8 = v6;
    v9 = *(unsigned __int8 **)(a2 + 16);
    do
    {
      v11 = *v5++;
      v10 = v11;
      v12 = *v9++;
      if (v10 != v12)
        goto LABEL_3;
    }
    while (--v8);
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 16) = v7 + v6;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
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

void std::__back_ref<char>::~__back_ref(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
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
    *(_QWORD *)(a2 + 80) = *((_QWORD *)v6 + 1);
  }
  else
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  return result;
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  _BYTE *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  size_t v20;
  unint64_t v21;
  _BYTE *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  size_t v26;
  unint64_t v27;
  unint64_t v28;
  __int128 *v29;
  _OWORD *v30;
  unint64_t v31;
  __int128 v32;
  char *v33;
  _QWORD *v34;
  unint64_t v35;
  uint64_t v36;
  __int128 *v37;
  _OWORD *v38;
  unint64_t v39;
  __int128 v40;
  char *v41;
  _QWORD *v42;
  unint64_t v43;
  uint64_t v44;
  __int128 *v45;
  _OWORD *v46;
  unint64_t v47;
  __int128 v48;
  char *v49;
  _QWORD *v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  char v54;
  char *v55;
  char v56;
  char *v57;
  char v58;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      v6 = *(_BYTE **)(a1 + 40);
      v7 = v5 - v6;
      v8 = v5 - v6 + 1;
      if (v8 >= 0)
      {
        v9 = v4 - (_QWORD)v6;
        if (2 * v9 > v8)
          v8 = 2 * v9;
        if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
          v10 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v10 = v8;
        if (v10)
        {
          v11 = operator new(v10);
          v12 = &v11[v7];
          v13 = &v11[v10];
          v11[v7] = v2;
          v14 = (uint64_t)&v11[v7 + 1];
          if (v5 == v6)
            goto LABEL_49;
        }
        else
        {
          v11 = 0;
          v12 = (char *)(v5 - v6);
          v13 = 0;
          *(_BYTE *)v7 = v2;
          v14 = v7 + 1;
          if (v5 == v6)
            goto LABEL_49;
        }
        if (v7 < 8 || (unint64_t)(v6 - v11) < 0x20)
          goto LABEL_76;
        if (v7 < 0x20)
        {
          v21 = 0;
          goto LABEL_55;
        }
        v21 = v7 & 0xFFFFFFFFFFFFFFE0;
        v29 = (__int128 *)(v5 - 16);
        v30 = &v11[v5 - 16 - v6];
        v31 = v7 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v32 = *v29;
          *(v30 - 1) = *(v29 - 1);
          *v30 = v32;
          v30 -= 2;
          v29 -= 2;
          v31 -= 32;
        }
        while (v31);
        if (v7 != v21)
        {
          if ((v7 & 0x18) == 0)
          {
            v12 -= v21;
            v5 -= v21;
            goto LABEL_76;
          }
LABEL_55:
          v12 -= v7 & 0xFFFFFFFFFFFFFFF8;
          v33 = &v5[-v21 - 8];
          v34 = &v11[v33 - v6];
          v35 = v21 - (v7 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            v36 = *(_QWORD *)v33;
            v33 -= 8;
            *v34-- = v36;
            v35 += 8;
          }
          while (v35);
          v5 -= v7 & 0xFFFFFFFFFFFFFFF8;
          if (v7 == (v7 & 0xFFFFFFFFFFFFFFF8))
            goto LABEL_86;
LABEL_76:
          v53 = v12 - 1;
          do
          {
            v54 = *--v5;
            *v53-- = v54;
          }
          while (v5 != v6);
        }
LABEL_86:
        v5 = *(_BYTE **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v11;
        *(_QWORD *)(a1 + 48) = v14;
        *(_QWORD *)(a1 + 56) = v13;
        if (!v5)
          goto LABEL_50;
        goto LABEL_87;
      }
LABEL_88:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
LABEL_24:
    *v5 = v2;
    *(_QWORD *)(a1 + 48) = v5 + 1;
    return;
  }
  v5 = *(_BYTE **)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 < v15)
      goto LABEL_24;
    v16 = *(_BYTE **)(a1 + 40);
    v17 = v5 - v16;
    v18 = v5 - v16 + 1;
    if (v18 < 0)
      goto LABEL_88;
    v19 = v15 - (_QWORD)v16;
    if (2 * v19 > v18)
      v18 = 2 * v19;
    if (v19 >= 0x3FFFFFFFFFFFFFFFLL)
      v20 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v20 = v18;
    if (v20)
    {
      v11 = operator new(v20);
      v12 = &v11[v17];
      v13 = &v11[v20];
      v11[v17] = v2;
      v14 = (uint64_t)&v11[v17 + 1];
      if (v5 == v16)
        goto LABEL_49;
    }
    else
    {
      v11 = 0;
      v12 = (char *)(v5 - v16);
      v13 = 0;
      *(_BYTE *)v17 = a2;
      v14 = v17 + 1;
      if (v5 == v16)
        goto LABEL_49;
    }
    if (v17 >= 8 && (unint64_t)(v16 - v11) >= 0x20)
    {
      if (v17 >= 0x20)
      {
        v27 = v17 & 0xFFFFFFFFFFFFFFE0;
        v37 = (__int128 *)(v5 - 16);
        v38 = &v11[v5 - 16 - v16];
        v39 = v17 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v40 = *v37;
          *(v38 - 1) = *(v37 - 1);
          *v38 = v40;
          v38 -= 2;
          v37 -= 2;
          v39 -= 32;
        }
        while (v39);
        if (v17 == v27)
          goto LABEL_86;
        if ((v17 & 0x18) == 0)
        {
          v12 -= v27;
          v5 -= v27;
          goto LABEL_80;
        }
      }
      else
      {
        v27 = 0;
      }
      v12 -= v17 & 0xFFFFFFFFFFFFFFF8;
      v41 = &v5[-v27 - 8];
      v42 = &v11[v41 - v16];
      v43 = v27 - (v17 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v44 = *(_QWORD *)v41;
        v41 -= 8;
        *v42-- = v44;
        v43 += 8;
      }
      while (v43);
      v5 -= v17 & 0xFFFFFFFFFFFFFFF8;
      if (v17 == (v17 & 0xFFFFFFFFFFFFFFF8))
        goto LABEL_86;
    }
LABEL_80:
    v55 = v12 - 1;
    do
    {
      v56 = *--v5;
      *v55-- = v56;
    }
    while (v5 != v16);
    goto LABEL_86;
  }
  if ((unint64_t)v5 < v15)
    goto LABEL_24;
  v22 = *(_BYTE **)(a1 + 40);
  v23 = v5 - v22;
  v24 = v5 - v22 + 1;
  if (v24 < 0)
    goto LABEL_88;
  v25 = v15 - (_QWORD)v22;
  if (2 * v25 > v24)
    v24 = 2 * v25;
  if (v25 >= 0x3FFFFFFFFFFFFFFFLL)
    v26 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v26 = v24;
  if (!v26)
  {
    v11 = 0;
    v12 = (char *)(v5 - v22);
    v13 = 0;
    *(_BYTE *)v23 = a2;
    v14 = v23 + 1;
    if (v5 == v22)
      goto LABEL_49;
LABEL_45:
    if (v23 < 8 || (unint64_t)(v22 - v11) < 0x20)
      goto LABEL_84;
    if (v23 >= 0x20)
    {
      v28 = v23 & 0xFFFFFFFFFFFFFFE0;
      v45 = (__int128 *)(v5 - 16);
      v46 = &v11[v5 - 16 - v22];
      v47 = v23 & 0xFFFFFFFFFFFFFFE0;
      do
      {
        v48 = *v45;
        *(v46 - 1) = *(v45 - 1);
        *v46 = v48;
        v46 -= 2;
        v45 -= 2;
        v47 -= 32;
      }
      while (v47);
      if (v23 == v28)
        goto LABEL_86;
      if ((v23 & 0x18) == 0)
      {
        v12 -= v28;
        v5 -= v28;
        goto LABEL_84;
      }
    }
    else
    {
      v28 = 0;
    }
    v12 -= v23 & 0xFFFFFFFFFFFFFFF8;
    v49 = &v5[-v28 - 8];
    v50 = &v11[v49 - v22];
    v51 = v28 - (v23 & 0xFFFFFFFFFFFFFFF8);
    do
    {
      v52 = *(_QWORD *)v49;
      v49 -= 8;
      *v50-- = v52;
      v51 += 8;
    }
    while (v51);
    v5 -= v23 & 0xFFFFFFFFFFFFFFF8;
    if (v23 == (v23 & 0xFFFFFFFFFFFFFFF8))
      goto LABEL_86;
LABEL_84:
    v57 = v12 - 1;
    do
    {
      v58 = *--v5;
      *v57-- = v58;
    }
    while (v5 != v22);
    goto LABEL_86;
  }
  v11 = operator new(v26);
  v12 = &v11[v23];
  v13 = &v11[v26];
  v11[v23] = v2;
  v14 = (uint64_t)&v11[v23 + 1];
  if (v5 != v22)
    goto LABEL_45;
LABEL_49:
  *(_QWORD *)(a1 + 40) = v12;
  *(_QWORD *)(a1 + 48) = v14;
  *(_QWORD *)(a1 + 56) = v13;
  if (!v5)
  {
LABEL_50:
    *(_QWORD *)(a1 + 48) = v14;
    return;
  }
LABEL_87:
  operator delete(v5);
  *(_QWORD *)(a1 + 48) = v14;
}

uint64_t std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  const std::locale *v11;
  __int128 v12;
  std::string::size_type size;
  std::string *v14;
  BOOL v15;
  std::locale v17;
  std::string v18;

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
  std::locale::locale(&v17, v11);
  std::locale::name(&v18, &v17);
  size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v18.__r_.__value_.__l.__size_;
  if (size == 1)
  {
    v14 = (std::string *)v18.__r_.__value_.__r.__words[0];
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v14 = &v18;
    v15 = v14->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_9;
  }
  else
  {
    v15 = 1;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
LABEL_9:
      operator delete(v18.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v17);
  *(_BYTE *)(a1 + 171) = v15;
  return a1;
}

void sub_21247BB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  uint64_t v9;
  std::locale *v10;
  void **v11;
  void **v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  std::locale::~locale(&a9);
  std::vector<std::string>::~vector[abi:ne180100]((void **)(v9 + 136));
  v14 = *(void **)(v9 + 112);
  if (v14)
  {
    *(_QWORD *)(v9 + 120) = v14;
    operator delete(v14);
    std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](v11);
    v15 = *(void **)(v9 + 64);
    if (!v15)
    {
LABEL_3:
      v16 = *v12;
      if (!*v12)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else
  {
    std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](v11);
    v15 = *(void **)(v9 + 64);
    if (!v15)
      goto LABEL_3;
  }
  *(_QWORD *)(v9 + 72) = v15;
  operator delete(v15);
  v16 = *v12;
  if (!*v12)
  {
LABEL_5:
    std::locale::~locale(v10);
    v17 = *(_QWORD *)(v9 + 8);
    if (v17)
      (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
    _Unwind_Resume(a1);
  }
LABEL_4:
  *(_QWORD *)(v9 + 48) = v16;
  operator delete(v16);
  goto LABEL_5;
}

void **std::vector<std::pair<std::string,std::string>>::~vector[abi:ne180100](void **a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if (v3 == v2)
    {
LABEL_11:
      a1[1] = v2;
      operator delete(v4);
      return a1;
    }
    while (1)
    {
      if (*((char *)v3 - 1) < 0)
      {
        operator delete(*(v3 - 3));
        if (*((char *)v3 - 25) < 0)
LABEL_9:
          operator delete(*(v3 - 6));
      }
      else if (*((char *)v3 - 25) < 0)
      {
        goto LABEL_9;
      }
      v3 -= 6;
      if (v3 == v2)
      {
        v4 = *a1;
        goto LABEL_11;
      }
    }
  }
  return a1;
}

uint64_t std::pair<std::string,std::string>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
  {
    operator delete(*(void **)(a1 + 24));
    if ((*(char *)(a1 + 23) & 0x80000000) == 0)
      return a1;
  }
  else if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    return a1;
  }
  operator delete(*(void **)a1);
  return a1;
}

std::locale *std::__bracket_expression<char,std::regex_traits<char>>::~__bracket_expression(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale::__imp *v6;
  std::locale::__imp *v7;
  std::locale::__imp *v8;
  std::locale::__imp *v9;
  std::locale::__imp *v10;
  std::locale::__imp *v11;

  locale = a1[17].__locale_;
  if (locale)
  {
    v3 = a1[18].__locale_;
    v4 = a1[17].__locale_;
    if (v3 != locale)
    {
      do
      {
        if (*((char *)v3 - 1) < 0)
          operator delete(*((void **)v3 - 3));
        v3 = (std::locale::__imp *)((char *)v3 - 24);
      }
      while (v3 != locale);
      v4 = a1[17].__locale_;
    }
    a1[18].__locale_ = locale;
    operator delete(v4);
  }
  v5 = a1[14].__locale_;
  if (v5)
  {
    a1[15].__locale_ = v5;
    operator delete(v5);
  }
  v6 = a1[11].__locale_;
  if (v6)
  {
    v7 = a1[12].__locale_;
    v8 = a1[11].__locale_;
    if (v7 == v6)
    {
LABEL_21:
      a1[12].__locale_ = v6;
      operator delete(v8);
      goto LABEL_22;
    }
    while (1)
    {
      if (*((char *)v7 - 1) < 0)
      {
        operator delete(*((void **)v7 - 3));
        if (*((char *)v7 - 25) < 0)
LABEL_19:
          operator delete(*((void **)v7 - 6));
      }
      else if (*((char *)v7 - 25) < 0)
      {
        goto LABEL_19;
      }
      v7 = (std::locale::__imp *)((char *)v7 - 48);
      if (v7 == v6)
      {
        v8 = a1[11].__locale_;
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v9 = a1[8].__locale_;
  if (v9)
  {
    a1[9].__locale_ = v9;
    operator delete(v9);
  }
  v10 = a1[5].__locale_;
  if (v10)
  {
    a1[6].__locale_ = v10;
    operator delete(v10);
  }
  std::locale::~locale(a1 + 2);
  v11 = a1[1].__locale_;
  if (v11)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v11 + 8))(v11);
  return a1;
}

void std::regex_traits<char>::__transform_primary<char *>(_QWORD *a1, uint64_t a2, _BYTE *__src, _BYTE *a4)
{
  size_t v4;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void **v13;
  uint64_t v14;
  int v15;
  _BYTE *v16;
  void *__dst[3];

  v4 = a4 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a4 - __src) >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v4 <= 0x16)
  {
    HIBYTE(__dst[2]) = (_BYTE)a4 - (_BYTE)__src;
    v9 = __dst;
    if (__src == a4)
      goto LABEL_9;
LABEL_8:
    memcpy(v9, __src, v4);
    v9 = (void **)((char *)v9 + v4);
    goto LABEL_9;
  }
  v10 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17)
    v10 = v4 | 7;
  v11 = v10 + 1;
  v9 = (void **)operator new(v10 + 1);
  __dst[1] = (void *)v4;
  __dst[2] = (void *)(v11 | 0x8000000000000000);
  __dst[0] = v9;
  if (__src != a4)
    goto LABEL_8;
LABEL_9:
  *(_BYTE *)v9 = 0;
  memset(a1, 170, 24);
  v12 = (char *)HIBYTE(__dst[2]);
  if (SHIBYTE(__dst[2]) >= 0)
    v13 = __dst;
  else
    v13 = (void **)__dst[0];
  if (SHIBYTE(__dst[2]) < 0)
    v12 = (char *)__dst[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v13, &v12[(_QWORD)v13]);
  v14 = *((unsigned __int8 *)a1 + 23);
  v15 = (char)v14;
  if ((v14 & 0x80u) != 0)
    v14 = a1[1];
  if (v14 == 1)
  {
LABEL_25:
    if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
      return;
    goto LABEL_26;
  }
  if (v14 == 12)
  {
    if (v15 >= 0)
      v16 = a1;
    else
      v16 = (_BYTE *)*a1;
    v16[11] = v16[3];
    if (SHIBYTE(__dst[2]) < 0)
      goto LABEL_26;
    return;
  }
  if ((v15 & 0x80000000) == 0)
  {
    *(_BYTE *)a1 = 0;
    *((_BYTE *)a1 + 23) = 0;
    goto LABEL_25;
  }
  *(_BYTE *)*a1 = 0;
  a1[1] = 0;
  if (SHIBYTE(__dst[2]) < 0)
LABEL_26:
    operator delete(__dst[0]);
}

void sub_21247BFB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BEA2E4](exception, 5);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_21247C008(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<char const*>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  unsigned __int8 *result;

  if (a2 == a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  switch(*a2)
  {
    case 'D':
      *(_DWORD *)(a5 + 164) |= 0x400u;
      result = a2 + 1;
      break;
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'T':
    case 'U':
    case 'V':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '_':
    case 'a':
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 't':
    case 'u':
    case 'v':
      goto LABEL_8;
    case 'S':
      *(_DWORD *)(a5 + 164) |= 0x4000u;
      result = a2 + 1;
      break;
    case 'W':
      *(_DWORD *)(a5 + 164) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](a5);
      result = a2 + 1;
      break;
    case 'b':
      if (*(char *)(a4 + 23) < 0)
      {
        *(_QWORD *)(a4 + 8) = 1;
        a4 = *(_QWORD *)a4;
      }
      else
      {
        *(_BYTE *)(a4 + 23) = 1;
      }
      *(_WORD *)a4 = 8;
      result = a2 + 1;
      break;
    case 'd':
      *(_DWORD *)(a5 + 160) |= 0x400u;
      result = a2 + 1;
      break;
    case 's':
      *(_DWORD *)(a5 + 160) |= 0x4000u;
      result = a2 + 1;
      break;
    case 'w':
      *(_DWORD *)(a5 + 160) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
      result = a2 + 1;
      break;
    default:
      if (*a2)
      {
LABEL_8:
        result = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<char const*>(a1, a2, a3, (uint64_t *)a4);
      }
      else
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(_QWORD *)(a4 + 8) = 1;
          a4 = *(_QWORD *)a4;
        }
        else
        {
          *(_BYTE *)(a4 + 23) = 1;
        }
        *(_BYTE *)a4 = 0;
        *(_BYTE *)(a4 + 1) = 0;
        result = a2 + 1;
      }
      break;
  }
  return result;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3, uint64_t *a4)
{
  std::basic_regex<char>::value_type v5;
  std::basic_regex<char>::value_type v7;
  std::basic_regex<char>::value_type *v8;
  std::basic_regex<char>::value_type v9;
  int v10;
  std::basic_regex<char>::value_type v11;

  if (a2 == a3)
LABEL_70:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v5 = *a2;
  switch(*a2)
  {
    case '"':
    case '/':
    case '\\':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v5;
        *((_BYTE *)a4 + 1) = 0;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
        return a2 + 1;
      }
    case 'a':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 7;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 7);
        return a2 + 1;
      }
    case 'b':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 8);
        return a2 + 1;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return a2 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return a2 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return a2 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return a2 + 1;
      }
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 11);
        return a2 + 1;
      }
    default:
      if ((v5 & 0xF8) != 0x30)
        goto LABEL_70;
      v7 = *a2 - 48;
      v8 = a2 + 1;
      if (a2 + 1 == a3)
      {
        v8 = a3;
LABEL_42:
        if (a4)
          goto LABEL_43;
LABEL_69:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
        return v8;
      }
      if ((*v8 & 0xF8) != 0x30)
        goto LABEL_42;
      v7 = *v8 + 8 * v7 - 48;
      if (a2 + 2 == a3)
      {
        v8 = a3;
        if (a4)
          goto LABEL_43;
        goto LABEL_69;
      }
      v9 = a2[2];
      v10 = v9 & 0xF8;
      v11 = v9 + 8 * v7 - 48;
      if (v10 == 48)
        v8 = a2 + 3;
      else
        v8 = a2 + 2;
      if (v10 == 48)
        v7 = v11;
      if (!a4)
        goto LABEL_69;
LABEL_43:
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v7;
      *((_BYTE *)a4 + 1) = 0;
      return v8;
  }
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100](uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  unint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t j;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t k;
  char *v18;
  unint64_t v19;
  char *v20;
  unint64_t m;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  uint64_t v31;
  char *v32;
  int v33;
  char *v34;
  char v35;
  char *v36;
  char v37;
  _BYTE *v38;
  unint64_t v39;
  __int128 v40;
  uint64_t v41;
  char *v42;
  int v43;
  void *v44[2];
  uint64_t v45;
  void *v46[2];
  uint64_t v47;
  void *__p[2];
  uint64_t v49;
  void *v50[2];
  uint64_t v51;

  v3 = a3;
  v4 = (uint64_t)a2;
  if (!*(_BYTE *)(a1 + 170))
  {
    v16 = a2[23];
    if (a2[23] < 0)
    {
      if (*((_QWORD *)a2 + 1) != 1)
        goto LABEL_78;
    }
    else if (v16 != 1)
    {
LABEL_78:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>();
    }
    if (*(char *)(a3 + 23) < 0)
    {
      if (*(_QWORD *)(a3 + 8) != 1)
        goto LABEL_78;
    }
    else if (*(_BYTE *)(a3 + 23) != 1)
    {
      goto LABEL_78;
    }
    if (!*(_BYTE *)(a1 + 169))
    {
LABEL_71:
      *(_OWORD *)__p = *(_OWORD *)v4;
      v49 = *(_QWORD *)(v4 + 16);
      *(_QWORD *)(v4 + 8) = 0;
      *(_QWORD *)(v4 + 16) = 0;
      *(_QWORD *)v4 = 0;
      *(_OWORD *)v50 = *(_OWORD *)v3;
      v51 = *(_QWORD *)(v3 + 16);
      *(_QWORD *)(v3 + 8) = 0;
      *(_QWORD *)(v3 + 16) = 0;
      *(_QWORD *)v3 = 0;
      v39 = *(_QWORD *)(a1 + 96);
      if (v39 >= *(_QWORD *)(a1 + 104))
      {
        v42 = std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>((void **)(a1 + 88), (uint64_t)__p);
        v43 = SHIBYTE(v51);
        *(_QWORD *)(a1 + 96) = v42;
        if (v43 < 0)
        {
          operator delete(v50[0]);
          if ((SHIBYTE(v49) & 0x80000000) == 0)
            return;
        }
        else if ((SHIBYTE(v49) & 0x80000000) == 0)
        {
          return;
        }
      }
      else
      {
        v40 = *(_OWORD *)__p;
        *(_QWORD *)(v39 + 16) = v49;
        *(_OWORD *)v39 = v40;
        __p[1] = 0;
        v49 = 0;
        __p[0] = 0;
        v41 = v51;
        *(_OWORD *)(v39 + 24) = *(_OWORD *)v50;
        *(_QWORD *)(v39 + 40) = v41;
        *(_QWORD *)(a1 + 96) = v39 + 48;
        if ((SHIBYTE(v49) & 0x80000000) == 0)
          return;
      }
      operator delete(__p[0]);
      return;
    }
    v34 = a2;
    if ((v16 & 0x80) != 0)
      v34 = *(char **)a2;
    v35 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v34);
    if (*(char *)(v4 + 23) < 0)
    {
      **(_BYTE **)v4 = v35;
      v36 = (char *)v3;
      if ((*(char *)(v3 + 23) & 0x80000000) == 0)
        goto LABEL_68;
    }
    else
    {
      *(_BYTE *)v4 = v35;
      v36 = (char *)v3;
      if ((*(char *)(v3 + 23) & 0x80000000) == 0)
      {
LABEL_68:
        v37 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v36);
        v38 = (_BYTE *)v3;
        if (*(char *)(v3 + 23) < 0)
          v38 = *(_BYTE **)v3;
        *v38 = v37;
        goto LABEL_71;
      }
    }
    v36 = *(char **)v3;
    goto LABEL_68;
  }
  if (*(_BYTE *)(a1 + 169))
  {
    for (i = 0; ; ++i)
    {
      v7 = *(unsigned __int8 *)(v4 + 23);
      if (*(char *)(v4 + 23) < 0)
      {
        if (i >= *(_QWORD *)(v4 + 8))
        {
LABEL_13:
          for (j = 0; ; ++j)
          {
            v12 = *(unsigned __int8 *)(v3 + 23);
            if (*(char *)(v3 + 23) < 0)
            {
              if (j >= *(_QWORD *)(v3 + 8))
                goto LABEL_44;
            }
            else if (j >= v12)
            {
              goto LABEL_44;
            }
            v13 = v3;
            if ((v12 & 0x80) != 0)
              v13 = *(_QWORD *)v3;
            v14 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *(char *)(v13 + j));
            v15 = v3;
            if (*(char *)(v3 + 23) < 0)
              v15 = *(_QWORD *)v3;
            *(_BYTE *)(v15 + j) = v14;
          }
        }
      }
      else if (i >= v7)
      {
        goto LABEL_13;
      }
      v8 = v4;
      if ((v7 & 0x80) != 0)
        v8 = *(_QWORD *)v4;
      v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *(char *)(v8 + i));
      v10 = v4;
      if (*(char *)(v4 + 23) < 0)
        v10 = *(_QWORD *)v4;
      *(_BYTE *)(v10 + i) = v9;
    }
  }
  for (k = 0; ; ++k)
  {
    v19 = a2[23];
    if (a2[23] < 0)
      break;
    if (k >= v19)
      goto LABEL_35;
LABEL_33:
    v18 = a2;
    if ((v19 & 0x80) != 0)
    {
      v18 = *(char **)a2;
      v20 = *(char **)a2;
    }
    else
    {
      v20 = a2;
    }
    v20[k] = v18[k];
  }
  if (k < *((_QWORD *)a2 + 1))
    goto LABEL_33;
LABEL_35:
  for (m = 0; ; ++m)
  {
    v23 = *(unsigned __int8 *)(a3 + 23);
    if (*(char *)(a3 + 23) < 0)
      break;
    if (m >= v23)
      goto LABEL_44;
LABEL_42:
    v22 = a3;
    if ((v23 & 0x80) != 0)
    {
      v22 = *(_QWORD *)a3;
      v24 = *(_QWORD *)a3;
    }
    else
    {
      v24 = a3;
    }
    *(_BYTE *)(v24 + m) = *(_BYTE *)(v22 + m);
  }
  if (m < *(_QWORD *)(a3 + 8))
    goto LABEL_42;
LABEL_44:
  if (*(char *)(v4 + 23) < 0)
  {
    v26 = v4;
    v4 = *(_QWORD *)v4;
    v25 = *(_QWORD *)(v26 + 8);
  }
  else
  {
    v25 = *(unsigned __int8 *)(v4 + 23);
  }
  std::regex_traits<char>::transform<std::__wrap_iter<char *>>((uint64_t)v46, a1 + 16, v4, (char *)(v4 + v25));
  if (*(char *)(v3 + 23) < 0)
  {
    v28 = v3;
    v3 = *(_QWORD *)v3;
    v27 = *(_QWORD *)(v28 + 8);
  }
  else
  {
    v27 = *(unsigned __int8 *)(v3 + 23);
  }
  std::regex_traits<char>::transform<std::__wrap_iter<char *>>((uint64_t)v44, a1 + 16, v3, (char *)(v3 + v27));
  *(_OWORD *)__p = *(_OWORD *)v46;
  v49 = v47;
  v46[1] = 0;
  v47 = 0;
  *(_OWORD *)v50 = *(_OWORD *)v44;
  v51 = v45;
  v44[0] = 0;
  v44[1] = 0;
  v45 = 0;
  v46[0] = 0;
  v29 = *(_QWORD *)(a1 + 96);
  if (v29 >= *(_QWORD *)(a1 + 104))
  {
    v32 = std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>((void **)(a1 + 88), (uint64_t)__p);
    v33 = SHIBYTE(v51);
    *(_QWORD *)(a1 + 96) = v32;
    if (v33 < 0)
    {
      operator delete(v50[0]);
      if ((SHIBYTE(v49) & 0x80000000) == 0)
        goto LABEL_57;
    }
    else if ((SHIBYTE(v49) & 0x80000000) == 0)
    {
      goto LABEL_57;
    }
LABEL_52:
    operator delete(__p[0]);
    if (SHIBYTE(v45) < 0)
      goto LABEL_53;
LABEL_58:
    if (SHIBYTE(v47) < 0)
LABEL_59:
      operator delete(v46[0]);
  }
  else
  {
    v30 = *(_OWORD *)__p;
    *(_QWORD *)(v29 + 16) = v49;
    *(_OWORD *)v29 = v30;
    __p[1] = 0;
    v49 = 0;
    __p[0] = 0;
    v31 = v51;
    *(_OWORD *)(v29 + 24) = *(_OWORD *)v50;
    *(_QWORD *)(v29 + 40) = v31;
    *(_QWORD *)(a1 + 96) = v29 + 48;
    if (SHIBYTE(v49) < 0)
      goto LABEL_52;
LABEL_57:
    if ((SHIBYTE(v45) & 0x80000000) == 0)
      goto LABEL_58;
LABEL_53:
    operator delete(v44[0]);
    if (SHIBYTE(v47) < 0)
      goto LABEL_59;
  }
}

void sub_21247CAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  std::pair<std::string,std::string>::~pair((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_21247CAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  std::pair<std::string,std::string>::~pair((uint64_t)&a21);
  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100](uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  __int16 v6;
  unint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _WORD *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  _OWORD *v33;
  char *v34;
  unint64_t v35;
  __int128 v36;
  __int16 v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  char *v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  _OWORD *v50;
  char *v51;
  unint64_t v52;
  __int128 v53;
  __int16 v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  _OWORD *v59;
  char *v60;
  unint64_t v61;
  __int128 v62;
  __int16 v63;

  if (*(_BYTE *)(a1 + 169))
  {
    v5 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v6 = v5 | (unsigned __int16)((*(unsigned __int16 (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a3) << 8);
    v8 = *(char **)(a1 + 120);
    v7 = *(_QWORD *)(a1 + 128);
    if ((unint64_t)v8 >= v7)
    {
      v9 = *(char **)(a1 + 112);
      v10 = v8 - v9;
      if (v8 - v9 > -3)
      {
        v11 = v10 >> 1;
        v12 = v7 - (_QWORD)v9;
        if (v12 <= (v10 >> 1) + 1)
          v13 = v11 + 1;
        else
          v13 = v12;
        if (v12 >= 0x7FFFFFFFFFFFFFFELL)
          v14 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v14 = v13;
        if (!v14)
        {
          v15 = 0;
          v16 = (_WORD *)(2 * v11);
          v17 = 0;
          *(_WORD *)(2 * v11) = v6;
          v18 = 2 * v11 + 2;
          v19 = (char *)(v8 - v9);
          if (v8 == v9)
            goto LABEL_64;
LABEL_30:
          v29 = (unint64_t)(v19 - 2);
          if (v29 < 0x1E)
            goto LABEL_71;
          if (v8 - v15 - (v10 & 0xFFFFFFFFFFFFFFFELL) < 0x20)
            goto LABEL_71;
          v30 = (v29 >> 1) + 1;
          v31 = 2 * (v30 & 0xFFFFFFFFFFFFFFF0);
          v32 = &v8[-v31];
          v16 = (_WORD *)((char *)v16 - v31);
          v33 = &v15[2 * v11 - 16];
          v34 = v8 - 16;
          v35 = v30 & 0xFFFFFFFFFFFFFFF0;
          do
          {
            v36 = *(_OWORD *)v34;
            *(v33 - 1) = *((_OWORD *)v34 - 1);
            *v33 = v36;
            v33 -= 2;
            v34 -= 32;
            v35 -= 16;
          }
          while (v35);
          v8 = v32;
          if (v30 != (v30 & 0xFFFFFFFFFFFFFFF0))
          {
LABEL_71:
            do
            {
              v37 = *((_WORD *)v8 - 1);
              v8 -= 2;
              *--v16 = v37;
            }
            while (v8 != v9);
          }
LABEL_63:
          v8 = *(char **)(a1 + 112);
          goto LABEL_64;
        }
        if ((v14 & 0x8000000000000000) == 0)
        {
          v15 = operator new(2 * v14);
          v16 = &v15[2 * v11];
          v17 = &v15[2 * v14];
          *v16 = v6;
          v18 = (uint64_t)(v16 + 1);
          v19 = (char *)(v8 - v9);
          if (v8 == v9)
            goto LABEL_64;
          goto LABEL_30;
        }
LABEL_68:
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
LABEL_67:
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
LABEL_28:
    *(_WORD *)v8 = v6;
    v18 = (uint64_t)(v8 + 2);
    goto LABEL_66;
  }
  v6 = a2 | (unsigned __int16)((_WORD)a3 << 8);
  v8 = *(char **)(a1 + 120);
  v20 = *(_QWORD *)(a1 + 128);
  if (*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v8 < v20)
      goto LABEL_28;
    v21 = *(char **)(a1 + 112);
    v22 = v8 - v21;
    if (v8 - v21 <= -3)
      goto LABEL_67;
    v23 = v22 >> 1;
    v24 = v20 - (_QWORD)v21;
    if (v24 <= (v22 >> 1) + 1)
      v25 = v23 + 1;
    else
      v25 = v24;
    if (v24 >= 0x7FFFFFFFFFFFFFFELL)
      v26 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v26 = v25;
    if (v26)
    {
      if (v26 < 0)
        goto LABEL_68;
      v27 = operator new(2 * v26);
      v16 = &v27[2 * v23];
      v17 = &v27[2 * v26];
      *v16 = v6;
      v18 = (uint64_t)(v16 + 1);
      v28 = (char *)(v8 - v21);
      if (v8 == v21)
        goto LABEL_64;
    }
    else
    {
      v27 = 0;
      v16 = (_WORD *)(2 * v23);
      v17 = 0;
      *(_WORD *)(2 * v23) = v6;
      v18 = 2 * v23 + 2;
      v28 = (char *)(v8 - v21);
      if (v8 == v21)
        goto LABEL_64;
    }
    v46 = (unint64_t)(v28 - 2);
    if (v46 < 0x1E)
      goto LABEL_72;
    if (v8 - v27 - (v22 & 0xFFFFFFFFFFFFFFFELL) < 0x20)
      goto LABEL_72;
    v47 = (v46 >> 1) + 1;
    v48 = 2 * (v47 & 0xFFFFFFFFFFFFFFF0);
    v49 = &v8[-v48];
    v16 = (_WORD *)((char *)v16 - v48);
    v50 = &v27[2 * v23 - 16];
    v51 = v8 - 16;
    v52 = v47 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      v53 = *(_OWORD *)v51;
      *(v50 - 1) = *((_OWORD *)v51 - 1);
      *v50 = v53;
      v50 -= 2;
      v51 -= 32;
      v52 -= 16;
    }
    while (v52);
    v8 = v49;
    if (v47 != (v47 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_72:
      do
      {
        v54 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--v16 = v54;
      }
      while (v8 != v21);
    }
    goto LABEL_63;
  }
  if ((unint64_t)v8 < v20)
    goto LABEL_28;
  v38 = *(char **)(a1 + 112);
  v39 = v8 - v38;
  if (v8 - v38 <= -3)
    goto LABEL_67;
  v40 = v39 >> 1;
  v41 = v20 - (_QWORD)v38;
  if (v41 <= (v39 >> 1) + 1)
    v42 = v40 + 1;
  else
    v42 = v41;
  if (v41 >= 0x7FFFFFFFFFFFFFFELL)
    v43 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v43 = v42;
  if (!v43)
  {
    v44 = 0;
    v16 = (_WORD *)(2 * v40);
    v17 = 0;
    *(_WORD *)(2 * v40) = v6;
    v18 = 2 * v40 + 2;
    v45 = (char *)(v8 - v38);
    if (v8 == v38)
      goto LABEL_64;
    goto LABEL_57;
  }
  if (v43 < 0)
    goto LABEL_68;
  v44 = operator new(2 * v43);
  v16 = &v44[2 * v40];
  v17 = &v44[2 * v43];
  *v16 = v6;
  v18 = (uint64_t)(v16 + 1);
  v45 = (char *)(v8 - v38);
  if (v8 != v38)
  {
LABEL_57:
    v55 = (unint64_t)(v45 - 2);
    if (v55 < 0x1E)
      goto LABEL_73;
    if (v8 - v44 - (v39 & 0xFFFFFFFFFFFFFFFELL) < 0x20)
      goto LABEL_73;
    v56 = (v55 >> 1) + 1;
    v57 = 2 * (v56 & 0xFFFFFFFFFFFFFFF0);
    v58 = &v8[-v57];
    v16 = (_WORD *)((char *)v16 - v57);
    v59 = &v44[2 * v40 - 16];
    v60 = v8 - 16;
    v61 = v56 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      v62 = *(_OWORD *)v60;
      *(v59 - 1) = *((_OWORD *)v60 - 1);
      *v59 = v62;
      v59 -= 2;
      v60 -= 32;
      v61 -= 16;
    }
    while (v61);
    v8 = v58;
    if (v56 != (v56 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_73:
      do
      {
        v63 = *((_WORD *)v8 - 1);
        v8 -= 2;
        *--v16 = v63;
      }
      while (v8 != v38);
    }
    goto LABEL_63;
  }
LABEL_64:
  *(_QWORD *)(a1 + 112) = v16;
  *(_QWORD *)(a1 + 120) = v18;
  *(_QWORD *)(a1 + 128) = v17;
  if (v8)
    operator delete(v8);
LABEL_66:
  *(_QWORD *)(a1 + 120) = v18;
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BEA2E4](exception, 1);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_21247CEE8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::regex_traits<char>::__lookup_collatename<char const*>(uint64_t a1, uint64_t a2, _BYTE *__src, _BYTE *a4)
{
  size_t v4;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  _BYTE *v18;
  size_t v19;
  std::string v20;
  _BYTE __dst[24];

  v4 = a4 - __src;
  memset(__dst, 170, sizeof(__dst));
  if ((unint64_t)(a4 - __src) >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v4 <= 0x16)
  {
    __dst[23] = (_BYTE)a4 - (_BYTE)__src;
    v9 = __dst;
    if (__src == a4)
      goto LABEL_9;
LABEL_8:
    memcpy(v9, __src, v4);
    v9 += v4;
    goto LABEL_9;
  }
  v10 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17)
    v10 = v4 | 7;
  v11 = v10 + 1;
  v9 = operator new(v10 + 1);
  *(_QWORD *)&__dst[8] = v4;
  *(_QWORD *)&__dst[16] = v11 | 0x8000000000000000;
  *(_QWORD *)__dst = v9;
  if (__src != a4)
    goto LABEL_8;
LABEL_9:
  *v9 = 0;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  if ((__dst[23] & 0x80000000) != 0)
  {
    v12 = *(char **)__dst;
    if (!*(_QWORD *)&__dst[8])
      goto LABEL_18;
  }
  else
  {
    if (!__dst[23])
      return;
    v12 = __dst;
  }
  std::__get_collation_name(&v20, v12);
  *(_OWORD *)a1 = *(_OWORD *)&v20.__r_.__value_.__l.__data_;
  v13 = v20.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a1 + 16) = *((_QWORD *)&v20.__r_.__value_.__l + 2);
  v14 = HIBYTE(v13);
  if ((v14 & 0x80u) != 0)
    v14 = *(_QWORD *)(a1 + 8);
  if (v14)
    goto LABEL_16;
  if ((__dst[23] & 0x80000000) != 0)
  {
    v15 = *(_QWORD *)&__dst[8];
    v12 = *(char **)__dst;
    if (*(_QWORD *)&__dst[8] < 3uLL)
      goto LABEL_24;
LABEL_18:
    operator delete(v12);
    return;
  }
  v15 = __dst[23];
  if (__dst[23] < 3u)
  {
    v12 = __dst;
LABEL_24:
    (*(void (**)(std::string *__return_ptr, _QWORD, char *, char *))(**(_QWORD **)(a2 + 16) + 32))(&v20, *(_QWORD *)(a2 + 16), v12, &v12[v15]);
    if (*(char *)(a1 + 23) < 0)
      operator delete(*(void **)a1);
    *(std::string *)a1 = v20;
    if (*(char *)(a1 + 23) < 0)
    {
      v17 = *(_QWORD *)(a1 + 8);
      if (v17 == 1 || v17 == 12)
      {
        if (__dst != (_BYTE *)a1)
        {
          if (__dst[23] >= 0)
            v18 = __dst;
          else
            v18 = *(_BYTE **)__dst;
          if (__dst[23] >= 0)
            v19 = __dst[23];
          else
            v19 = *(_QWORD *)&__dst[8];
          std::string::__assign_no_alias<false>((void **)a1, v18, v19);
        }
      }
      else
      {
        **(_BYTE **)a1 = 0;
        *(_QWORD *)(a1 + 8) = 0;
      }
    }
    else
    {
      v16 = *(unsigned __int8 *)(a1 + 23);
      if (v16 == 1 || v16 == 12)
      {
        if (__dst != (_BYTE *)a1)
        {
          if ((__dst[23] & 0x80000000) != 0)
          {
            std::string::__assign_no_alias<true>((_QWORD *)a1, *(void **)__dst, *(size_t *)&__dst[8]);
          }
          else
          {
            *(_OWORD *)a1 = *(_OWORD *)__dst;
            *(_QWORD *)(a1 + 16) = *(_QWORD *)&__dst[16];
          }
        }
      }
      else
      {
        *(_BYTE *)a1 = 0;
        *(_BYTE *)(a1 + 23) = 0;
      }
    }
LABEL_16:
    if ((__dst[23] & 0x80000000) == 0)
      return;
    v12 = *(char **)__dst;
    goto LABEL_18;
  }
}

void sub_21247D154(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(_BYTE **a1, uint64_t a2, uint64_t a3, char *a4)
{
  unint64_t v4;
  _OWORD *v9;
  _BYTE *v10;
  char *v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char *v19;
  void **v20;
  _BYTE *v21;
  int v22;
  _BYTE *v23;
  void *__p[3];

  v4 = (unint64_t)&a4[-a3];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a4[-a3] >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v4 > 0x16)
  {
    v16 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v16 = v4 | 7;
    v17 = v16 + 1;
    v9 = operator new(v16 + 1);
    __p[1] = (void *)v4;
    __p[2] = (void *)(v17 | 0x8000000000000000);
    __p[0] = v9;
    if ((char *)a3 != a4)
      goto LABEL_4;
LABEL_13:
    v10 = v9;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a4 - a3;
  v9 = __p;
  if ((char *)a3 == a4)
    goto LABEL_13;
LABEL_4:
  if (v4 < 0x20 || (unint64_t)v9 - a3 < 0x20)
  {
    v10 = v9;
    v11 = (char *)a3;
  }
  else
  {
    v10 = (char *)v9 + (v4 & 0xFFFFFFFFFFFFFFE0);
    v11 = (char *)(a3 + (v4 & 0xFFFFFFFFFFFFFFE0));
    v12 = (__int128 *)(a3 + 16);
    v13 = v9 + 1;
    v14 = v4 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 32;
    }
    while (v14);
    if (v4 == (v4 & 0xFFFFFFFFFFFFFFE0))
      goto LABEL_16;
  }
  do
  {
    v18 = *v11++;
    *v10++ = v18;
  }
  while (v11 != a4);
LABEL_16:
  *v10 = 0;
  memset(a1, 170, 24);
  v19 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0)
    v20 = __p;
  else
    v20 = (void **)__p[0];
  if (SHIBYTE(__p[2]) < 0)
    v19 = (char *)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v20, &v19[(_QWORD)v20]);
  v21 = (_BYTE *)*((unsigned __int8 *)a1 + 23);
  v22 = (char)v21;
  if ((char)v21 < 0)
    v21 = a1[1];
  if (v21 == (_BYTE *)1)
    goto LABEL_32;
  if (v21 != (_BYTE *)12)
  {
    if (v22 < 0)
    {
      **a1 = 0;
      a1[1] = 0;
      if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
        return;
LABEL_35:
      operator delete(__p[0]);
      return;
    }
    *(_BYTE *)a1 = 0;
    *((_BYTE *)a1 + 23) = 0;
LABEL_32:
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
      return;
    goto LABEL_35;
  }
  if (v22 >= 0)
    v23 = a1;
  else
    v23 = *a1;
  v23[11] = v23[3];
  if (SHIBYTE(__p[2]) < 0)
    goto LABEL_35;
}

void sub_21247D388(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BEA2E4](exception, 2);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_21247D3DC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](uint64_t a1)
{
  char v2;
  char v3;
  unint64_t v4;
  _BYTE *v5;
  unint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  size_t v12;
  _BYTE *v13;
  _BYTE *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  size_t v18;
  _BYTE *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  _BYTE *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  size_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  __int128 *v34;
  _OWORD *v35;
  unint64_t v36;
  __int128 v37;
  char *v38;
  _QWORD *v39;
  unint64_t v40;
  uint64_t v41;
  __int128 *v42;
  _OWORD *v43;
  unint64_t v44;
  __int128 v45;
  char *v46;
  _QWORD *v47;
  unint64_t v48;
  uint64_t v49;
  __int128 *v50;
  _OWORD *v51;
  unint64_t v52;
  __int128 v53;
  char *v54;
  _QWORD *v55;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  char v59;
  char *v60;
  char v61;
  char *v62;
  char v63;

  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), 95);
    v3 = v2;
    v5 = *(_BYTE **)(a1 + 72);
    v4 = *(_QWORD *)(a1 + 80);
    if ((unint64_t)v5 < v4)
    {
      *v5 = v2;
      *(_QWORD *)(a1 + 72) = v5 + 1;
      return;
    }
    v14 = *(_BYTE **)(a1 + 64);
    v15 = v5 - v14;
    v16 = v5 - v14 + 1;
    if (v16 >= 0)
    {
      v17 = v4 - (_QWORD)v14;
      if (2 * v17 > v16)
        v16 = 2 * v17;
      if (v17 >= 0x3FFFFFFFFFFFFFFFLL)
        v18 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v18 = v16;
      if (v18)
      {
        v19 = operator new(v18);
        v20 = &v19[v15];
        v21 = &v19[v18];
        v19[v15] = v3;
        v22 = (uint64_t)&v19[v15 + 1];
        if (v5 != v14)
        {
LABEL_22:
          if (v15 < 8 || (unint64_t)(v14 - v19) < 0x20)
            goto LABEL_78;
          if (v15 >= 0x20)
          {
            v23 = v15 & 0xFFFFFFFFFFFFFFE0;
            v34 = (__int128 *)(v5 - 16);
            v35 = &v19[v5 - 16 - v14];
            v36 = v15 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              v37 = *v34;
              *(v35 - 1) = *(v34 - 1);
              *v35 = v37;
              v35 -= 2;
              v34 -= 2;
              v36 -= 32;
            }
            while (v36);
            if (v15 == v23)
            {
LABEL_80:
              v5 = *(_BYTE **)(a1 + 64);
              *(_QWORD *)(a1 + 64) = v19;
              *(_QWORD *)(a1 + 72) = v22;
              *(_QWORD *)(a1 + 80) = v21;
              if (!v5)
              {
LABEL_82:
                *(_QWORD *)(a1 + 72) = v22;
                return;
              }
LABEL_81:
              operator delete(v5);
              goto LABEL_82;
            }
            if ((v15 & 0x18) == 0)
            {
              v20 -= v23;
              v5 -= v23;
              goto LABEL_78;
            }
          }
          else
          {
            v23 = 0;
          }
          v20 -= v15 & 0xFFFFFFFFFFFFFFF8;
          v38 = &v5[-v23 - 8];
          v39 = &v19[v38 - v14];
          v40 = v23 - (v15 & 0xFFFFFFFFFFFFFFF8);
          do
          {
            v41 = *(_QWORD *)v38;
            v38 -= 8;
            *v39-- = v41;
            v40 += 8;
          }
          while (v40);
          v5 -= v15 & 0xFFFFFFFFFFFFFFF8;
          if (v15 == (v15 & 0xFFFFFFFFFFFFFFF8))
            goto LABEL_80;
LABEL_78:
          v58 = v20 - 1;
          do
          {
            v59 = *--v5;
            *v58-- = v59;
          }
          while (v5 != v14);
          goto LABEL_80;
        }
      }
      else
      {
        v19 = 0;
        v20 = (char *)(v5 - v14);
        v21 = 0;
        *(_BYTE *)v15 = v3;
        v22 = v15 + 1;
        if (v5 != v14)
          goto LABEL_22;
      }
      *(_QWORD *)(a1 + 64) = v20;
      *(_QWORD *)(a1 + 72) = v22;
      *(_QWORD *)(a1 + 80) = v21;
      if (!v5)
        goto LABEL_82;
      goto LABEL_81;
    }
LABEL_92:
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  v7 = *(_BYTE **)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v7 < v6)
      goto LABEL_27;
    v24 = *(_BYTE **)(a1 + 64);
    v25 = v7 - v24;
    v26 = v7 - v24 + 1;
    if (v26 < 0)
      goto LABEL_92;
    v27 = v6 - (_QWORD)v24;
    if (2 * v27 > v26)
      v26 = 2 * v27;
    if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
      v28 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v28 = v26;
    if (v28)
      v13 = operator new(v28);
    else
      v13 = 0;
    v29 = &v13[v25];
    v30 = &v13[v28];
    v13[v25] = 95;
    v31 = (uint64_t)&v13[v25 + 1];
    if (v7 == v24)
      goto LABEL_51;
    if (v25 >= 8 && (unint64_t)(v24 - v13) >= 0x20)
    {
      if (v25 >= 0x20)
      {
        v33 = v25 & 0xFFFFFFFFFFFFFFE0;
        v50 = (__int128 *)(v7 - 16);
        v51 = &v13[v7 - 16 - v24];
        v52 = v25 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v53 = *v50;
          *(v51 - 1) = *(v50 - 1);
          *v51 = v53;
          v51 -= 2;
          v50 -= 2;
          v52 -= 32;
        }
        while (v52);
        if (v25 == v33)
          goto LABEL_90;
        if ((v25 & 0x18) == 0)
        {
          v29 -= v33;
          v7 -= v33;
          goto LABEL_88;
        }
      }
      else
      {
        v33 = 0;
      }
      v29 -= v25 & 0xFFFFFFFFFFFFFFF8;
      v54 = &v7[-v33 - 8];
      v55 = &v13[v54 - v24];
      v56 = v33 - (v25 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v57 = *(_QWORD *)v54;
        v54 -= 8;
        *v55-- = v57;
        v56 += 8;
      }
      while (v56);
      v7 -= v25 & 0xFFFFFFFFFFFFFFF8;
      if (v25 == (v25 & 0xFFFFFFFFFFFFFFF8))
        goto LABEL_90;
    }
LABEL_88:
    v62 = v29 - 1;
    do
    {
      v63 = *--v7;
      *v62-- = v63;
    }
    while (v7 != v24);
    goto LABEL_90;
  }
  if ((unint64_t)v7 < v6)
  {
LABEL_27:
    *v7 = 95;
    *(_QWORD *)(a1 + 72) = v7 + 1;
    return;
  }
  v8 = *(_BYTE **)(a1 + 64);
  v9 = v7 - v8;
  v10 = v7 - v8 + 1;
  if (v10 < 0)
    goto LABEL_92;
  v11 = v6 - (_QWORD)v8;
  if (2 * v11 > v10)
    v10 = 2 * v11;
  if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
    v12 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v12 = v10;
  if (v12)
    v13 = operator new(v12);
  else
    v13 = 0;
  v29 = &v13[v9];
  v30 = &v13[v12];
  v13[v9] = 95;
  v31 = (uint64_t)&v13[v9 + 1];
  if (v7 != v8)
  {
    if (v9 < 8 || (unint64_t)(v8 - v13) < 0x20)
      goto LABEL_84;
    if (v9 < 0x20)
    {
      v32 = 0;
      goto LABEL_65;
    }
    v32 = v9 & 0xFFFFFFFFFFFFFFE0;
    v42 = (__int128 *)(v7 - 16);
    v43 = &v13[v7 - 16 - v8];
    v44 = v9 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v45 = *v42;
      *(v43 - 1) = *(v42 - 1);
      *v43 = v45;
      v43 -= 2;
      v42 -= 2;
      v44 -= 32;
    }
    while (v44);
    if (v9 != v32)
    {
      if ((v9 & 0x18) == 0)
      {
        v29 -= v32;
        v7 -= v32;
        goto LABEL_84;
      }
LABEL_65:
      v29 -= v9 & 0xFFFFFFFFFFFFFFF8;
      v46 = &v7[-v32 - 8];
      v47 = &v13[v46 - v8];
      v48 = v32 - (v9 & 0xFFFFFFFFFFFFFFF8);
      do
      {
        v49 = *(_QWORD *)v46;
        v46 -= 8;
        *v47-- = v49;
        v48 += 8;
      }
      while (v48);
      v7 -= v9 & 0xFFFFFFFFFFFFFFF8;
      if (v9 == (v9 & 0xFFFFFFFFFFFFFFF8))
        goto LABEL_90;
LABEL_84:
      v60 = v29 - 1;
      do
      {
        v61 = *--v7;
        *v60-- = v61;
      }
      while (v7 != v8);
    }
LABEL_90:
    v7 = *(_BYTE **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v13;
    *(_QWORD *)(a1 + 72) = v31;
    *(_QWORD *)(a1 + 80) = v30;
    if (v7)
      goto LABEL_91;
LABEL_52:
    *(_QWORD *)(a1 + 72) = v31;
    return;
  }
LABEL_51:
  *(_QWORD *)(a1 + 64) = v29;
  *(_QWORD *)(a1 + 72) = v31;
  *(_QWORD *)(a1 + 80) = v30;
  if (!v7)
    goto LABEL_52;
LABEL_91:
  operator delete(v7);
  *(_QWORD *)(a1 + 72) = v31;
}

void std::regex_traits<char>::transform<std::__wrap_iter<char *>>(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  unint64_t v4;
  _OWORD *v8;
  _BYTE *v9;
  char *v10;
  __int128 *v11;
  _OWORD *v12;
  unint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char *v18;
  void **v19;
  void *__p[3];

  v4 = (unint64_t)&a4[-a3];
  memset(__p, 170, sizeof(__p));
  if ((unint64_t)&a4[-a3] >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v4 > 0x16)
  {
    v15 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v15 = v4 | 7;
    v16 = v15 + 1;
    v8 = operator new(v15 + 1);
    __p[1] = (void *)v4;
    __p[2] = (void *)(v16 | 0x8000000000000000);
    __p[0] = v8;
    if ((char *)a3 != a4)
      goto LABEL_4;
LABEL_13:
    v9 = v8;
    goto LABEL_16;
  }
  HIBYTE(__p[2]) = (_BYTE)a4 - a3;
  v8 = __p;
  if ((char *)a3 == a4)
    goto LABEL_13;
LABEL_4:
  if (v4 < 0x20 || (unint64_t)v8 - a3 < 0x20)
  {
    v9 = v8;
    v10 = (char *)a3;
  }
  else
  {
    v9 = (char *)v8 + (v4 & 0xFFFFFFFFFFFFFFE0);
    v10 = (char *)(a3 + (v4 & 0xFFFFFFFFFFFFFFE0));
    v11 = (__int128 *)(a3 + 16);
    v12 = v8 + 1;
    v13 = v4 & 0xFFFFFFFFFFFFFFE0;
    do
    {
      v14 = *v11;
      *(v12 - 1) = *(v11 - 1);
      *v12 = v14;
      v11 += 2;
      v12 += 2;
      v13 -= 32;
    }
    while (v13);
    if (v4 == (v4 & 0xFFFFFFFFFFFFFFE0))
      goto LABEL_16;
  }
  do
  {
    v17 = *v10++;
    *v9++ = v17;
  }
  while (v10 != a4);
LABEL_16:
  *v9 = 0;
  v18 = (char *)HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0)
    v19 = __p;
  else
    v19 = (void **)__p[0];
  if (SHIBYTE(__p[2]) < 0)
    v18 = (char *)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a2 + 16) + 32))(*(_QWORD *)(a2 + 16), v19, &v18[(_QWORD)v19]);
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
}

void sub_21247DA28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)9>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BEA2E4](exception, 9);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_21247DA7C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *std::vector<std::pair<std::string,std::string>>::__push_back_slow_path<std::pair<std::string,std::string>>(void **a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  __int128 v10;
  char *v11;
  void **v12;
  void **v13;
  __int128 v14;
  __int128 v15;
  void **v16;

  v2 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 4);
  v3 = v2 + 1;
  if (v2 + 1 > 0x555555555555555)
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 4) > v3)
    v3 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 4);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 4) >= 0x2AAAAAAAAAAAAAALL)
    v6 = 0x555555555555555;
  else
    v6 = v3;
  if (v6)
  {
    if (v6 > 0x555555555555555)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v7 = (char *)operator new(48 * v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[48 * v2];
  *((_QWORD *)v8 + 2) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)v8 = *(_OWORD *)a2;
  v9 = &v7[48 * v6];
  v10 = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_OWORD *)(v8 + 24) = v10;
  *((_QWORD *)v8 + 5) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  v11 = v8 + 48;
  v12 = (void **)*a1;
  v13 = (void **)a1[1];
  if (v13 != *a1)
  {
    do
    {
      v14 = *((_OWORD *)v13 - 3);
      *((_QWORD *)v8 - 4) = *(v13 - 4);
      *((_OWORD *)v8 - 3) = v14;
      *(v13 - 5) = 0;
      *(v13 - 4) = 0;
      *(v13 - 6) = 0;
      v15 = *(_OWORD *)(v13 - 3);
      *((_QWORD *)v8 - 1) = *(v13 - 1);
      *(_OWORD *)(v8 - 24) = v15;
      v8 -= 48;
      *(v13 - 2) = 0;
      *(v13 - 1) = 0;
      *(v13 - 3) = 0;
      v13 -= 6;
    }
    while (v13 != v12);
    v13 = (void **)*a1;
    v16 = (void **)a1[1];
    *a1 = v8;
    a1[1] = v11;
    a1[2] = v9;
    while (1)
    {
      if (v16 == v13)
        goto LABEL_22;
      if (*((char *)v16 - 1) < 0)
      {
        operator delete(*(v16 - 3));
        if ((*((char *)v16 - 25) & 0x80000000) == 0)
          goto LABEL_14;
      }
      else if ((*((char *)v16 - 25) & 0x80000000) == 0)
      {
        goto LABEL_14;
      }
      operator delete(*(v16 - 6));
LABEL_14:
      v16 -= 6;
    }
  }
  *a1 = v8;
  a1[1] = v11;
  a1[2] = v9;
LABEL_22:
  if (v13)
    operator delete(v13);
  return v11;
}

void (__cdecl ***std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__begin_marked_subexpression<char>::~__begin_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
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

void std::__end_marked_subexpression<char>::~__end_marked_subexpression(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
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

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BEA2E4](exception, 8);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_21247DDC8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x212BEA2E4](exception, 7);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_21247DE14(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::__loop<char>::~__loop(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24CDC11B0;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__loop<char>::~__loop(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *__p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24CDC11B0;
  v2 = __p[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = __p[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  operator delete(__p);
}

uint64_t std::__loop<char>::__exec_split(uint64_t result, int a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _BYTE *v14;

  *(_DWORD *)a3 = -994;
  if (*(unsigned __int8 *)(result + 52) == a2)
  {
    *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + 16);
    return result;
  }
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + 8);
  v3 = *(_DWORD *)(result + 44);
  *(_QWORD *)(*(_QWORD *)(a3 + 56) + 16 * *(unsigned int *)(result + 40) + 8) = *(_QWORD *)(a3 + 16);
  v4 = *(_DWORD *)(result + 48);
  if (v3 != v4)
  {
    v5 = (v4 - 1);
    v6 = (v3 - 1);
    v7 = *(_QWORD *)(a3 + 24);
    v8 = *(_QWORD *)(a3 + 32);
    v9 = v5 - v6;
    if ((unint64_t)(v5 - v6) < 2)
    {
      v10 = v6;
LABEL_9:
      v13 = v5 - v10;
      v14 = (_BYTE *)(v8 + 24 * v10 + 16);
      do
      {
        *((_QWORD *)v14 - 2) = v7;
        *((_QWORD *)v14 - 1) = v7;
        *v14 = 0;
        v14 += 24;
        --v13;
      }
      while (v13);
      return result;
    }
    v10 = (v9 & 0xFFFFFFFFFFFFFFFELL) + v6;
    v11 = v8 + 24 * v6 + 24;
    v12 = v9 & 0xFFFFFFFFFFFFFFFELL;
    do
    {
      *(_QWORD *)(v11 - 24) = v7;
      *(_QWORD *)(v11 - 16) = v7;
      *(_QWORD *)v11 = v7;
      *(_QWORD *)(v11 + 8) = v7;
      *(_BYTE *)(v11 - 8) = 0;
      *(_BYTE *)(v11 + 16) = 0;
      v11 += 48;
      v12 -= 2;
    }
    while (v12);
    if (v9 != (v9 & 0xFFFFFFFFFFFFFFFELL))
      goto LABEL_9;
  }
  return result;
}

void (__cdecl ***std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24CDC11B0;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
}

void std::__owns_two_states<char>::~__owns_two_states(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *__p = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24CDC11B0;
  v2 = __p[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = __p[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  operator delete(__p);
}

void (__cdecl ***std::__alternate<char>::~__alternate(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);
  void (__cdecl **v3)(std::__owns_one_state<char> *__hidden);

  *a1 = (void (__cdecl **)(std::__owns_one_state<char> *__hidden))&off_24CDC11B0;
  v2 = a1[2];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  v3 = a1[1];
  if (v3)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v3 + 1))(v3);
  return a1;
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
  MEMORY[0x212BEA2E4](exception, 15);
  __cxa_throw(exception, MEMORY[0x24BEDB6D0], MEMORY[0x24BEDABD0]);
}

void sub_21247E124(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  int v6;
  std::basic_regex<char>::value_type *v7;
  std::basic_regex<char>::value_type *v8;
  int v9;
  std::basic_regex<char> *v10;
  _QWORD *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  std::basic_regex<char> *v21;
  std::__owns_one_state<char> *v22;
  int v23;
  std::basic_regex<char> *v24;
  uint64_t v25;

  if (a2 != a3)
  {
    v7 = a2 + 1;
    v6 = *a2;
    if (a2 + 1 != a3 || v6 != 36)
    {
      if ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v6);
        return (unsigned __int8 *)(a2 + 1);
      }
      if (v7 == a3 || v6 != 92)
      {
        if (v6 == 46)
        {
          v17 = operator new(0x10uLL);
          v18 = *(_QWORD *)(a1 + 56);
          v19 = *(_QWORD *)(v18 + 8);
          *v17 = &off_24CDC12B8;
          v17[1] = v19;
LABEL_39:
          *(_QWORD *)(v18 + 8) = v17;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          return (unsigned __int8 *)v7;
        }
      }
      else
      {
        v16 = *v7;
        if ((v16 - 36) <= 0x3A && ((1 << (v16 - 36)) & 0x580000000000441) != 0)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v16);
          return (unsigned __int8 *)(a2 + 2);
        }
      }
    }
  }
  v8 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>(a1, a2, a3);
  v7 = v8;
  if (v8 != a2 || v8 == a3)
    return (unsigned __int8 *)v7;
  if (a2 + 1 == a3 || *a2 != 92)
    return (unsigned __int8 *)a2;
  v9 = a2[1];
  if (v9 != 40)
  {
    if (((v9 & 0xF8) == 0x30 || (v9 & 0xFE) == 0x38) && (v9 - 49) <= 8)
    {
      if ((v9 - 48) > *(_DWORD *)(a1 + 28))
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
      std::basic_regex<char,std::regex_traits<char>>::__push_back_ref((std::basic_regex<char> *)a1, v9 - 48);
      return (unsigned __int8 *)(a2 + 2);
    }
    return (unsigned __int8 *)a2;
  }
  v10 = (std::basic_regex<char> *)(a2 + 2);
  if ((*(_BYTE *)(a1 + 24) & 2) != 0)
  {
    v12 = *(_DWORD *)(a1 + 28);
  }
  else
  {
    v11 = operator new(0x18uLL);
    v12 = *(_DWORD *)(a1 + 28) + 1;
    *(_DWORD *)(a1 + 28) = v12;
    v13 = *(_QWORD *)(a1 + 56);
    v14 = *(_QWORD *)(v13 + 8);
    *v11 = &off_24CDC10C0;
    v11[1] = v14;
    *((_DWORD *)v11 + 4) = v12;
    *(_QWORD *)(v13 + 8) = v11;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  do
  {
    if (v10 == (std::basic_regex<char> *)a3)
      goto LABEL_41;
    v21 = v10;
    v22 = *(std::__owns_one_state<char> **)(a1 + 56);
    v23 = *(_DWORD *)(a1 + 28);
    v24 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<char const*>(a1, v21, a3);
    if (v24 == v21)
      break;
    v10 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>((std::basic_regex<char> *)a1, v24, (std::basic_regex<char> *)a3, v22, (v23 + 1), (*(_DWORD *)(a1 + 28) + 1));
  }
  while (v10 != v21);
  if ((char *)&v21->__traits_.__loc_.__locale_ + 1 == a3
    || LOBYTE(v21->__traits_.__loc_.__locale_) != 92
    || BYTE1(v21->__traits_.__loc_.__locale_) != 41)
  {
LABEL_41:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
  }
  v7 = (char *)v21 + 2 * (BYTE1(v21->__traits_.__loc_.__locale_) == 41);
  if ((*(_BYTE *)(a1 + 24) & 2) == 0)
  {
    v17 = operator new(0x18uLL);
    v18 = *(_QWORD *)(a1 + 56);
    v25 = *(_QWORD *)(v18 + 8);
    *v17 = &off_24CDC1108;
    v17[1] = v25;
    *((_DWORD *)v17 + 4) = v12;
    goto LABEL_39;
  }
  return (unsigned __int8 *)v7;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<char const*>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  std::basic_regex<char> *v6;
  int locale_low;
  std::basic_regex<char> *v9;
  int v10;
  int v11;
  std::basic_regex<char> *v12;
  int v13;
  std::basic_regex<char> *v14;
  int v15;
  int v16;
  int v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;

  v6 = this;
  if (this == a3)
    return v6;
  locale_low = LOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low == 42)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, 0, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
    return (std::basic_regex<char> *)((char *)v6 + 1);
  }
  if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3
    || locale_low != 92
    || BYTE1(this->__traits_.__loc_.__locale_) != 123)
  {
    return v6;
  }
  v9 = (std::basic_regex<char> *)((char *)this + 2 * (BYTE1(this->__traits_.__loc_.__locale_) == 123));
  if (v9 == a3)
    goto LABEL_43;
  v10 = LOBYTE(v9->__traits_.__loc_.__locale_);
  if ((v10 & 0xF8) != 0x30 && (v10 & 0xFE) != 0x38)
    goto LABEL_43;
  v11 = v10 - 48;
  v12 = (std::basic_regex<char> *)((char *)&v9->__traits_.__loc_.__locale_ + 1);
  if ((std::basic_regex<char> *)((char *)&v9->__traits_.__loc_.__locale_ + 1) == a3)
  {
LABEL_16:
    v12 = a3;
  }
  else
  {
    while (1)
    {
      v13 = LOBYTE(v12->__traits_.__loc_.__locale_);
      if ((v13 & 0xF8) != 0x30 && (v13 & 0xFE) != 0x38)
        break;
      if (v11 >= 214748364)
        goto LABEL_43;
      v11 = v13 + 10 * v11 - 48;
      v12 = (std::basic_regex<char> *)((char *)v12 + 1);
      if (v12 == a3)
        goto LABEL_16;
    }
  }
  if (v12 == v9)
    goto LABEL_43;
  if (v12 == a3)
    goto LABEL_41;
  v14 = (std::basic_regex<char> *)((char *)&v12->__traits_.__loc_.__locale_ + 1);
  v15 = LOBYTE(v12->__traits_.__loc_.__locale_);
  if (v15 != 44)
  {
    if (v14 != a3 && v15 == 92 && LOBYTE(v14->__traits_.__loc_.__locale_) == 125)
    {
      v19 = (unsigned __int8 *)&v12->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v11, v11, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v19;
    }
    goto LABEL_41;
  }
  if (v14 == a3)
    goto LABEL_41;
  v16 = LOBYTE(v14->__traits_.__loc_.__locale_);
  if ((v16 & 0xF8) == 0x30 || (v16 & 0xFE) == 0x38)
  {
    v14 = (std::basic_regex<char> *)((char *)&v12->__traits_.__loc_.__locale_ + 2);
    if ((std::basic_regex<char> *)((char *)&v12->__traits_.__loc_.__locale_ + 2) == a3)
      goto LABEL_41;
    v17 = v16 - 48;
    while (1)
    {
      v16 = LOBYTE(v14->__traits_.__loc_.__locale_);
      if ((v16 & 0xF8) != 0x30 && (v16 & 0xFE) != 0x38)
        break;
      if (v17 >= 214748364)
        goto LABEL_43;
      v17 = v16 + 10 * v17 - 48;
      v14 = (std::basic_regex<char> *)((char *)v14 + 1);
      if (v14 == a3)
        goto LABEL_41;
    }
  }
  else
  {
    v17 = -1;
  }
  if (v14 == a3
    || (std::basic_regex<char> *)((char *)&v14->__traits_.__loc_.__locale_ + 1) == a3
    || v16 != 92
    || BYTE1(v14->__traits_.__loc_.__locale_) != 125)
  {
LABEL_41:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
  }
  v18 = (unsigned __int8 *)v14 + 2 * (BYTE1(v14->__traits_.__loc_.__locale_) == 125);
  if (v17 != -1)
  {
    if (v17 >= v11)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v11, v17, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v18;
    }
LABEL_43:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v11, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
  return (std::basic_regex<char> *)v18;
}

void (__cdecl ***std::__match_any<char>::~__match_any(void (__cdecl ***a1)(std::__owns_one_state<char> *__hidden this)))(std::__owns_one_state<char> *__hidden this)
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = a1[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  return a1;
}

void std::__match_any<char>::~__match_any(void (__cdecl ***__p)(std::__owns_one_state<char> *__hidden this))
{
  void (__cdecl **v2)(std::__owns_one_state<char> *__hidden);

  v2 = __p[1];
  if (v2)
    (*((void (**)(void (__cdecl **)(std::__owns_one_state<char> *__hidden)))*v2 + 1))(v2);
  operator delete(__p);
}

uint64_t std::__match_any<char>::__exec(uint64_t result, uint64_t a2)
{
  _BYTE *v2;

  v2 = *(_BYTE **)(a2 + 16);
  if (v2 == *(_BYTE **)(a2 + 24) || !*v2)
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  }
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

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<char const*>(std::basic_regex<char> *this, std::basic_regex<char>::value_type *a2, std::basic_regex<char> *a3)
{
  std::__owns_one_state<char> *end;
  unsigned int marked_count;
  int v8;
  std::basic_regex<char>::value_type *v9;
  std::basic_regex<char>::value_type v10;
  std::basic_regex<char> *v11;
  _BOOL4 v12;
  uint64_t v13;
  std::__node<char> *v14;
  std::__owns_one_state<char> *v15;
  std::__node<char> *first;
  int v17;
  std::__node<char> *v18;
  BOOL v19;
  std::__owns_one_state<char> *v20;
  std::__node<char> *v21;
  uint64_t (**v22)();
  std::__node<char> *v23;
  unsigned int v24;
  std::__owns_one_state<char> *v25;
  std::__node<char> *v26;
  std::basic_regex<char> *v27;
  std::basic_regex<char> *v28;
  std::__node<char> *v29;
  std::__owns_one_state<char> *v30;
  std::__node<char> *v31;

  end = this->__end_;
  marked_count = this->__marked_count_;
  if (a2 != (std::basic_regex<char>::value_type *)a3)
  {
    v8 = *a2;
    switch(*a2)
    {
      case '$':
      case '(':
      case '*':
      case '+':
      case '.':
      case '?':
      case '[':
      case '\\':
      case '^':
      case '{':
      case '|':
        goto LABEL_3;
      case ')':
        if (!this->__open_count_)
          goto LABEL_8;
LABEL_3:
        v9 = a2 + 1;
        if (a2 + 1 != (std::basic_regex<char>::value_type *)a3 && v8 == 92)
        {
          v10 = *v9;
          switch(*v9)
          {
            case '$':
            case '(':
            case ')':
            case '*':
            case '+':
            case '.':
            case '?':
            case '[':
            case '\\':
            case '^':
            case '{':
            case '|':
            case '}':
              std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v10);
              v11 = (std::basic_regex<char> *)(a2 + 2);
              return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)this, v11, a3, end, marked_count + 1, this->__marked_count_ + 1);
            default:
              if ((this->__flags_ & 0x1F0) == 0x40)
              {
                v11 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<char const*>(this, v9, (std::basic_regex<char>::value_type *)a3, 0);
              }
              else
              {
                v12 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(this, v10);
                v13 = 2;
                if (!v12)
                  v13 = 0;
                v11 = (std::basic_regex<char> *)&a2[v13];
              }
              if (v11 != (std::basic_regex<char> *)a2)
                goto LABEL_19;
              v8 = *a2;
              break;
          }
        }
        if (v8 != 46)
          goto LABEL_18;
        v14 = (std::__node<char> *)operator new(0x10uLL);
        v15 = this->__end_;
        first = v15->__first_;
        v14->__vftable = (std::__node<char>_vtbl *)&off_24CDC12B8;
        v14[1].__vftable = (std::__node<char>_vtbl *)first;
        v15->__first_ = v14;
        break;
      default:
LABEL_8:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v8);
        v11 = (std::basic_regex<char> *)(a2 + 1);
        return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)this, v11, a3, end, marked_count + 1, this->__marked_count_ + 1);
    }
    goto LABEL_27;
  }
LABEL_18:
  v11 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<char const*>((uint64_t)this, a2, (std::basic_regex<char>::value_type *)a3);
LABEL_19:
  if (v11 != (std::basic_regex<char> *)a2 || v11 == a3)
    goto LABEL_36;
  v17 = *a2;
  switch(v17)
  {
    case '$':
      v18 = (std::__node<char> *)operator new(0x18uLL);
      v19 = (this->__flags_ & 0x5F0) == 1024;
      v20 = this->__end_;
      v21 = v20->__first_;
      v22 = &off_24CDC0DA8;
      goto LABEL_26;
    case '(':
      if ((this->__flags_ & 2) != 0)
      {
        v24 = this->__marked_count_;
      }
      else
      {
        v23 = (std::__node<char> *)operator new(0x18uLL);
        v24 = this->__marked_count_ + 1;
        this->__marked_count_ = v24;
        v25 = this->__end_;
        v26 = v25->__first_;
        v23->__vftable = (std::__node<char>_vtbl *)&off_24CDC10C0;
        v23[1].__vftable = (std::__node<char>_vtbl *)v26;
        LODWORD(v23[2].__vftable) = v24;
        v25->__first_ = v23;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      ++this->__open_count_;
      v27 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<char const*>(this, a2 + 1, a3);
      if (v27 == a3 || (v28 = v27, LOBYTE(v27->__traits_.__loc_.__locale_) != 41))
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      if ((this->__flags_ & 2) == 0)
      {
        v29 = (std::__node<char> *)operator new(0x18uLL);
        v30 = this->__end_;
        v31 = v30->__first_;
        v29->__vftable = (std::__node<char>_vtbl *)&off_24CDC1108;
        v29[1].__vftable = (std::__node<char>_vtbl *)v31;
        LODWORD(v29[2].__vftable) = v24;
        v30->__first_ = v29;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      --this->__open_count_;
      v11 = (std::basic_regex<char> *)((char *)&v28->__traits_.__loc_.__locale_ + 1);
LABEL_36:
      if (v11 != (std::basic_regex<char> *)a2)
        return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)this, v11, a3, end, marked_count + 1, this->__marked_count_ + 1);
      return (std::basic_regex<char> *)a2;
    case '^':
      v18 = (std::__node<char> *)operator new(0x18uLL);
      v19 = (this->__flags_ & 0x5F0) == 1024;
      v20 = this->__end_;
      v21 = v20->__first_;
      v22 = &off_24CDC0D60;
LABEL_26:
      v18->__vftable = (std::__node<char>_vtbl *)v22;
      v18[1].__vftable = (std::__node<char>_vtbl *)v21;
      LOBYTE(v18[2].__vftable) = v19;
      v20->__first_ = v18;
LABEL_27:
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      v11 = (std::basic_regex<char> *)(a2 + 1);
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<char const*>((uint64_t)this, v11, a3, end, marked_count + 1, this->__marked_count_ + 1);
  }
  return (std::basic_regex<char> *)a2;
}

void std::match_results<std::__wrap_iter<char const*>>::__assign[abi:ne180100]<char const*,std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  char v5;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  __int128 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  v5 = a5;
  v10 = a4[6];
  v11 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3);
  v13 = *(char **)a1;
  v12 = *(char **)(a1 + 8);
  v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v12[-*(_QWORD *)a1] >> 3);
  v15 = v11 - v14;
  if (v11 > v14)
  {
    v16 = *(_QWORD *)(a1 + 16);
    if (0xAAAAAAAAAAAAAAABLL * ((v16 - (uint64_t)v12) >> 3) >= v15)
    {
      v22 = &v12[24 * v15];
      v27 = 8 * ((a4[1] - *a4) >> 3) - 8 * ((uint64_t)&v12[-*(_QWORD *)a1] >> 3);
      do
      {
        *(_QWORD *)v12 = 0;
        *((_QWORD *)v12 + 1) = 0;
        v12[16] = 0;
        v12 += 24;
        v27 -= 24;
      }
      while (v27);
      *(_QWORD *)(a1 + 8) = v22;
      goto LABEL_24;
    }
    if (v11 > 0xAAAAAAAAAAAAAAALL)
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    v17 = 0xAAAAAAAAAAAAAAABLL * ((v16 - (uint64_t)v13) >> 3);
    v18 = 0x5555555555555556 * ((v16 - (uint64_t)v13) >> 3);
    if (v18 <= v11)
      v18 = 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3);
    if (v17 >= 0x555555555555555)
      v19 = 0xAAAAAAAAAAAAAAALL;
    else
      v19 = v18;
    if (v19 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v20 = (char *)operator new(24 * v19);
    v21 = &v20[24 * v14];
    v22 = &v20[24 * v11];
    v23 = 24 * v11 - 24 * v14;
    v24 = v21;
    do
    {
      *(_QWORD *)v24 = 0;
      *((_QWORD *)v24 + 1) = 0;
      v24[16] = 0;
      v24 += 24;
      v23 -= 24;
    }
    while (v23);
    v25 = &v20[24 * v19];
    if (v12 == v13)
    {
      v5 = a5;
      *(_QWORD *)a1 = v21;
      *(_QWORD *)(a1 + 8) = v22;
      *(_QWORD *)(a1 + 16) = v25;
      if (!v12)
      {
LABEL_24:
        v13 = *(char **)a1;
        v12 = v22;
        goto LABEL_25;
      }
    }
    else
    {
      v5 = a5;
      do
      {
        v26 = *(_OWORD *)(v12 - 24);
        *((_QWORD *)v21 - 1) = *((_QWORD *)v12 - 1);
        *(_OWORD *)(v21 - 24) = v26;
        v21 -= 24;
        v12 -= 24;
      }
      while (v12 != v13);
      v12 = v13;
      *(_QWORD *)a1 = v21;
      *(_QWORD *)(a1 + 8) = v22;
      *(_QWORD *)(a1 + 16) = v25;
      if (!v13)
        goto LABEL_24;
    }
    operator delete(v12);
    v22 = *(char **)(a1 + 8);
    goto LABEL_24;
  }
  if (v11 < v14)
  {
    v12 = &v13[8 * ((a4[1] - *a4) >> 3)];
    *(_QWORD *)(a1 + 8) = v12;
  }
LABEL_25:
  if (v12 != v13)
  {
    v28 = 0;
    v29 = 0;
    v31 = *a4;
    v30 = a4[1];
    do
    {
      v32 = 0xAAAAAAAAAAAAAAABLL * ((v30 - v31) >> 3);
      v33 = (_QWORD *)(v31 + v28);
      if (v32 <= v29)
        v34 = a4 + 3;
      else
        v34 = v33;
      *(_QWORD *)&v13[v28] = a2 + *v34 - v10;
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v29)
        v35 = a4 + 3;
      else
        v35 = (uint64_t *)(*a4 + v28);
      *(_QWORD *)(*(_QWORD *)a1 + v28 + 8) = a2 + v35[1] - v10;
      v31 = *a4;
      v30 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v30 - *a4) >> 3) <= v29)
        v36 = a4 + 3;
      else
        v36 = (uint64_t *)(*a4 + v28);
      v13 = *(char **)a1;
      v37 = *(_QWORD *)(a1 + 8);
      *(_BYTE *)(*(_QWORD *)a1 + v28 + 16) = *((_BYTE *)v36 + 16);
      ++v29;
      v28 += 24;
    }
    while (v29 < 0xAAAAAAAAAAAAAAABLL * ((v37 - (uint64_t)v13) >> 3));
  }
  *(_QWORD *)(a1 + 24) = a3;
  *(_QWORD *)(a1 + 32) = a3;
  *(_BYTE *)(a1 + 40) = 0;
  v38 = a2 + a4[6] - v10;
  *(_QWORD *)(a1 + 48) = v38;
  *(_QWORD *)(a1 + 56) = a2 + a4[7] - v10;
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a4 + 64);
  *(_QWORD *)(a1 + 72) = a2 + a4[9] - v10;
  *(_QWORD *)(a1 + 80) = a2 + a4[10] - v10;
  *(_BYTE *)(a1 + 88) = *((_BYTE *)a4 + 88);
  if ((v5 & 1) == 0)
    *(_QWORD *)(a1 + 104) = v38;
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a4 + 96);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_nosubs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  unint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  std::vector<std::pair<unsigned long, const char *>> *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unsigned int v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  __int128 v54;
  uint64_t v55;
  unint64_t v56;
  char *v57;
  char *v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void **v67;
  uint64_t v68;
  _QWORD *v69;
  _QWORD *v70;
  unint64_t v71;
  void *v72;
  void *v73;
  _QWORD *v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  __int128 v81;
  unint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  unint64_t v94;
  char *v95;
  int64_t v96;
  unint64_t v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  __int128 *v103;
  char *v104;
  uint64_t v105;
  __int128 v106;
  uint64_t v107;
  char *v108;
  char *v109;
  void *v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  __int128 v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;
  unint64_t v128;
  char *v129;
  unint64_t v130;
  BOOL v131;
  int64_t v132;
  unint64_t v133;
  uint64_t v134;
  char *v135;
  char *v136;
  uint64_t v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  __int128 *v141;
  char *v142;
  uint64_t v143;
  __int128 v144;
  uint64_t v145;
  void **v146;
  void **v147;
  unint64_t v148;
  unint64_t v149;
  uint64_t v150;
  void *v151;
  uint64_t *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char v157;
  void *v158;
  char *v159;
  uint64_t v162;
  _BYTE v163[96];
  __int128 v164;
  __int128 v165;
  __int128 v166;

  v165 = 0u;
  v166 = 0u;
  v164 = 0u;
  v6 = *(_QWORD *)(a1 + 40);
  if (!v6)
    goto LABEL_154;
  *(_DWORD *)v163 = 0;
  memset(&v163[8], 0, 85);
  std::deque<std::__state<char>>::__add_back_capacity((uint64_t)&v164);
  v11 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * (((_QWORD)v166 + *((_QWORD *)&v166 + 1)) / 0x2AuLL))
      + 96 * (((_QWORD)v166 + *((_QWORD *)&v166 + 1)) % 0x2AuLL);
  v12 = *(_OWORD *)&v163[16];
  *(_OWORD *)v11 = *(_OWORD *)v163;
  *(_OWORD *)(v11 + 16) = v12;
  *(_QWORD *)(v11 + 40) = 0;
  *(_QWORD *)(v11 + 48) = 0;
  *(_QWORD *)(v11 + 32) = 0;
  memset(&v163[32], 0, 24);
  *(_QWORD *)(v11 + 56) = 0;
  *(_QWORD *)(v11 + 64) = 0;
  *(_QWORD *)(v11 + 72) = 0;
  memset(&v163[56], 0, 24);
  v13 = *(_QWORD *)&v163[80];
  *(_QWORD *)(v11 + 85) = *(_QWORD *)&v163[85];
  *(_QWORD *)(v11 + 80) = v13;
  v15 = *((_QWORD *)&v166 + 1);
  v14 = v166;
  v16 = ++*((_QWORD *)&v166 + 1);
  v17 = *((_QWORD *)&v164 + 1);
  v18 = *(unsigned int *)(a1 + 32);
  v19 = v166 + v15;
  v20 = 8 * (v19 / 0x2A);
  v21 = 96 * (v19 % 0x2A);
  v22 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + v20) + v21;
  *(_DWORD *)v22 = 0;
  *(_QWORD *)(v22 + 8) = a2;
  *(_QWORD *)(*(_QWORD *)(v17 + v20) + v21 + 16) = a2;
  *(_QWORD *)(*(_QWORD *)(v17 + v20) + v21 + 24) = a3;
  v23 = *(_QWORD *)(v17 + v20) + v21;
  v26 = *(_QWORD *)(v23 + 56);
  v24 = (std::vector<std::pair<unsigned long, const char *>> *)(v23 + 56);
  v25 = v26;
  v27 = ((uint64_t)v24->__end_ - v26) >> 4;
  v153 = a4;
  if (v18 <= v27)
  {
    if (v18 < v27)
      v24->__end_ = (std::vector<std::pair<unsigned long, const char *>>::pointer)(v25 + 16 * v18);
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append(v24, v18 - v27);
    v16 = *((_QWORD *)&v166 + 1);
    v14 = v166;
    v17 = *((_QWORD *)&v164 + 1);
  }
  v155 = a3;
  v156 = 0;
  v157 = 0;
  v28 = 0;
  v162 = a3 - a2;
  v29 = v14 + v16 - 1;
  v30 = 8 * (v29 / 0x2A);
  v31 = 96 * (v29 % 0x2A);
  *(_QWORD *)(*(_QWORD *)(v17 + v30) + v31 + 80) = v6;
  v32 = *(_QWORD *)(v17 + v30) + v31;
  *(_DWORD *)(v32 + 88) = a5;
  *(_BYTE *)(v32 + 92) = a6;
  while (2)
  {
    if ((++v28 & 0xFFF) == 0 && (int)(v28 >> 12) >= (int)v162)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    v34 = v16 + v166 - 1;
    v35 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * (v34 / 0x2A));
    v36 = v34 % 0x2A;
    v37 = v35 + 96 * (v34 % 0x2A);
    v39 = (_QWORD *)(v37 + 80);
    v38 = *(_QWORD *)(v37 + 80);
    if (v38)
      (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v38 + 16))(v38, v35 + 96 * v36);
    switch(*(_DWORD *)v37)
    {
      case 0xFFFFFC18:
        v40 = *(_QWORD *)(v35 + 96 * v36 + 16);
        if ((a5 & 0x20) != 0 && v40 == a2)
        {
          v41 = *((_QWORD *)&v166 + 1) + v166 - 1;
          v42 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * (v41 / 0x2A));
          v43 = v41 % 0x2A;
          v44 = *(void **)(v42 + 96 * (v41 % 0x2A) + 56);
          if (v44)
            goto LABEL_22;
LABEL_23:
          v46 = *(void **)(v42 + 96 * v43 + 32);
          if (v46)
          {
            *(_QWORD *)(v42 + 96 * v43 + 40) = v46;
            operator delete(v46);
          }
          v47 = 42 * ((uint64_t)(v165 - *((_QWORD *)&v164 + 1)) >> 3) - 1;
          v48 = v166;
          --*((_QWORD *)&v166 + 1);
          if ((_QWORD)v165 == *((_QWORD *)&v164 + 1))
            v47 = 0;
          if ((unint64_t)(v47 - (*((_QWORD *)&v48 + 1) + v48) + 1) >= 0x54)
          {
            operator delete(*(void **)(v165 - 8));
            *(_QWORD *)&v165 = v165 - 8;
          }
          goto LABEL_8;
        }
        if ((a5 & 0x1000) != 0 && v40 != v155)
        {
          v64 = *((_QWORD *)&v166 + 1) + v166 - 1;
          v42 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * (v64 / 0x2A));
          v43 = v64 % 0x2A;
          v44 = *(void **)(v42 + 96 * (v64 % 0x2A) + 56);
          if (v44)
            goto LABEL_22;
          goto LABEL_23;
        }
        v65 = v40 - *(_QWORD *)(v35 + 96 * v36 + 8);
        v66 = v156;
        if ((v157 & (v156 >= v65)) == 0)
          v66 = v65;
        if (v66 == v162)
        {
          v67 = (void **)*((_QWORD *)&v164 + 1);
          v68 = v165;
          if ((_QWORD)v165 == *((_QWORD *)&v164 + 1))
          {
            *((_QWORD *)&v166 + 1) = 0;
            v89 = 0;
          }
          else
          {
            v69 = (_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * ((unint64_t)v166 / 0x2A));
            v70 = (_QWORD *)(*v69 + 96 * ((unint64_t)v166 % 0x2A));
            v71 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * ((*((_QWORD *)&v166 + 1) + (_QWORD)v166) / 0x2AuLL))
                + 96 * ((*((_QWORD *)&v166 + 1) + (_QWORD)v166) % 0x2AuLL);
            if (v70 != (_QWORD *)v71)
            {
              do
              {
                v72 = (void *)v70[7];
                if (v72)
                {
                  v70[8] = v72;
                  operator delete(v72);
                }
                v73 = (void *)v70[4];
                if (v73)
                {
                  v70[5] = v73;
                  operator delete(v73);
                }
                v70 += 12;
                if ((_QWORD *)((char *)v70 - *v69) == (_QWORD *)4032)
                {
                  v74 = (_QWORD *)v69[1];
                  ++v69;
                  v70 = v74;
                }
              }
              while (v70 != (_QWORD *)v71);
              v67 = (void **)*((_QWORD *)&v164 + 1);
              v68 = v165;
            }
            *((_QWORD *)&v166 + 1) = 0;
            v89 = v68 - (_QWORD)v67;
            if (v89 >= 0x11)
            {
              do
              {
                operator delete(*v67);
                v67 = (void **)(*((_QWORD *)&v164 + 1) + 8);
                *((_QWORD *)&v164 + 1) = v67;
                v89 = v165 - (_QWORD)v67;
              }
              while ((_QWORD)v165 - (_QWORD)v67 > 0x10uLL);
            }
          }
          if (v89 >> 3 == 1)
          {
            v90 = 21;
LABEL_93:
            *(_QWORD *)&v166 = v90;
          }
          else if (v89 >> 3 == 2)
          {
            v90 = 42;
            goto LABEL_93;
          }
          v157 = 1;
          v156 = v162;
          goto LABEL_8;
        }
        v156 = v66;
        v75 = *((_QWORD *)&v166 + 1) + v166 - 1;
        v76 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * (v75 / 0x2A));
        v77 = v75 % 0x2A;
        v78 = *(void **)(v76 + 96 * (v75 % 0x2A) + 56);
        if (v78)
        {
          *(_QWORD *)(v76 + 96 * v77 + 64) = v78;
          operator delete(v78);
        }
        v79 = *(void **)(v76 + 96 * v77 + 32);
        if (v79)
        {
          *(_QWORD *)(v76 + 96 * v77 + 40) = v79;
          operator delete(v79);
        }
        v80 = 42 * ((uint64_t)(v165 - *((_QWORD *)&v164 + 1)) >> 3) - 1;
        v81 = v166;
        --*((_QWORD *)&v166 + 1);
        if ((_QWORD)v165 == *((_QWORD *)&v164 + 1))
          v80 = 0;
        if ((unint64_t)(v80 - (*((_QWORD *)&v81 + 1) + v81) + 1) >= 0x54)
        {
          operator delete(*(void **)(v165 - 8));
          *(_QWORD *)&v165 = v165 - 8;
        }
        v157 = 1;
LABEL_8:
        v16 = *((_QWORD *)&v166 + 1);
        if (*((_QWORD *)&v166 + 1))
          continue;
        if ((v157 & 1) == 0)
        {
          v6 = 0;
          v146 = (void **)*((_QWORD *)&v164 + 1);
          v147 = (void **)v165;
          *((_QWORD *)&v166 + 1) = 0;
          v148 = v165 - *((_QWORD *)&v164 + 1);
          if ((_QWORD)v165 - *((_QWORD *)&v164 + 1) < 0x11uLL)
            goto LABEL_156;
          goto LABEL_155;
        }
        v145 = *v153;
        *(_QWORD *)v145 = a2;
        *(_QWORD *)(v145 + 8) = a2 + v156;
        v6 = 1;
        *(_BYTE *)(v145 + 16) = 1;
LABEL_154:
        v146 = (void **)*((_QWORD *)&v164 + 1);
        v147 = (void **)v165;
        *((_QWORD *)&v166 + 1) = 0;
        v148 = v165 - *((_QWORD *)&v164 + 1);
        if ((_QWORD)v165 - *((_QWORD *)&v164 + 1) < 0x11uLL)
          goto LABEL_156;
        do
        {
LABEL_155:
          operator delete(*v146);
          v147 = (void **)v165;
          v146 = (void **)(*((_QWORD *)&v164 + 1) + 8);
          *((_QWORD *)&v164 + 1) = v146;
          v148 = v165 - (_QWORD)v146;
        }
        while ((_QWORD)v165 - (_QWORD)v146 > 0x10uLL);
LABEL_156:
        v149 = v148 >> 3;
        if (v149 == 1)
        {
          v150 = 21;
          goto LABEL_160;
        }
        if (v149 == 2)
        {
          v150 = 42;
LABEL_160:
          *(_QWORD *)&v166 = v150;
        }
        if (v146 != v147)
        {
          do
          {
            v151 = *v146++;
            operator delete(v151);
          }
          while (v146 != v147);
          if ((_QWORD)v165 != *((_QWORD *)&v164 + 1))
            *(_QWORD *)&v165 = v165 + ((*((_QWORD *)&v164 + 1) - v165 + 7) & 0xFFFFFFFFFFFFFFF8);
        }
        if ((_QWORD)v164)
          operator delete((void *)v164);
        return v6;
      case 0xFFFFFC19:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_8;
      case 0xFFFFFC1D:
        v56 = v166;
        v57 = (char *)*((_QWORD *)&v164 + 1);
        v58 = (char *)v165;
        if ((_QWORD)v166)
          goto LABEL_120;
        v59 = (uint64_t)(v165 - *((_QWORD *)&v164 + 1)) >> 3;
        v60 = 42 * v59 - 1;
        if ((_QWORD)v165 == *((_QWORD *)&v164 + 1))
          v60 = 0;
        if ((unint64_t)(v60 - *((_QWORD *)&v166 + 1)) >= 0x2A)
        {
          *(_QWORD *)&v166 = 42;
          v62 = (char *)(v165 - 8);
          v61 = *(_QWORD *)(v165 - 8);
          *(_QWORD *)&v165 = v165 - 8;
          if (*((_QWORD *)&v164 + 1) == (_QWORD)v164)
          {
            if ((unint64_t)v62 >= *((_QWORD *)&v165 + 1))
            {
              if (*((_QWORD *)&v165 + 1) == *((_QWORD *)&v164 + 1))
                v92 = 1;
              else
                v92 = (uint64_t)(*((_QWORD *)&v165 + 1) - *((_QWORD *)&v164 + 1)) >> 2;
              if (v92 >> 61)
                goto LABEL_172;
              v93 = (char *)operator new(8 * v92);
              v94 = (v92 + 3) >> 2;
              v63 = &v93[8 * v94];
              v95 = v63;
              v96 = v62 - v57;
              if (v62 != v57)
              {
                v95 = &v63[v96 & 0xFFFFFFFFFFFFFFF8];
                v97 = v96 - 8;
                v98 = &v93[8 * v94];
                v99 = v57;
                if (v97 < 0x38)
                  goto LABEL_175;
                v100 = 8 * v94;
                v98 = &v93[8 * v94];
                v99 = v57;
                if ((unint64_t)(v98 - v57) < 0x20)
                  goto LABEL_175;
                v101 = (v97 >> 3) + 1;
                v102 = 8 * (v101 & 0x3FFFFFFFFFFFFFFCLL);
                v98 = &v63[v102];
                v99 = &v57[v102];
                v103 = (__int128 *)(v57 + 16);
                v104 = &v93[v100 + 16];
                v105 = v101 & 0x3FFFFFFFFFFFFFFCLL;
                do
                {
                  v106 = *v103;
                  *((_OWORD *)v104 - 1) = *(v103 - 1);
                  *(_OWORD *)v104 = v106;
                  v103 += 2;
                  v104 += 32;
                  v105 -= 4;
                }
                while (v105);
                if (v101 != (v101 & 0x3FFFFFFFFFFFFFFCLL))
                {
LABEL_175:
                  do
                  {
                    v107 = *(_QWORD *)v99;
                    v99 += 8;
                    *(_QWORD *)v98 = v107;
                    v98 += 8;
                  }
                  while (v98 != v95);
                }
              }
              *(_QWORD *)&v164 = v93;
              *((_QWORD *)&v164 + 1) = v63;
              *(_QWORD *)&v165 = v95;
              *((_QWORD *)&v165 + 1) = &v93[8 * v92];
              if (v57)
              {
                operator delete(v57);
                v63 = (char *)*((_QWORD *)&v164 + 1);
              }
            }
            else
            {
              v85 = (uint64_t)(*((_QWORD *)&v165 + 1) - (_QWORD)v62) >> 3;
              if (v85 >= -1)
                v86 = v85 + 1;
              else
                v86 = v85 + 2;
              v87 = v86 >> 1;
              v88 = &v62[8 * (v86 >> 1)];
              v63 = (char *)(v88 - &v62[-*((_QWORD *)&v164 + 1)]);
              if (v62 != *((char **)&v164 + 1))
              {
                memmove((void *)(v88 - &v62[-*((_QWORD *)&v164 + 1)]), *((const void **)&v164 + 1), (size_t)&v62[-*((_QWORD *)&v164 + 1)]);
                v57 = (char *)v165;
              }
              *((_QWORD *)&v164 + 1) = v63;
              *(_QWORD *)&v165 = &v57[8 * v87];
            }
          }
          else
          {
            v63 = (char *)*((_QWORD *)&v164 + 1);
          }
          *((_QWORD *)v63 - 1) = v61;
          v57 = (char *)(*((_QWORD *)&v164 + 1) - 8);
          *((_QWORD *)&v164 + 1) -= 8;
          goto LABEL_119;
        }
        if (v59 < (uint64_t)(*((_QWORD *)&v165 + 1) - v164) >> 3)
        {
          if (*((_QWORD *)&v164 + 1) == (_QWORD)v164)
          {
            *(_QWORD *)v163 = operator new(0xFC0uLL);
            std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back((char **)&v164, v163);
            *(_QWORD *)v163 = *(_QWORD *)(v165 - 8);
            *(_QWORD *)&v165 = v165 - 8;
          }
          else
          {
            *(_QWORD *)v163 = operator new(0xFC0uLL);
          }
          std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)&v164, v163);
          v57 = (char *)*((_QWORD *)&v164 + 1);
          v91 = 21;
          if ((_QWORD)v165 - *((_QWORD *)&v164 + 1) != 8)
            v91 = v166 + 42;
          *(_QWORD *)&v166 = v91;
LABEL_119:
          v56 = v166;
          v58 = (char *)v165;
LABEL_120:
          v112 = &v57[8 * (v56 / 0x2A)];
          v113 = *(_QWORD *)v112 + 96 * (v56 % 0x2A);
          if (v58 == v57)
            v113 = 0;
          if (v113 == *(_QWORD *)v112)
            v113 = *((_QWORD *)v112 - 1) + 4032;
          v114 = *(_OWORD *)(v37 + 16);
          *(_OWORD *)(v113 - 96) = *(_OWORD *)v37;
          *(_OWORD *)(v113 - 80) = v114;
          v115 = v35 + 96 * v36;
          *(_QWORD *)(v113 - 56) = 0;
          *(_QWORD *)(v113 - 48) = 0;
          *(_QWORD *)(v113 - 64) = 0;
          *(_OWORD *)(v113 - 64) = *(_OWORD *)(v115 + 32);
          *(_QWORD *)(v113 - 48) = *(_QWORD *)(v115 + 48);
          *(_QWORD *)(v115 + 32) = 0;
          *(_QWORD *)(v115 + 40) = 0;
          *(_QWORD *)(v115 + 48) = 0;
          *(_QWORD *)(v113 - 40) = 0;
          *(_QWORD *)(v113 - 32) = 0;
          *(_QWORD *)(v113 - 24) = 0;
          *(_OWORD *)(v113 - 40) = *(_OWORD *)(v115 + 56);
          *(_QWORD *)(v113 - 24) = *(_QWORD *)(v115 + 72);
          *(_QWORD *)(v115 + 56) = 0;
          *(_QWORD *)(v115 + 64) = 0;
          *(_QWORD *)(v115 + 72) = 0;
          v116 = *v39;
          *(_QWORD *)(v113 - 11) = *(_QWORD *)(v37 + 85);
          *(_QWORD *)(v113 - 16) = v116;
          v117 = *((_QWORD *)&v166 + 1);
          *(_QWORD *)&v166 = v166 - 1;
          ++*((_QWORD *)&v166 + 1);
          v118 = v117 + v166;
          v119 = (v117 + (uint64_t)v166) / 0x2AuLL;
          v42 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * v119);
          v43 = v118 - 42 * v119;
          v44 = *(void **)(v42 + 96 * v43 + 56);
          if (v44)
          {
LABEL_22:
            *(_QWORD *)(v42 + 96 * v43 + 64) = v44;
            operator delete(v44);
          }
          goto LABEL_23;
        }
        if (*((_QWORD *)&v165 + 1) == (_QWORD)v164)
          v82 = 1;
        else
          v82 = (uint64_t)(*((_QWORD *)&v165 + 1) - v164) >> 2;
        if (v82 >> 61)
LABEL_172:
          std::__throw_bad_array_new_length[abi:ne180100]();
        v83 = (char *)operator new(8 * v82);
        v158 = operator new(0xFC0uLL);
        if (v82)
        {
          v84 = &v83[8 * v82];
        }
        else
        {
          v108 = (char *)operator new(8uLL);
          v84 = v108 + 8;
          operator delete(v83);
          v57 = (char *)*((_QWORD *)&v164 + 1);
          v58 = (char *)v165;
          v83 = v108;
        }
        *(_QWORD *)v83 = v158;
        v109 = v83 + 8;
        v159 = v83;
        v154 = v35;
        if (v57 == v58)
        {
LABEL_115:
          v110 = (void *)v164;
          *(_QWORD *)&v164 = v159;
          *((_QWORD *)&v164 + 1) = v83;
          *(_QWORD *)&v165 = v109;
          *((_QWORD *)&v165 + 1) = v84;
          v111 = v166 + 42;
          if (v109 - v83 == 8)
            v111 = 21;
          *(_QWORD *)&v166 = v111;
          v57 = v83;
          if (v110)
          {
            operator delete(v110);
            v57 = (char *)*((_QWORD *)&v164 + 1);
          }
          goto LABEL_119;
        }
        break;
      case 0xFFFFFC1F:
        v45 = *((_QWORD *)&v166 + 1) + v166 - 1;
        v42 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * (v45 / 0x2A));
        v43 = v45 % 0x2A;
        v44 = *(void **)(v42 + 96 * (v45 % 0x2A) + 56);
        if (v44)
          goto LABEL_22;
        goto LABEL_23;
      case 0xFFFFFC20:
        *(_QWORD *)&v49 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v163[64] = v49;
        *(_OWORD *)&v163[80] = v49;
        *(_OWORD *)&v163[32] = v49;
        *(_OWORD *)&v163[48] = v49;
        *(_OWORD *)v163 = v49;
        *(_OWORD *)&v163[16] = v49;
        std::__state<char>::__state((uint64_t)v163, (__int128 *)(v35 + 96 * v36));
        (*(void (**)(_QWORD, uint64_t, unint64_t))(*(_QWORD *)*v39 + 24))(*v39, 1, v35 + 96 * v36);
        (*(void (**)(_QWORD, _QWORD, _BYTE *))(**(_QWORD **)&v163[80] + 24))(*(_QWORD *)&v163[80], 0, v163);
        v50 = *((_QWORD *)&v164 + 1);
        if ((_QWORD)v165 == *((_QWORD *)&v164 + 1))
          v51 = 0;
        else
          v51 = 42 * ((uint64_t)(v165 - *((_QWORD *)&v164 + 1)) >> 3) - 1;
        v52 = *((_QWORD *)&v166 + 1) + v166;
        if (v51 == *((_QWORD *)&v166 + 1) + (_QWORD)v166)
        {
          std::deque<std::__state<char>>::__add_back_capacity((uint64_t)&v164);
          v50 = *((_QWORD *)&v164 + 1);
          v52 = *((_QWORD *)&v166 + 1) + v166;
        }
        v53 = *(_QWORD *)(v50 + 8 * (v52 / 0x2A)) + 96 * (v52 % 0x2A);
        v54 = *(_OWORD *)&v163[16];
        *(_OWORD *)v53 = *(_OWORD *)v163;
        *(_OWORD *)(v53 + 16) = v54;
        *(_QWORD *)(v53 + 40) = 0;
        *(_QWORD *)(v53 + 48) = 0;
        *(_QWORD *)(v53 + 32) = 0;
        *(_OWORD *)(v53 + 32) = *(_OWORD *)&v163[32];
        *(_QWORD *)(v53 + 48) = *(_QWORD *)&v163[48];
        memset(&v163[32], 0, 24);
        *(_QWORD *)(v53 + 56) = 0;
        *(_QWORD *)(v53 + 64) = 0;
        *(_QWORD *)(v53 + 72) = 0;
        *(_OWORD *)(v53 + 56) = *(_OWORD *)&v163[56];
        *(_QWORD *)(v53 + 72) = *(_QWORD *)&v163[72];
        memset(&v163[56], 0, 24);
        v55 = *(_QWORD *)&v163[80];
        *(_QWORD *)(v53 + 85) = *(_QWORD *)&v163[85];
        *(_QWORD *)(v53 + 80) = v55;
        ++*((_QWORD *)&v166 + 1);
        if (*(_QWORD *)&v163[56])
        {
          *(_QWORD *)&v163[64] = *(_QWORD *)&v163[56];
          operator delete(*(void **)&v163[56]);
        }
        if (*(_QWORD *)&v163[32])
        {
          *(_QWORD *)&v163[40] = *(_QWORD *)&v163[32];
          operator delete(*(void **)&v163[32]);
        }
        goto LABEL_8;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
    break;
  }
  while (v109 != v84)
  {
    v120 = v83;
LABEL_127:
    v121 = *(_QWORD *)v57;
    v57 += 8;
    *(_QWORD *)v109 = v121;
    v109 += 8;
    v83 = v120;
    if (v57 == (char *)v165)
      goto LABEL_115;
  }
  if (v83 > v159)
  {
    v122 = (v83 - v159) >> 3;
    if (v122 >= -1)
      v123 = v122 + 1;
    else
      v123 = v122 + 2;
    v124 = v123 >> 1;
    v125 = &v83[-8 * (v123 >> 1)];
    v126 = v109;
    if (v109 != v83)
    {
      memmove(v125, v83, v109 - v83);
      v126 = v83;
    }
    v127 = -v124;
    v84 = v109;
    v109 = &v125[v109 - v83];
    v120 = &v126[8 * v127];
    v35 = v154;
    goto LABEL_127;
  }
  if (v109 == v159)
    v128 = 1;
  else
    v128 = (v109 - v159) >> 2;
  if (v128 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v129 = (char *)operator new(8 * v128);
  v130 = v128 >> 2;
  v120 = &v129[8 * (v128 >> 2)];
  v132 = v109 - v83;
  v131 = v109 == v83;
  v109 = v120;
  if (!v131)
  {
    v109 = &v120[v132 & 0xFFFFFFFFFFFFFFF8];
    v133 = v132 - 8;
    if (v133 >= 0x38 && (v134 = 8 * v130, (unint64_t)(&v129[8 * v130] - v83) >= 0x20))
    {
      v139 = (v133 >> 3) + 1;
      v140 = 8 * (v139 & 0x3FFFFFFFFFFFFFFCLL);
      v135 = &v120[v140];
      v136 = &v83[v140];
      v141 = (__int128 *)(v83 + 16);
      v142 = &v129[v134 + 16];
      v143 = v139 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v144 = *v141;
        *((_OWORD *)v142 - 1) = *(v141 - 1);
        *(_OWORD *)v142 = v144;
        v141 += 2;
        v142 += 32;
        v143 -= 4;
      }
      while (v143);
      if (v139 == (v139 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_145;
    }
    else
    {
      v135 = &v129[8 * (v128 >> 2)];
      v136 = v83;
    }
    do
    {
      v137 = *(_QWORD *)v136;
      v136 += 8;
      *(_QWORD *)v135 = v137;
      v135 += 8;
    }
    while (v135 != v109);
  }
LABEL_145:
  v84 = &v129[8 * v128];
  if (v159)
  {
    v138 = v129;
    operator delete(v159);
    v159 = v138;
  }
  else
  {
    v159 = v129;
  }
  goto LABEL_127;
}

void sub_21247FBA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p)
{
  void *v17;
  uint64_t v18;

  operator delete(__p);
  operator delete(v17);
  std::deque<std::__state<char>>::~deque[abi:ne180100](v18 - 144);
  _Unwind_Resume(a1);
}

void sub_21247FBD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  uint64_t v18;

  operator delete(v17);
  std::deque<std::__state<char>>::~deque[abi:ne180100](v18 - 144);
  _Unwind_Resume(a1);
}

void sub_21247FBF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  uint64_t v21;

  std::deque<std::__state<char>>::~deque[abi:ne180100](v21 - 144);
  _Unwind_Resume(a1);
}

uint64_t std::basic_regex<char,std::regex_traits<char>>::__match_at_start_posix_subs<std::allocator<std::sub_match<char const*>>>(uint64_t a1, const char *a2, const char *a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  const char *v20;
  char v21;
  unsigned int v22;
  const char *v23;
  BOOL v24;
  uint64_t v25;
  char *v26;
  char *v27;
  const char *v28;
  char *v29;
  void *v30;
  void *v31;
  __int128 v32;
  char *v33;
  __int128 v34;
  uint64_t v35;
  const char *v36;
  __int128 v37;
  char *v38;
  char *v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  size_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  int64_t v59;
  unint64_t v60;
  uint64_t v61;
  char *v62;
  const char *v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  char *v68;
  int64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  unint64_t v73;
  char *v74;
  char *v75;
  __int128 v76;
  unint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  char *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  BOOL v89;
  BOOL v90;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  const double *v96;
  double *v97;
  uint64_t v98;
  const double *v99;
  double *v100;
  BOOL v102;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  const double *v107;
  double *v108;
  uint64_t v109;
  const double *v110;
  double *v111;
  uint64_t v112;
  unint64_t v113;
  _BYTE *v114;
  unsigned int v115;
  uint64_t v116;
  char v117;
  const char *v119;
  uint64_t *v120;
  const char *v121;
  _BYTE v124[96];
  std::vector<std::csub_match>::value_type __x;
  _BYTE v126[40];
  void *v127[2];
  _BYTE v128[40];
  char *v129;
  char *v130;
  unint64_t v131;
  float64x2x2_t v132;
  float64x2x2_t v133;
  float64x2x2_t v134;
  float64x2x2_t v135;

  v129 = 0;
  v130 = 0;
  v131 = 0;
  *(_DWORD *)&v128[36] = -1431655766;
  *(_QWORD *)v126 = 0xAAAAAAAA00000000;
  memset(&v126[8], 0, 32);
  *(_OWORD *)v127 = 0u;
  memset(v128, 0, 36);
  v6 = *(_QWORD *)(a1 + 40);
  if (!v6)
  {
    v15 = 0;
    v16 = *(void **)v128;
    if (!*(_QWORD *)v128)
      goto LABEL_151;
    goto LABEL_150;
  }
  __x.second = a3;
  *(_QWORD *)&__x.matched = 0xAAAAAAAAAAAAAA00;
  __x.first = a3;
  *(_DWORD *)v124 = 0;
  memset(&v124[8], 0, 85);
  v11 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v129, (uint64_t)v124);
  v130 = v11;
  if (*(_QWORD *)&v124[56])
    operator delete(*(void **)&v124[56]);
  if (*(_QWORD *)&v124[32])
    operator delete(*(void **)&v124[32]);
  v12 = *((_QWORD *)v11 - 8);
  *((_DWORD *)v11 - 24) = 0;
  *((_QWORD *)v11 - 11) = a2;
  *((_QWORD *)v11 - 10) = a2;
  *((_QWORD *)v11 - 9) = a3;
  v13 = *(unsigned int *)(a1 + 28);
  v14 = 0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)v11 - 7) - v12) >> 3);
  if (v13 <= v14)
  {
    if (v13 < v14)
      *((_QWORD *)v11 - 7) = v12 + 24 * v13;
  }
  else
  {
    std::vector<std::sub_match<char const*>>::__append((std::vector<std::csub_match> *)(v11 - 64), v13 - v14, &__x);
  }
  v17 = *((_QWORD *)v11 - 5);
  v18 = *(unsigned int *)(a1 + 32);
  v19 = (*((_QWORD *)v11 - 4) - v17) >> 4;
  if (v18 <= v19)
  {
    if (v18 < v19)
      *((_QWORD *)v11 - 4) = v17 + 16 * v18;
  }
  else
  {
    std::vector<std::pair<unsigned long,char const*>>::__append((std::vector<std::pair<unsigned long, const char *>> *)(v11 - 40), v18 - v19);
  }
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = (const char *)(a3 - a2);
  *((_QWORD *)v11 - 2) = v6;
  *((_DWORD *)v11 - 2) = a5;
  *(v11 - 4) = a6;
  v121 = a3;
  v120 = a4;
  while (2)
  {
    v24 = (++v22 & 0xFFF) != 0 || (int)(v22 >> 12) < (int)v23;
    if (!v24)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)12>();
    v26 = v11 - 16;
    v25 = *((_QWORD *)v11 - 2);
    v27 = v11 - 96;
    if (v25)
      (*(void (**)(uint64_t, char *))(*(_QWORD *)v25 + 16))(v25, v11 - 96);
    switch(*(_DWORD *)v27)
    {
      case 0xFFFFFC18:
        v28 = (const char *)*((_QWORD *)v11 - 10);
        if ((a5 & 0x20) != 0 && v28 == a2 || (a5 & 0x1000) != 0 && v28 != v121)
          goto LABEL_31;
        v36 = &v28[-*((_QWORD *)v11 - 11)];
        if ((v21 & ((uint64_t)v20 >= (uint64_t)v36)) != 0)
          goto LABEL_97;
        v37 = *((_OWORD *)v11 - 5);
        *(_OWORD *)v126 = *(_OWORD *)v27;
        *(_OWORD *)&v126[16] = v37;
        if (v126 == v27)
          goto LABEL_96;
        v38 = (char *)*((_QWORD *)v11 - 8);
        v39 = (char *)*((_QWORD *)v11 - 7);
        v40 = 0xAAAAAAAAAAAAAAABLL * ((v39 - v38) >> 3);
        v41 = (uint64_t)v127[1];
        v42 = *(char **)&v126[32];
        if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v127[1] - *(_QWORD *)&v126[32]) >> 3) >= v40)
        {
          v47 = (char *)v127[0];
          if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v127[0] - *(_QWORD *)&v126[32]) >> 3) >= v40)
          {
            v55 = *(_QWORD *)&v126[32];
            if (v38 != v39)
            {
              v56 = *(_QWORD *)&v126[32];
              do
              {
                *(_OWORD *)v56 = *(_OWORD *)v38;
                *(_BYTE *)(v56 + 16) = v38[16];
                v55 += 24;
                v38 += 24;
                v56 += 24;
              }
              while (v38 != v39);
            }
            v50 = v55 - (_QWORD)v42;
            v47 = v42;
          }
          else
          {
            v51 = &v38[8 * (((uint64_t)v127[0] - *(_QWORD *)&v126[32]) >> 3)];
            if (v127[0] != *(void **)&v126[32])
            {
              do
              {
                *(_OWORD *)v42 = *(_OWORD *)v38;
                v42[16] = v38[16];
                v38 += 24;
                v42 += 24;
              }
              while (v38 != v51);
            }
            v52 = v47;
            if (v51 != v39)
            {
              v53 = v47;
              do
              {
                v54 = *(_OWORD *)v51;
                *((_QWORD *)v53 + 2) = *((_QWORD *)v51 + 2);
                *(_OWORD *)v53 = v54;
                v53 += 24;
                v51 += 24;
                v52 += 24;
              }
              while (v51 != v39);
            }
            v50 = v52 - v47;
          }
        }
        else
        {
          v119 = v36;
          if (*(_QWORD *)&v126[32])
          {
            v127[0] = *(void **)&v126[32];
            operator delete(*(void **)&v126[32]);
            v41 = 0;
            *(_QWORD *)&v126[32] = 0;
            *(_OWORD *)v127 = 0uLL;
          }
          if (v40 > 0xAAAAAAAAAAAAAAALL)
            goto LABEL_158;
          v43 = 0xAAAAAAAAAAAAAAABLL * (v41 >> 3);
          v44 = 2 * v43;
          if (2 * v43 <= v40)
            v44 = 0xAAAAAAAAAAAAAAABLL * ((v39 - v38) >> 3);
          v45 = v43 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v44;
          if (v45 > 0xAAAAAAAAAAAAAAALL)
LABEL_158:
            std::vector<std::string>::__throw_length_error[abi:ne180100]();
          v46 = (char *)operator new(24 * v45);
          v47 = v46;
          *(_QWORD *)&v126[32] = v46;
          v127[0] = v46;
          v127[1] = &v46[24 * v45];
          v48 = v46;
          if (v38 != v39)
          {
            v49 = 24 * ((v39 - v38 - 24) / 0x18uLL) + 24;
            memcpy(v46, v38, v49);
            v48 = &v47[v49];
          }
          v50 = v48 - v47;
          v36 = v119;
        }
        v127[0] = &v47[v50];
        v57 = (char *)*((_QWORD *)v11 - 5);
        v58 = (char *)*((_QWORD *)v11 - 4);
        v59 = v58 - v57;
        v60 = (v58 - v57) >> 4;
        v61 = *(_QWORD *)&v128[16];
        v62 = *(char **)v128;
        if (v60 <= (uint64_t)(*(_QWORD *)&v128[16] - *(_QWORD *)v128) >> 4)
        {
          v67 = *(char **)&v128[8];
          v70 = *(_QWORD *)&v128[8] - *(_QWORD *)v128;
          v71 = (uint64_t)(*(_QWORD *)&v128[8] - *(_QWORD *)v128) >> 4;
          if (v71 < v60)
          {
            v72 = &v57[16 * v71];
            if (*(_QWORD *)&v128[8] != *(_QWORD *)v128)
            {
              v73 = v70 - 16;
              if ((unint64_t)(v70 - 16) < 0xD0)
                goto LABEL_161;
              v86 = v70 & 0xFFFFFFFFFFFFFFF0;
              v87 = *(_QWORD *)v128 + 8 + v86 - 16;
              v88 = (unint64_t)&v57[v86 - 8];
              v89 = *(_QWORD *)v128 + 8 >= (unint64_t)&v57[v86]
                 || (unint64_t)(v57 + 8) >= *(_QWORD *)v128 + v86;
              v90 = !v89;
              if ((unint64_t)v57 < v87 && *(_QWORD *)v128 < v88)
                goto LABEL_161;
              if (v90)
                goto LABEL_161;
              v92 = (v73 >> 4) + 1;
              v93 = 16 * (v92 & 0x1FFFFFFFFFFFFFFCLL);
              v94 = (char *)(*(_QWORD *)v128 + v93);
              v95 = &v57[v93];
              v96 = (const double *)(v57 + 32);
              v97 = (double *)(*(_QWORD *)v128 + 32);
              v98 = v92 & 0x1FFFFFFFFFFFFFFCLL;
              do
              {
                v99 = v96 - 4;
                v132 = vld2q_f64(v99);
                v134 = vld2q_f64(v96);
                v100 = v97 - 4;
                vst2q_f64(v100, v132);
                vst2q_f64(v97, v134);
                v96 += 8;
                v97 += 8;
                v98 -= 4;
              }
              while (v98);
              v62 = v94;
              v57 = v95;
              if (v92 != (v92 & 0x1FFFFFFFFFFFFFFCLL))
              {
LABEL_161:
                do
                {
                  *(_QWORD *)v62 = *(_QWORD *)v57;
                  *((_QWORD *)v62 + 1) = *((_QWORD *)v57 + 1);
                  v57 += 16;
                  v62 += 16;
                }
                while (v57 != v72);
              }
            }
            v74 = v67;
            if (v72 != v58)
            {
              v75 = v67;
              do
              {
                v76 = *(_OWORD *)v72;
                v72 += 16;
                *(_OWORD *)v75 = v76;
                v75 += 16;
                v74 += 16;
              }
              while (v72 != v58);
            }
            v69 = v74 - v67;
            goto LABEL_95;
          }
          if (v57 == v58)
          {
            v78 = *(char **)v128;
          }
          else
          {
            v77 = v59 - 16;
            if ((unint64_t)(v59 - 16) >= 0xD0)
            {
              v102 = *(_QWORD *)v128 + 8 < (unint64_t)&v57[(v77 & 0xFFFFFFFFFFFFFFF0) + 16]
                  && (unint64_t)(v57 + 8) < *(_QWORD *)v128 + (v77 & 0xFFFFFFFFFFFFFFF0) + 16;
              v78 = *(char **)v128;
              if (((unint64_t)v57 >= *(_QWORD *)v128 + 8 + (v77 & 0xFFFFFFFFFFFFFFF0)
                 || *(_QWORD *)v128 >= (unint64_t)&v57[(v77 & 0xFFFFFFFFFFFFFFF0) + 8])
                && !v102)
              {
                v104 = (v77 >> 4) + 1;
                v105 = 16 * (v104 & 0x1FFFFFFFFFFFFFFCLL);
                v78 = (char *)(*(_QWORD *)v128 + v105);
                v106 = &v57[v105];
                v107 = (const double *)(v57 + 32);
                v108 = (double *)(*(_QWORD *)v128 + 32);
                v109 = v104 & 0x1FFFFFFFFFFFFFFCLL;
                do
                {
                  v110 = v107 - 4;
                  v133 = vld2q_f64(v110);
                  v135 = vld2q_f64(v107);
                  v111 = v108 - 4;
                  vst2q_f64(v111, v133);
                  vst2q_f64(v108, v135);
                  v107 += 8;
                  v108 += 8;
                  v109 -= 4;
                }
                while (v109);
                v57 = v106;
                if (v104 == (v104 & 0x1FFFFFFFFFFFFFFCLL))
                  goto LABEL_94;
              }
            }
            else
            {
              v78 = *(char **)v128;
            }
            do
            {
              *(_QWORD *)v78 = *(_QWORD *)v57;
              *((_QWORD *)v78 + 1) = *((_QWORD *)v57 + 1);
              v78 += 16;
              v57 += 16;
            }
            while (v57 != v58);
          }
LABEL_94:
          v69 = v78 - v62;
          v67 = v62;
          goto LABEL_95;
        }
        v63 = v36;
        if (*(_QWORD *)v128)
        {
          *(_QWORD *)&v128[8] = *(_QWORD *)v128;
          operator delete(*(void **)v128);
          v61 = 0;
          memset(v128, 0, 24);
        }
        if (v59 < 0)
          goto LABEL_157;
        v64 = v61 >> 3;
        if (v61 >> 3 <= v60)
          v64 = (v58 - v57) >> 4;
        v65 = (unint64_t)v61 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v64;
        if (v65 >> 60)
LABEL_157:
          std::vector<std::string>::__throw_length_error[abi:ne180100]();
        v66 = (char *)operator new(16 * v65);
        v67 = v66;
        *(_QWORD *)v128 = v66;
        *(_QWORD *)&v128[8] = v66;
        *(_QWORD *)&v128[16] = &v66[16 * v65];
        v68 = v66;
        if (v57 != v58)
        {
          memcpy(v66, v57, v59 & 0xFFFFFFFFFFFFFFF0);
          v68 = &v67[v59 & 0xFFFFFFFFFFFFFFF0];
        }
        v69 = v68 - v67;
        v36 = v63;
LABEL_95:
        *(_QWORD *)&v128[8] = &v67[v69];
LABEL_96:
        v79 = *(_QWORD *)v26;
        *(_QWORD *)&v128[29] = *(_QWORD *)(v26 + 5);
        *(_QWORD *)&v128[24] = v79;
        v20 = v36;
LABEL_97:
        v80 = v130;
        if (v20 == v23)
        {
          v81 = v129;
          while (v80 != v81)
          {
            v82 = (void *)*((_QWORD *)v80 - 5);
            if (v82)
            {
              *((_QWORD *)v80 - 4) = v82;
              operator delete(v82);
            }
            v83 = (void *)*((_QWORD *)v80 - 8);
            if (v83)
            {
              *((_QWORD *)v80 - 7) = v83;
              operator delete(v83);
            }
            v80 -= 96;
          }
          v130 = v81;
          v21 = 1;
          v20 = v23;
        }
        else
        {
          v84 = (void *)*((_QWORD *)v130 - 5);
          if (v84)
          {
            *((_QWORD *)v130 - 4) = v84;
            operator delete(v84);
          }
          v85 = (void *)*((_QWORD *)v80 - 8);
          if (v85)
          {
            *((_QWORD *)v80 - 7) = v85;
            operator delete(v85);
          }
          v130 = v80 - 96;
          v21 = 1;
        }
LABEL_18:
        v15 = v129;
        v11 = v130;
        if (v129 != v130)
          continue;
        if ((v21 & 1) == 0)
        {
          v6 = 0;
          v16 = *(void **)v128;
          if (!*(_QWORD *)v128)
            goto LABEL_151;
          goto LABEL_150;
        }
        v112 = *v120;
        *(_QWORD *)v112 = a2;
        *(_QWORD *)(v112 + 8) = &v20[(_QWORD)a2];
        *(_BYTE *)(v112 + 16) = 1;
        if (v127[0] != *(void **)&v126[32])
        {
          v113 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v127[0] - *(_QWORD *)&v126[32]) >> 3);
          v114 = (_BYTE *)(*(_QWORD *)&v126[32] + 16);
          v115 = 1;
          do
          {
            v116 = v112 + 24 * v115;
            *(_OWORD *)v116 = *((_OWORD *)v114 - 1);
            v117 = *v114;
            v114 += 24;
            *(_BYTE *)(v116 + 16) = v117;
            v24 = v113 > v115++;
          }
          while (v24);
        }
        v6 = 1;
        v16 = *(void **)v128;
        if (*(_QWORD *)v128)
        {
LABEL_150:
          *(_QWORD *)&v128[8] = v16;
          operator delete(v16);
        }
LABEL_151:
        if (*(_QWORD *)&v126[32])
        {
          v127[0] = *(void **)&v126[32];
          operator delete(*(void **)&v126[32]);
        }
        if (v15)
          operator delete(v15);
        return v6;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        goto LABEL_18;
      case 0xFFFFFC1F:
LABEL_31:
        v29 = v130;
        v30 = (void *)*((_QWORD *)v130 - 5);
        if (v30)
        {
          *((_QWORD *)v130 - 4) = v30;
          operator delete(v30);
        }
        v31 = (void *)*((_QWORD *)v29 - 8);
        if (v31)
        {
          *((_QWORD *)v29 - 7) = v31;
          operator delete(v31);
        }
        v130 = v29 - 96;
        goto LABEL_18;
      case 0xFFFFFC20:
        *(_QWORD *)&v32 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v124[64] = v32;
        *(_OWORD *)&v124[80] = v32;
        *(_OWORD *)&v124[32] = v32;
        *(_OWORD *)&v124[48] = v32;
        *(_OWORD *)v124 = v32;
        *(_OWORD *)&v124[16] = v32;
        std::__state<char>::__state((uint64_t)v124, (__int128 *)v11 - 6);
        (*(void (**)(_QWORD, uint64_t, char *))(**(_QWORD **)v26 + 24))(*(_QWORD *)v26, 1, v11 - 96);
        (*(void (**)(_QWORD, _QWORD, _BYTE *))(**(_QWORD **)&v124[80] + 24))(*(_QWORD *)&v124[80], 0, v124);
        v33 = v130;
        if ((unint64_t)v130 >= v131)
        {
          v130 = std::vector<std::__state<char>>::__push_back_slow_path<std::__state<char>>((void **)&v129, (uint64_t)v124);
          if (*(_QWORD *)&v124[56])
          {
            *(_QWORD *)&v124[64] = *(_QWORD *)&v124[56];
            operator delete(*(void **)&v124[56]);
          }
        }
        else
        {
          v34 = *(_OWORD *)&v124[16];
          *(_OWORD *)v130 = *(_OWORD *)v124;
          *((_OWORD *)v33 + 1) = v34;
          *((_QWORD *)v33 + 4) = 0;
          *((_QWORD *)v33 + 5) = 0;
          *((_QWORD *)v33 + 6) = 0;
          *((_QWORD *)v33 + 7) = 0;
          *((_OWORD *)v33 + 2) = *(_OWORD *)&v124[32];
          *((_QWORD *)v33 + 6) = *(_QWORD *)&v124[48];
          memset(&v124[32], 0, 24);
          *((_QWORD *)v33 + 8) = 0;
          *((_QWORD *)v33 + 9) = 0;
          *(_OWORD *)(v33 + 56) = *(_OWORD *)&v124[56];
          *((_QWORD *)v33 + 9) = *(_QWORD *)&v124[72];
          memset(&v124[56], 0, 24);
          v35 = *(_QWORD *)&v124[80];
          *(_QWORD *)(v33 + 85) = *(_QWORD *)&v124[85];
          *((_QWORD *)v33 + 10) = v35;
          v130 = v33 + 96;
        }
        if (*(_QWORD *)&v124[32])
        {
          *(_QWORD *)&v124[40] = *(_QWORD *)&v124[32];
          operator delete(*(void **)&v124[32]);
        }
        goto LABEL_18;
      default:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)16>();
    }
  }
}

void sub_212480618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  uint64_t v37;

  std::__state<char>::~__state(&a37);
  std::vector<std::__state<char>>::~vector[abi:ne180100]((void **)(v37 - 120));
  _Unwind_Resume(a1);
}

uint64_t std::deque<std::__state<char>>::~deque[abi:ne180100](uint64_t a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  void **v5;
  char *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(void ***)(a1 + 8);
  v3 = *(void ***)(a1 + 16);
  if (v3 == v2)
  {
    v3 = *(void ***)(a1 + 8);
    *(_QWORD *)(a1 + 40) = 0;
    v11 = 0;
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = &v2[v4 / 0x2A];
    v6 = (char *)*v5 + 96 * (v4 % 0x2A);
    v7 = (unint64_t)v2[(*(_QWORD *)(a1 + 40) + v4) / 0x2A] + 96 * ((*(_QWORD *)(a1 + 40) + v4) % 0x2A);
    if (v6 != (char *)v7)
    {
      do
      {
        v8 = (void *)*((_QWORD *)v6 + 7);
        if (v8)
        {
          *((_QWORD *)v6 + 8) = v8;
          operator delete(v8);
        }
        v9 = (void *)*((_QWORD *)v6 + 4);
        if (v9)
        {
          *((_QWORD *)v6 + 5) = v9;
          operator delete(v9);
        }
        v6 += 96;
        if (v6 - (_BYTE *)*v5 == 4032)
        {
          v10 = (char *)v5[1];
          ++v5;
          v6 = v10;
        }
      }
      while (v6 != (char *)v7);
      v2 = *(void ***)(a1 + 8);
      v3 = *(void ***)(a1 + 16);
    }
    *(_QWORD *)(a1 + 40) = 0;
    v11 = (char *)v3 - (char *)v2;
    if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
    {
      do
      {
        operator delete(*v2);
        v3 = *(void ***)(a1 + 16);
        v2 = (void **)(*(_QWORD *)(a1 + 8) + 8);
        *(_QWORD *)(a1 + 8) = v2;
        v11 = (char *)v3 - (char *)v2;
      }
      while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
    }
  }
  v12 = v11 >> 3;
  if (v12 == 1)
  {
    v13 = 21;
    goto LABEL_19;
  }
  if (v12 == 2)
  {
    v13 = 42;
LABEL_19:
    *(_QWORD *)(a1 + 32) = v13;
  }
  if (v2 != v3)
  {
    do
    {
      v14 = *v2++;
      operator delete(v14);
    }
    while (v2 != v3);
    v16 = *(_QWORD *)(a1 + 8);
    v15 = *(_QWORD *)(a1 + 16);
    if (v15 != v16)
      *(_QWORD *)(a1 + 16) = v15 + ((v16 - v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::deque<std::__state<char>>::__add_back_capacity(uint64_t a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  char *v5;
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  void *v26;
  char *v27;
  char *v28;
  char *v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  BOOL v38;
  int64_t v39;
  unint64_t v40;
  char *v41;
  _QWORD *v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  int64_t v46;
  unint64_t v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _OWORD *v56;
  unint64_t v57;
  char *v58;
  char *v59;
  unint64_t v60;
  int64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 *v68;
  char *v69;
  uint64_t v70;
  __int128 v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  __int128 *v76;
  _OWORD *v77;
  uint64_t v78;
  __int128 v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  __int128 *v84;
  _OWORD *v85;
  uint64_t v86;
  __int128 v87;
  uint64_t v88;
  void *v89;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = v2 >= 0x2A;
  v4 = v2 - 42;
  if (v3)
  {
    *(_QWORD *)(a1 + 32) = v4;
    v6 = *(_QWORD **)(a1 + 8);
    v5 = *(char **)(a1 + 16);
    v7 = (char *)(v6 + 1);
    v8 = *v6;
    *(_QWORD *)(a1 + 8) = v6 + 1;
    if (v5 != *(char **)(a1 + 24))
    {
LABEL_76:
      *(_QWORD *)v5 = v8;
      *(_QWORD *)(a1 + 16) += 8;
      return;
    }
    v9 = *(char **)a1;
    v10 = (uint64_t)&v7[-*(_QWORD *)a1];
    if ((unint64_t)v7 <= *(_QWORD *)a1)
    {
      v32 = (v5 - v9) >> 2;
      if (v5 == v9)
        v32 = 1;
      if (!(v32 >> 61))
      {
        v33 = v32 >> 2;
        v34 = 8 * v32;
        v35 = (char *)operator new(8 * v32);
        v36 = &v35[8 * v33];
        v37 = &v35[v34];
        v39 = v5 - v7;
        v38 = v5 == v7;
        v5 = v36;
        if (!v38)
        {
          v5 = &v36[v39 & 0xFFFFFFFFFFFFFFF8];
          v40 = v39 - 8;
          if ((unint64_t)(v39 - 8) >= 0x38)
          {
            v73 = &v35[8 * v33];
            v41 = v73;
            if ((unint64_t)(v73 - v7) >= 0x20)
            {
              v74 = (v40 >> 3) + 1;
              v75 = 8 * (v74 & 0x3FFFFFFFFFFFFFFCLL);
              v41 = &v36[v75];
              v7 += v75;
              v76 = (__int128 *)(v6 + 3);
              v77 = v73 + 16;
              v78 = v74 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v79 = *v76;
                *(v77 - 1) = *(v76 - 1);
                *v77 = v79;
                v76 += 2;
                v77 += 2;
                v78 -= 4;
              }
              while (v78);
              if (v74 == (v74 & 0x3FFFFFFFFFFFFFFCLL))
                goto LABEL_74;
            }
          }
          else
          {
            v41 = &v35[8 * v33];
          }
          do
          {
            v80 = *(_QWORD *)v7;
            v7 += 8;
            *(_QWORD *)v41 = v80;
            v41 += 8;
          }
          while (v41 != v5);
        }
        goto LABEL_74;
      }
LABEL_85:
      std::__throw_bad_array_new_length[abi:ne180100]();
    }
LABEL_5:
    v11 = v10 >> 3;
    if (v11 >= -1)
      v12 = v11 + 1;
    else
      v12 = v11 + 2;
    v13 = v12 >> 1;
    v14 = -v13;
    v15 = &v7[-8 * v13];
    v16 = v5 - v7;
    if (v5 != v7)
    {
      memmove(&v7[-8 * v13], v7, v5 - v7);
      v7 = *(char **)(a1 + 8);
    }
    v5 = &v15[v16];
    *(_QWORD *)(a1 + 8) = &v7[8 * v14];
    *(_QWORD *)(a1 + 16) = &v15[v16];
    goto LABEL_76;
  }
  v18 = *(_QWORD *)(a1 + 16);
  v17 = *(_QWORD *)(a1 + 24);
  v19 = *(_QWORD *)(a1 + 8);
  v20 = v18 - v19;
  v21 = (v18 - v19) >> 3;
  v22 = v17 - *(_QWORD *)a1;
  if (v21 < (unint64_t)(v22 >> 3))
  {
    if (v17 != v18)
    {
      v89 = operator new(0xFC0uLL);
      std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back((char **)a1, &v89);
      return;
    }
    v89 = operator new(0xFC0uLL);
    std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front((void **)a1, &v89);
    v42 = *(_QWORD **)(a1 + 8);
    v5 = *(char **)(a1 + 16);
    v7 = (char *)(v42 + 1);
    v8 = *v42;
    *(_QWORD *)(a1 + 8) = v42 + 1;
    if (v5 != *(char **)(a1 + 24))
      goto LABEL_76;
    v9 = *(char **)a1;
    v10 = (uint64_t)&v7[-*(_QWORD *)a1];
    if ((unint64_t)v7 <= *(_QWORD *)a1)
    {
      v43 = (v5 - v9) >> 2;
      if (v5 == v9)
        v43 = 1;
      if (!(v43 >> 61))
      {
        v44 = v43 >> 2;
        v45 = 8 * v43;
        v35 = (char *)operator new(8 * v43);
        v36 = &v35[8 * v44];
        v37 = &v35[v45];
        v46 = v5 - v7;
        v38 = v5 == v7;
        v5 = v36;
        if (!v38)
        {
          v5 = &v36[v46 & 0xFFFFFFFFFFFFFFF8];
          v47 = v46 - 8;
          if ((unint64_t)(v46 - 8) >= 0x38)
          {
            v81 = &v35[8 * v44];
            v48 = v81;
            if ((unint64_t)(v81 - v7) >= 0x20)
            {
              v82 = (v47 >> 3) + 1;
              v83 = 8 * (v82 & 0x3FFFFFFFFFFFFFFCLL);
              v48 = &v36[v83];
              v7 += v83;
              v84 = (__int128 *)(v42 + 3);
              v85 = v81 + 16;
              v86 = v82 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                v87 = *v84;
                *(v85 - 1) = *(v84 - 1);
                *v85 = v87;
                v84 += 2;
                v85 += 2;
                v86 -= 4;
              }
              while (v86);
              if (v82 == (v82 & 0x3FFFFFFFFFFFFFFCLL))
                goto LABEL_74;
            }
          }
          else
          {
            v48 = &v35[8 * v44];
          }
          do
          {
            v88 = *(_QWORD *)v7;
            v7 += 8;
            *(_QWORD *)v48 = v88;
            v48 += 8;
          }
          while (v48 != v5);
        }
LABEL_74:
        *(_QWORD *)a1 = v35;
        *(_QWORD *)(a1 + 8) = v36;
        *(_QWORD *)(a1 + 16) = v5;
        *(_QWORD *)(a1 + 24) = v37;
        if (v9)
        {
          operator delete(v9);
          v5 = *(char **)(a1 + 16);
        }
        goto LABEL_76;
      }
      goto LABEL_85;
    }
    goto LABEL_5;
  }
  v23 = v22 >> 2;
  if (v17 == *(_QWORD *)a1)
    v24 = 1;
  else
    v24 = v23;
  if (v24 >> 61)
    goto LABEL_85;
  v25 = (char *)operator new(8 * v24);
  v26 = operator new(0xFC0uLL);
  v27 = &v25[8 * v21];
  v28 = &v25[8 * v24];
  if (v21 == v24)
  {
    v30 = v26;
    if (v20 < 1)
    {
      if (v18 == v19)
        v49 = 1;
      else
        v49 = v20 >> 2;
      if (v49 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v27 = (char *)operator new(8 * v49);
      v28 = &v27[8 * v49];
      operator delete(v25);
      v50 = *(_QWORD *)(a1 + 8);
      v18 = *(_QWORD *)(a1 + 16);
      v25 = v27;
      *(_QWORD *)v27 = v30;
      v29 = v27 + 8;
      if (v18 == v50)
        goto LABEL_45;
    }
    else
    {
      v31 = v21 + 2;
      if (v21 >= -1)
        v31 = v21 + 1;
      v27 -= 8 * (v31 >> 1);
      *(_QWORD *)v27 = v26;
      v29 = v27 + 8;
      if (v18 == v19)
        goto LABEL_45;
    }
    goto LABEL_49;
  }
  *(_QWORD *)v27 = v26;
  v29 = v27 + 8;
  if (v18 != v19)
  {
    do
    {
LABEL_49:
      if (v27 == v25)
      {
        if (v29 >= v28)
        {
          if (v28 == v25)
            v57 = 1;
          else
            v57 = (v28 - v25) >> 2;
          if (v57 >> 61)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v58 = (char *)operator new(8 * v57);
          v59 = v58;
          v60 = (v57 + 3) >> 2;
          v27 = &v58[8 * v60];
          v61 = v29 - v25;
          v38 = v29 == v25;
          v29 = v27;
          if (!v38)
          {
            v29 = &v27[v61 & 0xFFFFFFFFFFFFFFF8];
            v62 = v61 - 8;
            v63 = &v58[8 * v60];
            v64 = v25;
            if (v62 < 0x38)
              goto LABEL_89;
            v65 = 8 * v60;
            v63 = &v58[8 * v60];
            v64 = v25;
            if ((unint64_t)(v63 - v25) < 0x20)
              goto LABEL_89;
            v66 = (v62 >> 3) + 1;
            v67 = 8 * (v66 & 0x3FFFFFFFFFFFFFFCLL);
            v63 = &v27[v67];
            v64 = &v25[v67];
            v68 = (__int128 *)(v25 + 16);
            v69 = &v58[v65 + 16];
            v70 = v66 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              v71 = *v68;
              *((_OWORD *)v69 - 1) = *(v68 - 1);
              *(_OWORD *)v69 = v71;
              v68 += 2;
              v69 += 32;
              v70 -= 4;
            }
            while (v70);
            if (v66 != (v66 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_89:
              do
              {
                v72 = *(_QWORD *)v64;
                v64 += 8;
                *(_QWORD *)v63 = v72;
                v63 += 8;
              }
              while (v63 != v29);
            }
          }
          v28 = &v58[8 * v57];
          operator delete(v25);
          v25 = v59;
        }
        else
        {
          v53 = (v28 - v29) >> 3;
          if (v53 >= -1)
            v54 = v53 + 1;
          else
            v54 = v53 + 2;
          v55 = v54 >> 1;
          v27 = &v25[8 * (v54 >> 1)];
          v56 = v25;
          if (v29 != v25)
          {
            memmove(v27, v25, v29 - v25);
            v56 = v29;
          }
          v29 = (char *)v56 + 8 * v55;
        }
      }
      v52 = *(_QWORD *)(v18 - 8);
      v18 -= 8;
      *((_QWORD *)v27 - 1) = v52;
      v27 -= 8;
    }
    while (v18 != *(_QWORD *)(a1 + 8));
  }
LABEL_45:
  v51 = *(char **)a1;
  *(_QWORD *)a1 = v25;
  *(_QWORD *)(a1 + 8) = v27;
  *(_QWORD *)(a1 + 16) = v29;
  *(_QWORD *)(a1 + 24) = v28;
  if (v51)
    operator delete(v51);
}

void sub_212480D60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v2);
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_back(char **a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  BOOL v19;
  int64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  __int128 *v27;
  _OWORD *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;

  v4 = a1[2];
  if (v4 != a1[3])
    goto LABEL_22;
  v5 = *a1;
  v6 = a1[1];
  if (v6 > *a1)
  {
    v7 = (v6 - *a1) >> 3;
    if (v7 >= -1)
      v8 = v7 + 1;
    else
      v8 = v7 + 2;
    v9 = v8 >> 1;
    v10 = -v9;
    v11 = &v6[-8 * v9];
    v12 = v4 - v6;
    if (v4 != v6)
    {
      memmove(&v6[-8 * v9], a1[1], v4 - v6);
      v4 = a1[1];
    }
    v13 = &v4[8 * v10];
    v4 = &v11[v12];
    a1[1] = v13;
    a1[2] = &v11[v12];
    goto LABEL_22;
  }
  v14 = (v4 - v5) >> 2;
  if (v4 == v5)
    v14 = 1;
  if (v14 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v15 = v14 >> 2;
  v16 = 8 * v14;
  v17 = (char *)operator new(8 * v14);
  v18 = &v17[8 * v15];
  v20 = v4 - v6;
  v19 = v4 == v6;
  v4 = v18;
  if (!v19)
  {
    v4 = &v18[v20 & 0xFFFFFFFFFFFFFFF8];
    v21 = v20 - 8;
    if ((unint64_t)(v20 - 8) < 0x38)
    {
      v22 = &v17[8 * v15];
      do
      {
LABEL_19:
        v31 = *(_QWORD *)v6;
        v6 += 8;
        *(_QWORD *)v22 = v31;
        v22 += 8;
      }
      while (v22 != v4);
      goto LABEL_20;
    }
    v23 = &v17[8 * v15];
    v22 = v23;
    if ((unint64_t)(v23 - v6) < 0x20)
      goto LABEL_19;
    v24 = (v21 >> 3) + 1;
    v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
    v22 = &v18[v25];
    v26 = &v6[v25];
    v27 = (__int128 *)(v6 + 16);
    v28 = v23 + 16;
    v29 = v24 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v30 = *v27;
      *(v28 - 1) = *(v27 - 1);
      *v28 = v30;
      v27 += 2;
      v28 += 2;
      v29 -= 4;
    }
    while (v29);
    v6 = v26;
    if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
      goto LABEL_19;
  }
LABEL_20:
  *a1 = v17;
  a1[1] = v18;
  a1[2] = v4;
  a1[3] = &v17[v16];
  if (v5)
  {
    operator delete(v5);
    v4 = a1[2];
  }
LABEL_22:
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<std::__state<char> *,std::allocator<std::__state<char> *>>::push_front(void **a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 *v26;
  _OWORD *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v4 = (char *)a1[1];
  if (v4 == *a1)
  {
    v7 = a1[2];
    v6 = a1[3];
    if (v7 >= v6)
    {
      v13 = v6 - v4;
      v12 = v13 == 0;
      v14 = v13 >> 2;
      if (v12)
        v14 = 1;
      if (v14 >> 61)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v15 = (v14 + 3) >> 2;
      v16 = 8 * v14;
      v17 = (char *)operator new(8 * v14);
      v5 = &v17[8 * v15];
      v18 = v5;
      v19 = v7 - v4;
      if (v7 != v4)
      {
        v18 = &v5[v19 & 0xFFFFFFFFFFFFFFF8];
        v20 = v19 - 8;
        v21 = &v17[8 * v15];
        v22 = v4;
        if (v20 < 0x38)
          goto LABEL_27;
        v23 = &v17[8 * v15];
        v21 = v23;
        v22 = v4;
        if ((unint64_t)(v23 - v4) < 0x20)
          goto LABEL_27;
        v24 = (v20 >> 3) + 1;
        v25 = 8 * (v24 & 0x3FFFFFFFFFFFFFFCLL);
        v21 = &v5[v25];
        v22 = &v4[v25];
        v26 = (__int128 *)(v4 + 16);
        v27 = v23 + 16;
        v28 = v24 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          v29 = *v26;
          *(v27 - 1) = *(v26 - 1);
          *v27 = v29;
          v26 += 2;
          v27 += 2;
          v28 -= 4;
        }
        while (v28);
        if (v24 != (v24 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_27:
          do
          {
            v30 = *(_QWORD *)v22;
            v22 += 8;
            *(_QWORD *)v21 = v30;
            v21 += 8;
          }
          while (v21 != v18);
        }
      }
      *a1 = v17;
      a1[1] = v5;
      a1[2] = v18;
      a1[3] = &v17[v16];
      if (v4)
      {
        operator delete(v4);
        v5 = (char *)a1[1];
      }
    }
    else
    {
      v8 = (v6 - v7) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v11 = &v7[8 * (v9 >> 1)];
      v5 = &v11[-(v7 - v4)];
      if (v7 != v4)
      {
        memmove(&v11[-(v7 - v4)], v4, v7 - v4);
        v4 = (char *)a1[2];
      }
      a1[1] = v5;
      a1[2] = &v4[8 * v10];
    }
  }
  else
  {
    v5 = (char *)a1[1];
  }
  *((_QWORD *)v5 - 1) = *a2;
  a1[1] = (char *)a1[1] - 8;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char> *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  std::basic_regex<char> *v14;
  std::basic_regex<char> *v15;
  _QWORD *v16;
  uint64_t v17;
  std::basic_regex<char>::value_type *v19;
  std::basic_regex<char>::value_type *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  std::basic_regex<char> *v32;
  std::basic_regex<char> *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  std::basic_regex<char>::value_type *v43;
  std::basic_regex<char>::value_type *v44;

  v6 = operator new(8uLL);
  *v6 = off_24CDC0C10;
  v7 = operator new(0x10uLL);
  v7[1] = v6;
  v8 = operator new(0x20uLL);
  *v8 = off_24CDC0C68;
  v8[1] = 0;
  v8[2] = 0;
  v8[3] = v7;
  v9 = *(std::__shared_weak_count **)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  if (!v9)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (v11)
  {
LABEL_5:
    v12 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 56) = v12;
    v13 = *(_DWORD *)(a1 + 24) & 0x1F0;
    if (v13 <= 0x3F)
      goto LABEL_6;
LABEL_11:
    switch(v13)
    {
      case 0x40u:
        return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
      case 0x80u:
        v19 = (std::basic_regex<char>::value_type *)memchr(a2, 10, (char *)a3 - a2);
        if (v19)
          v20 = v19;
        else
          v20 = (std::basic_regex<char>::value_type *)a3;
        if (v20 == a2)
        {
          v21 = operator new(0x10uLL);
          v22 = *(_QWORD *)(v12 + 8);
          v21[1] = v22;
          *(_QWORD *)(v12 + 8) = v21;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          if (v20 != (std::basic_regex<char>::value_type *)a3)
            ++v20;
          if (v20 == (std::basic_regex<char>::value_type *)a3)
            return a3;
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)a2, v20);
          if (v20 != (std::basic_regex<char>::value_type *)a3)
            ++v20;
          if (v20 == (std::basic_regex<char>::value_type *)a3)
            return a3;
        }
        v34 = *(_QWORD *)(a1 + 56);
        do
        {
          v43 = (std::basic_regex<char>::value_type *)memchr(v20, 10, (char *)a3 - v20);
          if (v43)
            v44 = v43;
          else
            v44 = (std::basic_regex<char>::value_type *)a3;
          if (v44 == v20)
          {
            v35 = operator new(0x10uLL);
            v36 = *(_QWORD *)(v34 + 8);
            v35[1] = v36;
            *(_QWORD *)(v34 + 8) = v35;
            *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)v20, v44);
          }
          v37 = operator new(0x18uLL);
          v38 = *(_QWORD *)(v34 + 8);
          v37[1] = *(_QWORD *)(v12 + 8);
          v37[2] = v38;
          *v37 = &off_24CDC1228;
          *(_QWORD *)(v12 + 8) = v37;
          *(_QWORD *)(v34 + 8) = 0;
          v39 = operator new(0x10uLL);
          v40 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v39[1] = v40;
          *(_QWORD *)(v34 + 8) = v39;
          *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
          v41 = operator new(0x10uLL);
          v42 = *(_QWORD *)(v34 + 8);
          *v41 = off_24CDC1270;
          v41[1] = v42;
          *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v41;
          v34 = *(_QWORD *)(v34 + 8);
          *(_QWORD *)(a1 + 56) = v34;
          if (v44 == (std::basic_regex<char>::value_type *)a3)
            v20 = v44;
          else
            v20 = v44 + 1;
        }
        while (v20 != (std::basic_regex<char>::value_type *)a3);
        break;
      case 0x100u:
        v14 = (std::basic_regex<char> *)memchr(a2, 10, (char *)a3 - a2);
        if (v14)
          v15 = v14;
        else
          v15 = a3;
        if (v15 == (std::basic_regex<char> *)a2)
        {
          v16 = operator new(0x10uLL);
          v17 = *(_QWORD *)(v12 + 8);
          v16[1] = v17;
          *(_QWORD *)(v12 + 8) = v16;
          *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          if (v15 != a3)
            v15 = (std::basic_regex<char> *)((char *)v15 + 1);
          if (v15 == a3)
            return a3;
        }
        else
        {
          std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, v15);
          if (v15 != a3)
            v15 = (std::basic_regex<char> *)((char *)v15 + 1);
          if (v15 == a3)
            return a3;
        }
        v23 = *(_QWORD *)(a1 + 56);
        do
        {
          v32 = (std::basic_regex<char> *)memchr(v15, 10, (char *)a3 - (char *)v15);
          if (v32)
            v33 = v32;
          else
            v33 = a3;
          if (v33 == v15)
          {
            v24 = operator new(0x10uLL);
            v25 = *(_QWORD *)(v23 + 8);
            v24[1] = v25;
            *(_QWORD *)(v23 + 8) = v24;
            *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          }
          else
          {
            std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (std::basic_regex<char>::value_type *)v15, v33);
          }
          v26 = operator new(0x18uLL);
          v27 = *(_QWORD *)(v23 + 8);
          v26[1] = *(_QWORD *)(v12 + 8);
          v26[2] = v27;
          *v26 = &off_24CDC1228;
          *(_QWORD *)(v12 + 8) = v26;
          *(_QWORD *)(v23 + 8) = 0;
          v28 = operator new(0x10uLL);
          v29 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v28[1] = v29;
          *(_QWORD *)(v23 + 8) = v28;
          *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
          v30 = operator new(0x10uLL);
          v31 = *(_QWORD *)(v23 + 8);
          *v30 = off_24CDC1270;
          v30[1] = v31;
          *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v30;
          v23 = *(_QWORD *)(v23 + 8);
          *(_QWORD *)(a1 + 56) = v23;
          if (v33 == a3)
            v15 = v33;
          else
            v15 = (std::basic_regex<char> *)((char *)&v33->__traits_.__loc_.__locale_ + 1);
        }
        while (v15 != a3);
        break;
      default:
        goto LABEL_62;
    }
    return a3;
  }
  ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
  std::__shared_weak_count::__release_weak(v9);
  v12 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 56) = v12;
  v13 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v13 > 0x3F)
    goto LABEL_11;
LABEL_6:
  if (!v13)
    return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, (char *)a3);
  if (v13 != 16)
  {
    if (v13 != 32)
LABEL_62:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)14>();
    return std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, a2, a3);
  }
  return (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char> *)a2, (std::basic_regex<char>::value_type *)a3);
}

void sub_212481500(_Unwind_Exception *a1)
{
  void *v1;
  void (__cdecl ***v2)(std::__owns_one_state<char> *__hidden);

  operator delete(v1);
  operator delete(v2);
  (*(void (**)(void *))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_212481538(_Unwind_Exception *a1)
{
  void *v1;

  std::__end_state<char>::~__end_state(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, char *a2, char *a3)
{
  std::__owns_one_state<char> *end;
  char *v7;
  std::basic_regex<char>::value_type *v8;
  std::__owns_one_state<char> *v9;
  unsigned int marked_count;
  std::basic_regex<char> *v11;
  std::__node<char> *v12;
  std::__owns_one_state<char> *v13;
  std::__node<char> *first;
  std::__node<char> *v15;
  std::__node<char> *v16;
  std::__node<char> *v17;
  std::__node<char> *v18;
  std::__node<char> *v19;
  std::__node<char> *v20;
  std::__owns_one_state<char> *v21;
  std::basic_regex<char>::value_type *v22;
  char *v23;
  std::__owns_one_state<char> *v24;
  unsigned int v25;
  std::basic_regex<char> *v26;
  std::__node<char> *v27;
  std::__owns_one_state<char> *v28;
  std::__node<char> *v29;

  end = a1->__end_;
  v7 = a2;
  while (1)
  {
    v8 = v7;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>((uint64_t)a1, v7, a3);
    if (v8 == v7)
      break;
LABEL_2:
    if (v7 == v8)
      goto LABEL_6;
  }
  v9 = a1->__end_;
  marked_count = a1->__marked_count_;
  v11 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(a1, v8, a3);
  if (v8 != (std::basic_regex<char>::value_type *)v11)
  {
    v7 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v11, (std::basic_regex<char> *)a3, v9, marked_count + 1, a1->__marked_count_ + 1);
    goto LABEL_2;
  }
LABEL_6:
  if (v8 != a2)
  {
    if (v8 != a3)
      goto LABEL_14;
    return a3;
  }
  v12 = (std::__node<char> *)operator new(0x10uLL);
  v13 = a1->__end_;
  first = v13->__first_;
  v12[1].__vftable = (std::__node<char>_vtbl *)first;
  v13->__first_ = v12;
  a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
  if (v8 != a3)
  {
LABEL_14:
    if (*v8 != 124)
      return v8;
    v21 = a1->__end_;
    v22 = v8 + 1;
    v23 = v8 + 1;
    while (1)
    {
      v8 = v23;
      v23 = std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>((uint64_t)a1, v23, a3);
      if (v8 == v23)
      {
        v24 = a1->__end_;
        v25 = a1->__marked_count_;
        v26 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(a1, v8, a3);
        if (v8 == (std::basic_regex<char>::value_type *)v26)
        {
LABEL_11:
          if (v8 == v22)
          {
            v27 = (std::__node<char> *)operator new(0x10uLL);
            v28 = a1->__end_;
            v29 = v28->__first_;
            v27[1].__vftable = (std::__node<char>_vtbl *)v29;
            v28->__first_ = v27;
            a1->__end_ = (std::__owns_one_state<char> *)a1->__end_->__first_;
          }
          v15 = (std::__node<char> *)operator new(0x18uLL);
          v16 = v21->__first_;
          v15[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
          v15[2].__vftable = (std::__node<char>_vtbl *)v16;
          v15->__vftable = (std::__node<char>_vtbl *)&off_24CDC1228;
          end->__first_ = v15;
          v21->__first_ = 0;
          v17 = (std::__node<char> *)operator new(0x10uLL);
          v18 = a1->__end_->__first_;
          v17[1].__vftable = (std::__node<char>_vtbl *)v18;
          v21->__first_ = v17;
          a1->__end_->__first_ = 0;
          v19 = (std::__node<char> *)operator new(0x10uLL);
          v20 = v21->__first_;
          v19->__vftable = (std::__node<char>_vtbl *)off_24CDC1270;
          v19[1].__vftable = (std::__node<char>_vtbl *)v20;
          a1->__end_->__first_ = v19;
          a1->__end_ = (std::__owns_one_state<char> *)v21->__first_;
          if (v8 == a3)
            return a3;
          goto LABEL_14;
        }
        v23 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)a1, v26, (std::basic_regex<char> *)a3, v24, v25 + 1, a1->__marked_count_ + 1);
      }
      if (v23 == v8)
        goto LABEL_11;
    }
  }
  return a3;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_basic_reg_exp<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *a2, std::basic_regex<char>::value_type *a3)
{
  std::basic_regex<char> *v3;
  _QWORD *v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  std::basic_regex<char>::value_type *v10;
  std::__owns_one_state<char> *v11;
  int v12;
  std::basic_regex<char> *v13;
  _QWORD *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  if (a2 == (std::basic_regex<char> *)a3)
    return (std::basic_regex<char>::value_type *)a2;
  if (LOBYTE(a2->__traits_.__loc_.__locale_) == 94)
  {
    v6 = operator new(0x18uLL);
    v7 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(v8 + 8);
    *v6 = &off_24CDC0D60;
    v6[1] = v9;
    *((_BYTE *)v6 + 16) = v7;
    *(_QWORD *)(v8 + 8) = v6;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v3 = (std::basic_regex<char> *)((char *)v3 + 1);
  }
  if (v3 != (std::basic_regex<char> *)a3)
  {
    while (v3 != (std::basic_regex<char> *)a3)
    {
      v10 = (std::basic_regex<char>::value_type *)v3;
      v11 = *(std::__owns_one_state<char> **)(a1 + 56);
      v12 = *(_DWORD *)(a1 + 28);
      v13 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, v10, a3);
      if (v10 != (std::basic_regex<char>::value_type *)v13)
      {
        v3 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v13, (std::basic_regex<char> *)a3, v11, (v12 + 1), (*(_DWORD *)(a1 + 28) + 1));
        if (v10 != (std::basic_regex<char>::value_type *)v3)
          continue;
      }
      if (v10 + 1 != a3 || *v10 != 36)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
      v14 = operator new(0x18uLL);
      v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v16 = *(_QWORD *)(a1 + 56);
      v17 = *(_QWORD *)(v16 + 8);
      *v14 = &off_24CDC0DA8;
      v14[1] = v17;
      *((_BYTE *)v14 + 16) = v15;
      *(_QWORD *)(v16 + 8) = v14;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      return a3;
    }
  }
  return a3;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char> *a3)
{
  std::__owns_one_state<char> *end;
  std::basic_regex<char> *v7;
  std::basic_regex<char> *v8;
  std::__owns_one_state<char> *v9;
  std::basic_regex<char> *v10;
  std::basic_regex<char> *v11;
  std::__node<char> *v12;
  std::__node<char> *first;
  std::__node<char> *v14;
  std::__node<char> *v15;
  std::__node<char> *v16;
  std::__node<char> *v17;

  end = a1->__end_;
  v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
  if (v7 == (std::basic_regex<char> *)a2)
    goto LABEL_12;
  do
  {
    v8 = v7;
    v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char>::value_type *)v7, a3);
  }
  while (v8 != v7);
  if (v8 == (std::basic_regex<char> *)a2)
LABEL_12:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)15>();
  if (v8 == a3)
    return a3;
  while (LOBYTE(v8->__traits_.__loc_.__locale_) == 124)
  {
    v9 = a1->__end_;
    v10 = (std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1);
    v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char>::value_type *)&v8->__traits_.__loc_.__locale_ + 1, a3);
    if ((std::basic_regex<char> *)((char *)&v8->__traits_.__loc_.__locale_ + 1) == v11)
      goto LABEL_12;
    do
    {
      v8 = v11;
      v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(a1, (std::basic_regex<char>::value_type *)v11, a3);
    }
    while (v8 != v11);
    if (v8 == v10)
      goto LABEL_12;
    v12 = (std::__node<char> *)operator new(0x18uLL);
    first = v9->__first_;
    v12[1].__vftable = (std::__node<char>_vtbl *)end->__first_;
    v12[2].__vftable = (std::__node<char>_vtbl *)first;
    v12->__vftable = (std::__node<char>_vtbl *)&off_24CDC1228;
    end->__first_ = v12;
    v9->__first_ = 0;
    v14 = (std::__node<char> *)operator new(0x10uLL);
    v15 = a1->__end_->__first_;
    v14[1].__vftable = (std::__node<char>_vtbl *)v15;
    v9->__first_ = v14;
    a1->__end_->__first_ = 0;
    v16 = (std::__node<char> *)operator new(0x10uLL);
    v17 = v9->__first_;
    v16->__vftable = (std::__node<char>_vtbl *)off_24CDC1270;
    v16[1].__vftable = (std::__node<char>_vtbl *)v17;
    a1->__end_->__first_ = v16;
    a1->__end_ = (std::__owns_one_state<char> *)v9->__first_;
    if (v8 == a3)
      return a3;
  }
  return v8;
}

char *std::basic_regex<char,std::regex_traits<char>>::__parse_assertion<std::__wrap_iter<char const*>>(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  int v6;
  int v7;
  __int128 v8;
  char *v9;
  unsigned int v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (**v15)();
  int v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  unsigned int marked_count;
  std::basic_regex<char> v23;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v6 = *a2;
  if (v6 > 91)
  {
    if (v6 == 92)
    {
      if (a2 + 1 != a3)
      {
        v17 = a2[1];
        if (v17 == 66)
        {
          v18 = (char *)operator new(0x30uLL);
          v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          *(_QWORD *)v18 = off_24CDC0DF0;
          *((_QWORD *)v18 + 1) = v20;
          std::locale::locale((std::locale *)v18 + 2, (const std::locale *)a1);
          *(_OWORD *)(v18 + 24) = *(_OWORD *)(a1 + 8);
          v18[40] = 1;
        }
        else
        {
          if (v17 != 98)
            return v3;
          v18 = (char *)operator new(0x30uLL);
          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          *(_QWORD *)v18 = off_24CDC0DF0;
          *((_QWORD *)v18 + 1) = v19;
          std::locale::locale((std::locale *)v18 + 2, (const std::locale *)a1);
          *(_OWORD *)(v18 + 24) = *(_OWORD *)(a1 + 8);
          v18[40] = 0;
        }
        *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v18;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        return v3 + 2;
      }
      return v3;
    }
    if (v6 != 94)
      return v3;
    v11 = operator new(0x18uLL);
    v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v13 = *(_QWORD *)(a1 + 56);
    v14 = *(_QWORD *)(v13 + 8);
    v15 = &off_24CDC0D60;
LABEL_17:
    *v11 = v15;
    v11[1] = v14;
    *((_BYTE *)v11 + 16) = v12;
    *(_QWORD *)(v13 + 8) = v11;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    return ++v3;
  }
  if (v6 == 36)
  {
    v11 = operator new(0x18uLL);
    v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v13 = *(_QWORD *)(a1 + 56);
    v14 = *(_QWORD *)(v13 + 8);
    v15 = &off_24CDC0DA8;
    goto LABEL_17;
  }
  if (v6 != 40 || a2 + 1 == a3 || a2[1] != 63 || a2 + 2 == a3)
    return v3;
  v7 = a2[2];
  if (v7 == 33)
  {
    *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v23.__loop_count_ = v21;
    *(_OWORD *)&v23.__start_.__cntrl_ = v21;
    *(_OWORD *)&v23.__traits_.__loc_.__locale_ = v21;
    *(_OWORD *)&v23.__traits_.__col_ = v21;
    std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v23);
    v23.__flags_ = *(_DWORD *)(a1 + 24);
    v9 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v23, v3 + 3, a3);
    marked_count = v23.__marked_count_;
    std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v23, 1, *(_DWORD *)(a1 + 28));
    *(_DWORD *)(a1 + 28) += marked_count;
    if (v9 == a3 || *v9 != 41)
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    goto LABEL_27;
  }
  if (v7 != 61)
    return v3;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v23.__loop_count_ = v8;
  *(_OWORD *)&v23.__start_.__cntrl_ = v8;
  *(_OWORD *)&v23.__traits_.__loc_.__locale_ = v8;
  *(_OWORD *)&v23.__traits_.__col_ = v8;
  std::basic_regex<char,std::regex_traits<char>>::basic_regex[abi:ne180100]((uint64_t)&v23);
  v23.__flags_ = *(_DWORD *)(a1 + 24);
  v9 = (char *)std::basic_regex<char,std::regex_traits<char>>::__parse<std::__wrap_iter<char const*>>(&v23, v3 + 3, a3);
  v10 = v23.__marked_count_;
  std::basic_regex<char,std::regex_traits<char>>::__push_lookahead((std::basic_regex<char> *)a1, &v23, 0, *(_DWORD *)(a1 + 28));
  *(_DWORD *)(a1 + 28) += v10;
  if (v9 == a3 || *v9 != 41)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
LABEL_27:
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&v23.__traits_.__loc_);
  return v9 + 1;
}

void sub_212481D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_212481D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_212481D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

void sub_212481D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  std::basic_regex<char,std::regex_traits<char>>::~basic_regex(&a9);
  _Unwind_Resume(a1);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_atom<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  std::basic_regex<char>::value_type *v3;
  int v5;
  std::basic_regex<char>::value_type *v7;
  std::__node<char> *v9;
  std::__owns_one_state<char> *v10;
  std::__node<char> *v11;
  std::basic_regex<char>::value_type *v12;
  unsigned __int8 *v13;
  int v14;
  unsigned int v15;
  std::__node<char> *v16;
  unsigned int marked_count;
  std::__owns_one_state<char> *end;
  std::__node<char> *first;
  std::basic_regex<char>::value_type *v20;
  std::__node<char> *v21;
  std::__owns_one_state<char> *v22;
  std::__node<char> *v23;
  int v24;
  std::__owns_one_state<char> *v25;
  unsigned __int8 *v26;
  std::__owns_one_state<char> *v27;
  int v28;

  v3 = a2;
  if (a2 == a3)
    return a2;
  v5 = *a2;
  v7 = a2;
  switch(*a2)
  {
    case '$':
    case ')':
    case ']':
    case '^':
    case '|':
    case '}':
      return v7;
    case '(':
      if (a2 + 1 == a3)
        goto LABEL_57;
      if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
      {
        ++this->__open_count_;
        v12 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, a2 + 3, a3);
        if (v12 != a3 && *v12 == 41)
        {
          --this->__open_count_;
          return v12 + 1;
        }
LABEL_57:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      }
      if ((this->__flags_ & 2) != 0)
      {
        marked_count = this->__marked_count_;
      }
      else
      {
        v16 = (std::__node<char> *)operator new(0x18uLL);
        marked_count = this->__marked_count_ + 1;
        this->__marked_count_ = marked_count;
        end = this->__end_;
        first = end->__first_;
        v16->__vftable = (std::__node<char>_vtbl *)&off_24CDC10C0;
        v16[1].__vftable = (std::__node<char>_vtbl *)first;
        LODWORD(v16[2].__vftable) = marked_count;
        end->__first_ = v16;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      ++this->__open_count_;
      v20 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_ecma_exp<std::__wrap_iter<char const*>>(this, v3 + 1, a3);
      if (v20 == a3)
        goto LABEL_57;
      v3 = v20;
      if (*v20 != 41)
        goto LABEL_57;
      if ((this->__flags_ & 2) == 0)
      {
        v21 = (std::__node<char> *)operator new(0x18uLL);
        v22 = this->__end_;
        v23 = v22->__first_;
        v21->__vftable = (std::__node<char>_vtbl *)&off_24CDC1108;
        v21[1].__vftable = (std::__node<char>_vtbl *)v23;
        LODWORD(v21[2].__vftable) = marked_count;
        v22->__first_ = v21;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      --this->__open_count_;
      return v3 + 1;
    case '*':
    case '+':
    case '?':
    case '{':
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)11>();
    case '.':
      v9 = (std::__node<char> *)operator new(0x10uLL);
      v10 = this->__end_;
      v11 = v10->__first_;
      v9->__vftable = (std::__node<char>_vtbl *)&off_24CDC0E80;
      v9[1].__vftable = (std::__node<char>_vtbl *)v11;
      v10->__first_ = v9;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      return v3 + 1;
    case '[':
      return std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, a3);
    case '\\':
      v7 = a2;
      if (v5 != 92)
        return v7;
      v13 = (unsigned __int8 *)(a2 + 1);
      if (a2 + 1 == a3)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
      v14 = *v13;
      v15 = v14 - 48;
      if (v14 != 48)
      {
        if ((v14 - 49) <= 8)
        {
          v7 = v3 + 2;
          if (v3 + 2 == a3)
          {
            v7 = a3;
          }
          else
          {
            while (1)
            {
              v24 = *v7;
              if ((v24 - 48) > 9)
                break;
              if (v15 >= 0x19999999)
                goto LABEL_58;
              ++v7;
              v15 = v24 + 10 * v15 - 48;
              if (v7 == a3)
              {
                v7 = a3;
                break;
              }
            }
            if (!v15)
LABEL_58:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
          }
          if (v15 > this->__marked_count_)
            goto LABEL_58;
          std::basic_regex<char,std::regex_traits<char>>::__push_back_ref(this, v15);
          if (v7 != (std::basic_regex<char>::value_type *)v13)
            return v7;
          LOBYTE(v14) = *v13;
        }
        switch((char)v14)
        {
          case 'D':
            v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_49;
          case 'S':
            v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_53;
          case 'W':
            v27 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v27, (uint64_t)this, (uint64_t)this->__end_->__first_, 1, this->__flags_ & 1, (this->__flags_ & 8) != 0);
            goto LABEL_51;
          case 'd':
            v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_49:
            this->__end_->__first_ = v25;
            this->__end_ = v25;
            v28 = LODWORD(v25[10].__vftable) | 0x400;
            goto LABEL_54;
          case 's':
            v25 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v25, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_53:
            this->__end_->__first_ = v25;
            this->__end_ = v25;
            v28 = LODWORD(v25[10].__vftable) | 0x4000;
LABEL_54:
            LODWORD(v25[10].__vftable) = v28;
            break;
          case 'w':
            v27 = (std::__owns_one_state<char> *)operator new(0xB0uLL);
            std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v27, (uint64_t)this, (uint64_t)this->__end_->__first_, 0, this->__flags_ & 1, (this->__flags_ & 8) != 0);
LABEL_51:
            this->__end_->__first_ = v27;
            this->__end_ = v27;
            LODWORD(v27[10].__vftable) |= 0x500u;
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v27, 95);
            break;
          default:
            v26 = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(this, (unsigned __int8 *)v3 + 1, (unsigned __int8 *)a3, 0);
            if (v13 == v26)
              return v3;
            else
              return (std::basic_regex<char>::value_type *)v26;
        }
        return v3 + 2;
      }
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v15);
      return v3 + 2;
    default:
      std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v5);
      return v3 + 1;
  }
}

void sub_21248228C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2124822A0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2124822B4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2124822C8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2124822DC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_2124822F0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  int v6;
  int locale_low;
  std::basic_regex<char> *v8;
  std::basic_regex<char> *v9;
  char *v10;
  size_t v11;
  char *v13;
  int v14;
  int v15;
  char *v16;
  int v17;
  int v18;
  std::basic_regex<char> *v19;
  unsigned __int8 *v20;
  BOOL v21;
  std::basic_regex<char> *v22;
  BOOL v23;
  char *v24;
  size_t v25;
  std::basic_regex<char> *v26;
  int v27;
  int v28;
  std::basic_regex<char> *v29;
  int v30;
  std::basic_regex<char> *v31;
  _BYTE *v32;

  if (this == a3)
    return this;
  v6 = *(_DWORD *)(a1 + 24) & 0x1F0;
  locale_low = SLOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low <= 62)
  {
    if (locale_low == 42)
    {
      v9 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (v6)
        v21 = 1;
      else
        v21 = v9 == a3;
      if (!v21 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        v10 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        v11 = 0;
        goto LABEL_36;
      }
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
      v25 = 0;
      goto LABEL_45;
    }
    v8 = this;
    if (locale_low == 43)
    {
      v9 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
      if (!v6 && v9 != a3 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        v10 = (char *)&this->__traits_.__loc_.__locale_ + 2;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        v11 = 1;
LABEL_36:
        std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v11, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 0);
        return (std::basic_regex<char> *)v10;
      }
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
      v25 = 1;
      goto LABEL_45;
    }
    return v8;
  }
  if (locale_low == 63)
  {
    v22 = (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
    if (v6)
      v23 = 1;
    else
      v23 = v22 == a3;
    if (v23 || LOBYTE(v22->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 1);
      return v22;
    }
    else
    {
      v24 = (char *)&this->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, 0, 1uLL, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v24;
    }
  }
  else
  {
    v8 = this;
    if (locale_low != 123)
      return v8;
    v13 = (char *)&this->__traits_.__loc_.__locale_ + 1;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3)
      goto LABEL_72;
    v14 = *v13;
    if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38)
      goto LABEL_72;
    v15 = v14 - 48;
    v16 = (char *)&this->__traits_.__loc_.__locale_ + 2;
    if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_21:
      v16 = (char *)a3;
    }
    else
    {
      while (1)
      {
        v17 = *v16;
        if ((v17 & 0xF8) != 0x30 && (v17 & 0xFE) != 0x38)
          break;
        if (v15 >= 214748364)
          goto LABEL_72;
        v15 = v17 + 10 * v15 - 48;
        if (++v16 == (char *)a3)
          goto LABEL_21;
      }
    }
    if (v16 == v13)
      goto LABEL_72;
    if (v16 == (char *)a3)
      goto LABEL_73;
    v18 = *v16;
    if (v18 != 44)
    {
      if (v18 == 125)
      {
        v19 = (std::basic_regex<char> *)(v16 + 1);
        if (v6 || v19 == a3 || LOBYTE(v19->__traits_.__loc_.__locale_) != 63)
        {
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v15, a4, __mexp_begin, __mexp_end, 1);
          return v19;
        }
        else
        {
          v20 = (unsigned __int8 *)(v16 + 2);
          std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v15, a4, __mexp_begin, __mexp_end, 0);
          return (std::basic_regex<char> *)v20;
        }
      }
LABEL_72:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
    }
    v26 = (std::basic_regex<char> *)(v16 + 1);
    if (v16 + 1 == (char *)a3)
      goto LABEL_72;
    v27 = LOBYTE(v26->__traits_.__loc_.__locale_);
    if (v27 == 125)
    {
      v9 = (std::basic_regex<char> *)(v16 + 2);
      if (!v6 && v9 != a3 && LOBYTE(v9->__traits_.__loc_.__locale_) == 63)
      {
        v11 = v15;
        v10 = v16 + 3;
        __mexp_begin = __mexp_begin;
        __mexp_end = __mexp_end;
        goto LABEL_36;
      }
      v25 = v15;
      __mexp_begin = __mexp_begin;
      __mexp_end = __mexp_end;
LABEL_45:
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v25, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
      return v9;
    }
    if ((v27 & 0xF8) != 0x30 && (v27 & 0xFE) != 0x38)
      goto LABEL_73;
    v28 = v27 - 48;
    v29 = (std::basic_regex<char> *)(v16 + 2);
    if (v29 == a3)
    {
LABEL_61:
      v29 = a3;
    }
    else
    {
      while (1)
      {
        v30 = LOBYTE(v29->__traits_.__loc_.__locale_);
        if ((v30 & 0xF8) != 0x30 && (v30 & 0xFE) != 0x38)
          break;
        if (v28 >= 214748364)
          goto LABEL_72;
        v28 = v30 + 10 * v28 - 48;
        v29 = (std::basic_regex<char> *)((char *)v29 + 1);
        if (v29 == a3)
          goto LABEL_61;
      }
    }
    if (v29 == v26 || v29 == a3 || LOBYTE(v29->__traits_.__loc_.__locale_) != 125)
LABEL_73:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
    if (v28 < v15)
      goto LABEL_72;
    v31 = (std::basic_regex<char> *)((char *)&v29->__traits_.__loc_.__locale_ + 1);
    if (v6 || v31 == a3 || LOBYTE(v31->__traits_.__loc_.__locale_) != 63)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v28, a4, __mexp_begin, __mexp_end, 1);
      return v31;
    }
    else
    {
      v32 = (char *)&v29->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop((std::basic_regex<char> *)a1, v15, v28, a4, __mexp_begin, __mexp_end, 0);
      return (std::basic_regex<char> *)v32;
    }
  }
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  int v5;
  char v6;
  std::basic_regex<char>::value_type *v7;
  void *v8;
  std::basic_regex<char>::value_type *v9;
  int v10;
  std::basic_regex<char>::value_type *v11;
  int v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  _BYTE *v23;
  std::basic_regex<char>::value_type *v24;
  unsigned __int8 *v25;
  unsigned __int8 *v26;
  int v27;
  unint64_t v28;
  char *v29;
  int v30;
  int v31;
  int v32;
  std::basic_regex<char>::value_type *v33;
  std::basic_regex<char>::value_type *v34;
  uint64_t v35;
  int v36;
  _OWORD *v37;
  _BYTE *v38;
  _BYTE *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 *v42;
  _OWORD *v43;
  unint64_t v44;
  __int128 v45;
  std::string::value_type *v46;
  unint64_t v47;
  __int128 v48;
  uint64_t v49;
  char *v50;
  int v51;
  void **v52;
  _BYTE *v53;
  std::basic_regex<char>::value_type *v54;
  _BYTE *v55;
  std::basic_regex<char>::value_type *v56;
  std::basic_regex<char>::value_type *v57;
  int v58;
  std::string::value_type *v59;
  char v60;
  std::basic_regex<char>::value_type *v61;
  char v62;
  uint64_t v63;
  char *v64;
  const char *v65;
  std::regex_traits<char>::char_class_type classname;
  char *v67;
  uint64_t v69;
  void *v70[2];
  std::string::value_type *v71;
  void *__p[2];
  unint64_t v73;
  std::string::value_type *__s[4];
  _OWORD v75[2];

  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3)
      goto LABEL_192;
    v5 = a2[1];
    v6 = v5 == 94;
    v7 = v5 == 94 ? a2 + 2 : a2 + 1;
    v8 = operator new(0xB0uLL);
    std::__bracket_expression<char,std::regex_traits<char>>::__bracket_expression[abi:ne180100]((uint64_t)v8, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), v6, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v8;
    *(_QWORD *)(a1 + 56) = v8;
    if (v7 == a3)
      goto LABEL_192;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v7 == 93)
    {
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 93);
      ++v7;
    }
    if (v7 == a3)
      goto LABEL_192;
    v69 = 4 - (_QWORD)a3;
    while (1)
    {
      v9 = v7;
      if (v7 == a3)
      {
        v7 = a3;
        goto LABEL_15;
      }
      v10 = *v7;
      v11 = v7;
      if (v10 == 93)
        goto LABEL_14;
      __p[0] = 0;
      __p[1] = 0;
      v73 = 0;
      v11 = v7;
      if (v7 + 1 == a3 || v10 != 91)
        goto LABEL_60;
      v12 = v7[1];
      if (v12 != 46)
      {
        if (v12 == 58)
        {
          v19 = v7 + 2;
          if (a3 - (v7 + 2) < 2)
            goto LABEL_190;
          v20 = v7 - a3;
          v21 = 2;
          while (1)
          {
            v22 = v21 - 2;
            while (v7[v22 + 2] != 58)
            {
              ++v22;
              if (v20 + v22 == -3)
                goto LABEL_190;
            }
            if (v7[v22 + 3] == 93)
              break;
            v21 = v22 + 3;
            if (v20 + v22 == -4)
              goto LABEL_190;
          }
          v35 = (uint64_t)&v7[v22 + 2];
          if ((std::basic_regex<char>::value_type *)v35 == a3)
            goto LABEL_190;
          v36 = *(_DWORD *)(a1 + 24);
          memset(v75, 170, 24);
          if (v22 >= 0x7FFFFFFFFFFFFFF8)
            std::string::__throw_length_error[abi:ne180100]();
          if (v22 >= 0x17)
          {
            v40 = (v22 & 0xFFFFFFFFFFFFFFF8) + 8;
            if ((v22 | 7) != 0x17)
              v40 = v22 | 7;
            v41 = v40 + 1;
            v37 = operator new(v40 + 1);
            *((_QWORD *)&v75[0] + 1) = v22;
            *(_QWORD *)&v75[1] = v41 | 0x8000000000000000;
            *(_QWORD *)&v75[0] = v37;
          }
          else
          {
            BYTE7(v75[1]) = v22;
            v37 = v75;
            if (!v22)
            {
              v38 = v75;
              goto LABEL_144;
            }
          }
          if (v22 < 0x20)
          {
            v38 = v37;
          }
          else if ((unint64_t)((char *)v37 - v19) < 0x20)
          {
            v38 = v37;
          }
          else
          {
            v38 = (char *)v37 + (v22 & 0xFFFFFFFFFFFFFFE0);
            v19 += v22 & 0xFFFFFFFFFFFFFFE0;
            v42 = (__int128 *)(v9 + 18);
            v43 = v37 + 1;
            v44 = v22 & 0xFFFFFFFFFFFFFFE0;
            do
            {
              v45 = *v42;
              *(v43 - 1) = *(v42 - 1);
              *v43 = v45;
              v42 += 2;
              v43 += 2;
              v44 -= 32;
            }
            while (v44);
            if (v22 == (v22 & 0x7FFFFFFFFFFFFFE0))
              goto LABEL_144;
          }
          do
          {
            v62 = *v19++;
            *v38++ = v62;
          }
          while (v19 != (char *)v35);
LABEL_144:
          *v38 = 0;
          v63 = BYTE7(v75[1]);
          if ((SBYTE7(v75[1]) & 0x80u) == 0)
            v64 = (char *)v75;
          else
            v64 = *(char **)&v75[0];
          if (SBYTE7(v75[1]) < 0)
            v63 = *((_QWORD *)&v75[0] + 1);
          (*(void (**)(_QWORD, char *, char *))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), v64, &v64[v63]);
          if ((SBYTE7(v75[1]) & 0x80u) == 0)
            v65 = (const char *)v75;
          else
            v65 = *(const char **)&v75[0];
          classname = std::__get_classname(v65, v36 & 1);
          if (SBYTE7(v75[1]) < 0)
            operator delete(*(void **)&v75[0]);
          if (!classname)
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)2>();
          v60 = 0;
          *((_DWORD *)v8 + 40) |= classname;
          v7 = &v9[v22 + 4];
          v54 = v9;
          if ((SHIBYTE(v73) & 0x80000000) == 0)
          {
LABEL_135:
            v11 = v54;
            if ((v60 & 1) == 0)
              goto LABEL_15;
            goto LABEL_14;
          }
          goto LABEL_164;
        }
        if (v12 == 61)
        {
          if (a3 - (v7 + 2) < 2)
            goto LABEL_190;
          v13 = 0;
          v14 = (unsigned __int8 *)v7;
          v15 = (unsigned __int8 *)&v7[v69];
          if (v7[2] == 61)
            goto LABEL_27;
          do
          {
            do
            {
              if (!v15)
LABEL_190:
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
              v14 = (unsigned __int8 *)&v7[++v13];
              v15 = (unsigned __int8 *)&v7[v69 + v13];
            }
            while (v7[v13 + 2] != 61);
LABEL_27:
            ;
          }
          while (v14[3] != 93);
          v16 = &v7[v13 + 2];
          if (v16 == a3)
            goto LABEL_190;
          memset(v75, 170, 24);
          std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>((uint64_t)v75, a1, (uint64_t)(v7 + 2), v16);
          if (SBYTE7(v75[1]) < 0)
          {
            v17 = *((_QWORD *)&v75[0] + 1);
            if (!*((_QWORD *)&v75[0] + 1))
LABEL_194:
              std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
            memset(__s, 170, 24);
            v18 = *(char **)&v75[0];
          }
          else
          {
            v17 = BYTE7(v75[1]);
            if (!BYTE7(v75[1]))
              goto LABEL_194;
            v18 = (char *)v75;
            memset(__s, 170, 24);
          }
          std::regex_traits<char>::__transform_primary<std::__wrap_iter<char *>>(__s, a1, (uint64_t)v18, &v18[v17]);
          v46 = (std::string::value_type *)HIBYTE(__s[2]);
          if (SHIBYTE(__s[2]) < 0)
            v46 = __s[1];
          if (v46)
          {
            v47 = *((_QWORD *)v8 + 18);
            if (v47 >= *((_QWORD *)v8 + 19))
            {
              *((_QWORD *)v8 + 18) = std::vector<std::string>::__push_back_slow_path<std::string const&>((char **)v8 + 17, (uint64_t)__s);
              if (SHIBYTE(__s[2]) < 0)
                goto LABEL_170;
            }
            else
            {
              if (SHIBYTE(__s[2]) < 0)
              {
                std::string::__init_copy_ctor_external(*((std::string **)v8 + 18), __s[0], (std::string::size_type)__s[1]);
              }
              else
              {
                v48 = *(_OWORD *)__s;
                *(std::string::value_type **)(v47 + 16) = __s[2];
                *(_OWORD *)v47 = v48;
              }
              *((_QWORD *)v8 + 18) = v47 + 24;
              *((_QWORD *)v8 + 18) = v47 + 24;
              if (SHIBYTE(__s[2]) < 0)
                goto LABEL_170;
            }
LABEL_162:
            if ((SBYTE7(v75[1]) & 0x80000000) == 0)
              goto LABEL_163;
          }
          else
          {
            v49 = BYTE7(v75[1]);
            if (SBYTE7(v75[1]) < 0)
              v49 = *((_QWORD *)&v75[0] + 1);
            if (v49 == 2)
            {
              if ((SBYTE7(v75[1]) & 0x80u) == 0)
                v67 = (char *)v75;
              else
                v67 = *(char **)&v75[0];
              std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v8, *v67, v67[1]);
            }
            else
            {
              if (v49 != 1)
                std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
              if ((SBYTE7(v75[1]) & 0x80u) == 0)
                v50 = (char *)v75;
              else
                v50 = *(char **)&v75[0];
              std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, *v50);
            }
            if ((SHIBYTE(__s[2]) & 0x80000000) == 0)
              goto LABEL_162;
LABEL_170:
            operator delete(__s[0]);
            if ((SBYTE7(v75[1]) & 0x80000000) == 0)
            {
LABEL_163:
              v60 = 0;
              v7 += v13 + 4;
              v54 = v9;
              if ((SHIBYTE(v73) & 0x80000000) == 0)
                goto LABEL_135;
              goto LABEL_164;
            }
          }
          operator delete(*(void **)&v75[0]);
          goto LABEL_163;
        }
        v11 = v7;
LABEL_60:
        v30 = *(_DWORD *)(a1 + 24) & 0x1F0;
        v31 = 0;
        goto LABEL_61;
      }
      v23 = v7 + 2;
      if (a3 - (v7 + 2) < 2)
        goto LABEL_191;
      v24 = v7;
      v25 = (unsigned __int8 *)(v7 + 2);
      v26 = (unsigned __int8 *)(v7 + 3);
      if (*v23 != 46)
        break;
LABEL_46:
      if (*v26 != 93)
        goto LABEL_44;
      if (v25 == (unsigned __int8 *)a3)
LABEL_191:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>((uint64_t)v75, a1, (uint64_t)v23, v24 + 2);
      if (SHIBYTE(v73) < 0)
        operator delete(__p[0]);
      *(_OWORD *)__p = v75[0];
      v73 = *(_QWORD *)&v75[1];
      v28 = *((_QWORD *)&v75[0] + 1);
      if ((SBYTE7(v75[1]) & 0x80u) == 0)
        v29 = (char *)HIBYTE(v73);
      else
        v29 = (char *)__p[1];
      if ((unint64_t)(v29 - 1) >= 2)
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
      v11 = (std::basic_regex<char>::value_type *)(v25 + 2);
      v30 = *(_DWORD *)(a1 + 24) & 0x1F0;
      v31 = SBYTE7(v75[1]);
      if ((SBYTE7(v75[1]) & 0x80u) == 0)
        v28 = HIBYTE(v73);
      if (v28)
      {
        if (v11 == a3)
          goto LABEL_106;
        goto LABEL_105;
      }
LABEL_61:
      if ((v30 | 0x40) == 0x40)
      {
        v32 = *v11;
        if (v32 == 92)
        {
          v33 = v11 + 1;
          if (v30)
            v34 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v33, a3, (uint64_t *)__p);
          else
            v34 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)v33, (unsigned __int8 *)a3, (uint64_t)__p, (uint64_t)v8);
          v11 = v34;
          if (v34 == a3)
            goto LABEL_106;
          goto LABEL_105;
        }
      }
      else
      {
        LOBYTE(v32) = *v11;
      }
      if (v31 < 0)
      {
        v39 = __p[0];
        __p[1] = (void *)1;
        *(_BYTE *)__p[0] = v32;
        v39[1] = 0;
        if (++v11 == a3)
          goto LABEL_106;
      }
      else
      {
        HIBYTE(v73) = 1;
        LOWORD(__p[0]) = v32;
        if (++v11 == a3)
          goto LABEL_106;
      }
LABEL_105:
      v51 = *v11;
      if (v51 != 93)
      {
        v53 = v11 + 1;
        if (v11 + 1 != a3 && v51 == 45 && *v53 != 93)
        {
          memset(__s, 0, 24);
          v54 = v11 + 2;
          if (v11 + 2 == a3 || *v53 != 91 || *v54 != 46)
          {
            if ((v30 | 0x40) == 0x40)
            {
              LODWORD(v53) = *v53;
              if ((_DWORD)v53 == 92)
              {
                if (v30)
                  v61 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v11 + 2, a3, (uint64_t *)__s);
                else
                  v61 = (std::basic_regex<char>::value_type *)std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, (unsigned __int8 *)v11 + 2, (unsigned __int8 *)a3, (uint64_t)__s, (uint64_t)v8);
                v54 = v61;
                goto LABEL_174;
              }
            }
            else
            {
              LOBYTE(v53) = *v53;
            }
            HIBYTE(__s[2]) = 1;
            LOWORD(__s[0]) = v53;
            goto LABEL_174;
          }
          v55 = v11 + 3;
          if (a3 - (v11 + 3) < 2)
            goto LABEL_193;
          v56 = v11 + 3;
          v57 = v11 + 4;
          if (*v55 == 46)
            goto LABEL_124;
          do
          {
            do
            {
              if (a3 - 5 == v11)
                goto LABEL_193;
              ++v11;
              v56 = v57;
              v58 = *v57++;
            }
            while (v58 != 46);
LABEL_124:
            ;
          }
          while (*v57 != 93);
          if (v56 == a3)
LABEL_193:
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
          std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>((uint64_t)v75, a1, (uint64_t)v55, v11 + 3);
          if (SHIBYTE(__s[2]) < 0)
            operator delete(__s[0]);
          __s[2] = *(std::string::value_type **)&v75[1];
          *(_OWORD *)__s = v75[0];
          v59 = (std::string::value_type *)HIBYTE(*(_QWORD *)&v75[1]);
          if (SBYTE7(v75[1]) < 0)
            v59 = __s[1];
          if ((unint64_t)(v59 - 1) >= 2)
            std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)1>();
          v54 = v56 + 2;
LABEL_174:
          v75[0] = *(_OWORD *)__p;
          *(_QWORD *)&v75[1] = v73;
          __p[1] = 0;
          v73 = 0;
          __p[0] = 0;
          *(_OWORD *)v70 = *(_OWORD *)__s;
          v71 = __s[2];
          memset(__s, 0, 24);
          std::__bracket_expression<char,std::regex_traits<char>>::__add_range[abi:ne180100]((uint64_t)v8, (char *)v75, (uint64_t)v70);
          if (SHIBYTE(v71) < 0)
          {
            operator delete(v70[0]);
            if (SBYTE7(v75[1]) < 0)
              goto LABEL_180;
LABEL_176:
            if ((SHIBYTE(__s[2]) & 0x80000000) == 0)
              goto LABEL_177;
LABEL_181:
            operator delete(__s[0]);
            v60 = 1;
            if ((SHIBYTE(v73) & 0x80000000) == 0)
              goto LABEL_135;
          }
          else
          {
            if ((SBYTE7(v75[1]) & 0x80000000) == 0)
              goto LABEL_176;
LABEL_180:
            operator delete(*(void **)&v75[0]);
            if (SHIBYTE(__s[2]) < 0)
              goto LABEL_181;
LABEL_177:
            v60 = 1;
            if ((SHIBYTE(v73) & 0x80000000) == 0)
              goto LABEL_135;
          }
LABEL_164:
          operator delete(__p[0]);
          v11 = v54;
          if ((v60 & 1) == 0)
            goto LABEL_15;
          goto LABEL_14;
        }
      }
LABEL_106:
      if (SHIBYTE(v73) < 0)
      {
        if (__p[1])
        {
          if (__p[1] == (void *)1)
          {
            v52 = (void **)__p[0];
LABEL_113:
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, *(char *)v52);
LABEL_134:
            v60 = 1;
            v54 = v11;
            if ((SHIBYTE(v73) & 0x80000000) == 0)
              goto LABEL_135;
            goto LABEL_164;
          }
          v52 = (void **)__p[0];
LABEL_133:
          std::__bracket_expression<char,std::regex_traits<char>>::__add_digraph[abi:ne180100]((uint64_t)v8, *(char *)v52, *((char *)v52 + 1));
          goto LABEL_134;
        }
        operator delete(__p[0]);
      }
      else if (HIBYTE(v73))
      {
        v52 = __p;
        if (HIBYTE(v73) == 1)
          goto LABEL_113;
        goto LABEL_133;
      }
LABEL_14:
      v7 = v11;
LABEL_15:
      if (v9 == v7)
      {
        if (v9 != a3)
        {
          if (*v9 == 45)
          {
            std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100]((uint64_t)v8, 45);
            ++v9;
          }
          if (v9 != a3 && *v9 == 93)
            return v9 + 1;
        }
LABEL_192:
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)5>();
      }
    }
    do
    {
LABEL_44:
      if (a3 - 4 == v24)
        goto LABEL_191;
      ++v24;
      v25 = v26;
      v27 = *v26++;
    }
    while (v27 != 46);
    goto LABEL_46;
  }
  return a2;
}

void sub_212483114(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a32 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  _Unwind_Resume(exception_object);
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  std::basic_regex<char>::value_type v6;
  unsigned __int8 *result;
  unsigned int v8;
  std::basic_regex<char>::value_type v10;
  int v11;
  int v12;
  unsigned __int8 v13;
  char v14;
  unsigned __int8 v15;
  char v16;
  std::basic_regex<char>::value_type v17;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  v6 = v5;
  switch((char)v5)
  {
    case '0':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 0;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 0);
        return v4 + 1;
      }
    case 'c':
      if (v4 + 1 == a3 || (char)v4[1] < 65)
        goto LABEL_85;
      v8 = v4[1];
      if (v8 >= 0x5B && (v8 - 97) > 0x19u)
        goto LABEL_85;
      v10 = v8 & 0x1F;
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v10;
        *((_BYTE *)a4 + 1) = 0;
        return v4 + 2;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v10);
        return v4 + 2;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return v4 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return v4 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return v4 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return v4 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return v4 + 1;
      }
    case 'u':
      if (v4 + 1 != a3)
      {
        v11 = v4[1];
        if ((v11 & 0xF8) == 0x30 || (v11 & 0xFE) == 0x38 || (v11 | 0x20u) - 97 < 6)
        {
          v4 += 2;
          if (v4 != a3)
          {
            v12 = *v4;
            if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38 || (v12 | 0x20u) - 97 < 6)
              goto LABEL_42;
          }
        }
      }
      goto LABEL_85;
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return v4 + 1;
      }
      else
      {
        v6 = 11;
LABEL_68:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v6);
        return v4 + 1;
      }
    case 'x':
LABEL_42:
      if (v4 + 1 == a3)
        goto LABEL_85;
      v13 = v4[1];
      v14 = -48;
      if ((v13 & 0xF8) == 0x30 || (v13 & 0xFE) == 0x38)
        goto LABEL_47;
      v13 |= 0x20u;
      if ((v13 - 97) >= 6u)
        goto LABEL_85;
      v14 = -87;
LABEL_47:
      if (v4 + 2 == a3)
        goto LABEL_85;
      v15 = v4[2];
      v16 = -48;
      if ((v15 & 0xF8) != 0x30 && (v15 & 0xFE) != 0x38)
      {
        v15 |= 0x20u;
        if ((v15 - 97) >= 6u)
LABEL_85:
          std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
        v16 = -87;
      }
      v17 = v15 + 16 * (v13 + v14) + v16;
      if (!a4)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v17);
        v4 += 3;
        return v4;
      }
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v17;
      *((_BYTE *)a4 + 1) = 0;
      result = v4 + 3;
      break;
    default:
      if ((char)v5 == 95 || ((char)v5 & 0x80000000) == 0 && (a1->__traits_.__ct_->__tab_[v5] & 0x500) != 0)
        goto LABEL_85;
      if (!a4)
        goto LABEL_68;
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v5;
      *((_BYTE *)a4 + 1) = 0;
      return v4 + 1;
  }
  return result;
}

unsigned __int8 *std::basic_regex<char,std::regex_traits<char>>::__parse_class_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  unsigned __int8 *result;

  if (a2 == a3)
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  switch(*a2)
  {
    case 'D':
      *(_DWORD *)(a5 + 164) |= 0x400u;
      result = a2 + 1;
      break;
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'T':
    case 'U':
    case 'V':
    case 'X':
    case 'Y':
    case 'Z':
    case '[':
    case '\\':
    case ']':
    case '^':
    case '_':
    case 'a':
    case 'c':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 't':
    case 'u':
    case 'v':
      goto LABEL_8;
    case 'S':
      *(_DWORD *)(a5 + 164) |= 0x4000u;
      result = a2 + 1;
      break;
    case 'W':
      *(_DWORD *)(a5 + 164) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_neg_char[abi:ne180100](a5);
      result = a2 + 1;
      break;
    case 'b':
      if (*(char *)(a4 + 23) < 0)
      {
        *(_QWORD *)(a4 + 8) = 1;
        a4 = *(_QWORD *)a4;
      }
      else
      {
        *(_BYTE *)(a4 + 23) = 1;
      }
      *(_WORD *)a4 = 8;
      result = a2 + 1;
      break;
    case 'd':
      *(_DWORD *)(a5 + 160) |= 0x400u;
      result = a2 + 1;
      break;
    case 's':
      *(_DWORD *)(a5 + 160) |= 0x4000u;
      result = a2 + 1;
      break;
    case 'w':
      *(_DWORD *)(a5 + 160) |= 0x500u;
      std::__bracket_expression<char,std::regex_traits<char>>::__add_char[abi:ne180100](a5, 95);
      result = a2 + 1;
      break;
    default:
      if (*a2)
      {
LABEL_8:
        result = std::basic_regex<char,std::regex_traits<char>>::__parse_character_escape<std::__wrap_iter<char const*>>(a1, a2, a3, (uint64_t *)a4);
      }
      else
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(_QWORD *)(a4 + 8) = 1;
          a4 = *(_QWORD *)a4;
        }
        else
        {
          *(_BYTE *)(a4 + 23) = 1;
        }
        *(_BYTE *)a4 = 0;
        *(_BYTE *)(a4 + 1) = 0;
        result = a2 + 1;
      }
      break;
  }
  return result;
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3, uint64_t *a4)
{
  std::basic_regex<char>::value_type v5;
  std::basic_regex<char>::value_type v7;
  std::basic_regex<char>::value_type *v8;
  std::basic_regex<char>::value_type v9;
  int v10;
  std::basic_regex<char>::value_type v11;

  if (a2 == a3)
LABEL_70:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)3>();
  v5 = *a2;
  switch(*a2)
  {
    case '"':
    case '/':
    case '\\':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v5;
        *((_BYTE *)a4 + 1) = 0;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v5);
        return a2 + 1;
      }
    case 'a':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 7;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 7);
        return a2 + 1;
      }
    case 'b':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 8);
        return a2 + 1;
      }
    case 'f':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 12;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 12);
        return a2 + 1;
      }
    case 'n':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 10;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 10);
        return a2 + 1;
      }
    case 'r':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 13;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 13);
        return a2 + 1;
      }
    case 't':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 9;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 9);
        return a2 + 1;
      }
    case 'v':
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_WORD *)a4 = 11;
        return a2 + 1;
      }
      else
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, 11);
        return a2 + 1;
      }
    default:
      if ((v5 & 0xF8) != 0x30)
        goto LABEL_70;
      v7 = *a2 - 48;
      v8 = a2 + 1;
      if (a2 + 1 == a3)
      {
        v8 = a3;
LABEL_42:
        if (a4)
          goto LABEL_43;
LABEL_69:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(a1, v7);
        return v8;
      }
      if ((*v8 & 0xF8) != 0x30)
        goto LABEL_42;
      v7 = *v8 + 8 * v7 - 48;
      if (a2 + 2 == a3)
      {
        v8 = a3;
        if (a4)
          goto LABEL_43;
        goto LABEL_69;
      }
      v9 = a2[2];
      v10 = v9 & 0xF8;
      v11 = v9 + 8 * v7 - 48;
      if (v10 == 48)
        v8 = a2 + 3;
      else
        v8 = a2 + 2;
      if (v10 == 48)
        v7 = v11;
      if (!a4)
        goto LABEL_69;
LABEL_43:
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v7;
      *((_BYTE *)a4 + 1) = 0;
      return v8;
  }
}

void std::regex_traits<char>::__lookup_collatename<std::__wrap_iter<char const*>>(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  unint64_t v4;
  char *v9;
  char *v10;
  char *v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  char *v25;
  size_t v26;
  std::string v27;
  char __s[24];

  v4 = (unint64_t)&a4[-a3];
  memset(__s, 170, sizeof(__s));
  if ((unint64_t)&a4[-a3] >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v4 <= 0x16)
  {
    __s[23] = (_BYTE)a4 - a3;
    v9 = __s;
    if ((char *)a3 != a4)
      goto LABEL_4;
LABEL_13:
    v10 = v9;
    goto LABEL_16;
  }
  v16 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v4 | 7) != 0x17)
    v16 = v4 | 7;
  v17 = v16 + 1;
  v9 = (char *)operator new(v16 + 1);
  *(_QWORD *)&__s[8] = v4;
  *(_QWORD *)&__s[16] = v17 | 0x8000000000000000;
  *(_QWORD *)__s = v9;
  if ((char *)a3 == a4)
    goto LABEL_13;
LABEL_4:
  if (v4 < 0x20 || (unint64_t)&v9[-a3] < 0x20)
  {
    v10 = v9;
    v11 = (char *)a3;
    do
    {
LABEL_15:
      v18 = *v11++;
      *v10++ = v18;
    }
    while (v11 != a4);
    goto LABEL_16;
  }
  v10 = &v9[v4 & 0xFFFFFFFFFFFFFFE0];
  v11 = (char *)(a3 + (v4 & 0xFFFFFFFFFFFFFFE0));
  v12 = (__int128 *)(a3 + 16);
  v13 = v9 + 16;
  v14 = v4 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    v15 = *v12;
    *(v13 - 1) = *(v12 - 1);
    *v13 = v15;
    v12 += 2;
    v13 += 2;
    v14 -= 32;
  }
  while (v14);
  if (v4 != (v4 & 0xFFFFFFFFFFFFFFE0))
    goto LABEL_15;
LABEL_16:
  *v10 = 0;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  if (__s[23] < 0)
  {
    v19 = *(char **)__s;
    if (!*(_QWORD *)&__s[8])
      goto LABEL_29;
  }
  else
  {
    if (!__s[23])
      return;
    v19 = __s;
  }
  std::__get_collation_name(&v27, v19);
  *(_OWORD *)a1 = *(_OWORD *)&v27.__r_.__value_.__l.__data_;
  v20 = v27.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a1 + 16) = *((_QWORD *)&v27.__r_.__value_.__l + 2);
  v21 = HIBYTE(v20);
  if ((v21 & 0x80u) != 0)
    v21 = *(_QWORD *)(a1 + 8);
  if (v21)
  {
LABEL_23:
    if ((__s[23] & 0x80000000) == 0)
      return;
    v19 = *(char **)__s;
LABEL_29:
    operator delete(v19);
    return;
  }
  if (__s[23] < 0)
  {
    v19 = *(char **)__s;
    v22 = *(_QWORD *)&__s[8];
    if (*(_QWORD *)&__s[8] >= 3uLL)
      goto LABEL_29;
    goto LABEL_31;
  }
  v22 = __s[23];
  if (__s[23] < 3u)
  {
    v19 = __s;
LABEL_31:
    (*(void (**)(std::string *__return_ptr, _QWORD, char *, char *))(**(_QWORD **)(a2 + 16) + 32))(&v27, *(_QWORD *)(a2 + 16), v19, &v19[v22]);
    if (*(char *)(a1 + 23) < 0)
      operator delete(*(void **)a1);
    *(std::string *)a1 = v27;
    if (*(char *)(a1 + 23) < 0)
    {
      v24 = *(_QWORD *)(a1 + 8);
      if (v24 == 1 || v24 == 12)
      {
        if (__s != (char *)a1)
        {
          if (__s[23] >= 0)
            v25 = __s;
          else
            v25 = *(char **)__s;
          if (__s[23] >= 0)
            v26 = __s[23];
          else
            v26 = *(_QWORD *)&__s[8];
          std::string::__assign_no_alias<false>((void **)a1, v25, v26);
        }
      }
      else
      {
        **(_BYTE **)a1 = 0;
        *(_QWORD *)(a1 + 8) = 0;
      }
    }
    else
    {
      v23 = *(unsigned __int8 *)(a1 + 23);
      if (v23 == 1 || v23 == 12)
      {
        if (__s != (char *)a1)
        {
          if (__s[23] < 0)
          {
            std::string::__assign_no_alias<true>((_QWORD *)a1, *(void **)__s, *(size_t *)&__s[8]);
          }
          else
          {
            *(_OWORD *)a1 = *(_OWORD *)__s;
            *(_QWORD *)(a1 + 16) = *(_QWORD *)&__s[16];
          }
        }
      }
      else
      {
        *(_BYTE *)a1 = 0;
        *(_BYTE *)(a1 + 23) = 0;
      }
    }
    goto LABEL_23;
  }
}

void sub_212483F74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
  {
    operator delete(*(void **)v17);
    if ((a17 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a17 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::basic_regex<char>::value_type *std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(uint64_t a1, std::basic_regex<char>::value_type *a2, std::basic_regex<char>::value_type *a3)
{
  int v6;
  std::basic_regex<char>::value_type *v7;
  int v8;
  std::basic_regex<char> *v9;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  std::basic_regex<char> *v20;
  std::__owns_one_state<char> *v21;
  int v22;
  std::basic_regex<char> *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;

  if (a2 == a3)
    goto LABEL_4;
  v7 = a2 + 1;
  v6 = *a2;
  if (a2 + 1 == a3 && v6 == 36)
    goto LABEL_4;
  if ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v6);
  }
  else
  {
    if (v7 != a3 && v6 == 92)
    {
      v15 = *v7;
      if ((v15 - 36) <= 0x3A && ((1 << (v15 - 36)) & 0x580000000000441) != 0)
      {
        std::basic_regex<char,std::regex_traits<char>>::__push_char((std::basic_regex<char> *)a1, v15);
        v7 = a2 + 2;
        goto LABEL_5;
      }
LABEL_4:
      v7 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>(a1, a2, a3);
      goto LABEL_5;
    }
    if (v6 != 46)
      goto LABEL_4;
    v16 = operator new(0x10uLL);
    v17 = *(_QWORD *)(a1 + 56);
    v18 = *(_QWORD *)(v17 + 8);
    *v16 = &off_24CDC12B8;
    v16[1] = v18;
    *(_QWORD *)(v17 + 8) = v16;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
LABEL_5:
  if (a2 == a3 || a2 != v7 || a2 + 1 == a3 || *a2 != 92)
    return v7;
  v8 = a2[1];
  if (v8 == 40)
  {
    v9 = (std::basic_regex<char> *)(a2 + 2);
    if ((*(_BYTE *)(a1 + 24) & 2) != 0)
    {
      v11 = *(_DWORD *)(a1 + 28);
    }
    else
    {
      v10 = operator new(0x18uLL);
      v11 = *(_DWORD *)(a1 + 28) + 1;
      *(_DWORD *)(a1 + 28) = v11;
      v12 = *(_QWORD *)(a1 + 56);
      v13 = *(_QWORD *)(v12 + 8);
      *v10 = &off_24CDC10C0;
      v10[1] = v13;
      *((_DWORD *)v10 + 4) = v11;
      *(_QWORD *)(v12 + 8) = v10;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    do
    {
      if (v9 == (std::basic_regex<char> *)a3)
        goto LABEL_39;
      v20 = v9;
      v21 = *(std::__owns_one_state<char> **)(a1 + 56);
      v22 = *(_DWORD *)(a1 + 28);
      v23 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_nondupl_RE<std::__wrap_iter<char const*>>(a1, v20, a3);
      if (v20 == v23)
        break;
      v9 = std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>((std::basic_regex<char> *)a1, v23, (std::basic_regex<char> *)a3, v21, (v22 + 1), (*(_DWORD *)(a1 + 28) + 1));
    }
    while (v20 != v9);
    if ((char *)&v20->__traits_.__loc_.__locale_ + 1 == a3
      || LOBYTE(v20->__traits_.__loc_.__locale_) != 92
      || BYTE1(v20->__traits_.__loc_.__locale_) != 41)
    {
LABEL_39:
      std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
    }
    v7 = (char *)v20 + 2 * (BYTE1(v20->__traits_.__loc_.__locale_) == 41);
    if ((*(_BYTE *)(a1 + 24) & 2) == 0)
    {
      v24 = operator new(0x18uLL);
      v25 = *(_QWORD *)(a1 + 56);
      v26 = *(_QWORD *)(v25 + 8);
      *v24 = &off_24CDC1108;
      v24[1] = v26;
      *((_DWORD *)v24 + 4) = v11;
      *(_QWORD *)(v25 + 8) = v24;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    return v7;
  }
  if ((v8 & 0xF8) != 0x30 && (v8 & 0xFE) != 0x38 || (v8 - 49) > 8)
    return v7;
  if ((v8 - 48) > *(_DWORD *)(a1 + 28))
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)4>();
  std::basic_regex<char,std::regex_traits<char>>::__push_back_ref((std::basic_regex<char> *)a1, v8 - 48);
  return a2 + 2;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_RE_dupl_symbol<std::__wrap_iter<char const*>>(std::basic_regex<char> *a1, std::basic_regex<char> *this, std::basic_regex<char> *a3, std::__owns_one_state<char> *a4, size_t __mexp_begin, size_t __mexp_end)
{
  int locale_low;
  unsigned __int8 *v9;
  std::basic_regex<char> *v10;
  int v11;
  int v12;
  std::basic_regex<char> *v13;
  int v14;
  std::basic_regex<char> *v15;
  int v16;
  int v17;
  int v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;

  if (this == a3)
    return this;
  locale_low = LOBYTE(this->__traits_.__loc_.__locale_);
  if (locale_low == 42)
  {
    std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, 0, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
    return (std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1);
  }
  v9 = (unsigned __int8 *)a3;
  if ((std::basic_regex<char> *)((char *)&this->__traits_.__loc_.__locale_ + 1) == a3
    || locale_low != 92
    || BYTE1(this->__traits_.__loc_.__locale_) != 123)
  {
    return this;
  }
  v10 = (std::basic_regex<char> *)((char *)this + 2 * (BYTE1(this->__traits_.__loc_.__locale_) == 123));
  if (v10 == a3)
    goto LABEL_45;
  v11 = LOBYTE(v10->__traits_.__loc_.__locale_);
  if ((v11 & 0xF8) != 0x30 && (v11 & 0xFE) != 0x38)
    goto LABEL_45;
  v12 = v11 - 48;
  v13 = (std::basic_regex<char> *)((char *)&v10->__traits_.__loc_.__locale_ + 1);
  if ((std::basic_regex<char> *)((char *)&v10->__traits_.__loc_.__locale_ + 1) == a3)
  {
LABEL_15:
    v13 = a3;
  }
  else
  {
    while (1)
    {
      v14 = LOBYTE(v13->__traits_.__loc_.__locale_);
      if ((v14 & 0xF8) != 0x30 && (v14 & 0xFE) != 0x38)
        break;
      if (v12 >= 214748364)
        goto LABEL_45;
      v12 = v14 + 10 * v12 - 48;
      v13 = (std::basic_regex<char> *)((char *)v13 + 1);
      if (v13 == a3)
        goto LABEL_15;
    }
  }
  if (v13 == v10)
    goto LABEL_45;
  if (v13 == a3)
LABEL_46:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)7>();
  v15 = (std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 1);
  v16 = LOBYTE(v13->__traits_.__loc_.__locale_);
  if (v16 != 44)
  {
    if (v15 != a3 && v16 == 92 && LOBYTE(v15->__traits_.__loc_.__locale_) == 125)
    {
      v19 = (unsigned __int8 *)&v13->__traits_.__loc_.__locale_ + 2;
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, v12, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v19;
    }
    goto LABEL_46;
  }
  if (v15 == a3)
    goto LABEL_46;
  v17 = LOBYTE(v15->__traits_.__loc_.__locale_);
  if ((v17 & 0xF8) == 0x30 || (v17 & 0xFE) == 0x38)
  {
    v18 = v17 - 48;
    v15 = (std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 2);
    if ((std::basic_regex<char> *)((char *)&v13->__traits_.__loc_.__locale_ + 2) == a3)
    {
LABEL_37:
      v15 = a3;
      goto LABEL_40;
    }
    while (1)
    {
      v17 = LOBYTE(v15->__traits_.__loc_.__locale_);
      if ((v17 & 0xF8) != 0x30 && (v17 & 0xFE) != 0x38)
        break;
      if (v18 >= 214748364)
        goto LABEL_45;
      v18 = v17 + 10 * v18 - 48;
      v15 = (std::basic_regex<char> *)((char *)v15 + 1);
      if (v15 == a3)
        goto LABEL_37;
    }
  }
  else
  {
    v18 = -1;
  }
  if (v15 == a3)
  {
    v20 = (unsigned __int8 *)v15;
    v15 = a3;
    v9 = v20;
  }
  else if ((std::basic_regex<char> *)((char *)&v15->__traits_.__loc_.__locale_ + 1) == a3 || v17 != 92)
  {
    v9 = (unsigned __int8 *)v15;
  }
  else
  {
    v9 = (unsigned __int8 *)v15 + 2 * (BYTE1(v15->__traits_.__loc_.__locale_) == 125);
  }
LABEL_40:
  if (v15 == (std::basic_regex<char> *)v9)
    goto LABEL_46;
  if (v18 != -1)
  {
    if (v18 >= v12)
    {
      std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, v18, a4, __mexp_begin, __mexp_end, 1);
      return (std::basic_regex<char> *)v9;
    }
LABEL_45:
    std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)8>();
  }
  std::basic_regex<char,std::regex_traits<char>>::__push_loop(a1, v12, 0xFFFFFFFFFFFFFFFFLL, a4, __mexp_begin, __mexp_end, 1);
  return (std::basic_regex<char> *)v9;
}

std::basic_regex<char> *std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_expression<std::__wrap_iter<char const*>>(std::basic_regex<char> *this, std::basic_regex<char>::value_type *a2, std::basic_regex<char> *a3)
{
  std::__owns_one_state<char> *end;
  unsigned int marked_count;
  int v8;
  std::basic_regex<char> *v9;
  std::basic_regex<char>::value_type locale;
  std::basic_regex<char>::value_type *v11;
  _BOOL4 v12;
  uint64_t v13;
  std::__node<char> *v14;
  std::__owns_one_state<char> *v15;
  std::__node<char> *first;
  int v17;
  std::__node<char> *v18;
  BOOL v19;
  std::__owns_one_state<char> *v20;
  std::__node<char> *v21;
  uint64_t (**v22)();
  std::__node<char> *v23;
  unsigned int v24;
  std::__owns_one_state<char> *v25;
  std::__node<char> *v26;
  std::basic_regex<char> *v27;
  std::basic_regex<char> *v28;
  std::__node<char> *v29;
  std::__owns_one_state<char> *v30;
  std::__node<char> *v31;

  end = this->__end_;
  marked_count = this->__marked_count_;
  if (a2 != (std::basic_regex<char>::value_type *)a3)
  {
    v8 = *a2;
    switch(*a2)
    {
      case '$':
      case '(':
      case '*':
      case '+':
      case '.':
      case '?':
      case '[':
      case '\\':
      case '^':
      case '{':
      case '|':
        goto LABEL_3;
      case ')':
        if (!this->__open_count_)
          goto LABEL_8;
LABEL_3:
        v9 = (std::basic_regex<char> *)(a2 + 1);
        if (a2 + 1 != (std::basic_regex<char>::value_type *)a3 && v8 == 92)
        {
          locale = (std::basic_regex<char>::value_type)v9->__traits_.__loc_.__locale_;
          switch(LOBYTE(v9->__traits_.__loc_.__locale_))
          {
            case '$':
            case '(':
            case ')':
            case '*':
            case '+':
            case '.':
            case '?':
            case '[':
            case '\\':
            case '^':
            case '{':
            case '|':
            case '}':
              std::basic_regex<char,std::regex_traits<char>>::__push_char(this, locale);
              v9 = (std::basic_regex<char> *)(a2 + 2);
              return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)this, v9, a3, end, marked_count + 1, this->__marked_count_ + 1);
            default:
              if ((this->__flags_ & 0x1F0) == 0x40)
              {
                v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_awk_escape<std::__wrap_iter<char const*>>(this, a2 + 1, (std::basic_regex<char>::value_type *)a3, 0);
              }
              else
              {
                v12 = std::basic_regex<char,std::regex_traits<char>>::__test_back_ref(this, locale);
                v13 = 2;
                if (!v12)
                  v13 = 0;
                v11 = &a2[v13];
              }
              if (v11 != a2)
                goto LABEL_19;
              v8 = *a2;
              break;
          }
        }
        if (v8 != 46)
          goto LABEL_18;
        v14 = (std::__node<char> *)operator new(0x10uLL);
        v15 = this->__end_;
        first = v15->__first_;
        v14->__vftable = (std::__node<char>_vtbl *)&off_24CDC12B8;
        v14[1].__vftable = (std::__node<char>_vtbl *)first;
        v15->__first_ = v14;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
        break;
      default:
LABEL_8:
        std::basic_regex<char,std::regex_traits<char>>::__push_char(this, v8);
        v9 = (std::basic_regex<char> *)(a2 + 1);
        return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)this, v9, a3, end, marked_count + 1, this->__marked_count_ + 1);
    }
    return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)this, v9, a3, end, marked_count + 1, this->__marked_count_ + 1);
  }
LABEL_18:
  v11 = std::basic_regex<char,std::regex_traits<char>>::__parse_bracket_expression<std::__wrap_iter<char const*>>((uint64_t)this, a2, (std::basic_regex<char>::value_type *)a3);
LABEL_19:
  if (v11 != a2 || v11 == (std::basic_regex<char>::value_type *)a3)
  {
LABEL_35:
    v9 = (std::basic_regex<char> *)v11;
    if (v11 != a2)
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)this, v9, a3, end, marked_count + 1, this->__marked_count_ + 1);
    return (std::basic_regex<char> *)a2;
  }
  v17 = *a2;
  switch(v17)
  {
    case '$':
      v18 = (std::__node<char> *)operator new(0x18uLL);
      v19 = (this->__flags_ & 0x5F0) == 1024;
      v20 = this->__end_;
      v21 = v20->__first_;
      v22 = &off_24CDC0DA8;
      goto LABEL_26;
    case '(':
      if ((this->__flags_ & 2) != 0)
      {
        v24 = this->__marked_count_;
      }
      else
      {
        v23 = (std::__node<char> *)operator new(0x18uLL);
        v24 = this->__marked_count_ + 1;
        this->__marked_count_ = v24;
        v25 = this->__end_;
        v26 = v25->__first_;
        v23->__vftable = (std::__node<char>_vtbl *)&off_24CDC10C0;
        v23[1].__vftable = (std::__node<char>_vtbl *)v26;
        LODWORD(v23[2].__vftable) = v24;
        v25->__first_ = v23;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      ++this->__open_count_;
      v27 = (std::basic_regex<char> *)std::basic_regex<char,std::regex_traits<char>>::__parse_extended_reg_exp<std::__wrap_iter<char const*>>(this, a2 + 1, a3);
      if (v27 == a3 || (v28 = v27, LOBYTE(v27->__traits_.__loc_.__locale_) != 41))
        std::__throw_regex_error[abi:ne180100]<(std::regex_constants::error_type)6>();
      if ((this->__flags_ & 2) == 0)
      {
        v29 = (std::__node<char> *)operator new(0x18uLL);
        v30 = this->__end_;
        v31 = v30->__first_;
        v29->__vftable = (std::__node<char>_vtbl *)&off_24CDC1108;
        v29[1].__vftable = (std::__node<char>_vtbl *)v31;
        LODWORD(v29[2].__vftable) = v24;
        v30->__first_ = v29;
        this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      }
      --this->__open_count_;
      v11 = (char *)&v28->__traits_.__loc_.__locale_ + 1;
      goto LABEL_35;
    case '^':
      v18 = (std::__node<char> *)operator new(0x18uLL);
      v19 = (this->__flags_ & 0x5F0) == 1024;
      v20 = this->__end_;
      v21 = v20->__first_;
      v22 = &off_24CDC0D60;
LABEL_26:
      v18->__vftable = (std::__node<char>_vtbl *)v22;
      v18[1].__vftable = (std::__node<char>_vtbl *)v21;
      LOBYTE(v18[2].__vftable) = v19;
      v20->__first_ = v18;
      this->__end_ = (std::__owns_one_state<char> *)this->__end_->__first_;
      v9 = (std::basic_regex<char> *)(a2 + 1);
      return std::basic_regex<char,std::regex_traits<char>>::__parse_ERE_dupl_symbol<std::__wrap_iter<char const*>>((uint64_t)this, v9, a3, end, marked_count + 1, this->__marked_count_ + 1);
  }
  return (std::basic_regex<char> *)a2;
}

_QWORD *Capabilities::create_default_global@<X0>(_QWORD *a1@<X8>)
{
  void *v3;
  _QWORD *result;

  v3 = operator new(1uLL);
  *a1 = v3;
  result = operator new(0x20uLL);
  *result = off_24CDC1300;
  result[1] = 0;
  result[2] = 0;
  result[3] = v3;
  a1[1] = result;
  return result;
}

void sub_2124848AC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t Capabilities::isCMHandDetectionSupported(Capabilities *this)
{
  capabilities::abs::supportsCMHandDetection(this);
  return objc_msgSend(MEMORY[0x24BDC13A0], "isCallHandednessAvailable");
}

void std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::__on_zero_shared(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 24);
  if (v1)
    operator delete(v1);
}

uint64_t std::__shared_ptr_pointer<Capabilities *,std::shared_ptr<Capabilities>::__shared_ptr_default_delete<Capabilities,Capabilities>,std::allocator<Capabilities>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x8000000212485941)
    return a1 + 24;
  if (((v3 & 0x8000000212485941 & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x8000000212485941))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x8000000212485941 & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

uint64_t TelephonyUtilIsCarrierBuild()
{
  return MEMORY[0x24BED9720]();
}

uint64_t TelephonyUtilIsInternalBuild()
{
  return MEMORY[0x24BED9728]();
}

uint64_t TelephonyUtilIsVendorBuild()
{
  return MEMORY[0x24BED9730]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t capabilities::abs::supportsCMHandDetection(capabilities::abs *this)
{
  return MEMORY[0x24BED9118](this);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED9858](this, a2, a3);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const ctu::OsLogContext *a2)
{
  return MEMORY[0x24BED9860](this, a2);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
  MEMORY[0x24BED9868](this);
}

uint64_t ctu::OsLogContext::operator=()
{
  return MEMORY[0x24BED9870]();
}

uint64_t ctu::StaticLogger::StaticLogger()
{
  return MEMORY[0x24BED9880]();
}

uint64_t ctu::StaticLogger::StaticLogger(ctu::StaticLogger *this)
{
  return MEMORY[0x24BED9888](this);
}

void ctu::StaticLogger::~StaticLogger(ctu::StaticLogger *this)
{
  MEMORY[0x24BED98A0](this);
}

uint64_t ctu::LoggerCommonBase::operator=()
{
  return MEMORY[0x24BED99C8]();
}

uint64_t ctu::tokenize()
{
  return MEMORY[0x24BED9C98]();
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

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x24BEDABC8](this, *(_QWORD *)&__ecode);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::peek()
{
  return MEMORY[0x24BEDAE10]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x24BEDAE18]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x24BEDAE30]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x24BEDAE38]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF58]();
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

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
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

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24CDC08D8(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CDC08E0(__sz);
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

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAD990](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAD998](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

double difftime(time_t a1, time_t a2)
{
  double result;

  MEMORY[0x24BDADC30](a1, a2);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x24BDAE2B8](*(_QWORD *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x24BDAEAA0](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x24BDAEF98](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x24BDAFB38](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x24BDAFB80](__from, __to, __ec);
}

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int statvfs(const char *a1, statvfs *a2)
{
  return MEMORY[0x24BDAFEB8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strptime(const char *a1, const char *a2, tm *a3)
{
  return (char *)MEMORY[0x24BDAFF98](a1, a2, a3);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

