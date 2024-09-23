@implementation ZN8dormancy24QMIDormancyCommandDriver15sendQMIMessagesEbN3wds3tlv19FilteringPortsList2EN8dispatch13group

_QWORD *___ZN8dormancy24QMIDormancyCommandDriver15sendQMIMessagesEbN3wds3tlv19FilteringPortsList2EN8dispatch13group_sessionE_block_invoke_2(_QWORD *result, void **a2)
{
  char *v3;
  _BYTE *v4;
  size_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  char *v14;
  char *v15;
  void *v16;
  char *v17;

  if (result + 4 != a2)
  {
    v3 = (char *)result[4];
    v4 = (_BYTE *)result[5];
    v5 = v4 - v3;
    v6 = 0xAAAAAAAAAAAAAAABLL * ((v4 - v3) >> 1);
    v7 = (uint64_t)a2[2];
    v8 = (char *)*a2;
    if (0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)*a2) >> 1) >= v6)
    {
      v12 = a2 + 1;
      v14 = (char *)a2[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v14 - v8) >> 1) < v6)
      {
        v15 = &v3[2 * ((v14 - v8) >> 1)];
        if (v14 != v8)
        {
          result = memmove(*a2, v3, v14 - v8);
          v8 = (char *)*v12;
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
      if (v6 > 0x2AAAAAAAAAAAAAAALL)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v9 = 0xAAAAAAAAAAAAAAABLL * (v7 >> 1);
      v10 = 2 * v9;
      if (2 * v9 <= v6)
        v10 = 0xAAAAAAAAAAAAAAABLL * ((v4 - v3) >> 1);
      if (v9 >= 0x1555555555555555)
        v11 = 0x2AAAAAAAAAAAAAAALL;
      else
        v11 = v10;
      result = std::vector<wds::tlv::FilteringPortInfo2>::__vallocate[abi:ne180100](a2, v11);
      v13 = (char *)a2[1];
      v12 = a2 + 1;
      v8 = v13;
    }
    if (v4 == v3)
    {
LABEL_20:
      *v12 = &v8[v5];
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
