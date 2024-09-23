@implementation ML3SpotlightMatchPredicateNameForID

void __ML3SpotlightMatchPredicateNameForID_block_invoke(uint64_t a1, _QWORD *a2)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;
  uint64_t **v7;
  uint64_t *i;
  unint64_t v9;
  std::string *p_p;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  std::string __p;

  v3 = (int8x8_t)a2[1];
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = (uint8x8_t)vcnt_s8(v3);
    v5.i16[0] = vaddlv_u8(v5);
    if (v5.u32[0] > 1uLL)
    {
      v6 = *(_QWORD *)(a1 + 40);
      if (v4 >= *(_QWORD *)&v3)
        v6 = v4 % *(_QWORD *)&v3;
    }
    else
    {
      v6 = (*(_QWORD *)&v3 - 1) & v4;
    }
    v7 = *(uint64_t ***)(*a2 + 8 * v6);
    if (v7)
    {
      for (i = *v7; i; i = (uint64_t *)*i)
      {
        v9 = i[1];
        if (v9 == v4)
        {
          if (i[2] == v4)
          {
            if (*((char *)i + 47) < 0)
              std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)i[3], i[4]);
            else
              __p = *(std::string *)((_BYTE *)i + 1);
            goto LABEL_18;
          }
        }
        else
        {
          if (v5.u32[0] > 1uLL)
          {
            if (v9 >= *(_QWORD *)&v3)
              v9 %= *(_QWORD *)&v3;
          }
          else
          {
            v9 &= *(_QWORD *)&v3 - 1;
          }
          if (v9 != v6)
            break;
        }
      }
    }
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, 0);
LABEL_18:
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", p_p, 4, *(_OWORD *)&__p.__r_.__value_.__l.__data_, __p.__r_.__value_.__r.__words[2]);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

@end
