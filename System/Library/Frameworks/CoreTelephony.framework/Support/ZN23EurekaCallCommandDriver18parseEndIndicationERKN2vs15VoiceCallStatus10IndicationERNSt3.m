@implementation ZN23EurekaCallCommandDriver18parseEndIndicationERKN2vs15VoiceCallStatus10IndicationERNSt3

char *___ZN23EurekaCallCommandDriver18parseEndIndicationERKN2vs15VoiceCallStatus10IndicationERNSt3__13mapIh8CallInfoNS5_4lessIhEENS5_9allocatorINS5_4pairIKhS7_EEEEEEN10subscriber7SimSlotE_block_invoke(char *result, const void **a2)
{
  _QWORD *v2;
  char *v3;
  char *v4;
  int64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  char **v11;
  uint64_t v12;
  char *v13;
  char *v14;
  size_t v15;
  unint64_t v16;
  char *v17;
  void *v18;
  char *v19;

  v2 = *(_QWORD **)(*((_QWORD *)result + 4) + 8);
  if (v2 + 5 != a2)
  {
    v3 = (char *)*a2;
    v4 = (char *)a2[1];
    v5 = v4 - (_BYTE *)*a2;
    v6 = v5 >> 2;
    v7 = v2[7];
    v8 = (char *)v2[5];
    if (v5 >> 2 <= (unint64_t)((v7 - (uint64_t)v8) >> 2))
    {
      v14 = (char *)v2[6];
      v11 = (char **)(v2 + 6);
      v13 = v14;
      v15 = v14 - v8;
      v16 = (v14 - v8) >> 2;
      if (v16 < v6)
      {
        v17 = &v3[4 * v16];
        if (v13 != v8)
        {
          result = (char *)memmove(v8, *a2, v15);
          v8 = *v11;
        }
        v5 = v4 - v17;
        if (v4 == v17)
          goto LABEL_21;
        v18 = v8;
        v19 = v17;
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
      if (v5 < 0)
        goto LABEL_23;
      v9 = v7 >> 1;
      if (v7 >> 1 <= v6)
        v9 = v5 >> 2;
      v10 = (unint64_t)v7 >= 0x7FFFFFFFFFFFFFFCLL ? 0x3FFFFFFFFFFFFFFFLL : v9;
      if (v10 >> 62)
LABEL_23:
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::array<unsigned char,4ul>>>((uint64_t)(v2 + 7), v10);
      v8 = result;
      v2[6] = result;
      v11 = (char **)(v2 + 6);
      *(v11 - 1) = result;
      v11[1] = &result[4 * v12];
    }
    if (v4 == v3)
    {
LABEL_21:
      *v11 = &v8[v5];
      return result;
    }
    v18 = v8;
    v19 = v3;
LABEL_20:
    result = (char *)memmove(v18, v19, v5);
    goto LABEL_21;
  }
  return result;
}

@end
