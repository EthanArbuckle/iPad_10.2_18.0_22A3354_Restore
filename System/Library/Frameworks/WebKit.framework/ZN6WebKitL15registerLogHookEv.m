@implementation ZN6WebKitL15registerLogHookEv

WTF *___ZN6WebKitL15registerLogHookEv_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  WTF *result;
  _BOOL4 v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  WTF *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  WTF *j;
  uint64_t v18;
  WTF *v19;
  WTF *v20;
  WTF *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  WTF *v25;
  WTF *v26;
  WTF *v27;
  WTF *v28;
  WTF *v29;
  _QWORD block[5];

  result = (WTF *)qword_1ECE72E10;
  if (qword_1ECE72E10)
    result = (WTF *)(*(uint64_t (**)(void))(qword_1ECE72E10 + 16))();
  if ((a2 & 3) == 0 && *(_QWORD *)(a3 + 104) <= 0x400uLL)
  {
    WTF::CString::CString((WTF::CString *)&v29, *(const char **)(a3 + 88));
    WTF::CString::CString((WTF::CString *)&v28, *(const char **)(a3 + 128));
    WTF::CString::CString((WTF::CString *)&v27, *(const char **)(a3 + 136));
    v6 = a2 != 17;
    if (a2 == 17)
      v7 = 16;
    else
      v7 = a2;
    v8 = *(_QWORD *)(a3 + 104);
    if (v8)
    {
      if (HIDWORD(v8))
        goto LABEL_35;
      v9 = *(_QWORD *)(a3 + 96);
      v10 = WTF::fastMalloc(*(WTF **)(a3 + 104));
      v11 = v10;
      for (i = 0; i != v8; ++i)
        *(_BYTE *)(v10 + i) = *(_BYTE *)(v9 + i);
    }
    else
    {
      v11 = 0;
    }
    v13 = *(WTF **)(a3 + 120);
    if (!v13)
    {
      v16 = 0;
LABEL_16:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3321888768;
      block[2] = ___ZN6WebKitL8logQueueEv_block_invoke;
      block[3] = &__block_descriptor_33_e8_32c31_ZTSKZN6WebKitL8logQueueEvE3__0_e5_v8__0l;
      if (qword_1ECE72E20 != -1)
        dispatch_once(&qword_1ECE72E20, block);
      v18 = qword_1ECE72E18;
      (*(void (**)(uint64_t))(*(_QWORD *)qword_1ECE72E18 + 48))(qword_1ECE72E18);
      v20 = v28;
      v19 = v29;
      v28 = 0;
      v29 = 0;
      v21 = v27;
      v27 = 0;
      v22 = WTF::fastMalloc((WTF *)0x50);
      *(_QWORD *)v22 = off_1E34D99C0;
      *(_QWORD *)(v22 + 8) = v19;
      *(_QWORD *)(v22 + 16) = v20;
      *(_QWORD *)(v22 + 24) = v21;
      *(_BYTE *)(v22 + 32) = v7;
      *(_QWORD *)(v22 + 40) = v11;
      *(_DWORD *)(v22 + 48) = v8;
      *(_DWORD *)(v22 + 52) = v8;
      *(_QWORD *)(v22 + 56) = v16;
      *(_DWORD *)(v22 + 64) = (_DWORD)v13;
      *(_DWORD *)(v22 + 68) = (_DWORD)v13;
      *(_DWORD *)(v22 + 72) = 4 * v6;
      block[0] = v22;
      WTF::WorkQueueBase::dispatchWithQOS();
      v23 = block[0];
      block[0] = 0;
      if (v23)
        (*(void (**)(uint64_t))(*(_QWORD *)v23 + 8))(v23);
      (*(void (**)(uint64_t))(*(_QWORD *)v18 + 56))(v18);
      v25 = v27;
      v27 = 0;
      if (v25)
      {
        if (*(_DWORD *)v25 == 1)
          WTF::fastFree(v25, v24);
        else
          --*(_DWORD *)v25;
      }
      v26 = v28;
      v28 = 0;
      if (v26)
      {
        if (*(_DWORD *)v26 == 1)
          WTF::fastFree(v26, v24);
        else
          --*(_DWORD *)v26;
      }
      result = v29;
      v29 = 0;
      if (result)
      {
        if (*(_DWORD *)result == 1)
          return (WTF *)WTF::fastFree(result, v24);
        else
          --*(_DWORD *)result;
      }
      return result;
    }
    if (!((unint64_t)v13 >> 32))
    {
      v14 = *(_QWORD *)(a3 + 112);
      v15 = WTF::fastMalloc(v13);
      v16 = v15;
      for (j = 0; j != v13; j = (WTF *)((char *)j + 1))
        *((_BYTE *)j + v15) = *((_BYTE *)j + v14);
      goto LABEL_16;
    }
LABEL_35:
    __break(0xC471u);
    JUMPOUT(0x196BD271CLL);
  }
  return result;
}

@end
