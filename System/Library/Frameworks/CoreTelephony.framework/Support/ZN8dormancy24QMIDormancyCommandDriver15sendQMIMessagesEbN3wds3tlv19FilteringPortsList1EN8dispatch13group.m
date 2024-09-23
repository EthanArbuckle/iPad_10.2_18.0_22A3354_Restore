@implementation ZN8dormancy24QMIDormancyCommandDriver15sendQMIMessagesEbN3wds3tlv19FilteringPortsList1EN8dispatch13group

_QWORD *___ZN8dormancy24QMIDormancyCommandDriver15sendQMIMessagesEbN3wds3tlv19FilteringPortsList1EN8dispatch13group_sessionE_block_invoke_2(_QWORD *result, void **a2)
{
  char *v3;
  _BYTE *v4;
  size_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  void **v11;
  char *v12;
  char *v13;
  unint64_t v14;
  char *v15;
  void *v16;
  char *v17;

  if (result + 4 != a2)
  {
    v3 = (char *)result[4];
    v4 = (_BYTE *)result[5];
    v5 = v4 - v3;
    v6 = (v4 - v3) >> 2;
    v7 = (uint64_t)a2[2];
    v8 = (char *)*a2;
    if (v6 <= (v7 - (uint64_t)*a2) >> 2)
    {
      v11 = a2 + 1;
      v13 = (char *)a2[1];
      v14 = (v13 - v8) >> 2;
      if (v14 < v6)
      {
        v15 = &v3[4 * v14];
        if (v13 != v8)
        {
          result = memmove(*a2, v3, v13 - v8);
          v8 = (char *)*v11;
        }
        v5 = v4 - v15;
        if (v4 == v15)
          goto LABEL_20;
        v16 = v8;
        v17 = v15;
        goto LABEL_19;
      }
    }
    else
    {
      if (v8)
      {
        a2[1] = v8;
        operator delete(v8);
        v7 = 0;
        *a2 = 0;
        a2[1] = 0;
        a2[2] = 0;
      }
      if ((v5 & 0x8000000000000000) != 0)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v9 = v7 >> 1;
      if (v7 >> 1 <= v6)
        v9 = (v4 - v3) >> 2;
      if ((unint64_t)v7 >= 0x7FFFFFFFFFFFFFFCLL)
        v10 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v10 = v9;
      result = std::vector<unsigned int>::__vallocate[abi:ne180100](a2, v10);
      v12 = (char *)a2[1];
      v11 = a2 + 1;
      v8 = v12;
    }
    if (v4 == v3)
    {
LABEL_20:
      *v11 = &v8[v5];
      return result;
    }
    v16 = v8;
    v17 = v3;
LABEL_19:
    result = memmove(v16, v17, v5);
    goto LABEL_20;
  }
  return result;
}

@end
