@implementation ZN8Espresso17ANECompilerEngine7context28transform

__int16 *___ZN8Espresso17ANECompilerEngine7context28transform_reflective_paddingEPNS_3netEPS1__block_invoke(uint64_t a1, int64x2_t *a2)
{
  __int16 *result;
  uint64_t v4;
  BOOL v5;
  __int16 *v7;
  int v8;
  int v9;
  int v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  std::string *v21;
  uint64_t **v22;
  char *v23;
  const void *v24;
  const std::string *v25;
  std::string *v26;
  std::string::size_type size;
  std::string *v28;
  __int128 v29;
  std::string *v30;
  std::string::size_type v31;
  std::string *v32;
  __int128 v33;
  std::string *v34;
  std::string::size_type v35;
  char v36;
  std::string v37;
  std::string v38;
  std::string v39;
  std::string v40;
  std::string v41;
  std::string __p;
  _OWORD v43[2];
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  _QWORD v48[2];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  result = (__int16 *)a2->i64[0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a2->i64[0] + 8) == v4 || v4 == 0;
  if (v5)
  {
    result = (__int16 *)(*(uint64_t (**)(__int16 *))(*(_QWORD *)result + 336))(result);
    if ((_DWORD)result)
    {
      result = (__int16 *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a2->i64[0] + 320))(a2->i64[0]);
      if (result[1] == 2)
      {
        v7 = result;
        v8 = (unsigned __int16)result[4];
        if (v8 == (unsigned __int16)result[5])
        {
          v9 = (unsigned __int16)result[6];
          v5 = v9 == (unsigned __int16)result[7];
          v10 = v9 | v8;
          v11 = v5 && (__int16)v8 <= 3;
          if (v11 && v10 != 0)
          {
            v13 = *(_QWORD *)(a1 + 40);
            v14 = *(_QWORD *)(v13 + 24);
            v48[0] = *(_QWORD *)(v13 + 16);
            v48[1] = v14;
            if (v14)
            {
              v15 = (unint64_t *)(v14 + 8);
              do
                v16 = __ldxr(v15);
              while (__stxr(v16 + 1, v15));
              v13 = *(_QWORD *)(a1 + 40);
            }
            v17 = a2[3].i32[2];
            *(_QWORD *)&v43[0] = v17;
            v18 = std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v13 + 96, v17, v43)[3];
            v19 = *(_QWORD *)(a1 + 40) + 56;
            v20 = a2[3].i32[2];
            *(_QWORD *)&v43[0] = v20;
            v21 = (std::string *)std::__hash_table<std::__hash_value_type<unsigned long,std::vector<std::string>>,std::__unordered_map_hasher<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::hash<unsigned long>,std::equal_to<unsigned long>,true>,std::__unordered_map_equal<unsigned long,std::__hash_value_type<unsigned long,std::vector<std::string>>,std::equal_to<unsigned long>,std::hash<unsigned long>,true>,std::allocator<std::__hash_value_type<unsigned long,std::vector<std::string>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long &&>,std::tuple<>>(v19, v20, v43)[3];
            v22 = (uint64_t **)(*(_QWORD *)(a1 + 40) + 184);
            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v21;
            v23 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v22, v21, (__int128 **)&__p);
            v43[0] = *(_OWORD *)(v23 + 56);
            v43[1] = *(_OWORD *)(v23 + 72);
            v24 = (const void *)*((_QWORD *)v23 + 12);
            v44 = *((_QWORD *)v23 + 11);
            v45 = 0;
            v46 = 0;
            v47 = 0;
            std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v45, v24, *((_QWORD *)v23 + 13), (uint64_t)(*((_QWORD *)v23 + 13) - (_QWORD)v24) >> 2);
            if (*((_QWORD *)v7 + 1) != 0x2000200020002 || LODWORD(v43[0]) == DWORD1(v43[0]))
            {
              Espresso::single_match_state<Espresso::ANECompilerEngine::general_padding_kernel>::remove_layer(a2);
              memset(&__p, 0, sizeof(__p));
              v25 = v21;
              if (v7[4] && (v25 = (const std::string *)v18, v7[6]))
              {
                std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>("_refl_pad_lrtb_", (const void **)&v21->__r_.__value_.__l.__data_, &v39);
                std::to_string(&v38, v7[4]);
                if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v26 = &v38;
                else
                  v26 = (std::string *)v38.__r_.__value_.__r.__words[0];
                if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  size = HIBYTE(v38.__r_.__value_.__r.__words[2]);
                else
                  size = v38.__r_.__value_.__l.__size_;
                v28 = std::string::append(&v39, (const std::string::value_type *)v26, size);
                v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
                v40.__r_.__value_.__r.__words[2] = v28->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v29;
                v28->__r_.__value_.__l.__size_ = 0;
                v28->__r_.__value_.__r.__words[2] = 0;
                v28->__r_.__value_.__r.__words[0] = 0;
                std::to_string(&v37, v7[5]);
                if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v30 = &v37;
                else
                  v30 = (std::string *)v37.__r_.__value_.__r.__words[0];
                if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v31 = HIBYTE(v37.__r_.__value_.__r.__words[2]);
                else
                  v31 = v37.__r_.__value_.__l.__size_;
                v32 = std::string::append(&v40, (const std::string::value_type *)v30, v31);
                v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
                v41.__r_.__value_.__r.__words[2] = v32->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v41.__r_.__value_.__l.__data_ = v33;
                v32->__r_.__value_.__l.__size_ = 0;
                v32->__r_.__value_.__r.__words[2] = 0;
                v32->__r_.__value_.__r.__words[0] = 0;
                v34 = std::string::append(&v41, "00");
                v35 = v34->__r_.__value_.__r.__words[0];
                v49[0] = v34->__r_.__value_.__l.__size_;
                *(_QWORD *)((char *)v49 + 7) = *(std::string::size_type *)((char *)&v34->__r_.__value_.__r.__words[1] + 7);
                v36 = HIBYTE(v34->__r_.__value_.__r.__words[2]);
                v34->__r_.__value_.__l.__size_ = 0;
                v34->__r_.__value_.__r.__words[2] = 0;
                v34->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(__p.__r_.__value_.__l.__data_);
                __p.__r_.__value_.__r.__words[0] = v35;
                __p.__r_.__value_.__l.__size_ = v49[0];
                *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)v49 + 7);
                *((_BYTE *)&__p.__r_.__value_.__s + 23) = v36;
                if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v41.__r_.__value_.__l.__data_);
                if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v37.__r_.__value_.__l.__data_);
                if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v40.__r_.__value_.__l.__data_);
                if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v38.__r_.__value_.__l.__data_);
                if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v39.__r_.__value_.__l.__data_);
              }
              else
              {
                std::string::operator=(&__p, v25);
              }
              transform_reflective_padding_lr(a2, *(_QWORD **)(a1 + 40), (uint64_t)v43, v7[4], (uint64_t)v21, &__p);
              transform_reflective_padding_tb(a2, *(_QWORD **)(a1 + 40), (uint64_t)v43, v7[6], (uint64_t)&__p, v18);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
            }
            if (v45)
            {
              v46 = v45;
              operator delete(v45);
            }
            return (__int16 *)std::shared_ptr<void>::~shared_ptr[abi:ne180100]((uint64_t)v48);
          }
        }
      }
    }
  }
  return result;
}

@end
