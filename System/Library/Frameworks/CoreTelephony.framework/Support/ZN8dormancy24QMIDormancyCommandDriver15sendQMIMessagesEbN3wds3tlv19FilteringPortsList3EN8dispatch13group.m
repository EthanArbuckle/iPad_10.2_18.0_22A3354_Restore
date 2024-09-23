@implementation ZN8dormancy24QMIDormancyCommandDriver15sendQMIMessagesEbN3wds3tlv19FilteringPortsList3EN8dispatch13group

_WORD *___ZN8dormancy24QMIDormancyCommandDriver15sendQMIMessagesEbN3wds3tlv19FilteringPortsList3EN8dispatch13group_sessionE_block_invoke_2(_WORD *result, char *a2)
{
  _QWORD *v2;
  char *v4;
  _BYTE *v5;
  size_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void **v13;
  char *v14;
  _BYTE *v15;
  char *v16;
  void *v17;
  char *v18;

  *(_WORD *)a2 = result[16];
  v2 = a2 + 8;
  if (a2 != (char *)(result + 16))
  {
    v4 = (char *)*((_QWORD *)result + 5);
    v5 = (_BYTE *)*((_QWORD *)result + 6);
    v6 = v5 - v4;
    v7 = 0xAAAAAAAAAAAAAAABLL * ((v5 - v4) >> 1);
    v8 = *((_QWORD *)a2 + 3);
    v9 = (char *)*((_QWORD *)a2 + 1);
    if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)v9) >> 1) >= v7)
    {
      v13 = (void **)(a2 + 16);
      v15 = (_BYTE *)*((_QWORD *)a2 + 2);
      if (0xAAAAAAAAAAAAAAABLL * ((v15 - v9) >> 1) < v7)
      {
        v16 = &v4[2 * ((v15 - v9) >> 1)];
        if (v15 != v9)
        {
          result = memmove(*((void **)a2 + 1), v4, v15 - v9);
          v9 = (char *)*v13;
        }
        v6 = v5 - v16;
        if (v5 == v16)
          goto LABEL_20;
        v17 = v9;
        v18 = v16;
        goto LABEL_19;
      }
    }
    else
    {
      if (v9)
      {
        *((_QWORD *)a2 + 2) = v9;
        operator delete(v9);
        v8 = 0;
        *v2 = 0;
        v2[1] = 0;
        v2[2] = 0;
      }
      if (v7 > 0x2AAAAAAAAAAAAAAALL)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 1);
      v11 = 2 * v10;
      if (2 * v10 <= v7)
        v11 = 0xAAAAAAAAAAAAAAABLL * ((v5 - v4) >> 1);
      if (v10 >= 0x1555555555555555)
        v12 = 0x2AAAAAAAAAAAAAAALL;
      else
        v12 = v11;
      result = std::vector<wds::tlv::FilteringPortInfo2>::__vallocate[abi:ne180100](v2, v12);
      v14 = (char *)*((_QWORD *)a2 + 2);
      v13 = (void **)(a2 + 16);
      v9 = v14;
    }
    if (v5 == v4)
    {
LABEL_20:
      *v13 = &v9[v6];
      return result;
    }
    v17 = v9;
    v18 = v4;
LABEL_19:
    result = memmove(v17, v18, v6);
    goto LABEL_20;
  }
  return result;
}

@end
