uint64_t sub_19C2219AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  *(_QWORD *)a1 = &unk_1E3D23B00;
  *(_QWORD *)(a1 + 8) = a2;
  sub_19C19D418(a1 + 16, a3);
  v16 = *(_QWORD *)(a4 + 24);
  if (!v16)
    goto LABEL_4;
  if (v16 != a4)
  {
    v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 16))(v16);
LABEL_4:
    *(_QWORD *)(a1 + 160) = v16;
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 160) = a1 + 136;
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a4 + 24) + 24))(*(_QWORD *)(a4 + 24), a1 + 136);
LABEL_6:
  v17 = *(_QWORD *)(a5 + 24);
  if (v17)
  {
    if (v17 == a5)
    {
      *(_QWORD *)(a1 + 192) = a1 + 168;
      (*(void (**)(_QWORD))(**(_QWORD **)(a5 + 24) + 24))(*(_QWORD *)(a5 + 24));
      goto LABEL_11;
    }
    v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v17 + 16))(v17);
  }
  *(_QWORD *)(a1 + 192) = v17;
LABEL_11:
  *(_QWORD *)(a1 + 200) = a6;
  *(_QWORD *)(a1 + 208) = a7;
  *(_QWORD *)(a1 + 216) = a8;
  *(_DWORD *)(a1 + 224) = *(_DWORD *)a9;
  v18 = *(_OWORD *)(a9 + 8);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a9 + 24);
  *(_OWORD *)(a1 + 232) = v18;
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a9 + 40);
  *(_DWORD *)(a1 + 272) = *(_DWORD *)a10;
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a10 + 8);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a10 + 16);
  return a1;
}

void sub_19C221AD8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v5;
  uint64_t v6;

  v5 = *(_QWORD **)(v1 + 160);
  if (v5 == v3)
  {
    v6 = 4;
  }
  else
  {
    if (!v5)
    {
      sub_19C098FBC(v2, *(char **)(v1 + 24));
      _Unwind_Resume(a1);
    }
    v6 = 5;
    v3 = *(_QWORD **)(v1 + 160);
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v6))(v3);
  sub_19C098FBC(v2, *(char **)(v1 + 24));
  _Unwind_Resume(a1);
}

void sub_19C221B38(uint64_t a1, int a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[2];
  _OWORD v14[8];
  void *in[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
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
  __int128 v35;
  __int128 v36;
  void *out[2];
  __int128 v38;
  int v39;

  *(_OWORD *)out = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
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
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  *(_OWORD *)in = 0u;
  v16 = 0u;
  memset(v14, 0, sizeof(v14));
  sub_19C221C78(a1, a2, (uint64_t)v14);
  memset(v13, 0, sizeof(v13));
  v4 = (void *)MEMORY[0x1A1AD1440](v14, v13);
  v39 = a2;
  v5 = *(_QWORD *)(a1 + 160);
  if (!v5
    || ((*(void (**)(uint64_t *__return_ptr, uint64_t, int *))(*(_QWORD *)v5 + 48))(&v8, v5, &v39),
        v39 = a2,
        (v6 = *(_QWORD *)(a1 + 192)) == 0))
  {
    sub_19C1D6A94();
  }
  v7 = (int)v9 * (int)v10 * (int)v11 * (int)v12 / (unint64_t)a2;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, int *))(*(_QWORD *)v6 + 48))(&v8, v6, &v39);
  BNNSFilterApplyBatch(v4, a2, in[1], v7, out[1], (int)v9 * (int)v10 * (int)v11 * (int)v12 / (unint64_t)a2);
  if (v4)
    BNNSFilterDestroy(v4);
}

double sub_19C221C78@<D0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  int v16;
  __int128 v17;
  double result;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  int v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  *(_OWORD *)(a3 + 480) = 0u;
  *(_OWORD *)(a3 + 496) = 0u;
  *(_OWORD *)(a3 + 448) = 0u;
  *(_OWORD *)(a3 + 464) = 0u;
  *(_OWORD *)(a3 + 416) = 0u;
  *(_OWORD *)(a3 + 432) = 0u;
  *(_OWORD *)(a3 + 384) = 0u;
  *(_OWORD *)(a3 + 400) = 0u;
  *(_OWORD *)(a3 + 352) = 0u;
  *(_OWORD *)(a3 + 368) = 0u;
  *(_OWORD *)(a3 + 320) = 0u;
  *(_OWORD *)(a3 + 336) = 0u;
  *(_OWORD *)(a3 + 288) = 0u;
  *(_OWORD *)(a3 + 304) = 0u;
  *(_OWORD *)(a3 + 256) = 0u;
  *(_OWORD *)(a3 + 272) = 0u;
  *(_OWORD *)(a3 + 224) = 0u;
  *(_OWORD *)(a3 + 240) = 0u;
  *(_OWORD *)(a3 + 192) = 0u;
  *(_OWORD *)(a3 + 208) = 0u;
  *(_OWORD *)(a3 + 160) = 0u;
  *(_OWORD *)(a3 + 176) = 0u;
  *(_OWORD *)(a3 + 128) = 0u;
  *(_OWORD *)(a3 + 144) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  v27 = a2;
  v4 = *(_QWORD *)(a1 + 160);
  if (!v4)
    goto LABEL_11;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, int *))(*(_QWORD *)v4 + 48))(&v23, v4, &v27);
  v27 = v23;
  v28 = v24;
  v29 = v25;
  v7 = v26;
  v30 = v26;
  v26 = 0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 128) = 0u;
  *(_OWORD *)(a3 + 144) = 0u;
  *(_OWORD *)(a3 + 160) = 0u;
  *(_QWORD *)(a3 + 136) = v7;
  *(_DWORD *)(a3 + 144) = 65568;
  *(_DWORD *)(a3 + 164) = 1065353216;
  *(_QWORD *)(a3 + 72) = sub_19C222160(&v27, 0);
  *(_QWORD *)(a3 + 8) = v28;
  *(_QWORD *)(a3 + 80) = sub_19C222160(&v27, 1);
  *(_QWORD *)(a3 + 16) = *((_QWORD *)&v28 + 1);
  *(_QWORD *)(a3 + 88) = sub_19C222160(&v27, 2);
  *(_QWORD *)(a3 + 24) = v29;
  *(_DWORD *)(a3 + 4) = 196608;
  v8 = *(_DWORD *)(a1 + 224);
  v28 = *(_OWORD *)(a1 + 232);
  v29 = *(_OWORD *)(a1 + 248);
  v9 = *(_QWORD *)(a1 + 264);
  v27 = v8;
  v30 = v9;
  *(_OWORD *)(a3 + 304) = 0u;
  *(_OWORD *)(a3 + 320) = 0u;
  *(_OWORD *)(a3 + 336) = 0u;
  *(_OWORD *)(a3 + 176) = 0u;
  *(_OWORD *)(a3 + 192) = 0u;
  *(_OWORD *)(a3 + 208) = 0u;
  *(_OWORD *)(a3 + 224) = 0u;
  *(_OWORD *)(a3 + 240) = 0u;
  *(_OWORD *)(a3 + 256) = 0u;
  *(_OWORD *)(a3 + 272) = 0u;
  *(_OWORD *)(a3 + 288) = 0u;
  *(_QWORD *)(a3 + 312) = v9;
  *(_DWORD *)(a3 + 320) = 65568;
  *(_DWORD *)(a3 + 340) = 1065353216;
  *(_QWORD *)(a3 + 248) = sub_19C222160(&v27, 0);
  *(_QWORD *)(a3 + 184) = v28;
  *(_QWORD *)(a3 + 256) = sub_19C222160(&v27, 1);
  *(_QWORD *)(a3 + 192) = *((_QWORD *)&v28 + 1);
  *(_QWORD *)(a3 + 264) = sub_19C222160(&v27, 2);
  *(_QWORD *)(a3 + 200) = v29;
  *(_QWORD *)(a3 + 272) = sub_19C222160(&v27, 3);
  *(_QWORD *)(a3 + 208) = *((_QWORD *)&v29 + 1);
  *(_QWORD *)(a3 + 328) = 0;
  *(_DWORD *)(a3 + 180) = 0x40000;
  v27 = a2;
  v10 = *(_QWORD *)(a1 + 192);
  if (!v10)
LABEL_11:
    sub_19C1D6A94();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, int *))(*(_QWORD *)v10 + 48))(&v19, v10, &v27);
  v27 = v19;
  v28 = v20;
  v29 = v21;
  v11 = v22;
  v30 = v22;
  v22 = 0;
  *(_OWORD *)(a3 + 352) = 0u;
  *(_OWORD *)(a3 + 368) = 0u;
  *(_OWORD *)(a3 + 384) = 0u;
  *(_OWORD *)(a3 + 400) = 0u;
  *(_OWORD *)(a3 + 416) = 0u;
  *(_OWORD *)(a3 + 432) = 0u;
  *(_OWORD *)(a3 + 448) = 0u;
  *(_OWORD *)(a3 + 464) = 0u;
  *(_OWORD *)(a3 + 480) = 0u;
  *(_OWORD *)(a3 + 496) = 0u;
  *(_OWORD *)(a3 + 512) = 0u;
  *(_QWORD *)(a3 + 488) = v11;
  *(_DWORD *)(a3 + 496) = 65568;
  *(_DWORD *)(a3 + 516) = 1065353216;
  *(_QWORD *)(a3 + 424) = sub_19C222160(&v27, 0);
  *(_QWORD *)(a3 + 360) = v28;
  *(_QWORD *)(a3 + 432) = sub_19C222160(&v27, 1);
  *(_QWORD *)(a3 + 368) = *((_QWORD *)&v28 + 1);
  *(_QWORD *)(a3 + 440) = sub_19C222160(&v27, 2);
  *(_QWORD *)(a3 + 376) = v29;
  *(_DWORD *)(a3 + 356) = 196608;
  v12 = *(_QWORD *)(a1 + 280);
  v13 = *(_QWORD *)(a1 + 288);
  *(_OWORD *)(a3 + 656) = 0u;
  *(_OWORD *)(a3 + 672) = 0u;
  *(_OWORD *)(a3 + 688) = 0u;
  *(_OWORD *)(a3 + 528) = 0u;
  *(_OWORD *)(a3 + 544) = 0u;
  *(_OWORD *)(a3 + 560) = 0u;
  *(_OWORD *)(a3 + 576) = 0u;
  *(_OWORD *)(a3 + 592) = 0u;
  *(_OWORD *)(a3 + 608) = 0u;
  *(_OWORD *)(a3 + 624) = 0u;
  *(_OWORD *)(a3 + 640) = 0u;
  *(_QWORD *)(a3 + 664) = v13;
  *(_DWORD *)(a3 + 672) = 65568;
  *(_DWORD *)(a3 + 692) = 1065353216;
  *(_QWORD *)(a3 + 600) = 1;
  *(_QWORD *)(a3 + 536) = v12;
  v14 = (_OWORD *)(a3 + 704);
  v15 = *(_QWORD *)(a1 + 200) - 1;
  *(_DWORD *)(a3 + 532) = 0x10000;
  switch(v15)
  {
    case 0:
      *(_OWORD *)(a3 + 720) = 0uLL;
      *(_OWORD *)(a3 + 736) = 0uLL;
      *v14 = 0uLL;
      v16 = 3;
      goto LABEL_9;
    case 1:
      *(_OWORD *)(a3 + 720) = 0uLL;
      *(_OWORD *)(a3 + 736) = 0uLL;
      *v14 = 0uLL;
      v16 = 4;
      goto LABEL_9;
    case 3:
      *(_OWORD *)(a3 + 720) = 0uLL;
      *(_OWORD *)(a3 + 736) = 0uLL;
      *v14 = 0uLL;
      v16 = 11;
      goto LABEL_9;
    case 4:
      *(_OWORD *)(a3 + 720) = 0uLL;
      *(_OWORD *)(a3 + 736) = 0uLL;
      *v14 = 0uLL;
      v16 = 1;
LABEL_9:
      *(_DWORD *)v14 = v16;
      break;
    default:
      *(_OWORD *)(a3 + 720) = 0uLL;
      *(_OWORD *)(a3 + 736) = 0uLL;
      *v14 = 0uLL;
      break;
  }
  *(_QWORD *)(a3 + 752) = sub_19C18871C(a1 + 16, 0);
  *(_QWORD *)(a3 + 760) = sub_19C18871C(a1 + 16, 1);
  v17 = *(_OWORD *)(a1 + 208);
  *(int64x2_t *)(a3 + 768) = vdupq_n_s64(1uLL);
  *(_OWORD *)(a3 + 784) = v17;
  result = 0.0;
  *(_OWORD *)(a3 + 800) = 0u;
  *(_OWORD *)(a3 + 816) = 0u;
  *(_QWORD *)(a3 + 832) = 0;
  return result;
}

uint64_t sub_19C222028(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  *(_QWORD *)a1 = &unk_1E3D23B00;
  v2 = (_QWORD *)(a1 + 168);
  v3 = *(_QWORD **)(a1 + 192);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  v5 = *(_QWORD **)(a1 + 160);
  if (v5 == (_QWORD *)(a1 + 136))
  {
    v6 = 4;
    v5 = (_QWORD *)(a1 + 136);
    goto LABEL_10;
  }
  if (v5)
  {
    v6 = 5;
LABEL_10:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  sub_19C098FBC(a1 + 16, *(char **)(a1 + 24));
  return a1;
}

void sub_19C2220C4(char *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  *(_QWORD *)a1 = &unk_1E3D23B00;
  v2 = a1 + 168;
  v3 = (_QWORD *)*((_QWORD *)a1 + 24);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  v5 = (char *)*((_QWORD *)a1 + 20);
  if (v5 == a1 + 136)
  {
    v6 = 4;
    v5 = a1 + 136;
    goto LABEL_10;
  }
  if (v5)
  {
    v6 = 5;
LABEL_10:
    (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
  }
  sub_19C098FBC((uint64_t)(a1 + 16), *((char **)a1 + 3));
  operator delete(a1);
}

uint64_t sub_19C222160(_DWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;

  if (!*a1)
  {
    if (a2 != 3)
    {
      v3 = a2 + 1;
      goto LABEL_7;
    }
    return 1;
  }
  if (!a2)
    return 1;
  v3 = a2 - 1;
LABEL_7:
  v5 = sub_19C222160(a1, v3);
  if ((int)v3 < 0)
    v6 = (int)v3 + 4;
  else
    v6 = v3;
  if (v6 >= 4)
    sub_19C07DFF8("array::at");
  return *(_QWORD *)&a1[2 * v6 + 2] * v5;
}

uint64_t sub_19C2221EC(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v12;
  const void *v13;
  int64_t v14;
  char *v15;
  char *v16;

  *(_QWORD *)a1 = &unk_1E3D21F10;
  *(_QWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  *(_DWORD *)(a1 + 20) = a4;
  *(_QWORD *)(a1 + 24) = a5;
  *(_QWORD *)(a1 + 32) = a6;
  *(_QWORD *)(a1 + 40) = a7;
  *(_QWORD *)(a1 + 48) = a8;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 56) = a9;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  v13 = *(const void **)a10;
  v12 = *(_QWORD *)(a10 + 8);
  v14 = v12 - *(_QWORD *)a10;
  if (v12 != *(_QWORD *)a10)
  {
    if (v14 < 0)
      sub_19C07DA0C();
    v15 = (char *)operator new(v12 - (_QWORD)v13);
    *(_QWORD *)(a1 + 64) = v15;
    *(_QWORD *)(a1 + 72) = v15;
    v16 = &v15[4 * (v14 >> 2)];
    *(_QWORD *)(a1 + 80) = v16;
    memcpy(v15, v13, v14);
    *(_QWORD *)(a1 + 72) = v16;
  }
  *(_BYTE *)(a1 + 88) = a11;
  *(_QWORD *)a1 = &unk_1E3D22EE8;
  return a1;
}

void sub_19C2222A0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 72) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C2222BC(uint64_t result)
{
  unint64_t v1;
  int v2[8];

  v1 = *(_QWORD *)(result + 56);
  if (v1 <= 9 && ((0x237u >> v1) & 1) != 0)
  {
    bzero(v2, 0x20uLL);
    v2[0] = 1;
    return BNNSDirectApplyFullyConnectedBatch();
  }
  return result;
}

uint64_t sub_19C2224F8(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t v12;
  const void *v13;
  int64_t v14;
  char *v15;
  char *v16;

  *(_QWORD *)a1 = &unk_1E3D21EE8;
  *(_QWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  *(_DWORD *)(a1 + 20) = a4;
  *(_QWORD *)(a1 + 24) = a5;
  *(_QWORD *)(a1 + 32) = a6;
  *(_QWORD *)(a1 + 40) = a7;
  *(_QWORD *)(a1 + 48) = a8;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 56) = a9;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  v13 = *(const void **)a10;
  v12 = *(_QWORD *)(a10 + 8);
  v14 = v12 - *(_QWORD *)a10;
  if (v12 != *(_QWORD *)a10)
  {
    if (v14 < 0)
      sub_19C07DA0C();
    v15 = (char *)operator new(v12 - (_QWORD)v13);
    *(_QWORD *)(a1 + 64) = v15;
    *(_QWORD *)(a1 + 72) = v15;
    v16 = &v15[4 * (v14 >> 2)];
    *(_QWORD *)(a1 + 80) = v16;
    memcpy(v15, v13, v14);
    *(_QWORD *)(a1 + 72) = v16;
  }
  *(_BYTE *)(a1 + 88) = a11;
  *(_QWORD *)a1 = &unk_1E3D22EC0;
  return a1;
}

void sub_19C2225AC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 72) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C2225C8(uint64_t result)
{
  unint64_t v1;
  int v2[8];

  v1 = *(_QWORD *)(result + 56);
  if (v1 <= 9 && ((0x237u >> v1) & 1) != 0)
  {
    bzero(v2, 0x20uLL);
    v2[0] = 1;
    return BNNSDirectApplyFullyConnectedBatch();
  }
  return result;
}

_QWORD *sub_19C222810(_QWORD *a1)
{
  void *v2;

  *a1 = &unk_1E3D21F10;
  v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_19C222850(_QWORD *__p)
{
  void *v2;

  *__p = &unk_1E3D21F10;
  v2 = (void *)__p[8];
  if (v2)
  {
    __p[9] = v2;
    operator delete(v2);
  }
  operator delete(__p);
}

_QWORD *sub_19C222890(_QWORD *a1)
{
  void *v2;

  *a1 = &unk_1E3D21EE8;
  v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_19C2228D0(_QWORD *__p)
{
  void *v2;

  *__p = &unk_1E3D21EE8;
  v2 = (void *)__p[8];
  if (v2)
  {
    __p[9] = v2;
    operator delete(v2);
  }
  operator delete(__p);
}

uint64_t sub_19C222D14(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8, float a9)
{
  uint64_t v18;

  v18 = operator new();
  sub_19C19FAEC(v18, a1, a2, a3, a4, a5, a6, a7, a9, a8);
  return v18;
}

void sub_19C222DC8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C222DDC(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v17;

  v17 = operator new();
  sub_19C2221EC(v17, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return v17;
}

void sub_19C222E8C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C222EA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v21[2];
  uint64_t v22;
  __int128 v23[2];
  uint64_t v24;

  v17 = operator new();
  v18 = *(_OWORD *)(a2 + 16);
  v23[0] = *(_OWORD *)a2;
  v23[1] = v18;
  v24 = *(_QWORD *)(a2 + 32);
  v19 = *(_OWORD *)(a3 + 16);
  v21[0] = *(_OWORD *)a3;
  v21[1] = v19;
  v22 = *(_QWORD *)(a3 + 32);
  sub_19C249D2C(v17, a1, v23, v21, a4, a5, a6, a7, a8, a9);
  return v17;
}

void sub_19C222F6C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C222F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;

  v10 = operator new();
  sub_19C246CF0(v10, a1, a2, a3, a4, a5);
  return v10;
}

void sub_19C222FF4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C223008(uint64_t a1, int *a2, __int128 *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  void *__p;
  void *v19;
  uint64_t v20;

  v16 = operator new();
  __p = 0;
  v19 = 0;
  v20 = 0;
  sub_19C08CA44(v16, a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&__p);
  if (__p)
  {
    v19 = __p;
    operator delete(__p);
  }
  return v16;
}

void sub_19C2230C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  void *v13;

  if (__p)
    operator delete(__p);
  operator delete(v13);
  _Unwind_Resume(a1);
}

uint64_t sub_19C2230EC(uint64_t a1, int *a2, __int128 *a3, uint64_t a4, uint64_t a5, uint64_t a6, float a7)
{
  uint64_t v14;
  void *__p;
  void *v17;
  uint64_t v18;

  v14 = operator new();
  __p = 0;
  v17 = 0;
  v18 = 0;
  sub_19C08CB2C(v14, a1, a2, a3, a4, a5, a6, (uint64_t)&__p, a7);
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }
  return v14;
}

void sub_19C2231A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;

  if (__p)
    operator delete(__p);
  operator delete(v11);
  _Unwind_Resume(a1);
}

uint64_t sub_19C2231C8(uint64_t a1, _DWORD *a2, __int128 *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  void *__p;
  void *v17;
  uint64_t v18;

  v14 = operator new();
  __p = 0;
  v17 = 0;
  v18 = 0;
  sub_19C19D738(v14, a1, a2, a3, a4, a5, a6, a7, (uint64_t)&__p);
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }
  return v14;
}

void sub_19C22327C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;

  if (__p)
    operator delete(__p);
  operator delete(v11);
  _Unwind_Resume(a1);
}

uint64_t sub_19C2232A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int *a8, int *a9)
{
  uint64_t v17;
  uint64_t v18;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v17 = operator new();
  v23 = *a8;
  v24 = *(_OWORD *)(a8 + 2);
  v25 = *(_OWORD *)(a8 + 6);
  v26 = *((_QWORD *)a8 + 5);
  v20 = *a9;
  v18 = *((_QWORD *)a9 + 2);
  v21 = *((_QWORD *)a9 + 1);
  v22 = v18;
  sub_19C2219AC(v17, a1, a2, a3, a4, a5, a6, a7, (uint64_t)&v23, (uint64_t)&v20);
  return v17;
}

void sub_19C223380(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C223394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int *a8)
{
  uint64_t v16;
  uint64_t v17;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v16 = operator new();
  v19 = *a8;
  v17 = *((_QWORD *)a8 + 2);
  v20 = *((_QWORD *)a8 + 1);
  v21 = v17;
  sub_19C22D060(v16, a1, a2, a3, a4, a5, a6, a7, (uint64_t)&v19);
  return v16;
}

void sub_19C22344C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C223460(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t v17;

  v17 = operator new();
  sub_19C2224F8(v17, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
  return v17;
}

void sub_19C223510(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C22352C(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  *(_QWORD *)a1 = &unk_1E3D248B8;
  v2 = (_QWORD *)(a1 + 168);
  v3 = *(_QWORD **)(a1 + 192);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  v5 = *(_QWORD **)(a1 + 160);
  if (v5 == (_QWORD *)(a1 + 136))
  {
    v6 = 4;
    v5 = (_QWORD *)(a1 + 136);
    goto LABEL_10;
  }
  if (v5)
  {
    v6 = 5;
LABEL_10:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }
  sub_19C098FBC(a1 + 16, *(char **)(a1 + 24));
  return a1;
}

void sub_19C2235C8(char *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  *(_QWORD *)a1 = &unk_1E3D248B8;
  v2 = a1 + 168;
  v3 = (_QWORD *)*((_QWORD *)a1 + 24);
  if (v3 == v2)
  {
    v4 = 4;
    v3 = v2;
  }
  else
  {
    if (!v3)
      goto LABEL_6;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
LABEL_6:
  v5 = (char *)*((_QWORD *)a1 + 20);
  if (v5 == a1 + 136)
  {
    v6 = 4;
    v5 = a1 + 136;
    goto LABEL_10;
  }
  if (v5)
  {
    v6 = 5;
LABEL_10:
    (*(void (**)(void))(*(_QWORD *)v5 + 8 * v6))();
  }
  sub_19C098FBC((uint64_t)(a1 + 16), *((char **)a1 + 3));
  operator delete(a1);
}

void sub_19C2245D0(_Unwind_Exception *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, ...)
{
  void *v17;
  void *v18;
  void *v19;
  va_list va;

  va_start(va, a17);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_19C224864(uint64_t a1, uint64_t a2)
{
  return memcpy((void *)(a1 + 48), (const void *)(a2 + 48), 0x2C0uLL);
}

void sub_19C224878(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  int isEqualToString;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  double v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  MontrealNNModelWeight *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  MontrealNNModelWeight *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  const char *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[2];
  _QWORD v70[2];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v64 = a1;
  v9 = (uint64_t *)sub_19C252CA8(v5, *(_QWORD *)(a1[7] + 8) + 48);
  if (*v9)
  {
    v10 = (_QWORD *)a1[4];
    v11 = (void *)a1[5];
    v62 = v10[1];
    if (v11)
    {
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      objc_msgSend_weights(v11, v6, v7, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v65, (uint64_t)v71, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v66;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v66 != v18)
              objc_enumerationMutation(v12);
            v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
            objc_msgSend_name(v20, v14, v15, v16, v62);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v21, v22, (uint64_t)v5, v23);

            if (isEqualToString)
            {
              objc_msgSend_index(v20, v14, v15, v16);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = objc_msgSend_unsignedIntegerValue(v25, v26, v27, v28);

              goto LABEL_13;
            }
          }
          v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v65, (uint64_t)v71, 16);
          if (v17)
            continue;
          break;
        }
      }
LABEL_13:

      v10 = (_QWORD *)v64[4];
    }
    if (objc_msgSend_weightDataFormat(v10, v6, v7, v8, v62) == 1)
    {
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v29, v30, v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
      {
        v37 = 0;
        do
        {
          LODWORD(v36) = *(_DWORD *)(*v9 + 4 * v37);
          objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v32, v33, v34, v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v35, v39, (uint64_t)v38, v40);

          ++v37;
        }
        while (a2 != v37);
      }
      v41 = [MontrealNNModelWeight alloc];
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v42, v63, v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = &unk_1E3D2E5D0;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v45, a2, v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v70[1] = v47;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v48, (uint64_t)v70, 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend_initWithName_index_dimension_weightValues_(v41, v50, (uint64_t)v5, (uint64_t)v44, v49, v35);
    }
    else
    {
      objc_msgSend_dataFromWeights_length_((void *)v64[4], v29, *v9, a2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = [MontrealNNModelWeight alloc];
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v53, v63, v54);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = &unk_1E3D2E5D0;
      objc_msgSend_numberWithUnsignedLong_(MEMORY[0x1E0CB37E8], v55, a2, v56);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v69[1] = v47;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v57, (uint64_t)v69, 2);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend_initWithName_index_dimension_weightData_(v52, v58, (uint64_t)v5, (uint64_t)v44, v49, v35);
    }
    v59 = (void *)v51;

    objc_msgSend_addObject_((void *)v64[6], v60, (uint64_t)v59, v61);
    ++*(_QWORD *)(v64[4] + 8);

  }
}

void sub_19C224BC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C224CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C224CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C224DB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19C224DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C224DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C224E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C224E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C224F3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C224F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)MontrealNNGenerateModel;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_19C22512C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19C22514C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C2251F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C225208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C225348(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C225358(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C225394(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C225550(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  va_list va;

  va_start(va, a2);

  sub_19C195798((const void **)va);
  _Unwind_Resume(a1);
}

void sub_19C225584(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C22559C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C2255B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C2255C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C2255D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C2255E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C2255F8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C225608(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C22561C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C22562C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C225640(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C2257C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2258C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v12;

  _Unwind_Resume(a1);
}

void sub_19C2258F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C225910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C225924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C225AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_19C225BB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v12;

  _Unwind_Resume(a1);
}

void sub_19C225BE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C225C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C225C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C225D90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C225F34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

_QWORD *sub_19C225FE0(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *__src)
{
  uint64_t v7;
  uint64_t v8;
  void *__p[2];
  uint64_t v11;
  int v12;
  int64x2_t v13;
  uint64_t v14;
  int64x2_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19C07C6E8(__p, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    v11 = *(_QWORD *)(a2 + 16);
  }
  sub_19C18E344((uint64_t)a1, (__int128 *)__p, a3, __src);
  if (SHIBYTE(v11) < 0)
    operator delete(__p[0]);
  *a1 = &unk_1E3D23990;
  a1[127] = __src[56];
  LODWORD(v7) = *((_DWORD *)__src + 32);
  if ((int)v7 <= 1)
    v7 = 1;
  else
    v7 = v7;
  v12 = 1;
  v13 = vdupq_n_s64(1uLL);
  v14 = v7;
  v15 = v13;
  sub_19C07C964((uint64_t)(a1 + 2), &v12, (int *)&v16);
  v8 = *((int *)__src + 64);
  v12 = 9;
  v13 = vdupq_n_s64(1uLL);
  v15 = 0uLL;
  v14 = v8;
  sub_19C07C964((uint64_t)(a1 + 5), &v12, (int *)&v16);
  return a1;
}

void sub_19C22611C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C18E518(v1);
  _Unwind_Resume(a1);
}

void sub_19C226130(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C18E518(v1);
  _Unwind_Resume(a1);
}

void sub_19C226144(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C226160(_QWORD *a1, uint64_t a2)
{
  void **v4;
  void **v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  v4 = (void **)a1[20];
  v5 = (void **)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31])
      return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 64))(a2, a1);
    goto LABEL_8;
  }
  do
  {
    if (*v4)
      operator delete(*v4);
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    v7 = a1[29];
    v6 = (uint64_t *)a1[30];
    v8 = *v6;
    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v7 + 8);
    **(_QWORD **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        v9 = (uint64_t *)v6[1];
        operator delete(v6);
        v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
  return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 64))(a2, a1);
}

uint64_t *sub_19C22621C(uint64_t a1, int a2)
{
  int v4;
  int v5;
  int v6;
  uint64_t *result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t **v13;
  uint64_t *v14;
  int v15;
  char *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char *v21;
  uint64_t v22;

  if ((*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1) < 1)
  {
    LODWORD(v10) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1);
    result = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 216))(a1, 1);
    v13 = (uint64_t **)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 48);
    v9 = *(int *)(a1 + 568);
    v10 = (int)v10;
    v11 = (int)result;
    if (!v19)
    {
      v14 = (uint64_t *)(a1 + 48);
LABEL_20:
      v21 = (char *)operator new(0x50uLL);
      v17 = (uint64_t *)v21;
      *((_DWORD *)v21 + 8) = a2;
      *(_OWORD *)(v21 + 40) = 0u;
      *(_OWORD *)(v21 + 56) = 0u;
      *((_QWORD *)v21 + 9) = 0;
      *(_QWORD *)v21 = 0;
      *((_QWORD *)v21 + 1) = 0;
      *((_QWORD *)v21 + 2) = v14;
      *v13 = (uint64_t *)v21;
      v22 = **(_QWORD **)(a1 + 40);
      if (!v22)
      {
        v8 = 1;
        v14 = (uint64_t *)v21;
        goto LABEL_23;
      }
      *(_QWORD *)(a1 + 40) = v22;
      v8 = 1;
      goto LABEL_22;
    }
    v8 = 1;
    while (1)
    {
      while (1)
      {
        v14 = (uint64_t *)v19;
        v20 = *(_DWORD *)(v19 + 32);
        if (v20 <= a2)
          break;
        v19 = *v14;
        v13 = (uint64_t **)v14;
        if (!*v14)
          goto LABEL_20;
      }
      if (v20 >= a2)
        break;
      v19 = v14[1];
      if (!v19)
      {
        v13 = (uint64_t **)(v14 + 1);
        goto LABEL_20;
      }
    }
  }
  else
  {
    v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1);
    v5 = *(_DWORD *)(a1 + 568);
    LODWORD(v9) = v5 / (*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1);
    v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1);
    result = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 216))(a1, 1);
    v8 = v4;
    v9 = (int)v9;
    v10 = v6;
    v11 = (int)result;
    v13 = (uint64_t **)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 48);
    if (!v12)
    {
      v14 = (uint64_t *)(a1 + 48);
LABEL_9:
      v16 = (char *)operator new(0x50uLL);
      v17 = (uint64_t *)v16;
      *((_DWORD *)v16 + 8) = a2;
      *(_OWORD *)(v16 + 40) = 0u;
      *(_OWORD *)(v16 + 56) = 0u;
      *((_QWORD *)v16 + 9) = 0;
      *(_QWORD *)v16 = 0;
      *((_QWORD *)v16 + 1) = 0;
      *((_QWORD *)v16 + 2) = v14;
      *v13 = (uint64_t *)v16;
      v18 = **(_QWORD **)(a1 + 40);
      if (!v18)
      {
        v14 = (uint64_t *)v16;
LABEL_23:
        result = sub_19C07CC40(*(uint64_t **)(a1 + 48), v17);
        ++*(_QWORD *)(a1 + 56);
        goto LABEL_24;
      }
      *(_QWORD *)(a1 + 40) = v18;
LABEL_22:
      v14 = v17;
      v17 = *v13;
      goto LABEL_23;
    }
    while (1)
    {
      while (1)
      {
        v14 = (uint64_t *)v12;
        v15 = *(_DWORD *)(v12 + 32);
        if (v15 <= a2)
          break;
        v12 = *v14;
        v13 = (uint64_t **)v14;
        if (!*v14)
          goto LABEL_9;
      }
      if (v15 >= a2)
        break;
      v12 = v14[1];
      if (!v12)
      {
        v13 = (uint64_t **)(v14 + 1);
        goto LABEL_9;
      }
    }
  }
LABEL_24:
  v14[5] = v8;
  v14[6] = 1;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  return result;
}

_QWORD *sub_19C226454(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *__src)
{
  uint64_t v7;
  uint64_t v8;
  void *__p[2];
  uint64_t v11;
  int v12;
  int64x2_t v13;
  uint64_t v14;
  int64x2_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19C07C6E8(__p, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    v11 = *(_QWORD *)(a2 + 16);
  }
  sub_19C19065C((uint64_t)a1, (__int128 *)__p, a3, __src);
  if (SHIBYTE(v11) < 0)
    operator delete(__p[0]);
  *a1 = &unk_1E3D23820;
  a1[127] = __src[56];
  LODWORD(v7) = *((_DWORD *)__src + 32);
  if ((int)v7 <= 1)
    v7 = 1;
  else
    v7 = v7;
  v12 = 1;
  v13 = vdupq_n_s64(1uLL);
  v14 = v7;
  v15 = v13;
  sub_19C07C964((uint64_t)(a1 + 2), &v12, (int *)&v16);
  v8 = *((int *)__src + 64);
  v12 = 9;
  v13 = vdupq_n_s64(1uLL);
  v15 = 0uLL;
  v14 = v8;
  sub_19C07C964((uint64_t)(a1 + 5), &v12, (int *)&v16);
  return a1;
}

void sub_19C226590(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C190830(v1);
  _Unwind_Resume(a1);
}

void sub_19C2265A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C190830(v1);
  _Unwind_Resume(a1);
}

void sub_19C2265B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C2265D4(_QWORD *a1, uint64_t a2)
{
  void **v4;
  void **v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  v4 = (void **)a1[20];
  v5 = (void **)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31])
      return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 168))(a2, a1);
    goto LABEL_8;
  }
  do
  {
    if (*v4)
      operator delete(*v4);
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    v7 = a1[29];
    v6 = (uint64_t *)a1[30];
    v8 = *v6;
    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v7 + 8);
    **(_QWORD **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        v9 = (uint64_t *)v6[1];
        operator delete(v6);
        v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
  return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 168))(a2, a1);
}

uint64_t *sub_19C226690(uint64_t a1, int a2)
{
  int v4;
  int v5;
  int v6;
  uint64_t *result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t **v13;
  uint64_t *v14;
  int v15;
  char *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char *v21;
  uint64_t v22;

  if ((*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1) < 1)
  {
    LODWORD(v10) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1);
    result = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 216))(a1, 1);
    v13 = (uint64_t **)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 48);
    v9 = *(int *)(a1 + 568);
    v10 = (int)v10;
    v11 = (int)result;
    if (!v19)
    {
      v14 = (uint64_t *)(a1 + 48);
LABEL_20:
      v21 = (char *)operator new(0x50uLL);
      v17 = (uint64_t *)v21;
      *((_DWORD *)v21 + 8) = a2;
      *(_OWORD *)(v21 + 40) = 0u;
      *(_OWORD *)(v21 + 56) = 0u;
      *((_QWORD *)v21 + 9) = 0;
      *(_QWORD *)v21 = 0;
      *((_QWORD *)v21 + 1) = 0;
      *((_QWORD *)v21 + 2) = v14;
      *v13 = (uint64_t *)v21;
      v22 = **(_QWORD **)(a1 + 40);
      if (!v22)
      {
        v8 = 1;
        v14 = (uint64_t *)v21;
        goto LABEL_23;
      }
      *(_QWORD *)(a1 + 40) = v22;
      v8 = 1;
      goto LABEL_22;
    }
    v8 = 1;
    while (1)
    {
      while (1)
      {
        v14 = (uint64_t *)v19;
        v20 = *(_DWORD *)(v19 + 32);
        if (v20 <= a2)
          break;
        v19 = *v14;
        v13 = (uint64_t **)v14;
        if (!*v14)
          goto LABEL_20;
      }
      if (v20 >= a2)
        break;
      v19 = v14[1];
      if (!v19)
      {
        v13 = (uint64_t **)(v14 + 1);
        goto LABEL_20;
      }
    }
  }
  else
  {
    v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1);
    v5 = *(_DWORD *)(a1 + 568);
    LODWORD(v9) = v5 / (*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1);
    v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1);
    result = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 216))(a1, 1);
    v8 = v4;
    v9 = (int)v9;
    v10 = v6;
    v11 = (int)result;
    v13 = (uint64_t **)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 48);
    if (!v12)
    {
      v14 = (uint64_t *)(a1 + 48);
LABEL_9:
      v16 = (char *)operator new(0x50uLL);
      v17 = (uint64_t *)v16;
      *((_DWORD *)v16 + 8) = a2;
      *(_OWORD *)(v16 + 40) = 0u;
      *(_OWORD *)(v16 + 56) = 0u;
      *((_QWORD *)v16 + 9) = 0;
      *(_QWORD *)v16 = 0;
      *((_QWORD *)v16 + 1) = 0;
      *((_QWORD *)v16 + 2) = v14;
      *v13 = (uint64_t *)v16;
      v18 = **(_QWORD **)(a1 + 40);
      if (!v18)
      {
        v14 = (uint64_t *)v16;
LABEL_23:
        result = sub_19C07CC40(*(uint64_t **)(a1 + 48), v17);
        ++*(_QWORD *)(a1 + 56);
        goto LABEL_24;
      }
      *(_QWORD *)(a1 + 40) = v18;
LABEL_22:
      v14 = v17;
      v17 = *v13;
      goto LABEL_23;
    }
    while (1)
    {
      while (1)
      {
        v14 = (uint64_t *)v12;
        v15 = *(_DWORD *)(v12 + 32);
        if (v15 <= a2)
          break;
        v12 = *v14;
        v13 = (uint64_t **)v14;
        if (!*v14)
          goto LABEL_9;
      }
      if (v15 >= a2)
        break;
      v12 = v14[1];
      if (!v12)
      {
        v13 = (uint64_t **)(v14 + 1);
        goto LABEL_9;
      }
    }
  }
LABEL_24:
  v14[5] = v8;
  v14[6] = 1;
  v14[7] = v9;
  v14[8] = v10;
  v14[9] = v11;
  return result;
}

void sub_19C2268CC(uint64_t a1)
{
  void *v1;

  v1 = (void *)sub_19C18E518(a1);
  operator delete(v1);
}

void sub_19C2268E4(uint64_t a1)
{
  void *v1;

  v1 = (void *)sub_19C190830(a1);
  operator delete(v1);
}

void sub_19C2269C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19C226B4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C226CB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C226D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C226D70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C2270C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_19C227370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_19C2273D8()
{
  JUMPOUT(0x19C2273BCLL);
}

void sub_19C2273E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C227600(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19C227638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_19C227928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t sub_19C227A78(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)result = off_1E3D20D90;
  *(_DWORD *)(result + 8) = a2;
  *(_QWORD *)(result + 16) = a3;
  *(_QWORD *)(result + 24) = a4;
  return result;
}

uint64_t sub_19C227A98(uint64_t a1, unsigned int a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD), uint64_t a4)
{
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  _QWORD *v11;
  int v12;
  std::runtime_error *exception;
  size_t v15;
  int v16;

  *(_QWORD *)a1 = &off_1E3D1E088;
  *(_DWORD *)(a1 + 8) = 0;
  *(_OWORD *)(a1 + 16) = 0u;
  v6 = (unsigned int *)(a1 + 16);
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 137) = 0u;
  *(_QWORD *)(a1 + 160) = 0;
  *(_QWORD *)(a1 + 168) = a4;
  if (!a2
    && ((v16 = 0, v15 = 4, v12 = sysctlbyname("hw.activecpu", &v16, &v15, 0, 0), v16 <= 1) ? (a2 = 1) : (a2 = v16),
        v12)
    || a2 == 1)
  {
    *(_QWORD *)(a1 + 160) = a3(0, a1, *(_QWORD *)(a1 + 168));
    LODWORD(v7) = 1;
  }
  else
  {
    v7 = a2;
    if (sub_19C250AA8(v6, a2, 0, 8u, 0))
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "tpThreadInit error");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    v8 = 0;
    for (i = 0; i != v7; ++i)
    {
      v10 = *(_QWORD *)(a1 + 24) + v8;
      *(_DWORD *)(v10 + 136) = 0;
      *(_QWORD *)(v10 + 152) = sub_19C227C20;
      v11 = *(_QWORD **)(v10 + 144);
      *v11 = a3(i, a1, *(_QWORD *)(a1 + 168));
      v8 += 184;
    }
  }
  *(_DWORD *)(a1 + 8) = v7;
  return a1;
}

void sub_19C227C0C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C227C20(_QWORD *a1)
{
  (*(void (**)(_QWORD))(*(_QWORD *)*a1 + 16))(*a1);
  return 0;
}

uint64_t sub_19C227C48(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  *(_QWORD *)a1 = &off_1E3D1E088;
  v2 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v2)
  {
    if (v2 == 1)
    {
      v3 = *(_QWORD *)(a1 + 160);
      if (v3)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
        return a1;
      }
    }
    else
    {
      v5 = 0;
      v6 = 144;
      do
      {
        v7 = *(_QWORD **)(*(_QWORD *)(a1 + 24) + v6);
        if (*v7)
        {
          (*(void (**)(_QWORD))(*(_QWORD *)*v7 + 8))(*v7);
          v2 = *(unsigned int *)(a1 + 8);
        }
        *v7 = 0;
        ++v5;
        v6 += 184;
      }
      while (v5 < v2);
      if (!*(_BYTE *)(a1 + 152))
        sub_19C250DD8((unsigned int *)(a1 + 16));
    }
  }
  return a1;
}

void sub_19C227D10(unsigned int *__p)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  *(_QWORD *)__p = &off_1E3D1E088;
  v2 = __p[2];
  if ((_DWORD)v2)
  {
    if (v2 == 1)
    {
      v3 = *((_QWORD *)__p + 20);
      if (v3)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
        operator delete(__p);
        return;
      }
    }
    else
    {
      v4 = 0;
      v5 = 144;
      do
      {
        v6 = *(_QWORD **)(*((_QWORD *)__p + 3) + v5);
        if (*v6)
        {
          (*(void (**)(_QWORD))(*(_QWORD *)*v6 + 8))(*v6);
          v2 = __p[2];
        }
        *v6 = 0;
        ++v4;
        v5 += 184;
      }
      while (v4 < v2);
      if (!*((_BYTE *)__p + 152))
        sub_19C250DD8(__p + 4);
    }
  }
  operator delete(__p);
}

uint64_t sub_19C227DD8(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  v2 = *(_DWORD *)(a1 + 8);
  if (v2 <= a2)
    return 0;
  if (v2 == 1)
    return *(_QWORD *)(a1 + 160);
  return **(_QWORD **)(*(_QWORD *)(a1 + 24) + 184 * a2 + 144);
}

uint64_t sub_19C227E18(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t result;

  v4 = *(_DWORD *)(a1 + 8);
  v5 = v4;
  if ((_DWORD)a2)
  {
    v5 = a2;
    if (v4 < a2)
      return 2;
  }
  if (!v4)
    return 3;
  if (v4 == 1)
  {
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 160) + 16))(*(_QWORD *)(a1 + 160), v5);
    return 0;
  }
  else
  {
    result = sub_19C250F20(a1 + 16, v5);
    if ((_DWORD)result || (result = sub_19C251070(a1 + 16), (_DWORD)result))
      *(_BYTE *)(a1 + 152) = 1;
  }
  return result;
}

void sub_19C228014(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_19C228330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_19C2283F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_19C228550(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_19C22877C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_19C228874(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C228884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

id sub_19C2288A8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v36 = v3;
  v8 = objc_msgSend_count(v3, v5, v6, v7);
  objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = v36;
  v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v37, (uint64_t)v41, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v38;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v38 != v18)
          objc_enumerationMutation(v12);
        v20 = (void *)MEMORY[0x1E0CB3880];
        v21 = *(_QWORD *)(a1 + 8);
        objc_msgSend_name(*(void **)(*((_QWORD *)&v37 + 1) + 8 * v19), v14, v15, v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_predicateWithFormat_(v20, v23, v21, v24, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_filteredSetUsingPredicate_(*(void **)a1, v26, (uint64_t)v25, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_anyObject(v28, v29, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
          objc_msgSend_addObject_(v11, v33, (uint64_t)v32, v34);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v37, (uint64_t)v41, 16);
    }
    while (v17);
  }

  return v11;
}

void sub_19C228A40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C228D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{

  _Unwind_Resume(a1);
}

void sub_19C228FA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_19C229018(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL4 v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v5 = (void *)objc_msgSend_mutableCopy(v1, v2, v3, v4);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v1;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v25, (uint64_t)v29, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend_dimension(v14, v8, v9, v10, (_QWORD)v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend_count(v15, v16, v17, v18) == 0;

        if (v19)
          objc_msgSend_removeObject_(v5, v8, (uint64_t)v14, v10);
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v25, (uint64_t)v29, 16);
    }
    while (v11);
  }

  v23 = (void *)objc_msgSend_copy(v5, v20, v21, v22);
  return v23;
}

void sub_19C229168(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C2294A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_19C2297C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_19C2299CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_19C229A18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19C229B30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C229B78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C229B8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C229D9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_19C229F58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C22A140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_19C22A370(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C22A40C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C22A4FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C22A54C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C22A59C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C22A5EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C22A6C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C22A6E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C22A7BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C22A7DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C22A884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C22A8A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C22A948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C22A964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C22AB68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t sub_19C22AC94(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *__src)
{
  uint64_t v7;
  uint64_t v8;
  void *__p[2];
  uint64_t v11;
  int v12;
  int64x2_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19C07C6E8(__p, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    v11 = *(_QWORD *)(a2 + 16);
  }
  sub_19C18E344(a1, (__int128 *)__p, a3, __src);
  if (SHIBYTE(v11) < 0)
    operator delete(__p[0]);
  *(_QWORD *)a1 = &unk_1E3D23688;
  *(_QWORD *)(a1 + 1016) = __src[7];
  *(_QWORD *)(a1 + 1024) = __src[56];
  *(_QWORD *)(a1 + 1032) = __src[72];
  *(_WORD *)(a1 + 1056) = 0;
  *(_BYTE *)(a1 + 1058) = 0;
  *(_DWORD *)(a1 + 1088) = 0;
  *(_QWORD *)(a1 + 1072) = 0;
  *(_QWORD *)(a1 + 1080) = 0;
  *(_QWORD *)(a1 + 1064) = 0;
  v7 = *((int *)__src + 32);
  v12 = 1;
  v13 = vdupq_n_s64(1uLL);
  v15 = 0;
  v16 = 0;
  v14 = v7;
  sub_19C07C964(a1 + 16, &v12, (int *)&v17);
  v8 = *((int *)__src + 64);
  v12 = 9;
  v13 = vdupq_n_s64(1uLL);
  v15 = 0;
  v16 = 0;
  v14 = v8;
  sub_19C07C964(a1 + 40, &v12, (int *)&v17);
  *(_DWORD *)(a1 + 1088) = *((_DWORD *)__src + 96);
  return a1;
}

void sub_19C22ADF8(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + 1064);
  if (v3)
  {
    *(_QWORD *)(v1 + 1072) = v3;
    operator delete(v3);
  }
  sub_19C18E518(v1);
  _Unwind_Resume(a1);
}

void sub_19C22AE24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C22AE44(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  v4 = (_QWORD *)a1[20];
  v5 = (_QWORD *)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31])
      return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 16))(a2, a1);
    goto LABEL_8;
  }
  do
  {
    if (*v4)
      (*(void (**)(_QWORD))(*(_QWORD *)*v4 + 8))(*v4);
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    v7 = a1[29];
    v6 = (uint64_t *)a1[30];
    v8 = *v6;
    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v7 + 8);
    **(_QWORD **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        v9 = (uint64_t *)v6[1];
        operator delete(v6);
        v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
  return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 16))(a2, a1);
}

int64x2_t sub_19C22AF08(uint64_t a1, int a2)
{
  char *v4;
  uint64_t **v5;
  uint64_t v6;
  char *v7;
  int v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  int64x2_t result;
  __int128 v13;
  int v14;
  int v15;
  char *v16;
  uint64_t **v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  char *v29;
  int v30;
  char *v31;
  uint64_t v32;
  uint64_t *v33;

  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 104))(a1) != 2)
  {
    if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 104))(a1))
    {
      if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 104))(a1) != 13)
        return result;
      v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1);
      v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 216))(a1, 1);
      v17 = (uint64_t **)(a1 + 48);
      v16 = *(char **)(a1 + 48);
      v18 = *(int *)(a1 + 568);
      v19 = v14;
      v20 = v15;
      if (v16)
      {
        while (1)
        {
          while (1)
          {
            v21 = v16;
            v22 = *((_DWORD *)v16 + 8);
            if (v22 <= a2)
              break;
            v16 = *(char **)v21;
            v17 = (uint64_t **)v21;
            if (!*(_QWORD *)v21)
              goto LABEL_32;
          }
          if (v22 >= a2)
            break;
          v16 = (char *)*((_QWORD *)v21 + 1);
          if (!v16)
            goto LABEL_31;
        }
LABEL_35:
        result = vdupq_n_s64(1uLL);
        *(int64x2_t *)(v21 + 40) = result;
        *((_QWORD *)v21 + 7) = v18;
        *((_QWORD *)v21 + 8) = v19;
        *((_QWORD *)v21 + 9) = v20;
        return result;
      }
    }
    else
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 16) + 40) != 1)
      {
        v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1);
        v24 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1);
        v25 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 216))(a1, 1);
        v26 = *(_QWORD *)(a1 + 16);
        *(int64x2_t *)(v26 + 40) = vdupq_n_s64(1uLL);
        *(_QWORD *)(v26 + 56) = v23;
        *(_QWORD *)(v26 + 64) = v24;
        *(_QWORD *)(v26 + 72) = v25;
      }
      v27 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1);
      v28 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 216))(a1, 1);
      v17 = (uint64_t **)(a1 + 48);
      v29 = *(char **)(a1 + 48);
      v18 = *(int *)(a1 + 568);
      v19 = v27;
      v20 = v28;
      if (v29)
      {
        while (1)
        {
          while (1)
          {
            v21 = v29;
            v30 = *((_DWORD *)v29 + 8);
            if (v30 <= a2)
              break;
            v29 = *(char **)v21;
            v17 = (uint64_t **)v21;
            if (!*(_QWORD *)v21)
              goto LABEL_32;
          }
          if (v30 >= a2)
            goto LABEL_35;
          v29 = (char *)*((_QWORD *)v21 + 1);
          if (!v29)
          {
LABEL_31:
            v17 = (uint64_t **)(v21 + 8);
            goto LABEL_32;
          }
        }
      }
    }
    v21 = (char *)v17;
LABEL_32:
    v31 = v21;
    v21 = (char *)operator new(0x50uLL);
    *((_DWORD *)v21 + 8) = a2;
    *(_OWORD *)(v21 + 40) = 0u;
    *(_OWORD *)(v21 + 56) = 0u;
    *((_QWORD *)v21 + 9) = 0;
    *(_QWORD *)v21 = 0;
    *((_QWORD *)v21 + 1) = 0;
    *((_QWORD *)v21 + 2) = v31;
    *v17 = (uint64_t *)v21;
    v32 = **(_QWORD **)(a1 + 40);
    v33 = (uint64_t *)v21;
    if (v32)
    {
      *(_QWORD *)(a1 + 40) = v32;
      v33 = *v17;
    }
    sub_19C07CC40(*(uint64_t **)(a1 + 48), v33);
    ++*(_QWORD *)(a1 + 56);
    goto LABEL_35;
  }
  v5 = (uint64_t **)(a1 + 48);
  v4 = *(char **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 16) + 40;
  if (v4)
  {
    while (1)
    {
      while (1)
      {
        v7 = v4;
        v8 = *((_DWORD *)v4 + 8);
        if (v8 <= a2)
          break;
        v4 = *(char **)v7;
        v5 = (uint64_t **)v7;
        if (!*(_QWORD *)v7)
          goto LABEL_9;
      }
      if (v8 >= a2)
        break;
      v4 = (char *)*((_QWORD *)v7 + 1);
      if (!v4)
      {
        v5 = (uint64_t **)(v7 + 8);
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = (char *)(a1 + 48);
LABEL_9:
    v9 = v7;
    v7 = (char *)operator new(0x50uLL);
    *((_DWORD *)v7 + 8) = a2;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 56) = 0u;
    *((_QWORD *)v7 + 9) = 0;
    *(_QWORD *)v7 = 0;
    *((_QWORD *)v7 + 1) = 0;
    *((_QWORD *)v7 + 2) = v9;
    *v5 = (uint64_t *)v7;
    v10 = **(_QWORD **)(a1 + 40);
    v11 = (uint64_t *)v7;
    if (v10)
    {
      *(_QWORD *)(a1 + 40) = v10;
      v11 = *v5;
    }
    sub_19C07CC40(*(uint64_t **)(a1 + 48), v11);
    ++*(_QWORD *)(a1 + 56);
  }
  result = *(int64x2_t *)v6;
  v13 = *(_OWORD *)(v6 + 16);
  *((_QWORD *)v7 + 9) = *(_QWORD *)(v6 + 32);
  *(_OWORD *)(v7 + 56) = v13;
  *(int64x2_t *)(v7 + 40) = result;
  return result;
}

void sub_19C22B21C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_19C18F9E0(a1, a2, a3);
  sub_19C22B240(a1);
}

void sub_19C22B240(uint64_t a1)
{
  uint64_t **v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  BOOL v32;
  BOOL v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t *v40;
  uint64_t *v41;
  int *v42;
  int v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  __int128 *v52;
  _OWORD *v53;
  __int128 v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  int v68;
  int v69;
  int v70;

  if (*(_BYTE *)(a1 + 1057))
  {
    v2 = sub_19C18FEB8(a1, 9);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)a1 + 168))(&v66, a1, 9);
    *v2 = (uint64_t *)((char *)*v2 - 4 * (int)v66 * v67 * v68 * v69 * v70);
    v3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 216))(a1, 1);
    v57 = (v3 - 1);
    if (v3 >= 1)
    {
      v60 = 4 * (v3 - 1);
      v61 = 0;
      v58 = v3;
      v59 = (v3 - 1);
      while (1)
      {
        v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, 9);
        v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1);
        v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1);
        v65 = (v6 - 1);
        if (v6 >= 1)
          break;
LABEL_4:
        --v59;
        v60 -= 4;
        if (++v61 == v58)
          goto LABEL_55;
      }
      v7 = 0;
      v8 = v4;
      v9 = v5;
      v10 = v59 * v4 * v5;
      v63 = (v61 - v57) * v8 * v5;
      v11 = v6;
      v64 = v10 - 1;
      v62 = v60 * v8 * v9;
      v12 = (v6 - 1);
      v13 = 4 * v12;
      while (1)
      {
        v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, 9);
        if (*(_BYTE *)(a1 + 1057))
        {
          v15 = *(_QWORD *)(a1 + 1064);
          if (*(_BYTE *)(a1 + 1056))
            v16 = *(_QWORD *)(v15 + 8);
          else
            v16 = (*(_QWORD *)(a1 + 1072) - v15) >> 3;
        }
        else
        {
          LODWORD(v16) = *(_DWORD *)(a1 + 568);
        }
        v17 = v14;
        v18 = v12 * v14;
        v19 = v18 + v10;
        v20 = (int)v16;
        v21 = *(uint64_t **)(a1 + 1072);
        v22 = *(uint64_t **)(a1 + 1064);
        if (!*(_BYTE *)(a1 + 1056))
        {
          v38 = (char *)v21 - (char *)v22;
          if (v21 != v22)
          {
            if (v38 >= 1)
            {
              v39 = (unint64_t)v38 >> 3;
              v40 = *v2;
              v41 = v22 - 1;
              v42 = (int *)*v2 + v10 + v39 + v12 * v20 - 1;
              do
              {
                v43 = *v42--;
                *((_DWORD *)v40 + v41[v39] + v19) = v43;
                v32 = v39-- > 1;
              }
              while (v32);
            }
            if ((*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, 9) >= 1)
            {
              v44 = 0;
              v45 = 0;
              v46 = v62 + v13 * v17;
              do
              {
                v47 = *(_QWORD *)(a1 + 1064);
                if (v45 < (*(_QWORD *)(a1 + 1072) - v47) >> 3 && v44 == *(_QWORD *)(v47 + 8 * v45))
                  ++v45;
                else
                  *(_DWORD *)((char *)*v2 + 4 * v44 + v46) = 0;
                ++v44;
              }
              while (v44 < (*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, 9));
            }
          }
          goto LABEL_7;
        }
        if ((char *)v21 - (char *)v22 == 16)
          break;
LABEL_7:
        --v12;
        ++v7;
        v13 -= 4;
        if (v7 == v11)
          goto LABEL_4;
      }
      v23 = *v22;
      v24 = v22[1];
      v25 = *v22 + v19;
      v26 = v25 + v24;
      if (v24 >= 1)
      {
        v27 = v24 + v10 + v12 * v20;
        v28 = *v2;
        v29 = v64 + v24 + v23 + v18;
        if (v29 >= v25)
          v30 = v25;
        else
          v30 = v64 + v24 + v23 + v18;
        v31 = v10 + v24 + v23 + v18 - v30;
        if (v31 >= 0x30
          && ((char *)v28 + 4 * v26 + -4 * (v29 - v30) - 4 <= (char *)v28 + 4 * v26 - 4
            ? (v32 = (char *)v28 + 4 * v27 + -4 * (v29 - v30) - 4 > (char *)v28 + 4 * v27 - 4)
            : (v32 = 1),
              !v32 ? (v33 = (unint64_t)(v29 - v30) >> 62 == 0) : (v33 = 0),
              v33))
        {
          v34 = v25 + v24;
          if ((unint64_t)(4 * v27 - 4 * v26) >= 0x20)
          {
            v34 = v26 - (v31 & 0xFFFFFFFFFFFFFFF8);
            v27 -= v31 & 0xFFFFFFFFFFFFFFF8;
            v48 = v10 + v24;
            v49 = v10 + v24 + v23 + v18;
            v50 = v64 + v24 + v23 + v18;
            if (v50 >= v10 + v23 + v18)
              v50 = v10 + v23 + v18;
            v51 = (v49 - v50) & 0xFFFFFFFFFFFFFFF8;
            v52 = (__int128 *)((char *)v28 + 4 * v48 + 4 * v12 * v20 - 16);
            v53 = (_OWORD *)((char *)v28 + 4 * v49 - 16);
            do
            {
              v54 = *v52;
              *(v53 - 1) = *(v52 - 1);
              *v53 = v54;
              v52 -= 2;
              v53 -= 2;
              v51 -= 8;
            }
            while (v51);
            if (v31 == (v31 & 0xFFFFFFFFFFFFFFF8))
              goto LABEL_30;
          }
        }
        else
        {
          v34 = v25 + v24;
        }
        v35 = (char *)v28 - 4;
        v36 = 4 * v27;
        do
        {
          *(_DWORD *)&v35[4 * v34] = *(_DWORD *)&v35[v36];
          v36 -= 4;
          --v34;
        }
        while (v34 > v25);
      }
LABEL_30:
      if (v23 >= 1)
      {
        v37 = v10 + 1 + v18;
        if (v25 > v37)
          v37 = v25;
        bzero((char *)*v2 + 4 * v19, 4 * (v63 + v37 + (v7 - v65) * v17));
      }
      while (v26 < v19 + (*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, 9))
        *((_DWORD *)*v2 + v26++) = 0;
      goto LABEL_7;
    }
LABEL_55:
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)a1 + 168))(&v66, a1, 9);
    *v2 = (uint64_t *)((char *)*v2 + 4 * (int)v66 * v67 * v68 * v69 * v70);
    *(_QWORD *)(a1 + 1072) = *(_QWORD *)(a1 + 1064);
    if (!*(_BYTE *)(a1 + 1056))
    {
      v55 = *(void **)(a1 + 1040);
      if (v55)
        operator delete[](v55);
      v56 = *(void **)(a1 + 1048);
      if (v56)
        operator delete[](v56);
    }
    *(_WORD *)(a1 + 1056) = 0;
    *(_BYTE *)(a1 + 1058) = 1;
  }
}

uint64_t sub_19C22B760(uint64_t a1, char **a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char *v9;
  char *v10;
  uint64_t v12;
  std::runtime_error *exception;

  v7 = *(_QWORD *)*a2;
  v6 = *((_QWORD *)*a2 + 1);
  if (v6 >= 1)
  {
    v8 = v6 + v7 > (*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, 9);
    v10 = *a2;
    v9 = a2[1];
    if ((a3 & 1) != 0)
      goto LABEL_3;
LABEL_12:
    if (v9 != v10)
    {
      while ((*(_QWORD *)v10 & 0x8000000000000000) == 0)
      {
        v12 = *(_QWORD *)v10;
        if (v12 >= (*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, 9))
          break;
        v10 += 8;
        if (v10 == v9)
          goto LABEL_16;
      }
    }
LABEL_19:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid rangeOrIndices for partial output. ");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v8 = 1;
  v10 = *a2;
  v9 = a2[1];
  if ((a3 & 1) == 0)
    goto LABEL_12;
LABEL_3:
  if (v9 - v10 != 16 || v7 < 0)
    v8 = 1;
  if (v8)
    goto LABEL_19;
LABEL_16:
  if ((char **)(a1 + 1064) != a2)
    sub_19C11EAD0((_QWORD *)(a1 + 1064), *a2, a2[1], (a2[1] - *a2) >> 3);
  *(_BYTE *)(a1 + 1056) = a3;
  sub_19C22B8A4(a1);
  *(_WORD *)(a1 + 1057) = 257;
  return 1;
}

void sub_19C22B890(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

float sub_19C22B8A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  float result;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  int v11;
  uint64_t v12;

  if (*(_BYTE *)(a1 + 1056))
  {
    v2 = **(_QWORD **)(a1 + 1064);
    v3 = *(_QWORD *)(a1 + 1024);
    *(_QWORD *)(a1 + 1040) = v3 + 4 * v2 * (*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1);
    *(_QWORD *)(a1 + 1048) = *(_QWORD *)(a1 + 1032) + 4 * v2;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1);
    *(_QWORD *)(a1 + 1040) = operator new[]();
    *(_QWORD *)(a1 + 1048) = operator new[]();
    if (*(_QWORD *)(a1 + 1072) != *(_QWORD *)(a1 + 1064))
    {
      v5 = 0;
      do
      {
        v6 = *(_QWORD *)(a1 + 1040);
        v7 = (void *)(v6 + 4 * v5 * (*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1));
        v8 = *(_QWORD *)(a1 + 1024);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 1064) + 8 * v5);
        v10 = (const void *)(v8 + 4 * v9 * (*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1));
        v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1);
        memcpy(v7, v10, 4 * v11);
        v12 = *(_QWORD *)(a1 + 1064);
        result = *(float *)(*(_QWORD *)(a1 + 1032) + 4 * *(_QWORD *)(v12 + 8 * v5));
        *(float *)(*(_QWORD *)(a1 + 1048) + 4 * v5++) = result;
      }
      while (v5 < (*(_QWORD *)(a1 + 1072) - v12) >> 3);
    }
  }
  return result;
}

uint64_t sub_19C22BA64(uint64_t a1)
{
  uint64_t v1;

  if (!*(_BYTE *)(a1 + 1057))
    return *(unsigned int *)(a1 + 568);
  v1 = *(_QWORD *)(a1 + 1064);
  if (*(_BYTE *)(a1 + 1056))
    return *(_QWORD *)(v1 + 8);
  else
    return (*(_QWORD *)(a1 + 1072) - v1) >> 3;
}

BOOL sub_19C22BA98(uint64_t **a1, _QWORD *a2, int a3)
{
  char *v6;
  uint64_t **v7;
  uint64_t **v8;
  char *v9;
  int v10;
  char *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t **v15;
  char *v16;
  int v17;
  char *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  char *v22;
  int v24;
  char *v25;
  uint64_t *v26;
  uint64_t *v27;
  _OWORD v28[44];

  if ((a3 - 8) < 0xFFFFFFF9)
  {
    if ((a3 - 12) >= 0xFFFFFFFD)
    {
      memset(v28, 0, 512);
      ((void (*)(_OWORD *__return_ptr, uint64_t **))(*a1)[19])(v28, a1);
      if (!((uint64_t (*)(uint64_t **))(*a1)[13])(a1) && (*((_BYTE *)a1 + 1058) || *((_BYTE *)a1 + 1057)))
      {
        *((_BYTE *)a1 + 1058) = 0;
        return 1;
      }
    }
    return 0;
  }
  if (((uint64_t (*)(uint64_t **))(*a1)[13])(a1) != 2)
    return 0;
  v7 = a1 + 3;
  v6 = (char *)a1[3];
  v8 = a1 + 3;
  v9 = (char *)(a1 + 3);
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        v9 = v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v10 <= a3)
          break;
        v6 = *(char **)v9;
        v8 = (uint64_t **)v9;
        if (!*(_QWORD *)v9)
          goto LABEL_15;
      }
      if (v10 >= a3)
        break;
      v6 = (char *)*((_QWORD *)v9 + 1);
      if (!v6)
      {
        v8 = (uint64_t **)(v9 + 8);
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    v11 = v9;
    v9 = (char *)operator new(0x50uLL);
    *((_DWORD *)v9 + 8) = a3;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *((_QWORD *)v9 + 9) = 0;
    *(_QWORD *)v9 = 0;
    *((_QWORD *)v9 + 1) = 0;
    *((_QWORD *)v9 + 2) = v11;
    *v8 = (uint64_t *)v9;
    v12 = (uint64_t *)*a1[2];
    v13 = (uint64_t *)v9;
    if (v12)
    {
      a1[2] = v12;
      v13 = *v8;
    }
    sub_19C07CC40(a1[3], v13);
    a1[4] = (uint64_t *)((char *)a1[4] + 1);
  }
  if (*((_QWORD *)v9 + 5) != *a2)
    return 1;
  v14 = *v7;
  v15 = a1 + 3;
  v16 = (char *)(a1 + 3);
  if (*v7)
  {
    while (1)
    {
      while (1)
      {
        v16 = (char *)v14;
        v17 = *((_DWORD *)v14 + 8);
        if (v17 <= a3)
          break;
        v14 = *(uint64_t **)v16;
        v15 = (uint64_t **)v16;
        if (!*(_QWORD *)v16)
          goto LABEL_26;
      }
      if (v17 >= a3)
        break;
      v14 = (uint64_t *)*((_QWORD *)v16 + 1);
      if (!v14)
      {
        v15 = (uint64_t **)(v16 + 8);
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:
    v18 = v16;
    v16 = (char *)operator new(0x50uLL);
    *((_DWORD *)v16 + 8) = a3;
    *(_OWORD *)(v16 + 40) = 0u;
    *(_OWORD *)(v16 + 56) = 0u;
    *((_QWORD *)v16 + 9) = 0;
    *(_QWORD *)v16 = 0;
    *((_QWORD *)v16 + 1) = 0;
    *((_QWORD *)v16 + 2) = v18;
    *v15 = (uint64_t *)v16;
    v19 = (uint64_t *)*a1[2];
    v20 = (uint64_t *)v16;
    if (v19)
    {
      a1[2] = v19;
      v20 = *v15;
    }
    sub_19C07CC40(a1[3], v20);
    a1[4] = (uint64_t *)((char *)a1[4] + 1);
  }
  if (*((_QWORD *)v16 + 6) != a2[1])
    return 1;
  v21 = *v7;
  v22 = (char *)(a1 + 3);
  if (*v7)
  {
    while (1)
    {
      while (1)
      {
        v22 = (char *)v21;
        v24 = *((_DWORD *)v21 + 8);
        if (v24 <= a3)
          break;
        v21 = *(uint64_t **)v22;
        v7 = (uint64_t **)v22;
        if (!*(_QWORD *)v22)
          goto LABEL_38;
      }
      if (v24 >= a3)
        break;
      v21 = (uint64_t *)*((_QWORD *)v22 + 1);
      if (!v21)
      {
        v7 = (uint64_t **)(v22 + 8);
        goto LABEL_38;
      }
    }
  }
  else
  {
LABEL_38:
    v25 = v22;
    v22 = (char *)operator new(0x50uLL);
    *((_DWORD *)v22 + 8) = a3;
    *(_OWORD *)(v22 + 40) = 0u;
    *(_OWORD *)(v22 + 56) = 0u;
    *((_QWORD *)v22 + 9) = 0;
    *(_QWORD *)v22 = 0;
    *((_QWORD *)v22 + 1) = 0;
    *((_QWORD *)v22 + 2) = v25;
    *v7 = (uint64_t *)v22;
    v26 = (uint64_t *)*a1[2];
    v27 = (uint64_t *)v22;
    if (v26)
    {
      a1[2] = v26;
      v27 = *v7;
    }
    sub_19C07CC40(a1[3], v27);
    a1[4] = (uint64_t *)((char *)a1[4] + 1);
  }
  return *((_QWORD *)v22 + 7) != a2[2];
}

uint64_t sub_19C22BDA4(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *__src)
{
  uint64_t v7;
  uint64_t v8;
  void *__p[2];
  uint64_t v11;
  int v12;
  int64x2_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19C07C6E8(__p, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    v11 = *(_QWORD *)(a2 + 16);
  }
  sub_19C19065C(a1, (__int128 *)__p, a3, __src);
  if (SHIBYTE(v11) < 0)
    operator delete(__p[0]);
  *(_QWORD *)a1 = &unk_1E3D23518;
  *(_QWORD *)(a1 + 1016) = __src[7];
  *(_QWORD *)(a1 + 1024) = __src[56];
  *(_QWORD *)(a1 + 1032) = __src[72];
  *(_WORD *)(a1 + 1056) = 0;
  *(_BYTE *)(a1 + 1058) = 0;
  *(_DWORD *)(a1 + 1088) = 0;
  *(_QWORD *)(a1 + 1072) = 0;
  *(_QWORD *)(a1 + 1080) = 0;
  *(_QWORD *)(a1 + 1064) = 0;
  v7 = *((int *)__src + 32);
  v12 = 1;
  v13 = vdupq_n_s64(1uLL);
  v15 = 0;
  v16 = 0;
  v14 = v7;
  sub_19C07C964(a1 + 16, &v12, (int *)&v17);
  v8 = *((int *)__src + 64);
  v12 = 9;
  v13 = vdupq_n_s64(1uLL);
  v15 = 0;
  v16 = 0;
  v14 = v8;
  sub_19C07C964(a1 + 40, &v12, (int *)&v17);
  *(_DWORD *)(a1 + 1088) = *((_DWORD *)__src + 96);
  return a1;
}

void sub_19C22BF08(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + 1064);
  if (v3)
  {
    *(_QWORD *)(v1 + 1072) = v3;
    operator delete(v3);
  }
  sub_19C190830(v1);
  _Unwind_Resume(a1);
}

void sub_19C22BF34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C22BF54(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  v4 = (_QWORD *)a1[20];
  v5 = (_QWORD *)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31])
      return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 120))(a2, a1);
    goto LABEL_8;
  }
  do
  {
    if (*v4)
      (*(void (**)(_QWORD))(*(_QWORD *)*v4 + 8))(*v4);
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    v7 = a1[29];
    v6 = (uint64_t *)a1[30];
    v8 = *v6;
    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v7 + 8);
    **(_QWORD **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        v9 = (uint64_t *)v6[1];
        operator delete(v6);
        v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
  return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 120))(a2, a1);
}

int64x2_t sub_19C22C018(uint64_t a1, int a2)
{
  char *v4;
  uint64_t **v5;
  uint64_t v6;
  char *v7;
  int v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  int64x2_t result;
  __int128 v13;
  int v14;
  int v15;
  char *v16;
  uint64_t **v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  char *v29;
  int v30;
  char *v31;
  uint64_t v32;
  uint64_t *v33;

  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 104))(a1) != 2)
  {
    if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 104))(a1))
    {
      if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 104))(a1) != 13)
        return result;
      v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1);
      v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 216))(a1, 1);
      v17 = (uint64_t **)(a1 + 48);
      v16 = *(char **)(a1 + 48);
      v18 = *(int *)(a1 + 568);
      v19 = v14;
      v20 = v15;
      if (v16)
      {
        while (1)
        {
          while (1)
          {
            v21 = v16;
            v22 = *((_DWORD *)v16 + 8);
            if (v22 <= a2)
              break;
            v16 = *(char **)v21;
            v17 = (uint64_t **)v21;
            if (!*(_QWORD *)v21)
              goto LABEL_32;
          }
          if (v22 >= a2)
            break;
          v16 = (char *)*((_QWORD *)v21 + 1);
          if (!v16)
            goto LABEL_31;
        }
LABEL_35:
        result = vdupq_n_s64(1uLL);
        *(int64x2_t *)(v21 + 40) = result;
        *((_QWORD *)v21 + 7) = v18;
        *((_QWORD *)v21 + 8) = v19;
        *((_QWORD *)v21 + 9) = v20;
        return result;
      }
    }
    else
    {
      if (*(_QWORD *)(*(_QWORD *)(a1 + 16) + 40) != 1)
      {
        v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1);
        v24 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1);
        v25 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 216))(a1, 1);
        v26 = *(_QWORD *)(a1 + 16);
        *(int64x2_t *)(v26 + 40) = vdupq_n_s64(1uLL);
        *(_QWORD *)(v26 + 56) = v23;
        *(_QWORD *)(v26 + 64) = v24;
        *(_QWORD *)(v26 + 72) = v25;
      }
      v27 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1);
      v28 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 216))(a1, 1);
      v17 = (uint64_t **)(a1 + 48);
      v29 = *(char **)(a1 + 48);
      v18 = *(int *)(a1 + 568);
      v19 = v27;
      v20 = v28;
      if (v29)
      {
        while (1)
        {
          while (1)
          {
            v21 = v29;
            v30 = *((_DWORD *)v29 + 8);
            if (v30 <= a2)
              break;
            v29 = *(char **)v21;
            v17 = (uint64_t **)v21;
            if (!*(_QWORD *)v21)
              goto LABEL_32;
          }
          if (v30 >= a2)
            goto LABEL_35;
          v29 = (char *)*((_QWORD *)v21 + 1);
          if (!v29)
          {
LABEL_31:
            v17 = (uint64_t **)(v21 + 8);
            goto LABEL_32;
          }
        }
      }
    }
    v21 = (char *)v17;
LABEL_32:
    v31 = v21;
    v21 = (char *)operator new(0x50uLL);
    *((_DWORD *)v21 + 8) = a2;
    *(_OWORD *)(v21 + 40) = 0u;
    *(_OWORD *)(v21 + 56) = 0u;
    *((_QWORD *)v21 + 9) = 0;
    *(_QWORD *)v21 = 0;
    *((_QWORD *)v21 + 1) = 0;
    *((_QWORD *)v21 + 2) = v31;
    *v17 = (uint64_t *)v21;
    v32 = **(_QWORD **)(a1 + 40);
    v33 = (uint64_t *)v21;
    if (v32)
    {
      *(_QWORD *)(a1 + 40) = v32;
      v33 = *v17;
    }
    sub_19C07CC40(*(uint64_t **)(a1 + 48), v33);
    ++*(_QWORD *)(a1 + 56);
    goto LABEL_35;
  }
  v5 = (uint64_t **)(a1 + 48);
  v4 = *(char **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 16) + 40;
  if (v4)
  {
    while (1)
    {
      while (1)
      {
        v7 = v4;
        v8 = *((_DWORD *)v4 + 8);
        if (v8 <= a2)
          break;
        v4 = *(char **)v7;
        v5 = (uint64_t **)v7;
        if (!*(_QWORD *)v7)
          goto LABEL_9;
      }
      if (v8 >= a2)
        break;
      v4 = (char *)*((_QWORD *)v7 + 1);
      if (!v4)
      {
        v5 = (uint64_t **)(v7 + 8);
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = (char *)(a1 + 48);
LABEL_9:
    v9 = v7;
    v7 = (char *)operator new(0x50uLL);
    *((_DWORD *)v7 + 8) = a2;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 56) = 0u;
    *((_QWORD *)v7 + 9) = 0;
    *(_QWORD *)v7 = 0;
    *((_QWORD *)v7 + 1) = 0;
    *((_QWORD *)v7 + 2) = v9;
    *v5 = (uint64_t *)v7;
    v10 = **(_QWORD **)(a1 + 40);
    v11 = (uint64_t *)v7;
    if (v10)
    {
      *(_QWORD *)(a1 + 40) = v10;
      v11 = *v5;
    }
    sub_19C07CC40(*(uint64_t **)(a1 + 48), v11);
    ++*(_QWORD *)(a1 + 56);
  }
  result = *(int64x2_t *)v6;
  v13 = *(_OWORD *)(v6 + 16);
  *((_QWORD *)v7 + 9) = *(_QWORD *)(v6 + 32);
  *(_OWORD *)(v7 + 56) = v13;
  *(int64x2_t *)(v7 + 40) = result;
  return result;
}

void sub_19C22C32C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_19C191B48(a1, a2, a3);
  sub_19C22B240(a1);
}

uint64_t sub_19C22C350(uint64_t a1, char **a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char *v9;
  char *v10;
  uint64_t v12;
  std::runtime_error *exception;

  v7 = *(_QWORD *)*a2;
  v6 = *((_QWORD *)*a2 + 1);
  if (v6 >= 1)
  {
    v8 = v6 + v7 > (*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, 9);
    v10 = *a2;
    v9 = a2[1];
    if ((a3 & 1) != 0)
      goto LABEL_3;
LABEL_12:
    if (v9 != v10)
    {
      while ((*(_QWORD *)v10 & 0x8000000000000000) == 0)
      {
        v12 = *(_QWORD *)v10;
        if (v12 >= (*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, 9))
          break;
        v10 += 8;
        if (v10 == v9)
          goto LABEL_16;
      }
    }
LABEL_19:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid rangeOrIndices for partial output. ");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v8 = 1;
  v10 = *a2;
  v9 = a2[1];
  if ((a3 & 1) == 0)
    goto LABEL_12;
LABEL_3:
  if (v9 - v10 != 16 || v7 < 0)
    v8 = 1;
  if (v8)
    goto LABEL_19;
LABEL_16:
  if ((char **)(a1 + 1064) != a2)
    sub_19C11EAD0((_QWORD *)(a1 + 1064), *a2, a2[1], (a2[1] - *a2) >> 3);
  *(_BYTE *)(a1 + 1056) = a3;
  sub_19C22C494(a1);
  *(_WORD *)(a1 + 1057) = 257;
  return 1;
}

void sub_19C22C480(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

float sub_19C22C494(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  float result;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  int v11;
  uint64_t v12;

  if (*(_BYTE *)(a1 + 1056))
  {
    v2 = **(_QWORD **)(a1 + 1064);
    v3 = *(_QWORD *)(a1 + 1024);
    *(_QWORD *)(a1 + 1040) = v3 + v2 * (*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1);
    *(_QWORD *)(a1 + 1048) = *(_QWORD *)(a1 + 1032) + 4 * v2;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1);
    *(_QWORD *)(a1 + 1040) = operator new[]();
    *(_QWORD *)(a1 + 1048) = operator new[]();
    if (*(_QWORD *)(a1 + 1072) != *(_QWORD *)(a1 + 1064))
    {
      v5 = 0;
      do
      {
        v6 = *(_QWORD *)(a1 + 1040);
        v7 = (void *)(v6 + v5 * (*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1));
        v8 = *(_QWORD *)(a1 + 1024);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 1064) + 8 * v5);
        v10 = (const void *)(v8 + v9 * (*(int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1));
        v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, 1);
        memcpy(v7, v10, v11);
        v12 = *(_QWORD *)(a1 + 1064);
        result = *(float *)(*(_QWORD *)(a1 + 1032) + 4 * *(_QWORD *)(v12 + 8 * v5));
        *(float *)(*(_QWORD *)(a1 + 1048) + 4 * v5++) = result;
      }
      while (v5 < (*(_QWORD *)(a1 + 1072) - v12) >> 3);
    }
  }
  return result;
}

BOOL sub_19C22C638(uint64_t **a1, _QWORD *a2, int a3)
{
  char *v6;
  uint64_t **v7;
  uint64_t **v8;
  char *v9;
  int v10;
  char *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t **v15;
  char *v16;
  int v17;
  char *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  char *v22;
  int v24;
  char *v25;
  uint64_t *v26;
  uint64_t *v27;
  _OWORD v28[44];

  if ((a3 - 8) < 0xFFFFFFF9)
  {
    if ((a3 - 12) >= 0xFFFFFFFD)
    {
      memset(v28, 0, 512);
      ((void (*)(_OWORD *__return_ptr, uint64_t **))(*a1)[19])(v28, a1);
      if (!((uint64_t (*)(uint64_t **))(*a1)[13])(a1) && (*((_BYTE *)a1 + 1058) || *((_BYTE *)a1 + 1057)))
      {
        *((_BYTE *)a1 + 1058) = 0;
        return 1;
      }
    }
    return 0;
  }
  if (((uint64_t (*)(uint64_t **))(*a1)[13])(a1) != 2)
    return 0;
  v7 = a1 + 3;
  v6 = (char *)a1[3];
  v8 = a1 + 3;
  v9 = (char *)(a1 + 3);
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        v9 = v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v10 <= a3)
          break;
        v6 = *(char **)v9;
        v8 = (uint64_t **)v9;
        if (!*(_QWORD *)v9)
          goto LABEL_15;
      }
      if (v10 >= a3)
        break;
      v6 = (char *)*((_QWORD *)v9 + 1);
      if (!v6)
      {
        v8 = (uint64_t **)(v9 + 8);
        goto LABEL_15;
      }
    }
  }
  else
  {
LABEL_15:
    v11 = v9;
    v9 = (char *)operator new(0x50uLL);
    *((_DWORD *)v9 + 8) = a3;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *((_QWORD *)v9 + 9) = 0;
    *(_QWORD *)v9 = 0;
    *((_QWORD *)v9 + 1) = 0;
    *((_QWORD *)v9 + 2) = v11;
    *v8 = (uint64_t *)v9;
    v12 = (uint64_t *)*a1[2];
    v13 = (uint64_t *)v9;
    if (v12)
    {
      a1[2] = v12;
      v13 = *v8;
    }
    sub_19C07CC40(a1[3], v13);
    a1[4] = (uint64_t *)((char *)a1[4] + 1);
  }
  if (*((_QWORD *)v9 + 5) != *a2)
    return 1;
  v14 = *v7;
  v15 = a1 + 3;
  v16 = (char *)(a1 + 3);
  if (*v7)
  {
    while (1)
    {
      while (1)
      {
        v16 = (char *)v14;
        v17 = *((_DWORD *)v14 + 8);
        if (v17 <= a3)
          break;
        v14 = *(uint64_t **)v16;
        v15 = (uint64_t **)v16;
        if (!*(_QWORD *)v16)
          goto LABEL_26;
      }
      if (v17 >= a3)
        break;
      v14 = (uint64_t *)*((_QWORD *)v16 + 1);
      if (!v14)
      {
        v15 = (uint64_t **)(v16 + 8);
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:
    v18 = v16;
    v16 = (char *)operator new(0x50uLL);
    *((_DWORD *)v16 + 8) = a3;
    *(_OWORD *)(v16 + 40) = 0u;
    *(_OWORD *)(v16 + 56) = 0u;
    *((_QWORD *)v16 + 9) = 0;
    *(_QWORD *)v16 = 0;
    *((_QWORD *)v16 + 1) = 0;
    *((_QWORD *)v16 + 2) = v18;
    *v15 = (uint64_t *)v16;
    v19 = (uint64_t *)*a1[2];
    v20 = (uint64_t *)v16;
    if (v19)
    {
      a1[2] = v19;
      v20 = *v15;
    }
    sub_19C07CC40(a1[3], v20);
    a1[4] = (uint64_t *)((char *)a1[4] + 1);
  }
  if (*((_QWORD *)v16 + 6) != a2[1])
    return 1;
  v21 = *v7;
  v22 = (char *)(a1 + 3);
  if (*v7)
  {
    while (1)
    {
      while (1)
      {
        v22 = (char *)v21;
        v24 = *((_DWORD *)v21 + 8);
        if (v24 <= a3)
          break;
        v21 = *(uint64_t **)v22;
        v7 = (uint64_t **)v22;
        if (!*(_QWORD *)v22)
          goto LABEL_38;
      }
      if (v24 >= a3)
        break;
      v21 = (uint64_t *)*((_QWORD *)v22 + 1);
      if (!v21)
      {
        v7 = (uint64_t **)(v22 + 8);
        goto LABEL_38;
      }
    }
  }
  else
  {
LABEL_38:
    v25 = v22;
    v22 = (char *)operator new(0x50uLL);
    *((_DWORD *)v22 + 8) = a3;
    *(_OWORD *)(v22 + 40) = 0u;
    *(_OWORD *)(v22 + 56) = 0u;
    *((_QWORD *)v22 + 9) = 0;
    *(_QWORD *)v22 = 0;
    *((_QWORD *)v22 + 1) = 0;
    *((_QWORD *)v22 + 2) = v25;
    *v7 = (uint64_t *)v22;
    v26 = (uint64_t *)*a1[2];
    v27 = (uint64_t *)v22;
    if (v26)
    {
      a1[2] = v26;
      v27 = *v7;
    }
    sub_19C07CC40(a1[3], v27);
    a1[4] = (uint64_t *)((char *)a1[4] + 1);
  }
  return *((_QWORD *)v22 + 7) != a2[2];
}

uint64_t sub_19C22C944(_QWORD *a1)
{
  void *v2;

  *a1 = &unk_1E3D23688;
  v2 = (void *)a1[133];
  if (v2)
  {
    a1[134] = v2;
    operator delete(v2);
  }
  return sub_19C18E518((uint64_t)a1);
}

void sub_19C22C984(_QWORD *a1)
{
  void *v2;
  void *v3;

  *a1 = &unk_1E3D23688;
  v2 = (void *)a1[133];
  if (v2)
  {
    a1[134] = v2;
    operator delete(v2);
  }
  v3 = (void *)sub_19C18E518((uint64_t)a1);
  operator delete(v3);
}

uint64_t sub_19C22C9C8(_QWORD *a1)
{
  void *v2;

  *a1 = &unk_1E3D23518;
  v2 = (void *)a1[133];
  if (v2)
  {
    a1[134] = v2;
    operator delete(v2);
  }
  return sub_19C190830((uint64_t)a1);
}

void sub_19C22CA08(_QWORD *a1)
{
  void *v2;
  void *v3;

  *a1 = &unk_1E3D23518;
  v2 = (void *)a1[133];
  if (v2)
  {
    a1[134] = v2;
    operator delete(v2);
  }
  v3 = (void *)sub_19C190830((uint64_t)a1);
  operator delete(v3);
}

vImage_Error sub_19C22CA4C(void *a1, void *a2, vImagePixelCount a3)
{
  vImage_Buffer v4;
  vImage_Buffer dest;

  dest.data = a2;
  dest.height = 1;
  dest.width = a3;
  dest.rowBytes = 2 * a3;
  v4.data = a1;
  v4.height = 1;
  v4.width = a3;
  v4.rowBytes = 4 * a3;
  return vImageConvert_PlanarFtoPlanar16F(&v4, &dest, 0);
}

vImage_Error sub_19C22CA90(void *a1, void *a2, vImagePixelCount a3)
{
  vImage_Buffer v4;
  vImage_Buffer src;

  src.data = a1;
  src.height = 1;
  src.width = a3;
  src.rowBytes = 2 * a3;
  v4.data = a2;
  v4.height = 1;
  v4.width = a3;
  v4.rowBytes = 4 * a3;
  return vImageConvert_Planar16FtoPlanarF(&src, &v4, 0);
}

float *sub_19C22CAD4(float *result, _BYTE *a2, uint64_t a3, float a4)
{
  int v4;
  float v5;

  for (; a3; --a3)
  {
    v5 = *result;
    if (*result <= (float)-a4)
    {
      LOBYTE(v4) = -127;
    }
    else if (v5 < a4 && (v4 = llroundf((float)(v5 * 128.0) * (float)(1.0 / a4)), v4 <= 127))
    {
      if (v4 <= -127)
        LOBYTE(v4) = -127;
    }
    else
    {
      LOBYTE(v4) = 127;
    }
    *a2++ = v4;
    ++result;
  }
  return result;
}

uint64_t sub_19C22CB44(uint64_t a1)
{
  *(_QWORD *)a1 = off_1E3D1FEE0;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 8), 0);
  return a1;
}

uint64_t sub_19C22CB78(uint64_t a1)
{
  *(_QWORD *)a1 = off_1E3D1FEE0;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
  return a1;
}

void sub_19C22CBAC(char *a1)
{
  *(_QWORD *)a1 = off_1E3D1FEE0;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
  operator delete(a1);
}

uint64_t sub_19C22CBE0(uint64_t a1)
{
  return pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
}

uint64_t sub_19C22CBE8(uint64_t a1)
{
  return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
}

void sub_19C22CE1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v9 = v7;

  _Unwind_Resume(a1);
}

void sub_19C22CF8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_19C22CFBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C22D01C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t sub_19C22D060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)a1 = &unk_1E3D248B8;
  *(_QWORD *)(a1 + 8) = a2;
  sub_19C19D418(a1 + 16, a3);
  v15 = *(_QWORD *)(a4 + 24);
  if (!v15)
    goto LABEL_4;
  if (v15 != a4)
  {
    v15 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v15 + 16))(v15);
LABEL_4:
    *(_QWORD *)(a1 + 160) = v15;
    goto LABEL_6;
  }
  *(_QWORD *)(a1 + 160) = a1 + 136;
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a4 + 24) + 24))(*(_QWORD *)(a4 + 24), a1 + 136);
LABEL_6:
  v16 = *(_QWORD *)(a5 + 24);
  if (v16)
  {
    if (v16 == a5)
    {
      *(_QWORD *)(a1 + 192) = a1 + 168;
      (*(void (**)(_QWORD))(**(_QWORD **)(a5 + 24) + 24))(*(_QWORD *)(a5 + 24));
      goto LABEL_11;
    }
    v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 16))(v16);
  }
  *(_QWORD *)(a1 + 192) = v16;
LABEL_11:
  *(_QWORD *)(a1 + 200) = a6;
  *(_QWORD *)(a1 + 208) = a7;
  *(_QWORD *)(a1 + 216) = a8;
  *(_DWORD *)(a1 + 224) = *(_DWORD *)a9;
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a9 + 8);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a9 + 16);
  *(_DWORD *)(a1 + 248) = 0;
  return a1;
}

void sub_19C22D170(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v5;
  uint64_t v6;

  v5 = *(_QWORD **)(v1 + 160);
  if (v5 == v3)
  {
    v6 = 4;
  }
  else
  {
    if (!v5)
    {
      sub_19C098FBC(v2, *(char **)(v1 + 24));
      _Unwind_Resume(a1);
    }
    v6 = 5;
    v3 = *(_QWORD **)(v1 + 160);
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v6))(v3);
  sub_19C098FBC(v2, *(char **)(v1 + 24));
  _Unwind_Resume(a1);
}

void sub_19C22D1D0(uint64_t a1, int a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[2];
  _OWORD v14[8];
  void *in[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *out[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  int v39;

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  *(_OWORD *)out = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  *(_OWORD *)in = 0u;
  v16 = 0u;
  memset(v14, 0, sizeof(v14));
  sub_19C22D310(a1, a2, (uint64_t)v14);
  memset(v13, 0, sizeof(v13));
  v4 = (void *)MEMORY[0x1A1AD1458](v14, v13);
  v39 = a2;
  v5 = *(_QWORD *)(a1 + 160);
  if (!v5
    || ((*(void (**)(uint64_t *__return_ptr, uint64_t, int *))(*(_QWORD *)v5 + 48))(&v8, v5, &v39),
        v39 = a2,
        (v6 = *(_QWORD *)(a1 + 192)) == 0))
  {
    sub_19C1D6A94();
  }
  v7 = (int)v9 * (int)v10 * (int)v11 * (int)v12 / (unint64_t)a2;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, int *))(*(_QWORD *)v6 + 48))(&v8, v6, &v39);
  BNNSFilterApplyBatch(v4, a2, in[1], v7, out[1], (int)v9 * (int)v10 * (int)v11 * (int)v12 / (unint64_t)a2);
  if (v4)
    BNNSFilterDestroy(v4);
}

double sub_19C22D310@<D0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD *v19;
  uint64_t v20;
  int v21;
  double result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[6];
  _QWORD v28[6];
  int v29;

  v29 = a2;
  v4 = *(_QWORD *)(a1 + 160);
  if (!v4)
    goto LABEL_11;
  (*(void (**)(_QWORD *__return_ptr, uint64_t, int *))(*(_QWORD *)v4 + 48))(v28, v4, &v29);
  v26 = v28[5];
  v7 = sub_19C222160(v28, 0);
  v24 = v28[1];
  v25 = v7;
  v23 = sub_19C222160(v28, 1);
  v8 = v28[2];
  v9 = sub_19C222160(v28, 2);
  v10 = v28[3];
  v29 = a2;
  v11 = *(_QWORD *)(a1 + 192);
  if (!v11)
LABEL_11:
    sub_19C1D6A94();
  (*(void (**)(_QWORD *__return_ptr, uint64_t, int *))(*(_QWORD *)v11 + 48))(v27, v11, &v29);
  v12 = v27[5];
  v13 = sub_19C222160(v27, 0);
  v14 = v27[1];
  v15 = sub_19C222160(v27, 1);
  v16 = v27[2];
  v17 = sub_19C222160(v27, 2);
  v18 = v27[3];
  *(_QWORD *)a3 = 0x3000000000000;
  *(_QWORD *)(a3 + 8) = v24;
  *(_QWORD *)(a3 + 16) = v8;
  *(_QWORD *)(a3 + 24) = v10;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_QWORD *)(a3 + 64) = 0;
  *(_QWORD *)(a3 + 72) = v25;
  *(_QWORD *)(a3 + 80) = v23;
  *(_QWORD *)(a3 + 88) = v9;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_QWORD *)(a3 + 128) = 0;
  *(_QWORD *)(a3 + 136) = v26;
  *(_DWORD *)(a3 + 144) = 65568;
  *(_QWORD *)(a3 + 156) = 0;
  *(_QWORD *)(a3 + 148) = 0;
  *(_QWORD *)(a3 + 176) = 0x3000000000000;
  *(_DWORD *)(a3 + 164) = 1065353216;
  *(_QWORD *)(a3 + 168) = 0;
  *(_QWORD *)(a3 + 184) = v14;
  *(_QWORD *)(a3 + 192) = v16;
  *(_QWORD *)(a3 + 200) = v18;
  *(_OWORD *)(a3 + 208) = 0u;
  *(_OWORD *)(a3 + 224) = 0u;
  *(_QWORD *)(a3 + 240) = 0;
  *(_QWORD *)(a3 + 248) = v13;
  *(_QWORD *)(a3 + 256) = v15;
  *(_QWORD *)(a3 + 264) = v17;
  *(_OWORD *)(a3 + 272) = 0u;
  *(_OWORD *)(a3 + 288) = 0u;
  *(_QWORD *)(a3 + 304) = 0;
  *(_QWORD *)(a3 + 312) = v12;
  *(_DWORD *)(a3 + 320) = 65568;
  *(_QWORD *)(a3 + 332) = 0;
  *(_QWORD *)(a3 + 324) = 0;
  *(_DWORD *)(a3 + 340) = 1065353216;
  v19 = (_OWORD *)(a3 + 528);
  *(_QWORD *)(a3 + 520) = 0;
  *(_OWORD *)(a3 + 344) = 0u;
  *(_OWORD *)(a3 + 360) = 0u;
  *(_OWORD *)(a3 + 376) = 0u;
  *(_OWORD *)(a3 + 392) = 0u;
  *(_OWORD *)(a3 + 408) = 0u;
  *(_OWORD *)(a3 + 424) = 0u;
  *(_OWORD *)(a3 + 440) = 0u;
  *(_OWORD *)(a3 + 456) = 0u;
  *(_OWORD *)(a3 + 472) = 0u;
  v20 = *(_QWORD *)(a1 + 200) - 1;
  *(_OWORD *)(a3 + 488) = 0u;
  *(_OWORD *)(a3 + 504) = 0u;
  switch(v20)
  {
    case 0:
      *(_OWORD *)(a3 + 544) = 0uLL;
      *(_OWORD *)(a3 + 560) = 0uLL;
      *v19 = 0uLL;
      v21 = 3;
      goto LABEL_9;
    case 1:
      *(_OWORD *)(a3 + 544) = 0uLL;
      *(_OWORD *)(a3 + 560) = 0uLL;
      *v19 = 0uLL;
      v21 = 4;
      goto LABEL_9;
    case 3:
      *(_OWORD *)(a3 + 544) = 0uLL;
      *(_OWORD *)(a3 + 560) = 0uLL;
      *v19 = 0uLL;
      v21 = 11;
      goto LABEL_9;
    case 4:
      *(_OWORD *)(a3 + 544) = 0uLL;
      *(_OWORD *)(a3 + 560) = 0uLL;
      *v19 = 0uLL;
      v21 = 1;
LABEL_9:
      *(_DWORD *)v19 = v21;
      break;
    default:
      *(_OWORD *)(a3 + 544) = 0uLL;
      *(_OWORD *)(a3 + 560) = 0uLL;
      *v19 = 0uLL;
      break;
  }
  *(_DWORD *)(a3 + 576) = *(_DWORD *)(a1 + 248);
  *(_QWORD *)(a3 + 584) = sub_19C188528(a1 + 16, 0);
  *(_QWORD *)(a3 + 592) = sub_19C188528(a1 + 16, 1);
  *(_QWORD *)(a3 + 600) = sub_19C18871C(a1 + 16, 0);
  *(_QWORD *)(a3 + 608) = sub_19C18871C(a1 + 16, 1);
  *(_QWORD *)(a3 + 616) = sub_19C22D5C8(a1 + 16, 0);
  *(_QWORD *)(a3 + 624) = sub_19C22D5C8(a1 + 16, 1);
  *(_OWORD *)(a3 + 632) = *(_OWORD *)(a1 + 208);
  result = 0.0;
  *(_OWORD *)(a3 + 648) = 0u;
  *(_OWORD *)(a3 + 664) = 0u;
  return result;
}

uint64_t sub_19C22D5C8(uint64_t a1, int a2)
{
  uint64_t **v2;
  int v4;
  unint64_t v5;
  uint64_t *v6;
  size_t v7;
  int v8;
  _BOOL4 v9;
  int v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *__s1[2];
  char v16;
  int v17;
  int *v18;

  v16 = 14;
  strcpy((char *)__s1, "dilationStride");
  v2 = *(uint64_t ***)(a1 + 8);
  if (!v2)
LABEL_20:
    sub_19C07DFF8("map::at:  key not found");
  while (1)
  {
    while (1)
    {
      v4 = *((char *)v2 + 55);
      if (v4 >= 0)
        v5 = *((unsigned __int8 *)v2 + 55);
      else
        v5 = (unint64_t)v2[5];
      if (v4 >= 0)
        v6 = (uint64_t *)(v2 + 4);
      else
        v6 = v2[4];
      if (v5 >= 0xE)
        v7 = 14;
      else
        v7 = v5;
      v8 = memcmp(__s1, v6, v7);
      v9 = v8 < 0;
      if (!v8)
        v9 = v5 > 0xE;
      if (!v9)
        break;
      v2 = (uint64_t **)*v2;
      if (!v2)
        goto LABEL_20;
    }
    v10 = memcmp(v6, __s1, v7);
    v11 = v5 < 0xE;
    if (v10)
      v11 = v10 < 0;
    if (!v11)
      break;
    v2 = (uint64_t **)v2[1];
    if (!v2)
      goto LABEL_20;
  }
  v17 = a2;
  v12 = *((unsigned int *)v2 + 18);
  if ((_DWORD)v12 == -1)
    sub_19C18869C();
  v18 = &v17;
  v13 = ((uint64_t (*)(int **, uint64_t **))off_1E3D257D8[v12])(&v18, v2 + 7);
  if (v16 < 0)
    operator delete(__s1[0]);
  return v13;
}

void sub_19C22D724(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_19C22D740(_QWORD *a1, uint64_t a2, uint64_t a3, int32x2_t *__src)
{
  int32x2_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int32x2_t v11;
  __int128 v12;
  int32x2_t v13;
  uint64_t v14;
  void *__p[2];
  uint64_t v17;
  int v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19C07C6E8(__p, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    v17 = *(_QWORD *)(a2 + 16);
  }
  sub_19C18E344((uint64_t)a1, (__int128 *)__p, a3, __src);
  if (SHIBYTE(v17) < 0)
    operator delete(__p[0]);
  *a1 = &unk_1E3D22218;
  v7 = __src[32];
  LODWORD(v8) = __src[17].i32[0];
  if ((int)v8 <= 1)
    v8 = 1;
  else
    v8 = v8;
  v9 = __src[33].i32[0];
  v10 = __src[33].i32[1];
  v18 = 1;
  v11 = vmax_s32(__src[16], (int32x2_t)0x100000001);
  *(_QWORD *)&v12 = v11.u32[0];
  *((_QWORD *)&v12 + 1) = v11.u32[1];
  v19 = v12;
  v20 = v8;
  sub_19C07C964((uint64_t)(a1 + 2), &v18, (int *)&v22);
  v13 = vmax_s32(v7, (int32x2_t)0x100000001);
  v18 = 9;
  *(_QWORD *)&v12 = v13.u32[0];
  *((_QWORD *)&v12 + 1) = v13.u32[1];
  v19 = v12;
  if (v9 <= 1)
    v14 = 1;
  else
    v14 = v9;
  v20 = v14;
  v21 = v10;
  sub_19C07C964((uint64_t)(a1 + 5), &v18, (int *)&v22);
  return a1;
}

void sub_19C22D894(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C18E518(v1);
  _Unwind_Resume(a1);
}

void sub_19C22D8A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C18E518(v1);
  _Unwind_Resume(a1);
}

void sub_19C22D8BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C22D8DC(_QWORD *a1)
{
  uint64_t *v2;
  uint64_t **v3;

  v2 = *sub_19C18FEB8((uint64_t)a1, 9);
  v3 = sub_19C18FCD8((uint64_t)a1, 1);
  memcpy(v2, *v3, 4* *(_DWORD *)(a1[2] + 40)* *(_DWORD *)(a1[2] + 48)* *(_DWORD *)(a1[2] + 56)* *(_DWORD *)(a1[2] + 64)* *(_DWORD *)(a1[2] + 72));
  return (*(uint64_t (**)(_QWORD *))(*a1 + 32))(a1);
}

double sub_19C22D954(_QWORD *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  char *v13;
  double result;
  _OWORD v15[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
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
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a1[5];
  v32 = *(_OWORD *)(v4 + 40);
  v33 = *(_QWORD *)(v4 + 56);
  v5 = *(_QWORD *)(v4 + 72);
  v6 = (*(uint64_t (**)(_QWORD *))(*a1 + 224))(a1);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  memset(v15, 0, sizeof(v15));
  (*(void (**)(_OWORD *__return_ptr, _QWORD *))(*a1 + 152))(v15, a1);
  if (HIDWORD(v16))
  {
    v8 = a1 + 6;
    v7 = a1[6];
    if (v7)
      goto LABEL_7;
    goto LABEL_5;
  }
  v5 = (*(int (**)(_QWORD *, uint64_t))(*a1 + 216))(a1, 1);
  v8 = a1 + 6;
  v7 = a1[6];
  if (!v7)
  {
LABEL_5:
    v9 = v8;
    goto LABEL_12;
  }
  do
  {
LABEL_7:
    while (1)
    {
      v9 = (_QWORD *)v7;
      v10 = *(_DWORD *)(v7 + 32);
      if (v10 <= a2)
        break;
      v7 = *v9;
      v8 = v9;
      if (!*v9)
        goto LABEL_12;
    }
    if (v10 >= a2)
    {
      v13 = (char *)v9;
      goto LABEL_15;
    }
    v7 = v9[1];
  }
  while (v7);
  v8 = v9 + 1;
LABEL_12:
  v13 = (char *)operator new(0x50uLL);
  *((_DWORD *)v13 + 8) = a2;
  *(_OWORD *)(v13 + 40) = 0u;
  *(_OWORD *)(v13 + 56) = 0u;
  *((_QWORD *)v13 + 9) = 0;
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  *((_QWORD *)v13 + 2) = v9;
  *v8 = v13;
  v11 = *(_QWORD *)a1[5];
  v12 = (uint64_t *)v13;
  if (v11)
  {
    a1[5] = v11;
    v12 = (uint64_t *)*v8;
  }
  sub_19C07CC40((uint64_t *)a1[6], v12);
  ++a1[7];
LABEL_15:
  result = *(double *)&v32;
  *(_OWORD *)(v13 + 40) = v32;
  *((_QWORD *)v13 + 7) = v33;
  *((_QWORD *)v13 + 8) = v6;
  *((_QWORD *)v13 + 9) = v5;
  return result;
}

_QWORD *sub_19C22DB2C(_QWORD *a1, uint64_t a2, uint64_t a3, int32x2_t *__src)
{
  int32x2_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int32x2_t v11;
  __int128 v12;
  int32x2_t v13;
  uint64_t v14;
  void *__p[2];
  uint64_t v17;
  int v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19C07C6E8(__p, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    v17 = *(_QWORD *)(a2 + 16);
  }
  sub_19C19065C((uint64_t)a1, (__int128 *)__p, a3, __src);
  if (SHIBYTE(v17) < 0)
    operator delete(__p[0]);
  *a1 = &unk_1E3D220A8;
  v7 = __src[32];
  LODWORD(v8) = __src[17].i32[0];
  if ((int)v8 <= 1)
    v8 = 1;
  else
    v8 = v8;
  v9 = __src[33].i32[0];
  v10 = __src[33].i32[1];
  v18 = 1;
  v11 = vmax_s32(__src[16], (int32x2_t)0x100000001);
  *(_QWORD *)&v12 = v11.u32[0];
  *((_QWORD *)&v12 + 1) = v11.u32[1];
  v19 = v12;
  v20 = v8;
  sub_19C07C964((uint64_t)(a1 + 2), &v18, (int *)&v22);
  v13 = vmax_s32(v7, (int32x2_t)0x100000001);
  v18 = 9;
  *(_QWORD *)&v12 = v13.u32[0];
  *((_QWORD *)&v12 + 1) = v13.u32[1];
  v19 = v12;
  if (v9 <= 1)
    v14 = 1;
  else
    v14 = v9;
  v20 = v14;
  v21 = v10;
  sub_19C07C964((uint64_t)(a1 + 5), &v18, (int *)&v22);
  return a1;
}

void sub_19C22DC80(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C190830(v1);
  _Unwind_Resume(a1);
}

void sub_19C22DC94(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C190830(v1);
  _Unwind_Resume(a1);
}

void sub_19C22DCA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C22DCC8(_QWORD *a1)
{
  uint64_t *v2;
  uint64_t **v3;

  v2 = *sub_19C18FEB8((uint64_t)a1, 9);
  v3 = sub_19C18FCD8((uint64_t)a1, 1);
  memcpy(v2, *v3, *(_DWORD *)(a1[2] + 40)* *(_DWORD *)(a1[2] + 48)* *(_DWORD *)(a1[2] + 56)* *(_DWORD *)(a1[2] + 64)* *(_DWORD *)(a1[2] + 72));
  return (*(uint64_t (**)(_QWORD *))(*a1 + 32))(a1);
}

double sub_19C22DD40(_QWORD *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  uint64_t *v12;
  char *v13;
  double result;
  _OWORD v15[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
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
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a1[5];
  v32 = *(_OWORD *)(v4 + 40);
  v33 = *(_QWORD *)(v4 + 56);
  v5 = *(_QWORD *)(v4 + 72);
  v6 = (*(uint64_t (**)(_QWORD *))(*a1 + 224))(a1);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  memset(v15, 0, sizeof(v15));
  (*(void (**)(_OWORD *__return_ptr, _QWORD *))(*a1 + 152))(v15, a1);
  if (HIDWORD(v16))
  {
    v8 = a1 + 6;
    v7 = a1[6];
    if (v7)
      goto LABEL_7;
    goto LABEL_5;
  }
  v5 = (*(int (**)(_QWORD *, uint64_t))(*a1 + 216))(a1, 1);
  v8 = a1 + 6;
  v7 = a1[6];
  if (!v7)
  {
LABEL_5:
    v9 = v8;
    goto LABEL_12;
  }
  do
  {
LABEL_7:
    while (1)
    {
      v9 = (_QWORD *)v7;
      v10 = *(_DWORD *)(v7 + 32);
      if (v10 <= a2)
        break;
      v7 = *v9;
      v8 = v9;
      if (!*v9)
        goto LABEL_12;
    }
    if (v10 >= a2)
    {
      v13 = (char *)v9;
      goto LABEL_15;
    }
    v7 = v9[1];
  }
  while (v7);
  v8 = v9 + 1;
LABEL_12:
  v13 = (char *)operator new(0x50uLL);
  *((_DWORD *)v13 + 8) = a2;
  *(_OWORD *)(v13 + 40) = 0u;
  *(_OWORD *)(v13 + 56) = 0u;
  *((_QWORD *)v13 + 9) = 0;
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  *((_QWORD *)v13 + 2) = v9;
  *v8 = v13;
  v11 = *(_QWORD *)a1[5];
  v12 = (uint64_t *)v13;
  if (v11)
  {
    a1[5] = v11;
    v12 = (uint64_t *)*v8;
  }
  sub_19C07CC40((uint64_t *)a1[6], v12);
  ++a1[7];
LABEL_15:
  result = *(double *)&v32;
  *(_OWORD *)(v13 + 40) = v32;
  *((_QWORD *)v13 + 7) = v33;
  *((_QWORD *)v13 + 8) = v6;
  *((_QWORD *)v13 + 9) = v5;
  return result;
}

void sub_19C22DF1C(uint64_t a1)
{
  void *v1;

  v1 = (void *)sub_19C18E518(a1);
  operator delete(v1);
}

void sub_19C22DF34(uint64_t a1)
{
  void *v1;

  v1 = (void *)sub_19C190830(a1);
  operator delete(v1);
}

uint64_t sub_19C22DF48(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)a1 = off_1E3D22F10;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 8) = a1 + 16;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = a1 + 40;
  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  v2 = operator new();
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 64) = v2;
  *(_QWORD *)(a1 + 72) = a1 + 80;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = a1 + 104;
  *(_QWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 144) = a1 + 152;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 160) = 0;
  *(_QWORD *)(a1 + 168) = a1 + 176;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 184) = 0;
  *(_QWORD *)(a1 + 192) = a1 + 200;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 216) = 0;
  *(_QWORD *)(a1 + 240) = 0;
  *(_QWORD *)(a1 + 232) = 0;
  *(_QWORD *)(a1 + 224) = a1 + 232;
  return a1;
}

void sub_19C22E01C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  char **v3;
  char **v4;

  sub_19C098FBC(v2, *v4);
  sub_19C098FBC(v1, *v3);
  _Unwind_Resume(a1);
}

uint64_t sub_19C22E040(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)a1 = off_1E3D22F10;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 8) = a1 + 16;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = a1 + 40;
  *(_QWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 56) = 0;
  v2 = operator new();
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 64) = v2;
  *(_QWORD *)(a1 + 72) = a1 + 80;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = a1 + 104;
  *(_QWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 144) = a1 + 152;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 160) = 0;
  *(_QWORD *)(a1 + 168) = a1 + 176;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 184) = 0;
  *(_QWORD *)(a1 + 192) = a1 + 200;
  *(_QWORD *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 216) = 0;
  *(_QWORD *)(a1 + 240) = 0;
  *(_QWORD *)(a1 + 232) = 0;
  *(_QWORD *)(a1 + 224) = a1 + 232;
  return a1;
}

void sub_19C22E114(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  char **v3;
  char **v4;

  sub_19C098FBC(v2, *v4);
  sub_19C098FBC(v1, *v3);
  _Unwind_Resume(a1);
}

uint64_t sub_19C22E138(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  *(_QWORD *)a1 = off_1E3D22F10;
  sub_19C098FBC(a1 + 224, *(char **)(a1 + 232));
  v2 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(a1 + 216) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  sub_19C235E6C(a1 + 192, *(_QWORD *)(a1 + 200));
  sub_19C098FBC(a1 + 168, *(char **)(a1 + 176));
  sub_19C235D9C(a1 + 144, *(char **)(a1 + 152));
  v3 = *(_QWORD *)(a1 + 120);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 128);
    v5 = *(void **)(a1 + 120);
    if (v4 != v3)
    {
      do
      {
        if (*(char *)(v4 - 1) < 0)
          operator delete(*(void **)(v4 - 24));
        v4 -= 24;
      }
      while (v4 != v3);
      v5 = *(void **)(a1 + 120);
    }
    *(_QWORD *)(a1 + 128) = v3;
    operator delete(v5);
  }
  sub_19C235D24(a1 + 96, *(char **)(a1 + 104));
  sub_19C235CCC(a1 + 72, *(_QWORD **)(a1 + 80));
  v6 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = 0;
  if (v6)
    operator delete(v6);
  sub_19C098FBC(a1 + 32, *(char **)(a1 + 40));
  sub_19C098FBC(a1 + 8, *(char **)(a1 + 16));
  return a1;
}

void sub_19C22E23C(uint64_t a1)
{
  void *v1;

  v1 = (void *)sub_19C22E138(a1);
  operator delete(v1);
}

_QWORD *sub_19C22E250(_QWORD *result, const void ***a2, const void ***a3)
{
  _QWORD *v4;
  const void **v5;
  const void **v6;
  const void **v7;
  const void **v8;
  uint64_t **v9;
  uint64_t *v10;

  v4 = result;
  v5 = *a2;
  v6 = a2[1];
  if (*a2 != v6)
  {
    do
    {
      result = sub_19C098AD0((uint64_t **)v4 + 1, v4 + 2, v5, (uint64_t)v5);
      v5 += 3;
    }
    while (v5 != v6);
  }
  v7 = *a3;
  v8 = a3[1];
  if (*a3 != v8)
  {
    v9 = (uint64_t **)(v4 + 4);
    v10 = v4 + 5;
    do
    {
      result = sub_19C098AD0(v9, v10, v7, (uint64_t)v7);
      v7 += 3;
    }
    while (v7 != v8);
  }
  return result;
}

uint64_t sub_19C22E2E8(uint64_t a1, uint64_t a2)
{
  uint64_t **v3;
  uint64_t result;
  uint64_t v5;
  void *__p[2];
  char v7;
  void **v8;

  sub_19C22E3BC(a1, a2, (uint64_t)__p);
  v8 = __p;
  v8 = (void **)(sub_19C235F0C((uint64_t **)(a1 + 144), (const void **)__p, (uint64_t)&unk_19C27ADD0, (__int128 **)&v8)[7]
               + 24);
  v3 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)v8, (uint64_t)&unk_19C27ADD0, (__int128 **)&v8);
  result = (*(uint64_t (**)(uint64_t *, uint64_t))(*v3[7] + 72))(v3[7], 1);
  v5 = result;
  if (v7 < 0)
  {
    operator delete(__p[0]);
    return v5;
  }
  return result;
}

void sub_19C22E3A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_19C22E3BC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v6;
  uint64_t v7;
  NSObject *v10;
  std::string __p;

  v6 = *(char *)(a2 + 23);
  if ((v6 & 0x80000000) == 0)
  {
    __p = *(std::string *)a2;
    v7 = a1 + 8;
    if (*(_QWORD *)(a1 + 24) != 1 || v6 != 0)
      goto LABEL_14;
LABEL_13:
    std::string::operator=(&__p, (const std::string *)(*(_QWORD *)v7 + 32));
    goto LABEL_14;
  }
  sub_19C07C6E8(&__p, *(void **)a2, *(_QWORD *)(a2 + 8));
  v7 = a1 + 8;
  if (*(char *)(a2 + 23) < 0)
  {
    if (*(_QWORD *)(a1 + 24) == 1 && *(_QWORD *)(a2 + 8) == 0)
      goto LABEL_13;
  }
  else if (*(_QWORD *)(a1 + 24) == 1 && *(_BYTE *)(a2 + 23) == 0)
  {
    goto LABEL_13;
  }
LABEL_14:
  if (sub_19C188AA8(v7, (uint64_t)&__p))
  {
    *(std::string *)a3 = __p;
    return;
  }
  v10 = sub_19C1A0644();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_19C256518(v10);
    *(_BYTE *)(a3 + 23) = 0;
    *(_BYTE *)a3 = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_19;
  }
  else
  {
    *(_BYTE *)(a3 + 23) = 0;
    *(_BYTE *)a3 = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
LABEL_19:
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_19C22E500(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C22E524(uint64_t a1, uint64_t a2)
{
  void **v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t **v7;
  size_t v8;
  uint64_t v9;
  int v10;
  size_t v11;
  const void *v12;
  size_t v13;
  int v14;
  _BOOL4 v15;
  BOOL v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  size_t v22;
  const void *v23;
  size_t v24;
  int v25;
  _BOOL4 v26;
  uint64_t **v27;
  uint64_t v28;
  void *__p[2];
  unsigned __int8 v31;
  void **v32;

  v3 = __p;
  sub_19C22E6B8(a1, a2, (uint64_t)__p);
  v6 = *(_QWORD *)(a1 + 176);
  v4 = a1 + 176;
  v5 = v6;
  if (!v6)
    goto LABEL_41;
  v7 = (uint64_t **)(v4 - 8);
  if ((v31 & 0x80u) == 0)
    v8 = v31;
  else
    v8 = (size_t)__p[1];
  if ((v31 & 0x80u) != 0)
    v3 = (void **)__p[0];
  v9 = v4;
  do
  {
    v10 = *(char *)(v5 + 55);
    if (v10 >= 0)
      v11 = *(unsigned __int8 *)(v5 + 55);
    else
      v11 = *(_QWORD *)(v5 + 40);
    if (v10 >= 0)
      v12 = (const void *)(v5 + 32);
    else
      v12 = *(const void **)(v5 + 32);
    if (v8 >= v11)
      v13 = v11;
    else
      v13 = v8;
    v14 = memcmp(v12, v3, v13);
    v15 = v11 < v8;
    if (v14)
      v15 = v14 < 0;
    v16 = !v15;
    if (v15)
      v17 = (uint64_t *)(v5 + 8);
    else
      v17 = (uint64_t *)v5;
    if (v16)
      v9 = v5;
    v5 = *v17;
  }
  while (*v17);
  if (v9 == v4)
    goto LABEL_41;
  v20 = *(_QWORD *)(v9 + 32);
  v19 = v9 + 32;
  v18 = v20;
  v21 = *(char *)(v19 + 23);
  v22 = v21 >= 0 ? *(unsigned __int8 *)(v19 + 23) : *(_QWORD *)(v19 + 8);
  v23 = (const void *)(v21 >= 0 ? v19 : v18);
  v24 = v22 >= v8 ? v8 : v22;
  v25 = memcmp(v3, v23, v24);
  v26 = v8 >= v22;
  if (v25)
    v26 = v25 >= 0;
  if (v26)
  {
    v32 = __p;
    v27 = sub_19C1877F4(v7, (const void **)__p, (uint64_t)&unk_19C27ADD0, (__int128 **)&v32);
    v28 = (*((_DWORD *)v27 + 14) * *((_DWORD *)v27 + 16) * *((_DWORD *)v27 + 18));
    if ((char)v31 < 0)
      goto LABEL_42;
  }
  else
  {
LABEL_41:
    v28 = 0;
    if ((char)v31 < 0)
LABEL_42:
      operator delete(__p[0]);
  }
  return v28;
}

void sub_19C22E69C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_19C22E6B8(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v6;
  uint64_t v7;
  NSObject *v10;
  std::string __p;

  v6 = *(char *)(a2 + 23);
  if ((v6 & 0x80000000) == 0)
  {
    __p = *(std::string *)a2;
    v7 = a1 + 32;
    if (*(_QWORD *)(a1 + 48) != 1 || v6 != 0)
      goto LABEL_14;
LABEL_13:
    std::string::operator=(&__p, (const std::string *)(*(_QWORD *)v7 + 32));
    goto LABEL_14;
  }
  sub_19C07C6E8(&__p, *(void **)a2, *(_QWORD *)(a2 + 8));
  v7 = a1 + 32;
  if (*(char *)(a2 + 23) < 0)
  {
    if (*(_QWORD *)(a1 + 48) == 1 && *(_QWORD *)(a2 + 8) == 0)
      goto LABEL_13;
  }
  else if (*(_QWORD *)(a1 + 48) == 1 && *(_BYTE *)(a2 + 23) == 0)
  {
    goto LABEL_13;
  }
LABEL_14:
  if (sub_19C188AA8(v7, (uint64_t)&__p))
  {
    *(std::string *)a3 = __p;
    return;
  }
  v10 = sub_19C1A0644();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_19C256558();
    *(_BYTE *)(a3 + 23) = 0;
    *(_BYTE *)a3 = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_19;
  }
  else
  {
    *(_BYTE *)(a3 + 23) = 0;
    *(_BYTE *)a3 = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
LABEL_19:
      operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_19C22E800(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_19C22E824(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t **v8;
  void *__p[2];
  uint64_t v10;
  void *v11[2];
  char v12;
  void **v13;

  sub_19C22E3BC(a1, a2, (uint64_t)v11);
  v5 = v12;
  if ((v12 & 0x80000000) == 0)
  {
    if (v12)
      goto LABEL_3;
LABEL_6:
    *(_QWORD *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    if ((v5 & 0x80) == 0)
      return;
    goto LABEL_13;
  }
  if (!v11[1])
    goto LABEL_6;
LABEL_3:
  v13 = v11;
  v6 = sub_19C235F0C((uint64_t **)(a1 + 144), (const void **)v11, (uint64_t)&unk_19C27ADD0, (__int128 **)&v13)[7];
  if (*(char *)(v6 + 47) < 0)
  {
    sub_19C07C6E8(__p, *(void **)(v6 + 24), *(_QWORD *)(v6 + 32));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)(v6 + 24);
    v10 = *(_QWORD *)(v6 + 40);
  }
  v13 = v11;
  v7 = *(unsigned int *)(sub_19C235F0C((uint64_t **)(a1 + 144), (const void **)v11, (uint64_t)&unk_19C27ADD0, (__int128 **)&v13)[7]+ 52);
  v13 = __p;
  v8 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)__p, (uint64_t)&unk_19C27ADD0, (__int128 **)&v13);
  (*(void (**)(uint64_t *, uint64_t))(*v8[7] + 160))(v8[7], v7);
  if ((SHIBYTE(v10) & 0x80000000) == 0)
  {
    if ((v12 & 0x80) == 0)
      return;
LABEL_13:
    operator delete(v11[0]);
    return;
  }
  operator delete(__p[0]);
  if (v12 < 0)
    goto LABEL_13;
}

void sub_19C22E97C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if ((a20 & 0x80000000) == 0)
    _Unwind_Resume(exception_object);
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C22E9C8(uint64_t a1, uint64_t a2)
{
  uint64_t **v3;
  uint64_t v4;
  void *__p[2];
  char v7;
  void **v8;

  sub_19C22E6B8(a1, a2, (uint64_t)__p);
  v3 = (uint64_t **)(a1 + 192);
  if (sub_19C188AA8((uint64_t)v3, (uint64_t)__p))
  {
    v8 = __p;
    v4 = sub_19C2361A0(v3, (const void **)__p, (uint64_t)&unk_19C27ADD0, (__int128 **)&v8)[7][1];
    if (v7 < 0)
      goto LABEL_6;
    return v4;
  }
  v4 = 0;
  if ((v7 & 0x80000000) == 0)
    return v4;
LABEL_6:
  operator delete(__p[0]);
  return v4;
}

void sub_19C22EA6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_19C22EA88(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t **v5;
  uint64_t **v6;
  __int128 v7;
  void *__p[2];
  char v9;
  void **v10;

  sub_19C22E6B8(a1, a2, (uint64_t)__p);
  v5 = (uint64_t **)(a1 + 168);
  if (sub_19C188AA8((uint64_t)v5, (uint64_t)__p))
  {
    v10 = __p;
    v6 = sub_19C1877F4(v5, (const void **)__p, (uint64_t)&unk_19C27ADD0, (__int128 **)&v10);
    v7 = *(_OWORD *)(v6 + 9);
    *(_OWORD *)a3 = *(_OWORD *)(v6 + 7);
    *(_OWORD *)(a3 + 16) = v7;
    *(_QWORD *)(a3 + 32) = v6[11];
    if (v9 < 0)
      goto LABEL_6;
  }
  else
  {
    *(_QWORD *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    if (v9 < 0)
LABEL_6:
      operator delete(__p[0]);
  }
}

void sub_19C22EB3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

__CFArray *sub_19C22EB58(uint64_t a1)
{
  __CFArray *Mutable;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *Instance;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  BOOL v9;

  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  if (*(int *)(a1 + 56) >= 1)
  {
    v3 = 0;
    v4 = (_QWORD *)(a1 + 104);
    do
    {
      if (qword_1EE4188F0 != -1)
        dispatch_once(&qword_1EE4188F0, &unk_1E3D25200);
      Instance = (_QWORD *)_CFRuntimeCreateInstance();
      Instance[3] = 0;
      Instance[2] = Instance + 3;
      Instance[6] = 0;
      Instance[4] = 0;
      Instance[5] = Instance + 6;
      Instance[8] = 0;
      Instance[9] = 0;
      Instance[7] = 0;
      v6 = *(_QWORD **)(a1 + 96);
      if (v6 != v4)
      {
        do
        {
          (*(void (**)(_QWORD, _QWORD *, uint64_t))(*(_QWORD *)v6[7] + 288))(v6[7], Instance, v3);
          v7 = (_QWORD *)v6[1];
          if (v7)
          {
            do
            {
              v8 = v7;
              v7 = (_QWORD *)*v7;
            }
            while (v7);
          }
          else
          {
            do
            {
              v8 = (_QWORD *)v6[2];
              v9 = *v8 == (_QWORD)v6;
              v6 = v8;
            }
            while (!v9);
          }
          v6 = v8;
        }
        while (v8 != v4);
      }
      CFArrayAppendValue(Mutable, Instance);
      CFRelease(Instance);
      v3 = (v3 + 1);
    }
    while ((int)v3 < *(_DWORD *)(a1 + 56));
  }
  return Mutable;
}

uint64_t *sub_19C22ECC8(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t **v9;
  uint64_t **v10;
  uint64_t v11;
  BOOL v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t **v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t **v27;
  uint64_t **v28;
  uint64_t v29;
  uint64_t **v30;
  uint64_t *v31;
  _OWORD *v32;
  __int128 v33;
  __int128 v34;
  unint64_t v35;
  __int128 v36;
  char *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t **v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t **v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  void *__p[2];
  _OWORD *v54;

  v6 = a2[1];
  if (v6 == 250)
    v7 = 250;
  else
    v7 = 0;
  v9 = (uint64_t **)(a1 + 80);
  v8 = *(_QWORD **)(a1 + 80);
  if (v8)
  {
    v10 = (uint64_t **)(a1 + 80);
    do
    {
      v11 = v8[4];
      v12 = v11 < v7;
      if (v11 >= v7)
        v13 = v8;
      else
        v13 = v8 + 1;
      if (!v12)
        v10 = (uint64_t **)v8;
      v8 = (_QWORD *)*v13;
    }
    while (*v13);
    if (v10 != v9 && v7 >= (uint64_t)v10[4])
      goto LABEL_34;
  }
  v14 = (_QWORD *)operator new();
  v15 = v14;
  if (v6 == 250)
  {
    *v14 = &unk_1E3D21AC8;
    v16 = (uint64_t *)operator new();
    *v16 = (uint64_t)&off_1E3D22CC8;
    v16[1] = (uint64_t)v15;
    v17 = *v9;
    v18 = v9;
    if (!*v9)
      goto LABEL_30;
    while (1)
    {
      while (1)
      {
        v18 = (uint64_t **)v17;
        v19 = v17[4];
        if (v7 >= v19)
          break;
        v17 = *v18;
        v9 = v18;
        if (!*v18)
          goto LABEL_30;
      }
      if (v19 >= v7)
        break;
      v17 = v18[1];
      if (!v17)
      {
        v9 = v18 + 1;
        goto LABEL_30;
      }
    }
LABEL_48:
    v25 = (uint64_t)v18[5];
    v18[5] = v16;
    if (!v25)
      goto LABEL_34;
    goto LABEL_33;
  }
  *v14 = &unk_1E3D21A50;
  v16 = (uint64_t *)operator new();
  *v16 = (uint64_t)&unk_1E3D233E8;
  v16[1] = (uint64_t)v15;
  v20 = *v9;
  v18 = v9;
  if (*v9)
  {
    while (1)
    {
      while (1)
      {
        v18 = (uint64_t **)v20;
        v21 = v20[4];
        if (v7 >= v21)
          break;
        v20 = *v18;
        v9 = v18;
        if (!*v18)
          goto LABEL_30;
      }
      if (v21 >= v7)
        goto LABEL_48;
      v20 = v18[1];
      if (!v20)
      {
        v9 = v18 + 1;
        break;
      }
    }
  }
LABEL_30:
  v22 = (uint64_t *)operator new(0x30uLL);
  v22[4] = v7;
  v22[5] = 0;
  *v22 = 0;
  v22[1] = 0;
  v22[2] = (uint64_t)v18;
  *v9 = v22;
  v23 = **(_QWORD **)(a1 + 72);
  v24 = v22;
  if (v23)
  {
    *(_QWORD *)(a1 + 72) = v23;
    v24 = *v9;
  }
  sub_19C07CC40(*(uint64_t **)(a1 + 80), v24);
  ++*(_QWORD *)(a1 + 88);
  v25 = v22[5];
  v22[5] = (uint64_t)v16;
  if (v25)
LABEL_33:
    (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
LABEL_34:
  switch(*a2)
  {
    case 0:
    case 2:
    case 0xDLL:
      v40 = a2[4];
      if (v40 == 2)
      {
        v26 = (uint64_t *)operator new();
        if (*(char *)(a3 + 23) < 0)
        {
          sub_19C07C6E8(__p, *(void **)a3, *(_QWORD *)(a3 + 8));
        }
        else
        {
          *(_OWORD *)__p = *(_OWORD *)a3;
          v54 = *(_OWORD **)(a3 + 16);
        }
        sub_19C22BF50((int)v26, (int)__p, a1, a2);
        if (SHIBYTE(v54) < 0)
          operator delete(__p[0]);
        goto LABEL_110;
      }
      if (!v40)
      {
        v26 = (uint64_t *)operator new();
        if (*(char *)(a3 + 23) < 0)
        {
          sub_19C07C6E8(__p, *(void **)a3, *(_QWORD *)(a3 + 8));
        }
        else
        {
          *(_OWORD *)__p = *(_OWORD *)a3;
          v54 = *(_OWORD **)(a3 + 16);
        }
        sub_19C22AE40((int)v26, (int)__p, a1, a2);
        if (SHIBYTE(v54) < 0)
          operator delete(__p[0]);
        goto LABEL_110;
      }
      goto LABEL_38;
    case 1:
      v26 = (uint64_t *)operator new();
      if (*(char *)(a3 + 23) < 0)
      {
        sub_19C07C6E8(__p, *(void **)a3, *(_QWORD *)(a3 + 8));
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)a3;
        v54 = *(_OWORD **)(a3 + 16);
      }
      sub_19C24976C(v26, (uint64_t)__p, a1, a2);
      if (SHIBYTE(v54) < 0)
        operator delete(__p[0]);
      goto LABEL_110;
    case 3:
    case 0xELL:
    case 0xFLL:
    case 0x10:
    case 0x19:
    case 0x1CLL:
      v26 = (uint64_t *)operator new();
      sub_19C18CE7C((uint64_t)v26, a3, a1, a2);
      __p[0] = (void *)a3;
      v27 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      goto LABEL_36;
    case 4:
      v41 = a2[4];
      if (v41 == 2)
      {
        v51 = a1;
        sub_19C22FD08(a3, &v51, a2, &v52);
        __p[0] = (void *)a3;
        v42 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      }
      else
      {
        if (v41)
          goto LABEL_38;
        v51 = a1;
        sub_19C22FC8C(a3, &v51, a2, &v52);
        __p[0] = (void *)a3;
        v42 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      }
      goto LABEL_117;
    case 5:
    case 6:
    case 9:
    case 0xALL:
      v39 = a2[4];
      if (v39 == 2)
      {
        v26 = (uint64_t *)operator new();
        if (*(char *)(a3 + 23) < 0)
        {
          sub_19C07C6E8(__p, *(void **)a3, *(_QWORD *)(a3 + 8));
        }
        else
        {
          *(_OWORD *)__p = *(_OWORD *)a3;
          v54 = *(_OWORD **)(a3 + 16);
        }
        sub_19C172F70((int)v26, (int)__p, a1, a2);
        if (SHIBYTE(v54) < 0)
          operator delete(__p[0]);
      }
      else
      {
        if (v39)
          goto LABEL_38;
        v26 = (uint64_t *)operator new();
        if (*(char *)(a3 + 23) < 0)
        {
          sub_19C07C6E8(__p, *(void **)a3, *(_QWORD *)(a3 + 8));
        }
        else
        {
          *(_OWORD *)__p = *(_OWORD *)a3;
          v54 = *(_OWORD **)(a3 + 16);
        }
        sub_19C1705B0((int)v26, (int)__p, a1, a2);
        if (SHIBYTE(v54) < 0)
          operator delete(__p[0]);
      }
LABEL_110:
      __p[0] = (void *)a3;
      v27 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
LABEL_36:
      v28 = v27;
      v29 = (uint64_t)v27[7];
      v28[7] = v26;
      if (v29)
        goto LABEL_37;
      goto LABEL_38;
    case 0xBLL:
      v26 = (uint64_t *)operator new();
      sub_19C19E20C((int)v26, a3, a1, a2);
      __p[0] = (void *)a3;
      v27 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      goto LABEL_36;
    case 0xCLL:
      v26 = (uint64_t *)operator new();
      sub_19C187CB0((int)v26, a3, a1, a2);
      __p[0] = (void *)a3;
      v27 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      goto LABEL_36;
    case 0x11:
      v26 = (uint64_t *)operator new();
      sub_19C08FE74((int)v26, a3, a1, a2);
      __p[0] = (void *)a3;
      v27 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      goto LABEL_36;
    case 0x12:
      v26 = (uint64_t *)operator new();
      sub_19C19EA70(v26, a3, a1, (int *)a2);
      __p[0] = (void *)a3;
      v27 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      goto LABEL_36;
    case 0x13:
      v26 = (uint64_t *)operator new();
      sub_19C239364(v26, a3, a1, (uint64_t)a2);
      __p[0] = (void *)a3;
      v27 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      goto LABEL_36;
    case 0x14:
      v26 = (uint64_t *)operator new();
      sub_19C09C1C0(v26, a3, a1, (uint64_t)a2);
      __p[0] = (void *)a3;
      v27 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      goto LABEL_36;
    case 0x15:
      v26 = (uint64_t *)operator new();
      sub_19C18DECC((int)v26, a3, a1, a2);
      __p[0] = (void *)a3;
      v27 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      goto LABEL_36;
    case 0x16:
      v43 = a2[4];
      if (v43 == 2)
      {
        v51 = a1;
        sub_19C22FFF0(a3, &v51, a2, &v52);
        __p[0] = (void *)a3;
        v42 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      }
      else
      {
        if (v43)
          goto LABEL_38;
        v51 = a1;
        sub_19C22FF74(a3, &v51, a2, &v52);
        __p[0] = (void *)a3;
        v42 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      }
      goto LABEL_117;
    case 0x17:
      v44 = a2[4];
      if (v44 == 2)
      {
        v51 = a1;
        sub_19C22FE00(a3, &v51, a2, &v52);
        __p[0] = (void *)a3;
        v42 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      }
      else
      {
        if (v44)
          goto LABEL_38;
        v51 = a1;
        sub_19C22FD84(a3, &v51, a2, &v52);
        __p[0] = (void *)a3;
        v42 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      }
      goto LABEL_117;
    case 0x18:
      v47 = a2[4];
      if (v47 == 2)
      {
        v51 = a1;
        sub_19C2300E8(a3, &v51, a2, &v52);
        __p[0] = (void *)a3;
        v42 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      }
      else
      {
        if (v47)
          goto LABEL_38;
        v51 = a1;
        sub_19C23006C(a3, &v51, a2, &v52);
        __p[0] = (void *)a3;
        v42 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      }
      goto LABEL_117;
    case 0x1ALL:
      v45 = a2[4];
      if (v45 == 2)
      {
        v51 = a1;
        sub_19C22FEF8(a3, &v51, (int *)a2, &v52);
        __p[0] = (void *)a3;
        v42 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      }
      else
      {
        if (v45)
          goto LABEL_38;
        v51 = a1;
        sub_19C22FE7C(a3, &v51, (int *)a2, &v52);
        __p[0] = (void *)a3;
        v42 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      }
      goto LABEL_117;
    case 0x1BLL:
      v46 = a2[4];
      if (v46 == 2)
      {
        v51 = a1;
        sub_19C22FB90(a3, &v51, a2, &v52);
        __p[0] = (void *)a3;
        v42 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      }
      else
      {
        if (v46)
          goto LABEL_38;
        v51 = a1;
        sub_19C22FA94(a3, &v51, a2, &v52);
        __p[0] = (void *)a3;
        v42 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      }
LABEL_117:
      v49 = v52;
      v52 = 0;
      v50 = v42[7];
      v42[7] = (uint64_t *)v49;
      if (v50)
      {
        (*(void (**)(uint64_t *))(*v50 + 8))(v50);
        v29 = v52;
        v52 = 0;
        if (v29)
LABEL_37:
          (*(void (**)(uint64_t))(*(_QWORD *)v29 + 8))(v29);
      }
LABEL_38:
      __p[0] = (void *)a3;
      if (sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p)[7])
      {
        __p[0] = (void *)a3;
        v30 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
        (*(void (**)(uint64_t *, uint64_t))(*v30[7] + 136))(v30[7], v7);
        __p[0] = (void *)a3;
        v31 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p)[7];
        v32 = operator new(0x40uLL);
        __p[1] = v32 + 4;
        v54 = v32 + 4;
        v33 = *((_OWORD *)a2 + 25);
        *v32 = *((_OWORD *)a2 + 24);
        v32[1] = v33;
        v34 = *((_OWORD *)a2 + 27);
        v32[2] = *((_OWORD *)a2 + 26);
        v32[3] = v34;
        __p[0] = v32;
        (*(void (**)(uint64_t *, void **))(*v31 + 144))(v31, __p);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
      }
      v35 = *(_QWORD *)(a1 + 128);
      if (v35 >= *(_QWORD *)(a1 + 136))
      {
        v37 = sub_19C07DA20((char **)(a1 + 120), a3);
      }
      else
      {
        if (*(char *)(a3 + 23) < 0)
        {
          sub_19C07C6E8(*(_BYTE **)(a1 + 128), *(void **)a3, *(_QWORD *)(a3 + 8));
        }
        else
        {
          v36 = *(_OWORD *)a3;
          *(_QWORD *)(v35 + 16) = *(_QWORD *)(a3 + 16);
          *(_OWORD *)v35 = v36;
        }
        v37 = (char *)(v35 + 24);
        *(_QWORD *)(a1 + 128) = v35 + 24;
      }
      *(_QWORD *)(a1 + 128) = v37;
      return sub_19C08087C((uint64_t **)(a1 + 224), (const void **)a3, a3);
    default:
      __p[0] = (void *)a3;
      v48 = sub_19C19E844((uint64_t **)(a1 + 96), (const void **)a3, (uint64_t)&unk_19C27ADD0, (__int128 **)__p);
      v29 = (uint64_t)v48[7];
      v48[7] = 0;
      if (!v29)
        goto LABEL_38;
      goto LABEL_37;
  }
}

void sub_19C22F954(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
  _Unwind_Resume(exception_object);
}

void sub_19C22FA78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  JUMPOUT(0x19C22FA70);
}

void sub_19C22FA94(uint64_t a1@<X0>, _QWORD *a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  void *__p[2];
  uint64_t v10;

  v8 = operator new();
  if (*(char *)(a1 + 23) < 0)
  {
    sub_19C07C6E8(__p, *(void **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a1;
    v10 = *(_QWORD *)(a1 + 16);
  }
  sub_19C220114(v8, (int)__p, *a2, a3);
  *a4 = v8;
  if (SHIBYTE(v10) < 0)
    operator delete(__p[0]);
}

void sub_19C22FB58(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19C22FB6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;

  if (a14 < 0)
    operator delete(__p);
  operator delete(v14);
  _Unwind_Resume(a1);
}

void sub_19C22FB90(uint64_t a1@<X0>, _QWORD *a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  void *__p[2];
  uint64_t v10;

  v8 = operator new();
  if (*(char *)(a1 + 23) < 0)
  {
    sub_19C07C6E8(__p, *(void **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a1;
    v10 = *(_QWORD *)(a1 + 16);
  }
  sub_19C220CF8(v8, (int)__p, *a2, a3);
  *a4 = v8;
  if (SHIBYTE(v10) < 0)
    operator delete(__p[0]);
}

void sub_19C22FC54(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19C22FC68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;

  if (a14 < 0)
    operator delete(__p);
  operator delete(v14);
  _Unwind_Resume(a1);
}

_QWORD *sub_19C22FC8C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  _QWORD *result;

  v8 = (_QWORD *)operator new();
  result = sub_19C225FE0(v8, a1, *a2, a3);
  *a4 = v8;
  return result;
}

void sub_19C22FCF4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_19C22FD08@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  _QWORD *result;

  v8 = (_QWORD *)operator new();
  result = sub_19C226454(v8, a1, *a2, a3);
  *a4 = v8;
  return result;
}

void sub_19C22FD70(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_19C22FD84@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  _QWORD *result;

  v8 = (_QWORD *)operator new();
  result = sub_19C238A28(v8, a1, *a2, a3);
  *a4 = v8;
  return result;
}

void sub_19C22FDEC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_19C22FE00@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  _QWORD *result;

  v8 = (_QWORD *)operator new();
  result = sub_19C238D80(v8, a1, *a2, a3);
  *a4 = v8;
  return result;
}

void sub_19C22FE68(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C22FE7C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, int *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t result;

  v8 = operator new();
  result = sub_19C09C888(v8, a1, *a2, a3);
  *a4 = v8;
  return result;
}

void sub_19C22FEE4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C22FEF8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, int *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t result;

  v8 = operator new();
  result = sub_19C09D458(v8, a1, *a2, a3);
  *a4 = v8;
  return result;
}

void sub_19C22FF60(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C22FF74@<X0>(int a1@<W0>, _QWORD *a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t result;

  v8 = operator new();
  result = sub_19C22D8D8(v8, a1, *a2, a3);
  *a4 = v8;
  return result;
}

void sub_19C22FFDC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C22FFF0@<X0>(int a1@<W0>, _QWORD *a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t result;

  v8 = operator new();
  result = sub_19C22DCC4(v8, a1, *a2, a3);
  *a4 = v8;
  return result;
}

void sub_19C230058(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C23006C@<X0>(int a1@<W0>, _QWORD *a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t result;

  v8 = operator new();
  result = sub_19C184CB0(v8, a1, *a2, a3);
  *a4 = v8;
  return result;
}

void sub_19C2300D4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C2300E8@<X0>(int a1@<W0>, _QWORD *a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t result;

  v8 = operator new();
  result = sub_19C185298(v8, a1, *a2, a3);
  *a4 = v8;
  return result;
}

void sub_19C230150(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL sub_19C230164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _BOOL8 v8;
  std::__shared_weak_count *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t **v13;
  uint64_t **v14;
  uint64_t *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  uint64_t **v21;
  uint64_t **v26;
  uint64_t *v27;
  __int128 v28;
  unint64_t *v29;
  unint64_t v30;
  NSObject *v31;
  _OWORD v33[2];
  uint64_t v34;
  void *v35[2];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  void *__p[2];
  char v44;
  __int128 *v45;

  *(_BYTE *)(a1 + 248) = a5;
  sub_19C22E3BC(a1, a3, (uint64_t)__p);
  v8 = sub_19C188AA8(a1 + 144, (uint64_t)__p);
  if (!v8)
  {
    sub_19C230524((uint64_t)__p, " has not been connected to any node in the network.");
    v31 = sub_19C1A0644();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      sub_19C255F5C();
      if ((SHIBYTE(v36) & 0x80000000) == 0)
        goto LABEL_36;
    }
    else if ((SHIBYTE(v36) & 0x80000000) == 0)
    {
      goto LABEL_36;
    }
    operator delete(v35[0]);
    if ((v44 & 0x80000000) == 0)
      return v8;
    goto LABEL_37;
  }
  v9 = (std::__shared_weak_count *)operator new(0x30uLL);
  v9->__shared_weak_owners_ = 0;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E3D25068;
  v9->__shared_owners_ = 0;
  v41 = sub_19C19EA64((uint64_t)&v9[1], a2);
  v42 = v9;
  v35[0] = __p;
  v10 = sub_19C235F0C((uint64_t **)(a1 + 144), (const void **)__p, (uint64_t)&unk_19C27ADD0, (__int128 **)v35);
  v11 = v10[7];
  v12 = v10[8];
  if (v11 == v12)
    goto LABEL_31;
  v13 = (uint64_t **)(a1 + 96);
  v14 = (uint64_t **)(a1 + 224);
  do
  {
    v35[0] = (void *)(v11 + 24);
    v15 = sub_19C19E844(v13, (const void **)(v11 + 24), (uint64_t)&unk_19C27ADD0, (__int128 **)v35)[7];
    v39 = v41;
    v40 = v42;
    if (v42)
    {
      p_shared_owners = (unint64_t *)&v42->__shared_owners_;
      do
        v17 = __ldxr(p_shared_owners);
      while (__stxr(v17 + 1, p_shared_owners));
    }
    (*(void (**)(uint64_t *, uint64_t *, _QWORD))(*v15 + 264))(v15, &v39, *(unsigned int *)(v11 + 52));
    v18 = v40;
    if (v40)
    {
      v19 = (unint64_t *)&v40->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
    }
    v45 = (__int128 *)(v11 + 24);
    v21 = sub_19C19E844(v13, (const void **)(v11 + 24), (uint64_t)&unk_19C27ADD0, &v45);
    (*(void (**)(void **__return_ptr, uint64_t *, _QWORD))(*v21[7] + 160))(v35, v21[7], *(unsigned int *)(v11 + 52));
    if (v35[0] != *(void **)a4
      || v35[1] != *(void **)(a4 + 8)
      || v36 != *(_QWORD *)(a4 + 16)
      || v37 != *(_QWORD *)(a4 + 24)
      || v38 != *(_QWORD *)(a4 + 32))
    {
      v35[0] = (void *)(v11 + 24);
      v26 = sub_19C19E844(v13, (const void **)(v11 + 24), (uint64_t)&unk_19C27ADD0, (__int128 **)v35);
      if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(*v26[7] + 304))(v26[7], a4, *(unsigned int *)(v11 + 52)))
      {
        sub_19C08087C(v14, (const void **)(v11 + 24), v11 + 24);
      }
    }
    v35[0] = (void *)(v11 + 24);
    v27 = sub_19C19E844(v13, (const void **)(v11 + 24), (uint64_t)&unk_19C27ADD0, (__int128 **)v35)[7];
    v28 = *(_OWORD *)(a4 + 16);
    v33[0] = *(_OWORD *)a4;
    v33[1] = v28;
    v34 = *(_QWORD *)(a4 + 32);
    (*(void (**)(uint64_t *, _OWORD *, _QWORD, _QWORD))(*v27 + 176))(v27, v33, *(unsigned int *)(v11 + 52), 0);
    v11 += 56;
  }
  while (v11 != v12);
  v9 = v42;
  if (v42)
  {
LABEL_31:
    v29 = (unint64_t *)&v9->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
      if (v44 < 0)
        goto LABEL_37;
      return v8;
    }
  }
LABEL_36:
  if (v44 < 0)
LABEL_37:
    operator delete(__p[0]);
  return v8;
}

void sub_19C230484(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,char a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a20 < 0)
  {
    operator delete(__p);
    if ((a32 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a32 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a27);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C230524(uint64_t a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  std::ios_base *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  uint64_t v16;
  uint64_t v17[8];
  void *__p[2];
  __int128 v19;
  int v20;
  uint64_t v21[19];

  v4 = MEMORY[0x1E0DE4FE0];
  v5 = MEMORY[0x1E0DE4FE0] + 64;
  v6 = (uint64_t *)MEMORY[0x1E0DE4F60];
  v7 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  v8 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  v21[0] = MEMORY[0x1E0DE4FE0] + 64;
  v16 = v7;
  *(uint64_t *)((char *)&v17[-1] + *(_QWORD *)(v7 - 24)) = v8;
  v9 = (std::ios_base *)((char *)&v17[-1] + *(_QWORD *)(v16 - 24));
  std::ios_base::init(v9, v17);
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  v16 = v4 + 24;
  v21[0] = v5;
  std::streambuf::basic_streambuf();
  v10 = MEMORY[0x1E0DE4FB8];
  v17[0] = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)__p = 0u;
  v19 = 0u;
  v20 = 16;
  v11 = *(char *)(a1 + 23);
  if (v11 >= 0)
    v12 = a1;
  else
    v12 = *(_QWORD *)a1;
  if (v11 >= 0)
    v13 = *(unsigned __int8 *)(a1 + 23);
  else
    v13 = *(_QWORD *)(a1 + 8);
  sub_19C07DCDC(&v16, v12, v13);
  v14 = strlen(a2);
  sub_19C07DCDC(&v16, (uint64_t)a2, v14);
  std::stringbuf::str();
  v16 = *v6;
  *(uint64_t *)((char *)&v17[-1] + *(_QWORD *)(v16 - 24)) = v6[3];
  v17[0] = v10 + 16;
  if (SBYTE7(v19) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1A1AD1C08](v21);
}

void sub_19C23068C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_19C07DC58((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19C2306A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x1A1AD1C08](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C2306E8(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t *v10;
  uint64_t *v11;
  unint64_t v12;
  char *v13;
  __int128 v14;
  int v16;
  int v17;
  __int128 v18;
  uint64_t v19;
  __int128 __dst;
  uint64_t v21;

  v16 = a5;
  v17 = a3;
  if (sub_19C188AA8(a1 + 8, a2))
  {
    sub_19C23087C(a1, (__int128 *)a2, a4, a5);
  }
  else if (sub_19C188AA8(a1 + 32, a4))
  {
    sub_19C2309D0(a1, (__int128 *)a2, a3, (__int128 *)a4);
  }
  else
  {
    *(_QWORD *)&__dst = a2;
    v10 = sub_19C235F0C((uint64_t **)(a1 + 144), (const void **)a2, (uint64_t)&unk_19C27ADD0, (__int128 **)&__dst);
    v11 = v10;
    v12 = v10[8];
    if (v12 >= v10[9])
    {
      v13 = sub_19C236418((void **)v10 + 7, (__int128 *)a2, (__int128 *)a4, &v17, &v16);
    }
    else
    {
      if (*(char *)(a2 + 23) < 0)
      {
        sub_19C07C6E8(&__dst, *(void **)a2, *(_QWORD *)(a2 + 8));
      }
      else
      {
        __dst = *(_OWORD *)a2;
        v21 = *(_QWORD *)(a2 + 16);
      }
      if (*(char *)(a4 + 23) < 0)
      {
        sub_19C07C6E8(&v18, *(void **)a4, *(_QWORD *)(a4 + 8));
      }
      else
      {
        v18 = *(_OWORD *)a4;
        v19 = *(_QWORD *)(a4 + 16);
      }
      v14 = __dst;
      *(_QWORD *)(v12 + 16) = v21;
      *(_OWORD *)v12 = v14;
      *(_OWORD *)(v12 + 24) = v18;
      *(_QWORD *)(v12 + 40) = v19;
      *(_DWORD *)(v12 + 48) = a3;
      *(_DWORD *)(v12 + 52) = a5;
      v13 = (char *)(v12 + 56);
      v11[8] = v12 + 56;
    }
    v11[8] = (uint64_t)v13;
  }
  return 1;
}

void sub_19C23084C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  uint64_t v20;
  uint64_t v21;

  if (a20 < 0)
  {
    operator delete(__p);
    *(_QWORD *)(v20 + 64) = v21;
    _Unwind_Resume(exception_object);
  }
  *(_QWORD *)(v20 + 64) = v21;
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C23087C(uint64_t a1, __int128 *a2, uint64_t a3, int a4)
{
  uint64_t *v7;
  int v8;
  unint64_t v9;
  int v10;
  char *v11;
  __int128 v12;
  int v14;
  int v15;
  __int128 v16;
  uint64_t v17;
  __int128 __dst;
  uint64_t v19;

  v15 = a4;
  *(_QWORD *)&__dst = a2;
  v7 = sub_19C235F0C((uint64_t **)(a1 + 144), (const void **)a2, (uint64_t)&unk_19C27ADD0, (__int128 **)&__dst);
  v8 = sub_19C186DA8("None");
  v14 = v8;
  v9 = v7[8];
  if (v9 >= v7[9])
  {
    v11 = sub_19C236748((void **)v7 + 7, a2, (__int128 *)a3, &v14, &v15);
  }
  else
  {
    v10 = v8;
    if (*((char *)a2 + 23) < 0)
    {
      sub_19C07C6E8(&__dst, *(void **)a2, *((_QWORD *)a2 + 1));
    }
    else
    {
      __dst = *a2;
      v19 = *((_QWORD *)a2 + 2);
    }
    if (*(char *)(a3 + 23) < 0)
    {
      sub_19C07C6E8(&v16, *(void **)a3, *(_QWORD *)(a3 + 8));
    }
    else
    {
      v16 = *(_OWORD *)a3;
      v17 = *(_QWORD *)(a3 + 16);
    }
    v12 = __dst;
    *(_QWORD *)(v9 + 16) = v19;
    *(_OWORD *)v9 = v12;
    *(_OWORD *)(v9 + 24) = v16;
    *(_QWORD *)(v9 + 40) = v17;
    *(_DWORD *)(v9 + 48) = v10;
    *(_DWORD *)(v9 + 52) = a4;
    v11 = (char *)(v9 + 56);
    v7[8] = v9 + 56;
  }
  v7[8] = (uint64_t)v11;
  return 1;
}

void sub_19C2309A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  uint64_t v20;
  uint64_t v21;

  if (a20 < 0)
  {
    operator delete(__p);
    *(_QWORD *)(v20 + 64) = v21;
    _Unwind_Resume(exception_object);
  }
  *(_QWORD *)(v20 + 64) = v21;
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C2309D0(uint64_t a1, __int128 *a2, int a3, __int128 *a4)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  size_t v11;
  __int128 *v12;
  uint64_t v13;
  int v14;
  size_t v15;
  const void *v16;
  size_t v17;
  int v18;
  _BOOL4 v19;
  BOOL v20;
  uint64_t *v21;
  int v22;
  size_t v23;
  const void *v24;
  size_t v25;
  int v26;
  _BOOL4 v27;
  uint64_t **v28;
  __int128 v29;
  uint64_t *v30;
  int v31;
  unint64_t v32;
  int v33;
  char *v34;
  __int128 v35;
  int v37;
  __int128 __dst;
  __int128 v39;
  uint64_t *v40;
  int v41;
  __int128 v42;
  uint64_t v43;

  v41 = a3;
  v8 = a1 + 104;
  v9 = *(_QWORD *)(a1 + 104);
  if (!v9)
    goto LABEL_40;
  v10 = *((char *)a2 + 23);
  v11 = v10 >= 0 ? *((unsigned __int8 *)a2 + 23) : *((_QWORD *)a2 + 1);
  v12 = v10 >= 0 ? a2 : *(__int128 **)a2;
  v13 = a1 + 104;
  do
  {
    v14 = *(char *)(v9 + 55);
    if (v14 >= 0)
      v15 = *(unsigned __int8 *)(v9 + 55);
    else
      v15 = *(_QWORD *)(v9 + 40);
    if (v14 >= 0)
      v16 = (const void *)(v9 + 32);
    else
      v16 = *(const void **)(v9 + 32);
    if (v11 >= v15)
      v17 = v15;
    else
      v17 = v11;
    v18 = memcmp(v16, v12, v17);
    v19 = v15 < v11;
    if (v18)
      v19 = v18 < 0;
    v20 = !v19;
    if (v19)
      v21 = (uint64_t *)(v9 + 8);
    else
      v21 = (uint64_t *)v9;
    if (v20)
      v13 = v9;
    v9 = *v21;
  }
  while (*v21);
  if (v13 == v8)
    goto LABEL_40;
  v22 = *(char *)(v13 + 55);
  if (v22 >= 0)
    v23 = *(unsigned __int8 *)(v13 + 55);
  else
    v23 = *(_QWORD *)(v13 + 40);
  if (v22 >= 0)
    v24 = (const void *)(v13 + 32);
  else
    v24 = *(const void **)(v13 + 32);
  if (v23 >= v11)
    v25 = v11;
  else
    v25 = v23;
  v26 = memcmp(v12, v24, v25);
  v27 = v11 < v23;
  if (v26)
    v27 = v26 < 0;
  if (v27)
LABEL_40:
    v13 = v8;
  (*(void (**)(__int128 *__return_ptr, _QWORD, uint64_t))(**(_QWORD **)(v13 + 56) + 168))(&__dst, *(_QWORD *)(v13 + 56), 9);
  *(_QWORD *)&v42 = a4;
  v28 = sub_19C1877F4((uint64_t **)(a1 + 168), (const void **)a4, (uint64_t)&unk_19C27ADD0, (__int128 **)&v42);
  v29 = v39;
  *(_OWORD *)(v28 + 7) = __dst;
  *(_OWORD *)(v28 + 9) = v29;
  v28[11] = v40;
  *(_QWORD *)&__dst = a2;
  v30 = sub_19C235F0C((uint64_t **)(a1 + 144), (const void **)a2, (uint64_t)&unk_19C27ADD0, (__int128 **)&__dst);
  v31 = sub_19C186DA8("None");
  v37 = v31;
  v32 = v30[8];
  if (v32 >= v30[9])
  {
    v34 = sub_19C2369F8((void **)v30 + 7, a2, a4, &v41, &v37);
  }
  else
  {
    v33 = v31;
    if (*((char *)a2 + 23) < 0)
    {
      sub_19C07C6E8(&__dst, *(void **)a2, *((_QWORD *)a2 + 1));
    }
    else
    {
      __dst = *a2;
      *(_QWORD *)&v39 = *((_QWORD *)a2 + 2);
    }
    if (*((char *)a4 + 23) < 0)
    {
      sub_19C07C6E8(&v42, *(void **)a4, *((_QWORD *)a4 + 1));
    }
    else
    {
      v42 = *a4;
      v43 = *((_QWORD *)a4 + 2);
    }
    v35 = __dst;
    *(_QWORD *)(v32 + 16) = v39;
    *(_OWORD *)v32 = v35;
    *(_OWORD *)(v32 + 24) = v42;
    *(_QWORD *)(v32 + 40) = v43;
    *(_DWORD *)(v32 + 48) = a3;
    *(_DWORD *)(v32 + 52) = v33;
    v34 = (char *)(v32 + 56);
    v30[8] = v32 + 56;
  }
  v30[8] = (uint64_t)v34;
  return 1;
}

void sub_19C230C34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  uint64_t v16;
  uint64_t v17;

  if (a16 < 0)
  {
    operator delete(__p);
    *(_QWORD *)(v16 + 64) = v17;
    _Unwind_Resume(exception_object);
  }
  *(_QWORD *)(v16 + 64) = v17;
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C230C64(uint64_t a1)
{
  __int128 *v1;
  uint64_t **v3;
  __int128 v4;
  uint64_t **v5;
  unsigned int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  uint64_t **v13;
  uint64_t *v14;
  uint64_t **v15;
  int v16;
  size_t v17;
  const void *v18;
  _QWORD *v19;
  const void *v20;
  const void *v21;
  int v22;
  size_t v23;
  const void *v24;
  size_t v25;
  int v26;
  _BOOL4 v27;
  int v28;
  _BOOL4 v29;
  _QWORD *v30;
  _BYTE *v31;
  __int128 v32;
  uint64_t **v33;
  uint64_t *v34;
  uint64_t **v35;
  int v36;
  size_t v37;
  const void *v38;
  _QWORD *v39;
  const void *v40;
  const void *v41;
  int v42;
  size_t v43;
  const void *v44;
  size_t v45;
  int v46;
  _BOOL4 v47;
  int v48;
  _BOOL4 v49;
  uint64_t v50;
  _QWORD *v51;
  _BYTE *v52;
  __int128 v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  _BYTE *v60;
  int v61;
  uint64_t v62;
  int v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  _BYTE *v73;
  int v74;
  uint64_t v75;
  int v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  BOOL v81;
  uint64_t **v85;
  uint64_t *v86;
  uint64_t **v87;
  int v88;
  size_t v89;
  const void *v90;
  _QWORD *v91;
  const void *v92;
  const void *v93;
  int v94;
  size_t v95;
  const void *v96;
  size_t v97;
  int v98;
  _BOOL4 v99;
  int v100;
  _BOOL4 v101;
  uint64_t v102;
  _QWORD *v103;
  _BYTE *v104;
  __int128 v105;
  uint64_t *v106;
  uint64_t *v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  _BYTE *v112;
  int v113;
  uint64_t v114;
  int v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  char **v120;
  char *v121;
  char **v122;
  int v123;
  size_t v124;
  const void *v125;
  _QWORD *v126;
  const void *v127;
  const void *v128;
  int v129;
  size_t v130;
  const void *v131;
  size_t v132;
  int v133;
  _BOOL4 v134;
  int v135;
  _BOOL4 v136;
  char *v137;
  _BYTE *v138;
  __int128 v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  char *v143;
  uint64_t v144;
  _BYTE *v145;
  int v146;
  uint64_t v147;
  int v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t *v152;
  char **v153;
  char *v154;
  char **v155;
  int v156;
  size_t v157;
  const void *v158;
  _QWORD *v159;
  const void *v160;
  const void *v161;
  int v162;
  size_t v163;
  const void *v164;
  size_t v165;
  int v166;
  _BOOL4 v167;
  int v168;
  _BOOL4 v169;
  char *v170;
  _BYTE *v171;
  __int128 v172;
  uint64_t v173;
  char *v174;
  uint64_t v175;
  char *v176;
  uint64_t v177;
  _BYTE *v178;
  int v179;
  uint64_t v180;
  int v181;
  uint64_t *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  char *v186;
  uint64_t **v187;
  uint64_t *v188;
  uint64_t **v189;
  int v190;
  size_t v191;
  const void *v192;
  _QWORD *v193;
  const void *v194;
  const void *v195;
  int v196;
  size_t v197;
  const void *v198;
  size_t v199;
  int v200;
  _BOOL4 v201;
  int v202;
  _BOOL4 v203;
  uint64_t v204;
  _QWORD *v205;
  _BYTE *v206;
  __int128 v207;
  uint64_t *v208;
  uint64_t *v209;
  uint64_t *v210;
  uint64_t v211;
  uint64_t *v212;
  uint64_t v213;
  _BYTE *v214;
  int v215;
  uint64_t v216;
  int v217;
  uint64_t *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t *v221;
  uint64_t v222;
  char *v223;
  _QWORD *v224;
  char **v225;
  char *v226;
  char **v227;
  int v228;
  size_t v229;
  const void *v230;
  _QWORD *v231;
  const void *v232;
  const void *v233;
  int v234;
  size_t v235;
  const void *v236;
  size_t v237;
  int v238;
  _BOOL4 v239;
  int v240;
  _BOOL4 v241;
  char *v242;
  _BYTE *v243;
  __int128 v244;
  uint64_t v245;
  char *v246;
  char *v247;
  uint64_t v248;
  char *v249;
  uint64_t v250;
  _BYTE *v251;
  int v252;
  uint64_t v253;
  int v254;
  uint64_t *v255;
  uint64_t v256;
  uint64_t v257;
  char *v258;
  __int128 v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t **v266;
  __int128 *v267;
  __int128 *v268;
  uint64_t **v269;
  _DWORD *v270;
  uint64_t *v271;
  char **v272;
  char **v273;
  uint64_t **v274;
  uint64_t i;
  uint64_t v276;
  _DWORD *v277;
  uint64_t **v278;
  _OWORD v279[2];
  uint64_t v280;
  void *__p[2];
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  __int128 v285;
  __int128 v286;
  uint64_t v287;
  unsigned int *v288;
  unsigned int *v289;
  __int128 __dst;
  uint64_t v291;

  v1 = *(__int128 **)(a1 + 120);
  v267 = *(__int128 **)(a1 + 128);
  if (v1 != v267)
  {
    v3 = (uint64_t **)(a1 + 96);
    v266 = (uint64_t **)(a1 + 144);
    v278 = (uint64_t **)(a1 + 104);
    v272 = (char **)(a1 + 176);
    v273 = (char **)(a1 + 232);
    v274 = v3;
    v276 = a1;
    while (1)
    {
      v268 = v1;
      if (*((char *)v1 + 23) < 0)
      {
        sub_19C07C6E8(&__dst, *(void **)v1, *((_QWORD *)v1 + 1));
        v3 = v274;
      }
      else
      {
        v4 = *v1;
        v291 = *((_QWORD *)v1 + 2);
        __dst = v4;
      }
      *(_QWORD *)&v285 = &__dst;
      v5 = sub_19C19E844(v3, (const void **)&__dst, (uint64_t)&unk_19C27ADD0, (__int128 **)&v285);
      *(_QWORD *)&v285 = &__dst;
      v271 = sub_19C235F0C(v266, (const void **)&__dst, (uint64_t)&unk_19C27ADD0, (__int128 **)&v285);
      (*(void (**)(unsigned int **__return_ptr))(*v5[7] + 24))(&v288);
      v6 = v288;
      v270 = v289;
      if (v288 != v289)
        break;
LABEL_454:
      if (v6)
      {
        v289 = v6;
        operator delete(v6);
      }
      if (SHIBYTE(v291) < 0)
        operator delete((void *)__dst);
      v1 = (__int128 *)((char *)v268 + 24);
      v3 = v274;
      if ((__int128 *)((char *)v268 + 24) == v267)
        return 1;
    }
    v269 = v5;
LABEL_10:
    (*(void (**)(uint64_t *, _QWORD))(*v5[7] + 192))(v5[7], *v6);
    (*(void (**)(__int128 *__return_ptr, uint64_t *, _QWORD))(*v5[7] + 168))(&v285, v5[7], *v6);
    v277 = v6;
    v8 = v271[7];
    v7 = v271[8];
    for (i = v7; ; v7 = i)
    {
      if (v8 == v7)
      {
        v6 = v277 + 1;
        v5 = v269;
        if (v277 + 1 == v270)
        {
          v6 = v288;
          goto LABEL_454;
        }
        goto LABEL_10;
      }
      v10 = *(unsigned int *)(v8 + 48);
      if ((_DWORD)v10 == *v277)
      {
        v11 = *(unsigned int *)(v8 + 52);
        if (!(_DWORD)v11)
        {
          v33 = v278;
          v34 = *v278;
          v35 = v278;
          if (*v278)
          {
            v36 = *(char *)(v8 + 23);
            if (v36 >= 0)
              v37 = *(unsigned __int8 *)(v8 + 23);
            else
              v37 = *(_QWORD *)(v8 + 8);
            if (v36 >= 0)
              v38 = (const void *)v8;
            else
              v38 = *(const void **)v8;
            while (1)
            {
              while (1)
              {
                v33 = (uint64_t **)v34;
                v41 = (const void *)v34[4];
                v39 = v34 + 4;
                v40 = v41;
                v42 = *((char *)v39 + 23);
                if (v42 >= 0)
                  v43 = *((unsigned __int8 *)v39 + 23);
                else
                  v43 = v39[1];
                if (v42 >= 0)
                  v44 = v39;
                else
                  v44 = v40;
                if (v43 >= v37)
                  v45 = v37;
                else
                  v45 = v43;
                v46 = memcmp(v38, v44, v45);
                v47 = v37 < v43;
                if (v46)
                  v47 = v46 < 0;
                if (!v47)
                  break;
                v34 = *v33;
                v35 = v33;
                if (!*v33)
                  goto LABEL_72;
              }
              v48 = memcmp(v44, v38, v45);
              v49 = v43 < v37;
              if (v48)
                v49 = v48 < 0;
              if (!v49)
                break;
              v34 = v33[1];
              if (!v34)
              {
                v35 = v33 + 1;
                goto LABEL_72;
              }
            }
            v51 = v33;
            v50 = v276;
          }
          else
          {
LABEL_72:
            v50 = v276;
            v51 = operator new(0x40uLL);
            v52 = v51 + 4;
            if (*(char *)(v8 + 23) < 0)
            {
              sub_19C07C6E8(v52, *(void **)v8, *(_QWORD *)(v8 + 8));
            }
            else
            {
              v53 = *(_OWORD *)v8;
              v51[6] = *(_QWORD *)(v8 + 16);
              *(_OWORD *)v52 = v53;
            }
            v51[7] = 0;
            *v51 = 0;
            v51[1] = 0;
            v51[2] = v33;
            *v35 = v51;
            v67 = (uint64_t *)**v274;
            v68 = v51;
            if (v67)
            {
              *v274 = v67;
              v68 = *v35;
            }
            v69 = *v278;
            v81 = v68 == *v278;
            *((_BYTE *)v68 + 24) = v81;
            if (!v81)
            {
              do
              {
                v70 = v68[2];
                if (*(_BYTE *)(v70 + 24))
                  break;
                v71 = *(uint64_t **)(v70 + 16);
                v72 = *v71;
                if (*v71 == v70)
                {
                  v75 = v71[1];
                  if (!v75 || (v76 = *(unsigned __int8 *)(v75 + 24), v73 = (_BYTE *)(v75 + 24), v76))
                  {
                    if (*(uint64_t **)v70 == v68)
                    {
                      *(_BYTE *)(v70 + 24) = 1;
                      *((_BYTE *)v71 + 24) = 0;
                      v79 = *(_QWORD *)(v70 + 8);
                      *v71 = v79;
                      if (v79)
                        goto LABEL_113;
                    }
                    else
                    {
                      v77 = *(uint64_t **)(v70 + 8);
                      v78 = *v77;
                      *(_QWORD *)(v70 + 8) = *v77;
                      if (v78)
                      {
                        *(_QWORD *)(v78 + 16) = v70;
                        v71 = *(uint64_t **)(v70 + 16);
                      }
                      v77[2] = (uint64_t)v71;
                      *(_QWORD *)(*(_QWORD *)(v70 + 16) + 8 * (**(_QWORD **)(v70 + 16) != v70)) = v77;
                      *v77 = v70;
                      *(_QWORD *)(v70 + 16) = v77;
                      v71 = (uint64_t *)v77[2];
                      v70 = *v71;
                      *((_BYTE *)v77 + 24) = 1;
                      *((_BYTE *)v71 + 24) = 0;
                      v79 = *(_QWORD *)(v70 + 8);
                      *v71 = v79;
                      if (v79)
LABEL_113:
                        *(_QWORD *)(v79 + 16) = v71;
                    }
                    *(_QWORD *)(v70 + 16) = v71[2];
                    *(_QWORD *)(v71[2] + 8 * (*(_QWORD *)v71[2] != (_QWORD)v71)) = v70;
                    *(_QWORD *)(v70 + 8) = v71;
LABEL_241:
                    v71[2] = v70;
                    break;
                  }
                }
                else if (!v72 || (v74 = *(unsigned __int8 *)(v72 + 24), v73 = (_BYTE *)(v72 + 24), v74))
                {
                  if (*(uint64_t **)v70 == v68)
                  {
                    v261 = v68[1];
                    *(_QWORD *)v70 = v261;
                    if (v261)
                    {
                      *(_QWORD *)(v261 + 16) = v70;
                      v71 = *(uint64_t **)(v70 + 16);
                    }
                    v68[2] = (uint64_t)v71;
                    *(_QWORD *)(*(_QWORD *)(v70 + 16) + 8 * (**(_QWORD **)(v70 + 16) != v70)) = v68;
                    v68[1] = v70;
                    *(_QWORD *)(v70 + 16) = v68;
                    v71 = (uint64_t *)v68[2];
                    *((_BYTE *)v68 + 24) = 1;
                    *((_BYTE *)v71 + 24) = 0;
                    v70 = v71[1];
                    v152 = *(uint64_t **)v70;
                    v71[1] = *(_QWORD *)v70;
                    if (v152)
LABEL_239:
                      v152[2] = (uint64_t)v71;
                  }
                  else
                  {
                    *(_BYTE *)(v70 + 24) = 1;
                    *((_BYTE *)v71 + 24) = 0;
                    v70 = v71[1];
                    v152 = *(uint64_t **)v70;
                    v71[1] = *(_QWORD *)v70;
                    if (v152)
                      goto LABEL_239;
                  }
                  *(_QWORD *)(v70 + 16) = v71[2];
                  *(_QWORD *)(v71[2] + 8 * (*(_QWORD *)v71[2] != (_QWORD)v71)) = v70;
                  *(_QWORD *)v70 = v71;
                  goto LABEL_241;
                }
                *(_BYTE *)(v70 + 24) = 1;
                v68 = v71;
                *((_BYTE *)v71 + 24) = v71 == v69;
                *v73 = 1;
              }
              while (v71 != v69);
            }
            ++*(_QWORD *)(v276 + 112);
            v10 = *(unsigned int *)(v8 + 48);
          }
          if (!(*(unsigned int (**)(_QWORD, __int128 *, uint64_t))(*(_QWORD *)v51[7] + 304))(v51[7], &v285, v10))goto LABEL_363;
          sub_19C232520("recompiling ", v8, "for ");
          v153 = v273;
          v154 = *v273;
          v155 = v273;
          if (*v273)
          {
            v156 = *(char *)(v8 + 23);
            v157 = v156 >= 0 ? *(unsigned __int8 *)(v8 + 23) : *(_QWORD *)(v8 + 8);
            v158 = v156 >= 0 ? (const void *)v8 : *(const void **)v8;
            while (1)
            {
              while (1)
              {
                v153 = (char **)v154;
                v161 = (const void *)*((_QWORD *)v154 + 4);
                v159 = v154 + 32;
                v160 = v161;
                v162 = *((char *)v159 + 23);
                if (v162 >= 0)
                  v163 = *((unsigned __int8 *)v159 + 23);
                else
                  v163 = v159[1];
                if (v162 >= 0)
                  v164 = v159;
                else
                  v164 = v160;
                if (v163 >= v157)
                  v165 = v157;
                else
                  v165 = v163;
                v166 = memcmp(v158, v164, v165);
                v167 = v157 < v163;
                if (v166)
                  v167 = v166 < 0;
                if (!v167)
                  break;
                v154 = *v153;
                v155 = v153;
                if (!*v153)
                  goto LABEL_269;
              }
              v168 = memcmp(v164, v158, v165);
              v169 = v163 < v157;
              if (v168)
                v169 = v168 < 0;
              if (!v169)
                break;
              v154 = v153[1];
              if (!v154)
              {
                v155 = v153 + 1;
                goto LABEL_269;
              }
            }
          }
          else
          {
LABEL_269:
            v170 = (char *)operator new(0x38uLL);
            v171 = v170 + 32;
            if (*(char *)(v8 + 23) < 0)
            {
              sub_19C07C6E8(v171, *(void **)v8, *(_QWORD *)(v8 + 8));
            }
            else
            {
              v172 = *(_OWORD *)v8;
              *((_QWORD *)v170 + 6) = *(_QWORD *)(v8 + 16);
              *(_OWORD *)v171 = v172;
            }
            *(_QWORD *)v170 = 0;
            *((_QWORD *)v170 + 1) = 0;
            *((_QWORD *)v170 + 2) = v153;
            *v155 = v170;
            v173 = **(_QWORD **)(v50 + 224);
            if (v173)
            {
              *(_QWORD *)(v50 + 224) = v173;
              v170 = *v155;
            }
            v174 = *v273;
            v81 = v170 == *v273;
            v170[24] = v81;
            if (!v81)
            {
              do
              {
                v175 = *((_QWORD *)v170 + 2);
                if (*(_BYTE *)(v175 + 24))
                  break;
                v176 = *(char **)(v175 + 16);
                v177 = *(_QWORD *)v176;
                if (*(_QWORD *)v176 == v175)
                {
                  v180 = *((_QWORD *)v176 + 1);
                  if (!v180 || (v181 = *(unsigned __int8 *)(v180 + 24), v178 = (_BYTE *)(v180 + 24), v181))
                  {
                    if (*(char **)v175 == v170)
                    {
                      *(_BYTE *)(v175 + 24) = 1;
                      v176[24] = 0;
                      v184 = *(_QWORD *)(v175 + 8);
                      *(_QWORD *)v176 = v184;
                      if (v184)
                        goto LABEL_289;
                    }
                    else
                    {
                      v182 = *(uint64_t **)(v175 + 8);
                      v183 = *v182;
                      *(_QWORD *)(v175 + 8) = *v182;
                      if (v183)
                      {
                        *(_QWORD *)(v183 + 16) = v175;
                        v176 = *(char **)(v175 + 16);
                      }
                      v182[2] = (uint64_t)v176;
                      *(_QWORD *)(*(_QWORD *)(v175 + 16) + 8 * (**(_QWORD **)(v175 + 16) != v175)) = v182;
                      *v182 = v175;
                      *(_QWORD *)(v175 + 16) = v182;
                      v176 = (char *)v182[2];
                      v175 = *(_QWORD *)v176;
                      *((_BYTE *)v182 + 24) = 1;
                      v176[24] = 0;
                      v184 = *(_QWORD *)(v175 + 8);
                      *(_QWORD *)v176 = v184;
                      if (v184)
LABEL_289:
                        *(_QWORD *)(v184 + 16) = v176;
                    }
                    *(_QWORD *)(v175 + 16) = *((_QWORD *)v176 + 2);
                    *(_QWORD *)(*((_QWORD *)v176 + 2) + 8 * (**((_QWORD **)v176 + 2) != (_QWORD)v176)) = v175;
                    *(_QWORD *)(v175 + 8) = v176;
LABEL_360:
                    *((_QWORD *)v176 + 2) = v175;
                    break;
                  }
                }
                else if (!v177 || (v179 = *(unsigned __int8 *)(v177 + 24), v178 = (_BYTE *)(v177 + 24), v179))
                {
                  if (*(char **)v175 == v170)
                  {
                    v264 = *((_QWORD *)v170 + 1);
                    *(_QWORD *)v175 = v264;
                    if (v264)
                    {
                      *(_QWORD *)(v264 + 16) = v175;
                      v176 = *(char **)(v175 + 16);
                    }
                    *((_QWORD *)v170 + 2) = v176;
                    *(_QWORD *)(*(_QWORD *)(v175 + 16) + 8 * (**(_QWORD **)(v175 + 16) != v175)) = v170;
                    *((_QWORD *)v170 + 1) = v175;
                    *(_QWORD *)(v175 + 16) = v170;
                    v176 = (char *)*((_QWORD *)v170 + 2);
                    v170[24] = 1;
                    v176[24] = 0;
                    v175 = *((_QWORD *)v176 + 1);
                    v223 = *(char **)v175;
                    *((_QWORD *)v176 + 1) = *(_QWORD *)v175;
                    if (v223)
LABEL_358:
                      *((_QWORD *)v223 + 2) = v176;
                  }
                  else
                  {
                    *(_BYTE *)(v175 + 24) = 1;
                    v176[24] = 0;
                    v175 = *((_QWORD *)v176 + 1);
                    v223 = *(char **)v175;
                    *((_QWORD *)v176 + 1) = *(_QWORD *)v175;
                    if (v223)
                      goto LABEL_358;
                  }
                  *(_QWORD *)(v175 + 16) = *((_QWORD *)v176 + 2);
                  *(_QWORD *)(*((_QWORD *)v176 + 2) + 8 * (**((_QWORD **)v176 + 2) != (_QWORD)v176)) = v175;
                  *(_QWORD *)v175 = v176;
                  goto LABEL_360;
                }
                *(_BYTE *)(v175 + 24) = 1;
                v170 = v176;
                v176[24] = v176 == v174;
                *v178 = 1;
              }
              while (v176 != v174);
            }
            ++*(_QWORD *)(v50 + 240);
          }
          if (SHIBYTE(v282) < 0)
          {
            operator delete(__p[0]);
            v224 = (_QWORD *)(v8 + 24);
            v225 = v272;
            v226 = *v272;
            v227 = v272;
            if (*v272)
              goto LABEL_364;
          }
          else
          {
LABEL_363:
            v224 = (_QWORD *)(v8 + 24);
            v225 = v272;
            v226 = *v272;
            v227 = v272;
            if (*v272)
            {
LABEL_364:
              v228 = *(char *)(v8 + 47);
              if (v228 >= 0)
                v229 = *(unsigned __int8 *)(v8 + 47);
              else
                v229 = *(_QWORD *)(v8 + 32);
              if (v228 >= 0)
                v230 = v224;
              else
                v230 = *(const void **)(v8 + 24);
              while (1)
              {
                while (1)
                {
                  v225 = (char **)v226;
                  v233 = (const void *)*((_QWORD *)v226 + 4);
                  v231 = v226 + 32;
                  v232 = v233;
                  v234 = *((char *)v231 + 23);
                  if (v234 >= 0)
                    v235 = *((unsigned __int8 *)v231 + 23);
                  else
                    v235 = v231[1];
                  if (v234 >= 0)
                    v236 = v231;
                  else
                    v236 = v232;
                  if (v235 >= v229)
                    v237 = v229;
                  else
                    v237 = v235;
                  v238 = memcmp(v230, v236, v237);
                  v239 = v229 < v235;
                  if (v238)
                    v239 = v238 < 0;
                  if (!v239)
                    break;
                  v226 = *v225;
                  v227 = v225;
                  if (!*v225)
                    goto LABEL_390;
                }
                v240 = memcmp(v236, v230, v237);
                v241 = v235 < v229;
                if (v240)
                  v241 = v240 < 0;
                if (!v241)
                  break;
                v226 = v225[1];
                if (!v226)
                {
                  v227 = v225 + 1;
                  goto LABEL_390;
                }
              }
              v242 = (char *)v225;
              goto LABEL_418;
            }
          }
LABEL_390:
          v242 = (char *)operator new(0x60uLL);
          v243 = v242 + 32;
          if (*(char *)(v8 + 47) < 0)
          {
            sub_19C07C6E8(v243, *(void **)(v8 + 24), *(_QWORD *)(v8 + 32));
          }
          else
          {
            v244 = *(_OWORD *)v224;
            *((_QWORD *)v242 + 6) = v224[2];
            *(_OWORD *)v243 = v244;
          }
          *((_QWORD *)v242 + 11) = 0;
          *(_OWORD *)(v242 + 72) = 0u;
          *(_OWORD *)(v242 + 56) = 0u;
          *(_QWORD *)v242 = 0;
          *((_QWORD *)v242 + 1) = 0;
          *((_QWORD *)v242 + 2) = v225;
          *v227 = v242;
          v245 = **(_QWORD **)(v276 + 168);
          v246 = v242;
          if (v245)
          {
            *(_QWORD *)(v276 + 168) = v245;
            v246 = *v227;
          }
          v247 = *v272;
          v81 = v246 == *v272;
          v246[24] = v81;
          if (!v81)
          {
            do
            {
              v248 = *((_QWORD *)v246 + 2);
              if (*(_BYTE *)(v248 + 24))
                break;
              v249 = *(char **)(v248 + 16);
              v250 = *(_QWORD *)v249;
              if (*(_QWORD *)v249 == v248)
              {
                v253 = *((_QWORD *)v249 + 1);
                if (!v253 || (v254 = *(unsigned __int8 *)(v253 + 24), v251 = (_BYTE *)(v253 + 24), v254))
                {
                  if (*(char **)v248 == v246)
                  {
                    *(_BYTE *)(v248 + 24) = 1;
                    v249[24] = 0;
                    v257 = *(_QWORD *)(v248 + 8);
                    *(_QWORD *)v249 = v257;
                    if (v257)
                      goto LABEL_410;
                  }
                  else
                  {
                    v255 = *(uint64_t **)(v248 + 8);
                    v256 = *v255;
                    *(_QWORD *)(v248 + 8) = *v255;
                    if (v256)
                    {
                      *(_QWORD *)(v256 + 16) = v248;
                      v249 = *(char **)(v248 + 16);
                    }
                    v255[2] = (uint64_t)v249;
                    *(_QWORD *)(*(_QWORD *)(v248 + 16) + 8 * (**(_QWORD **)(v248 + 16) != v248)) = v255;
                    *v255 = v248;
                    *(_QWORD *)(v248 + 16) = v255;
                    v249 = (char *)v255[2];
                    v248 = *(_QWORD *)v249;
                    *((_BYTE *)v255 + 24) = 1;
                    v249[24] = 0;
                    v257 = *(_QWORD *)(v248 + 8);
                    *(_QWORD *)v249 = v257;
                    if (v257)
LABEL_410:
                      *(_QWORD *)(v257 + 16) = v249;
                  }
                  *(_QWORD *)(v248 + 16) = *((_QWORD *)v249 + 2);
                  *(_QWORD *)(*((_QWORD *)v249 + 2) + 8 * (**((_QWORD **)v249 + 2) != (_QWORD)v249)) = v248;
                  *(_QWORD *)(v248 + 8) = v249;
LABEL_416:
                  *((_QWORD *)v249 + 2) = v248;
                  break;
                }
              }
              else if (!v250 || (v252 = *(unsigned __int8 *)(v250 + 24), v251 = (_BYTE *)(v250 + 24), v252))
              {
                if (*(char **)v248 == v246)
                {
                  v262 = *((_QWORD *)v246 + 1);
                  *(_QWORD *)v248 = v262;
                  if (v262)
                  {
                    *(_QWORD *)(v262 + 16) = v248;
                    v249 = *(char **)(v248 + 16);
                  }
                  *((_QWORD *)v246 + 2) = v249;
                  *(_QWORD *)(*(_QWORD *)(v248 + 16) + 8 * (**(_QWORD **)(v248 + 16) != v248)) = v246;
                  *((_QWORD *)v246 + 1) = v248;
                  *(_QWORD *)(v248 + 16) = v246;
                  v249 = (char *)*((_QWORD *)v246 + 2);
                  v246[24] = 1;
                  v249[24] = 0;
                  v248 = *((_QWORD *)v249 + 1);
                  v258 = *(char **)v248;
                  *((_QWORD *)v249 + 1) = *(_QWORD *)v248;
                  if (v258)
LABEL_414:
                    *((_QWORD *)v258 + 2) = v249;
                }
                else
                {
                  *(_BYTE *)(v248 + 24) = 1;
                  v249[24] = 0;
                  v248 = *((_QWORD *)v249 + 1);
                  v258 = *(char **)v248;
                  *((_QWORD *)v249 + 1) = *(_QWORD *)v248;
                  if (v258)
                    goto LABEL_414;
                }
                *(_QWORD *)(v248 + 16) = *((_QWORD *)v249 + 2);
                *(_QWORD *)(*((_QWORD *)v249 + 2) + 8 * (**((_QWORD **)v249 + 2) != (_QWORD)v249)) = v248;
                *(_QWORD *)v248 = v249;
                goto LABEL_416;
              }
              *(_BYTE *)(v248 + 24) = 1;
              v246 = v249;
              v249[24] = v249 == v247;
              *v251 = 1;
            }
            while (v249 != v247);
          }
          ++*(_QWORD *)(v276 + 184);
LABEL_418:
          v259 = v286;
          *(_OWORD *)(v242 + 56) = v285;
          *(_OWORD *)(v242 + 72) = v259;
          *((_QWORD *)v242 + 11) = v287;
          goto LABEL_16;
        }
        v12 = (__int128 *)(v8 + 24);
        v13 = v278;
        v14 = *v278;
        v15 = v278;
        if (*v278)
        {
          v16 = *(char *)(v8 + 47);
          if (v16 >= 0)
            v17 = *(unsigned __int8 *)(v8 + 47);
          else
            v17 = *(_QWORD *)(v8 + 32);
          if (v16 >= 0)
            v18 = (const void *)(v8 + 24);
          else
            v18 = *(const void **)(v8 + 24);
          while (1)
          {
            while (1)
            {
              v13 = (uint64_t **)v14;
              v21 = (const void *)v14[4];
              v19 = v14 + 4;
              v20 = v21;
              v22 = *((char *)v19 + 23);
              if (v22 >= 0)
                v23 = *((unsigned __int8 *)v19 + 23);
              else
                v23 = v19[1];
              if (v22 >= 0)
                v24 = v19;
              else
                v24 = v20;
              if (v23 >= v17)
                v25 = v17;
              else
                v25 = v23;
              v26 = memcmp(v18, v24, v25);
              v27 = v17 < v23;
              if (v26)
                v27 = v26 < 0;
              if (!v27)
                break;
              v14 = *v13;
              v15 = v13;
              if (!*v13)
                goto LABEL_45;
            }
            v28 = memcmp(v24, v18, v25);
            v29 = v23 < v17;
            if (v28)
              v29 = v28 < 0;
            if (!v29)
              break;
            v14 = v13[1];
            if (!v14)
            {
              v15 = v13 + 1;
              goto LABEL_45;
            }
          }
          v30 = v13;
        }
        else
        {
LABEL_45:
          v30 = operator new(0x40uLL);
          v31 = v30 + 4;
          if (*(char *)(v8 + 47) < 0)
          {
            sub_19C07C6E8(v31, *(void **)(v8 + 24), *(_QWORD *)(v8 + 32));
          }
          else
          {
            v32 = *v12;
            v30[6] = *(_QWORD *)(v8 + 40);
            *(_OWORD *)v31 = v32;
          }
          v30[7] = 0;
          *v30 = 0;
          v30[1] = 0;
          v30[2] = v13;
          *v15 = v30;
          v54 = (uint64_t *)**v274;
          v55 = v30;
          if (v54)
          {
            *v274 = v54;
            v55 = *v15;
          }
          v56 = *v278;
          v81 = v55 == *v278;
          *((_BYTE *)v55 + 24) = v81;
          if (!v81)
          {
            do
            {
              v57 = v55[2];
              if (*(_BYTE *)(v57 + 24))
                break;
              v58 = *(uint64_t **)(v57 + 16);
              v59 = *v58;
              if (*v58 == v57)
              {
                v62 = v58[1];
                if (!v62 || (v63 = *(unsigned __int8 *)(v62 + 24), v60 = (_BYTE *)(v62 + 24), v63))
                {
                  if (*(uint64_t **)v57 == v55)
                  {
                    *(_BYTE *)(v57 + 24) = 1;
                    *((_BYTE *)v58 + 24) = 0;
                    v66 = *(_QWORD *)(v57 + 8);
                    *v58 = v66;
                    if (v66)
                      goto LABEL_92;
                  }
                  else
                  {
                    v64 = *(uint64_t **)(v57 + 8);
                    v65 = *v64;
                    *(_QWORD *)(v57 + 8) = *v64;
                    if (v65)
                    {
                      *(_QWORD *)(v65 + 16) = v57;
                      v58 = *(uint64_t **)(v57 + 16);
                    }
                    v64[2] = (uint64_t)v58;
                    *(_QWORD *)(*(_QWORD *)(v57 + 16) + 8 * (**(_QWORD **)(v57 + 16) != v57)) = v64;
                    *v64 = v57;
                    *(_QWORD *)(v57 + 16) = v64;
                    v58 = (uint64_t *)v64[2];
                    v57 = *v58;
                    *((_BYTE *)v64 + 24) = 1;
                    *((_BYTE *)v58 + 24) = 0;
                    v66 = *(_QWORD *)(v57 + 8);
                    *v58 = v66;
                    if (v66)
LABEL_92:
                      *(_QWORD *)(v66 + 16) = v58;
                  }
                  *(_QWORD *)(v57 + 16) = v58[2];
                  *(_QWORD *)(v58[2] + 8 * (*(_QWORD *)v58[2] != (_QWORD)v58)) = v57;
                  *(_QWORD *)(v57 + 8) = v58;
LABEL_119:
                  v58[2] = v57;
                  break;
                }
              }
              else if (!v59 || (v61 = *(unsigned __int8 *)(v59 + 24), v60 = (_BYTE *)(v59 + 24), v61))
              {
                if (*(uint64_t **)v57 == v55)
                {
                  v185 = v55[1];
                  *(_QWORD *)v57 = v185;
                  if (v185)
                  {
                    *(_QWORD *)(v185 + 16) = v57;
                    v58 = *(uint64_t **)(v57 + 16);
                  }
                  v55[2] = (uint64_t)v58;
                  *(_QWORD *)(*(_QWORD *)(v57 + 16) + 8 * (**(_QWORD **)(v57 + 16) != v57)) = v55;
                  v55[1] = v57;
                  *(_QWORD *)(v57 + 16) = v55;
                  v58 = (uint64_t *)v55[2];
                  *((_BYTE *)v55 + 24) = 1;
                  *((_BYTE *)v58 + 24) = 0;
                  v57 = v58[1];
                  v80 = *(uint64_t **)v57;
                  v58[1] = *(_QWORD *)v57;
                  if (v80)
LABEL_117:
                    v80[2] = (uint64_t)v58;
                }
                else
                {
                  *(_BYTE *)(v57 + 24) = 1;
                  *((_BYTE *)v58 + 24) = 0;
                  v57 = v58[1];
                  v80 = *(uint64_t **)v57;
                  v58[1] = *(_QWORD *)v57;
                  if (v80)
                    goto LABEL_117;
                }
                *(_QWORD *)(v57 + 16) = v58[2];
                *(_QWORD *)(v58[2] + 8 * (*(_QWORD *)v58[2] != (_QWORD)v58)) = v57;
                *(_QWORD *)v57 = v58;
                goto LABEL_119;
              }
              *(_BYTE *)(v57 + 24) = 1;
              v55 = v58;
              *((_BYTE *)v58 + 24) = v58 == v56;
              *v60 = 1;
            }
            while (v58 != v56);
          }
          ++*(_QWORD *)(v276 + 112);
          v11 = *(unsigned int *)(v8 + 52);
        }
        (*(void (**)(void **__return_ptr, _QWORD, uint64_t))(*(_QWORD *)v30[7] + 160))(__p, v30[7], v11);
        v81 = __p[0] == (void *)v285 && __p[1] == *((void **)&v285 + 1);
        if (!v81 || v282 != (_QWORD)v286 || v283 != *((_QWORD *)&v286 + 1) || v284 != v287)
        {
          v85 = v278;
          v86 = *v278;
          v87 = v278;
          if (*v278)
          {
            v88 = *(char *)(v8 + 47);
            if (v88 >= 0)
              v89 = *(unsigned __int8 *)(v8 + 47);
            else
              v89 = *(_QWORD *)(v8 + 32);
            if (v88 >= 0)
              v90 = (const void *)(v8 + 24);
            else
              v90 = *(const void **)(v8 + 24);
            while (1)
            {
              while (1)
              {
                v85 = (uint64_t **)v86;
                v93 = (const void *)v86[4];
                v91 = v86 + 4;
                v92 = v93;
                v94 = *((char *)v91 + 23);
                if (v94 >= 0)
                  v95 = *((unsigned __int8 *)v91 + 23);
                else
                  v95 = v91[1];
                if (v94 >= 0)
                  v96 = v91;
                else
                  v96 = v92;
                if (v95 >= v89)
                  v97 = v89;
                else
                  v97 = v95;
                v98 = memcmp(v90, v96, v97);
                v99 = v89 < v95;
                if (v98)
                  v99 = v98 < 0;
                if (!v99)
                  break;
                v86 = *v85;
                v87 = v85;
                if (!*v85)
                  goto LABEL_159;
              }
              v100 = memcmp(v96, v90, v97);
              v101 = v95 < v89;
              if (v100)
                v101 = v100 < 0;
              if (!v101)
                break;
              v86 = v85[1];
              if (!v86)
              {
                v87 = v85 + 1;
                goto LABEL_159;
              }
            }
            v103 = v85;
            v102 = v276;
          }
          else
          {
LABEL_159:
            v102 = v276;
            v103 = operator new(0x40uLL);
            v104 = v103 + 4;
            if (*(char *)(v8 + 47) < 0)
            {
              sub_19C07C6E8(v104, *(void **)(v8 + 24), *(_QWORD *)(v8 + 32));
            }
            else
            {
              v105 = *v12;
              v103[6] = *(_QWORD *)(v8 + 40);
              *(_OWORD *)v104 = v105;
            }
            v103[7] = 0;
            *v103 = 0;
            v103[1] = 0;
            v103[2] = v85;
            *v87 = v103;
            v106 = (uint64_t *)**v274;
            v107 = v103;
            if (v106)
            {
              *v274 = v106;
              v107 = *v87;
            }
            v108 = *v278;
            v81 = v107 == *v278;
            *((_BYTE *)v107 + 24) = v81;
            if (!v81)
            {
              do
              {
                v109 = v107[2];
                if (*(_BYTE *)(v109 + 24))
                  break;
                v110 = *(uint64_t **)(v109 + 16);
                v111 = *v110;
                if (*v110 == v109)
                {
                  v114 = v110[1];
                  if (!v114 || (v115 = *(unsigned __int8 *)(v114 + 24), v112 = (_BYTE *)(v114 + 24), v115))
                  {
                    if (*(uint64_t **)v109 == v107)
                    {
                      *(_BYTE *)(v109 + 24) = 1;
                      *((_BYTE *)v110 + 24) = 0;
                      v118 = *(_QWORD *)(v109 + 8);
                      *v110 = v118;
                      if (v118)
                        goto LABEL_179;
                    }
                    else
                    {
                      v116 = *(uint64_t **)(v109 + 8);
                      v117 = *v116;
                      *(_QWORD *)(v109 + 8) = *v116;
                      if (v117)
                      {
                        *(_QWORD *)(v117 + 16) = v109;
                        v110 = *(uint64_t **)(v109 + 16);
                      }
                      v116[2] = (uint64_t)v110;
                      *(_QWORD *)(*(_QWORD *)(v109 + 16) + 8 * (**(_QWORD **)(v109 + 16) != v109)) = v116;
                      *v116 = v109;
                      *(_QWORD *)(v109 + 16) = v116;
                      v110 = (uint64_t *)v116[2];
                      v109 = *v110;
                      *((_BYTE *)v116 + 24) = 1;
                      *((_BYTE *)v110 + 24) = 0;
                      v118 = *(_QWORD *)(v109 + 8);
                      *v110 = v118;
                      if (v118)
LABEL_179:
                        *(_QWORD *)(v118 + 16) = v110;
                    }
                    *(_QWORD *)(v109 + 16) = v110[2];
                    *(_QWORD *)(v110[2] + 8 * (*(_QWORD *)v110[2] != (_QWORD)v110)) = v109;
                    *(_QWORD *)(v109 + 8) = v110;
LABEL_187:
                    v110[2] = v109;
                    break;
                  }
                }
                else if (!v111 || (v113 = *(unsigned __int8 *)(v111 + 24), v112 = (_BYTE *)(v111 + 24), v113))
                {
                  if (*(uint64_t **)v109 == v107)
                  {
                    v260 = v107[1];
                    *(_QWORD *)v109 = v260;
                    if (v260)
                    {
                      *(_QWORD *)(v260 + 16) = v109;
                      v110 = *(uint64_t **)(v109 + 16);
                    }
                    v107[2] = (uint64_t)v110;
                    *(_QWORD *)(*(_QWORD *)(v109 + 16) + 8 * (**(_QWORD **)(v109 + 16) != v109)) = v107;
                    v107[1] = v109;
                    *(_QWORD *)(v109 + 16) = v107;
                    v110 = (uint64_t *)v107[2];
                    *((_BYTE *)v107 + 24) = 1;
                    *((_BYTE *)v110 + 24) = 0;
                    v109 = v110[1];
                    v119 = *(uint64_t **)v109;
                    v110[1] = *(_QWORD *)v109;
                    if (v119)
LABEL_185:
                      v119[2] = (uint64_t)v110;
                  }
                  else
                  {
                    *(_BYTE *)(v109 + 24) = 1;
                    *((_BYTE *)v110 + 24) = 0;
                    v109 = v110[1];
                    v119 = *(uint64_t **)v109;
                    v110[1] = *(_QWORD *)v109;
                    if (v119)
                      goto LABEL_185;
                  }
                  *(_QWORD *)(v109 + 16) = v110[2];
                  *(_QWORD *)(v110[2] + 8 * (*(_QWORD *)v110[2] != (_QWORD)v110)) = v109;
                  *(_QWORD *)v109 = v110;
                  goto LABEL_187;
                }
                *(_BYTE *)(v109 + 24) = 1;
                v107 = v110;
                *((_BYTE *)v110 + 24) = v110 == v108;
                *v112 = 1;
              }
              while (v110 != v108);
            }
            ++*(_QWORD *)(v276 + 112);
          }
          if ((*(unsigned int (**)(_QWORD, __int128 *, _QWORD))(*(_QWORD *)v103[7] + 304))(v103[7], &v285, *(unsigned int *)(v8 + 52)))
          {
            v120 = v273;
            v121 = *v273;
            v122 = v273;
            if (*v273)
            {
              v123 = *(char *)(v8 + 47);
              if (v123 >= 0)
                v124 = *(unsigned __int8 *)(v8 + 47);
              else
                v124 = *(_QWORD *)(v8 + 32);
              if (v123 >= 0)
                v125 = (const void *)(v8 + 24);
              else
                v125 = *(const void **)(v8 + 24);
              while (1)
              {
                while (1)
                {
                  v120 = (char **)v121;
                  v128 = (const void *)*((_QWORD *)v121 + 4);
                  v126 = v121 + 32;
                  v127 = v128;
                  v129 = *((char *)v126 + 23);
                  if (v129 >= 0)
                    v130 = *((unsigned __int8 *)v126 + 23);
                  else
                    v130 = v126[1];
                  if (v129 >= 0)
                    v131 = v126;
                  else
                    v131 = v127;
                  if (v130 >= v124)
                    v132 = v124;
                  else
                    v132 = v130;
                  v133 = memcmp(v125, v131, v132);
                  v134 = v124 < v130;
                  if (v133)
                    v134 = v133 < 0;
                  if (!v134)
                    break;
                  v121 = *v120;
                  v122 = v120;
                  if (!*v120)
                    goto LABEL_215;
                }
                v135 = memcmp(v131, v125, v132);
                v136 = v130 < v124;
                if (v135)
                  v136 = v135 < 0;
                if (!v136)
                  break;
                v121 = v120[1];
                if (!v121)
                {
                  v122 = v120 + 1;
                  goto LABEL_215;
                }
              }
            }
            else
            {
LABEL_215:
              v137 = (char *)operator new(0x38uLL);
              v138 = v137 + 32;
              if (*(char *)(v8 + 47) < 0)
              {
                sub_19C07C6E8(v138, *(void **)(v8 + 24), *(_QWORD *)(v8 + 32));
              }
              else
              {
                v139 = *v12;
                *((_QWORD *)v137 + 6) = *(_QWORD *)(v8 + 40);
                *(_OWORD *)v138 = v139;
              }
              *(_QWORD *)v137 = 0;
              *((_QWORD *)v137 + 1) = 0;
              *((_QWORD *)v137 + 2) = v120;
              *v122 = v137;
              v140 = **(_QWORD **)(v102 + 224);
              if (v140)
              {
                *(_QWORD *)(v102 + 224) = v140;
                v137 = *v122;
              }
              v141 = *v273;
              v81 = v137 == *v273;
              v137[24] = v81;
              if (!v81)
              {
                do
                {
                  v142 = *((_QWORD *)v137 + 2);
                  if (*(_BYTE *)(v142 + 24))
                    break;
                  v143 = *(char **)(v142 + 16);
                  v144 = *(_QWORD *)v143;
                  if (*(_QWORD *)v143 == v142)
                  {
                    v147 = *((_QWORD *)v143 + 1);
                    if (!v147 || (v148 = *(unsigned __int8 *)(v147 + 24), v145 = (_BYTE *)(v147 + 24), v148))
                    {
                      if (*(char **)v142 == v137)
                      {
                        *(_BYTE *)(v142 + 24) = 1;
                        v143[24] = 0;
                        v151 = *(_QWORD *)(v142 + 8);
                        *(_QWORD *)v143 = v151;
                        if (v151)
                          goto LABEL_235;
                      }
                      else
                      {
                        v149 = *(uint64_t **)(v142 + 8);
                        v150 = *v149;
                        *(_QWORD *)(v142 + 8) = *v149;
                        if (v150)
                        {
                          *(_QWORD *)(v150 + 16) = v142;
                          v143 = *(char **)(v142 + 16);
                        }
                        v149[2] = (uint64_t)v143;
                        *(_QWORD *)(*(_QWORD *)(v142 + 16) + 8 * (**(_QWORD **)(v142 + 16) != v142)) = v149;
                        *v149 = v142;
                        *(_QWORD *)(v142 + 16) = v149;
                        v143 = (char *)v149[2];
                        v142 = *(_QWORD *)v143;
                        *((_BYTE *)v149 + 24) = 1;
                        v143[24] = 0;
                        v151 = *(_QWORD *)(v142 + 8);
                        *(_QWORD *)v143 = v151;
                        if (v151)
LABEL_235:
                          *(_QWORD *)(v151 + 16) = v143;
                      }
                      *(_QWORD *)(v142 + 16) = *((_QWORD *)v143 + 2);
                      *(_QWORD *)(*((_QWORD *)v143 + 2) + 8 * (**((_QWORD **)v143 + 2) != (_QWORD)v143)) = v142;
                      *(_QWORD *)(v142 + 8) = v143;
LABEL_299:
                      *((_QWORD *)v143 + 2) = v142;
                      break;
                    }
                  }
                  else if (!v144 || (v146 = *(unsigned __int8 *)(v144 + 24), v145 = (_BYTE *)(v144 + 24), v146))
                  {
                    if (*(char **)v142 == v137)
                    {
                      v263 = *((_QWORD *)v137 + 1);
                      *(_QWORD *)v142 = v263;
                      if (v263)
                      {
                        *(_QWORD *)(v263 + 16) = v142;
                        v143 = *(char **)(v142 + 16);
                      }
                      *((_QWORD *)v137 + 2) = v143;
                      *(_QWORD *)(*(_QWORD *)(v142 + 16) + 8 * (**(_QWORD **)(v142 + 16) != v142)) = v137;
                      *((_QWORD *)v137 + 1) = v142;
                      *(_QWORD *)(v142 + 16) = v137;
                      v143 = (char *)*((_QWORD *)v137 + 2);
                      v137[24] = 1;
                      v143[24] = 0;
                      v142 = *((_QWORD *)v143 + 1);
                      v186 = *(char **)v142;
                      *((_QWORD *)v143 + 1) = *(_QWORD *)v142;
                      if (v186)
LABEL_297:
                        *((_QWORD *)v186 + 2) = v143;
                    }
                    else
                    {
                      *(_BYTE *)(v142 + 24) = 1;
                      v143[24] = 0;
                      v142 = *((_QWORD *)v143 + 1);
                      v186 = *(char **)v142;
                      *((_QWORD *)v143 + 1) = *(_QWORD *)v142;
                      if (v186)
                        goto LABEL_297;
                    }
                    *(_QWORD *)(v142 + 16) = *((_QWORD *)v143 + 2);
                    *(_QWORD *)(*((_QWORD *)v143 + 2) + 8 * (**((_QWORD **)v143 + 2) != (_QWORD)v143)) = v142;
                    *(_QWORD *)v142 = v143;
                    goto LABEL_299;
                  }
                  *(_BYTE *)(v142 + 24) = 1;
                  v137 = v143;
                  v143[24] = v143 == v141;
                  *v145 = 1;
                }
                while (v143 != v141);
              }
              ++*(_QWORD *)(v102 + 240);
            }
          }
        }
        v187 = v278;
        v188 = *v278;
        v189 = v278;
        if (*v278)
        {
          v190 = *(char *)(v8 + 47);
          if (v190 >= 0)
            v191 = *(unsigned __int8 *)(v8 + 47);
          else
            v191 = *(_QWORD *)(v8 + 32);
          if (v190 >= 0)
            v192 = (const void *)(v8 + 24);
          else
            v192 = *(const void **)(v8 + 24);
          while (1)
          {
            while (1)
            {
              v187 = (uint64_t **)v188;
              v195 = (const void *)v188[4];
              v193 = v188 + 4;
              v194 = v195;
              v196 = *((char *)v193 + 23);
              if (v196 >= 0)
                v197 = *((unsigned __int8 *)v193 + 23);
              else
                v197 = v193[1];
              if (v196 >= 0)
                v198 = v193;
              else
                v198 = v194;
              if (v197 >= v191)
                v199 = v191;
              else
                v199 = v197;
              v200 = memcmp(v192, v198, v199);
              v201 = v191 < v197;
              if (v200)
                v201 = v200 < 0;
              if (!v201)
                break;
              v188 = *v187;
              v189 = v187;
              if (!*v187)
                goto LABEL_326;
            }
            v202 = memcmp(v198, v192, v199);
            v203 = v197 < v191;
            if (v202)
              v203 = v202 < 0;
            if (!v203)
              break;
            v188 = v187[1];
            if (!v188)
            {
              v189 = v187 + 1;
              goto LABEL_326;
            }
          }
          v205 = v187;
          v204 = v276;
        }
        else
        {
LABEL_326:
          v204 = v276;
          v205 = operator new(0x40uLL);
          v206 = v205 + 4;
          if (*(char *)(v8 + 47) < 0)
          {
            sub_19C07C6E8(v206, *(void **)(v8 + 24), *(_QWORD *)(v8 + 32));
          }
          else
          {
            v207 = *v12;
            v205[6] = *(_QWORD *)(v8 + 40);
            *(_OWORD *)v206 = v207;
          }
          v205[7] = 0;
          *v205 = 0;
          v205[1] = 0;
          v205[2] = v187;
          *v189 = v205;
          v208 = (uint64_t *)**v274;
          v209 = v205;
          if (v208)
          {
            *v274 = v208;
            v209 = *v189;
          }
          v210 = *v278;
          v81 = v209 == *v278;
          *((_BYTE *)v209 + 24) = v81;
          if (!v81)
          {
            do
            {
              v211 = v209[2];
              if (*(_BYTE *)(v211 + 24))
                break;
              v212 = *(uint64_t **)(v211 + 16);
              v213 = *v212;
              if (*v212 == v211)
              {
                v216 = v212[1];
                if (!v216 || (v217 = *(unsigned __int8 *)(v216 + 24), v214 = (_BYTE *)(v216 + 24), v217))
                {
                  if (*(uint64_t **)v211 == v209)
                  {
                    *(_BYTE *)(v211 + 24) = 1;
                    *((_BYTE *)v212 + 24) = 0;
                    v220 = *(_QWORD *)(v211 + 8);
                    *v212 = v220;
                    if (v220)
                      goto LABEL_346;
                  }
                  else
                  {
                    v218 = *(uint64_t **)(v211 + 8);
                    v219 = *v218;
                    *(_QWORD *)(v211 + 8) = *v218;
                    if (v219)
                    {
                      *(_QWORD *)(v219 + 16) = v211;
                      v212 = *(uint64_t **)(v211 + 16);
                    }
                    v218[2] = (uint64_t)v212;
                    *(_QWORD *)(*(_QWORD *)(v211 + 16) + 8 * (**(_QWORD **)(v211 + 16) != v211)) = v218;
                    *v218 = v211;
                    *(_QWORD *)(v211 + 16) = v218;
                    v212 = (uint64_t *)v218[2];
                    v211 = *v212;
                    *((_BYTE *)v218 + 24) = 1;
                    *((_BYTE *)v212 + 24) = 0;
                    v220 = *(_QWORD *)(v211 + 8);
                    *v212 = v220;
                    if (v220)
LABEL_346:
                      *(_QWORD *)(v220 + 16) = v212;
                  }
                  *(_QWORD *)(v211 + 16) = v212[2];
                  *(_QWORD *)(v212[2] + 8 * (*(_QWORD *)v212[2] != (_QWORD)v212)) = v211;
                  *(_QWORD *)(v211 + 8) = v212;
LABEL_13:
                  v212[2] = v211;
                  break;
                }
              }
              else if (!v213 || (v215 = *(unsigned __int8 *)(v213 + 24), v214 = (_BYTE *)(v213 + 24), v215))
              {
                if (*(uint64_t **)v211 == v209)
                {
                  v222 = v209[1];
                  *(_QWORD *)v211 = v222;
                  if (v222)
                  {
                    *(_QWORD *)(v222 + 16) = v211;
                    v212 = *(uint64_t **)(v211 + 16);
                  }
                  v209[2] = (uint64_t)v212;
                  *(_QWORD *)(*(_QWORD *)(v211 + 16) + 8 * (**(_QWORD **)(v211 + 16) != v211)) = v209;
                  v209[1] = v211;
                  *(_QWORD *)(v211 + 16) = v209;
                  v212 = (uint64_t *)v209[2];
                  *((_BYTE *)v209 + 24) = 1;
                  *((_BYTE *)v212 + 24) = 0;
                  v211 = v212[1];
                  v221 = *(uint64_t **)v211;
                  v212[1] = *(_QWORD *)v211;
                  if (!v221)
                    goto LABEL_12;
                }
                else
                {
                  *(_BYTE *)(v211 + 24) = 1;
                  *((_BYTE *)v212 + 24) = 0;
                  v211 = v212[1];
                  v221 = *(uint64_t **)v211;
                  v212[1] = *(_QWORD *)v211;
                  if (!v221)
                    goto LABEL_12;
                }
                v221[2] = (uint64_t)v212;
LABEL_12:
                *(_QWORD *)(v211 + 16) = v212[2];
                *(_QWORD *)(v212[2] + 8 * (*(_QWORD *)v212[2] != (_QWORD)v212)) = v211;
                *(_QWORD *)v211 = v212;
                goto LABEL_13;
              }
              *(_BYTE *)(v211 + 24) = 1;
              v209 = v212;
              *((_BYTE *)v212 + 24) = v212 == v210;
              *v214 = 1;
            }
            while (v212 != v210);
          }
          ++*(_QWORD *)(v276 + 112);
        }
        v9 = v205[7];
        v279[0] = v285;
        v279[1] = v286;
        v280 = v287;
        (*(void (**)(uint64_t, _OWORD *, _QWORD, _QWORD))(*(_QWORD *)v9 + 176))(v9, v279, *(unsigned int *)(v8 + 52), *(unsigned __int8 *)(v204 + 248));
      }
LABEL_16:
      v8 += 56;
    }
  }
  return 1;
}

void sub_19C23242C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;

  if (*(char *)(v33 - 89) < 0)
  {
    operator delete(*(void **)(v33 - 112));
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C232520(const char *a1, uint64_t a2, const char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  std::ios_base *v11;
  uint64_t v12;
  size_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  uint64_t v19;
  uint64_t v20[8];
  void *__p[2];
  __int128 v22;
  int v23;
  uint64_t v24[20];

  v6 = MEMORY[0x1E0DE4FE0];
  v7 = MEMORY[0x1E0DE4FE0] + 64;
  v8 = (uint64_t *)MEMORY[0x1E0DE4F60];
  v9 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  v10 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  v24[0] = MEMORY[0x1E0DE4FE0] + 64;
  v19 = v9;
  *(uint64_t *)((char *)&v20[-1] + *(_QWORD *)(v9 - 24)) = v10;
  v11 = (std::ios_base *)((char *)&v20[-1] + *(_QWORD *)(v19 - 24));
  std::ios_base::init(v11, v20);
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  v19 = v6 + 24;
  v24[0] = v7;
  std::streambuf::basic_streambuf();
  v12 = MEMORY[0x1E0DE4FB8];
  v20[0] = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)__p = 0u;
  v22 = 0u;
  v23 = 16;
  v13 = strlen(a1);
  sub_19C07DCDC(&v19, (uint64_t)a1, v13);
  v14 = *(char *)(a2 + 23);
  if (v14 >= 0)
    v15 = a2;
  else
    v15 = *(_QWORD *)a2;
  if (v14 >= 0)
    v16 = *(unsigned __int8 *)(a2 + 23);
  else
    v16 = *(_QWORD *)(a2 + 8);
  sub_19C07DCDC(&v19, v15, v16);
  v17 = strlen(a3);
  sub_19C07DCDC(&v19, (uint64_t)a3, v17);
  std::ostream::operator<<();
  std::stringbuf::str();
  v19 = *v8;
  *(uint64_t *)((char *)&v20[-1] + *(_QWORD *)(v19 - 24)) = v8[3];
  v20[0] = v12 + 16;
  if (SBYTE7(v22) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1A1AD1C08](v24);
}

void sub_19C2326BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  sub_19C07DC58((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19C2326D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::ostream::~ostream();
  MEMORY[0x1A1AD1C08](a10);
  _Unwind_Resume(a1);
}

uint64_t sub_19C232718(uint64_t a1, uint64_t a2)
{
  const void **v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;
  size_t v7;
  const void *v8;
  uint64_t *v9;
  int v10;
  size_t v11;
  const void *v12;
  size_t v13;
  int v14;
  _BOOL4 v15;
  BOOL v16;
  uint64_t *v17;
  const void *v18;
  _QWORD *v19;
  const void *v20;
  int v21;
  size_t v22;
  const void *v23;
  size_t v24;
  int v25;
  _BOOL4 v26;
  uint64_t **v27;
  const void **v28;
  const void ***v29;
  uint64_t v30;
  _QWORD **v31;
  __int128 *v32;
  __int128 v33;
  uint64_t **v34;
  _DWORD *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  unint64_t *p_shared_owners;
  uint64_t *v45;
  unint64_t v46;
  std::__shared_weak_count *v47;
  unint64_t *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  std::__shared_weak_count *v53;
  __int128 *v54;
  const void ***v55;
  const void **v56;
  const void ***v57;
  int v58;
  size_t v59;
  const void *v60;
  _QWORD *v61;
  const void *v62;
  const void *v63;
  int v64;
  size_t v65;
  const void *v66;
  size_t v67;
  int v68;
  _BOOL4 v69;
  int v70;
  _BOOL4 v71;
  _QWORD *v72;
  _BYTE *v73;
  __int128 v74;
  std::__shared_weak_count *v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t **v78;
  int v79;
  size_t v80;
  const void *v81;
  _QWORD *v82;
  const void *v83;
  const void *v84;
  int v85;
  size_t v86;
  const void *v87;
  size_t v88;
  int v89;
  _BOOL4 v90;
  int v91;
  _BOOL4 v92;
  _QWORD *v93;
  _BYTE *v94;
  __int128 v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  _BYTE *v102;
  int v103;
  uint64_t v104;
  int v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  uint64_t *v110;
  uint64_t *v111;
  std::__shared_weak_count *v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  _BYTE *v116;
  int v117;
  uint64_t v118;
  int v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  unint64_t v125;
  std::__shared_weak_count *v126;
  unint64_t *v127;
  unint64_t v128;
  uint64_t *v129;
  unint64_t v130;
  unint64_t *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t v138;
  const void **v139;
  const void ***v140;
  __int128 *v142;
  __int128 *v144;
  _DWORD *v145;
  uint64_t *v146;
  uint64_t **v147;
  _QWORD **v148;
  uint64_t **v149;
  uint64_t **v150;
  uint64_t v151;
  uint64_t v152;
  _DWORD *v153;
  std::__shared_weak_count *v154;
  const void ***v155;
  std::__shared_weak_count *v156;
  std::__shared_weak_count *v157;
  std::__shared_weak_count *v158;
  std::__shared_weak_count *v159;
  __int128 *p_dst;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  _DWORD *v165;
  _DWORD *v166;
  __int128 __dst;
  uint64_t v168;

  sub_19C230C64(a1);
  v151 = a1;
  v3 = *(const void ***)(a1 + 96);
  v149 = (uint64_t **)(a1 + 96);
  v155 = (const void ***)(a1 + 104);
  if (v3 != (const void **)(a1 + 104))
  {
    v4 = (uint64_t *)(a1 + 232);
    v5 = *(_QWORD *)(a1 + 232);
    if (v5)
    {
LABEL_5:
      v6 = *((char *)v3 + 55);
      if (v6 >= 0)
        v7 = *((unsigned __int8 *)v3 + 55);
      else
        v7 = (size_t)v3[5];
      if (v6 >= 0)
        v8 = v3 + 4;
      else
        v8 = v3[4];
      v9 = (uint64_t *)(a1 + 232);
      do
      {
        v10 = *(char *)(v5 + 55);
        if (v10 >= 0)
          v11 = *(unsigned __int8 *)(v5 + 55);
        else
          v11 = *(_QWORD *)(v5 + 40);
        if (v10 >= 0)
          v12 = (const void *)(v5 + 32);
        else
          v12 = *(const void **)(v5 + 32);
        if (v7 >= v11)
          v13 = v11;
        else
          v13 = v7;
        v14 = memcmp(v12, v8, v13);
        v15 = v11 < v7;
        if (v14)
          v15 = v14 < 0;
        v16 = !v15;
        if (v15)
          v17 = (uint64_t *)(v5 + 8);
        else
          v17 = (uint64_t *)v5;
        if (v16)
          v9 = (uint64_t *)v5;
        v5 = *v17;
      }
      while (*v17);
      if (v9 != v4)
      {
        v20 = (const void *)v9[4];
        v19 = v9 + 4;
        v18 = v20;
        v21 = *((char *)v19 + 23);
        if (v21 >= 0)
          v22 = *((unsigned __int8 *)v19 + 23);
        else
          v22 = v19[1];
        if (v21 >= 0)
          v23 = v19;
        else
          v23 = v18;
        if (v22 >= v7)
          v24 = v7;
        else
          v24 = v22;
        v25 = memcmp(v8, v23, v24);
        v26 = v7 >= v22;
        if (v25)
          v26 = v25 >= 0;
        if (v26)
        {
          p_dst = (__int128 *)(v3 + 4);
          v27 = sub_19C19E844(v149, v3 + 4, (uint64_t)&unk_19C27ADD0, &p_dst);
          sub_19C233480(a1, (uint64_t)v27[7]);
        }
      }
      while (1)
      {
        v28 = (const void **)v3[1];
        if (v28)
        {
          do
          {
            v29 = (const void ***)v28;
            v28 = (const void **)*v28;
          }
          while (v28);
        }
        else
        {
          do
          {
            v29 = (const void ***)v3[2];
            v16 = *v29 == v3;
            v3 = (const void **)v29;
          }
          while (!v16);
        }
        if (v29 == v155)
          break;
        v5 = *v4;
        v3 = (const void **)v29;
        if (*v4)
          goto LABEL_5;
      }
    }
    else
    {
      do
      {
        v139 = (const void **)v3[1];
        if (v139)
        {
          do
          {
            v140 = (const void ***)v139;
            v139 = (const void **)*v139;
          }
          while (v139);
        }
        else
        {
          do
          {
            v140 = (const void ***)v3[2];
            v16 = *v140 == v3;
            v3 = (const void **)v140;
          }
          while (!v16);
        }
        v3 = (const void **)v140;
      }
      while (v140 != v155);
    }
  }
  sub_19C098FBC(a1 + 224, *(char **)(a1 + 232));
  *(_QWORD *)(a1 + 224) = a1 + 232;
  *(_QWORD *)(a1 + 232) = 0;
  v30 = *(_QWORD *)(a1 + 200);
  *(_QWORD *)(a1 + 240) = 0;
  v31 = (_QWORD **)(a1 + 192);
  sub_19C235E6C(v151 + 192, v30);
  *(_QWORD *)(v151 + 192) = v151 + 200;
  *(_QWORD *)(v151 + 200) = 0;
  *(_QWORD *)(v151 + 208) = 0;
  v32 = *(__int128 **)(v151 + 120);
  v150 = (uint64_t **)(v151 + 200);
  v142 = *(__int128 **)(v151 + 128);
  if (v32 != v142)
  {
    v148 = v31;
LABEL_53:
    v144 = v32;
    if (*((char *)v32 + 23) < 0)
    {
      sub_19C07C6E8(&__dst, *(void **)v32, *((_QWORD *)v32 + 1));
    }
    else
    {
      v33 = *v32;
      v168 = *((_QWORD *)v32 + 2);
      __dst = v33;
    }
    p_dst = &__dst;
    v34 = sub_19C19E844(v149, (const void **)&__dst, (uint64_t)&unk_19C27ADD0, &p_dst);
    p_dst = &__dst;
    v146 = sub_19C235F0C((uint64_t **)(v151 + 144), (const void **)&__dst, (uint64_t)&unk_19C27ADD0, &p_dst);
    (*(void (**)(_DWORD **__return_ptr))(*v34[7] + 24))(&v165);
    v35 = v165;
    v145 = v166;
    if (v165 == v166)
      goto LABEL_208;
    v147 = v34;
    while (1)
    {
      (*(void (**)(__int128 **__return_ptr, uint64_t *, _QWORD))(*v34[7] + 168))(&p_dst, v34[7], *v35);
      v36 = (*(uint64_t (**)(uint64_t *))(*v34[7] + 88))(v34[7]);
      v37 = (int)p_dst;
      v38 = v161;
      v40 = v162;
      v39 = v163;
      v41 = v164;
      v42 = *(_QWORD *)(v151 + 64);
      v43 = (std::__shared_weak_count *)operator new(0x30uLL);
      v43->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v43->__shared_owners_;
      v43->__shared_weak_owners_ = 0;
      v43->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E3D25068;
      sub_19C19EA20((uint64_t)&v43[1], v36 * v38 * v37 * v40 * v39 * v41, v42);
      v45 = v147[7];
      v158 = v43 + 1;
      v159 = v43;
      do
        v46 = __ldxr(p_shared_owners);
      while (__stxr(v46 + 1, p_shared_owners));
      (*(void (**)(uint64_t *, std::__shared_weak_count **, _QWORD))(*v45 + 272))(v45, &v158, *v35);
      v47 = v159;
      if (v159)
      {
        v48 = (unint64_t *)&v159->__shared_owners_;
        do
          v49 = __ldaxr(v48);
        while (__stlxr(v49 - 1, v48));
        if (!v49)
          break;
      }
      v50 = v146[7];
      v51 = v146[8];
      v153 = v35;
      v154 = v43 + 1;
      v152 = v51;
      if (v50 != v51)
        goto LABEL_73;
LABEL_66:
      v34 = v147;
      do
        v52 = __ldaxr(p_shared_owners);
      while (__stlxr(v52 - 1, p_shared_owners));
      if (!v52)
      {
        ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
        std::__shared_weak_count::__release_weak(v43);
      }
      if (++v35 == v145)
      {
        v35 = v165;
LABEL_208:
        if (v35)
        {
          v166 = v35;
          operator delete(v35);
        }
        v134 = v34[7];
        v135 = (*(uint64_t (**)(uint64_t *))(*v134 + 224))(v134);
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(*v134 + 280))(v134, a2, v135);
        v136 = v34[7];
        v137 = (*(uint64_t (**)(uint64_t *, uint64_t))(*v136 + 216))(v136, 1);
        v138 = (*(uint64_t (**)(uint64_t *))(*v34[7] + 224))(v34[7]);
        (*(void (**)(uint64_t *, uint64_t, uint64_t))(*v136 + 256))(v136, v137, v138);
        if (SHIBYTE(v168) < 0)
          operator delete((void *)__dst);
        v32 = (__int128 *)((char *)v144 + 24);
        if ((__int128 *)((char *)v144 + 24) == v142)
          goto LABEL_219;
        goto LABEL_53;
      }
    }
    ((void (*)(std::__shared_weak_count *))v47->__on_zero_shared)(v47);
    std::__shared_weak_count::__release_weak(v47);
    v50 = v146[7];
    v51 = v146[8];
    v153 = v35;
    v154 = v43 + 1;
    v152 = v51;
    if (v50 == v51)
      goto LABEL_66;
    while (1)
    {
LABEL_73:
      if (*(_DWORD *)(v50 + 48) == *v35)
      {
        v53 = v43;
        v54 = (__int128 *)(v50 + 24);
        if (*(_DWORD *)(v50 + 52))
        {
          v55 = v155;
          v56 = *v155;
          v57 = v155;
          if (*v155)
          {
            v58 = *(char *)(v50 + 47);
            if (v58 >= 0)
              v59 = *(unsigned __int8 *)(v50 + 47);
            else
              v59 = *(_QWORD *)(v50 + 32);
            if (v58 >= 0)
              v60 = (const void *)(v50 + 24);
            else
              v60 = *(const void **)(v50 + 24);
            while (1)
            {
              while (1)
              {
                v55 = (const void ***)v56;
                v63 = v56[4];
                v61 = v56 + 4;
                v62 = v63;
                v64 = *((char *)v61 + 23);
                if (v64 >= 0)
                  v65 = *((unsigned __int8 *)v61 + 23);
                else
                  v65 = v61[1];
                if (v64 >= 0)
                  v66 = v61;
                else
                  v66 = v62;
                if (v65 >= v59)
                  v67 = v59;
                else
                  v67 = v65;
                v68 = memcmp(v60, v66, v67);
                v69 = v59 < v65;
                if (v68)
                  v69 = v68 < 0;
                if (!v69)
                  break;
                v56 = *v55;
                v57 = v55;
                if (!*v55)
                  goto LABEL_100;
              }
              v70 = memcmp(v66, v60, v67);
              v71 = v65 < v59;
              if (v70)
                v71 = v70 < 0;
              if (!v71)
                break;
              v56 = v55[1];
              if (!v56)
              {
                v57 = v55 + 1;
                goto LABEL_100;
              }
            }
            v72 = v55;
            v43 = v53;
            v35 = v153;
            v75 = v154;
            v51 = v152;
          }
          else
          {
LABEL_100:
            v72 = operator new(0x40uLL);
            v73 = v72 + 4;
            if (*(char *)(v50 + 47) < 0)
            {
              v43 = v53;
              sub_19C07C6E8(v73, *(void **)(v50 + 24), *(_QWORD *)(v50 + 32));
            }
            else
            {
              v74 = *v54;
              v72[6] = *(_QWORD *)(v50 + 40);
              *(_OWORD *)v73 = v74;
              v43 = v53;
            }
            v75 = v154;
            v72[7] = 0;
            *v72 = 0;
            v72[1] = 0;
            v72[2] = v55;
            *v57 = (const void **)v72;
            v96 = (uint64_t *)**v149;
            v97 = v72;
            if (v96)
            {
              *v149 = v96;
              v97 = (uint64_t *)*v57;
            }
            v98 = (uint64_t *)*v155;
            v16 = v97 == (uint64_t *)*v155;
            *((_BYTE *)v97 + 24) = v16;
            v51 = v152;
            v35 = v153;
            if (!v16)
            {
              do
              {
                v99 = v97[2];
                if (*(_BYTE *)(v99 + 24))
                  break;
                v100 = *(uint64_t **)(v99 + 16);
                v101 = *v100;
                if (*v100 == v99)
                {
                  v104 = v100[1];
                  if (!v104 || (v105 = *(unsigned __int8 *)(v104 + 24), v102 = (_BYTE *)(v104 + 24), v105))
                  {
                    if (*(uint64_t **)v99 == v97)
                    {
                      *(_BYTE *)(v99 + 24) = 1;
                      *((_BYTE *)v100 + 24) = 0;
                      v108 = *(_QWORD *)(v99 + 8);
                      *v100 = v108;
                      if (v108)
                        goto LABEL_147;
                    }
                    else
                    {
                      v106 = *(uint64_t **)(v99 + 8);
                      v107 = *v106;
                      *(_QWORD *)(v99 + 8) = *v106;
                      if (v107)
                      {
                        *(_QWORD *)(v107 + 16) = v99;
                        v100 = *(uint64_t **)(v99 + 16);
                      }
                      v106[2] = (uint64_t)v100;
                      *(_QWORD *)(*(_QWORD *)(v99 + 16) + 8 * (**(_QWORD **)(v99 + 16) != v99)) = v106;
                      *v106 = v99;
                      *(_QWORD *)(v99 + 16) = v106;
                      v100 = (uint64_t *)v106[2];
                      v99 = *v100;
                      *((_BYTE *)v106 + 24) = 1;
                      *((_BYTE *)v100 + 24) = 0;
                      v108 = *(_QWORD *)(v99 + 8);
                      *v100 = v108;
                      if (v108)
LABEL_147:
                        *(_QWORD *)(v108 + 16) = v100;
                    }
                    *(_QWORD *)(v99 + 16) = v100[2];
                    *(_QWORD *)(v100[2] + 8 * (*(_QWORD *)v100[2] != (_QWORD)v100)) = v99;
                    *(_QWORD *)(v99 + 8) = v100;
LABEL_174:
                    v100[2] = v99;
                    break;
                  }
                }
                else if (!v101 || (v103 = *(unsigned __int8 *)(v101 + 24), v102 = (_BYTE *)(v101 + 24), v103))
                {
                  if (*(uint64_t **)v99 == v97)
                  {
                    v132 = v97[1];
                    *(_QWORD *)v99 = v132;
                    if (v132)
                    {
                      *(_QWORD *)(v132 + 16) = v99;
                      v100 = *(uint64_t **)(v99 + 16);
                    }
                    v97[2] = (uint64_t)v100;
                    *(_QWORD *)(*(_QWORD *)(v99 + 16) + 8 * (**(_QWORD **)(v99 + 16) != v99)) = v97;
                    v97[1] = v99;
                    *(_QWORD *)(v99 + 16) = v97;
                    v100 = (uint64_t *)v97[2];
                    *((_BYTE *)v97 + 24) = 1;
                    *((_BYTE *)v100 + 24) = 0;
                    v99 = v100[1];
                    v123 = *(uint64_t **)v99;
                    v100[1] = *(_QWORD *)v99;
                    if (v123)
LABEL_172:
                      v123[2] = (uint64_t)v100;
                  }
                  else
                  {
                    *(_BYTE *)(v99 + 24) = 1;
                    *((_BYTE *)v100 + 24) = 0;
                    v99 = v100[1];
                    v123 = *(uint64_t **)v99;
                    v100[1] = *(_QWORD *)v99;
                    if (v123)
                      goto LABEL_172;
                  }
                  *(_QWORD *)(v99 + 16) = v100[2];
                  *(_QWORD *)(v100[2] + 8 * (*(_QWORD *)v100[2] != (_QWORD)v100)) = v99;
                  *(_QWORD *)v99 = v100;
                  goto LABEL_174;
                }
                *(_BYTE *)(v99 + 24) = 1;
                v97 = v100;
                *((_BYTE *)v100 + 24) = v100 == v98;
                *v102 = 1;
              }
              while (v100 != v98);
            }
            ++*(_QWORD *)(v151 + 112);
          }
          v124 = v72[7];
          v156 = v75;
          v157 = v43;
          do
            v125 = __ldxr(p_shared_owners);
          while (__stxr(v125 + 1, p_shared_owners));
          (*(void (**)(uint64_t, std::__shared_weak_count **, _QWORD))(*(_QWORD *)v124 + 264))(v124, &v156, *(unsigned int *)(v50 + 52));
          v126 = v157;
          if (!v157)
            goto LABEL_72;
          v127 = (unint64_t *)&v157->__shared_owners_;
          do
            v128 = __ldaxr(v127);
          while (__stlxr(v128 - 1, v127));
        }
        else
        {
          v76 = (uint64_t *)(v151 + 200);
          v77 = *v150;
          v78 = (uint64_t **)(v151 + 200);
          if (*v150)
          {
            v79 = *(char *)(v50 + 47);
            if (v79 >= 0)
              v80 = *(unsigned __int8 *)(v50 + 47);
            else
              v80 = *(_QWORD *)(v50 + 32);
            if (v79 >= 0)
              v81 = (const void *)(v50 + 24);
            else
              v81 = *(const void **)(v50 + 24);
            while (1)
            {
              while (1)
              {
                v76 = v77;
                v84 = (const void *)v77[4];
                v82 = v77 + 4;
                v83 = v84;
                v85 = *((char *)v82 + 23);
                if (v85 >= 0)
                  v86 = *((unsigned __int8 *)v82 + 23);
                else
                  v86 = v82[1];
                if (v85 >= 0)
                  v87 = v82;
                else
                  v87 = v83;
                if (v86 >= v80)
                  v88 = v80;
                else
                  v88 = v86;
                v89 = memcmp(v81, v87, v88);
                v90 = v80 < v86;
                if (v89)
                  v90 = v89 < 0;
                if (!v90)
                  break;
                v77 = (uint64_t *)*v76;
                v78 = (uint64_t **)v76;
                if (!*v76)
                  goto LABEL_127;
              }
              v91 = memcmp(v87, v81, v88);
              v92 = v86 < v80;
              if (v91)
                v92 = v91 < 0;
              if (!v92)
                break;
              v77 = (uint64_t *)v76[1];
              if (!v77)
              {
                v78 = (uint64_t **)(v76 + 1);
                goto LABEL_127;
              }
            }
            v93 = v76;
            v43 = v53;
            v35 = v153;
            v112 = v154;
            v51 = v152;
          }
          else
          {
LABEL_127:
            v93 = operator new(0x48uLL);
            v94 = v93 + 4;
            if (*(char *)(v50 + 47) < 0)
            {
              v43 = v53;
              sub_19C07C6E8(v94, *(void **)(v50 + 24), *(_QWORD *)(v50 + 32));
            }
            else
            {
              v95 = *v54;
              v93[6] = *(_QWORD *)(v50 + 40);
              *(_OWORD *)v94 = v95;
              v43 = v53;
            }
            v93[7] = 0;
            v93[8] = 0;
            *v93 = 0;
            v93[1] = 0;
            v93[2] = v76;
            *v78 = v93;
            v109 = (_QWORD *)**v148;
            v110 = v93;
            if (v109)
            {
              *v148 = v109;
              v110 = *v78;
            }
            v111 = *v150;
            v16 = v110 == *v150;
            *((_BYTE *)v110 + 24) = v16;
            v35 = v153;
            v112 = v154;
            v51 = v152;
            if (!v16)
            {
              do
              {
                v113 = v110[2];
                if (*(_BYTE *)(v113 + 24))
                  break;
                v114 = *(uint64_t **)(v113 + 16);
                v115 = *v114;
                if (*v114 == v113)
                {
                  v118 = v114[1];
                  if (!v118 || (v119 = *(unsigned __int8 *)(v118 + 24), v116 = (_BYTE *)(v118 + 24), v119))
                  {
                    if (*(uint64_t **)v113 == v110)
                    {
                      *(_BYTE *)(v113 + 24) = 1;
                      *((_BYTE *)v114 + 24) = 0;
                      v122 = *(_QWORD *)(v113 + 8);
                      *v114 = v122;
                      if (v122)
                        goto LABEL_168;
                    }
                    else
                    {
                      v120 = *(uint64_t **)(v113 + 8);
                      v121 = *v120;
                      *(_QWORD *)(v113 + 8) = *v120;
                      if (v121)
                      {
                        *(_QWORD *)(v121 + 16) = v113;
                        v114 = *(uint64_t **)(v113 + 16);
                      }
                      v120[2] = (uint64_t)v114;
                      *(_QWORD *)(*(_QWORD *)(v113 + 16) + 8 * (**(_QWORD **)(v113 + 16) != v113)) = v120;
                      *v120 = v113;
                      *(_QWORD *)(v113 + 16) = v120;
                      v114 = (uint64_t *)v120[2];
                      v113 = *v114;
                      *((_BYTE *)v120 + 24) = 1;
                      *((_BYTE *)v114 + 24) = 0;
                      v122 = *(_QWORD *)(v113 + 8);
                      *v114 = v122;
                      if (v122)
LABEL_168:
                        *(_QWORD *)(v122 + 16) = v114;
                    }
                    *(_QWORD *)(v113 + 16) = v114[2];
                    *(_QWORD *)(v114[2] + 8 * (*(_QWORD *)v114[2] != (_QWORD)v114)) = v113;
                    *(_QWORD *)(v113 + 8) = v114;
LABEL_187:
                    v114[2] = v113;
                    break;
                  }
                }
                else if (!v115 || (v117 = *(unsigned __int8 *)(v115 + 24), v116 = (_BYTE *)(v115 + 24), v117))
                {
                  if (*(uint64_t **)v113 == v110)
                  {
                    v133 = v110[1];
                    *(_QWORD *)v113 = v133;
                    if (v133)
                    {
                      *(_QWORD *)(v133 + 16) = v113;
                      v114 = *(uint64_t **)(v113 + 16);
                    }
                    v110[2] = (uint64_t)v114;
                    *(_QWORD *)(*(_QWORD *)(v113 + 16) + 8 * (**(_QWORD **)(v113 + 16) != v113)) = v110;
                    v110[1] = v113;
                    *(_QWORD *)(v113 + 16) = v110;
                    v114 = (uint64_t *)v110[2];
                    *((_BYTE *)v110 + 24) = 1;
                    *((_BYTE *)v114 + 24) = 0;
                    v113 = v114[1];
                    v129 = *(uint64_t **)v113;
                    v114[1] = *(_QWORD *)v113;
                    if (v129)
LABEL_185:
                      v129[2] = (uint64_t)v114;
                  }
                  else
                  {
                    *(_BYTE *)(v113 + 24) = 1;
                    *((_BYTE *)v114 + 24) = 0;
                    v113 = v114[1];
                    v129 = *(uint64_t **)v113;
                    v114[1] = *(_QWORD *)v113;
                    if (v129)
                      goto LABEL_185;
                  }
                  *(_QWORD *)(v113 + 16) = v114[2];
                  *(_QWORD *)(v114[2] + 8 * (*(_QWORD *)v114[2] != (_QWORD)v114)) = v113;
                  *(_QWORD *)v113 = v114;
                  goto LABEL_187;
                }
                *(_BYTE *)(v113 + 24) = 1;
                v110 = v114;
                *((_BYTE *)v114 + 24) = v114 == v111;
                *v116 = 1;
              }
              while (v114 != v111);
            }
            ++*(_QWORD *)(v151 + 208);
          }
          do
            v130 = __ldxr(p_shared_owners);
          while (__stxr(v130 + 1, p_shared_owners));
          v126 = (std::__shared_weak_count *)v93[8];
          v93[7] = v112;
          v93[8] = v43;
          if (!v126)
            goto LABEL_72;
          v131 = (unint64_t *)&v126->__shared_owners_;
          do
            v128 = __ldaxr(v131);
          while (__stlxr(v128 - 1, v131));
        }
        if (!v128)
        {
          ((void (*)(std::__shared_weak_count *))v126->__on_zero_shared)(v126);
          std::__shared_weak_count::__release_weak(v126);
        }
      }
LABEL_72:
      v50 += 56;
      if (v50 == v51)
        goto LABEL_66;
    }
  }
LABEL_219:
  (*(void (**)(__int128 **__return_ptr, _QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(v151 + 96) + 56) + 160))(&p_dst, *(_QWORD *)(*(_QWORD *)(v151 + 96) + 56), 1);
  *(_DWORD *)(v151 + 56) = v163;
  return 1;
}

void sub_19C23336C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,char a27)
{
  uint64_t v27;

  if ((*(char *)(v27 - 89) & 0x80000000) == 0)
    _Unwind_Resume(exception_object);
  operator delete(*(void **)(v27 - 112));
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C233480(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t **v7;
  uint64_t **v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;

  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 128))(a2) != 2)
  {
    v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 128))(a2);
    v5 = v4;
    v7 = (uint64_t **)(a1 + 80);
    v6 = *(uint64_t **)(a1 + 80);
    if (v6)
    {
      while (1)
      {
        while (1)
        {
          v8 = (uint64_t **)v6;
          v9 = v6[4];
          if (v4 >= v9)
            break;
          v6 = *v8;
          v7 = v8;
          if (!*v8)
            goto LABEL_9;
        }
        if (v9 >= v4)
          break;
        v6 = v8[1];
        if (!v6)
        {
          v7 = v8 + 1;
          goto LABEL_9;
        }
      }
    }
    else
    {
      v8 = (uint64_t **)(a1 + 80);
LABEL_9:
      v10 = (uint64_t *)v8;
      v8 = (uint64_t **)operator new(0x30uLL);
      v8[4] = (uint64_t *)v5;
      v8[5] = 0;
      *v8 = 0;
      v8[1] = 0;
      v8[2] = v10;
      *v7 = (uint64_t *)v8;
      v11 = **(_QWORD **)(a1 + 72);
      v12 = (uint64_t *)v8;
      if (v11)
      {
        *(_QWORD *)(a1 + 72) = v11;
        v12 = *v7;
      }
      sub_19C07CC40(*(uint64_t **)(a1 + 80), v12);
      ++*(_QWORD *)(a1 + 88);
    }
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)a2 + 248))(a2, v8[5]);
  }
  return 1;
}

uint64_t sub_19C233584(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a2;
  *a2 = 0;
  result = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(a1 + 216) = v3;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t sub_19C2335AC()
{
  return operator new[]();
}

void sub_19C2335C4(int a1, int a2, void *__p)
{
  if (__p)
    operator delete[](__p);
}

void sub_19C2335D4(uint64_t a1, int a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  int v7;
  int v8;
  _QWORD *v9;
  _QWORD *v10;
  BOOL v11;
  _QWORD *v12;
  int v13;
  int v15;
  _QWORD *v16;
  _QWORD *v17;

  v4 = (_QWORD *)(a1 + 200);
  sub_19C235E6C(a1 + 192, *(_QWORD *)(a1 + 200));
  *(v4 - 1) = v4;
  *v4 = 0;
  v4[1] = 0;
  v5 = (_QWORD *)*(v4 - 13);
  v6 = v4 - 12;
  if (v5 != v6)
  {
    v7 = 0;
    do
    {
      v8 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v5[7] + 40))(v5[7]);
      v9 = (_QWORD *)v5[1];
      if (v9)
      {
        do
        {
          v10 = v9;
          v9 = (_QWORD *)*v9;
        }
        while (v9);
      }
      else
      {
        do
        {
          v10 = (_QWORD *)v5[2];
          v11 = *v10 == (_QWORD)v5;
          v5 = v10;
        }
        while (!v11);
      }
      v7 += v8;
      v5 = v10;
    }
    while (v10 != v6);
    v12 = *(_QWORD **)(a1 + 96);
    v13 = 1000 * a2;
    if (v12 != v6 && v7 > v13)
    {
      do
      {
        v15 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)v12[7] + 40))(v12[7]);
        (*(void (**)(_QWORD))(*(_QWORD *)v12[7] + 32))(v12[7]);
        v16 = (_QWORD *)v12[1];
        v17 = v12;
        if (v16)
        {
          do
          {
            v12 = v16;
            v16 = (_QWORD *)*v16;
          }
          while (v16);
        }
        else
        {
          do
          {
            v12 = (_QWORD *)v17[2];
            v11 = *v12 == (_QWORD)v17;
            v17 = v12;
          }
          while (!v11);
        }
        if (v12 == v6)
          break;
        v7 -= v15;
      }
      while (v7 > v13);
    }
  }
}

void sub_19C233720(uint64_t a1@<X0>, uint64_t a2@<X1>, char **a3@<X8>)
{
  _QWORD *v4;
  __int128 *v6;
  __int128 *v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unsigned __int8 *v15;
  uint64_t v16;
  int v17;
  __int128 v18;
  unint64_t v19;
  void **v20;
  __int128 v21;
  char *v22;
  void **v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  __int128 v31;
  void **v32;
  _QWORD *v33;
  __int128 *v34;
  void *__p[2];
  void *v36;
  int v37;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v4 = *(_QWORD **)(a1 + 144);
  v33 = (_QWORD *)(a1 + 152);
  if (v4 != (_QWORD *)(a1 + 152))
  {
    while (1)
    {
      v7 = (__int128 *)v4[7];
      v6 = (__int128 *)v4[8];
      v34 = v6;
      if (v7 != v6)
        break;
LABEL_5:
      v8 = (_QWORD *)v4[1];
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (_QWORD *)v4[2];
          v10 = *v9 == (_QWORD)v4;
          v4 = v9;
        }
        while (!v10);
      }
      v4 = v9;
      if (v9 == v33)
        return;
    }
    while (1)
    {
      v11 = *((unsigned __int8 *)v7 + 47);
      if ((v11 & 0x80u) == 0)
        v12 = *((unsigned __int8 *)v7 + 47);
      else
        v12 = *((_QWORD *)v7 + 4);
      v13 = *(unsigned __int8 *)(a2 + 23);
      v14 = (char)v13;
      if ((v13 & 0x80u) != 0)
        v13 = *(_QWORD *)(a2 + 8);
      if (v12 != v13)
        goto LABEL_12;
      v15 = v14 >= 0 ? (unsigned __int8 *)a2 : *(unsigned __int8 **)a2;
      if ((v11 & 0x80) == 0)
        break;
      if (!memcmp(*((const void **)v7 + 3), v15, *((_QWORD *)v7 + 4)))
        goto LABEL_27;
LABEL_12:
      v7 = (__int128 *)((char *)v7 + 56);
      if (v7 == v6)
        goto LABEL_5;
    }
    if (*((_BYTE *)v7 + 47))
    {
      v16 = 0;
      while (*((unsigned __int8 *)v7 + v16 + 24) == v15[v16])
      {
        if (v11 == ++v16)
          goto LABEL_27;
      }
      goto LABEL_12;
    }
LABEL_27:
    if (*((_DWORD *)v7 + 13) <= 8u)
      v17 = *((_DWORD *)v7 + 13);
    else
      v17 = 0;
    if (*((char *)v7 + 23) < 0)
    {
      sub_19C07C6E8(__p, *(void **)v7, *((_QWORD *)v7 + 1));
    }
    else
    {
      v18 = *v7;
      v36 = (void *)*((_QWORD *)v7 + 2);
      *(_OWORD *)__p = v18;
    }
    v37 = v17;
    v20 = (void **)a3[1];
    v19 = (unint64_t)a3[2];
    if ((unint64_t)v20 >= v19)
    {
      v23 = (void **)*a3;
      v24 = (char *)v20 - *a3;
      v25 = (v24 >> 5) + 1;
      if (v25 >> 59)
        sub_19C07DA0C();
      v26 = v19 - (_QWORD)v23;
      if (v26 >> 4 > v25)
        v25 = v26 >> 4;
      if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFE0)
        v27 = 0x7FFFFFFFFFFFFFFLL;
      else
        v27 = v25;
      if (v27 >> 59)
        sub_19C07C7FC();
      v28 = (char *)operator new(32 * v27);
      v29 = &v28[32 * (v24 >> 5)];
      *(_OWORD *)v29 = *(_OWORD *)__p;
      *((_QWORD *)v29 + 2) = v36;
      v30 = &v28[32 * v27];
      __p[1] = 0;
      v36 = 0;
      __p[0] = 0;
      *(_DWORD *)&v28[v24 + 24] = v17;
      v22 = v29 + 32;
      if (v20 == v23)
      {
        *a3 = v29;
        a3[1] = v22;
        a3[2] = v30;
      }
      else
      {
        do
        {
          v31 = *((_OWORD *)v20 - 2);
          *((_QWORD *)v29 - 2) = *(v20 - 2);
          *((_OWORD *)v29 - 2) = v31;
          *(v20 - 3) = 0;
          *(v20 - 2) = 0;
          *(v20 - 4) = 0;
          *((_DWORD *)v29 - 2) = *((_DWORD *)v20 - 2);
          v29 -= 32;
          v20 -= 4;
        }
        while (v20 != v23);
        v20 = (void **)*a3;
        v32 = (void **)a3[1];
        *a3 = v29;
        a3[1] = v22;
        a3[2] = v30;
        while (v32 != v20)
        {
          if (*((char *)v32 - 9) < 0)
            operator delete(*(v32 - 4));
          v32 -= 4;
        }
      }
      v6 = v34;
      if (v20)
        operator delete(v20);
    }
    else
    {
      v21 = *(_OWORD *)__p;
      v20[2] = v36;
      *(_OWORD *)v20 = v21;
      __p[1] = 0;
      v36 = 0;
      __p[0] = 0;
      *((_DWORD *)v20 + 6) = v37;
      v22 = (char *)(v20 + 4);
    }
    a3[1] = v22;
    if (SHIBYTE(v36) < 0)
      operator delete(__p[0]);
    goto LABEL_12;
  }
}

void sub_19C2339E8(_Unwind_Exception *a1)
{
  void **v1;

  sub_19C1AB4C0(v1);
  _Unwind_Resume(a1);
}

void sub_19C2339FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void **v16;

  if (a16 < 0)
    operator delete(__p);
  sub_19C1AB4C0(v16);
  _Unwind_Resume(a1);
}

void sub_19C233A24(uint64_t a1@<X0>, uint64_t a2@<X1>, char **a3@<X8>)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unsigned __int8 *v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  void **v19;
  __int128 v20;
  char *v21;
  void **v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  __int128 v30;
  void **v31;
  _QWORD *v32;
  uint64_t v33;
  void *__p[2];
  void *v35;
  int v36;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v4 = *(_QWORD **)(a1 + 144);
  v32 = (_QWORD *)(a1 + 152);
  if (v4 != (_QWORD *)(a1 + 152))
  {
    while (1)
    {
      v7 = v4[7];
      v6 = v4[8];
      v33 = v6;
      if (v7 != v6)
        break;
LABEL_5:
      v8 = (_QWORD *)v4[1];
      if (v8)
      {
        do
        {
          v9 = v8;
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (_QWORD *)v4[2];
          v10 = *v9 == (_QWORD)v4;
          v4 = v9;
        }
        while (!v10);
      }
      v4 = v9;
      if (v9 == v32)
        return;
    }
    while (1)
    {
      v11 = *(unsigned __int8 *)(v7 + 23);
      if ((v11 & 0x80u) == 0)
        v12 = *(unsigned __int8 *)(v7 + 23);
      else
        v12 = *(_QWORD *)(v7 + 8);
      v13 = *(unsigned __int8 *)(a2 + 23);
      v14 = (char)v13;
      if ((v13 & 0x80u) != 0)
        v13 = *(_QWORD *)(a2 + 8);
      if (v12 != v13)
        goto LABEL_12;
      v15 = v14 >= 0 ? (unsigned __int8 *)a2 : *(unsigned __int8 **)a2;
      if ((v11 & 0x80) == 0)
        break;
      if (!memcmp(*(const void **)v7, v15, *(_QWORD *)(v7 + 8)))
        goto LABEL_27;
LABEL_12:
      v7 += 56;
      if (v7 == v6)
        goto LABEL_5;
    }
    if (*(_BYTE *)(v7 + 23))
    {
      v16 = 0;
      while (*(unsigned __int8 *)(v7 + v16) == v15[v16])
      {
        if (v11 == ++v16)
          goto LABEL_27;
      }
      goto LABEL_12;
    }
LABEL_27:
    if (*(char *)(v7 + 47) < 0)
    {
      sub_19C07C6E8(__p, *(void **)(v7 + 24), *(_QWORD *)(v7 + 32));
    }
    else
    {
      *(_OWORD *)__p = *(_OWORD *)(v7 + 24);
      v35 = *(void **)(v7 + 40);
    }
    v17 = *(_DWORD *)(v7 + 48);
    v36 = v17;
    v19 = (void **)a3[1];
    v18 = (unint64_t)a3[2];
    if ((unint64_t)v19 >= v18)
    {
      v22 = (void **)*a3;
      v23 = (char *)v19 - *a3;
      v24 = (v23 >> 5) + 1;
      if (v24 >> 59)
        sub_19C07DA0C();
      v25 = v18 - (_QWORD)v22;
      if (v25 >> 4 > v24)
        v24 = v25 >> 4;
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFE0)
        v26 = 0x7FFFFFFFFFFFFFFLL;
      else
        v26 = v24;
      if (v26 >> 59)
        sub_19C07C7FC();
      v27 = (char *)operator new(32 * v26);
      v28 = &v27[32 * (v23 >> 5)];
      *(_OWORD *)v28 = *(_OWORD *)__p;
      *((_QWORD *)v28 + 2) = v35;
      v29 = &v27[32 * v26];
      __p[1] = 0;
      v35 = 0;
      __p[0] = 0;
      *(_DWORD *)&v27[v23 + 24] = v17;
      v21 = v28 + 32;
      if (v19 == v22)
      {
        *a3 = v28;
        a3[1] = v21;
        a3[2] = v29;
      }
      else
      {
        do
        {
          v30 = *((_OWORD *)v19 - 2);
          *((_QWORD *)v28 - 2) = *(v19 - 2);
          *((_OWORD *)v28 - 2) = v30;
          *(v19 - 3) = 0;
          *(v19 - 2) = 0;
          *(v19 - 4) = 0;
          *((_DWORD *)v28 - 2) = *((_DWORD *)v19 - 2);
          v28 -= 32;
          v19 -= 4;
        }
        while (v19 != v22);
        v19 = (void **)*a3;
        v31 = (void **)a3[1];
        *a3 = v28;
        a3[1] = v21;
        a3[2] = v29;
        while (v31 != v19)
        {
          if (*((char *)v31 - 9) < 0)
            operator delete(*(v31 - 4));
          v31 -= 4;
        }
      }
      v6 = v33;
      if (v19)
        operator delete(v19);
    }
    else
    {
      v20 = *(_OWORD *)__p;
      v19[2] = v35;
      *(_OWORD *)v19 = v20;
      __p[1] = 0;
      v35 = 0;
      __p[0] = 0;
      *((_DWORD *)v19 + 6) = v36;
      v21 = (char *)(v19 + 4);
    }
    a3[1] = v21;
    if (SHIBYTE(v35) < 0)
      operator delete(__p[0]);
    goto LABEL_12;
  }
}

void sub_19C233CE4(_Unwind_Exception *a1)
{
  void **v1;

  sub_19C1AB4C0(v1);
  _Unwind_Resume(a1);
}

void sub_19C233CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void **v16;

  if (a16 < 0)
    operator delete(__p);
  sub_19C1AB4C0(v16);
  _Unwind_Resume(a1);
}

uint64_t sub_19C233D20(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  _QWORD *v3;
  _QWORD *v4;
  char v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  char v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  BOOL v21;

  v3 = *(_QWORD **)(a1 + 144);
  v4 = (_QWORD *)(a1 + 152);
  if (v3 != (_QWORD *)(a1 + 152))
  {
    v5 = *((_BYTE *)a3 + 23);
    if (v5 >= 0)
      v6 = (unsigned __int8 *)*((unsigned __int8 *)a3 + 23);
    else
      v6 = a3[1];
    if (v5 >= 0)
      v7 = (unsigned __int8 *)a3;
    else
      v7 = *a3;
    v8 = *((_BYTE *)a2 + 23);
    if (v8 >= 0)
      v9 = (unsigned __int8 *)*((unsigned __int8 *)a2 + 23);
    else
      v9 = a2[1];
    if (v8 >= 0)
      v10 = (unsigned __int8 *)a2;
    else
      v10 = *a2;
    do
    {
      v11 = v3[7];
      v12 = v3[8];
      while (v11 != v12)
      {
        v13 = *(unsigned __int8 *)(v11 + 47);
        if ((v13 & 0x80u) == 0)
          v14 = (unsigned __int8 *)*(unsigned __int8 *)(v11 + 47);
        else
          v14 = *(unsigned __int8 **)(v11 + 32);
        if (v14 != v6)
          goto LABEL_16;
        if ((v13 & 0x80) != 0)
        {
          if (memcmp(*(const void **)(v11 + 24), v7, *(_QWORD *)(v11 + 32)))
            goto LABEL_16;
        }
        else if (*(_BYTE *)(v11 + 47))
        {
          v15 = 0;
          while (*(unsigned __int8 *)(v11 + v15 + 24) == v7[v15])
          {
            if (v13 == ++v15)
              goto LABEL_29;
          }
          goto LABEL_16;
        }
LABEL_29:
        v16 = *(unsigned __int8 *)(v11 + 23);
        if ((v16 & 0x80u) == 0)
          v17 = (unsigned __int8 *)*(unsigned __int8 *)(v11 + 23);
        else
          v17 = *(unsigned __int8 **)(v11 + 8);
        if (v17 == v9)
        {
          if ((v16 & 0x80) != 0)
          {
            if (!memcmp(*(const void **)v11, v10, *(_QWORD *)(v11 + 8)))
              return *(unsigned int *)(v11 + 48);
          }
          else
          {
            if (!*(_BYTE *)(v11 + 23))
              return *(unsigned int *)(v11 + 48);
            v18 = 0;
            while (*(unsigned __int8 *)(v11 + v18) == v10[v18])
            {
              if (v16 == ++v18)
                return *(unsigned int *)(v11 + 48);
            }
          }
        }
LABEL_16:
        v11 += 56;
      }
      v19 = (_QWORD *)v3[1];
      if (v19)
      {
        do
        {
          v20 = v19;
          v19 = (_QWORD *)*v19;
        }
        while (v19);
      }
      else
      {
        do
        {
          v20 = (_QWORD *)v3[2];
          v21 = *v20 == (_QWORD)v3;
          v3 = v20;
        }
        while (!v21);
      }
      v3 = v20;
    }
    while (v20 != v4);
  }
  return 9;
}

uint64_t sub_19C233EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  size_t v6;
  const void *v7;
  uint64_t v8;
  int v9;
  size_t v10;
  const void *v11;
  size_t v12;
  int v13;
  _BOOL4 v14;
  BOOL v15;
  uint64_t *v16;
  int v17;
  size_t v18;
  const void *v19;
  size_t v20;
  int v21;
  _BOOL4 v22;
  std::runtime_error *exception;
  std::runtime_error *v25;
  const char *v26;
  const char *v27;
  char v28;

  v3 = a1 + 104;
  v4 = *(_QWORD *)(a1 + 104);
  if (!v4)
    goto LABEL_41;
  v5 = *(char *)(a2 + 23);
  v6 = v5 >= 0 ? *(unsigned __int8 *)(a2 + 23) : *(_QWORD *)(a2 + 8);
  v7 = v5 >= 0 ? (const void *)a2 : *(const void **)a2;
  v8 = a1 + 104;
  do
  {
    v9 = *(char *)(v4 + 55);
    if (v9 >= 0)
      v10 = *(unsigned __int8 *)(v4 + 55);
    else
      v10 = *(_QWORD *)(v4 + 40);
    if (v9 >= 0)
      v11 = (const void *)(v4 + 32);
    else
      v11 = *(const void **)(v4 + 32);
    if (v6 >= v10)
      v12 = v10;
    else
      v12 = v6;
    v13 = memcmp(v11, v7, v12);
    v14 = v10 < v6;
    if (v13)
      v14 = v13 < 0;
    v15 = !v14;
    if (v14)
      v16 = (uint64_t *)(v4 + 8);
    else
      v16 = (uint64_t *)v4;
    if (v15)
      v8 = v4;
    v4 = *v16;
  }
  while (*v16);
  if (v8 == v3)
    goto LABEL_41;
  v17 = *(char *)(v8 + 55);
  if (v17 >= 0)
    v18 = *(unsigned __int8 *)(v8 + 55);
  else
    v18 = *(_QWORD *)(v8 + 40);
  if (v17 >= 0)
    v19 = (const void *)(v8 + 32);
  else
    v19 = *(const void **)(v8 + 32);
  if (v18 >= v6)
    v20 = v6;
  else
    v20 = v18;
  v21 = memcmp(v7, v19, v20);
  v22 = v6 >= v18;
  if (v21)
    v22 = v21 >= 0;
  if (!v22)
  {
LABEL_41:
    sub_19C234058("Invalid node name: ", a2);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    v25 = exception;
    if (v28 >= 0)
      v26 = (const char *)&v27;
    else
      v26 = v27;
    std::runtime_error::runtime_error(exception, v26);
    __cxa_throw(v25, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v8 + 56) + 152))(*(_QWORD *)(v8 + 56));
}

void sub_19C23402C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C234058(const char *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  std::ios_base *v9;
  uint64_t v10;
  size_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17[8];
  void *__p[2];
  __int128 v19;
  int v20;
  uint64_t v21[19];

  v4 = MEMORY[0x1E0DE4FE0];
  v5 = MEMORY[0x1E0DE4FE0] + 64;
  v6 = (uint64_t *)MEMORY[0x1E0DE4F60];
  v7 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 8);
  v8 = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 16);
  v21[0] = MEMORY[0x1E0DE4FE0] + 64;
  v16 = v7;
  *(uint64_t *)((char *)&v17[-1] + *(_QWORD *)(v7 - 24)) = v8;
  v9 = (std::ios_base *)((char *)&v17[-1] + *(_QWORD *)(v16 - 24));
  std::ios_base::init(v9, v17);
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  v16 = v4 + 24;
  v21[0] = v5;
  std::streambuf::basic_streambuf();
  v10 = MEMORY[0x1E0DE4FB8];
  v17[0] = MEMORY[0x1E0DE4FB8] + 16;
  *(_OWORD *)__p = 0u;
  v19 = 0u;
  v20 = 16;
  v11 = strlen(a1);
  sub_19C07DCDC(&v16, (uint64_t)a1, v11);
  v12 = *(char *)(a2 + 23);
  if (v12 >= 0)
    v13 = a2;
  else
    v13 = *(_QWORD *)a2;
  if (v12 >= 0)
    v14 = *(unsigned __int8 *)(a2 + 23);
  else
    v14 = *(_QWORD *)(a2 + 8);
  sub_19C07DCDC(&v16, v13, v14);
  std::stringbuf::str();
  v16 = *v6;
  *(uint64_t *)((char *)&v17[-1] + *(_QWORD *)(v16 - 24)) = v6[3];
  v17[0] = v10 + 16;
  if (SBYTE7(v19) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x1A1AD1C08](v21);
}

void sub_19C2341C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_19C07DC58((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_19C2341D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x1A1AD1C08](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C23421C(uint64_t a1, uint64_t *a2, const void ***a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v11;
  const void ***v12;
  const void **v13;
  const void **v14;
  uint64_t v15;
  char *v16;
  uint64_t **v17;
  const void **v18;
  const void ***v19;
  BOOL v20;
  uint64_t v21;
  const void ***v22;
  const void **v23;
  const void **v24;
  const void **v25;
  const void ***v26;
  const void ***v27;
  const void **v28;
  const void **v29;
  const void **v31;
  const void ***v32;
  char **v33;
  char *v34[2];
  uint64_t *v35;
  uint64_t v36[2];
  uint64_t *v37;
  uint64_t v38[2];

  if (a6)
  {
    v11 = operator new();
    sub_19C1A15D0(v11);
    if (*((char *)a2 + 23) < 0)
      a2 = (uint64_t *)*a2;
    v38[0] = 0;
    v38[1] = 0;
    v37 = v38;
    v14 = *a3;
    v12 = a3 + 1;
    v13 = v14;
    if (v14 != (const void **)v12)
    {
      do
      {
        sub_19C188890(&v37, v38, v13 + 4, (uint64_t)(v13 + 4));
        v18 = (const void **)v13[1];
        if (v18)
        {
          do
          {
            v19 = (const void ***)v18;
            v18 = (const void **)*v18;
          }
          while (v18);
        }
        else
        {
          do
          {
            v19 = (const void ***)v13[2];
            v20 = *v19 == v13;
            v13 = (const void **)v19;
          }
          while (!v20);
        }
        v13 = (const void **)v19;
      }
      while (v19 != v12);
    }
    v15 = sub_19C1B7680(v11, (const char *)a2, (_QWORD *)a1);
    v16 = (char *)v38[0];
    v17 = &v37;
LABEL_30:
    sub_19C098FBC((uint64_t)v17, v16);
    (*(void (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
    return v15;
  }
  v21 = *(_QWORD *)(a1 + 216);
  if (!v21
    || !__dynamic_cast(*(const void **)(a1 + 216), (const struct __class_type_info *)&unk_1E3D1DD10, (const struct __class_type_info *)&unk_1E3D1DB90, 0))
  {
    v11 = operator new();
    sub_19C1A15D0(v11);
    if (*((char *)a2 + 23) < 0)
      a2 = (uint64_t *)*a2;
    v36[0] = 0;
    v36[1] = 0;
    v35 = v36;
    v29 = *a3;
    v27 = a3 + 1;
    v28 = v29;
    if (v29 != (const void **)v27)
    {
      do
      {
        sub_19C188890(&v35, v36, v28 + 4, (uint64_t)(v28 + 4));
        v31 = (const void **)v28[1];
        if (v31)
        {
          do
          {
            v32 = (const void ***)v31;
            v31 = (const void **)*v31;
          }
          while (v31);
        }
        else
        {
          do
          {
            v32 = (const void ***)v28[2];
            v20 = *v32 == v28;
            v28 = (const void **)v32;
          }
          while (!v20);
        }
        v28 = (const void **)v32;
      }
      while (v32 != v27);
    }
    v15 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t **, uint64_t, uint64_t))(*(_QWORD *)v11 + 24))(v11, a2, a1, &v35, a4, a5);
    v16 = (char *)v36[0];
    v17 = &v35;
    goto LABEL_30;
  }
  if (*((char *)a2 + 23) < 0)
    a2 = (uint64_t *)*a2;
  v34[0] = 0;
  v34[1] = 0;
  v33 = v34;
  v24 = *a3;
  v22 = a3 + 1;
  v23 = v24;
  if (v24 != (const void **)v22)
  {
    do
    {
      sub_19C188890((uint64_t **)&v33, (uint64_t *)v34, v23 + 4, (uint64_t)(v23 + 4));
      v25 = (const void **)v23[1];
      if (v25)
      {
        do
        {
          v26 = (const void ***)v25;
          v25 = (const void **)*v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          v26 = (const void ***)v23[2];
          v20 = *v26 == v23;
          v23 = (const void **)v26;
        }
        while (!v20);
      }
      v23 = (const void **)v26;
    }
    while (v26 != v22);
  }
  v15 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, char ***, uint64_t, uint64_t))(*(_QWORD *)v21 + 24))(v21, a2, a1, &v33, a4, a5);
  sub_19C098FBC((uint64_t)&v33, v34[0]);
  return v15;
}

void sub_19C2344F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char *a11)
{
  sub_19C098FBC((uint64_t)&a10, a11);
  _Unwind_Resume(a1);
}

void sub_19C23450C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, char *a14)
{
  uint64_t v14;

  sub_19C098FBC((uint64_t)&a13, a14);
  (*(void (**)(uint64_t))(*(_QWORD *)v14 + 8))(v14);
  _Unwind_Resume(a1);
}

uint64_t sub_19C23458C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  std::string::size_type v11;
  std::string *v12;
  uint64_t v13;
  int v14;
  size_t v15;
  const void *v16;
  size_t v17;
  int v18;
  _BOOL4 v19;
  BOOL v20;
  uint64_t *v21;
  int v22;
  size_t v23;
  const void *v24;
  size_t v25;
  int v26;
  BOOL v27;
  uint64_t v28;
  std::runtime_error *exception;
  std::string __p;

  v8 = *(char *)(a2 + 23);
  if (v8 < 0)
  {
    sub_19C07C6E8(&__p, *(void **)a2, *(_QWORD *)(a2 + 8));
    if (*(char *)(a2 + 23) < 0)
    {
      if (*(_QWORD *)(a2 + 8))
        goto LABEL_9;
    }
    else if (*(_BYTE *)(a2 + 23))
    {
      goto LABEL_9;
    }
  }
  else
  {
    __p = *(std::string *)a2;
    if ((_BYTE)v8)
      goto LABEL_9;
  }
  v9 = *(_QWORD *)(a1 + 128);
  if (*(_QWORD *)(a1 + 120) != v9)
    std::string::operator=(&__p, (const std::string *)(v9 - 24));
LABEL_9:
  v10 = *(_QWORD *)(a1 + 104);
  if (!v10)
    goto LABEL_52;
  v11 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
      ? HIBYTE(__p.__r_.__value_.__r.__words[2])
      : __p.__r_.__value_.__l.__size_;
  v12 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
      ? &__p
      : (std::string *)__p.__r_.__value_.__r.__words[0];
  v13 = a1 + 104;
  do
  {
    v14 = *(char *)(v10 + 55);
    if (v14 >= 0)
      v15 = *(unsigned __int8 *)(v10 + 55);
    else
      v15 = *(_QWORD *)(v10 + 40);
    if (v14 >= 0)
      v16 = (const void *)(v10 + 32);
    else
      v16 = *(const void **)(v10 + 32);
    if (v11 >= v15)
      v17 = v15;
    else
      v17 = v11;
    v18 = memcmp(v16, v12, v17);
    v19 = v15 < v11;
    if (v18)
      v19 = v18 < 0;
    v20 = !v19;
    if (v19)
      v21 = (uint64_t *)(v10 + 8);
    else
      v21 = (uint64_t *)v10;
    if (v20)
      v13 = v10;
    v10 = *v21;
  }
  while (*v21);
  if (v13 == a1 + 104)
    goto LABEL_52;
  v22 = *(char *)(v13 + 55);
  if (v22 >= 0)
    v23 = *(unsigned __int8 *)(v13 + 55);
  else
    v23 = *(_QWORD *)(v13 + 40);
  if (v22 >= 0)
    v24 = (const void *)(v13 + 32);
  else
    v24 = *(const void **)(v13 + 32);
  if (v23 >= v11)
    v25 = v11;
  else
    v25 = v23;
  v26 = memcmp(v12, v24, v25);
  v27 = v11 < v23;
  if (v26)
    v27 = v26 < 0;
  if (v27 || (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v13 + 56) + 104))(*(_QWORD *)(v13 + 56)))
  {
LABEL_52:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Invalid nodeName for partial output. ");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  sub_19C08087C((uint64_t **)(a1 + 224), (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&__p);
  v28 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v13 + 56) + 296))(*(_QWORD *)(v13 + 56), a3, a4);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v28;
}

void sub_19C2347A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_19C2347D4(uint64_t a1, unsigned __int8 **a2, char *a3)
{
  std::string *v6;
  __int128 v7;
  int v8;
  const std::string::value_type *v9;
  std::string::size_type v10;
  std::string *v11;
  __int128 v12;
  std::string::size_type v13;
  std::string::size_type v14;
  char v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  std::string::size_type v18;
  uint64_t v19;
  unsigned __int8 *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t **v27;
  uint64_t **v28;
  uint64_t **v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t **v33;
  int v34;
  std::string::size_type size;
  unint64_t v36;
  std::string *v37;
  uint64_t v38;
  uint64_t v39;
  std::string *p_str;
  uint64_t v41;
  uint64_t **v42;
  uint64_t *v43;
  std::string::size_type v44;
  const void **v45;
  uint64_t **v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t **v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  unsigned __int8 *v55;
  unsigned __int8 *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t v64;
  const void **v65;
  const void **v66;
  const void ***v67;
  uint64_t v68;
  unsigned __int8 *v69;
  uint64_t v70;
  std::string::size_type v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  unsigned __int8 *v75;
  unsigned __int8 *v76;
  uint64_t v77;
  unsigned __int8 *v78;
  uint64_t v79;
  uint64_t v80;
  unsigned __int8 *v81;
  uint64_t v82;
  std::string *v83;
  std::string *v84;
  uint64_t v85;
  unsigned __int8 *v86;
  uint64_t v87;
  std::string::size_type v88;
  char v89;
  std::string::size_type v90;
  std::string::size_type v91;
  std::string *p_src;
  char v93;
  std::string::size_type v94;
  uint64_t v95;
  std::string::size_type v96;
  std::string *v97;
  std::string *p_s1;
  uint64_t *v99;
  uint64_t *v100;
  unint64_t v101;
  char *v102;
  int v103;
  int v104;
  std::string::size_type v105;
  uint64_t **v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t i;
  uint64_t *v110;
  uint64_t *v111;
  unint64_t v112;
  __int128 v113;
  uint64_t v114;
  __int128 v115;
  uint64_t *v116;
  std::string::size_type v117;
  uint64_t v118;
  int v119;
  size_t v120;
  const void *v121;
  uint64_t v122;
  int v123;
  size_t v124;
  const void *v125;
  size_t v126;
  int v127;
  _BOOL4 v128;
  BOOL v129;
  uint64_t *v130;
  int v131;
  size_t v132;
  const void *v133;
  size_t v134;
  int v135;
  _BOOL4 v136;
  uint64_t v137;
  char *v138;
  __int128 v139;
  __int128 v140;
  char *v141;
  std::string::size_type v142;
  __int128 v143;
  __int128 v144;
  std::string::size_type v145;
  std::string::size_type v146;
  std::string::size_type v147;
  int v148[2];
  std::string::size_type v149;
  int v150;
  int v151;
  std::string __s1;
  uint64_t v153;
  std::string __src;
  _OWORD v155[3];
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  std::string __p;
  __int128 *v186[16];
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  _BYTE v203[32];
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  _BYTE v234[32];
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  std::string __str;
  std::string v266;
  std::string __dst[2];

  std::operator+<char>();
  v6 = std::string::append((std::string *)v203, "_");
  v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  *(_QWORD *)&v234[16] = *((_QWORD *)&v6->__r_.__value_.__l + 2);
  *(_OWORD *)v234 = v7;
  v6->__r_.__value_.__l.__size_ = 0;
  v6->__r_.__value_.__r.__words[2] = 0;
  v6->__r_.__value_.__r.__words[0] = 0;
  v8 = a3[23];
  if (v8 >= 0)
    v9 = a3;
  else
    v9 = *(const std::string::value_type **)a3;
  if (v8 >= 0)
    v10 = a3[23];
  else
    v10 = *((_QWORD *)a3 + 1);
  v11 = std::string::append((std::string *)v234, v9, v10);
  v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  __str.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if ((v234[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)v234);
    if ((v203[23] & 0x80000000) == 0)
    {
LABEL_9:
      v14 = *(_QWORD *)(a1 + 120);
      v13 = *(_QWORD *)(a1 + 128);
      *(_QWORD *)v148 = a1;
      if (v14 != v13)
        goto LABEL_10;
LABEL_48:
      v18 = v14;
      goto LABEL_49;
    }
  }
  else if ((v203[23] & 0x80000000) == 0)
  {
    goto LABEL_9;
  }
  operator delete(*(void **)v203);
  v14 = *(_QWORD *)(a1 + 120);
  v13 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)v148 = a1;
  if (v14 == v13)
    goto LABEL_48;
LABEL_10:
  v15 = *((_BYTE *)a2 + 23);
  if (v15 >= 0)
    v16 = (unsigned __int8 *)*((unsigned __int8 *)a2 + 23);
  else
    v16 = a2[1];
  if (v15 >= 0)
    v17 = (unsigned __int8 *)a2;
  else
    v17 = *a2;
  v18 = v14;
  do
  {
    v19 = *(unsigned __int8 *)(v18 + 23);
    if ((v19 & 0x80u) == 0)
      v20 = (unsigned __int8 *)*(unsigned __int8 *)(v18 + 23);
    else
      v20 = *(unsigned __int8 **)(v18 + 8);
    if (v20 == v16)
    {
      if ((v19 & 0x80) != 0)
      {
        if (!memcmp(*(const void **)v18, v17, *(_QWORD *)(v18 + 8)))
          goto LABEL_28;
      }
      else
      {
        if (!*(_BYTE *)(v18 + 23))
          goto LABEL_28;
        v21 = 0;
        while (*(unsigned __int8 *)(v18 + v21) == v17[v21])
        {
          if (v19 == ++v21)
            goto LABEL_28;
        }
      }
    }
    v18 += 24;
  }
  while (v18 != v13);
  v18 = v13;
LABEL_28:
  v22 = a3[23];
  if (v22 >= 0)
    v23 = a3[23];
  else
    v23 = *((_QWORD *)a3 + 1);
  if (v22 < 0)
    a3 = *(char **)a3;
  do
  {
    v24 = *(unsigned __int8 *)(v14 + 23);
    if ((v24 & 0x80u) == 0)
      v25 = *(unsigned __int8 *)(v14 + 23);
    else
      v25 = *(_QWORD *)(v14 + 8);
    if (v25 == v23)
    {
      if ((v24 & 0x80) != 0)
      {
        if (!memcmp(*(const void **)v14, a3, *(_QWORD *)(v14 + 8)))
          goto LABEL_49;
      }
      else
      {
        if (!*(_BYTE *)(v14 + 23))
          goto LABEL_49;
        v26 = 0;
        while (*(unsigned __int8 *)(v14 + v26) == a3[v26])
        {
          if (v24 == ++v26)
            goto LABEL_49;
        }
      }
    }
    v14 += 24;
  }
  while (v14 != v13);
  v14 = v13;
LABEL_49:
  v264 = 0u;
  v263 = 0u;
  v262 = 0u;
  v261 = 0u;
  v260 = 0u;
  v259 = 0u;
  v258 = 0u;
  v257 = 0u;
  v256 = 0u;
  v255 = 0u;
  v254 = 0u;
  v253 = 0u;
  v252 = 0u;
  v251 = 0u;
  v250 = 0u;
  v249 = 0u;
  v248 = 0u;
  v247 = 0u;
  v246 = 0u;
  v245 = 0u;
  v244 = 0u;
  v243 = 0u;
  v242 = 0u;
  v241 = 0u;
  v240 = 0u;
  v239 = 0u;
  v238 = 0u;
  v237 = 0u;
  v236 = 0u;
  v235 = 0u;
  memset(v234, 0, sizeof(v234));
  v27 = (uint64_t **)(*(_QWORD *)v148 + 96);
  *(_QWORD *)v203 = v18;
  v28 = sub_19C19E844((uint64_t **)(*(_QWORD *)v148 + 96), (const void **)v18, (uint64_t)&unk_19C27ADD0, (__int128 **)v203);
  (*(void (**)(_BYTE *__return_ptr))(*v28[7] + 152))(v234);
  v233 = 0u;
  v232 = 0u;
  v231 = 0u;
  v230 = 0u;
  v229 = 0u;
  v228 = 0u;
  v227 = 0u;
  v226 = 0u;
  v225 = 0u;
  v224 = 0u;
  v223 = 0u;
  v222 = 0u;
  v221 = 0u;
  v220 = 0u;
  v219 = 0u;
  v218 = 0u;
  v217 = 0u;
  v216 = 0u;
  v215 = 0u;
  v214 = 0u;
  v213 = 0u;
  v212 = 0u;
  v211 = 0u;
  v210 = 0u;
  v209 = 0u;
  v208 = 0u;
  v207 = 0u;
  v206 = 0u;
  v205 = 0u;
  v204 = 0u;
  memset(v203, 0, sizeof(v203));
  v186[0] = (__int128 *)v14;
  v29 = sub_19C19E844((uint64_t **)(*(_QWORD *)v148 + 96), (const void **)v14, (uint64_t)&unk_19C27ADD0, v186);
  (*(void (**)(_BYTE *__return_ptr))(*v29[7] + 152))(v203);
  bzero(v186, 0x2C0uLL);
  v186[1] = (__int128 *)2;
  memset(&v186[4], 0, 24);
  v191 = v245;
  v192 = v246;
  v193 = v247;
  v194 = v248;
  v187 = v241;
  v188 = v242;
  v189 = v243;
  v190 = v244;
  v202 = v225;
  v201 = v224;
  v200 = v223;
  v199 = v222;
  v198 = v221;
  v196 = v219;
  v197 = v220;
  v195 = v218;
  if (*(_QWORD *)v234 != 11)
  {
    v30 = v187;
    LODWORD(v187) = DWORD2(v187);
    DWORD2(v187) = v30;
  }
  if (*(_QWORD *)v203 != 11)
  {
    v31 = v195;
    LODWORD(v195) = DWORD2(v195);
    DWORD2(v195) = v31;
  }
  v32 = operator new();
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    sub_19C07C6E8(&__p, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
  else
    __p = __str;
  sub_19C07AE40(v32, (int)&__p, v148[0], v186);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  v179 = 0u;
  v180 = 0u;
  v177 = 0u;
  v178 = 0u;
  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  v156 = 0u;
  memset(v155, 0, sizeof(v155));
  __dst[0].__r_.__value_.__r.__words[0] = v14;
  v33 = sub_19C19E844(v27, (const void **)v14, (uint64_t)&unk_19C27ADD0, (__int128 **)__dst);
  (*(void (**)(_OWORD *__return_ptr))(*v33[7] + 152))(v155);
  *((_BYTE *)&__src.__r_.__value_.__s + 23) = 0;
  __src.__r_.__value_.__s.__data_[0] = 0;
  if (!*(_QWORD *)&v155[0] && *((_QWORD *)&v156 + 1) == 4)
  {
    v34 = SHIBYTE(__str.__r_.__value_.__r.__words[2]);
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    else
      size = __str.__r_.__value_.__l.__size_;
    v36 = size + 8;
    if (size + 8 >= 0x7FFFFFFFFFFFFFF8)
      sub_19C07C774();
    if (v36 >= 0x17)
    {
      v38 = (v36 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v36 | 7) != 0x17)
        v38 = v36 | 7;
      v39 = v38 + 1;
      v37 = (std::string *)operator new(v38 + 1);
      __dst[0].__r_.__value_.__l.__size_ = size + 8;
      __dst[0].__r_.__value_.__r.__words[2] = v39 | 0x8000000000000000;
      __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v37;
    }
    else
    {
      memset(__dst, 0, 24);
      v37 = __dst;
      *((_BYTE *)&__dst[0].__r_.__value_.__s + 23) = size + 8;
      if (!size)
      {
LABEL_74:
        strcpy((char *)v37 + size, "_softmax");
        __src = __dst[0];
        bzero(v186, 0x2C0uLL);
        v186[0] = (__int128 *)2;
        v186[7] = (__int128 *)4;
        v191 = v222;
        v192 = v223;
        v193 = v224;
        v194 = v225;
        v187 = v218;
        v188 = v219;
        v189 = v220;
        v190 = v221;
        v201 = v224;
        v202 = v225;
        v199 = v222;
        v200 = v223;
        v197 = v220;
        v198 = v221;
        v195 = v218;
        v196 = v219;
        v41 = operator new();
        if (SHIBYTE(__src.__r_.__value_.__r.__words[2]) < 0)
          sub_19C07C6E8(__dst, __src.__r_.__value_.__l.__data_, __src.__r_.__value_.__l.__size_);
        else
          __dst[0] = __src;
        sub_19C22AE40(v41, (int)__dst, v148[0], v186);
        if (SHIBYTE(__dst[0].__r_.__value_.__r.__words[2]) < 0)
          operator delete(__dst[0].__r_.__value_.__l.__data_);
        __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&__src;
        v42 = sub_19C19E844(v27, (const void **)&__src.__r_.__value_.__l.__data_, (uint64_t)&unk_19C27ADD0, (__int128 **)__dst);
        v43 = v42[7];
        v42[7] = (uint64_t *)v41;
        if (v43)
          (*(void (**)(uint64_t *))(*v43 + 8))(v43);
        goto LABEL_81;
      }
    }
    if (v34 >= 0)
      p_str = &__str;
    else
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    memmove(v37, p_str, size);
    goto LABEL_74;
  }
LABEL_81:
  v44 = v14 + 24;
  if (v18 != v14 + 24)
  {
    v45 = (const void **)v18;
    do
    {
      __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)v45;
      v46 = sub_19C19E844(v27, v45, (uint64_t)&unk_19C27ADD0, (__int128 **)__dst);
      v47 = (uint64_t)v46[7];
      v46[7] = 0;
      v153 = v47;
      sub_19C07C468(v32, &v153);
      v48 = v153;
      v153 = 0;
      if (v48)
        (*(void (**)(uint64_t))(*(_QWORD *)v48 + 8))(v48);
      v129 = v45 == (const void **)v14;
      v45 += 3;
    }
    while (!v129);
  }
  v49 = *(uint64_t **)(*(_QWORD *)v148 + 96);
  if (v49 != (uint64_t *)(*(_QWORD *)v148 + 104))
  {
    do
    {
      v57 = (uint64_t *)v49[1];
      if (v49[7])
      {
        if (v57)
        {
          do
          {
            v58 = v57;
            v57 = (uint64_t *)*v57;
          }
          while (v57);
        }
        else
        {
          do
          {
            v58 = (uint64_t *)v49[2];
            v129 = *v58 == (_QWORD)v49;
            v49 = v58;
          }
          while (!v129);
        }
      }
      else
      {
        v59 = (uint64_t *)v49[1];
        v60 = v49;
        if (v57)
        {
          do
          {
            v58 = v59;
            v59 = (uint64_t *)*v59;
          }
          while (v59);
        }
        else
        {
          do
          {
            v58 = (uint64_t *)v60[2];
            v129 = *v58 == (_QWORD)v60;
            v60 = v58;
          }
          while (!v129);
        }
        v61 = v49;
        if (v57)
        {
          do
          {
            v62 = v57;
            v57 = (uint64_t *)*v57;
          }
          while (v57);
        }
        else
        {
          do
          {
            v62 = (uint64_t *)v61[2];
            v129 = *v62 == (_QWORD)v61;
            v61 = v62;
          }
          while (!v129);
        }
        if (*v27 == v49)
          *v27 = v62;
        v63 = *(uint64_t **)(*(_QWORD *)v148 + 104);
        --*(_QWORD *)(*(_QWORD *)v148 + 112);
        sub_19C236CA8(v63, v49);
        v64 = v49[7];
        v49[7] = 0;
        if (v64)
          (*(void (**)(uint64_t))(*(_QWORD *)v64 + 8))(v64);
        if (*((char *)v49 + 55) < 0)
          operator delete((void *)v49[4]);
        operator delete(v49);
      }
      v49 = v58;
    }
    while (v58 != (uint64_t *)(*(_QWORD *)v148 + 104));
  }
  __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
  v50 = sub_19C19E844(v27, (const void **)&__str.__r_.__value_.__l.__data_, (uint64_t)&unk_19C27ADD0, (__int128 **)__dst);
  v51 = v50[7];
  v50[7] = (uint64_t *)v32;
  if (v51)
    (*(void (**)(uint64_t *))(*v51 + 8))(v51);
  if (v18 == *(_QWORD *)(*(_QWORD *)v148 + 120))
  {
    *(_OWORD *)&__dst[0].__r_.__value_.__r.__words[1] = 0uLL;
    __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&__dst[0].__r_.__value_.__l.__size_;
    v65 = *(const void ***)(*(_QWORD *)v148 + 8);
    if (v65 != (const void **)(*(_QWORD *)v148 + 16))
    {
      do
      {
        sub_19C098AD0((uint64_t **)__dst, (uint64_t *)&__dst[0].__r_.__value_.__l.__size_, v65 + 4, (uint64_t)(v65 + 4));
        v66 = (const void **)v65[1];
        if (v66)
        {
          do
          {
            v67 = (const void ***)v66;
            v66 = (const void **)*v66;
          }
          while (v66);
        }
        else
        {
          do
          {
            v67 = (const void ***)v65[2];
            v129 = *v67 == v65;
            v65 = (const void **)v67;
          }
          while (!v129);
        }
        v65 = (const void **)v67;
      }
      while (v67 != (const void ***)(*(_QWORD *)v148 + 16));
      v71 = __dst[0].__r_.__value_.__r.__words[0];
      if ((std::string::size_type *)__dst[0].__r_.__value_.__l.__data_ != &__dst[0].__r_.__value_.__r.__words[1])
      {
        do
        {
          v266.__r_.__value_.__r.__words[0] = v71 + 32;
          v72 = sub_19C235F0C((uint64_t **)(*(_QWORD *)v148 + 144), (const void **)(v71 + 32), (uint64_t)&unk_19C27ADD0, (__int128 **)&v266);
          v74 = v72[7];
          v73 = v72[8];
          if (v74 != v73)
          {
            if (*((char *)a2 + 23) >= 0)
              v75 = (unsigned __int8 *)*((unsigned __int8 *)a2 + 23);
            else
              v75 = a2[1];
            if ((*((_BYTE *)a2 + 23) & 0x80) != 0)
            {
              v76 = *a2;
              while (1)
              {
                v80 = *(unsigned __int8 *)(v74 + 47);
                if ((v80 & 0x80u) == 0)
                  v81 = (unsigned __int8 *)*(unsigned __int8 *)(v74 + 47);
                else
                  v81 = *(unsigned __int8 **)(v74 + 32);
                if (v81 == v75)
                {
                  if ((v80 & 0x80) != 0)
                  {
                    if (!memcmp(*(const void **)(v74 + 24), v76, *(_QWORD *)(v74 + 32)))
                      goto LABEL_174;
                  }
                  else
                  {
                    if (!*(_BYTE *)(v74 + 47))
                      goto LABEL_174;
                    v82 = 0;
                    while (*(unsigned __int8 *)(v74 + v82 + 24) == v76[v82])
                    {
                      if (v80 == ++v82)
                        goto LABEL_174;
                    }
                  }
                }
                v74 += 56;
                if (v74 == v73)
                  goto LABEL_176;
              }
            }
            while (1)
            {
              v77 = *(unsigned __int8 *)(v74 + 47);
              if ((v77 & 0x80u) == 0)
                v78 = (unsigned __int8 *)*(unsigned __int8 *)(v74 + 47);
              else
                v78 = *(unsigned __int8 **)(v74 + 32);
              if (v78 == v75)
              {
                if ((v77 & 0x80) != 0)
                {
                  if (!memcmp(*(const void **)(v74 + 24), a2, *(_QWORD *)(v74 + 32)))
                    break;
                }
                else
                {
                  if (!*(_BYTE *)(v74 + 47))
                    break;
                  v79 = 0;
                  while (*(unsigned __int8 *)(v74 + v79 + 24) == *((unsigned __int8 *)a2 + v79))
                  {
                    if (v77 == ++v79)
                      goto LABEL_174;
                  }
                }
              }
              v74 += 56;
              if (v74 == v73)
                goto LABEL_176;
            }
          }
LABEL_174:
          if (v74 != v73)
            std::string::operator=((std::string *)(v74 + 24), &__str);
LABEL_176:
          v83 = *(std::string **)(v71 + 8);
          if (v83)
          {
            do
            {
              v84 = v83;
              v83 = (std::string *)v83->__r_.__value_.__r.__words[0];
            }
            while (v83);
          }
          else
          {
            do
            {
              v84 = *(std::string **)(v71 + 16);
              v129 = v84->__r_.__value_.__r.__words[0] == v71;
              v71 = (std::string::size_type)v84;
            }
            while (!v129);
          }
          v71 = (std::string::size_type)v84;
        }
        while (v84 != (std::string *)&__dst[0].__r_.__value_.__r.__words[1]);
      }
    }
    sub_19C098FBC((uint64_t)__dst, (char *)__dst[0].__r_.__value_.__l.__size_);
  }
  else
  {
    __dst[0].__r_.__value_.__r.__words[0] = v18 - 24;
    v52 = sub_19C235F0C((uint64_t **)(*(_QWORD *)v148 + 144), (const void **)(v18 - 24), (uint64_t)&unk_19C27ADD0, (__int128 **)__dst);
    v53 = v52[7];
    v54 = v52[8];
    if (v53 != v54)
    {
      if (*((char *)a2 + 23) >= 0)
        v55 = (unsigned __int8 *)*((unsigned __int8 *)a2 + 23);
      else
        v55 = a2[1];
      if ((*((_BYTE *)a2 + 23) & 0x80) != 0)
      {
        v56 = *a2;
        while (1)
        {
          v85 = *(unsigned __int8 *)(v53 + 47);
          if ((v85 & 0x80u) == 0)
            v86 = (unsigned __int8 *)*(unsigned __int8 *)(v53 + 47);
          else
            v86 = *(unsigned __int8 **)(v53 + 32);
          if (v86 == v55)
          {
            if ((v85 & 0x80) != 0)
            {
              if (!memcmp(*(const void **)(v53 + 24), v56, *(_QWORD *)(v53 + 32)))
                goto LABEL_194;
            }
            else
            {
              if (!*(_BYTE *)(v53 + 47))
                goto LABEL_194;
              v87 = 0;
              while (*(unsigned __int8 *)(v53 + v87 + 24) == v56[v87])
              {
                if (v85 == ++v87)
                  goto LABEL_194;
              }
            }
          }
          v53 += 56;
          if (v53 == v54)
            goto LABEL_196;
        }
      }
      while (1)
      {
        v68 = *(unsigned __int8 *)(v53 + 47);
        if ((v68 & 0x80u) == 0)
          v69 = (unsigned __int8 *)*(unsigned __int8 *)(v53 + 47);
        else
          v69 = *(unsigned __int8 **)(v53 + 32);
        if (v69 == v55)
        {
          if ((v68 & 0x80) != 0)
          {
            if (!memcmp(*(const void **)(v53 + 24), a2, *(_QWORD *)(v53 + 32)))
              break;
          }
          else
          {
            if (!*(_BYTE *)(v53 + 47))
              break;
            v70 = 0;
            while (*(unsigned __int8 *)(v53 + v70 + 24) == *((unsigned __int8 *)a2 + v70))
            {
              if (v68 == ++v70)
                goto LABEL_194;
            }
          }
        }
        v53 += 56;
        if (v53 == v54)
          goto LABEL_196;
      }
    }
LABEL_194:
    if (v53 != v54)
      std::string::operator=((std::string *)(v53 + 24), &__str);
  }
LABEL_196:
  v88 = HIBYTE(__src.__r_.__value_.__r.__words[2]);
  v89 = HIBYTE(__src.__r_.__value_.__r.__words[2]);
  v90 = __src.__r_.__value_.__l.__size_;
  if ((__src.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v91 = HIBYTE(__src.__r_.__value_.__r.__words[2]);
  else
    v91 = __src.__r_.__value_.__l.__size_;
  p_src = &__src;
  if (!v91)
    p_src = &__str;
  v93 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if (v91)
    v93 = HIBYTE(__src.__r_.__value_.__r.__words[2]);
  if (v93 < 0)
  {
    if (v91)
      v94 = __src.__r_.__value_.__l.__size_;
    else
      v94 = __str.__r_.__value_.__l.__size_;
    sub_19C07C6E8(&__s1, p_src->__r_.__value_.__l.__data_, v94);
    v88 = HIBYTE(__src.__r_.__value_.__r.__words[2]);
    v90 = __src.__r_.__value_.__l.__size_;
    v89 = HIBYTE(__src.__r_.__value_.__r.__words[2]);
  }
  else
  {
    __s1 = *p_src;
  }
  v95 = HIBYTE(__s1.__r_.__value_.__r.__words[2]);
  if ((__s1.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v96 = HIBYTE(__s1.__r_.__value_.__r.__words[2]);
  else
    v96 = __s1.__r_.__value_.__l.__size_;
  if (v89 < 0)
    v88 = v90;
  if (v96 == v88)
  {
    if (v89 >= 0)
      v97 = &__src;
    else
      v97 = (std::string *)__src.__r_.__value_.__r.__words[0];
    if ((*((_BYTE *)&__s1.__r_.__value_.__s + 23) & 0x80) != 0)
    {
      if (memcmp(__s1.__r_.__value_.__l.__data_, v97, __s1.__r_.__value_.__l.__size_))
        goto LABEL_237;
    }
    else if (*((_BYTE *)&__s1.__r_.__value_.__s + 23))
    {
      p_s1 = &__s1;
      while (p_s1->__r_.__value_.__s.__data_[0] == v97->__r_.__value_.__s.__data_[0])
      {
        p_s1 = (std::string *)((char *)p_s1 + 1);
        v97 = (std::string *)((char *)v97 + 1);
        if (!--v95)
          goto LABEL_225;
      }
      goto LABEL_237;
    }
LABEL_225:
    __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
    v99 = sub_19C235F0C((uint64_t **)(*(_QWORD *)v148 + 144), (const void **)&__str.__r_.__value_.__l.__data_, (uint64_t)&unk_19C27ADD0, (__int128 **)__dst);
    v100 = v99;
    v150 = 1;
    v151 = 9;
    v101 = v99[8];
    if (v101 >= v99[9])
    {
      v102 = sub_19C23706C((void **)v99 + 7, (__int128 *)&__str, (__int128 *)&__src, &v151, &v150);
    }
    else
    {
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        sub_19C07C6E8(__dst, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
      else
        __dst[0] = __str;
      if (SHIBYTE(__src.__r_.__value_.__r.__words[2]) < 0)
        sub_19C07C6E8(&v266, __src.__r_.__value_.__l.__data_, __src.__r_.__value_.__l.__size_);
      else
        v266 = __src;
      v104 = v150;
      v103 = v151;
      v105 = __dst[0].__r_.__value_.__r.__words[2];
      *(_OWORD *)v101 = *(_OWORD *)&__dst[0].__r_.__value_.__l.__data_;
      *(_QWORD *)(v101 + 16) = v105;
      *(std::string *)(v101 + 24) = v266;
      *(_DWORD *)(v101 + 48) = v103;
      *(_DWORD *)(v101 + 52) = v104;
      v102 = (char *)(v101 + 56);
      v100[8] = v101 + 56;
    }
    v100[8] = (uint64_t)v102;
  }
LABEL_237:
  v149 = v18;
  v106 = (uint64_t **)(*(_QWORD *)v148 + 144);
  __dst[0].__r_.__value_.__r.__words[0] = v14;
  v107 = sub_19C235F0C((uint64_t **)(*(_QWORD *)v148 + 144), (const void **)v14, (uint64_t)&unk_19C27ADD0, (__int128 **)__dst);
  v108 = v107[7];
  for (i = v107[8]; v108 != i; v108 += 56)
  {
    while (1)
    {
      __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&__s1;
      v110 = sub_19C235F0C(v106, (const void **)&__s1.__r_.__value_.__l.__data_, (uint64_t)&unk_19C27ADD0, (__int128 **)__dst);
      v111 = v110;
      v112 = v110[8];
      if (v112 < v110[9])
        break;
      v110[8] = (uint64_t)sub_19C23731C((void **)v110 + 7, (__int128 *)&__s1, (__int128 *)(v108 + 24), (int *)(v108 + 48), (int *)(v108 + 52));
      v108 += 56;
      if (v108 == i)
        goto LABEL_248;
    }
    if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0)
      sub_19C07C6E8(__dst, __s1.__r_.__value_.__l.__data_, __s1.__r_.__value_.__l.__size_);
    else
      __dst[0] = __s1;
    if (*(char *)(v108 + 47) < 0)
    {
      sub_19C07C6E8(&v266, *(void **)(v108 + 24), *(_QWORD *)(v108 + 32));
    }
    else
    {
      v113 = *(_OWORD *)(v108 + 24);
      v266.__r_.__value_.__r.__words[2] = *(_QWORD *)(v108 + 40);
      *(_OWORD *)&v266.__r_.__value_.__l.__data_ = v113;
    }
    v114 = *(_QWORD *)(v108 + 48);
    v115 = *(_OWORD *)&__dst[0].__r_.__value_.__l.__data_;
    *(_QWORD *)(v112 + 16) = *((_QWORD *)&__dst[0].__r_.__value_.__l + 2);
    *(_OWORD *)v112 = v115;
    *(std::string *)(v112 + 24) = v266;
    *(_QWORD *)(v112 + 48) = v114;
    v111[8] = v112 + 56;
    v111[8] = v112 + 56;
  }
LABEL_248:
  if (v149 != v44)
  {
    v116 = (uint64_t *)(*(_QWORD *)v148 + 152);
    v117 = v149;
    do
    {
      v118 = *v116;
      if (!*v116)
        goto LABEL_289;
      v119 = *(char *)(v117 + 23);
      v120 = v119 >= 0 ? *(unsigned __int8 *)(v117 + 23) : *(_QWORD *)(v117 + 8);
      v121 = v119 >= 0 ? (const void *)v117 : *(const void **)v117;
      v122 = *(_QWORD *)v148 + 152;
      do
      {
        v123 = *(char *)(v118 + 55);
        if (v123 >= 0)
          v124 = *(unsigned __int8 *)(v118 + 55);
        else
          v124 = *(_QWORD *)(v118 + 40);
        if (v123 >= 0)
          v125 = (const void *)(v118 + 32);
        else
          v125 = *(const void **)(v118 + 32);
        if (v120 >= v124)
          v126 = v124;
        else
          v126 = v120;
        v127 = memcmp(v125, v121, v126);
        v128 = v124 < v120;
        if (v127)
          v128 = v127 < 0;
        v129 = !v128;
        if (v128)
          v130 = (uint64_t *)(v118 + 8);
        else
          v130 = (uint64_t *)v118;
        if (v129)
          v122 = v118;
        v118 = *v130;
      }
      while (*v130);
      if ((uint64_t *)v122 == v116)
        goto LABEL_289;
      v131 = *(char *)(v122 + 55);
      if (v131 >= 0)
        v132 = *(unsigned __int8 *)(v122 + 55);
      else
        v132 = *(_QWORD *)(v122 + 40);
      if (v131 >= 0)
        v133 = (const void *)(v122 + 32);
      else
        v133 = *(const void **)(v122 + 32);
      if (v132 >= v120)
        v134 = v120;
      else
        v134 = v132;
      v135 = memcmp(v121, v133, v134);
      v136 = v120 < v132;
      if (v135)
        v136 = v135 < 0;
      if (v136)
LABEL_289:
        v122 = *(_QWORD *)v148 + 152;
      sub_19C2375CC(v106, v122);
      v129 = v117 == v14;
      v117 += 24;
    }
    while (!v129);
  }
  memset(__dst, 0, 24);
  v137 = *(_QWORD *)(*(_QWORD *)v148 + 120);
  if (v137 == v149)
    goto LABEL_304;
  v138 = 0;
  do
  {
    if ((unint64_t)v138 < __dst[0].__r_.__value_.__r.__words[2])
    {
      if (*(char *)(v137 + 23) < 0)
      {
        sub_19C07C6E8(v138, *(void **)v137, *(_QWORD *)(v137 + 8));
      }
      else
      {
        v139 = *(_OWORD *)v137;
        *((_QWORD *)v138 + 2) = *(_QWORD *)(v137 + 16);
        *(_OWORD *)v138 = v139;
      }
      v138 += 24;
    }
    else
    {
      v138 = sub_19C07DA20(&__dst[0].__r_.__value_.__l.__data_, v137);
    }
    __dst[0].__r_.__value_.__l.__size_ = (std::string::size_type)v138;
    v137 += 24;
  }
  while (v137 != v149);
  if ((unint64_t)v138 >= __dst[0].__r_.__value_.__r.__words[2])
  {
LABEL_304:
    v141 = sub_19C07DA20(&__dst[0].__r_.__value_.__l.__data_, (uint64_t)&__str);
  }
  else
  {
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    {
      sub_19C07C6E8(v138, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
    }
    else
    {
      v140 = *(_OWORD *)&__str.__r_.__value_.__l.__data_;
      *((_QWORD *)v138 + 2) = *((_QWORD *)&__str.__r_.__value_.__l + 2);
      *(_OWORD *)v138 = v140;
    }
    v141 = v138 + 24;
    __dst[0].__r_.__value_.__l.__size_ = (std::string::size_type)(v138 + 24);
  }
  __dst[0].__r_.__value_.__l.__size_ = (std::string::size_type)v141;
  v142 = HIBYTE(__src.__r_.__value_.__r.__words[2]);
  if ((__src.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v142 = __src.__r_.__value_.__l.__size_;
  if (v142)
  {
    if ((unint64_t)v141 >= __dst[0].__r_.__value_.__r.__words[2])
    {
      v141 = sub_19C07DA20(&__dst[0].__r_.__value_.__l.__data_, (uint64_t)&__src);
    }
    else
    {
      if (SHIBYTE(__src.__r_.__value_.__r.__words[2]) < 0)
      {
        sub_19C07C6E8(v141, __src.__r_.__value_.__l.__data_, __src.__r_.__value_.__l.__size_);
      }
      else
      {
        v143 = *(_OWORD *)&__src.__r_.__value_.__l.__data_;
        *((_QWORD *)v141 + 2) = *((_QWORD *)&__src.__r_.__value_.__l + 2);
        *(_OWORD *)v141 = v143;
      }
      v141 += 24;
      __dst[0].__r_.__value_.__l.__size_ = (std::string::size_type)v141;
    }
    __dst[0].__r_.__value_.__l.__size_ = (std::string::size_type)v141;
  }
  while (v44 != *(_QWORD *)(*(_QWORD *)v148 + 128))
  {
    if ((unint64_t)v141 < __dst[0].__r_.__value_.__r.__words[2])
    {
      if (*(char *)(v44 + 23) < 0)
      {
        sub_19C07C6E8(v141, *(void **)v44, *(_QWORD *)(v44 + 8));
      }
      else
      {
        v144 = *(_OWORD *)v44;
        *((_QWORD *)v141 + 2) = *(_QWORD *)(v44 + 16);
        *(_OWORD *)v141 = v144;
      }
      v141 += 24;
      __dst[0].__r_.__value_.__l.__size_ = (std::string::size_type)v141;
    }
    else
    {
      v141 = sub_19C07DA20(&__dst[0].__r_.__value_.__l.__data_, v44);
    }
    __dst[0].__r_.__value_.__l.__size_ = (std::string::size_type)v141;
    v44 += 24;
  }
  v145 = *(_QWORD *)(*(_QWORD *)v148 + 120);
  v146 = __dst[0].__r_.__value_.__r.__words[2];
  *(_QWORD *)(*(_QWORD *)v148 + 120) = __dst[0].__r_.__value_.__r.__words[0];
  *(_QWORD *)(*(_QWORD *)v148 + 128) = v141;
  __dst[0].__r_.__value_.__r.__words[0] = v145;
  __dst[0].__r_.__value_.__l.__size_ = v44;
  v147 = *(_QWORD *)(*(_QWORD *)v148 + 136);
  *(_QWORD *)(*(_QWORD *)v148 + 136) = v146;
  __dst[0].__r_.__value_.__r.__words[2] = v147;
  if (v145)
  {
    if (v44 != v145)
    {
      do
      {
        if (*(char *)(v44 - 1) < 0)
          operator delete(*(void **)(v44 - 24));
        v44 -= 24;
      }
      while (v44 != v145);
      v44 = __dst[0].__r_.__value_.__r.__words[0];
    }
    __dst[0].__r_.__value_.__l.__size_ = v145;
    operator delete((void *)v44);
  }
  if (SHIBYTE(__s1.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__s1.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__src.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_335:
      if ((SHIBYTE(__str.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        return;
LABEL_339:
      operator delete(__str.__r_.__value_.__l.__data_);
      return;
    }
  }
  else if ((SHIBYTE(__src.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_335;
  }
  operator delete(__src.__r_.__value_.__l.__data_);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_339;
}

void sub_19C235A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (*(char *)(v27 - 105) < 0)
    operator delete(*(void **)(v27 - 128));
  *(_QWORD *)(v26 + 64) = v25;
  if (a18 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  if (*(char *)(v27 - 169) < 0)
    operator delete(*(void **)(v27 - 192));
  _Unwind_Resume(a1);
}

uint64_t sub_19C235C9C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 216) + 32))(*(_QWORD *)(a1 + 216));
}

uint64_t sub_19C235CAC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 216);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 48))(result);
  return result;
}

uint64_t sub_19C235CC4()
{
  return 0;
}

void sub_19C235CCC(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;

  if (a2)
  {
    sub_19C235CCC(a1, *a2);
    sub_19C235CCC(a1, a2[1]);
    v4 = a2[5];
    a2[5] = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    operator delete(a2);
  }
}

void sub_19C235D24(uint64_t a1, char *a2)
{
  uint64_t v4;

  if (a2)
  {
    sub_19C235D24(a1, *(_QWORD *)a2);
    sub_19C235D24(a1, *((_QWORD *)a2 + 1));
    v4 = *((_QWORD *)a2 + 7);
    *((_QWORD *)a2 + 7) = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

void sub_19C235D9C(uint64_t a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (!a2)
    return;
  sub_19C235D9C(a1, *(_QWORD *)a2);
  sub_19C235D9C(a1, *((_QWORD *)a2 + 1));
  v4 = *((_QWORD *)a2 + 7);
  if (v4)
  {
    v5 = *((_QWORD *)a2 + 8);
    v6 = (void *)*((_QWORD *)a2 + 7);
    if (v5 == v4)
    {
LABEL_13:
      *((_QWORD *)a2 + 8) = v4;
      operator delete(v6);
      goto LABEL_14;
    }
    while (1)
    {
      if (*(char *)(v5 - 9) < 0)
      {
        operator delete(*(void **)(v5 - 32));
        if (*(char *)(v5 - 33) < 0)
LABEL_10:
          operator delete(*(void **)(v5 - 56));
      }
      else if (*(char *)(v5 - 33) < 0)
      {
        goto LABEL_10;
      }
      v5 -= 56;
      if (v5 == v4)
      {
        v6 = (void *)*((_QWORD *)a2 + 7);
        goto LABEL_13;
      }
    }
  }
LABEL_14:
  if (a2[55] < 0)
    operator delete(*((void **)a2 + 4));
  operator delete(a2);
}

void sub_19C235E6C(uint64_t a1, uint64_t a2)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  if (a2)
  {
    sub_19C235E6C(a1, *(_QWORD *)a2);
    sub_19C235E6C(a1, *(_QWORD *)(a2 + 8));
    v4 = *(std::__shared_weak_count **)(a2 + 64);
    if (!v4)
      goto LABEL_6;
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      if ((*(char *)(a2 + 55) & 0x80000000) == 0)
        goto LABEL_7;
    }
    else
    {
LABEL_6:
      if ((*(char *)(a2 + 55) & 0x80000000) == 0)
      {
LABEL_7:
        operator delete((void *)a2);
        return;
      }
    }
    operator delete(*(void **)(a2 + 32));
    operator delete((void *)a2);
  }
}

uint64_t *sub_19C235F0C(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  uint64_t **v8;
  int v9;
  size_t v10;
  const void *v11;
  _QWORD *v12;
  const void *v13;
  const void *v14;
  int v15;
  size_t v16;
  const void *v17;
  size_t v18;
  int v19;
  _BOOL4 v20;
  int v21;
  _BOOL4 v22;
  uint64_t *v23;
  _BYTE *v24;
  __int128 *v25;
  __int128 v26;
  uint64_t *v27;
  uint64_t *v29;

  v6 = a1[1];
  v7 = a1 + 1;
  v8 = a1 + 1;
  if (v6)
  {
    v9 = *((char *)a2 + 23);
    if (v9 >= 0)
      v10 = *((unsigned __int8 *)a2 + 23);
    else
      v10 = (size_t)a2[1];
    if (v9 >= 0)
      v11 = a2;
    else
      v11 = *a2;
    while (1)
    {
      while (1)
      {
        v8 = (uint64_t **)v6;
        v14 = (const void *)v6[4];
        v12 = v6 + 4;
        v13 = v14;
        v15 = *((char *)v12 + 23);
        if (v15 >= 0)
          v16 = *((unsigned __int8 *)v12 + 23);
        else
          v16 = v12[1];
        if (v15 >= 0)
          v17 = v12;
        else
          v17 = v13;
        if (v16 >= v10)
          v18 = v10;
        else
          v18 = v16;
        v19 = memcmp(v11, v17, v18);
        v20 = v10 < v16;
        if (v19)
          v20 = v19 < 0;
        if (!v20)
          break;
        v6 = *v8;
        v7 = v8;
        if (!*v8)
          goto LABEL_26;
      }
      v21 = memcmp(v17, v11, v18);
      v22 = v16 < v10;
      if (v21)
        v22 = v21 < 0;
      if (!v22)
        break;
      v6 = v8[1];
      if (!v6)
      {
        v7 = v8 + 1;
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:
    v23 = (uint64_t *)operator new(0x50uLL);
    v29 = v23;
    v24 = v23 + 4;
    v25 = *a4;
    if (*((char *)*a4 + 23) < 0)
    {
      sub_19C07C6E8(v24, *(void **)v25, *((_QWORD *)v25 + 1));
    }
    else
    {
      v26 = *v25;
      v23[6] = *((_QWORD *)v25 + 2);
      *(_OWORD *)v24 = v26;
    }
    v23[7] = 0;
    v23[8] = 0;
    v23[9] = 0;
    *v23 = 0;
    v23[1] = 0;
    v23[2] = (uint64_t)v8;
    *v7 = v23;
    v27 = (uint64_t *)**a1;
    if (v27)
    {
      *a1 = v27;
      v23 = *v7;
    }
    sub_19C07CC40(a1[1], v23);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
    return v29;
  }
  return (uint64_t *)v8;
}

void sub_19C2360B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  char *v11;

  sub_19C2360D4(v10, v11);
  _Unwind_Resume(a1);
}

void sub_19C2360D4(uint64_t a1, char *__p)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (!*(_BYTE *)(a1 + 8))
  {
    if (!__p)
      return;
    goto LABEL_12;
  }
  v3 = *((_QWORD *)__p + 7);
  if (v3)
  {
    v4 = *((_QWORD *)__p + 8);
    v5 = (void *)*((_QWORD *)__p + 7);
    if (v4 == v3)
    {
LABEL_14:
      *((_QWORD *)__p + 8) = v3;
      operator delete(v5);
      goto LABEL_15;
    }
    while (1)
    {
      if (*(char *)(v4 - 9) < 0)
      {
        operator delete(*(void **)(v4 - 32));
        if (*(char *)(v4 - 33) < 0)
LABEL_10:
          operator delete(*(void **)(v4 - 56));
      }
      else if (*(char *)(v4 - 33) < 0)
      {
        goto LABEL_10;
      }
      v4 -= 56;
      if (v4 == v3)
      {
        v5 = (void *)*((_QWORD *)__p + 7);
        goto LABEL_14;
      }
    }
  }
LABEL_15:
  if ((__p[55] & 0x80000000) == 0)
  {
LABEL_12:
    operator delete(__p);
    return;
  }
  operator delete(*((void **)__p + 4));
  operator delete(__p);
}

uint64_t **sub_19C2361A0(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  size_t v9;
  const void *v10;
  uint64_t **v11;
  _QWORD *v12;
  const void *v13;
  const void *v14;
  int v15;
  size_t v16;
  const void *v17;
  size_t v18;
  int v19;
  _BOOL4 v20;
  int v21;
  _BOOL4 v22;
  _QWORD *v23;
  _BYTE *v24;
  __int128 *v25;
  __int128 v26;
  uint64_t *v27;
  uint64_t *v28;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *((char *)a2 + 23);
    if (v8 >= 0)
      v9 = *((unsigned __int8 *)a2 + 23);
    else
      v9 = (size_t)a2[1];
    if (v8 >= 0)
      v10 = a2;
    else
      v10 = *a2;
    while (1)
    {
      while (1)
      {
        v11 = (uint64_t **)v6;
        v14 = (const void *)v6[4];
        v12 = v6 + 4;
        v13 = v14;
        v15 = *((char *)v12 + 23);
        if (v15 >= 0)
          v16 = *((unsigned __int8 *)v12 + 23);
        else
          v16 = v12[1];
        if (v15 >= 0)
          v17 = v12;
        else
          v17 = v13;
        if (v16 >= v9)
          v18 = v9;
        else
          v18 = v16;
        v19 = memcmp(v10, v17, v18);
        v20 = v9 < v16;
        if (v19)
          v20 = v19 < 0;
        if (!v20)
          break;
        v6 = *v11;
        v7 = v11;
        if (!*v11)
          goto LABEL_27;
      }
      v21 = memcmp(v17, v10, v18);
      v22 = v16 < v9;
      if (v21)
        v22 = v21 < 0;
      if (!v22)
        return v11;
      v6 = v11[1];
      if (!v6)
      {
        v7 = v11 + 1;
        goto LABEL_27;
      }
    }
  }
  else
  {
    v11 = a1 + 1;
LABEL_27:
    v23 = operator new(0x48uLL);
    v24 = v23 + 4;
    v25 = *a4;
    if (*((char *)*a4 + 23) < 0)
    {
      sub_19C07C6E8(v24, *(void **)v25, *((_QWORD *)v25 + 1));
    }
    else
    {
      v26 = *v25;
      v23[6] = *((_QWORD *)v25 + 2);
      *(_OWORD *)v24 = v26;
    }
    v23[7] = 0;
    v23[8] = 0;
    *v23 = 0;
    v23[1] = 0;
    v23[2] = v11;
    *v7 = v23;
    v27 = (uint64_t *)**a1;
    v28 = v23;
    if (v27)
    {
      *a1 = v27;
      v28 = *v7;
    }
    sub_19C07CC40(a1[1], v28);
    a1[2] = (uint64_t *)((char *)a1[2] + 1);
  }
  return (uint64_t **)v23;
}

void sub_19C236328(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C23633C()
{
  uint64_t result;

  qword_1EE4188F8 = 0;
  unk_1EE418900 = "MontrealNeuralNetworkState";
  qword_1EE418908 = 0;
  unk_1EE418910 = 0;
  qword_1EE418918 = (uint64_t)sub_19C0803A4;
  unk_1EE418920 = 0u;
  unk_1EE418930 = 0u;
  result = _CFRuntimeRegisterClass();
  qword_1EE418958 = result;
  return result;
}

void sub_19C236390(uint64_t a1)
{
  void *v1;

  v1 = (void *)sub_19C18E518(a1);
  operator delete(v1);
}

void sub_19C2363A8(uint64_t a1)
{
  void *v1;

  v1 = (void *)sub_19C18E518(a1);
  operator delete(v1);
}

void sub_19C2363C0(uint64_t a1)
{
  void *v1;

  v1 = (void *)sub_19C190830(a1);
  operator delete(v1);
}

void sub_19C2363D4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E3D25068;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_19C2363E8(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E3D25068;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_19C23640C(uint64_t a1)
{
  return sub_19C19E9E0(a1 + 24);
}

char *sub_19C236418(void **a1, __int128 *a2, __int128 *a3, int *a4, int *a5)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;
  int v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  char *v24;
  void **v25;
  BOOL v26;
  char *v28;
  __int128 v29;
  uint64_t v30;
  __int128 __dst;
  uint64_t v32;

  v6 = (_BYTE *)a1[1] - (_BYTE *)*a1;
  v7 = 0x6DB6DB6DB6DB6DB7 * (v6 >> 3) + 1;
  if (v7 > 0x492492492492492)
    sub_19C07DA0C();
  if (0xDB6DB6DB6DB6DB6ELL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) > v7)
    v7 = 0xDB6DB6DB6DB6DB6ELL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3);
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3)) >= 0x249249249249249)
    v12 = 0x492492492492492;
  else
    v12 = v7;
  if (v12)
  {
    if (v12 > 0x492492492492492)
      sub_19C07C7FC();
    v13 = (char *)operator new(56 * v12);
  }
  else
  {
    v13 = 0;
  }
  v14 = &v13[8 * (v6 >> 3)];
  v15 = &v13[56 * v12];
  if (*((char *)a2 + 23) < 0)
  {
    sub_19C07C6E8(&__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    __dst = *a2;
    v32 = *((_QWORD *)a2 + 2);
  }
  if (*((char *)a3 + 23) < 0)
  {
    sub_19C07C6E8(&v29, *(void **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v29 = *a3;
    v30 = *((_QWORD *)a3 + 2);
  }
  v16 = *a4;
  v17 = *a5;
  *(_OWORD *)v14 = __dst;
  *((_QWORD *)v14 + 2) = v32;
  v18 = &v13[v6];
  *(_OWORD *)(v18 + 24) = v29;
  *((_QWORD *)v18 + 5) = v30;
  *((_DWORD *)v18 + 12) = v16;
  *((_DWORD *)v18 + 13) = v17;
  v19 = v14 + 56;
  v28 = v14 + 56;
  v21 = (char *)*a1;
  v20 = (char *)a1[1];
  if (v20 == *a1)
  {
    v24 = (char *)a1[1];
  }
  else
  {
    do
    {
      v22 = *(_OWORD *)(v20 - 56);
      *((_QWORD *)v14 - 5) = *((_QWORD *)v20 - 5);
      *(_OWORD *)(v14 - 56) = v22;
      *((_QWORD *)v20 - 6) = 0;
      *((_QWORD *)v20 - 5) = 0;
      *((_QWORD *)v20 - 7) = 0;
      v23 = *((_OWORD *)v20 - 2);
      *((_QWORD *)v14 - 2) = *((_QWORD *)v20 - 2);
      *((_OWORD *)v14 - 2) = v23;
      *((_QWORD *)v20 - 3) = 0;
      *((_QWORD *)v20 - 2) = 0;
      *((_QWORD *)v20 - 4) = 0;
      *((_QWORD *)v14 - 1) = *((_QWORD *)v20 - 1);
      v14 -= 56;
      v20 -= 56;
    }
    while (v20 != v21);
    v24 = (char *)*a1;
    v20 = (char *)a1[1];
    v19 = v28;
  }
  *a1 = v14;
  a1[1] = v19;
  a1[2] = v15;
  if (v20 != v24)
  {
    v25 = (void **)(v20 - 56);
    while (1)
    {
      if (*((char *)v25 + 47) < 0)
      {
        operator delete(v25[3]);
        if (*((char *)v25 + 23) < 0)
LABEL_28:
          operator delete(*v25);
      }
      else if (*((char *)v25 + 23) < 0)
      {
        goto LABEL_28;
      }
      v26 = v25 == (void **)v24;
      v25 -= 7;
      if (v26)
      {
        v20 = v24;
        break;
      }
    }
  }
  if (v20)
    operator delete(v20);
  return v19;
}

void sub_19C236690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
  {
    operator delete(__p);
    sub_19C2366C8((uint64_t)&a10);
    _Unwind_Resume(a1);
  }
  sub_19C2366C8((uint64_t)&a10);
  _Unwind_Resume(a1);
}

uint64_t sub_19C2366C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v2; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 56;
    if (*(char *)(i - 9) < 0)
    {
      operator delete(*(void **)(i - 32));
      if ((*(char *)(i - 33) & 0x80000000) == 0)
        continue;
    }
    else if ((*(char *)(i - 33) & 0x80000000) == 0)
    {
      continue;
    }
    operator delete(*(void **)(i - 56));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

char *sub_19C236748(void **a1, __int128 *a2, __int128 *a3, int *a4, int *a5)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;
  int v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  char *v24;
  void **v25;
  BOOL v26;
  char *v28;
  __int128 v29;
  uint64_t v30;
  __int128 __dst;
  uint64_t v32;

  v6 = (_BYTE *)a1[1] - (_BYTE *)*a1;
  v7 = 0x6DB6DB6DB6DB6DB7 * (v6 >> 3) + 1;
  if (v7 > 0x492492492492492)
    sub_19C07DA0C();
  if (0xDB6DB6DB6DB6DB6ELL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) > v7)
    v7 = 0xDB6DB6DB6DB6DB6ELL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3);
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3)) >= 0x249249249249249)
    v12 = 0x492492492492492;
  else
    v12 = v7;
  if (v12)
  {
    if (v12 > 0x492492492492492)
      sub_19C07C7FC();
    v13 = (char *)operator new(56 * v12);
  }
  else
  {
    v13 = 0;
  }
  v14 = &v13[8 * (v6 >> 3)];
  v15 = &v13[56 * v12];
  if (*((char *)a2 + 23) < 0)
  {
    sub_19C07C6E8(&__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    __dst = *a2;
    v32 = *((_QWORD *)a2 + 2);
  }
  if (*((char *)a3 + 23) < 0)
  {
    sub_19C07C6E8(&v29, *(void **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v29 = *a3;
    v30 = *((_QWORD *)a3 + 2);
  }
  v16 = *a4;
  v17 = *a5;
  *(_OWORD *)v14 = __dst;
  *((_QWORD *)v14 + 2) = v32;
  v18 = &v13[v6];
  *(_OWORD *)(v18 + 24) = v29;
  *((_QWORD *)v18 + 5) = v30;
  *((_DWORD *)v18 + 12) = v16;
  *((_DWORD *)v18 + 13) = v17;
  v19 = v14 + 56;
  v28 = v14 + 56;
  v21 = (char *)*a1;
  v20 = (char *)a1[1];
  if (v20 == *a1)
  {
    v24 = (char *)a1[1];
  }
  else
  {
    do
    {
      v22 = *(_OWORD *)(v20 - 56);
      *((_QWORD *)v14 - 5) = *((_QWORD *)v20 - 5);
      *(_OWORD *)(v14 - 56) = v22;
      *((_QWORD *)v20 - 6) = 0;
      *((_QWORD *)v20 - 5) = 0;
      *((_QWORD *)v20 - 7) = 0;
      v23 = *((_OWORD *)v20 - 2);
      *((_QWORD *)v14 - 2) = *((_QWORD *)v20 - 2);
      *((_OWORD *)v14 - 2) = v23;
      *((_QWORD *)v20 - 3) = 0;
      *((_QWORD *)v20 - 2) = 0;
      *((_QWORD *)v20 - 4) = 0;
      *((_QWORD *)v14 - 1) = *((_QWORD *)v20 - 1);
      v14 -= 56;
      v20 -= 56;
    }
    while (v20 != v21);
    v24 = (char *)*a1;
    v20 = (char *)a1[1];
    v19 = v28;
  }
  *a1 = v14;
  a1[1] = v19;
  a1[2] = v15;
  if (v20 != v24)
  {
    v25 = (void **)(v20 - 56);
    while (1)
    {
      if (*((char *)v25 + 47) < 0)
      {
        operator delete(v25[3]);
        if (*((char *)v25 + 23) < 0)
LABEL_28:
          operator delete(*v25);
      }
      else if (*((char *)v25 + 23) < 0)
      {
        goto LABEL_28;
      }
      v26 = v25 == (void **)v24;
      v25 -= 7;
      if (v26)
      {
        v20 = v24;
        break;
      }
    }
  }
  if (v20)
    operator delete(v20);
  return v19;
}

void sub_19C2369C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
  {
    operator delete(__p);
    sub_19C2366C8((uint64_t)&a10);
    _Unwind_Resume(a1);
  }
  sub_19C2366C8((uint64_t)&a10);
  _Unwind_Resume(a1);
}

char *sub_19C2369F8(void **a1, __int128 *a2, __int128 *a3, int *a4, int *a5)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;
  int v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  char *v24;
  void **v25;
  BOOL v26;
  char *v28;
  __int128 v29;
  uint64_t v30;
  __int128 __dst;
  uint64_t v32;

  v6 = (_BYTE *)a1[1] - (_BYTE *)*a1;
  v7 = 0x6DB6DB6DB6DB6DB7 * (v6 >> 3) + 1;
  if (v7 > 0x492492492492492)
    sub_19C07DA0C();
  if (0xDB6DB6DB6DB6DB6ELL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) > v7)
    v7 = 0xDB6DB6DB6DB6DB6ELL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3);
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3)) >= 0x249249249249249)
    v12 = 0x492492492492492;
  else
    v12 = v7;
  if (v12)
  {
    if (v12 > 0x492492492492492)
      sub_19C07C7FC();
    v13 = (char *)operator new(56 * v12);
  }
  else
  {
    v13 = 0;
  }
  v14 = &v13[8 * (v6 >> 3)];
  v15 = &v13[56 * v12];
  if (*((char *)a2 + 23) < 0)
  {
    sub_19C07C6E8(&__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    __dst = *a2;
    v32 = *((_QWORD *)a2 + 2);
  }
  if (*((char *)a3 + 23) < 0)
  {
    sub_19C07C6E8(&v29, *(void **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v29 = *a3;
    v30 = *((_QWORD *)a3 + 2);
  }
  v16 = *a4;
  v17 = *a5;
  *(_OWORD *)v14 = __dst;
  *((_QWORD *)v14 + 2) = v32;
  v18 = &v13[v6];
  *(_OWORD *)(v18 + 24) = v29;
  *((_QWORD *)v18 + 5) = v30;
  *((_DWORD *)v18 + 12) = v16;
  *((_DWORD *)v18 + 13) = v17;
  v19 = v14 + 56;
  v28 = v14 + 56;
  v21 = (char *)*a1;
  v20 = (char *)a1[1];
  if (v20 == *a1)
  {
    v24 = (char *)a1[1];
  }
  else
  {
    do
    {
      v22 = *(_OWORD *)(v20 - 56);
      *((_QWORD *)v14 - 5) = *((_QWORD *)v20 - 5);
      *(_OWORD *)(v14 - 56) = v22;
      *((_QWORD *)v20 - 6) = 0;
      *((_QWORD *)v20 - 5) = 0;
      *((_QWORD *)v20 - 7) = 0;
      v23 = *((_OWORD *)v20 - 2);
      *((_QWORD *)v14 - 2) = *((_QWORD *)v20 - 2);
      *((_OWORD *)v14 - 2) = v23;
      *((_QWORD *)v20 - 3) = 0;
      *((_QWORD *)v20 - 2) = 0;
      *((_QWORD *)v20 - 4) = 0;
      *((_QWORD *)v14 - 1) = *((_QWORD *)v20 - 1);
      v14 -= 56;
      v20 -= 56;
    }
    while (v20 != v21);
    v24 = (char *)*a1;
    v20 = (char *)a1[1];
    v19 = v28;
  }
  *a1 = v14;
  a1[1] = v19;
  a1[2] = v15;
  if (v20 != v24)
  {
    v25 = (void **)(v20 - 56);
    while (1)
    {
      if (*((char *)v25 + 47) < 0)
      {
        operator delete(v25[3]);
        if (*((char *)v25 + 23) < 0)
LABEL_28:
          operator delete(*v25);
      }
      else if (*((char *)v25 + 23) < 0)
      {
        goto LABEL_28;
      }
      v26 = v25 == (void **)v24;
      v25 -= 7;
      if (v26)
      {
        v20 = v24;
        break;
      }
    }
  }
  if (v20)
    operator delete(v20);
  return v19;
}

void sub_19C236C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
  {
    operator delete(__p);
    sub_19C2366C8((uint64_t)&a10);
    _Unwind_Resume(a1);
  }
  sub_19C2366C8((uint64_t)&a10);
  _Unwind_Resume(a1);
}

uint64_t *sub_19C236CA8(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;
  uint64_t **v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_10;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (!v2)
  {
    v5 = 1;
    v6 = (uint64_t **)v3[2];
    v7 = *v6;
    if (*v6 == v3)
      goto LABEL_6;
LABEL_11:
    v6[1] = (uint64_t *)v2;
    v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2)
      goto LABEL_16;
    goto LABEL_12;
  }
LABEL_10:
  v5 = 0;
  *(_QWORD *)(v2 + 16) = v3[2];
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 != v3)
    goto LABEL_11;
LABEL_6:
  *v6 = (uint64_t *)v2;
  if (v3 != result)
  {
    v7 = v6[1];
    v8 = *((unsigned __int8 *)v3 + 24);
    if (v3 == a2)
      goto LABEL_16;
LABEL_12:
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
    goto LABEL_16;
  }
  v7 = 0;
  result = (uint64_t *)v2;
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
    goto LABEL_12;
LABEL_16:
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v14 = (uint64_t **)v7[2];
    if (*v14 == v7)
      break;
    if (*((_BYTE *)v7 + 24))
    {
      v15 = (_QWORD *)*v7;
      if (!*v7)
        goto LABEL_38;
    }
    else
    {
      *((_BYTE *)v7 + 24) = 1;
      *((_BYTE *)v14 + 24) = 0;
      v17 = v14[1];
      v18 = (uint64_t *)*v17;
      v14[1] = (uint64_t *)*v17;
      if (v18)
        v18[2] = (uint64_t)v14;
      v17[2] = (uint64_t)v14[2];
      v14[2][*v14[2] != (_QWORD)v14] = (uint64_t)v17;
      *v17 = (uint64_t)v14;
      v14[2] = v17;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
      v15 = (_QWORD *)*v7;
      if (!*v7)
        goto LABEL_38;
    }
    if (!*((_BYTE *)v15 + 24))
    {
      v19 = (uint64_t *)v7[1];
      if (!v19)
        goto LABEL_64;
LABEL_63:
      if (*((_BYTE *)v19 + 24))
      {
LABEL_64:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v23 = v15[1];
        *v7 = v23;
        if (v23)
          *(_QWORD *)(v23 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v19 = v7;
      }
      else
      {
        v15 = v7;
      }
      v27 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v27 + 24);
      *(_BYTE *)(v27 + 24) = 1;
      *((_BYTE *)v19 + 24) = 1;
      v28 = *(uint64_t **)(v27 + 8);
      v29 = *v28;
      *(_QWORD *)(v27 + 8) = *v28;
      if (v29)
        *(_QWORD *)(v29 + 16) = v27;
      v28[2] = *(_QWORD *)(v27 + 16);
      *(_QWORD *)(*(_QWORD *)(v27 + 16) + 8 * (**(_QWORD **)(v27 + 16) != v27)) = v28;
      *v28 = v27;
      *(_QWORD *)(v27 + 16) = v28;
      return result;
    }
LABEL_38:
    v19 = (uint64_t *)v7[1];
    if (v19 && !*((_BYTE *)v19 + 24))
      goto LABEL_63;
    *((_BYTE *)v7 + 24) = 0;
    v12 = (uint64_t *)v7[2];
    if (v12 == result)
    {
      v12 = result;
LABEL_61:
      *((_BYTE *)v12 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v12 + 24))
      goto LABEL_61;
LABEL_24:
    v7 = *(uint64_t **)(v12[2] + 8 * (*(_QWORD *)v12[2] == (_QWORD)v12));
  }
  if (*((_BYTE *)v7 + 24))
  {
    v16 = (_QWORD *)*v7;
    if (!*v7)
      goto LABEL_49;
LABEL_48:
    if (!*((_BYTE *)v16 + 24))
      goto LABEL_67;
  }
  else
  {
    *((_BYTE *)v7 + 24) = 1;
    *((_BYTE *)v14 + 24) = 0;
    v20 = (uint64_t *)v7[1];
    *v14 = v20;
    if (v20)
      v20[2] = (uint64_t)v14;
    v7[2] = (uint64_t)v14[2];
    v14[2][*v14[2] != (_QWORD)v14] = (uint64_t)v7;
    v7[1] = (uint64_t)v14;
    v14[2] = v7;
    if (result == (uint64_t *)v14)
      result = v7;
    v7 = *v14;
    v16 = (_QWORD *)**v14;
    if (v16)
      goto LABEL_48;
  }
LABEL_49:
  v21 = (uint64_t *)v7[1];
  if (!v21 || *((_BYTE *)v21 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v12 = (uint64_t *)v7[2];
    if (*((_BYTE *)v12 + 24))
      v13 = v12 == result;
    else
      v13 = 1;
    if (v13)
      goto LABEL_61;
    goto LABEL_24;
  }
  if (v16 && !*((_BYTE *)v16 + 24))
  {
LABEL_67:
    v21 = v7;
  }
  else
  {
    *((_BYTE *)v21 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v22 = *v21;
    v7[1] = *v21;
    if (v22)
      *(_QWORD *)(v22 + 16) = v7;
    v21[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v21;
    *v21 = (uint64_t)v7;
    v7[2] = (uint64_t)v21;
    v16 = v7;
  }
  v24 = (uint64_t *)v21[2];
  *((_BYTE *)v21 + 24) = *((_BYTE *)v24 + 24);
  *((_BYTE *)v24 + 24) = 1;
  *((_BYTE *)v16 + 24) = 1;
  v25 = *v24;
  v26 = *(_QWORD *)(*v24 + 8);
  *v24 = v26;
  if (v26)
    *(_QWORD *)(v26 + 16) = v24;
  *(_QWORD *)(v25 + 16) = v24[2];
  *(_QWORD *)(v24[2] + 8 * (*(_QWORD *)v24[2] != (_QWORD)v24)) = v25;
  *(_QWORD *)(v25 + 8) = v24;
  v24[2] = v25;
  return result;
}

char *sub_19C23706C(void **a1, __int128 *a2, __int128 *a3, int *a4, int *a5)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;
  int v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  char *v24;
  void **v25;
  BOOL v26;
  char *v28;
  __int128 v29;
  uint64_t v30;
  __int128 __dst;
  uint64_t v32;

  v6 = (_BYTE *)a1[1] - (_BYTE *)*a1;
  v7 = 0x6DB6DB6DB6DB6DB7 * (v6 >> 3) + 1;
  if (v7 > 0x492492492492492)
    sub_19C07DA0C();
  if (0xDB6DB6DB6DB6DB6ELL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) > v7)
    v7 = 0xDB6DB6DB6DB6DB6ELL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3);
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3)) >= 0x249249249249249)
    v12 = 0x492492492492492;
  else
    v12 = v7;
  if (v12)
  {
    if (v12 > 0x492492492492492)
      sub_19C07C7FC();
    v13 = (char *)operator new(56 * v12);
  }
  else
  {
    v13 = 0;
  }
  v14 = &v13[8 * (v6 >> 3)];
  v15 = &v13[56 * v12];
  if (*((char *)a2 + 23) < 0)
  {
    sub_19C07C6E8(&__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    __dst = *a2;
    v32 = *((_QWORD *)a2 + 2);
  }
  if (*((char *)a3 + 23) < 0)
  {
    sub_19C07C6E8(&v29, *(void **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v29 = *a3;
    v30 = *((_QWORD *)a3 + 2);
  }
  v16 = *a4;
  v17 = *a5;
  *(_OWORD *)v14 = __dst;
  *((_QWORD *)v14 + 2) = v32;
  v18 = &v13[v6];
  *(_OWORD *)(v18 + 24) = v29;
  *((_QWORD *)v18 + 5) = v30;
  *((_DWORD *)v18 + 12) = v16;
  *((_DWORD *)v18 + 13) = v17;
  v19 = v14 + 56;
  v28 = v14 + 56;
  v21 = (char *)*a1;
  v20 = (char *)a1[1];
  if (v20 == *a1)
  {
    v24 = (char *)a1[1];
  }
  else
  {
    do
    {
      v22 = *(_OWORD *)(v20 - 56);
      *((_QWORD *)v14 - 5) = *((_QWORD *)v20 - 5);
      *(_OWORD *)(v14 - 56) = v22;
      *((_QWORD *)v20 - 6) = 0;
      *((_QWORD *)v20 - 5) = 0;
      *((_QWORD *)v20 - 7) = 0;
      v23 = *((_OWORD *)v20 - 2);
      *((_QWORD *)v14 - 2) = *((_QWORD *)v20 - 2);
      *((_OWORD *)v14 - 2) = v23;
      *((_QWORD *)v20 - 3) = 0;
      *((_QWORD *)v20 - 2) = 0;
      *((_QWORD *)v20 - 4) = 0;
      *((_QWORD *)v14 - 1) = *((_QWORD *)v20 - 1);
      v14 -= 56;
      v20 -= 56;
    }
    while (v20 != v21);
    v24 = (char *)*a1;
    v20 = (char *)a1[1];
    v19 = v28;
  }
  *a1 = v14;
  a1[1] = v19;
  a1[2] = v15;
  if (v20 != v24)
  {
    v25 = (void **)(v20 - 56);
    while (1)
    {
      if (*((char *)v25 + 47) < 0)
      {
        operator delete(v25[3]);
        if (*((char *)v25 + 23) < 0)
LABEL_28:
          operator delete(*v25);
      }
      else if (*((char *)v25 + 23) < 0)
      {
        goto LABEL_28;
      }
      v26 = v25 == (void **)v24;
      v25 -= 7;
      if (v26)
      {
        v20 = v24;
        break;
      }
    }
  }
  if (v20)
    operator delete(v20);
  return v19;
}

void sub_19C2372E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
  {
    operator delete(__p);
    sub_19C2366C8((uint64_t)&a10);
    _Unwind_Resume(a1);
  }
  sub_19C2366C8((uint64_t)&a10);
  _Unwind_Resume(a1);
}

char *sub_19C23731C(void **a1, __int128 *a2, __int128 *a3, int *a4, int *a5)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;
  int v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  char *v24;
  void **v25;
  BOOL v26;
  char *v28;
  __int128 v29;
  uint64_t v30;
  __int128 __dst;
  uint64_t v32;

  v6 = (_BYTE *)a1[1] - (_BYTE *)*a1;
  v7 = 0x6DB6DB6DB6DB6DB7 * (v6 >> 3) + 1;
  if (v7 > 0x492492492492492)
    sub_19C07DA0C();
  if (0xDB6DB6DB6DB6DB6ELL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) > v7)
    v7 = 0xDB6DB6DB6DB6DB6ELL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3);
  if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3)) >= 0x249249249249249)
    v12 = 0x492492492492492;
  else
    v12 = v7;
  if (v12)
  {
    if (v12 > 0x492492492492492)
      sub_19C07C7FC();
    v13 = (char *)operator new(56 * v12);
  }
  else
  {
    v13 = 0;
  }
  v14 = &v13[8 * (v6 >> 3)];
  v15 = &v13[56 * v12];
  if (*((char *)a2 + 23) < 0)
  {
    sub_19C07C6E8(&__dst, *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    __dst = *a2;
    v32 = *((_QWORD *)a2 + 2);
  }
  if (*((char *)a3 + 23) < 0)
  {
    sub_19C07C6E8(&v29, *(void **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v29 = *a3;
    v30 = *((_QWORD *)a3 + 2);
  }
  v16 = *a4;
  v17 = *a5;
  *(_OWORD *)v14 = __dst;
  *((_QWORD *)v14 + 2) = v32;
  v18 = &v13[v6];
  *(_OWORD *)(v18 + 24) = v29;
  *((_QWORD *)v18 + 5) = v30;
  *((_DWORD *)v18 + 12) = v16;
  *((_DWORD *)v18 + 13) = v17;
  v19 = v14 + 56;
  v28 = v14 + 56;
  v21 = (char *)*a1;
  v20 = (char *)a1[1];
  if (v20 == *a1)
  {
    v24 = (char *)a1[1];
  }
  else
  {
    do
    {
      v22 = *(_OWORD *)(v20 - 56);
      *((_QWORD *)v14 - 5) = *((_QWORD *)v20 - 5);
      *(_OWORD *)(v14 - 56) = v22;
      *((_QWORD *)v20 - 6) = 0;
      *((_QWORD *)v20 - 5) = 0;
      *((_QWORD *)v20 - 7) = 0;
      v23 = *((_OWORD *)v20 - 2);
      *((_QWORD *)v14 - 2) = *((_QWORD *)v20 - 2);
      *((_OWORD *)v14 - 2) = v23;
      *((_QWORD *)v20 - 3) = 0;
      *((_QWORD *)v20 - 2) = 0;
      *((_QWORD *)v20 - 4) = 0;
      *((_QWORD *)v14 - 1) = *((_QWORD *)v20 - 1);
      v14 -= 56;
      v20 -= 56;
    }
    while (v20 != v21);
    v24 = (char *)*a1;
    v20 = (char *)a1[1];
    v19 = v28;
  }
  *a1 = v14;
  a1[1] = v19;
  a1[2] = v15;
  if (v20 != v24)
  {
    v25 = (void **)(v20 - 56);
    while (1)
    {
      if (*((char *)v25 + 47) < 0)
      {
        operator delete(v25[3]);
        if (*((char *)v25 + 23) < 0)
LABEL_28:
          operator delete(*v25);
      }
      else if (*((char *)v25 + 23) < 0)
      {
        goto LABEL_28;
      }
      v26 = v25 == (void **)v24;
      v25 -= 7;
      if (v26)
      {
        v20 = v24;
        break;
      }
    }
  }
  if (v20)
    operator delete(v20);
  return v19;
}

void sub_19C237594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a24 < 0)
  {
    operator delete(__p);
    sub_19C2366C8((uint64_t)&a10);
    _Unwind_Resume(a1);
  }
  sub_19C2366C8((uint64_t)&a10);
  _Unwind_Resume(a1);
}

_QWORD *sub_19C2375CC(_QWORD *a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  BOOL v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = *(_QWORD **)(a2 + 8);
  if (v3)
  {
    do
    {
      v4 = v3;
      v3 = (_QWORD *)*v3;
    }
    while (v3);
  }
  else
  {
    v5 = (_QWORD *)a2;
    do
    {
      v4 = (_QWORD *)v5[2];
      v6 = *v4 == (_QWORD)v5;
      v5 = v4;
    }
    while (!v6);
  }
  if (*a1 == a2)
    *a1 = v4;
  v7 = (uint64_t *)a1[1];
  --a1[2];
  sub_19C236CA8(v7, (uint64_t *)a2);
  v8 = *(_QWORD *)(a2 + 56);
  if (v8)
  {
    v9 = *(_QWORD *)(a2 + 64);
    v10 = *(void **)(a2 + 56);
    if (v9 == v8)
    {
LABEL_19:
      *(_QWORD *)(a2 + 64) = v8;
      operator delete(v10);
      goto LABEL_20;
    }
    while (1)
    {
      if (*(char *)(v9 - 9) < 0)
      {
        operator delete(*(void **)(v9 - 32));
        if (*(char *)(v9 - 33) < 0)
LABEL_17:
          operator delete(*(void **)(v9 - 56));
      }
      else if (*(char *)(v9 - 33) < 0)
      {
        goto LABEL_17;
      }
      v9 -= 56;
      if (v9 == v8)
      {
        v10 = *(void **)(a2 + 56);
        goto LABEL_19;
      }
    }
  }
LABEL_20:
  if (*(char *)(a2 + 55) < 0)
    operator delete(*(void **)(a2 + 32));
  operator delete((void *)a2);
  return v4;
}

void sub_19C237A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_19C237B30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C237C0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C237C1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C237C30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C237D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C237DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C237E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C237E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C238024(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;

  if (v11)
    operator delete(v11);
  _Unwind_Resume(exception_object);
}

void sub_19C238090(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C2380F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C238108(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C2382B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

__n128 sub_19C2383B8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *sub_19C2384F8(_QWORD *a1, uint64_t a2, uint64_t a3, int *__src)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *__p[2];
  uint64_t v14;
  int v15;
  int64x2_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int64x2_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int64x2_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19C07C6E8(__p, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    v14 = *(_QWORD *)(a2 + 16);
  }
  sub_19C18E344((uint64_t)a1, (__int128 *)__p, a3, __src);
  if (SHIBYTE(v14) < 0)
    operator delete(__p[0]);
  *a1 = &unk_1E3D22878;
  v7 = __src[32];
  v8 = __src[36];
  v9 = __src[40];
  v10 = __src[64];
  v11 = __src[68];
  v15 = 1;
  v16 = vdupq_n_s64(1uLL);
  v18 = 0;
  v19 = 0;
  v17 = v7;
  v20 = 2;
  v21 = v16;
  v23 = 0;
  v24 = 0;
  v22 = v8;
  v25 = 3;
  v26 = v16;
  v28 = 0;
  v29 = 0;
  v27 = v9;
  sub_19C07C964((uint64_t)(a1 + 2), &v15, (int *)&v30);
  v15 = 9;
  v16 = vdupq_n_s64(1uLL);
  v18 = 0;
  v19 = 0;
  v17 = v10;
  v20 = 10;
  v21 = v16;
  v23 = 0;
  v24 = 0;
  v22 = v11;
  sub_19C07C964((uint64_t)(a1 + 5), &v15, &v25);
  return a1;
}

void sub_19C238668(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C18E518(v1);
  _Unwind_Resume(a1);
}

void sub_19C23867C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C18E518(v1);
  _Unwind_Resume(a1);
}

void sub_19C238690(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_19C2386AC(uint64_t *result, int a2)
{
  uint64_t *v3;
  int *v4;
  uint64_t **v5;
  uint64_t **v6;
  char *v7;
  int *v8;
  int v9;
  char *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int v16;
  char *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t **v23;
  char *v24;
  int v25;
  char *v26;
  uint64_t v27;
  uint64_t *v28;
  int64x2_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = result;
  v5 = (uint64_t **)(result + 3);
  v4 = (int *)result[3];
  v6 = (uint64_t **)(result + 3);
  v7 = (char *)(result + 3);
  if (v4)
  {
    v8 = (int *)result[3];
    while (1)
    {
      while (1)
      {
        v7 = (char *)v8;
        v9 = v8[8];
        if (v9 < 3)
          break;
        v8 = *(int **)v7;
        v6 = (uint64_t **)v7;
        if (!*(_QWORD *)v7)
          goto LABEL_8;
      }
      if (v9 == 2)
        break;
      v8 = (int *)*((_QWORD *)v7 + 1);
      if (!v8)
      {
        v6 = (uint64_t **)(v7 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    v10 = v7;
    v7 = (char *)operator new(0x50uLL);
    *((_DWORD *)v7 + 8) = 2;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 56) = 0u;
    *((_QWORD *)v7 + 9) = 0;
    *(_QWORD *)v7 = 0;
    *((_QWORD *)v7 + 1) = 0;
    *((_QWORD *)v7 + 2) = v10;
    *v6 = (uint64_t *)v7;
    v11 = *(_QWORD *)v3[2];
    v12 = (uint64_t *)v7;
    if (v11)
    {
      v3[2] = v11;
      v12 = *v6;
    }
    result = sub_19C07CC40((uint64_t *)v3[3], v12);
    v4 = (int *)v3[3];
    ++v3[4];
  }
  v13 = *((_QWORD *)v7 + 7);
  v14 = *((_QWORD *)v7 + 9);
  v15 = (char *)v5;
  if (v4)
  {
    while (1)
    {
      while (1)
      {
        v15 = (char *)v4;
        v16 = v4[8];
        if (v16 < 2)
          break;
        v4 = *(int **)v15;
        v5 = (uint64_t **)v15;
        if (!*(_QWORD *)v15)
          goto LABEL_18;
      }
      if (v16 == 1)
        break;
      v4 = (int *)*((_QWORD *)v15 + 1);
      if (!v4)
      {
        v5 = (uint64_t **)(v15 + 8);
        goto LABEL_18;
      }
    }
  }
  else
  {
LABEL_18:
    v17 = v15;
    v15 = (char *)operator new(0x50uLL);
    *((_DWORD *)v15 + 8) = 1;
    *(_OWORD *)(v15 + 40) = 0u;
    *(_OWORD *)(v15 + 56) = 0u;
    *((_QWORD *)v15 + 9) = 0;
    *(_QWORD *)v15 = 0;
    *((_QWORD *)v15 + 1) = 0;
    *((_QWORD *)v15 + 2) = v17;
    *v5 = (uint64_t *)v15;
    v18 = *(_QWORD *)v3[2];
    v19 = (uint64_t *)v15;
    if (v18)
    {
      v3[2] = v18;
      v19 = *v5;
    }
    result = sub_19C07CC40((uint64_t *)v3[3], v19);
    ++v3[4];
  }
  v20 = *((_QWORD *)v15 + 8);
  v21 = *((_QWORD *)v15 + 9);
  v23 = (uint64_t **)(v3 + 6);
  v22 = (char *)v3[6];
  if (v22)
  {
    while (1)
    {
      while (1)
      {
        v24 = v22;
        v25 = *((_DWORD *)v22 + 8);
        if (v25 <= a2)
          break;
        v22 = *(char **)v24;
        v23 = (uint64_t **)v24;
        if (!*(_QWORD *)v24)
          goto LABEL_28;
      }
      if (v25 >= a2)
        break;
      v22 = (char *)*((_QWORD *)v24 + 1);
      if (!v22)
      {
        v23 = (uint64_t **)(v24 + 8);
        goto LABEL_28;
      }
    }
  }
  else
  {
    v24 = (char *)(v3 + 6);
LABEL_28:
    v26 = v24;
    v24 = (char *)operator new(0x50uLL);
    *((_DWORD *)v24 + 8) = a2;
    *(_OWORD *)(v24 + 40) = 0u;
    *(_OWORD *)(v24 + 56) = 0u;
    *((_QWORD *)v24 + 9) = 0;
    *(_QWORD *)v24 = 0;
    *((_QWORD *)v24 + 1) = 0;
    *((_QWORD *)v24 + 2) = v26;
    *v23 = (uint64_t *)v24;
    v27 = *(_QWORD *)v3[5];
    v28 = (uint64_t *)v24;
    if (v27)
    {
      v3[5] = v27;
      v28 = *v23;
    }
    result = sub_19C07CC40((uint64_t *)v3[6], v28);
    ++v3[7];
  }
  v29 = vdupq_n_s64(1uLL);
  if (a2 == 10)
    v30 = v14;
  else
    v30 = v21;
  *(int64x2_t *)(v24 + 40) = v29;
  if (a2 == 10)
    v31 = 1;
  else
    v31 = v13;
  *((_QWORD *)v24 + 7) = v31;
  *((_QWORD *)v24 + 8) = v20;
  *((_QWORD *)v24 + 9) = v30;
  return result;
}

BOOL sub_19C2388FC(uint64_t a1, _QWORD *a2, int a3)
{
  char *v7;
  uint64_t **v8;
  char *v9;
  int v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;

  if ((a3 - 8) < 0xFFFFFFF9)
    return 0;
  v8 = (uint64_t **)(a1 + 24);
  v7 = *(char **)(a1 + 24);
  if (v7)
  {
    while (1)
    {
      while (1)
      {
        v9 = v7;
        v10 = *((_DWORD *)v7 + 8);
        if (v10 <= a3)
          break;
        v7 = *(char **)v9;
        v8 = (uint64_t **)v9;
        if (!*(_QWORD *)v9)
          goto LABEL_10;
      }
      if (v10 >= a3)
        break;
      v7 = (char *)*((_QWORD *)v9 + 1);
      if (!v7)
      {
        v8 = (uint64_t **)(v9 + 8);
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = (char *)(a1 + 24);
LABEL_10:
    v11 = v9;
    v9 = (char *)operator new(0x50uLL);
    *((_DWORD *)v9 + 8) = a3;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *((_QWORD *)v9 + 9) = 0;
    *(_QWORD *)v9 = 0;
    *((_QWORD *)v9 + 1) = 0;
    *((_QWORD *)v9 + 2) = v11;
    *v8 = (uint64_t *)v9;
    v12 = **(_QWORD **)(a1 + 16);
    v13 = (uint64_t *)v9;
    if (v12)
    {
      *(_QWORD *)(a1 + 16) = v12;
      v13 = *v8;
    }
    sub_19C07CC40(*(uint64_t **)(a1 + 24), v13);
    ++*(_QWORD *)(a1 + 32);
  }
  return *((_QWORD *)v9 + 5) != *a2
      || *((_QWORD *)v9 + 6) != a2[1]
      || *((_QWORD *)v9 + 7) != a2[2]
      || *((_QWORD *)v9 + 8) != a2[3]
      || *((_QWORD *)v9 + 9) != a2[4];
}

void sub_19C238A14(uint64_t a1)
{
  void *v1;

  v1 = (void *)sub_19C18E518(a1);
  operator delete(v1);
}

_QWORD *sub_19C238A28(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *__src)
{
  uint64_t v7;
  uint64_t v8;
  void *__p[2];
  uint64_t v11;
  int v12;
  int64x2_t v13;
  uint64_t v14;
  int64x2_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19C07C6E8(__p, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    v11 = *(_QWORD *)(a2 + 16);
  }
  sub_19C18E344((uint64_t)a1, (__int128 *)__p, a3, __src);
  if (SHIBYTE(v11) < 0)
    operator delete(__p[0]);
  *a1 = &unk_1E3D22B58;
  a1[127] = __src[56];
  LODWORD(v7) = *((_DWORD *)__src + 32);
  if ((int)v7 <= 1)
    v7 = 1;
  else
    v7 = v7;
  v12 = 1;
  v13 = vdupq_n_s64(1uLL);
  v14 = v7;
  v15 = v13;
  sub_19C07C964((uint64_t)(a1 + 2), &v12, (int *)&v16);
  v8 = *((int *)__src + 64);
  v12 = 9;
  v13 = vdupq_n_s64(1uLL);
  v15 = 0uLL;
  v14 = v8;
  sub_19C07C964((uint64_t)(a1 + 5), &v12, (int *)&v16);
  return a1;
}

void sub_19C238B64(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C18E518(v1);
  _Unwind_Resume(a1);
}

void sub_19C238B78(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C18E518(v1);
  _Unwind_Resume(a1);
}

void sub_19C238B8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C238BA8(_QWORD *a1, uint64_t a2)
{
  void **v4;
  void **v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  v4 = (void **)a1[20];
  v5 = (void **)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31])
      return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 48))(a2, a1);
    goto LABEL_8;
  }
  do
  {
    if (*v4)
      operator delete(*v4);
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    v7 = a1[29];
    v6 = (uint64_t *)a1[30];
    v8 = *v6;
    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v7 + 8);
    **(_QWORD **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        v9 = (uint64_t *)v6[1];
        operator delete(v6);
        v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
  return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 48))(a2, a1);
}

int64x2_t sub_19C238C64(uint64_t a1, int a2)
{
  int v4;
  int v5;
  char *v6;
  uint64_t **v7;
  uint64_t v8;
  char *v9;
  int v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  int64x2_t result;

  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 216))(a1, 1);
  v7 = (uint64_t **)(a1 + 48);
  v6 = *(char **)(a1 + 48);
  v8 = *(int *)(a1 + 568);
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        v9 = v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v10 <= a2)
          break;
        v6 = *(char **)v9;
        v7 = (uint64_t **)v9;
        if (!*(_QWORD *)v9)
          goto LABEL_8;
      }
      if (v10 >= a2)
        break;
      v6 = (char *)*((_QWORD *)v9 + 1);
      if (!v6)
      {
        v7 = (uint64_t **)(v9 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
    v9 = (char *)(a1 + 48);
LABEL_8:
    v11 = v9;
    v9 = (char *)operator new(0x50uLL);
    *((_DWORD *)v9 + 8) = a2;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *((_QWORD *)v9 + 9) = 0;
    *(_QWORD *)v9 = 0;
    *((_QWORD *)v9 + 1) = 0;
    *((_QWORD *)v9 + 2) = v11;
    *v7 = (uint64_t *)v9;
    v12 = **(_QWORD **)(a1 + 40);
    v13 = (uint64_t *)v9;
    if (v12)
    {
      *(_QWORD *)(a1 + 40) = v12;
      v13 = *v7;
    }
    sub_19C07CC40(*(uint64_t **)(a1 + 48), v13);
    ++*(_QWORD *)(a1 + 56);
  }
  result = vdupq_n_s64(1uLL);
  *(int64x2_t *)(v9 + 40) = result;
  *((_QWORD *)v9 + 7) = v8;
  *((_QWORD *)v9 + 8) = v4;
  *((_QWORD *)v9 + 9) = v5;
  return result;
}

_QWORD *sub_19C238D80(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *__src)
{
  uint64_t v7;
  uint64_t v8;
  void *__p[2];
  uint64_t v11;
  int v12;
  int64x2_t v13;
  uint64_t v14;
  int64x2_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19C07C6E8(__p, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    v11 = *(_QWORD *)(a2 + 16);
  }
  sub_19C19065C((uint64_t)a1, (__int128 *)__p, a3, __src);
  if (SHIBYTE(v11) < 0)
    operator delete(__p[0]);
  *a1 = &unk_1E3D229E8;
  a1[127] = __src[56];
  LODWORD(v7) = *((_DWORD *)__src + 32);
  if ((int)v7 <= 1)
    v7 = 1;
  else
    v7 = v7;
  v12 = 1;
  v13 = vdupq_n_s64(1uLL);
  v14 = v7;
  v15 = v13;
  sub_19C07C964((uint64_t)(a1 + 2), &v12, (int *)&v16);
  v8 = *((int *)__src + 64);
  v12 = 9;
  v13 = vdupq_n_s64(1uLL);
  v15 = 0uLL;
  v14 = v8;
  sub_19C07C964((uint64_t)(a1 + 5), &v12, (int *)&v16);
  return a1;
}

void sub_19C238EBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C190830(v1);
  _Unwind_Resume(a1);
}

void sub_19C238ED0(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C190830(v1);
  _Unwind_Resume(a1);
}

void sub_19C238EE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C238F00(_QWORD *a1, uint64_t a2)
{
  void **v4;
  void **v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  v4 = (void **)a1[20];
  v5 = (void **)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31])
      return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 152))(a2, a1);
    goto LABEL_8;
  }
  do
  {
    if (*v4)
      operator delete(*v4);
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    v7 = a1[29];
    v6 = (uint64_t *)a1[30];
    v8 = *v6;
    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v7 + 8);
    **(_QWORD **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        v9 = (uint64_t *)v6[1];
        operator delete(v6);
        v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
  return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 152))(a2, a1);
}

int64x2_t sub_19C238FBC(uint64_t a1, int a2)
{
  int v4;
  int v5;
  char *v6;
  uint64_t **v7;
  uint64_t v8;
  char *v9;
  int v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  int64x2_t result;

  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 216))(a1, 1);
  v7 = (uint64_t **)(a1 + 48);
  v6 = *(char **)(a1 + 48);
  v8 = *(int *)(a1 + 568);
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        v9 = v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v10 <= a2)
          break;
        v6 = *(char **)v9;
        v7 = (uint64_t **)v9;
        if (!*(_QWORD *)v9)
          goto LABEL_8;
      }
      if (v10 >= a2)
        break;
      v6 = (char *)*((_QWORD *)v9 + 1);
      if (!v6)
      {
        v7 = (uint64_t **)(v9 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
    v9 = (char *)(a1 + 48);
LABEL_8:
    v11 = v9;
    v9 = (char *)operator new(0x50uLL);
    *((_DWORD *)v9 + 8) = a2;
    *(_OWORD *)(v9 + 40) = 0u;
    *(_OWORD *)(v9 + 56) = 0u;
    *((_QWORD *)v9 + 9) = 0;
    *(_QWORD *)v9 = 0;
    *((_QWORD *)v9 + 1) = 0;
    *((_QWORD *)v9 + 2) = v11;
    *v7 = (uint64_t *)v9;
    v12 = **(_QWORD **)(a1 + 40);
    v13 = (uint64_t *)v9;
    if (v12)
    {
      *(_QWORD *)(a1 + 40) = v12;
      v13 = *v7;
    }
    sub_19C07CC40(*(uint64_t **)(a1 + 48), v13);
    ++*(_QWORD *)(a1 + 56);
  }
  result = vdupq_n_s64(1uLL);
  *(int64x2_t *)(v9 + 40) = result;
  *((_QWORD *)v9 + 7) = v8;
  *((_QWORD *)v9 + 8) = v4;
  *((_QWORD *)v9 + 9) = v5;
  return result;
}

void sub_19C2390D8(void *a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t Count;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = a1;
    Count = objc_msgSend_readCount(v8, v2, v3, v4);
    objc_msgSend_setReadCount_(v8, v6, Count + 1, v7);

  }
}

void sub_19C239144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C239158(void *a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t Count;
  const char *v6;
  uint64_t v7;
  id v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = a1;
    Count = objc_msgSend_readCount(v8, v2, v3, v4);
    objc_msgSend_setReadCount_(v8, v6, Count - 1, v7);

  }
}

void sub_19C2391C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t sub_19C2391D8(void *a1)
{
  uint64_t result;
  const char *v3;
  uint64_t v4;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend_setReadCount_(a1, v3, 0, v4);
  return result;
}

void sub_19C239224(void *a1)
{
  id v1;
  const char *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = a1;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1, v2, (uint64_t)&v9, (uint64_t)v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v1);
        objc_msgSend_incrementReadCount(*(void **)(*((_QWORD *)&v9 + 1) + 8 * v8++), v3, v4, v5, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v1, v3, (uint64_t)&v9, (uint64_t)v13, 16);
    }
    while (v6);
  }

}

void sub_19C239310(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C239334(uint64_t a1)
{
  size_t v1;
  void *v2;

  v1 = 4 * a1;
  v2 = malloc_type_malloc(4 * a1, 0xD4C96417uLL);
  bzero(v2, v1);
}

_QWORD *sub_19C239364(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;
  uint64_t v6;
  uint64_t v7;

  result = sub_19C2384F8(a1, a2, a3, (int *)a4);
  *result = &unk_1E3D23B28;
  result[128] = *(_QWORD *)(a4 + 576);
  *((_DWORD *)result + 264) = *(_DWORD *)(a4 + 320);
  v6 = *(_QWORD *)(a4 + 448);
  if ((*(_BYTE *)(a4 + 120) & 0x40) != 0)
  {
    result[127] = v6;
    v7 = *(_QWORD *)(a4 + 456);
  }
  else
  {
    result[129] = v6;
    result[130] = *(_QWORD *)(a4 + 456);
    v7 = *(_QWORD *)(a4 + 464);
  }
  result[131] = v7;
  return result;
}

uint64_t sub_19C2393E4(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  v4 = (_QWORD *)a1[20];
  v5 = (_QWORD *)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31])
      return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 96))(a2, a1);
    goto LABEL_8;
  }
  do
  {
    if (*v4)
      (*(void (**)(_QWORD))(*(_QWORD *)*v4 + 8))(*v4);
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    v7 = a1[29];
    v6 = (uint64_t *)a1[30];
    v8 = *v6;
    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v7 + 8);
    **(_QWORD **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        v9 = (uint64_t *)v6[1];
        operator delete(v6);
        v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
  return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 96))(a2, a1);
}

uint64_t sub_19C2394A8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a1 + 216))(a1, 2);
  sub_19C18FB08((uint64_t)a1);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*a1 + 312))(a1, a3, v5);
  v6 = a1[21] - a1[20];
  if ((int)(v6 >> 3) >= 1)
  {
    v7 = 0;
    v8 = v6 & 0x7FFFFFFF8;
    do
    {
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1[20] + v7) + 16))(*(_QWORD *)(a1[20] + v7), a3);
      v7 += 8;
    }
    while (v8 != v7);
  }
  sub_19C18FB60((uint64_t)a1, a3);
  return (*(uint64_t (**)(_QWORD *))(*a1 + 32))(a1);
}

void sub_19C239564(uint64_t a1)
{
  void *v1;

  v1 = (void *)sub_19C18E518(a1);
  operator delete(v1);
}

void sub_19C239578(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  signed int v5;
  char *v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  char *v14;
  int64_t v15;
  char *v16;
  void *v17;
  int64_t v18;
  double *v19;
  void *v20;
  int64_t v21;
  char *v22;
  void *v23;
  int64_t v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  int v30;
  double *v31;
  double *v32;
  double *v33;
  int v34;
  char *v35;
  char *v36;
  char *v37;
  signed int v38;
  _BYTE *v39;
  _BYTE *v40;
  int v41;
  void *v42;
  _BYTE *v43;
  int v44;
  void *__p;
  _BYTE *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v5 = *((_DWORD *)a1 + 6);
  v49 = 0;
  v50 = 0;
  v48 = 0;
  if (v5)
  {
    if (v5 < 0)
      sub_19C07DA0C();
    v7 = (char *)operator new(8 * v5);
    bzero(v7, 8 * v5);
    v8 = 0;
    v9 = &v7[8 * v5];
    v10 = *a1;
    if (v5 < 4)
      goto LABEL_47;
    if ((unint64_t)&v7[-v10] < 0x20)
      goto LABEL_47;
    v11 = 0;
    v8 = v5 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = v8;
    do
    {
      v13 = *(_OWORD *)(v10 + v11 + 16);
      v14 = &v7[v11];
      *(_OWORD *)v14 = *(_OWORD *)(v10 + v11);
      *((_OWORD *)v14 + 1) = v13;
      v11 += 32;
      v12 -= 4;
    }
    while (v12);
    if (v8 != v5)
    {
LABEL_47:
      do
      {
        *(_QWORD *)&v7[8 * v8] = *(_QWORD *)(v10 + 8 * v8);
        ++v8;
      }
      while (v5 != v8);
    }
  }
  else
  {
    v9 = 0;
    v7 = 0;
  }
  sub_19C239948(a2, (uint64_t)&v42);
  v36 = 0;
  v37 = 0;
  v35 = 0;
  v15 = v9 - v7;
  if (v9 != v7)
  {
    if (v15 < 0)
      sub_19C07DA0C();
    v16 = (char *)operator new(v9 - v7);
    v35 = v16;
    v37 = &v16[8 * (v15 >> 3)];
    memcpy(v16, v7, v15);
    v36 = v37;
    v38 = v5;
    v32 = 0;
    v33 = 0;
    v31 = 0;
    v17 = v42;
    v18 = v43 - (_BYTE *)v42;
    if (v43 != v42)
      goto LABEL_14;
LABEL_17:
    v19 = 0;
    goto LABEL_18;
  }
  v16 = 0;
  v38 = v5;
  v32 = 0;
  v33 = 0;
  v31 = 0;
  v17 = v42;
  v18 = v43 - (_BYTE *)v42;
  if (v43 == v42)
    goto LABEL_17;
LABEL_14:
  if (v18 < 0)
    sub_19C07DA0C();
  v19 = (double *)operator new(v18);
  v31 = v19;
  v33 = &v19[v18 >> 3];
  memcpy(v19, v17, v18);
  v32 = v33;
LABEL_18:
  v34 = v44;
  v28 = 0;
  v29 = 0;
  v27 = 0;
  v20 = __p;
  v21 = v46 - (_BYTE *)__p;
  if (v46 == __p)
  {
    v22 = 0;
  }
  else
  {
    if (v21 < 0)
      sub_19C07DA0C();
    v22 = (char *)operator new(v46 - (_BYTE *)__p);
    v27 = v22;
    v29 = &v22[8 * (v21 >> 3)];
    memcpy(v22, v20, v21);
    v28 = v29;
  }
  v30 = v47;
  sub_19C239A8C((uint64_t)&v35, (const double **)&v31, (uint64_t)&v27, (uint64_t)&v39);
  if (v22)
  {
    v28 = v22;
    operator delete(v22);
  }
  if (v19)
  {
    v32 = v19;
    operator delete(v19);
  }
  if (v16)
  {
    v36 = v16;
    operator delete(v16);
  }
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  v23 = v39;
  v24 = v40 - v39;
  if (v40 != v39)
  {
    if (v24 < 0)
      sub_19C07DA0C();
    v25 = (char *)operator new(v40 - v39);
    *(_QWORD *)a3 = v25;
    v26 = &v25[8 * (v24 >> 3)];
    *(_QWORD *)(a3 + 16) = v26;
    memcpy(v25, v23, v24);
    *(_QWORD *)(a3 + 8) = v26;
  }
  *(_DWORD *)(a3 + 24) = v41;
  if (v23)
  {
    v40 = v23;
    operator delete(v23);
  }
  if (__p)
  {
    v46 = __p;
    operator delete(__p);
  }
  if (v42)
  {
    v43 = v42;
    operator delete(v42);
  }
  if (v7)
    operator delete(v7);
}

void sub_19C239880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v29 = v28;
  if (v29)
    operator delete(v29);
  if (v27)
    operator delete(v27);
  if (v26)
    operator delete(v26);
  sub_19C176E10((uint64_t)&a25);
  if (v25)
    operator delete(v25);
  _Unwind_Resume(a1);
}

void sub_19C23992C(void *a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 - 112);
  if (v3)
  {
    *(_QWORD *)(v1 - 104) = v3;
    operator delete(v3);
  }
  sub_19C07AF7C(a1);
}

void sub_19C239948(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  const void *v5;
  int64_t v6;
  char *v7;
  char *v8;
  _BYTE *v9;
  _BYTE *v10;
  int64_t v11;
  char *v12;
  char *v13;
  void *__p;
  void *v15;
  char *v16;
  int v17;
  void *v18;
  void *v19;
  char *v20;
  int v21;

  v18 = 0;
  v19 = 0;
  v20 = 0;
  v5 = *(const void **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v6 = v4 - *(_QWORD *)a1;
  if (v4 != *(_QWORD *)a1)
  {
    if (v6 < 0)
      sub_19C07DA0C();
    v7 = (char *)operator new(v4 - *(_QWORD *)a1);
    v8 = &v7[8 * (v6 >> 3)];
    v18 = v7;
    v20 = v8;
    memcpy(v7, v5, v6);
    v19 = v8;
  }
  v21 = *(_DWORD *)(a1 + 24);
  v15 = 0;
  v16 = 0;
  __p = 0;
  v10 = *(_BYTE **)(a1 + 32);
  v9 = *(_BYTE **)(a1 + 40);
  v11 = v9 - v10;
  if (v9 != v10)
  {
    if (v11 < 0)
      sub_19C07DA0C();
    v12 = (char *)operator new(v9 - v10);
    v13 = &v12[8 * (v11 >> 3)];
    __p = v12;
    v16 = v13;
    memcpy(v12, v10, v11);
    v15 = v13;
  }
  v17 = *(_DWORD *)(a1 + 56);
  sub_19C17D574(a2, (uint64_t)&v18, (uint64_t)&__p);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }
  if (v18)
  {
    v19 = v18;
    operator delete(v18);
  }
}

void sub_19C239A58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14)
{
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  _Unwind_Resume(exception_object);
}

void sub_19C239A8C(uint64_t a1@<X0>, const double **a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  float64x2_t *v9;
  int64_t v10;
  char *v11;
  char *v12;
  signed int v13;
  int64_t v14;
  char *v15;
  char *v16;
  int64_t v17;
  char *v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  __int128 v23;
  char *v24;
  uint64_t v25;
  size_t v26;
  void *v27;
  uint64_t v28;
  double *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  const void *v33;
  int64_t v34;
  char *v35;
  char *v36;
  signed int v37;
  int64_t v38;
  char *v39;
  float64x2_t *v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  __int128 v44;
  _OWORD *f64;
  uint64_t v46;
  float64x2_t *v47;
  float64x2_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  float64x2_t *v52;
  BOOL v54;
  float64x2_t *v56;
  float64x2_t *v57;
  float64x2_t *v58;
  uint64_t v59;
  float64x2_t v60;
  const double **v61;
  float64x2_t **v62;
  double __B;
  char *v64;
  char *v65;
  signed int v66;
  char *v67;
  char *v68;
  char *v69;
  signed int v70;
  std::random_device v71;
  __int128 v72;
  char v73;
  char *v74;
  char *v75;
  char *v76;
  signed int v77;
  char *v78;
  char *v79;
  char *v80;
  signed int v81;
  char *v82;
  char *v83;
  char *v84;
  signed int v85;

  v75 = 0;
  v76 = 0;
  v74 = 0;
  v9 = *(float64x2_t **)a3;
  v8 = *(_QWORD *)(a3 + 8);
  v10 = v8 - *(_QWORD *)a3;
  if (v8 == *(_QWORD *)a3)
  {
    v12 = 0;
    v11 = 0;
  }
  else
  {
    if (v10 < 0)
      sub_19C07DA0C();
    v11 = (char *)operator new(v8 - *(_QWORD *)a3);
    v12 = &v11[8 * (v10 >> 3)];
    v74 = v11;
    v76 = v12;
    memcpy(v11, v9, v10);
    v75 = v12;
  }
  v61 = a2;
  v62 = (float64x2_t **)a3;
  v13 = *(_DWORD *)(a3 + 24);
  v77 = v13;
  vDSP_vsubD(*a2, 1, (const double *)v11, 1, (double *)v11, 1, v13);
  v78 = 0;
  v79 = 0;
  v80 = 0;
  v14 = v12 - v11;
  if (v12 == v11)
  {
    v16 = 0;
    v15 = 0;
  }
  else
  {
    if (v14 < 0)
      sub_19C07DA0C();
    v15 = (char *)operator new(v12 - v11);
    v16 = &v15[8 * (v14 >> 3)];
    v78 = v15;
    v80 = v16;
    memcpy(v15, v11, v14);
    v79 = v16;
  }
  v81 = v13;
  __B = 10.0;
  vDSP_vsdivD((const double *)v15, 1, &__B, (double *)v15, 1, v13);
  v67 = 0;
  v68 = 0;
  v69 = 0;
  v17 = v16 - v15;
  if (v16 != v15)
  {
    if (v17 < 0)
      sub_19C07DA0C();
    v18 = (char *)operator new(v16 - v15);
    v67 = v18;
    v69 = &v18[8 * (v17 >> 3)];
    memcpy(v18, v15, v17);
    v68 = &v18[8 * (v17 >> 3)];
    v70 = v13;
    v83 = 0;
    v84 = 0;
    v82 = 0;
    if (!v13)
    {
      v19 = 0;
      v85 = 0;
      v68 = v18;
      operator delete(v18);
      if (!v15)
        goto LABEL_24;
LABEL_23:
      v79 = v15;
      operator delete(v15);
      goto LABEL_24;
    }
LABEL_15:
    if (v13 < 0)
      sub_19C07DA0C();
    v19 = (char *)operator new(8 * v13);
    v82 = v19;
    v84 = &v19[8 * v13];
    bzero(v19, 8 * v13);
    v83 = &v19[8 * v13];
    v85 = v13;
    if (v13 >= 4)
    {
      v21 = 0;
      v20 = v13 & 0xFFFFFFFFFFFFFFFCLL;
      v22 = v20;
      do
      {
        v23 = *(_OWORD *)&v18[v21 + 16];
        v24 = &v19[v21];
        *(_OWORD *)v24 = *(_OWORD *)&v18[v21];
        *((_OWORD *)v24 + 1) = v23;
        v21 += 32;
        v22 -= 4;
      }
      while (v22);
      if (v20 == v13)
      {
LABEL_22:
        v68 = v18;
        operator delete(v18);
        if (!v15)
          goto LABEL_24;
        goto LABEL_23;
      }
    }
    else
    {
      v20 = 0;
    }
    do
    {
      *(_QWORD *)&v19[8 * v20] = *(_QWORD *)&v18[8 * v20];
      ++v20;
    }
    while (v13 != v20);
    goto LABEL_22;
  }
  v18 = 0;
  v70 = v13;
  v83 = 0;
  v84 = 0;
  v82 = 0;
  if (v13)
    goto LABEL_15;
  v19 = 0;
  v85 = 0;
  if (v15)
    goto LABEL_23;
LABEL_24:
  if (v11)
  {
    v75 = v11;
    operator delete(v11);
  }
  v25 = *(int *)(a1 + 24);
  v67 = 0;
  v68 = 0;
  v69 = 0;
  if ((_DWORD)v25)
  {
    if ((v25 & 0x80000000) != 0)
      sub_19C07DA0C();
    v26 = 8 * v25;
    v27 = operator new(8 * v25);
    bzero(v27, v26);
  }
  else
  {
    v27 = 0;
  }
  bzero(&v67, 0x9F0uLL);
  sub_19C17ACE4((uint64_t)&v67);
  v72 = xmmword_19C277720;
  v73 = 0;
  v28 = *(unsigned int *)(a1 + 24);
  if ((int)v28 >= 1)
  {
    v29 = (double *)v27;
    v30 = (uint64_t *)v19;
    do
    {
      v31 = *v30;
      *(_QWORD *)&v72 = 0;
      *((_QWORD *)&v72 + 1) = v31;
      v73 = 0;
      *v29++ = sub_19C17CECC((uint64_t)&v72, (uint64_t)&v67, (double *)&v72);
      ++v30;
      --v28;
    }
    while (v28);
  }
  v33 = *(const void **)a1;
  v32 = *(_QWORD *)(a1 + 8);
  v34 = v32 - *(_QWORD *)a1;
  if (v32 == *(_QWORD *)a1)
  {
    v36 = 0;
    v35 = 0;
  }
  else
  {
    if (v34 < 0)
      sub_19C07DA0C();
    v35 = (char *)operator new(v32 - *(_QWORD *)a1);
    v36 = &v35[8 * (v34 >> 3)];
    memcpy(v35, v33, v34);
  }
  v37 = *(_DWORD *)(a1 + 24);
  vDSP_vaddD((const double *)v35, 1, (const double *)v27, 1, (double *)v35, 1, v37);
  __B = 0.0;
  v64 = 0;
  v65 = 0;
  v38 = v36 - v35;
  if (v36 != v35)
  {
    if (v38 < 0)
      sub_19C07DA0C();
    v39 = (char *)operator new(v36 - v35);
    *(_QWORD *)&__B = v39;
    v65 = &v39[8 * (v38 >> 3)];
    memcpy(v39, v35, v38);
    v64 = &v39[8 * (v38 >> 3)];
    v66 = v37;
    *(_QWORD *)(a4 + 8) = 0;
    *(_QWORD *)(a4 + 16) = 0;
    *(_QWORD *)a4 = 0;
    if (!v37)
    {
      v40 = 0;
      *(_DWORD *)(a4 + 24) = 0;
      v64 = v39;
      operator delete(v39);
      if (!v35)
        goto LABEL_52;
LABEL_51:
      operator delete(v35);
      goto LABEL_52;
    }
LABEL_43:
    if (v37 < 0)
      sub_19C07DA0C();
    v40 = (float64x2_t *)operator new(8 * v37);
    *(_QWORD *)a4 = v40;
    *(_QWORD *)(a4 + 16) = (char *)v40 + 8 * v37;
    bzero(v40, 8 * v37);
    *(_QWORD *)(a4 + 8) = (char *)v40 + 8 * v37;
    *(_DWORD *)(a4 + 24) = v37;
    if (v37 >= 4)
    {
      v42 = 0;
      v41 = v37 & 0xFFFFFFFFFFFFFFFCLL;
      v43 = v41;
      do
      {
        v44 = *(_OWORD *)&v39[v42 * 16 + 16];
        f64 = (_OWORD *)v40[v42].f64;
        *f64 = *(_OWORD *)&v39[v42 * 16];
        f64[1] = v44;
        v42 += 2;
        v43 -= 4;
      }
      while (v43);
      if (v41 == v37)
      {
LABEL_50:
        v64 = v39;
        operator delete(v39);
        if (!v35)
          goto LABEL_52;
        goto LABEL_51;
      }
    }
    else
    {
      v41 = 0;
    }
    do
    {
      v40->f64[v41] = *(float64_t *)&v39[8 * v41];
      ++v41;
    }
    while (v37 != v41);
    goto LABEL_50;
  }
  v39 = 0;
  v66 = v37;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = 0;
  if (v37)
    goto LABEL_43;
  v40 = 0;
  *(_DWORD *)(a4 + 24) = 0;
  if (v35)
    goto LABEL_51;
LABEL_52:
  v46 = *(unsigned int *)(a1 + 24);
  if ((int)v46 < 1)
    goto LABEL_57;
  v47 = (float64x2_t *)*v61;
  v48 = *v62;
  if (v46 < 6)
  {
    v49 = 0;
LABEL_55:
    v50 = v46 - v49;
    v51 = v49 << 32;
    do
    {
      *(double *)((char *)v40->f64 + (v51 >> 29)) = fmax(fmin(*(double *)((char *)v48->f64 + (v51 >> 29)), *(double *)((char *)v40->f64 + (v51 >> 29))), *(double *)((char *)v47->f64 + (v51 >> 29)));
      v51 += 0x100000000;
      --v50;
    }
    while (v50);
    goto LABEL_57;
  }
  v49 = 0;
  v52 = (float64x2_t *)((char *)v40 + 8 * v46);
  v54 = v40 < (float64x2_t *)&v48->f64[v46] && v48 < v52;
  if (v47 < v52 && v40 < (float64x2_t *)&v47->f64[v46])
    goto LABEL_55;
  if (v54)
    goto LABEL_55;
  v49 = v46 & 0x7FFFFFFC;
  v56 = v48 + 1;
  v57 = v47 + 1;
  v58 = v40 + 1;
  v59 = v46 & 0xFFFFFFFC;
  do
  {
    v60 = vmaxnmq_f64(vminnmq_f64(*v56, *v58), *v57);
    v58[-1] = vmaxnmq_f64(vminnmq_f64(v56[-1], v58[-1]), v57[-1]);
    *v58 = v60;
    v56 += 2;
    v57 += 2;
    v58 += 2;
    v59 -= 4;
  }
  while (v59);
  if (v49 != v46)
    goto LABEL_55;
LABEL_57:
  std::random_device::~random_device(&v71);
  if (v27)
    operator delete(v27);
  if (v19)
  {
    v83 = v19;
    operator delete(v19);
  }
}

void sub_19C23A0D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21)
{
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;

  if (v23)
    operator delete(v23);
  std::random_device::~random_device((std::random_device *)&STACK[0xA20]);
  if (v22)
    operator delete(v22);
  if (v21)
  {
    *(_QWORD *)(v24 - 112) = v21;
    operator delete(v21);
  }
  _Unwind_Resume(a1);
}

void sub_19C23A200(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  int64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t *v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  char *v22;
  void *v23;
  int64_t v24;
  double *v25;
  void *v26;
  int64_t v27;
  char *v28;
  uint64_t v29;
  float64x2_t *v30;
  uint64_t v31;
  char *v32;
  float64x2_t *v33;
  float64x2_t *v34;
  uint64_t v35;
  float64x2_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  float64x2_t *v43;
  int32x4_t v44;
  int32x4_t v45;
  int32x4_t *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  int v53;
  double *v54;
  double *v55;
  double *v56;
  int v57;
  char *v58;
  char *v59;
  char *v60;
  int v61;
  void *__p[3];
  unsigned int v63;
  void *v64;
  _BYTE *v65;
  int v66;
  void *v67;
  _BYTE *v68;
  int v69;
  char *v70;
  char *v71;
  char *v72;
  int v73;

  v5 = *((unsigned int *)a1 + 6);
  v71 = 0;
  v72 = 0;
  v70 = 0;
  if (!(_DWORD)v5)
  {
    v8 = 0;
    v7 = 0;
    v73 = 0;
    goto LABEL_11;
  }
  if ((v5 & 0x80000000) != 0)
    sub_19C07DA0C();
  v7 = (char *)operator new(8 * (int)v5);
  v70 = v7;
  v72 = &v7[8 * (int)v5];
  bzero(v7, 8 * (int)v5);
  v8 = v72;
  v71 = v72;
  v73 = v5;
  v9 = *a1;
  if (v5 < 8)
  {
    v10 = 0;
LABEL_9:
    v19 = v5 - v10;
    v20 = v10 << 32;
    do
    {
      *(double *)&v7[v20 >> 29] = (double)*(int *)(v9 + (v20 >> 30));
      v20 += 0x100000000;
      --v19;
    }
    while (v19);
    goto LABEL_11;
  }
  v11 = 0;
  v10 = v5 & 0xFFFFFFF8;
  v12 = v9 + 16;
  do
  {
    v13 = *(_OWORD *)(v12 - 16);
    v14.i64[0] = (int)v13;
    v14.i64[1] = SDWORD1(v13);
    v15 = vcvtq_f64_s64(v14);
    v14.i64[0] = SDWORD2(v13);
    v14.i64[1] = SHIDWORD(v13);
    v16 = vcvtq_f64_s64(v14);
    v14.i64[0] = (int)*(_OWORD *)v12;
    v14.i64[1] = (int)HIDWORD(*(_QWORD *)v12);
    v17 = vcvtq_f64_s64(v14);
    v14.i64[0] = (int)*(_QWORD *)(v12 + 8);
    v14.i64[1] = (int)HIDWORD(*(_OWORD *)v12);
    v18 = (float64x2_t *)&v7[v11];
    *v18 = v15;
    v18[1] = v16;
    v18[2] = v17;
    v18[3] = vcvtq_f64_s64(v14);
    v11 += 64;
    v12 += 32;
  }
  while (((8 * v5) & 0x7FFFFFFC0) != v11);
  if (v10 != v5)
    goto LABEL_9;
LABEL_11:
  sub_19C23A79C(a2, (uint64_t)&v64);
  v59 = 0;
  v60 = 0;
  v58 = 0;
  v21 = v8 - v7;
  if (v8 != v7)
  {
    if (v21 < 0)
      sub_19C07DA0C();
    v22 = (char *)operator new(v8 - v7);
    v58 = v22;
    v60 = &v22[8 * (v21 >> 3)];
    memcpy(v22, v7, v21);
    v59 = v60;
    v61 = v5;
    v55 = 0;
    v56 = 0;
    v54 = 0;
    v23 = v64;
    v24 = v65 - (_BYTE *)v64;
    if (v65 != v64)
      goto LABEL_14;
LABEL_17:
    v25 = 0;
    goto LABEL_18;
  }
  v22 = 0;
  v61 = v5;
  v55 = 0;
  v56 = 0;
  v54 = 0;
  v23 = v64;
  v24 = v65 - (_BYTE *)v64;
  if (v65 == v64)
    goto LABEL_17;
LABEL_14:
  if (v24 < 0)
    sub_19C07DA0C();
  v25 = (double *)operator new(v24);
  v54 = v25;
  v56 = &v25[v24 >> 3];
  memcpy(v25, v23, v24);
  v55 = v56;
LABEL_18:
  v57 = v66;
  v51 = 0;
  v52 = 0;
  v50 = 0;
  v26 = v67;
  v27 = v68 - (_BYTE *)v67;
  if (v68 == v67)
  {
    v28 = 0;
  }
  else
  {
    if (v27 < 0)
      sub_19C07DA0C();
    v28 = (char *)operator new(v68 - (_BYTE *)v67);
    v50 = v28;
    v52 = &v28[8 * (v27 >> 3)];
    memcpy(v28, v26, v27);
    v51 = v52;
  }
  v53 = v69;
  sub_19C239A8C((uint64_t)&v58, (const double **)&v54, (uint64_t)&v50, (uint64_t)__p);
  if (v28)
  {
    v51 = v28;
    operator delete(v28);
  }
  if (v25)
  {
    v55 = v25;
    operator delete(v25);
  }
  if (v22)
  {
    v59 = v22;
    operator delete(v22);
  }
  v29 = v63;
  if (v63)
  {
    if ((v63 & 0x80000000) != 0)
      sub_19C07DA0C();
    v30 = (float64x2_t *)operator new(8 * (int)v63);
    bzero(v30, 8 * (int)v29);
    v31 = 0;
    v32 = (char *)__p[0];
    if (v29 < 8)
      goto LABEL_35;
    if ((unint64_t)((char *)v30 - (char *)__p[0]) < 0x20)
      goto LABEL_35;
    v31 = v29 & 0xFFFFFFFC;
    v33 = v30 + 1;
    v34 = (float64x2_t *)((char *)__p[0] + 16);
    v35 = v31;
    do
    {
      v36 = vrndaq_f64(*v34);
      v33[-1] = vrndaq_f64(v34[-1]);
      *v33 = v36;
      v33 += 2;
      v34 += 2;
      v35 -= 4;
    }
    while (v35);
    if (v31 != v29)
    {
LABEL_35:
      v37 = v29 - v31;
      v38 = v31 << 32;
      do
      {
        *(double *)((char *)v30->f64 + (v38 >> 29)) = round(*(double *)&v32[v38 >> 29]);
        v38 += 0x100000000;
        --v37;
      }
      while (v37);
    }
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    v39 = (char *)operator new(4 * (int)v29);
    *(_QWORD *)a3 = v39;
    *(_QWORD *)(a3 + 16) = &v39[4 * (int)v29];
    bzero(v39, 4 * (int)v29);
    *(_QWORD *)(a3 + 8) = &v39[4 * (int)v29];
    *(_DWORD *)(a3 + 24) = v29;
    if (v29 < 8 == v29 < 0x80000001)
    {
      v41 = 0;
    }
    else
    {
      v40 = 0;
      v41 = v29 & 0xFFFFFFF8;
      v42 = v41;
      do
      {
        v43 = (float64x2_t *)((char *)v30 + (v40 >> 29));
        v44 = vuzp1q_s32((int32x4_t)vcvtq_s64_f64(*v43), (int32x4_t)vcvtq_s64_f64(v43[1]));
        v45 = vuzp1q_s32((int32x4_t)vcvtq_s64_f64(v43[2]), (int32x4_t)vcvtq_s64_f64(v43[3]));
        v46 = (int32x4_t *)&v39[v40 >> 30];
        *v46 = v44;
        v46[1] = v45;
        v40 += 0x800000000;
        v42 -= 8;
      }
      while (v42);
      if (v41 == v29)
      {
LABEL_47:
        operator delete(v30);
        v47 = __p[0];
        if (!__p[0])
          goto LABEL_49;
        goto LABEL_48;
      }
    }
    v48 = v29 - v41;
    v49 = v41 << 32;
    do
    {
      *(_DWORD *)&v39[v49 >> 30] = (int)*(double *)((char *)v30->f64 + (v49 >> 29));
      v49 += 0x100000000;
      --v48;
    }
    while (v48);
    goto LABEL_47;
  }
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_DWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  v47 = __p[0];
  if (__p[0])
  {
LABEL_48:
    __p[1] = v47;
    operator delete(v47);
  }
LABEL_49:
  if (v67)
  {
    v68 = v67;
    operator delete(v67);
  }
  if (v64)
  {
    v65 = v64;
    operator delete(v64);
  }
  if (v7)
    operator delete(v7);
}

void sub_19C23A6D0(void *a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  sub_19C07AF7C(a1);
}

void sub_19C23A79C(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  float64x2_t *v5;
  uint64_t v6;
  uint64_t v7;
  float64x2_t *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  int64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float64x2_t *v19;
  uint64_t v20;
  uint64_t v21;
  float64x2_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  int64x2_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  uint64_t v30;
  uint64_t v31;
  void *__p;
  void *v33;
  char *v34;
  int v35;
  void *v36;
  void *v37;
  char *v38;
  int v39;

  v4 = *((unsigned int *)a1 + 6);
  v37 = 0;
  v38 = 0;
  v36 = 0;
  if (!(_DWORD)v4)
  {
    v39 = 0;
    goto LABEL_11;
  }
  if ((v4 & 0x80000000) != 0)
    sub_19C07DA0C();
  v5 = (float64x2_t *)operator new(8 * (int)v4);
  v36 = v5;
  v38 = (char *)&v5->f64[(int)v4];
  bzero(v5, 8 * (int)v4);
  v37 = v38;
  v39 = v4;
  v6 = *a1;
  if (v4 < 8)
  {
    v7 = 0;
LABEL_9:
    v16 = v4 - v7;
    v17 = v7 << 32;
    do
    {
      *(double *)((char *)v5->f64 + (v17 >> 29)) = (double)*(int *)(v6 + (v17 >> 30));
      v17 += 0x100000000;
      --v16;
    }
    while (v16);
    goto LABEL_11;
  }
  v7 = v4 & 0xFFFFFFF8;
  v8 = v5 + 2;
  v9 = v6 + 16;
  v10 = v7;
  do
  {
    v11 = *(_OWORD *)(v9 - 16);
    v12.i64[0] = (int)v11;
    v12.i64[1] = SDWORD1(v11);
    v13 = vcvtq_f64_s64(v12);
    v12.i64[0] = SDWORD2(v11);
    v12.i64[1] = SHIDWORD(v11);
    v14 = vcvtq_f64_s64(v12);
    v12.i64[0] = (int)*(_OWORD *)v9;
    v12.i64[1] = (int)HIDWORD(*(_QWORD *)v9);
    v15 = vcvtq_f64_s64(v12);
    v12.i64[0] = (int)*(_QWORD *)(v9 + 8);
    v12.i64[1] = (int)HIDWORD(*(_OWORD *)v9);
    v8[-2] = v13;
    v8[-1] = v14;
    *v8 = v15;
    v8[1] = vcvtq_f64_s64(v12);
    v8 += 4;
    v9 += 32;
    v10 -= 8;
  }
  while (v10);
  if (v7 != v4)
    goto LABEL_9;
LABEL_11:
  v18 = *((unsigned int *)a1 + 14);
  v33 = 0;
  v34 = 0;
  __p = 0;
  if (!(_DWORD)v18)
  {
    v35 = 0;
    goto LABEL_21;
  }
  if ((v18 & 0x80000000) != 0)
    sub_19C07DA0C();
  v19 = (float64x2_t *)operator new(8 * (int)v18);
  __p = v19;
  v34 = (char *)&v19->f64[(int)v18];
  bzero(v19, 8 * (int)v18);
  v33 = v34;
  v35 = v18;
  v20 = a1[4];
  if (v18 < 8)
  {
    v21 = 0;
LABEL_19:
    v30 = v18 - v21;
    v31 = v21 << 32;
    do
    {
      *(double *)((char *)v19->f64 + (v31 >> 29)) = (double)*(int *)(v20 + (v31 >> 30));
      v31 += 0x100000000;
      --v30;
    }
    while (v30);
    goto LABEL_21;
  }
  v21 = v18 & 0xFFFFFFF8;
  v22 = v19 + 2;
  v23 = v20 + 16;
  v24 = v21;
  do
  {
    v25 = *(_OWORD *)(v23 - 16);
    v26.i64[0] = (int)v25;
    v26.i64[1] = SDWORD1(v25);
    v27 = vcvtq_f64_s64(v26);
    v26.i64[0] = SDWORD2(v25);
    v26.i64[1] = SHIDWORD(v25);
    v28 = vcvtq_f64_s64(v26);
    v26.i64[0] = (int)*(_OWORD *)v23;
    v26.i64[1] = (int)HIDWORD(*(_QWORD *)v23);
    v29 = vcvtq_f64_s64(v26);
    v26.i64[0] = (int)*(_QWORD *)(v23 + 8);
    v26.i64[1] = (int)HIDWORD(*(_OWORD *)v23);
    v22[-2] = v27;
    v22[-1] = v28;
    *v22 = v29;
    v22[1] = vcvtq_f64_s64(v26);
    v22 += 4;
    v23 += 32;
    v24 -= 8;
  }
  while (v24);
  if (v21 != v18)
    goto LABEL_19;
LABEL_21:
  sub_19C17D574(a2, (uint64_t)&v36, (uint64_t)&__p);
  if (__p)
  {
    v33 = __p;
    operator delete(__p);
  }
  if (v36)
  {
    v37 = v36;
    operator delete(v36);
  }
}

void sub_19C23A9E4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  if (__p)
    operator delete(__p);
  sub_19C07AF7C(a1);
}

void sub_19C23AA14(uint64_t a1)
{
  void (*v2)(_QWORD);
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (a1)
  {
    v2 = *(void (**)(_QWORD))(a1 + 88);
    if (v2)
    {
      v2(*(_QWORD *)(a1 + 16));
      if (*(_DWORD *)(a1 + 56))
      {
        v3 = 0;
        v4 = 32;
        do
        {
          v2(*(_QWORD *)(*(_QWORD *)(a1 + 64) + v4));
          ++v3;
          v4 += 48;
        }
        while (v3 < *(unsigned int *)(a1 + 56));
      }
      if (*(_DWORD *)(a1 + 72))
      {
        v5 = 0;
        v6 = 32;
        do
        {
          v2(*(_QWORD *)(*(_QWORD *)(a1 + 80) + v6));
          ++v5;
          v6 += 48;
        }
        while (v5 < *(unsigned int *)(a1 + 72));
      }
    }
    if (*(_DWORD *)(a1 + 56))
    {
      v7 = 0;
      v8 = 40;
      do
      {
        free(*(void **)(*(_QWORD *)(a1 + 64) + v8));
        ++v7;
        v8 += 48;
      }
      while (v7 < *(unsigned int *)(a1 + 56));
    }
    if (*(_DWORD *)(a1 + 72))
    {
      v9 = 0;
      v10 = 40;
      do
      {
        free(*(void **)(*(_QWORD *)(a1 + 80) + v10));
        ++v9;
        v10 += 48;
      }
      while (v9 < *(unsigned int *)(a1 + 72));
    }
    free(*(void **)(a1 + 40));
    free(*(void **)(a1 + 48));
    free(*(void **)(a1 + 136));
    free(*(void **)(a1 + 144));
    free(*(void **)(a1 + 64));
    free(*(void **)(a1 + 80));
    sub_19C23AA14(*(_QWORD *)(a1 + 184));
    free(*(void **)(a1 + 200));
    free(*(void **)(a1 + 216));
    free(*(void **)(a1 + 224));
    free((void *)a1);
  }
}

uint64_t sub_19C23AB64(unsigned int a1, unsigned int a2)
{
  char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  double v11;
  unint64_t v13;
  uint64_t v14;
  double v15;
  void *v16;
  uint64_t v17;

  if (a1 > 0x2B)
    return 0;
  v4 = (char *)malloc_type_malloc(0xE8uLL, 0x10B00408DE4A9E8uLL);
  v5 = (uint64_t)v4;
  if (!v4)
    return v5;
  *(_DWORD *)v4 = a1;
  *((_DWORD *)v4 + 1) = a2;
  *(_OWORD *)(v4 + 40) = 0u;
  *((_QWORD *)v4 + 2) = 0;
  *((_QWORD *)v4 + 3) = 0;
  *((_QWORD *)v4 + 1) = 0;
  *((_DWORD *)v4 + 8) = 0;
  *(_OWORD *)(v4 + 56) = 0u;
  *(_OWORD *)(v4 + 72) = 0u;
  *(_OWORD *)(v4 + 88) = 0u;
  *((_QWORD *)v4 + 13) = 0xFFF0000000000000;
  *((_DWORD *)v4 + 52) = 0;
  *((_QWORD *)v4 + 25) = 0;
  *((_OWORD *)v4 + 7) = 0u;
  *((_OWORD *)v4 + 8) = 0u;
  *((_OWORD *)v4 + 9) = 0u;
  *(_OWORD *)(v4 + 156) = 0u;
  *((_QWORD *)v4 + 22) = 0;
  *((_QWORD *)v4 + 23) = 0;
  *((_DWORD *)v4 + 48) = 0;
  *((_QWORD *)v4 + 27) = 0;
  *((_QWORD *)v4 + 28) = 0;
  if (!a2)
    return v5;
  v6 = malloc_type_calloc(a2, 8uLL, 0x100004000313F17uLL);
  *(_QWORD *)(v5 + 40) = v6;
  if (!v6
    || (v7 = malloc_type_calloc(a2, 8uLL, 0x100004000313F17uLL), (*(_QWORD *)(v5 + 48) = v7) == 0)
    || (v8 = malloc_type_calloc(a2, 8uLL, 0x100004000313F17uLL), (*(_QWORD *)(v5 + 136) = v8) == 0))
  {
    sub_19C23AA14(v5);
    return 0;
  }
  free(*(void **)(v5 + 224));
  *(_QWORD *)(v5 + 224) = 0;
  if (*(_DWORD *)(v5 + 4))
  {
    v9 = 0;
    do
    {
      v10 = *(_QWORD *)(v5 + 48);
      *(_QWORD *)(*(_QWORD *)(v5 + 40) + 8 * v9) = 0xFFF0000000000000;
      v11 = *(double *)(v10 + 8 * v9);
      if (v11 > -INFINITY && sub_19C16E8D0(v11))
        *(_QWORD *)(*(_QWORD *)(v5 + 40) + 8 * v9) = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v9);
      ++v9;
    }
    while (v9 < *(unsigned int *)(v5 + 4));
    free(*(void **)(v5 + 224));
    *(_QWORD *)(v5 + 224) = 0;
    if (*(_DWORD *)(v5 + 4))
      goto LABEL_17;
LABEL_24:
    v16 = 0;
    goto LABEL_25;
  }
  free(0);
  *(_QWORD *)(v5 + 224) = 0;
  if (!*(_DWORD *)(v5 + 4))
    goto LABEL_24;
LABEL_17:
  v13 = 0;
  do
  {
    v14 = *(_QWORD *)(v5 + 40);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v13) = 0x7FF0000000000000;
    v15 = *(double *)(v14 + 8 * v13);
    if (v15 < INFINITY && sub_19C16E8D0(v15))
      *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v13) = *(_QWORD *)(*(_QWORD *)(v5 + 40) + 8 * v13);
    ++v13;
  }
  while (v13 < *(unsigned int *)(v5 + 4));
  v16 = *(void **)(v5 + 224);
LABEL_25:
  free(v16);
  *(_QWORD *)(v5 + 224) = 0;
  v17 = *(unsigned int *)(v5 + 4);
  if (!(_DWORD)v17)
    return v5;
  bzero(*(void **)(v5 + 136), 8 * v17);
  return v5;
}

uint64_t sub_19C23ADA0(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void **v15;
  void **v16;
  uint64_t (*v17)(void);
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t i;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t j;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;

  if (!a1)
    return 0;
  v2 = (char *)malloc_type_malloc(0xE8uLL, 0x10B00408DE4A9E8uLL);
  v3 = (uint64_t)v2;
  v4 = *(_OWORD *)(a1 + 96);
  v5 = *(_OWORD *)(a1 + 112);
  v6 = *(_OWORD *)(a1 + 144);
  *((_OWORD *)v2 + 8) = *(_OWORD *)(a1 + 128);
  v7 = *(_OWORD *)(a1 + 80);
  v9 = *(_OWORD *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 48);
  *((_OWORD *)v2 + 4) = *(_OWORD *)(a1 + 64);
  *((_OWORD *)v2 + 5) = v7;
  *((_OWORD *)v2 + 2) = v9;
  *((_OWORD *)v2 + 3) = v8;
  v10 = *(_QWORD *)(a1 + 208);
  v11 = *(_OWORD *)(a1 + 160);
  v12 = *(_OWORD *)(a1 + 176);
  v13 = *(_OWORD *)(a1 + 192);
  *((_OWORD *)v2 + 9) = v6;
  *((_OWORD *)v2 + 11) = v12;
  *((_OWORD *)v2 + 12) = v13;
  v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)v2 = *(_OWORD *)a1;
  *((_OWORD *)v2 + 1) = v14;
  *((_OWORD *)v2 + 6) = v4;
  *((_OWORD *)v2 + 7) = v5;
  *((_OWORD *)v2 + 10) = v11;
  *((_QWORD *)v2 + 25) = 0;
  *((_QWORD *)v2 + 26) = v10;
  *((_QWORD *)v2 + 17) = 0;
  v15 = (void **)(v2 + 136);
  *((_QWORD *)v2 + 5) = 0;
  v16 = (void **)(v2 + 40);
  *((_QWORD *)v2 + 10) = 0;
  *((_QWORD *)v2 + 8) = 0;
  *((_DWORD *)v2 + 19) = 0;
  *((_DWORD *)v2 + 15) = 0;
  *((_QWORD *)v2 + 6) = 0;
  *((_QWORD *)v2 + 18) = 0;
  *((_QWORD *)v2 + 22) = 0;
  *((_QWORD *)v2 + 23) = 0;
  *((_QWORD *)v2 + 27) = 0;
  *((_QWORD *)v2 + 28) = 0;
  v17 = (uint64_t (*)(void))*((_QWORD *)v2 + 12);
  if (v17)
  {
    if (*((_QWORD *)v2 + 2))
    {
      v18 = v17();
      *(_QWORD *)(v3 + 16) = v18;
      if (!v18)
        goto LABEL_65;
    }
  }
  v19 = *(unsigned int *)(a1 + 4);
  if ((_DWORD)v19)
  {
    *v16 = malloc_type_malloc(8 * v19, 0x100004000313F17uLL);
    if (!*(_QWORD *)(a1 + 40))
      goto LABEL_65;
    *(_QWORD *)(v3 + 48) = malloc_type_malloc(8 * *(unsigned int *)(a1 + 4), 0x100004000313F17uLL);
    if (!*(_QWORD *)(a1 + 48))
      goto LABEL_65;
    *v15 = malloc_type_malloc(8 * *(unsigned int *)(a1 + 4), 0x100004000313F17uLL);
    if (!*(_QWORD *)(a1 + 136))
      goto LABEL_65;
    if (*(_QWORD *)(a1 + 144))
    {
      v20 = malloc_type_malloc(8 * *(unsigned int *)(a1 + 4), 0x100004000313F17uLL);
      *(_QWORD *)(v3 + 144) = v20;
      v21 = *(const void **)(a1 + 144);
      if (!v21)
        goto LABEL_65;
      memcpy(v20, v21, 8 * *(unsigned int *)(a1 + 4));
    }
    memcpy(*(void **)(v3 + 40), *(const void **)(a1 + 40), 8 * *(unsigned int *)(a1 + 4));
    memcpy(*(void **)(v3 + 48), *(const void **)(a1 + 48), 8 * *(unsigned int *)(a1 + 4));
    memcpy(*(void **)(v3 + 136), *(const void **)(a1 + 136), 8 * *(unsigned int *)(a1 + 4));
  }
  v22 = *(unsigned int *)(a1 + 56);
  if ((_DWORD)v22)
  {
    *(_DWORD *)(v3 + 60) = v22;
    v23 = malloc_type_malloc(48 * v22, 0x1080040FAB287DEuLL);
    *(_QWORD *)(v3 + 64) = v23;
    if (!v23)
      goto LABEL_65;
    memcpy(v23, *(const void **)(a1 + 64), 48 * *(unsigned int *)(a1 + 56));
    v24 = *(unsigned int *)(a1 + 56);
    if ((_DWORD)v24)
    {
      v25 = *(_QWORD *)(v3 + 64);
      if (v24 == 1)
      {
        v26 = 0;
      }
      else
      {
        v26 = v24 & 0xFFFFFFFE;
        v27 = (_QWORD *)(v25 + 88);
        v28 = v26;
        do
        {
          *(v27 - 6) = 0;
          *v27 = 0;
          v27 += 12;
          v28 -= 2;
        }
        while (v28);
        if (v26 == v24)
          goto LABEL_23;
      }
      v29 = (_QWORD *)(v25 + 48 * v26 + 40);
      v30 = v24 - v26;
      do
      {
        *v29 = 0;
        v29 += 6;
        --v30;
      }
      while (v30);
LABEL_23:
      if (v17)
      {
        v31 = 0;
        v32 = *(_QWORD *)(v3 + 64);
        v33 = 32;
        do
        {
          if (*(_QWORD *)(v32 + v33))
          {
            v34 = v17();
            v32 = *(_QWORD *)(v3 + 64);
            *(_QWORD *)(v32 + v33) = v34;
            if (!v34)
              goto LABEL_65;
            v24 = *(unsigned int *)(a1 + 56);
          }
          ++v31;
          v33 += 48;
        }
        while (v31 < v24);
      }
      if (v24)
      {
        v35 = 0;
        for (i = 0; i < v24; ++i)
        {
          if (*(_QWORD *)(*(_QWORD *)(a1 + 64) + v35 + 40))
          {
            v37 = malloc_type_malloc(8 * *(unsigned int *)(*(_QWORD *)(v3 + 64) + v35), 0x100004000313F17uLL);
            v38 = *(_QWORD *)(v3 + 64);
            *(_QWORD *)(v38 + v35 + 40) = v37;
            if (!v37)
              goto LABEL_65;
            memcpy(v37, *(const void **)(*(_QWORD *)(a1 + 64) + v35 + 40), 8 * *(unsigned int *)(v38 + v35));
            v24 = *(unsigned int *)(a1 + 56);
          }
          v35 += 48;
        }
      }
    }
  }
  v39 = *(unsigned int *)(a1 + 72);
  if (!(_DWORD)v39)
    goto LABEL_59;
  *(_DWORD *)(v3 + 76) = v39;
  v40 = malloc_type_malloc(48 * v39, 0x1080040FAB287DEuLL);
  *(_QWORD *)(v3 + 80) = v40;
  if (v40)
  {
    memcpy(v40, *(const void **)(a1 + 80), 48 * *(unsigned int *)(a1 + 72));
    v41 = *(unsigned int *)(a1 + 72);
    if (!(_DWORD)v41)
      goto LABEL_59;
    v42 = *(_QWORD *)(v3 + 80);
    if (v41 == 1)
    {
      v43 = 0;
    }
    else
    {
      v43 = v41 & 0xFFFFFFFE;
      v44 = (_QWORD *)(v42 + 88);
      v45 = v43;
      do
      {
        *(v44 - 6) = 0;
        *v44 = 0;
        v44 += 12;
        v45 -= 2;
      }
      while (v45);
      if (v43 == v41)
        goto LABEL_45;
    }
    v46 = (_QWORD *)(v42 + 48 * v43 + 40);
    v47 = v41 - v43;
    do
    {
      *v46 = 0;
      v46 += 6;
      --v47;
    }
    while (v47);
LABEL_45:
    if (v17)
    {
      v48 = 0;
      v49 = *(_QWORD *)(v3 + 80);
      v50 = 32;
      do
      {
        if (*(_QWORD *)(v49 + v50))
        {
          v51 = v17();
          v49 = *(_QWORD *)(v3 + 80);
          *(_QWORD *)(v49 + v50) = v51;
          if (!v51)
            goto LABEL_65;
          v41 = *(unsigned int *)(a1 + 72);
        }
        ++v48;
        v50 += 48;
      }
      while (v48 < v41);
    }
    if (v41)
    {
      v52 = 0;
      for (j = 0; j < v41; ++j)
      {
        if (*(_QWORD *)(*(_QWORD *)(a1 + 80) + v52 + 40))
        {
          v54 = malloc_type_malloc(8 * *(unsigned int *)(*(_QWORD *)(v3 + 80) + v52), 0x100004000313F17uLL);
          v55 = *(_QWORD *)(v3 + 80);
          *(_QWORD *)(v55 + v52 + 40) = v54;
          if (!v54)
            goto LABEL_65;
          memcpy(v54, *(const void **)(*(_QWORD *)(a1 + 80) + v52 + 40), 8 * *(unsigned int *)(v55 + v52));
          v41 = *(unsigned int *)(a1 + 72);
        }
        v52 += 48;
      }
    }
LABEL_59:
    if (!*(_QWORD *)(a1 + 184) || (v56 = sub_19C23ADA0(), (*(_QWORD *)(v3 + 184) = v56) != 0))
    {
      if (!*(_QWORD *)(a1 + 200))
        return v3;
      v57 = malloc_type_malloc(8 * *(unsigned int *)(a1 + 4), 0x100004000313F17uLL);
      *(_QWORD *)(v3 + 200) = v57;
      if (v57)
      {
        memcpy(v57, *(const void **)(a1 + 200), 8 * *(unsigned int *)(a1 + 4));
        return v3;
      }
    }
  }
LABEL_65:
  *(_QWORD *)(v3 + 88) = 0;
  sub_19C23AA14(v3);
  return 0;
}

void sub_19C23B2B4(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)(a1 + 224));
    *(_QWORD *)(a1 + 224) = 0;
  }
}

uint64_t sub_19C23B2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v6)(_QWORD);

  if (!a1)
    return 4294967294;
  free(*(void **)(a1 + 224));
  *(_QWORD *)(a1 + 224) = 0;
  v6 = *(void (**)(_QWORD))(a1 + 88);
  if (v6)
    v6(*(_QWORD *)(a1 + 16));
  *(_QWORD *)(a1 + 8) = a2;
  *(_QWORD *)(a1 + 16) = a3;
  *(_QWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = 1;
  if (sub_19C16E898(*(double *)(a1 + 104)) && *(double *)(a1 + 104) < 0.0)
    *(_QWORD *)(a1 + 104) = 0x7FF0000000000000;
  return 1;
}

uint64_t sub_19C23B378(uint64_t a1, const void *a2)
{
  uint64_t v4;
  BOOL v5;
  uint64_t result;
  BOOL v7;
  unint64_t v8;
  double v9;
  double v10;

  if (!a1)
    return 4294967294;
  free(*(void **)(a1 + 224));
  *(_QWORD *)(a1 + 224) = 0;
  v4 = *(unsigned int *)(a1 + 4);
  if (*(_DWORD *)(a1 + 4))
    v5 = a2 == 0;
  else
    v5 = 0;
  if (v5)
    result = 4294967294;
  else
    result = 1;
  if ((_DWORD)v4)
    v7 = a2 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    memcpy(*(void **)(a1 + 40), a2, 8 * v4);
    if (*(_DWORD *)(a1 + 4))
    {
      v8 = 0;
      do
      {
        v9 = *(double *)(*(_QWORD *)(a1 + 40) + 8 * v8);
        v10 = *(double *)(*(_QWORD *)(a1 + 48) + 8 * v8);
        if (v9 < v10 && sub_19C16E8D0(v10 - v9))
          *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v8) = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v8);
        ++v8;
      }
      while (v8 < *(unsigned int *)(a1 + 4));
    }
    return 1;
  }
  return result;
}

char *sub_19C23B440(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *result;

  result = sub_19C16E7E0(*(void **)(a1 + 224), a2, &a9);
  *(_QWORD *)(a1 + 224) = result;
  return result;
}

uint64_t sub_19C23B47C(uint64_t a1, const void *a2)
{
  uint64_t v4;
  BOOL v5;
  uint64_t result;
  BOOL v7;
  unint64_t v8;
  double v9;
  double v10;

  if (!a1)
    return 4294967294;
  free(*(void **)(a1 + 224));
  *(_QWORD *)(a1 + 224) = 0;
  v4 = *(unsigned int *)(a1 + 4);
  if (*(_DWORD *)(a1 + 4))
    v5 = a2 == 0;
  else
    v5 = 0;
  if (v5)
    result = 4294967294;
  else
    result = 1;
  if ((_DWORD)v4)
    v7 = a2 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    memcpy(*(void **)(a1 + 48), a2, 8 * v4);
    if (*(_DWORD *)(a1 + 4))
    {
      v8 = 0;
      do
      {
        v9 = *(double *)(*(_QWORD *)(a1 + 40) + 8 * v8);
        v10 = *(double *)(*(_QWORD *)(a1 + 48) + 8 * v8);
        if (v9 < v10 && sub_19C16E8D0(v10 - v9))
          *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v8) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v8);
        ++v8;
      }
      while (v8 < *(unsigned int *)(a1 + 4));
    }
    return 1;
  }
  return result;
}

uint64_t sub_19C23B544(uint64_t a1, double a2)
{
  if (!a1)
    return 4294967294;
  free(*(void **)(a1 + 224));
  *(_QWORD *)(a1 + 224) = 0;
  *(double *)(a1 + 112) = a2;
  return 1;
}

uint64_t sub_19C23B58C(uint64_t a1, double a2)
{
  if (!a1)
    return 4294967294;
  free(*(void **)(a1 + 224));
  *(_QWORD *)(a1 + 224) = 0;
  *(double *)(a1 + 128) = a2;
  return 1;
}

uint64_t sub_19C23B5D4(uint64_t a1, int a2)
{
  if (!a1)
    return 4294967294;
  free(*(void **)(a1 + 224));
  *(_QWORD *)(a1 + 224) = 0;
  *(_DWORD *)(a1 + 152) = a2;
  return 1;
}

uint64_t sub_19C23B614(uint64_t a1, int a2)
{
  while (a1)
  {
    free(*(void **)(a1 + 224));
    *(_QWORD *)(a1 + 224) = 0;
    *(_DWORD *)(a1 + 168) = a2;
    a1 = *(_QWORD *)(a1 + 176);
    if (!a1)
      return 1;
  }
  return 4294967294;
}

uint64_t sub_19C23B664(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t sub_19C23B66C(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(_QWORD *)(result + 88) = a2;
    *(_QWORD *)(result + 96) = a3;
  }
  return result;
}

uint64_t sub_19C23B678(uint64_t a1)
{
  return *(_QWORD *)(a1 + 224);
}

int *sub_19C23B684()
{
  _DWORD *v0;

  if (qword_1EE41A9D0 != -1)
  {
    dispatch_once(&qword_1EE41A9D0, &unk_1E3D25220);
    v0 = pthread_getspecific(qword_1EE41A9D8);
    if (v0)
      goto LABEL_4;
    goto LABEL_3;
  }
  v0 = pthread_getspecific(qword_1EE41A9D8);
  if (!v0)
  {
LABEL_3:
    v0 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    pthread_setspecific(qword_1EE41A9D8, v0);
    *v0 = 0;
  }
LABEL_4:
  *v0 = 1;
  return sub_19C23C630();
}

int *sub_19C23B730()
{
  _DWORD *v0;

  sub_19C17F2A4();
  getpid();
  if (qword_1EE41A9D0 != -1)
  {
    dispatch_once(&qword_1EE41A9D0, &unk_1E3D25220);
    v0 = pthread_getspecific(qword_1EE41A9D8);
    if (v0)
      goto LABEL_4;
    goto LABEL_3;
  }
  v0 = pthread_getspecific(qword_1EE41A9D8);
  if (!v0)
  {
LABEL_3:
    v0 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    pthread_setspecific(qword_1EE41A9D8, v0);
    *v0 = 0;
  }
LABEL_4:
  *v0 = 1;
  return sub_19C23C630();
}

int *sub_19C23B7F0()
{
  int *result;
  _DWORD *v1;

  if (qword_1EE41A9D0 == -1)
  {
    result = (int *)pthread_getspecific(qword_1EE41A9D8);
    if (result)
      goto LABEL_3;
LABEL_6:
    v1 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    pthread_setspecific(qword_1EE41A9D8, v1);
    *v1 = 0;
    return sub_19C23B730();
  }
  dispatch_once(&qword_1EE41A9D0, &unk_1E3D25220);
  result = (int *)pthread_getspecific(qword_1EE41A9D8);
  if (!result)
    goto LABEL_6;
LABEL_3:
  if (!*result)
    return sub_19C23B730();
  return result;
}

uint64_t sub_19C23B88C()
{
  return pthread_key_create((pthread_key_t *)&qword_1EE41A9D8, (void (__cdecl *)(void *))MEMORY[0x1E0C834A8]);
}

void sub_19C23B8A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    sub_19C23B8BC(a1, v4);
  }
  else if (*(_QWORD *)(a1 + 152))
  {
    sub_19C23BFBC(a1, 0, a3, a4);
  }
  else
  {
    sub_19C23C23C(a1, 0, a3, a4);
  }
}

void sub_19C23B8BC(uint64_t a1, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  MontrealNNModelNetwork *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  _BOOL4 v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  _BOOL4 v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  MLPLossLayer *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  id v153;
  uint64_t v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  _OWORD v160[3];
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  _BYTE v194[128];
  uint64_t v195;

  v195 = *MEMORY[0x1E0C80C00];
  sub_19C16CD74();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v3, v4, v5);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [MontrealNNModelNetwork alloc];
  v158 = (void *)objc_msgSend_initWithModelContainer_tensors_(v6, v7, a2, (uint64_t)v156);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v192 = 0u;
  v193 = 0u;
  v190 = 0u;
  v191 = 0u;
  objc_msgSend_nodes(v158, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v190, (uint64_t)v194, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v191;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v191 != v20)
          objc_enumerationMutation(v15);
        objc_msgSend_layerWithMontrealNode_modelContainer_(MLPLayer, v18, *(_QWORD *)(*((_QWORD *)&v190 + 1) + 8 * i), a2);
        v22 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v22;
        if (v22)
          objc_msgSend_addObject_(v11, v18, v22, v23);
      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v190, (uint64_t)v194, 16);
    }
    while (v19);
  }

  objc_msgSend_inputs(v158, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v27, v28, v29, v30);
  v157 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dimension(v157, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_count(v34, v35, v36, v37) == 3;

  if (v38)
  {
    objc_msgSend_dimension(v157, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndex_(v42, v43, 0, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(a1 + 120) = objc_msgSend_unsignedIntegerValue(v45, v46, v47, v48);

    objc_msgSend_dimension(v157, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndex_(v52, v53, 1, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(a1 + 128) = objc_msgSend_unsignedIntegerValue(v55, v56, v57, v58);

    objc_msgSend_dimension(v157, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndex_(v62, v63, 2, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(a1 + 136) = objc_msgSend_unsignedIntegerValue(v65, v66, v67, v68);

  }
  else
  {
    objc_msgSend_dimension(v157, v39, v40, v41);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend_count(v72, v73, v74, v75) == 2;

    if (v76)
    {
      objc_msgSend_dimension(v157, v77, v78, v79);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v80, v81, 0, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(a1 + 120) = objc_msgSend_unsignedIntegerValue(v83, v84, v85, v86);

      *(_QWORD *)(a1 + 128) = 1;
      objc_msgSend_dimension(v157, v87, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v90, v91, 1, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(a1 + 136) = objc_msgSend_unsignedIntegerValue(v93, v94, v95, v96);

    }
    else
    {
      objc_msgSend_dimension(v157, v77, v78, v79);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = (unint64_t)objc_msgSend_count(v97, v98, v99, v100) < 2;

      if (!v101)
      {
        objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x1E0C99DA0], v102, *MEMORY[0x1E0C99768], (uint64_t)CFSTR("Input dimension not handled"), 0);
        v153 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v153);
      }
      *(int64x2_t *)(a1 + 120) = vdupq_n_s64(1uLL);
      *(_QWORD *)(a1 + 136) = objc_msgSend_tensorSize(v157, v102, v103, v104);
    }
  }
  objc_msgSend_nodes(v158, v69, v70, v71);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v105, v106, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_outputs(v109, v110, v111, v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v113, v114, v115, v116);
  v155 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)(a1 + 144) = objc_msgSend_tensorSize(v155, v117, v118, v119);
  if (objc_msgSend_layerType(v17, v120, v121, v122) == 6)
  {
    v188 = 0u;
    v189 = 0u;
    v186 = 0u;
    v187 = 0u;
    v184 = 0u;
    v185 = 0u;
    v182 = 0u;
    v183 = 0u;
    v180 = 0u;
    v181 = 0u;
    v178 = 0u;
    v179 = 0u;
    v176 = 0u;
    v177 = 0u;
    v174 = 0u;
    v175 = 0u;
    v172 = 0u;
    v173 = 0u;
    v170 = 0u;
    v171 = 0u;
    v168 = 0u;
    v169 = 0u;
    v166 = 0u;
    v167 = 0u;
    v164 = 0u;
    v165 = 0u;
    v162 = 0u;
    v163 = 0u;
    v161 = 0u;
    memset(v160, 0, sizeof(v160));
    objc_msgSend_nodes(v158, v123, v124, v125);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v126, v127, v128, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = v130;
    if (v130)
      objc_msgSend_parameters_(v130, v131, a2, v132);
    else
      bzero(v160, 0x2C0uLL);

    if (*((_QWORD *)&v161 + 1) == 4)
    {
      v134 = [MLPLossLayer alloc];
      objc_msgSend_lastObject(v11, v135, v136, v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = (void *)objc_msgSend_initWithName_previousLayer_neuronType_neuronParams_(v134, v139, (uint64_t)CFSTR("last_softmax"), (uint64_t)v138, 0, 0);

      objc_msgSend_addObject_(v11, v141, (uint64_t)v140, v142);
    }
  }
  v143 = *(_QWORD *)(a1 + 120);
  v144 = *(_QWORD *)(a1 + 128);
  v154 = *(_QWORD *)(a1 + 136);
  v145 = *(_QWORD *)(a1 + 96);
  v146 = *(_QWORD *)(a1 + 104);
  v148 = *(_QWORD *)(a1 + 176);
  v147 = *(_QWORD *)(a1 + 184);
  objc_msgSend_optimizerParams(v158, v123, v124, v125);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_networkWithLayers_inputLength_inputHeight_inputChannels_batchSize_lossBatchSize_options_deviceHandler_optimizerParams_(MLPNetwork, v150, (uint64_t)v11, v143, v144, v154, v145, v146, v148, v147, v149);
  v151 = objc_claimAutoreleasedReturnValue();
  v152 = *(void **)a1;
  *(_QWORD *)a1 = v151;

}

void sub_19C23BE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_19C23BFBC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  MLPEmbeddingLayer *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  MLPLSTMLayer *v10;
  const char *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  MLPLSTMLayer *v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  MLPDenseLayer *v20;
  const char *v21;
  id v22;
  const char *v23;
  uint64_t v24;
  MLPLossLayer *v25;
  const char *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  id v37;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, a3, a4);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [MLPEmbeddingLayer alloc];
  v7 = (void *)objc_msgSend_initWithName_inputLength_vocabSize_embeddingDimension_(v5, v6, (uint64_t)CFSTR("embedding"), 1, *(_QWORD *)(a1 + 152), *(_QWORD *)(a1 + 160));
  objc_msgSend_addObject_(v37, v8, (uint64_t)v7, v9);
  v10 = [MLPLSTMLayer alloc];
  v12 = (id)objc_msgSend_initWithName_inputSize_outputSize_weightAttributes_(v10, v11, (uint64_t)CFSTR("lstm_1"), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 160), 32);

  objc_msgSend_addObject_(v37, v13, (uint64_t)v12, v14);
  v15 = [MLPLSTMLayer alloc];
  v17 = (id)objc_msgSend_initWithName_inputSize_outputSize_weightAttributes_(v15, v16, (uint64_t)CFSTR("lstm_2"), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 160), 32);

  objc_msgSend_addObject_(v37, v18, (uint64_t)v17, v19);
  v20 = [MLPDenseLayer alloc];
  v22 = (id)objc_msgSend_initWithName_numInputs_numOutputs_neuronType_neuronParams_(v20, v21, (uint64_t)CFSTR("dense"), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 144), 0, 0);

  objc_msgSend_addObject_(v37, v23, (uint64_t)v22, v24);
  v25 = [MLPLossLayer alloc];
  v27 = (id)objc_msgSend_initWithName_previousLayer_neuronType_neuronParams_(v25, v26, (uint64_t)CFSTR("loss"), (uint64_t)v22, 0, 0);

  objc_msgSend_addObject_(v37, v28, (uint64_t)v27, v29);
  v33 = (void *)objc_msgSend_copy(v37, v30, v31, v32);
  objc_msgSend_networkWithLayers_inputLength_inputHeight_inputChannels_batchSize_lossBatchSize_options_deviceHandler_optimizerParams_(MLPNetwork, v34, (uint64_t)v33, 1, 1, 1, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 184), 0);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = *(void **)a1;
  *(_QWORD *)a1 = v35;

}

void sub_19C23C1A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_19C23C1C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19C23C208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19C23C220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19C23C23C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  MLPDropoutLayer *v5;
  double v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  MLPConvolutionLayer *v11;
  const char *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  MLPConvolutionLayer *v16;
  const char *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  MLPPoolingLayer *v21;
  const char *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  MLPConvolutionLayer *v26;
  const char *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  MLPPoolingLayer *v31;
  const char *v32;
  id v33;
  const char *v34;
  uint64_t v35;
  MLPDropoutLayer *v36;
  double v37;
  const char *v38;
  id v39;
  const char *v40;
  uint64_t v41;
  MLPDenseLayer *v42;
  const char *v43;
  id v44;
  const char *v45;
  uint64_t v46;
  MLPLossLayer *v47;
  const char *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  id v62;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, a3, a4);
  v62 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [MLPDropoutLayer alloc];
  LODWORD(v6) = 1045220557;
  v8 = (void *)objc_msgSend_initWithName_inputLength_inputChannels_dropoutRatio_(v5, v7, (uint64_t)CFSTR("dropout_1"), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 136), v6);
  objc_msgSend_addObject_(v62, v9, (uint64_t)v8, v10);
  v11 = [MLPConvolutionLayer alloc];
  v59 = 1;
  v13 = (id)objc_msgSend_initWithName_previousLayer_kernelWidth_kernelHeight_kernelStride_outputChannels_neuronType_neuronParams_(v11, v12, (uint64_t)CFSTR("conv_0"), (uint64_t)v8, 1, 1, 1, 256, v59, &unk_1E3D2E820);

  objc_msgSend_addObject_(v62, v14, (uint64_t)v13, v15);
  v16 = [MLPConvolutionLayer alloc];
  LODWORD(v60) = 1;
  v18 = (id)objc_msgSend_initWithName_previousLayer_kernelWidth_kernelHeight_kernelStride_outputChannels_neuronType_neuronParams_(v16, v17, (uint64_t)CFSTR("conv_1"), (uint64_t)v13, 5, 1, 1, 128, v60, &unk_1E3D2E838);

  objc_msgSend_addObject_(v62, v19, (uint64_t)v18, v20);
  v21 = [MLPPoolingLayer alloc];
  v23 = (id)objc_msgSend_initWithName_previousLayer_kernelWidth_kernelHeight_kernelStride_(v21, v22, (uint64_t)CFSTR("pool_1"), (uint64_t)v18, 5, 1, 5);

  objc_msgSend_addObject_(v62, v24, (uint64_t)v23, v25);
  v26 = [MLPConvolutionLayer alloc];
  LODWORD(v61) = 1;
  v28 = (id)objc_msgSend_initWithName_previousLayer_kernelWidth_kernelHeight_kernelStride_outputChannels_neuronType_neuronParams_(v26, v27, (uint64_t)CFSTR("conv_2"), (uint64_t)v23, 5, 1, 1, 64, v61, &unk_1E3D2E850);

  objc_msgSend_addObject_(v62, v29, (uint64_t)v28, v30);
  v31 = [MLPPoolingLayer alloc];
  v33 = (id)objc_msgSend_initWithName_previousLayer_kernelWidth_kernelHeight_kernelStride_(v31, v32, (uint64_t)CFSTR("pool_2"), (uint64_t)v28, 5, 1, 5);

  objc_msgSend_addObject_(v62, v34, (uint64_t)v33, v35);
  v36 = [MLPDropoutLayer alloc];
  LODWORD(v37) = 0.5;
  v39 = (id)objc_msgSend_initWithName_previousLayer_dropoutRatio_(v36, v38, (uint64_t)CFSTR("dropout_2"), (uint64_t)v33, v37);

  objc_msgSend_addObject_(v62, v40, (uint64_t)v39, v41);
  v42 = [MLPDenseLayer alloc];
  v44 = (id)objc_msgSend_initWithName_previousLayer_numOutputs_neuronType_neuronParams_(v42, v43, (uint64_t)CFSTR("dense_2"), (uint64_t)v39, *(_QWORD *)(a1 + 144), 0, 0);

  objc_msgSend_addObject_(v62, v45, (uint64_t)v44, v46);
  v47 = [MLPLossLayer alloc];
  v49 = (id)objc_msgSend_initWithName_previousLayer_neuronType_neuronParams_(v47, v48, (uint64_t)CFSTR("loss"), (uint64_t)v44, 0, 0);

  objc_msgSend_addObject_(v62, v50, (uint64_t)v49, v51);
  v55 = (void *)objc_msgSend_copy(v62, v52, v53, v54);
  objc_msgSend_networkWithLayers_inputLength_inputHeight_inputChannels_batchSize_lossBatchSize_options_deviceHandler_optimizerParams_(MLPNetwork, v56, (uint64_t)v55, *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 184), 0);
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = *(void **)a1;
  *(_QWORD *)a1 = v57;

}

void sub_19C23C58C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_19C23C5A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19C23C5FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19C23C614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

int *sub_19C23C630()
{
  _DWORD *v0;
  int v1;
  int *result;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;

  v0 = (_DWORD *)off_1EE419460();
  *v0 = v1;
  result = (int *)off_1EE419478();
  v5 = 1;
  *result = 1;
  do
  {
    *(_DWORD *)(v3 + 4 * v5) = v5 + 1812433253 * (*(_DWORD *)(v4 + 4 * v5) ^ (*(_DWORD *)(v4 + 4 * v5) >> 30));
    v6 = *result;
    v5 = *result + 1;
    *result = v5;
  }
  while (v6 < 623);
  return result;
}

uint64_t sub_19C23C6A8(unsigned int a1)
{
  return sub_19C23C6D0() % a1;
}

uint64_t sub_19C23C6D0()
{
  int *v0;
  int *v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  int v6;
  unsigned int *v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  unsigned int v18;

  if (*(int *)off_1EE419478() <= 623)
  {
    v0 = (int *)off_1EE419460();
  }
  else
  {
    v0 = (int *)off_1EE419460();
    if (v2 == 625)
    {
      *v0 = 5489;
      v3 = 1;
      *v1 = 1;
      do
      {
        v0[v3] = v3 + 1812433253 * (v0[v3 - 1] ^ (v0[v3 - 1] >> 30));
        v4 = *v1;
        v3 = *v1 + 1;
        *v1 = v3;
      }
      while (v4 < 623);
    }
    v5 = 0;
    v6 = *v0;
    do
    {
      v7 = (unsigned int *)&v0[v5];
      v8 = v6 & 0x80000000;
      v9 = v0[v5 + 1];
      v6 = v0[v5 + 2];
      v10 = dword_19C27AECC[v9 & 1] ^ v0[v5 + 397] ^ ((v9 & 0x7FFFFFFE | v8) >> 1);
      v11 = dword_19C27AECC[v6 & 1] ^ v0[v5 + 398] ^ ((v6 & 0x7FFFFFFE | v9 & 0x80000000) >> 1);
      *v7 = v10;
      v7[1] = v11;
      v5 += 2;
    }
    while (v5 != 226);
    v12 = 0;
    v13 = v0[227];
    v0[226] = dword_19C27AECC[v13 & 1] ^ v0[623] ^ ((v13 & 0x7FFFFFFE | v6 & 0x80000000) >> 1);
    v14 = v13;
    do
    {
      v15 = v14 & 0x80000000;
      v14 = v0[v12 + 228];
      v0[v12 + 227] = dword_19C27AECC[v14 & 1] ^ v0[v12] ^ ((v14 & 0x7FFFFFFE | v15) >> 1);
      ++v12;
    }
    while (v12 != 396);
    v16 = 0;
    v0[623] = dword_19C27AECC[*v0 & 1] ^ v0[396] ^ ((*v0 & 0x7FFFFFFE | v0[623] & 0x80000000) >> 1);
  }
  *v1 = v16 + 1;
  v17 = v0[v16] ^ (v0[v16] >> 11);
  v18 = (((v17 << 7) & 0x9D2C5680 ^ v17) << 15) & 0xEFC60000 ^ (v17 << 7) & 0x9D2C5680 ^ v17;
  return v18 ^ (v18 >> 18);
}

void sub_19C23C9A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19C23CAB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C23CB8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19C23CC68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19C23CDE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19C23CECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v15 = v14;

  _Unwind_Resume(a1);
}

void sub_19C23CEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_19C23CF1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19C23D004(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C23D020(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C23D254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_19C23D274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_19C23D3B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{

  _Unwind_Resume(a1);
}

void sub_19C23D568(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19C23D584(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C23D59C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19C23D5C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19C23D5E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C23D5F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C23D60C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C23D624(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C23D63C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C23D650(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C23D660(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C23D6EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C23D700(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C23D8B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C23DD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  if (v36)
    operator delete(v36);
  sub_19C07DC58((uint64_t)&a35);

  _Unwind_Resume(a1);
}

void sub_19C23E0F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C23E230(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C23E988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  uint64_t v14;

  _Unwind_Resume(a1);
}

void sub_19C23ECD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_19C23ECE8(void ***a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  MLPModelLSTMDataSource *v49;

  v49 = [MLPModelLSTMDataSource alloc];
  v10 = objc_msgSend_inputSize(**a1, v7, v8, v9);
  v14 = objc_msgSend_outputSize(**a1, v11, v12, v13);
  v18 = objc_msgSend_initialWeights_0(**a1, v15, v16, v17);
  v22 = objc_msgSend_initialWeights_1(**a1, v19, v20, v21);
  v26 = objc_msgSend_initialBias_0(**a1, v23, v24, v25);
  v30 = objc_msgSend_initialBias_1(**a1, v27, v28, v29);
  v34 = objc_msgSend_weightAttributes(**a1, v31, v32, v33);
  objc_msgSend_network(**a1, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v38, v39, v40, v41);
  v42 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v42;
  LODWORD(v45) = 1045220557;
  LODWORD(v46) = 1.0;
  if ((_DWORD)a3 == 4)
    *(float *)&v46 = 0.5;
  else
    *(float *)&v45 = 1.0;
  v47 = (void *)objc_msgSend_initWithColumns_rows_lstmInputSize_lstmOutputSize_weightID_neuronType_neuronA_neuronB_initialWeights_0_initialWeights_1_bias_0_bias_1_weightAttributes_deviceHandler_(v49, v43, a4, a5, v10, v14, a2, a3, v45, v46, v18, v22, v26, v30, v34, v42);

  return v47;
}

void sub_19C23EE2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C23EE40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_19C23EE50(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  if (!objc_msgSend_count(*(void **)(a1 + 32), a2, a3, a4))
  {
    objc_msgSend_filter(*(void **)(a1 + 40), v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_createWeightMatrices_(v8, v9, *(_QWORD *)(a1 + 32), v10);

  }
  return *(id *)(a1 + 32);
}

void sub_19C23EEA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_19C23EEB8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  size_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;

  objc_msgSend_objectAtIndexedSubscript_(a2, (const char *)a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v5, v6, v7, v8);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (void *)objc_msgSend_contents(v9, v10, v11, v12);
  objc_msgSend_data(v5, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_length(v17, v18, v19, v20);
  bzero(v13, v21);

  objc_msgSend_network(*(void **)(a1 + 32), v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matrixToVector_(v29, v30, (uint64_t)v5, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

void sub_19C23EF70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C23EF90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C23EFA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C23EFB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_19C23EFCC(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6]);
}

id sub_19C23EFE0(uint64_t a1)
{
  void *v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_19C23F030(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C23F168(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19C23F18C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C23F1A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C23F1BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C23F414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_19C23F794(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v21 = v18;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_19C23FA0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C23FA24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19C23FD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_19C24020C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *__p,void *a22,void *a23)
{
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_19C240434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C240F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_19C24119C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  _QWORD v34[3];

  v5 = a2;
  v6 = a3;
  objc_msgSend_filter(**(void ***)a1, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = **(_QWORD **)(a1 + 8);
  objc_msgSend_weights(**(void ***)a1, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_unsignedIntegerValue(v5, v16, v17, v18);
  memset(v34, 0, sizeof(v34));
  objc_msgSend_encodeCopyWeightsToCommandBuffer_weights_matrixId_matrix_copyFromWeightsToMatrix_matrixOffset_(v10, v20, v11, (uint64_t)v15, v19, v6, 1, v34);

  objc_msgSend_network(**(void ***)a1, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v6, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_importDataFromGPU_cmdBuf_(v28, v33, (uint64_t)v32, **(_QWORD **)(a1 + 8));

}

void sub_19C2412A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19C2412C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19C242008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C242020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C242060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242088(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C24209C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2420B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2420C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2420D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2420EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C24213C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242150(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C24218C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2421A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2421B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2421C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2421DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2421F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C24222C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C24227C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2422A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2422B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2422CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2422E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2422F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242308(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C24231C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242330(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C242344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C24266C(const char *a1@<X0>, uint64_t a2@<X8>)
{
  size_t v4;
  size_t v5;
  __int128 *p_dst;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  __int128 __dst;
  int64_t v12;

  if (!a1)
  {
    *(_BYTE *)(a2 + 23) = 0;
    *(_BYTE *)a2 = 0;
    return;
  }
  v4 = strlen(a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_19C07C774();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    p_dst = (__int128 *)operator new(v7 + 1);
    *((_QWORD *)&__dst + 1) = v5;
    v12 = v8 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
  }
  else
  {
    HIBYTE(v12) = v4;
    p_dst = &__dst;
    if (!v4)
      goto LABEL_12;
  }
  memcpy(p_dst, a1, v5);
LABEL_12:
  *((_BYTE *)p_dst + v5) = 0;
  v9 = HIBYTE(v12);
  v10 = SHIBYTE(v12);
  if (v12 < 0)
    v9 = *((_QWORD *)&__dst + 1);
  if (v9)
  {
    *(_OWORD *)a2 = __dst;
    *(_QWORD *)(a2 + 16) = v12;
  }
  else
  {
    *(_BYTE *)(a2 + 23) = 0;
    *(_BYTE *)a2 = 0;
    if (v10 < 0)
      operator delete((void *)__dst);
  }
}

void sub_19C242794(const __CFString *a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *v2;
  CFIndex Length;
  CFIndex v5;
  char *v6;
  size_t v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v2 = a2;
  if (!a1)
  {
    a2[23] = 0;
    *a2 = 0;
    return;
  }
  Length = CFStringGetLength(a1);
  v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v6 = (char *)operator new[]();
  CFStringGetCString(a1, v6, v5, 0x8000100u);
  v7 = strlen(v6);
  if (v7 >= 0x7FFFFFFFFFFFFFF8)
    sub_19C07C774();
  v8 = v7;
  if (v7 >= 0x17)
  {
    v9 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v9 = v7 | 7;
    v10 = v9 + 1;
    v11 = operator new(v9 + 1);
    v2[1] = v8;
    v2[2] = v10 | 0x8000000000000000;
    *v2 = v11;
    v2 = v11;
    goto LABEL_11;
  }
  *((_BYTE *)v2 + 23) = v7;
  if (v7)
  {
LABEL_11:
    memcpy(v2, v6, v8);
    *((_BYTE *)v2 + v8) = 0;
    operator delete[](v6);
    return;
  }
  *(_BYTE *)v2 = 0;
  operator delete[](v6);
}

void sub_19C2428B4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete[](v1);
  _Unwind_Resume(a1);
}

void sub_19C2428C8(unint64_t a1@<X0>, float32x4_t *a2@<X1>, float32x4_t *a3@<X2>, float32x4_t *a4@<X3>, float32x4_t *a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v12;
  float32x4_t *v13;
  float32x4_t *v14;
  unint64_t v15;
  float32x4_t v16;
  unint64_t v17;
  float32x4_t *v18;
  float32x4_t *v19;
  float32x4_t *v20;
  float32x4_t *v21;
  float32x4_t *v22;
  float32x4_t *v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float32x4_t v30;
  uint64_t v31;
  __int8 *v32;
  char *v33;
  __int8 *v34;
  __int8 *v35;
  __int8 *v36;
  __int8 *v37;
  unint64_t v38;
  uint64_t v39;
  float v40;
  void *__p;
  char *v42;
  __int8 *v43;
  void *v44;
  char *v45;
  char *v46;

  v44 = 0;
  v45 = 0;
  v46 = 0;
  if (!a1)
  {
    __p = 0;
    v42 = 0;
    v43 = 0;
    goto LABEL_11;
  }
  if (a1 >> 62)
    sub_19C07DA0C();
  v12 = 4 * a1;
  v13 = (float32x4_t *)operator new(4 * a1);
  v44 = v13;
  v46 = &v13->i8[4 * a1];
  bzero(v13, 4 * a1);
  v45 = (char *)v13 + v12;
  v14 = (float32x4_t *)operator new(4 * a1);
  __p = v14;
  v43 = &v14->i8[4 * a1];
  bzero(v14, 4 * a1);
  v42 = (char *)v14 + v12;
  if (a1 < 4)
  {
    v15 = 0;
LABEL_9:
    v31 = 0;
    v32 = &v14->i8[4 * v15];
    v33 = &v13->i8[4 * v15];
    v34 = &a4->i8[4 * v15];
    v35 = &a3->i8[4 * v15];
    v36 = &a5->i8[4 * v15];
    v37 = &a2->i8[4 * v15];
    v38 = a1 - v15;
    do
    {
      v39 = 4 * v31;
      v40 = *(float *)&v37[4 * v31] / sqrtf(*(float *)&v36[4 * v31] + 0.00001);
      *(float *)&v33[v39] = v40;
      *(float *)&v32[v39] = *(float *)&v35[4 * v31] - (float)(*(float *)&v34[4 * v31] * v40);
      ++v31;
    }
    while (v38 != v31);
    goto LABEL_11;
  }
  v15 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v16 = (float32x4_t)vdupq_n_s32(0x3727C5ACu);
  v17 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v18 = v14;
  v19 = a4;
  v20 = a3;
  v21 = v13;
  v22 = a5;
  v23 = a2;
  do
  {
    v24 = *v23++;
    v25 = v24;
    v26 = *v22++;
    v27 = vdivq_f32(v25, vsqrtq_f32(vaddq_f32(v26, v16)));
    *v21++ = v27;
    v28 = *v20++;
    v29 = v28;
    v30 = *v19++;
    *v18++ = vmlsq_f32(v29, v30, v27);
    v17 -= 4;
  }
  while (v17);
  if (v15 != a1)
    goto LABEL_9;
LABEL_11:
  sub_19C242AE4(a6, (uint64_t)&v44, (uint64_t)&__p);
  if (__p)
  {
    v42 = (char *)__p;
    operator delete(__p);
  }
  if (v44)
  {
    v45 = (char *)v44;
    operator delete(v44);
  }
}

void sub_19C242AAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_19C242AE4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  const void *v6;
  int64_t v7;
  char *v8;
  char *v9;
  const void *v10;
  int64_t v11;
  char *v12;
  char *v13;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  v6 = *(const void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  v7 = v5 - *(_QWORD *)a2;
  if (v5 != *(_QWORD *)a2)
  {
    if (v7 < 0)
      sub_19C07DA0C();
    v8 = (char *)operator new(v5 - *(_QWORD *)a2);
    *a1 = v8;
    a1[1] = v8;
    v9 = &v8[4 * (v7 >> 2)];
    a1[2] = v9;
    memcpy(v8, v6, v7);
    a1[1] = v9;
  }
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  v10 = *(const void **)a3;
  v11 = *(_QWORD *)(a3 + 8) - *(_QWORD *)a3;
  if (v11)
  {
    if (v11 < 0)
      sub_19C07DA0C();
    v12 = (char *)operator new(v11);
    a1[3] = v12;
    a1[4] = v12;
    v13 = &v12[4 * (v11 >> 2)];
    a1[5] = v13;
    memcpy(v12, v10, v11);
    a1[4] = v13;
  }
  return a1;
}

void sub_19C242BB4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;
  void *v5;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 32) = v4;
    operator delete(v4);
  }
  v5 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

double MRLInitLayerParameters(uint64_t a1)
{
  double result;

  *(_QWORD *)a1 = 0x100000000;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 13) = 0;
  *(_QWORD *)(a1 + 24) = 0x100000000;
  *(_BYTE *)(a1 + 32) = 1;
  *(_DWORD *)(a1 + 36) = 32;
  result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 240) = 32;
  *(_BYTE *)(a1 + 244) = 0;
  *(_BYTE *)(a1 + 376) = 0;
  *(_DWORD *)(a1 + 380) = 32;
  *(_BYTE *)(a1 + 384) = 0;
  *(_QWORD *)(a1 + 448) = 0;
  *(_QWORD *)(a1 + 456) = 0;
  *(_QWORD *)(a1 + 440) = 0;
  *(_WORD *)(a1 + 464) = 0;
  *(_DWORD *)(a1 + 468) = 1112014848;
  *(_WORD *)(a1 + 472) = 0;
  *(_QWORD *)(a1 + 484) = 0;
  *(_QWORD *)(a1 + 476) = 0;
  return result;
}

uint64_t sub_19C242C68(double *a1, double *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;

  if (*a1 < *a2)
    return 0xFFFFFFFFLL;
  if (*a1 > *a2)
    return 1;
  v3 = a1[1];
  v4 = a2[1];
  if (v3 < v4)
    return 0xFFFFFFFFLL;
  if (v3 > v4)
    return 1;
  v5 = a1[2];
  v6 = a2[2];
  if (v5 < v6)
    return 0xFFFFFFFFLL;
  if (v5 <= v6)
    return ((unint64_t)((char *)a1 - (char *)a2) >> 3);
  return 1;
}

uint64_t sub_19C242CE0(unsigned int a1, double (*a2)(_QWORD, const void *, _QWORD, uint64_t), uint64_t a3, float64x2_t *a4, float64x2_t *a5, void *a6, void **a7, double *a8, double a9, int a10)
{
  int v14;
  __int128 *v15;
  double *v16;
  double *v17;
  uint64_t v18;
  double *v19;
  double *v20;
  double *v21;
  double *v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  const void *v27;
  uint64_t v28;
  double v29;
  char *v30;
  unint64_t v31;
  uint64_t v32;
  double *v33;
  char *v34;
  unint64_t v35;
  double *v36;
  BOOL v38;
  BOOL v40;
  BOOL v42;
  BOOL v44;
  float64x2_t *v46;
  uint64_t v50;
  float64x2_t *v51;
  float64x2_t *v52;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  uint64_t v56;
  float64x2_t *v57;
  float64x2_t v58;
  uint64_t v59;
  float64x2_t v60;
  uint64_t v61;
  double *v62;
  double v63;
  float64x2_t *v64;
  float64x2_t v65;
  uint64_t v66;
  float64x2_t v67;
  uint64_t v68;
  double *v69;
  double v70;
  float v71;
  double v72;
  int v73;
  uint64_t v74;
  void *v75;
  double v76;
  int v77;
  _QWORD *v78;
  int v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  double *v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  _QWORD *v88;
  _QWORD *v89;
  double v90;
  _QWORD *i;
  int v92;
  double *v93;
  double v94;
  double v95;
  double *v96;
  _QWORD *v97;
  unsigned int v98;
  int v99;
  int v100;
  uint64_t v101;
  double *v102;
  double *v103;
  double v104;
  double v105;
  uint64_t v107;
  double *v108;
  _QWORD *v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  unsigned int v115;
  double *v116;
  int v117;
  int v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  uint64_t v126;
  uint64_t v127;
  double *v128;
  double *v129;
  double *v130;
  double *v131;
  uint64_t v132;
  double v133;
  uint64_t v134;
  uint64_t v135;
  void **v137;
  __int128 *v138;
  uint64_t v139;
  unsigned int v140;
  int v141;
  double v142;
  int v143;
  int v144;
  uint64_t v145;
  double *v146;
  double *v147;
  double *v148;
  double (*v149)(_QWORD, const void *, _QWORD, uint64_t);
  uint64_t v150;
  void *v151[2];
  void *__dst[2];
  __int128 v153;
  __int128 v154;
  void *ptr[2];
  double v156;
  unint64_t v157;
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  v153 = 0u;
  v154 = 0u;
  *(_OWORD *)ptr = 0u;
  v142 = a9;
  v143 = a10 % 3;
  v144 = a10 / 3 % 3;
  v145 = (a10 / 9 % 3);
  v146 = (double *)a4;
  v147 = (double *)a5;
  v148 = a8;
  v149 = a2;
  v14 = 2 * a1;
  v140 = a1;
  v141 = 2 * a1 + 3;
  v150 = a3;
  __dst[0] = (void *)0x7FF0000000000000;
  __dst[1] = a6;
  DWORD2(v154) = 0;
  v15 = &v153;
  v151[1] = 0;
  sub_19C08DCE0((uint64_t)&v153, (uint64_t)sub_19C242C68);
  v151[0] = malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
  if (!v151[0]
    || (v151[1] = malloc_type_malloc(4 * (int)a1, 0x100004052888210uLL)) == 0
    || (LODWORD(ptr[1]) = 128, (ptr[0] = malloc_type_malloc(0x400uLL, 0x80040B8603338uLL)) == 0)
    || (v16 = (double *)malloc_type_malloc(8 * v141, 0x100004000313F17uLL)) == 0)
  {
LABEL_166:
    v74 = 4294967293;
    goto LABEL_167;
  }
  v17 = v16;
  if ((int)a1 < 1)
  {
    v27 = v16 + 3;
    v29 = 0.0;
    if (v143)
      goto LABEL_66;
    goto LABEL_65;
  }
  if (a1 < 0xC)
  {
    v18 = 0;
LABEL_8:
    v19 = &v17[v18 + 3 + a1];
    v20 = &v17[v18 + 3];
    v21 = &a5->f64[v18];
    v22 = &a4->f64[v18];
    v23 = a1 - v18;
    do
    {
      *v20++ = (*v21 + *v22) * 0.5;
      v24 = *v21++;
      v25 = v24;
      v26 = *v22++;
      *v19++ = v25 - v26;
      --v23;
    }
    while (v23);
    goto LABEL_10;
  }
  v18 = 0;
  v30 = (char *)(v16 + 3);
  v31 = (unint64_t)&v16[a1 + 3];
  v32 = a1 + 3;
  v33 = &v16[v32];
  v34 = (char *)&v16[a1 + v32];
  v35 = (unint64_t)&a4->f64[a1];
  v36 = &a5->f64[a1];
  v38 = (unint64_t)(v17 + 3) < v35 && v31 > (unint64_t)a4;
  v40 = v30 < (char *)v36 && v31 > (unint64_t)a5;
  v42 = (unint64_t)v33 < v35 && v34 > (char *)a4;
  v44 = v33 < v36 && v34 > (char *)a5;
  if ((unint64_t)v33 < v31 && v30 < v34)
    goto LABEL_8;
  if (v38)
    goto LABEL_8;
  if (v40)
    goto LABEL_8;
  if (v42)
    goto LABEL_8;
  if (v44)
    goto LABEL_8;
  v18 = a1 & 0xFFFFFFFE;
  v46 = (float64x2_t *)(v17 + 3);
  __asm { FMOV            V0.2D, #0.5 }
  v50 = v18;
  v51 = a5;
  v52 = a4;
  do
  {
    v53 = *v52++;
    v54 = v53;
    v55 = *v51++;
    *v46 = vmulq_f64(vaddq_f64(v55, v54), _Q0);
    *(float64x2_t *)((char *)v46++ + 8 * a1) = vsubq_f64(v55, v54);
    v50 -= 2;
  }
  while (v50);
  if (v18 != a1)
    goto LABEL_8;
LABEL_10:
  v27 = v17 + 3;
  if (!v143)
  {
    if (a1 >= 4)
    {
      v56 = a1 & 0xFFFFFFFC;
      v64 = (float64x2_t *)&v17[(int)a1 + 5];
      v65 = 0uLL;
      v66 = v56;
      v67 = 0uLL;
      do
      {
        v65 = vmlaq_f64(v65, v64[-1], v64[-1]);
        v67 = vmlaq_f64(v67, *v64, *v64);
        v64 += 2;
        v66 -= 4;
      }
      while (v66);
      v29 = vaddvq_f64(vaddq_f64(v67, v65));
      if (v56 == a1)
        goto LABEL_65;
    }
    else
    {
      v56 = 0;
      v29 = 0.0;
    }
    v68 = a1 - v56;
    v69 = &v17[v56 + 3 + (int)a1];
    do
    {
      v70 = *v69++;
      v29 = v29 + v70 * v70;
      --v68;
    }
    while (v68);
LABEL_65:
    v29 = sqrt(v29);
    goto LABEL_66;
  }
  if (a1 < 4)
  {
    v28 = 0;
    v29 = 0.0;
LABEL_57:
    v61 = a1 - v28;
    v62 = &v17[v28 + 3 + (int)a1];
    do
    {
      v63 = *v62++;
      v29 = fmax(v63, v29);
      --v61;
    }
    while (v61);
    goto LABEL_66;
  }
  v28 = a1 & 0xFFFFFFFC;
  v57 = (float64x2_t *)&v17[(int)a1 + 5];
  v58 = 0uLL;
  v59 = v28;
  v60 = 0uLL;
  do
  {
    v58 = vmaxnmq_f64(v57[-1], v58);
    v60 = vmaxnmq_f64(*v57, v60);
    v57 += 2;
    v59 -= 4;
  }
  while (v59);
  v29 = vmaxnmvq_f64(vmaxnmq_f64(v58, v60));
  if (v28 != a1)
    goto LABEL_57;
LABEL_66:
  v71 = v29 * 0.5;
  *v17 = v71;
  v72 = v149(v140, v27, 0, v150);
  if (v72 < *(double *)__dst)
  {
    __dst[0] = *(void **)&v72;
    memcpy(__dst[1], v27, 8 * (int)v140);
  }
  ++**((_DWORD **)v148 + 7);
  v17[1] = v72;
  v73 = DWORD2(v154)++;
  v17[2] = (double)v73;
  if (!sub_19C08DE7C((uint64_t)&v153, (uint64_t)v17))
  {
    free(v17);
    v74 = 4294967293;
    goto LABEL_167;
  }
  v74 = sub_19C24377C(v17, (int *)&v140);
  if ((_DWORD)v74 == 1)
  {
    v137 = a7;
    while (1)
    {
      v139 = (int)v140;
      v75 = __dst[0];
      v76 = v142;
      v77 = (int)ptr[1];
      if (SLODWORD(ptr[1]) >= (int)v154)
      {
        v78 = ptr[0];
        v79 = v145;
        v80 = sub_19C08DDFC((uint64_t)v15);
        if (!v80)
          goto LABEL_157;
      }
      else
      {
        LODWORD(ptr[1]) += v154;
        v78 = malloc_type_realloc(ptr[0], 8 * ((int)v154 + v77), 0x80040B8603338uLL);
        ptr[0] = v78;
        if (!v78)
          goto LABEL_166;
        v79 = v145;
        v80 = sub_19C08DDFC((uint64_t)v15);
        if (!v80)
          goto LABEL_157;
      }
      v81 = (_QWORD *)v80;
      v82 = sub_19C08E2E4((uint64_t)v15);
      v83 = (double *)v81[3];
      v84 = *v83;
      v85 = v83[1];
      v86 = **(double **)(v82 + 24);
      if (v79 == 1)
        break;
      v87 = 0;
      while (1)
      {
        v78[v87] = v83;
        v88 = sub_19C08DE2C(v81);
        if (!v88)
          break;
        v81 = v88;
        v83 = (double *)v88[3];
        if (*v83 != v84)
          break;
        ++v87;
        if (v83[1] != v85)
          goto LABEL_85;
      }
      LODWORD(v87) = v87 + 1;
LABEL_85:
      if (v84 != v86)
        goto LABEL_86;
LABEL_118:
      if ((int)v87 >= 1)
      {
        v110 = 1;
        v138 = v15;
LABEL_120:
        v111 = 0;
        v112 = 0;
        while (1)
        {
          v114 = v112;
          v115 = (v112 & (v112 >> 31)) - 1;
          v116 = (double *)v78[v112];
          while (1)
          {
            v117 = v114;
            if (v114 < 1)
              break;
            if (*(double *)v78[--v114] != *v116)
            {
              v115 = v114;
              break;
            }
          }
          if ((int)v87 <= v112 + 1)
            v118 = v112 + 1;
          else
            v118 = v87;
          v113 = v118 - 1;
          v119 = v112;
          while (1)
          {
            v120 = v119 + 1;
            if (v119 + 1 >= v87)
              break;
            v121 = *(double *)v78[++v119];
            if (v121 != *v116)
            {
              v113 = v120 - 1;
              v118 = v120;
              break;
            }
          }
          v122 = v116[1];
          if (v117 < 1)
          {
            v123 = -INFINITY;
            if (v120 < v87)
            {
LABEL_136:
              v124 = *v116;
              v125 = (v122 - *(double *)(v78[v118] + 8)) / (*v116 - *(double *)v78[v118]);
              if (v118 == (_DWORD)v87)
                goto LABEL_141;
              goto LABEL_140;
            }
          }
          else
          {
            v123 = (v122 - *(double *)(v78[v115] + 8)) / (*v116 - *(double *)v78[v115]);
            if (v120 < v87)
              goto LABEL_136;
          }
          v124 = *v116;
          v125 = -INFINITY;
          if (v118 == (_DWORD)v87)
            goto LABEL_141;
LABEL_140:
          if (v122 - fmax(v123, v125) * v124 <= *(double *)__dst - fabs(*(double *)__dst) * v76)
          {
LABEL_141:
            v126 = sub_19C24377C(v116, (int *)&v140);
            if ((_DWORD)v126 != 1)
            {
              v74 = v126;
              a7 = v137;
              v15 = v138;
              goto LABEL_167;
            }
            if (v110)
            {
              v127 = v140;
              if ((int)v140 < 1)
              {
LABEL_149:
                v110 = 1;
              }
              else
              {
                v128 = (double *)(v78[v112] + 8 * v139 + 24);
                v129 = v147;
                v130 = (double *)*((_QWORD *)v148 + 5);
                v131 = v146;
                while (*v128 <= *v130 || *v128 <= (*v129 - *v131) * v148[4])
                {
                  ++v131;
                  ++v129;
                  ++v130;
                  ++v128;
                  if (!--v127)
                    goto LABEL_149;
                }
                v110 = 0;
              }
            }
            v111 = 1;
          }
          if ((_DWORD)v145 != 1)
          {
            if ((_DWORD)v145 == 2)
              v113 = sub_19C23C6A8(v118 - v112) + v112;
            else
              v113 = v112;
          }
          v112 = v113 + 1;
          if (v113 + 1 >= (int)v87)
          {
            if (!v111)
            {
              _ZF = v76 == 0.0;
              v76 = 0.0;
              v15 = v138;
              if (_ZF)
                break;
              goto LABEL_120;
            }
            a7 = v137;
            v15 = v138;
            if (!v110)
              goto LABEL_161;
            v74 = 4;
            goto LABEL_167;
          }
        }
      }
LABEL_157:
      v132 = sub_19C08E2E4((uint64_t)v15);
      v133 = **(double **)(v132 + 24);
      do
      {
        v134 = v132;
        v132 = (uint64_t)sub_19C08E314((_QWORD *)v132);
      }
      while (v132 && **(double **)(v132 + 24) == v133);
      v135 = sub_19C24377C(*(double **)(v134 + 24), (int *)&v140);
      a7 = v137;
      if ((_DWORD)v135 != 1)
      {
        v74 = v135;
        goto LABEL_167;
      }
LABEL_161:
      if (*(double *)__dst < *(double *)&v75)
      {
        v74 = 3;
        if (sub_19C16E688(v148, *(double *)__dst, *(double *)&v75))
          goto LABEL_167;
      }
    }
    *v78 = v83;
    LODWORD(v87) = 1;
    if (v84 == v86)
      goto LABEL_118;
LABEL_86:
    v156 = v86 * 1.0;
    v157 = 0xFFF0000000000000;
    v89 = (_QWORD *)sub_19C08E240((uint64_t)v15, (uint64_t)&v156);
    v90 = *(double *)(v89[3] + 8);
    v156 = v84 * 1.0;
    v157 = 0xFFF0000000000000;
    for (i = (_QWORD *)sub_19C08E240((uint64_t)v15, (uint64_t)&v156); i != v89; i = sub_19C08DE2C(i))
    {
      v93 = (double *)i[3];
      v94 = *v93;
      v95 = v93[1];
      if (v95 <= v85 + (*v93 - v84) * (v90 - v85) * (1.0 / (v86 - v84)))
      {
        if ((_DWORD)v87 && (v96 = (double *)v78[(int)v87 - 1], v94 == *v96))
        {
          if (v95 <= v96[1])
          {
            if (v79 != 1)
            {
              v107 = (int)v87;
              LODWORD(v87) = v87 + 1;
              v78[v107] = v93;
            }
          }
          else
          {
            v156 = v94 * 1.0;
            v157 = 0xFFF0000000000000;
            v97 = (_QWORD *)sub_19C08E240((uint64_t)v15, (uint64_t)&v156);
            i = sub_19C08E314(v97);
          }
        }
        else
        {
          v98 = v87 - 2;
          v99 = v87;
          if ((int)v87 >= 1)
            v100 = 1;
          else
            v100 = v87;
LABEL_99:
          if (v99 < 2)
          {
            v92 = v100;
          }
          else
          {
            v92 = v99;
            v101 = v98;
            v102 = (double *)v78[--v99];
            while (v101 * 8)
            {
              v103 = (double *)v78[v101];
              v104 = v103[1];
              v105 = v102[1];
              --v101;
              _ZF = *v103 == *v102 && v104 == v105;
              if (!_ZF)
              {
                --v98;
                if ((v104 - v105) * (v94 - *v103) + (v95 - v104) * (*v102 - *v103) < 0.0)
                  goto LABEL_99;
                break;
              }
            }
          }
          LODWORD(v87) = v92 + 1;
          v78[v92] = v93;
        }
      }
    }
    if (v79 == 1)
    {
      v78[(int)v87] = v89[3];
      LODWORD(v87) = v87 + 1;
    }
    else
    {
      v87 = (int)v87;
      v108 = (double *)v89[3];
      while (1)
      {
        v78[v87] = v108;
        v109 = sub_19C08DE2C(v89);
        if (!v109)
          break;
        v89 = v109;
        v108 = (double *)v109[3];
        if (*v108 != v86)
          break;
        ++v87;
        if (v108[1] != v90)
          goto LABEL_118;
      }
      LODWORD(v87) = v87 + 1;
    }
    goto LABEL_118;
  }
LABEL_167:
  sub_19C08DD38((uint64_t)v15);
  free(ptr[0]);
  free(v151[1]);
  free(v151[0]);
  *a7 = __dst[0];
  return v74;
}

uint64_t sub_19C24377C(double *a1, int *a2)
{
  double *v3;
  uint64_t v4;
  size_t v5;
  const void *v6;
  double *v7;
  double v8;
  uint64_t v9;
  int v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  unsigned int v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t *v18;
  int32x4_t v19;
  uint64_t v20;
  int32x4_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  double *v26;
  size_t v27;
  double v28;
  uint64_t v29;
  int v30;
  int32x4_t *v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  size_t v44;
  uint64_t i;
  uint64_t v47;
  _UNKNOWN **v48;
  size_t v49;
  double v50;
  size_t v51;
  double v52;
  float64x2_t *v53;
  float64x2_t v54;
  uint64_t v55;
  float64x2_t v56;
  size_t v57;
  double *v58;
  double v59;
  float64x2_t *v60;
  float64x2_t v61;
  uint64_t v62;
  float64x2_t v63;
  size_t v64;
  double *v65;
  double v66;
  float v67;
  int v68;
  size_t v69;
  double *v70;
  double *v71;
  double v72;
  uint64_t v73;
  uint64_t v74;
  int32x4_t v75;
  int32x4_t *v76;
  int32x4_t v77;
  int32x4_t v78;
  uint64_t v79;
  uint64_t v80;
  _UNKNOWN **v81;
  uint64_t v82;
  double *v83;
  size_t v84;
  double *v85;
  double *v86;
  uint64_t v87;
  uint64_t v88;
  double v89;
  uint64_t v90;
  double v91;
  float64x2_t v92;
  uint64_t v93;
  float64x2_t *v94;
  float64x2_t v95;
  size_t v96;
  double *v97;
  double v98;
  float64x2_t v99;
  uint64_t v100;
  float64x2_t *v101;
  float64x2_t v102;
  size_t v103;
  double *v104;
  double v105;
  float v106;
  int v107;
  double *v108;
  uint64_t v109;
  uint64_t v110;
  double *v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  double *v115;
  double v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  float64x2_t *v121;
  uint64_t v122;
  uint64_t v123;
  int64x2_t v124;
  uint64_t v125;
  void *v126;
  double v128;
  uint64_t v129;

  v3 = a1;
  v4 = *a2;
  v5 = *a2;
  v6 = a1 + 3;
  v7 = &a1[v4 + 3];
  v8 = *v7;
  if ((int)v4 <= 1)
  {
    v10 = 0;
    if ((int)v5 >= 1)
      goto LABEL_7;
LABEL_10:
    v15 = 0;
    goto LABEL_18;
  }
  v9 = 0;
  v10 = 0;
  v11 = *v7;
  do
  {
    v12 = a1[v4 + 4 + v9];
    v8 = fmax(v12, v11);
    ++v9;
    if (v12 > v11)
      v10 = v9;
    v11 = v8;
  }
  while (v5 - 1 != v9);
  if ((int)v5 < 1)
    goto LABEL_10;
LABEL_7:
  v13 = v8 * 0.05;
  if (v4 >= 8)
  {
    v16 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v8, 0);
    v17 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v13, 0);
    v14 = v5 & 0xFFFFFFF8;
    v18 = (float64x2_t *)&a1[v4 + 7];
    v19 = 0uLL;
    v20 = v14;
    v21 = 0uLL;
    do
    {
      v23 = v18[-2];
      v22 = v18[-1];
      v25 = *v18;
      v24 = v18[1];
      v18 += 4;
      v19 = vsubq_s32(v19, vuzp1q_s32((int32x4_t)vcgeq_f64(v17, vsubq_f64(v16, v23)), (int32x4_t)vcgeq_f64(v17, vsubq_f64(v16, v22))));
      v21 = vsubq_s32(v21, vuzp1q_s32((int32x4_t)vcgeq_f64(v17, vsubq_f64(v16, v25)), (int32x4_t)vcgeq_f64(v17, vsubq_f64(v16, v24))));
      v20 -= 8;
    }
    while (v20);
    v15 = vaddvq_s32(vaddq_s32(v21, v19));
    if (v14 == v5)
      goto LABEL_18;
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  v26 = &a1[v14 + 3 + v4];
  v27 = v5 - v14;
  do
  {
    v28 = *v26++;
    if (v8 - v28 <= v13)
      ++v15;
    --v27;
  }
  while (v27);
LABEL_18:
  v29 = a2[1];
  v30 = a2[5];
  v128 = v8;
  if (v30 != 1)
  {
    if (!v30)
    {
      if (v15 != (_DWORD)v5)
        goto LABEL_56;
      goto LABEL_21;
    }
    if (v15 >= 2 && v30 == 2)
    {
      v10 = sub_19C23C6A8(v15);
      if ((int)v5 >= 1)
      {
        for (i = 0; v5 != i; ++i)
        {
          if (v128 - v7[i] <= v128 * 0.05)
          {
            if (!v10)
            {
              v10 = i;
              break;
            }
            --v10;
          }
        }
      }
    }
LABEL_56:
    v48 = (_UNKNOWN **)sub_19C08E1C8((uint64_t)(a2 + 26), (uint64_t)v3);
    if (!v48)
      return 0xFFFFFFFFLL;
    v7[v10] = v7[v10] * 0.333333333;
    if (a2[4])
    {
      if ((int)v5 < 1)
      {
        v50 = 0.0;
        goto LABEL_78;
      }
      if (v5 >= 4)
      {
        v49 = v5 & 0x7FFFFFFC;
        v53 = (float64x2_t *)&v3[v4 + 5];
        v54 = 0uLL;
        v55 = v5 & 0xFFFFFFFC;
        v56 = 0uLL;
        do
        {
          v54 = vmaxnmq_f64(v53[-1], v54);
          v56 = vmaxnmq_f64(*v53, v56);
          v53 += 2;
          v55 -= 4;
        }
        while (v55);
        v50 = vmaxnmvq_f64(vmaxnmq_f64(v54, v56));
        if (v49 == v5)
        {
LABEL_78:
          v67 = v50 * 0.5;
          *v3 = v67;
          v68 = a2[32];
          a2[32] = v68 + 1;
          v3[2] = (double)v68;
          sub_19C08E8A0((uint64_t)(a2 + 26), v48);
          v69 = 8 * v29;
          v70 = (double *)malloc_type_malloc(8 * v29, 0x100004000313F17uLL);
          if (v70)
          {
            v71 = v70;
            memcpy(v70, v3, v69);
            v71[v10 + 3] = v71[v10 + 3] - v7[v10];
            v72 = (*((double (**)(_QWORD, double *, _QWORD, _QWORD))a2 + 7))(*a2, v71 + 3, 0, *((_QWORD *)a2 + 8));
            if (v72 < *((double *)a2 + 11))
            {
              *((double *)a2 + 11) = v72;
              memcpy(*((void **)a2 + 12), v71 + 3, 8 * *a2);
            }
            v73 = *((_QWORD *)a2 + 6);
            ++**(_DWORD **)(v73 + 56);
            v71[1] = v72;
            if (sub_19C16E7C0(v73))
              goto LABEL_82;
            v74 = *((_QWORD *)a2 + 6);
            if (*((double *)a2 + 11) < *(double *)(v74 + 8))
              goto LABEL_84;
            if (sub_19C16E750(v74))
              goto LABEL_86;
            if (sub_19C16E778(*((_QWORD *)a2 + 6)))
              goto LABEL_123;
            v114 = a2[32];
            a2[32] = v114 + 1;
            v71[2] = (double)v114;
            if (!sub_19C08DE7C((uint64_t)(a2 + 26), (uint64_t)v71))
              goto LABEL_135;
            v115 = (double *)malloc_type_malloc(v69, 0x100004000313F17uLL);
            if (v115)
            {
              v71 = v115;
              memcpy(v115, v3, v69);
              v71[v10 + 3] = v71[v10 + 3] + v7[v10];
              v116 = (*((double (**)(_QWORD, double *, _QWORD, _QWORD))a2 + 7))(*a2, v71 + 3, 0, *((_QWORD *)a2 + 8));
              if (v116 < *((double *)a2 + 11))
              {
                *((double *)a2 + 11) = v116;
                memcpy(*((void **)a2 + 12), v71 + 3, 8 * *a2);
              }
              v117 = *((_QWORD *)a2 + 6);
              ++**(_DWORD **)(v117 + 56);
              v71[1] = v116;
              if (sub_19C16E7C0(v117))
              {
LABEL_82:
                v47 = 4294967291;
LABEL_136:
                free(v71);
                return v47;
              }
              v118 = *((_QWORD *)a2 + 6);
              if (*((double *)a2 + 11) < *(double *)(v118 + 8))
              {
LABEL_84:
                v47 = 2;
                goto LABEL_136;
              }
              if (sub_19C16E750(v118))
              {
LABEL_86:
                v47 = 5;
                goto LABEL_136;
              }
              if (sub_19C16E778(*((_QWORD *)a2 + 6)))
              {
LABEL_123:
                v47 = 6;
                goto LABEL_136;
              }
              v119 = a2[32];
              a2[32] = v119 + 1;
              v71[2] = (double)v119;
              if (sub_19C08DE7C((uint64_t)(a2 + 26), (uint64_t)v71))
                return 1;
LABEL_135:
              v47 = 4294967293;
              goto LABEL_136;
            }
          }
          return 4294967293;
        }
      }
      else
      {
        v49 = 0;
        v50 = 0.0;
      }
      v57 = v5 - v49;
      v58 = &v3[v49 + 3 + v4];
      do
      {
        v59 = *v58++;
        v50 = fmax(v59, v50);
        --v57;
      }
      while (v57);
      goto LABEL_78;
    }
    if ((int)v5 < 1)
    {
      v52 = 0.0;
    }
    else
    {
      if (v5 >= 4)
      {
        v51 = v5 & 0x7FFFFFFC;
        v60 = (float64x2_t *)&v3[v4 + 5];
        v61 = 0uLL;
        v62 = v5 & 0xFFFFFFFC;
        v63 = 0uLL;
        do
        {
          v61 = vmlaq_f64(v61, v60[-1], v60[-1]);
          v63 = vmlaq_f64(v63, *v60, *v60);
          v60 += 2;
          v62 -= 4;
        }
        while (v62);
        v52 = vaddvq_f64(vaddq_f64(v63, v61));
        if (v51 == v5)
          goto LABEL_77;
      }
      else
      {
        v51 = 0;
        v52 = 0.0;
      }
      v64 = v5 - v51;
      v65 = &v3[v51 + 3 + v4];
      do
      {
        v66 = *v65++;
        v52 = v52 + v66 * v66;
        --v64;
      }
      while (v64);
    }
LABEL_77:
    v50 = sqrt(v52);
    goto LABEL_78;
  }
LABEL_21:
  v129 = (uint64_t)&a1[v4 + 3];
  v31 = (int32x4_t *)*((_QWORD *)a2 + 10);
  v126 = (void *)*((_QWORD *)a2 + 9);
  if ((int)v5 <= 0)
    goto LABEL_91;
  v122 = a2[1];
  v32 = v8 * 0.05;
  v124 = vdupq_n_s64(0x7FF0000000000000uLL);
  v33 = *a2;
  v34 = *((_QWORD *)a2 + 9);
  v35 = a1 + 3;
  while (1)
  {
    while (1)
    {
      v36 = v35[v4];
      if (v8 - v36 <= v32)
        break;
      *(int64x2_t *)v34 = v124;
      v34 += 16;
      ++v35;
      if (!--v33)
        goto LABEL_38;
    }
    v37 = *v35;
    *v35 = *v35 + v36 * -0.333333333;
    v38 = (*((double (**)(_QWORD, const void *, _QWORD, _QWORD))a2 + 7))(*a2, v6, 0, *((_QWORD *)a2 + 8));
    if (v38 < *((double *)a2 + 11))
    {
      *((double *)a2 + 11) = v38;
      memcpy(*((void **)a2 + 12), v6, 8 * *a2);
    }
    v39 = *((_QWORD *)a2 + 6);
    ++**(_DWORD **)(v39 + 56);
    *(double *)v34 = v38;
    if (sub_19C16E7C0(v39))
      return 4294967291;
    v40 = *((_QWORD *)a2 + 6);
    if (*((double *)a2 + 11) < *(double *)(v40 + 8))
      return 2;
    if (sub_19C16E750(v40))
      return 5;
    if (sub_19C16E778(*((_QWORD *)a2 + 6)))
      return 6;
    *v35 = v37 + v35[v4] * 0.333333333;
    v41 = (*((double (**)(_QWORD, const void *, _QWORD, _QWORD))a2 + 7))(*a2, v6, 0, *((_QWORD *)a2 + 8));
    if (v41 < *((double *)a2 + 11))
    {
      *((double *)a2 + 11) = v41;
      memcpy(*((void **)a2 + 12), v6, 8 * *a2);
    }
    v42 = *((_QWORD *)a2 + 6);
    ++**(_DWORD **)(v42 + 56);
    *(double *)(v34 + 8) = v41;
    if (sub_19C16E7C0(v42))
      return 4294967291;
    v43 = *((_QWORD *)a2 + 6);
    if (*((double *)a2 + 11) < *(double *)(v43 + 8))
      return 2;
    if (sub_19C16E750(v43))
      return 5;
    if (sub_19C16E778(*((_QWORD *)a2 + 6)))
      return 6;
    *v35++ = v37;
    v8 = v128;
    v34 += 16;
    if (!--v33)
    {
LABEL_38:
      if (v5 < 8)
      {
        v44 = 0;
        v3 = a1;
        v29 = v122;
        goto LABEL_90;
      }
      v44 = v5 & 0x7FFFFFF8;
      v75 = (int32x4_t)xmmword_19C276E70;
      v76 = v31 + 1;
      v77.i64[0] = 0x400000004;
      v77.i64[1] = 0x400000004;
      v78.i64[0] = 0x800000008;
      v78.i64[1] = 0x800000008;
      v79 = v5 & 0xFFFFFFF8;
      v3 = a1;
      v29 = v122;
      do
      {
        v76[-1] = v75;
        *v76 = vaddq_s32(v75, v77);
        v75 = vaddq_s32(v75, v78);
        v76 += 2;
        v79 -= 8;
      }
      while (v79);
      for (; v5 != v44; ++v44)
LABEL_90:
        v31->i32[v44] = v44;
LABEL_91:
      j__qsort_r(v31, v5, 4uLL, v126, (int (__cdecl *)(void *, const void *, const void *))sub_19C244938);
      v80 = sub_19C08E1C8((uint64_t)(a2 + 26), (uint64_t)v3);
      if (v80)
      {
        if (v15)
        {
          v81 = (_UNKNOWN **)v80;
          v82 = 0;
          v83 = v3;
          v84 = 8 * v29;
          v123 = v5 & 0xFFFFFFFC;
          v125 = v15;
          v85 = &v83[v4];
          v121 = (float64x2_t *)(v85 + 5);
          v86 = v85 + 3;
          while (1)
          {
            v87 = 8 * v31->i32[v82];
            *(double *)(v129 + v87) = *(double *)(v129 + v87) * 0.333333333;
            if (!a2[4])
              break;
            if ((int)v5 < 1)
            {
              v89 = 0.0;
            }
            else
            {
              if (v5 >= 4)
              {
                v92 = 0uLL;
                v94 = v121;
                v93 = v5 & 0xFFFFFFFC;
                v95 = 0uLL;
                do
                {
                  v92 = vmaxnmq_f64(v94[-1], v92);
                  v95 = vmaxnmq_f64(*v94, v95);
                  v94 += 2;
                  v93 -= 4;
                }
                while (v93);
                v89 = vmaxnmvq_f64(vmaxnmq_f64(v92, v95));
                v88 = v5 & 0xFFFFFFFC;
                if (v5 == v123)
                  goto LABEL_115;
              }
              else
              {
                v88 = 0;
                v89 = 0.0;
              }
              v96 = v5 - v88;
              v97 = &v86[v88];
              do
              {
                v98 = *v97++;
                v89 = fmax(v98, v89);
                --v96;
              }
              while (v96);
            }
LABEL_115:
            v106 = v89 * 0.5;
            *a1 = v106;
            v107 = a2[32];
            a2[32] = v107 + 1;
            a1[2] = (double)v107;
            v81 = sub_19C08E8A0((uint64_t)(a2 + 26), v81);
            v108 = (double *)malloc_type_malloc(v84, 0x100004000313F17uLL);
            if (!v108)
              return 4294967293;
            v71 = v108;
            memcpy(v108, a1, v84);
            v109 = v31->i32[v82];
            v71[v109 + 3] = v71[v109 + 3] - *(double *)(v129 + 8 * v109);
            v110 = *((_QWORD *)v126 + 2 * v109);
            LODWORD(v109) = a2[32];
            a2[32] = v109 + 1;
            *((_QWORD *)v71 + 1) = v110;
            v71[2] = (double)(int)v109;
            if (!sub_19C08DE7C((uint64_t)(a2 + 26), (uint64_t)v71))
              goto LABEL_135;
            v111 = (double *)malloc_type_malloc(v84, 0x100004000313F17uLL);
            if (!v111)
              return 4294967293;
            v71 = v111;
            memcpy(v111, a1, v84);
            v112 = v31->i32[v82];
            v71[v112 + 3] = v71[v112 + 3] + *(double *)(v129 + 8 * v112);
            v113 = *((_QWORD *)v126 + 2 * v112 + 1);
            LODWORD(v112) = a2[32];
            a2[32] = v112 + 1;
            *((_QWORD *)v71 + 1) = v113;
            v71[2] = (double)(int)v112;
            if (!sub_19C08DE7C((uint64_t)(a2 + 26), (uint64_t)v71))
              goto LABEL_135;
            ++v82;
            v47 = 1;
            if (v82 == v125)
              return v47;
          }
          if ((int)v5 < 1)
          {
            v91 = 0.0;
          }
          else
          {
            if (v5 < 4)
            {
              v90 = 0;
              v91 = 0.0;
              goto LABEL_112;
            }
            v99 = 0uLL;
            v101 = v121;
            v100 = v5 & 0xFFFFFFFC;
            v102 = 0uLL;
            do
            {
              v99 = vmlaq_f64(v99, v101[-1], v101[-1]);
              v102 = vmlaq_f64(v102, *v101, *v101);
              v101 += 2;
              v100 -= 4;
            }
            while (v100);
            v91 = vaddvq_f64(vaddq_f64(v102, v99));
            v90 = v5 & 0xFFFFFFFC;
            if (v5 != v123)
            {
LABEL_112:
              v103 = v5 - v90;
              v104 = &v86[v90];
              do
              {
                v105 = *v104++;
                v91 = v91 + v105 * v105;
                --v103;
              }
              while (v103);
            }
          }
          v89 = sqrt(v91);
          goto LABEL_115;
        }
        return 1;
      }
      return 0xFFFFFFFFLL;
    }
  }
}

uint64_t sub_19C244250(uint64_t a1, uint64_t a2, float64x2_t *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  float64x2_t *v13;
  float64x2_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float64x2_t v18;
  float64x2_t *v19;
  float64x2_t *v20;
  BOOL v22;
  float64x2_t *v24;
  float64x2_t *v25;
  float64x2_t *v26;
  uint64_t v27;
  float64x2_t v28;
  double *v29;
  double *v30;
  double *v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;

  if (!(_DWORD)a1)
  {
    result = (*(uint64_t (**)(uint64_t, _QWORD, float64x2_t *, _QWORD))a4)(a1, *(_QWORD *)(a4 + 16), a3, *(_QWORD *)(a4 + 8));
    if (!a3)
      return result;
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(a4 + 24);
  v8 = *(_QWORD *)(a4 + 32);
  v10 = *(_QWORD *)(a4 + 16);
  if (a1 < 6)
  {
    v11 = 0;
    do
    {
LABEL_4:
      *(double *)(v10 + 8 * v11) = *(double *)(v9 + 8 * v11)
                                 + (*(double *)(v8 + 8 * v11) - *(double *)(v9 + 8 * v11)) * *(double *)(a2 + 8 * v11);
      ++v11;
    }
    while (a1 != v11);
    goto LABEL_5;
  }
  v11 = 0;
  if ((unint64_t)(v10 - v9) < 0x20)
    goto LABEL_4;
  if ((unint64_t)(v10 - a2) < 0x20)
    goto LABEL_4;
  if ((unint64_t)(v10 - v8) < 0x20)
    goto LABEL_4;
  v16 = 0;
  v11 = a1 & 0xFFFFFFFC;
  v17 = (8 * a1) & 0x7FFFFFFE0;
  do
  {
    v18 = vmlaq_f64(*(float64x2_t *)(v9 + 16 + v16), vsubq_f64(*(float64x2_t *)(v8 + 16 + v16), *(float64x2_t *)(v9 + 16 + v16)), *(float64x2_t *)(a2 + 16 + v16));
    v19 = (float64x2_t *)(v10 + v16);
    *v19 = vmlaq_f64(*(float64x2_t *)(v9 + v16), vsubq_f64(*(float64x2_t *)(v8 + v16), *(float64x2_t *)(v9 + v16)), *(float64x2_t *)(a2 + v16));
    v19[1] = v18;
    v16 += 32;
  }
  while (v17 != v16);
  if (v11 != a1)
    goto LABEL_4;
LABEL_5:
  result = (*(uint64_t (**)(uint64_t))a4)(a1);
  if (!a3)
    return result;
LABEL_8:
  if (!(_DWORD)a1)
    return result;
  v13 = *(float64x2_t **)(a4 + 24);
  v14 = *(float64x2_t **)(a4 + 32);
  if (a1 < 8)
  {
    v15 = 0;
LABEL_32:
    v29 = &v14->f64[v15];
    v30 = &v13->f64[v15];
    v31 = &a3->f64[v15];
    v32 = a1 - v15;
    do
    {
      v33 = *v29++;
      v34 = v33;
      v35 = *v30++;
      *v31 = *v31 * (v34 - v35);
      ++v31;
      --v32;
    }
    while (v32);
    return result;
  }
  v15 = 0;
  v20 = (float64x2_t *)((char *)a3 + 8 * a1);
  v22 = (float64x2_t *)&v13->f64[a1] > a3 && v13 < v20;
  if (v14 < v20 && (float64x2_t *)&v14->f64[a1] > a3)
    goto LABEL_32;
  if (v22)
    goto LABEL_32;
  v15 = a1 & 0xFFFFFFFC;
  v24 = v14 + 1;
  v25 = v13 + 1;
  v26 = a3 + 1;
  v27 = v15;
  do
  {
    v28 = vmulq_f64(*v26, vsubq_f64(*v24, *v25));
    v26[-1] = vmulq_f64(v26[-1], vsubq_f64(v24[-1], v25[-1]));
    *v26 = v28;
    v24 += 2;
    v25 += 2;
    v26 += 2;
    v27 -= 4;
  }
  while (v27);
  if (v15 != a1)
    goto LABEL_32;
  return result;
}

uint64_t sub_19C244450(signed int a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, float64x2_t *a6, void **a7, uint64_t a8, double a9, int a10)
{
  float64x2_t *v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  unint64_t v29;
  char *v30;
  unint64_t v31;
  char *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  BOOL v38;
  BOOL v40;
  BOOL v42;
  BOOL v44;
  BOOL v46;
  BOOL v48;
  BOOL v50;
  BOOL v52;
  BOOL v54;
  BOOL v56;
  BOOL v58;
  BOOL v60;
  BOOL v62;
  BOOL v64;
  BOOL v66;
  BOOL v68;
  BOOL v70;
  BOOL v71;
  _QWORD *v72;
  uint64_t v77;
  float64x2_t *v78;
  float64x2_t *v79;
  float64x2_t *v80;
  float64x2_t *v81;
  _OWORD *v82;
  float64x2_t *v83;
  float64x2_t v84;
  float64x2_t v85;
  float64x2_t v86;
  float64x2_t v87;
  float64x2_t v88;
  float64x2_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  BOOL v105;
  float64x2_t *v107;
  float64x2_t *v108;
  float64x2_t *v109;
  uint64_t v110;
  float64x2_t v111;
  double *v112;
  double *v113;
  double *v114;
  uint64_t v115;
  double v116;
  double v117;
  double v118;
  BOOL v120;
  BOOL v121;
  BOOL v122;
  BOOL v123;
  BOOL v124;
  void **v125;
  _QWORD v126[2];
  void *v127;
  unint64_t v128;
  unint64_t v129;

  v126[0] = a2;
  v126[1] = a3;
  v128 = a4;
  v129 = a5;
  v17 = (float64x2_t *)malloc_type_malloc(32 * a1, 0x5F90338DuLL);
  v127 = v17;
  if (v17)
  {
    v18 = a10;
    if (a1 <= 0)
    {
      v26 = *(_QWORD *)(a8 + 40);
      *(_QWORD *)(a8 + 40) = (char *)v17 + 24 * a1;
      v25 = sub_19C242CE0(a1, (double (*)(_QWORD, const void *, _QWORD, uint64_t))sub_19C244250, (uint64_t)v126, (float64x2_t *)((char *)v17 + 8 * a1), &v17[a1], a6, a7, (double *)a8, a9, a10);
      *(_QWORD *)(a8 + 40) = v26;
      goto LABEL_157;
    }
    v19 = (2 * a1);
    v20 = *(_QWORD *)(a8 + 40);
    v21 = 3 * a1;
    v22 = a1;
    v23 = 8 * a1;
    if (a1 < 0x1A)
    {
      v24 = 0;
      goto LABEL_137;
    }
    v125 = a7;
    v24 = 0;
    v27 = (char *)a6 + v23;
    v28 = (char *)&v17->f64[a1];
    v29 = (unint64_t)&v28[v23];
    v30 = (char *)&v17->f64[v19];
    v31 = (unint64_t)&v17->f64[v19 + (unint64_t)v23 / 8];
    v32 = (char *)v17 + 24 * a1;
    v33 = (unint64_t)v17 + 24 * a1 + v23;
    v34 = a4 + v23;
    v35 = a5 + v23;
    v36 = v20 + v23;
    v38 = v31 > (unint64_t)a6 && v30 < v27;
    v124 = v38;
    v40 = v33 > (unint64_t)a6 && v32 < v27;
    v123 = v40;
    v42 = v34 > (unint64_t)a6 && (unint64_t)v27 > a4;
    v122 = v42;
    v44 = v35 > (unint64_t)a6 && (unint64_t)v27 > a5;
    v121 = v44;
    v46 = v36 > (unint64_t)a6 && v20 < (unint64_t)v27;
    v120 = v46;
    v48 = (unint64_t)v28 < v31 && (unint64_t)v30 < v29;
    v50 = (unint64_t)v28 < v33 && (unint64_t)v32 < v29;
    v52 = (unint64_t)v28 < v34 && v29 > a4;
    v54 = (unint64_t)v28 < v35 && v29 > a5;
    v56 = (unint64_t)v28 < v36 && v20 < v29;
    v58 = (unint64_t)v30 < v33 && (unint64_t)v32 < v31;
    v60 = (unint64_t)v30 < v34 && v31 > a4;
    v62 = (unint64_t)v30 < v35 && v31 > a5;
    v64 = (unint64_t)v30 < v36 && v20 < v31;
    v66 = (unint64_t)v32 < v34 && v33 > a4;
    v68 = (unint64_t)v32 < v35 && v33 > a5;
    v70 = (unint64_t)v32 < v36 && v20 < v33;
    v71 = v28 < v27 && v29 > (unint64_t)a6;
    if (v71 || v124 || v123 || v122 || v121 || v120 || v48 || v50)
    {
      v22 = a1;
      v21 = 3 * a1;
      a7 = v125;
      v18 = a10;
      v19 = (2 * a1);
      goto LABEL_137;
    }
    v19 = (2 * a1);
    if (!v52)
    {
      v18 = a10;
      if (v54)
      {
        v22 = a1;
        v21 = 3 * a1;
      }
      else
      {
        v21 = 3 * a1;
        if (!v56 && !v58 && !v60 && !v62 && !v64)
        {
          a7 = v125;
          if (v66 || v68)
          {
            v22 = a1;
          }
          else
          {
            v22 = a1;
            if (!v70)
            {
              v72 = (_QWORD *)&v17->f64[a1];
              v24 = a1 & 0xFFFFFFFE;
              __asm { FMOV            V0.2D, #1.0 }
              v77 = v24;
              v78 = *(float64x2_t **)(a8 + 40);
              v79 = (float64x2_t *)a5;
              v80 = (float64x2_t *)a4;
              v81 = a6;
              v82 = (_OWORD *)&v17->f64[2 * a1];
              v83 = (float64x2_t *)((char *)v17 + 24 * a1);
              do
              {
                v84 = *v80++;
                v85 = v84;
                v86 = vsubq_f64(*v81, v84);
                v87 = *v79++;
                v88 = vsubq_f64(v87, v85);
                *v81++ = vdivq_f64(v86, v88);
                *v72 = 0;
                v72[1] = 0;
                v72 += 2;
                *v82++ = _Q0;
                v89 = *v78++;
                *v83++ = vdivq_f64(v89, v88);
                v77 -= 2;
              }
              while (v77);
              if (v24 == a1)
                goto LABEL_139;
            }
          }
LABEL_137:
          v90 = 0;
          v91 = (char *)&v17->f64[v24 + v21];
          v92 = v24 + v19;
          v93 = v24 + a1;
          v94 = v20 + 8 * v24;
          v95 = a5 + 8 * v24;
          v96 = a4 + 8 * v24;
          v97 = (char *)&a6->f64[v24];
          v98 = v22 - v24;
          v99 = (char *)&v17->f64[v92];
          v100 = (char *)&v17->f64[v93];
          do
          {
            v101 = 8 * v90;
            *(double *)&v97[v101] = (*(double *)&v97[8 * v90] - *(double *)(v96 + 8 * v90))
                                  / (*(double *)(v95 + 8 * v90) - *(double *)(v96 + 8 * v90));
            *(_QWORD *)&v100[v101] = 0;
            *(_QWORD *)&v99[v101] = 0x3FF0000000000000;
            *(double *)&v91[v101] = *(double *)(v94 + 8 * v90)
                                  / (*(double *)(v95 + 8 * v90) - *(double *)(v96 + 8 * v90));
            ++v90;
          }
          while (v98 != v90);
LABEL_139:
          *(_QWORD *)(a8 + 40) = (char *)v17 + 8 * v21;
          v25 = sub_19C242CE0(a1, (double (*)(_QWORD, const void *, _QWORD, uint64_t))sub_19C244250, (uint64_t)v126, (float64x2_t *)((char *)v17 + 8 * a1), (float64x2_t *)((char *)v17 + 8 * v19), a6, a7, (double *)a8, a9, v18);
          *(_QWORD *)(a8 + 40) = v20;
          if (a1 >= 6)
          {
            v102 = 0;
            v103 = (char *)a6 + v23;
            v105 = a5 + v23 > (unint64_t)a6 && (unint64_t)v103 > a5;
            if (((unint64_t)v103 <= a4 || a4 + v23 <= (unint64_t)a6) && !v105)
            {
              v102 = v22 & 0x7FFFFFFC;
              v107 = (float64x2_t *)(a4 + 16);
              v108 = a6 + 1;
              v109 = (float64x2_t *)(a5 + 16);
              v110 = v22 & 0xFFFFFFFC;
              do
              {
                v111 = vmlaq_f64(*v107, vsubq_f64(*v109, *v107), *v108);
                v108[-1] = vmlaq_f64(v107[-1], vsubq_f64(v109[-1], v107[-1]), v108[-1]);
                *v108 = v111;
                v107 += 2;
                v108 += 2;
                v109 += 2;
                v110 -= 4;
              }
              while (v110);
              if (v102 == v22)
                goto LABEL_157;
            }
          }
          else
          {
            v102 = 0;
          }
          v112 = (double *)(a5 + 8 * v102);
          v113 = &a6->f64[v102];
          v114 = (double *)(a4 + 8 * v102);
          v115 = v22 - v102;
          do
          {
            v116 = *v114++;
            v117 = v116;
            v118 = *v112++;
            *v113 = v117 + (v118 - v117) * *v113;
            ++v113;
            --v115;
          }
          while (v115);
LABEL_157:
          free(v127);
          return v25;
        }
        v22 = a1;
      }
      a7 = v125;
      goto LABEL_137;
    }
    v22 = a1;
    v21 = 3 * a1;
    a7 = v125;
    v18 = a10;
    goto LABEL_137;
  }
  return 4294967293;
}

uint64_t sub_19C244938(uint64_t a1, int *a2, int *a3)
{
  double v3;
  double v4;

  v3 = fmin(*(double *)(a1 + 16 * *a2), *(double *)(a1 + 16 * *a2 + 8));
  v4 = fmin(*(double *)(a1 + 16 * *a3), *(double *)(a1 + 16 * *a3 + 8));
  if (v3 < v4)
    return 0xFFFFFFFFLL;
  else
    return v3 > v4;
}

void sub_19C244A00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19C244AF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C244C64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19C244C8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C244F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C244FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C245004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C24501C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C245034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C24504C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C245064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C24507C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_19C24509C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C2450B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2450C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C2450E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C245164(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C245214(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C2452FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_19C245328(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19C245348(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19C245364(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C24548C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_19C2454B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19C2454D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C24558C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C2459A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *__p,void *a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30,void *a31,void *a32,uint64_t a33,void *a34,void *a35,void *a36)
{
  void *v36;
  void *v37;
  uint64_t v38;

  operator delete(__p);
  _Block_object_dispose((const void *)(v38 - 120), 8);

  _Unwind_Resume(a1);
}

void sub_19C245B3C(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  void *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  const char *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;

  v46 = a4;
  v9 = a5;
  if (a3)
  {
    v10 = objc_alloc(MEMORY[0x1E0CC6EE8]);
    v47 = (void *)objc_msgSend_initWithDevice_count_(v10, v11, *(_QWORD *)(a1 + 32), a3);
    v12 = (void *)MEMORY[0x1E0CC6F00];
    v16 = objc_msgSend_rows(*(void **)(a1 + 40), v13, v14, v15);
    v20 = objc_msgSend_columns(*(void **)(a1 + 40), v17, v18, v19);
    v24 = objc_msgSend_rowBytes(*(void **)(a1 + 40), v21, v22, v23);
    v28 = objc_msgSend_dataType(*(void **)(a1 + 40), v25, v26, v27);
    objc_msgSend_matrixDescriptorWithRows_columns_rowBytes_dataType_(v12, v29, v16, v20, v24, v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 104) >= (unint64_t)(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) + a2))
    {
      v32 = 0;
      do
      {
        v33 = objc_alloc(MEMORY[0x1E0CC6ED8]);
        v35 = (void *)objc_msgSend_initWithBuffer_descriptor_(v33, v34, *(_QWORD *)(a1 + 48), (uint64_t)v31);
        objc_msgSend_labels(*(void **)(a1 + 56), v36, v37, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_subarrayWithRange_(v39, v40, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), a2);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v45) = *(_BYTE *)(a1 + 112);
        objc_msgSend_seqTrainingForward_subMatrix_reductionSumResults_alphaVec_labels_rowOffset_computeNRows_computeLossGradient_(*(void **)(a1 + 64), v42, *(_QWORD *)(a1 + 72), (uint64_t)v35, v9, *(_QWORD *)(a1 + 80), v41, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24), a2, v45);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (*(_BYTE *)(a1 + 112))
          objc_msgSend_setCopyOperationAtIndex_sourceMatrix_destinationMatrix_offsets_(v47, v43, v32, (uint64_t)v44, *(_QWORD *)(a1 + 88), 0, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) += a2;
        ++v32;

      }
      while (*(_QWORD *)(a1 + 104) >= (unint64_t)(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24)
                                                        + a2));
    }
    objc_msgSend_encodeToCommandBuffer_copyDescriptor_(v46, v30, *(_QWORD *)(a1 + 72), (uint64_t)v47);

  }
}

void sub_19C245D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_19C246468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  if (a28)
    operator delete(a28);

  _Unwind_Resume(a1);
}

void sub_19C2468A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_19C2468CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19C2469BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C246A98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19C246ACC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

__n128 sub_19C246CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __n128 result;
  __int128 v7;

  *(_QWORD *)a1 = &unk_1E3D226B8;
  *(_QWORD *)(a1 + 8) = a2;
  *(_QWORD *)(a1 + 16) = a4;
  *(_QWORD *)(a1 + 24) = a5;
  *(_QWORD *)(a1 + 32) = a6;
  *(_WORD *)(a1 + 44) = 0;
  result = *(__n128 *)a3;
  v7 = *(_OWORD *)(a3 + 16);
  *(_DWORD *)(a1 + 80) = *(_DWORD *)(a3 + 32);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v7;
  *(_QWORD *)a1 = &unk_1E3D22FD8;
  return result;
}

void sub_19C246D30(uint64_t a1, int a2)
{
  uint64_t v2;
  BOOL v3;
  int v6;
  float *v7;
  const float *v8;
  const float *v9;
  const float *v10;
  vDSP_Length v11;
  const float *p_B;
  const float *v13;
  int v14;
  uint64_t v15;
  const float *v16;
  uint64_t v17;
  const float *v18;
  float __B;

  v2 = **(_QWORD **)(a1 + 24);
  if (v2)
    v3 = a2 < 1;
  else
    v3 = 1;
  if (!v3)
  {
    v6 = 0;
    v7 = (float *)(**(_QWORD **)(a1 + 32) + 4 * *(int *)(a1 + 56));
    v8 = (const float *)(v2 + 4 * *(int *)(a1 + 52));
    v9 = (const float *)(**(_QWORD **)(a1 + 16) + 4 * *(int *)(a1 + 48));
    v10 = (const float *)(a1 + 40);
    do
    {
      v14 = *(_DWORD *)(a1 + 72);
      if (v14 == 2)
      {
        if (*(_BYTE *)(a1 + 44))
        {
          vDSP_vsmul(v9, 1, v10, v7, 1, *(int *)(a1 + 76));
        }
        else if (*(int *)(a1 + 80) < 2)
        {
          vDSP_vmul(v9, 1, v8, 1, v7, 1, *(int *)(a1 + 76));
        }
        else
        {
          v17 = 0;
          v18 = v8;
          do
          {
            vDSP_vsmul(&v9[*(_DWORD *)(a1 + 76) * (int)v17], 1, v18, &v7[*(_DWORD *)(a1 + 76) * (int)v17], 1, *(int *)(a1 + 76));
            ++v17;
            ++v18;
          }
          while (v17 < *(int *)(a1 + 80));
        }
        goto LABEL_10;
      }
      if (v14 == 1)
      {
        if (!*(_BYTE *)(a1 + 44))
        {
          vDSP_vsub(v8, 1, v9, 1, v7, 1, *(int *)(a1 + 76));
          goto LABEL_10;
        }
        __B = -*(float *)(a1 + 40);
        v11 = *(int *)(a1 + 76);
        p_B = &__B;
        v13 = v9;
      }
      else
      {
        if (v14)
          goto LABEL_10;
        if (!*(_BYTE *)(a1 + 44))
        {
          if (*(int *)(a1 + 80) < 2)
          {
            vDSP_vadd(v9, 1, v8, 1, v7, 1, *(int *)(a1 + 76));
          }
          else
          {
            v15 = 0;
            v16 = v8;
            do
            {
              vDSP_vsadd(&v9[*(_DWORD *)(a1 + 76) * (int)v15], 1, v16, &v7[*(_DWORD *)(a1 + 76) * (int)v15], 1, *(int *)(a1 + 76));
              ++v15;
              ++v16;
            }
            while (v15 < *(int *)(a1 + 80));
          }
          goto LABEL_10;
        }
        v11 = *(int *)(a1 + 76);
        v13 = v9;
        p_B = v10;
      }
      vDSP_vsadd(v13, 1, p_B, v7, 1, v11);
LABEL_10:
      v9 += *(int *)(a1 + 60);
      v8 += *(int *)(a1 + 64);
      v7 += *(int *)(a1 + 68);
      ++v6;
    }
    while (v6 != a2);
  }
}

void sub_19C246F7C(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFArrayRef v7;
  CFIndex v8;
  unint64_t v9;
  unint64_t v10;
  CFArrayRef theArray;

  v2 = a2;
  v3 = v2;
  if (v2)
    CFRetain(v2);
  sub_19C1C2F80(&theArray, v3);

  v4 = theArray;
  if (theArray)
  {
    Count = CFArrayGetCount(theArray);
    v6 = Count;
    v7 = theArray;
    if (theArray)
    {
      v8 = CFArrayGetCount(theArray);
      if (!v6)
      {
LABEL_15:
        if (theArray)
          CFRelease(theArray);
        goto LABEL_17;
      }
    }
    else
    {
      v8 = 0;
      if (!Count)
        goto LABEL_15;
    }
    if (v4 == v7)
    {
      v10 = 0;
      do
      {
        if (v8 == v10)
          break;
        sub_19C249574(v4, v10++);
      }
      while (v6 != v10);
    }
    else
    {
      v9 = 0;
      do
        sub_19C249574(v4, v9++);
      while (v6 != v9);
    }
    goto LABEL_15;
  }
LABEL_17:

}

void sub_19C247078(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C24708C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  sub_19C19771C((const void **)va);

  _Unwind_Resume(a1);
}

void sub_19C2470A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  sub_19C19771C((const void **)va);

  _Unwind_Resume(a1);
}

void sub_19C2470BC(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  _DWORD *i;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _DWORD *j;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  void *v88;
  int v89;
  CFIndex v90;
  unint64_t k;
  int v92;
  CFIndex Count;
  unint64_t v94;
  uint64_t v95;
  std::runtime_error *v96;
  std::runtime_error *v97;
  std::runtime_error *v98;
  std::runtime_error *v99;
  std::runtime_error *exception;
  std::runtime_error *v101;
  std::runtime_error *v102;
  std::runtime_error *v103;
  std::runtime_error *v104;
  std::runtime_error *v105;
  std::runtime_error *v106;
  std::runtime_error *v107;
  std::runtime_error *v108;
  std::runtime_error *v109;
  std::runtime_error *v110;
  CFArrayRef theArray;
  CFArrayRef v112;

  v3 = a1;
  v7 = v3;
  switch(*(_QWORD *)a2)
  {
    case 0:
    case 2:
    case 3:
    case 4:
    case 5:
    case 9:
    case 0xDLL:
    case 0xELL:
    case 0x10:
    case 0x17:
      v8 = 0;
      for (i = (_DWORD *)(a2 + 128); ; i += 4)
      {
        objc_msgSend_inputsWithDimensions(v7, v4, v5, v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend_count(v10, v11, v12, v13);

        if (v8 >= v14)
          break;
        objc_msgSend_inputsWithDimensions(v7, v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v18, v19, v8, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        *i = objc_msgSend_tensorSize(v21, v22, v23, v24);
        ++v8;
      }
      v25 = 0;
      for (j = (_DWORD *)(a2 + 256); ; j += 4)
      {
        objc_msgSend_outputsWithDimensions(v7, v15, v16, v17);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend_count(v27, v28, v29, v30);

        if (v25 >= v31)
          break;
        objc_msgSend_outputsWithDimensions(v7, v32, v33, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v35, v36, v25, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        *j = objc_msgSend_tensorSize(v38, v39, v40, v41);
        ++v25;
      }
      break;
    case 1:
      objc_msgSend_inputsWithDimensions(v3, v4, v5, v6);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v80, v81, 0, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dimension(v83, v84, v85, v86);
      v87 = (id)objc_claimAutoreleasedReturnValue();
      v88 = v87;
      if (v87)
        CFRetain(v87);
      sub_19C1C2F80(&v112, v88);

      if (!v112)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      if (CFArrayGetCount(v112) == 2)
      {
        if (!v112)
        {
          v108 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v108, "Could not construct");
          __cxa_throw(v108, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        v89 = sub_19C249634(v112, 0);
        if (!v112)
        {
          v110 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v110, "Could not construct");
          __cxa_throw(v110, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        *(_DWORD *)(a2 + 128) = sub_19C249634(v112, 1uLL) * v89;
      }
      else
      {
        if (!v112)
        {
          v109 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v109, "Could not construct");
          __cxa_throw(v109, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        Count = CFArrayGetCount(v112);
        if (Count)
        {
          v94 = 0;
          v95 = a2 + 128;
          do
          {
            if (!v112)
            {
              v97 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::runtime_error::runtime_error(v97, "Could not construct");
              __cxa_throw(v97, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
            }
            *(_DWORD *)(v95 + 4 * v94) = sub_19C249634(v112, v94);
            ++v94;
          }
          while (Count != v94);
        }
      }
      if (v112)
        CFRelease(v112);
      break;
    case 6:
    case 0xALL:
      objc_msgSend_inputsWithDimensions(v3, v4, v5, v6);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v63, v64, 0, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(a2 + 128) = objc_msgSend_tensorSize(v66, v67, v68, v69);

      objc_msgSend_outputsWithDimensions(v7, v70, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v73, v74, 0, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(a2 + 256) = (unint64_t)objc_msgSend_tensorSize(v76, v77, v78, v79) >> 1;

      break;
    case 0xBLL:
    case 0xCLL:
      objc_msgSend_outputsWithDimensions(v3, v4, v5, v6);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v42, v43, 0, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dimension(v45, v46, v47, v48);
      v49 = (id)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (v49)
        CFRetain(v49);
      sub_19C1C2F80(&v112, v50);

      objc_msgSend_inputsWithDimensions(v7, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v54, v55, 0, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_dimension(v57, v58, v59, v60);
      v61 = (id)objc_claimAutoreleasedReturnValue();
      v62 = v61;
      if (v61)
        CFRetain(v61);
      sub_19C1C2F80(&theArray, v62);

      if (!theArray)
      {
        v98 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v98, "Could not construct");
        __cxa_throw(v98, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      if (CFArrayGetCount(theArray) == 2)
      {
        if (!theArray)
        {
          v101 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v101, "Could not construct");
          __cxa_throw(v101, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        *(_DWORD *)(a2 + 128) = sub_19C249634(theArray, 0);
        *(_DWORD *)(a2 + 132) = 1;
        if (!theArray)
        {
          v103 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v103, "Could not construct");
          __cxa_throw(v103, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        *(_DWORD *)(a2 + 136) = sub_19C249634(theArray, 1uLL);
      }
      else
      {
        if (!theArray)
        {
          v102 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v102, "Could not construct");
          __cxa_throw(v102, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        v90 = CFArrayGetCount(theArray);
        if (v90)
        {
          for (k = 0; k != v90; ++k)
          {
            if (!theArray)
            {
              v96 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
              std::runtime_error::runtime_error(v96, "Could not construct");
              __cxa_throw(v96, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
            }
            *(_DWORD *)(a2 + 128 + 4 * k) = sub_19C249634(theArray, k);
          }
        }
      }
      if (!v112)
      {
        v99 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(v99, "Could not construct");
        __cxa_throw(v99, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      if (CFArrayGetCount(v112) == 3)
      {
        if (!v112)
        {
          v104 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v104, "Could not construct");
          __cxa_throw(v104, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        v92 = sub_19C249634(v112, 2uLL);
      }
      else
      {
        if (!v112)
        {
          v105 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v105, "Could not construct");
          __cxa_throw(v105, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        if (CFArrayGetCount(v112) != 2)
        {
          v106 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v106, "Expected oututDims to have size 3 or 2.");
          __cxa_throw(v106, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        if (!v112)
        {
          v107 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v107, "Could not construct");
          __cxa_throw(v107, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        v92 = sub_19C249634(v112, 1uLL);
      }
      *(_DWORD *)(a2 + 256) = v92;
      if (theArray)
        CFRelease(theArray);
      if (v112)
        CFRelease(v112);
      break;
    default:
      break;
  }

}

void sub_19C2477E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  void *v10;
  void *v11;

  __cxa_free_exception(v11);
  sub_19C19771C(&a10);

  _Unwind_Resume(a1);
}

void sub_19C247A3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  void *v10;

  sub_19C19771C(&a9);
  sub_19C19771C(&a10);

  _Unwind_Resume(a1);
}

void sub_19C247A5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C247A6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C247A80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C247A94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C247AA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C247ABC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C247ACC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C247ADC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C247AF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C247B00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C247B14(_BOOL8 *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  std::runtime_error *exception;
  NSObject *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  std::runtime_error *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  std::string v21;
  uint8_t buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*a1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v4 = objc_retainAutorelease(v3);
  v21.__r_.__value_.__r.__words[0] = objc_msgSend_UTF8String(v4, v5, v6, v7);
  if (!sub_19C2496F4(*a1, &v21.__r_.__value_.__l.__data_))
  {
    sub_19C1A0644();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_retainAutorelease(v4);
      v14 = objc_msgSend_UTF8String(v10, v11, v12, v13);
      sub_19C2565C0(v14, buf, v9);
    }

    v15 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    v16 = objc_retainAutorelease(v4);
    v20 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19);
    sub_19C1C218C("dict does not have key: ", &v20);
    std::runtime_error::runtime_error(v15, &v21);
    __cxa_throw(v15, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }

}

void sub_19C247C6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  int v17;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v17 & 1) == 0)
    {
LABEL_6:

      _Unwind_Resume(a1);
    }
  }
  else if (!v17)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v16);
  goto LABEL_6;
}

void sub_19C247CD0(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t j;
  void *v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const __CFData *v104;
  void *v105;
  _QWORD *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  int v128;
  std::runtime_error *exception;
  std::runtime_error *v130;
  std::runtime_error *v131;
  std::runtime_error *v132;
  std::runtime_error *v133;
  void *v134;
  uint64_t v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  CFTypeRef v140;
  CFTypeRef cf;
  CFTypeRef *v142;
  CFTypeRef v143;
  _BYTE v144[128];
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v135 = (uint64_t)a3;
  bzero(a3, 0x2C0uLL);
  v134 = v5;
  objc_msgSend_nodeStr(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = sub_19C251F40(v9);

  for (i = 7; ; ++i)
  {
    objc_msgSend_activations(v134, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_count(v14, v15, v16, v17);

    if (i - 7 >= v18)
      break;
    objc_msgSend_activations(v134, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v22, v23, i - 7, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    a3[i] = sub_19C252454(v25);
  }
  objc_msgSend_properties(v134, v19, v20, v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  a3[15] = sub_19C252C58(v26, v27, v28, v29);

  objc_msgSend_properties(v134, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  a3[6] = sub_19C2526F8(v33, v34, v35, v36);

  objc_msgSend_properties(v134, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  a3[4] = sub_19C252AB8(v40, v41, v42, v43);

  objc_msgSend_properties(v134, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  a3[5] = sub_19C252B88(v47, v48, v49, v50);

  a3[2] = 0;
  a3[3] = 0;
  objc_msgSend_properties(v134, v51, v52, v53);
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
    CFRetain(v54);
  sub_19C0987C4(&v143, v55);

  v142 = &v143;
  v56 = *a3;
  if (v56 == sub_19C248568("LSTM"))
  {
    objc_msgSend_properties(v134, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v60, v61, (uint64_t)off_1EE418B98, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_exMRL_numberForKey_(v63, v64, (uint64_t)off_1EE418BB8, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    *((_DWORD *)a3 + 80) = objc_msgSend_unsignedIntegerValue(v66, v67, v68, v69);

    objc_msgSend_exMRL_numberForKey_(v63, v70, (uint64_t)off_1EE418BC0, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v72, v73, v74, v75);
    *((_DWORD *)a3 + 108) = v76;

    objc_msgSend_exMRL_numberForKey_(v63, v77, (uint64_t)off_1EE418BC8, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v79, v80, v81, v82);
    *((_DWORD *)a3 + 109) = v83;

  }
  else
  {
    v84 = *a3;
    if (v84 == sub_19C248568("Embedding") || (v85 = *a3, v85 == sub_19C248568("EmbeddingLegacy")))
    {
      sub_19C248AB0((CFArrayRef *)&cf, &v142, off_1EE418B88);
      if (!cf)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "Could not construct");
        __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      *((_DWORD *)a3 + 80) = sub_19C249634((const __CFArray *)cf, 0);
      if (cf)
        CFRelease(cf);
    }
    else
    {
      v111 = *a3;
      v112 = sub_19C248568("Pooling");
      v113 = *a3;
      v114 = sub_19C248568("Convolution");
      if (v111 == v112 || v113 == v114)
      {
        sub_19C248AB0((CFArrayRef *)&cf, &v142, off_1EE418BA0);
        if (!cf)
        {
          v130 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v130, "Could not construct");
          __cxa_throw(v130, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        *(_DWORD *)(v135 + 320) = sub_19C249634((const __CFArray *)cf, 0);
        if (!cf)
        {
          v131 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v131, "Could not construct");
          __cxa_throw(v131, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        *(_DWORD *)(v135 + 324) = sub_19C249634((const __CFArray *)cf, 1uLL);
        sub_19C248AB0((CFArrayRef *)&v140, &v142, off_1EE418BA8);
        if (!v140)
        {
          v132 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v132, "Could not construct");
          __cxa_throw(v132, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        *(_DWORD *)(v135 + 328) = sub_19C249634((const __CFArray *)v140, 0);
        if (!v140)
        {
          v133 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v133, "Could not construct");
          __cxa_throw(v133, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
        }
        *(_DWORD *)(v135 + 332) = sub_19C249634((const __CFArray *)v140, 1uLL);
        if (v140)
          CFRelease(v140);
        if (cf)
          CFRelease(cf);
      }
      else if (*(_QWORD *)v135 == 2 && *(_QWORD *)(v135 + 56) == 6)
      {
        objc_msgSend_properties(v134, v115, v116, v117);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v118, v119, (uint64_t)off_1EE418B98, v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectForKeyedSubscript_(v121, v122, (uint64_t)off_1EE418BB0, v123);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_floatValue(v124, v125, v126, v127);
        *(_DWORD *)(v135 + 384) = v128;

      }
    }
  }
  sub_19C2470BC(v134, v135);
  if (a2)
  {
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    objc_msgSend_weights(v134, v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v90, (uint64_t)&v136, (uint64_t)v144, 16);
    if (v94)
    {
      v95 = *(_QWORD *)v137;
      do
      {
        for (j = 0; j != v94; ++j)
        {
          if (*(_QWORD *)v137 != v95)
            objc_enumerationMutation(v89);
          v97 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * j);
          v98 = (uint64_t (*)(uint64_t, uint64_t))off_1EE41AA20;
          objc_msgSend_index(v97, v91, v92, v93);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = objc_msgSend_unsignedIntegerValue(v99, v100, v101, v102);
          v104 = (const __CFData *)v98(a2, v103);

          if (v104)
          {
            objc_msgSend_name(v97, v91, v92, v93);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = (_QWORD *)sub_19C252CA8(v105, v135);

            if (v106)
            {
              *v106 = CFDataGetBytePtr(v104);
              objc_msgSend_dimension(v97, v107, v108, v109);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              sub_19C246F7C((uint64_t)v110, v110);

            }
            CFRelease(v104);
          }
        }
        v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(v89, v91, (uint64_t)&v136, (uint64_t)v144, 16);
      }
      while (v94);
    }

  }
  if (v143)
    CFRelease(v143);

}

void sub_19C2483B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, const void *a19, const void *a20,uint64_t a21,const void *a22)
{
  void *v22;

  __cxa_free_exception(v22);
  sub_19C19771C(&a19);
  sub_19C19771C(&a20);
  sub_19C094494(&a22);

  _Unwind_Resume(a1);
}

uint64_t sub_19C248568(const char *a1)
{
  size_t v2;
  size_t v3;
  __int128 *p_dst;
  char v5;
  __int128 *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v20;
  uint64_t v23;
  int v24;
  std::logic_error *exception;
  std::string v28;
  __int128 __dst;
  unint64_t v30;
  const char *v31;

  v31 = a1;
  v2 = strlen(a1);
  if (v2 >= 0x7FFFFFFFFFFFFFF8)
    sub_19C07C774();
  v3 = v2;
  if (v2 >= 0x17)
  {
    v8 = (v2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v2 | 7) != 0x17)
      v8 = v2 | 7;
    v9 = v8 + 1;
    p_dst = (__int128 *)operator new(v8 + 1);
    *((_QWORD *)&__dst + 1) = v3;
    v30 = v9 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
  }
  else
  {
    HIBYTE(v30) = v2;
    p_dst = &__dst;
    if (!v2)
    {
      LOBYTE(__dst) = 0;
      v5 = HIBYTE(v30);
      if ((SHIBYTE(v30) & 0x80000000) == 0)
        goto LABEL_5;
      goto LABEL_16;
    }
  }
  memcpy(p_dst, a1, v3);
  *((_BYTE *)p_dst + v3) = 0;
  v5 = HIBYTE(v30);
  if ((SHIBYTE(v30) & 0x80000000) == 0)
  {
LABEL_5:
    v6 = &__dst;
    switch(v5)
    {
      case 9:
        goto LABEL_76;
      case 10:
        if ((_QWORD)__dst != 0x6974617669746341 || WORD4(__dst) != 28271)
          goto LABEL_80;
        goto LABEL_88;
      case 11:
LABEL_58:
        if ((_QWORD)__dst == 0x74756C6F766E6F43 && *(_QWORD *)((char *)&__dst + 3) == 0x6E6F6974756C6F76)
          goto LABEL_63;
        break;
      case 13:
LABEL_64:
        if ((_QWORD)__dst == 0x6E657461636E6F43 && *(_QWORD *)((char *)&__dst + 5) == 0x6E6F6974616E6574)
          goto LABEL_69;
        break;
      case 15:
LABEL_70:
        if ((_QWORD)__dst == 0x6E69646465626D45 && *(_QWORD *)((char *)&__dst + 7) == 0x79636167654C676ELL)
          goto LABEL_89;
        break;
      case 18:
        if ((_QWORD)__dst != 0x726F4E6863746142
          || *((_QWORD *)&__dst + 1) != 0x6974617A696C616DLL
          || (unsigned __int16)v30 != 28271)
        {
          v6 = &__dst;
          switch(v5)
          {
            case 9:
              goto LABEL_76;
            case 11:
              goto LABEL_58;
            case 13:
              goto LABEL_64;
            case 15:
              goto LABEL_70;
            default:
              goto LABEL_80;
          }
        }
        goto LABEL_87;
      default:
        goto LABEL_80;
    }
    if (v5 == 9)
    {
      v6 = &__dst;
LABEL_76:
      v23 = *(_QWORD *)v6;
      v24 = *((unsigned __int8 *)v6 + 8);
      if (v23 == 0x6E69646465626D45 && v24 == 103)
      {
        v20 = 23;
        goto LABEL_96;
      }
      goto LABEL_80;
    }
    goto LABEL_80;
  }
LABEL_16:
  v10 = *((_QWORD *)&__dst + 1);
  if (*((_QWORD *)&__dst + 1) == 10 && *(_QWORD *)__dst == 0x6974617669746341 && *(_WORD *)(__dst + 8) == 28271)
  {
LABEL_88:
    v20 = 2;
    goto LABEL_96;
  }
  if (*((_QWORD *)&__dst + 1) == 18)
  {
    if (*(_QWORD *)__dst == 0x726F4E6863746142
      && *(_QWORD *)(__dst + 8) == 0x6974617A696C616DLL
      && *(_WORD *)(__dst + 16) == 28271)
    {
LABEL_87:
      v20 = 1;
      goto LABEL_96;
    }
    v10 = *((_QWORD *)&__dst + 1);
  }
  if (v10 == 11)
  {
    if (*(_QWORD *)__dst == 0x74756C6F766E6F43 && *(_QWORD *)(__dst + 3) == 0x6E6F6974756C6F76)
    {
LABEL_63:
      v20 = 11;
      goto LABEL_96;
    }
    v10 = *((_QWORD *)&__dst + 1);
  }
  if (v10 == 13)
  {
    if (*(_QWORD *)__dst == 0x6E657461636E6F43 && *(_QWORD *)(__dst + 5) == 0x6E6F6974616E6574)
    {
LABEL_69:
      v20 = 3;
      goto LABEL_96;
    }
    v10 = *((_QWORD *)&__dst + 1);
  }
  if (v10 == 15)
  {
    if (*(_QWORD *)__dst == 0x6E69646465626D45 && *(_QWORD *)(__dst + 7) == 0x79636167654C676ELL)
    {
LABEL_89:
      v20 = 4;
      goto LABEL_96;
    }
    v10 = *((_QWORD *)&__dst + 1);
  }
  if (v10 == 9)
  {
    v6 = (__int128 *)__dst;
    goto LABEL_76;
  }
LABEL_80:
  if (sub_19C1C20BC(&__dst, "FullConnection"))
  {
    v20 = 0;
  }
  else if (sub_19C1C20BC(&__dst, "LSTM"))
  {
    v20 = 5;
  }
  else if (sub_19C1C20BC(&__dst, "LSTMBidirectional"))
  {
    v20 = 6;
  }
  else if (sub_19C1C20BC(&__dst, "GRU"))
  {
    v20 = 9;
  }
  else if (sub_19C1C20BC(&__dst, "GRUBidirectional"))
  {
    v20 = 10;
  }
  else
  {
    if (!sub_19C1C20BC(&__dst, "Pooling"))
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      sub_19C1C218C("Unexpected NodeType: ", &v31);
      std::logic_error::logic_error(exception, &v28);
      exception->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
      __cxa_throw(exception, (struct type_info *)off_1E3D1C4D0, MEMORY[0x1E0DE4360]);
    }
    v20 = 12;
  }
LABEL_96:
  if (SHIBYTE(v30) < 0)
    operator delete((void *)__dst);
  return v20;
}

void sub_19C248A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  int v22;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v22 & 1) == 0)
    {
LABEL_6:
      if (a21 < 0)
        operator delete(a16);
      _Unwind_Resume(a1);
    }
  }
  else if (!v22)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v21);
  goto LABEL_6;
}

void sub_19C248AB0(CFArrayRef *a1, CFTypeRef **a2, void *a3)
{
  id v5;
  CFTypeRef v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary **v10;
  CFTypeRef v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  CFTypeRef v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  std::runtime_error *exception;
  std::runtime_error *v22;
  std::runtime_error *v23;
  std::runtime_error *v24;
  CFTypeRef v25;
  int v26;
  char *v27[2];
  CFTypeRef v28;
  char v29;
  CFTypeRef v30;
  CFTypeRef cf;
  CFTypeRef v32;

  v5 = a3;
  v6 = **a2;
  if (v6)
    CFRetain(**a2);
  v32 = v6;
  sub_19C247B14((_BOOL8 *)&v32, off_1EE418B98);
  if (v6)
    CFRelease(v6);
  v10 = (const __CFDictionary **)*a2;
  if (!*v10)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v28 = (CFTypeRef)objc_msgSend_UTF8String(off_1EE418B98, v7, v8, v9);
  sub_19C248E54(*v10, (char **)&v28, &cf);
  v11 = cf;
  if (cf)
    CFRetain(cf);
  v30 = v11;
  sub_19C247B14((_BOOL8 *)&v30, v5);
  if (v11)
    CFRelease(v11);
  if (!cf)
  {
    v22 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v22, "Could not construct");
    __cxa_throw(v22, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v12 = objc_retainAutorelease(v5);
  v27[0] = (char *)objc_msgSend_UTF8String(v12, v13, v14, v15);
  sub_19C248F70((const __CFDictionary *)cf, v27, (uint64_t)&v28);
  if (v29)
  {
    v16 = v28;
    if (v28)
      CFRetain(v28);
    v25 = v16;
    sub_19C247B14((_BOOL8 *)&v25, CFSTR("dim"));
    if (v16)
      CFRelease(v16);
    if (!v28)
    {
      v23 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v23, "Could not construct");
      __cxa_throw(v23, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    sub_19C24945C((const __CFDictionary *)v28, "dim", a1);
    if (!v29)
      goto LABEL_23;
LABEL_21:
    if (v28)
      CFRelease(v28);
    goto LABEL_23;
  }
  if (!cf)
  {
    v24 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v24, "Could not construct");
    __cxa_throw(v24, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v17 = objc_retainAutorelease(v12);
  v27[0] = (char *)objc_msgSend_UTF8String(v17, v18, v19, v20);
  v26 = sub_19C248FFC((const __CFDictionary *)cf, v27);
  v27[0] = (char *)&v26;
  v27[1] = (char *)1;
  *a1 = sub_19C249094((uint64_t)v27);
  if (v29)
    goto LABEL_21;
LABEL_23:
  if (cf)
    CFRelease(cf);

}

void sub_19C248D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  void *v6;
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  va_list va1;

  va_start(va1, a6);
  va_start(va, a6);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  sub_19C248E1C((uint64_t)va);
  sub_19C094494((const void **)va1);

  _Unwind_Resume(a1);
}

void sub_19C248E00()
{
  JUMPOUT(0x19C248DF0);
}

void sub_19C248E0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_19C248E1C(uint64_t a1)
{
  const void *v2;

  if (*(_BYTE *)(a1 + 8))
  {
    v2 = *(const void **)a1;
    if (*(_QWORD *)a1)
      CFRelease(v2);
  }
  return a1;
}

_QWORD *sub_19C248E54@<X0>(const __CFDictionary *a1@<X0>, char **a2@<X1>, _QWORD *a3@<X8>)
{
  const void *v4;
  const void *v5;
  std::runtime_error *exception;

  v4 = sub_19C248ECC(a1, a2);
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19C1C3994(exception);
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v5 = v4;
  CFRetain(v4);
  return sub_19C0987C4(a3, v5);
}

void sub_19C248EB4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

const void *sub_19C248ECC(const __CFDictionary *a1, char **a2)
{
  const void *Value;
  void *v4;
  void *key;

  sub_19C21CF74((CFStringRef *)&key, *a2);
  if (!a1)
  {
    v4 = key;
    if (!key)
      goto LABEL_6;
    goto LABEL_5;
  }
  Value = CFDictionaryGetValue(a1, key);
  v4 = key;
  if (key)
LABEL_5:
    CFRelease(v4);
LABEL_6:
  if (a1)
    return Value;
  else
    return 0;
}

void sub_19C248F70(const __CFDictionary *a1@<X0>, char **a2@<X1>, uint64_t a3@<X8>)
{
  const void *v4;
  const void *v5;
  CFTypeID v6;

  v4 = sub_19C248ECC(a1, a2);
  if (v4)
  {
    v5 = v4;
    CFRetain(v4);
    v6 = CFGetTypeID(v5);
    if (v6 == CFDictionaryGetTypeID())
    {
      *(_QWORD *)a3 = v5;
      *(_BYTE *)(a3 + 8) = 1;
      return;
    }
    CFRelease(v5);
  }
  *(_BYTE *)a3 = 0;
  *(_BYTE *)(a3 + 8) = 0;
}

uint64_t sub_19C248FFC(const __CFDictionary *a1, char **a2)
{
  const void *v2;
  uint64_t result;
  std::runtime_error *exception;

  v2 = sub_19C248ECC(a1, a2);
  if (!v2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19C1C3994(exception);
    goto LABEL_6;
  }
  result = sub_19C09B5E4((uint64_t)v2);
  if ((result & 0xFF00000000) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19C0992E0(exception);
LABEL_6:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  return result;
}

void sub_19C24906C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_19C249080(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

CFArrayRef sub_19C249094(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  int *v4;
  CFNumberRef *v5;
  uint64_t v6;
  CFArrayRef v7;
  CFNumberRef *v8;
  CFNumberRef *v9;
  void *v10;
  const void *v11;
  const void *v12;
  void *__p;
  CFNumberRef *v15;
  unint64_t v16;

  v2 = *(_QWORD *)(a1 + 8);
  __p = 0;
  v15 = 0;
  v16 = 0;
  sub_19C09ACF8((uint64_t)&__p, v2);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3)
  {
    v4 = *(int **)a1;
    v5 = v15;
    v6 = 4 * v3;
    do
    {
      if ((unint64_t)v5 >= v16)
        v5 = sub_19C2491C0((CFNumberRef **)&__p, v4);
      else
        sub_19C2493B0((uint64_t)&v16, v5++, v4);
      v15 = v5;
      ++v4;
      v6 -= 4;
    }
    while (v6);
  }
  v7 = sub_19C09AE70((char **)&__p);
  v8 = (CFNumberRef *)__p;
  if (__p)
  {
    v9 = v15;
    v10 = __p;
    if (v15 != __p)
    {
      do
      {
        v12 = *--v9;
        v11 = v12;
        if (v12)
          CFRelease(v11);
      }
      while (v9 != v8);
      v10 = __p;
    }
    v15 = v8;
    operator delete(v10);
  }
  return v7;
}

void sub_19C24918C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_19C09B000((void **)va);
  _Unwind_Resume(a1);
}

void sub_19C2491A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_19C09B000((void **)va);
  _Unwind_Resume(a1);
}

CFNumberRef *sub_19C2491C0(CFNumberRef **a1, int *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  CFNumberRef *v9;
  CFNumberRef *v10;
  CFNumberRef *v11;
  CFNumberRef *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFNumberRef *v17;
  CFNumberRef *v18;
  CFNumberRef *v19;
  CFNumberRef *v20;
  uint64_t v21;
  __int128 v22;
  const __CFNumber *v23;
  CFNumberRef *v24;
  const void *v25;
  const void *v26;
  CFNumberRef *v28;
  CFNumberRef *v29;

  v3 = a1[1] - *a1;
  v4 = v3 + 1;
  if ((unint64_t)(v3 + 1) >> 61)
    sub_19C07DA0C();
  v6 = (char *)a1[2] - (char *)*a1;
  if (v6 >> 2 > v4)
    v4 = v6 >> 2;
  if ((unint64_t)v6 >= 0x7FFFFFFFFFFFFFF8)
    v7 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v7 = v4;
  if (v7)
  {
    if (v7 >> 61)
      sub_19C07C7FC();
    v8 = (char *)operator new(8 * v7);
  }
  else
  {
    v8 = 0;
  }
  v28 = (CFNumberRef *)&v8[8 * v3];
  v29 = (CFNumberRef *)&v8[8 * v7];
  sub_19C2493B0((uint64_t)(a1 + 2), v28, a2);
  v9 = v28;
  v10 = v28 + 1;
  v11 = *a1;
  v12 = a1[1];
  if (v12 == *a1)
  {
    *a1 = v28;
    a1[1] = v10;
    a1[2] = v29;
  }
  else
  {
    v13 = (char *)v12 - (char *)*a1 - 8;
    if (v13 < 0x58)
      goto LABEL_18;
    v14 = ((char *)v11 - (char *)v12 + 7) & 0xFFFFFFFFFFFFFFF8;
    if ((CFNumberRef *)((char *)v28 + v14) < v12 && (CFNumberRef *)((char *)v12 + v14) < v28)
      goto LABEL_18;
    v15 = (v13 >> 3) + 1;
    v16 = 8 * (v15 & 0x3FFFFFFFFFFFFFFCLL);
    v17 = &v28[v16 / 0xFFFFFFFFFFFFFFF8];
    v18 = &v12[v16 / 0xFFFFFFFFFFFFFFF8];
    v19 = v12 - 2;
    v20 = v28 - 2;
    v21 = v15 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      v22 = *(_OWORD *)v19;
      *((_OWORD *)v20 - 1) = *((_OWORD *)v19 - 1);
      *(_OWORD *)v20 = v22;
      *((_OWORD *)v19 - 1) = 0uLL;
      *(_OWORD *)v19 = 0uLL;
      v19 -= 4;
      v20 -= 4;
      v21 -= 4;
    }
    while (v21);
    v9 = v17;
    v12 = v18;
    if (v15 != (v15 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_18:
      v17 = v9;
      do
      {
        v23 = *--v12;
        *--v17 = v23;
        *v12 = 0;
      }
      while (v12 != v11);
    }
    v24 = *a1;
    v12 = a1[1];
    *a1 = v17;
    a1[1] = v10;
    a1[2] = v29;
    if (v12 != v24)
    {
      do
      {
        v26 = *--v12;
        v25 = v26;
        if (v26)
          CFRelease(v25);
      }
      while (v12 != v24);
      v12 = v24;
    }
  }
  if (v12)
    operator delete(v12);
  return v28 + 1;
}

void sub_19C249398(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_19C09B06C((uint64_t)va);
  _Unwind_Resume(a1);
}

CFNumberRef sub_19C2493B0(uint64_t a1, CFNumberRef *a2, int *a3)
{
  CFNumberRef result;
  std::runtime_error *exception;
  int valuePtr;

  valuePtr = *a3;
  result = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *a2 = result;
  if (!result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  return result;
}

void sub_19C249430(_Unwind_Exception *exception_object)
{
  CFTypeRef *v1;

  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_19C24945C@<X0>(const __CFDictionary *a1@<X0>, char *a2@<X1>, _QWORD *a3@<X8>)
{
  const void *v4;
  const void *v5;
  std::runtime_error *exception;

  v4 = sub_19C2494D4(a1, a2);
  if (!v4)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19C1C3994(exception);
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  v5 = v4;
  CFRetain(v4);
  return sub_19C1C2F80(a3, v5);
}

void sub_19C2494BC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

const void *sub_19C2494D4(const __CFDictionary *a1, char *a2)
{
  const void *Value;
  void *v4;
  void *key;

  sub_19C21CF74((CFStringRef *)&key, a2);
  if (!a1)
  {
    v4 = key;
    if (!key)
      goto LABEL_6;
    goto LABEL_5;
  }
  Value = CFDictionaryGetValue(a1, key);
  v4 = key;
  if (key)
LABEL_5:
    CFRelease(v4);
LABEL_6:
  if (a1)
    return Value;
  else
    return 0;
}

unint64_t sub_19C249574(const __CFArray *a1, unint64_t a2)
{
  const void *ValueAtIndex;
  unint64_t result;
  char v6;
  std::runtime_error *exception;

  if (!a1 || CFArrayGetCount(a1) <= a2 || (ValueAtIndex = CFArrayGetValueAtIndex(a1, a2)) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19C1C3994(exception);
    goto LABEL_8;
  }
  result = sub_19C09BE78((unint64_t)ValueAtIndex);
  if (!v6)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19C0992E0(exception);
LABEL_8:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  return result;
}

void sub_19C249604(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_19C249620(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_19C249634(const __CFArray *a1, unint64_t a2)
{
  const void *ValueAtIndex;
  uint64_t result;
  std::runtime_error *exception;

  if (!a1 || CFArrayGetCount(a1) <= a2 || (ValueAtIndex = CFArrayGetValueAtIndex(a1, a2)) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19C1C3994(exception);
    goto LABEL_8;
  }
  result = sub_19C09B5E4((uint64_t)ValueAtIndex);
  if ((result & 0xFF00000000) == 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    sub_19C0992E0(exception);
LABEL_8:
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
  }
  return result;
}

void sub_19C2496C4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_19C2496E0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

BOOL sub_19C2496F4(_BOOL8 a1, char **a2)
{
  void *key;

  sub_19C21CF74((CFStringRef *)&key, *a2);
  if (a1)
    a1 = CFDictionaryContainsKey((CFDictionaryRef)a1, key) != 0;
  if (key)
    CFRelease(key);
  return a1;
}

void sub_19C249750(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_19C24976C(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *__src)
{
  int v7;
  int v8;
  int v9;
  BOOL v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *__p[2];
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_19C07C6E8(__p, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    v17 = *(_QWORD *)(a2 + 16);
  }
  sub_19C18E344((uint64_t)a1, (__int128 *)__p, a3, __src);
  if (SHIBYTE(v17) < 0)
    operator delete(__p[0]);
  *a1 = &unk_1E3D23FC8;
  a1[127] = __src[56];
  a1[128] = __src[72];
  a1[129] = __src[57];
  a1[130] = __src[58];
  v7 = *((_DWORD *)__src + 32);
  v8 = *((_DWORD *)__src + 33);
  v9 = *((_DWORD *)__src + 34);
  v10 = v9 * v8 <= 1;
  if (v9 * v8 <= 1)
    v11 = 1;
  else
    v11 = *((_DWORD *)__src + 32);
  if (v9 * v8 <= 1)
    v8 = 1;
  if (!v10)
    v7 = *((_DWORD *)__src + 34);
  v12 = v11;
  v13 = v8;
  v14 = v7;
  v18 = 1;
  v19 = v11;
  v20 = v8;
  v22 = 0;
  v23 = 0;
  v21 = v7;
  sub_19C07C964((uint64_t)(a1 + 2), &v18, (int *)&v24);
  v18 = 9;
  v19 = v12;
  v20 = v13;
  v22 = 0;
  v23 = 0;
  v21 = v14;
  sub_19C07C964((uint64_t)(a1 + 5), &v18, (int *)&v24);
  return a1;
}

void sub_19C2498D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C18E518(v1);
  _Unwind_Resume(a1);
}

void sub_19C2498E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_19C18E518(v1);
  _Unwind_Resume(a1);
}

void sub_19C2498FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_19C249918(_QWORD *a1, uint64_t a2)
{
  void **v4;
  void **v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  v4 = (void **)a1[20];
  v5 = (void **)a1[21];
  if (v4 == v5)
  {
    a1[21] = v4;
    if (!a1[31])
      return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 72))(a2, a1);
    goto LABEL_8;
  }
  do
  {
    if (*v4)
      operator delete(*v4);
    ++v4;
  }
  while (v4 != v5);
  a1[21] = a1[20];
  if (a1[31])
  {
LABEL_8:
    v7 = a1[29];
    v6 = (uint64_t *)a1[30];
    v8 = *v6;
    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v7 + 8);
    **(_QWORD **)(v7 + 8) = v8;
    a1[31] = 0;
    if (v6 != a1 + 29)
    {
      do
      {
        v9 = (uint64_t *)v6[1];
        operator delete(v6);
        v6 = v9;
      }
      while (v9 != a1 + 29);
    }
  }
  return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)a2 + 72))(a2, a1);
}

__n128 sub_19C2499D4(uint64_t a1, int a2)
{
  char *v4;
  uint64_t **v5;
  uint64_t v6;
  char *v7;
  int v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  __n128 result;
  __int128 v13;

  v5 = (uint64_t **)(a1 + 48);
  v4 = *(char **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    while (1)
    {
      while (1)
      {
        v7 = v4;
        v8 = *((_DWORD *)v4 + 8);
        if (v8 <= a2)
          break;
        v4 = *(char **)v7;
        v5 = (uint64_t **)v7;
        if (!*(_QWORD *)v7)
          goto LABEL_8;
      }
      if (v8 >= a2)
        break;
      v4 = (char *)*((_QWORD *)v7 + 1);
      if (!v4)
      {
        v5 = (uint64_t **)(v7 + 8);
        goto LABEL_8;
      }
    }
  }
  else
  {
    v7 = (char *)(a1 + 48);
LABEL_8:
    v9 = v7;
    v7 = (char *)operator new(0x50uLL);
    *((_DWORD *)v7 + 8) = a2;
    *(_OWORD *)(v7 + 40) = 0u;
    *(_OWORD *)(v7 + 56) = 0u;
    *((_QWORD *)v7 + 9) = 0;
    *(_QWORD *)v7 = 0;
    *((_QWORD *)v7 + 1) = 0;
    *((_QWORD *)v7 + 2) = v9;
    *v5 = (uint64_t *)v7;
    v10 = **(_QWORD **)(a1 + 40);
    v11 = (uint64_t *)v7;
    if (v10)
    {
      *(_QWORD *)(a1 + 40) = v10;
      v11 = *v5;
    }
    sub_19C07CC40(*(uint64_t **)(a1 + 48), v11);
    ++*(_QWORD *)(a1 + 56);
  }
  result = *(__n128 *)(v6 + 40);
  v13 = *(_OWORD *)(v6 + 56);
  *((_QWORD *)v7 + 9) = *(_QWORD *)(v6 + 72);
  *(_OWORD *)(v7 + 56) = v13;
  *(__n128 *)(v7 + 40) = result;
  return result;
}

BOOL sub_19C249ABC(uint64_t a1, _QWORD *a2, int a3)
{
  char *v7;
  uint64_t **v8;
  uint64_t **v9;
  char *v10;
  int v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t **v16;
  char *v17;
  int v18;
  char *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  char *v23;
  int v24;
  char *v25;
  uint64_t v26;
  uint64_t *v27;

  if ((a3 - 8) < 0xFFFFFFF9)
    return 0;
  v8 = (uint64_t **)(a1 + 24);
  v7 = *(char **)(a1 + 24);
  v9 = (uint64_t **)(a1 + 24);
  v10 = (char *)(a1 + 24);
  if (v7)
  {
    while (1)
    {
      while (1)
      {
        v10 = v7;
        v11 = *((_DWORD *)v7 + 8);
        if (v11 <= a3)
          break;
        v7 = *(char **)v10;
        v9 = (uint64_t **)v10;
        if (!*(_QWORD *)v10)
          goto LABEL_10;
      }
      if (v11 >= a3)
        break;
      v7 = (char *)*((_QWORD *)v10 + 1);
      if (!v7)
      {
        v9 = (uint64_t **)(v10 + 8);
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v12 = v10;
    v10 = (char *)operator new(0x50uLL);
    *((_DWORD *)v10 + 8) = a3;
    *(_OWORD *)(v10 + 40) = 0u;
    *(_OWORD *)(v10 + 56) = 0u;
    *((_QWORD *)v10 + 9) = 0;
    *(_QWORD *)v10 = 0;
    *((_QWORD *)v10 + 1) = 0;
    *((_QWORD *)v10 + 2) = v12;
    *v9 = (uint64_t *)v10;
    v13 = **(_QWORD **)(a1 + 16);
    v14 = (uint64_t *)v10;
    if (v13)
    {
      *(_QWORD *)(a1 + 16) = v13;
      v14 = *v9;
    }
    sub_19C07CC40(*(uint64_t **)(a1 + 24), v14);
    ++*(_QWORD *)(a1 + 32);
  }
  if (*((_QWORD *)v10 + 5) != *a2)
    return 1;
  v15 = *v8;
  v16 = v8;
  v17 = (char *)v8;
  if (*v8)
  {
    while (1)
    {
      while (1)
      {
        v17 = (char *)v15;
        v18 = *((_DWORD *)v15 + 8);
        if (v18 <= a3)
          break;
        v15 = *(uint64_t **)v17;
        v16 = (uint64_t **)v17;
        if (!*(_QWORD *)v17)
          goto LABEL_21;
      }
      if (v18 >= a3)
        break;
      v15 = (uint64_t *)*((_QWORD *)v17 + 1);
      if (!v15)
      {
        v16 = (uint64_t **)(v17 + 8);
        goto LABEL_21;
      }
    }
  }
  else
  {
LABEL_21:
    v19 = v17;
    v17 = (char *)operator new(0x50uLL);
    *((_DWORD *)v17 + 8) = a3;
    *(_OWORD *)(v17 + 40) = 0u;
    *(_OWORD *)(v17 + 56) = 0u;
    *((_QWORD *)v17 + 9) = 0;
    *(_QWORD *)v17 = 0;
    *((_QWORD *)v17 + 1) = 0;
    *((_QWORD *)v17 + 2) = v19;
    *v16 = (uint64_t *)v17;
    v20 = **(_QWORD **)(a1 + 16);
    v21 = (uint64_t *)v17;
    if (v20)
    {
      *(_QWORD *)(a1 + 16) = v20;
      v21 = *v16;
    }
    sub_19C07CC40(*(uint64_t **)(a1 + 24), v21);
    ++*(_QWORD *)(a1 + 32);
  }
  if (*((_QWORD *)v17 + 6) != a2[1])
    return 1;
  v22 = *v8;
  v23 = (char *)v8;
  if (*v8)
  {
    while (1)
    {
      while (1)
      {
        v23 = (char *)v22;
        v24 = *((_DWORD *)v22 + 8);
        if (v24 <= a3)
          break;
        v22 = *(uint64_t **)v23;
        v8 = (uint64_t **)v23;
        if (!*(_QWORD *)v23)
          goto LABEL_32;
      }
      if (v24 >= a3)
        break;
      v22 = (uint64_t *)*((_QWORD *)v23 + 1);
      if (!v22)
      {
        v8 = (uint64_t **)(v23 + 8);
        goto LABEL_32;
      }
    }
  }
  else
  {
LABEL_32:
    v25 = v23;
    v23 = (char *)operator new(0x50uLL);
    *((_DWORD *)v23 + 8) = a3;
    *(_OWORD *)(v23 + 40) = 0u;
    *(_OWORD *)(v23 + 56) = 0u;
    *((_QWORD *)v23 + 9) = 0;
    *(_QWORD *)v23 = 0;
    *((_QWORD *)v23 + 1) = 0;
    *((_QWORD *)v23 + 2) = v25;
    *v8 = (uint64_t *)v23;
    v26 = **(_QWORD **)(a1 + 16);
    v27 = (uint64_t *)v23;
    if (v26)
    {
      *(_QWORD *)(a1 + 16) = v26;
      v27 = *v8;
    }
    sub_19C07CC40(*(uint64_t **)(a1 + 24), v27);
    ++*(_QWORD *)(a1 + 32);
  }
  return *((_QWORD *)v23 + 7) != a2[2];
}

uint64_t sub_19C249D2C(uint64_t a1, uint64_t a2, __int128 *a3, __int128 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  int64_t v18;
  char *v19;
  char *v20;

  *(_QWORD *)a1 = &unk_1E3D22668;
  *(_QWORD *)(a1 + 8) = a2;
  v11 = *a3;
  v12 = a3[1];
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a3 + 4);
  *(_OWORD *)(a1 + 16) = v11;
  *(_OWORD *)(a1 + 32) = v12;
  v13 = *a4;
  v14 = a4[1];
  v15 = *((_QWORD *)a4 + 4);
  *(_QWORD *)(a1 + 128) = 0;
  *(_OWORD *)(a1 + 72) = v14;
  *(_OWORD *)(a1 + 56) = v13;
  *(_QWORD *)(a1 + 88) = v15;
  *(_QWORD *)(a1 + 96) = a5;
  *(_QWORD *)(a1 + 104) = a6;
  *(_QWORD *)(a1 + 112) = a7;
  *(_QWORD *)(a1 + 120) = a8;
  *(_QWORD *)(a1 + 136) = 0;
  *(_QWORD *)(a1 + 144) = 0;
  v17 = *(const void **)a9;
  v16 = *(_QWORD *)(a9 + 8);
  v18 = v16 - *(_QWORD *)a9;
  if (v16 != *(_QWORD *)a9)
  {
    if (v18 < 0)
      sub_19C07DA0C();
    v19 = (char *)operator new(v16 - (_QWORD)v17);
    *(_QWORD *)(a1 + 128) = v19;
    *(_QWORD *)(a1 + 136) = v19;
    v20 = &v19[4 * (v18 >> 2)];
    *(_QWORD *)(a1 + 144) = v20;
    memcpy(v19, v17, v18);
    *(_QWORD *)(a1 + 136) = v20;
  }
  *(_BYTE *)(a1 + 152) = a10;
  return a1;
}

void sub_19C249DEC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 136) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void sub_19C249E08(uint64_t a1)
{
  unint64_t v2;
  char *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BNNSActivationFunction v8;
  size_t v9;
  size_t v10;
  size_t v11;
  BNNSDataLayout v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  float v16;
  float v17;
  size_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BNNSLayerParametersFullyConnected layer_params;
  BNNSFilterParameters filter_params;

  if (*(_QWORD *)(a1 + 48) * *(_QWORD *)(a1 + 40))
  {
    v2 = 0;
    v3 = **(char ***)(a1 + 112);
    v4 = **(char ***)(a1 + 104);
    v5 = **(char ***)(a1 + 96);
    v21 = 4 * *(_DWORD *)(a1 + 16) * *(_DWORD *)(a1 + 24) * *(_DWORD *)(a1 + 72);
    do
    {
      v7 = *(_QWORD *)(a1 + 120);
      if ((unint64_t)(v7 - 1) > 8)
        v8 = BNNSActivationFunctionIdentity;
      else
        v8 = dword_19C27AFA0[v7 - 1];
      bzero(&filter_params, 0x20uLL);
      filter_params.flags = 1;
      v10 = *(_QWORD *)(a1 + 64);
      v9 = *(_QWORD *)(a1 + 72);
      if (*(_BYTE *)(a1 + 152))
        v11 = *(_QWORD *)(a1 + 64);
      else
        v11 = *(_QWORD *)(a1 + 72);
      if (*(_BYTE *)(a1 + 152))
      {
        v10 = *(_QWORD *)(a1 + 72);
        v12 = BNNSDataLayoutColumnMajorMatrix;
      }
      else
      {
        v12 = BNNSDataLayoutRowMajorMatrix;
      }
      v13 = *(_QWORD *)(a1 + 128);
      v14 = *(_QWORD *)(a1 + 136) - v13;
      v15 = 0;
      v16 = 1.0;
      if (v14 < 5)
      {
        v17 = 1.0;
      }
      else
      {
        v17 = *(float *)v13;
        v16 = *(float *)(v13 + 4);
        if (v14 >= 0xD)
          v15 = *(_QWORD *)(v13 + 8);
      }
      v18 = *(_QWORD *)(a1 + 32);
      layer_params.i_desc.flags = BNNSNDArrayFlagBackpropSet;
      layer_params.i_desc.size[0] = v18;
      layer_params.i_desc.layout = BNNSDataLayoutVector;
      memset(&layer_params.i_desc.size[1], 0, 56);
      layer_params.i_desc.stride[0] = 1;
      memset(&layer_params.i_desc.stride[1], 0, 64);
      layer_params.i_desc.data_type = BNNSDataTypeFloat32;
      *(_OWORD *)(&layer_params.i_desc.data_type + 1) = 0uLL;
      layer_params.i_desc.data_scale = v17;
      *(_QWORD *)&layer_params.i_desc.data_bias = 0;
      layer_params.w_desc.flags = BNNSNDArrayFlagBackpropSet;
      layer_params.w_desc.layout = v12;
      layer_params.w_desc.size[0] = v10;
      layer_params.w_desc.size[1] = v11;
      memset(&layer_params.w_desc.size[2], 0, 48);
      memset(&layer_params.w_desc.stride[1], 0, 56);
      layer_params.w_desc.stride[0] = 1;
      layer_params.w_desc.data = v4;
      layer_params.w_desc.data_type = BNNSDataTypeFloat32;
      *(_OWORD *)(&layer_params.w_desc.data_type + 1) = 0uLL;
      layer_params.w_desc.data_scale = v16;
      *(_QWORD *)&layer_params.w_desc.data_bias = 0;
      *(_QWORD *)&layer_params.o_desc.flags = 0x1000000000000;
      memset(&layer_params.o_desc.size[1], 0, 56);
      layer_params.o_desc.size[0] = v9;
      layer_params.o_desc.stride[0] = 1;
      memset(&layer_params.o_desc.stride[1], 0, 64);
      layer_params.o_desc.data_type = BNNSDataTypeFloat32;
      *(_OWORD *)(&layer_params.o_desc.data_type + 1) = 0uLL;
      layer_params.o_desc.data_scale = 1.0;
      *(_QWORD *)&layer_params.o_desc.data_bias = 0;
      *(_QWORD *)&layer_params.bias.flags = 0x1000000000000;
      memset(layer_params.bias.size, 0, 136);
      layer_params.bias.data_type = BNNSDataTypeFloat32;
      *(_OWORD *)(&layer_params.bias.data_type + 1) = 0uLL;
      layer_params.bias.data_scale = 1.0;
      *(_QWORD *)&layer_params.bias.data_bias = 0;
      layer_params.activation.function = v8;
      *(_QWORD *)&layer_params.activation.alpha = v15;
      memset(&layer_params.activation.iscale, 0, 36);
      v19 = BNNSFilterCreateLayerFullyConnected(&layer_params, &filter_params);
      v20 = v19;
      if (v19)
        BNNSFilterApplyBatch(v19, *(_QWORD *)(a1 + 24), v5, *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 72));
      BNNSFilterDestroy(v20);
      if (*(_QWORD *)(a1 + 88) == 1)
        v6 = 0;
      else
        v6 = *(_DWORD *)(a1 + 56) * *(_DWORD *)(a1 + 64) * *(_DWORD *)(a1 + 72);
      v5 += 4 * *(_DWORD *)(a1 + 16) * *(_DWORD *)(a1 + 24) * *(_DWORD *)(a1 + 32);
      v4 += 4 * v6;
      ++v2;
      v3 += v21;
    }
    while (*(_QWORD *)(a1 + 48) * *(_QWORD *)(a1 + 40) > v2);
  }
}

_QWORD *sub_19C24A118(_QWORD *a1)
{
  void *v2;

  *a1 = &unk_1E3D22668;
  v2 = (void *)a1[16];
  if (v2)
  {
    a1[17] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_19C24A158(_QWORD *__p)
{
  void *v2;

  *__p = &unk_1E3D22668;
  v2 = (void *)__p[16];
  if (v2)
  {
    __p[17] = v2;
    operator delete(v2);
  }
  operator delete(__p);
}

void sub_19C24A198(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _BYTE *v24;
  uint64_t *v25;
  char *v26;
  char *v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _BYTE *v40;
  uint64_t *v41;
  char *v42;
  char *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  _OWORD *v49;
  char *v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  _BYTE *v64;
  uint64_t *v65;
  char *v66;
  char *v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  _OWORD *v73;
  char *v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  unint64_t v87;
  _BYTE *v88;
  uint64_t *v89;
  char *v90;
  char *v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  _OWORD *v97;
  char *v98;
  uint64_t v99;
  __int128 v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t v111;
  _BYTE *v112;
  uint64_t *v113;
  char *v114;
  char *v115;
  unint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  _OWORD *v121;
  char *v122;
  uint64_t v123;
  __int128 v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  unint64_t v135;
  _BYTE *v136;
  uint64_t *v137;
  char *v138;
  char *v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t *v143;
  _OWORD *v144;
  uint64_t *v145;
  uint64_t v146;
  __int128 v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  _OWORD *v151;
  char *v152;
  uint64_t v153;
  __int128 v154;
  uint64_t v155;
  uint64_t v156;
  unsigned int v157;
  _QWORD *v159;
  void *__p;
  void *v161;
  uint64_t v162;

  v8 = a4;
  *a7 = 0;
  a7[1] = 0;
  a7[2] = 0;
  __p = 0;
  v161 = 0;
  v162 = 0;
  v12 = (2 * a6);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void **, _QWORD, uint64_t, float))(*(_QWORD *)a1 + 48))(a1, a5, a6, a4, a4, &__p, 0, v12, 0.0);
  v155 = a2;
  v156 = v8;
  v157 = v12;
  if (__p)
  {
    v161 = __p;
    operator delete(__p);
    v15 = a7 + 1;
    v14 = (char *)a7[1];
    v16 = a7[2];
    v159 = a7 + 2;
    if ((unint64_t)v14 < v16)
    {
      *(_QWORD *)v14 = v13;
      v17 = (uint64_t)(v14 + 8);
      goto LABEL_20;
    }
  }
  else
  {
    v14 = 0;
    v16 = 0;
    v15 = a7 + 1;
    v159 = a7 + 2;
  }
  v18 = (char *)*a7;
  v19 = (uint64_t)&v14[-*a7];
  v20 = v19 >> 3;
  v21 = (v19 >> 3) + 1;
  if (v21 >> 61)
    goto LABEL_144;
  v22 = v16 - (_QWORD)v18;
  if (v22 >> 2 > v21)
    v21 = v22 >> 2;
  if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFF8)
    v23 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v23 = v21;
  if (v23)
  {
    if (v23 >> 61)
      goto LABEL_145;
    v24 = operator new(8 * v23);
    v25 = (uint64_t *)&v24[8 * v20];
    v26 = &v24[8 * v23];
    *v25 = v13;
    v17 = (uint64_t)(v25 + 1);
    v27 = (char *)(v14 - v18);
    if (v14 != v18)
    {
LABEL_14:
      v28 = (unint64_t)(v27 - 8);
      if (v28 >= 0x58 && (unint64_t)(v14 - v24 - v19) >= 0x20)
      {
        v149 = (v28 >> 3) + 1;
        v150 = 8 * (v149 & 0x3FFFFFFFFFFFFFFCLL);
        v29 = &v14[-v150];
        v25 = (uint64_t *)((char *)v25 - v150);
        v151 = &v24[8 * v20 - 16];
        v152 = v14 - 16;
        v153 = v149 & 0x3FFFFFFFFFFFFFFCLL;
        v8 = v156;
        do
        {
          v154 = *(_OWORD *)v152;
          *(v151 - 1) = *((_OWORD *)v152 - 1);
          *v151 = v154;
          v151 -= 2;
          v152 -= 32;
          v153 -= 4;
        }
        while (v153);
        v12 = v157;
        if (v149 == (v149 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_18:
          v14 = (char *)*a7;
          *a7 = v25;
          a7[1] = v17;
          a7[2] = v26;
          if (!v14)
            goto LABEL_20;
          goto LABEL_19;
        }
      }
      else
      {
        v29 = v14;
        v8 = v156;
        v12 = v157;
      }
      do
      {
        v30 = *((_QWORD *)v29 - 1);
        v29 -= 8;
        *--v25 = v30;
      }
      while (v29 != v18);
      goto LABEL_18;
    }
  }
  else
  {
    v24 = 0;
    v25 = (uint64_t *)(8 * v20);
    v26 = 0;
    *(_QWORD *)(8 * v20) = v13;
    v17 = 8 * v20 + 8;
    v27 = (char *)(v14 - v18);
    if (v14 != v18)
      goto LABEL_14;
  }
  v8 = v156;
  v12 = v157;
  *a7 = v25;
  a7[1] = v17;
  a7[2] = v26;
  if (v14)
LABEL_19:
    operator delete(v14);
LABEL_20:
  *v15 = v17;
  __p = 0;
  v161 = 0;
  v162 = 0;
  v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void **, uint64_t, uint64_t, float))(*(_QWORD *)a1 + 48))(a1, 1, a6, v8, v8, &__p, a6, v12, 0.0);
  if (__p)
  {
    v161 = __p;
    operator delete(__p);
  }
  v32 = (char *)*v15;
  if ((unint64_t)*v15 < *v159)
  {
    *(_QWORD *)v32 = v31;
    v33 = (uint64_t)(v32 + 8);
    goto LABEL_48;
  }
  v34 = (char *)*a7;
  v35 = (uint64_t)&v32[-*a7];
  v36 = v35 >> 3;
  v37 = (v35 >> 3) + 1;
  if (v37 >> 61)
    goto LABEL_144;
  v38 = *v159 - (_QWORD)v34;
  if (v38 >> 2 > v37)
    v37 = v38 >> 2;
  if ((unint64_t)v38 >= 0x7FFFFFFFFFFFFFF8)
    v39 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v39 = v37;
  if (v39)
  {
    if (v39 >> 61)
      goto LABEL_145;
    v40 = operator new(8 * v39);
    v41 = (uint64_t *)&v40[8 * v36];
    v42 = &v40[8 * v39];
    *v41 = v31;
    v33 = (uint64_t)(v41 + 1);
    v43 = (char *)(v32 - v34);
    if (v32 != v34)
    {
LABEL_33:
      v44 = (unint64_t)(v43 - 8);
      if (v44 >= 0x58)
      {
        v45 = v32 - v40 - v35;
        v8 = v156;
        if (v45 >= 0x20)
        {
          v46 = (v44 >> 3) + 1;
          v47 = 8 * (v46 & 0x3FFFFFFFFFFFFFFCLL);
          v48 = &v32[-v47];
          v41 = (uint64_t *)((char *)v41 - v47);
          v49 = &v40[8 * v36 - 16];
          v50 = v32 - 16;
          v51 = v46 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v52 = *(_OWORD *)v50;
            *(v49 - 1) = *((_OWORD *)v50 - 1);
            *v49 = v52;
            v49 -= 2;
            v50 -= 32;
            v51 -= 4;
          }
          while (v51);
          v32 = v48;
          if (v46 == (v46 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_46:
            v32 = (char *)*a7;
            *a7 = v41;
            a7[1] = v33;
            a7[2] = v42;
            LODWORD(v12) = v157;
            if (!v32)
              goto LABEL_48;
            goto LABEL_47;
          }
        }
      }
      else
      {
        v8 = v156;
      }
      do
      {
        v53 = *((_QWORD *)v32 - 1);
        v32 -= 8;
        *--v41 = v53;
      }
      while (v32 != v34);
      goto LABEL_46;
    }
  }
  else
  {
    v40 = 0;
    v41 = (uint64_t *)(8 * v36);
    v42 = 0;
    *(_QWORD *)(8 * v36) = v31;
    v33 = 8 * v36 + 8;
    v43 = (char *)(v32 - v34);
    if (v32 != v34)
      goto LABEL_33;
  }
  v8 = v156;
  *a7 = v41;
  a7[1] = v33;
  a7[2] = v42;
  LODWORD(v12) = v157;
  if (v32)
LABEL_47:
    operator delete(v32);
LABEL_48:
  *v15 = v33;
  sub_19C185710(&__p, 2, a6, 0, a6, 0, a6, v12, a6);
  v54 = (*(uint64_t (**)(uint64_t, void **, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 16))(a1, &__p, v155, v8, a3);
  v55 = v54;
  v56 = (char *)*v15;
  if ((unint64_t)*v15 < *v159)
  {
    *(_QWORD *)v56 = v54;
    v57 = (uint64_t)(v56 + 8);
    goto LABEL_71;
  }
  v58 = (char *)*a7;
  v59 = (uint64_t)&v56[-*a7];
  v60 = v59 >> 3;
  v61 = (v59 >> 3) + 1;
  if (v61 >> 61)
    goto LABEL_144;
  v62 = *v159 - (_QWORD)v58;
  if (v62 >> 2 > v61)
    v61 = v62 >> 2;
  if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8)
    v63 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v63 = v61;
  if (v63)
  {
    if (v63 >> 61)
      goto LABEL_145;
    v64 = operator new(8 * v63);
    v65 = (uint64_t *)&v64[8 * v60];
    v66 = &v64[8 * v63];
    *v65 = v55;
    v57 = (uint64_t)(v65 + 1);
    v67 = (char *)(v56 - v58);
    if (v56 != v58)
    {
LABEL_59:
      v68 = (unint64_t)(v67 - 8);
      if (v68 >= 0x58)
      {
        v69 = v56 - v64 - v59;
        v8 = v156;
        if (v69 >= 0x20)
        {
          v70 = (v68 >> 3) + 1;
          v71 = 8 * (v70 & 0x3FFFFFFFFFFFFFFCLL);
          v72 = &v56[-v71];
          v65 = (uint64_t *)((char *)v65 - v71);
          v73 = &v64[8 * v60 - 16];
          v74 = v56 - 16;
          v75 = v70 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v76 = *(_OWORD *)v74;
            *(v73 - 1) = *((_OWORD *)v74 - 1);
            *v73 = v76;
            v73 -= 2;
            v74 -= 32;
            v75 -= 4;
          }
          while (v75);
          v56 = v72;
          if (v70 == (v70 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_69:
            v56 = (char *)*a7;
            *a7 = v65;
            a7[1] = v57;
            a7[2] = v66;
            LODWORD(v12) = v157;
            if (!v56)
              goto LABEL_71;
            goto LABEL_70;
          }
        }
      }
      else
      {
        v8 = v156;
      }
      do
      {
        v77 = *((_QWORD *)v56 - 1);
        v56 -= 8;
        *--v65 = v77;
      }
      while (v56 != v58);
      goto LABEL_69;
    }
  }
  else
  {
    v64 = 0;
    v65 = (uint64_t *)(8 * v60);
    v66 = 0;
    *(_QWORD *)(8 * v60) = v55;
    v57 = 8 * v60 + 8;
    v67 = (char *)(v56 - v58);
    if (v56 != v58)
      goto LABEL_59;
  }
  v8 = v156;
  *a7 = v65;
  a7[1] = v57;
  a7[2] = v66;
  LODWORD(v12) = v157;
  if (v56)
LABEL_70:
    operator delete(v56);
LABEL_71:
  *v15 = v57;
  sub_19C185710(&__p, 0, a6, 0, 0, 0, a6, v12, a6);
  v78 = (*(uint64_t (**)(uint64_t, void **, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 16))(a1, &__p, a3, v8, a3);
  v79 = v78;
  v80 = (char *)*v15;
  if ((unint64_t)*v15 < *v159)
  {
    *(_QWORD *)v80 = v78;
    v81 = (uint64_t)(v80 + 8);
    goto LABEL_94;
  }
  v82 = (char *)*a7;
  v83 = (uint64_t)&v80[-*a7];
  v84 = v83 >> 3;
  v85 = (v83 >> 3) + 1;
  if (v85 >> 61)
    goto LABEL_144;
  v86 = *v159 - (_QWORD)v82;
  if (v86 >> 2 > v85)
    v85 = v86 >> 2;
  if ((unint64_t)v86 >= 0x7FFFFFFFFFFFFFF8)
    v87 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v87 = v85;
  if (v87)
  {
    if (v87 >> 61)
      goto LABEL_145;
    v88 = operator new(8 * v87);
    v89 = (uint64_t *)&v88[8 * v84];
    v90 = &v88[8 * v87];
    *v89 = v79;
    v81 = (uint64_t)(v89 + 1);
    v91 = (char *)(v80 - v82);
    if (v80 != v82)
    {
LABEL_82:
      v92 = (unint64_t)(v91 - 8);
      if (v92 >= 0x58)
      {
        v93 = v80 - v88 - v83;
        v8 = v156;
        if (v93 >= 0x20)
        {
          v94 = (v92 >> 3) + 1;
          v95 = 8 * (v94 & 0x3FFFFFFFFFFFFFFCLL);
          v96 = &v80[-v95];
          v89 = (uint64_t *)((char *)v89 - v95);
          v97 = &v88[8 * v84 - 16];
          v98 = v80 - 16;
          v99 = v94 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v100 = *(_OWORD *)v98;
            *(v97 - 1) = *((_OWORD *)v98 - 1);
            *v97 = v100;
            v97 -= 2;
            v98 -= 32;
            v99 -= 4;
          }
          while (v99);
          v80 = v96;
          if (v94 == (v94 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_92:
            v80 = (char *)*a7;
            *a7 = v89;
            a7[1] = v81;
            a7[2] = v90;
            LODWORD(v12) = v157;
            if (!v80)
              goto LABEL_94;
            goto LABEL_93;
          }
        }
      }
      else
      {
        v8 = v156;
      }
      do
      {
        v101 = *((_QWORD *)v80 - 1);
        v80 -= 8;
        *--v89 = v101;
      }
      while (v80 != v82);
      goto LABEL_92;
    }
  }
  else
  {
    v88 = 0;
    v89 = (uint64_t *)(8 * v84);
    v90 = 0;
    *(_QWORD *)(8 * v84) = v79;
    v81 = 8 * v84 + 8;
    v91 = (char *)(v80 - v82);
    if (v80 != v82)
      goto LABEL_82;
  }
  v8 = v156;
  *a7 = v89;
  a7[1] = v81;
  a7[2] = v90;
  LODWORD(v12) = v157;
  if (v80)
LABEL_93:
    operator delete(v80);
LABEL_94:
  *v15 = v81;
  sub_19C185710(&__p, 2, a6, 0, a6, 0, v12, v12, v12);
  v102 = (*(uint64_t (**)(uint64_t, void **, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 16))(a1, &__p, v8, v8, v8);
  v103 = v102;
  v104 = (char *)*v15;
  if ((unint64_t)*v15 < *v159)
  {
    *(_QWORD *)v104 = v102;
    v105 = (uint64_t)(v104 + 8);
    goto LABEL_117;
  }
  v106 = (char *)*a7;
  v107 = (uint64_t)&v104[-*a7];
  v108 = v107 >> 3;
  v109 = (v107 >> 3) + 1;
  if (v109 >> 61)
    goto LABEL_144;
  v110 = *v159 - (_QWORD)v106;
  if (v110 >> 2 > v109)
    v109 = v110 >> 2;
  if ((unint64_t)v110 >= 0x7FFFFFFFFFFFFFF8)
    v111 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v111 = v109;
  if (v111)
  {
    if (v111 >> 61)
      goto LABEL_145;
    v112 = operator new(8 * v111);
    v113 = (uint64_t *)&v112[8 * v108];
    v114 = &v112[8 * v111];
    *v113 = v103;
    v105 = (uint64_t)(v113 + 1);
    v115 = (char *)(v104 - v106);
    if (v104 != v106)
    {
LABEL_105:
      v116 = (unint64_t)(v115 - 8);
      if (v116 >= 0x58)
      {
        v117 = v104 - v112 - v107;
        v8 = v156;
        if (v117 >= 0x20)
        {
          v118 = (v116 >> 3) + 1;
          v119 = 8 * (v118 & 0x3FFFFFFFFFFFFFFCLL);
          v120 = &v104[-v119];
          v113 = (uint64_t *)((char *)v113 - v119);
          v121 = &v112[8 * v108 - 16];
          v122 = v104 - 16;
          v123 = v118 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            v124 = *(_OWORD *)v122;
            *(v121 - 1) = *((_OWORD *)v122 - 1);
            *v121 = v124;
            v121 -= 2;
            v122 -= 32;
            v123 -= 4;
          }
          while (v123);
          v104 = v120;
          if (v118 == (v118 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_115:
            v104 = (char *)*a7;
            *a7 = v113;
            a7[1] = v105;
            a7[2] = v114;
            LODWORD(v12) = v157;
            if (!v104)
              goto LABEL_117;
            goto LABEL_116;
          }
        }
      }
      else
      {
        v8 = v156;
      }
      do
      {
        v125 = *((_QWORD *)v104 - 1);
        v104 -= 8;
        *--v113 = v125;
      }
      while (v104 != v106);
      goto LABEL_115;
    }
  }
  else
  {
    v112 = 0;
    v113 = (uint64_t *)(8 * v108);
    v114 = 0;
    *(_QWORD *)(8 * v108) = v103;
    v105 = 8 * v108 + 8;
    v115 = (char *)(v104 - v106);
    if (v104 != v106)
      goto LABEL_105;
  }
  v8 = v156;
  *a7 = v113;
  a7[1] = v105;
  a7[2] = v114;
  LODWORD(v12) = v157;
  if (v104)
LABEL_116:
    operator delete(v104);
LABEL_117:
  *v15 = v105;
  sub_19C185710(&__p, 1, a6, 0, 0, 0, a6, v12, a6);
  v126 = (*(uint64_t (**)(uint64_t, void **, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 16))(a1, &__p, a3, v8, a3);
  v127 = v126;
  v128 = (uint64_t *)*v15;
  if ((unint64_t)*v15 < *v159)
  {
    *v128 = v126;
    v129 = (uint64_t)(v128 + 1);
    goto LABEL_130;
  }
  v130 = (char *)*a7;
  v131 = (uint64_t)v128 - *a7;
  v132 = v131 >> 3;
  v133 = (v131 >> 3) + 1;
  if (v133 >> 61)
LABEL_144:
    sub_19C07DA0C();
  v134 = *v159 - (_QWORD)v130;
  if (v134 >> 2 > v133)
    v133 = v134 >> 2;
  if ((unint64_t)v134 >= 0x7FFFFFFFFFFFFFF8)
    v135 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v135 = v133;
  if (v135)
  {
    if (!(v135 >> 61))
    {
      v136 = operator new(8 * v135);
      v137 = (uint64_t *)&v136[8 * v132];
      v138 = &v136[8 * v135];
      *v137 = v127;
      v129 = (uint64_t)(v137 + 1);
      v139 = (char *)((char *)v128 - v130);
      if (v128 == (uint64_t *)v130)
        goto LABEL_128;
      goto LABEL_132;
    }
LABEL_145:
    sub_19C07C7FC();
  }
  v136 = 0;
  v137 = (uint64_t *)(8 * v132);
  v138 = 0;
  *(_QWORD *)(8 * v132) = v127;
  v129 = 8 * v132 + 8;
  v139 = (char *)((char *)v128 - v130);
  if (v128 == (uint64_t *)v130)
  {
LABEL_128:
    *a7 = v137;
    a7[1] = v129;
    a7[2] = v138;
    if (!v128)
      goto LABEL_130;
LABEL_129:
    operator delete(v128);
    goto LABEL_130;
  }
LABEL_132:
  v140 = (unint64_t)(v139 - 8);
  if (v140 < 0x58)
    goto LABEL_148;
  if ((unint64_t)((char *)v128 - v136 - v131) < 0x20)
    goto LABEL_148;
  v141 = (v140 >> 3) + 1;
  v142 = 8 * (v141 & 0x3FFFFFFFFFFFFFFCLL);
  v143 = &v128[v142 / 0xFFFFFFFFFFFFFFF8];
  v137 = (uint64_t *)((char *)v137 - v142);
  v144 = &v136[8 * v132 - 16];
  v145 = v128 - 2;
  v146 = v141 & 0x3FFFFFFFFFFFFFFCLL;
  do
  {
    v147 = *(_OWORD *)v145;
    *(v144 - 1) = *((_OWORD *)v145 - 1);
    *v144 = v147;
    v144 -= 2;
    v145 -= 4;
    v146 -= 4;
  }
  while (v146);
  v128 = v143;
  if (v141 != (v141 & 0x3FFFFFFFFFFFFFFCLL))
  {
LABEL_148:
    do
    {
      v148 = *--v128;
      *--v137 = v148;
    }
    while (v128 != (uint64_t *)v130);
  }
  v128 = (uint64_t *)*a7;
  *a7 = v137;
  a7[1] = v129;
  a7[2] = v138;
  if (v128)
    goto LABEL_129;
LABEL_130:
  *v15 = v129;
}

void sub_19C24AC08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17)
{
  uint64_t v17;
  void *v19;

  if (__p)
  {
    operator delete(__p);
    v19 = *(void **)v17;
    if (!*(_QWORD *)v17)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else
  {
    v19 = *(void **)v17;
    if (!*(_QWORD *)v17)
      goto LABEL_3;
  }
  *(_QWORD *)(v17 + 8) = v19;
  operator delete(v19);
  _Unwind_Resume(exception_object);
}

void sub_19C24AC68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t **v9;
  uint64_t **v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t **v17;
  uint64_t v18;
  uint64_t **v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t **v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t **v31;
  uint64_t **v32;
  uint64_t *v33;
  uint64_t *v34;
  char v35;
  char v36;
  void *__p;
  uint64_t *v38;
  uint64_t v39;

  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 104))(a2);
  v5 = *(_QWORD *)a2;
  if (!v4)
  {
    v13 = ((*(unsigned int (**)(uint64_t))(v5 + 120))(a2) >> 2) & 1;
    v14 = *(_QWORD *)(a1 + 8);
    v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
    v16 = sub_19C22BA64(a2);
    v17 = sub_19C18FCD8(a2, 1);
    if (*(_BYTE *)(a2 + 1057))
      v18 = a2 + 1040;
    else
      v18 = a2 + 1024;
    v19 = sub_19C18FEB8(a2, 9);
    if (*(_BYTE *)(a2 + 1057))
      v20 = a2 + 1048;
    else
      v20 = a2 + 1032;
    v21 = *(_QWORD *)(a2 + 1016);
    __p = 0;
    v38 = 0;
    v39 = 0;
    v35 = v13;
    v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t **, uint64_t, uint64_t **, uint64_t, uint64_t, void **, char))(*(_QWORD *)v14 + 56))(v14, v15, v16, v17, v18, v19, v20, v21, &__p, v35);
    goto LABEL_11;
  }
  if ((*(uint64_t (**)(uint64_t))(v5 + 104))(a2) == 2)
  {
    v6 = *(_QWORD *)(a1 + 8);
    v7 = *(_QWORD *)(a2 + 1016);
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
    v9 = sub_19C18FCD8(a2, 1);
    v10 = sub_19C18FEB8(a2, 9);
    __p = 0;
    v38 = 0;
    v39 = 0;
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
    v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t **, uint64_t **, void **, _QWORD, uint64_t, float))(*(_QWORD *)v6 + 48))(v6, v7, v8, v9, v10, &__p, 0, v11, *(float *)(a2 + 1088));
LABEL_11:
    v22 = v12;
    if (__p)
    {
      v38 = (uint64_t *)__p;
      operator delete(__p);
    }
    sub_19C190488((_QWORD *)a2, v22);
    return;
  }
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 104))(a2) == 13)
  {
    v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
    v24 = sub_19C190608((_QWORD *)a2, 8 * (int)v23);
    v25 = *(_QWORD *)(a1 + 8);
    v26 = sub_19C18FCD8(a2, 1);
    if (*(_BYTE *)(a2 + 1057))
      v27 = a2 + 1040;
    else
      v27 = a2 + 1024;
    if (*(_BYTE *)(a2 + 1057))
      v28 = a2 + 1048;
    else
      v28 = a2 + 1032;
    __p = 0;
    v38 = 0;
    v39 = 0;
    v36 = 0;
    v29 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t **, uint64_t, char *, uint64_t, _QWORD, void **, char))(*(_QWORD *)v25 + 56))(v25, v23, (2 * v23), v26, v27, v24, v28, 0, &__p, v36);
    if (__p)
    {
      v38 = (uint64_t *)__p;
      operator delete(__p);
    }
    sub_19C190488((_QWORD *)a2, v29);
    v30 = *(_QWORD *)(a1 + 8);
    v31 = sub_19C18FCD8(a2, 1);
    v32 = sub_19C18FEB8(a2, 9);
    sub_19C24A198(v30, (uint64_t)v31, (uint64_t)v32, (uint64_t)v24, *(_QWORD *)(a2 + 1016), v23, &__p);
    v33 = (uint64_t *)__p;
    v34 = v38;
    if (__p != v38)
    {
      do
        sub_19C190488((_QWORD *)a2, *v33++);
      while (v33 != v34);
      v33 = (uint64_t *)__p;
    }
    if (v33)
    {
      v38 = v33;
      operator delete(v33);
    }
  }
}

void sub_19C24AF88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_19C24AFB0(uint64_t a1, _QWORD *a2)
{
  _BYTE *v3;
  _BYTE *v4;
  int64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  _BYTE *v8;
  _BYTE *v9;
  size_t v10;
  _DWORD *v11;
  unsigned int *v12;
  _BYTE *v13;
  unsigned int *v14;
  signed int v15;
  unsigned int *v16;
  signed int v17;
  signed int v18;
  BOOL v19;
  unsigned int v20;
  char *v21;
  char *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(_QWORD *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t **v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t **v42;
  unsigned int v43;
  int v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t **v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t **v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  char *v62;
  unsigned int *v63;
  char *v64;
  uint64_t v65;
  char v66;
  void *__p[2];
  __int128 v69;
  int v70;
  _DWORD *v71;
  uint64_t v72;
  uint64_t v73;
  unsigned int *v74;
  unsigned int *v75;
  unsigned int *v76;

  v66 = (*(uint64_t (**)(_QWORD *))(*a2 + 120))(a2);
  v74 = 0;
  v75 = 0;
  v76 = 0;
  v3 = (_BYTE *)a2[138];
  v4 = (_BYTE *)a2[139];
  v5 = v4 - v3;
  if (v4 == v3)
  {
    v7 = 0;
    v6 = 0;
    v71 = 0;
    v72 = 0;
    v73 = 0;
    v8 = (_BYTE *)a2[135];
    v13 = (_BYTE *)a2[136];
    v10 = v13 - v8;
    if (v13 != v8)
      goto LABEL_4;
LABEL_8:
    v11 = 0;
    v12 = v6;
    if (v6 == v7)
      goto LABEL_16;
    goto LABEL_9;
  }
  if (v5 < 0)
    sub_19C07DA0C();
  v6 = (unsigned int *)operator new(v4 - v3);
  v7 = &v6[v5 >> 2];
  v74 = v6;
  v76 = v7;
  memcpy(v6, v3, v5);
  v75 = v7;
  v71 = 0;
  v72 = 0;
  v73 = 0;
  v8 = (_BYTE *)a2[135];
  v9 = (_BYTE *)a2[136];
  v10 = v9 - v8;
  if (v9 == v8)
    goto LABEL_8;
LABEL_4:
  if ((v10 & 0x8000000000000000) != 0)
    sub_19C07DA0C();
  v11 = operator new(v10);
  v71 = v11;
  memcpy(v11, v8, v10);
  v12 = v6;
  if (v6 != v7)
  {
LABEL_9:
    v14 = v6 + 1;
    v12 = v6;
    if (v6 + 1 != v7)
    {
      v15 = *v6;
      v12 = v6;
      v16 = v6 + 1;
      do
      {
        v18 = *v16++;
        v17 = v18;
        v19 = v15 < v18;
        if (v15 <= v18)
          v15 = v17;
        if (v19)
          v12 = v14;
        v14 = v16;
      }
      while (v16 != v7);
    }
  }
LABEL_16:
  v20 = *v12;
  v63 = v11;
  v62 = sub_19C190608(a2, 4 * *v11);
  v64 = sub_19C190608(a2, 4 * *v6);
  v21 = sub_19C190608(a2, 4 * v20);
  v65 = *((unsigned int *)a2 + 268);
  if ((int)v65 >= 1)
  {
    v22 = v21;
    v23 = 0;
    v24 = 0;
    v25 = -8;
    do
    {
      v26 = *(_QWORD *)(a1 + 8);
      v27 = *(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 72);
      if (v23)
      {
        v28 = v27(a2, 1);
        v29 = v63[v23];
        v30 = sub_19C18FCD8((uint64_t)a2, 1);
        v31 = a2[131] + v25;
        __p[0] = 0;
        __p[1] = 0;
        *(_QWORD *)&v69 = 0;
        LOBYTE(v60) = (v66 & 4) != 0;
        v32 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t **, uint64_t, char *, _QWORD *, _QWORD, void **, int))(*(_QWORD *)v26 + 56))(v26, v28, v29, v30, v31, v62, a2 + 38, 0, __p, v60);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        sub_19C190488(a2, v32);
        v33 = v63[v23];
        v34 = *(_QWORD *)(a1 + 8);
        v35 = v6[v23];
        v36 = a2[128] + v25 + 8;
        v37 = a2[127];
        __p[0] = 0;
        __p[1] = 0;
        *(_QWORD *)&v69 = 0;
        LOBYTE(v61) = (v66 & 4) != 0;
        v38 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t, char *, _QWORD *, uint64_t, void **, int))(*(_QWORD *)v34 + 56))(v34, v33, v35, v62, v36, v22, a2 + 38, v37, __p, v61);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        sub_19C190488(a2, v38);
        v39 = operator new();
        sub_19C185710(__p, 2, v6[v23], 0, v23 - v65 + *v6, 0, v6[v23], 0, v6[v23]);
        *(_QWORD *)v39 = &unk_1E3D226B8;
        *(_QWORD *)(v39 + 8) = 0;
        *(_QWORD *)(v39 + 16) = v22;
        *(_QWORD *)(v39 + 24) = v64;
        *(_QWORD *)(v39 + 32) = v22;
        *(_WORD *)(v39 + 44) = 257;
        v40 = v69;
        *(_OWORD *)(v39 + 48) = *(_OWORD *)__p;
        *(_OWORD *)(v39 + 64) = v40;
        *(_DWORD *)(v39 + 80) = v70;
        sub_19C190488(a2, v39);
        v41 = operator new();
        v42 = sub_19C18FEB8((uint64_t)a2, 9);
        v43 = v6[v23];
        v44 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 80))(a2, 9);
        *(_QWORD *)v41 = &unk_1E3D21E48;
        *(_QWORD *)(v41 + 8) = 0;
        *(_DWORD *)(v41 + 16) = v43;
        *(_DWORD *)(v41 + 20) = 0;
        *(_DWORD *)(v41 + 24) = v24;
        *(_DWORD *)(v41 + 28) = v43;
        if (v44 <= 0)
          v45 = v43;
        else
          v45 = v44;
        *(_DWORD *)(v41 + 32) = v45;
        *(_QWORD *)(v41 + 40) = v22;
        *(_QWORD *)(v41 + 48) = v42;
        sub_19C190488(a2, v41);
        v46 = 0;
      }
      else
      {
        v47 = v27(a2, 1);
        v48 = *v6;
        v49 = sub_19C18FCD8((uint64_t)a2, 1);
        v50 = a2[128];
        v51 = a2[127];
        __p[0] = 0;
        __p[1] = 0;
        *(_QWORD *)&v69 = 0;
        LOBYTE(v60) = (v66 & 4) != 0;
        v52 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t **, uint64_t, char *, _QWORD *, uint64_t, void **, int))(*(_QWORD *)v26 + 56))(v26, v47, v48, v49, v50, v64, a2 + 38, v51, __p, v60);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        sub_19C190488(a2, v52);
        v53 = operator new();
        v54 = sub_19C18FEB8((uint64_t)a2, 9);
        v55 = *v6;
        v56 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 80))(a2, 9);
        v57 = v55 - v65;
        *(_QWORD *)v53 = &unk_1E3D21E48;
        *(_QWORD *)(v53 + 8) = 0;
        *(_QWORD *)(v53 + 16) = (v55 - v65 + 1);
        if (v55 <= 0)
          v58 = v57 + 1;
        else
          v58 = v55;
        *(_DWORD *)(v53 + 24) = v24;
        *(_DWORD *)(v53 + 28) = v58;
        if (v56 <= 0)
          v59 = v57 + 1;
        else
          v59 = v56;
        *(_DWORD *)(v53 + 32) = v59;
        *(_QWORD *)(v53 + 40) = v64;
        *(_QWORD *)(v53 + 48) = v54;
        sub_19C190488(a2, v53);
        v46 = 1 - v65;
      }
      v24 += v46 + v6[v23++];
      v25 += 8;
    }
    while (v65 != v23);
  }
  operator delete(v63);
  operator delete(v6);
}

void sub_19C24B524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  void *v27;

  operator delete(__p);
  if (v27)
    operator delete(v27);
  _Unwind_Resume(a1);
}

void sub_19C24B5B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t **v7;
  uint64_t **v8;
  uint64_t v9;
  int v10;
  char *v11;
  int v12;
  char *v13;
  uint64_t v14;
  int v15;
  uint64_t **v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  int v23;
  float *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t **v29;
  uint64_t **v30;
  uint64_t *v31;
  uint64_t *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t **v38;
  int v39;
  uint64_t v40;
  float *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *__p;
  uint64_t *v46;
  float *v47;

  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 104))(a2) == 2)
  {
    v4 = *(_QWORD *)(a1 + 8);
    v5 = *(_QWORD *)(a2 + 1016);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
    v7 = sub_19C18FCD8(a2, 1);
    v8 = sub_19C18FEB8(a2, 9);
    __p = 0;
    v46 = 0;
    v47 = 0;
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t **, uint64_t **, void **, _QWORD, _QWORD, float))(*(_QWORD *)v4 + 48))(v4, v5, v6, v7, v8, &__p, 0, 0, *(float *)(a2 + 1088));
LABEL_25:
    v44 = v9;
    if (__p)
    {
      v46 = (uint64_t *)__p;
      operator delete(__p);
    }
    sub_19C190488((_QWORD *)a2, v44);
    return;
  }
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
  v11 = sub_19C190608((_QWORD *)a2, 4 * v10);
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
  v13 = sub_19C190608((_QWORD *)a2, v12);
  v14 = operator new();
  v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
  v16 = sub_19C18FCD8(a2, 1);
  *(_DWORD *)(v14 + 16) = 0;
  *(_DWORD *)(v14 + 20) = v15;
  *(_QWORD *)(v14 + 24) = v16;
  *(_QWORD *)(v14 + 32) = v13;
  *(_QWORD *)(v14 + 40) = *(_QWORD *)(a2 + 284);
  *(_QWORD *)v14 = &unk_1E3D23CC0;
  *(_QWORD *)(v14 + 8) = 0;
  *(_QWORD *)(v14 + 48) = v11;
  sub_19C190488((_QWORD *)a2, v14);
  v17 = (float)(*(float *)(a2 + 284) - *(float *)(a2 + 288)) * -0.0039062;
  v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 104))(a2);
  v19 = *(_QWORD *)a2;
  if (!v18)
  {
    v33 = (*(uint64_t (**)(uint64_t))(v19 + 120))(a2);
    v34 = *(_QWORD *)(a1 + 8);
    v35 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
    v36 = sub_19C22BA64(a2);
    v37 = *(unsigned __int8 *)(a2 + 1057);
    v38 = sub_19C18FEB8(a2, 9);
    v39 = *(unsigned __int8 *)(a2 + 1057);
    v40 = *(_QWORD *)(a2 + 1016);
    v41 = (float *)operator new(8uLL);
    if (v39)
      v42 = a2 + 1048;
    else
      v42 = a2 + 1032;
    if (v37)
      v43 = a2 + 1040;
    else
      v43 = a2 + 1024;
    v46 = (uint64_t *)(v41 + 2);
    v47 = v41 + 2;
    *v41 = v17;
    v41[1] = v17;
    __p = v41;
    v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t **, uint64_t, uint64_t, void **, BOOL))(*(_QWORD *)v34 + 88))(v34, v35, v36, v13, v43, v38, v42, v40, &__p, (v33 & 4) != 0);
    goto LABEL_25;
  }
  if ((*(uint64_t (**)(uint64_t))(v19 + 104))(a2) == 13)
  {
    v20 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
    v21 = sub_19C190608((_QWORD *)a2, 8 * (int)v20);
    v22 = *(_QWORD *)(a1 + 8);
    v23 = *(unsigned __int8 *)(a2 + 1057);
    v24 = (float *)operator new(8uLL);
    if (v23)
      v25 = a2 + 1048;
    else
      v25 = a2 + 1032;
    if (v23)
      v26 = a2 + 1040;
    else
      v26 = a2 + 1024;
    v46 = (uint64_t *)(v24 + 2);
    v47 = v24 + 2;
    *v24 = v17;
    v24[1] = v17;
    __p = v24;
    v27 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, char *, uint64_t, char *, uint64_t, _QWORD, void **, _BYTE))(*(_QWORD *)v22 + 88))(v22, v20, (2 * v20), v13, v26, v21, v25, 0, &__p, 0);
    if (__p)
    {
      v46 = (uint64_t *)__p;
      operator delete(__p);
    }
    sub_19C190488((_QWORD *)a2, v27);
    v28 = *(_QWORD *)(a1 + 8);
    v29 = sub_19C18FCD8(a2, 1);
    v30 = sub_19C18FEB8(a2, 9);
    sub_19C24A198(v28, (uint64_t)v29, (uint64_t)v30, (uint64_t)v21, *(_QWORD *)(a2 + 1016), v20, &__p);
    v31 = (uint64_t *)__p;
    v32 = v46;
    if (__p != v46)
    {
      do
        sub_19C190488((_QWORD *)a2, *v31++);
      while (v31 != v32);
      v31 = (uint64_t *)__p;
    }
    if (v31)
    {
      v46 = v31;
      operator delete(v31);
    }
  }
}

void sub_19C24B9AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_19C24B9E0(uint64_t a1, uint64_t a2)
{
  int v3;
  float v4;
  float v5;
  _BYTE *v6;
  _BYTE *v7;
  int64_t v8;
  int *v9;
  int *v10;
  _BYTE *v11;
  _BYTE *v12;
  int64_t v13;
  _DWORD *v14;
  int *v15;
  int *v16;
  int v17;
  int *v18;
  int v19;
  int v20;
  BOOL v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t **v25;
  uint64_t v26;
  int v27;
  float v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  float *v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int *v40;
  _DWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  float *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t **v51;
  int v52;
  int v53;
  int v54;
  int v55;
  uint64_t v56;
  unsigned int *v57;
  _DWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  float *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t **v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  char *v73;
  int *v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  char *v83;
  void *__p[2];
  __int128 v85;
  int v86;
  _DWORD *v87;
  _DWORD *v88;
  _DWORD *v89;
  int *v90;
  int *v91;
  int *v92;

  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
  v75 = sub_19C190608((_QWORD *)a2, v3);
  v4 = *(float *)(a2 + 284);
  v5 = *(float *)(a2 + 288);
  v81 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 120))(a2);
  v90 = 0;
  v91 = 0;
  v92 = 0;
  v6 = *(_BYTE **)(a2 + 1104);
  v7 = *(_BYTE **)(a2 + 1112);
  v8 = v7 - v6;
  if (v7 == v6)
  {
    v10 = 0;
    v9 = 0;
  }
  else
  {
    if (v8 < 0)
      sub_19C07DA0C();
    v9 = (int *)operator new(v7 - v6);
    v10 = &v9[v8 >> 2];
    v90 = v9;
    v92 = v10;
    memcpy(v9, v6, v8);
    v91 = v10;
  }
  v87 = 0;
  v88 = 0;
  v89 = 0;
  v11 = *(_BYTE **)(a2 + 1080);
  v12 = *(_BYTE **)(a2 + 1088);
  v13 = v12 - v11;
  v74 = v9;
  if (v12 == v11)
  {
    v14 = 0;
    v15 = v9;
    if (v9 == v10)
      goto LABEL_17;
    goto LABEL_10;
  }
  if (v13 < 0)
    sub_19C07DA0C();
  v14 = operator new(v12 - v11);
  v87 = v14;
  v89 = &v14[v13 >> 2];
  memcpy(v14, v11, v13);
  v88 = v89;
  v15 = v9;
  if (v9 != v10)
  {
LABEL_10:
    v16 = v9 + 1;
    v15 = v9;
    if (v9 + 1 != v10)
    {
      v17 = *v9;
      v15 = v9;
      v18 = v9 + 1;
      do
      {
        v20 = *v18++;
        v19 = v20;
        v21 = v17 < v20;
        if (v17 <= v20)
          v17 = v19;
        if (v21)
          v15 = v16;
        v16 = v18;
      }
      while (v18 != v10);
    }
  }
LABEL_17:
  v22 = *v15;
  v77 = sub_19C190608((_QWORD *)a2, 4 * *v14);
  v73 = sub_19C190608((_QWORD *)a2, 4 * *v14);
  v76 = sub_19C190608((_QWORD *)a2, *v14);
  v78 = sub_19C190608((_QWORD *)a2, 4 * *v9);
  v83 = sub_19C190608((_QWORD *)a2, 4 * v22);
  v23 = operator new();
  v24 = *v14;
  v25 = sub_19C18FCD8(a2, 1);
  *(_DWORD *)(v23 + 16) = 0;
  *(_DWORD *)(v23 + 20) = v24;
  *(_QWORD *)(v23 + 24) = v25;
  *(_QWORD *)(v23 + 32) = v75;
  *(_QWORD *)(v23 + 40) = *(_QWORD *)(a2 + 284);
  *(_QWORD *)v23 = &unk_1E3D23CC0;
  *(_QWORD *)(v23 + 8) = 0;
  *(_QWORD *)(v23 + 48) = v73;
  sub_19C190488((_QWORD *)a2, v23);
  v79 = *(unsigned int *)(a2 + 1072);
  if ((int)v79 >= 1)
  {
    v26 = 0;
    v27 = 0;
    v28 = (float)(v4 - v5) * -0.0039062;
    v80 = a2 + 304;
    v29 = -8;
    do
    {
      v30 = *(_QWORD *)(a1 + 8);
      v31 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 72);
      if (v26)
      {
        v32 = v31(a2, 1);
        v33 = v14[v26];
        v34 = *(_QWORD *)(a2 + 1048);
        v35 = (float *)operator new(8uLL);
        __p[1] = v35 + 2;
        *(_QWORD *)&v85 = v35 + 2;
        *v35 = v28;
        v35[1] = v28;
        __p[0] = v35;
        LOBYTE(v71) = (v81 & 4) != 0;
        v36 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t, char *, uint64_t, _QWORD, void **, int))(*(_QWORD *)v30 + 88))(v30, v32, v33, v75, v34 + v29, v77, v80, 0, __p, v71);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        sub_19C190488((_QWORD *)a2, v36);
        v37 = operator new();
        v38 = v14[v26];
        *(_DWORD *)(v37 + 16) = 0;
        *(_DWORD *)(v37 + 20) = v38;
        *(_QWORD *)(v37 + 24) = v77;
        *(_QWORD *)(v37 + 32) = v76;
        *(_QWORD *)(v37 + 40) = *(_QWORD *)(a2 + 284);
        *(_QWORD *)v37 = &unk_1E3D23CC0;
        *(_QWORD *)(v37 + 8) = 0;
        *(_QWORD *)(v37 + 48) = v73;
        sub_19C190488((_QWORD *)a2, v37);
        v39 = *(_QWORD *)(a1 + 8);
        v40 = v9;
        v41 = v14;
        v42 = v14[v26];
        v43 = v40[v26];
        v44 = *(_QWORD *)(a2 + 1024);
        v45 = *(_QWORD *)(a2 + 1016);
        v46 = (float *)operator new(8uLL);
        __p[1] = v46 + 2;
        *(_QWORD *)&v85 = v46 + 2;
        *v46 = v28;
        v46[1] = v28;
        __p[0] = v46;
        LOBYTE(v72) = (v81 & 4) != 0;
        v47 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t, char *, uint64_t, uint64_t, void **, int))(*(_QWORD *)v39 + 88))(v39, v42, v43, v76, v44 + v29 + 8, v83, v80, v45, __p, v72);
        v14 = v41;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        v9 = v74;
        sub_19C190488((_QWORD *)a2, v47);
        v48 = operator new();
        sub_19C185710(__p, 2, v9[v26], 0, v26 - v79 + *v9, 0, v9[v26], 0, v9[v26]);
        *(_QWORD *)v48 = &unk_1E3D226B8;
        *(_QWORD *)(v48 + 8) = 0;
        *(_QWORD *)(v48 + 16) = v83;
        *(_QWORD *)(v48 + 24) = v78;
        *(_QWORD *)(v48 + 32) = v83;
        *(_WORD *)(v48 + 44) = 257;
        v49 = v85;
        *(_OWORD *)(v48 + 48) = *(_OWORD *)__p;
        *(_OWORD *)(v48 + 64) = v49;
        *(_DWORD *)(v48 + 80) = v86;
        sub_19C190488((_QWORD *)a2, v48);
        v50 = operator new();
        v51 = sub_19C18FEB8(a2, 9);
        v52 = v74[v26];
        v53 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
        *(_QWORD *)v50 = &unk_1E3D21E48;
        *(_QWORD *)(v50 + 8) = 0;
        *(_DWORD *)(v50 + 16) = v52;
        *(_DWORD *)(v50 + 20) = 0;
        *(_DWORD *)(v50 + 24) = v27;
        *(_DWORD *)(v50 + 28) = v52;
        if (v53 <= 0)
          v54 = v52;
        else
          v54 = v53;
        *(_DWORD *)(v50 + 32) = v54;
        *(_QWORD *)(v50 + 40) = v83;
        *(_QWORD *)(v50 + 48) = v51;
        sub_19C190488((_QWORD *)a2, v50);
        v55 = 0;
      }
      else
      {
        v56 = v31(a2, 1);
        v57 = (unsigned int *)v9;
        v58 = v14;
        v59 = *v57;
        v60 = *(_QWORD *)(a2 + 1024);
        v61 = *(_QWORD *)(a2 + 1016);
        v62 = (float *)operator new(8uLL);
        __p[1] = v62 + 2;
        *(_QWORD *)&v85 = v62 + 2;
        *v62 = v28;
        v62[1] = v28;
        __p[0] = v62;
        LOBYTE(v71) = (v81 & 4) != 0;
        v63 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t, char *, uint64_t, uint64_t, void **, int))(*(_QWORD *)v30 + 88))(v30, v56, v59, v75, v60, v78, v80, v61, __p, v71);
        v14 = v58;
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        v9 = v74;
        sub_19C190488((_QWORD *)a2, v63);
        v64 = operator new();
        v65 = sub_19C18FEB8(a2, 9);
        v66 = *v74;
        v67 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
        v68 = v66 - v79;
        *(_QWORD *)v64 = &unk_1E3D21E48;
        *(_QWORD *)(v64 + 8) = 0;
        *(_QWORD *)(v64 + 16) = (v66 - v79 + 1);
        if (v66 <= 0)
          v69 = v68 + 1;
        else
          v69 = v66;
        *(_DWORD *)(v64 + 24) = v27;
        *(_DWORD *)(v64 + 28) = v69;
        if (v67 <= 0)
          v70 = v68 + 1;
        else
          v70 = v67;
        *(_DWORD *)(v64 + 32) = v70;
        *(_QWORD *)(v64 + 40) = v78;
        *(_QWORD *)(v64 + 48) = v65;
        sub_19C190488((_QWORD *)a2, v64);
        v55 = 1 - v79;
      }
      v27 += v55 + v9[v26++];
      v29 += 8;
    }
    while (v79 != v26);
  }
  operator delete(v14);
  operator delete(v9);
}

void sub_19C24C0C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30)
{
  void *v30;
  void *v31;
  void *v32;

  operator delete(v31);
  operator delete(v32);
  if (v30)
    operator delete(v30);
  _Unwind_Resume(a1);
}

void sub_19C24C1B0(uint64_t a1, float *a2)
{
  int v4;
  int v5;
  char *v6;
  int v7;
  int v8;
  char *v9;
  float v10;
  float v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char *v16;
  uint64_t v17;
  int v18;
  uint64_t **v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  char *v28;
  int v29;
  char *v30;
  uint64_t v31;
  int v32;
  uint64_t **v33;
  float v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  float *v40;
  int v41;
  char *v42;
  int v43;
  char *v44;
  float v45;
  float v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  float *v54;
  float v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  int v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  int v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  char *v96;
  uint64_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int v110;
  int v111;
  _QWORD *v112;
  _DWORD *v113;
  void *__p;
  void *v115;
  float *v116;

  v4 = *((_DWORD *)a2 + 318);
  v5 = (*(uint64_t (**)(float *))(*(_QWORD *)a2 + 88))(a2);
  v6 = sub_19C190608(a2, 4 * v4 * v5);
  v7 = *((_DWORD *)a2 + 318);
  v8 = (*(uint64_t (**)(float *))(*(_QWORD *)a2 + 88))(a2);
  v9 = sub_19C190608(a2, 4 * v7 * v8);
  v10 = a2[71];
  v11 = a2[72];
  if (((*(uint64_t (**)(float *))(*(_QWORD *)a2 + 120))(a2) & 0x20) == 0)
  {
    v12 = a2 + 71;
    v13 = (*(uint64_t (**)(float *))(*(_QWORD *)a2 + 112))(a2);
    v14 = *(_QWORD *)a2;
    if (v13 == 1)
    {
      v15 = (*(uint64_t (**)(float *, uint64_t))(v14 + 80))(a2, 9);
      v16 = sub_19C190608(a2, 4 * v15);
      v17 = operator new();
      v18 = (*(uint64_t (**)(float *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
      v19 = sub_19C18FCD8((uint64_t)a2, 1);
      v20 = *((_QWORD *)a2 + 127);
      *(_QWORD *)v17 = &unk_1E3D21E98;
      *(_QWORD *)(v17 + 8) = 0;
      *(_QWORD *)(v17 + 16) = v19;
      *(_DWORD *)(v17 + 24) = 4 * v18;
      *(_DWORD *)(v17 + 28) = 1;
      *(_QWORD *)(v17 + 32) = v20;
      *(_QWORD *)(v17 + 40) = v16;
      sub_19C190488(a2, v17);
      v21 = operator new();
      v22 = (*(uint64_t (**)(float *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
      *(_DWORD *)(v21 + 16) = 1;
      *(_DWORD *)(v21 + 20) = 4 * v22;
      *(_QWORD *)(v21 + 24) = v16;
      *(_QWORD *)(v21 + 32) = v6;
      *(_QWORD *)(v21 + 40) = *v12;
      *(_QWORD *)v21 = &unk_1E3D23C98;
      *(_QWORD *)(v21 + 8) = 0;
      *(_QWORD *)(v21 + 48) = a2 + 76;
      sub_19C190488(a2, v21);
      v23 = *(_QWORD *)(a1 + 8);
      LODWORD(v21) = 4 * (*(uint64_t (**)(float *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
      v24 = 4 * (*(uint64_t (**)(float *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
      v25 = (*(uint64_t (**)(float *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
      sub_19C185710(&__p, 0, v21, 0, 0, 0, v24, 0, 4 * v25);
      v26 = (*(uint64_t (**)(uint64_t, void **, char *, _QWORD, char *))(*(_QWORD *)v23 + 16))(v23, &__p, v6, *((_QWORD *)a2 + 130), v6);
    }
    else
    {
      v27 = (*(uint64_t (**)(float *, uint64_t))(v14 + 72))(a2, 1);
      v28 = sub_19C190608(a2, v27);
      v29 = (*(uint64_t (**)(float *, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
      v30 = sub_19C190608(a2, 4 * v29);
      v31 = operator new();
      v32 = (*(uint64_t (**)(float *, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
      v33 = sub_19C18FCD8((uint64_t)a2, 1);
      v34 = (float)(v10 - v11) * -0.0039062;
      *(_DWORD *)(v31 + 16) = 0;
      *(_DWORD *)(v31 + 20) = v32;
      *(_QWORD *)(v31 + 24) = v33;
      *(_QWORD *)(v31 + 32) = v28;
      *(_QWORD *)(v31 + 40) = *v12;
      *(_QWORD *)v31 = &unk_1E3D23CC0;
      *(_QWORD *)(v31 + 8) = 0;
      *(_QWORD *)(v31 + 48) = v30;
      sub_19C190488(a2, v31);
      v35 = *(_QWORD *)(a1 + 8);
      v36 = (*(uint64_t (**)(float *, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
      v37 = *((_DWORD *)a2 + 318);
      v38 = *((_QWORD *)a2 + 127);
      v39 = *((_QWORD *)a2 + 130);
      v40 = (float *)operator new(8uLL);
      v115 = v40 + 2;
      v116 = v40 + 2;
      *v40 = v34;
      v40[1] = v34;
      __p = v40;
      v26 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, char *, uint64_t, char *, uint64_t, _QWORD, void **, _BYTE))(*(_QWORD *)v35 + 88))(v35, v36, (4 * v37), v28, v38, v6, v39, 0, &__p, 0);
      if (__p)
      {
        v115 = __p;
        operator delete(__p);
      }
      v12 = a2 + 71;
    }
    sub_19C190488(a2, v26);
    v41 = (*(uint64_t (**)(float *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
    v42 = sub_19C190608(a2, v41);
    v43 = (*(uint64_t (**)(float *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
    v44 = sub_19C190608(a2, 4 * v43);
    if (*((_QWORD *)a2 + 157))
    {
      v45 = a2[73];
      v46 = a2[74];
    }
    else
    {
      v46 = 1.0;
      v45 = -1.0;
    }
    v112 = v12;
    v47 = operator new();
    v48 = (*(uint64_t (**)(float *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
    *(_DWORD *)(v47 + 16) = 0;
    *(_DWORD *)(v47 + 20) = v48;
    v113 = a2 + 322;
    *(_QWORD *)(v47 + 24) = a2 + 322;
    *(_QWORD *)(v47 + 32) = v42;
    *(float *)(v47 + 40) = v45;
    *(float *)(v47 + 44) = v46;
    *(_QWORD *)v47 = &unk_1E3D23CC0;
    *(_QWORD *)(v47 + 8) = 0;
    *(_QWORD *)(v47 + 48) = v44;
    sub_19C190488(a2, v47);
    v49 = *(_QWORD *)(a1 + 8);
    v50 = (*(uint64_t (**)(float *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
    v51 = *((_DWORD *)a2 + 318);
    v52 = *((_QWORD *)a2 + 133);
    v53 = *((_QWORD *)a2 + 136);
    v54 = (float *)operator new(8uLL);
    v55 = (float)(v45 - v46) * -0.0039062;
    v115 = v54 + 2;
    v116 = v54 + 2;
    *v54 = v55;
    v54[1] = v55;
    __p = v54;
    LOBYTE(v110) = 0;
    v56 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, char *, uint64_t, char *, uint64_t, _QWORD, void **, int))(*(_QWORD *)v49 + 88))(v49, v50, (4 * v51), v42, v52, v9, v53, 0, &__p, v110);
    if (__p)
    {
      v115 = __p;
      operator delete(__p);
    }
    sub_19C190488(a2, v56);
    v57 = *(_QWORD *)(a1 + 8);
    sub_19C185710(&__p, 0, 4 * *((_DWORD *)a2 + 318), 0, 0, 0, 4 * *((_DWORD *)a2 + 318), 4 * *((_DWORD *)a2 + 318), 4 * *((_DWORD *)a2 + 318));
    v58 = (*(uint64_t (**)(uint64_t, void **, char *, char *, char *))(*(_QWORD *)v57 + 16))(v57, &__p, v6, v9, v6);
    sub_19C190488(a2, v58);
    v59 = (*(uint64_t (**)(float *))(*(_QWORD *)a2 + 120))(a2);
    v60 = *((_DWORD *)a2 + 318);
    v61 = ((*(uint64_t (**)(float *))(*(_QWORD *)a2 + 120))(a2) & 0x10) == 0;
    v62 = *((unsigned int *)a2 + 318);
    v63 = *(_QWORD *)(a1 + 8);
    v64 = *((_QWORD *)a2 + 165);
    __p = 0;
    v115 = 0;
    v116 = 0;
    v65 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, char *, void **, _QWORD, _QWORD, float))(*(_QWORD *)v63 + 48))(v63, v64, v62, v6, v6, &__p, 0, (4 * v62), 0.0);
    v66 = (v60 << ((v59 & 0x10) != 0));
    if (__p)
    {
      v115 = __p;
      operator delete(__p);
    }
    sub_19C190488(a2, v65);
    v67 = *(_QWORD *)(a1 + 8);
    v68 = *((_QWORD *)a2 + 167);
    v69 = *((unsigned int *)a2 + 318);
    __p = 0;
    v115 = 0;
    v116 = 0;
    v70 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, char *, void **, uint64_t, _QWORD, float))(*(_QWORD *)v67 + 48))(v67, v68, v69, v6, v6, &__p, v66, (4 * v62), 0.0);
    v71 = (_DWORD)v62 << v61;
    if (__p)
    {
      v115 = __p;
      operator delete(__p);
    }
    sub_19C190488(a2, v70);
    v72 = *(_QWORD *)(a1 + 8);
    v73 = *((_QWORD *)a2 + 166);
    v74 = *((unsigned int *)a2 + 318);
    __p = 0;
    v115 = 0;
    v116 = 0;
    v75 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, char *, void **, _QWORD, _QWORD, float))(*(_QWORD *)v72 + 48))(v72, v73, v74, v6, v6, &__p, ((_DWORD)v62 << v61), (4 * v62), 0.0);
    if (__p)
    {
      v115 = __p;
      operator delete(__p);
    }
    sub_19C190488(a2, v75);
    v76 = *(_QWORD *)(a1 + 8);
    v77 = *((_QWORD *)a2 + 168);
    v78 = *((unsigned int *)a2 + 318);
    __p = 0;
    v115 = 0;
    v116 = 0;
    v79 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, char *, void **, _QWORD, _QWORD, float))(*(_QWORD *)v76 + 48))(v76, v77, v78, v6, v6, &__p, (3 * v62), (4 * v62), 0.0);
    if (__p)
    {
      v115 = __p;
      operator delete(__p);
    }
    sub_19C190488(a2, v79);
    v80 = *(_QWORD *)(a1 + 8);
    sub_19C185710(&__p, 2, *((_DWORD *)a2 + 318), 0, v71, 0, 4 * v62, 4 * v62, 4 * v62);
    v81 = (*(uint64_t (**)(uint64_t, void **, char *, char *, char *))(*(_QWORD *)v80 + 16))(v80, &__p, v6, v6, v6);
    sub_19C190488(a2, v81);
    v82 = *(_QWORD *)(a1 + 8);
    sub_19C185710(&__p, 2, *((_DWORD *)a2 + 318), v66, 0, v66, 4 * v62, v62, 4 * v62);
    v83 = (*(uint64_t (**)(uint64_t, void **, char *, _DWORD *, char *))(*(_QWORD *)v82 + 16))(v82, &__p, v6, (_DWORD *)a2 + 324, v6);
    sub_19C190488(a2, v83);
    v84 = *(_QWORD *)(a1 + 8);
    sub_19C185710(&__p, 0, *((_DWORD *)a2 + 318), 0, v66, 0, 4 * v62, 4 * v62, v62);
    v85 = (*(uint64_t (**)(uint64_t, void **, char *, char *, _DWORD *))(*(_QWORD *)v84 + 16))(v84, &__p, v6, v6, (_DWORD *)a2 + 324);
    sub_19C190488(a2, v85);
    if (*((_QWORD *)a2 + 157))
    {
      v86 = *((_DWORD *)a2 + 318);
      v87 = (*(uint64_t (**)(float *))(*(_QWORD *)a2 + 88))(a2);
      v88 = sub_19C190608(a2, v87 * v86);
      v89 = *(_QWORD *)(a1 + 8);
      v90 = *((_QWORD *)a2 + 169);
      v91 = *((unsigned int *)a2 + 318);
      __p = 0;
      v115 = 0;
      v116 = 0;
      v92 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _DWORD *, char *, void **, _QWORD, _QWORD, float))(*(_QWORD *)v89 + 48))(v89, v90, v91, (_DWORD *)a2 + 324, v88, &__p, 0, 0, 0.0);
      if (__p)
      {
        v115 = __p;
        operator delete(__p);
      }
      sub_19C190488(a2, v92);
      v93 = *(_QWORD *)(a1 + 8);
      sub_19C185710(&__p, 2, *((_DWORD *)a2 + 318), 3 * v62, 0, 0, 4 * v62, v62, v62);
      v94 = (*(uint64_t (**)(uint64_t, void **, char *, char *, char *))(*(_QWORD *)v93 + 16))(v93, &__p, v6, v88, v88);
      sub_19C190488(a2, v94);
      v95 = sub_19C190608(a2, *((_DWORD *)a2 + 318));
      v96 = sub_19C190608(a2, 4 * *((_DWORD *)a2 + 318));
      v97 = operator new();
      v98 = *((_DWORD *)a2 + 318);
      *(_DWORD *)(v97 + 16) = 0;
      *(_DWORD *)(v97 + 20) = v98;
      *(_QWORD *)(v97 + 24) = v88;
      *(_QWORD *)(v97 + 32) = v95;
      *(_QWORD *)(v97 + 40) = 0x3F800000BF800000;
      *(_QWORD *)v97 = &unk_1E3D23CC0;
      *(_QWORD *)(v97 + 8) = 0;
      *(_QWORD *)(v97 + 48) = v96;
      sub_19C190488(a2, v97);
      v99 = *(_QWORD *)(a1 + 8);
      v100 = *((unsigned int *)a2 + 318);
      v101 = (*(uint64_t (**)(float *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
      v102 = operator new(0x10uLL);
      v115 = v102 + 2;
      v116 = (float *)(v102 + 2);
      v103 = v112[1];
      *v102 = 0x3C0000003C000000;
      v102[1] = v103;
      __p = v102;
      LOBYTE(v111) = 0;
      v104 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, _DWORD *, _DWORD *, _DWORD *, uint64_t, void **, int))(*(_QWORD *)v99 + 88))(v99, v100, v101, v95, (_DWORD *)a2 + 314, v113, (_DWORD *)a2 + 76, 9, &__p, v111);
      if (__p)
      {
        v115 = __p;
        operator delete(__p);
      }
    }
    else
    {
      v105 = *(_QWORD *)(a1 + 8);
      v106 = *((_QWORD *)a2 + 169);
      v107 = *((unsigned int *)a2 + 318);
      __p = 0;
      v115 = 0;
      v116 = 0;
      v108 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _DWORD *, _DWORD *, void **, _QWORD, _QWORD, float))(*(_QWORD *)v105 + 48))(v105, v106, v107, (_DWORD *)a2 + 324, v113, &__p, 0, 0, 0.0);
      if (__p)
      {
        v115 = __p;
        operator delete(__p);
      }
      sub_19C190488(a2, v108);
      v109 = *(_QWORD *)(a1 + 8);
      sub_19C185710(&__p, 2, *((_DWORD *)a2 + 318), 3 * v62, 0, 0, 4 * v62, v62, v62);
      v104 = (*(uint64_t (**)(uint64_t, void **, char *, _DWORD *, _DWORD *))(*(_QWORD *)v109 + 16))(v109, &__p, v6, v113, v113);
    }
    sub_19C190488(a2, v104);
  }
}

void sub_19C24CCB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_19C24CD10(uint64_t a1, _DWORD *a2)
{
  int v4;
  int v5;
  char *v6;
  int v7;
  int v8;
  char *v9;
  uint64_t v10;
  int v11;
  uint64_t **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  char *v19;
  uint64_t v20;
  uint64_t **v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t **v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  int v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  int v83;
  int v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  int v108;
  uint64_t v109;
  uint64_t v110;
  void *__p;
  void *v112;
  _QWORD *v113;

  v4 = a2[318];
  v5 = (*(uint64_t (**)(_DWORD *))(*(_QWORD *)a2 + 88))(a2);
  v6 = sub_19C190608(a2, 4 * v4 * v5);
  if (((*(uint64_t (**)(_DWORD *))(*(_QWORD *)a2 + 120))(a2) & 0x20) != 0)
  {
    v16 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
    v17 = (*(uint64_t (**)(_DWORD *))(*(_QWORD *)a2 + 88))(a2);
    v18 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 56))(a2, 1);
    v19 = sub_19C190608(a2, v18 + v17 * v16);
    v109 = *((_QWORD *)a2 + 127);
    v110 = *((_QWORD *)a2 + 130);
    v20 = operator new();
    v21 = sub_19C18FCD8((uint64_t)a2, 1);
    v22 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
    v23 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
    v24 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
    v25 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9) + v24;
    *(_QWORD *)v20 = &unk_1E3D21E48;
    *(_QWORD *)(v20 + 8) = 0;
    *(_DWORD *)(v20 + 16) = v22;
    *(_DWORD *)(v20 + 20) = 0;
    if (v23 <= 0)
      v26 = v22;
    else
      v26 = v23;
    *(_DWORD *)(v20 + 24) = 0;
    *(_DWORD *)(v20 + 28) = v26;
    if (v25 <= 0)
      v25 = v22;
    *(_DWORD *)(v20 + 32) = v25;
    *(_QWORD *)(v20 + 40) = v21;
    *(_QWORD *)(v20 + 48) = v19;
    sub_19C190488(a2, v20);
    v27 = operator new();
    v28 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
    v29 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
    v30 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
    v31 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
    v32 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9) + v31;
    *(_QWORD *)v27 = &unk_1E3D21E48;
    *(_QWORD *)(v27 + 8) = 0;
    *(_DWORD *)(v27 + 16) = v28;
    *(_DWORD *)(v27 + 20) = 0;
    if (v30 <= 0)
      v33 = v28;
    else
      v33 = v30;
    *(_DWORD *)(v27 + 24) = v29;
    *(_DWORD *)(v27 + 28) = v33;
    if (v32 <= 0)
      v32 = v28;
    *(_DWORD *)(v27 + 32) = v32;
    *(_QWORD *)(v27 + 40) = a2 + 322;
    *(_QWORD *)(v27 + 48) = v19;
    sub_19C190488(a2, v27);
    v34 = *(_QWORD *)(a1 + 8);
    v35 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
    v36 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
    v37 = (4 * a2[318]);
    __p = 0;
    v112 = 0;
    v113 = 0;
    v38 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, char *, uint64_t, char *, uint64_t, _QWORD, void **, _BYTE))(*(_QWORD *)v34 + 56))(v34, (v36 + v35), v37, v19, v109, v6, v110, 0, &__p, 0);
    if (__p)
    {
      v112 = __p;
      operator delete(__p);
    }
  }
  else
  {
    v7 = a2[318];
    v8 = (*(uint64_t (**)(_DWORD *))(*(_QWORD *)a2 + 88))(a2);
    v9 = sub_19C190608(a2, 4 * v7 * v8);
    if ((*(uint64_t (**)(_DWORD *))(*(_QWORD *)a2 + 112))(a2) == 1)
    {
      v10 = operator new();
      v11 = a2[318];
      v12 = sub_19C18FCD8((uint64_t)a2, 1);
      v13 = *((_QWORD *)a2 + 127);
      *(_QWORD *)v10 = &unk_1E3D21EC0;
      *(_QWORD *)(v10 + 8) = 0;
      *(_QWORD *)(v10 + 16) = v12;
      *(_DWORD *)(v10 + 24) = 4 * v11;
      *(_DWORD *)(v10 + 28) = 1;
      *(_QWORD *)(v10 + 32) = v13;
      *(_QWORD *)(v10 + 40) = v6;
      sub_19C190488(a2, v10);
      v14 = *(_QWORD *)(a1 + 8);
      sub_19C185710(&__p, 0, 4 * a2[318], 0, 0, 0, 4 * a2[318], 0, 4 * a2[318]);
      v15 = (*(uint64_t (**)(uint64_t, void **, char *, _QWORD, char *))(*(_QWORD *)v14 + 16))(v14, &__p, v6, *((_QWORD *)a2 + 130), v6);
    }
    else
    {
      v39 = *(_QWORD *)(a1 + 8);
      v40 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
      v41 = (4 * a2[318]);
      v42 = sub_19C18FCD8((uint64_t)a2, 1);
      v43 = *((_QWORD *)a2 + 127);
      v44 = *((_QWORD *)a2 + 130);
      __p = 0;
      v112 = 0;
      v113 = 0;
      v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t **, uint64_t, char *, uint64_t, _QWORD, void **, _BYTE))(*(_QWORD *)v39 + 56))(v39, v40, v41, v42, v43, v6, v44, 0, &__p, 0);
      if (__p)
      {
        v112 = __p;
        operator delete(__p);
      }
    }
    sub_19C190488(a2, v15);
    v45 = *(_QWORD *)(a1 + 8);
    v46 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
    v47 = (4 * a2[318]);
    v48 = *((_QWORD *)a2 + 133);
    v49 = *((_QWORD *)a2 + 136);
    __p = 0;
    v112 = 0;
    v113 = 0;
    LOBYTE(v107) = 0;
    v50 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _DWORD *, uint64_t, char *, uint64_t, _QWORD, void **, int))(*(_QWORD *)v45 + 56))(v45, v46, v47, a2 + 322, v48, v9, v49, 0, &__p, v107);
    if (__p)
    {
      v112 = __p;
      operator delete(__p);
    }
    sub_19C190488(a2, v50);
    v51 = *(_QWORD *)(a1 + 8);
    sub_19C185710(&__p, 0, 4 * a2[318], 0, 0, 0, 4 * a2[318], 4 * a2[318], 4 * a2[318]);
    v38 = (*(uint64_t (**)(uint64_t, void **, char *, char *, char *))(*(_QWORD *)v51 + 16))(v51, &__p, v6, v9, v6);
  }
  sub_19C190488(a2, v38);
  v52 = (*(uint64_t (**)(_DWORD *))(*(_QWORD *)a2 + 120))(a2);
  v53 = a2[318];
  v54 = ((*(uint64_t (**)(_DWORD *))(*(_QWORD *)a2 + 120))(a2) & 0x10) == 0;
  v55 = a2[318];
  v56 = *(_QWORD *)(a1 + 8);
  v57 = *((_QWORD *)a2 + 165);
  __p = 0;
  v112 = 0;
  v113 = 0;
  v58 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, char *, void **, _QWORD, _QWORD, float))(*(_QWORD *)v56 + 48))(v56, v57, v55, v6, v6, &__p, 0, (4 * v55), 0.0);
  v59 = (v53 << ((v52 & 0x10) != 0));
  if (__p)
  {
    v112 = __p;
    operator delete(__p);
  }
  sub_19C190488(a2, v58);
  v60 = *(_QWORD *)(a1 + 8);
  v61 = *((_QWORD *)a2 + 167);
  v62 = a2[318];
  __p = 0;
  v112 = 0;
  v113 = 0;
  v63 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, char *, void **, uint64_t, _QWORD, float))(*(_QWORD *)v60 + 48))(v60, v61, v62, v6, v6, &__p, v59, (4 * v55), 0.0);
  v64 = (_DWORD)v55 << v54;
  if (__p)
  {
    v112 = __p;
    operator delete(__p);
  }
  sub_19C190488(a2, v63);
  v65 = *(_QWORD *)(a1 + 8);
  v66 = *((_QWORD *)a2 + 166);
  v67 = a2[318];
  __p = 0;
  v112 = 0;
  v113 = 0;
  v68 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, char *, void **, _QWORD, _QWORD, float))(*(_QWORD *)v65 + 48))(v65, v66, v67, v6, v6, &__p, ((_DWORD)v55 << v54), (4 * v55), 0.0);
  if (__p)
  {
    v112 = __p;
    operator delete(__p);
  }
  sub_19C190488(a2, v68);
  v69 = *(_QWORD *)(a1 + 8);
  v70 = *((_QWORD *)a2 + 168);
  v71 = a2[318];
  __p = 0;
  v112 = 0;
  v113 = 0;
  v72 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, char *, void **, _QWORD, _QWORD, float))(*(_QWORD *)v69 + 48))(v69, v70, v71, v6, v6, &__p, (3 * v55), (4 * v55), 0.0);
  if (__p)
  {
    v112 = __p;
    operator delete(__p);
  }
  sub_19C190488(a2, v72);
  v73 = *(_QWORD *)(a1 + 8);
  sub_19C185710(&__p, 2, a2[318], 0, v64, 0, 4 * v55, 4 * v55, 4 * v55);
  v74 = (*(uint64_t (**)(uint64_t, void **, char *, char *, char *))(*(_QWORD *)v73 + 16))(v73, &__p, v6, v6, v6);
  sub_19C190488(a2, v74);
  v75 = *(_QWORD *)(a1 + 8);
  sub_19C185710(&__p, 2, a2[318], v59, 0, v59, 4 * v55, v55, 4 * v55);
  v76 = (*(uint64_t (**)(uint64_t, void **, char *, _DWORD *, char *))(*(_QWORD *)v75 + 16))(v75, &__p, v6, a2 + 324, v6);
  sub_19C190488(a2, v76);
  v77 = *(_QWORD *)(a1 + 8);
  sub_19C185710(&__p, 0, a2[318], 0, v59, 0, 4 * v55, 4 * v55, v55);
  v78 = (*(uint64_t (**)(uint64_t, void **, char *, char *, _DWORD *))(*(_QWORD *)v77 + 16))(v77, &__p, v6, v6, a2 + 324);
  sub_19C190488(a2, v78);
  v79 = *(_QWORD *)(a1 + 8);
  if (*((_QWORD *)a2 + 157))
  {
    v80 = a2[318];
    v81 = operator new(8uLL);
    __p = v81;
    *v81 = *(_QWORD *)(a2 + 73);
    v112 = v81 + 1;
    v113 = v81 + 1;
    v82 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _DWORD *, _DWORD *, void **, _QWORD, _QWORD, float))(*(_QWORD *)v79 + 48))(v79, 9, v80, a2 + 324, a2 + 324, &__p, 0, 0, 0.0);
    if (__p)
    {
      v112 = __p;
      operator delete(__p);
    }
    sub_19C190488(a2, v82);
    v83 = a2[318];
    v84 = (*(uint64_t (**)(_DWORD *))(*(_QWORD *)a2 + 88))(a2);
    v85 = sub_19C190608(a2, v84 * v83);
    v86 = *(_QWORD *)(a1 + 8);
    v87 = *((_QWORD *)a2 + 169);
    v88 = a2[318];
    __p = 0;
    v112 = 0;
    v113 = 0;
    v89 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _DWORD *, char *, void **, _QWORD, _QWORD, float))(*(_QWORD *)v86 + 48))(v86, v87, v88, a2 + 324, v85, &__p, 0, 0, 0.0);
    if (__p)
    {
      v112 = __p;
      operator delete(__p);
    }
    sub_19C190488(a2, v89);
    v90 = *(_QWORD *)(a1 + 8);
    sub_19C185710(&__p, 2, a2[318], 3 * v55, 0, 0, 4 * v55, v55, v55);
    v91 = (*(uint64_t (**)(uint64_t, void **, char *, char *, char *))(*(_QWORD *)v90 + 16))(v90, &__p, v6, v85, v85);
    sub_19C190488(a2, v91);
    v92 = *(_QWORD *)(a1 + 8);
    v93 = a2[318];
    v94 = (*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
    v95 = operator new(0x10uLL);
    v112 = v95 + 2;
    v113 = v95 + 2;
    __asm { FMOV            V0.2S, #1.0 }
    v101 = *(_QWORD *)(a2 + 73);
    *v95 = _D0;
    v95[1] = v101;
    __p = v95;
    LOBYTE(v108) = 0;
    v102 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, _DWORD *, _DWORD *, _DWORD *, uint64_t, void **, int))(*(_QWORD *)v92 + 56))(v92, v93, v94, v85, a2 + 314, a2 + 322, a2 + 76, 9, &__p, v108);
    if (__p)
    {
      v112 = __p;
      operator delete(__p);
    }
  }
  else
  {
    v103 = *((_QWORD *)a2 + 169);
    v104 = a2[318];
    __p = 0;
    v112 = 0;
    v113 = 0;
    v105 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _DWORD *, _DWORD *, void **, _QWORD, _QWORD, float))(*(_QWORD *)v79 + 48))(v79, v103, v104, a2 + 324, a2 + 322, &__p, 0, 0, 0.0);
    if (__p)
    {
      v112 = __p;
      operator delete(__p);
    }
    sub_19C190488(a2, v105);
    v106 = *(_QWORD *)(a1 + 8);
    sub_19C185710(&__p, 2, a2[318], 3 * v55, 0, 0, 4 * v55, v55, v55);
    v102 = (*(uint64_t (**)(uint64_t, void **, char *, _DWORD *, _DWORD *))(*(_QWORD *)v106 + 16))(v106, &__p, v6, a2 + 322, a2 + 322);
  }
  sub_19C190488(a2, v102);
}

void sub_19C24D7C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_19C24D820(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD *v22;
  _QWORD v23[3];
  _QWORD *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 8);
  v23[0] = &off_1E3D24EE8;
  v23[1] = a2;
  v24 = v23;
  v21[0] = &off_1E3D24F40;
  v21[1] = a2;
  v22 = v21;
  v4 = *(_QWORD *)(a2 + 1208);
  v5 = sub_19C19CFEC(a2 + 1040);
  v6 = sub_19C19CFEC(a2 + 1080);
  v17 = *(_DWORD *)(a2 + 1136);
  v7 = *(_OWORD *)(a2 + 1160);
  v18 = *(_OWORD *)(a2 + 1144);
  v19 = v7;
  v20 = *(_QWORD *)(a2 + 1176);
  v14 = *(_DWORD *)(a2 + 1184);
  v8 = *(_QWORD *)(a2 + 1200);
  v15 = *(_QWORD *)(a2 + 1192);
  v16 = v8;
  v9 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *, _QWORD *, uint64_t, unint64_t, unint64_t, int *, int *))(*(_QWORD *)v3 + 72))(v3, a2 + 1016, v23, v21, v4, v5, v6, &v17, &v14);
  v10 = v22;
  if (v22 == v21)
  {
    v11 = 4;
    v10 = v21;
  }
  else
  {
    if (!v22)
      goto LABEL_6;
    v11 = 5;
  }
  (*(void (**)(void))(*v10 + 8 * v11))();
LABEL_6:
  v12 = v24;
  if (v24 == v23)
  {
    v13 = 4;
    v12 = v23;
    goto LABEL_10;
  }
  if (v24)
  {
    v13 = 5;
LABEL_10:
    (*(void (**)(void))(*v12 + 8 * v13))();
  }
  sub_19C190488((_QWORD *)a2, v9);
}

void sub_19C24D9A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,char *a23)
{
  char *v23;
  uint64_t v24;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  v26 = a23;
  if (a23 == v23)
  {
    v27 = 4;
    v26 = &a20;
  }
  else
  {
    if (!a23)
      goto LABEL_6;
    v27 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v26 + 8 * v27))();
LABEL_6:
  v28 = *(_QWORD *)(v24 - 64);
  if (v28 == v24 - 88)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)(v24 - 88) + 32))(v24 - 88);
    _Unwind_Resume(exception_object);
  }
  if (!v28)
    _Unwind_Resume(exception_object);
  (*(void (**)(uint64_t))(*(_QWORD *)v28 + 40))(v28);
  _Unwind_Resume(exception_object);
}

void sub_19C24DA20(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[3];
  _QWORD *v17;
  _QWORD v18[3];
  _QWORD *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 8);
  v18[0] = &off_1E3D24E38;
  v18[1] = a2;
  v19 = v18;
  v16[0] = &off_1E3D24E90;
  v16[1] = a2;
  v17 = v16;
  v4 = *(_QWORD *)(a2 + 1160);
  v5 = sub_19C19CFEC(a2 + 1040);
  v6 = sub_19C19CFEC(a2 + 1080);
  v13 = *(_DWORD *)(a2 + 1136);
  v7 = *(_QWORD *)(a2 + 1152);
  v14 = *(_QWORD *)(a2 + 1144);
  v15 = v7;
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *, _QWORD *, uint64_t, unint64_t, unint64_t, int *))(*(_QWORD *)v3 + 80))(v3, a2 + 1016, v18, v16, v4, v5, v6, &v13);
  v9 = v17;
  if (v17 == v16)
  {
    v10 = 4;
    v9 = v16;
  }
  else
  {
    if (!v17)
      goto LABEL_6;
    v10 = 5;
  }
  (*(void (**)(void))(*v9 + 8 * v10))();
LABEL_6:
  v11 = v19;
  if (v19 == v18)
  {
    v12 = 4;
    v11 = v18;
    goto LABEL_10;
  }
  if (v19)
  {
    v12 = 5;
LABEL_10:
    (*(void (**)(void))(*v11 + 8 * v12))();
  }
  sub_19C190488((_QWORD *)a2, v8);
}

void sub_19C24DB78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, char *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t *a19)
{
  char *v19;
  char *v21;
  uint64_t v22;

  v21 = a15;
  if (a15 == v19)
  {
    v22 = 4;
    v21 = &a12;
  }
  else
  {
    if (!a15)
      goto LABEL_6;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_6:
  if (a19 == &a16)
  {
    (*(void (**)(void))(a16 + 32))();
    _Unwind_Resume(exception_object);
  }
  if (!a19)
    _Unwind_Resume(exception_object);
  (*(void (**)(void))(*a19 + 40))();
  _Unwind_Resume(exception_object);
}

void sub_19C24DBF8(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t **v6;
  uint64_t **v7;
  int v8;

  v3 = operator new();
  v4 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 80))(a2, 9);
  v5 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 72))(a2, 1);
  v6 = sub_19C18FCD8((uint64_t)a2, 1);
  v7 = sub_19C18FEB8((uint64_t)a2, 9);
  v8 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 72))(a2, 1);
  *(_QWORD *)v3 = &unk_1E3D21EC0;
  *(_QWORD *)(v3 + 8) = 0;
  *(_QWORD *)(v3 + 16) = v6;
  *(_DWORD *)(v3 + 24) = v4 / v5;
  *(_DWORD *)(v3 + 28) = v8;
  *(_QWORD *)(v3 + 32) = a2 + 127;
  *(_QWORD *)(v3 + 40) = v7;
  sub_19C190488(a2, v3);
}

void sub_19C24DCD0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19C24DCE4(uint64_t a1, uint64_t a2)
{
  _BYTE *v3;
  _BYTE *v4;
  size_t v5;
  _DWORD *v6;
  char *v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE *v10;
  size_t v11;
  void *v12;
  _BYTE *v13;
  _BYTE *v14;
  int64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t **v20;
  uint64_t v21;
  uint64_t **v22;
  int v23;
  uint64_t v24;
  unsigned int *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t **v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t **v36;
  uint64_t v37;
  int v38;
  void *v39;
  unsigned int *v40;
  void *__p;
  void *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v48 = 0;
  v49 = 0;
  v50 = 0;
  v3 = *(_BYTE **)(a2 + 1072);
  v4 = *(_BYTE **)(a2 + 1080);
  v5 = v4 - v3;
  if (v4 == v3)
  {
    v6 = 0;
  }
  else
  {
    if ((v5 & 0x8000000000000000) != 0)
      sub_19C07DA0C();
    v6 = operator new(v4 - v3);
    memcpy(v6, v3, v5);
  }
  v7 = sub_19C190608((_QWORD *)a2, 4 * *v6);
  operator delete(v6);
  v8 = *(unsigned int *)(a2 + 1064);
  v48 = 0;
  v49 = 0;
  v50 = 0;
  v9 = *(_BYTE **)(a2 + 1072);
  v10 = *(_BYTE **)(a2 + 1080);
  v11 = v10 - v9;
  if (v10 == v9)
  {
    v12 = 0;
  }
  else
  {
    if ((v11 & 0x8000000000000000) != 0)
      sub_19C07DA0C();
    v12 = operator new(v10 - v9);
    memcpy(v12, v9, v11);
  }
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v13 = *(_BYTE **)(a2 + 1096);
  v14 = *(_BYTE **)(a2 + 1104);
  v15 = v14 - v13;
  v40 = (unsigned int *)v12;
  if (v14 == v13)
  {
    v39 = 0;
    if ((int)v8 < 1)
      goto LABEL_19;
    goto LABEL_14;
  }
  if (v15 < 0)
    sub_19C07DA0C();
  v16 = (char *)operator new(v14 - v13);
  v17 = &v16[4 * (v15 >> 2)];
  v45 = v16;
  v47 = v17;
  v39 = v16;
  memcpy(v16, v13, v15);
  v46 = v17;
  if ((int)v8 >= 1)
  {
LABEL_14:
    v18 = operator new();
    v19 = *v40;
    v20 = sub_19C18FCD8(a2, 1);
    v21 = *(_QWORD *)(a2 + 1016);
    v22 = sub_19C18FEB8(a2, 9);
    v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
    *(_QWORD *)v18 = &unk_1E3D21EC0;
    *(_QWORD *)(v18 + 8) = 0;
    *(_QWORD *)(v18 + 16) = v20;
    *(_DWORD *)(v18 + 24) = v19;
    *(_DWORD *)(v18 + 28) = v23;
    *(_QWORD *)(v18 + 32) = v21;
    *(_QWORD *)(v18 + 40) = v22;
    sub_19C190488((_QWORD *)a2, v18);
    if ((_DWORD)v8 != 1)
    {
      v24 = 0;
      v25 = v40 + 1;
      v26 = v8 - 1;
      do
      {
        v27 = operator new();
        v28 = *v25;
        v29 = sub_19C18FCD8(a2, 1);
        v30 = *(_QWORD *)(a2 + 1016);
        v31 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
        *(_QWORD *)v27 = &unk_1E3D21EC0;
        *(_QWORD *)(v27 + 8) = 0;
        *(_QWORD *)(v27 + 16) = v29;
        *(_DWORD *)(v27 + 24) = v28;
        *(_DWORD *)(v27 + 28) = v31;
        *(_QWORD *)(v27 + 32) = v30 + v24 + 8;
        *(_QWORD *)(v27 + 40) = v7;
        sub_19C190488((_QWORD *)a2, v27);
        v32 = *(_QWORD *)(a1 + 8);
        v33 = *v25;
        v34 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
        v35 = *(_QWORD *)(a2 + 1040);
        v36 = sub_19C18FEB8(a2, 9);
        __p = 0;
        v43 = 0;
        v44 = 0;
        LOBYTE(v38) = 1;
        v37 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t **, uint64_t, _QWORD, void **, int))(*(_QWORD *)v32 + 56))(v32, v33, v34, v7, v35 + v24, v36, a2 + 304, 0, &__p, v38);
        if (__p)
        {
          v43 = __p;
          operator delete(__p);
        }
        sub_19C190488((_QWORD *)a2, v37);
        v24 += 8;
        ++v25;
        --v26;
      }
      while (v26);
    }
  }
LABEL_19:
  if (v39)
    operator delete(v39);
  if (v40)
    operator delete(v40);
}

void sub_19C24E020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  void *v23;

  operator delete(v23);
  _Unwind_Resume(a1);
}

void sub_19C24E0C8(uint64_t a1, _QWORD *a2)
{
  int v3;
  char *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t **v8;
  int v9;
  uint64_t v10;
  uint64_t **v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t **v16;
  uint64_t **v17;
  int v18;

  if ((*(int (**)(_QWORD *, uint64_t))(*a2 + 72))(a2, 1) < 2)
  {
    v10 = operator new();
    v14 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 80))(a2, 9);
    v15 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 72))(a2, 1);
    v16 = sub_19C18FCD8((uint64_t)a2, 1);
    v17 = sub_19C18FEB8((uint64_t)a2, 9);
    v18 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 72))(a2, 1);
    *(_QWORD *)v10 = &unk_1E3D21EC0;
    *(_QWORD *)(v10 + 8) = 0;
    *(_QWORD *)(v10 + 16) = v16;
    *(_DWORD *)(v10 + 24) = v14 / v15;
    *(_DWORD *)(v10 + 28) = v18;
    *(_QWORD *)(v10 + 32) = a2 + 127;
    *(_QWORD *)(v10 + 40) = v17;
  }
  else
  {
    v3 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 64))(a2, 9);
    v4 = sub_19C190608(a2, v3);
    v5 = operator new();
    v6 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 80))(a2, 9);
    v7 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 72))(a2, 1);
    v8 = sub_19C18FCD8((uint64_t)a2, 1);
    v9 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 72))(a2, 1);
    *(_QWORD *)v5 = &unk_1E3D21EC0;
    *(_QWORD *)(v5 + 8) = 0;
    *(_QWORD *)(v5 + 16) = v8;
    *(_DWORD *)(v5 + 24) = v6 / v7;
    *(_DWORD *)(v5 + 28) = v9;
    *(_QWORD *)(v5 + 32) = a2 + 127;
    *(_QWORD *)(v5 + 40) = v4;
    sub_19C190488(a2, v5);
    v10 = operator new();
    v11 = sub_19C18FEB8((uint64_t)a2, 9);
    v12 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 72))(a2, 1);
    LODWORD(v8) = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 80))(a2, 9);
    v13 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 72))(a2, 1);
    *(_QWORD *)v10 = &unk_1E3D22E70;
    *(_QWORD *)(v10 + 8) = 0;
    *(_DWORD *)(v10 + 16) = v12;
    *(_DWORD *)(v10 + 20) = (int)v8 / v13;
    *(_QWORD *)(v10 + 24) = v4;
    *(_QWORD *)(v10 + 32) = v11;
  }
  sub_19C190488(a2, v10);
}

void sub_19C24E310(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19C24E324(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19C24E338(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19C24E34C(uint64_t a1, _QWORD *a2)
{
  int v3;
  char *v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t **v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t **v12;

  v3 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 64))(a2, 9);
  v4 = sub_19C190608(a2, v3);
  v5 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 80))(a2, 9);
  v6 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 72))(a2, 1);
  v7 = operator new();
  v8 = sub_19C18FCD8((uint64_t)a2, 1);
  v9 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 72))(a2, 1);
  *(_QWORD *)v7 = &unk_1E3D21E98;
  *(_QWORD *)(v7 + 8) = 0;
  *(_QWORD *)(v7 + 16) = v8;
  v10 = v5 / v6;
  *(_DWORD *)(v7 + 24) = v10;
  *(_DWORD *)(v7 + 28) = v9;
  *(_QWORD *)(v7 + 32) = a2 + 127;
  *(_QWORD *)(v7 + 40) = v4;
  sub_19C190488(a2, v7);
  v11 = operator new();
  v12 = sub_19C18FEB8((uint64_t)a2, 9);
  *(_DWORD *)(v11 + 16) = 1;
  *(_DWORD *)(v11 + 20) = v10;
  *(_QWORD *)(v11 + 24) = v4;
  *(_QWORD *)(v11 + 32) = v12;
  *(_QWORD *)(v11 + 40) = *(_QWORD *)((char *)a2 + 284);
  *(_QWORD *)v11 = &unk_1E3D23C98;
  *(_QWORD *)(v11 + 8) = 0;
  *(_QWORD *)(v11 + 48) = a2 + 38;
  sub_19C190488(a2, v11);
}

void sub_19C24E49C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19C24E4B0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19C24E4C4(uint64_t a1, uint64_t a2)
{
  _BYTE *v3;
  _BYTE *v4;
  size_t v5;
  _DWORD *v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  size_t v10;
  void *v11;
  _BYTE *v12;
  _BYTE *v13;
  int64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t **v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  uint64_t **v24;
  uint64_t v25;
  unsigned int *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t **v30;
  uint64_t v31;
  int v32;
  float v33;
  float v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t **v39;
  float *v40;
  float v41;
  uint64_t v42;
  int v43;
  void *v44;
  unsigned int *v45;
  char *v47;
  void *__p;
  void *v49;
  float *v50;
  char *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v54 = 0;
  v55 = 0;
  v56 = 0;
  v3 = *(_BYTE **)(a2 + 1072);
  v4 = *(_BYTE **)(a2 + 1080);
  v5 = v4 - v3;
  if (v4 == v3)
  {
    v6 = 0;
  }
  else
  {
    if ((v5 & 0x8000000000000000) != 0)
      sub_19C07DA0C();
    v6 = operator new(v4 - v3);
    memcpy(v6, v3, v5);
  }
  v47 = sub_19C190608((_QWORD *)a2, *v6);
  operator delete(v6);
  v7 = *(unsigned int *)(a2 + 1064);
  v54 = 0;
  v55 = 0;
  v56 = 0;
  v8 = *(_BYTE **)(a2 + 1072);
  v9 = *(_BYTE **)(a2 + 1080);
  v10 = v9 - v8;
  if (v9 == v8)
  {
    v11 = 0;
  }
  else
  {
    if ((v10 & 0x8000000000000000) != 0)
      sub_19C07DA0C();
    v11 = operator new(v9 - v8);
    memcpy(v11, v8, v10);
  }
  v51 = 0;
  v52 = 0;
  v53 = 0;
  v12 = *(_BYTE **)(a2 + 1096);
  v13 = *(_BYTE **)(a2 + 1104);
  v14 = v13 - v12;
  v45 = (unsigned int *)v11;
  if (v13 == v12)
  {
    v44 = 0;
    if ((int)v7 < 1)
      goto LABEL_19;
    goto LABEL_14;
  }
  if (v14 < 0)
    sub_19C07DA0C();
  v15 = (char *)operator new(v13 - v12);
  v16 = &v15[4 * (v14 >> 2)];
  v51 = v15;
  v53 = v16;
  v44 = v15;
  memcpy(v15, v12, v14);
  v52 = v16;
  if ((int)v7 >= 1)
  {
LABEL_14:
    v17 = operator new();
    v18 = *v45;
    v19 = sub_19C18FCD8(a2, 1);
    v20 = *(_QWORD *)(a2 + 1016);
    v21 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
    *(_QWORD *)v17 = &unk_1E3D21E98;
    *(_QWORD *)(v17 + 8) = 0;
    *(_QWORD *)(v17 + 16) = v19;
    *(_DWORD *)(v17 + 24) = v18;
    *(_DWORD *)(v17 + 28) = v21;
    *(_QWORD *)(v17 + 32) = v20;
    *(_QWORD *)(v17 + 40) = v47;
    sub_19C190488((_QWORD *)a2, v17);
    v22 = operator new();
    v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
    v24 = sub_19C18FEB8(a2, 9);
    *(_DWORD *)(v22 + 16) = 1;
    *(_DWORD *)(v22 + 20) = v23;
    *(_QWORD *)(v22 + 24) = v47;
    *(_QWORD *)(v22 + 32) = v24;
    *(_QWORD *)(v22 + 40) = *(_QWORD *)(a2 + 284);
    *(_QWORD *)v22 = &unk_1E3D23C98;
    *(_QWORD *)(v22 + 8) = 0;
    *(_QWORD *)(v22 + 48) = a2 + 304;
    sub_19C190488((_QWORD *)a2, v22);
    if ((_DWORD)v7 != 1)
    {
      v25 = 0;
      v26 = v45 + 1;
      v27 = v7 - 1;
      do
      {
        v28 = operator new();
        v29 = *v26;
        v30 = sub_19C18FCD8(a2, 1);
        v31 = *(_QWORD *)(a2 + 1016);
        v32 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 72))(a2, 1);
        *(_QWORD *)v28 = &unk_1E3D21E98;
        *(_QWORD *)(v28 + 8) = 0;
        *(_QWORD *)(v28 + 16) = v30;
        *(_DWORD *)(v28 + 24) = v29;
        *(_DWORD *)(v28 + 28) = v32;
        *(_QWORD *)(v28 + 32) = v31 + v25 + 8;
        *(_QWORD *)(v28 + 40) = v47;
        sub_19C190488((_QWORD *)a2, v28);
        v33 = *(float *)(a2 + 284);
        v34 = *(float *)(a2 + 288);
        v35 = *(_QWORD *)(a1 + 8);
        v36 = *v26;
        v37 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 80))(a2, 9);
        v38 = *(_QWORD *)(a2 + 1040);
        v39 = sub_19C18FEB8(a2, 9);
        v40 = (float *)operator new(8uLL);
        v41 = (float)(v33 - v34) * -0.0039062;
        v49 = v40 + 2;
        v50 = v40 + 2;
        *v40 = v41;
        v40[1] = v41;
        __p = v40;
        LOBYTE(v43) = 1;
        v42 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, char *, uint64_t, uint64_t **, uint64_t, _QWORD, void **, int))(*(_QWORD *)v35 + 88))(v35, v36, v37, v47, v38 + v25, v39, a2 + 304, 0, &__p, v43);
        if (__p)
        {
          v49 = __p;
          operator delete(__p);
        }
        sub_19C190488((_QWORD *)a2, v42);
        v25 += 8;
        ++v26;
        --v27;
      }
      while (v27);
    }
  }
LABEL_19:
  if (v44)
    operator delete(v44);
  if (v45)
    operator delete(v45);
}

void sub_19C24E8A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  void *v23;

  operator delete(v23);
  _Unwind_Resume(a1);
}

void sub_19C24E94C(uint64_t a1, _QWORD *a2)
{
  int v3;
  int v4;
  int v5;
  char *v6;
  uint64_t v7;
  uint64_t **v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t **v12;

  if ((*(int (**)(_QWORD *, uint64_t))(*a2 + 72))(a2, 1) <= 1)
  {
    v3 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 80))(a2, 9);
    v4 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 72))(a2, 1);
    v5 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 64))(a2, 9);
    v6 = sub_19C190608(a2, v5);
    v7 = operator new();
    v8 = sub_19C18FCD8((uint64_t)a2, 1);
    v9 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a2 + 72))(a2, 1);
    *(_QWORD *)v7 = &unk_1E3D21E98;
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = v8;
    v10 = v3 / v4;
    *(_DWORD *)(v7 + 24) = v10;
    *(_DWORD *)(v7 + 28) = v9;
    *(_QWORD *)(v7 + 32) = a2 + 127;
    *(_QWORD *)(v7 + 40) = v6;
    sub_19C190488(a2, v7);
    v11 = operator new();
    v12 = sub_19C18FEB8((uint64_t)a2, 9);
    *(_DWORD *)(v11 + 16) = 1;
    *(_DWORD *)(v11 + 20) = v10;
    *(_QWORD *)(v11 + 24) = v6;
    *(_QWORD *)(v11 + 32) = v12;
    *(_QWORD *)(v11 + 40) = *(_QWORD *)((char *)a2 + 284);
    *(_QWORD *)v11 = &unk_1E3D23C98;
    *(_QWORD *)(v11 + 8) = 0;
    *(_QWORD *)(v11 + 48) = a2 + 38;
    sub_19C190488(a2, v11);
  }
}

void sub_19C24EACC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19C24EAE0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_19C24EAF8(_QWORD *a1)
{
  _QWORD *v1;

  v1 = sub_19C188BB4(a1);
  operator delete(v1);
}

void sub_19C24EB14(uint64_t a1, int a2)
{
  int v4;
  float v5;
  float __C;
  float __B;

  v4 = *(_DWORD *)(a1 + 16);
  if (v4 == 1)
  {
    __B = (float)(*(float *)(a1 + 40) - *(float *)(a1 + 44)) * -0.0039062;
    vDSP_vflt8(**(const char ***)(a1 + 24), 1, **(float ***)(a1 + 32), 1, *(int *)(a1 + 20) * (uint64_t)a2);
    vDSP_vsmul(**(const float ***)(a1 + 32), 1, &__B, **(float ***)(a1 + 32), 1, *(int *)(a1 + 20) * (uint64_t)a2);
  }
  else if (!v4)
  {
    __B = -256.0 / (float)(*(float *)(a1 + 40) - *(float *)(a1 + 44));
    __C = 127.1;
    v5 = -127.1;
    vDSP_vsmul(**(const float ***)(a1 + 24), 1, &__B, **(float ***)(a1 + 48), 1, *(int *)(a1 + 20) * (uint64_t)a2);
    vDSP_vclip(**(const float ***)(a1 + 48), 1, &v5, &__C, **(float ***)(a1 + 48), 1, *(int *)(a1 + 20) * (uint64_t)a2);
    vDSP_vfixr8(**(const float ***)(a1 + 48), 1, **(char ***)(a1 + 32), 1, *(int *)(a1 + 20) * (uint64_t)a2);
  }
}

_DWORD *sub_19C24EC64(_DWORD *result, int a2)
{
  _DWORD *v2;
  int v3;
  int i;
  uint64_t v6;

  if (a2 >= 1)
  {
    v2 = result;
    v3 = result[7];
    if (v3 >= 1)
    {
      for (i = 0; i != a2; ++i)
      {
        if (v3 >= 1)
        {
          v6 = 0;
          do
          {
            result = memmove((void *)(**((_QWORD **)v2 + 5) + v2[6] * ((int)v6 + i * v3)), (const void *)(**((_QWORD **)v2 + 4)+ v2[6] * (int)(*(float *)(**((_QWORD **)v2 + 2) + 4 * (v6 + i * v3)) + 0.5)), (int)v2[6]);
            v3 = v2[7];
            ++v6;
          }
          while ((int)v6 < v3);
        }
      }
    }
  }
  return result;
}

void sub_19C24ED30(uint64_t a1, int a2)
{
  int v4;
  float v5;
  float __C;
  float __B;

  v4 = *(_DWORD *)(a1 + 16);
  if (v4 == 1)
  {
    __B = (float)(*(float *)(a1 + 40) - *(float *)(a1 + 44)) * -0.0039062;
    vDSP_vflt8(**(const char ***)(a1 + 24), 1, **(float ***)(a1 + 32), 1, *(int *)(a1 + 20) * (uint64_t)a2);
    vDSP_vsmul(**(const float ***)(a1 + 32), 1, &__B, **(float ***)(a1 + 32), 1, *(int *)(a1 + 20) * (uint64_t)a2);
  }
  else if (!v4)
  {
    __B = -256.0 / (float)(*(float *)(a1 + 40) - *(float *)(a1 + 44));
    __C = 127.1;
    v5 = -127.1;
    vDSP_vsmul(**(const float ***)(a1 + 24), 1, &__B, **(float ***)(a1 + 48), 1, *(int *)(a1 + 20) * (uint64_t)a2);
    vDSP_vclip(**(const float ***)(a1 + 48), 1, &v5, &__C, **(float ***)(a1 + 48), 1, *(int *)(a1 + 20) * (uint64_t)a2);
    vDSP_vfixr8(**(const float ***)(a1 + 48), 1, **(char ***)(a1 + 32), 1, *(int *)(a1 + 20) * (uint64_t)a2);
  }
}

_DWORD *sub_19C24EE80(_DWORD *result, int a2)
{
  _DWORD *v2;
  int v3;
  int i;
  uint64_t v6;

  if (a2 >= 1)
  {
    v2 = result;
    v3 = result[7];
    if (v3 >= 1)
    {
      for (i = 0; i != a2; ++i)
      {
        if (v3 >= 1)
        {
          v6 = 0;
          do
          {
            result = memmove((void *)(**((_QWORD **)v2 + 5) + 4 * v2[6] * ((int)v6 + i * v3)), (const void *)(**((_QWORD **)v2 + 4)+ 4 * v2[6] * (int)(*(float *)(**((_QWORD **)v2 + 2) + 4 * (v6 + i * v3)) + 0.5)), 4 * (int)v2[6]);
            v3 = v2[7];
            ++v6;
          }
          while ((int)v6 < v3);
        }
      }
    }
  }
  return result;
}

_QWORD *sub_19C24EF50(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D24EE8;
  result[1] = v3;
  return result;
}

uint64_t sub_19C24EF84(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D24EE8;
  a2[1] = v2;
  return result;
}

double sub_19C24EFA0@<D0>(uint64_t a1@<X0>, int *a2@<X1>, uint64_t a3@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_19C18823C(*(_QWORD *)(a1 + 8), *a2, a3).n128_u64[0];
  return result;
}

uint64_t sub_19C24EFAC(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

void *sub_19C24F018()
{
  return &unk_1E3D1E058;
}

_QWORD *sub_19C24F02C(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D24F40;
  result[1] = v3;
  return result;
}

uint64_t sub_19C24F060(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D24F40;
  a2[1] = v2;
  return result;
}

double sub_19C24F07C@<D0>(uint64_t a1@<X0>, int *a2@<X1>, uint64_t a3@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_19C188294(*(_QWORD *)(a1 + 8), *a2, a3).n128_u64[0];
  return result;
}

uint64_t sub_19C24F088(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_1")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_1" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_1"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN9inference18LowLatencyCompiler23compileConvolutionLayerEPNS_6layers16ConvolutionLayerIffLm5EEEE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

void *sub_19C24F0F4()
{
  return &unk_1E3D1E068;
}

_QWORD *sub_19C24F108(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D24E38;
  result[1] = v3;
  return result;
}

uint64_t sub_19C24F13C(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D24E38;
  a2[1] = v2;
  return result;
}

double sub_19C24F158@<D0>(uint64_t a1@<X0>, int *a2@<X1>, uint64_t a3@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_19C18823C(*(_QWORD *)(a1 + 8), *a2, a3).n128_u64[0];
  return result;
}

uint64_t sub_19C24F164(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_0")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_0" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_0"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_0" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

void *sub_19C24F1D0()
{
  return &unk_1E3D1E038;
}

_QWORD *sub_19C24F1E4(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E3D24E90;
  result[1] = v3;
  return result;
}

uint64_t sub_19C24F218(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  *a2 = &off_1E3D24E90;
  a2[1] = v2;
  return result;
}

double sub_19C24F234@<D0>(uint64_t a1@<X0>, int *a2@<X1>, uint64_t a3@<X8>)
{
  double result;

  *(_QWORD *)&result = sub_19C188294(*(_QWORD *)(a1 + 8), *a2, a3).n128_u64[0];
  return result;
}

uint64_t sub_19C24F240(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if ((char *)v3 == "ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_1")
    return a1 + 8;
  if (((v3 & (unint64_t)"ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_1" & 0x8000000000000000) != 0) == __OFSUB__(v3, "ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_1"))return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)((unint64_t)"ZN9inference18LowLatencyCompiler19compilePoolingLayerEPNS_6layers12PoolingLayerIffLm5EEEE3$_1" & 0x7FFFFFFFFFFFFFFFLL)))return a1 + 8;
  return 0;
}

void *sub_19C24F2AC()
{
  return &unk_1E3D1E048;
}

void sub_19C24F418(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C24F42C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C24F43C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C24F44C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C24F460(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C24F470(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C24F484(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C24F57C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C24F8D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19)
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id *v24;
  uint64_t v25;

  objc_destroyWeak(v24);
  objc_destroyWeak((id *)(v25 - 88));

  _Unwind_Resume(a1);
}

void sub_19C24F9B4(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend_computeLoss_(WeakRetained, v2, *(_QWORD *)(a1 + 32), v3);
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 64));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_19C24FA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C24FB14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C24FB2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C24FB40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C24FB54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C24FB64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C24FB78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C24FB88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19C24FF50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_19C250094(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float *v31;
  float *v32;
  float *v33;
  float v34;
  uint64_t v35;
  float *v36;
  float v37;
  BOOL v38;
  unint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  unsigned int v49;
  uint64_t **v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  _QWORD *v54;
  unsigned int v55;
  char *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  _QWORD *v62;
  unsigned int v63;
  _DWORD *v64;
  uint64_t v65;
  uint64_t *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  float v81;
  id WeakRetained;
  id v83;
  void *v84;

  v83 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  for (i = 0; ; ++i)
  {
    objc_msgSend_lossLabels(*(void **)(a1 + 32), v3, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_count(v7, v8, v9, v10);

    if (i >= v11)
      break;
    v12 = *(void **)(a1 + 40);
    if (!v12)
      continue;
    objc_msgSend_data(v12, v3, v4, v5);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend_contents(v13, v14, v15, v16);
    v21 = objc_msgSend_rowBytes(*(void **)(a1 + 40), v18, v19, v20);

    v25 = objc_msgSend_outputChannels(*(void **)(a1 + 48), v22, v23, v24);
    v29 = v25;
    v84 = 0;
    if (v25)
    {
      if (v25 < 0)
        sub_19C07DA0C();
      v30 = 4 * v25;
      v84 = operator new(4 * v25);
      memcpy(v84, (const void *)(v17 + v21 * i), 4 * v29);
      v31 = (float *)operator new(4 * v29);
      memcpy(v31, v84, 4 * v29);
      v32 = v31;
      if (v29 != 1)
      {
        v33 = v31 + 1;
        v34 = *v31;
        v35 = v30 - 4;
        v32 = v31;
        v36 = v31 + 1;
        do
        {
          v37 = *v36++;
          v38 = v34 < v37;
          v34 = fmaxf(v34, v37);
          if (v38)
            v32 = v33;
          v33 = v36;
          v35 -= 4;
        }
        while (v35);
      }
      v39 = (unint64_t)((char *)v32 - (char *)v31) >> 2;
      operator delete(v31);
    }
    else
    {
      LODWORD(v39) = 0;
    }
    v40 = *(_QWORD *)(a1 + 56);
    objc_msgSend_labels(*(void **)(a1 + 32), v26, v27, v28);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v41, v42, i, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend_unsignedIntegerValue(v44, v45, v46, v47);
    v49 = v48;
    v50 = (uint64_t **)(v40 + 8);
    v40 += 8;
    v53 = *(_QWORD *)(v40 + 8);
    v52 = (_QWORD *)(v40 + 8);
    v51 = v53;
    if (v53)
    {
      while (1)
      {
        while (1)
        {
          v54 = (_QWORD *)v51;
          v55 = *(_DWORD *)(v51 + 32);
          if (v55 <= v48)
            break;
          v51 = *v54;
          v52 = v54;
          if (!*v54)
            goto LABEL_21;
        }
        if (v55 >= v48)
          break;
        v51 = v54[1];
        if (!v51)
        {
          v52 = v54 + 1;
          goto LABEL_21;
        }
      }
      v56 = (char *)v54;
      v61 = v54[6];
      v60 = v54 + 6;
      v59 = v61;
      if (v61)
        goto LABEL_28;
    }
    else
    {
      v54 = v52;
LABEL_21:
      v56 = (char *)operator new(0x40uLL);
      *((_DWORD *)v56 + 8) = v49;
      *((_QWORD *)v56 + 7) = 0;
      *((_QWORD *)v56 + 6) = 0;
      *((_QWORD *)v56 + 5) = v56 + 48;
      *(_QWORD *)v56 = 0;
      *((_QWORD *)v56 + 1) = 0;
      *((_QWORD *)v56 + 2) = v54;
      *v52 = v56;
      v57 = (uint64_t *)**v50;
      v58 = (uint64_t *)v56;
      if (v57)
      {
        *v50 = v57;
        v58 = (uint64_t *)*v52;
      }
      sub_19C07CC40(v50[1], v58);
      v50[2] = (uint64_t *)((char *)v50[2] + 1);
      v60 = v56 + 48;
      v59 = *((_QWORD *)v56 + 6);
      if (v59)
      {
        while (1)
        {
LABEL_28:
          while (1)
          {
            v62 = (_QWORD *)v59;
            v63 = *(_DWORD *)(v59 + 28);
            if (v63 <= v39)
              break;
            v59 = *v62;
            v60 = v62;
            if (!*v62)
              goto LABEL_32;
          }
          if (v63 >= v39)
            break;
          v59 = v62[1];
          if (!v59)
          {
            v60 = v62 + 1;
            goto LABEL_32;
          }
        }
        v64 = v62;
        goto LABEL_36;
      }
    }
    v62 = v60;
LABEL_32:
    v64 = operator new(0x28uLL);
    v64[7] = v39;
    v64[8] = 0;
    *(_QWORD *)v64 = 0;
    *((_QWORD *)v64 + 1) = 0;
    *((_QWORD *)v64 + 2) = v62;
    *v60 = v64;
    v65 = **((_QWORD **)v56 + 5);
    v66 = (uint64_t *)v64;
    if (v65)
    {
      *((_QWORD *)v56 + 5) = v65;
      v66 = (uint64_t *)*v60;
    }
    sub_19C07CC40(*((uint64_t **)v56 + 6), v66);
    ++*((_QWORD *)v56 + 7);
LABEL_36:

    ++v64[8];
    objc_msgSend_labels(*(void **)(a1 + 32), v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v70, v71, i, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend_unsignedIntegerValue(v73, v74, v75, v76);
    *(float *)(*(_QWORD *)(a1 + 56) + 32) = *(float *)(*(_QWORD *)(a1 + 56) + 32) + log2f(*((float *)v84 + v77));

    operator delete(v84);
  }
  objc_msgSend_computeLoss_(WeakRetained, v3, *(_QWORD *)(a1 + 32), v5);
  *(float *)(*(_QWORD *)(a1 + 56) + 36) = *(float *)(*(_QWORD *)(a1 + 56) + 36)
                                          + (float)(v81
                                                  * (float)(unint64_t)objc_msgSend_batchSize(*(void **)(a1 + 64), v78, v79, v80));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));

}

void sub_19C250448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C250460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, id a11, void *__p, uint64_t a13)
{
  if (__p)
  {
    operator delete(__p);

    _Unwind_Resume(a1);
  }

  _Unwind_Resume(a1);
}

void sub_19C250868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  _Unwind_Resume(a1);
}

__n128 sub_19C2509D8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void sub_19C2509FC(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(_QWORD *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

char *sub_19C250A14(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  objc_msgSend_data(*(void **)(a1 + 32), a2, a3, a4);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (char *)objc_msgSend_contents(v5, v6, v7, v8);
  objc_msgSend_rowBytes(*(void **)(a1 + 32), v10, v11, v12);

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 48);
  v18 = objc_msgSend_rows(*(void **)(a1 + 32), v15, v16, v17);
  v22 = objc_msgSend_columns(*(void **)(a1 + 32), v19, v20, v21) * v18;
  return sub_19C0994CC((unint64_t *)(v13 + 48), v14, v9, &v9[4 * v22], v22);
}

void sub_19C250A98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_19C250AA8(unsigned int *a1, unsigned int a2, int a3, unsigned int a4, int a5)
{
  _DWORD *v5;
  pthread_cond_t *v9;
  size_t v10;
  void *v11;
  unint64_t v12;
  size_t v13;
  uint64_t v14;
  const char *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  *a1 = a2;
  *(_OWORD *)(a1 + 1) = 0u;
  v5 = a1 + 1;
  *(_OWORD *)(a1 + 5) = 0u;
  *(_OWORD *)(a1 + 9) = 0u;
  *(_OWORD *)(a1 + 13) = 0u;
  *(_OWORD *)(a1 + 17) = 0u;
  *(_OWORD *)(a1 + 21) = 0u;
  *(_OWORD *)(a1 + 25) = 0u;
  *(_OWORD *)(a1 + 29) = 0u;
  a1[33] = 0;
  if (!a2)
    return 0;
  v9 = (pthread_cond_t *)(a1 + 20);
  a1[1] = a3 + a2;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 4), 0);
  pthread_cond_init(v9, 0);
  v10 = 184 * a1[1];
  v11 = malloc_type_malloc(v10, 0xF4558A7uLL);
  *((_QWORD *)a1 + 1) = v11;
  if (v11)
  {
    bzero(v11, v10);
    if (*v5)
    {
      v12 = 0;
      v13 = a4;
      v14 = 176;
      v15 = "***tpThreadInit: Error initializing mutex";
      while (1)
      {
        v17 = *((_QWORD *)a1 + 1);
        v18 = v17 + v14;
        v19 = malloc_type_malloc(v13, 0x8D357E3BuLL);
        *(_QWORD *)(v17 + v14 - 32) = v19;
        if (!v19)
          goto LABEL_13;
        bzero(v19, v13);
        *(_DWORD *)(v18 - 176) = 0;
        *(_DWORD *)(v18 - 48) = v12;
        if (v12 < *a1)
        {
          if (pthread_mutex_init((pthread_mutex_t *)(v17 + v14 - 168), 0))
            goto LABEL_15;
          if (pthread_cond_init((pthread_cond_t *)(v17 + v14 - 104), 0))
          {
            v15 = "***tpThreadInit: Error initializing pthreadCond";
            goto LABEL_15;
          }
          if (pthread_create((pthread_t *)(v17 + v14 - 56), 0, (void *(__cdecl *)(void *))sub_19C250C80, (void *)(v18 - 176)))
          {
            v15 = "***tpThreadInit: Error starting up server thread";
LABEL_15:
            puts(v15);
            free(*((void **)a1 + 1));
            *((_QWORD *)a1 + 1) = 0;
            return 3;
          }
        }
        v16 = (_QWORD *)(v17 + v14);
        *((_DWORD *)v16 - 2) = a5;
        *v16 = a1;
        ++v12;
        v14 += 184;
        if (v12 >= a1[1])
          return 0;
      }
    }
    return 0;
  }
LABEL_13:
  puts("***tpThreadInit: malloc failure");
  return 1;
}

uint64_t sub_19C250C80(uint64_t a1)
{
  thread_act_t v2;
  kern_return_t v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  integer_t policy_info;

  if ((*(_BYTE *)(a1 + 168) & 1) != 0)
  {
    policy_info = *(_DWORD *)(a1 + 128) + 1;
    v2 = MEMORY[0x1A1AD201C]();
    v3 = thread_policy_set(v2, 4u, &policy_info, 1u);
    if (v3)
      printf("setThreadAffinity: thread_policy_set returned %d\n", v3);
  }
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 8)))
  {
LABEL_17:
    puts("***tpThread: Error acquiring lock; aborting.");
    pthread_exit(0);
  }
  while (1)
  {
    while (!*(_DWORD *)a1)
    {
      v7 = pthread_cond_wait((pthread_cond_t *)(a1 + 72), (pthread_mutex_t *)(a1 + 8));
      if (v7)
      {
        printf("***tpThread: Error waiting on condition; error %d; aborting.\n", v7);
        pthread_exit(0);
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
    if (*(_DWORD *)(a1 + 136) == 1)
      return 0;
    *(_DWORD *)(a1 + 160) = (*(uint64_t (**)(_QWORD))(a1 + 152))(*(_QWORD *)(a1 + 144));
    v4 = *(_QWORD *)(a1 + 176);
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 16));
    *(_DWORD *)a1 = 0;
    v5 = *(_DWORD *)(v4 + 128);
    if (v5)
    {
      v6 = v5 - 1;
      *(_DWORD *)(v4 + 128) = v6;
      if (!v6)
        goto LABEL_15;
    }
    else
    {
      puts("***tpThread: internal error, actThreads = 0");
      if (!*(_DWORD *)(v4 + 128))
LABEL_15:
        pthread_cond_signal((pthread_cond_t *)(v4 + 80));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v4 + 16));
    if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 8)))
      goto LABEL_17;
  }
}

unsigned int *sub_19C250DD8(unsigned int *result)
{
  unsigned int *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  pthread_cond_t *v12;
  void *v13;

  if (*result)
  {
    v1 = result;
    if (!result[1])
      goto LABEL_8;
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = *((_QWORD *)v1 + 1);
      if (v3 < *v1)
      {
        v5 = (_DWORD *)(v4 + v2);
        pthread_mutex_lock((pthread_mutex_t *)(v4 + v2 + 8));
        v5[34] = 1;
        *v5 = 1;
        pthread_cond_signal((pthread_cond_t *)(v4 + v2 + 72));
        pthread_mutex_unlock((pthread_mutex_t *)(v4 + v2 + 8));
      }
      free(*(void **)(v4 + v2 + 144));
      *(_QWORD *)(v4 + v2 + 144) = 0;
      ++v3;
      v2 += 184;
    }
    while (v3 < v1[1]);
    if (*v1)
    {
LABEL_8:
      v6 = 0;
      v7 = 120;
      do
      {
        v8 = *((_QWORD *)v1 + 1);
        v13 = 0;
        pthread_join(*(pthread_t *)(v8 + v7), &v13);
        ++v6;
        v9 = *v1;
        v7 += 184;
      }
      while (v6 < v9);
      if ((_DWORD)v9)
      {
        v10 = 0;
        v11 = 72;
        do
        {
          v12 = (pthread_cond_t *)(*((_QWORD *)v1 + 1) + v11);
          pthread_mutex_destroy((pthread_mutex_t *)&v12[-2].__opaque[24]);
          pthread_cond_destroy(v12);
          ++v10;
          v11 += 184;
        }
        while (v10 < *v1);
      }
    }
    free(*((void **)v1 + 1));
    *((_QWORD *)v1 + 1) = 0;
    pthread_mutex_destroy((pthread_mutex_t *)(v1 + 4));
    return (unsigned int *)pthread_cond_destroy((pthread_cond_t *)(v1 + 20));
  }
  return result;
}

uint64_t sub_19C250F20(uint64_t a1, unsigned int a2)
{
  const char *v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;

  if (*(_DWORD *)a1 < a2)
  {
    v2 = "tpThreadDispatch: illegal numThreads";
LABEL_5:
    puts(v2);
    return 2;
  }
  if (*(_DWORD *)(a1 + 128))
  {
    v2 = "tpThreadDispatch with threads still active";
    goto LABEL_5;
  }
  if (!a2)
    return 0;
  v5 = 0;
  v6 = 160;
  v7 = a2;
  while (1)
  {
    v8 = *(_QWORD *)(a1 + 8);
    v9 = v8 + v6;
    *(_DWORD *)(v8 + v6) = 3;
    if (pthread_mutex_lock((pthread_mutex_t *)(v8 + v6 - 152)))
    {
      v10 = "tpThreadDispatch: mutex error";
      goto LABEL_17;
    }
    if (*(_DWORD *)(v9 - 160))
    {
      printf("tpThreadDispatch: thread %u not idle\n", v5);
      return 3;
    }
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
    *(int32x2_t *)(a1 + 128) = vadd_s32(*(int32x2_t *)(a1 + 128), (int32x2_t)0x100000001);
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
    *(_DWORD *)(v9 - 160) = 1;
    if (pthread_cond_signal((pthread_cond_t *)(v8 + v6 - 88)))
      break;
    pthread_mutex_unlock((pthread_mutex_t *)(v8 + v6 - 152));
    result = 0;
    ++v5;
    v6 += 184;
    if (v7 == v5)
      return result;
  }
  v10 = "tpThreadDispatch: pthread_cond_signal error";
LABEL_17:
  puts(v10);
  return 3;
}

uint64_t sub_19C251070(uint64_t a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  unsigned int v6;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  while (*(_DWORD *)(a1 + 128))
    pthread_cond_wait((pthread_cond_t *)(a1 + 80), v2);
  v3 = *(unsigned int *)(a1 + 132);
  if ((_DWORD)v3)
  {
    v4 = (unsigned int *)(*(_QWORD *)(a1 + 8) + 160);
    while (1)
    {
      v6 = *v4;
      v4 += 46;
      v5 = v6;
      if (v6)
        break;
      if (!--v3)
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v5 = 0;
  }
  *(_DWORD *)(a1 + 132) = 0;
  pthread_mutex_unlock(v2);
  return v5;
}

uint64_t sub_19C2510F4(uint64_t a1, float64x2_t *a2, void **a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  float64x2_t *v17;
  float64x2_t *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  float64x2_t *v22;
  float64x2_t *v23;
  int32x4_t v24;
  uint64_t v25;
  int32x4_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  double *v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  float64x2_t *v54;
  double *v55;
  uint64_t v56;
  int v57;
  BOOL v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  float64x2_t *v71;
  float64x2_t *v72;
  int32x4_t v73;
  uint64_t v74;
  int32x4_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  float64x2_t v83;
  uint64_t v84;
  uint64_t v85;
  double *v86;
  double *v87;
  double v88;
  double v89;
  double v90;
  uint64_t v91;
  int v92;
  double v93;
  uint64_t v94;
  uint64_t v95;
  double (*v96)(_QWORD, const void *, _QWORD, uint64_t);
  float64x2_t *v97;
  float64x2_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t i;
  double v106;
  double v107;
  double v108;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  float64x2_t *v119;
  float64x2_t *v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  float64x2_t *v124;
  float64x2_t *v125;
  int32x4_t v126;
  uint64_t v127;
  int32x4_t v128;
  float64x2_t v129;
  float64x2_t v130;
  float64x2_t v131;
  float64x2_t v132;
  float64x2_t v133;
  float64x2_t v134;
  float64x2_t v135;
  float64x2_t v136;
  uint64_t v137;
  uint64_t v138;
  double *v139;
  double *v140;
  double v141;
  double v142;
  double v143;
  uint64_t v144;
  uint64_t v145;
  BOOL v146;
  uint64_t v147;
  unsigned int v148;
  double *v149;
  double *v150;
  uint64_t v151;
  _QWORD *v152;
  uint64_t v153;
  unsigned int v154;
  double *v155;
  double *v156;
  uint64_t v157;
  _QWORD *v158;
  uint64_t v159;
  unsigned int v160;
  double *v161;
  double *v162;
  uint64_t v163;
  _QWORD *v164;
  float64x2_t *v165;
  uint64_t v166;
  uint64_t v167;
  _QWORD *v168;
  uint64_t v169;
  unint64_t v170;
  uint64_t v171;
  int8x16_t v172;
  uint64_t v173;
  uint64_t v174;
  int v175;
  _QWORD *v176;
  unint64_t v177;
  uint64_t v178;
  int8x16_t v179;
  uint64_t v180;
  uint64_t v181;
  int v182;
  _QWORD *v183;
  uint64_t v184;
  int v185;
  double *v186;
  double *v187;
  float64_t *v188;
  unsigned int v189;
  double *v190;
  double *v191;
  uint64_t v192;
  _QWORD *v193;
  _QWORD *v194;
  uint64_t v195;
  uint64_t v197;
  int v198;
  int v199;
  char v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  int v204;
  int v205;
  uint64_t v206;
  uint64_t v207;
  double (*v208)(_QWORD, const void *, _QWORD, uint64_t);
  int8x16_t v209;
  int8x16_t v210;
  uint64_t v211;
  __int128 v212;
  __int128 v213;
  void **v214;
  unsigned int v215;
  __int128 v216;
  __int128 v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  _OWORD v221[4];
  uint64_t v222;
  uint64_t v223;
  double v224;
  uint64_t v225;
  uint64_t v226;

  sub_19C23B2B4(a1);
  if (!a1 || !a3 || (v12 = *(_QWORD *)(a1 + 8)) == 0)
  {
    sub_19C23B440(a1, "NULL args to nlopt_optimize", v6, v7, v8, v9, v10, v11, v200);
    return 4294967294;
  }
  v218 = 0;
  v219 = 0;
  v220 = 0;
  v13 = *(_QWORD *)(a1 + 16);
  v14 = *(_QWORD *)(a1 + 24);
  v15 = *(_DWORD *)(a1 + 32);
  if (v15)
  {
    v219 = *(_QWORD *)(a1 + 24);
    v220 = v13;
    v218 = v12;
    *(_QWORD *)(a1 + 8) = sub_19C251C70;
    *(_QWORD *)(a1 + 16) = &v218;
    if (v14)
      *(_QWORD *)(a1 + 24) = sub_19C251D08;
    *(double *)(a1 + 104) = -*(double *)(a1 + 104);
    *(_DWORD *)(a1 + 32) = 0;
  }
  v16 = *(unsigned int *)(a1 + 4);
  if ((_DWORD)v16)
  {
    v17 = *(float64x2_t **)(a1 + 40);
    v18 = *(float64x2_t **)(a1 + 48);
    if (v16 >= 8)
    {
      v19 = v16 & 0xFFFFFFF8;
      v22 = v17 + 2;
      v23 = v18 + 2;
      v24 = 0uLL;
      v25 = v19;
      v26 = 0uLL;
      do
      {
        v27 = v22[-2];
        v28 = v22[-1];
        v29 = *v22;
        v30 = v22[1];
        v22 += 4;
        v31 = v23[-2];
        v32 = v23[-1];
        v33 = *v23;
        v34 = v23[1];
        v23 += 4;
        v24 = vsubq_s32(v24, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v27, v31), (int32x4_t)vceqq_f64(v28, v32))));
        v26 = vsubq_s32(v26, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v29, v33), (int32x4_t)vceqq_f64(v30, v34))));
        v25 -= 8;
      }
      while (v25);
      v20 = vaddvq_s32(vaddq_s32(v26, v24));
      if (v19 == v16)
        goto LABEL_20;
    }
    else
    {
      v19 = 0;
      v20 = 0;
    }
    v35 = v16 - v19;
    v36 = v19;
    v37 = &v18->f64[v36];
    v38 = &v17->f64[v36];
    do
    {
      v39 = *v38++;
      v40 = v39;
      v41 = *v37++;
      if (v40 != v41)
        ++v20;
      --v35;
    }
    while (v35);
  }
  else
  {
    v20 = 0;
  }
LABEL_20:
  v42 = a1;
  if (v20 == (_DWORD)v16)
    goto LABEL_21;
  v58 = *(_DWORD *)a1 > 0x2Bu || ((1 << *(_DWORD *)a1) & 0xC0C3E0813FFLL) == 0;
  v42 = a1;
  if (v58)
    goto LABEL_21;
  v59 = *(_QWORD *)(a1 + 96);
  *(_QWORD *)(a1 + 96) = 0;
  v60 = sub_19C23ADA0(a1);
  *(_QWORD *)(a1 + 96) = v59;
  if (!v60)
  {
LABEL_144:
    sub_19C23B440(a1, "failure allocating elim_opt", v61, v62, v63, v64, v65, v66, v200);
    v21 = 4294967293;
    goto LABEL_145;
  }
  v42 = v60;
  v67 = malloc_type_malloc(8 * *(unsigned int *)(a1 + 4), 0x100004000313F17uLL);
  v68 = v67;
  v69 = *(unsigned int *)(a1 + 4);
  if ((_DWORD)v69 && !v67)
  {
LABEL_143:
    sub_19C23AA14(v42);
    goto LABEL_144;
  }
  if ((*(_DWORD *)a1 & 0xFFFFFFFE) == 8)
  {
    v70 = malloc_type_malloc(8 * v69, 0x100004000313F17uLL);
    LODWORD(v69) = *(_DWORD *)(a1 + 4);
    if ((_DWORD)v69 && !v70)
      goto LABEL_142;
  }
  else
  {
    v70 = 0;
  }
  v120 = *(float64x2_t **)(a1 + 40);
  v119 = *(float64x2_t **)(a1 + 48);
  v201 = v12;
  v202 = v13;
  if ((_DWORD)v69)
  {
    v121 = v69;
    if (v69 < 8)
    {
      v122 = 0;
      v123 = 0;
      goto LABEL_86;
    }
    v122 = v69 & 0xFFFFFFF8;
    v124 = v120 + 2;
    v125 = v119 + 2;
    v126 = 0uLL;
    v127 = v121 & 0xFFFFFFF8;
    v128 = 0uLL;
    do
    {
      v129 = v124[-2];
      v130 = v124[-1];
      v131 = *v124;
      v132 = v124[1];
      v124 += 4;
      v133 = v125[-2];
      v134 = v125[-1];
      v135 = *v125;
      v136 = v125[1];
      v125 += 4;
      v126 = vsubq_s32(v126, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v129, v133), (int32x4_t)vceqq_f64(v130, v134))));
      v128 = vsubq_s32(v128, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v131, v135), (int32x4_t)vceqq_f64(v132, v136))));
      v127 -= 8;
    }
    while (v127);
    v123 = vaddvq_s32(vaddq_s32(v128, v126));
    if (v122 != v121)
    {
LABEL_86:
      v137 = v121 - v122;
      v138 = v122;
      v139 = &v119->f64[v122];
      v140 = &v120->f64[v138];
      do
      {
        v141 = *v140++;
        v142 = v141;
        v143 = *v139++;
        if (v142 != v143)
          ++v123;
        --v137;
      }
      while (v137);
    }
  }
  else
  {
    v123 = 0;
  }
  *(_DWORD *)(v42 + 4) = v123;
  v144 = *(unsigned int *)(a1 + 4);
  v145 = *(_QWORD *)(v42 + 40);
  if ((_DWORD)v144)
    v146 = v145 == 0;
  else
    v146 = 1;
  if (!v146)
  {
    v189 = 0;
    v190 = (double *)v120;
    v191 = (double *)v119;
    v192 = *(unsigned int *)(a1 + 4);
    v193 = *(_QWORD **)(v42 + 40);
    do
    {
      if (*v190 != *v191)
        *(_QWORD *)(v145 + 8 * v189++) = *v193;
      ++v193;
      ++v191;
      ++v190;
      --v192;
    }
    while (v192);
  }
  if ((_DWORD)v144)
  {
    v147 = *(_QWORD *)(v42 + 48);
    if (v147)
    {
      v148 = 0;
      v149 = (double *)v120;
      v150 = (double *)v119;
      v151 = v144;
      v152 = *(_QWORD **)(v42 + 48);
      do
      {
        if (*v149 != *v150)
          *(_QWORD *)(v147 + 8 * v148++) = *v152;
        ++v152;
        ++v150;
        ++v149;
        --v151;
      }
      while (v151);
    }
  }
  if ((_DWORD)v144)
  {
    v153 = *(_QWORD *)(v42 + 136);
    if (v153)
    {
      v154 = 0;
      v155 = (double *)v120;
      v156 = (double *)v119;
      v157 = v144;
      v158 = *(_QWORD **)(v42 + 136);
      do
      {
        if (*v155 != *v156)
          *(_QWORD *)(v153 + 8 * v154++) = *v158;
        ++v158;
        ++v156;
        ++v155;
        --v157;
      }
      while (v157);
    }
  }
  v205 = v15;
  v207 = v14;
  if ((_DWORD)v144)
  {
    v159 = *(_QWORD *)(v42 + 200);
    if (v159)
    {
      v160 = 0;
      v161 = (double *)v120;
      v162 = (double *)v119;
      v163 = v144;
      v164 = *(_QWORD **)(v42 + 200);
      do
      {
        if (*v161 != *v162)
          *(_QWORD *)(v159 + 8 * v160++) = *v164;
        ++v164;
        ++v162;
        ++v161;
        --v163;
      }
      while (v163);
    }
  }
  v165 = v119;
  v203 = v70;
  *(_QWORD *)(v42 + 88) = 0;
  *(_QWORD *)(v42 + 96) = 0;
  *(_QWORD *)(v42 + 8) = sub_19C251D94;
  v167 = *(_QWORD *)(a1 + 8);
  v166 = *(_QWORD *)(a1 + 16);
  v168 = malloc_type_malloc(0x40uLL, 0x10C00407EB6F510uLL);
  if (!v168)
  {
    v194 = (_QWORD *)(v42 + 16);
    v14 = v207;
    v15 = v205;
    v13 = v202;
LABEL_141:
    v12 = v201;
    v70 = v203;
    *v194 = 0;
LABEL_142:
    free(v70);
    free(v68);
    goto LABEL_143;
  }
  *v168 = v167;
  v168[1] = 0;
  v168[2] = v166;
  *((_DWORD *)v168 + 6) = v144;
  v168[6] = v120;
  v168[7] = v165;
  v168[4] = v68;
  v168[5] = v203;
  *(_QWORD *)(v42 + 16) = v168;
  if (*(_DWORD *)(a1 + 56))
  {
    v169 = 0;
    v170 = 0;
    v171 = *(_QWORD *)(v42 + 64);
    v172.i64[0] = (uint64_t)sub_19C251D94;
    v172.i64[1] = (uint64_t)sub_19C251E9C;
    v209 = v172;
    while (1)
    {
      *(int8x16_t *)(v171 + v169 + 8) = vbicq_s8(v209, (int8x16_t)vceqzq_s64(*(int64x2_t *)(v171 + v169 + 8)));
      v173 = *(_QWORD *)(a1 + 64) + v169;
      v174 = *(_QWORD *)(v173 + 32);
      v175 = *(_DWORD *)(a1 + 4);
      v212 = *(_OWORD *)(v173 + 8);
      v216 = *(_OWORD *)(a1 + 40);
      v176 = malloc_type_malloc(0x40uLL, 0x10C00407EB6F510uLL);
      if (!v176)
        break;
      *(_OWORD *)v176 = v212;
      v176[2] = v174;
      *((_DWORD *)v176 + 6) = v175;
      *((_OWORD *)v176 + 3) = v216;
      v176[4] = v68;
      v176[5] = 0;
      v171 = *(_QWORD *)(v42 + 64);
      *(_QWORD *)(v171 + v169 + 32) = v176;
      ++v170;
      v169 += 48;
      if (v170 >= *(unsigned int *)(a1 + 56))
        goto LABEL_118;
    }
    v195 = *(_QWORD *)(v42 + 64);
    goto LABEL_140;
  }
LABEL_118:
  if (*(_DWORD *)(a1 + 72))
  {
    v169 = 0;
    v177 = 0;
    v178 = *(_QWORD *)(v42 + 80);
    v179.i64[0] = (uint64_t)sub_19C251D94;
    v179.i64[1] = (uint64_t)sub_19C251E9C;
    v210 = v179;
    while (1)
    {
      *(int8x16_t *)(v178 + v169 + 8) = vbicq_s8(v210, (int8x16_t)vceqzq_s64(*(int64x2_t *)(v178 + v169 + 8)));
      v180 = *(_QWORD *)(a1 + 80) + v169;
      v181 = *(_QWORD *)(v180 + 32);
      v182 = *(_DWORD *)(a1 + 4);
      v213 = *(_OWORD *)(v180 + 8);
      v217 = *(_OWORD *)(a1 + 40);
      v183 = malloc_type_malloc(0x40uLL, 0x10C00407EB6F510uLL);
      if (!v183)
        break;
      *(_OWORD *)v183 = v213;
      v183[2] = v181;
      *((_DWORD *)v183 + 6) = v182;
      *((_OWORD *)v183 + 3) = v217;
      v183[4] = v68;
      v183[5] = 0;
      v178 = *(_QWORD *)(v42 + 80);
      *(_QWORD *)(v178 + v169 + 32) = v183;
      ++v177;
      v169 += 48;
      if (v177 >= *(unsigned int *)(a1 + 72))
        goto LABEL_122;
    }
    v195 = *(_QWORD *)(v42 + 80);
LABEL_140:
    v194 = (_QWORD *)(v195 + v169 + 32);
    v13 = v202;
    v14 = v207;
    v15 = v205;
    goto LABEL_141;
  }
LABEL_122:
  v12 = v201;
  v13 = v202;
  v14 = v207;
  v15 = v205;
  if (a2)
  {
    v184 = *(unsigned int *)(a1 + 4);
    if ((_DWORD)v184)
    {
      v185 = 0;
      v186 = *(double **)(a1 + 40);
      v187 = *(double **)(a1 + 48);
      v188 = (float64_t *)a2;
      do
      {
        if (*v186 != *v187)
          a2->f64[v185++] = *v188;
        ++v188;
        ++v187;
        ++v186;
        --v184;
      }
      while (v184);
    }
  }
  *(_QWORD *)(a1 + 176) = v42;
LABEL_21:
  if (!a2 || !*(_QWORD *)(v42 + 8) || *(_DWORD *)(v42 + 32))
  {
    sub_19C23B440(v42, "NULL args to nlopt_optimize_", v6, v7, v8, v9, v10, v11, v200);
    v21 = 4294967294;
    if (v42 == a1)
      goto LABEL_145;
LABEL_25:
    v214 = a3;
    v43 = v14;
    v44 = v12;
    v45 = v13;
    v46 = v15;
    free(*(void **)(*(_QWORD *)(v42 + 16) + 32));
    free(*(void **)(*(_QWORD *)(v42 + 16) + 40));
    free(*(void **)(v42 + 16));
    *(_QWORD *)(v42 + 16) = 0;
    if (*(_DWORD *)(v42 + 56))
    {
      v47 = 0;
      v48 = *(_QWORD *)(v42 + 64);
      v49 = 32;
      do
      {
        free(*(void **)(v48 + v49));
        v48 = *(_QWORD *)(v42 + 64);
        *(_QWORD *)(v48 + v49) = 0;
        ++v47;
        v49 += 48;
      }
      while (v47 < *(unsigned int *)(v42 + 56));
    }
    if (*(_DWORD *)(v42 + 72))
    {
      v50 = 0;
      v51 = *(_QWORD *)(v42 + 80);
      v52 = 32;
      do
      {
        free(*(void **)(v51 + v52));
        v51 = *(_QWORD *)(v42 + 80);
        *(_QWORD *)(v51 + v52) = 0;
        ++v50;
        v52 += 48;
      }
      while (v50 < *(unsigned int *)(v42 + 72));
    }
    sub_19C23AA14(v42);
    v15 = v46;
    v13 = v45;
    v12 = v44;
    v14 = v43;
    a3 = v214;
    if (!a2)
      goto LABEL_60;
    v53 = *(unsigned int *)(a1 + 4);
    if (!(_DWORD)v53)
      goto LABEL_60;
    v54 = *(float64x2_t **)(a1 + 40);
    v55 = *(double **)(a1 + 48);
    if (v53 >= 8)
    {
      v56 = v53 & 0xFFFFFFF8;
      v71 = v54 + 2;
      v72 = (float64x2_t *)(v55 + 4);
      v73 = 0uLL;
      v74 = v56;
      v75 = 0uLL;
      do
      {
        v76 = v71[-2];
        v77 = v71[-1];
        v78 = *v71;
        v79 = v71[1];
        v71 += 4;
        v80 = v72[-2];
        v81 = v72[-1];
        v82 = *v72;
        v83 = v72[1];
        v72 += 4;
        v73 = vsubq_s32(v73, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v76, v80), (int32x4_t)vceqq_f64(v77, v81))));
        v75 = vsubq_s32(v75, (int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(v78, v82), (int32x4_t)vceqq_f64(v79, v83))));
        v74 -= 8;
      }
      while (v74);
      v57 = vaddvq_s32(vaddq_s32(v75, v73));
      if (v56 == v53)
      {
LABEL_53:
        v91 = (v53 - 1);
        if ((_DWORD)v91)
        {
          v92 = v57 - 1;
          do
          {
            v93 = v54->f64[v91];
            if (v93 != v55[v91])
              v93 = a2->f64[v92--];
            a2->f64[v91--] = v93;
          }
          while ((_DWORD)v91);
        }
        if (v54->f64[0] == *v55)
          a2->f64[0] = v54->f64[0];
LABEL_60:
        *(_QWORD *)(a1 + 176) = 0;
        goto LABEL_145;
      }
    }
    else
    {
      v56 = 0;
      v57 = 0;
    }
    v84 = v53 - v56;
    v85 = v56;
    v86 = &v55[v56];
    v87 = &v54->f64[v85];
    do
    {
      v88 = *v87++;
      v89 = v88;
      v90 = *v86++;
      if (v89 != v90)
        ++v57;
      --v84;
    }
    while (v84);
    goto LABEL_53;
  }
  v94 = v12;
  sub_19C23B614(v42, 0);
  *(_QWORD *)(v42 + 176) = 0;
  v95 = *(unsigned int *)(v42 + 4);
  v96 = *(double (**)(_QWORD, const void *, _QWORD, uint64_t))(v42 + 8);
  if (!(_DWORD)v95)
  {
    *(double *)a3 = v96(0, a2, 0, *(_QWORD *)(v42 + 16));
    v21 = 1;
    goto LABEL_136;
  }
  v211 = *(_QWORD *)(v42 + 16);
  v204 = v15;
  v206 = v14;
  v97 = *(float64x2_t **)(v42 + 40);
  v98 = *(float64x2_t **)(v42 + 48);
  v215 = *(_DWORD *)v42;
  v222 = 0;
  memset(v221, 0, sizeof(v221));
  *a3 = (void *)0x7FF0000000000000;
  sub_19C23B7F0();
  for (i = 0; i != v95; ++i)
  {
    v106 = v97->f64[i];
    v107 = v98->f64[i];
    v108 = a2->f64[i];
    if (v106 > v107 || v108 < v106 || v108 > v107)
    {
      sub_19C23B440(v42, "bounds %d fail %g <= %g <= %g", v99, v100, v101, v102, v103, v104, i);
      goto LABEL_132;
    }
  }
  v208 = v96;
  *(_DWORD *)(v42 + 156) = 0;
  LODWORD(v221[0]) = v95;
  *(_OWORD *)((char *)v221 + 8) = *(_OWORD *)(v42 + 104);
  *(_OWORD *)((char *)&v221[1] + 8) = *(_OWORD *)(v42 + 120);
  *(_OWORD *)((char *)&v221[2] + 8) = *(_OWORD *)(v42 + 136);
  *((_QWORD *)&v221[3] + 1) = v42 + 156;
  LODWORD(v222) = *(_DWORD *)(v42 + 152);
  v223 = *(_QWORD *)(v42 + 160);
  v224 = sub_19C17F130();
  v225 = v42 + 168;
  v226 = v42 + 224;
  if (v215 < 3)
  {
    v197 = 0;
    while (!sub_19C16E898(v98->f64[v197] - v97->f64[v197]))
    {
      if (v95 == ++v197)
      {
        if (v215)
          v198 = 3;
        else
          v198 = 0;
        if (v215)
          v199 = 10;
        else
          v199 = 0;
        if (v215 == 2)
          v198 = 6;
        v118 = sub_19C244450(v95, (uint64_t)v208, v211, (unint64_t)v97, (unint64_t)v98, a2, a3, (uint64_t)v221, 0.0, v198 + v199);
LABEL_160:
        v21 = v118;
        goto LABEL_133;
      }
    }
  }
  else
  {
    if (v215 - 3 > 2)
      goto LABEL_132;
    v111 = 0;
    while (!sub_19C16E898(v98->f64[v111] - v97->f64[v111]))
    {
      if (v95 == ++v111)
      {
        v118 = sub_19C242CE0(v95, v208, v211, v97, v98, a2, a3, (double *)v221, 0.0, 13);
        goto LABEL_160;
      }
    }
  }
  sub_19C23B440(v42, "finite domain required for global algorithm", v112, v113, v114, v115, v116, v117, v200);
LABEL_132:
  v21 = 4294967294;
LABEL_133:
  v14 = v206;
  v15 = v204;
LABEL_136:
  v12 = v94;
  if (v42 != a1)
    goto LABEL_25;
LABEL_145:
  if (v15)
  {
    *(_DWORD *)(a1 + 32) = v15;
    *(double *)(a1 + 104) = -*(double *)(a1 + 104);
    *(_QWORD *)(a1 + 8) = v12;
    *(_QWORD *)(a1 + 16) = v13;
    *(_QWORD *)(a1 + 24) = v14;
    *(double *)a3 = -*(double *)a3;
  }
  return v21;
}

double sub_19C251C70(uint64_t a1, uint64_t a2, float64x2_t *a3, uint64_t a4)
{
  unsigned int v5;
  double v6;
  uint64_t v7;
  float64x2_t *v8;
  uint64_t v9;
  float64x2_t v10;
  double *v11;
  uint64_t v12;

  v5 = a1;
  (*(void (**)(uint64_t, uint64_t, float64x2_t *, _QWORD))a4)(a1, a2, a3, *(_QWORD *)(a4 + 16));
  if (a3 && v5)
  {
    if (v5 < 4)
    {
      v7 = 0;
LABEL_8:
      v11 = &a3->f64[v7];
      v12 = v5 - v7;
      do
      {
        *v11 = -*v11;
        ++v11;
        --v12;
      }
      while (v12);
      return -v6;
    }
    v7 = v5 & 0xFFFFFFFC;
    v8 = a3 + 1;
    v9 = v7;
    do
    {
      v10 = vnegq_f64(*v8);
      v8[-1] = vnegq_f64(v8[-1]);
      *v8 = v10;
      v8 += 2;
      v9 -= 4;
    }
    while (v9);
    if (v7 != v5)
      goto LABEL_8;
  }
  return -v6;
}

float64_t sub_19C251D08(uint64_t a1, uint64_t a2, uint64_t a3, float64x2_t *a4, uint64_t a5)
{
  unsigned int v6;
  float64x2_t v7;
  uint64_t v8;
  float64x2_t *v9;
  uint64_t v10;
  float64x2_t v11;
  double *v12;
  uint64_t v13;

  v6 = a1;
  (*(void (**)(uint64_t, uint64_t, uint64_t, float64x2_t *, _QWORD))(a5 + 8))(a1, a2, a3, a4, *(_QWORD *)(a5 + 16));
  if (v6)
  {
    if (v6 < 4)
    {
      v8 = 0;
LABEL_7:
      v12 = &a4->f64[v8];
      v13 = v6 - v8;
      do
      {
        v7.f64[0] = -*v12;
        *v12++ = v7.f64[0];
        --v13;
      }
      while (v13);
      return v7.f64[0];
    }
    v8 = v6 & 0xFFFFFFFC;
    v9 = a4 + 1;
    v10 = v8;
    do
    {
      v7 = vnegq_f64(v9[-1]);
      v11 = vnegq_f64(*v9);
      v9[-1] = v7;
      *v9 = v11;
      v9 += 2;
      v10 -= 4;
    }
    while (v10);
    if (v8 != v6)
      goto LABEL_7;
  }
  return v7.f64[0];
}

uint64_t sub_19C251D94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  double *v13;
  double *v14;
  double *v15;
  double v16;
  uint64_t (*v17)(uint64_t, uint64_t, _QWORD, _QWORD);
  uint64_t result;
  uint64_t v19;
  unsigned int v20;

  v7 = *(_QWORD *)(a4 + 32);
  v8 = *(_QWORD *)(a4 + 48);
  v9 = *(_QWORD *)(a4 + 56);
  v10 = *(unsigned int *)(a4 + 24);
  if ((_DWORD)v10)
  {
    v11 = 0;
    v12 = *(unsigned int *)(a4 + 24);
    v13 = *(double **)(a4 + 56);
    v14 = *(double **)(a4 + 48);
    v15 = *(double **)(a4 + 32);
    do
    {
      v16 = *v14;
      if (*v14 != *v13)
        v16 = *(double *)(a2 + 8 * v11++);
      *v15++ = v16;
      ++v14;
      ++v13;
      --v12;
    }
    while (v12);
  }
  v17 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))a4;
  if (!a3)
    return v17(v10, v7, 0, *(_QWORD *)(a4 + 16));
  result = v17(v10, v7, *(_QWORD *)(a4 + 40), *(_QWORD *)(a4 + 16));
  if ((_DWORD)v10)
  {
    v19 = 0;
    v20 = 0;
    do
    {
      if (*(double *)(v8 + v19) != *(double *)(v9 + v19))
        *(_QWORD *)(a3 + 8 * v20++) = *(_QWORD *)(*(_QWORD *)(a4 + 40) + v19);
      v19 += 8;
    }
    while (8 * v10 != v19);
  }
  return result;
}

uint64_t sub_19C251E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v6;
  double *v7;
  double *v8;
  uint64_t v9;
  double *v10;
  double v11;

  if (*(_DWORD *)(a6 + 24))
  {
    v6 = 0;
    v7 = *(double **)(a6 + 48);
    v8 = *(double **)(a6 + 56);
    v9 = *(unsigned int *)(a6 + 24);
    v10 = *(double **)(a6 + 32);
    do
    {
      v11 = *v7;
      if (*v7 != *v8)
        v11 = *(double *)(a4 + 8 * v6++);
      *v10++ = v11;
      ++v7;
      ++v8;
      --v9;
    }
    while (v9);
  }
  return (*(uint64_t (**)(void))(a6 + 8))();
}

__CFString *sub_19C251EFC(unint64_t a1)
{
  __CFString *v1;

  if (a1 <= 0x1B && ((0xFFF7E7Fu >> a1) & 1) != 0)
    v1 = *off_1E3D259E8[a1];
  else
    v1 = 0;
  return v1;
}

uint64_t sub_19C251F40(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;

  v1 = a1;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)off_1EE418BD0, v3) & 1) != 0)
  {

    return 0;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v4, (uint64_t)off_1EE418BD8, v5) & 1) != 0)
  {

    return 1;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v7, (uint64_t)off_1EE418BE0, v8) & 1) != 0)
  {

    return 2;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v9, (uint64_t)off_1EE418BE8, v10) & 1) != 0)
  {

    return 3;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v11, (uint64_t)off_1EE418BF0, v12) & 1) != 0)
  {

    return 23;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v13, (uint64_t)off_1EE418BF8, v14) & 1) != 0)
  {

    return 4;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v15, (uint64_t)off_1EE418C00, v16) & 1) != 0)
  {

    return 5;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v17, (uint64_t)off_1EE418C08, v18) & 1) != 0)
  {

    return 6;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v19, (uint64_t)off_1EE418C10, v20) & 1) != 0)
  {

    return 9;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v21, (uint64_t)off_1EE418C18, v22) & 1) != 0)
  {

    return 10;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v23, (uint64_t)off_1EE418C20, v24) & 1) != 0)
  {

    return 11;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v25, (uint64_t)off_1EE418C28, v26) & 1) != 0)
  {

    return 12;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v27, (uint64_t)off_1EE418C58, v28) & 1) != 0)
  {

    return 13;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v29, (uint64_t)off_1EE418C60, v30) & 1) != 0)
  {

    return 16;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v31, (uint64_t)off_1EE418C68, v32) & 1) != 0)
  {

    return 14;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v33, (uint64_t)off_1EE418C70, v34) & 1) != 0)
  {

    return 17;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v35, (uint64_t)off_1EE418C78, v36) & 1) != 0)
  {

    return 18;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v37, (uint64_t)off_1EE418C80, v38) & 1) != 0)
  {

    return 19;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v39, (uint64_t)off_1EE418C88, v40) & 1) != 0)
  {

    return 20;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v41, (uint64_t)off_1EE418C90, v42) & 1) != 0)
  {

    return 21;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v43, (uint64_t)off_1EE418C98, v44) & 1) != 0)
  {

    return 22;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v45, (uint64_t)off_1EE418CA0, v46) & 1) != 0)
  {

    return 24;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v47, (uint64_t)off_1EE418CA8, v48) & 1) != 0)
  {

    return 25;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v49, (uint64_t)off_1EE418CB0, v50) & 1) != 0)
  {

    return 26;
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v1, v51, (uint64_t)off_1EE418CB8, v52))
      v53 = 27;
    else
      v53 = -1;

    return v53;
  }
}

void sub_19C252404(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *sub_19C252414(unint64_t a1)
{
  __CFString *v1;

  if (a1 <= 0xC && ((0x1DFFu >> a1) & 1) != 0)
    v1 = *off_1E3D25AC8[a1];
  else
    v1 = 0;
  return v1;
}

uint64_t sub_19C252454(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;

  v1 = a1;
  if ((objc_msgSend_isEqualToString_(v1, v2, (uint64_t)off_1EE418CC0, v3) & 1) != 0)
  {

    return 0;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v4, (uint64_t)off_1EE418CC8, v5) & 1) != 0)
  {

    return 1;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v7, (uint64_t)off_1EE418CD0, v8) & 1) != 0)
  {

    return 8;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v9, (uint64_t)off_1EE418CD8, v10) & 1) != 0)
  {

    return 2;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v11, (uint64_t)off_1EE418CE0, v12) & 1) != 0)
  {

    return 3;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v13, (uint64_t)off_1EE418CE8, v14) & 1) != 0)
  {

    return 4;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v15, (uint64_t)off_1EE418CF0, v16) & 1) != 0)
  {

    return 5;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v17, (uint64_t)off_1EE418CF8, v18) & 1) != 0)
  {

    return 6;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v19, (uint64_t)off_1EE418D00, v20) & 1) != 0)
  {

    return 7;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v21, (uint64_t)off_1EE418D08, v22) & 1) != 0)
  {

    return 10;
  }
  else if ((objc_msgSend_isEqualToString_(v1, v23, (uint64_t)off_1EE418D10, v24) & 1) != 0)
  {

    return 11;
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v1, v25, (uint64_t)off_1EE418D18, v26))
      v27 = 12;
    else
      v27 = -1;

    return v27;
  }
}

void sub_19C2526A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *sub_19C2526B8(uint64_t a1)
{
  __CFString **v1;

  if (a1)
  {
    if (a1 != 1)
      return (__CFString *)0;
    v1 = &off_1EE418D28;
  }
  else
  {
    v1 = &off_1EE418D20;
  }
  return *v1;
}

uint64_t sub_19C2526F8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t isEqualToString;

  objc_msgSend_exMRL_stringForKey_(a1, a2, (uint64_t)off_1EE418B60, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v4, v5, (uint64_t)off_1EE418D20, v6) & 1) != 0)
  {

    return 0;
  }
  else
  {
    isEqualToString = objc_msgSend_isEqualToString_(v4, v7, (uint64_t)off_1EE418D28, v8);

    return isEqualToString;
  }
}

void sub_19C252780(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *sub_19C252794(unint64_t a1)
{
  if (a1 > 2)
    return (__CFString *)0;
  else
    return *off_1E3D25B30[a1];
}

uint64_t sub_19C2527C8(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;
  int v28;
  const char *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v1 = a1;
  v4 = objc_msgSend_containsObject_(v1, v2, (uint64_t)off_1EE418D48, v3);
  v7 = objc_msgSend_containsObject_(v1, v5, (uint64_t)off_1EE418D50, v6);
  v10 = objc_msgSend_containsObject_(v1, v8, (uint64_t)off_1EE418D58, v9);
  v13 = objc_msgSend_containsObject_(v1, v11, (uint64_t)off_1EE418D60, v12);
  v16 = objc_msgSend_containsObject_(v1, v14, (uint64_t)off_1EE418D68, v15);
  v19 = objc_msgSend_containsObject_(v1, v17, (uint64_t)off_1EE418D70, v18);
  v22 = objc_msgSend_containsObject_(v1, v20, (uint64_t)off_1EE418D78, v21);
  v25 = objc_msgSend_containsObject_(v1, v23, (uint64_t)off_1EE418D80, v24);
  v28 = objc_msgSend_containsObject_(v1, v26, (uint64_t)off_1EE418D88, v27);
  v31 = objc_msgSend_containsObject_(v1, v29, (uint64_t)off_1EE418D90, v30);
  v32 = 2;
  if (!v4)
    v32 = 0;
  if (v7)
    v32 |= 4uLL;
  if (v10)
    v32 |= 0x10uLL;
  if (v13)
    v32 |= 0x20uLL;
  if (v19 | v16)
    v33 = v32 | 0x40;
  else
    v33 = v32;
  if (v22)
    v33 |= 0x200uLL;
  if (v25)
    v33 |= 0x400uLL;
  if (v28)
    v33 |= 0x80uLL;
  if (v31)
    v34 = v33 | 0x100;
  else
    v34 = v33;

  return v34;
}

void sub_19C252968(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_19C252978(__int16 a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if ((a1 & 2) != 0)
    objc_msgSend_addObject_(v5, v6, (uint64_t)off_1EE418D48, v8);
  if ((a1 & 4) != 0)
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1EE418D50, v8);
  if ((a1 & 0x10) != 0)
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1EE418D58, v8);
  if ((a1 & 0x20) != 0)
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1EE418D60, v8);
  if ((a1 & 0x40) != 0)
  {
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1EE418D68, v8);
    objc_msgSend_addObject_(v9, v10, (uint64_t)off_1EE418D70, v11);
  }
  if ((a1 & 0x200) != 0)
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1EE418D78, v8);
  if ((a1 & 0x400) != 0)
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1EE418D80, v8);
  if ((a1 & 0x80) != 0)
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1EE418D88, v8);
  if ((a1 & 0x100) != 0)
    objc_msgSend_addObject_(v9, v6, (uint64_t)off_1EE418D90, v8);
  v12 = (void *)objc_msgSend_copy(v9, v6, v7, v8);

  return v12;
}

void sub_19C252AA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_19C252AB8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v10;
  uint64_t v11;

  objc_msgSend_exMRL_stringForKey_(a1, a2, (uint64_t)off_1EE418B78, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v4, v5, (uint64_t)off_1EE418D40, v6) & 1) != 0)
  {

    return 2;
  }
  else if ((objc_msgSend_isEqualToString_(v4, v7, (uint64_t)off_1EE418D38, v8) & 1) != 0)
  {

    return 1;
  }
  else
  {
    objc_msgSend_isEqualToString_(v4, v10, (uint64_t)off_1EE418D30, v11);

    return 0;
  }
}

void sub_19C252B74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_19C252B88(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v10;
  uint64_t v11;

  objc_msgSend_exMRL_stringForKey_(a1, a2, (uint64_t)off_1EE418B68, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v4, v5, (uint64_t)off_1EE418D40, v6) & 1) != 0)
  {

    return 2;
  }
  else if ((objc_msgSend_isEqualToString_(v4, v7, (uint64_t)off_1EE418D38, v8) & 1) != 0)
  {

    return 1;
  }
  else
  {
    objc_msgSend_isEqualToString_(v4, v10, (uint64_t)off_1EE418D30, v11);

    return 0;
  }
}

void sub_19C252C44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_19C252C58(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v5;

  objc_msgSend_exMRL_arrayForKey_(a1, a2, (uint64_t)off_1EE418B70, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = sub_19C2527C8(v4);

  return v5;
}

void sub_19C252C98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_19C252CA8(void *a1, uint64_t a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;

  v3 = a1;
  if (objc_msgSend_isEqualToString_(v3, v4, (uint64_t)off_1EE418DB8, v5))
  {

    return a2 + 448;
  }
  if (objc_msgSend_isEqualToString_(v3, v6, (uint64_t)off_1EE418DC0, v7))
  {

    return a2 + 576;
  }
  if (objc_msgSend_isEqualToString_(v3, v9, (uint64_t)off_1EE418DC8, v10))
    goto LABEL_6;
  if (objc_msgSend_isEqualToString_(v3, v11, (uint64_t)off_1EE418DD0, v12))
  {

    return a2 + 584;
  }
  if (objc_msgSend_isEqualToString_(v3, v13, (uint64_t)off_1EE418DD8, v14))
    goto LABEL_10;
  if (objc_msgSend_isEqualToString_(v3, v15, (uint64_t)off_1EE418DE0, v16))
  {

    return a2 + 592;
  }
  else if (objc_msgSend_isEqualToString_(v3, v17, (uint64_t)off_1EE418DE8, v18))
  {

    return a2 + 472;
  }
  else if (objc_msgSend_isEqualToString_(v3, v19, (uint64_t)off_1EE418DF0, v20))
  {

    return a2 + 600;
  }
  else if (objc_msgSend_isEqualToString_(v3, v21, (uint64_t)off_1EE418DF8, v22))
  {

    return a2 + 480;
  }
  else if (objc_msgSend_isEqualToString_(v3, v23, (uint64_t)off_1EE418E00, v24))
  {

    return a2 + 488;
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v3, v25, (uint64_t)off_1EE418E10, v26))
    {
LABEL_6:

      return a2 + 456;
    }
    if (objc_msgSend_isEqualToString_(v3, v27, (uint64_t)off_1EE418E18, v28))
    {
LABEL_10:

      return a2 + 464;
    }
    if (objc_msgSend_isEqualToString_(v3, v29, (uint64_t)off_1EE418E08, v30))
      v31 = a2 + 496;
    else
      v31 = 0;

    return v31;
  }
}

void sub_19C252F30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C252F64(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_19C252F64(a1, *a2);
    sub_19C252F64(a1, a2[1]);
    sub_19C07C924((uint64_t)(a2 + 5), (_QWORD *)a2[6]);
    operator delete(a2);
  }
}

void sub_19C2530DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19C2530FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19C253210(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C253334(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C2533EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C253790(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_19C2538CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C2538E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_19C2538F4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;

  objc_msgSend_network(*(void **)(a1 + 32), a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_numInputs(*(void **)(a1 + 32), v10, v11, v12);
  v17 = objc_msgSend_numOutputs(*(void **)(a1 + 32), v14, v15, v16);
  LODWORD(v18) = 0;
  objc_msgSend_weightMatrixWithRows_columns_stdDev_initialValues_columnMajor_(v9, v19, v13, v17, 0, 0, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_network(*(void **)(a1 + 32), v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_matrixToVector_(v28, v29, (uint64_t)v20, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

void sub_19C2539B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C2539DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C2539EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_19C253A00(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  void *v16;

  objc_msgSend_network(*(void **)(a1 + 32), a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceHandler(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_numOutputs(*(void **)(a1 + 32), v10, v11, v12);
  LODWORD(v14) = 0;
  objc_msgSend_biasVectorWithLength_stdDev_values_(v9, v15, v13, 0, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void sub_19C253A70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_19C253A80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_19C253C7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v6;

  _Unwind_Resume(a1);
}

void sub_19C253D2C()
{
  void *v0;

  JUMPOUT(0x19C253D34);
}

void sub_19C253EB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_19C2540E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_19C2544C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_19C2547D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_19C2549B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_19C2549D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_19C254A08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_19C254E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_19C254FFC(uint64_t a1, void *a2)
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _DWORD *v24;
  unint64_t v25;
  uint64_t i;
  unint64_t v27;
  int *v28;
  _DWORD *v29;
  int v30;
  _OWORD *v31;
  __int128 *v32;
  unint64_t v33;
  __int128 v34;
  unint64_t v35;
  _DWORD *v36;
  int *v37;
  int v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t j;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  id v61;

  v61 = a2;
  objc_msgSend_weights(*(void **)(a1 + 32), v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend_weights(*(void **)(a1 + 32), v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v10, v11, v12, v13);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend_contents(v14, v15, v16, v17);

    v19 = *(_QWORD *)(a1 + 40);
    if (v19)
    {
      v20 = *(_QWORD *)(a1 + 48);
      if (v20)
      {
        v21 = *(_QWORD *)(a1 + 56);
        v22 = *(_QWORD *)(a1 + 64);
        if (v20 > 7)
        {
          if (v19 != 1)
          {
            for (i = 0; i != v19; ++i)
            {
              v27 = v20;
              v28 = (int *)v18;
              v29 = (_DWORD *)v21;
              do
              {
                v30 = *v28++;
                *v29 = v30;
                v29 += v19;
                --v27;
              }
              while (v27);
              v21 += 4;
              v18 += v22;
            }
            goto LABEL_27;
          }
          if ((unint64_t)(v21 - v18) >= 0x20)
          {
            v25 = v20 & 0xFFFFFFFFFFFFFFF8;
            v31 = (_OWORD *)(v21 + 16);
            v32 = (__int128 *)(v18 + 16);
            v33 = v20 & 0xFFFFFFFFFFFFFFF8;
            do
            {
              v34 = *v32;
              *(v31 - 1) = *(v32 - 1);
              *v31 = v34;
              v31 += 2;
              v32 += 2;
              v33 -= 8;
            }
            while (v33);
            if (v20 == v25)
              goto LABEL_27;
          }
          else
          {
            v25 = 0;
          }
          v35 = v20 - v25;
          v36 = (_DWORD *)(v21 + 4 * v25);
          v37 = (int *)(v18 + 4 * v25);
          do
          {
            v38 = *v37++;
            *v36++ = v38;
            --v35;
          }
          while (v35);
          goto LABEL_27;
        }
        v23 = 0;
        v24 = (_DWORD *)(v18 + 12);
        v7 = (const char *)(v21 + 4 * v19);
        do
        {
          *(_DWORD *)(v21 + 4 * v23) = *(v24 - 3);
          if (v20 != 1)
          {
            *(_DWORD *)&v7[4 * v23] = *(v24 - 2);
            if (v20 != 2)
            {
              *(_DWORD *)(v21 + 8 * v19 + 4 * v23) = *(v24 - 1);
              if (v20 != 3)
              {
                *(_DWORD *)(v21 + 12 * v19 + 4 * v23) = *v24;
                if (v20 != 4)
                {
                  *(_DWORD *)(v21 + 16 * v19 + 4 * v23) = v24[1];
                  if (v20 != 5)
                  {
                    *(_DWORD *)(v21 + 20 * v19 + 4 * v23) = v24[2];
                    if (v20 != 6)
                      *(_DWORD *)(v21 + 24 * v19 + 4 * v23) = v24[3];
                  }
                }
              }
            }
          }
          ++v23;
          v24 = (_DWORD *)((char *)v24 + v22);
        }
        while (v19 != v23);
      }
    }
  }
LABEL_27:
  objc_msgSend_biasVector(*(void **)(a1 + 32), v7, v8, v9);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    objc_msgSend_biasVector(*(void **)(a1 + 32), v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v43, v44, v45, v46);
    v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v51 = objc_msgSend_contents(v47, v48, v49, v50);

    for (j = 0; ; ++j)
    {
      objc_msgSend_biasVector(*(void **)(a1 + 32), v52, v53, v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend_length(v56, v57, v58, v59);

      if (v60 <= j)
        break;
      *(_DWORD *)(*(_QWORD *)(a1 + 72) + 4 * j) = *(_DWORD *)(v51 + 4 * j);
    }
  }

}

void sub_19C255288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C2552A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C2552BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C2552D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_19C2552EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C255304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C255318(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C25532C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_19C255344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_19C255470(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_19C09C1B4(&dword_19C079000, a3, (uint64_t)a3, "Unable to append the state", a1);
}

void sub_19C2554A4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_19C09C1B4(&dword_19C079000, a1, a3, "Incremental state should have same shape as the past appended states", v3);
}

void sub_19C2554DC(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_19C09C1B4(&dword_19C079000, a1, a3, "Incremental state should have sequence length of 1", v3);
}

void sub_19C255514(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void sub_19C255528(void **a1, void **a2, void **a3)
{
  void **v5;
  void *v6;

  v5 = (void **)*a1;
  v6 = a2;
  if (v5 != a2)
  {
    do
    {
      if (*((char *)v5 - 1) < 0)
        operator delete(*(v5 - 3));
      v5 -= 3;
    }
    while (v5 != a2);
    v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

void sub_19C255590(void **a1)
{
  void *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
    operator delete(v2);
}

void sub_19C2555A8(void **a1, char *a2, void **a3)
{
  char *v5;
  void *v6;
  char *v8;
  void *v9;
  void *v10;

  v5 = (char *)*a1;
  v6 = a2;
  if (v5 != a2)
  {
    v8 = v5;
    do
    {
      v10 = (void *)*((_QWORD *)v8 - 3);
      v8 -= 24;
      v9 = v10;
      if (v10)
      {
        *((_QWORD *)v5 - 2) = v9;
        operator delete(v9);
      }
      v5 = v8;
    }
    while (v8 != a2);
    v6 = *a3;
  }
  *a1 = a2;
  operator delete(v6);
}

void sub_19C25560C(void **a1, void **a2, uint64_t a3)
{
  char *v5;
  char *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (char *)*a1;
  if (*a1)
  {
    v7 = *(char **)(a3 + 56);
    v8 = *a1;
    if (v7 != v5)
    {
      v9 = *(char **)(a3 + 56);
      do
      {
        v11 = (void *)*((_QWORD *)v9 - 3);
        v9 -= 24;
        v10 = v11;
        if (v11)
        {
          *((_QWORD *)v7 - 2) = v10;
          operator delete(v10);
        }
        v7 = v9;
      }
      while (v9 != v5);
      v8 = *a1;
    }
    *(_QWORD *)(a3 + 56) = v5;
    operator delete(v8);
  }
  v12 = *a2;
  if (*a2)
  {
    *(_QWORD *)(a3 + 32) = v12;
    operator delete(v12);
  }
}

void sub_19C2556A4(uint64_t a1, uint64_t a2)
{
  void **v2;
  void ***v3;
  void **v4;
  void *v5;
  void **v6;
  char v7;
  void **v8;
  void **v9;
  char *v10;
  char *v11;
  char *v12;
  void *v13;
  void *v14;

  v5 = (void *)sub_19C17D8D8(a1, a2);
  if (!v7)
  {
    v8 = v6;
    v9 = v4;
    do
    {
      v11 = (char *)*(v9 - 3);
      v9 -= 3;
      v10 = v11;
      if (v11)
      {
        v12 = (char *)*(v4 - 2);
        v13 = v10;
        if (v12 != v10)
        {
          do
          {
            v14 = (void *)*((_QWORD *)v12 - 4);
            if (v14)
            {
              *((_QWORD *)v12 - 3) = v14;
              operator delete(v14);
            }
            if (*(v12 - 33) < 0)
              operator delete(*((void **)v12 - 7));
            v12 -= 56;
          }
          while (v12 != v10);
          v13 = *v9;
        }
        *(v4 - 2) = v10;
        operator delete(v13);
      }
      v4 = v9;
    }
    while (v9 != v2);
    v5 = *v8;
  }
  *v3 = v2;
  sub_19C17D8AC(v5);
}

void sub_19C255738()
{
  char **v0;
  char ***v1;
  void **v2;
  char ***v3;
  char **v4;
  char **v5;
  void *v6;
  void **v7;

  sub_19C17D8CC();
  v4 = *v3;
  v6 = v5;
  if (v4 != v5)
  {
    v7 = v2;
    do
      v4 = sub_19C17B808(v4 - 12);
    while (v4 != v0);
    v6 = *v7;
  }
  *v1 = v0;
  operator delete(v6);
  sub_19C17D8C0();
}

void sub_19C255788(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;

  v5 = (void *)sub_19C17D8F0(a1, a2);
  if (!v6)
  {
    do
    {
      if (*(char *)(v4 - 25) < 0)
        operator delete(*(void **)(v4 - 48));
      v4 -= 48;
    }
    while (v4 != v2);
    v5 = *(void **)v3;
  }
  *(_QWORD *)(v3 + 8) = v2;
  operator delete(v5);
  sub_19C17D8C0();
}

void sub_19C2557D0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  sub_19C17D8CC();
  do
  {
    v2 = *(void **)(v1 - 32);
    if (v2)
    {
      *(_QWORD *)(v1 - 24) = v2;
      operator delete(v2);
    }
    if (*(char *)(v1 - 33) < 0)
      operator delete(*(void **)(v1 - 56));
    v1 -= 56;
  }
  while (v1 != v0);
  sub_19C17D908();
}

void sub_19C255814(void **a1)
{
  if (*((char *)a1 + 23) < 0)
    sub_19C17D8A4(a1);
}

void sub_19C255824()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  sub_19C17D8CC();
  do
  {
    v2 = *(void **)(v1 + 24);
    if (v2)
    {
      *(_QWORD *)(v1 + 32) = v2;
      operator delete(v2);
    }
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 56;
  }
  while (v1 != v0);
  sub_19C17D908();
}

void sub_19C255868(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v4 = 136315138;
  v5 = sub_19C184300(a1);
  sub_19C1842BC(&dword_19C079000, a2, v3, "Unable to create Espresso E5 Stream: %s", (uint8_t *)&v4);
  sub_19C184310();
}

void sub_19C2558DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19C18431C();
  sub_19C1842C8(&dword_19C079000, v0, v1, "Unable to create Espresso E5 Stream", v2, v3, v4, v5, v6);
  sub_19C1842F8();
}

void sub_19C255908(NSObject *a1)
{
  uint8_t v2[16];

  if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_error_impl(&dword_19C079000, a1, OS_LOG_TYPE_ERROR, "Unable to clean Espresso stream", v2, 2u);
  }
  __cxa_end_catch();
  sub_19C1842D8();
}

void sub_19C255964()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19C18431C();
  sub_19C1842C8(&dword_19C079000, v0, v1, "Model is not loaded or has been cleared", v2, v3, v4, v5, v6);
  sub_19C1842F8();
}

void sub_19C255990(char *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  const char *v4;

  if (*a1 >= 0)
    LODWORD(v3) = (_DWORD)a2;
  else
    v3 = *a2;
  LODWORD(v4) = 136315138;
  HIDWORD(v4) = v3;
  sub_19C1842A8(&dword_19C079000, (uint64_t)a2, a3, "Input %s has already been set", v4);
  sub_19C1842D8();
}

void sub_19C255A04()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;

  sub_19C1842EC(*MEMORY[0x1E0C80C00]);
  sub_19C1842E0();
  sub_19C1842A8(&dword_19C079000, v0, v1, "Logic error, unexpected state input name: %s", v2);
  sub_19C1842D8();
}

void sub_19C255A6C()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;

  sub_19C1842EC(*MEMORY[0x1E0C80C00]);
  sub_19C1842E0();
  sub_19C1842A8(&dword_19C079000, v0, v1, "Inconsistent state sizes for: %s", v2);
  sub_19C1842D8();
}

void sub_19C255AD4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;

  sub_19C1842EC(*MEMORY[0x1E0C80C00]);
  sub_19C1842E0();
  sub_19C1842A8(&dword_19C079000, v0, v1, "Invalid state size for: %s", v2);
  sub_19C1842D8();
}

void sub_19C255B3C()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;

  sub_19C1842EC(*MEMORY[0x1E0C80C00]);
  sub_19C1842E0();
  sub_19C1842A8(&dword_19C079000, v0, v1, "Invalid state shape for: %s", v2);
  sub_19C1842D8();
}

void sub_19C255BA4()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  sub_19C1842E0();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_19C079000, v1, OS_LOG_TYPE_ERROR, "Number of states (%zu) isn't a multiple of batch size (%d)", v2, 0x12u);
  sub_19C1842D8();
}

void sub_19C255C24(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = 5;
  _os_log_error_impl(&dword_19C079000, a2, OS_LOG_TYPE_ERROR, "Cannot convert rank %lu TensorDescriptor to rank %lu FixedShape", (uint8_t *)&v2, 0x16u);
  sub_19C1842D8();
}

void sub_19C255CA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19C18431C();
  sub_19C1842C8(&dword_19C079000, v0, v1, "E5RT::ExecutionStream is null", v2, v3, v4, v5, v6);
  sub_19C1842F8();
}

void sub_19C255CD0(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v4 = 136315138;
  v5 = sub_19C184300(a1);
  sub_19C1842BC(&dword_19C079000, a2, v3, "Unable to exceute Espresso network. Error: %s", (uint8_t *)&v4);
  sub_19C184310();
}

void sub_19C255D44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_19C18431C();
  sub_19C1842C8(&dword_19C079000, v0, v1, "Unable to execute Espresso network", v2, v3, v4, v5, v6);
  sub_19C1842F8();
}

void sub_19C255D70(NSObject *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t *v5;
  int v6;
  uint64_t *v7;

  if (sub_19C18799C(a1))
  {
    if (*((char *)a2 + 23) >= 0)
      v5 = a2;
    else
      v5 = (uint64_t *)*a2;
    v6 = 136315138;
    v7 = v5;
    sub_19C1842BC(&dword_19C079000, a1, v4, "%s not found in state", (uint8_t *)&v6);
  }
  __cxa_end_catch();
}

void sub_19C255E10(NSObject *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t *v7;
  int v8;
  uint64_t *v9;

  if (sub_19C18799C(a1))
  {
    if (*((char *)a2 + 23) >= 0)
      v7 = a2;
    else
      v7 = (uint64_t *)*a2;
    v8 = 136315138;
    v9 = v7;
    sub_19C1842BC(&dword_19C079000, a1, v6, "%s not found in state", (uint8_t *)&v8);
  }
  *(_QWORD *)(a3 + 32) = 0;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  __cxa_end_catch();
}

void sub_19C255EC8(uint64_t *a1, NSObject *a2)
{
  uint64_t *v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (*((char *)a1 + 23) >= 0)
    v2 = a1;
  else
    v2 = (uint64_t *)*a1;
  v3 = 136315138;
  v4 = v2;
  _os_log_error_impl(&dword_19C079000, a2, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v3, 0xCu);
}

void sub_19C255F5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_19C19252C(*MEMORY[0x1E0C80C00]);
  sub_19C19251C(&dword_19C079000, v0, v1, "%s", v2, v3, v4, v5, 2u);
}

void sub_19C255FC4(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void sub_19C255FE4(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_19C079000, log, OS_LOG_TYPE_ERROR, "Params specified that weights are being shared with Adaptive Embedding Layer. However, weights don't match.", buf, 2u);
}

void sub_19C256020(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    sub_19C17D8A4((void **)a1);
}

void sub_19C25603C(uint64_t a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  uint64_t v3;
  int v4;

  v1 = *(std::__shared_weak_count **)(a1 + 64);
  if (!v1)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v1->__shared_owners_;
  do
    sub_19C1BABC0(p_shared_owners);
  while (v4);
  if (!v3)
  {
    sub_19C1BABA8();
    sub_19C1BABB8(v1);
  }
  else
  {
LABEL_5:
    sub_19C17D908();
  }
}

void sub_19C256078(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  uint64_t v3;
  int v4;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    sub_19C1BABC0(p_shared_owners);
  while (v4);
  if (v3)
  {
    sub_19C17D908();
  }
  else
  {
    sub_19C1BABA8();
    sub_19C1BABB8(a1);
  }
}

void sub_19C2560B0(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_19C079000, a2, OS_LOG_TYPE_ERROR, "Unsupported Engine type %d.", (uint8_t *)v3, 8u);
}

void sub_19C256128(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  v4 = 136315138;
  v5 = v3;
  _os_log_error_impl(&dword_19C079000, a2, OS_LOG_TYPE_ERROR, "Cannot create context, Caught exception: %s", (uint8_t *)&v4, 0xCu);
}

void sub_19C2561B8(std::__shared_weak_count *a1)
{
  unint64_t *p_shared_owners;
  uint64_t v3;
  int v4;

  p_shared_owners = (unint64_t *)&a1->__shared_owners_;
  do
    sub_19C1BABC0(p_shared_owners);
  while (v4);
  if (!v3)
  {
    sub_19C1BABA8();
    std::__shared_weak_count::__release_weak(a1);
  }
  sub_19C17D908();
}

void sub_19C25623C(uint64_t a1, uint64_t a2)
{
  void **v2;
  uint64_t v3;
  void *v4;
  char v5;

  v4 = (void *)sub_19C17D8F0(a1, a2);
  if (!v5)
  {
    do
    {
      if (*(char *)(v3 - 25) < 0)
        sub_19C21D104();
      sub_19C21D114();
    }
    while (!v5);
    v4 = *v2;
  }
  sub_19C21D10C(v4);
  sub_19C17D8C0();
}

void sub_19C256278()
{
  uint64_t v0;
  _QWORD *v1;
  void **v2;
  void **v3;
  char *v4;
  char *v5;
  void *v6;
  void **v7;
  char v8;

  sub_19C17D8CC();
  v4 = (char *)*v3;
  v6 = v5;
  if (v4 != v5)
  {
    v7 = v2;
    do
    {
      if (*(v4 - 25) < 0)
        sub_19C21D120();
      sub_19C21D130();
    }
    while (!v8);
    v6 = *v7;
  }
  *v1 = v0;
  operator delete(v6);
  sub_19C17D8C0();
}

void sub_19C2562C8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  char v6;
  void **v7;

  v3 = sub_19C21D16C(a1);
  if (!v6)
  {
    v7 = v4;
    do
      v3 = (uint64_t)sub_19C17B808((char **)(v3 - 96));
    while (v3 != v1);
    v5 = *v7;
  }
  *v2 = v1;
  sub_19C21D13C(v5);
}

void sub_19C256308(void **a1)
{
  uint64_t v1;
  void **v2;
  char **v3;
  uint64_t v4;
  char **v5;
  void *v6;

  v3 = (char **)*a1;
  if (*a1)
  {
    sub_19C17D8CC();
    v5 = *(char ***)(v4 + 96);
    v6 = v3;
    if (v5 != v3)
    {
      do
        v5 = sub_19C17B808(v5 - 12);
      while (v5 != v3);
      v6 = *v2;
    }
    *(_QWORD *)(v1 + 96) = v3;
    sub_19C21D13C(v6);
  }
  else
  {
    sub_19C17D8C0();
  }
}

void sub_19C256360(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;

  v5 = (void *)sub_19C17D8F0(a1, a2);
  if (!v6)
  {
    do
    {
      if (*(char *)(v4 - 25) < 0)
        sub_19C21D104();
      sub_19C21D114();
    }
    while (!v6);
    v5 = *(void **)v3;
  }
  *(_QWORD *)(v3 + 8) = v2;
  sub_19C21D13C(v5);
}

void sub_19C25639C()
{
  uint64_t v0;
  void *v1;
  char v2;

  sub_19C17D8CC();
  do
  {
    v1 = *(void **)(v0 + 24);
    if (v1)
      sub_19C21D18C(v1);
    if (*(char *)(v0 + 23) < 0)
      sub_19C21D184();
    sub_19C21D194();
  }
  while (!v2);
  sub_19C17D908();
}

void sub_19C2563D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void **v4;
  char v5;
  void **v6;

  v3 = (void *)sub_19C21D0EC(a1, a2);
  if (!v5)
  {
    v6 = v4;
    do
    {
      if (*(char *)(v2 - 25) < 0)
        sub_19C21D120();
      sub_19C21D130();
    }
    while (!v5);
    v3 = *v6;
  }
  sub_19C21D128(v3);
  sub_19C17D8C0();
}

void sub_19C256414(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  char v6;
  void **v7;

  v3 = sub_19C21D16C(a1);
  if (!v6)
  {
    v7 = v4;
    do
      v3 = (uint64_t)sub_19C17B808((char **)(v3 - 104));
    while (v3 != v1);
    v5 = *v7;
  }
  *v2 = v1;
  sub_19C21D13C(v5);
}

void sub_19C256454(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[5];
  if (v3)
  {
    a1[6] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[2];
  if (v4)
  {
    a1[3] = v4;
    sub_19C21D158(v4);
  }
  else
  {
    sub_19C17D908();
  }
}

void sub_19C2564A0(void **a1, void **a2, uint64_t a3)
{
  void *v5;
  void *v6;

  v5 = *a1;
  if (v5)
  {
    *(_QWORD *)(a3 + 40) = v5;
    operator delete(v5);
  }
  v6 = *a2;
  if (*a2)
  {
    *(_QWORD *)(a3 + 16) = v6;
    sub_19C21D158(v6);
  }
  else
  {
    sub_19C17D908();
  }
}

void sub_19C2564E0()
{
  uint64_t v0;
  void *v1;
  char v2;

  sub_19C17D8CC();
  do
  {
    v1 = *(void **)(v0 - 32);
    if (v1)
      sub_19C21D150(v1);
    if (*(char *)(v0 - 33) < 0)
      sub_19C21D148();
    sub_19C21D160();
  }
  while (!v2);
  sub_19C17D908();
}

void sub_19C256518(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19C079000, log, OS_LOG_TYPE_ERROR, "Unrecognized input name.", v1, 2u);
}

void sub_19C256558()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_19C19252C(*MEMORY[0x1E0C80C00]);
  sub_19C19251C(&dword_19C079000, v0, v1, "Unrecognized output name: %s", v2, v3, v4, v5, 2u);
}

void sub_19C2565C0(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_19C079000, log, OS_LOG_TYPE_ERROR, "dict does not have key: %s", buf, 0xCu);
}

uint64_t BNNSDirectApplyFullyConnectedBatch()
{
  return MEMORY[0x1E0C8B568]();
}

int BNNSFilterApply(void *filter, const void *in, void *out)
{
  return MEMORY[0x1E0C8B5A8](filter, in, out);
}

int BNNSFilterApplyBatch(void *filter, size_t batch_size, const void *in, size_t in_stride, void *out, size_t out_stride)
{
  return MEMORY[0x1E0C8B5D0](filter, batch_size, in, in_stride, out, out_stride);
}

void *__cdecl BNNSFilterCreateFullyConnectedLayer(const BNNSVectorDescriptor *in_desc, const BNNSVectorDescriptor *out_desc, const BNNSFullyConnectedLayerParameters *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B608](in_desc, out_desc, layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerConvolution(const BNNSLayerParametersConvolution *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B648](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerFullyConnected(const BNNSLayerParametersFullyConnected *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B668](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateLayerPooling(const BNNSLayerParametersPooling *layer_params, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B6A0](layer_params, filter_params);
}

void *__cdecl BNNSFilterCreateVectorActivationLayer(const BNNSVectorDescriptor *in_desc, const BNNSVectorDescriptor *out_desc, const BNNSActivation *activation, const BNNSFilterParameters *filter_params)
{
  return (void *)MEMORY[0x1E0C8B6D8](in_desc, out_desc, activation, filter_params);
}

void BNNSFilterDestroy(void *filter)
{
  MEMORY[0x1E0C8B6E8](filter);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
  MEMORY[0x1E0C98420](theData, extraLength);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFStringRef CFURLCopyFragment(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1E0C992E8](anURL, charactersToLeaveEscaped);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x1E0CBBAF0](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x1E0CBBB38](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x1E0CBBB40](buffer);
}

NSUInteger MPSImageBatchIncrementReadCount(MPSImageBatch *batch, NSInteger amount)
{
  return MEMORY[0x1E0CC6C68](batch, amount);
}

NSUInteger MPSStateBatchIncrementReadCount(MPSStateBatch *batch, NSInteger amount)
{
  return MEMORY[0x1E0CC6C80](batch, amount);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t E5RT::E5Compiler::GetCompiler(E5RT::E5Compiler *this)
{
  return MEMORY[0x1E0D1F570](this);
}

uint64_t E5RT::E5Compiler::Compile()
{
  return MEMORY[0x1E0D1F588]();
}

uint64_t E5RT::BufferObject::GetDataSpan(E5RT::BufferObject *this)
{
  return MEMORY[0x1E0D1F598](this);
}

uint64_t E5RT::ProgramLibrary::GetExportedFunctions(E5RT::ProgramLibrary *this)
{
  return MEMORY[0x1E0D1F5B0](this);
}

uint64_t E5RT::ExecutionStream::ResetStream(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1E0D1F5C8](this);
}

uint64_t E5RT::ExecutionStream::EncodeOperation()
{
  return MEMORY[0x1E0D1F5D0]();
}

uint64_t E5RT::ExecutionStream::ExecuteStreamSync(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1E0D1F5D8](this);
}

uint64_t E5RT::ExecutionStream::CreateExecutionStream(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1E0D1F5E0](this);
}

uint64_t E5RT::E5CompilerOptions::SetMilEntryPoints()
{
  return MEMORY[0x1E0D1F5F0]();
}

uint64_t E5RT::E5CompilerOptions::SetPreferredCpuBackend()
{
  return MEMORY[0x1E0D1F608]();
}

uint64_t E5RT::E5CompilerOptions::SetComputeDeviceTypesAllowed()
{
  return MEMORY[0x1E0D1F610]();
}

uint64_t E5RT::E5CompilerOptions::Create(E5RT::E5CompilerOptions *this)
{
  return MEMORY[0x1E0D1F620](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetInputPortRef()
{
  return MEMORY[0x1E0D1F648]();
}

uint64_t E5RT::ExecutionStreamOperation::GetOutputPortRef()
{
  return MEMORY[0x1E0D1F650]();
}

uint64_t E5RT::ExecutionStreamOperation::CreatePreCompiledComputeOp()
{
  return MEMORY[0x1E0D1F660]();
}

{
  return MEMORY[0x1E0D1F668]();
}

uint64_t E5RT::PrecompiledComputeOpCreateOptions::SetOperationName()
{
  return MEMORY[0x1E0D1F670]();
}

uint64_t E5RT::PrecompiledComputeOpCreateOptions::Create()
{
  return MEMORY[0x1E0D1F678]();
}

uint64_t E5RT::IOPort::BindMemoryObject()
{
  return MEMORY[0x1E0D1F688]();
}

uint64_t Espresso::kern_alloc(Espresso *this)
{
  return MEMORY[0x1E0D1F6A0](this);
}

uint64_t Espresso::kern_dealloc(Espresso *this, void *a2)
{
  return MEMORY[0x1E0D1F6B8](this, a2);
}

void Espresso::blob_rtti_root::~blob_rtti_root(Espresso::blob_rtti_root *this)
{
  MEMORY[0x1E0D1F6D0](this);
}

uint64_t Espresso::sequential_builder::add_kernel()
{
  return MEMORY[0x1E0D1F6E8]();
}

uint64_t Espresso::sequential_builder::add_kernel_dbg()
{
  return MEMORY[0x1E0D1F6F0]();
}

uint64_t Espresso::sequential_builder::build_from_shapes()
{
  return MEMORY[0x1E0D1F6F8]();
}

uint64_t Espresso::sequential_builder::add_shape_from_kernel()
{
  return MEMORY[0x1E0D1F700]();
}

uint64_t Espresso::sequential_builder::sequential_builder()
{
  return MEMORY[0x1E0D1F708]();
}

uint64_t Espresso::abstract_engine_factory::shared(Espresso::abstract_engine_factory *this)
{
  return MEMORY[0x1E0D1F720](this);
}

uint64_t Espresso::espresso_os_log_subsystem(Espresso *this, const char *a2)
{
  return MEMORY[0x1E0D1F728](this, a2);
}

uint64_t Espresso::dump_network_binserializer()
{
  return MEMORY[0x1E0D1F730]();
}

uint64_t E5RT::TensorDescriptor::AllocateMemory()
{
  return MEMORY[0x1E0D1F778]();
}

uint64_t E5RT::TensorDescriptor::GetNumElements(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x1E0D1F780](this);
}

uint64_t E5RT::TensorDescriptor::GetTensorShape(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x1E0D1F788](this);
}

uint64_t E5RT::OperandDescriptor::TensorDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x1E0D1F7B0](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetInputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x1E0D1F7D0](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetOutputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x1E0D1F7D8](this);
}

uint64_t E5RT::IOPort::GetPortDescriptorRef(E5RT::IOPort *this)
{
  return MEMORY[0x1E0D1F7E8](this);
}

uint64_t Espresso::abstract_engine_factory::make_kernel_priv()
{
  return MEMORY[0x1E0D1F808]();
}

uint64_t Espresso::abstract_engine_factory::engine_for_platform()
{
  return MEMORY[0x1E0D1F810]();
}

const char *__cdecl std::runtime_error::what(const std::runtime_error *this)
{
  return (const char *)MEMORY[0x1E0DE4190](this);
}

int std::string::compare(const std::string *this, std::string::size_type __pos1, std::string::size_type __n1, const std::string::value_type *__s)
{
  return MEMORY[0x1E0DE41E0](this, __pos1, __n1, __s);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
}

{
  return MEMORY[0x1E0DE4800]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4290](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1E0DE4320](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4310](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1E0DE4328](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4318](this, a2);
}

{
  return (std::runtime_error *)MEMORY[0x1E0DE4330](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4338](this);
}

{
  MEMORY[0x1E0DE4340](this);
}

void std::invalid_argument::~invalid_argument(std::invalid_argument *this)
{
  MEMORY[0x1E0DE4368](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4468](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x1E0DE44B0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x1E0DE4590]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x1E0DE4598]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x1E0DE45A8]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x1E0DE45B0]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x1E0DE45D0]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x1E0DE45E8]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x1E0DE45F0]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x1E0DE4608]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x1E0DE4628]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x1E0DE4640]();
}

{
  return MEMORY[0x1E0DE4648]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x1E0DE46A8]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x1E0DE46C8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46F8]();
}

{
  return MEMORY[0x1E0DE4700]();
}

{
  return MEMORY[0x1E0DE4710]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x1E0DE4770](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
  MEMORY[0x1E0DE4778](this);
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x1E0DE4780](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x1E0DE4A78](__str, __idx, *(_QWORD *)&__base);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

uint64_t std::__sort<std::__less<long,long> &,long *>()
{
  return MEMORY[0x1E0DE4B08]();
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return (std::chrono::steady_clock::time_point)MEMORY[0x1E0DE4B38]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x1E0DE4D88]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1E0DE4DB0](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD0](this);
}

{
  MEMORY[0x1E0DE4DD8](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete[](void *__p)
{
  off_1E3D1C588(__p);
}

void operator delete(void *__p)
{
  off_1E3D1C590(__p);
}

uint64_t operator new[]()
{
  return off_1E3D1C598();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E3D1C5A0(__sz);
}

uint64_t operator new()
{
  return off_1E3D1C5A8();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_cast(void)
{
  MEMORY[0x1E0DE5070]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1E0DE50A8](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x1E0DE50B0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

int __fpclassifyd(double a1)
{
  return MEMORY[0x1E0C80B00](a1);
}

uint64_t __isinfd()
{
  return MEMORY[0x1E0C80B40]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t c_network_get_input_names()
{
  return MEMORY[0x1E0D1F880]();
}

uint64_t c_network_get_output_names()
{
  return MEMORY[0x1E0D1F898]();
}

uint64_t cblas_dnrm2_NEWLAPACK()
{
  return MEMORY[0x1E0C8BB68]();
}

uint64_t cblas_sgemm_NEWLAPACK()
{
  return MEMORY[0x1E0C8BC08]();
}

uint64_t cblas_sgemv_NEWLAPACK()
{
  return MEMORY[0x1E0C8BC28]();
}

uint64_t cblas_sger_NEWLAPACK()
{
  return MEMORY[0x1E0C8BC40]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t dgesv_NEWLAPACK()
{
  return MEMORY[0x1E0C8BCF8]();
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
  MEMORY[0x1E0C82BD8](iterations, queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dpotrf_NEWLAPACK()
{
  return MEMORY[0x1E0C8BD60]();
}

long double erf(long double __x)
{
  long double result;

  MEMORY[0x1E0C831F0](__x);
  return result;
}

long double erfc(long double __x)
{
  long double result;

  MEMORY[0x1E0C831F8](__x);
  return result;
}

uint64_t espresso_buffer_pack_tensor_shape()
{
  return MEMORY[0x1E0D1FEE8]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1E0D1FF10]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1E0D1FF38]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1E0D1FF40]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1E0D1FFB8]();
}

uint64_t espresso_network_change_input_blob_shapes_seq_rank()
{
  return MEMORY[0x1E0D20028]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x1E0D20040]();
}

uint64_t espresso_network_query_blob_dimensions()
{
  return MEMORY[0x1E0D20060]();
}

uint64_t espresso_network_query_blob_shape()
{
  return MEMORY[0x1E0D20070]();
}

uint64_t espresso_network_select_configuration()
{
  return MEMORY[0x1E0D20080]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1E0D200B0]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1E0D200C8]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x1E0D200D8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1E0D200E8]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1E0D20100]();
}

uint64_t espresso_plan_get_error_info()
{
  return MEMORY[0x1E0D20110]();
}

uint64_t espresso_plan_set_priority()
{
  return MEMORY[0x1E0D20130]();
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fmemopen(void *__buf, size_t __size, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83438](__buf, __size, __mode);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int getpagesize(void)
{
  return MEMORY[0x1E0C83740]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

float log2f(float a1)
{
  float result;

  MEMORY[0x1E0C83BF0](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1E0C83DB0]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1E0C84170](a1);
}

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x1E0C841D0](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x1E0C84218](a1, a2);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
  MEMORY[0x1E0DE7C20](dest, src, copyHelper);
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D20](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
  MEMORY[0x1E0C84D88](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1E0C84DD8](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

void qsort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
  MEMORY[0x1E0C84F98](__base, __nel, __width, a4, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85460](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

float tanhf(float a1)
{
  float result;

  MEMORY[0x1E0C85800](a1);
  return result;
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1E0C85908](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C0D0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_dotprD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C0E0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1E8](__A, __IA, __C, __N);
}

void vDSP_meanvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1F0](__A, __IA, __C, __N);
}

void vDSP_measqv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1F8](__A, __IA, __C, __N);
}

void vDSP_mmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x1E0C8C258](__A, __IA, __B, __IB, __C, __IC, __M, __N);
}

void vDSP_mtrans(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
  MEMORY[0x1E0C8C260](__A, __IA, __C, __IC, __M, __N);
}

void vDSP_mtransD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __M, vDSP_Length __N)
{
  MEMORY[0x1E0C8C270](__A, __IA, __C, __IC, __M, __N);
}

void vDSP_rmsqv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C2C0](__A, __IA, __C, __N);
}

void vDSP_rmsqvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C2C8](__A, __IA, __C, __N);
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C2E8](__A, __I, __C, __N);
}

void vDSP_sveD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C2F8](__A, __I, __C, __N);
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x1E0C8C328](__A, __IA, __C, __N);
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C368](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C378](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vclip(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C3D8](__A, __IA, __B, __C, __D, __ID, __N);
}

void vDSP_vdiv(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C448](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vdivD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C450](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vfixr8(const float *__A, vDSP_Stride __IA, char *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C4F8](__A, __IA, __C, __IC, __N);
}

void vDSP_vflt8(const char *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C5C8](__A, __IA, __C, __IC, __N);
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C740](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vmulD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C748](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C800](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsaddD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C810](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsdiv(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C860](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsdivD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C868](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsma(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, vDSP_Stride __IC, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C888](__A, __IA, __B, __C, __IC, __D, __ID, __N);
}

void vDSP_vsmsa(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x1E0C8C898](__A, __IA, __B, __C, __D, __ID, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C8E8](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vsqD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C928](__A, __IA, __C, __IC, __N);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C940](__B, __IB, __A, __IA, __C, __IC, __N);
}

void vDSP_vsubD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C950](__B, __IB, __A, __IA, __C, __IC, __N);
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CF28](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CFC0](src, dest, *(_QWORD *)&flags);
}

vFloat vexpf(vFloat a1)
{
  uint64_t v1;
  uint64_t v2;
  vFloat result;

  v1 = MEMORY[0x1E0C8D888](a1.i64[0], a1.i64[1]);
  result.i64[1] = v2;
  result.i64[0] = v1;
  return result;
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

void vvexp(double *a1, const double *a2, const int *a3)
{
  MEMORY[0x1E0C8D9B0](a1, a2, a3);
}

void vvexpf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x1E0C8D9D8](a1, a2, a3);
}

void vvlog(double *a1, const double *a2, const int *a3)
{
  MEMORY[0x1E0C8DA48](a1, a2, a3);
}

void vvtanhf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x1E0C8DBB0](a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

