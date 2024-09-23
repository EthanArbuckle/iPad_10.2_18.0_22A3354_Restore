void sub_11E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1288(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1480(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_157C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1628(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_181C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1960(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1B1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1B64(uint64_t a1, void *a2, GPUTools::GL::WireframeRenderer *a3, unsigned int a4, unsigned int a5, unsigned int a6, void **a7, uint64_t a8, float a9)
{
  id v17;
  int v18;
  uint64_t (**v19)(id, uint64_t);
  id v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  unint64_t v29;
  GPUTools::GL *v30;
  unsigned int v31;
  uint64_t v32;
  void **v33;
  unsigned int v34;
  GPUTools::GL *v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t LineListFromTriList;
  GPUTools::GL::WireframeRenderer *v39;
  unsigned int v40;
  BOOL v41;
  uint64_t v42;
  unsigned int v43;
  BOOL v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unsigned int v50;
  void **v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  id v58;
  unsigned int v59;
  unsigned int v60;
  void *v61;
  int v62;
  int v63;
  unsigned int v64;
  _BYTE v65[4];
  unsigned int v66;
  unsigned __int8 v67;
  float v68[4];

  v17 = a2;
  if ((GPUTools::GL::WireframeRenderer::IsBadDrawCall(a3, a5, a8, v18) & 1) != 0)
  {
LABEL_73:

    return;
  }
  v58 = v17;
  v19 = (uint64_t (**)(id, uint64_t))objc_msgSend(v17, "gliDispatch");
  v20 = objc_msgSend(v17, "gliContext");
  v54 = v19[143](v20, 2929);
  v67 = 0;
  ((void (*)(id, uint64_t, unsigned __int8 *))v19[99])(v20, 2930, &v67);
  v19[63](v20, 2929);
  v19[61](v20, 0);
  v53 = v19[143](v20, 2960);
  v66 = 0;
  ((void (*)(id, uint64_t, unsigned int *))v19[104])(v20, 2968, &v66);
  v19[63](v20, 2960);
  v19[255](v20, 0);
  v50 = a4;
  v51 = a7;
  v59 = a5;
  ((void (*)(id, uint64_t, _BYTE *))v19[99])(v20, 3107, v65);
  ((void (*)(id, uint64_t, uint64_t, uint64_t, uint64_t))v19[49])(v20, 1, 1, 1, 1);
  v21 = v19[143](v20, 2896);
  v19[63](v20, 2896);
  v22 = v19[143](v20, 2912);
  v19[63](v20, 2912);
  v23 = v19[143](v20, 3042);
  v19[63](v20, 3042);
  v57 = v19[143](v20, 3058);
  v19[63](v20, 3058);
  v56 = v19[143](v20, 2884);
  v19[63](v20, 2884);
  v64 = 0;
  ((void (*)(id, uint64_t, unsigned int *))v19[104])(v20, 34016, &v64);
  v60 = a6;
  v63 = 0;
  ((void (*)(id, uint64_t, int *))v19[104])(v20, 2849, &v63);
  ((void (*)(id, float))v19[155])(v20, a9);
  v24 = *(_QWORD *)(a1 + 8);
  v25 = *(_QWORD *)(a1 + 16);
  v55 = v21;
  if (v25 == v24)
  {
    v68[0] = 0.0;
    ((void (*)(id, uint64_t, float *))v19[104])(v20, 34018, v68);
    LOBYTE(v61) = 0;
    v24 = *(_QWORD *)(a1 + 8);
    v25 = *(_QWORD *)(a1 + 16);
    if (SLODWORD(v68[0]) <= (unint64_t)(v25 - v24))
    {
      v26 = a8;
      v27 = v22;
      if (SLODWORD(v68[0]) < (unint64_t)(v25 - v24))
      {
        v25 = v24 + SLODWORD(v68[0]);
        *(_QWORD *)(a1 + 16) = v25;
      }
    }
    else
    {
      v26 = a8;
      sub_24F8((_QWORD *)(a1 + 8), SLODWORD(v68[0]) - (v25 - v24), &v61);
      v27 = v22;
      v24 = *(_QWORD *)(a1 + 8);
      v25 = *(_QWORD *)(a1 + 16);
    }
  }
  else
  {
    v26 = a8;
    v27 = v22;
  }
  v28 = v23;
  if (v25 != v24)
  {
    v29 = 0;
    do
    {
      v19[342](v20, (v29 + 33984));
      *(_BYTE *)(*(_QWORD *)(a1 + 8) + v29) = v19[143](v20, 3553);
      v19[63](v20, 3553);
      ++v29;
    }
    while (v29 < *(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 8));
  }
  v52 = v19[143](v20, 32886);
  v19[64](v20, 32886);
  ((void (*)(id, uint64_t, float *))v19[103])(v20, 2816, v68);
  v30 = (GPUTools::GL *)a6;
  ((void (*)(id, float, float, float, float))v19[37])(v20, 1.0, 1.0, 1.0, 1.0);
  if (((_DWORD)a3 - 4) > 2)
  {
    if (a6)
    {
      if ((int)v26 < 2)
        ((void (*)(id, GPUTools::GL::WireframeRenderer *, _QWORD, _QWORD, void **))v19[67])(v20, a3, v59, a6, v51);
      else
        ((void (*)(id, GPUTools::GL::WireframeRenderer *, _QWORD, _QWORD, void **, uint64_t))v19[763])(v20, a3, v59, a6, v51, v26);
    }
    else if ((int)v26 < 2)
    {
      ((void (*)(id, GPUTools::GL::WireframeRenderer *, _QWORD, _QWORD, uint64_t))v19[762])(v20, a3, v50, v59, v26);
    }
    else
    {
      ((void (*)(id, GPUTools::GL::WireframeRenderer *, _QWORD, _QWORD))v19[65])(v20, a3, v50, v59);
    }
LABEL_51:
    ((void (*)(id, float))v19[155])(v20, (float)v63);
    if (v55)
      v19[72](v20, 2896);
    if (v56)
      v19[72](v20, 2884);
    if (v27)
      v19[72](v20, 2912);
    if (v57)
      v19[72](v20, 3058);
    if (v28)
      v19[72](v20, 3042);
    v48 = *(_QWORD *)(a1 + 8);
    v47 = *(_QWORD *)(a1 + 16);
    if (v47 != v48)
    {
      v49 = 0;
      do
      {
        if (*(_BYTE *)(v48 + v49))
        {
          v19[342](v20, (v49 + 33984));
          v19[72](v20, 3553);
          v48 = *(_QWORD *)(a1 + 8);
          v47 = *(_QWORD *)(a1 + 16);
        }
        ++v49;
      }
      while (v49 < v47 - v48);
    }
    v19[342](v20, v64);
    if (v52)
      v19[73](v20, 32886);
    ((void (*)(id, float, float, float, float))v19[37])(v20, v68[0], v68[1], v68[2], v68[3]);
    ((void (*)(id, _QWORD, _QWORD, _QWORD, _QWORD))v19[49])(v20, v65[0], v65[1], v65[2], v65[3]);
    if (v53)
      v19[72](v20, 2960);
    v19[255](v20, v66);
    if (v54)
      v19[72](v20, 2929);
    v19[61](v20, v67);
    v17 = v58;
    goto LABEL_73;
  }
  if (!a6)
  {
    v62 = 0;
    ((void (*)(id, uint64_t, int *))v19[104])(v20, 34965, &v62);
    if (v62)
      ((void (*)(id, uint64_t, _QWORD))v19[642])(v20, 34963, 0);
    if ((int)(v59 + v50) >= 256)
      v35 = (GPUTools::GL *)(&loc_1400 + 3);
    else
      v35 = (GPUTools::GL *)(&loc_1400 + 1);
    v61 = 0;
    if ((_DWORD)a3 == 4)
    {
      v36 = GPUTools::GL::dy_type_size(v35, v34);
      LineListFromTriList = GPUTools::GL::WireframeRenderer::CreateLineListFromTriList((GPUTools::GL::WireframeRenderer *)&v61, (void **)v50, v59, v36, v37);
    }
    else
    {
      v45 = GPUTools::GL::dy_type_size(v35, v34);
      if ((_DWORD)a3 == 5)
        LineListFromTriList = GPUTools::GL::WireframeRenderer::CreateLineListFromTriStrip((GPUTools::GL::WireframeRenderer *)&v61, (void **)v50, v59, v45, v46);
      else
        LineListFromTriList = GPUTools::GL::WireframeRenderer::CreateLineListFromTriFan((GPUTools::GL::WireframeRenderer *)&v61, (void **)v50, v59, v45, v46);
    }
    if ((int)v26 < 2)
      ((void (*)(id, uint64_t, uint64_t, GPUTools::GL *, void *))v19[67])(v20, 1, LineListFromTriList, v35, v61);
    else
      ((void (*)(id, uint64_t, uint64_t, GPUTools::GL *, void *, uint64_t))v19[763])(v20, 1, LineListFromTriList, v35, v61, v26);
    free(v61);
    if (v62)
      v19[642](v20, 34963);
    goto LABEL_51;
  }
  v62 = 0;
  ((void (*)(id, uint64_t, int *))v19[104])(v20, 34965, &v62);
  if (!v62)
  {
    v33 = v51;
    if (!v51)
      goto LABEL_43;
LABEL_31:
    v39 = (GPUTools::GL::WireframeRenderer *)v33;
    v61 = 0;
    if ((_DWORD)a3 == 4)
    {
      v40 = GPUTools::GL::dy_type_size(v30, v31);
      v42 = GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriList(v39, &v61, (void **)v59, v40, 0, v41);
    }
    else
    {
      v43 = GPUTools::GL::dy_type_size(v30, v31);
      if ((_DWORD)a3 == 5)
        v42 = GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriStrip(v39, &v61, (void **)v59, v43, 0, v44);
      else
        v42 = GPUTools::GL::WireframeRenderer::CreateLineListFromIndexedTriFan(v39, &v61, (void **)v59, v43, 0, v44);
    }
    if ((int)v26 < 2)
      ((void (*)(id, uint64_t, uint64_t, GPUTools::GL *, void *))v19[67])(v20, 1, v42, v30, v61);
    else
      ((void (*)(id, uint64_t, uint64_t, GPUTools::GL *, void *, uint64_t))v19[763])(v20, 1, v42, v30, v61, v26);
    free(v61);
LABEL_43:
    if (v62)
    {
      v19[642](v20, 34963);
      v19[650](v20, 34963);
    }
    goto LABEL_51;
  }
  LODWORD(v61) = 0;
  ((void (*)(id, uint64_t, uint64_t, void **))v19[651])(v20, 34963, 34660, &v61);
  v32 = ((uint64_t (*)(id, uint64_t, _QWORD, _QWORD, uint64_t))v19[795])(v20, 34963, 0, (int)v61, 1);
  if (v32)
  {
    ((void (*)(id, uint64_t, _QWORD))v19[642])(v20, 34963, 0);
    v33 = (void **)((char *)v51 + v32);
    v30 = (GPUTools::GL *)v60;
    if (!(void **)((char *)v51 + v32))
      goto LABEL_43;
    goto LABEL_31;
  }
  dy_abort("Unable to map element array buffer");
  __break(1u);
}

void sub_2410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_2498(GPUTools::GL::WireframeRenderer *a1)
{
  sub_24BC(a1);
  operator delete();
}

void sub_24BC(GPUTools::GL::WireframeRenderer *this)
{
  void *v2;

  *(_QWORD *)this = &off_24660;
  v2 = (void *)*((_QWORD *)this + 1);
  if (v2)
  {
    *((_QWORD *)this + 2) = v2;
    operator delete(v2);
  }
  GPUTools::GL::WireframeRenderer::~WireframeRenderer(this);
}

void sub_24F8(_QWORD *a1, unint64_t a2, _BYTE *a3)
{
  unint64_t v4;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  _BYTE *v13;
  char *v14;
  char *v15;
  _BYTE *v16;
  _BYTE *v17;
  char v18;

  v4 = a2;
  v7 = (_BYTE *)a1[1];
  v6 = a1[2];
  if (v6 - (uint64_t)v7 >= a2)
  {
    if (a2)
    {
      v13 = &v7[a2];
      do
      {
        *v7++ = *a3;
        --v4;
      }
      while (v4);
      v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = &v7[-*a1];
    v9 = (unint64_t)&v8[a2];
    if ((uint64_t)&v8[a2] < 0)
      sub_2610();
    v10 = v6 - *a1;
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v11 = v9;
    if (v11)
      v12 = operator new(v11);
    else
      v12 = 0;
    v14 = &v8[(_QWORD)v12];
    v15 = &v8[(_QWORD)v12 + v4];
    v16 = &v8[(_QWORD)v12];
    do
    {
      *v16++ = *a3;
      --v4;
    }
    while (v4);
    v17 = (_BYTE *)*a1;
    if (v7 != (_BYTE *)*a1)
    {
      do
      {
        v18 = *--v7;
        *--v14 = v18;
      }
      while (v7 != v17);
      v7 = (_BYTE *)*a1;
    }
    *a1 = v14;
    a1[1] = v15;
    a1[2] = (char *)v12 + v11;
    if (v7)
      operator delete(v7);
  }
}

void sub_2610()
{
  sub_2624("vector");
}

void sub_2624(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2674(exception, a1);
}

void sub_2660(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2674(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_2698(uint64_t a1)
{
  uint64_t v2;
  _QWORD *i;
  _QWORD *j;
  uint64_t v5;
  id *v6;

  *(_QWORD *)a1 = off_246C8;
  v2 = a1 + 152;
  for (i = *(_QWORD **)(a1 + 168); i; i = (_QWORD *)*i)
  {
    for (j = (_QWORD *)i[5]; j; j = (_QWORD *)*j)
    {
      if (j[3])
        operator delete();
    }
  }
  sub_4A04(a1 + 232);
  sub_4948(a1 + 192);
  sub_4948(v2);
  sub_4948(a1 + 112);
  sub_48CC(a1 + 72);
  sub_48CC(a1 + 32);
  v5 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (v5)
    operator delete();
  v6 = *(id **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v6)
    sub_5594(a1 + 16, v6);

  GPUTools::GL::WireframeRenderer::~WireframeRenderer((GPUTools::GL::WireframeRenderer *)a1);
}

void sub_2778(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_278C(uint64_t a1)
{
  sub_2698(a1);
  operator delete();
}

uint64_t sub_27B0(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v5;
  uint64_t v7;

  v7 = a3;
  if (a4)
    v5 = DYCreatePrivateGLShader(**(_QWORD **)a1);
  else
    v5 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 8) + 4752))(*(_QWORD *)(*(_QWORD *)a1 + 16));
  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t *, _QWORD))(*(_QWORD *)(a1 + 8) + 4760))(*(_QWORD *)(*(_QWORD *)a1 + 16), v5, 1, &v7, 0);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 8) + 4768))(*(_QWORD *)(*(_QWORD *)a1 + 16), v5);
  return v5;
}

uint64_t sub_2848(uint64_t a1)
{
  int v3;
  Dispatcher *v4;

  LODWORD(v4) = 0;
  (*(void (**)(_QWORD, uint64_t, Dispatcher **))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) + 832))(*(_QWORD *)(**(_QWORD **)(a1 + 24) + 16), 35725, &v4);
  if ((_DWORD)v4)
  {
    v3 = 0;
    (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) + 5264))(*(_QWORD *)(**(_QWORD **)(a1 + 24)
                                                                                                  + 16));
  }
  return 0;
}

void sub_29CC()
{
  operator delete[]();
}

uint64_t sub_2A14(uint64_t a1, void *a2, unsigned int a3)
{
  id v5;
  _QWORD *v6;
  uint64_t *v7;
  uint64_t v8;
  id v10;
  unsigned int v11;

  v5 = a2;
  v11 = a3;
  v10 = v5;
  v6 = sub_55DC((_QWORD *)(a1 + 192), (unint64_t *)&v10);
  if (v6 && (v7 = sub_6608(v6 + 3, &v11)) != 0)
    v8 = *(unsigned int *)v7[3];
  else
    v8 = 0;

  return v8;
}

void sub_2A8C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_2AA0(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = sub_27B0(*(_QWORD *)(a1 + 24), 35632, a2, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 8), "context"));
  v5 = DYCreatePrivateGLProgram();

  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) + 5512))(*(_QWORD *)(**(_QWORD **)(a1 + 24) + 16), v5, 33368, 1);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) + 4784))(*(_QWORD *)(**(_QWORD **)(a1 + 24) + 16), v5, v3);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) + 4792))(*(_QWORD *)(**(_QWORD **)(a1 + 24) + 16), v5);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) + 4744))(*(_QWORD *)(**(_QWORD **)(a1 + 24) + 16), v5, v3);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) + 4728))(*(_QWORD *)(**(_QWORD **)(a1 + 24) + 16), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 8), "context"));
  v7 = DYCreatePrivateGLProgramPipeline();

  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) + 6552))(*(_QWORD *)(**(_QWORD **)(a1 + 24) + 16), v7, 2, v5);
  return v7;
}

void sub_2BC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_2BDC(uint64_t a1, uint64_t a2)
{
  int v2;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  int v9;
  _QWORD *v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  _DWORD *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  int v24;
  void *v25;
  char *v26;
  int v27;
  _QWORD *v28;
  _QWORD *v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  _DWORD *v33;
  char *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  int v42;
  uint64_t v43;
  uint64_t result;
  void *v45;
  unsigned int v46;
  unint64_t *v47;

  v2 = a2;
  v46 = 0;
  (*(void (**)(_QWORD, uint64_t, uint64_t, unsigned int *))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) + 6608))(*(_QWORD *)(**(_QWORD **)(a1 + 24) + 16), a2, 35633, &v46);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 8), "context"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sharegroup"));

  v45 = v5;
  v47 = (unint64_t *)&v45;
  v6 = sub_4A78(a1 + 112, (unint64_t *)&v45, (uint64_t)&unk_237D1, &v47);
  v47 = (unint64_t *)&v46;
  v7 = *((unsigned int *)sub_4F84((uint64_t)(v6 + 3), &v46, (uint64_t)&unk_237D1, (_DWORD **)&v47) + 5);
  v47 = *(unint64_t **)(**(_QWORD **)(a1 + 24) + 16);
  v8 = sub_51A4((_QWORD *)(a1 + 72), &v47);
  if (!v8)
  {
    v9 = sub_2AA0(a1, (uint64_t)"void main() { gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0); }");
    v45 = *(void **)(**(_QWORD **)(a1 + 24) + 16);
    v47 = (unint64_t *)&v45;
    v10 = sub_5290(a1 + 72, &v45, (uint64_t)&unk_237D1, &v47);
    v11 = v10;
    v12 = (char *)v10[4];
    v13 = (uint64_t)(v10 + 5);
    v14 = v10[5];
    if ((unint64_t)v12 >= v14)
    {
      v16 = (char *)v10[3];
      v17 = (v12 - v16) >> 2;
      if ((unint64_t)(v17 + 1) >> 62)
        sub_2610();
      v18 = v14 - (_QWORD)v16;
      v19 = (uint64_t)(v14 - (_QWORD)v16) >> 1;
      if (v19 <= v17 + 1)
        v19 = v17 + 1;
      if (v18 >= 0x7FFFFFFFFFFFFFFCLL)
        v20 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v20 = v19;
      if (v20)
      {
        v21 = (char *)sub_5560(v13, v20);
        v16 = (char *)v11[3];
        v12 = (char *)v11[4];
      }
      else
      {
        v21 = 0;
      }
      v22 = &v21[4 * v17];
      v23 = &v21[4 * v20];
      *(_DWORD *)v22 = v9;
      v15 = v22 + 4;
      while (v12 != v16)
      {
        v24 = *((_DWORD *)v12 - 1);
        v12 -= 4;
        *((_DWORD *)v22 - 1) = v24;
        v22 -= 4;
      }
      v11[3] = v22;
      v11[4] = v15;
      v11[5] = v23;
      if (v16)
        operator delete(v16);
    }
    else
    {
      *(_DWORD *)v12 = v9;
      v15 = v12 + 4;
    }
    v11[4] = v15;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 8), "context"));
    v26 = (char *)objc_msgSend(v25, "API");

    if (v26 == (_BYTE *)&dword_0 + 3)
    {
      v27 = sub_2AA0(a1, (uint64_t)"#version 300 es\nout lowp vec4 fragColor;\n"
                       "void main() { fragColor = vec4(1.0, 1.0, 1.0, 1.0); }");
      v45 = *(void **)(**(_QWORD **)(a1 + 24) + 16);
      v47 = (unint64_t *)&v45;
      v28 = sub_5290(a1 + 72, &v45, (uint64_t)&unk_237D1, &v47);
      v29 = v28;
      v30 = (char *)v28[4];
      v31 = (uint64_t)(v28 + 5);
      v32 = v28[5];
      if ((unint64_t)v30 >= v32)
      {
        v34 = (char *)v28[3];
        v35 = (v30 - v34) >> 2;
        if ((unint64_t)(v35 + 1) >> 62)
          sub_2610();
        v36 = v32 - (_QWORD)v34;
        v37 = (uint64_t)(v32 - (_QWORD)v34) >> 1;
        if (v37 <= v35 + 1)
          v37 = v35 + 1;
        if (v36 >= 0x7FFFFFFFFFFFFFFCLL)
          v38 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v38 = v37;
        if (v38)
        {
          v39 = (char *)sub_5560(v31, v38);
          v34 = (char *)v29[3];
          v30 = (char *)v29[4];
        }
        else
        {
          v39 = 0;
        }
        v40 = &v39[4 * v35];
        v41 = &v39[4 * v38];
        *(_DWORD *)v40 = v27;
        v33 = v40 + 4;
        while (v30 != v34)
        {
          v42 = *((_DWORD *)v30 - 1);
          v30 -= 4;
          *((_DWORD *)v40 - 1) = v42;
          v40 -= 4;
        }
        v29[3] = v40;
        v29[4] = v33;
        v29[5] = v41;
        if (v34)
          operator delete(v34);
      }
      else
      {
        *(_DWORD *)v30 = v27;
        v33 = v30 + 4;
      }
      v29[4] = v33;
    }
    v45 = *(void **)(**(_QWORD **)(a1 + 24) + 16);
    v47 = (unint64_t *)&v45;
    v8 = sub_5290(a1 + 72, &v45, (uint64_t)&unk_237D1, &v47);
  }
  v43 = *(unsigned int *)(v8[3] + 4 * v7);
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) + 6552))(*(_QWORD *)(**(_QWORD **)(a1 + 24) + 16), v43, 1, v46);
  LODWORD(v47) = 0;
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 8) + 6616))(*(_QWORD *)(**(_QWORD **)(a1 + 24) + 16), v43);
  (*(void (**)(_QWORD, uint64_t, uint64_t, unint64_t **))(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 8)
                                                                        + 6608))(*(_QWORD *)(**(_QWORD **)(a1 + 24) + 16), v43, 35715, &v47);
  if ((_DWORD)v47)
  {

    return v43;
  }
  else
  {
    result = dy_abort("unable to validate wireframe pipeline for pipeline: %d", v2);
    __break(1u);
  }
  return result;
}

void sub_2FC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_3008(uint64_t a1, void *a2, GPUTools::GL::WireframeRenderer *a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, int a8)
{
  int v13;
  id v14;

  v14 = a2;
  if ((GPUTools::GL::WireframeRenderer::IsBadDrawCall(a3, a5, a8, v13) & 1) == 0)
  {
    objc_storeStrong((id *)(a1 + 8), a2);
    operator new();
  }

}

void sub_3AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

id *sub_3BD4(id *location, void **a2)
{
  id v4;
  void *v5;

  v4 = *a2;
  if (*location != v4)
  {
    objc_storeStrong(location, v4);
    v5 = *a2;
    *a2 = 0;

  }
  return location;
}

void sub_3C1C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  id v5;
  int v6;
  _DWORD v7[2];

  v7[1] = a3;
  v5 = *(id *)(*a2 + 8);
  v7[0] = 0;
  (*(void (**)(_QWORD, uint64_t, uint64_t, _DWORD *))(a2[1] + 5256))(*(_QWORD *)(*a2 + 16), a3, 35663, v7);
  if (v7[0] == 35633)
  {
    v6 = 0;
    (*(void (**)(_QWORD, uint64_t, uint64_t, int *))(a2[1] + 5256))(*(_QWORD *)(*a2 + 16), a3, 35713, &v6);
    if (v6 == 1)
      sub_4124(a2);
  }

}

void sub_40C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_4124(_QWORD *a1)
{
  int v1;

  v1 = 0;
  (*(void (**)(_QWORD))(a1[1] + 5256))(*(_QWORD *)(*a1 + 16));
  operator new[]();
}

void sub_4230()
{
  operator delete[]();
}

uint64_t *sub_4260(uint64_t a1, _QWORD *a2, _QWORD *a3, unsigned int a4)
{
  uint64_t *result;
  unsigned int *v7;
  int v8;
  unsigned int v9;

  v9 = a4;
  result = sub_6608(a3, &v9);
  if (result)
  {
    v7 = (unsigned int *)result[3];
    v8 = v7[2] - 1;
    v7[2] = v8;
    if (!v8)
    {
      (*(void (**)(_QWORD, _QWORD))(a2[1] + 4728))(*(_QWORD *)(*a2 + 16), *v7);
      operator delete();
    }
    return (uint64_t *)sub_66BC(a3, result);
  }
  return result;
}

void sub_42F4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  int v6;
  unint64_t *v7;
  unint64_t *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  int v15;
  _QWORD *v16;
  unint64_t *v17;
  __int128 v18;
  __int128 v19;
  int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  unint64_t *v24;

  v22 = 0;
  v23 = a3;
  (*(void (**)(_QWORD, uint64_t, uint64_t, int *))(a2[1] + 5264))(*(_QWORD *)(*a2 + 16), a3, 35714, &v22);
  if (v22)
  {
    v21 = sub_45C8(a2, a3, 35633);
    if (v21)
    {
      v6 = sub_45C8(a2, v23, 35632);
      v7 = (unint64_t *)*(id *)(*a2 + 8);
      v8 = v7;
      if (v6)
      {
        *(_QWORD *)&v18 = v7;
        v9 = (uint64_t)sub_55DC((_QWORD *)(a1 + 192), (unint64_t *)&v18);
        v10 = (_QWORD *)v9;
        if (!v9)
        {
          v18 = 0u;
          v19 = 0u;
          v20 = 1065353216;
          v17 = v8;
          v24 = (unint64_t *)&v17;
          v11 = sub_5D8C(a1 + 192, (unint64_t *)&v17, (uint64_t)&unk_237D1, &v24);
          if (v11 + 3 != (_QWORD *)&v18)
          {
            *((_DWORD *)v11 + 14) = v20;
            sub_5FF8(v11 + 3, (uint64_t *)v19, 0);
          }
          v17 = v8;
          v24 = (unint64_t *)&v17;
          v10 = sub_5D8C(a1 + 192, (unint64_t *)&v17, (uint64_t)&unk_237D1, &v24);
          v9 = sub_49BC((uint64_t)&v18);
        }
        sub_4260(v9, a2, v10 + 3, v23);
        v24 = v8;
        *(_QWORD *)&v18 = &v24;
        v12 = sub_5D8C(a1 + 152, (unint64_t *)&v24, (uint64_t)&unk_237D1, (_QWORD **)&v18);
        *(_QWORD *)&v18 = &v21;
        v13 = sub_5B68((uint64_t)(v12 + 3), &v21, (uint64_t)&unk_237D1, (_DWORD **)&v18)[3];
        ++*(_DWORD *)(v13 + 8);
        *(_QWORD *)&v18 = &v23;
        sub_5B68((uint64_t)(v10 + 3), &v23, (uint64_t)&unk_237D1, (_DWORD **)&v18)[3] = v13;
      }
      else
      {
        v24 = v7;
        *(_QWORD *)&v18 = &v24;
        v14 = sub_5D8C(a1 + 152, (unint64_t *)&v24, (uint64_t)&unk_237D1, (_QWORD **)&v18);
        *(_QWORD *)&v18 = &v21;
        v15 = *(_DWORD *)(sub_5B68((uint64_t)(v14 + 3), &v21, (uint64_t)&unk_237D1, (_DWORD **)&v18)[3] + 4);
        v24 = v8;
        *(_QWORD *)&v18 = &v24;
        v16 = sub_4A78(a1 + 112, (unint64_t *)&v24, (uint64_t)&unk_237D1, (_QWORD **)&v18);
        *(_QWORD *)&v18 = &v23;
        *((_DWORD *)sub_4F84((uint64_t)(v16 + 3), &v23, (uint64_t)&unk_237D1, (_DWORD **)&v18) + 5) = v15;
      }

    }
  }
}

void sub_4590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  va_list va;

  va_start(va, a3);
  sub_49BC((uint64_t)va);

  _Unwind_Resume(a1);
}

uint64_t sub_45C8(_QWORD *a1, uint64_t a2, int a3)
{
  uint64_t v5;
  int v7;
  int v8;
  _DWORD v9[2];

  v8 = 2;
  (*(void (**)(_QWORD, uint64_t, uint64_t, int *, _DWORD *))(a1[1] + 6072))(*(_QWORD *)(*a1 + 16), a2, 2, &v8, v9);
  if (v8 < 1)
    return 0;
  v5 = 0;
  while (1)
  {
    v7 = 0;
    (*(void (**)(_QWORD, _QWORD, uint64_t, int *))(a1[1] + 5256))(*(_QWORD *)(*a1 + 16), v9[v5], 35663, &v7);
    if (v7 == a3)
      break;
    if (++v5 >= v8)
      return 0;
  }
  return v9[v5];
}

void sub_46B8(uint64_t a1, id **a2, uint64_t a3, int a4, int a5, const std::string::value_type **a6)
{
  uint64_t v7;
  id v10;
  std::string *v11;
  unsigned int v12;
  _BOOL4 v13;
  _QWORD *v14;
  id v15;
  unsigned int v16;
  std::string v17;
  int v18;
  unsigned int v19;
  unint64_t *v20;

  v19 = a3;
  if (a4 == 35633)
  {
    LODWORD(v7) = a5;
    v18 = 0;
    ((void (*)(id, uint64_t, uint64_t, int *))a2[1][658])((*a2)[2], a3, 35714, &v18);
    if (v18)
    {
      memset(&v17, 0, sizeof(v17));
      if ((int)v7 >= 1)
      {
        v7 = v7;
        do
        {
          std::string::append(&v17, *a6++);
          --v7;
        }
        while (v7);
      }
      v10 = (*a2)[1];
      if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v11 = &v17;
      else
        v11 = (std::string *)v17.__r_.__value_.__r.__words[0];
      v12 = sub_27B0((uint64_t)a2, 35633, (uint64_t)v11, 0);
      v16 = v12;
      objc_msgSend(**a2, "getParameter:to:", 1710, &v16);
      ((void (*)(id, _QWORD))a2[1][591])((*a2)[2], v12);
      v13 = v16 == 300;
      v15 = v10;
      v20 = (unint64_t *)&v15;
      v14 = sub_4A78(a1 + 112, (unint64_t *)&v15, (uint64_t)&unk_237D1, &v20);
      v20 = (unint64_t *)&v19;
      *((_DWORD *)sub_4F84((uint64_t)(v14 + 3), &v19, (uint64_t)&unk_237D1, (_DWORD **)&v20) + 5) = v13;

      if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v17.__r_.__value_.__l.__data_);
    }
  }
}

void sub_4828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;

  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_QWORD *sub_485C(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  *a1 = v3;
  a1[1] = 0;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sharegroup"));
  v5 = (void *)a1[1];
  a1[1] = v4;

  a1[2] = GLIContextFromEAGLContext(*a1);
  a1[3] = GLCFrontDispatch(*a1);
  a1[4] = GLCBackDispatch(*a1);

  return a1;
}

uint64_t sub_48CC(uint64_t a1)
{
  void *v2;

  sub_4904(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void sub_4904(int a1, _QWORD *__p)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (_QWORD *)*v2;
      v4 = (void *)v2[3];
      if (v4)
      {
        v2[4] = v4;
        operator delete(v4);
      }
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_4948(uint64_t a1)
{
  void *v2;

  sub_4980(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void sub_4980(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      sub_49BC((uint64_t)(v2 + 3));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t sub_49BC(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

uint64_t sub_4A04(uint64_t a1)
{
  void *v2;

  sub_4A3C(a1, *(id **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void sub_4A3C(uint64_t a1, id *a2)
{
  id *v2;
  id *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (id *)*v2;

      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

_QWORD *sub_4A78(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD v24[2];
  char v25;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = (_QWORD *)*v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v13 = a1 + 16;
  v14 = (char *)operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = v7;
  *((_QWORD *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  v25 = 1;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    v17 = 1;
    if (v8 >= 3)
      v17 = (v8 & (v8 - 1)) != 0;
    v18 = v17 | (2 * v8);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    sub_4D0C(a1, v20);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *(_QWORD *)v24[0] = *v21;
    *v21 = v24[0];
  }
  else
  {
    *(_QWORD *)v24[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v24[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = v13;
    if (*(_QWORD *)v24[0])
    {
      v22 = *(_QWORD *)(*(_QWORD *)v24[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8)
          v22 %= v8;
      }
      else
      {
        v22 &= v8 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v22) = v24[0];
    }
  }
  v11 = (_QWORD *)v24[0];
  v24[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  sub_4F40((uint64_t)v24, 0);
  return v11;
}

void sub_4CCC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_4F40((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void sub_4CE4()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_4D0C(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      sub_4DE8(a1, prime);
  }
}

void sub_4DE8(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      sub_4CE4();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void sub_4F40(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      sub_49BC((uint64_t)v2 + 24);
    operator delete(v2);
  }
}

_QWORD *sub_4F84(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v11 = operator new(0x18uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((_DWORD *)v11 + 5) = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    sub_4D0C(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *v11 = *v20;
LABEL_38:
    *v20 = v11;
    goto LABEL_39;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    v21 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_5190(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_51A4(_QWORD *a1, _QWORD *a2)
{
  int8x8_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint8x8_t v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *result;
  unint64_t v10;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  v4 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v3 >> 47) ^ v3);
  v5 = 0x9DDFEA08EB382D69 * (v4 ^ (v4 >> 47));
  v6 = (uint8x8_t)vcnt_s8(v2);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    v7 = v5;
    if (v5 >= *(_QWORD *)&v2)
      v7 = v5 % *(_QWORD *)&v2;
  }
  else
  {
    v7 = v5 & (*(_QWORD *)&v2 - 1);
  }
  v8 = *(_QWORD **)(*a1 + 8 * v7);
  if (!v8)
    return 0;
  result = (_QWORD *)*v8;
  if (*v8)
  {
    do
    {
      v10 = result[1];
      if (v10 == v5)
      {
        if (result[2] == *a2)
          return result;
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v10 >= *(_QWORD *)&v2)
            v10 %= *(_QWORD *)&v2;
        }
        else
        {
          v10 &= *(_QWORD *)&v2 - 1;
        }
        if (v10 != v7)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

_QWORD *sub_5290(uint64_t a1, _QWORD *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  _QWORD **v12;
  _QWORD *i;
  unint64_t v14;
  _QWORD *v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  uint64_t v22;
  _QWORD *v23;
  unint64_t v24;

  v7 = 0x9DDFEA08EB382D69 * ((8 * *a2 + 8) ^ HIDWORD(*a2));
  v8 = 0x9DDFEA08EB382D69 * (HIDWORD(*a2) ^ (v7 >> 47) ^ v7);
  v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      v4 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
      if (v9 >= v10)
        v4 = v9 % v10;
    }
    else
    {
      v4 = v9 & (v10 - 1);
    }
    v12 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v4);
    if (v12)
    {
      for (i = *v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v9)
        {
          if (i[2] == *a2)
            return i;
        }
        else
        {
          if (v11.u32[0] > 1uLL)
          {
            if (v14 >= v10)
              v14 %= v10;
          }
          else
          {
            v14 &= v10 - 1;
          }
          if (v14 != v4)
            break;
        }
      }
    }
  }
  v15 = (_QWORD *)(a1 + 16);
  i = operator new(0x30uLL);
  *i = 0;
  i[1] = v9;
  i[2] = **a4;
  i[3] = 0;
  i[4] = 0;
  i[5] = 0;
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    sub_4D0C(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v4 = v9 % v10;
      else
        v4 = v9;
    }
    else
    {
      v4 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD *)a1;
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *i = *v23;
LABEL_38:
    *v23 = i;
    goto LABEL_39;
  }
  *i = *v15;
  *v15 = i;
  *(_QWORD *)(v22 + 8 * v4) = v15;
  if (*i)
  {
    v24 = *(_QWORD *)(*i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v24 >= v10)
        v24 %= v10;
    }
    else
    {
      v24 &= v10 - 1;
    }
    v23 = (_QWORD *)(*(_QWORD *)a1 + 8 * v24);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_54F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;
  uint64_t v11;

  sub_5514(v11, v10);
  _Unwind_Resume(a1);
}

void sub_5514(uint64_t a1, _QWORD *__p)
{
  void *v3;

  if (*(_BYTE *)(a1 + 8))
  {
    v3 = (void *)__p[3];
    if (v3)
    {
      __p[4] = v3;
      operator delete(v3);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void *sub_5560(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    sub_4CE4();
  return operator new(4 * a2);
}

void sub_5594(uint64_t a1, id *a2)
{
  if (a2)
  {

    operator delete();
  }
}

_QWORD *sub_55DC(_QWORD *a1, unint64_t *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (v3 >= *(_QWORD *)&v2)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3)
          return result;
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(_QWORD *)&v2)
            v8 %= *(_QWORD *)&v2;
        }
        else
        {
          v8 &= *(_QWORD *)&v2 - 1;
        }
        if (v8 != v5)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

_QWORD *sub_5690(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD **v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (_QWORD *)*i)
      {
        v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7)
            return i;
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8)
              v12 %= v8;
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4)
            break;
        }
      }
    }
  }
  v13 = (_QWORD *)(a1 + 16);
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    v16 = 1;
    if (v8 >= 3)
      v16 = (v8 & (v8 - 1)) != 0;
    v17 = v16 | (2 * v8);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    sub_4D0C(a1, v19);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *i = *v21;
LABEL_38:
    *v21 = i;
    goto LABEL_39;
  }
  *i = *v13;
  *v13 = i;
  *(_QWORD *)(v20 + 8 * v4) = v13;
  if (*i)
  {
    v22 = *(_QWORD *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8)
        v22 %= v8;
    }
    else
    {
      v22 &= v8 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_58BC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  sub_58D8(v2, v1);
  _Unwind_Resume(a1);
}

void sub_58D8(uint64_t a1, id *a2)
{
  if (*(_BYTE *)(a1 + 8))
  {

  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

_QWORD *sub_591C(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD **v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (_QWORD *)*i)
      {
        v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7)
            return i;
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8)
              v12 %= v8;
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4)
            break;
        }
      }
    }
  }
  v13 = (_QWORD *)(a1 + 16);
  i = operator new(0x30uLL);
  *i = 0;
  i[1] = v7;
  v14 = **a4;
  i[4] = 0;
  i[5] = 0;
  i[2] = v14;
  i[3] = 0;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    v17 = 1;
    if (v8 >= 3)
      v17 = (v8 & (v8 - 1)) != 0;
    v18 = v17 | (2 * v8);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    sub_4D0C(a1, v20);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *i = *v22;
LABEL_38:
    *v22 = i;
    goto LABEL_39;
  }
  *i = *v13;
  *v13 = i;
  *(_QWORD *)(v21 + 8 * v4) = v13;
  if (*i)
  {
    v23 = *(_QWORD *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8)
        v23 %= v8;
    }
    else
    {
      v23 &= v8 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_5B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;
  uint64_t v11;

  sub_5514(v11, v10);
  _Unwind_Resume(a1);
}

_QWORD *sub_5B68(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v11 = operator new(0x20uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[3] = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    sub_4D0C(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *v11 = *v20;
LABEL_38:
    *v20 = v11;
    goto LABEL_39;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    v21 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_5D78(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_5D8C(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD v24[2];
  char v25;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = (_QWORD *)*v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v13 = a1 + 16;
  v14 = (char *)operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = v7;
  *((_QWORD *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  v25 = 1;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    v17 = 1;
    if (v8 >= 3)
      v17 = (v8 & (v8 - 1)) != 0;
    v18 = v17 | (2 * v8);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    sub_4D0C(a1, v20);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *(_QWORD *)v24[0] = *v21;
    *v21 = v24[0];
  }
  else
  {
    *(_QWORD *)v24[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v24[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = v13;
    if (*(_QWORD *)v24[0])
    {
      v22 = *(_QWORD *)(*(_QWORD *)v24[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8)
          v22 %= v8;
      }
      else
      {
        v22 &= v8 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v22) = v24[0];
    }
  }
  v11 = (_QWORD *)v24[0];
  v24[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  sub_4F40((uint64_t)v24, 0);
  return v11;
}

void sub_5FE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_4F40((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void sub_5FF8(_QWORD *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t i;
  uint64_t *v8;
  unint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  uint64_t *v12;

  v6 = a1[1];
  if (!v6)
    goto LABEL_9;
  for (i = 0; i != v6; *(_QWORD *)(*a1 + 8 * i++) = 0)
    ;
  v8 = (uint64_t *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v8)
  {
    while (a2 != a3)
    {
      v9 = *((unsigned int *)a2 + 4);
      *((_DWORD *)v8 + 4) = v9;
      v8[3] = a2[3];
      v10 = (uint64_t *)*v8;
      v8[1] = v9;
      v11 = (_QWORD *)sub_6108((uint64_t)a1, v9, (_DWORD *)v8 + 4);
      sub_625C(a1, v8, v11);
      a2 = (uint64_t *)*a2;
      v8 = v10;
      if (!v10)
        goto LABEL_9;
    }
    do
    {
      v12 = (uint64_t *)*v8;
      operator delete(v8);
      v8 = v12;
    }
    while (v12);
  }
  else
  {
LABEL_9:
    while (a2 != a3)
    {
      sub_6590(a1, (_OWORD *)a2 + 1);
      a2 = (uint64_t *)*a2;
    }
  }
}

void sub_60D4(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;

  __cxa_begin_catch(a1);
  do
  {
    v2 = (_QWORD *)*v1;
    operator delete(v1);
    v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_60F4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_6108(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v6;
  float v7;
  float v8;
  uint64_t v9;
  _BOOL8 v10;
  size_t v11;
  unint64_t v12;
  size_t v13;
  uint8x8_t v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t result;
  unint64_t v19;
  unint64_t v20;
  _BOOL4 v21;
  int v22;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    v9 = 2 * v6;
    v10 = v6 < 3 || (v6 & (v6 - 1)) != 0;
    v11 = v10 | v9;
    v12 = vcvtps_u32_f32(v7 / v8);
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = v11;
    sub_6344(a1, v13);
    v6 = *(_QWORD *)(a1 + 8);
  }
  v14 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v14.i16[0] = vaddlv_u8(v14);
  if (v14.u32[0] > 1uLL)
  {
    v15 = a2;
    if (v6 <= a2)
      v15 = a2 % v6;
  }
  else
  {
    v15 = (v6 - 1) & a2;
  }
  v16 = *(_QWORD *)(*(_QWORD *)a1 + 8 * v15);
  if (!v16)
    return 0;
  v17 = 0;
  do
  {
    result = v16;
    v16 = *(_QWORD *)v16;
    if (!v16)
      break;
    v19 = *(_QWORD *)(v16 + 8);
    if (v14.u32[0] > 1uLL)
    {
      v20 = *(_QWORD *)(v16 + 8);
      if (v19 >= v6)
        v20 = v19 % v6;
    }
    else
    {
      v20 = v19 & (v6 - 1);
    }
    if (v20 != v15)
      break;
    v21 = v19 == a2 && *(_DWORD *)(v16 + 16) == *a3;
    v22 = v17 & !v21;
    v17 |= v21;
  }
  while (v22 != 1);
  return result;
}

_QWORD *sub_625C(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  unint64_t v6;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(_QWORD *)(*result + 8 * v4) = result + 2;
    if (!*a2)
      goto LABEL_19;
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
LABEL_18:
    *(_QWORD *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    v6 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(_QWORD *)&v3)
        v6 %= *(_QWORD *)&v3;
    }
    else
    {
      v6 &= *(_QWORD *)&v3 - 1;
    }
    if (v6 != v4)
      goto LABEL_18;
  }
LABEL_19:
  ++result[3];
  return result;
}

void sub_6344(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      sub_6420(a1, prime);
  }
}

void sub_6420(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t **v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  uint64_t *i;
  unint64_t v12;
  uint64_t *v13;
  _QWORD *v14;

  if (a2)
  {
    if (a2 >> 61)
      sub_4CE4();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(uint64_t ***)(a1 + 16);
    if (v7)
    {
      v8 = (unint64_t)v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      for (i = *v7; *v7; i = *v7)
      {
        v12 = i[1];
        if (v9.u32[0] > 1uLL)
        {
          if (v12 >= a2)
            v12 %= a2;
        }
        else
        {
          v12 &= a2 - 1;
        }
        if (v12 == v8)
        {
          v7 = (uint64_t **)i;
        }
        else
        {
          v13 = i;
          if (*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
          {
            do
            {
              v14 = v13;
              v13 = (uint64_t *)*v13;
            }
            while (v13 && *((_DWORD *)i + 4) == *((_DWORD *)v13 + 4));
            *v7 = v13;
            *v14 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = i;
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
            v7 = (uint64_t **)i;
            v8 = v12;
          }
        }
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

unsigned int *sub_6590(_QWORD *a1, _OWORD *a2)
{
  unsigned int *v4;
  unint64_t v5;
  _QWORD *v6;

  v4 = (unsigned int *)operator new(0x20uLL);
  *((_OWORD *)v4 + 1) = *a2;
  v5 = v4[4];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = v5;
  v6 = (_QWORD *)sub_6108((uint64_t)a1, v5, v4 + 4);
  sub_625C(a1, v4, v6);
  return v4;
}

void sub_65F4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_6608(_QWORD *a1, unsigned int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (v2.i32[0] - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v2)
          v8 %= *(_QWORD *)&v2;
      }
      else
      {
        v8 &= *(_QWORD *)&v2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

uint64_t sub_66BC(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  void *v3;
  void *__p;

  v2 = *a2;
  sub_66FC(a1, a2, (uint64_t)&__p);
  v3 = __p;
  __p = 0;
  if (v3)
    operator delete(v3);
  return v2;
}

_QWORD *sub_66FC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  v6 = *(_QWORD **)(*result + 8 * v4);
  do
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2)
    goto LABEL_18;
  v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(_QWORD *)&v3)
      v8 %= *(_QWORD *)&v3;
  }
  else
  {
    v8 &= *(_QWORD *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2)
      goto LABEL_19;
    v9 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(_QWORD *)&v3)
        v9 %= *(_QWORD *)&v3;
    }
    else
    {
      v9 &= *(_QWORD *)&v3 - 1;
    }
    if (v9 != v4)
LABEL_19:
      *(_QWORD *)(*result + 8 * v4) = 0;
  }
  v10 = *a2;
  if (*a2)
  {
    v11 = *(_QWORD *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(_QWORD *)&v3)
        v11 %= *(_QWORD *)&v3;
    }
    else
    {
      v11 &= *(_QWORD *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(_QWORD *)(*result + 8 * v11) = v7;
      v10 = *a2;
    }
  }
  *v7 = v10;
  *a2 = 0;
  --result[3];
  *(_QWORD *)a3 = a2;
  *(_QWORD *)(a3 + 8) = result + 2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_68AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_6B34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_6BD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_6CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_6D6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_6E1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_724C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;

  _Block_object_dispose(&a15, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_727C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_728C(uint64_t a1)
{

}

id sub_7294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_onResourceUpdated:target:dispatcher:", a4, a3, a2);
}

void sub_72FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)DYEAGLDebugFunctionPlayer;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_73A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_75BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_7B88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_7F0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_8C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t sub_8D84(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + OBJC_IVAR___DYGLFunctionPlayer__disp)
                                           + 832))(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                               + OBJC_IVAR___DYGLFunctionPlayer__gli_ctx));
}

void sub_9844(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void sub_9AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_9E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26)
{

  _Unwind_Resume(a1);
}

void sub_9F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17)
{
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_A248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  uint64_t v19;

  _Block_object_dispose((const void *)(v19 - 80), 8);
  _Unwind_Resume(a1);
}

id sub_A29C(uint64_t a1, uint64_t a2)
{
  id result;
  _DWORD v4[4];

  memset(v4, 0, 15);
  GPUTools::GL::DYGetTextureTargetInfo(a2, v4);
  result = objc_msgSend(*(id *)(a1 + 32), "_isBoundObjectAlive:isObjectFunc:", v4[1], *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + OBJC_IVAR___DYGLFunctionPlayer__disp) + 1160));
  if ((result & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

void sub_A3FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_A508(uint64_t a1, int a2, char a3)
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  *(_QWORD *)(a1 + 8) = objc_claimAutoreleasedReturnValue(+[CATransaction animationTimingFunction](CATransaction, "animationTimingFunction"));
  +[CATransaction animationDuration](CATransaction, "animationDuration");
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = 0;
  *(_BYTE *)(a1 + 32) = +[CATransaction disableActions](CATransaction, "disableActions");
  *(_BYTE *)(a1 + 33) = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CATransaction completionBlock](CATransaction, "completionBlock"));
  v8 = objc_msgSend(v7, "copy");
  v9 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;

  if (a2)
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  return a1;
}

void sub_A5A0(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_A5D0(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 33))
    +[CATransaction flush](CATransaction, "flush");
  v2 = *(id *)(a1 + 8);
  +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", v2);

  +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", *(double *)(a1 + 16));
  +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", *(_QWORD *)(a1 + 24));
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", *(unsigned __int8 *)(a1 + 32));

  return a1;
}

void sub_A664(GPUTools::Playback::GL::ContextInfo *a1)
{
  uint64_t v2;

  *(_QWORD *)a1 = off_24798;
  v2 = (uint64_t)a1 + 120;
  sub_4948((uint64_t)a1 + 200);
  sub_49BC((uint64_t)a1 + 160);
  sub_49BC(v2);
  GPUTools::Playback::GL::ContextInfo::~ContextInfo(a1);
}

void sub_A6B0(GPUTools::Playback::GL::ContextInfo *a1)
{
  sub_A664(a1);
  operator delete();
}

void sub_A834(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_A9C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_B590(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14, uint64_t a15, uint64_t a16, char a17)
{
  _Unwind_Resume(exception_object);
}

__n64 sub_B6E4(uint64_t a1, unint64_t a2)
{
  __int16 v2;
  __n64 result;
  int v4;

  v2 = *(_WORD *)(a1 + 22);
  if ((v2 & 1) != 0)
  {
    result.n64_f64[0] = 0.0;
    if (*(unsigned __int16 *)(a1 + 20) <= a2)
      return result;
  }
  else
  {
    result.n64_f64[0] = 0.0;
    if (a2)
      return result;
  }
  switch(*(_DWORD *)(a1 + 8))
  {
    case 1:
      v4 = *(char *)(*(_QWORD *)a1 + a2);
      goto LABEL_12;
    case 2:
      result.n64_u8[0] = *(_BYTE *)(*(_QWORD *)a1 + a2);
      goto LABEL_18;
    case 3:
      v4 = *(__int16 *)(*(_QWORD *)a1 + 2 * a2);
LABEL_12:
      result.n64_f64[0] = (double)v4;
      return result;
    case 4:
      result.n64_u16[0] = *(_WORD *)(*(_QWORD *)a1 + 2 * a2);
      goto LABEL_18;
    case 5:
      result.n64_f64[0] = (double)*(int *)(*(_QWORD *)a1 + 4 * a2);
      if (*(_DWORD *)(a1 + 12) == 19)
        result.n64_f64[0] = result.n64_f64[0] * 0.0000152587891;
      return result;
    case 6:
      result.n64_u32[0] = *(_DWORD *)(*(_QWORD *)a1 + 4 * a2);
      goto LABEL_18;
    case 7:
    case 0xB:
      result.n64_f64[0] = (double)*(uint64_t *)(*(_QWORD *)a1 + 8 * a2);
      return result;
    case 8:
    case 0xC:
      result.n64_u64[0] = *(unint64_t *)(*(_QWORD *)a1 + 8 * a2);
LABEL_18:
      result.n64_f64[0] = (double)result.n64_u64[0];
      break;
    case 9:
      result.n64_f64[0] = *(float *)(*(_QWORD *)a1 + 4 * a2);
      break;
    case 0xA:
      result.n64_u64[0] = *(unint64_t *)(*(_QWORD *)a1 + 8 * a2);
      break;
    case 0xD:
      if ((v2 & 0x10) != 0)
        result.n64_f64[0] = (double)GPUTools::FD::Argument::ViewAsGLObjectName((GPUTools::FD::Argument *)a1);
      break;
    default:
      return result;
  }
  return result;
}

void sub_C000(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_C4BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, void *a18)
{

  _Unwind_Resume(a1);
}

void sub_CF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,void *a27)
{
  void *v27;

  _Unwind_Resume(a1);
}

void sub_D190(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

_QWORD *sub_D254(uint64_t a1, unsigned int *a2, _DWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v7 <= v6)
        v3 = v6 % v7;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x18uLL);
  *v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    sub_4D0C(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *v10 = *v19;
LABEL_38:
    *v19 = v10;
    goto LABEL_39;
  }
  *v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    v20 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_D45C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_D470(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD v24[2];
  char v25;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = (_QWORD *)*v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v13 = a1 + 16;
  v14 = (char *)operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = v7;
  *((_QWORD *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  v25 = 1;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    v17 = 1;
    if (v8 >= 3)
      v17 = (v8 & (v8 - 1)) != 0;
    v18 = v17 | (2 * v8);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    sub_4D0C(a1, v20);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *(_QWORD *)v24[0] = *v21;
    *v21 = v24[0];
  }
  else
  {
    *(_QWORD *)v24[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v24[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = v13;
    if (*(_QWORD *)v24[0])
    {
      v22 = *(_QWORD *)(*(_QWORD *)v24[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8)
          v22 %= v8;
      }
      else
      {
        v22 &= v8 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v22) = v24[0];
    }
  }
  v11 = (_QWORD *)v24[0];
  v24[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  sub_4F40((uint64_t)v24, 0);
  return v11;
}

void sub_D6C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_4F40((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void sub_D6DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  sub_D77C((_QWORD *)a1);
  v4 = *a2;
  *a2 = 0;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;
  if (v5)
    operator delete(v5);
  v8 = a2[2];
  v7 = a2 + 2;
  v6 = v8;
  v9 = *(v7 - 1);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  v10 = v7[1];
  *(_QWORD *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    v11 = *(_QWORD *)(v6 + 8);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v11 %= v12;
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = a1 + 16;
    *v7 = 0;
    v7[1] = 0;
  }
}

_QWORD *sub_D77C(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

_QWORD *sub_D7E0(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6)
            return i;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v6;
  i[2] = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    sub_4D0C(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *i = *v19;
LABEL_38:
    *v19 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v20 = *(_QWORD *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_D9E4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

unint64_t sub_D9F8(uint64_t a1, unint64_t a2)
{
  __int16 v2;
  unint64_t result;
  int v4;
  double v5;

  v2 = *(_WORD *)(a1 + 22);
  if ((v2 & 1) != 0)
  {
    if (*(unsigned __int16 *)(a1 + 20) > a2)
      goto LABEL_5;
    return 0;
  }
  if (a2)
    return 0;
LABEL_5:
  switch(*(_DWORD *)(a1 + 8))
  {
    case 1:
      return *(char *)(*(_QWORD *)a1 + a2);
    case 2:
      return *(unsigned __int8 *)(*(_QWORD *)a1 + a2);
    case 3:
      return *(__int16 *)(*(_QWORD *)a1 + 2 * a2);
    case 4:
      return *(unsigned __int16 *)(*(_QWORD *)a1 + 2 * a2);
    case 5:
      v4 = *(_DWORD *)(a1 + 12);
      result = *(int *)(*(_QWORD *)a1 + 4 * a2);
      if (v4 != 19)
        return result;
      v5 = (double)(int)result * 0.0000152587891;
LABEL_10:
      result = (unint64_t)v5;
      break;
    case 6:
      return *(unsigned int *)(*(_QWORD *)a1 + 4 * a2);
    case 7:
    case 8:
    case 0xB:
    case 0xC:
      return *(_QWORD *)(*(_QWORD *)a1 + 8 * a2);
    case 9:
      return (unint64_t)*(float *)(*(_QWORD *)a1 + 4 * a2);
    case 0xA:
      v5 = *(double *)(*(_QWORD *)a1 + 8 * a2);
      goto LABEL_10;
    case 0xD:
      if ((v2 & 0x10) == 0)
        return 0;
      return GPUTools::FD::Argument::ViewAsGLObjectName((GPUTools::FD::Argument *)a1);
    default:
      return 0;
  }
  return result;
}

_QWORD *sub_DAF0(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v11 = operator new(0x20uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *(_QWORD *)((char *)v11 + 20) = 0x8A7A00000000;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    sub_4D0C(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *v11 = *v20;
LABEL_38:
    *v20 = v11;
    goto LABEL_39;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    v21 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_DD08(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_DD1C(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  _QWORD **v9;
  _QWORD *i;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v6 >= v7)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (_QWORD *)*i)
      {
        v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6)
            return i;
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7)
              v11 %= v7;
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3)
            break;
        }
      }
    }
  }
  i = operator new(0x18uLL);
  *i = 0;
  i[1] = v6;
  i[2] = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    sub_4D0C(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *i = *v19;
LABEL_38:
    *v19 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*i)
  {
    v20 = *(_QWORD *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_DF20(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_DF34(_QWORD *a1, unint64_t *a2)
{
  uint64_t *result;

  result = sub_55DC(a1, a2);
  if (result)
  {
    sub_66BC(a1, result);
    return (_QWORD *)(&dword_0 + 1);
  }
  return result;
}

void sub_DFD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_E050(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_E320(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_E35C(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_120CC((void **)a1, v4);
  }
  else if (!v3)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 40 * a2;
  }
}

void sub_E438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)DYGLShaderProfilerFunctionPlayerSupport;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_E648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_E6D4(uint64_t a1)
{
  id v2;
  id v3;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "strongPlaybackEngine"));
  objc_msgSend(v2, "setDelegate:", 0);

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_queryShaderResult"));
  objc_msgSend(*(id *)(a1 + 40), "setResult:");

}

void sub_E738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_E7D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_EB88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_F500(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_DWORD *sub_F5B0(void **a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _DWORD *v9;
  _DWORD *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v8 = (unint64_t)a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_DWORD **)(v6 - 8);
  if ((unint64_t)v9 >= v8)
  {
    v11 = ((char *)v9 - (_BYTE *)*a1) >> 3;
    v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 61)
      sub_2610();
    v13 = v7 - (_QWORD)*a1;
    if (v13 >> 2 > v12)
      v12 = v13 >> 2;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v12;
    v15 = (char *)sub_12704(v6, v14);
    v16 = &v15[8 * v11];
    v18 = &v15[8 * v17];
    *(_DWORD *)v16 = *a2;
    *((_DWORD *)v16 + 1) = *a3;
    v10 = v16 + 8;
    v20 = (char *)*a1;
    v19 = (char *)a1[1];
    if (v19 != *a1)
    {
      do
      {
        v21 = *((_QWORD *)v19 - 1);
        v19 -= 8;
        *((_QWORD *)v16 - 1) = v21;
        v16 -= 8;
      }
      while (v19 != v20);
      v19 = (char *)*a1;
    }
    *a1 = v16;
    a1[1] = v10;
    a1[2] = v18;
    if (v19)
      operator delete(v19);
  }
  else
  {
    *v9 = *a2;
    v9[1] = *a3;
    v10 = v9 + 2;
  }
  a1[1] = v10;
  return v10 - 2;
}

void sub_F850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_FB94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_FF18()
{
  operator delete();
}

uint64_t *sub_FF68(uint64_t *result)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;

  if (*((_DWORD *)result + 6))
  {
    v1 = 0;
    v2 = *result;
    v3 = result[25];
    v4 = result[4];
    v5 = result[7];
    do
    {
      v6 = 0;
      *(_QWORD *)(v2 + 8 * v1) = 0;
      *(_DWORD *)(v3 + 4 * v1) = 0;
      *(_QWORD *)(v4 + 8 * v1) = 0;
      *(_QWORD *)(v5 + 8 * v1) = 0;
      do
      {
        *(_QWORD *)(result[v6 + 10] + 8 * v1) = 0;
        v6 += 3;
      }
      while (v6 != 15);
      ++v1;
      v7 = *((unsigned int *)result + 6);
    }
    while (v1 < v7);
    v8 = v7 - 1;
  }
  else
  {
    v8 = -1;
  }
  *((_DWORD *)result + 56) = 0;
  *((_DWORD *)result + 57) = v8;
  return result;
}

void sub_100E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10288(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1050C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10520(uint64_t a1, _QWORD *a2)
{
  int v3;
  unsigned int v4;
  uint64_t v5;
  int v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  size_t v17;
  uint64_t v18;
  size_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int *v24;
  uint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unsigned int *v36;
  int v37;
  int v38;
  _QWORD __compar[5];

  v3 = *(_DWORD *)(a1 + 224);
  v4 = *(_DWORD *)(a1 + 24);
  v5 = (*(_DWORD *)(a1 + 228) + 1) % v4;
  if (v4 >= v3 + 1)
    v6 = v3 + 1;
  else
    v6 = *(_DWORD *)(a1 + 24);
  *(_DWORD *)(a1 + 224) = v6;
  *(_DWORD *)(a1 + 228) = v5;
  v7 = *(uint64_t **)a1;
  *(_QWORD *)(*(_QWORD *)a1 + 8 * v5) = *a2;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 80);
  v11 = *(_QWORD *)(a1 + 104);
  v12 = *(_QWORD *)(a1 + 128);
  v13 = *(_QWORD *)(a1 + 152);
  v14 = *(_QWORD *)(a1 + 176);
  if (v6 == 1)
  {
    v15 = *v7;
    *(_QWORD *)(v14 + 8 * v5) = v15;
    *(_QWORD *)(v13 + 8 * v5) = v15;
    *(_QWORD *)(v12 + 8 * v5) = v15;
    *(_QWORD *)(v11 + 8 * v5) = v15;
    *(_QWORD *)(v10 + 8 * v5) = v15;
    **(_DWORD **)(a1 + 200) = 0;
    *(_QWORD *)(v9 + 8 * v5) = v15;
    *(_QWORD *)(v8 + 8 * v5) = v15;
  }
  else
  {
    *(_QWORD *)(v8 + 8 * v5) = 0;
    v16 = *(_DWORD **)(a1 + 200);
    if (v6)
    {
      v17 = 0;
      v18 = 0;
      do
      {
        v16[v17] = v17;
        v18 += v7[v17];
        *(_QWORD *)(v8 + 8 * v5) = v18;
        ++v17;
        v19 = *(unsigned int *)(a1 + 224);
      }
      while (v17 < v19);
    }
    else
    {
      v19 = 0;
    }
    __compar[0] = _NSConcreteStackBlock;
    __compar[1] = 3221225472;
    __compar[2] = sub_12CAC;
    __compar[3] = &unk_247D0;
    __compar[4] = a1;
    qsort_b(v16, v19, 4uLL, __compar);
    v20 = *(_QWORD *)(v8 + 8 * v5);
    v21 = *(unsigned int *)(a1 + 224);
    v22 = v21 >> 1;
    if (v20)
      v23 = v20 + (v21 >> 1);
    else
      v23 = -(uint64_t)v22;
    *(_QWORD *)(v8 + 8 * v5) = v23 / v21;
    v24 = *(unsigned int **)(a1 + 200);
    v25 = *(uint64_t **)a1;
    *(_QWORD *)(v10 + 8 * v5) = *(_QWORD *)(*(_QWORD *)a1 + 8 * *v24);
    *(_QWORD *)(v14 + 8 * v5) = v25[v24[(v21 - 1)]];
    if ((v21 & 1) != 0)
      v26 = v25[v24[v22]];
    else
      v26 = (unint64_t)(v25[v24[v22]] + v25[v24[(v22 - 1)]]) >> 1;
    *(_QWORD *)(v12 + 8 * v5) = v26;
    v27 = v21 >> 2;
    v28 = ~(v21 >> 2);
    v29 = v21 + v28;
    v30 = v24[v21 >> 2];
    v31 = v25[v30];
    if ((v21 & 3) != 0)
    {
      *(_QWORD *)(v11 + 8 * v5) = v31;
      v32 = v24[v29];
      v33 = v25[v32];
    }
    else
    {
      *(_QWORD *)(v11 + 8 * v5) = (unint64_t)(v25[v24[(v27 - 1)]] + v31) >> 1;
      v32 = v24[v29];
      v33 = (unint64_t)(v25[v24[(v21 - v27)]] + v25[v32]) >> 1;
    }
    *(_QWORD *)(v13 + 8 * v5) = v33;
    v34 = (v21 & 0xFFFFFFFC) - (v21 & 0x3FFFFFFF) + 4;
    v35 = (v25[v32] + v25[v30]) * v34;
    *(_QWORD *)(v9 + 8 * v5) = v35;
    if ((int)v27 + 1 < v29)
    {
      v36 = &v24[v27 + 1];
      v37 = 2 * v27 - v21 + 2;
      do
      {
        v38 = *v36++;
        v35 += 4 * v25[v38];
        *(_QWORD *)(v9 + 8 * v5) = v35;
      }
      while (!__CFADD__(v37++, 1));
    }
    *(_QWORD *)(v9 + 8 * v5) = v35 / (4 * (v29 + v28) + 2 * (_DWORD)v34);
  }
}

unint64_t sub_107A4(uint64_t a1, unsigned int a2, double *a3, double *a4)
{
  unint64_t v4;
  uint64_t v5;
  double v6;
  unsigned int v7;
  uint64_t v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  double v12;
  double *v13;

  LODWORD(v4) = *(_DWORD *)(a1 + 224);
  if (!(_DWORD)v4)
    return v4 & 1;
  if ((_DWORD)v4 == 1)
  {
    v5 = (*(_DWORD *)(a1 + 24) + *(_DWORD *)(a1 + 228)) % *(_DWORD *)(a1 + 24);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v5);
    if (v4)
    {
      v6 = (double)(unint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8 * v5)
                                    - *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8 * v5))
         / (double)v4;
      *a4 = v6;
      *a3 = v6;
      LOBYTE(v4) = 1;
    }
    return v4 & 1;
  }
  if (v4 >= a2)
    LODWORD(v4) = a2;
  if ((_DWORD)v4)
  {
    v7 = *(_DWORD *)(a1 + 228);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = 1;
    v10 = *(_DWORD *)(a1 + 24);
    while (1)
    {
      v11 = *(_QWORD *)(v8 + 8 * v7);
      if (v11)
      {
        v12 = (double)(unint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8 * v7)
                                       - *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8 * v7))
            / (double)v11;
        if ((v9 & 1) != 0)
        {
          *a4 = v12;
          v13 = a3;
        }
        else
        {
          v13 = a3;
          if (v12 >= *a3)
          {
            v13 = a4;
            if (v12 <= *a4)
            {
              v9 = 0;
              goto LABEL_15;
            }
          }
        }
        v9 = 0;
        *v13 = v12;
      }
LABEL_15:
      v7 = (v7 + v10 - 1) % v10;
      LODWORD(v4) = v4 - 1;
      if (!(_DWORD)v4)
        goto LABEL_19;
    }
  }
  v9 = 1;
LABEL_19:
  LOBYTE(v4) = v9 ^ 1;
  return v4 & 1;
}

void sub_10D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25)
{
  sub_48CC((uint64_t)&a11);
  if (__p)
  {
    a18 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_11324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  void *v18;

  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_116B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_119BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,void *a29)
{
  void *v29;

  _Unwind_Resume(a1);
}

void sub_11C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_11D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_11F9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_120CC(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  size_t v13;
  char *v14;
  char *v15;
  size_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (0xCCCCCCCCCCCCCCCDLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      v13 = 40 * ((40 * a2 - 40) / 0x28) + 40;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xCCCCCCCCCCCCCCCDLL * ((v7 - (_BYTE *)*a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0x666666666666666)
      sub_2610();
    v10 = 0xCCCCCCCCCCCCCCCDLL * ((v5 - (_BYTE *)*a1) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x333333333333333)
      v11 = 0x666666666666666;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)sub_12254(v4, v11);
    else
      v12 = 0;
    v14 = &v12[40 * v8];
    v15 = &v12[40 * v11];
    v16 = 40 * ((40 * a2 - 40) / 0x28) + 40;
    bzero(v14, v16);
    v17 = &v14[v16];
    v19 = (char *)*a1;
    v18 = (char *)a1[1];
    if (v18 != *a1)
    {
      do
      {
        v20 = *(_OWORD *)(v18 - 40);
        v21 = *(_OWORD *)(v18 - 24);
        *((_QWORD *)v14 - 1) = *((_QWORD *)v18 - 1);
        *(_OWORD *)(v14 - 24) = v21;
        *(_OWORD *)(v14 - 40) = v20;
        v14 -= 40;
        v18 -= 40;
      }
      while (v18 != v19);
      v18 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v17;
    a1[2] = v15;
    if (v18)
      operator delete(v18);
  }
}

void *sub_12254(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667)
    sub_4CE4();
  return operator new(40 * a2);
}

_QWORD *sub_12298(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v11 = operator new(0x20uLL);
  *v11 = 0;
  v11[1] = v7;
  v11[2] = **a4;
  *((_DWORD *)v11 + 6) = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    sub_4D0C(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *v11 = *v20;
LABEL_38:
    *v20 = v11;
    goto LABEL_39;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    v21 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_124A4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_124B8(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD **v10;
  _QWORD *i;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (_QWORD *)*i)
      {
        v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7)
            return i;
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8)
              v12 %= v8;
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4)
            break;
        }
      }
    }
  }
  v13 = (_QWORD *)(a1 + 16);
  i = operator new(0x30uLL);
  *i = 0;
  i[1] = v7;
  v14 = **a4;
  i[4] = 0;
  i[5] = 0;
  i[2] = v14;
  i[3] = 0;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    v17 = 1;
    if (v8 >= 3)
      v17 = (v8 & (v8 - 1)) != 0;
    v18 = v17 | (2 * v8);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    sub_4D0C(a1, v20);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v22)
  {
    *i = *v22;
LABEL_38:
    *v22 = i;
    goto LABEL_39;
  }
  *i = *v13;
  *v13 = i;
  *(_QWORD *)(v21 + 8 * v4) = v13;
  if (*i)
  {
    v23 = *(_QWORD *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v23 >= v8)
        v23 %= v8;
    }
    else
    {
      v23 &= v8 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_126E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;
  uint64_t v11;

  sub_5514(v11, v10);
  _Unwind_Resume(a1);
}

void *sub_12704(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_4CE4();
  return operator new(8 * a2);
}

void sub_12738(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1278C(a1, *(_QWORD **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void sub_1278C(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      sub_48CC((uint64_t)(v2 + 3));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void sub_127C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    sub_4904(a1, *(_QWORD **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

uint64_t sub_1281C(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t i;
  uint64_t v12;

  *(_OWORD *)(a1 + 32) = 0u;
  v3 = a1 + 32;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  v4 = a1 + 56;
  v5 = a1 + 200;
  *(_QWORD *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_DWORD *)(a1 + 224) = 0;
  *(_DWORD *)(a1 + 24) = a2;
  v6 = a2;
  v12 = 0;
  sub_12990(a1, a2, &v12);
  v7 = *(unsigned int *)(a1 + 24);
  LODWORD(v12) = 0;
  sub_129C0(v5, v7, &v12);
  v8 = *(unsigned int *)(a1 + 24);
  v12 = 0;
  sub_12990(v3, v8, &v12);
  v9 = *(unsigned int *)(a1 + 24);
  v12 = 0;
  sub_12990(v4, v9, &v12);
  for (i = 80; i != 200; i += 24)
  {
    v12 = 0;
    sub_12990(a1 + i, v6, &v12);
  }
  *(_DWORD *)(a1 + 228) = *(_DWORD *)(a1 + 24) - 1;
  return a1;
}

void sub_12910(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void **v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = *v4;
  if (*v4)
  {
    *(_QWORD *)(v1 + 208) = v6;
    operator delete(v6);
  }
  v7 = 0;
  while (1)
  {
    v8 = *(void **)(v1 + v7 + 176);
    if (v8)
    {
      *(_QWORD *)(v1 + v7 + 184) = v8;
      operator delete(v8);
    }
    v7 -= 24;
    if (v7 == -120)
    {
      v9 = *v3;
      if (*v3)
      {
        *(_QWORD *)(v1 + 64) = v9;
        operator delete(v9);
      }
      v10 = *v2;
      if (*v2)
      {
        *(_QWORD *)(v1 + 40) = v10;
        operator delete(v10);
      }
      v11 = *(void **)v1;
      if (*(_QWORD *)v1)
      {
        *(_QWORD *)(v1 + 8) = v11;
        operator delete(v11);
      }
      _Unwind_Resume(exception_object);
    }
  }
}

void sub_12990(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    sub_129F0((void **)a1, a2 - v3, a3);
  }
}

void sub_129C0(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    sub_12B00((void **)a1, a2 - v3, a3);
  }
}

void sub_129F0(void **a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  uint64_t v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 3)
  {
    if (a2)
    {
      v16 = 8 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 3);
    if (v11 >> 61)
      sub_2610();
    v12 = v10 >> 3;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 2 > v11)
      v11 = v13 >> 2;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)sub_12704(v6, v14);
    else
      v15 = 0;
    v18 = &v15[8 * v12];
    v19 = &v18[8 * a2];
    v20 = 8 * a2;
    v21 = v18;
    do
    {
      *(_QWORD *)v21 = *a3;
      v21 += 8;
      v20 -= 8;
    }
    while (v20);
    v22 = &v15[8 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 8)
    {
      v25 = *((_QWORD *)i - 1);
      *((_QWORD *)v18 - 1) = v25;
      v18 -= 8;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

void sub_12B00(void **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _DWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _DWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  int v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 2)
  {
    if (a2)
    {
      v16 = 4 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 2);
    if (v11 >> 62)
      sub_2610();
    v12 = v10 >> 2;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 1 > v11)
      v11 = v13 >> 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
      v14 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)sub_5560(v6, v14);
    else
      v15 = 0;
    v18 = &v15[4 * v12];
    v19 = &v18[4 * a2];
    v20 = 4 * a2;
    v21 = v18;
    do
    {
      *(_DWORD *)v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    v22 = &v15[4 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 4)
    {
      v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

void sub_12C10(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a2)
  {
    v3 = *(void **)(a2 + 200);
    if (v3)
    {
      *(_QWORD *)(a2 + 208) = v3;
      operator delete(v3);
    }
    v4 = 0;
    while (1)
    {
      v5 = *(void **)(a2 + v4 + 176);
      if (v5)
      {
        *(_QWORD *)(a2 + v4 + 184) = v5;
        operator delete(v5);
      }
      v4 -= 24;
      if (v4 == -120)
      {
        v6 = *(void **)(a2 + 56);
        if (v6)
        {
          *(_QWORD *)(a2 + 64) = v6;
          operator delete(v6);
        }
        v7 = *(void **)(a2 + 32);
        if (v7)
        {
          *(_QWORD *)(a2 + 40) = v7;
          operator delete(v7);
        }
        v8 = *(void **)a2;
        if (*(_QWORD *)a2)
        {
          *(_QWORD *)(a2 + 8) = v8;
          operator delete(v8);
        }
        operator delete();
      }
    }
  }
}

uint64_t sub_12CAC(uint64_t a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  _BOOL4 v7;

  v3 = **(_QWORD **)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 8 * *a2);
  v5 = *(_QWORD *)(v3 + 8 * *a3);
  v6 = v4 >= v5;
  v7 = v4 > v5;
  if (v6)
    return v7;
  else
    return 0xFFFFFFFFLL;
}

void *sub_12CD4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    sub_4CE4();
  return operator new(32 * a2);
}

_QWORD *sub_12D08(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD v24[2];
  char v25;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = (_QWORD *)*v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v13 = a1 + 16;
  v14 = (char *)operator new(0x40uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = v7;
  *((_QWORD *)v14 + 2) = **a4;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  v25 = 1;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    v17 = 1;
    if (v8 >= 3)
      v17 = (v8 & (v8 - 1)) != 0;
    v18 = v17 | (2 * v8);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    sub_4D0C(a1, v20);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *(_QWORD *)v24[0] = *v21;
    *v21 = v24[0];
  }
  else
  {
    *(_QWORD *)v24[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v24[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = v13;
    if (*(_QWORD *)v24[0])
    {
      v22 = *(_QWORD *)(*(_QWORD *)v24[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8)
          v22 %= v8;
      }
      else
      {
        v22 &= v8 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v22) = v24[0];
    }
  }
  v11 = (_QWORD *)v24[0];
  v24[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  sub_12F74((uint64_t)v24, 0);
  return v11;
}

void sub_12F5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_12F74((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void sub_12F74(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      sub_48CC((uint64_t)v2 + 24);
    operator delete(v2);
  }
}

void sub_12FB8(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  sub_127C8(a1);
  v4 = *a2;
  *a2 = 0;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;
  if (v5)
    operator delete(v5);
  v8 = a2[2];
  v7 = a2 + 2;
  v6 = v8;
  v9 = *(v7 - 1);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  v10 = v7[1];
  *(_QWORD *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    v11 = *(_QWORD *)(v6 + 8);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v11 %= v12;
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = a1 + 16;
    *v7 = 0;
    v7[1] = 0;
  }
}

_QWORD *sub_13058(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v13 = (_QWORD *)(a1 + 16);
  v11 = operator new(0x30uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[4] = 0;
  v11[5] = 0;
  v11[3] = 0;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    v16 = 1;
    if (v8 >= 3)
      v16 = (v8 & (v8 - 1)) != 0;
    v17 = v16 | (2 * v8);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    sub_4D0C(a1, v19);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *v11 = *v21;
LABEL_38:
    *v21 = v11;
    goto LABEL_39;
  }
  *v11 = *v13;
  *v13 = v11;
  *(_QWORD *)(v20 + 8 * v4) = v13;
  if (*v11)
  {
    v22 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8)
        v22 %= v8;
    }
    else
    {
      v22 &= v8 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_13290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  _QWORD *v10;
  uint64_t v11;

  sub_5514(v11, v10);
  _Unwind_Resume(a1);
}

uint64_t *sub_132AC(_QWORD *a1, unint64_t *a2)
{
  uint64_t *result;

  result = sub_55DC(a1, a2);
  if (result)
  {
    sub_132E0(a1, result);
    return (_QWORD *)(&dword_0 + 1);
  }
  return result;
}

uint64_t sub_132E0(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;
  void *__p;
  uint64_t v6;

  v2 = *a2;
  sub_66FC(a1, a2, (uint64_t)&__p);
  v3 = __p;
  __p = 0;
  if (v3)
    sub_5514((uint64_t)&v6, v3);
  return v2;
}

uint64_t sub_13328(uint64_t a1)
{
  void *v2;

  sub_1278C(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void sub_13418(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_134B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_13524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_135FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_136A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_13710(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_13798(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_13860(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_13910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

id sub_13928(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "eaglPlayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contextForContextIdentifier:", a2));

  return v4;
}

void sub_1396C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_13A84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_13B28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

id objc_msgSend_API(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "API");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__backupAndSetupStates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_backupAndSetupStates");
}

id objc_msgSend__changeTextureToWidth_height_imageFormatInfo_texels_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_changeTextureToWidth:height:imageFormatInfo:texels:");
}

id objc_msgSend__copyColorAttachmentToPresentTexture_imageInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyColorAttachmentToPresentTexture:imageInfo:");
}

id objc_msgSend__copyDepthOrStencilAttachmentToPresent_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyDepthOrStencilAttachmentToPresent:type:");
}

id objc_msgSend__copyRenderbufferColorAttachmentToPresent_color_isWireframe_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyRenderbufferColorAttachmentToPresent:color:isWireframe:");
}

id objc_msgSend__copyTextureColorAttachmentToPresent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyTextureColorAttachmentToPresent:");
}

id objc_msgSend__createIOSurfaceReplacementForFramebuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createIOSurfaceReplacementForFramebuffer:");
}

id objc_msgSend__endUSCSampling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_endUSCSampling");
}

id objc_msgSend__generateDrawableId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_generateDrawableId");
}

id objc_msgSend__getFramebufferWidth_height_numSamples_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getFramebufferWidth:height:numSamples:");
}

id objc_msgSend__imageInfoForAttachment_outImageInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_imageInfoForAttachment:outImageInfo:");
}

id objc_msgSend__isBoundObjectAlive_isObjectFunc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isBoundObjectAlive:isObjectFunc:");
}

id objc_msgSend__isContextModifiable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isContextModifiable");
}

id objc_msgSend__linkProgram_dispatcher_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_linkProgram:dispatcher:");
}

id objc_msgSend__loadShaderWithType_source_dispatcher_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadShaderWithType:source:dispatcher:");
}

id objc_msgSend__loadSimpleProgramWithVertexSource_fragmentSource_link_dispatcher_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadSimpleProgramWithVertexSource:fragmentSource:link:dispatcher:");
}

id objc_msgSend__presentFramebufferWithWireframe_wireframeLineColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_presentFramebufferWithWireframe:wireframeLineColor:");
}

id objc_msgSend__queryShaderResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queryShaderResult");
}

id objc_msgSend__renderPresentTextureWithColor_enableBlend_texBlitProgram_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_renderPresentTextureWithColor:enableBlend:texBlitProgram:");
}

id objc_msgSend__replaceColorAttachment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_replaceColorAttachment");
}

id objc_msgSend__resolveDepthWithWidth_height_numSamples_buffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolveDepthWithWidth:height:numSamples:buffer:");
}

id objc_msgSend__resolveStencilWithWidth_height_numSamples_buffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolveStencilWithWidth:height:numSamples:buffer:");
}

id objc_msgSend__restoreColorAttachment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restoreColorAttachment");
}

id objc_msgSend__restoreStates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_restoreStates");
}

id objc_msgSend__saveColorAttachmentFramebuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveColorAttachmentFramebuffer:");
}

id objc_msgSend__setupContextRemapperForPlaybackEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupContextRemapperForPlaybackEngine:");
}

id objc_msgSend__startUSCSampling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startUSCSampling");
}

id objc_msgSend__switchToOriginalFramebuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_switchToOriginalFramebuffer");
}

id objc_msgSend__switchToWireframeFramebuffer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_switchToWireframeFramebuffer");
}

id objc_msgSend__transformCoreAnimationLayer_rotated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_transformCoreAnimationLayer:rotated:");
}

id objc_msgSend__uscSamplingEnded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_uscSamplingEnded");
}

id objc_msgSend__valueFromKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_valueFromKey:");
}

id objc_msgSend_addIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIndexes:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_anchorPoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anchorPoint");
}

id objc_msgSend_animationDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationDuration");
}

id objc_msgSend_animationTimingFunction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animationTimingFunction");
}

id objc_msgSend_api(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "api");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_captureSessionInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureSessionInfo");
}

id objc_msgSend_captureStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "captureStore");
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionBlock");
}

id objc_msgSend_containsIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsIndex:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentsScale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsScale");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "context");
}

id objc_msgSend_contextForContextIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextForContextIdentifier:");
}

id objc_msgSend_contextInfoForContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contextInfoForContext:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createEAGLContextWithAPI_sharegroupID_contextID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createEAGLContextWithAPI:sharegroupID:contextID:");
}

id objc_msgSend_createLayerWithID_contentRect_contentsScale_properties_isCoreAnimationSurface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createLayerWithID:contentRect:contentsScale:properties:isCoreAnimationSurface:");
}

id objc_msgSend_ctxID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ctxID");
}

id objc_msgSend_currentContextInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentContextInfo");
}

id objc_msgSend_currentExecutionModeFunctionIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentExecutionModeFunctionIndex");
}

id objc_msgSend_currentFileFunctionIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentFileFunctionIndex");
}

id objc_msgSend_currentRenderbufferDrawableMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRenderbufferDrawableMap");
}

id objc_msgSend_currentTopLayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTopLayer");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteCurrentContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteCurrentContext");
}

id objc_msgSend_deleteLayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteLayer:");
}

id objc_msgSend_deviceInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceInfo");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_disableActions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableActions");
}

id objc_msgSend_disabledFunctions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disabledFunctions");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_drawTexture_target_framebuffer_bounds_clearBits_modulateColor_enableBlend_rotated_texBlitProgram_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawTexture:target:framebuffer:bounds:clearBits:modulateColor:enableBlend:rotated:texBlitProgram:");
}

id objc_msgSend_drawableProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawableProperties");
}

id objc_msgSend_dy_crc32(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dy_crc32");
}

id objc_msgSend_eaglPlayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eaglPlayer");
}

id objc_msgSend_enableDrawCallPresent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableDrawCallPresent");
}

id objc_msgSend_enableExperimentFinish(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableExperimentFinish");
}

id objc_msgSend_enableWireframePresent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableWireframePresent");
}

id objc_msgSend_executePlatformFunction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executePlatformFunction");
}

id objc_msgSend_experiment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "experiment");
}

id objc_msgSend_experimentResultsGenerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "experimentResultsGenerator");
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flush");
}

id objc_msgSend_footprint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "footprint");
}

id objc_msgSend_fragmentShaderKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fragmentShaderKey");
}

id objc_msgSend_function(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "function");
}

id objc_msgSend_functionPlayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "functionPlayer");
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "future");
}

id objc_msgSend_getParameter_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getParameter:to:");
}

id objc_msgSend_gliContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gliContext");
}

id objc_msgSend_gliDispatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gliDispatch");
}

id objc_msgSend_guestAppWasLinkedOnApexOrLater(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "guestAppWasLinkedOnApexOrLater");
}

id objc_msgSend_initWithAPI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAPI:");
}

id objc_msgSend_initWithAPI_sharegroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAPI:sharegroup:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCaptureStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCaptureStore:");
}

id objc_msgSend_initWithCaptureStore_experimentResultsGenerator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCaptureStore:experimentResultsGenerator:");
}

id objc_msgSend_initWithDebugEAGLPlaybackEngine_payLoad_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDebugEAGLPlaybackEngine:payLoad:");
}

id objc_msgSend_initWithExperiment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExperiment:");
}

id objc_msgSend_initWithFunctionPlayer_overrideKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFunctionPlayer:overrideKey:");
}

id objc_msgSend_initWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUnsignedLongLong:");
}

id objc_msgSend_isDone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDone");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFunctionEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFunctionEnabled");
}

id objc_msgSend_layerForID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layerForID:");
}

id objc_msgSend_loopCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loopCount");
}

id objc_msgSend_mainExecutionMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainExecutionMode");
}

id objc_msgSend_mainScreenDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreenDescriptor");
}

id objc_msgSend_metadataValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadataValueForKey:");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_notifyOnQueue_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyOnQueue:handler:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForIntKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForIntKey:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_onFrameEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onFrameEnd");
}

id objc_msgSend_onFrameStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onFrameStart");
}

id objc_msgSend_onGraphicsFunctionEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onGraphicsFunctionEnd");
}

id objc_msgSend_onPlatformFunctionEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onPlatformFunctionEnd");
}

id objc_msgSend_overrideTypeStrings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideTypeStrings");
}

id objc_msgSend_performPlaybackLoopIterationPostCaptureActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performPlaybackLoopIterationPostCaptureActions:");
}

id objc_msgSend_performPlaybackLoopIterationPreCaptureActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performPlaybackLoopIterationPreCaptureActions:");
}

id objc_msgSend_performPostGraphicsFunctionDispatchActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performPostGraphicsFunctionDispatchActions:");
}

id objc_msgSend_playbackToFunction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playbackToFunction:");
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "player");
}

id objc_msgSend_prepareForCaptureExecution(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareForCaptureExecution");
}

id objc_msgSend_prepareLayerForPresent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareLayerForPresent:");
}

id objc_msgSend_presentRenderbuffer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentRenderbuffer:");
}

id objc_msgSend_presentRenderbuffer_afterMinimumDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentRenderbuffer:afterMinimumDuration:");
}

id objc_msgSend_presentRenderbuffer_atTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentRenderbuffer:atTime:");
}

id objc_msgSend_prevFileFunctionIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prevFileFunctionIndex");
}

id objc_msgSend_profilingFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profilingFlags");
}

id objc_msgSend_queryShaderStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryShaderStart");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeIndexes:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_renderbufferStorage_fromDrawable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "renderbufferStorage:fromDrawable:");
}

id objc_msgSend_repeatCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "repeatCount");
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAffineTransform:");
}

id objc_msgSend_setAnchorPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnchorPoint:");
}

id objc_msgSend_setAnchorPoint_forLayerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnchorPoint:forLayerID:");
}

id objc_msgSend_setAnimationDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimationDuration:");
}

id objc_msgSend_setAnimationTimingFunction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimationTimingFunction:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setContentsScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentsScale:");
}

id objc_msgSend_setCurrentContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentContext:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableActions:");
}

id objc_msgSend_setDrawableProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDrawableProperties:");
}

id objc_msgSend_setEnableWireframePresent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableWireframePresent:");
}

id objc_msgSend_setFootprint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFootprint:");
}

id objc_msgSend_setFragmentShaderKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFragmentShaderKey:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setFunctionPlayer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFunctionPlayer:");
}

id objc_msgSend_setLayerManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLayerManager:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLoopCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLoopCount:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setParameter_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setParameter:to:");
}

id objc_msgSend_setPosition_forLayerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPosition:forLayerID:");
}

id objc_msgSend_setResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResult:");
}

id objc_msgSend_setShouldCallSuper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldCallSuper:");
}

id objc_msgSend_setShouldReturn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldReturn:");
}

id objc_msgSend_setTessellationWireframeLineWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTessellationWireframeLineWidth:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTransform_forLayerID_withScreenToLayerScale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransform:forLayerID:withScreenToLayerScale:");
}

id objc_msgSend_setVertexShaderKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVertexShaderKey:");
}

id objc_msgSend_setWireframeLineColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWireframeLineColor:");
}

id objc_msgSend_setWireframeLineWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWireframeLineWidth:");
}

id objc_msgSend_sharegroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharegroup");
}

id objc_msgSend_shouldCallSuper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldCallSuper");
}

id objc_msgSend_shouldExecuteGraphicsFunction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldExecuteGraphicsFunction");
}

id objc_msgSend_shouldPerformPlaybackLoopIteration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldPerformPlaybackLoopIteration:");
}

id objc_msgSend_shouldReturn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldReturn");
}

id objc_msgSend_shrinkSourceSize_toDestSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shrinkSourceSize:toDestSize:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strongDelegate");
}

id objc_msgSend_strongFunctionPlayer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strongFunctionPlayer");
}

id objc_msgSend_strongLayerManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strongLayerManager");
}

id objc_msgSend_strongPlaybackEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strongPlaybackEngine");
}

id objc_msgSend_targetFunctionIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetFunctionIndex");
}

id objc_msgSend_traceMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traceMode");
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transform");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateCurrentStateWithNewContext_contextID_sharegroupID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCurrentStateWithNewContext:contextID:sharegroupID:");
}

id objc_msgSend_updateLayer_contentRect_contentsScale_properties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLayer:contentRect:contentsScale:properties:");
}

id objc_msgSend_vertexShaderKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vertexShaderKey");
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewController");
}

id objc_msgSend_warmupCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "warmupCount");
}

id objc_msgSend_wireframeLineColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wireframeLineColor");
}

id objc_msgSend_wireframeLineWidth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wireframeLineWidth");
}
