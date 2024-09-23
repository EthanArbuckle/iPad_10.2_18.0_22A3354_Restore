@implementation ZN16IVFVectorIndex

int *___ZN16IVFVectorIndex_sC2EiPKcbbPViP10data_map_sjU13block_pointerFvS1_jt14vec_dimensions15vec_data_formatb20VectorIndexOpenErrorE_block_invoke_93(int *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  BOOL v19;
  _QWORD *v20;
  int v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  size_t v25;
  size_t v26;
  void **p_dst;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  const std::string::value_type *v34;
  std::string::size_type v35;
  std::string *v36;
  std::string::size_type v37;
  void **v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  void **__dst;
  std::string::size_type v43;
  int64_t v44;
  void *__p[2];
  uint64_t v46;
  std::string v47;
  uint64_t v48;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = result;
  v48 = *MEMORY[0x1E0C80C00];
  v12 = *((_QWORD *)result + 6);
  v15 = *(_QWORD **)(v12 + 88);
  v13 = (_QWORD *)(v12 + 88);
  v14 = v15;
  if (!v15)
    goto LABEL_12;
  v16 = a6 | (2
            * (((unint64_t)(a4 & 3) << 50) | ((unint64_t)(a5 & 3) << 48) | (a3 << 32) | a2));
  v17 = v13;
  do
  {
    v18 = v14[4];
    v19 = v18 >= v16;
    if (v18 >= v16)
      v20 = v14;
    else
      v20 = v14 + 1;
    if (v19)
      v17 = v14;
    v14 = (_QWORD *)*v20;
  }
  while (*v20);
  if (v17 == v13 || v16 < v17[4])
  {
LABEL_12:
    v21 = *__error();
    v22 = _SILogForLogForCategory(16);
    v23 = dword_1EF19FCCC < 3;
    if (!os_log_type_enabled(v22, (os_log_type_t)(dword_1EF19FCCC < 3)))
      goto LABEL_33;
    v41 = v21;
    v24 = (const char *)*((_QWORD *)v11 + 7);
    v25 = strlen(v24);
    if (v25 >= 0x7FFFFFFFFFFFFFF8)
      abort();
    v26 = v25;
    v40 = v6;
    if (v25 >= 0x17)
    {
      v28 = (v25 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v25 | 7) != 0x17)
        v28 = v25 | 7;
      v39 = v10;
      v29 = v9;
      v30 = v8;
      v31 = v7;
      v32 = v28 + 1;
      p_dst = (void **)operator new(v28 + 1);
      v33 = v32 | 0x8000000000000000;
      v7 = v31;
      v8 = v30;
      v9 = v29;
      v10 = v39;
      v43 = v26;
      v44 = v33;
      __dst = p_dst;
    }
    else
    {
      HIBYTE(v44) = v25;
      p_dst = (void **)&__dst;
      if (!v25)
      {
LABEL_21:
        *((_BYTE *)p_dst + v26) = 0;
        v6 = v40;
        IVFIndexName((uint64_t)&v47, v10, v9, v8, v7);
        if (v44 >= 0)
          v34 = (const std::string::value_type *)&__dst;
        else
          v34 = (const std::string::value_type *)__dst;
        if (v44 >= 0)
          v35 = HIBYTE(v44);
        else
          v35 = v43;
        v36 = std::string::insert(&v47, 0, v34, v35);
        v37 = v36->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
        v46 = v37;
        v36->__r_.__value_.__l.__size_ = 0;
        v36->__r_.__value_.__r.__words[2] = 0;
        v36->__r_.__value_.__r.__words[0] = 0;
        if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v47.__r_.__value_.__l.__data_);
        v38 = __p;
        if (v46 < 0)
          v38 = (void **)__p[0];
        LODWORD(v47.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v47.__r_.__value_.__r.__words + 4) = (std::string::size_type)v38;
        _os_log_impl(&dword_1B8270000, v22, v23, "*warn* Vector index missing: %s", (uint8_t *)&v47, 0xCu);
        v21 = v41;
        if (SHIBYTE(v46) < 0)
        {
          operator delete(__p[0]);
          if ((SHIBYTE(v44) & 0x80000000) == 0)
            goto LABEL_33;
        }
        else if ((SHIBYTE(v44) & 0x80000000) == 0)
        {
          goto LABEL_33;
        }
        operator delete(__dst);
LABEL_33:
        result = __error();
        *result = v21;
        *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v11 + 5) + 8) + 24) = 1;
        if (v6)
        {
          result = (int *)*((_QWORD *)v11 + 4);
          if (result)
            return (int *)(*((uint64_t (**)(int *, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))result
                           + 2))(result, *((_QWORD *)v11 + 7), v10, v9, v8, v7, 1, 5);
        }
        return result;
      }
    }
    memmove(p_dst, v24, v26);
    goto LABEL_21;
  }
  return result;
}

@end
