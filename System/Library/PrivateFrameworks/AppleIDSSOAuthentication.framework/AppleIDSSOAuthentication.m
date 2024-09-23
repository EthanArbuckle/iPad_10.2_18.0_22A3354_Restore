id _AIDALogSystem()
{
  if (_AIDALogSystem_onceToken != -1)
    dispatch_once(&_AIDALogSystem_onceToken, &__block_literal_global_0);
  return (id)_AIDALogSystem_log;
}

id _AIDASignpostLogSystem()
{
  if (_AIDASignpostLogSystem_onceToken != -1)
    dispatch_once(&_AIDASignpostLogSystem_onceToken, &__block_literal_global_3);
  return (id)_AIDASignpostLogSystem_log;
}

os_signpost_id_t _AIDASignpostCreate(NSObject *a1)
{
  os_signpost_id_t v1;

  v1 = os_signpost_id_generate(a1);
  mach_continuous_time();
  return v1;
}

unint64_t _AIDASignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (_AIDASignpostGetNanoseconds_onceToken != -1)
    dispatch_once(&_AIDASignpostGetNanoseconds_onceToken, &__block_literal_global_6);
  v3 = mach_continuous_time();
  LODWORD(v4) = _AIDASignpostGetNanoseconds_timebase_info;
  LODWORD(v5) = *(_DWORD *)algn_1EFEC7614;
  return (unint64_t)((double)v4 / (double)v5 * (double)(v3 - a2));
}

void sub_1D4C235F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D4C23C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1D4C2417C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D4C24408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

void sub_1D4C24ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1D4C2508C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D4C25318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t sub_1D4C25D10(mach_port_t a1, uint64_t a2, int a3, _QWORD *a4, _DWORD *a5)
{
  mach_port_t reply_port;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  int v13;
  mach_msg_header_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;

  v15 = 1;
  v16 = a2;
  v17 = 16777472;
  v18 = a3;
  v19 = *MEMORY[0x1E0C804E8];
  v20 = a3;
  reply_port = mig_get_reply_port();
  v14.msgh_remote_port = a1;
  v14.msgh_local_port = reply_port;
  v14.msgh_bits = -2147478253;
  *(_QWORD *)&v14.msgh_voucher_port = 0x4B000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v14);
    reply_port = v14.msgh_local_port;
  }
  v9 = mach_msg(&v14, 3, 0x38u, 0x40u, reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v14.msgh_local_port);
    return v10;
  }
  if ((_DWORD)v9)
  {
    mig_dealloc_reply_port(v14.msgh_local_port);
    return v10;
  }
  if (v14.msgh_id == 71)
  {
    v12 = 4294966988;
  }
  else if (v14.msgh_id == 1300)
  {
    if ((v14.msgh_bits & 0x80000000) != 0)
    {
      v12 = 4294966996;
      if (v15 == 1 && v14.msgh_size == 56 && !v14.msgh_remote_port && HIBYTE(v17) == 1)
      {
        v13 = v18;
        if (v18 == v20)
        {
          *a4 = v16;
          *a5 = v13;
          return 0;
        }
      }
    }
    else if (v14.msgh_size == 36)
    {
      v12 = 4294966996;
      if (HIDWORD(v16))
      {
        if (v14.msgh_remote_port)
          v12 = 4294966996;
        else
          v12 = HIDWORD(v16);
      }
    }
    else
    {
      v12 = 4294966996;
    }
  }
  else
  {
    v12 = 4294966995;
  }
  mach_msg_destroy(&v14);
  return v12;
}

void zcamdt242h(uint64_t a1, int a2)
{
  __asm { BR              X8 }
}

void Gg9q7vHg34(unint64_t a1, uint64_t a2)
{
  _BOOL4 v3;

  v3 = a1 > 0xFFFFFFFFFFFFFFEFLL && a2 != 0;
  __asm { BR              X8 }
}

uint64_t sub_1D4C26170(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  BOOL v3;

  *a2 = 0;
  v3 = MEMORY[0x191D653A4](24, 4101018099) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((2 * v3) | 0x1E4u)) - 4))();
}

uint64_t sub_1D4C261B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 2118401485;
  *(_DWORD *)(a1 + 16) = 0;
  *(_QWORD *)(v3 - 136) = a1;
  v4 = v2(4096, 1358311088);
  **(_QWORD **)(v3 - 136) = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((216 * (v4 != 0)) ^ 0x354u)) - 8))();
}

uint64_t sub_1D4C26248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v35;

  *(_QWORD *)(v33 - 152) = v32;
  *(_DWORD *)(v27 + 8) = v29 + 4096;
  v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 8 * ((712 * (*(_DWORD *)(v27 + 12) - 4093 < ((v28 - 598) ^ 0x2C8) + ((v28 - 468) | 0xEu) - 5061)) ^ (v28 - 598)));
  v35 = *(_QWORD *)(v26 + 8 * (v28 - 821)) - 13;
  *(_QWORD *)(v33 - 200) = v25;
  *(_QWORD *)(v33 - 192) = v35;
  return v34(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, v31, a18, a19,
           a20,
           a21,
           a22,
           v27 + 8,
           a24,
           a25);
}

uint64_t sub_1D4C262BC()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * ((15
                                * (2 * (v0 ^ 0x2F1)
                                 + ((2 * (v3 + 2 * v1)) & 0xFCDB7BFA)
                                 + ((v3 + 2 * v1) ^ 0xFE6DBDFD)
                                 + 26357872 < 0xFFFFEFFB)) ^ v0)))();
}

uint64_t sub_1D4C26324@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = __ldaxr(v4);
  v8 = (*(uint64_t (**)(_QWORD, uint64_t))(v6 - 152))((a1 + 26362371), 1120292948);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 + 8 * (((v8 != 0) * ((v7 - 215) ^ 0x797)) ^ v7)) - 8))(v8, v9, v10, v11, v12, v13, v14, v15, a2, a3, a4);
}

void sub_1D4C2637C(uint64_t a1)
{
  __asm { BR              X17 }
}

uint64_t sub_1D4C28738()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1818 * (v0 != v2)) ^ (v1 - 1146)))
                            - (v1 - 1408)
                            + 87))();
}

uint64_t sub_1D4C28774@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v2;
  int v3;
  int v4;
  uint64_t v5;
  _BOOL4 v7;

  v7 = v2 < ((v3 + 1547) ^ 0x662u) || (unint64_t)(a1 - a2) < 0x20;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((222 * v7) ^ v3)) + 3545690796 - (v3 ^ (v4 + 55))))();
}

void sub_1D4C28EC8()
{
  _QWORD *v0;
  void (*v1)(void);
  _QWORD *v2;

  v2 = v0;
  v1();
  *v2 = 0;
  v2[1] = 2118401485;
  ((void (*)(_QWORD *))v1)(v2);
  JUMPOUT(0x1D4C28EECLL);
}

void jk24uiwqrg(uint64_t a1)
{
  __asm { BR              X8 }
}

uint64_t sub_1D4C28F64()
{
  MEMORY[0x191D68428]();
  return 0;
}

void fm23w5mn5o()
{
  uint64_t v0;
  char v1;

  v0 = qword_1EFEC75C0 - (_QWORD)&v1 + qword_1EFEC75D8;
  qword_1EFEC75C0 = 1137813707 * v0 + 0x5751864245CF6939;
  qword_1EFEC75D8 = 1137813707 * (v0 ^ 0xE86952A9CE08E98BLL);
  __asm { BR              X8 }
}

uint64_t sub_1D4C29064()
{
  uint64_t v0;
  void (*v1)(void);
  uint64_t v2;

  v1();
  *(_QWORD *)(v0 + 8) = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((20 * (*(_QWORD *)(v0 + 24) != 0)) | 0xA8u)) - 4))();
}

uint64_t sub_1D4C2909C()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(void);
  uint64_t v3;
  int v4;

  *(_QWORD *)(v3 - 111) = v0;
  v2();
  *(_QWORD *)(v1 + 24) = 0;
  *(_DWORD *)(v1 + 36) = 0;
  *(_QWORD *)v1 = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((*(_QWORD *)(v1 + 48) == 0) * (((5 * (v4 ^ 0x92) + 20) | 8) - 290)) ^ (5 * (v4 ^ 0x92))))
                            - ((5 * (v4 ^ 0x92) + 20) ^ 0x199u)
                            + 171))();
}

uint64_t jkag7Bg01u(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a1 + 8) <= 6 && ((0x7Du >> (a1 + 8)) & 1) != 0)
    __asm { BR              X8 }
  return 4294922295;
}

void sub_1D4C2961C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _DWORD *a18, int a19, int a20)
{
  uint64_t v20;
  _QWORD *v21;

  v21 = *(_QWORD **)(v20 - 152);
  (*(void (**)(_QWORD))(v20 - 208))(*v21);
  *v21 = a17;
  *a18 = a20;
  JUMPOUT(0x1D4C29654);
}

uint64_t sub_1D4C29704@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v3 = ((a1 + 968818423) & 0xC640FFBE ^ 0x14473943) + *(_DWORD *)(v1 + 12);
  v4 = *(_DWORD *)(v1 + 8) - 797629582;
  v5 = v3 < 0x14473A79;
  v6 = v3 > v4;
  if (v4 < 0x14473A79 != v5)
    v6 = v5;
  return (*(uint64_t (**)(void))(v2 + 8 * ((444 * v6) ^ a1)))();
}

uint64_t sub_1D4C29784@<X0>(uint64_t a1@<X4>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, int a5@<W8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  _BOOL4 v32;
  unsigned int v33;
  _BOOL8 v34;
  _BOOL4 v35;

  *(_QWORD *)(v29 - 152) = v27;
  v30 = a5 - 844;
  v31 = v26 + 659547387;
  v32 = (v26 + 659547387) < 0x6B21FBFE;
  v33 = ((2 * (2 * v26 + 2019283442)) & 0x87B47EFE) + ((2 * v26 + 2019283442) ^ (v30 + 1138376259));
  v34 = v33 + 659012735 < 0x6B21FBFE;
  if (v32 != v34)
    v35 = v33 + 659012735 < 0x6B21FBFE;
  else
    v35 = v33 + 659012735 > v31;
  return ((uint64_t (*)(_BOOL8, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 + 8 * ((109 * v35) ^ v30)) - 4))(v34, 2019283442, 1797389310, v33 - 534648, a1, a2, a3, a4, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16,
           a17,
           a18,
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_1D4C2982C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v29;
  _DWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  unsigned int v35;
  int v36;

  v34 = *v31;
  v35 = ((2 * v29) & 0x9FDFFFFC) + (v29 ^ 0x4FEFFFFE);
  *(_BYTE *)(*v31 + v35 - 1341128701) = -2;
  v36 = (v33 - 222) | 0x88;
  *(_BYTE *)(v34 + v35 - 1341128702) = -123;
  *(_BYTE *)(v34 + v35 + (v36 ^ 0xB01002EC)) = 99;
  *(_BYTE *)(v34 + v35 - 1341128699) = -80;
  *v30 += 4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(4001280290 - ((v36 + 67120440) | 0xEA7E8106) + *(_QWORD *)(v32 + 11808)))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_1D4C2B524()
{
  int v0;
  int v1;
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(void))(v2 + 8 * ((((v3 + ((v1 - 1524) | 0x220) - 675) ^ (v3 + 177)) * (v0 != 0)) ^ v1)))();
}

uint64_t sub_1D4C2B558@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v2;
  int v3;
  uint64_t v4;
  int v5;
  _BOOL4 v7;

  v7 = v2 < 8 || (unint64_t)(a1 - a2) < 0x20;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4
                                        + 8
                                        * (int)((((((2 * v3) ^ 0x696) - 285297762) & 0xFF7FF9B6 ^ (v5 + 13)) * v7) ^ v3))
                            - 8))();
}

uint64_t sub_1D4C2B5AC()
{
  unsigned int v0;
  int v1;
  uint64_t v2;
  char v3;

  return (*(uint64_t (**)(void))(v2
                              + 8
                              * (((((v0 < 0x20) ^ ((v1 ^ (v3 - 48)) + 1)) & 1)
                                * (((v1 - 336) | 0x71) - 749)) ^ v1)))();
}

uint64_t sub_1D4C2B5EC@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  __int128 v6;
  _BOOL4 v7;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = (((v5 + v3 - 740) | 0x311u) ^ 0x335) != (v2 & 0xFFFFFFE0);
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (int)(v7 & 0xFFFFFFFB | (4 * v7) | (v5 + v3 - 488))) - 8))();
}

uint64_t sub_1D4C2B644()
{
  int v0;
  unsigned int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (int)(v1 ^ (205 * (v0 == 0))))
                            - (v1 ^ 0xEE7EB161 ^ ((v1 - 332103741) | 0x24A3120))))();
}

uint64_t sub_1D4C2B698()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (v1 ^ (2
                                               * (((((v1 - 1939960322) ^ (v0 < 8)) & 1) == 0) | (32
                                                                                               * ((((v1 - 1939960322) ^ (v0 < 8)) & 1) == 0))))))
                            - 8))();
}

uint64_t sub_1D4C2B6DC()
{
  int v0;
  unint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((1119
                                          * (v1 >= ((v0 + 240029406) | 0xE0302026)
                                                 + (unint64_t)((v0 + 486) | 0x235u)
                                                 - 4001281859u)) ^ v0))
                            - 8))();
}

uint64_t sub_1D4C2B734()
{
  unsigned int v0;
  int v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((85 * (v0 >= ((v1 - 1420) ^ 0x91u))) ^ v1))
                            - (v1 ^ (v3 + 1525) ^ 0xEE7EB12ELL)))();
}

void rsegvyrt87(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  BOOL v6;
  int v8;

  if (a4)
    v6 = a5 == 0;
  else
    v6 = 1;
  v8 = v6 || a6 == 0;
  __asm { BR              X8 }
}

uint64_t sub_1D4C2C368(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _DWORD *a5)
{
  uint64_t v5;
  _BOOL4 v6;

  *a4 = 0;
  *a5 = 0;
  v6 = MEMORY[0x191D653A4](24, 4101018099) != 0;
  return (*(uint64_t (**)(void))(v5 + 8 * ((419 * v6) ^ 0xA1u)))();
}

uint64_t sub_1D4C2C3C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  *(_QWORD *)(v31 - 256) = v28;
  *(_QWORD *)(v31 - 184) = v27;
  *(_DWORD *)(v31 - 236) = v26;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 449454675;
  *(_DWORD *)(a1 + 16) = 0;
  *(_QWORD *)(v31 - 152) = v30;
  v33 = v30(4096, 1358311088);
  *(_QWORD *)a1 = v33;
  v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 8 * ((63 * (v33 == 0)) ^ 0x1DC));
  *(_QWORD *)(v31 - 144) = 0x191D68428;
  return v34(v33, v35, v36, v37, v38, v39, v40, v41, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26);
}

uint64_t sub_1D4C2C470()
{
  uint64_t v0;
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 - 144))(v0);
  return 4294922293;
}

uint64_t gJa8aF901k(uint64_t a1)
{
  uint64_t v1;

  if ((unint64_t)(a1 + 8) <= 6 && ((0x7Du >> (a1 + 8)) & 1) != 0)
  {
    v1 = *((_QWORD *)&unk_1E985B9B0 + ((867 * (MEMORY[0x191D653A4](24, 4101018099) != 0)) ^ 0x57Eu));
    __asm { BR              X8 }
  }
  return 4294922295;
}

uint64_t sub_1D4C32E10(_DWORD *a1)
{
  unsigned int v1;

  v1 = 882831569 * ((a1 & 0xE8317279 | ~(a1 | 0xE8317279)) ^ 0x84383F4C);
  return ((uint64_t (*)(void))(*(_QWORD *)(qword_1E985F270[*a1 - v1 - 314]
                                        + 8 * (int)((194 * (v1 + a1[1] - 1169751002 < 0x46)) ^ (*a1 - v1))
                                        - 2)
                            - 4))();
}

uint64_t sub_1D4C32E90@<X0>(uint64_t result@<X0>, int a2@<W8>)
{
  int v2;
  uint64_t v3;

  *(_DWORD *)(result + 8) = *(_DWORD *)(*(_QWORD *)(v3 + 8 * (a2 - 347)) + 4 * v2 - 3);
  return result;
}

uint64_t sub_1D4C32EA8(uint64_t result)
{
  *(_DWORD *)(result + 8) = 314902380;
  return result;
}

void uv5t6nhkui()
{
  unint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = qword_1EFEC75B8 ^ (unint64_t)&v2 ^ qword_1EFEC75D8;
  qword_1EFEC75B8 = (1137813707 * v0) ^ 0xE86952A9CE08E98BLL;
  qword_1EFEC75D8 = 1137813707 * (v0 ^ 0xE86952A9CE08E98BLL);
  v1 = *((_QWORD *)&unk_1E985B9B0
       + ((893
         * (((uint64_t (*)(uint64_t, uint64_t))(qword_1E985F270[((-53 * ((qword_1EFEC75D8 - qword_1EFEC75B8) ^ 0x8B)) ^ byte_1D4C4D0B0[byte_1D4C4CD90[(-53 * ((qword_1EFEC75D8 - qword_1EFEC75B8) ^ 0x8B))] ^ 0xA8])
                                                                      + 12]
                                                      - 3))(24, 4101018099) != 0)) ^ 0x5E4u))- 8;
  __asm { BR              X8 }
}

uint64_t sub_1D4C32FD4(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v6;

  *(_DWORD *)(v4 - 212) = v1;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0x35872FBD3D92718DLL;
  *(_DWORD *)(a1 + 16) = 0;
  v6 = v3(4096, 1358311088);
  *(_QWORD *)a1 = v6;
  return (*(uint64_t (**)(void))(v2 + 8 * ((47 * (v6 == 0)) ^ 0x119u)))();
}

uint64_t sub_1D4C3303C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((((((v0 + 732) ^ 0x5E4) + 6) ^ 0x4E045395) * (v2 != 0)) ^ 0x5E4))
                            - 8))();
}

uint64_t sub_1D4C33088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v5;

  v4(v5, a2, a3, a4, 3914993664);
  return 4294922293;
}

void tn46gtiuhw(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  BOOL v7;
  int v10;

  if (a4)
    v7 = a5 == 0;
  else
    v7 = 1;
  v10 = v7 || a6 == 0 || a7 == 0;
  __asm { BR              X8 }
}

uint64_t sub_1D4C36B7C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, _DWORD *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(void);

  *a4 = 0;
  **(_DWORD **)(v8 - 152) = 0;
  **(_QWORD **)(v8 - 144) = 0;
  *a7 = 0;
  v9 = (uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((787 * (((unk_1EFEC7640 == 0) ^ 0x81) & 1)) ^ 0x15Eu)) - 8);
  *(_QWORD *)(v8 - 216) = 0x191D68428;
  return v9();
}

uint64_t sub_1D4C36BF8()
{
  int v0;
  void (*v1)(void);
  uint64_t v2;
  uint64_t v3;

  v1();
  *(_QWORD *)(v3 + 8) = 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((1438 * (*(_QWORD *)(v3 + 24) != 0)) ^ (v0 + 1485326383))))();
}

uint64_t sub_1D4C36C30()
{
  int v0;
  int v1;
  void (*v2)(void);
  uint64_t v3;
  uint64_t v4;

  v2();
  *(_QWORD *)(v4 + 24) = 0;
  *(_DWORD *)(v4 + 36) = 0;
  *(_QWORD *)v4 = 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((971 * (*(_QWORD *)(v4 + 48) != 0)) ^ (v0 + v1 + 91))) - 4))();
}

uint64_t sub_1D4C36C6C()
{
  int v0;
  int v1;
  void (*v2)(void);
  uint64_t v3;
  uint64_t v4;

  v2();
  *(_QWORD *)(v4 + 48) = 0;
  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)(((((v0 + v1 + 229328577) & 0xF254BEAF) - 1564) * (*(_QWORD *)(v4 + 64) != 0)) ^ (v0 + v1 + 172))))();
}

void fy34trz2st()
{
  unint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = (qword_1EFEC75D8 + qword_1EFEC75C8) ^ (unint64_t)&v2;
  qword_1EFEC75C8 = 1137813707 * v0 - 0x1796AD5631F71675;
  qword_1EFEC75D8 = 1137813707 * (v0 ^ 0xE86952A9CE08E98BLL);
  v1 = *((_QWORD *)&unk_1E985B9B0
       + ((203
         * (((uint64_t (*)(uint64_t, uint64_t))(qword_1E985F270[((-53 * (qword_1EFEC75C8 ^ 0x8B ^ qword_1EFEC75D8)) ^ byte_1D4C4C640[byte_1D4C4CFB0[(-53 * (qword_1EFEC75C8 ^ 0x8B ^ qword_1EFEC75D8))] ^ 0x5E])
                                                                      + 1]
                                                      - 3))(24, 4101018099) == 0)) ^ 0x173u))- 4;
  __asm { BR              X8 }
}

uint64_t sub_1D4C3AA30(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v4;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 2051828535;
  *(_DWORD *)(a1 + 16) = 0;
  v4 = v1(4096, 1358311088);
  *(_QWORD *)a1 = v4;
  return (*(uint64_t (**)(void))(v2 + 8 * ((139 * (v4 == 0)) ^ 0x47A)))();
}

uint64_t sub_1D4C3AAAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void (*v6)(uint64_t);

  v6(a6);
  return 4294922293;
}

void p435tmhbla()
{
  unint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = (qword_1EFEC75D8 - qword_1EFEC75D0) ^ (unint64_t)&v2;
  qword_1EFEC75D0 = 1137813707 * (v0 + 0x1796AD5631F71675);
  qword_1EFEC75D8 = 1137813707 * (v0 ^ 0xE86952A9CE08E98BLL);
  v1 = *((_QWORD *)&unk_1E985B9B0
       + ((54
         * (((uint64_t (*)(uint64_t, uint64_t))(qword_1E985F270[((-53
                                                                                         * ((qword_1EFEC75D8
                                                                                           - 53 * (v0 + 117)) ^ 0x8B)) ^ byte_1D4C4C970[byte_1D4C4C540[(-53 * ((qword_1EFEC75D8 - 53 * (v0 + 117)) ^ 0x8B))] ^ 0x9F])
                                                                      - 10]
                                                      - 3))(24, 4101018099) == 0)) ^ 0x29Du))- 8;
  __asm { BR              X8 }
}

uint64_t sub_1D4C3D8D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v5;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 459037928;
  *(_DWORD *)(a1 + 16) = 0;
  v5 = v3(4096, 1358311088);
  *(_QWORD *)a1 = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((100 * (((v5 == 0) ^ 0xEF) & 1)) ^ 0x43Bu))
                            - ((v1 + 12) ^ 0xB2D17A6BLL)))();
}

uint64_t sub_1D4C3D970(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __int16 v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  *(_DWORD *)(v8 + 8) = v5 + 4096;
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7
                                                                     + 8
                                                                     * ((1983
                                                                       * (*(_DWORD *)(v8 + 12) - 4093 >= (v4 & 0xFF7 ^ 0x7Cu) - 4764)) ^ v4 & 0xFF7u));
  *(_QWORD *)(v10 - 168) = *(_QWORD *)(v6 + 8 * ((v4 & 0xFF7) - 710)) - 7;
  *(_QWORD *)(v10 - 160) = v3;
  *(_QWORD *)(v10 - 176) = *(_QWORD *)(v6 + 8 * ((v4 & 0xFF7) - 712)) - 13;
  *(_QWORD *)(v10 - 216) = v9;
  return v11(a1, a2, a3, 1294894604);
}

void asabc800ag(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  int v3;

  if (a1)
    v2 = a2 == 0;
  else
    v2 = 1;
  v3 = !v2;
  __asm { BR              X8 }
}

uint64_t sub_1D4C40BF8(_QWORD *a1, _DWORD *a2)
{
  uint64_t v2;
  _BOOL4 v3;

  *a1 = 0;
  *a2 = 0;
  v3 = MEMORY[0x191D653A4](24, 4101018099) != 0;
  return (*(uint64_t (**)(void))(v2 + 8 * ((16 * (v3 & 0xFFFFFFFD | (2 * v3))) ^ 0x59A)))();
}

uint64_t sub_1D4C40C44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v6;

  *(_QWORD *)(v4 - 168) = v1;
  *(_QWORD *)(v4 - 160) = v3;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 1051258734;
  *(_DWORD *)(a1 + 16) = 0;
  v6 = v3(4096, 1358311088);
  *(_QWORD *)a1 = v6;
  return (*(uint64_t (**)(void))(v2 + 8 * ((89 * (((v6 == 0) ^ 0x93) & 1)) ^ 0x692)))();
}

uint64_t sub_1D4C40CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
{
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  *(_DWORD *)(v35 + 8) = v32 + 4096;
  v37 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v33 + 8 * ((1674 * (((3 * (v31 ^ 0x8F)) ^ (*(_DWORD *)(v35 + 12) - 4093 < (((v31 ^ 0x532) - 272) | 0x10Fu) - 5024)) & 1)) ^ v31 ^ 0x532u));
  *(_QWORD *)(v36 - 224) = v34;
  return v37(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31);
}

uint64_t sub_1D4C40D58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, int a9@<W8>, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;

  *(_QWORD *)(v32 - 144) = 0;
  *(_QWORD *)(v32 - 176) = 0x9306C2D1D9A7B4E0;
  *(_QWORD *)(v32 - 152) = 0;
  v33 = *v31;
  v34 = ((a9 << ((v29 - 122) & 0xAF ^ 0x8C)) & 0x9F4FE1DE) + (a9 ^ 0x4FA7F0EF) - 1336406255;
  *(_BYTE *)(*v31 + v34) = 0;
  *(_BYTE *)(v33 + v34 + 1) = 0;
  *(_BYTE *)(v33 + v34 + 2) = 0;
  *(_BYTE *)(v33 + v34 + 3) = 1;
  *((_DWORD *)v31 + 3) += 4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 + 8 * (int)((v29 + 978983814) & 0xC5A5E5AF ^ 0x2B9)) - ((((v29 + 978983814) & 0xC5A5E5AF) - 2007353960) & 0x77A5CEDF) + 1533))(a1, a2, a3, a4, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

uint64_t sub_1D4C40E3C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * ((63
                                * ((((v1 + 2 * v2) << (((v0 + 100) | 0x54) ^ 0x56)) & 0x7D55FEFE)
                                 + ((v1 + 2 * v2) ^ 0xBEAAFF7F)
                                 + 1096085628 > 0xFFFFEFFA)) ^ v0)))();
}

uint64_t sub_1D4C40EAC@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v17 = (*(uint64_t (**)(_QWORD, uint64_t))(v16 - 160))((a1 + 1096089729), 1120292948);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 + 8 * ((209 * (v17 != 0)) ^ v14)) - 4))(v17, v18, v19, v20, v21, v22, v23, v24, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12,
           a13,
           a14);
}

void sub_1D4C40F0C(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  *(_QWORD *)(v5 - 152) = 0;
  *(_QWORD *)(v5 - 144) = 0;
  v6 = *v4;
  *(_QWORD *)(v5 - 176) = 0x9306C2D1D9A7B4E0;
  *(_QWORD *)(v5 - 232) = 0x33EE8B0970FCB5F4;
  *(_QWORD *)(v5 - 192) = v1;
  v7 = (((2 * (v2 ^ 0x188) - 210724645) & 0xC8F67DF) + 1396) | 0x40;
  __asm { BR              X11 }
}

uint64_t sub_1D4C4363C()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * (((((v1 - 603) | 0x418) + 440) * (v0 != v2)) ^ v1)))();
}

uint64_t sub_1D4C43664()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((((*(unsigned __int8 *)(v2 + 3663) < 8u) ^ (v0 + 78)) & 1)
                                          * (v0 - 1152)) ^ v0))
                            - 8))();
}

uint64_t sub_1D4C4369C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((194 * (v0 + (unint64_t)(90 * (v1 ^ 0x660u)) - 630 > 0x1F)) ^ v1)))();
}

uint64_t sub_1D4C436D4()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((((21 * (v1 ^ 0x65F) - 508306593) & 0x1E4C2359) - 795) * (v0 < 0x20)) ^ v1 ^ 0x7F))
                            - 8))();
}

uint64_t sub_1D4C43724@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = (v3 ^ (v4 - 343) ^ v7) + v2;
  *(_QWORD *)(a1 + v8 - 7) = *(_QWORD *)(a2 + v8 - 7);
  return (*(uint64_t (**)(void))(v6 + 8 * ((((v2 & 0xFFFFFFF8) - 8 == v3) * v5) ^ v4)))();
}

void sub_1D4C43768()
{
  JUMPOUT(0x1D4C43730);
}

uint64_t sub_1D4C43770()
{
  int v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;

  return (*(uint64_t (**)(void))(v3
                              + 8
                              * (int)((((v4 + ((v1 + 1122460830) & 0xBD189B37) - 818) ^ (v4 - 153)) * (v0 != v2)) ^ v1)))();
}

uint64_t sub_1D4C437B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v2;
  int v3;
  uint64_t v4;
  _BOOL4 v6;

  v6 = v2 > 7 && a1 - a2 >= (unint64_t)(((v3 + 857735565) & 0xCCDFFF5D) - 213) - 808;
  return (*(uint64_t (**)(void))(v4 + 8 * ((1853 * v6) ^ v3)))();
}

uint64_t sub_1D4C437F8()
{
  unsigned int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2
                              + 8 * (((v0 >= ((11 * (v1 ^ 0x30D)) ^ 0x2D7u)) * ((40 * (v1 ^ 0x359)) ^ 0x4B4)) ^ v1)))();
}

uint64_t sub_1D4C43844@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  __int128 v6;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  return (*(uint64_t (**)(void))(v4 + 8 * ((((v2 & 0xFFFFFFE0) == 32) * ((8 * v3) ^ v5)) ^ v3)))();
}

void sub_1D4C4387C()
{
  JUMPOUT(0x1D4C43854);
}

uint64_t sub_1D4C4388C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((98 * (v1 != v0)) ^ v2 ^ 0x13D8))
                            - (((v2 ^ 0x13D8) - 1640) | 0x302u)
                            + 810))();
}

uint64_t sub_1D4C438C4()
{
  int v0;
  int v1;
  uint64_t v2;

  return (*(uint64_t (**)(void))(v2 + 8 * ((122 * ((((351 * (v1 ^ 0x331)) ^ 0x405) & v0) != 0)) ^ v1)))();
}

uint64_t sub_1D4C43900@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  *(_QWORD *)(a1 + v3) = *(_QWORD *)(a2 + v3);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5
                                        + 8
                                        * (((((v4 - 916160512) & 0x369B7FFE ^ 0xFFFFFD0E) & v2)
                                          - (unint64_t)((v4 - 916160512) & 0x369B7FFE)
                                          + 750 != v3) ^ (v4 - 916160512) & 0x369B7FFEu))
                            - 8))();
}

uint64_t sub_1D4C43958@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(a1 + v2) = *(_QWORD *)(a2 + v2);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((v4 != v2) ^ v3)) - 8))();
}

uint64_t sub_1D4C4397C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;

  return (*(uint64_t (**)(void))(v3 + 8 * (int)(((v4 + ((v2 + 1975908930) & 0xAEFBCEEB) - 52) * (v1 == v0)) ^ v2)))();
}

uint64_t sub_1D4C439BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;

  *(_BYTE *)(a1 + v3) = *(_BYTE *)(a2 + v3);
  return (*(uint64_t (**)(void))(v5
                              + 8
                              * (((v3 + 1 != v2) * ((((v4 - 769) | 0x240) - 456930158) & 0x3FFDFC71 ^ (v6 - 319))) ^ ((v4 - 769) | 0x240))))();
}

uint64_t sub_1D4C43A0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;

  *(_BYTE *)(a1 + v3) = *(_BYTE *)(a2 + v3);
  return (*(uint64_t (**)(void))(v6 + 8 * (((v3 + 1 != v2) * v5) ^ v4)))();
}

uint64_t sub_1D4C43A30()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1009 * ((((v4 + v2 + 1882864004) ^ (v1 == v0)) & 1) == 0)) ^ v2))
                            - 4))();
}

uint64_t sub_1D4C43A78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int128 v5;

  v5 = *(_OWORD *)(a2 + v2 - 16);
  *(_OWORD *)(a1 + v2 - 32) = *(_OWORD *)(a2 + v2 - 32);
  *(_OWORD *)(a1 + v2 - 16) = v5;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * ((651 * ((v2 & 0xFFFFFFE0) == 32)) ^ v3))
                            - (((v3 - 640) | 0x480u) ^ 0x69CLL)))();
}

void sub_1D4C43ACC()
{
  JUMPOUT(0x1D4C43A90);
}

uint64_t sub_1D4C43ADC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * (((v1 == v0) ^ (v2 + 1)) & 1 | (2
                                                                                         * (((v1 == v0) ^ (v2 + 1)) & 1)) | v2))
                            - ((v2 - 384) | 1u)
                            + 1297))();
}

uint64_t sub_1D4C43B10()
{
  char v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * (v1 ^ (823 * ((v0 & 0x18) != 0))))
                            - (v1 - 456)
                            + 841))();
}

uint64_t sub_1D4C43B4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v7 = v2 - 1;
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (((v7 != 0) * v4) ^ (23 * (v3 ^ 0x260))))
                            - (((23 * (v3 ^ 0x260) + 545340934) | 0x4408C60u) ^ v6)))();
}

uint64_t sub_1D4C43B9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = v4 - 1;
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (((v8 != 0) * v5) ^ v2)) - (v3 ^ v7)))();
}

uint64_t sub_1D4C43BC8()
{
  uint64_t v0;
  int v1;
  int v2;
  uint64_t v3;
  int v4;
  int v5;
  unsigned __int8 v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  v4 = v2 + v1;
  v5 = v2 + v1 - 158;
  v6 = v2 + v1 + 29;
  v7 = v5 | 0x29;
  v8 = v4 + 488;
  v9 = (*(uint64_t (**)(_QWORD, uint64_t))(v3 - 160))(**(unsigned int **)(v3 - 200), 1490714378);
  v10 = *(_QWORD **)(v3 - 168);
  v11 = 32 * *(_QWORD *)(v3 - 208);
  *(_QWORD *)(*v10 + v11 + 24) = v9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v0 + 8 * (v8 ^ (((v6 ^ (*(_QWORD *)(*v10 + v11 + 24) == 0)) & 1) << 6)))
                            - v7
                            + 41))();
}

void sub_1D4C43C4C()
{
  JUMPOUT(0x1D4C43608);
}

uint64_t sub_1D4C43CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36)
{
  uint64_t v36;
  int v37;

  return ((uint64_t (*)(void))(616680548
                            - ((v37 - 1477195353) & 0x7CCDFFF9)
                            + *(_QWORD *)(v36 + 8 * ((479 * (((v37 - 685) | 0x2C1) + a36 != 722)) ^ v37))
                            - 8))();
}

uint64_t sub_1D4C43D1C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;

  return (*(uint64_t (**)(void))(v1 + 8 * ((*(_QWORD *)(v2 + 16) != 0) ^ (v3 + v0 + 140))))();
}

uint64_t sub_1D4C43D44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((157 * (*(_QWORD *)(v2 + 32 * v0 + 24) == 0)) ^ (v3 - 124)))
                            - 8))();
}

uint64_t sub_1D4C43D70()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t (*v5)(void);
  int v6;
  uint64_t v7;

  v7 = v5();
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v3
                                                      + 8
                                                      * ((112 * (v2 + (v0 ^ (v4 + 595)) - 722 != v1)) ^ (v6 + v0 + 541)))
                                          - 4))(v7);
}

uint64_t sub_1D4C43DAC()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  return (*(uint64_t (**)(void))(v2 + 8 * ((*(_QWORD *)(v3 + 32 * v1 + 16) != 0) ^ (v4 + v0 + 140))))();
}

uint64_t sub_1D4C43DD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  void (*v4)(void);

  v4();
  return ((uint64_t (*)(void))(*(_QWORD *)(v1 + 8 * ((157 * (*(_QWORD *)(v2 + 32 * v0 + 24) == 0)) ^ (v3 - 124)))
                            - 8))();
}

uint64_t sub_1D4C43E00()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8
                                        * ((112 * (v2 + (v0 ^ (v4 + 595)) - 722 != v1)) ^ (v5 + v0 + 541)))
                            - 4))();
}

uint64_t sub_1D4C43E38@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  void (*v5)(uint64_t);
  int v6;
  uint64_t v7;

  v5 = v3;
  v6 = a1 - 326;
  v5(v2);
  **(_QWORD **)(v4 - 168) = 0;
  v7 = ((uint64_t (*)(_QWORD))v5)(*(_QWORD *)(v4 - 144));
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v1
                                                      + 8
                                                      * ((1188 * (*(_QWORD *)(v4 - 176) != 0x9306C2D1D9A7B4E0)) ^ v6))
                                          - ((383 * (v6 ^ 0x189) - 1388) | 6u)
                                          + 142))(v7);
}

uint64_t sub_1D4C43EB0@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * (((v3 + a1 - 1532 + ((a1 + 12632644) | 0x24010420) - 1233360077)
                                          * (*(_QWORD *)(v1 + 0x6CF93D2E26584B20) == 0)) ^ a1))
                            - 4))();
}

uint64_t sub_1D4C43F10()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  void (*v5)(uint64_t);
  _QWORD *v6;
  int v7;

  v7 = 5 * (v0 ^ (v4 + 30));
  *(_QWORD *)v1 = 0;
  *(_DWORD *)(v1 + 8) = 2111990077;
  *(_DWORD *)(v1 + 12) = 1657608450;
  v5(v2 + 0x6CF93D2E26584B20);
  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (((*v6 != 0) * (v7 ^ (v4 + 150) ^ (v4 - 26))) ^ v7))
                            - ((v4 + v7 - 150) ^ 0x24C1CC64)))();
}

void sub_1D4C43FA0()
{
  void (*v0)(void);
  _QWORD *v1;

  v0();
  *v1 = 0;
  v1[1] = 1051258734;
  ((void (*)(_QWORD *))v0)(v1);
  JUMPOUT(0x1D4C43FBCLL);
}

uint64_t sub_1D4C43FF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36)
{
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 + 8 * (((a36 + 1 < *(_QWORD *)(v39 - 152)) * (((5 * (v37 ^ (v37 + 130))) ^ 0x59) + 1144)) ^ (v38 + v37 + 805))) - 4))(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27);
}

void sub_1D4C44050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,_DWORD *a29)
{
  uint64_t v29;

  (*(void (**)(_QWORD))(v29 - 224))(*(_QWORD *)(v29 - 144));
  *a29 = *(_QWORD *)(v29 - 152);
  JUMPOUT(0x1D4C43E5CLL);
}

void qi864985u0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v5;
  int v8;

  if (a2)
    v5 = a3 == 0;
  else
    v5 = 1;
  v8 = !v5 && a4 != 0 && a5 != 0;
  __asm { BR              X8 }
}

uint64_t sub_1D4C44148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,_DWORD *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,_QWORD *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,_DWORD *a40,uint64_t a41,_QWORD *a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  uint64_t v47;

  *a29 = 0;
  *a40 = 0;
  *a42 = 0;
  *a21 = 0;
  LODWORD(a45) = 0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t, void *, _DWORD *, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _DWORD *, uint64_t, _QWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 + 8 * ((354 * (a1 != 0)) | 0x89u)) - 4))(a1, a2, 2419529101, a4, a5, a6, a7, a8, a9, a10, a11, 0x1EFEC7690, 0x1EFEC768CLL, 0x1EFEC7630, 0x1AEA531E4, &unk_1EFEC7688, a17, a18, a19,
           &unk_1D4C4CB7A,
           a21,
           0x191D68428,
           0x18A076E3CLL,
           0,
           a25,
           a26,
           a1,
           a28,
           a29,
           0x1EFEC768CLL,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           0x1EFEC7638,
           a39,
           a40,
           0x191D653A4,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47);
}

uint64_t sub_1D4C44240(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int8 *a16)
{
  int v16;
  uint64_t v17;

  return ((uint64_t (*)(void))(*(_QWORD *)(v17 + 8 * ((1379 * *a16) ^ 0x135u))
                            - ((v16 + ((a3 - 213) ^ 0x135u) + 721) ^ 0x35ELL)))();
}

void sub_1D4C46DB8()
{
  int v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD v5[29];
  uint64_t v6;

  v5[4] = 0x996A703CF9788810;
  v6 = ((uint64_t (*)(uint64_t, uint64_t, _QWORD *))(qword_1E985F270[v1 ^ 0x903715AF] - 2))(v2, v4, v5);
  __asm { BR              X8 }
}

uint64_t sub_1D4C47048(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t (*a41)(uint64_t, uint64_t))
{
  int v41;
  int v42;
  uint64_t v43;
  _BOOL4 v44;

  v44 = a41(24, 4101018099) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v43 + 8 * ((987 * v44) ^ v42))
                            - (v41
                             + ((v42 - 680044100) & 0xB8BFB5ED)
                             + 1007)
                            + 1140))();
}

uint64_t sub_1D4C470B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t (*a41)(uint64_t, uint64_t))
{
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0x1369D9E660F15CCDLL;
  *(_DWORD *)(a1 + 16) = 0;
  v43 = a41(4096, 1358311088);
  *(_QWORD *)a1 = v43;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v42 + 8 * (((v43 == 0) * ((v41 ^ 0x58B) + ((v41 - 1000) | 0x12A) - 710)) ^ v41)) - 8))(v43, v44, v45, v46, v47, v48, v49, v50, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31);
}

uint64_t sub_1D4C4713C()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2 + 8 * ((103 * (((v0 == 0) ^ (v1 - 45)) & 1)) ^ v1))
                            + 2419529093
                            - ((v1 + 271777358) | 0x80041585)))();
}

uint64_t sub_1D4C47198(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void (*a22)(uint64_t),uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t);
  uint64_t v44;

  a22(v37);
  v43 = (void (*)(uint64_t))(qword_1E985F270[v39 ^ 0x90371581] - 2);
  v43(v41);
  v44 = ((uint64_t (*)(uint64_t))v43)(a37);
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v42 + 8 * ((v38 + v39 + 1136) ^ (4 * (v40 != 0)))) - 8))(v44);
}

uint64_t sub_1D4C47374()
{
  int v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1(v2);
  return (*(uint64_t (**)(void))(v3 + 8 * ((v0 + 1081) ^ (2 * ((STACK[0x248] == 0) | (16 * (STACK[0x248] == 0)))))))();
}

uint64_t sub_1D4C473A4()
{
  int v0;
  int v1;
  uint64_t (*v2)(void);
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = v2();
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v4
                                                      + 8
                                                      * ((15 * (v3 == ((v0 + v1 + 8) | 0x68) - 45253)) ^ (v0 + v1 + 985)))
                                          - ((v0 + v1 + 298) ^ 0x1B7)))(v5);
}

uint64_t sub_1D4C473F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,int a48,int a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53)
{
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  if (!v53)
    JUMPOUT(0x1D4C09E54);
  a50 = 0;
  a49 = 0;
  v56 = ((uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t *, int *))(qword_1E985F270[v54 - 221] - 2))(*(unsigned int *)(qword_1E985F270[v54 ^ 0xFA] - 3), *(_QWORD *)a53, *(unsigned int *)(a53 + 12), &a50, &a49);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 + 8 * ((((v56 ^ 0xCCDBDEBE) + ((2 * (_DWORD)v56) & 0x99B7BD7C) == -589570367) * (v54 + 179)) ^ v54)) - 8))(v56, v57, v58, v59, v60, v61, v62, v63, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41);
}

uint64_t sub_1D4C474B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;

  v24 = ((uint64_t (*)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 + 8 * (v20 ^ 0xEC)) - 3))(*(unsigned int *)(*(_QWORD *)(v22 + 8 * (v20 ^ 0xDD)) - 2), a20, v21) == 0;
  return ((uint64_t (*)(void))(*(_QWORD *)(v23 + 8 * ((v24 * (v20 + 1499)) ^ v20)) - 8))();
}

uint64_t sub_1D4C47508(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t (*a41)(uint64_t, uint64_t),uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,int a48,int a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,unint64_t a59)
{
  int v59;
  int v60;
  int v61;
  uint64_t v62;
  unsigned int *v63;
  uint64_t (*v64)(_QWORD, _QWORD, _QWORD, uint64_t *, int *);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t (*v69)(void);
  int v71;
  int v72;

  v67 = v64(*v63, *(_QWORD *)v62, *(unsigned int *)(v62 + 12), &a50, &a49);
  v68 = (v67 ^ 0x7E73DEBE) + ((v60 - 51921789) & (2 * v67)) - 841121840;
  if (v68 == v61)
  {
    v71 = -45017;
  }
  else
  {
    if ((v67 ^ 0x7E73DEBE) + ((v60 - 51921789) & (2 * (_DWORD)v67)) == 2121522878)
    {
      v69 = (uint64_t (*)(void))(*(_QWORD *)(v65
                                          + 8
                                          * (v59 - 1875438195 + 18 * (((a41(24, 4101018099) == 0) ^ 0x6D) & 1) + 247))
                              - 8);
      return v69();
    }
    v72 = 882831569 * ((-1004377353 - ((v66 - 108) | 0xC4226AF7) + ((v66 - 108) | 0x3BDD9508)) ^ 0xA82B27C2);
    *(_DWORD *)(v66 - 108) = v59 + v72 - 1875437980;
    *(_DWORD *)(v66 - 104) = v68 - v72 - 110604966;
    v67 = sub_1D4C32E10((_DWORD *)(v66 - 108));
    if (*(_DWORD *)(v66 - 100) == 314902380)
      v71 = -45016;
    else
      v71 = 0;
  }
  a59 = 0x996A703CF9788810;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65
                                                                        + 8
                                                                        * ((1051
                                                                          * (v71 == ((v59 + 952977539) ^ 0x5769CD99)
                                                                                  + ((v59 + 952977539) & 0x5769CD9A))) ^ (v59 - 1875437897)))
                                                            - 8))(v67, 3969263130, 2419529101);
}

uint64_t sub_1D4C47A94@<X0>(int a1@<W2>, int a2@<W8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52)
{
  int v52;
  uint64_t v53;

  return ((uint64_t (*)(void))(*(_QWORD *)(v53
                                        + 8
                                        * (((a52 != 0x996A703CF9788810) * (v52 + (a2 ^ (a1 - 246)) + 1722)) ^ a2))
                            - ((a2 + 455) | 2u)
                            + 735))();
}

uint64_t sub_1D4C47AE4(uint64_t a1, uint64_t a2, char a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  _BOOL4 v8;
  BOOL v9;

  v6 = *(_DWORD *)(v4 + 0x66958FC3068777FCLL) + 813220973;
  v7 = *(_DWORD *)(v4 + 0x66958FC3068777F8) - 487505534;
  v8 = v6 < 0x43E29E4F;
  v9 = v6 > v7;
  if (v8 != v7 < 0x43E29E4F)
    v9 = v8;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((1809 * (((a3 + v3 + 29) ^ v9) & 1)) ^ v3)) - 8))();
}

uint64_t sub_1D4C47B6C@<X0>(int a1@<W1>, int a2@<W2>, uint64_t a3@<X8>)
{
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  int v7;

  v6 = (v4 - 1986685284) & 0x766A679A;
  v7 = (*(unsigned __int8 *)(*(_QWORD *)a3 + (v3 + a1)) << 24) | (*(unsigned __int8 *)(*(_QWORD *)a3 + (v3 + a1 + 1)) << 16) | (*(unsigned __int8 *)(*(_QWORD *)a3 + ((v6 + 457) ^ (a2 + 481) ^ 0x7CA13391u) + v3) << 8) | *(unsigned __int8 *)(*(_QWORD *)a3 + (v3 + a1 + 3));
  *(_DWORD *)(a3 + 12) = v3 + 4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * ((1074 * (v7 == 0)) ^ v6)) - 4))();
}

uint64_t sub_1D4C47BF8()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  return ((uint64_t (*)(void))(*(_QWORD *)(v2
                                        + 8
                                        * ((332 * (((v1 == 0x996A703CF9788810) ^ (v0 + 38)) & 1)) ^ v0))
                            - 8))();
}

uint64_t sub_1D4C47C4C(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  _BOOL4 v7;

  v7 = v3 + 650116101 > (v4 - 650610410);
  if ((v3 + 650116101) < 0x3A29D5E3 != (v4 - 650610410) < 0x3A29D5E3)
    v7 = (v3 + 650116101) < 0x3A29D5E3;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (v5 ^ (467 * !v7)))
                            - (((v5 ^ (a3 + 481)) - a3 + 905) ^ 0x381)))();
}

uint64_t sub_1D4C47CC8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  int v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *(unsigned __int8 *)(v38 + (_DWORD)a1 + v37 + ((v39 - 1094739338) ^ 0xBEBF9CE5) - 276);
  *(_DWORD *)(a8 + 12) = v37 + 8;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 8 * (v39 ^ (1352 * (v40 != 0x996A703CF9788810)))))(v42, a1, a2, a3, a4, a5, a6, a7, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37);
}

uint64_t sub_1D4C47D64(uint64_t a1, int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  _BOOL4 v11;
  _BOOL4 v12;

  v8 = v6 + v5 + ((v4 + 457) ^ (a2 - 289));
  v9 = v8 + 219058912;
  v10 = (v4 ^ v3 ^ 0x3C2A239E) + v2;
  v11 = v8 > 0xF2F16D1F;
  v12 = v9 > v10;
  if (v10 < 0xD0E92E0 == v11)
    v11 = v12;
  return ((uint64_t (*)(void))(*(_QWORD *)(v7 + 8 * ((959 * !v11) ^ v4)) - 4))();
}

uint64_t sub_1D4C47DE4@<X0>(int a1@<W2>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  *(_DWORD *)(a2 + 12) = v2;
  return ((uint64_t (*)(void))(*(_QWORD *)(v5 + 8 * (v3 ^ (1271 * (v4 != 0x996A703CF9788810))))
                            + 2419529093
                            - ((4 * v3) ^ 0x940 ^ (a1 + 436))))();
}

uint64_t sub_1D4C47E38()
{
  int v0;
  int v1;
  int v2;
  int v3;
  uint64_t v4;
  unsigned int v5;
  _BOOL4 v6;

  v5 = ((v2 + 154) ^ 0xD0294B9A) + v0;
  v6 = v1 + 498125799 > v5;
  if ((v1 + 498125799) < 0x311AA5C9 != v5 < 0x311AA5C9)
    v6 = (v1 + 498125799) < 0x311AA5C9;
  return ((uint64_t (*)(void))(*(_QWORD *)(v4 + 8 * (int)((v6 * (v3 + ((v2 - 1224770303) & 0xD93795BF) - 90)) ^ v2))
                            - 8))();
}

uint64_t sub_1D4C47EBC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43)
{
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;

  *(_DWORD *)(a8 + 12) = v43 + 4;
  return (*(uint64_t (**)(BOOL, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v46 + 8 * (v44 ^ (239 * (v45 == 0x996A703CF9788810)))))(v45 == 0x996A703CF9788810, a1, a2, a3, a4, a5, a6, a7, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43);
}

uint64_t sub_1D4C47F48(uint64_t a1, int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  _BOOL4 v10;
  int v11;
  _BOOL4 v12;

  v7 = v4 + v5 + a2;
  v8 = v7 + 843813432 + v3 - 883;
  v9 = ((v3 - 574637562) & 0xB27757FD ^ 0x416D200C) + v2;
  v10 = v7 > 0xCDB46DB1;
  v11 = v10 ^ (v9 < 0x324B924E);
  v12 = v8 > v9;
  if (v11)
    v12 = v10;
  return (*(uint64_t (**)(void))(v6 + 8 * ((2019 * !v12) ^ v3)))();
}

void sub_1D4C47FD8(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, unsigned int a6@<W7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,_QWORD *a28)
{
  int v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);

  *(_DWORD *)(a7 + 12) = v28;
  *a28 = v30(v29, 925082483, a1, a2, a3, a4, a5, a6 & 0xFFF80000 | (a6 >> 8) & 0x7FFFF);
  JUMPOUT(0x1D4C48054);
}

uint64_t sub_1D4C48104(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t (*a41)(_QWORD, uint64_t),uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48)
{
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v50 = a41(a3 + ((v48 + 1231215089) & 0xB69D2587) + 185500081, 1120292948);
  STACK[0x280] = v50;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(_QWORD, uint64_t), uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 8 * ((2002 * (v50 != 0)) ^ v48)))(v50, v51, 2419529101, v52, v53, v54, v55, v56, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36,
           a37,
           a38,
           a39,
           a40,
           a41,
           a42,
           a43,
           a44,
           a45,
           a46,
           a47,
           a48);
}

void sub_1D4C4816C()
{
  JUMPOUT(0x1D4C44910);
}

uint64_t sub_1D4C481D4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  unsigned int v5;
  uint64_t v6;

  LODWORD(STACK[0x28C]) = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v6 + 8 * (int)(v5 ^ (1456 * (v3 != 0))))
                            - ((v5 ^ (a3 - 384))
                             + (v5 ^ 0xFFFFFFFF6FC8EBFBLL))))();
}

uint64_t sub_1D4C48228@<X0>(int a1@<W8>)
{
  int v1;
  _QWORD *v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * (int)(((*v2 != 0) * (v1 + (a1 ^ 0x903716CE) + 51)) | a1)) - 8))();
}

void sub_1D4C48260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void (*a22)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v22;
  int v23;
  int v24;
  int v25;

  *(_DWORD *)(a3 + 151) = v25;
  a22(a1, a2, a3 + 151);
  *(_QWORD *)v22 = 0;
  *(_DWORD *)(v22 + 8) = v23;
  *(_DWORD *)(v22 + 12) = v24;
  ((void (*)(uint64_t))a22)(v22);
  JUMPOUT(0x1D4C479DCLL);
}

uint64_t sub_1D4C4828C@<X0>(uint64_t a1@<X8>)
{
  int v1;
  int v2;
  uint64_t v3;

  return (*(uint64_t (**)(void))(v3 + 8 * ((57 * (a1 == 0)) ^ (v1 + v2 + 778))))();
}

uint64_t sub_1D4C482E8@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t (*a15)(uint64_t), uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51)
{
  _QWORD *v52;
  int v53;
  int v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;

  v56 = v52;
  v57 = a15(a1);
  *v56 = 0;
  *a4 = 0;
  *(_DWORD *)(a31 + 40 * a12 + 36) = 0;
  return ((uint64_t (*)(uint64_t))(*(_QWORD *)(v55
                                                      + 8
                                                      * ((((((23 * (v54 ^ 0x9037159D)) ^ (a51 == 0x996A703CF9788810)) & 1) == 0)
                                                        * (v54 + 1875439310)) ^ (v53 + v54 + 298)))
                                          - 8))(v57);
}

uint64_t sub_1D4C48324(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t (*a41)(_QWORD, uint64_t))
{
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v43 = a41((a2 - 2046131935), 1120292948);
  STACK[0x268] = v43;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 8 * (int)(((((40 * (v41 ^ 0x39E)) ^ 0xFFFFFEBD) + 29 * (v41 ^ 0x395)) * (v43 == 0)) ^ v41)))(v43, v44, 2419529101, v45, v46, v47, v48, v49, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

uint64_t sub_1D4C483A4()
{
  uint64_t v0;
  char v1;
  int v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3 + 8 * ((1051 * (((v0 == 0) ^ (v2 - v1 + 33)) & 1)) ^ v2))
                            - (v2 + 646)
                            + 998))();
}

uint64_t sub_1D4C483DC@<X0>(char a1@<W2>, int a2@<W8>)
{
  _QWORD *v2;
  uint64_t v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(v3
                                        + 8 * ((1993 * (((*v2 == 0) ^ (a2 ^ (a1 - 42))) & 1)) ^ a2))
                            - 8))();
}

void sub_1D4C48410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void (*a22)(void),uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  int v39;
  int v40;

  a22();
  *(_QWORD *)a39 = 0;
  *(_DWORD *)(a39 + 8) = v39;
  *(_DWORD *)(a39 + 12) = v40;
  ((void (*)(uint64_t))a22)(a39);
  JUMPOUT(0x1D4C4732CLL);
}

void aslgmuibau()
{
  unint64_t v0;
  uint64_t v1;
  _BYTE v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = (unint64_t)&v2[qword_1EFEC75D8 ^ qword_1EFEC75E0];
  qword_1EFEC75E0 = 1137813707 * v0 + 0x5751864245CF6939;
  qword_1EFEC75D8 = 1137813707 * (v0 ^ 0xE86952A9CE08E98BLL);
  v1 = *((_QWORD *)&unk_1E985B9B0
       + ((29
         * (((uint64_t (*)(uint64_t, uint64_t))(qword_1E985F270[((-53
                                                                                         * ((qword_1EFEC75D8
                                                                                           - qword_1EFEC75E0) ^ 0x8B)) ^ byte_1D4C4CC90[byte_1D4C4C870[(-53 * ((qword_1EFEC75D8 - qword_1EFEC75E0) ^ 0x8B))] ^ 0xDC])
                                                                      - 21]
                                                      - 3))(24, 4101018099) == 0)) ^ 0x1EDu))- 4;
  __asm { BR              X8 }
}

uint64_t sub_1D4C485A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v4;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 1471034656;
  *(_DWORD *)(a1 + 16) = 0;
  v4 = v2(4096, 1358311088);
  *(_QWORD *)a1 = v4;
  return ((uint64_t (*)(void))(*(_QWORD *)(v1
                                        + 8
                                        * (((((v4 == 0) ^ 0xA56C9F0) & 1) == 0) | (4
                                                                                 * ((((v4 == 0) ^ 0xA56C9F0) & 1) == 0)) | 0x440u))
                            - 8))();
}

uint64_t sub_1D4C48608(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  *(_DWORD *)(v6 + 8) = v3 + 4096;
  v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5
                                                           + 8
                                                           * ((1686
                                                             * ((*(_DWORD *)(v6 + 12) - 4093) < 0xFFFFEFFF)) ^ 0x3C3u));
  *(_QWORD *)(v8 - 184) = *(_QWORD *)(v4 + 248) - 13;
  *(_QWORD *)(v8 - 208) = v2;
  *(_QWORD *)(v8 - 176) = v7;
  return v9(a1, a2, 1352897984);
}

uint64_t sub_1D4C48688(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;

  return (*(uint64_t (**)(void))(v6
                              + 8
                              * ((31
                                * (((2 * ((v5 << ((v4 ^ 0x82) + 57)) + a3)) & 0xBF7CEFF8)
                                 + (((v5 << ((v4 ^ 0x82) + 57)) + a3) ^ 0xDFBE77FC)
                                 + v3 > 0xFFFFEFFA)) ^ v4)))();
}

uint64_t sub_1D4C4B268(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  _BYTE v5[8];

  v2 = (unint64_t)&v5[qword_1EFEC75D8 ^ qword_1EFEC75B0];
  qword_1EFEC75B0 = 1137813707 * v2 - 0x1796AD5631F71675;
  qword_1EFEC75D8 = 1137813707 * (v2 ^ 0xE86952A9CE08E98BLL);
  v3 = ((uint64_t (*)(uint64_t))(qword_1E985F270[((-53
                                                                                         * ((qword_1EFEC75D8
                                                                                           - qword_1EFEC75B0) ^ 0x8B)) ^ byte_1D4C4CE90[byte_1D4C4CA70[(-53 * ((qword_1EFEC75D8 - qword_1EFEC75B0) ^ 0x8B))] ^ 0x27])
                                                        + 10]
                                        - 2))(a2);
  return ((uint64_t (*)(uint64_t))(qword_1E985F270[((-53
                                                                             * ((qword_1EFEC75D8 - qword_1EFEC75B0) ^ 0x8B)) ^ byte_1D4C4CB90[byte_1D4C4C770[(-53 * ((qword_1EFEC75D8 - qword_1EFEC75B0) ^ 0x8B))] ^ 0x2C])
                                                          - 58]
                                          - 3))(v3);
}

uint64_t sub_1D4C4B380()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  void (*v5)(_QWORD);
  char v6;

  v0 = qword_1EFEC75D8 - qword_1EFEC75E8 - (_QWORD)&v6;
  v1 = (1137813707 * v0) ^ 0xE86952A9CE08E98BLL;
  v2 = 1137813707 * (v0 ^ 0xE86952A9CE08E98BLL);
  qword_1EFEC75E8 = v1;
  LOBYTE(v1) = -53 * ((v2 - v1) ^ 0x8B);
  v3 = qword_1E985F270[(v1 ^ byte_1D4C4CE90[byte_1D4C4CA70[v1] ^ 0xBE]) - 200];
  qword_1EFEC75D8 = v2;
  v5 = (void (*)(_QWORD))(qword_1E985F270[(v1 ^ byte_1D4C4CC90[byte_1D4C4C870[v1] ^ 0x98])
                                                   + 11]
                                   - 2);
  v5(*(unsigned int *)(v3 - 3));
  v5(*(unsigned int *)(qword_1E985F270[((-53 * (qword_1EFEC75E8 ^ 0x8B ^ qword_1EFEC75D8)) ^ byte_1D4C4CC90[byte_1D4C4C870[(-53 * (qword_1EFEC75E8 ^ 0x8B ^ qword_1EFEC75D8))] ^ 0xB0])
                                     - 213]
                     - 3));
  return ((uint64_t (*)(_QWORD))v5)(*(unsigned int *)(qword_1E985F270[((-53
                                                                                                 * (qword_1EFEC75E8 ^ 0x8B ^ qword_1EFEC75D8)) ^ byte_1D4C4CB90[byte_1D4C4C770[(-53 * (qword_1EFEC75E8 ^ 0x8B ^ qword_1EFEC75D8))] ^ 0x94])
                                                                              - 219]
                                                              - 3));
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

