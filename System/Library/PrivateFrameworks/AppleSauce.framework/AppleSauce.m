uint64_t applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, int64_t value)
{
  uint64_t v4;
  xpc_object_t v5;
  std::logic_error *exception;

  v4 = MEMORY[0x1E0BFC9E0](*a1);
  v5 = *a1;
  if (v4 == MEMORY[0x1E0C81328])
  {
    value = xpc_int64_get_value(v5);
    if (value < 0)
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      sub_1DF2779DC(exception, "dyn_cast to uint64_t requires nonnegative values");
      __cxa_throw(exception, (struct type_info *)off_1EA982840, MEMORY[0x1E0DE42E0]);
    }
  }
  else if (MEMORY[0x1E0BFC9E0](v5) == MEMORY[0x1E0C81398])
  {
    return xpc_uint64_get_value(*a1);
  }
  return value;
}

void sub_1DF26EBA8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, int a2)
{
  return applesauce::xpc::dyn_cast_or_default(a1, a2);
}

uint64_t applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, uint64_t a2)
{
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  xpc_object_t v7;

  v4 = MEMORY[0x1E0BFC9E0](*a1);
  v5 = *a1;
  if (v4 == MEMORY[0x1E0C81328])
    return xpc_int64_get_value(v5);
  v6 = MEMORY[0x1E0BFC9E0](v5);
  v7 = *a1;
  if (v6 == MEMORY[0x1E0C81398])
    return xpc_uint64_get_value(v7);
  if (MEMORY[0x1E0BFC9E0](v7) == MEMORY[0x1E0C812D0])
    return applesauce::xpc::dyn_cast_or_default(a1, 0);
  return a2;
}

_QWORD *applesauce::xpc::dyn_cast_or_default@<X0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *result;
  char *string_ptr;
  size_t length;

  result = (_QWORD *)MEMORY[0x1E0BFC9E0](*a1);
  if (result == (_QWORD *)MEMORY[0x1E0C81390])
  {
    string_ptr = (char *)xpc_string_get_string_ptr(*a1);
    length = xpc_string_get_length(*a1);
    return sub_1DF28D548(a3, string_ptr, length);
  }
  else if (*(char *)(a2 + 23) < 0)
  {
    return sub_1DF279470(a3, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)a3 = *(_OWORD *)a2;
    a3[2] = *(_QWORD *)(a2 + 16);
  }
  return result;
}

_QWORD *docopt::operator<<(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _QWORD *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  char v22;
  char v23;
  char v24;
  char v25;

  v2 = a1;
  switch(*(_DWORD *)a2)
  {
    case 1:
      sub_1DF270BD4((int *)a2, 1u);
      if (*(_BYTE *)(a2 + 8))
        v4 = "true";
      else
        v4 = "false";
      if (*(_BYTE *)(a2 + 8))
        v5 = 4;
      else
        v5 = 5;
      a1 = v2;
      break;
    case 2:
      sub_1DF26EEE4(a2);
      std::ostream::operator<<();
      return v2;
    case 3:
      sub_1DF270BD4((int *)a2, 3u);
      v22 = 34;
      v6 = sub_1DF28BFF0(v2, (uint64_t)&v22, 1);
      v9 = *(_QWORD *)(a2 + 8);
      v8 = a2 + 8;
      v7 = v9;
      v10 = *(char *)(v8 + 23);
      if (v10 >= 0)
        v11 = v8;
      else
        v11 = v7;
      if (v10 >= 0)
        v12 = *(unsigned __int8 *)(v8 + 23);
      else
        v12 = *(_QWORD *)(v8 + 8);
      a1 = sub_1DF28BFF0(v6, v11, v12);
      v23 = 34;
      v4 = &v23;
      goto LABEL_30;
    case 4:
      sub_1DF270BD4((int *)a2, 4u);
      sub_1DF28BFF0(v2, (uint64_t)"[", 1);
      v13 = *(_QWORD *)(a2 + 8);
      v14 = *(_QWORD *)(a2 + 16);
      if (v13 != v14)
      {
        v15 = 1;
        do
        {
          if ((v15 & 1) == 0)
            sub_1DF28BFF0(v2, (uint64_t)", ", 2);
          v24 = 34;
          v16 = sub_1DF28BFF0(v2, (uint64_t)&v24, 1);
          v17 = *(char *)(v13 + 23);
          if (v17 >= 0)
            v18 = v13;
          else
            v18 = *(_QWORD *)v13;
          if (v17 >= 0)
            v19 = *(unsigned __int8 *)(v13 + 23);
          else
            v19 = *(_QWORD *)(v13 + 8);
          v20 = sub_1DF28BFF0(v16, v18, v19);
          v25 = 34;
          sub_1DF28BFF0(v20, (uint64_t)&v25, 1);
          v15 = 0;
          v13 += 24;
        }
        while (v13 != v14);
      }
      v4 = "]";
      a1 = v2;
LABEL_30:
      v5 = 1;
      break;
    default:
      v4 = "null";
      v5 = 4;
      break;
  }
  sub_1DF28BFF0(a1, (uint64_t)v4, v5);
  return v2;
}

uint64_t sub_1DF26EEE4(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  std::runtime_error *exception;
  std::string v5;
  size_t __idx;

  if (*(_DWORD *)a1 == 3)
  {
    __idx = 0;
    result = std::stol((const std::string *)(a1 + 8), &__idx, 10);
    if (*(char *)(a1 + 31) < 0)
      v3 = *(_QWORD *)(a1 + 16);
    else
      v3 = *(unsigned __int8 *)(a1 + 31);
    if (__idx != v3)
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      sub_1DF270CD8(" contains non-numeric characters.", (const void **)(a1 + 8), (void **)&v5.__r_.__value_.__l.__data_);
      std::runtime_error::runtime_error(exception, &v5);
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
  }
  else
  {
    sub_1DF270BD4((int *)a1, 2u);
    return *(_QWORD *)(a1 + 8);
  }
  return result;
}

void sub_1DF26EFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;
  int v15;

  if (a14 < 0)
  {
    operator delete(__p);
    if ((v15 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v15)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v14);
  goto LABEL_6;
}

void docopt::docopt_parse(uint64_t a1@<X0>, __int128 **a2@<X1>, int a3@<W2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X8>)
{
  const std::string *v9;
  std::string::size_type v10;
  std::string::size_type v11;
  unint64_t i;
  unsigned __int8 *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unsigned __int8 *v18;
  std::string::size_type v19;
  int v20;
  const std::string::value_type *v21;
  std::string::size_type v22;
  uint64_t v23;
  __int128 v24;
  std::string::size_type size;
  uint64_t *v26;
  uint64_t v27;
  int64x2_t v28;
  std::string::size_type v29;
  std::string::size_type v30;
  _QWORD *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  _QWORD *v41;
  _QWORD *v42;
  char *v43;
  __int128 v44;
  int64x2_t v45;
  _OWORD *v46;
  unint64_t v47;
  std::__shared_weak_count *v48;
  unint64_t *v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t *v54;
  int v55;
  _WORD *v56;
  _BOOL4 v57;
  _BOOL4 v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  _QWORD *v69;
  _QWORD *v70;
  char *v71;
  __int128 v72;
  int64x2_t v73;
  _OWORD *v74;
  uint64_t v75;
  std::__shared_weak_count *v76;
  unint64_t *v77;
  unint64_t v78;
  int v79;
  char *v80;
  char *v81;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  _QWORD *v91;
  _QWORD *v92;
  char *v93;
  __int128 v94;
  int64x2_t v95;
  _OWORD *v96;
  uint64_t v97;
  std::__shared_weak_count *v98;
  unint64_t *v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t v104;
  unint64_t v105;
  char *v106;
  uint64_t v107;
  char *v108;
  _QWORD *v109;
  _QWORD *v110;
  char *v111;
  __int128 v112;
  int64x2_t v113;
  _OWORD *v114;
  uint64_t v115;
  std::__shared_weak_count *v116;
  unint64_t *v117;
  unint64_t v118;
  int v119;
  int v120;
  uint64_t v121;
  std::string::size_type v122;
  _QWORD *v123;
  int *v124;
  uint64_t *v125;
  _QWORD *v126;
  _QWORD *v127;
  int *v128;
  uint64_t *v129;
  std::runtime_error *exception;
  std::runtime_error *v131;
  std::string *v132;
  __int128 v133;
  std::string *v134;
  __int128 v135;
  std::runtime_error *v136;
  char *v137;
  char *v138;
  std::runtime_error *v139;
  std::runtime_error *v140;
  void (__cdecl *v141)(std::runtime_error *__hidden);
  struct type_info *v142;
  int v143;
  char **v145;
  __int128 v148;
  uint64_t v149;
  __int128 v150;
  uint64_t v151;
  __int128 v152;
  unint64_t v153;
  char v154;
  void *__p;
  int64x2_t v156;
  uint64_t v157;
  __int128 v158;
  uint64_t v159;
  __int128 v160;
  uint64_t v161;
  uint64_t (**v162)();
  int64x2_t v163;
  uint64_t v164;
  int64x2_t v165;
  uint64_t v166;
  int64x2_t v167;
  _QWORD v168[2];
  _BYTE v169[32];
  int v170;
  __int128 v171;
  uint64_t v172;
  std::string v173;
  _BYTE v174[24];
  uint64_t v175;
  __int128 v176;
  uint64_t v177;
  const std::string *v178;
  const std::string *v179;
  std::string v180;
  std::string v181;
  __int128 v182;
  __int128 v183;
  std::string v184;
  unint64_t v185;
  _QWORD *v186;

  v164 = 0;
  v163 = 0uLL;
  v156 = 0uLL;
  __p = 0;
  v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
  sub_1DF271804((void ***)&v184);
  v162 = off_1EA983338;
  v160 = 0uLL;
  v161 = 0;
  sub_1DF28BE7C(&v184, "usage:");
  sub_1DF271F10(a1, (uint64_t *)&v178);
  if (SHIBYTE(v184.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v184.__r_.__value_.__l.__data_);
  if (v178 == v179)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "'usage:' (case-insensitive) not found.");
    goto LABEL_186;
  }
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v179 - (char *)v178) >> 3) >= 2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "More than one 'usage:' (case-insensitive).");
LABEL_186:
    exception->__vftable = (std::runtime_error_vtbl *)&unk_1EA983148;
    __cxa_throw(exception, (struct type_info *)&unk_1EA982B48, (void (*)(void *))std::runtime_error::~runtime_error);
  }
  sub_1DF272444(a1, (uint64_t *)&v176);
  v9 = v178;
  sub_1DF28BE7C(&v173, "(");
  v143 = a4;
  v145 = (char **)a2;
  v10 = std::string::find(v9, 58, 0);
  sub_1DF289760(v9, v10 + 1, (uint64_t *)&v184);
  v11 = v184.__r_.__value_.__r.__words[0];
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v184.__r_.__value_.__l.__size_ - v184.__r_.__value_.__r.__words[0]) >> 3) >= 2)
  {
    for (i = 1;
          i < 0xAAAAAAAAAAAAAAABLL
            * ((uint64_t)(v184.__r_.__value_.__l.__size_ - v184.__r_.__value_.__r.__words[0]) >> 3);
          ++i)
    {
      v13 = (unsigned __int8 *)(v11 + 24 * i);
      v14 = v13[23];
      if ((v14 & 0x80u) == 0)
        v15 = v13[23];
      else
        v15 = *((_QWORD *)v13 + 1);
      v16 = *(unsigned __int8 *)(v11 + 23);
      v17 = (char)v16;
      if ((v16 & 0x80u) != 0)
        v16 = *(_QWORD *)(v11 + 8);
      if (v15 != v16)
        goto LABEL_22;
      if (v17 >= 0)
        v18 = (unsigned __int8 *)v11;
      else
        v18 = *(unsigned __int8 **)v11;
      if ((v14 & 0x80) != 0)
      {
        if (memcmp(*(const void **)v13, v18, *((_QWORD *)v13 + 1)))
          goto LABEL_22;
      }
      else if (v13[23])
      {
        while (*v13 == *v18)
        {
          ++v13;
          ++v18;
          if (!--v14)
            goto LABEL_29;
        }
LABEL_22:
        std::string::push_back(&v173, 32);
        v19 = v184.__r_.__value_.__r.__words[0] + 24 * i;
        v20 = *(char *)(v19 + 23);
        if (v20 >= 0)
          v21 = (const std::string::value_type *)(v184.__r_.__value_.__r.__words[0] + 24 * i);
        else
          v21 = *(const std::string::value_type **)v19;
        if (v20 >= 0)
          v22 = *(unsigned __int8 *)(v19 + 23);
        else
          v22 = *(_QWORD *)(v19 + 8);
        std::string::append(&v173, v21, v22);
        goto LABEL_30;
      }
LABEL_29:
      std::string::append(&v173, ") | (");
LABEL_30:
      v11 = v184.__r_.__value_.__r.__words[0];
    }
  }
  std::string::append(&v173, ")");
  *(_QWORD *)&v171 = &v184;
  sub_1DF28BFB0((void ***)&v171);
  sub_1DF2831B0((uint64_t)&v173, (uint64_t)&v184);
  sub_1DF28340C(&v184, (uint64_t *)&v176, (uint64_t)&v171);
  if (v185 < 0xAAAAAAAAAAAAAAABLL
            * ((uint64_t)(v184.__r_.__value_.__l.__size_ - v184.__r_.__value_.__r.__words[0]) >> 3))
  {
    v131 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_1DF283890(&v184, &v180);
    v132 = std::string::insert(&v180, 0, "Unexpected ending: '");
    v133 = *(_OWORD *)&v132->__r_.__value_.__l.__data_;
    v181.__r_.__value_.__r.__words[2] = v132->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v181.__r_.__value_.__l.__data_ = v133;
    v132->__r_.__value_.__l.__size_ = 0;
    v132->__r_.__value_.__r.__words[2] = 0;
    v132->__r_.__value_.__r.__words[0] = 0;
    v134 = std::string::append(&v181, "'");
    v135 = *(_OWORD *)&v134->__r_.__value_.__l.__data_;
    *(_QWORD *)&v169[16] = *((_QWORD *)&v134->__r_.__value_.__l + 2);
    *(_OWORD *)v169 = v135;
    v134->__r_.__value_.__l.__size_ = 0;
    v134->__r_.__value_.__r.__words[2] = 0;
    v134->__r_.__value_.__r.__words[0] = 0;
    std::runtime_error::runtime_error(v131, (const std::string *)v169);
    v131->__vftable = (std::runtime_error_vtbl *)&unk_1EA983148;
    __cxa_throw(v131, (struct type_info *)&unk_1EA982B48, (void (*)(void *))std::runtime_error::~runtime_error);
  }
  v23 = v172;
  v24 = v171;
  v172 = 0;
  v171 = 0uLL;
  *(_OWORD *)&v174[8] = v24;
  memset(v169, 0, 24);
  v175 = v23;
  *(_QWORD *)v174 = off_1EA983338;
  v181.__r_.__value_.__r.__words[0] = (std::string::size_type)v169;
  sub_1DF271804((void ***)&v181);
  v181.__r_.__value_.__r.__words[0] = (std::string::size_type)&v171;
  sub_1DF271804((void ***)&v181);
  *(_QWORD *)&v171 = &v184;
  sub_1DF28BFB0((void ***)&v171);
  if (SHIBYTE(v173.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v173.__r_.__value_.__l.__data_);
  sub_1DF272934((void (***)(_QWORD **__return_ptr, _QWORD, const void *(*)(const void *)))v174, (uint64_t)&v181);
  sub_1DF289AF4((uint64_t)&v171, (uint64_t *)v181.__r_.__value_.__l.__data_, (uint64_t *)v181.__r_.__value_.__l.__size_);
  sub_1DF2729F0((void (***)(_QWORD **__return_ptr, _QWORD, const void *(*)(const void *)))v174, (uint64_t)&v180);
  size = v180.__r_.__value_.__l.__size_;
  v26 = (uint64_t *)v180.__r_.__value_.__r.__words[0];
  if (v180.__r_.__value_.__r.__words[0] != v180.__r_.__value_.__l.__size_)
  {
    do
    {
      v27 = a1;
      sub_1DF272444(a1, (uint64_t *)&v173);
      v28 = 0uLL;
      memset(v169, 0, sizeof(v169));
      v170 = 1065353216;
      v30 = v173.__r_.__value_.__l.__size_;
      v29 = v173.__r_.__value_.__r.__words[0];
      if (v173.__r_.__value_.__r.__words[0] == v173.__r_.__value_.__l.__size_)
        goto LABEL_60;
      do
      {
        v184.__r_.__value_.__r.__words[0] = v29;
        if (!sub_1DF289E40(&v171, (uint64_t *)&v184))
        {
          v184.__r_.__value_.__r.__words[0] = v29;
          sub_1DF289F50((uint64_t)v169, (uint64_t *)&v184, &v184);
        }
        v29 += 120;
      }
      while (v29 != v30);
      v31 = *(_QWORD **)&v169[16];
      v168[0] = 0;
      v28 = 0uLL;
      v167 = 0u;
      if (!*(_QWORD *)&v169[16])
      {
LABEL_60:
        v51 = 0;
      }
      else
      {
        do
        {
          sub_1DF287820(v31[2], &v182);
          v32 = v182;
          v183 = v182;
          v182 = 0uLL;
          v33 = v167.i64[1];
          if (v167.i64[1] >= v168[0])
          {
            v148 = v32;
            v34 = (v167.i64[1] - v167.i64[0]) >> 4;
            v35 = v34 + 1;
            if ((unint64_t)(v34 + 1) >> 60)
              sub_1DF271380();
            v36 = v168[0] - v167.i64[0];
            if ((v168[0] - v167.i64[0]) >> 3 > v35)
              v35 = v36 >> 3;
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0)
              v37 = 0xFFFFFFFFFFFFFFFLL;
            else
              v37 = v35;
            v186 = v168;
            v38 = (char *)sub_1DF271778((uint64_t)v168, v37);
            v40 = &v38[16 * v34];
            *(_OWORD *)v40 = v148;
            v183 = 0uLL;
            v41 = (_QWORD *)v167.i64[1];
            v42 = (_QWORD *)v167.i64[0];
            if (v167.i64[1] == v167.i64[0])
            {
              v45 = vdupq_n_s64(v167.u64[1]);
              v43 = &v38[16 * v34];
            }
            else
            {
              v43 = &v38[16 * v34];
              do
              {
                v44 = *((_OWORD *)v41 - 1);
                v41 -= 2;
                *((_OWORD *)v43 - 1) = v44;
                v43 -= 16;
                *v41 = 0;
                v41[1] = 0;
              }
              while (v41 != v42);
              v45 = v167;
            }
            v46 = v40 + 16;
            v167.i64[0] = (uint64_t)v43;
            v167.i64[1] = (uint64_t)(v40 + 16);
            *(int64x2_t *)&v184.__r_.__value_.__r.__words[1] = v45;
            v47 = v168[0];
            v168[0] = &v38[16 * v39];
            v185 = v47;
            v184.__r_.__value_.__r.__words[0] = v45.i64[0];
            sub_1DF2820F0((uint64_t)&v184);
            v48 = (std::__shared_weak_count *)*((_QWORD *)&v182 + 1);
            v167.i64[1] = (uint64_t)v46;
            if (*((_QWORD *)&v182 + 1))
            {
              v49 = (unint64_t *)(*((_QWORD *)&v182 + 1) + 8);
              do
                v50 = __ldaxr(v49);
              while (__stlxr(v50 - 1, v49));
              if (!v50)
              {
                ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
                std::__shared_weak_count::__release_weak(v48);
              }
            }
          }
          else
          {
            *(_OWORD *)v167.i64[1] = v32;
            v167.i64[1] = v33 + 16;
          }
          v31 = (_QWORD *)*v31;
        }
        while (v31);
        v28 = v167;
        v51 = v168[0];
      }
      v52 = *v26++;
      v165 = v28;
      v166 = v51;
      v168[0] = 0;
      v167 = 0uLL;
      sub_1DF271914((void **)(v52 + 8));
      *(int64x2_t *)(v52 + 8) = v165;
      *(_QWORD *)(v52 + 24) = v166;
      v165 = 0uLL;
      v166 = 0;
      v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v165;
      sub_1DF271804((void ***)&v184);
      v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v167;
      sub_1DF271804((void ***)&v184);
      sub_1DF289DC4((uint64_t)v169);
      v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v173;
      sub_1DF28C290((void ***)&v184);
      a1 = v27;
    }
    while (v26 != (uint64_t *)size);
    v26 = (uint64_t *)v180.__r_.__value_.__r.__words[0];
  }
  if (v26)
  {
    v180.__r_.__value_.__l.__size_ = (std::string::size_type)v26;
    operator delete(v26);
  }
  v156 = *(int64x2_t *)&v174[8];
  v157 = v175;
  *(_QWORD *)&v174[16] = 0;
  v175 = 0;
  *(_QWORD *)&v174[8] = 0;
  __p = off_1EA983338;
  v158 = v176;
  v159 = v177;
  v176 = 0uLL;
  v177 = 0;
  sub_1DF289DC4((uint64_t)&v171);
  if (v181.__r_.__value_.__r.__words[0])
  {
    v181.__r_.__value_.__l.__size_ = v181.__r_.__value_.__r.__words[0];
    operator delete(v181.__r_.__value_.__l.__data_);
  }
  *(_QWORD *)v174 = off_1EA983010;
  v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v174[8];
  sub_1DF271804((void ***)&v184);
  v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v176;
  sub_1DF28C290((void ***)&v184);
  v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v178;
  sub_1DF28BFB0((void ***)&v184);
  sub_1DF271914((void **)&v163);
  v163 = v156;
  v164 = v157;
  v157 = 0;
  v156 = 0uLL;
  sub_1DF28C314((void **)&v160);
  v160 = v158;
  v161 = v159;
  v159 = 0;
  v158 = 0uLL;
  v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v158;
  sub_1DF28C290((void ***)&v184);
  __p = off_1EA983010;
  v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&v156;
  sub_1DF271804((void ***)&v184);
  v171 = 0uLL;
  v172 = 0;
  v150 = 0uLL;
  v149 = 0;
  sub_1DF28BF2C((char *)&v149, *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  v152 = v150;
  v151 = v149;
  v149 = 0;
  v150 = 0uLL;
  v153 = 0;
  v154 = 1;
  memset(v169, 0, 24);
  if ((_QWORD)v152 != v151)
  {
    do
    {
      v53 = sub_1DF284C60(&v151);
      v54 = v53;
      v55 = *((char *)v53 + 23);
      if (v55 < 0)
      {
        if (v53[1] != 2)
          goto LABEL_74;
        v56 = (_WORD *)*v53;
      }
      else
      {
        v56 = v53;
        if (v55 != 2)
          goto LABEL_74;
      }
      if (*v56 == 11565)
      {
        while (v153 < 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v152 - v151) >> 3))
        {
          sub_1DF284D68(&v151, (__n128 *)&v184);
          sub_1DF28A1A8((char *)&unk_1DF29028E, (uint64_t)&v184, v174);
          v61 = *(_QWORD *)&v169[8];
          if (*(_QWORD *)&v169[8] >= *(_QWORD *)&v169[16])
          {
            v62 = (uint64_t)(*(_QWORD *)&v169[8] - *(_QWORD *)v169) >> 4;
            v63 = v62 + 1;
            if ((unint64_t)(v62 + 1) >> 60)
              sub_1DF271380();
            v64 = *(_QWORD *)&v169[16] - *(_QWORD *)v169;
            if ((uint64_t)(*(_QWORD *)&v169[16] - *(_QWORD *)v169) >> 3 > v63)
              v63 = v64 >> 3;
            if ((unint64_t)v64 >= 0x7FFFFFFFFFFFFFF0)
              v65 = 0xFFFFFFFFFFFFFFFLL;
            else
              v65 = v63;
            *(_QWORD *)&v158 = &v169[16];
            v66 = (char *)sub_1DF271778((uint64_t)&v169[16], v65);
            v68 = &v66[16 * v62];
            *(_OWORD *)v68 = *(_OWORD *)v174;
            *(_QWORD *)v174 = 0;
            *(_QWORD *)&v174[8] = 0;
            v69 = *(_QWORD **)&v169[8];
            v70 = *(_QWORD **)v169;
            if (*(_QWORD *)&v169[8] == *(_QWORD *)v169)
            {
              v73 = vdupq_n_s64(*(unint64_t *)&v169[8]);
              v71 = &v66[16 * v62];
            }
            else
            {
              v71 = &v66[16 * v62];
              do
              {
                v72 = *((_OWORD *)v69 - 1);
                v69 -= 2;
                *((_OWORD *)v71 - 1) = v72;
                v71 -= 16;
                *v69 = 0;
                v69[1] = 0;
              }
              while (v69 != v70);
              v73 = *(int64x2_t *)v169;
            }
            v74 = v68 + 16;
            *(_QWORD *)v169 = v71;
            *(_QWORD *)&v169[8] = v68 + 16;
            v156 = v73;
            v75 = *(_QWORD *)&v169[16];
            *(_QWORD *)&v169[16] = &v66[16 * v67];
            v157 = v75;
            __p = (void *)v73.i64[0];
            sub_1DF2820F0((uint64_t)&__p);
            v76 = *(std::__shared_weak_count **)&v174[8];
            *(_QWORD *)&v169[8] = v74;
            if (*(_QWORD *)&v174[8])
            {
              v77 = (unint64_t *)(*(_QWORD *)&v174[8] + 8);
              do
                v78 = __ldaxr(v77);
              while (__stlxr(v78 - 1, v77));
              if (!v78)
              {
                ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
                std::__shared_weak_count::__release_weak(v76);
              }
            }
          }
          else
          {
            **(_OWORD **)&v169[8] = *(_OWORD *)v174;
            *(_QWORD *)v174 = 0;
            *(_QWORD *)&v174[8] = 0;
            *(_QWORD *)&v169[8] = v61 + 16;
          }
          if (SHIBYTE(v184.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v184.__r_.__value_.__l.__data_);
        }
        continue;
      }
LABEL_74:
      sub_1DF28BE7C(&__p, "--");
      v57 = sub_1DF280244((const void **)v54, &__p);
      v58 = v57;
      if (v156.i8[15] < 0)
      {
        operator delete(__p);
        if (v58)
        {
LABEL_76:
          sub_1DF284DC8((uint64_t)&v151, (uint64_t *)&v160, (char **)&__p);
          v60 = (char *)__p;
          v59 = (char *)v156.i64[0];
          while (v60 != v59)
          {
            sub_1DF286F3C((char **)v169, (uint64_t)v60);
            v60 += 16;
          }
          goto LABEL_108;
        }
      }
      else if (v57)
      {
        goto LABEL_76;
      }
      v79 = *((char *)v54 + 23);
      if (v79 < 0)
      {
        if (*(_BYTE *)*v54 != 45 || v54[1] == 1)
        {
LABEL_116:
          if (a5)
          {
            while (v153 < 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v152 - v151) >> 3))
            {
              sub_1DF284D68(&v151, (__n128 *)&v184);
              sub_1DF28A1A8((char *)&unk_1DF29028E, (uint64_t)&v184, v174);
              v83 = *(_QWORD *)&v169[8];
              if (*(_QWORD *)&v169[8] >= *(_QWORD *)&v169[16])
              {
                v84 = (uint64_t)(*(_QWORD *)&v169[8] - *(_QWORD *)v169) >> 4;
                v85 = v84 + 1;
                if ((unint64_t)(v84 + 1) >> 60)
                  sub_1DF271380();
                v86 = *(_QWORD *)&v169[16] - *(_QWORD *)v169;
                if ((uint64_t)(*(_QWORD *)&v169[16] - *(_QWORD *)v169) >> 3 > v85)
                  v85 = v86 >> 3;
                if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFF0)
                  v87 = 0xFFFFFFFFFFFFFFFLL;
                else
                  v87 = v85;
                *(_QWORD *)&v158 = &v169[16];
                v88 = (char *)sub_1DF271778((uint64_t)&v169[16], v87);
                v90 = &v88[16 * v84];
                *(_OWORD *)v90 = *(_OWORD *)v174;
                *(_QWORD *)v174 = 0;
                *(_QWORD *)&v174[8] = 0;
                v91 = *(_QWORD **)&v169[8];
                v92 = *(_QWORD **)v169;
                if (*(_QWORD *)&v169[8] == *(_QWORD *)v169)
                {
                  v95 = vdupq_n_s64(*(unint64_t *)&v169[8]);
                  v93 = &v88[16 * v84];
                }
                else
                {
                  v93 = &v88[16 * v84];
                  do
                  {
                    v94 = *((_OWORD *)v91 - 1);
                    v91 -= 2;
                    *((_OWORD *)v93 - 1) = v94;
                    v93 -= 16;
                    *v91 = 0;
                    v91[1] = 0;
                  }
                  while (v91 != v92);
                  v95 = *(int64x2_t *)v169;
                }
                v96 = v90 + 16;
                *(_QWORD *)v169 = v93;
                *(_QWORD *)&v169[8] = v90 + 16;
                v156 = v95;
                v97 = *(_QWORD *)&v169[16];
                *(_QWORD *)&v169[16] = &v88[16 * v89];
                v157 = v97;
                __p = (void *)v95.i64[0];
                sub_1DF2820F0((uint64_t)&__p);
                v98 = *(std::__shared_weak_count **)&v174[8];
                *(_QWORD *)&v169[8] = v96;
                if (*(_QWORD *)&v174[8])
                {
                  v99 = (unint64_t *)(*(_QWORD *)&v174[8] + 8);
                  do
                    v100 = __ldaxr(v99);
                  while (__stlxr(v100 - 1, v99));
                  if (!v100)
                  {
                    ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
                    std::__shared_weak_count::__release_weak(v98);
                  }
                }
              }
              else
              {
                **(_OWORD **)&v169[8] = *(_OWORD *)v174;
                *(_QWORD *)v174 = 0;
                *(_QWORD *)&v174[8] = 0;
                *(_QWORD *)&v169[8] = v83 + 16;
              }
              if (SHIBYTE(v184.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v184.__r_.__value_.__l.__data_);
            }
          }
          else
          {
            sub_1DF284D68(&v151, (__n128 *)&v184);
            sub_1DF28A1A8((char *)&unk_1DF29028E, (uint64_t)&v184, v174);
            v101 = *(_QWORD *)&v169[8];
            if (*(_QWORD *)&v169[8] >= *(_QWORD *)&v169[16])
            {
              v102 = (uint64_t)(*(_QWORD *)&v169[8] - *(_QWORD *)v169) >> 4;
              v103 = v102 + 1;
              if ((unint64_t)(v102 + 1) >> 60)
                sub_1DF271380();
              v104 = *(_QWORD *)&v169[16] - *(_QWORD *)v169;
              if ((uint64_t)(*(_QWORD *)&v169[16] - *(_QWORD *)v169) >> 3 > v103)
                v103 = v104 >> 3;
              if ((unint64_t)v104 >= 0x7FFFFFFFFFFFFFF0)
                v105 = 0xFFFFFFFFFFFFFFFLL;
              else
                v105 = v103;
              *(_QWORD *)&v158 = &v169[16];
              v106 = (char *)sub_1DF271778((uint64_t)&v169[16], v105);
              v108 = &v106[16 * v102];
              *(_OWORD *)v108 = *(_OWORD *)v174;
              *(_QWORD *)v174 = 0;
              *(_QWORD *)&v174[8] = 0;
              v109 = *(_QWORD **)&v169[8];
              v110 = *(_QWORD **)v169;
              if (*(_QWORD *)&v169[8] == *(_QWORD *)v169)
              {
                v113 = vdupq_n_s64(*(unint64_t *)&v169[8]);
                v111 = &v106[16 * v102];
              }
              else
              {
                v111 = &v106[16 * v102];
                do
                {
                  v112 = *((_OWORD *)v109 - 1);
                  v109 -= 2;
                  *((_OWORD *)v111 - 1) = v112;
                  v111 -= 16;
                  *v109 = 0;
                  v109[1] = 0;
                }
                while (v109 != v110);
                v113 = *(int64x2_t *)v169;
              }
              v114 = v108 + 16;
              *(_QWORD *)v169 = v111;
              *(_QWORD *)&v169[8] = v108 + 16;
              v156 = v113;
              v115 = *(_QWORD *)&v169[16];
              *(_QWORD *)&v169[16] = &v106[16 * v107];
              v157 = v115;
              __p = (void *)v113.i64[0];
              sub_1DF2820F0((uint64_t)&__p);
              v116 = *(std::__shared_weak_count **)&v174[8];
              *(_QWORD *)&v169[8] = v114;
              if (*(_QWORD *)&v174[8])
              {
                v117 = (unint64_t *)(*(_QWORD *)&v174[8] + 8);
                do
                  v118 = __ldaxr(v117);
                while (__stlxr(v118 - 1, v117));
                if (!v118)
                {
                  ((void (*)(std::__shared_weak_count *))v116->__on_zero_shared)(v116);
                  std::__shared_weak_count::__release_weak(v116);
                }
              }
            }
            else
            {
              **(_OWORD **)&v169[8] = *(_OWORD *)v174;
              *(_QWORD *)v174 = 0;
              *(_QWORD *)&v174[8] = 0;
              *(_QWORD *)&v169[8] = v101 + 16;
            }
            if (SHIBYTE(v184.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v184.__r_.__value_.__l.__data_);
          }
          continue;
        }
      }
      else if (v79 == 1 || *(_BYTE *)v54 != 45)
      {
        goto LABEL_116;
      }
      sub_1DF285D88((uint64_t)&v151, (uint64_t *)&v160, (char **)&__p);
      v81 = (char *)__p;
      v80 = (char *)v156.i64[0];
      while (v81 != v80)
      {
        sub_1DF286F3C((char **)v169, (uint64_t)v81);
        v81 += 16;
      }
LABEL_108:
      v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
      sub_1DF271804((void ***)&v184);
    }
    while (v153 < 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v152 - v151) >> 3));
  }
  sub_1DF271914((void **)&v171);
  v171 = *(_OWORD *)v169;
  v172 = *(_QWORD *)&v169[16];
  memset(v169, 0, 24);
  __p = v169;
  sub_1DF271804((void ***)&__p);
  __p = &v151;
  sub_1DF28BFB0((void ***)&__p);
  __p = &v149;
  sub_1DF28BFB0((void ***)&__p);
  if (a3)
  {
    sub_1DF28BE7C(&__p, "-h");
    sub_1DF28BE7C(&v184, "--help");
    v119 = sub_1DF28A390((uint64_t **)&v171, (unsigned __int8 *)&__p, (unsigned __int8 *)&v184);
    if (SHIBYTE(v184.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v184.__r_.__value_.__l.__data_);
    if (v156.i8[15] < 0)
      operator delete(__p);
    if (v119)
    {
      v140 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v140, "Docopt --help argument encountered");
      v140->__vftable = (std::runtime_error_vtbl *)&unk_1EA983070;
      v141 = std::runtime_error::~runtime_error;
      v142 = (struct type_info *)&unk_1EA982AE8;
      goto LABEL_194;
    }
  }
  if (v143)
  {
    sub_1DF28BE7C(&__p, "--version");
    sub_1DF28BE7C(&v184, (char *)&unk_1DF29028E);
    v120 = sub_1DF28A390((uint64_t **)&v171, (unsigned __int8 *)&__p, (unsigned __int8 *)&v184);
    if (SHIBYTE(v184.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v184.__r_.__value_.__l.__data_);
    if (v156.i8[15] < 0)
      operator delete(__p);
    if (v120)
    {
      v140 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v140, "Docopt --version argument encountered");
      v140->__vftable = (std::runtime_error_vtbl *)&unk_1EA9830F8;
      v141 = std::runtime_error::~runtime_error;
      v142 = (struct type_info *)&unk_1EA982B18;
LABEL_194:
      __cxa_throw(v140, v142, (void (*)(void *))v141);
    }
  }
  __p = 0;
  v156 = 0uLL;
  v121 = sub_1DF2706C0((uint64_t)&v162);
  if (!(*(unsigned int (**)(uint64_t, __int128 *, void **))(*(_QWORD *)v121 + 16))(v121, &v171, &__p))
  {
    v136 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v136, "Arguments did not match expected patterns");
    v136->__vftable = (std::runtime_error_vtbl *)&unk_1EA983120;
    __cxa_throw(v136, (struct type_info *)&unk_1EA982B30, (void (*)(void *))std::runtime_error::~runtime_error);
  }
  if ((_QWORD)v171 != *((_QWORD *)&v171 + 1))
  {
    v137 = *v145;
    v138 = v145[1];
    sub_1DF28BE7C(v169, ", ");
    sub_1DF2708B8(v137, v138, (uint64_t)v169, &v184);
    if ((v169[23] & 0x80000000) != 0)
      operator delete(*(void **)v169);
    v139 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::operator+<char>();
    std::runtime_error::runtime_error(v139, (const std::string *)v169);
    v139->__vftable = (std::runtime_error_vtbl *)&unk_1EA983120;
    __cxa_throw(v139, (struct type_info *)&unk_1EA982B30, (void (*)(void *))std::runtime_error::~runtime_error);
  }
  *(_QWORD *)(a6 + 16) = 0;
  *(_QWORD *)(a6 + 8) = 0;
  *(_QWORD *)a6 = a6 + 8;
  memset(&v184, 0, sizeof(v184));
  ((void (*)(uint64_t, uint64_t))v162[1])((uint64_t)&v162, (uint64_t)&v184);
  v122 = v184.__r_.__value_.__l.__size_;
  v123 = (_QWORD *)v184.__r_.__value_.__r.__words[0];
  if (v184.__r_.__value_.__r.__words[0] != v184.__r_.__value_.__l.__size_)
  {
    do
    {
      v124 = (int *)(*v123 + 32);
      *(_QWORD *)v174 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v123 + 24))(*v123);
      v125 = sub_1DF28C434((uint64_t **)a6, *(const void ***)v174, (uint64_t)&unk_1DF28EA30, (__int128 **)v174);
      sub_1DF27072C((uint64_t)(v125 + 7), v124);
      ++v123;
    }
    while (v123 != (_QWORD *)v122);
    v123 = (_QWORD *)v184.__r_.__value_.__r.__words[0];
  }
  if (v123)
  {
    v184.__r_.__value_.__l.__size_ = (std::string::size_type)v123;
    operator delete(v123);
  }
  v126 = __p;
  v127 = (_QWORD *)v156.i64[0];
  if (__p != (void *)v156.i64[0])
  {
    do
    {
      v128 = (int *)(*v126 + 32);
      v184.__r_.__value_.__r.__words[0] = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v126 + 24))(*v126);
      v129 = sub_1DF28C434((uint64_t **)a6, (const void **)v184.__r_.__value_.__l.__data_, (uint64_t)&unk_1DF28EA30, (__int128 **)&v184);
      sub_1DF27072C((uint64_t)(v129 + 7), v128);
      v126 += 2;
    }
    while (v126 != v127);
  }
  v184.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
  sub_1DF271804((void ***)&v184);
  __p = &v171;
  sub_1DF271804((void ***)&__p);
  __p = &v160;
  sub_1DF28C290((void ***)&__p);
  v162 = off_1EA983010;
  __p = &v163;
  sub_1DF271804((void ***)&__p);
}

void sub_1DF270150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *__p,uint64_t a50,int a51,__int16 a52,char a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58)
{
  int v58;
  void *v59;
  uint64_t v60;

  if (a54 < 0)
  {
    operator delete(__p);
    if ((v58 & 1) == 0)
    {
LABEL_6:
      if (*(char *)(v60 - 121) < 0)
        operator delete(*(void **)(v60 - 144));
      __p = &a26;
      sub_1DF271804((void ***)&__p);
      __p = &a58;
      sub_1DF271804((void ***)&__p);
      a58 = (uint64_t)&a33;
      sub_1DF28C290((void ***)&a58);
      a37 = (uint64_t)off_1EA983010;
      a58 = a12;
      sub_1DF271804((void ***)&a58);
      _Unwind_Resume(a1);
    }
  }
  else if (!v58)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v59);
  goto LABEL_6;
}

void sub_1DF27054C()
{
  JUMPOUT(0x1DF270558);
}

void sub_1DF270658()
{
  __cxa_end_catch();
  JUMPOUT(0x1DF270670);
}

void sub_1DF2706AC(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t sub_1DF2706C0(uint64_t a1)
{
  _OWORD v3[2];
  int v4;

  memset(v3, 0, sizeof(v3));
  v4 = 1065353216;
  (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)a1 + 72))(a1, v3);
  sub_1DF28A5CC(a1);
  sub_1DF28BC60((uint64_t)v3);
  return a1;
}

void sub_1DF270718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1DF28BC60((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF27072C(uint64_t a1, int *a2)
{
  _BYTE *v3;
  int v5;
  __int128 v6;
  uint64_t v7;
  void **v8;

  v5 = *a2;
  switch(*a2)
  {
    case 1:
      LOBYTE(v6) = *((_BYTE *)a2 + 8);
      break;
    case 2:
      *(_QWORD *)&v6 = *((_QWORD *)a2 + 1);
      break;
    case 3:
      if (*((char *)a2 + 31) < 0)
      {
        sub_1DF279470(&v6, *((void **)a2 + 1), *((_QWORD *)a2 + 2));
      }
      else
      {
        v6 = *(_OWORD *)(a2 + 2);
        v7 = *((_QWORD *)a2 + 3);
      }
      break;
    case 4:
      v6 = 0uLL;
      v7 = 0;
      sub_1DF28BF2C((char *)&v6, *((__int128 **)a2 + 1), *((__int128 **)a2 + 2), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 2) - *((_QWORD *)a2 + 1)) >> 3));
      break;
    default:
      break;
  }
  if (*(_DWORD *)a1 == 4)
  {
    v8 = (void **)(a1 + 8);
    sub_1DF28BFB0(&v8);
  }
  else if (*(_DWORD *)a1 == 3 && *(char *)(a1 + 31) < 0)
  {
    operator delete(*(void **)(a1 + 8));
  }
  *(_DWORD *)a1 = v5;
  v3 = (_BYTE *)(a1 + 8);
  switch(v5)
  {
    case 1:
      *v3 = v6;
      break;
    case 2:
      *(_QWORD *)v3 = v6;
      break;
    case 3:
      *(_OWORD *)v3 = v6;
      *(_QWORD *)(a1 + 24) = v7;
      break;
    case 4:
      *(_OWORD *)(a1 + 8) = v6;
      *(_QWORD *)(a1 + 24) = v7;
      v7 = 0;
      v6 = 0uLL;
      v8 = (void **)&v6;
      sub_1DF28BFB0(&v8);
      break;
    default:
      return a1;
  }
  return a1;
}

char *sub_1DF2708B8@<X0>(char *result@<X0>, char *a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  char *v7;
  __int128 v8;
  char *i;
  int v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  int v13;
  const std::string::value_type *v14;
  std::string::size_type v15;

  if (result == a2)
  {
    a4->__r_.__value_.__r.__words[0] = 0;
    a4->__r_.__value_.__l.__size_ = 0;
    a4->__r_.__value_.__r.__words[2] = 0;
  }
  else
  {
    v7 = result;
    if (result[23] < 0)
    {
      result = (char *)sub_1DF279470(a4, *(void **)result, *((_QWORD *)result + 1));
    }
    else
    {
      v8 = *(_OWORD *)result;
      a4->__r_.__value_.__r.__words[2] = *((_QWORD *)result + 2);
      *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v8;
    }
    for (i = v7 + 24; i != a2; i += 24)
    {
      v10 = *(char *)(a3 + 23);
      if (v10 >= 0)
        v11 = (const std::string::value_type *)a3;
      else
        v11 = *(const std::string::value_type **)a3;
      if (v10 >= 0)
        v12 = *(unsigned __int8 *)(a3 + 23);
      else
        v12 = *(_QWORD *)(a3 + 8);
      std::string::append(a4, v11, v12);
      v13 = i[23];
      if (v13 >= 0)
        v14 = i;
      else
        v14 = *(const std::string::value_type **)i;
      if (v13 >= 0)
        v15 = i[23];
      else
        v15 = *((_QWORD *)i + 1);
      result = (char *)std::string::append(a4, v14, v15);
    }
  }
  return result;
}

void sub_1DF270974(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DF270990(uint64_t a1)
{
  void **v3;

  *(_QWORD *)a1 = off_1EA983010;
  v3 = (void **)(a1 + 8);
  sub_1DF271804(&v3);
  return a1;
}

void docopt::docopt(uint64_t a1@<X0>, __int128 **a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v6;

  v6 = *(unsigned __int8 *)(a4 + 23);
  if ((v6 & 0x80u) != 0)
    v6 = *(_QWORD *)(a4 + 8);
  docopt::docopt_parse(a1, a2, a3, v6 != 0, a5, a6);
}

_QWORD *sub_1DF270B44(_QWORD *a1)
{
  const std::locale::facet *v2;
  std::locale v4;

  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
  v2 = std::locale::use_facet(&v4, MEMORY[0x1E0DE4A90]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_1DF270BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

int *sub_1DF270BD4(int *result, unsigned int a2)
{
  int *v3;
  const std::string::value_type *v4;
  uint64_t v5;
  const std::string::value_type *v6;
  std::runtime_error *exception;
  std::string v8;

  if (*result != a2)
  {
    v3 = result;
    sub_1DF28BE7C(&v8, "Illegal cast to ");
    if (a2 > 4)
      v4 = "unknown";
    else
      v4 = off_1EA983A68[a2];
    std::string::append(&v8, v4);
    std::string::append(&v8, "; type is actually ");
    v5 = *v3;
    if (v5 > 4)
      v6 = "unknown";
    else
      v6 = off_1EA983A68[v5];
    std::string::append(&v8, v6);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, &v8);
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  return result;
}

void sub_1DF270CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF270CD8@<X0>(char *__s@<X1>, const void **a2@<X0>, void **a3@<X8>)
{
  size_t v6;
  size_t v7;
  uint64_t result;
  const void *v9;
  char *v10;

  if (*((char *)a2 + 23) >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  v7 = strlen(__s);
  result = sub_1DF270D90((uint64_t)a3, v6 + v7);
  if (*((char *)a3 + 23) < 0)
    a3 = (void **)*a3;
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0)
      v9 = a2;
    else
      v9 = *a2;
    result = (uint64_t)memmove(a3, v9, v6);
  }
  v10 = (char *)a3 + v6;
  if (v7)
    result = (uint64_t)memmove(v10, __s, v7);
  v10[v7] = 0;
  return result;
}

uint64_t sub_1DF270D90(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    sub_1DF270E14();
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

void sub_1DF270E14()
{
  sub_1DF270E28("basic_string");
}

void sub_1DF270E28(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1DF270E78(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1EA982838, MEMORY[0x1E0DE42D0]);
}

void sub_1DF270E64(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1DF270E78(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void sub_1DF270E9C()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void sub_1DF270EC4(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, _QWORD *a3@<X8>)
{
  int v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *__p;
  char *v11;

  v6 = a2();
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  if (v6)
  {
    v7 = operator new(8uLL);
    *a3 = v7;
    *v7++ = a1;
    a3[1] = v7;
    a3[2] = v7;
  }
  else
  {
    v9 = *(_QWORD **)(a1 + 8);
    v8 = *(_QWORD **)(a1 + 16);
    while (v9 != v8)
    {
      (**(void (***)(void **__return_ptr, _QWORD, uint64_t (*)(void)))*v9)(&__p, *v9, a2);
      sub_1DF2713C8((uint64_t)a3, a3[1], (char *)__p, v11, (v11 - (_BYTE *)__p) >> 3);
      if (__p)
      {
        v11 = (char *)__p;
        operator delete(__p);
      }
      v9 += 2;
    }
  }
}

void sub_1DF270F70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  uint64_t v11;
  void *v13;

  if (__p)
    operator delete(__p);
  v13 = *(void **)v11;
  if (*(_QWORD *)v11)
  {
    *(_QWORD *)(v11 + 8) = v13;
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DF270FA4(uint64_t result, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *i;
  uint64_t v5;

  v2 = *(uint64_t **)(result + 8);
  for (i = *(uint64_t **)(result + 16);
        v2 != i;
        result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 8))(v5, a2))
  {
    v5 = *v2;
    v2 += 2;
  }
  return result;
}

uint64_t sub_1DF270FF0(uint64_t a1, void **a2, void **a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  __int128 v10;
  _QWORD *v11;
  __int128 v12;
  _QWORD *v13;
  void **v14;

  v12 = 0uLL;
  v13 = 0;
  sub_1DF271698((char *)&v12, *a2, a2[1], ((_BYTE *)a2[1] - (_BYTE *)*a2) >> 4);
  v10 = 0uLL;
  v11 = 0;
  sub_1DF271874((char *)&v10, *a3, a3[1], ((_BYTE *)a3[1] - (_BYTE *)*a3) >> 4);
  v7 = *(_QWORD **)(a1 + 8);
  v6 = *(_QWORD **)(a1 + 16);
  while (1)
  {
    if (v7 == v6)
    {
      sub_1DF271914(a2);
      *(_OWORD *)a2 = v12;
      a2[2] = v13;
      v13 = 0;
      v12 = 0uLL;
      sub_1DF271914(a3);
      *(_OWORD *)a3 = v10;
      a3[2] = v11;
      v11 = 0;
      v10 = 0uLL;
      v8 = 1;
      goto LABEL_7;
    }
    if (((*(uint64_t (**)(_QWORD, __int128 *, __int128 *))(*(_QWORD *)*v7 + 16))(*v7, &v12, &v10) & 1) == 0)
      break;
    v7 += 2;
  }
  v8 = 0;
LABEL_7:
  v14 = (void **)&v10;
  sub_1DF271804(&v14);
  *(_QWORD *)&v10 = &v12;
  sub_1DF271804((void ***)&v10);
  return v8;
}

void sub_1DF271100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  a9 = (void **)&a13;
  sub_1DF271804(&a9);
  _Unwind_Resume(a1);
}

void sub_1DF271134()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Logic error: name() shouldnt be called on a BranchPattern");
  __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1DF271170(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF271184()
{
  return 0;
}

unint64_t sub_1DF27118C(_QWORD *a1)
{
  unint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;
  unsigned int v4;
  char *v5;
  char *v6;
  unint64_t i;
  uint64_t v8;

  if (!a1)
    __cxa_bad_typeid();
  v1 = *(_QWORD *)(*(_QWORD *)(*a1 - 8) + 8);
  if ((v1 & 0x8000000000000000) != 0)
  {
    v2 = (unsigned __int8 *)(v1 & 0x7FFFFFFFFFFFFFFFLL);
    v3 = 5381;
    do
    {
      v1 = v3;
      v4 = *v2++;
      v3 = (33 * v3) ^ v4;
    }
    while (v4);
  }
  v6 = (char *)a1[1];
  v5 = (char *)a1[2];
  for (i = ((v1 << 6) + (v1 >> 2) + ((v5 - v6) >> 4) + 2654435769u) ^ v1;
        v6 != v5;
        i ^= (i << 6) + 2654435769u + (i >> 2) + (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 40))(v8))
  {
    v8 = *(_QWORD *)v6;
    v6 += 16;
  }
  return i;
}

uint64_t sub_1DF271234(uint64_t a1)
{
  void **v3;

  *(_QWORD *)a1 = off_1EA983010;
  v3 = (void **)(a1 + 8);
  sub_1DF271804(&v3);
  return MEMORY[0x1E0BFC7D0](a1, 0xA1C4030951706);
}

void sub_1DF27128C()
{
  std::runtime_error *exception;

  exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
  std::runtime_error::runtime_error(exception, "Logic error: name() shouldnt be called on a BranchPattern");
  __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1DF2712C8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_1DF2712DC(void *result, uint64_t a2)
{
  const void **v2;
  const void **i;
  void *v5;
  char v6;

  v2 = (const void **)*((_QWORD *)result + 1);
  for (i = (const void **)*((_QWORD *)result + 2); v2 != i; v2 += 2)
  {
    if (*v2)
    {
      v5 = __dynamic_cast(*v2, (const struct __class_type_info *)&unk_1EA982BA8, (const struct __class_type_info *)&unk_1EA982AD0, 0);
      if (v5)
        (*(void (**)(void *, uint64_t))(*(_QWORD *)v5 + 72))(v5, a2);
    }
    result = sub_1DF2719E8(a2, v2, v2);
    if (!v6)
      result = sub_1DF271970(v2, (uint64_t *)result + 2);
  }
  return result;
}

void sub_1DF271380()
{
  sub_1DF270E28("vector");
}

void *sub_1DF271394(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_1DF270E9C();
  return operator new(8 * a2);
}

char *sub_1DF2713C8(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  char *v5;
  char *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void *__p;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;

  v5 = (char *)__dst;
  if (a5 < 1)
    return v5;
  v7 = __src;
  v11 = *(_QWORD *)(a1 + 16);
  v9 = a1 + 16;
  v10 = v11;
  v12 = *(_QWORD *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 3)
  {
    v13 = *(void **)a1;
    v14 = a5 + ((uint64_t)(v12 - *(_QWORD *)a1) >> 3);
    if (v14 >> 61)
      sub_1DF271380();
    v15 = (__dst - (uint64_t)v13) >> 3;
    v16 = v10 - (_QWORD)v13;
    if (v16 >> 2 > v14)
      v14 = v16 >> 2;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
      v17 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v17 = v14;
    v37 = v9;
    if (v17)
      v18 = (char *)sub_1DF271394(v9, v17);
    else
      v18 = 0;
    v28 = &v18[8 * v15];
    __p = v18;
    v34 = v28;
    v36 = &v18[8 * v17];
    v29 = 8 * a5;
    v30 = &v28[8 * a5];
    do
    {
      v31 = *(_QWORD *)v7;
      v7 += 8;
      *(_QWORD *)v28 = v31;
      v28 += 8;
      v29 -= 8;
    }
    while (v29);
    v35 = v30;
    v5 = sub_1DF2715D4((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34)
      v35 += (v34 - v35 + 7) & 0xFFFFFFFFFFFFFFF8;
    if (__p)
      operator delete(__p);
    return v5;
  }
  v19 = v12 - __dst;
  v20 = (uint64_t)(v12 - __dst) >> 3;
  if (v20 >= a5)
  {
    v21 = &__src[8 * a5];
    v23 = *(char **)(v9 - 8);
LABEL_17:
    v24 = &v5[8 * a5];
    v25 = &v23[-8 * a5];
    v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      v26 = v23;
      do
      {
        v27 = *(_QWORD *)v25;
        v25 += 8;
        *(_QWORD *)v26 = v27;
        v26 += 8;
      }
      while ((unint64_t)v25 < v12);
    }
    *(_QWORD *)(a1 + 8) = v26;
    if (v23 != v24)
      memmove(&v23[-8 * ((v23 - v24) >> 3)], v5, v23 - v24);
    if (v21 != v7)
      memmove(v5, v7, v21 - v7);
    return v5;
  }
  v21 = &__src[8 * v20];
  v22 = a4 - v21;
  if (a4 != v21)
    memmove(*(void **)(v9 - 8), &__src[8 * v20], a4 - v21);
  v23 = (char *)(v12 + v22);
  *(_QWORD *)(a1 + 8) = v12 + v22;
  if (v19 >= 1)
    goto LABEL_17;
  return v5;
}

void sub_1DF27159C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *sub_1DF2715D4(void **a1, uint64_t a2, char *__src)
{
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  int64_t v12;
  char *v13;
  void *v14;
  void *v15;

  v5 = *(char **)(a2 + 8);
  v6 = (char *)*a1;
  v7 = v5;
  if (*a1 != __src)
  {
    v8 = __src;
    v7 = *(char **)(a2 + 8);
    do
    {
      v9 = *((_QWORD *)v8 - 1);
      v8 -= 8;
      *((_QWORD *)v7 - 1) = v9;
      v7 -= 8;
    }
    while (v8 != v6);
  }
  *(_QWORD *)(a2 + 8) = v7;
  v10 = a1[1];
  v11 = *(_QWORD *)(a2 + 16);
  v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    v7 = *(char **)(a2 + 8);
  }
  *(_QWORD *)(a2 + 16) = v11 + v12;
  v13 = (char *)*a1;
  *a1 = v7;
  *(_QWORD *)(a2 + 8) = v13;
  v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v14;
  v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = v15;
  *(_QWORD *)a2 = *(_QWORD *)(a2 + 8);
  return v5;
}

char *sub_1DF271698(char *result, _QWORD *a2, _QWORD *a3, unint64_t a4)
{
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  if (a4)
  {
    v6 = result;
    result = sub_1DF271738(result, a4);
    v7 = (_QWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      *v7 = *a2;
      v8 = a2[1];
      v7[1] = v8;
      if (v8)
      {
        v9 = (unint64_t *)(v8 + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }
      a2 += 2;
      v7 += 2;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_1DF271724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  sub_1DF271804(&a9);
  _Unwind_Resume(a1);
}

char *sub_1DF271738(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    sub_1DF271380();
  result = (char *)sub_1DF271778((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void *sub_1DF271778(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    sub_1DF270E9C();
  return operator new(16 * a2);
}

uint64_t sub_1DF2717AC(uint64_t a1)
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

void sub_1DF271804(void ***a1)
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
    v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        v4 = sub_1DF2717AC(v4 - 16);
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

char *sub_1DF271874(char *result, _QWORD *a2, _QWORD *a3, unint64_t a4)
{
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  if (a4)
  {
    v6 = result;
    result = sub_1DF271738(result, a4);
    v7 = (_QWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      *v7 = *a2;
      v8 = a2[1];
      v7[1] = v8;
      if (v8)
      {
        v9 = (unint64_t *)(v8 + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }
      a2 += 2;
      v7 += 2;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_1DF271900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  sub_1DF271804(&a9);
  _Unwind_Resume(a1);
}

void sub_1DF271914(void **a1)
{
  void *v1;
  uint64_t v3;
  void *v4;

  v1 = *a1;
  if (*a1)
  {
    v3 = (uint64_t)a1[1];
    v4 = v1;
    if ((void *)v3 != v1)
    {
      do
        v3 = sub_1DF2717AC(v3 - 16);
      while ((void *)v3 != v1);
      v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

_QWORD *sub_1DF271970(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  v3 = a2[1];
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
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
  return a1;
}

uint64_t **sub_1DF2719E8(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  uint64_t ***v12;
  uint64_t **i;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD v29[2];
  char v30;

  v7 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a2 + 40))(*a2);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      v3 = v7;
      if (v7 >= v9)
        v3 = v7 % v9;
    }
    else
    {
      v3 = (v9 - 1) & v7;
    }
    v12 = *(uint64_t ****)(*(_QWORD *)a1 + 8 * v3);
    if (v12)
    {
      for (i = *v12; i; i = (uint64_t **)*i)
      {
        v14 = (unint64_t)i[1];
        if (v14 == v8)
        {
          v15 = (*(uint64_t (**)(uint64_t *))(*i[2] + 40))(i[2]);
          if (v15 == (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a2 + 40))(*a2))
            return i;
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9)
              v14 %= v9;
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3)
            break;
        }
      }
    }
  }
  v16 = operator new(0x20uLL);
  v29[0] = v16;
  v29[1] = a1 + 16;
  *v16 = 0;
  v16[1] = v8;
  v17 = a3[1];
  v16[2] = *a3;
  v16[3] = v17;
  if (v17)
  {
    v18 = (unint64_t *)(v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  v30 = 1;
  v20 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v21 = *(float *)(a1 + 32);
  if (!v9 || (float)(v21 * (float)v9) < v20)
  {
    v22 = 1;
    if (v9 >= 3)
      v22 = (v9 & (v9 - 1)) != 0;
    v23 = v22 | (2 * v9);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      v25 = v24;
    else
      v25 = v23;
    sub_1DF271C98(a1, v25);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v26 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v26)
  {
    *(_QWORD *)v29[0] = *v26;
    *v26 = v29[0];
  }
  else
  {
    *(_QWORD *)v29[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v29[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v29[0])
    {
      v27 = *(_QWORD *)(*(_QWORD *)v29[0] + 8);
      if ((v9 & (v9 - 1)) != 0)
      {
        if (v27 >= v9)
          v27 %= v9;
      }
      else
      {
        v27 &= v9 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v27) = v29[0];
    }
  }
  i = (uint64_t **)v29[0];
  v29[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  sub_1DF271ECC((uint64_t)v29, 0);
  return i;
}

void sub_1DF271C80(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DF271ECC((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void sub_1DF271C98(uint64_t a1, size_t __n)
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
      sub_1DF271D74(a1, prime);
  }
}

void sub_1DF271D74(uint64_t a1, unint64_t a2)
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
      sub_1DF270E9C();
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

void sub_1DF271ECC(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      sub_1DF2717AC((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void sub_1DF271F10(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  std::string *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  BOOL v10;
  char **v11;
  char **v12;
  std::string::size_type size;
  std::string *v14;
  void **v15;
  size_t v16;
  char *v17;
  std::string::size_type v18;
  void *v19;
  std::string *v20;
  std::string::size_type v21;
  void **v22;
  size_t v23;
  std::string *v24;
  std::string::size_type v25;
  std::string *v26;
  unint64_t v27;
  std::string *v28;
  std::string *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  std::string *v35;
  std::__shared_weak_count *v36;
  unint64_t *p_shared_owners;
  unint64_t v38;
  _QWORD v39[3];
  int v40;
  void *__p[2];
  _BYTE v42[25];
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  uint64_t v50;
  _BYTE v51[32];
  void *v52;
  _BYTE *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  std::locale v57;
  std::__shared_weak_count *v58;
  void **v59;
  size_t v60;
  unsigned __int8 v61;
  std::string v62;
  std::string v63;
  __int128 v64;
  std::string *v65;
  char *v66;
  uint64_t *v67;

  std::operator+<char>();
  v4 = std::string::append(&v63, "[^\\n]*(?=\\n?)(?:\\n[ \\t].*?(?=\\n|$))*)");
  v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v65 = (std::string *)v4->__r_.__value_.__r.__words[2];
  v64 = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  sub_1DF272AD4(&v57, (uint64_t)&v64, 1);
  if (SHIBYTE(v65) < 0)
    operator delete((void *)v64);
  if (SHIBYTE(v63.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v63.__r_.__value_.__l.__data_);
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v6 = *(unsigned __int8 *)(a1 + 23);
  if ((v6 & 0x80u) == 0)
    v7 = a1;
  else
    v7 = *(_QWORD *)a1;
  if ((v6 & 0x80u) != 0)
    v6 = *(_QWORD *)(a1 + 8);
  sub_1DF27D788((uint64_t)v51, v7, v7 + v6, (uint64_t)&v57, 0);
  v43 = 0;
  v44 = 0;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v48 = 0;
  v49 = 0;
  v50 = 0;
  *(_OWORD *)__p = 0u;
  memset(v42, 0, sizeof(v42));
  memset(v39, 0, sizeof(v39));
  v40 = 0;
  while (!sub_1DF27B404((uint64_t)v51, (uint64_t)v39))
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * ((v53 - (_BYTE *)v52) >> 3);
    v9 = (uint64_t *)((char *)v52 + 40);
    if (v8 <= 1)
      v9 = &v56;
    if (*(_BYTE *)v9)
    {
      v10 = v8 > 1;
      v11 = (char **)&v54;
      if (v10)
        v11 = (char **)((char *)v52 + 24);
      v12 = (char **)((char *)v52 + 32);
      if (!v10)
        v12 = (char **)&v55;
      sub_1DF277D38(&v62, *v11, *v12, *v12 - *v11);
    }
    else
    {
      memset(&v62, 0, sizeof(v62));
    }
    sub_1DF28BE7C(&v59, " \t\n");
    size = HIBYTE(v62.__r_.__value_.__r.__words[2]);
    if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v14 = &v62;
    else
      v14 = (std::string *)v62.__r_.__value_.__r.__words[0];
    if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = v62.__r_.__value_.__l.__size_;
    if ((v61 & 0x80u) == 0)
      v15 = (void **)&v59;
    else
      v15 = v59;
    if ((v61 & 0x80u) == 0)
      v16 = v61;
    else
      v16 = v60;
    v17 = (char *)&v14[-1].__r_.__value_.__r.__words[2] + 7;
    do
    {
      if (!size)
      {
        v26 = &v63;
        goto LABEL_55;
      }
      v18 = size;
      if (!v16)
        break;
      v19 = memchr(v15, v17[size], v16);
      size = v18 - 1;
    }
    while (v19);
    std::string::erase(&v62, v18, 0xFFFFFFFFFFFFFFFFLL);
    if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v20 = &v62;
    else
      v20 = (std::string *)v62.__r_.__value_.__r.__words[0];
    if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v21 = HIBYTE(v62.__r_.__value_.__r.__words[2]);
    else
      v21 = v62.__r_.__value_.__l.__size_;
    if ((v61 & 0x80u) == 0)
      v22 = (void **)&v59;
    else
      v22 = v59;
    if ((v61 & 0x80u) == 0)
      v23 = v61;
    else
      v23 = v60;
    if (v21)
    {
      v24 = v20;
      if (v23)
      {
        while (memchr(v22, v24->__r_.__value_.__s.__data_[0], v23))
        {
          v24 = (std::string *)((char *)v24 + 1);
          if (!--v21)
            goto LABEL_51;
        }
      }
      v25 = (char *)v24 - (char *)v20;
    }
    else
    {
LABEL_51:
      v25 = -1;
    }
    std::string::erase(&v62, 0, v25);
    v63 = v62;
    v26 = &v62;
LABEL_55:
    v26->__r_.__value_.__r.__words[0] = 0;
    v26->__r_.__value_.__l.__size_ = 0;
    v26->__r_.__value_.__r.__words[2] = 0;
    v28 = (std::string *)a2[1];
    v27 = a2[2];
    if ((unint64_t)v28 >= v27)
    {
      v30 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v28 - *a2) >> 3);
      v31 = v30 + 1;
      if (v30 + 1 > 0xAAAAAAAAAAAAAAALL)
        sub_1DF271380();
      v32 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v27 - *a2) >> 3);
      if (2 * v32 > v31)
        v31 = 2 * v32;
      if (v32 >= 0x555555555555555)
        v33 = 0xAAAAAAAAAAAAAAALL;
      else
        v33 = v31;
      v67 = a2 + 2;
      if (v33)
        v34 = (char *)sub_1DF274E5C((uint64_t)(a2 + 2), v33);
      else
        v34 = 0;
      v35 = (std::string *)&v34[24 * v30];
      *(_QWORD *)&v64 = v34;
      *((_QWORD *)&v64 + 1) = v35;
      v66 = &v34[24 * v33];
      *v35 = v63;
      v65 = v35 + 1;
      sub_1DF2794FC(a2, &v64);
      v29 = (std::string *)a2[1];
      sub_1DF279684((uint64_t)&v64);
    }
    else
    {
      *v28 = v63;
      v29 = v28 + 1;
      a2[1] = (uint64_t)&v28[1];
    }
    a2[1] = (uint64_t)v29;
    if ((char)v61 < 0)
      operator delete(v59);
    if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v62.__r_.__value_.__l.__data_);
    sub_1DF27B244((uint64_t)v51);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v52)
  {
    v53 = v52;
    operator delete(v52);
  }
  v36 = v58;
  if (v58)
  {
    p_shared_owners = (unint64_t *)&v58->__shared_owners_;
    do
      v38 = __ldaxr(p_shared_owners);
    while (__stlxr(v38 - 1, p_shared_owners));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  std::locale::~locale(&v57);
}

void sub_1DF272360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,std::locale a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  uint64_t v52;
  uint64_t v53;

  if (__p)
    operator delete(__p);
  if (a33)
    operator delete(a33);
  *(_QWORD *)(v53 - 208) = v52;
  sub_1DF28BFB0((void ***)(v53 - 208));
  sub_1DF2717AC((uint64_t)&a52);
  std::locale::~locale(&a47);
  _Unwind_Resume(a1);
}

void sub_1DF272444(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unsigned __int8 v4;
  uint64_t v5;
  __int128 v6;
  std::string *p_dst;
  std::string::size_type v8;
  std::string *v9;
  std::string::size_type size;
  std::string *v11;
  unint64_t v12;
  uint64_t *v13;
  BOOL v14;
  char **v15;
  char **v16;
  _BOOL4 v17;
  _BOOL4 v18;
  uint64_t v19;
  _QWORD v20[3];
  int v21;
  __int128 __p;
  _BYTE v23[25];
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  _BYTE v32[32];
  void *v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  std::string __dst;
  uint64_t v39;
  uint64_t v40;
  void **__s1[2];
  char v42;
  char v43;
  int v44;
  void *v45;
  char v46;
  void *v47;
  char v48;
  void *v49;
  char v50;
  const void *v51[2];
  uint64_t v52;
  void **v53;

  v4 = atomic_load((unsigned __int8 *)&qword_1F04740C8);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_1F04740C8))
  {
    sub_1DF27D888((const std::locale *)&unk_1F0474088, "(?:^|\\n)[ \\t]*(-(.|\\n)*?)(?=\\n[ \\t]*-|$)", 0);
    __cxa_atexit((void (*)(void *))sub_1DF272AAC, &unk_1F0474088, &dword_1DF26E000);
    __cxa_guard_release(&qword_1F04740C8);
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  sub_1DF28BE7C(__s1, "options:");
  sub_1DF271F10(a1, &v39);
  if (v42 < 0)
    operator delete(__s1[0]);
  v5 = v39;
  v19 = v40;
  if (v39 != v40)
  {
    while (1)
    {
      if (*(char *)(v5 + 23) < 0)
      {
        sub_1DF279470(&__dst, *(void **)v5, *(_QWORD *)(v5 + 8));
      }
      else
      {
        v6 = *(_OWORD *)v5;
        __dst.__r_.__value_.__r.__words[2] = *(_QWORD *)(v5 + 16);
        *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v6;
      }
      if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_dst = &__dst;
      else
        p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
      v8 = std::string::find(&__dst, 58, 0);
      if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v9 = &__dst;
      else
        v9 = (std::string *)__dst.__r_.__value_.__r.__words[0];
      std::string::erase(&__dst, (char *)p_dst - (char *)v9, v8 + 1);
      size = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
      if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v11 = &__dst;
      else
        v11 = (std::string *)__dst.__r_.__value_.__r.__words[0];
      if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        size = __dst.__r_.__value_.__l.__size_;
      sub_1DF27D788((uint64_t)v32, (uint64_t)v11, (uint64_t)v11 + size, (uint64_t)&unk_1F0474088, 0);
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      v30 = 0;
      v31 = 0;
      __p = 0u;
      memset(v23, 0, sizeof(v23));
      memset(v20, 0, sizeof(v20));
      v21 = 0;
      if (!sub_1DF27B404((uint64_t)v32, (uint64_t)v20))
        break;
LABEL_48:
      if ((_QWORD)__p)
      {
        *((_QWORD *)&__p + 1) = __p;
        operator delete((void *)__p);
      }
      if (v33)
      {
        v34 = v33;
        operator delete(v33);
      }
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__dst.__r_.__value_.__l.__data_);
      v5 += 24;
      if (v5 == v19)
        goto LABEL_55;
    }
    while (1)
    {
      v12 = 0xAAAAAAAAAAAAAAABLL * ((v34 - (_BYTE *)v33) >> 3);
      v13 = (uint64_t *)((char *)v33 + 40);
      if (v12 <= 1)
        v13 = &v37;
      if (*(_BYTE *)v13)
      {
        v14 = v12 > 1;
        if (v12 <= 1)
          v15 = (char **)&v35;
        else
          v15 = (char **)((char *)v33 + 24);
        v16 = (char **)((char *)v33 + 32);
        if (!v14)
          v16 = (char **)&v36;
        sub_1DF277D38(v51, *v15, *v16, *v16 - *v15);
      }
      else
      {
        v51[0] = 0;
        v51[1] = 0;
        v52 = 0;
      }
      sub_1DF28BE7C(__s1, "-");
      v17 = sub_1DF280244(v51, __s1);
      v18 = v17;
      if (v42 < 0)
      {
        operator delete(__s1[0]);
        if (v18)
        {
LABEL_34:
          sub_1DF2803DC((uint64_t)v51, (uint64_t)__s1);
          sub_1DF2802B8(a2, (uint64_t)__s1);
          if (v50 < 0)
            operator delete(v49);
          if (v48 < 0)
            operator delete(v47);
          __s1[0] = (void **)off_1EA982FB8;
          if (v44 == 4)
          {
            v53 = &v45;
            sub_1DF28BFB0(&v53);
          }
          else if (v44 == 3 && v46 < 0)
          {
            operator delete(v45);
          }
          if (v43 < 0)
            operator delete(__s1[1]);
        }
      }
      else if (v17)
      {
        goto LABEL_34;
      }
      if (SHIBYTE(v52) < 0)
        operator delete((void *)v51[0]);
      sub_1DF27B244((uint64_t)v32);
      if (sub_1DF27B404((uint64_t)v32, (uint64_t)v20))
        goto LABEL_48;
    }
  }
LABEL_55:
  __s1[0] = (void **)&v39;
  sub_1DF28BFB0(__s1);
}

void sub_1DF272800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,void *__p,uint64_t a52,int a53,__int16 a54,char a55,char a56,char a57)
{
  __cxa_guard_abort(&qword_1F04740C8);
  _Unwind_Resume(a1);
}

void sub_1DF272934(void (***a1)(_QWORD **__return_ptr, _QWORD, const void *(*)(const void *result))@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void **v8;

  (**a1)(&v5, a1, sub_1DF2899D8);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  v3 = v5;
  v4 = v6;
  v8 = (void **)a2;
  if (v5 != v6)
  {
    do
    {
      v7 = *v3;
      sub_1DF289A0C(&v8, &v7);
      ++v3;
    }
    while (v3 != v4);
    v3 = v5;
  }
  if (v3)
  {
    v6 = v3;
    operator delete(v3);
  }
}

void sub_1DF2729C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  uint64_t v11;
  void *v13;

  v13 = *(void **)v11;
  if (*(_QWORD *)v11)
  {
    *(_QWORD *)(v11 + 8) = v13;
    operator delete(v13);
  }
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1DF2729F0(void (***a1)(_QWORD **__return_ptr, _QWORD, const void *(*)(const void *result))@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  void **v8;

  (**a1)(&v5, a1, sub_1DF289E0C);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  v3 = v5;
  v4 = v6;
  v8 = (void **)a2;
  if (v5 != v6)
  {
    do
    {
      v7 = *v3;
      sub_1DF289A0C(&v8, &v7);
      ++v3;
    }
    while (v3 != v4);
    v3 = v5;
  }
  if (v3)
  {
    v6 = v3;
    operator delete(v3);
  }
}

void sub_1DF272A80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  uint64_t v11;
  void *v13;

  v13 = *(void **)v11;
  if (*(_QWORD *)v11)
  {
    *(_QWORD *)(v11 + 8) = v13;
    operator delete(v13);
  }
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1DF272AAC(std::locale *a1)
{
  sub_1DF2717AC((uint64_t)&a1[5]);
  std::locale::~locale(a1);
}

const std::locale *sub_1DF272AD4(const std::locale *a1, uint64_t a2, int a3)
{
  const std::locale *v6;
  uint64_t v7;
  char *v8;

  v6 = sub_1DF272B6C(a1);
  LODWORD(v6[3].__locale_) = a3;
  *(_OWORD *)((char *)&v6[3].__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v6[5].__locale_ + 4) = 0u;
  HIDWORD(v6[7].__locale_) = 0;
  v7 = *(unsigned __int8 *)(a2 + 23);
  if ((v7 & 0x80u) == 0)
    v8 = (char *)a2;
  else
    v8 = *(char **)a2;
  if ((v7 & 0x80u) != 0)
    v7 = *(_QWORD *)(a2 + 8);
  if (&v8[v7] != sub_1DF272BC8((uint64_t)v6, v8, &v8[v7]))
    sub_1DF272D38();
  return a1;
}

void sub_1DF272B50(_Unwind_Exception *a1)
{
  std::locale *v1;

  sub_1DF2717AC((uint64_t)&v1[5]);
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

const std::locale *sub_1DF272B6C(const std::locale *a1)
{
  const std::locale *v2;

  v2 = (const std::locale *)MEMORY[0x1E0BFC74C]();
  a1[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v2, MEMORY[0x1E0DE4A90]);
  a1[2].__locale_ = (std::locale::__imp *)std::locale::use_facet(a1, MEMORY[0x1E0DE4C08]);
  return a1;
}

void sub_1DF272BB4(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

char *sub_1DF272BC8(uint64_t a1, char *a2, char *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  unsigned int v8;

  v6 = (_QWORD *)operator new();
  *v6 = &unk_1EA983458;
  v7 = (_QWORD *)operator new();
  *v7 = &unk_1EA983518;
  v7[1] = v6;
  sub_1DF272D84((_QWORD *)(a1 + 40), (uint64_t)v7);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 40);
  v8 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v8 > 0x3F)
  {
    switch(v8)
    {
      case 0x40u:
        return sub_1DF273060(a1, a2, a3);
      case 0x80u:
        return (char *)sub_1DF273100(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
      case 0x100u:
        return sub_1DF273258(a1, a2, a3);
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
        sub_1DF2733B0();
      return sub_1DF273060(a1, a2, a3);
    }
    return sub_1DF272F14(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
  }
  else
  {
    return sub_1DF272DF4(a1, (unsigned __int8 *)a2, a3);
  }
}

void sub_1DF272D1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_1DF272D38()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 17);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF272D70(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1DF272D84(_QWORD *a1, uint64_t a2)
{
  std::__shared_weak_count *v3;
  __int128 v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  __int128 v7;

  sub_1DF273428(&v7, a2);
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

char *sub_1DF272DF4(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v6;
  unsigned __int8 *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = sub_1DF2736B0(a1, a2, a3);
  if (v7 == a2)
  {
    v8 = (_QWORD *)operator new();
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(v9 + 8);
    *v8 = &unk_1EA983518;
    v8[1] = v10;
    *(_QWORD *)(v9 + 8) = v8;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  if (v7 == (unsigned __int8 *)a3)
    return a3;
  while (*v7 == 124)
  {
    v11 = *(_QWORD *)(a1 + 56);
    v12 = v7 + 1;
    v7 = sub_1DF2736B0(a1, v7 + 1, a3);
    if (v12 == v7)
    {
      v13 = (_QWORD *)operator new();
      v14 = *(_QWORD *)(a1 + 56);
      v15 = *(_QWORD *)(v14 + 8);
      *v13 = &unk_1EA983518;
      v13[1] = v15;
      *(_QWORD *)(v14 + 8) = v13;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    sub_1DF2736F8(a1, v6, v11);
    if (v7 == (unsigned __int8 *)a3)
      return a3;
  }
  return (char *)v7;
}

char *sub_1DF272F14(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  char *v4;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
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
    *(_QWORD *)v6 = &unk_1EA9836C8;
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
      v3 = sub_1DF27A828(a1, (uint64_t)v3, v4);
    }
    while (v10 != v3);
    if (v10 != v4)
    {
      if (v10 + 1 != v4 || *v10 != 36)
        sub_1DF27A7DC();
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(v13 + 8);
      *(_QWORD *)v11 = &unk_1EA983728;
      *(_QWORD *)(v11 + 8) = v14;
      *(_BYTE *)(v11 + 16) = v12;
      *(_QWORD *)(v13 + 8) = v11;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
  }
  return v4;
}

char *sub_1DF273060(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unsigned __int8 *v10;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = sub_1DF27AE24(a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2)
LABEL_9:
    sub_1DF27A7DC();
  v8 = v7;
  while (v8 != (unsigned __int8 *)a3)
  {
    if (*v8 != 124)
      return (char *)v8;
    v9 = *(_QWORD *)(a1 + 56);
    v10 = sub_1DF27AE24(a1, (char *)v8 + 1, a3);
    if (v8 + 1 == v10)
      goto LABEL_9;
    v8 = v10;
    sub_1DF2736F8(a1, v6, v9);
  }
  return a3;
}

unsigned __int8 *sub_1DF273100(uint64_t a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  if (v8 == __s)
  {
    v9 = (_QWORD *)operator new();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(v10 + 8);
    *v9 = &unk_1EA983518;
    v9[1] = v11;
    *(_QWORD *)(v10 + 8) = v9;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  else
  {
    sub_1DF272F14(a1, __s, v8);
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
    v15 = *(_QWORD *)(a1 + 56);
    if (v14 == v12)
    {
      v16 = (_QWORD *)operator new();
      v17 = *(_QWORD *)(a1 + 56);
      v18 = *(_QWORD *)(v17 + 8);
      *v16 = &unk_1EA983518;
      v16[1] = v18;
      *(_QWORD *)(v17 + 8) = v16;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    else
    {
      sub_1DF272F14(a1, v12, v14);
    }
    sub_1DF2736F8(a1, v6, v15);
    if (v14 == a3)
      v12 = v14;
    else
      v12 = v14 + 1;
  }
  return a3;
}

char *sub_1DF273258(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = (char *)memchr(__s, 10, a3 - __s);
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  if (v8 == __s)
  {
    v9 = (_QWORD *)operator new();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(v10 + 8);
    *v9 = &unk_1EA983518;
    v9[1] = v11;
    *(_QWORD *)(v10 + 8) = v9;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  else
  {
    sub_1DF273060(a1, __s, v8);
  }
  if (v8 == a3)
    v12 = v8;
  else
    v12 = v8 + 1;
  while (v12 != a3)
  {
    v13 = (char *)memchr(v12, 10, a3 - v12);
    if (v13)
      v14 = v13;
    else
      v14 = a3;
    v15 = *(_QWORD *)(a1 + 56);
    if (v14 == v12)
    {
      v16 = (_QWORD *)operator new();
      v17 = *(_QWORD *)(a1 + 56);
      v18 = *(_QWORD *)(v17 + 8);
      *v16 = &unk_1EA983518;
      v16[1] = v18;
      *(_QWORD *)(v17 + 8) = v16;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    else
    {
      sub_1DF273060(a1, v12, v14);
    }
    sub_1DF2736F8(a1, v6, v15);
    if (v14 == a3)
      v12 = v14;
    else
      v12 = v14 + 1;
  }
  return a3;
}

void sub_1DF2733B0()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 14);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF2733E8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1DF273400()
{
  JUMPOUT(0x1E0BFC7D0);
}

void sub_1DF273414(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

_QWORD *sub_1DF273428(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &unk_1EA983950;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_1DF273480(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(exception_object);
}

void sub_1DF2734A4(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF2734C8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t sub_1DF2734E0(uint64_t a1, uint64_t a2)
{
  if (sub_1DF273520(a2, (uint64_t)&unk_1EA982C30))
    return a1 + 24;
  else
    return 0;
}

BOOL sub_1DF273520(uint64_t a1, uint64_t a2)
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

_QWORD *sub_1DF27356C(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &unk_1EA9835A8;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1DF2735B0(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &unk_1EA9835A8;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF273604(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_1DF273618(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &unk_1EA9835A8;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1DF27365C(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &unk_1EA9835A8;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x1E0BFC7D0);
}

unsigned __int8 *sub_1DF2736B0(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  unsigned __int8 *v5;

  do
  {
    v5 = a2;
    a2 = sub_1DF2737D8(a1, (char *)a2, a3);
  }
  while (v5 != a2);
  return v5;
}

_QWORD *sub_1DF2736F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *result;
  uint64_t v11;

  v6 = (_QWORD *)operator new();
  v7 = *(_QWORD *)(a3 + 8);
  v6[1] = *(_QWORD *)(a2 + 8);
  v6[2] = v7;
  *v6 = &unk_1EA983428;
  *(_QWORD *)(a2 + 8) = v6;
  *(_QWORD *)(a3 + 8) = 0;
  v8 = (_QWORD *)operator new();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *v8 = &unk_1EA983518;
  v8[1] = v9;
  *(_QWORD *)(a3 + 8) = v8;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = 0;
  result = (_QWORD *)operator new();
  v11 = *(_QWORD *)(a3 + 8);
  *result = &unk_1EA983988;
  result[1] = v11;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = result;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a3 + 8);
  return result;
}

unsigned __int8 *sub_1DF2737D8(uint64_t a1, char *a2, char *a3)
{
  unsigned __int8 *result;
  uint64_t v7;
  int v8;
  unsigned __int8 *v9;

  result = (unsigned __int8 *)sub_1DF27386C(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_DWORD *)(a1 + 28);
    v9 = sub_1DF273B1C(a1, (unsigned __int8 *)a2, a3);
    result = (unsigned __int8 *)a2;
    if (v9 != (unsigned __int8 *)a2)
      return sub_1DF273D04(a1, v9, (unsigned __int8 *)a3, v7, v8 + 1, *(_DWORD *)(a1 + 28) + 1);
  }
  return result;
}

char *sub_1DF27386C(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  int v6;
  int v7;
  char *v8;
  int v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int v16;
  char v17;
  int v18;
  std::locale v19[3];
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v6 = *a2;
  if (v6 <= 91)
  {
    if (v6 != 36)
    {
      if (v6 == 40 && a2 + 1 != a3 && a2[1] == 63 && a2 + 2 != a3)
      {
        v7 = a2[2];
        if (v7 == 33)
        {
          sub_1DF272B6C(v19);
          v20 = 0u;
          v22 = 0;
          v21 = 0u;
          LODWORD(v20) = *(_DWORD *)(a1 + 24);
          v8 = (char *)sub_1DF272BC8(v19, v3 + 3, a3);
          v18 = DWORD1(v20);
          sub_1DF274090(a1, (uint64_t)v19, 1, *(_DWORD *)(a1 + 28));
          *(_DWORD *)(a1 + 28) += v18;
          if (v8 == a3 || *v8 != 41)
            sub_1DF274134();
          goto LABEL_27;
        }
        if (v7 == 61)
        {
          sub_1DF272B6C(v19);
          v20 = 0u;
          v22 = 0;
          v21 = 0u;
          LODWORD(v20) = *(_DWORD *)(a1 + 24);
          v8 = (char *)sub_1DF272BC8(v19, v3 + 3, a3);
          v9 = DWORD1(v20);
          sub_1DF274090(a1, (uint64_t)v19, 0, *(_DWORD *)(a1 + 28));
          *(_DWORD *)(a1 + 28) += v9;
          if (v8 == a3 || *v8 != 41)
            sub_1DF274134();
LABEL_27:
          v3 = v8 + 1;
          sub_1DF2717AC((uint64_t)&v21);
          std::locale::~locale(v19);
          return v3;
        }
      }
      return v3;
    }
    v10 = operator new();
    v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(v12 + 8);
    v14 = (char *)&unk_1EA983718;
LABEL_17:
    *(_QWORD *)v10 = v14 + 16;
    *(_QWORD *)(v10 + 8) = v13;
    *(_BYTE *)(v10 + 16) = v11;
    *(_QWORD *)(v12 + 8) = v10;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    return ++v3;
  }
  if (v6 != 92)
  {
    if (v6 != 94)
      return v3;
    v10 = operator new();
    v11 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(v12 + 8);
    v14 = (char *)&unk_1EA9836B8;
    goto LABEL_17;
  }
  if (a2 + 1 != a3)
  {
    v16 = a2[1];
    if (v16 == 66)
    {
      v17 = 1;
    }
    else
    {
      if (v16 != 98)
        return v3;
      v17 = 0;
    }
    sub_1DF27400C(a1, v17);
    v3 += 2;
  }
  return v3;
}

void sub_1DF273AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_1DF2717AC((uint64_t)&a14);
  std::locale::~locale(&a9);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_1DF273B1C(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  unsigned __int8 *v3;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v11;
  char *v12;
  int v13;
  char *v14;
  char *v15;

  v3 = a2;
  if (a2 != (unsigned __int8 *)a3)
  {
    v6 = (char)*a2;
    if (v6 <= 62)
    {
      if (v6 == 40)
      {
        v11 = a2 + 1;
        if (a2 + 1 != (unsigned __int8 *)a3)
        {
          if (a2 + 2 != (unsigned __int8 *)a3 && *v11 == 63 && a2[2] == 58)
          {
            ++*(_DWORD *)(a1 + 36);
            v12 = (char *)sub_1DF272DF4(a1, a2 + 3, a3);
            if (v12 != a3 && *v12 == 41)
            {
              --*(_DWORD *)(a1 + 36);
              return (unsigned __int8 *)(v12 + 1);
            }
          }
          else
          {
            sub_1DF2759A4(a1);
            v13 = *(_DWORD *)(a1 + 28);
            ++*(_DWORD *)(a1 + 36);
            v14 = (char *)sub_1DF272DF4(a1, v11, a3);
            if (v14 != a3)
            {
              v15 = v14;
              if (*v14 == 41)
              {
                sub_1DF275A18(a1, v13);
                --*(_DWORD *)(a1 + 36);
                return (unsigned __int8 *)(v15 + 1);
              }
            }
          }
        }
        sub_1DF274134();
      }
      if (v6 == 46)
      {
        v7 = (_QWORD *)operator new();
        v8 = *(_QWORD *)(a1 + 56);
        v9 = *(_QWORD *)(v8 + 8);
        *v7 = &unk_1EA9839B8;
        v7[1] = v9;
        *(_QWORD *)(v8 + 8) = v7;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        return ++v3;
      }
      if ((v6 - 42) >= 2)
        return sub_1DF275AD0(a1, a2, a3);
LABEL_28:
      sub_1DF275A84();
    }
    if (v6 > 91)
    {
      if (v6 == 92)
        return sub_1DF2757F4(a1, a2, (unsigned __int8 *)a3);
      if (v6 == 123)
        goto LABEL_28;
    }
    else
    {
      if (v6 == 91)
        return (unsigned __int8 *)sub_1DF275894(a1, (char *)a2, a3);
      if (v6 == 63)
        goto LABEL_28;
    }
    return sub_1DF275AD0(a1, a2, a3);
  }
  return v3;
}

unsigned __int8 *sub_1DF273D04(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
{
  int v6;
  int v7;
  uint64_t v10;
  int v11;
  int v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  uint64_t v18;
  BOOL v19;
  BOOL v20;
  uint64_t v21;
  char v22;
  unsigned __int8 *v23;
  unsigned __int8 *v25;
  int v26;
  int v27;
  int v28;

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
        v14 = 0;
        v18 = 1;
        goto LABEL_33;
      }
      v14 = 0;
      v18 = 1;
      goto LABEL_45;
    }
    v13 = a2;
    if (v12 != 123)
      return v13;
    v15 = a2 + 1;
    v16 = sub_1DF27A200(a1, a2 + 1, a3, &v28);
    if (v15 != v16)
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
              v14 = v28;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              v18 = v28;
LABEL_33:
              v21 = a4;
              v22 = 0;
LABEL_46:
              sub_1DF27A0B8(a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }
            v14 = v28;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            v18 = v28;
LABEL_45:
            v21 = a4;
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
            v14 = v28;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }
          v14 = v28;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          v18 = -1;
          goto LABEL_45;
        }
        v27 = -1;
        v25 = sub_1DF27A200(v10, v23, a3, &v27);
        if (v23 != v25 && v25 != a3 && *v25 == 125)
        {
          v18 = v27;
          v14 = v28;
          if (v27 >= v28)
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
            v21 = a4;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
      }
      sub_1DF27A2E8();
    }
LABEL_58:
    sub_1DF27A29C();
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
      v14 = 0;
      goto LABEL_26;
    }
    v14 = 0;
    goto LABEL_36;
  }
  v13 = a2;
  if (v12 == 43)
  {
    v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      v13 = a2 + 2;
      v14 = 1;
LABEL_26:
      v18 = -1;
      goto LABEL_33;
    }
    v14 = 1;
    goto LABEL_36;
  }
  return v13;
}

__n128 sub_1DF27400C(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  __n128 result;

  v4 = operator new();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)v4 = &unk_1EA983548;
  *(_QWORD *)(v4 + 8) = v5;
  std::locale::locale((std::locale *)(v4 + 16), (const std::locale *)a1);
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v4 + 24) = result;
  *(_BYTE *)(v4 + 40) = a2;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v4;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  return result;
}

uint64_t sub_1DF274090(uint64_t a1, uint64_t a2, char a3, int a4)
{
  uint64_t v8;
  uint64_t result;

  v8 = operator new();
  result = sub_1DF274534(v8, a2, a3, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), a4);
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v8;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  return result;
}

void sub_1DF274110(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1E0BFC7D0](v1, 0x10E1C4030FC3181);
  _Unwind_Resume(a1);
}

void sub_1DF274134()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 6);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF27416C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF274180(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &unk_1EA9835A8;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1DF2741C4(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &unk_1EA9835A8;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF274218(uint64_t result, uint64_t a2)
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

_QWORD *sub_1DF274278(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &unk_1EA9835A8;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1DF2742BC(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &unk_1EA9835A8;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF274310(uint64_t result, uint64_t a2)
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

std::locale *sub_1DF274360(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_1EA983548;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_1EA9835A8;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_1DF2743B8(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_1EA983548;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_1EA9835A8;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF274420(uint64_t result, uint64_t a2)
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

uint64_t sub_1DF274534(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  *(_QWORD *)a1 = &unk_1EA983488;
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

std::locale *sub_1DF2745C0(std::locale *a1)
{
  std::locale *v2;
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_1EA983488;
  v2 = a1 + 2;
  sub_1DF2717AC((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&unk_1EA9835A8;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_1DF274628(std::locale *a1)
{
  std::locale *v2;
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_1EA983488;
  v2 = a1 + 2;
  sub_1DF2717AC((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)&unk_1EA9835A8;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x1E0BFC7D0);
}

void sub_1DF2746A0(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  char *v10;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  void *__p;
  char *v19;
  uint64_t v20;
  __int128 v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  char v27;
  char v28;
  uint64_t v29;

  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0uLL;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  __p = 0;
  v19 = 0;
  v4 = (*(_DWORD *)(a1 + 44) + 1);
  v6 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v20 = 0;
  *(_QWORD *)&v21 = v5;
  *((_QWORD *)&v21 + 1) = v5;
  v22 = 0;
  sub_1DF274C98((char **)&__p, v4, &v21);
  v23 = v6;
  v24 = v6;
  v25 = 0;
  v26 = v21;
  v27 = v22;
  v29 = v6;
  v28 = 1;
  v7 = *(_QWORD *)(a2 + 16);
  if (*(_BYTE *)(a2 + 92))
    v8 = v7 == *(_QWORD *)(a2 + 8);
  else
    v8 = 0;
  v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == sub_1DF274898(a1 + 16, v7, *(_QWORD *)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    v10 = (char *)__p;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 8);
  v10 = (char *)__p;
  v11 = 0xAAAAAAAAAAAAAAABLL * ((v19 - (_BYTE *)__p) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!v10)
      return;
    goto LABEL_14;
  }
  v12 = 0;
  v13 = *(_DWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a2 + 32);
  v15 = 1;
  do
  {
    v16 = &v10[24 * v15];
    v17 = v14 + 24 * (v13 + v12);
    *(_OWORD *)v17 = *(_OWORD *)v16;
    *(_BYTE *)(v17 + 16) = v16[16];
    v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:
  v19 = v10;
  operator delete(v10);
}

void sub_1DF274808(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *sub_1DF274828(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, char a5)
{
  _OWORD *v8;
  char *result;

  *(_QWORD *)(a1 + 24) = a4;
  v8 = (_OWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 32) = a4;
  *(_BYTE *)(a1 + 40) = 0;
  result = sub_1DF274C98((char **)a1, a2, (__int128 *)(a1 + 24));
  *(_QWORD *)(a1 + 48) = a3;
  *(_QWORD *)(a1 + 56) = a3;
  *(_BYTE *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 72) = *v8;
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a1 + 40);
  if ((a5 & 1) == 0)
    *(_QWORD *)(a1 + 104) = a3;
  *(_BYTE *)(a1 + 96) = 1;
  return result;
}

uint64_t sub_1DF274898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  _OWORD *v11;
  _OWORD *v12;
  unsigned int v13;
  uint64_t v14;
  _QWORD *v15;
  _OWORD *v16;
  uint64_t v17;
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
  __int128 v40;
  char v41;
  _OWORD *v42;
  _OWORD *v43;
  unint64_t v44;

  v42 = 0;
  v43 = 0;
  v44 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    *(_QWORD *)&v40 = a3;
    *((_QWORD *)&v40 + 1) = a3;
    v41 = 0;
    *(_DWORD *)v37 = 0;
    memset(&v37[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v39, 0, 21);
    v43 = (_OWORD *)sub_1DF274FE4((uint64_t *)&v42, (uint64_t)v37);
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
    v11 = v43;
    *((_DWORD *)v43 - 24) = 0;
    *((_QWORD *)v11 - 11) = a2;
    *((_QWORD *)v11 - 10) = a2;
    *((_QWORD *)v11 - 9) = a3;
    sub_1DF274EE0((uint64_t)(v11 - 4), *(unsigned int *)(a1 + 28), &v40);
    sub_1DF274F1C((uint64_t)v43 - 40, *(unsigned int *)(a1 + 32));
    v12 = v43;
    *((_QWORD *)v43 - 2) = v6;
    *((_DWORD *)v12 - 2) = a5;
    *((_BYTE *)v12 - 4) = a6;
    v13 = 1;
    while (2)
    {
      if ((v13 & 0xFFF) == 0 && (int)(v13 >> 12) >= (int)a3 - (int)a2)
        sub_1DF274F4C();
      v15 = v12 - 1;
      v14 = *((_QWORD *)v12 - 2);
      v16 = v12 - 6;
      if (v14)
        (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v14 + 16))(v14, v12 - 6);
      switch(*(_DWORD *)v16)
      {
        case 0xFFFFFC18:
          v17 = *((_QWORD *)v12 - 10);
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
          v18 = v43 - 6;
          sub_1DF27534C((uint64_t)&v44, (_QWORD *)v43 - 12);
          v43 = v18;
          goto LABEL_23;
        case 0xFFFFFC20:
          v19 = *(v12 - 5);
          *(_OWORD *)v37 = *v16;
          *(_OWORD *)&v37[16] = v19;
          memset(&v37[32], 0, 24);
          sub_1DF275684(&v37[32], *((__int128 **)v12 - 8), *((__int128 **)v12 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v12 - 7) - *((_QWORD *)v12 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v39[0] = 0;
          sub_1DF275700((char *)__p, *((__int128 **)v12 - 5), *((__int128 **)v12 - 4), (uint64_t)(*((_QWORD *)v12 - 4) - *((_QWORD *)v12 - 5)) >> 4);
          v20 = *v15;
          *(_QWORD *)((char *)&v39[1] + 5) = *(_QWORD *)((char *)v12 - 11);
          v39[1] = v20;
          (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)*v15 + 24))(*v15, 1, v12 - 6);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v39[1] + 24))(v39[1], 0, v37);
          v21 = v43;
          if ((unint64_t)v43 >= v44)
          {
            v43 = (_OWORD *)sub_1DF274FE4((uint64_t *)&v42, (uint64_t)v37);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v22 = *(_OWORD *)&v37[16];
            *v43 = *(_OWORD *)v37;
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
            v43 = v21 + 6;
          }
          if (*(_QWORD *)&v37[32])
          {
            *(_QWORD *)&v37[40] = *(_QWORD *)&v37[32];
            operator delete(*(void **)&v37[32]);
          }
LABEL_23:
          v12 = v43;
          ++v13;
          if (v42 != v43)
            continue;
          v6 = 0;
          break;
        default:
          sub_1DF274F98();
      }
      break;
    }
  }
  *(_QWORD *)v37 = &v42;
  sub_1DF275770((void ***)v37);
  return v6;
}

void sub_1DF274C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  uint64_t v18;

  sub_1DF274EA0(&a13);
  a13 = v18 - 112;
  sub_1DF275770((void ***)&a13);
  _Unwind_Resume(a1);
}

char *sub_1DF274C98(char **a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6;
  char *result;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  __int128 v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  __int128 v21;

  v6 = (uint64_t)a1[2];
  result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (uint64_t)result) >> 3) >= a2)
  {
    v15 = a1[1];
    v16 = (v15 - result) / 24;
    if (v16 >= a2)
      v17 = a2;
    else
      v17 = (v15 - result) / 24;
    if (v17)
    {
      v18 = result;
      do
      {
        *(_OWORD *)v18 = *a3;
        v18[16] = *((_BYTE *)a3 + 16);
        v18 += 24;
        --v17;
      }
      while (v17);
    }
    if (a2 <= v16)
    {
      a1[1] = &result[24 * a2];
    }
    else
    {
      v19 = &v15[24 * (a2 - v16)];
      v20 = 24 * a2 - 24 * v16;
      do
      {
        v21 = *a3;
        *((_QWORD *)v15 + 2) = *((_QWORD *)a3 + 2);
        *(_OWORD *)v15 = v21;
        v15 += 24;
        v20 -= 24;
      }
      while (v20);
      a1[1] = v19;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a2 > 0xAAAAAAAAAAAAAAALL)
      sub_1DF271380();
    v8 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    v9 = 2 * v8;
    if (2 * v8 <= a2)
      v9 = a2;
    if (v8 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v9;
    result = sub_1DF274E0C(a1, v10);
    v11 = a1[1];
    v12 = &v11[24 * a2];
    v13 = 24 * a2;
    do
    {
      v14 = *a3;
      *((_QWORD *)v11 + 2) = *((_QWORD *)a3 + 2);
      *(_OWORD *)v11 = v14;
      v11 += 24;
      v13 -= 24;
    }
    while (v13);
    a1[1] = v12;
  }
  return result;
}

char *sub_1DF274E0C(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_1DF271380();
  result = (char *)sub_1DF274E5C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *sub_1DF274E5C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_1DF270E9C();
  return operator new(24 * a2);
}

_QWORD *sub_1DF274EA0(_QWORD *a1)
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

void sub_1DF274EE0(uint64_t a1, unint64_t a2, __int128 *a3)
{
  unint64_t v3;
  BOOL v4;
  unint64_t v5;

  v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v4 = a2 >= v3;
  v5 = a2 - v3;
  if (v5 != 0 && v4)
  {
    sub_1DF275404((void **)a1, v5, a3);
  }
  else if (!v4)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 24 * a2;
  }
}

void sub_1DF274F1C(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 16 * a2;
  }
  else
  {
    sub_1DF275578((void **)a1, a2 - v2);
  }
}

void sub_1DF274F4C()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 12);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF274F84(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1DF274F98()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 16);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF274FD0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF274FE4(uint64_t *a1, uint64_t a2)
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
    sub_1DF271380();
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
    v10 = (char *)sub_1DF2751A4(v7, v9);
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
  sub_1DF275130(a1, v16);
  v14 = a1[1];
  sub_1DF275390(v16);
  return v14;
}

void sub_1DF27511C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DF275390((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF275130(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1DF2751E8((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_1DF2751A4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL)
    sub_1DF270E9C();
  return operator new(96 * a2);
}

uint64_t sub_1DF2751E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  sub_1DF2752C8((uint64_t)v12);
  return v10;
}

uint64_t sub_1DF2752C8(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1DF2752FC((uint64_t *)a1);
  return a1;
}

void sub_1DF2752FC(uint64_t *a1)
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
      sub_1DF27534C(v3, v1);
      v1 += 12;
    }
    while (v1 != v2);
  }
}

void sub_1DF27534C(uint64_t a1, _QWORD *a2)
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

void **sub_1DF275390(void **a1)
{
  sub_1DF2753C0(a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void sub_1DF2753C0(_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 96;
    sub_1DF27534C(v4, (_QWORD *)(i - 96));
  }
}

void sub_1DF275404(void **a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  __int128 v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  char *v23;
  char *v24;
  char *v25;
  __int128 v26;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD **)(v6 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (_BYTE *)v9) >> 3) >= a2)
  {
    if (a2)
    {
      v15 = &v9[3 * a2];
      v16 = 24 * a2;
      do
      {
        v17 = *a3;
        v9[2] = *((_QWORD *)a3 + 2);
        *(_OWORD *)v9 = v17;
        v9 += 3;
        v16 -= 24;
      }
      while (v16);
      v9 = v15;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (_BYTE *)*a1) >> 3);
    v11 = v10 + a2;
    if (v10 + a2 > 0xAAAAAAAAAAAAAAALL)
      sub_1DF271380();
    v12 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (_BYTE *)*a1) >> 3);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0x555555555555555)
      v13 = 0xAAAAAAAAAAAAAAALL;
    else
      v13 = v11;
    if (v13)
      v14 = (char *)sub_1DF274E5C(v6, v13);
    else
      v14 = 0;
    v18 = &v14[24 * v10];
    v19 = &v18[24 * a2];
    v20 = 24 * a2;
    v21 = v18;
    do
    {
      v22 = *a3;
      *((_QWORD *)v21 + 2) = *((_QWORD *)a3 + 2);
      *(_OWORD *)v21 = v22;
      v21 += 24;
      v20 -= 24;
    }
    while (v20);
    v23 = &v14[24 * v13];
    v25 = (char *)*a1;
    v24 = (char *)a1[1];
    if (v24 != *a1)
    {
      do
      {
        v26 = *(_OWORD *)(v24 - 24);
        *((_QWORD *)v18 - 1) = *((_QWORD *)v24 - 1);
        *(_OWORD *)(v18 - 24) = v26;
        v18 -= 24;
        v24 -= 24;
      }
      while (v24 != v25);
      v24 = (char *)*a1;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v23;
    if (v24)
      operator delete(v24);
  }
}

void sub_1DF275578(void **a1, unint64_t a2)
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

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 4);
    if (v9 >> 60)
      sub_1DF271380();
    v10 = v8 >> 4;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 3 > v9)
      v9 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)sub_1DF271778(v4, v12);
    else
      v13 = 0;
    v14 = &v13[16 * v10];
    v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    v16 = &v14[16 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
        v14 -= 16;
        v17 -= 16;
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

char *sub_1DF275684(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  uint64_t v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = sub_1DF274E0C(result, a4);
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

void sub_1DF2756E4(_Unwind_Exception *exception_object)
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

char *sub_1DF275700(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  _OWORD *v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = sub_1DF271738(result, a4);
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

void sub_1DF275754(_Unwind_Exception *exception_object)
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

void sub_1DF275770(void ***a1)
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
        sub_1DF27534C((uint64_t)(v1 + 2), v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

unsigned __int8 *sub_1DF2757F4(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v5;
  unsigned __int8 *result;

  if (a2 == a3 || *a2 != 92)
    return a2;
  v5 = a2 + 1;
  if (a2 + 1 == a3)
    sub_1DF275BD8();
  result = sub_1DF275C24(a1, a2 + 1, a3);
  if (v5 == result)
  {
    result = (unsigned __int8 *)sub_1DF275CD8(a1, (char *)a2 + 1, (char *)a3);
    if (v5 == result)
    {
      result = sub_1DF275DA4(a1, a2 + 1, (char *)a3, 0);
      if (v5 == result)
        return a2;
    }
  }
  return result;
}

char *sub_1DF275894(uint64_t a1, char *a2, char *a3)
{
  char *v5;
  uint64_t v6;
  uint64_t *v7;
  char *v8;

  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3)
      goto LABEL_20;
    v5 = a2[1] == 94 ? a2 + 2 : a2 + 1;
    v6 = sub_1DF276AF8(a1, a2[1] == 94);
    if (v5 == a3)
      goto LABEL_20;
    v7 = (uint64_t *)v6;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v5 == 93)
    {
      sub_1DF276B90(v6, 93);
      ++v5;
    }
    if (v5 == a3)
      goto LABEL_20;
    do
    {
      v8 = v5;
      v5 = sub_1DF277FC4(a1, v5, a3, v7);
    }
    while (v8 != v5);
    if (v8 == a3)
      goto LABEL_20;
    if (*v8 == 45)
    {
      sub_1DF276B90((uint64_t)v7, 45);
      ++v8;
    }
    if (v8 == a3 || *v8 != 93)
LABEL_20:
      sub_1DF277F78();
    return v8 + 1;
  }
  return a2;
}

uint64_t sub_1DF2759A4(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  if ((*(_BYTE *)(result + 24) & 2) == 0)
  {
    v1 = result;
    result = operator new();
    v2 = *(_DWORD *)(v1 + 28) + 1;
    *(_DWORD *)(v1 + 28) = v2;
    v3 = *(_QWORD *)(v1 + 56);
    v4 = *(_QWORD *)(v3 + 8);
    *(_QWORD *)result = &unk_1EA983A18;
    *(_QWORD *)(result + 8) = v4;
    *(_DWORD *)(result + 16) = v2;
    *(_QWORD *)(v3 + 8) = result;
    *(_QWORD *)(v1 + 56) = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8);
  }
  return result;
}

uint64_t sub_1DF275A18(uint64_t result, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)(result + 24) & 2) == 0)
  {
    v3 = result;
    result = operator new();
    v4 = *(_QWORD *)(v3 + 56);
    v5 = *(_QWORD *)(v4 + 8);
    *(_QWORD *)result = &unk_1EA9839E8;
    *(_QWORD *)(result + 8) = v5;
    *(_DWORD *)(result + 16) = a2;
    *(_QWORD *)(v4 + 8) = result;
    *(_QWORD *)(v3 + 56) = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8);
  }
  return result;
}

void sub_1DF275A84()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 11);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF275ABC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_BYTE *sub_1DF275AD0(uint64_t a1, _BYTE *a2, _BYTE *a3)
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
      sub_1DF276080(a1, (char)v4);
      ++v3;
    }
  }
  return v3;
}

_QWORD *sub_1DF275B40(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &unk_1EA9835A8;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1DF275B84(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &unk_1EA9835A8;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x1E0BFC7D0);
}

void sub_1DF275BD8()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 3);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF275C10(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_1DF275C24(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  int v4;
  uint64_t v5;
  int v6;

  v3 = a2;
  if (a2 != a3)
  {
    v4 = *a2;
    v5 = (v4 - 48);
    if (v4 == 48)
    {
      sub_1DF276080(a1, v5);
      return ++v3;
    }
    if ((v4 - 49) > 8)
      return v3;
    if (++v3 == a3)
    {
      v3 = a3;
    }
    else
    {
      while (1)
      {
        v6 = *v3;
        if ((v6 - 48) > 9)
          break;
        if (v5 >= 0x19999999)
          goto LABEL_16;
        ++v3;
        LODWORD(v5) = v6 + 10 * v5 - 48;
        if (v3 == a3)
        {
          v3 = a3;
          break;
        }
      }
      if (!(_DWORD)v5)
        goto LABEL_16;
    }
    if (v5 <= *(_DWORD *)(a1 + 28))
    {
      sub_1DF2761F0(a1, v5);
      return v3;
    }
LABEL_16:
    sub_1DF2761A4();
  }
  return v3;
}

char *sub_1DF275CD8(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  int v4;
  char v5;
  char v6;
  uint64_t v7;
  int v8;
  char v9;
  uint64_t v10;

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
    v7 = sub_1DF276AF8(a1, v6);
    v8 = *(_DWORD *)(v7 + 160) | 0x400;
LABEL_18:
    *(_DWORD *)(v7 + 160) = v8;
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
      v7 = sub_1DF276AF8(a1, v9);
      v8 = *(_DWORD *)(v7 + 160) | 0x4000;
      goto LABEL_18;
    case 'W':
      v5 = 1;
LABEL_15:
      v10 = sub_1DF276AF8(a1, v5);
      *(_DWORD *)(v10 + 160) |= 0x500u;
      sub_1DF276B90(v10, 95);
LABEL_19:
      ++v3;
      break;
  }
  return v3;
}

unsigned __int8 *sub_1DF275DA4(uint64_t a1, unsigned __int8 *a2, char *a3, std::string *this)
{
  unsigned __int8 *v4;
  int v5;
  char v6;
  std::string *v7;
  uint64_t v8;
  int v9;
  int v10;
  char v11;
  int v12;
  char v13;
  int v14;
  char v15;
  unsigned int v16;

  v4 = a2;
  if (a2 != (unsigned __int8 *)a3)
  {
    v5 = (char)*a2;
    if (v5 > 109)
    {
      v6 = 0;
      switch(*a2)
      {
        case 'n':
          if (this)
          {
            v7 = this;
            LOBYTE(v8) = 10;
            goto LABEL_52;
          }
          v8 = 10;
          goto LABEL_61;
        case 'r':
          if (this)
          {
            v7 = this;
            LOBYTE(v8) = 13;
            goto LABEL_52;
          }
          v8 = 13;
          goto LABEL_61;
        case 't':
          if (this)
          {
            v7 = this;
            LOBYTE(v8) = 9;
            goto LABEL_52;
          }
          v8 = 9;
          goto LABEL_61;
        case 'u':
          if (a2 + 1 == (unsigned __int8 *)a3)
            goto LABEL_66;
          v9 = a2[1];
          if ((v9 & 0xF8) != 0x30 && (v9 & 0xFE) != 0x38 && (v9 | 0x20u) - 97 >= 6)
            goto LABEL_66;
          v4 = a2 + 2;
          if (a2 + 2 == (unsigned __int8 *)a3)
            goto LABEL_66;
          v10 = *v4;
          v11 = -48;
          if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38)
            goto LABEL_24;
          v10 |= 0x20u;
          if ((v10 - 97) >= 6)
            goto LABEL_66;
          v11 = -87;
LABEL_24:
          v6 = 16 * (v11 + v10);
LABEL_25:
          if (v4 + 1 == (unsigned __int8 *)a3)
            goto LABEL_66;
          v12 = v4[1];
          v13 = -48;
          if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38)
            goto LABEL_30;
          v12 |= 0x20u;
          if ((v12 - 97) >= 6)
            goto LABEL_66;
          v13 = -87;
LABEL_30:
          if (v4 + 2 == (unsigned __int8 *)a3)
            goto LABEL_66;
          v14 = v4[2];
          v15 = -48;
          if ((v14 & 0xF8) == 0x30 || (v14 & 0xFE) == 0x38)
            goto LABEL_35;
          v14 |= 0x20u;
          if ((v14 - 97) >= 6)
            goto LABEL_66;
          v15 = -87;
LABEL_35:
          if (this)
            std::string::operator=(this, v15 + v14 + 16 * (v13 + v12 + v6));
          else
            sub_1DF276080(a1, (char)(v15 + v14 + 16 * (v13 + v12 + v6)));
          v4 += 3;
          return v4;
        case 'v':
          if (this)
          {
            v7 = this;
            LOBYTE(v8) = 11;
            goto LABEL_52;
          }
          v8 = 11;
          break;
        case 'x':
          goto LABEL_25;
        default:
          goto LABEL_47;
      }
      goto LABEL_61;
    }
    if (v5 == 48)
    {
      if (this)
      {
        v7 = this;
        LOBYTE(v8) = 0;
        goto LABEL_52;
      }
      v8 = 0;
LABEL_61:
      sub_1DF276080(a1, v8);
      return ++v4;
    }
    if (v5 != 99)
    {
      if (v5 == 102)
      {
        if (this)
        {
          v7 = this;
          LOBYTE(v8) = 12;
LABEL_52:
          std::string::operator=(v7, v8);
          return ++v4;
        }
        v8 = 12;
        goto LABEL_61;
      }
LABEL_47:
      if (*a2 != 95
        && ((v5 & 0x80) != 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 16) + 4 * *a2) & 0x500) == 0))
      {
        v8 = (char)v5;
        if (this)
        {
          v7 = this;
          goto LABEL_52;
        }
        goto LABEL_61;
      }
LABEL_66:
      sub_1DF275BD8();
    }
    if (a2 + 1 == (unsigned __int8 *)a3)
      goto LABEL_66;
    if ((char)a2[1] < 65)
      goto LABEL_66;
    v16 = a2[1];
    if (v16 >= 0x5B && (v16 - 97) > 0x19u)
      goto LABEL_66;
    if (this)
      std::string::operator=(this, v16 & 0x1F);
    else
      sub_1DF276080(a1, v16 & 0x1F);
    v4 += 2;
  }
  return v4;
}

uint64_t sub_1DF276080(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_DWORD *)(a1 + 24);
  if ((v4 & 1) != 0)
  {
    v8 = operator new();
    result = sub_1DF2762EC(v8, a1, a2, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8));
LABEL_6:
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v8;
    goto LABEL_7;
  }
  if ((v4 & 8) != 0)
  {
    v8 = operator new();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    *(_QWORD *)v8 = &unk_1EA9836F8;
    *(_QWORD *)(v8 + 8) = v9;
    result = (uint64_t)std::locale::locale((std::locale *)(v8 + 16), (const std::locale *)a1);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)(a1 + 8);
    *(_BYTE *)(v8 + 40) = a2;
    goto LABEL_6;
  }
  result = operator new();
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(v6 + 8);
  *(_QWORD *)result = &unk_1EA9834E8;
  *(_QWORD *)(result + 8) = v7;
  *(_BYTE *)(result + 16) = a2;
  *(_QWORD *)(v6 + 8) = result;
LABEL_7:
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  return result;
}

void sub_1DF276180(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1E0BFC7D0](v1, 0x10E1C4010F5D982);
  _Unwind_Resume(a1);
}

void sub_1DF2761A4()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 4);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF2761DC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF2761F0(uint64_t a1, int a2)
{
  int v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  std::locale *v8;
  std::locale *v9;
  std::locale::__imp *v10;
  char *v11;

  v4 = *(_DWORD *)(a1 + 24);
  if ((v4 & 1) != 0)
  {
    v8 = (std::locale *)operator new();
    v9 = v8;
    v10 = *(std::locale::__imp **)(*(_QWORD *)(a1 + 56) + 8);
    v11 = (char *)&unk_1EA983568;
LABEL_6:
    v8->__locale_ = (std::locale::__imp *)(v11 + 16);
    v8[1].__locale_ = v10;
    result = (uint64_t)std::locale::locale(v8 + 2, (const std::locale *)a1);
    *(_OWORD *)&v9[3].__locale_ = *(_OWORD *)(a1 + 8);
    LODWORD(v9[5].__locale_) = a2;
    *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v9;
    goto LABEL_7;
  }
  if ((v4 & 8) != 0)
  {
    v8 = (std::locale *)operator new();
    v9 = v8;
    v10 = *(std::locale::__imp **)(*(_QWORD *)(a1 + 56) + 8);
    v11 = (char *)&unk_1EA983628;
    goto LABEL_6;
  }
  result = operator new();
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(v6 + 8);
  *(_QWORD *)result = &unk_1EA9833F8;
  *(_QWORD *)(result + 8) = v7;
  *(_DWORD *)(result + 16) = a2;
  *(_QWORD *)(v6 + 8) = result;
LABEL_7:
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  return result;
}

uint64_t sub_1DF2762EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)a1 = &unk_1EA983668;
  *(_QWORD *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 40) = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 8) + 40))(*(_QWORD *)(a2 + 8), a3);
  return a1;
}

void sub_1DF276358(_Unwind_Exception *a1)
{
  _QWORD *v1;
  std::locale *v2;
  uint64_t v4;

  std::locale::~locale(v2);
  *v1 = &unk_1EA9835A8;
  v4 = v1[1];
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  _Unwind_Resume(a1);
}

std::locale *sub_1DF276390(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_1EA983668;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_1EA9835A8;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_1DF2763E8(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_1EA983668;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_1EA9835A8;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF276450(uint64_t result, uint64_t a2)
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

std::locale *sub_1DF2764C8(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_1EA9836F8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_1EA9835A8;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_1DF276520(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_1EA9836F8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_1EA9835A8;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF276588(uint64_t result, uint64_t a2)
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

_QWORD *sub_1DF2765D0(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &unk_1EA9835A8;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1DF276614(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &unk_1EA9835A8;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF276668(uint64_t result, uint64_t a2)
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

std::locale *sub_1DF2766B0(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_1EA983578;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_1EA9835A8;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_1DF276708(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_1EA983578;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_1EA9835A8;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF276770(uint64_t result, uint64_t a2)
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

std::locale *sub_1DF276854(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_1EA983638;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_1EA9835A8;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_1DF2768AC(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)&unk_1EA983638;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)&unk_1EA9835A8;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF276914(uint64_t result, uint64_t a2)
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

_QWORD *sub_1DF2769A4(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &unk_1EA9835A8;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1DF2769E8(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &unk_1EA9835A8;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x1E0BFC7D0);
}

unsigned int *sub_1DF276A3C(unsigned int *result, uint64_t a2)
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
    sub_1DF2761A4();
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

uint64_t sub_1DF276AF8(uint64_t a1, char a2)
{
  uint64_t v4;

  v4 = operator new();
  sub_1DF276DBC(v4, a1, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), a2, *(_DWORD *)(a1 + 24) & 1, (*(_DWORD *)(a1 + 24) & 8) != 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = v4;
  *(_QWORD *)(a1 + 56) = v4;
  return v4;
}

void sub_1DF276B6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1E0BFC7D0](v1, 0x10F1C4061CF1F02);
  _Unwind_Resume(a1);
}

void sub_1DF276B90(uint64_t a1, uint64_t a2)
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
      sub_1DF271380();
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

uint64_t sub_1DF276DBC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  const std::locale *v11;
  __int128 v12;
  BOOL v13;
  std::locale v15;
  std::string v16;

  *(_QWORD *)a1 = &unk_1EA983698;
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

void sub_1DF276ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10)
{
  _QWORD *v10;
  std::locale *v11;
  void **v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  sub_1DF28BFB0((void ***)&a10);
  v14 = (void *)v10[14];
  if (v14)
  {
    v10[15] = v14;
    operator delete(v14);
  }
  sub_1DF277A00((void ***)&a10);
  v15 = (void *)v10[8];
  if (v15)
  {
    v10[9] = v15;
    operator delete(v15);
  }
  v16 = *v12;
  if (*v12)
  {
    v10[6] = v16;
    operator delete(v16);
  }
  std::locale::~locale(v11);
  *v10 = &unk_1EA9835A8;
  v17 = v10[1];
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  _Unwind_Resume(a1);
}

std::locale *sub_1DF276F58(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  a1->__locale_ = (std::locale::__imp *)&unk_1EA983698;
  v7 = a1 + 17;
  sub_1DF28BFB0((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  sub_1DF277A00((void ***)&v7);
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
  a1->__locale_ = (std::locale::__imp *)&unk_1EA9835A8;
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return a1;
}

uint64_t sub_1DF27700C(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  a1->__locale_ = (std::locale::__imp *)&unk_1EA983698;
  v7 = a1 + 17;
  sub_1DF28BFB0((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  sub_1DF277A00((void ***)&v7);
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
  a1->__locale_ = (std::locale::__imp *)&unk_1EA9835A8;
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return MEMORY[0x1E0BFC7D0](a1, 0x10F1C4061CF1F02);
}

void sub_1DF2770D4(uint64_t a1, uint64_t a2)
{
  signed __int8 *v4;
  signed __int8 *v5;
  signed __int8 v6;
  signed __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  size_t v19;
  const void *p_p;
  uint64_t v21;
  BOOL v22;
  int v23;
  size_t v24;
  const void *v25;
  size_t v26;
  int v27;
  _BOOL4 v28;
  int v29;
  size_t v30;
  const void *v31;
  size_t v32;
  int v33;
  BOOL v34;
  int v35;
  int v36;
  uint64_t v37;
  size_t v38;
  unsigned __int8 v39;
  unsigned __int8 *v40;
  unint64_t v41;
  int v42;
  unsigned int v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  size_t v53;
  const void *v54;
  uint64_t v55;
  BOOL v56;
  int v57;
  size_t v58;
  const void *v59;
  size_t v60;
  int v61;
  _BOOL4 v62;
  int v63;
  size_t v64;
  const void *v65;
  size_t v66;
  int v67;
  BOOL v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  void *v74;
  size_t v75;
  size_t v76;
  uint64_t v77;
  BOOL v78;
  unsigned __int8 **v79;
  unsigned __int8 *v80;
  int v81;
  unsigned __int8 *v82;
  void **v83;
  uint64_t v84;
  unint64_t v85;
  int v86;
  unsigned int v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  size_t v94;
  void *v95;
  size_t v96;
  uint64_t v97;
  BOOL v98;
  unsigned __int8 **v99;
  unsigned __int8 *v100;
  int v101;
  unsigned __int8 *v102;
  void **v103;
  uint64_t v104;
  int v105;
  int v106;
  uint64_t v107;
  int v108;
  int v109;
  int v110;
  uint64_t v111;
  int v112;
  char v113;
  char v114;
  uint64_t v115;
  int v116;
  int v117;
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

  v4 = *(signed __int8 **)(a2 + 16);
  v5 = *(signed __int8 **)(a2 + 24);
  if (v4 == v5)
  {
    v37 = 0;
    v36 = *(unsigned __int8 *)(a1 + 168);
    goto LABEL_221;
  }
  if (!*(_BYTE *)(a1 + 171) || v4 + 1 == v5)
    goto LABEL_58;
  v6 = *v4;
  v125 = *v4;
  v7 = v4[1];
  v126 = v7;
  if (*(_BYTE *)(a1 + 169))
  {
    v125 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v6);
    v126 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v7);
  }
  v8 = a1 + 16;
  sub_1DF277BA4(a1 + 16, (char *)&v125, (char *)&v127, (uint64_t)&__p);
  if ((v124 & 0x80000000) == 0)
  {
    if (v124)
      goto LABEL_8;
LABEL_58:
    v36 = 0;
    v37 = 1;
    goto LABEL_59;
  }
  v38 = v123;
  operator delete(__p);
  if (!v38)
    goto LABEL_58;
LABEL_8:
  v9 = *(_QWORD *)(a1 + 112);
  v10 = *(_QWORD *)(a1 + 120) - v9;
  if (v10)
  {
    v11 = v10 >> 1;
    if ((unint64_t)(v10 >> 1) <= 1)
      v11 = 1;
    v12 = (_BYTE *)(v9 + 1);
    do
    {
      if (v125 == *(v12 - 1) && v126 == *v12)
        goto LABEL_218;
      v12 += 2;
      --v11;
    }
    while (v11);
  }
  if (!*(_BYTE *)(a1 + 170) || *(_QWORD *)(a1 + 88) == *(_QWORD *)(a1 + 96))
  {
    v36 = 0;
  }
  else
  {
    sub_1DF277B08(a1 + 16, (char *)&v125, (char *)&v127);
    v14 = *(_QWORD *)(a1 + 88);
    v15 = v124;
    v16 = *(_QWORD *)(a1 + 96) - v14;
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
        v23 = *(char *)(v14 + 23);
        if (v23 >= 0)
          v24 = *(unsigned __int8 *)(v14 + 23);
        else
          v24 = *(_QWORD *)(v14 + 8);
        if (v23 >= 0)
          v25 = (const void *)v14;
        else
          v25 = *(const void **)v14;
        if (v24 >= v19)
          v26 = v19;
        else
          v26 = v24;
        v27 = memcmp(p_p, v25, v26);
        v28 = v19 >= v24;
        if (v27)
          v28 = v27 >= 0;
        if (v28)
        {
          v29 = *(char *)(v14 + 47);
          if (v29 >= 0)
            v30 = *(unsigned __int8 *)(v14 + 47);
          else
            v30 = *(_QWORD *)(v14 + 32);
          if (v29 >= 0)
            v31 = (const void *)(v14 + 24);
          else
            v31 = *(const void **)(v14 + 24);
          if (v19 >= v30)
            v32 = v30;
          else
            v32 = v19;
          v33 = memcmp(v31, p_p, v32);
          v34 = v30 >= v19;
          if (v33)
            v34 = v33 >= 0;
          if (v34)
            break;
        }
        v22 = ++v17 < v18;
        v14 += 48;
        if (v21 == v17)
        {
          v35 = 0;
          v36 = 0;
          goto LABEL_162;
        }
      }
      v36 = 1;
      v35 = 5;
LABEL_162:
      v8 = a1 + 16;
      v15 = v113;
    }
    else
    {
      v22 = 0;
      v35 = 0;
      v36 = 0;
    }
    if (v15 < 0)
      operator delete(__p);
    if (v22)
      goto LABEL_195;
  }
  if (*(_QWORD *)(a1 + 136) == *(_QWORD *)(a1 + 144))
    goto LABEL_200;
  sub_1DF277DDC(v8, (char *)&v125, (char *)&v127, (uint64_t)&__p);
  v89 = *(_QWORD *)(a1 + 136);
  v90 = v124;
  v91 = *(_QWORD *)(a1 + 144) - v89;
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
      v99 = (unsigned __int8 **)(v89 + 24 * v92);
      v100 = (unsigned __int8 *)*((unsigned __int8 *)v99 + 23);
      v101 = (char)v100;
      if ((char)v100 < 0)
        v100 = v99[1];
      if ((unsigned __int8 *)v96 == v100)
      {
        if (v101 >= 0)
          v102 = (unsigned __int8 *)(v89 + 24 * v92);
        else
          v102 = *v99;
        if ((v90 & 0x80) == 0)
        {
          if ((_DWORD)v90)
          {
            v103 = &__p;
            v104 = v90;
            do
            {
              if (*(unsigned __int8 *)v103 != *v102)
                goto LABEL_188;
              v103 = (void **)((char *)v103 + 1);
              ++v102;
              --v104;
            }
            while (v104);
            v36 = 1;
            v35 = 5;
            goto LABEL_192;
          }
          v36 = 1;
          if (v98)
            goto LABEL_220;
LABEL_200:
          if ((char)v125 < 0)
          {
            v109 = *(_DWORD *)(a1 + 164);
            goto LABEL_213;
          }
          v106 = *(_DWORD *)(a1 + 160);
          v107 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16);
          v108 = *(_DWORD *)(v107 + 4 * v125);
          if ((v108 & v106) == 0 && (v125 != 95 || (v106 & 0x80) == 0)
            || (char)v126 < 0
            || (*(_DWORD *)(v107 + 4 * v126) & v106) == 0 && ((v106 & 0x80) == 0 || v126 != 95))
          {
            v109 = *(_DWORD *)(a1 + 164);
            if ((v108 & v109) != 0 || v125 == 95 && (v109 & 0x80) != 0)
            {
LABEL_217:
              v110 = v36;
              goto LABEL_219;
            }
LABEL_213:
            if (((char)v126 & 0x80000000) == 0)
            {
              if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4 * v126) & v109) != 0)
                goto LABEL_217;
              v110 = 1;
              if (v126 == 95 && (v109 & 0x80) != 0)
                goto LABEL_217;
LABEL_219:
              v36 = v110;
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
    v36 = 1;
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
  v39 = **(_BYTE **)(a2 + 16);
  v125 = v39;
  if (*(_BYTE *)(a1 + 169))
  {
    v39 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), (char)v39);
    v125 = v39;
  }
  v40 = *(unsigned __int8 **)(a1 + 40);
  v41 = *(_QWORD *)(a1 + 48) - (_QWORD)v40;
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
    v36 = 1;
    goto LABEL_221;
  }
LABEL_66:
  v43 = *(_DWORD *)(a1 + 164);
  if (v43 || *(_QWORD *)(a1 + 64) != *(_QWORD *)(a1 + 72))
  {
    if ((v39 & 0x80) != 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4 * v39) & v43) == 0)
      v44 = (v39 == 95) & (v43 >> 7);
    else
      LOBYTE(v44) = 1;
    v45 = *(void **)(a1 + 72);
    v46 = memchr(*(void **)(a1 + 64), (char)v39, (size_t)v45 - *(_QWORD *)(a1 + 64));
    v47 = v46 ? v46 : v45;
    if ((v44 & 1) == 0 && v47 == v45)
      goto LABEL_77;
  }
  v49 = *(_QWORD *)(a1 + 88);
  v48 = *(_QWORD *)(a1 + 96);
  if (v49 != v48)
  {
    if (*(_BYTE *)(a1 + 170))
    {
      sub_1DF277B08(a1 + 16, (char *)&v125, (char *)&v126);
      v49 = *(_QWORD *)(a1 + 88);
      v48 = *(_QWORD *)(a1 + 96);
    }
    else
    {
      v124 = 1;
      LOWORD(__p) = v39;
    }
    v50 = v48 - v49;
    if (v50)
    {
      v119 = v37;
      v116 = v36;
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
        v57 = *(char *)(v49 + 23);
        if (v57 >= 0)
          v58 = *(unsigned __int8 *)(v49 + 23);
        else
          v58 = *(_QWORD *)(v49 + 8);
        if (v57 >= 0)
          v59 = (const void *)v49;
        else
          v59 = *(const void **)v49;
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
          v63 = *(char *)(v49 + 47);
          if (v63 >= 0)
            v64 = *(unsigned __int8 *)(v49 + 47);
          else
            v64 = *(_QWORD *)(v49 + 32);
          if (v63 >= 0)
            v65 = (const void *)(v49 + 24);
          else
            v65 = *(const void **)(v49 + 24);
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
        v49 += 48;
        if (v55 == v51)
        {
          v36 = v116;
          goto LABEL_123;
        }
      }
      v36 = 1;
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
  if (*(_QWORD *)(a1 + 136) == *(_QWORD *)(a1 + 144))
    goto LABEL_154;
  sub_1DF277DDC(a1 + 16, (char *)&v125, (char *)&v126, (uint64_t)&__p);
  v69 = *(_QWORD *)(a1 + 136);
  v70 = v124;
  v71 = *(_QWORD *)(a1 + 144) - v69;
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
      v79 = (unsigned __int8 **)(v69 + 24 * v72);
      v80 = (unsigned __int8 *)*((unsigned __int8 *)v79 + 23);
      v81 = (char)v80;
      if ((char)v80 < 0)
        v80 = v79[1];
      if ((unsigned __int8 *)v76 == v80)
      {
        if (v81 >= 0)
          v82 = (unsigned __int8 *)(v69 + 24 * v72);
        else
          v82 = *v79;
        if ((v70 & 0x80) != 0)
        {
          v117 = v36;
          v85 = v73;
          v115 = v77;
          v86 = memcmp(v74, v82, v75);
          v77 = v115;
          v73 = v85;
          v36 = v117;
          if (!v86)
          {
            v36 = 1;
            v37 = v120;
            goto LABEL_152;
          }
        }
        else
        {
          if (!(_DWORD)v70)
          {
            v36 = 1;
            v37 = v120;
            if (!v78)
              goto LABEL_154;
            goto LABEL_221;
          }
          v83 = &__p;
          v84 = v70;
          while (*(unsigned __int8 *)v83 == *v82)
          {
            v83 = (void **)((char *)v83 + 1);
            ++v82;
            if (!--v84)
            {
              v36 = 1;
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
    v87 = *(_DWORD *)(a1 + 160);
    if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4 * v125) & v87) == 0)
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
  if (v36 == *(unsigned __int8 *)(a1 + 168))
  {
    v111 = 0;
    v112 = -993;
  }
  else
  {
    *(_QWORD *)(a2 + 16) += v37;
    v111 = *(_QWORD *)(a1 + 8);
    v112 = -995;
  }
  *(_DWORD *)a2 = v112;
  *(_QWORD *)(a2 + 80) = v111;
}

void sub_1DF27798C(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1DF2779DC(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1EA982840, MEMORY[0x1E0DE42E0]);
}

void sub_1DF2779C8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1DF2779DC(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

void sub_1DF277A00(void ***a1)
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
        sub_1DF277A84((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1DF277A84(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 47) < 0)
    operator delete(*(void **)(a2 + 24));
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

uint64_t sub_1DF277AC8(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void sub_1DF277B08(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4;
  void **v5;
  void *__p[2];
  unsigned __int8 v7;

  sub_1DF277D38(__p, a2, a3, a3 - a2);
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

void sub_1DF277B88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1DF277BA4(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
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

  sub_1DF277D38(&__s, a2, a3, a3 - a2);
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

void sub_1DF277D04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_1DF277D38(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    sub_1DF270E14();
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

void sub_1DF277DDC(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  sub_1DF277D38(__p, a2, a3, a3 - a2);
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

void sub_1DF277EB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_1DF277ED0(_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_1DF270E14();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void sub_1DF277F78()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 5);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF277FB0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_1DF277FC4(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  char *v4;
  int v5;
  uint64_t v6;
  int v9;
  char *v10;
  int v11;
  int v12;
  char *v13;
  char *v14;
  int v15;
  std::string *v16;
  _BYTE *v17;
  char *v18;
  char *v19;
  std::string::size_type size;
  char v21;
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
      v10 = sub_1DF278564(a1, a2 + 2, a3, (uint64_t)a4);
      goto LABEL_38;
    }
    if (v9 == 61)
    {
      v10 = sub_1DF278388(a1, a2 + 2, a3, a4);
LABEL_38:
      v6 = (uint64_t)v10;
      v21 = 0;
      goto LABEL_42;
    }
    goto LABEL_9;
  }
  v19 = sub_1DF278614(a1, a2 + 2, a3, (uint64_t)&v26);
  v4 = v19;
  v11 = *(_DWORD *)(a1 + 24) & 0x1F0;
  size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v26.__r_.__value_.__l.__size_;
  v14 = v19;
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
          v14 = sub_1DF27881C(a1, v13, a3, &v26);
        }
        else
        {
          v14 = (char *)sub_1DF2786F8(a1, (unsigned __int8 *)v13, a3, &v26, v6);
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
    || (v17 = v14 + 1, v14 + 1 == a3)
    || v15 != 45
    || *v17 == 93)
  {
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v26.__r_.__value_.__l.__size_)
      {
        if (v26.__r_.__value_.__l.__size_ != 1)
        {
          v16 = (std::string *)v26.__r_.__value_.__r.__words[0];
LABEL_40:
          sub_1DF278DB8(v6, v16->__r_.__value_.__s.__data_[0], v16->__r_.__value_.__s.__data_[1]);
          goto LABEL_41;
        }
        v16 = (std::string *)v26.__r_.__value_.__r.__words[0];
        goto LABEL_25;
      }
    }
    else if (*((_BYTE *)&v26.__r_.__value_.__s + 23))
    {
      v16 = &v26;
      if (HIBYTE(v26.__r_.__value_.__r.__words[2]) != 1)
        goto LABEL_40;
LABEL_25:
      sub_1DF276B90(v6, v16->__r_.__value_.__s.__data_[0]);
    }
LABEL_41:
    v21 = 1;
    v4 = v14;
    goto LABEL_42;
  }
  memset(&v25, 0, sizeof(v25));
  v4 = v14 + 2;
  if (v14 + 2 != a3 && *v17 == 91 && *v4 == 46)
  {
    v18 = sub_1DF278614(a1, v14 + 3, a3, (uint64_t)&v25);
LABEL_55:
    v4 = v18;
    goto LABEL_56;
  }
  if ((v11 | 0x40) == 0x40)
  {
    LODWORD(v17) = *v17;
    if ((_DWORD)v17 == 92)
    {
      if (v11)
        v18 = sub_1DF27881C(a1, v14 + 2, a3, &v25);
      else
        v18 = (char *)sub_1DF2786F8(a1, (unsigned __int8 *)v14 + 2, a3, &v25, v6);
      goto LABEL_55;
    }
  }
  else
  {
    LOBYTE(v17) = *v17;
  }
  std::string::operator=(&v25, (std::string::value_type)v17);
LABEL_56:
  v24 = v26;
  memset(&v26, 0, sizeof(v26));
  __p = v25;
  memset(&v25, 0, sizeof(v25));
  sub_1DF2789F4(v6, (char *)&v24, (char *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v24.__r_.__value_.__l.__data_);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v25.__r_.__value_.__l.__data_);
  v21 = 1;
LABEL_42:
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  if ((v21 & 1) != 0)
    return v4;
  return (char *)v6;
}

void sub_1DF278310(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  if (a28 < 0)
    operator delete(__p);
  if (*(char *)(v28 - 49) < 0)
    operator delete(*(void **)(v28 - 72));
  _Unwind_Resume(exception_object);
}

char *sub_1DF278388(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  char *v6;
  char *v7;
  char *v8;
  char *i;
  int v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  void *__p[2];
  unsigned __int8 v19;
  void *v20;
  uint64_t v21;
  unsigned __int8 v22;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_33;
  v6 = a3 - 2;
  v7 = a2;
  v8 = a2;
  for (i = a2; ; v8 = i)
  {
    v10 = *i++;
    if (v10 == 61 && *i == 93)
      break;
    if (a2 == v6)
      goto LABEL_33;
    ++v7;
    --v6;
  }
  if (v8 == a3)
LABEL_33:
    sub_1DF277F78();
  sub_1DF27906C(a1, a2, v7, (uint64_t)&v20);
  if (((char)v22 & 0x80000000) == 0)
  {
    v11 = v22;
    if (v22)
    {
      v12 = (char *)&v20;
      goto LABEL_14;
    }
LABEL_34:
    sub_1DF278FE0();
  }
  v11 = v21;
  if (!v21)
    goto LABEL_34;
  v12 = (char *)v20;
LABEL_14:
  sub_1DF279200(a1, v12, &v12[v11], (uint64_t)__p);
  v13 = v19;
  if ((v19 & 0x80u) != 0)
    v13 = (unint64_t)__p[1];
  if (v13)
  {
    sub_1DF27902C(a4, (__int128 *)__p);
  }
  else
  {
    v14 = v22;
    if ((v22 & 0x80u) != 0)
      v14 = v21;
    if (v14 == 2)
    {
      v16 = (char *)&v20;
      if ((v22 & 0x80u) != 0)
        v16 = (char *)v20;
      sub_1DF278DB8((uint64_t)a4, *v16, v16[1]);
    }
    else
    {
      if (v14 != 1)
        sub_1DF278FE0();
      v15 = (char *)&v20;
      if ((v22 & 0x80u) != 0)
        v15 = (char *)v20;
      sub_1DF276B90((uint64_t)a4, *v15);
    }
  }
  if ((char)v19 < 0)
    operator delete(__p[0]);
  if ((char)v22 < 0)
    operator delete(v20);
  return v7 + 2;
}

void sub_1DF27852C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *sub_1DF278564(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  char *v5;
  char *v6;
  char *v7;
  char *i;
  int v9;
  int v10;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_11;
  v5 = a3 - 2;
  v6 = a2;
  v7 = a2;
  for (i = a2; ; v7 = i)
  {
    v9 = *i++;
    if (v9 == 58 && *i == 93)
      break;
    if (a2 == v5)
      goto LABEL_11;
    ++v6;
    --v5;
  }
  if (v7 == a3)
LABEL_11:
    sub_1DF277F78();
  v10 = sub_1DF279758(a1, a2, v6, *(_DWORD *)(a1 + 24) & 1);
  if (!v10)
    sub_1DF27970C();
  *(_DWORD *)(a4 + 160) |= v10;
  return v6 + 2;
}

char *sub_1DF278614(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  char *v5;
  char *v6;
  char *v7;
  char *i;
  int v9;
  unint64_t v10;
  unint64_t v11;
  __int128 v13;
  unint64_t v14;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_15;
  v5 = a3 - 2;
  v6 = a2;
  v7 = a2;
  for (i = a2; ; v7 = i)
  {
    v9 = *i++;
    if (v9 == 46 && *i == 93)
      break;
    if (a2 == v5)
      goto LABEL_15;
    ++v6;
    --v5;
  }
  if (v7 == a3)
LABEL_15:
    sub_1DF277F78();
  sub_1DF27906C(a1, a2, v6, (uint64_t)&v13);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(_OWORD *)a4 = v13;
  v10 = v14;
  *(_QWORD *)(a4 + 16) = v14;
  v11 = HIBYTE(v10);
  if ((v11 & 0x80u) != 0)
    v11 = *(_QWORD *)(a4 + 8);
  if (v11 - 1 >= 2)
    sub_1DF278FE0();
  return v6 + 2;
}

unsigned __int8 *sub_1DF2786F8(uint64_t a1, unsigned __int8 *a2, char *a3, std::string *this, uint64_t a5)
{
  int v6;
  int v7;
  int v8;
  std::string::value_type v9;
  std::string *v10;

  if (a2 == (unsigned __int8 *)a3)
    sub_1DF275BD8();
  v6 = (char)*a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119)
          return sub_1DF275DA4(a1, a2, a3, this);
        *(_DWORD *)(a5 + 160) |= 0x500u;
        sub_1DF276B90(a5, 95);
        return a2 + 1;
      }
      v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (v6 == 98)
      {
        v10 = this;
        v9 = 8;
LABEL_19:
        std::string::operator=(v10, v9);
        return a2 + 1;
      }
      if (v6 != 100)
        return sub_1DF275DA4(a1, a2, a3, this);
      v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v8;
    return a2 + 1;
  }
  if (v6 <= 82)
  {
    if (*a2)
    {
      if (v6 == 68)
      {
        v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_21:
        *(_DWORD *)(a5 + 164) = v7;
        return a2 + 1;
      }
      return sub_1DF275DA4(a1, a2, a3, this);
    }
    v9 = 0;
    v10 = this;
    goto LABEL_19;
  }
  if (v6 == 83)
  {
    v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_21;
  }
  if (v6 == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    sub_1DF279810(a5, 95);
    return a2 + 1;
  }
  return sub_1DF275DA4(a1, a2, a3, this);
}

char *sub_1DF27881C(uint64_t a1, char *a2, char *a3, std::string *this)
{
  uint64_t v5;
  std::string *v6;
  std::string::value_type v7;
  char *v8;
  char v9;
  int v10;
  std::string::value_type v11;

  if (a2 == a3)
LABEL_52:
    sub_1DF275BD8();
  v5 = *a2;
  if ((int)v5 > 97)
  {
    switch((int)v5)
    {
      case 'n':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 10;
          goto LABEL_16;
        }
        v5 = 10;
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
        v5 = 13;
        goto LABEL_49;
      case 't':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 9;
          goto LABEL_16;
        }
        v5 = 9;
        goto LABEL_49;
      case 'v':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 11;
          goto LABEL_16;
        }
        v5 = 11;
        goto LABEL_49;
      default:
        if ((_DWORD)v5 == 98)
        {
          if (this)
          {
            v6 = this;
            LOBYTE(v5) = 8;
            goto LABEL_16;
          }
          v5 = 8;
        }
        else
        {
          if ((_DWORD)v5 != 102)
            goto LABEL_21;
          if (this)
          {
            v6 = this;
            LOBYTE(v5) = 12;
            goto LABEL_16;
          }
          v5 = 12;
        }
        break;
    }
    goto LABEL_49;
  }
  if ((int)v5 > 91)
  {
    if ((_DWORD)v5 != 92)
    {
      if ((_DWORD)v5 != 97)
        goto LABEL_21;
      if (this)
      {
        v6 = this;
        LOBYTE(v5) = 7;
LABEL_16:
        std::string::operator=(v6, v5);
        return a2 + 1;
      }
      v5 = 7;
LABEL_49:
      sub_1DF276080(a1, v5);
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
  if ((_DWORD)v5 == 34 || (_DWORD)v5 == 47)
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
    sub_1DF276080(a1, v7);
  return v8;
}

void sub_1DF2789F4(uint64_t a1, char *a2, char *a3)
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
    sub_1DF279BA4(a1 + 16, v4, &v4[v25]);
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
    sub_1DF279BA4(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)v40 = v38;
    v41 = v39;
    *(_OWORD *)__p = *(_OWORD *)v36;
    v43 = v37;
    sub_1DF279A3C((uint64_t *)(a1 + 88), (__int128 *)v40);
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
      sub_1DF279C40();
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
    sub_1DF279A3C((uint64_t *)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v41) < 0)
      operator delete(v40[0]);
  }
}

void sub_1DF278D6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  sub_1DF277AC8((uint64_t)&a21);
  _Unwind_Resume(a1);
}

void sub_1DF278DB8(uint64_t a1, uint64_t a2, uint64_t a3)
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
          v25 = (char *)sub_1DF279EF0(v18, v24);
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
          v37 = (char *)sub_1DF279EF0(v18, v36);
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
    sub_1DF271380();
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
    v17 = (char *)sub_1DF279EF0(a1 + 128, v16);
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

void sub_1DF278FE0()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 1);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF279018(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF27902C(uint64_t *a1, __int128 *a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t result;

  v3 = a1 + 17;
  v4 = a1[18];
  if (v4 >= a1[19])
  {
    result = sub_1DF279350(v3, a2);
  }
  else
  {
    sub_1DF2792F4(v3, a2);
    result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

void sub_1DF27906C(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
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

  sub_1DF277D38(&__s, a2, a3, a3 - a2);
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

void sub_1DF2791CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1DF279200(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  sub_1DF277D38(__p, a2, a3, a3 - a2);
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

void sub_1DF2792D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_1DF2792F4(_QWORD *result, __int128 *a2)
{
  _QWORD *v2;
  uint64_t v3;
  __int128 v4;

  v2 = result;
  v3 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    result = sub_1DF279470((_BYTE *)result[1], *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *(_QWORD *)(v3 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v3 = v4;
  }
  v2[1] = v3 + 24;
  return result;
}

void sub_1DF279348(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_1DF279350(uint64_t *a1, __int128 *a2)
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
  _QWORD v15[2];
  char *v16;
  char *v17;
  uint64_t *v18;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    sub_1DF271380();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v18 = a1 + 2;
  if (v9)
    v10 = (char *)sub_1DF274E5C(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_1DF279470(v11, *(void **)a2, *((_QWORD *)a2 + 1));
    v11 = v16;
  }
  else
  {
    v12 = *a2;
    *((_QWORD *)v11 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v11 = v12;
  }
  v16 = v11 + 24;
  sub_1DF2794FC(a1, v15);
  v13 = a1[1];
  sub_1DF279684((uint64_t)v15);
  return v13;
}

void sub_1DF27945C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DF279684((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_1DF279470(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_1DF270E14();
    v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v6 = a3 | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

uint64_t sub_1DF2794FC(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1DF279570((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

uint64_t sub_1DF279570(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  sub_1DF27960C((uint64_t)v12);
  return a6;
}

uint64_t sub_1DF27960C(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1DF279640(a1);
  return a1;
}

void sub_1DF279640(uint64_t a1)
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

uint64_t sub_1DF279684(uint64_t a1)
{
  sub_1DF2796B8(a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_1DF2796B8(uint64_t a1, void **a2)
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

void sub_1DF27970C()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 2);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF279744(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF279758(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  unint64_t v6;
  void **v7;
  void **v8;
  uint64_t classname;
  void *__p[2];
  unsigned __int8 v12;

  sub_1DF277D38(__p, a2, a3, a3 - a2);
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

void sub_1DF2797F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1DF279810(uint64_t a1, uint64_t a2)
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
      sub_1DF271380();
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

void **sub_1DF279A3C(uint64_t *a1, __int128 *a2)
{
  void **result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  void *v19[5];

  v6 = a1[2];
  result = (void **)(a1 + 2);
  v5 = v6;
  v7 = (unint64_t)*(result - 1);
  if (v7 >= v6)
  {
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - *a1) >> 4);
    v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555)
      sub_1DF271380();
    v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 4);
    if (2 * v13 > v12)
      v12 = 2 * v13;
    if (v13 >= 0x2AAAAAAAAAAAAAALL)
      v14 = 0x555555555555555;
    else
      v14 = v12;
    v19[4] = result;
    if (v14)
      v15 = (char *)sub_1DF279D00((uint64_t)result, v14);
    else
      v15 = 0;
    v16 = &v15[48 * v11];
    v19[0] = v15;
    v19[1] = v16;
    v19[3] = &v15[48 * v14];
    v17 = *a2;
    *((_QWORD *)v16 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v16 = v17;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v18 = *(__int128 *)((char *)a2 + 24);
    *((_QWORD *)v16 + 5) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v16 + 24) = v18;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    v19[2] = v16 + 48;
    sub_1DF279C8C(a1, v19);
    v10 = a1[1];
    result = sub_1DF279E7C(v19);
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
    v10 = v7 + 48;
    a1[1] = v7 + 48;
  }
  a1[1] = v10;
  return result;
}

void sub_1DF279B90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DF279E7C((void **)va);
  _Unwind_Resume(a1);
}

void sub_1DF279BA4(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4;
  void **v5;
  void *__p[2];
  unsigned __int8 v7;

  sub_1DF277D38(__p, a2, a3, a3 - a2);
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

void sub_1DF279C24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1DF279C40()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 9);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF279C78(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF279C8C(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1DF279D44((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_1DF279D00(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    sub_1DF270E9C();
  return operator new(48 * a2);
}

uint64_t sub_1DF279D44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  sub_1DF279DF8((uint64_t)v13);
  return a6;
}

uint64_t sub_1DF279DF8(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1DF279E2C((uint64_t *)a1);
  return a1;
}

void sub_1DF279E2C(uint64_t *a1)
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
      sub_1DF277A84(v3, v1);
      v1 += 48;
    }
    while (v1 != v2);
  }
}

void **sub_1DF279E7C(void **a1)
{
  sub_1DF279EAC(a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void sub_1DF279EAC(_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 48;
    sub_1DF277A84(v4, i - 48);
  }
}

void *sub_1DF279EF0(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    sub_1DF270E9C();
  return operator new(2 * a2);
}

_QWORD *sub_1DF279F20(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &unk_1EA9835A8;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1DF279F64(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &unk_1EA9835A8;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF279FB8(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(*(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_1DF279FE8(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &unk_1EA9835A8;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1DF27A02C(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &unk_1EA9835A8;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF27A080(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_DWORD *)a2 = -994;
  v2 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(_QWORD *)(v2 + 8) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(v2 + 16) = 1;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_1DF27A0B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, char a7)
{
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _QWORD *result;

  v14 = (_QWORD *)operator new();
  v15 = *(_QWORD *)(a1 + 56);
  v16 = *(_QWORD *)(v15 + 8);
  *v14 = &unk_1EA983518;
  v14[1] = v16;
  *(_QWORD *)(v15 + 8) = 0;
  v17 = operator new();
  v18 = *(_DWORD *)(a1 + 32);
  v19 = *(_QWORD *)(a4 + 8);
  *(_QWORD *)v17 = &unk_1EA983A48;
  *(_QWORD *)(v17 + 8) = v19;
  *(_QWORD *)(v17 + 16) = v14;
  *(_QWORD *)(v17 + 24) = a2;
  *(_QWORD *)(v17 + 32) = a3;
  *(_DWORD *)(v17 + 40) = v18;
  *(_DWORD *)(v17 + 44) = a5;
  *(_DWORD *)(v17 + 48) = a6;
  *(_BYTE *)(v17 + 52) = a7;
  *(_QWORD *)(a4 + 8) = 0;
  result = (_QWORD *)operator new();
  *result = &unk_1EA983608;
  result[1] = v17;
  *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) = result;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(v17 + 16);
  *(_QWORD *)(a4 + 8) = v17;
  ++*(_DWORD *)(a1 + 32);
  return result;
}

void sub_1DF27A1D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_1DF27A200(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
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
            sub_1DF27A29C();
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

void sub_1DF27A29C()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 8);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF27A2D4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_1DF27A2E8()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 7);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF27A320(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF27A334(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = &unk_1EA9835D8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = &unk_1EA9835A8;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_1DF27A39C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = &unk_1EA9835D8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = &unk_1EA9835A8;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  JUMPOUT(0x1E0BFC7D0);
}

unsigned int *sub_1DF27A414(unsigned int *result, _QWORD *a2)
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
      return sub_1DF27A5D8(result, a2);
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

unsigned int *sub_1DF27A4C8(unsigned int *result, int a2, _QWORD *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((_QWORD *)result + 2);
  }
  else
  {
    a3[10] = *((_QWORD *)result + 1);
    return sub_1DF27A5D8(result, a3);
  }
  return result;
}

_QWORD *sub_1DF27A4F8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = &unk_1EA9835D8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = &unk_1EA9835A8;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_1DF27A560(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = &unk_1EA9835D8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = &unk_1EA9835A8;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  JUMPOUT(0x1E0BFC7D0);
}

unsigned int *sub_1DF27A5D8(unsigned int *result, _QWORD *a2)
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

void sub_1DF27A630()
{
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF27A644(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_1DF27A658(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = &unk_1EA9835D8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = &unk_1EA9835A8;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_1DF27A6C0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = &unk_1EA9835D8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = &unk_1EA9835A8;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  JUMPOUT(0x1E0BFC7D0);
}

void sub_1DF27A738(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t sub_1DF27A744(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;

  *(_DWORD *)a3 = -994;
  v3 = 8;
  if (a2)
    v3 = 16;
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + v3);
  return result;
}

void sub_1DF27A76C()
{
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF27A780(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

uint64_t sub_1DF27A794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  do
  {
    v5 = a2;
    a2 = sub_1DF27A828(a1, a2, a3);
  }
  while (v5 != a2);
  return v5;
}

void sub_1DF27A7DC()
{
  void *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  MEMORY[0x1E0BFC620](exception, 15);
  __cxa_throw(exception, MEMORY[0x1E0DE4E20], MEMORY[0x1E0DE43B8]);
}

void sub_1DF27A814(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_1DF27A828(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6;
  int v7;
  unsigned __int8 *v8;

  if ((char *)a2 == a3)
    return (unsigned __int8 *)a2;
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_DWORD *)(a1 + 28);
  v8 = (unsigned __int8 *)sub_1DF27A8B0(a1, a2, a3);
  if (v8 == (unsigned __int8 *)a2)
    return (unsigned __int8 *)a2;
  else
    return sub_1DF27A9C0(a1, v8, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
}

char *sub_1DF27A8B0(uint64_t a1, uint64_t a2, char *a3)
{
  char *v6;
  char *v7;
  uint64_t v9;
  int v10;
  char *v11;
  int v12;
  uint64_t v13;

  v6 = sub_1DF27AB60(a1, (char *)a2, a3);
  v7 = v6;
  if ((char *)a2 == v6 && (char *)a2 != a3 && (char *)(a2 + 1) != a3)
  {
    v9 = (uint64_t)v6;
    if (*(_BYTE *)a2 == 92)
      v9 = a2 + 2 * (*(_BYTE *)(a2 + 1) == 40);
    if (v9 == a2)
    {
      if (*(_BYTE *)a2 == 92)
      {
        v12 = sub_1DF27ADC8(a1, *(_BYTE *)(a2 + 1));
        v13 = 2;
        if (!v12)
          v13 = 0;
        return (char *)(a2 + v13);
      }
    }
    else
    {
      sub_1DF2759A4(a1);
      v10 = *(_DWORD *)(a1 + 28);
      v11 = (char *)sub_1DF27A794(a1, v9, (uint64_t)a3);
      if (v11 == a3 || v11 + 1 == a3 || *v11 != 92 || v11[1] != 41)
        sub_1DF274134();
      v7 = v11 + 2;
      sub_1DF275A18(a1, v10);
    }
  }
  return v7;
}

unsigned __int8 *sub_1DF27A9C0(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
{
  unsigned __int8 *v6;
  int v11;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;
  unsigned __int8 *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  int v24;
  int v25;

  v6 = a2;
  if (a2 != a3)
  {
    v11 = *a2;
    if (v11 == 42)
    {
      sub_1DF27A0B8(a1, 0, -1, a4, a5, a6, 1);
      return ++v6;
    }
    if (a2 + 1 != a3 && v11 == 92 && a2[1] == 123)
    {
      v13 = a2 + 2;
      v25 = 0;
      v14 = sub_1DF27A200(a1, a2 + 2, a3, &v25);
      if (v13 == v14)
        goto LABEL_16;
      if (v14 != a3)
      {
        v15 = v14 + 1;
        v16 = *v14;
        if (v16 == 44)
        {
          v24 = -1;
          v17 = sub_1DF27A200(a1, v15, a3, &v24);
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
              sub_1DF27A29C();
            }
            v6 = &v17[2 * (v17[1] == 125)];
            v20 = a5;
            v21 = a6;
            v22 = a1;
LABEL_23:
            sub_1DF27A0B8(v22, v18, v19, a4, v20, v21, 1);
            return v6;
          }
        }
        else if (v15 != a3 && v16 == 92 && *v15 == 125)
        {
          v6 = v14 + 2;
          v18 = v25;
          v20 = a5;
          v21 = a6;
          v22 = a1;
          v19 = v25;
          goto LABEL_23;
        }
      }
      sub_1DF27A2E8();
    }
  }
  return v6;
}

char *sub_1DF27AB60(uint64_t a1, char *a2, char *a3)
{
  int v6;
  char *result;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  if (a2 == a3)
  {
    result = sub_1DF27AC78(a1, a2, a3);
    if (result != a2)
      return result;
    return sub_1DF275894(a1, a2, a3);
  }
  v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
  {
    sub_1DF276080(a1, (char)v6);
    return a2 + 1;
  }
  result = sub_1DF27AC78(a1, a2, a3);
  if (result != a2)
    return result;
  if (*a2 != 46)
    return sub_1DF275894(a1, a2, a3);
  v9 = (_QWORD *)operator new();
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(v10 + 8);
  *v9 = &unk_1EA9834B8;
  v9[1] = v11;
  *(_QWORD *)(v10 + 8) = v9;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  return a2 + 1;
}

_BYTE *sub_1DF27AC78(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  _BYTE *v3;
  int v4;

  v3 = a2;
  if (a2 != a3 && a2 + 1 != a3 && *a2 == 92)
  {
    v4 = (char)a2[1];
    if ((v4 - 36) <= 0x3A && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
    {
      sub_1DF276080(a1, (char)v4);
      v3 += 2;
    }
  }
  return v3;
}

_QWORD *sub_1DF27ACF0(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &unk_1EA9835A8;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1DF27AD34(_QWORD *a1)
{
  uint64_t v1;

  *a1 = &unk_1EA9835A8;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF27AD88(uint64_t result, uint64_t a2)
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

uint64_t sub_1DF27ADC8(uint64_t a1, unsigned __int8 a2)
{
  if ((a2 & 0xF8) != 0x30 && (a2 & 0xFE) != 0x38 || a2 - 49 > 8)
    return 0;
  if (a2 - 48 > *(_DWORD *)(a1 + 28))
    sub_1DF2761A4();
  sub_1DF2761F0(a1, a2 - 48);
  return 1;
}

unsigned __int8 *sub_1DF27AE24(uint64_t a1, char *a2, char *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;

  v6 = sub_1DF27AE80(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2)
    sub_1DF27A7DC();
  do
  {
    v7 = v6;
    v6 = sub_1DF27AE80(a1, (char *)v6, a3);
  }
  while (v7 != v6);
  return v7;
}

unsigned __int8 *sub_1DF27AE80(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6;
  int v7;
  char *v8;
  unsigned __int8 *v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  int v16;
  char *v17;
  char *v18;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_DWORD *)(a1 + 28);
  v8 = sub_1DF27B030(a1, a2, a3);
  v9 = (unsigned __int8 *)v8;
  if (v8 != a2 || v8 == a3)
    goto LABEL_12;
  v10 = *a2;
  switch(v10)
  {
    case '$':
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      v14 = (char *)&unk_1EA983718;
      goto LABEL_8;
    case '(':
      sub_1DF2759A4(a1);
      v16 = *(_DWORD *)(a1 + 28);
      ++*(_DWORD *)(a1 + 36);
      v17 = (char *)sub_1DF273060(a1, a2 + 1, a3);
      if (v17 == a3 || (v18 = v17, *v17 != 41))
        sub_1DF274134();
      sub_1DF275A18(a1, v16);
      --*(_DWORD *)(a1 + 36);
      v9 = (unsigned __int8 *)(v18 + 1);
LABEL_12:
      if (v9 != (unsigned __int8 *)a2)
        return sub_1DF273D04(a1, v9, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
      return (unsigned __int8 *)a2;
    case '^':
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      v14 = (char *)&unk_1EA9836B8;
LABEL_8:
      v15 = *(_QWORD *)(v13 + 8);
      *(_QWORD *)v11 = v14 + 16;
      *(_QWORD *)(v11 + 8) = v15;
      *(_BYTE *)(v11 + 16) = v12;
      *(_QWORD *)(v13 + 8) = v11;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = (unsigned __int8 *)(a2 + 1);
      return sub_1DF273D04(a1, v9, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
  }
  return (unsigned __int8 *)a2;
}

char *sub_1DF27B030(uint64_t a1, char *a2, char *a3)
{
  char *result;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  result = sub_1DF27B0F8(a1, a2, a3);
  if (result == a2)
  {
    result = sub_1DF27B180(a1, a2, a3);
    if (result == a2)
    {
      if (a2 == a3 || *a2 != 46)
      {
        return sub_1DF275894(a1, a2, a3);
      }
      else
      {
        v7 = (_QWORD *)operator new();
        v8 = *(_QWORD *)(a1 + 56);
        v9 = *(_QWORD *)(v8 + 8);
        *v7 = &unk_1EA9834B8;
        v7[1] = v9;
        *(_QWORD *)(v8 + 8) = v7;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        return a2 + 1;
      }
    }
  }
  return result;
}

char *sub_1DF27B0F8(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  int v4;
  uint64_t v5;

  v3 = a2;
  if (a2 != a3)
  {
    v4 = *a2;
    v5 = (v4 - 36);
    if (v5 > 0x3A)
      goto LABEL_8;
    if (((1 << (v4 - 36)) & 0x5800000080004D1) != 0)
      return v3;
    if (v5 == 5)
    {
      if (*(_DWORD *)(a1 + 36))
        return v3;
    }
    else
    {
LABEL_8:
      if ((v4 - 123) < 2)
        return v3;
    }
    sub_1DF276080(a1, *a2);
    ++v3;
  }
  return v3;
}

char *sub_1DF27B180(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  char *v4;
  int v5;
  signed __int8 v6;
  BOOL v7;
  int v9;
  uint64_t v10;

  v3 = a2;
  if (a2 != a3)
  {
    v4 = a2 + 1;
    if (v3 + 1 != a3 && *v3 == 92)
    {
      v5 = *v4;
      v6 = *v4;
      v7 = (v5 - 36) > 0x3A || ((1 << (*v4 - 36)) & 0x5800000080004F1) == 0;
      if (v7 && (v5 - 123) >= 3)
      {
        if ((*(_DWORD *)(a1 + 24) & 0x1F0) == 0x40)
        {
          return sub_1DF27881C(a1, v4, a3, 0);
        }
        else
        {
          v9 = sub_1DF27ADC8(a1, v6);
          v10 = 2;
          if (!v9)
            v10 = 0;
          v3 += v10;
        }
      }
      else
      {
        sub_1DF276080(a1, v6);
        v3 += 2;
      }
    }
  }
  return v3;
}

uint64_t sub_1DF27B244(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  int v4;
  int v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *__p[2];
  _BYTE v16[25];
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;

  v3 = a1 + 32;
  v2 = *(_QWORD **)(a1 + 32);
  v4 = *(_DWORD *)(v3 - 8);
  v5 = v4 | 0x800;
  *(_DWORD *)(v3 - 8) = v4 | 0x800;
  if (*(_QWORD **)(v3 + 8) == v2)
    v6 = (_QWORD *)(v3 + 24);
  else
    v6 = v2;
  v7 = v6[1];
  if (*v6 != v7)
  {
LABEL_5:
    *(_DWORD *)(a1 + 24) = v5 | 0x80;
    v9 = *(_QWORD *)(a1 + 8);
    v8 = *(_QWORD *)(a1 + 16);
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = 0;
    *(_OWORD *)__p = 0u;
    memset(v16, 0, sizeof(v16));
    v10 = sub_1DF27B5C4(v8, v7, v9, (uint64_t)__p, v5 | 0x80u);
    sub_1DF27B79C(v3, v7, v9, (uint64_t *)__p, (v5 & 0x800) != 0);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if ((v10 & 1) == 0)
    {
      v2 = *(_QWORD **)v3;
LABEL_14:
      if (v2)
      {
        *(_QWORD *)(a1 + 40) = v2;
        operator delete(v2);
        *(_QWORD *)v3 = 0;
        *(_QWORD *)(v3 + 8) = 0;
        *(_QWORD *)(v3 + 16) = 0;
      }
      *(_BYTE *)(a1 + 128) = 0;
      *(_OWORD *)v3 = 0u;
      *(_OWORD *)(v3 + 16) = 0u;
      *(_OWORD *)(v3 + 25) = 0u;
      *(_QWORD *)(a1 + 80) = 0;
      *(_QWORD *)(a1 + 88) = 0;
      *(_BYTE *)(a1 + 96) = 0;
      *(_QWORD *)(a1 + 104) = 0;
      *(_QWORD *)(a1 + 112) = 0;
      *(_BYTE *)(a1 + 120) = 0;
      *(_QWORD *)(a1 + 136) = 0;
      return a1;
    }
    return a1;
  }
  v11 = *(_QWORD *)(a1 + 8);
  if (v11 == v7)
    goto LABEL_14;
  v12 = *(_QWORD *)(a1 + 16);
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  *(_OWORD *)__p = 0u;
  memset(v16, 0, sizeof(v16));
  v13 = sub_1DF27B5C4(v12, v7, v11, (uint64_t)__p, v4 | 0x860u);
  sub_1DF27B79C(v3, v7, v11, (uint64_t *)__p, 1);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if ((v13 & 1) == 0)
  {
    ++v7;
    v5 = *(_DWORD *)(a1 + 24);
    goto LABEL_5;
  }
  return a1;
}

void sub_1DF27B3E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_1DF27B404(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  v6 = a1 + 32;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v6 + 8);
  v9 = a2 + 32;
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(v9 + 8);
  v10 = v8 == v7 && v5 == v4;
  if (v5 != v4 && v8 != v7)
    return *(_QWORD *)a1 == *(_QWORD *)a2
        && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
        && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16)
        && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24)
        && sub_1DF27B498(v4, v7) == 0;
  return v10;
}

uint64_t sub_1DF27B498(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  size_t v4;
  void **v5;
  char v6;
  size_t v7;
  const void *p_p;
  size_t v9;
  void **v10;
  size_t v11;
  unsigned int v12;
  unsigned int v13;
  void **v15;
  size_t v16;
  uint64_t v17;
  void *__p;
  size_t v19;
  uint64_t v20;

  if (*(_BYTE *)(a1 + 16))
  {
    sub_1DF277D38(&__p, *(char **)a1, *(char **)(a1 + 8), *(_QWORD *)(a1 + 8) - *(_QWORD *)a1);
  }
  else
  {
    __p = 0;
    v19 = 0;
    v20 = 0;
  }
  if (*(_BYTE *)(a2 + 16))
  {
    sub_1DF277D38(&v15, *(char **)a2, *(char **)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
    v3 = HIBYTE(v17);
    v5 = v15;
    v4 = v16;
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v3 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
  }
  v6 = HIBYTE(v20);
  if (v20 >= 0)
    v7 = HIBYTE(v20);
  else
    v7 = v19;
  if (v20 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  if ((v3 & 0x80u) == 0)
    v9 = v3;
  else
    v9 = v4;
  if ((v3 & 0x80u) == 0)
    v10 = (void **)&v15;
  else
    v10 = v5;
  if (v9 >= v7)
    v11 = v7;
  else
    v11 = v9;
  v12 = memcmp(p_p, v10, v11);
  if ((v3 & 0x80) != 0)
  {
    operator delete(v5);
    if ((v20 & 0x8000000000000000) == 0)
      goto LABEL_24;
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_24;
  }
  operator delete(__p);
LABEL_24:
  v13 = v9 < v7;
  if (v7 < v9)
    v13 = -1;
  if (v12)
    return v12;
  else
    return v13;
}

void sub_1DF27B5A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DF27B5C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  if ((a5 & 0x80) != 0)
    v9 = a5 & 0xFFA;
  else
    v9 = a5;
  sub_1DF274828(a4, *(_DWORD *)(a1 + 28) + 1, a2, a3, (unsigned __int16)(v9 & 0x800) >> 11);
  if (sub_1DF27B928(a1, a2, a3, (uint64_t *)a4, v9, (v9 & 0x800) == 0))
  {
    if (*(_QWORD *)(a4 + 8) == *(_QWORD *)a4)
      v10 = (uint64_t *)(a4 + 24);
    else
      v10 = *(uint64_t **)a4;
LABEL_8:
    v11 = *v10;
    *(_QWORD *)(a4 + 56) = *v10;
    *(_BYTE *)(a4 + 64) = *(_QWORD *)(a4 + 48) != v11;
    v12 = v10[1];
    *(_QWORD *)(a4 + 72) = v12;
    *(_BYTE *)(a4 + 88) = v12 != *(_QWORD *)(a4 + 80);
    return 1;
  }
  if (a2 != a3 && (v9 & 0x40) == 0)
  {
    v14 = v9 | 0x80;
    v15 = a2 + 1;
    if (v15 != a3)
    {
      while (1)
      {
        sub_1DF274C98((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 3), (__int128 *)(a4 + 24));
        v16 = sub_1DF27B928(a1, v15, a3, (uint64_t *)a4, v14, 0);
        v18 = *(_QWORD *)a4;
        v17 = *(_QWORD *)(a4 + 8);
        if (v16)
          break;
        sub_1DF274C98((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 3), (__int128 *)(a4 + 24));
        if (++v15 == a3)
          goto LABEL_14;
      }
      if (v17 == v18)
        v10 = (uint64_t *)(a4 + 24);
      else
        v10 = *(uint64_t **)a4;
      goto LABEL_8;
    }
LABEL_14:
    sub_1DF274C98((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 3), (__int128 *)(a4 + 24));
    if (sub_1DF27B928(a1, a3, a3, (uint64_t *)a4, v14, 0))
    {
      if (*(_QWORD *)(a4 + 8) == *(_QWORD *)a4)
        v10 = (uint64_t *)(a4 + 24);
      else
        v10 = *(uint64_t **)a4;
      goto LABEL_8;
    }
  }
  result = 0;
  *(_QWORD *)(a4 + 8) = *(_QWORD *)a4;
  return result;
}

void sub_1DF27B79C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;

  v10 = a4[6];
  sub_1DF27D5E4(a1, 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3));
  v11 = *(_QWORD *)a1;
  if (*(_QWORD *)(a1 + 8) != *(_QWORD *)a1)
  {
    v12 = 0;
    v13 = 0;
    v15 = *a4;
    v14 = a4[1];
    do
    {
      v16 = 0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3);
      v17 = (_QWORD *)(v15 + v12);
      if (v16 <= v13)
        v18 = a4 + 3;
      else
        v18 = v17;
      *(_QWORD *)(v11 + v12) = a2 + *v18 - v10;
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v13)
        v19 = a4 + 3;
      else
        v19 = (uint64_t *)(*a4 + v12);
      *(_QWORD *)(*(_QWORD *)a1 + v12 + 8) = a2 + v19[1] - v10;
      v15 = *a4;
      v14 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v14 - *a4) >> 3) <= v13)
        v20 = a4 + 3;
      else
        v20 = (uint64_t *)(*a4 + v12);
      v21 = *((_BYTE *)v20 + 16);
      v11 = *(_QWORD *)a1;
      v22 = *(_QWORD *)(a1 + 8);
      *(_BYTE *)(*(_QWORD *)a1 + v12 + 16) = v21;
      ++v13;
      v12 += 24;
    }
    while (v13 < 0xAAAAAAAAAAAAAAABLL * ((v22 - v11) >> 3));
  }
  *(_QWORD *)(a1 + 24) = a3;
  *(_QWORD *)(a1 + 32) = a3;
  *(_BYTE *)(a1 + 40) = 0;
  v23 = a2 + a4[6] - v10;
  *(_QWORD *)(a1 + 48) = v23;
  *(_QWORD *)(a1 + 56) = a2 + a4[7] - v10;
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a4 + 64);
  *(_QWORD *)(a1 + 72) = a2 + a4[9] - v10;
  *(_QWORD *)(a1 + 80) = a2 + a4[10] - v10;
  *(_BYTE *)(a1 + 88) = *((_BYTE *)a4 + 88);
  if ((a5 & 1) == 0)
    *(_QWORD *)(a1 + 104) = v23;
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a4 + 96);
}

uint64_t sub_1DF27B928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0)
    return sub_1DF274898(a1, a2, a3, a4, a5, a6);
  if (*(_DWORD *)(a1 + 28))
    return sub_1DF27BE80(a1, a2, a3, a4, a5, a6);
  return sub_1DF27B948(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1DF27B948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
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
    sub_1DF27C3E8(&v59, (uint64_t)v55);
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
    sub_1DF274F1C(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 56, *(unsigned int *)(a1 + 32));
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
        sub_1DF274F4C();
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
            sub_1DF27C4E8(&v59);
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
                sub_1DF27534C((uint64_t)&v61 + 8, v42);
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
          sub_1DF27C568((uint64_t)&v59, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          sub_1DF27C4E8(&v59);
          goto LABEL_38;
        case 0xFFFFFC20:
          v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)v55 = *(_OWORD *)v30;
          *(_OWORD *)&v55[16] = v45;
          v56 = 0uLL;
          *(_QWORD *)&v55[32] = 0;
          sub_1DF275684(&v55[32], *(__int128 **)(v28 + 96 * v29 + 32), *(__int128 **)(v28 + 96 * v29 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v28 + 96 * v29 + 40) - *(_QWORD *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v58[0] = 0;
          sub_1DF275700((char *)__p, *(__int128 **)(v28 + 96 * v29 + 56), *(__int128 **)(v28 + 96 * v29 + 64), (uint64_t)(*(_QWORD *)(v28 + 96 * v29 + 64) - *(_QWORD *)(v28 + 96 * v29 + 56)) >> 4);
          v46 = *v32;
          *(_QWORD *)((char *)&v58[1] + 5) = *(_QWORD *)(v30 + 85);
          v58[1] = v46;
          (*(void (**)(_QWORD, uint64_t, unint64_t))(*(_QWORD *)*v32 + 24))(*v32, 1, v28 + 96 * v29);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v58[1] + 24))(v58[1], 0, v55);
          sub_1DF27C3E8(&v59, (uint64_t)v55);
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
          sub_1DF274F98();
      }
      break;
    }
  }
  sub_1DF27D154(&v59);
  return v6;
}

void sub_1DF27BE30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  uint64_t v22;

  sub_1DF27D154((_QWORD *)(v22 - 144));
  _Unwind_Resume(a1);
}

uint64_t sub_1DF27BE80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  _OWORD *v11;
  unsigned int v12;
  uint64_t v13;
  _OWORD *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD *v17;
  _BYTE *v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  void *v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  uint64_t v42;
  char v43;
  _BYTE v46[56];
  void *__p[2];
  _QWORD v48[4];
  __int128 v49;
  char v50;
  _BYTE v51[40];
  __int128 v52;
  void *v53[6];
  _OWORD *v54;
  _OWORD *v55;
  _QWORD v56[3];

  v54 = 0;
  v55 = 0;
  v56[0] = 0;
  *(_DWORD *)v51 = 0;
  memset(&v51[8], 0, 32);
  v52 = 0u;
  memset(v53, 0, 37);
  v6 = *(_QWORD *)(a1 + 40);
  if (!v6)
    goto LABEL_43;
  *(_QWORD *)&v49 = a3;
  *((_QWORD *)&v49 + 1) = a3;
  v50 = 0;
  *(_DWORD *)v46 = 0;
  memset(&v46[8], 0, 48);
  *(_OWORD *)__p = 0uLL;
  memset(v48, 0, 21);
  v55 = (_OWORD *)sub_1DF274FE4((uint64_t *)&v54, (uint64_t)v46);
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
  v11 = v55;
  *((_DWORD *)v55 - 24) = 0;
  *((_QWORD *)v11 - 11) = a2;
  *((_QWORD *)v11 - 10) = a2;
  *((_QWORD *)v11 - 9) = a3;
  sub_1DF274EE0((uint64_t)(v11 - 4), *(unsigned int *)(a1 + 28), &v49);
  sub_1DF274F1C((uint64_t)v55 - 40, *(unsigned int *)(a1 + 32));
  v42 = 0;
  v43 = 0;
  v12 = 0;
  v13 = a3 - a2;
  v14 = v55;
  *((_QWORD *)v55 - 2) = v6;
  *((_DWORD *)v14 - 2) = a5;
  *((_BYTE *)v14 - 4) = a6;
  do
  {
    v15 = (++v12 & 0xFFF) != 0 || (int)(v12 >> 12) < (int)v13;
    if (!v15)
      sub_1DF274F4C();
    v17 = v14 - 1;
    v16 = *((_QWORD *)v14 - 2);
    v18 = v14 - 6;
    if (v16)
      (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v16 + 16))(v16, v14 - 6);
    switch(*(_DWORD *)v18)
    {
      case 0xFFFFFC18:
        v19 = *((_QWORD *)v14 - 10);
        if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != a3)
          goto LABEL_19;
        v26 = v19 - *((_QWORD *)v14 - 11);
        v27 = v42;
        if ((v43 & (v42 >= v26)) == 0)
        {
          v28 = *(v14 - 5);
          *(_OWORD *)v51 = *(_OWORD *)v18;
          *(_OWORD *)&v51[16] = v28;
          if (v51 != v18)
          {
            sub_1DF27D2E4(&v51[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
            sub_1DF27D498(v53, *((uint64_t **)v14 - 5), *((uint64_t **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
          }
          v29 = (void *)*v17;
          *(void **)((char *)&v53[3] + 5) = *(void **)((char *)v14 - 11);
          v53[3] = v29;
          v27 = v26;
        }
        v30 = v55;
        if (v27 == v13)
        {
          v31 = (uint64_t)v54;
          while (v30 != (_QWORD *)v31)
          {
            v30 -= 12;
            sub_1DF27534C((uint64_t)v56, v30);
          }
          v55 = (_OWORD *)v31;
          v43 = 1;
          v42 = a3 - a2;
        }
        else
        {
          v42 = v27;
          v32 = v55 - 6;
          sub_1DF27534C((uint64_t)v56, (_QWORD *)v55 - 12);
          v55 = v32;
          v43 = 1;
        }
        break;
      case 0xFFFFFC1D:
      case 0xFFFFFC1E:
      case 0xFFFFFC21:
        break;
      case 0xFFFFFC1F:
LABEL_19:
        v20 = v55 - 6;
        sub_1DF27534C((uint64_t)v56, (_QWORD *)v55 - 12);
        v55 = v20;
        break;
      case 0xFFFFFC20:
        v21 = *(v14 - 5);
        *(_OWORD *)v46 = *(_OWORD *)v18;
        *(_OWORD *)&v46[16] = v21;
        memset(&v46[32], 0, 24);
        sub_1DF275684(&v46[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
        __p[0] = 0;
        __p[1] = 0;
        v48[0] = 0;
        sub_1DF275700((char *)__p, *((__int128 **)v14 - 5), *((__int128 **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
        v22 = (void *)*v17;
        *(_QWORD *)((char *)&v48[1] + 5) = *(_QWORD *)((char *)v14 - 11);
        v48[1] = v22;
        (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)*v17 + 24))(*v17, 1, v14 - 6);
        (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v48[1] + 24))(v48[1], 0, v46);
        v23 = v55;
        if ((unint64_t)v55 >= v56[0])
        {
          v55 = (_OWORD *)sub_1DF274FE4((uint64_t *)&v54, (uint64_t)v46);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
        }
        else
        {
          v24 = *(_OWORD *)&v46[16];
          *v55 = *(_OWORD *)v46;
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
          v55 = v23 + 6;
        }
        if (*(_QWORD *)&v46[32])
        {
          *(_QWORD *)&v46[40] = *(_QWORD *)&v46[32];
          operator delete(*(void **)&v46[32]);
        }
        break;
      default:
        sub_1DF274F98();
    }
    v14 = v55;
  }
  while (v54 != v55);
  if ((v43 & 1) != 0)
  {
    v33 = *v41;
    *(_QWORD *)v33 = a2;
    *(_QWORD *)(v33 + 8) = a2 + v42;
    *(_BYTE *)(v33 + 16) = 1;
    if ((_QWORD)v52 != *(_QWORD *)&v51[32])
    {
      v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v52 - *(_QWORD *)&v51[32]) >> 3);
      v35 = (_BYTE *)(*(_QWORD *)&v51[32] + 16);
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
  if (v53[0])
  {
    v53[1] = v53[0];
    operator delete(v53[0]);
  }
  if (*(_QWORD *)&v51[32])
  {
    *(_QWORD *)&v52 = *(_QWORD *)&v51[32];
    operator delete(*(void **)&v51[32]);
  }
  *(_QWORD *)v51 = &v54;
  sub_1DF275770((void ***)v51);
  return v39;
}

void sub_1DF27C388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v35;

  sub_1DF274EA0(&a19);
  sub_1DF274EA0(&a35);
  a35 = v35 - 120;
  sub_1DF275770((void ***)&a35);
  _Unwind_Resume(a1);
}

__n128 sub_1DF27C3E8(_QWORD *a1, uint64_t a2)
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
    sub_1DF27C658(a1);
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

uint64_t sub_1DF27C4E8(_QWORD *a1)
{
  _QWORD *v2;
  unint64_t v3;

  v2 = a1 + 5;
  v3 = a1[5] + a1[4] - 1;
  sub_1DF27534C((uint64_t)(a1 + 5), (_QWORD *)(*(_QWORD *)(a1[1] + 8 * (v3 / 0x2A)) + 96 * (v3 % 0x2A)));
  --*v2;
  return sub_1DF27CDC8(a1, 1);
}

int64x2_t sub_1DF27C568(uint64_t a1, uint64_t a2)
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
    sub_1DF27CE3C((void **)a1);
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
  result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_1DF28EA40);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void sub_1DF27C658(_QWORD *a1)
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
      v34 = (char *)sub_1DF271394(v5, v33);
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
      sub_1DF27C96C(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0xFC0uLL);
    sub_1DF27CA80((uint64_t)a1, &v54);
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
      v34 = (char *)sub_1DF271394((uint64_t)(a1 + 3), v46);
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
  *(_QWORD *)&v54 = sub_1DF271394((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0xFC0uLL);
  sub_1DF27CB9C(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_1DF27CCB0((uint64_t)&v54, v27);
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

void sub_1DF27C920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_1DF27C96C(_QWORD *a1, _QWORD *a2)
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
      v19 = (char *)sub_1DF271394(v4, v18);
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

void sub_1DF27CA80(uint64_t a1, _QWORD *a2)
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
      v14 = (char *)sub_1DF271394(v6, v12);
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

void sub_1DF27CB9C(_QWORD *a1, _QWORD *a2)
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
      v17 = (char *)sub_1DF271394(a1[4], v16);
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

void sub_1DF27CCB0(uint64_t a1, _QWORD *a2)
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
      v13 = (char *)sub_1DF271394(*(_QWORD *)(a1 + 32), v11);
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

uint64_t sub_1DF27CDC8(_QWORD *a1, int a2)
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

void sub_1DF27CE3C(void **a1)
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
      __p = sub_1DF271394(v7, v11);
      v43 = (char *)__p;
      v44 = (char *)__p;
      v45 = (char *)__p + 8 * v12;
      v41 = operator new(0xFC0uLL);
      sub_1DF27CB9C(&__p, &v41);
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
              v24 = (char *)sub_1DF271394((uint64_t)v46, v23);
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
        sub_1DF27C96C(a1, &__p);
        v34 = a1[2];
        __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        __p = operator new(0xFC0uLL);
      }
      sub_1DF27CA80((uint64_t)a1, &__p);
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
    sub_1DF27CA80((uint64_t)a1, &__p);
  }
}

void sub_1DF27D108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  void *v12;

  operator delete(v12);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF27D154(_QWORD *a1)
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
        sub_1DF27534C((uint64_t)v2, v7);
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
  return sub_1DF27D298((uint64_t)a1);
}

uint64_t sub_1DF27D298(uint64_t a1)
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

char *sub_1DF27D2E4(_QWORD *a1, __int128 *a2, __int128 *a3, unint64_t a4)
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
      sub_1DF271380();
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v11;
    result = sub_1DF274E0C(a1, v12);
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

char *sub_1DF27D498(_QWORD *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
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
      sub_1DF271380();
    v10 = v8 >> 3;
    if (v8 >> 3 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
      v11 = 0xFFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = sub_1DF271738(a1, v11);
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

void sub_1DF27D5E4(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_1DF27D620((void **)a1, v4);
  }
  else if (!v3)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 24 * a2;
  }
}

void sub_1DF27D620(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  __int128 v22;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD **)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (_BYTE *)v7) >> 3) >= a2)
  {
    if (a2)
    {
      v13 = &v7[3 * a2];
      v14 = 24 * a2;
      do
      {
        *v7 = 0;
        v7[1] = 0;
        *((_BYTE *)v7 + 16) = 0;
        v7 += 3;
        v14 -= 24;
      }
      while (v14);
      v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (_BYTE *)*a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL)
      sub_1DF271380();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (_BYTE *)*a1) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)sub_1DF274E5C(v4, v11);
    else
      v12 = 0;
    v15 = &v12[24 * v8];
    v16 = &v15[24 * a2];
    v17 = 24 * a2;
    v18 = v15;
    do
    {
      *(_QWORD *)v18 = 0;
      *((_QWORD *)v18 + 1) = 0;
      v18[16] = 0;
      v18 += 24;
      v17 -= 24;
    }
    while (v17);
    v19 = &v12[24 * v11];
    v21 = (char *)*a1;
    v20 = (char *)a1[1];
    if (v20 != *a1)
    {
      do
      {
        v22 = *(_OWORD *)(v20 - 24);
        *((_QWORD *)v15 - 1) = *((_QWORD *)v20 - 1);
        *(_OWORD *)(v15 - 24) = v22;
        v15 -= 24;
        v20 -= 24;
      }
      while (v20 != v21);
      v20 = (char *)*a1;
    }
    *a1 = v15;
    a1[1] = v16;
    a1[2] = v19;
    if (v20)
      operator delete(v20);
  }
}

uint64_t sub_1DF27D788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __int16 v5;
  uint64_t v9;
  void *__p[2];
  _BYTE v12[25];
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;

  v5 = a5;
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = a4;
  *(_DWORD *)(a1 + 24) = a5;
  *(_OWORD *)(a1 + 32) = 0u;
  v9 = a1 + 32;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_BYTE *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_BYTE *)(a1 + 120) = 0;
  *(_BYTE *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 57) = 0u;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  *(_OWORD *)__p = 0u;
  memset(v12, 0, sizeof(v12));
  sub_1DF27B5C4(a4, a2, a3, (uint64_t)__p, a5);
  sub_1DF27B79C(v9, a2, a3, (uint64_t *)__p, (v5 & 0x800) != 0);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return a1;
}

void sub_1DF27D85C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  uint64_t v10;
  void **v11;
  void *v13;

  if (__p)
    operator delete(__p);
  v13 = *v11;
  if (*v11)
  {
    *(_QWORD *)(v10 + 40) = v13;
    operator delete(v13);
  }
  _Unwind_Resume(exception_object);
}

const std::locale *sub_1DF27D888(const std::locale *a1, char *a2, int a3)
{
  const std::locale *v6;
  size_t v7;

  v6 = sub_1DF272B6C(a1);
  LODWORD(v6[3].__locale_) = a3;
  *(_OWORD *)((char *)&v6[3].__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v6[5].__locale_ + 4) = 0u;
  HIDWORD(v6[7].__locale_) = 0;
  v7 = strlen(a2);
  if (sub_1DF27D918((uint64_t)a1, a2, &a2[v7]) != &a2[v7])
    sub_1DF272D38();
  return a1;
}

void sub_1DF27D8FC(_Unwind_Exception *a1)
{
  std::locale *v1;

  sub_1DF2717AC((uint64_t)&v1[5]);
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

char *sub_1DF27D918(uint64_t a1, char *a2, char *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  unsigned int v8;

  v6 = (_QWORD *)operator new();
  *v6 = &unk_1EA983458;
  v7 = (_QWORD *)operator new();
  *v7 = &unk_1EA983518;
  v7[1] = v6;
  sub_1DF272D84((_QWORD *)(a1 + 40), (uint64_t)v7);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 40);
  v8 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if (v8 > 0x3F)
  {
    switch(v8)
    {
      case 0x40u:
        return sub_1DF27DD1C(a1, a2, a3);
      case 0x80u:
        return (char *)sub_1DF27DDBC(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
      case 0x100u:
        return sub_1DF27DF14(a1, a2, a3);
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
        sub_1DF2733B0();
      return sub_1DF27DD1C(a1, a2, a3);
    }
    return sub_1DF27DBD0(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
  }
  else
  {
    return sub_1DF27DA88(a1, (unsigned __int8 *)a2, a3);
  }
}

void sub_1DF27DA6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

char *sub_1DF27DA88(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = a2;
  do
  {
    v8 = v7;
    v7 = sub_1DF27E06C(a1, (char *)v7, a3);
  }
  while (v7 != v8);
  if (v8 == a2)
  {
    v9 = (_QWORD *)operator new();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(v10 + 8);
    *v9 = &unk_1EA983518;
    v9[1] = v11;
    *(_QWORD *)(v10 + 8) = v9;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  if (v8 != (unsigned __int8 *)a3)
  {
    while (*v8 == 124)
    {
      v12 = *(_QWORD *)(a1 + 56);
      v13 = v8 + 1;
      v14 = v8 + 1;
      do
      {
        v8 = v14;
        v14 = sub_1DF27E06C(a1, (char *)v14, a3);
      }
      while (v14 != v8);
      if (v8 == v13)
      {
        v15 = (_QWORD *)operator new();
        v16 = *(_QWORD *)(a1 + 56);
        v17 = *(_QWORD *)(v16 + 8);
        *v15 = &unk_1EA983518;
        v15[1] = v17;
        *(_QWORD *)(v16 + 8) = v15;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      }
      sub_1DF2736F8(a1, v6, v12);
      if (v8 == (unsigned __int8 *)a3)
        return a3;
    }
    return (char *)v8;
  }
  return a3;
}

char *sub_1DF27DBD0(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
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
    *(_QWORD *)v6 = &unk_1EA9836C8;
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
      v3 = sub_1DF27FA60(a1, (char *)v3, v4);
    }
    while (v3 != v10);
    if (v10 != (unsigned __int8 *)v4)
    {
      if (v10 + 1 != (unsigned __int8 *)v4 || *v10 != 36)
        sub_1DF27A7DC();
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      v14 = *(_QWORD *)(v13 + 8);
      *(_QWORD *)v11 = &unk_1EA983728;
      *(_QWORD *)(v11 + 8) = v14;
      *(_BYTE *)(v11 + 16) = v12;
      *(_QWORD *)(v13 + 8) = v11;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
  }
  return v4;
}

char *sub_1DF27DD1C(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unsigned __int8 *v10;

  v3 = a3;
  v6 = *(_QWORD *)(a1 + 56);
  v7 = sub_1DF27FEAC(a1, a2, a3);
  if (v7 == (unsigned __int8 *)a2)
LABEL_9:
    sub_1DF27A7DC();
  v8 = v7;
  while (v8 != (unsigned __int8 *)v3)
  {
    if (*v8 != 124)
      return (char *)v8;
    v9 = *(_QWORD *)(a1 + 56);
    v10 = sub_1DF27FEAC(a1, (char *)v8 + 1, v3);
    if (v10 == v8 + 1)
      goto LABEL_9;
    v8 = v10;
    sub_1DF2736F8(a1, v6, v9);
  }
  return v3;
}

unsigned __int8 *sub_1DF27DDBC(uint64_t a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  uint64_t v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  if (v8 == __s)
  {
    v9 = (_QWORD *)operator new();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(v10 + 8);
    *v9 = &unk_1EA983518;
    v9[1] = v11;
    *(_QWORD *)(v10 + 8) = v9;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  else
  {
    sub_1DF27DBD0(a1, __s, v8);
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
    v15 = *(_QWORD *)(a1 + 56);
    if (v14 == v12)
    {
      v16 = (_QWORD *)operator new();
      v17 = *(_QWORD *)(a1 + 56);
      v18 = *(_QWORD *)(v17 + 8);
      *v16 = &unk_1EA983518;
      v16[1] = v18;
      *(_QWORD *)(v17 + 8) = v16;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    else
    {
      sub_1DF27DBD0(a1, v12, v14);
    }
    sub_1DF2736F8(a1, v6, v15);
    if (v14 == a3)
      v12 = v14;
    else
      v12 = v14 + 1;
  }
  return a3;
}

char *sub_1DF27DF14(uint64_t a1, char *__s, char *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = (char *)memchr(__s, 10, a3 - __s);
  if (v7)
    v8 = v7;
  else
    v8 = a3;
  if (v8 == __s)
  {
    v9 = (_QWORD *)operator new();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(v10 + 8);
    *v9 = &unk_1EA983518;
    v9[1] = v11;
    *(_QWORD *)(v10 + 8) = v9;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  }
  else
  {
    sub_1DF27DD1C(a1, __s, v8);
  }
  if (v8 == a3)
    v12 = v8;
  else
    v12 = v8 + 1;
  while (v12 != a3)
  {
    v13 = (char *)memchr(v12, 10, a3 - v12);
    if (v13)
      v14 = v13;
    else
      v14 = a3;
    v15 = *(_QWORD *)(a1 + 56);
    if (v14 == v12)
    {
      v16 = (_QWORD *)operator new();
      v17 = *(_QWORD *)(a1 + 56);
      v18 = *(_QWORD *)(v17 + 8);
      *v16 = &unk_1EA983518;
      v16[1] = v18;
      *(_QWORD *)(v17 + 8) = v16;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    else
    {
      sub_1DF27DD1C(a1, v12, v14);
    }
    sub_1DF2736F8(a1, v6, v15);
    if (v14 == a3)
      v12 = v14;
    else
      v12 = v14 + 1;
  }
  return a3;
}

unsigned __int8 *sub_1DF27E06C(uint64_t a1, char *a2, char *a3)
{
  unsigned __int8 *result;
  uint64_t v7;
  int v8;
  unsigned __int8 *v9;

  result = (unsigned __int8 *)sub_1DF27E100(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_DWORD *)(a1 + 28);
    v9 = sub_1DF27E3A8(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
    result = (unsigned __int8 *)a2;
    if (v9 != (unsigned __int8 *)a2)
      return sub_1DF27E5B0(a1, v9, (unsigned __int8 *)a3, v7, v8 + 1, *(_DWORD *)(a1 + 28) + 1);
  }
  return result;
}

char *sub_1DF27E100(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  int v6;
  char *v7;
  BOOL v8;
  char *v9;
  int v11;
  char *v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  int v20;
  char v21;
  int v22;
  std::locale v23[3];
  __int128 v24;
  __int128 v25;
  uint64_t v26;

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
            sub_1DF272B6C(v23);
            v24 = 0u;
            v26 = 0;
            v25 = 0u;
            LODWORD(v24) = *(_DWORD *)(a1 + 24);
            v12 = (char *)sub_1DF27D918(v23, v3 + 3, a3);
            v22 = DWORD1(v24);
            sub_1DF274090(a1, (uint64_t)v23, 1, *(_DWORD *)(a1 + 28));
            *(_DWORD *)(a1 + 28) += v22;
            if (v12 == a3 || *v12 != 41)
              sub_1DF274134();
            goto LABEL_31;
          }
          if (v11 == 61)
          {
            sub_1DF272B6C(v23);
            v24 = 0u;
            v26 = 0;
            v25 = 0u;
            LODWORD(v24) = *(_DWORD *)(a1 + 24);
            v12 = (char *)sub_1DF27D918(v23, v3 + 3, a3);
            v13 = DWORD1(v24);
            sub_1DF274090(a1, (uint64_t)v23, 0, *(_DWORD *)(a1 + 28));
            *(_DWORD *)(a1 + 28) += v13;
            if (v12 == a3 || *v12 != 41)
              sub_1DF274134();
LABEL_31:
            v3 = v12 + 1;
            sub_1DF2717AC((uint64_t)&v25);
            std::locale::~locale(v23);
            return v3;
          }
        }
      }
      return v3;
    }
    v14 = operator new();
    v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v16 = *(_QWORD *)(a1 + 56);
    v17 = *(_QWORD *)(v16 + 8);
    v18 = (char *)&unk_1EA983718;
LABEL_21:
    *(_QWORD *)v14 = v18 + 16;
    *(_QWORD *)(v14 + 8) = v17;
    *(_BYTE *)(v14 + 16) = v15;
    *(_QWORD *)(v16 + 8) = v14;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    return ++v3;
  }
  if (v6 != 92)
  {
    if (v6 != 94)
      return v3;
    v14 = operator new();
    v15 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
    v16 = *(_QWORD *)(a1 + 56);
    v17 = *(_QWORD *)(v16 + 8);
    v18 = (char *)&unk_1EA9836B8;
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
    sub_1DF27400C(a1, v21);
    v3 += 2;
  }
  return v3;
}

void sub_1DF27E37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_1DF2717AC((uint64_t)&a14);
  std::locale::~locale(&a9);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_1DF27E3A8(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _DWORD *v11;
  unsigned __int8 *v12;
  int v13;
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
        return sub_1DF27E8B0(a1, a2, a3);
      if (v6 != 123)
        return sub_1DF275AD0(a1, a2, a3);
    }
    else
    {
      if (v6 == 91)
        return (unsigned __int8 *)sub_1DF27E950(a1, (char *)a2, (char *)a3);
      if (v6 != 63)
        return sub_1DF275AD0(a1, a2, a3);
    }
LABEL_29:
    sub_1DF275A84();
  }
  if (v6 == 40)
  {
    if (a2 + 1 == a3)
      goto LABEL_30;
    if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
    {
      v11 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      v12 = (unsigned __int8 *)sub_1DF27DA88(a1, a2 + 3, a3);
      if (v12 == a3)
        goto LABEL_30;
      v3 = v12;
      if (*v12 != 41)
        goto LABEL_30;
    }
    else
    {
      sub_1DF2759A4(a1);
      v13 = *(_DWORD *)(a1 + 28);
      v11 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      v14 = (unsigned __int8 *)sub_1DF27DA88(a1, v3 + 1, a3);
      if (v14 == a3 || (v3 = v14, *v14 != 41))
LABEL_30:
        sub_1DF274134();
      sub_1DF275A18(a1, v13);
    }
    --*v11;
    return ++v3;
  }
  if (v6 == 46)
  {
    v7 = (_QWORD *)operator new();
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(v8 + 8);
    *v7 = &unk_1EA9839B8;
    v7[1] = v9;
    *(_QWORD *)(v8 + 8) = v7;
    *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    return ++v3;
  }
  if ((v6 - 42) < 2)
    goto LABEL_29;
  return sub_1DF275AD0(a1, a2, a3);
}

unsigned __int8 *sub_1DF27E5B0(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
{
  int v6;
  int v7;
  uint64_t v10;
  int v11;
  int v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  int v17;
  uint64_t v18;
  BOOL v19;
  BOOL v20;
  uint64_t v21;
  char v22;
  unsigned __int8 *v23;
  unsigned __int8 *v25;
  int v26;
  int v27;
  int v28;

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
        v14 = 0;
        v18 = 1;
        goto LABEL_33;
      }
      v14 = 0;
      v18 = 1;
      goto LABEL_45;
    }
    if (v12 != 123)
      return a2;
    v15 = a2 + 1;
    v16 = sub_1DF27A200(a1, a2 + 1, a3, &v28);
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
              v14 = v28;
              a5 = v7;
              a6 = v6;
              a1 = v10;
              v18 = v28;
LABEL_33:
              v21 = a4;
              v22 = 0;
LABEL_46:
              sub_1DF27A0B8(a1, v14, v18, v21, a5, a6, v22);
              return v13;
            }
            v14 = v28;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            v18 = v28;
LABEL_45:
            v21 = a4;
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
            v14 = v28;
            a5 = v7;
            a6 = v6;
            a1 = v10;
            goto LABEL_26;
          }
          v14 = v28;
          a5 = v7;
          a6 = v6;
          a1 = v10;
LABEL_36:
          v18 = -1;
          goto LABEL_45;
        }
        v27 = -1;
        v25 = sub_1DF27A200(v10, v23, a3, &v27);
        if (v25 != v23 && v25 != a3 && *v25 == 125)
        {
          v18 = v27;
          v14 = v28;
          if (v27 >= v28)
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
            v21 = a4;
            goto LABEL_46;
          }
          goto LABEL_58;
        }
      }
      sub_1DF27A2E8();
    }
LABEL_58:
    sub_1DF27A29C();
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
      v14 = 0;
      goto LABEL_26;
    }
    v14 = 0;
    goto LABEL_36;
  }
  if (v12 == 43)
  {
    v13 = a2 + 1;
    if (!v11 && v13 != a3 && *v13 == 63)
    {
      v13 = a2 + 2;
      v14 = 1;
LABEL_26:
      v18 = -1;
      goto LABEL_33;
    }
    v14 = 1;
    goto LABEL_36;
  }
  return a2;
}

unsigned __int8 *sub_1DF27E8B0(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v5;
  unsigned __int8 *result;

  if (a2 == a3 || *a2 != 92)
    return a2;
  v5 = a2 + 1;
  if (a2 + 1 == a3)
    sub_1DF275BD8();
  result = sub_1DF27EA60(a1, a2 + 1, a3);
  if (result == v5)
  {
    result = (unsigned __int8 *)sub_1DF275CD8(a1, (char *)a2 + 1, (char *)a3);
    if (result == v5)
    {
      result = sub_1DF27EB1C(a1, a2 + 1, (char *)a3, 0);
      if (result == v5)
        return a2;
    }
  }
  return result;
}

char *sub_1DF27E950(uint64_t a1, char *a2, char *a3)
{
  char *v5;
  uint64_t v6;
  uint64_t *v7;
  char *v8;

  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 == a3)
      goto LABEL_20;
    v5 = a2[1] == 94 ? a2 + 2 : a2 + 1;
    v6 = sub_1DF276AF8(a1, a2[1] == 94);
    if (v5 == a3)
      goto LABEL_20;
    v7 = (uint64_t *)v6;
    if ((*(_WORD *)(a1 + 24) & 0x1F0) != 0 && *v5 == 93)
    {
      sub_1DF276B90(v6, 93);
      ++v5;
    }
    if (v5 == a3)
      goto LABEL_20;
    do
    {
      v8 = v5;
      v5 = sub_1DF27EDE8(a1, v5, a3, v7);
    }
    while (v5 != v8);
    if (v8 == a3)
      goto LABEL_20;
    if (*v8 == 45)
    {
      sub_1DF276B90((uint64_t)v7, 45);
      ++v8;
    }
    if (v8 == a3 || *v8 != 93)
LABEL_20:
      sub_1DF277F78();
    return v8 + 1;
  }
  return a2;
}

unsigned __int8 *sub_1DF27EA60(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int v8;

  if (a2 == a3)
    return a2;
  v4 = *a2;
  v5 = (v4 - 48);
  if (v4 == 48)
  {
    sub_1DF276080(a1, v5);
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
      LODWORD(v5) = v8 + 10 * v5 - 48;
      if (v7 == a3)
        goto LABEL_12;
    }
    v6 = v7;
LABEL_12:
    if (!(_DWORD)v5)
      goto LABEL_16;
  }
  if (v5 > *(_DWORD *)(a1 + 28))
LABEL_16:
    sub_1DF2761A4();
  sub_1DF2761F0(a1, v5);
  return v6;
}

unsigned __int8 *sub_1DF27EB1C(uint64_t a1, unsigned __int8 *a2, char *a3, std::string *this)
{
  unsigned __int8 *v4;
  int v5;
  char v6;
  std::string *v7;
  uint64_t v8;
  int v9;
  int v10;
  char v11;
  int v12;
  char v13;
  int v14;
  char v15;
  uint64_t v16;

  v4 = a2;
  if (a2 != (unsigned __int8 *)a3)
  {
    v5 = (char)*a2;
    if (v5 > 109)
    {
      v6 = 0;
      switch(*a2)
      {
        case 'n':
          if (this)
          {
            v7 = this;
            LOBYTE(v8) = 10;
            goto LABEL_50;
          }
          v8 = 10;
          goto LABEL_59;
        case 'r':
          if (this)
          {
            v7 = this;
            LOBYTE(v8) = 13;
            goto LABEL_50;
          }
          v8 = 13;
          goto LABEL_59;
        case 't':
          if (this)
          {
            v7 = this;
            LOBYTE(v8) = 9;
            goto LABEL_50;
          }
          v8 = 9;
          goto LABEL_59;
        case 'u':
          if (a2 + 1 == (unsigned __int8 *)a3)
            goto LABEL_64;
          v9 = a2[1];
          if ((v9 & 0xF8) != 0x30 && (v9 & 0xFE) != 0x38 && (v9 | 0x20u) - 97 >= 6)
            goto LABEL_64;
          v4 = a2 + 2;
          if (a2 + 2 == (unsigned __int8 *)a3)
            goto LABEL_64;
          v10 = *v4;
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
          if (v4 + 1 == (unsigned __int8 *)a3)
            goto LABEL_64;
          v12 = v4[1];
          v13 = -48;
          if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38)
            goto LABEL_30;
          v12 |= 0x20u;
          if ((v12 - 97) >= 6)
            goto LABEL_64;
          v13 = -87;
LABEL_30:
          if (v4 + 2 == (unsigned __int8 *)a3)
            goto LABEL_64;
          v14 = v4[2];
          v15 = -48;
          if ((v14 & 0xF8) == 0x30 || (v14 & 0xFE) == 0x38)
            goto LABEL_35;
          v14 |= 0x20u;
          if ((v14 - 97) >= 6)
            goto LABEL_64;
          v15 = -87;
LABEL_35:
          if (this)
            std::string::operator=(this, v15 + v14 + 16 * (v13 + v12 + v6));
          else
            sub_1DF276080(a1, (char)(v15 + v14 + 16 * (v13 + v12 + v6)));
          v4 += 3;
          return v4;
        case 'v':
          if (this)
          {
            v7 = this;
            LOBYTE(v8) = 11;
            goto LABEL_50;
          }
          v8 = 11;
          break;
        case 'x':
          goto LABEL_25;
        default:
          goto LABEL_45;
      }
      goto LABEL_59;
    }
    if (v5 == 48)
    {
      if (this)
      {
        v7 = this;
        LOBYTE(v8) = 0;
        goto LABEL_50;
      }
      v8 = 0;
LABEL_59:
      sub_1DF276080(a1, v8);
      return ++v4;
    }
    if (v5 != 99)
    {
      if (v5 == 102)
      {
        if (this)
        {
          v7 = this;
          LOBYTE(v8) = 12;
LABEL_50:
          std::string::operator=(v7, v8);
          return ++v4;
        }
        v8 = 12;
        goto LABEL_59;
      }
LABEL_45:
      if (*a2 != 95
        && ((v5 & 0x80) != 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 16) + 4 * *a2) & 0x500) == 0))
      {
        v8 = (char)v5;
        if (this)
        {
          v7 = this;
          goto LABEL_50;
        }
        goto LABEL_59;
      }
LABEL_64:
      sub_1DF275BD8();
    }
    if (a2 + 1 == (unsigned __int8 *)a3 || ((a2[1] & 0xDF) - 65) > 0x19u)
      goto LABEL_64;
    v16 = a2[1] & 0x1F;
    if (this)
      std::string::operator=(this, v16);
    else
      sub_1DF276080(a1, v16);
    v4 += 2;
  }
  return v4;
}

_BYTE *sub_1DF27EDE8(uint64_t a1, char *a2, char *a3, uint64_t *a4)
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
      v10 = sub_1DF27F370(a1, a2 + 2, a3, (uint64_t)a4);
      goto LABEL_34;
    }
    if (v9 == 61)
    {
      v10 = sub_1DF27F194(a1, a2 + 2, a3, a4);
LABEL_34:
      v6 = v10;
      v20 = 0;
      goto LABEL_38;
    }
    goto LABEL_9;
  }
  v18 = sub_1DF27F428(a1, a2 + 2, a3, (uint64_t)&v26);
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
          v14 = sub_1DF27F63C(a1, v13, a3, &v26);
        }
        else
        {
          v14 = (char *)sub_1DF27F514(a1, (unsigned __int8 *)v13, a3, &v26, v6);
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
          sub_1DF278DB8(v6, v17->__r_.__value_.__s.__data_[0], v17->__r_.__value_.__s.__data_[1]);
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
      sub_1DF276B90(v6, v17->__r_.__value_.__s.__data_[0]);
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
    v22 = sub_1DF27F428(a1, v14 + 3, a3, (uint64_t)&v25);
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
        v22 = (uint64_t)sub_1DF27F63C(a1, v14 + 2, a3, &v25);
      else
        v22 = (uint64_t)sub_1DF27F514(a1, (unsigned __int8 *)v14 + 2, a3, &v25, v6);
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
  sub_1DF2789F4(v6, (char *)&v24, (char *)&__p);
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

void sub_1DF27F134(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
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

uint64_t sub_1DF27F194(uint64_t a1, char *a2, char *a3, uint64_t *a4)
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
    sub_1DF277F78();
  sub_1DF27F814(a1, a2, &a2[i], (uint64_t)&v17);
  if (((char)v19 & 0x80000000) == 0)
  {
    v8 = v19;
    if (v19)
    {
      v9 = (char *)&v17;
      goto LABEL_14;
    }
LABEL_34:
    sub_1DF278FE0();
  }
  v8 = v18;
  if (!v18)
    goto LABEL_34;
  v9 = (char *)v17;
LABEL_14:
  sub_1DF279200(a1, v9, &v9[v8], (uint64_t)__p);
  v10 = v16;
  if ((v16 & 0x80u) != 0)
    v10 = (unint64_t)__p[1];
  if (v10)
  {
    sub_1DF27902C(a4, (__int128 *)__p);
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
      sub_1DF278DB8((uint64_t)a4, *v13, v13[1]);
    }
    else
    {
      if (v11 != 1)
        sub_1DF278FE0();
      v12 = (char *)&v17;
      if ((v19 & 0x80u) != 0)
        v12 = (char *)v17;
      sub_1DF276B90((uint64_t)a4, *v12);
    }
  }
  if ((char)v16 < 0)
    operator delete(__p[0]);
  if ((char)v19 < 0)
    operator delete(v17);
  return (uint64_t)&a2[i + 2];
}

void sub_1DF27F338(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DF27F370(uint64_t a1, char *a2, char *a3, uint64_t a4)
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
    sub_1DF277F78();
  v7 = sub_1DF27F9A8(a1, a2, &a2[i], *(_BYTE *)(a1 + 24) & 1);
  if (!v7)
    sub_1DF27970C();
  *(_DWORD *)(a4 + 160) |= v7;
  return (uint64_t)&a2[i + 2];
}

uint64_t sub_1DF27F428(uint64_t a1, char *a2, char *a3, uint64_t a4)
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
    sub_1DF277F78();
  sub_1DF27F814(a1, a2, &a2[i], (uint64_t)&v10);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(_OWORD *)a4 = v10;
  v7 = v11;
  *(_QWORD *)(a4 + 16) = v11;
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 - 1 >= 2)
    sub_1DF278FE0();
  return (uint64_t)&a2[i + 2];
}

unsigned __int8 *sub_1DF27F514(uint64_t a1, unsigned __int8 *a2, char *a3, std::string *this, uint64_t a5)
{
  int v6;
  int v7;
  int v8;
  std::string::value_type v9;
  std::string *v10;

  if (a2 == (unsigned __int8 *)a3)
    sub_1DF275BD8();
  v6 = (char)*a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119)
          return sub_1DF27EB1C(a1, a2, a3, this);
        *(_DWORD *)(a5 + 160) |= 0x500u;
        sub_1DF276B90(a5, 95);
        return a2 + 1;
      }
      v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (v6 == 98)
      {
        v10 = this;
        v9 = 8;
LABEL_19:
        std::string::operator=(v10, v9);
        return a2 + 1;
      }
      if (v6 != 100)
        return sub_1DF27EB1C(a1, a2, a3, this);
      v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v8;
    return a2 + 1;
  }
  if (v6 <= 82)
  {
    if (*a2)
    {
      if (v6 == 68)
      {
        v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_21:
        *(_DWORD *)(a5 + 164) = v7;
        return a2 + 1;
      }
      return sub_1DF27EB1C(a1, a2, a3, this);
    }
    v9 = 0;
    v10 = this;
    goto LABEL_19;
  }
  if (v6 == 83)
  {
    v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_21;
  }
  if (v6 == 87)
  {
    *(_DWORD *)(a5 + 164) |= 0x500u;
    sub_1DF279810(a5, 95);
    return a2 + 1;
  }
  return sub_1DF27EB1C(a1, a2, a3, this);
}

char *sub_1DF27F63C(uint64_t a1, char *a2, char *a3, std::string *this)
{
  uint64_t v5;
  std::string *v6;
  std::string::value_type v7;
  char *v8;
  char v9;
  int v10;
  std::string::value_type v11;

  if (a2 == a3)
LABEL_52:
    sub_1DF275BD8();
  v5 = *a2;
  if ((int)v5 > 97)
  {
    switch((int)v5)
    {
      case 'n':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 10;
          goto LABEL_16;
        }
        v5 = 10;
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
        v5 = 13;
        goto LABEL_49;
      case 't':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 9;
          goto LABEL_16;
        }
        v5 = 9;
        goto LABEL_49;
      case 'v':
        if (this)
        {
          v6 = this;
          LOBYTE(v5) = 11;
          goto LABEL_16;
        }
        v5 = 11;
        goto LABEL_49;
      default:
        if ((_DWORD)v5 == 98)
        {
          if (this)
          {
            v6 = this;
            LOBYTE(v5) = 8;
            goto LABEL_16;
          }
          v5 = 8;
        }
        else
        {
          if ((_DWORD)v5 != 102)
            goto LABEL_21;
          if (this)
          {
            v6 = this;
            LOBYTE(v5) = 12;
            goto LABEL_16;
          }
          v5 = 12;
        }
        break;
    }
    goto LABEL_49;
  }
  if ((int)v5 > 91)
  {
    if ((_DWORD)v5 != 92)
    {
      if ((_DWORD)v5 != 97)
        goto LABEL_21;
      if (this)
      {
        v6 = this;
        LOBYTE(v5) = 7;
LABEL_16:
        std::string::operator=(v6, v5);
        return a2 + 1;
      }
      v5 = 7;
LABEL_49:
      sub_1DF276080(a1, v5);
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
  if ((_DWORD)v5 == 34 || (_DWORD)v5 == 47)
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
    sub_1DF276080(a1, v7);
  return v8;
}

void sub_1DF27F814(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
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

  sub_1DF277D38(&__s, a2, a3, a3 - a2);
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

void sub_1DF27F974(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DF27F9A8(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  unint64_t v6;
  void **v7;
  void **v8;
  uint64_t classname;
  void *__p[2];
  unsigned __int8 v12;

  sub_1DF277D38(__p, a2, a3, a3 - a2);
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

void sub_1DF27FA44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

unsigned __int8 *sub_1DF27FA60(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6;
  int v7;
  unsigned __int8 *v8;

  if (a2 == a3)
    return (unsigned __int8 *)a2;
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_DWORD *)(a1 + 28);
  v8 = (unsigned __int8 *)sub_1DF27FAE8(a1, a2, a3);
  if (v8 == (unsigned __int8 *)a2)
    return (unsigned __int8 *)a2;
  else
    return sub_1DF27FBF4(a1, v8, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
}

char *sub_1DF27FAE8(uint64_t a1, char *a2, char *a3)
{
  char *v6;
  char *v7;
  int v8;
  uint64_t v9;
  int v10;
  char *v11;
  int v13;
  uint64_t v14;

  v6 = sub_1DF27FD94(a1, a2, a3);
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
        sub_1DF2759A4(a1);
        v10 = *(_DWORD *)(a1 + 28);
        do
        {
          v11 = (char *)v9;
          v9 = sub_1DF27FA60(a1, v9, a3);
        }
        while ((char *)v9 != v11);
        if (v11 == a3 || v11 + 1 == a3 || *v11 != 92 || v11[1] != 41)
          sub_1DF274134();
        v7 = v11 + 2;
        sub_1DF275A18(a1, v10);
      }
      else
      {
        v13 = sub_1DF27ADC8(a1, v8);
        v14 = 2;
        if (!v13)
          v14 = 0;
        return &a2[v14];
      }
    }
  }
  return v7;
}

unsigned __int8 *sub_1DF27FBF4(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, int a5, int a6)
{
  unsigned __int8 *v6;
  int v11;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;
  unsigned __int8 *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  int v24;
  int v25;

  v6 = a2;
  if (a2 != a3)
  {
    v11 = *a2;
    if (v11 == 42)
    {
      sub_1DF27A0B8(a1, 0, -1, a4, a5, a6, 1);
      return ++v6;
    }
    if (a2 + 1 != a3 && v11 == 92 && a2[1] == 123)
    {
      v13 = a2 + 2;
      v25 = 0;
      v14 = sub_1DF27A200(a1, a2 + 2, a3, &v25);
      if (v14 == v13)
        goto LABEL_16;
      if (v14 != a3)
      {
        v15 = v14 + 1;
        v16 = *v14;
        if (v16 == 44)
        {
          v24 = -1;
          v17 = sub_1DF27A200(a1, v15, a3, &v24);
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
              sub_1DF27A29C();
            }
            v6 = &v17[2 * (v17[1] == 125)];
            v20 = a5;
            v21 = a6;
            v22 = a1;
LABEL_23:
            sub_1DF27A0B8(v22, v18, v19, a4, v20, v21, 1);
            return v6;
          }
        }
        else if (v15 != a3 && v16 == 92 && *v15 == 125)
        {
          v6 = v14 + 2;
          v18 = v25;
          v20 = a5;
          v21 = a6;
          v22 = a1;
          v19 = v25;
          goto LABEL_23;
        }
      }
      sub_1DF27A2E8();
    }
  }
  return v6;
}

char *sub_1DF27FD94(uint64_t a1, char *a2, char *a3)
{
  int v6;
  char *result;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  if (a2 == a3)
  {
    result = sub_1DF27AC78(a1, a2, a3);
    if (result != a2)
      return result;
    return sub_1DF27E950(a1, a2, a3);
  }
  v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
  {
    sub_1DF276080(a1, (char)v6);
    return a2 + 1;
  }
  result = sub_1DF27AC78(a1, a2, a3);
  if (result != a2)
    return result;
  if (*a2 != 46)
    return sub_1DF27E950(a1, a2, a3);
  v9 = (_QWORD *)operator new();
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(v10 + 8);
  *v9 = &unk_1EA9834B8;
  v9[1] = v11;
  *(_QWORD *)(v10 + 8) = v9;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  return a2 + 1;
}

unsigned __int8 *sub_1DF27FEAC(uint64_t a1, char *a2, char *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;

  v6 = sub_1DF27FF08(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2)
    sub_1DF27A7DC();
  do
  {
    v7 = v6;
    v6 = sub_1DF27FF08(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  return v7;
}

unsigned __int8 *sub_1DF27FF08(uint64_t a1, char *a2, char *a3)
{
  uint64_t v6;
  int v7;
  char *v8;
  unsigned __int8 *v9;
  int v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  int v16;
  char *v17;
  char *v18;

  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_DWORD *)(a1 + 28);
  v8 = sub_1DF2800B8(a1, a2, a3);
  v9 = (unsigned __int8 *)v8;
  if (v8 != a2 || v8 == a3)
    goto LABEL_12;
  v10 = *a2;
  switch(v10)
  {
    case '$':
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      v14 = (char *)&unk_1EA983718;
      goto LABEL_8;
    case '(':
      sub_1DF2759A4(a1);
      v16 = *(_DWORD *)(a1 + 28);
      ++*(_DWORD *)(a1 + 36);
      v17 = (char *)sub_1DF27DD1C(a1, a2 + 1, a3);
      if (v17 == a3 || (v18 = v17, *v17 != 41))
        sub_1DF274134();
      sub_1DF275A18(a1, v16);
      --*(_DWORD *)(a1 + 36);
      v9 = (unsigned __int8 *)(v18 + 1);
LABEL_12:
      if (v9 != (unsigned __int8 *)a2)
        return sub_1DF27E5B0(a1, v9, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
      return (unsigned __int8 *)a2;
    case '^':
      v11 = operator new();
      v12 = (*(_DWORD *)(a1 + 24) & 0x5F0) == 1024;
      v13 = *(_QWORD *)(a1 + 56);
      v14 = (char *)&unk_1EA9836B8;
LABEL_8:
      v15 = *(_QWORD *)(v13 + 8);
      *(_QWORD *)v11 = v14 + 16;
      *(_QWORD *)(v11 + 8) = v15;
      *(_BYTE *)(v11 + 16) = v12;
      *(_QWORD *)(v13 + 8) = v11;
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v9 = (unsigned __int8 *)(a2 + 1);
      return sub_1DF27E5B0(a1, v9, (unsigned __int8 *)a3, v6, v7 + 1, *(_DWORD *)(a1 + 28) + 1);
  }
  return (unsigned __int8 *)a2;
}

char *sub_1DF2800B8(uint64_t a1, char *a2, char *a3)
{
  char *result;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  result = sub_1DF27B0F8(a1, a2, a3);
  if (result == a2)
  {
    result = sub_1DF280180(a1, a2, a3);
    if (result == a2)
    {
      if (a2 == a3 || *a2 != 46)
      {
        return sub_1DF27E950(a1, a2, a3);
      }
      else
      {
        v7 = (_QWORD *)operator new();
        v8 = *(_QWORD *)(a1 + 56);
        v9 = *(_QWORD *)(v8 + 8);
        *v7 = &unk_1EA9834B8;
        v7[1] = v9;
        *(_QWORD *)(v8 + 8) = v7;
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        return a2 + 1;
      }
    }
  }
  return result;
}

char *sub_1DF280180(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  char *v4;
  int v5;
  signed __int8 v6;
  BOOL v7;
  int v9;
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
    sub_1DF276080(a1, v6);
    v3 += 2;
    return v3;
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0x40)
  {
    v9 = sub_1DF27ADC8(a1, v6);
    v10 = 2;
    if (!v9)
      v10 = 0;
    v3 += v10;
    return v3;
  }
  return sub_1DF27F63C(a1, v4, a3, 0);
}

BOOL sub_1DF280244(const void **a1, _QWORD *__s1)
{
  size_t v2;
  int v3;
  size_t v4;
  const void *v6;

  v2 = *((unsigned __int8 *)a1 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = (size_t)a1[1];
  if ((*((char *)__s1 + 23) & 0x80000000) == 0)
  {
    v4 = *((unsigned __int8 *)__s1 + 23);
    if (v2 >= v4)
      goto LABEL_9;
    return 0;
  }
  v4 = __s1[1];
  if (v2 < v4)
    return 0;
  __s1 = (_QWORD *)*__s1;
LABEL_9:
  if (v3 >= 0)
    v6 = a1;
  else
    v6 = *a1;
  return memcmp(__s1, v6, v4) == 0;
}

uint64_t sub_1DF2802B8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  void *v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(v4 - 8);
  if (v7 >= v6)
  {
    v9 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v7 - *a1) >> 3);
    if (v9 + 1 > 0x222222222222222)
      sub_1DF271380();
    v10 = 0xEEEEEEEEEEEEEEEFLL * ((uint64_t)(v5 - *a1) >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= v9 + 1)
      v11 = v9 + 1;
    if (v10 >= 0x111111111111111)
      v12 = 0x222222222222222;
    else
      v12 = v11;
    v19 = v4;
    if (v12)
      v13 = (char *)sub_1DF282BC8(v4, v12);
    else
      v13 = 0;
    v15 = v13;
    v16 = &v13[120 * v9];
    v18 = &v13[120 * v12];
    sub_1DF280DE8((uint64_t)v16, a2);
    v17 = v16 + 120;
    sub_1DF282B54(a1, &v15);
    v8 = a1[1];
    sub_1DF282DCC(&v15);
  }
  else
  {
    sub_1DF280DE8(*(_QWORD *)(v4 - 8), a2);
    v8 = v7 + 120;
    a1[1] = v7 + 120;
  }
  a1[1] = v8;
  return v8 - 120;
}

void sub_1DF2803C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DF282DCC((void **)va);
  _Unwind_Resume(a1);
}

void sub_1DF2803DC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v14;
  char v15;
  int v16;
  unint64_t v17;
  _BYTE *v18;
  uint64_t *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _BYTE *v23;
  BOOL v24;
  char **v25;
  char **v26;
  _BYTE *v27;
  BOOL v28;
  uint64_t *v29;
  uint64_t v30;
  char *v31;
  BOOL v32;
  char **v33;
  char **v34;
  std::string *v35;
  void *v36;
  char v37;
  std::string *v38;
  void *v39;
  char v40;
  unint64_t v41;
  _BYTE *v42;
  BOOL v43;
  uint64_t *v44;
  uint64_t v45;
  char *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  std::__shared_weak_count *v51;
  unint64_t *p_shared_owners;
  unint64_t v53;
  void *v54;
  unint64_t v55;
  _BYTE *v56;
  char **v57;
  uint64_t v58;
  void *__p;
  void *v61;
  char v62;
  int v63;
  void *v64[2];
  void *v65;
  void *v66;
  _BYTE v67[15];
  char v68;
  void *v69;
  _BYTE v70[15];
  char v71;
  void *v72[2];
  void *v73;
  std::string v74;
  std::__shared_weak_count *v75;
  _BYTE v76[48];
  _BYTE v77[32];
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  char v84;
  uint64_t v85;
  void *v86[7];
  uint64_t v87;
  char v88;
  _QWORD v89[2];
  char v90;
  char v91;
  uint64_t v92;
  int v93;
  __int128 v94;
  void *v95;
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[5];

  v98[2] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)((char *)v98 + 7) = 0;
  v98[0] = 0;
  *(_QWORD *)((char *)v97 + 7) = 0;
  v97[0] = 0;
  v93 = 1;
  LOBYTE(v94) = 0;
  v3 = *(unsigned __int8 *)(a1 + 23);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  if ((v3 & 0x80u) == 0)
    v6 = *(unsigned __int8 *)(a1 + 23);
  else
    v6 = *(_QWORD *)(a1 + 8);
  if ((v3 & 0x80u) == 0)
    v7 = (char *)a1;
  else
    v7 = *(char **)a1;
  v8 = &v7[v6];
  if (v6 >= 2)
  {
    v9 = v7;
    do
    {
      v10 = (char *)memchr(v9, 32, v6 - 1);
      if (!v10)
        break;
      if (*(_WORD *)v10 == 8224)
        goto LABEL_13;
      v9 = v10 + 1;
      v6 = v8 - (_BYTE *)v9;
    }
    while (v8 - (_BYTE *)v9 > 1);
  }
  v10 = v8;
LABEL_13:
  v11 = v10 - v7;
  if (v10 == v8)
    v11 = -1;
  if ((v3 & 0x80) != 0)
  {
    if (v11 == -1)
    {
      v12 = v4 + v5;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  v4 = a1;
  if (v11 != -1)
  {
LABEL_19:
    v12 = v4 + v11;
    goto LABEL_20;
  }
  v12 = a1 + v3;
LABEL_20:
  v13 = atomic_load((unsigned __int8 *)&qword_1F0473FD0);
  if ((v13 & 1) == 0 && __cxa_guard_acquire(&qword_1F0473FD0))
  {
    sub_1DF27D888((const std::locale *)&unk_1F0473F90, "(-{1,2})?(.*?)([,= ]|$)", 0);
    __cxa_atexit((void (*)(void *))sub_1DF272AAC, &unk_1F0473F90, &dword_1DF26E000);
    __cxa_guard_release(&qword_1F0473FD0);
  }
  if (*(char *)(a1 + 23) >= 0)
    v14 = a1;
  else
    v14 = *(_QWORD *)a1;
  v58 = v12;
  sub_1DF27D788((uint64_t)v86, v14, v12, (uint64_t)&unk_1F0473F90, 32);
  v62 = 0;
  __p = 0;
  v61 = 0;
  v15 = 0;
  v16 = 0;
  v78 = 0;
  v79 = 0;
  v80 = 0;
  v81 = 0;
  v82 = 0;
  v83 = 0;
  v84 = 0;
  v85 = 0;
  *(_OWORD *)&v76[32] = 0u;
  memset(v77, 0, 25);
  memset(v76, 0, 28);
  while (!sub_1DF27B404((uint64_t)v86, (uint64_t)v76))
  {
    v17 = 0xAAAAAAAAAAAAAAABLL * (((char *)v86[5] - (char *)v86[4]) >> 3);
    v18 = (char *)v86[4] + 40;
    if (v17 <= 1)
      v18 = v89;
    if (*v18)
    {
      v19 = (uint64_t *)((char *)v86[4] + 24);
      if (v17 <= 1)
        v19 = &v87;
      v20 = *v19;
      v21 = (char *)v86[4] + 32;
      if (v17 <= 1)
        v21 = &v88;
      v22 = *(_QWORD *)v21 - v20;
      v23 = (char *)v86[4] + 64;
      if (v17 <= 2)
        v23 = v89;
      if (v22 == 1)
      {
        if (*v23)
        {
          v24 = v17 > 2;
          if (v17 <= 2)
            v25 = (char **)&v87;
          else
            v25 = (char **)((char *)v86[4] + 48);
          v26 = (char **)((char *)v86[4] + 56);
          if (!v24)
            v26 = (char **)&v88;
          sub_1DF277D38(&v74, *v25, *v26, *v26 - *v25);
        }
        else
        {
          memset(&v74, 0, sizeof(v74));
        }
        v35 = std::string::insert(&v74, 0, "-");
        v36 = (void *)v35->__r_.__value_.__r.__words[0];
        v96[0] = v35->__r_.__value_.__l.__size_;
        *(_QWORD *)((char *)v96 + 7) = *(std::string::size_type *)((char *)&v35->__r_.__value_.__r.__words[1] + 7);
        v37 = HIBYTE(v35->__r_.__value_.__r.__words[2]);
        v35->__r_.__value_.__l.__size_ = 0;
        v35->__r_.__value_.__r.__words[2] = 0;
        v35->__r_.__value_.__r.__words[0] = 0;
        if (v62 < 0)
          operator delete(__p);
        v98[0] = v96[0];
        *(_QWORD *)((char *)v98 + 7) = *(_QWORD *)((char *)v96 + 7);
        if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v74.__r_.__value_.__l.__data_);
        v62 = v37;
        __p = v36;
      }
      else
      {
        if (*v23)
        {
          v32 = v17 > 2;
          if (v17 <= 2)
            v33 = (char **)&v87;
          else
            v33 = (char **)((char *)v86[4] + 48);
          v34 = (char **)((char *)v86[4] + 56);
          if (!v32)
            v34 = (char **)&v88;
          sub_1DF277D38(&v74, *v33, *v34, *v34 - *v33);
        }
        else
        {
          memset(&v74, 0, sizeof(v74));
        }
        v38 = std::string::insert(&v74, 0, "--");
        v39 = (void *)v38->__r_.__value_.__r.__words[0];
        v96[0] = v38->__r_.__value_.__l.__size_;
        *(_QWORD *)((char *)v96 + 7) = *(std::string::size_type *)((char *)&v38->__r_.__value_.__r.__words[1] + 7);
        v40 = HIBYTE(v38->__r_.__value_.__r.__words[2]);
        v38->__r_.__value_.__l.__size_ = 0;
        v38->__r_.__value_.__r.__words[2] = 0;
        v38->__r_.__value_.__r.__words[0] = 0;
        if (v15 < 0)
          operator delete(v61);
        v97[0] = v96[0];
        *(_QWORD *)((char *)v97 + 7) = *(_QWORD *)((char *)v96 + 7);
        if (SHIBYTE(v74.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v74.__r_.__value_.__l.__data_);
        v61 = v39;
        v15 = v40;
      }
    }
    else
    {
      v27 = (char *)v86[4] + 64;
      if (v17 <= 2)
        v27 = v89;
      if (*v27)
      {
        v28 = v17 > 2;
        if (v17 <= 2)
          v29 = &v87;
        else
          v29 = (uint64_t *)((char *)v86[4] + 48);
        v30 = *v29;
        v31 = (char *)v86[4] + 56;
        if (!v28)
          v31 = &v88;
        if (*(_QWORD *)v31 - v30 > 0)
          v16 = 1;
      }
    }
    v41 = 0xAAAAAAAAAAAAAAABLL * (((char *)v86[5] - (char *)v86[4]) >> 3);
    v42 = (char *)v86[4] + 88;
    if (v41 <= 3)
      v42 = v89;
    if (!*v42)
      break;
    v43 = v41 > 3;
    if (v41 <= 3)
      v44 = &v87;
    else
      v44 = (uint64_t *)((char *)v86[4] + 72);
    v45 = *v44;
    v46 = (char *)v86[4] + 80;
    if (!v43)
      v46 = &v88;
    if (*(_QWORD *)v46 == v45)
      break;
    sub_1DF27B244((uint64_t)v86);
  }
  if (*(_QWORD *)&v76[32])
  {
    *(_QWORD *)&v76[40] = *(_QWORD *)&v76[32];
    operator delete(*(void **)&v76[32]);
  }
  if (v86[4])
  {
    v86[5] = v86[4];
    operator delete(v86[4]);
  }
  if (v16)
  {
    memset(v77, 0, 17);
    *(_QWORD *)&v77[24] = 0;
    v78 = 0;
    LOBYTE(v79) = 0;
    v80 = 0;
    v81 = 0;
    memset(v76, 0, 41);
    v47 = *(char *)(a1 + 23);
    if (v47 >= 0)
      v48 = a1;
    else
      v48 = *(_QWORD *)a1;
    if (v47 >= 0)
      v49 = *(unsigned __int8 *)(a1 + 23);
    else
      v49 = *(_QWORD *)(a1 + 8);
    sub_1DF27D888((const std::locale *)&v74, "\\[default: (.*)\\]", 1);
    v86[6] = 0;
    v87 = 0;
    v88 = 0;
    v89[0] = 0;
    v89[1] = 0;
    v90 = 0;
    v91 = 0;
    v92 = 0;
    memset(v86, 0, 41);
    v50 = sub_1DF27B5C4((uint64_t)&v74, v58, v48 + v49, (uint64_t)v86, 0);
    sub_1DF27B79C((uint64_t)v76, v58, v48 + v49, (uint64_t *)v86, 0);
    if (v86[0])
    {
      v86[1] = v86[0];
      operator delete(v86[0]);
    }
    v51 = v75;
    if (v75)
    {
      p_shared_owners = (unint64_t *)&v75->__shared_owners_;
      do
        v53 = __ldaxr(p_shared_owners);
      while (__stlxr(v53 - 1, p_shared_owners));
      if (!v53)
      {
        ((void (*)(std::__shared_weak_count *))v51->__on_zero_shared)(v51);
        std::__shared_weak_count::__release_weak(v51);
      }
    }
    std::locale::~locale((std::locale *)&v74);
    v54 = *(void **)v76;
    if (!v50)
      goto LABEL_125;
    v55 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&v76[8] - *(_QWORD *)v76) >> 3);
    if (v55 <= 1)
      v56 = v76;
    else
      v56 = *(_BYTE **)v76;
    if (v56[40])
    {
      if (v55 <= 1)
        v57 = (char **)v76;
      else
        v57 = *(char ***)v76;
      sub_1DF277D38(v72, v57[3], v57[4], v57[4] - v57[3]);
    }
    else
    {
      v72[0] = 0;
      v72[1] = 0;
      v73 = 0;
    }
    LODWORD(v86[0]) = 3;
    *(_OWORD *)&v86[1] = *(_OWORD *)v72;
    v86[3] = v73;
    v72[0] = 0;
    v72[1] = 0;
    v73 = 0;
    if (v93 == 3)
    {
      if (SHIBYTE(v95) < 0)
        operator delete((void *)v94);
    }
    else
    {
      if (v93 != 4)
      {
        v93 = 3;
LABEL_119:
        v94 = *(_OWORD *)&v86[1];
        v95 = v86[3];
        memset(&v86[1], 0, 24);
LABEL_122:
        if (SHIBYTE(v73) < 0)
          operator delete(v72[0]);
        v54 = *(void **)v76;
LABEL_125:
        if (v54)
        {
          *(_QWORD *)&v76[8] = v54;
          operator delete(v54);
        }
        goto LABEL_127;
      }
      v74.__r_.__value_.__r.__words[0] = (std::string::size_type)&v94;
      sub_1DF28BFB0((void ***)&v74);
    }
    v93 = (int)v86[0];
    switch(LODWORD(v86[0]))
    {
      case 1:
        LOBYTE(v94) = v86[1];
        break;
      case 2:
        *(void **)&v94 = v86[1];
        break;
      case 3:
        goto LABEL_119;
      case 4:
        v94 = *(_OWORD *)&v86[1];
        v95 = v86[3];
        memset(&v86[1], 0, 24);
        v74.__r_.__value_.__r.__words[0] = (std::string::size_type)&v86[1];
        sub_1DF28BFB0((void ***)&v74);
        break;
      default:
        goto LABEL_122;
    }
    goto LABEL_122;
  }
LABEL_127:
  v69 = __p;
  *(_QWORD *)v70 = v98[0];
  *(_QWORD *)&v70[7] = *(_QWORD *)((char *)v98 + 7);
  v71 = v62;
  v66 = v61;
  *(_QWORD *)v67 = v97[0];
  *(_QWORD *)&v67[7] = *(_QWORD *)((char *)v97 + 7);
  v68 = v15;
  v63 = v93;
  switch(v93)
  {
    case 1:
      LOBYTE(v64[0]) = v94;
      break;
    case 2:
      v64[0] = (void *)v94;
      break;
    case 3:
      *(_OWORD *)v64 = v94;
      v65 = v95;
      v95 = 0;
      v94 = 0uLL;
      break;
    case 4:
      *(_OWORD *)v64 = v94;
      v65 = v95;
      v95 = 0;
      v94 = 0uLL;
      break;
    default:
      break;
  }
  sub_1DF282E40(a2, (__int128 *)&v69, (__int128 *)&v66, v16, (uint64_t)&v63);
  if (v63 == 4)
  {
    v86[0] = v64;
    sub_1DF28BFB0((void ***)v86);
  }
  else if (v63 == 3 && SHIBYTE(v65) < 0)
  {
    operator delete(v64[0]);
  }
  if (v68 < 0)
    operator delete(v66);
  if (v71 < 0)
    operator delete(v69);
  if (v93 == 4)
  {
    v86[0] = &v94;
    sub_1DF28BFB0((void ***)v86);
  }
  else if (v93 == 3 && SHIBYTE(v95) < 0)
  {
    operator delete((void *)v94);
  }
}

void sub_1DF280C34(_Unwind_Exception *a1)
{
  uint64_t v1;

  __cxa_guard_abort(&qword_1F0473FD0);
  sub_1DF28202C(v1 - 184);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF280D4C(uint64_t a1)
{
  int v2;
  void **v4;

  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  if (*(char *)(a1 + 87) < 0)
    operator delete(*(void **)(a1 + 64));
  *(_QWORD *)a1 = off_1EA982FB8;
  v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    v4 = (void **)(a1 + 40);
    sub_1DF28BFB0(&v4);
  }
  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

__n128 sub_1DF280DE8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  int v3;
  int v4;
  _BYTE *v5;
  __int128 v6;
  __int128 v7;
  __n128 result;

  *(_QWORD *)a1 = off_1EA982FB8;
  v2 = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 8) = 0;
  v3 = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 32) = v3;
  v4 = v3 - 1;
  v5 = (_BYTE *)(a1 + 40);
  switch(v4)
  {
    case 0:
      *v5 = *(_BYTE *)(a2 + 40);
      break;
    case 1:
      *(_QWORD *)v5 = *(_QWORD *)(a2 + 40);
      break;
    case 2:
      v6 = *(_OWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_OWORD *)v5 = v6;
      *(_QWORD *)(a2 + 48) = 0;
      *(_QWORD *)(a2 + 56) = 0;
      *(_QWORD *)(a2 + 40) = 0;
      break;
    case 3:
      *(_QWORD *)v5 = 0;
      *(_QWORD *)(a1 + 48) = 0;
      *(_QWORD *)(a1 + 56) = 0;
      *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
      *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a2 + 40) = 0;
      *(_QWORD *)(a2 + 48) = 0;
      *(_QWORD *)(a2 + 56) = 0;
      break;
    default:
      break;
  }
  *(_QWORD *)a1 = off_1EA9831D0;
  v7 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = v7;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  result = *(__n128 *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(__n128 *)(a1 + 88) = result;
  *(_QWORD *)(a2 + 96) = 0;
  *(_QWORD *)(a2 + 104) = 0;
  *(_QWORD *)(a2 + 88) = 0;
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  return result;
}

uint64_t sub_1DF280ED8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(void)@<X1>, _QWORD *a3@<X8>)
{
  uint64_t result;
  _QWORD *v6;

  result = a2();
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  if ((_DWORD)result)
  {
    v6 = operator new(8uLL);
    *a3 = v6;
    *v6 = a1;
    result = (uint64_t)(v6 + 1);
    a3[1] = result;
    a3[2] = result;
  }
  return result;
}

void sub_1DF280F1C(uint64_t a1, void **a2)
{
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v4 = (uint64_t)(a2 + 2);
  v5 = (unint64_t)a2[2];
  v6 = a2[1];
  if ((unint64_t)v6 >= v5)
  {
    v8 = ((char *)v6 - (_BYTE *)*a2) >> 3;
    if ((unint64_t)(v8 + 1) >> 61)
      sub_1DF271380();
    v9 = v5 - (_QWORD)*a2;
    v10 = v9 >> 2;
    if (v9 >> 2 <= (unint64_t)(v8 + 1))
      v10 = v8 + 1;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    if (v11)
      v12 = (char *)sub_1DF271394(v4, v11);
    else
      v12 = 0;
    v13 = &v12[8 * v8];
    v14 = &v12[8 * v11];
    *(_QWORD *)v13 = a1;
    v7 = v13 + 8;
    v16 = (char *)*a2;
    v15 = (char *)a2[1];
    if (v15 != *a2)
    {
      do
      {
        v17 = *((_QWORD *)v15 - 1);
        v15 -= 8;
        *((_QWORD *)v13 - 1) = v17;
        v13 -= 8;
      }
      while (v15 != v16);
      v15 = (char *)*a2;
    }
    *a2 = v13;
    a2[1] = v7;
    a2[2] = v14;
    if (v15)
      operator delete(v15);
  }
  else
  {
    *v6 = a1;
    v7 = v6 + 1;
  }
  a2[1] = v7;
}

BOOL sub_1DF280FF4(_DWORD *a1, _QWORD *a2, char **a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  unsigned __int8 *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unsigned __int8 *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int *v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void **v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  int v41[2];
  __int128 *v42;
  uint64_t v43;
  int *v44;
  void *__p[2];
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  void **v49;

  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)a1 + 64))(&v47);
  v6 = v48;
  if (!(_QWORD)v48)
    goto LABEL_66;
  v7 = a2[1];
  v8 = *a2 + 16 * v47;
  v9 = v8 + 16;
  if (v8 + 16 != v7)
  {
    v10 = *a2 + 16 * v47;
    do
    {
      sub_1DF28208C(v10, (__int128 *)(v10 + 16));
      v8 += 16;
      v11 = v10 + 32;
      v10 += 16;
    }
    while (v11 != v7);
    v9 = a2[1];
  }
  while (v9 != v8)
    v9 = sub_1DF2717AC(v9 - 16);
  a2[1] = v8;
  v12 = *a3;
  v13 = a3[1];
  if (*a3 != v13)
  {
    do
    {
      v14 = (unsigned __int8 *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)v12 + 24))(*(_QWORD *)v12);
      v15 = (*(uint64_t (**)(_DWORD *))(*(_QWORD *)a1 + 24))(a1);
      v16 = v14[23];
      if ((v16 & 0x80u) == 0)
        v17 = v14[23];
      else
        v17 = *((_QWORD *)v14 + 1);
      v18 = *(unsigned __int8 *)(v15 + 23);
      v19 = (char)v18;
      if ((v18 & 0x80u) != 0)
        v18 = *(_QWORD *)(v15 + 8);
      if (v17 == v18)
      {
        if (v19 >= 0)
          v20 = (unsigned __int8 *)v15;
        else
          v20 = *(unsigned __int8 **)v15;
        if ((v16 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v14, v20, *((_QWORD *)v14 + 1)))
            goto LABEL_26;
        }
        else
        {
          if (!v14[23])
            goto LABEL_26;
          while (*v14 == *v20)
          {
            ++v14;
            ++v20;
            if (!--v16)
              goto LABEL_26;
          }
        }
      }
      v12 += 16;
    }
    while (v12 != v13);
    v12 = v13;
  }
LABEL_26:
  v21 = a1[8];
  if (v21 == 4)
  {
    *(_QWORD *)v41 = 0;
    v42 = 0;
    v43 = 0;
    v24 = v48;
    v25 = (int *)(v48 + 32);
    if (*(_DWORD *)(v48 + 32) == 4)
    {
      sub_1DF270BD4(v25, 4u);
      if (v41 != (int *)(v24 + 40))
        sub_1DF28213C((uint64_t)v41, *(std::string **)(v24 + 40), *(__int128 **)(v24 + 48), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v24 + 48) - *(_QWORD *)(v24 + 40)) >> 3));
    }
    else if (*(_DWORD *)(v48 + 32) == 3)
    {
      sub_1DF270BD4(v25, 3u);
      v42 = (__int128 *)sub_1DF279350((uint64_t *)v41, (__int128 *)(v24 + 40));
    }
    if (v12 == a3[1])
    {
      sub_1DF281E08(a3, &v48);
      v29 = v48;
      v40 = 0;
      v39 = 0uLL;
      sub_1DF28BF2C((char *)&v39, *(__int128 **)v41, v42, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v42 - *(_QWORD *)v41) >> 3));
      LODWORD(v44) = 4;
      *(_OWORD *)__p = v39;
      v46 = v40;
      v39 = 0uLL;
      v40 = 0;
      sub_1DF281F48(v29, (int *)&v44);
      if ((_DWORD)v44 == 4)
      {
        v49 = __p;
        sub_1DF28BFB0(&v49);
      }
      else if ((_DWORD)v44 == 3 && SHIBYTE(v46) < 0)
      {
        operator delete(__p[0]);
      }
      v30 = (void **)&v39;
    }
    else
    {
      v27 = *(_QWORD *)v12;
      if (*(_DWORD *)(*(_QWORD *)v12 + 32) == 4)
      {
        sub_1DF270BD4((int *)(*(_QWORD *)v12 + 32), 4u);
        sub_1DF2824C4((uint64_t *)v41, *(std::string **)v41, *(std::string **)(v27 + 40), *(__int128 **)(v27 + 48), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v27 + 48) - *(_QWORD *)(v27 + 40)) >> 3));
        v28 = *(_QWORD *)v12;
        v38 = 0;
        v37 = 0uLL;
        sub_1DF28BF2C((char *)&v37, *(__int128 **)v41, v42, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v42 - *(_QWORD *)v41) >> 3));
        LODWORD(v44) = 4;
        *(_OWORD *)__p = v37;
        v46 = v38;
        v37 = 0uLL;
        v38 = 0;
        sub_1DF281F48(v28, (int *)&v44);
        if ((_DWORD)v44 == 4)
        {
          v49 = __p;
          sub_1DF28BFB0(&v49);
        }
        else if ((_DWORD)v44 == 3 && SHIBYTE(v46) < 0)
        {
          operator delete(__p[0]);
        }
        v30 = (void **)&v37;
      }
      else
      {
        v36 = 0;
        v35 = 0uLL;
        sub_1DF28BF2C((char *)&v35, *(__int128 **)v41, v42, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v42 - *(_QWORD *)v41) >> 3));
        LODWORD(v44) = 4;
        *(_OWORD *)__p = v35;
        v46 = v36;
        v35 = 0uLL;
        v36 = 0;
        sub_1DF281F48(v27, (int *)&v44);
        if ((_DWORD)v44 == 4)
        {
          v49 = __p;
          sub_1DF28BFB0(&v49);
        }
        else if ((_DWORD)v44 == 3 && SHIBYTE(v46) < 0)
        {
          operator delete(__p[0]);
        }
        v30 = (void **)&v35;
      }
    }
    v49 = v30;
    sub_1DF28BFB0(&v49);
    v44 = v41;
    v26 = (int *)&v44;
    goto LABEL_65;
  }
  if (v21 != 2)
  {
    sub_1DF281E08(a3, &v48);
    goto LABEL_66;
  }
  if (v12 == a3[1])
  {
    sub_1DF281E08(a3, &v48);
    v22 = v48;
  }
  else
  {
    v22 = *(_QWORD *)v12;
    if (*(_DWORD *)(*(_QWORD *)v12 + 32) == 2)
    {
      v23 = sub_1DF26EEE4(*(_QWORD *)v12 + 32) + 1;
      v22 = *(_QWORD *)v12;
      LODWORD(v44) = 2;
      goto LABEL_37;
    }
  }
  LODWORD(v44) = 2;
  v23 = 1;
LABEL_37:
  __p[0] = (void *)v23;
  sub_1DF281F48(v22, (int *)&v44);
  if ((_DWORD)v44 == 4)
  {
    *(_QWORD *)v41 = __p;
    v26 = v41;
LABEL_65:
    sub_1DF28BFB0((void ***)v26);
    goto LABEL_66;
  }
  if ((_DWORD)v44 == 3 && SHIBYTE(v46) < 0)
    operator delete(__p[0]);
LABEL_66:
  v31 = (std::__shared_weak_count *)*((_QWORD *)&v48 + 1);
  if (*((_QWORD *)&v48 + 1))
  {
    v32 = (unint64_t *)(*((_QWORD *)&v48 + 1) + 8);
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  return v6 != 0;
}

void sub_1DF281564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,void **a23)
{
  uint64_t v23;

  a23 = (void **)&a20;
  sub_1DF28BFB0(&a23);
  sub_1DF2717AC(v23);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF2815B8(uint64_t a1)
{
  return a1 + 8;
}

BOOL sub_1DF2815C0(uint64_t a1)
{
  return *(_DWORD *)(a1 + 32) != 0;
}

uint64_t sub_1DF2815D0(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  char v6;
  char v7;

  v2 = sub_1DF2817E0((_QWORD *)a1);
  v3 = ((v2 << 6) + (v2 >> 2) + sub_1DF281884((uint64_t)&v6, a1 + 64) + 2654435769u) ^ v2;
  v4 = (sub_1DF281884((uint64_t)&v7, a1 + 88) + (v3 << 6) + (v3 >> 2) + 2654435769u) ^ v3;
  return (*(int *)(a1 + 112) + (v4 << 6) + (v4 >> 2) + 2654435769u) ^ v4;
}

uint64_t sub_1DF28165C(uint64_t a1)
{
  int v2;
  void **v4;

  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  if (*(char *)(a1 + 87) < 0)
    operator delete(*(void **)(a1 + 64));
  *(_QWORD *)a1 = off_1EA982FB8;
  v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    v4 = (void **)(a1 + 40);
    sub_1DF28BFB0(&v4);
  }
  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return MEMORY[0x1E0BFC7D0](a1, 0x10B3C406F8632FBLL);
}

uint64_t sub_1DF28170C@<X0>(uint64_t result@<X0>, uint64_t **a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;

  v4 = *a2;
  v5 = a2[1];
  v11 = result;
  if (v4 == v5)
    goto LABEL_12;
  while (1)
  {
    result = sub_1DF2829EC(&v11, (uint64_t)v4);
    if ((result & 1) != 0)
      break;
    v4 += 2;
    if (v4 == v5)
    {
      v4 = v5;
      break;
    }
  }
  if (v4 == a2[1])
  {
LABEL_12:
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
  }
  else
  {
    v7 = ((char *)v4 - (char *)*a2) >> 4;
    result = *v4;
    if (*v4
      && (result = (uint64_t)__dynamic_cast((const void *)result, (const struct __class_type_info *)&unk_1EA982BA8, (const struct __class_type_info *)&unk_1EA982AB8, 0)) != 0)
    {
      v8 = v4[1];
      if (v8)
      {
        v9 = (unint64_t *)(v8 + 8);
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
      }
    }
    else
    {
      v8 = 0;
    }
    *a3 = v7;
    a3[1] = result;
    a3[2] = v8;
  }
  return result;
}

unint64_t sub_1DF2817E0(_QWORD *a1)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t v4;
  unsigned int v5;
  unint64_t v6;
  char v8;
  char v9;

  if (!a1)
    __cxa_bad_typeid();
  v2 = *(_QWORD *)(*(_QWORD *)(*a1 - 8) + 8);
  if ((v2 & 0x8000000000000000) != 0)
  {
    v3 = (unsigned __int8 *)(v2 & 0x7FFFFFFFFFFFFFFFLL);
    v4 = 5381;
    do
    {
      v2 = v4;
      v5 = *v3++;
      v4 = (33 * v4) ^ v5;
    }
    while (v5);
  }
  v6 = ((v2 << 6) + (v2 >> 2) + sub_1DF281884((uint64_t)&v8, (uint64_t)(a1 + 1)) + 2654435769u) ^ v2;
  return (sub_1DF281D2C((uint64_t)&v9, (uint64_t)(a1 + 4)) + (v6 << 6) + (v6 >> 2) + 2654435769u) ^ v6;
}

unint64_t sub_1DF281884(uint64_t a1, uint64_t a2)
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
  return sub_1DF2818C0((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t sub_1DF2818C0(uint64_t a1, uint64_t *a2, unint64_t a3)
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
      return sub_1DF281C6C(a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return sub_1DF281BC0(a2, a3);
  }
  else
  {
    return sub_1DF281AC8(a2, a3);
  }
}

unint64_t sub_1DF281AC8(_DWORD *a1, unint64_t a2)
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

unint64_t sub_1DF281BC0(_QWORD *a1, uint64_t a2)
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

unint64_t sub_1DF281C6C(_QWORD *a1, uint64_t a2)
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

unint64_t sub_1DF281D2C(uint64_t a1, uint64_t a2)
{
  unint64_t i;
  uint64_t v3;
  uint64_t v4;
  char v6;
  char v7;

  switch(*(_DWORD *)a2)
  {
    case 1:
      i = *(unsigned __int8 *)(a2 + 8);
      break;
    case 2:
      i = *(_QWORD *)(a2 + 8);
      break;
    case 3:
      i = sub_1DF281884((uint64_t)&v6, a2 + 8);
      break;
    case 4:
      v3 = *(_QWORD *)(a2 + 8);
      v4 = *(_QWORD *)(a2 + 16);
      for (i = 0xAAAAAAAAAAAAAAABLL * ((v4 - v3) >> 3); v3 != v4; v3 += 24)
        i ^= (i << 6) + (i >> 2) + sub_1DF281884((uint64_t)&v7, v3) + 2654435769u;
      break;
    default:
      i = 0xD7C06285B9DE677ALL;
      break;
  }
  return i;
}

uint64_t sub_1DF281E08(char **a1, __int128 *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  unint64_t *v20;
  unint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  __int128 v25;
  int64x2_t v26;
  char *v27;
  uint64_t v28;
  int64x2_t v29;
  char *v30;
  uint64_t v31;

  v6 = (unint64_t)a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    v12 = (v7 - *a1) >> 4;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60)
      sub_1DF271380();
    v14 = v5 - (_QWORD)*a1;
    if (v14 >> 3 > v13)
      v13 = v14 >> 3;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
      v15 = 0xFFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    v31 = result;
    v16 = (char *)sub_1DF271778(result, v15);
    v18 = &v16[16 * v12];
    v19 = *a2;
    *(_OWORD *)v18 = *a2;
    if (*((_QWORD *)&v19 + 1))
    {
      v20 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    v23 = *a1;
    v22 = a1[1];
    if (v22 == *a1)
    {
      v26 = vdupq_n_s64((unint64_t)v22);
      v24 = &v16[16 * v12];
    }
    else
    {
      v24 = &v16[16 * v12];
      do
      {
        v25 = *((_OWORD *)v22 - 1);
        v22 -= 16;
        *((_OWORD *)v24 - 1) = v25;
        v24 -= 16;
        *(_QWORD *)v22 = 0;
        *((_QWORD *)v22 + 1) = 0;
      }
      while (v22 != v23);
      v26 = *(int64x2_t *)a1;
    }
    v11 = v18 + 16;
    *a1 = v24;
    a1[1] = v18 + 16;
    v29 = v26;
    v27 = a1[2];
    a1[2] = &v16[16 * v17];
    v30 = v27;
    v28 = v26.i64[0];
    result = sub_1DF2820F0((uint64_t)&v28);
  }
  else
  {
    *(_QWORD *)v7 = *(_QWORD *)a2;
    v8 = *((_QWORD *)a2 + 1);
    *((_QWORD *)v7 + 1) = v8;
    if (v8)
    {
      v9 = (unint64_t *)(v8 + 8);
      do
        v10 = __ldxr(v9);
      while (__stxr(v10 + 1, v9));
    }
    v11 = v7 + 16;
  }
  a1[1] = v11;
  return result;
}

__n128 sub_1DF281F48(uint64_t a1, int *a2)
{
  int v4;
  __n128 result;
  int v6;
  int v7;
  _BYTE *v8;
  void **v9;

  v4 = *(_DWORD *)(a1 + 32);
  if (v4 == 4)
  {
    v9 = (void **)(a1 + 40);
    sub_1DF28BFB0(&v9);
  }
  else if (v4 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  v6 = *a2;
  *(_DWORD *)(a1 + 32) = *a2;
  v7 = v6 - 1;
  v8 = (_BYTE *)(a1 + 40);
  switch(v7)
  {
    case 0:
      *v8 = *((_BYTE *)a2 + 8);
      break;
    case 1:
      *(_QWORD *)v8 = *((_QWORD *)a2 + 1);
      break;
    case 2:
      result = *(__n128 *)(a2 + 2);
      *(_QWORD *)(a1 + 56) = *((_QWORD *)a2 + 3);
      *(__n128 *)v8 = result;
      *((_QWORD *)a2 + 2) = 0;
      *((_QWORD *)a2 + 3) = 0;
      *((_QWORD *)a2 + 1) = 0;
      break;
    case 3:
      *(_QWORD *)v8 = 0;
      *(_QWORD *)(a1 + 48) = 0;
      *(_QWORD *)(a1 + 56) = 0;
      result = *(__n128 *)(a2 + 2);
      *(__n128 *)(a1 + 40) = result;
      *(_QWORD *)(a1 + 56) = *((_QWORD *)a2 + 3);
      *((_QWORD *)a2 + 1) = 0;
      *((_QWORD *)a2 + 2) = 0;
      *((_QWORD *)a2 + 3) = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1DF28202C(uint64_t a1)
{
  void **v3;

  if (*(_DWORD *)a1 == 4)
  {
    v3 = (void **)(a1 + 8);
    sub_1DF28BFB0(&v3);
  }
  else if (*(_DWORD *)a1 == 3 && *(char *)(a1 + 31) < 0)
  {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

uint64_t sub_1DF28208C(uint64_t a1, __int128 *a2)
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

uint64_t sub_1DF2820F0(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 16;
    sub_1DF2717AC(i - 16);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_1DF28213C(uint64_t a1, std::string *__str, __int128 *a3, unint64_t a4)
{
  uint64_t v8;
  std::string *v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  std::string *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = a1 + 16;
  v9 = *(std::string **)a1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) < a4)
  {
    sub_1DF2822B0((uint64_t *)a1);
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      sub_1DF271380();
    v10 = 0x5555555555555556 * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3);
    if (v10 <= a4)
      v10 = a4;
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 3) >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v10;
    sub_1DF274E0C((_QWORD *)a1, v11);
    v12 = sub_1DF2822E8(v8, (__int128 *)__str, a3, *(char **)(a1 + 8));
    goto LABEL_11;
  }
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 3) < a4)
  {
    v13 = (std::string *)((char *)__str + 8 * ((uint64_t)(*(_QWORD *)(a1 + 8) - (_QWORD)v9) >> 3));
    sub_1DF28241C(__str, v13, v9);
    v12 = sub_1DF2822E8(v8, (__int128 *)v13, a3, *(char **)(a1 + 8));
LABEL_11:
    *(_QWORD *)(a1 + 8) = v12;
    return;
  }
  sub_1DF28241C(__str, (std::string *)a3, v9);
  v15 = v14;
  v16 = *(_QWORD *)(a1 + 8);
  if (v16 != v14)
  {
    do
    {
      if (*(char *)(v16 - 1) < 0)
        operator delete(*(void **)(v16 - 24));
      v16 -= 24;
    }
    while (v16 != v15);
  }
  *(_QWORD *)(a1 + 8) = v15;
}

void sub_1DF2822A0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1DF2822A8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1DF2822B0(uint64_t *a1)
{
  if (*a1)
  {
    sub_1DF282478(a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

char *sub_1DF2822E8(uint64_t a1, __int128 *a2, __int128 *a3, char *__dst)
{
  char *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  char *v11;
  char *v12;

  v4 = __dst;
  v11 = __dst;
  v12 = __dst;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_1DF279470(v4, *(void **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        *((_QWORD *)v4 + 2) = *((_QWORD *)v6 + 2);
        *(_OWORD *)v4 = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v4 += 24;
      v12 = v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  sub_1DF2823A4((uint64_t)v9);
  return v4;
}

void sub_1DF282390(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1DF2823A4((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF2823A4(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1DF2823D8(a1);
  return a1;
}

void sub_1DF2823D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0)
      operator delete(*(void **)(v1 - 24));
    v1 -= 24;
  }
}

std::string *sub_1DF28241C(std::string *__str, std::string *a2, std::string *this)
{
  const std::string *v4;

  v4 = __str;
  if (__str != a2)
  {
    do
      std::string::operator=(this++, v4++);
    while (v4 != a2);
    return a2;
  }
  return (std::string *)v4;
}

void sub_1DF282478(uint64_t *a1)
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

std::string *sub_1DF2824C4(uint64_t *a1, std::string *a2, std::string *a3, __int128 *a4, uint64_t a5)
{
  std::string *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  __int128 *v21;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;

  v5 = a2;
  if (a5 >= 1)
  {
    v11 = a1[2];
    v9 = (uint64_t)(a1 + 2);
    v10 = v11;
    v12 = *(_QWORD *)(v9 - 8);
    if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v12) >> 3)) >= a5)
    {
      v20 = v12 - (_QWORD)a2;
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - (_QWORD)a2) >> 3)) >= a5)
      {
        v21 = (__int128 *)&a3[a5];
      }
      else
      {
        v21 = (__int128 *)(&a3->__r_.__value_.__l.__data_ + ((uint64_t)(v12 - (_QWORD)a2) >> 3));
        a1[1] = (uint64_t)sub_1DF282830(v9, v21, a4, *(char **)(v9 - 8));
        if (v20 < 1)
          return v5;
      }
      sub_1DF282684((uint64_t)a1, (uint64_t)v5, v12, (uint64_t)&v5[a5]);
      sub_1DF28241C(a3, (std::string *)v21, v5);
    }
    else
    {
      v13 = *a1;
      v14 = a5 - 0x5555555555555555 * ((uint64_t)(v12 - *a1) >> 3);
      if (v14 > 0xAAAAAAAAAAAAAAALL)
        sub_1DF271380();
      v15 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a2 - v13) >> 3);
      v16 = 0xAAAAAAAAAAAAAAABLL * ((v10 - v13) >> 3);
      v17 = 2 * v16;
      if (2 * v16 <= v14)
        v17 = v14;
      if (v16 >= 0x555555555555555)
        v18 = 0xAAAAAAAAAAAAAAALL;
      else
        v18 = v17;
      v27 = v9;
      if (v18)
        v19 = (char *)sub_1DF274E5C(v9, v18);
      else
        v19 = 0;
      v23 = v19;
      v24 = &v19[24 * v15];
      v25 = v24;
      v26 = &v19[24 * v18];
      sub_1DF2826F0(&v23, (__int128 *)a3, a5);
      v5 = (std::string *)sub_1DF282780((uint64_t)a1, &v23, (__int128 *)v5);
      sub_1DF279684((uint64_t)&v23);
    }
  }
  return v5;
}

void sub_1DF282664(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DF282684(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  char v12;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = a2 + v6 - a4;
  v8 = v6;
  if (v7 < a3)
  {
    v9 = v7;
    v8 = *(_QWORD *)(a1 + 8);
    do
    {
      v10 = *(_OWORD *)v9;
      *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
      *(_OWORD *)v8 = v10;
      v8 += 24;
      *(_QWORD *)(v9 + 8) = 0;
      *(_QWORD *)(v9 + 16) = 0;
      *(_QWORD *)v9 = 0;
      v9 += 24;
    }
    while (v9 < a3);
  }
  *(_QWORD *)(a1 + 8) = v8;
  return sub_1DF2828EC((uint64_t)&v12, a2, v7, v6);
}

_QWORD *sub_1DF2826F0(_QWORD *result, __int128 *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v3 = result;
  v4 = result[2];
  if (a3)
  {
    v6 = v4 + 24 * a3;
    v7 = 24 * a3;
    do
    {
      if (*((char *)a2 + 23) < 0)
      {
        result = sub_1DF279470((_BYTE *)v4, *(void **)a2, *((_QWORD *)a2 + 1));
      }
      else
      {
        v8 = *a2;
        *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
        *(_OWORD *)v4 = v8;
      }
      v4 += 24;
      a2 = (__int128 *)((char *)a2 + 24);
      v7 -= 24;
    }
    while (v7);
    v4 = v6;
  }
  v3[2] = v4;
  return result;
}

void sub_1DF282778(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 16) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_1DF282780(uint64_t a1, _QWORD *a2, __int128 *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a2[1];
  v7 = a1 + 16;
  sub_1DF279570(a1 + 16, (uint64_t)a3, (uint64_t)a3, *(_QWORD *)a1, *(_QWORD *)a1, v6, v6);
  a2[1] = v8;
  a2[2] = sub_1DF282970(v7, a3, *(__int128 **)(a1 + 8), a2[2]);
  v9 = *(_QWORD *)a1;
  *(_QWORD *)a1 = a2[1];
  a2[1] = v9;
  v10 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = a2[2];
  a2[2] = v10;
  v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

char *sub_1DF282830(uint64_t a1, __int128 *a2, __int128 *a3, char *__dst)
{
  char *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  char *v11;
  char *v12;

  v4 = __dst;
  v11 = __dst;
  v12 = __dst;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_1DF279470(v4, *(void **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        *((_QWORD *)v4 + 2) = *((_QWORD *)v6 + 2);
        *(_OWORD *)v4 = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v4 += 24;
      v12 = v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  sub_1DF2823A4((uint64_t)v9);
  return v4;
}

void sub_1DF2828D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1DF2823A4((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF2828EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  if (a3 != a2)
  {
    v6 = a3;
    do
    {
      v7 = a4 - 24;
      if (*(char *)(a4 - 1) < 0)
        operator delete(*(void **)v7);
      v8 = *(_OWORD *)(v6 - 24);
      *(_QWORD *)(v7 + 16) = *(_QWORD *)(v6 - 8);
      *(_OWORD *)v7 = v8;
      *(_BYTE *)(v6 - 1) = 0;
      *(_BYTE *)(v6 - 24) = 0;
      a4 = v7;
      v6 -= 24;
    }
    while (v6 != a2);
  }
  return a3;
}

uint64_t sub_1DF282970(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  uint64_t v4;
  __int128 v5;
  _QWORD v7[3];
  char v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a4;
  v10 = a4;
  v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  v7[2] = &v10;
  if (a2 != a3)
  {
    do
    {
      v5 = *a2;
      *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
      *(_OWORD *)v4 = v5;
      v4 += 24;
      *((_QWORD *)a2 + 1) = 0;
      *((_QWORD *)a2 + 2) = 0;
      *(_QWORD *)a2 = 0;
      a2 = (__int128 *)((char *)a2 + 24);
    }
    while (a2 != a3);
    v10 = v4;
  }
  v8 = 1;
  sub_1DF2823A4((uint64_t)v7);
  return v4;
}

BOOL sub_1DF2829EC(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const void **v13;
  unsigned __int8 *v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  BOOL v21;
  _BOOL8 v22;
  unint64_t *v23;
  unint64_t v24;

  if (!*(_QWORD *)a2)
    return 0;
  v3 = *a1;
  v4 = __dynamic_cast(*(const void **)a2, (const struct __class_type_info *)&unk_1EA982BA8, (const struct __class_type_info *)&unk_1EA982AB8, 0);
  if (!v4)
    return 0;
  v5 = *(std::__shared_weak_count **)(a2 + 8);
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v8 = (*(uint64_t (**)(void *))(*(_QWORD *)v4 + 24))(v4);
  v9 = *(unsigned __int8 *)(v3 + 31);
  if ((v9 & 0x80u) == 0)
    v10 = *(unsigned __int8 *)(v3 + 31);
  else
    v10 = *(_QWORD *)(v3 + 16);
  v11 = *(unsigned __int8 *)(v8 + 23);
  v12 = (char)v11;
  if ((v11 & 0x80u) != 0)
    v11 = *(_QWORD *)(v8 + 8);
  if (v10 == v11)
  {
    v13 = (const void **)(v3 + 8);
    if (v12 >= 0)
      v14 = (unsigned __int8 *)v8;
    else
      v14 = *(unsigned __int8 **)v8;
    if ((v9 & 0x80) != 0)
    {
      v22 = memcmp(*v13, v14, *(_QWORD *)(v3 + 16)) == 0;
      goto LABEL_28;
    }
    if (*(_BYTE *)(v3 + 31))
    {
      v15 = v9 - 1;
      do
      {
        v17 = *(unsigned __int8 *)v13;
        v13 = (const void **)((char *)v13 + 1);
        v16 = v17;
        v19 = *v14++;
        v18 = v19;
        v21 = v15-- != 0;
        v22 = v16 == v18;
      }
      while (v16 == v18 && v21);
LABEL_28:
      if (!v5)
        return v22;
      goto LABEL_29;
    }
    v22 = 1;
    if (!v5)
      return v22;
  }
  else
  {
    v22 = 0;
    if (!v5)
      return v22;
  }
LABEL_29:
  v23 = (unint64_t *)&v5->__shared_owners_;
  do
    v24 = __ldaxr(v23);
  while (__stlxr(v24 - 1, v23));
  if (!v24)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  return v22;
}

void sub_1DF282B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1DF2717AC((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF282B54(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1DF282C0C((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *sub_1DF282BC8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x222222222222223)
    sub_1DF270E9C();
  return operator new(120 * a2);
}

uint64_t sub_1DF282C0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
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
      v9 -= 120;
      sub_1DF280DE8(v7 - 120, v9);
      v7 = *((_QWORD *)&v15 + 1) - 120;
      *((_QWORD *)&v15 + 1) -= 120;
    }
    while (v9 != a5);
    v10 = v15;
  }
  v13 = 1;
  sub_1DF282CB0((uint64_t)v12);
  return v10;
}

uint64_t sub_1DF282CB0(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1DF282CE4((uint64_t *)a1);
  return a1;
}

void sub_1DF282CE4(uint64_t *a1)
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
      sub_1DF282D34(v3, v1);
      v1 += 120;
    }
    while (v1 != v2);
  }
}

void sub_1DF282D34(uint64_t a1, uint64_t a2)
{
  int v3;
  void **v4;

  if (*(char *)(a2 + 111) < 0)
    operator delete(*(void **)(a2 + 88));
  if (*(char *)(a2 + 87) < 0)
    operator delete(*(void **)(a2 + 64));
  *(_QWORD *)a2 = off_1EA982FB8;
  v3 = *(_DWORD *)(a2 + 32);
  if (v3 == 4)
  {
    v4 = (void **)(a2 + 40);
    sub_1DF28BFB0(&v4);
  }
  else if (v3 == 3 && *(char *)(a2 + 63) < 0)
  {
    operator delete(*(void **)(a2 + 40));
  }
  if (*(char *)(a2 + 31) < 0)
    operator delete(*(void **)(a2 + 8));
}

void **sub_1DF282DCC(void **a1)
{
  sub_1DF282DFC(a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void sub_1DF282DFC(_QWORD *a1)
{
  uint64_t i;
  uint64_t v2;
  uint64_t v4;

  v2 = a1[1];
  for (i = a1[2]; i != v2; i = a1[2])
  {
    v4 = a1[4];
    a1[2] = i - 120;
    sub_1DF282D34(v4, i - 120);
  }
}

uint64_t sub_1DF282E40(uint64_t a1, __int128 *a2, __int128 *a3, int a4, uint64_t a5)
{
  uint64_t v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  void **v15;
  void *v16;
  char v17;
  int v18;
  void *__p[2];
  uint64_t v20;
  void *__dst[2];
  uint64_t v22;
  void **v23;

  if (*((char *)a3 + 23) < 0)
    v10 = *((_QWORD *)a3 + 1);
  else
    v10 = *((unsigned __int8 *)a3 + 23);
  if (v10)
    v11 = a3;
  else
    v11 = a2;
  if (*((char *)v11 + 23) < 0)
  {
    sub_1DF279470(__dst, *(void **)v11, *((_QWORD *)v11 + 1));
  }
  else
  {
    *(_OWORD *)__dst = *v11;
    v22 = *((_QWORD *)v11 + 2);
  }
  v18 = *(_DWORD *)a5;
  switch(v18)
  {
    case 1:
      LOBYTE(__p[0]) = *(_BYTE *)(a5 + 8);
      break;
    case 2:
      __p[0] = *(void **)(a5 + 8);
      break;
    case 3:
      *(_OWORD *)__p = *(_OWORD *)(a5 + 8);
      v20 = *(_QWORD *)(a5 + 24);
      goto LABEL_15;
    case 4:
      *(_OWORD *)__p = *(_OWORD *)(a5 + 8);
      v20 = *(_QWORD *)(a5 + 24);
LABEL_15:
      *(_QWORD *)(a5 + 16) = 0;
      *(_QWORD *)(a5 + 24) = 0;
      *(_QWORD *)(a5 + 8) = 0;
      break;
    default:
      break;
  }
  sub_1DF283088(a1, (__n128 *)__dst, &v18);
  if (v18 == 4)
  {
    v15 = __p;
    sub_1DF28BFB0(&v15);
  }
  else if (v18 == 3 && SHIBYTE(v20) < 0)
  {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v22) < 0)
    operator delete(__dst[0]);
  *(_QWORD *)a1 = off_1EA9831D0;
  v12 = *a2;
  *(_QWORD *)(a1 + 80) = *((_QWORD *)a2 + 2);
  *(_OWORD *)(a1 + 64) = v12;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  v13 = *a3;
  *(_QWORD *)(a1 + 104) = *((_QWORD *)a3 + 2);
  *(_OWORD *)(a1 + 88) = v13;
  *((_QWORD *)a3 + 1) = 0;
  *((_QWORD *)a3 + 2) = 0;
  *(_QWORD *)a3 = 0;
  *(_DWORD *)(a1 + 112) = a4;
  if (a4)
  {
    if (*(_DWORD *)a5 == 1)
    {
      sub_1DF270BD4((int *)a5, 1u);
      if (!*(_BYTE *)(a5 + 8))
      {
        LODWORD(v15) = 0;
        sub_1DF281F48(a1, (int *)&v15);
        if ((_DWORD)v15 == 4)
        {
          v23 = &v16;
          sub_1DF28BFB0(&v23);
        }
        else if ((_DWORD)v15 == 3 && v17 < 0)
        {
          operator delete(v16);
        }
      }
    }
  }
  return a1;
}

void sub_1DF283054(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void **v3;

  if (*(char *)(v1 + 111) < 0)
    operator delete(*v3);
  if (*(char *)(v1 + 87) < 0)
    operator delete(*v2);
  sub_1DF283134(v1);
  _Unwind_Resume(a1);
}

__n128 sub_1DF283088(uint64_t a1, __n128 *a2, int *a3)
{
  __n128 result;
  int v4;
  int v5;
  _BYTE *v6;

  *(_QWORD *)a1 = off_1EA982FB8;
  result = *a2;
  *(_QWORD *)(a1 + 24) = a2[1].n128_u64[0];
  *(__n128 *)(a1 + 8) = result;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  a2->n128_u64[0] = 0;
  v4 = *a3;
  *(_DWORD *)(a1 + 32) = *a3;
  v5 = v4 - 1;
  v6 = (_BYTE *)(a1 + 40);
  switch(v5)
  {
    case 0:
      *v6 = *((_BYTE *)a3 + 8);
      break;
    case 1:
      *(_QWORD *)v6 = *((_QWORD *)a3 + 1);
      break;
    case 2:
      result = *(__n128 *)(a3 + 2);
      *(_QWORD *)(a1 + 56) = *((_QWORD *)a3 + 3);
      *(__n128 *)v6 = result;
      *((_QWORD *)a3 + 2) = 0;
      *((_QWORD *)a3 + 3) = 0;
      *((_QWORD *)a3 + 1) = 0;
      break;
    case 3:
      *(_QWORD *)v6 = 0;
      *(_QWORD *)(a1 + 48) = 0;
      *(_QWORD *)(a1 + 56) = 0;
      result = *(__n128 *)(a3 + 2);
      *(__n128 *)(a1 + 40) = result;
      *(_QWORD *)(a1 + 56) = *((_QWORD *)a3 + 3);
      *((_QWORD *)a3 + 1) = 0;
      *((_QWORD *)a3 + 2) = 0;
      *((_QWORD *)a3 + 3) = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1DF283134(uint64_t a1)
{
  int v2;
  void **v4;

  *(_QWORD *)a1 = off_1EA982FB8;
  v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    v4 = (void **)(a1 + 40);
    sub_1DF28BFB0(&v4);
  }
  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

void sub_1DF2831B0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  _QWORD v11[3];
  int v12;
  void *__p[2];
  _BYTE v14[25];
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  _BYTE v23[32];
  void *v24;
  void *v25;
  __int128 *v26;
  __int128 *v27;
  uint64_t v28;
  __int128 **v29;

  v4 = atomic_load((unsigned __int8 *)&qword_1F0474018);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_1F0474018))
  {
    sub_1DF27D888((const std::locale *)&unk_1F0473FD8, "(?:\\s*)([\\[\\]\\(\\)\\|]|\\.\\.\\.)", 0);
    __cxa_atexit((void (*)(void *))sub_1DF272AAC, &unk_1F0473FD8, &dword_1DF26E000);
    __cxa_guard_release(&qword_1F0474018);
  }
  v5 = atomic_load((unsigned __int8 *)&qword_1F0474060);
  if ((v5 & 1) == 0 && __cxa_guard_acquire(&qword_1F0474060))
  {
    sub_1DF27D888((const std::locale *)&unk_1F0474020, "(?:\\s*)(\\S*<.*?>|[^<>\\s]+)", 0);
    __cxa_atexit((void (*)(void *))sub_1DF272AAC, &unk_1F0474020, &dword_1DF26E000);
    __cxa_guard_release(&qword_1F0474060);
  }
  v26 = 0;
  v27 = 0;
  v28 = 0;
  v6 = *(unsigned __int8 *)(a1 + 23);
  if ((v6 & 0x80u) == 0)
    v7 = a1;
  else
    v7 = *(_QWORD *)a1;
  if ((v6 & 0x80u) != 0)
    v6 = *(_QWORD *)(a1 + 8);
  sub_1DF27D788((uint64_t)v23, v7, v7 + v6, (uint64_t)&unk_1F0473FD8, 0);
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  *(_OWORD *)__p = 0u;
  memset(v14, 0, sizeof(v14));
  memset(v11, 0, sizeof(v11));
  v12 = 0;
  sub_1DF283944((uint64_t)v23, (uint64_t)v11, (uint64_t *)&v26);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v24)
  {
    v25 = v24;
    operator delete(v24);
  }
  v9 = 0uLL;
  v10 = 0;
  sub_1DF28BF2C((char *)&v9, v26, v27, 0xAAAAAAAAAAAAAAABLL * (((char *)v27 - (char *)v26) >> 3));
  *(_OWORD *)a2 = v9;
  v8 = v10;
  v10 = 0;
  v9 = 0uLL;
  *(_QWORD *)(a2 + 16) = v8;
  *(_QWORD *)(a2 + 24) = 0;
  *(_BYTE *)(a2 + 32) = 0;
  v29 = (__int128 **)&v9;
  sub_1DF28BFB0((void ***)&v29);
  v29 = &v26;
  sub_1DF28BFB0((void ***)&v29);
}

void sub_1DF2833A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36)
{
  __cxa_guard_abort(&qword_1F0474060);
  _Unwind_Resume(a1);
}

void sub_1DF28340C(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  _QWORD *v15;
  char *v16;
  __int128 v17;
  int64x2_t v18;
  _OWORD *v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  _QWORD *v31;
  _QWORD *v32;
  char *v33;
  __int128 v34;
  int64x2_t v35;
  uint64_t v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  unint64_t *p_shared_owners;
  unint64_t v43;
  unint64_t v44;
  __n128 __p;
  char v46;
  int64x2_t v47;
  _QWORD v48[2];
  __int128 v49;
  uint64_t v50;
  _BYTE v51[24];
  uint64_t v52;
  _QWORD *v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  sub_1DF283E20(a1, a2, (uint64_t)&v49);
  v6 = sub_1DF284C60(a1);
  v7 = *((char *)v6 + 23);
  if (v7 < 0)
  {
    if (v6[1] != 1)
    {
LABEL_8:
      *(_OWORD *)a3 = v49;
      *(_QWORD *)(a3 + 16) = v50;
      v50 = 0;
      v49 = 0uLL;
      goto LABEL_56;
    }
    v6 = (uint64_t *)*v6;
  }
  else if (v7 != 1)
  {
    goto LABEL_8;
  }
  if (*(_BYTE *)v6 != 124)
    goto LABEL_8;
  v47 = 0uLL;
  v48[0] = 0;
  sub_1DF284D0C(&v49, &v54);
  v8 = (v47.i64[1] - v47.i64[0]) >> 4;
  if ((unint64_t)(v8 + 1) >> 60)
    sub_1DF271380();
  v9 = (v48[0] - v47.i64[0]) >> 3;
  if (v9 <= v8 + 1)
    v9 = v8 + 1;
  if (v48[0] - v47.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL)
    v10 = 0xFFFFFFFFFFFFFFFLL;
  else
    v10 = v9;
  v53 = v48;
  v11 = (char *)sub_1DF271778((uint64_t)v48, v10);
  v13 = &v11[16 * v8];
  *(_OWORD *)v13 = v54;
  v14 = (_QWORD *)v47.i64[1];
  v15 = (_QWORD *)v47.i64[0];
  if (v47.i64[1] == v47.i64[0])
  {
    v18 = vdupq_n_s64(v47.u64[1]);
    v16 = &v11[16 * v8];
  }
  else
  {
    v16 = &v11[16 * v8];
    do
    {
      v17 = *((_OWORD *)v14 - 1);
      v14 -= 2;
      *((_OWORD *)v16 - 1) = v17;
      v16 -= 16;
      *v14 = 0;
      v14[1] = 0;
    }
    while (v14 != v15);
    v18 = v47;
  }
  v19 = v13 + 16;
  v47.i64[0] = (uint64_t)v16;
  *(int64x2_t *)&v51[8] = v18;
  v20 = v48[0];
  v48[0] = &v11[16 * v12];
  v52 = v20;
  *(_QWORD *)v51 = v18.i64[0];
  sub_1DF2820F0((uint64_t)v51);
  for (v47.i64[1] = (uint64_t)v19; ; v47.i64[1] = (uint64_t)v24)
  {
    v21 = sub_1DF284C60(a1);
    v22 = *((char *)v21 + 23);
    if (v22 < 0)
    {
      if (v21[1] != 1)
        break;
      v21 = (uint64_t *)*v21;
    }
    else if (v22 != 1)
    {
      break;
    }
    if (*(_BYTE *)v21 != 124)
      break;
    sub_1DF284D68(a1, &__p);
    if (v46 < 0)
      operator delete((void *)__p.n128_u64[0]);
    sub_1DF283E20(a1, a2, (uint64_t)v51);
    sub_1DF271914((void **)&v49);
    v49 = *(_OWORD *)v51;
    v50 = *(_QWORD *)&v51[16];
    memset(v51, 0, sizeof(v51));
    *(_QWORD *)&v54 = v51;
    sub_1DF271804((void ***)&v54);
    sub_1DF284D0C(&v49, &v54);
    v23 = v47.i64[1];
    if (v47.i64[1] >= v48[0])
    {
      v25 = (v47.i64[1] - v47.i64[0]) >> 4;
      if ((unint64_t)(v25 + 1) >> 60)
        sub_1DF271380();
      v26 = (v48[0] - v47.i64[0]) >> 3;
      if (v26 <= v25 + 1)
        v26 = v25 + 1;
      if (v48[0] - v47.i64[0] >= 0x7FFFFFFFFFFFFFF0uLL)
        v27 = 0xFFFFFFFFFFFFFFFLL;
      else
        v27 = v26;
      v53 = v48;
      v28 = (char *)sub_1DF271778((uint64_t)v48, v27);
      v30 = &v28[16 * v25];
      *(_OWORD *)v30 = v54;
      v31 = (_QWORD *)v47.i64[1];
      v32 = (_QWORD *)v47.i64[0];
      if (v47.i64[1] == v47.i64[0])
      {
        v35 = vdupq_n_s64(v47.u64[1]);
        v33 = &v28[16 * v25];
      }
      else
      {
        v33 = &v28[16 * v25];
        do
        {
          v34 = *((_OWORD *)v31 - 1);
          v31 -= 2;
          *((_OWORD *)v33 - 1) = v34;
          v33 -= 16;
          *v31 = 0;
          v31[1] = 0;
        }
        while (v31 != v32);
        v35 = v47;
      }
      v24 = v30 + 16;
      v47.i64[0] = (uint64_t)v33;
      v47.i64[1] = (uint64_t)(v30 + 16);
      *(int64x2_t *)&v51[8] = v35;
      v36 = v48[0];
      v48[0] = &v28[16 * v29];
      v52 = v36;
      *(_QWORD *)v51 = v35.i64[0];
      sub_1DF2820F0((uint64_t)v51);
    }
    else
    {
      *(_OWORD *)v47.i64[1] = v54;
      v24 = (_OWORD *)(v23 + 16);
    }
  }
  v37 = v47.i64[0];
  if (v47.i64[1] - v47.i64[0] == 16)
  {
    v39 = *(_QWORD *)v47.i64[0];
    v38 = *(std::__shared_weak_count **)(v47.i64[0] + 8);
    *(_QWORD *)&v54 = *(_QWORD *)v47.i64[0];
    *((_QWORD *)&v54 + 1) = v38;
    *(_QWORD *)v47.i64[0] = 0;
    *(_QWORD *)(v37 + 8) = 0;
  }
  else
  {
    sub_1DF288E94((__int128 *)v47.i8, v51);
    v38 = *(std::__shared_weak_count **)&v51[8];
    v39 = *(_QWORD *)v51;
    v54 = *(_OWORD *)v51;
  }
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)v51 = a3;
  v51[8] = 0;
  v40 = operator new(0x10uLL);
  *(_QWORD *)a3 = v40;
  *(_QWORD *)(a3 + 8) = v40;
  v41 = v40 + 2;
  *(_QWORD *)(a3 + 16) = v40 + 2;
  *v40 = v39;
  v40[1] = v38;
  if (v38)
  {
    p_shared_owners = (unint64_t *)&v38->__shared_owners_;
    do
      v43 = __ldxr(p_shared_owners);
    while (__stxr(v43 + 1, p_shared_owners));
    *(_QWORD *)(a3 + 8) = v41;
    do
      v44 = __ldaxr(p_shared_owners);
    while (__stlxr(v44 - 1, p_shared_owners));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  else
  {
    *(_QWORD *)(a3 + 8) = v41;
  }
  *(_QWORD *)v51 = &v47;
  sub_1DF271804((void ***)v51);
LABEL_56:
  *(_QWORD *)v51 = &v49;
  sub_1DF271804((void ***)v51);
}

void sub_1DF28381C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  uint64_t v17;

  *(_QWORD *)(v17 - 112) = &a13;
  sub_1DF271804((void ***)(v17 - 112));
  a13 = (void **)&a17;
  sub_1DF271804(&a13);
  _Unwind_Resume(a1);
}

void sub_1DF283890(_QWORD *a1@<X0>, std::string *a2@<X8>)
{
  unint64_t v3;
  char *v4;
  char *v5;
  void *__p[2];
  char v7;

  v3 = a1[3];
  v4 = (char *)a1[1];
  if (v3 >= 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v4[-*a1] >> 3))
  {
    a2->__r_.__value_.__r.__words[0] = 0;
    a2->__r_.__value_.__l.__size_ = 0;
    a2->__r_.__value_.__r.__words[2] = 0;
  }
  else
  {
    v5 = (char *)(*a1 + 24 * v3);
    sub_1DF28BE7C(__p, " ");
    sub_1DF2708B8(v5, v4, (uint64_t)__p, a2);
    if (v7 < 0)
      operator delete(__p[0]);
  }
}

void sub_1DF283928(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_1DF283944(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v7;

  v3 = a3;
  v7 = a3;
  if (!sub_1DF27B404(a1, a2))
  {
    do
    {
      sub_1DF2839B4(&v7, (uint64_t *)(a1 + 32));
      sub_1DF27B244(a1);
    }
    while (!sub_1DF27B404(a1, a2));
    return v7;
  }
  return v3;
}

void sub_1DF2839B4(uint64_t **a1, uint64_t *a2)
{
  unint64_t v4;
  BOOL v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  int v20;
  void *v21[2];
  uint64_t v22;
  _QWORD v23[3];
  int v24;
  void *__p[2];
  _BYTE v26[25];
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  _BYTE v35[32];
  void *v36;
  void *v37;
  _QWORD v38[5];

  if (*((_BYTE *)a2 + 64))
  {
    sub_1DF27D788((uint64_t)v35, a2[6], a2[7], (uint64_t)&unk_1F0474020, 0);
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    *(_OWORD *)__p = 0u;
    memset(v26, 0, sizeof(v26));
    memset(v23, 0, sizeof(v23));
    v24 = 0;
    sub_1DF283C08((uint64_t)v35, (uint64_t)v23, *a1);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v36)
    {
      v37 = v36;
      operator delete(v36);
    }
  }
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3);
  v5 = v4 > 1;
  if (v4 <= 1)
    v6 = a2;
  else
    v6 = (uint64_t *)*a2;
  if (v5)
    v7 = *a2 + 24;
  else
    v7 = (uint64_t)(a2 + 3);
  if (*(_BYTE *)(v7 + 16))
  {
    v8 = *a1;
    sub_1DF277D38(v21, (char *)v6[3], *(char **)(v7 + 8), *(_QWORD *)(v7 + 8) - v6[3]);
    v9 = v8[1];
    v10 = v8[2];
    if (v9 >= v10)
    {
      v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - *v8) >> 3);
      v13 = v12 + 1;
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
        sub_1DF271380();
      v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - *v8) >> 3);
      if (2 * v14 > v13)
        v13 = 2 * v14;
      if (v14 >= 0x555555555555555)
        v15 = 0xAAAAAAAAAAAAAAALL;
      else
        v15 = v13;
      v38[4] = v8 + 2;
      if (v15)
        v16 = (char *)sub_1DF274E5C((uint64_t)(v8 + 2), v15);
      else
        v16 = 0;
      v17 = &v16[24 * v12];
      v38[0] = v16;
      v38[1] = v17;
      v38[3] = &v16[24 * v15];
      v18 = *(_OWORD *)v21;
      *((_QWORD *)v17 + 2) = v22;
      *(_OWORD *)v17 = v18;
      v21[1] = 0;
      v22 = 0;
      v21[0] = 0;
      v38[2] = v17 + 24;
      sub_1DF2794FC(v8, v38);
      v19 = v8[1];
      sub_1DF279684((uint64_t)v38);
      v20 = SHIBYTE(v22);
      v8[1] = v19;
      if (v20 < 0)
        operator delete(v21[0]);
    }
    else
    {
      v11 = *(_OWORD *)v21;
      *(_QWORD *)(v9 + 16) = v22;
      *(_OWORD *)v9 = v11;
      v8[1] = v9 + 24;
    }
  }
}

void sub_1DF283BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  uint64_t v38;

  sub_1DF279684(v38 - 72);
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t *sub_1DF283C08(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v7;

  v3 = a3;
  v7 = a3;
  if (!sub_1DF27B404(a1, a2))
  {
    do
    {
      sub_1DF283C78(&v7, (_QWORD *)(a1 + 32));
      sub_1DF27B244(a1);
    }
    while (!sub_1DF27B404(a1, a2));
    return v7;
  }
  return v3;
}

void sub_1DF283C78(uint64_t **a1, _QWORD *a2)
{
  uint64_t *v2;
  unint64_t v3;
  BOOL v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  __int128 v16;
  uint64_t v17;
  int v18;
  void *__p[2];
  uint64_t v20;
  _QWORD v21[5];

  v2 = *a1;
  v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2[1] - *a2) >> 3);
  v4 = v3 > 1;
  if (v3 <= 1)
    v5 = a2;
  else
    v5 = (_QWORD *)*a2;
  if (v4)
    v6 = *a2 + 24;
  else
    v6 = (uint64_t)(a2 + 3);
  if (*(_BYTE *)(v6 + 16))
  {
    sub_1DF277D38(__p, (char *)v5[3], *(char **)(v6 + 8), *(_QWORD *)(v6 + 8) - v5[3]);
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v20 = 0;
  }
  v7 = v2[2];
  v8 = v2[1];
  if (v8 >= v7)
  {
    v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - *v2) >> 3);
    v11 = v10 + 1;
    if (v10 + 1 > 0xAAAAAAAAAAAAAAALL)
      sub_1DF271380();
    v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - *v2) >> 3);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0x555555555555555)
      v13 = 0xAAAAAAAAAAAAAAALL;
    else
      v13 = v11;
    v21[4] = v2 + 2;
    if (v13)
      v14 = (char *)sub_1DF274E5C((uint64_t)(v2 + 2), v13);
    else
      v14 = 0;
    v15 = &v14[24 * v10];
    v21[0] = v14;
    v21[1] = v15;
    v21[3] = &v14[24 * v13];
    v16 = *(_OWORD *)__p;
    *((_QWORD *)v15 + 2) = v20;
    *(_OWORD *)v15 = v16;
    __p[1] = 0;
    v20 = 0;
    __p[0] = 0;
    v21[2] = v15 + 24;
    sub_1DF2794FC(v2, v21);
    v17 = v2[1];
    sub_1DF279684((uint64_t)v21);
    v18 = SHIBYTE(v20);
    v2[1] = v17;
    if (v18 < 0)
      operator delete(__p[0]);
  }
  else
  {
    v9 = *(_OWORD *)__p;
    *(_QWORD *)(v8 + 16) = v20;
    *(_OWORD *)v8 = v9;
    v2[1] = v8 + 24;
  }
}

void sub_1DF283DF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  sub_1DF279684((uint64_t)&a15);
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_1DF283E20(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t *v7;
  int v8;
  int v9;
  int v10;
  uint64_t *v11;
  uint64_t *v12;
  int v13;
  int *v14;
  uint64_t v15;
  int v16;
  int v17;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  int v23;
  int v24;
  unsigned __int16 *v25;
  int v26;
  __n128 v27;
  __n128 *v28;
  _BOOL4 v29;
  unsigned __int16 *v30;
  __n128 v31;
  __n128 *v32;
  uint64_t v33;
  _BOOL4 v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  _QWORD *v42;
  _QWORD *v43;
  char *v44;
  __int128 v45;
  int64x2_t v46;
  void ***p_p;
  _OWORD *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  _QWORD *v56;
  _QWORD *v57;
  char *v58;
  __int128 v59;
  int64x2_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  _QWORD *v68;
  _QWORD *v69;
  char *v70;
  __int128 v71;
  int64x2_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  char *v76;
  unsigned int v77;
  _OWORD *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  uint64_t v85;
  char *v86;
  _QWORD *v87;
  _QWORD *v88;
  char *v89;
  __int128 v90;
  int64x2_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  char *v98;
  _QWORD *v99;
  _QWORD *v100;
  char *v101;
  __int128 v102;
  int64x2_t v103;
  _OWORD *v104;
  uint64_t v105;
  std::__shared_weak_count *v106;
  unint64_t *v107;
  unint64_t v108;
  _OWORD *v109;
  uint64_t v110;
  unint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  _OWORD *v114;
  uint64_t v115;
  std::__shared_weak_count *v116;
  unint64_t *v117;
  unint64_t v118;
  _OWORD *v119;
  uint64_t v120;
  unint64_t *v121;
  uint64_t *v122;
  int v123;
  uint64_t v125;
  uint64_t i;
  unint64_t v127;
  __n128 *v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  unint64_t v132;
  char *v133;
  uint64_t v134;
  __n128 *v135;
  _QWORD *v136;
  _QWORD *v137;
  char *v138;
  __int128 v139;
  int64x2_t v140;
  __n128 *v141;
  uint64_t v142;
  std::__shared_weak_count *v143;
  unint64_t *p_shared_owners;
  unint64_t v145;
  std::runtime_error *v146;
  std::runtime_error *exception;
  uint64_t v148;
  __n128 v149;
  char v150;
  __int128 v151;
  _QWORD v152[2];
  __int128 v153;
  __n128 v154;
  char v155;
  __int128 v156[2];
  __n128 __p;
  char v158;
  _BYTE __s1[24];
  uint64_t v160;
  _QWORD *v161;

  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  if (a1[3] < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 3))
  {
    v148 = a3 + 16;
    v6 = MEMORY[0x1E0C80978];
    do
    {
      v7 = sub_1DF284C60(a1);
      v8 = *((char *)v7 + 23);
      if (v8 < 0)
      {
        if (v7[1] != 1)
          goto LABEL_13;
        v10 = *(unsigned __int8 *)*v7;
        if (v10 == 41 || v10 == 93)
          return;
        v9 = *(unsigned __int8 *)*v7;
      }
      else
      {
        if (v8 != 1)
          goto LABEL_13;
        v9 = *(unsigned __int8 *)v7;
        if (v9 == 41 || v9 == 93)
          return;
      }
      if (v9 == 124)
        return;
LABEL_13:
      v11 = sub_1DF284C60(a1);
      v12 = v11;
      v152[0] = 0;
      v151 = 0uLL;
      v13 = *((unsigned __int8 *)v11 + 23);
      if ((v13 & 0x80) != 0)
      {
        v15 = v11[1];
        if (v15 == 1)
        {
          v26 = *(unsigned __int8 *)*v11;
          if (v26 == 40)
          {
LABEL_57:
            v31 = sub_1DF284D68(a1, &__p);
            if (v158 < 0)
              operator delete((void *)__p.n128_u64[0]);
            sub_1DF28340C(v156, a1, a2, v31);
            sub_1DF284D68(a1, &v154);
            if (v155 < 0)
            {
              if (v154.n128_u64[1] != 1)
                goto LABEL_222;
              v32 = (__n128 *)v154.n128_u64[0];
            }
            else
            {
              if (v155 != 1)
                goto LABEL_222;
              v32 = &v154;
            }
            if (v32->n128_u8[0] != 41)
            {
LABEL_222:
              exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::runtime_error::runtime_error(exception, "Mismatched '('");
              exception->__vftable = (std::runtime_error_vtbl *)&unk_1EA983148;
              __cxa_throw(exception, (struct type_info *)&unk_1EA982B48, (void (*)(void *))std::runtime_error::~runtime_error);
            }
            sub_1DF286B78(v156, &v153);
            v48 = (_OWORD *)*((_QWORD *)&v151 + 1);
            if (*((_QWORD *)&v151 + 1) < v152[0])
              goto LABEL_102;
            v61 = (uint64_t)(*((_QWORD *)&v151 + 1) - v151) >> 4;
            v62 = v61 + 1;
            if ((unint64_t)(v61 + 1) >> 60)
              sub_1DF271380();
            v63 = v152[0] - v151;
            if ((uint64_t)(v152[0] - v151) >> 3 > v62)
              v62 = v63 >> 3;
            if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF0)
              v64 = 0xFFFFFFFFFFFFFFFLL;
            else
              v64 = v62;
            v161 = v152;
            v65 = (char *)sub_1DF271778((uint64_t)v152, v64);
            v67 = &v65[16 * v61];
            *(_OWORD *)v67 = v153;
            v153 = 0uLL;
            v68 = (_QWORD *)*((_QWORD *)&v151 + 1);
            v69 = (_QWORD *)v151;
            if (*((_QWORD *)&v151 + 1) == (_QWORD)v151)
            {
              v72 = vdupq_n_s64(*((unint64_t *)&v151 + 1));
              v70 = &v65[16 * v61];
            }
            else
            {
              v70 = &v65[16 * v61];
              do
              {
                v71 = *((_OWORD *)v68 - 1);
                v68 -= 2;
                *((_OWORD *)v70 - 1) = v71;
                v70 -= 16;
                *v68 = 0;
                v68[1] = 0;
              }
              while (v68 != v69);
              v72 = (int64x2_t)v151;
            }
            v119 = v67 + 16;
            *(_QWORD *)&v151 = v70;
            *((_QWORD *)&v151 + 1) = v67 + 16;
            *(int64x2_t *)&__s1[8] = v72;
            v120 = v152[0];
            v152[0] = &v65[16 * v66];
            v160 = v120;
            *(_QWORD *)__s1 = v72.i64[0];
            sub_1DF2820F0((uint64_t)__s1);
            v116 = (std::__shared_weak_count *)*((_QWORD *)&v153 + 1);
            *((_QWORD *)&v151 + 1) = v119;
            if (*((_QWORD *)&v153 + 1))
            {
              v121 = (unint64_t *)(*((_QWORD *)&v153 + 1) + 8);
              do
                v118 = __ldaxr(v121);
              while (__stlxr(v118 - 1, v121));
              goto LABEL_181;
            }
LABEL_183:
            if (v155 < 0)
              operator delete((void *)v154.n128_u64[0]);
            *(_QWORD *)__s1 = v156;
            p_p = (void ***)__s1;
            goto LABEL_186;
          }
          if (v26 == 91)
            goto LABEL_39;
        }
        if (v15 != 7)
          goto LABEL_31;
        v14 = (int *)*v11;
      }
      else
      {
        if (v13 == 1)
        {
          v23 = *(unsigned __int8 *)v11;
          if (v23 == 40)
            goto LABEL_57;
          if (v23 == 91)
          {
LABEL_39:
            v27 = sub_1DF284D68(a1, &__p);
            if (v158 < 0)
              operator delete((void *)__p.n128_u64[0]);
            sub_1DF28340C(v156, a1, a2, v27);
            sub_1DF284D68(a1, &v154);
            if (v155 < 0)
            {
              if (v154.n128_u64[1] != 1)
                goto LABEL_221;
              v28 = (__n128 *)v154.n128_u64[0];
            }
            else
            {
              if (v155 != 1)
                goto LABEL_221;
              v28 = &v154;
            }
            if (v28->n128_u8[0] != 93)
            {
LABEL_221:
              v146 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::runtime_error::runtime_error(v146, "Mismatched '['");
              v146->__vftable = (std::runtime_error_vtbl *)&unk_1EA983148;
              __cxa_throw(v146, (struct type_info *)&unk_1EA982B48, (void (*)(void *))std::runtime_error::~runtime_error);
            }
            sub_1DF2869A4(v156, &v153);
            v48 = (_OWORD *)*((_QWORD *)&v151 + 1);
            if (*((_QWORD *)&v151 + 1) >= v152[0])
            {
              v49 = (uint64_t)(*((_QWORD *)&v151 + 1) - v151) >> 4;
              v50 = v49 + 1;
              if ((unint64_t)(v49 + 1) >> 60)
                sub_1DF271380();
              v51 = v152[0] - v151;
              if ((uint64_t)(v152[0] - v151) >> 3 > v50)
                v50 = v51 >> 3;
              if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0)
                v52 = 0xFFFFFFFFFFFFFFFLL;
              else
                v52 = v50;
              v161 = v152;
              v53 = (char *)sub_1DF271778((uint64_t)v152, v52);
              v55 = &v53[16 * v49];
              *(_OWORD *)v55 = v153;
              v153 = 0uLL;
              v56 = (_QWORD *)*((_QWORD *)&v151 + 1);
              v57 = (_QWORD *)v151;
              if (*((_QWORD *)&v151 + 1) == (_QWORD)v151)
              {
                v60 = vdupq_n_s64(*((unint64_t *)&v151 + 1));
                v58 = &v53[16 * v49];
              }
              else
              {
                v58 = &v53[16 * v49];
                do
                {
                  v59 = *((_OWORD *)v56 - 1);
                  v56 -= 2;
                  *((_OWORD *)v58 - 1) = v59;
                  v58 -= 16;
                  *v56 = 0;
                  v56[1] = 0;
                }
                while (v56 != v57);
                v60 = (int64x2_t)v151;
              }
              v114 = v55 + 16;
              *(_QWORD *)&v151 = v58;
              *((_QWORD *)&v151 + 1) = v55 + 16;
              *(int64x2_t *)&__s1[8] = v60;
              v115 = v152[0];
              v152[0] = &v53[16 * v54];
              v160 = v115;
              *(_QWORD *)__s1 = v60.i64[0];
              sub_1DF2820F0((uint64_t)__s1);
              v116 = (std::__shared_weak_count *)*((_QWORD *)&v153 + 1);
              *((_QWORD *)&v151 + 1) = v114;
              if (*((_QWORD *)&v153 + 1))
              {
                v117 = (unint64_t *)(*((_QWORD *)&v153 + 1) + 8);
                do
                  v118 = __ldaxr(v117);
                while (__stlxr(v118 - 1, v117));
LABEL_181:
                if (!v118)
                {
                  ((void (*)(std::__shared_weak_count *))v116->__on_zero_shared)(v116);
                  std::__shared_weak_count::__release_weak(v116);
                }
              }
              goto LABEL_183;
            }
LABEL_102:
            *v48 = v153;
            *((_QWORD *)&v151 + 1) = v48 + 1;
            goto LABEL_183;
          }
LABEL_31:
          sub_1DF28BE7C(__s1, "--");
          if (sub_1DF280244((const void **)v12, __s1))
          {
            v24 = *((char *)v12 + 23);
            if (v24 < 0)
            {
              if (v12[1] != 2)
                goto LABEL_47;
              v25 = (unsigned __int16 *)*v12;
            }
            else
            {
              v25 = (unsigned __int16 *)v12;
              if (v24 != 2)
              {
LABEL_47:
                v29 = 1;
                goto LABEL_48;
              }
            }
            v29 = *v25 != 11565;
LABEL_48:
            if ((__s1[23] & 0x80000000) != 0)
            {
              operator delete(*(void **)__s1);
              if (v29)
              {
LABEL_50:
                sub_1DF284DC8((uint64_t)a1, a2, (char **)__s1);
                goto LABEL_83;
              }
            }
            else if (v29)
            {
              goto LABEL_50;
            }
          }
          else if ((__s1[23] & 0x80000000) != 0)
          {
            operator delete(*(void **)__s1);
          }
          sub_1DF28BE7C(__s1, "-");
          if (sub_1DF280244((const void **)v12, __s1))
          {
            if (*((char *)v12 + 23) < 0)
            {
              v33 = v12[1];
              if (v33 != 1 || *(_BYTE *)*v12 != 45)
              {
                if (v33 != 2)
                  goto LABEL_77;
                v30 = (unsigned __int16 *)*v12;
                goto LABEL_65;
              }
            }
            else
            {
              if (*((_BYTE *)v12 + 23) != 1)
              {
                v30 = (unsigned __int16 *)v12;
                if (*((_BYTE *)v12 + 23) != 2)
                {
LABEL_77:
                  v34 = 1;
                  goto LABEL_78;
                }
LABEL_65:
                v34 = *v30 != 11565;
LABEL_78:
                if ((__s1[23] & 0x80000000) != 0)
                {
                  operator delete(*(void **)__s1);
                  if (v34)
                  {
LABEL_82:
                    sub_1DF285D88((uint64_t)a1, a2, (char **)__s1);
LABEL_83:
                    sub_1DF271914((void **)&v151);
                    v151 = *(_OWORD *)__s1;
                    v152[0] = *(_QWORD *)&__s1[16];
                    memset(__s1, 0, sizeof(__s1));
                    __p.n128_u64[0] = (unint64_t)__s1;
                    p_p = (void ***)&__p;
LABEL_186:
                    sub_1DF271804(p_p);
                    goto LABEL_187;
                  }
                }
                else if (v34)
                {
                  goto LABEL_82;
                }
LABEL_116:
                if (*((char *)v12 + 23) < 0)
                {
                  v75 = v12[1];
                  if (v75)
                  {
                    v74 = (char *)*v12;
                    v73 = (char *)*v12;
                    if (*(_BYTE *)*v12 != 60)
                      goto LABEL_125;
                    goto LABEL_122;
                  }
LABEL_142:
                  sub_1DF284D68(a1, &__p);
                  sub_1DF28811C((uint64_t)&__p, v156);
                  v79 = (_OWORD *)*((_QWORD *)&v151 + 1);
                  if (*((_QWORD *)&v151 + 1) >= v152[0])
                  {
                    v92 = (uint64_t)(*((_QWORD *)&v151 + 1) - v151) >> 4;
                    v93 = v92 + 1;
                    if ((unint64_t)(v92 + 1) >> 60)
                      sub_1DF271380();
                    v94 = v152[0] - v151;
                    if ((uint64_t)(v152[0] - v151) >> 3 > v93)
                      v93 = v94 >> 3;
                    if ((unint64_t)v94 >= 0x7FFFFFFFFFFFFFF0)
                      v95 = 0xFFFFFFFFFFFFFFFLL;
                    else
                      v95 = v93;
                    v161 = v152;
                    v96 = (char *)sub_1DF271778((uint64_t)v152, v95);
                    v98 = &v96[16 * v92];
                    *(_OWORD *)v98 = v156[0];
                    v156[0] = 0uLL;
                    v99 = (_QWORD *)*((_QWORD *)&v151 + 1);
                    v100 = (_QWORD *)v151;
                    if (*((_QWORD *)&v151 + 1) == (_QWORD)v151)
                    {
                      v103 = vdupq_n_s64(*((unint64_t *)&v151 + 1));
                      v101 = &v96[16 * v92];
                    }
                    else
                    {
                      v101 = &v96[16 * v92];
                      do
                      {
                        v102 = *((_OWORD *)v99 - 1);
                        v99 -= 2;
                        *((_OWORD *)v101 - 1) = v102;
                        v101 -= 16;
                        *v99 = 0;
                        v99[1] = 0;
                      }
                      while (v99 != v100);
                      v103 = (int64x2_t)v151;
                    }
                    v104 = v98 + 16;
                    *(_QWORD *)&v151 = v101;
                    *((_QWORD *)&v151 + 1) = v98 + 16;
                    *(int64x2_t *)&__s1[8] = v103;
                    v105 = v152[0];
                    v152[0] = &v96[16 * v97];
                    v160 = v105;
                    *(_QWORD *)__s1 = v103.i64[0];
                    sub_1DF2820F0((uint64_t)__s1);
                    v106 = (std::__shared_weak_count *)*((_QWORD *)&v156[0] + 1);
                    *((_QWORD *)&v151 + 1) = v104;
                    if (*((_QWORD *)&v156[0] + 1))
                    {
                      v107 = (unint64_t *)(*((_QWORD *)&v156[0] + 1) + 8);
                      do
                        v108 = __ldaxr(v107);
                      while (__stlxr(v108 - 1, v107));
                      goto LABEL_163;
                    }
LABEL_165:
                    if (v158 < 0)
                      operator delete((void *)__p.n128_u64[0]);
                    goto LABEL_187;
                  }
                }
                else
                {
                  if (!*((_BYTE *)v12 + 23))
                    goto LABEL_142;
                  if (*(_BYTE *)v12 != 60)
                    goto LABEL_124;
                  v73 = (char *)*v12;
                  v74 = (char *)v12;
                  v75 = *((unsigned __int8 *)v12 + 23);
LABEL_122:
                  if (v74[v75 - 1] != 62)
                  {
                    if ((*((_BYTE *)v12 + 23) & 0x80) == 0)
                    {
LABEL_124:
                      v74 = (char *)v12;
                      v75 = *((unsigned __int8 *)v12 + 23);
LABEL_125:
                      v76 = &v74[v75];
                      v73 = v74;
                      goto LABEL_126;
                    }
                    v113 = v12[1];
                    if (v113)
                    {
                      v76 = &v73[v113];
LABEL_126:
                      do
                      {
                        v77 = *v73;
                        if (!((v77 & 0x80000000) != 0
                             ? __maskrune(v77, 0x8000uLL)
                             : *(_DWORD *)(v6 + 4 * v77 + 60) & 0x8000))
                          goto LABEL_142;
                      }
                      while (++v73 != v76);
                    }
                  }
                  sub_1DF284D68(a1, &__p);
                  sub_1DF287B08((uint64_t)&__p, v156);
                  v79 = (_OWORD *)*((_QWORD *)&v151 + 1);
                  if (*((_QWORD *)&v151 + 1) >= v152[0])
                  {
                    v80 = (uint64_t)(*((_QWORD *)&v151 + 1) - v151) >> 4;
                    v81 = v80 + 1;
                    if ((unint64_t)(v80 + 1) >> 60)
                      sub_1DF271380();
                    v82 = v152[0] - v151;
                    if ((uint64_t)(v152[0] - v151) >> 3 > v81)
                      v81 = v82 >> 3;
                    if ((unint64_t)v82 >= 0x7FFFFFFFFFFFFFF0)
                      v83 = 0xFFFFFFFFFFFFFFFLL;
                    else
                      v83 = v81;
                    v161 = v152;
                    v84 = (char *)sub_1DF271778((uint64_t)v152, v83);
                    v86 = &v84[16 * v80];
                    *(_OWORD *)v86 = v156[0];
                    v156[0] = 0uLL;
                    v87 = (_QWORD *)*((_QWORD *)&v151 + 1);
                    v88 = (_QWORD *)v151;
                    if (*((_QWORD *)&v151 + 1) == (_QWORD)v151)
                    {
                      v91 = vdupq_n_s64(*((unint64_t *)&v151 + 1));
                      v89 = &v84[16 * v80];
                    }
                    else
                    {
                      v89 = &v84[16 * v80];
                      do
                      {
                        v90 = *((_OWORD *)v87 - 1);
                        v87 -= 2;
                        *((_OWORD *)v89 - 1) = v90;
                        v89 -= 16;
                        *v87 = 0;
                        v87[1] = 0;
                      }
                      while (v87 != v88);
                      v91 = (int64x2_t)v151;
                    }
                    v109 = v86 + 16;
                    *(_QWORD *)&v151 = v89;
                    *((_QWORD *)&v151 + 1) = v86 + 16;
                    *(int64x2_t *)&__s1[8] = v91;
                    v110 = v152[0];
                    v152[0] = &v84[16 * v85];
                    v160 = v110;
                    *(_QWORD *)__s1 = v91.i64[0];
                    sub_1DF2820F0((uint64_t)__s1);
                    v106 = (std::__shared_weak_count *)*((_QWORD *)&v156[0] + 1);
                    *((_QWORD *)&v151 + 1) = v109;
                    if (*((_QWORD *)&v156[0] + 1))
                    {
                      v111 = (unint64_t *)(*((_QWORD *)&v156[0] + 1) + 8);
                      do
                        v108 = __ldaxr(v111);
                      while (__stlxr(v108 - 1, v111));
LABEL_163:
                      if (!v108)
                      {
                        ((void (*)(std::__shared_weak_count *))v106->__on_zero_shared)(v106);
                        std::__shared_weak_count::__release_weak(v106);
                      }
                    }
                    goto LABEL_165;
                  }
                }
                *v79 = v156[0];
                v156[0] = 0uLL;
                *((_QWORD *)&v151 + 1) = v79 + 1;
                goto LABEL_165;
              }
              if (*(_BYTE *)v12 != 45)
                goto LABEL_77;
            }
          }
          if ((__s1[23] & 0x80000000) != 0)
            operator delete(*(void **)__s1);
          goto LABEL_116;
        }
        v14 = (int *)v11;
        if (v13 != 7)
          goto LABEL_31;
      }
      v16 = *v14;
      v17 = *(int *)((char *)v14 + 3);
      if (v16 != 1769238639 || v17 != 1936617321)
        goto LABEL_31;
      sub_1DF284D68(a1, &__p);
      if (v158 < 0)
        operator delete((void *)__p.n128_u64[0]);
      v19 = operator new(0x38uLL);
      v19[1] = 0;
      v19[2] = 0;
      *v19 = &off_1EA983790;
      v19[4] = 0;
      v19[5] = 0;
      v19[6] = 0;
      memset(__s1, 0, sizeof(__s1));
      v154.n128_u64[0] = (unint64_t)__s1;
      sub_1DF271804((void ***)&v154);
      v19[3] = off_1EA983098;
      v20 = v19 + 3;
      *(_QWORD *)&v156[0] = v19 + 3;
      *((_QWORD *)&v156[0] + 1) = v19;
      v21 = *((_QWORD *)&v151 + 1);
      if (*((_QWORD *)&v151 + 1) >= v152[0])
      {
        v35 = (uint64_t)(*((_QWORD *)&v151 + 1) - v151) >> 4;
        v36 = v35 + 1;
        if ((unint64_t)(v35 + 1) >> 60)
          sub_1DF271380();
        v37 = v152[0] - v151;
        if ((uint64_t)(v152[0] - v151) >> 3 > v36)
          v36 = v37 >> 3;
        if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0)
          v38 = 0xFFFFFFFFFFFFFFFLL;
        else
          v38 = v36;
        v161 = v152;
        v39 = (char *)sub_1DF271778((uint64_t)v152, v38);
        v41 = &v39[16 * v35];
        *(_QWORD *)v41 = v20;
        *((_QWORD *)v41 + 1) = v19;
        v42 = (_QWORD *)*((_QWORD *)&v151 + 1);
        v43 = (_QWORD *)v151;
        if (*((_QWORD *)&v151 + 1) == (_QWORD)v151)
        {
          v46 = vdupq_n_s64(*((unint64_t *)&v151 + 1));
          v44 = &v39[16 * v35];
        }
        else
        {
          v44 = &v39[16 * v35];
          do
          {
            v45 = *((_OWORD *)v42 - 1);
            v42 -= 2;
            *((_OWORD *)v44 - 1) = v45;
            v44 -= 16;
            *v42 = 0;
            v42[1] = 0;
          }
          while (v42 != v43);
          v46 = (int64x2_t)v151;
        }
        v22 = v41 + 16;
        *(_QWORD *)&v151 = v44;
        *((_QWORD *)&v151 + 1) = v41 + 16;
        *(int64x2_t *)&__s1[8] = v46;
        v112 = v152[0];
        v152[0] = &v39[16 * v40];
        v160 = v112;
        *(_QWORD *)__s1 = v46.i64[0];
        sub_1DF2820F0((uint64_t)__s1);
      }
      else
      {
        **((_QWORD **)&v151 + 1) = v20;
        *(_QWORD *)(v21 + 8) = v19;
        v22 = (_QWORD *)(v21 + 16);
      }
      *((_QWORD *)&v151 + 1) = v22;
LABEL_187:
      v122 = sub_1DF284C60(a1);
      v123 = *((char *)v122 + 23);
      if (v123 < 0)
      {
        if (v122[1] != 3)
          goto LABEL_196;
        v122 = (uint64_t *)*v122;
      }
      else if (v123 != 3)
      {
        goto LABEL_196;
      }
      if (*(_WORD *)v122 == 11822 && *((_BYTE *)v122 + 2) == 46)
      {
        sub_1DF28897C(&v151, &__p);
        v128 = *(__n128 **)(a3 + 8);
        v127 = *(_QWORD *)(a3 + 16);
        if ((unint64_t)v128 >= v127)
        {
          v129 = ((uint64_t)v128 - *(_QWORD *)a3) >> 4;
          v130 = v129 + 1;
          if ((unint64_t)(v129 + 1) >> 60)
            sub_1DF271380();
          v131 = v127 - *(_QWORD *)a3;
          if (v131 >> 3 > v130)
            v130 = v131 >> 3;
          if ((unint64_t)v131 >= 0x7FFFFFFFFFFFFFF0)
            v132 = 0xFFFFFFFFFFFFFFFLL;
          else
            v132 = v130;
          v161 = (_QWORD *)v148;
          v133 = (char *)sub_1DF271778(v148, v132);
          v135 = (__n128 *)&v133[16 * v129];
          *v135 = __p;
          __p = 0uLL;
          v137 = *(_QWORD **)a3;
          v136 = *(_QWORD **)(a3 + 8);
          if (v136 == *(_QWORD **)a3)
          {
            v140 = vdupq_n_s64((unint64_t)v136);
            v138 = &v133[16 * v129];
          }
          else
          {
            v138 = &v133[16 * v129];
            do
            {
              v139 = *((_OWORD *)v136 - 1);
              v136 -= 2;
              *((_OWORD *)v138 - 1) = v139;
              v138 -= 16;
              *v136 = 0;
              v136[1] = 0;
            }
            while (v136 != v137);
            v140 = *(int64x2_t *)a3;
          }
          v141 = v135 + 1;
          *(_QWORD *)a3 = v138;
          *(_QWORD *)(a3 + 8) = v135 + 1;
          *(int64x2_t *)&__s1[8] = v140;
          v142 = *(_QWORD *)(a3 + 16);
          *(_QWORD *)(a3 + 16) = &v133[16 * v134];
          v160 = v142;
          *(_QWORD *)__s1 = v140.i64[0];
          sub_1DF2820F0((uint64_t)__s1);
          v143 = (std::__shared_weak_count *)__p.n128_u64[1];
          *(_QWORD *)(a3 + 8) = v141;
          if (v143)
          {
            p_shared_owners = (unint64_t *)&v143->__shared_owners_;
            do
              v145 = __ldaxr(p_shared_owners);
            while (__stlxr(v145 - 1, p_shared_owners));
            if (!v145)
            {
              ((void (*)(std::__shared_weak_count *))v143->__on_zero_shared)(v143);
              std::__shared_weak_count::__release_weak(v143);
            }
          }
        }
        else
        {
          *v128 = __p;
          *(_QWORD *)(a3 + 8) = v128 + 1;
        }
        sub_1DF284D68(a1, &v149);
        if (v150 < 0)
          operator delete((void *)v149.n128_u64[0]);
        goto LABEL_219;
      }
LABEL_196:
      v125 = *((_QWORD *)&v151 + 1);
      for (i = v151; i != v125; i += 16)
        sub_1DF286F3C((char **)a3, i);
LABEL_219:
      *(_QWORD *)__s1 = &v151;
      sub_1DF271804((void ***)__s1);
    }
    while (a1[3] < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 3));
  }
}

void sub_1DF284B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, char **__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,char *a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  sub_1DF2717AC((uint64_t)&a17);
  if (a25 < 0)
    operator delete(__p);
  __p = &a26;
  sub_1DF271804((void ***)&__p);
  a26 = &a13;
  sub_1DF271804((void ***)&a26);
  sub_1DF271804((void ***)&a26);
  _Unwind_Resume(a1);
}

uint64_t *sub_1DF284C60(_QWORD *a1)
{
  unint64_t v1;
  unsigned __int8 v3;

  v1 = a1[3];
  if (v1 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 3))
    return (uint64_t *)(*a1 + 24 * v1);
  v3 = atomic_load((unsigned __int8 *)&qword_1F0474080);
  if ((v3 & 1) != 0)
    return &qword_1F0474068;
  if (__cxa_guard_acquire(&qword_1F0474080))
  {
    qword_1F0474068 = 0;
    unk_1F0474070 = 0;
    qword_1F0474078 = 0;
    __cxa_atexit(MEMORY[0x1E0DE44D0], &qword_1F0474068, &dword_1DF26E000);
    __cxa_guard_release(&qword_1F0474080);
  }
  return &qword_1F0474068;
}

double sub_1DF284D0C@<D0>(__int128 *a1@<X0>, _OWORD *a2@<X8>)
{
  __int128 *v3;
  __int128 v4;
  __int128 v6;

  v3 = *(__int128 **)a1;
  if (*((_QWORD *)a1 + 1) - *(_QWORD *)a1 == 16)
  {
    v4 = *v3;
    *a2 = *v3;
    *(_QWORD *)v3 = 0;
    *((_QWORD *)v3 + 1) = 0;
  }
  else
  {
    sub_1DF286B78(a1, &v6);
    *(_QWORD *)&v4 = v6;
    *a2 = v6;
  }
  return *(double *)&v4;
}

__n128 sub_1DF284D68@<Q0>(_QWORD *a1@<X0>, __n128 *a2@<X8>)
{
  unint64_t v2;
  __n128 *v3;
  __n128 result;

  v2 = a1[3];
  a1[3] = v2 + 1;
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a1[1] - *a1) >> 3) <= v2)
    sub_1DF288E80();
  v3 = (__n128 *)(*a1 + 24 * v2);
  result = *v3;
  *a2 = *v3;
  a2[1].n128_u64[0] = v3[1].n128_u64[0];
  v3->n128_u64[1] = 0;
  v3[1].n128_u64[0] = 0;
  v3->n128_u64[0] = 0;
  return result;
}

void sub_1DF284DC8(uint64_t a1@<X0>, uint64_t *a2@<X1>, char **a3@<X8>)
{
  int64_t size;
  std::string *p_str;
  std::string *v8;
  int64_t v9;
  char *v10;
  int v11;
  std::string *v12;
  int64_t v13;
  char *v14;
  char *v15;
  std::string::size_type v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void **p_s1;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t *v30;
  char *v31;
  std::string::size_type v32;
  uint64_t v33;
  uint64_t *v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t *v42;
  char *v43;
  std::string::size_type v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  std::runtime_error *v48;
  std::runtime_error *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  __int128 v55;
  std::string::size_type v56;
  unint64_t *v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  char *v71;
  __int128 v72;
  int64x2_t v73;
  char *v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  uint64_t v78;
  char v79;
  std::string::size_type v80;
  unint64_t *v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t *v84;
  char *v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t *v92;
  char *v93;
  char *v94;
  char *v95;
  __int128 v96;
  int64x2_t v97;
  char *v98;
  unint64_t *v99;
  std::string *v100;
  __int128 v101;
  char *v102;
  char *v103;
  std::string *v104;
  std::string::size_type v105;
  std::runtime_error *exception;
  __int128 v107;
  void *v108[2];
  uint64_t v109;
  void *v110[2];
  char v111;
  std::string v112;
  std::string v113;
  std::string __str;
  _BYTE __p[32];
  __int128 v116;
  std::string v117;
  int v118;
  __int128 v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  void **__s1;
  uint64_t v125;
  uint64_t v126;
  std::string v127;

  __s1 = 0;
  v125 = 0;
  v126 = 0;
  v121 = 0;
  v122 = 0;
  v123 = 0;
  v118 = 0;
  sub_1DF284D68((_QWORD *)a1, (__n128 *)&__str);
  sub_1DF28BE7C(&v113, "=");
  v116 = 0u;
  memset(&v117, 0, sizeof(v117));
  memset(__p, 0, sizeof(__p));
  size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_str = &__str;
  else
    p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __str.__r_.__value_.__l.__size_;
  if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = &v113;
  else
    v8 = (std::string *)v113.__r_.__value_.__r.__words[0];
  if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v9 = HIBYTE(v113.__r_.__value_.__r.__words[2]);
  else
    v9 = v113.__r_.__value_.__l.__size_;
  if (v9)
  {
    if (size >= v9)
    {
      v10 = (char *)p_str + size;
      v11 = v8->__r_.__value_.__s.__data_[0];
      v12 = p_str;
      do
      {
        v13 = size - v9;
        if (v13 == -1)
          break;
        v14 = (char *)memchr(v12, v11, v13 + 1);
        if (!v14)
          break;
        v15 = v14;
        if (!memcmp(v14, v8, v9))
        {
          if (v15 != v10)
          {
            v16 = v15 - (char *)p_str;
            if (v15 - (char *)p_str != -1)
              goto LABEL_21;
          }
          break;
        }
        v12 = (std::string *)(v15 + 1);
        size = v10 - (v15 + 1);
      }
      while (size >= v9);
    }
  }
  else
  {
    v16 = 0;
LABEL_21:
    std::string::basic_string(&v127, &__str, v16 + v9, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v112);
    v117 = v127;
    std::string::operator=((std::string *)&__p[24], &v113);
    std::string::resize(&__str, v16, 0);
    if ((__p[23] & 0x80000000) != 0)
      operator delete(*(void **)__p);
  }
  *(std::string *)__p = __str;
  *((_BYTE *)&__str.__r_.__value_.__s + 23) = 0;
  __str.__r_.__value_.__s.__data_[0] = 0;
  v127.__r_.__value_.__r.__words[0] = (std::string::size_type)&__s1;
  v127.__r_.__value_.__l.__size_ = (std::string::size_type)&v121;
  v127.__r_.__value_.__r.__words[2] = (std::string::size_type)&v118;
  sub_1DF287044(&v127, (__int128 *)__p);
  if (SHIBYTE(v117.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v117.__r_.__value_.__l.__data_);
  if (SHIBYTE(v116) < 0)
    operator delete(*(void **)&__p[24]);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v113.__r_.__value_.__l.__data_);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  v17 = HIBYTE(v123);
  if (v123 < 0)
    v17 = v122;
  if (v17)
    goto LABEL_36;
  *(_DWORD *)__p = 0;
  if (v118 == 3)
  {
    if (SHIBYTE(v120) < 0)
      operator delete((void *)v119);
    goto LABEL_130;
  }
  if (v118 == 4)
  {
    v127.__r_.__value_.__r.__words[0] = (std::string::size_type)&v119;
    sub_1DF28BFB0((void ***)&v127);
LABEL_130:
    v118 = *(_DWORD *)__p;
    switch(*(_DWORD *)__p)
    {
      case 1:
        LOBYTE(v119) = __p[8];
        break;
      case 2:
        *(_QWORD *)&v119 = *(_QWORD *)&__p[8];
        break;
      case 3:
        v119 = *(_OWORD *)&__p[8];
        v120 = *(_QWORD *)&__p[24];
        break;
      case 4:
        v119 = *(_OWORD *)&__p[8];
        v120 = *(_QWORD *)&__p[24];
        memset(&__p[8], 0, 24);
        v127.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[8];
        sub_1DF28BFB0((void ***)&v127);
        break;
      default:
        goto LABEL_36;
    }
    goto LABEL_36;
  }
  v118 = 0;
LABEL_36:
  memset(&v127, 0, sizeof(v127));
  v18 = *a2;
  v19 = a2[1];
  if (*a2 == v19)
  {
    v35 = (_BYTE *)(a1 + 32);
    if (!*(_BYTE *)(a1 + 32))
    {
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      goto LABEL_119;
    }
    v34 = 0;
    goto LABEL_80;
  }
  v20 = 0;
  do
  {
    v21 = *(unsigned __int8 *)(v18 + 111);
    if ((v21 & 0x80u) == 0)
      v22 = *(unsigned __int8 *)(v18 + 111);
    else
      v22 = *(_QWORD *)(v18 + 96);
    v23 = HIBYTE(v126);
    if (v126 < 0)
      v23 = v125;
    if (v22 == v23)
    {
      if (v126 >= 0)
        p_s1 = (void **)&__s1;
      else
        p_s1 = __s1;
      if ((v21 & 0x80) != 0)
      {
        if (memcmp(*(const void **)(v18 + 88), p_s1, *(_QWORD *)(v18 + 96)))
          goto LABEL_71;
LABEL_54:
        if ((unint64_t)v20 >= v127.__r_.__value_.__r.__words[2])
        {
          v26 = (uint64_t)((uint64_t)v20 - v127.__r_.__value_.__r.__words[0]) >> 3;
          if ((unint64_t)(v26 + 1) >> 61)
            sub_1DF271380();
          v27 = (uint64_t)(v127.__r_.__value_.__r.__words[2] - v127.__r_.__value_.__r.__words[0]) >> 2;
          if (v27 <= v26 + 1)
            v27 = v26 + 1;
          if (v127.__r_.__value_.__r.__words[2] - v127.__r_.__value_.__r.__words[0] >= 0x7FFFFFFFFFFFFFF8)
            v28 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v28 = v27;
          if (v28)
            v29 = (char *)sub_1DF271394((uint64_t)&v127.__r_.__value_.__r.__words[2], v28);
          else
            v29 = 0;
          v30 = (uint64_t *)&v29[8 * v26];
          *v30 = v18;
          v20 = v30 + 1;
          v31 = (char *)v127.__r_.__value_.__l.__size_;
          v32 = v127.__r_.__value_.__r.__words[0];
          if (v127.__r_.__value_.__l.__size_ != v127.__r_.__value_.__r.__words[0])
          {
            do
            {
              v33 = *((_QWORD *)v31 - 1);
              v31 -= 8;
              *--v30 = v33;
            }
            while (v31 != (char *)v32);
            v31 = (char *)v127.__r_.__value_.__r.__words[0];
          }
          v127.__r_.__value_.__r.__words[0] = (std::string::size_type)v30;
          v127.__r_.__value_.__l.__size_ = (std::string::size_type)v20;
          v127.__r_.__value_.__r.__words[2] = (std::string::size_type)&v29[8 * v28];
          if (v31)
            operator delete(v31);
        }
        else
        {
          *v20++ = v18;
        }
        v127.__r_.__value_.__l.__size_ = (std::string::size_type)v20;
        goto LABEL_71;
      }
      if (!*(_BYTE *)(v18 + 111))
        goto LABEL_54;
      v25 = 0;
      while (*(unsigned __int8 *)(v18 + v25 + 88) == *((unsigned __int8 *)p_s1 + v25))
      {
        if (v21 == ++v25)
          goto LABEL_54;
      }
    }
LABEL_71:
    v18 += 120;
  }
  while (v18 != v19);
  v34 = (uint64_t *)v127.__r_.__value_.__r.__words[0];
  v35 = (_BYTE *)(a1 + 32);
  if (*(_BYTE *)(a1 + 32) && (uint64_t *)v127.__r_.__value_.__l.__data_ == v20)
  {
LABEL_80:
    v36 = *a2;
    v37 = a2[1];
    if (*a2 == v37)
    {
      v20 = v34;
      goto LABEL_108;
    }
    v20 = v34;
    while (1)
    {
      if (*(char *)(v36 + 111) < 0)
      {
        if (*(_QWORD *)(v36 + 96))
        {
LABEL_86:
          if (sub_1DF280244((const void **)(v36 + 88), &__s1))
          {
            if ((unint64_t)v20 >= v127.__r_.__value_.__r.__words[2])
            {
              v38 = (uint64_t)((uint64_t)v20 - v127.__r_.__value_.__r.__words[0]) >> 3;
              if ((unint64_t)(v38 + 1) >> 61)
                sub_1DF271380();
              v39 = (uint64_t)(v127.__r_.__value_.__r.__words[2] - v127.__r_.__value_.__r.__words[0]) >> 2;
              if (v39 <= v38 + 1)
                v39 = v38 + 1;
              if (v127.__r_.__value_.__r.__words[2] - v127.__r_.__value_.__r.__words[0] >= 0x7FFFFFFFFFFFFFF8)
                v40 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v40 = v39;
              if (v40)
                v41 = (char *)sub_1DF271394((uint64_t)&v127.__r_.__value_.__r.__words[2], v40);
              else
                v41 = 0;
              v42 = (uint64_t *)&v41[8 * v38];
              *v42 = v36;
              v20 = v42 + 1;
              v43 = (char *)v127.__r_.__value_.__l.__size_;
              v44 = v127.__r_.__value_.__r.__words[0];
              if (v127.__r_.__value_.__l.__size_ != v127.__r_.__value_.__r.__words[0])
              {
                do
                {
                  v45 = *((_QWORD *)v43 - 1);
                  v43 -= 8;
                  *--v42 = v45;
                }
                while (v43 != (char *)v44);
                v43 = (char *)v127.__r_.__value_.__r.__words[0];
              }
              v127.__r_.__value_.__r.__words[0] = (std::string::size_type)v42;
              v127.__r_.__value_.__l.__size_ = (std::string::size_type)v20;
              v127.__r_.__value_.__r.__words[2] = (std::string::size_type)&v41[8 * v40];
              if (v43)
                operator delete(v43);
            }
            else
            {
              *v20++ = v36;
            }
            v127.__r_.__value_.__l.__size_ = (std::string::size_type)v20;
          }
        }
      }
      else if (*(_BYTE *)(v36 + 111))
      {
        goto LABEL_86;
      }
      v36 += 120;
      if (v36 == v37)
      {
        v34 = (uint64_t *)v127.__r_.__value_.__r.__words[0];
        break;
      }
    }
  }
LABEL_108:
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if ((unint64_t)((char *)v20 - (char *)v34) > 8)
  {
    sub_1DF286D94(v34, v20, (uint64_t *)__p);
    std::operator+<char>();
    v100 = std::string::append(&v112, "' is not a unique prefix: ");
    v101 = *(_OWORD *)&v100->__r_.__value_.__l.__data_;
    v113.__r_.__value_.__r.__words[2] = v100->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v113.__r_.__value_.__l.__data_ = v101;
    v100->__r_.__value_.__l.__size_ = 0;
    v100->__r_.__value_.__r.__words[2] = 0;
    v100->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v112.__r_.__value_.__l.__data_);
    v102 = *(char **)__p;
    v103 = *(char **)&__p[8];
    sub_1DF28BE7C(v110, ", ");
    sub_1DF286E60(v102, v103, (uint64_t)v110, &v112);
    if ((v112.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v104 = &v112;
    else
      v104 = (std::string *)v112.__r_.__value_.__r.__words[0];
    if ((v112.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v105 = HIBYTE(v112.__r_.__value_.__r.__words[2]);
    else
      v105 = v112.__r_.__value_.__l.__size_;
    std::string::append(&v113, (const std::string::value_type *)v104, v105);
    if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v112.__r_.__value_.__l.__data_);
    if (v111 < 0)
      operator delete(v110[0]);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, &v113);
    exception->__vftable = (std::runtime_error_vtbl *)&off_1EA982F90;
    __cxa_throw(exception, (struct type_info *)&unk_1EA982AA0, (void (*)(void *))std::runtime_error::~runtime_error);
  }
  if (v34 != v20)
  {
    sub_1DF287820(*v34, &v113);
    v46 = v113.__r_.__value_.__r.__words[0];
    if (!*(_DWORD *)(v113.__r_.__value_.__r.__words[0] + 112))
    {
      if (v118)
      {
        sub_1DF270CD8(" must not have an argument", (const void **)(v113.__r_.__value_.__r.__words[0] + 88), (void **)__p);
        v49 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v49, (const std::string *)__p);
        v49->__vftable = (std::runtime_error_vtbl *)&off_1EA982F90;
        __cxa_throw(v49, (struct type_info *)&unk_1EA982AA0, (void (*)(void *))std::runtime_error::~runtime_error);
      }
      goto LABEL_190;
    }
    if (v118)
      goto LABEL_190;
    v47 = sub_1DF284C60((_QWORD *)a1);
    if (*((char *)v47 + 23) < 0)
    {
      v78 = v47[1];
      if (v78 == 2)
      {
        v47 = (uint64_t *)*v47;
        goto LABEL_175;
      }
      if (v78)
        goto LABEL_176;
    }
    else
    {
      if (*((_BYTE *)v47 + 23) != 2)
      {
        if (!*((_BYTE *)v47 + 23))
          goto LABEL_115;
LABEL_176:
        sub_1DF284D68((_QWORD *)a1, (__n128 *)v108);
        *(_DWORD *)__p = 3;
        *(_OWORD *)&__p[8] = *(_OWORD *)v108;
        *(_QWORD *)&__p[24] = v109;
        v108[0] = 0;
        v108[1] = 0;
        v109 = 0;
        if (v118 == 3)
        {
          if (SHIBYTE(v120) < 0)
            operator delete((void *)v119);
LABEL_181:
          v118 = *(_DWORD *)__p;
          switch(*(_DWORD *)__p)
          {
            case 1:
              LOBYTE(v119) = __p[8];
              break;
            case 2:
              *(_QWORD *)&v119 = *(_QWORD *)&__p[8];
              break;
            case 3:
              goto LABEL_184;
            case 4:
              v119 = *(_OWORD *)&__p[8];
              v120 = *(_QWORD *)&__p[24];
              memset(&__p[8], 0, 24);
              v112.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[8];
              sub_1DF28BFB0((void ***)&v112);
              break;
            default:
              break;
          }
        }
        else
        {
          if (v118 == 4)
          {
            v112.__r_.__value_.__r.__words[0] = (std::string::size_type)&v119;
            sub_1DF28BFB0((void ***)&v112);
            goto LABEL_181;
          }
          v118 = 3;
LABEL_184:
          v119 = *(_OWORD *)&__p[8];
          v120 = *(_QWORD *)&__p[24];
          memset(&__p[8], 0, 24);
        }
        if (SHIBYTE(v109) < 0)
          operator delete(v108[0]);
        v46 = v113.__r_.__value_.__r.__words[0];
LABEL_190:
        if (*v35)
        {
          if (v118)
          {
            *(_DWORD *)__p = v118;
            switch(v118)
            {
              case 1:
                v79 = v119;
                goto LABEL_195;
              case 2:
                *(_QWORD *)&__p[8] = v119;
                break;
              case 3:
                *(_OWORD *)&__p[8] = v119;
                *(_QWORD *)&__p[24] = v120;
                goto LABEL_198;
              case 4:
                *(_OWORD *)&__p[8] = v119;
                *(_QWORD *)&__p[24] = v120;
LABEL_198:
                v120 = 0;
                v119 = 0uLL;
                break;
              default:
                break;
            }
          }
          else
          {
            v79 = 1;
            *(_DWORD *)__p = 1;
LABEL_195:
            __p[8] = v79;
          }
          sub_1DF281F48(v46, (int *)__p);
          if (*(_DWORD *)__p == 4)
          {
            v112.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[8];
            sub_1DF28BFB0((void ***)&v112);
          }
          else if (*(_DWORD *)__p == 3 && (__p[31] & 0x80000000) != 0)
          {
            operator delete(*(void **)&__p[8]);
          }
          v46 = v113.__r_.__value_.__r.__words[0];
        }
        v80 = v113.__r_.__value_.__l.__size_;
        v112.__r_.__value_.__r.__words[0] = v46;
        v112.__r_.__value_.__l.__size_ = v113.__r_.__value_.__l.__size_;
        if (v113.__r_.__value_.__l.__size_)
        {
          v81 = (unint64_t *)(v113.__r_.__value_.__l.__size_ + 8);
          do
            v82 = __ldxr(v81);
          while (__stxr(v82 + 1, v81));
        }
        v83 = (unint64_t)a3[2];
        v84 = (uint64_t *)a3[1];
        if ((unint64_t)v84 >= v83)
        {
          v86 = ((char *)v84 - *a3) >> 4;
          v87 = v86 + 1;
          if ((unint64_t)(v86 + 1) >> 60)
            sub_1DF271380();
          v88 = v83 - (_QWORD)*a3;
          if (v88 >> 3 > v87)
            v87 = v88 >> 3;
          if ((unint64_t)v88 >= 0x7FFFFFFFFFFFFFF0)
            v89 = 0xFFFFFFFFFFFFFFFLL;
          else
            v89 = v87;
          *(_QWORD *)&v116 = a3 + 2;
          v90 = (char *)sub_1DF271778((uint64_t)(a3 + 2), v89);
          v92 = (uint64_t *)&v90[16 * v86];
          *v92 = v46;
          v92[1] = v80;
          v94 = *a3;
          v93 = a3[1];
          if (v93 == *a3)
          {
            v97 = vdupq_n_s64((unint64_t)v93);
            v95 = &v90[16 * v86];
          }
          else
          {
            v95 = &v90[16 * v86];
            do
            {
              v96 = *((_OWORD *)v93 - 1);
              v93 -= 16;
              *((_OWORD *)v95 - 1) = v96;
              v95 -= 16;
              *(_QWORD *)v93 = 0;
              *((_QWORD *)v93 + 1) = 0;
            }
            while (v93 != v94);
            v97 = *(int64x2_t *)a3;
          }
          v85 = (char *)(v92 + 2);
          *a3 = v95;
          a3[1] = (char *)(v92 + 2);
          *(int64x2_t *)&__p[8] = v97;
          v98 = a3[2];
          a3[2] = &v90[16 * v91];
          *(_QWORD *)&__p[24] = v98;
          *(_QWORD *)__p = v97.i64[0];
          sub_1DF2820F0((uint64_t)__p);
        }
        else
        {
          *v84 = v46;
          v84[1] = v80;
          v85 = (char *)(v84 + 2);
        }
        a3[1] = v85;
        v75 = (std::__shared_weak_count *)v113.__r_.__value_.__l.__size_;
        if (v113.__r_.__value_.__l.__size_)
        {
          v99 = (unint64_t *)(v113.__r_.__value_.__l.__size_ + 8);
          do
            v77 = __ldaxr(v99);
          while (__stlxr(v77 - 1, v99));
LABEL_226:
          if (!v77)
          {
            ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
            std::__shared_weak_count::__release_weak(v75);
          }
        }
        goto LABEL_228;
      }
LABEL_175:
      if (*(_WORD *)v47 != 11565)
        goto LABEL_176;
    }
LABEL_115:
    sub_1DF270CD8(" requires an argument", (const void **)(v113.__r_.__value_.__r.__words[0] + 88), (void **)__p);
    v48 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v48, (const std::string *)__p);
    v48->__vftable = (std::runtime_error_vtbl *)&off_1EA982F90;
    __cxa_throw(v48, (struct type_info *)&unk_1EA982AA0, (void (*)(void *))std::runtime_error::~runtime_error);
  }
LABEL_119:
  v50 = HIBYTE(v123);
  if (v123 < 0)
    v50 = v122;
  LODWORD(v110[0]) = v50 != 0;
  v51 = a2[1];
  if (v51 >= a2[2])
  {
    v52 = sub_1DF2872E8(a2, (char *)&unk_1DF29028E, (uint64_t)&__s1, (int *)v110);
  }
  else
  {
    sub_1DF28740C((_DWORD)a2 + 16, a2[1], (char *)&unk_1DF29028E, (uint64_t)&__s1, (int *)v110);
    v52 = v51 + 120;
    a2[1] = v51 + 120;
  }
  a2[1] = v52;
  sub_1DF287530(v52 - 120, &v113);
  if (*v35)
  {
    v53 = v113.__r_.__value_.__r.__words[0];
    if (LODWORD(v110[0]))
    {
      *(_DWORD *)__p = v118;
      switch(v118)
      {
        case 1:
          v54 = v119;
          goto LABEL_134;
        case 2:
          *(_QWORD *)&__p[8] = v119;
          break;
        case 3:
          if (SHIBYTE(v120) < 0)
          {
            sub_1DF279470(&__p[8], (void *)v119, *((unint64_t *)&v119 + 1));
          }
          else
          {
            *(_OWORD *)&__p[8] = v119;
            *(_QWORD *)&__p[24] = v120;
          }
          break;
        case 4:
          memset(&__p[8], 0, 24);
          sub_1DF28BF2C(&__p[8], (__int128 *)v119, *((__int128 **)&v119 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v119 + 1) - v119) >> 3));
          break;
        default:
          break;
      }
    }
    else
    {
      v54 = 1;
      *(_DWORD *)__p = 1;
LABEL_134:
      __p[8] = v54;
    }
    sub_1DF281F48(v53, (int *)__p);
    if (*(_DWORD *)__p == 4)
    {
      v112.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p[8];
      sub_1DF28BFB0((void ***)&v112);
    }
    else if (*(_DWORD *)__p == 3 && (__p[31] & 0x80000000) != 0)
    {
      operator delete(*(void **)&__p[8]);
    }
  }
  v55 = *(_OWORD *)&v113.__r_.__value_.__l.__data_;
  *(_OWORD *)&v112.__r_.__value_.__l.__data_ = *(_OWORD *)&v113.__r_.__value_.__l.__data_;
  v56 = v113.__r_.__value_.__l.__size_;
  if (v113.__r_.__value_.__l.__size_)
  {
    v57 = (unint64_t *)(v113.__r_.__value_.__l.__size_ + 8);
    do
      v58 = __ldxr(v57);
    while (__stxr(v58 + 1, v57));
  }
  v59 = (unint64_t)a3[2];
  v60 = a3[1];
  if ((unint64_t)v60 >= v59)
  {
    v107 = v55;
    v62 = (v60 - *a3) >> 4;
    if ((unint64_t)(v62 + 1) >> 60)
      sub_1DF271380();
    v63 = v59 - (_QWORD)*a3;
    v64 = v63 >> 3;
    if (v63 >> 3 <= (unint64_t)(v62 + 1))
      v64 = v62 + 1;
    if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF0)
      v65 = 0xFFFFFFFFFFFFFFFLL;
    else
      v65 = v64;
    *(_QWORD *)&v116 = a3 + 2;
    v66 = (char *)sub_1DF271778((uint64_t)(a3 + 2), v65);
    v68 = &v66[16 * v62];
    *(_OWORD *)v68 = v107;
    v70 = *a3;
    v69 = a3[1];
    if (v69 == *a3)
    {
      v73 = vdupq_n_s64((unint64_t)v69);
      v71 = &v66[16 * v62];
    }
    else
    {
      v71 = &v66[16 * v62];
      do
      {
        v72 = *((_OWORD *)v69 - 1);
        v69 -= 16;
        *((_OWORD *)v71 - 1) = v72;
        v71 -= 16;
        *(_QWORD *)v69 = 0;
        *((_QWORD *)v69 + 1) = 0;
      }
      while (v69 != v70);
      v73 = *(int64x2_t *)a3;
    }
    v61 = v68 + 16;
    *a3 = v71;
    a3[1] = v68 + 16;
    *(int64x2_t *)&__p[8] = v73;
    v74 = a3[2];
    a3[2] = &v66[16 * v67];
    *(_QWORD *)&__p[24] = v74;
    *(_QWORD *)__p = v73.i64[0];
    sub_1DF2820F0((uint64_t)__p);
  }
  else
  {
    *(_QWORD *)v60 = v55;
    *((_QWORD *)v60 + 1) = v56;
    v61 = v60 + 16;
  }
  a3[1] = v61;
  v75 = (std::__shared_weak_count *)v113.__r_.__value_.__l.__size_;
  if (v113.__r_.__value_.__l.__size_)
  {
    v76 = (unint64_t *)(v113.__r_.__value_.__l.__size_ + 8);
    do
      v77 = __ldaxr(v76);
    while (__stlxr(v77 - 1, v76));
    goto LABEL_226;
  }
LABEL_228:
  if (v127.__r_.__value_.__r.__words[0])
  {
    v127.__r_.__value_.__l.__size_ = v127.__r_.__value_.__r.__words[0];
    operator delete(v127.__r_.__value_.__l.__data_);
  }
  if (v118 == 4)
  {
    *(_QWORD *)__p = &v119;
    sub_1DF28BFB0((void ***)__p);
  }
  else if (v118 == 3 && SHIBYTE(v120) < 0)
  {
    operator delete((void *)v119);
  }
  if (SHIBYTE(v123) < 0)
    operator delete(v121);
  if (SHIBYTE(v126) < 0)
    operator delete(__s1);
}

void sub_1DF285BDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,void **__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,int a35,__int16 a36,char a37,char a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44)
{
  uint64_t v44;
  void *v46;

  if (a32 < 0)
    operator delete(__p);
  __p = &a39;
  sub_1DF28BFB0(&__p);
  sub_1DF271804(&__p);
  v46 = *(void **)(v44 - 120);
  if (v46)
  {
    *(_QWORD *)(v44 - 112) = v46;
    operator delete(v46);
  }
  sub_1DF28202C(v44 - 200);
  if (*(char *)(v44 - 145) < 0)
    operator delete(*(void **)(v44 - 168));
  if (*(char *)(v44 - 121) < 0)
    operator delete(*(void **)(v44 - 144));
  _Unwind_Resume(a1);
}

void sub_1DF285D88(uint64_t a1@<X0>, uint64_t *a2@<X1>, char **a3@<X8>)
{
  uint64_t v5;
  __n128 *v6;
  __n128 *v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  const void *v13;
  unint64_t v14;
  const void **v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  __n128 *v26;
  unint64_t v27;
  uint64_t v28;
  __int128 v29;
  std::string::size_type v30;
  unint64_t *v31;
  unint64_t v32;
  char *v33;
  unint64_t v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  __int128 v46;
  int64x2_t v47;
  char *v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  unint64_t v54;
  __n128 *v55;
  std::string::size_type v56;
  std::string::value_type v57;
  std::string::size_type v58;
  unint64_t *v59;
  unint64_t v60;
  unint64_t v61;
  std::string::size_type *v62;
  char *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  uint64_t v69;
  std::string::size_type *v70;
  char *v71;
  char *v72;
  char *v73;
  __int128 v74;
  int64x2_t v75;
  char *v76;
  unint64_t *v77;
  std::string *v78;
  std::string::size_type size;
  std::string *v80;
  __int128 v81;
  std::string *v82;
  __int128 v83;
  std::runtime_error *exception;
  std::runtime_error *v85;
  uint64_t v86;
  __int128 v87;
  void *v89[2];
  char *v90;
  void *v91[2];
  char *v92;
  std::string __p;
  char *v94;
  std::string v95;
  std::string v96;
  void *v97;
  uint64_t *v98;
  uint64_t *v99;
  const void *v100[2];
  char v101;
  __n128 v102;
  unsigned __int8 v103;
  std::string v104;
  char *v105;
  _QWORD *v106;

  sub_1DF284D68((_QWORD *)a1, &v102);
  v5 = v103;
  v6 = (__n128 *)v102.n128_u64[0];
  if ((v103 & 0x80u) == 0)
    v6 = &v102;
  v7 = (__n128 *)((char *)v6->n128_u64 + 1);
  a3[2] = 0;
  v86 = (uint64_t)(a3 + 2);
  *a3 = 0;
  a3[1] = 0;
  if ((v5 & 0x80) != 0)
    goto LABEL_6;
  while (2)
  {
    if (v7 == (__n128 *)((char *)&v102 + v5))
      return;
LABEL_7:
    v8 = v7->n128_u8[0];
    v7 = (__n128 *)((char *)v7 + 1);
    v101 = 2;
    LOBYTE(v100[0]) = 45;
    *(_WORD *)((char *)v100 + 1) = v8;
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v10 = *a2;
    v9 = a2[1];
    if (*a2 == v9)
      goto LABEL_49;
    v11 = 0;
    do
    {
      v12 = *(unsigned __int8 *)(v10 + 87);
      if ((v12 & 0x80u) == 0)
        v13 = (const void *)*(unsigned __int8 *)(v10 + 87);
      else
        v13 = *(const void **)(v10 + 72);
      v14 = v101;
      if (v101 < 0)
        v14 = (unint64_t)v100[1];
      if (v13 == (const void *)v14)
      {
        if (v101 >= 0)
          v15 = v100;
        else
          v15 = (const void **)v100[0];
        if ((v12 & 0x80) != 0)
        {
          if (memcmp(*(const void **)(v10 + 64), v15, *(_QWORD *)(v10 + 72)))
            goto LABEL_42;
LABEL_25:
          if (v11 >= v99)
          {
            v17 = ((char *)v11 - (_BYTE *)v97) >> 3;
            if ((unint64_t)(v17 + 1) >> 61)
              sub_1DF271380();
            v18 = ((char *)v99 - (_BYTE *)v97) >> 2;
            if (v18 <= v17 + 1)
              v18 = v17 + 1;
            if ((unint64_t)((char *)v99 - (_BYTE *)v97) >= 0x7FFFFFFFFFFFFFF8)
              v19 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v19 = v18;
            if (v19)
              v20 = (char *)sub_1DF271394((uint64_t)&v99, v19);
            else
              v20 = 0;
            v21 = (uint64_t *)&v20[8 * v17];
            *v21 = v10;
            v11 = v21 + 1;
            v23 = (char *)v97;
            v22 = (char *)v98;
            if (v98 != v97)
            {
              do
              {
                v24 = *((_QWORD *)v22 - 1);
                v22 -= 8;
                *--v21 = v24;
              }
              while (v22 != v23);
              v22 = (char *)v97;
            }
            v97 = v21;
            v98 = v11;
            v99 = (uint64_t *)&v20[8 * v19];
            if (v22)
              operator delete(v22);
          }
          else
          {
            *v11++ = v10;
          }
          v98 = v11;
          goto LABEL_42;
        }
        if (!*(_BYTE *)(v10 + 87))
          goto LABEL_25;
        v16 = 0;
        while (*(unsigned __int8 *)(v10 + v16 + 64) == *((unsigned __int8 *)v15 + v16))
        {
          if (v12 == ++v16)
            goto LABEL_25;
        }
      }
LABEL_42:
      v10 += 120;
    }
    while (v10 != v9);
    if ((unint64_t)((char *)v11 - (_BYTE *)v97) > 8)
    {
      sub_1DF270CD8(" is specified ambiguously ", v100, (void **)&v96.__r_.__value_.__l.__data_);
      std::to_string(&v95, ((char *)v98 - (_BYTE *)v97) >> 3);
      if ((v95.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v78 = &v95;
      else
        v78 = (std::string *)v95.__r_.__value_.__r.__words[0];
      if ((v95.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v95.__r_.__value_.__r.__words[2]);
      else
        size = v95.__r_.__value_.__l.__size_;
      v80 = std::string::append(&v96, (const std::string::value_type *)v78, size);
      v81 = *(_OWORD *)&v80->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v80->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v81;
      v80->__r_.__value_.__l.__size_ = 0;
      v80->__r_.__value_.__r.__words[2] = 0;
      v80->__r_.__value_.__r.__words[0] = 0;
      v82 = std::string::append(&__p, " times");
      v83 = *(_OWORD *)&v82->__r_.__value_.__l.__data_;
      v104.__r_.__value_.__r.__words[2] = v82->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v104.__r_.__value_.__l.__data_ = v83;
      v82->__r_.__value_.__l.__size_ = 0;
      v82->__r_.__value_.__r.__words[2] = 0;
      v82->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v95.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v95.__r_.__value_.__l.__data_);
      if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v96.__r_.__value_.__l.__data_);
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, &v104);
      exception->__vftable = (std::runtime_error_vtbl *)&off_1EA982F90;
      __cxa_throw(exception, (struct type_info *)&unk_1EA982AA0, (void (*)(void *))std::runtime_error::~runtime_error);
    }
    if (v97 != v11)
    {
      sub_1DF287820(*(_QWORD *)v97, &v96);
      LODWORD(__p.__r_.__value_.__l.__data_) = 0;
      if (!*(_DWORD *)(v96.__r_.__value_.__r.__words[0] + 112))
        goto LABEL_118;
      if (((char)v103 & 0x80000000) == 0)
      {
        v25 = v103;
        if (v7 != (__n128 *)((char *)&v102 + v103))
        {
          v26 = &v102;
          goto LABEL_80;
        }
LABEL_83:
        v52 = sub_1DF284C60((_QWORD *)a1);
        if ((*((char *)v52 + 23) & 0x80000000) == 0)
        {
          if (*((_BYTE *)v52 + 23) != 2)
          {
            if (!*((_BYTE *)v52 + 23))
              goto LABEL_183;
            goto LABEL_105;
          }
LABEL_104:
          if (*(_WORD *)v52 == 11565)
            goto LABEL_183;
          goto LABEL_105;
        }
        v53 = v52[1];
        if (v53 == 2)
        {
          v52 = (uint64_t *)*v52;
          goto LABEL_104;
        }
        if (!v53)
        {
LABEL_183:
          sub_1DF270CD8(" requires an argument", v100, (void **)&v104.__r_.__value_.__l.__data_);
          v85 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v85, &v104);
          v85->__vftable = (std::runtime_error_vtbl *)&off_1EA982F90;
          __cxa_throw(v85, (struct type_info *)&unk_1EA982AA0, (void (*)(void *))std::runtime_error::~runtime_error);
        }
LABEL_105:
        sub_1DF284D68((_QWORD *)a1, (__n128 *)v91);
        LODWORD(v104.__r_.__value_.__l.__data_) = 3;
        *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = *(_OWORD *)v91;
        v105 = v92;
        v91[0] = 0;
        v91[1] = 0;
        v92 = 0;
        if (LODWORD(__p.__r_.__value_.__l.__data_) == 3)
        {
          if (SHIBYTE(v94) < 0)
            operator delete((void *)__p.__r_.__value_.__l.__size_);
LABEL_110:
          LODWORD(__p.__r_.__value_.__l.__data_) = v104.__r_.__value_.__l.__data_;
          switch(LODWORD(v104.__r_.__value_.__l.__data_))
          {
            case 1:
              __p.__r_.__value_.__s.__data_[8] = v104.__r_.__value_.__s.__data_[8];
              break;
            case 2:
              __p.__r_.__value_.__l.__size_ = v104.__r_.__value_.__l.__size_;
              break;
            case 3:
              goto LABEL_113;
            case 4:
              *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = *(_OWORD *)&v104.__r_.__value_.__r.__words[1];
              v94 = v105;
              v105 = 0;
              *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = 0uLL;
              v95.__r_.__value_.__r.__words[0] = (std::string::size_type)&v104.__r_.__value_.__l.__size_;
              sub_1DF28BFB0((void ***)&v95);
              break;
            default:
              break;
          }
        }
        else
        {
          if (LODWORD(__p.__r_.__value_.__l.__data_) == 4)
          {
            v95.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
            sub_1DF28BFB0((void ***)&v95);
            goto LABEL_110;
          }
          LODWORD(__p.__r_.__value_.__l.__data_) = 3;
LABEL_113:
          *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = *(_OWORD *)&v104.__r_.__value_.__r.__words[1];
          v94 = v105;
          v105 = 0;
          *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = 0uLL;
        }
        if (SHIBYTE(v92) < 0)
          operator delete(v91[0]);
LABEL_118:
        v56 = v96.__r_.__value_.__r.__words[0];
        if (*(_BYTE *)(a1 + 32))
        {
          if (LODWORD(__p.__r_.__value_.__l.__data_))
          {
            LODWORD(v104.__r_.__value_.__l.__data_) = __p.__r_.__value_.__l.__data_;
            switch(LODWORD(__p.__r_.__value_.__l.__data_))
            {
              case 1:
                v57 = __p.__r_.__value_.__s.__data_[8];
                goto LABEL_123;
              case 2:
                v104.__r_.__value_.__l.__size_ = __p.__r_.__value_.__l.__size_;
                break;
              case 3:
                *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = *(_OWORD *)&__p.__r_.__value_.__r.__words[1];
                v105 = v94;
                v94 = 0;
                *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
                break;
              case 4:
                *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = *(_OWORD *)&__p.__r_.__value_.__r.__words[1];
                v105 = v94;
                v94 = 0;
                *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = 0uLL;
                break;
              default:
                break;
            }
          }
          else
          {
            v57 = 1;
            LODWORD(v104.__r_.__value_.__l.__data_) = 1;
LABEL_123:
            v104.__r_.__value_.__s.__data_[8] = v57;
          }
          sub_1DF281F48((uint64_t)v96.__r_.__value_.__l.__data_, (int *)&v104);
          if (LODWORD(v104.__r_.__value_.__l.__data_) == 4)
          {
            v95.__r_.__value_.__r.__words[0] = (std::string::size_type)&v104.__r_.__value_.__l.__size_;
            sub_1DF28BFB0((void ***)&v95);
          }
          else if (LODWORD(v104.__r_.__value_.__l.__data_) == 3 && SHIBYTE(v105) < 0)
          {
            operator delete((void *)v104.__r_.__value_.__l.__size_);
          }
          v56 = v96.__r_.__value_.__r.__words[0];
        }
        v58 = v96.__r_.__value_.__l.__size_;
        v95.__r_.__value_.__r.__words[0] = v56;
        v95.__r_.__value_.__l.__size_ = v96.__r_.__value_.__l.__size_;
        if (v96.__r_.__value_.__l.__size_)
        {
          v59 = (unint64_t *)(v96.__r_.__value_.__l.__size_ + 8);
          do
            v60 = __ldxr(v59);
          while (__stxr(v60 + 1, v59));
        }
        v62 = (std::string::size_type *)a3[1];
        v61 = (unint64_t)a3[2];
        if ((unint64_t)v62 >= v61)
        {
          v64 = ((char *)v62 - *a3) >> 4;
          v65 = v64 + 1;
          if ((unint64_t)(v64 + 1) >> 60)
            sub_1DF271380();
          v66 = v61 - (_QWORD)*a3;
          if (v66 >> 3 > v65)
            v65 = v66 >> 3;
          if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF0)
            v67 = 0xFFFFFFFFFFFFFFFLL;
          else
            v67 = v65;
          v106 = a3 + 2;
          v68 = (char *)sub_1DF271778(v86, v67);
          v70 = (std::string::size_type *)&v68[16 * v64];
          *v70 = v56;
          v70[1] = v58;
          v72 = *a3;
          v71 = a3[1];
          if (v71 == *a3)
          {
            v75 = vdupq_n_s64((unint64_t)v71);
            v73 = &v68[16 * v64];
          }
          else
          {
            v73 = &v68[16 * v64];
            do
            {
              v74 = *((_OWORD *)v71 - 1);
              v71 -= 16;
              *((_OWORD *)v73 - 1) = v74;
              v73 -= 16;
              *(_QWORD *)v71 = 0;
              *((_QWORD *)v71 + 1) = 0;
            }
            while (v71 != v72);
            v75 = *(int64x2_t *)a3;
          }
          v63 = (char *)(v70 + 2);
          *a3 = v73;
          a3[1] = (char *)(v70 + 2);
          *(int64x2_t *)&v104.__r_.__value_.__r.__words[1] = v75;
          v76 = a3[2];
          a3[2] = &v68[16 * v69];
          v105 = v76;
          v104.__r_.__value_.__r.__words[0] = v75.i64[0];
          sub_1DF2820F0((uint64_t)&v104);
        }
        else
        {
          *v62 = v56;
          v62[1] = v58;
          v63 = (char *)(v62 + 2);
        }
        a3[1] = v63;
        if (LODWORD(__p.__r_.__value_.__l.__data_) == 4)
        {
          v104.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
          sub_1DF28BFB0((void ***)&v104);
        }
        else if (LODWORD(__p.__r_.__value_.__l.__data_) == 3 && SHIBYTE(v94) < 0)
        {
          operator delete((void *)__p.__r_.__value_.__l.__size_);
        }
        v49 = (std::__shared_weak_count *)v96.__r_.__value_.__l.__size_;
        if (v96.__r_.__value_.__l.__size_)
        {
          v77 = (unint64_t *)(v96.__r_.__value_.__l.__size_ + 8);
          do
            v51 = __ldaxr(v77);
          while (__stlxr(v51 - 1, v77));
LABEL_158:
          if (!v51)
          {
            ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
            std::__shared_weak_count::__release_weak(v49);
          }
        }
        goto LABEL_160;
      }
      v25 = v102.n128_u64[1];
      v26 = (__n128 *)v102.n128_u64[0];
      if (v7 == (__n128 *)(v102.n128_u64[0] + v102.n128_u64[1]))
        goto LABEL_83;
LABEL_80:
      sub_1DF277D38(v89, (char *)v7, (char *)v26 + v25, (char *)v26 + v25 - (char *)v7);
      LODWORD(v104.__r_.__value_.__l.__data_) = 3;
      *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = *(_OWORD *)v89;
      v105 = v90;
      v89[0] = 0;
      v89[1] = 0;
      v90 = 0;
      if (LODWORD(__p.__r_.__value_.__l.__data_) == 3)
      {
        if (SHIBYTE(v94) < 0)
          operator delete((void *)__p.__r_.__value_.__l.__size_);
LABEL_89:
        LODWORD(__p.__r_.__value_.__l.__data_) = v104.__r_.__value_.__l.__data_;
        switch(LODWORD(v104.__r_.__value_.__l.__data_))
        {
          case 1:
            __p.__r_.__value_.__s.__data_[8] = v104.__r_.__value_.__s.__data_[8];
            break;
          case 2:
            __p.__r_.__value_.__l.__size_ = v104.__r_.__value_.__l.__size_;
            break;
          case 3:
            goto LABEL_92;
          case 4:
            *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = *(_OWORD *)&v104.__r_.__value_.__r.__words[1];
            v94 = v105;
            v105 = 0;
            *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = 0uLL;
            v95.__r_.__value_.__r.__words[0] = (std::string::size_type)&v104.__r_.__value_.__l.__size_;
            sub_1DF28BFB0((void ***)&v95);
            break;
          default:
            break;
        }
      }
      else
      {
        if (LODWORD(__p.__r_.__value_.__l.__data_) == 4)
        {
          v95.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p.__r_.__value_.__l.__size_;
          sub_1DF28BFB0((void ***)&v95);
          goto LABEL_89;
        }
        LODWORD(__p.__r_.__value_.__l.__data_) = 3;
LABEL_92:
        *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = *(_OWORD *)&v104.__r_.__value_.__r.__words[1];
        v94 = v105;
        v105 = 0;
        *(_OWORD *)&v104.__r_.__value_.__r.__words[1] = 0uLL;
      }
      if (SHIBYTE(v90) < 0)
        operator delete(v89[0]);
      v54 = v103;
      v55 = &v102;
      if ((v103 & 0x80u) != 0)
      {
        v54 = v102.n128_u64[1];
        v55 = (__n128 *)v102.n128_u64[0];
      }
      v7 = (__n128 *)((char *)v55 + v54);
      goto LABEL_118;
    }
LABEL_49:
    LODWORD(v104.__r_.__value_.__l.__data_) = 0;
    v27 = a2[1];
    if (v27 >= a2[2])
    {
      v28 = sub_1DF2878C0(a2, (uint64_t)v100, (char *)&unk_1DF29028E, (int *)&v104);
    }
    else
    {
      sub_1DF2879E4((_DWORD)a2 + 16, a2[1], (uint64_t)v100, (char *)&unk_1DF29028E, (int *)&v104);
      v28 = v27 + 120;
      a2[1] = v27 + 120;
    }
    a2[1] = v28;
    sub_1DF287530(v28 - 120, &__p);
    if (*(_BYTE *)(a1 + 32))
    {
      LODWORD(v104.__r_.__value_.__l.__data_) = 1;
      v104.__r_.__value_.__s.__data_[8] = 1;
      sub_1DF281F48((uint64_t)__p.__r_.__value_.__l.__data_, (int *)&v104);
      if (LODWORD(v104.__r_.__value_.__l.__data_) == 4)
      {
        v96.__r_.__value_.__r.__words[0] = (std::string::size_type)&v104.__r_.__value_.__l.__size_;
        sub_1DF28BFB0((void ***)&v96);
      }
      else if (LODWORD(v104.__r_.__value_.__l.__data_) == 3 && SHIBYTE(v105) < 0)
      {
        operator delete((void *)v104.__r_.__value_.__l.__size_);
      }
    }
    v29 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(_OWORD *)&v96.__r_.__value_.__l.__data_ = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    v30 = __p.__r_.__value_.__l.__size_;
    if (__p.__r_.__value_.__l.__size_)
    {
      v31 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
      do
        v32 = __ldxr(v31);
      while (__stxr(v32 + 1, v31));
    }
    v33 = a3[1];
    v34 = (unint64_t)a3[2];
    if ((unint64_t)v33 >= v34)
    {
      v87 = v29;
      v36 = (v33 - *a3) >> 4;
      v37 = v36 + 1;
      if ((unint64_t)(v36 + 1) >> 60)
        sub_1DF271380();
      v38 = v34 - (_QWORD)*a3;
      if (v38 >> 3 > v37)
        v37 = v38 >> 3;
      if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF0)
        v39 = 0xFFFFFFFFFFFFFFFLL;
      else
        v39 = v37;
      v106 = a3 + 2;
      v40 = (char *)sub_1DF271778(v86, v39);
      v42 = &v40[16 * v36];
      *(_OWORD *)v42 = v87;
      v44 = *a3;
      v43 = a3[1];
      if (v43 == *a3)
      {
        v47 = vdupq_n_s64((unint64_t)v43);
        v45 = &v40[16 * v36];
      }
      else
      {
        v45 = &v40[16 * v36];
        do
        {
          v46 = *((_OWORD *)v43 - 1);
          v43 -= 16;
          *((_OWORD *)v45 - 1) = v46;
          v45 -= 16;
          *(_QWORD *)v43 = 0;
          *((_QWORD *)v43 + 1) = 0;
        }
        while (v43 != v44);
        v47 = *(int64x2_t *)a3;
      }
      v35 = v42 + 16;
      *a3 = v45;
      a3[1] = v42 + 16;
      *(int64x2_t *)&v104.__r_.__value_.__r.__words[1] = v47;
      v48 = a3[2];
      a3[2] = &v40[16 * v41];
      v105 = v48;
      v104.__r_.__value_.__r.__words[0] = v47.i64[0];
      sub_1DF2820F0((uint64_t)&v104);
    }
    else
    {
      *(_QWORD *)v33 = v29;
      *((_QWORD *)v33 + 1) = v30;
      v35 = v33 + 16;
    }
    a3[1] = v35;
    v49 = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
    if (__p.__r_.__value_.__l.__size_)
    {
      v50 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      goto LABEL_158;
    }
LABEL_160:
    if (v97)
    {
      v98 = (uint64_t *)v97;
      operator delete(v97);
    }
    if (v101 < 0)
      operator delete((void *)v100[0]);
    v5 = v103;
    if ((v103 & 0x80) == 0)
      continue;
    break;
  }
LABEL_6:
  if (v7 != (__n128 *)(v102.n128_u64[0] + v102.n128_u64[1]))
    goto LABEL_7;
  operator delete((void *)v102.n128_u64[0]);
}

void sub_1DF286858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,void *__p,uint64_t a44)
{
  uint64_t v44;

  if (*(char *)(v44 - 121) < 0)
    operator delete(*(void **)(v44 - 144));
  if (__p)
  {
    a44 = (uint64_t)__p;
    operator delete(__p);
  }
  if (*(char *)(v44 - 169) < 0)
    operator delete(*(void **)(v44 - 192));
  sub_1DF271804((void ***)&a23);
  if (*(char *)(v44 - 145) < 0)
    operator delete(*(void **)(v44 - 168));
  _Unwind_Resume(a1);
}

void sub_1DF2869A4(__int128 *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  __int128 v6;
  _QWORD v7[3];
  void **v8;

  v4 = operator new(0x38uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_1EA9838A8;
  v5 = *((_QWORD *)a1 + 2);
  v6 = *a1;
  *((_QWORD *)a1 + 1) = 0;
  *((_QWORD *)a1 + 2) = 0;
  *(_QWORD *)a1 = 0;
  *((_OWORD *)v4 + 2) = v6;
  v4[6] = v5;
  memset(v7, 0, sizeof(v7));
  v4[3] = off_1EA9832D8;
  v8 = (void **)v7;
  sub_1DF271804(&v8);
  *a2 = v4 + 3;
  a2[1] = v4;
}

void sub_1DF286A34(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA9838A8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DF286A44(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA9838A8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF286A74(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 48))(a1 + 24);
}

uint64_t sub_1DF286A84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v7;

  v3 = *(uint64_t **)(a1 + 8);
  v4 = *(uint64_t **)(a1 + 16);
  while (v3 != v4)
  {
    v7 = *v3;
    v3 += 2;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 16))(v7, a2, a3);
  }
  return 1;
}

uint64_t sub_1DF286ADC(uint64_t a1)
{
  void **v3;

  *(_QWORD *)a1 = off_1EA983010;
  v3 = (void **)(a1 + 8);
  sub_1DF271804(&v3);
  return a1;
}

uint64_t sub_1DF286B20(uint64_t a1)
{
  void **v3;

  *(_QWORD *)a1 = off_1EA983010;
  v3 = (void **)(a1 + 8);
  sub_1DF271804(&v3);
  return MEMORY[0x1E0BFC7D0](a1, 0xA1C4030951706);
}

void sub_1DF286B78(__int128 *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  __int128 v6;
  _QWORD v7[3];
  void **v8;

  v4 = operator new(0x38uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_1EA9838E0;
  v5 = *((_QWORD *)a1 + 2);
  v6 = *a1;
  *((_QWORD *)a1 + 1) = 0;
  *((_QWORD *)a1 + 2) = 0;
  *(_QWORD *)a1 = 0;
  *((_OWORD *)v4 + 2) = v6;
  v4[6] = v5;
  memset(v7, 0, sizeof(v7));
  v4[3] = off_1EA983338;
  v8 = (void **)v7;
  sub_1DF271804(&v8);
  *a2 = v4 + 3;
  a2[1] = v4;
}

void sub_1DF286C08(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA9838E0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DF286C18(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA9838E0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF286C48(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 48))(a1 + 24);
}

void sub_1DF286C58(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA983790;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DF286C68(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA983790;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF286C98(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 48))(a1 + 24);
}

uint64_t sub_1DF286CA8(uint64_t a1)
{
  void **v3;

  *(_QWORD *)a1 = off_1EA983010;
  v3 = (void **)(a1 + 8);
  sub_1DF271804(&v3);
  return a1;
}

uint64_t sub_1DF286CEC(uint64_t a1)
{
  void **v3;

  *(_QWORD *)a1 = off_1EA983010;
  v3 = (void **)(a1 + 8);
  sub_1DF271804(&v3);
  return MEMORY[0x1E0BFC7D0](a1, 0xA1C4030951706);
}

uint64_t sub_1DF286D44(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void sub_1DF286D94(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t *v4;
  uint64_t v5;
  void *__p[2];
  uint64_t v7;
  uint64_t *v8;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v8 = a3;
  if (a1 != a2)
  {
    v4 = a1;
    do
    {
      v5 = *v4;
      if (*(char *)(*v4 + 111) < 0)
      {
        sub_1DF279470(__p, *(void **)(v5 + 88), *(_QWORD *)(v5 + 96));
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)(v5 + 88);
        v7 = *(_QWORD *)(v5 + 104);
      }
      sub_1DF287180(&v8, (__int128 *)__p);
      if (SHIBYTE(v7) < 0)
        operator delete(__p[0]);
      ++v4;
    }
    while (v4 != a2);
  }
}

void sub_1DF286E30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  sub_1DF28BFB0((void ***)&a17);
  _Unwind_Resume(a1);
}

char *sub_1DF286E60@<X0>(char *result@<X0>, char *a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  char *v7;
  __int128 v8;
  char *i;
  int v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  int v13;
  const std::string::value_type *v14;
  std::string::size_type v15;

  if (result == a2)
  {
    a4->__r_.__value_.__r.__words[0] = 0;
    a4->__r_.__value_.__l.__size_ = 0;
    a4->__r_.__value_.__r.__words[2] = 0;
  }
  else
  {
    v7 = result;
    if (result[23] < 0)
    {
      result = (char *)sub_1DF279470(a4, *(void **)result, *((_QWORD *)result + 1));
    }
    else
    {
      v8 = *(_OWORD *)result;
      a4->__r_.__value_.__r.__words[2] = *((_QWORD *)result + 2);
      *(_OWORD *)&a4->__r_.__value_.__l.__data_ = v8;
    }
    for (i = v7 + 24; i != a2; i += 24)
    {
      v10 = *(char *)(a3 + 23);
      if (v10 >= 0)
        v11 = (const std::string::value_type *)a3;
      else
        v11 = *(const std::string::value_type **)a3;
      if (v10 >= 0)
        v12 = *(unsigned __int8 *)(a3 + 23);
      else
        v12 = *(_QWORD *)(a3 + 8);
      std::string::append(a4, v11, v12);
      v13 = i[23];
      if (v13 >= 0)
        v14 = i;
      else
        v14 = *(const std::string::value_type **)i;
      if (v13 >= 0)
        v15 = i[23];
      else
        v15 = *((_QWORD *)i + 1);
      result = (char *)std::string::append(a4, v14, v15);
    }
  }
  return result;
}

void sub_1DF286F1C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1DF286F3C(char **a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  __int128 v19;
  int64x2_t v20;
  char *v21;
  uint64_t v22;
  int64x2_t v23;
  char *v24;
  uint64_t v25;

  v6 = (unint64_t)a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(result - 8);
  if ((unint64_t)v7 >= v6)
  {
    v9 = (v7 - *a1) >> 4;
    if ((unint64_t)(v9 + 1) >> 60)
      sub_1DF271380();
    v10 = v5 - (_QWORD)*a1;
    v11 = v10 >> 3;
    if (v10 >> 3 <= (unint64_t)(v9 + 1))
      v11 = v9 + 1;
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    v25 = result;
    v13 = (char *)sub_1DF271778(result, v12);
    v15 = &v13[16 * v9];
    *(_OWORD *)v15 = *(_OWORD *)a2;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    v17 = *a1;
    v16 = a1[1];
    if (v16 == *a1)
    {
      v20 = vdupq_n_s64((unint64_t)v16);
      v18 = &v13[16 * v9];
    }
    else
    {
      v18 = &v13[16 * v9];
      do
      {
        v19 = *((_OWORD *)v16 - 1);
        v16 -= 16;
        *((_OWORD *)v18 - 1) = v19;
        v18 -= 16;
        *(_QWORD *)v16 = 0;
        *((_QWORD *)v16 + 1) = 0;
      }
      while (v16 != v17);
      v20 = *(int64x2_t *)a1;
    }
    v8 = v15 + 16;
    *a1 = v18;
    a1[1] = v15 + 16;
    v23 = v20;
    v21 = a1[2];
    a1[2] = &v13[16 * v14];
    v24 = v21;
    v22 = v20.i64[0];
    result = sub_1DF2820F0((uint64_t)&v22);
  }
  else
  {
    *(_OWORD *)v7 = *(_OWORD *)a2;
    v8 = v7 + 16;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  a1[1] = v8;
  return result;
}

void sub_1DF287044(_QWORD *a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  if (*(char *)(*a1 + 23) < 0)
    operator delete(*(void **)v4);
  v5 = *a2;
  *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)v4 = v5;
  *((_BYTE *)a2 + 23) = 0;
  *(_BYTE *)a2 = 0;
  v6 = a1[1];
  if (*(char *)(v6 + 23) < 0)
    operator delete(*(void **)v6);
  v7 = *(__int128 *)((char *)a2 + 24);
  *(_QWORD *)(v6 + 16) = *((_QWORD *)a2 + 5);
  *(_OWORD *)v6 = v7;
  *((_BYTE *)a2 + 47) = 0;
  *((_BYTE *)a2 + 24) = 0;
  v8 = *((_QWORD *)a2 + 6);
  v13[0] = *((_QWORD *)a2 + 7);
  *(_QWORD *)((char *)v13 + 7) = *(_QWORD *)((char *)a2 + 63);
  v9 = *((_BYTE *)a2 + 71);
  *((_QWORD *)a2 + 7) = 0;
  *((_QWORD *)a2 + 8) = 0;
  *((_QWORD *)a2 + 6) = 0;
  v14[0] = v13[0];
  *(_QWORD *)((char *)v14 + 7) = *(_QWORD *)((char *)v13 + 7);
  v10 = a1[2];
  if (*(_DWORD *)v10 == 4)
  {
    v12 = (void **)(v10 + 8);
    sub_1DF28BFB0(&v12);
  }
  else if (*(_DWORD *)v10 == 3 && *(char *)(v10 + 31) < 0)
  {
    operator delete(*(void **)(v10 + 8));
  }
  *(_DWORD *)v10 = 3;
  v11 = v14[0];
  *(_QWORD *)(v10 + 8) = v8;
  *(_QWORD *)(v10 + 16) = v11;
  *(_QWORD *)(v10 + 23) = *(_QWORD *)((char *)v14 + 7);
  *(_BYTE *)(v10 + 31) = v9;
}

uint64_t **sub_1DF287180(uint64_t **a1, __int128 *a2)
{
  uint64_t *v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  _QWORD v20[5];

  v4 = *a1;
  v5 = (*a1)[1];
  v6 = *a1;
  v9 = v6[2];
  v7 = (uint64_t)(v6 + 2);
  v8 = v9;
  if (v5 >= v9)
  {
    v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *v4) >> 3);
    v13 = v12 + 1;
    if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
      sub_1DF271380();
    v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v8 - *v4) >> 3);
    if (2 * v14 > v13)
      v13 = 2 * v14;
    if (v14 >= 0x555555555555555)
      v15 = 0xAAAAAAAAAAAAAAALL;
    else
      v15 = v13;
    v20[4] = v7;
    if (v15)
      v16 = (char *)sub_1DF274E5C(v7, v15);
    else
      v16 = 0;
    v17 = &v16[24 * v12];
    v20[0] = v16;
    v20[1] = v17;
    v20[3] = &v16[24 * v15];
    v18 = *a2;
    *((_QWORD *)v17 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v17 = v18;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v20[2] = v17 + 24;
    sub_1DF2794FC(v4, v20);
    v11 = v4[1];
    sub_1DF279684((uint64_t)v20);
  }
  else
  {
    v10 = *a2;
    *(_QWORD *)(v5 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v5 = v10;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v11 = v5 + 24;
    v4[1] = v5 + 24;
  }
  v4[1] = v11;
  return a1;
}

void sub_1DF2872B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DF279684((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1DF2872C4(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF2872E8(uint64_t *a1, char *a2, uint64_t a3, int *a4)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  void *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t *v18;

  v5 = 0xEEEEEEEEEEEEEEEFLL * ((a1[1] - *a1) >> 3);
  v6 = v5 + 1;
  if (v5 + 1 > 0x222222222222222)
    sub_1DF271380();
  if (0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3) > v6)
    v6 = 0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3);
  if (0xEEEEEEEEEEEEEEEFLL * ((a1[2] - *a1) >> 3) >= 0x111111111111111)
    v10 = 0x222222222222222;
  else
    v10 = v6;
  v18 = a1 + 2;
  if (v10)
    v11 = (char *)sub_1DF282BC8((uint64_t)(a1 + 2), v10);
  else
    v11 = 0;
  v14 = v11;
  v15 = &v11[120 * v5];
  v17 = &v11[120 * v10];
  sub_1DF28740C((_DWORD)a1 + 16, (uint64_t)v15, a2, a3, a4);
  v16 = v15 + 120;
  sub_1DF282B54(a1, &v14);
  v12 = a1[1];
  sub_1DF282DCC(&v14);
  return v12;
}

void sub_1DF2873F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DF282DCC((void **)va);
  _Unwind_Resume(a1);
}

void sub_1DF28740C(int a1, uint64_t a2, char *__s, uint64_t a4, int *a5)
{
  int v8;
  int v9;
  void *__p;
  char v11;
  void *__dst[2];
  uint64_t v13;
  void *v14[2];
  char v15;
  void **p_p;

  sub_1DF28BE7C(v14, __s);
  if (*(char *)(a4 + 23) < 0)
  {
    sub_1DF279470(__dst, *(void **)a4, *(_QWORD *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)a4;
    v13 = *(_QWORD *)(a4 + 16);
  }
  v8 = *a5;
  v9 = 1;
  LOBYTE(__p) = 0;
  sub_1DF282E40(a2, (__int128 *)v14, (__int128 *)__dst, v8, (uint64_t)&v9);
  if (v9 == 4)
  {
    p_p = &__p;
    sub_1DF28BFB0(&p_p);
  }
  else if (v9 == 3 && v11 < 0)
  {
    operator delete(__p);
  }
  if (SHIBYTE(v13) < 0)
    operator delete(__dst[0]);
  if (v15 < 0)
    operator delete(v14[0]);
}

void sub_1DF2874F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_1DF287530@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0x90uLL);
  result = sub_1DF287588(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_1DF287574(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF287588(_QWORD *a1, uint64_t a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_1EA983800;
  sub_1DF287638((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_1DF2875BC(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1DF2875D0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA983800;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DF2875E0(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA983800;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1E0BFC7D0);
}

void sub_1DF287610(uint64_t a1)
{
  char v1;

  sub_1DF282D34((uint64_t)&v1, a1 + 24);
}

uint64_t sub_1DF287638(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  _BYTE *v6;
  __int128 v7;

  v4 = sub_1DF287704(a1, a2);
  *(_QWORD *)v4 = off_1EA9831D0;
  if (*(char *)(a2 + 87) < 0)
  {
    sub_1DF279470((_BYTE *)(v4 + 64), *(void **)(a2 + 64), *(_QWORD *)(a2 + 72));
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 64);
    *(_QWORD *)(v4 + 80) = *(_QWORD *)(a2 + 80);
    *(_OWORD *)(v4 + 64) = v5;
  }
  v6 = (_BYTE *)(a1 + 88);
  if (*(char *)(a2 + 111) < 0)
  {
    sub_1DF279470(v6, *(void **)(a2 + 88), *(_QWORD *)(a2 + 96));
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
    *(_OWORD *)v6 = v7;
  }
  *(_DWORD *)(a1 + 112) = *(_DWORD *)(a2 + 112);
  return a1;
}

void sub_1DF2876D8(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 87) < 0)
    operator delete(*v2);
  sub_1DF283134(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF287704(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  int v5;
  char *v6;
  __int128 v7;

  *(_QWORD *)a1 = off_1EA982FB8;
  if (*(char *)(a2 + 31) < 0)
  {
    sub_1DF279470((_BYTE *)(a1 + 8), *(void **)(a2 + 8), *(_QWORD *)(a2 + 16));
  }
  else
  {
    v4 = *(_OWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = v4;
  }
  v5 = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a1 + 32) = v5;
  v6 = (char *)(a1 + 40);
  switch(v5)
  {
    case 1:
      *v6 = *(_BYTE *)(a2 + 40);
      break;
    case 2:
      *(_QWORD *)v6 = *(_QWORD *)(a2 + 40);
      break;
    case 3:
      if (*(char *)(a2 + 63) < 0)
      {
        sub_1DF279470(v6, *(void **)(a2 + 40), *(_QWORD *)(a2 + 48));
      }
      else
      {
        v7 = *(_OWORD *)(a2 + 40);
        *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
        *(_OWORD *)v6 = v7;
      }
      break;
    case 4:
      *(_QWORD *)v6 = 0;
      *(_QWORD *)(a1 + 48) = 0;
      *(_QWORD *)(a1 + 56) = 0;
      sub_1DF28BF2C(v6, *(__int128 **)(a2 + 40), *(__int128 **)(a2 + 48), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 48) - *(_QWORD *)(a2 + 40)) >> 3));
      break;
    default:
      return a1;
  }
  return a1;
}

void sub_1DF287804(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_1DF287820@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0x90uLL);
  result = sub_1DF287878(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_1DF287864(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF287878(_QWORD *a1, uint64_t a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_1EA983800;
  sub_1DF287638((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_1DF2878AC(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF2878C0(uint64_t *a1, uint64_t a2, char *a3, int *a4)
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  void *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t *v18;

  v5 = 0xEEEEEEEEEEEEEEEFLL * ((a1[1] - *a1) >> 3);
  v6 = v5 + 1;
  if (v5 + 1 > 0x222222222222222)
    sub_1DF271380();
  if (0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3) > v6)
    v6 = 0xDDDDDDDDDDDDDDDELL * ((a1[2] - *a1) >> 3);
  if (0xEEEEEEEEEEEEEEEFLL * ((a1[2] - *a1) >> 3) >= 0x111111111111111)
    v10 = 0x222222222222222;
  else
    v10 = v6;
  v18 = a1 + 2;
  if (v10)
    v11 = (char *)sub_1DF282BC8((uint64_t)(a1 + 2), v10);
  else
    v11 = 0;
  v14 = v11;
  v15 = &v11[120 * v5];
  v17 = &v11[120 * v10];
  sub_1DF2879E4((_DWORD)a1 + 16, (uint64_t)v15, a2, a3, a4);
  v16 = v15 + 120;
  sub_1DF282B54(a1, &v14);
  v12 = a1[1];
  sub_1DF282DCC(&v14);
  return v12;
}

void sub_1DF2879D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DF282DCC((void **)va);
  _Unwind_Resume(a1);
}

void sub_1DF2879E4(int a1, uint64_t a2, uint64_t a3, char *__s, int *a5)
{
  int v8;
  int v9;
  void *__p;
  char v11;
  void *v12[2];
  char v13;
  void *__dst[2];
  uint64_t v15;
  void **p_p;

  if (*(char *)(a3 + 23) < 0)
  {
    sub_1DF279470(__dst, *(void **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)a3;
    v15 = *(_QWORD *)(a3 + 16);
  }
  sub_1DF28BE7C(v12, __s);
  v8 = *a5;
  v9 = 1;
  LOBYTE(__p) = 0;
  sub_1DF282E40(a2, (__int128 *)__dst, (__int128 *)v12, v8, (uint64_t)&v9);
  if (v9 == 4)
  {
    p_p = &__p;
    sub_1DF28BFB0(&p_p);
  }
  else if (v9 == 3 && v11 < 0)
  {
    operator delete(__p);
  }
  if (v13 < 0)
    operator delete(v12[0]);
  if (SHIBYTE(v15) < 0)
    operator delete(__dst[0]);
}

void sub_1DF287ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  sub_1DF28202C((uint64_t)&a10);
  if (a19 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF287B08@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0x58uLL);
  result = sub_1DF287B60(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_1DF287B4C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF287B60(_QWORD *a1, uint64_t a2)
{
  char v4;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_1EA983870;
  sub_1DF287C0C((uint64_t)&v4, (uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_1DF287BA8(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1DF287BBC(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA983870;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DF287BCC(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA983870;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF287BFC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 48))(a1 + 24);
}

void sub_1DF287C0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  void *__p;
  char v6;
  void *v7[2];
  uint64_t v8;
  void **p_p;

  *(_OWORD *)v7 = *(_OWORD *)a3;
  v8 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)a3 = 0;
  v4 = 0;
  sub_1DF283088(a2, (__n128 *)v7, &v4);
  *v3 = off_1EA983280;
  if (v4 == 4)
  {
    p_p = &__p;
    sub_1DF28BFB0(&p_p);
  }
  else if (v4 == 3 && v6 < 0)
  {
    operator delete(__p);
  }
  if (SHIBYTE(v8) < 0)
    operator delete(v7[0]);
}

uint64_t sub_1DF287CB0(uint64_t a1)
{
  int v2;
  void **v4;

  *(_QWORD *)a1 = off_1EA982FB8;
  v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    v4 = (void **)(a1 + 40);
    sub_1DF28BFB0(&v4);
  }
  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

uint64_t sub_1DF287D2C(uint64_t a1)
{
  int v2;
  void **v4;

  *(_QWORD *)a1 = off_1EA982FB8;
  v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    v4 = (void **)(a1 + 40);
    sub_1DF28BFB0(&v4);
  }
  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return MEMORY[0x1E0BFC7D0](a1, 0x10B3C40F41401DALL);
}

void sub_1DF287DBC(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  const void **v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  __int128 v16;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v4 = *(const void ***)a2;
  v5 = *(_QWORD *)(a2 + 8) - *(_QWORD *)a2;
  if (v5)
  {
    v7 = 0;
    v8 = v5 >> 4;
    if (v8 <= 1)
      v9 = 1;
    else
      v9 = v8;
    while (1)
    {
      if (*v4)
      {
        v10 = __dynamic_cast(*v4, (const struct __class_type_info *)&unk_1EA982BA8, (const struct __class_type_info *)&unk_1EA982BB8, 0);
        if (v10)
          break;
      }
      ++v7;
      v4 += 2;
      if (v9 == v7)
        return;
    }
    v11 = v10;
    *a3 = v7;
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
    sub_1DF287EE4(v12, (uint64_t)v11 + 32, &v16);
    sub_1DF28208C((uint64_t)(a3 + 1), &v16);
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
    if (*((_QWORD *)&v16 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
  }
}

void sub_1DF287ED0(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1DF2717AC(v1 + 8);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF287EE4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0x58uLL);
  result = sub_1DF287F44(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_1DF287F30(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF287F44(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char v5;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_1EA983870;
  sub_1DF287FA4((uint64_t)&v5, a1 + 3, a2, a3);
  return a1;
}

void sub_1DF287F90(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1DF287FA4(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  int v6;
  __int128 __p;
  uint64_t v8;
  void *__dst[2];
  uint64_t v10;
  void **p_p;

  if (*(char *)(a3 + 23) < 0)
  {
    sub_1DF279470(__dst, *(void **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)a3;
    v10 = *(_QWORD *)(a3 + 16);
  }
  v6 = *(_DWORD *)a4;
  switch(v6)
  {
    case 1:
      LOBYTE(__p) = *(_BYTE *)(a4 + 8);
      break;
    case 2:
      *(_QWORD *)&__p = *(_QWORD *)(a4 + 8);
      break;
    case 3:
      if (*(char *)(a4 + 31) < 0)
      {
        sub_1DF279470(&__p, *(void **)(a4 + 8), *(_QWORD *)(a4 + 16));
      }
      else
      {
        __p = *(_OWORD *)(a4 + 8);
        v8 = *(_QWORD *)(a4 + 24);
      }
      break;
    case 4:
      __p = 0uLL;
      v8 = 0;
      sub_1DF28BF2C((char *)&__p, *(__int128 **)(a4 + 8), *(__int128 **)(a4 + 16), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a4 + 16) - *(_QWORD *)(a4 + 8)) >> 3));
      break;
    default:
      break;
  }
  sub_1DF283088((uint64_t)a2, (__n128 *)__dst, &v6);
  *a2 = off_1EA983280;
  if (v6 == 4)
  {
    p_p = (void **)&__p;
    sub_1DF28BFB0(&p_p);
  }
  else if (v6 == 3 && SHIBYTE(v8) < 0)
  {
    operator delete((void *)__p);
  }
  if (SHIBYTE(v10) < 0)
    operator delete(__dst[0]);
}

void sub_1DF288100(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_1DF28811C@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0x58uLL);
  result = sub_1DF288174(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_1DF288160(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF288174(_QWORD *a1, uint64_t a2)
{
  char v4;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_1EA983838;
  sub_1DF288220((uint64_t)&v4, a1 + 3, a2);
  return a1;
}

void sub_1DF2881BC(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1DF2881D0(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA983838;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DF2881E0(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA983838;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF288210(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 48))(a1 + 24);
}

void sub_1DF288220(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  int v3;
  void *__p;
  char v5;
  void *v6[2];
  uint64_t v7;
  void **p_p;

  *(_OWORD *)v6 = *(_OWORD *)a3;
  v7 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)a3 = 0;
  v3 = 1;
  LOBYTE(__p) = 0;
  sub_1DF2882C0(a2, (uint64_t)v6, (uint64_t)&v3);
  if (v3 == 4)
  {
    p_p = &__p;
    sub_1DF28BFB0(&p_p);
  }
  else if (v3 == 3 && v5 < 0)
  {
    operator delete(__p);
  }
  if (SHIBYTE(v7) < 0)
    operator delete(v6[0]);
}

_QWORD *sub_1DF2882C0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  int v5;
  void *__p[2];
  uint64_t v7;
  void *v8[2];
  uint64_t v9;
  void **v10;

  *(_OWORD *)v8 = *(_OWORD *)a2;
  v9 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  v5 = *(_DWORD *)a3;
  switch(v5)
  {
    case 1:
      LOBYTE(__p[0]) = *(_BYTE *)(a3 + 8);
      break;
    case 2:
      __p[0] = *(void **)(a3 + 8);
      break;
    case 3:
      *(_OWORD *)__p = *(_OWORD *)(a3 + 8);
      v7 = *(_QWORD *)(a3 + 24);
      goto LABEL_6;
    case 4:
      *(_OWORD *)__p = *(_OWORD *)(a3 + 8);
      v7 = *(_QWORD *)(a3 + 24);
LABEL_6:
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)(a3 + 24) = 0;
      *(_QWORD *)(a3 + 8) = 0;
      break;
    default:
      break;
  }
  sub_1DF283088((uint64_t)a1, (__n128 *)v8, &v5);
  *a1 = off_1EA983280;
  if (v5 == 4)
  {
    v10 = __p;
    sub_1DF28BFB0(&v10);
  }
  else if (v5 == 3 && SHIBYTE(v7) < 0)
  {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v9) < 0)
    operator delete(v8[0]);
  *a1 = off_1EA983228;
  return a1;
}

uint64_t sub_1DF2883E4(uint64_t a1)
{
  int v2;
  void **v4;

  *(_QWORD *)a1 = off_1EA982FB8;
  v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    v4 = (void **)(a1 + 40);
    sub_1DF28BFB0(&v4);
  }
  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

uint64_t sub_1DF288460(uint64_t a1)
{
  int v2;
  void **v4;

  *(_QWORD *)a1 = off_1EA982FB8;
  v2 = *(_DWORD *)(a1 + 32);
  if (v2 == 4)
  {
    v4 = (void **)(a1 + 40);
    sub_1DF28BFB0(&v4);
  }
  else if (v2 == 3 && *(char *)(a1 + 63) < 0)
  {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return MEMORY[0x1E0BFC7D0](a1, 0x10B3C40F41401DALL);
}

void sub_1DF2884F0(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  const void **v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  __int128 v14;
  void *v15;
  void *v16;
  int v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  void **v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  BOOL v28;
  _BOOL4 v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  __int128 v34;
  void *__dst[2];
  uint64_t v36;
  int v37;
  void *__p[2];
  uint64_t v39;
  void **v40;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v4 = *(const void ***)a2;
  v5 = *(_QWORD *)(a2 + 8) - *(_QWORD *)a2;
  if (v5)
  {
    v7 = 0;
    v8 = v5 >> 4;
    if (v8 <= 1)
      v9 = 1;
    else
      v9 = v8;
    while (1)
    {
      if (*v4)
      {
        v10 = (unsigned __int8 *)__dynamic_cast(*v4, (const struct __class_type_info *)&unk_1EA982BA8, (const struct __class_type_info *)&unk_1EA982BB8, 0);
        if (v10)
          break;
      }
      ++v7;
      v4 += 2;
      if (v9 == v7)
        return;
    }
    v11 = v10;
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
    if (*(char *)(v12 + 23) < 0)
    {
      sub_1DF279470(__dst, *(void **)v12, *(_QWORD *)(v12 + 8));
    }
    else
    {
      v14 = *(_OWORD *)v12;
      v36 = *(_QWORD *)(v12 + 16);
      *(_OWORD *)__dst = v14;
    }
    v37 = 3;
    *(_OWORD *)__p = *(_OWORD *)__dst;
    v39 = v36;
    __dst[0] = 0;
    __dst[1] = 0;
    v36 = 0;
    if (*((_DWORD *)v11 + 8) != 3)
      goto LABEL_31;
    if (v39 >= 0)
      v15 = (void *)HIBYTE(v39);
    else
      v15 = __p[1];
    v16 = (void *)v11[63];
    v17 = (char)v16;
    if ((char)v16 < 0)
      v16 = (void *)*((_QWORD *)v11 + 6);
    if (v15 == v16)
    {
      v20 = (unsigned __int8 *)*((_QWORD *)v11 + 5);
      v19 = v11 + 40;
      v18 = v20;
      if (v17 >= 0)
        v13 = v19;
      else
        v13 = v18;
      if (v39 < 0)
      {
        v29 = memcmp(__p[0], v13, (size_t)__p[1]) == 0;
      }
      else if (HIBYTE(v39))
      {
        v21 = __p;
        v22 = HIBYTE(v39) - 1;
        do
        {
          v24 = *(unsigned __int8 *)v21;
          v21 = (void **)((char *)v21 + 1);
          v23 = v24;
          v26 = *v13++;
          v25 = v26;
          v28 = v22-- != 0;
          v29 = v23 == v25;
        }
        while (v23 == v25 && v28);
      }
      else
      {
        v29 = 1;
      }
    }
    else
    {
LABEL_31:
      v29 = 0;
    }
    if (SHIBYTE(v39) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v36) < 0)
    {
      operator delete(__dst[0]);
      if (!v29)
        return;
    }
    else if (!v29)
    {
      return;
    }
    *a3 = v7;
    v30 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(_QWORD *)a1 + 24))(a1, v13);
    v37 = 1;
    LOBYTE(__p[0]) = 1;
    sub_1DF288798(v30, &v37, &v34);
    sub_1DF28208C((uint64_t)(a3 + 1), &v34);
    v31 = (std::__shared_weak_count *)*((_QWORD *)&v34 + 1);
    if (*((_QWORD *)&v34 + 1))
    {
      v32 = (unint64_t *)(*((_QWORD *)&v34 + 1) + 8);
      do
        v33 = __ldaxr(v32);
      while (__stlxr(v33 - 1, v32));
      if (!v33)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
    }
    if (v37 == 4)
    {
      v40 = __p;
      sub_1DF28BFB0(&v40);
    }
    else if (v37 == 3 && SHIBYTE(v39) < 0)
    {
      operator delete(__p[0]);
    }
  }
}

void sub_1DF288770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  va_list va;

  va_start(va, a6);
  sub_1DF28202C((uint64_t)va);
  sub_1DF2717AC(v6 + 8);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF288798@<X0>(uint64_t a1@<X1>, int *a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0x58uLL);
  result = sub_1DF2887F8(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_1DF2887E4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF2887F8(_QWORD *a1, uint64_t a2, int *a3)
{
  char v5;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_1EA983838;
  sub_1DF288858((uint64_t)&v5, a1 + 3, a2, a3);
  return a1;
}

void sub_1DF288844(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1DF288858(uint64_t a1, _QWORD *a2, uint64_t a3, int *a4)
{
  int v6;
  void *__p[2];
  uint64_t v8;
  void *__dst[2];
  uint64_t v10;
  void **v11;

  if (*(char *)(a3 + 23) < 0)
  {
    sub_1DF279470(__dst, *(void **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)a3;
    v10 = *(_QWORD *)(a3 + 16);
  }
  v6 = *a4;
  switch(v6)
  {
    case 1:
      LOBYTE(__p[0]) = *((_BYTE *)a4 + 8);
      break;
    case 2:
      __p[0] = *((void **)a4 + 1);
      break;
    case 3:
      *(_OWORD *)__p = *(_OWORD *)(a4 + 2);
      v8 = *((_QWORD *)a4 + 3);
      goto LABEL_9;
    case 4:
      *(_OWORD *)__p = *(_OWORD *)(a4 + 2);
      v8 = *((_QWORD *)a4 + 3);
LABEL_9:
      *((_QWORD *)a4 + 2) = 0;
      *((_QWORD *)a4 + 3) = 0;
      *((_QWORD *)a4 + 1) = 0;
      break;
    default:
      break;
  }
  sub_1DF2882C0(a2, (uint64_t)__dst, (uint64_t)&v6);
  if (v6 == 4)
  {
    v11 = __p;
    sub_1DF28BFB0(&v11);
  }
  else if (v6 == 3 && SHIBYTE(v8) < 0)
  {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v10) < 0)
    operator delete(__dst[0]);
}

void sub_1DF28897C(__int128 *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  __int128 v6;
  _QWORD v7[3];
  void **v8;

  v4 = operator new(0x38uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_1EA983918;
  v5 = *((_QWORD *)a1 + 2);
  v6 = *a1;
  *((_QWORD *)a1 + 1) = 0;
  *((_QWORD *)a1 + 2) = 0;
  *(_QWORD *)a1 = 0;
  *((_OWORD *)v4 + 2) = v6;
  v4[6] = v5;
  memset(v7, 0, sizeof(v7));
  v4[3] = off_1EA983398;
  v8 = (void **)v7;
  sub_1DF271804(&v8);
  *a2 = v4 + 3;
  a2[1] = v4;
}

void sub_1DF288A0C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA983918;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DF288A1C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA983918;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF288A4C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 48))(a1 + 24);
}

BOOL sub_1DF288A5C(uint64_t a1, void **a2, void **a3)
{
  uint64_t v6;
  char v7;
  char v8;
  unsigned int v9;
  uint64_t v10;
  void **v11;
  void **v12;
  void **v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  _QWORD *v18;
  __int128 v19;
  _QWORD *v20;
  void ***v21;

  v19 = 0uLL;
  v20 = 0;
  sub_1DF271698((char *)&v19, *a2, a2[1], ((_BYTE *)a2[1] - (_BYTE *)*a2) >> 4);
  v17 = 0uLL;
  v18 = 0;
  sub_1DF271874((char *)&v17, *a3, a3[1], ((_BYTE *)a3[1] - (_BYTE *)*a3) >> 4);
  v6 = 0;
  v14 = 0;
  v15 = 0;
  v7 = 1;
  v8 = 1;
  v16 = 0;
  while ((v7 & 1) != 0)
  {
    v9 = (*(uint64_t (**)(_QWORD, __int128 *, __int128 *))(***(_QWORD ***)(a1 + 8) + 16))(**(_QWORD **)(a1 + 8), &v19, &v17);
    v7 = v9;
    v6 += v9;
    v10 = *((_QWORD *)&v19 + 1) - v19;
    if ((v8 & 1) == 0)
    {
      v11 = v14;
      if (v10 == v15 - (_QWORD)v14)
      {
        if ((_QWORD)v19 == *((_QWORD *)&v19 + 1))
          break;
        v12 = (void **)v19;
        while (*v12 == *v11)
        {
          v12 += 2;
          v11 += 2;
          if (v12 == *((void ***)&v19 + 1))
            goto LABEL_11;
        }
      }
    }
    sub_1DF288CD0((uint64_t)&v14, (uint64_t *)v19, *((uint64_t **)&v19 + 1), v10 >> 4);
    v8 = 0;
  }
LABEL_11:
  if (v6)
  {
    sub_1DF271914(a2);
    *(_OWORD *)a2 = v19;
    a2[2] = v20;
    v20 = 0;
    v19 = 0uLL;
    sub_1DF271914(a3);
    *(_OWORD *)a3 = v17;
    a3[2] = v18;
    v18 = 0;
    v17 = 0uLL;
  }
  v21 = &v14;
  sub_1DF271804((void ***)&v21);
  v14 = (void **)&v17;
  sub_1DF271804(&v14);
  *(_QWORD *)&v17 = &v19;
  sub_1DF271804((void ***)&v17);
  return v6 != 0;
}

void sub_1DF288BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  a13 = (void **)&a17;
  sub_1DF271804(&a13);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF288C34(uint64_t a1)
{
  void **v3;

  *(_QWORD *)a1 = off_1EA983010;
  v3 = (void **)(a1 + 8);
  sub_1DF271804(&v3);
  return a1;
}

uint64_t sub_1DF288C78(uint64_t a1)
{
  void **v3;

  *(_QWORD *)a1 = off_1EA983010;
  v3 = (void **)(a1 + 8);
  sub_1DF271804(&v3);
  return MEMORY[0x1E0BFC7D0](a1, 0xA1C4030951706);
}

uint64_t sub_1DF288CD0(uint64_t a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t *v6;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  uint64_t *v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  uint64_t *v23;

  v6 = a2;
  v8 = *(uint64_t **)a1;
  if (a4 > (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 4)
  {
    sub_1DF271914((void **)a1);
    if (a4 >> 60)
      sub_1DF271380();
    v9 = *(_QWORD *)(a1 + 16) - *(_QWORD *)a1;
    v10 = v9 >> 3;
    if (v9 >> 3 <= a4)
      v10 = a4;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF0)
      v11 = 0xFFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = (uint64_t)sub_1DF271738((_QWORD *)a1, v11);
    v13 = *(uint64_t **)(a1 + 8);
    while (v6 != a3)
    {
      v14 = v6[1];
      *v13 = *v6;
      v13[1] = v14;
      if (v14)
      {
        v15 = (unint64_t *)(v14 + 8);
        do
          v16 = __ldxr(v15);
        while (__stxr(v16 + 1, v15));
      }
      v6 += 2;
      v13 += 2;
    }
LABEL_25:
    *(_QWORD *)(a1 + 8) = v13;
    return result;
  }
  result = *(_QWORD *)(a1 + 8);
  v17 = (result - (uint64_t)v8) >> 4;
  if (v17 < a4)
  {
    v18 = &a2[2 * v17];
    if ((uint64_t *)result != v8)
    {
      v19 = 16 * v17;
      do
      {
        result = (uint64_t)sub_1DF271970(v8, v6);
        v6 += 2;
        v8 += 2;
        v19 -= 16;
      }
      while (v19);
      v8 = *(uint64_t **)(a1 + 8);
    }
    v13 = v8;
    if (v18 != a3)
    {
      v13 = v8;
      do
      {
        v20 = v18[1];
        *v13 = *v18;
        v13[1] = v20;
        if (v20)
        {
          v21 = (unint64_t *)(v20 + 8);
          do
            v22 = __ldxr(v21);
          while (__stxr(v22 + 1, v21));
        }
        v18 += 2;
        v13 += 2;
      }
      while (v18 != a3);
    }
    goto LABEL_25;
  }
  if (a2 == a3)
  {
    v23 = v8;
  }
  else
  {
    v23 = v8;
    do
    {
      sub_1DF271970(v8, v6);
      v6 += 2;
      v8 += 2;
      v23 += 2;
    }
    while (v6 != a3);
    result = *(_QWORD *)(a1 + 8);
  }
  while ((uint64_t *)result != v23)
    result = sub_1DF2717AC(result - 16);
  *(_QWORD *)(a1 + 8) = v23;
  return result;
}

void sub_1DF288E80()
{
  sub_1DF27798C("vector");
}

void sub_1DF288E94(__int128 *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  uint64_t v5;
  __int128 v6;
  _QWORD v7[3];
  void **v8;

  v4 = operator new(0x38uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_1EA9837C8;
  v5 = *((_QWORD *)a1 + 2);
  v6 = *a1;
  *((_QWORD *)a1 + 1) = 0;
  *((_QWORD *)a1 + 2) = 0;
  *(_QWORD *)a1 = 0;
  *((_OWORD *)v4 + 2) = v6;
  v4[6] = v5;
  memset(v7, 0, sizeof(v7));
  v4[3] = off_1EA983170;
  v8 = (void **)v7;
  sub_1DF271804(&v8);
  *a2 = v4 + 3;
  a2[1] = v4;
}

void sub_1DF288F24(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA9837C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DF288F34(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA9837C8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF288F64(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a1 + 24) + 48))(a1 + 24);
}

uint64_t sub_1DF288F74(uint64_t a1, _QWORD **a2, _QWORD **a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  unint64_t v20;
  void **v21;

  v18 = 0;
  v19 = 0;
  v20 = 0;
  v3 = *(_QWORD **)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 16);
  if (v3 == v4)
    goto LABEL_16;
  do
  {
    v16 = 0uLL;
    v17 = 0;
    sub_1DF271698((char *)&v16, *a2, a2[1], ((char *)a2[1] - (char *)*a2) >> 4);
    v14 = 0uLL;
    v15 = 0;
    sub_1DF271874((char *)&v14, *a3, a3[1], ((char *)a3[1] - (char *)*a3) >> 4);
    if ((*(unsigned int (**)(_QWORD, __int128 *, __int128 *))(*(_QWORD *)*v3 + 16))(*v3, &v16, &v14))
    {
      v7 = v19;
      if ((unint64_t)v19 >= v20)
      {
        v8 = sub_1DF289274((uint64_t *)&v18, (uint64_t)&v16, (uint64_t)&v14);
      }
      else
      {
        *v19 = 0;
        v7[1] = 0;
        v7[2] = 0;
        *(_OWORD *)v7 = v16;
        v7[2] = v17;
        v16 = 0uLL;
        v17 = 0;
        *(_OWORD *)(v7 + 3) = v14;
        v7[5] = v15;
        v14 = 0uLL;
        v15 = 0;
        v8 = (uint64_t)(v7 + 6);
      }
      v19 = (uint64_t *)v8;
    }
    v21 = (void **)&v14;
    sub_1DF271804(&v21);
    *(_QWORD *)&v14 = &v16;
    sub_1DF271804((void ***)&v14);
    v3 += 2;
  }
  while (v3 != v4);
  v9 = (uint64_t)v18;
  if (v18 != v19)
  {
    v10 = v18 + 6;
    if (v18 + 6 != v19)
    {
      v11 = *v18;
      do
      {
        if (v10[1] - *v10 < (unint64_t)(*(_QWORD *)(v9 + 8) - v11))
        {
          v11 = *v10;
          v9 = (uint64_t)v10;
        }
        v10 += 6;
      }
      while (v10 != v19);
    }
  }
  if ((uint64_t *)v9 == v19)
  {
LABEL_16:
    v12 = 0;
  }
  else
  {
    *(_QWORD *)&v16 = a2;
    *((_QWORD *)&v16 + 1) = a3;
    sub_1DF289200((uint64_t)&v16, v9);
    v12 = 1;
  }
  *(_QWORD *)&v16 = &v18;
  sub_1DF289690((void ***)&v16);
  return v12;
}

void sub_1DF289118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void ***a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  a9 = &a13;
  sub_1DF271804((void ***)&a9);
  a13 = (void **)&a17;
  sub_1DF289690(&a13);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF289164(uint64_t a1)
{
  void **v3;

  *(_QWORD *)a1 = off_1EA983010;
  v3 = (void **)(a1 + 8);
  sub_1DF271804(&v3);
  return a1;
}

uint64_t sub_1DF2891A8(uint64_t a1)
{
  void **v3;

  *(_QWORD *)a1 = off_1EA983010;
  v3 = (void **)(a1 + 8);
  sub_1DF271804(&v3);
  return MEMORY[0x1E0BFC7D0](a1, 0xA1C4030951706);
}

uint64_t sub_1DF289200(uint64_t a1, uint64_t a2)
{
  void **v4;
  uint64_t v5;

  v4 = *(void ***)a1;
  sub_1DF271914(*(void ***)a1);
  *(_OWORD *)v4 = *(_OWORD *)a2;
  v4[2] = *(void **)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  v5 = *(_QWORD *)(a1 + 8);
  sub_1DF271914((void **)v5);
  *(_OWORD *)v5 = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  return a1;
}

uint64_t sub_1DF289274(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[5];

  v4 = *a1;
  v5 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  v6 = v5 + 1;
  if (v5 + 1 > 0x555555555555555)
    sub_1DF271380();
  v9 = (uint64_t)(a1 + 2);
  v10 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v4) >> 4);
  if (2 * v10 > v6)
    v6 = 2 * v10;
  if (v10 >= 0x2AAAAAAAAAAAAAALL)
    v11 = 0x555555555555555;
  else
    v11 = v6;
  v17[4] = a1 + 2;
  v12 = (char *)sub_1DF279D00(v9, v11);
  v13 = &v12[48 * v5];
  v17[0] = v12;
  v17[1] = v13;
  v17[3] = &v12[48 * v14];
  *((_QWORD *)v13 + 1) = 0;
  *((_QWORD *)v13 + 2) = 0;
  *(_QWORD *)v13 = 0;
  *(_OWORD *)v13 = *(_OWORD *)a2;
  *((_QWORD *)v13 + 2) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *((_QWORD *)v13 + 4) = 0;
  *((_QWORD *)v13 + 5) = 0;
  *((_QWORD *)v13 + 3) = 0;
  *(_OWORD *)(v13 + 24) = *(_OWORD *)a3;
  *((_QWORD *)v13 + 5) = *(_QWORD *)(a3 + 16);
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  v17[2] = v13 + 48;
  sub_1DF2893A0(a1, v17);
  v15 = a1[1];
  sub_1DF2895F0((uint64_t)v17);
  return v15;
}

void sub_1DF28938C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DF2895F0((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF2893A0(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1DF289414((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

uint64_t sub_1DF289414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
      *(_QWORD *)(v7 - 48) = 0;
      *(_QWORD *)(v7 - 40) = 0;
      *(_QWORD *)(v7 - 32) = 0;
      v8 = *(_OWORD *)(a3 - 48);
      a3 -= 48;
      *(_OWORD *)(v7 - 48) = v8;
      *(_QWORD *)(v7 - 32) = *(_QWORD *)(a3 + 16);
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 + 24);
      *(_QWORD *)(v7 - 8) = *(_QWORD *)(a3 + 40);
      *(_QWORD *)(a3 + 24) = 0;
      *(_QWORD *)(a3 + 32) = 0;
      *(_QWORD *)(a3 + 40) = 0;
      v7 = *((_QWORD *)&v14 + 1) - 48;
      *((_QWORD *)&v14 + 1) -= 48;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  sub_1DF2894D4((uint64_t)v11);
  return v9;
}

uint64_t sub_1DF2894D4(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1DF289508((uint64_t *)a1);
  return a1;
}

void sub_1DF289508(uint64_t *a1)
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

  v18 = *MEMORY[0x1E0C80C00];
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
  sub_1DF28957C(v4, (uint64_t)v13, (uint64_t)v8);
}

void sub_1DF28957C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void **i;
  void **v6;

  for (i = *(void ***)(a2 + 32); i != *(void ***)(a3 + 32); *(_QWORD *)(a2 + 32) = i)
  {
    v6 = i + 3;
    sub_1DF271804(&v6);
    v6 = i;
    sub_1DF271804(&v6);
    i = (void **)(*(_QWORD *)(a2 + 32) + 48);
  }
}

uint64_t sub_1DF2895F0(uint64_t a1)
{
  sub_1DF289624(a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_1DF289624(uint64_t a1, uint64_t a2)
{
  uint64_t i;
  void **v5;
  void **v6;

  for (i = *(_QWORD *)(a1 + 16); i != a2; i = *(_QWORD *)(a1 + 16))
  {
    v5 = (void **)(i - 48);
    *(_QWORD *)(a1 + 16) = i - 48;
    v6 = (void **)(i - 24);
    sub_1DF271804(&v6);
    v6 = v5;
    sub_1DF271804(&v6);
  }
}

void sub_1DF289690(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_1DF2896D0((uint64_t)v2, (void **)*v2);
    operator delete(**a1);
  }
}

void sub_1DF2896D0(uint64_t a1, void **a2)
{
  void **v4;
  void **v5;
  void **v6;

  v4 = *(void ***)(a1 + 8);
  if (v4 != a2)
  {
    do
    {
      v5 = v4 - 6;
      v6 = v4 - 3;
      sub_1DF271804(&v6);
      v6 = v5;
      sub_1DF271804(&v6);
      v4 = v5;
    }
    while (v5 != a2);
  }
  *(_QWORD *)(a1 + 8) = a2;
}

void sub_1DF28973C(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);
  JUMPOUT(0x1E0BFC7D0);
}

void sub_1DF289760(const std::string *a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v3;
  uint64_t v6;
  int v7;
  std::string::size_type v8;
  unint64_t size;
  unsigned __int8 *v10;
  std::string::size_type v11;
  unsigned __int8 *v12;
  uint64_t v13;
  std::string::size_type v14;
  unint64_t v15;
  unint64_t v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  __int128 v24;
  uint64_t v25;
  int v26;
  std::string __p;
  _QWORD v28[5];

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (a2 != -1)
  {
    v3 = a2;
    v6 = (uint64_t)(a3 + 2);
    do
    {
      v7 = SHIBYTE(a1->__r_.__value_.__r.__words[2]);
      if (v7 >= 0)
        v8 = (std::string::size_type)a1;
      else
        v8 = a1->__r_.__value_.__r.__words[0];
      if (v7 >= 0)
        size = HIBYTE(a1->__r_.__value_.__r.__words[2]);
      else
        size = a1->__r_.__value_.__l.__size_;
      if (size <= v3)
        break;
      v10 = (unsigned __int8 *)(v8 + size);
      v11 = v3;
      while (memchr(" \t\r\n\v\f", *(char *)(v8 + v11), 6uLL))
      {
        if (size == ++v11)
          return;
      }
      if (v11 == -1)
        break;
      if (size > v11)
      {
        v12 = (unsigned __int8 *)(v8 + v11);
LABEL_17:
        v13 = 0;
        while (*v12 != asc_1DF2902EE[v13])
        {
          if (++v13 == 6)
          {
            if (++v12 != v10)
              goto LABEL_17;
            goto LABEL_25;
          }
        }
        if (v12 != v10)
        {
          v3 = (unint64_t)&v12[-v8];
          if (&v12[-v8] != (unsigned __int8 *)-1)
          {
            v14 = v3 - v11;
            goto LABEL_26;
          }
        }
      }
LABEL_25:
      v3 = -1;
      v14 = -1;
LABEL_26:
      std::string::basic_string(&__p, a1, v11, v14, (std::allocator<char> *)v28);
      v16 = a3[1];
      v15 = a3[2];
      if (v16 >= v15)
      {
        v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - *a3) >> 3);
        v19 = v18 + 1;
        if (v18 + 1 > 0xAAAAAAAAAAAAAAALL)
          sub_1DF271380();
        v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15 - *a3) >> 3);
        if (2 * v20 > v19)
          v19 = 2 * v20;
        v21 = v20 >= 0x555555555555555 ? 0xAAAAAAAAAAAAAAALL : v19;
        v28[4] = v6;
        v22 = v21 ? (char *)sub_1DF274E5C(v6, v21) : 0;
        v23 = &v22[24 * v18];
        v28[0] = v22;
        v28[1] = v23;
        v28[3] = &v22[24 * v21];
        v24 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *((_QWORD *)v23 + 2) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
        *(_OWORD *)v23 = v24;
        memset(&__p, 0, sizeof(__p));
        v28[2] = v23 + 24;
        sub_1DF2794FC(a3, v28);
        v25 = a3[1];
        sub_1DF279684((uint64_t)v28);
        v26 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
        a3[1] = v25;
        if (v26 < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }
      else
      {
        v17 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *(_QWORD *)(v16 + 16) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
        *(_OWORD *)v16 = v17;
        a3[1] = v16 + 24;
      }
    }
    while (v3 != -1);
  }
}

void sub_1DF289994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0)
    operator delete(__p);
  sub_1DF28BFB0((void ***)&__p);
  _Unwind_Resume(a1);
}

const void *sub_1DF2899D8(const void *result)
{
  if (result)
    return (const void *)(__dynamic_cast(result, (const struct __class_type_info *)&unk_1EA982BA8, (const struct __class_type_info *)&unk_1EA982B78, 0) != 0);
  return result;
}

void ***sub_1DF289A0C(void ***a1, _QWORD *a2)
{
  void **v4;
  _QWORD *v5;
  void **v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;

  v4 = *a1;
  v5 = (*a1)[1];
  v6 = *a1;
  v9 = (unint64_t)v6[2];
  v7 = (uint64_t)(v6 + 2);
  v8 = v9;
  if ((unint64_t)v5 >= v9)
  {
    v11 = ((char *)v5 - (_BYTE *)*v4) >> 3;
    if ((unint64_t)(v11 + 1) >> 61)
      sub_1DF271380();
    v12 = v8 - (_QWORD)*v4;
    v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    if (v14)
      v15 = (char *)sub_1DF271394(v7, v14);
    else
      v15 = 0;
    v16 = &v15[8 * v11];
    v17 = &v15[8 * v14];
    *(_QWORD *)v16 = *a2;
    v10 = v16 + 8;
    v19 = (char *)*v4;
    v18 = (char *)v4[1];
    if (v18 != *v4)
    {
      do
      {
        v20 = *((_QWORD *)v18 - 1);
        v18 -= 8;
        *((_QWORD *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      v18 = (char *)*v4;
    }
    *v4 = v16;
    v4[1] = v10;
    v4[2] = v17;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *v5 = *a2;
    v10 = v5 + 1;
  }
  v4[1] = v10;
  return a1;
}

uint64_t sub_1DF289AF4(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t *v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a2 != a3)
  {
    v5 = a2;
    do
    {
      sub_1DF289B6C(a1, v5, v5);
      ++v5;
    }
    while (v5 != a3);
  }
  return a1;
}

void sub_1DF289B58(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1DF289DC4(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF289B6C(uint64_t a1, uint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  _QWORD **v12;
  _QWORD *i;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;

  v7 = sub_1DF2815D0(*a2);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      v3 = v7;
      if (v7 >= v9)
        v3 = v7 % v9;
    }
    else
    {
      v3 = (v9 - 1) & v7;
    }
    v12 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v12)
    {
      for (i = *v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v8)
        {
          v15 = *a2;
          v16 = sub_1DF2815D0(i[2]);
          if (v16 == sub_1DF2815D0(v15))
            return i;
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9)
              v14 %= v9;
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v8;
  i[2] = *a3;
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v9 || (float)(v18 * (float)v9) < v17)
  {
    v19 = 1;
    if (v9 >= 3)
      v19 = (v9 & (v9 - 1)) != 0;
    v20 = v19 | (2 * v9);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    sub_1DF271C98(a1, v22);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v23 = *(_QWORD *)a1;
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v24)
  {
    *i = *v24;
LABEL_38:
    *v24 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v23 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v25 = *(_QWORD *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v25 >= v9)
        v25 %= v9;
    }
    else
    {
      v25 &= v9 - 1;
    }
    v24 = (_QWORD *)(*(_QWORD *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1DF289DB0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF289DC4(uint64_t a1)
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

const void *sub_1DF289E0C(const void *result)
{
  if (result)
    return (const void *)(__dynamic_cast(result, (const struct __class_type_info *)&unk_1EA982BA8, (const struct __class_type_info *)&unk_1EA982B00, 0) != 0);
  return result;
}

_QWORD *sub_1DF289E40(_QWORD *a1, uint64_t *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = sub_1DF2815D0(*a2);
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
  v10 = *(_QWORD **)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = (_QWORD *)*v10;
  if (*v10)
  {
    do
    {
      v12 = v11[1];
      if (v6 == v12)
      {
        v13 = *a2;
        v14 = sub_1DF2815D0(v11[2]);
        if (v14 == sub_1DF2815D0(v13))
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v12 >= *(_QWORD *)&v5)
            v12 %= *(_QWORD *)&v5;
        }
        else
        {
          v12 &= *(_QWORD *)&v5 - 1;
        }
        if (v12 != v9)
          return 0;
      }
      v11 = (_QWORD *)*v11;
    }
    while (v11);
  }
  return v11;
}

_QWORD *sub_1DF289F50(uint64_t a1, uint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  _QWORD **v12;
  _QWORD *i;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;

  v7 = sub_1DF2815D0(*a2);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      v3 = v7;
      if (v7 >= v9)
        v3 = v7 % v9;
    }
    else
    {
      v3 = (v9 - 1) & v7;
    }
    v12 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v12)
    {
      for (i = *v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v8)
        {
          v15 = *a2;
          v16 = sub_1DF2815D0(i[2]);
          if (v16 == sub_1DF2815D0(v15))
            return i;
        }
        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9)
              v14 %= v9;
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v8;
  i[2] = *a3;
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v9 || (float)(v18 * (float)v9) < v17)
  {
    v19 = 1;
    if (v9 >= 3)
      v19 = (v9 & (v9 - 1)) != 0;
    v20 = v19 | (2 * v9);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    sub_1DF271C98(a1, v22);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v3 = v8 % v9;
      else
        v3 = v8;
    }
    else
    {
      v3 = (v9 - 1) & v8;
    }
  }
  v23 = *(_QWORD *)a1;
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v24)
  {
    *i = *v24;
LABEL_38:
    *v24 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v23 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v25 = *(_QWORD *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v25 >= v9)
        v25 %= v9;
    }
    else
    {
      v25 &= v9 - 1;
    }
    v24 = (_QWORD *)(*(_QWORD *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1DF28A194(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF28A1A8@<X0>(char *a1@<X1>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0x58uLL);
  result = sub_1DF28A208(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_1DF28A1F4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF28A208(_QWORD *a1, char *__s, uint64_t a3)
{
  char v5;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_1EA983870;
  sub_1DF28A268((int)&v5, a1 + 3, __s, a3);
  return a1;
}

void sub_1DF28A254(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1DF28A268(int a1, _QWORD *a2, char *__s, uint64_t a4)
{
  void *v6;
  char v7;
  int v8;
  void *__p;
  _BYTE v10[15];
  char v11;
  __n128 v12;
  char v13;
  void **p_p;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  sub_1DF28BE7C(&v12, __s);
  v6 = *(void **)a4;
  v15[0] = *(_QWORD *)(a4 + 8);
  *(_QWORD *)((char *)v15 + 7) = *(_QWORD *)(a4 + 15);
  v7 = *(_BYTE *)(a4 + 23);
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = 0;
  v8 = 3;
  __p = v6;
  *(_QWORD *)v10 = v15[0];
  *(_QWORD *)&v10[7] = *(_QWORD *)((char *)v15 + 7);
  v11 = v7;
  sub_1DF283088((uint64_t)a2, &v12, &v8);
  *a2 = off_1EA983280;
  if (v8 == 4)
  {
    p_p = &__p;
    sub_1DF28BFB0(&p_p);
  }
  else if (v8 == 3 && v11 < 0)
  {
    operator delete(__p);
  }
  if (v13 < 0)
    operator delete((void *)v12.n128_u64[0]);
}

void sub_1DF28A36C(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);
  JUMPOUT(0x1E0BFC7D0);
}

uint64_t sub_1DF28A390(uint64_t **a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  std::__shared_weak_count *v7;
  uint64_t v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  uint64_t v11;
  const void **v12;
  uint64_t v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  uint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  char v27;

  v3 = *a1;
  v4 = a1[1];
  if (*a1 != v4)
  {
    while (1)
    {
      v8 = *v3;
      v7 = (std::__shared_weak_count *)v3[1];
      if (v7)
      {
        p_shared_owners = (unint64_t *)&v7->__shared_owners_;
        do
          v10 = __ldxr(p_shared_owners);
        while (__stxr(v10 + 1, p_shared_owners));
      }
      v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 24))(v8);
      v12 = (const void **)v11;
      v13 = *(unsigned __int8 *)(v11 + 23);
      v14 = *(_QWORD *)(v11 + 8);
      if ((v13 & 0x80u) == 0)
        v15 = *(unsigned __int8 *)(v11 + 23);
      else
        v15 = *(_QWORD *)(v11 + 8);
      v16 = a2[23];
      v17 = (char)v16;
      if ((v16 & 0x80u) != 0)
        v16 = *((_QWORD *)a2 + 1);
      if (v15 == v16)
      {
        if (v17 >= 0)
          v18 = a2;
        else
          v18 = *(unsigned __int8 **)a2;
        if ((v13 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v11, v18, v14))
            goto LABEL_38;
        }
        else
        {
          if (!*(_BYTE *)(v11 + 23))
            goto LABEL_38;
          v19 = (unsigned __int8 *)v11;
          v20 = *(unsigned __int8 *)(v11 + 23);
          while (*v19 == *v18)
          {
            ++v19;
            ++v18;
            if (!--v20)
              goto LABEL_38;
          }
        }
      }
      v21 = a3[23];
      v22 = (char)v21;
      if ((v21 & 0x80u) != 0)
        v21 = *((_QWORD *)a3 + 1);
      if (v21)
        v23 = v15 == v21;
      else
        v23 = 0;
      if (!v23)
        goto LABEL_27;
      if (v22 >= 0)
        v18 = a3;
      else
        v18 = *(unsigned __int8 **)a3;
      if ((v13 & 0x80) != 0)
      {
        if (memcmp(*v12, v18, v14))
          goto LABEL_27;
      }
      else if ((_DWORD)v13)
      {
        while (*(unsigned __int8 *)v12 == *v18)
        {
          v12 = (const void **)((char *)v12 + 1);
          ++v18;
          if (!--v13)
            goto LABEL_38;
        }
LABEL_27:
        v24 = 0;
        if (v7)
          goto LABEL_39;
        goto LABEL_43;
      }
LABEL_38:
      v24 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(*(_QWORD *)v8 + 32))(v8, v18);
      if (v7)
      {
LABEL_39:
        v25 = (unint64_t *)&v7->__shared_owners_;
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }
LABEL_43:
      v3 += 2;
      if (v3 == v4)
        v27 = 1;
      else
        v27 = v24;
      if ((v27 & 1) != 0)
        return v24;
    }
  }
  return 0;
}

void sub_1DF28A564(_Unwind_Exception *exception_object)
{
  std::__shared_weak_count *v1;

  if (v1)
    sub_1DF28DC60(v1);
  _Unwind_Resume(exception_object);
}

void sub_1DF28A584(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);
  JUMPOUT(0x1E0BFC7D0);
}

void sub_1DF28A5A8(std::runtime_error *a1)
{
  std::runtime_error::~runtime_error(a1);
  JUMPOUT(0x1E0BFC7D0);
}

void sub_1DF28A5CC(uint64_t a1)
{
  void **i;
  void **v2;
  void **v3;
  void **v4;
  const void **v5;
  const void **v6;
  const void **v7;
  char *v8;
  const void **v9;
  char *v10;
  const void *v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t *v14;
  std::__shared_weak_count *v15;
  uint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  _QWORD *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD **v23;
  _QWORD **v24;
  _QWORD **v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  uint64_t **v29;
  uint64_t **v30;
  _QWORD *v31;
  const void **v32;
  void *v33;
  uint64_t v34;
  int v35;
  void **v36;
  _DWORD *v37;
  __int128 v38;
  uint64_t v39;
  void *__p[3];
  uint64_t v41;
  void **v42;
  void **v43;
  _QWORD *v44;
  _QWORD v45[3];
  uint64_t **v46;
  uint64_t **v47;
  uint64_t v48;
  __int128 v49;
  void *v50;
  __int128 v51;
  void **v52;
  char v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  memset(v45, 0, sizeof(v45));
  sub_1DF271698((char *)v45, *(_QWORD **)(a1 + 8), *(_QWORD **)(a1 + 16), (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8)) >> 4);
  v46 = 0;
  v47 = 0;
  v48 = 0;
  v42 = 0;
  v43 = 0;
  v44 = 0;
  sub_1DF28AD4C((uint64_t *)&v42, (uint64_t)v45);
  for (i = v42; v42 != v43; i = v42)
  {
    memset(__p, 0, sizeof(__p));
    *(_OWORD *)__p = *(_OWORD *)i;
    __p[2] = i[2];
    *i = 0;
    i[1] = 0;
    i[2] = 0;
    sub_1DF28B09C((uint64_t)&v52, (uint64_t)(v42 + 3), (uint64_t)v43, (uint64_t)v42);
    v3 = v2;
    v4 = v43;
    while (v4 != v3)
    {
      v4 -= 3;
      *(_QWORD *)&v49 = v4;
      sub_1DF271804((void ***)&v49);
    }
    v43 = v3;
    v5 = (const void **)__p[0];
    v6 = (const void **)__p[1];
    if (__p[0] != __p[1])
    {
      while (!*v5
           || !__dynamic_cast(*v5, (const struct __class_type_info *)&unk_1EA982BA8, (const struct __class_type_info *)&unk_1EA982AD0, 0))
      {
        v5 += 2;
        if (v5 == v6)
          goto LABEL_31;
      }
    }
    if (v5 == v6)
    {
LABEL_31:
      sub_1DF28AD4C((uint64_t *)&v46, (uint64_t)__p);
    }
    else
    {
      v51 = *(_OWORD *)v5;
      *v5 = 0;
      v5[1] = 0;
      v7 = v5 + 2;
      v8 = (char *)__p[1];
      if (v5 + 2 != __p[1])
      {
        do
        {
          v9 = v5 + 2;
          sub_1DF28208C((uint64_t)v5, (__int128 *)v5 + 1);
          v10 = (char *)(v5 + 4);
          v5 += 2;
        }
        while (v10 != v8);
        v7 = (const void **)__p[1];
        v5 = v9;
      }
      while (v7 != v5)
        v7 = (const void **)sub_1DF2717AC((uint64_t)(v7 - 2));
      __p[1] = v5;
      v11 = (const void *)v51;
      v12 = __dynamic_cast((const void *)v51, (const struct __class_type_info *)&unk_1EA982BA8, (const struct __class_type_info *)&unk_1EA982B60, 0);
      if (v12)
      {
        v13 = (uint64_t *)v12[1];
        v14 = (uint64_t *)v12[2];
        while (v13 != v14)
        {
          v16 = *v13;
          v15 = (std::__shared_weak_count *)v13[1];
          v54 = *v13;
          v55 = v15;
          if (v15)
          {
            p_shared_owners = (unint64_t *)&v15->__shared_owners_;
            do
              v18 = __ldxr(p_shared_owners);
            while (__stxr(v18 + 1, p_shared_owners));
          }
          v49 = 0uLL;
          v50 = 0;
          v52 = (void **)&v49;
          v53 = 0;
          v19 = operator new(0x10uLL);
          *(_QWORD *)&v49 = v19;
          *((_QWORD *)&v49 + 1) = v19;
          v50 = v19 + 2;
          *v19 = v16;
          v19[1] = v15;
          if (v15)
          {
            v20 = (unint64_t *)&v15->__shared_owners_;
            do
              v21 = __ldxr(v20);
            while (__stxr(v21 + 1, v20));
            *((_QWORD *)&v49 + 1) = v19 + 2;
            do
              v22 = __ldaxr(v20);
            while (__stlxr(v22 - 1, v20));
            if (!v22)
            {
              ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
              std::__shared_weak_count::__release_weak(v15);
            }
          }
          else
          {
            *((_QWORD *)&v49 + 1) = v19 + 2;
          }
          sub_1DF28B110((uint64_t *)&v49, *((uint64_t *)&v49 + 1), (uint64_t *)__p[0], (uint64_t *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 4);
          sub_1DF28AD4C((uint64_t *)&v42, (uint64_t)&v49);
          v52 = (void **)&v49;
          sub_1DF271804(&v52);
          v13 += 2;
        }
      }
      else
      {
        v23 = (_QWORD **)__dynamic_cast(v11, (const struct __class_type_info *)&unk_1EA982BA8, (const struct __class_type_info *)&unk_1EA982C00, 0);
        if (v23)
        {
          v24 = v23;
          v50 = 0;
          v49 = 0uLL;
          sub_1DF271698((char *)&v49, v23[1], v23[2], ((char *)v23[2] - (char *)v23[1]) >> 4);
          sub_1DF28B414((uint64_t *)&v49, *((uint64_t *)&v49 + 1), v24[1], v24[2], ((char *)v24[2] - (char *)v24[1]) >> 4);
        }
        else
        {
          v25 = (_QWORD **)__dynamic_cast(v11, (const struct __class_type_info *)&unk_1EA982BA8, (const struct __class_type_info *)&unk_1EA982AD0, 0);
          v50 = 0;
          v49 = 0uLL;
          sub_1DF271698((char *)&v49, v25[1], v25[2], ((char *)v25[2] - (char *)v25[1]) >> 4);
        }
        sub_1DF28B110((uint64_t *)&v49, *((uint64_t *)&v49 + 1), (uint64_t *)__p[0], (uint64_t *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 4);
        sub_1DF28AD4C((uint64_t *)&v42, (uint64_t)&v49);
        v52 = (void **)&v49;
        sub_1DF271804(&v52);
      }
      v26 = (std::__shared_weak_count *)*((_QWORD *)&v51 + 1);
      if (*((_QWORD *)&v51 + 1))
      {
        v27 = (unint64_t *)(*((_QWORD *)&v51 + 1) + 8);
        do
          v28 = __ldaxr(v27);
        while (__stlxr(v28 - 1, v27));
        if (!v28)
        {
          ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
          std::__shared_weak_count::__release_weak(v26);
        }
      }
    }
    *(_QWORD *)&v49 = __p;
    sub_1DF271804((void ***)&v49);
  }
  __p[0] = &v42;
  sub_1DF28BE0C((void ***)__p);
  v42 = (void **)v45;
  sub_1DF271804(&v42);
  v29 = v46;
  v30 = v47;
  if (v46 != v47)
  {
    while (1)
    {
      sub_1DF28B600((uint64_t)&v42, *v29, v29[1]);
      v31 = v44;
      if (v44)
        break;
LABEL_70:
      sub_1DF28BC60((uint64_t)&v42);
      v29 += 3;
      if (v29 == v30)
        goto LABEL_71;
    }
    while (1)
    {
      v32 = (const void **)(v31 + 2);
      if (sub_1DF28BCD4(&v42, v31 + 2) == 1)
        goto LABEL_69;
      if (!*v32)
        goto LABEL_69;
      v33 = __dynamic_cast(*v32, (const struct __class_type_info *)&unk_1EA982BA8, (const struct __class_type_info *)&unk_1EA982AB8, 0);
      if (!v33)
        goto LABEL_69;
      v34 = (uint64_t)v33;
      if (__dynamic_cast(v33, (const struct __class_type_info *)&unk_1EA982AB8, (const struct __class_type_info *)&unk_1EA982B90, 0))
      {
        goto LABEL_49;
      }
      if (__dynamic_cast((const void *)v34, (const struct __class_type_info *)&unk_1EA982AB8, (const struct __class_type_info *)&unk_1EA982BB8, 0))
      {
        goto LABEL_54;
      }
      v37 = __dynamic_cast((const void *)v34, (const struct __class_type_info *)&unk_1EA982AB8, (const struct __class_type_info *)&unk_1EA982B78, 0);
      if (v37)
        break;
LABEL_69:
      v31 = (_QWORD *)*v31;
      if (!v31)
        goto LABEL_70;
    }
    if (v37[28])
    {
LABEL_54:
      v49 = 0uLL;
      v50 = 0;
      v35 = *(_DWORD *)(v34 + 32);
      if (v35 == 3)
      {
        sub_1DF270BD4((int *)(v34 + 32), 3u);
        sub_1DF289760((const std::string *)(v34 + 40), 0, (uint64_t *)__p);
        sub_1DF2822B0((uint64_t *)&v49);
        v49 = *(_OWORD *)__p;
        v50 = __p[2];
        memset(__p, 0, sizeof(__p));
        v52 = __p;
        sub_1DF28BFB0(&v52);
        v35 = *(_DWORD *)(v34 + 32);
      }
      if (v35 != 4)
      {
        v39 = 0;
        v38 = 0uLL;
        sub_1DF28BF2C((char *)&v38, (__int128 *)v49, *((__int128 **)&v49 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v49 + 1) - v49) >> 3));
        LODWORD(__p[0]) = 4;
        *(_OWORD *)&__p[1] = v38;
        v41 = v39;
        v38 = 0uLL;
        v39 = 0;
        sub_1DF281F48(v34, (int *)__p);
        if (LODWORD(__p[0]) == 4)
        {
          v52 = &__p[1];
          sub_1DF28BFB0(&v52);
        }
        else if (LODWORD(__p[0]) == 3 && SHIBYTE(v41) < 0)
        {
          operator delete(__p[1]);
        }
        v52 = (void **)&v38;
        sub_1DF28BFB0(&v52);
      }
      __p[0] = &v49;
      v36 = __p;
    }
    else
    {
LABEL_49:
      LODWORD(__p[0]) = 2;
      __p[1] = 0;
      sub_1DF281F48(v34, (int *)__p);
      if (LODWORD(__p[0]) != 4)
      {
        if (LODWORD(__p[0]) == 3 && SHIBYTE(v41) < 0)
          operator delete(__p[1]);
        goto LABEL_69;
      }
      *(_QWORD *)&v49 = &__p[1];
      v36 = (void **)&v49;
    }
    sub_1DF28BFB0((void ***)v36);
    goto LABEL_69;
  }
LABEL_71:
  v42 = (void **)&v46;
  sub_1DF28BE0C(&v42);
}

void sub_1DF28AC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void ***a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void **a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,void ***a29)
{
  uint64_t v29;

  *(_QWORD *)(v29 - 128) = &a29;
  sub_1DF271804((void ***)(v29 - 128));
  sub_1DF2717AC(v29 - 144);
  a29 = (void ***)&a13;
  sub_1DF271804((void ***)&a29);
  a13 = &a18;
  sub_1DF28BE0C((void ***)&a13);
  a18 = (void **)&a26;
  sub_1DF28BE0C(&a18);
  a18 = (void **)&a23;
  sub_1DF271804(&a18);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF28AD4C(uint64_t *a1, uint64_t a2)
{
  _QWORD *v4;
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
  void *v17[5];

  v6 = a1[2];
  v4 = a1 + 2;
  v5 = v6;
  v7 = (_QWORD *)*(v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    v9 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v7 - *a1) >> 3);
    v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL)
      sub_1DF271380();
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 3);
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v10;
    v17[4] = v4;
    v13 = (char *)sub_1DF274E5C((uint64_t)v4, v12);
    v14 = &v13[24 * v9];
    v17[0] = v13;
    v17[1] = v14;
    v17[3] = &v13[24 * v15];
    *((_QWORD *)v14 + 1) = 0;
    *((_QWORD *)v14 + 2) = 0;
    *(_QWORD *)v14 = 0;
    *(_OWORD *)v14 = *(_OWORD *)a2;
    *((_QWORD *)v14 + 2) = *(_QWORD *)(a2 + 16);
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
    v17[2] = v14 + 24;
    sub_1DF28AE8C(a1, v17);
    v8 = (_QWORD *)a1[1];
    sub_1DF28B01C(v17);
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
  return v8 - 3;
}

void sub_1DF28AE78(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DF28B01C((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF28AE8C(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_1DF28AF00((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
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

uint64_t sub_1DF28AF00(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
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
  sub_1DF28AFA0((uint64_t)v11);
  return v9;
}

uint64_t sub_1DF28AFA0(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_1DF28AFD4(a1);
  return a1;
}

void sub_1DF28AFD4(uint64_t a1)
{
  void **v1;
  void **v2;
  void **v3;

  v1 = *(void ***)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(void ***)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = v1;
    sub_1DF271804(&v3);
    v1 += 3;
  }
}

void **sub_1DF28B01C(void **a1)
{
  sub_1DF28B04C((uint64_t)a1);
  if (*a1)
    operator delete(*a1);
  return a1;
}

void sub_1DF28B04C(uint64_t a1)
{
  uint64_t i;
  uint64_t v2;
  void **v4;
  void **v5;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    v4 = (void **)(i - 24);
    *(_QWORD *)(a1 + 16) = v4;
    v5 = v4;
    sub_1DF271804(&v5);
  }
}

uint64_t sub_1DF28B09C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a2;
  if (a2 == a3)
    return a2;
  v6 = a3;
  do
  {
    sub_1DF271914((void **)a4);
    *(_OWORD *)a4 = *(_OWORD *)v5;
    *(_QWORD *)(a4 + 16) = *(_QWORD *)(v5 + 16);
    *(_QWORD *)v5 = 0;
    *(_QWORD *)(v5 + 8) = 0;
    *(_QWORD *)(v5 + 16) = 0;
    a4 += 24;
    v5 += 24;
  }
  while (v5 != v6);
  return v6;
}

_QWORD *sub_1DF28B110(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  _QWORD *v31;
  _QWORD v33[5];

  v5 = (_QWORD *)a2;
  if (a5 < 1)
    return v5;
  v11 = a1[2];
  v9 = (uint64_t)(a1 + 2);
  v10 = v11;
  v12 = *(_QWORD *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 4)
  {
    v13 = *a1;
    v14 = a5 + ((uint64_t)(v12 - *a1) >> 4);
    if (v14 >> 60)
      sub_1DF271380();
    v15 = (a2 - v13) >> 4;
    v16 = v10 - v13;
    if (v16 >> 3 > v14)
      v14 = v16 >> 3;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0)
      v17 = 0xFFFFFFFFFFFFFFFLL;
    else
      v17 = v14;
    v33[4] = v9;
    if (v17)
      v18 = (char *)sub_1DF271778(v9, v17);
    else
      v18 = 0;
    v26 = (uint64_t *)&v18[16 * v15];
    v33[0] = v18;
    v33[1] = v26;
    v33[3] = &v18[16 * v17];
    v27 = &v26[2 * a5];
    do
    {
      *v26 = *a3;
      v28 = a3[1];
      v26[1] = v28;
      if (v28)
      {
        v29 = (unint64_t *)(v28 + 8);
        do
          v30 = __ldxr(v29);
        while (__stxr(v30 + 1, v29));
      }
      v26 += 2;
      a3 += 2;
    }
    while (v26 != v27);
    v33[2] = v27;
    v5 = (_QWORD *)sub_1DF28B378(a1, v33, v5);
    sub_1DF2820F0((uint64_t)v33);
    return v5;
  }
  v19 = (uint64_t)(v12 - a2) >> 4;
  if (v19 >= a5)
  {
    v20 = &a3[2 * a5];
LABEL_29:
    sub_1DF28B2FC((uint64_t)a1, a2, v12, (char *)(a2 + 16 * a5));
    if (v20 != a3)
    {
      v31 = v5;
      do
      {
        sub_1DF271970(v31, a3);
        a3 += 2;
        v31 += 2;
      }
      while (a3 != v20);
    }
    return v5;
  }
  v20 = &a3[2 * v19];
  if (v20 == a4)
  {
    v22 = *(uint64_t **)(v9 - 8);
  }
  else
  {
    v21 = &a3[2 * v19];
    v22 = *(uint64_t **)(v9 - 8);
    do
    {
      *v22 = *v21;
      v23 = v21[1];
      v22[1] = v23;
      if (v23)
      {
        v24 = (unint64_t *)(v23 + 8);
        do
          v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }
      v21 += 2;
      v22 += 2;
    }
    while (v21 != a4);
  }
  a1[1] = (uint64_t)v22;
  if ((uint64_t)(v12 - a2) >= 1)
    goto LABEL_29;
  return v5;
}

void sub_1DF28B2E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DF2820F0((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF28B2FC(uint64_t result, uint64_t a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(char **)(result + 8);
  v5 = (char *)(a2 + v4 - a4);
  v6 = v4;
  while ((unint64_t)v5 < a3)
  {
    *(_OWORD *)v6 = *(_OWORD *)v5;
    v6 += 16;
    *(_QWORD *)v5 = 0;
    *((_QWORD *)v5 + 1) = 0;
    v5 += 16;
  }
  *(_QWORD *)(result + 8) = v6;
  if (v4 != a4)
  {
    v7 = (uint64_t)(v4 - 16);
    v8 = 16 * ((v4 - a4) >> 4);
    v9 = a2 - 16;
    do
    {
      result = sub_1DF28208C(v7, (__int128 *)(v9 + v8));
      v7 -= 16;
      v8 -= 16;
    }
    while (v8);
  }
  return result;
}

uint64_t sub_1DF28B378(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  __int128 v8;
  _QWORD *v9;
  _OWORD *v10;
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
      v8 = *((_OWORD *)v7 - 1);
      v7 -= 2;
      *(_OWORD *)(v6 - 16) = v8;
      v6 -= 16;
      *v7 = 0;
      v7[1] = 0;
    }
    while (v7 != v5);
  }
  a2[1] = v6;
  v9 = (_QWORD *)a1[1];
  v10 = (_OWORD *)a2[2];
  if (v9 != a3)
  {
    do
    {
      *v10++ = *(_OWORD *)a3;
      *a3 = 0;
      a3[1] = 0;
      a3 += 2;
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

_QWORD *sub_1DF28B414(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t *v29;
  unint64_t v30;
  _QWORD *v31;
  _QWORD v33[5];

  v5 = (_QWORD *)a2;
  if (a5 < 1)
    return v5;
  v11 = a1[2];
  v9 = (uint64_t)(a1 + 2);
  v10 = v11;
  v12 = *(_QWORD *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 4)
  {
    v13 = *a1;
    v14 = a5 + ((uint64_t)(v12 - *a1) >> 4);
    if (v14 >> 60)
      sub_1DF271380();
    v15 = (a2 - v13) >> 4;
    v16 = v10 - v13;
    if (v16 >> 3 > v14)
      v14 = v16 >> 3;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0)
      v17 = 0xFFFFFFFFFFFFFFFLL;
    else
      v17 = v14;
    v33[4] = v9;
    if (v17)
      v18 = (char *)sub_1DF271778(v9, v17);
    else
      v18 = 0;
    v26 = (uint64_t *)&v18[16 * v15];
    v33[0] = v18;
    v33[1] = v26;
    v33[3] = &v18[16 * v17];
    v27 = &v26[2 * a5];
    do
    {
      *v26 = *a3;
      v28 = a3[1];
      v26[1] = v28;
      if (v28)
      {
        v29 = (unint64_t *)(v28 + 8);
        do
          v30 = __ldxr(v29);
        while (__stxr(v30 + 1, v29));
      }
      v26 += 2;
      a3 += 2;
    }
    while (v26 != v27);
    v33[2] = v27;
    v5 = (_QWORD *)sub_1DF28B378(a1, v33, v5);
    sub_1DF2820F0((uint64_t)v33);
    return v5;
  }
  v19 = (uint64_t)(v12 - a2) >> 4;
  if (v19 >= a5)
  {
    v20 = &a3[2 * a5];
LABEL_29:
    sub_1DF28B2FC((uint64_t)a1, a2, v12, (char *)(a2 + 16 * a5));
    if (v20 != a3)
    {
      v31 = v5;
      do
      {
        sub_1DF271970(v31, a3);
        a3 += 2;
        v31 += 2;
      }
      while (a3 != v20);
    }
    return v5;
  }
  v20 = &a3[2 * v19];
  if (v20 == a4)
  {
    v22 = *(uint64_t **)(v9 - 8);
  }
  else
  {
    v21 = &a3[2 * v19];
    v22 = *(uint64_t **)(v9 - 8);
    do
    {
      *v22 = *v21;
      v23 = v21[1];
      v22[1] = v23;
      if (v23)
      {
        v24 = (unint64_t *)(v23 + 8);
        do
          v25 = __ldxr(v24);
        while (__stxr(v25 + 1, v24));
      }
      v21 += 2;
      v22 += 2;
    }
    while (v21 != a4);
  }
  a1[1] = (uint64_t)v22;
  if ((uint64_t)(v12 - a2) >= 1)
    goto LABEL_29;
  return v5;
}

void sub_1DF28B5EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DF2820F0((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF28B600(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t *v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a2 != a3)
  {
    v5 = a2;
    do
    {
      sub_1DF28B674((_QWORD *)a1, v5);
      v5 += 2;
    }
    while (v5 != a3);
  }
  return a1;
}

void sub_1DF28B660(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1DF28BC60(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF28B674(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v3;
  _QWORD *v5[3];

  sub_1DF28B6DC((uint64_t)a1, a2, (uint64_t)v5);
  v3 = sub_1DF28B774(a1, v5[0]);
  v5[0] = 0;
  sub_1DF271ECC((uint64_t)v5, 0);
  return v3;
}

void sub_1DF28B6C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1DF271ECC((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

uint64_t sub_1DF28B6DC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t result;

  v5 = a1 + 16;
  v6 = operator new(0x20uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  *v6 = 0;
  v6[1] = 0;
  v7 = *a2;
  v8 = a2[1];
  v6[2] = *a2;
  v6[3] = v8;
  if (v8)
  {
    v9 = (unint64_t *)(v8 + 8);
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
    v7 = v6[2];
  }
  *(_BYTE *)(a3 + 16) = 1;
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 40))(v7);
  v6[1] = result;
  return result;
}

void sub_1DF28B75C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1DF271ECC(v1, 0);
  _Unwind_Resume(a1);
}

_QWORD *sub_1DF28B774(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v4;
  unint64_t v5;
  _QWORD *v6;

  v4 = a2 + 2;
  v5 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)a2[2] + 40))(a2[2]);
  a2[1] = v5;
  v6 = sub_1DF28B7D8((uint64_t)a1, v5, v4);
  sub_1DF28B92C(a1, a2, v6);
  return a2;
}

_QWORD *sub_1DF28B7D8(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v6;
  float v7;
  float v8;
  uint64_t v9;
  _BOOL8 v10;
  size_t v11;
  unint64_t v12;
  size_t v13;
  uint8x8_t v14;
  unint64_t v15;
  _QWORD *v16;
  int v17;
  _QWORD *result;
  unint64_t v19;
  unint64_t v20;
  _BOOL4 v21;
  int v22;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    v9 = 2 * v6;
    v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    v11 = v10 | v9;
    v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = v11;
    sub_1DF28BA14(a1, v13);
    v6 = *(_QWORD *)(a1 + 8);
  }
  v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    v15 = a2;
    if (v6 <= a2)
      v15 = a2 % v6;
  }
  else
  {
    v15 = (v6 - 1) & a2;
  }
  v16 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v15);
  if (!v16)
    return 0;
  v17 = 0;
  do
  {
    result = v16;
    v16 = (_QWORD *)*v16;
    if (!v16)
      break;
    v19 = v16[1];
    if (v14.u32[0] > 1uLL)
    {
      v20 = v16[1];
      if (v19 >= v6)
        v20 = v19 % v6;
    }
    else
    {
      v20 = v19 & (v6 - 1);
    }
    if (v20 != v15)
      break;
    v21 = v19 == a2 && v16[2] == *a3;
    v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

_QWORD *sub_1DF28B92C(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;

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
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(_QWORD *)(*result + 8 * v4) = result + 2;
    if (!*a2)
      goto LABEL_19;
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
LABEL_18:
    *(_QWORD *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
    if (v6 != v4)
      goto LABEL_18;
  }
LABEL_19:
  ++result[3];
  return result;
}

void sub_1DF28BA14(uint64_t a1, size_t __n)
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
      sub_1DF28BAF0(a1, prime);
  }
}

void sub_1DF28BAF0(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v13;
  _QWORD *v14;

  if (a2)
  {
    if (a2 >> 61)
      sub_1DF270E9C();
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
      for (i = (_QWORD *)*v7; *v7; i = (_QWORD *)*v7)
      {
        v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2)
            v12 %= a2;
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          v7 = i;
        }
        else
        {
          v13 = i;
          if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
          {
            do
            {
              v14 = v13;
              v13 = (_QWORD *)*v13;
            }
            while (v13 && i[2] == v13[2]);
            *v7 = v13;
            *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = i;
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
            v7 = i;
            v8 = v12;
          }
        }
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

uint64_t sub_1DF28BC60(uint64_t a1)
{
  void *v2;

  sub_1DF28BC98(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void sub_1DF28BC98(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      sub_1DF2717AC((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_1DF28BCD4(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_1DF28BD28(a1, a2);
  if (!v3)
    return 0;
  v4 = 1;
  do
  {
    v5 = v4;
    v3 = (_QWORD *)*v3;
    if (!v3)
      break;
    ++v4;
  }
  while (v3[2] == *a2);
  return v5;
}

_QWORD *sub_1DF28BD28(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  int8x8_t v5;
  uint8x8_t v6;
  unint64_t v7;
  _QWORD *i;
  unint64_t v9;

  v4 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*a2 + 40))(*a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = (uint8x8_t)vcnt_s8(v5);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    v7 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v7 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v7 = (*(_QWORD *)&v5 - 1) & v4;
  }
  i = *(_QWORD **)(*a1 + 8 * v7);
  if (i)
  {
    for (i = (_QWORD *)*i; i; i = (_QWORD *)*i)
    {
      v9 = i[1];
      if (v4 == v9)
      {
        if (i[2] == *a2)
          return i;
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v9 >= *(_QWORD *)&v5)
            v9 %= *(_QWORD *)&v5;
        }
        else
        {
          v9 &= *(_QWORD *)&v5 - 1;
        }
        if (v9 != v7)
          return 0;
      }
    }
  }
  return i;
}

void sub_1DF28BE0C(void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;
  void **v6;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 3;
        v6 = v4;
        sub_1DF271804(&v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

_QWORD *sub_1DF28BE7C(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_1DF270E14();
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

char *sub_1DF28BF2C(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;

  if (a4)
  {
    v6 = result;
    sub_1DF274E0C(result, a4);
    result = sub_1DF2822E8((uint64_t)(v6 + 16), a2, a3, *((char **)v6 + 1));
    *((_QWORD *)v6 + 1) = result;
  }
  return result;
}

void sub_1DF28BF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  sub_1DF28BFB0(&a9);
  _Unwind_Resume(a1);
}

void sub_1DF28BFB0(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_1DF282478((uint64_t *)v2);
    operator delete(**a1);
  }
}

_QWORD *sub_1DF28BFF0(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x1E0BFC6C8](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x1E0DE4A90]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!sub_1DF28C154(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x1E0BFC6D4](v13);
  return a1;
}

void sub_1DF28C0F8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x1E0BFC6D4](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1DF28C0D8);
}

void sub_1DF28C140(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_1DF28C154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      sub_1DF277ED0(__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_1DF28C274(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1DF28C290(void ***a1)
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
        v4 -= 120;
        sub_1DF282D34((uint64_t)(v1 + 2), v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_1DF28C314(void **a1)
{
  void *v1;
  uint64_t v3;
  void *v4;

  v1 = *a1;
  if (*a1)
  {
    v3 = (uint64_t)a1[1];
    v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 120;
        sub_1DF282D34((uint64_t)(a1 + 2), v3);
      }
      while ((void *)v3 != v1);
      v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void sub_1DF28C380(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_1DF28C380(a1, *a2);
    sub_1DF28C380(a1, a2[1]);
    sub_1DF28C3C8((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void sub_1DF28C3C8(uint64_t a1)
{
  int v2;
  void **v3;

  v2 = *(_DWORD *)(a1 + 24);
  if (v2 == 4)
  {
    v3 = (void **)(a1 + 32);
    sub_1DF28BFB0(&v3);
  }
  else if (v2 == 3 && *(char *)(a1 + 55) < 0)
  {
    operator delete(*(void **)(a1 + 32));
  }
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t *sub_1DF28C434(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t **v6;
  uint64_t *v7;
  uint64_t **v8;
  uint64_t *v10[3];
  uint64_t v11;

  v6 = (uint64_t **)sub_1DF28C4DC((uint64_t)a1, &v11, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = v6;
    sub_1DF28C578((uint64_t)a1, a4, (uint64_t)v10);
    sub_1DF28C608(a1, v11, v8, v10[0]);
    v7 = v10[0];
    v10[0] = 0;
    sub_1DF28C85C((uint64_t)v10, 0);
  }
  return v7;
}

_QWORD *sub_1DF28C4DC(uint64_t a1, _QWORD *a2, const void **a3)
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
        if (!sub_1DF28C65C(v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!sub_1DF28C65C(v7, v9, a3))
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

_BYTE *sub_1DF28C578@<X0>(uint64_t a1@<X0>, __int128 **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  _BYTE *result;
  __int128 *v8;
  __int128 v9;

  v5 = a1 + 8;
  v6 = (char *)operator new(0x58uLL);
  *(_QWORD *)a3 = v6;
  *(_QWORD *)(a3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  result = v6 + 32;
  v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    result = sub_1DF279470(result, *(void **)v8, *((_QWORD *)v8 + 1));
  }
  else
  {
    v9 = *v8;
    *((_QWORD *)v6 + 6) = *((_QWORD *)v8 + 2);
    *(_OWORD *)result = v9;
  }
  *((_DWORD *)v6 + 14) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_1DF28C5F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1DF28C85C(v1, 0);
  _Unwind_Resume(a1);
}

uint64_t *sub_1DF28C608(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  result = sub_1DF28C6C4(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL sub_1DF28C65C(uint64_t a1, const void **a2, const void **a3)
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

uint64_t *sub_1DF28C6C4(uint64_t *result, uint64_t *a2)
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

void sub_1DF28C85C(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      sub_1DF28C3C8((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

dispatch_time_t applesauce::dispatch::v1::walltime(std::chrono::duration<long long, std::ratio<1, 1000000>>::rep a1)
{
  time_t v1;
  std::chrono::system_clock::time_point v2;
  uint64_t v3;
  timespec when;
  std::chrono::system_clock::time_point __t;

  __t.__d_.__rep_ = a1;
  v1 = std::chrono::system_clock::to_time_t(&__t);
  v2.__d_.__rep_ = std::chrono::system_clock::from_time_t(v1).__d_.__rep_;
  v3 = 1000 * (__t.__d_.__rep_ - v2.__d_.__rep_);
  if (__t.__d_.__rep_ < v2.__d_.__rep_)
    v3 += 1000000000;
  when.tv_sec = v1 + ((__t.__d_.__rep_ - v2.__d_.__rep_) >> 63);
  when.tv_nsec = v3;
  return dispatch_walltime(&when, 0);
}

void applesauce::xpc::object::to_string(void **this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD v2[2];

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v2[0] = a2;
  v2[1] = 0;
  sub_1DF28C960((uint64_t)v2, *this);
}

void sub_1DF28C944(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_1DF28C960(uint64_t a1, void *a2)
{
  uint64_t v4;
  std::string::size_type v5;
  std::string *v6;
  std::string::size_type size;
  const char *string_ptr;
  std::string::size_type length;
  int64_t value;
  std::string *v11;
  std::string *p_applier;
  std::string::size_type v13;
  size_t count;
  size_t v15;
  unint64_t v16;
  std::string *v17;
  std::string *v18;
  std::string::size_type v19;
  xpc_object_t v20;
  std::string *v21;
  std::string *v22;
  std::string::value_type v23;
  _BYTE *bytes_ptr;
  int64_t v25;
  std::string *v26;
  std::string *v27;
  std::string::size_type v28;
  _BYTE *v29;
  char v30;
  unsigned int v31;
  char v32;
  unsigned __int8 v33;
  std::string::size_type v34;
  std::string::size_type v35;
  const std::string::value_type *v36;
  std::string *v37;
  uint64_t v38;
  std::string *v39;
  std::string *v40;
  std::string::size_type v41;
  std::string *v42;
  std::string *v43;
  std::string::size_type v44;
  xpc_object_t object;
  std::string applier;
  void *v47;
  uint64_t v48;

  v4 = MEMORY[0x1E0BFC9E0](a2);
  if (v4 == MEMORY[0x1E0C812F8])
  {
    std::string::push_back(*(std::string **)a1, 123);
    if (xpc_dictionary_get_count(a2))
    {
      v5 = MEMORY[0x1E0C809B0];
      ++*(_QWORD *)(a1 + 8);
      applier.__r_.__value_.__r.__words[0] = v5;
      applier.__r_.__value_.__l.__size_ = 0x40000000;
      applier.__r_.__value_.__r.__words[2] = (std::string::size_type)sub_1DF28D278;
      v47 = &unk_1EA983A90;
      v48 = a1;
      xpc_dictionary_apply(a2, &applier);
      v6 = *(std::string **)a1;
      --*(_QWORD *)(a1 + 8);
      if (SHIBYTE(v6->__r_.__value_.__r.__words[2]) < 0)
        size = v6->__r_.__value_.__l.__size_;
      else
        size = HIBYTE(v6->__r_.__value_.__r.__words[2]);
      std::string::resize(v6, size - 1, 0);
      std::string::push_back(*(std::string **)a1, 10);
      std::string::append(*(std::string **)a1, *(_QWORD *)(a1 + 8), 9);
    }
    v22 = *(std::string **)a1;
    v23 = 125;
    goto LABEL_44;
  }
  if (v4 == MEMORY[0x1E0C81390])
  {
    string_ptr = xpc_string_get_string_ptr(a2);
    length = xpc_string_get_length(a2);
    std::string::push_back(*(std::string **)a1, 34);
    std::string::append(*(std::string **)a1, string_ptr, length);
    std::string::push_back(*(std::string **)a1, 34);
    return;
  }
  if (v4 == MEMORY[0x1E0C81328])
  {
    value = xpc_int64_get_value(a2);
    v11 = *(std::string **)a1;
    std::to_string(&applier, value);
    if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_applier = &applier;
    else
      p_applier = (std::string *)applier.__r_.__value_.__r.__words[0];
    if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v13 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
    else
      v13 = applier.__r_.__value_.__l.__size_;
LABEL_25:
    std::string::append(v11, (const std::string::value_type *)p_applier, v13);
    if (SHIBYTE(applier.__r_.__value_.__r.__words[2]) < 0)
      operator delete(applier.__r_.__value_.__l.__data_);
    return;
  }
  if (v4 == MEMORY[0x1E0C812C8])
  {
    std::string::push_back(*(std::string **)a1, 91);
    count = xpc_array_get_count(a2);
    if (!count)
    {
      std::string::push_back(*(std::string **)a1, 93);
      return;
    }
    v15 = count;
    v16 = 0;
    ++*(_QWORD *)(a1 + 8);
    do
    {
      if (v16)
        std::string::push_back(*(std::string **)a1, 44);
      std::string::push_back(*(std::string **)a1, 10);
      std::string::append(*(std::string **)a1, *(_QWORD *)(a1 + 8), 9);
      v17 = *(std::string **)a1;
      std::to_string(&applier, v16);
      if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v18 = &applier;
      else
        v18 = (std::string *)applier.__r_.__value_.__r.__words[0];
      if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v19 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
      else
        v19 = applier.__r_.__value_.__l.__size_;
      std::string::append(v17, (const std::string::value_type *)v18, v19);
      if (SHIBYTE(applier.__r_.__value_.__r.__words[2]) < 0)
        operator delete(applier.__r_.__value_.__l.__data_);
      std::string::append(*(std::string **)a1, ": ");
      v20 = xpc_array_get_value(a2, v16);
      sub_1DF28C960(a1, v20);
      ++v16;
    }
    while (v15 != v16);
    v21 = *(std::string **)a1;
    --*(_QWORD *)(a1 + 8);
    std::string::push_back(v21, 10);
    std::string::append(*(std::string **)a1, *(_QWORD *)(a1 + 8), 9);
    v22 = *(std::string **)a1;
    v23 = 93;
    goto LABEL_44;
  }
  if (v4 != MEMORY[0x1E0C812E8])
  {
    if (v4 == MEMORY[0x1E0C812D0])
    {
      if (xpc_BOOL_get_value(a2))
        v36 = "true";
      else
        v36 = "false";
      v37 = *(std::string **)a1;
      goto LABEL_82;
    }
    if (v4 != MEMORY[0x1E0C81398])
    {
      if (v4 != MEMORY[0x1E0C81350])
      {
        if (v4 == MEMORY[0x1E0C81300])
        {
          sub_1DF28D03C((std::string **)a1, a2);
        }
        else if (v4 == MEMORY[0x1E0C812F0])
        {
          sub_1DF28D0C4((std::string **)a1, a2);
        }
        else if (v4 == MEMORY[0x1E0C813A0])
        {
          sub_1DF28D16C((std::string **)a1, a2);
        }
        else if (v4 == MEMORY[0x1E0C81310])
        {
          sub_1DF28D1E4((std::string **)a1, a2);
        }
        else
        {
          object = a2;
          if (a2)
            xpc_retain(a2);
          else
            object = xpc_null_create();
          v42 = *(std::string **)a1;
          sub_1DF28D240(&object, &applier);
          if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v43 = &applier;
          else
            v43 = (std::string *)applier.__r_.__value_.__r.__words[0];
          if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v44 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
          else
            v44 = applier.__r_.__value_.__l.__size_;
          std::string::append(v42, (const std::string::value_type *)v43, v44);
          if (SHIBYTE(applier.__r_.__value_.__r.__words[2]) < 0)
            operator delete(applier.__r_.__value_.__l.__data_);
          xpc_release(object);
        }
        return;
      }
      v37 = *(std::string **)a1;
      v36 = "null";
LABEL_82:
      std::string::append(v37, v36);
      return;
    }
    v38 = xpc_uint64_get_value(a2);
    v39 = *(std::string **)a1;
    std::to_string(&applier, v38);
    if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v40 = &applier;
    else
      v40 = (std::string *)applier.__r_.__value_.__r.__words[0];
    if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v41 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
    else
      v41 = applier.__r_.__value_.__l.__size_;
    std::string::append(v39, (const std::string::value_type *)v40, v41);
    if (SHIBYTE(applier.__r_.__value_.__r.__words[2]) < 0)
      operator delete(applier.__r_.__value_.__l.__data_);
    v22 = *(std::string **)a1;
    v23 = 117;
LABEL_44:
    std::string::push_back(v22, v23);
    return;
  }
  bytes_ptr = xpc_data_get_bytes_ptr(a2);
  v25 = xpc_data_get_length(a2);
  std::string::append(*(std::string **)a1, "[");
  v26 = *(std::string **)a1;
  std::to_string(&applier, v25);
  if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v27 = &applier;
  else
    v27 = (std::string *)applier.__r_.__value_.__r.__words[0];
  if ((applier.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v28 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
  else
    v28 = applier.__r_.__value_.__l.__size_;
  std::string::append(v26, (const std::string::value_type *)v27, v28);
  if (SHIBYTE(applier.__r_.__value_.__r.__words[2]) < 0)
    operator delete(applier.__r_.__value_.__l.__data_);
  std::string::append(*(std::string **)a1, " bytes]");
  if (v25)
  {
    std::string::append(*(std::string **)a1, " ");
    v11 = *(std::string **)a1;
    memset(&applier, 0, sizeof(applier));
    if (v25 < 1)
    {
      v33 = 0;
    }
    else
    {
      v29 = &bytes_ptr[v25];
      do
      {
        if (*bytes_ptr >= 0xA0u)
          v30 = 87;
        else
          v30 = 48;
        std::string::push_back(&applier, v30 + (*bytes_ptr >> 4));
        v31 = *bytes_ptr & 0xF;
        if (v31 >= 0xA)
          v32 = 87;
        else
          v32 = 48;
        std::string::push_back(&applier, v32 + v31);
        std::string::push_back(&applier, 32);
        ++bytes_ptr;
      }
      while (bytes_ptr < v29);
      v33 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
      if (SHIBYTE(applier.__r_.__value_.__r.__words[2]) < 0)
      {
        v34 = applier.__r_.__value_.__l.__size_;
        if (applier.__r_.__value_.__l.__size_)
        {
          v35 = applier.__r_.__value_.__r.__words[0];
          goto LABEL_87;
        }
      }
      else if (*((_BYTE *)&applier.__r_.__value_.__s + 23))
      {
        v34 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
        v35 = (std::string::size_type)&applier;
LABEL_87:
        std::string::erase(&applier, ~v35 + v35 + v34, 1uLL);
        v33 = HIBYTE(applier.__r_.__value_.__r.__words[2]);
      }
    }
    if ((v33 & 0x80u) == 0)
      p_applier = &applier;
    else
      p_applier = (std::string *)applier.__r_.__value_.__r.__words[0];
    if ((v33 & 0x80u) == 0)
      v13 = v33;
    else
      v13 = applier.__r_.__value_.__l.__size_;
    goto LABEL_25;
  }
}

void sub_1DF28CFD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void sub_1DF28D03C(std::string **a1, xpc_object_t xdouble)
{
  double value;
  std::string *v4;
  std::string *v5;
  std::string::size_type size;
  std::string v7;

  value = xpc_double_get_value(xdouble);
  v4 = *a1;
  std::to_string(&v7, value);
  if ((v7.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = &v7;
  else
    v5 = (std::string *)v7.__r_.__value_.__r.__words[0];
  if ((v7.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v7.__r_.__value_.__r.__words[2]);
  else
    size = v7.__r_.__value_.__l.__size_;
  std::string::append(v4, (const std::string::value_type *)v5, size);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v7.__r_.__value_.__l.__data_);
}

void sub_1DF28D0A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *sub_1DF28D0C4(std::string **a1, xpc_object_t xdate)
{
  tm v4;
  time_t v5;
  std::string::value_type __s[30];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = xpc_date_get_value(xdate) / 0x3B9ACA00uLL;
  localtime_r(&v5, &v4);
  strftime(__s, 0x1EuLL, "%F %T %Z", &v4);
  return std::string::append(*a1, __s);
}

std::string *sub_1DF28D16C(std::string **a1, xpc_object_t xuuid)
{
  const unsigned __int8 *bytes;
  _BYTE v5[37];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  memset(v5, 0, sizeof(v5));
  bytes = xpc_uuid_get_bytes(xuuid);
  uuid_unparse_lower(bytes, v5);
  return std::string::append(*a1, v5);
}

void sub_1DF28D1E4(std::string **a1, xpc_object_t xdict)
{
  const char *string;

  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]);
  std::string::append(*a1, "XPC_ERROR(");
  std::string::append(*a1, string);
  std::string::push_back(*a1, 41);
}

void sub_1DF28D240(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  char *v3;

  v3 = (char *)MEMORY[0x1E0BFC968](*a1);
  sub_1DF28BE7C(a2, v3);
  free(v3);
}

uint64_t sub_1DF28D278(uint64_t a1, const std::string::value_type *a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(a1 + 32);
  std::string::push_back(*(std::string **)v5, 10);
  std::string::append(*(std::string **)v5, *(_QWORD *)(v5 + 8), 9);
  std::string::push_back(*(std::string **)v5, 34);
  std::string::append(*(std::string **)v5, a2);
  std::string::append(*(std::string **)v5, "\": ");
  sub_1DF28C960(v5, a3);
  std::string::push_back(*(std::string **)v5, 44);
  return 1;
}

BOOL applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, uint64_t a2)
{
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t value;

  v4 = MEMORY[0x1E0BFC9E0](*a1);
  v5 = *a1;
  if (v4 == MEMORY[0x1E0C812D0])
    return v5 == (xpc_object_t)MEMORY[0x1E0C81240];
  v6 = MEMORY[0x1E0BFC9E0](v5);
  v7 = *a1;
  if (v6 == MEMORY[0x1E0C81328])
  {
    value = xpc_int64_get_value(v7);
    return value != 0;
  }
  if (MEMORY[0x1E0BFC9E0](v7) == MEMORY[0x1E0C81398])
  {
    value = xpc_uint64_get_value(*a1);
    return value != 0;
  }
  return a2;
}

uint64_t applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, unsigned int a2)
{
  return applesauce::xpc::dyn_cast_or_default(a1, a2);
}

char *applesauce::xpc::dyn_cast_or_default@<X0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, char **a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *bytes_ptr;
  size_t length;

  v6 = MEMORY[0x1E0BFC9E0](*a1);
  v7 = MEMORY[0x1E0C812E8];
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  if (v6 != v7)
    return (char *)sub_1DF28D7D8(a3, *(const void **)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
  bytes_ptr = (char *)xpc_data_get_bytes_ptr(*a1);
  length = xpc_data_get_length(*a1);
  return sub_1DF28D5F0((uint64_t)a3, *a3, bytes_ptr, &bytes_ptr[length], length);
}

void sub_1DF28D450(_Unwind_Exception *exception_object)
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

_QWORD *applesauce::xpc::dyn_cast_or_default@<X0>(xpc_object_t *a1@<X0>, char *a2@<X1>, _QWORD *a3@<X8>)
{
  char *string_ptr;
  size_t length;

  if (MEMORY[0x1E0BFC9E0](*a1) != MEMORY[0x1E0C81390])
    return sub_1DF28BE7C(a3, a2);
  string_ptr = (char *)xpc_string_get_string_ptr(*a1);
  length = xpc_string_get_length(*a1);
  return sub_1DF28D548(a3, string_ptr, length);
}

double applesauce::xpc::dyn_cast_or_default(xpc_object_t *a1, double a2)
{
  if (MEMORY[0x1E0BFC9E0](*a1) == MEMORY[0x1E0C81300])
    return xpc_double_get_value(*a1);
  else
    return a2;
}

_QWORD *sub_1DF28D548(_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_1DF270E14();
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

char *sub_1DF28D5F0(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  char *v5;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  size_t v15;
  size_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  int64_t v25;
  char v26;
  char *v27;
  char *v28;
  size_t v29;
  char *v30;
  char *v31;
  char *v32;

  v5 = __dst;
  if (a5 < 1)
    return v5;
  v10 = *(char **)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    v11 = *(char **)a1;
    v12 = (uint64_t)&v10[a5 - *(_QWORD *)a1];
    if (v12 < 0)
      sub_1DF271380();
    v13 = (char *)(__dst - v11);
    v14 = v9 - (_QWORD)v11;
    if (2 * v14 > v12)
      v12 = 2 * v14;
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL)
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v15 = v12;
    if (v15)
    {
      v16 = v15;
      v17 = (char *)operator new(v15);
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
    v27 = &v13[(_QWORD)v17];
    memcpy(&v13[(_QWORD)v17], __src, a5);
    v28 = &v13[(_QWORD)v17];
    v29 = v16;
    if (v11 != v5)
    {
      do
      {
        v13[(_QWORD)v17 - 1] = v13[(_QWORD)(v11 - 1)];
        --v13;
      }
      while (v13);
      v10 = *(char **)(a1 + 8);
      v28 = v17;
    }
    v30 = &v27[a5];
    v31 = &v17[v29];
    if (v10 != v5)
      memmove(v30, v5, v10 - v5);
    v32 = *(char **)a1;
    *(_QWORD *)a1 = v28;
    *(_QWORD *)(a1 + 8) = &v30[v10 - v5];
    *(_QWORD *)(a1 + 16) = v31;
    if (v32)
      operator delete(v32);
    return v27;
  }
  v18 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    v19 = &__src[a5];
    v21 = *(char **)(a1 + 8);
LABEL_17:
    v22 = &v5[a5];
    v23 = &v21[-a5];
    v24 = v21;
    if (&v21[-a5] < v10)
    {
      v25 = &v10[a5] - v21;
      v24 = v21;
      do
      {
        v26 = *v23++;
        *v24++ = v26;
        --v25;
      }
      while (v25);
    }
    *(_QWORD *)(a1 + 8) = v24;
    if (v21 != v22)
      memmove(&v5[a5], v5, v21 - v22);
    if (v19 != __src)
      memmove(v5, __src, v19 - __src);
    return v5;
  }
  v19 = &__src[v18];
  v20 = a4 - &__src[v18];
  if (a4 != &__src[v18])
    memmove(*(void **)(a1 + 8), &__src[v18], a4 - &__src[v18]);
  v21 = &v10[v20];
  *(_QWORD *)(a1 + 8) = &v10[v20];
  if (v18 >= 1)
    goto LABEL_17;
  return v5;
}

_QWORD *sub_1DF28D7D8(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = sub_1DF28D850(result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1DF28D834(_Unwind_Exception *exception_object)
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

char *sub_1DF28D850(_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    sub_1DF271380();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void applesauce::xpc::auto_reply::create_from_request(xpc_object_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  xpc_object_t reply;
  xpc_object_t v7;
  void *v8;
  xpc_object_t v9;

  v4 = MEMORY[0x1E0BFC9E0](*a1);
  v5 = MEMORY[0x1E0C812F8];
  if (v4 != MEMORY[0x1E0C812F8])
  {
    *a2 = 0;
    a2[1] = 0;
    return;
  }
  reply = xpc_dictionary_create_reply(*a1);
  v7 = reply;
  if (reply)
  {
    v9 = reply;
  }
  else
  {
    v7 = xpc_null_create();
    v9 = v7;
    if (!v7)
    {
      v8 = 0;
      goto LABEL_10;
    }
  }
  if (MEMORY[0x1E0BFC9E0](v7) != v5)
  {
    v8 = v7;
LABEL_10:
    v7 = xpc_null_create();
    v9 = v7;
    goto LABEL_11;
  }
  xpc_retain(v7);
  v8 = v7;
LABEL_11:
  applesauce::xpc::auto_reply::create_from_reply(&v9, a2);
  xpc_release(v7);
  v9 = 0;
  xpc_release(v8);
}

void applesauce::xpc::auto_reply::create_from_reply(xpc_object_t *a1@<X0>, _QWORD *a2@<X8>)
{
  xpc_connection_t remote_connection;
  xpc_object_t v5;
  uint64_t v6;
  void *v7;
  xpc_object_t v8;

  if (MEMORY[0x1E0BFC9E0](*a1) != MEMORY[0x1E0C812F8])
  {
    *a2 = 0;
    a2[1] = 0;
    return;
  }
  remote_connection = xpc_dictionary_get_remote_connection(*a1);
  v5 = remote_connection;
  v6 = MEMORY[0x1E0C812E0];
  if (remote_connection)
  {
    xpc_retain(remote_connection);
    v8 = v5;
  }
  else
  {
    v5 = xpc_null_create();
    v8 = v5;
    if (!v5)
      goto LABEL_7;
  }
  if (MEMORY[0x1E0BFC9E0](v5) == v6)
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
LABEL_7:
  v8 = xpc_null_create();
LABEL_9:
  xpc_release(v5);
  v7 = v8;
  if (MEMORY[0x1E0BFC9E0](v8) == v6)
  {
    applesauce::xpc::auto_reply::create_from_dict((std::__shared_weak_count_vtbl **)a1, (uint64_t *)&v8, a2);
  }
  else
  {
    *a2 = 0;
    a2[1] = 0;
  }
  xpc_release(v7);
}

void applesauce::xpc::auto_reply::create_from_dict(std::__shared_weak_count_vtbl **a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  std::__shared_weak_count_vtbl *v8;
  _QWORD *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;

  if (MEMORY[0x1E0BFC9E0](*a1) == MEMORY[0x1E0C812F8] && MEMORY[0x1E0BFC9E0](*a2) == MEMORY[0x1E0C812E0])
  {
    v6 = (std::__shared_weak_count *)operator new(0x28uLL);
    v6->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    v6->__shared_weak_owners_ = 0;
    v6->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA983758;
    v8 = *a1;
    v6[1].__vftable = *a1;
    v9 = &v6[1].__vftable;
    if (v8)
      xpc_retain(v8);
    else
      *v9 = xpc_null_create();
    v10 = (void *)*a2;
    v6[1].__shared_owners_ = *a2;
    if (v10)
      xpc_retain(v10);
    else
      v6[1].__shared_owners_ = (uint64_t)xpc_null_create();
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
    *a3 = v9;
    a3[1] = v6;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
}

void sub_1DF28DB94(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA983758;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_1DF28DBA4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA983758;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1E0BFC7D0);
}

void sub_1DF28DBD4(uint64_t a1)
{
  if (MEMORY[0x1E0BFC9E0](*(_QWORD *)(a1 + 32)) == MEMORY[0x1E0C812E0]
    && MEMORY[0x1E0BFC9E0](*(_QWORD *)(a1 + 24)) == MEMORY[0x1E0C812F8])
  {
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 24));
  }
  xpc_release(*(xpc_object_t *)(a1 + 32));
  *(_QWORD *)(a1 + 32) = 0;
  xpc_release(*(xpc_object_t *)(a1 + 24));
  *(_QWORD *)(a1 + 24) = 0;
}

void sub_1DF28DC60(std::__shared_weak_count *a1)
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x1E0DE41C8](this, __c, __pos);
}

std::string *__cdecl std::locale::name(std::string *__return_ptr retstr, const std::locale *this)
{
  return (std::string *)MEMORY[0x1E0DE4240](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1E0DE4320](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4310](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1E0DE4328](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4340](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

std::regex_error *__cdecl std::regex_error::regex_error(std::regex_error *this, std::regex_constants::error_type __ecode)
{
  return (std::regex_error *)MEMORY[0x1E0DE43B0](this, *(_QWORD *)&__ecode);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4408](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1E0DE4438](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4468](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

std::string *__cdecl std::string::operator=(std::string *this, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x1E0DE44E0](this, __c);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE4710]();
}

std::regex_traits<char>::char_class_type std::__get_classname(const char *__s, BOOL __icase)
{
  return MEMORY[0x1E0DE47C8](__s, __icase);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

std::string *__cdecl std::__get_collation_name(std::string *__return_ptr retstr, const char *__s)
{
  return (std::string *)MEMORY[0x1E0DE4910](retstr, __s);
}

uint64_t std::stol(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1E0DE4A80](__str, __idx, *(_QWORD *)&__base);
}

std::chrono::system_clock::time_point std::chrono::system_clock::from_time_t(time_t __t)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x1E0DE4B40](__t);
}

time_t std::chrono::system_clock::to_time_t(const std::chrono::system_clock::time_point *__t)
{
  return MEMORY[0x1E0DE4B50](__t);
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x1E0DE4B88](this, a2);
}

std::locale *__cdecl std::locale::locale(std::locale *this)
{
  return (std::locale *)MEMORY[0x1E0DE4B90](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x1E0DE4D40](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D70](retstr, __val);
}

{
  return (std::string *)MEMORY[0x1E0DE4D80](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x1E0DE4D78](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1EA982868(__p);
}

uint64_t operator delete()
{
  return off_1EA982870();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1EA982878(__sz);
}

uint64_t operator new()
{
  return off_1EA982880();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_typeid(void)
{
  MEMORY[0x1E0DE5078]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A48](uu, out);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1E0C861D0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86628]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1E0C86748](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

