@implementation ZN23EurekaCallCommandDriver32parseAndUpdateParentCallIds

char *___ZN23EurekaCallCommandDriver32parseAndUpdateParentCallIds_syncERKN2vs15VoiceCallStatus10IndicationEN10subscriber7SimSlotE_block_invoke(char *result, const void **a2)
{
  _QWORD *v2;
  char *v3;
  char *v4;
  size_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char **v12;
  uint64_t v13;
  char *v14;
  char *v15;
  size_t v16;
  unint64_t v17;
  char *v18;
  void *v19;
  char *v20;

  v2 = *(_QWORD **)(*((_QWORD *)result + 4) + 8);
  if (v2 + 5 != a2)
  {
    v3 = (char *)*a2;
    v4 = (char *)a2[1];
    v5 = v4 - (_BYTE *)*a2;
    v6 = 0xAAAAAAAAAAAAAAABLL * v5;
    v7 = v2[7];
    v8 = (char *)v2[5];
    if (0xAAAAAAAAAAAAAAABLL * (v7 - (_QWORD)v8) >= 0xAAAAAAAAAAAAAAABLL * v5)
    {
      v15 = (char *)v2[6];
      v12 = (char **)(v2 + 6);
      v14 = v15;
      v16 = v15 - v8;
      v17 = 0xAAAAAAAAAAAAAAABLL * (v15 - v8);
      if (v17 < v6)
      {
        v18 = &v3[3 * v17];
        if (v14 != v8)
        {
          result = (char *)memmove(v8, *a2, v16);
          v8 = *v12;
        }
        v5 = v4 - v18;
        if (v4 == v18)
          goto LABEL_21;
        v19 = v8;
        v20 = v18;
        goto LABEL_20;
      }
    }
    else
    {
      if (v8)
      {
        v2[6] = v8;
        operator delete(v8);
        v7 = 0;
        v2[5] = 0;
        v2[6] = 0;
        v2[7] = 0;
      }
      if (v6 >= 0x5555555555555556)
        goto LABEL_23;
      v9 = 0xAAAAAAAAAAAAAAABLL * v7;
      v10 = 2 * v9;
      if (2 * v9 <= v6)
        v10 = 0xAAAAAAAAAAAAAAABLL * v5;
      v11 = v9 >= 0x2AAAAAAAAAAAAAAALL ? 0x5555555555555555 : v10;
      if (v11 >= 0x5555555555555556)
LABEL_23:
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<vs::tlv::ParentCallInfoItem>>((uint64_t)(v2 + 7), v11);
      v8 = result;
      v2[6] = result;
      v12 = (char **)(v2 + 6);
      *(v12 - 1) = result;
      v12[1] = &result[3 * v13];
    }
    if (v4 == v3)
    {
LABEL_21:
      *v12 = &v8[v5];
      return result;
    }
    v19 = v8;
    v20 = v3;
LABEL_20:
    result = (char *)memmove(v19, v20, v5);
    goto LABEL_21;
  }
  return result;
}

@end
