uint64_t AppleSPUHIDDriverClass::SendCommand(AppleSPUHIDDriverClass *this, unsigned int a2, const void *inputStruct, size_t inputStructCnt, void *outputStruct, unint64_t *a6)
{
  uint64_t v7;
  NSObject *v9;
  char *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  v7 = IOConnectCallMethod(*((_DWORD *)this + 12), 0, input, 1u, inputStruct, inputStructCnt, 0, 0, outputStruct, a6);
  if ((_DWORD)v7)
  {
    v9 = *((_QWORD *)this + 7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v7))
        v10 = mach_error_string(v7);
      else
        v10 = "";
      *(_DWORD *)buf = 136316418;
      v12 = "";
      v13 = 2080;
      v14 = "result == 0 ";
      v15 = 2080;
      v16 = v10;
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v19 = 1024;
      v20 = 1215;
      v21 = 1024;
      v22 = v7;
      _os_log_impl(&dword_2310CA000, v9, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
  }
  return v7;
}

uint64_t SPUDataQueue::init(SPUDataQueue *this, unsigned __int8 *a2, size_t a3, int a4, unsigned int a5)
{
  SPUDataQueue *v8;
  char *v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  _DWORD *v13;
  _DWORD *v14;

  v8 = this;
  *((_QWORD *)this + 1) = a2;
  v9 = (char *)this + 8;
  *((_DWORD *)this + 12) = a3;
  *((_QWORD *)this + 2) = off_24FFF9A00;
  *((_QWORD *)this + 3) = this;
  if (!a5)
  {
    sub_2310CBA0C((uint64_t)this + 8, 481, 0, 0, 0);
    sub_2310CBA0C((uint64_t)v9, 482, 0, 0, 0);
    this = (SPUDataQueue *)*((_QWORD *)v8 + 3);
  }
  *((_WORD *)v8 + 20) = a5 | ((_WORD)a5 << 8);
  (*(void (**)(SPUDataQueue *, _QWORD, uint64_t))(*(_QWORD *)this + 64))(this, 0, a5 + 7 + 2 * a5 - (a5 + 7) % a5);
  LOBYTE(v10) = *((_BYTE *)v8 + 40);
  v11 = v10;
  v12 = a3 - 7 - 3 * v10 + (v10 + 7) % v10;
  *((_DWORD *)v8 + 8) = v12;
  v13 = (_DWORD *)*((_QWORD *)v8 + 1);
  if (a4)
  {
    bzero(v13, a3);
    v13 = (_DWORD *)*((_QWORD *)v8 + 1);
    *v13 = *((_DWORD *)v8 + 8);
    v13[1] = 458758;
    v10 = *((unsigned __int8 *)v8 + 40);
    v11 = *((unsigned __int8 *)v8 + 40);
    v14 = (_DWORD *)((char *)v13 + v10 + 7 - ((int)v10 + 7) % v11);
    *v14 = 0;
    *(_DWORD *)((char *)v14 + v10) = 0;
  }
  else if (*v13 == v12)
  {
    v10 = v10;
  }
  else
  {
    sub_2310CBA0C((uint64_t)v9, 518, v12, *v13, 0);
    v13 = (_DWORD *)*((_QWORD *)v8 + 1);
    v10 = *((unsigned __int8 *)v8 + 40);
    v11 = *((unsigned __int8 *)v8 + 40);
  }
  *((_DWORD *)v8 + 9) = *(_DWORD *)((char *)v13 + v10 - ((int)v10 + 7) % v11 + 7);
  (*(void (**)(_QWORD, _QWORD, size_t))(**((_QWORD **)v8 + 3) + 72))(*((_QWORD *)v8 + 3), 0, a3);
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)v8 + 3) + 88))(*((_QWORD *)v8 + 3));
}

uint64_t sub_2310CAE54(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
}

uint64_t sub_2310CAE60(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 56))(a1);
}

uint64_t sub_2310CAE6C(uint64_t a1, unsigned int a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 64))(a1, a2);
}

uint64_t sub_2310CAE7C(uint64_t a1, unsigned int a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 72))(a1, a2);
}

uint64_t sub_2310CAE8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, a2, a3, a4, a6);
}

uint64_t sub_2310CAE9C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
}

uint64_t sub_2310CAEA8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
}

uint64_t sub_2310CAEB4(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 104))(a1);
}

uint64_t SPUDataQueue::clear(SPUDataQueue *this)
{
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  unsigned int v7;
  void (*v8)(_QWORD);

  (*(void (**)(SPUDataQueue *))(*(_QWORD *)this + 32))(this);
  v2 = *((_QWORD *)this + 2);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(v2 + 16))(*((_QWORD *)this + 3), 0, *((unsigned __int8 *)this + 40)+ 7- (*((unsigned __int8 *)this + 40) + 7) % *((unsigned __int8 *)this + 40)+ 2 * *((unsigned __int8 *)this + 40));
  v3 = (int *)*((_QWORD *)this + 1);
  v4 = *((unsigned __int8 *)this + 40);
  v5 = v4 + 7 - ((int)v4 + 7) % *((unsigned __int8 *)this + 40);
  v6 = (int *)((char *)v3 + v5);
  *v6 = 0;
  *(_DWORD *)((char *)v6 + v4) = 0;
  *((_DWORD *)this + 9) = 0;
  v7 = *((_DWORD *)this + 8);
  if (v7 != *v3)
  {
    sub_2310CBA0C((uint64_t)this + 8, 555, v7, *v3, 0);
    v7 = *((_DWORD *)this + 8);
    LODWORD(v4) = *((unsigned __int8 *)this + 40);
    LODWORD(v5) = v4 + 7 - ((int)v4 + 7) % v4;
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(*((_QWORD *)this + 3), (v5 + 2 * v4), v7);
  bzero((void *)(*((_QWORD *)this + 1)- (*((unsigned __int8 *)this + 40) + 7) % *((unsigned __int8 *)this + 40)+ *((unsigned __int8 *)this + 40)+ 7+ 2 * *((unsigned __int8 *)this + 40)), *((unsigned int *)this + 8));
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 24))(*((_QWORD *)this + 3), (*((unsigned __int8 *)this + 40) + 7)/ *((unsigned __int8 *)this + 40)* *((unsigned __int8 *)this + 40)+ 2 * *((unsigned __int8 *)this + 40), *((unsigned int *)this + 8));
  (*(void (**)(_QWORD, _QWORD, uint64_t))(v2 + 24))(*((_QWORD *)this + 3), 0, *((unsigned __int8 *)this + 40)+ 7- (*((unsigned __int8 *)this + 40) + 7) % *((unsigned __int8 *)this + 40)+ 2 * *((unsigned __int8 *)this + 40));
  v8 = *(void (**)(_QWORD))(v2 + 40);
  if (v8)
    v8(*((_QWORD *)this + 3));
  return (*(uint64_t (**)(SPUDataQueue *))(*(_QWORD *)this + 40))(this);
}

uint64_t SPUDataQueue::enqueue_msg(uint64_t a1, unsigned int a2, unsigned int a3, void *__src, unsigned int a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unint64_t *v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int *v21;
  unsigned int v22;
  unint64_t v23;
  unsigned int v24;
  unsigned int v25;
  BOOL v26;
  unsigned int v27;
  unsigned int *v28;
  int v29;
  _DWORD *v30;
  size_t *v31;
  char *v32;
  size_t v33;
  unsigned int *v34;
  uint64_t v35;
  void (*v36)(_QWORD);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(_QWORD);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v45;
  BOOL v46;
  unsigned int v47;
  unsigned int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  char __dst[8];
  _QWORD v56[33];

  v56[31] = *MEMORY[0x24BDAC8D0];
  if (a5 <= 0x10)
  {
    memcpy(__dst, __src, 16 * a5);
    (*(void (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
    v54 = a1 + 8;
    if (*(_QWORD *)(a1 + 8))
    {
      v10 = a5;
      v11 = *(_QWORD *)(a1 + 16);
      v12 = 0;
      if (a5)
      {
        v13 = v56;
        v14 = a5;
        do
        {
          v16 = *v13;
          v13 += 2;
          v15 = v16;
          if (v16 > 0x400000)
            goto LABEL_27;
          v12 += v15;
        }
        while (--v14);
      }
      v52 = a2;
      v17 = *(unsigned __int8 *)(a1 + 41);
      (*(void (**)(_QWORD, _QWORD, uint64_t))(v11 + 16))(*(_QWORD *)(a1 + 24), 0, *(unsigned __int8 *)(a1 + 40)+ 7- (*(unsigned __int8 *)(a1 + 40) + 7) % *(unsigned __int8 *)(a1 + 40)+ 2 * *(unsigned __int8 *)(a1 + 40));
      v18 = *(unsigned int *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 8);
      v20 = *(unsigned __int8 *)(a1 + 40);
      v21 = (unsigned int *)(v20 + 7 - ((int)v20 + 7) % *(unsigned __int8 *)(a1 + 40) + v19);
      v22 = *v21;
      v53 = *(unsigned int *)((char *)v21 + v20);
      v49 = *(_DWORD *)(v19 + 4);
      if (!*(_BYTE *)(a1 + 40))
        sub_2310CBA0C(v54, 630, 0, 0, 0);
      if (!*(_BYTE *)(a1 + 41))
        sub_2310CBA0C(v54, 631, 0, 0, 0);
      if (!(_DWORD)v18)
        sub_2310CBA0C(v54, 632, 0, 0, 0);
      v23 = (v17 + v12 + 15) / v17 * v17;
      if (v22 >= v18)
        sub_2310CBA0C(v54, 633, v22, v18, 0);
      v51 = v11;
      v24 = v53;
      if (v53 >= v18)
        sub_2310CBA0C(v54, 634, v53, v18, 0);
      if ((int)v53 + (int)v23 > v18 && v22 != 0)
        v25 = 0;
      else
        v25 = v53;
      if (v53 < v22)
      {
        v26 = 0;
      }
      else
      {
        v24 = v25;
        v26 = (int)v53 + (int)v23 > v18 && v22 != 0;
      }
      v27 = v24 + v23;
      if (v24 + v23 >= v22 || v27 > v18)
      {
        if (v24 < v22)
          goto LABEL_27;
        if (v27 >= v18)
        {
          v5 = 0;
          if (v27 != (_DWORD)v18 || !v22)
            goto LABEL_57;
        }
      }
      v46 = v26;
      v47 = v24 + v23;
      v28 = (unsigned int *)(*(_QWORD *)(a1 + 8)
                           + v24
                           - (*(unsigned __int8 *)(a1 + 40) + 7) % *(unsigned __int8 *)(a1 + 40)
                           + *(unsigned __int8 *)(a1 + 40)
                           + 7
                           + 2 * *(unsigned __int8 *)(a1 + 40));
      v45 = v49 & 0xFFFF0000;
      v48 = a3;
      if ((v49 & 0xFFFF0000) == 0x70000)
      {
        *v28 = 542134081;
        v28[1] = v12;
        v28[2] = v52;
        v28[3] = a3;
      }
      else
      {
        *v28 = v12;
        v28[1] = v52;
        v28[2] = a3;
        v28[3] = 542134081;
      }
      v50 = v23;
      v29 = v23 - 16;
      v30 = v28 + 4;
      if (a5)
      {
        v31 = v56;
        v32 = (char *)(v28 + 4);
        do
        {
          v33 = *v31;
          memcpy(v32, (const void *)*(v31 - 1), *v31);
          v32 += v33;
          v31 += 2;
          --v10;
        }
        while (v10);
      }
      if (v29 != v12)
        bzero((char *)v30 + v12, v29 - v12);
      (*(void (**)(_QWORD, _QWORD, uint64_t))(v51 + 24))(*(_QWORD *)(a1 + 24), v24+ (*(unsigned __int8 *)(a1 + 40) + 7)/ *(unsigned __int8 *)(a1 + 40)* *(unsigned __int8 *)(a1 + 40)+ 2 * *(unsigned __int8 *)(a1 + 40), v50);
      if (v46
        && v53
         - (*(unsigned __int8 *)(a1 + 41) + 15) % *(unsigned __int8 *)(a1 + 41)
         + (unint64_t)*(unsigned __int8 *)(a1 + 41)
         + 15 <= v18)
      {
        v34 = (unsigned int *)(*(_QWORD *)(a1 + 8)
                             + v53
                             - (*(unsigned __int8 *)(a1 + 40) + 7) % *(unsigned __int8 *)(a1 + 40)
                             + *(unsigned __int8 *)(a1 + 40)
                             + 7
                             + 2 * *(unsigned __int8 *)(a1 + 40));
        if (v45 == 458752)
        {
          v34[1] = v12;
          v34[2] = v52;
          v34[3] = v48;
          v12 = 542134081;
        }
        else
        {
          v34[2] = v48;
          v34[3] = 542134081;
          v34[1] = v52;
        }
        *v34 = v12;
        (*(void (**)(_QWORD, _QWORD, uint64_t))(v51 + 24))(*(_QWORD *)(a1 + 24), v53+ (*(unsigned __int8 *)(a1 + 40) + 7)/ *(unsigned __int8 *)(a1 + 40)* *(unsigned __int8 *)(a1 + 40)+ 2 * *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41)+ 15- (*(unsigned __int8 *)(a1 + 41) + 15) % *(unsigned __int8 *)(a1 + 41));
      }
      if (v47 == (_DWORD)v18)
        v35 = 0;
      else
        v35 = v47;
      v36 = *(void (**)(_QWORD))(v51 + 40);
      if (v36)
        v36(*(_QWORD *)(a1 + 24));
      v37 = *(unsigned __int8 *)(a1 + 40);
      v38 = ((int)v37 + 7) % *(unsigned __int8 *)(a1 + 40);
      v39 = v37 + 7 + v37;
      *(_DWORD *)(v39 + *(_QWORD *)(a1 + 8) - v38) = v35;
      (*(void (**)(_QWORD, _QWORD))(v51 + 24))(*(_QWORD *)(a1 + 24), (v39 - v38));
      v40 = *(void (**)(_QWORD))(v51 + 40);
      if (v40)
        v40(*(_QWORD *)(a1 + 24));
      (*(void (**)(_QWORD, _QWORD))(v51 + 16))(*(_QWORD *)(a1 + 24), (*(unsigned __int8 *)(a1 + 40) + 7)/ *(unsigned __int8 *)(a1 + 40)* *(unsigned __int8 *)(a1 + 40));
      v41 = *(unsigned __int8 *)(a1 + 40) + 7;
      v42 = *(_QWORD *)(a1 + 8) - v41 % *(unsigned __int8 *)(a1 + 40);
      v43 = *(unsigned int *)(v42 + v41);
      if (v43 >= v18)
        sub_2310CBA0C(v54, 753, *(_DWORD *)(v42 + v41), v18, 0);
      if (v35 >= v18)
        sub_2310CBA0C(v54, 754, v35, v18, 0);
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(v51 + 32))(*(_QWORD *)(a1 + 24), v53, v35, v43, v52, v48, 542134081);
      v5 = 1;
      goto LABEL_57;
    }
LABEL_27:
    v5 = 0;
LABEL_57:
    (*(void (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
    return v5;
  }
  return 0;
}

uint64_t SPUDataQueue::dequeue_all(SPUDataQueue *this, void (*a2)(void *, unsigned int, unsigned __int8 *, unint64_t, unsigned int), void *a3)
{
  char *v6;
  uint64_t v7;
  void (*v8)(_QWORD);
  int v10;
  uint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;

  v6 = (char *)this + 8;
  (*(void (**)(SPUDataQueue *))(*(_QWORD *)this + 32))(this);
  v12 = 0;
  v13 = 0;
  v11 = 0;
  while (sub_2310CBABC((uint64_t)v6, &v13, &v12, (_DWORD *)&v11 + 1, &v11, &v10))
  {
    a2(a3, HIDWORD(v11), v13, v12, v11);
    v7 = *((_QWORD *)this + 2);
    *(_DWORD *)(*((_QWORD *)this + 1)
              - (*((unsigned __int8 *)this + 40) + 7) % *((unsigned __int8 *)this + 40)
              + *((unsigned __int8 *)this + 40)
              + 7) = *((_DWORD *)this + 9);
    (*(void (**)(_QWORD))(v7 + 24))(*((_QWORD *)this + 3));
    v8 = *(void (**)(_QWORD))(v7 + 40);
    if (v8)
      v8(*((_QWORD *)this + 3));
  }
  return (*(uint64_t (**)(SPUDataQueue *))(*(_QWORD *)this + 40))(this);
}

uint64_t SPUDataQueue::dequeue_all_read_only(SPUDataQueue *this, void (*a2)(void *, unsigned int, unsigned __int8 *, unint64_t, unsigned int), void *a3)
{
  char *v6;
  int v8;
  uint64_t i;
  unint64_t v10;
  unsigned __int8 *v11;

  v6 = (char *)this + 8;
  (*(void (**)(SPUDataQueue *))(*(_QWORD *)this + 32))(this);
  v10 = 0;
  v11 = 0;
  for (i = 0; sub_2310CBABC((uint64_t)v6, &v11, &v10, (_DWORD *)&i + 1, &i, &v8); a2(a3, HIDWORD(i), v11, v10, i))
    ;
  return (*(uint64_t (**)(SPUDataQueue *))(*(_QWORD *)this + 40))(this);
}

BOOL SPUDataQueue::update_read_pointer(SPUDataQueue *this, unsigned int a2)
{
  unsigned int *v4;
  unsigned int v5;
  uint64_t v6;
  void (*v7)(_QWORD);

  (*(void (**)(SPUDataQueue *))(*(_QWORD *)this + 32))(this);
  v4 = (unsigned int *)*((_QWORD *)this + 1);
  v5 = *v4;
  if (*v4 > a2)
  {
    v6 = *((_QWORD *)this + 2);
    *(unsigned int *)((char *)v4
                    + *((unsigned __int8 *)this + 40)
                    - (*((unsigned __int8 *)this + 40) + 7) % *((unsigned __int8 *)this + 40)
                    + 7) = a2;
    (*(void (**)(_QWORD))(v6 + 24))(*((_QWORD *)this + 3));
    v7 = *(void (**)(_QWORD))(v6 + 40);
    if (v7)
      v7(*((_QWORD *)this + 3));
  }
  (*(void (**)(SPUDataQueue *))(*(_QWORD *)this + 40))(this);
  return v5 > a2;
}

BOOL SPUDataQueue::is_empty(SPUDataQueue *this)
{
  uint64_t v2;
  _DWORD *v3;
  _BOOL8 v4;

  (*(void (**)(SPUDataQueue *))(*(_QWORD *)this + 32))(this);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(*((_QWORD *)this + 2) + 16))(*((_QWORD *)this + 3), 0, *((unsigned __int8 *)this + 40)+ 7- (*((unsigned __int8 *)this + 40) + 7) % *((unsigned __int8 *)this + 40)+ 2 * *((unsigned __int8 *)this + 40));
  v2 = *((unsigned __int8 *)this + 40);
  v3 = (_DWORD *)(v2 + 7 - ((int)v2 + 7) % *((unsigned __int8 *)this + 40) + *((_QWORD *)this + 1));
  v4 = *v3 == *(_DWORD *)((char *)v3 + v2);
  (*(void (**)(SPUDataQueue *))(*(_QWORD *)this + 40))(this);
  return v4;
}

uint64_t SPUDataQueue::get_extended_info(SPUDataQueue *this, int a2, unint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  (*(void (**)(SPUDataQueue *))(*(_QWORD *)this + 32))(this);
  v6 = *((_QWORD *)this + 2);
  switch(a2)
  {
    case 0:
      (*(void (**)(_QWORD, _QWORD))(v6 + 16))(*((_QWORD *)this + 3), (*((unsigned __int8 *)this + 40) + 7)/ *((unsigned __int8 *)this + 40)* *((unsigned __int8 *)this + 40));
      v7 = *((unsigned __int8 *)this + 40) + 7;
      v8 = *((_QWORD *)this + 1) - v7 % *((unsigned __int8 *)this + 40);
      goto LABEL_5;
    case 1:
      (*(void (**)(_QWORD, _QWORD))(v6 + 16))(*((_QWORD *)this + 3), *((unsigned __int8 *)this + 40)+ (*((unsigned __int8 *)this + 40) + 7)/ *((unsigned __int8 *)this + 40)* *((unsigned __int8 *)this + 40));
      v7 = *((unsigned __int8 *)this + 40) + 7;
      v8 = *((_QWORD *)this + 1) - v7 % *((unsigned __int8 *)this + 40) + *((unsigned __int8 *)this + 40);
LABEL_5:
      v10 = *(unsigned int *)(v8 + v7);
      goto LABEL_9;
    case 2:
      (*(void (**)(_QWORD, _QWORD, uint64_t))(v6 + 16))(*((_QWORD *)this + 3), 0, *((unsigned __int8 *)this + 40)+ 7- (*((unsigned __int8 *)this + 40) + 7) % *((unsigned __int8 *)this + 40)+ 2 * *((unsigned __int8 *)this + 40));
      v10 = *((unsigned int *)this + 8);
      goto LABEL_9;
    case 3:
      v10 = *((unsigned __int8 *)this + 40);
      goto LABEL_9;
    case 4:
      v10 = *((unsigned int *)this + 9);
LABEL_9:
      *a3 = v10;
      v9 = 1;
      break;
    default:
      v9 = 0;
      break;
  }
  (*(void (**)(SPUDataQueue *))(*(_QWORD *)this + 40))(this);
  return v9;
}

uint64_t sub_2310CBA00(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
}

uint64_t sub_2310CBA0C(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v5;
  uint64_t (*v6)(_QWORD, const char *, uint64_t, uint64_t, _DWORD *);
  _DWORD v8[3];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v8[0] = a3;
  v8[1] = a4;
  v8[2] = a5;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(uint64_t (**)(_QWORD, const char *, uint64_t, uint64_t, _DWORD *))(v5 + 56);
  if (v6)
    return v6(*(_QWORD *)(a1 + 16), "iop_ringbuffer.h", a2, 3, v8);
  else
    return (*(uint64_t (**)(_QWORD, const char *, uint64_t))(v5 + 48))(*(_QWORD *)(a1 + 16), "iop_ringbuffer.h", a2);
}

BOOL sub_2310CBABC(uint64_t a1, _QWORD *a2, _QWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v12;
  uint64_t v13;
  int v14;
  unint64_t v15;
  unsigned __int8 v16;
  unsigned int v17;
  void (*v18)(_QWORD);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  _BOOL4 v23;
  uint64_t v24;
  unint64_t v25;
  unsigned int v26;
  _DWORD *v27;
  _DWORD *v28;
  int v29;
  _DWORD *v31;
  _DWORD *v32;
  _DWORD *v33;
  _QWORD *v34;
  _QWORD *v35;

  v12 = *(_QWORD *)(a1 + 8);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(v12 + 16))(*(_QWORD *)(a1 + 16), 0, *(unsigned __int8 *)(a1 + 32)+ 7- (*(unsigned __int8 *)(a1 + 32) + 7) % *(unsigned __int8 *)(a1 + 32)+ 2 * *(unsigned __int8 *)(a1 + 32));
  v13 = *(_QWORD *)a1;
  v14 = *(_DWORD *)(*(_QWORD *)a1 + 4);
  v35 = a2;
  if (!v14)
  {
    sub_2310CBA0C(a1, 805, 0, 0, 0);
    v13 = *(_QWORD *)a1;
    v14 = *(_DWORD *)(*(_QWORD *)a1 + 4);
  }
  v15 = *(unsigned int *)(a1 + 24);
  v16 = *(_BYTE *)(a1 + 32);
  v17 = *(_DWORD *)(v13 - (v16 + 7) % v16 + v16 + v16 + 7);
  v18 = *(void (**)(_QWORD))(v12 + 40);
  if (v18)
  {
    v18(*(_QWORD *)(a1 + 16));
    v16 = *(_BYTE *)(a1 + 32);
  }
  v19 = *(unsigned int *)(a1 + 28);
  if (!v16)
    sub_2310CBA0C(a1, 820, 0, 0, 0);
  if (*(_BYTE *)(a1 + 33))
  {
    if ((_DWORD)v15)
      goto LABEL_9;
  }
  else
  {
    sub_2310CBA0C(a1, 821, 0, 0, 0);
    if ((_DWORD)v15)
      goto LABEL_9;
  }
  sub_2310CBA0C(a1, 822, 0, 0, 0);
LABEL_9:
  if (v19 >= v15)
    sub_2310CBA0C(a1, 823, v19, v15, 0);
  if (v17 >= v15)
    sub_2310CBA0C(a1, 824, v17, v15, 0);
  if ((_DWORD)v19 != v17)
  {
    v33 = a6;
    v34 = a3;
    v32 = a5;
    if (v19 + 16 <= v15)
      v20 = v19;
    else
      v20 = 0;
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v12 + 16))(*(_QWORD *)(a1 + 16), v20+ (*(unsigned __int8 *)(a1 + 32) + 7) / *(unsigned __int8 *)(a1 + 32) * *(unsigned __int8 *)(a1 + 32)+ 2 * *(unsigned __int8 *)(a1 + 32), *(unsigned __int8 *)(a1 + 33)+ 15- (*(unsigned __int8 *)(a1 + 33) + 15) % *(unsigned __int8 *)(a1 + 33));
    v21 = *(_QWORD *)a1
        + v20
        - (*(unsigned __int8 *)(a1 + 32) + 7) % *(unsigned __int8 *)(a1 + 32)
        + *(unsigned __int8 *)(a1 + 32)
        + 7
        + 2 * *(unsigned __int8 *)(a1 + 32);
    v22 = v14 & 0xFFFF0000;
    v23 = (v14 & 0xFFFF0000) == 458752;
    v24 = *(unsigned int *)(v21 + 4 * ((v14 & 0xFFFF0000) == 458752));
    if (v24 > v15)
      sub_2310CBA0C(a1, 852, *(_DWORD *)(v21 + 4 * v23), v15, 0);
    v25 = (v24 + (unint64_t)*(unsigned __int8 *)(a1 + 33) + 15)
        / *(unsigned __int8 *)(a1 + 33)
        * *(unsigned __int8 *)(a1 + 33);
    if ((_DWORD)v24)
    {
      if ((_DWORD)v25)
      {
LABEL_22:
        if (v15 < v25)
          sub_2310CBA0C(a1, 858, v25, v15, 0);
        v31 = a4;
        if ((int)v20 + (int)v25 > v15)
        {
          if (v17 >= v20)
            sub_2310CBA0C(a1, 865, v17, v20, 0);
          LODWORD(v20) = 0;
        }
        v26 = v20 + v25;
        if (v20 < v17 && v26 > v17)
          sub_2310CBA0C(a1, 869, v20, v17, v25);
        (*(void (**)(_QWORD, _QWORD, _QWORD))(v12 + 16))(*(_QWORD *)(a1 + 16), v20+ (*(unsigned __int8 *)(a1 + 32) + 7)/ *(unsigned __int8 *)(a1 + 32)* *(unsigned __int8 *)(a1 + 32)+ 2 * *(unsigned __int8 *)(a1 + 32), v25);
        v27 = (_DWORD *)(*(_QWORD *)a1
                       + v20
                       - (*(unsigned __int8 *)(a1 + 32) + 7) % *(unsigned __int8 *)(a1 + 32)
                       + *(unsigned __int8 *)(a1 + 32)
                       + 7
                       + 2 * *(unsigned __int8 *)(a1 + 32));
        *v35 = v27 + 4;
        *v34 = v24;
        if (v22 == 458752)
        {
          *v31 = v27[2];
          v28 = v27 + 3;
        }
        else
        {
          *v31 = v27[1];
          v28 = v27 + 2;
          v27 += 3;
        }
        *v32 = *v28;
        *v33 = *v27;
        if (v26 == (_DWORD)v15)
          v29 = 0;
        else
          v29 = v20 + v25;
        *(_DWORD *)(a1 + 28) = v29;
        return (_DWORD)v19 != v17;
      }
    }
    else
    {
      sub_2310CBA0C(a1, 856, 0, 0, 0);
      if ((_DWORD)v25)
        goto LABEL_22;
    }
    sub_2310CBA0C(a1, 857, 0, 0, 0);
    goto LABEL_22;
  }
  return (_DWORD)v19 != v17;
}

uint64_t hexdump(uint64_t result, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unsigned int v11;
  int v12;
  char v13;
  size_t v14;
  _QWORD *v15;
  const std::locale::facet *v16;
  int v17;
  std::locale v18;
  char __str[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v17 = result;
  v35 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v2 = a2;
    v3 = MEMORY[0x24BDAC740];
    v4 = result;
    do
    {
      if (v2 >= 0x10)
        v5 = 16;
      else
        v5 = v2;
      v6 = v5 - 1;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      *(_OWORD *)__str = 0u;
      v20 = 0u;
      v7 = 0;
      v8 = &__str[snprintf(__str, 0x100uLL, "%08x: ", v4 - v17)];
      do
      {
        v8 += snprintf(v8, 0x100uLL, "%02x ", *(unsigned __int8 *)(v4 + v7));
        if (v7 == 7)
          *(_WORD *)v8++ = 32;
        ++v7;
      }
      while (v5 != v7);
      if (v5 <= 0xF)
      {
        do
        {
          *(_DWORD *)v8 = 2105376;
          if (v6 == 6)
          {
            *(_WORD *)(v8 + 3) = 32;
            v8 += 4;
          }
          else
          {
            v8 += 3;
          }
          ++v6;
        }
        while (v6 < 0xF);
      }
      v9 = 0;
      *(_DWORD *)v8 = 2128928;
      v10 = v8 + 3;
      do
      {
        v11 = *(char *)(v4 + v9);
        if ((v11 & 0x80000000) != 0)
          v12 = __maskrune(*(char *)(v4 + v9), 0x40000uLL);
        else
          v12 = *(_DWORD *)(v3 + 4 * v11 + 60) & 0x40000;
        if (v12)
          v13 = v11;
        else
          v13 = 46;
        *v10 = v13;
        v10[1] = 0;
        if (v9 == 7)
        {
          *(_WORD *)(v10 + 1) = 32;
          v10 += 2;
        }
        else
        {
          ++v10;
        }
        ++v9;
      }
      while (v5 != v9);
      v14 = strlen(__str);
      v15 = sub_2310CF224(MEMORY[0x24BEDB318], (uint64_t)__str, v14);
      std::ios_base::getloc((const std::ios_base *)((char *)v15 + *(_QWORD *)(*v15 - 24)));
      v16 = std::locale::use_facet(&v18, MEMORY[0x24BEDB350]);
      ((void (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 10);
      std::locale::~locale(&v18);
      std::ostream::put();
      result = std::ostream::flush();
      if (v2 <= 0xF)
        break;
      v4 += v9;
      v2 -= 16;
    }
    while (v2);
  }
  return result;
}

void sub_2310CC104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::locale a12)
{
  std::locale::~locale(&a12);
  _Unwind_Resume(a1);
}

uint64_t sub_2310CC124(uint64_t a1)
{
  uint64_t v1;

  v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_2310CC13C()
{
  return 0;
}

uint64_t sub_2310CC148(uint64_t a1)
{
  io_connect_t v2;

  v2 = *(_DWORD *)(a1 + 24);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(a1 + 24) = 0;
  }
  *(_DWORD *)(a1 + 20) = 0;
  return 0;
}

uint64_t sub_2310CC18C(AppleSPUHIDDeviceClass *a1, __CFRunLoop *a2, const __CFString *a3)
{
  AppleSPUHIDDeviceClass::UnscheduleWithRunLoop(a1, a2, a3);
  return 0;
}

uint64_t sub_2310CC1A4(uint64_t a1, uint64_t a2, unsigned int a3)
{
  _BOOL8 inputStruct;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a3;
  inputStruct = a3 != 0;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 24), 1u, input, 1u, &inputStruct, 1uLL, 0, 0, 0, 0);
}

uint64_t sub_2310CC224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 88) = a2;
  *(_QWORD *)(a1 + 96) = a3;
  return 0;
}

uint64_t sub_2310CC240()
{
  return 0;
}

void AppleSPUHIDDeviceClass::alloc(AppleSPUHIDDeviceClass *this, const __CFAllocator *a2)
{
  AppleSPUHIDDeviceClass *v3;

  v3 = (AppleSPUHIDDeviceClass *)CFAllocatorAllocate(this, 160, 0);
  AppleSPUHIDDeviceClass::AppleSPUHIDDeviceClass(v3, this);
}

void AppleSPUHIDDeviceClass::operator delete(CFAllocatorRef *ptr)
{
  CFAllocatorDeallocate(ptr[1], ptr);
}

void sub_2310CC29C(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void AppleSPUHIDDeviceClass::AppleSPUHIDDeviceClass(AppleSPUHIDDeviceClass *this, const __CFAllocator *a2)
{
  const __CFUUID *v3;

  *(_QWORD *)this = &AppleSPUHIDDeviceClass::vtbl;
  *((_QWORD *)this + 1) = a2;
  *((_QWORD *)this + 2) = 1;
  *((_DWORD *)this + 6) = 0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *(_OWORD *)((char *)this + 92) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  v3 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x44u, 0xF6u, 0xB5u, 0x35u, 0xC0u, 0x83u, 0x49u, 0xEFu, 0xBFu, 0xF0u, 0x13u, 0x86u, 0x53u, 0xA2u, 0x17u, 0x86u);
  CFPlugInAddInstanceForFactory(v3);
  *((_QWORD *)this + 19) = os_log_create("AOP", "AppleSPUHIDDeviceClass");
}

void AppleSPUHIDDeviceClass::~AppleSPUHIDDeviceClass(void **this)
{
  const __CFUUID *v2;

  v2 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x44u, 0xF6u, 0xB5u, 0x35u, 0xC0u, 0x83u, 0x49u, 0xEFu, 0xBFu, 0xF0u, 0x13u, 0x86u, 0x53u, 0xA2u, 0x17u, 0x86u);
  CFPlugInRemoveInstanceForFactory(v2);
  os_release(this[19]);
}

uint64_t AppleSPUHIDDeviceClass::QueryInterface(AppleSPUHIDDeviceClass *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5;
  const __CFAllocator *v6;
  CFUUIDRef v7;
  CFUUIDRef v8;
  CFUUIDRef v9;
  uint64_t v10;

  v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 1u, 0x64u, 0x69u, 0xD8u, 0x77u, 0x3Bu, 0x46u, 0xACu, 0x90u, 0x9Eu, 0xF9u, 0xCu, 0x4Au, 0x6Eu, 0x75u, 0x77u);
  if (CFEqual(v5, v7)
    || (v8 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v5, v8))|| (v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v5, v9)))
  {
    v10 = 0;
    ++*((_DWORD *)this + 4);
  }
  else
  {
    this = 0;
    v10 = 2147483652;
  }
  *a3 = this;
  CFRelease(v5);
  return v10;
}

uint64_t AppleSPUHIDDeviceClass::AddRef(AppleSPUHIDDeviceClass *this)
{
  uint64_t v1;

  v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t AppleSPUHIDDeviceClass::Release(AppleSPUHIDDeviceClass *this)
{
  int v1;
  uint64_t v2;
  CFAllocatorRef *v3;

  v1 = *((_DWORD *)this + 4);
  v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    AppleSPUHIDDeviceClass::~AppleSPUHIDDeviceClass((void **)this);
    AppleSPUHIDDeviceClass::operator delete(v3);
  }
  return v2;
}

uint64_t AppleSPUHIDDeviceClass::Probe(AppleSPUHIDDeviceClass *this, const __CFDictionary *a2, unsigned int a3, int *a4)
{
  return 0;
}

uint64_t AppleSPUHIDDeviceClass::Start(AppleSPUHIDDeviceClass *this, const __CFDictionary *a2, io_service_t service)
{
  uint64_t v4;
  NSObject *v6;
  char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  *((_DWORD *)this + 5) = service;
  v4 = IOServiceOpen(service, *MEMORY[0x24BDAEC58], 0x61736864u, (io_connect_t *)this + 6);
  if ((_DWORD)v4)
  {
    v6 = *((_QWORD *)this + 19);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v4))
        v7 = mach_error_string(v4);
      else
        v7 = "";
      v8 = 136316418;
      v9 = "";
      v10 = 2080;
      v11 = "result == 0 ";
      v12 = 2080;
      v13 = v7;
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v16 = 1024;
      v17 = 483;
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_2310CA000, v6, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v8, 0x36u);
    }
  }
  return v4;
}

uint64_t AppleSPUHIDDeviceClass::Stop(AppleSPUHIDDeviceClass *this)
{
  io_connect_t v2;

  v2 = *((_DWORD *)this + 6);
  if (v2)
  {
    IOServiceClose(v2);
    *((_DWORD *)this + 6) = 0;
  }
  *((_DWORD *)this + 5) = 0;
  return 0;
}

uint64_t AppleSPUHIDDeviceClass::Open(AppleSPUHIDDeviceClass *this)
{
  uint64_t v2;
  NSObject *v4;
  char *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = IOConnectCallMethod(*((_DWORD *)this + 6), 4u, 0, 0, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)v2)
  {
    v4 = *((_QWORD *)this + 19);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v2))
        v5 = mach_error_string(v2);
      else
        v5 = "";
      *(_DWORD *)buf = 136316418;
      v7 = "";
      v8 = 2080;
      v9 = "result == 0 ";
      v10 = 2080;
      v11 = v5;
      v12 = 2080;
      v13 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v14 = 1024;
      v15 = 510;
      v16 = 1024;
      v17 = v2;
      _os_log_impl(&dword_2310CA000, v4, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
  }
  return v2;
}

uint64_t AppleSPUHIDDeviceClass::Close(AppleSPUHIDDeviceClass *this)
{
  uint64_t v2;
  NSObject *v4;
  char *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = IOConnectCallMethod(*((_DWORD *)this + 6), 5u, 0, 0, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)v2)
  {
    v4 = *((_QWORD *)this + 19);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v2))
        v5 = mach_error_string(v2);
      else
        v5 = "";
      *(_DWORD *)buf = 136316418;
      v7 = "";
      v8 = 2080;
      v9 = "result == 0 ";
      v10 = 2080;
      v11 = v5;
      v12 = 2080;
      v13 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v14 = 1024;
      v15 = 523;
      v16 = 1024;
      v17 = v2;
      _os_log_impl(&dword_2310CA000, v4, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
  }
  return v2;
}

uint64_t AppleSPUHIDDeviceClass::Reset(AppleSPUHIDDeviceClass *this)
{
  uint64_t v2;
  NSObject *v4;
  char *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = IOConnectCallScalarMethod(*((_DWORD *)this + 6), 0, 0, 0, 0, 0);
  if ((_DWORD)v2)
  {
    v4 = *((_QWORD *)this + 19);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v2))
        v5 = mach_error_string(v2);
      else
        v5 = "";
      v6 = 136316418;
      v7 = "";
      v8 = 2080;
      v9 = "result == 0 ";
      v10 = 2080;
      v11 = v5;
      v12 = 2080;
      v13 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v14 = 1024;
      v15 = 536;
      v16 = 1024;
      v17 = v2;
      _os_log_impl(&dword_2310CA000, v4, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v6, 0x36u);
    }
  }
  return v2;
}

uint64_t AppleSPUHIDDeviceClass::SetLVBoost(AppleSPUHIDDeviceClass *this, unsigned int a2)
{
  uint64_t v3;
  NSObject *v5;
  char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  v3 = IOConnectCallScalarMethod(*((_DWORD *)this + 6), 2u, input, 1u, 0, 0);
  if ((_DWORD)v3)
  {
    v5 = *((_QWORD *)this + 19);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v3))
        v6 = mach_error_string(v3);
      else
        v6 = "";
      v7 = 136316418;
      v8 = "";
      v9 = 2080;
      v10 = "result == 0 ";
      v11 = 2080;
      v12 = v6;
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v15 = 1024;
      v16 = 551;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_2310CA000, v5, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v7, 0x36u);
    }
  }
  return v3;
}

uint64_t AppleSPUHIDDeviceClass::SetGrapeCS(AppleSPUHIDDeviceClass *this, unsigned int a2)
{
  uint64_t v3;
  NSObject *v5;
  char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  v3 = IOConnectCallScalarMethod(*((_DWORD *)this + 6), 3u, input, 1u, 0, 0);
  if ((_DWORD)v3)
  {
    v5 = *((_QWORD *)this + 19);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v3))
        v6 = mach_error_string(v3);
      else
        v6 = "";
      v7 = 136316418;
      v8 = "";
      v9 = 2080;
      v10 = "result == 0 ";
      v11 = 2080;
      v12 = v6;
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v15 = 1024;
      v16 = 566;
      v17 = 1024;
      v18 = v3;
      _os_log_impl(&dword_2310CA000, v5, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v7, 0x36u);
    }
  }
  return v3;
}

uint64_t AppleSPUHIDDeviceClass::SetAggregateDictionaryCallback(AppleSPUHIDDeviceClass *this, void (*a2)(void *, void *, unint64_t), void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v15 = 0;
  v6 = MEMORY[0x2348D05E4](*((unsigned int *)this + 6), 1, *((unsigned int *)this + 26), 0);
  if ((_DWORD)v6)
  {
    v9 = v6;
    v11 = *((_QWORD *)this + 19);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      return v9;
    if (mach_error_string(v9))
      v12 = mach_error_string(v9);
    else
      v12 = "";
    *(_DWORD *)buf = 136316418;
    v17 = "";
    v18 = 2080;
    v19 = "result == 0 ";
    v20 = 2080;
    v21 = v12;
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    v24 = 1024;
    v25 = 583;
    v26 = 1024;
    v27 = v9;
LABEL_17:
    _os_log_impl(&dword_2310CA000, v11, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    return v9;
  }
  v7 = MEMORY[0x2348D05D8](*((unsigned int *)this + 6), 1, *MEMORY[0x24BDAEC58], &v15, &v14, 1);
  if ((_DWORD)v7)
  {
    v9 = v7;
    v11 = *((_QWORD *)this + 19);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      return v9;
    if (mach_error_string(v9))
      v13 = mach_error_string(v9);
    else
      v13 = "";
    *(_DWORD *)buf = 136316418;
    v17 = "";
    v18 = 2080;
    v19 = "result == 0 ";
    v20 = 2080;
    v21 = v13;
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    v24 = 1024;
    v25 = 587;
    v26 = 1024;
    v27 = v9;
    goto LABEL_17;
  }
  v8 = v14;
  *((_QWORD *)this + 14) = v15;
  *((_QWORD *)this + 15) = v8;
  if (!*((_QWORD *)this + 18))
    sub_2310CF674();
  v9 = 0;
  *((_QWORD *)this + 16) = a2;
  *((_QWORD *)this + 17) = a3;
  return v9;
}

uint64_t AppleSPUHIDDeviceClass::ScheduleWithDispatchQueue(AppleSPUHIDDeviceClass *this, dispatch_queue_t queue)
{
  mach_port_t NotificationPort;
  NSObject *v5;
  uint64_t v6;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  NotificationPort = *((_DWORD *)this + 26);
  if (!NotificationPort)
  {
    NotificationPort = IODataQueueAllocateNotificationPort();
    *((_DWORD *)this + 26) = NotificationPort;
  }
  v5 = dispatch_source_create(MEMORY[0x24BDAC9E0], NotificationPort, 0, queue);
  *((_QWORD *)this + 18) = v5;
  if (v5)
  {
    dispatch_set_context(v5, this);
    dispatch_source_set_event_handler_f(*((dispatch_source_t *)this + 18), (dispatch_function_t)AppleSPUHIDDeviceClass::queueSignal);
    dispatch_resume(*((dispatch_object_t *)this + 18));
    return 0;
  }
  else
  {
    v6 = 3758097086;
    v8 = *((_QWORD *)this + 19);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136316418;
      v10 = "";
      v11 = 2080;
      v12 = "_source";
      v13 = 2080;
      v14 = "";
      v15 = 2080;
      v16 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v17 = 1024;
      v18 = 616;
      v19 = 1024;
      v20 = 0;
      _os_log_impl(&dword_2310CA000, v8, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v9, 0x36u);
    }
  }
  return v6;
}

void AppleSPUHIDDeviceClass::queueSignal(AppleSPUHIDDeviceClass *this, void *a2)
{
  AppleSPUHIDDeviceClass::queueSignal(this, 1);
}

uint64_t AppleSPUHIDDeviceClass::UnscheduleFromDispatchQueue(AppleSPUHIDDeviceClass *this, dispatch_queue_s *a2)
{
  return 0;
}

uint64_t AppleSPUHIDDeviceClass::SendCommand(AppleSPUHIDDeviceClass *this, unsigned int a2, const void *inputStruct, size_t inputStructCnt, void *outputStruct, unint64_t *a6)
{
  uint64_t v7;
  NSObject *v9;
  char *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  v7 = IOConnectCallMethod(*((_DWORD *)this + 6), 6u, input, 1u, inputStruct, inputStructCnt, 0, 0, outputStruct, a6);
  if ((_DWORD)v7)
  {
    v9 = *((_QWORD *)this + 19);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v7))
        v10 = mach_error_string(v7);
      else
        v10 = "";
      *(_DWORD *)buf = 136316418;
      v12 = "";
      v13 = 2080;
      v14 = "result == 0 ";
      v15 = 2080;
      v16 = v10;
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v19 = 1024;
      v20 = 655;
      v21 = 1024;
      v22 = v7;
      _os_log_impl(&dword_2310CA000, v9, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
  }
  return v7;
}

void AppleSPUHIDDeviceClass::queueSignal(AppleSPUHIDDeviceClass *this, int a2)
{
  IODataQueueMemory *v3;
  IOReturn v4;
  IODataQueueMemory *v5;
  IOReturn v6;
  void (*v7)(_QWORD, _QWORD);
  mach_error_t v8;
  NSObject *v9;
  char *v10;
  uint32_t dataSize;
  _BYTE data[7];
  uint32_t v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  mach_error_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (a2)
    IODataQueueWaitForAvailableData(*((IODataQueueMemory **)this + 14), *((_DWORD *)this + 26));
  v3 = (IODataQueueMemory *)*((_QWORD *)this + 14);
  if (v3)
  {
    dataSize = 7;
    while (IODataQueueDataAvailable(v3))
    {
      v4 = IODataQueueDequeue(*((IODataQueueMemory **)this + 14), data, &dataSize);
      if (v4)
      {
        v8 = v4;
        v9 = *((_QWORD *)this + 19);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          if (mach_error_string(v8))
            v10 = mach_error_string(v8);
          else
            v10 = "";
          v13 = 136316418;
          v14 = "";
          v15 = 2080;
          v16 = "result == 0 ";
          v17 = 2080;
          v18 = v10;
          v19 = 2080;
          v20 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
          v21 = 1024;
          v22 = 693;
          v23 = 1024;
          v24 = v8;
          _os_log_impl(&dword_2310CA000, v9, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v13, 0x36u);
        }
        return;
      }
      (*((void (**)(_QWORD, _BYTE *, uint64_t))this + 16))(*((_QWORD *)this + 17), data, 1);
      v3 = (IODataQueueMemory *)*((_QWORD *)this + 14);
    }
  }
  v5 = (IODataQueueMemory *)*((_QWORD *)this + 9);
  if (v5 && IODataQueueDataAvailable(v5))
  {
    do
    {
      v13 = *((_DWORD *)this + 12);
      v6 = IODataQueueDequeue(*((IODataQueueMemory **)this + 9), *((void **)this + 7), &v13);
      if (v6)
      {
        if (v6 == -536870181)
          IODataQueueDequeue(*((IODataQueueMemory **)this + 9), 0, 0);
      }
      else
      {
        v7 = (void (*)(_QWORD, _QWORD))*((_QWORD *)this + 11);
        if (v7)
          v7(*((_QWORD *)this + 7), v13);
      }
    }
    while (IODataQueueDataAvailable(*((IODataQueueMemory **)this + 9)));
  }
}

void AppleSPUHIDDeviceClass::queueSignal(AppleSPUHIDDeviceClass *this, __CFMachPort *a2, void *a3, AppleSPUHIDDeviceClass *a4, void *a5)
{
  AppleSPUHIDDeviceClass::queueSignal(a4, 0);
}

uint64_t AppleSPUHIDDeviceClass::ScheduleWithRunLoop(AppleSPUHIDDeviceClass *this, __CFRunLoop *a2, const __CFString *a3)
{
  uint64_t NotificationPort;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const __CFAllocator *v11;
  __CFMachPort *v12;
  __CFRunLoopSource *RunLoopSource;
  uint64_t v14;
  NSObject *v16;
  char *v17;
  char *v18;
  NSObject *v19;
  Boolean shouldFreeInfo;
  CFMachPortContext context;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  v23 = 0;
  shouldFreeInfo = 0;
  NotificationPort = *((unsigned int *)this + 26);
  if (!(_DWORD)NotificationPort)
  {
    NotificationPort = IODataQueueAllocateNotificationPort();
    *((_DWORD *)this + 26) = NotificationPort;
    if (!(_DWORD)NotificationPort)
    {
      v14 = 3758097086;
      v16 = *((_QWORD *)this + 19);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        return v14;
      *(_DWORD *)buf = 136316418;
      v25 = "";
      v26 = 2080;
      v27 = "_port";
      v28 = 2080;
      v29 = "";
      v30 = 2080;
      v31 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v32 = 1024;
      v33 = 739;
      v34 = 1024;
      v35 = 0;
      goto LABEL_26;
    }
  }
  v7 = MEMORY[0x2348D05E4](*((unsigned int *)this + 6), 0, NotificationPort, 0);
  if ((_DWORD)v7)
  {
    v14 = v7;
    v16 = *((_QWORD *)this + 19);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      return v14;
    if (mach_error_string(v14))
      v17 = mach_error_string(v14);
    else
      v17 = "";
    *(_DWORD *)buf = 136316418;
    v25 = "";
    v26 = 2080;
    v27 = "result == 0 ";
    v28 = 2080;
    v29 = v17;
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    v32 = 1024;
    v33 = 743;
    v34 = 1024;
    v35 = v14;
LABEL_26:
    _os_log_impl(&dword_2310CA000, v16, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    return v14;
  }
  v8 = MEMORY[0x2348D05D8](*((unsigned int *)this + 6), 0, *MEMORY[0x24BDAEC58], &v23, &v22, 1);
  if ((_DWORD)v8)
  {
    v14 = v8;
    v16 = *((_QWORD *)this + 19);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      return v14;
    if (mach_error_string(v14))
      v18 = mach_error_string(v14);
    else
      v18 = "";
    *(_DWORD *)buf = 136316418;
    v25 = "";
    v26 = 2080;
    v27 = "result == 0 ";
    v28 = 2080;
    v29 = v18;
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    v32 = 1024;
    v33 = 747;
    v34 = 1024;
    v35 = v14;
    goto LABEL_26;
  }
  *((_DWORD *)this + 12) = 4096;
  v9 = malloc_type_malloc(0x1000uLL, 0x1804928DuLL);
  *((_QWORD *)this + 7) = v9;
  if (!v9)
  {
    v19 = *((_QWORD *)this + 19);
    v14 = 0;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      return v14;
    *(_DWORD *)buf = 136316418;
    v25 = "";
    v26 = 2080;
    v27 = "_spiDataContext.buffer";
    v28 = 2080;
    v29 = "";
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    v32 = 1024;
    v33 = 752;
    v34 = 1024;
    v35 = 0;
    _os_log_impl(&dword_2310CA000, v19, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    return 0;
  }
  *((_DWORD *)this + 16) = *((_DWORD *)this + 6);
  v10 = v22;
  *((_QWORD *)this + 9) = v23;
  *((_QWORD *)this + 10) = v10;
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = this;
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v12 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x24BDBD240], *((_DWORD *)this + 26), (CFMachPortCallBack)AppleSPUHIDDeviceClass::queueSignal, &context, &shouldFreeInfo);
  *((_QWORD *)this + 5) = v12;
  if (!v12)
  {
    v14 = 3758097086;
    v16 = *((_QWORD *)this + 19);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      return v14;
    *(_DWORD *)buf = 136316418;
    v25 = "";
    v26 = 2080;
    v27 = "_spiDataContext.port";
    v28 = 2080;
    v29 = "";
    v30 = 2080;
    v31 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    v32 = 1024;
    v33 = 763;
    v34 = 1024;
    v35 = 0;
    goto LABEL_26;
  }
  RunLoopSource = CFMachPortCreateRunLoopSource(v11, v12, 0);
  *((_QWORD *)this + 4) = RunLoopSource;
  CFRunLoopAddSource(a2, RunLoopSource, a3);
  return 0;
}

uint64_t AppleSPUHIDDeviceClass::UnscheduleWithRunLoop(AppleSPUHIDDeviceClass *this, CFRunLoopRef rl, const __CFString *a3)
{
  __CFRunLoopSource *v4;
  __CFMachPort *v5;
  void *v6;
  mach_port_name_t v7;
  unsigned int *v8;

  v4 = (__CFRunLoopSource *)*((_QWORD *)this + 4);
  if (v4)
  {
    CFRunLoopRemoveSource(rl, v4, a3);
    CFRelease(*((CFTypeRef *)this + 4));
  }
  v5 = (__CFMachPort *)*((_QWORD *)this + 5);
  if (v5)
  {
    CFMachPortInvalidate(v5);
    CFRelease(*((CFTypeRef *)this + 5));
  }
  v6 = (void *)*((_QWORD *)this + 7);
  if (v6)
    free(v6);
  v7 = *((_DWORD *)this + 26);
  v8 = (unsigned int *)MEMORY[0x24BDAEC58];
  if (v7)
    mach_port_mod_refs(*MEMORY[0x24BDAEC58], v7, 1u, -1);
  MEMORY[0x2348D05F0](*((unsigned int *)this + 6), 0, *v8, *((_QWORD *)this + 9));
  return 0;
}

uint64_t AppleSPUHIDDeviceClass::SetRawSPIMode(AppleSPUHIDDeviceClass *this, unsigned int a2)
{
  _BOOL8 inputStruct;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  inputStruct = a2 != 0;
  return IOConnectCallMethod(*((_DWORD *)this + 6), 1u, input, 1u, &inputStruct, 1uLL, 0, 0, 0, 0);
}

uint64_t AppleSPUHIDDeviceClass::SetRawSPICallback(AppleSPUHIDDeviceClass *this, void (*a2)(void *, unsigned int), void *a3)
{
  *((_QWORD *)this + 11) = a2;
  *((_QWORD *)this + 12) = a3;
  return 0;
}

uint64_t sub_2310CD964(uint64_t a1, CFUUIDBytes a2, void **a3)
{
  return AppleSPUHIDDriverClass::QueryInterface(*(AppleSPUHIDDriverClass **)(a1 + 8), a2, a3);
}

uint64_t sub_2310CD96C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 8);
  result = (*(_DWORD *)(v1 + 40) + 1);
  *(_DWORD *)(v1 + 40) = result;
  return result;
}

uint64_t sub_2310CD980(uint64_t a1)
{
  return AppleSPUHIDDriverClass::Release(*(AppleSPUHIDDriverClass **)(a1 + 8));
}

uint64_t sub_2310CD988()
{
  return 0;
}

uint64_t sub_2310CD990(uint64_t a1, const __CFDictionary *a2, io_service_t a3)
{
  return AppleSPUHIDDriverClass::Start(*(AppleSPUHIDDriverClass **)(a1 + 8), a2, a3);
}

uint64_t sub_2310CD998(uint64_t a1)
{
  uint64_t v1;
  io_connect_t v2;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_DWORD *)(v1 + 48);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(v1 + 48) = 0;
  }
  *(_DWORD *)(v1 + 44) = 0;
  return 0;
}

uint64_t sub_2310CD9CC(uint64_t a1, char a2)
{
  return AppleSPUHIDDriverClass::Open(*(AppleSPUHIDDriverClass **)(a1 + 8), a2);
}

uint64_t sub_2310CD9D4(uint64_t a1)
{
  return AppleSPUHIDDriverClass::Close(*(AppleSPUHIDDriverClass **)(a1 + 8));
}

uint64_t sub_2310CD9DC(uint64_t a1, void *inputStruct, size_t inputStructCnt, void *outputStruct, unint64_t *a5)
{
  return AppleSPUHIDDriverClass::SendCommand(*(AppleSPUHIDDriverClass **)(a1 + 8), 0x20u, inputStruct, inputStructCnt, outputStruct, a5);
}

uint64_t sub_2310CD9F8(uint64_t a1, const __CFArray **a2)
{
  return AppleSPUHIDDriverClass::CopyEventMultiple(*(AppleSPUHIDDriverClass **)(a1 + 8), a2);
}

uint64_t sub_2310CDA00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AppleSPUHIDDriverClass::ApplyToHistorical(*(_QWORD *)(a1 + 8), a2, a3);
}

uint64_t sub_2310CDA08(uint64_t a1, uint64_t a2, unint64_t *a3, unsigned int *a4)
{
  return AppleSPUHIDDriverClass::AopTimeToCalendar(*(AppleSPUHIDDriverClass **)(a1 + 8), a2, a3, a4);
}

uint64_t sub_2310CDA10(uint64_t a1, unsigned int a2, const void *a3, size_t a4, void *a5, unint64_t *a6)
{
  return AppleSPUHIDDriverClass::SendCommand(*(AppleSPUHIDDriverClass **)(a1 + 8), a2, a3, a4, a5, a6);
}

void AppleSPUHIDDriverClass::alloc(AppleSPUHIDDriverClass *this, const __CFAllocator *a2)
{
  AppleSPUHIDDriverClass *v3;

  v3 = (AppleSPUHIDDriverClass *)CFAllocatorAllocate(this, 80, 0);
  AppleSPUHIDDriverClass::AppleSPUHIDDriverClass(v3, this);
}

void AppleSPUHIDDriverClass::operator delete(CFAllocatorRef *ptr)
{
  CFAllocatorDeallocate(ptr[4], ptr);
}

void AppleSPUHIDDriverClass::AppleSPUHIDDriverClass(AppleSPUHIDDriverClass *this, const __CFAllocator *a2)
{
  const __CFUUID *v3;

  *(_QWORD *)this = &AppleSPUHIDDriverClass::vtbl_v1;
  *((_QWORD *)this + 1) = this;
  *((_QWORD *)this + 2) = &AppleSPUHIDDriverClass::vtbl_v2;
  *((_QWORD *)this + 3) = this;
  *((_QWORD *)this + 4) = a2;
  *((_QWORD *)this + 5) = 1;
  *((_DWORD *)this + 12) = 0;
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_QWORD *)this + 7) = 0;
  v3 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x44u, 0xF6u, 0xB5u, 0x35u, 0xC0u, 0x83u, 0x49u, 0xEFu, 0xBFu, 0xF0u, 0x13u, 0x86u, 0x53u, 0xA2u, 0x17u, 0x86u);
  CFPlugInAddInstanceForFactory(v3);
  *((_QWORD *)this + 7) = os_log_create("AOP", "AppleSPUHIDDeviceClass");
}

void AppleSPUHIDDriverClass::~AppleSPUHIDDriverClass(void **this)
{
  const __CFUUID *v2;

  v2 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x44u, 0xF6u, 0xB5u, 0x35u, 0xC0u, 0x83u, 0x49u, 0xEFu, 0xBFu, 0xF0u, 0x13u, 0x86u, 0x53u, 0xA2u, 0x17u, 0x86u);
  CFPlugInRemoveInstanceForFactory(v2);
  os_release(this[7]);
}

uint64_t AppleSPUHIDDriverClass::QueryInterface(AppleSPUHIDDriverClass *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5;
  const __CFAllocator *v6;
  CFUUIDRef v7;
  uint64_t v8;
  CFUUIDRef v9;
  CFUUIDRef v10;
  CFUUIDRef v11;

  v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x6Eu, 0xBEu, 0xBAu, 0x6Eu, 9u, 0x1Eu, 0x45u, 0x2Eu, 0x82u, 0xEAu, 0x29u, 0x79u, 0x81u, 0x6Fu, 0xB1u, 0xB5u);
  if (CFEqual(v5, v7))
  {
    v8 = 0;
    ++*((_DWORD *)this + 10);
  }
  else
  {
    v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0x59u, 0x79u, 0x99u, 0x3Cu, 0x85u, 0xF5u, 0x4Du, 0x59u, 0x85u, 0x93u, 0xFFu, 0x92u, 0x15u, 0xDAu, 0x47u, 0xADu);
    if (CFEqual(v5, v9)
      || (v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v5, v10))|| (v11 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u),
          CFEqual(v5, v11)))
    {
      v8 = 0;
      ++*((_DWORD *)this + 10);
      this = (AppleSPUHIDDriverClass *)((char *)this + 16);
    }
    else
    {
      this = 0;
      v8 = 2147483652;
    }
  }
  *a3 = this;
  CFRelease(v5);
  return v8;
}

uint64_t AppleSPUHIDDriverClass::AddRef(AppleSPUHIDDriverClass *this)
{
  uint64_t v1;

  v1 = (*((_DWORD *)this + 10) + 1);
  *((_DWORD *)this + 10) = v1;
  return v1;
}

uint64_t AppleSPUHIDDriverClass::Release(AppleSPUHIDDriverClass *this)
{
  int v1;
  uint64_t v2;
  CFAllocatorRef *v3;

  v1 = *((_DWORD *)this + 10);
  v2 = (v1 - 1);
  *((_DWORD *)this + 10) = v2;
  if (v1 == 1)
  {
    AppleSPUHIDDriverClass::~AppleSPUHIDDriverClass((void **)this);
    AppleSPUHIDDriverClass::operator delete(v3);
  }
  return v2;
}

uint64_t AppleSPUHIDDriverClass::Probe(AppleSPUHIDDriverClass *this, const __CFDictionary *a2, unsigned int a3, int *a4)
{
  return 0;
}

uint64_t AppleSPUHIDDriverClass::Start(AppleSPUHIDDriverClass *this, const __CFDictionary *a2, io_service_t service)
{
  uint64_t v4;
  NSObject *v6;
  char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  *((_DWORD *)this + 11) = service;
  v4 = IOServiceOpen(service, *MEMORY[0x24BDAEC58], 0x61736864u, (io_connect_t *)this + 12);
  if ((_DWORD)v4)
  {
    v6 = *((_QWORD *)this + 7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v4))
        v7 = mach_error_string(v4);
      else
        v7 = "";
      v8 = 136316418;
      v9 = "";
      v10 = 2080;
      v11 = "result == 0 ";
      v12 = 2080;
      v13 = v7;
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v16 = 1024;
      v17 = 1138;
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_2310CA000, v6, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v8, 0x36u);
    }
  }
  return v4;
}

uint64_t AppleSPUHIDDriverClass::Stop(AppleSPUHIDDriverClass *this)
{
  io_connect_t v2;

  v2 = *((_DWORD *)this + 12);
  if (v2)
  {
    IOServiceClose(v2);
    *((_DWORD *)this + 12) = 0;
  }
  *((_DWORD *)this + 11) = 0;
  return 0;
}

uint64_t AppleSPUHIDDriverClass::Open(AppleSPUHIDDriverClass *this, char a2)
{
  uint64_t v4;
  NSObject *v6;
  char *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = IOConnectCallMethod(*((_DWORD *)this + 12), 3u, 0, 0, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)v4)
  {
    v6 = *((_QWORD *)this + 7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v4))
        v7 = mach_error_string(v4);
      else
        v7 = "";
      *(_DWORD *)buf = 136316418;
      v9 = "";
      v10 = 2080;
      v11 = "result == 0 ";
      v12 = 2080;
      v13 = v7;
      v14 = 2080;
      v15 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v16 = 1024;
      v17 = 1165;
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_2310CA000, v6, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
    if (*((_QWORD *)this + 8))
      MEMORY[0x2348D05F0](*((unsigned int *)this + 12), 0, *MEMORY[0x24BDAEC58]);
  }
  else if ((a2 & 1) != 0
         && MEMORY[0x2348D05D8](*((unsigned int *)this + 12), 0, *MEMORY[0x24BDAEC58], (char *)this + 64, (char *)this + 72, 1))
  {
    *((_QWORD *)this + 8) = 0;
    *((_QWORD *)this + 9) = 0;
  }
  return v4;
}

uint64_t AppleSPUHIDDriverClass::Close(AppleSPUHIDDriverClass *this)
{
  uint64_t v2;
  NSObject *v4;
  char *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (*((_QWORD *)this + 8))
    MEMORY[0x2348D05F0](*((unsigned int *)this + 12), 0, *MEMORY[0x24BDAEC58]);
  v2 = IOConnectCallMethod(*((_DWORD *)this + 12), 4u, 0, 0, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)v2)
  {
    v4 = *((_QWORD *)this + 7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v2))
        v5 = mach_error_string(v2);
      else
        v5 = "";
      *(_DWORD *)buf = 136316418;
      v7 = "";
      v8 = 2080;
      v9 = "result == 0 ";
      v10 = 2080;
      v11 = v5;
      v12 = 2080;
      v13 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v14 = 1024;
      v15 = 1200;
      v16 = 1024;
      v17 = v2;
      _os_log_impl(&dword_2310CA000, v4, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
  }
  return v2;
}

uint64_t AppleSPUHIDDriverClass::CopyEventMultiple(AppleSPUHIDDriverClass *this, const __CFArray **a2)
{
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v5;
  uint64_t v6;
  NSObject *v8;
  NSObject *v9;
  char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!*((_DWORD *)this + 11))
  {
    v6 = 3758097112;
    v8 = *((_QWORD *)this + 7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      return v6;
    v11 = 136316418;
    v12 = "";
    v13 = 2080;
    v14 = "_service";
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    v19 = 1024;
    v20 = 1228;
    v21 = 1024;
    v22 = 0;
LABEL_13:
    _os_log_impl(&dword_2310CA000, v8, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v11, 0x36u);
    return v6;
  }
  if (!*((_DWORD *)this + 12))
  {
    v6 = 3758097112;
    v8 = *((_QWORD *)this + 7);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      return v6;
    v11 = 136316418;
    v12 = "";
    v13 = 2080;
    v14 = "_connect";
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    v19 = 1024;
    v20 = 1229;
    v21 = 1024;
    v22 = 0;
    goto LABEL_13;
  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (!Mutable)
  {
    v8 = *((_QWORD *)this + 7);
    v6 = 3758097085;
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      return v6;
    v11 = 136316418;
    v12 = "";
    v13 = 2080;
    v14 = "events";
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    v19 = 1024;
    v20 = 1232;
    v21 = 1024;
    v22 = 0;
    goto LABEL_13;
  }
  v5 = Mutable;
  v6 = AppleSPUHIDDriverClass::ApplyToHistorical((uint64_t)this, MEMORY[0x24BDBB7C8], (uint64_t)Mutable);
  if ((_DWORD)v6)
  {
    v9 = *((_QWORD *)this + 7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (mach_error_string(v6))
        v10 = mach_error_string(v6);
      else
        v10 = "";
      v11 = 136316418;
      v12 = "";
      v13 = 2080;
      v14 = "result == 0 ";
      v15 = 2080;
      v16 = v10;
      v17 = 2080;
      v18 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v19 = 1024;
      v20 = 1237;
      v21 = 1024;
      v22 = v6;
      _os_log_impl(&dword_2310CA000, v9, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", (uint8_t *)&v11, 0x36u);
    }
    CFRelease(v5);
  }
  else
  {
    *a2 = v5;
  }
  return v6;
}

uint64_t AppleSPUHIDDriverClass::ApplyToHistorical(uint64_t a1, uint64_t a2, uint64_t a3)
{
  mach_port_t v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  const __CFAllocator *v7;
  const __CFDictionary *CFProperty;
  const __CFDictionary *v9;
  const __CFNumber *Value;
  const __CFNumber *v11;
  uint64_t v12;
  const __CFDictionary *v13;
  io_service_t v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  char *v26;
  NSObject *v27;
  NSObject *v28;
  char *v29;
  unint64_t v30;
  _QWORD v31[2];
  mach_timebase_info v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int valuePtr;
  uint64_t input;
  _BYTE buf[12];
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  _BYTE v48[6];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  v31[0] = a2;
  v31[1] = a3;
  v32 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  if (!*(_DWORD *)(a1 + 44))
  {
    v23 = *(NSObject **)(a1 + 56);
    v20 = 3758097112;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = "";
    v39 = 2080;
    v40 = "_service";
    v41 = 2080;
    v42 = "";
    v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    v45 = 1024;
    v46 = 1356;
    v47 = 1024;
    *(_DWORD *)v48 = 0;
    goto LABEL_33;
  }
  if (!*(_DWORD *)(a1 + 48))
  {
    v23 = *(NSObject **)(a1 + 56);
    v20 = 3758097112;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = "";
    v39 = 2080;
    v40 = "_connect";
    v41 = 2080;
    v42 = "";
    v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    v45 = 1024;
    v46 = 1357;
    v47 = 1024;
    *(_DWORD *)v48 = 0;
    goto LABEL_33;
  }
  if (!*(_QWORD *)(a1 + 64))
  {
    v23 = *(NSObject **)(a1 + 56);
    v20 = 3758097095;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = "";
    v39 = 2080;
    v40 = "_historical_addr";
    v41 = 2080;
    v42 = "";
    v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    v45 = 1024;
    v46 = 1358;
    v47 = 1024;
    *(_DWORD *)v48 = 0;
    goto LABEL_33;
  }
  if (!*(_QWORD *)(a1 + 72))
  {
    v23 = *(NSObject **)(a1 + 56);
    v20 = 3758097095;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    *(_DWORD *)buf = 136316418;
    *(_QWORD *)&buf[4] = "";
    v39 = 2080;
    v40 = "_historical_size";
    v41 = 2080;
    v42 = "";
    v43 = 2080;
    v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
    v45 = 1024;
    v46 = 1359;
    v47 = 1024;
    *(_DWORD *)v48 = 0;
LABEL_33:
    _os_log_impl(&dword_2310CA000, v23, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
LABEL_22:
    v21 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v20;
      _os_log_impl(&dword_2310CA000, v21, OS_LOG_TYPE_DEFAULT, "AppleSPUHIDDriverClass::ApplyToHistorical -> %x", buf, 8u);
    }
    return v20;
  }
  v4 = *MEMORY[0x24BDD8B20];
  v5 = IOServiceMatching("AppleSPUTimesync");
  MatchingService = IOServiceGetMatchingService(v4, v5);
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("timesync"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v9 = CFProperty;
    Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, CFSTR("spu"));
    CFNumberGetValue(Value, kCFNumberLongLongType, &v34);
    v11 = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("ap"));
    CFNumberGetValue(v11, kCFNumberLongLongType, &v33);
    v12 = mach_timebase_info(&v32);
    if ((_DWORD)v12)
    {
      v20 = v12;
      v25 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if (mach_error_string(v20))
          v26 = mach_error_string(v20);
        else
          v26 = "";
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "";
        v39 = 2080;
        v40 = "result == 0 ";
        v41 = 2080;
        v42 = v26;
        v43 = 2080;
        v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
        v45 = 1024;
        v46 = 1369;
        v47 = 1024;
        *(_DWORD *)v48 = v20;
        _os_log_impl(&dword_2310CA000, v25, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
      }
      v16 = 0;
      v14 = 0;
    }
    else
    {
      v13 = IOServiceMatching("AppleSPU");
      v14 = IOServiceGetMatchingService(v4, v13);
      v15 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v14, CFSTR("slaveAlignment"), v7, 0);
      if (v15)
      {
        v16 = v15;
        CFNumberGetValue(v15, kCFNumberIntType, &valuePtr);
        v17 = valuePtr;
        if (!valuePtr)
          v17 = 64;
        valuePtr = v17;
        v18 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 48), 1u, 0, 0, 0, 0);
        if ((_DWORD)v18)
        {
          v20 = v18;
          v28 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            if (mach_error_string(v20))
              v29 = mach_error_string(v20);
            else
              v29 = "";
            *(_DWORD *)buf = 136316418;
            *(_QWORD *)&buf[4] = "";
            v39 = 2080;
            v40 = "result == 0 ";
            v41 = 2080;
            v42 = v29;
            v43 = 2080;
            v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
            v45 = 1024;
            v46 = 1380;
            v47 = 1024;
            *(_DWORD *)v48 = v20;
            _os_log_impl(&dword_2310CA000, v28, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
          }
        }
        else
        {
          *(_QWORD *)buf = &unk_24FFF9AE0;
          *(_DWORD *)&v48[2] = 0;
          v30 = 0;
          v19 = *(_DWORD *)(a1 + 48);
          SPUDataQueue::init((SPUDataQueue *)buf, *(unsigned __int8 **)(a1 + 64), *(_QWORD *)(a1 + 72), 0, valuePtr);
          *(_DWORD *)&v48[2] = v19;
          LODWORD(v35) = *(_DWORD *)(a1 + 48);
          SPUDataQueue::dequeue_all_read_only((SPUDataQueue *)buf, (void (*)(void *, unsigned int, unsigned __int8 *, unint64_t, unsigned int))AppleSPUHIDDriverClass::ApplyToHistoricalCallback, v31);
          SPUDataQueue::get_extended_info((SPUDataQueue *)buf, 4, &v30);
          input = v30;
          if (IOConnectCallScalarMethod(*(mach_port_t *)&v48[2], 6u, &input, 1u, 0, 0))
            v20 = 3758097090;
          else
            v20 = 0;
          IOConnectCallScalarMethod(*(_DWORD *)(a1 + 48), 2u, 0, 0, 0, 0);
        }
      }
      else
      {
        v20 = 3758097086;
        v27 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = "";
          v39 = 2080;
          v40 = "alignRef";
          v41 = 2080;
          v42 = "";
          v43 = 2080;
          v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
          v45 = 1024;
          v46 = 1374;
          v47 = 1024;
          *(_DWORD *)v48 = 0;
          _os_log_impl(&dword_2310CA000, v27, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
        }
        v16 = 0;
      }
    }
    CFRelease(v9);
    if (MatchingService)
LABEL_16:
      IOObjectRelease(MatchingService);
  }
  else
  {
    v20 = 3758097086;
    v24 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "";
      v39 = 2080;
      v40 = "timesyncDict";
      v41 = 2080;
      v42 = "";
      v43 = 2080;
      v44 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v45 = 1024;
      v46 = 1364;
      v47 = 1024;
      *(_DWORD *)v48 = 0;
      _os_log_impl(&dword_2310CA000, v24, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
    v14 = 0;
    v16 = 0;
    if (MatchingService)
      goto LABEL_16;
  }
  if (v16)
    CFRelease(v16);
  if (v14)
    IOObjectRelease(v14);
  if ((_DWORD)v20)
    goto LABEL_22;
  return v20;
}

void AppleSPUHIDDriverClass::ApplyToHistoricalCallback(AppleSPUHIDDriverClass *this, void *a2, uint64_t a3, unsigned __int8 *a4)
{
  int v5;
  const void *VendorDefinedEvent;
  uint64_t AccelerometerEvent;

  v5 = *(unsigned __int16 *)(a3 + 22);
  if (v5 == 194)
  {
    AccelerometerEvent = IOHIDEventCreateAccelerometerEvent();
    if (!AccelerometerEvent)
      return;
    VendorDefinedEvent = (const void *)AccelerometerEvent;
    IOHIDEventSetIntegerValue();
    goto LABEL_7;
  }
  if (v5 == 196)
  {
    VendorDefinedEvent = (const void *)IOHIDEventCreateVendorDefinedEvent();
    if (VendorDefinedEvent)
    {
LABEL_7:
      (*(void (**)(_QWORD, const void *))this)(*((_QWORD *)this + 1), VendorDefinedEvent);
      CFRelease(VendorDefinedEvent);
    }
  }
}

BOOL sub_2310CEE60(uint64_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 52), 6u, &input, 1u, 0, 0) == 0;
}

uint64_t AppleSPUHIDDriverClass::AopTimeToCalendar(AppleSPUHIDDriverClass *this, uint64_t a2, unint64_t *a3, unsigned int *a4)
{
  mach_port_t v8;
  const __CFDictionary *v9;
  io_service_t MatchingService;
  const __CFDictionary *CFProperty;
  const __CFDictionary *v12;
  const __CFNumber *Value;
  const __CFNumber *v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v18;
  uint64_t v19;
  uint64_t valuePtr;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  valuePtr = 0;
  v8 = *MEMORY[0x24BDD8B20];
  v9 = IOServiceMatching("AppleSPUTimesync");
  MatchingService = IOServiceGetMatchingService(v8, v9);
  CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("timesync"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v12 = CFProperty;
    Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, CFSTR("spu"));
    CFNumberGetValue(Value, kCFNumberLongLongType, &valuePtr);
    v14 = (const __CFNumber *)CFDictionaryGetValue(v12, CFSTR("calendar"));
    CFNumberGetValue(v14, kCFNumberLongLongType, &v19);
    v15 = (v19 - valuePtr + 1000 * a2) / 0x3E8uLL;
    *a3 = (v19 - valuePtr + 1000 * a2) / 0x3B9ACA00uLL;
    *a4 = v15 - 1000000 * ((unint64_t)((v15 * (unsigned __int128)0x431BDE82D7B635uLL) >> 64) >> 10);
    CFRelease(v12);
    v16 = 0;
  }
  else
  {
    v16 = 3758097086;
    v18 = *((_QWORD *)this + 7);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v22 = "";
      v23 = 2080;
      v24 = "timesyncDict";
      v25 = 2080;
      v26 = "";
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPULib/AppleSPULib.cpp";
      v29 = 1024;
      v30 = 1433;
      v31 = 1024;
      v32 = 0;
      _os_log_impl(&dword_2310CA000, v18, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
    }
  }
  if (MatchingService)
    IOObjectRelease(MatchingService);
  return v16;
}

void AppleSPULibFactory(const __CFAllocator *a1, const void *a2)
{
  const __CFAllocator *v4;
  CFUUIDRef v5;
  AppleSPUHIDDeviceClass *v6;
  CFUUIDRef v7;
  AppleSPUHIDDriverClass *v8;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v5 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x7Au, 0xCFu, 0x53u, 0x32u, 0x1Au, 0x35u, 0x48u, 0x93u, 0x87u, 0xCBu, 0xBAu, 0x64u, 0xE1u, 0x88u, 0x7Fu, 0xAEu);
  if (CFEqual(a2, v5))
  {
    v6 = (AppleSPUHIDDeviceClass *)CFAllocatorAllocate(a1, 160, 0);
    AppleSPUHIDDeviceClass::AppleSPUHIDDeviceClass(v6, a1);
  }
  else
  {
    v7 = CFUUIDGetConstantUUIDWithBytes(v4, 0x3Bu, 0xC5u, 0xCCu, 0x87u, 0x84u, 0x5Eu, 0x48u, 0xABu, 0xA9u, 0xC2u, 0x94u, 0x36u, 0, 0x1Bu, 0xA6u, 0x8Au);
    if (CFEqual(a2, v7))
    {
      v8 = (AppleSPUHIDDriverClass *)CFAllocatorAllocate(a1, 80, 0);
      AppleSPUHIDDriverClass::AppleSPUHIDDriverClass(v8, a1);
    }
  }
}

void sub_2310CF1DC()
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    sub_2310CF69C();
}

_QWORD *sub_2310CF224(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x2348D06E0](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!sub_2310CF388(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x2348D06EC](v13);
  return a1;
}

void sub_2310CF32C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x2348D06EC](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2310CF30CLL);
}

void sub_2310CF374(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_2310CF388(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      sub_2310CF4C4(__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_2310CF4A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_2310CF4C4(_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_2310CF56C();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void sub_2310CF56C()
{
  sub_2310CF580("basic_string");
}

void sub_2310CF580(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2310CF5D0(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24FFF98B8, MEMORY[0x24BEDAAF0]);
}

void sub_2310CF5BC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2310CF5D0(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

void sub_2310CF5F4(uint64_t a1, const char *a2, int a3)
{
  size_t v4;
  char __str[256];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  snprintf(__str, 0x100uLL, "%s:%d [ringbuffer=%p, lc_rdptr=%d]", a2, a3, *(const void **)(a1 + 8), *(_DWORD *)(a1 + 36));
  v4 = strlen(__str);
  IOConnectCallMethod(*(_DWORD *)(a1 + 52), 5u, 0, 0, __str, v4 + 1, 0, 0, 0, 0);
  abort();
}

void sub_2310CF674()
{
  __assert_rtn("SetAggregateDictionaryCallback", "AppleSPULib.cpp", 592, "_source");
}

void sub_2310CF69C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2310CA000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error: dequeue_all shouldn't be called by SPUDataQueueAccessor.", v0, 2u);
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x24BDBB7A0](allocator, ptr);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBBFB0](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x24BDBBFB8](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x24BDBBFD0](port);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
  MEMORY[0x24BDBC140](factoryID);
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
  MEMORY[0x24BDBC148](factoryID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x24BDD7F18](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x24BDD7F80](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x24BDD7FA0]();
}

Boolean IODataQueueDataAvailable(IODataQueueMemory *dataQueue)
{
  return MEMORY[0x24BDD7FA8](dataQueue);
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x24BDD7FB0](dataQueue, data, dataSize);
}

IOReturn IODataQueueWaitForAvailableData(IODataQueueMemory *dataQueue, mach_port_t notificationPort)
{
  return MEMORY[0x24BDD7FC0](dataQueue, *(_QWORD *)&notificationPort);
}

uint64_t IOHIDEventCreateAccelerometerEvent()
{
  return MEMORY[0x24BDD8160]();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return MEMORY[0x24BDD8248]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x24BDD8320]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24FFF98C8(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24FFF98D0(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFB8](source, handler);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

